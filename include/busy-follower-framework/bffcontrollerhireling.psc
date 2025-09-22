Scriptname BFFControllerHireling extends Quest
{Controls all major functions for hirelings.}


;====================
;Import Functions
;====================

Import Debug
Import Game


;====================
;Import Scripts
;====================

BFFMainController Property modFunctions Auto
{The script for all common functions used in the mod.}


;====================
;Properties
;====================

FormList Property BFFFormCurrentHirelings Auto
{The form list containing all current hirelings.}
FormList Property BFFHirelingGlobals Auto
{A list of globals for hireling rehire values.}

GlobalVariable Property BFFGlobalCountHirelings Auto
{The global that determines how many hirelings are following.}
GlobalVariable Property GameDaysPassed Auto
{The global for game days passed.}
GlobalVariable Property HirelingGold Auto
{The global that determines the cost of hirelings.}
GlobalVariable Property CanReHireGV Auto
{The global that determines if a hireling can be rehired for free.}

Int[] Property speedMults Auto
{The array that stores the speed multiplier for each hireling.}

ObjectReference Property PlayerREF Auto
{The reference for the player.}

Quest Property BFFDialogueHirelings Auto
{The quest that holds the aliases and functions for hirelings.}

ReferenceAlias[] Property hirelingAliases Auto
{The array containing all hireling aliases.}


;====================
;Main Functions
;====================

;Check through the hireling alias list until one of them is empty and fill it with the defined hireling reference, proceeding to set the hireling as active.
Function hirelingFollow(Actor hirelingRef)

	String baseName = hirelingRef.GetBaseObject().GetName()
	ReferenceAlias hirelingAlias
	Int iIndex = 0
	Int hirelingIdentifier

	;Check through the hireling aliases and fill the first available alias.
	While hirelingAlias == None
		If hirelingAliases[iIndex].GetRef() == None
			hirelingAliases[iIndex].ForceRefTo(hirelingRef)
			hirelingAlias = hirelingAliases[iIndex]
			hirelingIdentifier = iIndex
		EndIf
		iIndex+=1
	EndWhile

	showTutorial(21)
	hirelingRef.SetRelationshipRank(GetPlayer(), 3)
	hirelingRef.SetPlayerTeammate()
	BFFFormCurrentHirelings.AddForm(hirelingRef)
	setTracking(BFFDialogueHirelings, hirelingIdentifier)
	BFFGlobalCountHirelings.Mod(1)
	stateMessage(baseName, "is following you.")
	hirelingRef.setActorValue("Confidence", 4)
	hirelingRef.getActorBase().setEssential()

	hirelingRef.evaluatePackage()

	logReport("BFF - New Hireling Count: " + BFFGlobalCountHirelings.Value)

EndFunction


;Removes the relevant amount of gold from the player and calls for the hireling to start following.
Function hirelingHire(Actor hirelingRef)

	hirelingFollow(hirelingRef)
	PlayerREF.RemoveItem(Game.GetForm(0xf), HirelingGold.Value as Int)

	hirelingRef.evaluatePackage()

EndFunction


;Ammends the relevant hireling global and calls for the hireling to start following.
Function hirelingReHire(Actor hirelingRef)

	hirelingFollow(hirelingRef)
	CanRehireGV.Value=1

	hirelingRef.evaluatePackage()

EndFunction


;Set the defined hireling as a teammate and adjusts the wait state.
Function hirelingReFollow(Actor hirelingRef)

	String followerName = hirelingRef.GetBaseObject().GetName()

	hirelingRef.SetPlayerTeammate()
	hirelingRef.setActorValue("WaitingForPlayer", 0)
	stateMessage(followerName, "is following you.")

	hirelingRef.evaluatePackage()

EndFunction


;Set the defined hireling as waiting and register for a single update to check if they are still waiting after a specified time.
Function hirelingWait(Actor hirelingRef)

	ReferenceAlias hirelingAlias = getFollower(hirelingRef)
	Int hirelingIdentifier = hirelingAlias.GetID()
	String hirelingName = hirelingRef.GetBaseObject().GetName()

	showTutorial(22)
	hirelingRef.setActorValue("WaitingForPlayer", 1)
	hirelingAlias.RegisterForUpdateGameTime(modFunctions.settingsGlobals[7].Value)
	stateMessage(hirelingName, "will wait here.")

	hirelingRef.evaluatePackage()

EndFunction


;Send the defined hireling back to their point of origin and adusts the relevant counts.
Function hirelingDismiss(Actor hirelingRef, Int hirelingTag = 100, Bool isDead = False)

	ReferenceAlias hirelingAlias = getFollower(hirelingRef)
	Int hirelingIdentifier = hirelingAlias.GetID()
	String hirelingName = hirelingRef.GetBaseObject().GetName()

	If !isDead
		showTutorial(23)
	EndIf

	hirelingRef.StopCombatAlarm()
	hirelingRef.SetPlayerTeammate(false, false)
	hirelingRef.setActorValue("WaitingForPlayer", 0)
	BFFFormCurrentHirelings.RemoveAddedForm(hirelingRef)

	If hirelingTag != 100
		(BFFHirelingGlobals.GetAt(hirelingTag) as GlobalVariable).SetValue(GameDaysPassed.Value +1)
	EndIf

	setTracking(BFFDialogueHirelings, hirelingIdentifier, false)
	BFFGlobalCountHirelings.Mod(-1)
	hirelingAlias.Clear()

	If !isDead
		Notification(hirelingName + " leaves your service.")
	Else
		Notification(hirelingName + " has died.")
	EndIf

	hirelingRef.evaluatePackage()
	
	logReport("BFF - Updated Hireling Count: " + BFFGlobalCountHirelings)

EndFunction


Function hirelingMove(Actor hirelingRef)

	ReferenceAlias hirelingAlias = getFollower(hirelingRef)

	hirelingRef.setActorValue("WaitingforPlayer", 10)
	hirelingAlias.RegisterForSingleUpdate(3.5)

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

	Return modFunctions.getFollower(followerRef, 3)

EndFunction