export BotNumActivePlayers
code
proc BotNumActivePlayers 1044 12
file "..\..\..\..\code\game\ai_chat.c"
line 43
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:/*****************************************************************************
;5: * name:		ai_chat.c
;6: *
;7: * desc:		Quake3 bot AI
;8: *
;9: * $Archive: /MissionPack/code/game/ai_chat.c $
;10: *
;11: *****************************************************************************/
;12:
;13:#include "g_local.h"
;14:#include "../botlib/botlib.h"
;15:#include "../botlib/be_aas.h"
;16:#include "../botlib/be_ea.h"
;17:#include "../botlib/be_ai_char.h"
;18:#include "../botlib/be_ai_chat.h"
;19:#include "../botlib/be_ai_gen.h"
;20:#include "../botlib/be_ai_goal.h"
;21:#include "../botlib/be_ai_move.h"
;22:#include "../botlib/be_ai_weap.h"
;23://
;24:#include "ai_main.h"
;25:#include "ai_dmq3.h"
;26:#include "ai_chat.h"
;27:#include "ai_cmd.h"
;28:#include "ai_dmnet.h"
;29://
;30:#include "chars.h"				//characteristics
;31:#include "inv.h"				//indexes into the inventory
;32:#include "syn.h"				//synonyms
;33:#include "match.h"				//string matching types and vars
;34:
;35:#define TIME_BETWEENCHATTING	25
;36:
;37:
;38:/*
;39:==================
;40:BotNumActivePlayers
;41:==================
;42:*/
;43:int BotNumActivePlayers(void) {
line 47
;44:	int i, num;
;45:	char buf[MAX_INFO_STRING];
;46:
;47:	num = 0;
ADDRLP4 1028
CNSTI4 0
ASGNI4
line 48
;48:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $60
JUMPV
LABELV $57
line 49
;49:		trap_GetConfigstring(CS_PLAYERS+i, buf, sizeof(buf));
ADDRLP4 1024
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 51
;50:		//if no config string or no name
;51:		if (!buf[0] || !*Info_ValueForKey(buf, "n")) continue;
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $65
ADDRLP4 0
ARGP4
ADDRGP4 $64
ARGP4
ADDRLP4 1032
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1032
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $62
LABELV $65
ADDRGP4 $58
JUMPV
LABELV $62
line 53
;52:		//skip spectators
;53:		if (atoi(Info_ValueForKey(buf, "t")) == TEAM_SPECTATOR) continue;
ADDRLP4 0
ARGP4
ADDRGP4 $68
ARGP4
ADDRLP4 1036
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRLP4 1040
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 3
NEI4 $66
ADDRGP4 $58
JUMPV
LABELV $66
line 55
;54:		//
;55:		num++;
ADDRLP4 1028
ADDRLP4 1028
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 56
;56:	}
LABELV $58
line 48
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $60
ADDRLP4 1024
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $57
line 57
;57:	return num;
ADDRLP4 1028
INDIRI4
RETI4
LABELV $56
endproc BotNumActivePlayers 1044 12
export BotIsFirstInRankings
proc BotIsFirstInRankings 1512 12
line 65
;58:}
;59:
;60:/*
;61:==================
;62:BotIsFirstInRankings
;63:==================
;64:*/
;65:int BotIsFirstInRankings(bot_state_t *bs) {
line 70
;66:	int i, score;
;67:	char buf[MAX_INFO_STRING];
;68:	playerState_t ps;
;69:
;70:	score = bs->cur_ps.persistant[PERS_SCORE];
ADDRLP4 1496
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
ASGNI4
line 71
;71:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $73
JUMPV
LABELV $70
line 72
;72:		trap_GetConfigstring(CS_PLAYERS+i, buf, sizeof(buf));
ADDRLP4 1024
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 74
;73:		//if no config string or no name
;74:		if (!buf[0] || !*Info_ValueForKey(buf, "n")) continue;
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $77
ADDRLP4 0
ARGP4
ADDRGP4 $64
ARGP4
ADDRLP4 1500
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1500
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $75
LABELV $77
ADDRGP4 $71
JUMPV
LABELV $75
line 76
;75:		//skip spectators
;76:		if (atoi(Info_ValueForKey(buf, "t")) == TEAM_SPECTATOR) continue;
ADDRLP4 0
ARGP4
ADDRGP4 $68
ARGP4
ADDRLP4 1504
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1504
INDIRP4
ARGP4
ADDRLP4 1508
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1508
INDIRI4
CNSTI4 3
NEI4 $78
ADDRGP4 $71
JUMPV
LABELV $78
line 78
;77:		//
;78:		BotAI_GetClientState(i, &ps);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
ADDRGP4 BotAI_GetClientState
CALLI4
pop
line 79
;79:		if (score < ps.persistant[PERS_SCORE]) return qfalse;
ADDRLP4 1496
INDIRI4
ADDRLP4 1028+248
INDIRI4
GEI4 $80
CNSTI4 0
RETI4
ADDRGP4 $69
JUMPV
LABELV $80
line 80
;80:	}
LABELV $71
line 71
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $73
ADDRLP4 1024
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $70
line 81
;81:	return qtrue;
CNSTI4 1
RETI4
LABELV $69
endproc BotIsFirstInRankings 1512 12
export BotIsLastInRankings
proc BotIsLastInRankings 1512 12
line 89
;82:}
;83:
;84:/*
;85:==================
;86:BotIsLastInRankings
;87:==================
;88:*/
;89:int BotIsLastInRankings(bot_state_t *bs) {
line 94
;90:	int i, score;
;91:	char buf[MAX_INFO_STRING];
;92:	playerState_t ps;
;93:
;94:	score = bs->cur_ps.persistant[PERS_SCORE];
ADDRLP4 1496
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
ASGNI4
line 95
;95:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $87
JUMPV
LABELV $84
line 96
;96:		trap_GetConfigstring(CS_PLAYERS+i, buf, sizeof(buf));
ADDRLP4 1024
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 98
;97:		//if no config string or no name
;98:		if (!buf[0] || !*Info_ValueForKey(buf, "n")) continue;
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $91
ADDRLP4 0
ARGP4
ADDRGP4 $64
ARGP4
ADDRLP4 1500
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1500
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $89
LABELV $91
ADDRGP4 $85
JUMPV
LABELV $89
line 100
;99:		//skip spectators
;100:		if (atoi(Info_ValueForKey(buf, "t")) == TEAM_SPECTATOR) continue;
ADDRLP4 0
ARGP4
ADDRGP4 $68
ARGP4
ADDRLP4 1504
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1504
INDIRP4
ARGP4
ADDRLP4 1508
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1508
INDIRI4
CNSTI4 3
NEI4 $92
ADDRGP4 $85
JUMPV
LABELV $92
line 102
;101:		//
;102:		BotAI_GetClientState(i, &ps);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
ADDRGP4 BotAI_GetClientState
CALLI4
pop
line 103
;103:		if (score > ps.persistant[PERS_SCORE]) return qfalse;
ADDRLP4 1496
INDIRI4
ADDRLP4 1028+248
INDIRI4
LEI4 $94
CNSTI4 0
RETI4
ADDRGP4 $83
JUMPV
LABELV $94
line 104
;104:	}
LABELV $85
line 95
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $87
ADDRLP4 1024
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $84
line 105
;105:	return qtrue;
CNSTI4 1
RETI4
LABELV $83
endproc BotIsLastInRankings 1512 12
bss
align 1
LABELV $98
skip 32
export BotFirstClientInRankings
code
proc BotFirstClientInRankings 1516 12
line 113
;106:}
;107:
;108:/*
;109:==================
;110:BotFirstClientInRankings
;111:==================
;112:*/
;113:char *BotFirstClientInRankings(void) {
line 119
;114:	int i, bestscore, bestclient;
;115:	char buf[MAX_INFO_STRING];
;116:	static char name[32];
;117:	playerState_t ps;
;118:
;119:	bestscore = -999999;
ADDRLP4 1496
CNSTI4 -999999
ASGNI4
line 120
;120:	bestclient = 0;
ADDRLP4 1500
CNSTI4 0
ASGNI4
line 121
;121:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $102
JUMPV
LABELV $99
line 122
;122:		trap_GetConfigstring(CS_PLAYERS+i, buf, sizeof(buf));
ADDRLP4 1024
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 124
;123:		//if no config string or no name
;124:		if (!buf[0] || !*Info_ValueForKey(buf, "n")) continue;
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $106
ADDRLP4 0
ARGP4
ADDRGP4 $64
ARGP4
ADDRLP4 1504
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1504
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $104
LABELV $106
ADDRGP4 $100
JUMPV
LABELV $104
line 126
;125:		//skip spectators
;126:		if (atoi(Info_ValueForKey(buf, "t")) == TEAM_SPECTATOR) continue;
ADDRLP4 0
ARGP4
ADDRGP4 $68
ARGP4
ADDRLP4 1508
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1508
INDIRP4
ARGP4
ADDRLP4 1512
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1512
INDIRI4
CNSTI4 3
NEI4 $107
ADDRGP4 $100
JUMPV
LABELV $107
line 128
;127:		//
;128:		BotAI_GetClientState(i, &ps);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
ADDRGP4 BotAI_GetClientState
CALLI4
pop
line 129
;129:		if (ps.persistant[PERS_SCORE] > bestscore) {
ADDRLP4 1028+248
INDIRI4
ADDRLP4 1496
INDIRI4
LEI4 $109
line 130
;130:			bestscore = ps.persistant[PERS_SCORE];
ADDRLP4 1496
ADDRLP4 1028+248
INDIRI4
ASGNI4
line 131
;131:			bestclient = i;
ADDRLP4 1500
ADDRLP4 1024
INDIRI4
ASGNI4
line 132
;132:		}
LABELV $109
line 133
;133:	}
LABELV $100
line 121
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $102
ADDRLP4 1024
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $99
line 134
;134:	EasyClientName( bestclient, name, sizeof( name ) );
ADDRLP4 1500
INDIRI4
ARGI4
ADDRGP4 $98
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 135
;135:	return name;
ADDRGP4 $98
RETP4
LABELV $97
endproc BotFirstClientInRankings 1516 12
bss
align 1
LABELV $114
skip 32
export BotLastClientInRankings
code
proc BotLastClientInRankings 1516 12
line 144
;136:}
;137:
;138:
;139:/*
;140:==================
;141:BotLastClientInRankings
;142:==================
;143:*/
;144:char *BotLastClientInRankings(void) {
line 150
;145:	int i, worstscore, bestclient;
;146:	char buf[MAX_INFO_STRING];
;147:	static char name[32];
;148:	playerState_t ps;
;149:
;150:	worstscore = 999999;
ADDRLP4 1496
CNSTI4 999999
ASGNI4
line 151
;151:	bestclient = 0;
ADDRLP4 1500
CNSTI4 0
ASGNI4
line 152
;152:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $118
JUMPV
LABELV $115
line 153
;153:		trap_GetConfigstring(CS_PLAYERS+i, buf, sizeof(buf));
ADDRLP4 1024
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 155
;154:		//if no config string or no name
;155:		if (!buf[0] || !*Info_ValueForKey(buf, "n")) continue;
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $122
ADDRLP4 0
ARGP4
ADDRGP4 $64
ARGP4
ADDRLP4 1504
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1504
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $120
LABELV $122
ADDRGP4 $116
JUMPV
LABELV $120
line 157
;156:		//skip spectators
;157:		if (atoi(Info_ValueForKey(buf, "t")) == TEAM_SPECTATOR) continue;
ADDRLP4 0
ARGP4
ADDRGP4 $68
ARGP4
ADDRLP4 1508
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1508
INDIRP4
ARGP4
ADDRLP4 1512
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1512
INDIRI4
CNSTI4 3
NEI4 $123
ADDRGP4 $116
JUMPV
LABELV $123
line 159
;158:		//
;159:		BotAI_GetClientState(i, &ps);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
ADDRGP4 BotAI_GetClientState
CALLI4
pop
line 160
;160:		if (ps.persistant[PERS_SCORE] < worstscore) {
ADDRLP4 1028+248
INDIRI4
ADDRLP4 1496
INDIRI4
GEI4 $125
line 161
;161:			worstscore = ps.persistant[PERS_SCORE];
ADDRLP4 1496
ADDRLP4 1028+248
INDIRI4
ASGNI4
line 162
;162:			bestclient = i;
ADDRLP4 1500
ADDRLP4 1024
INDIRI4
ASGNI4
line 163
;163:		}
LABELV $125
line 164
;164:	}
LABELV $116
line 152
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $118
ADDRLP4 1024
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $115
line 165
;165:	EasyClientName( bestclient, name, sizeof( name ) );
ADDRLP4 1500
INDIRI4
ARGI4
ADDRGP4 $114
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 166
;166:	return name;
ADDRGP4 $114
RETP4
LABELV $113
endproc BotLastClientInRankings 1516 12
bss
align 1
LABELV $130
skip 32
export BotRandomOpponentName
code
proc BotRandomOpponentName 1308 12
line 175
;167:}
;168:
;169:
;170:/*
;171:==================
;172:BotRandomOpponentName
;173:==================
;174:*/
;175:char *BotRandomOpponentName(bot_state_t *bs) {
line 181
;176:	int i, count;
;177:	char buf[MAX_INFO_STRING];
;178:	int opponents[MAX_CLIENTS], numopponents;
;179:	static char name[32];
;180:
;181:	numopponents = 0;
ADDRLP4 1028
CNSTI4 0
ASGNI4
line 182
;182:	opponents[0] = 0;
ADDRLP4 1036
CNSTI4 0
ASGNI4
line 183
;183:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $134
JUMPV
LABELV $131
line 184
;184:		if (i == bs->client) continue;
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $136
ADDRGP4 $132
JUMPV
LABELV $136
line 186
;185:		//
;186:		trap_GetConfigstring(CS_PLAYERS+i, buf, sizeof(buf));
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 188
;187:		//if no config string or no name
;188:		if (!buf[0] || !*Info_ValueForKey(buf, "n")) continue;
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $140
ADDRLP4 4
ARGP4
ADDRGP4 $64
ARGP4
ADDRLP4 1292
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1292
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $138
LABELV $140
ADDRGP4 $132
JUMPV
LABELV $138
line 190
;189:		//skip spectators
;190:		if (atoi(Info_ValueForKey(buf, "t")) == TEAM_SPECTATOR) continue;
ADDRLP4 4
ARGP4
ADDRGP4 $68
ARGP4
ADDRLP4 1296
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1296
INDIRP4
ARGP4
ADDRLP4 1300
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1300
INDIRI4
CNSTI4 3
NEI4 $141
ADDRGP4 $132
JUMPV
LABELV $141
line 192
;191:		//skip team mates
;192:		if (BotSameTeam(bs, i)) continue;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1304
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 1304
INDIRI4
CNSTI4 0
EQI4 $143
ADDRGP4 $132
JUMPV
LABELV $143
line 194
;193:		//
;194:		opponents[numopponents] = i;
ADDRLP4 1028
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1036
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 195
;195:		numopponents++;
ADDRLP4 1028
ADDRLP4 1028
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 196
;196:	}
LABELV $132
line 183
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $134
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $131
line 197
;197:	count = random() * numopponents;
ADDRLP4 1292
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 1292
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 1028
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 198
;198:	for (i = 0; i < numopponents; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $148
JUMPV
LABELV $145
line 199
;199:		count--;
ADDRLP4 1032
ADDRLP4 1032
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 200
;200:		if (count <= 0) {
ADDRLP4 1032
INDIRI4
CNSTI4 0
GTI4 $149
line 201
;201:			EasyClientName(opponents[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1036
ADDP4
INDIRI4
ARGI4
ADDRGP4 $130
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 202
;202:			return name;
ADDRGP4 $130
RETP4
ADDRGP4 $129
JUMPV
LABELV $149
line 204
;203:		}
;204:	}
LABELV $146
line 198
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $148
ADDRLP4 0
INDIRI4
ADDRLP4 1028
INDIRI4
LTI4 $145
line 205
;205:	EasyClientName(opponents[0], name, sizeof(name));
ADDRLP4 1036
INDIRI4
ARGI4
ADDRGP4 $130
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 206
;206:	return name;
ADDRGP4 $130
RETP4
LABELV $129
endproc BotRandomOpponentName 1308 12
proc BotMapTitle 0 0
line 216
;207:}
;208:
;209:
;210:/*
;211:==================
;212:BotMapTitle
;213:==================
;214:*/
;215:static const char *BotMapTitle( void )
;216:{
line 217
;217:	return mapname;
ADDRGP4 mapname
RETP4
LABELV $151
endproc BotMapTitle 0 0
export BotWeaponNameForMeansOfDeath
proc BotWeaponNameForMeansOfDeath 4 0
line 226
;218:}
;219:
;220:
;221:/*
;222:==================
;223:BotWeaponNameForMeansOfDeath
;224:==================
;225:*/
;226:char *BotWeaponNameForMeansOfDeath(int mod) {
line 227
;227:	switch(mod) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $153
ADDRLP4 0
INDIRI4
CNSTI4 28
GTI4 $153
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $186-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $186
address $155
address $157
address $159
address $161
address $161
address $163
address $163
address $165
address $165
address $167
address $169
address $171
address $171
address $153
address $153
address $153
address $153
address $153
address $153
address $153
address $153
address $153
address $173
address $175
address $177
address $179
address $181
address $183
code
LABELV $155
line 228
;228:		case MOD_SHOTGUN: return "Shotgun";
ADDRGP4 $156
RETP4
ADDRGP4 $152
JUMPV
LABELV $157
line 229
;229:		case MOD_GAUNTLET: return "Gauntlet";
ADDRGP4 $158
RETP4
ADDRGP4 $152
JUMPV
LABELV $159
line 230
;230:		case MOD_MACHINEGUN: return "Machinegun";
ADDRGP4 $160
RETP4
ADDRGP4 $152
JUMPV
LABELV $161
line 232
;231:		case MOD_GRENADE:
;232:		case MOD_GRENADE_SPLASH: return "Grenade Launcher";
ADDRGP4 $162
RETP4
ADDRGP4 $152
JUMPV
LABELV $163
line 234
;233:		case MOD_ROCKET:
;234:		case MOD_ROCKET_SPLASH: return "Rocket Launcher";
ADDRGP4 $164
RETP4
ADDRGP4 $152
JUMPV
LABELV $165
line 236
;235:		case MOD_PLASMA:
;236:		case MOD_PLASMA_SPLASH: return "Plasmagun";
ADDRGP4 $166
RETP4
ADDRGP4 $152
JUMPV
LABELV $167
line 237
;237:		case MOD_RAILGUN: return "Railgun";
ADDRGP4 $168
RETP4
ADDRGP4 $152
JUMPV
LABELV $169
line 238
;238:		case MOD_LIGHTNING: return "Lightning Gun";
ADDRGP4 $170
RETP4
ADDRGP4 $152
JUMPV
LABELV $171
line 240
;239:		case MOD_BFG:
;240:		case MOD_BFG_SPLASH: return "BFG10K";
ADDRGP4 $172
RETP4
ADDRGP4 $152
JUMPV
LABELV $173
line 241
;241:		case MOD_NAIL: return "Nailgun";
ADDRGP4 $174
RETP4
ADDRGP4 $152
JUMPV
LABELV $175
line 242
;242:		case MOD_CHAINGUN: return "Chaingun";
ADDRGP4 $176
RETP4
ADDRGP4 $152
JUMPV
LABELV $177
line 243
;243:		case MOD_PROXIMITY_MINE: return "Proximity Launcher";
ADDRGP4 $178
RETP4
ADDRGP4 $152
JUMPV
LABELV $179
line 244
;244:		case MOD_KAMIKAZE: return "Kamikaze";
ADDRGP4 $180
RETP4
ADDRGP4 $152
JUMPV
LABELV $181
line 245
;245:		case MOD_JUICED: return "Prox mine";
ADDRGP4 $182
RETP4
ADDRGP4 $152
JUMPV
LABELV $183
line 246
;246:		case MOD_GRAPPLE: return "Grapple";
ADDRGP4 $184
RETP4
ADDRGP4 $152
JUMPV
LABELV $153
line 247
;247:		default: return "[unknown weapon]";
ADDRGP4 $185
RETP4
LABELV $152
endproc BotWeaponNameForMeansOfDeath 4 0
export BotRandomWeaponName
proc BotRandomWeaponName 12 0
line 256
;248:	}
;249:}
;250:
;251:/*
;252:==================
;253:BotRandomWeaponName
;254:==================
;255:*/
;256:char *BotRandomWeaponName(void) {
line 259
;257:	int rnd;
;258:
;259:	rnd = random() * 11.9;
ADDRLP4 4
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 968779747
MULF4
CVFI4 4
ASGNI4
line 261
;260:
;261:	switch(rnd) {
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $189
ADDRLP4 8
INDIRI4
CNSTI4 10
GTI4 $189
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $202
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $202
address $191
address $192
address $193
address $194
address $195
address $196
address $197
address $198
address $199
address $200
address $201
code
LABELV $191
line 262
;262:		case 0: return "Gauntlet";
ADDRGP4 $158
RETP4
ADDRGP4 $188
JUMPV
LABELV $192
line 263
;263:		case 1: return "Shotgun";
ADDRGP4 $156
RETP4
ADDRGP4 $188
JUMPV
LABELV $193
line 264
;264:		case 2: return "Machinegun";
ADDRGP4 $160
RETP4
ADDRGP4 $188
JUMPV
LABELV $194
line 265
;265:		case 3: return "Grenade Launcher";
ADDRGP4 $162
RETP4
ADDRGP4 $188
JUMPV
LABELV $195
line 266
;266:		case 4: return "Rocket Launcher";
ADDRGP4 $164
RETP4
ADDRGP4 $188
JUMPV
LABELV $196
line 267
;267:		case 5: return "Plasmagun";
ADDRGP4 $166
RETP4
ADDRGP4 $188
JUMPV
LABELV $197
line 268
;268:		case 6: return "Railgun";
ADDRGP4 $168
RETP4
ADDRGP4 $188
JUMPV
LABELV $198
line 269
;269:		case 7: return "Lightning Gun";
ADDRGP4 $170
RETP4
ADDRGP4 $188
JUMPV
LABELV $199
line 270
;270:		case 8: return "Nailgun";
ADDRGP4 $174
RETP4
ADDRGP4 $188
JUMPV
LABELV $200
line 271
;271:		case 9: return "Chaingun";
ADDRGP4 $176
RETP4
ADDRGP4 $188
JUMPV
LABELV $201
line 272
;272:		case 10: return "Proximity Launcher";
ADDRGP4 $178
RETP4
ADDRGP4 $188
JUMPV
LABELV $189
line 273
;273:		default: return "BFG10K";
ADDRGP4 $172
RETP4
LABELV $188
endproc BotRandomWeaponName 12 0
export BotVisibleEnemies
proc BotVisibleEnemies 172 20
line 282
;274:	}
;275:}
;276:
;277:/*
;278:==================
;279:BotVisibleEnemies
;280:==================
;281:*/
;282:int BotVisibleEnemies(bot_state_t *bs) {
line 287
;283:	float vis;
;284:	int i;
;285:	aas_entityinfo_t entinfo;
;286:
;287:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $204
line 289
;288:
;289:		if (i == bs->client) continue;
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $208
ADDRGP4 $205
JUMPV
LABELV $208
line 291
;290:		//
;291:		BotEntityInfo(i, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 293
;292:		//
;293:		if (!entinfo.valid) continue;
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $210
ADDRGP4 $205
JUMPV
LABELV $210
line 295
;294:		//if the enemy isn't dead and the enemy isn't the bot self
;295:		if (EntityIsDead(&entinfo) || entinfo.number == bs->entitynum) continue;
ADDRLP4 4
ARGP4
ADDRLP4 148
ADDRGP4 EntityIsDead
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $215
ADDRLP4 4+20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
NEI4 $212
LABELV $215
ADDRGP4 $205
JUMPV
LABELV $212
line 297
;296:		//if the enemy is invisible and not shooting
;297:		if (EntityIsInvisible(&entinfo) && !EntityIsShooting(&entinfo)) {
ADDRLP4 4
ARGP4
ADDRLP4 152
ADDRGP4 EntityIsInvisible
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
EQI4 $216
ADDRLP4 4
ARGP4
ADDRLP4 156
ADDRGP4 EntityIsShooting
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 0
NEI4 $216
line 298
;298:			continue;
ADDRGP4 $205
JUMPV
LABELV $216
line 301
;299:		}
;300:		//if on the same team
;301:		if (BotSameTeam(bs, i)) continue;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 160
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
EQI4 $218
ADDRGP4 $205
JUMPV
LABELV $218
line 303
;302:		//check if the enemy is visible
;303:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i);
ADDRLP4 164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 164
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 164
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 164
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 168
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 144
ADDRLP4 168
INDIRF4
ASGNF4
line 304
;304:		if (vis > 0) return qtrue;
ADDRLP4 144
INDIRF4
CNSTF4 0
LEF4 $220
CNSTI4 1
RETI4
ADDRGP4 $203
JUMPV
LABELV $220
line 305
;305:	}
LABELV $205
line 287
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $204
line 306
;306:	return qfalse;
CNSTI4 0
RETI4
LABELV $203
endproc BotVisibleEnemies 172 20
export BotValidChatPosition
proc BotValidChatPosition 160 28
line 314
;307:}
;308:
;309:/*
;310:==================
;311:BotValidChatPosition
;312:==================
;313:*/
;314:int BotValidChatPosition(bot_state_t *bs) {
line 319
;315:	vec3_t point, start, end, mins, maxs;
;316:	bsp_trace_t trace;
;317:
;318:	//if the bot is dead all positions are valid
;319:	if (BotIsDead(bs)) return qtrue;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 BotIsDead
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $223
CNSTI4 1
RETI4
ADDRGP4 $222
JUMPV
LABELV $223
line 321
;320:	//never start chatting with a powerup
;321:	if (bs->inventory[INVENTORY_QUAD] ||
ADDRLP4 148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 5092
ADDP4
INDIRI4
CNSTI4 0
NEI4 $231
ADDRLP4 148
INDIRP4
CNSTI4 5096
ADDP4
INDIRI4
CNSTI4 0
NEI4 $231
ADDRLP4 148
INDIRP4
CNSTI4 5100
ADDP4
INDIRI4
CNSTI4 0
NEI4 $231
ADDRLP4 148
INDIRP4
CNSTI4 5104
ADDP4
INDIRI4
CNSTI4 0
NEI4 $231
ADDRLP4 148
INDIRP4
CNSTI4 5108
ADDP4
INDIRI4
CNSTI4 0
NEI4 $231
ADDRLP4 148
INDIRP4
CNSTI4 5112
ADDP4
INDIRI4
CNSTI4 0
EQI4 $225
LABELV $231
line 326
;322:		bs->inventory[INVENTORY_ENVIRONMENTSUIT] ||
;323:		bs->inventory[INVENTORY_HASTE] ||
;324:		bs->inventory[INVENTORY_INVISIBILITY] ||
;325:		bs->inventory[INVENTORY_REGEN] ||
;326:		bs->inventory[INVENTORY_FLIGHT]) return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $222
JUMPV
LABELV $225
line 330
;327:	//must be on the ground
;328:	//if (bs->cur_ps.groundEntityNum != ENTITYNUM_NONE) return qfalse;
;329:	//do not chat if in lava or slime
;330:	VectorCopy(bs->origin, point);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 331
;331:	point[2] -= 24;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1103101952
SUBF4
ASGNF4
line 332
;332:	if (trap_PointContents(point,bs->entitynum) & (CONTENTS_LAVA|CONTENTS_SLIME)) return qfalse;
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 152
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 24
BANDI4
CNSTI4 0
EQI4 $233
CNSTI4 0
RETI4
ADDRGP4 $222
JUMPV
LABELV $233
line 334
;333:	//do not chat if under water
;334:	VectorCopy(bs->origin, point);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 335
;335:	point[2] += 32;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 336
;336:	if (trap_PointContents(point,bs->entitynum) & MASK_WATER) return qfalse;
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 156
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $236
CNSTI4 0
RETI4
ADDRGP4 $222
JUMPV
LABELV $236
line 338
;337:	//must be standing on the world entity
;338:	VectorCopy(bs->origin, start);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 339
;339:	VectorCopy(bs->origin, end);
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 340
;340:	start[2] += 1;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 341
;341:	end[2] -= 10;
ADDRLP4 24+8
ADDRLP4 24+8
INDIRF4
CNSTF4 1092616192
SUBF4
ASGNF4
line 342
;342:	trap_AAS_PresenceTypeBoundingBox(PRESENCE_CROUCH, mins, maxs);
CNSTI4 4
ARGI4
ADDRLP4 36
ARGP4
ADDRLP4 48
ARGP4
ADDRGP4 trap_AAS_PresenceTypeBoundingBox
CALLV
pop
line 343
;343:	BotAI_Trace(&trace, start, mins, maxs, end, bs->client, MASK_SOLID);
ADDRLP4 60
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 48
ARGP4
ADDRLP4 24
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 344
;344:	if (trace.ent != ENTITYNUM_WORLD) return qfalse;
ADDRLP4 60+80
INDIRI4
CNSTI4 1022
EQI4 $240
CNSTI4 0
RETI4
ADDRGP4 $222
JUMPV
LABELV $240
line 346
;345:	//the bot is in a position where it can chat
;346:	return qtrue;
CNSTI4 1
RETI4
LABELV $222
endproc BotValidChatPosition 160 28
export BotChat_EnterGame
proc BotChat_EnterGame 68 32
line 354
;347:}
;348:
;349:/*
;350:==================
;351:BotChat_EnterGame
;352:==================
;353:*/
;354:int BotChat_EnterGame(bot_state_t *bs) {
line 358
;355:	char name[32];
;356:	float rnd;
;357:
;358:	if (bot_nochat.integer) return qfalse;
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 0
EQI4 $244
CNSTI4 0
RETI4
ADDRGP4 $243
JUMPV
LABELV $244
line 359
;359:	if (bs->lastchat_time > FloatTime() - TIME_BETWEENCHATTING) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1103626240
SUBF4
LEF4 $247
CNSTI4 0
RETI4
ADDRGP4 $243
JUMPV
LABELV $247
line 361
;360:	//don't chat in teamplay
;361:	if ( TeamPlayIsOn() ) return qfalse;
ADDRLP4 36
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $249
CNSTI4 0
RETI4
ADDRGP4 $243
JUMPV
LABELV $249
line 363
;362:	// don't chat in tournament mode
;363:	if (gametype == GT_DUEL) return qfalse;
ADDRGP4 gametype
INDIRI4
CNSTI4 2
NEI4 $251
CNSTI4 0
RETI4
ADDRGP4 $243
JUMPV
LABELV $251
line 364
;364:	rnd = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CHAT_ENTEREXITGAME, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 27
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 40
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 40
INDIRF4
ASGNF4
line 365
;365:	if (!bot_fastchat.integer) {
ADDRGP4 bot_fastchat+12
INDIRI4
CNSTI4 0
NEI4 $253
line 366
;366:		if (random() > rnd) return qfalse;
ADDRLP4 44
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 0
INDIRF4
LEF4 $256
CNSTI4 0
RETI4
ADDRGP4 $243
JUMPV
LABELV $256
line 367
;367:	}
LABELV $253
line 368
;368:	if (BotNumActivePlayers() <= 1) return qfalse;
ADDRLP4 44
ADDRGP4 BotNumActivePlayers
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 1
GTI4 $258
CNSTI4 0
RETI4
ADDRGP4 $243
JUMPV
LABELV $258
line 369
;369:	if (!BotValidChatPosition(bs)) return qfalse;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 BotValidChatPosition
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $260
CNSTI4 0
RETI4
ADDRGP4 $243
JUMPV
LABELV $260
line 370
;370:	BotAI_BotInitialChat(bs, "game_enter",
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 52
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 BotRandomOpponentName
CALLP4
ASGNP4
ADDRLP4 60
ADDRGP4 BotMapTitle
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $262
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 $263
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 377
;371:				EasyClientName(bs->client, name, 32),	// 0
;372:				BotRandomOpponentName(bs),				// 1
;373:				"[invalid var]",						// 2
;374:				"[invalid var]",						// 3
;375:				BotMapTitle(),							// 4
;376:				NULL);
;377:	bs->lastchat_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 378
;378:	bs->chatto = CHAT_ALL;
ADDRFP4 0
INDIRP4
CNSTI4 6052
ADDP4
CNSTI4 0
ASGNI4
line 379
;379:	return qtrue;
CNSTI4 1
RETI4
LABELV $243
endproc BotChat_EnterGame 68 32
export BotChat_ExitGame
proc BotChat_ExitGame 64 32
line 387
;380:}
;381:
;382:/*
;383:==================
;384:BotChat_ExitGame
;385:==================
;386:*/
;387:int BotChat_ExitGame(bot_state_t *bs) {
line 391
;388:	char name[32];
;389:	float rnd;
;390:
;391:	if (bot_nochat.integer) return qfalse;
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 0
EQI4 $265
CNSTI4 0
RETI4
ADDRGP4 $264
JUMPV
LABELV $265
line 392
;392:	if (bs->lastchat_time > FloatTime() - TIME_BETWEENCHATTING) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1103626240
SUBF4
LEF4 $268
CNSTI4 0
RETI4
ADDRGP4 $264
JUMPV
LABELV $268
line 394
;393:	//don't chat in teamplay
;394:	if ( TeamPlayIsOn() ) return qfalse;
ADDRLP4 36
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $270
CNSTI4 0
RETI4
ADDRGP4 $264
JUMPV
LABELV $270
line 396
;395:	// don't chat in tournament mode
;396:	if (gametype == GT_DUEL) return qfalse;
ADDRGP4 gametype
INDIRI4
CNSTI4 2
NEI4 $272
CNSTI4 0
RETI4
ADDRGP4 $264
JUMPV
LABELV $272
line 397
;397:	rnd = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CHAT_ENTEREXITGAME, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 27
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 40
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 40
INDIRF4
ASGNF4
line 398
;398:	if (!bot_fastchat.integer) {
ADDRGP4 bot_fastchat+12
INDIRI4
CNSTI4 0
NEI4 $274
line 399
;399:		if (random() > rnd) return qfalse;
ADDRLP4 44
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 0
INDIRF4
LEF4 $277
CNSTI4 0
RETI4
ADDRGP4 $264
JUMPV
LABELV $277
line 400
;400:	}
LABELV $274
line 401
;401:	if (BotNumActivePlayers() <= 1) return qfalse;
ADDRLP4 44
ADDRGP4 BotNumActivePlayers
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 1
GTI4 $279
CNSTI4 0
RETI4
ADDRGP4 $264
JUMPV
LABELV $279
line 403
;402:	//
;403:	BotAI_BotInitialChat(bs, "game_exit",
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 48
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 BotRandomOpponentName
CALLP4
ASGNP4
ADDRLP4 56
ADDRGP4 BotMapTitle
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $281
ARGP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 $263
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 410
;404:				EasyClientName(bs->client, name, 32),	// 0
;405:				BotRandomOpponentName(bs),				// 1
;406:				"[invalid var]",						// 2
;407:				"[invalid var]",						// 3
;408:				BotMapTitle(),							// 4
;409:				NULL);
;410:	bs->lastchat_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 411
;411:	bs->chatto = CHAT_ALL;
ADDRFP4 0
INDIRP4
CNSTI4 6052
ADDP4
CNSTI4 0
ASGNI4
line 412
;412:	return qtrue;
CNSTI4 1
RETI4
LABELV $264
endproc BotChat_ExitGame 64 32
export BotChat_StartLevel
proc BotChat_StartLevel 56 16
line 420
;413:}
;414:
;415:/*
;416:==================
;417:BotChat_StartLevel
;418:==================
;419:*/
;420:int BotChat_StartLevel(bot_state_t *bs) {
line 424
;421:	char name[32];
;422:	float rnd;
;423:
;424:	if (bot_nochat.integer) return qfalse;
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 0
EQI4 $283
CNSTI4 0
RETI4
ADDRGP4 $282
JUMPV
LABELV $283
line 425
;425:	if (BotIsObserver(bs)) return qfalse;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 BotIsObserver
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $286
CNSTI4 0
RETI4
ADDRGP4 $282
JUMPV
LABELV $286
line 426
;426:	if (bs->lastchat_time > FloatTime() - TIME_BETWEENCHATTING) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1103626240
SUBF4
LEF4 $288
CNSTI4 0
RETI4
ADDRGP4 $282
JUMPV
LABELV $288
line 428
;427:	//don't chat in teamplay
;428:	if ( TeamPlayIsOn() ) {
ADDRLP4 40
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $290
line 429
;429:	    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $282
JUMPV
LABELV $290
line 432
;430:	}
;431:	// don't chat in tournament mode
;432:	if (gametype == GT_DUEL) return qfalse;
ADDRGP4 gametype
INDIRI4
CNSTI4 2
NEI4 $292
CNSTI4 0
RETI4
ADDRGP4 $282
JUMPV
LABELV $292
line 433
;433:	rnd = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CHAT_STARTENDLEVEL, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 26
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 44
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 44
INDIRF4
ASGNF4
line 434
;434:	if (!bot_fastchat.integer) {
ADDRGP4 bot_fastchat+12
INDIRI4
CNSTI4 0
NEI4 $294
line 435
;435:		if (random() > rnd) return qfalse;
ADDRLP4 48
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 0
INDIRF4
LEF4 $297
CNSTI4 0
RETI4
ADDRGP4 $282
JUMPV
LABELV $297
line 436
;436:	}
LABELV $294
line 437
;437:	if (BotNumActivePlayers() <= 1) return qfalse;
ADDRLP4 48
ADDRGP4 BotNumActivePlayers
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 1
GTI4 $299
CNSTI4 0
RETI4
ADDRGP4 $282
JUMPV
LABELV $299
line 438
;438:	BotAI_BotInitialChat(bs, "level_start",
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 52
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $301
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 441
;439:				EasyClientName(bs->client, name, 32),	// 0
;440:				NULL);
;441:	bs->lastchat_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 442
;442:	bs->chatto = CHAT_ALL;
ADDRFP4 0
INDIRP4
CNSTI4 6052
ADDP4
CNSTI4 0
ASGNI4
line 443
;443:	return qtrue;
CNSTI4 1
RETI4
LABELV $282
endproc BotChat_StartLevel 56 16
export BotChat_EndLevel
proc BotChat_EndLevel 80 32
line 451
;444:}
;445:
;446:/*
;447:==================
;448:BotChat_EndLevel
;449:==================
;450:*/
;451:int BotChat_EndLevel(bot_state_t *bs) {
line 455
;452:	char name[32];
;453:	float rnd;
;454:
;455:	if (bot_nochat.integer) return qfalse;
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 0
EQI4 $303
CNSTI4 0
RETI4
ADDRGP4 $302
JUMPV
LABELV $303
line 456
;456:	if (BotIsObserver(bs)) return qfalse;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 BotIsObserver
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $306
CNSTI4 0
RETI4
ADDRGP4 $302
JUMPV
LABELV $306
line 457
;457:	if (bs->lastchat_time > FloatTime() - TIME_BETWEENCHATTING) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1103626240
SUBF4
LEF4 $308
CNSTI4 0
RETI4
ADDRGP4 $302
JUMPV
LABELV $308
line 459
;458:	// teamplay
;459:	if ( TeamPlayIsOn() ) {
ADDRLP4 40
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $310
line 460
;460:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $302
JUMPV
LABELV $310
line 463
;461:	}
;462:	// don't chat in tournament mode
;463:	if (gametype == GT_DUEL) return qfalse;
ADDRGP4 gametype
INDIRI4
CNSTI4 2
NEI4 $312
CNSTI4 0
RETI4
ADDRGP4 $302
JUMPV
LABELV $312
line 464
;464:	rnd = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CHAT_STARTENDLEVEL, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 26
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 44
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 44
INDIRF4
ASGNF4
line 465
;465:	if (!bot_fastchat.integer) {
ADDRGP4 bot_fastchat+12
INDIRI4
CNSTI4 0
NEI4 $314
line 466
;466:		if (random() > rnd) return qfalse;
ADDRLP4 48
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 0
INDIRF4
LEF4 $317
CNSTI4 0
RETI4
ADDRGP4 $302
JUMPV
LABELV $317
line 467
;467:	}
LABELV $314
line 468
;468:	if (BotNumActivePlayers() <= 1) return qfalse;
ADDRLP4 48
ADDRGP4 BotNumActivePlayers
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 1
GTI4 $319
CNSTI4 0
RETI4
ADDRGP4 $302
JUMPV
LABELV $319
line 470
;469:	//
;470:	if (BotIsFirstInRankings(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 BotIsFirstInRankings
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $321
line 471
;471:		BotAI_BotInitialChat(bs, "level_end_victory",
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 56
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 BotRandomOpponentName
CALLP4
ASGNP4
ADDRLP4 64
ADDRGP4 BotLastClientInRankings
CALLP4
ASGNP4
ADDRLP4 68
ADDRGP4 BotMapTitle
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $323
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 $263
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 478
;472:				EasyClientName(bs->client, name, 32),	// 0
;473:				BotRandomOpponentName(bs),				// 1
;474:				"[invalid var]",						// 2
;475:				BotLastClientInRankings(),				// 3
;476:				BotMapTitle(),							// 4
;477:				NULL);
;478:	}
ADDRGP4 $322
JUMPV
LABELV $321
line 479
;479:	else if (BotIsLastInRankings(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 BotIsLastInRankings
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $324
line 480
;480:		BotAI_BotInitialChat(bs, "level_end_lose",
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 60
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 BotRandomOpponentName
CALLP4
ASGNP4
ADDRLP4 68
ADDRGP4 BotFirstClientInRankings
CALLP4
ASGNP4
ADDRLP4 72
ADDRGP4 BotMapTitle
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $326
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 $263
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 487
;481:				EasyClientName(bs->client, name, 32),	// 0
;482:				BotRandomOpponentName(bs),				// 1
;483:				BotFirstClientInRankings(),				// 2
;484:				"[invalid var]",						// 3
;485:				BotMapTitle(),							// 4
;486:				NULL);
;487:	}
ADDRGP4 $325
JUMPV
LABELV $324
line 488
;488:	else {
line 489
;489:		BotAI_BotInitialChat(bs, "level_end",
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 60
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 BotRandomOpponentName
CALLP4
ASGNP4
ADDRLP4 68
ADDRGP4 BotFirstClientInRankings
CALLP4
ASGNP4
ADDRLP4 72
ADDRGP4 BotLastClientInRankings
CALLP4
ASGNP4
ADDRLP4 76
ADDRGP4 BotMapTitle
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $327
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 496
;490:				EasyClientName(bs->client, name, 32),	// 0
;491:				BotRandomOpponentName(bs),				// 1
;492:				BotFirstClientInRankings(),				// 2
;493:				BotLastClientInRankings(),				// 3
;494:				BotMapTitle(),							// 4
;495:				NULL);
;496:	}
LABELV $325
LABELV $322
line 497
;497:	bs->lastchat_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 498
;498:	bs->chatto = CHAT_ALL;
ADDRFP4 0
INDIRP4
CNSTI4 6052
ADDP4
CNSTI4 0
ASGNI4
line 499
;499:	return qtrue;
CNSTI4 1
RETI4
LABELV $302
endproc BotChat_EndLevel 80 32
export BotChat_Death
proc BotChat_Death 116 20
line 507
;500:}
;501:
;502:/*
;503:==================
;504:BotChat_Death
;505:==================
;506:*/
;507:int BotChat_Death(bot_state_t *bs) {
line 511
;508:	char name[32];
;509:	float rnd;
;510:
;511:	if (bot_nochat.integer) return qfalse;
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 0
EQI4 $329
CNSTI4 0
RETI4
ADDRGP4 $328
JUMPV
LABELV $329
line 512
;512:	if (bs->lastchat_time > FloatTime() - TIME_BETWEENCHATTING) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1103626240
SUBF4
LEF4 $332
CNSTI4 0
RETI4
ADDRGP4 $328
JUMPV
LABELV $332
line 513
;513:	rnd = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CHAT_DEATH, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 29
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 36
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 32
ADDRLP4 36
INDIRF4
ASGNF4
line 515
;514:	// don't chat in tournament mode
;515:	if (gametype == GT_DUEL) return qfalse;
ADDRGP4 gametype
INDIRI4
CNSTI4 2
NEI4 $334
CNSTI4 0
RETI4
ADDRGP4 $328
JUMPV
LABELV $334
line 517
;516:	//if fast chatting is off
;517:	if (!bot_fastchat.integer) {
ADDRGP4 bot_fastchat+12
INDIRI4
CNSTI4 0
NEI4 $336
line 518
;518:		if (random() > rnd) return qfalse;
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 32
INDIRF4
LEF4 $339
CNSTI4 0
RETI4
ADDRGP4 $328
JUMPV
LABELV $339
line 519
;519:	}
LABELV $336
line 520
;520:	if (BotNumActivePlayers() <= 1) return qfalse;
ADDRLP4 40
ADDRGP4 BotNumActivePlayers
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 1
GTI4 $341
CNSTI4 0
RETI4
ADDRGP4 $328
JUMPV
LABELV $341
line 522
;521:	//
;522:	if (bs->lastkilledby >= 0 && bs->lastkilledby < MAX_CLIENTS)
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 5996
ADDP4
INDIRI4
CNSTI4 0
LTI4 $343
ADDRLP4 44
INDIRP4
CNSTI4 5996
ADDP4
INDIRI4
CNSTI4 64
GEI4 $343
line 523
;523:		EasyClientName(bs->lastkilledby, name, 32);
ADDRFP4 0
INDIRP4
CNSTI4 5996
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
ADDRGP4 $344
JUMPV
LABELV $343
line 525
;524:	else
;525:		strcpy(name, "[world]");
ADDRLP4 0
ARGP4
ADDRGP4 $345
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $344
line 527
;526:	//
;527:	if (TeamPlayIsOn() && BotSameTeam(bs, bs->lastkilledby)) {
ADDRLP4 48
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $346
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
CNSTI4 5996
ADDP4
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $346
line 528
;528:		if (bs->lastkilledby == bs->client) return qfalse;
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 5996
ADDP4
INDIRI4
ADDRLP4 60
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $348
CNSTI4 0
RETI4
ADDRGP4 $328
JUMPV
LABELV $348
line 529
;529:		BotAI_BotInitialChat(bs, "death_teammate", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $350
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 530
;530:		bs->chatto = CHAT_TEAM;
ADDRFP4 0
INDIRP4
CNSTI4 6052
ADDP4
CNSTI4 1
ASGNI4
line 531
;531:	}
ADDRGP4 $347
JUMPV
LABELV $346
line 533
;532:	else
;533:	{
line 535
;534:		//teamplay
;535:		if ( TeamPlayIsOn() ) {
ADDRLP4 60
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $351
line 536
;536:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $328
JUMPV
LABELV $351
line 539
;537:		}
;538:		//
;539:		if (bs->botdeathtype == MOD_WATER)
ADDRFP4 0
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
CNSTI4 14
NEI4 $353
line 540
;540:			BotAI_BotInitialChat(bs, "death_drown", BotRandomOpponentName(bs), NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 BotRandomOpponentName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $355
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
ADDRGP4 $354
JUMPV
LABELV $353
line 541
;541:		else if (bs->botdeathtype == MOD_SLIME)
ADDRFP4 0
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
CNSTI4 15
NEI4 $356
line 542
;542:			BotAI_BotInitialChat(bs, "death_slime", BotRandomOpponentName(bs), NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 BotRandomOpponentName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $358
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
ADDRGP4 $357
JUMPV
LABELV $356
line 543
;543:		else if (bs->botdeathtype == MOD_LAVA)
ADDRFP4 0
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
CNSTI4 16
NEI4 $359
line 544
;544:			BotAI_BotInitialChat(bs, "death_lava", BotRandomOpponentName(bs), NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 BotRandomOpponentName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $361
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
ADDRGP4 $360
JUMPV
LABELV $359
line 545
;545:		else if (bs->botdeathtype == MOD_FALLING)
ADDRFP4 0
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
CNSTI4 19
NEI4 $362
line 546
;546:			BotAI_BotInitialChat(bs, "death_cratered", BotRandomOpponentName(bs), NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 BotRandomOpponentName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $364
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
ADDRGP4 $363
JUMPV
LABELV $362
line 547
;547:		else if (bs->botsuicide || //all other suicides by own weapon
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 6008
ADDP4
INDIRI4
CNSTI4 0
NEI4 $371
ADDRLP4 80
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
CNSTI4 17
EQI4 $371
ADDRLP4 80
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
CNSTI4 20
EQI4 $371
ADDRLP4 80
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
CNSTI4 21
EQI4 $371
ADDRLP4 80
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
CNSTI4 22
EQI4 $371
ADDRLP4 80
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
CNSTI4 0
NEI4 $365
LABELV $371
line 553
;548:				bs->botdeathtype == MOD_CRUSH ||
;549:				bs->botdeathtype == MOD_SUICIDE ||
;550:				bs->botdeathtype == MOD_TARGET_LASER ||
;551:				bs->botdeathtype == MOD_TRIGGER_HURT ||
;552:				bs->botdeathtype == MOD_UNKNOWN)
;553:			BotAI_BotInitialChat(bs, "death_suicide", BotRandomOpponentName(bs), NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 84
ADDRGP4 BotRandomOpponentName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $372
ARGP4
ADDRLP4 84
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
ADDRGP4 $366
JUMPV
LABELV $365
line 554
;554:		else if (bs->botdeathtype == MOD_TELEFRAG)
ADDRFP4 0
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
CNSTI4 18
NEI4 $373
line 555
;555:			BotAI_BotInitialChat(bs, "death_telefrag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $375
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
ADDRGP4 $374
JUMPV
LABELV $373
line 556
;556:		else if (bs->botdeathtype == MOD_KAMIKAZE && trap_BotNumInitialChats(bs->cs, "death_kamikaze"))
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
CNSTI4 26
NEI4 $376
ADDRLP4 88
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $378
ARGP4
ADDRLP4 92
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
EQI4 $376
line 557
;557:			BotAI_BotInitialChat(bs, "death_kamikaze", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $378
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
ADDRGP4 $377
JUMPV
LABELV $376
line 558
;558:		else {
line 559
;559:			if ((bs->botdeathtype == MOD_GAUNTLET ||
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
CNSTI4 2
EQI4 $383
ADDRLP4 96
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
CNSTI4 10
EQI4 $383
ADDRLP4 96
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
CNSTI4 12
EQI4 $383
ADDRLP4 96
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
CNSTI4 13
NEI4 $379
LABELV $383
ADDRLP4 100
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
GEF4 $379
line 562
;560:				bs->botdeathtype == MOD_RAILGUN ||
;561:				bs->botdeathtype == MOD_BFG ||
;562:				bs->botdeathtype == MOD_BFG_SPLASH) && random() < 0.5) {
line 564
;563:
;564:				if (bs->botdeathtype == MOD_GAUNTLET)
ADDRFP4 0
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
CNSTI4 2
NEI4 $384
line 565
;565:					BotAI_BotInitialChat(bs, "death_gauntlet",
ADDRFP4 0
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
ARGI4
ADDRLP4 104
ADDRGP4 BotWeaponNameForMeansOfDeath
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $386
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 104
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
ADDRGP4 $380
JUMPV
LABELV $384
line 569
;566:							name,												// 0
;567:							BotWeaponNameForMeansOfDeath(bs->botdeathtype),		// 1
;568:							NULL);
;569:				else if (bs->botdeathtype == MOD_RAILGUN)
ADDRFP4 0
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
CNSTI4 10
NEI4 $387
line 570
;570:					BotAI_BotInitialChat(bs, "death_rail",
ADDRFP4 0
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
ARGI4
ADDRLP4 108
ADDRGP4 BotWeaponNameForMeansOfDeath
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $389
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 108
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
ADDRGP4 $380
JUMPV
LABELV $387
line 575
;571:							name,												// 0
;572:							BotWeaponNameForMeansOfDeath(bs->botdeathtype),		// 1
;573:							NULL);
;574:				else
;575:					BotAI_BotInitialChat(bs, "death_bfg",
ADDRFP4 0
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
ARGI4
ADDRLP4 112
ADDRGP4 BotWeaponNameForMeansOfDeath
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $390
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 112
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 579
;576:							name,												// 0
;577:							BotWeaponNameForMeansOfDeath(bs->botdeathtype),		// 1
;578:							NULL);
;579:			}
ADDRGP4 $380
JUMPV
LABELV $379
line 581
;580:			//choose between insult and praise
;581:			else if (random() < trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CHAT_INSULT, 0, 1)) {
ADDRLP4 104
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 24
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 108
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 104
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 108
INDIRF4
GEF4 $391
line 582
;582:				BotAI_BotInitialChat(bs, "death_insult",
ADDRFP4 0
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
ARGI4
ADDRLP4 112
ADDRGP4 BotWeaponNameForMeansOfDeath
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $393
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 112
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 586
;583:							name,												// 0
;584:							BotWeaponNameForMeansOfDeath(bs->botdeathtype),		// 1
;585:							NULL);
;586:			}
ADDRGP4 $392
JUMPV
LABELV $391
line 587
;587:			else {
line 588
;588:				BotAI_BotInitialChat(bs, "death_praise",
ADDRFP4 0
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
ARGI4
ADDRLP4 112
ADDRGP4 BotWeaponNameForMeansOfDeath
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $394
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 112
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 592
;589:							name,												// 0
;590:							BotWeaponNameForMeansOfDeath(bs->botdeathtype),		// 1
;591:							NULL);
;592:			}
LABELV $392
LABELV $380
line 593
;593:		}
LABELV $377
LABELV $374
LABELV $366
LABELV $363
LABELV $360
LABELV $357
LABELV $354
line 594
;594:		bs->chatto = CHAT_ALL;
ADDRFP4 0
INDIRP4
CNSTI4 6052
ADDP4
CNSTI4 0
ASGNI4
line 595
;595:	}
LABELV $347
line 596
;596:	bs->lastchat_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 597
;597:	return qtrue;
CNSTI4 1
RETI4
LABELV $328
endproc BotChat_Death 116 20
export BotChat_Kill
proc BotChat_Kill 88 16
line 605
;598:}
;599:
;600:/*
;601:==================
;602:BotChat_Kill
;603:==================
;604:*/
;605:int BotChat_Kill(bot_state_t *bs) {
line 609
;606:	char name[32];
;607:	float rnd;
;608:
;609:	if (bot_nochat.integer) return qfalse;
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 0
EQI4 $396
CNSTI4 0
RETI4
ADDRGP4 $395
JUMPV
LABELV $396
line 610
;610:	if (bs->lastchat_time > FloatTime() - TIME_BETWEENCHATTING) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1103626240
SUBF4
LEF4 $399
CNSTI4 0
RETI4
ADDRGP4 $395
JUMPV
LABELV $399
line 611
;611:	rnd = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CHAT_KILL, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 28
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 36
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 32
ADDRLP4 36
INDIRF4
ASGNF4
line 613
;612:	// don't chat in tournament mode
;613:	if (gametype == GT_DUEL) return qfalse;
ADDRGP4 gametype
INDIRI4
CNSTI4 2
NEI4 $401
CNSTI4 0
RETI4
ADDRGP4 $395
JUMPV
LABELV $401
line 615
;614:	//if fast chat is off
;615:	if (!bot_fastchat.integer) {
ADDRGP4 bot_fastchat+12
INDIRI4
CNSTI4 0
NEI4 $403
line 616
;616:		if (random() > rnd) return qfalse;
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 32
INDIRF4
LEF4 $406
CNSTI4 0
RETI4
ADDRGP4 $395
JUMPV
LABELV $406
line 617
;617:	}
LABELV $403
line 618
;618:	if (bs->lastkilledplayer == bs->client) return qfalse;
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 5992
ADDP4
INDIRI4
ADDRLP4 40
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $408
CNSTI4 0
RETI4
ADDRGP4 $395
JUMPV
LABELV $408
line 619
;619:	if (BotNumActivePlayers() <= 1) return qfalse;
ADDRLP4 44
ADDRGP4 BotNumActivePlayers
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 1
GTI4 $410
CNSTI4 0
RETI4
ADDRGP4 $395
JUMPV
LABELV $410
line 620
;620:	if (!BotValidChatPosition(bs)) return qfalse;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 BotValidChatPosition
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $412
CNSTI4 0
RETI4
ADDRGP4 $395
JUMPV
LABELV $412
line 622
;621:	//
;622:	if (BotVisibleEnemies(bs)) return qfalse;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 BotVisibleEnemies
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $414
CNSTI4 0
RETI4
ADDRGP4 $395
JUMPV
LABELV $414
line 624
;623:	//
;624:	EasyClientName(bs->lastkilledplayer, name, 32);
ADDRFP4 0
INDIRP4
CNSTI4 5992
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 626
;625:	//
;626:	bs->chatto = CHAT_ALL;
ADDRFP4 0
INDIRP4
CNSTI4 6052
ADDP4
CNSTI4 0
ASGNI4
line 627
;627:	if (TeamPlayIsOn() && BotSameTeam(bs, bs->lastkilledplayer)) {
ADDRLP4 56
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $416
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 5992
ADDP4
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $416
line 628
;628:		BotAI_BotInitialChat(bs, "kill_teammate", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $418
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 629
;629:		bs->chatto = CHAT_TEAM;
ADDRFP4 0
INDIRP4
CNSTI4 6052
ADDP4
CNSTI4 1
ASGNI4
line 630
;630:	}
ADDRGP4 $417
JUMPV
LABELV $416
line 632
;631:	else
;632:	{
line 634
;633:		//don't chat in teamplay
;634:		if ( TeamPlayIsOn() ) {
ADDRLP4 68
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $419
line 635
;635:			return qfalse;			// don't wait
CNSTI4 0
RETI4
ADDRGP4 $395
JUMPV
LABELV $419
line 638
;636:		}
;637:		//
;638:		if (bs->enemydeathtype == MOD_GAUNTLET) {
ADDRFP4 0
INDIRP4
CNSTI4 6004
ADDP4
INDIRI4
CNSTI4 2
NEI4 $421
line 639
;639:			BotAI_BotInitialChat(bs, "kill_gauntlet", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $423
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 640
;640:		}
ADDRGP4 $422
JUMPV
LABELV $421
line 641
;641:		else if (bs->enemydeathtype == MOD_RAILGUN) {
ADDRFP4 0
INDIRP4
CNSTI4 6004
ADDP4
INDIRI4
CNSTI4 10
NEI4 $424
line 642
;642:			BotAI_BotInitialChat(bs, "kill_rail", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $426
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 643
;643:		}
ADDRGP4 $425
JUMPV
LABELV $424
line 644
;644:		else if (bs->enemydeathtype == MOD_TELEFRAG) {
ADDRFP4 0
INDIRP4
CNSTI4 6004
ADDP4
INDIRI4
CNSTI4 18
NEI4 $427
line 645
;645:			BotAI_BotInitialChat(bs, "kill_telefrag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $429
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 646
;646:		}
ADDRGP4 $428
JUMPV
LABELV $427
line 647
;647:		else if (bs->botdeathtype == MOD_KAMIKAZE && trap_BotNumInitialChats(bs->cs, "kill_kamikaze"))
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
CNSTI4 26
NEI4 $430
ADDRLP4 72
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $432
ARGP4
ADDRLP4 76
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $430
line 648
;648:			BotAI_BotInitialChat(bs, "kill_kamikaze", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $432
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
ADDRGP4 $431
JUMPV
LABELV $430
line 650
;649:		//choose between insult and praise
;650:		else if (random() < trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CHAT_INSULT, 0, 1)) {
ADDRLP4 80
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 24
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 84
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 80
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 84
INDIRF4
GEF4 $433
line 651
;651:			BotAI_BotInitialChat(bs, "kill_insult", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $435
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 652
;652:		}
ADDRGP4 $434
JUMPV
LABELV $433
line 653
;653:		else {
line 654
;654:			BotAI_BotInitialChat(bs, "kill_praise", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $436
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 655
;655:		}
LABELV $434
LABELV $431
LABELV $428
LABELV $425
LABELV $422
line 656
;656:	}
LABELV $417
line 657
;657:	bs->lastchat_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 658
;658:	return qtrue;
CNSTI4 1
RETI4
LABELV $395
endproc BotChat_Kill 88 16
export BotChat_EnemySuicide
proc BotChat_EnemySuicide 56 16
line 666
;659:}
;660:
;661:/*
;662:==================
;663:BotChat_EnemySuicide
;664:==================
;665:*/
;666:int BotChat_EnemySuicide(bot_state_t *bs) {
line 670
;667:	char name[32];
;668:	float rnd;
;669:
;670:	if (bot_nochat.integer) return qfalse;
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 0
EQI4 $438
CNSTI4 0
RETI4
ADDRGP4 $437
JUMPV
LABELV $438
line 671
;671:	if (bs->lastchat_time > FloatTime() - TIME_BETWEENCHATTING) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1103626240
SUBF4
LEF4 $441
CNSTI4 0
RETI4
ADDRGP4 $437
JUMPV
LABELV $441
line 672
;672:	if (BotNumActivePlayers() <= 1) return qfalse;
ADDRLP4 36
ADDRGP4 BotNumActivePlayers
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 1
GTI4 $443
CNSTI4 0
RETI4
ADDRGP4 $437
JUMPV
LABELV $443
line 674
;673:	//
;674:	rnd = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CHAT_ENEMYSUICIDE, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 30
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 40
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 32
ADDRLP4 40
INDIRF4
ASGNF4
line 676
;675:	//don't chat in teamplay
;676:	if ( TeamPlayIsOn() ) return qfalse;
ADDRLP4 44
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $445
CNSTI4 0
RETI4
ADDRGP4 $437
JUMPV
LABELV $445
line 678
;677:	// don't chat in tournament mode
;678:	if (gametype == GT_DUEL) return qfalse;
ADDRGP4 gametype
INDIRI4
CNSTI4 2
NEI4 $447
CNSTI4 0
RETI4
ADDRGP4 $437
JUMPV
LABELV $447
line 680
;679:	//if fast chat is off
;680:	if (!bot_fastchat.integer) {
ADDRGP4 bot_fastchat+12
INDIRI4
CNSTI4 0
NEI4 $449
line 681
;681:		if (random() > rnd) return qfalse;
ADDRLP4 48
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 32
INDIRF4
LEF4 $452
CNSTI4 0
RETI4
ADDRGP4 $437
JUMPV
LABELV $452
line 682
;682:	}
LABELV $449
line 683
;683:	if (!BotValidChatPosition(bs)) return qfalse;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 BotValidChatPosition
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $454
CNSTI4 0
RETI4
ADDRGP4 $437
JUMPV
LABELV $454
line 685
;684:	//
;685:	if (BotVisibleEnemies(bs)) return qfalse;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 BotVisibleEnemies
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $456
CNSTI4 0
RETI4
ADDRGP4 $437
JUMPV
LABELV $456
line 687
;686:	//
;687:	if (bs->enemy >= 0) EasyClientName(bs->enemy, name, 32);
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 0
LTI4 $458
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
ADDRGP4 $459
JUMPV
LABELV $458
line 688
;688:	else strcpy(name, "");
ADDRLP4 0
ARGP4
ADDRGP4 $460
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $459
line 689
;689:	BotAI_BotInitialChat(bs, "enemy_suicide", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $461
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 690
;690:	bs->lastchat_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 691
;691:	bs->chatto = CHAT_ALL;
ADDRFP4 0
INDIRP4
CNSTI4 6052
ADDP4
CNSTI4 0
ASGNI4
line 692
;692:	return qtrue;
CNSTI4 1
RETI4
LABELV $437
endproc BotChat_EnemySuicide 56 16
export BotChat_HitTalking
proc BotChat_HitTalking 68 20
line 700
;693:}
;694:
;695:/*
;696:==================
;697:BotChat_HitTalking
;698:==================
;699:*/
;700:int BotChat_HitTalking(bot_state_t *bs) {
line 705
;701:	char name[32], *weap;
;702:	int lasthurt_client;
;703:	float rnd;
;704:
;705:	if (bot_nochat.integer) return qfalse;
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 0
EQI4 $463
CNSTI4 0
RETI4
ADDRGP4 $462
JUMPV
LABELV $463
line 706
;706:	if (bs->lastchat_time > FloatTime() - TIME_BETWEENCHATTING) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1103626240
SUBF4
LEF4 $466
CNSTI4 0
RETI4
ADDRGP4 $462
JUMPV
LABELV $466
line 707
;707:	if (BotNumActivePlayers() <= 1) return qfalse;
ADDRLP4 44
ADDRGP4 BotNumActivePlayers
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 1
GTI4 $468
CNSTI4 0
RETI4
ADDRGP4 $462
JUMPV
LABELV $468
line 708
;708:	lasthurt_client = g_entities[bs->client].client->lasthurt_client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ASGNI4
line 709
;709:	if (!lasthurt_client) return qfalse;
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $471
CNSTI4 0
RETI4
ADDRGP4 $462
JUMPV
LABELV $471
line 710
;710:	if (lasthurt_client == bs->client) return qfalse;
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $473
CNSTI4 0
RETI4
ADDRGP4 $462
JUMPV
LABELV $473
line 712
;711:	//
;712:	if (lasthurt_client < 0 || lasthurt_client >= MAX_CLIENTS) return qfalse;
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $477
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $475
LABELV $477
CNSTI4 0
RETI4
ADDRGP4 $462
JUMPV
LABELV $475
line 714
;713:	//
;714:	rnd = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CHAT_HITTALKING, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 31
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 52
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 52
INDIRF4
ASGNF4
line 716
;715:	//don't chat in teamplay
;716:	if ( TeamPlayIsOn() ) return qfalse;
ADDRLP4 56
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $478
CNSTI4 0
RETI4
ADDRGP4 $462
JUMPV
LABELV $478
line 718
;717:	// don't chat in tournament mode
;718:	if (gametype == GT_DUEL) return qfalse;
ADDRGP4 gametype
INDIRI4
CNSTI4 2
NEI4 $480
CNSTI4 0
RETI4
ADDRGP4 $462
JUMPV
LABELV $480
line 720
;719:	//if fast chat is off
;720:	if (!bot_fastchat.integer) {
ADDRGP4 bot_fastchat+12
INDIRI4
CNSTI4 0
NEI4 $482
line 721
;721:		if (random() > rnd * 0.5) return qfalse;
ADDRLP4 60
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 40
INDIRF4
CNSTF4 1056964608
MULF4
LEF4 $485
CNSTI4 0
RETI4
ADDRGP4 $462
JUMPV
LABELV $485
line 722
;722:	}
LABELV $482
line 723
;723:	if (!BotValidChatPosition(bs)) return qfalse;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 BotValidChatPosition
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
NEI4 $487
CNSTI4 0
RETI4
ADDRGP4 $462
JUMPV
LABELV $487
line 725
;724:	//
;725:	ClientName(g_entities[bs->client].client->lasthurt_client, name, sizeof(name));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 726
;726:	weap = BotWeaponNameForMeansOfDeath(g_entities[bs->client].client->lasthurt_mod);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 BotWeaponNameForMeansOfDeath
CALLP4
ASGNP4
ADDRLP4 36
ADDRLP4 64
INDIRP4
ASGNP4
line 728
;727:	//
;728:	BotAI_BotInitialChat(bs, "hit_talking", name, weap, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $491
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 729
;729:	bs->lastchat_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 730
;730:	bs->chatto = CHAT_ALL;
ADDRFP4 0
INDIRP4
CNSTI4 6052
ADDP4
CNSTI4 0
ASGNI4
line 731
;731:	return qtrue;
CNSTI4 1
RETI4
LABELV $462
endproc BotChat_HitTalking 68 20
export BotChat_HitNoDeath
proc BotChat_HitNoDeath 216 20
line 739
;732:}
;733:
;734:/*
;735:==================
;736:BotChat_HitNoDeath
;737:==================
;738:*/
;739:int BotChat_HitNoDeath(bot_state_t *bs) {
line 745
;740:	char name[32], *weap;
;741:	float rnd;
;742:	int lasthurt_client;
;743:	aas_entityinfo_t entinfo;
;744:
;745:	lasthurt_client = g_entities[bs->client].client->lasthurt_client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ASGNI4
line 746
;746:	if (!lasthurt_client) return qfalse;
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $494
CNSTI4 0
RETI4
ADDRGP4 $492
JUMPV
LABELV $494
line 747
;747:	if (lasthurt_client == bs->client) return qfalse;
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $496
CNSTI4 0
RETI4
ADDRGP4 $492
JUMPV
LABELV $496
line 749
;748:	//
;749:	if (lasthurt_client < 0 || lasthurt_client >= MAX_CLIENTS) return qfalse;
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $500
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $498
LABELV $500
CNSTI4 0
RETI4
ADDRGP4 $492
JUMPV
LABELV $498
line 751
;750:	//
;751:	if (bot_nochat.integer) return qfalse;
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 0
EQI4 $501
CNSTI4 0
RETI4
ADDRGP4 $492
JUMPV
LABELV $501
line 752
;752:	if (bs->lastchat_time > FloatTime() - TIME_BETWEENCHATTING) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1103626240
SUBF4
LEF4 $504
CNSTI4 0
RETI4
ADDRGP4 $492
JUMPV
LABELV $504
line 753
;753:	if (BotNumActivePlayers() <= 1) return qfalse;
ADDRLP4 188
ADDRGP4 BotNumActivePlayers
CALLI4
ASGNI4
ADDRLP4 188
INDIRI4
CNSTI4 1
GTI4 $506
CNSTI4 0
RETI4
ADDRGP4 $492
JUMPV
LABELV $506
line 754
;754:	rnd = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CHAT_HITNODEATH, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 32
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 192
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 180
ADDRLP4 192
INDIRF4
ASGNF4
line 756
;755:	//don't chat in teamplay
;756:	if ( TeamPlayIsOn() ) return qfalse;
ADDRLP4 196
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 196
INDIRI4
CNSTI4 0
EQI4 $508
CNSTI4 0
RETI4
ADDRGP4 $492
JUMPV
LABELV $508
line 758
;757:	// don't chat in tournament mode
;758:	if (gametype == GT_DUEL) return qfalse;
ADDRGP4 gametype
INDIRI4
CNSTI4 2
NEI4 $510
CNSTI4 0
RETI4
ADDRGP4 $492
JUMPV
LABELV $510
line 760
;759:	//if fast chat is off
;760:	if (!bot_fastchat.integer) {
ADDRGP4 bot_fastchat+12
INDIRI4
CNSTI4 0
NEI4 $512
line 761
;761:		if (random() > rnd * 0.5) return qfalse;
ADDRLP4 200
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 200
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 180
INDIRF4
CNSTF4 1056964608
MULF4
LEF4 $515
CNSTI4 0
RETI4
ADDRGP4 $492
JUMPV
LABELV $515
line 762
;762:	}
LABELV $512
line 763
;763:	if (!BotValidChatPosition(bs)) return qfalse;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 200
ADDRGP4 BotValidChatPosition
CALLI4
ASGNI4
ADDRLP4 200
INDIRI4
CNSTI4 0
NEI4 $517
CNSTI4 0
RETI4
ADDRGP4 $492
JUMPV
LABELV $517
line 765
;764:	//
;765:	if (BotVisibleEnemies(bs)) return qfalse;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 204
ADDRGP4 BotVisibleEnemies
CALLI4
ASGNI4
ADDRLP4 204
INDIRI4
CNSTI4 0
EQI4 $519
CNSTI4 0
RETI4
ADDRGP4 $492
JUMPV
LABELV $519
line 767
;766:	//
;767:	BotEntityInfo(bs->enemy, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 768
;768:	if (EntityIsShooting(&entinfo)) return qfalse;
ADDRLP4 40
ARGP4
ADDRLP4 208
ADDRGP4 EntityIsShooting
CALLI4
ASGNI4
ADDRLP4 208
INDIRI4
CNSTI4 0
EQI4 $521
CNSTI4 0
RETI4
ADDRGP4 $492
JUMPV
LABELV $521
line 770
;769:	//
;770:	ClientName(lasthurt_client, name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 771
;771:	weap = BotWeaponNameForMeansOfDeath(g_entities[bs->client].client->lasthurt_mod);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
ARGI4
ADDRLP4 212
ADDRGP4 BotWeaponNameForMeansOfDeath
CALLP4
ASGNP4
ADDRLP4 36
ADDRLP4 212
INDIRP4
ASGNP4
line 773
;772:	//
;773:	BotAI_BotInitialChat(bs, "hit_nodeath", name, weap, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $524
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 774
;774:	bs->lastchat_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 775
;775:	bs->chatto = CHAT_ALL;
ADDRFP4 0
INDIRP4
CNSTI4 6052
ADDP4
CNSTI4 0
ASGNI4
line 776
;776:	return qtrue;
CNSTI4 1
RETI4
LABELV $492
endproc BotChat_HitNoDeath 216 20
export BotChat_HitNoKill
proc BotChat_HitNoKill 208 20
line 784
;777:}
;778:
;779:/*
;780:==================
;781:BotChat_HitNoKill
;782:==================
;783:*/
;784:int BotChat_HitNoKill(bot_state_t *bs) {
line 789
;785:	char name[32], *weap;
;786:	float rnd;
;787:	aas_entityinfo_t entinfo;
;788:
;789:	if (bot_nochat.integer) return qfalse;
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 0
EQI4 $526
CNSTI4 0
RETI4
ADDRGP4 $525
JUMPV
LABELV $526
line 790
;790:	if (bs->lastchat_time > FloatTime() - TIME_BETWEENCHATTING) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1103626240
SUBF4
LEF4 $529
CNSTI4 0
RETI4
ADDRGP4 $525
JUMPV
LABELV $529
line 791
;791:	if (BotNumActivePlayers() <= 1) return qfalse;
ADDRLP4 180
ADDRGP4 BotNumActivePlayers
CALLI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 1
GTI4 $531
CNSTI4 0
RETI4
ADDRGP4 $525
JUMPV
LABELV $531
line 792
;792:	rnd = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CHAT_HITNOKILL, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 33
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 184
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 176
ADDRLP4 184
INDIRF4
ASGNF4
line 794
;793:	//don't chat in teamplay
;794:	if ( TeamPlayIsOn() ) return qfalse;
ADDRLP4 188
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 188
INDIRI4
CNSTI4 0
EQI4 $533
CNSTI4 0
RETI4
ADDRGP4 $525
JUMPV
LABELV $533
line 796
;795:	// don't chat in tournament mode
;796:	if (gametype == GT_DUEL) return qfalse;
ADDRGP4 gametype
INDIRI4
CNSTI4 2
NEI4 $535
CNSTI4 0
RETI4
ADDRGP4 $525
JUMPV
LABELV $535
line 798
;797:	//if fast chat is off
;798:	if (!bot_fastchat.integer) {
ADDRGP4 bot_fastchat+12
INDIRI4
CNSTI4 0
NEI4 $537
line 799
;799:		if (random() > rnd * 0.5) return qfalse;
ADDRLP4 192
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 192
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 176
INDIRF4
CNSTF4 1056964608
MULF4
LEF4 $540
CNSTI4 0
RETI4
ADDRGP4 $525
JUMPV
LABELV $540
line 800
;800:	}
LABELV $537
line 801
;801:	if (!BotValidChatPosition(bs)) return qfalse;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 192
ADDRGP4 BotValidChatPosition
CALLI4
ASGNI4
ADDRLP4 192
INDIRI4
CNSTI4 0
NEI4 $542
CNSTI4 0
RETI4
ADDRGP4 $525
JUMPV
LABELV $542
line 803
;802:	//
;803:	if (BotVisibleEnemies(bs)) return qfalse;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 196
ADDRGP4 BotVisibleEnemies
CALLI4
ASGNI4
ADDRLP4 196
INDIRI4
CNSTI4 0
EQI4 $544
CNSTI4 0
RETI4
ADDRGP4 $525
JUMPV
LABELV $544
line 805
;804:	//
;805:	BotEntityInfo(bs->enemy, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 806
;806:	if (EntityIsShooting(&entinfo)) return qfalse;
ADDRLP4 36
ARGP4
ADDRLP4 200
ADDRGP4 EntityIsShooting
CALLI4
ASGNI4
ADDRLP4 200
INDIRI4
CNSTI4 0
EQI4 $546
CNSTI4 0
RETI4
ADDRGP4 $525
JUMPV
LABELV $546
line 808
;807:	//
;808:	ClientName(bs->enemy, name, sizeof(name));
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 809
;809:	weap = BotWeaponNameForMeansOfDeath(g_entities[bs->enemy].client->lasthurt_mod);
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
ARGI4
ADDRLP4 204
ADDRGP4 BotWeaponNameForMeansOfDeath
CALLP4
ASGNP4
ADDRLP4 32
ADDRLP4 204
INDIRP4
ASGNP4
line 811
;810:	//
;811:	BotAI_BotInitialChat(bs, "hit_nokill", name, weap, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $549
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 812
;812:	bs->lastchat_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 813
;813:	bs->chatto = CHAT_ALL;
ADDRFP4 0
INDIRP4
CNSTI4 6052
ADDP4
CNSTI4 0
ASGNI4
line 814
;814:	return qtrue;
CNSTI4 1
RETI4
LABELV $525
endproc BotChat_HitNoKill 208 20
export BotChat_Random
proc BotChat_Random 96 36
line 822
;815:}
;816:
;817:/*
;818:==================
;819:BotChat_Random
;820:==================
;821:*/
;822:int BotChat_Random(bot_state_t *bs) {
line 826
;823:	float rnd;
;824:	char name[32];
;825:
;826:	if (bot_nochat.integer) return qfalse;
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 0
EQI4 $551
CNSTI4 0
RETI4
ADDRGP4 $550
JUMPV
LABELV $551
line 827
;827:	if (BotIsObserver(bs)) return qfalse;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 BotIsObserver
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $554
CNSTI4 0
RETI4
ADDRGP4 $550
JUMPV
LABELV $554
line 828
;828:	if (bs->lastchat_time > FloatTime() - TIME_BETWEENCHATTING) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1103626240
SUBF4
LEF4 $556
CNSTI4 0
RETI4
ADDRGP4 $550
JUMPV
LABELV $556
line 830
;829:	// don't chat in tournament mode
;830:	if (gametype == GT_DUEL) return qfalse;
ADDRGP4 gametype
INDIRI4
CNSTI4 2
NEI4 $558
CNSTI4 0
RETI4
ADDRGP4 $550
JUMPV
LABELV $558
line 832
;831:	//don't chat when doing something important :)
;832:	if (bs->ltgtype == LTG_TEAMHELP ||
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 1
EQI4 $563
ADDRLP4 40
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 2
EQI4 $563
ADDRLP4 40
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 5
NEI4 $560
LABELV $563
line 834
;833:		bs->ltgtype == LTG_TEAMACCOMPANY ||
;834:		bs->ltgtype == LTG_RUSHBASE) return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $550
JUMPV
LABELV $560
line 836
;835:	//
;836:	rnd = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CHAT_RANDOM, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 34
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 44
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 32
ADDRLP4 44
INDIRF4
ASGNF4
line 837
;837:	if (random() > bs->thinktime * 0.1) return qfalse;
ADDRLP4 48
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 4904
ADDP4
INDIRF4
CNSTF4 1036831949
MULF4
LEF4 $564
CNSTI4 0
RETI4
ADDRGP4 $550
JUMPV
LABELV $564
line 838
;838:	if (!bot_fastchat.integer) {
ADDRGP4 bot_fastchat+12
INDIRI4
CNSTI4 0
NEI4 $566
line 839
;839:		if (random() > rnd) return qfalse;
ADDRLP4 52
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 32
INDIRF4
LEF4 $569
CNSTI4 0
RETI4
ADDRGP4 $550
JUMPV
LABELV $569
line 840
;840:		if (random() > 0.25) return qfalse;
ADDRLP4 56
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1048576000
LEF4 $571
CNSTI4 0
RETI4
ADDRGP4 $550
JUMPV
LABELV $571
line 841
;841:	}
LABELV $566
line 842
;842:	if (BotNumActivePlayers() <= 1) return qfalse;
ADDRLP4 52
ADDRGP4 BotNumActivePlayers
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 1
GTI4 $573
CNSTI4 0
RETI4
ADDRGP4 $550
JUMPV
LABELV $573
line 844
;843:	//
;844:	if (!BotValidChatPosition(bs)) return qfalse;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 BotValidChatPosition
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $575
CNSTI4 0
RETI4
ADDRGP4 $550
JUMPV
LABELV $575
line 846
;845:	//
;846:	if (BotVisibleEnemies(bs)) return qfalse;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 BotVisibleEnemies
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $577
CNSTI4 0
RETI4
ADDRGP4 $550
JUMPV
LABELV $577
line 848
;847:	//
;848:	if (bs->lastkilledplayer == bs->client) {
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 5992
ADDP4
INDIRI4
ADDRLP4 64
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $579
line 849
;849:		strcpy(name, BotRandomOpponentName(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 BotRandomOpponentName
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 850
;850:	}
ADDRGP4 $580
JUMPV
LABELV $579
line 851
;851:	else {
line 852
;852:		EasyClientName(bs->lastkilledplayer, name, sizeof(name));
ADDRFP4 0
INDIRP4
CNSTI4 5992
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 853
;853:	}
LABELV $580
line 854
;854:	if ( TeamPlayIsOn() ) {
ADDRLP4 68
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $581
line 855
;855:		return qfalse;			// don't wait
CNSTI4 0
RETI4
ADDRGP4 $550
JUMPV
LABELV $581
line 858
;856:	}
;857:	//
;858:	if (random() < trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CHAT_MISC, 0, 1)) {
ADDRLP4 72
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 25
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 76
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 72
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 76
INDIRF4
GEF4 $583
line 859
;859:		BotAI_BotInitialChat(bs, "random_misc",
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 BotRandomOpponentName
CALLP4
ASGNP4
ADDRLP4 84
ADDRGP4 BotMapTitle
CALLP4
ASGNP4
ADDRLP4 88
ADDRGP4 BotRandomWeaponName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $585
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 92
ADDRGP4 $263
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 88
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 867
;860:					BotRandomOpponentName(bs),	// 0
;861:					name,						// 1
;862:					"[invalid var]",			// 2
;863:					"[invalid var]",			// 3
;864:					BotMapTitle(),				// 4
;865:					BotRandomWeaponName(),		// 5
;866:					NULL);
;867:	}
ADDRGP4 $584
JUMPV
LABELV $583
line 868
;868:	else {
line 869
;869:		BotAI_BotInitialChat(bs, "random_insult",
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 BotRandomOpponentName
CALLP4
ASGNP4
ADDRLP4 84
ADDRGP4 BotMapTitle
CALLP4
ASGNP4
ADDRLP4 88
ADDRGP4 BotRandomWeaponName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $586
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 92
ADDRGP4 $263
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 88
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 877
;870:					BotRandomOpponentName(bs),	// 0
;871:					name,						// 1
;872:					"[invalid var]",			// 2
;873:					"[invalid var]",			// 3
;874:					BotMapTitle(),				// 4
;875:					BotRandomWeaponName(),		// 5
;876:					NULL);
;877:	}
LABELV $584
line 878
;878:	bs->lastchat_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 879
;879:	bs->chatto = CHAT_ALL;
ADDRFP4 0
INDIRP4
CNSTI4 6052
ADDP4
CNSTI4 0
ASGNI4
line 880
;880:	return qtrue;
CNSTI4 1
RETI4
LABELV $550
endproc BotChat_Random 96 36
export BotChatTime
proc BotChatTime 0 0
line 888
;881:}
;882:
;883:/*
;884:==================
;885:BotChatTime
;886:==================
;887:*/
;888:float BotChatTime(bot_state_t *bs) {
line 893
;889:	//int cpm;
;890:
;891:	//cpm = trap_Characteristic_BInteger(bs->character, CHARACTERISTIC_CHAT_CPM, 1, 4000);
;892:
;893:	return 2.0;	//(float) trap_BotChatLength(bs->cs) * 30 / cpm;
CNSTF4 1073741824
RETF4
LABELV $587
endproc BotChatTime 0 0
export BotChatTest
proc BotChatTest 180 36
line 901
;894:}
;895:
;896:/*
;897:==================
;898:BotChatTest
;899:==================
;900:*/
;901:void BotChatTest(bot_state_t *bs) {
line 907
;902:
;903:	char name[32];
;904:	char *weap;
;905:	int num, i;
;906:
;907:	num = trap_BotNumInitialChats(bs->cs, "game_enter");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $262
ARGP4
ADDRLP4 44
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 44
INDIRI4
ASGNI4
line 908
;908:	for (i = 0; i < num; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $592
JUMPV
LABELV $589
line 909
;909:	{
line 910
;910:		BotAI_BotInitialChat(bs, "game_enter",
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 48
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 BotRandomOpponentName
CALLP4
ASGNP4
ADDRLP4 56
ADDRGP4 BotMapTitle
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $262
ARGP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 $263
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 917
;911:					EasyClientName(bs->client, name, 32),	// 0
;912:					BotRandomOpponentName(bs),				// 1
;913:					"[invalid var]",						// 2
;914:					"[invalid var]",						// 3
;915:					BotMapTitle(),							// 4
;916:					NULL);
;917:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 918
;918:	}
LABELV $590
line 908
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $592
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $589
line 919
;919:	num = trap_BotNumInitialChats(bs->cs, "game_exit");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $281
ARGP4
ADDRLP4 48
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 48
INDIRI4
ASGNI4
line 920
;920:	for (i = 0; i < num; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $596
JUMPV
LABELV $593
line 921
;921:	{
line 922
;922:		BotAI_BotInitialChat(bs, "game_exit",
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 52
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 BotRandomOpponentName
CALLP4
ASGNP4
ADDRLP4 60
ADDRGP4 BotMapTitle
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $281
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 $263
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 929
;923:					EasyClientName(bs->client, name, 32),	// 0
;924:					BotRandomOpponentName(bs),				// 1
;925:					"[invalid var]",						// 2
;926:					"[invalid var]",						// 3
;927:					BotMapTitle(),							// 4
;928:					NULL);
;929:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 930
;930:	}
LABELV $594
line 920
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $596
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $593
line 931
;931:	num = trap_BotNumInitialChats(bs->cs, "level_start");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $301
ARGP4
ADDRLP4 52
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 52
INDIRI4
ASGNI4
line 932
;932:	for (i = 0; i < num; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $600
JUMPV
LABELV $597
line 933
;933:	{
line 934
;934:		BotAI_BotInitialChat(bs, "level_start",
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 56
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $301
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 937
;935:					EasyClientName(bs->client, name, 32),	// 0
;936:					NULL);
;937:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 938
;938:	}
LABELV $598
line 932
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $600
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $597
line 939
;939:	num = trap_BotNumInitialChats(bs->cs, "level_end_victory");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $323
ARGP4
ADDRLP4 56
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 56
INDIRI4
ASGNI4
line 940
;940:	for (i = 0; i < num; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $604
JUMPV
LABELV $601
line 941
;941:	{
line 942
;942:		BotAI_BotInitialChat(bs, "level_end_victory",
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 60
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 BotRandomOpponentName
CALLP4
ASGNP4
ADDRLP4 68
ADDRGP4 BotFirstClientInRankings
CALLP4
ASGNP4
ADDRLP4 72
ADDRGP4 BotLastClientInRankings
CALLP4
ASGNP4
ADDRLP4 76
ADDRGP4 BotMapTitle
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $323
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 949
;943:				EasyClientName(bs->client, name, 32),	// 0
;944:				BotRandomOpponentName(bs),				// 1
;945:				BotFirstClientInRankings(),				// 2
;946:				BotLastClientInRankings(),				// 3
;947:				BotMapTitle(),							// 4
;948:				NULL);
;949:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 950
;950:	}
LABELV $602
line 940
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $604
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $601
line 951
;951:	num = trap_BotNumInitialChats(bs->cs, "level_end_lose");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $326
ARGP4
ADDRLP4 60
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 60
INDIRI4
ASGNI4
line 952
;952:	for (i = 0; i < num; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $608
JUMPV
LABELV $605
line 953
;953:	{
line 954
;954:		BotAI_BotInitialChat(bs, "level_end_lose",
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 64
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 BotRandomOpponentName
CALLP4
ASGNP4
ADDRLP4 72
ADDRGP4 BotFirstClientInRankings
CALLP4
ASGNP4
ADDRLP4 76
ADDRGP4 BotLastClientInRankings
CALLP4
ASGNP4
ADDRLP4 80
ADDRGP4 BotMapTitle
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $326
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 961
;955:				EasyClientName(bs->client, name, 32),	// 0
;956:				BotRandomOpponentName(bs),				// 1
;957:				BotFirstClientInRankings(),				// 2
;958:				BotLastClientInRankings(),				// 3
;959:				BotMapTitle(),							// 4
;960:				NULL);
;961:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 962
;962:	}
LABELV $606
line 952
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $608
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $605
line 963
;963:	num = trap_BotNumInitialChats(bs->cs, "level_end");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $327
ARGP4
ADDRLP4 64
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 64
INDIRI4
ASGNI4
line 964
;964:	for (i = 0; i < num; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $612
JUMPV
LABELV $609
line 965
;965:	{
line 966
;966:		BotAI_BotInitialChat(bs, "level_end",
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 68
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 BotRandomOpponentName
CALLP4
ASGNP4
ADDRLP4 76
ADDRGP4 BotFirstClientInRankings
CALLP4
ASGNP4
ADDRLP4 80
ADDRGP4 BotLastClientInRankings
CALLP4
ASGNP4
ADDRLP4 84
ADDRGP4 BotMapTitle
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $327
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 84
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 973
;967:				EasyClientName(bs->client, name, 32),	// 0
;968:				BotRandomOpponentName(bs),				// 1
;969:				BotFirstClientInRankings(),				// 2
;970:				BotLastClientInRankings(),				// 3
;971:				BotMapTitle(),							// 4
;972:				NULL);
;973:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 974
;974:	}
LABELV $610
line 964
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $612
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $609
line 975
;975:	EasyClientName(bs->lastkilledby, name, sizeof(name));
ADDRFP4 0
INDIRP4
CNSTI4 5996
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 976
;976:	num = trap_BotNumInitialChats(bs->cs, "death_drown");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $355
ARGP4
ADDRLP4 68
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 68
INDIRI4
ASGNI4
line 977
;977:	for (i = 0; i < num; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $616
JUMPV
LABELV $613
line 978
;978:	{
line 980
;979:		//
;980:		BotAI_BotInitialChat(bs, "death_drown", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $355
ARGP4
ADDRLP4 8
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 981
;981:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 982
;982:	}
LABELV $614
line 977
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $616
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $613
line 983
;983:	num = trap_BotNumInitialChats(bs->cs, "death_slime");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $358
ARGP4
ADDRLP4 72
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 72
INDIRI4
ASGNI4
line 984
;984:	for (i = 0; i < num; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $620
JUMPV
LABELV $617
line 985
;985:	{
line 986
;986:		BotAI_BotInitialChat(bs, "death_slime", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $358
ARGP4
ADDRLP4 8
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 987
;987:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 988
;988:	}
LABELV $618
line 984
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $620
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $617
line 989
;989:	num = trap_BotNumInitialChats(bs->cs, "death_lava");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $361
ARGP4
ADDRLP4 76
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 76
INDIRI4
ASGNI4
line 990
;990:	for (i = 0; i < num; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $624
JUMPV
LABELV $621
line 991
;991:	{
line 992
;992:		BotAI_BotInitialChat(bs, "death_lava", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $361
ARGP4
ADDRLP4 8
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 993
;993:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 994
;994:	}
LABELV $622
line 990
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $624
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $621
line 995
;995:	num = trap_BotNumInitialChats(bs->cs, "death_cratered");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $364
ARGP4
ADDRLP4 80
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 80
INDIRI4
ASGNI4
line 996
;996:	for (i = 0; i < num; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $628
JUMPV
LABELV $625
line 997
;997:	{
line 998
;998:		BotAI_BotInitialChat(bs, "death_cratered", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $364
ARGP4
ADDRLP4 8
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 999
;999:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1000
;1000:	}
LABELV $626
line 996
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $628
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $625
line 1001
;1001:	num = trap_BotNumInitialChats(bs->cs, "death_suicide");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $372
ARGP4
ADDRLP4 84
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 84
INDIRI4
ASGNI4
line 1002
;1002:	for (i = 0; i < num; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $632
JUMPV
LABELV $629
line 1003
;1003:	{
line 1004
;1004:		BotAI_BotInitialChat(bs, "death_suicide", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $372
ARGP4
ADDRLP4 8
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1005
;1005:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1006
;1006:	}
LABELV $630
line 1002
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $632
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $629
line 1007
;1007:	num = trap_BotNumInitialChats(bs->cs, "death_telefrag");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $375
ARGP4
ADDRLP4 88
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 88
INDIRI4
ASGNI4
line 1008
;1008:	for (i = 0; i < num; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $636
JUMPV
LABELV $633
line 1009
;1009:	{
line 1010
;1010:		BotAI_BotInitialChat(bs, "death_telefrag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $375
ARGP4
ADDRLP4 8
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1011
;1011:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1012
;1012:	}
LABELV $634
line 1008
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $636
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $633
line 1013
;1013:	num = trap_BotNumInitialChats(bs->cs, "death_gauntlet");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $386
ARGP4
ADDRLP4 92
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 92
INDIRI4
ASGNI4
line 1014
;1014:	for (i = 0; i < num; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $640
JUMPV
LABELV $637
line 1015
;1015:	{
line 1016
;1016:		BotAI_BotInitialChat(bs, "death_gauntlet",
ADDRFP4 0
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 BotWeaponNameForMeansOfDeath
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $386
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1020
;1017:				name,												// 0
;1018:				BotWeaponNameForMeansOfDeath(bs->botdeathtype),		// 1
;1019:				NULL);
;1020:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1021
;1021:	}
LABELV $638
line 1014
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $640
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $637
line 1022
;1022:	num = trap_BotNumInitialChats(bs->cs, "death_rail");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $389
ARGP4
ADDRLP4 96
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 96
INDIRI4
ASGNI4
line 1023
;1023:	for (i = 0; i < num; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $644
JUMPV
LABELV $641
line 1024
;1024:	{
line 1025
;1025:		BotAI_BotInitialChat(bs, "death_rail",
ADDRFP4 0
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
ARGI4
ADDRLP4 100
ADDRGP4 BotWeaponNameForMeansOfDeath
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $389
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 100
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1029
;1026:				name,												// 0
;1027:				BotWeaponNameForMeansOfDeath(bs->botdeathtype),		// 1
;1028:				NULL);
;1029:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1030
;1030:	}
LABELV $642
line 1023
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $644
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $641
line 1031
;1031:	num = trap_BotNumInitialChats(bs->cs, "death_bfg");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $390
ARGP4
ADDRLP4 100
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 100
INDIRI4
ASGNI4
line 1032
;1032:	for (i = 0; i < num; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $648
JUMPV
LABELV $645
line 1033
;1033:	{
line 1034
;1034:		BotAI_BotInitialChat(bs, "death_bfg",
ADDRFP4 0
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
ARGI4
ADDRLP4 104
ADDRGP4 BotWeaponNameForMeansOfDeath
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $390
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 104
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1038
;1035:				name,												// 0
;1036:				BotWeaponNameForMeansOfDeath(bs->botdeathtype),		// 1
;1037:				NULL);
;1038:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1039
;1039:	}
LABELV $646
line 1032
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $648
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $645
line 1040
;1040:	num = trap_BotNumInitialChats(bs->cs, "death_insult");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $393
ARGP4
ADDRLP4 104
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 104
INDIRI4
ASGNI4
line 1041
;1041:	for (i = 0; i < num; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $652
JUMPV
LABELV $649
line 1042
;1042:	{
line 1043
;1043:		BotAI_BotInitialChat(bs, "death_insult",
ADDRFP4 0
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
ARGI4
ADDRLP4 108
ADDRGP4 BotWeaponNameForMeansOfDeath
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $393
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 108
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1047
;1044:					name,												// 0
;1045:					BotWeaponNameForMeansOfDeath(bs->botdeathtype),		// 1
;1046:					NULL);
;1047:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1048
;1048:	}
LABELV $650
line 1041
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $652
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $649
line 1049
;1049:	num = trap_BotNumInitialChats(bs->cs, "death_praise");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $394
ARGP4
ADDRLP4 108
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 108
INDIRI4
ASGNI4
line 1050
;1050:	for (i = 0; i < num; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $656
JUMPV
LABELV $653
line 1051
;1051:	{
line 1052
;1052:		BotAI_BotInitialChat(bs, "death_praise",
ADDRFP4 0
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
ARGI4
ADDRLP4 112
ADDRGP4 BotWeaponNameForMeansOfDeath
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $394
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 112
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1056
;1053:					name,												// 0
;1054:					BotWeaponNameForMeansOfDeath(bs->botdeathtype),		// 1
;1055:					NULL);
;1056:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1057
;1057:	}
LABELV $654
line 1050
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $656
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $653
line 1059
;1058:	//
;1059:	EasyClientName(bs->lastkilledplayer, name, 32);
ADDRFP4 0
INDIRP4
CNSTI4 5992
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 1061
;1060:	//
;1061:	num = trap_BotNumInitialChats(bs->cs, "kill_gauntlet");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $423
ARGP4
ADDRLP4 112
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 112
INDIRI4
ASGNI4
line 1062
;1062:	for (i = 0; i < num; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $660
JUMPV
LABELV $657
line 1063
;1063:	{
line 1065
;1064:		//
;1065:		BotAI_BotInitialChat(bs, "kill_gauntlet", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $423
ARGP4
ADDRLP4 8
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1066
;1066:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1067
;1067:	}
LABELV $658
line 1062
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $660
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $657
line 1068
;1068:	num = trap_BotNumInitialChats(bs->cs, "kill_rail");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $426
ARGP4
ADDRLP4 116
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 116
INDIRI4
ASGNI4
line 1069
;1069:	for (i = 0; i < num; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $664
JUMPV
LABELV $661
line 1070
;1070:	{
line 1071
;1071:		BotAI_BotInitialChat(bs, "kill_rail", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $426
ARGP4
ADDRLP4 8
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1072
;1072:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1073
;1073:	}
LABELV $662
line 1069
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $664
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $661
line 1074
;1074:	num = trap_BotNumInitialChats(bs->cs, "kill_telefrag");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $429
ARGP4
ADDRLP4 120
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 120
INDIRI4
ASGNI4
line 1075
;1075:	for (i = 0; i < num; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $668
JUMPV
LABELV $665
line 1076
;1076:	{
line 1077
;1077:		BotAI_BotInitialChat(bs, "kill_telefrag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $429
ARGP4
ADDRLP4 8
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1078
;1078:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1079
;1079:	}
LABELV $666
line 1075
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $668
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $665
line 1080
;1080:	num = trap_BotNumInitialChats(bs->cs, "kill_insult");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $435
ARGP4
ADDRLP4 124
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 124
INDIRI4
ASGNI4
line 1081
;1081:	for (i = 0; i < num; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $672
JUMPV
LABELV $669
line 1082
;1082:	{
line 1083
;1083:		BotAI_BotInitialChat(bs, "kill_insult", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $435
ARGP4
ADDRLP4 8
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1084
;1084:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1085
;1085:	}
LABELV $670
line 1081
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $672
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $669
line 1086
;1086:	num = trap_BotNumInitialChats(bs->cs, "kill_praise");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $436
ARGP4
ADDRLP4 128
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 128
INDIRI4
ASGNI4
line 1087
;1087:	for (i = 0; i < num; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $676
JUMPV
LABELV $673
line 1088
;1088:	{
line 1089
;1089:		BotAI_BotInitialChat(bs, "kill_praise", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $436
ARGP4
ADDRLP4 8
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1090
;1090:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1091
;1091:	}
LABELV $674
line 1087
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $676
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $673
line 1092
;1092:	num = trap_BotNumInitialChats(bs->cs, "enemy_suicide");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $461
ARGP4
ADDRLP4 132
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 132
INDIRI4
ASGNI4
line 1093
;1093:	for (i = 0; i < num; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $680
JUMPV
LABELV $677
line 1094
;1094:	{
line 1095
;1095:		BotAI_BotInitialChat(bs, "enemy_suicide", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $461
ARGP4
ADDRLP4 8
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1096
;1096:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1097
;1097:	}
LABELV $678
line 1093
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $680
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $677
line 1098
;1098:	ClientName(g_entities[bs->client].client->lasthurt_client, name, sizeof(name));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1099
;1099:	weap = BotWeaponNameForMeansOfDeath(g_entities[bs->client].client->lasthurt_client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ARGI4
ADDRLP4 136
ADDRGP4 BotWeaponNameForMeansOfDeath
CALLP4
ASGNP4
ADDRLP4 40
ADDRLP4 136
INDIRP4
ASGNP4
line 1100
;1100:	num = trap_BotNumInitialChats(bs->cs, "hit_talking");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $491
ARGP4
ADDRLP4 140
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 140
INDIRI4
ASGNI4
line 1101
;1101:	for (i = 0; i < num; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $686
JUMPV
LABELV $683
line 1102
;1102:	{
line 1103
;1103:		BotAI_BotInitialChat(bs, "hit_talking", name, weap, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $491
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1104
;1104:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1105
;1105:	}
LABELV $684
line 1101
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $686
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $683
line 1106
;1106:	num = trap_BotNumInitialChats(bs->cs, "hit_nodeath");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $524
ARGP4
ADDRLP4 144
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 144
INDIRI4
ASGNI4
line 1107
;1107:	for (i = 0; i < num; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $690
JUMPV
LABELV $687
line 1108
;1108:	{
line 1109
;1109:		BotAI_BotInitialChat(bs, "hit_nodeath", name, weap, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $524
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1110
;1110:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1111
;1111:	}
LABELV $688
line 1107
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $690
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $687
line 1112
;1112:	num = trap_BotNumInitialChats(bs->cs, "hit_nokill");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $549
ARGP4
ADDRLP4 148
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 148
INDIRI4
ASGNI4
line 1113
;1113:	for (i = 0; i < num; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $694
JUMPV
LABELV $691
line 1114
;1114:	{
line 1115
;1115:		BotAI_BotInitialChat(bs, "hit_nokill", name, weap, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $549
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1116
;1116:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1117
;1117:	}
LABELV $692
line 1113
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $694
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $691
line 1119
;1118:	//
;1119:	if (bs->lastkilledplayer == bs->client) {
ADDRLP4 152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 152
INDIRP4
CNSTI4 5992
ADDP4
INDIRI4
ADDRLP4 152
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $695
line 1120
;1120:		strcpy(name, BotRandomOpponentName(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 156
ADDRGP4 BotRandomOpponentName
CALLP4
ASGNP4
ADDRLP4 8
ARGP4
ADDRLP4 156
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1121
;1121:	}
ADDRGP4 $696
JUMPV
LABELV $695
line 1122
;1122:	else {
line 1123
;1123:		EasyClientName(bs->lastkilledplayer, name, sizeof(name));
ADDRFP4 0
INDIRP4
CNSTI4 5992
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 1124
;1124:	}
LABELV $696
line 1126
;1125:	//
;1126:	num = trap_BotNumInitialChats(bs->cs, "random_misc");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $585
ARGP4
ADDRLP4 156
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 156
INDIRI4
ASGNI4
line 1127
;1127:	for (i = 0; i < num; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $700
JUMPV
LABELV $697
line 1128
;1128:	{
line 1130
;1129:		//
;1130:		BotAI_BotInitialChat(bs, "random_misc",
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 160
ADDRGP4 BotRandomOpponentName
CALLP4
ASGNP4
ADDRLP4 164
ADDRGP4 BotMapTitle
CALLP4
ASGNP4
ADDRLP4 168
ADDRGP4 BotRandomWeaponName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $585
ARGP4
ADDRLP4 160
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 172
ADDRGP4 $263
ASGNP4
ADDRLP4 172
INDIRP4
ARGP4
ADDRLP4 172
INDIRP4
ARGP4
ADDRLP4 164
INDIRP4
ARGP4
ADDRLP4 168
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1138
;1131:					BotRandomOpponentName(bs),	// 0
;1132:					name,						// 1
;1133:					"[invalid var]",			// 2
;1134:					"[invalid var]",			// 3
;1135:					BotMapTitle(),				// 4
;1136:					BotRandomWeaponName(),		// 5
;1137:					NULL);
;1138:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1139
;1139:	}
LABELV $698
line 1127
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $700
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $697
line 1140
;1140:	num = trap_BotNumInitialChats(bs->cs, "random_insult");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $586
ARGP4
ADDRLP4 160
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 160
INDIRI4
ASGNI4
line 1141
;1141:	for (i = 0; i < num; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $704
JUMPV
LABELV $701
line 1142
;1142:	{
line 1143
;1143:		BotAI_BotInitialChat(bs, "random_insult",
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 164
ADDRGP4 BotRandomOpponentName
CALLP4
ASGNP4
ADDRLP4 168
ADDRGP4 BotMapTitle
CALLP4
ASGNP4
ADDRLP4 172
ADDRGP4 BotRandomWeaponName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $586
ARGP4
ADDRLP4 164
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 176
ADDRGP4 $263
ASGNP4
ADDRLP4 176
INDIRP4
ARGP4
ADDRLP4 176
INDIRP4
ARGP4
ADDRLP4 168
INDIRP4
ARGP4
ADDRLP4 172
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1151
;1144:					BotRandomOpponentName(bs),	// 0
;1145:					name,						// 1
;1146:					"[invalid var]",			// 2
;1147:					"[invalid var]",			// 3
;1148:					BotMapTitle(),				// 4
;1149:					BotRandomWeaponName(),		// 5
;1150:					NULL);
;1151:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1152
;1152:	}
LABELV $702
line 1141
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $704
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $701
line 1153
;1153:}
LABELV $588
endproc BotChatTest 180 36
import BotDumpNodeSwitches
import BotResetNodeSwitches
import AINode_Battle_NBG
import AINode_Battle_Retreat
import AINode_Battle_Chase
import AINode_Battle_Fight
import AINode_Seek_LTG
import AINode_Seek_NBG
import AINode_Seek_ActivateEntity
import AINode_Stand
import AINode_Respawn
import AINode_Observer
import AINode_Intermission
import AIEnter_Battle_NBG
import AIEnter_Battle_Retreat
import AIEnter_Battle_Chase
import AIEnter_Battle_Fight
import AIEnter_Seek_Camp
import AIEnter_Seek_LTG
import AIEnter_Seek_NBG
import AIEnter_Seek_ActivateEntity
import AIEnter_Stand
import AIEnter_Respawn
import AIEnter_Observer
import AIEnter_Intermission
import BotPrintTeamGoal
import BotMatchMessage
import notleader
import neutralobelisk
import blueobelisk
import redobelisk
import ctf_neutralflag
import ctf_blueflag
import ctf_redflag
import bot_challenge
import bot_testrchat
import bot_nochat
import bot_fastchat
import bot_rocketjump
import bot_grapple
import mapname
import gametype
import BotMapScripts
import BotPointAreaNum
import ClientOnSameTeamFromName
import ClientFromName
import stristr
import BotFindWayPoint
import BotCreateWayPoint
import BotAlternateRoute
import BotGetAlternateRouteGoal
import BotEnemyCubeCarrierVisible
import BotTeamCubeCarrierVisible
import BotHarvesterRetreatGoals
import BotHarvesterSeekGoals
import BotGoHarvest
import BotObeliskRetreatGoals
import BotObeliskSeekGoals
import Bot1FCTFRetreatGoals
import Bot1FCTFSeekGoals
import BotHarvesterCarryingCubes
import Bot1FCTFCarryingFlag
import BotCTFRetreatGoals
import BotCTFSeekGoals
import BotRememberLastOrderedTask
import BotCTFCarryingFlag
import BotOppositeTeam
import BotTeam
import BotClearActivateGoalStack
import BotPopFromActivateGoalStack
import BotEnableActivateGoalAreas
import BotAIPredictObstacles
import BotAIBlocked
import BotCheckAttack
import BotAimAtEnemy
import BotEntityVisible
import BotRoamGoal
import BotFindEnemy
import InFieldOfVision
import BotVisibleTeamMatesAndEnemies
import BotEnemyFlagCarrierVisible
import BotTeamFlagCarrierVisible
import BotTeamFlagCarrier
import TeamPlayIsOn
import BotSameTeam
import BotAttackMove
import BotWantsToCamp
import BotHasPersistantPowerupAndWeapon
import BotCanAndWantsToRocketJump
import BotWantsToHelp
import BotWantsToChase
import BotWantsToRetreat
import BotFeelingBad
import BotAggression
import BotTeamGoals
import BotSetLastOrderedTask
import BotSynonymContext
import ClientSkin
import EasyClientName
import ClientName
import BotSetTeamStatus
import EntityHasKamikaze
import EntityIsShooting
import EntityIsInvisible
import EntityIsDead
import BotInLavaOrSlime
import BotIntermission
import BotIsObserver
import BotIsDead
import BotBattleUseItems
import BotUpdateBattleInventory
import BotUpdateInventory
import BotSetupForMovement
import BotChooseWeapon
import BotFreeWaypoints
import BotDeathmatchAI
import BotShutdownDeathmatchAI
import BotSetupDeathmatchAI
import BotTeamLeader
import BotAI_GetSnapshotEntity
import BotAI_GetEntityState
import BotAI_GetClientState
import BotAI_Trace
import BotAI_BotInitialChat
import BotAI_Print
import floattime
import BotEntityInfo
import NumBots
import BotResetState
import BotResetWeaponState
import BotFreeWeaponState
import BotAllocWeaponState
import BotLoadWeaponWeights
import BotGetWeaponInfo
import BotChooseBestFightWeapon
import BotShutdownWeaponAI
import BotSetupWeaponAI
import BotShutdownMoveAI
import BotSetupMoveAI
import BotSetBrushModelTypes
import BotAddAvoidSpot
import BotInitMoveState
import BotFreeMoveState
import BotAllocMoveState
import BotPredictVisiblePosition
import BotMovementViewTarget
import BotReachabilityArea
import BotResetLastAvoidReach
import BotResetAvoidReach
import BotMoveInDirection
import BotMoveToGoal
import BotResetMoveState
import BotShutdownGoalAI
import BotSetupGoalAI
import BotFreeGoalState
import BotAllocGoalState
import BotFreeItemWeights
import BotLoadItemWeights
import BotMutateGoalFuzzyLogic
import BotSaveGoalFuzzyLogic
import BotInterbreedGoalFuzzyLogic
import BotUpdateEntityItems
import BotInitLevelItems
import BotSetAvoidGoalTime
import BotAvoidGoalTime
import BotGetMapLocationGoal
import BotGetNextCampSpotGoal
import BotGetLevelItemGoal
import BotItemGoalInVisButNotVisible
import BotTouchingGoal
import BotChooseNBGItem
import BotChooseLTGItem
import BotGetSecondGoal
import BotGetTopGoal
import BotGoalName
import BotDumpGoalStack
import BotDumpAvoidGoals
import BotEmptyGoalStack
import BotPopGoal
import BotPushGoal
import BotRemoveFromAvoidGoals
import BotResetAvoidGoals
import BotResetGoalState
import GeneticParentsAndChildSelection
import BotSetChatName
import BotSetChatGender
import BotLoadChatFile
import BotReplaceSynonyms
import UnifyWhiteSpaces
import BotMatchVariable
import BotFindMatch
import StringContains
import BotGetChatMessage
import BotEnterChat
import BotChatLength
import BotReplyChat
import BotNumInitialChats
import BotInitialChat
import BotNumConsoleMessages
import BotNextConsoleMessage
import BotRemoveConsoleMessage
import BotQueueConsoleMessage
import BotFreeChatState
import BotAllocChatState
import BotShutdownChatAI
import BotSetupChatAI
import BotShutdownCharacters
import Characteristic_String
import Characteristic_BInteger
import Characteristic_Integer
import Characteristic_BFloat
import Characteristic_Float
import BotFreeCharacter
import BotLoadCharacter
import EA_Shutdown
import EA_Setup
import EA_ResetInput
import EA_GetInput
import EA_EndRegular
import EA_View
import EA_Move
import EA_DelayedJump
import EA_Jump
import EA_SelectWeapon
import EA_Use
import EA_Gesture
import EA_Talk
import EA_Respawn
import EA_Attack
import EA_MoveRight
import EA_MoveLeft
import EA_MoveBack
import EA_MoveForward
import EA_MoveDown
import EA_MoveUp
import EA_Walk
import EA_Crouch
import EA_Action
import EA_Command
import EA_SayTeam
import EA_Say
import GetBotLibAPI
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
import ClientBegin
import ClientDisconnect
import ClientUserinfoChanged
import ClientConnect
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
import SpotWouldTelefrag
import CalculateRanks
import AddScore
import player_die
import ClientSpawn
import InitBodyQue
import BeginIntermission
import respawn
import CopyToBodyQue
import SelectSpawnPoint
import SetClientViewAngle
import PickTeam
import TeamLeader
import TeamConnectedCount
import TeamCount
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
LABELV $586
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 95
byte 1 105
byte 1 110
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $585
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 95
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 0
align 1
LABELV $549
byte 1 104
byte 1 105
byte 1 116
byte 1 95
byte 1 110
byte 1 111
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $524
byte 1 104
byte 1 105
byte 1 116
byte 1 95
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $491
byte 1 104
byte 1 105
byte 1 116
byte 1 95
byte 1 116
byte 1 97
byte 1 108
byte 1 107
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $461
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 95
byte 1 115
byte 1 117
byte 1 105
byte 1 99
byte 1 105
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $460
byte 1 0
align 1
LABELV $436
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 95
byte 1 112
byte 1 114
byte 1 97
byte 1 105
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $435
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 95
byte 1 105
byte 1 110
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $432
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 95
byte 1 107
byte 1 97
byte 1 109
byte 1 105
byte 1 107
byte 1 97
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $429
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 95
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $426
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 95
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 0
align 1
LABELV $423
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 95
byte 1 103
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $418
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 109
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $394
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 112
byte 1 114
byte 1 97
byte 1 105
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $393
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 105
byte 1 110
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $390
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $389
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 0
align 1
LABELV $386
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 103
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $378
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 107
byte 1 97
byte 1 109
byte 1 105
byte 1 107
byte 1 97
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $375
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $372
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 115
byte 1 117
byte 1 105
byte 1 99
byte 1 105
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $364
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 95
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
LABELV $361
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 108
byte 1 97
byte 1 118
byte 1 97
byte 1 0
align 1
LABELV $358
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 115
byte 1 108
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $355
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 100
byte 1 114
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $350
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 109
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $345
byte 1 91
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 93
byte 1 0
align 1
LABELV $327
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $326
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 101
byte 1 110
byte 1 100
byte 1 95
byte 1 108
byte 1 111
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $323
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 101
byte 1 110
byte 1 100
byte 1 95
byte 1 118
byte 1 105
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 121
byte 1 0
align 1
LABELV $301
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $281
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 95
byte 1 101
byte 1 120
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $263
byte 1 91
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 118
byte 1 97
byte 1 114
byte 1 93
byte 1 0
align 1
LABELV $262
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 95
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $185
byte 1 91
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 93
byte 1 0
align 1
LABELV $184
byte 1 71
byte 1 114
byte 1 97
byte 1 112
byte 1 112
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $182
byte 1 80
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
byte 1 75
byte 1 97
byte 1 109
byte 1 105
byte 1 107
byte 1 97
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $178
byte 1 80
byte 1 114
byte 1 111
byte 1 120
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 76
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $176
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
LABELV $174
byte 1 78
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $172
byte 1 66
byte 1 70
byte 1 71
byte 1 49
byte 1 48
byte 1 75
byte 1 0
align 1
LABELV $170
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 71
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $168
byte 1 82
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $166
byte 1 80
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
LABELV $164
byte 1 82
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 32
byte 1 76
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $162
byte 1 71
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 32
byte 1 76
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $160
byte 1 77
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $158
byte 1 71
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $156
byte 1 83
byte 1 104
byte 1 111
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $68
byte 1 116
byte 1 0
align 1
LABELV $64
byte 1 110
byte 1 0
