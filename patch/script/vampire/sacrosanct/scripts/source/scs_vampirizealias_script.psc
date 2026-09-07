;/ Decompiled by Champollion v1.3.2
PEX format v3.2 GameID: 1
Source   : SCS_VampirizeAlias_Script.psc
Modified : 2018-02-25 19:16:38
Compiled : 2018-02-25 19:16:39
User     : Maximilian
Computer : MARUNAE
/;
ScriptName SCS_VampirizeAlias_Script Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Race Property ArgonianRace Auto
Faction Property CurrentFollowerFaction Auto
Faction Property DLC1ThrallFaction Auto
Faction Property DLC1VampireFeedNoCrimeFaction Auto
textureset Property EyesMaleHumanVampire Auto
Race Property KhajiitRace Auto
Faction Property PlayerAllegianceFaction Auto
Faction Property PotentialFollowerFaction Auto
Faction Property PotentialMarriageFaction Auto
Spell[] Property SCS_Drain Auto
Spell[] Property SCS_Other Auto
textureset Property SkinEyesKhajiitVampire Auto
textureset Property SkinEyesMaleArgonianVampire Auto
Spell Property VampirePoisonResist Auto
Spell Property VampireVampirism Auto

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

Event OnLoad()
  Utility.Wait(4.0)
  Actor TheTarget = Self.GetActorReference()
  Race TargetBaseRace = TheTarget.GetActorBase().GetRace()
  ; RCS: select vampire eyes from the configured head-part type.
  If RaceCompatibility.GetIsHeadPartTypeByRace(TargetBaseRace, 1)
    TheTarget.SetEyeTexture(SkinEyesMaleArgonianVampire)
  ElseIf RaceCompatibility.GetIsHeadPartTypeByRace(TargetBaseRace, 9)
    TheTarget.SetEyeTexture(SkinEyesKhajiitVampire)
  Else
    TheTarget.SetEyeTexture(EyesMaleHumanVampire)
  EndIf
  TheTarget.AddSpell(VampirePoisonResist, True)
  TheTarget.AddSpell(VampireVampirism, True)
EndEvent

Function OnAttachedToCell_disabled()
  Utility.Wait(4.0)
  Actor TheTarget = Self.GetActorReference()
  Race TargetBaseRace = TheTarget.GetActorBase().GetRace()
  ; RCS: select vampire eyes from the configured head-part type.
  If RaceCompatibility.GetIsHeadPartTypeByRace(TargetBaseRace, 1)
    TheTarget.SetEyeTexture(SkinEyesMaleArgonianVampire)
  ElseIf RaceCompatibility.GetIsHeadPartTypeByRace(TargetBaseRace, 9)
    TheTarget.SetEyeTexture(SkinEyesKhajiitVampire)
  Else
    TheTarget.SetEyeTexture(EyesMaleHumanVampire)
  EndIf
  TheTarget.AddSpell(VampirePoisonResist, True)
  TheTarget.AddSpell(VampireVampirism, True)
EndFunction
