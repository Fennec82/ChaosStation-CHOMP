/*
 * Medical
 */
/obj/machinery/smartfridge/medbay
	name = "\improper Refrigerated Medicine Storage"
	desc = "A refrigerated storage unit for securely storing medicine and chemicals."
	icon_contents = "chem"

/obj/machinery/smartfridge/medbay/accept_check(var/obj/item/O as obj)
	if(istype(O, /obj/item/reagent_containers/borghypo))
		return FALSE
	if(istype(O,/obj/item/storage/pill_bottle) || istype(O,/obj/item/reagent_containers) || istype(O,/obj/item/reagent_containers/glass/))
		return TRUE
	return FALSE

/obj/machinery/smartfridge/secure/medbay
	name = "\improper Refrigerated Medicine Storage"
	desc = "A refrigerated storage unit for storing medicine and chemicals."
	icon_contents = "chem"
	req_one_access = list(access_medical,access_chemistry)

/obj/machinery/smartfridge/secure/medbay/accept_check(var/obj/item/O as obj)
	if(istype(O, /obj/item/reagent_containers/borghypo))
		return FALSE
	if(istype(O,/obj/item/storage/pill_bottle) || istype(O,/obj/item/reagent_containers) || istype(O,/obj/item/reagent_containers/glass/))
		return TRUE
	return FALSE

/*
 * Virology
 */
/obj/machinery/smartfridge/virology
	name = "\improper Refrigerated Virus Storage"
	desc = "A refrigerated storage unit for storing viral material."
	icon_contents = "viro"

/obj/machinery/smartfridge/virology/accept_check(var/obj/item/O as obj)
	if(istype(O, /obj/item/reagent_containers/borghypo))
		return FALSE
	if(istype(O,/obj/item/storage/pill_bottle) || istype(O,/obj/item/reagent_containers) || istype(O,/obj/item/reagent_containers/glass/))
		return TRUE
	return FALSE

/obj/machinery/smartfridge/secure/virology
	name = "\improper Refrigerated Virus Storage"
	desc = "A refrigerated storage unit for securely storing viral material."
	icon_contents = "viro"
	req_access = list(access_virology)

/obj/machinery/smartfridge/secure/virology/accept_check(var/obj/item/O as obj)
	if(istype(O, /obj/item/reagent_containers/borghypo))
		return FALSE
	if(istype(O,/obj/item/storage/pill_bottle) || istype(O,/obj/item/reagent_containers) || istype(O,/obj/item/reagent_containers/glass/))
		return TRUE
	return FALSE

/*
 * Chemistry
 */
/obj/machinery/smartfridge/chemistry
	name = "\improper Smart Chemical Storage"
	desc = "A refrigerated storage unit for storing medicine and chemicals."
	icon_contents = "chem"
	req_one_access = list(access_chemistry)

/obj/machinery/smartfridge/chemistry/accept_check(var/obj/item/O as obj)
	if(istype(O, /obj/item/reagent_containers/borghypo))
		return FALSE
	if(istype(O,/obj/item/storage/pill_bottle) || istype(O,/obj/item/reagent_containers) || istype(O,/obj/item/reagent_containers/glass/))
		return TRUE
	return FALSE

/obj/machinery/smartfridge/secure/chemistry
	name = "\improper Smart Chemical Storage"
	desc = "A refrigerated storage unit for securely storing medicine and chemicals."
	icon_contents = "chem"
	req_one_access = list(access_chemistry)

/obj/machinery/smartfridge/secure/chemistry/accept_check(var/obj/item/O as obj)
	if(istype(O, /obj/item/reagent_containers/borghypo))
		return FALSE
	if(istype(O,/obj/item/storage/pill_bottle) || istype(O,/obj/item/reagent_containers) || istype(O,/obj/item/reagent_containers/glass/))
		return TRUE
	return FALSE
