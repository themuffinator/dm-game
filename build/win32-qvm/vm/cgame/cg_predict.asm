export CG_BuildSolidList
code
proc CG_BuildSolidList 24 0
file "..\..\..\..\code\cgame\cg_predict.c"
line 26
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_predict.c -- this file generates cg.predictedPlayerState by either
;4:// interpolating between snapshots from the server or locally predicting
;5:// ahead the client's movement.
;6:// It also handles local physics interaction, like fragments bouncing off walls
;7:
;8:#include "cg_local.h"
;9:
;10:static	pmove_t		cg_pmove;
;11:
;12:static	int			cg_numSolidEntities;
;13:static	centity_t	*cg_solidEntities[MAX_ENTITIES_IN_SNAPSHOT];
;14:static	int			cg_numTriggerEntities;
;15:static	centity_t	*cg_triggerEntities[MAX_ENTITIES_IN_SNAPSHOT];
;16:
;17:/*
;18:====================
;19:CG_BuildSolidList
;20:
;21:When a new cg.snap has been set, this function builds a sublist
;22:of the entities that are actually solid, to make for more
;23:efficient collision detection
;24:====================
;25:*/
;26:void CG_BuildSolidList( void ) {
line 32
;27:	int			i;
;28:	centity_t	*cent;
;29:	snapshot_t	*snap;
;30:	entityState_t	*ent;
;31:
;32:	cg_numSolidEntities = 0;
ADDRGP4 cg_numSolidEntities
CNSTI4 0
ASGNI4
line 33
;33:	cg_numTriggerEntities = 0;
ADDRGP4 cg_numTriggerEntities
CNSTI4 0
ASGNI4
line 35
;34:
;35:	if ( cg.nextSnap && !cg.nextFrameTeleport && !cg.thisFrameTeleport ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $74
ADDRGP4 cg+107596
INDIRI4
CNSTI4 0
NEI4 $74
ADDRGP4 cg+107592
INDIRI4
CNSTI4 0
NEI4 $74
line 36
;36:		snap = cg.nextSnap;
ADDRLP4 12
ADDRGP4 cg+40
INDIRP4
ASGNP4
line 37
;37:	} else {
ADDRGP4 $75
JUMPV
LABELV $74
line 38
;38:		snap = cg.snap;
ADDRLP4 12
ADDRGP4 cg+36
INDIRP4
ASGNP4
line 39
;39:	}
LABELV $75
line 41
;40:
;41:	for ( i = 0 ; i < snap->numEntities ; i++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $84
JUMPV
LABELV $81
line 42
;42:		cent = &cg_entities[ snap->entities[ i ].number ];
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 208
MULI4
ADDRLP4 12
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
line 43
;43:		ent = &cent->currentState;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 45
;44:
;45:		if ( ent->eType == ET_ITEM || ent->eType == ET_PUSH_TRIGGER || ent->eType == ET_TELEPORT_TRIGGER ) {
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $88
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 8
EQI4 $88
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 9
NEI4 $85
LABELV $88
line 46
;46:			cg_triggerEntities[cg_numTriggerEntities] = cent;
ADDRGP4 cg_numTriggerEntities
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_triggerEntities
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 47
;47:			cg_numTriggerEntities++;
ADDRLP4 20
ADDRGP4 cg_numTriggerEntities
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 48
;48:			continue;
ADDRGP4 $82
JUMPV
LABELV $85
line 51
;49:		}
;50:
;51:		if ( cent->nextState.solid ) {
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 0
EQI4 $89
line 52
;52:			cg_solidEntities[cg_numSolidEntities] = cent;
ADDRGP4 cg_numSolidEntities
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_solidEntities
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 53
;53:			cg_numSolidEntities++;
ADDRLP4 20
ADDRGP4 cg_numSolidEntities
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 54
;54:			continue;
LABELV $89
line 56
;55:		}
;56:	}
LABELV $82
line 41
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $84
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
LTI4 $81
line 57
;57:}
LABELV $73
endproc CG_BuildSolidList 24 0
proc CG_ClipMoveToEntities 144 36
line 67
;58:
;59:
;60:/*
;61:====================
;62:CG_ClipMoveToEntities
;63:
;64:====================
;65:*/
;66:static void CG_ClipMoveToEntities ( const vec3_t start, const vec3_t mins, const vec3_t maxs, const vec3_t end,
;67:							int skipNumber, int mask, trace_t *tr ) {
line 76
;68:	int			i, x, zd, zu;
;69:	trace_t		trace;
;70:	entityState_t	*ent;
;71:	clipHandle_t 	cmodel;
;72:	vec3_t		bmins, bmaxs;
;73:	vec3_t		origin, angles;
;74:	centity_t	*cent;
;75:
;76:	for ( i = 0 ; i < cg_numSolidEntities ; i++ ) {
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRGP4 $95
JUMPV
LABELV $92
line 77
;77:		cent = cg_solidEntities[ i ];
ADDRLP4 60
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_solidEntities
ADDP4
INDIRP4
ASGNP4
line 78
;78:		ent = &cent->currentState;
ADDRLP4 0
ADDRLP4 60
INDIRP4
ASGNP4
line 80
;79:
;80:		if ( ent->number == skipNumber ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 16
INDIRI4
NEI4 $96
line 81
;81:			continue;
ADDRGP4 $93
JUMPV
LABELV $96
line 84
;82:		}
;83:
;84:		if ( ent->solid == SOLID_BMODEL ) {
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16777215
NEI4 $98
line 86
;85:			// special value for bmodel
;86:			cmodel = trap_CM_InlineModel( ent->modelindex );
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 132
ADDRGP4 trap_CM_InlineModel
CALLI4
ASGNI4
ADDRLP4 68
ADDRLP4 132
INDIRI4
ASGNI4
line 87
;87:			VectorCopy( cent->lerpAngles, angles );
ADDRLP4 108
ADDRLP4 60
INDIRP4
CNSTI4 728
ADDP4
INDIRB
ASGNB 12
line 88
;88:			BG_EvaluateTrajectory( &cent->currentState.pos, cg.physicsTime, origin );
ADDRLP4 60
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+107612
INDIRI4
ARGI4
ADDRLP4 96
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 89
;89:		} else {
ADDRGP4 $99
JUMPV
LABELV $98
line 91
;90:			// encoded bbox
;91:			x = (ent->solid & 255);
ADDRLP4 120
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 255
BANDI4
ASGNI4
line 92
;92:			zd = ((ent->solid>>8) & 255);
ADDRLP4 124
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 8
RSHI4
CNSTI4 255
BANDI4
ASGNI4
line 93
;93:			zu = ((ent->solid>>16) & 255) - 32;
ADDRLP4 128
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16
RSHI4
CNSTI4 255
BANDI4
CNSTI4 32
SUBI4
ASGNI4
line 95
;94:
;95:			bmins[0] = bmins[1] = -x;
ADDRLP4 132
ADDRLP4 120
INDIRI4
NEGI4
CVIF4 4
ASGNF4
ADDRLP4 72+4
ADDRLP4 132
INDIRF4
ASGNF4
ADDRLP4 72
ADDRLP4 132
INDIRF4
ASGNF4
line 96
;96:			bmaxs[0] = bmaxs[1] = x;
ADDRLP4 136
ADDRLP4 120
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 84+4
ADDRLP4 136
INDIRF4
ASGNF4
ADDRLP4 84
ADDRLP4 136
INDIRF4
ASGNF4
line 97
;97:			bmins[2] = -zd;
ADDRLP4 72+8
ADDRLP4 124
INDIRI4
NEGI4
CVIF4 4
ASGNF4
line 98
;98:			bmaxs[2] = zu;
ADDRLP4 84+8
ADDRLP4 128
INDIRI4
CVIF4 4
ASGNF4
line 100
;99:
;100:			cmodel = trap_CM_TempBoxModel( bmins, bmaxs );
ADDRLP4 72
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 140
ADDRGP4 trap_CM_TempBoxModel
CALLI4
ASGNI4
ADDRLP4 68
ADDRLP4 140
INDIRI4
ASGNI4
line 101
;101:			VectorCopy( vec3_origin, angles );
ADDRLP4 108
ADDRGP4 vec3_origin
INDIRB
ASGNB 12
line 102
;102:			VectorCopy( cent->lerpOrigin, origin );
ADDRLP4 96
ADDRLP4 60
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 103
;103:		}
LABELV $99
line 106
;104:
;105:
;106:		trap_CM_TransformedBoxTrace ( &trace, start, end,
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 68
INDIRI4
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRLP4 96
ARGP4
ADDRLP4 108
ARGP4
ADDRGP4 trap_CM_TransformedBoxTrace
CALLV
pop
line 109
;107:			mins, maxs, cmodel,  mask, origin, angles);
;108:
;109:		if (trace.allsolid || trace.fraction < tr->fraction) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $108
ADDRLP4 4+8
INDIRF4
ADDRFP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
GEF4 $105
LABELV $108
line 110
;110:			trace.entityNum = ent->number;
ADDRLP4 4+52
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 111
;111:			*tr = trace;
ADDRFP4 24
INDIRP4
ADDRLP4 4
INDIRB
ASGNB 56
line 112
;112:		} else if (trace.startsolid) {
ADDRGP4 $106
JUMPV
LABELV $105
ADDRLP4 4+4
INDIRI4
CNSTI4 0
EQI4 $110
line 113
;113:			tr->startsolid = qtrue;
ADDRFP4 24
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 1
ASGNI4
line 114
;114:		}
LABELV $110
LABELV $106
line 115
;115:		if ( tr->allsolid ) {
ADDRFP4 24
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $113
line 116
;116:			return;
ADDRGP4 $91
JUMPV
LABELV $113
line 118
;117:		}
;118:	}
LABELV $93
line 76
ADDRLP4 64
ADDRLP4 64
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $95
ADDRLP4 64
INDIRI4
ADDRGP4 cg_numSolidEntities
INDIRI4
LTI4 $92
line 119
;119:}
LABELV $91
endproc CG_ClipMoveToEntities 144 36
export CG_Trace
proc CG_Trace 56 28
line 128
;120:
;121:
;122:/*
;123:================
;124:CG_Trace
;125:================
;126:*/
;127:void	CG_Trace( trace_t *result, const vec3_t start, const vec3_t mins, const vec3_t maxs, const vec3_t end, 
;128:					 int skipNumber, int mask ) {
line 131
;129:	trace_t	t;
;130:
;131:	trap_CM_BoxTrace ( &t, start, end, mins, maxs, 0, mask);
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRGP4 trap_CM_BoxTrace
CALLV
pop
line 132
;132:	if ( t.fraction == 1.0 )
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $116
line 133
;133:		t.entityNum = ENTITYNUM_NONE;
ADDRLP4 0+52
CNSTI4 1023
ASGNI4
ADDRGP4 $117
JUMPV
LABELV $116
line 135
;134:	else
;135:		t.entityNum = ENTITYNUM_WORLD;
ADDRLP4 0+52
CNSTI4 1022
ASGNI4
LABELV $117
line 138
;136:
;137:	// check all other solid models
;138:	CG_ClipMoveToEntities (start, mins, maxs, end, skipNumber, mask, &t);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 CG_ClipMoveToEntities
CALLV
pop
line 140
;139:
;140:	*result = t;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRB
ASGNB 56
line 141
;141:}
LABELV $115
endproc CG_Trace 56 28
export CG_PointContents
proc CG_PointContents 36 16
line 149
;142:
;143:
;144:/*
;145:================
;146:CG_PointContents
;147:================
;148:*/
;149:int		CG_PointContents( const vec3_t point, int passEntityNum ) {
line 156
;150:	int			i;
;151:	entityState_t	*ent;
;152:	centity_t	*cent;
;153:	clipHandle_t cmodel;
;154:	int			contents;
;155:
;156:	contents = trap_CM_PointContents (point, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20
ADDRGP4 trap_CM_PointContents
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 20
INDIRI4
ASGNI4
line 158
;157:
;158:	for ( i = 0 ; i < cg_numSolidEntities ; i++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $125
JUMPV
LABELV $122
line 159
;159:		cent = cg_solidEntities[ i ];
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_solidEntities
ADDP4
INDIRP4
ASGNP4
line 161
;160:
;161:		ent = &cent->currentState;
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 163
;162:
;163:		if ( ent->number == passEntityNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $126
line 164
;164:			continue;
ADDRGP4 $123
JUMPV
LABELV $126
line 167
;165:		}
;166:
;167:		if (ent->solid != SOLID_BMODEL) { // special value for bmodel
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16777215
EQI4 $128
line 168
;168:			continue;
ADDRGP4 $123
JUMPV
LABELV $128
line 171
;169:		}
;170:
;171:		cmodel = trap_CM_InlineModel( ent->modelindex );
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 trap_CM_InlineModel
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 24
INDIRI4
ASGNI4
line 172
;172:		if ( !cmodel ) {
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $130
line 173
;173:			continue;
ADDRGP4 $123
JUMPV
LABELV $130
line 176
;174:		}
;175:
;176:		contents |= trap_CM_TransformedPointContents( point, cmodel, cent->lerpOrigin, cent->lerpAngles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 728
ADDP4
ARGP4
ADDRLP4 32
ADDRGP4 trap_CM_TransformedPointContents
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 32
INDIRI4
BORI4
ASGNI4
line 177
;177:	}
LABELV $123
line 158
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $125
ADDRLP4 8
INDIRI4
ADDRGP4 cg_numSolidEntities
INDIRI4
LTI4 $122
line 179
;178:
;179:	return contents;
ADDRLP4 16
INDIRI4
RETI4
LABELV $121
endproc CG_PointContents 36 16
proc CG_InterpolatePlayerState 52 12
line 191
;180:}
;181:
;182:
;183:/*
;184:========================
;185:CG_InterpolatePlayerState
;186:
;187:Generates cg.predictedPlayerState by interpolating between
;188:cg.snap->player_state and cg.nextFrame->player_state
;189:========================
;190:*/
;191:static void CG_InterpolatePlayerState( qboolean grabAngles ) {
line 197
;192:	float			f;
;193:	int				i;
;194:	playerState_t	*out;
;195:	snapshot_t		*prev, *next;
;196:
;197:	out = &cg.predictedPlayerState;
ADDRLP4 12
ADDRGP4 cg+107636
ASGNP4
line 198
;198:	prev = cg.snap;
ADDRLP4 4
ADDRGP4 cg+36
INDIRP4
ASGNP4
line 199
;199:	next = cg.nextSnap;
ADDRLP4 8
ADDRGP4 cg+40
INDIRP4
ASGNP4
line 201
;200:
;201:	*out = cg.snap->ps;
ADDRLP4 12
INDIRP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
INDIRB
ASGNB 468
line 204
;202:
;203:	// if we are still allowing local input, short circuit the view angles
;204:	if ( grabAngles ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $137
line 208
;205:		usercmd_t	cmd;
;206:		int			cmdNum;
;207:
;208:		cmdNum = trap_GetCurrentCmdNumber();
ADDRLP4 48
ADDRGP4 trap_GetCurrentCmdNumber
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 48
INDIRI4
ASGNI4
line 209
;209:		trap_GetUserCmd( cmdNum, &cmd );
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 20
ARGP4
ADDRGP4 trap_GetUserCmd
CALLI4
pop
line 211
;210:
;211:		PM_UpdateViewAngles( out, &cmd );
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 PM_UpdateViewAngles
CALLV
pop
line 212
;212:	}
LABELV $137
line 215
;213:
;214:	// if the next frame is a teleport, we can't lerp to it
;215:	if ( cg.nextFrameTeleport ) {
ADDRGP4 cg+107596
INDIRI4
CNSTI4 0
EQI4 $139
line 216
;216:		return;
ADDRGP4 $132
JUMPV
LABELV $139
line 219
;217:	}
;218:
;219:	if ( !next || next->serverTime <= prev->serverTime ) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $144
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
GTI4 $142
LABELV $144
line 220
;220:		return;
ADDRGP4 $132
JUMPV
LABELV $142
line 223
;221:	}
;222:
;223:	f = (float)( cg.time - prev->serverTime ) / ( next->serverTime - prev->serverTime );
ADDRLP4 16
ADDRGP4 cg+107604
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
SUBI4
CVIF4 4
DIVF4
ASGNF4
line 225
;224:
;225:	i = next->ps.bobCycle;
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ASGNI4
line 226
;226:	if ( i < prev->ps.bobCycle ) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
GEI4 $146
line 227
;227:		i += 256;		// handle wraparound
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 256
ADDI4
ASGNI4
line 228
;228:	}
LABELV $146
line 229
;229:	out->bobCycle = prev->ps.bobCycle + f * ( i - prev->ps.bobCycle );
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 16
INDIRF4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
SUBI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 231
;230:
;231:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $148
line 232
;232:		out->origin[i] = prev->ps.origin[i] + f * (next->ps.origin[i] - prev->ps.origin[i] );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 20
ADDP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 64
ADDP4
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 64
ADDP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 64
ADDP4
ADDP4
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 233
;233:		if ( !grabAngles ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $152
line 234
;234:			out->viewangles[i] = LerpAngle( 
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 196
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 44
ADDRGP4 LerpAngle
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 152
ADDP4
ADDP4
ADDRLP4 44
INDIRF4
ASGNF4
line 236
;235:				prev->ps.viewangles[i], next->ps.viewangles[i], f );
;236:		}
LABELV $152
line 237
;237:		out->velocity[i] = prev->ps.velocity[i] + 
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 32
ADDP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 76
ADDP4
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 76
ADDP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 76
ADDP4
ADDP4
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 239
;238:			f * (next->ps.velocity[i] - prev->ps.velocity[i] );
;239:	}
LABELV $149
line 231
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $148
line 241
;240:
;241:}
LABELV $132
endproc CG_InterpolatePlayerState 52 12
export CG_StoreEvent
proc CG_StoreEvent 4 4
line 258
;242:
;243:int				eventStack;
;244:entity_event_t	events[ MAX_PREDICTED_EVENTS ];
;245:int				eventParms[ MAX_PREDICTED_EVENTS ];
;246:int				eventParm2[ MAX_PREDICTED_EVENTS ]; // client entity index
;247:
;248:void CG_AddFallDamage( int damage );
;249:
;250:/*
;251:===================
;252:CG_StoreEvents
;253:
;254:Save events that may be dropped during prediction
;255:===================
;256:*/
;257:void CG_StoreEvent( entity_event_t evt, int eventParm, int entityNum ) 
;258:{
line 259
;259:	if ( eventStack >= MAX_PREDICTED_EVENTS )
ADDRGP4 eventStack
INDIRI4
CNSTI4 16
LTI4 $155
line 260
;260:		return;
ADDRGP4 $154
JUMPV
LABELV $155
line 262
;261:
;262:	if ( evt == EV_FALL_FAR ) {
ADDRFP4 0
INDIRI4
CNSTI4 12
NEI4 $157
line 263
;263:		CG_AddFallDamage( 10 );
CNSTI4 10
ARGI4
ADDRGP4 CG_AddFallDamage
CALLV
pop
line 264
;264:	} else if ( evt == EV_FALL_MEDIUM ) {
ADDRGP4 $158
JUMPV
LABELV $157
ADDRFP4 0
INDIRI4
CNSTI4 11
NEI4 $159
line 265
;265:		CG_AddFallDamage( 5 );
CNSTI4 5
ARGI4
ADDRGP4 CG_AddFallDamage
CALLV
pop
line 266
;266:	}
LABELV $159
LABELV $158
line 268
;267:
;268:	events[ eventStack ] = evt;
ADDRGP4 eventStack
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 events
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 269
;269:	eventParms[ eventStack ] = eventParm;
ADDRGP4 eventStack
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 eventParms
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 270
;270:	eventParm2[ eventStack ] = entityNum;
ADDRGP4 eventStack
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 eventParm2
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 271
;271:	eventStack++;
ADDRLP4 0
ADDRGP4 eventStack
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 272
;272:}
LABELV $154
endproc CG_StoreEvent 4 4
export CG_PlayDroppedEvents
proc CG_PlayDroppedEvents 24 12
line 280
;273:
;274:
;275:/*
;276:===================
;277:CG_PlayDroppedEvents
;278:===================
;279:*/
;280:void CG_PlayDroppedEvents( playerState_t *ps, playerState_t *ops ) {
line 285
;281:	centity_t	*cent;
;282:	entity_event_t oldEvent;
;283:	int i, oldParam;
;284:
;285:	if ( ps == ops ) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
NEU4 $162
line 286
;286:		return;
ADDRGP4 $161
JUMPV
LABELV $162
line 289
;287:	}
;288:
;289:	if ( eventStack <= MAX_PS_EVENTS ) {
ADDRGP4 eventStack
INDIRI4
CNSTI4 2
GTI4 $164
line 290
;290:		return;
ADDRGP4 $161
JUMPV
LABELV $164
line 293
;291:	}
;292:
;293:	cent = &cg.predictedPlayerEntity;
ADDRLP4 4
ADDRGP4 cg+108104
ASGNP4
line 295
;294:
;295:	oldEvent = cent->currentState.event;
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ASGNI4
line 296
;296:	oldParam = cent->currentState.eventParm;
ADDRLP4 12
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 298
;297:
;298:	for ( i = 0; i < eventStack - MAX_PS_EVENTS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $170
JUMPV
LABELV $167
line 299
;299:		cent->currentState.event = events[ i ];
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 events
ADDP4
INDIRI4
ASGNI4
line 300
;300:		cent->currentState.eventParm = eventParms[ i ];
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 eventParms
ADDP4
INDIRI4
ASGNI4
line 301
;301:		if ( cg_showmiss.integer ) 
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $171
line 302
;302:		{
line 303
;303:			CG_Printf( "Playing dropped event: %s %i", eventnames[ events[ i ] ], eventParms[ i ] );
ADDRGP4 $174
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 events
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 eventnames
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 eventParms
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 304
;304:		}
LABELV $171
line 305
;305:		CG_EntityEvent( cent, cent->lerpOrigin, eventParm2[ i ] );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 eventParm2
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_EntityEvent
CALLV
pop
line 306
;306:		cg.eventSequence++;
ADDRLP4 20
ADDRGP4 cg+108864
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 307
;307:	}
LABELV $168
line 298
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $170
ADDRLP4 0
INDIRI4
ADDRGP4 eventStack
INDIRI4
CNSTI4 2
SUBI4
LTI4 $167
line 309
;308:
;309:	cent->currentState.event = oldEvent;
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 310
;310:	cent->currentState.eventParm = oldParam;
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 311
;311:}
LABELV $161
endproc CG_PlayDroppedEvents 24 12
proc CG_AddArmor 4 0
line 314
;312:
;313:
;314:static void CG_AddArmor( const gitem_t *item, int quantity ) {
line 316
;315:
;316:	cg.predictedPlayerState.stats[STAT_ARMOR] += quantity;
ADDRLP4 0
ADDRGP4 cg+107636+184+16
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 318
;317:
;318:		if ( cg.predictedPlayerState.stats[STAT_ARMOR] > cg.predictedPlayerState.stats[STAT_MAX_HEALTH]*2 )
ADDRGP4 cg+107636+184+16
INDIRI4
ADDRGP4 cg+107636+184+28
INDIRI4
CNSTI4 1
LSHI4
LEI4 $180
line 319
;319:			cg.predictedPlayerState.stats[STAT_ARMOR] = cg.predictedPlayerState.stats[STAT_MAX_HEALTH]*2;
ADDRGP4 cg+107636+184+16
ADDRGP4 cg+107636+184+28
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
LABELV $180
line 320
;320:}
LABELV $176
endproc CG_AddArmor 4 0
proc CG_AddAmmo 12 0
line 324
;321:
;322:
;323:static void CG_AddAmmo( int weapon, int count )
;324:{
line 325
;325:	if ( weapon == WP_GAUNTLET || weapon == WP_GRAPPLING_HOOK ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $197
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $195
LABELV $197
line 326
;326:		cg.predictedPlayerState.ammo[weapon] = -1;
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+107636+376
ADDP4
CNSTI4 -1
ASGNI4
line 327
;327:	} else {
ADDRGP4 $196
JUMPV
LABELV $195
line 328
;328:		cg.predictedPlayerState.ammo[weapon] += count;
ADDRLP4 4
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+107636+376
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 329
;329:		if ( weapon >= WP_MACHINEGUN && weapon <= WP_BFG ) {
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 2
LTI4 $202
ADDRLP4 8
INDIRI4
CNSTI4 9
GTI4 $202
line 330
;330:			if ( cg.predictedPlayerState.ammo[weapon] > AMMO_HARD_LIMIT ) {
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+107636+376
ADDP4
INDIRI4
CNSTI4 200
LEI4 $204
line 331
;331:				cg.predictedPlayerState.ammo[weapon] = AMMO_HARD_LIMIT;
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+107636+376
ADDP4
CNSTI4 200
ASGNI4
line 332
;332:			}
LABELV $204
line 333
;333:		}
LABELV $202
line 334
;334:	}
LABELV $196
line 335
;335:}
LABELV $194
endproc CG_AddAmmo 12 0
proc CG_AddWeapon 4 8
line 339
;336:
;337:
;338:static void CG_AddWeapon( int weapon, int quantity, qboolean dropped ) 
;339:{
line 345
;340:	//int	ammo;
;341:	
;342:	//ammo = quantity;
;343:
;344:	// dropped items and teamplay weapons always have full ammo
;345:	if ( !dropped && cgs.gametype != GT_TDM ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $211
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
EQI4 $211
line 346
;346:		if ( cg.predictedPlayerState.ammo[ weapon ] < quantity ) {
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+107636+376
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
GEI4 $214
line 347
;347:			quantity = quantity - cg.predictedPlayerState.ammo[ weapon ];
ADDRFP4 4
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+107636+376
ADDP4
INDIRI4
SUBI4
ASGNI4
line 348
;348:		} else {
ADDRGP4 $215
JUMPV
LABELV $214
line 349
;349:			quantity = 1;
ADDRFP4 4
CNSTI4 1
ASGNI4
line 350
;350:		}
LABELV $215
line 351
;351:	}
LABELV $211
line 354
;352:
;353:	// add the weapon
;354:	cg.predictedPlayerState.stats[STAT_WEAPONS] |= ( 1 << weapon );
ADDRLP4 0
ADDRGP4 cg+107636+184+12
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 0
INDIRI4
LSHI4
BORI4
ASGNI4
line 356
;355:
;356:	CG_AddAmmo( weapon, quantity );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 CG_AddAmmo
CALLV
pop
line 357
;357:}
LABELV $210
endproc CG_AddWeapon 4 8
proc CG_CheckArmor 16 4
line 360
;358:
;359:
;360:static int CG_CheckArmor( int damage ) {
line 364
;361:	int				save;
;362:	int				count;
;363:
;364:	count = cg.predictedPlayerState.stats[STAT_ARMOR];
ADDRLP4 4
ADDRGP4 cg+107636+184+16
INDIRI4
ASGNI4
line 366
;365:
;366:	save = ceil( damage * ARMOR_PROTECTION );
ADDRFP4 0
INDIRI4
CVIF4 4
CNSTF4 1059648963
MULF4
ARGF4
ADDRLP4 8
ADDRGP4 ceil
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 368
;367:
;368:	if (save >= count)
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $227
line 369
;369:		save = count;
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
LABELV $227
line 371
;370:
;371:	if ( !save )
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $229
line 372
;372:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $223
JUMPV
LABELV $229
line 374
;373:	
;374:	cg.predictedPlayerState.stats[STAT_ARMOR] -= save;
ADDRLP4 12
ADDRGP4 cg+107636+184+16
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ASGNI4
line 376
;375:
;376:	return save;
ADDRLP4 0
INDIRI4
RETI4
LABELV $223
endproc CG_CheckArmor 16 4
export CG_AddFallDamage
proc CG_AddFallDamage 16 4
line 381
;377:}
;378:
;379:
;380: void CG_AddFallDamage( int damage ) 
;381:{
line 384
;382:	int take, asave;
;383:
;384:	if ( cg.predictedPlayerState.powerups[ PW_BATTLESUIT ] )
ADDRGP4 cg+107636+312+8
INDIRI4
CNSTI4 0
EQI4 $235
line 385
;385:		return;
ADDRGP4 $234
JUMPV
LABELV $235
line 387
;386:
;387:	if ( cg.predictedPlayerState.clientNum != cg.snap->ps.clientNum || cg.snap->ps.pm_flags & PMF_FOLLOW ) {
ADDRGP4 cg+107636+140
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $246
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $240
LABELV $246
line 388
;388:		return;
ADDRGP4 $234
JUMPV
LABELV $240
line 391
;389:	}
;390:
;391:	take = damage;
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
line 393
;392:
;393:	asave = CG_CheckArmor( take );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 CG_CheckArmor
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 395
;394:
;395:	take -= asave;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 397
;396:
;397:	cg.predictedPlayerState.stats[STAT_HEALTH] -= take;
ADDRLP4 12
ADDRGP4 cg+107636+184
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ASGNI4
line 404
;398:
;399:#if 0
;400:	CG_Printf( "take: %i asave:%i health:%i armor:%i\n", take, asave, 
;401:		cg.predictedPlayerState.stats[STAT_HEALTH], cg.predictedPlayerState.stats[STAT_ARMOR] );
;402:#endif
;403:
;404:	cg.predictedPlayerState.damagePitch = 255;
ADDRGP4 cg+107636+176
CNSTI4 255
ASGNI4
line 405
;405:	cg.predictedPlayerState.damageYaw = 255;
ADDRGP4 cg+107636+172
CNSTI4 255
ASGNI4
line 407
;406:	//cg.predictedPlayerState.damageEvent++;
;407:	cg.predictedPlayerState.damageCount = take + asave;
ADDRGP4 cg+107636+180
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 408
;408:}
LABELV $234
endproc CG_AddFallDamage 16 4
proc CG_PickupPrediction 16 12
line 411
;409: 
;410:
;411:static void CG_PickupPrediction( centity_t *cent, const gitem_t *item ) {
line 414
;412:
;413:	// health prediction
;414:	if ( item->giType == IT_HEALTH && cent->currentState.time2 > 0 ) {
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 3
NEI4 $256
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 0
LEI4 $256
line 417
;415:		int limit;
;416:
;417:		limit = cg.predictedPlayerState.stats[ STAT_MAX_HEALTH ]; // soft limit
ADDRLP4 0
ADDRGP4 cg+107636+184+28
INDIRI4
ASGNI4
line 418
;418:		if ( !Q_stricmp( item->classname, "item_health_small" ) || !Q_stricmp( item->classname, "item_health_mega" ) ) {
ADDRFP4 4
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $263
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $265
ADDRFP4 4
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $264
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $261
LABELV $265
line 419
;419:			limit *= 2; // hard limit
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 420
;420:		}
LABELV $261
line 422
;421:
;422:		cg.predictedPlayerState.stats[STAT_HEALTH] += cent->currentState.time2;
ADDRLP4 12
ADDRGP4 cg+107636+184
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ADDI4
ASGNI4
line 423
;423:		if ( cg.predictedPlayerState.stats[ STAT_HEALTH ] > limit ) {
ADDRGP4 cg+107636+184
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $268
line 424
;424:			cg.predictedPlayerState.stats[ STAT_HEALTH ] = limit;
ADDRGP4 cg+107636+184
ADDRLP4 0
INDIRI4
ASGNI4
line 425
;425:		}
LABELV $268
line 426
;426:	}
LABELV $256
line 429
;427:
;428:	// armor prediction
;429:	if ( item->giType == IT_ARMOR && cent->currentState.time2 > 0 ) {
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 2
NEI4 $274
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 0
LEI4 $274
line 430
;430:		CG_AddArmor( item, cent->currentState.time2 );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_AddArmor
CALLV
pop
line 431
;431:		return;
ADDRGP4 $255
JUMPV
LABELV $274
line 435
;432:	}
;433:
;434:	// ammo prediction
;435:	if ( item->giType == IT_AMMO && cent->currentState.time2 > 0 ) {
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $276
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 0
LEI4 $276
line 436
;436:		CG_AddAmmo( item->giTag, cent->currentState.time2 );
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_AddAmmo
CALLV
pop
line 437
;437:		return;
ADDRGP4 $255
JUMPV
LABELV $276
line 441
;438:	}
;439:
;440:	// weapon prediction
;441:	if ( item->giType == IT_WEAPON && cent->currentState.time2 > 0 ) {
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 10
NEI4 $278
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 0
LEI4 $278
line 442
;442:		CG_AddWeapon( item->giTag, cent->currentState.time2, (cent->currentState.modelindex2 == 1) );
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 1
NEI4 $281
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $282
JUMPV
LABELV $281
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $282
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_AddWeapon
CALLV
pop
line 443
;443:		return;
ADDRGP4 $255
JUMPV
LABELV $278
line 447
;444:	}
;445:
;446:	// powerups prediction
;447:	if ( item->giType == IT_POWERUP && item->giTag >= PW_QUAD && item->giTag <= PW_FLIGHT ) {
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 7
NEI4 $283
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 1
LTI4 $283
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 6
GTI4 $283
line 449
;448:		// round timing to seconds to make multiple powerup timers count in sync
;449:		if ( !cg.predictedPlayerState.powerups[ item->giTag ] ) {
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+107636+312
ADDP4
INDIRI4
CNSTI4 0
NEI4 $285
line 450
;450:			cg.predictedPlayerState.powerups[ item->giTag ] = cg.predictedPlayerState.commandTime - ( cg.predictedPlayerState.commandTime % 1000 );
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+107636+312
ADDP4
ADDRGP4 cg+107636
INDIRI4
ADDRGP4 cg+107636
INDIRI4
CNSTI4 1000
MODI4
SUBI4
ASGNI4
line 452
;451:			// this assumption is correct only on transition and implies hardcoded 1.3 coefficient:
;452:			if ( item->giTag == PW_HASTE ) {
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 3
NEI4 $293
line 453
;453:				cg.predictedPlayerState.speed *= 1.3f;
ADDRLP4 4
ADDRGP4 cg+107636+52
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CVIF4 4
CNSTF4 1067869798
MULF4
CVFI4 4
ASGNI4
line 454
;454:			}
LABELV $293
line 455
;455:		}
LABELV $285
line 456
;456:		cg.predictedPlayerState.powerups[ item->giTag ] += cent->currentState.time2 * 1000;
ADDRLP4 4
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+107636+312
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 1000
MULI4
ADDI4
ASGNI4
line 457
;457:	}	
LABELV $283
line 460
;458:
;459:	// holdable prediction
;460:	if ( item->giType == IT_HOLDABLE && ( item->giTag == HI_TELEPORTER || item->giTag == HI_MEDKIT ) ) {
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 4
NEI4 $299
ADDRLP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 1
EQI4 $301
ADDRLP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
NEI4 $299
LABELV $301
line 461
;461:		cg.predictedPlayerState.stats[ STAT_HOLDABLE_ITEM ] = item - bg_itemlist;
ADDRGP4 cg+107636+184+4
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
ASGNI4
line 462
;462:	}
LABELV $299
line 463
;463:}
LABELV $255
endproc CG_PickupPrediction 16 12
proc CG_TouchItem 28 16
line 471
;464:
;465:
;466:/*
;467:===================
;468:CG_TouchItem
;469:===================
;470:*/
;471:static void CG_TouchItem( centity_t *cent ) {
line 474
;472:	const gitem_t *item;
;473:
;474:	if ( cg.allowPickupPrediction && cg.allowPickupPrediction > cg.time ) {
ADDRGP4 cg+157012
INDIRI4
CNSTI4 0
EQI4 $306
ADDRGP4 cg+157012
INDIRI4
ADDRGP4 cg+107604
INDIRI4
LEI4 $306
line 475
;475:		return;
ADDRGP4 $305
JUMPV
LABELV $306
line 478
;476:	}
;477:
;478:	if ( !cg_predictItems.integer ) {
ADDRGP4 cg_predictItems+12
INDIRI4
CNSTI4 0
NEI4 $311
line 479
;479:		return;
ADDRGP4 $305
JUMPV
LABELV $311
line 482
;480:	}
;481:
;482:	if ( !BG_PlayerTouchesItem( &cg.predictedPlayerState, &cent->currentState, cg.time ) ) {
ADDRGP4 cg+107636
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 BG_PlayerTouchesItem
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $314
line 483
;483:		return;
ADDRGP4 $305
JUMPV
LABELV $314
line 487
;484:	}
;485:
;486:	// never pick an item up twice in a prediction
;487:	if ( cent->delaySpawn > cg.time ) { 
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
LEI4 $318
line 488
;488:		return;
ADDRGP4 $305
JUMPV
LABELV $318
line 491
;489:	}
;490:
;491:	if ( !BG_CanItemBeGrabbed( cgs.gametype, &cent->currentState, &cg.predictedPlayerState ) ) {
ADDRGP4 cgs+31480
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cg+107636
ARGP4
ADDRLP4 8
ADDRGP4 BG_CanItemBeGrabbed
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $321
line 492
;492:		return;	// can't hold it
ADDRGP4 $305
JUMPV
LABELV $321
line 495
;493:	}
;494:
;495:	item = &bg_itemlist[ cent->currentState.modelindex ];
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 52
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 499
;496:
;497:	// Special case for flags.  
;498:	// We don't predict touching our own flag
;499:	if( cgs.gametype == GT_ONEFLAG ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 5
NEI4 $325
line 500
;500:		if( item->giTag != PW_NEUTRALFLAG ) {
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 9
EQI4 $328
line 501
;501:			return;
ADDRGP4 $305
JUMPV
LABELV $328
line 503
;502:		}
;503:	}
LABELV $325
line 504
;504:	if( cgs.gametype == GT_CTF || cgs.gametype == GT_HARVESTER ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 4
EQI4 $334
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 7
NEI4 $330
LABELV $334
line 505
;505:		if (cg.predictedPlayerState.persistant[PERS_TEAM] == TEAM_RED &&
ADDRGP4 cg+107636+248+12
INDIRI4
CNSTI4 1
NEI4 $335
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 9
NEI4 $335
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 7
NEI4 $335
line 507
;506:			item->giType == IT_TEAM && item->giTag == PW_REDFLAG)
;507:			return;
ADDRGP4 $305
JUMPV
LABELV $335
line 508
;508:		if (cg.predictedPlayerState.persistant[PERS_TEAM] == TEAM_BLUE &&
ADDRGP4 cg+107636+248+12
INDIRI4
CNSTI4 2
NEI4 $340
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 9
NEI4 $340
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 8
NEI4 $340
line 510
;509:			item->giType == IT_TEAM && item->giTag == PW_BLUEFLAG)
;510:			return;
ADDRGP4 $305
JUMPV
LABELV $340
line 511
;511:	}
LABELV $330
line 514
;512:
;513:	// grab it
;514:	BG_AddPredictableEventToPlayerstate( EV_ITEM_PICKUP, cent->currentState.modelindex , &cg.predictedPlayerState, cent - cg_entities );
CNSTI4 19
ARGI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+107636
ARGP4
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRGP4 cg_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 740
DIVI4
ARGI4
ADDRGP4 BG_AddPredictableEventToPlayerstate
CALLV
pop
line 517
;515:
;516:	// perform prediction
;517:	CG_PickupPrediction( cent, item );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_PickupPrediction
CALLV
pop
line 520
;518:
;519:	// remove it from the frame so it won't be drawn
;520:	cent->currentState.eFlags |= EF_NODRAW;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 523
;521:
;522:	// don't touch it again this prediction
;523:	cent->miscTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 526
;524:
;525:	// delay next potential pickup for some time
;526:	cent->delaySpawn = cg.time + ( cg.meanPing > 0 ? cg.meanPing * 2 + 100 : 333 );
ADDRGP4 cg+157004
INDIRI4
CNSTI4 0
LEI4 $351
ADDRLP4 20
ADDRGP4 cg+157004
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 100
ADDI4
ASGNI4
ADDRGP4 $352
JUMPV
LABELV $351
ADDRLP4 20
CNSTI4 333
ASGNI4
LABELV $352
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
ADDRGP4 cg+107604
INDIRI4
ADDRLP4 20
INDIRI4
ADDI4
ASGNI4
line 527
;527:	cent->delaySpawnPlayed = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
CNSTI4 0
ASGNI4
line 530
;528:
;529:	// if it's a weapon, give them some predicted ammo so the autoswitch will work
;530:	if ( item->giType == IT_WEAPON ) {
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 10
NEI4 $353
line 531
;531:		cg.predictedPlayerState.stats[ STAT_WEAPONS ] |= 1 << item->giTag;
ADDRLP4 24
ADDRGP4 cg+107636+184+12
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
LSHI4
BORI4
ASGNI4
line 532
;532:		if ( !cg.predictedPlayerState.ammo[ item->giTag ] ) {
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+107636+376
ADDP4
INDIRI4
CNSTI4 0
NEI4 $358
line 533
;533:			cg.predictedPlayerState.ammo[ item->giTag ] = 1;
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+107636+376
ADDP4
CNSTI4 1
ASGNI4
line 534
;534:		}
LABELV $358
line 535
;535:	}
LABELV $353
line 536
;536:}
LABELV $305
endproc CG_TouchItem 28 16
proc CG_TouchTriggerPrediction 84 28
line 546
;537:
;538:
;539:/*
;540:=========================
;541:CG_TouchTriggerPrediction
;542:
;543:Predict push triggers and items
;544:=========================
;545:*/
;546:static void CG_TouchTriggerPrediction( void ) {
line 555
;547:	int			i;
;548:	trace_t		trace;
;549:	entityState_t	*ent;
;550:	clipHandle_t cmodel;
;551:	centity_t	*cent;
;552:	qboolean	spectator;
;553:
;554:	// dead clients don't activate triggers
;555:	if ( cg.predictedPlayerState.stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 cg+107636+184
INDIRI4
CNSTI4 0
GTI4 $365
line 556
;556:		return;
ADDRGP4 $364
JUMPV
LABELV $365
line 559
;557:	}
;558:
;559:	spectator = ( cg.predictedPlayerState.pm_type == PM_SPECTATOR );
ADDRGP4 cg+107636+4
INDIRI4
CNSTI4 2
NEI4 $372
ADDRLP4 76
CNSTI4 1
ASGNI4
ADDRGP4 $373
JUMPV
LABELV $372
ADDRLP4 76
CNSTI4 0
ASGNI4
LABELV $373
ADDRLP4 72
ADDRLP4 76
INDIRI4
ASGNI4
line 561
;560:
;561:	if ( cg.predictedPlayerState.pm_type != PM_NORMAL && !spectator ) {
ADDRGP4 cg+107636+4
INDIRI4
CNSTI4 0
EQI4 $374
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $374
line 562
;562:		return;
ADDRGP4 $364
JUMPV
LABELV $374
line 565
;563:	}
;564:
;565:	for ( i = 0 ; i < cg_numTriggerEntities ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $381
JUMPV
LABELV $378
line 566
;566:		cent = cg_triggerEntities[ i ];
ADDRLP4 12
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_triggerEntities
ADDP4
INDIRP4
ASGNP4
line 567
;567:		ent = &cent->currentState;
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 569
;568:
;569:		if ( ent->eType == ET_ITEM && !spectator ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $382
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $382
line 570
;570:			CG_TouchItem( cent );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 CG_TouchItem
CALLV
pop
line 571
;571:			continue;
ADDRGP4 $379
JUMPV
LABELV $382
line 574
;572:		}
;573:
;574:		if ( ent->solid != SOLID_BMODEL ) {
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16777215
EQI4 $384
line 575
;575:			continue;
ADDRGP4 $379
JUMPV
LABELV $384
line 578
;576:		}
;577:
;578:		cmodel = trap_CM_InlineModel( ent->modelindex );
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 trap_CM_InlineModel
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 80
INDIRI4
ASGNI4
line 579
;579:		if ( !cmodel ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $386
line 580
;580:			continue;
ADDRGP4 $379
JUMPV
LABELV $386
line 583
;581:		}
;582:
;583:		trap_CM_BoxTrace( &trace, cg.predictedPlayerState.origin, cg.predictedPlayerState.origin, 
ADDRLP4 16
ARGP4
ADDRGP4 cg+107636+20
ARGP4
ADDRGP4 cg+107636+20
ARGP4
ADDRGP4 cg_pmove+176
ARGP4
ADDRGP4 cg_pmove+188
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 -1
ARGI4
ADDRGP4 trap_CM_BoxTrace
CALLV
pop
line 586
;584:			cg_pmove.mins, cg_pmove.maxs, cmodel, -1 );
;585:
;586:		if ( !trace.startsolid ) {
ADDRLP4 16+4
INDIRI4
CNSTI4 0
NEI4 $394
line 587
;587:			continue;
ADDRGP4 $379
JUMPV
LABELV $394
line 590
;588:		}
;589:
;590:		if ( ent->eType == ET_TELEPORT_TRIGGER ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 9
NEI4 $397
line 591
;591:			cg.hyperspace = qtrue;
ADDRGP4 cg+107632
CNSTI4 1
ASGNI4
line 592
;592:		} else if ( ent->eType == ET_PUSH_TRIGGER ) {
ADDRGP4 $398
JUMPV
LABELV $397
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 8
NEI4 $400
line 593
;593:			BG_TouchJumpPad( &cg.predictedPlayerState, ent );
ADDRGP4 cg+107636
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 BG_TouchJumpPad
CALLV
pop
line 594
;594:		}
LABELV $400
LABELV $398
line 595
;595:	}
LABELV $379
line 565
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $381
ADDRLP4 4
INDIRI4
ADDRGP4 cg_numTriggerEntities
INDIRI4
LTI4 $378
line 598
;596:
;597:	// if we didn't touch a jump pad this pmove frame
;598:	if ( cg.predictedPlayerState.jumppad_frame != cg.predictedPlayerState.pmove_framecount ) {
ADDRGP4 cg+107636+460
INDIRI4
ADDRGP4 cg+107636+456
INDIRI4
EQI4 $403
line 599
;599:		cg.predictedPlayerState.jumppad_frame = 0;
ADDRGP4 cg+107636+460
CNSTI4 0
ASGNI4
line 600
;600:		cg.predictedPlayerState.jumppad_ent = 0;
ADDRGP4 cg+107636+448
CNSTI4 0
ASGNI4
line 601
;601:	}
LABELV $403
line 602
;602:}
LABELV $364
endproc CG_TouchTriggerPrediction 84 28
proc CG_CheckTimers 16 0
line 605
;603:
;604:
;605:static void CG_CheckTimers( void ) {
line 609
;606:	int i;
;607:
;608:	// no prediction for spectators
;609:	if ( cg.predictedPlayerState.pm_type == PM_SPECTATOR ) {
ADDRGP4 cg+107636+4
INDIRI4
CNSTI4 2
NEI4 $414
line 610
;610:		return;
ADDRGP4 $413
JUMPV
LABELV $414
line 614
;611:	}
;612:
;613:	// no armor/health/powerups prediction for dead bodies
;614:	if ( cg.predictedPlayerState.stats[STAT_HEALTH] <= 0 )
ADDRGP4 cg+107636+184
INDIRI4
CNSTI4 0
GTI4 $418
line 615
;615:		return;
ADDRGP4 $413
JUMPV
LABELV $418
line 618
;616:
;617:	// periodic tasks
;618:	if ( cg.timeResidual && cg.predictedPlayerState.commandTime >= cg.timeResidual && !cg.thisFrameTeleport ) {
ADDRGP4 cg+157008
INDIRI4
CNSTI4 0
EQI4 $422
ADDRGP4 cg+107636
INDIRI4
ADDRGP4 cg+157008
INDIRI4
LTI4 $422
ADDRGP4 cg+107592
INDIRI4
CNSTI4 0
NEI4 $422
line 619
;619:		cg.timeResidual += 1000;
ADDRLP4 4
ADDRGP4 cg+157008
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 620
;620:		if ( cg.predictedPlayerState.powerups[ PW_REGEN ] ) {
ADDRGP4 cg+107636+312+20
INDIRI4
CNSTI4 0
EQI4 $429
line 621
;621:			int maxhealth = cg.predictedPlayerState.stats[ STAT_MAX_HEALTH ];
ADDRLP4 8
ADDRGP4 cg+107636+184+28
INDIRI4
ASGNI4
line 622
;622:			if ( cg.predictedPlayerState.stats[ STAT_HEALTH ] < maxhealth ) {
ADDRGP4 cg+107636+184
INDIRI4
ADDRLP4 8
INDIRI4
GEI4 $437
line 623
;623:				cg.predictedPlayerState.stats[ STAT_HEALTH ] += 15;
ADDRLP4 12
ADDRGP4 cg+107636+184
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 15
ADDI4
ASGNI4
line 624
;624:				if ( cg.predictedPlayerState.stats[ STAT_HEALTH ] > maxhealth * 1.1 ) {
ADDRGP4 cg+107636+184
INDIRI4
CVIF4 4
ADDRLP4 8
INDIRI4
CVIF4 4
CNSTF4 1066192077
MULF4
LEF4 $430
line 625
;625:					cg.predictedPlayerState.stats[ STAT_HEALTH ] = maxhealth * 1.1;
ADDRGP4 cg+107636+184
ADDRLP4 8
INDIRI4
CVIF4 4
CNSTF4 1066192077
MULF4
CVFI4 4
ASGNI4
line 626
;626:				}
line 628
;627:				// TODO: add external EV_POWERUP_REGEN
;628:			} else if ( cg.predictedPlayerState.stats[ STAT_HEALTH ] < maxhealth * 2) {
ADDRGP4 $430
JUMPV
LABELV $437
ADDRGP4 cg+107636+184
INDIRI4
ADDRLP4 8
INDIRI4
CNSTI4 1
LSHI4
GEI4 $430
line 629
;629:				cg.predictedPlayerState.stats[ STAT_HEALTH ] += 5;
ADDRLP4 12
ADDRGP4 cg+107636+184
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 5
ADDI4
ASGNI4
line 630
;630:				if ( cg.predictedPlayerState.stats[ STAT_HEALTH ] > maxhealth * 2 ) {
ADDRGP4 cg+107636+184
INDIRI4
ADDRLP4 8
INDIRI4
CNSTI4 1
LSHI4
LEI4 $430
line 631
;631:					cg.predictedPlayerState.stats[ STAT_HEALTH ] = maxhealth * 2;
ADDRGP4 cg+107636+184
ADDRLP4 8
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 632
;632:				}
line 634
;633:				// TODO: add external EV_POWERUP_REGEN
;634:			}
line 635
;635:		} else {
ADDRGP4 $430
JUMPV
LABELV $429
line 636
;636:			if ( cg.predictedPlayerState.stats[ STAT_HEALTH ] > cg.predictedPlayerState.stats[ STAT_MAX_HEALTH ] ) {
ADDRGP4 cg+107636+184
INDIRI4
ADDRGP4 cg+107636+184+28
INDIRI4
LEI4 $461
line 637
;637:				cg.predictedPlayerState.stats[ STAT_HEALTH ]--;
ADDRLP4 8
ADDRGP4 cg+107636+184
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 638
;638:			}
LABELV $461
line 639
;639:		}
LABELV $430
line 640
;640:		if ( cg.predictedPlayerState.stats[ STAT_ARMOR ] > cg.predictedPlayerState.stats[ STAT_MAX_HEALTH ] ) {
ADDRGP4 cg+107636+184+16
INDIRI4
ADDRGP4 cg+107636+184+28
INDIRI4
LEI4 $470
line 641
;641:			cg.predictedPlayerState.stats[ STAT_ARMOR ]--;
ADDRLP4 8
ADDRGP4 cg+107636+184+16
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 642
;642:		}
LABELV $470
line 643
;643:	}
LABELV $422
line 646
;644:
;645:	// turn off any expired powerups
;646:	for ( i = 0 ; i < MAX_POWERUPS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $481
line 647
;647:		if ( !cg.predictedPlayerState.powerups[ i ] )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+107636+312
ADDP4
INDIRI4
CNSTI4 0
NEI4 $485
line 648
;648:			continue;
ADDRGP4 $482
JUMPV
LABELV $485
line 649
;649:		if ( cg.predictedPlayerState.powerups[ i ] < cg.predictedPlayerState.commandTime ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+107636+312
ADDP4
INDIRI4
ADDRGP4 cg+107636
INDIRI4
GEI4 $489
line 650
;650:			cg.predictedPlayerState.powerups[ i ] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+107636+312
ADDP4
CNSTI4 0
ASGNI4
line 651
;651:		}
LABELV $489
line 652
;652:	}
LABELV $482
line 646
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $481
line 653
;653:}
LABELV $413
endproc CG_CheckTimers 16 0
proc CG_IsUnacceptableError 164 36
line 656
;654:
;655:
;656:static int CG_IsUnacceptableError( playerState_t *ps, playerState_t *pps, qboolean *forceMove ) {
line 660
;657:	vec3_t delta;
;658:	int i, n, v0, v1;
;659: 
;660:	if ( pps->pm_time != ps->pm_time ||
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
NEI4 $500
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
NEI4 $500
ADDRLP4 28
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
EQI4 $497
LABELV $500
line 662
;661:		 pps->pm_type != ps->pm_type ||
;662:		 pps->pm_flags != ps->pm_flags ) {
line 663
;663:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $496
JUMPV
LABELV $497
line 666
;664:	}
;665: 
;666:	VectorSubtract( pps->origin, ps->origin, delta );
ADDRLP4 36
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 36
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 36
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 667
;667:	if ( VectorLengthSquared( delta ) > 0.01f * 0.01f ) {
ADDRLP4 12
ARGP4
ADDRLP4 44
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 44
INDIRF4
CNSTF4 953267991
LEF4 $503
line 668
;668:		if( cg_showmiss.integer > 2 ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 2
LEI4 $505
line 669
;669:			CG_Printf( "origin delta: %.2f  ", VectorLength( delta ) );
ADDRLP4 12
ARGP4
ADDRLP4 48
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRGP4 $508
ARGP4
ADDRLP4 48
INDIRF4
ARGF4
ADDRGP4 CG_Printf
CALLV
pop
line 670
;670:		}
LABELV $505
line 671
;671:		return 2;
CNSTI4 2
RETI4
ADDRGP4 $496
JUMPV
LABELV $503
line 674
;672:	}
;673:
;674:	VectorSubtract( pps->velocity, ps->velocity, delta );
ADDRLP4 48
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 48
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 48
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
SUBF4
ASGNF4
line 675
;675:	if( VectorLengthSquared( delta ) > 0.01f * 0.01f ) {
ADDRLP4 12
ARGP4
ADDRLP4 56
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 56
INDIRF4
CNSTF4 953267991
LEF4 $511
line 676
;676:		if( cg_showmiss.integer > 2 ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 2
LEI4 $513
line 677
;677:			CG_Printf( "velocity delta: %.2f  ", VectorLength( delta ) );
ADDRLP4 12
ARGP4
ADDRLP4 60
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRGP4 $516
ARGP4
ADDRLP4 60
INDIRF4
ARGF4
ADDRGP4 CG_Printf
CALLV
pop
line 678
;678:		}
LABELV $513
line 679
;679:		return 3;
CNSTI4 3
RETI4
ADDRGP4 $496
JUMPV
LABELV $511
line 682
;680:	}
;681:
;682:	if( pps->weaponTime != ps->weaponTime ||
ADDRLP4 60
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRLP4 64
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
NEI4 $524
ADDRLP4 60
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
ADDRLP4 64
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
NEI4 $524
ADDRLP4 60
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ADDRLP4 64
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
NEI4 $524
ADDRLP4 60
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
ADDRLP4 64
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
NEI4 $524
ADDRLP4 60
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
ADDRLP4 64
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
NEI4 $524
ADDRLP4 60
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ADDRLP4 64
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
NEI4 $524
ADDRLP4 60
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ADDRLP4 64
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
EQI4 $517
LABELV $524
line 688
;683:		pps->gravity != ps->gravity ||
;684:		pps->speed != ps->speed ||
;685:		pps->delta_angles[ 0 ] != ps->delta_angles[ 0 ] ||
;686:		pps->delta_angles[ 1 ] != ps->delta_angles[ 1 ] ||
;687:		pps->delta_angles[ 2 ] != ps->delta_angles[ 2 ] || 
;688:		pps->groundEntityNum != ps->groundEntityNum ) {
line 689
;689:		if ( cg_showmiss.integer > 1 )
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 1
LEI4 $525
line 690
;690:			CG_Printf( "%i %i %i %i => %i %i %i %i", 
ADDRGP4 $528
ARGP4
ADDRLP4 68
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $525
line 694
;691:				pps->weaponTime, pps->gravity, pps->speed, pps->groundEntityNum,
;692:				ps->weaponTime, ps->gravity, ps->speed, ps->groundEntityNum ); 
;693:
;694:		return 4;
CNSTI4 4
RETI4
ADDRGP4 $496
JUMPV
LABELV $517
line 698
;695:	}
;696:
;697:	// forward gesture animation
;698:	if ( pps->torsoAnim != ps->torsoAnim && (ps->torsoAnim & ~ANIM_TOGGLEBIT ) == TORSO_GESTURE ) {
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ADDRLP4 68
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
EQI4 $529
ADDRLP4 68
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
CNSTI4 6
NEI4 $529
line 699
;699:		for ( n = 0 ; n < NUM_SAVED_STATES; n++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $531
line 700
;700:			cg.savedPmoveStates[ n ].torsoAnim = ps->torsoAnim;
ADDRLP4 4
INDIRI4
CNSTI4 468
MULI4
ADDRGP4 cg+126108+84
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ASGNI4
line 701
;701:			cg.savedPmoveStates[ n ].torsoTimer = ps->torsoTimer;
ADDRLP4 4
INDIRI4
CNSTI4 468
MULI4
ADDRGP4 cg+126108+80
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ASGNI4
line 702
;702:		}
LABELV $532
line 699
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 66
LTI4 $531
line 703
;703:	}
LABELV $529
line 705
;704:
;705:	if ( pps->legsTimer != ps->legsTimer ||	pps->legsAnim != ps->legsAnim ||
ADDRLP4 72
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
ADDRLP4 76
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
NEI4 $544
ADDRLP4 72
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
ADDRLP4 76
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
NEI4 $544
ADDRLP4 72
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ADDRLP4 76
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
NEI4 $544
ADDRLP4 72
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ADDRLP4 76
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
NEI4 $544
ADDRLP4 72
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ADDRLP4 76
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
EQI4 $539
LABELV $544
line 707
;706:		pps->torsoTimer != ps->torsoTimer || pps->torsoAnim != ps->torsoAnim ||
;707:		pps->movementDir != ps->movementDir ) {
line 708
;708:		return 5;
CNSTI4 5
RETI4
ADDRGP4 $496
JUMPV
LABELV $539
line 711
;709:	}
;710:
;711:	VectorSubtract( pps->grapplePoint, ps->grapplePoint, delta );
ADDRLP4 80
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 80
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 80
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 4
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 712
;712:	if( VectorLengthSquared( delta ) > 0.01f * 0.01f )
ADDRLP4 12
ARGP4
ADDRLP4 88
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 88
INDIRF4
CNSTF4 953267991
LEF4 $547
line 713
;713:		return 6;
CNSTI4 6
RETI4
ADDRGP4 $496
JUMPV
LABELV $547
line 716
;714:
;715:	// check/update eFlags if needed
;716:	v0 = pps->eFlags & EF_NOPREDICT;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 784456
BANDI4
ASGNI4
line 717
;717:	v1 = ps->eFlags & EF_NOPREDICT;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 784456
BANDI4
ASGNI4
line 718
;718:	if ( v0 != v1 ) {
ADDRLP4 8
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $549
line 719
;719:		for ( i = 0 ; i < NUM_SAVED_STATES; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $551
line 720
;720:			cg.savedPmoveStates[ i ].eFlags = (cg.savedPmoveStates[ i ].eFlags & ~EF_NOPREDICT) | v1 ;
ADDRLP4 0
INDIRI4
CNSTI4 468
MULI4
ADDRGP4 cg+126108+104
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 468
MULI4
ADDRGP4 cg+126108+104
ADDP4
INDIRI4
CNSTI4 -784457
BANDI4
ADDRLP4 24
INDIRI4
BORI4
ASGNI4
line 721
;721:		}
LABELV $552
line 719
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 66
LTI4 $551
line 722
;722:		pps->eFlags = (pps->eFlags & ~EF_NOPREDICT) | v1;
ADDRLP4 92
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 92
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 -784457
BANDI4
ADDRLP4 24
INDIRI4
BORI4
ASGNI4
line 723
;723:	}
LABELV $549
line 725
;724:
;725:	if ( pps->eFlags !=  ps->eFlags ) {
ADDRFP4 4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
EQI4 $559
line 726
;726:		if ( cg_showmiss.integer > 1 )
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 1
LEI4 $561
line 727
;727:			CG_Printf( "eFlags %i => %i", pps->eFlags, ps->eFlags );
ADDRGP4 $564
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $561
line 728
;728:		return 7;
CNSTI4 7
RETI4
ADDRGP4 $496
JUMPV
LABELV $559
line 731
;729:	}
;730:
;731:	if( pps->eventSequence != ps->eventSequence )
ADDRFP4 4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
EQI4 $565
line 732
;732:		return 8;
CNSTI4 8
RETI4
ADDRGP4 $496
JUMPV
LABELV $565
line 734
;733:
;734:	for( i = 0; i < MAX_PS_EVENTS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $567
line 735
;735:		if ( pps->events[ i ] != ps->events[ i ] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
EQI4 $571
line 736
;736:			if ( cg_showmiss.integer > 1 ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 1
LEI4 $573
line 737
;737:				CG_Printf( "event[%i] %i => %i\n", i, pps->events[ i ], ps->events[ i ] );
ADDRGP4 $576
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 738
;738:			}
LABELV $573
line 739
;739:			return 9;
CNSTI4 9
RETI4
ADDRGP4 $496
JUMPV
LABELV $571
line 741
;740:		}
;741:		if ( pps->eventParms[ i ] != ps->eventParms[ i ] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 120
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
ADDP4
INDIRI4
EQI4 $577
line 742
;742:			if ( cg_showmiss.integer > 1 ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 1
LEI4 $579
line 743
;743:				CG_Printf( "eventParms[%i] %i => %i\n", i, pps->eventParms[ i ], ps->eventParms[ i ] );
ADDRGP4 $582
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 120
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 744
;744:			}
LABELV $579
line 745
;745:			return 9;
CNSTI4 9
RETI4
ADDRGP4 $496
JUMPV
LABELV $577
line 747
;746:		}
;747:	}
LABELV $568
line 734
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $567
line 749
;748:
;749:	if ( pps->externalEvent != ps->externalEvent ||
ADDRLP4 92
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
ADDRLP4 96
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
NEI4 $586
ADDRLP4 92
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
ADDRLP4 96
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
NEI4 $586
ADDRLP4 92
INDIRP4
CNSTI4 136
ADDP4
INDIRI4
ADDRLP4 96
INDIRP4
CNSTI4 136
ADDP4
INDIRI4
EQI4 $583
LABELV $586
line 751
;750:		pps->externalEventParm != ps->externalEventParm ||
;751:		pps->externalEventTime != ps->externalEventTime ) {
line 752
;752:		return 10;
CNSTI4 10
RETI4
ADDRGP4 $496
JUMPV
LABELV $583
line 755
;753:	}
;754:
;755:	if ( pps->clientNum != ps->clientNum ||
ADDRLP4 100
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ADDRLP4 104
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
NEI4 $590
ADDRLP4 100
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ADDRLP4 104
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
NEI4 $590
ADDRLP4 100
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ADDRLP4 104
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
EQI4 $587
LABELV $590
line 757
;756:		pps->weapon != ps->weapon ||
;757:		pps->weaponstate != ps->weaponstate ) {
line 758
;758:		return 11;
CNSTI4 11
RETI4
ADDRGP4 $496
JUMPV
LABELV $587
line 761
;759:	}
;760:
;761:	if ( fabs( AngleDelta( ps->viewangles[ 0 ], pps->viewangles[ 0 ] ) ) > 1.0f ||
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRP4
CNSTI4 152
ADDP4
INDIRF4
ARGF4
ADDRLP4 108
ADDRGP4 AngleDelta
CALLF4
ASGNF4
ADDRLP4 108
INDIRF4
ARGF4
ADDRLP4 112
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 112
INDIRF4
CNSTF4 1065353216
GTF4 $594
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRP4
CNSTI4 156
ADDP4
INDIRF4
ARGF4
ADDRLP4 116
ADDRGP4 AngleDelta
CALLF4
ASGNF4
ADDRLP4 116
INDIRF4
ARGF4
ADDRLP4 120
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 120
INDIRF4
CNSTF4 1065353216
GTF4 $594
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ARGF4
ADDRLP4 124
ADDRGP4 AngleDelta
CALLF4
ASGNF4
ADDRLP4 124
INDIRF4
ARGF4
ADDRLP4 128
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 128
INDIRF4
CNSTF4 1065353216
LEF4 $591
LABELV $594
line 763
;762:		fabs( AngleDelta( ps->viewangles[ 1 ], pps->viewangles[ 1 ] ) ) > 1.0f ||
;763:		fabs( AngleDelta( ps->viewangles[ 2 ], pps->viewangles[ 2 ] ) ) > 1.0f ) {
line 764
;764:		return 12;
CNSTI4 12
RETI4
ADDRGP4 $496
JUMPV
LABELV $591
line 767
;765:	}
;766:
;767:	if ( pps->viewheight != ps->viewheight )
ADDRFP4 4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
EQI4 $595
line 768
;768:  		return 13;
CNSTI4 13
RETI4
ADDRGP4 $496
JUMPV
LABELV $595
line 770
;769:
;770:	if( pps->damageEvent != ps->damageEvent ||
ADDRLP4 132
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 132
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ADDRLP4 136
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
NEI4 $601
ADDRLP4 132
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ADDRLP4 136
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
NEI4 $601
ADDRLP4 132
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ADDRLP4 136
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
NEI4 $601
ADDRLP4 132
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ADDRLP4 136
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
EQI4 $597
LABELV $601
line 773
;771:		pps->damageYaw != ps->damageYaw ||
;772:		pps->damagePitch != ps->damagePitch ||
;773:		pps->damageCount != ps->damageCount ) {
line 774
;774:		if ( cg_showmiss.integer > 1 )
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 1
LEI4 $602
line 775
;775:			CG_Printf( "dmg %i %i %i %i >= %i %i %i %i\n", 
ADDRGP4 $605
ARGP4
ADDRLP4 140
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 140
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ARGI4
ADDRLP4 140
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ARGI4
ADDRLP4 140
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ARGI4
ADDRLP4 140
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ARGI4
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ARGI4
ADDRLP4 144
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ARGI4
ADDRLP4 144
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ARGI4
ADDRLP4 144
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $602
line 778
;776:				pps->damageEvent, pps->damageYaw, pps->damagePitch, pps->damageCount,
;777:				ps->damageEvent, ps->damageYaw, ps->damagePitch, ps->damageCount );
;778:		return 14;
CNSTI4 14
RETI4
ADDRGP4 $496
JUMPV
LABELV $597
line 782
;779:	}
;780:
;781:	// health countdown?
;782:	if ( pps->stats[ STAT_HEALTH ] == ps->stats[ STAT_HEALTH ] + 1 && ps->stats[ STAT_HEALTH ] >= ps->stats[ STAT_MAX_HEALTH ] ) {
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ADDRLP4 140
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 1
ADDI4
NEI4 $606
ADDRLP4 140
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ADDRLP4 140
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
LTI4 $606
line 783
;783:		cg.timeResidual = ps->commandTime + 1000;
ADDRGP4 cg+157008
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 784
;784:		for ( n = 0 ; n < NUM_SAVED_STATES; n++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $609
line 785
;785:			cg.savedPmoveStates[ n ].stats[ STAT_HEALTH ] = ps->stats[ STAT_HEALTH ];
ADDRLP4 4
INDIRI4
CNSTI4 468
MULI4
ADDRGP4 cg+126108+184
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 786
;786:		}
LABELV $610
line 784
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 66
LTI4 $609
line 788
;787:
;788:	}
LABELV $606
line 790
;789:	// armor countdown?
;790:	if ( pps->stats[ STAT_ARMOR ] == ps->stats[ STAT_ARMOR ] - 1 && ps->stats[ STAT_ARMOR ] >= ps->stats[ STAT_MAX_HEALTH ] ) {
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ADDRLP4 144
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CNSTI4 1
SUBI4
NEI4 $615
ADDRLP4 144
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ADDRLP4 144
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
LTI4 $615
line 792
;791:		// we may need few frames to sync with client->timeResidual on server side
;792:		cg.timeResidual = ps->commandTime + 1000;
ADDRGP4 cg+157008
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 793
;793:		for ( n = 0 ; n < NUM_SAVED_STATES; n++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $618
line 794
;794:			cg.savedPmoveStates[ n ].stats[ STAT_ARMOR ] = ps->stats[ STAT_ARMOR ];
ADDRLP4 4
INDIRI4
CNSTI4 468
MULI4
ADDRGP4 cg+126108+184+16
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ASGNI4
line 795
;795:		}
LABELV $619
line 793
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 66
LTI4 $618
line 796
;796:	}
LABELV $615
line 798
;797:
;798:	for( i = 0; i < MAX_STATS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $625
line 800
;799:		// we can't predict some flags
;800:		if ( i == STAT_CLIENTS_READY /*|| i == STAT_MAX_HEALTH */ ) {
ADDRLP4 0
INDIRI4
CNSTI4 6
NEI4 $629
line 801
;801:			for ( n = 0 ; n < NUM_SAVED_STATES; n++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $631
line 802
;802:				cg.savedPmoveStates[ n ].stats[ i ] = ps->stats[ i ];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRI4
CNSTI4 468
MULI4
ADDRGP4 cg+126108+184
ADDP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDP4
INDIRI4
ASGNI4
line 803
;803:			}
LABELV $632
line 801
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 66
LTI4 $631
line 804
;804:			continue;
ADDRGP4 $626
JUMPV
LABELV $629
line 806
;805:		}
;806:		if ( pps->stats[ i ] != ps->stats[ i ] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDP4
INDIRI4
EQI4 $637
line 807
;807:			if ( cg_showmiss.integer > 1 ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 1
LEI4 $639
line 808
;808:				CG_Printf( "stats[%i] %i => %i ", i, pps->stats[ i ], ps->stats[ i ] );
ADDRGP4 $642
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 809
;809:			}
LABELV $639
line 810
;810:			return 15;
CNSTI4 15
RETI4
ADDRGP4 $496
JUMPV
LABELV $637
line 812
;811:		}
;812:	}
LABELV $626
line 798
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $625
line 815
;813:
;814:
;815:	for( i = 0; i < MAX_PERSISTANT ; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $643
line 816
;816:	{
line 817
;817:		if ( pps->persistant[ i ] != ps->persistant[ i ] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 248
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
ADDP4
INDIRI4
EQI4 $647
line 818
;818:			if ( i >= PERS_TEAM && i <= PERS_PLAYEREVENTS ) {
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $649
ADDRLP4 0
INDIRI4
CNSTI4 5
GTI4 $649
line 819
;819:				if ( cg_showmiss.integer > 1 ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 1
LEI4 $651
line 820
;820:					CG_Printf( "persistant[%i] %i => %i ", i, pps->persistant[ i ], ps->persistant[ i ] );
ADDRGP4 $654
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 248
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 821
;821:				}
LABELV $651
line 822
;822:				return 16;
CNSTI4 16
RETI4
ADDRGP4 $496
JUMPV
LABELV $649
line 824
;823:			}
;824:			v0 = ps->persistant[ i ];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
ADDP4
INDIRI4
ASGNI4
line 825
;825:			for ( n = 0 ; n < NUM_SAVED_STATES; n++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $655
line 826
;826:				cg.savedPmoveStates[ n ].persistant[ i ] = v0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRI4
CNSTI4 468
MULI4
ADDRGP4 cg+126108+248
ADDP4
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 827
;827:			}
LABELV $656
line 825
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 66
LTI4 $655
line 828
;828:			*forceMove = qtrue;
ADDRFP4 8
INDIRP4
CNSTI4 1
ASGNI4
line 829
;829:		}
LABELV $647
line 830
;830:	}
LABELV $644
line 815
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $643
line 832
;831:
;832:	for( i = 0; i < MAX_WEAPONS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $661
line 833
;833:		if( pps->ammo[ i ] != ps->ammo[ i ] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
EQI4 $665
line 834
;834:			if ( cg_showmiss.integer > 1 ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 1
LEI4 $667
line 835
;835:				CG_Printf( "ammo[%i] %i => %i ", i, pps->ammo[ i ], ps->ammo[ i ] );
ADDRGP4 $670
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 836
;836:			}
LABELV $667
line 837
;837:			return 18;
CNSTI4 18
RETI4
ADDRGP4 $496
JUMPV
LABELV $665
line 839
;838:		}
;839:	}
LABELV $662
line 832
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $661
line 841
;840:
;841:	if ( pps->generic1 != ps->generic1 || pps->loopSound != ps->loopSound ) {
ADDRLP4 148
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
ADDRLP4 152
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
NEI4 $673
ADDRLP4 148
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
ADDRLP4 152
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
EQI4 $671
LABELV $673
line 842
;842:		return 19;
CNSTI4 19
RETI4
ADDRGP4 $496
JUMPV
LABELV $671
line 845
;843:	}
;844:
;845:	for ( i = 0; i < MAX_POWERUPS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $674
line 846
;846:		if( pps->powerups[ i ] != ps->powerups[ i ] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
EQI4 $678
line 847
;847:			if ( cg_showmiss.integer > 1 )
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 1
LEI4 $680
line 848
;848:				CG_Printf( "powerups[%i] %i => %i ", i, pps->powerups[i], ps->powerups[i] );
ADDRGP4 $683
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $680
line 849
;849:			return 20;
CNSTI4 20
RETI4
ADDRGP4 $496
JUMPV
LABELV $678
line 851
;850:		}
;851:	}
LABELV $675
line 845
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $674
line 853
;852:
;853:	return 0;
CNSTI4 0
RETI4
LABELV $496
endproc CG_IsUnacceptableError 164 36
export CG_PredictPlayerState
proc CG_PredictPlayerState 596 28
line 883
;854:}
;855:
;856:
;857:/*
;858:=================
;859:CG_PredictPlayerState
;860:
;861:Generates cg.predictedPlayerState for the current cg.time
;862:cg.predictedPlayerState is guaranteed to be valid after exiting.
;863:
;864:For demo playback, this will be an interpolation between two valid
;865:playerState_t.
;866:
;867:For normal gameplay, it will be the result of predicted usercmd_t on
;868:top of the most recent playerState_t received from the server.
;869:
;870:Each new snapshot will usually have one or more new usercmd over the last,
;871:but we simulate all unacknowledged commands each time, not just the new ones.
;872:This means that on an internet connection, quite a few pmoves may be issued
;873:each frame.
;874:
;875:OPTIMIZE: don't re-simulate unless the newly arrived snapshot playerState_t
;876:differs from the predicted one.  Would require saving all intermediate
;877:playerState_t during prediction.
;878:
;879:We detect prediction errors and allow them to be decayed off over several frames
;880:to ease the jerk.
;881:=================
;882:*/
;883:void CG_PredictPlayerState( void ) {
line 889
;884:	int			cmdNum, current;
;885:	playerState_t	oldPlayerState;
;886:	qboolean	moved;
;887:	usercmd_t	oldestCmd;
;888:	usercmd_t	latestCmd;
;889:	int stateIndex = 0, predictCmd = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 484
CNSTI4 0
ASGNI4
line 891
;890:
;891:	cg.hyperspace = qfalse;	// will be set if touching a trigger_teleport
ADDRGP4 cg+107632
CNSTI4 0
ASGNI4
line 896
;892:
;893:	// if this is the first frame we must guarantee
;894:	// predictedPlayerState is valid even if there is some
;895:	// other error condition
;896:	if ( !cg.validPPS ) {
ADDRGP4 cg+108844
INDIRI4
CNSTI4 0
NEI4 $686
line 897
;897:		cg.validPPS = qtrue;
ADDRGP4 cg+108844
CNSTI4 1
ASGNI4
line 898
;898:		cg.predictedPlayerState = cg.snap->ps;
ADDRGP4 cg+107636
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
INDIRB
ASGNB 468
line 899
;899:	}
LABELV $686
line 903
;900:
;901:
;902:	// demo playback just copies the moves
;903:	if ( cg.demoPlayback || (cg.snap->ps.pm_flags & PMF_FOLLOW) ) {
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
NEI4 $696
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $692
LABELV $696
line 904
;904:		CG_InterpolatePlayerState( qfalse );
CNSTI4 0
ARGI4
ADDRGP4 CG_InterpolatePlayerState
CALLV
pop
line 905
;905:		return;
ADDRGP4 $684
JUMPV
LABELV $692
line 909
;906:	}
;907:
;908:	// non-predicting local movement will grab the latest angles
;909:	if ( cg_nopredict.integer || cgs.synchronousClients ) {
ADDRGP4 cg_nopredict+12
INDIRI4
CNSTI4 0
NEI4 $701
ADDRGP4 cgs+149904
INDIRI4
CNSTI4 0
EQI4 $697
LABELV $701
line 910
;910:		CG_InterpolatePlayerState( qtrue );
CNSTI4 1
ARGI4
ADDRGP4 CG_InterpolatePlayerState
CALLV
pop
line 911
;911:		return;
ADDRGP4 $684
JUMPV
LABELV $697
line 915
;912:	}
;913:
;914:	// prepare for pmove
;915:	cg_pmove.ps = &cg.predictedPlayerState;
ADDRGP4 cg_pmove
ADDRGP4 cg+107636
ASGNP4
line 916
;916:	cg_pmove.trace = CG_Trace;
ADDRGP4 cg_pmove+216
ADDRGP4 CG_Trace
ASGNP4
line 917
;917:	cg_pmove.pointcontents = CG_PointContents;
ADDRGP4 cg_pmove+220
ADDRGP4 CG_PointContents
ASGNP4
line 918
;918:	if ( cg_pmove.ps->pm_type == PM_DEAD ) {
ADDRGP4 cg_pmove
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $705
line 919
;919:		cg_pmove.tracemask = MASK_PLAYERSOLID & ~CONTENTS_BODY;
ADDRGP4 cg_pmove+28
CNSTI4 65537
ASGNI4
line 920
;920:	}
ADDRGP4 $706
JUMPV
LABELV $705
line 921
;921:	else {
line 922
;922:		cg_pmove.tracemask = MASK_PLAYERSOLID;
ADDRGP4 cg_pmove+28
CNSTI4 33619969
ASGNI4
line 923
;923:	}
LABELV $706
line 924
;924:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $709
line 925
;925:		cg_pmove.tracemask &= ~CONTENTS_BODY;	// spectators can fly through bodies
ADDRLP4 536
ADDRGP4 cg_pmove+28
ASGNP4
ADDRLP4 536
INDIRP4
ADDRLP4 536
INDIRP4
INDIRI4
CNSTI4 -33554433
BANDI4
ASGNI4
line 926
;926:	}
LABELV $709
line 929
;927:
;928:	// save the state before the pmove so we can detect transitions
;929:	oldPlayerState = cg.predictedPlayerState;
ADDRLP4 8
ADDRGP4 cg+107636
INDIRB
ASGNB 468
line 931
;930:
;931:	current = trap_GetCurrentCmdNumber();
ADDRLP4 536
ADDRGP4 trap_GetCurrentCmdNumber
CALLI4
ASGNI4
ADDRLP4 476
ADDRLP4 536
INDIRI4
ASGNI4
line 936
;932:
;933:	// if we don't have the commands right after the snapshot, we
;934:	// can't accurately predict a current position, so just freeze at
;935:	// the last good position we had
;936:	cmdNum = current - CMD_BACKUP + 1;
ADDRLP4 0
ADDRLP4 476
INDIRI4
CNSTI4 64
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 937
;937:	trap_GetUserCmd( cmdNum, &oldestCmd );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 512
ARGP4
ADDRGP4 trap_GetUserCmd
CALLI4
pop
line 938
;938:	if ( oldestCmd.serverTime > cg.snap->ps.commandTime
ADDRLP4 540
ADDRLP4 512
INDIRI4
ASGNI4
ADDRLP4 540
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
LEI4 $714
ADDRLP4 540
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $714
line 939
;939:		&& oldestCmd.serverTime < cg.time ) {	// special check for map_restart
line 940
;940:		if ( cg_showmiss.integer ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $684
line 941
;941:			CG_Printf ("exceeded PACKET_BACKUP on commands\n");
ADDRGP4 $721
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 942
;942:		}
line 943
;943:		return;
ADDRGP4 $684
JUMPV
LABELV $714
line 947
;944:	}
;945:
;946:	// get the latest command so we can know which commands are from previous map_restarts
;947:	trap_GetUserCmd( current, &latestCmd );
ADDRLP4 476
INDIRI4
ARGI4
ADDRLP4 488
ARGP4
ADDRGP4 trap_GetUserCmd
CALLI4
pop
line 953
;948:
;949:	// get the most recent information we have, even if
;950:	// the server time is beyond our current cg.time,
;951:	// because predicted player positions are going to 
;952:	// be ahead of everything else anyway
;953:	if ( cg.nextSnap && !cg.nextFrameTeleport && !cg.thisFrameTeleport ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $722
ADDRGP4 cg+107596
INDIRI4
CNSTI4 0
NEI4 $722
ADDRGP4 cg+107592
INDIRI4
CNSTI4 0
NEI4 $722
line 954
;954:		cg.predictedPlayerState = cg.nextSnap->ps;
ADDRGP4 cg+107636
ADDRGP4 cg+40
INDIRP4
CNSTI4 44
ADDP4
INDIRB
ASGNB 468
line 955
;955:		cg.physicsTime = cg.nextSnap->serverTime;
ADDRGP4 cg+107612
ADDRGP4 cg+40
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 956
;956:	} else {
ADDRGP4 $723
JUMPV
LABELV $722
line 957
;957:		cg.predictedPlayerState = cg.snap->ps;
ADDRGP4 cg+107636
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
INDIRB
ASGNB 468
line 958
;958:		cg.physicsTime = cg.snap->serverTime;
ADDRGP4 cg+107612
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 959
;959:	}
LABELV $723
line 961
;960:
;961:	cg_pmove.pmove_fixed = cgs.pmove_fixed;
ADDRGP4 cg_pmove+208
ADDRGP4 cgs+149896
INDIRI4
ASGNI4
line 962
;962:	cg_pmove.pmove_msec = cgs.pmove_msec;
ADDRGP4 cg_pmove+212
ADDRGP4 cgs+149900
INDIRI4
ASGNI4
line 965
;963:
;964:	// clean event stack
;965:	eventStack = 0;
ADDRGP4 eventStack
CNSTI4 0
ASGNI4
line 968
;966:	
;967:	// run cmds
;968:	moved = qfalse;
ADDRLP4 480
CNSTI4 0
ASGNI4
line 970
;969:
;970:	cg_pmove.pmove_fixed = cgs.pmove_fixed;
ADDRGP4 cg_pmove+208
ADDRGP4 cgs+149896
INDIRI4
ASGNI4
line 971
;971:	cg_pmove.pmove_msec = cgs.pmove_msec;
ADDRGP4 cg_pmove+212
ADDRGP4 cgs+149900
INDIRI4
ASGNI4
line 991
;972:
;973:	// Like the comments described above, a player's state is entirely
;974:	// re-predicted from the last valid snapshot every client frame, which
;975:	// can be really, really, really slow.  Every old command has to be
;976:	// run again.  For every client frame that is *not* directly after a
;977:	// snapshot, this is unnecessary, since we have no new information.
;978:	// For those, we'll play back the predictions from the last frame and
;979:	// predict only the newest commands.  Essentially, we'll be doing
;980:	// an incremental predict instead of a full predict.
;981:	//
;982:	// If we have a new snapshot, we can compare its player state's command
;983:	// time to the command times in the queue to find a match.  If we find
;984:	// a matching state, and the predicted version has not deviated, we can
;985:	// use the predicted state as a base - and also do an incremental predict.
;986:	//
;987:	// With this method, we get incremental predicts on every client frame
;988:	// except a frame following a new snapshot in which there was a prediction
;989:	// error.  This yeilds anywhere from a 15% to 40% performance increase,
;990:	// depending on how much of a bottleneck the CPU is.
;991:	if( 1 /* cg_optimizePrediction.integer */ ) {
line 992
;992:		if( cg.nextFrameTeleport || cg.thisFrameTeleport ) {
ADDRGP4 cg+107596
INDIRI4
CNSTI4 0
NEI4 $749
ADDRGP4 cg+107592
INDIRI4
CNSTI4 0
EQI4 $745
LABELV $749
line 994
;993:			// do a full predict
;994:			cg.lastPredictedCommand = 0;
ADDRGP4 cg+126100
CNSTI4 0
ASGNI4
line 995
;995:			cg.stateTail = cg.stateHead;
ADDRGP4 cg+157000
ADDRGP4 cg+156996
INDIRI4
ASGNI4
line 996
;996:			predictCmd = current - CMD_BACKUP + 1;
ADDRLP4 484
ADDRLP4 476
INDIRI4
CNSTI4 64
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 997
;997:		}
ADDRGP4 $746
JUMPV
LABELV $745
line 1000
;998:		// cg.physicsTime is the current snapshot's serverTime if it's the same
;999:		// as the last one
;1000:		else if( cg.physicsTime == cg.lastServerTime ) {
ADDRGP4 cg+107612
INDIRI4
ADDRGP4 cg+126104
INDIRI4
NEI4 $753
line 1002
;1001:			// we have no new information, so do an incremental predict
;1002:			predictCmd = cg.lastPredictedCommand + 1;
ADDRLP4 484
ADDRGP4 cg+126100
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1003
;1003:		} else {
ADDRGP4 $754
JUMPV
LABELV $753
line 1007
;1004:			// we have a new snapshot
;1005:			int i;
;1006:			int errorcode;
;1007:			qboolean error = qtrue;
ADDRLP4 552
CNSTI4 1
ASGNI4
line 1010
;1008:
;1009:			// loop through the saved states queue
;1010:			for( i = cg.stateHead; i != cg.stateTail; i = ( i + 1 ) % NUM_SAVED_STATES ) {
ADDRLP4 544
ADDRGP4 cg+156996
INDIRI4
ASGNI4
ADDRGP4 $761
JUMPV
LABELV $758
line 1013
;1011:				// if we find a predicted state whose commandTime matches the snapshot
;1012:				// player state's commandTime
;1013:				if( cg.savedPmoveStates[ i ].commandTime != cg.predictedPlayerState.commandTime ) {
ADDRLP4 544
INDIRI4
CNSTI4 468
MULI4
ADDRGP4 cg+126108
ADDP4
INDIRI4
ADDRGP4 cg+107636
INDIRI4
EQI4 $764
line 1014
;1014:					continue;
ADDRGP4 $759
JUMPV
LABELV $764
line 1017
;1015:				}
;1016:				// make sure the state differences are acceptable
;1017:				errorcode = CG_IsUnacceptableError( &cg.predictedPlayerState, &cg.savedPmoveStates[ i ], &moved );
ADDRGP4 cg+107636
ARGP4
ADDRLP4 544
INDIRI4
CNSTI4 468
MULI4
ADDRGP4 cg+126108
ADDP4
ARGP4
ADDRLP4 480
ARGP4
ADDRLP4 556
ADDRGP4 CG_IsUnacceptableError
CALLI4
ASGNI4
ADDRLP4 548
ADDRLP4 556
INDIRI4
ASGNI4
line 1018
;1018:				if ( errorcode ) {
ADDRLP4 548
INDIRI4
CNSTI4 0
EQI4 $770
line 1019
;1019:					if( cg_showmiss.integer > 1 )
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 1
LEI4 $760
line 1020
;1020:						CG_Printf( "errorcode %d at %d\n", errorcode, cg.time );
ADDRGP4 $775
ARGP4
ADDRLP4 548
INDIRI4
ARGI4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 1021
;1021:					break;
ADDRGP4 $760
JUMPV
LABELV $770
line 1025
;1022:				}
;1023:  
;1024:				// this one is almost exact, so we'll copy it in as the starting point
;1025:				*cg_pmove.ps = cg.savedPmoveStates[ i ];
ADDRGP4 cg_pmove
INDIRP4
ADDRLP4 544
INDIRI4
CNSTI4 468
MULI4
ADDRGP4 cg+126108
ADDP4
INDIRB
ASGNB 468
line 1027
;1026:				// advance the head
;1027:				cg.stateHead = ( i + 1 ) % NUM_SAVED_STATES;
ADDRGP4 cg+156996
ADDRLP4 544
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 66
MODI4
ASGNI4
line 1030
;1028:  
;1029:				// set the next command to predict
;1030:				predictCmd = cg.lastPredictedCommand + 1;
ADDRLP4 484
ADDRGP4 cg+126100
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1033
;1031:  
;1032:				// a saved state matched, so flag it
;1033:				error = qfalse;
ADDRLP4 552
CNSTI4 0
ASGNI4
line 1034
;1034:				break;
ADDRGP4 $760
JUMPV
LABELV $759
line 1010
ADDRLP4 544
ADDRLP4 544
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 66
MODI4
ASGNI4
LABELV $761
ADDRLP4 544
INDIRI4
ADDRGP4 cg+157000
INDIRI4
NEI4 $758
LABELV $760
line 1038
;1035:			}
;1036:
;1037:			// if no saved states matched
;1038:			if ( error ) {
ADDRLP4 552
INDIRI4
CNSTI4 0
EQI4 $780
line 1040
;1039:				// do a full predict
;1040:				cg.lastPredictedCommand = 0;
ADDRGP4 cg+126100
CNSTI4 0
ASGNI4
line 1041
;1041:				cg.stateTail = cg.stateHead;
ADDRGP4 cg+157000
ADDRGP4 cg+156996
INDIRI4
ASGNI4
line 1042
;1042:				predictCmd = current - CMD_BACKUP + 1;
ADDRLP4 484
ADDRLP4 476
INDIRI4
CNSTI4 64
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 1043
;1043:			}
LABELV $780
line 1044
;1044:		}
LABELV $754
LABELV $746
line 1047
;1045:		// keep track of the server time of the last snapshot so we
;1046:		// know when we're starting from a new one in future calls
;1047:		cg.lastServerTime = cg.physicsTime;
ADDRGP4 cg+126104
ADDRGP4 cg+107612
INDIRI4
ASGNI4
line 1048
;1048:		stateIndex = cg.stateHead;
ADDRLP4 4
ADDRGP4 cg+156996
INDIRI4
ASGNI4
line 1049
;1049:	}
LABELV $743
line 1051
;1050:
;1051:	cmdNum = current - CMD_BACKUP + 1;
ADDRLP4 0
ADDRLP4 476
INDIRI4
CNSTI4 64
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 1052
;1052:	if ( cmdNum < 0 ) // can happen on first spawn
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $793
line 1053
;1053:		cmdNum = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1058
;1054:
;1055:	// run cmds
;1056:	// moved = qfalse;
;1057:
;1058:	for ( /* cmdNum = current - CMD_BACKUP + 1 */; cmdNum <= current ; cmdNum++ ) {
ADDRGP4 $793
JUMPV
LABELV $790
line 1060
;1059:		// get the command
;1060:		trap_GetUserCmd( cmdNum, &cg_pmove.cmd );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 cg_pmove+4
ARGP4
ADDRGP4 trap_GetUserCmd
CALLI4
pop
line 1062
;1061:
;1062:		if ( cgs.pmove_fixed ) {
ADDRGP4 cgs+149896
INDIRI4
CNSTI4 0
EQI4 $795
line 1063
;1063:			PM_UpdateViewAngles( cg_pmove.ps, &cg_pmove.cmd );
ADDRGP4 cg_pmove
INDIRP4
ARGP4
ADDRGP4 cg_pmove+4
ARGP4
ADDRGP4 PM_UpdateViewAngles
CALLV
pop
line 1064
;1064:		}
LABELV $795
line 1067
;1065:
;1066:		// don't do anything if the time is before the snapshot player time
;1067:		if ( cg_pmove.cmd.serverTime <= cg.predictedPlayerState.commandTime ) {
ADDRGP4 cg_pmove+4
INDIRI4
ADDRGP4 cg+107636
INDIRI4
GTI4 $799
line 1068
;1068:			continue;
ADDRGP4 $791
JUMPV
LABELV $799
line 1072
;1069:		}
;1070:
;1071:		// don't do anything if the command was from a previous map_restart
;1072:		if ( cg_pmove.cmd.serverTime > latestCmd.serverTime ) {
ADDRGP4 cg_pmove+4
INDIRI4
ADDRLP4 488
INDIRI4
LEI4 $803
line 1073
;1073:			continue;
ADDRGP4 $791
JUMPV
LABELV $803
line 1081
;1074:		}
;1075:
;1076:		// check for a prediction error from last frame
;1077:		// on a lan, this will often be the exact value
;1078:		// from the snapshot, but on a wan we will have
;1079:		// to predict several commands to get to the point
;1080:		// we want to compare
;1081:		if ( cg.predictedPlayerState.commandTime == oldPlayerState.commandTime ) {
ADDRGP4 cg+107636
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $806
line 1085
;1082:			vec3_t	delta;
;1083:			float	len;
;1084:
;1085:			if ( cg.thisFrameTeleport ) {
ADDRGP4 cg+107592
INDIRI4
CNSTI4 0
EQI4 $809
line 1087
;1086:				// a teleport will not cause an error decay
;1087:				VectorClear( cg.predictedError );
ADDRGP4 cg+108852
CNSTF4 0
ASGNF4
ADDRGP4 cg+108852+4
CNSTF4 0
ASGNF4
ADDRGP4 cg+108852+8
CNSTF4 0
ASGNF4
line 1088
;1088:				if ( cg_showmiss.integer ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $817
line 1089
;1089:					CG_Printf( "PredictionTeleport\n" );
ADDRGP4 $820
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1090
;1090:				}
LABELV $817
line 1091
;1091:				cg.thisFrameTeleport = qfalse;
ADDRGP4 cg+107592
CNSTI4 0
ASGNI4
line 1094
;1092:
;1093:				// delay prediction for some time or until first server event
;1094:				cg.allowPickupPrediction = cg.time + PICKUP_PREDICTION_DELAY;
ADDRGP4 cg+157012
ADDRGP4 cg+107604
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 1095
;1095:			} else {
ADDRGP4 $810
JUMPV
LABELV $809
line 1097
;1096:				vec3_t adjusted, new_angles;
;1097:				CG_AdjustPositionForMover( cg.predictedPlayerState.origin, 
ADDRGP4 cg+107636+20
ARGP4
ADDRGP4 cg+107636+68
INDIRI4
ARGI4
ADDRGP4 cg+107612
INDIRI4
ARGI4
ADDRGP4 cg+107608
INDIRI4
ARGI4
ADDRLP4 560
ARGP4
ADDRGP4 cg+107636+152
ARGP4
ADDRLP4 572
ARGP4
ADDRGP4 CG_AdjustPositionForMover
CALLV
pop
line 1100
;1098:					cg.predictedPlayerState.groundEntityNum, cg.physicsTime, cg.oldTime, adjusted, cg.predictedPlayerState.viewangles, new_angles);
;1099:
;1100:				if ( cg_showmiss.integer ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $832
line 1101
;1101:					if ( !VectorCompare( oldPlayerState.origin, adjusted ) ) {
ADDRLP4 8+20
ARGP4
ADDRLP4 560
ARGP4
ADDRLP4 584
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 584
INDIRI4
CNSTI4 0
NEI4 $835
line 1102
;1102:						CG_Printf( "prediction error\n" );
ADDRGP4 $838
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1103
;1103:					}
LABELV $835
line 1104
;1104:				}
LABELV $832
line 1105
;1105:				VectorSubtract( oldPlayerState.origin, adjusted, delta );
ADDRLP4 544
ADDRLP4 8+20
INDIRF4
ADDRLP4 560
INDIRF4
SUBF4
ASGNF4
ADDRLP4 544+4
ADDRLP4 8+20+4
INDIRF4
ADDRLP4 560+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 544+8
ADDRLP4 8+20+8
INDIRF4
ADDRLP4 560+8
INDIRF4
SUBF4
ASGNF4
line 1106
;1106:				len = VectorLengthSquared( delta );
ADDRLP4 544
ARGP4
ADDRLP4 584
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 556
ADDRLP4 584
INDIRF4
ASGNF4
line 1107
;1107:				if ( len > (0.01f * 0.01f) ) {
ADDRLP4 556
INDIRF4
CNSTF4 953267991
LEF4 $848
line 1108
;1108:					if ( cg_showmiss.integer ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $850
line 1109
;1109:						CG_Printf( "Prediction miss: %f\n", sqrt( len ) );
ADDRLP4 556
INDIRF4
ARGF4
ADDRLP4 588
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRGP4 $853
ARGP4
ADDRLP4 588
INDIRF4
ARGF4
ADDRGP4 CG_Printf
CALLV
pop
line 1110
;1110:					}
LABELV $850
line 1111
;1111:					if ( cg_errorDecay.integer ) {
ADDRGP4 cg_errorDecay+12
INDIRI4
CNSTI4 0
EQI4 $854
line 1115
;1112:						int		t;
;1113:						float	f;
;1114:
;1115:						t = cg.time - cg.predictedErrorTime;
ADDRLP4 592
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+108848
INDIRI4
SUBI4
ASGNI4
line 1116
;1116:						f = ( cg_errorDecay.value - t ) / cg_errorDecay.value;
ADDRLP4 588
ADDRGP4 cg_errorDecay+8
INDIRF4
ADDRLP4 592
INDIRI4
CVIF4 4
SUBF4
ADDRGP4 cg_errorDecay+8
INDIRF4
DIVF4
ASGNF4
line 1117
;1117:						if ( f < 0 ) {
ADDRLP4 588
INDIRF4
CNSTF4 0
GEF4 $861
line 1118
;1118:							f = 0;
ADDRLP4 588
CNSTF4 0
ASGNF4
line 1119
;1119:						} else
ADDRGP4 $862
JUMPV
LABELV $861
line 1120
;1120:						if ( f > 0 && cg_showmiss.integer ) {
ADDRLP4 588
INDIRF4
CNSTF4 0
LEF4 $863
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $863
line 1121
;1121:							CG_Printf("Double prediction decay: %f\n", f);
ADDRGP4 $866
ARGP4
ADDRLP4 588
INDIRF4
ARGF4
ADDRGP4 CG_Printf
CALLV
pop
line 1122
;1122:						}
LABELV $863
LABELV $862
line 1123
;1123:						VectorScale( cg.predictedError, f, cg.predictedError );
ADDRGP4 cg+108852
ADDRGP4 cg+108852
INDIRF4
ADDRLP4 588
INDIRF4
MULF4
ASGNF4
ADDRGP4 cg+108852+4
ADDRGP4 cg+108852+4
INDIRF4
ADDRLP4 588
INDIRF4
MULF4
ASGNF4
ADDRGP4 cg+108852+8
ADDRGP4 cg+108852+8
INDIRF4
ADDRLP4 588
INDIRF4
MULF4
ASGNF4
line 1124
;1124:					} else {
ADDRGP4 $855
JUMPV
LABELV $854
line 1125
;1125:						VectorClear( cg.predictedError );
ADDRGP4 cg+108852
CNSTF4 0
ASGNF4
ADDRGP4 cg+108852+4
CNSTF4 0
ASGNF4
ADDRGP4 cg+108852+8
CNSTF4 0
ASGNF4
line 1126
;1126:					}
LABELV $855
line 1127
;1127:					VectorAdd( delta, cg.predictedError, cg.predictedError );
ADDRGP4 cg+108852
ADDRLP4 544
INDIRF4
ADDRGP4 cg+108852
INDIRF4
ADDF4
ASGNF4
ADDRGP4 cg+108852+4
ADDRLP4 544+4
INDIRF4
ADDRGP4 cg+108852+4
INDIRF4
ADDF4
ASGNF4
ADDRGP4 cg+108852+8
ADDRLP4 544+8
INDIRF4
ADDRGP4 cg+108852+8
INDIRF4
ADDF4
ASGNF4
line 1128
;1128:					cg.predictedErrorTime = cg.oldTime;
ADDRGP4 cg+108848
ADDRGP4 cg+107608
INDIRI4
ASGNI4
line 1129
;1129:				}
LABELV $848
line 1130
;1130:			}
LABELV $810
line 1131
;1131:		}
LABELV $806
line 1135
;1132:
;1133:		// don't predict gauntlet firing, which is only supposed to happen
;1134:		// when it actually inflicts damage
;1135:		cg_pmove.gauntletHit = qfalse;
ADDRGP4 cg_pmove+36
CNSTI4 0
ASGNI4
line 1137
;1136:
;1137:		if ( cg_pmove.pmove_fixed ) {
ADDRGP4 cg_pmove+208
INDIRI4
CNSTI4 0
EQI4 $897
line 1138
;1138:			cg_pmove.cmd.serverTime = ((cg_pmove.cmd.serverTime + cg_pmove.pmove_msec-1) / cg_pmove.pmove_msec) * cg_pmove.pmove_msec;
ADDRGP4 cg_pmove+4
ADDRGP4 cg_pmove+4
INDIRI4
ADDRGP4 cg_pmove+212
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRGP4 cg_pmove+212
INDIRI4
DIVI4
ADDRGP4 cg_pmove+212
INDIRI4
MULI4
ASGNI4
line 1139
;1139:		}
LABELV $897
line 1145
;1140:#if 0
;1141:		if ( !cg_optimizePrediction.integer ) {
;1142:			Pmove (&cg_pmove);
;1143:		} else 
;1144:#endif
;1145:		if ( /*cg_optimizePrediction.integer && */ ( cmdNum >= predictCmd || ( stateIndex + 1 ) % NUM_SAVED_STATES == cg.stateHead ) ) {
ADDRLP4 0
INDIRI4
ADDRLP4 484
INDIRI4
GEI4 $908
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 66
MODI4
ADDRGP4 cg+156996
INDIRI4
NEI4 $905
LABELV $908
line 1147
;1146:
;1147:			Pmove( &cg_pmove );
ADDRGP4 cg_pmove
ARGP4
ADDRGP4 Pmove
CALLV
pop
line 1150
;1148:
;1149:			// add push trigger movement effects
;1150:			CG_TouchTriggerPrediction();
ADDRGP4 CG_TouchTriggerPrediction
CALLV
pop
line 1153
;1151:
;1152:			// check for expired powerups etc.
;1153:			CG_CheckTimers();
ADDRGP4 CG_CheckTimers
CALLV
pop
line 1156
;1154:
;1155:			// record the last predicted command
;1156:			cg.lastPredictedCommand = cmdNum;
ADDRGP4 cg+126100
ADDRLP4 0
INDIRI4
ASGNI4
line 1159
;1157: 
;1158:			// if we haven't run out of space in the saved states queue
;1159:			if( ( stateIndex + 1 ) % NUM_SAVED_STATES != cg.stateHead ) {
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 66
MODI4
ADDRGP4 cg+156996
INDIRI4
EQI4 $906
line 1162
;1160:				// save the state for the false case ( of cmdNum >= predictCmd )
;1161:				// in later calls to this function
;1162:				cg.savedPmoveStates[ stateIndex ] = *cg_pmove.ps;
ADDRLP4 4
INDIRI4
CNSTI4 468
MULI4
ADDRGP4 cg+126108
ADDP4
ADDRGP4 cg_pmove
INDIRP4
INDIRB
ASGNB 468
line 1163
;1163:				stateIndex = ( stateIndex + 1 ) % NUM_SAVED_STATES;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 66
MODI4
ASGNI4
line 1164
;1164:				cg.stateTail = stateIndex;
ADDRGP4 cg+157000
ADDRLP4 4
INDIRI4
ASGNI4
line 1165
;1165:			}
line 1166
;1166:		} else {
ADDRGP4 $906
JUMPV
LABELV $905
line 1167
;1167:			*cg_pmove.ps = cg.savedPmoveStates[ stateIndex ];
ADDRGP4 cg_pmove
INDIRP4
ADDRLP4 4
INDIRI4
CNSTI4 468
MULI4
ADDRGP4 cg+126108
ADDP4
INDIRB
ASGNB 468
line 1168
;1168:			stateIndex = ( stateIndex + 1 ) % NUM_SAVED_STATES;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 66
MODI4
ASGNI4
line 1169
;1169:		}
LABELV $906
line 1171
;1170:
;1171:		moved = qtrue;
ADDRLP4 480
CNSTI4 1
ASGNI4
line 1172
;1172:	}
LABELV $791
line 1058
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $793
ADDRLP4 0
INDIRI4
ADDRLP4 476
INDIRI4
LEI4 $790
line 1174
;1173:
;1174:	if ( cg_showmiss.integer > 3 ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 3
LEI4 $916
line 1175
;1175:		CG_Printf( "[%i : %i] ", cg_pmove.cmd.serverTime, cg.time );
ADDRGP4 $919
ARGP4
ADDRGP4 cg_pmove+4
INDIRI4
ARGI4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 1176
;1176:	}
LABELV $916
line 1178
;1177:
;1178:	if ( !moved ) {
ADDRLP4 480
INDIRI4
CNSTI4 0
NEI4 $922
line 1179
;1179:		if ( cg_showmiss.integer ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $924
line 1180
;1180:			CG_Printf( "not moved\n" );
ADDRGP4 $927
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1181
;1181:		}
LABELV $924
line 1183
;1182:		// clean event stack
;1183:		eventStack = 0;
ADDRGP4 eventStack
CNSTI4 0
ASGNI4
line 1184
;1184:		return;
ADDRGP4 $684
JUMPV
LABELV $922
line 1188
;1185:	}
;1186:
;1187:	// adjust for the movement of the groundentity
;1188:	CG_AdjustPositionForMover( cg.predictedPlayerState.origin, cg.predictedPlayerState.groundEntityNum, 
ADDRGP4 cg+107636+20
ARGP4
ADDRGP4 cg+107636+68
INDIRI4
ARGI4
ADDRGP4 cg+107612
INDIRI4
ARGI4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRGP4 cg+107636+20
ARGP4
ADDRGP4 cg+107636+152
ARGP4
ADDRGP4 cg+107636+152
ARGP4
ADDRGP4 CG_AdjustPositionForMover
CALLV
pop
line 1192
;1189:		cg.physicsTime, cg.time, cg.predictedPlayerState.origin, 
;1190:		cg.predictedPlayerState.viewangles, cg.predictedPlayerState.viewangles );
;1191:
;1192:	if ( cg_showmiss.integer ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $940
line 1193
;1193:		if ( cg.predictedPlayerState.eventSequence > oldPlayerState.eventSequence + MAX_PS_EVENTS ) {
ADDRGP4 cg+107636+108
INDIRI4
ADDRLP4 8+108
INDIRI4
CNSTI4 2
ADDI4
LEI4 $943
line 1194
;1194:			CG_Printf( "WARNING: dropped event\n" );
ADDRGP4 $948
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1195
;1195:		}
LABELV $943
line 1196
;1196:	}
LABELV $940
line 1199
;1197:
;1198:	// fire events and other transition triggered things
;1199:	CG_TransitionPlayerState( &cg.predictedPlayerState, &oldPlayerState );
ADDRGP4 cg+107636
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 CG_TransitionPlayerState
CALLV
pop
line 1201
;1200:
;1201:	if ( cg_showmiss.integer ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $950
line 1202
;1202:		if ( cg.eventSequence > cg.predictedPlayerState.eventSequence ) {
ADDRGP4 cg+108864
INDIRI4
ADDRGP4 cg+107636+108
INDIRI4
LEI4 $953
line 1203
;1203:			CG_Printf( "WARNING: double event\n" );
ADDRGP4 $958
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1204
;1204:			cg.eventSequence = cg.predictedPlayerState.eventSequence;
ADDRGP4 cg+108864
ADDRGP4 cg+107636+108
INDIRI4
ASGNI4
line 1205
;1205:		}
LABELV $953
line 1206
;1206:	}
LABELV $950
line 1207
;1207:}
LABELV $684
endproc CG_PredictPlayerState 596 28
bss
export eventParm2
align 4
LABELV eventParm2
skip 64
export eventParms
align 4
LABELV eventParms
skip 64
export events
align 4
LABELV events
skip 64
export eventStack
align 4
LABELV eventStack
skip 4
align 4
LABELV cg_triggerEntities
skip 1024
align 4
LABELV cg_numTriggerEntities
skip 4
align 4
LABELV cg_solidEntities
skip 1024
align 4
LABELV cg_numSolidEntities
skip 4
align 4
LABELV cg_pmove
skip 224
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
import CG_ProcessSnapshots
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
import CG_LoadDeferredPlayers
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
LABELV $958
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 100
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $948
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 100
byte 1 114
byte 1 111
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $927
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $919
byte 1 91
byte 1 37
byte 1 105
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 93
byte 1 32
byte 1 0
align 1
LABELV $866
byte 1 68
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 100
byte 1 101
byte 1 99
byte 1 97
byte 1 121
byte 1 58
byte 1 32
byte 1 37
byte 1 102
byte 1 10
byte 1 0
align 1
LABELV $853
byte 1 80
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 102
byte 1 10
byte 1 0
align 1
LABELV $838
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 10
byte 1 0
align 1
LABELV $820
byte 1 80
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 84
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $775
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 99
byte 1 111
byte 1 100
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $721
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 101
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 80
byte 1 65
byte 1 67
byte 1 75
byte 1 69
byte 1 84
byte 1 95
byte 1 66
byte 1 65
byte 1 67
byte 1 75
byte 1 85
byte 1 80
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $683
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 91
byte 1 37
byte 1 105
byte 1 93
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 61
byte 1 62
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 0
align 1
LABELV $670
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 91
byte 1 37
byte 1 105
byte 1 93
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 61
byte 1 62
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 0
align 1
LABELV $654
byte 1 112
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 116
byte 1 91
byte 1 37
byte 1 105
byte 1 93
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 61
byte 1 62
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 0
align 1
LABELV $642
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 91
byte 1 37
byte 1 105
byte 1 93
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 61
byte 1 62
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 0
align 1
LABELV $605
byte 1 100
byte 1 109
byte 1 103
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 62
byte 1 61
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $582
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 80
byte 1 97
byte 1 114
byte 1 109
byte 1 115
byte 1 91
byte 1 37
byte 1 105
byte 1 93
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 61
byte 1 62
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $576
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 91
byte 1 37
byte 1 105
byte 1 93
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 61
byte 1 62
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $564
byte 1 101
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 61
byte 1 62
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $528
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 61
byte 1 62
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $516
byte 1 118
byte 1 101
byte 1 108
byte 1 111
byte 1 99
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 100
byte 1 101
byte 1 108
byte 1 116
byte 1 97
byte 1 58
byte 1 32
byte 1 37
byte 1 46
byte 1 50
byte 1 102
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $508
byte 1 111
byte 1 114
byte 1 105
byte 1 103
byte 1 105
byte 1 110
byte 1 32
byte 1 100
byte 1 101
byte 1 108
byte 1 116
byte 1 97
byte 1 58
byte 1 32
byte 1 37
byte 1 46
byte 1 50
byte 1 102
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $264
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 95
byte 1 109
byte 1 101
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $263
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 95
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $174
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 100
byte 1 114
byte 1 111
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 0
