Scriptname BFFControllerFollower extends Quest
{Controls all major functions for followers.}


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

;Outfit Forms
FormList[] Property travellerOutfits Auto
{The array containing form lists of each follower's traveller outfit items.}
FormList[] Property casualOutfits Auto
{The array containing form lists of each follower's casual outfit items.}
FormList[] Property workOutfits Auto
{The array containing form lists of each follower's work outfit items.}
FormList[] Property sleepOutfits Auto
{The array containing form lists of each follower's sleep outfit items.}
FormList[] Property defaultOutfits Auto
{The array holding the default outfits of each follower.}

;Misc
FormList Property CombatList Auto
{The list of combat styles to apply to your follower.}
FormList Property BFFFormCurrentFollowers Auto
{The form list containing all current followers.}
FormList Property storeLocations Auto
{The form list containing all stores followers can trade at when asked.}
FormList Property choppingBlocks Auto
{The form list that contains all chopping blocks for the firewood favor.}

GlobalVariable Property GameHour Auto
{The global that dtermines the current time in-game.}
GlobalVariable Property BFFGlobalCountFollowers Auto
{The global that determines how many followers are following.}
GlobalVariable Property BFFGlobalCountHome Auto
{The global that determines how many followers are following.}
GlobalVariable Property BFFGlobalOutfitEditDetect Auto
{The global that determines if the outfit being edited is currently being worn by the follower.}

Int[] Property currentOutfits Auto
{The array containing integers that tracks which outfit each follower is wearing.}
Int[] Property lastOutfits Auto
{The array containing integers that track which outfit each follower last wore.}
Int[] Property sellCounts Auto
{The array storing ints for how much gold each follower is making from their visit to the local store.}
Int[] Property speedMults Auto
{The array that stores the speed multiplier for each follower.}
Int Property iFollowerDismiss Auto
{The int that allows the follower to speak the dismissal line of dialogue.}

MiscObject Property BFFFollowerBelongings Auto
{The misc object for the knapsack holding dismissed follower belongings.}

;Location References
ObjectReference[] Property homeReferences Auto
{The array containing all home markers for followers.}
ObjectReference[] Property workReferences Auto
{The array containing all work markers for followers.}
ObjectReference[] Property sleepReferences Auto
{The array containing all sleep markers for followers.}

;Outfit Containers
ObjectReference[] Property travellerContainers Auto
{The array containing the container references for each follower's traveller outfit.}
ObjectReference[] Property casualContainers Auto
{The array containing the container references for each follower's casual outfit.}
ObjectReference[] Property workContainers Auto
{The array containing the container references for each follower's work outfit.}
ObjectReference[] Property sleepContainers Auto
{The array containing the container references for each follower's sleep outfit.}
ObjectReference[] Property transferContainers Auto
{The containers used for unequipping items from followers without them getting naken by doing a temp trasfer into the container and out again.}

;Misc Containers
ObjectReference[] Property favorContainers Auto
{The array containing all container references for where favor-related items are stored.}
ObjectReference[] Property storeContainers Auto
{The array containing all container references for where currently sold items sit.}

;Misc
ObjectReference[] Property storeMarkers Auto
{The array containing all references for where each follower will be selling goods.}
ObjectReference Property BFFRefBelongings Auto
{The reference for the container that holds all currently held belongings from followers.}
ObjectReference Property PlayerREF Auto
{The reference for the player.}

Quest Property BFFDialogueFollower Auto
{The quest that holds the aliases and functions for followers.}

ReferenceAlias[] Property followerAliases Auto
{The array containing all follower aliases.}
ReferenceAlias Property bladesAlias Auto
{The alias that dertemines the current folower to be assigned to the Blades.}

Spell Property BFFSpellTauntEffect Auto
{The spell cast on followers to initiate taunts during battle.}

String[] Property followerNames Auto
{The array containing all follower names for each alias.}

Topic Property cannotDo Auto
{The topic to say when something cannot be done.}
Topic Property canDo Auto
{The topic to say when something can be done.}


;=========================
;Main Functions
;=========================

;Check through the follower alias list until one of them is empty and fill it with the defined follower reference, proceeding to set the follower as active.
Function followerFollow(Actor followerRef)

	Actor thePlayer = getPlayer()
	String baseName = followerRef.getBaseObject().getName()
	ReferenceAlias followerAlias

	Int iIndex = 0
	Int followerIdentifier

	;Cycle through the follower aliases and fill the first available empty follower alias.
	While iIndex < followerAliases.Length && followerAlias == None
		If followerAliases[iIndex].getRef() == None
			followerAliases[iIndex].forceRefTo(followerRef)
			followerAlias = followerAliases[iIndex]
			followerIdentifier = iIndex
		EndIf
		iIndex+=1
	EndWhile

	showTutorial(0)

	;Set values to make the new follower an ally.
	followerRef.setRelationshipRank(thePlayer, 3)
	followerRef.setPlayerTeammate()
	followerRef.setActorValue("WaitingforPlayer", 0)
	followerRef.setActorValue("Confidence", 4)
	followerRef.getActorBase().setEssential()
	BFFFormCurrentFollowers.addForm(followerRef)
	followerNames[followerIdentifier] = baseName
	BFFGlobalCountFollowers.Mod(1)

	;Outfit defaults and tracking.
	defaultOutfits[followerIdentifier].addForm(followerRef.getActorBase().getOutfit())
	setTracking(BFFDialogueFollower, followerIdentifier)

	;Check if StealthAI is enabled and if so, trigger it on the follower.
	followerAlias.RegisterForSingleUpdate(modFunctions.settingsGlobals[6].Value)
	
	;Display notifications and debug feedback.
	stateMessage(baseName, "is following you.")
	logReport("BFF - New Follower Count: " + BFFGlobalCountFollowers.Value)
	
EndFunction


;Set the defined follower as a teammate and adjusts the wait state.
Function followerReFollow(Actor followerRef)

	ReferenceAlias followerAlias = getFollower(followerRef)
	Int followerIdentifier = followerAlias.getID()
	String followerName = followerNames[followerIdentifier]

	;If the follower is waiting at home, reduce the home count.
	If followerRef.getActorValue("WaitingForPlayer") == 2
		BFFGlobalCountHome.Mod(-1)
		logReport("BFF - New Home Count: " + BFFGlobalCountHome.Value)
	EndIf

	;Set values to make the defined folllower an ally.
	followerRef.setPlayerTeammate()
	followerRef.setActorValue("WaitingForPlayer", 0)

	;Equip outfit if the feature is active.
	If modFunctions.featuresGlobals[8].Value == 2
		wearOutfit(followerRef, 1, False)
		modFunctions.sendIdle(followerRef, "IdleWarmArms")
	EndIf

	;Check if StealthAI is enabled and if so, trigger it on the follower.
	followerAlias.RegisterForSingleUpdate(modFunctions.settingsGlobals[6].Value)

	;Display notifications and debug feedback.
	stateMessage(followerName, "is following you.")

EndFunction


;Set the defined follower as waiting and register for a single update to check if they are still waiting after a specified time.
Function followerWait(Actor followerRef)

	ReferenceAlias followerAlias = getFollower(followerRef)
	Int followerIdentifier = followerAlias.getID()
	String followerName = followerNames[followerIdentifier]
	Int waitTime = modFunctions.settingsGlobals[7].Value as Int

	showTutorial(1)

	;Trigger a register for update whilst setting the relevant value for waiting.
	followerRef.setActorValue("WaitingForPlayer", 1)
	followerAlias.RegisterForUpdateGameTime(waitTime)

	;Display notifications and debug feedback.
	stateMessage(followerName, "will wait here.")
	logReport("BFF - Wait Time: " + waitTime)

EndFunction


;Send the defined follower back home, changing their teammate state and adjust the relevant counts.
Function followerHome(Actor followerRef)

	ReferenceAlias followerAlias = getFollower(followerRef)
	Int followerIdentifier = followerAlias.getID()
	String followerName = followerNames[followerIdentifier]
	String homeName = homeReferences[followerIdentifier].getCurrentLocation().getName()

	showTutorial(2)

	;Stop combat and set values to make the follower head home.
	followerRef.stopCombatAlarm()
	followerRef.setPlayerTeammate(false, false)
	followerRef.setActorValue("WaitingForPlayer", 2)
	BFFGlobalCountHome.Mod(1)
	logReport("BFF - New Home Count: " + BFFGlobalCountHome.Value)

	;Check if the follower has a home or not and display the relevant return home notification.
	If homeName == "" || homeName == "BFF Test Cell"
		stateMessage(followerName, "is heading back home.")
	Else
		stateMessage(followerName, "is heading back to " + homeName)
	EndIf

	;Unregister any updates as this covers both Stealth AI and moving out of the player's way.
	followerAlias.UnregisterForUpdate()

	followerRef.EvaluatePackage()

EndFunction


;Send the defined follower back to their point of origin, handing back to the player any items in their assigned outfits and adjusts the relevant counts.
Function followerDismiss(Actor followerRef, Int dismissMessage = 0, Int sayLine = 0, Bool isDead = False)

	ReferenceAlias followerAlias = getFollower(followerRef)
	Int followerIdentifier = followerAlias.getID()
	String followerName = followerNames[followerIdentifier]
	Outfit currentOutfit = defaultOutfits[followerIdentifier].getAt(0) as Outfit

	showTutorial(3)

	;If the follower is at home when being dismissed, reduce the current home count.
	If followerRef.getActorValue("WaitingForPlayer") == 2
		BFFGlobalCountHome.Mod(-1)
		logReport("BFF - New Home Count: " + BFFGlobalCountHome.Value)
	EndIf

	;Set values to fully dismiss the defined follower.
	followerRef.stopCombat()
	followerRef.setPlayerTeammate(false, false)
	followerRef.setActorValue("WaitingForPlayer", 0)
	BFFFormCurrentFollowers.removeAddedForm(followerRef)

	;Force the follower to say a specific line determined in the conditions of their AI packages.
	If SayLine == 1
		iFollowerDismiss = 1
		followerRef.evaluatePackage()
		Utility.Wait(2)
	EndIf
	iFollowerDismiss = 0

	setTracking(BFFDialogueFollower, followerIdentifier, false)

	;Return any outfit items to the player.
	retrieveOutfits(followerAlias, followerIdentifier)

	;If the player doesn't already have a bag of follower belongings, add it to their inventory.
	If PlayerREF.getItemCount(BFFFollowerBelongings) == 0
		PlayerREF.additem(BFFFollowerBelongings, 1, true)
		Notification(followerName + " Belongings Added")
	EndIf

	Wait(0.05)

	;Return the follower's outfit to thewir default.
	defaultOutfits[followerIdentifier].removeAddedForm(currentOutfit)
	followerRef.setOutfit(currentOutfit)

	BFFGlobalCountFollowers.Mod(-1)

	;Messaging and debug feedback.
	stateMessage(followerName, modFunctions.dismissalMessages[dismissMessage])
	logReport("BFF - Updated Follower Count: " + BFFGlobalCountFollowers.Value)

	followerRef.EvaluatePackage()

	;Clear the alias once all actions have been complete that may reference the alias.
	followerAlias.UnregisterForUpdate()
	followerAlias.UnregisterForUpdateGameTime()
	followerAlias.Clear()

EndFunction


;Sets the defined follower's curent recruitment state with the Blades.
Function followerBlades(Actor followerRef, Int bladesCommand = 1)

	ReferenceAlias followerAlias = getFollower(followerRef)
	Int followerIdentifier = followerAlias.getID()
	String followerName = followerNames[followerIdentifier]

	If bladesCommand == 0 ; Revoke Blades

		;Clears the Blades Alias, freeing the role for another follower to fill.
		BladesAlias.Clear()
		;Display notificatiosns and debug messaging.
		stateMessage(followerName, "is no longer prepared to join the Blades.")
		logReport("BFF - Revoke Blades: " + followerName)

	ElseIf bladesCommand == 1 ; Recruit to Blades

		showTutorial(10)
		;Set the follower to essential ot ensure they don't die, breaking the Blades recruitment system.
		followerRef.GetActorBase().SetEssential()
		;Assign the follower to the Blades alias, meaning when the player speaks with Delphine, she will recognise them as ready to join.
		bladesAlias.forceRefTo(followerRef)
		;Display notificatiosns and debug messaging.
		stateMessage(followerName, "is prepared to join the Blades.")
		logReport("BFF - Recruit to Blades: " + followerName)

	ElseIf bladesCommand == 2 ; Induct Blade & Dismiss Follower

		;Clear the Blades Alias for the next follower.
		BladesAlias.Clear()
		;Dismiss the follower, triggering the relevant dismissal message.
		followerDismiss(followerRef, 9)
		;Display notificatiosns and debug messaging.
		logReport("BFF - Revoke Blades & Dismiss: " + followerName)

	EndIf

	modFunctions.sendIdle(followerRef, "IdleSalute")

	followerRef.EvaluatePackage()

EndFunction


;Assign the defined follower a task to complete, changing their wait state for AI Packages to detect.
Function followerFavor(Actor followerRef, Int favorType, Float Time = 0.5, Int Store = 100)

	;Favor Types: 3 = Store | 4 = Firewood | 5 = Weapon | 6 = Armor | 7 = Alchemy

	ReferenceAlias followerAlias = getFollower(followerRef)
	Int followerIdentifier = followerAlias.getID()
	String followerName = followerNames[followerIdentifier]

	;Check the defined favor type and carry out the requested favor.
	If favorType == 3

		logReport("BFF - Favor Requested: Store")
		followerRef.setPlayerTeammate(false)
		followerAlias.RegisterForMenu("ContainerMenu")
		storeContainers[followerIdentifier].Activate(PlayerREF)
		storeMarkers[followerIdentifier].moveTo(StoreLocations.getAt(Store) as ObjectReference)
		followerRef.setPlayerTeammate()
		modFunctions.sendIdle(followerRef, "IdleTake")

	ElseIf favorType == 4

		logReport("BFF - Favor Requested: Firewood")
		ObjectReference closestBlock = FindClosestReferenceOfAnyTypeInList(choppingBlocks, followerRef.getPositionX(), followerRef.getPositionY(), followerRef.getPositionZ(), 2048)

		;If there is no chopping block in sight, speak to "Cannot Do" line.
		If !closestBlock
			followerRef.Say(cannotDo)
		Else
			;If there is a chopping block that is owned, display a notification.
			If closestBlock.getActorOwner() != None || closestBlock.getFactionOwner() != None
				Notification("The nearest chopping block cannot be used.")
			Else
				followerRef.setPlayerTeammate(false, false)
				followerRef.say(canDo)
				followerRef.setActorValue("WaitingForPlayer", 4)
				followerAlias.RegisterForSingleUpdateGameTime(Time)
			EndIf
		EndIf

	ElseIf favorType >= 5

		followerRef.setPlayerTeammate(false, false)
		logReport("BFF - Favor Requested: Loot")
		followerRef.setActorValue("WaitingForPlayer", favorType)
		followerAlias.RegisterForSingleUpdateGameTime(Time)
	
	EndIf

	followerRef.evaluatePackage()

EndFunction


;Set the defined follower's combat style to the defined style through dialogue.
Function combatStyle(Actor followerRef, Int CombatType)

	ActorBase followerActor = (followerRef).getActorBase()

	followerActor.setCombatStyle(CombatList.getAt(CombatType) as CombatStyle)
	modFunctions.sendIdle(followerRef, "IdleCombatStretchingStart")

	followerRef.EvaluatePackage()

EndFunction


;Checks the defined outfit type and picks the outfit container from the outfit array for the defined follower, proceeding to access the container.
Function editOutfit(Actor followerRef, Int outfitType)

	;Outfit Types: 1 = Traveller | 2 = Casual | 3 = Work | 4 = Sleep

	ReferenceAlias followerAlias = getFollower(followerRef)
	Int followerIdentifier = followerAlias.getID()
	FormList outfitList = getOutfitList(followerIdentifier, outfitType)
	ObjectReference outfitContainer = getOutfitContainer(followerIdentifier, outfitType)

	followerRef.SetPlayerTeammate(false, false)
	showTutorial(7)
	BFFGlobalOutfitEditDetect.Value = outfitType
	followerAlias.RegisterForMenu("ContainerMenu")

	;Cycle through the outfit items and take them from the follower's inventory, placing them in the outfit container for sorting.
	Int iIndex = 0
	While iIndex < outfitList.getSize()
		Form currentItem = outfitList.GetAt(iIndex)
		followerAlias.getRef().removeItem(currentItem, 1, true, outfitContainer)
		iIndex +=1
	EndWhile

	outfitContainer.Activate(PlayerREF)
	followerRef.setPlayerTeammate()

EndFunction


;Force the follower to equip the items in a specified outfit container.
Function wearOutfit(Actor followerRef, Int outfitType, Bool speakLine = True, Bool BypassCheck = False)

	;Outfit Types: 1 = Traveller | 2 = Casual | 3 = Work | 4 = Sleep

	ReferenceAlias followerAlias = getFollower(followerRef)
	Int followerIdentifier = followerAlias.getID()
	FormList outfitList = getOutfitList(followerIdentifier, outfitType)
	ObjectReference outfitContainer = getOutfitContainer(followerIdentifier, outfitType)
	String followerName = followerNames[followerIdentifier]

	If BypassCheck
		logReport("BFF - " + followerName + " triggered Outfti Bypass")
	EndIf

	logReport("BFF - " + outfitContainer.getBaseObject().getName())

	followerRef.setPlayerTeammate(false, false)

	;Does the outfit have items in?
	If outfitList.GetSize() > 0

		logReport("BFF - Outfit has Items in it ")

		;Is the follower already wearing the requested outfit?
		If outfitType == currentOutfits[followerIdentifier] && !BypassCheck
			;YES
			logReport("BFF - Outfit Already Equiped ")
		;Is the follower wearing any other outfit?
		ElseIf currentOutfits[followerIdentifier] != -1
			;YES
			logReport("BFF - Unequipping Current Outfit ")
			unequipOutfit(followerRef, currentOutfits[followerIdentifier])
			Wait(0.1)
		EndIf

		currentOutfits[followerIdentifier] = outfitType

		;Cycle through each item, checking if the item is still on the follower's person, either removing it from the outfit or equipping it.
		Int iIndex = 0
		While iIndex < outfitList.getSize()

			Form currentItem = outfitList.getAt(iIndex)

			If followerRef.getItemCount(currentItem) > 0
				If !followerRef.IsEquipped(currentItem)
					followerRef.equipItem(currentItem, true, true)
					logReport("BFF - " + currentItem.getName() + " Attempt Equip ")
				EndIf
			Else
				outfitList.removeAddedForm(currentItem)
				logReport("BFF - " + currentItem.getName() + " Removed From Outfit")
				Notification(followerName + "is missing " + currentItem.getName())
			EndIf
			iIndex +=1

		EndWhile

	Else

		logReport("BFF - Outfit has no Items ")

		;Should the follower say they cannot perform the action or equip their defualt outfit?
		If speakLine
			If modFunctions.featuresGlobals[8].Value == 1
				followerRef.Say(cannotDo)
				Notification(followerName + " has no items in that outfit.")
				logReport(followerName + " cannot do that.")
			EndIf
		Else
			followerRef.setOutfit(defaultOutfits[followerIdentifier].getAt(0) as Outfit)
		EndIf
	EndIf

	followerRef.setPlayerTeammate()

EndFunction


;Unequip all outfit items from the follower.
Function unequipOutfit(Actor followerRef, Int outfitType)

	logReport("BFF - Unequip Detected")

	;Outfit Types: 1 = Traveller | 2 = Casual | 3 = Work | 4 = Sleep

	ReferenceAlias followerAlias = getFollower(followerRef)
	Int followerIdentifier = followerAlias.getID()
	FormList outfitList = getOutfitList(followerIdentifier, outfitType)
	ObjectReference outfitContainer = getOutfitContainer(followerIdentifier, outfitType)
	ObjectReference transferContainer = transferContainers[followerIdentifier]
	String followerName = followerNames[followerIdentifier]

	followerRef.setPlayerTeammate(false, false)

	;Equip the follower's default starting outfit before setting the values for current and last outfit.
	followerRef.setOutfit(defaultOutfits[followerIdentifier].getAt(0) as Outfit)

	lastOutfits[followerIdentifier] = currentOutfits[followerIdentifier]
	modFunctions.logReport("BFF - " + followerName + ": Last Outfit Set - " + currentOutfits[followerIdentifier])
	currentOutfits[followerIdentifier] = -1

	;Cycle through each outfit item transfer it to a temp container and back, unequipping whilst preventing nudity.
	Int iIndex = 0
	While iIndex < outfitList.getSize()
		Form currentItem = outfitList.getAt(iIndex)
		If followerRef.getItemCount(currentItem) > 0
			followerAlias.getRef().removeItem(currentItem, 1, true, transferContainer)
			transferContainer.removeItem(currentItem, 1, true, followerAlias.GetRef())
		Else
			outfitList.RemoveAddedForm(currentItem)
		EndIf
		iIndex +=1
	EndWhile

	followerRef.setPlayerTeammate()

EndFunction


;Move the defined follower's location marker for the specified location type to the player or back to its origin.
Function followerLocation(Actor followerRef, Int locationType, Bool newPlacement = True)

	;Location Types: 1 = Home | 2 = Work | 3 = Sleep

	ReferenceAlias followerAlias = getFollower(followerRef)
	Int followerIdentifier = followerAlias.getID()
	String followerName = followerNames[followerIdentifier]
	ObjectReference locationMarker

	;Checks the defined location type and updates the object reference to move the correct reference from the correct array.
	If locationType == 1
		locationMarker = homeReferences[followerIdentifier]
	ElseIf locationType == 2
		locationMarker = workReferences[followerIdentifier]
	ElseIf locationType == 3
		locationMarker = sleepReferences[followerIdentifier]
	EndIf

	;Moves the defined object reference marker to the player or back to its origin.
	If newPlacement
		locationMarker.moveTo(PlayerRef, 0, 0, 0)
		logReport("BFF - Marker Moved")
	Else
		locationMarker.moveToMyEditorLocation()
		logReport("BFF - Marker Returned")
	EndIf

	followerRef.EvaluatePackage()

EndFunction


;Displays a text entry field and then changs the name of the follower to the defined text string, additionally storing the value in the relevant string array.
Function followerRename(Actor followerRef)

	String baseName = followerRef.getBaseObject().getName()
	ReferenceAlias followerAlias = getFollower(followerRef)
	Int followerIdentifier = followerAlias.getID()
	uiMenuBase nameMenu = uiExtensions.getMenu("UITextEntryMenu", true)

	;Display the tutorial message first.
	showTutorial(8)
	Wait(0.05)

	;Display the renaming menu to enter the new name of the follower.
	nameMenu.openMenu(none, none)

	String newName = nameMenu.GetResultString()

	;Changes the horse's name if text has been entered.
	If newName == ""
		Notification("Name Not Changed")
	Else
		followerNames[followerIdentifier] = newName
		followerRef.getBaseObject().setName(newName)
		modFunctions.sendIdle(followerRef, "IdleExamine")
	EndIf

EndFunction


;Set the defined follower's skill levels depending on the specified values.
Function Teach(Actor followerRef, String assignedSkill)

	Int learnTime = modFunctions.settingsGlobals[12].Value as Int

	showTutorial(9)

	followerRef.setActorValue(assignedSkill, followerRef.getBaseActorValue(assignedSkill)+1)

	If learnTime > 0
		FadeOutGame(false, true, 3.0, 2.0)
		GameHour.Mod(learnTime)
		Notification("Some time passes.")
	EndIf

EndFunction


;Forces the defined follower to taunt, using a different animation depending on their current equipped items.
Function Taunt(Actor followerRef)

	Bool Unarm = False
	Int LeftHand = followerRef.getEquippedItemType(0)
	Int RightHand = followerRef.getEquippedItemType(1)

	BFFSpellTauntEffect.Cast(followerRef, followerRef)

	If !followerRef.IsWeaponDrawn()

		If !followerRef.IsAlarmed()
			followerRef.setAlert(true)
			followerRef.drawWeapon()
			Utility.Wait(0.4)
			Unarm = True
		EndIf

	EndIf

	If LeftHand == 10
		If RightHand <= 4 && !RightHand == 0 ; Shield & One-handed
			sendAnimationEvent(followerRef, "IdleCombatShieldStart")
		ElseIf RightHand == 9 || RightHand == 0 ; Shield & Magic OR Nothing
			sendAnimationEvent(followerRef, "IdleCombatShieldStart")
		EndIf
	ElseIf RightHand == 5 || RightHand == 6 ; Two Handed Right
		sendAnimationEvent(followerRef, "IdleCombatSpecialStart")
	ElseIf LeftHand == 5 || LeftHand == 6 ; Two-Handed Left
		sendAnimationEvent(followerRef, "IdleCombatSpecialStart")
	ElseIf LeftHand == 11
		If RightHand <= 4 ; Torch & One-Handed
			sendAnimationEvent(followerRef, "IdleCombatWeaponCheckStart")
		ElseIf RightHand == 8 ; Torch & Staff
			sendAnimationEvent(followerRef, "IdleCombatSpecialStart")
		EndIf
	ElseIf LeftHand == 9 && RightHand == 9 ; Magic Combination
		sendAnimationEvent(followerRef, "IdleCombatStretchingStart")
	ElseIf LeftHand == 9 && Righthand == 0 ; Magic Combination
		sendAnimationEvent(followerRef, "IdleCombatStretchingStart")
	ElseIf LeftHand == 0 && RightHand == 9 ; Magic Combination
		If RightHand == 9
			sendAnimationEvent(followerRef, "IdleCombatStretchingStart")
		ElseIf LeftHand <= 4 ; One-Handed Right & Nothing
			sendAnimationEvent(followerRef, "IdleCombatWeaponCheckStart")
		EndIf
	ElseIf LeftHand == 9 ; One-Handed Right & Magic
		If RightHand <= 4
			sendAnimationEvent(followerRef, "IdleCombatWeaponCheckStart")
		EndIf
	ElseIf RightHand == 9 ; Left One-Handed & Magic
		If Lefthand <= 4
			sendAnimationEvent(followerRef, "IdleCombatStretchingStart")
		EndIf
	ElseIf LeftHand == 7 ; Bow
		sendAnimationEvent(followerRef, "IdleCombatSpecialStart")
	ElseIf LeftHand == 0 && RightHand == 0 ; Unarmed
		sendAnimationEvent(followerRef, "IdleCombatStretchingStart")
	Else ; Catch All
		sendAnimationEvent(followerRef, "IdleCombatStretchingStart")
	EndIf

	If Unarm == True && !followerRef.IsInCombat()
		Utility.Wait(1.5)
		followerRef.setAlert(false)
	EndIf

EndFunction


Function followerMove(Actor followerRef)

	ReferenceAlias followerAlias = getFollower(followerRef)

	followerRef.setActorValue("WaitingforPlayer", 10)
	followerAlias.RegisterForSingleUpdate(3.5)

EndFunction


;=========================
;Shared Functions
;=========================

;Return the relevant form list for the specificed outfit type.
FormList Function getOutfitList(Int followerIdentifier, Int outfitType)

	If outfitType == 1
		Return travellerOutfits[followerIdentifier]
	ElseIf outfitType == 2
		Return casualOutfits[followerIdentifier]
	ElseIf outfitType == 3
		Return workOutfits[followerIdentifier]
	ElseIf outfitType == 4
		Return sleepOutfits[followerIdentifier]
	EndIf

EndFunction


;Return the relevant reference for the defined outfit types's container.
ObjectReference Function getOutfitContainer(Int followerIdentifier, Int outfitType)

	If outfitType == 1
		Return travellerContainers[followerIdentifier]
	ElseIf outfitType == 2
		Return casualContainers[followerIdentifier]
	ElseIf outfitType == 3
		Return workContainers[followerIdentifier]
	ElseIf outfitType == 4
		Return sleepContainers[followerIdentifier]
	EndIf

EndFunction


;Check the item count for each outfit for the defined follower and return them to the player via a belongings knapsack.
Function retrieveOutfits(ReferenceAlias followerAlias, Int followerIdentifier)

	If travellerOutfits[followerIdentifier].getSize() > 0
		Int iIndex = 0
		While iIndex < travellerOutfits[followerIdentifier].getSize()
			Form currentItem = travellerOutfits[followerIdentifier].getAt(iIndex)
			Float currentWeight = BFFFollowerBelongings.getWeight()
			Int currentValue = BFFFollowerBelongings.getGoldValue()
			followerAlias.getRef().removeItem(currentItem, 1, true, BFFRefBelongings)
			BFFFollowerBelongings.setWeight(currentWeight+currentItem.getWeight())
			BFFFollowerBelongings.setGoldValue(currentValue+currentItem.getGoldValue())
			iIndex +=1
		EndWhile
	EndIf

	If casualOutfits[followerIdentifier].getSize() > 0
		Int iIndex = 0
		While iIndex < casualOutfits[followerIdentifier].getSize()
			Form currentItem = casualOutfits[followerIdentifier].getAt(iIndex)
			Float currentWeight = BFFFollowerBelongings.GetWeight()
			Int currentValue = BFFFollowerBelongings.GetGoldValue()
			followerAlias.getRef().removeItem(currentItem, 1, true, BFFRefBelongings)
			BFFFollowerBelongings.setWeight(currentWeight+currentItem.getWeight())
			BFFFollowerBelongings.setGoldValue(currentValue+currentItem.getGoldValue())
			iIndex +=1
		EndWhile
	EndIf

	If workOutfits[followerIdentifier].getSize() > 0
		Int iIndex = 0
		While iIndex < workOutfits[followerIdentifier].getSize()
			Form currentItem = workOutfits[followerIdentifier].getAt(iIndex)
			Float currentWeight = BFFFollowerBelongings.getWeight()
			Int currentValue = BFFFollowerBelongings.getGoldValue()
			followerAlias.getRef().removeItem(currentItem, 1, true, BFFRefBelongings)
			BFFFollowerBelongings.setWeight(currentWeight+currentItem.getWeight())
			BFFFollowerBelongings.setGoldValue(currentValue+currentItem.getGoldValue())
			iIndex +=1
		EndWhile
	EndIf

	If sleepOutfits[followerIdentifier].GetSize() > 0
		Int iIndex = 0
		While iIndex < sleepOutfits[followerIdentifier].getSize()
			Form currentItem = sleepOutfits[followerIdentifier].getAt(iIndex)
			Float currentWeight = BFFFollowerBelongings.getWeight()
			Int currentValue = BFFFollowerBelongings.getGoldValue()
			followerAlias.getRef().removeItem(currentItem, 1, true, BFFRefBelongings)
			BFFFollowerBelongings.setWeight(currentWeight+currentItem.getWeight())
			BFFFollowerBelongings.setGoldValue(currentValue+currentItem.getGoldValue())
			iIndex +=1
		EndWhile
	EndIf

	If currentOutfits[followerIdentifier] > 0
		unequipOutfit(followerAlias.getActorRef(), currentOutfits[followerIdentifier])
	EndIf

EndFunction


Function retrieveGold(Actor followerRef)

	ReferenceAlias followerAlias = getFollower(followerRef)
	Int followerIdentifier = followerAlias.getID()

	followerRef.setActorValue("WaitingForPlayer", 0)
	GetPlayer().addItem(getForm(0xf), sellCounts[followerIdentifier])
	sellCounts[followerIdentifier] = 0

	modFunctions.sendIdle(followerRef, "IdleGive")

EndFunction


Function retrieveItems(Actor followerRef)

	ReferenceAlias followerAlias = getFollower(followerRef)
	Int followerIdentifier = followerAlias.getID()

	followerRef.setActorValue("WaitingForPlayer", 0)
	If favorContainers[followerIdentifier].getNumItems() > 0
		favorContainers[followerIdentifier].removeAllItems(PlayerREF)
		modFunctions.sendIdle(followerRef, "IdleGive")
	EndIf

EndFunction


Function retrieveFirewood(Actor followerRef)

	ReferenceAlias followerAlias = getFollower(followerRef)
	Int followerIdentifier = followerAlias.getID()

	MiscObject Firewood = Game.getForm(0x6F993) as MiscObject
	int firewoodCount = followerRef.getItemCount(Firewood)

	followerRef.setActorValue("WaitingForPlayer", 0)

	If firewoodCount == 0
		Notification("followerName" + " has no firewood.")
	Else
	
		followerRef.removeItem(Firewood, firewoodCount, True, Game.getPlayer())
		Notification(firewoodCount + " Firewood Added")
		
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

	Return modFunctions.getFollower(followerRef)

EndFunction