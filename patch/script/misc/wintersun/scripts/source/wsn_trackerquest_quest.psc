;/ Decompiled by Champollion v1.3.2
PEX format v3.2 GameID: 1
Source   : WSN_TrackerQuest_Quest.psc
Modified : 2026-09-23 02:08:05
Compiled : 2026-09-23 02:08:06
User     : maxim
Computer : BRICK
/;
ScriptName WSN_TrackerQuest_Quest Extends Quest

;-- Variables ---------------------------------------
Int CharacterLevel = 0
Float DynamicStat0 = 0.0
Float DynamicStat1 = 0.0
Float DynamicStat2 = 0.0
Bool ShowReminder = False
Float StartDay = 0.0
Int StartSpellCount = 0

;-- Properties --------------------------------------
Float Property FavorChangeQueued Auto
Float Property GameDayLastDecayed = -1.0 Auto
GlobalVariable Property GameDaysPassed Auto
GlobalVariable Property GameHour Auto
Location Property GlenmorilCovenLocation Auto
Location Property HighHrothgarLocation Auto
Ingredient Property HumanFlesh Auto
Ingredient Property HumanHeart Auto
Bool Property IsFavored = False Auto
MagicEffect Property MQpathToHHShrineEffect Auto
GlobalVariable Property PlayerFollowerCount Auto
Faction Property PlayerMarriedFaction Auto
Actor Property PlayerRef Auto
MagicEffect Property RestedMarriageSkillEffect Auto
Keyword Property Vampire Auto
Keyword Property VendorItemArmor Auto
Keyword Property VendorItemClothing Auto
String Property WSN_AV Auto
Spell[] Property WSN_Blessing Auto
Spell[] Property WSN_Boon1 Auto
Spell[] Property WSN_Boon2 Auto
Spell Property WSN_Cure_Spell Auto
Spell Property WSN_Daedra_Jyggalag_Boon1_Spell_ProcOnSelf Auto
String[] Property WSN_DeityName Auto
String[] Property WSN_DivineType Auto
Int[] Property WSN_DivineTypeID Auto
Spell Property WSN_Divine_Kynareth_Boon2_Spell_ProcOnSelf Auto
GlobalVariable[] Property WSN_DrainRateMult Auto
Float[] Property WSN_DrainRateMultIndividual Auto
String[] Property WSN_DynamicStat0 Auto
GlobalVariable[] Property WSN_DynamicStat0_Multiplier Auto
String[] Property WSN_DynamicStat1 Auto
GlobalVariable[] Property WSN_DynamicStat1_Multiplier Auto
String[] Property WSN_DynamicStat2 Auto
GlobalVariable[] Property WSN_DynamicStat2_Multiplier Auto
GlobalVariable Property WSN_Effect_Global_BlockDecay Auto
GlobalVariable Property WSN_Effect_Global_CurrentHermaThreshold Auto
GlobalVariable Property WSN_Effect_Global_DestinyActivated Auto
GlobalVariable Property WSN_Effect_Global_HermaThresholdJump Auto
GlobalVariable Property WSN_Effect_Global_MehrunesExplodes Auto
GlobalVariable Property WSN_Effect_Global_MehrunesExplodesMax Auto
GlobalVariable Property WSN_Effect_Global_PeryiteBreathWeaponUsed Auto
GlobalVariable Property WSN_Effect_Global_RuptgaCounter Auto
Message Property WSN_Effects_Message_Herma_PerkPoint Auto
Explosion Property WSN_Explosion Auto
GlobalVariable[] Property WSN_FavorBase_Global Auto
GlobalVariable Property WSN_FavorCurve_Global Auto
Message[] Property WSN_FavorDisplay Auto
GlobalVariable Property WSN_FavorDrain_Global Auto
GlobalVariable Property WSN_FavorFavoredRaceMult_Global Auto
GlobalVariable Property WSN_FavorMeditation_Global Auto
GlobalVariable Property WSN_Favor_Global Auto
GlobalVariable Property WSN_Favor_Global_Fractional Auto
GlobalVariable Property WSN_Favor_Global_Fractional2 Auto
GlobalVariable Property WSN_Favor_Global_Fractional3 Auto
GlobalVariable Property WSN_Favor_Global_Fractional4 Auto
GlobalVariable Property WSN_Favor_Global_FractionalHircine Auto
GlobalVariable Property WSN_Favor_Global_FractionalPig Auto
Float Property WSN_FavoredDiminishTarget Auto
Race[] Property WSN_FavoredRace0 Auto
Race[] Property WSN_FavoredRace1 Auto
Message Property WSN_Help_Message_Apostasy Auto
Message Property WSN_Help_Message_BecomeFavored Auto
Message Property WSN_Help_Message_BecomeUnfavored Auto
Message Property WSN_Help_Message_WorshipBasics Auto
Message Property WSN_Help_Message_WorshipBasics_Clavicus Auto
Message Property WSN_Help_Message_WorshipBasics_Vaermina Auto
Message Property WSN_Help_Message_WorshipBasics_Yokudan Auto
Float Property WSN_HourglassMult Auto
MagicEffect Property WSN_Item_ElvenLamp_Effect_Ench Auto
MagicEffect Property WSN_Item_Hourglass_Effect_Ench Auto
Float[] Property WSN_LastUsedFakeGameHours Auto
{ 0 = meditation
1 = shrine blessing
2 = diminishing returns
3 = charity
4 = shouted
5 = thalmor kill
6 = shrine defiled }
Keyword Property WSN_MagicBlessing_Keyword_Divine Auto
Message[] Property WSN_MehrunesMessage Auto
GlobalVariable Property WSN_Misc_Global_DisableAbandon Auto
GlobalVariable Property WSN_Misc_Global_DrainMult Auto
GlobalVariable Property WSN_Misc_Global_FavorMod Auto
GlobalVariable Property WSN_Misc_Global_MeditateMult Auto
Message Property WSN_Misc_Message_DidNotMeditate Auto
Spell Property WSN_Misc_TheHist_Boon1_Spell_ProcOnSelf Auto
GlobalVariable Property WSN_ModifyFavor_Daedra_Vaermina_MeditationMult Auto
GlobalVariable Property WSN_ModifyFavor_Divine_Akatosh_FavorPerLevelUp Auto
GlobalVariable Property WSN_ModifyFavor_Divine_Mara_FavorIfHouseOwned Auto
GlobalVariable Property WSN_ModifyFavor_Divine_Mara_FavorIfMarried Auto
GlobalVariable Property WSN_ModifyFavor_Khajiit_RiddleThar_FavorFromMinAttribute Auto
GlobalVariable Property WSN_ModifyFavor_Khajiit_RiddleThar_FavorFromMinSkills Auto
GlobalVariable Property WSN_ModifyFavor_Misc_StAlessia_FavorIfHasFollower Auto
GlobalVariable Property WSN_ModifyFavor_Redguard_Morwha_FavorIfMarried Auto
GlobalVariable Property WSN_ModifyFavor_Shared_DrainRateMult_1_Daedra_SheoOverride Auto
GlobalVariable Property WSN_ModifyFavor_Shared_DrainRateMult_DuringBeneficialBuff Auto
GlobalVariable Property WSN_ModifyFavor_Shared_DrainRateMult_DuringBeneficialState Auto
GlobalVariable Property WSN_ModifyFavor_Shared_GainRateModifierBase Auto
GlobalVariable Property WSN_ModifyFavor_Shared_GainRateModifierCap Auto
GlobalVariable Property WSN_ModifyFavor_Shared_GainRateModifierDay Auto
GlobalVariable Property WSN_ModifyFavor_Shared_PrayerGainFavorableWeather Auto
GlobalVariable Property WSN_ModifyFavor_Shared_PrayerGainFavorableWeatherSuper Auto
GlobalVariable Property WSN_ModifyFavor_Shared_PrayerRateMult_1_Daedra_SheoOverride Auto
GlobalVariable Property WSN_ModifyFavor_Shared_RedguardPrayerCap Auto
String Property WSN_NoDeity Auto
wsn_peryite_script Property WSN_Peryite Auto
GlobalVariable[] Property WSN_PrayerRateMult Auto
Float[] Property WSN_PrayerRateMultIndividual Auto
MagicEffect Property WSN_Prayer_Effect_Sit_Diseased Auto
MagicEffect Property WSN_Prayer_Effect_Sit_IsInWilderness Auto
MagicEffect Property WSN_Prayer_Effect_Sit_IsWerewolf Auto
Message Property WSN_Prayer_Message_Azura Auto
Message Property WSN_Prayer_Message_Azura_Fail Auto
Message Property WSN_Prayer_Message_Dibella_Fail Auto
Message Property WSN_Prayer_Message_Hircine_Fail Auto
Message Property WSN_Prayer_Message_Julianos Auto
Message Property WSN_Prayer_Message_Kynareth_Fail Auto
Message Property WSN_Prayer_Message_Mannimarco_Fail Auto
Message Property WSN_Prayer_Message_Nocturnal Auto
Message Property WSN_Prayer_Message_Nocturnal_Fail Auto
Message Property WSN_Prayer_Message_Peryite_Fail Auto
Message Property WSN_Prayer_Message_RiddleThar Auto
Message Property WSN_Prayer_Message_RiddleThar_Fail Auto
Message Property WSN_Prayer_Message_Sithis_Fail Auto
Message Property WSN_Prayer_Message_TheAllMaker_Fail Auto
Message Property WSN_Prayer_Message_TheHist_Fail Auto
Message Property WSN_Prayer_Message_TheMagnaGe Auto
Message Property WSN_Prayer_Message_TheMagnaGe_Fail Auto
Spell Property WSN_Prayer_Spell Auto
Float[] Property WSN_PreviousFavor Auto
Bool[] Property WSN_QuestIsCompleted Auto
Quest[] Property WSN_QuestToComplete Auto
GlobalVariable[] Property WSN_Quest_Multiplier Auto
Spell Property WSN_Redguard_Ruptga_Boon1_Spell_ProcOnSelf Auto
ObjectReference Property WSN_Shrine Auto
GlobalVariable Property WSN_Spell_Global_DivineType Auto
String[] Property WSN_StatBuffToGains Auto
GlobalVariable[] Property WSN_StatBuffToGains_Multiplier Auto
String[] Property WSN_StaticAttr Auto
GlobalVariable[] Property WSN_StaticAttr_Multiplier Auto
String[] Property WSN_StaticSkills Auto
GlobalVariable[] Property WSN_StaticSkills_Multiplier Auto
String[] Property WSN_StaticStat0 Auto
GlobalVariable[] Property WSN_StaticStat0_Multiplier Auto
String[] Property WSN_StaticStat1 Auto
GlobalVariable[] Property WSN_StaticStat1_Multiplier Auto
String[] Property WSN_StaticStat2 Auto
GlobalVariable[] Property WSN_StaticStat2_Multiplier Auto
String Property WSN_StringApostasy Auto
String Property WSN_StringFavored Auto
String Property WSN_StringFavored2 Auto
String Property WSN_StringUnfavored Auto
String Property WSN_StringUnfavored2 Auto
Spell[] Property WSN_Tenet Auto
Float Property WSN_ThresholdFavored Auto
Float Property WSN_UpdateRate Auto
Spell Property WerewolfChange Auto
Location Property WhiterunTempleofKynarethLocation Auto
Int Property WorshipID = -1 Auto

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

Function ProcessFavorChanges(Bool abShowStatusMessages)
  If WorshipID != -1
    Float NewFavor = 0.0
    Float OldFavor = WSN_Favor_Global.GetValue()
    If WSN_StaticStat0_Multiplier[WorshipID]
      NewFavor += WSN_StaticStat0_Multiplier[WorshipID].GetValue() * Game.QueryStat(WSN_StaticStat0[WorshipID]) as Float
    EndIf
    If WSN_StaticStat1_Multiplier[WorshipID]
      NewFavor += WSN_StaticStat1_Multiplier[WorshipID].GetValue() * Game.QueryStat(WSN_StaticStat1[WorshipID]) as Float
    EndIf
    If WSN_StaticStat2_Multiplier[WorshipID]
      NewFavor += WSN_StaticStat2_Multiplier[WorshipID].GetValue() * Game.QueryStat(WSN_StaticStat2[WorshipID]) as Float
    EndIf
    If WSN_StaticAttr_Multiplier[WorshipID]
      If WSN_StaticAttr[WorshipID] == "health" || WSN_StaticAttr[WorshipID] == "magicka" || WSN_StaticAttr[WorshipID] == "stamina"
        NewFavor += WSN_StaticAttr_Multiplier[WorshipID].GetValue() * (PlayerRef.GetBaseActorValue(WSN_StaticAttr[WorshipID]) - 100.0)
      Else
        NewFavor += WSN_StaticAttr_Multiplier[WorshipID].GetValue() * (PlayerRef.GetBaseActorValue(WSN_StaticAttr[WorshipID]) - 15.0)
      EndIf
    EndIf
    If WSN_StaticSkills_Multiplier[WorshipID]
      If WSN_StaticSkills[WorshipID] == "Mage"
        NewFavor += WSN_StaticSkills_Multiplier[WorshipID].GetValue() * WSN_Peryite.GetMage()
      ElseIf WSN_StaticSkills[WorshipID] == "Thief"
        NewFavor += WSN_StaticSkills_Multiplier[WorshipID].GetValue() * WSN_Peryite.GetThief()
      ElseIf WSN_StaticSkills[WorshipID] == "Warrior"
        NewFavor += WSN_StaticSkills_Multiplier[WorshipID].GetValue() * WSN_Peryite.GetWarrior()
      ElseIf WSN_StaticSkills[WorshipID] == "total"
        NewFavor += WSN_StaticSkills_Multiplier[WorshipID].GetValue() * WSN_Peryite.GetTotal()
      EndIf
    EndIf
    If WorshipID == 4
      If PlayerRef.IsInFaction(PlayerMarriedFaction)
        NewFavor += WSN_ModifyFavor_Divine_Mara_FavorIfMarried.GetValue()
      EndIf
      If Game.QueryStat("Houses Owned") > 0
        NewFavor += WSN_ModifyFavor_Divine_Mara_FavorIfHouseOwned.GetValue()
      EndIf
    ElseIf WorshipID == 8
      NewFavor += PlayerRef.GetLevel() as Float * WSN_ModifyFavor_Divine_Akatosh_FavorPerLevelUp.GetValue()
    ElseIf WorshipID == 44
      Float SkillsMult = WSN_ModifyFavor_Khajiit_RiddleThar_FavorFromMinSkills.GetValue()
      Float AttrMult = WSN_ModifyFavor_Khajiit_RiddleThar_FavorFromMinAttribute.GetValue()
      Float Mage = SkillsMult * WSN_Peryite.GetMage()
      Float Thief = SkillsMult * WSN_Peryite.GetThief()
      Float Warrior = SkillsMult * WSN_Peryite.GetWarrior()
      If Mage > Thief
        If Mage > Warrior
          NewFavor += Mage
        Else
          NewFavor += Warrior
        EndIf
      ElseIf Thief > Warrior
        NewFavor += Thief
      Else
        NewFavor += Warrior
      EndIf
      Mage = AttrMult * PlayerRef.GetBaseActorValue("magicka")
      Thief = AttrMult * PlayerRef.GetBaseActorValue("stamina")
      Warrior = AttrMult * PlayerRef.GetBaseActorValue("health")
      If Mage > Thief
        If Mage > Warrior
          NewFavor += Mage
        Else
          NewFavor += Warrior
        EndIf
      ElseIf Thief > Warrior
        NewFavor += Thief
      Else
        NewFavor += Warrior
      EndIf
    ElseIf WorshipID == 45
      If PlayerRef.IsInFaction(PlayerMarriedFaction)
        NewFavor += WSN_ModifyFavor_Misc_StAlessia_FavorIfHasFollower.GetValue()
      EndIf
    ElseIf WorshipID == 48
      If PlayerFollowerCount.GetValue() > 0 as Float
        NewFavor += WSN_ModifyFavor_Divine_Mara_FavorIfMarried.GetValue()
      EndIf
    EndIf
    If WSN_DynamicStat0[WorshipID]
      NewFavor += (Game.QueryStat(WSN_DynamicStat0[WorshipID]) as Float - DynamicStat0) * WSN_DynamicStat0_Multiplier[WorshipID].GetValue()
    EndIf
    If WSN_DynamicStat1[WorshipID]
      NewFavor += (Game.QueryStat(WSN_DynamicStat1[WorshipID]) as Float - DynamicStat1) * WSN_DynamicStat1_Multiplier[WorshipID].GetValue()
    EndIf
    If WSN_DynamicStat2[WorshipID]
      NewFavor += (Game.QueryStat(WSN_DynamicStat2[WorshipID]) as Float - DynamicStat2) * WSN_DynamicStat2_Multiplier[WorshipID].GetValue()
    EndIf
    NewFavor += FavorChangeQueued
    If WSN_QuestToComplete[WorshipID] as Bool && WSN_QuestToComplete[WorshipID].IsCompleted()
      WSN_QuestIsCompleted[WorshipID] = True
      NewFavor += WSN_Quest_Multiplier[WorshipID].GetValue()
    EndIf
    If WSN_DivineTypeID[WorshipID] == 2 && PlayerRef.HasMagicEffect(WSN_Item_ElvenLamp_Effect_Ench)
      NewFavor *= 1.100000024
    EndIf
    Float Increase = NewFavor - OldFavor
    If Increase > 0.0
      Float BaseIncrease = Increase
      Race PlayerRace = PlayerRef.GetRace()
      ; RCS: recognize configured race proxies for the deity's favored race (empty slots stay unmatched).
      If (WSN_FavoredRace0[WorshipID] != None && RaceCompatibility.GetIsRaceByProxy(PlayerRace, WSN_FavoredRace0[WorshipID])) || (WSN_FavoredRace1[WorshipID] != None && RaceCompatibility.GetIsRaceByProxy(PlayerRace, WSN_FavoredRace1[WorshipID]))
        Increase *= WSN_FavorFavoredRaceMult_Global.GetValue()
      EndIf
      If WSN_StatBuffToGains_Multiplier[WorshipID]
        Increase *= (100.0 + WSN_StatBuffToGains_Multiplier[WorshipID].GetValue() * PlayerRef.GetBaseActorValue(WSN_StatBuffToGains[WorshipID])) / 100.0
      EndIf
      If WorshipID != 24 && WorshipID != 29
        Float ConvictionMultiplier = WSN_ModifyFavor_Shared_GainRateModifierBase.value + WSN_ModifyFavor_Shared_GainRateModifierDay.value * (GameDaysPassed.value - StartDay)
        If ConvictionMultiplier < WSN_ModifyFavor_Shared_GainRateModifierCap.value
          Increase *= ConvictionMultiplier
        Else
          Increase *= WSN_ModifyFavor_Shared_GainRateModifierCap.value
        EndIf
      EndIf
      If OldFavor >= WSN_ThresholdFavored
        Float Range = WSN_FavoredDiminishTarget - WSN_ThresholdFavored
        If OldFavor >= WSN_ThresholdFavored + Range * 0.75
          Increase *= 0.25
        ElseIf OldFavor >= WSN_ThresholdFavored + Range * 0.5
          Increase *= 0.5
        ElseIf OldFavor >= WSN_ThresholdFavored + Range * 0.25
          Increase *= 0.75
        EndIf
      EndIf
      If OldFavor + Increase > WSN_FavoredDiminishTarget
        Increase = WSN_FavoredDiminishTarget - OldFavor
      EndIf
      NewFavor = OldFavor + Increase
      Self.QueueFavorChange(-(BaseIncrease - Increase), False, False)
    EndIf
    If WorshipID == 33
      NewFavor = Utility.RandomFloat(1.0, 150.0)
    EndIf
    NewFavor += WSN_Misc_Global_FavorMod.GetValue()
    Self.SetFavor(NewFavor)
    If NewFavor <= 0 as Float
      If WSN_Misc_Global_DisableAbandon.GetValue() == 0 as Float
        Debug.Notification(WSN_DeityName[WorshipID] + " " + WSN_StringApostasy)
        WSN_Help_Message_Apostasy.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
        Self.EndWorship()
      Else
        NewFavor = 0.0
        Self.SetFavor(NewFavor)
      EndIf
    ElseIf !IsFavored && NewFavor >= WSN_ThresholdFavored
      If abShowStatusMessages || WorshipID == 0
        Debug.Notification(WSN_StringFavored + " " + WSN_DeityName[WorshipID] + " " + WSN_StringFavored2)
        PlayerRef.AddSpell(WSN_Boon2[WorshipID], True)
        PlayerRef.PlaceAtMe(WSN_Explosion as Form, 1, False, False)
        IsFavored = True
        WSN_Help_Message_BecomeFavored.ShowAsHelpMessage("BecomeFavored", 6.0, 9999 as Float, 1)
        Self.QueueFavorChange(5.0, False, False)
        Self.SetFavor(NewFavor + 5.0)
      EndIf
    ElseIf IsFavored && NewFavor < WSN_ThresholdFavored
      Debug.Notification(WSN_StringUnfavored + " " + WSN_DeityName[WorshipID] + " " + WSN_StringUnfavored2)
      PlayerRef.RemoveSpell(WSN_Boon2[WorshipID])
      IsFavored = False
      WSN_Help_Message_BecomeUnfavored.ShowAsHelpMessage("BecomeUnfavored", 6.0, 9999 as Float, 1)
    EndIf
    If abShowStatusMessages
      WSN_FavorDisplay[WorshipID].Show(NewFavor, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    EndIf
  EndIf
  Utility.Wait(2.0)
  WSN_Effect_Global_BlockDecay.SetValue(0 as Float)
EndFunction

Event OnInit()
  Self.RegisterForSingleUpdateGameTime(WSN_UpdateRate * 1 as Float)
EndEvent

Function SetFavor(Float akFavor)
  WSN_Favor_Global.SetValue(akFavor)
  WSN_Favor_Global_Fractional.SetValue(akFavor * 0.100000001)
  WSN_Favor_Global_Fractional2.SetValue(akFavor * 0.300000012)
  WSN_Favor_Global_Fractional3.SetValue(akFavor * 0.200000003)
  WSN_Favor_Global_Fractional4.SetValue(akFavor * 5.0)
  WSN_Favor_Global_FractionalPig.SetValue(akFavor * 0.300000012 / 100 as Float)
  WSN_Favor_Global_FractionalHircine.SetValue(akFavor * 0.200000003 / 100 as Float)
  PlayerRef.ForceActorValue(WSN_AV, akFavor * 0.100000001)
EndFunction

Function QueueFavorChange(Float akFavorChange, Bool abUpdateImmediately, Bool abShowStatusMessages)
  If WorshipID != -1
    FavorChangeQueued += akFavorChange
    If abUpdateImmediately == True
      Self.ProcessFavorChanges(abShowStatusMessages)
    EndIf
  EndIf
EndFunction

Function StartWorship(Int ID)
  If Self.EndWorship()
    WorshipID = ID
    If WSN_DynamicStat0[WorshipID]
      DynamicStat0 = Game.QueryStat(WSN_DynamicStat0[WorshipID]) as Float
    Else
      DynamicStat0 = 0 as Float
    EndIf
    If WSN_DynamicStat1[WorshipID]
      DynamicStat1 = Game.QueryStat(WSN_DynamicStat1[WorshipID]) as Float
    Else
      DynamicStat1 = 0 as Float
    EndIf
    If WSN_DynamicStat2[WorshipID]
      DynamicStat2 = Game.QueryStat(WSN_DynamicStat2[WorshipID]) as Float
    Else
      DynamicStat2 = 0 as Float
    EndIf
    FavorChangeQueued = 0.0
    PlayerRef.AddSpell(WSN_Boon1[WorshipID], True)
    PlayerRef.AddSpell(WSN_Tenet[WorshipID], False)
    If WorshipID != 12
      PlayerRef.AddSpell(WSN_Prayer_Spell, True)
    EndIf
    If WorshipID == 11
      WSN_Effect_Global_MehrunesExplodes.SetValue(0 as Float)
      WSN_Effect_Global_MehrunesExplodesMax.SetValue(40 as Float)
    ElseIf WorshipID == 24
      WSN_Peryite.InitDiseases()
    ElseIf WorshipID == 27
      WSN_Effect_Global_DestinyActivated.SetValue(0 as Float)
    ElseIf WorshipID == 37
      WSN_Effect_Global_RuptgaCounter.SetValue(100 as Float)
    EndIf
    If WorshipID == 12
      WSN_Help_Message_WorshipBasics_Vaermina.ShowAsHelpMessage("WorshipBasicsVaermina", 6.0, 9999 as Float, 1)
    ElseIf WorshipID == 29
      WSN_Help_Message_WorshipBasics_Clavicus.ShowAsHelpMessage("WorshipBasicsClavicus", 6.0, 9999 as Float, 1)
    ElseIf WorshipID == 36 || WorshipID == 37 || WorshipID == 38 || WorshipID == 45
      WSN_Help_Message_WorshipBasics_Yokudan.ShowAsHelpMessage("WorshipBasicsYokudan", 6.0, 9999 as Float, 1)
    Else
      WSN_Help_Message_WorshipBasics.ShowAsHelpMessage("WorshipBasics", 6.0, 9999 as Float, 1)
    EndIf
    GameDayLastDecayed = GameDaysPassed.GetValue()
    WSN_LastUsedFakeGameHours[0] = GameDayLastDecayed
    WSN_LastUsedFakeGameHours[1] = GameDayLastDecayed
    WSN_LastUsedFakeGameHours[2] = GameDayLastDecayed
    WSN_LastUsedFakeGameHours[3] = GameDayLastDecayed
    WSN_LastUsedFakeGameHours[4] = GameDayLastDecayed
    WSN_LastUsedFakeGameHours[5] = GameDayLastDecayed
    WSN_LastUsedFakeGameHours[6] = GameDayLastDecayed
    StartDay = GameDaysPassed.GetValue()
    Float StartingFavor = WSN_FavorBase_Global[WSN_DivineTypeID[WorshipID]].GetValue()
    If StartingFavor < WSN_PreviousFavor[WorshipID] && WSN_DivineTypeID[WorshipID] != 1
      StartingFavor = WSN_PreviousFavor[WorshipID]
      WSN_PreviousFavor[WorshipID] = 0.0
    EndIf
    Self.QueueFavorChange(StartingFavor, True, True)
    WSN_Effect_Global_BlockDecay.SetValue(0 as Float)
    WSN_Spell_Global_DivineType.value = WSN_DivineTypeID[WorshipID] as Float
    WSN_Shrine.MoveTo(PlayerRef as ObjectReference, 0.0, 0.0, 0.0, True)
  EndIf
EndFunction

Function ModFavor(Float akFavor)
  Float Favor = WSN_Favor_Global.GetValue() + akFavor
  Self.SetFavor(Favor)
EndFunction

String Function GetDeityName()
  If WorshipID == -1
    Return WSN_NoDeity
  Else
    Return WSN_DeityName[WorshipID]
  EndIf
EndFunction

Bool Function EndWorship()
  Bool WasClavicus = False
  If WorshipID == 17
    PlayerRef.DispelSpell(WSN_Divine_Kynareth_Boon2_Spell_ProcOnSelf)
  ElseIf WorshipID == 24
    WSN_Cure_Spell.Cast(PlayerRef as ObjectReference, None)
  ElseIf WorshipID == 34
    PlayerRef.DispelSpell(WSN_Redguard_Ruptga_Boon1_Spell_ProcOnSelf)
    WSN_Effect_Global_RuptgaCounter.SetValue(0 as Float)
  ElseIf WorshipID == 29
    WasClavicus = True
  ElseIf WorshipID == 31
    PlayerRef.DispelSpell(WSN_Daedra_Jyggalag_Boon1_Spell_ProcOnSelf)
  ElseIf WorshipID == 40
    WSN_Peryite.ClearTotem()
  ElseIf WorshipID == 47
    PlayerRef.DispelSpell(WSN_Misc_TheHist_Boon1_Spell_ProcOnSelf)
  EndIf
  If WorshipID != -1
    WSN_PreviousFavor[WorshipID] = WSN_Favor_Global.GetValue() * 0.5
    Int ExWorshipID = WorshipID
    WorshipID = -1
    PlayerRef.RemoveSpell(WSN_Boon1[ExWorshipID])
    PlayerRef.RemoveSpell(WSN_Boon2[ExWorshipID])
    PlayerRef.RemoveSpell(WSN_Tenet[ExWorshipID])
    IsFavored = False
    DynamicStat0 = 0.0
    DynamicStat1 = 0.0
    DynamicStat2 = 0.0
    FavorChangeQueued = 0.0
    Self.SetFavor(0 as Float)
    PlayerRef.DispelSpell(WSN_Prayer_Spell)
    PlayerRef.RemoveSpell(WSN_Prayer_Spell)
  EndIf
  If WasClavicus == True
    WSN_Peryite.RemoveClavicus()
  EndIf
  WSN_Spell_Global_DivineType.value = -1 as Float
  Return True
EndFunction

Function CastBlessing()
  If WorshipID != -1
    WSN_Blessing[WorshipID].Cast(PlayerRef as ObjectReference, None)
  EndIf
EndFunction

Event OnUpdateGameTime()
  Self.RegisterForSingleUpdateGameTime(WSN_UpdateRate * 1 as Float)
  If WorshipID != -1
    If WSN_Effect_Global_BlockDecay.GetValue() == 0 as Float
      Float FavorDelta = WSN_FavorDrain_Global.GetValue() * 1 as Float
      FavorDelta *= WSN_DrainRateMult[WSN_DivineTypeID[WorshipID]].GetValue() * WSN_DrainRateMultIndividual[WorshipID]
      If WorshipID == 4
        If PlayerRef.HasMagicEffect(RestedMarriageSkillEffect)
          FavorDelta *= WSN_ModifyFavor_Shared_DrainRateMult_DuringBeneficialBuff.value
        EndIf
      ElseIf WorshipID == 9
        If PlayerRef.HasMagicEffect(RestedMarriageSkillEffect)
          FavorDelta *= WSN_ModifyFavor_Shared_DrainRateMult_DuringBeneficialBuff.value
        EndIf
      ElseIf WorshipID == 16
        If PlayerRef.HasKeyword(Vampire)
          FavorDelta *= WSN_ModifyFavor_Shared_DrainRateMult_DuringBeneficialState.value
        EndIf
      ElseIf WorshipID == 17
        If PlayerRef.HasMagicEffect(MQpathToHHShrineEffect)
          FavorDelta *= WSN_ModifyFavor_Shared_DrainRateMult_DuringBeneficialBuff.value
        EndIf
      ElseIf WorshipID == 25
        If PlayerRef.HasSpell(WerewolfChange as Form) || PlayerRef.HasMagicEffect(WSN_Prayer_Effect_Sit_IsWerewolf)
          FavorDelta *= WSN_ModifyFavor_Shared_DrainRateMult_DuringBeneficialState.value
        EndIf
      ElseIf WorshipID == 45
        If PlayerRef.HasMagicEffect(RestedMarriageSkillEffect)
          FavorDelta *= WSN_ModifyFavor_Shared_DrainRateMult_DuringBeneficialBuff.value
        EndIf
      ElseIf WorshipID == 48
        If PlayerRef.HasEffectKeyword(WSN_MagicBlessing_Keyword_Divine)
          FavorDelta *= WSN_ModifyFavor_Shared_DrainRateMult_DuringBeneficialBuff.value
        EndIf
      EndIf
      If WSN_DivineTypeID[WorshipID] == 1 && PlayerRef.HasMagicEffect(WSN_Item_Hourglass_Effect_Ench)
        FavorDelta *= WSN_HourglassMult
      EndIf
      FavorDelta *= WSN_Misc_Global_DrainMult.GetValue()
      GameDayLastDecayed = GameDaysPassed.GetValue()
      Self.QueueDiminishingFavorChange(FavorDelta, True, 2, False)
    EndIf
    If WSN_LastUsedFakeGameHours[0] + 1.0 < GameDaysPassed.GetValue() && ShowReminder == False
      WSN_Misc_Message_DidNotMeditate.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      ShowReminder = True
    EndIf
  EndIf
EndEvent

Function QueueDiminishingFavorChange(Float akFavorChange, Bool abUpdateImmediately, Int aiLastUsedArrayID, Bool abShowStatusMessages)
  Float TimeSinceLast = GameDaysPassed.GetValue() - WSN_LastUsedFakeGameHours[aiLastUsedArrayID]
  If TimeSinceLast > 1.0
    TimeSinceLast = 1.0
  EndIf
  WSN_LastUsedFakeGameHours[aiLastUsedArrayID] = GameDaysPassed.GetValue()
  Self.QueueFavorChange(akFavorChange * TimeSinceLast, abUpdateImmediately, abShowStatusMessages)
EndFunction

Function Pray()
  Float CurrentHPPct
  If WorshipID == 11
    CurrentHPPct = PlayerRef.GetActorValuePercentage("magicka")
  EndIf
  Float FavorDelta = WSN_FavorMeditation_Global.GetValue() * 1 as Float
  Bool PrayerFailed = False
  If WorshipID == 6
    Float CurrentGameHour = GameHour.GetValue()
    If CurrentGameHour < 4.0 || CurrentGameHour >= 20.0 || CurrentGameHour < 18.0 && CurrentGameHour >= 6.0
      FavorDelta = 0 as Float
      PrayerFailed = True
      WSN_Prayer_Message_Azura_Fail.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    ElseIf Weather.GetSkyMode() == 3
      If Weather.GetCurrentWeather().GetClassification() == 0
        FavorDelta *= WSN_ModifyFavor_Shared_PrayerGainFavorableWeatherSuper.value
        WSN_Prayer_Message_Azura.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      Else
        FavorDelta *= WSN_ModifyFavor_Shared_PrayerGainFavorableWeather.value
      EndIf
    EndIf
  ElseIf WorshipID == 9
    If PlayerRef.WornHasKeyword(VendorItemArmor) || PlayerRef.WornHasKeyword(VendorItemClothing)
      FavorDelta = 0 as Float
      PrayerFailed = True
      WSN_Prayer_Message_Dibella_Fail.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    EndIf
  ElseIf WorshipID == 11
    If CurrentHPPct > 0.5
      FavorDelta = 0 as Float
      WSN_MehrunesMessage[0].Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    ElseIf CurrentHPPct > 0.400000006
      FavorDelta *= 0.25
      WSN_MehrunesMessage[1].Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      WSN_Effect_Global_MehrunesExplodes.SetValue(0 as Float)
      WSN_Effect_Global_MehrunesExplodesMax.SetValue(10 as Float)
    ElseIf CurrentHPPct > 0.300000012
      FavorDelta *= 0.5
      WSN_MehrunesMessage[2].Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      WSN_Effect_Global_MehrunesExplodes.SetValue(0 as Float)
      WSN_Effect_Global_MehrunesExplodesMax.SetValue(20 as Float)
    ElseIf CurrentHPPct > 0.200000003
      FavorDelta *= 0.75
      WSN_MehrunesMessage[3].Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      WSN_Effect_Global_MehrunesExplodes.SetValue(0 as Float)
      WSN_Effect_Global_MehrunesExplodesMax.SetValue(30 as Float)
    Else
      FavorDelta *= 1 as Float
      WSN_MehrunesMessage[4].Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      WSN_Effect_Global_MehrunesExplodes.SetValue(0 as Float)
      WSN_Effect_Global_MehrunesExplodesMax.SetValue(40 as Float)
    EndIf
  ElseIf WorshipID == 12
    If PlayerRef.GetSleepState() > 0
      FavorDelta *= WSN_ModifyFavor_Daedra_Vaermina_MeditationMult.GetValue()
    EndIf
  ElseIf WorshipID == 15
    Float currentgamehour = GameHour.GetValue()
    If currentgamehour >= 5.0 && currentgamehour < 19.0
      FavorDelta = 0 as Float
      PrayerFailed = True
      WSN_Prayer_Message_Nocturnal_Fail.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    ElseIf PlayerRef.GetLightLevel() < 20 as Float
      FavorDelta *= WSN_ModifyFavor_Shared_PrayerGainFavorableWeatherSuper.value
      WSN_Prayer_Message_Nocturnal.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    ElseIf PlayerRef.GetLightLevel() < 40 as Float
      FavorDelta *= WSN_ModifyFavor_Shared_PrayerGainFavorableWeather.value
    EndIf
  ElseIf WorshipID == 17
    If Weather.GetSkyMode() != 3 && !PlayerRef.IsInLocation(HighHrothgarLocation) && !PlayerRef.IsInLocation(WhiterunTempleofKynarethLocation)
      FavorDelta = 0 as Float
      PrayerFailed = True
      WSN_Prayer_Message_Kynareth_Fail.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    EndIf
  ElseIf WorshipID == 24
    WSN_Effect_Global_PeryiteBreathWeaponUsed.SetValue(0 as Float)
    If !PlayerRef.HasMagicEffect(WSN_Prayer_Effect_Sit_Diseased)
      FavorDelta = 0 as Float
      PrayerFailed = True
      WSN_Prayer_Message_Peryite_Fail.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    EndIf
  ElseIf WorshipID == 25
    If !PlayerRef.HasMagicEffect(WSN_Prayer_Effect_Sit_IsInWilderness) && PlayerRef.GetCurrentLocation() != GlenmorilCovenLocation
      FavorDelta = 0 as Float
      PrayerFailed = True
      WSN_Prayer_Message_Hircine_Fail.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    EndIf
  ElseIf WorshipID == 27
    WSN_Effect_Global_DestinyActivated.SetValue(0 as Float)
  ElseIf WorshipID == 29
    FavorDelta == 0 as Float
    PrayerFailed = True
  ElseIf WorshipID == 34
    If PlayerRef.GetItemCount(HumanFlesh as Form) > 0
      PlayerRef.RemoveItem(HumanFlesh as Form, 1, False, None)
    ElseIf PlayerRef.GetItemCount(HumanHeart as Form) > 0
      PlayerRef.RemoveItem(HumanHeart as Form, 1, False, None)
    Else
      WSN_Prayer_Message_Sithis_Fail.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      FavorDelta = 0 as Float
      PrayerFailed = True
    EndIf
  ElseIf WorshipID == 44
    Float currentgamehour = GameHour.GetValue()
    If currentgamehour >= 5.0 && currentgamehour < 19.0
      FavorDelta = 0 as Float
      PrayerFailed = True
      WSN_Prayer_Message_RiddleThar_Fail.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    ElseIf Weather.GetSkyMode() == 3
      If Weather.GetCurrentWeather().GetClassification() == 0
        FavorDelta *= WSN_ModifyFavor_Shared_PrayerGainFavorableWeatherSuper.value
        WSN_Prayer_Message_RiddleThar.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      ElseIf Weather.GetCurrentWeather().GetClassification() == 1
        FavorDelta *= WSN_ModifyFavor_Shared_PrayerGainFavorableWeather.value
      EndIf
    EndIf
  ElseIf WorshipID == 47
    If Weather.GetSkyMode() != 3
      FavorDelta = 0 as Float
      PrayerFailed = True
      WSN_Prayer_Message_TheHist_Fail.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    EndIf
  ElseIf WorshipID == 49
    Float currentgamehour = GameHour.GetValue()
    If currentgamehour >= 5.0 && currentgamehour < 19.0
      FavorDelta = 0 as Float
      PrayerFailed = True
      WSN_Prayer_Message_Mannimarco_Fail.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    EndIf
  ElseIf WorshipID == 50
    If Weather.GetSkyMode() != 3
      FavorDelta = 0 as Float
      PrayerFailed = True
      WSN_Prayer_Message_TheAllMaker_Fail.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    EndIf
  ElseIf WorshipID == 51
    Float currentgamehour = GameHour.GetValue()
    If currentgamehour >= 5.0 && currentgamehour < 19.0 || Weather.GetSkyMode() != 3
      FavorDelta = 0 as Float
      PrayerFailed = True
      WSN_Prayer_Message_TheMagnaGe_Fail.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    ElseIf Weather.GetCurrentWeather().GetClassification() == 0
      FavorDelta *= WSN_ModifyFavor_Shared_PrayerGainFavorableWeatherSuper.value
      WSN_Prayer_Message_TheMagnaGe.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    ElseIf Weather.GetCurrentWeather().GetClassification() == 1
      FavorDelta *= WSN_ModifyFavor_Shared_PrayerGainFavorableWeather.value
    EndIf
  EndIf
  FavorDelta *= WSN_PrayerRateMult[WSN_DivineTypeID[WorshipID]].GetValue() * WSN_PrayerRateMultIndividual[WorshipID]
  FavorDelta *= WSN_Misc_Global_MeditateMult.GetValue()
  If !PrayerFailed
    ShowReminder = False
    Self.QueueDiminishingFavorChange(FavorDelta, True, 0, True)
  EndIf
  WSN_Shrine.MoveTo(PlayerRef as ObjectReference, 0.0, 0.0, 0.0, True)
EndFunction
