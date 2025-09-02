;/ Decompiled by Champollion v1.3.2
PEX format v3.2 GameID: 1
Source   : RRR_SharedAncestry_Script.psc
Modified : 2015-10-24 06:29:05
Compiled : 2015-10-24 06:29:06
User     : Maximilian
Computer : MONETA
/;
ScriptName RRR_SharedAncestry_Script Extends activemagiceffect

;-- Variables ---------------------------------------
Int RaceID

;-- Properties --------------------------------------
FormList[] Property RRR_Breton_SharedAncestry_FormList_Spells Auto
Race[] Property RRR_Race Auto

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

; RCS
Int Function GetRaceIDByProxy(Race akRace)
  Int i = RRR_Race.Length - 1
  While i >= 0
    If RaceCompatibility.GetIsRaceByProxy(RRR_Race[i], akRace)
      Return i
    EndIf
    i -= 1
  EndWhile
  Return -1
EndFunction

Event OnEffectStart(Actor akTarget, Actor akCaster)
  ; Race TargetRace = akCaster.GetRace()
  ; RaceID = RRR_Race.find(TargetRace, 0)
  RaceID = GetRaceIDByProxy(akCaster.GetRace())
  If RaceID != -1
    FormList SpellList = RRR_Breton_SharedAncestry_FormList_Spells[RaceID]
    Int i = 0
    While i < SpellList.GetSize()
      Spell TheSpell = SpellList.GetAt(i) as Spell
      If i == 0
        akTarget.AddSpell(TheSpell, True)
      Else
        akTarget.AddSpell(TheSpell, False)
      EndIf
      i += 1
    EndWhile
  Else
    Debug.Notification("IMPERIOUS ERROR: Invalid target race!")
    Self.Dispel()
  EndIf
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
  If RaceID != -1
    FormList SpellList = RRR_Breton_SharedAncestry_FormList_Spells[RaceID]
    Int i = 0
    While i < SpellList.GetSize()
      Spell TheSpell = SpellList.GetAt(i) as Spell
      akTarget.RemoveSpell(TheSpell)
      i += 1
    EndWhile
  EndIf
EndEvent
