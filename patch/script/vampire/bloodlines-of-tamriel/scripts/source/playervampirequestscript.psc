;/ Decompiled by Champollion v1.3.2
PEX format v3.2 GameID: 1
Source   : PlayerVampireQuestScript.psc
Modified : 2020-12-14 06:48:03
Compiled : 2020-12-14 06:48:05
User     : jason
Computer : DESKTOP-M44FDDJ
/;
ScriptName PlayerVampireQuestScript Extends Quest conditional

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
WorldSpace Property AlftandWorld Auto
Race Property ArgonianRace Auto
Race Property ArgonianRaceVampire Auto
ActorBase Property BOTActor_VampireHunter_Dawnguard_Boss01 Auto
ActorBase Property BOTActor_VampireHunter_Dawnguard_Boss02 Auto
ActorBase Property BOTActor_VampireHunter_Dawnguard_Boss03 Auto
ActorBase Property BOTActor_VampireHunter_Dawnguard_Boss04 Auto
ActorBase Property BOTActor_VampireHunter_Dawnguard_Boss05 Auto
ActorBase Property BOTActor_VampireHunter_Dawnguard_Husky01 Auto
ActorBase Property BOTActor_VampireHunter_Dawnguard_Husky02 Auto
ActorBase Property BOTActor_VampireHunter_Dawnguard_Mage01 Auto
ActorBase Property BOTActor_VampireHunter_Dawnguard_Mage02 Auto
ActorBase Property BOTActor_VampireHunter_Dawnguard_Mage03 Auto
ActorBase Property BOTActor_VampireHunter_Dawnguard_Mage04 Auto
ActorBase Property BOTActor_VampireHunter_Dawnguard_Melee01 Auto
ActorBase Property BOTActor_VampireHunter_Dawnguard_Melee02 Auto
ActorBase Property BOTActor_VampireHunter_Dawnguard_Melee03 Auto
ActorBase Property BOTActor_VampireHunter_Dawnguard_Melee04 Auto
ActorBase Property BOTActor_VampireHunter_Dawnguard_Ranged01 Auto
ActorBase Property BOTActor_VampireHunter_Dawnguard_Ranged02 Auto
ActorBase Property BOTActor_VampireHunter_Dawnguard_Ranged03 Auto
ActorBase Property BOTActor_VampireHunter_Dawnguard_Ranged04 Auto
ActorBase Property BOTActor_VampireHunter_Dawnguard_Troll01 Auto
ActorBase Property BOTActor_VampireHunter_Dawnguard_Troll02 Auto
ActorBase Property BOTActor_VampireHunter_VoS_Boss_01 Auto
ActorBase Property BOTActor_VampireHunter_VoS_Boss_02 Auto
ActorBase Property BOTActor_VampireHunter_VoS_Melee_01 Auto
ActorBase Property BOTActor_VampireHunter_VoS_Melee_02 Auto
ActorBase Property BOTActor_VampireHunter_VoS_Melee_03 Auto
ActorBase Property BOTActor_VampireHunter_VoS_Melee_04 Auto
MagicEffect Property BOTEffect_Spell_Racial_Bosmer_LifedrainHealth Auto
MagicEffect Property BOTEffect_Spell_Racial_Breton_ManaLeech Auto
Message Property BOTMessage_CustomRace_BeastRaces Auto
Message Property BOTMessage_CustomRace_ElfRaces Auto
Message Property BOTMessage_CustomRace_HumanRaces Auto
Message Property BOTMessage_CustomRace_Other Auto
Message Property BOTMessage_CustomRace_StartMenu Auto
MiscObject Property BOTMisc_BloodPotionEmpty Auto
Perk Property BOTPerk_Ability_BloodExtraction Auto
Perk Property BOTPerk_Ability_CorpseFeeding Auto
Perk Property BOTPerk_Ability_VampireCharmScale Auto
Perk Property BOTPerk_Ability_Volkihar_BloodPack Auto
Perk Property BOTPerk_Buff_LevelSpellScale Auto
Perk Property BOTPerk_Buff_StageSpellScale Auto
Perk Property BOTPerk_Racial_Breton_BloodMastery Auto
Perk Property BOTPerk_Racial_Dunmer_AshSkin Auto
Perk Property BOTPerk_Racial_Imperial_ImperialInfluence Auto
Perk Property BOTPerk_Racial_Khajiit_FerociousTeeth Auto
Perk Property BOTPerk_Racial_Khajiit_KeenEye Auto
Perk Property BOTPerk_Racial_Orc_BerserkersStrength Auto
Quest Property BOTQuest_VampireKeywords Auto
Spell Property BOTSpell_Ability_Dummy_VampireStage01 Auto
Spell Property BOTSpell_Ability_Dummy_VampireStage02 Auto
Spell Property BOTSpell_Ability_Dummy_VampireStage03 Auto
Spell Property BOTSpell_Ability_Dummy_VampireStage04 Auto
Spell Property BOTSpell_Ability_Dummy_VampireStage05 Auto
Spell Property BOTSpell_Ability_Racial_Argonian_Pescatarian Auto
Spell Property BOTSpell_Ability_Racial_Nord_DrunkardApply Auto
Spell Property BOTSpell_Ability_Racial_Sunborn Auto
Spell Property BOTSpell_Ability_Racial_WetScalesTrigger Auto
Spell Property BOTSpell_Ability_Strenght_VampiricSpeed_Stage01 Auto
Spell Property BOTSpell_Ability_Strenght_VampiricSpeed_Stage02 Auto
Spell Property BOTSpell_Ability_Strenght_VampiricSpeed_Stage03 Auto
Spell Property BOTSpell_Ability_Strenght_VampiricSpeed_Stage04 Auto
Spell Property BOTSpell_Ability_Strenght_VampiricSpeed_Stage05 Auto
Spell Property BOTSpell_Ability_Strength_FortifyAttackDamage_Stage01 Auto
Spell Property BOTSpell_Ability_Strength_FortifyAttackDamage_Stage02 Auto
Spell Property BOTSpell_Ability_Strength_FortifyAttackDamage_Stage03 Auto
Spell Property BOTSpell_Ability_Strength_FortifyAttackDamage_Stage04 Auto
Spell Property BOTSpell_Ability_Strength_FortifyAttackDamage_Stage05 Auto
Spell Property BOTSpell_Ability_Strength_FortifyHealRate_Stage01 Auto
Spell Property BOTSpell_Ability_Strength_FortifyHealRate_Stage02 Auto
Spell Property BOTSpell_Ability_Strength_FortifyHealRate_Stage03 Auto
Spell Property BOTSpell_Ability_Strength_FortifyHealRate_Stage04 Auto
Spell Property BOTSpell_Ability_Strength_FortifyHealRate_Stage05 Auto
Spell Property BOTSpell_Ability_Strength_FortifyIceMagic_Stage01 Auto
Spell Property BOTSpell_Ability_Strength_FortifyIceMagic_Stage02 Auto
Spell Property BOTSpell_Ability_Strength_FortifyIceMagic_Stage03 Auto
Spell Property BOTSpell_Ability_Strength_FortifyIceMagic_Stage04 Auto
Spell Property BOTSpell_Ability_Strength_FortifyIceMagic_Stage05 Auto
Spell Property BOTSpell_Ability_Strength_FortifyIllusion_Stage01 Auto
Spell Property BOTSpell_Ability_Strength_FortifyIllusion_Stage02 Auto
Spell Property BOTSpell_Ability_Strength_FortifyIllusion_Stage03 Auto
Spell Property BOTSpell_Ability_Strength_FortifyIllusion_Stage04 Auto
Spell Property BOTSpell_Ability_Strength_FortifyIllusion_Stage05 Auto
Spell Property BOTSpell_Ability_Strength_FortifyJump Auto
Spell Property BOTSpell_Ability_Strength_FortifyMelee_Stage01 Auto
Spell Property BOTSpell_Ability_Strength_FortifyMelee_Stage02 Auto
Spell Property BOTSpell_Ability_Strength_FortifyMelee_Stage03 Auto
Spell Property BOTSpell_Ability_Strength_FortifyMelee_Stage04 Auto
Spell Property BOTSpell_Ability_Strength_FortifyMelee_Stage05 Auto
Spell Property BOTSpell_Ability_Strength_FortifySneak_Stage01 Auto
Spell Property BOTSpell_Ability_Strength_FortifySneak_Stage02 Auto
Spell Property BOTSpell_Ability_Strength_FortifySneak_Stage03 Auto
Spell Property BOTSpell_Ability_Strength_FortifySneak_Stage04 Auto
Spell Property BOTSpell_Ability_Strength_FortifySneak_Stage05 Auto
Spell Property BOTSpell_Ability_Strength_ResistNormalWeapons_Stage01 Auto
Spell Property BOTSpell_Ability_Strength_ResistNormalWeapons_Stage02 Auto
Spell Property BOTSpell_Ability_Strength_ResistNormalWeapons_Stage03 Auto
Spell Property BOTSpell_Ability_Strength_ResistNormalWeapons_Stage04 Auto
Spell Property BOTSpell_Ability_Strength_ResistNormalWeapons_Stage05 Auto
Spell Property BOTSpell_Ability_Strength_ResistanceFrost_Stage01 Auto
Spell Property BOTSpell_Ability_Strength_ResistanceFrost_Stage02 Auto
Spell Property BOTSpell_Ability_Strength_ResistanceFrost_Stage03 Auto
Spell Property BOTSpell_Ability_Strength_ResistanceFrost_Stage04 Auto
Spell Property BOTSpell_Ability_Strength_ResistanceFrost_Stage05 Auto
Spell Property BOTSpell_Ability_Strength_Waterbreathing Auto
Spell Property BOTSpell_Ability_Volkihar_Frostborn Auto
Spell Property BOTSpell_Ability_Volkihar_FrostbornWhiteout Auto
Spell Property BOTSpell_Ability_Weakness_BloodHungry Auto
Spell Property BOTSpell_Ability_Weakness_ResistanceFire_Stage01 Auto
Spell Property BOTSpell_Ability_Weakness_ResistanceFire_Stage02 Auto
Spell Property BOTSpell_Ability_Weakness_ResistanceFire_Stage03 Auto
Spell Property BOTSpell_Ability_Weakness_ResistanceFire_Stage04 Auto
Spell Property BOTSpell_Ability_Weakness_ResistanceFire_Stage05 Auto
Spell Property BOTSpell_Ability_Weakness_ShrineDamage Auto
Spell Property BOTSpell_Ability_Weakness_SilverDamageEquip Auto
Spell Property BOTSpell_Ability_Weakness_SunDamage_Stage001 Auto
Spell Property BOTSpell_Ability_Weakness_SunDamage_Stage002 Auto
Spell Property BOTSpell_Ability_Weakness_SunDamage_Stage003 Auto
Spell Property BOTSpell_Ability_Weakness_SunDamage_Stage004 Auto
Spell Property BOTSpell_Ability_Weakness_SunDamage_Stage005 Auto
Spell Property BOTSpell_Ability_Weakness_SunDamage_Stage01 Auto
Spell Property BOTSpell_Ability_Weakness_SunDamage_Stage02 Auto
Spell Property BOTSpell_Ability_Weakness_SunDamage_Stage03 Auto
Spell Property BOTSpell_Ability_Weakness_SunDamage_Stage04 Auto
Spell Property BOTSpell_Ability_Weakness_SunDamage_Stage05 Auto
Spell Property BOTSpell_Ability_Weakness_SunRegen_Stage01 Auto
Spell Property BOTSpell_Ability_Weakness_SunRegen_Stage02 Auto
Spell Property BOTSpell_Ability_Weakness_SunRegen_Stage03 Auto
Spell Property BOTSpell_Ability_Weakness_SunRegen_Stage04 Auto
Spell Property BOTSpell_Ability_Weakness_SunRegen_Stage05 Auto
Spell Property BOTSpell_Ability_Weakness_TrespDamage Auto
Spell Property BOTSpell_Ability_Weakness_TrespDamagePerk Auto
Spell Property BOTSpell_Power_VampireRaiseThrall_Stage01 Auto
Spell Property BOTSpell_Power_VampireRaiseThrall_Stage02 Auto
Spell Property BOTSpell_Power_VampireRaiseThrall_Stage03 Auto
Spell Property BOTSpell_Power_VampireRaiseThrall_Stage04 Auto
Spell Property BOTSpell_Power_VampireRaiseThrall_Stage05 Auto
Spell Property BOTSpell_Power_Volkihar_IcyBreath Auto
Spell Property BOTSpell_Power_Volkihar_Whiteout Auto
Spell Property BOTSpell_Spell_Destruction_VampireDrain Auto
Spell Property BOTSpell_Spell_Dummy_NoBloodExtraction Auto
Spell Property BOTSpell_Spell_FeedParalyse Auto
Spell Property BOTSpell_Spell_Feed_Animal_Bear_Buff Auto
Spell Property BOTSpell_Spell_Feed_Animal_Bear_Debuff Auto
Spell Property BOTSpell_Spell_Feed_Animal_Boar_Buff Auto
Spell Property BOTSpell_Spell_Feed_Animal_Boar_Debuff Auto
Spell Property BOTSpell_Spell_Feed_Animal_Canine_Buff Auto
Spell Property BOTSpell_Spell_Feed_Animal_Canine_Debuff Auto
Spell Property BOTSpell_Spell_Feed_Animal_Chicken_Buff Auto
Spell Property BOTSpell_Spell_Feed_Animal_Chicken_Debuff Auto
Spell Property BOTSpell_Spell_Feed_Animal_Deer_Buff Auto
Spell Property BOTSpell_Spell_Feed_Animal_Deer_Debuff Auto
Spell Property BOTSpell_Spell_Feed_Animal_Goat_Buff Auto
Spell Property BOTSpell_Spell_Feed_Animal_Goat_Debuff Auto
Spell Property BOTSpell_Spell_Feed_Animal_Horker_Buff Auto
Spell Property BOTSpell_Spell_Feed_Animal_Horker_Debuff Auto
Spell Property BOTSpell_Spell_Feed_Animal_Horse_Buff Auto
Spell Property BOTSpell_Spell_Feed_Animal_Horse_Debuff Auto
Spell Property BOTSpell_Spell_Feed_Animal_Mammoth_Buff Auto
Spell Property BOTSpell_Spell_Feed_Animal_Mammoth_Debuff Auto
Spell Property BOTSpell_Spell_Feed_Animal_Rabbit_Buff Auto
Spell Property BOTSpell_Spell_Feed_Animal_Rabbit_Debuff Auto
Spell Property BOTSpell_Spell_Feed_Animal_Sabrecat_Buff Auto
Spell Property BOTSpell_Spell_Feed_Animal_Sabrecat_Debuff Auto
Spell Property BOTSpell_Spell_Feed_Animal_Skeever_Buff Auto
Spell Property BOTSpell_Spell_Feed_Animal_Skeever_Debuff Auto
Spell Property BOTSpell_Spell_Feed_Animal_Troll_Buff Auto
Spell Property BOTSpell_Spell_Feed_Animal_Troll_Debuff Auto
Spell Property BOTSpell_Spell_Feed_Animal_Werewolf Auto
Spell Property BOTSpell_Spell_Feed_Human_Argonian Auto
Spell Property BOTSpell_Spell_Feed_Human_Breton Auto
Spell Property BOTSpell_Spell_Feed_Human_DarkElf Auto
Spell Property BOTSpell_Spell_Feed_Human_Falmer_Buff Auto
Spell Property BOTSpell_Spell_Feed_Human_Falmer_Debuff Auto
Spell Property BOTSpell_Spell_Feed_Human_Giant_Buff Auto
Spell Property BOTSpell_Spell_Feed_Human_Giant_Debuff Auto
Spell Property BOTSpell_Spell_Feed_Human_HighElf Auto
Spell Property BOTSpell_Spell_Feed_Human_Imperial Auto
Spell Property BOTSpell_Spell_Feed_Human_Khajiit Auto
Spell Property BOTSpell_Spell_Feed_Human_Nord Auto
Spell Property BOTSpell_Spell_Feed_Human_Orc Auto
Spell Property BOTSpell_Spell_Feed_Human_Redguard Auto
Spell Property BOTSpell_Spell_Feed_Human_Vampire Auto
Spell Property BOTSpell_Spell_Feed_Human_WoodElf Auto
Spell Property BOTSpell_Spell_Racial_Bosmer_Lifedrain Auto
Spell Property BOTSpell_Spell_Racial_Breton_ManaLeech Auto
Spell Property BOTSpell_Spell_Racial_DarkElf_BloodPowered Auto
Spell Property BOTSpell_Spell_Racial_HighElf_ManaAddict Auto
Spell Property BOTSpell_Spell_Racial_Orc_Bloodrage Auto
Spell Property BOTSpell_Spell_Racial_Redguard_BloodDoping Auto
Spell Property BOTSpell_Spell_Starvation Auto
GlobalVariable Property BOTVar_AnimalFeeding Auto
GlobalVariable Property BOTVar_AnimalFeedingPotions Auto
GlobalVariable Property BOTVar_BloodPotionBottles Auto
GlobalVariable Property BOTVar_CustomAppearance Auto
GlobalVariable Property BOTVar_FeedMult Auto
GlobalVariable Property BOTVar_FeedParalyse Auto
GlobalVariable Property BOTVar_FeedingProgression Auto
GlobalVariable Property BOTVar_FeedingProgressionFeedingCount Auto
GlobalVariable Property BOTVar_FeedingProgressionFeedingCountMax Auto
GlobalVariable Property BOTVar_FeedingProgressionStage Auto
GlobalVariable Property BOTVar_ForceDrain Auto
GlobalVariable Property BOTVar_ForceDrainCheck Auto
GlobalVariable Property BOTVar_PlayerRace Auto
GlobalVariable Property BOTVar_RacialBosmer_LifedrainTotal Auto
GlobalVariable Property BOTVar_RacialBreton_MagickaTotal Auto
GlobalVariable Property BOTVar_RacialNord_AlcoholPercentageBody Auto
GlobalVariable Property BOTVar_RacialNord_Status Auto
GlobalVariable Property BOTVar_ResistDraining Auto
GlobalVariable Property BOTVar_ResistFeeding Auto
GlobalVariable Property BOTVar_StageCheck Auto
GlobalVariable Property BOTVar_StageProgression Auto
GlobalVariable Property BOTVar_StageProgressionSpeed Auto
GlobalVariable Property BOTVar_Starvation Auto
GlobalVariable Property BOTVar_StarvationCheck Auto
GlobalVariable Property BOTVar_Stats_FeastCounter Auto
GlobalVariable Property BOTVar_Stats_FeedCounter Auto
GlobalVariable Property BOTVar_Strength_FortifyAttackDamage Auto
GlobalVariable Property BOTVar_Strength_FortifyHealRate Auto
GlobalVariable Property BOTVar_Strength_FortifyIceMagic Auto
GlobalVariable Property BOTVar_Strength_FortifyIllusion Auto
GlobalVariable Property BOTVar_Strength_FortifyJump Auto
GlobalVariable Property BOTVar_Strength_FortifySneak Auto
GlobalVariable Property BOTVar_Strength_FortifySpeed Auto
GlobalVariable Property BOTVar_Strength_FortifyStrength Auto
GlobalVariable Property BOTVar_Strength_ResistanceFrost Auto
GlobalVariable Property BOTVar_Strength_ResistanceNormalWeapons Auto
GlobalVariable Property BOTVar_VampireAnimalBloodPoints Auto
GlobalVariable Property BOTVar_VampireBloodPoints Auto
GlobalVariable Property BOTVar_VampireClan Auto
GlobalVariable Property BOTVar_VampireCreateRace Auto
GlobalVariable Property BOTVar_VampireHate Auto
Int Property BOTVar_VampireHuntersTreshold Auto
Int Property BOTVar_VampireHuntersTresholdRNG Auto
GlobalVariable Property BOTVar_VampireHunters_Dawnguard Auto
GlobalVariable Property BOTVar_VampireHunters_VoS Auto
GlobalVariable Property BOTVar_VampireLordStage Auto
GlobalVariable Property BOTVar_VampireStage Auto
GlobalVariable Property BOTVar_Weakness_BloodHungry Auto
GlobalVariable Property BOTVar_Weakness_Fire Auto
GlobalVariable Property BOTVar_Weakness_ShrineDamage Auto
GlobalVariable Property BOTVar_Weakness_Silver Auto
GlobalVariable Property BOTVar_Weakness_SilverDamageEquip_Damage Auto
GlobalVariable Property BOTVar_Weakness_SunDamage Auto
GlobalVariable Property BOTVar_Weakness_SunDamage_Damage Auto
GlobalVariable Property BOTVar_Weakness_SunRegen Auto
GlobalVariable Property BOTVar_Weakness_TrespDamage Auto
GlobalVariable Property BOTVar_Weakness_TrespDamage_Damage Auto
WorldSpace Property Blackreach Auto
WorldSpace Property BlindCliffCaveWorld Auto
Potion[] Property BloodPotionAnimalList Auto
Potion[] Property BloodPotionHumanList Auto
Race Property BretonRace Auto
Race Property BretonRaceVampire Auto
WorldSpace Property BrineWaterGrottoWorld Auto
Idle Property CheckCorpse Auto
Race Property CureRace Auto
Faction Property CurrentFollowerFaction Auto
Spell Property DLC1RaiseZombieRightHand Auto
Spell Property DLC1SeranaDrain02 Auto
GlobalVariable Property DLC1VampireBloodPoints Auto
Spell Property DLC1VampireChange Auto
FormList Property DLC1VampireHateFactions Auto
GlobalVariable Property DLC1VampireMaxPerks Auto
GlobalVariable Property DLC1VampireNextPerk Auto
Message Property DLC1VampirePerkEarned Auto
GlobalVariable Property DLC1VampirePerkPoints Auto
GlobalVariable Property DLC1VampireTotalPerksEarned Auto
dlc1vampireturnscript Property DLC1VampireTurn Auto
Spell Property DLC2DiseaseBlackHeartBlight Auto
Spell Property DLC2DiseaseDroops Auto
Race Property DarkElfRace Auto
Race Property DarkElfRaceVampire Auto
WorldSpace Property DarkWaterWorld Auto
Spell Property DiseaseAtaxia Auto
Spell Property DiseaseBoneBreakFever Auto
Spell Property DiseaseBrainRot Auto
Spell Property DiseasePorphyricHemophelia Auto
Spell Property DiseaseRattles Auto
Spell Property DiseaseRockjoint Auto
Spell Property DiseaseWitbane Auto
WorldSpace Property DlC01SoulCairn Auto
WorldSpace Property EastEmpireWarehouse Auto
WorldSpace Property ElderGleamSanctuaryWorld Auto
textureset Property EyesMaleHumanBlue Auto
textureset Property EyesMaleHumanVampire Auto
WorldSpace Property FallowStoneCaveWorldStart Auto
Race[] Property FeedRacesAnimal Auto
Race[] Property FeedRacesHuman Auto
Float Property FeedTimer Auto
WorldSpace Property Frostmerecryptworld Auto
GlobalVariable Property GameDaysPassed Auto
Float Property HealAmount Auto
Race Property HighElfRace Auto
Race Property HighElfRaceVampire Auto
Spell Property IceSpikeRightHand Auto
Idle Property IdleCannibalFeedCrouching Auto
Race Property ImperialRace Auto
Race Property ImperialRaceVampire Auto
WorldSpace Property KarthSpireRedoubtWorld Auto
WorldSpace Property KatariahWorld Auto
Race Property KhajiitRace Auto
Race Property KhajiitRaceVampire Auto
WorldSpace Property LabyrinthianWorld Auto
WorldSpace Property LabyrinthianWorld03 Auto
WorldSpace Property LabyrinthianWorld04 Auto
Float Property LastCheckTime Auto
Float Property LastFeedTime Auto
Sound Property MagVampireTransform01 Auto
WorldSpace Property MossmotherCavernWorld Auto
Race Property NordRace Auto
Race Property NordRaceVampire Auto
bot_loadscript Property OnInit Auto
Race Property OrcRace Auto
Race Property OrcRaceVampire Auto
GlobalVariable Property PlayerIsVampire Auto
Actor Property PlayerRef Auto
Faction Property PotentialFollowerFaction Auto
Faction Property PotentialMarriageFaction Auto
WorldSpace Property RedEagleRedoubtWorld Auto
Race Property RedguardRace Auto
Race Property RedguardRaceVampire Auto
WorldSpace Property ShadowGreenCavernWorld Auto
textureset Property SkinEyesKhajiitBase Auto
textureset Property SkinEyesKhajiitVampire Auto
textureset Property SkinEyesMaleArgonian Auto
textureset Property SkinEyesMaleArgonianVampire Auto
WorldSpace Property SouthFringeWorld Auto
WorldSpace Property Sovngarde Auto
Float Property Time Auto
Spell Property TrapDiseaseAtaxia Auto
Spell Property TrapDiseaseBoneBreakFever Auto
Spell Property TrapDiseaseBrainRot Auto
Spell Property TrapDiseaseRattles Auto
Spell Property TrapDiseaseRockjoint Auto
Spell Property TrapDiseaseWitbane Auto
Quest Property VC01 Auto
Keyword Property Vampire Auto
EffectShader Property VampireChangeFX Auto
Spell Property VampireCharm Auto
GlobalVariable Property VampireFeedReady Auto
Idle Property VampireFeedingBedRight Auto
Idle Property VampireFeedingBedRollRight_Loose Auto
Idle Property VampireFeedingBedrollLeft Auto
Idle Property VampireFeedingBedrollRight Auto
Actor Property VampireHunter01 Auto
Actor Property VampireHunter02 Auto
Actor Property VampireHunter03 Auto
Actor Property VampireHunter04 Auto
Actor Property VampireHunter05 Auto
Spell Property VampireHuntersSight Auto
Faction Property VampirePCFaction Auto
Spell Property VampirePoisonResist Auto
Int Property VampireStage Auto conditional
ImageSpaceModifier Property VampireTransformDecreaseISMD Auto
ImageSpaceModifier Property VampireTransformIncreaseISMD Auto
Spell Property VampireVampirism Auto
Race Property WoodElfRace Auto
Race Property WoodElfRaceVampire Auto
Static Property XMarker Auto
Int Property extractChance Auto

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

Function VampireChange(Actor Target)
  LastCheckTime = GameDaysPassed.value
  DLC1VampireNextPerk.setValue(500 as Float)
  Game.DisablePlayerControls(True, True, False, False, False, True, True, False, 0)
  VampireChangeFX.play(Target as ObjectReference, -1.0)
  VampireTransformIncreaseISMD.applyCrossFade(2.0)
  ObjectReference myXmarker = Target.PlaceAtMe(XMarker as Form, 1, False, False)
  MagVampireTransform01.play(myXmarker)
  myXmarker.Disable(False)
  Utility.Wait(2.0)
  ImageSpaceModifier.removeCrossFade(1.0)
  VampireChangeFX.stop(Target as ObjectReference)
  Self.VampireChangeApp()
  Target.RemoveSpell(DiseaseAtaxia)
  Target.RemoveSpell(DLC2DiseaseBlackHeartBlight)
  Target.RemoveSpell(DiseaseBoneBreakFever)
  Target.RemoveSpell(DiseaseBrainRot)
  Target.RemoveSpell(DLC2DiseaseDroops)
  Target.RemoveSpell(DiseaseRattles)
  Target.RemoveSpell(DiseaseRockjoint)
  Target.RemoveSpell(DiseaseWitbane)
  Target.RemoveSpell(DiseasePorphyricHemophelia)
  Target.RemoveSpell(TrapDiseaseAtaxia)
  Target.RemoveSpell(TrapDiseaseBoneBreakFever)
  Target.RemoveSpell(TrapDiseaseBrainRot)
  Target.RemoveSpell(TrapDiseaseRattles)
  Target.RemoveSpell(TrapDiseaseRockjoint)
  Target.RemoveSpell(TrapDiseaseWitbane)
  BOTVar_VampireBloodPoints.setValue(125000 as Float)
  Self.VampireStages(0)
  LastFeedTime = GameDaysPassed.value
  PlayerIsVampire.setValue(1 as Float)
  Utility.Wait(1 as Float)
  Game.EnablePlayerControls(True, True, True, True, True, True, True, True, 0)
  If VC01.GetStageDone(200) == 1 as Bool
    VC01.SetStage(25)
  EndIf
  Target.AddPerk(BOTPerk_Buff_LevelSpellScale)
  Target.AddPerk(BOTPerk_Buff_StageSpellScale)
  Target.AddPerk(BOTPerk_Ability_VampireCharmScale)
  Target.AddSpell(BOTSpell_Spell_Destruction_VampireDrain, False)
  Target.AddSpell(BOTSpell_Ability_Weakness_ShrineDamage, False)
  Target.AddSpell(BOTSpell_Ability_Strength_Waterbreathing, False)
  Target.AddSpell(VampireVampirism, False)
  Target.AddSpell(VampirePoisonResist, False)
  Target.AddSpell(VampireHuntersSight, False)
  If BOTVar_Weakness_TrespDamage.getValue() != 0 as Float
    Target.AddSpell(BOTSpell_Ability_Weakness_TrespDamagePerk, False)
  EndIf
  Target.AddToFaction(VampirePCFaction)
  BOTQuest_VampireKeywords.Start()
  Self.VampireClans()
  Self.RemoveHate()
  If BOTVar_FeedingProgression.getValue() != 1 as Float
    Self.FeedProgressionFinish()
  EndIf
  Self.RegisterForUpdateGameTime(3 as Float)
EndFunction

Function changePlayerEyes()
  If (BOTVar_CustomAppearance.getValue() == 1 as Float) && PlayerRef.hasKeyword(Vampire)
    ; RCS 
    Race PlayerRace = PlayerRef.GetActorBase().GetRace()
    Int RcsHeadPartType = RaceCompatibility.GetHeadPartTypeByRace(PlayerRace)
    If PlayerRace == ArgonianRace || RcsHeadPartType == 1
      PlayerRef.SetEyeTexture(SkinEyesMaleArgonianVampire)
    ElseIf PlayerRace == KhajiitRace || RcsHeadPartType == 11
      PlayerRef.SetEyeTexture(SkinEyesKhajiitVampire)
    Else
      PlayerRef.SetEyeTexture(EyesMaleHumanVampire)
    EndIf
  EndIf
EndFunction

Function VampireChangeApp()
  Self.GetPlayerRace()
  Int PlayerRace = BOTVar_PlayerRace.getValue() as Int
  If BOTVar_CustomAppearance.getValue() == 1 as Float
    Self.changePlayerEyes()
  EndIf

  ; RCS 
  Race PlayerCurrentRace = PlayerRef.GetActorBase().GetRace()
  If PlayerRef.hasKeyword(Vampire)
    ; Nullable
    Race MortalRace = RaceCompatibility.GetRaceByVampireRace(PlayerRef.GetActorBase().GetRace())
    If MortalRace != None
      CureRace = MortalRace
    EndIf
  Else
    CureRace = PlayerCurrentRace
    If BOTVar_CustomAppearance.getValue() == 0 as Float
      Race VampireRace = RaceCompatibility.GetVampireRaceByRace(PlayerCurrentRace)
      If VampireRace != None
        PlayerRef.SetRace(VampireRace)
      EndIf
    EndIf
  EndIf

  If PlayerRace == 1
    ; RCS 
    ; CureRace = ArgonianRace 
    ; If BOTVar_CustomAppearance.getValue() == 0 as Float
    ;   PlayerRef.SetRace(ArgonianRaceVampire)
    ; EndIf
    PlayerRef.AddSpell(BOTSpell_Ability_Racial_WetScalesTrigger, False)
    PlayerRef.AddSpell(BOTSpell_Ability_Racial_Argonian_Pescatarian, False)
  ElseIf PlayerRace == 2
    ; RCS 
    ; CureRace = BretonRace 
    ; If BOTVar_CustomAppearance.getValue() == 0 as Float
    ;   PlayerRef.SetRace(BretonRaceVampire)
    ; EndIf
    PlayerRef.AddPerk(BOTPerk_Racial_Breton_BloodMastery)
  ElseIf PlayerRace == 3
    ; RCS 
    ; CureRace = DarkElfRace 
    ; If BOTVar_CustomAppearance.getValue() == 0 as Float
    ;   PlayerRef.SetRace(DarkElfRaceVampire)
    ; EndIf
    PlayerRef.AddPerk(BOTPerk_Racial_Dunmer_AshSkin)
  ElseIf PlayerRace == 4
    ; RCS 
    ; CureRace = HighElfRace 
    ; If BOTVar_CustomAppearance.getValue() == 0 as Float
    ;   PlayerRef.SetRace(HighElfRaceVampire)
    ; EndIf
  ElseIf PlayerRace == 5
    ; RCS 
    ; CureRace = ImperialRace 
    ; If BOTVar_CustomAppearance.getValue() == 0 as Float
    ;   PlayerRef.SetRace(ImperialRaceVampire)
    ; EndIf
    PlayerRef.AddPerk(BOTPerk_Racial_Imperial_ImperialInfluence)
  ElseIf PlayerRace == 6
    ; RCS 
    ; CureRace = KhajiitRace 
    ; If BOTVar_CustomAppearance.getValue() == 0 as Float
    ;   PlayerRef.SetRace(KhajiitRaceVampire)
    ; EndIf
    PlayerRef.AddPerk(BOTPerk_Racial_Khajiit_KeenEye)
    PlayerRef.AddPerk(BOTPerk_Racial_Khajiit_FerociousTeeth)
  ElseIf PlayerRace == 7
    ; RCS 
    ; CureRace = NordRace 
    ; If BOTVar_CustomAppearance.getValue() == 0 as Float
    ;   PlayerRef.SetRace(NordRaceVampire)
    ; EndIf
    PlayerRef.AddSpell(BOTSpell_Ability_Racial_Nord_DrunkardApply, False)
  ElseIf PlayerRace == 8
    ; RCS 
    ; CureRace = OrcRace 
    ; If BOTVar_CustomAppearance.getValue() == 0 as Float
    ; 	PlayerRef.SetRace(OrcRaceVampire)
    ; EndIf
    PlayerRef.AddPerk(BOTPerk_Racial_Orc_BerserkersStrength)
  ElseIf PlayerRace == 9
    ; RCS 
    ; CureRace = RedguardRace 
    ; If BOTVar_CustomAppearance.getValue() == 0 as Float
    ;   PlayerRef.SetRace(RedguardRaceVampire)
    ; EndIf
    PlayerRef.AddSpell(BOTSpell_Ability_Racial_Sunborn, False)
  ElseIf PlayerRace == 10
    ; RCS 
    ; CureRace = WoodElfRace 
    ; If BOTVar_CustomAppearance.getValue() == 0 as Float
    ;   PlayerRef.SetRace(WoodElfRaceVampire)
    ; EndIf
    BOTVar_AnimalFeeding.setValue(1 as Float)
    BOTVar_AnimalFeedingPotions.setValue(0 as Float)
  Else
    BOTVar_CustomAppearance.setValue(1 as Float)
  EndIf
EndFunction

Function GetPlayerRace()
  ; RCS 
  ; If PlayerRef.GetActorBase().GetRace() == ArgonianRace || PlayerRef.GetActorBase().GetRace() == ArgonianRaceVampire
  ;   BOTVar_PlayerRace.setValue(1 as Float)
  ; ElseIf PlayerRef.GetActorBase().GetRace() == BretonRace || PlayerRef.GetActorBase().GetRace() == BretonRaceVampire
  ;   BOTVar_PlayerRace.setValue(2 as Float)
  ; ElseIf PlayerRef.GetActorBase().GetRace() == DarkElfRace || PlayerRef.GetActorBase().GetRace() == DarkElfRaceVampire
  ;   BOTVar_PlayerRace.setValue(3 as Float)
  ; ElseIf PlayerRef.GetActorBase().GetRace() == HighElfRace || PlayerRef.GetActorBase().GetRace() == HighElfRaceVampire
  ;   BOTVar_PlayerRace.setValue(4 as Float)
  ; ElseIf PlayerRef.GetActorBase().GetRace() == ImperialRace || PlayerRef.GetActorBase().GetRace() == ImperialRaceVampire
  ;   BOTVar_PlayerRace.setValue(5 as Float)
  ; ElseIf PlayerRef.GetActorBase().GetRace() == KhajiitRace || PlayerRef.GetActorBase().GetRace() == KhajiitRaceVampire
  ;   BOTVar_PlayerRace.setValue(6 as Float)
  ; ElseIf PlayerRef.GetActorBase().GetRace() == NordRace || PlayerRef.GetActorBase().GetRace() == NordRaceVampire
  ;   BOTVar_PlayerRace.setValue(7 as Float)
  ; ElseIf PlayerRef.GetActorBase().GetRace() == OrcRace || PlayerRef.GetActorBase().GetRace() == OrcRaceVampire
  ;   BOTVar_PlayerRace.setValue(8 as Float)
  ; ElseIf PlayerRef.GetActorBase().GetRace() == RedguardRace || PlayerRef.GetActorBase().GetRace() == RedguardRaceVampire
  ;   BOTVar_PlayerRace.setValue(9 as Float)
  ; ElseIf PlayerRef.GetActorBase().GetRace() == WoodElfRace || PlayerRef.GetActorBase().GetRace() == WoodElfRaceVampire
  ;   BOTVar_PlayerRace.setValue(10 as Float)
  Race PlayerRace = PlayerRef.GetActorBase().GetRace()
  If RaceCompatibility.GetIsRaceByProxy(ArgonianRace, PlayerRace) || RaceCompatibility.GetIsRaceByProxy(ArgonianRaceVampire, PlayerRace)
    BOTVar_PlayerRace.setValue(1 as Float)
  ElseIf RaceCompatibility.GetIsRaceByProxy(BretonRace, PlayerRace) || RaceCompatibility.GetIsRaceByProxy(BretonRaceVampire, PlayerRace)
    BOTVar_PlayerRace.setValue(2 as Float)
  ElseIf RaceCompatibility.GetIsRaceByProxy(DarkElfRace, PlayerRace) || RaceCompatibility.GetIsRaceByProxy(DarkElfRaceVampire, PlayerRace)
    BOTVar_PlayerRace.setValue(3 as Float)
  ElseIf RaceCompatibility.GetIsRaceByProxy(HighElfRace, PlayerRace) || RaceCompatibility.GetIsRaceByProxy(HighElfRaceVampire, PlayerRace)
    BOTVar_PlayerRace.setValue(4 as Float)
  ElseIf RaceCompatibility.GetIsRaceByProxy(ImperialRace, PlayerRace) || RaceCompatibility.GetIsRaceByProxy(ImperialRaceVampire, PlayerRace)
    BOTVar_PlayerRace.setValue(5 as Float)
  ElseIf RaceCompatibility.GetIsRaceByProxy(KhajiitRace, PlayerRace) || RaceCompatibility.GetIsRaceByProxy(KhajiitRaceVampire, PlayerRace)
    BOTVar_PlayerRace.setValue(6 as Float)
  ElseIf RaceCompatibility.GetIsRaceByProxy(NordRace, PlayerRace) || RaceCompatibility.GetIsRaceByProxy(NordRaceVampire, PlayerRace)
    BOTVar_PlayerRace.setValue(7 as Float)
  ElseIf RaceCompatibility.GetIsRaceByProxy(OrcRace, PlayerRace) || RaceCompatibility.GetIsRaceByProxy(OrcRaceVampire, PlayerRace)
    BOTVar_PlayerRace.setValue(8 as Float)
  ElseIf RaceCompatibility.GetIsRaceByProxy(RedguardRace, PlayerRace) || RaceCompatibility.GetIsRaceByProxy(RedguardRaceVampire, PlayerRace)
    BOTVar_PlayerRace.setValue(9 as Float)
  ElseIf RaceCompatibility.GetIsRaceByProxy(WoodElfRace, PlayerRace) || RaceCompatibility.GetIsRaceByProxy(WoodElfRaceVampire, PlayerRace)
    BOTVar_PlayerRace.setValue(10 as Float)
  Else
    Self.CustomRaceMenu(0, True)
  EndIf
EndFunction

Function CustomRaceMenu(Int aiButton, Bool abMenu)
  BOTVar_CustomAppearance.setValue(1 as Float)
  While abMenu
    aiButton = BOTMessage_CustomRace_StartMenu.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    If aiButton == 0
      aiButton = BOTMessage_CustomRace_HumanRaces.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      If aiButton == 0
        
      ElseIf aiButton == 1
        BOTVar_PlayerRace.setValue(7 as Float)
        abMenu = False
      ElseIf aiButton == 2
        BOTVar_PlayerRace.setValue(5 as Float)
        abMenu = False
      ElseIf aiButton == 3
        BOTVar_PlayerRace.setValue(9 as Float)
        abMenu = False
      EndIf
    ElseIf aiButton == 1
      aiButton = BOTMessage_CustomRace_ElfRaces.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      If aiButton == 0
        
      ElseIf aiButton == 1
        BOTVar_PlayerRace.setValue(4 as Float)
        abMenu = False
      ElseIf aiButton == 2
        BOTVar_PlayerRace.setValue(3 as Float)
        abMenu = False
      ElseIf aiButton == 3
        BOTVar_PlayerRace.setValue(10 as Float)
        abMenu = False
      EndIf
    ElseIf aiButton == 2
      aiButton = BOTMessage_CustomRace_BeastRaces.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      If aiButton == 0
        
      ElseIf aiButton == 1
        BOTVar_PlayerRace.setValue(1 as Float)
        abMenu = False
      ElseIf aiButton == 2
        BOTVar_PlayerRace.setValue(6 as Float)
        abMenu = False
      EndIf
    ElseIf aiButton == 3
      aiButton = BOTMessage_CustomRace_Other.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      If aiButton == 0
        
      ElseIf aiButton == 1
        BOTVar_PlayerRace.setValue(2 as Float)
        abMenu = False
      ElseIf aiButton == 2
        BOTVar_PlayerRace.setValue(8 as Float)
        abMenu = False
      EndIf
    EndIf
  EndWhile
EndFunction

Function VampireClans()
  If BOTVar_VampireClan.getValue() == 1 as Float
    PlayerRef.AddSpell(BOTSpell_Power_Volkihar_IcyBreath, False)
    PlayerRef.AddPerk(BOTPerk_Ability_Volkihar_BloodPack)
    PlayerRef.AddSpell(BOTSpell_Power_Volkihar_Whiteout, False)
    PlayerRef.AddSpell(BOTSpell_Ability_Volkihar_Frostborn, False)
    PlayerRef.AddSpell(BOTSpell_Ability_Volkihar_FrostbornWhiteout, False)
  EndIf
EndFunction

Function VampireCure(Actor PlayerRef)
  Game.IncrementStat("Vampirism Cures", 1)
  VampireStage = 0
  PlayerRef.RemoveFromFaction(VampirePCFaction)
  Self.RemoveHate()
  Self.RemoveStage01()
  Self.RemoveStage02()
  Self.RemoveStage03()
  Self.RemoveStage04()
  Self.RemoveStage05()
  PlayerRef.AddSpell(VampireVampirism, True)
  PlayerRef.AddSpell(VampirePoisonResist, True)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_Waterbreathing)
  PlayerRef.RemoveSpell(VampireHuntersSight)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Weakness_ShrineDamage)
  Self.VampireChangeAppBack()
  BOTQuest_VampireKeywords.stop()
  PlayerIsVampire.setValue(0 as Float)
EndFunction

Function VampireChangeAppBack()
  Int PlayerRace = BOTVar_PlayerRace.getValue() as Int
  If BOTVar_CustomAppearance.getValue() == 1 as Float
    ; RCS 
    Race PlayerCurrentRace = PlayerRef.GetActorBase().GetRace()
    Int RcsHeadPartType = RaceCompatibility.GetHeadPartTypeByRace(PlayerCurrentRace)
    If PlayerCurrentRace == ArgonianRace || RcsHeadPartType == 1
      PlayerRef.SetEyeTexture(SkinEyesMaleArgonian)
    ElseIf PlayerCurrentRace == KhajiitRace || RcsHeadPartType == 11
      PlayerRef.SetEyeTexture(SkinEyesKhajiitBase)
    Else
      PlayerRef.SetEyeTexture(EyesMaleHumanBlue)
    EndIf
  ; RCS 
  Else
      Race MortalRace = RaceCompatibility.GetRaceByVampireRace(PlayerRef.GetActorBase().GetRace())
      If MortalRace != None
  	    PlayerRef.SetRace(MortalRace)
      EndIf
  EndIf
  ; RCS 
  ; If PlayerRace == 1
  ;   PlayerRef.SetRace(ArgonianRace)
  ; ElseIf PlayerRace == 2
  ;   PlayerRef.SetRace(BretonRace)
  ; ElseIf PlayerRace == 3
  ;   PlayerRef.SetRace(DarkElfRace)
  ; ElseIf PlayerRace == 4
  ;   PlayerRef.SetRace(HighElfRace)
  ; ElseIf PlayerRace == 5
  ;   PlayerRef.SetRace(ImperialRace)
  ; ElseIf PlayerRace == 6
  ;   PlayerRef.SetRace(KhajiitRace)
  ; ElseIf PlayerRace == 7
  ;   PlayerRef.SetRace(NordRace)
  ; ElseIf PlayerRace == 8
  ;   PlayerRef.SetRace(OrcRace)
  ; ElseIf PlayerRace == 9
  ;   PlayerRef.SetRace(RedguardRace)
  ; ElseIf PlayerRace == 10
  ;   PlayerRef.SetRace(WoodElfRace)
  ; EndIf
EndFunction

Event OnUpdateGameTime()
  Self.VampireHunters()
  If BOTVar_Weakness_BloodHungry.getValue() == (1 as Int) as Float
    FeedTimer = GameDaysPassed.value - LastFeedTime
    If FeedTimer > 1 as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Weakness_BloodHungry, False)
    EndIf
  EndIf
  Float TimePassed = GameDaysPassed.value - LastCheckTime
  Int LoseBloodLevelCount = (TimePassed * 8 as Float) as Int
  Self.VampireLoseBloodLevel(0 as Float, LoseBloodLevelCount)
  Self.VampireStages(0)
  LastCheckTime = GameDaysPassed.value
  Self.UnregisterforUpdateGameTime()
  Self.RegisterForUpdateGameTime(3 as Float)
EndEvent

Function VampireLoseBloodLevel(Float BloodPoints, Int Multiplier)
  BloodPoints = Utility.RandomInt(6000, 6500) as Float
  BloodPoints *= 24.0 / BOTVar_StageProgressionSpeed.getValue()
  BloodPoints *= Multiplier as Float
  If BOTVar_StageProgression.getValue() == 0 as Float
    If BOTVar_VampireStage.getValue() == 1 as Float
      BloodPoints *= 0.75 as Float
    ElseIf BOTVar_VampireStage.getValue() == 2 as Float
      BloodPoints *= 0.899999976 as Float
    ElseIf BOTVar_VampireStage.getValue() == 4 as Float
      BloodPoints *= 1.100000024 as Float
    ElseIf BOTVar_VampireStage.getValue() == 5 as Float
      BloodPoints *= 1.25 as Float
    EndIf
  ElseIf BOTVar_VampireStage.getValue() == 1 as Float
    BloodPoints *= 1.25 as Float
  ElseIf BOTVar_VampireStage.getValue() == 2 as Float
    BloodPoints *= 1.100000024 as Float
  ElseIf BOTVar_VampireStage.getValue() == 4 as Float
    BloodPoints *= 0.899999976 as Float
  ElseIf BOTVar_VampireStage.getValue() == 5 as Float
    BloodPoints *= 0.75 as Float
  EndIf
  If BOTVar_VampireAnimalBloodPoints.getValue() > 1 as Float
    If BOTVar_VampireAnimalBloodPoints.getValue() > BloodPoints
      BloodPoints *= 1.5
      BOTVar_VampireAnimalBloodPoints.setValue(BOTVar_VampireAnimalBloodPoints.getValue() - BloodPoints)
      If BOTVar_VampireAnimalBloodPoints.getValue() < 0 as Float
        BOTVar_VampireAnimalBloodPoints.setValue(0 as Float)
      EndIf
    Else
      BloodPoints += BOTVar_VampireAnimalBloodPoints.getValue() * 0.5
      BOTVar_VampireAnimalBloodPoints.setValue(0 as Float)
    EndIf
  EndIf
  ; RCS
  ; If PlayerRef.GetRace() == NordRaceVampire || PlayerRef.GetRace() == NordRace
  Race PlayerRace = PlayerRef.GetActorBase().GetRace()
  If RaceCompatibility.GetIsRaceByProxy(NordRaceVampire, PlayerRace) || RaceCompatibility.GetIsRaceByProxy(NordRace, PlayerRace)
    BloodPoints *= 0.75 as Float
    If BOTVar_RacialNord_Status.getValue() != 0 as Float
      BloodPoints *= 0 as Float
    ElseIf BOTVar_RacialNord_AlcoholPercentageBody.getValue() >= 25 as Float
      Float BloodPointsCalc = BloodPoints / Multiplier as Float
      Float MultLeft = Multiplier as Float
      BloodPoints = 0 as Float
      While MultLeft >= 0.949999988 && (BOTVar_RacialNord_AlcoholPercentageBody.getValue() >= 50 as Float)
        BloodPoints += BloodPointsCalc * (1.0 + BOTVar_RacialNord_AlcoholPercentageBody.getValue() / 100.0)
        BOTVar_RacialNord_AlcoholPercentageBody.setValue(BOTVar_RacialNord_AlcoholPercentageBody.getValue() - 50 as Float)
        MultLeft -= 1 as Float
      EndWhile
      If MultLeft >= 0.5 && (BOTVar_RacialNord_AlcoholPercentageBody.getValue() >= 25 as Float)
        BloodPoints += BloodPointsCalc * (1.0 + BOTVar_RacialNord_AlcoholPercentageBody.getValue() / 200.0)
        BOTVar_RacialNord_AlcoholPercentageBody.setValue(0 as Float)
        MultLeft -= 0.5
      EndIf
      If MultLeft >= 1 as Float
        BloodPoints += BloodPointsCalc * MultLeft
      EndIf
    EndIf
  EndIf
  Self.VampireBloodLevel(BloodPoints as Int, 1, 0)
EndFunction

Function VampireBloodLevel(Int BloodChange, Int direction, Int AnimalBlood)
  If direction == 0
    If AnimalBlood == 1 && (BOTVar_VampireBloodPoints.getValue() < 249000 as Float)
      BOTVar_VampireAnimalBloodPoints.setValue(((BOTVar_VampireAnimalBloodPoints.getValue() + BloodChange as Float) as Int) as Float)
      If BOTVar_VampireAnimalBloodPoints.getValue() > 250000 as Float
        BOTVar_VampireAnimalBloodPoints.setValue(250000 as Float)
      EndIf
    EndIf
    PlayerRef.RemoveSpell(BOTSpell_Ability_Weakness_BloodHungry)
    BOTVar_StarvationCheck.setValue(0 as Float)
    PlayerRef.DispelSpell(BOTSpell_Spell_Starvation)
    LastFeedTime = GameDaysPassed.value
    BOTVar_VampireBloodPoints.setValue(BOTVar_VampireBloodPoints.getValue() + BloodChange as Float)
    If BOTVar_VampireBloodPoints.getValue() > 250000 as Float
      BOTVar_VampireBloodPoints.setValue(250000 as Float)
    EndIf
    If (BOTVar_ForceDrainCheck.getValue() == 1 as Float) && (BOTVar_VampireBloodPoints.getValue() > 12500 as Float)
      If (BOTVar_ForceDrain.getValue() == 2 as Float) || (BOTVar_VampireBloodPoints.getValue() > 25000 as Float) && (BOTVar_ForceDrain.getValue() == 1 as Float) || (BOTVar_ForceDrain.getValue() == 0 as Float)
        BOTVar_ForceDrainCheck.setValue(0 as Float)
      EndIf
    EndIf
  Else
    BOTVar_VampireBloodPoints.setValue(BOTVar_VampireBloodPoints.getValue() - BloodChange as Float)
    If BOTVar_VampireBloodPoints.getValue() < 0 as Float
      BOTVar_VampireBloodPoints.setValue(0 as Float)
      If (BOTVar_Starvation.getValue() != 0 as Float) && (BOTVar_StarvationCheck.getValue() == 0 as Float)
        Debug.notification("You are now bloodstarved.")
        BOTVar_StarvationCheck.setValue(2 as Float)
        BOTSpell_Spell_Starvation.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
      EndIf
    EndIf
    If (BOTVar_VampireBloodPoints.getValue() < 25000 as Float) && (BOTVar_ForceDrain.getValue() != 0 as Float)
      If (BOTVar_ForceDrain.getValue() == 1 as Float) || (BOTVar_VampireBloodPoints.getValue() < 12500 as Float) && (BOTVar_ForceDrain.getValue() == 2 as Float)
        BOTVar_ForceDrainCheck.setValue(1 as Float)
      EndIf
    EndIf
  EndIf
EndFunction

Bool Function VampireBloodCheck(Int BloodChange)
  If BOTVar_VampireBloodPoints.getValue() < BloodChange as Float
    Return False
  Else
    Return True
  EndIf
EndFunction

Function GetCurrentHourOfDay()
  Time = Utility.GetCurrentGameTime()
  Time -= Math.Floor(Time) as Float
  Time *= 24 as Float
EndFunction

Function VampireStages(Int PotionFeed)
  If PotionFeed == 1
    If BOTVar_StageCheck.getValue() == (1 as Int) as Float
      BOTVar_StageCheck.setValue(2 as Float)
      Utility.Wait(5.0)
      BOTVar_StageCheck.setValue(0 as Float)
    ElseIf BOTVar_StageCheck.getValue() == (2 as Int) as Float
      
    Else
      BOTVar_StageCheck.setValue(1 as Float)
    EndIf
  EndIf
  Int BOTVar_VampireBloodPointsTemp = BOTVar_VampireBloodPoints.getValue() as Int
  If (BOTVar_StageCheck.getValue() == (0 as Int) as Float) || PotionFeed == 0
    If BOTVar_VampireBloodPointsTemp >= -1 && BOTVar_VampireBloodPointsTemp <= 49999
      VampireStage = 1
    ElseIf BOTVar_VampireBloodPointsTemp >= 50000 && BOTVar_VampireBloodPointsTemp <= 99999
      VampireStage = 2
    ElseIf BOTVar_VampireBloodPointsTemp >= 100000 && BOTVar_VampireBloodPointsTemp <= 149999
      VampireStage = 3
    ElseIf BOTVar_VampireBloodPointsTemp >= 150000 && BOTVar_VampireBloodPointsTemp <= 199999
      VampireStage = 4
    ElseIf BOTVar_VampireBloodPointsTemp >= 200000 && BOTVar_VampireBloodPointsTemp <= 250000
      VampireStage = 5
    EndIf
    If BOTVar_StageProgression.getValue() == (1 as Int) as Float
      If VampireStage == 1 as Int
        VampireStage = 5
      ElseIf VampireStage == 2 as Int
        VampireStage = 4
      ElseIf VampireStage == 3 as Int
        VampireStage = 3
      ElseIf VampireStage == 4 as Int
        VampireStage = 2
      ElseIf VampireStage == 5 as Int
        VampireStage = 1
      EndIf
    EndIf
    If VampireStage as Float != BOTVar_VampireStage.getValue()
      Self.VampireProgression(PlayerRef, VampireStage)
      BOTVar_VampireStage.setValue(VampireStage as Float)
    EndIf
    BOTVar_StageCheck.setValue(0 as Float)
  EndIf
EndFunction

Function VampirePerkCheck()
  If DLC1VampireTotalPerksEarned.value < DLC1VampireMaxPerks.value
    If DLC1VampireBloodPoints.value >= DLC1VampireNextPerk.value
      DLC1VampirePerkEarned.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      DLC1VampireBloodPoints.setValue(DLC1VampireBloodPoints.value - DLC1VampireNextPerk.value)
      DLC1VampirePerkPoints.setValue(DLC1VampirePerkPoints.value + 1 as Float)
      DLC1VampireTotalPerksEarned.setValue(DLC1VampireTotalPerksEarned.value + 1 as Float)
      If DLC1VampireTotalPerksEarned.value < 10 as Float
        DLC1VampireNextPerk.setValue(DLC1VampireNextPerk.value + 20 as Float)
      ElseIf (DLC1VampireTotalPerksEarned.value >= 10 as Float) && (DLC1VampireTotalPerksEarned.value < 20 as Float)
        DLC1VampireNextPerk.setValue(DLC1VampireNextPerk.value + 35 as Float)
      ElseIf DLC1VampireTotalPerksEarned.value >= 20 as Float
        DLC1VampireNextPerk.setValue(DLC1VampireNextPerk.value + 50 as Float)
      Else
        DLC1VampireNextPerk.setValue(DLC1VampireNextPerk.value + 30 as Float)
      EndIf
    EndIf
  EndIf
EndFunction

Function VampireProgression(Actor PlayerRef, Int VampireStage)
  If VampireStage == 1
    PlayerRef.AddSpell(BOTSpell_Ability_Dummy_VampireStage01, False)
    If BOTVar_Weakness_Fire.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Weakness_ResistanceFire_Stage01, False)
    EndIf
    If BOTVar_Strength_ResistanceFrost.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_ResistanceFrost_Stage01, False)
    EndIf
    PlayerRef.AddSpell(BOTSpell_Power_VampireRaiseThrall_Stage01, False)
    If BOTVar_Strength_FortifyStrength.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_FortifyMelee_Stage01, False)
    EndIf
    If BOTVar_Strength_FortifyIllusion.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_FortifyIllusion_Stage01, False)
    EndIf
    If BOTVar_Strength_FortifySneak.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_FortifySneak_Stage01, False)
    EndIf
    If BOTVar_Weakness_SunRegen.getValue() == (1 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Weakness_SunRegen_Stage01, False)
    EndIf
    If BOTVar_Weakness_SunDamage.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Weakness_SunDamage_Stage001, False)
    EndIf
    If BOTVar_Strength_FortifySpeed.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strenght_VampiricSpeed_Stage01, False)
    EndIf
    If BOTVar_Strength_FortifyHealRate.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_FortifyHealRate_Stage01, False)
    EndIf
    If BOTVar_Strength_ResistanceNormalWeapons.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_ResistNormalWeapons_Stage01, False)
    EndIf
    If BOTVar_Strength_FortifyAttackDamage.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_FortifyAttackDamage_Stage01, False)
    EndIf
    If BOTVar_Strength_FortifyIceMagic.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_FortifyIceMagic_Stage01, False)
    EndIf
    If PlayerRef.hasspell(BOTSpell_Ability_Dummy_VampireStage02 as Form)
      Self.RemoveStage02()
      Self.StageNotification(1)
    EndIf
    If PlayerRef.hasspell(BOTSpell_Ability_Dummy_VampireStage03 as Form)
      Self.RemoveStage03()
      Self.StageNotification(1)
    EndIf
    If PlayerRef.hasspell(BOTSpell_Ability_Dummy_VampireStage04 as Form)
      Self.RemoveStage04()
      Self.StageNotification(1)
    EndIf
    If PlayerRef.hasspell(BOTSpell_Ability_Dummy_VampireStage05 as Form)
      Self.RemoveStage05()
      Self.StageNotification(1)
    EndIf
    If BOTVar_Strength_FortifyJump.getValue() != (0 as Int) as Float
      PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_FortifyJump)
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_FortifyJump, False)
    EndIf
  EndIf
  If VampireStage == 2
    PlayerRef.AddSpell(BOTSpell_Ability_Dummy_VampireStage02, False)
    If BOTVar_Weakness_Fire.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Weakness_ResistanceFire_Stage02, False)
    EndIf
    If BOTVar_Strength_ResistanceFrost.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_ResistanceFrost_Stage02, False)
    EndIf
    PlayerRef.AddSpell(BOTSpell_Power_VampireRaiseThrall_Stage02, False)
    If BOTVar_Strength_FortifyStrength.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_FortifyMelee_Stage02, False)
    EndIf
    If BOTVar_Strength_FortifyIllusion.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_FortifyIllusion_Stage02, False)
    EndIf
    If BOTVar_Strength_FortifySneak.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_FortifySneak_Stage02, False)
    EndIf
    If BOTVar_Weakness_SunDamage.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Weakness_SunDamage_Stage002, False)
    EndIf
    If BOTVar_Weakness_SunRegen.getValue() == (1 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Weakness_SunRegen_Stage02, False)
    EndIf
    If BOTVar_Strength_FortifySpeed.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strenght_VampiricSpeed_Stage02, False)
    EndIf
    If BOTVar_Strength_FortifyHealRate.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_FortifyHealRate_Stage02, False)
    EndIf
    If BOTVar_Strength_ResistanceNormalWeapons.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_ResistNormalWeapons_Stage02, False)
    EndIf
    If BOTVar_Strength_FortifyAttackDamage.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_FortifyAttackDamage_Stage02, False)
    EndIf
    If BOTVar_Strength_FortifyIceMagic.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_FortifyIceMagic_Stage02, False)
    EndIf
    If BOTVar_FeedingProgressionStage.getValue() > 7 as Float
      PlayerRef.AddSpell(VampireCharm, False)
    EndIf
    If PlayerRef.hasspell(BOTSpell_Ability_Dummy_VampireStage01 as Form)
      Self.RemoveStage01()
      Self.StageNotification(0)
    EndIf
    If PlayerRef.hasspell(BOTSpell_Ability_Dummy_VampireStage03 as Form)
      Self.RemoveStage03()
      Self.StageNotification(1)
    EndIf
    If PlayerRef.hasspell(BOTSpell_Ability_Dummy_VampireStage04 as Form)
      Self.RemoveStage04()
      Self.StageNotification(1)
    EndIf
    If PlayerRef.hasspell(BOTSpell_Ability_Dummy_VampireStage05 as Form)
      Self.RemoveStage05()
      Self.StageNotification(1)
    EndIf
    If BOTVar_Strength_FortifyJump.getValue() != (0 as Int) as Float
      PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_FortifyJump)
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_FortifyJump, False)
    EndIf
  EndIf
  If VampireStage == 3
    PlayerRef.AddSpell(BOTSpell_Ability_Dummy_VampireStage03, False)
    If BOTVar_Weakness_Fire.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Weakness_ResistanceFire_Stage03, False)
    EndIf
    If BOTVar_Strength_ResistanceFrost.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_ResistanceFrost_Stage03, False)
    EndIf
    PlayerRef.AddSpell(BOTSpell_Power_VampireRaiseThrall_Stage03, False)
    If BOTVar_Strength_FortifyStrength.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_FortifyMelee_Stage03, False)
    EndIf
    If BOTVar_Strength_FortifyIllusion.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_FortifyIllusion_Stage03, False)
    EndIf
    If BOTVar_Strength_FortifySneak.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_FortifySneak_Stage03, False)
    EndIf
    If BOTVar_Strength_FortifySneak.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_FortifySneak_Stage03, False)
    EndIf
    If BOTVar_Strength_ResistanceNormalWeapons.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_ResistNormalWeapons_Stage03, False)
    EndIf
    If BOTVar_Strength_FortifyAttackDamage.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_FortifyAttackDamage_Stage03, False)
    EndIf
    If BOTVar_VampireHate.getValue() == (3 as Int) as Float
      Self.AddHate()
    EndIf
    If BOTVar_Weakness_SunDamage.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Weakness_SunDamage_Stage003, False)
    EndIf
    If BOTVar_Weakness_SunRegen.getValue() == (1 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Weakness_SunRegen_Stage03, False)
    EndIf
    If BOTVar_Strength_FortifyHealRate.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_FortifyHealRate_Stage03, False)
    EndIf
    If BOTVar_Strength_FortifyIceMagic.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_FortifyIceMagic_Stage03, False)
    EndIf
    If BOTVar_FeedingProgressionStage.getValue() > 7 as Float
      PlayerRef.AddSpell(VampireCharm, False)
    EndIf
    If PlayerRef.hasspell(BOTSpell_Ability_Dummy_VampireStage01 as Form)
      Self.RemoveStage01()
      Self.StageNotification(0)
    EndIf
    If PlayerRef.hasspell(BOTSpell_Ability_Dummy_VampireStage02 as Form)
      Self.RemoveStage02()
      Self.StageNotification(0)
    EndIf
    If PlayerRef.hasspell(BOTSpell_Ability_Dummy_VampireStage04 as Form)
      Self.RemoveStage04()
      Self.StageNotification(1)
    EndIf
    If PlayerRef.hasspell(BOTSpell_Ability_Dummy_VampireStage05 as Form)
      Self.RemoveStage05()
      Self.StageNotification(1)
    EndIf
    If BOTVar_Strength_FortifyJump.getValue() != (0 as Int) as Float
      PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_FortifyJump)
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_FortifyJump, False)
    EndIf
  EndIf
  If VampireStage == 4
    PlayerRef.AddSpell(BOTSpell_Ability_Dummy_VampireStage04, False)
    If BOTVar_Weakness_Fire.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Weakness_ResistanceFire_Stage04, False)
    EndIf
    If BOTVar_Strength_ResistanceFrost.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_ResistanceFrost_Stage04, False)
    EndIf
    PlayerRef.AddSpell(BOTSpell_Power_VampireRaiseThrall_Stage04, False)
    If BOTVar_Strength_FortifyStrength.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_FortifyMelee_Stage04, False)
    EndIf
    If BOTVar_Strength_FortifyIllusion.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_FortifyIllusion_Stage04, False)
    EndIf
    If BOTVar_Strength_FortifySneak.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_FortifySneak_Stage04, False)
    EndIf
    If (BOTVar_VampireHate.getValue() == (3 as Int) as Float) || (BOTVar_VampireHate.getValue() == (4 as Int) as Float)
      Self.AddHate()
    EndIf
    If BOTVar_Weakness_SunDamage.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Weakness_SunDamage_Stage004, False)
    EndIf
    If BOTVar_Weakness_SunRegen.getValue() == (1 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Weakness_SunRegen_Stage04, False)
    EndIf
    If BOTVar_Strength_FortifySpeed.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strenght_VampiricSpeed_Stage04, False)
    EndIf
    If BOTVar_Strength_FortifyHealRate.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_FortifyHealRate_Stage04, False)
    EndIf
    If BOTVar_Strength_ResistanceNormalWeapons.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_ResistNormalWeapons_Stage04, False)
    EndIf
    If BOTVar_Strength_FortifyAttackDamage.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_FortifyAttackDamage_Stage04, False)
    EndIf
    If BOTVar_Strength_FortifyIceMagic.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_FortifyIceMagic_Stage04, False)
    EndIf
    If BOTVar_FeedingProgressionStage.getValue() > 7 as Float
      PlayerRef.AddSpell(VampireCharm, False)
    EndIf
    If PlayerRef.hasspell(BOTSpell_Ability_Dummy_VampireStage01 as Form)
      Self.RemoveStage01()
      Self.StageNotification(0)
    EndIf
    If PlayerRef.hasspell(BOTSpell_Ability_Dummy_VampireStage02 as Form)
      Self.RemoveStage02()
      Self.StageNotification(0)
    EndIf
    If PlayerRef.hasspell(BOTSpell_Ability_Dummy_VampireStage03 as Form)
      Self.RemoveStage03()
      Self.StageNotification(0)
    EndIf
    If PlayerRef.hasspell(BOTSpell_Ability_Dummy_VampireStage05 as Form)
      Self.RemoveStage05()
      Self.StageNotification(1)
    EndIf
    If BOTVar_Strength_FortifyJump.getValue() != (0 as Int) as Float
      PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_FortifyJump)
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_FortifyJump, False)
    EndIf
  EndIf
  If VampireStage == 5
    PlayerRef.AddSpell(BOTSpell_Ability_Dummy_VampireStage05, False)
    If BOTVar_Weakness_Fire.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Weakness_ResistanceFire_Stage05, False)
    EndIf
    If BOTVar_Strength_ResistanceFrost.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_ResistanceFrost_Stage05, False)
    EndIf
    PlayerRef.AddSpell(BOTSpell_Power_VampireRaiseThrall_Stage05, False)
    If BOTVar_Strength_FortifyStrength.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_FortifyMelee_Stage05, False)
    EndIf
    If BOTVar_Strength_FortifyIllusion.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_FortifyIllusion_Stage05, False)
    EndIf
    If BOTVar_Strength_FortifySneak.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_FortifySneak_Stage05, False)
    EndIf
    If (BOTVar_VampireHate.getValue() == (3 as Int) as Float) || (BOTVar_VampireHate.getValue() == (4 as Int) as Float) || (BOTVar_VampireHate.getValue() == (5 as Int) as Float)
      Self.AddHate()
    EndIf
    If BOTVar_Weakness_SunDamage.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Weakness_SunDamage_Stage005, False)
    EndIf
    If BOTVar_Weakness_SunRegen.getValue() == (1 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Weakness_SunRegen_Stage05, False)
    EndIf
    If BOTVar_Strength_FortifySpeed.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strenght_VampiricSpeed_Stage05, False)
    EndIf
    If BOTVar_Strength_FortifyHealRate.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_FortifyHealRate_Stage05, False)
    EndIf
    If BOTVar_Strength_ResistanceNormalWeapons.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_ResistNormalWeapons_Stage05, False)
    EndIf
    If BOTVar_Strength_FortifyAttackDamage.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_FortifyAttackDamage_Stage05, False)
    EndIf
    If BOTVar_Strength_FortifyIceMagic.getValue() != (0 as Int) as Float
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_FortifyIceMagic_Stage05, False)
    EndIf
    If BOTVar_VampireLordStage.getValue() == 1 as Float
      PlayerRef.AddSpell(DLC1VampireChange, False)
    EndIf
    If BOTVar_FeedingProgressionStage.getValue() > 7 as Float
      PlayerRef.AddSpell(VampireCharm, False)
    EndIf
    If PlayerRef.hasspell(BOTSpell_Ability_Dummy_VampireStage01 as Form)
      Self.RemoveStage01()
      Self.StageNotification(0)
    EndIf
    If PlayerRef.hasspell(BOTSpell_Ability_Dummy_VampireStage02 as Form)
      Self.RemoveStage02()
      Self.StageNotification(0)
    EndIf
    If PlayerRef.hasspell(BOTSpell_Ability_Dummy_VampireStage03 as Form)
      Self.RemoveStage03()
      Self.StageNotification(0)
    EndIf
    If PlayerRef.hasspell(BOTSpell_Ability_Dummy_VampireStage04 as Form)
      Self.RemoveStage04()
      Self.StageNotification(0)
    EndIf
    If BOTVar_Strength_FortifyJump.getValue() != (0 as Int) as Float
      PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_FortifyJump)
      PlayerRef.AddSpell(BOTSpell_Ability_Strength_FortifyJump, False)
    EndIf
  EndIf
EndFunction

Function StageNotification(Int StageMovement)
  If BOTVar_StarvationCheck.getValue() != 3 as Float
    VampireTransformDecreaseISMD.applyCrossFade(2.0)
    Utility.Wait(2.0)
    ImageSpaceModifier.removeCrossFade(1.0)
  EndIf
  If StageMovement == 0
    If BOTVar_StageProgression.getValue() == (0 as Int) as Float
      Debug.notification("Your powers grow as you feed.")
    Else
      Debug.notification("Your powers grow as you hunger")
    EndIf
  ElseIf BOTVar_StageProgression.getValue() == (0 as Int) as Float
    Debug.notification("Your powers recede as you hunger.")
  Else
    Debug.notification("Your powers recede as you feed")
  EndIf
EndFunction

Function RemoveStage01()
  PlayerRef.RemoveSpell(BOTSpell_Ability_Dummy_VampireStage01)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Weakness_ResistanceFire_Stage01)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_ResistanceFrost_Stage01)
  PlayerRef.RemoveSpell(BOTSpell_Power_VampireRaiseThrall_Stage01)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_FortifyMelee_Stage01)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strenght_VampiricSpeed_Stage01)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Weakness_SunRegen_Stage01)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_FortifyIllusion_Stage01)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_FortifySneak_Stage01)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Weakness_SunDamage_Stage001)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_FortifyHealRate_Stage01)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_ResistNormalWeapons_Stage01)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_FortifyAttackDamage_Stage01)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_FortifyIceMagic_Stage01)
  Self.RemoveHate()
EndFunction

Function RemoveStage02()
  PlayerRef.RemoveSpell(BOTSpell_Ability_Dummy_VampireStage02)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Weakness_ResistanceFire_Stage02)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_ResistanceFrost_Stage02)
  PlayerRef.RemoveSpell(BOTSpell_Power_VampireRaiseThrall_Stage02)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_FortifyMelee_Stage02)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strenght_VampiricSpeed_Stage02)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Weakness_SunRegen_Stage02)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_FortifyIllusion_Stage02)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_FortifySneak_Stage02)
  PlayerRef.RemoveSpell(VampireCharm)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Weakness_SunDamage_Stage002)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_FortifyHealRate_Stage02)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_ResistNormalWeapons_Stage02)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_FortifyAttackDamage_Stage02)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_FortifyIceMagic_Stage02)
  Self.RemoveHate()
EndFunction

Function RemoveStage03()
  PlayerRef.RemoveSpell(BOTSpell_Ability_Dummy_VampireStage03)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Weakness_ResistanceFire_Stage03)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_ResistanceFrost_Stage03)
  PlayerRef.RemoveSpell(BOTSpell_Power_VampireRaiseThrall_Stage03)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_FortifyMelee_Stage03)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strenght_VampiricSpeed_Stage03)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Weakness_SunRegen_Stage03)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_FortifyIllusion_Stage03)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_FortifySneak_Stage03)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Weakness_SunDamage_Stage003)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_FortifyHealRate_Stage03)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_ResistNormalWeapons_Stage03)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_FortifyAttackDamage_Stage03)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_FortifyIceMagic_Stage03)
  Self.RemoveHate()
EndFunction

Function RemoveStage04()
  PlayerRef.RemoveSpell(BOTSpell_Ability_Dummy_VampireStage04)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Weakness_ResistanceFire_Stage04)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_ResistanceFrost_Stage04)
  PlayerRef.RemoveSpell(BOTSpell_Power_VampireRaiseThrall_Stage04)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_FortifyMelee_Stage04)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strenght_VampiricSpeed_Stage04)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Weakness_SunRegen_Stage04)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_FortifyIllusion_Stage04)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_FortifySneak_Stage04)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Weakness_SunDamage_Stage004)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_FortifyHealRate_Stage04)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_ResistNormalWeapons_Stage04)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_FortifyAttackDamage_Stage04)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_FortifyIceMagic_Stage04)
  Self.RemoveHate()
EndFunction

Function RemoveStage05()
  PlayerRef.RemoveSpell(BOTSpell_Ability_Dummy_VampireStage05)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Weakness_ResistanceFire_Stage05)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_ResistanceFrost_Stage05)
  PlayerRef.RemoveSpell(BOTSpell_Power_VampireRaiseThrall_Stage05)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_FortifyMelee_Stage05)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strenght_VampiricSpeed_Stage05)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Weakness_SunRegen_Stage05)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_FortifyIllusion_Stage05)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_FortifySneak_Stage05)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Weakness_SunDamage_Stage005)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_FortifyHealRate_Stage05)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_ResistNormalWeapons_Stage05)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_FortifyAttackDamage_Stage05)
  PlayerRef.RemoveSpell(BOTSpell_Ability_Strength_FortifyIceMagic_Stage05)
  If BOTVar_VampireLordStage.getValue() == 1 as Float
    PlayerRef.RemoveSpell(DLC1VampireChange)
  EndIf
  Self.RemoveHate()
EndFunction

Function ChangeSunDamage()
  Self.PeriodicDamageCalc(BOTVar_Weakness_SunDamage_Damage, BOTSpell_Ability_Weakness_SunDamage_Stage01, 1)
  Self.PeriodicDamageCalc(BOTVar_Weakness_SunDamage_Damage, BOTSpell_Ability_Weakness_SunDamage_Stage02, 2)
  Self.PeriodicDamageCalc(BOTVar_Weakness_SunDamage_Damage, BOTSpell_Ability_Weakness_SunDamage_Stage03, 3)
  Self.PeriodicDamageCalc(BOTVar_Weakness_SunDamage_Damage, BOTSpell_Ability_Weakness_SunDamage_Stage04, 4)
  Self.PeriodicDamageCalc(BOTVar_Weakness_SunDamage_Damage, BOTSpell_Ability_Weakness_SunDamage_Stage05, 5)
EndFunction

Function ChangeTrespDamage()
  Self.PeriodicDamageCalc(BOTVar_Weakness_TrespDamage_Damage, BOTSpell_Ability_Weakness_TrespDamage, 1)
  Self.PeriodicDamageCalc(BOTVar_Weakness_TrespDamage_Damage, BOTSpell_Ability_Weakness_TrespDamage, 2)
  Self.PeriodicDamageCalc(BOTVar_Weakness_TrespDamage_Damage, BOTSpell_Ability_Weakness_TrespDamage, 3)
  Self.PeriodicDamageCalc(BOTVar_Weakness_TrespDamage_Damage, BOTSpell_Ability_Weakness_TrespDamage, 4)
  Self.PeriodicDamageCalc(BOTVar_Weakness_TrespDamage_Damage, BOTSpell_Ability_Weakness_TrespDamage, 5)
EndFunction

Function ChangeSilverEquipDamage()
  Self.PeriodicDamageCalc(BOTVar_Weakness_SilverDamageEquip_Damage, BOTSpell_Ability_Weakness_SilverDamageEquip, 1)
  Self.PeriodicDamageCalc(BOTVar_Weakness_SilverDamageEquip_Damage, BOTSpell_Ability_Weakness_SilverDamageEquip, 2)
  Self.PeriodicDamageCalc(BOTVar_Weakness_SilverDamageEquip_Damage, BOTSpell_Ability_Weakness_SilverDamageEquip, 3)
  Self.PeriodicDamageCalc(BOTVar_Weakness_SilverDamageEquip_Damage, BOTSpell_Ability_Weakness_SilverDamageEquip, 4)
  Self.PeriodicDamageCalc(BOTVar_Weakness_SilverDamageEquip_Damage, BOTSpell_Ability_Weakness_SilverDamageEquip, 5)
EndFunction

Function PeriodicDamageCalc(GlobalVariable damageVar, Spell spellToChange, Int Stage)
  Float HealthDamage = damageVar.getValue()
  HealthDamage *= 0.400000006 + (Stage as Float * 0.200000003)
  If damageVar != BOTVar_Weakness_SunDamage_Damage
    spellToChange.SetNthEffectMagnitude(Stage - 1, HealthDamage)
  Else
    spellToChange.SetNthEffectMagnitude(0, HealthDamage)
  EndIf
EndFunction

Function AddHate()
  PlayerRef.AddToFaction(VampirePCFaction)
  PlayerRef.SetAttackActorOnSight(True)
  Int i = 0
  While i < DLC1VampireHateFactions.GetSize()
    (DLC1VampireHateFactions.GetAt(i) as Faction).SetPlayerEnemy(True)
    i += 1
  EndWhile
EndFunction

Function RemoveHate()
  If (BOTVar_VampireHate.getValue() == 2 as Float) && (BOTVar_VampireStage.getValue() < 3 as Float) || (BOTVar_VampireHate.getValue() == 3 as Float) && (BOTVar_VampireStage.getValue() < 5 as Float) || (BOTVar_VampireHate.getValue() == 4 as Float) && (BOTVar_VampireStage.getValue() < 5 as Float) || (BOTVar_VampireHate.getValue() == 0 as Float)
    PlayerRef.RemoveFromFaction(VampirePCFaction)
    PlayerRef.SetAttackActorOnSight(False)
    Int i = 0
    While i < DLC1VampireHateFactions.GetSize()
      (DLC1VampireHateFactions.GetAt(i) as Faction).SetPlayerEnemy(False)
      i += 1
    EndWhile
  EndIf
EndFunction

; RCS 
Int Function GetRcsProxyRaceID(Race akRace, Race[] akRaceArray)
	; result start with 0(0-based)
  Int i = 0
	Int len = akRaceArray.Length
	While i < len
		If RaceCompatibility.GetIsRaceByProxy(akRaceArray[i], akRace)
			Return i
		EndIf
		i += 1
	EndWhile
	Return -1
EndFunction

Function BloodPotionHuman(Actor akActor)
  Self.ExtractPotion()
  ; RCS 
  ; Int RaceID = FeedRacesHuman.find(akActor.GetRace(), 0)
  Int RaceID = GetRcsProxyRaceID(akActor.GetRace(), FeedRacesHuman)
  If akActor.hasKeyword(Vampire)
    RaceID = 14
  EndIf
  Int potionCount = 1
  If BOTVar_PlayerRace.getValue() == 5 as Float
    Int chance = Utility.RandomInt(1, 100)
    If chance <= 20
      potionCount = 2
    EndIf
  EndIf
  If RaceID == 0 || RaceID == 1
    PlayerRef.additem(BloodPotionHumanList[8] as Form, potionCount, False)
  ElseIf RaceID == 2
    PlayerRef.additem(BloodPotionHumanList[6] as Form, potionCount, False)
  ElseIf RaceID == 3
    PlayerRef.additem(BloodPotionHumanList[9] as Form, potionCount, False)
  ElseIf RaceID == 4
    PlayerRef.additem(BloodPotionHumanList[0] as Form, potionCount, False)
  ElseIf RaceID == 5
    PlayerRef.additem(BloodPotionHumanList[1] as Form, potionCount, False)
  ElseIf RaceID == 6
    PlayerRef.additem(BloodPotionHumanList[2] as Form, potionCount, False)
  ElseIf RaceID == 7
    PlayerRef.additem(BloodPotionHumanList[5] as Form, potionCount, False)
  ElseIf RaceID == 8
    PlayerRef.additem(BloodPotionHumanList[7] as Form, potionCount, False)
  ElseIf RaceID == 9
    PlayerRef.additem(BloodPotionHumanList[10] as Form, potionCount, False)
  ElseIf RaceID == 10
    PlayerRef.additem(BloodPotionHumanList[11] as Form, potionCount, False)
  ElseIf RaceID == 11
    PlayerRef.additem(BloodPotionHumanList[3] as Form, potionCount, False)
  ElseIf RaceID == 12
    PlayerRef.additem(BloodPotionHumanList[4] as Form, potionCount, False)
  ElseIf RaceID == 13
    PlayerRef.additem(BloodPotionAnimalList[14] as Form, potionCount, False)
  ElseIf RaceID == 14
    PlayerRef.additem(BloodPotionHumanList[12] as Form, potionCount, False)
  EndIf
EndFunction

Function BloodPotionAnimal(Actor akActor)
  Self.ExtractPotion()
  Int potionCount = 1
  If BOTVar_PlayerRace.getValue() == 5 as Float
    Int chance = Utility.RandomInt(1, 100)
    If chance <= 10
      potionCount = 2
    EndIf
  EndIf
  Int RaceID = FeedRacesAnimal.find(akActor.GetRace(), 0)
  If RaceID == 0 || RaceID == 1 || RaceID == 2
    PlayerRef.additem(BloodPotionAnimalList[0] as Form, potionCount, False)
  ElseIf RaceID == 3 || RaceID == 4 || RaceID == 5
    PlayerRef.additem(BloodPotionAnimalList[5] as Form, potionCount, False)
  ElseIf RaceID == 6 || RaceID == 7
    PlayerRef.additem(BloodPotionAnimalList[11] as Form, potionCount, False)
  ElseIf RaceID == 8 || RaceID == 9
    PlayerRef.additem(BloodPotionAnimalList[12] as Form, potionCount, False)
  ElseIf RaceID == 10
    PlayerRef.additem(BloodPotionAnimalList[8] as Form, potionCount, False)
  ElseIf RaceID == 11 || RaceID == 12
    PlayerRef.additem(BloodPotionAnimalList[4] as Form, potionCount, False)
  ElseIf RaceID == 13 || RaceID == 14
    PlayerRef.additem(BloodPotionAnimalList[6] as Form, potionCount, False)
  ElseIf RaceID == 15
    PlayerRef.additem(BloodPotionAnimalList[9] as Form, potionCount, False)
  ElseIf RaceID == 16
    PlayerRef.additem(BloodPotionAnimalList[3] as Form, potionCount, False)
  ElseIf RaceID == 17
    PlayerRef.additem(BloodPotionAnimalList[2] as Form, potionCount, False)
  ElseIf RaceID == 18
    PlayerRef.additem(BloodPotionAnimalList[10] as Form, potionCount, False)
  ElseIf RaceID == 19
    PlayerRef.additem(BloodPotionAnimalList[7] as Form, potionCount, False)
  ElseIf RaceID == 20 || RaceID == 24
    PlayerRef.additem(BloodPotionAnimalList[14] as Form, potionCount, False)
  ElseIf RaceID == 21 || RaceID == 22
    PlayerRef.additem(BloodPotionAnimalList[13] as Form, potionCount, False)
  ElseIf RaceID == 23
    PlayerRef.additem(BloodPotionAnimalList[1] as Form, potionCount, False)
  EndIf
EndFunction

Function ExtractPotion()
  If PlayerRef.GetItemCount(BOTMisc_BloodPotionEmpty as Form) > 0 && (BOTVar_BloodPotionBottles.getValue() == 1 as Float) || (BOTVar_BloodPotionBottles.getValue() == 0 as Float)
    If BOTVar_BloodPotionBottles.getValue() == 1 as Float
      PlayerRef.RemoveItem(BOTMisc_BloodPotionEmpty as Form, 1, False, None)
    EndIf
    PlayerRef.PlayIdle(CheckCorpse)
  Else
    Debug.messagebox("You don't have a empty blood philter to extract blood into.")
  EndIf
EndFunction

Function blinkFeed(Actor akActor, Float damageHealth)
  damageHealth = akActor.getActorValue("Health") * 0.349999994
  akActor.DamageAV("Health", damageHealth)
EndFunction

Function iceFeed(Actor akActor, Float damageHealth)
  Self.AddKeySpell(akActor)
  Self.VampireFeed(akActor, 0)
  Utility.Wait(1.0)
  damageHealth = akActor.getActorValue("Health") * 0.349999994
  akActor.DamageAV("Health", damageHealth)
EndFunction

Function FeedingStart(Actor akActor, Int FeedingSource, Int FeedingType, Int IsWerewolf)
  If FeedingSource == 1
    Int RaceID = 0
    ; RCS 
    ; RaceID = FeedRacesHuman.find(akActor.GetRace(), 0)
    RaceID = GetRcsProxyRaceID(akActor.GetRace(), FeedRacesHuman)
    If IsWerewolf == 1
      RaceID = 13
    EndIf
    If akActor.hasKeyword(Vampire)
      RaceID = 14
    EndIf
    If BOTVar_PlayerRace.getValue() == 2 as Float
      Self.VampireFeedHumanBreton(akActor)
    EndIf
    Self.HumanFeed(RaceID, FeedingType, akActor)
  ElseIf FeedingSource == 2
    Int raceid = FeedRacesAnimal.find(akActor.GetRace(), 0)
    Self.AnimalFeed(raceid, FeedingType)
    If BOTVar_PlayerRace.getValue() == 10 as Float
      Self.VampireFeedAnimalBosmer(akActor)
    EndIf
  EndIf
EndFunction

Function AnimalFeed(Int RaceID, Int FeedingType)
  Int FeedHumanIncrBloodPoints
  Int FeedXP = 0
  If RaceID == 0 || RaceID == 1 || RaceID == 2
    FeedHumanIncrBloodPoints = Utility.RandomInt(56250, 68750)
    BOTVar_VampireHuntersTresholdRNG = Utility.RandomInt(200, 250)
    BOTSpell_Spell_Feed_Animal_Bear_Buff.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    BOTSpell_Spell_Feed_Animal_Bear_Debuff.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    FeedXP = 125
  ElseIf RaceID == 3 || RaceID == 4 || RaceID == 5
    FeedHumanIncrBloodPoints = Utility.RandomInt(22500, 27500)
    BOTVar_VampireHuntersTresholdRNG = Utility.RandomInt(175, 225)
    BOTSpell_Spell_Feed_Animal_Canine_Buff.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    BOTSpell_Spell_Feed_Animal_Canine_Debuff.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    FeedXP = 100
  ElseIf RaceID == 6 || RaceID == 7
    FeedHumanIncrBloodPoints = Utility.RandomInt(40500, 49500)
    BOTVar_VampireHuntersTresholdRNG = Utility.RandomInt(175, 225)
    BOTSpell_Spell_Feed_Animal_Sabrecat_Buff.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    BOTSpell_Spell_Feed_Animal_Sabrecat_Debuff.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    FeedXP = 100
  ElseIf RaceID == 8 || RaceID == 9
    FeedHumanIncrBloodPoints = Utility.RandomInt(11250, 13750)
    BOTVar_VampireHuntersTresholdRNG = Utility.RandomInt(25, 75)
    BOTSpell_Spell_Feed_Animal_Skeever_Buff.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    BOTSpell_Spell_Feed_Animal_Skeever_Debuff.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    FeedXP = 25
  ElseIf RaceID == 10
    FeedHumanIncrBloodPoints = Utility.RandomInt(78750, 96250)
    BOTVar_VampireHuntersTresholdRNG = Utility.RandomInt(175, 225)
    BOTSpell_Spell_Feed_Animal_Horse_Buff.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    BOTSpell_Spell_Feed_Animal_Horse_Debuff.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    FeedXP = 100
  ElseIf RaceID == 11 || RaceID == 12
    FeedHumanIncrBloodPoints = Utility.RandomInt(33750, 41250)
    BOTVar_VampireHuntersTresholdRNG = Utility.RandomInt(75, 125)
    BOTSpell_Spell_Feed_Animal_Deer_Buff.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    BOTSpell_Spell_Feed_Animal_Deer_Debuff.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    FeedXP = 50
  ElseIf RaceID == 13 || RaceID == 14
    FeedHumanIncrBloodPoints = Utility.RandomInt(22500, 27500)
    BOTVar_VampireHuntersTresholdRNG = Utility.RandomInt(50, 100)
    BOTSpell_Spell_Feed_Animal_Goat_Buff.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    BOTSpell_Spell_Feed_Animal_Goat_Debuff.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    FeedXP = 40
  ElseIf RaceID == 15
    FeedHumanIncrBloodPoints = Utility.RandomInt(112500, 137500)
    BOTVar_VampireHuntersTresholdRNG = Utility.RandomInt(125, 175)
    BOTSpell_Spell_Feed_Animal_Mammoth_Buff.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    BOTSpell_Spell_Feed_Animal_Mammoth_Debuff.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    FeedXP = 200
  ElseIf RaceID == 16
    FeedHumanIncrBloodPoints = Utility.RandomInt(56250, 68750)
    BOTVar_VampireHuntersTresholdRNG = Utility.RandomInt(125, 175)
    BOTSpell_Spell_Feed_Animal_Goat_Buff.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    BOTSpell_Spell_Feed_Animal_Goat_Debuff.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    FeedXP = 75
  ElseIf RaceID == 17
    FeedHumanIncrBloodPoints = Utility.RandomInt(4500, 5500)
    BOTVar_VampireHuntersTresholdRNG = Utility.RandomInt(10, 25)
    BOTSpell_Spell_Feed_Animal_Chicken_Buff.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    BOTSpell_Spell_Feed_Animal_Chicken_Debuff.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    FeedXP = 10
  ElseIf RaceID == 18
    FeedHumanIncrBloodPoints = Utility.RandomInt(4500, 5500)
    BOTVar_VampireHuntersTresholdRNG = Utility.RandomInt(10, 25)
    BOTSpell_Spell_Feed_Animal_Rabbit_Buff.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    BOTSpell_Spell_Feed_Animal_Rabbit_Debuff.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    FeedXP = 10
  ElseIf RaceID == 19
    FeedHumanIncrBloodPoints = Utility.RandomInt(67500, 82500)
    BOTVar_VampireHuntersTresholdRNG = Utility.RandomInt(175, 225)
    BOTSpell_Spell_Feed_Animal_Horker_Buff.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    BOTSpell_Spell_Feed_Animal_Horker_Debuff.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    FeedXP = 100
  ElseIf RaceID == 20 || RaceID == 24
    FeedHumanIncrBloodPoints = Utility.RandomInt(56250, 68750)
    BOTVar_VampireHuntersTresholdRNG = Utility.RandomInt(200, 250)
    BOTSpell_Spell_Feed_Animal_Werewolf.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    FeedXP = 125
  ElseIf RaceID == 21 || RaceID == 22
    FeedHumanIncrBloodPoints = Utility.RandomInt(40500, 49500)
    BOTVar_VampireHuntersTresholdRNG = Utility.RandomInt(175, 225)
    BOTSpell_Spell_Feed_Animal_Troll_Buff.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    BOTSpell_Spell_Feed_Animal_Troll_Debuff.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    FeedXP = 100
  ElseIf RaceID == 23
    FeedHumanIncrBloodPoints = Utility.RandomInt(22500, 27500)
    BOTVar_VampireHuntersTresholdRNG = Utility.RandomInt(50, 100)
    BOTSpell_Spell_Feed_Animal_Boar_Buff.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    BOTSpell_Spell_Feed_Animal_Boar_Debuff.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    FeedXP = 40
  EndIf
  FeedHumanIncrBloodPoints = (FeedHumanIncrBloodPoints as Float * BOTVar_FeedMult.getValue()) as Int
  HealAmount = (FeedHumanIncrBloodPoints as Float / 250000.0) * 2.0
  If FeedingType == 3
    FeedHumanIncrBloodPoints = (FeedHumanIncrBloodPoints as Float * 0.75 as Float) as Int
    BOTVar_VampireHuntersTresholdRNG = (BOTVar_VampireHuntersTresholdRNG as Float * 0.75) as Int
  EndIf
  Self.FeedingStuff(HealAmount, FeedHumanIncrBloodPoints, BOTVar_VampireHuntersTresholdRNG, FeedXP as Float, FeedingType, 1, 0, None)
  If BOTVar_FeedingProgression.getValue() == 1 as Float
    Self.FeedProgression(FeedingType)
  EndIf
EndFunction

Function HumanFeed(Int RaceID, Int FeedingType, Actor akActor)
  Int FeedHumanIncrBloodPoints
  If BOTVar_FeedingProgressionStage.getValue() > 9 as Float
    If RaceID == 0 || RaceID == 1
      BOTSpell_Spell_Feed_Human_Nord.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    ElseIf RaceID == 2
      BOTSpell_Spell_Feed_Human_Imperial.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    ElseIf RaceID == 3
      BOTSpell_Spell_Feed_Human_Orc.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    ElseIf RaceID == 4
      BOTSpell_Spell_Feed_Human_Argonian.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    ElseIf RaceID == 5
      BOTSpell_Spell_Feed_Human_Breton.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    ElseIf RaceID == 6
      BOTSpell_Spell_Feed_Human_DarkElf.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    ElseIf RaceID == 7
      BOTSpell_Spell_Feed_Human_HighElf.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    ElseIf RaceID == 8
      BOTSpell_Spell_Feed_Human_Khajiit.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    ElseIf RaceID == 9
      BOTSpell_Spell_Feed_Human_Redguard.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    ElseIf RaceID == 10
      BOTSpell_Spell_Feed_Human_WoodElf.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    ElseIf RaceID == 11
      BOTSpell_Spell_Feed_Human_Falmer_Buff.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    ElseIf RaceID == 12
      BOTSpell_Spell_Feed_Human_Giant_Buff.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    ElseIf RaceID == 13
      BOTSpell_Spell_Feed_Animal_Werewolf.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    ElseIf RaceID == 14
      BOTSpell_Spell_Feed_Human_Vampire.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
    EndIf
  EndIf
  If RaceID == 11 || RaceID == 12 || RaceID == 14
    If RaceID == 11
      BOTSpell_Spell_Feed_Human_Falmer_Debuff.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
      FeedHumanIncrBloodPoints = Utility.RandomInt(33750, 41250)
      BOTVar_VampireHuntersTresholdRNG = Utility.RandomInt(25, 50)
    ElseIf RaceID == 12
      BOTSpell_Spell_Feed_Human_Giant_Debuff.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
      FeedHumanIncrBloodPoints = Utility.RandomInt(90000, 111000)
      BOTVar_VampireHuntersTresholdRNG = Utility.RandomInt(100, 125)
    ElseIf RaceID == 14
      FeedHumanIncrBloodPoints = Utility.RandomInt(11250, 49500)
      BOTVar_VampireHuntersTresholdRNG = Utility.RandomInt(50, 75)
      DLC1VampireBloodPoints.value = DLC1VampireBloodPoints.value + 100 as Float
    EndIf
  Else
    FeedHumanIncrBloodPoints = Utility.RandomInt(40500, 49500)
    BOTVar_VampireHuntersTresholdRNG = Utility.RandomInt(175, 225)
  EndIf
  FeedHumanIncrBloodPoints = (FeedHumanIncrBloodPoints as Float * BOTVar_FeedMult.getValue()) as Int
  If FeedingType == 0
    HealAmount = (FeedHumanIncrBloodPoints as Float / 250000.0) * 2.0
    Self.FeedingStuff(HealAmount, FeedHumanIncrBloodPoints, BOTVar_VampireHuntersTresholdRNG, 100 as Float, FeedingType, 0, 0, None)
    If BOTVar_FeedingProgression.getValue() == 1 as Float
      Self.FeedProgression(FeedingType)
    EndIf
  ElseIf FeedingType == 1
    FeedHumanIncrBloodPoints = (FeedHumanIncrBloodPoints as Float * 1.75) as Int
    HealAmount = (FeedHumanIncrBloodPoints as Float / 250000.0) * 2.0
    BOTVar_VampireHuntersTresholdRNG *= 2.5 as Int
    Self.FeedingStuff(HealAmount, FeedHumanIncrBloodPoints, BOTVar_VampireHuntersTresholdRNG, 175 as Float, FeedingType, 0, 1, akActor)
    If BOTVar_FeedingProgression.getValue() == 1 as Float
      Self.FeedProgression(FeedingType)
    EndIf
  ElseIf FeedingType == 2
    FeedHumanIncrBloodPoints = (FeedHumanIncrBloodPoints as Float * 0.75) as Int
    HealAmount = (FeedHumanIncrBloodPoints as Float / 250000.0) * 2.0
    BOTVar_VampireHuntersTresholdRNG = (BOTVar_VampireHuntersTresholdRNG as Float * 0.75) as Int
    Self.FeedingStuff(HealAmount, FeedHumanIncrBloodPoints, BOTVar_VampireHuntersTresholdRNG, 50 as Float, FeedingType, 0, 0, None)
    If BOTVar_FeedingProgression.getValue() == 1 as Float
      Self.FeedProgression(FeedingType)
    EndIf
  ElseIf FeedingType == 3
    FeedHumanIncrBloodPoints = (FeedHumanIncrBloodPoints as Float * 0.5 as Float) as Int
    HealAmount = (FeedHumanIncrBloodPoints as Float / 250000.0) * 2.0
    BOTVar_VampireHuntersTresholdRNG = (BOTVar_VampireHuntersTresholdRNG as Float * 0.5) as Int
    Self.FeedingStuff(HealAmount, FeedHumanIncrBloodPoints, BOTVar_VampireHuntersTresholdRNG, 50 as Float, FeedingType, 0, 0, None)
    If BOTVar_FeedingProgression.getValue() == 1 as Float
      Self.FeedProgression(FeedingType)
    EndIf
  EndIf
EndFunction

Function VampireFeed(Actor akActor, Int IsWerewolf)
  BOTVar_Stats_FeedCounter.Mod(1 as Float)
  Self.FeedingStart(akActor, 1, 0, IsWerewolf)
  Float CurrentMaxValue = Math.Ceiling(akActor.getActorValue("Health") / akActor.GetActorValuePercentage("Health")) as Float
  Float healHealth = CurrentMaxValue * 0.200000003
  akActor.DamageAV("Health", (healHealth as Int) as Float)
EndFunction

Function VampireFeast(Actor ActorToKill)
  BOTVar_Stats_FeastCounter.Mod(1 as Float)
  Self.FeedingStart(ActorToKill, 1, 1, 0)
EndFunction

Function ResistFeed(Actor akActor, Int FeedingType)
  Int resistChance = Utility.RandomInt(0, 100)
  Float resistMult = (akActor.GetLevel() / PlayerRef.GetLevel()) as Float
  If resistMult > 1.5
    resistMult *= 2 as Float
  EndIf
  If FeedingType == 0
    If (resistChance as Float <= (10 as Float * resistMult)) && (BOTVar_ResistFeeding.getValue() == 1 as Float)
      akActor.SendAssaultAlarm()
      Debug.SendAnimationEvent(PlayerRef as ObjectReference, "staggerStart")
    Else
      DLC1VampireTurn.PlayerBitesMe(akActor)
      Game.GetPlayer().StartVampireFeed(akActor)
      Self.AddKeySpell(akActor)
      Self.VampireFeed(akActor, 0)
    EndIf
  EndIf
  If FeedingType == 1
    If (resistChance as Float <= (30 as Float * resistMult)) && (BOTVar_ResistDraining.getValue() == 1 as Float) || (resistChance as Float <= (15 as Float * resistMult)) && (BOTVar_ResistDraining.getValue() == 2 as Float)
      akActor.SendAssaultAlarm()
      Debug.SendAnimationEvent(PlayerRef as ObjectReference, "staggerStart")
    Else
      DLC1VampireTurn.PlayerBitesMe(akActor)
      Game.GetPlayer().StartVampireFeed(akActor)
      Self.AddKeySpell(akActor)
      Self.VampireFeast(akActor)
    EndIf
  EndIf
EndFunction

Function PotionOfThirst(Actor akActor)
  Float CurrentMaxValue = Math.Ceiling(akActor.getActorValue("Health") / akActor.GetActorValuePercentage("Health")) as Float
  Float healHealth = CurrentMaxValue * 0.200000003
  akActor.DamageAV("Health", healHealth)
  Self.VampireBloodLevel(50000, 1, 0)
  Self.VampireStages(1)
EndFunction

Function FeedingStuff(Float percentageHealth, Int FeedHumanIncrBloodPoints, Int BOTVar_VampireHuntersTresholdRNG, Float BloodPointsIncrease, Int FeedingType, Int FeedingSource, Int Kill, Actor toKill)
  Float CurrentMaxValue = Math.Ceiling(PlayerRef.getActorValue("Health") / PlayerRef.GetActorValuePercentage("Health")) as Float
  Float healHealth = CurrentMaxValue * percentageHealth
  Int PlayerRace = BOTVar_PlayerRace.getValue() as Int
  If BOTVar_FeedingProgressionStage.getValue() >= 3 as Float
    PlayerRef.RestoreAV("Health", (healHealth as Int) as Float)
    If PlayerRace == 9
      CurrentMaxValue = Math.Ceiling(PlayerRef.getActorValue("Stamina") / PlayerRef.GetActorValuePercentage("Stamina")) as Float
      Float healStamina = CurrentMaxValue * percentageHealth
      PlayerRef.RestoreAV("Stamina", (healStamina as Int) as Float)
    ElseIf PlayerRace == 4
      CurrentMaxValue = Math.Ceiling(PlayerRef.getActorValue("Magicka") / PlayerRef.GetActorValuePercentage("Magicka")) as Float
      Float healMagicka = CurrentMaxValue * percentageHealth
      PlayerRef.RestoreAV("Magicka", (healMagicka as Int) as Float)
    EndIf
  EndIf
  If PlayerRace == 4
    BOTSpell_Spell_Racial_HighElf_ManaAddict.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
  ElseIf PlayerRace == 9
    BOTSpell_Spell_Racial_Redguard_BloodDoping.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
  ElseIf PlayerRace == 8
    BOTSpell_Spell_Racial_Orc_Bloodrage.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
  ElseIf PlayerRace == 3
    BOTSpell_Spell_Racial_DarkElf_BloodPowered.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
  EndIf
  If FeedingType != 5
    VampireTransformDecreaseISMD.applyCrossFade(2.0)
    Utility.Wait(2.0)
    ImageSpaceModifier.removeCrossFade(2.0)
  EndIf
  Game.IncrementStat("Necks Bitten", 1)
  BOTVar_VampireHuntersTreshold += BOTVar_VampireHuntersTresholdRNG
  If BOTVar_FeedingProgressionStage.getValue() < 2 as Float
    FeedHumanIncrBloodPoints = (FeedHumanIncrBloodPoints as Float * 0.75) as Int
  EndIf
  If FeedingSource == 0
    Self.VampireBloodLevel(FeedHumanIncrBloodPoints, 0, 0)
  Else
    Self.VampireBloodLevel(FeedHumanIncrBloodPoints, 0, 1)
  EndIf
  If Kill == 1
    toKill.Kill(None)
  EndIf
  If FeedingType != 3 && FeedingType != 4
    Self.VampireStages(0)
  Else
    If (BOTVar_BloodPotionBottles.getValue() == 1 as Float) && FeedingType == 3
      PlayerRef.additem(BOTMisc_BloodPotionEmpty as Form, 1, False)
    EndIf
    Self.VampireStages(1)
  EndIf
  If PlayerRace == 4
    BloodPointsIncrease *= 1.25 as Float
  EndIf
  DLC1VampireBloodPoints.value = DLC1VampireBloodPoints.value + BloodPointsIncrease
  Self.VampirePerkCheck()
EndFunction

Function PassBloodline(Actor ActorToVampirism)
  Int FeedHumanIncrBloodPoints = Utility.RandomInt(15000, 25000)
  BOTVar_VampireHuntersTresholdRNG = Utility.RandomInt(200, 275)
  Self.FeedingStuff(0.75, FeedHumanIncrBloodPoints, BOTVar_VampireHuntersTresholdRNG, 75 as Float, 0, 0, 0, None)
  If BOTVar_VampireCreateRace.getValue() == 1 as Float
  	; RCS 
    ; If ActorToVampirism.GetActorBase().GetRace() == ArgonianRace
    ;   ActorToVampirism.SetRace(ArgonianRaceVampire)
    ; ElseIf ActorToVampirism.GetActorBase().GetRace() == BretonRace
    ;   ActorToVampirism.SetRace(BretonRaceVampire)
    ; ElseIf ActorToVampirism.GetActorBase().GetRace() == DarkElfRace
    ;   ActorToVampirism.SetRace(DarkElfRaceVampire)
    ; ElseIf ActorToVampirism.GetActorBase().GetRace() == HighElfRace
    ;   ActorToVampirism.SetRace(HighElfRaceVampire)
    ; ElseIf ActorToVampirism.GetActorBase().GetRace() == ImperialRace
    ;   ActorToVampirism.SetRace(ImperialRaceVampire)
    ; ElseIf ActorToVampirism.GetActorBase().GetRace() == KhajiitRace
    ;   ActorToVampirism.SetRace(KhajiitRaceVampire)
    ; ElseIf ActorToVampirism.GetActorBase().GetRace() == NordRace
    ;   ActorToVampirism.SetRace(NordRaceVampire)
    ; ElseIf ActorToVampirism.GetActorBase().GetRace() == OrcRace
    ;   ActorToVampirism.SetRace(OrcRaceVampire)
    ; ElseIf ActorToVampirism.GetActorBase().GetRace() == RedguardRace
    ;   ActorToVampirism.SetRace(RedguardRaceVampire)
    ; ElseIf ActorToVampirism.GetActorBase().GetRace() == WoodElfRace
    ;   ActorToVampirism.SetRace(WoodElfRaceVampire)
    ; EndIf
    Race VampireRace = RaceCompatibility.GetVampireRaceByRace(ActorToVampirism.GetActorBase().GetRace())
    If VampireRace != None
    	ActorToVampirism.SetRace(VampireRace)
    EndIf

  EndIf
  ActorToVampirism.AddSpell(DLC1SeranaDrain02, True)
  ActorToVampirism.AddSpell(DLC1RaiseZombieRightHand, True)
  ActorToVampirism.AddSpell(IceSpikeRightHand, True)
  ActorToVampirism.AddSpell(BOTSpell_Ability_Weakness_ResistanceFire_Stage03, True)
  ActorToVampirism.AddSpell(BOTSpell_Ability_Strength_ResistanceFrost_Stage03, True)
  ActorToVampirism.AddSpell(BOTSpell_Power_VampireRaiseThrall_Stage03, True)
  ActorToVampirism.AddSpell(BOTSpell_Ability_Strength_FortifyMelee_Stage03, True)
  ActorToVampirism.SetRelationshipRank(PlayerRef, 4)
  PlayerRef.SetRelationshipRank(ActorToVampirism, 4)
  ActorToVampirism.AddToFaction(CurrentFollowerFaction)
  ActorToVampirism.SetFactionRank(CurrentFollowerFaction, -1)
  ActorToVampirism.AddToFaction(PotentialFollowerFaction)
  ActorToVampirism.SetFactionRank(PotentialFollowerFaction, 0)
  ActorToVampirism.AddToFaction(PotentialMarriageFaction)
  ActorToVampirism.SetFactionRank(PotentialMarriageFaction, 0)
  ActorToVampirism.SetRelationshipRank(PlayerRef, 4)
  ActorToVampirism.SetActorValue("Aggression", 1 as Float)
  ActorToVampirism.SetActorValue("Confidence", 4 as Float)
  ActorToVampirism.SetActorValue("Assistance", 2 as Float)
  ActorToVampirism.SetActorValue("Morality", 0 as Float)
EndFunction

Function VampireFeedBed()
  PlayerRef.PlayIdle(VampireFeedingBedRight)
EndFunction

Function VampireFeedBedRoll()
  PlayerRef.PlayIdle(VampireFeedingBedrollRight)
EndFunction

Function VampireFeedAnimalBosmer(Actor akAnimal)
  Int AnimalHealth = akAnimal.GetBaseActorValue("Health") as Int
  Int AnimalStamina = akAnimal.GetBaseActorValue("Stamina") as Int
  If PlayerRef.HasMagiceffect(BOTEffect_Spell_Racial_Bosmer_LifedrainHealth) && BOTVar_RacialBosmer_LifedrainTotal.getValue() > ((AnimalHealth + AnimalStamina) as Float * 0.100000001)
    
  Else
    PlayerRef.RemoveSpell(BOTSpell_Spell_Racial_Bosmer_Lifedrain)
    BOTVar_RacialBosmer_LifedrainTotal.setValue((AnimalHealth + AnimalStamina) as Float * 0.100000001)
    BOTSpell_Spell_Racial_Bosmer_Lifedrain.SetNthEffectMagnitude(0, AnimalHealth as Float * 0.100000001)
    BOTSpell_Spell_Racial_Bosmer_Lifedrain.SetNthEffectMagnitude(1, AnimalStamina as Float * 0.100000001)
    BOTSpell_Spell_Racial_Bosmer_Lifedrain.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
  EndIf
EndFunction

Function VampireFeedHumanBreton(Actor akHuman)
  Int HumanMagicka = akHuman.GetBaseActorValue("Magicka") as Int
  If PlayerRef.HasMagiceffect(BOTEffect_Spell_Racial_Breton_ManaLeech) && BOTVar_RacialBreton_MagickaTotal.getValue() > (HumanMagicka as Float * 0.25)
    
  Else
    PlayerRef.RemoveSpell(BOTSpell_Spell_Racial_Breton_ManaLeech)
    BOTVar_RacialBreton_MagickaTotal.setValue(HumanMagicka as Float * 0.25)
    BOTSpell_Spell_Racial_Breton_ManaLeech.SetNthEffectMagnitude(0, HumanMagicka as Float * 0.25)
    BOTSpell_Spell_Racial_Breton_ManaLeech.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference)
  EndIf
EndFunction

Function AddKeySpell(Actor akActor)
  akActor.AddSpell(BOTSpell_Spell_Dummy_NoBloodExtraction, True)
  BOTSpell_Spell_Dummy_NoBloodExtraction.Cast(akActor as ObjectReference, None)
EndFunction

Function FeedProgression(Int FeedingType)
  Float FeedPoints
  If FeedingType == 0
    FeedPoints = 1 as Float
  ElseIf FeedingType == 1
    FeedPoints = 3 as Float
  ElseIf FeedingType == 2 || FeedingType == 3
    FeedPoints = 0.5
  EndIf
  BOTVar_FeedingProgressionFeedingCount.setValue(BOTVar_FeedingProgressionFeedingCount.getValue() + FeedPoints)
  Float FeedingPointsReq = BOTVar_FeedingProgressionFeedingCountMax.getValue() / 20 as Float
  If BOTVar_FeedingProgressionFeedingCount.getValue() > FeedingPointsReq * 20.0 && (BOTVar_FeedingProgressionStage.getValue() == 9 as Float)
    BOTVar_FeedingProgression.setValue(0 as Float)
    Self.FeedProgressionFinish()
    Debug.notification("You've unlocked the ability to get special buffs from feeding!")
    BOTVar_FeedingProgressionStage.setValue(10 as Float)
  ElseIf BOTVar_FeedingProgressionFeedingCount.getValue() > FeedingPointsReq * 17.5 && (BOTVar_FeedingProgressionStage.getValue() == 8 as Float)
    Debug.notification("Enemies have a reduced chance to resist your draining attempts!")
    If BOTVar_ResistDraining.getValue() != 0 as Float
      BOTVar_ResistDraining.setValue(2 as Float)
    EndIf
    BOTVar_FeedingProgressionStage.setValue(9 as Float)
  ElseIf BOTVar_FeedingProgressionFeedingCount.getValue() > (FeedingPointsReq * 15 as Float) && (BOTVar_FeedingProgressionStage.getValue() == 7 as Float)
    Debug.notification("You've unlocked the ability vampire seduction")
    BOTVar_FeedingProgressionStage.setValue(8 as Float)
    If BOTVar_VampireStage.getValue() > 1 as Float
      PlayerRef.AddSpell(VampireCharm, False)
    EndIf
  ElseIf BOTVar_FeedingProgressionFeedingCount.getValue() > FeedingPointsReq * 13.0 && (BOTVar_FeedingProgressionStage.getValue() == 6 as Float)
    Debug.notification("Enemies can no longer resist your feeding attempts!")
    If BOTVar_ResistFeeding.getValue() == 1 as Float
      BOTVar_ResistFeeding.setValue(2 as Float)
    EndIf
    BOTVar_FeedingProgressionStage.setValue(7 as Float)
  ElseIf BOTVar_FeedingProgressionFeedingCount.getValue() > FeedingPointsReq * 11.5 && (BOTVar_FeedingProgressionStage.getValue() == 5 as Float)
    Debug.notification("The treshold for force drain has been lowered by 50%!")
    If BOTVar_ForceDrain.getValue() == 1 as Float
      BOTVar_ForceDrain.setValue(2 as Float)
    EndIf
    BOTVar_FeedingProgressionStage.setValue(6 as Float)
  ElseIf BOTVar_FeedingProgressionFeedingCount.getValue() > FeedingPointsReq * 10.0 && (BOTVar_FeedingProgressionStage.getValue() == 4 as Float)
    Debug.notification("You've unlocked the ability to sneak feed")
    BOTVar_FeedingProgressionStage.setValue(5 as Float)
  ElseIf BOTVar_FeedingProgressionFeedingCount.getValue() > FeedingPointsReq * 7.5 && (BOTVar_FeedingProgressionStage.getValue() == 3 as Float)
    Debug.notification("You've unlocked the ability to create blood potions!")
    PlayerRef.AddPerk(BOTPerk_Ability_BloodExtraction)
    BOTVar_FeedingProgressionStage.setValue(4 as Float)
  ElseIf BOTVar_FeedingProgressionFeedingCount.getValue() > FeedingPointsReq * 5.0 && (BOTVar_FeedingProgressionStage.getValue() == 2 as Float)
    Debug.notification("Feeding will now heal you!")
    BOTVar_FeedingProgressionStage.setValue(3 as Float)
  ElseIf BOTVar_FeedingProgressionFeedingCount.getValue() > FeedingPointsReq * 3.0 && (BOTVar_FeedingProgressionStage.getValue() == 1 as Float)
    Debug.notification("You now gain 25% more blood from feeding!")
    BOTVar_FeedingProgressionStage.setValue(2 as Float)
  ElseIf BOTVar_FeedingProgressionFeedingCount.getValue() > FeedingPointsReq * 2.0 && (BOTVar_FeedingProgressionStage.getValue() == 0 as Float)
    Debug.notification("You've unlocked the ability to feed on corpses!")
    PlayerRef.AddPerk(BOTPerk_Ability_CorpseFeeding)
    BOTVar_FeedingProgressionStage.setValue(1 as Float)
  EndIf
EndFunction

Function FeedProgressionFinish()
  PlayerRef.AddPerk(BOTPerk_Ability_CorpseFeeding)
  PlayerRef.AddPerk(BOTPerk_Ability_BloodExtraction)
  If BOTVar_ForceDrain.getValue() != 0 as Float
    BOTVar_ForceDrain.setValue(2 as Float)
  EndIf
  If BOTVar_ResistFeeding.getValue() != 0 as Float
    BOTVar_ResistFeeding.setValue(2 as Float)
  EndIf
  If BOTVar_ResistDraining.getValue() != 0 as Float
    BOTVar_ResistDraining.setValue(2 as Float)
  EndIf
  If BOTVar_VampireStage.getValue() > 1 as Float
    PlayerRef.AddSpell(VampireCharm, False)
  EndIf
  BOTVar_FeedingProgressionStage.setValue(10 as Float)
EndFunction

Function FeedProgressionReset()
  PlayerRef.AddPerk(BOTPerk_Ability_CorpseFeeding)
  PlayerRef.AddPerk(BOTPerk_Ability_BloodExtraction)
  If BOTVar_ForceDrain.getValue() != 0 as Float
    BOTVar_ForceDrain.setValue(1 as Float)
  EndIf
  If BOTVar_ResistDraining.getValue() != 0 as Float
    BOTVar_ResistDraining.setValue(1 as Float)
  EndIf
  BOTVar_FeedingProgressionStage.setValue(0 as Float)
  BOTVar_FeedingProgressionFeedingCount.setValue(0 as Float)
EndFunction

Function VampireHunters()
  If (BOTVar_VampireHunters_Dawnguard.getValue() == (1 as Int) as Float) || (BOTVar_VampireHunters_VoS.getValue() == (1 as Int) as Float)
    Self.GetCurrentHourOfDay()
    If Game.IsMovementControlsEnabled() && Game.IsFightingControlsEnabled() && (PlayerRef.IsInInterior() == 0 as Bool) && PlayerRef.GetWorldSpace() != DlC01SoulCairn && PlayerRef.GetWorldSpace() != Sovngarde && PlayerRef.GetWorldSpace() != Blackreach && PlayerRef.GetWorldSpace() != AlftandWorld && PlayerRef.GetWorldSpace() != BlindCliffCaveWorld && PlayerRef.GetWorldSpace() != BrineWaterGrottoWorld && PlayerRef.GetWorldSpace() != DarkWaterWorld && PlayerRef.GetWorldSpace() != EastEmpireWarehouse && PlayerRef.GetWorldSpace() != ElderGleamSanctuaryWorld && PlayerRef.GetWorldSpace() != FallowStoneCaveWorldStart && PlayerRef.GetWorldSpace() != Frostmerecryptworld && PlayerRef.GetWorldSpace() != KarthSpireRedoubtWorld && PlayerRef.GetWorldSpace() != KatariahWorld && PlayerRef.GetWorldSpace() != LabyrinthianWorld && PlayerRef.GetWorldSpace() != LabyrinthianWorld03 && PlayerRef.GetWorldSpace() != LabyrinthianWorld04 && PlayerRef.GetWorldSpace() != MossmotherCavernWorld && PlayerRef.GetWorldSpace() != RedEagleRedoubtWorld && PlayerRef.GetWorldSpace() != ShadowGreenCavernWorld && PlayerRef.GetWorldSpace() != SouthFringeWorld
      BOTVar_VampireHuntersTreshold -= 5
      If BOTVar_VampireHuntersTreshold >= 1000
        Int VampireHuntersAttackDay = Utility.RandomInt(1, 100)
        Int VampireHuntersAttackNight = Utility.RandomInt(1, 100)
        If (Time > 5 as Float) && (Time < 21 as Float) && VampireHuntersAttackDay > 90
          Self.SpawnVampireHunters()
        ElseIf (Time <= 5 as Float) || (Time >= 21 as Float) && VampireHuntersAttackNight > 75
          Self.SpawnVampireHunters()
        EndIf
      EndIf
    EndIf
  EndIf
EndFunction

Function SpawnVampireHunters()
  Int VampireHunterGroup = -1 as Int
  BOTVar_VampireHuntersTreshold = 0
  If (BOTVar_VampireHunters_Dawnguard.getValue() == (1 as Int) as Float) && (BOTVar_VampireHunters_VoS.getValue() == (1 as Int) as Float)
    VampireHunterGroup = Utility.RandomInt(1, 100)
  ElseIf (BOTVar_VampireHunters_Dawnguard.getValue() == (1 as Int) as Float) && (BOTVar_VampireHunters_VoS.getValue() == (0 as Int) as Float)
    VampireHunterGroup = Utility.RandomInt(1, 80)
  ElseIf (BOTVar_VampireHunters_Dawnguard.getValue() == (0 as Int) as Float) && (BOTVar_VampireHunters_VoS.getValue() == (1 as Int) as Float)
    VampireHunterGroup = Utility.RandomInt(81, 100)
  EndIf
  Int VampireHuntersGroupAmount = Utility.RandomInt(1, 100)
  Int VampireHuntersGroupSetup = Utility.RandomInt(1, 100)
  ObjectReference PlayerRefLocationMarker = PlayerRef.PlaceAtMe(XMarker as Form, 1, False, False)
  Int RandomAttackWaitTime = Utility.RandomInt(5, 10)
  Utility.Wait(RandomAttackWaitTime as Float)
  VampireHunterGroup = 1
  VampireHuntersGroupAmount = 81
  VampireHuntersGroupSetup = 21
  If VampireHunterGroup <= 80
    If VampireHuntersGroupAmount <= 35
      If VampireHuntersGroupAmount <= 25
        VampireHunter01 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Melee01 as Form, 1, False, False) as Actor
        VampireHunter02 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Melee02 as Form, 1, False, False) as Actor
        VampireHunter03 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Melee04 as Form, 1, False, False) as Actor
      ElseIf VampireHuntersGroupSetup > 25 && VampireHuntersGroupSetup <= 50
        VampireHunter01 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Melee02 as Form, 1, False, False) as Actor
        VampireHunter02 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Melee03 as Form, 1, False, False) as Actor
        VampireHunter03 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Ranged01 as Form, 1, False, False) as Actor
      ElseIf VampireHuntersGroupSetup > 50 && VampireHuntersGroupSetup <= 75
        VampireHunter01 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Melee03 as Form, 1, False, False) as Actor
        VampireHunter02 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Melee04 as Form, 1, False, False) as Actor
        VampireHunter03 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Mage02 as Form, 1, False, False) as Actor
      ElseIf VampireHuntersGroupSetup > 75 && VampireHuntersGroupSetup <= 90
        VampireHunter01 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Melee01 as Form, 1, False, False) as Actor
        VampireHunter02 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Ranged04 as Form, 1, False, False) as Actor
        VampireHunter03 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Mage03 as Form, 1, False, False) as Actor
      ElseIf VampireHuntersGroupSetup > 90 && VampireHuntersGroupSetup <= 100
        VampireHunter01 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Melee01 as Form, 1, False, False) as Actor
        VampireHunter02 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Ranged01 as Form, 1, False, False) as Actor
        VampireHunter03 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Husky01 as Form, 1, False, False) as Actor
      EndIf
    ElseIf VampireHuntersGroupAmount > 35 && VampireHuntersGroupAmount <= 65
      If VampireHuntersGroupSetup <= 20
        VampireHunter01 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Mage04 as Form, 1, False, False) as Actor
        VampireHunter02 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Mage03 as Form, 1, False, False) as Actor
        VampireHunter03 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Melee03 as Form, 1, False, False) as Actor
        VampireHunter04 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Husky01 as Form, 1, False, False) as Actor
      ElseIf VampireHuntersGroupSetup > 20 && VampireHuntersGroupSetup <= 40
        VampireHunter01 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Melee02 as Form, 1, False, False) as Actor
        VampireHunter02 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Mage01 as Form, 1, False, False) as Actor
        VampireHunter03 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Melee03 as Form, 1, False, False) as Actor
        VampireHunter04 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Ranged04 as Form, 1, False, False) as Actor
      ElseIf VampireHuntersGroupSetup > 40 && VampireHuntersGroupSetup <= 60
        VampireHunter01 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Melee03 as Form, 1, False, False) as Actor
        VampireHunter02 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Melee02 as Form, 1, False, False) as Actor
        VampireHunter03 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Husky02 as Form, 1, False, False) as Actor
        VampireHunter04 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Troll02 as Form, 1, False, False) as Actor
      ElseIf VampireHuntersGroupSetup > 60 && VampireHuntersGroupSetup <= 80
        VampireHunter01 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Melee01 as Form, 1, False, False) as Actor
        VampireHunter02 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Ranged03 as Form, 1, False, False) as Actor
        VampireHunter03 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Troll01 as Form, 1, False, False) as Actor
        VampireHunter04 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Troll02 as Form, 1, False, False) as Actor
      ElseIf VampireHuntersGroupSetup > 80 && VampireHuntersGroupSetup <= 100
        VampireHunter01 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Melee02 as Form, 1, False, False) as Actor
        VampireHunter02 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Mage04 as Form, 1, False, False) as Actor
        VampireHunter03 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Husky01 as Form, 1, False, False) as Actor
        VampireHunter04 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Husky02 as Form, 1, False, False) as Actor
      EndIf
    ElseIf VampireHuntersGroupAmount > 65 && VampireHuntersGroupAmount <= 80
      If VampireHuntersGroupSetup <= 17
        VampireHunter01 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Melee02 as Form, 1, False, False) as Actor
        VampireHunter02 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Melee03 as Form, 1, False, False) as Actor
        VampireHunter03 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Troll02 as Form, 1, False, False) as Actor
        VampireHunter04 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Mage03 as Form, 1, False, False) as Actor
        VampireHunter05 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Mage04 as Form, 1, False, False) as Actor
      ElseIf VampireHuntersGroupSetup > 17 && VampireHuntersGroupSetup <= 34
        VampireHunter01 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Melee04 as Form, 1, False, False) as Actor
        VampireHunter02 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Melee01 as Form, 1, False, False) as Actor
        VampireHunter03 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Husky01 as Form, 1, False, False) as Actor
        VampireHunter04 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Ranged02 as Form, 1, False, False) as Actor
        VampireHunter05 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Ranged01 as Form, 1, False, False) as Actor
      ElseIf VampireHuntersGroupSetup > 34 && VampireHuntersGroupSetup <= 51
        VampireHunter01 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Melee03 as Form, 1, False, False) as Actor
        VampireHunter02 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Melee02 as Form, 1, False, False) as Actor
        VampireHunter03 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Melee01 as Form, 1, False, False) as Actor
        VampireHunter04 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Husky02 as Form, 1, False, False) as Actor
        VampireHunter05 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Husky01 as Form, 1, False, False) as Actor
      ElseIf VampireHuntersGroupSetup > 51 && VampireHuntersGroupSetup <= 68
        VampireHunter01 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Melee04 as Form, 1, False, False) as Actor
        VampireHunter02 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Melee03 as Form, 1, False, False) as Actor
        VampireHunter03 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Melee01 as Form, 1, False, False) as Actor
        VampireHunter04 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Troll02 as Form, 1, False, False) as Actor
        VampireHunter05 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Troll01 as Form, 1, False, False) as Actor
      ElseIf VampireHuntersGroupSetup > 68 && VampireHuntersGroupSetup <= 85
        VampireHunter01 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Melee04 as Form, 1, False, False) as Actor
        VampireHunter02 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Melee01 as Form, 1, False, False) as Actor
        VampireHunter03 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Ranged01 as Form, 1, False, False) as Actor
        VampireHunter04 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Mage04 as Form, 1, False, False) as Actor
        VampireHunter05 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Mage02 as Form, 1, False, False) as Actor
      ElseIf VampireHuntersGroupSetup > 85 && VampireHuntersGroupSetup <= 100
        VampireHunter01 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Melee03 as Form, 1, False, False) as Actor
        VampireHunter02 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Melee02 as Form, 1, False, False) as Actor
        VampireHunter03 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Mage01 as Form, 1, False, False) as Actor
        VampireHunter04 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Ranged03 as Form, 1, False, False) as Actor
        VampireHunter05 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Ranged04 as Form, 1, False, False) as Actor
      EndIf
    ElseIf VampireHuntersGroupAmount > 80
      If VampireHuntersGroupSetup <= 20
        VampireHunter01 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Boss01 as Form, 1, False, False) as Actor
        VampireHunter02 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Melee03 as Form, 1, False, False) as Actor
        VampireHunter03 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Melee01 as Form, 1, False, False) as Actor
      ElseIf VampireHuntersGroupSetup > 20 && VampireHuntersGroupSetup <= 40
        VampireHunter01 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Boss02 as Form, 1, False, False) as Actor
        VampireHunter02 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Ranged02 as Form, 1, False, False) as Actor
        VampireHunter03 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Ranged04 as Form, 1, False, False) as Actor
      ElseIf VampireHuntersGroupSetup > 40 && VampireHuntersGroupSetup <= 60
        VampireHunter01 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Boss03 as Form, 1, False, False) as Actor
        VampireHunter02 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Mage03 as Form, 1, False, False) as Actor
        VampireHunter03 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Mage01 as Form, 1, False, False) as Actor
      ElseIf VampireHuntersGroupSetup > 60 && VampireHuntersGroupSetup <= 80
        VampireHunter01 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Boss04 as Form, 1, False, False) as Actor
        VampireHunter02 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Troll01 as Form, 1, False, False) as Actor
        VampireHunter03 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Troll02 as Form, 1, False, False) as Actor
      ElseIf VampireHuntersGroupSetup > 80 && VampireHuntersGroupSetup <= 100
        VampireHunter01 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Boss05 as Form, 1, False, False) as Actor
        VampireHunter02 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Husky01 as Form, 1, False, False) as Actor
        VampireHunter03 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_Dawnguard_Husky02 as Form, 1, False, False) as Actor
      EndIf
    EndIf
  ElseIf VampireHunterGroup > 80
    If VampireHuntersGroupSetup <= 40
      VampireHunter01 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_VoS_Melee_01 as Form, 1, False, False) as Actor
      VampireHunter02 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_VoS_Melee_03 as Form, 1, False, False) as Actor
      VampireHunter03 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_VoS_Melee_04 as Form, 1, False, False) as Actor
    ElseIf VampireHuntersGroupSetup > 40 && VampireHuntersGroupSetup <= 80
      VampireHunter01 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_VoS_Melee_02 as Form, 1, False, False) as Actor
      VampireHunter02 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_VoS_Melee_03 as Form, 1, False, False) as Actor
      VampireHunter03 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_VoS_Melee_04 as Form, 1, False, False) as Actor
    ElseIf VampireHuntersGroupSetup > 80 && VampireHuntersGroupSetup <= 90
      VampireHunter01 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_VoS_Boss_01 as Form, 1, False, False) as Actor
      VampireHunter02 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_VoS_Melee_02 as Form, 1, False, False) as Actor
      VampireHunter03 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_VoS_Melee_01 as Form, 1, False, False) as Actor
    ElseIf VampireHuntersGroupSetup > 90 && VampireHuntersGroupSetup <= 100
      VampireHunter01 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_VoS_Boss_02 as Form, 1, False, False) as Actor
      VampireHunter02 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_VoS_Melee_01 as Form, 1, False, False) as Actor
      VampireHunter03 = PlayerRefLocationMarker.PlaceAtMe(BOTActor_VampireHunter_VoS_Melee_04 as Form, 1, False, False) as Actor
    EndIf
  EndIf
  Utility.Wait(1.0)
  VampireHunter01.PathToReference(PlayerRef as ObjectReference, 1 as Float)
  VampireHunter02.PathToReference(PlayerRef as ObjectReference, 1 as Float)
  VampireHunter03.PathToReference(PlayerRef as ObjectReference, 1 as Float)
  VampireHunter01.StartCombat(PlayerRef)
  VampireHunter02.StartCombat(PlayerRef)
  VampireHunter03.StartCombat(PlayerRef)
  If VampireHuntersGroupAmount > 45 && VampireHuntersGroupAmount <= 75
    VampireHunter04.PathToReference(PlayerRef as ObjectReference, 1 as Float)
    VampireHunter04.StartCombat(PlayerRef)
  ElseIf VampireHuntersGroupAmount > 75 && VampireHuntersGroupAmount <= 90
    VampireHunter05.PathToReference(PlayerRef as ObjectReference, 1 as Float)
    VampireHunter05.StartCombat(PlayerRef)
    PlayerRefLocationMarker.Disable(False)
    PlayerRefLocationMarker.Delete()
  EndIf
EndFunction

Function Kill()
  BOTVar_VampireHuntersTresholdRNG = Utility.RandomInt(5, 10)
  BOTVar_VampireHuntersTreshold += BOTVar_VampireHuntersTresholdRNG
EndFunction

Function ChangeToVampireLord()
  BOTVar_VampireHuntersTresholdRNG = Utility.RandomInt(50, 75)
  BOTVar_VampireHuntersTreshold += BOTVar_VampireHuntersTresholdRNG
EndFunction

Function DexionCharm(Actor akTarget)
  VampireCharm.Cast(PlayerRef as ObjectReference, akTarget as ObjectReference)
EndFunction
