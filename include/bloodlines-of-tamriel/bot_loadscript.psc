;/ Decompiled by Champollion v1.3.2
PEX format v3.2 GameID: 1
Source   : BOT_LoadScript.psc
Modified : 2020-12-09 06:58:59
Compiled : 2020-12-09 06:59:01
User     : jason
Computer : DESKTOP-M44FDDJ
/;
ScriptName BOT_LoadScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Spell Property ABVampireSkills Auto
Spell Property ABVampireSkills02 Auto
Spell Property AbVampire01 Auto
Spell Property AbVampire01b Auto
Spell Property AbVampire02 Auto
Spell Property AbVampire02b Auto
Spell Property AbVampire03 Auto
Spell Property AbVampire03b Auto
Spell Property AbVampire04 Auto
Spell Property AbVampire04b Auto
LeveledItem Property BOTLoot_VampireBloodPotions Auto
Perk Property BOTPerk_Weakness_Silver_1 Auto
Spell Property BOTSpell_Ability_Strength_Waterbreathing Auto
Spell Property BOTSpell_Ability_Weakness_NoMagickRegen_VLFlight Auto
Spell Property BOTSpell_Ability_Weakness_NoStaminaRegen_VLMelee Auto
Spell Property BOTSpell_Ability_Weakness_ShrineDamage Auto
Spell Property BOTSpell_Ability_Weakness_TrespDamagePerk Auto
Spell Property BOTSpell_LesserPower_ConfigMenu Auto
GlobalVariable Property BOTVar_MasterVampire Auto
GlobalVariable Property BOTVar_ModVersion Auto
GlobalVariable Property BOTVar_VampireBloodPoints Auto
GlobalVariable Property BOTVar_VampireLordHate Auto
Perk Property DLC1CorpseCursePerk Auto
Perk Property DLC1DetectLifePerk Auto
Perk Property DLC1GargoylePerk Auto
Perk Property DLC1MistFormPerk Auto
Perk Property DLC1NightCloakPerk Auto
Perk Property DLC1PoisonTalons Auto
Perk Property DLC1PowerOfTheGrave Auto
Perk Property DLC1SupernaturalReflexesPerk Auto
Perk Property DLC1UnearthlyWill Auto
GlobalVariable Property DLC1VampireBloodPoints Auto
GlobalVariable Property DLC1VampireNextPerk Auto
GlobalVariable Property DLC1VampirePerkPoints Auto
GlobalVariable Property DLC1VampireTotalPerksEarned Auto
Perk Property DLC1VampiricBite Auto
Perk Property DLC1VampiricGrip Auto
LeveledItem Property LootVampireRandom Auto
Actor Property PlayerRef Auto
playervampirequestscript Property PlayerVampireQuest Auto
Keyword Property Vampire Auto
Spell Property VampireDrain01 Auto
Spell Property VampireDrain02 Auto
Spell Property VampireDrain03 Auto
Spell Property VampireDrain04 Auto
Spell Property VampireHuntersSight Auto
Spell Property VampireInvisibilityPC Auto
Spell Property VampireRaiseThrall01 Auto
Spell Property VampireRaiseThrall02 Auto
Spell Property VampireRaiseThrall03 Auto
Spell Property VampireRaiseThrall04 Auto
Spell Property VampireSunDamage01 Auto
Spell Property VampireSunDamage02 Auto
Spell Property VampireSunDamage03 Auto
Spell Property VampireSunDamage04 Auto

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

Event OnInit()
  If skse.GetVersionRelease() > 0
    
  Else
    PlayerRef.AddSpell(BOTSpell_LesserPower_ConfigMenu, False)
  EndIf
  PlayerRef.removeperk(DLC1PowerOfTheGrave)
  PlayerRef.removeperk(DLC1DetectLifePerk)
  PlayerRef.removeperk(DLC1MistFormPerk)
  PlayerRef.removeperk(DLC1SupernaturalReflexesPerk)
  PlayerRef.removeperk(DLC1VampiricBite)
  PlayerRef.removeperk(DLC1UnearthlyWill)
  PlayerRef.removeperk(DLC1PoisonTalons)
  PlayerRef.removeperk(DLC1NightCloakPerk)
  PlayerRef.removeperk(DLC1VampiricGrip)
  PlayerRef.removeperk(DLC1GargoylePerk)
  PlayerRef.removeperk(DLC1CorpseCursePerk)
  PlayerRef.RemoveSpell(ABVampireSkills)
  PlayerRef.RemoveSpell(ABVampireSkills02)
  PlayerRef.RemoveSpell(AbVampire01)
  PlayerRef.RemoveSpell(AbVampire02)
  PlayerRef.RemoveSpell(AbVampire03)
  PlayerRef.RemoveSpell(AbVampire04)
  PlayerRef.RemoveSpell(AbVampire01b)
  PlayerRef.RemoveSpell(AbVampire02b)
  PlayerRef.RemoveSpell(AbVampire03b)
  PlayerRef.RemoveSpell(AbVampire04b)
  PlayerRef.RemoveSpell(VampireDrain01)
  PlayerRef.RemoveSpell(VampireDrain02)
  PlayerRef.RemoveSpell(VampireDrain03)
  PlayerRef.RemoveSpell(VampireDrain04)
  PlayerRef.RemoveSpell(VampireRaiseThrall01)
  PlayerRef.RemoveSpell(VampireRaiseThrall02)
  PlayerRef.RemoveSpell(VampireRaiseThrall03)
  PlayerRef.RemoveSpell(VampireRaiseThrall04)
  PlayerRef.RemoveSpell(VampireSunDamage01)
  PlayerRef.RemoveSpell(VampireSunDamage02)
  PlayerRef.RemoveSpell(VampireSunDamage03)
  PlayerRef.RemoveSpell(VampireSunDamage04)
  PlayerRef.RemoveSpell(VampireInvisibilityPC)
  DLC1VampirePerkPoints.setValue(0 as Float)
  DLC1VampireTotalPerksEarned.setValue(0 as Float)
  LootVampireRandom.AddForm(BOTLoot_VampireBloodPotions as Form, 1, 1)
  DLC1VampireNextPerk.setValue(500 as Float)
  DLC1VampireBloodPoints.setValue(0 as Float)
  If PlayerRef.Haskeyword(Vampire)
    If PlayerRef.HasSpell(BOTSpell_Ability_Strength_Waterbreathing as Form)
      
    Else
      Self.DefaultSettings()
      Self.FirstLoad()
    EndIf
  Else
    Self.DefaultSettings()
  EndIf
EndEvent

Function FirstLoad()
  If PlayerRef.Haskeyword(Vampire)
    PlayerVampireQuest.VampireChange(PlayerRef)
  EndIf
EndFunction

Function DefaultSettings()
  PlayerRef.AddSpell(BOTSpell_Ability_Weakness_NoStaminaRegen_VLMelee, False)
  PlayerRef.AddSpell(BOTSpell_Ability_Weakness_NoMagickRegen_VLFlight, False)
  PlayerRef.AddPerk(BOTPerk_Weakness_Silver_1)
EndFunction
