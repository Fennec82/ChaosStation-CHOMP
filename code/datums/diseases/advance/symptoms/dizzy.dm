/*
//////////////////////////////////////

Dizziness

	Hidden.
	Lowers resistance considerably.
	Decreases stage speed.
	Reduced transmittability
	Intense Level.

Bonus
	Shakes the affected mob's screen for short periods.

//////////////////////////////////////
*/

/datum/symptom/dizzy
	name = "Dizziness"
	stealth = 2
	resistance = -2
	stage_speed = -3
	transmittable = -1
	level = 4
	severity = 2

/datum/symptom/dizzy/Activate(var/datum/disease/advance/A)
	..()
	if(prob(SYMPTOM_ACTIVATION_PROB))
		var/mob/living/M = A.affected_mob
		switch(A.stage)
			if(1, 2, 3, 4)
				to_chat(M, span_warning(pick("You feel dizzy.", "Your head spins.")))
			else
				to_chat(M, span_userdanger("A wave of dizziness washes over you!"))
				M.make_dizzy(10)
	return
