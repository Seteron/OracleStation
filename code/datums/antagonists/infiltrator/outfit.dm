/datum/outfit/infiltrator
	name = "Syndicate Infiltrator"

	uniform = /obj/item/clothing/under/chameleon
	shoes = /obj/item/clothing/shoes/chameleon
	gloves = /obj/item/clothing/gloves/chameleon
	back = /obj/item/storage/backpack/chameleon
	ears = /obj/item/device/radio/headset/chameleon
	id = /obj/item/card/id/syndicate
	mask = /obj/item/clothing/mask/chameleon
	belt = /obj/item/device/pda/chameleon
	backpack_contents = list(/obj/item/storage/box/syndie=1,\
		/obj/item/kitchen/knife/combat/survival=1,\
		/obj/item/gun/ballistic/automatic/pistol=1)
	l_pocket = /obj/item/pinpointer/infiltrator

/datum/outfit/infiltrator/post_equip(mob/living/carbon/human/H)
	var/obj/item/implant/weapons_auth/W = new/obj/item/implant/weapons_auth(H)
	W.implant(H)
	var/obj/item/implant/dusting/E = new/obj/item/implant/dusting(H)
	E.implant(H)
	var/obj/item/implant/uplink/infiltrator/U = new/obj/item/implant/uplink/infiltrator(H)
	U.implant(H)
	U.hidden_uplink.owner = H.key
	U.hidden_uplink.set_gamemode(/datum/game_mode/infiltration)
	if(SSticker.mode.infiltration_team)
		SSticker.mode.infiltration_team.uplinks += U.hidden_uplink
	var/obj/item/implant/radio/syndicate/S = new/obj/item/implant/radio/syndicate(H)
	S.implant(H)
	H.faction |= "syndicate"
	H.update_icons()

	var/obj/item/card/id/card = H.wear_id
	if(istype(card))
		card.registered_name = H.real_name
		card.assignment = "Assistant"
		card.access = list(ACCESS_MAINT_TUNNELS, ACCESS_SYNDICATE)
		card.update_label()