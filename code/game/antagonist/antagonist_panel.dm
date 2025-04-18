/datum/antagonist/proc/get_panel_entry(var/datum/mind/player)

	var/dat = "<tr><td><b>[role_text]:</b>"
	var/extra = get_extra_panel_options(player)
	if(is_antagonist(player))
		dat += "<a href='byond://?src=\ref[player];[HrefToken()];remove_antagonist=[id]'>\[-\]</a>"
		dat += "<a href='byond://?src=\ref[player];[HrefToken()];equip_antagonist=[id]'>\[equip\]</a>"
		if(starting_locations && starting_locations.len)
			dat += "<a href='byond://?src=\ref[player];[HrefToken()];move_antag_to_spawn=[id]'>\[move to spawn\]</a>"
		if(extra) dat += "[extra]"
	else
		dat += "<a href='byond://?src=\ref[player];[HrefToken()];add_antagonist=[id]'>\[+\]</a>"
	dat += "</td></tr>"

	return dat

/datum/antagonist/proc/get_extra_panel_options()
	return

/datum/antagonist/proc/get_check_antag_output(var/datum/admins/requester)

	if(!current_antagonists || !current_antagonists.len)
		return ""

	var/dat = "<br><table cellspacing=5><tr><td><B>[role_text_plural]</B></td><td></td></tr>"
	for(var/datum/mind/player in current_antagonists)
		var/mob/M = player.current
		dat += "<tr>"
		if(M)
			dat += "<td><a href='byond://?src=\ref[src];[HrefToken()];adminplayeropts=\ref[M]'>[M.real_name]/([player.key])</a>"
			if(!M.client)      dat += " " + span_italics("(logged out)")
			if(M.stat == DEAD) dat += " " + span_red(span_bold("(DEAD)"))
			dat += "</td>"
			dat += "<td>\[<A href='byond://?src=\ref[requester];[HrefToken()];adminplayeropts=\ref[M]'>PP</A>]\[<A href='byond://?src=\ref[requester];[HrefToken()];priv_msg=\ref[M]'>PM</A>\]\[<A href='byond://?src=\ref[requester];[HrefToken()];traitor=\ref[M]'>TP</A>\]</td>"
		else
			dat += "<td>[player.key] <i>Mob not found!</i></td>"
		dat += "</tr>"
	dat += "</table>"

	if(flags & ANTAG_HAS_NUKE)
		dat += "<br><table><tr><td><B>Nuclear disk(s)</B></td></tr>"
		for(var/obj/item/disk/nuclear/N in GLOB.nuke_disks)
			dat += "<tr><td>[N.name], "
			var/atom/disk_loc = N.loc
			while(!istype(disk_loc, /turf))
				if(istype(disk_loc, /mob))
					var/mob/M = disk_loc
					dat += "carried by <a href='byond://?src=\ref[requester];[HrefToken()];adminplayeropts=\ref[M]'>[M.real_name]</a> "
				if(istype(disk_loc, /obj))
					var/obj/O = disk_loc
					dat += "in \a [O.name] "
				disk_loc = disk_loc.loc
			dat += "in [disk_loc.loc] at ([disk_loc.x], [disk_loc.y], [disk_loc.z])</td></tr>"
		dat += "</table>"
	dat += get_additional_check_antag_output(requester)
	dat += "<hr>"
	return dat

//Overridden elsewhere.
/datum/antagonist/proc/get_additional_check_antag_output(var/datum/admins/requester)
	return ""
