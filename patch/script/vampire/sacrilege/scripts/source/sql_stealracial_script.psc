;/ Decompiled by Champollion v1.3.2
PEX format v3.2 GameID: 1
Source   : SQL_StealRacial_Script.psc
Modified : 2020-11-15 07:55:30
Compiled : 2020-11-15 07:55:32
User     : maxim
Computer : CANOPUS
/;
ScriptName SQL_StealRacial_Script Extends activemagiceffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
playervampirequestscript Property PlayerVampireQuest Auto
Race[] Property SCS_Race Auto
Spell[] Property SCS_RacialSpell Auto

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

Event OnEffectStart(Actor akTarget, Actor akCaster)
  Race TargetRace = akTarget.GetRace()
  ; RCS: resolve custom races through their configured vanilla race proxy.
  Int i = 0
  Int RaceCount = SCS_Race.Length
  While i < RaceCount && !RaceCompatibility.GetIsRaceByProxy(TargetRace, SCS_Race[i])
    i += 1
  EndWhile
  If i < RaceCount
    Spell NewSpell = SCS_RacialSpell[i]
    If !NewSpell
      Debug.MessageBox("Could not find racial spell!")
    Else
      Spell CurrentSpell = PlayerVampireQuest.GetCurrentSpell()
      If NewSpell != CurrentSpell
        If CurrentSpell
          akCaster.RemoveSpell(CurrentSpell)
        EndIf
        akCaster.AddSpell(NewSpell, True)
        PlayerVampireQuest.SetCurrentSpell(NewSpell)
      EndIf
    EndIf
  EndIf
EndEvent
