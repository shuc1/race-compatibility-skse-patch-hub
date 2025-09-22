Scriptname BFFControllerAnimal extends Quest
{Controls all major functions for animals.}


;====================
;Import Functions
;====================

Import Debug
Import Game
Import Utility


;====================
;Import Scripts
;====================

BFFMainController Property modFunctions Auto
{The script for all common functions used in the mod.}


;====================
;Properties
;====================

Armor Property SkinHuskyArmored Auto
{The armor skin item for Huskey armour.}
Armor Property BFFSkinHuskyArmoredBare Auto
{The armor skin item for Huskey armour without the armor.}

FormList Property BFFFormOwnedAnimals Auto
{The form list containing all current animal followers.}

GlobalVariable Property BFFGlobalCountAnimals Auto
{The global that determines how many animals are following.}
GlobalVariable Property AnimalGold Auto
{The global that determines the cost of animal followrs when buying them from a breeder.}

Int[] Property speedMults Auto
{The array that stores the speed multiplier for each animal.}

ObjectReference[] Property animalReferences Auto
{The array containing all home markers for animals.}
ObjectReference[] Property fetchContainers Auto
{The array containing all container references for where fetched items are stored by your animal.}
ObjectReference Property PlayerREF Auto
{The reference for the player.}

Quest Property BFFDialogueAnimal Auto
{The quest that holds the aliases and functions for animals.}

Race Property DLC1HuskyArmoredCompanionRace Auto
{One of the races for the huskey companions.}
Race Property DLC1HuskyBareCompanionRace Auto
{One of the races for the huskey companions.}

ReferenceAlias[] Property animalAliases Auto
{The array containing all animal aliases.}

Sound Property ITMClothingDown Auto
{The sound for changing outfits.}

String[] Property animalNames Auto
{The array containing all animal names for each alias.}


;====================
;Main Functions
;====================

;Removes the specified amount of gold from the player and calls for the animal to start following.
Function animalPurchase(Actor animalTrainer, Actor animalRef, Bool animalCost = True)

	logReport("BFF | Purchase Animal Initiated")

	If animalCost
		PlayerREF.RemoveItem(GetForm(0xf), AnimalGold.Value as Int)
	EndIf

	animalFollow(animalRef)

	animalRef.EvaluatePackage()

EndFunction


;Check through the animal alias list until one of them is empty and fill it with the defined animal reference, proceeding to set the animal as active.
Function animalFollow(Actor animalRef)

	Actor thePlayer = GetPlayer()
	String baseName = animalRef.GetBaseObject().GetName()
	ReferenceAlias animalAlias
	Int iIndex = 0
	Int animalIdentifier

	;Check through the animal aliases and fill the first available alias.
	While iIndex < animalAliases.Length && animalAlias == None
		If animalAliases[iIndex].GetRef() == None
			animalAliases[iIndex].ForceRefTo(animalRef)
			animalAlias = animalAliases[iIndex]
			animalIdentifier = iIndex
		EndIf
		iIndex+=1
	EndWhile

	showTutorial(11)
	animalRef.SetActorOwner(thePlayer.GetActorBase())
	animalRef.SetRelationshipRank(thePlayer, 3)
	animalRef.SetPlayerTeammate()
	animalRef.setActorValue("WaitingForPlayer", 0)
	animalRef.setActorValue("Confidence", 4)
	animalRef.getActorBase().setEssential()
	BFFFormOwnedAnimals.AddForm(animalRef)
	animalNames[animalIdentifier] = baseName
	SetTracking(BFFDialogueAnimal, animalIdentifier)
	animalRef.AllowPCDialogue(True)
	BFFGlobalCountAnimals.Mod(1)
	stateMessage(baseName, "is following you.")
	logReport("BFF | New Animal Count: " + BFFGlobalCountAnimals.Value)
	modFunctions.sendIdle(GetPlayer(), "IdleComeThisWay")

	animalRef.EvaluatePackage()

EndFunction


;Set the defined animal as a teammate and adjusts the wait state.
Function animalReFollow(Actor animalRef)

	ReferenceAlias animalAlias = getFollower(animalRef)
	Int animalIdentifier = animalAlias.GetID()
	String animalName = animalNames[animalIdentifier]

	animalRef.SetPlayerTeammate()
	animalRef.setActorValue("WaitingForPlayer", 0)
	stateMessage(animalName, "is following you.")
	modFunctions.sendIdle(GetPlayer(), "IdleComeThisWay")

	animalRef.EvaluatePackage()

EndFunction


;Set the defined animal as waiting and register for a single update to check if they are still waiting after a specified time.
Function animalWait(Actor animalRef)

	ReferenceAlias animalAlias = getFollower(animalRef)
	Int animalIdentifier = animalAlias.GetID()
	String animalName = animalNames[animalIdentifier]

	showTutorial(12)
	animalRef.setActorValue("WaitingForPlayer", 1)
	animalAlias.RegisterForSingleUpdateGameTime(modFunctions.settingsGlobals[7].Value)
	stateMessage(animalName, "will wait here.")
	modFunctions.sendIdle(GetPlayer(), "IdlePointClose")

	animalRef.EvaluatePackage()

EndFunction


;Send the defined animal back home, changing their teammate state and adjust the relevant counts.
Function animalHome(Actor animalRef)

	ReferenceAlias animalAlias = getFollower(animalRef)
	Int animalIdentifier = animalAlias.GetID()
	String animalName = animalNames[animalIdentifier]
	String homeName = animalReferences[animalIdentifier].GetCurrentLocation().GetName()

	showTutorial(13)
	animalRef.StopCombatAlarm()
	animalRef.SetPlayerTeammate(false)
	animalRef.setActorValue("WaitingForPlayer", 2)
	
	If homeName == ""
		stateMessage(animalName, "is heading home.")
	ElseIf homeName == "BFF Test Cell"
		stateMessage(animalName, "will remain here for now.")
	Else
		stateMessage(animalName, "is heading back to " + homeName)
	EndIf

	;Is the animal a huskey?
	If animalRef.GetRace() == DLC1HuskyArmoredCompanionRace || animalRef.GetRace() == DLC1HuskyBareCompanionRace
		;If the dog enters a player home and automatic outfits are enabled, change their outfit to bare.
		If modFunctions.featuresGlobals[8].Value == 2
			animalRef.EquipItem(BFFSkinHuskyArmoredBare, False, True)
		EndIf
	EndIf

	modFunctions.sendIdle(GetPlayer(), "IdlePointFar_01")

	animalRef.EvaluatePackage()

EndFunction


;Send the defined aniaml back to their point of origin and adjusts the relevant counts.
Function animalDismiss(Actor animalRef, Bool isDead = False)

	ReferenceAlias animalAlias = getFollower(animalRef)
	Int animalIdentifier = animalAlias.GetID()
	String animalName = animalNames[animalIdentifier]

	If !isDead
		showTutorial(14)
	EndIf

	animalRef.StopCombatAlarm()
	animalRef.SetPlayerTeammate(false, false)
	animalRef.setActorValue("Aggression", 0)
	animalRef.setActorValue("WaitingForPlayer", 0)
	BFFFormOwnedAnimals.RemoveAddedForm(animalRef)
	setTracking(BFFDialogueAnimal, animalIdentifier, false)
	BFFGlobalCountAnimals.Mod(-1)

	If !AnimalName == ""
		If !isDead
			Notification(AnimalName + " leaves.")
		Else
			Notification(animalName + " has died")
		EndIf
	Else
		If !isDead
			Notification(animalName + " leaves.")
		Else
			Notification(animalRef.GetRace().GetName() + " has died")
		EndIf
	EndIf

	logReport("BFF | Updated Animal Count: " + BFFGlobalCountAnimals.Value)
	modFunctions.sendIdle(GetPlayer(), "IdlePointFar_02")

	animalRef.EvaluatePackage()
	
	animalAlias.Clear()

EndFunction


;Assign the defined animal a task to complete, changing their wait state for AI Packages to detect.
Function animalCommand(Actor animalRef, Int dogCommand)

	;Command Types: 3 = Ammo | 4 = Food or Potions | 5 = Ingredients | 6 = Keys | 7 = Lockpick | 8 = Weapon

	showTutorial(15)
	animalRef.setActorValue("WaitingForPlayer", dogCommand)
	modFunctions.sendIdle(GetPlayer(), "IdlePointFar_01")
	animalRef.EvaluatePackage()

EndFunction


;Move the defined animal's home location marker to the player or back to its origin.
Function animalLocation(Actor animalRef, Bool newPlacement = True)

	ReferenceAlias animalAlias = getFollower(animalRef)
	Int animalIdentifier = animalAlias.GetID()
	String animalName = animalNames[animalIdentifier]
	ObjectReference homeMarker = animalReferences[animalIdentifier]

	showTutorial(13)

	;Moves the defined object reference marker to the player or back to its origin.
	If newPlacement
		animalReferences[animalIdentifier].MoveTo(PlayerREF, 0, 0, 0)
		logReport("BFF | Marker Moved")
	Else
		animalReferences[animalIdentifier].MoveToMyEditorLocation()
		logReport("BFF | Marker Returned")
	EndIf

	String homeName = homeMarker.GetCurrentLocation().GetName()

	;If the marker is being placed in a fresh location, display a notification for the player.
	If newPlacement
		;Display a notification stating the new home of your animal, checking if it has a name first.
		If homeName == ""
			Notification(animalName + " has made this place their new home.")
		Else
			Notification(animalName + " has made " + homeName + " their new home.")
		EndIf
	EndIf
	modFunctions.sendIdle(GetPlayer(), "IdleGreybeardWordTeach")
	animalRef.EvaluatePackage()

EndFunction


;Displays a text entry field and then changs the name of the follower to the defined text string, additionally storing the value in the relevant string array.
Function animalRename(Actor animalRef)

	showTutorial(8)
	Wait(0.05)

	String baseName = animalRef.getBaseObject().GetName()
	ReferenceAlias animalAlias = getFollower(animalRef)
	Int animalIdentifier = animalAlias.GetID()
	uiMenuBase nameMenu = uiExtensions.getMenu("UITextEntryMenu", true)
	
	;Display the tutorial message first.
	showTutorial(8)
	Wait(0.05)

	;Display the renaming menu to enter the new name of the follower.
	nameMenu.openMenu(none, none)

	String newName = nameMenu.GetResultString()

	;Changes the animal's name if text has been entered and uses fame to determine if they have receieved their first name change.
	If newName == ""
		Notification("Name Not Changed")
	Else
		animalnames[animalIdentifier] = newName
		animalRef.GetBaseObject().SetName(newName)
		modFunctions.sendIdle(GetPlayer(), "IdleGreybeardWordTeach")
	EndIf

EndFunction


;Equips the defined animal with the specified outfit.
Function animalOutfit(Actor animalRef)

	;Skips the equipping fade and sound effect if not being triggered by the dialogue.
	showTutorial(17)
	FadeOutGame(false, true, 2, 1)
	ITMClothingDown.Play(GetPlayer())

	;Checks the equipped skin armour and equips the opposite.
	If animalRef.IsEquipped(SkinHuskyArmored)
		animalRef.RemoveItem(SkinHuskyArmored, 1, true)
		animalRef.EquipItem(BFFSkinHuskyArmoredBare, False, True)
	ElseIf animalRef.IsEquipped(BFFSkinHuskyArmoredBare)
		animalRef.RemoveItem(BFFSkinHuskyArmoredBare, 1, true)
		animalRef.EquipItem(SkinHuskyArmored, False, True)
	Else
		animalRef.EquipItem(BFFSkinHuskyArmoredBare, False, True)
	EndIf

	modFunctions.sendIdle(animalRef, "NPCDogIdleShake")

EndFunction


;Checks items added to the animal's fetch container and feeds back the relevant notification on-screen.
Function animalItemsCheck(Int animalidentifier)

	String animalName = animalNames[animalIdentifier]
	ObjectReference animalContainer = fetchContainers[animalidentifier]

	If fetchContainers[animalidentifier].GetNumItems() <= 0
		Notification(animalName + " didn't find anything.")
	Else
		animalContainer.RemoveAllItems(PlayerREF, true, false)
	EndIf

EndFunction


;=========================
;Extension Functions
;=========================

Function showTutorial(Int tutorialIndex)

	modFunctions.showTutorial(tutorialIndex)

EndFunction

Function logReport(String logText)

	modFunctions.logReport(logText)

EndFunction

Function stateMessage(String followerName, String messageSuffix)

	modFunctions.stateMessage(followerName, messageSuffix)

EndFunction

Function setTracking(Quest trackerQuest, Int followerIdentifier, Bool setActive = True)

	modFunctions.setTracking(trackerQuest, followerIdentifier, setActive)

EndFunction

ReferenceAlias Function getFollower(Actor followerRef)

	Return modFunctions.getFollower(followerRef, 10)

EndFunction