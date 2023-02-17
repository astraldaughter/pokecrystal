	object_const_def
	const ROUTE51_COOLTRAINER_M1
	const ROUTE51_YOUNGSTER
	const ROUTE51_TEACHER1
	const ROUTE51_FRUIT_TREE
	const ROUTE51_FISHER
	const ROUTE51_COOLTRAINER_M2
	const ROUTE51_TUSCANY
	const ROUTE51_POKE_BALL

Route51_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_ROUTE51_NOTHING
	scene_script .DummyScene1 ; SCENE_ROUTE51_CATCH_TUTORIAL

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Tuscany

.DummyScene0:
	end

.DummyScene1:
	end

.Tuscany:
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .DoesTuscanyAppear

.TuscanyDisappears:
	disappear ROUTE51_TUSCANY
	endcallback

.DoesTuscanyAppear:
	readvar VAR_WEEKDAY
	ifnotequal TUESDAY, .TuscanyDisappears
	appear ROUTE51_TUSCANY
	endcallback

Route51Tutorial1:
	turnobject ROUTE51_COOLTRAINER_M1, UP
	showemote EMOTE_SHOCK, ROUTE51_COOLTRAINER_M1, 15
	applymovement ROUTE51_COOLTRAINER_M1, DudeMovementData1a
	turnobject PLAYER, LEFT
	setevent EVENT_DUDE_TALKED_TO_YOU
	opentext
	writetext CatchingTutorialIntroText
	yesorno
	iffalse Script_RefusedTutorial1
	closetext
	follow ROUTE51_COOLTRAINER_M1, PLAYER
	applymovement ROUTE51_COOLTRAINER_M1, DudeMovementData1b
	stopfollow
	loadwildmon RATTATA, 5
	catchtutorial BATTLETYPE_TUTORIAL
	turnobject ROUTE51_COOLTRAINER_M1, UP
	opentext
	writetext CatchingTutorialDebriefText
	waitbutton
	closetext
	setscene SCENE_ROUTE51_NOTHING
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end

Route51Tutorial2:
	turnobject ROUTE51_COOLTRAINER_M1, UP
	showemote EMOTE_SHOCK, ROUTE51_COOLTRAINER_M1, 15
	applymovement ROUTE51_COOLTRAINER_M1, DudeMovementData2a
	turnobject PLAYER, LEFT
	setevent EVENT_DUDE_TALKED_TO_YOU
	opentext
	writetext CatchingTutorialIntroText
	yesorno
	iffalse Script_RefusedTutorial2
	closetext
	follow ROUTE51_COOLTRAINER_M1, PLAYER
	applymovement ROUTE51_COOLTRAINER_M1, DudeMovementData2b
	stopfollow
	loadwildmon RATTATA, 5
	catchtutorial BATTLETYPE_TUTORIAL
	turnobject ROUTE51_COOLTRAINER_M1, UP
	opentext
	writetext CatchingTutorialDebriefText
	waitbutton
	closetext
	setscene SCENE_ROUTE51_NOTHING
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end

Script_RefusedTutorial1:
	writetext CatchingTutorialDeclinedText
	waitbutton
	closetext
	applymovement ROUTE51_COOLTRAINER_M1, DudeMovementData1b
	setscene SCENE_ROUTE51_NOTHING
	end

Script_RefusedTutorial2:
	writetext CatchingTutorialDeclinedText
	waitbutton
	closetext
	applymovement ROUTE51_COOLTRAINER_M1, DudeMovementData2b
	setscene SCENE_ROUTE51_NOTHING
	end

CatchingTutorialDudeScript:
	faceplayer
	opentext
	readvar VAR_BOXSPACE
	ifequal 0, .BoxFull
	checkevent EVENT_LEARNED_TO_CATCH_POKEMON
	iftrue .BoxFull
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iffalse .BoxFull
	writetext CatchingTutorialRepeatText
	yesorno
	iffalse .Declined
	closetext
	loadwildmon RATTATA, 5
	catchtutorial BATTLETYPE_TUTORIAL
	opentext
	writetext CatchingTutorialDebriefText
	waitbutton
	closetext
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end

.BoxFull:
	writetext CatchingTutorialBoxFullText
	waitbutton
	closetext
	end

.Declined:
	writetext CatchingTutorialDeclinedText
	waitbutton
	closetext
	end

Route51YoungsterScript:
	jumptextfaceplayer Route51YoungsterText

Route51TeacherScript:
	jumptextfaceplayer Route51TeacherText

Route51FisherScript:
	jumptextfaceplayer Route51FisherText

Route51CooltrainerMScript:
	faceplayer
	opentext
	checktime DAY
	iftrue .day_morn
	checktime NITE
	iftrue .nite
.day_morn
	writetext Route51CooltrainerMText_WaitingForNight
	waitbutton
	closetext
	end

.nite
	writetext Route51CooltrainerMText_WaitingForMorning
	waitbutton
	closetext
	end

TuscanyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SILK_SCARF_FROM_TUSCANY
	iftrue TuscanyTuesdayScript
	readvar VAR_WEEKDAY
	ifnotequal TUESDAY, TuscanyNotTuesdayScript
	checkevent EVENT_MET_TUSCANY_OF_TUESDAY
	iftrue .MetTuscany
	writetext MeetTuscanyText
	promptbutton
	setevent EVENT_MET_TUSCANY_OF_TUESDAY
.MetTuscany:
	writetext TuscanyGivesGiftText
	promptbutton
	verbosegiveitem SILK_SCARF
	iffalse TuscanyDoneScript
	setevent EVENT_GOT_SILK_SCARF_FROM_TUSCANY
	writetext TuscanyGaveGiftText
	waitbutton
	closetext
	end

TuscanyTuesdayScript:
	writetext TuscanyTuesdayText
	waitbutton
TuscanyDoneScript:
	closetext
	end

TuscanyNotTuesdayScript:
	writetext TuscanyNotTuesdayText
	waitbutton
	closetext
	end

Route51Sign1:
	jumptext Route51Sign1Text

Route51Sign2:
	jumptext Route51Sign2Text

Route51FruitTree:
	fruittree FRUITTREE_ROUTE_51

Route51Potion:
	itemball POTION

DudeMovementData1a:
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step_end

DudeMovementData2a:
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step_end

DudeMovementData1b:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

DudeMovementData2b:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step_end

CatchingTutorialBoxFullText:
	text "#MON hide in"
	line "the grass. Who"

	para "knows when they'll"
	line "pop out…"
	done

CatchingTutorialIntroText:
	text "I've seen you a"
	line "couple times. How"

	para "many #MON have"
	line "you caught?"

	para "Would you like me"
	line "to show you how to"
	cont "catch #MON?"
	done

CatchingTutorialDebriefText:
	text "That's how you do"
	line "it."

	para "If you weaken them"
	line "first, #MON are"
	cont "easier to catch."
	done

CatchingTutorialDeclinedText:
	text "Oh. Fine, then."

	para "Anyway, if you"
	line "want to catch"

	para "#MON, you have"
	line "to walk a lot."
	done

CatchingTutorialRepeatText:
	text "Huh? You want me"
	line "to show you how to"
	cont "catch #MON?"
	done

Route51YoungsterText:
	text "Yo. How are your"
	line "#MON?"

	para "If they're weak"
	line "and not ready for"

	para "battle, keep out"
	line "of the grass."
	done

Route51TeacherText:
	text "See those ledges?"
	line "It's scary to jump"
	cont "off them."

	para "But you can go to"
	line "NEW BARK without"

	para "walking through"
	line "the grass."
	done

Route51FisherText:
	text "I wanted to take a"
	line "break, so I saved"

	para "to record my"
	line "progress."
	done

Route51CooltrainerMText_WaitingForDay: ; unreferenced
	text "I'm waiting for"
	line "#MON that"

	para "appear only in the"
	line "daytime."
	done

Route51CooltrainerMText_WaitingForNight:
	text "I'm waiting for"
	line "#MON that"

	para "appear only at"
	line "night."
	done

Route51CooltrainerMText_WaitingForMorning:
	text "I'm waiting for"
	line "#MON that"

	para "appear only in the"
	line "morning."
	done

MeetTuscanyText:
	text "TUSCANY: I do be-"
	line "lieve that this is"

	para "the first time"
	line "we've met?"

	para "Please allow me to"
	line "introduce myself."

	para "I am TUSCANY of"
	line "Tuesday."
	done

TuscanyGivesGiftText:
	text "By way of intro-"
	line "duction, please"

	para "accept this gift,"
	line "a SILK SCARF."
	done

TuscanyGaveGiftText:
	text "TUSCANY: Wouldn't"
	line "you agree that it"
	cont "is most adorable?"

	para "It strengthens"
	line "normal-type moves."

	para "I am certain it"
	line "will be of use."
	done

TuscanyTuesdayText:
	text "TUSCANY: Have you"
	line "met MONICA, my"
	cont "older sister?"

	para "Or my younger"
	line "brother, WESLEY?"

	para "I am the second of"
	line "seven children."
	done

TuscanyNotTuesdayText:
	text "TUSCANY: Today is"
	line "not Tuesday. That"
	cont "is unfortunate…"
	done

Route51Sign1Text:
	text "ROUTE 51"

	para "NIVALE TOWN -"
	line "CAMPANULA TOWN"
	done

Route51Sign2Text:
	text "ROUTE 51"

	para "NIVALE TOWN -"
	line "CAMPANULA TOWN"
	done

Route51_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 27, 17, ROUTE_51_ROUTE_46_GATE, 3

	def_coord_events
	coord_event 53,  8, SCENE_ROUTE51_CATCH_TUTORIAL, Route51Tutorial1
	coord_event 53,  9, SCENE_ROUTE51_CATCH_TUTORIAL, Route51Tutorial2

	def_bg_events
	bg_event 51,  9, BGEVENT_READ, Route51Sign1
	bg_event  5,  7, BGEVENT_READ, Route51Sign2

	def_object_events
	object_event 50, 12, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CatchingTutorialDudeScript, -1
	object_event 27, 16, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route51YoungsterScript, -1
	object_event 14, 10, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route51TeacherScript, -1
	object_event  6,  4, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route51FruitTree, -1
	object_event 25,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route51FisherScript, -1
	object_event 13,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route51CooltrainerMScript, -1
	object_event 29, 12, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TuscanyScript, EVENT_ROUTE_51_TUSCANY_OF_TUESDAY
	object_event 46,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route51Potion, EVENT_ROUTE_51_POTION
