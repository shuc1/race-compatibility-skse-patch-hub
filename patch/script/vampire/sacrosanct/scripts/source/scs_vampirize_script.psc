;/ Decompiled by Champollion v1.3.2
PEX format v3.2 GameID: 1
Source   : SCS_Vampirize_Script.psc
Modified : 2018-02-25 18:18:25
Compiled : 2018-02-25 18:18:27
User     : Maximilian
Computer : MARUNAE
/;
ScriptName SCS_Vampirize_Script Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Race Property ArgonianRace Auto
Faction Property CurrentFollowerFaction Auto
Faction Property DLC1ThrallFaction Auto
Faction Property DLC1VampireFeedNoCrimeFaction Auto
textureset Property EyesMaleHumanVampire Auto
Race Property KhajiitRace Auto
Race Property NordRace Auto
Faction Property PlayerAllegianceFaction Auto
Faction Property PotentialFollowerFaction Auto
Faction Property PotentialMarriageFaction Auto
ReferenceAlias[] Property SCS_Alias Auto
Bool Property SCS_AlsoChangeRace Auto
Spell[] Property SCS_Drain Auto
Float Property SCS_LvlDiv Auto
GlobalVariable Property SCS_Mechanics_Global_ForceUniqueCheck Auto
GlobalVariable Property SCS_Mechanics_Global_FosterChilde_TickerTape Auto
Message Property SCS_Mechanics_Message_FosterChilde Auto
scs_futil_script Property SCS_NewGhoulify_Quest Auto
Spell[] Property SCS_Other Auto
FormList Property SCS_Races Auto
FormList Property SCS_RacesVampire Auto
Spell Property SCS_VampireSpells_Vanilla_Power_Spell_Nightwalk_StaggerSelf Auto
textureset Property SkinEyesKhajiitVampire Auto
textureset Property SkinEyesMaleArgonianVampire Auto
Spell Property VampirePoisonResist Auto
Spell Property VampireVampirism Auto

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

Event OnEffectStart(Actor akTarget, Actor akCaster)
  SCS_Mechanics_Message_FosterChilde.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  akTarget.StopCombat()
  Race TargetBaseRace = akTarget.GetActorBase().GetRace()
  ; RCS: select vampire eyes from the configured head-part type.
  If RaceCompatibility.GetIsHeadPartTypeByRace(TargetBaseRace, 1)
    akTarget.SetEyeTexture(SkinEyesMaleArgonianVampire)
  ElseIf RaceCompatibility.GetIsHeadPartTypeByRace(TargetBaseRace, 9)
    akTarget.SetEyeTexture(SkinEyesKhajiitVampire)
  Else
    akTarget.SetEyeTexture(EyesMaleHumanVampire)
  EndIf
  If SCS_AlsoChangeRace
    ; RCS: use the configured vampire counterpart, preserving the upstream Nord fallback.
    Race TargetVampireRace = RaceCompatibility.GetVampireRaceByRace(TargetBaseRace)
    If TargetVampireRace == None
      Debug.Trace(("SACROSANCT ERROR: Vampirize target " + akTarget as String) + " race unknown, turning into Nord Vampire.", 0)
      Int RaceID = SCS_Races.Find(NordRace as Form)
      TargetVampireRace = SCS_RacesVampire.GetAt(RaceID) as Race
    EndIf
    akTarget.SetRace(TargetVampireRace)
  Else
    akTarget.AddSpell(VampirePoisonResist, True)
    akTarget.AddSpell(VampireVampirism, True)
  EndIf
  SCS_VampireSpells_Vanilla_Power_Spell_Nightwalk_StaggerSelf.Cast(akTarget as ObjectReference, None)
  akTarget.AddToFaction(PlayerAllegianceFaction)
  If !akTarget.IsInFaction(CurrentFollowerFaction) && ((SCS_Mechanics_Global_ForceUniqueCheck.GetValue() == 0 as Float) || akTarget.GetActorBase().IsUnique())
    akTarget.SetRelationshipRank(akCaster, 4)
    akCaster.SetRelationshipRank(akTarget, 4)
    akTarget.AddToFaction(PotentialFollowerFaction)
    akTarget.AddToFaction(PotentialMarriageFaction)
  EndIf
  SCS_NewGhoulify_Quest.FactionTame(akTarget)
  Int TargetLevel = (akTarget.GetLevel() as Float / SCS_LvlDiv) as Int
  If TargetLevel >= SCS_Drain.Length
    akTarget.AddSpell(SCS_Drain[SCS_Drain.Length - 1], True)
  Else
    akTarget.AddSpell(SCS_Drain[TargetLevel], True)
  EndIf
  Int i = 0
  While i < SCS_Other.Length
    akTarget.AddSpell(SCS_Other[i], True)
    i += 1
  EndWhile
  SCS_Alias[SCS_Mechanics_Global_FosterChilde_TickerTape.GetValue() as Int].ForceRefTo(akTarget as ObjectReference)
  SCS_Mechanics_Global_FosterChilde_TickerTape.Mod(1 as Float)
  If SCS_Mechanics_Global_FosterChilde_TickerTape.GetValue() >= SCS_Alias.Length as Float
    SCS_Mechanics_Global_FosterChilde_TickerTape.SetValue(0 as Float)
  EndIf
EndEvent
