	object_const_def
    const RIVALSHOUSE_DAD
    const RIVALSHOUSE_POKE_BALL_1
    const RIVALSHOUSE_POKE_BALL_2
    const RIVALSHOUSE_POKE_BALL_3

RivalsHouse_MapScripts:
	def_scene_scripts

	def_callbacks

    RivalsDadScript:
        jumptextfaceplayer RivalsDadText

    FireStarterPokeBallScript:
    WaterStarterPokeBallScript:
    GrassStarterPokeBallScript:
        jumptext TestText
        givepoke EEVEE, 20
        setevent EVENT_GOT_CHIKORITA_FROM_ELM

RivalsDadText:
    text "I've known PROF."
    line "TREENAME since"

    para "we were both in"
    line "college. It's"

    para "probably because"
    line "of that that"

    para "<RIVAL>'s so"
    line "set on becoming"

    para "a #MON"
    line "trainer."
    done


TestText:
    text "This is a test."
    line "Hi."
    done

RivalsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8, 7, NIVALE_TOWN, 1
    warp_event  9, 7, NIVALE_TOWN, 1

	def_coord_events

	def_bg_events

	def_object_events
        object_event  1,  3, SPRITE_BILL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RivalsDadScript, -1
    	object_event  2,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FireStarterPokeBallScript, -1
	    object_event  3,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WaterStarterPokeBallScript, -1
	    object_event  4,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GrassStarterPokeBallScript, -1