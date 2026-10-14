;/ Decompiled by Champollion v1.3.2
PEX format v3.2 GameID: 1
Source   : WSN_Peryite_Script.psc
Modified : 2026-09-23 01:42:30
Compiled : 2026-09-23 01:42:31
User     : maxim
Computer : BRICK
/;
ScriptName WSN_Peryite_Script Extends Quest

;-- Variables ---------------------------------------
Int DispelOldID = -1
Float EndLocX
Float EndLocY
Int HitRate
Bool MagnusInProcess = False
Float MaxMana
Int PracticeSpell = -1
Int PracticeSpellCost = -1
ObjectReference SithisDoor
Bool SkipJudging = False
Int StartingStatOld = -1
Float TargetAngleZ
Float TargetPosX
Float TargetPosY
Float TargetPosZ
ObjectReference TheNode
ObjectReference TheNode2
Int TotemID = -1

;-- Properties --------------------------------------
Race Property ArgonianRace Auto
Race Property ArgonianRaceVampire Auto
Race Property BretonRace Auto
Race Property BretonRaceVampire Auto
Int Property ClavicusID = -1 Auto
Race Property DarkElfRace Auto
Race Property DarkElfRaceVampire Auto
Bool Property HideDeityMenu = False Auto
Race Property HighElfRace Auto
Race Property HighElfRaceVampire Auto
Race Property ImperialRace Auto
Race Property ImperialRaceVampire Auto
Race Property KhajiitRace Auto
Race Property KhajiitRaceVampire Auto
Sound Property MAGFail Auto
Race Property NordRace Auto
Race Property NordRaceVampire Auto
Race Property OrcRace Auto
Race Property OrcRaceVampire Auto
Actor Property PlayerRef Auto
Race Property RedguardRace Auto
Race Property RedguardRaceVampire Auto
Float Property SithisDoorX Auto
Float Property SithisDoorY Auto
Float Property SithisDoorZ Auto
Int Property StartingStat = -1 Auto
Int[] Property WSN_Count Auto
FormList[] Property WSN_Daedra_Sheogorath_Boon1_Formlist_Spells Auto
Int[] Property WSN_DeityMap_Argonian Auto
Int[] Property WSN_DeityMap_Breton Auto
Int[] Property WSN_DeityMap_DarkElf Auto
Int[] Property WSN_DeityMap_HighElf Auto
Int[] Property WSN_DeityMap_Imperial Auto
Int[] Property WSN_DeityMap_Khajiit Auto
Int[] Property WSN_DeityMap_Nord Auto
Int[] Property WSN_DeityMap_Orc Auto
Int[] Property WSN_DeityMap_Redguard Auto
Int[] Property WSN_DeityMap_WoodElf Auto
Int[] Property WSN_Difference Auto
Spell[] Property WSN_Disease Auto
Float Property WSN_DistanceInFront Auto
GlobalVariable Property WSN_Effect_Global_InitialPickInProgress Auto
Message Property WSN_Effects_Message_Clavicus_Pact_Accept Auto
Message Property WSN_Effects_Message_Magnus_MagicalPractice_Accuracy Auto
Message Property WSN_Fail Auto
GlobalVariable Property WSN_Favor_Global Auto
Message Property WSN_FreeDeity_Message Auto
Message Property WSN_FreeDeity_Message_Argonian Auto
Message Property WSN_FreeDeity_Message_Breton Auto
Message Property WSN_FreeDeity_Message_DarkElf Auto
Message Property WSN_FreeDeity_Message_HighElf Auto
Message Property WSN_FreeDeity_Message_Imperial Auto
Message Property WSN_FreeDeity_Message_Khajiit Auto
Message Property WSN_FreeDeity_Message_Nord Auto
Message Property WSN_FreeDeity_Message_Orc Auto
Message Property WSN_FreeDeity_Message_Redguard Auto
Message Property WSN_FreeDeity_Message_WoodElf Auto
Float Property WSN_GainFavor Auto
Float Property WSN_Height Auto
Float Property WSN_LoseFavor Auto
String[] Property WSN_Mage Auto
Float Property WSN_ManaCap Auto
String Property WSN_Message0 Auto
String Property WSN_Message1 Auto
Spell Property WSN_Misc_Sithis_Boon2_Spell_ProcOnSelf_Nova Auto
GlobalVariable Property WSN_ModifyFavor_Misc_Magnus_FavorPerMagicalPracticeSuccess Auto
ImageSpaceModifier Property WSN_PactImod Auto
Sound Property WSN_PactSound Auto
FormList Property WSN_Peryite_Formlist Auto
Message[] Property WSN_PickDialog Auto
Explosion[] Property WSN_PracticeExplosion Auto
Explosion[] Property WSN_PracticeExplosionFail Auto
Float[] Property WSN_PracticeScale Auto
Activator[] Property WSN_PracticeSpellActivator Auto
Static[] Property WSN_PracticeSpell_Static Auto
Message Property WSN_Prayer_Message_Clavicus Auto
Message Property WSN_Prayer_Message_Clavicus_Fail Auto
Message Property WSN_Prayer_Message_Magnus_MagicalPractice_Dialog Auto
Message Property WSN_Prayer_Message_Magnus_MagicalPractice_End Auto
Message[] Property WSN_Progress Auto
Message[] Property WSN_QueryMessage Auto
Spell[] Property WSN_QuerySpell Auto
String[] Property WSN_QueryStat Auto
Float Property WSN_SheogorathCap Auto
String[] Property WSN_Thief Auto
Spell[] Property WSN_TotemSpells Auto
wsn_trackerquest_quest Property WSN_TrackerQuest Auto
String[] Property WSN_Warrior Auto
Race Property WoodElfRace Auto
Race Property WoodElfRaceVampire Auto

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

Function DispelUltimatumClavicus()
  Int ID
  If DispelOldID != -1
    Int CurrentStat = Game.QueryStat(WSN_QueryStat[DispelOldID])
    If CurrentStat - StartingStatOld >= WSN_Difference[DispelOldID]
      If !SkipJudging
        WSN_TrackerQuest.QueueFavorChange(WSN_GainFavor, True, True)
        WSN_Prayer_Message_Clavicus.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      EndIf
    ElseIf !SkipJudging
      WSN_TrackerQuest.QueueFavorChange(-WSN_LoseFavor, True, True)
      WSN_Prayer_Message_Clavicus_Fail.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    EndIf
    DispelOldID = -1
    StartingStatOld = -1
  Else
    If WSN_TrackerQuest.WorshipID == 29
      Int currentstat = Game.QueryStat(WSN_QueryStat[ClavicusID])
      If currentstat - StartingStat >= WSN_Difference[ClavicusID]
        If !SkipJudging
          WSN_TrackerQuest.QueueFavorChange(WSN_GainFavor, True, True)
          WSN_Prayer_Message_Clavicus.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
        EndIf
      ElseIf !SkipJudging
        WSN_TrackerQuest.QueueFavorChange(-WSN_LoseFavor, True, True)
        WSN_Prayer_Message_Clavicus_Fail.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      EndIf
    EndIf
    ClavicusID = -1
    StartingStat = -1
  EndIf
  SkipJudging = False
EndFunction

Function ReceiveFreeDeity()
  If !HideDeityMenu
    Race PlayerRace = PlayerRef.GetRace()
    Int choice = -1
    ; RCS: recognize configured race proxies in addition to the vanilla races.
    If RaceCompatibility.GetIsRaceByProxy(PlayerRace, HighElfRace) || RaceCompatibility.GetIsRaceByProxy(PlayerRace, HighElfRaceVampire)
      WSN_FreeDeity_Message.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      While choice < WSN_DeityMap_HighElf.Length
        choice = WSN_FreeDeity_Message_HighElf.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
        If choice != WSN_DeityMap_HighElf.Length && Self.ShowPickDialog(WSN_DeityMap_HighElf[choice])
          choice = 999
        EndIf
      EndWhile
    ElseIf RaceCompatibility.GetIsRaceByProxy(PlayerRace, ArgonianRace) || RaceCompatibility.GetIsRaceByProxy(PlayerRace, ArgonianRaceVampire)
      WSN_FreeDeity_Message.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      While choice < WSN_DeityMap_Argonian.Length
        choice = WSN_FreeDeity_Message_Argonian.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
        If choice != WSN_DeityMap_Argonian.Length && Self.ShowPickDialog(WSN_DeityMap_Argonian[choice])
          choice = 999
        EndIf
      EndWhile
    ElseIf RaceCompatibility.GetIsRaceByProxy(PlayerRace, WoodElfRace) || RaceCompatibility.GetIsRaceByProxy(PlayerRace, WoodElfRaceVampire)
      WSN_FreeDeity_Message.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      While choice < WSN_DeityMap_WoodElf.Length
        choice = WSN_FreeDeity_Message_WoodElf.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
        If choice != WSN_DeityMap_WoodElf.Length && Self.ShowPickDialog(WSN_DeityMap_WoodElf[choice])
          choice = 999
        EndIf
      EndWhile
    ElseIf RaceCompatibility.GetIsRaceByProxy(PlayerRace, BretonRace) || RaceCompatibility.GetIsRaceByProxy(PlayerRace, BretonRaceVampire)
      WSN_FreeDeity_Message.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      While choice < WSN_DeityMap_Breton.Length
        choice = WSN_FreeDeity_Message_Breton.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
        If choice != WSN_DeityMap_Breton.Length && Self.ShowPickDialog(WSN_DeityMap_Breton[choice])
          choice = 999
        EndIf
      EndWhile
    ElseIf RaceCompatibility.GetIsRaceByProxy(PlayerRace, DarkElfRace) || RaceCompatibility.GetIsRaceByProxy(PlayerRace, DarkElfRaceVampire)
      WSN_FreeDeity_Message.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      While choice < WSN_DeityMap_DarkElf.Length
        choice = WSN_FreeDeity_Message_DarkElf.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
        If choice != WSN_DeityMap_DarkElf.Length && Self.ShowPickDialog(WSN_DeityMap_DarkElf[choice])
          choice = 999
        EndIf
      EndWhile
    ElseIf RaceCompatibility.GetIsRaceByProxy(PlayerRace, ImperialRace) || RaceCompatibility.GetIsRaceByProxy(PlayerRace, ImperialRaceVampire)
      WSN_FreeDeity_Message.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      While choice < WSN_DeityMap_Imperial.Length
        choice = WSN_FreeDeity_Message_Imperial.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
        If choice != WSN_DeityMap_Imperial.Length && Self.ShowPickDialog(WSN_DeityMap_Imperial[choice])
          choice = 999
        EndIf
      EndWhile
    ElseIf RaceCompatibility.GetIsRaceByProxy(PlayerRace, KhajiitRace) || RaceCompatibility.GetIsRaceByProxy(PlayerRace, KhajiitRaceVampire)
      WSN_FreeDeity_Message.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      While choice < WSN_DeityMap_Khajiit.Length
        choice = WSN_FreeDeity_Message_Khajiit.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
        If choice != WSN_DeityMap_Khajiit.Length && Self.ShowPickDialog(WSN_DeityMap_Khajiit[choice])
          choice = 999
        EndIf
      EndWhile
    ElseIf RaceCompatibility.GetIsRaceByProxy(PlayerRace, NordRace) || RaceCompatibility.GetIsRaceByProxy(PlayerRace, NordRaceVampire)
      WSN_FreeDeity_Message.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      While choice < WSN_DeityMap_Nord.Length
        choice = WSN_FreeDeity_Message_Nord.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
        If choice != WSN_DeityMap_Nord.Length && Self.ShowPickDialog(WSN_DeityMap_Nord[choice])
          choice = 999
        EndIf
      EndWhile
    ElseIf RaceCompatibility.GetIsRaceByProxy(PlayerRace, OrcRace) || RaceCompatibility.GetIsRaceByProxy(PlayerRace, OrcRaceVampire)
      WSN_FreeDeity_Message.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      While choice < WSN_DeityMap_Orc.Length
        choice = WSN_FreeDeity_Message_Orc.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
        If choice != WSN_DeityMap_Orc.Length && Self.ShowPickDialog(WSN_DeityMap_Orc[choice])
          choice = 999
        EndIf
      EndWhile
    ElseIf RaceCompatibility.GetIsRaceByProxy(PlayerRace, RedguardRace) || RaceCompatibility.GetIsRaceByProxy(PlayerRace, RedguardRaceVampire)
      WSN_FreeDeity_Message.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      While choice < WSN_DeityMap_Redguard.Length
        choice = WSN_FreeDeity_Message_Redguard.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
        If choice != WSN_DeityMap_Redguard.Length && Self.ShowPickDialog(WSN_DeityMap_Redguard[choice])
          choice = 999
        EndIf
      EndWhile
    Else
      ; RCS: unchanged upstream fallback for races RCS does not manage.
      WSN_FreeDeity_Message.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      While choice < WSN_DeityMap_Imperial.Length
        choice = WSN_FreeDeity_Message_Imperial.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
        If choice != WSN_DeityMap_Imperial.Length && Self.ShowPickDialog(WSN_DeityMap_Imperial[choice])
          choice = 999
        EndIf
      EndWhile
    EndIf
  EndIf
EndFunction

Function EndMagnusPractice()
  WSN_Prayer_Message_Magnus_MagicalPractice_End.Show(HitRate as Float, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  WSN_TrackerQuest.QueueDiminishingFavorChange(WSN_ModifyFavor_Misc_Magnus_FavorPerMagicalPracticeSuccess.GetValue() * HitRate as Float, True, 5, True)
  MagnusInProcess = False
  PlayerRef.RestoreActorValue("Magicka", 9999 as Float)
  TheNode.Delete()
  TheNode2.Delete()
EndFunction

Function CommitToClavicus()
  If WSN_Effects_Message_Clavicus_Pact_Accept.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) == 0
    If ClavicusID != -1
      DispelOldID = ClavicusID
      StartingStatOld = StartingStat
      PlayerRef.DispelSpell(WSN_QuerySpell[DispelOldID])
    EndIf
    ClavicusID = Utility.RandomInt(0, WSN_QueryStat.Length - 1)
    WSN_QuerySpell[ClavicusID].Cast(PlayerRef as ObjectReference, None)
    StartingStat = Game.QueryStat(WSN_QueryStat[ClavicusID])
    WSN_QueryMessage[ClavicusID].Show(WSN_Difference[ClavicusID] as Float, (WSN_Difference[ClavicusID] + StartingStat) as Float, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    WSN_PactImod.Apply(1.0)
    WSN_PactSound.Play(PlayerRef as ObjectReference)
  EndIf
EndFunction

Function InitDiseases()
  WSN_Peryite_Formlist.Revert()
  Int i = 0
  While i < WSN_Count.Length - 1
    WSN_Count[i] = 0
    i += 1
  EndWhile
EndFunction

Function AddDisease(Int ID)
  WSN_Count[ID] = WSN_Count[ID] + 1
EndFunction

Function RemoveDisease(Int ID)
  WSN_Count[ID] = WSN_Count[ID] - 1
EndFunction

Bool Function ShowPickDialog(Int DeityID)
  If WSN_TrackerQuest.WorshipID != DeityID
    Int choice = WSN_PickDialog[DeityID].Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    If choice == 0
      WSN_Effect_Global_InitialPickInProgress.value = 0 as Float
      WSN_TrackerQuest.StartWorship(DeityID)
      Return True
    Else
      Return False
    EndIf
  EndIf
EndFunction

Function ApplyDiseasesTo(Actor akTarget)
  Int i = 0
  Int j = 0
  While i < WSN_Disease.Length - 1
    j = 0
    While j < WSN_Count[i]
      akTarget.AddSpell(WSN_Disease[i], True)
      j += 1
    EndWhile
    i += 1
  EndWhile
EndFunction

Function StartMagnusPractice()
  WSN_Prayer_Message_Magnus_MagicalPractice_Dialog.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  MagnusInProcess = True
  HitRate = 0
  TargetAngleZ = PlayerRef.GetAngleZ()
  TargetPosX = PlayerRef.GetPositionX()
  TargetPosY = PlayerRef.GetPositionY()
  TargetPosZ = PlayerRef.GetPositionZ()
  EndLocX = WSN_DistanceInFront * Math.Sin(TargetAngleZ)
  EndLocY = WSN_DistanceInFront * Math.Cos(TargetAngleZ)
  Self.DoMagnusPracticeSpawn()
EndFunction

Function PollClavicus()
  If ClavicusID != -1
    Int CurrentStat = Game.QueryStat(WSN_QueryStat[ClavicusID])
    If CurrentStat - StartingStat >= WSN_Difference[ClavicusID]
      PlayerRef.DispelSpell(WSN_QuerySpell[ClavicusID])
    Else
      WSN_Progress[ClavicusID].Show((CurrentStat - StartingStat) as Float, WSN_Difference[ClavicusID] as Float, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    EndIf
  EndIf
EndFunction

Float Function GetMage()
  Float value = PlayerRef.GetBaseActorValue(WSN_Mage[0]) + PlayerRef.GetBaseActorValue(WSN_Mage[1]) + PlayerRef.GetBaseActorValue(WSN_Mage[2]) + PlayerRef.GetBaseActorValue(WSN_Mage[3]) + PlayerRef.GetBaseActorValue(WSN_Mage[4]) + PlayerRef.GetBaseActorValue(WSN_Mage[5]) - 90.0
  If value < 0 as Float
    Return 0 as Float
  Else
    Return value
  EndIf
EndFunction

Function ClearTotem()
  If TotemID != -1
    PlayerRef.RemoveSpell(WSN_TotemSpells[TotemID])
  EndIf
EndFunction

Function SheogorathCast()
  Int HopperChoice = Utility.RandomInt(0, 2)
  If HopperChoice < 2 && Utility.RandomFloat(0 as Float, WSN_SheogorathCap) < WSN_Favor_Global.value
    HopperChoice += 1
  EndIf
  FormList Hopper = WSN_Daedra_Sheogorath_Boon1_Formlist_Spells[HopperChoice]
  Int SpellID = Utility.RandomInt(0, Hopper.GetSize() - 1)
  Spell SpellToCast = Hopper.GetAt(SpellID) as Spell
  SpellToCast.Cast(PlayerRef as ObjectReference, None)
EndFunction

Float Function GetTotal()
  Return Self.GetMage() + Self.GetThief() + Self.GetWarrior()
EndFunction

Function TryMagnusPractice()
  TheNode.Delete()
  If PlayerRef.GetActorValue("Magicka") >= PracticeSpellCost as Float
    PlayerRef.DamageActorValue("Magicka", PracticeSpellCost as Float)
    If PlayerRef.GetActorValuePercentage("Magicka") < 0.050000001
      HitRate += 2
      WSN_Effects_Message_Magnus_MagicalPractice_Accuracy.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    Else
      HitRate += 1
    EndIf
    TheNode2.PlaceAtMe(WSN_PracticeExplosion[PracticeSpell] as Form, 1, False, False)
    TheNode2.Delete()
  Else
    PlayerRef.DamageActorValue("Magicka", PracticeSpellCost as Float)
    MAGFail.Play(PlayerRef as ObjectReference)
    TheNode2.Delete()
    WSN_Fail.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    HitRate -= 1
  EndIf
  If MagnusInProcess
    Self.DoMagnusPracticeSpawn()
  EndIf
EndFunction

Function DoMagnusPracticeSpawn()
  PlayerRef.RestoreActorValue("Magicka", 1.0)
  Int TargetMaxMana = (PlayerRef.GetActorValue("Magicka") / PlayerRef.GetActorValuePercentage("Magicka")) as Int
  If TargetMaxMana as Float > WSN_ManaCap
    MaxMana = WSN_ManaCap
  Else
    MaxMana = TargetMaxMana as Float
  EndIf
  Int ActivatorID = Utility.RandomInt((MaxMana * 0.200000003) as Int, (MaxMana * 0.600000024) as Int) / 10
  PracticeSpellCost = (ActivatorID + 1) * 10
  PracticeSpell = Utility.RandomInt(0, WSN_PracticeSpell_Static.Length - 1)
  TheNode = PlayerRef.PlaceAtMe(WSN_PracticeSpellActivator[ActivatorID] as Form, 1, False, True)
  TheNode2 = PlayerRef.PlaceAtMe(WSN_PracticeSpell_Static[PracticeSpell] as Form, 1, False, True)
  TheNode.SetPosition(TargetPosX + EndLocX, TargetPosY + EndLocY, TargetPosZ + WSN_Height)
  TheNode2.SetPosition(TargetPosX + EndLocX, TargetPosY + EndLocY, TargetPosZ + WSN_Height)
  TheNode2.SetScale(0.5)
  TheNode.Enable(False)
  TheNode2.Enable(False)
EndFunction

Function SetTotem(Int ID)
  If TotemID != -1
    PlayerRef.RemoveSpell(WSN_TotemSpells[TotemID])
  EndIf
  TotemID = ID
  PlayerRef.AddSpell(WSN_TotemSpells[TotemID], True)
EndFunction

Function SetSithisDoor(ObjectReference akTargetRef)
  SithisDoor = akTargetRef
  SithisDoorX = akTargetRef.GetPositionX()
  SithisDoorY = akTargetRef.GetPositionY()
  SithisDoorZ = akTargetRef.GetPositionZ()
  WSN_Misc_Sithis_Boon2_Spell_ProcOnSelf_Nova.Cast(akTargetRef, None)
EndFunction

Float Function GetThief()
  Float value = PlayerRef.GetBaseActorValue(WSN_Thief[0]) + PlayerRef.GetBaseActorValue(WSN_Thief[1]) + PlayerRef.GetBaseActorValue(WSN_Thief[2]) + PlayerRef.GetBaseActorValue(WSN_Thief[3]) + PlayerRef.GetBaseActorValue(WSN_Thief[4]) + PlayerRef.GetBaseActorValue(WSN_Thief[5]) - 90.0
  If value < 0 as Float
    Return 0 as Float
  Else
    Return value
  EndIf
EndFunction

Float Function GetWarrior()
  Float value = PlayerRef.GetBaseActorValue(WSN_Warrior[0]) + PlayerRef.GetBaseActorValue(WSN_Warrior[1]) + PlayerRef.GetBaseActorValue(WSN_Warrior[2]) + PlayerRef.GetBaseActorValue(WSN_Warrior[3]) + PlayerRef.GetBaseActorValue(WSN_Warrior[4]) + PlayerRef.GetBaseActorValue(WSN_Warrior[5]) - 90.0
  If value < 0 as Float
    Return 0 as Float
  Else
    Return value
  EndIf
EndFunction

Bool Function GiveRandomDisease(Actor akTarget)
  If WSN_Peryite_Formlist.GetSize() < WSN_Disease.Length
    Int ID = Utility.RandomInt(0, WSN_Disease.Length - 1)
    While WSN_Peryite_Formlist.Find(WSN_Disease[ID] as Form) > -1
      ID = Utility.RandomInt(0, WSN_Disease.Length - 1)
    EndWhile
    akTarget.AddSpell(WSN_Disease[ID], True)
    WSN_Peryite_Formlist.AddForm(WSN_Disease[ID] as Form)
    Return True
  Else
    Return False
  EndIf
EndFunction

Bool Function Tempt(Int DeityID, GlobalVariable akTemptation)
  If WSN_TrackerQuest.WorshipID != DeityID
    If akTemptation.value == 0 as Float
      akTemptation.value = 1 as Float
      Int choice = WSN_PickDialog[DeityID].Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      If choice == 0
        WSN_Effect_Global_InitialPickInProgress.value = 0 as Float
        WSN_TrackerQuest.StartWorship(DeityID)
        Return True
      Else
        Return False
      EndIf
    EndIf
  EndIf
EndFunction

Function RemoveClavicus()
  If ClavicusID != -1
    DispelOldID = ClavicusID
    StartingStatOld = StartingStat
    ClavicusID = -1
    StartingStat = -1
    SkipJudging = True
    PlayerRef.DispelSpell(WSN_QuerySpell[DispelOldID])
  EndIf
EndFunction
