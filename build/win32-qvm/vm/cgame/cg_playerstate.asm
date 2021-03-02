export CG_CheckAmmo
code
proc CG_CheckAmmo 20 8
file "..\..\..\..\code\cgame\cg_playerstate.c"
line 17
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_playerstate.c -- this file acts on changes in a new playerState_t
;4:// With normal play, this will be done after local prediction, but when
;5:// following another player or playing back a demo, it will be checked
;6:// when the snapshot transitions like all the other entities
;7:
;8:#include "cg_local.h"
;9:
;10:/*
;11:==============
;12:CG_CheckAmmo
;13:
;14:If the ammo has gone low enough to generate the warning, play a sound
;15:==============
;16:*/
;17:void CG_CheckAmmo( void ) {
line 24
;18:	int		i;
;19:	int		total;
;20:	int		previous;
;21:	int		weapons;
;22:
;23:	// see about how many seconds of ammo we have remaining
;24:	weapons = cg.snap->ps.stats[ STAT_WEAPONS ];
ADDRLP4 8
ADDRGP4 cg+36
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
ASGNI4
line 25
;25:	total = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 26
;26:	for ( i = WP_MACHINEGUN ; i < WP_NUM_WEAPONS ; i++ ) {
ADDRLP4 0
CNSTI4 2
ASGNI4
LABELV $75
line 27
;27:		if ( ! ( weapons & ( 1 << i ) ) ) {
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $79
line 28
;28:			continue;
ADDRGP4 $76
JUMPV
LABELV $79
line 30
;29:		}
;30:		switch ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $81
ADDRLP4 0
INDIRI4
CNSTI4 12
GTI4 $81
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $86-12
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $86
address $83
address $83
address $83
address $81
address $83
address $81
address $81
address $81
address $81
address $83
code
LABELV $83
line 36
;31:		case WP_ROCKET_LAUNCHER:
;32:		case WP_GRENADE_LAUNCHER:
;33:		case WP_RAILGUN:
;34:		case WP_SHOTGUN:
;35:		case WP_PROX_LAUNCHER:
;36:			total += cg.snap->ps.ammo[i] * 1000;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 420
ADDP4
ADDP4
INDIRI4
CNSTI4 1000
MULI4
ADDI4
ASGNI4
line 37
;37:			break;
ADDRGP4 $82
JUMPV
LABELV $81
line 39
;38:		default:
;39:			total += cg.snap->ps.ammo[i] * 200;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 420
ADDP4
ADDP4
INDIRI4
CNSTI4 200
MULI4
ADDI4
ASGNI4
line 40
;40:			break;
LABELV $82
line 42
;41:		}
;42:		if ( total >= 5000 ) {
ADDRLP4 4
INDIRI4
CNSTI4 5000
LTI4 $88
line 43
;43:			cg.lowAmmoWarning = 0;
ADDRGP4 cg+125464
CNSTI4 0
ASGNI4
line 44
;44:			return;
ADDRGP4 $73
JUMPV
LABELV $88
line 46
;45:		}
;46:	}
LABELV $76
line 26
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 14
LTI4 $75
line 48
;47:
;48:	previous = cg.lowAmmoWarning;
ADDRLP4 12
ADDRGP4 cg+125464
INDIRI4
ASGNI4
line 50
;49:
;50:	if ( total == 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $92
line 51
;51:		cg.lowAmmoWarning = 2;
ADDRGP4 cg+125464
CNSTI4 2
ASGNI4
line 52
;52:	} else {
ADDRGP4 $93
JUMPV
LABELV $92
line 53
;53:		cg.lowAmmoWarning = 1;
ADDRGP4 cg+125464
CNSTI4 1
ASGNI4
line 54
;54:	}
LABELV $93
line 57
;55:
;56:	// play a sound on transitions
;57:	if ( cg.lowAmmoWarning != previous ) {
ADDRGP4 cg+125464
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $96
line 58
;58:		trap_S_StartLocalSound( cgs.media.noAmmoSound, CHAN_LOCAL_SOUND );
ADDRGP4 cgs+148692+884
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 59
;59:	}
LABELV $96
line 60
;60:}
LABELV $73
endproc CG_CheckAmmo 20 8
export CG_DamageFeedback
proc CG_DamageFeedback 80 16
line 68
;61:
;62:
;63:/*
;64:==============
;65:CG_DamageFeedback
;66:==============
;67:*/
;68:void CG_DamageFeedback( int yawByte, int pitchByte, int damage ) {
line 84
;69:	float		left, front, up;
;70:	float		kick;
;71:	int			health;
;72:	int			attacker;
;73:	float		scale;
;74:	vec3_t		dir;
;75:	vec3_t		angles;
;76:	float		dist;
;77:	float		yaw, pitch;
;78:	const char	*info;
;79:
;80:	// show the attacking player's head and name in corner
;81:	// but only if client is valid
;82:
;83:	//attacker = cg.predictedPlayerState.persistant[PERS_ATTACKER]; ?
;84:	attacker = cg.snap->ps.persistant[PERS_ATTACKER]; 
ADDRLP4 16
ADDRGP4 cg+36
INDIRP4
CNSTI4 316
ADDP4
INDIRI4
ASGNI4
line 86
;85:
;86:	if ( (unsigned)attacker < MAX_CLIENTS && attacker != cg.snap->ps.clientNum ) {
ADDRLP4 16
INDIRI4
CVIU4 4
CNSTU4 64
GEU4 $103
ADDRLP4 16
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
EQI4 $103
line 88
;87:		// dont do it when cg_draw2d = 0 ?
;88:		info = CG_ConfigString( CS_PLAYERS + attacker );
ADDRLP4 16
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 72
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 52
ADDRLP4 72
INDIRP4
ASGNP4
line 89
;89:		if ( *info ) {
ADDRLP4 52
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $106
line 90
;90:			BG_CleanName( Info_ValueForKey( info, "n" ), cg.attackerName, sizeof( cg.attackerName ), "???" );
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 $108
ARGP4
ADDRLP4 76
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 cg+125488
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $111
ARGP4
ADDRGP4 BG_CleanName
CALLV
pop
line 91
;91:			cg.attackerClientNum = attacker;
ADDRGP4 cg+125520
ADDRLP4 16
INDIRI4
ASGNI4
line 92
;92:			cg.attackerTime = cg.time;
ADDRGP4 cg+125524
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 93
;93:		}
LABELV $106
line 94
;94:	}
LABELV $103
line 97
;95:
;96:	// the lower on health you are, the greater the view kick will be
;97:	health = cg.snap->ps.stats[STAT_HEALTH];
ADDRLP4 24
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
ASGNI4
line 98
;98:	if ( health < 40 ) {
ADDRLP4 24
INDIRI4
CNSTI4 40
GEI4 $116
line 99
;99:		scale = 1;
ADDRLP4 32
CNSTF4 1065353216
ASGNF4
line 100
;100:	} else {
ADDRGP4 $117
JUMPV
LABELV $116
line 101
;101:		scale = 40.0 / health;
ADDRLP4 32
CNSTF4 1109393408
ADDRLP4 24
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 102
;102:	}
LABELV $117
line 103
;103:	kick = damage * scale;
ADDRLP4 12
ADDRFP4 8
INDIRI4
CVIF4 4
ADDRLP4 32
INDIRF4
MULF4
ASGNF4
line 105
;104:
;105:	if (kick < 5)
ADDRLP4 12
INDIRF4
CNSTF4 1084227584
GEF4 $118
line 106
;106:		kick = 5;
ADDRLP4 12
CNSTF4 1084227584
ASGNF4
LABELV $118
line 107
;107:	if (kick > 10)
ADDRLP4 12
INDIRF4
CNSTF4 1092616192
LEF4 $120
line 108
;108:		kick = 10;
ADDRLP4 12
CNSTF4 1092616192
ASGNF4
LABELV $120
line 111
;109:
;110:	// if yaw and pitch are both 255, make the damage always centered (falling, etc)
;111:	if ( yawByte == 255 && pitchByte == 255 ) {
ADDRFP4 0
INDIRI4
CNSTI4 255
NEI4 $122
ADDRFP4 4
INDIRI4
CNSTI4 255
NEI4 $122
line 112
;112:		cg.damageX = 0;
ADDRGP4 cg+125800
CNSTF4 0
ASGNF4
line 113
;113:		cg.damageY = 0;
ADDRGP4 cg+125804
CNSTF4 0
ASGNF4
line 114
;114:		cg.v_dmg_roll = 0;
ADDRGP4 cg+125848
CNSTF4 0
ASGNF4
line 115
;115:		cg.v_dmg_pitch = -kick;
ADDRGP4 cg+125844
ADDRLP4 12
INDIRF4
NEGF4
ASGNF4
line 116
;116:	} else {
ADDRGP4 $123
JUMPV
LABELV $122
line 118
;117:		// positional
;118:		pitch = pitchByte / 255.0 * 360;
ADDRLP4 64
ADDRFP4 4
INDIRI4
CVIF4 4
CNSTF4 1068807349
MULF4
ASGNF4
line 119
;119:		yaw = yawByte / 255.0 * 360;
ADDRLP4 60
ADDRFP4 0
INDIRI4
CVIF4 4
CNSTF4 1068807349
MULF4
ASGNF4
line 121
;120:
;121:		angles[PITCH] = pitch;
ADDRLP4 36
ADDRLP4 64
INDIRF4
ASGNF4
line 122
;122:		angles[YAW] = yaw;
ADDRLP4 36+4
ADDRLP4 60
INDIRF4
ASGNF4
line 123
;123:		angles[ROLL] = 0;
ADDRLP4 36+8
CNSTF4 0
ASGNF4
line 125
;124:
;125:		AngleVectors( angles, dir, NULL, NULL );
ADDRLP4 36
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 126
;126:		VectorSubtract( vec3_origin, dir, dir );
ADDRLP4 0
ADDRGP4 vec3_origin
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRGP4 vec3_origin+4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRGP4 vec3_origin+8
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 128
;127:
;128:		front = DotProduct (dir, cg.refdef.viewaxis[0] );
ADDRLP4 20
ADDRLP4 0
INDIRF4
ADDRGP4 cg+109056+36
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRGP4 cg+109056+36+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRGP4 cg+109056+36+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 129
;129:		left = DotProduct (dir, cg.refdef.viewaxis[1] );
ADDRLP4 28
ADDRLP4 0
INDIRF4
ADDRGP4 cg+109056+36+12
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRGP4 cg+109056+36+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRGP4 cg+109056+36+12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 130
;130:		up = DotProduct (dir, cg.refdef.viewaxis[2] );
ADDRLP4 56
ADDRLP4 0
INDIRF4
ADDRGP4 cg+109056+36+24
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRGP4 cg+109056+36+24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRGP4 cg+109056+36+24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 132
;131:
;132:		dir[0] = front;
ADDRLP4 0
ADDRLP4 20
INDIRF4
ASGNF4
line 133
;133:		dir[1] = left;
ADDRLP4 0+4
ADDRLP4 28
INDIRF4
ASGNF4
line 134
;134:		dir[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 135
;135:		dist = VectorLength( dir );
ADDRLP4 0
ARGP4
ADDRLP4 72
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 48
ADDRLP4 72
INDIRF4
ASGNF4
line 136
;136:		if ( dist < 0.1 ) {
ADDRLP4 48
INDIRF4
CNSTF4 1036831949
GEF4 $174
line 137
;137:			dist = 0.1f;
ADDRLP4 48
CNSTF4 1036831949
ASGNF4
line 138
;138:		}
LABELV $174
line 140
;139:
;140:		cg.v_dmg_roll = kick * left;
ADDRGP4 cg+125848
ADDRLP4 12
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 142
;141:		
;142:		cg.v_dmg_pitch = -kick * front;
ADDRGP4 cg+125844
ADDRLP4 12
INDIRF4
NEGF4
ADDRLP4 20
INDIRF4
MULF4
ASGNF4
line 144
;143:
;144:		if ( front <= 0.1 ) {
ADDRLP4 20
INDIRF4
CNSTF4 1036831949
GTF4 $178
line 145
;145:			front = 0.1f;
ADDRLP4 20
CNSTF4 1036831949
ASGNF4
line 146
;146:		}
LABELV $178
line 147
;147:		cg.damageX = -left / front;
ADDRGP4 cg+125800
ADDRLP4 28
INDIRF4
NEGF4
ADDRLP4 20
INDIRF4
DIVF4
ASGNF4
line 148
;148:		cg.damageY = up / dist;
ADDRGP4 cg+125804
ADDRLP4 56
INDIRF4
ADDRLP4 48
INDIRF4
DIVF4
ASGNF4
line 149
;149:	}
LABELV $123
line 152
;150:
;151:	// clamp the position
;152:	if ( cg.damageX > 1.0 ) {
ADDRGP4 cg+125800
INDIRF4
CNSTF4 1065353216
LEF4 $182
line 153
;153:		cg.damageX = 1.0;
ADDRGP4 cg+125800
CNSTF4 1065353216
ASGNF4
line 154
;154:	}
LABELV $182
line 155
;155:	if ( cg.damageX < - 1.0 ) {
ADDRGP4 cg+125800
INDIRF4
CNSTF4 3212836864
GEF4 $186
line 156
;156:		cg.damageX = -1.0;
ADDRGP4 cg+125800
CNSTF4 3212836864
ASGNF4
line 157
;157:	}
LABELV $186
line 159
;158:
;159:	if ( cg.damageY > 1.0 ) {
ADDRGP4 cg+125804
INDIRF4
CNSTF4 1065353216
LEF4 $190
line 160
;160:		cg.damageY = 1.0;
ADDRGP4 cg+125804
CNSTF4 1065353216
ASGNF4
line 161
;161:	}
LABELV $190
line 162
;162:	if ( cg.damageY < - 1.0 ) {
ADDRGP4 cg+125804
INDIRF4
CNSTF4 3212836864
GEF4 $194
line 163
;163:		cg.damageY = -1.0;
ADDRGP4 cg+125804
CNSTF4 3212836864
ASGNF4
line 164
;164:	}
LABELV $194
line 167
;165:
;166:	// don't let the screen flashes vary as much
;167:	if ( kick > 10 ) {
ADDRLP4 12
INDIRF4
CNSTF4 1092616192
LEF4 $198
line 168
;168:		kick = 10;
ADDRLP4 12
CNSTF4 1092616192
ASGNF4
line 169
;169:	}
LABELV $198
line 170
;170:	cg.damageValue = kick;
ADDRGP4 cg+125808
ADDRLP4 12
INDIRF4
ASGNF4
line 171
;171:	cg.v_dmg_time = cg.time + DAMAGE_TIME;
ADDRGP4 cg+125840
ADDRGP4 cg+107604
INDIRI4
CNSTI4 500
ADDI4
CVIF4 4
ASGNF4
line 172
;172:	cg.damageTime = cg.snap->serverTime;
ADDRGP4 cg+125796
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 173
;173:}
LABELV $101
endproc CG_DamageFeedback 80 16
export CG_Respawn
proc CG_Respawn 0 0
line 183
;174:
;175:
;176:/*
;177:================
;178:CG_Respawn
;179:
;180:A respawn happened this snapshot
;181:================
;182:*/
;183:void CG_Respawn( void ) {
line 185
;184:	// no error decay on player movement
;185:	cg.thisFrameTeleport = qtrue;
ADDRGP4 cg+107592
CNSTI4 1
ASGNI4
line 188
;186:
;187:	// display weapons available
;188:	cg.weaponSelectTime = cg.time;
ADDRGP4 cg+125784
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 191
;189:
;190:	// select the weapon the server says we are using
;191:	cg.weaponSelect = cg.snap->ps.weapon;
ADDRGP4 cg+108956
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ASGNI4
line 193
;192:
;193:	cg.timeResidual = cg.snap->ps.commandTime + 1000;
ADDRGP4 cg+157008
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 194
;194:}
LABELV $205
endproc CG_Respawn 0 0
proc CG_CheckPlayerstateEvents 40 12
line 205
;195:
;196:
;197:/*
;198:==============
;199:CG_CheckPlayerstateEvents
;200:==============
;201:*/
;202:extern int		eventStack;
;203:extern int		eventParm2[ MAX_PREDICTED_EVENTS ];
;204:
;205:static void CG_CheckPlayerstateEvents( const playerState_t *ps, const playerState_t *ops ) {
line 210
;206:	int			i, n;
;207:	int			event;
;208:	centity_t	*cent;
;209:
;210:	if ( ps->externalEvent && ps->externalEvent != ops->externalEvent ) {
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
CNSTI4 0
EQI4 $214
ADDRLP4 16
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
EQI4 $214
line 211
;211:		cent = &cg_entities[ ps->clientNum ];
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
CNSTI4 740
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 212
;212:		cent->currentState.event = ps->externalEvent;
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
ASGNI4
line 213
;213:		cent->currentState.eventParm = ps->externalEventParm;
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
ASGNI4
line 214
;214:		CG_EntityEvent( cent, cent->lerpOrigin, -1 );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 716
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 CG_EntityEvent
CALLV
pop
line 215
;215:	}
LABELV $214
line 217
;216:
;217:	cent = &cg.predictedPlayerEntity; // cg_entities[ ps->clientNum ];
ADDRLP4 4
ADDRGP4 cg+108104
ASGNP4
line 218
;218:	n = eventStack - MAX_PS_EVENTS;
ADDRLP4 12
ADDRGP4 eventStack
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 219
;219:	if ( n < 0 ) n  = 0;
ADDRLP4 12
INDIRI4
CNSTI4 0
GEI4 $217
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $217
line 221
;220:	// go through the predictable events buffer
;221:	for ( i = ps->eventSequence - MAX_PS_EVENTS ; i < ps->eventSequence ; i++ ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
ADDRGP4 $222
JUMPV
LABELV $219
line 223
;222:		// if we have a new predictable event
;223:		if ( i >= ops->eventSequence
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
GEI4 $225
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 2
SUBI4
LEI4 $223
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRLP4 24
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
EQI4 $223
LABELV $225
line 226
;224:			// or the server told us to play another event instead of a predicted event we already issued
;225:			// or something the server told us changed our prediction causing a different event
;226:			|| (i > ops->eventSequence - MAX_PS_EVENTS && ps->events[i & (MAX_PS_EVENTS-1)] != ops->events[i & (MAX_PS_EVENTS-1)]) ) {
line 228
;227:
;228:			event = ps->events[ i & (MAX_PS_EVENTS-1) ];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ASGNI4
line 229
;229:			if ( event == EV_NONE ) // ignore empty events
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $226
line 230
;230:				continue;
ADDRGP4 $220
JUMPV
LABELV $226
line 231
;231:			cent->currentState.event = event;
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 232
;232:			cent->currentState.eventParm = ps->eventParms[ i & (MAX_PS_EVENTS-1) ];
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
ADDP4
INDIRI4
ASGNI4
line 234
;233:
;234:			CG_EntityEvent( cent, cent->lerpOrigin, eventParm2[ n++ ] );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRLP4 28
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 12
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 28
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
line 236
;235:
;236:			cg.predictableEvents[ i & (MAX_PREDICTED_EVENTS-1) ] = event;
ADDRLP4 0
INDIRI4
CNSTI4 15
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cg+108868
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 238
;237:
;238:			cg.eventSequence++;
ADDRLP4 36
ADDRGP4 cg+108864
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 239
;239:		}
LABELV $223
line 240
;240:	}
LABELV $220
line 221
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $222
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
LTI4 $219
line 241
;241:}
LABELV $213
endproc CG_CheckPlayerstateEvents 40 12
proc pushReward 4 0
line 249
;242:
;243:
;244:/*
;245:==================
;246:pushReward
;247:==================
;248:*/
;249:static void pushReward( sfxHandle_t sfx, qhandle_t shader, int rewardCount ) {
line 250
;250:	if ( cg.rewardStack < (MAX_REWARDSTACK-1 )) {
ADDRGP4 cg+125532
INDIRI4
CNSTI4 9
GEI4 $231
line 251
;251:		cg.rewardStack++;
ADDRLP4 0
ADDRGP4 cg+125532
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 252
;252:		cg.rewardSound[cg.rewardStack] = sfx;
ADDRGP4 cg+125532
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+125620
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 253
;253:		cg.rewardShader[cg.rewardStack] = shader;
ADDRGP4 cg+125532
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+125580
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 254
;254:		cg.rewardCount[cg.rewardStack] = rewardCount;
ADDRGP4 cg+125532
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+125540
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 255
;255:	}
LABELV $231
line 256
;256:}
LABELV $230
endproc pushReward 4 0
export CG_CheckLocalSounds
proc CG_CheckLocalSounds 32 12
line 264
;257:
;258:
;259:/*
;260:==================
;261:CG_CheckLocalSounds
;262:==================
;263:*/
;264:void CG_CheckLocalSounds( playerState_t *ps, playerState_t *ops ) {
line 270
;265:	int health, armor;
;266:	int	highScore, reward;
;267:	sfxHandle_t sfx;
;268:
;269:	// don't play the sounds if the player just changed teams
;270:	if ( ps->persistant[PERS_TEAM] != ops->persistant[PERS_TEAM] ) {
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
EQI4 $242
line 271
;271:		return;
ADDRGP4 $241
JUMPV
LABELV $242
line 275
;272:	}
;273:
;274:	// hit changes
;275:	if ( ps->persistant[PERS_HITS] > ops->persistant[PERS_HITS] ) {
ADDRFP4 0
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
LEI4 $244
line 276
;276:		armor  = ps->persistant[PERS_ATTACKEE_ARMOR] & 0xff;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 255
BANDI4
ASGNI4
line 277
;277:		health = ps->persistant[PERS_ATTACKEE_ARMOR] >> 8;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 8
RSHI4
ASGNI4
line 278
;278:		if (armor > 50 ) {
ADDRLP4 12
INDIRI4
CNSTI4 50
LEI4 $246
line 279
;279:			trap_S_StartLocalSound( cgs.media.hitSoundHighArmor, CHAN_LOCAL_SOUND );
ADDRGP4 cgs+148692+948
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 280
;280:		} else if (armor || health > 100) {
ADDRGP4 $245
JUMPV
LABELV $246
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $252
ADDRLP4 16
INDIRI4
CNSTI4 100
LEI4 $250
LABELV $252
line 281
;281:			trap_S_StartLocalSound( cgs.media.hitSoundLowArmor, CHAN_LOCAL_SOUND );
ADDRGP4 cgs+148692+952
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 282
;282:		} else {
ADDRGP4 $245
JUMPV
LABELV $250
line 283
;283:			trap_S_StartLocalSound( cgs.media.hitSound, CHAN_LOCAL_SOUND );
ADDRGP4 cgs+148692+928
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 284
;284:		}
line 285
;285:	} else if ( ps->persistant[PERS_HITS] < ops->persistant[PERS_HITS] ) {
ADDRGP4 $245
JUMPV
LABELV $244
ADDRFP4 0
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
GEI4 $257
line 286
;286:		trap_S_StartLocalSound( cgs.media.hitTeamSound, CHAN_LOCAL_SOUND );
ADDRGP4 cgs+148692+956
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 287
;287:	}
LABELV $257
LABELV $245
line 290
;288:
;289:	// health changes of more than -1 should make pain sounds
;290:	if ( ps->stats[STAT_HEALTH] < ops->stats[STAT_HEALTH] - 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 1
SUBI4
GEI4 $261
line 291
;291:		if ( ps->stats[STAT_HEALTH] > 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
LEI4 $263
line 292
;292:			CG_PainEvent( &cg.predictedPlayerEntity, ps->stats[STAT_HEALTH] );
ADDRGP4 cg+108104
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_PainEvent
CALLV
pop
line 293
;293:		}
LABELV $263
line 294
;294:	}
LABELV $261
line 297
;295:
;296:	// if we are going into the intermission, don't start any voices
;297:	if ( cg.intermissionStarted ) {
ADDRGP4 cg+24
INDIRI4
CNSTI4 0
EQI4 $266
line 298
;298:		return;
ADDRGP4 $241
JUMPV
LABELV $266
line 302
;299:	}
;300:
;301:	// reward sounds
;302:	reward = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 303
;303:	if (ps->persistant[PERS_CAPTURES] != ops->persistant[PERS_CAPTURES]) {
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
EQI4 $269
line 304
;304:		pushReward(cgs.media.captureAwardSound, cgs.media.medalCapture, ps->persistant[PERS_CAPTURES]);
ADDRGP4 cgs+148692+1016
INDIRI4
ARGI4
ADDRGP4 cgs+148692+604
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ARGI4
ADDRGP4 pushReward
CALLV
pop
line 305
;305:		reward = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 307
;306:		//Com_Printf("capture\n");
;307:	}
LABELV $269
line 308
;308:	if (ps->persistant[PERS_IMPRESSIVE_COUNT] != ops->persistant[PERS_IMPRESSIVE_COUNT]) {
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
EQI4 $275
line 309
;309:		sfx = cgs.media.impressiveSound;
ADDRLP4 4
ADDRGP4 cgs+148692+960
INDIRI4
ASGNI4
line 310
;310:		pushReward(sfx, cgs.media.medalImpressive, ps->persistant[PERS_IMPRESSIVE_COUNT]);
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 cgs+148692+584
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRGP4 pushReward
CALLV
pop
line 311
;311:		reward = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 313
;312:		//Com_Printf("impressive\n");
;313:	}
LABELV $275
line 314
;314:	if (ps->persistant[PERS_EXCELLENT_COUNT] != ops->persistant[PERS_EXCELLENT_COUNT]) {
ADDRFP4 0
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
EQI4 $281
line 315
;315:		sfx = cgs.media.excellentSound;
ADDRLP4 4
ADDRGP4 cgs+148692+964
INDIRI4
ASGNI4
line 316
;316:		pushReward(sfx, cgs.media.medalExcellent, ps->persistant[PERS_EXCELLENT_COUNT]);
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 cgs+148692+588
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ARGI4
ADDRGP4 pushReward
CALLV
pop
line 317
;317:		reward = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 319
;318:		//Com_Printf("excellent\n");
;319:	}
LABELV $281
line 320
;320:	if (ps->persistant[PERS_GAUNTLET_FRAG_COUNT] != ops->persistant[PERS_GAUNTLET_FRAG_COUNT]) {
ADDRFP4 0
INDIRP4
CNSTI4 300
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 300
ADDP4
INDIRI4
EQI4 $287
line 321
;321:		sfx = cgs.media.humiliationSound;
ADDRLP4 4
ADDRGP4 cgs+148692+972
INDIRI4
ASGNI4
line 322
;322:		pushReward(sfx, cgs.media.medalGauntlet, ps->persistant[PERS_GAUNTLET_FRAG_COUNT]);
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 cgs+148692+592
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 300
ADDP4
INDIRI4
ARGI4
ADDRGP4 pushReward
CALLV
pop
line 323
;323:		reward = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 325
;324:		//Com_Printf("guantlet frag\n");
;325:	}
LABELV $287
line 326
;326:	if (ps->persistant[PERS_DEFEND_COUNT] != ops->persistant[PERS_DEFEND_COUNT]) {
ADDRFP4 0
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
EQI4 $293
line 327
;327:		pushReward(cgs.media.defendSound, cgs.media.medalDefend, ps->persistant[PERS_DEFEND_COUNT]);
ADDRGP4 cgs+148692+980
INDIRI4
ARGI4
ADDRGP4 cgs+148692+596
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ARGI4
ADDRGP4 pushReward
CALLV
pop
line 328
;328:		reward = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 330
;329:		//Com_Printf("defend\n");
;330:	}
LABELV $293
line 331
;331:	if (ps->persistant[PERS_ASSIST_COUNT] != ops->persistant[PERS_ASSIST_COUNT]) {
ADDRFP4 0
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
EQI4 $299
line 332
;332:		pushReward(cgs.media.assistSound, cgs.media.medalAssist, ps->persistant[PERS_ASSIST_COUNT]);
ADDRGP4 cgs+148692+976
INDIRI4
ARGI4
ADDRGP4 cgs+148692+600
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ARGI4
ADDRGP4 pushReward
CALLV
pop
line 333
;333:		reward = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 335
;334:		//Com_Printf("assist\n");
;335:	}
LABELV $299
line 337
;336:	// if any of the player event bits changed
;337:	if (ps->persistant[PERS_PLAYEREVENTS] != ops->persistant[PERS_PLAYEREVENTS]) {
ADDRFP4 0
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
EQI4 $305
line 338
;338:		if ((ps->persistant[PERS_PLAYEREVENTS] & PLAYEREVENT_DENIEDREWARD) !=
ADDRFP4 0
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRFP4 4
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
CNSTI4 1
BANDI4
EQI4 $307
line 339
;339:				(ops->persistant[PERS_PLAYEREVENTS] & PLAYEREVENT_DENIEDREWARD)) {
line 340
;340:			trap_S_StartLocalSound( cgs.media.deniedSound, CHAN_ANNOUNCER );
ADDRGP4 cgs+148692+968
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 341
;341:		}
ADDRGP4 $308
JUMPV
LABELV $307
line 342
;342:		else if ((ps->persistant[PERS_PLAYEREVENTS] & PLAYEREVENT_GAUNTLETREWARD) !=
ADDRFP4 0
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
CNSTI4 2
BANDI4
ADDRFP4 4
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
CNSTI4 2
BANDI4
EQI4 $311
line 343
;343:				(ops->persistant[PERS_PLAYEREVENTS] & PLAYEREVENT_GAUNTLETREWARD)) {
line 344
;344:			trap_S_StartLocalSound( cgs.media.humiliationSound, CHAN_ANNOUNCER );
ADDRGP4 cgs+148692+972
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 345
;345:		}
ADDRGP4 $312
JUMPV
LABELV $311
line 346
;346:		else if ((ps->persistant[PERS_PLAYEREVENTS] & PLAYEREVENT_HOLYSHIT) !=
ADDRFP4 0
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
CNSTI4 4
BANDI4
ADDRFP4 4
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
CNSTI4 4
BANDI4
EQI4 $315
line 347
;347:				(ops->persistant[PERS_PLAYEREVENTS] & PLAYEREVENT_HOLYSHIT)) {
line 348
;348:			trap_S_StartLocalSound( cgs.media.holyShitSound, CHAN_ANNOUNCER );
ADDRGP4 cgs+148692+1100
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 349
;349:		}
LABELV $315
LABELV $312
LABELV $308
line 350
;350:		reward = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 351
;351:	}
LABELV $305
line 354
;352:
;353:	// check for flag pickup
;354:	if ( cgs.gametype >= GT_TDM ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $319
line 355
;355:		if ((ps->powerups[PW_REDFLAG] != ops->powerups[PW_REDFLAG] && ps->powerups[PW_REDFLAG]) ||
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
EQI4 $325
ADDRLP4 20
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
NEI4 $326
LABELV $325
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
EQI4 $327
ADDRLP4 24
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
NEI4 $326
LABELV $327
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
EQI4 $322
ADDRLP4 28
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $322
LABELV $326
line 358
;356:			(ps->powerups[PW_BLUEFLAG] != ops->powerups[PW_BLUEFLAG] && ps->powerups[PW_BLUEFLAG]) ||
;357:			(ps->powerups[PW_NEUTRALFLAG] != ops->powerups[PW_NEUTRALFLAG] && ps->powerups[PW_NEUTRALFLAG]) )
;358:		{
line 359
;359:			trap_S_StartLocalSound( cgs.media.youHaveFlagSound, CHAN_ANNOUNCER );
ADDRGP4 cgs+148692+1092
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 360
;360:		}
LABELV $322
line 361
;361:	}
LABELV $319
line 364
;362:
;363:	// lead changes
;364:	if (!reward) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $330
line 366
;365:		//
;366:		if ( !cg.warmup ) {
ADDRGP4 cg+125756
INDIRI4
CNSTI4 0
NEI4 $332
line 368
;367:			// never play lead changes during warmup
;368:			if ( ps->persistant[PERS_RANK] != ops->persistant[PERS_RANK] ) {
ADDRFP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
EQI4 $335
line 369
;369:				if ( cgs.gametype < GT_TDM) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
GEI4 $337
line 370
;370:					if (  ps->persistant[PERS_RANK] == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 0
NEI4 $340
line 371
;371:						CG_AddBufferedSound(cgs.media.takenLeadSound);
ADDRGP4 cgs+148692+984
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 372
;372:					} else if ( ps->persistant[PERS_RANK] == RANK_TIED_FLAG ) {
ADDRGP4 $341
JUMPV
LABELV $340
ADDRFP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 16384
NEI4 $344
line 373
;373:						CG_AddBufferedSound(cgs.media.tiedLeadSound);
ADDRGP4 cgs+148692+988
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 374
;374:					} else if ( ( ops->persistant[PERS_RANK] & ~RANK_TIED_FLAG ) == 0 ) {
ADDRGP4 $345
JUMPV
LABELV $344
ADDRFP4 4
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 -16385
BANDI4
CNSTI4 0
NEI4 $348
line 375
;375:						CG_AddBufferedSound(cgs.media.lostLeadSound);
ADDRGP4 cgs+148692+992
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 376
;376:					}
LABELV $348
LABELV $345
LABELV $341
line 377
;377:				}
LABELV $337
line 378
;378:			}
LABELV $335
line 379
;379:		}
LABELV $332
line 380
;380:	}
LABELV $330
line 383
;381:
;382:	// timelimit warnings
;383:	if ( cgs.timelimit > 0 && !cg.warmup && cg.warmupFightSound < cg.time ) {
ADDRGP4 cgs+31500
INDIRI4
CNSTI4 0
LEI4 $352
ADDRGP4 cg+125756
INDIRI4
CNSTI4 0
NEI4 $352
ADDRGP4 cg+125764
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $352
line 386
;384:		int		msec;
;385:
;386:		msec = cg.time - cgs.levelStartTime;
ADDRLP4 20
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cgs+34820
INDIRI4
SUBI4
ASGNI4
line 387
;387:		if ( !( cg.timelimitWarnings & 4 ) && msec > ( cgs.timelimit * 60 + 2 ) * 1000 ) {
ADDRGP4 cg+107616
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
NEI4 $360
ADDRLP4 20
INDIRI4
ADDRGP4 cgs+31500
INDIRI4
CNSTI4 60
MULI4
CNSTI4 1000
MULI4
CNSTI4 2000
ADDI4
LEI4 $360
line 388
;388:			cg.timelimitWarnings |= 1 | 2 | 4;
ADDRLP4 24
ADDRGP4 cg+107616
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 7
BORI4
ASGNI4
line 389
;389:			trap_S_StartLocalSound( cgs.media.suddenDeathSound, CHAN_ANNOUNCER );
ADDRGP4 cgs+148692+912
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 390
;390:		}
ADDRGP4 $361
JUMPV
LABELV $360
line 391
;391:		else if ( !( cg.timelimitWarnings & 2 ) && msec > (cgs.timelimit - 1) * 60 * 1000 ) {
ADDRGP4 cg+107616
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $367
ADDRLP4 20
INDIRI4
ADDRGP4 cgs+31500
INDIRI4
CNSTI4 60
MULI4
CNSTI4 1000
MULI4
CNSTI4 60000
SUBI4
LEI4 $367
line 392
;392:			cg.timelimitWarnings |= 1 | 2;
ADDRLP4 24
ADDRGP4 cg+107616
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 3
BORI4
ASGNI4
line 393
;393:			CG_AddBufferedSound( cgs.media.oneMinuteSound );
ADDRGP4 cgs+148692+904
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 394
;394:		}
ADDRGP4 $368
JUMPV
LABELV $367
line 395
;395:		else if ( cgs.timelimit > 5 && !( cg.timelimitWarnings & 1 ) && msec > (cgs.timelimit - 5) * 60 * 1000 ) {
ADDRGP4 cgs+31500
INDIRI4
CNSTI4 5
LEI4 $374
ADDRGP4 cg+107616
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $374
ADDRLP4 20
INDIRI4
ADDRGP4 cgs+31500
INDIRI4
CNSTI4 60
MULI4
CNSTI4 1000
MULI4
CNSTI4 300000
SUBI4
LEI4 $374
line 396
;396:			cg.timelimitWarnings |= 1;
ADDRLP4 24
ADDRGP4 cg+107616
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 397
;397:			CG_AddBufferedSound( cgs.media.fiveMinuteSound );
ADDRGP4 cgs+148692+908
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 398
;398:		}
LABELV $374
LABELV $368
LABELV $361
line 399
;399:	}
LABELV $352
line 402
;400:
;401:	// fraglimit warnings
;402:	if ( cgs.fraglimit > 0 && cgs.gametype < GT_CTF) {
ADDRGP4 cgs+31492
INDIRI4
CNSTI4 0
LEI4 $382
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 4
GEI4 $382
line 403
;403:		highScore = cgs.scores1;
ADDRLP4 8
ADDRGP4 cgs+34824
INDIRI4
ASGNI4
line 405
;404:
;405:		if (cgs.gametype == GT_TDM && cgs.scores2 > highScore) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
NEI4 $387
ADDRGP4 cgs+34828
INDIRI4
ADDRLP4 8
INDIRI4
LEI4 $387
line 406
;406:			highScore = cgs.scores2;
ADDRLP4 8
ADDRGP4 cgs+34828
INDIRI4
ASGNI4
line 407
;407:		}
LABELV $387
line 409
;408:
;409:		if ( !( cg.fraglimitWarnings & 4 ) && highScore == (cgs.fraglimit - 1) ) {
ADDRGP4 cg+107620
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
NEI4 $392
ADDRLP4 8
INDIRI4
ADDRGP4 cgs+31492
INDIRI4
CNSTI4 1
SUBI4
NEI4 $392
line 410
;410:			cg.fraglimitWarnings |= 1 | 2 | 4;
ADDRLP4 20
ADDRGP4 cg+107620
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 7
BORI4
ASGNI4
line 411
;411:			CG_AddBufferedSound(cgs.media.oneFragSound);
ADDRGP4 cgs+148692+924
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 412
;412:		}
ADDRGP4 $393
JUMPV
LABELV $392
line 413
;413:		else if ( cgs.fraglimit > 2 && !( cg.fraglimitWarnings & 2 ) && highScore == (cgs.fraglimit - 2) ) {
ADDRGP4 cgs+31492
INDIRI4
CNSTI4 2
LEI4 $399
ADDRGP4 cg+107620
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $399
ADDRLP4 8
INDIRI4
ADDRGP4 cgs+31492
INDIRI4
CNSTI4 2
SUBI4
NEI4 $399
line 414
;414:			cg.fraglimitWarnings |= 1 | 2;
ADDRLP4 20
ADDRGP4 cg+107620
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 3
BORI4
ASGNI4
line 415
;415:			CG_AddBufferedSound(cgs.media.twoFragSound);
ADDRGP4 cgs+148692+920
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 416
;416:		}
ADDRGP4 $400
JUMPV
LABELV $399
line 417
;417:		else if ( cgs.fraglimit > 3 && !( cg.fraglimitWarnings & 1 ) && highScore == (cgs.fraglimit - 3) ) {
ADDRGP4 cgs+31492
INDIRI4
CNSTI4 3
LEI4 $407
ADDRGP4 cg+107620
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $407
ADDRLP4 8
INDIRI4
ADDRGP4 cgs+31492
INDIRI4
CNSTI4 3
SUBI4
NEI4 $407
line 418
;418:			cg.fraglimitWarnings |= 1;
ADDRLP4 20
ADDRGP4 cg+107620
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 419
;419:			CG_AddBufferedSound(cgs.media.threeFragSound);
ADDRGP4 cgs+148692+916
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 420
;420:		}
LABELV $407
LABELV $400
LABELV $393
line 421
;421:	}
LABELV $382
line 422
;422:}
LABELV $241
endproc CG_CheckLocalSounds 32 12
export CG_TransitionPlayerState
proc CG_TransitionPlayerState 12 12
line 430
;423:
;424:/*
;425:===============
;426:CG_TransitionPlayerState
;427:
;428:===============
;429:*/
;430:void CG_TransitionPlayerState( playerState_t *ps, playerState_t *ops ) {
line 434
;431:	qboolean respawn;
;432:
;433:	// check for changing follow mode
;434:	if ( ps->clientNum != ops->clientNum ) {
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
EQI4 $416
line 435
;435:		cg.thisFrameTeleport = qtrue;
ADDRGP4 cg+107592
CNSTI4 1
ASGNI4
line 437
;436:		// make sure we don't get any unwanted transition effects
;437:		*ops = *ps;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 468
line 438
;438:	}
LABELV $416
line 441
;439:
;440:	// damage events (player is getting wounded)
;441:	if ( ps->damageEvent != ops->damageEvent && ps->damageCount ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
EQI4 $419
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 0
EQI4 $419
line 442
;442:		CG_DamageFeedback( ps->damageYaw, ps->damagePitch, ps->damageCount );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DamageFeedback
CALLV
pop
line 443
;443:	}
LABELV $419
line 446
;444:
;445:	// respawning / map restart
;446:	respawn = ps->persistant[PERS_SPAWN_COUNT] != ops->persistant[PERS_SPAWN_COUNT];
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
EQI4 $422
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $423
JUMPV
LABELV $422
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $423
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 447
;447:	if ( respawn || cg.mapRestart ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $427
ADDRGP4 cg+107624
INDIRI4
CNSTI4 0
EQI4 $424
LABELV $427
line 448
;448:		cg.mapRestart = qfalse;
ADDRGP4 cg+107624
CNSTI4 0
ASGNI4
line 449
;449:		CG_Respawn();
ADDRGP4 CG_Respawn
CALLV
pop
line 450
;450:	}
LABELV $424
line 452
;451:
;452:	if ( cg.snap->ps.pm_type != PM_INTERMISSION 
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 5
EQI4 $429
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 3
EQI4 $429
line 453
;453:		&& ps->persistant[PERS_TEAM] != TEAM_SPECTATOR ) {
line 454
;454:		CG_CheckLocalSounds( ps, ops );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_CheckLocalSounds
CALLV
pop
line 455
;455:	}
LABELV $429
line 458
;456:
;457:	// check for going low on ammo
;458:	CG_CheckAmmo();
ADDRGP4 CG_CheckAmmo
CALLV
pop
line 461
;459:
;460:	 // try to play potentially dropped events
;461:	CG_PlayDroppedEvents( ps, ops );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_PlayDroppedEvents
CALLV
pop
line 464
;462:
;463:	// run events
;464:	CG_CheckPlayerstateEvents( ps, ops );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_CheckPlayerstateEvents
CALLV
pop
line 467
;465:
;466:	// reset event stack
;467:	eventStack = 0;
ADDRGP4 eventStack
CNSTI4 0
ASGNI4
line 470
;468:
;469:	// smooth the ducking viewheight change
;470:	if ( ps->viewheight != ops->viewheight && !respawn ) {
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
EQI4 $432
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $432
line 471
;471:		cg.duckChange = ps->viewheight - ops->viewheight;
ADDRGP4 cg+108940
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 472
;472:		cg.duckTime = cg.time;
ADDRGP4 cg+108944
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 473
;473:	}
LABELV $432
line 474
;474:}
LABELV $415
endproc CG_TransitionPlayerState 12 12
import eventParm2
import eventStack
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
LABELV $111
byte 1 63
byte 1 63
byte 1 63
byte 1 0
align 1
LABELV $108
byte 1 110
byte 1 0
