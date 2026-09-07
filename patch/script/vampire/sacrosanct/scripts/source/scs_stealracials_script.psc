;/ Decompiled by Champollion v1.3.2
PEX format v3.2 GameID: 1
Source   : SCS_StealRacials_Script.psc
Modified : 2016-11-16 06:55:18
Compiled : 2016-11-17 06:22:08
User     : Maximilian
Computer : MARUNAE
/;
ScriptName SCS_StealRacials_Script Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Spell Property SCS_Abilities_Racial_Spell_Altmer_Proc Auto
Spell Property SCS_Abilities_Racial_Spell_Altmer_Proc_Long Auto
Spell Property SCS_Abilities_Racial_Spell_Khajiit_Spell Auto
Spell Property SCS_Abilities_Racial_Spell_Nord_Spell Auto
Spell Property SCS_Abilities_Racial_Spell_OrcNew_Proc Auto
Spell Property SCS_Abilities_Racial_Spell_OrcNew_Proc_Long Auto
Race[] Property SCS_Race Auto
Spell[] Property SCS_RacialEnum Auto
Spell[] Property SCS_RacialSpell Auto

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

Event OnEffectStart(Actor akTarget, Actor akCaster)
  ; RCS: resolve custom races through their configured vanilla race proxy.
  Race TargetRace = akTarget.GetRace()
  Int i = 0
  Int RaceCount = SCS_Race.Length
  While i < RaceCount && !RaceCompatibility.GetIsRaceByProxy(TargetRace, SCS_Race[i])
    i += 1
  EndWhile
  If i < RaceCount
    Int j = 0
    While j < SCS_RacialEnum.Length
      akCaster.RemoveSpell(SCS_RacialEnum[j])
      j += 1
    EndWhile
    akCaster.AddSpell(SCS_RacialSpell[i], True)
    If i == 4 || i == 5
      If akTarget.GetSleepState() < 3
        SCS_Abilities_Racial_Spell_Altmer_Proc.Cast(akCaster as ObjectReference, None)
      Else
        SCS_Abilities_Racial_Spell_Altmer_Proc_Long.Cast(akCaster as ObjectReference, None)
      EndIf
    ElseIf i == 12 || i == 13
      If akTarget.GetSleepState() < 3
        SCS_Abilities_Racial_Spell_OrcNew_Proc.Cast(akCaster as ObjectReference, None)
      Else
        SCS_Abilities_Racial_Spell_OrcNew_Proc_Long.Cast(akCaster as ObjectReference, None)
      EndIf
    EndIf
  EndIf
EndEvent
