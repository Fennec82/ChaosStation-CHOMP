/obj/structure/boulder
	name = "rocky debris"
	desc = "Leftover rock from an excavation, it's been partially dug out already but there's still a lot to go."
	icon = 'icons/obj/mining.dmi'
	icon_state = "boulder1"
	density = TRUE
	opacity = 1
	anchored = TRUE
	var/excavation_level = 0
	var/datum/geosample/geological_data
	var/datum/artifact_find/artifact_find
	var/last_act = 0

/obj/structure/boulder/Initialize(mapload)
	. = ..()
	icon_state = "boulder[rand(1,4)]"
	excavation_level = rand(5, 50)

/obj/structure/boulder/attackby(var/obj/item/I, var/mob/user)
	if(istype(I, /obj/item/core_sampler))
		src.geological_data.artifact_distance = rand(-100,100) / 100
		src.geological_data.artifact_id = artifact_find.artifact_id

		var/obj/item/core_sampler/C = I
		C.sample_item(src, user)
		return

	if(istype(I, /obj/item/depth_scanner))
		var/obj/item/depth_scanner/C = I
		C.scan_atom(user, src)
		return

	if(istype(I, /obj/item/xenoarch_multi_tool))
		var/obj/item/xenoarch_multi_tool/C = I
		if(C.mode) //Mode means scanning.
			C.depth_scanner.scan_atom(user, src)
			return
		else
			user.visible_message(span_bold("\The [user]") + " extends \the [C] over \the [src], a flurry of red beams scanning \the [src]'s surface!", span_notice("You extend \the [C] over \the [src], a flurry of red beams scanning \the [src]'s surface!"))
			if(do_after(user, 15))
				to_chat(user, span_notice("\The [src] has been excavated to a depth of [2 * src.excavation_level]cm."))
			return

	if(istype(I, /obj/item/measuring_tape))
		var/obj/item/measuring_tape/P = I
		user.visible_message(span_bold("\The [user]") + " extends \the [P] towards \the [src].", span_notice("You extend \the [P] towards \the [src]."))
		if(do_after(user, 15))
			to_chat(user, span_notice("\The [src] has been excavated to a depth of [2 * src.excavation_level]cm."))
		return

	if(istype(I, /obj/item/pickaxe))
		var/obj/item/pickaxe/P = I

		if(last_act + P.digspeed > world.time)//prevents message spam
			return
		last_act = world.time

		to_chat(user, span_warning("You start [P.drill_verb] [src]."))

		if(!do_after(user, P.digspeed))
			return

		to_chat(user, span_notice("You finish [P.drill_verb] [src]."))
		excavation_level += P.excavation_amount

		if(prob(excavation_level))
			//success
			if(artifact_find)
				var/spawn_type = artifact_find.artifact_find_type
				var/obj/O = new spawn_type(get_turf(src))
				if(istype(O, /obj/machinery/artifact))
					var/obj/machinery/artifact/X = O
					if(X.artifact_master)
						X.artifact_master.artifact_id = artifact_find.artifact_id
				O.anchored = FALSE	// Anchored finds are lame.
				src.visible_message(span_warning("\The [src] suddenly crumbles away."))
			else
				user.visible_message(span_warning("\The [src] suddenly crumbles away."), span_notice("\The [src] has been whittled away under your careful excavation, but there was nothing of interest inside."))
			qdel(src)

/obj/structure/boulder/Bumped(AM)
	. = ..()
	if(ishuman(AM))
		var/mob/living/carbon/human/H = AM
		var/obj/item/pickaxe/P = H.get_inactive_hand()
		if(istype(P))
			src.attackby(P, H)

	else if(istype(AM,/mob/living/silicon/robot))
		var/mob/living/silicon/robot/R = AM
		if(istype(R.module_active,/obj/item/pickaxe))
			attackby(R.module_active,R)

	else if(istype(AM,/obj/mecha))
		var/obj/mecha/M = AM
		if(istype(M.selected,/obj/item/mecha_parts/mecha_equipment/tool/drill))
			M.selected.action(src)
