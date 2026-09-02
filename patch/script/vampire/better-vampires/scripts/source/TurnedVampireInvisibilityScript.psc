Scriptname TurnedVampireInvisibilityScript extends activemagiceffect

GlobalVariable Property SEVersion Auto
Race Property ArgonianRace Auto
Race Property KhajiitRace Auto

TextureSet Property BVEyesMaleHumanVampire auto
TextureSet Property BVSkinEyesKhajiitVampire auto
TextureSet Property BVSkinEyesMaleArgonianVampire auto


EVENT OnEffectStart(Actor akTarget, Actor akCaster)



EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If SEVersion.GetValue() == 0

		If SKSE.GetVersionRelease() > 0

			If akTarget.IsOnMount()
			Else
				Float Weight = akTarget.GetWeight()
				akTarget.SetWeight(50)
				akTarget.SetWeight(Weight)
				akTarget.QueueNiNodeUpdate()
			EndIf

		EndIf

	EndIf

	; If (akTarget.GetActorBase().GetRace() == ArgonianRace)
	; 	akTarget.SetEyeTexture(BVSkinEyesMaleArgonianVampire)
	; ElseIf (akTarget.GetActorBase().GetRace() == KhajiitRace)
	; 	akTarget.SetEyeTexture(BVSkinEyesKhajiitVampire)
	; Else
	; 	akTarget.SetEyeTexture(BVEyesMaleHumanVampire)
	; EndIf
	; RCS
	; head part type: Argonian-1 Khajiit-9
	Race akTargetRace = akTarget.GetActorBase().GetRace()
	If RaceCompatibility.GetIsHeadPartTypeByRace(akTargetRace, 1)
		akTarget.SetEyeTexture(BVSkinEyesMaleArgonianVampire)
	ElseIf RaceCompatibility.GetIsHeadPartTypeByRace(akTargetRace, 9)
		akTarget.SetEyeTexture(BVSkinEyesKhajiitVampire)
	Else
		akTarget.SetEyeTexture(BVEyesMaleHumanVampire)
	EndIf


EndEvent
