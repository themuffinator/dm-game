data
export pm_stopspeed
align 4
LABELV pm_stopspeed
byte 4 1120403456
export pm_duckScale
align 4
LABELV pm_duckScale
byte 4 1048576000
export pm_swimScale
align 4
LABELV pm_swimScale
byte 4 1056964608
export pm_wadeScale
align 4
LABELV pm_wadeScale
byte 4 1060320051
export pm_accelerate
align 4
LABELV pm_accelerate
byte 4 1092616192
export pm_airaccelerate
align 4
LABELV pm_airaccelerate
byte 4 1065353216
export pm_wateraccelerate
align 4
LABELV pm_wateraccelerate
byte 4 1082130432
export pm_flyaccelerate
align 4
LABELV pm_flyaccelerate
byte 4 1090519040
export pm_friction
align 4
LABELV pm_friction
byte 4 1086324736
export pm_waterfriction
align 4
LABELV pm_waterfriction
byte 4 1065353216
export pm_flightfriction
align 4
LABELV pm_flightfriction
byte 4 1077936128
export pm_spectatorfriction
align 4
LABELV pm_spectatorfriction
byte 4 1084227584
export c_pmove
align 4
LABELV c_pmove
byte 4 0
align 4
LABELV pm_respawntimer
byte 4 0
export PM_AddEvent
code
proc PM_AddEvent 0 16
file "..\..\..\..\code\bgame\bg_pmove.c"
line 42
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// bg_pmove.c -- both games player movement code
;4:// takes a playerstate and a usercmd as input and returns a modifed playerstate
;5:
;6:#include "../qcommon/q_shared.h"
;7:#include "../bgame/bg_public.h"
;8:#include "../bgame/bg_local.h"
;9:
;10:pmove_t		*pm;
;11:pml_t		pml;
;12:
;13:// movement parameters
;14:float	pm_stopspeed = 100.0f;
;15:float	pm_duckScale = 0.25f;
;16:float	pm_swimScale = 0.50f;
;17:float	pm_wadeScale = 0.70f;
;18:
;19:float	pm_accelerate = 10.0f;
;20:float	pm_airaccelerate = 1.0f;
;21:float	pm_wateraccelerate = 4.0f;
;22:float	pm_flyaccelerate = 8.0f;
;23:
;24:float	pm_friction = 6.0f;
;25:float	pm_waterfriction = 1.0f;
;26:float	pm_flightfriction = 3.0f;
;27:float	pm_spectatorfriction = 5.0f;
;28:
;29:int		c_pmove = 0;
;30:
;31:#define NO_RESPAWN_OVERBOUNCE 250
;32:
;33:static int pm_respawntimer = 0;
;34:
;35:
;36:/*
;37:===============
;38:PM_AddEvent
;39:
;40:===============
;41:*/
;42:void PM_AddEvent( int newEvent ) {
line 43
;43:	BG_AddPredictableEventToPlayerstate( newEvent, 0, pm->ps, -1 );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 pm
INDIRP4
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 BG_AddPredictableEventToPlayerstate
CALLV
pop
line 44
;44:}
LABELV $42
endproc PM_AddEvent 0 16
export PM_AddTouchEnt
proc PM_AddTouchEnt 12 0
line 52
;45:
;46:
;47:/*
;48:===============
;49:PM_AddTouchEnt
;50:===============
;51:*/
;52:void PM_AddTouchEnt( int entityNum ) {
line 55
;53:	int		i;
;54:
;55:	if ( entityNum == ENTITYNUM_WORLD ) {
ADDRFP4 0
INDIRI4
CNSTI4 1022
NEI4 $44
line 56
;56:		return;
ADDRGP4 $43
JUMPV
LABELV $44
line 59
;57:	}
;58:
;59:	if ( pm->numtouch >= MAXTOUCH ) {
ADDRGP4 pm
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 32
LTI4 $46
line 60
;60:		return;
ADDRGP4 $43
JUMPV
LABELV $46
line 64
;61:	}
;62:
;63:	// see if it is already added
;64:	for ( i = 0 ; i < pm->numtouch ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $51
JUMPV
LABELV $48
line 65
;65:		if ( pm->touchents[ i ] == entityNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pm
INDIRP4
CNSTI4 48
ADDP4
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $52
line 66
;66:			return;
ADDRGP4 $43
JUMPV
LABELV $52
line 68
;67:		}
;68:	}
LABELV $49
line 64
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $51
ADDRLP4 0
INDIRI4
ADDRGP4 pm
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
LTI4 $48
line 71
;69:
;70:	// add it
;71:	pm->touchents[pm->numtouch] = entityNum;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 48
ADDP4
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 72
;72:	pm->numtouch++;
ADDRLP4 8
ADDRGP4 pm
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 73
;73:}
LABELV $43
endproc PM_AddTouchEnt 12 0
proc PM_StartTorsoAnim 4 0
line 81
;74:
;75:
;76:/*
;77:===================
;78:PM_StartTorsoAnim
;79:===================
;80:*/
;81:static void PM_StartTorsoAnim( int anim ) {
line 82
;82:	if ( pm->ps->pm_type >= PM_DEAD ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
LTI4 $55
line 83
;83:		return;
ADDRGP4 $54
JUMPV
LABELV $55
line 85
;84:	}
;85:	pm->ps->torsoAnim = ( ( pm->ps->torsoAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT )
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 128
BXORI4
ADDRFP4 0
INDIRI4
BORI4
ASGNI4
line 87
;86:		| anim;
;87:}
LABELV $54
endproc PM_StartTorsoAnim 4 0
proc PM_StartLegsAnim 4 0
line 88
;88:static void PM_StartLegsAnim( int anim ) {
line 89
;89:	if ( pm->ps->pm_type >= PM_DEAD ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
LTI4 $58
line 90
;90:		return;
ADDRGP4 $57
JUMPV
LABELV $58
line 92
;91:	}
;92:	if ( pm->ps->legsTimer > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
LEI4 $60
line 93
;93:		return;		// a high priority animation is running
ADDRGP4 $57
JUMPV
LABELV $60
line 95
;94:	}
;95:	pm->ps->legsAnim = ( ( pm->ps->legsAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT )
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 128
BXORI4
ADDRFP4 0
INDIRI4
BORI4
ASGNI4
line 97
;96:		| anim;
;97:}
LABELV $57
endproc PM_StartLegsAnim 4 0
proc PM_ContinueLegsAnim 0 4
line 99
;98:
;99:static void PM_ContinueLegsAnim( int anim ) {
line 100
;100:	if ( ( pm->ps->legsAnim & ~ANIM_TOGGLEBIT ) == anim ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ADDRFP4 0
INDIRI4
NEI4 $63
line 101
;101:		return;
ADDRGP4 $62
JUMPV
LABELV $63
line 103
;102:	}
;103:	if ( pm->ps->legsTimer > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
LEI4 $65
line 104
;104:		return;		// a high priority animation is running
ADDRGP4 $62
JUMPV
LABELV $65
line 106
;105:	}
;106:	PM_StartLegsAnim( anim );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 PM_StartLegsAnim
CALLV
pop
line 107
;107:}
LABELV $62
endproc PM_ContinueLegsAnim 0 4
proc PM_ContinueTorsoAnim 0 4
line 109
;108:
;109:static void PM_ContinueTorsoAnim( int anim ) {
line 110
;110:	if ( ( pm->ps->torsoAnim & ~ANIM_TOGGLEBIT ) == anim ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ADDRFP4 0
INDIRI4
NEI4 $68
line 111
;111:		return;
ADDRGP4 $67
JUMPV
LABELV $68
line 113
;112:	}
;113:	if ( pm->ps->torsoTimer > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 0
LEI4 $70
line 114
;114:		return;		// a high priority animation is running
ADDRGP4 $67
JUMPV
LABELV $70
line 116
;115:	}
;116:	PM_StartTorsoAnim( anim );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 117
;117:}
LABELV $67
endproc PM_ContinueTorsoAnim 0 4
proc PM_ForceLegsAnim 0 4
line 119
;118:
;119:static void PM_ForceLegsAnim( int anim ) {
line 120
;120:	pm->ps->legsTimer = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 0
ASGNI4
line 121
;121:	PM_StartLegsAnim( anim );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 PM_StartLegsAnim
CALLV
pop
line 122
;122:}
LABELV $72
endproc PM_ForceLegsAnim 0 4
export PM_ClipVelocity
proc PM_ClipVelocity 24 0
line 132
;123:
;124:
;125:/*
;126:==================
;127:PM_ClipVelocity
;128:
;129:Slide off of the impacting surface
;130:==================
;131:*/
;132:void PM_ClipVelocity( vec3_t in, vec3_t normal, vec3_t out, float overbounce ) {
line 137
;133:	float	backoff;
;134:	float	change;
;135:	int		i;
;136:	
;137:	backoff = DotProduct (in, normal);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 16
INDIRP4
INDIRF4
MULF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 139
;138:	
;139:	if ( backoff < 0 ) {
ADDRLP4 8
INDIRF4
CNSTF4 0
GEF4 $74
line 140
;140:		backoff *= overbounce;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRFP4 12
INDIRF4
MULF4
ASGNF4
line 141
;141:	} else {
ADDRGP4 $75
JUMPV
LABELV $74
line 142
;142:		backoff /= overbounce;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRFP4 12
INDIRF4
DIVF4
ASGNF4
line 143
;143:	}
LABELV $75
line 145
;144:
;145:	for ( i=0 ; i<3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $76
line 146
;146:		change = normal[i]*backoff;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
MULF4
ASGNF4
line 147
;147:		out[i] = in[i] - change;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
SUBF4
ASGNF4
line 148
;148:	}
LABELV $77
line 145
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $76
line 149
;149:}
LABELV $73
endproc PM_ClipVelocity 24 0
export PM_SlideMove
proc PM_SlideMove 292 28
line 160
;150:
;151:
;152:/*
;153:==================
;154:PM_SlideMove
;155:
;156:Returns qtrue if the velocity was clipped in some way
;157:==================
;158:*/
;159:#define	MAX_CLIP_PLANES	5
;160:qboolean	PM_SlideMove( qboolean gravity ) {
line 176
;161:	int			bumpcount, numbumps;
;162:	vec3_t		dir;
;163:	float		d;
;164:	int			numplanes;
;165:	vec3_t		planes[MAX_CLIP_PLANES];
;166:	vec3_t		primal_velocity;
;167:	vec3_t		clipVelocity;
;168:	int			i, j, k;
;169:	trace_t	trace;
;170:	vec3_t		end;
;171:	float		time_left;
;172:	float		into;
;173:	vec3_t		endVelocity;
;174:	vec3_t		endClipVelocity;
;175:
;176:	numbumps = 4;
ADDRLP4 208
CNSTI4 4
ASGNI4
line 178
;177:
;178:	VectorCopy( pm->ps->velocity, primal_velocity );
ADDRLP4 212
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 180
;179:
;180:	if ( gravity ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $81
line 181
;181:		VectorCopy( pm->ps->velocity, endVelocity );
ADDRLP4 116
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 182
;182:		endVelocity[2] -= pm->ps->gravity * pml.frametime;
ADDRLP4 116+8
ADDRLP4 116+8
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pml+36
INDIRF4
MULF4
SUBF4
ASGNF4
line 183
;183:		pm->ps->velocity[2] = ( pm->ps->velocity[2] + endVelocity[2] ) * 0.5;
ADDRLP4 224
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 224
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 224
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 116+8
INDIRF4
ADDF4
CNSTF4 1056964608
MULF4
ASGNF4
line 184
;184:		primal_velocity[2] = endVelocity[2];
ADDRLP4 212+8
ADDRLP4 116+8
INDIRF4
ASGNF4
line 185
;185:		if ( pml.groundPlane ) {
ADDRGP4 pml+48
INDIRI4
CNSTI4 0
EQI4 $88
line 187
;186:			// slide along the ground plane
;187:			PM_ClipVelocity( pm->ps->velocity, pml.groundTrace.plane.normal,
ADDRLP4 228
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 228
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 228
INDIRP4
CNSTI4 32
ADDP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 189
;188:				pm->ps->velocity, OVERCLIP );
;189:		}
LABELV $88
line 190
;190:	}
LABELV $81
line 192
;191:
;192:	time_left = pml.frametime;
ADDRLP4 188
ADDRGP4 pml+36
INDIRF4
ASGNF4
line 195
;193:
;194:	// never turn against the ground plane
;195:	if ( pml.groundPlane ) {
ADDRGP4 pml+48
INDIRI4
CNSTI4 0
EQI4 $94
line 196
;196:		numplanes = 1;
ADDRLP4 96
CNSTI4 1
ASGNI4
line 197
;197:		VectorCopy( pml.groundTrace.plane.normal, planes[0] );
ADDRLP4 4
ADDRGP4 pml+52+24
INDIRB
ASGNB 12
line 198
;198:	}
ADDRGP4 $95
JUMPV
LABELV $94
line 199
;199:	else {
line 200
;200:		numplanes = 0;
ADDRLP4 96
CNSTI4 0
ASGNI4
line 201
;201:	}
LABELV $95
line 204
;202:
;203:	// never turn against original velocity
;204:	VectorNormalize2( pm->ps->velocity, planes[numplanes] );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 96
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRGP4 VectorNormalize2
CALLF4
pop
line 205
;205:	numplanes++;
ADDRLP4 96
ADDRLP4 96
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 207
;206:
;207:	for ( bumpcount = 0; bumpcount < numbumps; bumpcount++ ) {
ADDRLP4 204
CNSTI4 0
ASGNI4
ADDRGP4 $102
JUMPV
LABELV $99
line 210
;208:
;209:		// calculate position we are trying to move to
;210:		VectorMA( pm->ps->origin, time_left, pm->ps->velocity, end );
ADDRLP4 224
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 228
ADDRLP4 224
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 192
ADDRLP4 228
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 228
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 188
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 236
ADDRLP4 224
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 192+4
ADDRLP4 236
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 236
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 188
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 240
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 192+8
ADDRLP4 240
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 240
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 188
INDIRF4
MULF4
ADDF4
ASGNF4
line 213
;211:
;212:		// see if we can make it there
;213:		pm->trace( &trace, pm->ps->origin, pm->mins, pm->maxs, end, pm->ps->clientNum, pm->tracemask );
ADDRLP4 128
ARGP4
ADDRLP4 244
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 248
ADDRLP4 244
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 248
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 244
INDIRP4
CNSTI4 176
ADDP4
ARGP4
ADDRLP4 244
INDIRP4
CNSTI4 188
ADDP4
ARGP4
ADDRLP4 192
ARGP4
ADDRLP4 248
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 244
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 244
INDIRP4
CNSTI4 216
ADDP4
INDIRP4
CALLV
pop
line 215
;214:
;215:		if ( trace.allsolid ) {
ADDRLP4 128
INDIRI4
CNSTI4 0
EQI4 $105
line 217
;216:			// entity is completely trapped in another solid
;217:			pm->ps->velocity[2] = 0;	// don't build up falling damage, but allow sideways acceleration
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 0
ASGNF4
line 218
;218:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $80
JUMPV
LABELV $105
line 221
;219:		}
;220:
;221:		if ( trace.fraction > 0 ) {
ADDRLP4 128+8
INDIRF4
CNSTF4 0
LEF4 $107
line 223
;222:			// actually covered some distance
;223:			VectorCopy( trace.endpos, pm->ps->origin );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 128+12
INDIRB
ASGNB 12
line 224
;224:		}
LABELV $107
line 226
;225:
;226:		if ( trace.fraction == 1 ) {
ADDRLP4 128+8
INDIRF4
CNSTF4 1065353216
NEF4 $111
line 227
;227:			break;		// moved the entire distance
ADDRGP4 $101
JUMPV
LABELV $111
line 231
;228:		}
;229:
;230:		// save entity for contact
;231:		PM_AddTouchEnt( trace.entityNum );
ADDRLP4 128+52
INDIRI4
ARGI4
ADDRGP4 PM_AddTouchEnt
CALLV
pop
line 233
;232:
;233:		time_left -= time_left * trace.fraction;
ADDRLP4 188
ADDRLP4 188
INDIRF4
ADDRLP4 188
INDIRF4
ADDRLP4 128+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 235
;234:
;235:		if ( numplanes >= MAX_CLIP_PLANES ) {
ADDRLP4 96
INDIRI4
CNSTI4 5
LTI4 $116
line 237
;236:			// this shouldn't really happen
;237:			VectorClear( pm->ps->velocity );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 0
ASGNF4
line 238
;238:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $80
JUMPV
LABELV $116
line 246
;239:		}
;240:
;241:		//
;242:		// if this is the same plane we hit before, nudge velocity
;243:		// out along it, which fixes some epsilon issues with
;244:		// non-axial planes
;245:		//
;246:		for ( i = 0; i < numplanes; i++ ) {
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRGP4 $121
JUMPV
LABELV $118
line 247
;247:			if ( DotProduct( trace.plane.normal, planes[i] ) > 0.99 ) {
ADDRLP4 128+24
INDIRF4
ADDRLP4 80
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 128+24+4
INDIRF4
ADDRLP4 80
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 128+24+8
INDIRF4
ADDRLP4 80
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 1065185444
LEF4 $122
line 248
;248:				VectorAdd( trace.plane.normal, pm->ps->velocity, pm->ps->velocity );
ADDRLP4 260
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 260
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 128+24
INDIRF4
ADDRLP4 260
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 264
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 264
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 128+24+4
INDIRF4
ADDRLP4 264
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 268
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 268
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 128+24+8
INDIRF4
ADDRLP4 268
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDF4
ASGNF4
line 249
;249:				break;
ADDRGP4 $120
JUMPV
LABELV $122
line 251
;250:			}
;251:		}
LABELV $119
line 246
ADDRLP4 80
ADDRLP4 80
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $121
ADDRLP4 80
INDIRI4
ADDRLP4 96
INDIRI4
LTI4 $118
LABELV $120
line 252
;252:		if ( i < numplanes ) {
ADDRLP4 80
INDIRI4
ADDRLP4 96
INDIRI4
GEI4 $136
line 253
;253:			continue;
ADDRGP4 $100
JUMPV
LABELV $136
line 255
;254:		}
;255:		VectorCopy( trace.plane.normal, planes[numplanes] );
ADDRLP4 96
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ADDRLP4 128+24
INDIRB
ASGNB 12
line 256
;256:		numplanes++;
ADDRLP4 96
ADDRLP4 96
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 263
;257:
;258:		//
;259:		// modify velocity so it parallels all of the clip planes
;260:		//
;261:
;262:		// find a plane that it enters
;263:		for ( i = 0; i < numplanes; i++ ) {
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRGP4 $142
JUMPV
LABELV $139
line 264
;264:			into = DotProduct( pm->ps->velocity, planes[i] );
ADDRLP4 256
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 184
ADDRLP4 256
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 80
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 256
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 80
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 256
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 80
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 265
;265:			if ( into >= 0.1 ) {
ADDRLP4 184
INDIRF4
CNSTF4 1036831949
LTF4 $145
line 266
;266:				continue;		// move doesn't interact with the plane
ADDRGP4 $140
JUMPV
LABELV $145
line 270
;267:			}
;268:
;269:			// see how hard we are hitting things
;270:			if ( -into > pml.impactSpeed ) {
ADDRLP4 184
INDIRF4
NEGF4
ADDRGP4 pml+108
INDIRF4
LEF4 $147
line 271
;271:				pml.impactSpeed = -into;
ADDRGP4 pml+108
ADDRLP4 184
INDIRF4
NEGF4
ASGNF4
line 272
;272:			}
LABELV $147
line 275
;273:
;274:			// slide along the plane
;275:			PM_ClipVelocity( pm->ps->velocity, planes[i], clipVelocity, OVERCLIP );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 80
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 64
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 278
;276:
;277:			// slide along the plane
;278:			PM_ClipVelocity( endVelocity, planes[i], endClipVelocity, OVERCLIP );
ADDRLP4 116
ARGP4
ADDRLP4 80
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 104
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 281
;279:
;280:			// see if there is a second plane that the new move enters
;281:			for ( j = 0; j < numplanes; j++ ) {
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRGP4 $154
JUMPV
LABELV $151
line 282
;282:				if ( j == i ) {
ADDRLP4 76
INDIRI4
ADDRLP4 80
INDIRI4
NEI4 $155
line 283
;283:					continue;
ADDRGP4 $152
JUMPV
LABELV $155
line 285
;284:				}
;285:				if ( DotProduct( clipVelocity, planes[j] ) >= 0.1 ) {
ADDRLP4 64
INDIRF4
ADDRLP4 76
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 64+4
INDIRF4
ADDRLP4 76
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 64+8
INDIRF4
ADDRLP4 76
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 1036831949
LTF4 $157
line 286
;286:					continue;		// move doesn't interact with the plane
ADDRGP4 $152
JUMPV
LABELV $157
line 290
;287:				}
;288:
;289:				// try clipping the move to the plane
;290:				PM_ClipVelocity( clipVelocity, planes[j], clipVelocity, OVERCLIP );
ADDRLP4 64
ARGP4
ADDRLP4 76
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 64
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 291
;291:				PM_ClipVelocity( endClipVelocity, planes[j], endClipVelocity, OVERCLIP );
ADDRLP4 104
ARGP4
ADDRLP4 76
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 104
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 294
;292:
;293:				// see if it goes back into the first clip plane
;294:				if ( DotProduct( clipVelocity, planes[i] ) >= 0 ) {
ADDRLP4 64
INDIRF4
ADDRLP4 80
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 64+4
INDIRF4
ADDRLP4 80
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 64+8
INDIRF4
ADDRLP4 80
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 0
LTF4 $163
line 295
;295:					continue;
ADDRGP4 $152
JUMPV
LABELV $163
line 299
;296:				}
;297:
;298:				// slide the original velocity along the crease
;299:				CrossProduct( planes[i], planes[j], dir );
ADDRLP4 80
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 76
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 84
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 300
;300:				VectorNormalize( dir );
ADDRLP4 84
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 301
;301:				d = DotProduct( dir, pm->ps->velocity );
ADDRLP4 272
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 100
ADDRLP4 84
INDIRF4
ADDRLP4 272
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDRLP4 84+4
INDIRF4
ADDRLP4 272
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 84+8
INDIRF4
ADDRLP4 272
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 302
;302:				VectorScale( dir, d, clipVelocity );
ADDRLP4 64
ADDRLP4 84
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 84+4
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+8
ADDRLP4 84+8
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
line 304
;303:
;304:				CrossProduct( planes[i], planes[j], dir );
ADDRLP4 80
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 76
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 84
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 305
;305:				VectorNormalize( dir );
ADDRLP4 84
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 306
;306:				d = DotProduct( dir, endVelocity );
ADDRLP4 100
ADDRLP4 84
INDIRF4
ADDRLP4 116
INDIRF4
MULF4
ADDRLP4 84+4
INDIRF4
ADDRLP4 116+4
INDIRF4
MULF4
ADDF4
ADDRLP4 84+8
INDIRF4
ADDRLP4 116+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 307
;307:				VectorScale( dir, d, endClipVelocity );
ADDRLP4 104
ADDRLP4 84
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
ADDRLP4 104+4
ADDRLP4 84+4
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
ADDRLP4 104+8
ADDRLP4 84+8
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
line 310
;308:
;309:				// see if there is a third plane the the new move enters
;310:				for ( k = 0; k < numplanes; k++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $186
JUMPV
LABELV $183
line 311
;311:					if ( k == i || k == j ) {
ADDRLP4 0
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $189
ADDRLP4 0
INDIRI4
ADDRLP4 76
INDIRI4
NEI4 $187
LABELV $189
line 312
;312:						continue;
ADDRGP4 $184
JUMPV
LABELV $187
line 314
;313:					}
;314:					if ( DotProduct( clipVelocity, planes[k] ) >= 0.1 ) {
ADDRLP4 64
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 64+4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 64+8
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 1036831949
LTF4 $190
line 315
;315:						continue;		// move doesn't interact with the plane
ADDRGP4 $184
JUMPV
LABELV $190
line 319
;316:					}
;317:
;318:					// stop dead at a tripple plane interaction
;319:					VectorClear( pm->ps->velocity );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 0
ASGNF4
line 320
;320:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $80
JUMPV
LABELV $184
line 310
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $186
ADDRLP4 0
INDIRI4
ADDRLP4 96
INDIRI4
LTI4 $183
line 322
;321:				}
;322:			}
LABELV $152
line 281
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $154
ADDRLP4 76
INDIRI4
ADDRLP4 96
INDIRI4
LTI4 $151
line 325
;323:
;324:			// if we have fixed all interactions, try another move
;325:			VectorCopy( clipVelocity, pm->ps->velocity );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 64
INDIRB
ASGNB 12
line 326
;326:			VectorCopy( endClipVelocity, endVelocity );
ADDRLP4 116
ADDRLP4 104
INDIRB
ASGNB 12
line 327
;327:			break;
ADDRGP4 $141
JUMPV
LABELV $140
line 263
ADDRLP4 80
ADDRLP4 80
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $142
ADDRLP4 80
INDIRI4
ADDRLP4 96
INDIRI4
LTI4 $139
LABELV $141
line 329
;328:		}
;329:	}
LABELV $100
line 207
ADDRLP4 204
ADDRLP4 204
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $102
ADDRLP4 204
INDIRI4
ADDRLP4 208
INDIRI4
LTI4 $99
LABELV $101
line 331
;330:
;331:	if ( gravity ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $196
line 332
;332:		VectorCopy( endVelocity, pm->ps->velocity );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 116
INDIRB
ASGNB 12
line 333
;333:	}
LABELV $196
line 336
;334:
;335:	// don't change velocity if in a timer (FIXME: is this correct?)
;336:	if ( pm->ps->pm_time ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $198
line 337
;337:		VectorCopy( primal_velocity, pm->ps->velocity );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 212
INDIRB
ASGNB 12
line 338
;338:	}
LABELV $198
line 340
;339:
;340:	return ( bumpcount != 0 );
ADDRLP4 204
INDIRI4
CNSTI4 0
EQI4 $201
ADDRLP4 224
CNSTI4 1
ASGNI4
ADDRGP4 $202
JUMPV
LABELV $201
ADDRLP4 224
CNSTI4 0
ASGNI4
LABELV $202
ADDRLP4 224
INDIRI4
RETI4
LABELV $80
endproc PM_SlideMove 292 28
export PM_StepSlideMove
proc PM_StepSlideMove 132 28
line 350
;341:}
;342:
;343:
;344:/*
;345:==================
;346:PM_StepSlideMove
;347:
;348:==================
;349:*/
;350:void PM_StepSlideMove( qboolean gravity ) {
line 359
;351:	vec3_t		start_o, start_v;
;352:	//	vec3_t		down_o, down_v;
;353:	trace_t		trace;
;354:	//	float		down_dist, up_dist;
;355:	//	vec3_t		delta, delta2;
;356:	vec3_t		up, down;
;357:	float		stepSize;
;358:
;359:	VectorCopy( pm->ps->origin, start_o );
ADDRLP4 68
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 360
;360:	VectorCopy( pm->ps->velocity, start_v );
ADDRLP4 92
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 362
;361:
;362:	if ( PM_SlideMove( gravity ) == 0 ) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 108
ADDRGP4 PM_SlideMove
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $204
line 363
;363:		return;		// we got exactly where we wanted to go first try	
ADDRGP4 $203
JUMPV
LABELV $204
line 366
;364:	}
;365:
;366:	VectorCopy( start_o, down );
ADDRLP4 80
ADDRLP4 68
INDIRB
ASGNB 12
line 367
;367:	down[2] -= PM_STEP_HEIGHT;
ADDRLP4 80+8
ADDRLP4 80+8
INDIRF4
CNSTF4 1099956224
SUBF4
ASGNF4
line 368
;368:	pm->trace( &trace, start_o, pm->mins, pm->maxs, down, pm->ps->clientNum, pm->tracemask );
ADDRLP4 0
ARGP4
ADDRLP4 68
ARGP4
ADDRLP4 112
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
CNSTI4 176
ADDP4
ARGP4
ADDRLP4 112
INDIRP4
CNSTI4 188
ADDP4
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 112
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 112
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 112
INDIRP4
CNSTI4 216
ADDP4
INDIRP4
CALLV
pop
line 369
;369:	VectorSet( up, 0, 0, 1 );
ADDRLP4 56
CNSTF4 0
ASGNF4
ADDRLP4 56+4
CNSTF4 0
ASGNF4
ADDRLP4 56+8
CNSTF4 1065353216
ASGNF4
line 371
;370:	// never step up when you still have up velocity
;371:	if ( pm->ps->velocity[2] > 0 && ( trace.fraction == 1.0 ||
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 0
LEF4 $209
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $219
ADDRLP4 0+24
INDIRF4
ADDRLP4 56
INDIRF4
MULF4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 56+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+24+8
INDIRF4
ADDRLP4 56+8
INDIRF4
MULF4
ADDF4
CNSTF4 1060320051
GEF4 $209
LABELV $219
line 372
;372:		DotProduct( trace.plane.normal, up ) < 0.7 ) ) {
line 373
;373:		return;
ADDRGP4 $203
JUMPV
LABELV $209
line 379
;374:	}
;375:
;376:	//VectorCopy (pm->ps->origin, down_o);
;377:	//VectorCopy (pm->ps->velocity, down_v);
;378:
;379:	VectorCopy( start_o, up );
ADDRLP4 56
ADDRLP4 68
INDIRB
ASGNB 12
line 380
;380:	up[2] += PM_STEP_HEIGHT;
ADDRLP4 56+8
ADDRLP4 56+8
INDIRF4
CNSTF4 1099956224
ADDF4
ASGNF4
line 383
;381:
;382:	// test the player position if they were a stepheight higher
;383:	pm->trace( &trace, start_o, pm->mins, pm->maxs, up, pm->ps->clientNum, pm->tracemask );
ADDRLP4 0
ARGP4
ADDRLP4 68
ARGP4
ADDRLP4 116
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 116
INDIRP4
CNSTI4 176
ADDP4
ARGP4
ADDRLP4 116
INDIRP4
CNSTI4 188
ADDP4
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 116
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 116
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 116
INDIRP4
CNSTI4 216
ADDP4
INDIRP4
CALLV
pop
line 384
;384:	if ( trace.allsolid ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $221
line 385
;385:		if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $203
line 386
;386:			Com_Printf( "%i:bend can't step\n", c_pmove );
ADDRGP4 $225
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 387
;387:		}
line 388
;388:		return;		// can't step up
ADDRGP4 $203
JUMPV
LABELV $221
line 391
;389:	}
;390:
;391:	stepSize = trace.endpos[2] - start_o[2];
ADDRLP4 104
ADDRLP4 0+12+8
INDIRF4
ADDRLP4 68+8
INDIRF4
SUBF4
ASGNF4
line 393
;392:	// try slidemove from this position
;393:	VectorCopy( trace.endpos, pm->ps->origin );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 394
;394:	VectorCopy( start_v, pm->ps->velocity );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 92
INDIRB
ASGNB 12
line 396
;395:
;396:	PM_SlideMove( gravity );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 PM_SlideMove
CALLI4
pop
line 399
;397:
;398:	// push down the final amount
;399:	VectorCopy( pm->ps->origin, down );
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 400
;400:	down[2] -= stepSize;
ADDRLP4 80+8
ADDRLP4 80+8
INDIRF4
ADDRLP4 104
INDIRF4
SUBF4
ASGNF4
line 401
;401:	pm->trace( &trace, pm->ps->origin, pm->mins, pm->maxs, down, pm->ps->clientNum, pm->tracemask );
ADDRLP4 0
ARGP4
ADDRLP4 120
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 124
ADDRLP4 120
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 124
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 120
INDIRP4
CNSTI4 176
ADDP4
ARGP4
ADDRLP4 120
INDIRP4
CNSTI4 188
ADDP4
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 124
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 120
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 120
INDIRP4
CNSTI4 216
ADDP4
INDIRP4
CALLV
pop
line 402
;402:	if ( !trace.allsolid ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $231
line 403
;403:		VectorCopy( trace.endpos, pm->ps->origin );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 404
;404:	}
LABELV $231
line 405
;405:	if ( trace.fraction < 1.0 ) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
GEF4 $234
line 406
;406:		PM_ClipVelocity( pm->ps->velocity, trace.plane.normal, pm->ps->velocity, OVERCLIP );
ADDRLP4 128
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 128
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 0+24
ARGP4
ADDRLP4 128
INDIRP4
CNSTI4 32
ADDP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 407
;407:	}
LABELV $234
line 422
;408:
;409:#if 0
;410:	// if the down trace can trace back to the original position directly, don't step
;411:	pm->trace( &trace, pm->ps->origin, pm->mins, pm->maxs, start_o, pm->ps->clientNum, pm->tracemask );
;412:	if ( trace.fraction == 1.0 ) {
;413:		// use the original move
;414:		VectorCopy( down_o, pm->ps->origin );
;415:		VectorCopy( down_v, pm->ps->velocity );
;416:		if ( pm->debugLevel ) {
;417:			Com_Printf( "%i:bend\n", c_pmove );
;418:		}
;419:	}
;420:	else
;421:#endif
;422:	{
line 426
;423:		// use the step move
;424:		float	delta;
;425:
;426:		delta = pm->ps->origin[2] - start_o[2];
ADDRLP4 128
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 68+8
INDIRF4
SUBF4
ASGNF4
line 427
;427:		if ( delta > 2 && pm->ps->pm_type != PM_DEAD ) {
ADDRLP4 128
INDIRF4
CNSTF4 1073741824
LEF4 $239
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $239
line 428
;428:			if ( delta < 7 ) {
ADDRLP4 128
INDIRF4
CNSTF4 1088421888
GEF4 $241
line 429
;429:				PM_AddEvent( EV_STEP_4 );
CNSTI4 6
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 430
;430:			}
ADDRGP4 $242
JUMPV
LABELV $241
line 431
;431:			else if ( delta < 11 ) {
ADDRLP4 128
INDIRF4
CNSTF4 1093664768
GEF4 $243
line 432
;432:				PM_AddEvent( EV_STEP_8 );
CNSTI4 7
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 433
;433:			}
ADDRGP4 $244
JUMPV
LABELV $243
line 434
;434:			else if ( delta < 15 ) {
ADDRLP4 128
INDIRF4
CNSTF4 1097859072
GEF4 $245
line 435
;435:				PM_AddEvent( EV_STEP_12 );
CNSTI4 8
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 436
;436:			}
ADDRGP4 $246
JUMPV
LABELV $245
line 437
;437:			else {
line 438
;438:				PM_AddEvent( EV_STEP_16 );
CNSTI4 9
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 439
;439:			}
LABELV $246
LABELV $244
LABELV $242
line 440
;440:		}
LABELV $239
line 441
;441:		if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $247
line 442
;442:			Com_Printf( "%i:stepped\n", c_pmove );
ADDRGP4 $249
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 443
;443:		}
LABELV $247
line 444
;444:	}
line 445
;445:}
LABELV $203
endproc PM_StepSlideMove 132 28
proc PM_Friction 48 4
line 455
;446:
;447:
;448:/*
;449:==================
;450:PM_Friction
;451:
;452:Handles both ground friction and water friction
;453:==================
;454:*/
;455:static void PM_Friction( void ) {
line 461
;456:	vec3_t	vec;
;457:	float	*vel;
;458:	float	speed, newspeed, control;
;459:	float	drop;
;460:	
;461:	vel = pm->ps->velocity;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
line 463
;462:	
;463:	VectorCopy( vel, vec );
ADDRLP4 16
ADDRLP4 0
INDIRP4
INDIRB
ASGNB 12
line 464
;464:	if ( pml.walking ) {
ADDRGP4 pml+44
INDIRI4
CNSTI4 0
EQI4 $251
line 465
;465:		vec[2] = 0;	// ignore slope movement
ADDRLP4 16+8
CNSTF4 0
ASGNF4
line 466
;466:	}
LABELV $251
line 468
;467:
;468:	speed = VectorLength(vec);
ADDRLP4 16
ARGP4
ADDRLP4 32
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 32
INDIRF4
ASGNF4
line 469
;469:	if (speed < 1) {
ADDRLP4 8
INDIRF4
CNSTF4 1065353216
GEF4 $255
line 470
;470:		vel[0] = 0;
ADDRLP4 0
INDIRP4
CNSTF4 0
ASGNF4
line 471
;471:		vel[1] = 0;		// allow sinking underwater
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 0
ASGNF4
line 473
;472:		// FIXME: still have z friction underwater?
;473:		if ( pm->ps->pm_type == PM_SPECTATOR || pm->ps->powerups[ PW_FLIGHT ] )
ADDRLP4 36
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $259
ADDRLP4 36
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
CNSTI4 0
EQI4 $250
LABELV $259
line 474
;474:			vel[2] = 0.0f; // no slow-sinking/raising movements
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 475
;475:		return;
ADDRGP4 $250
JUMPV
LABELV $255
line 478
;476:	}
;477:
;478:	drop = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 481
;479:
;480:	// apply ground friction
;481:	if ( pm->waterlevel <= 1 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 1
GTI4 $260
line 482
;482:		if ( pml.walking && !(pml.groundTrace.surfaceFlags & SURF_SLICK) ) {
ADDRGP4 pml+44
INDIRI4
CNSTI4 0
EQI4 $262
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $262
line 484
;483:			// if getting knocked back, no friction
;484:			if ( ! (pm->ps->pm_flags & PMF_TIME_KNOCKBACK) ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
NEI4 $267
line 485
;485:				control = speed < pm_stopspeed ? pm_stopspeed : speed;
ADDRLP4 8
INDIRF4
ADDRGP4 pm_stopspeed
INDIRF4
GEF4 $270
ADDRLP4 36
ADDRGP4 pm_stopspeed
INDIRF4
ASGNF4
ADDRGP4 $271
JUMPV
LABELV $270
ADDRLP4 36
ADDRLP4 8
INDIRF4
ASGNF4
LABELV $271
ADDRLP4 28
ADDRLP4 36
INDIRF4
ASGNF4
line 486
;486:				drop += control*pm_friction*pml.frametime;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 28
INDIRF4
ADDRGP4 pm_friction
INDIRF4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 487
;487:			}
LABELV $267
line 488
;488:		}
LABELV $262
line 489
;489:	}
LABELV $260
line 492
;490:
;491:	// apply water friction even if just wading
;492:	if ( pm->waterlevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 0
EQI4 $273
line 493
;493:		drop += speed*pm_waterfriction*pm->waterlevel*pml.frametime;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
ADDRGP4 pm_waterfriction
INDIRF4
MULF4
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 494
;494:	}
LABELV $273
line 497
;495:
;496:	// apply flying friction
;497:	if ( pm->ps->powerups[PW_FLIGHT]) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
CNSTI4 0
EQI4 $276
line 498
;498:		drop += speed*pm_flightfriction*pml.frametime;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
ADDRGP4 pm_flightfriction
INDIRF4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 499
;499:	}
LABELV $276
line 501
;500:
;501:	if ( pm->ps->pm_type == PM_SPECTATOR) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $279
line 502
;502:		drop += speed*pm_spectatorfriction*pml.frametime;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
ADDRGP4 pm_spectatorfriction
INDIRF4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 503
;503:	}
LABELV $279
line 506
;504:
;505:	// scale the velocity
;506:	newspeed = speed - drop;
ADDRLP4 4
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
line 507
;507:	if (newspeed < 0) {
ADDRLP4 4
INDIRF4
CNSTF4 0
GEF4 $282
line 508
;508:		newspeed = 0;
ADDRLP4 4
CNSTF4 0
ASGNF4
line 509
;509:	}
LABELV $282
line 510
;510:	newspeed /= speed;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
DIVF4
ASGNF4
line 512
;511:
;512:	vel[0] = vel[0] * newspeed;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 513
;513:	vel[1] = vel[1] * newspeed;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 514
;514:	vel[2] = vel[2] * newspeed;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 515
;515:}
LABELV $250
endproc PM_Friction 48 4
proc PM_Accelerate 32 0
line 525
;516:
;517:
;518:/*
;519:==============
;520:PM_Accelerate
;521:
;522:Handles user intended acceleration
;523:==============
;524:*/
;525:static void PM_Accelerate( vec3_t wishdir, float wishspeed, float accel ) {
line 531
;526:#if 1
;527:	// q2 style
;528:	int			i;
;529:	float		addspeed, accelspeed, currentspeed;
;530:
;531:	currentspeed = DotProduct (pm->ps->velocity, wishdir);
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 16
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
INDIRF4
MULF4
ADDRLP4 16
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 16
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 532
;532:	addspeed = wishspeed - currentspeed;
ADDRLP4 8
ADDRFP4 4
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
line 533
;533:	if (addspeed <= 0) {
ADDRLP4 8
INDIRF4
CNSTF4 0
GTF4 $285
line 534
;534:		return;
ADDRGP4 $284
JUMPV
LABELV $285
line 536
;535:	}
;536:	accelspeed = accel*pml.frametime*wishspeed;
ADDRLP4 4
ADDRFP4 8
INDIRF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDRFP4 4
INDIRF4
MULF4
ASGNF4
line 537
;537:	if (accelspeed > addspeed) {
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $288
line 538
;538:		accelspeed = addspeed;
ADDRLP4 4
ADDRLP4 8
INDIRF4
ASGNF4
line 539
;539:	}
LABELV $288
line 541
;540:	
;541:	for (i=0 ; i<3 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $290
line 542
;542:		pm->ps->velocity[i] += accelspeed*wishdir[i];	
ADDRLP4 28
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 543
;543:	}
LABELV $291
line 541
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $290
line 562
;544:#else
;545:	// proper way (avoids strafe jump maxspeed bug), but feels bad
;546:	vec3_t		wishVelocity;
;547:	vec3_t		pushDir;
;548:	float		pushLen;
;549:	float		canPush;
;550:
;551:	VectorScale( wishdir, wishspeed, wishVelocity );
;552:	VectorSubtract( wishVelocity, pm->ps->velocity, pushDir );
;553:	pushLen = VectorNormalize( pushDir );
;554:
;555:	canPush = accel*pml.frametime*wishspeed;
;556:	if (canPush > pushLen) {
;557:		canPush = pushLen;
;558:	}
;559:
;560:	VectorMA( pm->ps->velocity, canPush, pushDir, pm->ps->velocity );
;561:#endif
;562:}
LABELV $284
endproc PM_Accelerate 32 0
proc PM_CmdScale 32 4
line 575
;563:
;564:
;565:
;566:/*
;567:============
;568:PM_CmdScale
;569:
;570:Returns the scale factor to apply to cmd movements
;571:This allows the clients to use axial -127 to 127 values for all directions
;572:without getting a sqrt(2) distortion in speed.
;573:============
;574:*/
;575:static float PM_CmdScale( usercmd_t *cmd ) {
line 580
;576:	int		max;
;577:	float	total;
;578:	float	scale;
;579:
;580:	max = abs( cmd->forwardmove );
ADDRFP4 0
INDIRP4
CNSTI4 21
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 12
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 581
;581:	if ( abs( cmd->rightmove ) > max ) {
ADDRFP4 0
INDIRP4
CNSTI4 22
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 16
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $295
line 582
;582:		max = abs( cmd->rightmove );
ADDRFP4 0
INDIRP4
CNSTI4 22
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 20
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 20
INDIRI4
ASGNI4
line 583
;583:	}
LABELV $295
line 584
;584:	if ( abs( cmd->upmove ) > max ) {
ADDRFP4 0
INDIRP4
CNSTI4 23
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 20
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $297
line 585
;585:		max = abs( cmd->upmove );
ADDRFP4 0
INDIRP4
CNSTI4 23
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 24
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 24
INDIRI4
ASGNI4
line 586
;586:	}
LABELV $297
line 587
;587:	if ( !max ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $299
line 588
;588:		return 0;
CNSTF4 0
RETF4
ADDRGP4 $294
JUMPV
LABELV $299
line 591
;589:	}
;590:
;591:	total = sqrt( cmd->forwardmove * cmd->forwardmove
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 21
ADDP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRP4
CNSTI4 21
ADDP4
INDIRI1
CVII4 1
MULI4
ADDRLP4 24
INDIRP4
CNSTI4 22
ADDP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRP4
CNSTI4 22
ADDP4
INDIRI1
CVII4 1
MULI4
ADDI4
ADDRLP4 24
INDIRP4
CNSTI4 23
ADDP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRP4
CNSTI4 23
ADDP4
INDIRI1
CVII4 1
MULI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 28
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 28
INDIRF4
ASGNF4
line 593
;592:		+ cmd->rightmove * cmd->rightmove + cmd->upmove * cmd->upmove );
;593:	scale = (float)pm->ps->speed * max / ( 127.0 * total );
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRI4
CVIF4 4
MULF4
ADDRLP4 4
INDIRF4
CNSTF4 1123942400
MULF4
DIVF4
ASGNF4
line 595
;594:
;595:	return scale;
ADDRLP4 8
INDIRF4
RETF4
LABELV $294
endproc PM_CmdScale 32 4
proc PM_SetMovementDir 36 0
line 607
;596:}
;597:
;598:
;599:/*
;600:================
;601:PM_SetMovementDir
;602:
;603:Determine the rotation of the legs relative
;604:to the facing dir
;605:================
;606:*/
;607:static void PM_SetMovementDir( void ) {
line 608
;608:	if ( pm->cmd.forwardmove || pm->cmd.rightmove ) {
ADDRLP4 0
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $304
ADDRLP4 0
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $302
LABELV $304
line 609
;609:		if ( pm->cmd.rightmove == 0 && pm->cmd.forwardmove > 0 ) {
ADDRLP4 4
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $305
ADDRLP4 4
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $305
line 610
;610:			pm->ps->movementDir = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 0
ASGNI4
line 611
;611:		} else if ( pm->cmd.rightmove < 0 && pm->cmd.forwardmove > 0 ) {
ADDRGP4 $303
JUMPV
LABELV $305
ADDRLP4 8
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $307
ADDRLP4 8
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $307
line 612
;612:			pm->ps->movementDir = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 1
ASGNI4
line 613
;613:		} else if ( pm->cmd.rightmove < 0 && pm->cmd.forwardmove == 0 ) {
ADDRGP4 $303
JUMPV
LABELV $307
ADDRLP4 12
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $309
ADDRLP4 12
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $309
line 614
;614:			pm->ps->movementDir = 2;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 2
ASGNI4
line 615
;615:		} else if ( pm->cmd.rightmove < 0 && pm->cmd.forwardmove < 0 ) {
ADDRGP4 $303
JUMPV
LABELV $309
ADDRLP4 16
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $311
ADDRLP4 16
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $311
line 616
;616:			pm->ps->movementDir = 3;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 3
ASGNI4
line 617
;617:		} else if ( pm->cmd.rightmove == 0 && pm->cmd.forwardmove < 0 ) {
ADDRGP4 $303
JUMPV
LABELV $311
ADDRLP4 20
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $313
ADDRLP4 20
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $313
line 618
;618:			pm->ps->movementDir = 4;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 4
ASGNI4
line 619
;619:		} else if ( pm->cmd.rightmove > 0 && pm->cmd.forwardmove < 0 ) {
ADDRGP4 $303
JUMPV
LABELV $313
ADDRLP4 24
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $315
ADDRLP4 24
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $315
line 620
;620:			pm->ps->movementDir = 5;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 5
ASGNI4
line 621
;621:		} else if ( pm->cmd.rightmove > 0 && pm->cmd.forwardmove == 0 ) {
ADDRGP4 $303
JUMPV
LABELV $315
ADDRLP4 28
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $317
ADDRLP4 28
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $317
line 622
;622:			pm->ps->movementDir = 6;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 6
ASGNI4
line 623
;623:		} else if ( pm->cmd.rightmove > 0 && pm->cmd.forwardmove > 0 ) {
ADDRGP4 $303
JUMPV
LABELV $317
ADDRLP4 32
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $303
ADDRLP4 32
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $303
line 624
;624:			pm->ps->movementDir = 7;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 7
ASGNI4
line 625
;625:		}
line 626
;626:	} else {
ADDRGP4 $303
JUMPV
LABELV $302
line 630
;627:		// if they aren't actively going directly sideways,
;628:		// change the animation to the diagonal so they
;629:		// don't stop too crooked
;630:		if ( pm->ps->movementDir == 2 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 2
NEI4 $321
line 631
;631:			pm->ps->movementDir = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 1
ASGNI4
line 632
;632:		} else if ( pm->ps->movementDir == 6 ) {
ADDRGP4 $322
JUMPV
LABELV $321
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 6
NEI4 $323
line 633
;633:			pm->ps->movementDir = 7;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 7
ASGNI4
line 634
;634:		} 
LABELV $323
LABELV $322
line 635
;635:	}
LABELV $303
line 636
;636:}
LABELV $301
endproc PM_SetMovementDir 36 0
proc PM_CheckJump 8 4
line 644
;637:
;638:
;639:/*
;640:=============
;641:PM_CheckJump
;642:=============
;643:*/
;644:static qboolean PM_CheckJump( void ) {
line 645
;645:	if ( pm->ps->pm_flags & PMF_RESPAWNED ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $326
line 646
;646:		return qfalse;		// don't allow jump until all buttons are up
CNSTI4 0
RETI4
ADDRGP4 $325
JUMPV
LABELV $326
line 649
;647:	}
;648:
;649:	if ( pm->cmd.upmove < 10 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 27
ADDP4
INDIRI1
CVII4 1
CNSTI4 10
GEI4 $328
line 651
;650:		// not holding jump
;651:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $325
JUMPV
LABELV $328
line 655
;652:	}
;653:
;654:	// must wait for jump to be released
;655:	if ( pm->ps->pm_flags & PMF_JUMP_HELD ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $330
line 657
;656:		// clear upmove so cmdscale doesn't lower running speed
;657:		pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 27
ADDP4
CNSTI1 0
ASGNI1
line 658
;658:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $325
JUMPV
LABELV $330
line 661
;659:	}
;660:
;661:	pml.groundPlane = qfalse;		// jumping away
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 662
;662:	pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 663
;663:	pm->ps->pm_flags |= PMF_JUMP_HELD;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 665
;664:
;665:	pm->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 1023
ASGNI4
line 666
;666:	pm->ps->velocity[2] = JUMP_VELOCITY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1132920832
ASGNF4
line 667
;667:	PM_AddEvent( EV_JUMP );
CNSTI4 14
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 669
;668:
;669:	if ( pm->cmd.forwardmove >= 0 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LTI4 $334
line 670
;670:		PM_ForceLegsAnim( LEGS_JUMP );
CNSTI4 18
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 671
;671:		pm->ps->pm_flags &= ~PMF_BACKWARDS_JUMP;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 672
;672:	} else {
ADDRGP4 $335
JUMPV
LABELV $334
line 673
;673:		PM_ForceLegsAnim( LEGS_JUMPB );
CNSTI4 20
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 674
;674:		pm->ps->pm_flags |= PMF_BACKWARDS_JUMP;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 675
;675:	}
LABELV $335
line 677
;676:
;677:	return qtrue;
CNSTI4 1
RETI4
LABELV $325
endproc PM_CheckJump 8 4
proc PM_CheckWaterJump 52 8
line 685
;678:}
;679:
;680:/*
;681:=============
;682:PM_CheckWaterJump
;683:=============
;684:*/
;685:static qboolean	PM_CheckWaterJump( void ) {
line 690
;686:	vec3_t	spot;
;687:	int		cont;
;688:	vec3_t	flatforward;
;689:
;690:	if (pm->ps->pm_time) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $337
line 691
;691:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $336
JUMPV
LABELV $337
line 695
;692:	}
;693:
;694:	// check for water jump
;695:	if ( pm->waterlevel != 2 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 2
EQI4 $339
line 696
;696:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $336
JUMPV
LABELV $339
line 699
;697:	}
;698:
;699:	flatforward[0] = pml.forward[0];
ADDRLP4 12
ADDRGP4 pml
INDIRF4
ASGNF4
line 700
;700:	flatforward[1] = pml.forward[1];
ADDRLP4 12+4
ADDRGP4 pml+4
INDIRF4
ASGNF4
line 701
;701:	flatforward[2] = 0;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 702
;702:	VectorNormalize (flatforward);
ADDRLP4 12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 704
;703:
;704:	VectorMA (pm->ps->origin, 30, flatforward, spot);
ADDRLP4 28
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
CNSTF4 1106247680
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 28
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 12+4
INDIRF4
CNSTF4 1106247680
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 12+8
INDIRF4
CNSTF4 1106247680
MULF4
ADDF4
ASGNF4
line 705
;705:	spot[2] += 4;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1082130432
ADDF4
ASGNF4
line 706
;706:	cont = pm->pointcontents (spot, pm->ps->clientNum );
ADDRLP4 0
ARGP4
ADDRLP4 32
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRLP4 32
INDIRP4
CNSTI4 220
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 36
INDIRI4
ASGNI4
line 707
;707:	if ( !(cont & CONTENTS_SOLID) ) {
ADDRLP4 24
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $349
line 708
;708:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $336
JUMPV
LABELV $349
line 711
;709:	}
;710:
;711:	spot[2] += 16;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 712
;712:	cont = pm->pointcontents (spot, pm->ps->clientNum );
ADDRLP4 0
ARGP4
ADDRLP4 40
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
ADDRLP4 40
INDIRP4
CNSTI4 220
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 44
INDIRI4
ASGNI4
line 713
;713:	if ( cont & (CONTENTS_SOLID|CONTENTS_PLAYERCLIP|CONTENTS_BODY) ) {
ADDRLP4 24
INDIRI4
CNSTI4 33619969
BANDI4
CNSTI4 0
EQI4 $352
line 714
;714:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $336
JUMPV
LABELV $352
line 718
;715:	}
;716:
;717:	// jump out of water
;718:	VectorScale (pml.forward, 200, pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRGP4 pml
INDIRF4
CNSTF4 1128792064
MULF4
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ADDRGP4 pml+4
INDIRF4
CNSTF4 1128792064
MULF4
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ADDRGP4 pml+8
INDIRF4
CNSTF4 1128792064
MULF4
ASGNF4
line 719
;719:	pm->ps->velocity[2] = 350;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1135542272
ASGNF4
line 721
;720:
;721:	pm->ps->pm_flags |= PMF_TIME_WATERJUMP;
ADDRLP4 48
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 722
;722:	pm->ps->pm_time = 2000;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 2000
ASGNI4
line 724
;723:
;724:	return qtrue;
CNSTI4 1
RETI4
LABELV $336
endproc PM_CheckWaterJump 52 8
proc PM_WaterJumpMove 12 4
line 737
;725:}
;726:
;727://============================================================================
;728:
;729:
;730:/*
;731:===================
;732:PM_WaterJumpMove
;733:
;734:Flying out of the water
;735:===================
;736:*/
;737:static void PM_WaterJumpMove( void ) {
line 740
;738:	// waterjump has no control, but falls
;739:
;740:	PM_StepSlideMove( qtrue );
CNSTI4 1
ARGI4
ADDRGP4 PM_StepSlideMove
CALLV
pop
line 742
;741:
;742:	pm->ps->velocity[2] -= pm->ps->gravity * pml.frametime;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pml+36
INDIRF4
MULF4
SUBF4
ASGNF4
line 743
;743:	if (pm->ps->velocity[2] < 0) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 0
GEF4 $358
line 745
;744:		// cancel as soon as we are falling down again
;745:		pm->ps->pm_flags &= ~PMF_ALL_TIMES;
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -353
BANDI4
ASGNI4
line 746
;746:		pm->ps->pm_time = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 747
;747:	}
LABELV $358
line 748
;748:}
LABELV $356
endproc PM_WaterJumpMove 12 4
proc PM_WaterMove 76 16
line 756
;749:
;750:/*
;751:===================
;752:PM_WaterMove
;753:
;754:===================
;755:*/
;756:static void PM_WaterMove( void ) {
line 764
;757:	int		i;
;758:	vec3_t	wishvel;
;759:	float	wishspeed;
;760:	vec3_t	wishdir;
;761:	float	scale;
;762:	float	vel;
;763:
;764:	if ( PM_CheckWaterJump() ) {
ADDRLP4 40
ADDRGP4 PM_CheckWaterJump
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $361
line 765
;765:		PM_WaterJumpMove();
ADDRGP4 PM_WaterJumpMove
CALLV
pop
line 766
;766:		return;
ADDRGP4 $360
JUMPV
LABELV $361
line 782
;767:	}
;768:#if 0
;769:	// jump = head for surface
;770:	if ( pm->cmd.upmove >= 10 ) {
;771:		if (pm->ps->velocity[2] > -300) {
;772:			if ( pm->watertype & CONTENTS_WATER ) {
;773:				pm->ps->velocity[2] = 100;
;774:			} else if ( pm->watertype & CONTENTS_SLIME ) {
;775:				pm->ps->velocity[2] = 80;
;776:			} else {
;777:				pm->ps->velocity[2] = 50;
;778:			}
;779:		}
;780:	}
;781:#endif
;782:	PM_Friction ();
ADDRGP4 PM_Friction
CALLV
pop
line 784
;783:
;784:	scale = PM_CmdScale( &pm->cmd );
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 44
ADDRGP4 PM_CmdScale
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 44
INDIRF4
ASGNF4
line 788
;785:	//
;786:	// user intentions
;787:	//
;788:	if ( !scale ) {
ADDRLP4 4
INDIRF4
CNSTF4 0
NEF4 $363
line 789
;789:		wishvel[0] = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 790
;790:		wishvel[1] = 0;
ADDRLP4 8+4
CNSTF4 0
ASGNF4
line 791
;791:		wishvel[2] = -60;		// sink towards bottom
ADDRLP4 8+8
CNSTF4 3262119936
ASGNF4
line 792
;792:	} else {
ADDRGP4 $364
JUMPV
LABELV $363
line 793
;793:		for (i=0 ; i<3 ; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $367
line 794
;794:			wishvel[i] = scale * pml.forward[i]*pm->cmd.forwardmove + scale * pml.right[i]*pm->cmd.rightmove;
ADDRLP4 56
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pml
ADDP4
INDIRF4
MULF4
ADDRLP4 56
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pml+12
ADDP4
INDIRF4
MULF4
ADDRLP4 56
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDF4
ASGNF4
LABELV $368
line 793
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $367
line 796
;795:
;796:		wishvel[2] += scale * pm->cmd.upmove;
ADDRLP4 8+8
ADDRLP4 8+8
INDIRF4
ADDRLP4 4
INDIRF4
ADDRGP4 pm
INDIRP4
CNSTI4 27
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDF4
ASGNF4
line 797
;797:	}
LABELV $364
line 799
;798:
;799:	VectorCopy (wishvel, wishdir);
ADDRLP4 24
ADDRLP4 8
INDIRB
ASGNB 12
line 800
;800:	wishspeed = VectorNormalize(wishdir);
ADDRLP4 24
ARGP4
ADDRLP4 48
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 48
INDIRF4
ASGNF4
line 802
;801:
;802:	if ( wishspeed > pm->ps->speed * pm_swimScale ) {
ADDRLP4 20
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pm_swimScale
INDIRF4
MULF4
LEF4 $373
line 803
;803:		wishspeed = pm->ps->speed * pm_swimScale;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pm_swimScale
INDIRF4
MULF4
ASGNF4
line 804
;804:	}
LABELV $373
line 806
;805:
;806:	PM_Accelerate (wishdir, wishspeed, pm_wateraccelerate);
ADDRLP4 24
ARGP4
ADDRLP4 20
INDIRF4
ARGF4
ADDRGP4 pm_wateraccelerate
INDIRF4
ARGF4
ADDRGP4 PM_Accelerate
CALLV
pop
line 809
;807:
;808:	// make sure we can go up slopes easily under water
;809:	if ( pml.groundPlane && DotProduct( pm->ps->velocity, pml.groundTrace.plane.normal ) < 0 ) {
ADDRGP4 pml+48
INDIRI4
CNSTI4 0
EQI4 $375
ADDRLP4 52
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRGP4 pml+52+24
INDIRF4
MULF4
ADDRLP4 52
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRGP4 pml+52+24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 52
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRGP4 pml+52+24+8
INDIRF4
MULF4
ADDF4
CNSTF4 0
GEF4 $375
line 810
;810:		vel = VectorLength(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 56
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 36
ADDRLP4 56
INDIRF4
ASGNF4
line 812
;811:		// slide along the ground plane
;812:		PM_ClipVelocity (pm->ps->velocity, pml.groundTrace.plane.normal,
ADDRLP4 60
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 32
ADDP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 815
;813:			pm->ps->velocity, OVERCLIP );
;814:
;815:		VectorNormalize(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 816
;816:		VectorScale(pm->ps->velocity, vel, pm->ps->velocity);
ADDRLP4 64
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 64
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
ADDRLP4 68
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
ADDRLP4 72
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 72
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
line 817
;817:	}
LABELV $375
line 819
;818:
;819:	PM_SlideMove( qfalse );
CNSTI4 0
ARGI4
ADDRGP4 PM_SlideMove
CALLI4
pop
line 820
;820:}
LABELV $360
endproc PM_WaterMove 76 16
proc PM_InvulnerabilityMove 0 0
line 830
;821:
;822:
;823:/*
;824:===================
;825:PM_InvulnerabilityMove
;826:
;827:Only with the invulnerability powerup
;828:===================
;829:*/
;830:static void PM_InvulnerabilityMove( void ) {
line 831
;831:	pm->cmd.forwardmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
CNSTI1 0
ASGNI1
line 832
;832:	pm->cmd.rightmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 26
ADDP4
CNSTI1 0
ASGNI1
line 833
;833:	pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 27
ADDP4
CNSTI1 0
ASGNI1
line 834
;834:	VectorClear(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 0
ASGNF4
line 835
;835:}
LABELV $388
endproc PM_InvulnerabilityMove 0 0
proc PM_FlyMove 52 12
line 845
;836:
;837:
;838:/*
;839:===================
;840:PM_FlyMove
;841:
;842:Only with the flight powerup
;843:===================
;844:*/
;845:static void PM_FlyMove( void ) {
line 853
;846:	int		i;
;847:	vec3_t	wishvel;
;848:	float	wishspeed;
;849:	vec3_t	wishdir;
;850:	float	scale;
;851:
;852:	// normal slowdown
;853:	PM_Friction ();
ADDRGP4 PM_Friction
CALLV
pop
line 855
;854:
;855:	scale = PM_CmdScale( &pm->cmd );
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 PM_CmdScale
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 36
INDIRF4
ASGNF4
line 859
;856:	//
;857:	// user intentions
;858:	//
;859:	if ( !scale ) {
ADDRLP4 4
INDIRF4
CNSTF4 0
NEF4 $390
line 860
;860:		wishvel[0] = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 861
;861:		wishvel[1] = 0;
ADDRLP4 8+4
CNSTF4 0
ASGNF4
line 862
;862:		wishvel[2] = 0;
ADDRLP4 8+8
CNSTF4 0
ASGNF4
line 863
;863:	} else {
ADDRGP4 $391
JUMPV
LABELV $390
line 864
;864:		for (i=0 ; i<3 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $394
line 865
;865:			wishvel[i] = scale * pml.forward[i]*pm->cmd.forwardmove + scale * pml.right[i]*pm->cmd.rightmove;
ADDRLP4 48
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pml
ADDP4
INDIRF4
MULF4
ADDRLP4 48
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pml+12
ADDP4
INDIRF4
MULF4
ADDRLP4 48
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDF4
ASGNF4
line 866
;866:		}
LABELV $395
line 864
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $394
line 868
;867:
;868:		wishvel[2] += scale * pm->cmd.upmove;
ADDRLP4 8+8
ADDRLP4 8+8
INDIRF4
ADDRLP4 4
INDIRF4
ADDRGP4 pm
INDIRP4
CNSTI4 27
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDF4
ASGNF4
line 869
;869:	}
LABELV $391
line 871
;870:
;871:	VectorCopy (wishvel, wishdir);
ADDRLP4 20
ADDRLP4 8
INDIRB
ASGNB 12
line 872
;872:	wishspeed = VectorNormalize(wishdir);
ADDRLP4 20
ARGP4
ADDRLP4 40
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 32
ADDRLP4 40
INDIRF4
ASGNF4
line 874
;873:
;874:	PM_Accelerate (wishdir, wishspeed, pm_flyaccelerate);
ADDRLP4 20
ARGP4
ADDRLP4 32
INDIRF4
ARGF4
ADDRGP4 pm_flyaccelerate
INDIRF4
ARGF4
ADDRGP4 PM_Accelerate
CALLV
pop
line 876
;875:
;876:	PM_StepSlideMove( qfalse );
CNSTI4 0
ARGI4
ADDRGP4 PM_StepSlideMove
CALLV
pop
line 877
;877:}
LABELV $389
endproc PM_FlyMove 52 12
proc PM_AirMove 80 16
line 886
;878:
;879:
;880:/*
;881:===================
;882:PM_AirMove
;883:
;884:===================
;885:*/
;886:static void PM_AirMove( void ) {
line 895
;887:	int			i;
;888:	vec3_t		wishvel;
;889:	float		fmove, smove;
;890:	vec3_t		wishdir;
;891:	float		wishspeed;
;892:	float		scale;
;893:	usercmd_t	cmd;
;894:
;895:	PM_Friction();
ADDRGP4 PM_Friction
CALLV
pop
line 897
;896:
;897:	fmove = pm->cmd.forwardmove;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 898
;898:	smove = pm->cmd.rightmove;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 900
;899:
;900:	cmd = pm->cmd;
ADDRLP4 44
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
INDIRB
ASGNB 24
line 901
;901:	scale = PM_CmdScale( &cmd );
ADDRLP4 44
ARGP4
ADDRLP4 68
ADDRGP4 PM_CmdScale
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 68
INDIRF4
ASGNF4
line 904
;902:
;903:	// set the movementDir so clients can rotate the legs for strafing
;904:	PM_SetMovementDir();
ADDRGP4 PM_SetMovementDir
CALLV
pop
line 907
;905:
;906:	// project moves down to flat plane
;907:	pml.forward[2] = 0;
ADDRGP4 pml+8
CNSTF4 0
ASGNF4
line 908
;908:	pml.right[2] = 0;
ADDRGP4 pml+12+8
CNSTF4 0
ASGNF4
line 909
;909:	VectorNormalize (pml.forward);
ADDRGP4 pml
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 910
;910:	VectorNormalize (pml.right);
ADDRGP4 pml+12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 912
;911:
;912:	for ( i = 0 ; i < 2 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $405
line 913
;913:		wishvel[i] = pml.forward[i]*fmove + pml.right[i]*smove;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pml
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pml+12
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
line 914
;914:	}
LABELV $406
line 912
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $405
line 915
;915:	wishvel[2] = 0;
ADDRLP4 4+8
CNSTF4 0
ASGNF4
line 917
;916:
;917:	VectorCopy (wishvel, wishdir);
ADDRLP4 24
ADDRLP4 4
INDIRB
ASGNB 12
line 918
;918:	wishspeed = VectorNormalize(wishdir);
ADDRLP4 24
ARGP4
ADDRLP4 72
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 36
ADDRLP4 72
INDIRF4
ASGNF4
line 919
;919:	wishspeed *= scale;
ADDRLP4 36
ADDRLP4 36
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ASGNF4
line 922
;920:
;921:	// not on ground, so little effect on velocity
;922:	PM_Accelerate (wishdir, wishspeed, pm_airaccelerate);
ADDRLP4 24
ARGP4
ADDRLP4 36
INDIRF4
ARGF4
ADDRGP4 pm_airaccelerate
INDIRF4
ARGF4
ADDRGP4 PM_Accelerate
CALLV
pop
line 927
;923:
;924:	// we may have a ground plane that is very steep, even
;925:	// though we don't have a groundentity
;926:	// slide along the steep plane
;927:	if ( pml.groundPlane ) {
ADDRGP4 pml+48
INDIRI4
CNSTI4 0
EQI4 $411
line 928
;928:		PM_ClipVelocity (pm->ps->velocity, pml.groundTrace.plane.normal, 
ADDRLP4 76
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 32
ADDP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 930
;929:			pm->ps->velocity, OVERCLIP );
;930:	}
LABELV $411
line 942
;931:
;932:#if 0
;933:	//ZOID:  If we are on the grapple, try stair-stepping
;934:	//this allows a player to use the grapple to pull himself
;935:	//over a ledge
;936:	if (pm->ps->pm_flags & PMF_GRAPPLE_PULL)
;937:		PM_StepSlideMove ( qtrue );
;938:	else
;939:		PM_SlideMove ( qtrue );
;940:#endif
;941:
;942:	PM_StepSlideMove ( qtrue );
CNSTI4 1
ARGI4
ADDRGP4 PM_StepSlideMove
CALLV
pop
line 943
;943:}
LABELV $400
endproc PM_AirMove 80 16
proc PM_GrappleMove 44 4
line 951
;944:
;945:/*
;946:===================
;947:PM_GrappleMove
;948:
;949:===================
;950:*/
;951:static void PM_GrappleMove( void ) {
line 955
;952:	vec3_t vel, v;
;953:	float vlen;
;954:
;955:	VectorScale(pml.forward, -16, v);
ADDRLP4 12
ADDRGP4 pml
INDIRF4
CNSTF4 3246391296
MULF4
ASGNF4
ADDRLP4 12+4
ADDRGP4 pml+4
INDIRF4
CNSTF4 3246391296
MULF4
ASGNF4
ADDRLP4 12+8
ADDRGP4 pml+8
INDIRF4
CNSTF4 3246391296
MULF4
ASGNF4
line 956
;956:	VectorAdd(pm->ps->grapplePoint, v, v);
ADDRLP4 28
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 28
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 28
INDIRP4
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 12+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 12+8
INDIRF4
ADDF4
ASGNF4
line 957
;957:	VectorSubtract(v, pm->ps->origin, vel);
ADDRLP4 32
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ADDRLP4 32
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 32
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 12+8
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 958
;958:	vlen = VectorLength(vel);
ADDRLP4 0
ARGP4
ADDRLP4 36
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 36
INDIRF4
ASGNF4
line 959
;959:	VectorNormalize( vel );
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 961
;960:
;961:	if (vlen <= 100)
ADDRLP4 24
INDIRF4
CNSTF4 1120403456
GTF4 $429
line 962
;962:		VectorScale(vel, 10 * vlen, vel);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 24
INDIRF4
CNSTF4 1092616192
MULF4
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 24
INDIRF4
CNSTF4 1092616192
MULF4
MULF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 24
INDIRF4
CNSTF4 1092616192
MULF4
MULF4
ASGNF4
ADDRGP4 $430
JUMPV
LABELV $429
line 964
;963:	else
;964:		VectorScale(vel, 800, vel);
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1145569280
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1145569280
MULF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1145569280
MULF4
ASGNF4
LABELV $430
line 966
;965:
;966:	VectorCopy(vel, pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 968
;967:
;968:	pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 969
;969:}
LABELV $416
endproc PM_GrappleMove 44 4
proc PM_WalkMove 112 16
line 977
;970:
;971:/*
;972:===================
;973:PM_WalkMove
;974:
;975:===================
;976:*/
;977:static void PM_WalkMove( void ) {
line 988
;978:	int			i;
;979:	vec3_t		wishvel;
;980:	float		fmove, smove;
;981:	vec3_t		wishdir;
;982:	float		wishspeed;
;983:	float		scale;
;984:	usercmd_t	cmd;
;985:	float		accelerate;
;986:	float		vel;
;987:
;988:	if ( pm->waterlevel > 2 && DotProduct( pml.forward, pml.groundTrace.plane.normal ) > 0 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 2
LEI4 $441
ADDRGP4 pml
INDIRF4
ADDRGP4 pml+52+24
INDIRF4
MULF4
ADDRGP4 pml+4
INDIRF4
ADDRGP4 pml+52+24+4
INDIRF4
MULF4
ADDF4
ADDRGP4 pml+8
INDIRF4
ADDRGP4 pml+52+24+8
INDIRF4
MULF4
ADDF4
CNSTF4 0
LEF4 $441
line 990
;989:		// begin swimming
;990:		PM_WaterMove();
ADDRGP4 PM_WaterMove
CALLV
pop
line 991
;991:		return;
ADDRGP4 $440
JUMPV
LABELV $441
line 995
;992:	}
;993:
;994:
;995:	if ( PM_CheckJump () ) {
ADDRLP4 76
ADDRGP4 PM_CheckJump
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $453
line 997
;996:		// jumped away
;997:		if ( pm->waterlevel > 1 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 1
LEI4 $455
line 998
;998:			PM_WaterMove();
ADDRGP4 PM_WaterMove
CALLV
pop
line 999
;999:		} else {
ADDRGP4 $440
JUMPV
LABELV $455
line 1000
;1000:			PM_AirMove();
ADDRGP4 PM_AirMove
CALLV
pop
line 1001
;1001:		}
line 1002
;1002:		return;
ADDRGP4 $440
JUMPV
LABELV $453
line 1005
;1003:	}
;1004:
;1005:	PM_Friction ();
ADDRGP4 PM_Friction
CALLV
pop
line 1007
;1006:
;1007:	fmove = pm->cmd.forwardmove;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 1008
;1008:	smove = pm->cmd.rightmove;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 1010
;1009:
;1010:	cmd = pm->cmd;
ADDRLP4 44
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
INDIRB
ASGNB 24
line 1011
;1011:	scale = PM_CmdScale( &cmd );
ADDRLP4 44
ARGP4
ADDRLP4 80
ADDRGP4 PM_CmdScale
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 80
INDIRF4
ASGNF4
line 1014
;1012:
;1013:	// set the movementDir so clients can rotate the legs for strafing
;1014:	PM_SetMovementDir();
ADDRGP4 PM_SetMovementDir
CALLV
pop
line 1017
;1015:
;1016:	// project moves down to flat plane
;1017:	pml.forward[2] = 0;
ADDRGP4 pml+8
CNSTF4 0
ASGNF4
line 1018
;1018:	pml.right[2] = 0;
ADDRGP4 pml+12+8
CNSTF4 0
ASGNF4
line 1021
;1019:
;1020:	// project the forward and right directions onto the ground plane
;1021:	PM_ClipVelocity (pml.forward, pml.groundTrace.plane.normal, pml.forward, OVERCLIP );
ADDRLP4 84
ADDRGP4 pml
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 84
INDIRP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 1022
;1022:	PM_ClipVelocity (pml.right, pml.groundTrace.plane.normal, pml.right, OVERCLIP );
ADDRGP4 pml+12
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRGP4 pml+12
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 1024
;1023:	//
;1024:	VectorNormalize (pml.forward);
ADDRGP4 pml
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1025
;1025:	VectorNormalize (pml.right);
ADDRGP4 pml+12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1027
;1026:
;1027:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $467
line 1028
;1028:		wishvel[i] = pml.forward[i]*fmove + pml.right[i]*smove;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pml
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pml+12
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
line 1029
;1029:	}
LABELV $468
line 1027
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $467
line 1033
;1030:	// when going up or down slopes the wish velocity should Not be zero
;1031://	wishvel[2] = 0;
;1032:
;1033:	VectorCopy (wishvel, wishdir);
ADDRLP4 28
ADDRLP4 4
INDIRB
ASGNB 12
line 1034
;1034:	wishspeed = VectorNormalize(wishdir);
ADDRLP4 28
ARGP4
ADDRLP4 88
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 88
INDIRF4
ASGNF4
line 1035
;1035:	wishspeed *= scale;
ADDRLP4 24
ADDRLP4 24
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ASGNF4
line 1038
;1036:
;1037:	// clamp the speed lower if ducking
;1038:	if ( pm->ps->pm_flags & PMF_DUCKED ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $472
line 1039
;1039:		if ( wishspeed > pm->ps->speed * pm_duckScale ) {
ADDRLP4 24
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pm_duckScale
INDIRF4
MULF4
LEF4 $474
line 1040
;1040:			wishspeed = pm->ps->speed * pm_duckScale;
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pm_duckScale
INDIRF4
MULF4
ASGNF4
line 1041
;1041:		}
LABELV $474
line 1042
;1042:	}
LABELV $472
line 1045
;1043:
;1044:	// clamp the speed lower if wading or walking on the bottom
;1045:	if ( pm->waterlevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 0
EQI4 $476
line 1048
;1046:		float	waterScale;
;1047:
;1048:		waterScale = pm->waterlevel / 3.0;
ADDRLP4 92
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1051372203
MULF4
ASGNF4
line 1049
;1049:		waterScale = 1.0 - ( 1.0 - pm_swimScale ) * waterScale;
ADDRLP4 92
CNSTF4 1065353216
CNSTF4 1065353216
ADDRGP4 pm_swimScale
INDIRF4
SUBF4
ADDRLP4 92
INDIRF4
MULF4
SUBF4
ASGNF4
line 1050
;1050:		if ( wishspeed > pm->ps->speed * waterScale ) {
ADDRLP4 24
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 92
INDIRF4
MULF4
LEF4 $478
line 1051
;1051:			wishspeed = pm->ps->speed * waterScale;
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 92
INDIRF4
MULF4
ASGNF4
line 1052
;1052:		}
LABELV $478
line 1053
;1053:	}
LABELV $476
line 1057
;1054:
;1055:	// when a player gets hit, they temporarily lose
;1056:	// full control, which allows them to be moved a bit
;1057:	if ( ( pml.groundTrace.surfaceFlags & SURF_SLICK ) || pm->ps->pm_flags & PMF_TIME_KNOCKBACK ) {
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $484
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $480
LABELV $484
line 1058
;1058:		accelerate = pm_airaccelerate;
ADDRLP4 68
ADDRGP4 pm_airaccelerate
INDIRF4
ASGNF4
line 1059
;1059:	} else {
ADDRGP4 $481
JUMPV
LABELV $480
line 1060
;1060:		accelerate = pm_accelerate;
ADDRLP4 68
ADDRGP4 pm_accelerate
INDIRF4
ASGNF4
line 1061
;1061:	}
LABELV $481
line 1063
;1062:
;1063:	PM_Accelerate (wishdir, wishspeed, accelerate);
ADDRLP4 28
ARGP4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 68
INDIRF4
ARGF4
ADDRGP4 PM_Accelerate
CALLV
pop
line 1068
;1064:
;1065:	//Com_Printf("velocity = %1.1f %1.1f %1.1f\n", pm->ps->velocity[0], pm->ps->velocity[1], pm->ps->velocity[2]);
;1066:	//Com_Printf("velocity1 = %1.1f\n", VectorLength(pm->ps->velocity));
;1067:
;1068:	if ( ( pml.groundTrace.surfaceFlags & SURF_SLICK ) || pm->ps->pm_flags & PMF_TIME_KNOCKBACK ) {
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $489
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $485
LABELV $489
line 1069
;1069:		pm->ps->velocity[2] -= pm->ps->gravity * pml.frametime;
ADDRLP4 92
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 96
ADDRLP4 92
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRF4
ADDRLP4 92
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pml+36
INDIRF4
MULF4
SUBF4
ASGNF4
line 1070
;1070:	} else {
LABELV $485
line 1073
;1071:		// don't reset the z velocity for slopes
;1072://		pm->ps->velocity[2] = 0;
;1073:	}
LABELV $486
line 1075
;1074: 
;1075:	if ( pm_respawntimer ) { // no more overbounce at respawn
ADDRGP4 pm_respawntimer
INDIRI4
CNSTI4 0
EQI4 $491
line 1077
;1076:		// slide along the ground plane
;1077:		PM_ClipVelocity (pm->ps->velocity, pml.groundTrace.plane.normal,
ADDRLP4 92
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 92
INDIRP4
CNSTI4 32
ADDP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 1079
;1078:			pm->ps->velocity, OVERCLIP );
;1079:	} else {
ADDRGP4 $492
JUMPV
LABELV $491
line 1080
;1080:		vel = VectorLength(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 92
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 72
ADDRLP4 92
INDIRF4
ASGNF4
line 1083
;1081:
;1082:		// slide along the ground plane
;1083:		PM_ClipVelocity (pm->ps->velocity, pml.groundTrace.plane.normal,
ADDRLP4 96
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 96
INDIRP4
CNSTI4 32
ADDP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 1087
;1084:			pm->ps->velocity, OVERCLIP );
;1085:
;1086:		// don't decrease velocity when going up or down a slope
;1087:		VectorNormalize(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1088
;1088:		VectorScale(pm->ps->velocity, vel, pm->ps->velocity);
ADDRLP4 100
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 100
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 72
INDIRF4
MULF4
ASGNF4
ADDRLP4 104
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 104
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 104
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 72
INDIRF4
MULF4
ASGNF4
ADDRLP4 108
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 108
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 108
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 72
INDIRF4
MULF4
ASGNF4
line 1089
;1089:	}
LABELV $492
line 1092
;1090:
;1091:	// don't do anything if standing still
;1092:	if (!pm->ps->velocity[0] && !pm->ps->velocity[1]) {
ADDRLP4 92
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 0
NEF4 $497
ADDRLP4 92
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
CNSTF4 0
NEF4 $497
line 1093
;1093:		return;
ADDRGP4 $440
JUMPV
LABELV $497
line 1096
;1094:	}
;1095:
;1096:	PM_StepSlideMove( qfalse );
CNSTI4 0
ARGI4
ADDRGP4 PM_StepSlideMove
CALLV
pop
line 1100
;1097:
;1098:	//Com_Printf("velocity2 = %1.1f\n", VectorLength(pm->ps->velocity));
;1099:
;1100:}
LABELV $440
endproc PM_WalkMove 112 16
proc PM_DeadMove 20 4
line 1108
;1101:
;1102:
;1103:/*
;1104:==============
;1105:PM_DeadMove
;1106:==============
;1107:*/
;1108:static void PM_DeadMove( void ) {
line 1111
;1109:	float	forward;
;1110:
;1111:	if ( !pml.walking ) {
ADDRGP4 pml+44
INDIRI4
CNSTI4 0
NEI4 $500
line 1112
;1112:		return;
ADDRGP4 $499
JUMPV
LABELV $500
line 1117
;1113:	}
;1114:
;1115:	// extra friction
;1116:
;1117:	forward = VectorLength (pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 1118
;1118:	forward -= 20;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1101004800
SUBF4
ASGNF4
line 1119
;1119:	if ( forward <= 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
GTF4 $503
line 1120
;1120:		VectorClear (pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 0
ASGNF4
line 1121
;1121:	} else {
ADDRGP4 $504
JUMPV
LABELV $503
line 1122
;1122:		VectorNormalize (pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1123
;1123:		VectorScale (pm->ps->velocity, forward, pm->ps->velocity);
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 1124
;1124:	}
LABELV $504
line 1125
;1125:}
LABELV $499
endproc PM_DeadMove 20 4
proc PM_NoclipMove 92 12
line 1133
;1126:
;1127:
;1128:/*
;1129:===============
;1130:PM_NoclipMove
;1131:===============
;1132:*/
;1133:static void PM_NoclipMove( void ) {
line 1142
;1134:	float	speed, drop, friction, control, newspeed;
;1135:	int			i;
;1136:	vec3_t		wishvel;
;1137:	float		fmove, smove;
;1138:	vec3_t		wishdir;
;1139:	float		wishspeed;
;1140:	float		scale;
;1141:
;1142:	pm->ps->viewheight = DEFAULT_VIEWHEIGHT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 26
ASGNI4
line 1146
;1143:
;1144:	// friction
;1145:
;1146:	speed = VectorLength (pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 64
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 64
INDIRF4
ASGNF4
line 1147
;1147:	if (speed < 1)
ADDRLP4 24
INDIRF4
CNSTF4 1065353216
GEF4 $506
line 1148
;1148:	{
line 1149
;1149:		VectorCopy (vec3_origin, pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRGP4 vec3_origin
INDIRB
ASGNB 12
line 1150
;1150:	}
ADDRGP4 $507
JUMPV
LABELV $506
line 1152
;1151:	else
;1152:	{
line 1153
;1153:		drop = 0;
ADDRLP4 52
CNSTF4 0
ASGNF4
line 1155
;1154:
;1155:		friction = pm_friction*1.5;	// extra friction
ADDRLP4 56
ADDRGP4 pm_friction
INDIRF4
CNSTF4 1069547520
MULF4
ASGNF4
line 1156
;1156:		control = speed < pm_stopspeed ? pm_stopspeed : speed;
ADDRLP4 24
INDIRF4
ADDRGP4 pm_stopspeed
INDIRF4
GEF4 $509
ADDRLP4 68
ADDRGP4 pm_stopspeed
INDIRF4
ASGNF4
ADDRGP4 $510
JUMPV
LABELV $509
ADDRLP4 68
ADDRLP4 24
INDIRF4
ASGNF4
LABELV $510
ADDRLP4 60
ADDRLP4 68
INDIRF4
ASGNF4
line 1157
;1157:		drop += control*friction*pml.frametime;
ADDRLP4 52
ADDRLP4 52
INDIRF4
ADDRLP4 60
INDIRF4
ADDRLP4 56
INDIRF4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 1160
;1158:
;1159:		// scale the velocity
;1160:		newspeed = speed - drop;
ADDRLP4 28
ADDRLP4 24
INDIRF4
ADDRLP4 52
INDIRF4
SUBF4
ASGNF4
line 1161
;1161:		if (newspeed < 0)
ADDRLP4 28
INDIRF4
CNSTF4 0
GEF4 $512
line 1162
;1162:			newspeed = 0;
ADDRLP4 28
CNSTF4 0
ASGNF4
LABELV $512
line 1163
;1163:		newspeed /= speed;
ADDRLP4 28
ADDRLP4 28
INDIRF4
ADDRLP4 24
INDIRF4
DIVF4
ASGNF4
line 1165
;1164:
;1165:		VectorScale (pm->ps->velocity, newspeed, pm->ps->velocity);
ADDRLP4 72
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 72
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
ADDRLP4 76
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 76
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 80
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 1166
;1166:	}
LABELV $507
line 1169
;1167:
;1168:	// accelerate
;1169:	scale = PM_CmdScale( &pm->cmd );
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 68
ADDRGP4 PM_CmdScale
CALLF4
ASGNF4
ADDRLP4 48
ADDRLP4 68
INDIRF4
ASGNF4
line 1171
;1170:
;1171:	fmove = pm->cmd.forwardmove;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 1172
;1172:	smove = pm->cmd.rightmove;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 1174
;1173:	
;1174:	for (i=0 ; i<3 ; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $514
line 1175
;1175:		wishvel[i] = pml.forward[i]*fmove + pml.right[i]*smove;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pml
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pml+12
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $515
line 1174
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $514
line 1176
;1176:	wishvel[2] += pm->cmd.upmove;
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
ADDRGP4 pm
INDIRP4
CNSTI4 27
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ADDF4
ASGNF4
line 1178
;1177:
;1178:	VectorCopy (wishvel, wishdir);
ADDRLP4 32
ADDRLP4 4
INDIRB
ASGNB 12
line 1179
;1179:	wishspeed = VectorNormalize(wishdir);
ADDRLP4 32
ARGP4
ADDRLP4 76
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 44
ADDRLP4 76
INDIRF4
ASGNF4
line 1180
;1180:	wishspeed *= scale;
ADDRLP4 44
ADDRLP4 44
INDIRF4
ADDRLP4 48
INDIRF4
MULF4
ASGNF4
line 1182
;1181:
;1182:	PM_Accelerate( wishdir, wishspeed, pm_accelerate );
ADDRLP4 32
ARGP4
ADDRLP4 44
INDIRF4
ARGF4
ADDRGP4 pm_accelerate
INDIRF4
ARGF4
ADDRGP4 PM_Accelerate
CALLV
pop
line 1185
;1183:
;1184:	// move
;1185:	VectorMA (pm->ps->origin, pml.frametime, pm->ps->velocity, pm->ps->origin);
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 80
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 84
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 84
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 88
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 88
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 88
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 1186
;1186:}
LABELV $505
endproc PM_NoclipMove 92 12
proc PM_FootstepForSurface 0 0
line 1197
;1187:
;1188://============================================================================
;1189:
;1190:/*
;1191:================
;1192:PM_FootstepForSurface
;1193:
;1194:Returns an event number apropriate for the groundsurface
;1195:================
;1196:*/
;1197:static int PM_FootstepForSurface( void ) {
line 1198
;1198:	if ( pml.groundTrace.surfaceFlags & SURF_NOSTEPS ) {
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $524
line 1199
;1199:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $523
JUMPV
LABELV $524
line 1201
;1200:	}
;1201:	if ( pml.groundTrace.surfaceFlags & SURF_METALSTEPS ) {
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $528
line 1202
;1202:		return EV_FOOTSTEP_METAL;
CNSTI4 2
RETI4
ADDRGP4 $523
JUMPV
LABELV $528
line 1204
;1203:	}
;1204:	return EV_FOOTSTEP;
CNSTI4 1
RETI4
LABELV $523
endproc PM_FootstepForSurface 0 0
proc PM_CrashLand 52 4
line 1215
;1205:}
;1206:
;1207:
;1208:/*
;1209:=================
;1210:PM_CrashLand
;1211:
;1212:Check for hard landings that generate sound events
;1213:=================
;1214:*/
;1215:static void PM_CrashLand( void ) {
line 1223
;1216:	float		delta;
;1217:	float		dist;
;1218:	float		vel, acc;
;1219:	float		t;
;1220:	float		a, b, c, den;
;1221:
;1222:	// decide which landing animation to use
;1223:	if ( pm->ps->pm_flags & PMF_BACKWARDS_JUMP ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $533
line 1224
;1224:		PM_ForceLegsAnim( LEGS_LANDB );
CNSTI4 21
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 1225
;1225:	} else {
ADDRGP4 $534
JUMPV
LABELV $533
line 1226
;1226:		PM_ForceLegsAnim( LEGS_LAND );
CNSTI4 19
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 1227
;1227:	}
LABELV $534
line 1229
;1228:
;1229:	pm->ps->legsTimer = TIMER_LAND;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 130
ASGNI4
line 1232
;1230:
;1231:	// calculate the exact velocity on landing
;1232:	dist = pm->ps->origin[2] - pml.previous_origin[2];
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRGP4 pml+112+8
INDIRF4
SUBF4
ASGNF4
line 1233
;1233:	vel = pml.previous_velocity[2];
ADDRLP4 8
ADDRGP4 pml+124+8
INDIRF4
ASGNF4
line 1234
;1234:	acc = -pm->ps->gravity;
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
NEGI4
CVIF4 4
ASGNF4
line 1236
;1235:
;1236:	a = acc / 2;
ADDRLP4 16
ADDRLP4 12
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 1237
;1237:	b = vel;
ADDRLP4 4
ADDRLP4 8
INDIRF4
ASGNF4
line 1238
;1238:	c = -dist;
ADDRLP4 32
ADDRLP4 24
INDIRF4
NEGF4
ASGNF4
line 1240
;1239:
;1240:	den =  b * b - 4 * a * c;
ADDRLP4 20
ADDRLP4 4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDRLP4 16
INDIRF4
CNSTF4 1082130432
MULF4
ADDRLP4 32
INDIRF4
MULF4
SUBF4
ASGNF4
line 1241
;1241:	if ( den < 0 ) {
ADDRLP4 20
INDIRF4
CNSTF4 0
GEF4 $539
line 1242
;1242:		return;
ADDRGP4 $532
JUMPV
LABELV $539
line 1244
;1243:	}
;1244:	t = (-b - sqrt( den ) ) / ( 2 * a );
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 40
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 4
INDIRF4
NEGF4
ADDRLP4 40
INDIRF4
SUBF4
ADDRLP4 16
INDIRF4
CNSTF4 1073741824
MULF4
DIVF4
ASGNF4
line 1246
;1245:
;1246:	delta = vel + t * acc;
ADDRLP4 0
ADDRLP4 8
INDIRF4
ADDRLP4 28
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 1247
;1247:	delta = delta*delta * 0.0001;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
CNSTF4 953267991
MULF4
ASGNF4
line 1250
;1248:
;1249:	// ducking while falling doubles damage
;1250:	if ( pm->ps->pm_flags & PMF_DUCKED ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $541
line 1251
;1251:		delta *= 2;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1073741824
MULF4
ASGNF4
line 1252
;1252:	}
LABELV $541
line 1255
;1253:
;1254:	// never take falling damage if completely underwater
;1255:	if ( pm->waterlevel == 3 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 3
NEI4 $543
line 1256
;1256:		return;
ADDRGP4 $532
JUMPV
LABELV $543
line 1260
;1257:	}
;1258:
;1259:	// reduce falling damage if there is standing water
;1260:	if ( pm->waterlevel == 2 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 2
NEI4 $545
line 1261
;1261:		delta *= 0.25;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1048576000
MULF4
ASGNF4
line 1262
;1262:	}
LABELV $545
line 1263
;1263:	if ( pm->waterlevel == 1 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 1
NEI4 $547
line 1264
;1264:		delta *= 0.5;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 1265
;1265:	}
LABELV $547
line 1267
;1266:
;1267:	if ( delta < 1 ) {
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
GEF4 $549
line 1268
;1268:		return;
ADDRGP4 $532
JUMPV
LABELV $549
line 1275
;1269:	}
;1270:
;1271:	// create a local entity event to play the sound
;1272:
;1273:	// SURF_NODAMAGE is used for bounce pads where you don't ever
;1274:	// want to take damage or play a crunch sound
;1275:	if ( !(pml.groundTrace.surfaceFlags & SURF_NODAMAGE) )  {
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $551
line 1276
;1276:		if ( delta > 60 ) {
ADDRLP4 0
INDIRF4
CNSTF4 1114636288
LEF4 $555
line 1277
;1277:			PM_AddEvent( EV_FALL_FAR );
CNSTI4 12
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1278
;1278:		} else if ( delta > 40 ) {
ADDRGP4 $556
JUMPV
LABELV $555
ADDRLP4 0
INDIRF4
CNSTF4 1109393408
LEF4 $557
line 1280
;1279:			// this is a pain grunt, so don't play it if dead
;1280:			if ( pm->ps->stats[STAT_HEALTH] > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
LEI4 $558
line 1281
;1281:				PM_AddEvent( EV_FALL_MEDIUM );
CNSTI4 11
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1282
;1282:			}
line 1283
;1283:		} else if ( delta > 7 ) {
ADDRGP4 $558
JUMPV
LABELV $557
ADDRLP4 0
INDIRF4
CNSTF4 1088421888
LEF4 $561
line 1284
;1284:			PM_AddEvent( EV_FALL_SHORT );
CNSTI4 10
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1285
;1285:		} else {
ADDRGP4 $562
JUMPV
LABELV $561
line 1286
;1286:			PM_AddEvent( PM_FootstepForSurface() );
ADDRLP4 48
ADDRGP4 PM_FootstepForSurface
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1287
;1287:		}
LABELV $562
LABELV $558
LABELV $556
line 1288
;1288:	}
LABELV $551
line 1291
;1289:
;1290:	// start footstep cycle over
;1291:	pm->ps->bobCycle = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
line 1292
;1292:}
LABELV $532
endproc PM_CrashLand 52 4
proc PM_CorrectAllSolid 36 28
line 1315
;1293:
;1294:/*
;1295:=============
;1296:PM_CheckStuck
;1297:=============
;1298:*/
;1299:/*
;1300:void PM_CheckStuck(void) {
;1301:	trace_t trace;
;1302:
;1303:	pm->trace (&trace, pm->ps->origin, pm->mins, pm->maxs, pm->ps->origin, pm->ps->clientNum, pm->tracemask);
;1304:	if (trace.allsolid) {
;1305:		//int shit = qtrue;
;1306:	}
;1307:}
;1308:*/
;1309:
;1310:/*
;1311:=============
;1312:PM_CorrectAllSolid
;1313:=============
;1314:*/
;1315:static int PM_CorrectAllSolid( trace_t *trace ) {
line 1319
;1316:	int			i, j, k;
;1317:	vec3_t		point;
;1318:
;1319:	if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $564
line 1320
;1320:		Com_Printf("%i:allsolid\n", c_pmove);
ADDRGP4 $566
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1321
;1321:	}
LABELV $564
line 1324
;1322:
;1323:	// jitter around
;1324:	for (i = -1; i <= 1; i++) {
ADDRLP4 20
CNSTI4 -1
ASGNI4
LABELV $567
line 1325
;1325:		for (j = -1; j <= 1; j++) {
ADDRLP4 16
CNSTI4 -1
ASGNI4
LABELV $571
line 1326
;1326:			for (k = -1; k <= 1; k++) {
ADDRLP4 12
CNSTI4 -1
ASGNI4
LABELV $575
line 1327
;1327:				VectorCopy(pm->ps->origin, point);
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1328
;1328:				point[0] += (float) i;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1329
;1329:				point[1] += (float) j;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 16
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1330
;1330:				point[2] += (float) k;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 12
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1331
;1331:				pm->trace (trace, point, pm->mins, pm->maxs, point, pm->ps->clientNum, pm->tracemask);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 24
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 176
ADDP4
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 188
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 24
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
INDIRP4
CNSTI4 216
ADDP4
INDIRP4
CALLV
pop
line 1332
;1332:				if ( !trace->allsolid ) {
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $581
line 1333
;1333:					point[0] = pm->ps->origin[0];
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ASGNF4
line 1334
;1334:					point[1] = pm->ps->origin[1];
ADDRLP4 0+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 1335
;1335:					point[2] = pm->ps->origin[2] - 0.25;
ADDRLP4 0+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1048576000
SUBF4
ASGNF4
line 1337
;1336:
;1337:					pm->trace (trace, pm->ps->origin, pm->mins, pm->maxs, point, pm->ps->clientNum, pm->tracemask);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 32
ADDRLP4 28
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 176
ADDP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 188
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
CNSTI4 216
ADDP4
INDIRP4
CALLV
pop
line 1338
;1338:					pml.groundTrace = *trace;
ADDRGP4 pml+52
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 56
line 1339
;1339:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $563
JUMPV
LABELV $581
line 1341
;1340:				}
;1341:			}
LABELV $576
line 1326
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
LEI4 $575
line 1342
;1342:		}
LABELV $572
line 1325
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 1
LEI4 $571
line 1343
;1343:	}
LABELV $568
line 1324
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 1
LEI4 $567
line 1345
;1344:
;1345:	pm->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 1023
ASGNI4
line 1346
;1346:	pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 1347
;1347:	pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 1349
;1348:
;1349:	return qfalse;
CNSTI4 0
RETI4
LABELV $563
endproc PM_CorrectAllSolid 36 28
proc PM_GroundTraceMissed 80 28
line 1360
;1350:}
;1351:
;1352:
;1353:/*
;1354:=============
;1355:PM_GroundTraceMissed
;1356:
;1357:The ground trace didn't hit a surface, so we are in freefall
;1358:=============
;1359:*/
;1360:static void PM_GroundTraceMissed( void ) {
line 1364
;1361:	trace_t		trace;
;1362:	vec3_t		point;
;1363:
;1364:	if ( pm->ps->groundEntityNum != ENTITYNUM_NONE ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $589
line 1366
;1365:		// we just transitioned into freefall
;1366:		if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $591
line 1367
;1367:			Com_Printf("%i:lift\n", c_pmove);
ADDRGP4 $593
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1368
;1368:		}
LABELV $591
line 1372
;1369:
;1370:		// if they aren't in a jumping animation and the ground is a ways away, force into it
;1371:		// if we didn't do the trace, the player would be backflipping down staircases
;1372:		VectorCopy( pm->ps->origin, point );
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1373
;1373:		point[2] -= 64;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1115684864
SUBF4
ASGNF4
line 1375
;1374:
;1375:		pm->trace (&trace, pm->ps->origin, pm->mins, pm->maxs, point, pm->ps->clientNum, pm->tracemask);
ADDRLP4 12
ARGP4
ADDRLP4 68
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 72
ADDRLP4 68
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 176
ADDP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 188
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
INDIRP4
CNSTI4 216
ADDP4
INDIRP4
CALLV
pop
line 1376
;1376:		if ( trace.fraction == 1.0 ) {
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
NEF4 $595
line 1377
;1377:			if ( pm->cmd.forwardmove >= 0 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LTI4 $598
line 1378
;1378:				PM_ForceLegsAnim( LEGS_JUMP );
CNSTI4 18
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 1379
;1379:				pm->ps->pm_flags &= ~PMF_BACKWARDS_JUMP;
ADDRLP4 76
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 1380
;1380:			} else {
ADDRGP4 $599
JUMPV
LABELV $598
line 1381
;1381:				PM_ForceLegsAnim( LEGS_JUMPB );
CNSTI4 20
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 1382
;1382:				pm->ps->pm_flags |= PMF_BACKWARDS_JUMP;
ADDRLP4 76
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 1383
;1383:			}
LABELV $599
line 1384
;1384:		}
LABELV $595
line 1385
;1385:	}
LABELV $589
line 1387
;1386:
;1387:	pm->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 1023
ASGNI4
line 1388
;1388:	pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 1389
;1389:	pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 1390
;1390:}
LABELV $588
endproc PM_GroundTraceMissed 80 28
proc PM_GroundTrace 84 28
line 1398
;1391:
;1392:
;1393:/*
;1394:=============
;1395:PM_GroundTrace
;1396:=============
;1397:*/
;1398:static void PM_GroundTrace( void ) {
line 1402
;1399:	vec3_t		point;
;1400:	trace_t		trace;
;1401:
;1402:	point[0] = pm->ps->origin[0];
ADDRLP4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ASGNF4
line 1403
;1403:	point[1] = pm->ps->origin[1];
ADDRLP4 56+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 1404
;1404:	point[2] = pm->ps->origin[2] - 0.25;
ADDRLP4 56+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1048576000
SUBF4
ASGNF4
line 1406
;1405:
;1406:	pm->trace (&trace, pm->ps->origin, pm->mins, pm->maxs, point, pm->ps->clientNum, pm->tracemask);
ADDRLP4 0
ARGP4
ADDRLP4 68
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 72
ADDRLP4 68
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 176
ADDP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 188
ADDP4
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
INDIRP4
CNSTI4 216
ADDP4
INDIRP4
CALLV
pop
line 1407
;1407:	pml.groundTrace = trace;
ADDRGP4 pml+52
ADDRLP4 0
INDIRB
ASGNB 56
line 1410
;1408:
;1409:	// do something corrective if the trace starts in a solid...
;1410:	if ( trace.allsolid ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $606
line 1411
;1411:		if ( !PM_CorrectAllSolid(&trace) )
ADDRLP4 0
ARGP4
ADDRLP4 76
ADDRGP4 PM_CorrectAllSolid
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $608
line 1412
;1412:			return;
ADDRGP4 $602
JUMPV
LABELV $608
line 1413
;1413:	}
LABELV $606
line 1416
;1414:
;1415:	// if the trace didn't hit anything, we are in free fall
;1416:	if ( trace.fraction == 1.0 ) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $610
line 1417
;1417:		PM_GroundTraceMissed();
ADDRGP4 PM_GroundTraceMissed
CALLV
pop
line 1418
;1418:		pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 1419
;1419:		pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 1420
;1420:		return;
ADDRGP4 $602
JUMPV
LABELV $610
line 1424
;1421:	}
;1422:
;1423:	// check if getting thrown off the ground
;1424:	if ( pm->ps->velocity[2] > 0 && DotProduct( pm->ps->velocity, trace.plane.normal ) > 10 ) {
ADDRLP4 76
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 0
LEF4 $615
ADDRLP4 76
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0+24
INDIRF4
MULF4
ADDRLP4 76
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 0+24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 76
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 0+24+8
INDIRF4
MULF4
ADDF4
CNSTF4 1092616192
LEF4 $615
line 1425
;1425:		if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $622
line 1426
;1426:			Com_Printf("%i:kickoff\n", c_pmove);
ADDRGP4 $624
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1427
;1427:		}
LABELV $622
line 1429
;1428:		// go into jump animation
;1429:		if ( pm->cmd.forwardmove >= 0 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LTI4 $625
line 1430
;1430:			PM_ForceLegsAnim( LEGS_JUMP );
CNSTI4 18
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 1431
;1431:			pm->ps->pm_flags &= ~PMF_BACKWARDS_JUMP;
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 1432
;1432:		} else {
ADDRGP4 $626
JUMPV
LABELV $625
line 1433
;1433:			PM_ForceLegsAnim( LEGS_JUMPB );
CNSTI4 20
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 1434
;1434:			pm->ps->pm_flags |= PMF_BACKWARDS_JUMP;
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 1435
;1435:		}
LABELV $626
line 1437
;1436:
;1437:		pm->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 1023
ASGNI4
line 1438
;1438:		pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 1439
;1439:		pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 1440
;1440:		return;
ADDRGP4 $602
JUMPV
LABELV $615
line 1444
;1441:	}
;1442:	
;1443:	// slopes that are too steep will not be considered onground
;1444:	if ( trace.plane.normal[2] < MIN_WALK_NORMAL ) {
ADDRLP4 0+24+8
INDIRF4
CNSTF4 1060320051
GEF4 $629
line 1445
;1445:		if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $633
line 1446
;1446:			Com_Printf("%i:steep\n", c_pmove);
ADDRGP4 $635
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1447
;1447:		}
LABELV $633
line 1450
;1448:		// FIXME: if they can't slide down the slope, let them
;1449:		// walk (sharp crevices)
;1450:		pm->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 1023
ASGNI4
line 1451
;1451:		pml.groundPlane = qtrue;
ADDRGP4 pml+48
CNSTI4 1
ASGNI4
line 1452
;1452:		pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 1453
;1453:		return;
ADDRGP4 $602
JUMPV
LABELV $629
line 1456
;1454:	}
;1455:
;1456:	pml.groundPlane = qtrue;
ADDRGP4 pml+48
CNSTI4 1
ASGNI4
line 1457
;1457:	pml.walking = qtrue;
ADDRGP4 pml+44
CNSTI4 1
ASGNI4
line 1460
;1458:
;1459:	// hitting solid ground will end a waterjump
;1460:	if (pm->ps->pm_flags & PMF_TIME_WATERJUMP)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $640
line 1461
;1461:	{
line 1462
;1462:		pm->ps->pm_flags &= ~(PMF_TIME_WATERJUMP | PMF_TIME_LAND);
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
CNSTI4 -289
BANDI4
ASGNI4
line 1463
;1463:		pm->ps->pm_time = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 1464
;1464:	}
LABELV $640
line 1466
;1465:
;1466:	if ( pm->ps->groundEntityNum == ENTITYNUM_NONE ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $642
line 1468
;1467:		// just hit the ground
;1468:		if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $644
line 1469
;1469:			Com_Printf("%i:Land\n", c_pmove);
ADDRGP4 $646
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1470
;1470:		}
LABELV $644
line 1472
;1471:		
;1472:		PM_CrashLand();
ADDRGP4 PM_CrashLand
CALLV
pop
line 1475
;1473:
;1474:		// don't do landing time if we were just going down a slope
;1475:		if ( pml.previous_velocity[2] < -200 ) {
ADDRGP4 pml+124+8
INDIRF4
CNSTF4 3276275712
GEF4 $647
line 1477
;1476:			// don't allow another jump for a little while
;1477:			pm->ps->pm_flags |= PMF_TIME_LAND;
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 1478
;1478:			pm->ps->pm_time = 250;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 250
ASGNI4
line 1479
;1479:		}
LABELV $647
line 1480
;1480:	}
LABELV $642
line 1482
;1481:
;1482:	pm->ps->groundEntityNum = trace.entityNum;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 0+52
INDIRI4
ASGNI4
line 1487
;1483:
;1484:	// don't reset the z velocity for slopes
;1485://	pm->ps->velocity[2] = 0;
;1486:
;1487:	PM_AddTouchEnt( trace.entityNum );
ADDRLP4 0+52
INDIRI4
ARGI4
ADDRGP4 PM_AddTouchEnt
CALLV
pop
line 1488
;1488:}
LABELV $602
endproc PM_GroundTrace 84 28
proc PM_SetWaterLevel 48 8
line 1496
;1489:
;1490:
;1491:/*
;1492:=============
;1493:PM_SetWaterLevel	FIXME: avoid this twice?  certainly if not moving
;1494:=============
;1495:*/
;1496:static void PM_SetWaterLevel( void ) {
line 1505
;1497:	vec3_t		point;
;1498:	int			cont;
;1499:	int			sample1;
;1500:	int			sample2;
;1501:
;1502:	//
;1503:	// get waterlevel, accounting for ducking
;1504:	//
;1505:	pm->waterlevel = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 0
ASGNI4
line 1506
;1506:	pm->watertype = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 1508
;1507:
;1508:	point[0] = pm->ps->origin[0];
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ASGNF4
line 1509
;1509:	point[1] = pm->ps->origin[1];
ADDRLP4 0+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 1510
;1510:	point[2] = pm->ps->origin[2] + MINS_Z + 1;	
ADDRLP4 0+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 3250585600
ADDF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 1511
;1511:	cont = pm->pointcontents( point, pm->ps->clientNum );
ADDRLP4 0
ARGP4
ADDRLP4 24
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 220
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 28
INDIRI4
ASGNI4
line 1513
;1512:
;1513:	if ( cont & MASK_WATER ) {
ADDRLP4 12
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $656
line 1514
;1514:		sample2 = pm->ps->viewheight - MINS_Z;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 -24
SUBI4
ASGNI4
line 1515
;1515:		sample1 = sample2 / 2;
ADDRLP4 20
ADDRLP4 16
INDIRI4
CNSTI4 2
DIVI4
ASGNI4
line 1517
;1516:
;1517:		pm->watertype = cont;
ADDRGP4 pm
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1518
;1518:		pm->waterlevel = 1;
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 1
ASGNI4
line 1519
;1519:		point[2] = pm->ps->origin[2] + MINS_Z + sample1;
ADDRLP4 0+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 3250585600
ADDF4
ADDRLP4 20
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1520
;1520:		cont = pm->pointcontents (point, pm->ps->clientNum );
ADDRLP4 0
ARGP4
ADDRLP4 32
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRLP4 32
INDIRP4
CNSTI4 220
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 36
INDIRI4
ASGNI4
line 1521
;1521:		if ( cont & MASK_WATER ) {
ADDRLP4 12
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $659
line 1522
;1522:			pm->waterlevel = 2;
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 2
ASGNI4
line 1523
;1523:			point[2] = pm->ps->origin[2] + MINS_Z + sample2;
ADDRLP4 0+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 3250585600
ADDF4
ADDRLP4 16
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1524
;1524:			cont = pm->pointcontents (point, pm->ps->clientNum );
ADDRLP4 0
ARGP4
ADDRLP4 40
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
ADDRLP4 40
INDIRP4
CNSTI4 220
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 44
INDIRI4
ASGNI4
line 1525
;1525:			if ( cont & MASK_WATER ){
ADDRLP4 12
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $662
line 1526
;1526:				pm->waterlevel = 3;
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 3
ASGNI4
line 1527
;1527:			}
LABELV $662
line 1528
;1528:		}
LABELV $659
line 1529
;1529:	}
LABELV $656
line 1531
;1530:
;1531:}
LABELV $653
endproc PM_SetWaterLevel 48 8
proc PM_CheckDuck 72 28
line 1541
;1532:
;1533:/*
;1534:==============
;1535:PM_CheckDuck
;1536:
;1537:Sets mins, maxs, and pm->ps->viewheight
;1538:==============
;1539:*/
;1540:static void PM_CheckDuck (void)
;1541:{
line 1544
;1542:	trace_t	trace;
;1543:
;1544:	if ( pm->ps->powerups[PW_INVULNERABILITY] ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 368
ADDP4
INDIRI4
CNSTI4 0
EQI4 $665
line 1545
;1545:		if ( pm->ps->pm_flags & PMF_INVULEXPAND ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $667
line 1547
;1546:			// invulnerability sphere has a 42 units radius
;1547:			VectorSet( pm->mins, -42, -42, -42 );
ADDRGP4 pm
INDIRP4
CNSTI4 176
ADDP4
CNSTF4 3257401344
ASGNF4
ADDRGP4 pm
INDIRP4
CNSTI4 180
ADDP4
CNSTF4 3257401344
ASGNF4
ADDRGP4 pm
INDIRP4
CNSTI4 184
ADDP4
CNSTF4 3257401344
ASGNF4
line 1548
;1548:			VectorSet( pm->maxs, 42, 42, 42 );
ADDRGP4 pm
INDIRP4
CNSTI4 188
ADDP4
CNSTF4 1109917696
ASGNF4
ADDRGP4 pm
INDIRP4
CNSTI4 192
ADDP4
CNSTF4 1109917696
ASGNF4
ADDRGP4 pm
INDIRP4
CNSTI4 196
ADDP4
CNSTF4 1109917696
ASGNF4
line 1549
;1549:		}
ADDRGP4 $668
JUMPV
LABELV $667
line 1550
;1550:		else {
line 1551
;1551:			VectorSet( pm->mins, -15, -15, MINS_Z );
ADDRGP4 pm
INDIRP4
CNSTI4 176
ADDP4
CNSTF4 3245342720
ASGNF4
ADDRGP4 pm
INDIRP4
CNSTI4 180
ADDP4
CNSTF4 3245342720
ASGNF4
ADDRGP4 pm
INDIRP4
CNSTI4 184
ADDP4
CNSTF4 3250585600
ASGNF4
line 1552
;1552:			VectorSet( pm->maxs, 15, 15, 16 );
ADDRGP4 pm
INDIRP4
CNSTI4 188
ADDP4
CNSTF4 1097859072
ASGNF4
ADDRGP4 pm
INDIRP4
CNSTI4 192
ADDP4
CNSTF4 1097859072
ASGNF4
ADDRGP4 pm
INDIRP4
CNSTI4 196
ADDP4
CNSTF4 1098907648
ASGNF4
line 1553
;1553:		}
LABELV $668
line 1554
;1554:		pm->ps->pm_flags |= PMF_DUCKED;
ADDRLP4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 1555
;1555:		pm->ps->viewheight = CROUCH_VIEWHEIGHT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 12
ASGNI4
line 1556
;1556:		return;
ADDRGP4 $664
JUMPV
LABELV $665
line 1558
;1557:	}
;1558:	pm->ps->pm_flags &= ~PMF_INVULEXPAND;
ADDRLP4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 1560
;1559:
;1560:	pm->mins[0] = -15;
ADDRGP4 pm
INDIRP4
CNSTI4 176
ADDP4
CNSTF4 3245342720
ASGNF4
line 1561
;1561:	pm->mins[1] = -15;
ADDRGP4 pm
INDIRP4
CNSTI4 180
ADDP4
CNSTF4 3245342720
ASGNF4
line 1563
;1562:
;1563:	pm->maxs[0] = 15;
ADDRGP4 pm
INDIRP4
CNSTI4 188
ADDP4
CNSTF4 1097859072
ASGNF4
line 1564
;1564:	pm->maxs[1] = 15;
ADDRGP4 pm
INDIRP4
CNSTI4 192
ADDP4
CNSTF4 1097859072
ASGNF4
line 1566
;1565:
;1566:	pm->mins[2] = MINS_Z;
ADDRGP4 pm
INDIRP4
CNSTI4 184
ADDP4
CNSTF4 3250585600
ASGNF4
line 1568
;1567:
;1568:	if (pm->ps->pm_type == PM_DEAD)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $669
line 1569
;1569:	{
line 1570
;1570:		pm->maxs[2] = -8;
ADDRGP4 pm
INDIRP4
CNSTI4 196
ADDP4
CNSTF4 3238002688
ASGNF4
line 1571
;1571:		pm->ps->viewheight = DEAD_VIEWHEIGHT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 -16
ASGNI4
line 1572
;1572:		return;
ADDRGP4 $664
JUMPV
LABELV $669
line 1575
;1573:	}
;1574:
;1575:	if (pm->cmd.upmove < 0)
ADDRGP4 pm
INDIRP4
CNSTI4 27
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $671
line 1576
;1576:	{	// duck
line 1577
;1577:		pm->ps->pm_flags |= PMF_DUCKED;
ADDRLP4 60
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 1578
;1578:	}
ADDRGP4 $672
JUMPV
LABELV $671
line 1580
;1579:	else
;1580:	{	// stand up if possible
line 1581
;1581:		if (pm->ps->pm_flags & PMF_DUCKED)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $673
line 1582
;1582:		{
line 1584
;1583:			// try to stand up
;1584:			pm->maxs[2] = 32;
ADDRGP4 pm
INDIRP4
CNSTI4 196
ADDP4
CNSTF4 1107296256
ASGNF4
line 1585
;1585:			pm->trace (&trace, pm->ps->origin, pm->mins, pm->maxs, pm->ps->origin, pm->ps->clientNum, pm->tracemask );
ADDRLP4 0
ARGP4
ADDRLP4 60
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 64
ADDRLP4 60
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 176
ADDP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 188
ADDP4
ARGP4
ADDRLP4 64
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 64
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
INDIRP4
CNSTI4 216
ADDP4
INDIRP4
CALLV
pop
line 1586
;1586:			if (!trace.allsolid)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $675
line 1587
;1587:				pm->ps->pm_flags &= ~PMF_DUCKED;
ADDRLP4 68
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
LABELV $675
line 1588
;1588:		}
LABELV $673
line 1589
;1589:	}
LABELV $672
line 1591
;1590:
;1591:	if (pm->ps->pm_flags & PMF_DUCKED)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $677
line 1592
;1592:	{
line 1593
;1593:		pm->maxs[2] = 16;
ADDRGP4 pm
INDIRP4
CNSTI4 196
ADDP4
CNSTF4 1098907648
ASGNF4
line 1594
;1594:		pm->ps->viewheight = CROUCH_VIEWHEIGHT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 12
ASGNI4
line 1595
;1595:	}
ADDRGP4 $678
JUMPV
LABELV $677
line 1597
;1596:	else
;1597:	{
line 1598
;1598:		pm->maxs[2] = 32;
ADDRGP4 pm
INDIRP4
CNSTI4 196
ADDP4
CNSTF4 1107296256
ASGNF4
line 1599
;1599:		pm->ps->viewheight = DEFAULT_VIEWHEIGHT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 26
ASGNI4
line 1600
;1600:	}
LABELV $678
line 1601
;1601:}
LABELV $664
endproc PM_CheckDuck 72 28
proc PM_Footsteps 24 4
line 1613
;1602:
;1603:
;1604:
;1605://===================================================================
;1606:
;1607:
;1608:/*
;1609:===============
;1610:PM_Footsteps
;1611:===============
;1612:*/
;1613:static void PM_Footsteps( void ) {
line 1626
;1614:	float		bobmove;
;1615:	float		xyspeedQ;
;1616:	int			old;
;1617:	qboolean	footstep;
;1618:
;1619:	//
;1620:	// calculate speed and cycle to be used for
;1621:	// all cyclic walking effects
;1622:	//
;1623:	//xyspeedQ = pm->ps->velocity[0] * pm->ps->velocity[0] 
;1624:	//	+ pm->ps->velocity[1] * pm->ps->velocity[1];
;1625:
;1626:	if ( pm->ps->groundEntityNum == ENTITYNUM_NONE ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $680
line 1628
;1627:
;1628:		if ( pm->ps->powerups[PW_INVULNERABILITY] ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 368
ADDP4
INDIRI4
CNSTI4 0
EQI4 $682
line 1629
;1629:			PM_ContinueLegsAnim( LEGS_IDLECR );
CNSTI4 23
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1630
;1630:		}
LABELV $682
line 1632
;1631:		// airborne leaves position in cycle intact, but doesn't advance
;1632:		if ( pm->waterlevel > 1 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 1
LEI4 $679
line 1633
;1633:			PM_ContinueLegsAnim( LEGS_SWIM );
CNSTI4 17
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1634
;1634:		}
line 1635
;1635:		return;
ADDRGP4 $679
JUMPV
LABELV $680
line 1639
;1636:	}
;1637:
;1638:	// if not trying to move
;1639:	if ( !pm->cmd.forwardmove && !pm->cmd.rightmove ) {
ADDRLP4 16
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $686
ADDRLP4 16
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $686
line 1640
;1640:		xyspeedQ = pm->ps->velocity[0] * pm->ps->velocity[0] 
ADDRLP4 20
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 20
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDRLP4 20
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1642
;1641:			+ pm->ps->velocity[1] * pm->ps->velocity[1];
;1642:		if ( xyspeedQ < 5.0*5.0 ) { // not using sqrt() there
ADDRLP4 12
INDIRF4
CNSTF4 1103626240
GEF4 $679
line 1643
;1643:			pm->ps->bobCycle = 0;	// start at beginning of cycle again
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
line 1644
;1644:			if ( pm->ps->pm_flags & PMF_DUCKED ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $690
line 1645
;1645:				PM_ContinueLegsAnim( LEGS_IDLECR );
CNSTI4 23
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1646
;1646:			} else {
ADDRGP4 $679
JUMPV
LABELV $690
line 1647
;1647:				PM_ContinueLegsAnim( LEGS_IDLE );
CNSTI4 22
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1648
;1648:			}
line 1649
;1649:		}
line 1650
;1650:		return;
ADDRGP4 $679
JUMPV
LABELV $686
line 1654
;1651:	}
;1652:	
;1653:
;1654:	footstep = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1656
;1655:
;1656:	if ( pm->ps->pm_flags & PMF_DUCKED ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $692
line 1657
;1657:		bobmove = 0.5;	// ducked characters bob much faster
ADDRLP4 4
CNSTF4 1056964608
ASGNF4
line 1658
;1658:		if ( pm->ps->pm_flags & PMF_BACKWARDS_RUN ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $694
line 1659
;1659:			PM_ContinueLegsAnim( LEGS_BACKCR );
CNSTI4 32
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1660
;1660:		}
ADDRGP4 $693
JUMPV
LABELV $694
line 1661
;1661:		else {
line 1662
;1662:			PM_ContinueLegsAnim( LEGS_WALKCR );
CNSTI4 13
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1663
;1663:		}
line 1675
;1664:		// ducked characters never play footsteps
;1665:	/*
;1666:	} else 	if ( pm->ps->pm_flags & PMF_BACKWARDS_RUN ) {
;1667:		if ( !( pm->cmd.buttons & BUTTON_WALKING ) ) {
;1668:			bobmove = 0.4;	// faster speeds bob faster
;1669:			footstep = qtrue;
;1670:		} else {
;1671:			bobmove = 0.3;
;1672:		}
;1673:		PM_ContinueLegsAnim( LEGS_BACK );
;1674:	*/
;1675:	} else {
ADDRGP4 $693
JUMPV
LABELV $692
line 1676
;1676:		if ( !( pm->cmd.buttons & BUTTON_WALKING ) ) {
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $696
line 1677
;1677:			bobmove = 0.4f;	// faster speeds bob faster
ADDRLP4 4
CNSTF4 1053609165
ASGNF4
line 1678
;1678:			if ( pm->ps->pm_flags & PMF_BACKWARDS_RUN ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $698
line 1679
;1679:				PM_ContinueLegsAnim( LEGS_BACK );
CNSTI4 16
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1680
;1680:			}
ADDRGP4 $699
JUMPV
LABELV $698
line 1681
;1681:			else {
line 1682
;1682:				PM_ContinueLegsAnim( LEGS_RUN );
CNSTI4 15
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1683
;1683:			}
LABELV $699
line 1684
;1684:			footstep = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 1685
;1685:		} else {
ADDRGP4 $697
JUMPV
LABELV $696
line 1686
;1686:			bobmove = 0.3f;	// walking bobs slow
ADDRLP4 4
CNSTF4 1050253722
ASGNF4
line 1687
;1687:			if ( pm->ps->pm_flags & PMF_BACKWARDS_RUN ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $700
line 1688
;1688:				PM_ContinueLegsAnim( LEGS_BACKWALK );
CNSTI4 33
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1689
;1689:			}
ADDRGP4 $701
JUMPV
LABELV $700
line 1690
;1690:			else {
line 1691
;1691:				PM_ContinueLegsAnim( LEGS_WALK );
CNSTI4 14
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1692
;1692:			}
LABELV $701
line 1693
;1693:		}
LABELV $697
line 1694
;1694:	}
LABELV $693
line 1697
;1695:
;1696:	// check for footstep / splash sounds
;1697:	old = pm->ps->bobCycle;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1698
;1698:	pm->ps->bobCycle = (int)( old + bobmove * pml.msec ) & 255;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
ADDRGP4 pml+40
INDIRI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
CNSTI4 255
BANDI4
ASGNI4
line 1701
;1699:
;1700:	// if we just crossed a cycle boundary, play an apropriate footstep event
;1701:	if ( ( ( old + 64 ) ^ ( pm->ps->bobCycle + 64 ) ) & 128 ) {
ADDRLP4 0
INDIRI4
CNSTI4 64
ADDI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 64
ADDI4
BXORI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $703
line 1702
;1702:		if ( pm->waterlevel == 0 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 0
NEI4 $705
line 1704
;1703:			// on ground will only play sounds if running
;1704:			if ( footstep ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $706
line 1705
;1705:				PM_AddEvent( PM_FootstepForSurface() );
ADDRLP4 20
ADDRGP4 PM_FootstepForSurface
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1706
;1706:			}
line 1707
;1707:		} else if ( pm->waterlevel == 1 ) {
ADDRGP4 $706
JUMPV
LABELV $705
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 1
NEI4 $709
line 1709
;1708:			// splashing
;1709:			PM_AddEvent( EV_FOOTSPLASH );
CNSTI4 3
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1710
;1710:		} else if ( pm->waterlevel == 2 ) {
ADDRGP4 $710
JUMPV
LABELV $709
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 2
NEI4 $711
line 1712
;1711:			// wading / swimming at surface
;1712:			PM_AddEvent( EV_SWIM );
CNSTI4 5
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1713
;1713:		} else if ( pm->waterlevel == 3 ) {
ADDRGP4 $712
JUMPV
LABELV $711
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 3
NEI4 $713
line 1716
;1714:			// no sound when completely underwater
;1715:
;1716:		}
LABELV $713
LABELV $712
LABELV $710
LABELV $706
line 1717
;1717:	}
LABELV $703
line 1718
;1718:}
LABELV $679
endproc PM_Footsteps 24 4
proc PM_WaterEvents 0 4
line 1727
;1719:
;1720:/*
;1721:==============
;1722:PM_WaterEvents
;1723:
;1724:Generate sound events for entering and leaving water
;1725:==============
;1726:*/
;1727:static void PM_WaterEvents( void ) {		// FIXME?
line 1731
;1728:	//
;1729:	// if just entered a water volume, play a sound
;1730:	//
;1731:	if (!pml.previous_waterlevel && pm->waterlevel) {
ADDRGP4 pml+136
INDIRI4
CNSTI4 0
NEI4 $716
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 0
EQI4 $716
line 1732
;1732:		PM_AddEvent( EV_WATER_TOUCH );
CNSTI4 15
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1733
;1733:	}
LABELV $716
line 1738
;1734:
;1735:	//
;1736:	// if just completely exited a water volume, play a sound
;1737:	//
;1738:	if (pml.previous_waterlevel && !pm->waterlevel) {
ADDRGP4 pml+136
INDIRI4
CNSTI4 0
EQI4 $719
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 0
NEI4 $719
line 1739
;1739:		PM_AddEvent( EV_WATER_LEAVE );
CNSTI4 16
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1740
;1740:	}
LABELV $719
line 1745
;1741:
;1742:	//
;1743:	// check for head just going under water
;1744:	//
;1745:	if (pml.previous_waterlevel != 3 && pm->waterlevel == 3) {
ADDRGP4 pml+136
INDIRI4
CNSTI4 3
EQI4 $722
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 3
NEI4 $722
line 1746
;1746:		PM_AddEvent( EV_WATER_UNDER );
CNSTI4 17
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1747
;1747:	}
LABELV $722
line 1752
;1748:
;1749:	//
;1750:	// check for head just coming out of water
;1751:	//
;1752:	if (pml.previous_waterlevel == 3 && pm->waterlevel != 3) {
ADDRGP4 pml+136
INDIRI4
CNSTI4 3
NEI4 $725
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 3
EQI4 $725
line 1753
;1753:		PM_AddEvent( EV_WATER_CLEAR );
CNSTI4 18
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1754
;1754:	}
LABELV $725
line 1755
;1755:}
LABELV $715
endproc PM_WaterEvents 0 4
proc PM_BeginWeaponChange 8 4
line 1763
;1756:
;1757:
;1758:/*
;1759:===============
;1760:PM_BeginWeaponChange
;1761:===============
;1762:*/
;1763:static void PM_BeginWeaponChange( int weapon ) {
line 1764
;1764:	if ( weapon <= WP_NONE || weapon >= WP_NUM_WEAPONS ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $731
ADDRLP4 0
INDIRI4
CNSTI4 14
LTI4 $729
LABELV $731
line 1765
;1765:		return;
ADDRGP4 $728
JUMPV
LABELV $729
line 1768
;1766:	}
;1767:
;1768:	if ( !( pm->ps->stats[STAT_WEAPONS] & ( 1 << weapon ) ) ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 1
ADDRFP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $732
line 1769
;1769:		return;
ADDRGP4 $728
JUMPV
LABELV $732
line 1772
;1770:	}
;1771:	
;1772:	if ( pm->ps->weaponstate == WEAPON_DROPPING ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $734
line 1773
;1773:		pm->ps->eFlags &= ~EF_FIRING;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -257
BANDI4
ASGNI4
line 1774
;1774:		return;
ADDRGP4 $728
JUMPV
LABELV $734
line 1777
;1775:	}
;1776:
;1777:	PM_AddEvent( EV_CHANGE_WEAPON );
CNSTI4 22
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1778
;1778:	pm->ps->weaponstate = WEAPON_DROPPING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 2
ASGNI4
line 1779
;1779:	pm->ps->weaponTime += 200;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 1780
;1780:	PM_StartTorsoAnim( TORSO_DROP );
CNSTI4 9
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 1781
;1781:}
LABELV $728
endproc PM_BeginWeaponChange 8 4
proc PM_FinishWeaponChange 16 4
line 1789
;1782:
;1783:
;1784:/*
;1785:===============
;1786:PM_FinishWeaponChange
;1787:===============
;1788:*/
;1789:static void PM_FinishWeaponChange( void ) {
line 1792
;1790:	int		weapon;
;1791:
;1792:	weapon = pm->cmd.weapon;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
CNSTI4 24
ADDP4
INDIRU1
CVUI4 1
ASGNI4
line 1793
;1793:	if ( weapon < WP_NONE || weapon >= WP_NUM_WEAPONS ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $739
ADDRLP4 0
INDIRI4
CNSTI4 14
LTI4 $737
LABELV $739
line 1794
;1794:		weapon = WP_NONE;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1795
;1795:	}
LABELV $737
line 1797
;1796:
;1797:	if ( !( pm->ps->stats[STAT_WEAPONS] & ( 1 << weapon ) ) ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $740
line 1798
;1798:		weapon = WP_NONE;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1799
;1799:	}
LABELV $740
line 1801
;1800:
;1801:	pm->ps->weapon = weapon;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1802
;1802:	pm->ps->weaponstate = WEAPON_RAISING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 1
ASGNI4
line 1803
;1803:	pm->ps->eFlags &= ~EF_FIRING;
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -257
BANDI4
ASGNI4
line 1804
;1804:	pm->ps->weaponTime += 250;
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 250
ADDI4
ASGNI4
line 1805
;1805:	PM_StartTorsoAnim( TORSO_RAISE );
CNSTI4 10
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 1806
;1806:}
LABELV $736
endproc PM_FinishWeaponChange 16 4
proc PM_TorsoAnimation 0 4
line 1815
;1807:
;1808:
;1809:/*
;1810:==============
;1811:PM_TorsoAnimation
;1812:
;1813:==============
;1814:*/
;1815:static void PM_TorsoAnimation( void ) {
line 1816
;1816:	if ( pm->ps->weaponstate == WEAPON_READY ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 0
NEI4 $743
line 1817
;1817:		if ( pm->ps->weapon == WP_GAUNTLET ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 1
NEI4 $745
line 1818
;1818:			PM_ContinueTorsoAnim( TORSO_STAND2 );
CNSTI4 12
ARGI4
ADDRGP4 PM_ContinueTorsoAnim
CALLV
pop
line 1819
;1819:		} else {
ADDRGP4 $742
JUMPV
LABELV $745
line 1820
;1820:			PM_ContinueTorsoAnim( TORSO_STAND );
CNSTI4 11
ARGI4
ADDRGP4 PM_ContinueTorsoAnim
CALLV
pop
line 1821
;1821:		}
line 1822
;1822:		return;
LABELV $743
line 1824
;1823:	}
;1824:}
LABELV $742
endproc PM_TorsoAnimation 0 4
proc PM_Weapon 28 4
line 1834
;1825:
;1826:
;1827:/*
;1828:==============
;1829:PM_Weapon
;1830:
;1831:Generates weapon events and modifes the weapon counter
;1832:==============
;1833:*/
;1834:static void PM_Weapon( void ) {
line 1838
;1835:	int		addTime;
;1836:
;1837:	// don't allow attack until all buttons are up
;1838:	if ( pm->ps->pm_flags & PMF_RESPAWNED ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $748
line 1839
;1839:		return;
ADDRGP4 $747
JUMPV
LABELV $748
line 1843
;1840:	}
;1841:
;1842:	// ignore if spectator
;1843:	if ( pm->ps->persistant[PERS_TEAM] == TEAM_SPECTATOR ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 3
NEI4 $750
line 1844
;1844:		return;
ADDRGP4 $747
JUMPV
LABELV $750
line 1848
;1845:	}
;1846:
;1847:	// check for dead player
;1848:	if ( pm->ps->stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $752
line 1849
;1849:		pm->ps->weapon = WP_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 0
ASGNI4
line 1850
;1850:		return;
ADDRGP4 $747
JUMPV
LABELV $752
line 1854
;1851:	}
;1852:
;1853:	// check for item using
;1854:	if ( pm->cmd.buttons & BUTTON_USE_HOLDABLE ) {
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $754
line 1855
;1855:		if ( ! ( pm->ps->pm_flags & PMF_USE_ITEM_HELD ) ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
NEI4 $755
line 1856
;1856:			if ( bg_itemlist[pm->ps->stats[STAT_HOLDABLE_ITEM]].giTag == HI_MEDKIT
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 52
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 2
NEI4 $758
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 25
ADDI4
LTI4 $758
line 1857
;1857:				&& pm->ps->stats[STAT_HEALTH] >= (pm->ps->stats[STAT_MAX_HEALTH] + 25) ) {
line 1859
;1858:				// don't use medkit if at max health
;1859:			} else {
ADDRGP4 $747
JUMPV
LABELV $758
line 1860
;1860:				pm->ps->pm_flags |= PMF_USE_ITEM_HELD;
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1024
BORI4
ASGNI4
line 1861
;1861:				PM_AddEvent( EV_USE_ITEM0 + bg_itemlist[pm->ps->stats[STAT_HOLDABLE_ITEM]].giTag );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 52
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 24
ADDI4
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1862
;1862:				pm->ps->stats[STAT_HOLDABLE_ITEM] = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 0
ASGNI4
line 1863
;1863:			}
line 1864
;1864:			return;
ADDRGP4 $747
JUMPV
line 1866
;1865:		}
;1866:	} else {
LABELV $754
line 1867
;1867:		pm->ps->pm_flags &= ~PMF_USE_ITEM_HELD;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -1025
BANDI4
ASGNI4
line 1868
;1868:	}
LABELV $755
line 1872
;1869:
;1870:
;1871:	// make weapon function
;1872:	if ( pm->ps->weaponTime > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $762
line 1873
;1873:		pm->ps->weaponTime -= pml.msec;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRGP4 pml+40
INDIRI4
SUBI4
ASGNI4
line 1874
;1874:	}
LABELV $762
line 1879
;1875:
;1876:	// check for weapon change
;1877:	// can't change if weapon is firing, but can change
;1878:	// again if lowering or raising
;1879:	if ( pm->ps->weaponTime <= 0 || pm->ps->weaponstate != WEAPON_FIRING ) {
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $767
ADDRLP4 4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 3
EQI4 $765
LABELV $767
line 1880
;1880:		if ( pm->ps->weapon != pm->cmd.weapon ) {
ADDRLP4 8
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRU1
CVUI4 1
EQI4 $768
line 1881
;1881:			PM_BeginWeaponChange( pm->cmd.weapon );
ADDRGP4 pm
INDIRP4
CNSTI4 24
ADDP4
INDIRU1
CVUI4 1
ARGI4
ADDRGP4 PM_BeginWeaponChange
CALLV
pop
line 1882
;1882:		}
LABELV $768
line 1883
;1883:	}
LABELV $765
line 1885
;1884:
;1885:	if ( pm->ps->weaponTime > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $770
line 1886
;1886:		return;
ADDRGP4 $747
JUMPV
LABELV $770
line 1890
;1887:	}
;1888:
;1889:	// change weapon if time
;1890:	if ( pm->ps->weaponstate == WEAPON_DROPPING ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $772
line 1891
;1891:		PM_FinishWeaponChange();
ADDRGP4 PM_FinishWeaponChange
CALLV
pop
line 1892
;1892:		return;
ADDRGP4 $747
JUMPV
LABELV $772
line 1895
;1893:	}
;1894:
;1895:	if ( pm->ps->weaponstate == WEAPON_RAISING ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 1
NEI4 $774
line 1896
;1896:		pm->ps->weaponstate = WEAPON_READY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 1897
;1897:		if ( pm->ps->weapon == WP_GAUNTLET ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 1
NEI4 $776
line 1898
;1898:			PM_StartTorsoAnim( TORSO_STAND2 );
CNSTI4 12
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 1899
;1899:		} else {
ADDRGP4 $747
JUMPV
LABELV $776
line 1900
;1900:			PM_StartTorsoAnim( TORSO_STAND );
CNSTI4 11
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 1901
;1901:		}
line 1902
;1902:		return;
ADDRGP4 $747
JUMPV
LABELV $774
line 1906
;1903:	}
;1904:
;1905:	// check for fire
;1906:	if ( ! (pm->cmd.buttons & BUTTON_ATTACK) ) {
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $778
line 1907
;1907:		pm->ps->weaponTime = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 1908
;1908:		pm->ps->weaponstate = WEAPON_READY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 1909
;1909:		return;
ADDRGP4 $747
JUMPV
LABELV $778
line 1913
;1910:	}
;1911:
;1912:	// start the animation even if out of ammo
;1913:	if ( pm->ps->weapon == WP_GAUNTLET ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 1
NEI4 $780
line 1915
;1914:		// the guantlet only "fires" when it actually hits something
;1915:		if ( !pm->gauntletHit ) {
ADDRGP4 pm
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 0
NEI4 $782
line 1916
;1916:			pm->ps->weaponTime = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 1917
;1917:			pm->ps->weaponstate = WEAPON_READY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 1918
;1918:			return;
ADDRGP4 $747
JUMPV
LABELV $782
line 1920
;1919:		}
;1920:		PM_StartTorsoAnim( TORSO_ATTACK2 );
CNSTI4 8
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 1921
;1921:	} else {
ADDRGP4 $781
JUMPV
LABELV $780
line 1922
;1922:		PM_StartTorsoAnim( TORSO_ATTACK );
CNSTI4 7
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 1923
;1923:	}
LABELV $781
line 1925
;1924:
;1925:	pm->ps->weaponstate = WEAPON_FIRING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 3
ASGNI4
line 1928
;1926:
;1927:	// check for out of ammo
;1928:	if ( ! pm->ps->ammo[ pm->ps->weapon ] ) {
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $784
line 1929
;1929:		PM_AddEvent( EV_NOAMMO );
CNSTI4 21
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1930
;1930:		pm->ps->weaponTime += 500;
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 1931
;1931:		return;
ADDRGP4 $747
JUMPV
LABELV $784
line 1935
;1932:	}
;1933:
;1934:	// take an ammo away if not infinite
;1935:	if ( pm->ps->ammo[ pm->ps->weapon ] != -1 ) {
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $786
line 1936
;1936:		pm->ps->ammo[ pm->ps->weapon ]--;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 16
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
INDIRP4
CNSTI4 376
ADDP4
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1937
;1937:	}
LABELV $786
line 1940
;1938:
;1939:	// fire weapon
;1940:	PM_AddEvent( EV_FIRE_WEAPON );
CNSTI4 23
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1942
;1941:
;1942:	switch( pm->ps->weapon ) {
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 1
LTI4 $788
ADDRLP4 16
INDIRI4
CNSTI4 13
GTI4 $788
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $804-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $804
address $791
address $794
address $793
address $795
address $796
address $792
address $798
address $797
address $799
address $800
address $801
address $802
address $803
code
LABELV $788
LABELV $791
line 1945
;1943:	default:
;1944:	case WP_GAUNTLET:
;1945:		addTime = 400;
ADDRLP4 0
CNSTI4 400
ASGNI4
line 1946
;1946:		break;
ADDRGP4 $789
JUMPV
LABELV $792
line 1948
;1947:	case WP_LIGHTNING:
;1948:		addTime = 50;
ADDRLP4 0
CNSTI4 50
ASGNI4
line 1949
;1949:		break;
ADDRGP4 $789
JUMPV
LABELV $793
line 1951
;1950:	case WP_SHOTGUN:
;1951:		addTime = 1000;
ADDRLP4 0
CNSTI4 1000
ASGNI4
line 1952
;1952:		break;
ADDRGP4 $789
JUMPV
LABELV $794
line 1954
;1953:	case WP_MACHINEGUN:
;1954:		addTime = 100;
ADDRLP4 0
CNSTI4 100
ASGNI4
line 1955
;1955:		break;
ADDRGP4 $789
JUMPV
LABELV $795
line 1957
;1956:	case WP_GRENADE_LAUNCHER:
;1957:		addTime = 800;
ADDRLP4 0
CNSTI4 800
ASGNI4
line 1958
;1958:		break;
ADDRGP4 $789
JUMPV
LABELV $796
line 1960
;1959:	case WP_ROCKET_LAUNCHER:
;1960:		addTime = 800;
ADDRLP4 0
CNSTI4 800
ASGNI4
line 1961
;1961:		break;
ADDRGP4 $789
JUMPV
LABELV $797
line 1963
;1962:	case WP_PLASMAGUN:
;1963:		addTime = 100;
ADDRLP4 0
CNSTI4 100
ASGNI4
line 1964
;1964:		break;
ADDRGP4 $789
JUMPV
LABELV $798
line 1966
;1965:	case WP_RAILGUN:
;1966:		addTime = 1500;
ADDRLP4 0
CNSTI4 1500
ASGNI4
line 1967
;1967:		break;
ADDRGP4 $789
JUMPV
LABELV $799
line 1969
;1968:	case WP_BFG:
;1969:		addTime = 200;
ADDRLP4 0
CNSTI4 200
ASGNI4
line 1970
;1970:		break;
ADDRGP4 $789
JUMPV
LABELV $800
line 1972
;1971:	case WP_GRAPPLING_HOOK:
;1972:		addTime = 400;
ADDRLP4 0
CNSTI4 400
ASGNI4
line 1973
;1973:		break;
ADDRGP4 $789
JUMPV
LABELV $801
line 1975
;1974:	case WP_NAILGUN:
;1975:		addTime = 1000;
ADDRLP4 0
CNSTI4 1000
ASGNI4
line 1976
;1976:		break;
ADDRGP4 $789
JUMPV
LABELV $802
line 1978
;1977:	case WP_PROX_LAUNCHER:
;1978:		addTime = 800;
ADDRLP4 0
CNSTI4 800
ASGNI4
line 1979
;1979:		break;
ADDRGP4 $789
JUMPV
LABELV $803
line 1981
;1980:	case WP_CHAINGUN:
;1981:		addTime = 30;
ADDRLP4 0
CNSTI4 30
ASGNI4
line 1982
;1982:		break;
LABELV $789
line 1985
;1983:	}
;1984:
;1985:	if( bg_itemlist[pm->ps->stats[STAT_PERSISTANT_POWERUP]].giTag == PW_SCOUT ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 52
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 10
NEI4 $806
line 1986
;1986:		addTime /= 1.5;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1059760811
MULF4
CVFI4 4
ASGNI4
line 1987
;1987:	}
ADDRGP4 $807
JUMPV
LABELV $806
line 1989
;1988:	else
;1989:	if( bg_itemlist[pm->ps->stats[STAT_PERSISTANT_POWERUP]].giTag == PW_AMMOREGEN ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 52
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 13
NEI4 $809
line 1990
;1990:		addTime /= 1.3;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1061481551
MULF4
CVFI4 4
ASGNI4
line 1991
;1991:  }
ADDRGP4 $810
JUMPV
LABELV $809
line 1994
;1992:  else
;1993:
;1994:	if ( pm->ps->powerups[PW_HASTE] ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 324
ADDP4
INDIRI4
CNSTI4 0
EQI4 $812
line 1995
;1995:		addTime /= 1.3;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1061481551
MULF4
CVFI4 4
ASGNI4
line 1996
;1996:	}
LABELV $812
LABELV $810
LABELV $807
line 1998
;1997:
;1998:	pm->ps->weaponTime += addTime;
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 1999
;1999:}
LABELV $747
endproc PM_Weapon 28 4
proc PM_Animate 0 4
line 2007
;2000:
;2001:/*
;2002:================
;2003:PM_Animate
;2004:================
;2005:*/
;2006:
;2007:static void PM_Animate( void ) {
line 2008
;2008:	if ( pm->cmd.buttons & BUTTON_GESTURE ) {
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $815
line 2009
;2009:		if ( pm->ps->torsoTimer == 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 0
NEI4 $816
line 2010
;2010:			PM_StartTorsoAnim( TORSO_GESTURE );
CNSTI4 6
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 2011
;2011:			pm->ps->torsoTimer = TIMER_GESTURE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
CNSTI4 2294
ASGNI4
line 2012
;2012:			PM_AddEvent( EV_TAUNT );
CNSTI4 76
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 2013
;2013:		}
line 2014
;2014:	} else if ( pm->cmd.buttons & BUTTON_GETFLAG ) {
ADDRGP4 $816
JUMPV
LABELV $815
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $819
line 2015
;2015:		if ( pm->ps->torsoTimer == 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 0
NEI4 $820
line 2016
;2016:			PM_StartTorsoAnim( TORSO_GETFLAG );
CNSTI4 25
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 2017
;2017:			pm->ps->torsoTimer = 600;	//TIMER_GESTURE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
CNSTI4 600
ASGNI4
line 2018
;2018:		}
line 2019
;2019:	} else if ( pm->cmd.buttons & BUTTON_GUARDBASE ) {
ADDRGP4 $820
JUMPV
LABELV $819
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $823
line 2020
;2020:		if ( pm->ps->torsoTimer == 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 0
NEI4 $824
line 2021
;2021:			PM_StartTorsoAnim( TORSO_GUARDBASE );
CNSTI4 26
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 2022
;2022:			pm->ps->torsoTimer = 600;	//TIMER_GESTURE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
CNSTI4 600
ASGNI4
line 2023
;2023:		}
line 2024
;2024:	} else if ( pm->cmd.buttons & BUTTON_PATROL ) {
ADDRGP4 $824
JUMPV
LABELV $823
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $827
line 2025
;2025:		if ( pm->ps->torsoTimer == 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 0
NEI4 $828
line 2026
;2026:			PM_StartTorsoAnim( TORSO_PATROL );
CNSTI4 27
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 2027
;2027:			pm->ps->torsoTimer = 600;	//TIMER_GESTURE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
CNSTI4 600
ASGNI4
line 2028
;2028:		}
line 2029
;2029:	} else if ( pm->cmd.buttons & BUTTON_FOLLOWME ) {
ADDRGP4 $828
JUMPV
LABELV $827
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $831
line 2030
;2030:		if ( pm->ps->torsoTimer == 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 0
NEI4 $832
line 2031
;2031:			PM_StartTorsoAnim( TORSO_FOLLOWME );
CNSTI4 28
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 2032
;2032:			pm->ps->torsoTimer = 600;	//TIMER_GESTURE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
CNSTI4 600
ASGNI4
line 2033
;2033:		}
line 2034
;2034:	} else if ( pm->cmd.buttons & BUTTON_AFFIRMATIVE ) {
ADDRGP4 $832
JUMPV
LABELV $831
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $835
line 2035
;2035:		if ( pm->ps->torsoTimer == 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 0
NEI4 $836
line 2036
;2036:			PM_StartTorsoAnim( TORSO_AFFIRMATIVE);
CNSTI4 29
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 2037
;2037:			pm->ps->torsoTimer = 600;	//TIMER_GESTURE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
CNSTI4 600
ASGNI4
line 2038
;2038:		}
line 2039
;2039:	} else if ( pm->cmd.buttons & BUTTON_NEGATIVE ) {
ADDRGP4 $836
JUMPV
LABELV $835
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $839
line 2040
;2040:		if ( pm->ps->torsoTimer == 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 0
NEI4 $841
line 2041
;2041:			PM_StartTorsoAnim( TORSO_NEGATIVE );
CNSTI4 30
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 2042
;2042:			pm->ps->torsoTimer = 600;	//TIMER_GESTURE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
CNSTI4 600
ASGNI4
line 2043
;2043:		}
LABELV $841
line 2044
;2044:	}
LABELV $839
LABELV $836
LABELV $832
LABELV $828
LABELV $824
LABELV $820
LABELV $816
line 2045
;2045:}
LABELV $814
endproc PM_Animate 0 4
proc PM_DropTimers 4 0
line 2053
;2046:
;2047:
;2048:/*
;2049:================
;2050:PM_DropTimers
;2051:================
;2052:*/
;2053:static void PM_DropTimers( void ) {
line 2055
;2054:	// drop misc timing counter
;2055:	if ( pm->ps->pm_time ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $844
line 2056
;2056:		if ( pml.msec >= pm->ps->pm_time ) {
ADDRGP4 pml+40
INDIRI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
LTI4 $846
line 2057
;2057:			pm->ps->pm_flags &= ~PMF_ALL_TIMES;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -353
BANDI4
ASGNI4
line 2058
;2058:			pm->ps->pm_time = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 2059
;2059:		} else {
ADDRGP4 $847
JUMPV
LABELV $846
line 2060
;2060:			pm->ps->pm_time -= pml.msec;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 pml+40
INDIRI4
SUBI4
ASGNI4
line 2061
;2061:		}
LABELV $847
line 2062
;2062:	}
LABELV $844
line 2065
;2063:
;2064:	// drop animation counter
;2065:	if ( pm->ps->legsTimer > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
LEI4 $850
line 2066
;2066:		pm->ps->legsTimer -= pml.msec;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 pml+40
INDIRI4
SUBI4
ASGNI4
line 2067
;2067:		if ( pm->ps->legsTimer < 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
GEI4 $853
line 2068
;2068:			pm->ps->legsTimer = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 0
ASGNI4
line 2069
;2069:		}
LABELV $853
line 2070
;2070:	}
LABELV $850
line 2072
;2071:
;2072:	if ( pm->ps->torsoTimer > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 0
LEI4 $855
line 2073
;2073:		pm->ps->torsoTimer -= pml.msec;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 pml+40
INDIRI4
SUBI4
ASGNI4
line 2074
;2074:		if ( pm->ps->torsoTimer < 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 0
GEI4 $858
line 2075
;2075:			pm->ps->torsoTimer = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
CNSTI4 0
ASGNI4
line 2076
;2076:		}
LABELV $858
line 2077
;2077:	}
LABELV $855
line 2078
;2078:}
LABELV $843
endproc PM_DropTimers 4 0
export PM_UpdateViewAngles
proc PM_UpdateViewAngles 24 0
line 2088
;2079:
;2080:/*
;2081:================
;2082:PM_UpdateViewAngles
;2083:
;2084:This can be used as another entry point when only the viewangles
;2085:are being updated instead of a full move
;2086:================
;2087:*/
;2088:void PM_UpdateViewAngles( playerState_t *ps, const usercmd_t *cmd ) {
line 2092
;2089:	short		temp;
;2090:	int		i;
;2091:
;2092:	if ( ps->pm_type == PM_INTERMISSION || ps->pm_type == PM_SPINTERMISSION) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 5
EQI4 $863
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 6
NEI4 $861
LABELV $863
line 2093
;2093:		return;		// no view changes at all
ADDRGP4 $860
JUMPV
LABELV $861
line 2096
;2094:	}
;2095:
;2096:	if ( ps->pm_type != PM_SPECTATOR && ps->stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $864
ADDRLP4 12
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $864
line 2097
;2097:		return;		// no view changes at all
ADDRGP4 $860
JUMPV
LABELV $864
line 2101
;2098:	}
;2099:
;2100:	// circularly clamp the angles with deltas
;2101:	for (i=0 ; i<3 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $866
line 2102
;2102:		temp = cmd->angles[i] + ps->delta_angles[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
ADDP4
INDIRI4
ADDI4
CVII2 4
ASGNI2
line 2103
;2103:		if ( i == PITCH ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $870
line 2105
;2104:			// don't let the player look up or down more than 90 degrees
;2105:			if ( temp > 16000 ) {
ADDRLP4 4
INDIRI2
CVII4 2
CNSTI4 16000
LEI4 $872
line 2106
;2106:				ps->delta_angles[i] = (16000 - cmd->angles[i]) & 0xFFFF;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
ADDP4
CNSTI4 16000
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDP4
INDIRI4
SUBI4
CNSTI4 65535
BANDI4
ASGNI4
line 2107
;2107:				temp = 16000;
ADDRLP4 4
CNSTI2 16000
ASGNI2
line 2108
;2108:			} else if ( temp < -16000 ) {
ADDRGP4 $873
JUMPV
LABELV $872
ADDRLP4 4
INDIRI2
CVII4 2
CNSTI4 -16000
GEI4 $874
line 2109
;2109:				ps->delta_angles[i] = (-16000 - cmd->angles[i]) & 0xFFFF;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
ADDP4
CNSTI4 -16000
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDP4
INDIRI4
SUBI4
CNSTI4 65535
BANDI4
ASGNI4
line 2110
;2110:				temp = -16000;
ADDRLP4 4
CNSTI2 -16000
ASGNI2
line 2111
;2111:			}
LABELV $874
LABELV $873
line 2112
;2112:		}
LABELV $870
line 2113
;2113:		ps->viewangles[i] = SHORT2ANGLE(temp);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
ADDP4
ADDRLP4 4
INDIRI2
CVII4 2
CVIF4 4
CNSTF4 1001652224
MULF4
ASGNF4
line 2114
;2114:	}
LABELV $867
line 2101
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $866
line 2116
;2115:
;2116:}
LABELV $860
endproc PM_UpdateViewAngles 24 0
export PmoveSingle
proc PmoveSingle 36 16
line 2127
;2117:
;2118:
;2119:/*
;2120:================
;2121:PmoveSingle
;2122:
;2123:================
;2124:*/
;2125:void trap_SnapVector( float *v );
;2126:
;2127:void PmoveSingle (pmove_t *pmove) {
line 2128
;2128:	pm = pmove;
ADDRGP4 pm
ADDRFP4 0
INDIRP4
ASGNP4
line 2132
;2129:
;2130:	// this counter lets us debug movement problems with a journal
;2131:	// by setting a conditional breakpoint fot the previous frame
;2132:	c_pmove++;
ADDRLP4 0
ADDRGP4 c_pmove
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2135
;2133:
;2134:	// clear results
;2135:	pm->numtouch = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 2136
;2136:	pm->watertype = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 2137
;2137:	pm->waterlevel = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 0
ASGNI4
line 2139
;2138:
;2139:	if ( pm->ps->stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $877
line 2140
;2140:		pm->tracemask &= ~CONTENTS_BODY;	// corpses can fly through bodies
ADDRLP4 4
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -33554433
BANDI4
ASGNI4
line 2141
;2141:	}
LABELV $877
line 2145
;2142:
;2143:	// make sure walking button is clear if they are running, to avoid
;2144:	// proxy no-footsteps cheats
;2145:	if ( abs( pm->cmd.forwardmove ) > 64 || abs( pm->cmd.rightmove ) > 64 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 4
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 64
GTI4 $881
ADDRGP4 pm
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 64
LEI4 $879
LABELV $881
line 2146
;2146:		pm->cmd.buttons &= ~BUTTON_WALKING;
ADDRLP4 12
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 2147
;2147:	}
LABELV $879
line 2150
;2148:
;2149:	// set the talk balloon flag
;2150:	if ( pm->cmd.buttons & BUTTON_TALK ) {
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $882
line 2151
;2151:		pm->ps->eFlags |= EF_TALK;
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 2152
;2152:	} else {
ADDRGP4 $883
JUMPV
LABELV $882
line 2153
;2153:		pm->ps->eFlags &= ~EF_TALK;
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 -4097
BANDI4
ASGNI4
line 2154
;2154:	}
LABELV $883
line 2157
;2155:
;2156:	// set the firing flag for continuous beam weapons
;2157:	if ( !(pm->ps->pm_flags & PMF_RESPAWNED) && pm->ps->pm_type != PM_INTERMISSION && pm->ps->pm_type != PM_NOCLIP
ADDRLP4 12
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
NEI4 $884
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 5
EQI4 $884
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
EQI4 $884
ADDRLP4 12
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $884
ADDRLP4 16
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $884
line 2158
;2158:		&& ( pm->cmd.buttons & BUTTON_ATTACK ) && pm->ps->ammo[ pm->ps->weapon ] ) {
line 2159
;2159:		pm->ps->eFlags |= EF_FIRING;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 2160
;2160:	} else {
ADDRGP4 $885
JUMPV
LABELV $884
line 2161
;2161:		pm->ps->eFlags &= ~EF_FIRING;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 -257
BANDI4
ASGNI4
line 2162
;2162:	}
LABELV $885
line 2165
;2163:
;2164:	// clear the respawned flag if attack and use are cleared
;2165:	if ( pm->ps->stats[STAT_HEALTH] > 0 && 
ADDRLP4 20
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
LEI4 $886
ADDRLP4 20
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 5
BANDI4
CNSTI4 0
NEI4 $886
line 2166
;2166:		!( pm->cmd.buttons & (BUTTON_ATTACK | BUTTON_USE_HOLDABLE) ) ) {
line 2167
;2167:		pm->ps->pm_flags &= ~PMF_RESPAWNED;
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 -513
BANDI4
ASGNI4
line 2168
;2168:	}
LABELV $886
line 2173
;2169:
;2170:	// if talk button is down, dissallow all other input
;2171:	// this is to prevent any possible intercept proxy from
;2172:	// adding fake talk balloons
;2173:	if ( pmove->cmd.buttons & BUTTON_TALK ) {
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $888
line 2176
;2174:		// keep the talk button set tho for when the cmd.serverTime > 66 msec
;2175:		// and the same cmd is used multiple times in Pmove
;2176:		pmove->cmd.buttons = BUTTON_TALK;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTI4 2
ASGNI4
line 2177
;2177:		pmove->cmd.forwardmove = 0;
ADDRFP4 0
INDIRP4
CNSTI4 25
ADDP4
CNSTI1 0
ASGNI1
line 2178
;2178:		pmove->cmd.rightmove = 0;
ADDRFP4 0
INDIRP4
CNSTI4 26
ADDP4
CNSTI1 0
ASGNI1
line 2179
;2179:		pmove->cmd.upmove = 0;
ADDRFP4 0
INDIRP4
CNSTI4 27
ADDP4
CNSTI1 0
ASGNI1
line 2180
;2180:	}
LABELV $888
line 2183
;2181:
;2182:	// clear all pmove local vars
;2183:	memset (&pml, 0, sizeof(pml));
ADDRGP4 pml
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2186
;2184:
;2185:	// determine the time
;2186:	pml.msec = pmove->cmd.serverTime - pm->ps->commandTime;
ADDRGP4 pml+40
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRGP4 pm
INDIRP4
INDIRP4
INDIRI4
SUBI4
ASGNI4
line 2187
;2187:	if ( pml.msec < 1 ) {
ADDRGP4 pml+40
INDIRI4
CNSTI4 1
GEI4 $891
line 2188
;2188:		pml.msec = 1;
ADDRGP4 pml+40
CNSTI4 1
ASGNI4
line 2189
;2189:	} else if ( pml.msec > 200 ) {
ADDRGP4 $892
JUMPV
LABELV $891
ADDRGP4 pml+40
INDIRI4
CNSTI4 200
LEI4 $895
line 2190
;2190:		pml.msec = 200;
ADDRGP4 pml+40
CNSTI4 200
ASGNI4
line 2191
;2191:	}
LABELV $895
LABELV $892
line 2192
;2192:	pm->ps->commandTime = pmove->cmd.serverTime;
ADDRGP4 pm
INDIRP4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 2195
;2193:
;2194:	// save old org in case we get stuck
;2195:	VectorCopy (pm->ps->origin, pml.previous_origin);
ADDRGP4 pml+112
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2198
;2196:
;2197:	// save old velocity for crashlanding
;2198:	VectorCopy (pm->ps->velocity, pml.previous_velocity);
ADDRGP4 pml+124
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 2200
;2199:
;2200:	pml.frametime = pml.msec * 0.001;
ADDRGP4 pml+36
ADDRGP4 pml+40
INDIRI4
CVIF4 4
CNSTF4 981668463
MULF4
ASGNF4
line 2203
;2201:
;2202:	// update the viewangles
;2203:	PM_UpdateViewAngles( pm->ps, &pm->cmd );
ADDRLP4 24
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 PM_UpdateViewAngles
CALLV
pop
line 2205
;2204:
;2205:	AngleVectors (pm->ps->viewangles, pml.forward, pml.right, pml.up);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRGP4 pml
ARGP4
ADDRGP4 pml+12
ARGP4
ADDRGP4 pml+24
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2207
;2206:
;2207:	if ( pm->cmd.upmove < 10 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 27
ADDP4
INDIRI1
CVII4 1
CNSTI4 10
GEI4 $905
line 2209
;2208:		// not holding jump
;2209:		pm->ps->pm_flags &= ~PMF_JUMP_HELD;
ADDRLP4 28
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 -3
BANDI4
ASGNI4
line 2210
;2210:	}
LABELV $905
line 2213
;2211:
;2212:	// decide if backpedaling animations should be used
;2213:	if ( pm->cmd.forwardmove < 0 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $907
line 2214
;2214:		pm->ps->pm_flags |= PMF_BACKWARDS_RUN;
ADDRLP4 28
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 2215
;2215:	} else if ( pm->cmd.forwardmove > 0 || ( pm->cmd.forwardmove == 0 && pm->cmd.rightmove ) ) {
ADDRGP4 $908
JUMPV
LABELV $907
ADDRLP4 28
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GTI4 $911
ADDRLP4 28
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $909
ADDRLP4 28
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $909
LABELV $911
line 2216
;2216:		pm->ps->pm_flags &= ~PMF_BACKWARDS_RUN;
ADDRLP4 32
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 2217
;2217:	}
LABELV $909
LABELV $908
line 2219
;2218:
;2219:	if ( pm->ps->pm_type >= PM_DEAD ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
LTI4 $912
line 2220
;2220:		pm->cmd.forwardmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
CNSTI1 0
ASGNI1
line 2221
;2221:		pm->cmd.rightmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 26
ADDP4
CNSTI1 0
ASGNI1
line 2222
;2222:		pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 27
ADDP4
CNSTI1 0
ASGNI1
line 2223
;2223:	}
LABELV $912
line 2225
;2224:
;2225:	if ( pm_respawntimer ) {
ADDRGP4 pm_respawntimer
INDIRI4
CNSTI4 0
EQI4 $914
line 2226
;2226:		pm_respawntimer -= pml.msec;
ADDRLP4 32
ADDRGP4 pm_respawntimer
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
ADDRGP4 pml+40
INDIRI4
SUBI4
ASGNI4
line 2227
;2227:		if ( pm_respawntimer < 0 ) {
ADDRGP4 pm_respawntimer
INDIRI4
CNSTI4 0
GEI4 $917
line 2228
;2228:			pm_respawntimer = 0;
ADDRGP4 pm_respawntimer
CNSTI4 0
ASGNI4
line 2229
;2229:		}
LABELV $917
line 2230
;2230:	}
LABELV $914
line 2232
;2231:
;2232:	if ( pm->ps->pm_type == PM_SPECTATOR ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $919
line 2233
;2233:		PM_CheckDuck ();
ADDRGP4 PM_CheckDuck
CALLV
pop
line 2234
;2234:		PM_FlyMove ();
ADDRGP4 PM_FlyMove
CALLV
pop
line 2235
;2235:		PM_DropTimers ();
ADDRGP4 PM_DropTimers
CALLV
pop
line 2236
;2236:		return;
ADDRGP4 $876
JUMPV
LABELV $919
line 2239
;2237:	}
;2238:
;2239:	if ( pm->ps->pm_type == PM_NOCLIP ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $921
line 2240
;2240:		PM_NoclipMove ();
ADDRGP4 PM_NoclipMove
CALLV
pop
line 2241
;2241:		PM_DropTimers ();
ADDRGP4 PM_DropTimers
CALLV
pop
line 2242
;2242:		return;
ADDRGP4 $876
JUMPV
LABELV $921
line 2245
;2243:	}
;2244:
;2245:	if (pm->ps->pm_type == PM_FREEZE) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 4
NEI4 $923
line 2246
;2246:		return;		// no movement at all
ADDRGP4 $876
JUMPV
LABELV $923
line 2249
;2247:	}
;2248:
;2249:	if ( pm->ps->pm_type == PM_INTERMISSION || pm->ps->pm_type == PM_SPINTERMISSION) {
ADDRLP4 32
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 5
EQI4 $927
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 6
NEI4 $925
LABELV $927
line 2250
;2250:		return;		// no movement at all
ADDRGP4 $876
JUMPV
LABELV $925
line 2254
;2251:	}
;2252:
;2253:	// set watertype, and waterlevel
;2254:	PM_SetWaterLevel();
ADDRGP4 PM_SetWaterLevel
CALLV
pop
line 2255
;2255:	pml.previous_waterlevel = pmove->waterlevel;
ADDRGP4 pml+136
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
ASGNI4
line 2258
;2256:
;2257:	// set mins, maxs, and viewheight
;2258:	PM_CheckDuck ();
ADDRGP4 PM_CheckDuck
CALLV
pop
line 2261
;2259:
;2260:	// set groundentity
;2261:	PM_GroundTrace();
ADDRGP4 PM_GroundTrace
CALLV
pop
line 2263
;2262:
;2263:	if ( pm->ps->pm_type == PM_DEAD ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $929
line 2264
;2264:		PM_DeadMove ();
ADDRGP4 PM_DeadMove
CALLV
pop
line 2265
;2265:	}
LABELV $929
line 2267
;2266:
;2267:	PM_DropTimers();
ADDRGP4 PM_DropTimers
CALLV
pop
line 2269
;2268:
;2269:	if ( pm->ps->powerups[PW_INVULNERABILITY] ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 368
ADDP4
INDIRI4
CNSTI4 0
EQI4 $931
line 2270
;2270:		PM_InvulnerabilityMove();
ADDRGP4 PM_InvulnerabilityMove
CALLV
pop
line 2271
;2271:	} else if ( pm->ps->powerups[PW_FLIGHT] ) {
ADDRGP4 $932
JUMPV
LABELV $931
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
CNSTI4 0
EQI4 $933
line 2273
;2272:		// flight powerup doesn't allow jump and has different friction
;2273:		PM_FlyMove();
ADDRGP4 PM_FlyMove
CALLV
pop
line 2274
;2274:	} else if (pm->ps->pm_flags & PMF_GRAPPLE_PULL) {
ADDRGP4 $934
JUMPV
LABELV $933
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $935
line 2275
;2275:		PM_GrappleMove();
ADDRGP4 PM_GrappleMove
CALLV
pop
line 2277
;2276:		// We can wiggle a bit
;2277:		PM_AirMove();
ADDRGP4 PM_AirMove
CALLV
pop
line 2278
;2278:	} else if (pm->ps->pm_flags & PMF_TIME_WATERJUMP) {
ADDRGP4 $936
JUMPV
LABELV $935
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $937
line 2279
;2279:		PM_WaterJumpMove();
ADDRGP4 PM_WaterJumpMove
CALLV
pop
line 2280
;2280:	} else if ( pm->waterlevel > 1 ) {
ADDRGP4 $938
JUMPV
LABELV $937
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 1
LEI4 $939
line 2282
;2281:		// swimming
;2282:		PM_WaterMove();
ADDRGP4 PM_WaterMove
CALLV
pop
line 2283
;2283:	} else if ( pml.walking ) {
ADDRGP4 $940
JUMPV
LABELV $939
ADDRGP4 pml+44
INDIRI4
CNSTI4 0
EQI4 $941
line 2285
;2284:		// walking on ground
;2285:		PM_WalkMove();
ADDRGP4 PM_WalkMove
CALLV
pop
line 2286
;2286:	} else {
ADDRGP4 $942
JUMPV
LABELV $941
line 2288
;2287:		// airborne
;2288:		PM_AirMove();
ADDRGP4 PM_AirMove
CALLV
pop
line 2289
;2289:	}
LABELV $942
LABELV $940
LABELV $938
LABELV $936
LABELV $934
LABELV $932
line 2291
;2290:
;2291:	PM_Animate();
ADDRGP4 PM_Animate
CALLV
pop
line 2294
;2292:
;2293:	// set groundentity, watertype, and waterlevel
;2294:	PM_GroundTrace();
ADDRGP4 PM_GroundTrace
CALLV
pop
line 2295
;2295:	PM_SetWaterLevel();
ADDRGP4 PM_SetWaterLevel
CALLV
pop
line 2298
;2296:
;2297:	// weapons
;2298:	PM_Weapon();
ADDRGP4 PM_Weapon
CALLV
pop
line 2301
;2299:
;2300:	// torso animation
;2301:	PM_TorsoAnimation();
ADDRGP4 PM_TorsoAnimation
CALLV
pop
line 2304
;2302:
;2303:	// footstep events / legs animations
;2304:	PM_Footsteps();
ADDRGP4 PM_Footsteps
CALLV
pop
line 2307
;2305:
;2306:	// entering / leaving water splashes
;2307:	PM_WaterEvents();
ADDRGP4 PM_WaterEvents
CALLV
pop
line 2309
;2308:
;2309:	if ( pm->ps->powerups[PW_FLIGHT] && !pml.groundPlane ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
CNSTI4 0
EQI4 $944
ADDRGP4 pml+48
INDIRI4
CNSTI4 0
NEI4 $944
line 2311
;2310:		// don't snap velocity in free-fly or we will be not able to stop via flight friction
;2311:		return;
ADDRGP4 $876
JUMPV
LABELV $944
line 2315
;2312:	}
;2313:
;2314:	// snap some parts of playerstate to save network bandwidth
;2315:	trap_SnapVector( pm->ps->velocity );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 trap_SnapVector
CALLV
pop
line 2316
;2316:}
LABELV $876
endproc PmoveSingle 36 16
export Pmove
proc Pmove 16 4
line 2326
;2317:
;2318:
;2319:/*
;2320:================
;2321:Pmove
;2322:
;2323:Can be called by either the server or the client
;2324:================
;2325:*/
;2326:void Pmove (pmove_t *pmove) {
line 2329
;2327:	int			finalTime;
;2328:
;2329:	finalTime = pmove->cmd.serverTime;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 2331
;2330:
;2331:	if ( finalTime < pmove->ps->commandTime ) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
INDIRP4
INDIRI4
GEI4 $948
line 2332
;2332:		return;	// should not happen
ADDRGP4 $947
JUMPV
LABELV $948
line 2335
;2333:	}
;2334:
;2335:	if ( finalTime > pmove->ps->commandTime + 1000 ) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
INDIRP4
INDIRI4
CNSTI4 1000
ADDI4
LEI4 $950
line 2336
;2336:		pmove->ps->commandTime = finalTime - 1000;
ADDRFP4 0
INDIRP4
INDIRP4
ADDRLP4 0
INDIRI4
CNSTI4 1000
SUBI4
ASGNI4
line 2337
;2337:	}
LABELV $950
line 2339
;2338:
;2339:	pmove->ps->pmove_framecount = (pmove->ps->pmove_framecount+1) & ((1<<PS_PMOVEFRAMECOUNTBITS)-1);
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 456
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 456
ADDP4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 63
BANDI4
ASGNI4
line 2341
;2340:
;2341:	if ( pmove->ps->pm_flags & PMF_RESPAWNED && pm_respawntimer == 0 ) {
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $955
ADDRGP4 pm_respawntimer
INDIRI4
CNSTI4 0
NEI4 $955
line 2342
;2342:		pm_respawntimer = NO_RESPAWN_OVERBOUNCE;
ADDRGP4 pm_respawntimer
CNSTI4 250
ASGNI4
line 2343
;2343:	}
ADDRGP4 $955
JUMPV
LABELV $954
line 2347
;2344:
;2345:	// chop the move up if it is too long, to prevent framerate
;2346:	// dependent behavior
;2347:	while ( pmove->ps->commandTime != finalTime ) {
line 2350
;2348:		int		msec;
;2349:
;2350:		msec = finalTime - pmove->ps->commandTime;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
INDIRP4
INDIRI4
SUBI4
ASGNI4
line 2352
;2351:
;2352:		if ( pmove->pmove_fixed ) {
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 0
EQI4 $957
line 2353
;2353:			if ( msec > pmove->pmove_msec ) {
ADDRLP4 8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
LEI4 $958
line 2354
;2354:				msec = pmove->pmove_msec;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ASGNI4
line 2355
;2355:			}
line 2356
;2356:		}
ADDRGP4 $958
JUMPV
LABELV $957
line 2357
;2357:		else {
line 2358
;2358:			if ( msec > 66 ) {
ADDRLP4 8
INDIRI4
CNSTI4 66
LEI4 $961
line 2359
;2359:				msec = 66;
ADDRLP4 8
CNSTI4 66
ASGNI4
line 2360
;2360:			}
LABELV $961
line 2361
;2361:		}
LABELV $958
line 2362
;2362:		pmove->cmd.serverTime = pmove->ps->commandTime + msec;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 12
INDIRP4
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 2363
;2363:		PmoveSingle( pmove );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 PmoveSingle
CALLV
pop
line 2365
;2364:
;2365:		if ( pmove->ps->pm_flags & PMF_JUMP_HELD ) {
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $963
line 2366
;2366:			pmove->cmd.upmove = 20;
ADDRFP4 0
INDIRP4
CNSTI4 27
ADDP4
CNSTI1 20
ASGNI1
line 2367
;2367:		}
LABELV $963
line 2368
;2368:	}
LABELV $955
line 2347
ADDRFP4 0
INDIRP4
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $954
line 2370
;2369:	//PM_CheckStuck();
;2370:}
LABELV $947
endproc Pmove 16 4
import trap_SnapVector
bss
export pml
align 4
LABELV pml
skip 140
export pm
align 4
LABELV pm
skip 4
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
LABELV $646
byte 1 37
byte 1 105
byte 1 58
byte 1 76
byte 1 97
byte 1 110
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $635
byte 1 37
byte 1 105
byte 1 58
byte 1 115
byte 1 116
byte 1 101
byte 1 101
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $624
byte 1 37
byte 1 105
byte 1 58
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 111
byte 1 102
byte 1 102
byte 1 10
byte 1 0
align 1
LABELV $593
byte 1 37
byte 1 105
byte 1 58
byte 1 108
byte 1 105
byte 1 102
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $566
byte 1 37
byte 1 105
byte 1 58
byte 1 97
byte 1 108
byte 1 108
byte 1 115
byte 1 111
byte 1 108
byte 1 105
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $249
byte 1 37
byte 1 105
byte 1 58
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $225
byte 1 37
byte 1 105
byte 1 58
byte 1 98
byte 1 101
byte 1 110
byte 1 100
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 10
byte 1 0
