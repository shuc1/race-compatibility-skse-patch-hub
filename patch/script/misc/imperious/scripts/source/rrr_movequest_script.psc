;/ Decompiled by Champollion v1.3.2
PEX format v3.2 GameID: 1
Source   : RRR_MoveQuest_Script.psc
Modified : 2015-10-23 03:43:22
Compiled : 2015-10-23 03:43:23
User     : Maximilian
Computer : MONETA
/;
ScriptName RRR_MoveQuest_Script Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Race Property RRR_PlayerRace1 Auto
Race Property RRR_PlayerRace2 Auto
GlobalVariable Property RRR_QuestPointsGathered_Global Auto
GlobalVariable Property RRR_QuestPoints_Class_Global Auto

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

Function MoveQuest(Float aiAmount)
  Race PlayerRace = Game.GetPlayer().GetRace()
  ; If PlayerRace == RRR_PlayerRace1 || PlayerRace == RRR_PlayerRace2
  If RaceCompatibility.GetIsRaceByProxy(PlayerRace, RRR_PlayerRace1) || RaceCompatibility.GetIsRaceByProxy(PlayerRace, RRR_PlayerRace2)
    If Self.GetStage() == 0
      Self.SetStage(20)
    EndIf
    If Self.ModObjectiveGlobal(aiAmount, RRR_QuestPointsGathered_Global, 20, RRR_QuestPoints_Class_Global.GetValue(), True, True, True)
      Self.SetStage(200)
    EndIf
  EndIf
EndFunction
