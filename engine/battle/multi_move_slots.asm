CheckFurySwipesUsers:
	ld a, [wCurPartySpecies]
	ld hl, FurySwipesUsers
	ld de, 1
	call IsInArray
	ret

GetFuryAttackName:
    ld a, [hROMBank]
	push af
	push hl
	push bc
	push de
    call CheckFurySwipesUsers
	jr nc, .not_fury_swipes
	ld hl, FuryAttackNames
	ld a, 0
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	call CopyBytes
	jp GetMoveNameDone
.not_fury_swipes
    ld hl, FuryAttackNames
	ld a, 1
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	call CopyBytes
	jp GetMoveNameDone

GetMoveNameDone:
	pop de
	pop bc
	pop hl
	pop af
	rst Bankswitch
	ret

;GetMultiMoveSlotName:
;    ld a, [wCurMove]

FurySwipesUsers:
; Pokemon that use Fury Swipes instead of Fury Attack.
    db SQUIRTLE
    db -1

FuryAttackNames:
	db "FURY SWIPES@"
	db "FURY ATTACK@"
	db -1