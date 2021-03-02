bss
align 1
LABELV $74
skip 64
export CG_PlaceString
code
proc CG_PlaceString 12 20
file "..\..\..\..\code\cgame\cg_event.c"
line 16
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_event.c -- handle entity events at snapshot or playerstate transitions
;4:
;5:#include "cg_local.h"
;6:
;7://==========================================================================
;8:
;9:/*
;10:===================
;11:CG_PlaceString
;12:
;13:Also called by scoreboard drawing
;14:===================
;15:*/
;16:const char	*CG_PlaceString( int rank ) {
line 20
;17:	static char	str[64];
;18:	char	*s, *t;
;19:
;20:	if ( rank & RANK_TIED_FLAG ) {
ADDRFP4 0
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $75
line 21
;21:		rank &= ~RANK_TIED_FLAG;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 22
;22:		t = "Tied for ";
ADDRLP4 4
ADDRGP4 $77
ASGNP4
line 23
;23:	} else {
ADDRGP4 $76
JUMPV
LABELV $75
line 24
;24:		t = "";
ADDRLP4 4
ADDRGP4 $78
ASGNP4
line 25
;25:	}
LABELV $76
line 27
;26:
;27:	if ( rank == 1 ) {
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $79
line 28
;28:		s = S_COLOR_BLUE "1st" S_COLOR_WHITE;		// draw in blue
ADDRLP4 0
ADDRGP4 $81
ASGNP4
line 29
;29:	} else if ( rank == 2 ) {
ADDRGP4 $80
JUMPV
LABELV $79
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $82
line 30
;30:		s = S_COLOR_RED "2nd" S_COLOR_WHITE;		// draw in red
ADDRLP4 0
ADDRGP4 $84
ASGNP4
line 31
;31:	} else if ( rank == 3 ) {
ADDRGP4 $83
JUMPV
LABELV $82
ADDRFP4 0
INDIRI4
CNSTI4 3
NEI4 $85
line 32
;32:		s = S_COLOR_YELLOW "3rd" S_COLOR_WHITE;		// draw in yellow
ADDRLP4 0
ADDRGP4 $87
ASGNP4
line 33
;33:	} else if ( rank == 11 ) {
ADDRGP4 $86
JUMPV
LABELV $85
ADDRFP4 0
INDIRI4
CNSTI4 11
NEI4 $88
line 34
;34:		s = "11th";
ADDRLP4 0
ADDRGP4 $90
ASGNP4
line 35
;35:	} else if ( rank == 12 ) {
ADDRGP4 $89
JUMPV
LABELV $88
ADDRFP4 0
INDIRI4
CNSTI4 12
NEI4 $91
line 36
;36:		s = "12th";
ADDRLP4 0
ADDRGP4 $93
ASGNP4
line 37
;37:	} else if ( rank == 13 ) {
ADDRGP4 $92
JUMPV
LABELV $91
ADDRFP4 0
INDIRI4
CNSTI4 13
NEI4 $94
line 38
;38:		s = "13th";
ADDRLP4 0
ADDRGP4 $96
ASGNP4
line 39
;39:	} else if ( rank % 10 == 1 ) {
ADDRGP4 $95
JUMPV
LABELV $94
ADDRFP4 0
INDIRI4
CNSTI4 10
MODI4
CNSTI4 1
NEI4 $97
line 40
;40:		s = va("%ist", rank);
ADDRGP4 $99
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 41
;41:	} else if ( rank % 10 == 2 ) {
ADDRGP4 $98
JUMPV
LABELV $97
ADDRFP4 0
INDIRI4
CNSTI4 10
MODI4
CNSTI4 2
NEI4 $100
line 42
;42:		s = va("%ind", rank);
ADDRGP4 $102
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 43
;43:	} else if ( rank % 10 == 3 ) {
ADDRGP4 $101
JUMPV
LABELV $100
ADDRFP4 0
INDIRI4
CNSTI4 10
MODI4
CNSTI4 3
NEI4 $103
line 44
;44:		s = va("%ird", rank);
ADDRGP4 $105
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 45
;45:	} else {
ADDRGP4 $104
JUMPV
LABELV $103
line 46
;46:		s = va("%ith", rank);
ADDRGP4 $106
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 47
;47:	}
LABELV $104
LABELV $101
LABELV $98
LABELV $95
LABELV $92
LABELV $89
LABELV $86
LABELV $83
LABELV $80
line 49
;48:
;49:	Com_sprintf( str, sizeof( str ), "%s%s", t, s );
ADDRGP4 $74
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $107
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 50
;50:	return str;
ADDRGP4 $74
RETP4
LABELV $73
endproc CG_PlaceString 12 20
proc CG_Obituary 136 20
line 59
;51:}
;52:
;53:
;54:/*
;55:=============
;56:CG_Obituary
;57:=============
;58:*/
;59:static void CG_Obituary( entityState_t *ent ) {
line 72
;60:	int			mod;
;61:	int			target, attacker;
;62:	char		*message;
;63:	char		*message2;
;64:	const char	*targetInfo;
;65:	const char	*attackerInfo;
;66:	char		targetName[32];
;67:	char		attackerName[32];
;68:	gender_t	gender;
;69:	clientInfo_t	*ci;
;70:	qboolean	following;
;71:
;72:	target = ent->otherEntityNum;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 73
;73:	attacker = ent->otherEntityNum2;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 74
;74:	mod = ent->eventParm;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 76
;75:
;76:	if ( target < 0 || target >= MAX_CLIENTS ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $111
ADDRLP4 4
INDIRI4
CNSTI4 64
LTI4 $109
LABELV $111
line 77
;77:		CG_Error( "CG_Obituary: target out of range" );
ADDRGP4 $112
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 78
;78:	}
LABELV $109
line 79
;79:	ci = &cgs.clientinfo[target];
ADDRLP4 92
ADDRLP4 4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 81
;80:
;81:	if ( attacker < 0 || attacker >= MAX_CLIENTS ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $116
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $114
LABELV $116
line 82
;82:		attacker = ENTITYNUM_WORLD;
ADDRLP4 0
CNSTI4 1022
ASGNI4
line 83
;83:		attackerInfo = NULL;
ADDRLP4 84
CNSTP4 0
ASGNP4
line 84
;84:	} else {
ADDRGP4 $115
JUMPV
LABELV $114
line 85
;85:		attackerInfo = CG_ConfigString( CS_PLAYERS + attacker );
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 112
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 84
ADDRLP4 112
INDIRP4
ASGNP4
line 86
;86:	}
LABELV $115
line 88
;87:
;88:	targetInfo = CG_ConfigString( CS_PLAYERS + target );
ADDRLP4 4
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 112
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 48
ADDRLP4 112
INDIRP4
ASGNP4
line 89
;89:	if ( !targetInfo[0] )
ADDRLP4 48
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $117
line 90
;90:	{
line 91
;91:		return;
ADDRGP4 $108
JUMPV
LABELV $117
line 93
;92:	}
;93:	Q_strncpyz( targetName, Info_ValueForKey( targetInfo, "n" ), sizeof(targetName) - 2);
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 $119
ARGP4
ADDRLP4 116
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ARGP4
ADDRLP4 116
INDIRP4
ARGP4
CNSTI4 30
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 94
;94:	strcat( targetName, S_COLOR_WHITE );
ADDRLP4 8
ARGP4
ADDRGP4 $120
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 96
;95:
;96:	following = cg.snap->ps.pm_flags & PMF_FOLLOW;
ADDRLP4 96
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
ASGNI4
line 98
;97:
;98:	message2 = "";
ADDRLP4 88
ADDRGP4 $78
ASGNP4
line 102
;99:
;100:	// check for single client messages
;101:
;102:	switch( mod ) {
ADDRLP4 44
INDIRI4
CNSTI4 14
LTI4 $122
ADDRLP4 44
INDIRI4
CNSTI4 22
GTI4 $122
ADDRLP4 44
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $140-56
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $140
address $130
address $132
address $134
address $128
address $122
address $126
address $124
address $136
address $138
code
LABELV $124
line 104
;103:	case MOD_SUICIDE:
;104:		message = "suicides";
ADDRLP4 40
ADDRGP4 $125
ASGNP4
line 105
;105:		break;
ADDRGP4 $123
JUMPV
LABELV $126
line 107
;106:	case MOD_FALLING:
;107:		message = "cratered";
ADDRLP4 40
ADDRGP4 $127
ASGNP4
line 108
;108:		break;
ADDRGP4 $123
JUMPV
LABELV $128
line 110
;109:	case MOD_CRUSH:
;110:		message = "was squished";
ADDRLP4 40
ADDRGP4 $129
ASGNP4
line 111
;111:		break;
ADDRGP4 $123
JUMPV
LABELV $130
line 113
;112:	case MOD_WATER:
;113:		message = "sank like a rock";
ADDRLP4 40
ADDRGP4 $131
ASGNP4
line 114
;114:		break;
ADDRGP4 $123
JUMPV
LABELV $132
line 116
;115:	case MOD_SLIME:
;116:		message = "melted";
ADDRLP4 40
ADDRGP4 $133
ASGNP4
line 117
;117:		break;
ADDRGP4 $123
JUMPV
LABELV $134
line 119
;118:	case MOD_LAVA:
;119:		message = "does a back flip into the lava";
ADDRLP4 40
ADDRGP4 $135
ASGNP4
line 120
;120:		break;
ADDRGP4 $123
JUMPV
LABELV $136
line 122
;121:	case MOD_TARGET_LASER:
;122:		message = "saw the light";
ADDRLP4 40
ADDRGP4 $137
ASGNP4
line 123
;123:		break;
ADDRGP4 $123
JUMPV
LABELV $138
line 125
;124:	case MOD_TRIGGER_HURT:
;125:		message = "was in the wrong place";
ADDRLP4 40
ADDRGP4 $139
ASGNP4
line 126
;126:		break;
ADDRGP4 $123
JUMPV
LABELV $122
line 128
;127:	default:
;128:		message = NULL;
ADDRLP4 40
CNSTP4 0
ASGNP4
line 129
;129:		break;
LABELV $123
line 132
;130:	}
;131:
;132:	if (attacker == target) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $142
line 133
;133:		gender = ci->gender;
ADDRLP4 100
ADDRLP4 92
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
ASGNI4
line 134
;134:		switch (mod) {
ADDRLP4 44
INDIRI4
CNSTI4 13
EQI4 $172
ADDRLP4 44
INDIRI4
CNSTI4 13
GTI4 $190
LABELV $189
ADDRLP4 44
INDIRI4
CNSTI4 5
EQI4 $148
ADDRLP4 44
INDIRI4
CNSTI4 7
EQI4 $156
ADDRLP4 44
INDIRI4
CNSTI4 9
EQI4 $164
ADDRGP4 $144
JUMPV
LABELV $190
ADDRLP4 44
INDIRI4
CNSTI4 25
EQI4 $174
ADDRLP4 44
INDIRI4
CNSTI4 26
EQI4 $146
ADDRGP4 $144
JUMPV
LABELV $146
line 136
;135:		case MOD_KAMIKAZE:
;136:			message = "goes out with a bang";
ADDRLP4 40
ADDRGP4 $147
ASGNP4
line 137
;137:			break;
ADDRGP4 $145
JUMPV
LABELV $148
line 139
;138:		case MOD_GRENADE_SPLASH:
;139:			if ( gender == GENDER_FEMALE )
ADDRLP4 100
INDIRI4
CNSTI4 1
NEI4 $149
line 140
;140:				message = "tripped on her own grenade";
ADDRLP4 40
ADDRGP4 $151
ASGNP4
ADDRGP4 $145
JUMPV
LABELV $149
line 141
;141:			else if ( gender == GENDER_NEUTER )
ADDRLP4 100
INDIRI4
CNSTI4 2
NEI4 $152
line 142
;142:				message = "tripped on its own grenade";
ADDRLP4 40
ADDRGP4 $154
ASGNP4
ADDRGP4 $145
JUMPV
LABELV $152
line 144
;143:			else
;144:				message = "tripped on his own grenade";
ADDRLP4 40
ADDRGP4 $155
ASGNP4
line 145
;145:			break;
ADDRGP4 $145
JUMPV
LABELV $156
line 147
;146:		case MOD_ROCKET_SPLASH:
;147:			if ( gender == GENDER_FEMALE )
ADDRLP4 100
INDIRI4
CNSTI4 1
NEI4 $157
line 148
;148:				message = "blew herself up";
ADDRLP4 40
ADDRGP4 $159
ASGNP4
ADDRGP4 $145
JUMPV
LABELV $157
line 149
;149:			else if ( gender == GENDER_NEUTER )
ADDRLP4 100
INDIRI4
CNSTI4 2
NEI4 $160
line 150
;150:				message = "blew itself up";
ADDRLP4 40
ADDRGP4 $162
ASGNP4
ADDRGP4 $145
JUMPV
LABELV $160
line 152
;151:			else
;152:				message = "blew himself up";
ADDRLP4 40
ADDRGP4 $163
ASGNP4
line 153
;153:			break;
ADDRGP4 $145
JUMPV
LABELV $164
line 155
;154:		case MOD_PLASMA_SPLASH:
;155:			if ( gender == GENDER_FEMALE )
ADDRLP4 100
INDIRI4
CNSTI4 1
NEI4 $165
line 156
;156:				message = "melted herself";
ADDRLP4 40
ADDRGP4 $167
ASGNP4
ADDRGP4 $145
JUMPV
LABELV $165
line 157
;157:			else if ( gender == GENDER_NEUTER )
ADDRLP4 100
INDIRI4
CNSTI4 2
NEI4 $168
line 158
;158:				message = "melted itself";
ADDRLP4 40
ADDRGP4 $170
ASGNP4
ADDRGP4 $145
JUMPV
LABELV $168
line 160
;159:			else
;160:				message = "melted himself";
ADDRLP4 40
ADDRGP4 $171
ASGNP4
line 161
;161:			break;
ADDRGP4 $145
JUMPV
LABELV $172
line 163
;162:		case MOD_BFG_SPLASH:
;163:			message = "should have used a smaller gun";
ADDRLP4 40
ADDRGP4 $173
ASGNP4
line 164
;164:			break;
ADDRGP4 $145
JUMPV
LABELV $174
line 166
;165:		case MOD_PROXIMITY_MINE:
;166:			if( gender == GENDER_FEMALE ) {
ADDRLP4 100
INDIRI4
CNSTI4 1
NEI4 $175
line 167
;167:				message = "found her prox mine";
ADDRLP4 40
ADDRGP4 $177
ASGNP4
line 168
;168:			} else if ( gender == GENDER_NEUTER ) {
ADDRGP4 $145
JUMPV
LABELV $175
ADDRLP4 100
INDIRI4
CNSTI4 2
NEI4 $178
line 169
;169:				message = "found its prox mine";
ADDRLP4 40
ADDRGP4 $180
ASGNP4
line 170
;170:			} else {
ADDRGP4 $145
JUMPV
LABELV $178
line 171
;171:				message = "found his prox mine";
ADDRLP4 40
ADDRGP4 $181
ASGNP4
line 172
;172:			}
line 173
;173:			break;
ADDRGP4 $145
JUMPV
LABELV $144
line 175
;174:		default:
;175:			if ( gender == GENDER_FEMALE )
ADDRLP4 100
INDIRI4
CNSTI4 1
NEI4 $182
line 176
;176:				message = "killed herself";
ADDRLP4 40
ADDRGP4 $184
ASGNP4
ADDRGP4 $145
JUMPV
LABELV $182
line 177
;177:			else if ( gender == GENDER_NEUTER )
ADDRLP4 100
INDIRI4
CNSTI4 2
NEI4 $185
line 178
;178:				message = "killed itself";
ADDRLP4 40
ADDRGP4 $187
ASGNP4
ADDRGP4 $145
JUMPV
LABELV $185
line 180
;179:			else
;180:				message = "killed himself";
ADDRLP4 40
ADDRGP4 $188
ASGNP4
line 181
;181:			break;
LABELV $145
line 183
;182:		}
;183:	}
LABELV $142
line 185
;184:
;185:	if ( message ) {
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $191
line 186
;186:		CG_Printf( "%s %s.\n", targetName, message);
ADDRGP4 $193
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 188
;187:		// switch to first killer if not following anyone
;188:		if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR && cg_followKiller.integer ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $108
ADDRGP4 cg_followKiller+12
INDIRI4
CNSTI4 0
EQI4 $108
line 189
;189:			if ( !cg.followTime && attacker != cg.snap->ps.clientNum && attacker < MAX_CLIENTS ) {
ADDRGP4 cg+157016
INDIRI4
CNSTI4 0
NEI4 $108
ADDRLP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
EQI4 $108
ADDRLP4 0
INDIRI4
CNSTI4 64
GEI4 $108
line 190
;190:				cg.followClient = attacker;
ADDRGP4 cg+157020
ADDRLP4 0
INDIRI4
ASGNI4
line 191
;191:				cg.followTime = cg.time;
ADDRGP4 cg+157016
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 192
;192:			}
line 193
;193:		}
line 194
;194:		return;
ADDRGP4 $108
JUMPV
LABELV $191
line 198
;195:	}
;196:
;197:	// check for kill messages from the current clientNum
;198:	if ( attacker == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $205
line 201
;199:		char	*s;
;200:
;201:		if ( cgs.gametype < GT_TDM ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
GEI4 $208
line 202
;202:			s = va("You fragged %s\n%s place with %i", targetName, 
ADDRGP4 cg+36
INDIRP4
CNSTI4 300
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 128
ADDRGP4 CG_PlaceString
CALLP4
ASGNP4
ADDRGP4 $211
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ARGI4
ADDRLP4 132
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 124
ADDRLP4 132
INDIRP4
ASGNP4
line 205
;203:				CG_PlaceString( cg.snap->ps.persistant[PERS_RANK] + 1 ),
;204:				cg.snap->ps.persistant[PERS_SCORE] );
;205:		} else {
ADDRGP4 $209
JUMPV
LABELV $208
line 206
;206:			s = va("You fragged %s", targetName );
ADDRGP4 $214
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 128
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 124
ADDRLP4 128
INDIRP4
ASGNP4
line 207
;207:		}
LABELV $209
line 208
;208:		CG_CenterPrint( s, SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
ADDRLP4 124
INDIRP4
ARGP4
CNSTI4 144
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 211
;209:
;210:		// print the text message as well
;211:	}
LABELV $205
line 214
;212:
;213:	// check for double client messages
;214:	if ( !attackerInfo ) {
ADDRLP4 84
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $215
line 215
;215:		attacker = ENTITYNUM_WORLD;
ADDRLP4 0
CNSTI4 1022
ASGNI4
line 216
;216:		strcpy( attackerName, "noname" );
ADDRLP4 52
ARGP4
ADDRGP4 $217
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 217
;217:	} else {
ADDRGP4 $216
JUMPV
LABELV $215
line 218
;218:		Q_strncpyz( attackerName, Info_ValueForKey( attackerInfo, "n" ), sizeof(attackerName) - 2);
ADDRLP4 84
INDIRP4
ARGP4
ADDRGP4 $119
ARGP4
ADDRLP4 124
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 52
ARGP4
ADDRLP4 124
INDIRP4
ARGP4
CNSTI4 30
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 219
;219:		Q_CleanStr( attackerName );
ADDRLP4 52
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 220
;220:		strcat( attackerName, S_COLOR_WHITE );
ADDRLP4 52
ARGP4
ADDRGP4 $120
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 222
;221:		// check for kill messages about the current clientNum
;222:		if ( target == cg.snap->ps.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $218
line 223
;223:			Q_strncpyz( cg.killerName, attackerName, sizeof( cg.killerName ) );
ADDRGP4 cg+115368
ARGP4
ADDRLP4 52
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 225
;224:			// follow killer
;225:			if ( following && cg_followKiller.integer ) {
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $223
ADDRGP4 cg_followKiller+12
INDIRI4
CNSTI4 0
EQI4 $223
line 226
;226:				if ( !cg.followTime && attacker != cg.snap->ps.clientNum && attacker < MAX_CLIENTS ) {
ADDRGP4 cg+157016
INDIRI4
CNSTI4 0
NEI4 $226
ADDRLP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
EQI4 $226
ADDRLP4 0
INDIRI4
CNSTI4 64
GEI4 $226
line 227
;227:					cg.followClient = attacker;
ADDRGP4 cg+157020
ADDRLP4 0
INDIRI4
ASGNI4
line 228
;228:					cg.followTime = cg.time + 1100;
ADDRGP4 cg+157016
ADDRGP4 cg+107604
INDIRI4
CNSTI4 1100
ADDI4
ASGNI4
line 229
;229:				}
LABELV $226
line 230
;230:			}
LABELV $223
line 231
;231:		}
LABELV $218
line 232
;232:	}
LABELV $216
line 234
;233:
;234:	if ( attacker != ENTITYNUM_WORLD ) {
ADDRLP4 0
INDIRI4
CNSTI4 1022
EQI4 $233
line 235
;235:		switch (mod) {
ADDRLP4 44
INDIRI4
CNSTI4 1
LTI4 $235
ADDRLP4 44
INDIRI4
CNSTI4 28
GTI4 $235
ADDRLP4 44
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $283-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $283
address $243
address $239
address $241
address $245
address $248
address $251
address $253
address $255
address $258
address $259
address $261
address $263
address $263
address $235
address $235
address $235
address $235
address $279
address $235
address $235
address $235
address $235
address $266
address $268
address $271
address $274
address $277
address $237
code
LABELV $237
line 237
;236:		case MOD_GRAPPLE:
;237:			message = "was caught by";
ADDRLP4 40
ADDRGP4 $238
ASGNP4
line 238
;238:			break;
ADDRGP4 $236
JUMPV
LABELV $239
line 240
;239:		case MOD_GAUNTLET:
;240:			message = "was pummeled by";
ADDRLP4 40
ADDRGP4 $240
ASGNP4
line 241
;241:			break;
ADDRGP4 $236
JUMPV
LABELV $241
line 243
;242:		case MOD_MACHINEGUN:
;243:			message = "was machinegunned by";
ADDRLP4 40
ADDRGP4 $242
ASGNP4
line 244
;244:			break;
ADDRGP4 $236
JUMPV
LABELV $243
line 246
;245:		case MOD_SHOTGUN:
;246:			message = "was gunned down by";
ADDRLP4 40
ADDRGP4 $244
ASGNP4
line 247
;247:			break;
ADDRGP4 $236
JUMPV
LABELV $245
line 249
;248:		case MOD_GRENADE:
;249:			message = "ate";
ADDRLP4 40
ADDRGP4 $246
ASGNP4
line 250
;250:			message2 = "'s grenade";
ADDRLP4 88
ADDRGP4 $247
ASGNP4
line 251
;251:			break;
ADDRGP4 $236
JUMPV
LABELV $248
line 253
;252:		case MOD_GRENADE_SPLASH:
;253:			message = "was shredded by";
ADDRLP4 40
ADDRGP4 $249
ASGNP4
line 254
;254:			message2 = "'s shrapnel";
ADDRLP4 88
ADDRGP4 $250
ASGNP4
line 255
;255:			break;
ADDRGP4 $236
JUMPV
LABELV $251
line 257
;256:		case MOD_ROCKET:
;257:			message = "ate";
ADDRLP4 40
ADDRGP4 $246
ASGNP4
line 258
;258:			message2 = "'s rocket";
ADDRLP4 88
ADDRGP4 $252
ASGNP4
line 259
;259:			break;
ADDRGP4 $236
JUMPV
LABELV $253
line 261
;260:		case MOD_ROCKET_SPLASH:
;261:			message = "almost dodged";
ADDRLP4 40
ADDRGP4 $254
ASGNP4
line 262
;262:			message2 = "'s rocket";
ADDRLP4 88
ADDRGP4 $252
ASGNP4
line 263
;263:			break;
ADDRGP4 $236
JUMPV
LABELV $255
line 265
;264:		case MOD_PLASMA:
;265:			message = "was melted by";
ADDRLP4 40
ADDRGP4 $256
ASGNP4
line 266
;266:			message2 = "'s plasmagun";
ADDRLP4 88
ADDRGP4 $257
ASGNP4
line 267
;267:			break;
ADDRGP4 $236
JUMPV
LABELV $258
line 269
;268:		case MOD_PLASMA_SPLASH:
;269:			message = "was melted by";
ADDRLP4 40
ADDRGP4 $256
ASGNP4
line 270
;270:			message2 = "'s plasmagun";
ADDRLP4 88
ADDRGP4 $257
ASGNP4
line 271
;271:			break;
ADDRGP4 $236
JUMPV
LABELV $259
line 273
;272:		case MOD_RAILGUN:
;273:			message = "was railed by";
ADDRLP4 40
ADDRGP4 $260
ASGNP4
line 274
;274:			break;
ADDRGP4 $236
JUMPV
LABELV $261
line 276
;275:		case MOD_LIGHTNING:
;276:			message = "was electrocuted by";
ADDRLP4 40
ADDRGP4 $262
ASGNP4
line 277
;277:			break;
ADDRGP4 $236
JUMPV
LABELV $263
line 280
;278:		case MOD_BFG:
;279:		case MOD_BFG_SPLASH:
;280:			message = "was blasted by";
ADDRLP4 40
ADDRGP4 $264
ASGNP4
line 281
;281:			message2 = "'s BFG";
ADDRLP4 88
ADDRGP4 $265
ASGNP4
line 282
;282:			break;
ADDRGP4 $236
JUMPV
LABELV $266
line 284
;283:		case MOD_NAIL:
;284:			message = "was nailed by";
ADDRLP4 40
ADDRGP4 $267
ASGNP4
line 285
;285:			break;
ADDRGP4 $236
JUMPV
LABELV $268
line 287
;286:		case MOD_CHAINGUN:
;287:			message = "got lead poisoning from";
ADDRLP4 40
ADDRGP4 $269
ASGNP4
line 288
;288:			message2 = "'s Chaingun";
ADDRLP4 88
ADDRGP4 $270
ASGNP4
line 289
;289:			break;
ADDRGP4 $236
JUMPV
LABELV $271
line 291
;290:		case MOD_PROXIMITY_MINE:
;291:			message = "was too close to";
ADDRLP4 40
ADDRGP4 $272
ASGNP4
line 292
;292:			message2 = "'s Prox Mine";
ADDRLP4 88
ADDRGP4 $273
ASGNP4
line 293
;293:			break;
ADDRGP4 $236
JUMPV
LABELV $274
line 295
;294:		case MOD_KAMIKAZE:
;295:			message = "falls to";
ADDRLP4 40
ADDRGP4 $275
ASGNP4
line 296
;296:			message2 = "'s Kamikaze blast";
ADDRLP4 88
ADDRGP4 $276
ASGNP4
line 297
;297:			break;
ADDRGP4 $236
JUMPV
LABELV $277
line 299
;298:		case MOD_JUICED:
;299:			message = "was juiced by";
ADDRLP4 40
ADDRGP4 $278
ASGNP4
line 300
;300:			break;
ADDRGP4 $236
JUMPV
LABELV $279
line 302
;301:		case MOD_TELEFRAG:
;302:			message = "tried to invade";
ADDRLP4 40
ADDRGP4 $280
ASGNP4
line 303
;303:			message2 = "'s personal space";
ADDRLP4 88
ADDRGP4 $281
ASGNP4
line 304
;304:			break;
ADDRGP4 $236
JUMPV
LABELV $235
line 306
;305:		default:
;306:			message = "was killed by";
ADDRLP4 40
ADDRGP4 $282
ASGNP4
line 307
;307:			break;
LABELV $236
line 310
;308:		}
;309:
;310:		if ( message ) {
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $285
line 311
;311:			CG_Printf( "%s %s %s%s\n", targetName, message, attackerName, message2 );
ADDRGP4 $287
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 313
;312:			// switch to first killer if not following anyone
;313:			if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR && cg_followKiller.integer ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $108
ADDRGP4 cg_followKiller+12
INDIRI4
CNSTI4 0
EQI4 $108
line 314
;314:				if ( !cg.followTime && attacker != cg.snap->ps.clientNum && attacker < MAX_CLIENTS ) {
ADDRGP4 cg+157016
INDIRI4
CNSTI4 0
NEI4 $108
ADDRLP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
EQI4 $108
ADDRLP4 0
INDIRI4
CNSTI4 64
GEI4 $108
line 315
;315:					cg.followClient = attacker;
ADDRGP4 cg+157020
ADDRLP4 0
INDIRI4
ASGNI4
line 316
;316:					cg.followTime = cg.time;
ADDRGP4 cg+157016
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 317
;317:				}
line 318
;318:			}
line 319
;319:			return;
ADDRGP4 $108
JUMPV
LABELV $285
line 321
;320:		}
;321:	}
LABELV $233
line 324
;322:
;323:	// we don't know what it was
;324:	CG_Printf( "%s "S_COLOR_STRIP"died.\n", targetName );
ADDRGP4 $299
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 325
;325:}
LABELV $108
endproc CG_Obituary 136 20
proc CG_UseItem 32 16
line 334
;326://==========================================================================
;327:
;328:
;329:/*
;330:===============
;331:CG_UseItem
;332:===============
;333:*/
;334:static void CG_UseItem( centity_t *cent ) {
line 340
;335:	clientInfo_t *ci;
;336:	int			itemNum, clientNum;
;337:	gitem_t		*item;
;338:	entityState_t *es;
;339:
;340:	es = &cent->currentState;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 342
;341:	
;342:	itemNum = (es->event & ~EV_EVENT_BITS) - EV_USE_ITEM0;
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
CNSTI4 24
SUBI4
ASGNI4
line 343
;343:	if ( itemNum < 0 || itemNum > HI_NUM_HOLDABLE ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $303
ADDRLP4 0
INDIRI4
CNSTI4 6
LEI4 $301
LABELV $303
line 344
;344:		itemNum = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 345
;345:	}
LABELV $301
line 348
;346:
;347:	// print a message if the local player
;348:	if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 4
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $304
line 349
;349:		if ( !itemNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $307
line 350
;350:			CG_CenterPrint( "No item to use", SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
ADDRGP4 $309
ARGP4
CNSTI4 144
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 351
;351:		} else {
ADDRGP4 $308
JUMPV
LABELV $307
line 352
;352:			item = BG_FindItemForHoldable( itemNum );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 BG_FindItemForHoldable
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 24
INDIRP4
ASGNP4
line 353
;353:			CG_CenterPrint( va("Use %s", item->pickup_name), SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
ADDRGP4 $310
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 28
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
CNSTI4 144
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 354
;354:		}
LABELV $308
line 355
;355:	}
LABELV $304
line 357
;356:
;357:	switch ( itemNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $311
ADDRLP4 0
INDIRI4
CNSTI4 5
GTI4 $311
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $329
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $329
address $313
address $312
address $317
address $312
address $312
address $326
code
LABELV $311
LABELV $313
line 360
;358:	default:
;359:	case HI_NONE:
;360:		trap_S_StartSound (NULL, es->number, CHAN_BODY, cgs.media.useNothingSound );
CNSTP4 0
ARGP4
ADDRLP4 4
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+148692+620
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 361
;361:		break;
ADDRGP4 $312
JUMPV
line 364
;362:
;363:	case HI_TELEPORTER:
;364:		break;
LABELV $317
line 367
;365:
;366:	case HI_MEDKIT:
;367:		clientNum = cent->currentState.clientNum;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 368
;368:		if ( clientNum >= 0 && clientNum < MAX_CLIENTS ) {
ADDRLP4 28
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $318
ADDRLP4 28
INDIRI4
CNSTI4 64
GEI4 $318
line 369
;369:			ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 16
ADDRLP4 12
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 370
;370:			ci->medkitUsageTime = cg.time;
ADDRLP4 16
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 371
;371:		}
LABELV $318
line 372
;372:		trap_S_StartSound (NULL, es->number, CHAN_BODY, cgs.media.medkitSound );
CNSTP4 0
ARGP4
ADDRLP4 4
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+148692+1012
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 373
;373:		break;
ADDRGP4 $312
JUMPV
line 376
;374:
;375:	case HI_KAMIKAZE:
;376:		break;
line 379
;377:
;378:	case HI_PORTAL:
;379:		break;
LABELV $326
line 381
;380:	case HI_INVULNERABILITY:
;381:		trap_S_StartSound (NULL, es->number, CHAN_BODY, cgs.media.useInvulnerabilitySound );
CNSTP4 0
ARGP4
ADDRLP4 4
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+148692+816
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 382
;382:		break;
LABELV $312
line 384
;383:	}
;384:}
LABELV $300
endproc CG_UseItem 32 16
data
align 4
LABELV $331
byte 4 -1
code
proc CG_ItemPickup 4 0
line 394
;385:
;386:
;387:/*
;388:================
;389:CG_ItemPickup
;390:
;391:A new item was picked up this frame
;392:================
;393:*/
;394:static void CG_ItemPickup( int itemNum ) {
line 397
;395:	static int oldItem = -1;
;396:	
;397:	cg.itemPickup = itemNum;
ADDRGP4 cg+125768
ADDRFP4 0
INDIRI4
ASGNI4
line 398
;398:	cg.itemPickupTime = cg.time;
ADDRGP4 cg+125776
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 399
;399:	cg.itemPickupBlendTime = cg.time;
ADDRGP4 cg+125780
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 401
;400:
;401:	if ( oldItem != itemNum )
ADDRGP4 $331
INDIRI4
ADDRFP4 0
INDIRI4
EQI4 $337
line 402
;402:		cg.itemPickupCount = 1;
ADDRGP4 cg+125772
CNSTI4 1
ASGNI4
ADDRGP4 $338
JUMPV
LABELV $337
line 404
;403:	else
;404:		cg.itemPickupCount++;
ADDRLP4 0
ADDRGP4 cg+125772
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $338
line 406
;405:
;406:	oldItem = itemNum;
ADDRGP4 $331
ADDRFP4 0
INDIRI4
ASGNI4
line 409
;407:	
;408:	// see if it should be the grabbed weapon
;409:	if ( bg_itemlist[itemNum].giType == IT_WEAPON ) {
ADDRFP4 0
INDIRI4
CNSTI4 52
MULI4
ADDRGP4 bg_itemlist+36
ADDP4
INDIRI4
CNSTI4 10
NEI4 $341
line 411
;410:		// select it immediately
;411:		if ( cg_autoswitch.integer && bg_itemlist[itemNum].giTag != WP_MACHINEGUN ) {
ADDRGP4 cg_autoswitch+12
INDIRI4
CNSTI4 0
EQI4 $344
ADDRFP4 0
INDIRI4
CNSTI4 52
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 2
EQI4 $344
line 412
;412:			cg.weaponSelectTime = cg.time;
ADDRGP4 cg+125784
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 413
;413:			cg.weaponSelect = bg_itemlist[itemNum].giTag;
ADDRGP4 cg+108956
ADDRFP4 0
INDIRI4
CNSTI4 52
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
ASGNI4
line 414
;414:		}
LABELV $344
line 415
;415:	}
LABELV $341
line 417
;416:
;417:}
LABELV $330
endproc CG_ItemPickup 4 0
export CG_WaterLevel
proc CG_WaterLevel 52 8
line 427
;418:
;419:
;420:/*
;421:================
;422:CG_WaterLevel
;423:
;424:Returns waterlevel for entity origin
;425:================
;426:*/
;427:int CG_WaterLevel(centity_t *cent) {
line 432
;428:	vec3_t point;
;429:	int contents, sample1, sample2, anim, waterlevel;
;430:	int viewheight;
;431:
;432:	anim = cent->currentState.legsAnim & ~ANIM_TOGGLEBIT;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 434
;433:
;434:	if ( anim == LEGS_WALKCR || anim == LEGS_IDLECR ) {
ADDRLP4 16
INDIRI4
CNSTI4 13
EQI4 $355
ADDRLP4 16
INDIRI4
CNSTI4 23
NEI4 $353
LABELV $355
line 435
;435:		viewheight = CROUCH_VIEWHEIGHT;
ADDRLP4 24
CNSTI4 12
ASGNI4
line 436
;436:	} else {
ADDRGP4 $354
JUMPV
LABELV $353
line 437
;437:		viewheight = DEFAULT_VIEWHEIGHT;
ADDRLP4 24
CNSTI4 26
ASGNI4
line 438
;438:	}
LABELV $354
line 443
;439:
;440:	//
;441:	// get waterlevel, accounting for ducking
;442:	//
;443:	waterlevel = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 445
;444:
;445:	point[0] = cent->lerpOrigin[0];
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRF4
ASGNF4
line 446
;446:	point[1] = cent->lerpOrigin[1];
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRF4
ASGNF4
line 447
;447:	point[2] = cent->lerpOrigin[2] + MINS_Z + 1;
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
INDIRF4
CNSTF4 3250585600
ADDF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 448
;448:	contents = CG_PointContents(point, -1);
ADDRLP4 0
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 40
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 40
INDIRI4
ASGNI4
line 450
;449:
;450:	if ( contents & MASK_WATER ) {
ADDRLP4 12
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $358
line 451
;451:		sample2 = viewheight - MINS_Z;
ADDRLP4 28
ADDRLP4 24
INDIRI4
CNSTI4 -24
SUBI4
ASGNI4
line 452
;452:		sample1 = sample2 / 2;
ADDRLP4 32
ADDRLP4 28
INDIRI4
CNSTI4 2
DIVI4
ASGNI4
line 453
;453:		waterlevel = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 454
;454:		point[2] = cent->lerpOrigin[2] + MINS_Z + sample1;
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
INDIRF4
CNSTF4 3250585600
ADDF4
ADDRLP4 32
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 455
;455:		contents = CG_PointContents(point, -1);
ADDRLP4 0
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 44
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 44
INDIRI4
ASGNI4
line 457
;456:
;457:		if (contents & MASK_WATER) {
ADDRLP4 12
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $361
line 458
;458:			waterlevel = 2;
ADDRLP4 20
CNSTI4 2
ASGNI4
line 459
;459:			point[2] = cent->lerpOrigin[2] + MINS_Z + sample2;
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
INDIRF4
CNSTF4 3250585600
ADDF4
ADDRLP4 28
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 460
;460:			contents = CG_PointContents(point, -1);
ADDRLP4 0
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 48
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 48
INDIRI4
ASGNI4
line 462
;461:
;462:			if (contents & MASK_WATER) {
ADDRLP4 12
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $364
line 463
;463:				waterlevel = 3;
ADDRLP4 20
CNSTI4 3
ASGNI4
line 464
;464:			}
LABELV $364
line 465
;465:		}
LABELV $361
line 466
;466:	}
LABELV $358
line 468
;467:
;468:	return waterlevel;
ADDRLP4 20
INDIRI4
RETI4
LABELV $352
endproc CG_WaterLevel 52 8
export CG_PainEvent
proc CG_PainEvent 16 16
line 478
;469:}
;470:
;471:/*
;472:================
;473:CG_PainEvent
;474:
;475:Also called by playerstate transition
;476:================
;477:*/
;478:void CG_PainEvent( centity_t *cent, int health ) {
line 482
;479:	const char *snd;
;480:
;481:	// don't do more than two pain sounds a second
;482:	if ( cg.time - cent->pe.painTime < 500 ) {
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
SUBI4
CNSTI4 500
GEI4 $367
line 483
;483:		cent->pe.painIgnore = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 0
ASGNI4
line 484
;484:		return;
ADDRGP4 $366
JUMPV
LABELV $367
line 487
;485:	}
;486:
;487:	if ( cent->pe.painIgnore ) {
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
INDIRI4
CNSTI4 0
EQI4 $370
line 488
;488:		cent->pe.painIgnore = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 0
ASGNI4
line 489
;489:		return;
ADDRGP4 $366
JUMPV
LABELV $370
line 492
;490:	}
;491:
;492:	if ( health < 25 ) {
ADDRFP4 4
INDIRI4
CNSTI4 25
GEI4 $372
line 493
;493:		snd = "*pain25_1.wav";
ADDRLP4 0
ADDRGP4 $374
ASGNP4
line 494
;494:	} else if ( health < 50 ) {
ADDRGP4 $373
JUMPV
LABELV $372
ADDRFP4 4
INDIRI4
CNSTI4 50
GEI4 $375
line 495
;495:		snd = "*pain50_1.wav";
ADDRLP4 0
ADDRGP4 $377
ASGNP4
line 496
;496:	} else if ( health < 75 ) {
ADDRGP4 $376
JUMPV
LABELV $375
ADDRFP4 4
INDIRI4
CNSTI4 75
GEI4 $378
line 497
;497:		snd = "*pain75_1.wav";
ADDRLP4 0
ADDRGP4 $380
ASGNP4
line 498
;498:	} else {
ADDRGP4 $379
JUMPV
LABELV $378
line 499
;499:		snd = "*pain100_1.wav";
ADDRLP4 0
ADDRGP4 $381
ASGNP4
line 500
;500:	}
LABELV $379
LABELV $376
LABELV $373
line 503
;501:
;502:	// play a gurp sound instead of a normal pain sound
;503:	if (CG_WaterLevel(cent) == 3) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 CG_WaterLevel
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
NEI4 $382
line 504
;504:		if (rand()&1) {
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $384
line 505
;505:			trap_S_StartSound(NULL, cent->currentState.number, CHAN_VOICE, CG_CustomSound(cent->currentState.number, "sound/player/gurp1.wav"));
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $386
ARGP4
ADDRLP4 12
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 506
;506:		} else {
ADDRGP4 $383
JUMPV
LABELV $384
line 507
;507:			trap_S_StartSound(NULL, cent->currentState.number, CHAN_VOICE, CG_CustomSound(cent->currentState.number, "sound/player/gurp2.wav"));
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $387
ARGP4
ADDRLP4 12
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 508
;508:		}
line 509
;509:	} else {
ADDRGP4 $383
JUMPV
LABELV $382
line 510
;510:		trap_S_StartSound(NULL, cent->currentState.number, CHAN_VOICE, CG_CustomSound(cent->currentState.number, snd));
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 511
;511:	}
LABELV $383
line 514
;512:
;513:	// save pain time for programitic twitch animation
;514:	cent->pe.painTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 515
;515:	cent->pe.painDirection ^= 1;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 516
;516:}
LABELV $366
endproc CG_PainEvent 16 16
data
align 4
LABELV $495
byte 4 0
byte 4 0
byte 4 1065353216
export CG_EntityEvent
code
proc CG_EntityEvent 124 48
line 528
;517:
;518:
;519:
;520:/*
;521:==============
;522:CG_EntityEvent
;523:
;524:An entity has an event value
;525:also called by CG_CheckPlayerstateEvents
;526:==============
;527:*/
;528:void CG_EntityEvent( centity_t *cent, vec3_t position, int entityNum ) {
line 539
;529:	entityState_t	*es;
;530:	entity_event_t	event;
;531:	vec3_t			dir;
;532:	const char		*s;
;533:	int				clientNum;
;534:	clientInfo_t	*ci;
;535:	vec3_t			vec;
;536:	float			fovOffset;
;537:	centity_t		*ce;
;538:
;539:	es = &cent->currentState;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 540
;540:	event = es->event & ~EV_EVENT_BITS;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
ASGNI4
line 542
;541:
;542:	if ( (unsigned) event >= EV_MAX ) {
ADDRLP4 4
INDIRI4
CVIU4 4
CNSTU4 83
LTU4 $390
line 543
;543:		CG_Error( "Unknown event: %i", event );
ADDRGP4 $392
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 544
;544:		return;
ADDRGP4 $389
JUMPV
LABELV $390
line 547
;545:	}
;546:
;547:	if ( cg_debugEvents.integer ) {
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $393
line 548
;548:		CG_Printf( "ent:%3i  event:%3i %s", es->number, event, eventnames[ event ] );
ADDRGP4 $396
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 eventnames
ADDP4
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 549
;549:	}
LABELV $393
line 551
;550:
;551:	if ( !event ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $397
line 552
;552:		return;
ADDRGP4 $389
JUMPV
LABELV $397
line 555
;553:	}
;554:
;555:	clientNum = es->clientNum;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 556
;556:	if ( (unsigned) clientNum >= MAX_CLIENTS ) {
ADDRLP4 8
INDIRI4
CVIU4 4
CNSTU4 64
LTU4 $399
line 557
;557:		clientNum = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 558
;558:	}
LABELV $399
line 559
;559:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 12
ADDRLP4 8
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 561
;560:
;561:	switch ( event ) {
ADDRLP4 52
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 1
LTI4 $402
ADDRLP4 52
INDIRI4
CNSTI4 76
GTI4 $402
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $872-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $872
address $405
address $411
address $418
address $425
address $432
address $468
address $468
address $468
address $468
address $439
address $449
address $458
address $494
address $502
address $508
address $511
address $514
address $517
address $519
address $557
address $574
address $578
address $581
address $582
address $582
address $582
address $582
address $582
address $582
address $582
address $582
address $582
address $582
address $582
address $582
address $582
address $582
address $582
address $582
address $592
address $589
address $583
address $586
address $596
address $691
address $696
address $703
address $689
address $688
address $624
address $625
address $626
address $627
address $690
address $402
address $826
address $830
address $830
address $830
address $835
address $836
address $845
address $854
address $863
address $623
address $603
address $614
address $617
address $618
address $619
address $620
address $621
address $622
address $871
address $870
address $506
code
LABELV $405
line 566
;562:	//
;563:	// movement generated events
;564:	//
;565:	case EV_FOOTSTEP:
;566:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $403
line 567
;567:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 60
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 60
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 cgs+148692+628
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 569
;568:				cgs.media.footsteps[ ci->footsteps ][rand()&3] );
;569:		}
line 570
;570:		break;
ADDRGP4 $403
JUMPV
LABELV $411
line 573
;571:
;572:	case EV_FOOTSTEP_METAL:
;573:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $403
line 574
;574:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 60
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 60
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+628+80
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 576
;575:				cgs.media.footsteps[ FOOTSTEP_METAL ][rand()&3] );
;576:		}
line 577
;577:		break;
ADDRGP4 $403
JUMPV
LABELV $418
line 580
;578:
;579:	case EV_FOOTSPLASH:
;580:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $403
line 581
;581:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 60
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 60
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+628+96
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 583
;582:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;583:		}
line 584
;584:		break;
ADDRGP4 $403
JUMPV
LABELV $425
line 587
;585:
;586:	case EV_FOOTWADE:
;587:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $403
line 588
;588:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 60
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 60
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+628+96
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 590
;589:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;590:		}
line 591
;591:		break;
ADDRGP4 $403
JUMPV
LABELV $432
line 594
;592:
;593:	case EV_SWIM:
;594:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $403
line 595
;595:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 60
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 60
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+628+96
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 597
;596:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;597:		}
line 598
;598:		break;
ADDRGP4 $403
JUMPV
LABELV $439
line 601
;599:
;600:	case EV_FALL_SHORT:
;601:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.landSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+148692+896
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 602
;602:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 8
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
NEI4 $403
line 604
;603:			// smooth landing z changes
;604:			cg.landChange = -8;
ADDRGP4 cg+108948
CNSTF4 3238002688
ASGNF4
line 605
;605:			cg.landTime = cg.time;
ADDRGP4 cg+108952
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 606
;606:		}
line 607
;607:		break;
ADDRGP4 $403
JUMPV
LABELV $449
line 611
;608:
;609:	case EV_FALL_MEDIUM:
;610:		// use normal pain sound
;611:		trap_S_StartSound( NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*pain100_1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $381
ARGP4
ADDRLP4 60
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 60
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 612
;612:		cent->pe.painIgnore = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 1
ASGNI4
line 613
;613:		cent->pe.painTime = cg.time;	// don't play a pain sound right after this
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 614
;614:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 8
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
NEI4 $403
line 616
;615:			// smooth landing z changes
;616:			cg.landChange = -16;
ADDRGP4 cg+108948
CNSTF4 3246391296
ASGNF4
line 617
;617:			cg.landTime = cg.time;
ADDRGP4 cg+108952
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 618
;618:		}
line 619
;619:		break;
ADDRGP4 $403
JUMPV
LABELV $458
line 622
;620:
;621:	case EV_FALL_FAR:
;622:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, CG_CustomSound( es->number, "*fall1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $459
ARGP4
ADDRLP4 64
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 623
;623:		cent->pe.painIgnore = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 1
ASGNI4
line 624
;624:		cent->pe.painTime = cg.time;	// don't play a pain sound right after this
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 625
;625:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 8
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
NEI4 $403
line 627
;626:			// smooth landing z changes
;627:			cg.landChange = -24;
ADDRGP4 cg+108948
CNSTF4 3250585600
ASGNF4
line 628
;628:			cg.landTime = cg.time;
ADDRGP4 cg+108952
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 629
;629:		}
line 630
;630:		break;
ADDRGP4 $403
JUMPV
LABELV $468
line 636
;631:
;632:	case EV_STEP_4:
;633:	case EV_STEP_8:
;634:	case EV_STEP_12:
;635:	case EV_STEP_16:		// smooth out step up transitions
;636:	{
line 641
;637:		float	oldStep;
;638:		int		delta;
;639:		int		step;
;640:
;641:		if ( clientNum != cg.predictedPlayerState.clientNum ) {
ADDRLP4 8
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
EQI4 $469
line 642
;642:			break;
ADDRGP4 $403
JUMPV
LABELV $469
line 645
;643:		}
;644:		// if we are interpolating, we don't need to smooth steps
;645:		if ( cg.demoPlayback || (cg.snap->ps.pm_flags & PMF_FOLLOW) ||
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
NEI4 $481
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $481
ADDRGP4 cg_nopredict+12
INDIRI4
CNSTI4 0
NEI4 $481
ADDRGP4 cgs+149904
INDIRI4
CNSTI4 0
EQI4 $473
LABELV $481
line 646
;646:			cg_nopredict.integer || cgs.synchronousClients ) {
line 647
;647:			break;
ADDRGP4 $403
JUMPV
LABELV $473
line 650
;648:		}
;649:		// check for stepping up before a previous step is completed
;650:		delta = cg.time - cg.stepTime;
ADDRLP4 68
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+108936
INDIRI4
SUBI4
ASGNI4
line 651
;651:		if (delta < STEP_TIME) {
ADDRLP4 68
INDIRI4
CNSTI4 200
GEI4 $484
line 652
;652:			oldStep = cg.stepChange * (STEP_TIME - delta) / STEP_TIME;
ADDRLP4 72
ADDRGP4 cg+108932
INDIRF4
CNSTI4 200
ADDRLP4 68
INDIRI4
SUBI4
CVIF4 4
MULF4
CNSTF4 1000593162
MULF4
ASGNF4
line 653
;653:		} else {
ADDRGP4 $485
JUMPV
LABELV $484
line 654
;654:			oldStep = 0;
ADDRLP4 72
CNSTF4 0
ASGNF4
line 655
;655:		}
LABELV $485
line 658
;656:
;657:		// add this amount
;658:		step = 4 * (event - EV_STEP_4 + 1 );
ADDRLP4 76
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 24
SUBI4
CNSTI4 4
ADDI4
ASGNI4
line 659
;659:		cg.stepChange = oldStep + step;
ADDRGP4 cg+108932
ADDRLP4 72
INDIRF4
ADDRLP4 76
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 660
;660:		if ( cg.stepChange > MAX_STEP_CHANGE ) {
ADDRGP4 cg+108932
INDIRF4
CNSTF4 1107296256
LEF4 $488
line 661
;661:			cg.stepChange = MAX_STEP_CHANGE;
ADDRGP4 cg+108932
CNSTF4 1107296256
ASGNF4
line 662
;662:		}
LABELV $488
line 663
;663:		cg.stepTime = cg.time;
ADDRGP4 cg+108936
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 664
;664:		break;
ADDRGP4 $403
JUMPV
LABELV $494
line 669
;665:	}
;666:
;667:	case EV_JUMP_PAD:
;668://		CG_Printf( "EV_JUMP_PAD w/effect #%i\n", es->eventParm );
;669:		{
line 670
;670:			vec3_t			up = {0, 0, 1};
ADDRLP4 68
ADDRGP4 $495
INDIRB
ASGNB 12
line 673
;671:
;672:
;673:			CG_SmokePuff( cent->lerpOrigin, up, 
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRLP4 68
ARGP4
CNSTF4 1107296256
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1051260355
ARGF4
CNSTF4 1148846080
ARGF4
ADDRGP4 cg+107604
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 cgs+148692+308
INDIRI4
ARGI4
ADDRGP4 CG_SmokePuff
CALLP4
pop
line 680
;674:						  32, 
;675:						  1, 1, 1, 0.33f,
;676:						  1000, 
;677:						  cg.time, 0,
;678:						  LEF_PUFF_DONT_SCALE, 
;679:						  cgs.media.smokePuffShader );
;680:		}
line 683
;681:
;682:		// boing sound at origin, jump sound on player
;683:		trap_S_StartSound ( cent->lerpOrigin, -1, CHAN_VOICE, cgs.media.jumpPadSound );
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 cgs+148692+900
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 684
;684:		trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*jump1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $501
ARGP4
ADDRLP4 68
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 68
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 685
;685:		break;
ADDRGP4 $403
JUMPV
LABELV $502
line 689
;686:
;687:	case EV_JUMP:
;688:		// pain event with fast sequential jump just creates sound distortion
;689:		if ( cg.time - cent->pe.painTime > 50 )
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
SUBI4
CNSTI4 50
LEI4 $403
line 690
;690:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*jump1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $501
ARGP4
ADDRLP4 72
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 72
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 691
;691:		break;
ADDRGP4 $403
JUMPV
LABELV $506
line 694
;692:
;693:	case EV_TAUNT:
;694:		trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*taunt.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $507
ARGP4
ADDRLP4 76
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 76
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 695
;695:		break;
ADDRGP4 $403
JUMPV
LABELV $508
line 698
;696:
;697:	case EV_WATER_TOUCH:
;698:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrInSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+148692+996
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 699
;699:		break;
ADDRGP4 $403
JUMPV
LABELV $511
line 702
;700:
;701:	case EV_WATER_LEAVE:
;702:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrOutSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+148692+1000
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 703
;703:		break;
ADDRGP4 $403
JUMPV
LABELV $514
line 706
;704:
;705:	case EV_WATER_UNDER:
;706:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrUnSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+148692+1004
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 707
;707:		break;
ADDRGP4 $403
JUMPV
LABELV $517
line 710
;708:
;709:	case EV_WATER_CLEAR:
;710:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, CG_CustomSound( es->number, "*gasp.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $518
ARGP4
ADDRLP4 80
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 80
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 711
;711:		break;
ADDRGP4 $403
JUMPV
LABELV $519
line 714
;712:
;713:	case EV_ITEM_PICKUP:
;714:		{
line 718
;715:			gitem_t	*item;
;716:			int		index;
;717:
;718:			index = es->eventParm;		// player predicted
ADDRLP4 84
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 720
;719:
;720:			if ( index < 1 || index >= bg_numItems ) {
ADDRLP4 92
ADDRLP4 84
INDIRI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 1
LTI4 $522
ADDRLP4 92
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $520
LABELV $522
line 721
;721:				break;
ADDRGP4 $403
JUMPV
LABELV $520
line 724
;722:			}
;723:
;724:			if ( entityNum >= 0 ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
LTI4 $523
line 726
;725:				// our predicted entity
;726:				ce = cg_entities + entityNum;
ADDRLP4 40
ADDRFP4 8
INDIRI4
CNSTI4 740
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 727
;727:				if ( ce->delaySpawn > cg.time && ce->delaySpawnPlayed ) {
ADDRLP4 96
ADDRLP4 40
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 448
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
LEI4 $524
ADDRLP4 96
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
CNSTI4 0
EQI4 $524
line 728
;728:					break; // delay item pickup
ADDRGP4 $403
JUMPV
line 730
;729:				}
;730:			} else {
LABELV $523
line 731
;731:				ce = NULL;
ADDRLP4 40
CNSTP4 0
ASGNP4
line 732
;732:			}
LABELV $524
line 734
;733:
;734:			item = &bg_itemlist[ index ];
ADDRLP4 88
ADDRLP4 84
INDIRI4
CNSTI4 52
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 738
;735:
;736:			// powerups and team items will have a separate global sound, this one
;737:			// will be played at prediction time
;738:			if ( item->giType == IT_POWERUP || item->giType == IT_TEAM) {
ADDRLP4 96
ADDRLP4 88
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 7
EQI4 $530
ADDRLP4 96
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 9
NEI4 $528
LABELV $530
line 739
;739:				trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.n_healthSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+148692+1168
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 740
;740:			} else if (item->giType == IT_RUNE) {
ADDRGP4 $529
JUMPV
LABELV $528
ADDRLP4 88
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
NEI4 $533
line 741
;741:				switch (item->giTag ) {
ADDRLP4 100
ADDRLP4 88
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 10
LTI4 $534
ADDRLP4 100
INDIRI4
CNSTI4 13
GTI4 $534
ADDRLP4 100
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $550-40
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $550
address $538
address $541
address $544
address $547
code
LABELV $538
line 743
;742:					case PW_SCOUT:
;743:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.scoutSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+148692+1152
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 744
;744:					break;
ADDRGP4 $534
JUMPV
LABELV $541
line 746
;745:					case PW_GUARD:
;746:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.guardSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+148692+1148
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 747
;747:					break;
ADDRGP4 $534
JUMPV
LABELV $544
line 749
;748:					case PW_DOUBLER:
;749:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.doublerSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+148692+1144
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 750
;750:					break;
ADDRGP4 $534
JUMPV
LABELV $547
line 752
;751:					case PW_AMMOREGEN:
;752:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.ammoregenSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+148692+1140
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 753
;753:					break;
line 755
;754:				}
;755:			} else {
ADDRGP4 $534
JUMPV
LABELV $533
line 756
;756:				trap_S_StartSound (NULL, es->number, CHAN_AUTO,	trap_S_RegisterSound( item->pickup_sound, qfalse ) );
ADDRLP4 88
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 100
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 100
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 757
;757:			}
LABELV $534
LABELV $529
line 760
;758:
;759:			// show icon and name on status bar
;760:			if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $552
line 761
;761:				CG_ItemPickup( index );
ADDRLP4 84
INDIRI4
ARGI4
ADDRGP4 CG_ItemPickup
CALLV
pop
line 762
;762:			}
LABELV $552
line 764
;763:
;764:			if ( ce ) {
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $403
line 765
;765:				ce->delaySpawnPlayed = qtrue;
ADDRLP4 40
INDIRP4
CNSTI4 452
ADDP4
CNSTI4 1
ASGNI4
line 766
;766:			}
line 767
;767:		}
line 768
;768:		break;
ADDRGP4 $403
JUMPV
LABELV $557
line 771
;769:
;770:	case EV_GLOBAL_ITEM_PICKUP:
;771:		{
line 775
;772:			gitem_t	*item;
;773:			int		index;
;774:
;775:			index = es->eventParm;		// player predicted
ADDRLP4 84
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 777
;776:
;777:			if ( index < 1 || index >= bg_numItems ) {
ADDRLP4 92
ADDRLP4 84
INDIRI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 1
LTI4 $560
ADDRLP4 92
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $558
LABELV $560
line 778
;778:				break;
ADDRGP4 $403
JUMPV
LABELV $558
line 781
;779:			}
;780:
;781:			if ( entityNum >= 0 ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
LTI4 $561
line 783
;782:				// our predicted entity
;783:				ce = cg_entities + entityNum;
ADDRLP4 40
ADDRFP4 8
INDIRI4
CNSTI4 740
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 784
;784:				if ( ce->delaySpawn > cg.time && ce->delaySpawnPlayed ) {
ADDRLP4 96
ADDRLP4 40
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 448
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
LEI4 $562
ADDRLP4 96
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
CNSTI4 0
EQI4 $562
line 785
;785:					break;
ADDRGP4 $403
JUMPV
line 787
;786:				}
;787:			} else {
LABELV $561
line 788
;788:				ce = NULL;
ADDRLP4 40
CNSTP4 0
ASGNP4
line 789
;789:			}
LABELV $562
line 791
;790:
;791:			item = &bg_itemlist[ index ];
ADDRLP4 88
ADDRLP4 84
INDIRI4
CNSTI4 52
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 793
;792:			// powerup pickups are global
;793:			if( item->pickup_sound ) {
ADDRLP4 88
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $566
line 794
;794:				trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, trap_S_RegisterSound( item->pickup_sound, qfalse ) );
ADDRLP4 88
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 96
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 96
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 795
;795:			}
LABELV $566
line 798
;796:
;797:			// show icon and name on status bar
;798:			if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $569
line 799
;799:				CG_ItemPickup( index );
ADDRLP4 84
INDIRI4
ARGI4
ADDRGP4 CG_ItemPickup
CALLV
pop
line 800
;800:			}
LABELV $569
line 802
;801:
;802:			if ( ce ) {
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $403
line 803
;803:				ce->delaySpawnPlayed = qtrue;
ADDRLP4 40
INDIRP4
CNSTI4 452
ADDP4
CNSTI4 1
ASGNI4
line 804
;804:			}
line 805
;805:		}
line 806
;806:		break;
ADDRGP4 $403
JUMPV
LABELV $574
line 813
;807:
;808:	//
;809:	// weapon events
;810:	//
;811:	case EV_NOAMMO:
;812://		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.noAmmoSound );
;813:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $403
line 814
;814:			CG_OutOfAmmoChange();
ADDRGP4 CG_OutOfAmmoChange
CALLV
pop
line 815
;815:		}
line 816
;816:		break;
ADDRGP4 $403
JUMPV
LABELV $578
line 819
;817:
;818:	case EV_CHANGE_WEAPON:
;819:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.selectSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+148692+616
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 820
;820:		break;
ADDRGP4 $403
JUMPV
LABELV $581
line 823
;821:
;822:	case EV_FIRE_WEAPON:
;823:		CG_FireWeapon( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_FireWeapon
CALLV
pop
line 824
;824:		break;
ADDRGP4 $403
JUMPV
LABELV $582
line 842
;825:
;826:	case EV_USE_ITEM0:
;827:	case EV_USE_ITEM1:
;828:	case EV_USE_ITEM2:
;829:	case EV_USE_ITEM3:
;830:	case EV_USE_ITEM4:
;831:	case EV_USE_ITEM5:
;832:	case EV_USE_ITEM6:
;833:	case EV_USE_ITEM7:
;834:	case EV_USE_ITEM8:
;835:	case EV_USE_ITEM9:
;836:	case EV_USE_ITEM10:
;837:	case EV_USE_ITEM11:
;838:	case EV_USE_ITEM12:
;839:	case EV_USE_ITEM13:
;840:	case EV_USE_ITEM14:
;841:	case EV_USE_ITEM15:
;842:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 843
;843:		break;
ADDRGP4 $403
JUMPV
LABELV $583
line 851
;844:
;845:	//=================================================================
;846:
;847:	//
;848:	// other events
;849:	//
;850:	case EV_PLAYER_TELEPORT_IN:
;851:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.teleInSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+148692+876
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 852
;852:		CG_SpawnEffect( position);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_SpawnEffect
CALLV
pop
line 853
;853:		break;
ADDRGP4 $403
JUMPV
LABELV $586
line 856
;854:
;855:	case EV_PLAYER_TELEPORT_OUT:
;856:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.teleOutSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+148692+880
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 857
;857:		CG_SpawnEffect(  position);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_SpawnEffect
CALLV
pop
line 858
;858:		break;
ADDRGP4 $403
JUMPV
LABELV $589
line 861
;859:
;860:	case EV_ITEM_POP:
;861:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.respawnSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+148692+888
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 862
;862:		break;
ADDRGP4 $403
JUMPV
LABELV $592
line 865
;863:
;864:	case EV_ITEM_RESPAWN:
;865:		cent->miscTime = cg.time;	// scale up from this
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 866
;866:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.respawnSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+148692+888
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 867
;867:		break;
ADDRGP4 $403
JUMPV
LABELV $596
line 870
;868:
;869:	case EV_GRENADE_BOUNCE:
;870:		if ( rand() & 1 ) {
ADDRLP4 84
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $597
line 871
;871:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.hgrenb1aSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+148692+1172
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 872
;872:		} else {
ADDRGP4 $403
JUMPV
LABELV $597
line 873
;873:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.hgrenb2aSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+148692+1176
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 874
;874:		}
line 875
;875:		break;
ADDRGP4 $403
JUMPV
LABELV $603
line 878
;876:
;877:	case EV_PROXIMITY_MINE_STICK:
;878:		if( es->eventParm & SURF_FLESH ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $604
line 879
;879:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbimplSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+148692+1180
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 880
;880:		} else 	if( es->eventParm & SURF_METALSTEPS ) {
ADDRGP4 $403
JUMPV
LABELV $604
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $608
line 881
;881:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbimpmSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+148692+1184
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 882
;882:		} else {
ADDRGP4 $403
JUMPV
LABELV $608
line 883
;883:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbimpdSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+148692+1188
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 884
;884:		}
line 885
;885:		break;
ADDRGP4 $403
JUMPV
LABELV $614
line 888
;886:
;887:	case EV_PROXIMITY_MINE_TRIGGER:
;888:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbactvSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+148692+1192
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 889
;889:		break;
ADDRGP4 $403
JUMPV
LABELV $617
line 892
;890:
;891:	case EV_KAMIKAZE:
;892:		CG_KamikazeEffect( cent->lerpOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 CG_KamikazeEffect
CALLV
pop
line 893
;893:		break;
ADDRGP4 $403
JUMPV
LABELV $618
line 896
;894:
;895:	case EV_OBELISKEXPLODE:
;896:		CG_ObeliskExplode( cent->lerpOrigin, es->eventParm );
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ObeliskExplode
CALLV
pop
line 897
;897:		break;
ADDRGP4 $403
JUMPV
LABELV $619
line 900
;898:
;899:	case EV_OBELISKPAIN:
;900:		CG_ObeliskPain( cent->lerpOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 CG_ObeliskPain
CALLV
pop
line 901
;901:		break;
ADDRGP4 $403
JUMPV
LABELV $620
line 904
;902:
;903:	case EV_INVUL_IMPACT:
;904:		CG_InvulnerabilityImpact( cent->lerpOrigin, cent->currentState.angles );
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRLP4 88
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRGP4 CG_InvulnerabilityImpact
CALLV
pop
line 905
;905:		break;
ADDRGP4 $403
JUMPV
LABELV $621
line 908
;906:
;907:	case EV_JUICED:
;908:		CG_InvulnerabilityJuiced( cent->lerpOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 CG_InvulnerabilityJuiced
CALLV
pop
line 909
;909:		break;
ADDRGP4 $403
JUMPV
LABELV $622
line 912
;910:
;911:	case EV_LIGHTNINGBOLT:
;912:		CG_LightningBoltBeam(es->origin2, es->pos.trBase);
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 CG_LightningBoltBeam
CALLV
pop
line 913
;913:		break;
ADDRGP4 $403
JUMPV
LABELV $623
line 916
;914:
;915:	case EV_SCOREPLUM:
;916:		CG_ScorePlum( cent->currentState.otherEntityNum, cent->lerpOrigin, cent->currentState.time );
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 96
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRLP4 96
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ScorePlum
CALLV
pop
line 917
;917:		break;
ADDRGP4 $403
JUMPV
LABELV $624
line 923
;918:
;919:	//
;920:	// missile impacts
;921:	//
;922:	case EV_MISSILE_HIT:
;923:		ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 924
;924:		CG_MissileHitPlayer( es->weapon, position, dir, es->otherEntityNum );
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_MissileHitPlayer
CALLV
pop
line 925
;925:		break;
ADDRGP4 $403
JUMPV
LABELV $625
line 928
;926:
;927:	case EV_MISSILE_MISS:
;928:		ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 929
;929:		CG_MissileHitWall( es->weapon, 0, position, dir, IMPACTSOUND_DEFAULT );
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 CG_MissileHitWall
CALLV
pop
line 930
;930:		break;
ADDRGP4 $403
JUMPV
LABELV $626
line 933
;931:
;932:	case EV_MISSILE_MISS_METAL:
;933:		ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 934
;934:		CG_MissileHitWall( es->weapon, 0, position, dir, IMPACTSOUND_METAL );
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 CG_MissileHitWall
CALLV
pop
line 935
;935:		break;
ADDRGP4 $403
JUMPV
LABELV $627
line 938
;936:
;937:	case EV_RAILTRAIL:
;938:		cent->currentState.weapon = WP_RAILGUN;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 7
ASGNI4
line 940
;939:
;940:		if ( cent->currentState.clientNum == cg.snap->ps.clientNum && !cg_thirdPerson.integer ) 
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $628
ADDRGP4 cg_thirdPerson+12
INDIRI4
CNSTI4 0
NEI4 $628
line 941
;941:		{
line 942
;942:			VectorCopy( cg.refdef.vieworg, vec );
ADDRLP4 16
ADDRGP4 cg+109056+24
INDIRB
ASGNB 12
line 943
;943:			fovOffset = -0.2f * ( cgs.fov - 90.0f );
ADDRLP4 48
ADDRGP4 cgs+149888
INDIRF4
CNSTF4 1119092736
SUBF4
CNSTF4 3192704205
MULF4
ASGNF4
line 946
;944:
;945:			// 13.5, -5.5, -6.0
;946:			VectorMA( vec, cg_gun_x.value + 13.5f, cg.refdef.viewaxis[0], vec );
ADDRLP4 16
ADDRLP4 16
INDIRF4
ADDRGP4 cg+109056+36
INDIRF4
ADDRGP4 cg_gun_x+8
INDIRF4
CNSTF4 1096286208
ADDF4
MULF4
ADDF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 16+4
INDIRF4
ADDRGP4 cg+109056+36+4
INDIRF4
ADDRGP4 cg_gun_x+8
INDIRF4
CNSTF4 1096286208
ADDF4
MULF4
ADDF4
ASGNF4
ADDRLP4 16+8
ADDRLP4 16+8
INDIRF4
ADDRGP4 cg+109056+36+8
INDIRF4
ADDRGP4 cg_gun_x+8
INDIRF4
CNSTF4 1096286208
ADDF4
MULF4
ADDF4
ASGNF4
line 947
;947:			VectorMA( vec, cg_gun_y.value - 5.5f, cg.refdef.viewaxis[1], vec );
ADDRLP4 16
ADDRLP4 16
INDIRF4
ADDRGP4 cg+109056+36+12
INDIRF4
ADDRGP4 cg_gun_y+8
INDIRF4
CNSTF4 1085276160
SUBF4
MULF4
ADDF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 16+4
INDIRF4
ADDRGP4 cg+109056+36+12+4
INDIRF4
ADDRGP4 cg_gun_y+8
INDIRF4
CNSTF4 1085276160
SUBF4
MULF4
ADDF4
ASGNF4
ADDRLP4 16+8
ADDRLP4 16+8
INDIRF4
ADDRGP4 cg+109056+36+12+8
INDIRF4
ADDRGP4 cg_gun_y+8
INDIRF4
CNSTF4 1085276160
SUBF4
MULF4
ADDF4
ASGNF4
line 948
;948:			VectorMA( vec, cg_gun_z.value + fovOffset - 6.0f, cg.refdef.viewaxis[2], vec );
ADDRLP4 104
ADDRLP4 48
INDIRF4
ASGNF4
ADDRLP4 16
ADDRLP4 16
INDIRF4
ADDRGP4 cg+109056+36+24
INDIRF4
ADDRGP4 cg_gun_z+8
INDIRF4
ADDRLP4 104
INDIRF4
ADDF4
CNSTF4 1086324736
SUBF4
MULF4
ADDF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 16+4
INDIRF4
ADDRGP4 cg+109056+36+24+4
INDIRF4
ADDRGP4 cg_gun_z+8
INDIRF4
ADDRLP4 104
INDIRF4
ADDF4
CNSTF4 1086324736
SUBF4
MULF4
ADDF4
ASGNF4
ADDRLP4 16+8
ADDRLP4 16+8
INDIRF4
ADDRGP4 cg+109056+36+24+8
INDIRF4
ADDRGP4 cg_gun_z+8
INDIRF4
ADDRLP4 48
INDIRF4
ADDF4
CNSTF4 1086324736
SUBF4
MULF4
ADDF4
ASGNF4
line 949
;949:		}
ADDRGP4 $629
JUMPV
LABELV $628
line 951
;950:		else
;951:			VectorCopy( es->origin2, vec );
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
LABELV $629
line 954
;952:
;953:		// if the end was on a nomark surface, don't make an explosion
;954:		CG_RailTrail( ci, vec, es->pos.trBase );
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 CG_RailTrail
CALLV
pop
line 956
;955:
;956:		if ( es->eventParm != 255 ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 255
EQI4 $403
line 957
;957:			ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 958
;958:			CG_MissileHitWall( es->weapon, es->clientNum, position, dir, IMPACTSOUND_DEFAULT );
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 CG_MissileHitWall
CALLV
pop
line 959
;959:		}
line 960
;960:		break;
ADDRGP4 $403
JUMPV
LABELV $688
line 963
;961:
;962:	case EV_BULLET_HIT_WALL:
;963:		ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 964
;964:		CG_Bullet( es->pos.trBase, es->otherEntityNum, dir, qfalse, ENTITYNUM_WORLD );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1022
ARGI4
ADDRGP4 CG_Bullet
CALLV
pop
line 965
;965:		break;
ADDRGP4 $403
JUMPV
LABELV $689
line 968
;966:
;967:	case EV_BULLET_HIT_FLESH:
;968:		CG_Bullet( es->pos.trBase, es->otherEntityNum, dir, qtrue, es->eventParm );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Bullet
CALLV
pop
line 969
;969:		break;
ADDRGP4 $403
JUMPV
LABELV $690
line 972
;970:
;971:	case EV_SHOTGUN:
;972:		CG_ShotgunFire( es );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ShotgunFire
CALLV
pop
line 973
;973:		break;
ADDRGP4 $403
JUMPV
LABELV $691
line 976
;974:
;975:	case EV_GENERAL_SOUND:
;976:		if ( cgs.gameSounds[ es->eventParm ] ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+35872
ADDP4
INDIRI4
CNSTI4 0
EQI4 $692
line 977
;977:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, cgs.gameSounds[ es->eventParm ] );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+35872
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 978
;978:		} else {
ADDRGP4 $403
JUMPV
LABELV $692
line 979
;979:			s = CG_ConfigString( CS_SOUNDS + es->eventParm );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 112
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 44
ADDRLP4 112
INDIRP4
ASGNP4
line 980
;980:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, s ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 116
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 116
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 981
;981:		}
line 982
;982:		break;
ADDRGP4 $403
JUMPV
LABELV $696
line 985
;983:
;984:	case EV_GLOBAL_SOUND:	// play from the player's head so it never diminishes
;985:		if ( cgs.gameSounds[ es->eventParm ] ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+35872
ADDP4
INDIRI4
CNSTI4 0
EQI4 $697
line 986
;986:			trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, cgs.gameSounds[ es->eventParm ] );
CNSTP4 0
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+35872
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 987
;987:		} else {
ADDRGP4 $403
JUMPV
LABELV $697
line 988
;988:			s = CG_ConfigString( CS_SOUNDS + es->eventParm );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 112
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 44
ADDRLP4 112
INDIRP4
ASGNP4
line 989
;989:			trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, CG_CustomSound( es->number, s ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 116
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 116
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 990
;990:		}
line 991
;991:		break;
ADDRGP4 $403
JUMPV
LABELV $703
line 994
;992:
;993:	case EV_GLOBAL_TEAM_SOUND:	// play from the player's head so it never diminishes
;994:		{
line 995
;995:			switch( es->eventParm ) {
ADDRLP4 112
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
LTI4 $403
ADDRLP4 112
INDIRI4
CNSTI4 13
GTI4 $403
ADDRLP4 112
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $825
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $825
address $707
address $715
address $723
address $733
address $743
address $769
address $795
address $801
address $807
address $810
address $813
address $816
address $819
address $822
code
LABELV $707
line 997
;996:				case GTS_RED_CAPTURE: // CTF: red team captured the blue flag, 1FCTF: red team captured the neutral flag
;997:					if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED )
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $708
line 998
;998:						CG_AddBufferedSound( cgs.media.captureYourTeamSound );
ADDRGP4 cgs+148692+1040
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $403
JUMPV
LABELV $708
line 1000
;999:					else
;1000:						CG_AddBufferedSound( cgs.media.captureOpponentSound );
ADDRGP4 cgs+148692+1044
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1001
;1001:					break;
ADDRGP4 $403
JUMPV
LABELV $715
line 1003
;1002:				case GTS_BLUE_CAPTURE: // CTF: blue team captured the red flag, 1FCTF: blue team captured the neutral flag
;1003:					if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE )
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $716
line 1004
;1004:						CG_AddBufferedSound( cgs.media.captureYourTeamSound );
ADDRGP4 cgs+148692+1040
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $403
JUMPV
LABELV $716
line 1006
;1005:					else
;1006:						CG_AddBufferedSound( cgs.media.captureOpponentSound );
ADDRGP4 cgs+148692+1044
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1007
;1007:					break;
ADDRGP4 $403
JUMPV
LABELV $723
line 1009
;1008:				case GTS_RED_RETURN: // CTF: blue flag returned, 1FCTF: never used
;1009:					if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED )
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $724
line 1010
;1010:						CG_AddBufferedSound( cgs.media.returnYourTeamSound );
ADDRGP4 cgs+148692+1048
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $725
JUMPV
LABELV $724
line 1012
;1011:					else
;1012:						CG_AddBufferedSound( cgs.media.returnOpponentSound );
ADDRGP4 cgs+148692+1052
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
LABELV $725
line 1014
;1013:					//
;1014:					CG_AddBufferedSound( cgs.media.blueFlagReturnedSound );
ADDRGP4 cgs+148692+1068
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1015
;1015:					break;
ADDRGP4 $403
JUMPV
LABELV $733
line 1017
;1016:				case GTS_BLUE_RETURN: // CTF red flag returned, 1FCTF: neutral flag returned
;1017:					if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE )
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $734
line 1018
;1018:						CG_AddBufferedSound( cgs.media.returnYourTeamSound );
ADDRGP4 cgs+148692+1048
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $735
JUMPV
LABELV $734
line 1020
;1019:					else
;1020:						CG_AddBufferedSound( cgs.media.returnOpponentSound );
ADDRGP4 cgs+148692+1052
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
LABELV $735
line 1022
;1021:					//
;1022:					CG_AddBufferedSound( cgs.media.redFlagReturnedSound );
ADDRGP4 cgs+148692+1064
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1023
;1023:					break;
ADDRGP4 $403
JUMPV
LABELV $743
line 1027
;1024:
;1025:				case GTS_RED_TAKEN: // CTF: red team took blue flag, 1FCTF: blue team took the neutral flag
;1026:					// if this player picked up the flag then a sound is played in CG_CheckLocalSounds
;1027:					if (cg.snap->ps.powerups[PW_BLUEFLAG] || cg.snap->ps.powerups[PW_NEUTRALFLAG]) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
CNSTI4 0
NEI4 $748
ADDRGP4 cg+36
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
CNSTI4 0
EQI4 $744
LABELV $748
line 1028
;1028:					}
ADDRGP4 $403
JUMPV
LABELV $744
line 1029
;1029:					else {
line 1030
;1030:						if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $749
line 1031
;1031:							if (cgs.gametype == GT_ONEFLAG) 
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 5
NEI4 $752
line 1032
;1032:								CG_AddBufferedSound( cgs.media.yourTeamTookTheFlagSound );
ADDRGP4 cgs+148692+1088
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $403
JUMPV
LABELV $752
line 1034
;1033:							else
;1034:						 		CG_AddBufferedSound( cgs.media.enemyTookYourFlagSound );
ADDRGP4 cgs+148692+1076
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1035
;1035:						}
ADDRGP4 $403
JUMPV
LABELV $749
line 1036
;1036:						else if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $403
line 1037
;1037:							if (cgs.gametype == GT_ONEFLAG)
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 5
NEI4 $762
line 1038
;1038:								CG_AddBufferedSound( cgs.media.enemyTookTheFlagSound );
ADDRGP4 cgs+148692+1080
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $403
JUMPV
LABELV $762
line 1040
;1039:							else
;1040: 								CG_AddBufferedSound( cgs.media.yourTeamTookEnemyFlagSound );
ADDRGP4 cgs+148692+1084
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1041
;1041:						}
line 1042
;1042:					}
line 1043
;1043:					break;
ADDRGP4 $403
JUMPV
LABELV $769
line 1046
;1044:				case GTS_BLUE_TAKEN: // CTF: blue team took the red flag, 1FCTF red team took the neutral flag
;1045:					// if this player picked up the flag then a sound is played in CG_CheckLocalSounds
;1046:					if (cg.snap->ps.powerups[PW_REDFLAG] || cg.snap->ps.powerups[PW_NEUTRALFLAG]) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 0
NEI4 $774
ADDRGP4 cg+36
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
CNSTI4 0
EQI4 $770
LABELV $774
line 1047
;1047:					}
ADDRGP4 $403
JUMPV
LABELV $770
line 1048
;1048:					else {
line 1049
;1049:						if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $775
line 1050
;1050:							if (cgs.gametype == GT_ONEFLAG)
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 5
NEI4 $778
line 1051
;1051:								CG_AddBufferedSound( cgs.media.yourTeamTookTheFlagSound );
ADDRGP4 cgs+148692+1088
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $403
JUMPV
LABELV $778
line 1053
;1052:							else
;1053:								CG_AddBufferedSound( cgs.media.enemyTookYourFlagSound );
ADDRGP4 cgs+148692+1076
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1054
;1054:						}
ADDRGP4 $403
JUMPV
LABELV $775
line 1055
;1055:						else if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $403
line 1056
;1056:							if (cgs.gametype == GT_ONEFLAG)
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 5
NEI4 $788
line 1057
;1057:								CG_AddBufferedSound( cgs.media.enemyTookTheFlagSound );
ADDRGP4 cgs+148692+1080
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $403
JUMPV
LABELV $788
line 1059
;1058:							else
;1059:								CG_AddBufferedSound( cgs.media.yourTeamTookEnemyFlagSound );
ADDRGP4 cgs+148692+1084
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1060
;1060:						}
line 1061
;1061:					}
line 1062
;1062:					break;
ADDRGP4 $403
JUMPV
LABELV $795
line 1064
;1063:				case GTS_REDOBELISK_ATTACKED: // Overload: red obelisk is being attacked
;1064:					if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $403
line 1065
;1065:						CG_AddBufferedSound( cgs.media.yourBaseIsUnderAttackSound );
ADDRGP4 cgs+148692+1096
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1066
;1066:					}
line 1067
;1067:					break;
ADDRGP4 $403
JUMPV
LABELV $801
line 1069
;1068:				case GTS_BLUEOBELISK_ATTACKED: // Overload: blue obelisk is being attacked
;1069:					if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $403
line 1070
;1070:						CG_AddBufferedSound( cgs.media.yourBaseIsUnderAttackSound );
ADDRGP4 cgs+148692+1096
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1071
;1071:					}
line 1072
;1072:					break;
ADDRGP4 $403
JUMPV
LABELV $807
line 1075
;1073:
;1074:				case GTS_REDTEAM_SCORED:
;1075:					CG_AddBufferedSound(cgs.media.redScoredSound);
ADDRGP4 cgs+148692+1020
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1076
;1076:					break;
ADDRGP4 $403
JUMPV
LABELV $810
line 1078
;1077:				case GTS_BLUETEAM_SCORED:
;1078:					CG_AddBufferedSound(cgs.media.blueScoredSound);
ADDRGP4 cgs+148692+1024
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1079
;1079:					break;
ADDRGP4 $403
JUMPV
LABELV $813
line 1081
;1080:				case GTS_REDTEAM_TOOK_LEAD:
;1081:					CG_AddBufferedSound(cgs.media.redLeadsSound);
ADDRGP4 cgs+148692+1028
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1082
;1082:					break;
ADDRGP4 $403
JUMPV
LABELV $816
line 1084
;1083:				case GTS_BLUETEAM_TOOK_LEAD:
;1084:					CG_AddBufferedSound(cgs.media.blueLeadsSound);
ADDRGP4 cgs+148692+1032
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1085
;1085:					break;
ADDRGP4 $403
JUMPV
LABELV $819
line 1087
;1086:				case GTS_TEAMS_ARE_TIED:
;1087:					CG_AddBufferedSound( cgs.media.teamsTiedSound );
ADDRGP4 cgs+148692+1036
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1088
;1088:					break;
ADDRGP4 $403
JUMPV
LABELV $822
line 1090
;1089:				case GTS_KAMIKAZE:
;1090:					trap_S_StartLocalSound(cgs.media.kamikazeFarSound, CHAN_ANNOUNCER);
ADDRGP4 cgs+148692+812
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 1091
;1091:					break;
line 1093
;1092:				default:
;1093:					break;
line 1095
;1094:			}
;1095:			break;
ADDRGP4 $403
JUMPV
LABELV $826
line 1101
;1096:		}
;1097:
;1098:	case EV_PAIN:
;1099:		// local player sounds are triggered in CG_CheckLocalSounds,
;1100:		// so ignore events on the player
;1101:		if ( cent->currentState.number != cg.snap->ps.clientNum ) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
EQI4 $403
line 1102
;1102:			CG_PainEvent( cent, es->eventParm );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_PainEvent
CALLV
pop
line 1103
;1103:		}
line 1104
;1104:		break;
ADDRGP4 $403
JUMPV
LABELV $830
line 1109
;1105:
;1106:	case EV_DEATH1:
;1107:	case EV_DEATH2:
;1108:	case EV_DEATH3:
;1109:		if ( CG_WaterLevel(cent) == 3 ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 112
ADDRGP4 CG_WaterLevel
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 3
NEI4 $831
line 1110
;1110:			trap_S_StartSound( NULL, es->number, CHAN_VOICE, CG_CustomSound(es->number, "*drown.wav") );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $833
ARGP4
ADDRLP4 116
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 116
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1111
;1111:		} else {
ADDRGP4 $403
JUMPV
LABELV $831
line 1112
;1112:			trap_S_StartSound( NULL, es->number, CHAN_VOICE, CG_CustomSound(es->number, va("*death%i.wav", event - EV_DEATH1 + 1)) );
ADDRGP4 $834
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 57
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 116
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 116
INDIRP4
ARGP4
ADDRLP4 120
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 120
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1113
;1113:		}
line 1115
;1114:
;1115:		break;
ADDRGP4 $403
JUMPV
LABELV $835
line 1118
;1116:
;1117:	case EV_OBITUARY:
;1118:		CG_Obituary( es );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Obituary
CALLV
pop
line 1119
;1119:		break;
ADDRGP4 $403
JUMPV
LABELV $836
line 1125
;1120:
;1121:	//
;1122:	// powerup events
;1123:	//
;1124:	case EV_POWERUP_QUAD:
;1125:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $837
line 1126
;1126:			cg.powerupActive = PW_QUAD;
ADDRGP4 cg+125480
CNSTI4 1
ASGNI4
line 1127
;1127:			cg.powerupTime = cg.time;
ADDRGP4 cg+125484
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1128
;1128:		}
LABELV $837
line 1129
;1129:		trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.quadSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 cgs+148692+608
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1130
;1130:		break;
ADDRGP4 $403
JUMPV
LABELV $845
line 1133
;1131:
;1132:	case EV_POWERUP_BATTLESUIT:
;1133:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $846
line 1134
;1134:			cg.powerupActive = PW_BATTLESUIT;
ADDRGP4 cg+125480
CNSTI4 2
ASGNI4
line 1135
;1135:			cg.powerupTime = cg.time;
ADDRGP4 cg+125484
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1136
;1136:		}
LABELV $846
line 1137
;1137:		trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.protectSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 cgs+148692+1164
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1138
;1138:		break;
ADDRGP4 $403
JUMPV
LABELV $854
line 1141
;1139:
;1140:	case EV_POWERUP_REGEN:
;1141:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $855
line 1142
;1142:			cg.powerupActive = PW_REGEN;
ADDRGP4 cg+125480
CNSTI4 5
ASGNI4
line 1143
;1143:			cg.powerupTime = cg.time;
ADDRGP4 cg+125484
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1144
;1144:		}
LABELV $855
line 1145
;1145:		trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.regenSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 cgs+148692+1160
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1146
;1146:		break;
ADDRGP4 $403
JUMPV
LABELV $863
line 1152
;1147:
;1148:	case EV_GIB_PLAYER:
;1149:		// don't play gib sound when using the kamikaze because it interferes
;1150:		// with the kamikaze sound, downside is that the gib sound will also
;1151:		// not be played when someone is gibbed while just carrying the kamikaze
;1152:		if ( !(es->eFlags & EF_KAMIKAZE) ) {
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
NEI4 $864
line 1153
;1153:			trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.gibSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+148692+860
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1154
;1154:		}
LABELV $864
line 1155
;1155:		trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.gibSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+148692+860
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1156
;1156:		CG_GibPlayer( cent->lerpOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 CG_GibPlayer
CALLV
pop
line 1157
;1157:		break;
ADDRGP4 $403
JUMPV
LABELV $870
line 1160
;1158:
;1159:	case EV_STOPLOOPINGSOUND:
;1160:		trap_S_StopLoopingSound( es->number );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StopLoopingSound
CALLV
pop
line 1161
;1161:		es->loopSound = 0;
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 1162
;1162:		break;
ADDRGP4 $403
JUMPV
LABELV $871
line 1165
;1163:
;1164:	case EV_DEBUG_LINE:
;1165:		CG_Beam( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Beam
CALLV
pop
line 1166
;1166:		break;
ADDRGP4 $403
JUMPV
LABELV $402
line 1169
;1167:
;1168:	default:
;1169:		CG_Error( "Unknown event: %i", event );
ADDRGP4 $392
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 1170
;1170:		break;
LABELV $403
line 1172
;1171:	}
;1172:}
LABELV $389
endproc CG_EntityEvent 124 48
export CG_CheckEvents
proc CG_CheckEvents 8 12
line 1181
;1173:
;1174:
;1175:/*
;1176:==============
;1177:CG_CheckEvents
;1178:
;1179:==============
;1180:*/
;1181:void CG_CheckEvents( centity_t *cent ) {
line 1183
;1182:	// check for event-only entities
;1183:	if ( cent->currentState.eType > ET_EVENTS ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
LEI4 $875
line 1184
;1184:		if ( cent->previousEvent ) {
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
CNSTI4 0
EQI4 $877
line 1185
;1185:			return;	// already fired
ADDRGP4 $874
JUMPV
LABELV $877
line 1188
;1186:		}
;1187:		// if this is a player event set the entity number of the client entity number
;1188:		if ( cent->currentState.eFlags & EF_PLAYER_EVENT ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $879
line 1189
;1189:			cent->currentState.number = cent->currentState.otherEntityNum;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 1190
;1190:		}
LABELV $879
line 1192
;1191:
;1192:		cent->previousEvent = 1;
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
CNSTI4 1
ASGNI4
line 1194
;1193:
;1194:		cent->currentState.event = cent->currentState.eType - ET_EVENTS;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
SUBI4
ASGNI4
line 1195
;1195:	} else {
ADDRGP4 $876
JUMPV
LABELV $875
line 1197
;1196:		// check for events riding with another entity
;1197:		if ( cent->currentState.event == cent->previousEvent ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
NEI4 $881
line 1198
;1198:			return;
ADDRGP4 $874
JUMPV
LABELV $881
line 1200
;1199:		}
;1200:		cent->previousEvent = cent->currentState.event;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 428
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ASGNI4
line 1201
;1201:		if ( ( cent->currentState.event & ~EV_EVENT_BITS ) == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
CNSTI4 0
NEI4 $883
line 1202
;1202:			return;
ADDRGP4 $874
JUMPV
LABELV $883
line 1204
;1203:		}
;1204:	}
LABELV $876
line 1207
;1205:
;1206:	// calculate the position at exactly the frame time
;1207:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.snap->serverTime, cent->lerpOrigin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 1208
;1208:	CG_SetEntitySoundPosition( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetEntitySoundPosition
CALLV
pop
line 1210
;1209:
;1210:	CG_EntityEvent( cent, cent->lerpOrigin, -1 );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
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
line 1211
;1211:}
LABELV $874
endproc CG_CheckEvents 8 12
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
LABELV $834
byte 1 42
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $833
byte 1 42
byte 1 100
byte 1 114
byte 1 111
byte 1 119
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $518
byte 1 42
byte 1 103
byte 1 97
byte 1 115
byte 1 112
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $507
byte 1 42
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $501
byte 1 42
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $459
byte 1 42
byte 1 102
byte 1 97
byte 1 108
byte 1 108
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $396
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $392
byte 1 85
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $387
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 103
byte 1 117
byte 1 114
byte 1 112
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $386
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 103
byte 1 117
byte 1 114
byte 1 112
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $381
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 49
byte 1 48
byte 1 48
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $380
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 55
byte 1 53
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $377
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 53
byte 1 48
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $374
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 50
byte 1 53
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $310
byte 1 85
byte 1 115
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $309
byte 1 78
byte 1 111
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $299
byte 1 37
byte 1 115
byte 1 32
byte 1 94
byte 1 55
byte 1 100
byte 1 105
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $287
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $282
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $281
byte 1 39
byte 1 115
byte 1 32
byte 1 112
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 97
byte 1 108
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $280
byte 1 116
byte 1 114
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $278
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 106
byte 1 117
byte 1 105
byte 1 99
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $276
byte 1 39
byte 1 115
byte 1 32
byte 1 75
byte 1 97
byte 1 109
byte 1 105
byte 1 107
byte 1 97
byte 1 122
byte 1 101
byte 1 32
byte 1 98
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $275
byte 1 102
byte 1 97
byte 1 108
byte 1 108
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 0
align 1
LABELV $273
byte 1 39
byte 1 115
byte 1 32
byte 1 80
byte 1 114
byte 1 111
byte 1 120
byte 1 32
byte 1 77
byte 1 105
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $272
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 99
byte 1 108
byte 1 111
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 0
align 1
LABELV $270
byte 1 39
byte 1 115
byte 1 32
byte 1 67
byte 1 104
byte 1 97
byte 1 105
byte 1 110
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $269
byte 1 103
byte 1 111
byte 1 116
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 32
byte 1 112
byte 1 111
byte 1 105
byte 1 115
byte 1 111
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $267
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 110
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $265
byte 1 39
byte 1 115
byte 1 32
byte 1 66
byte 1 70
byte 1 71
byte 1 0
align 1
LABELV $264
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $262
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 114
byte 1 111
byte 1 99
byte 1 117
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $260
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $257
byte 1 39
byte 1 115
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $256
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 109
byte 1 101
byte 1 108
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $254
byte 1 97
byte 1 108
byte 1 109
byte 1 111
byte 1 115
byte 1 116
byte 1 32
byte 1 100
byte 1 111
byte 1 100
byte 1 103
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $252
byte 1 39
byte 1 115
byte 1 32
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $250
byte 1 39
byte 1 115
byte 1 32
byte 1 115
byte 1 104
byte 1 114
byte 1 97
byte 1 112
byte 1 110
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $249
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 115
byte 1 104
byte 1 114
byte 1 101
byte 1 100
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $247
byte 1 39
byte 1 115
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $246
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $244
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 103
byte 1 117
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $242
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $240
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 112
byte 1 117
byte 1 109
byte 1 109
byte 1 101
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $238
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 99
byte 1 97
byte 1 117
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $217
byte 1 110
byte 1 111
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $214
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $211
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 37
byte 1 115
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $193
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $188
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 105
byte 1 109
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $187
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $184
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $181
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 120
byte 1 32
byte 1 109
byte 1 105
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $180
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 120
byte 1 32
byte 1 109
byte 1 105
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $177
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 120
byte 1 32
byte 1 109
byte 1 105
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $173
byte 1 115
byte 1 104
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 114
byte 1 32
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $171
byte 1 109
byte 1 101
byte 1 108
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 105
byte 1 109
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $170
byte 1 109
byte 1 101
byte 1 108
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $167
byte 1 109
byte 1 101
byte 1 108
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $163
byte 1 98
byte 1 108
byte 1 101
byte 1 119
byte 1 32
byte 1 104
byte 1 105
byte 1 109
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 32
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $162
byte 1 98
byte 1 108
byte 1 101
byte 1 119
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 32
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $159
byte 1 98
byte 1 108
byte 1 101
byte 1 119
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 32
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $155
byte 1 116
byte 1 114
byte 1 105
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $154
byte 1 116
byte 1 114
byte 1 105
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 32
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $151
byte 1 116
byte 1 114
byte 1 105
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $147
byte 1 103
byte 1 111
byte 1 101
byte 1 115
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 97
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $139
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 119
byte 1 114
byte 1 111
byte 1 110
byte 1 103
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $137
byte 1 115
byte 1 97
byte 1 119
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $135
byte 1 100
byte 1 111
byte 1 101
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 102
byte 1 108
byte 1 105
byte 1 112
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 97
byte 1 118
byte 1 97
byte 1 0
align 1
LABELV $133
byte 1 109
byte 1 101
byte 1 108
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $131
byte 1 115
byte 1 97
byte 1 110
byte 1 107
byte 1 32
byte 1 108
byte 1 105
byte 1 107
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $129
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 115
byte 1 113
byte 1 117
byte 1 105
byte 1 115
byte 1 104
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $127
byte 1 99
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $125
byte 1 115
byte 1 117
byte 1 105
byte 1 99
byte 1 105
byte 1 100
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $120
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $119
byte 1 110
byte 1 0
align 1
LABELV $112
byte 1 67
byte 1 71
byte 1 95
byte 1 79
byte 1 98
byte 1 105
byte 1 116
byte 1 117
byte 1 97
byte 1 114
byte 1 121
byte 1 58
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
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
byte 1 0
align 1
LABELV $107
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $106
byte 1 37
byte 1 105
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $105
byte 1 37
byte 1 105
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $102
byte 1 37
byte 1 105
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $99
byte 1 37
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $96
byte 1 49
byte 1 51
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $93
byte 1 49
byte 1 50
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $90
byte 1 49
byte 1 49
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $87
byte 1 94
byte 1 51
byte 1 51
byte 1 114
byte 1 100
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $84
byte 1 94
byte 1 49
byte 1 50
byte 1 110
byte 1 100
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $81
byte 1 94
byte 1 52
byte 1 49
byte 1 115
byte 1 116
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $78
byte 1 0
align 1
LABELV $77
byte 1 84
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 0
