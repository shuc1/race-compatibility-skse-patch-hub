;/ Decompiled by Champollion v1.3.2
PEX format v3.2 GameID: 1
Source   : RRR_SpiritWalk_Script.psc
Modified : 2015-10-23 03:24:14
Compiled : 2015-10-23 03:24:15
User     : Maximilian
Computer : MONETA
/;
ScriptName RRR_SpiritWalk_Script Extends activemagiceffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Race Property BretonRace Auto
Race Property BretonRaceVampire Auto
Sound Property MAGFail Auto
Actor Property PlayerRef Auto
Sound Property RRR_Dunmer_SpiritWalk_Marker Auto
Message Property RRR_Dunmer_SpiritWalk_Message_Fail Auto
Spell[] Property RRR_Dunmer_SpiritWalk_Proc Auto
GlobalVariable Property RRR_WhispersCount_Global Auto

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

Event OnEffectStart(Actor akTarget, Actor akCaster)
  Int SummonCount
  RRR_Dunmer_SpiritWalk_Marker.Play(akTarget as ObjectReference)
  If akTarget == PlayerRef
    If RRR_WhispersCount_Global.GetValue() >= 2 as Float
      RRR_Dunmer_SpiritWalk_Proc[Utility.RandomInt(0, RRR_Dunmer_SpiritWalk_Proc.Length - 1)].Cast(akTarget as ObjectReference, None)
      RRR_Dunmer_SpiritWalk_Proc[Utility.RandomInt(0, RRR_Dunmer_SpiritWalk_Proc.Length - 1)].Cast(akTarget as ObjectReference, None)
      RRR_WhispersCount_Global.Mod(-2 as Float)
    ; ElseIf PlayerRef.GetRace() == BretonRace || PlayerRef.GetRace() == BretonRaceVampire
    ElseIf RaceCompatibility.GetIsRaceByProxy(PlayerRef.GetRace(), BretonRace) || RaceCompatibility.GetIsRaceByProxy(PlayerRef.GetRace(), BretonRaceVampire)
      RRR_Dunmer_SpiritWalk_Proc[Utility.RandomInt(0, RRR_Dunmer_SpiritWalk_Proc.Length - 1)].Cast(akTarget as ObjectReference, None)
      RRR_Dunmer_SpiritWalk_Proc[Utility.RandomInt(0, RRR_Dunmer_SpiritWalk_Proc.Length - 1)].Cast(akTarget as ObjectReference, None)
    Else
      RRR_Dunmer_SpiritWalk_Message_Fail.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      MAGFail.Play(PlayerRef as ObjectReference)
    EndIf
  Else
    RRR_Dunmer_SpiritWalk_Proc[Utility.RandomInt(0, RRR_Dunmer_SpiritWalk_Proc.Length - 1)].Cast(akTarget as ObjectReference, None)
  EndIf
EndEvent
