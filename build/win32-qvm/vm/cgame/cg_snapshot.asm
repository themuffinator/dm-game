code
proc CG_ResetEntity 8 4
file "..\..\..\..\code\cgame\cg_snapshot.c"
line 15
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_snapshot.c -- things that happen on snapshot transition,
;4:// not necessarily every single rendered frame
;5:
;6:#include "cg_local.h"
;7:
;8:
;9:
;10:/*
;11:==================
;12:CG_ResetEntity
;13:==================
;14:*/
;15:static void CG_ResetEntity( centity_t *cent ) {
line 18
;16:	// if the previous snapshot this entity was updated in is at least
;17:	// an event window back in time then we can reset the previous event
;18:	if ( cent->snapShotTime < cg.time - EVENT_VALID_MSEC ) {
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
CNSTI4 300
SUBI4
GEI4 $74
line 19
;19:		cent->previousEvent = 0;
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
CNSTI4 0
ASGNI4
line 20
;20:	}
LABELV $74
line 22
;21:
;22:	cent->trailTime = cg.snap->serverTime;
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 24
;23:
;24:	VectorCopy (cent->currentState.origin, cent->lerpOrigin);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 25
;25:	VectorCopy (cent->currentState.angles, cent->lerpAngles);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 728
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 26
;26:	if ( cent->currentState.eType == ET_PLAYER ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $78
line 27
;27:		CG_ResetPlayerEntity( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ResetPlayerEntity
CALLV
pop
line 28
;28:	}
LABELV $78
line 29
;29:}
LABELV $73
endproc CG_ResetEntity 8 4
proc CG_TransitionEntity 4 4
line 38
;30:
;31:/*
;32:===============
;33:CG_TransitionEntity
;34:
;35:cent->nextState is moved to cent->currentState and events are fired
;36:===============
;37:*/
;38:static void CG_TransitionEntity( centity_t *cent ) {
line 39
;39:	cent->currentState = cent->nextState;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRB
ASGNB 208
line 40
;40:	cent->currentValid = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
CNSTI4 1
ASGNI4
line 43
;41:
;42:	// reset if the entity wasn't in the last frame or was teleported
;43:	if ( !cent->interpolate ) {
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
CNSTI4 0
NEI4 $81
line 44
;44:		CG_ResetEntity( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ResetEntity
CALLV
pop
line 45
;45:	}
LABELV $81
line 48
;46:
;47:	// clear the next state.  if will be set by the next CG_SetNextSnap
;48:	cent->interpolate = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 0
ASGNI4
line 51
;49:
;50:	// check for events
;51:	CG_CheckEvents( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CheckEvents
CALLV
pop
line 52
;52:}
LABELV $80
endproc CG_TransitionEntity 4 4
export CG_SetInitialSnapshot
proc CG_SetInitialSnapshot 16 12
line 66
;53:
;54:
;55:/*
;56:==================
;57:CG_SetInitialSnapshot
;58:
;59:This will only happen on the very first snapshot, or
;60:on tourney restarts.  All other times will use 
;61:CG_TransitionSnapshot instead.
;62:
;63:FIXME: Also called by map_restart?
;64:==================
;65:*/
;66:void CG_SetInitialSnapshot( snapshot_t *snap ) {
line 71
;67:	int				i;
;68:	centity_t		*cent;
;69:	entityState_t	*state;
;70:
;71:	cg.snap = snap;
ADDRGP4 cg+36
ADDRFP4 0
INDIRP4
ASGNP4
line 73
;72:
;73:	BG_PlayerStateToEntityState( &snap->ps, &cg_entities[ snap->ps.clientNum ].currentState, qfalse );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 44
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 740
MULI4
ADDRGP4 cg_entities
ADDP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 76
;74:
;75:	// sort out solid entities
;76:	CG_BuildSolidList();
ADDRGP4 CG_BuildSolidList
CALLV
pop
line 78
;77:
;78:	CG_ExecuteNewServerCommands( snap->serverCommandSequence );
ADDRFP4 0
INDIRP4
CNSTI4 53768
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ExecuteNewServerCommands
CALLV
pop
line 82
;79:
;80:	// set our local weapon selection pointer to
;81:	// what the server has indicated the current weapon is
;82:	CG_Respawn();
ADDRGP4 CG_Respawn
CALLV
pop
line 84
;83:
;84:	for ( i = 0 ; i < cg.snap->numEntities ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $88
JUMPV
LABELV $85
line 85
;85:		state = &cg.snap->entities[ i ];
ADDRLP4 8
ADDRLP4 4
INDIRI4
CNSTI4 208
MULI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 516
ADDP4
ADDP4
ASGNP4
line 86
;86:		cent = &cg_entities[ state->number ];
ADDRLP4 0
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 740
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 88
;87:
;88:		memcpy(&cent->currentState, state, sizeof(entityState_t));
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 208
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 90
;89:		//cent->currentState = *state;
;90:		cent->interpolate = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 0
ASGNI4
line 91
;91:		cent->currentValid = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 420
ADDP4
CNSTI4 1
ASGNI4
line 93
;92:
;93:		CG_ResetEntity( cent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ResetEntity
CALLV
pop
line 96
;94:
;95:		// check for events
;96:		CG_CheckEvents( cent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CheckEvents
CALLV
pop
line 97
;97:	}
LABELV $86
line 84
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $88
ADDRLP4 4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
LTI4 $85
line 98
;98:}
LABELV $83
endproc CG_SetInitialSnapshot 16 12
proc CG_TransitionSnapshot 20 12
line 108
;99:
;100:
;101:/*
;102:===================
;103:CG_TransitionSnapshot
;104:
;105:The transition point from snap to nextSnap has passed
;106:===================
;107:*/
;108:static void CG_TransitionSnapshot( void ) {
line 113
;109:	centity_t			*cent;
;110:	snapshot_t			*oldFrame;
;111:	int					i;
;112:
;113:	if ( !cg.snap ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $92
line 114
;114:		CG_Error( "CG_TransitionSnapshot: NULL cg.snap" );
ADDRGP4 $95
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 115
;115:	}
LABELV $92
line 116
;116:	if ( !cg.nextSnap ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $96
line 117
;117:		CG_Error( "CG_TransitionSnapshot: NULL cg.nextSnap" );
ADDRGP4 $99
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 118
;118:	}
LABELV $96
line 121
;119:
;120:	// execute any server string commands before transitioning entities
;121:	CG_ExecuteNewServerCommands( cg.nextSnap->serverCommandSequence );
ADDRGP4 cg+40
INDIRP4
CNSTI4 53768
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ExecuteNewServerCommands
CALLV
pop
line 124
;122:
;123:	// if we had a map_restart, set everthing with initial
;124:	if ( !cg.snap ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $101
line 125
;125:		return;
ADDRGP4 $91
JUMPV
LABELV $101
line 129
;126:	}
;127:
;128:	// clear the currentValid flag for all entities in the existing snapshot
;129:	for ( i = 0 ; i < cg.snap->numEntities ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $107
JUMPV
LABELV $104
line 130
;130:		cent = &cg_entities[ cg.snap->entities[ i ].number ];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 208
MULI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 516
ADDP4
ADDP4
INDIRI4
CNSTI4 740
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 131
;131:		cent->currentValid = qfalse;
ADDRLP4 4
INDIRP4
CNSTI4 420
ADDP4
CNSTI4 0
ASGNI4
line 132
;132:	}
LABELV $105
line 129
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $107
ADDRLP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
LTI4 $104
line 135
;133:
;134:	// move nextSnap to snap and do the transitions
;135:	oldFrame = cg.snap;
ADDRLP4 8
ADDRGP4 cg+36
INDIRP4
ASGNP4
line 136
;136:	cg.snap = cg.nextSnap;
ADDRGP4 cg+36
ADDRGP4 cg+40
INDIRP4
ASGNP4
line 138
;137:
;138:	BG_PlayerStateToEntityState( &cg.snap->ps, &cg_entities[ cg.snap->ps.clientNum ].currentState, qfalse );
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 740
MULI4
ADDRGP4 cg_entities
ADDP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 139
;139:	cg_entities[ cg.snap->ps.clientNum ].interpolate = qfalse;
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 740
MULI4
ADDRGP4 cg_entities+416
ADDP4
CNSTI4 0
ASGNI4
line 141
;140:
;141:	for ( i = 0 ; i < cg.snap->numEntities ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $120
JUMPV
LABELV $117
line 142
;142:		cent = &cg_entities[ cg.snap->entities[ i ].number ];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 208
MULI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 516
ADDP4
ADDP4
INDIRI4
CNSTI4 740
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 143
;143:		CG_TransitionEntity( cent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 CG_TransitionEntity
CALLV
pop
line 146
;144:
;145:		// remember time of snapshot this entity was last updated in
;146:		cent->snapShotTime = cg.snap->serverTime;
ADDRLP4 4
INDIRP4
CNSTI4 456
ADDP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 147
;147:	}
LABELV $118
line 141
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $120
ADDRLP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
LTI4 $117
line 149
;148:
;149:	cg.nextSnap = NULL;
ADDRGP4 cg+40
CNSTP4 0
ASGNP4
line 152
;150:
;151:	// check for playerstate transition events
;152:	if ( oldFrame ) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $125
line 155
;153:		playerState_t	*ops, *ps;
;154:
;155:		ops = &oldFrame->ps;
ADDRLP4 12
ADDRLP4 8
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 156
;156:		ps = &cg.snap->ps;
ADDRLP4 16
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 158
;157:		// teleporting checks are irrespective of prediction
;158:		if ( ( ps->eFlags ^ ops->eFlags ) & EF_TELEPORT_BIT ) {
ADDRLP4 16
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
BXORI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $128
line 159
;159:			cg.thisFrameTeleport = qtrue;	// will be cleared by prediction code
ADDRGP4 cg+107592
CNSTI4 1
ASGNI4
line 160
;160:		}
LABELV $128
line 164
;161:
;162:		// if we are not doing client side movement prediction for any
;163:		// reason, then the client events and view changes will be issued now
;164:		if ( cg.demoPlayback || (cg.snap->ps.pm_flags & PMF_FOLLOW)
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
NEI4 $139
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $139
ADDRGP4 cg_nopredict+12
INDIRI4
CNSTI4 0
NEI4 $139
ADDRGP4 cgs+149904
INDIRI4
CNSTI4 0
EQI4 $131
LABELV $139
line 165
;165:			|| cg_nopredict.integer || cgs.synchronousClients ) {
line 166
;166:			CG_TransitionPlayerState( ps, ops );
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 CG_TransitionPlayerState
CALLV
pop
line 167
;167:		}
LABELV $131
line 168
;168:	}
LABELV $125
line 169
;169:}
LABELV $91
endproc CG_TransitionSnapshot 20 12
proc CG_SetNextSnap 36 12
line 179
;170:
;171:
;172:/*
;173:===================
;174:CG_SetNextSnap
;175:
;176:A new snapshot has just been read in from the client system.
;177:===================
;178:*/
;179:static void CG_SetNextSnap( snapshot_t *snap ) {
line 185
;180:	int					num;
;181:	int					esNum;
;182:	entityState_t		*es;
;183:	centity_t			*cent;
;184:
;185:	cg.nextSnap = snap;
ADDRGP4 cg+40
ADDRFP4 0
INDIRP4
ASGNP4
line 187
;186:
;187:	BG_PlayerStateToEntityState( &snap->ps, &cg_entities[ snap->ps.clientNum ].nextState, qfalse );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 44
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 740
MULI4
ADDRGP4 cg_entities+208
ADDP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 188
;188:	cg_entities[ cg.snap->ps.clientNum ].interpolate = qtrue;
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 740
MULI4
ADDRGP4 cg_entities+416
ADDP4
CNSTI4 1
ASGNI4
line 191
;189:
;190:	// check for extrapolation errors
;191:	for ( num = 0 ; num < snap->numEntities ; num++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $148
JUMPV
LABELV $145
line 192
;192:		es = &snap->entities[num];
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 208
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ADDP4
ASGNP4
line 193
;193:		cent = &cg_entities[ es->number ];
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 740
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 195
;194:
;195:		memcpy(&cent->nextState, es, sizeof(entityState_t));
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 208
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 198
;196:		//cent->nextState = *es;
;197:
;198:		if ( cgs.ospEnc && ( esNum = cent->nextState.number ) <= MAX_CLIENTS-1 ) {
ADDRGP4 cgs+149908
INDIRI4
CNSTI4 0
EQI4 $149
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
ADDRLP4 20
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 63
GTI4 $149
line 199
;199:			cent->nextState.pos.trBase[0] += (677 - 7 * esNum);
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
CNSTI4 677
ADDRLP4 12
INDIRI4
CNSTI4 7
MULI4
SUBI4
CVIF4 4
ADDF4
ASGNF4
line 200
;200:			cent->nextState.pos.trBase[1] += (411 - 12 * esNum);
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 236
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
CNSTI4 411
ADDRLP4 12
INDIRI4
CNSTI4 12
MULI4
SUBI4
CVIF4 4
ADDF4
ASGNF4
line 201
;201:			cent->nextState.pos.trBase[2] += (243 - 2 * esNum);
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 240
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
CNSTI4 243
ADDRLP4 12
INDIRI4
CNSTI4 1
LSHI4
SUBI4
CVIF4 4
ADDF4
ASGNF4
line 202
;202:		}
LABELV $149
line 206
;203:
;204:		// if this frame is a teleport, or the entity wasn't in the
;205:		// previous frame, don't interpolate
;206:		if ( !cent->currentValid || ( ( cent->currentState.eFlags ^ es->eFlags ) & EF_TELEPORT_BIT )  ) {
ADDRLP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 0
EQI4 $154
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
BXORI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $152
LABELV $154
line 207
;207:			cent->interpolate = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 0
ASGNI4
line 208
;208:		} else {
ADDRGP4 $153
JUMPV
LABELV $152
line 209
;209:			cent->interpolate = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 1
ASGNI4
line 210
;210:		}
LABELV $153
line 211
;211:	}
LABELV $146
line 191
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $148
ADDRLP4 8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
LTI4 $145
line 215
;212:
;213:	// if the next frame is a teleport for the playerstate, we
;214:	// can't interpolate during demos
;215:	if ( cg.snap && ( ( snap->ps.eFlags ^ cg.snap->ps.eFlags ) & EF_TELEPORT_BIT ) ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $155
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
BXORI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $155
line 216
;216:		cg.nextFrameTeleport = qtrue;
ADDRGP4 cg+107596
CNSTI4 1
ASGNI4
line 217
;217:	} else {
ADDRGP4 $156
JUMPV
LABELV $155
line 218
;218:		cg.nextFrameTeleport = qfalse;
ADDRGP4 cg+107596
CNSTI4 0
ASGNI4
line 219
;219:	}
LABELV $156
line 222
;220:
;221:	// if changing follow mode, don't interpolate
;222:	if ( cg.nextSnap->ps.clientNum != cg.snap->ps.clientNum ) {
ADDRGP4 cg+40
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
EQI4 $161
line 223
;223:		cg.nextFrameTeleport = qtrue;
ADDRGP4 cg+107596
CNSTI4 1
ASGNI4
line 224
;224:	}
LABELV $161
line 227
;225:
;226:	// if changing server restarts, don't interpolate
;227:	if ( ( cg.nextSnap->snapFlags ^ cg.snap->snapFlags ) & SNAPFLAG_SERVERCOUNT ) {
ADDRGP4 cg+40
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
INDIRI4
BXORI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $166
line 228
;228:		cg.nextFrameTeleport = qtrue;
ADDRGP4 cg+107596
CNSTI4 1
ASGNI4
line 229
;229:	}
LABELV $166
line 232
;230:
;231:	// sort out solid entities
;232:	CG_BuildSolidList();
ADDRGP4 CG_BuildSolidList
CALLV
pop
line 233
;233:}
LABELV $140
endproc CG_SetNextSnap 36 12
proc CG_ReadNextSnapshot 16 12
line 246
;234:
;235:
;236:/*
;237:========================
;238:CG_ReadNextSnapshot
;239:
;240:This is the only place new snapshots are requested
;241:This may increment cgs.processedSnapshotNum multiple
;242:times if the client system fails to return a
;243:valid snapshot.
;244:========================
;245:*/
;246:static snapshot_t *CG_ReadNextSnapshot( void ) {
line 250
;247:	qboolean	r;
;248:	snapshot_t	*dest;
;249:
;250:	if ( cg.latestSnapshotNum > cgs.processedSnapshotNum + 1000 ) {
ADDRGP4 cg+28
INDIRI4
ADDRGP4 cgs+31472
INDIRI4
CNSTI4 1000
ADDI4
LEI4 $180
line 251
;251:		CG_Printf( "WARNING: CG_ReadNextSnapshot: way out of range, %i > %i\n", 
ADDRGP4 $176
ARGP4
ADDRGP4 cg+28
INDIRI4
ARGI4
ADDRGP4 cgs+31472
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 253
;252:			cg.latestSnapshotNum, cgs.processedSnapshotNum );
;253:	}
ADDRGP4 $180
JUMPV
LABELV $179
line 255
;254:
;255:	while ( cgs.processedSnapshotNum < cg.latestSnapshotNum ) {
line 257
;256:		// decide which of the two slots to load it into
;257:		if ( cg.snap == &cg.activeSnapshots[0] ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
ADDRGP4 cg+44
CVPU4 4
NEU4 $184
line 258
;258:			dest = &cg.activeSnapshots[1];
ADDRLP4 0
ADDRGP4 cg+44+53772
ASGNP4
line 259
;259:		} else {
ADDRGP4 $185
JUMPV
LABELV $184
line 260
;260:			dest = &cg.activeSnapshots[0];
ADDRLP4 0
ADDRGP4 cg+44
ASGNP4
line 261
;261:		}
LABELV $185
line 264
;262:
;263:		// try to read the snapshot from the client system
;264:		cgs.processedSnapshotNum++;
ADDRLP4 8
ADDRGP4 cgs+31472
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 265
;265:		r = trap_GetSnapshot( cgs.processedSnapshotNum, dest );
ADDRGP4 cgs+31472
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 trap_GetSnapshot
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 268
;266:
;267:		// FIXME: why would trap_GetSnapshot return a snapshot with the same server time
;268:		if ( cg.snap && r && dest->serverTime == cg.snap->serverTime ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $193
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $193
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $193
line 270
;269:			//continue;
;270:		}
LABELV $193
line 273
;271:
;272:		// if it succeeded, return
;273:		if ( r ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $197
line 274
;274:			CG_AddLagometerSnapshotInfo( dest );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddLagometerSnapshotInfo
CALLV
pop
line 275
;275:			return dest;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $171
JUMPV
LABELV $197
line 284
;276:		}
;277:
;278:		// a GetSnapshot will return failure if the snapshot
;279:		// never arrived, or  is so old that its entities
;280:		// have been shoved off the end of the circular
;281:		// buffer in the client system.
;282:
;283:		// record as a dropped packet
;284:		if ( cg.snap ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $199
line 285
;285:			CG_AddLagometerSnapshotInfo( NULL );
CNSTP4 0
ARGP4
ADDRGP4 CG_AddLagometerSnapshotInfo
CALLV
pop
line 286
;286:		}
LABELV $199
line 290
;287:
;288:		// If there are additional snapshots, continue trying to
;289:		// read them.
;290:	}
LABELV $180
line 255
ADDRGP4 cgs+31472
INDIRI4
ADDRGP4 cg+28
INDIRI4
LTI4 $179
line 293
;291:
;292:	// nothing left to read
;293:	return NULL;
CNSTP4 0
RETP4
LABELV $171
endproc CG_ReadNextSnapshot 16 12
export CG_ProcessSnapshots
proc CG_ProcessSnapshots 12 8
line 316
;294:}
;295:
;296:
;297:/*
;298:============
;299:CG_ProcessSnapshots
;300:
;301:We are trying to set up a renderable view, so determine
;302:what the simulated time is, and try to get snapshots
;303:both before and after that time if available.
;304:
;305:If we don't have a valid cg.snap after exiting this function,
;306:then a 3D game view cannot be rendered.  This should only happen
;307:right after the initial connection.  After cg.snap has been valid
;308:once, it will never turn invalid.
;309:
;310:Even if cg.snap is valid, cg.nextSnap may not be, if the snapshot
;311:hasn't arrived yet (it becomes an extrapolating situation instead
;312:of an interpolating one)
;313:
;314:============
;315:*/
;316:void CG_ProcessSnapshots( void ) {
line 321
;317:	snapshot_t		*snap;
;318:	int				n;
;319:
;320:	// see what the latest snapshot the client system has is
;321:	trap_GetCurrentSnapshotNumber( &n, &cg.latestSnapshotTime );
ADDRLP4 4
ARGP4
ADDRGP4 cg+32
ARGP4
ADDRGP4 trap_GetCurrentSnapshotNumber
CALLV
pop
line 322
;322:	if ( n != cg.latestSnapshotNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+28
INDIRI4
EQI4 $213
line 323
;323:		if ( n < cg.latestSnapshotNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+28
INDIRI4
GEI4 $207
line 325
;324:			// this should never happen
;325:			CG_Error( "CG_ProcessSnapshots: n < cg.latestSnapshotNum" );
ADDRGP4 $210
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 326
;326:		}
LABELV $207
line 327
;327:		cg.latestSnapshotNum = n;
ADDRGP4 cg+28
ADDRLP4 4
INDIRI4
ASGNI4
line 328
;328:	}
ADDRGP4 $213
JUMPV
LABELV $212
line 333
;329:
;330:	// If we have yet to receive a snapshot, check for it.
;331:	// Once we have gotten the first snapshot, cg.snap will
;332:	// always have valid data for the rest of the game
;333:	while ( !cg.snap ) {
line 334
;334:		snap = CG_ReadNextSnapshot();
ADDRLP4 8
ADDRGP4 CG_ReadNextSnapshot
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 335
;335:		if ( !snap ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $216
line 337
;336:			// we can't continue until we get a snapshot
;337:			return;
ADDRGP4 $202
JUMPV
LABELV $216
line 342
;338:		}
;339:
;340:		// set our weapon selection to what
;341:		// the playerstate is currently using
;342:		if ( !( snap->snapFlags & SNAPFLAG_NOT_ACTIVE ) ) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $218
line 343
;343:			CG_SetInitialSnapshot( snap );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetInitialSnapshot
CALLV
pop
line 344
;344:		}
LABELV $218
line 345
;345:	}
LABELV $213
line 333
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $212
LABELV $220
line 350
;346:
;347:	// loop until we either have a valid nextSnap with a serverTime
;348:	// greater than cg.time to interpolate towards, or we run
;349:	// out of available snapshots
;350:	do {
line 352
;351:		// if we don't have a nextframe, try and read a new one in
;352:		if ( !cg.nextSnap ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $223
line 353
;353:			snap = CG_ReadNextSnapshot();
ADDRLP4 8
ADDRGP4 CG_ReadNextSnapshot
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 357
;354:
;355:			// if we still don't have a nextframe, we will just have to
;356:			// extrapolate
;357:			if ( !snap ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $226
line 358
;358:				break;
ADDRGP4 $222
JUMPV
LABELV $226
line 361
;359:			}
;360:
;361:			CG_SetNextSnap( snap );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetNextSnap
CALLV
pop
line 364
;362:
;363:			// if time went backwards, we have a level restart
;364:			if ( cg.nextSnap->serverTime < cg.snap->serverTime ) {
ADDRGP4 cg+40
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
GEI4 $228
line 365
;365:				CG_Error( "CG_ProcessSnapshots: Server time went backwards" );
ADDRGP4 $232
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 366
;366:			}
LABELV $228
line 367
;367:		}
LABELV $223
line 370
;368:
;369:		// if our time is < nextFrame's, we have a nice interpolating state
;370:		if ( cg.time >= cg.snap->serverTime && cg.time < cg.nextSnap->serverTime ) {
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
LTI4 $233
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+40
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
GEI4 $233
line 371
;371:			break;
ADDRGP4 $222
JUMPV
LABELV $233
line 375
;372:		}
;373:
;374:		// we have passed the transition from nextFrame to frame
;375:		CG_TransitionSnapshot();
ADDRGP4 CG_TransitionSnapshot
CALLV
pop
line 376
;376:	} while ( 1 );
LABELV $221
ADDRGP4 $220
JUMPV
LABELV $222
line 379
;377:
;378:	// assert our valid conditions upon exiting
;379:	if ( cg.snap == NULL ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $239
line 380
;380:		CG_Error( "CG_ProcessSnapshots: cg.snap == NULL" );
ADDRGP4 $242
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 381
;381:	}
LABELV $239
line 382
;382:	if ( cg.time < cg.snap->serverTime ) {
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
GEI4 $243
line 384
;383:		// this can happen right after a vid_restart
;384:		cg.time = cg.snap->serverTime;
ADDRGP4 cg+107604
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 385
;385:	}
LABELV $243
line 386
;386:	if ( cg.nextSnap != NULL && cg.nextSnap->serverTime <= cg.time ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $249
ADDRGP4 cg+40
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GTI4 $249
line 387
;387:		CG_Error( "CG_ProcessSnapshots: cg.nextSnap->serverTime <= cg.time" );
ADDRGP4 $254
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 388
;388:	}
LABELV $249
line 389
;389:}
LABELV $202
endproc CG_ProcessSnapshots 12 8
import trap_R_AddLinearLightToScene
import trap_R_AddRefEntityToScene2
import linearLight
import intShaderTime
import CG_NewParticleArea
import initparticles
import CG_ParticleExplosion
import CG_ParticleMisc
import CG_ParticleDust
import CG_ParticleSparks
import CG_ParticleBulletDebris
import CG_ParticleSnowFlurry
import CG_AddParticleShrapnel
import CG_ParticleSmoke
import CG_ParticleSnow
import CG_AddParticles
import CG_ClearParticles
import trap_GetEntityToken
import trap_getCameraInfo
import trap_startCamera
import trap_loadCamera
import trap_SnapVector
import trap_CIN_SetExtents
import trap_CIN_DrawCinematic
import trap_CIN_RunCinematic
import trap_CIN_StopCinematic
import trap_CIN_PlayCinematic
import trap_Key_GetKey
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_IsDown
import trap_R_RegisterFont
import trap_MemoryRemaining
import testPrintFloat
import testPrintInt
import trap_SetUserCmdValue
import trap_GetUserCmd
import trap_GetCurrentCmdNumber
import trap_GetServerCommand
import trap_GetSnapshot
import trap_GetCurrentSnapshotNumber
import trap_GetGameState
import trap_GetGlconfig
import trap_R_inPVS
import trap_R_RemapShader
import trap_R_LerpTag
import trap_R_ModelBounds
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_LightForPoint
import trap_R_AddAdditiveLightToScene
import trap_R_AddLightToScene
import trap_R_AddPolysToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterShader
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_R_LoadWorldMap
import trap_S_StopBackgroundTrack
import trap_S_StartBackgroundTrack
import trap_S_RegisterSound
import trap_S_Respatialize
import trap_S_UpdateEntityPosition
import trap_S_AddRealLoopingSound
import trap_S_AddLoopingSound
import trap_S_ClearLoopingSounds
import trap_S_StartLocalSound
import trap_S_StopLoopingSound
import trap_S_StartSound
import trap_CM_MarkFragments
import trap_CM_TransformedCapsuleTrace
import trap_CM_TransformedBoxTrace
import trap_CM_CapsuleTrace
import trap_CM_BoxTrace
import trap_CM_TransformedPointContents
import trap_CM_PointContents
import trap_CM_TempBoxModel
import trap_CM_InlineModel
import trap_CM_NumInlineModels
import trap_CM_LoadMap
import trap_UpdateScreen
import trap_SendClientCommand
import trap_RemoveCommand
import trap_AddCommand
import trap_RealTime
import trap_SendConsoleCommand
import trap_FS_Seek
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Cvar_VariableStringBuffer
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import CG_CheckChangedPredictableEvents
import CG_TransitionPlayerState
import CG_Respawn
import CG_ShaderStateChanged
import CG_SetConfigValues
import CG_ParseSysteminfo
import CG_ParseServerinfo
import CG_ExecuteNewServerCommands
import CG_InitConsoleCommands
import CG_ConsoleCommand
import CG_ScoreboardClick
import CG_DrawOldTourneyScoreboard
import CG_DrawOldScoreboard
import CG_DrawInformation
import CG_LoadingClient
import CG_LoadingItem
import CG_LoadingString
import CG_MakeExplosion
import CG_Bleed
import CG_BigExplode
import CG_GibPlayer
import CG_ScorePlum
import CG_LightningBoltBeam
import CG_InvulnerabilityJuiced
import CG_InvulnerabilityImpact
import CG_ObeliskPain
import CG_ObeliskExplode
import CG_KamikazeEffect
import CG_SpawnEffect
import CG_BubbleTrail
import CG_SmokePuff
import CG_AddLocalEntities
import CG_AllocLocalEntity
import CG_InitLocalEntities
import CG_ImpactMark
import CG_AddMarks
import CG_InitMarkPolys
import CG_OutOfAmmoChange
import CG_DrawWeaponSelect
import CG_AddPlayerWeapon
import CG_AddViewWeapon
import CG_GrappleTrail
import CG_RailTrail
import CG_Bullet
import CG_ShotgunFire
import CG_MissileHitPlayer
import CG_MissileHitWall
import CG_FireWeapon
import CG_RegisterItemVisuals
import CG_RegisterWeapon
import CG_Weapon_f
import CG_PrevWeapon_f
import CG_NextWeapon_f
import CG_PositionRotatedEntityOnTag
import CG_PositionEntityOnTag
import CG_AdjustPositionForMover
import CG_Beam
import CG_AddPacketEntities
import CG_SetEntitySoundPosition
import CG_PainEvent
import CG_EntityEvent
import CG_PlaceString
import CG_CheckEvents
import CG_PlayDroppedEvents
import CG_LoadDeferredPlayers
import CG_PredictPlayerState
import CG_Trace
import CG_PointContents
import CG_BuildSolidList
import CG_CustomSound
import CG_NewClientInfo
import CG_AddRefEntityWithPowerups
import CG_ResetPlayerEntity
import CG_Player
import CG_TrackClientTeamChange
import CG_ForceModelChange
import CG_StatusHandle
import CG_OtherTeamHasFlag
import CG_YourTeamHasFlag
import CG_GameTypeString
import CG_CheckOrderPending
import CG_Text_PaintChar
import CG_Draw3DModel
import CG_GetKillerText
import CG_GetGameStatusText
import CG_GetTeamColor
import CG_InitTeamChat
import CG_SetPrintString
import CG_ShowResponseHead
import CG_RunMenuScript
import CG_OwnerDrawVisible
import CG_GetValue
import CG_SelectNextPlayer
import CG_SelectPrevPlayer
import CG_Text_Height
import CG_Text_Width
import CG_Text_Paint
import CG_OwnerDraw
import CG_DrawTeamBackground
import CG_DrawFlagModel
import CG_DrawActive
import CG_DrawHead
import CG_CenterPrint
import CG_AddLagometerSnapshotInfo
import CG_AddLagometerFrameInfo
import teamChat2
import teamChat1
import systemChat
import drawTeamOverlayModificationCount
import numSortedTeamPlayers
import sortedTeamPlayers
import CG_SelectFont
import CG_LoadFonts
import CG_DrawString
import CG_DrawTopBottom
import CG_DrawSides
import CG_DrawRect
import UI_DrawProportionalString
import CG_GetColorForHealth
import CG_ColorForHealth
import CG_TileClear
import CG_TeamColor
import CG_FadeColorTime
import CG_FadeColor
import CG_DrawStrlen
import CG_DrawStringExt
import CG_DrawPic
import CG_FillScreen
import CG_FillRect
import CG_AdjustFrom640
import CG_DrawActiveFrame
import CG_AddBufferedSound
import CG_ZoomUp_f
import CG_ZoomDown_f
import CG_TestModelPrevSkin_f
import CG_TestModelNextSkin_f
import CG_TestModelPrevFrame_f
import CG_TestModelNextFrame_f
import CG_TestGun_f
import CG_TestModel_f
import CG_SetScoreCatcher
import CG_BuildSpectatorString
import CG_MouseEvent
import CG_KeyEvent
import CG_LastAttacker
import CG_CrosshairPlayer
import CG_UpdateCvars
import CG_StartMusic
import CG_Error
import CG_Printf
import CG_Argv
import CG_ConfigString
import eventnames
import cg_followKiller
import cg_fovAdjust
import cg_deadBodyDarken
import cg_teamColors
import cg_teamModel
import cg_enemyColors
import cg_enemyModel
import cg_hitSounds
import cg_obeliskRespawnDelay
import cg_recordSPDemoName
import cg_recordSPDemo
import cg_singlePlayerActive
import cg_enableBreath
import cg_enableDust
import cg_singlePlayer
import cg_blueTeamName
import cg_redTeamName
import cg_trueLightning
import cg_oldPlasma
import cg_oldRocket
import cg_oldRail
import cg_noProjectileTrail
import cg_noTaunt
import cg_bigFont
import cg_smallFont
import cg_cameraMode
import cg_timescale
import cg_timescaleFadeSpeed
import cg_timescaleFadeEnd
import cg_cameraOrbitDelay
import cg_cameraOrbit
import cg_smoothClients
import cg_scorePlum
import cg_teamChatsOnly
import cg_drawFriend
import cg_deferPlayers
import cg_predictItems
import cg_blood
import cg_paused
import cg_buildScript
import cg_forceModel
import cg_stats
import cg_teamChatHeight
import cg_teamChatTime
import cg_drawSpeed
import cg_drawAttacker
import cg_lagometer
import cg_thirdPerson
import cg_thirdPersonAngle
import cg_thirdPersonRange
import cg_zoomFov
import cg_fov
import cg_simpleItems
import cg_ignore
import cg_autoswitch
import cg_tracerLength
import cg_tracerWidth
import cg_tracerChance
import cg_viewsize
import cg_drawGun
import cg_gun_z
import cg_gun_y
import cg_gun_x
import cg_gun_frame
import cg_brassTime
import cg_addMarks
import cg_footsteps
import cg_showmiss
import cg_noPlayerAnims
import cg_nopredict
import cg_errorDecay
import cg_railTrailRadius
import cg_railTrailTime
import cg_debugEvents
import cg_debugPosition
import cg_debugAnim
import cg_animSpeed
import cg_draw2D
import cg_drawStatus
import cg_crosshairHealth
import cg_crosshairSize
import cg_crosshairY
import cg_crosshairX
import cg_drawWeaponSelect
import cg_teamOverlayUserinfo
import cg_drawTeamOverlay
import cg_drawRewards
import cg_drawCrosshairNames
import cg_drawCrosshair
import cg_drawAmmoWarning
import cg_drawIcons
import cg_draw3dIcons
import cg_drawSnapshot
import cg_drawFPS
import cg_drawTimer
import cg_gibs
import cg_shadows
import cg_swingSpeed
import cg_bobroll
import cg_bobpitch
import cg_bobup
import cg_runroll
import cg_runpitch
import cg_centertime
import cg_markPolys
import cg_items
import cg_weapons
import cg_entities
import cg
import cgs
import BigEndian
import replace1
import Q_stradd
import Q_strcpy
import BG_StripColor
import BG_CleanName
import DecodedString
import EncodedString
import strtok
import Q_stristr
import BG_sprintf
import BG_PlayerTouchesItem
import BG_PlayerStateToEntityStateExtraPolate
import BG_PlayerStateToEntityState
import BG_TouchJumpPad
import BG_AddPredictableEventToPlayerstate
import BG_EvaluateTrajectoryDelta
import BG_EvaluateTrajectory
import BG_CanItemBeGrabbed
import BG_FindItemForHoldable
import BG_FindItemForPowerup
import BG_FindItemForWeapon
import BG_FindItem
import bg_numItems
import bg_itemlist
import Pmove
import PM_UpdateViewAngles
import gt
import Com_Printf
import Com_Error
import Info_NextPair
import Info_ValidateKeyValue
import Info_Validate
import Info_SetValueForKey_Big
import Info_SetValueForKey
import Info_ValueForKey
import va
import Q_CleanStr
import Q_PrintStrlen
import Q_strcat
import Q_strncpyz
import Q_strrchr
import Q_strupr
import Q_strlwr
import Q_stricmpn
import Q_strncmp
import Q_stricmp
import Q_isalpha
import Q_isupper
import Q_islower
import Q_isprint
import locase
import Com_sprintf
import Parse3DMatrix
import Parse2DMatrix
import Parse1DMatrix
import SkipRestOfLine
import SkipBracedSection
import COM_MatchToken
import Com_Split
import COM_ParseSep
import Com_InitSeparators
import SkipTillSeparators
import COM_ParseWarning
import COM_ParseError
import COM_Compress
import COM_ParseExt
import COM_Parse
import COM_GetCurrentParseLine
import COM_BeginParseSession
import COM_DefaultExtension
import COM_StripExtension
import COM_SkipPath
import Com_Clamp
import PerpendicularVector
import AngleVectors
import MatrixMultiply
import MakeNormalVectors
import RotateAroundDirection
import RotatePointAroundVector
import ProjectPointOnPlane
import PlaneFromPoints
import AngleDelta
import AngleNormalize180
import AngleNormalize360
import AnglesSubtract
import AngleSubtract
import LerpAngle
import AngleMod
import BoxOnPlaneSide
import SetPlaneSignbits
import AxisCopy
import AxisClear
import AnglesToAxis
import vectoangles
import Q_crandom
import Q_random
import Q_rand
import Q_acos
import Q_log2
import VectorRotate
import Vector4Scale
import VectorNormalize2
import VectorNormalize
import CrossProduct
import VectorInverse
import VectorNormalizeFast
import DistanceSquared
import Distance
import VectorLengthSquared
import VectorLength
import VectorCompare
import AddPointToBounds
import ClearBounds
import RadiusFromBounds
import NormalizeColor
import ColorBytes4
import ColorBytes3
import _VectorMA
import _VectorScale
import _VectorCopy
import _VectorAdd
import _VectorSubtract
import _DotProduct
import ByteToDir
import DirToByte
import ClampShort
import ClampChar
import Q_rsqrt
import Q_fabs
import axisDefault
import vec3_origin
import g_color_table
import colorDkGrey
import colorMdGrey
import colorLtGrey
import colorWhite
import colorCyan
import colorMagenta
import colorYellow
import colorBlue
import colorGreen
import colorRed
import colorBlack
import bytedirs
import Hunk_Alloc
import acos
import fabs
import abs
import tan
import atan2
import cos
import sin
import sqrt
import floor
import ceil
import memcpy
import memset
import memmove
import Q_sscanf
import ED_vsprintf
import atoi
import atof
import toupper
import tolower
import strncpy
import strstr
import strchr
import strcmp
import strcpy
import strcat
import strlen
import rand
import srand
import qsort
lit
align 1
LABELV $254
byte 1 67
byte 1 71
byte 1 95
byte 1 80
byte 1 114
byte 1 111
byte 1 99
byte 1 101
byte 1 115
byte 1 115
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 115
byte 1 58
byte 1 32
byte 1 99
byte 1 103
byte 1 46
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 45
byte 1 62
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 60
byte 1 61
byte 1 32
byte 1 99
byte 1 103
byte 1 46
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $242
byte 1 67
byte 1 71
byte 1 95
byte 1 80
byte 1 114
byte 1 111
byte 1 99
byte 1 101
byte 1 115
byte 1 115
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 115
byte 1 58
byte 1 32
byte 1 99
byte 1 103
byte 1 46
byte 1 115
byte 1 110
byte 1 97
byte 1 112
byte 1 32
byte 1 61
byte 1 61
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 0
align 1
LABELV $232
byte 1 67
byte 1 71
byte 1 95
byte 1 80
byte 1 114
byte 1 111
byte 1 99
byte 1 101
byte 1 115
byte 1 115
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 115
byte 1 58
byte 1 32
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 119
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $210
byte 1 67
byte 1 71
byte 1 95
byte 1 80
byte 1 114
byte 1 111
byte 1 99
byte 1 101
byte 1 115
byte 1 115
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 115
byte 1 58
byte 1 32
byte 1 110
byte 1 32
byte 1 60
byte 1 32
byte 1 99
byte 1 103
byte 1 46
byte 1 108
byte 1 97
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 78
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $176
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 67
byte 1 71
byte 1 95
byte 1 82
byte 1 101
byte 1 97
byte 1 100
byte 1 78
byte 1 101
byte 1 120
byte 1 116
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 58
byte 1 32
byte 1 119
byte 1 97
byte 1 121
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 44
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 62
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $99
byte 1 67
byte 1 71
byte 1 95
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 58
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 99
byte 1 103
byte 1 46
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $95
byte 1 67
byte 1 71
byte 1 95
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 58
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 99
byte 1 103
byte 1 46
byte 1 115
byte 1 110
byte 1 97
byte 1 112
byte 1 0
