;/ Decompiled by Champollion v1.3.2
PEX format v3.2 GameID: 1
Source   : BOT_BosmerEnchantArrowScript.psc
Modified : 2020-10-18 22:14:19
Compiled : 2020-10-18 22:14:22
User     : jason
Computer : DESKTOP-M44FDDJ
/;
ScriptName BOT_BosmerEnchantArrowScript Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Ammo Property BOTAmmo_AncientNordArrowAbsorb Auto
Ammo Property BOTAmmo_DaedricArrowAbsorb Auto
Ammo Property BOTAmmo_DragonboneArrowAbsorb Auto
Ammo Property BOTAmmo_DwarvenArrowAbsorb Auto
Ammo Property BOTAmmo_DwarvenBoltAbsorb Auto
Ammo Property BOTAmmo_EbonyArrowAbsorb Auto
Ammo Property BOTAmmo_ElvenArrowAbsorb Auto
Ammo Property BOTAmmo_FalmerArrowAbsorb Auto
Ammo Property BOTAmmo_ForswornArrowAbsorb Auto
Ammo Property BOTAmmo_GlassArrowAbsorb Auto
Ammo Property BOTAmmo_IronArrowAbsorb Auto
Ammo Property BOTAmmo_NordicArrowAbsorb Auto
Ammo Property BOTAmmo_OrcishArrowAbsorb Auto
Ammo Property BOTAmmo_RieklingArrowAbsorb Auto
Ammo Property BOTAmmo_RustyArrowAbsorb Auto
Ammo Property BOTAmmo_StalhrimArrowAbsorb Auto
Ammo Property BOTAmmo_SteelArrowAbsorb Auto
Ammo Property BOTAmmo_SteelBoltAbsorb Auto
MagicEffect Property BOTEffect_Spell_PowerBloodArrowsBlockDummy Auto
Message Property BOTMessage_Racial_Bosmer_BloodArrowsAverage Auto
Message Property BOTMessage_Racial_Bosmer_BloodArrowsDawnguard Auto
Message Property BOTMessage_Racial_Bosmer_BloodArrowsDragonborn Auto
Message Property BOTMessage_Racial_Bosmer_BloodArrowsStartMenu Auto
Message Property BOTMessage_Racial_Bosmer_BloodArrowsStrong Auto
Message Property BOTMessage_Racial_Bosmer_BloodArrowsWeak Auto
Spell Property BOTSpell_Power_Racial_Bosmer_BloodArrows Auto
Spell Property BOTSpell_Spell_Dummy_PowerBloodArrowsBlock Auto
Ammo Property DLC1BoltDwarven Auto
Ammo Property DLC1BoltSteel Auto
Ammo Property DLC1DragonboneArrow Auto
Ammo Property DLC2NordicArrow Auto
Ammo Property DLC2RieklingSpearThrown Auto
Ammo Property DLC2StalhrimArrow Auto
Ammo Property DaedricArrow Auto
Ammo Property DraugrArrow Auto
Ammo Property DwarvenArrow Auto
Ammo Property EbonyArrow Auto
Ammo Property ElvenArrow Auto
Ammo Property FalmerArrow Auto
Ammo Property ForswornArrow Auto
Ammo Property GlassArrow Auto
Ammo Property IronArrow Auto
Ammo Property OrcishArrow Auto
playervampirequestscript Property PlayerVampireQuest Auto
Ammo Property SteelArrow Auto
Race Property WoodElfRaceVampire Auto
Ammo Property dunGeirmundSigdisArrowsIllusion Auto
Actor Property playerREF Auto

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

Function Menu01(Int aiButton, Bool abMenu)
  While abMenu
    aiButton = BOTMessage_Racial_Bosmer_BloodArrowsStartMenu.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    If aiButton == 0
      aiButton = BOTMessage_Racial_Bosmer_BloodArrowsWeak.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      If aiButton == 0
        
      ElseIf aiButton == 1
        playerREF.RemoveItem(dunGeirmundSigdisArrowsIllusion as Form, 20, False, None)
        playerREF.Additem(BOTAmmo_RustyArrowAbsorb as Form, 20, False)
        abMenu = False
      ElseIf aiButton == 2
        playerREF.RemoveItem(FalmerArrow as Form, 20, False, None)
        playerREF.Additem(BOTAmmo_FalmerArrowAbsorb as Form, 20, False)
        abMenu = False
      ElseIf aiButton == 3
        playerREF.RemoveItem(ForswornArrow as Form, 20, False, None)
        playerREF.Additem(BOTAmmo_ForswornArrowAbsorb as Form, 20, False)
        abMenu = False
      ElseIf aiButton == 4
        playerREF.RemoveItem(IronArrow as Form, 20, False, None)
        playerREF.Additem(BOTAmmo_IronArrowAbsorb as Form, 20, False)
        abMenu = False
      EndIf
    ElseIf aiButton == 1
      aiButton = BOTMessage_Racial_Bosmer_BloodArrowsAverage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      If aiButton == 0
        
      ElseIf aiButton == 1
        playerREF.RemoveItem(DraugrArrow as Form, 20, False, None)
        playerREF.Additem(BOTAmmo_AncientNordArrowAbsorb as Form, 20, False)
        abMenu = False
      ElseIf aiButton == 2
        playerREF.RemoveItem(SteelArrow as Form, 20, False, None)
        playerREF.Additem(BOTAmmo_SteelArrowAbsorb as Form, 20, False)
        abMenu = False
      ElseIf aiButton == 3
        playerREF.RemoveItem(OrcishArrow as Form, 20, False, None)
        playerREF.Additem(BOTAmmo_OrcishArrowAbsorb as Form, 20, False)
        abMenu = False
      ElseIf aiButton == 4
        playerREF.RemoveItem(DwarvenArrow as Form, 20, False, None)
        playerREF.Additem(BOTAmmo_DwarvenArrowAbsorb as Form, 20, False)
        abMenu = False
      EndIf
    ElseIf aiButton == 2
      aiButton = BOTMessage_Racial_Bosmer_BloodArrowsStrong.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      If aiButton == 0
        
      ElseIf aiButton == 1
        playerREF.RemoveItem(ElvenArrow as Form, 20, False, None)
        playerREF.Additem(BOTAmmo_ElvenArrowAbsorb as Form, 20, False)
        abMenu = False
      ElseIf aiButton == 2
        playerREF.RemoveItem(GlassArrow as Form, 20, False, None)
        playerREF.Additem(BOTAmmo_GlassArrowAbsorb as Form, 20, False)
        abMenu = False
      ElseIf aiButton == 3
        playerREF.RemoveItem(EbonyArrow as Form, 20, False, None)
        playerREF.Additem(BOTAmmo_EbonyArrowAbsorb as Form, 20, False)
        abMenu = False
      ElseIf aiButton == 4
        playerREF.RemoveItem(DaedricArrow as Form, 20, False, None)
        playerREF.Additem(BOTAmmo_DaedricArrowAbsorb as Form, 20, False)
        abMenu = False
      EndIf
    ElseIf aiButton == 3
      aiButton = BOTMessage_Racial_Bosmer_BloodArrowsDawnguard.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      If aiButton == 0
        
      ElseIf aiButton == 1
        playerREF.RemoveItem(DLC1BoltSteel as Form, 20, False, None)
        playerREF.Additem(BOTAmmo_SteelBoltAbsorb as Form, 20, False)
        abMenu = False
      ElseIf aiButton == 2
        playerREF.RemoveItem(DLC1BoltDwarven as Form, 20, False, None)
        playerREF.Additem(BOTAmmo_DwarvenBoltAbsorb as Form, 20, False)
        abMenu = False
      ElseIf aiButton == 3
        playerREF.RemoveItem(DLC1DragonboneArrow as Form, 20, False, None)
        playerREF.Additem(BOTAmmo_DragonboneArrowAbsorb as Form, 20, False)
        abMenu = False
      EndIf
    ElseIf aiButton == 4
      aiButton = BOTMessage_Racial_Bosmer_BloodArrowsDragonborn.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      If aiButton == 0
        
      ElseIf aiButton == 1
        playerREF.RemoveItem(DLC2RieklingSpearThrown as Form, 20, False, None)
        playerREF.Additem(BOTAmmo_RieklingArrowAbsorb as Form, 20, False)
        abMenu = False
      ElseIf aiButton == 2
        playerREF.RemoveItem(DLC2NordicArrow as Form, 20, False, None)
        playerREF.Additem(BOTAmmo_NordicArrowAbsorb as Form, 20, False)
        abMenu = False
      ElseIf aiButton == 3
        playerREF.RemoveItem(DLC2StalhrimArrow as Form, 20, False, None)
        playerREF.Additem(BOTAmmo_StalhrimArrowAbsorb as Form, 20, False)
        abMenu = False
      EndIf
    ElseIf aiButton == 5
      abMenu = False
    EndIf
  EndWhile
  If aiButton != 5
    BOTSpell_Spell_Dummy_PowerBloodArrowsBlock.Cast(playerREF as ObjectReference, playerREF as ObjectReference)
    PlayerVampireQuest.VampireBloodLevel(12500, 1, 0)
    PlayerVampireQuest.VampireStages(0)
    ; RCS
    ; If playerREF.GetActorBase().GetRace() != WoodElfRaceVampire
    If !RaceCompatibility.GetIsRaceByProxy(playerREF.GetActorBase().GetRace(), WoodElfRaceVampire)
      playerREF.RemoveSpell(BOTSpell_Power_Racial_Bosmer_BloodArrows)
    EndIf
  EndIf
EndFunction

Event onEffectStart(Actor akTarget, Actor akCaster)
  If playerREF.hasMagicEffect(BOTEffect_Spell_PowerBloodArrowsBlockDummy)
    Debug.notification("Powers can only be used once a day.")
  ElseIf PlayerVampireQuest.VampireBloodCheck(12500)
    Self.Menu01(0, True)
  Else
    Debug.notification("You do not have enough blood to enchant arrows.")
  EndIf
EndEvent
