;/ Decompiled by Champollion v1.3.2
PEX format v3.2 GameID: 1
Source   : RRR_Debug_Manual_Script.psc
Modified : 2015-10-24 04:19:52
Compiled : 2015-10-24 04:19:54
User     : Maximilian
Computer : MONETA
/;
ScriptName RRR_Debug_Manual_Script Extends activemagiceffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
FormList[] Property RRR_Add_FormList Auto
Race[] Property RRR_Add_Race Auto
Message Property RRR_Debug_Manual_AddRacials Auto
Message Property RRR_Debug_Manual_RemoveRacials Auto
Quest[] Property RRR_RacialQuest Auto
Spell[] Property RRR_RacialQuestSpell Auto
Spell[] Property RRR_RacialQuestSpell2 Auto
FormList Property RRR_Remove_FormList Auto
FormList Property RRR_Remove_FormList_Imperious Auto

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

; RCS
Int Function GetWhichRaceByProxy(Race akRace)
  Int i = RRR_Add_Race.Length - 1
  While i >= 0
    If RaceCompatibility.GetIsRaceByProxy(RRR_Add_Race[i], akRace)
      Return i
    EndIf
    i -= 1
  EndWhile
  Return -1
EndFunction

Event OnEffectStart(Actor akTarget, Actor akCaster)
  Int i = 0
  While i < RRR_Remove_FormList.GetSize()
    Game.GetPlayer().RemoveSpell(RRR_Remove_FormList.GetAt(i) as Spell)
    i += 1
  EndWhile
  i = 0
  While i < RRR_Remove_FormList_Imperious.GetSize()
    Game.GetPlayer().RemoveSpell(RRR_Remove_FormList_Imperious.GetAt(i) as Spell)
    i += 1
  EndWhile
  RRR_Debug_Manual_RemoveRacials.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)

  ; RCS
  ; Int WhichRace = RRR_Add_Race.find(akTarget.GetRace(), 0)
  Int WhichRace = GetWhichRaceByProxy(akTarget.GetRace())

  If WhichRace < 0
    Debug.Notification("IMPERIOUS DEBUG: Unknown player race!")
  Else
    FormList AddFormList = RRR_Add_FormList[WhichRace]
    i = 0
    While i < AddFormList.GetSize()
      Game.GetPlayer().AddSpell(AddFormList.GetAt(i) as Spell, False)
      i += 1
    EndWhile
    If RRR_RacialQuest[WhichRace].IsCompleted()
      Game.GetPlayer().AddSpell(RRR_RacialQuestSpell[WhichRace], False)
      Game.GetPlayer().AddSpell(RRR_RacialQuestSpell2[WhichRace], False)
    EndIf
    RRR_Debug_Manual_AddRacials.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  EndIf
EndEvent
