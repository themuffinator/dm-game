data
export playerMins
align 4
LABELV playerMins
byte 4 3245342720
byte 4 3245342720
byte 4 3250585600
export playerMaxs
align 4
LABELV playerMaxs
byte 4 1097859072
byte 4 1097859072
byte 4 1107296256
export SP_info_player_deathmatch
code
proc SP_info_player_deathmatch 8 12
file "..\..\..\..\code\game\g_client.c"
line 19
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "g_local.h"
;4:
;5:// g_client.c -- client functions that don't happen every frame
;6:
;7:const vec3_t	playerMins = {-15, -15, -24};
;8:const vec3_t	playerMaxs = { 15,  15,  32};
;9:
;10:static char	ban_reason[MAX_CVAR_VALUE_STRING];
;11:
;12:/*QUAKED info_player_deathmatch (1 0 1) (-16 -16 -24) (16 16 32) initial
;13:potential spawning position for deathmatch games.
;14:The first time a player enters the game, they will be at an 'initial' spot.
;15:Targets will be fired when someone spawns in on them.
;16:"nobots" will prevent bots from using this spot.
;17:"nohumans" will prevent non-bots from using this spot.
;18:*/
;19:void SP_info_player_deathmatch( gentity_t *ent ) {
line 22
;20:	int		i;
;21:
;22:	G_SpawnInt( "nobots", "0", &i);
ADDRGP4 $56
ARGP4
ADDRGP4 $57
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 23
;23:	if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $58
line 24
;24:		ent->flags |= FL_NO_BOTS;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 8192
BORI4
ASGNI4
line 25
;25:	}
LABELV $58
line 26
;26:	G_SpawnInt( "nohumans", "0", &i );
ADDRGP4 $60
ARGP4
ADDRGP4 $57
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 27
;27:	if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $61
line 28
;28:		ent->flags |= FL_NO_HUMANS;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 29
;29:	}
LABELV $61
line 30
;30:}
LABELV $55
endproc SP_info_player_deathmatch 8 12
export SP_info_player_start
proc SP_info_player_start 0 4
line 35
;31:
;32:/*QUAKED info_player_start (1 0 0) (-16 -16 -24) (16 16 32)
;33:equivelant to info_player_deathmatch
;34:*/
;35:void SP_info_player_start(gentity_t *ent) {
line 36
;36:	ent->classname = "info_player_deathmatch";
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $64
ASGNP4
line 37
;37:	SP_info_player_deathmatch( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SP_info_player_deathmatch
CALLV
pop
line 38
;38:}
LABELV $63
endproc SP_info_player_start 0 4
export SP_info_player_intermission
proc SP_info_player_intermission 0 0
line 43
;39:
;40:/*QUAKED info_player_intermission (1 0 1) (-16 -16 -24) (16 16 32)
;41:The intermission will be viewed from this point.  Target an info_notnull for the view direction.
;42:*/
;43:void SP_info_player_intermission( gentity_t *ent ) {
line 45
;44:
;45:}
LABELV $65
endproc SP_info_player_intermission 0 0
export SpotWouldTelefrag
proc SpotWouldTelefrag 4144 16
line 63
;46:
;47:
;48:
;49:/*
;50:=======================================================================
;51:
;52:  SelectSpawnPoint
;53:
;54:=======================================================================
;55:*/
;56:
;57:/*
;58:================
;59:SpotWouldTelefrag
;60:
;61:================
;62:*/
;63:qboolean SpotWouldTelefrag( gentity_t *spot ) {
line 69
;64:	int			i, num;
;65:	int			touch[MAX_GENTITIES];
;66:	gentity_t	*hit;
;67:	vec3_t		mins, maxs;
;68:
;69:	VectorAdd( spot->s.origin, playerMins, mins );
ADDRLP4 4132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4108
ADDRLP4 4132
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRGP4 playerMins
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4108+4
ADDRLP4 4132
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRGP4 playerMins+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4108+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRGP4 playerMins+8
INDIRF4
ADDF4
ASGNF4
line 70
;70:	VectorAdd( spot->s.origin, playerMaxs, maxs );
ADDRLP4 4136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4120
ADDRLP4 4136
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRGP4 playerMaxs
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4120+4
ADDRLP4 4136
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRGP4 playerMaxs+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4120+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRGP4 playerMaxs+8
INDIRF4
ADDF4
ASGNF4
line 71
;71:	num = trap_EntitiesInBox( mins, maxs, touch, MAX_GENTITIES );
ADDRLP4 4108
ARGP4
ADDRLP4 4120
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4140
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 4140
INDIRI4
ASGNI4
line 73
;72:
;73:	for (i=0 ; i<num ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $78
JUMPV
LABELV $75
line 74
;74:		hit = &g_entities[touch[i]];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 76
;75:		//if ( hit->client && hit->client->ps.stats[STAT_HEALTH] > 0 ) {
;76:		if ( hit->client) {
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $79
line 77
;77:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $66
JUMPV
LABELV $79
line 80
;78:		}
;79:
;80:	}
LABELV $76
line 73
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $78
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $75
line 82
;81:
;82:	return qfalse;
CNSTI4 0
RETI4
LABELV $66
endproc SpotWouldTelefrag 4144 16
proc SelectRandomFurthestSpawnPoint 596 4
line 94
;83:}
;84:
;85:
;86:/*
;87:===========
;88:SelectRandomFurthestSpawnPoint
;89:
;90:Chooses a player start, deathmatch start, etc
;91:============
;92:*/
;93:#define	MAX_SPAWN_POINTS 64
;94:static gentity_t *SelectRandomFurthestSpawnPoint( const gentity_t *ent, vec3_t avoidPoint, vec3_t origin, vec3_t angles ) {
line 107
;95:	gentity_t	*spot;
;96:	vec3_t		delta;
;97:	float		dist;
;98:	float		list_dist[MAX_SPAWN_POINTS];
;99:	gentity_t	*list_spot[MAX_SPAWN_POINTS];
;100:	int			numSpots, i, j, n;
;101:	int			selection;
;102:	int			checkTelefrag;
;103:	int			checkType;
;104:	int			checkMask;
;105:	qboolean	isBot;
;106:
;107:	checkType = qtrue;
ADDRLP4 552
CNSTI4 1
ASGNI4
line 108
;108:	checkTelefrag = qtrue;
ADDRLP4 548
CNSTI4 1
ASGNI4
line 110
;109:
;110:	if ( ent )
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $82
line 111
;111:		isBot = ((ent->r.svFlags & SVF_BOT) == SVF_BOT); 
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 8
NEI4 $85
ADDRLP4 568
CNSTI4 1
ASGNI4
ADDRGP4 $86
JUMPV
LABELV $85
ADDRLP4 568
CNSTI4 0
ASGNI4
LABELV $86
ADDRLP4 556
ADDRLP4 568
INDIRI4
ASGNI4
ADDRGP4 $83
JUMPV
LABELV $82
line 113
;112:	else
;113:		isBot = qfalse;
ADDRLP4 556
CNSTI4 0
ASGNI4
LABELV $83
line 115
;114:
;115:	checkMask = 3;
ADDRLP4 560
CNSTI4 3
ASGNI4
LABELV $87
line 119
;116:
;117:__search:
;118:
;119:	checkTelefrag = checkMask & 1;
ADDRLP4 548
ADDRLP4 560
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 120
;120:	checkType = checkMask & 2;
ADDRLP4 552
ADDRLP4 560
INDIRI4
CNSTI4 2
BANDI4
ASGNI4
line 122
;121:
;122:	numSpots = 0;
ADDRLP4 520
CNSTI4 0
ASGNI4
line 123
;123:	for ( n = 0 ; n < level.numSpawnSpots ; n++ ) {
ADDRLP4 544
CNSTI4 0
ASGNI4
ADDRGP4 $91
JUMPV
LABELV $88
line 124
;124:		spot = level.spawnSpots[n];
ADDRLP4 528
ADDRLP4 544
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+7692
ADDP4
INDIRP4
ASGNP4
line 126
;125:
;126:		if ( spot->fteam != TEAM_FREE && level.numSpawnSpotsFFA > 0 )
ADDRLP4 528
INDIRP4
CNSTI4 816
ADDP4
INDIRI4
CNSTI4 0
EQI4 $94
ADDRGP4 level+11796
INDIRI4
CNSTI4 0
LEI4 $94
line 127
;127:			continue;
ADDRGP4 $89
JUMPV
LABELV $94
line 129
;128:
;129:		if ( checkTelefrag && SpotWouldTelefrag( spot ) )
ADDRLP4 548
INDIRI4
CNSTI4 0
EQI4 $97
ADDRLP4 528
INDIRP4
ARGP4
ADDRLP4 572
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 572
INDIRI4
CNSTI4 0
EQI4 $97
line 130
;130:			continue;
ADDRGP4 $89
JUMPV
LABELV $97
line 132
;131:
;132:		if ( checkType ) 
ADDRLP4 552
INDIRI4
CNSTI4 0
EQI4 $99
line 133
;133:		{
line 134
;134:			if ( (spot->flags & FL_NO_BOTS) && isBot )
ADDRLP4 528
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $101
ADDRLP4 556
INDIRI4
CNSTI4 0
EQI4 $101
line 135
;135:				continue;
ADDRGP4 $89
JUMPV
LABELV $101
line 136
;136:			if ( (spot->flags & FL_NO_HUMANS) && !isBot )
ADDRLP4 528
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $103
ADDRLP4 556
INDIRI4
CNSTI4 0
NEI4 $103
line 137
;137:				continue;
ADDRGP4 $89
JUMPV
LABELV $103
line 138
;138:		}
LABELV $99
line 140
;139:
;140:		VectorSubtract( spot->s.origin, avoidPoint, delta );
ADDRLP4 580
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 532
ADDRLP4 528
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 580
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 532+4
ADDRLP4 528
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 580
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 532+8
ADDRLP4 528
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 141
;141:		dist = VectorLength( delta );
ADDRLP4 532
ARGP4
ADDRLP4 584
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 524
ADDRLP4 584
INDIRF4
ASGNF4
line 143
;142:
;143:		for ( i = 0; i < numSpots; i++ )
ADDRLP4 516
CNSTI4 0
ASGNI4
ADDRGP4 $110
JUMPV
LABELV $107
line 144
;144:		{
line 145
;145:			if( dist > list_dist[i] )
ADDRLP4 524
INDIRF4
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
LEF4 $111
line 146
;146:			{
line 147
;147:				if (numSpots >= MAX_SPAWN_POINTS)
ADDRLP4 520
INDIRI4
CNSTI4 64
LTI4 $113
line 148
;148:					numSpots = MAX_SPAWN_POINTS - 1;
ADDRLP4 520
CNSTI4 63
ASGNI4
LABELV $113
line 150
;149:
;150:				for( j = numSpots; j > i; j-- )
ADDRLP4 0
ADDRLP4 520
INDIRI4
ASGNI4
ADDRGP4 $118
JUMPV
LABELV $115
line 151
;151:				{
line 152
;152:					list_dist[j] = list_dist[j-1];
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
ADDRLP4 4-4
ADDP4
INDIRF4
ASGNF4
line 153
;153:					list_spot[j] = list_spot[j-1];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260-4
ADDP4
INDIRP4
ASGNP4
line 154
;154:				}
LABELV $116
line 150
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $118
ADDRLP4 0
INDIRI4
ADDRLP4 516
INDIRI4
GTI4 $115
line 156
;155:
;156:				list_dist[i] = dist;
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 524
INDIRF4
ASGNF4
line 157
;157:				list_spot[i] = spot;
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
ADDRLP4 528
INDIRP4
ASGNP4
line 159
;158:
;159:				numSpots++;
ADDRLP4 520
ADDRLP4 520
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 160
;160:				break;
ADDRGP4 $109
JUMPV
LABELV $111
line 162
;161:			}
;162:		}
LABELV $108
line 143
ADDRLP4 516
ADDRLP4 516
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $110
ADDRLP4 516
INDIRI4
ADDRLP4 520
INDIRI4
LTI4 $107
LABELV $109
line 164
;163:
;164:		if(i >= numSpots && numSpots < MAX_SPAWN_POINTS)
ADDRLP4 516
INDIRI4
ADDRLP4 520
INDIRI4
LTI4 $121
ADDRLP4 520
INDIRI4
CNSTI4 64
GEI4 $121
line 165
;165:		{
line 166
;166:			list_dist[numSpots] = dist;
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 524
INDIRF4
ASGNF4
line 167
;167:			list_spot[numSpots] = spot;
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
ADDRLP4 528
INDIRP4
ASGNP4
line 168
;168:			numSpots++;
ADDRLP4 520
ADDRLP4 520
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 169
;169:		}
LABELV $121
line 170
;170:	}
LABELV $89
line 123
ADDRLP4 544
ADDRLP4 544
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $91
ADDRLP4 544
INDIRI4
ADDRGP4 level+11788
INDIRI4
LTI4 $88
line 172
;171:
;172:	if ( !numSpots ) {
ADDRLP4 520
INDIRI4
CNSTI4 0
NEI4 $123
line 173
;173:		if ( checkMask <= 0 ) {
ADDRLP4 560
INDIRI4
CNSTI4 0
GTI4 $125
line 174
;174:			G_Error( "Couldn't find a spawn point" );
ADDRGP4 $127
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 175
;175:			return NULL;
CNSTP4 0
RETP4
ADDRGP4 $81
JUMPV
LABELV $125
line 177
;176:		}
;177:		checkMask--;
ADDRLP4 560
ADDRLP4 560
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 178
;178:		goto __search; // next attempt with different flags
ADDRGP4 $87
JUMPV
LABELV $123
line 182
;179:	}
;180:
;181:	// select a random spot from the spawn points furthest away
;182:	selection = random() * (numSpots / 2);
ADDRLP4 572
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 564
ADDRLP4 572
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 520
INDIRI4
CNSTI4 2
DIVI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 183
;183:	spot = list_spot[ selection ];
ADDRLP4 528
ADDRLP4 564
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
INDIRP4
ASGNP4
line 185
;184:
;185:	VectorCopy( spot->s.angles, angles );
ADDRFP4 12
INDIRP4
ADDRLP4 528
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 186
;186:	VectorCopy( spot->s.origin, origin );
ADDRFP4 8
INDIRP4
ADDRLP4 528
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 187
;187:	origin[2] += 9.0f;
ADDRLP4 576
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 576
INDIRP4
ADDRLP4 576
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 189
;188:
;189:	return spot;
ADDRLP4 528
INDIRP4
RETP4
LABELV $81
endproc SelectRandomFurthestSpawnPoint 596 4
export SelectSpawnPoint
proc SelectSpawnPoint 4 16
line 200
;190:}
;191:
;192:
;193:/*
;194:===========
;195:SelectSpawnPoint
;196:
;197:Chooses a player start, deathmatch start, etc
;198:============
;199:*/
;200:gentity_t *SelectSpawnPoint( gentity_t *ent, vec3_t avoidPoint, vec3_t origin, vec3_t angles ) {
line 201
;201:	return SelectRandomFurthestSpawnPoint( ent, avoidPoint, origin, angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 SelectRandomFurthestSpawnPoint
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
RETP4
LABELV $128
endproc SelectSpawnPoint 4 16
export SelectInitialSpawnPoint
proc SelectInitialSpawnPoint 20 16
line 213
;202:}
;203:
;204:
;205:/*
;206:===========
;207:SelectInitialSpawnPoint
;208:
;209:Try to find a spawn point marked 'initial', otherwise
;210:use normal spawn selection.
;211:============
;212:*/
;213:gentity_t *SelectInitialSpawnPoint( gentity_t *ent, vec3_t origin, vec3_t angles ) {
line 217
;214:	gentity_t	*spot;
;215:	int n;
;216:
;217:	spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 219
;218:
;219:	for ( n = 0; n < level.numSpawnSpotsFFA; n++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $133
JUMPV
LABELV $130
line 220
;220:		spot = level.spawnSpots[ n ];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+7692
ADDP4
INDIRP4
ASGNP4
line 221
;221:		if ( spot->fteam != TEAM_FREE )
ADDRLP4 0
INDIRP4
CNSTI4 816
ADDP4
INDIRI4
CNSTI4 0
EQI4 $136
line 222
;222:			continue;
ADDRGP4 $131
JUMPV
LABELV $136
line 223
;223:		if ( spot->spawnflags & 1 )
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $138
line 224
;224:			break;
ADDRGP4 $132
JUMPV
LABELV $138
line 226
;225:		else
;226:			spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 227
;227:	}
LABELV $131
line 219
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $133
ADDRLP4 4
INDIRI4
ADDRGP4 level+11796
INDIRI4
LTI4 $130
LABELV $132
line 229
;228:
;229:	if ( !spot || SpotWouldTelefrag( spot ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $142
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $140
LABELV $142
line 230
;230:		return SelectSpawnPoint( ent, vec3_origin, origin, angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
RETP4
ADDRGP4 $129
JUMPV
LABELV $140
line 233
;231:	}
;232:
;233:	VectorCopy( spot->s.angles, angles );
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 234
;234:	VectorCopy( spot->s.origin, origin );
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 235
;235:	origin[2] += 9.0f;
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 237
;236:
;237:	return spot;
ADDRLP4 0
INDIRP4
RETP4
LABELV $129
endproc SelectInitialSpawnPoint 20 16
export SelectSpectatorSpawnPoint
proc SelectSpectatorSpawnPoint 0 0
line 247
;238:}
;239:
;240:
;241:/*
;242:===========
;243:SelectSpectatorSpawnPoint
;244:
;245:============
;246:*/
;247:gentity_t *SelectSpectatorSpawnPoint( vec3_t origin, vec3_t angles ) {
line 248
;248:	FindIntermissionPoint();
ADDRGP4 FindIntermissionPoint
CALLV
pop
line 250
;249:
;250:	VectorCopy( level.intermission_origin, origin );
ADDRFP4 0
INDIRP4
ADDRGP4 level+7616
INDIRB
ASGNB 12
line 251
;251:	VectorCopy( level.intermission_angle, angles );
ADDRFP4 4
INDIRP4
ADDRGP4 level+7628
INDIRB
ASGNB 12
line 253
;252:
;253:	return level.spawnSpots[ SPAWN_SPOT_INTERMISSION ]; // was NULL
ADDRGP4 level+7692+4092
INDIRP4
RETP4
LABELV $143
endproc SelectSpectatorSpawnPoint 0 0
export InitBodyQue
proc InitBodyQue 12 0
line 270
;254:}
;255:
;256:
;257:/*
;258:=======================================================================
;259:
;260:BODYQUE
;261:
;262:=======================================================================
;263:*/
;264:
;265:/*
;266:===============
;267:InitBodyQue
;268:===============
;269:*/
;270:void InitBodyQue (void) {
line 274
;271:	int		i;
;272:	gentity_t	*ent;
;273:
;274:	level.bodyQueIndex = 0;
ADDRGP4 level+7652
CNSTI4 0
ASGNI4
line 275
;275:	for (i=0; i<BODY_QUEUE_SIZE ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $150
line 276
;276:		ent = G_Spawn();
ADDRLP4 8
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 277
;277:		ent->classname = "bodyque";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $154
ASGNP4
line 278
;278:		ent->neverFree = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
CNSTI4 1
ASGNI4
line 279
;279:		level.bodyQue[i] = ent;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+7656
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 280
;280:	}
LABELV $151
line 275
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 8
LTI4 $150
line 281
;281:}
LABELV $148
endproc InitBodyQue 12 0
export BodySink
proc BodySink 4 4
line 290
;282:
;283:/*
;284:=============
;285:BodySink
;286:
;287:After sitting around for five seconds, fall into the ground and dissapear
;288:=============
;289:*/
;290:void BodySink( gentity_t *ent ) {
line 291
;291:	if ( level.time - ent->timestamp > 6500 ) {
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
SUBI4
CNSTI4 6500
LEI4 $157
line 293
;292:		// the body ques are never actually freed, they are just unlinked
;293:		trap_UnlinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 294
;294:		ent->physicsObject = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 0
ASGNI4
line 295
;295:		return;	
ADDRGP4 $156
JUMPV
LABELV $157
line 297
;296:	}
;297:	ent->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 298
;298:	ent->s.pos.trBase[2] -= 1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
SUBF4
ASGNF4
line 299
;299:}
LABELV $156
endproc BodySink 4 4
export CopyToBodyQue
proc CopyToBodyQue 56 8
line 310
;300:
;301:
;302:/*
;303:=============
;304:CopyToBodyQue
;305:
;306:A player is respawning, so make an entity that looks
;307:just like the existing corpse to leave behind.
;308:=============
;309:*/
;310:void CopyToBodyQue( gentity_t *ent ) {
line 316
;311:	gentity_t	*e;
;312:	int i;
;313:	gentity_t		*body;
;314:	int			contents;
;315:
;316:	trap_UnlinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 319
;317:
;318:	// if client is in a nodrop area, don't leave the body
;319:	contents = trap_PointContents( ent->s.origin, -1 );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 16
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 16
INDIRI4
ASGNI4
line 320
;320:	if ( contents & CONTENTS_NODROP ) {
ADDRLP4 12
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
EQU4 $162
line 321
;321:		return;
ADDRGP4 $161
JUMPV
LABELV $162
line 325
;322:	}
;323:
;324:	// grab a body que and cycle to the next one
;325:	body = level.bodyQue[ level.bodyQueIndex ];
ADDRLP4 0
ADDRGP4 level+7652
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+7656
ADDP4
INDIRP4
ASGNP4
line 326
;326:	level.bodyQueIndex = (level.bodyQueIndex + 1) % BODY_QUEUE_SIZE;
ADDRGP4 level+7652
ADDRGP4 level+7652
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 8
MODI4
ASGNI4
line 328
;327:
;328:	trap_UnlinkEntity (body);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 330
;329:
;330:	body->s = ent->s;
ADDRLP4 0
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 208
line 331
;331:	body->s.eFlags = EF_DEAD;		// clear EF_TALK, etc
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 1
ASGNI4
line 332
;332:	if ( ent->s.eFlags & EF_KAMIKAZE ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $168
line 333
;333:		body->s.eFlags |= EF_KAMIKAZE;
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 336
;334:
;335:		// check if there is a kamikaze timer around for this owner
;336:		for (i = 0; i < level.num_entities; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $173
JUMPV
LABELV $170
line 337
;337:			e = &g_entities[i];
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 338
;338:			if (!e->inuse)
ADDRLP4 4
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $175
line 339
;339:				continue;
ADDRGP4 $171
JUMPV
LABELV $175
line 340
;340:			if (e->activator != ent)
ADDRLP4 4
INDIRP4
CNSTI4 772
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $177
line 341
;341:				continue;
ADDRGP4 $171
JUMPV
LABELV $177
line 342
;342:			if (strcmp(e->classname, "kamikaze timer"))
ADDRLP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $181
ARGP4
ADDRLP4 24
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $179
line 343
;343:				continue;
ADDRGP4 $171
JUMPV
LABELV $179
line 344
;344:			e->activator = body;
ADDRLP4 4
INDIRP4
CNSTI4 772
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 345
;345:			break;
ADDRGP4 $172
JUMPV
LABELV $171
line 336
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $173
ADDRLP4 8
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $170
LABELV $172
line 347
;346:		}
;347:	}
LABELV $168
line 348
;348:	body->s.powerups = 0;	// clear powerups
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 0
ASGNI4
line 349
;349:	body->s.loopSound = 0;	// clear lava burning
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 350
;350:	body->s.number = body - g_entities;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ASGNI4
line 351
;351:	body->timestamp = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 352
;352:	body->physicsObject = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 1
ASGNI4
line 353
;353:	body->physicsBounce = 0;		// don't bounce
ADDRLP4 0
INDIRP4
CNSTI4 568
ADDP4
CNSTF4 0
ASGNF4
line 354
;354:	if ( body->s.groundEntityNum == ENTITYNUM_NONE ) {
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $183
line 355
;355:		body->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 356
;356:		body->s.pos.trTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 357
;357:		VectorCopy( ent->client->ps.velocity, body->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 358
;358:	} else {
ADDRGP4 $184
JUMPV
LABELV $183
line 359
;359:		body->s.pos.trType = TR_STATIONARY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 360
;360:	}
LABELV $184
line 361
;361:	body->s.event = 0;
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
CNSTI4 0
ASGNI4
line 365
;362:
;363:	// change the animation to the last-frame only, so the sequence
;364:	// doesn't repeat anew for the body
;365:	switch ( body->s.legsAnim & ~ANIM_TOGGLEBIT ) {
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
LTI4 $186
ADDRLP4 24
INDIRI4
CNSTI4 5
GTI4 $186
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $192
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $192
address $189
address $189
address $190
address $190
address $191
address $191
code
LABELV $189
line 368
;366:	case BOTH_DEATH1:
;367:	case BOTH_DEAD1:
;368:		body->s.torsoAnim = body->s.legsAnim = BOTH_DEAD1;
ADDRLP4 36
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 369
;369:		break;
ADDRGP4 $187
JUMPV
LABELV $190
line 372
;370:	case BOTH_DEATH2:
;371:	case BOTH_DEAD2:
;372:		body->s.torsoAnim = body->s.legsAnim = BOTH_DEAD2;
ADDRLP4 44
CNSTI4 3
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 373
;373:		break;
ADDRGP4 $187
JUMPV
LABELV $191
LABELV $186
line 377
;374:	case BOTH_DEATH3:
;375:	case BOTH_DEAD3:
;376:	default:
;377:		body->s.torsoAnim = body->s.legsAnim = BOTH_DEAD3;
ADDRLP4 52
CNSTI4 5
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 52
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 52
INDIRI4
ASGNI4
line 378
;378:		break;
LABELV $187
line 381
;379:	}
;380:
;381:	body->r.svFlags = ent->r.svFlags;
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
ASGNI4
line 382
;382:	VectorCopy (ent->r.mins, body->r.mins);
ADDRLP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRB
ASGNB 12
line 383
;383:	VectorCopy (ent->r.maxs, body->r.maxs);
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
INDIRB
ASGNB 12
line 384
;384:	VectorCopy (ent->r.absmin, body->r.absmin);
ADDRLP4 0
INDIRP4
CNSTI4 464
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRB
ASGNB 12
line 385
;385:	VectorCopy (ent->r.absmax, body->r.absmax);
ADDRLP4 0
INDIRP4
CNSTI4 476
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRB
ASGNB 12
line 387
;386:
;387:	body->clipmask = CONTENTS_SOLID | CONTENTS_PLAYERCLIP;
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 65537
ASGNI4
line 388
;388:	body->r.contents = CONTENTS_CORPSE;
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 67108864
ASGNI4
line 389
;389:	body->r.ownerNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 391
;390:
;391:	body->nextthink = level.time + 5000;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 392
;392:	body->think = BodySink;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 BodySink
ASGNP4
line 394
;393:
;394:	body->die = body_die;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 body_die
ASGNP4
line 397
;395:
;396:	// don't take more damage if already gibbed
;397:	if ( ent->health <= GIB_HEALTH ) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $194
line 398
;398:		body->takedamage = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
CNSTI4 0
ASGNI4
line 399
;399:	} else {
ADDRGP4 $195
JUMPV
LABELV $194
line 400
;400:		body->takedamage = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
CNSTI4 1
ASGNI4
line 401
;401:	}
LABELV $195
line 403
;402:
;403:	VectorCopy ( body->s.pos.trBase, body->r.currentOrigin );
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 404
;404:	trap_LinkEntity( body );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 405
;405:}
LABELV $161
endproc CopyToBodyQue 56 8
export SetClientViewAngle
proc SetClientViewAngle 20 0
line 415
;406:
;407:
;408://======================================================================
;409:
;410:/*
;411:==================
;412:SetClientViewAngle
;413:==================
;414:*/
;415:void SetClientViewAngle( gentity_t *ent, vec3_t angle ) {
line 419
;416:	int	i, cmdAngle;
;417:	gclient_t	*client;
;418:
;419:	client = ent->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 422
;420:
;421:	// set the delta angle
;422:	for (i = 0 ; i < 3 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $197
line 423
;423:		cmdAngle = ANGLE2SHORT(angle[i]);
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
CNSTF4 1127615329
MULF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
line 424
;424:		client->ps.delta_angles[i] = cmdAngle - client->pers.cmd.angles[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 56
ADDP4
ADDP4
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 476
ADDP4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 425
;425:	}
LABELV $198
line 422
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $197
line 426
;426:	VectorCopy( angle, ent->s.angles );
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 427
;427:	VectorCopy( ent->s.angles, client->ps.viewangles );
ADDRLP4 4
INDIRP4
CNSTI4 152
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 428
;428:}
LABELV $196
endproc SetClientViewAngle 20 0
export respawn
proc respawn 8 8
line 436
;429:
;430:
;431:/*
;432:================
;433:respawn
;434:================
;435:*/
;436:void respawn( gentity_t *ent ) {
line 439
;437:	gentity_t	*tent;
;438:
;439:	if ( ent->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 0
GTI4 $202
line 440
;440:		CopyToBodyQue( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CopyToBodyQue
CALLV
pop
LABELV $202
line 442
;441:
;442:	ClientSpawn( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientSpawn
CALLV
pop
line 445
;443:
;444:	// bots doesn't need to see any effects
;445:	if ( level.intermissiontime && ent->r.svFlags & SVF_BOT )
ADDRGP4 level+7604
INDIRI4
CNSTI4 0
EQI4 $204
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $204
line 446
;446:		return;
ADDRGP4 $201
JUMPV
LABELV $204
line 449
;447:
;448:	// add a teleportation effect
;449:	tent = G_TempEntity( ent->client->ps.origin, EV_PLAYER_TELEPORT_IN );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 42
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 450
;450:	tent->s.clientNum = ent->s.clientNum;
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 453
;451:
;452:	// optimize bandwidth
;453:	if ( level.intermissiontime ) {
ADDRGP4 level+7604
INDIRI4
CNSTI4 0
EQI4 $207
line 454
;454:		tent->r.svFlags = SVF_SINGLECLIENT;
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 256
ASGNI4
line 455
;455:		tent->r.singleClient = ent->s.clientNum;
ADDRLP4 0
INDIRP4
CNSTI4 428
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 456
;456:	}
LABELV $207
line 457
;457:}
LABELV $201
endproc respawn 8 8
export TeamCount
proc TeamCount 8 0
line 467
;458:
;459:
;460:/*
;461:================
;462:TeamCount
;463:
;464:Returns number of players on a team
;465:================
;466:*/
;467:int TeamCount( int ignoreClientNum, team_t team ) {
line 469
;468:	int		i;
;469:	int		count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 471
;470:
;471:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $214
JUMPV
LABELV $211
line 472
;472:		if ( i == ignoreClientNum ) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $216
line 473
;473:			continue;
ADDRGP4 $212
JUMPV
LABELV $216
line 475
;474:		}
;475:		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
ADDRLP4 0
INDIRI4
CNSTI4 1636
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
NEI4 $218
line 476
;476:			continue;
ADDRGP4 $212
JUMPV
LABELV $218
line 478
;477:		}
;478:		if ( level.clients[i].sess.sessionTeam == team ) {
ADDRLP4 0
INDIRI4
CNSTI4 1636
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 624
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $220
line 479
;479:			count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 480
;480:		}
LABELV $220
line 481
;481:	}
LABELV $212
line 471
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $214
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $211
line 483
;482:
;483:	return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $210
endproc TeamCount 8 0
export TeamConnectedCount
proc TeamConnectedCount 8 0
line 494
;484:}
;485:
;486:
;487:/*
;488:================
;489:TeamConnectedCount
;490:
;491:Returns number of active players on a team
;492:================
;493:*/
;494:int TeamConnectedCount( int ignoreClientNum, team_t team ) {
line 496
;495:	int		i;
;496:	int		count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 498
;497:
;498:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $226
JUMPV
LABELV $223
line 499
;499:		if ( i == ignoreClientNum ) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $228
line 500
;500:			continue;
ADDRGP4 $224
JUMPV
LABELV $228
line 502
;501:		}
;502:		if ( level.clients[i].pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRI4
CNSTI4 1636
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $230
line 503
;503:			continue;
ADDRGP4 $224
JUMPV
LABELV $230
line 505
;504:		}
;505:		if ( level.clients[i].sess.sessionTeam == team ) {
ADDRLP4 0
INDIRI4
CNSTI4 1636
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 624
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $232
line 506
;506:			count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 507
;507:		}
LABELV $232
line 508
;508:	}
LABELV $224
line 498
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $226
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $223
line 510
;509:
;510:	return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $222
endproc TeamConnectedCount 8 0
export TeamLeader
proc TeamLeader 4 0
line 521
;511:}
;512:
;513:
;514:/*
;515:================
;516:TeamLeader
;517:
;518:Returns the client number of the team leader
;519:================
;520:*/
;521:int TeamLeader( team_t team ) {
line 524
;522:	int		i;
;523:
;524:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $238
JUMPV
LABELV $235
line 525
;525:		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
ADDRLP4 0
INDIRI4
CNSTI4 1636
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
NEI4 $240
line 526
;526:			continue;
ADDRGP4 $236
JUMPV
LABELV $240
line 528
;527:		}
;528:		if ( level.clients[i].sess.sessionTeam == team ) {
ADDRLP4 0
INDIRI4
CNSTI4 1636
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 624
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $242
line 529
;529:			if ( level.clients[i].sess.teamLeader )
ADDRLP4 0
INDIRI4
CNSTI4 1636
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 648
ADDP4
INDIRI4
CNSTI4 0
EQI4 $244
line 530
;530:				return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $234
JUMPV
LABELV $244
line 531
;531:		}
LABELV $242
line 532
;532:	}
LABELV $236
line 524
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $238
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $235
line 534
;533:
;534:	return -1;
CNSTI4 -1
RETI4
LABELV $234
endproc TeamLeader 4 0
export PickTeam
proc PickTeam 24 8
line 543
;535:}
;536:
;537:
;538:/*
;539:================
;540:PickTeam
;541:================
;542:*/
;543:team_t PickTeam( int ignoreClientNum ) {
line 546
;544:	int		counts[TEAM_NUM_TEAMS];
;545:
;546:	counts[TEAM_BLUE] = TeamCount( ignoreClientNum, TEAM_BLUE );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 16
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 0+8
ADDRLP4 16
INDIRI4
ASGNI4
line 547
;547:	counts[TEAM_RED] = TeamCount( ignoreClientNum, TEAM_RED );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 20
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 0+4
ADDRLP4 20
INDIRI4
ASGNI4
line 549
;548:
;549:	if ( counts[TEAM_BLUE] > counts[TEAM_RED] ) {
ADDRLP4 0+8
INDIRI4
ADDRLP4 0+4
INDIRI4
LEI4 $249
line 550
;550:		return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $246
JUMPV
LABELV $249
line 552
;551:	}
;552:	if ( counts[TEAM_RED] > counts[TEAM_BLUE] ) {
ADDRLP4 0+4
INDIRI4
ADDRLP4 0+8
INDIRI4
LEI4 $253
line 553
;553:		return TEAM_BLUE;
CNSTI4 2
RETI4
ADDRGP4 $246
JUMPV
LABELV $253
line 556
;554:	}
;555:	// equal team count, so join the team with the lowest score
;556:	if ( level.teamScores[TEAM_BLUE] > level.teamScores[TEAM_RED] ) {
ADDRGP4 level+48+8
INDIRI4
ADDRGP4 level+48+4
INDIRI4
LEI4 $257
line 557
;557:		return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $246
JUMPV
LABELV $257
line 559
;558:	}
;559:	return TEAM_BLUE;
CNSTI4 2
RETI4
LABELV $246
endproc PickTeam 24 8
export ClientUserinfoChanged
proc ClientUserinfoChanged 1292 52
line 576
;560:}
;561:
;562:
;563:/*
;564:===========
;565:ClientUserInfoChanged
;566:
;567:Called from ClientConnect when the player first connects and
;568:directly by the server system when the player updates a userinfo variable.
;569:
;570:The game can override any of the settings and call trap_SetUserinfo
;571:if desired.
;572:
;573:returns qfalse in case of invalid userinfo
;574:============
;575:*/
;576:qboolean ClientUserinfoChanged( int clientNum ) {
line 588
;577:	gentity_t *ent;
;578:	int		teamTask, teamLeader, health;
;579:	char	*s;
;580:	char	model[MAX_QPATH];
;581:	char	headModel[MAX_QPATH];
;582:	char	oldname[MAX_NETNAME];
;583:	gclient_t	*client;
;584:	char	c1[8];
;585:	char	c2[8];
;586:	char	userinfo[MAX_INFO_STRING];
;587:
;588:	ent = g_entities + clientNum;
ADDRLP4 1032
ADDRFP4 0
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 589
;589:	client = ent->client;
ADDRLP4 0
ADDRLP4 1032
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 591
;590:
;591:	trap_GetUserinfo( clientNum, userinfo, sizeof( userinfo ) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 594
;592:
;593:	// check for malformed or illegal info strings
;594:	if ( !Info_Validate( userinfo ) ) {
ADDRLP4 4
ARGP4
ADDRLP4 1228
ADDRGP4 Info_Validate
CALLI4
ASGNI4
ADDRLP4 1228
INDIRI4
CNSTI4 0
NEI4 $264
line 595
;595:		Q_strcpy( ban_reason, "bad userinfo" );
ADDRGP4 ban_reason
ARGP4
ADDRGP4 $266
ARGP4
ADDRGP4 Q_strcpy
CALLV
pop
line 596
;596:		if ( client && client->pers.connected != CON_DISCONNECTED )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $267
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
EQI4 $267
line 597
;597:			trap_DropClient( clientNum, ban_reason );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 ban_reason
ARGP4
ADDRGP4 trap_DropClient
CALLV
pop
LABELV $267
line 598
;598:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $263
JUMPV
LABELV $264
line 601
;599:	}
;600:
;601:	if ( client->pers.connected == CON_DISCONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
NEI4 $269
line 604
;602:		// we just checked if connecting player can join server
;603:		// so quit now as some important data like player team is still not set
;604:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $263
JUMPV
LABELV $269
line 608
;605:	}
;606:
;607:	// check for local client
;608:	s = Info_ValueForKey( userinfo, "ip" );
ADDRLP4 4
ARGP4
ADDRGP4 $271
ARGP4
ADDRLP4 1232
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1232
INDIRP4
ASGNP4
line 609
;609:	if ( !strcmp( s, "localhost" ) ) {
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 $274
ARGP4
ADDRLP4 1236
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1236
INDIRI4
CNSTI4 0
NEI4 $272
line 610
;610:		client->pers.localClient = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
CNSTI4 1
ASGNI4
line 611
;611:	} else {
ADDRGP4 $273
JUMPV
LABELV $272
line 612
;612:		client->pers.localClient = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
CNSTI4 0
ASGNI4
line 613
;613:	}
LABELV $273
line 616
;614:
;615:	// check the item prediction
;616:	s = Info_ValueForKey( userinfo, "cg_predictItems" );
ADDRLP4 4
ARGP4
ADDRGP4 $275
ARGP4
ADDRLP4 1240
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1240
INDIRP4
ASGNP4
line 617
;617:	if ( !atoi( s ) ) {
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 1244
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1244
INDIRI4
CNSTI4 0
NEI4 $276
line 618
;618:		client->pers.predictItemPickup = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 0
ASGNI4
line 619
;619:	} else {
ADDRGP4 $277
JUMPV
LABELV $276
line 620
;620:		client->pers.predictItemPickup = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 1
ASGNI4
line 621
;621:	}
LABELV $277
line 624
;622:
;623:	// set name
;624:	Q_strncpyz( oldname, client->pers.netname, sizeof( oldname ) );
ADDRLP4 1180
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 625
;625:	s = Info_ValueForKey( userinfo, "name" );
ADDRLP4 4
ARGP4
ADDRGP4 $278
ARGP4
ADDRLP4 1248
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1248
INDIRP4
ASGNP4
line 626
;626:	BG_CleanName( s, client->pers.netname, sizeof( client->pers.netname ), "UnnamedPlayer" );
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 $279
ARGP4
ADDRGP4 BG_CleanName
CALLV
pop
line 628
;627:
;628:	if ( client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
NEI4 $280
line 629
;629:		if ( client->sess.spectatorState == SPECTATOR_SCOREBOARD ) {
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
CNSTI4 3
NEI4 $282
line 630
;630:			Q_strncpyz( client->pers.netname, "scoreboard", sizeof(client->pers.netname) );
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRGP4 $284
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 631
;631:		}
LABELV $282
line 632
;632:	}
LABELV $280
line 634
;633:
;634:	if ( client->pers.connected == CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
NEI4 $285
line 635
;635:		if ( strcmp( oldname, client->pers.netname ) ) {
ADDRLP4 1180
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 1252
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1252
INDIRI4
CNSTI4 0
EQI4 $287
line 636
;636:			G_BroadcastServerCommand( -1, va("print \"%s" S_COLOR_WHITE " renamed to %s\n\"", oldname, client->pers.netname) );
ADDRGP4 $289
ARGP4
ADDRLP4 1180
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 1256
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1256
INDIRP4
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 637
;637:		}
LABELV $287
line 638
;638:	}
LABELV $285
line 641
;639:
;640:	// set max health
;641:	if (client->ps.powerups[PW_GUARD]) {
ADDRLP4 0
INDIRP4
CNSTI4 356
ADDP4
INDIRI4
CNSTI4 0
EQI4 $290
line 642
;642:		client->pers.maxHealth = HEALTH_SOFT_LIMIT*2;
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
CNSTI4 200
ASGNI4
line 643
;643:	} else {
ADDRGP4 $291
JUMPV
LABELV $290
line 644
;644:		health = atoi( Info_ValueForKey( userinfo, "handicap" ) );
ADDRLP4 4
ARGP4
ADDRGP4 $292
ARGP4
ADDRLP4 1252
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1252
INDIRP4
ARGP4
ADDRLP4 1256
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1224
ADDRLP4 1256
INDIRI4
ASGNI4
line 645
;645:		client->pers.maxHealth = health;
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
ADDRLP4 1224
INDIRI4
ASGNI4
line 646
;646:		if ( client->pers.maxHealth < 1 || client->pers.maxHealth > HEALTH_SOFT_LIMIT ) {
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 1
LTI4 $295
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 100
LEI4 $293
LABELV $295
line 647
;647:			client->pers.maxHealth = HEALTH_SOFT_LIMIT;
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
CNSTI4 100
ASGNI4
line 648
;648:		}
LABELV $293
line 649
;649:	}
LABELV $291
line 650
;650:	client->ps.stats[STAT_MAX_HEALTH] = client->pers.maxHealth;
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
ASGNI4
line 652
;651:
;652:	if ( GTx( g_gametype.integer, GTF_TEAMS ) ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 36
MULI4
ADDRGP4 gt+20
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $296
line 653
;653:		client->pers.teamInfo = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
CNSTI4 1
ASGNI4
line 654
;654:	} else {
ADDRGP4 $297
JUMPV
LABELV $296
line 655
;655:		s = Info_ValueForKey( userinfo, "teamoverlay" );
ADDRLP4 4
ARGP4
ADDRGP4 $300
ARGP4
ADDRLP4 1256
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1256
INDIRP4
ASGNP4
line 656
;656:		if ( ! *s || atoi( s ) != 0 ) {
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $303
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 1264
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1264
INDIRI4
CNSTI4 0
EQI4 $301
LABELV $303
line 657
;657:			client->pers.teamInfo = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
CNSTI4 1
ASGNI4
line 658
;658:		} else {
ADDRGP4 $302
JUMPV
LABELV $301
line 659
;659:			client->pers.teamInfo = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
CNSTI4 0
ASGNI4
line 660
;660:		}
LABELV $302
line 661
;661:	}
LABELV $297
line 664
;662:
;663:	// set model
;664:	Q_strncpyz( model, Info_ValueForKey( userinfo, "model" ), sizeof( model ) );
ADDRLP4 4
ARGP4
ADDRGP4 $304
ARGP4
ADDRLP4 1256
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1036
ARGP4
ADDRLP4 1256
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 665
;665:	Q_strncpyz( headModel, Info_ValueForKey( userinfo, "headmodel" ), sizeof( headModel ) );
ADDRLP4 4
ARGP4
ADDRGP4 $305
ARGP4
ADDRLP4 1260
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1100
ARGP4
ADDRLP4 1260
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 668
;666:
;667:	// team task (0 = none, 1 = offence, 2 = defence)
;668:	teamTask = atoi(Info_ValueForKey(userinfo, "teamtask"));
ADDRLP4 4
ARGP4
ADDRGP4 $306
ARGP4
ADDRLP4 1264
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1264
INDIRP4
ARGP4
ADDRLP4 1268
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1216
ADDRLP4 1268
INDIRI4
ASGNI4
line 670
;669:	// team Leader (1 = leader, 0 is normal player)
;670:	teamLeader = client->sess.teamLeader;
ADDRLP4 1220
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRI4
ASGNI4
line 673
;671:
;672:	// colors
;673:	Q_strncpyz( c1, Info_ValueForKey( userinfo, "color1" ), sizeof( c1 ) );
ADDRLP4 4
ARGP4
ADDRGP4 $307
ARGP4
ADDRLP4 1272
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1164
ARGP4
ADDRLP4 1272
INDIRP4
ARGP4
CNSTI4 8
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 674
;674:	Q_strncpyz( c2, Info_ValueForKey( userinfo, "color2" ), sizeof( c2 ) );
ADDRLP4 4
ARGP4
ADDRGP4 $308
ARGP4
ADDRLP4 1276
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1172
ARGP4
ADDRLP4 1276
INDIRP4
ARGP4
CNSTI4 8
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 678
;675:
;676:	// send over a subset of the userinfo keys so other clients can
;677:	// print scoreboards, display models, and play custom sounds
;678:	if ( ent->r.svFlags & SVF_BOT ) {
ADDRLP4 1032
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $309
line 679
;679:		s = va("n\\%s\\t\\%i\\model\\%s\\hmodel\\%s\\c1\\%s\\c2\\%s\\hc\\%i\\w\\%i\\l\\%i\\skill\\%s\\tt\\%d\\tl\\%d",
ADDRLP4 4
ARGP4
ADDRGP4 $312
ARGP4
ADDRLP4 1280
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $311
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ARGI4
ADDRLP4 1036
ARGP4
ADDRLP4 1100
ARGP4
ADDRLP4 1164
ARGP4
ADDRLP4 1172
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRI4
ARGI4
ADDRLP4 1280
INDIRP4
ARGP4
ADDRLP4 1216
INDIRI4
ARGI4
ADDRLP4 1220
INDIRI4
ARGI4
ADDRLP4 1288
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1288
INDIRP4
ASGNP4
line 683
;680:			client->pers.netname, client->sess.sessionTeam, model, headModel, c1, c2,
;681:			client->pers.maxHealth, client->sess.wins, client->sess.losses,
;682:			Info_ValueForKey( userinfo, "skill" ), teamTask, teamLeader );
;683:	} else {
ADDRGP4 $310
JUMPV
LABELV $309
line 684
;684:		s = va("n\\%s\\t\\%i\\model\\%s\\hmodel\\%s\\c1\\%s\\c2\\%s\\hc\\%i\\w\\%i\\l\\%i\\tt\\%d\\tl\\%d",
ADDRGP4 $313
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ARGI4
ADDRLP4 1036
ARGP4
ADDRLP4 1100
ARGP4
ADDRLP4 1164
ARGP4
ADDRLP4 1172
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRI4
ARGI4
ADDRLP4 1216
INDIRI4
ARGI4
ADDRLP4 1220
INDIRI4
ARGI4
ADDRLP4 1284
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1284
INDIRP4
ASGNP4
line 687
;685:			client->pers.netname, client->sess.sessionTeam, model, headModel, c1, c2, 
;686:			client->pers.maxHealth, client->sess.wins, client->sess.losses, teamTask, teamLeader );
;687:	}
LABELV $310
line 689
;688:
;689:	trap_SetConfigstring( CS_PLAYERS+clientNum, s );
ADDRFP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 692
;690:
;691:	// this is not the userinfo, more like the configstring actually
;692:	G_LogPrintf( "ClientUserinfoChanged: %i %s\n", clientNum, s );
ADDRGP4 $314
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 694
;693:
;694:	return qtrue;
CNSTI4 1
RETI4
LABELV $263
endproc ClientUserinfoChanged 1292 52
export ClientConnect
proc ClientConnect 1072 12
line 718
;695:}
;696:
;697:
;698:/*
;699:===========
;700:ClientConnect
;701:
;702:Called when a player begins connecting to the server.
;703:Called again for every map change or tournement restart.
;704:
;705:The session information will be valid after exit.
;706:
;707:Return NULL if the client should be allowed, otherwise return
;708:a string with the reason for denial.
;709:
;710:Otherwise, the client will be sent the current gamestate
;711:and will eventually get to ClientBegin.
;712:
;713:firstTime will be qtrue the very first time a client connects
;714:to the server machine, but qfalse on map changes and tournement
;715:restarts.
;716:============
;717:*/
;718:const char *ClientConnect( int clientNum, qboolean firstTime, qboolean isBot ) {
line 726
;719:	char		*value;
;720://	char		*areabits;
;721:	gclient_t	*client;
;722:	char		userinfo[MAX_INFO_STRING];
;723:	gentity_t	*ent;
;724:	qboolean	isAdmin;
;725:
;726:	if ( clientNum >= level.maxclients ) {
ADDRFP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $316
line 727
;727:		return "Bad connection slot.";
ADDRGP4 $319
RETP4
ADDRGP4 $315
JUMPV
LABELV $316
line 730
;728:	}
;729:
;730:	ent = &g_entities[ clientNum ];
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 731
;731:	ent->client = level.clients + clientNum;
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
ADDRFP4 0
INDIRI4
CNSTI4 1636
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 733
;732:
;733:	if ( firstTime ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $320
line 736
;734:		// cleanup previous data manually
;735:		// because client may silently (re)connect without ClientDisconnect in case of crash for example
;736:		if ( level.clients[ clientNum ].pers.connected != CON_DISCONNECTED )
ADDRFP4 0
INDIRI4
CNSTI4 1636
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
EQI4 $322
line 737
;737:			ClientDisconnect( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 ClientDisconnect
CALLV
pop
LABELV $322
line 740
;738:
;739:		// remove old entity from the world
;740:		trap_UnlinkEntity( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 741
;741:		ent->r.contents = 0;
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 742
;742:		ent->s.eType = ET_INVISIBLE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 10
ASGNI4
line 743
;743:		ent->s.eFlags = 0;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
line 744
;744:		ent->s.modelindex = 0;
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
CNSTI4 0
ASGNI4
line 745
;745:		ent->s.clientNum = clientNum;
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 746
;746:		ent->s.number = clientNum;
ADDRLP4 0
INDIRP4
ADDRFP4 0
INDIRI4
ASGNI4
line 747
;747:		ent->takedamage = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
CNSTI4 0
ASGNI4
line 748
;748:	}
LABELV $320
line 750
;749:
;750:	ent->r.svFlags &= ~SVF_BOT;
ADDRLP4 1040
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 1040
INDIRP4
ADDRLP4 1040
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 751
;751:	ent->inuse = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 753
;752:
;753:	trap_GetUserinfo( clientNum, userinfo, sizeof( userinfo ) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 759
;754:
;755: 	// IP filtering
;756: 	// https://zerowing.idsoftware.com/bugzilla/show_bug.cgi?id=500
;757: 	// recommanding PB based IP / GUID banning, the builtin system is pretty limited
;758: 	// check to see if they are on the banned IP list
;759:	value = Info_ValueForKey( userinfo, "ip" );
ADDRLP4 12
ARGP4
ADDRGP4 $271
ARGP4
ADDRLP4 1044
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1044
INDIRP4
ASGNP4
line 761
;760:
;761:	if ( !strcmp( value, "localhost" ) && !isBot )
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $274
ARGP4
ADDRLP4 1048
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $324
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $324
line 762
;762:		isAdmin = qtrue;
ADDRLP4 1036
CNSTI4 1
ASGNI4
ADDRGP4 $325
JUMPV
LABELV $324
line 764
;763:	else
;764:		isAdmin = qfalse;
ADDRLP4 1036
CNSTI4 0
ASGNI4
LABELV $325
line 766
;765:
;766:	if ( !isAdmin && G_FilterPacket( value ) ) {
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $326
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1052
ADDRGP4 G_FilterPacket
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
EQI4 $326
line 767
;767:		return "You are banned from this server.";
ADDRGP4 $328
RETP4
ADDRGP4 $315
JUMPV
LABELV $326
line 773
;768:	}
;769:
;770:	// we don't check password for bots and local client
;771:	// NOTE: local client <-> "ip" "localhost"
;772:	// this means this client is not running in our current process
;773:	if ( !isBot && !isAdmin ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $329
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $329
line 775
;774:		// check for a password
;775:		if ( g_password.string[0] && Q_stricmp( g_password.string, "none" ) ) {
ADDRGP4 g_password+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $331
ADDRGP4 g_password+16
ARGP4
ADDRGP4 $335
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
EQI4 $331
line 776
;776:			value = Info_ValueForKey( userinfo, "password" );
ADDRLP4 12
ARGP4
ADDRGP4 $336
ARGP4
ADDRLP4 1060
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1060
INDIRP4
ASGNP4
line 777
;777:			if ( strcmp( g_password.string, value ) )
ADDRGP4 g_password+16
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1064
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
EQI4 $337
line 778
;778:				return "Invalid password";
ADDRGP4 $340
RETP4
ADDRGP4 $315
JUMPV
LABELV $337
line 779
;779:		}
LABELV $331
line 780
;780:	}
LABELV $329
line 783
;781:
;782:	// they can connect
;783:	ent->client = level.clients + clientNum;
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
ADDRFP4 0
INDIRI4
CNSTI4 1636
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 784
;784:	client = ent->client;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 787
;785:
;786://	areabits = client->areabits;
;787:	memset( client, 0, sizeof( *client ) );
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1636
ARGI4
ADDRGP4 memset
CALLP4
pop
line 789
;788:
;789:	client->ps.clientNum = clientNum;
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 791
;790:
;791:	if ( !ClientUserinfoChanged( clientNum ) ) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1056
ADDRGP4 ClientUserinfoChanged
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $341
line 792
;792:		return ban_reason;
ADDRGP4 ban_reason
RETP4
ADDRGP4 $315
JUMPV
LABELV $341
line 796
;793:	}
;794:
;795:	// read or initialize the session data
;796:	if ( firstTime || level.newSession ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $346
ADDRGP4 level+68
INDIRI4
CNSTI4 0
EQI4 $343
LABELV $346
line 797
;797:		value = Info_ValueForKey( userinfo, "team" );
ADDRLP4 12
ARGP4
ADDRGP4 $347
ARGP4
ADDRLP4 1060
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1060
INDIRP4
ASGNP4
line 798
;798:		G_InitSessionData( client, value, isBot );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 G_InitSessionData
CALLV
pop
line 799
;799:		G_WriteClientSessionData( client );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_WriteClientSessionData
CALLV
pop
line 800
;800:	}
LABELV $343
line 802
;801:
;802:	G_ReadClientSessionData( client );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_ReadClientSessionData
CALLV
pop
line 804
;803:
;804:	if( isBot ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $348
line 805
;805:		if( !G_BotConnect( clientNum, !firstTime ) ) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $353
ADDRLP4 1060
CNSTI4 1
ASGNI4
ADDRGP4 $354
JUMPV
LABELV $353
ADDRLP4 1060
CNSTI4 0
ASGNI4
LABELV $354
ADDRLP4 1060
INDIRI4
ARGI4
ADDRLP4 1064
ADDRGP4 G_BotConnect
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $350
line 806
;806:			return "BotConnectfailed";
ADDRGP4 $355
RETP4
ADDRGP4 $315
JUMPV
LABELV $350
line 808
;807:		}
;808:		ent->r.svFlags |= SVF_BOT;
ADDRLP4 1068
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 1068
INDIRP4
ADDRLP4 1068
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 809
;809:		client->sess.spectatorClient = clientNum;
ADDRLP4 4
INDIRP4
CNSTI4 636
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 810
;810:	}
LABELV $348
line 811
;811:	ent->inuse = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 1
ASGNI4
line 814
;812:
;813:	// get and distribute relevant paramters
;814:	G_LogPrintf( "ClientConnect: %i\n", clientNum );
ADDRGP4 $356
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 816
;815:
;816:	client->pers.connected = CON_CONNECTING;
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 1
ASGNI4
line 818
;817:
;818:	ClientUserinfoChanged( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLI4
pop
line 821
;819:
;820:	// don't do the "xxx connected" messages if they were caried over from previous level
;821:	if ( firstTime ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $357
line 822
;822:		G_BroadcastServerCommand( -1, va( "print \"%s" S_COLOR_WHITE " connected\n\"", client->pers.netname ) );
ADDRGP4 $359
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 1060
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 825
;823:
;824:		// mute all prints until completely in game
;825:		client->pers.inGame = qfalse;
ADDRLP4 4
INDIRP4
CNSTI4 620
ADDP4
CNSTI4 0
ASGNI4
line 826
;826:	} else {
ADDRGP4 $358
JUMPV
LABELV $357
line 827
;827:		client->pers.inGame = qtrue; // FIXME: read from session data?
ADDRLP4 4
INDIRP4
CNSTI4 620
ADDP4
CNSTI4 1
ASGNI4
line 828
;828:	}
LABELV $358
line 831
;829:
;830:	// count current clients and rank for scoreboard
;831:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 838
;832:
;833:	// for statistics
;834://	client->areabits = areabits;
;835://	if ( !client->areabits )
;836://		client->areabits = G_Alloc( (trap_AAS_PointReachabilityAreaIndex( NULL ) + 7) / 8 );
;837:
;838:	return NULL;
CNSTP4 0
RETP4
LABELV $315
endproc ClientConnect 1072 12
export ClientBegin
proc ClientBegin 28 12
line 851
;839:}
;840:
;841:
;842:/*
;843:===========
;844:ClientBegin
;845:
;846:called when a client has finished connecting, and is ready
;847:to be placed into the level.  This will happen every level load,
;848:and on transition between teams, but doesn't happen on respawns
;849:============
;850:*/
;851:void ClientBegin( int clientNum ) {
line 858
;852:	gentity_t	*ent;
;853:	gclient_t	*client;
;854:	gentity_t	*tent;
;855:	int			flags;
;856:	int			spawns;
;857:
;858:	ent = g_entities + clientNum;
ADDRLP4 4
ADDRFP4 0
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 860
;859:
;860:	client = level.clients + clientNum;
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 1636
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 862
;861:
;862:	if ( ent->r.linked ) {
ADDRLP4 4
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
CNSTI4 0
EQI4 $361
line 863
;863:		trap_UnlinkEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 864
;864:	}
LABELV $361
line 866
;865:
;866:	G_InitGentity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_InitGentity
CALLV
pop
line 867
;867:	ent->touch = 0;
ADDRLP4 4
INDIRP4
CNSTI4 704
ADDP4
CNSTP4 0
ASGNP4
line 868
;868:	ent->pain = 0;
ADDRLP4 4
INDIRP4
CNSTI4 712
ADDP4
CNSTP4 0
ASGNP4
line 869
;869:	ent->client = client;
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 871
;870:
;871:	if ( client->pers.connected == CON_DISCONNECTED )
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
NEI4 $363
line 872
;872:		return;
ADDRGP4 $360
JUMPV
LABELV $363
line 874
;873:
;874:	client->pers.connected = CON_CONNECTED;
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 2
ASGNI4
line 875
;875:	client->pers.enterTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 876
;876:	client->pers.teamState.state = TEAM_BEGIN;
ADDRLP4 0
INDIRP4
CNSTI4 552
ADDP4
CNSTI4 0
ASGNI4
line 877
;877:	spawns = client->ps.persistant[PERS_SPAWN_COUNT];
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
ASGNI4
line 884
;878:
;879:	// save eflags around this, because changing teams will
;880:	// cause this to happen with a valid entity, and we
;881:	// want to make sure the teleport bit is set right
;882:	// so the viewpoint doesn't interpolate through the
;883:	// world to the new position
;884:	flags = client->ps.eFlags;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ASGNI4
line 885
;885:	memset( &client->ps, 0, sizeof( client->ps ) );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 468
ARGI4
ADDRGP4 memset
CALLP4
pop
line 886
;886:	client->ps.eFlags = flags;
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 887
;887:	client->ps.persistant[PERS_SPAWN_COUNT] = spawns;
ADDRLP4 0
INDIRP4
CNSTI4 264
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 890
;888:
;889:	// locate ent at a spawn point
;890:	ClientSpawn( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 ClientSpawn
CALLV
pop
line 892
;891:
;892:	if ( !client->pers.inGame ) {
ADDRLP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
CNSTI4 0
NEI4 $366
line 893
;893:		BroadcastTeamChange( client, -1 );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 BroadcastTeamChange
CALLV
pop
line 894
;894:		if ( client->sess.sessionTeam == TEAM_RED || client->sess.sessionTeam == TEAM_BLUE )
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 1
EQI4 $370
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 2
NEI4 $368
LABELV $370
line 895
;895:			CheckTeamLeader( client->sess.sessionTeam );
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ARGI4
ADDRGP4 CheckTeamLeader
CALLV
pop
LABELV $368
line 896
;896:	}
LABELV $366
line 898
;897:
;898:	if ( client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
EQI4 $371
line 900
;899:		// send event
;900:		tent = G_TempEntity( client->ps.origin, EV_PLAYER_TELEPORT_IN );
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 42
ARGI4
ADDRLP4 20
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 20
INDIRP4
ASGNP4
line 901
;901:		tent->s.clientNum = ent->s.clientNum;
ADDRLP4 16
INDIRP4
CNSTI4 168
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 903
;902:
;903:		client->sess.spectatorTime = 0;
ADDRLP4 0
INDIRP4
CNSTI4 628
ADDP4
CNSTI4 0
ASGNI4
line 905
;904:
;905:		if ( g_gametype.integer != GT_DUEL && !client->pers.inGame ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $373
ADDRLP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
CNSTI4 0
NEI4 $373
line 906
;906:			G_BroadcastServerCommand( -1, va("print \"%s" S_COLOR_WHITE " entered the game\n\"", client->pers.netname) );
ADDRGP4 $376
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 907
;907:		}
LABELV $373
line 908
;908:	}
LABELV $371
line 910
;909:	
;910:	client->pers.inGame = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 620
ADDP4
CNSTI4 1
ASGNI4
line 912
;911:
;912:	G_LogPrintf( "ClientBegin: %i\n", clientNum );
ADDRGP4 $377
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 915
;913:
;914:	// count current clients and rank for scoreboard
;915:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 916
;916:}
LABELV $360
endproc ClientBegin 28 12
export ClientSpawn
proc ClientSpawn 1388 20
line 928
;917:
;918:
;919:/*
;920:===========
;921:ClientSpawn
;922:
;923:Called every time a client is placed fresh in the world:
;924:after the first ClientBegin, and after each respawn
;925:Initializes all non-persistant parts of playerState
;926:============
;927:*/
;928:void ClientSpawn(gentity_t *ent) {
line 945
;929:	int		index;
;930:	vec3_t	spawn_origin, spawn_angles;
;931:	gclient_t	*client;
;932:	int		i;
;933:	clientPersistant_t	saved;
;934:	clientSession_t		savedSess;
;935:	int		persistant[MAX_PERSISTANT];
;936:	gentity_t	*spawnPoint;
;937:	int		flags;
;938:	int		savedPing;
;939://	char	*savedAreaBits;
;940:	int		accuracy_hits, accuracy_shots;
;941:	int		eventSequence;
;942:	char	userinfo[MAX_INFO_STRING];
;943:	qboolean isSpectator;
;944:
;945:	index = ent - g_entities;
ADDRLP4 104
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ASGNI4
line 946
;946:	client = ent->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 948
;947:
;948:	trap_UnlinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 950
;949:
;950:	isSpectator = client->sess.sessionTeam == TEAM_SPECTATOR;
ADDRLP4 4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
NEI4 $380
ADDRLP4 1336
CNSTI4 1
ASGNI4
ADDRGP4 $381
JUMPV
LABELV $380
ADDRLP4 1336
CNSTI4 0
ASGNI4
LABELV $381
ADDRLP4 88
ADDRLP4 1336
INDIRI4
ASGNI4
line 954
;951:	// find a spawn point
;952:	// do it before setting health back up, so farthest
;953:	// ranging doesn't count this client
;954:	if ( isSpectator ) {
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $382
line 955
;955:		spawnPoint = SelectSpectatorSpawnPoint( spawn_origin, spawn_angles );
ADDRLP4 76
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 1340
ADDRGP4 SelectSpectatorSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 1340
INDIRP4
ASGNP4
line 956
;956:	} else if (GTx( g_gametype.integer, GTF_TEAMS | GTF_TEAMBASES ) ) {
ADDRGP4 $383
JUMPV
LABELV $382
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 36
MULI4
ADDRGP4 gt+20
ADDP4
INDIRI4
CNSTI4 132
BANDI4
CNSTI4 0
EQI4 $384
line 958
;957:		// all base oriented team games use the CTF spawn points
;958:		spawnPoint = SelectCTFSpawnPoint( ent, client->sess.sessionTeam, client->pers.teamState.state, spawn_origin, spawn_angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ARGI4
ADDRLP4 76
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 1344
ADDRGP4 SelectCTFSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 1344
INDIRP4
ASGNP4
line 959
;959:	} else {
ADDRGP4 $385
JUMPV
LABELV $384
LABELV $388
line 960
;960:		do {
line 962
;961:			// the first spawn should be at a good looking spot
;962:			if ( !client->pers.initialSpawn && client->pers.localClient ) {
ADDRLP4 4
INDIRP4
CNSTI4 500
ADDP4
INDIRI4
CNSTI4 0
NEI4 $391
ADDRLP4 4
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
CNSTI4 0
EQI4 $391
line 963
;963:				client->pers.initialSpawn = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1
ASGNI4
line 964
;964:				spawnPoint = SelectInitialSpawnPoint( ent, spawn_origin, spawn_angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 1344
ADDRGP4 SelectInitialSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 1344
INDIRP4
ASGNP4
line 965
;965:			} else {
ADDRGP4 $392
JUMPV
LABELV $391
line 967
;966:				// don't spawn near existing origin if possible
;967:				spawnPoint = SelectSpawnPoint( ent, client->ps.origin, spawn_origin, spawn_angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 1344
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 1344
INDIRP4
ASGNP4
line 968
;968:			}
LABELV $392
line 972
;969:
;970:			// Tim needs to prevent bots from spawning at the initial point
;971:			// on q3dm0...
;972:			if ( ( spawnPoint->flags & FL_NO_BOTS ) && ( ent->r.svFlags & SVF_BOT ) ) {
ADDRLP4 72
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $393
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $393
line 973
;973:				continue;	// try again
ADDRGP4 $389
JUMPV
LABELV $393
line 976
;974:			}
;975:			// just to be symetric, we have a nohumans option...
;976:			if ( ( spawnPoint->flags & FL_NO_HUMANS ) && !( ent->r.svFlags & SVF_BOT ) ) {
ADDRLP4 72
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $390
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $390
line 977
;977:				continue;	// try again
line 980
;978:			}
;979:
;980:			break;
LABELV $389
line 982
;981:
;982:		} while ( 1 );
ADDRGP4 $388
JUMPV
LABELV $390
line 983
;983:	}
LABELV $385
LABELV $383
line 984
;984:	client->pers.teamState.state = TEAM_ACTIVE;
ADDRLP4 4
INDIRP4
CNSTI4 552
ADDP4
CNSTI4 1
ASGNI4
line 987
;985:
;986:	// always clear the kamikaze flag
;987:	ent->s.eFlags &= ~EF_KAMIKAZE;
ADDRLP4 1340
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 1340
INDIRP4
ADDRLP4 1340
INDIRP4
INDIRI4
CNSTI4 -513
BANDI4
ASGNI4
line 991
;988:
;989:	// toggle the teleport bit so the client knows to not lerp
;990:	// and never clear the voted flag
;991:	flags = client->ps.eFlags & (EF_TELEPORT_BIT | EF_VOTED | EF_TEAMVOTED);
ADDRLP4 108
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 540676
BANDI4
ASGNI4
line 992
;992:	flags ^= EF_TELEPORT_BIT;
ADDRLP4 108
ADDRLP4 108
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 995
;993:
;994:	// unlagged
;995:	G_ResetHistory( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_ResetHistory
CALLV
pop
line 996
;996:	client->saved.leveltime = 0;
ADDRLP4 4
INDIRP4
CNSTI4 1608
ADDP4
CNSTI4 0
ASGNI4
line 1000
;997:
;998:	// clear everything but the persistant data
;999:
;1000:	saved = client->pers;
ADDRLP4 1136
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
INDIRB
ASGNB 156
line 1001
;1001:	savedSess = client->sess;
ADDRLP4 1292
ADDRLP4 4
INDIRP4
CNSTI4 624
ADDP4
INDIRB
ASGNB 28
line 1002
;1002:	savedPing = client->ps.ping;
ADDRLP4 1320
ADDRLP4 4
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
ASGNI4
line 1004
;1003://	savedAreaBits = client->areabits;
;1004:	accuracy_hits = client->accuracy_hits;
ADDRLP4 1324
ADDRLP4 4
INDIRP4
CNSTI4 724
ADDP4
INDIRI4
ASGNI4
line 1005
;1005:	accuracy_shots = client->accuracy_shots;
ADDRLP4 1328
ADDRLP4 4
INDIRP4
CNSTI4 720
ADDP4
INDIRI4
ASGNI4
line 1006
;1006:	for ( i = 0 ; i < MAX_PERSISTANT ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $397
line 1007
;1007:		persistant[i] = client->ps.persistant[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 248
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1008
;1008:	}
LABELV $398
line 1006
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $397
line 1009
;1009:	eventSequence = client->ps.eventSequence;
ADDRLP4 1332
ADDRLP4 4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
line 1011
;1010:
;1011:	Com_Memset (client, 0, sizeof(*client));
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1636
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1013
;1012:
;1013:	client->pers = saved;
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
ADDRLP4 1136
INDIRB
ASGNB 156
line 1014
;1014:	client->sess = savedSess;
ADDRLP4 4
INDIRP4
CNSTI4 624
ADDP4
ADDRLP4 1292
INDIRB
ASGNB 28
line 1015
;1015:	client->ps.ping = savedPing;
ADDRLP4 4
INDIRP4
CNSTI4 452
ADDP4
ADDRLP4 1320
INDIRI4
ASGNI4
line 1017
;1016://	client->areabits = savedAreaBits;
;1017:	client->accuracy_hits = accuracy_hits;
ADDRLP4 4
INDIRP4
CNSTI4 724
ADDP4
ADDRLP4 1324
INDIRI4
ASGNI4
line 1018
;1018:	client->accuracy_shots = accuracy_shots;
ADDRLP4 4
INDIRP4
CNSTI4 720
ADDP4
ADDRLP4 1328
INDIRI4
ASGNI4
line 1019
;1019:	client->lastkilled_client = -1;
ADDRLP4 4
INDIRP4
CNSTI4 728
ADDP4
CNSTI4 -1
ASGNI4
line 1021
;1020:
;1021:	for ( i = 0 ; i < MAX_PERSISTANT ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $401
line 1022
;1022:		client->ps.persistant[i] = persistant[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 248
ADDP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
ASGNI4
line 1023
;1023:	}
LABELV $402
line 1021
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $401
line 1024
;1024:	client->ps.eventSequence = eventSequence;
ADDRLP4 4
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 1332
INDIRI4
ASGNI4
line 1026
;1025:	// increment the spawncount so the client will detect the respawn
;1026:	client->ps.persistant[PERS_SPAWN_COUNT]++;
ADDRLP4 1344
ADDRLP4 4
INDIRP4
CNSTI4 264
ADDP4
ASGNP4
ADDRLP4 1344
INDIRP4
ADDRLP4 1344
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1027
;1027:	client->ps.persistant[PERS_TEAM] = client->sess.sessionTeam;
ADDRLP4 4
INDIRP4
CNSTI4 260
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ASGNI4
line 1029
;1028:
;1029:	client->airOutTime = level.time + 12000;
ADDRLP4 4
INDIRP4
CNSTI4 756
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 12000
ADDI4
ASGNI4
line 1031
;1030:
;1031:	trap_GetUserinfo( index, userinfo, sizeof(userinfo) );
ADDRLP4 104
INDIRI4
ARGI4
ADDRLP4 112
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 1033
;1032:	// set max health
;1033:	client->pers.maxHealth = atoi( Info_ValueForKey( userinfo, "handicap" ) );
ADDRLP4 112
ARGP4
ADDRGP4 $292
ARGP4
ADDRLP4 1352
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1352
INDIRP4
ARGP4
ADDRLP4 1356
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 544
ADDP4
ADDRLP4 1356
INDIRI4
ASGNI4
line 1034
;1034:	if ( client->pers.maxHealth < 1 || client->pers.maxHealth > HEALTH_SOFT_LIMIT ) {
ADDRLP4 4
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 1
LTI4 $408
ADDRLP4 4
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 100
LEI4 $406
LABELV $408
line 1035
;1035:		client->pers.maxHealth = HEALTH_SOFT_LIMIT;
ADDRLP4 4
INDIRP4
CNSTI4 544
ADDP4
CNSTI4 100
ASGNI4
line 1036
;1036:	}
LABELV $406
line 1038
;1037:	// clear entity values
;1038:	client->ps.stats[STAT_MAX_HEALTH] = client->pers.maxHealth;
ADDRLP4 4
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
ASGNI4
line 1039
;1039:	client->ps.eFlags = flags;
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 108
INDIRI4
ASGNI4
line 1041
;1040:
;1041:	ent->s.groundEntityNum = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 1023
ASGNI4
line 1042
;1042:	ent->client = &level.clients[index];
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ADDRLP4 104
INDIRI4
CNSTI4 1636
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1043
;1043:	ent->inuse = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 1
ASGNI4
line 1044
;1044:	ent->classname = "player";
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $409
ASGNP4
line 1045
;1045:	if ( isSpectator ) {
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $410
line 1046
;1046:		ent->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
CNSTI4 0
ASGNI4
line 1047
;1047:		ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 1048
;1048:		ent->clipmask = MASK_PLAYERSOLID & ~CONTENTS_BODY;
ADDRFP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 65537
ASGNI4
line 1049
;1049:		client->ps.pm_type = PM_SPECTATOR;
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 2
ASGNI4
line 1050
;1050:	} else {
ADDRGP4 $411
JUMPV
LABELV $410
line 1051
;1051:		ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
CNSTI4 1
ASGNI4
line 1052
;1052:		ent->r.contents = CONTENTS_BODY;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 33554432
ASGNI4
line 1053
;1053:		ent->clipmask = MASK_PLAYERSOLID;
ADDRFP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 33619969
ASGNI4
line 1054
;1054:	}
LABELV $411
line 1055
;1055:	ent->die = player_die;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 player_die
ASGNP4
line 1056
;1056:	ent->waterlevel = 0;
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
CNSTI4 0
ASGNI4
line 1057
;1057:	ent->watertype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
CNSTI4 0
ASGNI4
line 1058
;1058:	ent->flags = 0;
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
CNSTI4 0
ASGNI4
line 1060
;1059:	
;1060:	VectorCopy (playerMins, ent->r.mins);
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRGP4 playerMins
INDIRB
ASGNB 12
line 1061
;1061:	VectorCopy (playerMaxs, ent->r.maxs);
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
ADDRGP4 playerMaxs
INDIRB
ASGNB 12
line 1063
;1062:
;1063:	client->ps.clientNum = index;
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 104
INDIRI4
ASGNI4
line 1065
;1064:
;1065:	client->ps.stats[STAT_WEAPONS] = ( 1 << WP_MACHINEGUN );
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 4
ASGNI4
line 1066
;1066:	if ( GTx( g_gametype.integer, GTF_TEAMS | GTF_TDM ) ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 36
MULI4
ADDRGP4 gt+20
ADDP4
INDIRI4
CNSTI4 640
BANDI4
CNSTI4 0
EQI4 $412
line 1067
;1067:		client->ps.ammo[WP_MACHINEGUN] = 50;
ADDRLP4 4
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 50
ASGNI4
line 1068
;1068:	} else {
ADDRGP4 $413
JUMPV
LABELV $412
line 1069
;1069:		client->ps.ammo[WP_MACHINEGUN] = 100;
ADDRLP4 4
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 100
ASGNI4
line 1070
;1070:	}
LABELV $413
line 1072
;1071:
;1072:	client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_GAUNTLET );
ADDRLP4 1368
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
ASGNP4
ADDRLP4 1368
INDIRP4
ADDRLP4 1368
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1073
;1073:	client->ps.ammo[WP_GAUNTLET] = -1;
ADDRLP4 4
INDIRP4
CNSTI4 380
ADDP4
CNSTI4 -1
ASGNI4
line 1074
;1074:	client->ps.ammo[WP_GRAPPLING_HOOK] = -1;
ADDRLP4 4
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 -1
ASGNI4
line 1077
;1075:
;1076:	// health will count down towards max_health
;1077:	ent->health = client->ps.stats[STAT_HEALTH] = client->ps.stats[STAT_MAX_HEALTH] + 25;
ADDRLP4 1376
ADDRLP4 4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 25
ADDI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 1376
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 1376
INDIRI4
ASGNI4
line 1079
;1078:
;1079:	G_SetOrigin( ent, spawn_origin );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 76
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1080
;1080:	VectorCopy( spawn_origin, client->ps.origin );
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 76
INDIRB
ASGNB 12
line 1083
;1081:
;1082:	// the respawned flag will be cleared after the attack and jump keys come up
;1083:	client->ps.pm_flags |= PMF_RESPAWNED;
ADDRLP4 1380
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1380
INDIRP4
ADDRLP4 1380
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 1085
;1084:
;1085:	trap_GetUsercmd( client - level.clients, &ent->client->pers.cmd );
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1636
DIVI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 472
ADDP4
ARGP4
ADDRGP4 trap_GetUsercmd
CALLV
pop
line 1086
;1086:	SetClientViewAngle( ent, spawn_angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 92
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 1089
;1087:
;1088:	// entity should be unlinked before calling G_KillBox()	
;1089:	if ( !isSpectator )
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $416
line 1090
;1090:		G_KillBox( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_KillBox
CALLV
pop
LABELV $416
line 1093
;1091:
;1092:	// force the base weapon up
;1093:	client->ps.weapon = WP_MACHINEGUN;
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 2
ASGNI4
line 1094
;1094:	client->ps.weaponstate = WEAPON_READY;
ADDRLP4 4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 1097
;1095:
;1096:	// don't allow full run speed for a bit
;1097:	client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
ADDRLP4 1384
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1384
INDIRP4
ADDRLP4 1384
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 1098
;1098:	client->ps.pm_time = 100;
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 100
ASGNI4
line 1100
;1099:
;1100:	client->respawnTime = level.time;
ADDRLP4 4
INDIRP4
CNSTI4 740
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1101
;1101:	client->inactivityTime = level.time + g_inactivity.integer * 1000;
ADDRLP4 4
INDIRP4
CNSTI4 744
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRGP4 g_inactivity+12
INDIRI4
CNSTI4 1000
MULI4
ADDI4
ASGNI4
line 1102
;1102:	client->latched_buttons = 0;
ADDRLP4 4
INDIRP4
CNSTI4 672
ADDP4
CNSTI4 0
ASGNI4
line 1105
;1103:
;1104:	// set default animations
;1105:	client->ps.torsoAnim = TORSO_STAND;
ADDRLP4 4
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 11
ASGNI4
line 1106
;1106:	client->ps.legsAnim = LEGS_IDLE;
ADDRLP4 4
INDIRP4
CNSTI4 76
ADDP4
CNSTI4 22
ASGNI4
line 1108
;1107:
;1108:	if ( level.intermissiontime ) {
ADDRGP4 level+7604
INDIRI4
CNSTI4 0
EQI4 $421
line 1109
;1109:		MoveClientToIntermission( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MoveClientToIntermission
CALLV
pop
line 1110
;1110:	} else {
ADDRGP4 $422
JUMPV
LABELV $421
line 1111
;1111:		if ( !isSpectator )
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $424
line 1112
;1112:			trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
LABELV $424
line 1114
;1113:		// fire the targets of the spawn point
;1114:		G_UseTargets( spawnPoint, ent );
ADDRLP4 72
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 1118
;1115:
;1116:		// select the highest weapon number available, after any
;1117:		// spawn given items have fired
;1118:		client->ps.weapon = 1;
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 1
ASGNI4
line 1119
;1119:		for ( i = WP_NUM_WEAPONS - 1 ; i > 0 ; i-- ) {
ADDRLP4 0
CNSTI4 13
ASGNI4
LABELV $426
line 1120
;1120:			if ( client->ps.stats[STAT_WEAPONS] & ( 1 << i ) ) {
ADDRLP4 4
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
EQI4 $430
line 1121
;1121:				client->ps.weapon = i;
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1122
;1122:				break;
ADDRGP4 $428
JUMPV
LABELV $430
line 1124
;1123:			}
;1124:		}
LABELV $427
line 1119
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $426
LABELV $428
line 1125
;1125:	}
LABELV $422
line 1129
;1126:
;1127:	// run a client frame to drop exactly to the floor,
;1128:	// initialize animations and other things
;1129:	client->ps.commandTime = level.time - 100;
ADDRLP4 4
INDIRP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
SUBI4
ASGNI4
line 1130
;1130:	client->pers.cmd.serverTime = level.time;
ADDRLP4 4
INDIRP4
CNSTI4 472
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1131
;1131:	ClientThink( ent-g_entities );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRGP4 ClientThink
CALLV
pop
line 1133
;1132:
;1133:	BG_PlayerStateToEntityState( &client->ps, &ent->s, qtrue );
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 1134
;1134:	VectorCopy( client->ps.origin, ent->r.currentOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1137
;1135:
;1136:	// run the presend to set anything else
;1137:	ClientEndFrame( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientEndFrame
CALLV
pop
line 1140
;1138:
;1139:	// clear entity state values
;1140:	BG_PlayerStateToEntityState( &client->ps, &ent->s, qtrue );
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 1141
;1141:}
LABELV $378
endproc ClientSpawn 1388 20
export ClientDisconnect
proc ClientDisconnect 24 8
line 1156
;1142:
;1143:
;1144:/*
;1145:===========
;1146:ClientDisconnect
;1147:
;1148:Called when a player drops from the server.
;1149:Will not be called between levels.
;1150:
;1151:This should NOT be called directly by any game logic,
;1152:call trap_DropClient(), which will call this and do
;1153:server system housekeeping.
;1154:============
;1155:*/
;1156:void ClientDisconnect( int clientNum ) {
line 1163
;1157:	gentity_t	*ent;
;1158:	gentity_t	*tent;
;1159:	int			i;
;1160:
;1161:	// cleanup if we are kicking a bot that
;1162:	// hasn't spawned yet
;1163:	G_RemoveQueuedBotBegin( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_RemoveQueuedBotBegin
CALLV
pop
line 1165
;1164:
;1165:	ent = g_entities + clientNum;
ADDRLP4 4
ADDRFP4 0
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1166
;1166:	if (!ent->client || ent->client->pers.connected == CON_DISCONNECTED) {
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $437
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
NEI4 $435
LABELV $437
line 1167
;1167:		return;
ADDRGP4 $434
JUMPV
LABELV $435
line 1171
;1168:	}
;1169:
;1170:	// stop any following clients
;1171:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $441
JUMPV
LABELV $438
line 1172
;1172:		if ( level.clients[i].sess.sessionTeam == TEAM_SPECTATOR
ADDRLP4 20
ADDRGP4 level
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 1636
MULI4
ADDRLP4 20
INDIRP4
ADDP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
NEI4 $443
ADDRLP4 0
INDIRI4
CNSTI4 1636
MULI4
ADDRLP4 20
INDIRP4
ADDP4
CNSTI4 632
ADDP4
INDIRI4
CNSTI4 2
NEI4 $443
ADDRLP4 0
INDIRI4
CNSTI4 1636
MULI4
ADDRLP4 20
INDIRP4
ADDP4
CNSTI4 636
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $443
line 1174
;1173:			&& level.clients[i].sess.spectatorState == SPECTATOR_FOLLOW
;1174:			&& level.clients[i].sess.spectatorClient == clientNum ) {
line 1175
;1175:			StopFollowing( &g_entities[i], qtrue );
ADDRLP4 0
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 StopFollowing
CALLV
pop
line 1176
;1176:		}
LABELV $443
line 1177
;1177:	}
LABELV $439
line 1171
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $441
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $438
line 1180
;1178:
;1179:	// send effect if they were completely connected
;1180:	if ( ent->client->pers.connected == CON_CONNECTED 
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
NEI4 $445
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
EQI4 $445
line 1181
;1181:		&& ent->client->sess.sessionTeam != TEAM_SPECTATOR ) {
line 1182
;1182:		tent = G_TempEntity( ent->client->ps.origin, EV_PLAYER_TELEPORT_OUT );
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 43
ARGI4
ADDRLP4 20
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
ASGNP4
line 1183
;1183:		tent->s.clientNum = ent->s.clientNum;
ADDRLP4 8
INDIRP4
CNSTI4 168
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 1187
;1184:
;1185:		// They don't get to take powerups with them!
;1186:		// Especially important for stuff like CTF flags
;1187:		TossClientItems( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 TossClientItems
CALLV
pop
line 1188
;1188:		TossClientPersistantPowerups( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 TossClientPersistantPowerups
CALLV
pop
line 1189
;1189:		if( g_gametype.integer == GT_HARVESTER ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
NEI4 $447
line 1190
;1190:			TossClientCubes( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 TossClientCubes
CALLV
pop
line 1191
;1191:		}
LABELV $447
line 1193
;1192:
;1193:	}
LABELV $445
line 1195
;1194:
;1195:	G_RevertVote( ent->client );
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_RevertVote
CALLV
pop
line 1197
;1196:
;1197:	G_LogPrintf( "ClientDisconnect: %i\n", clientNum );
ADDRGP4 $450
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1200
;1198:
;1199:	// if we are playing in tourney mode and losing, give a win to the other player
;1200:	if ( (g_gametype.integer == GT_DUEL )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $451
ADDRGP4 level+7604
INDIRI4
CNSTI4 0
NEI4 $451
ADDRGP4 level+16
INDIRI4
CNSTI4 0
NEI4 $451
ADDRGP4 level+88+4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $451
line 1202
;1201:		&& !level.intermissiontime
;1202:		&& !level.warmupTime && level.sortedClients[1] == clientNum ) {
line 1203
;1203:		level.clients[ level.sortedClients[0] ].sess.wins++;
ADDRLP4 20
ADDRGP4 level+88
INDIRI4
CNSTI4 1636
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 640
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1204
;1204:		ClientUserinfoChanged( level.sortedClients[0] );
ADDRGP4 level+88
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLI4
pop
line 1205
;1205:	}
LABELV $451
line 1207
;1206:
;1207:	trap_UnlinkEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 1208
;1208:	ent->s.modelindex = 0;
ADDRLP4 4
INDIRP4
CNSTI4 160
ADDP4
CNSTI4 0
ASGNI4
line 1209
;1209:	ent->inuse = qfalse;
ADDRLP4 4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 1210
;1210:	ent->classname = "disconnected";
ADDRLP4 4
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $460
ASGNP4
line 1211
;1211:	ent->client->pers.connected = CON_DISCONNECTED;
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 0
ASGNI4
line 1212
;1212:	ent->client->ps.persistant[PERS_TEAM] = TEAM_FREE;
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 260
ADDP4
CNSTI4 0
ASGNI4
line 1213
;1213:	ent->client->sess.sessionTeam = TEAM_FREE;
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 0
ASGNI4
line 1215
;1214:
;1215:	trap_SetConfigstring( CS_PLAYERS + clientNum, "" );
ADDRFP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRGP4 $461
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1217
;1216:
;1217:	G_ClearClientSessionData( ent->client );
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_ClearClientSessionData
CALLV
pop
line 1219
;1218:
;1219:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 1221
;1220:
;1221:	if ( ent->r.svFlags & SVF_BOT ) {
ADDRLP4 4
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $462
line 1222
;1222:		BotAIShutdownClient( clientNum, qfalse );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 BotAIShutdownClient
CALLI4
pop
line 1223
;1223:	}
LABELV $462
line 1224
;1224:}
LABELV $434
endproc ClientDisconnect 24 8
bss
align 1
LABELV ban_reason
skip 256
import svf_self_portal2
import trap_SnapVector
import trap_GeneticParentsAndChildSelection
import trap_BotResetWeaponState
import trap_BotFreeWeaponState
import trap_BotAllocWeaponState
import trap_BotLoadWeaponWeights
import trap_BotGetWeaponInfo
import trap_BotChooseBestFightWeapon
import trap_BotAddAvoidSpot
import trap_BotInitMoveState
import trap_BotFreeMoveState
import trap_BotAllocMoveState
import trap_BotPredictVisiblePosition
import trap_BotMovementViewTarget
import trap_BotReachabilityArea
import trap_BotResetLastAvoidReach
import trap_BotResetAvoidReach
import trap_BotMoveInDirection
import trap_BotMoveToGoal
import trap_BotResetMoveState
import trap_BotFreeGoalState
import trap_BotAllocGoalState
import trap_BotMutateGoalFuzzyLogic
import trap_BotSaveGoalFuzzyLogic
import trap_BotInterbreedGoalFuzzyLogic
import trap_BotFreeItemWeights
import trap_BotLoadItemWeights
import trap_BotUpdateEntityItems
import trap_BotInitLevelItems
import trap_BotSetAvoidGoalTime
import trap_BotAvoidGoalTime
import trap_BotGetLevelItemGoal
import trap_BotGetMapLocationGoal
import trap_BotGetNextCampSpotGoal
import trap_BotItemGoalInVisButNotVisible
import trap_BotTouchingGoal
import trap_BotChooseNBGItem
import trap_BotChooseLTGItem
import trap_BotGetSecondGoal
import trap_BotGetTopGoal
import trap_BotGoalName
import trap_BotDumpGoalStack
import trap_BotDumpAvoidGoals
import trap_BotEmptyGoalStack
import trap_BotPopGoal
import trap_BotPushGoal
import trap_BotResetAvoidGoals
import trap_BotRemoveFromAvoidGoals
import trap_BotResetGoalState
import trap_BotSetChatName
import trap_BotSetChatGender
import trap_BotLoadChatFile
import trap_BotReplaceSynonyms
import trap_UnifyWhiteSpaces
import trap_BotMatchVariable
import trap_BotFindMatch
import trap_StringContains
import trap_BotGetChatMessage
import trap_BotEnterChat
import trap_BotChatLength
import trap_BotReplyChat
import trap_BotNumInitialChats
import trap_BotInitialChat
import trap_BotNumConsoleMessages
import trap_BotNextConsoleMessage
import trap_BotRemoveConsoleMessage
import trap_BotQueueConsoleMessage
import trap_BotFreeChatState
import trap_BotAllocChatState
import trap_Characteristic_String
import trap_Characteristic_BInteger
import trap_Characteristic_Integer
import trap_Characteristic_BFloat
import trap_Characteristic_Float
import trap_BotFreeCharacter
import trap_BotLoadCharacter
import trap_EA_ResetInput
import trap_EA_GetInput
import trap_EA_EndRegular
import trap_EA_View
import trap_EA_Move
import trap_EA_DelayedJump
import trap_EA_Jump
import trap_EA_SelectWeapon
import trap_EA_MoveRight
import trap_EA_MoveLeft
import trap_EA_MoveBack
import trap_EA_MoveForward
import trap_EA_MoveDown
import trap_EA_MoveUp
import trap_EA_Crouch
import trap_EA_Respawn
import trap_EA_Use
import trap_EA_Attack
import trap_EA_Talk
import trap_EA_Gesture
import trap_EA_Action
import trap_EA_Command
import trap_EA_SayTeam
import trap_EA_Say
import trap_AAS_PredictClientMovement
import trap_AAS_Swimming
import trap_AAS_AlternativeRouteGoals
import trap_AAS_PredictRoute
import trap_AAS_EnableRoutingArea
import trap_AAS_AreaTravelTimeToGoalArea
import trap_AAS_AreaReachability
import trap_AAS_IntForBSPEpairKey
import trap_AAS_FloatForBSPEpairKey
import trap_AAS_VectorForBSPEpairKey
import trap_AAS_ValueForBSPEpairKey
import trap_AAS_NextBSPEntity
import trap_AAS_PointContents
import trap_AAS_TraceAreas
import trap_AAS_PointReachabilityAreaIndex
import trap_AAS_PointAreaNum
import trap_AAS_Time
import trap_AAS_PresenceTypeBoundingBox
import trap_AAS_Initialized
import trap_AAS_EntityInfo
import trap_AAS_AreaInfo
import trap_AAS_BBoxAreas
import trap_BotUserCommand
import trap_BotGetServerCommand
import trap_BotGetSnapshotEntity
import trap_BotLibTest
import trap_BotLibUpdateEntity
import trap_BotLibLoadMap
import trap_BotLibStartFrame
import trap_BotLibDefine
import trap_BotLibVarGet
import trap_BotLibVarSet
import trap_BotLibShutdown
import trap_BotLibSetup
import trap_DebugPolygonDelete
import trap_DebugPolygonCreate
import trap_GetEntityToken
import trap_GetUsercmd
import trap_BotFreeClient
import trap_BotAllocateClient
import trap_EntityContact
import trap_EntitiesInBox
import trap_UnlinkEntity
import trap_LinkEntity
import trap_AreasConnected
import trap_AdjustAreaPortalState
import trap_InPVSIgnorePortals
import trap_InPVS
import trap_PointContents
import trap_TraceCapsule
import trap_Trace
import trap_SetBrushModel
import trap_GetServerinfo
import trap_SetUserinfo
import trap_GetUserinfo
import trap_GetConfigstring
import trap_SetConfigstring
import trap_SendServerCommand
import trap_DropClient
import trap_LocateGameData
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_VariableIntegerValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_SendConsoleCommand
import trap_FS_Seek
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_RealTime
import trap_Milliseconds
import trap_Error
import trap_Print
import g_proxMineTimeout
import g_singlePlayer
import g_enableBreath
import g_enableDust
import g_predictPVS
import g_unlagged
import g_rotation
import pmove_msec
import pmove_fixed
import g_smoothClients
import g_blueteam
import g_redteam
import g_cubeTimeout
import g_obeliskRespawnDelay
import g_obeliskRegenAmount
import g_obeliskRegenPeriod
import g_obeliskHealth
import g_filterBan
import g_banIPs
import g_teamForceBalance
import g_autoJoin
import g_allowVote
import g_blood
import g_warmup
import g_motd
import g_synchronousClients
import g_weaponTeamRespawn
import g_weaponRespawn
import g_debugDamage
import g_debugAlloc
import g_debugMove
import g_inactivity
import g_forcerespawn
import g_quadfactor
import g_knockback
import g_speed
import g_gravity
import g_needpass
import g_password
import g_friendlyFire
import g_capturelimit
import g_timelimit
import g_fraglimit
import g_dmflags
import g_restarted
import g_maxGameClients
import g_cheats
import g_dedicated
import sv_fps
import g_mapname
import g_gametype
import g_entities
import level
import AddTeamScore
import Pickup_Team
import CheckTeamStatus
import TeamplayInfoMessage
import Team_GetLocationMsg
import Team_GetLocation
import SelectCTFSpawnPoint
import Team_FreeEntity
import Team_ReturnFlag
import Team_InitGame
import Team_CheckHurtCarrier
import Team_FragBonuses
import Team_DroppedFlagThink
import TeamColorString
import OtherTeamName
import TeamName
import OtherTeam
import G_MapExist
import G_LoadMap
import ParseMapRotation
import BotTestAAS
import BotAIStartFrame
import BotAIShutdownClient
import BotAISetupClient
import BotAILoadMap
import BotAIShutdown
import BotAISetup
import BotInterbreedEndMatch
import Svcmd_BotList_f
import Svcmd_AddBot_f
import G_BotConnect
import G_RemoveQueuedBotBegin
import G_CheckBotSpawn
import G_GetBotInfoByName
import G_GetBotInfoByNumber
import G_InitBots
import G_PredictPlayerMove
import G_UnTimeShiftClient
import G_UndoTimeShiftFor
import G_DoTimeShiftFor
import G_UnTimeShiftAllClients
import G_TimeShiftAllClients
import G_StoreHistory
import G_ResetHistory
import Svcmd_AbortPodium_f
import SpawnModelsOnVictoryPads
import UpdateTournamentInfo
import G_ClearClientSessionData
import G_WriteClientSessionData
import G_ReadClientSessionData
import G_InitSessionData
import G_WriteSessionData
import G_InitWorldSession
import Svcmd_GameMem_f
import G_InitMemory
import G_Alloc
import Team_ResetFlags
import CheckObeliskAttack
import Team_CheckDroppedItem
import OnSameTeam
import G_RunClient
import ClientEndFrame
import ClientThink
import ClientCommand
import G_BroadcastServerCommand
import G_Error
import G_Printf
import G_LogPrintf
import G_RunThink
import CheckTeamLeader
import SetLeader
import FindIntermissionPoint
import MoveClientToIntermission
import DeathmatchScoreboardMessage
import G_StartKamikaze
import FireWeapon
import G_FilterPacket
import G_ProcessIPBans
import ConsoleCommand
import CalculateRanks
import AddScore
import player_die
import BeginIntermission
import Weapon_HookThink
import Weapon_HookFree
import CheckGauntletAttack
import SnapVectorTowards
import CalcMuzzlePoint
import LogAccuracyHit
import DropPortalDestination
import DropPortalSource
import TeleportPlayer
import trigger_teleporter_touch
import Touch_DoorTrigger
import G_RunMover
import fire_prox
import fire_nail
import fire_grapple
import fire_bfg
import fire_rocket
import fire_grenade
import fire_plasma
import fire_blaster
import G_RunMissile
import TossClientCubes
import TossClientPersistantPowerups
import TossClientItems
import body_die
import G_InvulnerabilityEffect
import G_RadiusDamage
import G_Damage
import CanDamage
import BuildShaderStateConfig
import AddRemap
import G_SetOrigin
import G_AddEvent
import G_AddPredictableEvent
import vectoyaw
import vtos
import tv
import G_TouchSolids
import G_TouchTriggers
import G_EntitiesFree
import G_FreeEntity
import G_Sound
import G_TempEntity
import G_Spawn
import G_InitGentity
import G_SetMovedir
import G_UseTargets
import G_PickTarget
import G_Find
import G_KillBox
import G_TeamCommand
import G_SoundIndex
import G_ModelIndex
import SaveRegisteredItems
import RegisterItem
import ClearRegisteredItems
import Touch_Item
import ArmorIndex
import Think_Weapon
import FinishSpawningItem
import G_SpawnItem
import SetRespawn
import LaunchItem
import Drop_Item
import PrecacheItem
import UseHoldableItem
import SpawnTime
import RespawnItem
import G_RunItem
import G_CheckTeamItems
import G_RevertVote
import Cmd_FollowCycle_f
import SetTeam
import BroadcastTeamChange
import StopFollowing
import Cmd_Score_f
import G_NewString
import G_SpawnEntitiesFromString
import G_SpawnVector
import G_SpawnInt
import G_SpawnFloat
import G_SpawnString
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
LABELV $461
byte 1 0
align 1
LABELV $460
byte 1 100
byte 1 105
byte 1 115
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $450
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 68
byte 1 105
byte 1 115
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $409
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $377
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 66
byte 1 101
byte 1 103
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $376
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $359
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $356
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 67
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $355
byte 1 66
byte 1 111
byte 1 116
byte 1 67
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $347
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $340
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $336
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $335
byte 1 110
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $328
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 46
byte 1 0
align 1
LABELV $319
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 46
byte 1 0
align 1
LABELV $314
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 85
byte 1 115
byte 1 101
byte 1 114
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 67
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $313
byte 1 110
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 116
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 104
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 99
byte 1 49
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 99
byte 1 50
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 104
byte 1 99
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 119
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 108
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 116
byte 1 116
byte 1 92
byte 1 37
byte 1 100
byte 1 92
byte 1 116
byte 1 108
byte 1 92
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $312
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $311
byte 1 110
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 116
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 104
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 99
byte 1 49
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 99
byte 1 50
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 104
byte 1 99
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 119
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 108
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 116
byte 1 116
byte 1 92
byte 1 37
byte 1 100
byte 1 92
byte 1 116
byte 1 108
byte 1 92
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $308
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 50
byte 1 0
align 1
LABELV $307
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 49
byte 1 0
align 1
LABELV $306
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $305
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $304
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $300
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $292
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $289
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $284
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 98
byte 1 111
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $279
byte 1 85
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $278
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $275
byte 1 99
byte 1 103
byte 1 95
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $274
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 104
byte 1 111
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $271
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $266
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 0
align 1
LABELV $181
byte 1 107
byte 1 97
byte 1 109
byte 1 105
byte 1 107
byte 1 97
byte 1 122
byte 1 101
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $154
byte 1 98
byte 1 111
byte 1 100
byte 1 121
byte 1 113
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $127
byte 1 67
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 102
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $64
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 95
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $60
byte 1 110
byte 1 111
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $57
byte 1 48
byte 1 0
align 1
LABELV $56
byte 1 110
byte 1 111
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 0
