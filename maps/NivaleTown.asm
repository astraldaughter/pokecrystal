	object_const_def
	const NIVALETOWN_TEACHER
	const NIVALETOWN_FISHER

NivaleTown_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_NEW_BARK
	clearevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	endcallback

NivaleTown_TeacherStopsYouScene1:
	playmusic MUSIC_MOM
	turnobject NIVALETOWN_TEACHER, RIGHT
	opentext
	writetext Text_WaitPlayer
	waitbutton
	closetext
	turnobject PLAYER, LEFT
	applymovement NIVALETOWN_TEACHER, NivaleTown_TeacherRunsToYouMovement1
	opentext
	writetext Text_WhereAreYouGoing
	waitbutton
	closetext
	follow NIVALETOWN_TEACHER, PLAYER
	applymovement NIVALETOWN_TEACHER, NivaleTown_TeacherBringsYouBackMovement1
	stopfollow
	opentext
	writetext Text_ItsDangerousToGoAlone
	waitbutton
	closetext
	special RestartMapMusic
	end

NivaleTown_TeacherStopsYouScene2:
	playmusic MUSIC_MOM
	turnobject NIVALETOWN_TEACHER, RIGHT
	opentext
	writetext Text_WaitPlayer
	waitbutton
	closetext
	turnobject PLAYER, LEFT
	applymovement NIVALETOWN_TEACHER, NivaleTown_TeacherRunsToYouMovement2
	turnobject PLAYER, UP
	opentext
	writetext Text_WhereAreYouGoing
	waitbutton
	closetext
	follow NIVALETOWN_TEACHER, PLAYER
	applymovement NIVALETOWN_TEACHER, NivaleTown_TeacherBringsYouBackMovement2
	stopfollow
	opentext
	writetext Text_ItsDangerousToGoAlone
	waitbutton
	closetext
	special RestartMapMusic
	end

NivaleTownTeacherScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .MonIsAdorable
	writetext Text_GearIsImpressive
	waitbutton
	closetext
	end

.MonIsAdorable:
	writetext Text_YourMonIsAdorable
	waitbutton
	closetext
	end

NivaleTownFisherScript:
	jumptextfaceplayer Text_TechIncredibleGuy

NivaleTownSign:
	jumptext NivaleTownSignText

NivaleTownPlayersHouseSign:
	jumptext NivaleTownPlayersHouseSignText

NivaleTownRivalsHouseSign:
	jumptext NivaleTownRivalsHouseSignText

NivaleTown_TeacherRunsToYouMovement1:
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

NivaleTown_TeacherRunsToYouMovement2:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

NivaleTown_TeacherBringsYouBackMovement1:
	step LEFT
	step LEFT
	step LEFT
	turn_head RIGHT
	step_end

NivaleTown_TeacherBringsYouBackMovement2:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head RIGHT
	step_end

Text_GearIsImpressive:
	text "Wow, your #GEAR"
	line "is impressive!"

	para "Did your mom get"
	line "it for you?"
	done

Text_WaitPlayer:
	text "Wait, <PLAY_G>!"
	done

Text_WhereAreYouGoing:
	text "Where are you"
	line "going?"
	done

Text_ItsDangerousToGoAlone:
	text "It's dangerous to"
	line "go out without a"
	cont "#MON!"

	para "Wild #MON"
	line "jump out of the"

	para "grass on the way"
	line "to the next town."

	para "Besides, I'm"
	line "pretty sure that"
	
	para "<RIVAL> was"
	line "looking for you."
	done

Text_YourMonIsAdorable:
	text "Oh! Your #MON"
	line "is adorable!"
	
	para "I wish I had one"
	line "just like it!"
	done

Text_TechIncredibleGuy:
	text "Yo, <PLAYER>!"

	para "I've been reading"
	line "about #MON from"
	
	para "other regions"
	line "on the NET."

	para "Isn't technology"
	line "incredible?"
	done

NivaleTownSignText:
	text "NIVALE TOWN"

	para "The Town Of"
	line "Fresh Starts"
	done

NivaleTownPlayersHouseSignText:
	text "<PLAYER>'s House"
	done

NivaleTownRivalsHouseSignText:
	text "<RIVAL>'s House"
	done

NivaleTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  5, RIVALS_HOUSE, 1
	warp_event 13,  5, PLAYERS_HOUSE_1F, 1
	warp_event  3, 11, PLAYERS_NEIGHBORS_HOUSE, 1

	def_coord_events
	coord_event 17,  8, SCENE_DEFAULT, NivaleTown_TeacherStopsYouScene1
	coord_event 17,  9, SCENE_DEFAULT, NivaleTown_TeacherStopsYouScene2

	def_bg_events
	bg_event  7,  9, BGEVENT_READ, NivaleTownSign
	bg_event 14,  6, BGEVENT_READ, NivaleTownPlayersHouseSign
	bg_event  6,  6, BGEVENT_READ, NivaleTownRivalsHouseSign

	def_object_events
	object_event 13,  8, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NivaleTownTeacherScript, -1
	object_event  8,  8, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NivaleTownFisherScript, -1
