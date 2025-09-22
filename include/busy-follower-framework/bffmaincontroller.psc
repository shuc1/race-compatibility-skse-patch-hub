Scriptname BFFMainController extends Quest  
{Contains all stored data for the mod alongside shared functions.}


;====================
;Import Functions
;====================

Import Debug
Import Utility


;====================
;Shared Properties
;====================

Bool[] Property tutorialBools Auto
{The array containing all bools that determine if the indexed tutorial has already been displayed.

Default = All False}

FormList Property BFFRestrictedLocs Auto
{The formlist that holds all of the locations that followers cannot follow.}

GlobalVariable[] Property featuresGlobals Auto
{The array containing all globals for tracking enabled features.}
GlobalVariable[] Property settingsGlobals Auto
{The array containering all globals for tracking stored settings.}

Keyword[] Property locationTypes Auto
{The array of all location types detected by automatic outfit changing.}

Message[] Property tutorialMessages Auto
{The array containing all tutorial messages displayed to the player.}

String[] Property dismissalMessages Auto
{The array containing all dismissal message suffixes.}


;=========================
;Utility Functions
;=========================

;Check if tutorials are enabled and show the defined tutorial if it's not been displayed previously.
Function showTutorial(Int tutorialIndex)

	If featuresGlobals[0].Value == 1
		If tutorialBools[tutorialIndex] == False
			tutorialMessages[tutorialIndex].Show()
			tutorialBools[tutorialIndex] = True
		EndIf
	EndIf

EndFunction


;Check if debug notification and trace logs are enabled then display and log the defined notification.
Function logReport(String logText)

	If settingsGlobals[17].Value == 1
		Trace(logText)
	EndIf

	If settingsGlobals[18].Value == 1
		Notification(logText)
	EndIf

EndFunction


;Check if notifications are enabled and display the follower's name along with the defined suffix as a notification.
Function stateMessage(String followerName, String messageSuffix)

	If featuresGlobals[1].Value == 1
		If !followerName == ""
			Notification(followerName + " " + messageSuffix)
		Else
			Notification("Follower" + " " + messageSuffix)
		EndIf
	EndIf

EndFunction


;=========================
;Fetch Data Functions
;=========================

;Cycles through each alias the defined actor is attached to and returns the reference alias for one that has the BFFAliasCheck script attached.
ReferenceAlias Function getFollower(Actor followerRef, Int followerLimit = 25)

	BFFAliasCheck aliasCheck
	ReferenceAlias followerAlias
	Int iIndex = 0

	While aliasCheck == None && iIndex < followerLimit
		followerAlias = followerRef.GetNthReferenceAlias(iIndex)
		aliasCheck = followerAlias as BFFAliasCheck
		If aliasCheck == None
			iIndex += 1
		EndIf
	EndWhile

	Return followerAlias

EndFunction


;=========================
;Shared Functions
;=========================

;Force the inventory menu open for your follower and provide an update for their current carry weight.
Function showInventory(Actor followerRef, Bool isAnimal = False)

	Int followerLimit

	If isAnimal
		followerLimit = 10
	Else
		followerLimit = 25
	EndIf

	ReferenceAlias followerAlias = getFollower(followerRef, followerLimit)
	Int followerIdentifier = followerAlias.GetID()
	String followerName = followerRef.GetBaseObject().GetName()
	
	;Temporarily disables the teammate flag, preventing followers from equipping items handed to them if Outfit Management is enabled.
	If featuresGlobals[8].Value >= 1
		followerRef.SetPlayerTeammate(false, false)
	EndIf

	showTutorial(5)

	;Sets the carryweight based on follower type.
	If isAnimal
		followerRef.SetAV("CarryWeight", settingsGlobals[10].Value)
	Else
		followerRef.SetAV("CarryWeight", settingsGlobals[9].Value)
	EndIf

	Wait(0.05)
	followerRef.OpenInventory(True)

	;;If Notifications are enabled, display the follower's current carry weight when opening and closing the inventory menu.
	If featuresGlobals[2].Value == 1

		Notification(followerName + " is carrying " + followerRef.GetTotalItemWeight() as Int + " lbs" + " / " + followerRef.GetAV("CarryWeight") as Int + " lbs")
		
		While IsInMenuMode()
			;Do Nothing
		EndWhile

		Notification(followerName + " is carrying " + followerRef.GetTotalItemWeight() as Int + " lbs" + " / " + followerRef.GetAV("CarryWeight") as Int + " lbs")
	
	EndIf

	;Wait until the player is out of menu mode before re-enabling the player teammate flag for normal follower actions to resume.
	While IsInMenuMode()
		;Do Nothing
	EndWhile
	
	followerRef.SetPlayerTeammate()

EndFunction


;Check if tracking is enabled and display or hide the defined objective for tracking followers on the map.
Function setTracking(Quest trackerQuest, Int folllowerIdentifier, Bool setActive = True)

	If featuresGlobals[3].Value == 1
		If setActive
			trackerQuest.SetObjectiveDisplayed(folllowerIdentifier)
		Else
			trackerQuest.SetObjectiveDisplayed(folllowerIdentifier, False)
		EndIf
	EndIf

EndFunction


;If idles are enable, perform the requested idle animation.
Function sendIdle(Actor followerRef, String idleAnimation)

	;Are idles enabled?
	If featuresGlobals[16].Value == 1
		If Game.GetCameraState() == 0
			Game.ForceThirdPerson()
		EndIf
		SendAnimationEvent(followerRef, idleAnimation)
	EndIf

EndFunction