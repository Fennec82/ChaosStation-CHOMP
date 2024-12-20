//Everything else
/datum/seed/peanuts
	name = PLANT_PEANUT
	seed_name = PLANT_PEANUT
	display_name = "peanut vines"
	kitchen_tag = PLANT_PEANUT
	chems = list(REAGENT_ID_NUTRIMENT = list(1,10), REAGENT_ID_PEANUTOIL = list(3,10))

/datum/seed/peanuts/New()
	..()
	set_trait(TRAIT_HARVEST_REPEAT,1)
	set_trait(TRAIT_MATURATION,6)
	set_trait(TRAIT_PRODUCTION,6)
	set_trait(TRAIT_YIELD,6)
	set_trait(TRAIT_POTENCY,10)
	set_trait(TRAIT_PRODUCT_ICON,"nuts")
	set_trait(TRAIT_PRODUCT_COLOUR,"#C4AE7A")
	set_trait(TRAIT_PLANT_ICON,"bush2")
	set_trait(TRAIT_IDEAL_LIGHT, 6)
