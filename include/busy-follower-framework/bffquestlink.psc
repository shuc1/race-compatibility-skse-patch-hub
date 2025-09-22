Scriptname BFFQuestLink extends Quest
{Performs various functions for followers related to vanilla quests.}

;====================
;Import Scripts
;====================

BFFMainController Property modFunctions Auto
{The script for all common functions used in the mod.}
BFFControllerFollower Property followerFunctions Auto
{The script that controls the standard functions for followers.}
BFFControllerHireling Property hirelingFunctions Auto
{The script that controls the standard functions for followers.}
BFFControllerAnimal Property animalFunctions Auto
{The script that controls the standard functions for animals.}

;====================
;Properties
;====================

FormList Property BFFFormCurrentFollowers Auto
{The form list containing all current followers.}
FormList Property BFFFormCurrentHirelings Auto
{The form list containing all current hirelings.}
FormList Property BFFFormOwnedAnimals Auto
{The form list containing all current followers.}

GlobalVariable Property BFFGlobalCountFollowers Auto
{The global that determines how many followers are following.}
GlobalVariable Property BFFGlobalCountHirelings Auto
{The global that determines how many hirelings are following.}
GlobalVariable Property BFFGlobalCountAnimals Auto
{The global that determines how many animals are following.}


;Check through your current followers and move them to a specified marker.
Function moveFollowers(ObjectReference followerMarker = None, ObjectReference animalMarker = None, Int tweakAI = 0)

	;Tweak AI: 0 - Don't do  |  1 - Enable  |  2 - Disable

	;Are there any followers currently following?
	If BFFGlobalCountFollowers.Value > 0

		Int iIndex = 0

		While iIndex < BFFFormCurrentFollowers.GetSize()

			Actor nextFollower = BFFFormCurrentFollowers.GetAt(iIndex) as Actor

			;Is the alias filled?
			If nextFollower != None

				Float waitState = nextFollower.GetActorValue("WaitingForPlayer")

				;Is the follower following the player or waiting?
				If waitState != 2

					If tweakAI == 1
						nextFollower.enableAI(true)
					ElseIf tweakAI == 2
						nextFollower.enableAI(false)
					EndIf
					
					nextFollower.MoveTo(followerMarker)

				EndIf
			EndIf

			iIndex+=1

		EndWhile

	EndIf

	;Are there any hirelings currently following?
	If BFFGlobalCountHirelings.Value > 0

		Int iIndex = 0

		;Hirelings Check
		While iIndex < BFFFormCurrentHirelings.GetSize()

			Actor nextHireling = BFFFormCurrentHirelings.GetAt(iIndex) as Actor

			;Is the alias filled?
			If nextHireling != None

				Float waitState = nextHireling.GetActorValue("WaitingForPlayer")

				;Is the follower following the player or waiting?
				If waitState != 2

					If tweakAI == 1
						nextHireling.enableAI(true)
					ElseIf tweakAI == 2
						nextHireling.enableAI(false)
					EndIf

					nextHireling.MoveTo(followerMarker)

				EndIf
			EndIf

			iIndex+=1

		EndWhile

	EndIf

	;Are there any animals currently following?
	If BFFGlobalCountAnimals.Value > 0

		Int iIndex = 0

		;Hirelings Check
		While iIndex < BFFFormOwnedAnimals.GetSize()

			Actor nextAnimal = BFFFormOwnedAnimals.GetAt(iIndex) as Actor

			;Is the alias filled?
			If nextAnimal != None

				Float waitState = nextAnimal.GetActorValue("WaitingForPlayer")

				;Is the follower following the player or waiting?
				If waitState != 2

					If tweakAI == 1
						nextAnimal.enableAI(true)
					ElseIf tweakAI == 2
						nextAnimal.enableAI(false)
					EndIf

					nextAnimal.MoveTo(animalMarker)

				EndIf
			EndIf

			iIndex+=1

		EndWhile

	EndIf

EndFunction


;Check through your current followers and dismiss them, with the exception of Serana.
Function seranaOnly(ReferenceAlias seranaAlias)

	;Are there any followers currently following?
	If BFFGlobalCountFollowers.Value > 0

		Int iIndex = 0

		While iIndex < BFFFormCurrentFollowers.GetSize()

			Actor nextFollower = BFFFormCurrentFollowers.GetAt(iIndex) as Actor

			;Is the alias filled?
			If nextFollower != None

				Float waitState = nextFollower.GetActorValue("WaitingForPlayer")

				;Is the follower following the player or waiting?
				If waitState != 2
					If modFunctions.getFollower(nextFollower) != seranaAlias
						followerFunctions.followerHome(nextFollower)
					EndIf
				EndIf

			EndIf

			iIndex+=1

		EndWhile

	EndIf

	;Are there any hirelings currently following?
	If BFFGlobalCountHirelings.Value > 0

		Int iIndex = 0

		;Hirelings Check
		While iIndex < BFFFormCurrentHirelings.GetSize()

			Actor nextHireling = BFFFormCurrentHirelings.GetAt(iIndex) as Actor

			;Is the alias filled?
			If nextHireling != None

				Float waitState = nextHireling.GetActorValue("WaitingForPlayer")

				;Is the follower following the player or waiting?
				If waitState != 2
					HirelingFunctions.hirelingDismiss(nextHireling)
				EndIf

			EndIf

			iIndex+=1

		EndWhile

	EndIf

EndFunction


;Check through your current followers and force stop their combat.
Function forceStopCombat()

	;Are there any followers currently following?
	If BFFGlobalCountFollowers.Value > 0

		Int iIndex = 0

		While iIndex < BFFFormCurrentFollowers.GetSize()

			Actor nextFollower = BFFFormCurrentFollowers.GetAt(iIndex) as Actor

			;Is the alias filled?
			If nextFollower != None

				Float waitState = nextFollower.GetActorValue("WaitingForPlayer")

				;Is the follower following the player or waiting?
				If waitState != 2
					nextFollower.StopCombat()
				EndIf
			EndIf

			iIndex+=1

		EndWhile

	EndIf

	;Are there any hirelings currently following?
	If BFFGlobalCountHirelings.Value > 0

		Int iIndex = 0

		;Hirelings Check
		While iIndex < BFFFormCurrentHirelings.GetSize()

			Actor nextHireling = BFFFormCurrentHirelings.GetAt(iIndex) as Actor

			;Is the alias filled?
			If nextHireling != None

				Float waitState = nextHireling.GetActorValue("WaitingForPlayer")

				;Is the follower following the player or waiting?
				If waitState != 2
					nextHireling.StopCombat()
				EndIf
			EndIf

			iIndex+=1

		EndWhile

	EndIf

	;Are there any animals currently following?
	If BFFGlobalCountAnimals.Value > 0

		Int iIndex = 0

		;Hirelings Check
		While iIndex < BFFFormOwnedAnimals.GetSize()

			Actor nextAnimal = BFFFormOwnedAnimals.GetAt(iIndex) as Actor

			;Is the alias filled?
			If nextAnimal != None

				Float waitState = nextAnimal.GetActorValue("WaitingForPlayer")

				;Is the follower following the player or waiting?
				If waitState != 2
					nextAnimal.StopCombat()
				EndIf
			EndIf

			iIndex+=1

		EndWhile

	EndIf

EndFunction


;Check through your current followers and send them home.
Function companionsDismissal(Bool isSpouse = False)

	Debug.Notification("Your current followers head home for this task.")

	;Are there any followers currently following?
	If BFFGlobalCountFollowers.Value > 0

		Int iIndex = 0

		While iIndex < BFFFormCurrentFollowers.GetSize()

			Actor nextFollower = BFFFormCurrentFollowers.GetAt(iIndex) as Actor

			;Is the alias filled?
			If nextFollower != None

				Float waitState = nextFollower.GetActorValue("WaitingForPlayer")

				;Is the follower following the player or waiting?
				If waitState != 2
					followerFunctions.followerHome(nextFollower)
				EndIf
			EndIf

			iIndex+=1

		EndWhile

	EndIf

	;Are there any hirelings currently following?
	If BFFGlobalCountHirelings.Value > 0

		Int iIndex = 0

		;Hirelings Check
		While iIndex < BFFFormCurrentHirelings.GetSize()

			Actor nextHireling = BFFFormCurrentHirelings.GetAt(iIndex) as Actor

			;Is the alias filled?
			If nextHireling != None

				Float waitState = nextHireling.GetActorValue("WaitingForPlayer")

				;Is the follower following the player or waiting?
				If waitState != 2
					hirelingFunctions.hirelingDismiss(nextHireling)
				EndIf
			EndIf

			iIndex+=1

		EndWhile

	EndIf

	;Are there any animals currently following?
	If BFFGlobalCountAnimals.Value > 0

		Int iIndex = 0

		;Hirelings Check
		While iIndex < BFFFormOwnedAnimals.GetSize()

			Actor nextAnimal = BFFFormOwnedAnimals.GetAt(iIndex) as Actor

			;Is the alias filled?
			If nextAnimal != None

				Float waitState = nextAnimal.GetActorValue("WaitingForPlayer")

				;Is the follower following the player or waiting?
				If waitState != 2
					animalFunctions.animalHome(nextAnimal)
				EndIf
			EndIf

			iIndex+=1

		EndWhile

	EndIf

EndFunction


;Check through your current followers and locate your spouse to dismiss them.
Function dismissAlias(ReferenceAlias spouseRef, Int dismissMessage = 0)

	;Are there any followers currently following?
	If BFFGlobalCountFollowers.Value > 0

		Int iIndex = 0

		While iIndex < BFFFormCurrentFollowers.GetSize()

			Actor nextFollower = BFFFormCurrentFollowers.GetAt(iIndex) as Actor

			;Is the alias filled?
			If nextFollower != None

				Float waitState = nextFollower.GetActorValue("WaitingForPlayer")

				;Is the follower following the player or waiting?
				If waitState != 2
					If modFunctions.getFollower(nextFollower) == spouseRef
						followerFunctions.followerDismiss(nextFollower)
					EndIf
				EndIf
			EndIf

			iIndex+=1

		EndWhile

	EndIf


	;Are there any hirelings currently following?
	If BFFGlobalCountHirelings.Value > 0

		Int iIndex = 0

		While iIndex < BFFFormCurrentHirelings.GetSize()

			Actor nextHireling = BFFFormCurrentHirelings.GetAt(iIndex) as Actor

			;Is the alias filled?
			If nextHireling != None

				Float waitState = nextHireling.GetActorValue("WaitingForPlayer")

				;Is the follower following the player or waiting?
				If waitState != 2
					If modFunctions.getFollower(nextHireling, 3) == spouseRef
						hirelingFunctions.hirelingDismiss(nextHireling)
					EndIf
				EndIf
			EndIf

			iIndex+=1

		EndWhile

	EndIf

EndFunction