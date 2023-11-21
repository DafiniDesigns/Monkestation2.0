//Proto-Kinetic Crushers
/obj/item/kinetic_crusher/machete
	icon = 'monkestation/icons/obj/items_and_weapons.dmi'
	icon_state = "PKMachete"
	inhand_icon_state = "PKMachete0"
	lefthand_file = 'monkestation/icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'monkestation/icons/mob/inhands/weapons/melee_righthand.dmi'
	worn_icon = 'monkestation/icons/mob/clothing/belt.dmi'
	worn_icon_state = "PKMachete0"
	name = "proto-kinetic machete"
	desc = "Recent breakthroughs with proto-kinetic technology have led to improved designs for the early proto-kinetic crusher, namely the ability to pack all \
	the same technology into a smaller more portable package. The machete design was chosen as to make a much easier to handle and less cumbersome frame. Of course \
	the smaller package means that the power is not as high as the original crusher design, but the different shell makes it capable of blocking basic attacks."
	force = 15
	block_chance = 25
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BELT
	throwforce = 5
	throw_speed = 4
	armour_penetration = 10
	custom_materials = list(/datum/material/iron=1150, /datum/material/glass=2075)
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb_continuous = list("slashes", "cuts", "cleaves", "chops", "swipes")
	attack_verb_simple = list("cleave", "chop", "cut", "swipe", "slash")
	sharpness = SHARP_EDGED
	actions_types = list(/datum/action/item_action/toggle_light)
	obj_flags = NONE
	light_system = MOVABLE_LIGHT
	light_outer_range = 5
	light_on = FALSE
	charged = TRUE
	charge_time = 10
	detonation_damage = 35
	backstab_bonus = 20
	overrides_main = TRUE
	overrides_twohandrequired = TRUE
	override_twohandedsprite = TRUE

/obj/item/kinetic_crusher/machete/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/butchering, \
		speed = 4 SECONDS, \
		effectiveness = 130, \
	)

/obj/item/kinetic_crusher/spear
	icon = 'monkestation/icons/obj/items_and_weapons.dmi'
	icon_state = "PKSpear"
	inhand_icon_state = "PKSpear0"
	lefthand_file = 'monkestation/icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'monkestation/icons/mob/inhands/weapons/melee_righthand.dmi'
	worn_icon = 'monkestation/icons/mob/clothing/back.dmi'
	worn_icon_state = "PKSpear0"
	name = "proto-kinetic spear"
	desc = "Having finally invested in better Proto-kinetic tech, research and development was able to cobble together this new proto-kinetic weapon. By compacting all the tecnology \
	we were able to fit it all into a spear styled case. No longer will proto-kinetic crushers be for the most skilled and suicidal, but now they will be available to the most cautious \
	paranoid miners, now able to enjoy the (slightly lower) power of a crusher, while maintaining a (barely) minimum safe distance."
	force = 0
	w_class = WEIGHT_CLASS_HUGE
	slot_flags = ITEM_SLOT_BACK
	throwforce = 5
	throw_speed = 4
	armour_penetration = 15
	custom_materials = list(/datum/material/iron=1150, /datum/material/glass=2075)
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb_continuous = list("pierces", "stabs", "impales", "pokes", "jabs")
	attack_verb_simple = list("imaple", "stab", "pierce", "jab", "poke")
	sharpness = SHARP_EDGED
	actions_types = list(/datum/action/item_action/toggle_light)
	obj_flags = UNIQUE_RENAME
	light_system = MOVABLE_LIGHT
	light_outer_range = 8
	light_on = FALSE
	charged = TRUE
	charge_time = 15
	detonation_damage = 45
	backstab_bonus = 20
	reach = 2
	overrides_main = TRUE
	overrides_twohandrequired = FALSE
	override_twohandedsprite = TRUE

/obj/item/kinetic_crusher/spear/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/two_handed, force_unwielded=0, force_wielded=15)
	AddComponent(/datum/component/butchering, \
		speed = 6 SECONDS, \
		effectiveness = 90, \
	)

/obj/item/kinetic_crusher/spear/update_icon_state()
	inhand_icon_state = "PKSpear[HAS_TRAIT(src, TRAIT_WIELDED)]" // this is not icon_state and not supported by 2hcomponent
	return ..()

/obj/item/kinetic_crusher/hammer
	icon = 'monkestation/icons/obj/items_and_weapons.dmi'
	icon_state = "PKHammer"
	inhand_icon_state = "PKHammer0"
	lefthand_file = 'monkestation/icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'monkestation/icons/mob/inhands/weapons/melee_righthand.dmi'
	worn_icon = 'monkestation/icons/mob/clothing/back.dmi'
	worn_icon_state = "PKHammer0"
	name = "proto-kinetic hammer"
	desc = "Somehow research and development managed to make the proto-kinetic crusher even bigger, allowing more parts to be fit inside and increase the power output. \
	This increased power output allows it to surpass the power generated by the standard crusher, while also pushing back the target. Unfortunetly the flat head \
	results in backstabs being impossible."
	force = 0
	w_class = WEIGHT_CLASS_HUGE
	slot_flags = ITEM_SLOT_BACK
	throwforce = 5
	throw_speed = 4
	armour_penetration = 0
	custom_materials = list(/datum/material/iron=1150, /datum/material/glass=2075)
	hitsound = 'sound/weapons/sonic_jackhammer.ogg'
	attack_verb_continuous = list("slams", "crushes", "smashes", "flattens", "pounds")
	attack_verb_simple = list("slam", "crush", "smash", "flatten", "pound")
	sharpness = NONE
	actions_types = list(/datum/action/item_action/toggle_light)
	obj_flags = UNIQUE_RENAME
	light_system = MOVABLE_LIGHT
	light_outer_range = 5
	light_on = FALSE
	charged = TRUE
	charge_time = 25
	detonation_damage = 70
	backstab_bonus = 0
	overrides_main = TRUE
	overrides_twohandrequired = FALSE
	override_twohandedsprite = TRUE

/obj/item/kinetic_crusher/hammer/Initialize(mapload)
		. = ..()
		AddComponent(/datum/component/two_handed, force_unwielded=0, force_wielded=20)

/obj/item/kinetic_crusher/hammer/attack(mob/living/target, mob/living/user)
	var/relative_direction = get_cardinal_dir(src, target)
	var/atom/throw_target = get_edge_target_turf(target, relative_direction)
	. = ..()
	if(HAS_TRAIT(user, TRAIT_PACIFISM) || !HAS_TRAIT(src, TRAIT_WIELDED))
		return
	else if(!QDELETED(target) && !target.anchored)
		var/whack_speed = (2)
		target.throw_at(throw_target, 2, whack_speed, user, gentle = TRUE)

/obj/item/kinetic_crusher/hammer/update_icon_state()
	inhand_icon_state = "PKHammer[HAS_TRAIT(src, TRAIT_WIELDED)]" // this is not icon_state and not supported by 2hcomponent
	return ..()

/obj/item/kinetic_crusher/claw
	icon = 'monkestation/icons/obj/items_and_weapons.dmi'
	icon_state = "PKClaw"
	inhand_icon_state = "PKClaw0"
	lefthand_file = 'monkestation/icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'monkestation/icons/mob/inhands/weapons/melee_righthand.dmi'
	worn_icon_state = "PKHammer0"
	slot_flags = NONE
	name = "proto-kinetic claws"
	desc = "Truely the most compact version of the crusher ever made, its small enough to fit in your backpack and still function as a crusher. \
	Best used when attacking from behind, rewarding those capable of landing what we call a 'critical hit' \
	(DISCLAIMER) The shell is made to fit over gloves, so dont try to wear it like a glove."
	force = 5
	w_class = WEIGHT_CLASS_NORMAL
	throwforce = 5
	throw_speed = 4
	armour_penetration = 0
	custom_materials = list(/datum/material/iron=1150, /datum/material/glass=2075)
	hitsound = 'sound/weapons/pierce.ogg'
	attack_verb_continuous = list("swipes", "slashes", "cuts", "slaps")
	attack_verb_simple = list("swipe", "slash", "cut", "slap")
	sharpness = SHARP_POINTY
	actions_types = list(/datum/action/item_action/toggle_light)
	obj_flags = UNIQUE_RENAME
	light_system = MOVABLE_LIGHT
	light_outer_range = 4
	light_on = FALSE
	charged = TRUE
	charge_time = 2
	detonation_damage = 40
	backstab_bonus = 120
	overrides_main = TRUE
	overrides_twohandrequired = TRUE
	override_twohandedsprite = TRUE


/obj/item/kinetic_crusher/claw/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/butchering, \
		speed = 5 SECONDS, \
		effectiveness = 100, \
	)

//Proto-Kinetic Accelerators

/obj/item/gun/energy/recharge/kinetic_accelerator/railgun
	name = "proto-kinetic railgun"
	desc = "Before the nice streamlined and modern day Proto-Kinetic Accelerator was created, multiple designs were drafted by the Mining Research and Development \
	team. Many were failures, including this one, which came out too bulky and too ineffective. Well recently the MR&D Team got drunk and said 'fuck it we ball' and \
	went back to the bulky design, overclocked it, and made it functional, turning it into what is essentially a literal man portable particle accelerator. \
	The design results in a massive hard to control blast of kinetic energy, with the power to punch right through creatures and cause massive damage. The \
	only problem with the design is that it is so bulky you need to carry it with two hands, and the technology has no optimization for a pressured enviorment, \
	resulting in a near zero force value in pressurized areas."
	icon = 'monkestation/icons/obj/guns/guns.dmi'
	icon_state = "kineticrailgun"
	base_icon_state = "kineticrailgun"
	inhand_icon_state = "kineticgun"
	w_class = WEIGHT_CLASS_HUGE
	recharge_time = 3 SECONDS
	ammo_type = list(/obj/item/ammo_casing/energy/kinetic/railgun)
	item_flags = NONE
	obj_flags = UNIQUE_RENAME
	weapon_weight = WEAPON_HEAVY
	can_bayonet = FALSE
	max_mod_capacity = 0 //fuck off
	recoil = 3 //railgun go brrrrr
	gun_flags = NOT_A_REAL_GUN
	disablemodification = TRUE

/obj/item/gun/energy/recharge/kinetic_accelerator/repeater
	name = "proto-kinetic repeater"
	desc = "During the pizza party celebrating the release of the new crusher designs, the Mining Research and Development team members were only allowed one slice. \
	One member exclaimed 'I wish we could have more than one slice' and another replied 'I wish we could shoot the accelerator more than once' and thus, the repeater \
	on the spot. The repeater trades a bit of power for the ability to fire three shots before becoming empty, while retaining the ability to fully recharge in one \
	go. The extra technology packed inside to make this possible unfortunately reduces mod space meaning you cnat carry as many mods compared to a regular accelerator."
	icon = 'monkestation/icons/obj/guns/guns.dmi'
	icon_state = "kineticrepeater"
	base_icon_state = "kineticrepeater"
	inhand_icon_state = "kineticgun"
	recharge_time = 2 SECONDS
	ammo_type = list(/obj/item/ammo_casing/energy/kinetic/repeater)
	item_flags = NONE
	obj_flags = UNIQUE_RENAME
	weapon_weight = WEAPON_LIGHT
	can_bayonet = TRUE
	knife_x_offset = 20
	knife_y_offset = 12
	max_mod_capacity = 60

/obj/item/gun/energy/recharge/kinetic_accelerator/shotgun
	name = "proto-kinetic shotgun"
	desc = "During the crusher design pizza party, one member of the Mining Research and Development team brought out a real riot shotgun, and killed three \
	other research members with one blast. The MR&D Director immedietly thought of a genuis idea, creating the proto-kinetic shotgun moments later, which he \
	immedietly used to execute the research member who brought the real shotgun. The proto-kinetic shotgun trades off some mod capacity and cooldown in favor \
	of firing three shots at once with reduce range and power. The total damage of all three shots is higher than a regular PKA but the individual shots are weaker."
	icon = 'monkestation/icons/obj/guns/guns.dmi'
	icon_state = "kineticshotgun"
	base_icon_state = "kineticshotgun"
	inhand_icon_state = "kineticgun"
	recharge_time = 2 SECONDS
	ammo_type = list(/obj/item/ammo_casing/energy/kinetic/shotgun)
	item_flags = NONE
	obj_flags = UNIQUE_RENAME
	weapon_weight = WEAPON_LIGHT
	can_bayonet = TRUE
	knife_x_offset = 20
	knife_y_offset = 12
	max_mod_capacity = 60

/obj/item/gun/energy/recharge/kinetic_accelerator/glock
	name = "proto-kinetic pistol"
	desc = "During the pizza party for the Mining Research and Development team, one special snowflake researcher wanted a mini murphy instead of a regular \
	pizza slice, so reluctantly the Director bought him his mini murphy, which the dumbass immedietly dropped ontop of a PKA. Suddenly the idea to create \
	a 'build your own PKA' design was created. The proto-kinetic pistol is arguably worse than the base PKA, sporting lower damage and range. But this lack \
	of base efficiency allows room for nearly double the mods, making it truely 'your own PKA'."
	icon = 'monkestation/icons/obj/guns/guns.dmi'
	icon_state = "kineticpistol"
	base_icon_state = "kineticpistol"
	inhand_icon_state = "kineticgun"
	recharge_time = 1.45 SECONDS
	ammo_type = list(/obj/item/ammo_casing/energy/kinetic/glock)
	item_flags = NONE
	obj_flags = UNIQUE_RENAME
	weapon_weight = WEAPON_LIGHT
	can_bayonet = FALSE
	max_mod_capacity = 200

/obj/item/gun/energy/recharge/kinetic_accelerator/shockwave
	name = "proto-kinetic shockwave"
	desc = "Quite frankly, we have no idea how the Mining Research and Development team came up with this one, all we know is that alot of \
	beer was involved. This proto-kinetic design will slam the ground, creating a shockwave around the user, with the same power as the base PKA.\
	The only downside is the lowered mod capacity, the lack of range it offers, and the higher cooldown, but its pretty good for clearing rocks."
	icon = 'monkestation/icons/obj/guns/guns.dmi'
	icon_state = "kineticshockwave"
	base_icon_state = "kineticshockwave"
	inhand_icon_state = "kineticgun"
	recharge_time = 2 SECONDS
	ammo_type = list(/obj/item/ammo_casing/energy/kinetic/shockwave)
	item_flags = NONE
	obj_flags = UNIQUE_RENAME
	weapon_weight = WEAPON_LIGHT
	can_bayonet = FALSE
	max_mod_capacity = 60

/obj/item/gun/energy/recharge/grapple
	name = "Miner Zip Hook"
	desc = "During the pizza party for the Mining Research and Development team, the Mining Research Director went outside, and played with his favorite ball. \
	Unfortunetly he accidently tossed it to the other side of a massive lavalake. Out of pure spite he decided that instead of getting an RCD like any sane individual \
	he would create a brand new PKA type using the meathook he kept in his office. Thus the grappleing hook was (finally) created. The Proto-Kinetic grapple hook \
	allows quick traversal over pits, chasms, and lava, by firing a high speed grapple hook and yanking the user towards it. Dont worry about the inertia, the nerds \
	in RND took care of that problem (after six test subjects)."
	icon = 'monkestation/icons/obj/guns/guns.dmi'
	icon_state = "kineticgrapple"
	base_icon_state = "kineticgrapple"
	inhand_icon_state = "kineticgun"
	recharge_time = 5 SECONDS
	ammo_type = list(/obj/item/ammo_casing/energy/hook)
	item_flags = NONE
	obj_flags = UNIQUE_RENAME
	weapon_weight = WEAPON_LIGHT
	can_bayonet = FALSE

//Accelerator Casing
/obj/item/ammo_casing/energy/kinetic/railgun
	projectile_type = /obj/projectile/kinetic/railgun
	select_name = "kinetic"
	e_cost = 500
	fire_sound = 'sound/weapons/beam_sniper.ogg'

/obj/item/ammo_casing/energy/kinetic/repeater
	projectile_type = /obj/projectile/kinetic/repeater
	select_name = "kinetic"
	e_cost = 150 //about three shots
	fire_sound = 'sound/weapons/kenetic_accel.ogg'

/obj/item/ammo_casing/energy/kinetic/shotgun
	projectile_type = /obj/projectile/kinetic/shotgun
	select_name = "kinetic"
	e_cost = 500
	pellets = 3
	variance = 50
	fire_sound = 'sound/weapons/kenetic_accel.ogg'

/obj/item/ammo_casing/energy/kinetic/glock
	projectile_type = /obj/projectile/kinetic/glock
	select_name = "kinetic"
	e_cost = 500
	fire_sound = 'sound/weapons/kenetic_accel.ogg'

/obj/item/ammo_casing/energy/kinetic/shockwave
	projectile_type = /obj/projectile/kinetic/shockwave
	select_name = "kinetic"
	e_cost = 500
	pellets = 8
	variance = 360
	fire_sound = 'sound/weapons/gun/general/cannon.ogg'

/obj/item/ammo_casing/energy/hook
	name = "grappling hook"
	desc = "A mining grapple hook."
	e_cost = 500
	projectile_type = /obj/projectile/hook/mining
	caliber = ENERGY
	firing_effect_type = /obj/effect/temp_visual/dir_setting/firing_effect/energy
	harmful = FALSE //finally, some good fucking food for pacafists


//Accelerator Projectiles
/obj/projectile/kinetic/railgun
	name = "hyper kinetic force"
	icon_state = null
	damage = 100
	damage_type = BRUTE
	armor_flag = BOMB
	range = 7
	log_override = TRUE
	pressure_decrease = 0.10 //Pressured enviorments are a no go for the railgun
	speed = 0.1 //NYOOM
	projectile_piercing = PASSMOB

/obj/projectile/kinetic/repeater
	name = "rapid kinetic force"
	icon_state = null
	damage = 20
	damage_type = BRUTE
	armor_flag = BOMB
	range = 4
	log_override = TRUE

/obj/projectile/kinetic/shotgun
	name = "split kinetic force"
	icon_state = null
	damage = 20
	damage_type = BRUTE
	armor_flag = BOMB
	range = 3
	log_override = TRUE

/obj/projectile/kinetic/glock
	name = "light kinetic force"
	icon_state = null
	damage = 15
	damage_type = BRUTE
	armor_flag = BOMB
	range = 3
	log_override = TRUE

/obj/projectile/kinetic/shockwave
	name = "concussive kinetic force"
	icon_state = null
	damage = 40
	damage_type = BRUTE
	armor_flag = BOMB
	range = 1
	log_override = TRUE

/obj/projectile/hook/mining
	name = "grapple hook"
	icon_state = "hook"
	icon = 'icons/obj/lavaland/artefacts.dmi'
	pass_flags = PASSTABLE
	damage = 0
	stamina = 0
	armour_penetration = 0
	damage_type = BRUTE
	hitsound = 'sound/effects/splat.ogg'
	knockdown_time = (0 SECONDS)
	disablepull = TRUE
	range = 10
	speed = 0.5

//Procs for mining grapplehook

/obj/projectile/hook/mining/on_hit(atom/target)
	. = ..()
	firer.forceMove(get_turf(src))
	var/atom/A = target
	A.visible_message(span_danger("[firer] zips towards [A] as the hook latches on!"))


//ADMIN ONLY MEMES
/obj/item/gun/energy/recharge/kinetic_accelerator/meme
	name = "adminium reaper"
	desc = "Mining RnD broke the fabric of space time, please return to your nearest centralcommand officer. <b> WARNING FROM THE MINING RND DIRECTOR : DO NOT RAPIDLY PULL TRIGGER : FABRIC OF SPACE TIME LIABLE TO BREAK </b>"
	icon_state = "kineticgun"
	base_icon_state = "kineticgun"
	inhand_icon_state = "kineticgun"
	recharge_time = 0.1
	ammo_type = list(/obj/item/ammo_casing/energy/kinetic/meme)
	item_flags = NONE
	obj_flags = UNIQUE_RENAME
	weapon_weight = WEAPON_LIGHT
	can_bayonet = TRUE
	knife_x_offset = 20
	knife_y_offset = 12
	max_mod_capacity = 420

/obj/item/ammo_casing/energy/kinetic/meme
	projectile_type = /obj/projectile/kinetic/meme
	select_name = "kinetic"
	e_cost = 1
	pellets = 69
	variance = 90
	fire_sound = 'sound/effects/adminhelp.ogg'
	variance = 3

/obj/projectile/kinetic/meme
	name = "proto kinetic meme force"
	icon_state = null
	damage = 420
	damage_type = BRUTE
	range = 300
	log_override = TRUE
	pressure_decrease = 1
	dismemberment = 10
	catastropic_dismemberment = TRUE
	hitsound = 'sound/effects/adminhelp.ogg'

/obj/item/gun/energy/recharge/kinetic_accelerator/meme/nonlethal
	name = "adminium stunner"
	desc = "Mining RnD broke the fabric of space time AGAIN, please return to your nearest centralcommand officer. <b> WARNING FROM THE MINING RND DIRECTOR : DO NOT RAPIDLY PULL TRIGGER : FABRIC OF SPACE TIME LIABLE TO BREAK </b>\
	Im being bullied by the admins"
	icon_state = "kineticgun"
	base_icon_state = "kineticgun"
	inhand_icon_state = "kineticgun"
	recharge_time = 0.1
	ammo_type = list(/obj/item/ammo_casing/energy/kinetic/meme/nonlethal)
	can_bayonet = FALSE
	max_mod_capacity = 0

/obj/item/ammo_casing/energy/kinetic/meme/nonlethal
	projectile_type = /obj/projectile/kinetic/meme/nonlethal
	select_name = "kinetic"
	fire_sound = 'sound/effects/adminhelp.ogg'

/obj/projectile/kinetic/meme/nonlethal
	name = "surprisingly soft proto kinetic meme force"
	damage = 0
	dismemberment = 0
	catastropic_dismemberment = FALSE
	stun = 69
	knockdown = 69
	paralyze = 69
	immobilize = 69
	unconscious = 69
	eyeblur = 69
	drowsy = 69 SECONDS
	jitter = 69 SECONDS
	stamina = 69 SECONDS
	stutter = 69 SECONDS
	slur = 69 SECONDS
