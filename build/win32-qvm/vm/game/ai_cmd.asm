export BotGetItemTeamGoal
code
proc BotGetItemTeamGoal 12 12
file "..\..\..\..\code\game\ai_cmd.c"
line 134
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:/*****************************************************************************
;5: * name:		ai_cmd.c
;6: *
;7: * desc:		Quake3 bot AI
;8: *
;9: * $Archive: /MissionPack/code/game/ai_cmd.c $
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
;29:#include "ai_team.h"
;30://
;31:#include "chars.h"				//characteristics
;32:#include "inv.h"				//indexes into the inventory
;33:#include "syn.h"				//synonyms
;34:#include "match.h"				//string matching types and vars
;35:
;36:int notleader[MAX_CLIENTS];
;37:
;38:#ifdef DEBUG
;39:/*
;40:==================
;41:BotPrintTeamGoal
;42:==================
;43:*/
;44:void BotPrintTeamGoal(bot_state_t *bs) {
;45:	char netname[MAX_NETNAME];
;46:	float t;
;47:
;48:	ClientName(bs->client, netname, sizeof(netname));
;49:	t = bs->teamgoal_time - FloatTime();
;50:	switch(bs->ltgtype) {
;51:		case LTG_TEAMHELP:
;52:		{
;53:			BotAI_Print(PRT_MESSAGE, "%s: I'm gonna help a team mate for %1.0f secs\n", netname, t);
;54:			break;
;55:		}
;56:		case LTG_TEAMACCOMPANY:
;57:		{
;58:			BotAI_Print(PRT_MESSAGE, "%s: I'm gonna accompany a team mate for %1.0f secs\n", netname, t);
;59:			break;
;60:		}
;61:		case LTG_GETFLAG:
;62:		{
;63:			BotAI_Print(PRT_MESSAGE, "%s: I'm gonna get the flag for %1.0f secs\n", netname, t);
;64:			break;
;65:		}
;66:		case LTG_RUSHBASE:
;67:		{
;68:			BotAI_Print(PRT_MESSAGE, "%s: I'm gonna rush to the base for %1.0f secs\n", netname, t);
;69:			break;
;70:		}
;71:		case LTG_RETURNFLAG:
;72:		{
;73:			BotAI_Print(PRT_MESSAGE, "%s: I'm gonna try to return the flag for %1.0f secs\n", netname, t);
;74:			break;
;75:		}
;76:		case LTG_ATTACKENEMYBASE:
;77:		{
;78:			BotAI_Print(PRT_MESSAGE, "%s: I'm gonna attack the enemy base for %1.0f secs\n", netname, t);
;79:			break;
;80:		}
;81:		case LTG_HARVEST:
;82:		{
;83:			BotAI_Print(PRT_MESSAGE, "%s: I'm gonna harvest for %1.0f secs\n", netname, t);
;84:			break;
;85:		}
;86:		case LTG_DEFENDKEYAREA:
;87:		{
;88:			BotAI_Print(PRT_MESSAGE, "%s: I'm gonna defend a key area for %1.0f secs\n", netname, t);
;89:			break;
;90:		}
;91:		case LTG_GETITEM:
;92:		{
;93:			BotAI_Print(PRT_MESSAGE, "%s: I'm gonna get an item for %1.0f secs\n", netname, t);
;94:			break;
;95:		}
;96:		case LTG_KILL:
;97:		{
;98:			BotAI_Print(PRT_MESSAGE, "%s: I'm gonna kill someone for %1.0f secs\n", netname, t);
;99:			break;
;100:		}
;101:		case LTG_CAMP:
;102:		case LTG_CAMPORDER:
;103:		{
;104:			BotAI_Print(PRT_MESSAGE, "%s: I'm gonna camp for %1.0f secs\n", netname, t);
;105:			break;
;106:		}
;107:		case LTG_PATROL:
;108:		{
;109:			BotAI_Print(PRT_MESSAGE, "%s: I'm gonna patrol for %1.0f secs\n", netname, t);
;110:			break;
;111:		}
;112:		default:
;113:		{
;114:			if (bs->ctfroam_time > FloatTime()) {
;115:				t = bs->ctfroam_time - FloatTime();
;116:				BotAI_Print(PRT_MESSAGE, "%s: I'm gonna roam for %1.0f secs\n", netname, t);
;117:			}
;118:			else {
;119:				BotAI_Print(PRT_MESSAGE, "%s: I've got a regular goal\n", netname);
;120:			}
;121:		}
;122:	}
;123:}
;124:#endif //DEBUG
;125:
;126:/*
;127:==================
;128:BotGetItemTeamGoal
;129:
;130:FIXME: add stuff like "upper rocket launcher"
;131:"the rl near the railgun", "lower grenade launcher" etc.
;132:==================
;133:*/
;134:int BotGetItemTeamGoal(char *goalname, bot_goal_t *goal) {
line 137
;135:	int i;
;136:
;137:	if (!strlen(goalname)) return qfalse;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $57
CNSTI4 0
RETI4
ADDRGP4 $56
JUMPV
LABELV $57
line 138
;138:	i = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
LABELV $59
line 139
;139:	do {
line 140
;140:		i = trap_BotGetLevelItemGoal(i, goalname, goal);
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 141
;141:		if (i > 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $62
line 143
;142:			//do NOT defend dropped items
;143:			if (goal->flags & GFL_DROPPED)
ADDRFP4 4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $64
line 144
;144:				continue;
ADDRGP4 $60
JUMPV
LABELV $64
line 145
;145:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $56
JUMPV
LABELV $62
line 147
;146:		}
;147:	} while(i > 0);
LABELV $60
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $59
line 148
;148:	return qfalse;
CNSTI4 0
RETI4
LABELV $56
endproc BotGetItemTeamGoal 12 12
export BotGetMessageTeamGoal
proc BotGetMessageTeamGoal 12 12
line 156
;149:}
;150:
;151:/*
;152:==================
;153:BotGetMessageTeamGoal
;154:==================
;155:*/
;156:int BotGetMessageTeamGoal(bot_state_t *bs, char *goalname, bot_goal_t *goal) {
line 159
;157:	bot_waypoint_t *cp;
;158:
;159:	if (BotGetItemTeamGoal(goalname, goal)) return qtrue;
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 BotGetItemTeamGoal
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $67
CNSTI4 1
RETI4
ADDRGP4 $66
JUMPV
LABELV $67
line 161
;160:
;161:	cp = BotFindWayPoint(bs->checkpoints, goalname);
ADDRFP4 0
INDIRP4
CNSTI4 9076
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BotFindWayPoint
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 162
;162:	if (cp) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $69
line 163
;163:		memcpy(goal, &cp->goal, sizeof(bot_goal_t));
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 164
;164:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $66
JUMPV
LABELV $69
line 166
;165:	}
;166:	return qfalse;
CNSTI4 0
RETI4
LABELV $66
endproc BotGetMessageTeamGoal 12 12
export BotGetTime
proc BotGetTime 600 16
line 174
;167:}
;168:
;169:/*
;170:==================
;171:BotGetTime
;172:==================
;173:*/
;174:float BotGetTime(bot_match_t *match) {
line 180
;175:	bot_match_t timematch;
;176:	char timestring[MAX_MESSAGE_SIZE];
;177:	float t;
;178:
;179:	//if the matched string has a time
;180:	if (match->subtype & ST_TIME) {
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $72
line 182
;181:		//get the time string
;182:		trap_BotMatchVariable(match, TIME, timestring, MAX_MESSAGE_SIZE);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 184
;183:		//match it to find out if the time is in seconds or minutes
;184:		if (trap_BotFindMatch(timestring, &timematch, MTCONTEXT_TIME)) {
ADDRLP4 0
ARGP4
ADDRLP4 256
ARGP4
CNSTU4 8
ARGU4
ADDRLP4 588
ADDRGP4 trap_BotFindMatch
CALLI4
ASGNI4
ADDRLP4 588
INDIRI4
CNSTI4 0
EQI4 $74
line 185
;185:			if (timematch.type == MSG_FOREVER) {
ADDRLP4 256+256
INDIRI4
CNSTI4 107
NEI4 $76
line 186
;186:				t = 99999999.0f;
ADDRLP4 584
CNSTF4 1287568416
ASGNF4
line 187
;187:			}
ADDRGP4 $77
JUMPV
LABELV $76
line 188
;188:			else if (timematch.type == MSG_FORAWHILE) {
ADDRLP4 256+256
INDIRI4
CNSTI4 109
NEI4 $79
line 189
;189:				t = 10 * 60; // 10 minutes
ADDRLP4 584
CNSTF4 1142292480
ASGNF4
line 190
;190:			}
ADDRGP4 $80
JUMPV
LABELV $79
line 191
;191:			else if (timematch.type == MSG_FORALONGTIME) {
ADDRLP4 256+256
INDIRI4
CNSTI4 108
NEI4 $82
line 192
;192:				t = 30 * 60; // 30 minutes
ADDRLP4 584
CNSTF4 1155596288
ASGNF4
line 193
;193:			}
ADDRGP4 $83
JUMPV
LABELV $82
line 194
;194:			else {
line 195
;195:				trap_BotMatchVariable(&timematch, TIME, timestring, MAX_MESSAGE_SIZE);
ADDRLP4 256
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 196
;196:				if (timematch.type == MSG_MINUTES) t = atof(timestring) * 60;
ADDRLP4 256+256
INDIRI4
CNSTI4 105
NEI4 $85
ADDRLP4 0
ARGP4
ADDRLP4 592
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 584
ADDRLP4 592
INDIRF4
CNSTF4 1114636288
MULF4
ASGNF4
ADDRGP4 $86
JUMPV
LABELV $85
line 197
;197:				else if (timematch.type == MSG_SECONDS) t = atof(timestring);
ADDRLP4 256+256
INDIRI4
CNSTI4 106
NEI4 $88
ADDRLP4 0
ARGP4
ADDRLP4 596
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 584
ADDRLP4 596
INDIRF4
ASGNF4
ADDRGP4 $89
JUMPV
LABELV $88
line 198
;198:				else t = 0;
ADDRLP4 584
CNSTF4 0
ASGNF4
LABELV $89
LABELV $86
line 199
;199:			}
LABELV $83
LABELV $80
LABELV $77
line 201
;200:			//if there's a valid time
;201:			if (t > 0) return FloatTime() + t;
ADDRLP4 584
INDIRF4
CNSTF4 0
LEF4 $91
ADDRGP4 floattime
INDIRF4
ADDRLP4 584
INDIRF4
ADDF4
RETF4
ADDRGP4 $71
JUMPV
LABELV $91
line 202
;202:		}
LABELV $74
line 203
;203:	}
LABELV $72
line 204
;204:	return 0;
CNSTF4 0
RETF4
LABELV $71
endproc BotGetTime 600 16
export FindClientByName
proc FindClientByName 1032 12
line 213
;205:}
;206:
;207:
;208:/*
;209:==================
;210:FindClientByName
;211:==================
;212:*/
;213:int FindClientByName( const char *name ) {
line 217
;214:	char buf[ MAX_INFO_STRING ];
;215:	int i;
;216:
;217:	for ( i = 0; i < level.maxclients; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $97
JUMPV
LABELV $94
line 218
;218:		ClientName( i, buf, sizeof( buf ) );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 219
;219:		if ( !Q_stricmp( buf, name ) ) 
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $99
line 220
;220:			return i; // exact match
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $93
JUMPV
LABELV $99
line 221
;221:	}
LABELV $95
line 217
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $97
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $94
line 223
;222:
;223:	for ( i = 0; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $104
JUMPV
LABELV $101
line 224
;224:		ClientName(i, buf, sizeof( buf ) );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 225
;225:		if ( stristr( buf, name ) )
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
ADDRGP4 stristr
CALLP4
ASGNP4
ADDRLP4 1028
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $106
line 226
;226:			return i; // partial match
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $93
JUMPV
LABELV $106
line 227
;227:	}
LABELV $102
line 223
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $104
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $101
line 229
;228:
;229:	return -1;
CNSTI4 -1
RETI4
LABELV $93
endproc FindClientByName 1032 12
export FindEnemyByName
proc FindEnemyByName 1036 12
line 238
;230:}
;231:
;232:
;233:/*
;234:==================
;235:FindEnemyByName
;236:==================
;237:*/
;238:int FindEnemyByName( bot_state_t *bs, const char *name ) {
line 242
;239:	char buf[MAX_INFO_STRING];
;240:	int i;
;241:
;242:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $112
JUMPV
LABELV $109
line 243
;243:		if (BotSameTeam(bs, i)) continue;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1028
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
EQI4 $114
ADDRGP4 $110
JUMPV
LABELV $114
line 244
;244:		ClientName(i, buf, sizeof(buf));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 245
;245:		if (!Q_stricmp(buf, name)) return i;
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1032
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $116
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $108
JUMPV
LABELV $116
line 246
;246:	}
LABELV $110
line 242
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $112
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $109
line 248
;247:
;248:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $121
JUMPV
LABELV $118
line 249
;249:		if (BotSameTeam(bs, i)) continue;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1028
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
EQI4 $123
ADDRGP4 $119
JUMPV
LABELV $123
line 250
;250:		ClientName(i, buf, sizeof(buf));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 251
;251:		if (stristr(buf, name)) return i;
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1032
ADDRGP4 stristr
CALLP4
ASGNP4
ADDRLP4 1032
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $125
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $108
JUMPV
LABELV $125
line 252
;252:	}
LABELV $119
line 248
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $121
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $118
line 254
;253:
;254:	return -1;
CNSTI4 -1
RETI4
LABELV $108
endproc FindEnemyByName 1036 12
export NumPlayersOnSameTeam
proc NumPlayersOnSameTeam 1036 12
line 263
;255:}
;256:
;257:
;258:/*
;259:==================
;260:NumPlayersOnSameTeam
;261:==================
;262:*/
;263:int NumPlayersOnSameTeam(bot_state_t *bs) {
line 267
;264:	int i, num;
;265:	char buf[MAX_INFO_STRING];
;266:
;267:	num = 0;
ADDRLP4 1028
CNSTI4 0
ASGNI4
line 268
;268:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $131
JUMPV
LABELV $128
line 269
;269:		trap_GetConfigstring(CS_PLAYERS+i, buf, MAX_INFO_STRING);
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
line 270
;270:		if (buf[0]) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $133
line 271
;271:			if (BotSameTeam(bs, i+1)) num++;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1032
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
EQI4 $135
ADDRLP4 1028
ADDRLP4 1028
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $135
line 272
;272:		}
LABELV $133
line 273
;273:	}
LABELV $129
line 268
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $131
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $128
line 274
;274:	return num;
ADDRLP4 1028
INDIRI4
RETI4
LABELV $127
endproc NumPlayersOnSameTeam 1036 12
export BotGetPatrolWaypoints
proc BotGetPatrolWaypoints 672 16
line 282
;275:}
;276:
;277:/*
;278:==================
;279:TeamPlayIsOn
;280:==================
;281:*/
;282:int BotGetPatrolWaypoints(bot_state_t *bs, bot_match_t *match) {
line 289
;283:	char keyarea[MAX_MESSAGE_SIZE];
;284:	int patrolflags;
;285:	bot_waypoint_t *wp, *newwp, *newpatrolpoints;
;286:	bot_match_t keyareamatch;
;287:	bot_goal_t goal;
;288:
;289:	newpatrolpoints = NULL;
ADDRLP4 592
CNSTP4 0
ASGNP4
line 290
;290:	patrolflags = 0;
ADDRLP4 652
CNSTI4 0
ASGNI4
line 292
;291:	//
;292:	trap_BotMatchVariable(match, KEYAREA, keyarea, MAX_MESSAGE_SIZE);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
ADDRGP4 $139
JUMPV
LABELV $138
line 294
;293:	//
;294:	while(1) {
line 295
;295:		if (!trap_BotFindMatch(keyarea, &keyareamatch, MTCONTEXT_PATROLKEYAREA)) {
ADDRLP4 8
ARGP4
ADDRLP4 264
ARGP4
CNSTU4 64
ARGU4
ADDRLP4 656
ADDRGP4 trap_BotFindMatch
CALLI4
ASGNI4
ADDRLP4 656
INDIRI4
CNSTI4 0
NEI4 $141
line 296
;296:			trap_EA_SayTeam(bs->client, "what do you say?");
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 $143
ARGP4
ADDRGP4 trap_EA_SayTeam
CALLV
pop
line 297
;297:			BotFreeWaypoints(newpatrolpoints);
ADDRLP4 592
INDIRP4
ARGP4
ADDRGP4 BotFreeWaypoints
CALLV
pop
line 298
;298:			bs->patrolpoints = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 9080
ADDP4
CNSTP4 0
ASGNP4
line 299
;299:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $137
JUMPV
LABELV $141
line 301
;300:		}
;301:		trap_BotMatchVariable(&keyareamatch, KEYAREA, keyarea, MAX_MESSAGE_SIZE);
ADDRLP4 264
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 302
;302:		if (!BotGetMessageTeamGoal(bs, keyarea, &goal)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 596
ARGP4
ADDRLP4 660
ADDRGP4 BotGetMessageTeamGoal
CALLI4
ASGNI4
ADDRLP4 660
INDIRI4
CNSTI4 0
NEI4 $144
line 305
;303:			//BotAI_BotInitialChat(bs, "cannotfind", keyarea, NULL);
;304:			//trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
;305:			BotFreeWaypoints(newpatrolpoints);
ADDRLP4 592
INDIRP4
ARGP4
ADDRGP4 BotFreeWaypoints
CALLV
pop
line 306
;306:			bs->patrolpoints = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 9080
ADDP4
CNSTP4 0
ASGNP4
line 307
;307:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $137
JUMPV
LABELV $144
line 310
;308:		}
;309:		//create a new waypoint
;310:		newwp = BotCreateWayPoint(keyarea, goal.origin, goal.areanum);
ADDRLP4 8
ARGP4
ADDRLP4 596
ARGP4
ADDRLP4 596+12
INDIRI4
ARGI4
ADDRLP4 664
ADDRGP4 BotCreateWayPoint
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 664
INDIRP4
ASGNP4
line 311
;311:		if (!newwp)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $147
line 312
;312:			break;
ADDRGP4 $140
JUMPV
LABELV $147
line 314
;313:		//add the waypoint to the patrol points
;314:		newwp->next = NULL;
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
CNSTP4 0
ASGNP4
line 315
;315:		for (wp = newpatrolpoints; wp && wp->next; wp = wp->next);
ADDRLP4 0
ADDRLP4 592
INDIRP4
ASGNP4
ADDRGP4 $152
JUMPV
LABELV $149
LABELV $150
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
ASGNP4
LABELV $152
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $153
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $149
LABELV $153
line 316
;316:		if (!wp) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $154
line 317
;317:			newpatrolpoints = newwp;
ADDRLP4 592
ADDRLP4 4
INDIRP4
ASGNP4
line 318
;318:			newwp->prev = NULL;
ADDRLP4 4
INDIRP4
CNSTI4 96
ADDP4
CNSTP4 0
ASGNP4
line 319
;319:		}
ADDRGP4 $155
JUMPV
LABELV $154
line 320
;320:		else {
line 321
;321:			wp->next = newwp;
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 322
;322:			newwp->prev = wp;
ADDRLP4 4
INDIRP4
CNSTI4 96
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 323
;323:		}
LABELV $155
line 325
;324:		//
;325:		if (keyareamatch.subtype & ST_BACK) {
ADDRLP4 264+260
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $156
line 326
;326:			patrolflags = PATROL_LOOP;
ADDRLP4 652
CNSTI4 1
ASGNI4
line 327
;327:			break;
ADDRGP4 $140
JUMPV
LABELV $156
line 329
;328:		}
;329:		else if (keyareamatch.subtype & ST_REVERSE) {
ADDRLP4 264+260
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $159
line 330
;330:			patrolflags = PATROL_REVERSE;
ADDRLP4 652
CNSTI4 2
ASGNI4
line 331
;331:			break;
ADDRGP4 $140
JUMPV
LABELV $159
line 333
;332:		}
;333:		else if (keyareamatch.subtype & ST_MORE) {
ADDRLP4 264+260
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $140
line 334
;334:			trap_BotMatchVariable(&keyareamatch, MORE, keyarea, MAX_MESSAGE_SIZE);
ADDRLP4 264
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 335
;335:		}
line 336
;336:		else {
line 337
;337:			break;
LABELV $163
line 339
;338:		}
;339:	}
LABELV $139
line 294
ADDRGP4 $138
JUMPV
LABELV $140
line 341
;340:	//
;341:	if (!newpatrolpoints || !newpatrolpoints->next) {
ADDRLP4 592
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $167
ADDRLP4 592
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $165
LABELV $167
line 342
;342:		trap_EA_SayTeam(bs->client, "I need more key points to patrol\n");
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 $168
ARGP4
ADDRGP4 trap_EA_SayTeam
CALLV
pop
line 343
;343:		BotFreeWaypoints(newpatrolpoints);
ADDRLP4 592
INDIRP4
ARGP4
ADDRGP4 BotFreeWaypoints
CALLV
pop
line 344
;344:		newpatrolpoints = NULL;
ADDRLP4 592
CNSTP4 0
ASGNP4
line 345
;345:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $137
JUMPV
LABELV $165
line 348
;346:	}
;347:	//
;348:	BotFreeWaypoints(bs->patrolpoints);
ADDRFP4 0
INDIRP4
CNSTI4 9080
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotFreeWaypoints
CALLV
pop
line 349
;349:	bs->patrolpoints = newpatrolpoints;
ADDRFP4 0
INDIRP4
CNSTI4 9080
ADDP4
ADDRLP4 592
INDIRP4
ASGNP4
line 351
;350:	//
;351:	bs->curpatrolpoint = bs->patrolpoints;
ADDRLP4 660
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 660
INDIRP4
CNSTI4 9084
ADDP4
ADDRLP4 660
INDIRP4
CNSTI4 9080
ADDP4
INDIRP4
ASGNP4
line 352
;352:	bs->patrolflags = patrolflags;
ADDRFP4 0
INDIRP4
CNSTI4 9088
ADDP4
ADDRLP4 652
INDIRI4
ASGNI4
line 354
;353:	//
;354:	return qtrue;
CNSTI4 1
RETI4
LABELV $137
endproc BotGetPatrolWaypoints 672 16
export BotAddressedToBot
proc BotAddressedToBot 1572 16
line 362
;355:}
;356:
;357:/*
;358:==================
;359:BotAddressedToBot
;360:==================
;361:*/
;362:int BotAddressedToBot(bot_state_t *bs, bot_match_t *match) {
line 370
;363:	char addressedto[MAX_MESSAGE_SIZE];
;364:	char netname[MAX_MESSAGE_SIZE];
;365:	char name[MAX_MESSAGE_SIZE];
;366:	char botname[128];
;367:	int client;
;368:	bot_match_t addresseematch;
;369:
;370:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 840
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 371
;371:	client = ClientOnSameTeamFromName(bs, netname);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 840
ARGP4
ADDRLP4 1228
ADDRGP4 ClientOnSameTeamFromName
CALLI4
ASGNI4
ADDRLP4 1096
ADDRLP4 1228
INDIRI4
ASGNI4
line 372
;372:	if (client < 0) return qfalse;
ADDRLP4 1096
INDIRI4
CNSTI4 0
GEI4 $170
CNSTI4 0
RETI4
ADDRGP4 $169
JUMPV
LABELV $170
line 374
;373:	//if the message is addressed to someone
;374:	if (match->subtype & ST_ADDRESSED) {
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $172
line 375
;375:		trap_BotMatchVariable(match, ADDRESSEE, addressedto, sizeof(addressedto));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 584
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 377
;376:		//the name of this bot
;377:		ClientName(bs->client, botname, 128);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 1100
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 ClientName
CALLP4
pop
ADDRGP4 $175
JUMPV
LABELV $174
line 379
;378:		//
;379:		while(trap_BotFindMatch(addressedto, &addresseematch, MTCONTEXT_ADDRESSEE)) {
line 380
;380:			if (addresseematch.type == MSG_EVERYONE) {
ADDRLP4 0+256
INDIRI4
CNSTI4 101
NEI4 $177
line 381
;381:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $169
JUMPV
LABELV $177
line 383
;382:			}
;383:			else if (addresseematch.type == MSG_MULTIPLENAMES) {
ADDRLP4 0+256
INDIRI4
CNSTI4 102
NEI4 $180
line 384
;384:				trap_BotMatchVariable(&addresseematch, TEAMMATE, name, sizeof(name));
ADDRLP4 0
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 328
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 385
;385:				if (strlen(name)) {
ADDRLP4 328
ARGP4
ADDRLP4 1232
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1232
INDIRI4
CNSTI4 0
EQI4 $183
line 386
;386:					if (stristr(botname, name)) return qtrue;
ADDRLP4 1100
ARGP4
ADDRLP4 328
ARGP4
ADDRLP4 1236
ADDRGP4 stristr
CALLP4
ASGNP4
ADDRLP4 1236
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $185
CNSTI4 1
RETI4
ADDRGP4 $169
JUMPV
LABELV $185
line 387
;387:					if (stristr(bs->subteam, name)) return qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6984
ADDP4
ARGP4
ADDRLP4 328
ARGP4
ADDRLP4 1240
ADDRGP4 stristr
CALLP4
ASGNP4
ADDRLP4 1240
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $187
CNSTI4 1
RETI4
ADDRGP4 $169
JUMPV
LABELV $187
line 388
;388:				}
LABELV $183
line 389
;389:				trap_BotMatchVariable(&addresseematch, MORE, addressedto, MAX_MESSAGE_SIZE);
ADDRLP4 0
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 584
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 390
;390:			}
ADDRGP4 $181
JUMPV
LABELV $180
line 391
;391:			else {
line 392
;392:				trap_BotMatchVariable(&addresseematch, TEAMMATE, name, MAX_MESSAGE_SIZE);
ADDRLP4 0
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 328
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 393
;393:				if (strlen(name)) {
ADDRLP4 328
ARGP4
ADDRLP4 1232
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1232
INDIRI4
CNSTI4 0
EQI4 $176
line 394
;394:					if (stristr(botname, name)) return qtrue;
ADDRLP4 1100
ARGP4
ADDRLP4 328
ARGP4
ADDRLP4 1236
ADDRGP4 stristr
CALLP4
ASGNP4
ADDRLP4 1236
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $191
CNSTI4 1
RETI4
ADDRGP4 $169
JUMPV
LABELV $191
line 395
;395:					if (stristr(bs->subteam, name)) return qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6984
ADDP4
ARGP4
ADDRLP4 328
ARGP4
ADDRLP4 1240
ADDRGP4 stristr
CALLP4
ASGNP4
ADDRLP4 1240
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $176
CNSTI4 1
RETI4
ADDRGP4 $169
JUMPV
line 396
;396:				}
line 397
;397:				break;
LABELV $181
line 399
;398:			}
;399:		}
LABELV $175
line 379
ADDRLP4 584
ARGP4
ADDRLP4 0
ARGP4
CNSTU4 32
ARGU4
ADDRLP4 1232
ADDRGP4 trap_BotFindMatch
CALLI4
ASGNI4
ADDRLP4 1232
INDIRI4
CNSTI4 0
NEI4 $174
LABELV $176
line 402
;400:		//Com_sprintf(buf, sizeof(buf), "not addressed to me but %s", addressedto);
;401:		//trap_EA_Say(bs->client, buf);
;402:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $169
JUMPV
LABELV $172
line 404
;403:	}
;404:	else {
line 407
;405:		bot_match_t tellmatch;
;406:
;407:		tellmatch.type = 0;
ADDRLP4 1232+256
CNSTI4 0
ASGNI4
line 409
;408:		//if this message wasn't directed solely to this bot
;409:		if (!trap_BotFindMatch(match->string, &tellmatch, MTCONTEXT_REPLYCHAT) ||
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1232
ARGP4
CNSTU4 128
ARGU4
ADDRLP4 1560
ADDRGP4 trap_BotFindMatch
CALLI4
ASGNI4
ADDRLP4 1560
INDIRI4
CNSTI4 0
EQI4 $199
ADDRLP4 1232+256
INDIRI4
CNSTI4 202
EQI4 $196
LABELV $199
line 410
;410:				tellmatch.type != MSG_CHATTELL) {
line 412
;411:			//make sure not everyone reacts to this message
;412:			if (random() > (float ) 1.0 / (NumPlayersOnSameTeam(bs)-1)) return qfalse;
ADDRLP4 1564
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1568
ADDRGP4 NumPlayersOnSameTeam
CALLI4
ASGNI4
ADDRLP4 1564
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1065353216
ADDRLP4 1568
INDIRI4
CNSTI4 1
SUBI4
CVIF4 4
DIVF4
LEF4 $200
CNSTI4 0
RETI4
ADDRGP4 $169
JUMPV
LABELV $200
line 413
;413:		}
LABELV $196
line 414
;414:	}
line 415
;415:	return qtrue;
CNSTI4 1
RETI4
LABELV $169
endproc BotAddressedToBot 1572 16
export BotGPSToPosition
proc BotGPSToPosition 20 12
line 423
;416:}
;417:
;418:/*
;419:==================
;420:BotGPSToPosition
;421:==================
;422:*/
;423:int BotGPSToPosition(char *buf, vec3_t position) {
line 424
;424:	int i, j = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 427
;425:	int num, sign;
;426:
;427:	for (i = 0; i < 3; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $203
line 428
;428:		num = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $208
JUMPV
LABELV $207
line 429
;429:		while(buf[j] == ' ') j++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $208
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $207
line 430
;430:		if (buf[j] == '-') {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 45
NEI4 $210
line 431
;431:			j++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 432
;432:			sign = -1;
ADDRLP4 12
CNSTI4 -1
ASGNI4
line 433
;433:		}
ADDRGP4 $213
JUMPV
LABELV $210
line 434
;434:		else {
line 435
;435:			sign = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 436
;436:		}
ADDRGP4 $213
JUMPV
LABELV $212
line 437
;437:		while (buf[j]) {
line 438
;438:			if (buf[j] >= '0' && buf[j] <= '9') {
ADDRLP4 16
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 48
LTI4 $215
ADDRLP4 16
INDIRI4
CNSTI4 57
GTI4 $215
line 439
;439:				num = num * 10 + buf[j] - '0';
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 10
MULI4
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ADDI4
CNSTI4 48
SUBI4
ASGNI4
line 440
;440:				j++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 441
;441:			}
ADDRGP4 $216
JUMPV
LABELV $215
line 442
;442:			else {
line 443
;443:				j++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 444
;444:				break;
ADDRGP4 $214
JUMPV
LABELV $216
line 446
;445:			}
;446:		}
LABELV $213
line 437
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $212
LABELV $214
line 447
;447:		BotAI_Print(PRT_MESSAGE, "%d\n", sign * num);
CNSTI4 1
ARGI4
ADDRGP4 $217
ARGP4
ADDRLP4 12
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 448
;448:		position[i] = (float) sign * num;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
ADDRLP4 12
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 449
;449:	}
LABELV $204
line 427
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 3
LTI4 $203
line 450
;450:	return qtrue;
CNSTI4 1
RETI4
LABELV $202
endproc BotGPSToPosition 20 12
export BotMatch_HelpAccompany
proc BotMatch_HelpAccompany 1272 16
line 458
;451:}
;452:
;453:/*
;454:==================
;455:BotMatch_HelpAccompany
;456:==================
;457:*/
;458:void BotMatch_HelpAccompany(bot_state_t *bs, bot_match_t *match) {
line 466
;459:	int client, other, areanum;
;460:	char teammate[MAX_MESSAGE_SIZE];
;461:	char netname[MAX_MESSAGE_SIZE];
;462:	char itemname[MAX_MESSAGE_SIZE];
;463:	bot_match_t teammatematch;
;464:	aas_entityinfo_t entinfo;
;465:
;466:	if (!TeamPlayIsOn()) return;
ADDRLP4 1248
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 1248
INDIRI4
CNSTI4 0
NEI4 $219
ADDRGP4 $218
JUMPV
LABELV $219
line 468
;467:	//if not addressed to this bot
;468:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1252
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 1252
INDIRI4
CNSTI4 0
NEI4 $221
ADDRGP4 $218
JUMPV
LABELV $221
line 470
;469:	//get the team mate name
;470:	trap_BotMatchVariable(match, TEAMMATE, teammate, sizeof(teammate));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 472
;471:	//get the client to help
;472:	if (trap_BotFindMatch(teammate, &teammatematch, MTCONTEXT_TEAMMATE) &&
ADDRLP4 260
ARGP4
ADDRLP4 656
ARGP4
CNSTU4 16
ARGU4
ADDRLP4 1256
ADDRGP4 trap_BotFindMatch
CALLI4
ASGNI4
ADDRLP4 1256
INDIRI4
CNSTI4 0
EQI4 $223
ADDRLP4 656+256
INDIRI4
CNSTI4 100
NEI4 $223
line 474
;473:			//if someone asks for him or herself
;474:			teammatematch.type == MSG_ME) {
line 476
;475:		//get the netname
;476:		trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 477
;477:		client = ClientFromName(netname);
ADDRLP4 4
ARGP4
ADDRLP4 1260
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1260
INDIRI4
ASGNI4
line 478
;478:		other = qfalse;
ADDRLP4 984
CNSTI4 0
ASGNI4
line 479
;479:	}
ADDRGP4 $224
JUMPV
LABELV $223
line 480
;480:	else {
line 482
;481:		//asked for someone else
;482:		client = FindClientByName(teammate);
ADDRLP4 260
ARGP4
ADDRLP4 1260
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1260
INDIRI4
ASGNI4
line 484
;483:		//if this is the bot self
;484:		if (client == bs->client) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $226
line 485
;485:			other = qfalse;
ADDRLP4 984
CNSTI4 0
ASGNI4
line 486
;486:		}
ADDRGP4 $227
JUMPV
LABELV $226
line 487
;487:		else if (!BotSameTeam(bs, client)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1264
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 1264
INDIRI4
CNSTI4 0
NEI4 $228
line 489
;488:			//FIXME: say "I don't help the enemy"
;489:			return;
ADDRGP4 $218
JUMPV
LABELV $228
line 491
;490:		}
;491:		else {
line 492
;492:			other = qtrue;
ADDRLP4 984
CNSTI4 1
ASGNI4
line 493
;493:		}
LABELV $227
line 494
;494:	}
LABELV $224
line 496
;495:	//if the bot doesn't know who to help (FindClientByName returned -1)
;496:	if (client < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $230
line 497
;497:		if (other) BotAI_BotInitialChat(bs, "whois", teammate, NULL);
ADDRLP4 984
INDIRI4
CNSTI4 0
EQI4 $232
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $234
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
ADDRGP4 $233
JUMPV
LABELV $232
line 498
;498:		else BotAI_BotInitialChat(bs, "whois", netname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $234
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
LABELV $233
line 499
;499:		client = ClientFromName(netname);
ADDRLP4 4
ARGP4
ADDRLP4 1260
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1260
INDIRI4
ASGNI4
line 500
;500:		trap_BotEnterChat(bs->cs, client, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 501
;501:		return;
ADDRGP4 $218
JUMPV
LABELV $230
line 504
;502:	}
;503:	//don't help or accompany yourself
;504:	if (client == bs->client) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $235
line 505
;505:		return;
ADDRGP4 $218
JUMPV
LABELV $235
line 508
;506:	}
;507:	//
;508:	bs->teamgoal.entitynum = -1;
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
CNSTI4 -1
ASGNI4
line 509
;509:	BotEntityInfo(client, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 516
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 511
;510:	//if info is valid (in PVS)
;511:	if (entinfo.valid) {
ADDRLP4 516
INDIRI4
CNSTI4 0
EQI4 $237
line 512
;512:		areanum = BotPointAreaNum(entinfo.origin);
ADDRLP4 516+24
ARGP4
ADDRLP4 1260
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 988
ADDRLP4 1260
INDIRI4
ASGNI4
line 513
;513:		if (areanum) {// && trap_AAS_AreaReachability(areanum)) {
ADDRLP4 988
INDIRI4
CNSTI4 0
EQI4 $240
line 514
;514:			bs->teamgoal.entitynum = client;
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 515
;515:			bs->teamgoal.areanum = areanum;
ADDRFP4 0
INDIRP4
CNSTI4 6636
ADDP4
ADDRLP4 988
INDIRI4
ASGNI4
line 516
;516:			VectorCopy(entinfo.origin, bs->teamgoal.origin);
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ADDRLP4 516+24
INDIRB
ASGNB 12
line 517
;517:			VectorSet(bs->teamgoal.mins, -8, -8, -8);
ADDRFP4 0
INDIRP4
CNSTI4 6640
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6644
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6648
ADDP4
CNSTF4 3238002688
ASGNF4
line 518
;518:			VectorSet(bs->teamgoal.maxs, 8, 8, 8);
ADDRFP4 0
INDIRP4
CNSTI4 6652
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6656
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6660
ADDP4
CNSTF4 1090519040
ASGNF4
line 519
;519:		}
LABELV $240
line 520
;520:	}
LABELV $237
line 522
;521:	//if no teamgoal yet
;522:	if (bs->teamgoal.entitynum < 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
INDIRI4
CNSTI4 0
GEI4 $243
line 524
;523:		//if near an item
;524:		if (match->subtype & ST_NEARITEM) {
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $245
line 526
;525:			//get the match variable
;526:			trap_BotMatchVariable(match, ITEM, itemname, sizeof(itemname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 992
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 528
;527:			//
;528:			if (!BotGetMessageTeamGoal(bs, itemname, &bs->teamgoal)) {
ADDRLP4 1260
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1260
INDIRP4
ARGP4
ADDRLP4 992
ARGP4
ADDRLP4 1260
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRLP4 1264
ADDRGP4 BotGetMessageTeamGoal
CALLI4
ASGNI4
ADDRLP4 1264
INDIRI4
CNSTI4 0
NEI4 $247
line 531
;529:				//BotAI_BotInitialChat(bs, "cannotfind", itemname, NULL);
;530:				//trap_BotEnterChat(bs->cs, bs->client, CHAT_TEAM);
;531:				return;
ADDRGP4 $218
JUMPV
LABELV $247
line 533
;532:			}
;533:		}
LABELV $245
line 534
;534:	}
LABELV $243
line 536
;535:	//
;536:	if (bs->teamgoal.entitynum < 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
INDIRI4
CNSTI4 0
GEI4 $249
line 537
;537:		if (other) BotAI_BotInitialChat(bs, "whereis", teammate, NULL);
ADDRLP4 984
INDIRI4
CNSTI4 0
EQI4 $251
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $253
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
ADDRGP4 $252
JUMPV
LABELV $251
line 538
;538:		else BotAI_BotInitialChat(bs, "whereareyou", netname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $254
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
LABELV $252
line 539
;539:		client = ClientFromName(netname);
ADDRLP4 4
ARGP4
ADDRLP4 1260
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1260
INDIRI4
ASGNI4
line 540
;540:		trap_BotEnterChat(bs->cs, client, CHAT_TEAM);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 541
;541:		return;
ADDRGP4 $218
JUMPV
LABELV $249
line 544
;542:	}
;543:	//the team mate
;544:	bs->teammate = client;
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 546
;545:	//
;546:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 548
;547:	//
;548:	client = ClientFromName(netname);
ADDRLP4 4
ARGP4
ADDRLP4 1260
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1260
INDIRI4
ASGNI4
line 550
;549:	//the team mate who ordered
;550:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 551
;551:	bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 1
ASGNI4
line 552
;552:	bs->order_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 554
;553:	//last time the team mate was assumed visible
;554:	bs->teammatevisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6748
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 556
;555:	//set the time to send a message to the team mates
;556:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 1264
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 1264
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1073741824
MULF4
ADDF4
ASGNF4
line 558
;557:	//get the team goal time
;558:	bs->teamgoal_time = BotGetTime(match);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1268
ADDRGP4 BotGetTime
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRLP4 1268
INDIRF4
ASGNF4
line 560
;559:	//set the ltg type
;560:	if (match->type == MSG_HELP) {
ADDRFP4 4
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 3
NEI4 $255
line 561
;561:		bs->ltgtype = LTG_TEAMHELP;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 1
ASGNI4
line 562
;562:		if (!bs->teamgoal_time) bs->teamgoal_time = FloatTime() + TEAM_HELP_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
CNSTF4 0
NEF4 $256
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 563
;563:	}
ADDRGP4 $256
JUMPV
LABELV $255
line 564
;564:	else {
line 565
;565:		bs->ltgtype = LTG_TEAMACCOMPANY;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 2
ASGNI4
line 566
;566:		if (!bs->teamgoal_time) bs->teamgoal_time = FloatTime() + TEAM_ACCOMPANY_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
CNSTF4 0
NEF4 $259
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
LABELV $259
line 567
;567:		bs->formation_dist = 3.5 * 32;		//3.5 meter
ADDRFP4 0
INDIRP4
CNSTI4 7016
ADDP4
CNSTF4 1121976320
ASGNF4
line 568
;568:		bs->arrive_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
CNSTF4 0
ASGNF4
line 570
;569:		//
;570:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 572
;571:		// remember last ordered task
;572:		BotRememberLastOrderedTask(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRememberLastOrderedTask
CALLV
pop
line 573
;573:	}
LABELV $256
line 577
;574:#ifdef DEBUG
;575:	BotPrintTeamGoal(bs);
;576:#endif //DEBUG
;577:}
LABELV $218
endproc BotMatch_HelpAccompany 1272 16
export BotMatch_DefendKeyArea
proc BotMatch_DefendKeyArea 544 16
line 584
;578:
;579:/*
;580:==================
;581:BotMatch_DefendKeyArea
;582:==================
;583:*/
;584:void BotMatch_DefendKeyArea(bot_state_t *bs, bot_match_t *match) {
line 589
;585:	char itemname[MAX_MESSAGE_SIZE];
;586:	char netname[MAX_MESSAGE_SIZE];
;587:	int client;
;588:
;589:	if (!TeamPlayIsOn()) return;
ADDRLP4 516
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 516
INDIRI4
CNSTI4 0
NEI4 $262
ADDRGP4 $261
JUMPV
LABELV $262
line 591
;590:	//if not addressed to this bot
;591:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 520
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 520
INDIRI4
CNSTI4 0
NEI4 $264
ADDRGP4 $261
JUMPV
LABELV $264
line 593
;592:	//get the match variable
;593:	trap_BotMatchVariable(match, KEYAREA, itemname, sizeof(itemname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 595
;594:	//
;595:	if (!BotGetMessageTeamGoal(bs, itemname, &bs->teamgoal)) {
ADDRLP4 524
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 524
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 524
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRLP4 528
ADDRGP4 BotGetMessageTeamGoal
CALLI4
ASGNI4
ADDRLP4 528
INDIRI4
CNSTI4 0
NEI4 $266
line 598
;596:		//BotAI_BotInitialChat(bs, "cannotfind", itemname, NULL);
;597:		//trap_BotEnterChat(bs->cs, bs->client, CHAT_TEAM);
;598:		return;
ADDRGP4 $261
JUMPV
LABELV $266
line 601
;599:	}
;600:	//
;601:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 256
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 603
;602:	//
;603:	client = ClientFromName(netname);
ADDRLP4 256
ARGP4
ADDRLP4 532
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 512
ADDRLP4 532
INDIRI4
ASGNI4
line 605
;604:	//the team mate who ordered
;605:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 512
INDIRI4
ASGNI4
line 606
;606:	bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 1
ASGNI4
line 607
;607:	bs->order_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 609
;608:	//set the time to send a message to the team mates
;609:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 536
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 536
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1073741824
MULF4
ADDF4
ASGNF4
line 611
;610:	//set the ltg type
;611:	bs->ltgtype = LTG_DEFENDKEYAREA;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 3
ASGNI4
line 613
;612:	//get the team goal time
;613:	bs->teamgoal_time = BotGetTime(match);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 540
ADDRGP4 BotGetTime
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRLP4 540
INDIRF4
ASGNF4
line 615
;614:	//set the team goal time
;615:	if (!bs->teamgoal_time) bs->teamgoal_time = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
CNSTF4 0
NEF4 $268
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
LABELV $268
line 617
;616:	//away from defending
;617:	bs->defendaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6144
ADDP4
CNSTF4 0
ASGNF4
line 619
;618:	//
;619:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 621
;620:	// remember last ordered task
;621:	BotRememberLastOrderedTask(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRememberLastOrderedTask
CALLV
pop
line 625
;622:#ifdef DEBUG
;623:	BotPrintTeamGoal(bs);
;624:#endif //DEBUG
;625:}
LABELV $261
endproc BotMatch_DefendKeyArea 544 16
export BotMatch_GetItem
proc BotMatch_GetItem 540 16
line 632
;626:
;627:/*
;628:==================
;629:BotMatch_GetItem
;630:==================
;631:*/
;632:void BotMatch_GetItem(bot_state_t *bs, bot_match_t *match) {
line 637
;633:	char itemname[MAX_MESSAGE_SIZE];
;634:	char netname[MAX_MESSAGE_SIZE];
;635:	int client;
;636:
;637:	if (!TeamPlayIsOn()) return;
ADDRLP4 516
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 516
INDIRI4
CNSTI4 0
NEI4 $271
ADDRGP4 $270
JUMPV
LABELV $271
line 639
;638:	//if not addressed to this bot
;639:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 520
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 520
INDIRI4
CNSTI4 0
NEI4 $273
ADDRGP4 $270
JUMPV
LABELV $273
line 641
;640:	//get the match variable
;641:	trap_BotMatchVariable(match, ITEM, itemname, sizeof(itemname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 643
;642:	//
;643:	if (!BotGetMessageTeamGoal(bs, itemname, &bs->teamgoal)) {
ADDRLP4 524
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 524
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 524
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRLP4 528
ADDRGP4 BotGetMessageTeamGoal
CALLI4
ASGNI4
ADDRLP4 528
INDIRI4
CNSTI4 0
NEI4 $275
line 646
;644:		//BotAI_BotInitialChat(bs, "cannotfind", itemname, NULL);
;645:		//trap_BotEnterChat(bs->cs, bs->client, CHAT_TEAM);
;646:		return;
ADDRGP4 $270
JUMPV
LABELV $275
line 648
;647:	}
;648:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 256
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 649
;649:	client = ClientOnSameTeamFromName(bs, netname);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRLP4 532
ADDRGP4 ClientOnSameTeamFromName
CALLI4
ASGNI4
ADDRLP4 512
ADDRLP4 532
INDIRI4
ASGNI4
line 651
;650:	//
;651:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 512
INDIRI4
ASGNI4
line 652
;652:	bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 1
ASGNI4
line 653
;653:	bs->order_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 655
;654:	//set the time to send a message to the team mates
;655:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 536
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 536
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1073741824
MULF4
ADDF4
ASGNF4
line 657
;656:	//set the ltg type
;657:	bs->ltgtype = LTG_GETITEM;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 10
ASGNI4
line 659
;658:	//set the team goal time
;659:	bs->teamgoal_time = FloatTime() + TEAM_GETITEM_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 661
;660:	//
;661:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 665
;662:#ifdef DEBUG
;663:	BotPrintTeamGoal(bs);
;664:#endif //DEBUG
;665:}
LABELV $270
endproc BotMatch_GetItem 540 16
export BotMatch_Camp
proc BotMatch_Camp 688 16
line 672
;666:
;667:/*
;668:==================
;669:BotMatch_Camp
;670:==================
;671:*/
;672:void BotMatch_Camp(bot_state_t *bs, bot_match_t *match) {
line 678
;673:	int client, areanum;
;674:	char netname[MAX_MESSAGE_SIZE];
;675:	char itemname[MAX_MESSAGE_SIZE];
;676:	aas_entityinfo_t entinfo;
;677:
;678:	if (!TeamPlayIsOn()) return;
ADDRLP4 660
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 660
INDIRI4
CNSTI4 0
NEI4 $278
ADDRGP4 $277
JUMPV
LABELV $278
line 680
;679:	//if not addressed to this bot
;680:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 664
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 664
INDIRI4
CNSTI4 0
NEI4 $280
ADDRGP4 $277
JUMPV
LABELV $280
line 682
;681:	//
;682:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 684
;683:	//asked for someone else
;684:	client = FindClientByName(netname);
ADDRLP4 4
ARGP4
ADDRLP4 668
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 668
INDIRI4
ASGNI4
line 686
;685:	//if there's no valid client with this name
;686:	if (client < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $282
line 687
;687:		BotAI_BotInitialChat(bs, "whois", netname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $234
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 688
;688:		trap_BotEnterChat(bs->cs, bs->client, CHAT_TEAM);
ADDRLP4 672
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 672
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 672
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 689
;689:		return;
ADDRGP4 $277
JUMPV
LABELV $282
line 692
;690:	}
;691:	//get the match variable
;692:	trap_BotMatchVariable(match, KEYAREA, itemname, sizeof(itemname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 694
;693:	//in CTF it could be the base
;694:	if (match->subtype & ST_THERE) {
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $284
line 696
;695:		//camp at the spot the bot is currently standing
;696:		bs->teamgoal.entitynum = bs->entitynum;
ADDRLP4 672
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 672
INDIRP4
CNSTI4 6664
ADDP4
ADDRLP4 672
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 697
;697:		bs->teamgoal.areanum = bs->areanum;
ADDRLP4 676
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 676
INDIRP4
CNSTI4 6636
ADDP4
ADDRLP4 676
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ASGNI4
line 698
;698:		VectorCopy(bs->origin, bs->teamgoal.origin);
ADDRLP4 680
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 680
INDIRP4
CNSTI4 6624
ADDP4
ADDRLP4 680
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 699
;699:		VectorSet(bs->teamgoal.mins, -8, -8, -8);
ADDRFP4 0
INDIRP4
CNSTI4 6640
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6644
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6648
ADDP4
CNSTF4 3238002688
ASGNF4
line 700
;700:		VectorSet(bs->teamgoal.maxs, 8, 8, 8);
ADDRFP4 0
INDIRP4
CNSTI4 6652
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6656
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6660
ADDP4
CNSTF4 1090519040
ASGNF4
line 701
;701:	}
ADDRGP4 $285
JUMPV
LABELV $284
line 702
;702:	else if (match->subtype & ST_HERE) {
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $286
line 704
;703:		//if this is the bot self
;704:		if (client == bs->client) return;
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $288
ADDRGP4 $277
JUMPV
LABELV $288
line 706
;705:		//
;706:		bs->teamgoal.entitynum = -1;
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
CNSTI4 -1
ASGNI4
line 707
;707:		BotEntityInfo(client, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 516
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 709
;708:		//if info is valid (in PVS)
;709:		if (entinfo.valid) {
ADDRLP4 516
INDIRI4
CNSTI4 0
EQI4 $290
line 710
;710:			areanum = BotPointAreaNum(entinfo.origin);
ADDRLP4 516+24
ARGP4
ADDRLP4 672
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 656
ADDRLP4 672
INDIRI4
ASGNI4
line 711
;711:			if (areanum) {// && trap_AAS_AreaReachability(areanum)) {
ADDRLP4 656
INDIRI4
CNSTI4 0
EQI4 $293
line 714
;712:				//NOTE: just assume the bot knows where the person is
;713:				//if (BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, client)) {
;714:					bs->teamgoal.entitynum = client;
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 715
;715:					bs->teamgoal.areanum = areanum;
ADDRFP4 0
INDIRP4
CNSTI4 6636
ADDP4
ADDRLP4 656
INDIRI4
ASGNI4
line 716
;716:					VectorCopy(entinfo.origin, bs->teamgoal.origin);
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ADDRLP4 516+24
INDIRB
ASGNB 12
line 717
;717:					VectorSet(bs->teamgoal.mins, -8, -8, -8);
ADDRFP4 0
INDIRP4
CNSTI4 6640
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6644
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6648
ADDP4
CNSTF4 3238002688
ASGNF4
line 718
;718:					VectorSet(bs->teamgoal.maxs, 8, 8, 8);
ADDRFP4 0
INDIRP4
CNSTI4 6652
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6656
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6660
ADDP4
CNSTF4 1090519040
ASGNF4
line 720
;719:				//}
;720:			}
LABELV $293
line 721
;721:		}
LABELV $290
line 723
;722:		//if the other is not visible
;723:		if (bs->teamgoal.entitynum < 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
INDIRI4
CNSTI4 0
GEI4 $287
line 724
;724:			BotAI_BotInitialChat(bs, "whereareyou", netname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $254
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 725
;725:			client = ClientFromName(netname);
ADDRLP4 4
ARGP4
ADDRLP4 672
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 672
INDIRI4
ASGNI4
line 726
;726:			trap_BotEnterChat(bs->cs, client, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 727
;727:			return;
ADDRGP4 $277
JUMPV
line 729
;728:		}
;729:	}
LABELV $286
line 730
;730:	else if (!BotGetMessageTeamGoal(bs, itemname, &bs->teamgoal)) {
ADDRLP4 672
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 672
INDIRP4
ARGP4
ADDRLP4 260
ARGP4
ADDRLP4 672
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRLP4 676
ADDRGP4 BotGetMessageTeamGoal
CALLI4
ASGNI4
ADDRLP4 676
INDIRI4
CNSTI4 0
NEI4 $298
line 734
;731:		//BotAI_BotInitialChat(bs, "cannotfind", itemname, NULL);
;732:		//client = ClientFromName(netname);
;733:		//trap_BotEnterChat(bs->cs, client, CHAT_TELL);
;734:		return;
ADDRGP4 $277
JUMPV
LABELV $298
LABELV $287
LABELV $285
line 737
;735:	}
;736:	//
;737:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 738
;738:	bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 1
ASGNI4
line 739
;739:	bs->order_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 741
;740:	//set the time to send a message to the team mates
;741:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 680
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 680
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1073741824
MULF4
ADDF4
ASGNF4
line 743
;742:	//set the ltg type
;743:	bs->ltgtype = LTG_CAMPORDER;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 8
ASGNI4
line 745
;744:	//get the team goal time
;745:	bs->teamgoal_time = BotGetTime(match);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 684
ADDRGP4 BotGetTime
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRLP4 684
INDIRF4
ASGNF4
line 747
;746:	//set the team goal time
;747:	if (!bs->teamgoal_time) bs->teamgoal_time = FloatTime() + TEAM_CAMP_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
CNSTF4 0
NEF4 $300
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
LABELV $300
line 749
;748:	//not arrived yet
;749:	bs->arrive_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
CNSTF4 0
ASGNF4
line 751
;750:	//
;751:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 753
;752:	// remember last ordered task
;753:	BotRememberLastOrderedTask(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRememberLastOrderedTask
CALLV
pop
line 757
;754:#ifdef DEBUG
;755:	BotPrintTeamGoal(bs);
;756:#endif //DEBUG
;757:}
LABELV $277
endproc BotMatch_Camp 688 16
export BotMatch_Patrol
proc BotMatch_Patrol 284 16
line 764
;758:
;759:/*
;760:==================
;761:BotMatch_Patrol
;762:==================
;763:*/
;764:void BotMatch_Patrol(bot_state_t *bs, bot_match_t *match) {
line 768
;765:	char netname[MAX_MESSAGE_SIZE];
;766:	int client;
;767:
;768:	if (!TeamPlayIsOn()) return;
ADDRLP4 260
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $303
ADDRGP4 $302
JUMPV
LABELV $303
line 770
;769:	//if not addressed to this bot
;770:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
NEI4 $305
ADDRGP4 $302
JUMPV
LABELV $305
line 772
;771:	//get the patrol waypoints
;772:	if (!BotGetPatrolWaypoints(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 268
ADDRGP4 BotGetPatrolWaypoints
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
NEI4 $307
ADDRGP4 $302
JUMPV
LABELV $307
line 774
;773:	//
;774:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 776
;775:	//
;776:	client = FindClientByName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 272
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 272
INDIRI4
ASGNI4
line 778
;777:	//
;778:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 256
INDIRI4
ASGNI4
line 779
;779:	bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 1
ASGNI4
line 780
;780:	bs->order_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 782
;781:	//set the time to send a message to the team mates
;782:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 276
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 276
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1073741824
MULF4
ADDF4
ASGNF4
line 784
;783:	//set the ltg type
;784:	bs->ltgtype = LTG_PATROL;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 9
ASGNI4
line 786
;785:	//get the team goal time
;786:	bs->teamgoal_time = BotGetTime(match);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 280
ADDRGP4 BotGetTime
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRLP4 280
INDIRF4
ASGNF4
line 788
;787:	//set the team goal time if not set already
;788:	if (!bs->teamgoal_time) bs->teamgoal_time = FloatTime() + TEAM_PATROL_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
CNSTF4 0
NEF4 $309
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
LABELV $309
line 790
;789:	//
;790:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 792
;791:	// remember last ordered task
;792:	BotRememberLastOrderedTask(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRememberLastOrderedTask
CALLV
pop
line 796
;793:#ifdef DEBUG
;794:	BotPrintTeamGoal(bs);
;795:#endif //DEBUG
;796:}
LABELV $302
endproc BotMatch_Patrol 284 16
export BotMatch_GetFlag
proc BotMatch_GetFlag 276 16
line 803
;797:
;798:/*
;799:==================
;800:BotMatch_GetFlag
;801:==================
;802:*/
;803:void BotMatch_GetFlag(bot_state_t *bs, bot_match_t *match) {
line 807
;804:	char netname[MAX_MESSAGE_SIZE];
;805:	int client;
;806:
;807:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $312
line 808
;808:		if (!ctf_redflag.areanum || !ctf_blueflag.areanum)
ADDRGP4 ctf_redflag+12
INDIRI4
CNSTI4 0
EQI4 $318
ADDRGP4 ctf_blueflag+12
INDIRI4
CNSTI4 0
NEI4 $313
LABELV $318
line 809
;809:			return;
ADDRGP4 $311
JUMPV
line 810
;810:	} else if (gametype == GT_ONEFLAG) {
LABELV $312
ADDRGP4 gametype
INDIRI4
CNSTI4 5
NEI4 $311
line 811
;811:		if (!ctf_neutralflag.areanum || !ctf_redflag.areanum || !ctf_blueflag.areanum)
ADDRGP4 ctf_neutralflag+12
INDIRI4
CNSTI4 0
EQI4 $327
ADDRGP4 ctf_redflag+12
INDIRI4
CNSTI4 0
EQI4 $327
ADDRGP4 ctf_blueflag+12
INDIRI4
CNSTI4 0
NEI4 $320
LABELV $327
line 812
;812:			return;
ADDRGP4 $311
JUMPV
line 813
;813:	} else {
line 814
;814:		return;
LABELV $320
LABELV $313
line 817
;815:	}
;816:	//if not addressed to this bot
;817:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 260
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $328
ADDRGP4 $311
JUMPV
LABELV $328
line 819
;818:	//
;819:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 821
;820:	//
;821:	client = FindClientByName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 264
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 264
INDIRI4
ASGNI4
line 823
;822:	//
;823:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 256
INDIRI4
ASGNI4
line 824
;824:	bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 1
ASGNI4
line 825
;825:	bs->order_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 827
;826:	//set the time to send a message to the team mates
;827:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 268
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 268
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1073741824
MULF4
ADDF4
ASGNF4
line 829
;828:	//set the ltg type
;829:	bs->ltgtype = LTG_GETFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 4
ASGNI4
line 831
;830:	//set the team goal time
;831:	bs->teamgoal_time = FloatTime() + CTF_GETFLAG_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 833
;832:	// get an alternate route in ctf
;833:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $330
line 835
;834:		//get an alternative route goal towards the enemy base
;835:		BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 272
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 272
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 836
;836:	}
LABELV $330
line 838
;837:	//
;838:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 840
;839:	// remember last ordered task
;840:	BotRememberLastOrderedTask(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRememberLastOrderedTask
CALLV
pop
line 844
;841:#ifdef DEBUG
;842:	BotPrintTeamGoal(bs);
;843:#endif //DEBUG
;844:}
LABELV $311
endproc BotMatch_GetFlag 276 16
export BotMatch_AttackEnemyBase
proc BotMatch_AttackEnemyBase 276 16
line 851
;845:
;846:/*
;847:==================
;848:BotMatch_AttackEnemyBase
;849:==================
;850:*/
;851:void BotMatch_AttackEnemyBase(bot_state_t *bs, bot_match_t *match) {
line 855
;852:	char netname[MAX_MESSAGE_SIZE];
;853:	int client;
;854:
;855:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $333
line 856
;856:		BotMatch_GetFlag(bs, match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotMatch_GetFlag
CALLV
pop
line 857
;857:	} else if (gametype == GT_ONEFLAG || gametype == GT_OVERLOAD || gametype == GT_HARVESTER) {
ADDRGP4 $334
JUMPV
LABELV $333
ADDRLP4 260
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 5
EQI4 $338
ADDRLP4 260
INDIRI4
CNSTI4 6
EQI4 $338
ADDRLP4 260
INDIRI4
CNSTI4 7
NEI4 $332
LABELV $338
line 858
;858:		if (!redobelisk.areanum || !blueobelisk.areanum)
ADDRGP4 redobelisk+12
INDIRI4
CNSTI4 0
EQI4 $343
ADDRGP4 blueobelisk+12
INDIRI4
CNSTI4 0
NEI4 $336
LABELV $343
line 859
;859:			return;
ADDRGP4 $332
JUMPV
line 860
;860:	} else {
line 861
;861:		return;
LABELV $336
LABELV $334
line 864
;862:	}
;863:	//if not addressed to this bot
;864:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
NEI4 $344
ADDRGP4 $332
JUMPV
LABELV $344
line 866
;865:	//
;866:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 868
;867:	//
;868:	client = FindClientByName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 268
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 268
INDIRI4
ASGNI4
line 870
;869:	//
;870:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 256
INDIRI4
ASGNI4
line 871
;871:	bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 1
ASGNI4
line 872
;872:	bs->order_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 874
;873:	//set the time to send a message to the team mates
;874:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 272
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 272
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1073741824
MULF4
ADDF4
ASGNF4
line 876
;875:	//set the ltg type
;876:	bs->ltgtype = LTG_ATTACKENEMYBASE;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 13
ASGNI4
line 878
;877:	//set the team goal time
;878:	bs->teamgoal_time = FloatTime() + TEAM_ATTACKENEMYBASE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 879
;879:	bs->attackaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6156
ADDP4
CNSTF4 0
ASGNF4
line 881
;880:	//
;881:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 883
;882:	// remember last ordered task
;883:	BotRememberLastOrderedTask(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRememberLastOrderedTask
CALLV
pop
line 887
;884:#ifdef DEBUG
;885:	BotPrintTeamGoal(bs);
;886:#endif //DEBUG
;887:}
LABELV $332
endproc BotMatch_AttackEnemyBase 276 16
export BotMatch_Harvest
proc BotMatch_Harvest 272 16
line 894
;888:
;889:/*
;890:==================
;891:BotMatch_Harvest
;892:==================
;893:*/
;894:void BotMatch_Harvest(bot_state_t *bs, bot_match_t *match) {
line 898
;895:	char netname[MAX_MESSAGE_SIZE];
;896:	int client;
;897:
;898:	if (gametype == GT_HARVESTER) {
ADDRGP4 gametype
INDIRI4
CNSTI4 7
NEI4 $346
line 899
;899:		if (!neutralobelisk.areanum || !redobelisk.areanum || !blueobelisk.areanum)
ADDRGP4 neutralobelisk+12
INDIRI4
CNSTI4 0
EQI4 $355
ADDRGP4 redobelisk+12
INDIRI4
CNSTI4 0
EQI4 $355
ADDRGP4 blueobelisk+12
INDIRI4
CNSTI4 0
NEI4 $348
LABELV $355
line 900
;900:			return;
ADDRGP4 $346
JUMPV
line 901
;901:	}
line 902
;902:	else {
line 903
;903:		return;
LABELV $348
line 906
;904:	}
;905:	//if not addressed to this bot
;906:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 260
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $356
ADDRGP4 $346
JUMPV
LABELV $356
line 908
;907:	//
;908:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 910
;909:	//
;910:	client = FindClientByName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 264
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 264
INDIRI4
ASGNI4
line 912
;911:	//
;912:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 256
INDIRI4
ASGNI4
line 913
;913:	bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 1
ASGNI4
line 914
;914:	bs->order_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 916
;915:	//set the time to send a message to the team mates
;916:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 268
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 268
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1073741824
MULF4
ADDF4
ASGNF4
line 918
;917:	//set the ltg type
;918:	bs->ltgtype = LTG_HARVEST;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 12
ASGNI4
line 920
;919:	//set the team goal time
;920:	bs->teamgoal_time = FloatTime() + TEAM_HARVEST_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 921
;921:	bs->harvestaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6160
ADDP4
CNSTF4 0
ASGNF4
line 923
;922:	//
;923:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 925
;924:	// remember last ordered task
;925:	BotRememberLastOrderedTask(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRememberLastOrderedTask
CALLV
pop
line 929
;926:#ifdef DEBUG
;927:	BotPrintTeamGoal(bs);
;928:#endif //DEBUG
;929:}
LABELV $346
endproc BotMatch_Harvest 272 16
export BotMatch_RushBase
proc BotMatch_RushBase 276 16
line 936
;930:
;931:/*
;932:==================
;933:BotMatch_RushBase
;934:==================
;935:*/
;936:void BotMatch_RushBase(bot_state_t *bs, bot_match_t *match) {
line 940
;937:	char netname[MAX_MESSAGE_SIZE];
;938:	int client;
;939:
;940:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $359
line 941
;941:		if (!ctf_redflag.areanum || !ctf_blueflag.areanum)
ADDRGP4 ctf_redflag+12
INDIRI4
CNSTI4 0
EQI4 $365
ADDRGP4 ctf_blueflag+12
INDIRI4
CNSTI4 0
NEI4 $360
LABELV $365
line 942
;942:			return;
ADDRGP4 $358
JUMPV
line 943
;943:	} else if (gametype == GT_ONEFLAG || gametype == GT_HARVESTER) {
LABELV $359
ADDRLP4 260
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 5
EQI4 $368
ADDRLP4 260
INDIRI4
CNSTI4 7
NEI4 $358
LABELV $368
line 944
;944:		if (!redobelisk.areanum || !blueobelisk.areanum)
ADDRGP4 redobelisk+12
INDIRI4
CNSTI4 0
EQI4 $373
ADDRGP4 blueobelisk+12
INDIRI4
CNSTI4 0
NEI4 $367
LABELV $373
line 945
;945:			return;
ADDRGP4 $358
JUMPV
line 946
;946:	} else {
line 947
;947:		return;
LABELV $367
LABELV $360
line 950
;948:	}
;949:	//if not addressed to this bot
;950:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
NEI4 $374
ADDRGP4 $358
JUMPV
LABELV $374
line 952
;951:	//
;952:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 954
;953:	//
;954:	client = FindClientByName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 268
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 268
INDIRI4
ASGNI4
line 956
;955:	//
;956:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 256
INDIRI4
ASGNI4
line 957
;957:	bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 1
ASGNI4
line 958
;958:	bs->order_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 960
;959:	//set the time to send a message to the team mates
;960:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 272
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 272
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1073741824
MULF4
ADDF4
ASGNF4
line 962
;961:	//set the ltg type
;962:	bs->ltgtype = LTG_RUSHBASE;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 5
ASGNI4
line 964
;963:	//set the team goal time
;964:	bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 965
;965:	bs->rushbaseaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
CNSTF4 0
ASGNF4
line 967
;966:	//
;967:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 971
;968:#ifdef DEBUG
;969:	BotPrintTeamGoal(bs);
;970:#endif //DEBUG
;971:}
LABELV $358
endproc BotMatch_RushBase 276 16
export BotMatch_TaskPreference
proc BotMatch_TaskPreference 320 16
line 978
;972:
;973:/*
;974:==================
;975:BotMatch_TaskPreference
;976:==================
;977:*/
;978:void BotMatch_TaskPreference(bot_state_t *bs, bot_match_t *match) {
line 983
;979:	char netname[MAX_NETNAME];
;980:	char teammatename[MAX_MESSAGE_SIZE];
;981:	int teammate, preference;
;982:
;983:	ClientName(bs->client, netname, sizeof(netname));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 984
;984:	if (Q_stricmp(netname, bs->teamleader) != 0) return;
ADDRLP4 260
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 300
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 300
INDIRI4
CNSTI4 0
EQI4 $377
ADDRGP4 $376
JUMPV
LABELV $377
line 986
;985:
;986:	trap_BotMatchVariable(match, NETNAME, teammatename, sizeof(teammatename));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 987
;987:	teammate = ClientFromName(teammatename);
ADDRLP4 0
ARGP4
ADDRLP4 304
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 304
INDIRI4
ASGNI4
line 988
;988:	if (teammate < 0) return;
ADDRLP4 256
INDIRI4
CNSTI4 0
GEI4 $379
ADDRGP4 $376
JUMPV
LABELV $379
line 990
;989:
;990:	preference = BotGetTeamMateTaskPreference(bs, teammate);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 256
INDIRI4
ARGI4
ADDRLP4 308
ADDRGP4 BotGetTeamMateTaskPreference
CALLI4
ASGNI4
ADDRLP4 296
ADDRLP4 308
INDIRI4
ASGNI4
line 991
;991:	switch(match->subtype)
ADDRLP4 312
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
ASGNI4
ADDRLP4 312
INDIRI4
CNSTI4 1
EQI4 $384
ADDRLP4 312
INDIRI4
CNSTI4 2
EQI4 $385
ADDRLP4 312
INDIRI4
CNSTI4 4
EQI4 $386
ADDRGP4 $381
JUMPV
line 992
;992:	{
LABELV $384
line 994
;993:		case ST_DEFENDER:
;994:		{
line 995
;995:			preference &= ~TEAMTP_ATTACKER;
ADDRLP4 296
ADDRLP4 296
INDIRI4
CNSTI4 -3
BANDI4
ASGNI4
line 996
;996:			preference |= TEAMTP_DEFENDER;
ADDRLP4 296
ADDRLP4 296
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 997
;997:			break;
ADDRGP4 $382
JUMPV
LABELV $385
line 1000
;998:		}
;999:		case ST_ATTACKER:
;1000:		{
line 1001
;1001:			preference &= ~TEAMTP_DEFENDER;
ADDRLP4 296
ADDRLP4 296
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 1002
;1002:			preference |= TEAMTP_ATTACKER;
ADDRLP4 296
ADDRLP4 296
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1003
;1003:			break;
ADDRGP4 $382
JUMPV
LABELV $386
line 1006
;1004:		}
;1005:		case ST_ROAMER:
;1006:		{
line 1007
;1007:			preference &= ~(TEAMTP_ATTACKER|TEAMTP_DEFENDER);
ADDRLP4 296
ADDRLP4 296
INDIRI4
CNSTI4 -4
BANDI4
ASGNI4
line 1008
;1008:			break;
LABELV $381
LABELV $382
line 1011
;1009:		}
;1010:	}
;1011:	BotSetTeamMateTaskPreference(bs, teammate, preference);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 256
INDIRI4
ARGI4
ADDRLP4 296
INDIRI4
ARGI4
ADDRGP4 BotSetTeamMateTaskPreference
CALLV
pop
line 1013
;1012:	//
;1013:	EasyClientName(teammate, teammatename, sizeof(teammatename));
ADDRLP4 256
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 1014
;1014:	BotAI_BotInitialChat(bs, "keepinmind", teammatename, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $387
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1015
;1015:	trap_BotEnterChat(bs->cs, teammate, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 256
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1016
;1016:	trap_EA_Action(bs->client, ACTION_AFFIRMATIVE);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1048576
ARGI4
ADDRGP4 trap_EA_Action
CALLV
pop
line 1017
;1017:}
LABELV $376
endproc BotMatch_TaskPreference 320 16
export BotMatch_ReturnFlag
proc BotMatch_ReturnFlag 276 16
line 1024
;1018:
;1019:/*
;1020:==================
;1021:BotMatch_ReturnFlag
;1022:==================
;1023:*/
;1024:void BotMatch_ReturnFlag(bot_state_t *bs, bot_match_t *match) {
line 1029
;1025:	char netname[MAX_MESSAGE_SIZE];
;1026:	int client;
;1027:
;1028:	//if not in CTF mode
;1029:	if ( gametype != GT_CTF && gametype != GT_ONEFLAG )
ADDRLP4 260
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 4
EQI4 $389
ADDRLP4 260
INDIRI4
CNSTI4 5
EQI4 $389
line 1030
;1030:		return;
ADDRGP4 $388
JUMPV
LABELV $389
line 1032
;1031:	//if not addressed to this bot
;1032:	if (!BotAddressedToBot(bs, match))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
NEI4 $391
line 1033
;1033:		return;
ADDRGP4 $388
JUMPV
LABELV $391
line 1035
;1034:	//
;1035:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1037
;1036:	//
;1037:	client = FindClientByName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 268
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 268
INDIRI4
ASGNI4
line 1039
;1038:	//
;1039:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 256
INDIRI4
ASGNI4
line 1040
;1040:	bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 1
ASGNI4
line 1041
;1041:	bs->order_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1043
;1042:	//set the time to send a message to the team mates
;1043:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 272
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 272
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1073741824
MULF4
ADDF4
ASGNF4
line 1045
;1044:	//set the ltg type
;1045:	bs->ltgtype = LTG_RETURNFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 6
ASGNI4
line 1047
;1046:	//set the team goal time
;1047:	bs->teamgoal_time = FloatTime() + CTF_RETURNFLAG_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 1048
;1048:	bs->rushbaseaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
CNSTF4 0
ASGNF4
line 1050
;1049:	//
;1050:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1054
;1051:#ifdef DEBUG
;1052:	BotPrintTeamGoal(bs);
;1053:#endif //DEBUG
;1054:}
LABELV $388
endproc BotMatch_ReturnFlag 276 16
export BotMatch_JoinSubteam
proc BotMatch_JoinSubteam 528 16
line 1061
;1055:
;1056:/*
;1057:==================
;1058:BotMatch_JoinSubteam
;1059:==================
;1060:*/
;1061:void BotMatch_JoinSubteam(bot_state_t *bs, bot_match_t *match) {
line 1066
;1062:	char teammate[MAX_MESSAGE_SIZE];
;1063:	char netname[MAX_MESSAGE_SIZE];
;1064:	int client;
;1065:
;1066:	if (!TeamPlayIsOn()) return;
ADDRLP4 516
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 516
INDIRI4
CNSTI4 0
NEI4 $394
ADDRGP4 $393
JUMPV
LABELV $394
line 1068
;1067:	//if not addressed to this bot
;1068:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 520
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 520
INDIRI4
CNSTI4 0
NEI4 $396
ADDRGP4 $393
JUMPV
LABELV $396
line 1070
;1069:	//get the sub team name
;1070:	trap_BotMatchVariable(match, TEAMNAME, teammate, sizeof(teammate));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1072
;1071:	//set the sub team name
;1072:	Q_strncpyz( bs->subteam, teammate, sizeof( bs->subteam ) );
ADDRFP4 0
INDIRP4
CNSTI4 6984
ADDP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1074
;1073:	//
;1074:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 256
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1075
;1075:	BotAI_BotInitialChat(bs, "joinedteam", teammate, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $398
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1076
;1076:	client = ClientFromName(netname);
ADDRLP4 256
ARGP4
ADDRLP4 524
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 512
ADDRLP4 524
INDIRI4
ASGNI4
line 1077
;1077:	trap_BotEnterChat(bs->cs, client, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 512
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1078
;1078:}
LABELV $393
endproc BotMatch_JoinSubteam 528 16
export BotMatch_LeaveSubteam
proc BotMatch_LeaveSubteam 280 16
line 1085
;1079:
;1080:/*
;1081:==================
;1082:BotMatch_LeaveSubteam
;1083:==================
;1084:*/
;1085:void BotMatch_LeaveSubteam(bot_state_t *bs, bot_match_t *match) {
line 1089
;1086:	char netname[MAX_MESSAGE_SIZE];
;1087:	int client;
;1088:
;1089:	if (!TeamPlayIsOn()) return;
ADDRLP4 260
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $400
ADDRGP4 $399
JUMPV
LABELV $400
line 1091
;1090:	//if not addressed to this bot
;1091:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
NEI4 $402
ADDRGP4 $399
JUMPV
LABELV $402
line 1093
;1092:	//
;1093:	if (strlen(bs->subteam))
ADDRFP4 0
INDIRP4
CNSTI4 6984
ADDP4
ARGP4
ADDRLP4 268
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
EQI4 $404
line 1094
;1094:	{
line 1095
;1095:		BotAI_BotInitialChat(bs, "leftteam", bs->subteam, NULL);
ADDRLP4 272
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 272
INDIRP4
ARGP4
ADDRGP4 $406
ARGP4
ADDRLP4 272
INDIRP4
CNSTI4 6984
ADDP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1096
;1096:		trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1097
;1097:		client = ClientFromName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 276
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 276
INDIRI4
ASGNI4
line 1098
;1098:		trap_BotEnterChat(bs->cs, client, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 256
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1099
;1099:	} //end if
LABELV $404
line 1100
;1100:	strcpy(bs->subteam, "");
ADDRFP4 0
INDIRP4
CNSTI4 6984
ADDP4
ARGP4
ADDRGP4 $407
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1101
;1101:}
LABELV $399
endproc BotMatch_LeaveSubteam 280 16
export BotMatch_WhichTeam
proc BotMatch_WhichTeam 16 16
line 1108
;1102:
;1103:/*
;1104:==================
;1105:BotMatch_LeaveSubteam
;1106:==================
;1107:*/
;1108:void BotMatch_WhichTeam(bot_state_t *bs, bot_match_t *match) {
line 1109
;1109:	if (!TeamPlayIsOn()) return;
ADDRLP4 0
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $409
ADDRGP4 $408
JUMPV
LABELV $409
line 1111
;1110:	//if not addressed to this bot
;1111:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $411
ADDRGP4 $408
JUMPV
LABELV $411
line 1113
;1112:	//
;1113:	if (strlen(bs->subteam)) {
ADDRFP4 0
INDIRP4
CNSTI4 6984
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $413
line 1114
;1114:		BotAI_BotInitialChat(bs, "inteam", bs->subteam, NULL);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $415
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 6984
ADDP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1115
;1115:	}
ADDRGP4 $414
JUMPV
LABELV $413
line 1116
;1116:	else {
line 1117
;1117:		BotAI_BotInitialChat(bs, "noteam", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $416
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1118
;1118:	}
LABELV $414
line 1119
;1119:	trap_BotEnterChat(bs->cs, bs->client, CHAT_TEAM);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1120
;1120:}
LABELV $408
endproc BotMatch_WhichTeam 16 16
export BotMatch_CheckPoint
proc BotMatch_CheckPoint 564 24
line 1127
;1121:
;1122:/*
;1123:==================
;1124:BotMatch_CheckPoint
;1125:==================
;1126:*/
;1127:void BotMatch_CheckPoint(bot_state_t *bs, bot_match_t *match) {
line 1134
;1128:	int areanum, client;
;1129:	char buf[MAX_MESSAGE_SIZE];
;1130:	char netname[MAX_MESSAGE_SIZE];
;1131:	vec3_t position;
;1132:	bot_waypoint_t *cp;
;1133:
;1134:	if (!TeamPlayIsOn()) return;
ADDRLP4 536
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 536
INDIRI4
CNSTI4 0
NEI4 $418
ADDRGP4 $417
JUMPV
LABELV $418
line 1136
;1135:	//
;1136:	trap_BotMatchVariable(match, POSITION, buf, MAX_MESSAGE_SIZE);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1137
;1137:	VectorClear(position);
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 4+4
CNSTF4 0
ASGNF4
ADDRLP4 4+8
CNSTF4 0
ASGNF4
line 1139
;1138:	//
;1139:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 276
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1140
;1140:	client = ClientFromName(netname);
ADDRLP4 276
ARGP4
ADDRLP4 540
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 532
ADDRLP4 540
INDIRI4
ASGNI4
line 1142
;1141:	//BotGPSToPosition(buf, position);
;1142:	Q_sscanf(buf, "%f %f %f", &position[0], &position[1], &position[2]);
ADDRLP4 16
ARGP4
ADDRGP4 $422
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 4+4
ARGP4
ADDRLP4 4+8
ARGP4
ADDRGP4 Q_sscanf
CALLI4
pop
line 1143
;1143:	position[2] += 0.5;
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
CNSTF4 1056964608
ADDF4
ASGNF4
line 1144
;1144:	areanum = BotPointAreaNum(position);
ADDRLP4 4
ARGP4
ADDRLP4 544
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 272
ADDRLP4 544
INDIRI4
ASGNI4
line 1145
;1145:	if (!areanum) {
ADDRLP4 272
INDIRI4
CNSTI4 0
NEI4 $426
line 1146
;1146:		if (BotAddressedToBot(bs, match)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 548
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 548
INDIRI4
CNSTI4 0
EQI4 $417
line 1147
;1147:			BotAI_BotInitialChat(bs, "checkpoint_invalid", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $430
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1148
;1148:			trap_BotEnterChat(bs->cs, client, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 532
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1149
;1149:		}
line 1150
;1150:		return;
ADDRGP4 $417
JUMPV
LABELV $426
line 1153
;1151:	}
;1152:	//
;1153:	trap_BotMatchVariable(match, NAME, buf, MAX_MESSAGE_SIZE);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1155
;1154:	//check if there already exists a checkpoint with this name
;1155:	cp = BotFindWayPoint(bs->checkpoints, buf);
ADDRFP4 0
INDIRP4
CNSTI4 9076
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 548
ADDRGP4 BotFindWayPoint
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 548
INDIRP4
ASGNP4
line 1156
;1156:	if (cp) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $431
line 1157
;1157:		if (cp->next) cp->next->prev = cp->prev;
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $433
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
CNSTI4 96
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRP4
ASGNP4
LABELV $433
line 1158
;1158:		if (cp->prev) cp->prev->next = cp->next;
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $435
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $436
JUMPV
LABELV $435
line 1159
;1159:		else bs->checkpoints = cp->next;
ADDRFP4 0
INDIRP4
CNSTI4 9076
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
ASGNP4
LABELV $436
line 1160
;1160:		cp->inuse = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 1161
;1161:	}
LABELV $431
line 1163
;1162:	//create a new check point
;1163:	cp = BotCreateWayPoint(buf, position, areanum);
ADDRLP4 16
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 272
INDIRI4
ARGI4
ADDRLP4 552
ADDRGP4 BotCreateWayPoint
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 552
INDIRP4
ASGNP4
line 1165
;1164:	//add the check point to the bot's known chech points
;1165:	cp->next = bs->checkpoints;
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 9076
ADDP4
INDIRP4
ASGNP4
line 1166
;1166:	if (bs->checkpoints) bs->checkpoints->prev = cp;
ADDRFP4 0
INDIRP4
CNSTI4 9076
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $437
ADDRFP4 0
INDIRP4
CNSTI4 9076
ADDP4
INDIRP4
CNSTI4 96
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $437
line 1167
;1167:	bs->checkpoints = cp;
ADDRFP4 0
INDIRP4
CNSTI4 9076
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1169
;1168:	//
;1169:	if (BotAddressedToBot(bs, match)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 556
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 556
INDIRI4
CNSTI4 0
EQI4 $439
line 1170
;1170:		Com_sprintf(buf, sizeof(buf), "%1.0f %1.0f %1.0f", cp->goal.origin[0],
ADDRLP4 16
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $441
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
ARGF4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1174
;1171:													cp->goal.origin[1],
;1172:													cp->goal.origin[2]);
;1173:
;1174:		BotAI_BotInitialChat(bs, "checkpoint_confirm", cp->name, buf, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $442
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 16
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1175
;1175:		trap_BotEnterChat(bs->cs, client, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 532
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1176
;1176:	}
LABELV $439
line 1177
;1177:}
LABELV $417
endproc BotMatch_CheckPoint 564 24
export BotMatch_FormationSpace
proc BotMatch_FormationSpace 280 16
line 1184
;1178:
;1179:/*
;1180:==================
;1181:BotMatch_FormationSpace
;1182:==================
;1183:*/
;1184:void BotMatch_FormationSpace(bot_state_t *bs, bot_match_t *match) {
line 1188
;1185:	char buf[MAX_MESSAGE_SIZE];
;1186:	float space;
;1187:
;1188:	if (!TeamPlayIsOn()) return;
ADDRLP4 260
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $444
ADDRGP4 $443
JUMPV
LABELV $444
line 1190
;1189:	//if not addressed to this bot
;1190:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
NEI4 $446
ADDRGP4 $443
JUMPV
LABELV $446
line 1192
;1191:	//
;1192:	trap_BotMatchVariable(match, NUMBER, buf, MAX_MESSAGE_SIZE);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1194
;1193:	//if it's the distance in feet
;1194:	if (match->subtype & ST_FEET) space = 0.3048 * 32 * atof(buf);
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $448
ADDRLP4 4
ARGP4
ADDRLP4 268
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 268
INDIRF4
CNSTF4 1092357823
MULF4
ASGNF4
ADDRGP4 $449
JUMPV
LABELV $448
line 1196
;1195:	//else it's in meters
;1196:	else space = 32 * atof(buf);
ADDRLP4 4
ARGP4
ADDRLP4 272
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 272
INDIRF4
CNSTF4 1107296256
MULF4
ASGNF4
LABELV $449
line 1198
;1197:	//check if the formation intervening space is valid
;1198:	if (space < 48 || space > 500) space = 100;
ADDRLP4 0
INDIRF4
CNSTF4 1111490560
LTF4 $452
ADDRLP4 0
INDIRF4
CNSTF4 1140457472
LEF4 $450
LABELV $452
ADDRLP4 0
CNSTF4 1120403456
ASGNF4
LABELV $450
line 1199
;1199:	bs->formation_dist = space;
ADDRFP4 0
INDIRP4
CNSTI4 7016
ADDP4
ADDRLP4 0
INDIRF4
ASGNF4
line 1200
;1200:}
LABELV $443
endproc BotMatch_FormationSpace 280 16
export BotMatch_Dismiss
proc BotMatch_Dismiss 272 16
line 1207
;1201:
;1202:/*
;1203:==================
;1204:BotMatch_Dismiss
;1205:==================
;1206:*/
;1207:void BotMatch_Dismiss(bot_state_t *bs, bot_match_t *match) {
line 1211
;1208:	char netname[MAX_MESSAGE_SIZE];
;1209:	int client;
;1210:
;1211:	if (!TeamPlayIsOn()) return;
ADDRLP4 260
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $454
ADDRGP4 $453
JUMPV
LABELV $454
line 1213
;1212:	//if not addressed to this bot
;1213:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
NEI4 $456
ADDRGP4 $453
JUMPV
LABELV $456
line 1214
;1214:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1215
;1215:	client = ClientFromName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 268
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 268
INDIRI4
ASGNI4
line 1217
;1216:	//
;1217:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 256
INDIRI4
ASGNI4
line 1219
;1218:	//
;1219:	bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 1220
;1220:	bs->lead_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6884
ADDP4
CNSTF4 0
ASGNF4
line 1221
;1221:	bs->lastgoal_ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
CNSTI4 0
ASGNI4
line 1223
;1222:	//
;1223:	BotAI_BotInitialChat(bs, "dismissed", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $458
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1224
;1224:	trap_BotEnterChat(bs->cs, client, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 256
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1225
;1225:}
LABELV $453
endproc BotMatch_Dismiss 272 16
export BotMatch_Suicide
proc BotMatch_Suicide 264 16
line 1232
;1226:
;1227:/*
;1228:==================
;1229:BotMatch_Suicide
;1230:==================
;1231:*/
;1232:void BotMatch_Suicide(bot_state_t *bs, bot_match_t *match) {
line 1235
;1233:	char netname[MAX_MESSAGE_SIZE];
;1234:
;1235:	if (!TeamPlayIsOn()) return;
ADDRLP4 256
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 256
INDIRI4
CNSTI4 0
NEI4 $460
ADDRGP4 $459
JUMPV
LABELV $460
line 1237
;1236:	//if not addressed to this bot
;1237:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 260
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $462
ADDRGP4 $459
JUMPV
LABELV $462
line 1239
;1238:	//
;1239:	trap_EA_Command(bs->client, "kill");
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 $464
ARGP4
ADDRGP4 trap_EA_Command
CALLV
pop
line 1241
;1240:	//
;1241:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1243
;1242:	//
;1243:	trap_EA_Action(bs->client, ACTION_AFFIRMATIVE);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1048576
ARGI4
ADDRGP4 trap_EA_Action
CALLV
pop
line 1244
;1244:}
LABELV $459
endproc BotMatch_Suicide 264 16
export BotMatch_StartTeamLeaderShip
proc BotMatch_StartTeamLeaderShip 268 16
line 1251
;1245:
;1246:/*
;1247:==================
;1248:BotMatch_StartTeamLeaderShip
;1249:==================
;1250:*/
;1251:void BotMatch_StartTeamLeaderShip(bot_state_t *bs, bot_match_t *match) {
line 1255
;1252:	int client;
;1253:	char teammate[MAX_MESSAGE_SIZE];
;1254:
;1255:	if (!TeamPlayIsOn()) return;
ADDRLP4 260
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $466
ADDRGP4 $465
JUMPV
LABELV $466
line 1257
;1256:	//if chats for him or herself
;1257:	if (match->subtype & ST_I) {
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $468
line 1259
;1258:		//get the team mate that will be the team leader
;1259:		trap_BotMatchVariable(match, NETNAME, teammate, sizeof(teammate));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1260
;1260:		Q_strncpyz( bs->teamleader, teammate, sizeof( bs->teamleader ) );
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1261
;1261:	}
ADDRGP4 $469
JUMPV
LABELV $468
line 1263
;1262:	//chats for someone else
;1263:	else {
line 1265
;1264:		//get the team mate that will be the team leader
;1265:		trap_BotMatchVariable(match, TEAMMATE, teammate, sizeof(teammate));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1266
;1266:		client = FindClientByName(teammate);
ADDRLP4 0
ARGP4
ADDRLP4 264
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 264
INDIRI4
ASGNI4
line 1267
;1267:		if (client >= 0) ClientName(client, bs->teamleader, sizeof(bs->teamleader));
ADDRLP4 256
INDIRI4
CNSTI4 0
LTI4 $470
ADDRLP4 256
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
LABELV $470
line 1268
;1268:	}
LABELV $469
line 1269
;1269:}
LABELV $465
endproc BotMatch_StartTeamLeaderShip 268 16
export BotMatch_StopTeamLeaderShip
proc BotMatch_StopTeamLeaderShip 528 16
line 1276
;1270:
;1271:/*
;1272:==================
;1273:BotMatch_StopTeamLeaderShip
;1274:==================
;1275:*/
;1276:void BotMatch_StopTeamLeaderShip(bot_state_t *bs, bot_match_t *match) {
line 1281
;1277:	int client;
;1278:	char teammate[MAX_MESSAGE_SIZE];
;1279:	char netname[MAX_MESSAGE_SIZE];
;1280:
;1281:	if (!TeamPlayIsOn()) return;
ADDRLP4 516
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 516
INDIRI4
CNSTI4 0
NEI4 $473
ADDRGP4 $472
JUMPV
LABELV $473
line 1283
;1282:	//get the team mate that stops being the team leader
;1283:	trap_BotMatchVariable(match, TEAMMATE, teammate, sizeof(teammate));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1285
;1284:	//if chats for him or herself
;1285:	if (match->subtype & ST_I) {
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $475
line 1286
;1286:		trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1287
;1287:		client = FindClientByName(netname);
ADDRLP4 260
ARGP4
ADDRLP4 520
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 520
INDIRI4
ASGNI4
line 1288
;1288:	}
ADDRGP4 $476
JUMPV
LABELV $475
line 1290
;1289:	//chats for someone else
;1290:	else {
line 1291
;1291:		client = FindClientByName(teammate);
ADDRLP4 4
ARGP4
ADDRLP4 520
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 520
INDIRI4
ASGNI4
line 1292
;1292:	} //end else
LABELV $476
line 1293
;1293:	if (client >= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $477
line 1294
;1294:		if (!Q_stricmp(bs->teamleader, ClientName(client, netname, sizeof(netname)))) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 520
ADDRGP4 ClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 520
INDIRP4
ARGP4
ADDRLP4 524
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 524
INDIRI4
CNSTI4 0
NEI4 $479
line 1295
;1295:			bs->teamleader[0] = '\0';
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
CNSTI1 0
ASGNI1
line 1296
;1296:			notleader[client] = qtrue;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 notleader
ADDP4
CNSTI4 1
ASGNI4
line 1297
;1297:		}
LABELV $479
line 1298
;1298:	}
LABELV $477
line 1299
;1299:}
LABELV $472
endproc BotMatch_StopTeamLeaderShip 528 16
export BotMatch_WhoIsTeamLeader
proc BotMatch_WhoIsTeamLeader 264 12
line 1306
;1300:
;1301:/*
;1302:==================
;1303:BotMatch_WhoIsTeamLeader
;1304:==================
;1305:*/
;1306:void BotMatch_WhoIsTeamLeader(bot_state_t *bs, bot_match_t *match) {
line 1309
;1307:	char netname[MAX_MESSAGE_SIZE];
;1308:
;1309:	if (!TeamPlayIsOn()) return;
ADDRLP4 256
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 256
INDIRI4
CNSTI4 0
NEI4 $482
ADDRGP4 $481
JUMPV
LABELV $482
line 1311
;1310:
;1311:	ClientName(bs->client, netname, sizeof(netname));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1313
;1312:	//if this bot IS the team leader
;1313:	if (!Q_stricmp(netname, bs->teamleader)) {
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 260
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $484
line 1314
;1314:		trap_EA_SayTeam(bs->client, "I'm the team leader\n");
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 $486
ARGP4
ADDRGP4 trap_EA_SayTeam
CALLV
pop
line 1315
;1315:	}
LABELV $484
line 1316
;1316:}
LABELV $481
endproc BotMatch_WhoIsTeamLeader 264 12
export BotMatch_WhatAreYouDoing
proc BotMatch_WhatAreYouDoing 532 16
line 1323
;1317:
;1318:/*
;1319:==================
;1320:BotMatch_WhatAreYouDoing
;1321:==================
;1322:*/
;1323:void BotMatch_WhatAreYouDoing(bot_state_t *bs, bot_match_t *match) {
line 1329
;1324:	char netname[MAX_MESSAGE_SIZE];
;1325:	char goalname[MAX_MESSAGE_SIZE];
;1326:	int client;
;1327:
;1328:	//if not addressed to this bot
;1329:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 516
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 516
INDIRI4
CNSTI4 0
NEI4 $488
ADDRGP4 $487
JUMPV
LABELV $488
line 1331
;1330:	//
;1331:	switch(bs->ltgtype) {
ADDRLP4 520
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
ASGNI4
ADDRLP4 520
INDIRI4
CNSTI4 1
LTI4 $490
ADDRLP4 520
INDIRI4
CNSTI4 13
GTI4 $490
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $518-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $518
address $493
address $495
address $497
address $507
address $509
address $511
address $503
address $503
address $505
address $499
address $501
address $515
address $513
code
LABELV $493
line 1333
;1332:		case LTG_TEAMHELP:
;1333:		{
line 1334
;1334:			EasyClientName(bs->teammate, netname, sizeof(netname));
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 1335
;1335:			BotAI_BotInitialChat(bs, "helping", netname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $494
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1336
;1336:			break;
ADDRGP4 $491
JUMPV
LABELV $495
line 1339
;1337:		}
;1338:		case LTG_TEAMACCOMPANY:
;1339:		{
line 1340
;1340:			EasyClientName(bs->teammate, netname, sizeof(netname));
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 1341
;1341:			BotAI_BotInitialChat(bs, "accompanying", netname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $496
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1342
;1342:			break;
ADDRGP4 $491
JUMPV
LABELV $497
line 1345
;1343:		}
;1344:		case LTG_DEFENDKEYAREA:
;1345:		{
line 1346
;1346:			trap_BotGoalName(bs->teamgoal.number, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 6668
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 1347
;1347:			BotAI_BotInitialChat(bs, "defending", goalname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $498
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1348
;1348:			break;
ADDRGP4 $491
JUMPV
LABELV $499
line 1351
;1349:		}
;1350:		case LTG_GETITEM:
;1351:		{
line 1352
;1352:			trap_BotGoalName(bs->teamgoal.number, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 6668
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 1353
;1353:			BotAI_BotInitialChat(bs, "gettingitem", goalname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $500
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1354
;1354:			break;
ADDRGP4 $491
JUMPV
LABELV $501
line 1357
;1355:		}
;1356:		case LTG_KILL:
;1357:		{
line 1358
;1358:			ClientName(bs->teamgoal.entitynum, netname, sizeof(netname));
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1359
;1359:			BotAI_BotInitialChat(bs, "killing", netname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $502
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1360
;1360:			break;
ADDRGP4 $491
JUMPV
LABELV $503
line 1364
;1361:		}
;1362:		case LTG_CAMP:
;1363:		case LTG_CAMPORDER:
;1364:		{
line 1365
;1365:			BotAI_BotInitialChat(bs, "camping", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $504
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1366
;1366:			break;
ADDRGP4 $491
JUMPV
LABELV $505
line 1369
;1367:		}
;1368:		case LTG_PATROL:
;1369:		{
line 1370
;1370:			BotAI_BotInitialChat(bs, "patrolling", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $506
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1371
;1371:			break;
ADDRGP4 $491
JUMPV
LABELV $507
line 1374
;1372:		}
;1373:		case LTG_GETFLAG:
;1374:		{
line 1375
;1375:			BotAI_BotInitialChat(bs, "capturingflag", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $508
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1376
;1376:			break;
ADDRGP4 $491
JUMPV
LABELV $509
line 1379
;1377:		}
;1378:		case LTG_RUSHBASE:
;1379:		{
line 1380
;1380:			BotAI_BotInitialChat(bs, "rushingbase", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $510
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1381
;1381:			break;
ADDRGP4 $491
JUMPV
LABELV $511
line 1384
;1382:		}
;1383:		case LTG_RETURNFLAG:
;1384:		{
line 1385
;1385:			BotAI_BotInitialChat(bs, "returningflag", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $512
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1386
;1386:			break;
ADDRGP4 $491
JUMPV
LABELV $513
line 1389
;1387:		}
;1388:		case LTG_ATTACKENEMYBASE:
;1389:		{
line 1390
;1390:			BotAI_BotInitialChat(bs, "attackingenemybase", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $514
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1391
;1391:			break;
ADDRGP4 $491
JUMPV
LABELV $515
line 1394
;1392:		}
;1393:		case LTG_HARVEST:
;1394:		{
line 1395
;1395:			BotAI_BotInitialChat(bs, "harvesting", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $516
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1396
;1396:			break;
ADDRGP4 $491
JUMPV
LABELV $490
line 1399
;1397:		}
;1398:		default:
;1399:		{
line 1400
;1400:			BotAI_BotInitialChat(bs, "roaming", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $517
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1401
;1401:			break;
LABELV $491
line 1405
;1402:		}
;1403:	}
;1404:	//chat what the bot is doing
;1405:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1406
;1406:	client = ClientFromName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 528
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 528
INDIRI4
ASGNI4
line 1407
;1407:	trap_BotEnterChat(bs->cs, client, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 256
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1408
;1408:}
LABELV $487
endproc BotMatch_WhatAreYouDoing 532 16
export BotMatch_WhatIsMyCommand
proc BotMatch_WhatIsMyCommand 40 12
line 1415
;1409:
;1410:/*
;1411:==================
;1412:BotMatch_WhatIsMyCommand
;1413:==================
;1414:*/
;1415:void BotMatch_WhatIsMyCommand(bot_state_t *bs, bot_match_t *match) {
line 1418
;1416:	char netname[MAX_NETNAME];
;1417:
;1418:	ClientName(bs->client, netname, sizeof(netname));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1419
;1419:	if (Q_stricmp(netname, bs->teamleader) != 0) return;
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $521
ADDRGP4 $520
JUMPV
LABELV $521
line 1420
;1420:	bs->forceorders = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6972
ADDP4
CNSTI4 1
ASGNI4
line 1421
;1421:}
LABELV $520
endproc BotMatch_WhatIsMyCommand 40 12
export BotNearestVisibleItem
proc BotNearestVisibleItem 248 28
line 1428
;1422:
;1423:/*
;1424:==================
;1425:BotNearestVisibleItem
;1426:==================
;1427:*/
;1428:float BotNearestVisibleItem(bot_state_t *bs, char *itemname, bot_goal_t *goal) {
line 1436
;1429:	int i;
;1430:	char name[64];
;1431:	bot_goal_t tmpgoal;
;1432:	float dist, bestdist;
;1433:	vec3_t dir;
;1434:	bsp_trace_t trace;
;1435:
;1436:	bestdist = 999999;
ADDRLP4 140
CNSTF4 1232348144
ASGNF4
line 1437
;1437:	i = -1;
ADDRLP4 68
CNSTI4 -1
ASGNI4
LABELV $524
line 1438
;1438:	do {
line 1439
;1439:		i = trap_BotGetLevelItemGoal(i, itemname, &tmpgoal);
ADDRLP4 68
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 228
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 68
ADDRLP4 228
INDIRI4
ASGNI4
line 1440
;1440:		trap_BotGoalName(tmpgoal.number, name, sizeof(name));
ADDRLP4 0+44
INDIRI4
ARGI4
ADDRLP4 72
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 1441
;1441:		if (Q_stricmp(itemname, name) != 0)
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 232
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 232
INDIRI4
CNSTI4 0
EQI4 $528
line 1442
;1442:			continue;
ADDRGP4 $525
JUMPV
LABELV $528
line 1443
;1443:		VectorSubtract(tmpgoal.origin, bs->origin, dir);
ADDRLP4 236
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 0
INDIRF4
ADDRLP4 236
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 236
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56+8
ADDRLP4 0+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1444
;1444:		dist = VectorLength(dir);
ADDRLP4 56
ARGP4
ADDRLP4 240
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 136
ADDRLP4 240
INDIRF4
ASGNF4
line 1445
;1445:		if (dist < bestdist) {
ADDRLP4 136
INDIRF4
ADDRLP4 140
INDIRF4
GEF4 $534
line 1447
;1446:			//trace from start to end
;1447:			BotAI_Trace(&trace, bs->eye, NULL, NULL, tmpgoal.origin, bs->client, CONTENTS_SOLID|CONTENTS_PLAYERCLIP);
ADDRLP4 144
ARGP4
ADDRLP4 244
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 244
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 244
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 65537
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 1448
;1448:			if (trace.fraction >= 1.0) {
ADDRLP4 144+8
INDIRF4
CNSTF4 1065353216
LTF4 $536
line 1449
;1449:				bestdist = dist;
ADDRLP4 140
ADDRLP4 136
INDIRF4
ASGNF4
line 1450
;1450:				memcpy(goal, &tmpgoal, sizeof(bot_goal_t));
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1451
;1451:			}
LABELV $536
line 1452
;1452:		}
LABELV $534
line 1453
;1453:	} while(i > 0);
LABELV $525
ADDRLP4 68
INDIRI4
CNSTI4 0
GTI4 $524
line 1454
;1454:	return bestdist;
ADDRLP4 140
INDIRF4
RETF4
LABELV $523
endproc BotNearestVisibleItem 248 28
data
align 4
LABELV $540
address $541
address $542
address $543
address $544
address $545
address $546
address $547
address $548
address $549
address $550
address $551
address $552
address $553
address $554
address $555
address $556
address $557
address $558
address $559
address $560
address $561
address $562
address $563
address $564
address $565
address $566
address $567
address $568
byte 4 0
export BotMatch_WhereAreYou
code
proc BotMatch_WhereAreYou 496 20
line 1462
;1455:}
;1456:
;1457:/*
;1458:==================
;1459:BotMatch_WhereAreYou
;1460:==================
;1461:*/
;1462:void BotMatch_WhereAreYou(bot_state_t *bs, bot_match_t *match) {
line 1467
;1463:	float dist, bestdist;
;1464:	int i, bestitem, redtt, bluett, client;
;1465:	bot_goal_t goal;
;1466:	char netname[MAX_MESSAGE_SIZE];
;1467:	char *nearbyitems[] = {
ADDRLP4 8
ADDRGP4 $540
INDIRB
ASGNB 116
line 1499
;1468:		"Shotgun",
;1469:		"Grenade Launcher",
;1470:		"Rocket Launcher",
;1471:		"Plasmagun",
;1472:		"Railgun",
;1473:		"Lightning Gun",
;1474:		"BFG10K",
;1475:		"Quad Damage",
;1476:		"Regeneration",
;1477:		"Battle Suit",
;1478:		"Speed",
;1479:		"Invisibility",
;1480:		"Flight",
;1481:		"Armor",
;1482:		"Heavy Armor",
;1483:		"Red Flag",
;1484:		"Blue Flag",
;1485:		"Nailgun",
;1486:		"Prox Launcher",
;1487:		"Chaingun",
;1488:		"Scout",
;1489:		"Guard",
;1490:		"Doubler",
;1491:		"Ammo Regen",
;1492:		"Neutral Flag",
;1493:		"Red Obelisk",
;1494:		"Blue Obelisk",
;1495:		"Neutral Obelisk",
;1496:		NULL
;1497:	};
;1498:	//
;1499:	if (!TeamPlayIsOn())
ADDRLP4 456
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 456
INDIRI4
CNSTI4 0
NEI4 $569
line 1500
;1500:		return;
ADDRGP4 $539
JUMPV
LABELV $569
line 1502
;1501:	//if not addressed to this bot
;1502:	if (!BotAddressedToBot(bs, match))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 460
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 460
INDIRI4
CNSTI4 0
NEI4 $571
line 1503
;1503:		return;
ADDRGP4 $539
JUMPV
LABELV $571
line 1505
;1504:
;1505:	bestitem = -1;
ADDRLP4 184
CNSTI4 -1
ASGNI4
line 1506
;1506:	bestdist = 999999;
ADDRLP4 124
CNSTF4 1232348144
ASGNF4
line 1507
;1507:	for (i = 0; nearbyitems[i]; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $576
JUMPV
LABELV $573
line 1508
;1508:		dist = BotNearestVisibleItem(bs, nearbyitems[i], &goal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
ARGP4
ADDRLP4 128
ARGP4
ADDRLP4 464
ADDRGP4 BotNearestVisibleItem
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 464
INDIRF4
ASGNF4
line 1509
;1509:		if (dist < bestdist) {
ADDRLP4 4
INDIRF4
ADDRLP4 124
INDIRF4
GEF4 $577
line 1510
;1510:			bestdist = dist;
ADDRLP4 124
ADDRLP4 4
INDIRF4
ASGNF4
line 1511
;1511:			bestitem = i;
ADDRLP4 184
ADDRLP4 0
INDIRI4
ASGNI4
line 1512
;1512:		}
LABELV $577
line 1513
;1513:	}
LABELV $574
line 1507
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $576
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $573
line 1514
;1514:	if (bestitem != -1) {
ADDRLP4 184
INDIRI4
CNSTI4 -1
EQI4 $579
line 1515
;1515:		if ( gametype == GT_CTF || gametype == GT_ONEFLAG ) {
ADDRLP4 464
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 464
INDIRI4
CNSTI4 4
EQI4 $583
ADDRLP4 464
INDIRI4
CNSTI4 5
NEI4 $581
LABELV $583
line 1516
;1516:			redtt = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, ctf_redflag.areanum, TFL_DEFAULT);
ADDRLP4 468
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 468
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 468
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRGP4 ctf_redflag+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 472
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 444
ADDRLP4 472
INDIRI4
ASGNI4
line 1517
;1517:			bluett = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, ctf_blueflag.areanum, TFL_DEFAULT);
ADDRLP4 476
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 476
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 476
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRGP4 ctf_blueflag+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 480
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 448
ADDRLP4 480
INDIRI4
ASGNI4
line 1518
;1518:			if (redtt < (redtt + bluett) * 0.4) {
ADDRLP4 484
ADDRLP4 444
INDIRI4
ASGNI4
ADDRLP4 484
INDIRI4
CVIF4 4
ADDRLP4 484
INDIRI4
ADDRLP4 448
INDIRI4
ADDI4
CVIF4 4
CNSTF4 1053609165
MULF4
GEF4 $586
line 1519
;1519:				BotAI_BotInitialChat(bs, "teamlocation", nearbyitems[bestitem], "red", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $588
ARGP4
ADDRLP4 184
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
ARGP4
ADDRGP4 $589
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1520
;1520:			}
ADDRGP4 $582
JUMPV
LABELV $586
line 1521
;1521:			else if (bluett < (redtt + bluett) * 0.4) {
ADDRLP4 488
ADDRLP4 448
INDIRI4
ASGNI4
ADDRLP4 488
INDIRI4
CVIF4 4
ADDRLP4 444
INDIRI4
ADDRLP4 488
INDIRI4
ADDI4
CVIF4 4
CNSTF4 1053609165
MULF4
GEF4 $590
line 1522
;1522:				BotAI_BotInitialChat(bs, "teamlocation", nearbyitems[bestitem], "blue", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $588
ARGP4
ADDRLP4 184
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
ARGP4
ADDRGP4 $592
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1523
;1523:			}
ADDRGP4 $582
JUMPV
LABELV $590
line 1524
;1524:			else {
line 1525
;1525:				BotAI_BotInitialChat(bs, "location", nearbyitems[bestitem], NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $593
ARGP4
ADDRLP4 184
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1526
;1526:			}
line 1527
;1527:		}
ADDRGP4 $582
JUMPV
LABELV $581
line 1528
;1528:		else if (gametype == GT_OVERLOAD || gametype == GT_HARVESTER) {
ADDRLP4 468
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 468
INDIRI4
CNSTI4 6
EQI4 $596
ADDRLP4 468
INDIRI4
CNSTI4 7
NEI4 $594
LABELV $596
line 1529
;1529:			redtt = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, redobelisk.areanum, TFL_DEFAULT);
ADDRLP4 472
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 472
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 472
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRGP4 redobelisk+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 476
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 444
ADDRLP4 476
INDIRI4
ASGNI4
line 1530
;1530:			bluett = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, blueobelisk.areanum, TFL_DEFAULT);
ADDRLP4 480
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 480
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 480
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRGP4 blueobelisk+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 484
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 448
ADDRLP4 484
INDIRI4
ASGNI4
line 1531
;1531:			if (redtt < (redtt + bluett) * 0.4) {
ADDRLP4 488
ADDRLP4 444
INDIRI4
ASGNI4
ADDRLP4 488
INDIRI4
CVIF4 4
ADDRLP4 488
INDIRI4
ADDRLP4 448
INDIRI4
ADDI4
CVIF4 4
CNSTF4 1053609165
MULF4
GEF4 $599
line 1532
;1532:				BotAI_BotInitialChat(bs, "teamlocation", nearbyitems[bestitem], "red", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $588
ARGP4
ADDRLP4 184
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
ARGP4
ADDRGP4 $589
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1533
;1533:			}
ADDRGP4 $595
JUMPV
LABELV $599
line 1534
;1534:			else if (bluett < (redtt + bluett) * 0.4) {
ADDRLP4 492
ADDRLP4 448
INDIRI4
ASGNI4
ADDRLP4 492
INDIRI4
CVIF4 4
ADDRLP4 444
INDIRI4
ADDRLP4 492
INDIRI4
ADDI4
CVIF4 4
CNSTF4 1053609165
MULF4
GEF4 $601
line 1535
;1535:				BotAI_BotInitialChat(bs, "teamlocation", nearbyitems[bestitem], "blue", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $588
ARGP4
ADDRLP4 184
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
ARGP4
ADDRGP4 $592
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1536
;1536:			}
ADDRGP4 $595
JUMPV
LABELV $601
line 1537
;1537:			else {
line 1538
;1538:				BotAI_BotInitialChat(bs, "location", nearbyitems[bestitem], NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $593
ARGP4
ADDRLP4 184
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1539
;1539:			}
line 1540
;1540:		}
ADDRGP4 $595
JUMPV
LABELV $594
line 1541
;1541:		else {
line 1542
;1542:			BotAI_BotInitialChat(bs, "location", nearbyitems[bestitem], NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $593
ARGP4
ADDRLP4 184
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1543
;1543:		}
LABELV $595
LABELV $582
line 1544
;1544:		trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 188
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1545
;1545:		client = ClientFromName(netname);
ADDRLP4 188
ARGP4
ADDRLP4 472
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 452
ADDRLP4 472
INDIRI4
ASGNI4
line 1546
;1546:		trap_BotEnterChat(bs->cs, client, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 452
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1547
;1547:	}
LABELV $579
line 1548
;1548:}
LABELV $539
endproc BotMatch_WhereAreYou 496 20
export BotMatch_LeadTheWay
proc BotMatch_LeadTheWay 680 16
line 1555
;1549:
;1550:/*
;1551:==================
;1552:BotMatch_LeadTheWay
;1553:==================
;1554:*/
;1555:void BotMatch_LeadTheWay(bot_state_t *bs, bot_match_t *match) {
line 1560
;1556:	aas_entityinfo_t entinfo;
;1557:	char netname[MAX_MESSAGE_SIZE], teammate[MAX_MESSAGE_SIZE];
;1558:	int client, areanum, other;
;1559:
;1560:	if (!TeamPlayIsOn()) return;
ADDRLP4 664
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 664
INDIRI4
CNSTI4 0
NEI4 $604
ADDRGP4 $603
JUMPV
LABELV $604
line 1562
;1561:	//if not addressed to this bot
;1562:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 668
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 668
INDIRI4
CNSTI4 0
NEI4 $606
ADDRGP4 $603
JUMPV
LABELV $606
line 1564
;1563:	//if someone asks for someone else
;1564:	if (match->subtype & ST_SOMEONE) {
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $608
line 1566
;1565:		//get the team mate name
;1566:		trap_BotMatchVariable(match, TEAMMATE, teammate, sizeof(teammate));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 400
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1567
;1567:		client = FindClientByName(teammate);
ADDRLP4 400
ARGP4
ADDRLP4 672
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 672
INDIRI4
ASGNI4
line 1569
;1568:		//if this is the bot self
;1569:		if (client == bs->client) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $610
line 1570
;1570:			other = qfalse;
ADDRLP4 656
CNSTI4 0
ASGNI4
line 1571
;1571:		}
ADDRGP4 $609
JUMPV
LABELV $610
line 1572
;1572:		else if (!BotSameTeam(bs, client)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 676
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 676
INDIRI4
CNSTI4 0
NEI4 $612
line 1574
;1573:			//FIXME: say "I don't help the enemy"
;1574:			return;
ADDRGP4 $603
JUMPV
LABELV $612
line 1576
;1575:		}
;1576:		else {
line 1577
;1577:			other = qtrue;
ADDRLP4 656
CNSTI4 1
ASGNI4
line 1578
;1578:		}
line 1579
;1579:	}
ADDRGP4 $609
JUMPV
LABELV $608
line 1580
;1580:	else {
line 1582
;1581:		//get the netname
;1582:		trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 144
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1583
;1583:		client = ClientFromName(netname);
ADDRLP4 144
ARGP4
ADDRLP4 672
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 672
INDIRI4
ASGNI4
line 1584
;1584:		other = qfalse;
ADDRLP4 656
CNSTI4 0
ASGNI4
line 1585
;1585:	}
LABELV $609
line 1587
;1586:	//if the bot doesn't know who to help (FindClientByName returned -1)
;1587:	if (client < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $614
line 1588
;1588:		BotAI_BotInitialChat(bs, "whois", netname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $234
ARGP4
ADDRLP4 144
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1589
;1589:		trap_BotEnterChat(bs->cs, bs->client, CHAT_TEAM);
ADDRLP4 672
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 672
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 672
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1590
;1590:		return;
ADDRGP4 $603
JUMPV
LABELV $614
line 1593
;1591:	}
;1592:	//
;1593:	bs->lead_teamgoal.entitynum = -1;
ADDRFP4 0
INDIRP4
CNSTI4 6868
ADDP4
CNSTI4 -1
ASGNI4
line 1594
;1594:	BotEntityInfo(client, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 1596
;1595:	//if info is valid (in PVS)
;1596:	if (entinfo.valid) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $616
line 1597
;1597:		areanum = BotPointAreaNum(entinfo.origin);
ADDRLP4 4+24
ARGP4
ADDRLP4 672
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 660
ADDRLP4 672
INDIRI4
ASGNI4
line 1598
;1598:		if (areanum) { // && trap_AAS_AreaReachability(areanum)) {
ADDRLP4 660
INDIRI4
CNSTI4 0
EQI4 $619
line 1599
;1599:			bs->lead_teamgoal.entitynum = client;
ADDRFP4 0
INDIRP4
CNSTI4 6868
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1600
;1600:			bs->lead_teamgoal.areanum = areanum;
ADDRFP4 0
INDIRP4
CNSTI4 6840
ADDP4
ADDRLP4 660
INDIRI4
ASGNI4
line 1601
;1601:			VectorCopy(entinfo.origin, bs->lead_teamgoal.origin);
ADDRFP4 0
INDIRP4
CNSTI4 6828
ADDP4
ADDRLP4 4+24
INDIRB
ASGNB 12
line 1602
;1602:			VectorSet(bs->lead_teamgoal.mins, -8, -8, -8);
ADDRFP4 0
INDIRP4
CNSTI4 6844
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6848
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6852
ADDP4
CNSTF4 3238002688
ASGNF4
line 1603
;1603:			VectorSet(bs->lead_teamgoal.maxs, 8, 8, 8);
ADDRFP4 0
INDIRP4
CNSTI4 6856
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6860
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6864
ADDP4
CNSTF4 1090519040
ASGNF4
line 1604
;1604:		}
LABELV $619
line 1605
;1605:	}
LABELV $616
line 1607
;1606:
;1607:	if (bs->teamgoal.entitynum < 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
INDIRI4
CNSTI4 0
GEI4 $622
line 1608
;1608:		if (other) BotAI_BotInitialChat(bs, "whereis", teammate, NULL);
ADDRLP4 656
INDIRI4
CNSTI4 0
EQI4 $624
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $253
ARGP4
ADDRLP4 400
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
ADDRGP4 $625
JUMPV
LABELV $624
line 1609
;1609:		else BotAI_BotInitialChat(bs, "whereareyou", netname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $254
ARGP4
ADDRLP4 144
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
LABELV $625
line 1610
;1610:		trap_BotEnterChat(bs->cs, bs->client, CHAT_TEAM);
ADDRLP4 672
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 672
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 672
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1611
;1611:		return;
ADDRGP4 $603
JUMPV
LABELV $622
line 1613
;1612:	}
;1613:	bs->lead_teammate = client;
ADDRFP4 0
INDIRP4
CNSTI4 6824
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1614
;1614:	bs->lead_time = FloatTime() + TEAM_LEAD_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6884
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 1615
;1615:	bs->leadvisible_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6888
ADDP4
CNSTF4 0
ASGNF4
line 1616
;1616:	bs->leadmessage_time = -(FloatTime() + 2 * random());
ADDRLP4 672
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6892
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 672
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1073741824
MULF4
ADDF4
NEGF4
ASGNF4
line 1617
;1617:}
LABELV $603
endproc BotMatch_LeadTheWay 680 16
export BotMatch_Kill
proc BotMatch_Kill 532 16
line 1624
;1618:
;1619:/*
;1620:==================
;1621:BotMatch_Kill
;1622:==================
;1623:*/
;1624:void BotMatch_Kill(bot_state_t *bs, bot_match_t *match) {
line 1629
;1625:	char enemy[MAX_MESSAGE_SIZE];
;1626:	char netname[MAX_MESSAGE_SIZE];
;1627:	int client;
;1628:
;1629:	if (!TeamPlayIsOn()) return;
ADDRLP4 516
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 516
INDIRI4
CNSTI4 0
NEI4 $627
ADDRGP4 $626
JUMPV
LABELV $627
line 1631
;1630:	//if not addressed to this bot
;1631:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 520
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 520
INDIRI4
CNSTI4 0
NEI4 $629
ADDRGP4 $626
JUMPV
LABELV $629
line 1633
;1632:
;1633:	trap_BotMatchVariable(match, ENEMY, enemy, sizeof(enemy));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1635
;1634:	//
;1635:	client = FindEnemyByName(bs, enemy);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 524
ADDRGP4 FindEnemyByName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 524
INDIRI4
ASGNI4
line 1636
;1636:	if (client < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $631
line 1637
;1637:		BotAI_BotInitialChat(bs, "whois", enemy, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $234
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1638
;1638:		trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1639
;1639:		client = ClientFromName(netname);
ADDRLP4 260
ARGP4
ADDRLP4 528
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 528
INDIRI4
ASGNI4
line 1640
;1640:		trap_BotEnterChat(bs->cs, client, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1641
;1641:		return;
ADDRGP4 $626
JUMPV
LABELV $631
line 1643
;1642:	}
;1643:	bs->teamgoal.entitynum = client;
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1645
;1644:	//set the time to send a message to the team mates
;1645:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 528
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 528
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1073741824
MULF4
ADDF4
ASGNF4
line 1647
;1646:	//set the ltg type
;1647:	bs->ltgtype = LTG_KILL;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 11
ASGNI4
line 1649
;1648:	//set the team goal time
;1649:	bs->teamgoal_time = FloatTime() + TEAM_KILL_SOMEONE;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 1651
;1650:	//
;1651:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1655
;1652:#ifdef DEBUG
;1653:	BotPrintTeamGoal(bs);
;1654:#endif //DEBUG
;1655:}
LABELV $626
endproc BotMatch_Kill 532 16
export BotMatch_CTF
proc BotMatch_CTF 176 16
line 1662
;1656:
;1657:/*
;1658:==================
;1659:BotMatch_CTF
;1660:==================
;1661:*/
;1662:void BotMatch_CTF(bot_state_t *bs, bot_match_t *match) {
line 1666
;1663:
;1664:	char flag[128], netname[MAX_NETNAME];
;1665:
;1666:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $634
line 1667
;1667:		trap_BotMatchVariable(match, FLAG, flag, sizeof(flag));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1668
;1668:		if (match->subtype & ST_GOTFLAG) {
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $636
line 1669
;1669:			if (!Q_stricmp(flag, "red")) {
ADDRLP4 0
ARGP4
ADDRGP4 $589
ARGP4
ADDRLP4 164
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
NEI4 $638
line 1670
;1670:				bs->redflagstatus = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
CNSTI4 1
ASGNI4
line 1671
;1671:				if (BotTeam(bs) == TEAM_BLUE) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 168
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 2
NEI4 $639
line 1672
;1672:					trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 128
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1673
;1673:					bs->flagcarrier = ClientFromName(netname);
ADDRLP4 128
ARGP4
ADDRLP4 172
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
ADDRLP4 172
INDIRI4
ASGNI4
line 1674
;1674:				}
line 1675
;1675:			}
ADDRGP4 $639
JUMPV
LABELV $638
line 1676
;1676:			else {
line 1677
;1677:				bs->blueflagstatus = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6960
ADDP4
CNSTI4 1
ASGNI4
line 1678
;1678:				if (BotTeam(bs) == TEAM_RED) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 168
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 1
NEI4 $642
line 1679
;1679:					trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 128
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1680
;1680:					bs->flagcarrier = ClientFromName(netname);
ADDRLP4 128
ARGP4
ADDRLP4 172
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
ADDRLP4 172
INDIRI4
ASGNI4
line 1681
;1681:				}
LABELV $642
line 1682
;1682:			}
LABELV $639
line 1683
;1683:			bs->flagstatuschanged = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6968
ADDP4
CNSTI4 1
ASGNI4
line 1684
;1684:			bs->lastflagcapture_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6948
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1685
;1685:		}
ADDRGP4 $635
JUMPV
LABELV $636
line 1686
;1686:		else if (match->subtype & ST_CAPTUREDFLAG) {
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $644
line 1687
;1687:			bs->redflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
CNSTI4 0
ASGNI4
line 1688
;1688:			bs->blueflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6960
ADDP4
CNSTI4 0
ASGNI4
line 1689
;1689:			bs->flagcarrier = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
CNSTI4 0
ASGNI4
line 1690
;1690:			bs->flagstatuschanged = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6968
ADDP4
CNSTI4 1
ASGNI4
line 1691
;1691:		}
ADDRGP4 $635
JUMPV
LABELV $644
line 1692
;1692:		else if (match->subtype & ST_RETURNEDFLAG) {
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $635
line 1693
;1693:			if (!Q_stricmp(flag, "red")) bs->redflagstatus = 0;
ADDRLP4 0
ARGP4
ADDRGP4 $589
ARGP4
ADDRLP4 164
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
NEI4 $648
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $649
JUMPV
LABELV $648
line 1694
;1694:			else bs->blueflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6960
ADDP4
CNSTI4 0
ASGNI4
LABELV $649
line 1695
;1695:			bs->flagstatuschanged = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6968
ADDP4
CNSTI4 1
ASGNI4
line 1696
;1696:		}
line 1697
;1697:	} else if ( gametype == GT_ONEFLAG ) {
ADDRGP4 $635
JUMPV
LABELV $634
ADDRGP4 gametype
INDIRI4
CNSTI4 5
NEI4 $650
line 1698
;1698:		if (match->subtype & ST_1FCTFGOTFLAG) {
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 65535
BANDI4
CNSTI4 0
EQI4 $652
line 1699
;1699:			trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 128
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1700
;1700:			bs->flagcarrier = ClientFromName(netname);
ADDRLP4 128
ARGP4
ADDRLP4 164
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
ADDRLP4 164
INDIRI4
ASGNI4
line 1701
;1701:		}
LABELV $652
line 1702
;1702:	}
LABELV $650
LABELV $635
line 1703
;1703:}
LABELV $633
endproc BotMatch_CTF 176 16
export BotMatch_EnterGame
proc BotMatch_EnterGame 44 16
line 1705
;1704:
;1705:void BotMatch_EnterGame(bot_state_t *bs, bot_match_t *match) {
line 1709
;1706:	int client;
;1707:	char netname[MAX_NETNAME];
;1708:
;1709:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1710
;1710:	client = FindClientByName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 40
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 36
ADDRLP4 40
INDIRI4
ASGNI4
line 1711
;1711:	if (client >= 0) {
ADDRLP4 36
INDIRI4
CNSTI4 0
LTI4 $655
line 1712
;1712:		notleader[client] = qfalse;
ADDRLP4 36
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 notleader
ADDP4
CNSTI4 0
ASGNI4
line 1713
;1713:	}
LABELV $655
line 1717
;1714:	//NOTE: eliza chats will catch this
;1715:	//Com_sprintf(buf, sizeof(buf), "heya %s", netname);
;1716:	//EA_Say(bs->client, buf);
;1717:}
LABELV $654
endproc BotMatch_EnterGame 44 16
export BotMatch_NewLeader
proc BotMatch_NewLeader 48 16
line 1719
;1718:
;1719:void BotMatch_NewLeader(bot_state_t *bs, bot_match_t *match) {
line 1723
;1720:	int client;
;1721:	char netname[MAX_NETNAME];
;1722:
;1723:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1724
;1724:	client = FindClientByName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 40
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 36
ADDRLP4 40
INDIRI4
ASGNI4
line 1725
;1725:	if (!BotSameTeam(bs, client))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $658
line 1726
;1726:		return;
ADDRGP4 $657
JUMPV
LABELV $658
line 1727
;1727:	Q_strncpyz(bs->teamleader, netname, sizeof(bs->teamleader));
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1728
;1728:}
LABELV $657
endproc BotMatch_NewLeader 48 16
export BotMatchMessage
proc BotMatchMessage 336 12
line 1735
;1729:
;1730:/*
;1731:==================
;1732:BotMatchMessage
;1733:==================
;1734:*/
;1735:int BotMatchMessage(bot_state_t *bs, char *message) {
line 1738
;1736:	bot_match_t match;
;1737:
;1738:	match.type = 0;
ADDRLP4 0+256
CNSTI4 0
ASGNI4
line 1740
;1739:	//if it is an unknown message
;1740:	if (!trap_BotFindMatch(message, &match, MTCONTEXT_MISC
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTU4 262
ARGU4
ADDRLP4 328
ADDRGP4 trap_BotFindMatch
CALLI4
ASGNI4
ADDRLP4 328
INDIRI4
CNSTI4 0
NEI4 $662
line 1742
;1741:											|MTCONTEXT_INITIALTEAMCHAT
;1742:											|MTCONTEXT_CTF)) {
line 1743
;1743:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $660
JUMPV
LABELV $662
line 1746
;1744:	}
;1745:	//react to the found message
;1746:	switch(match.type)
ADDRLP4 332
ADDRLP4 0+256
INDIRI4
ASGNI4
ADDRLP4 332
INDIRI4
CNSTI4 1
LTI4 $664
ADDRLP4 332
INDIRI4
CNSTI4 33
GTI4 $702
ADDRLP4 332
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $703-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $703
address $698
address $697
address $667
address $667
address $668
address $674
address $671
address $689
address $690
address $691
address $665
address $692
address $679
address $680
address $683
address $685
address $686
address $665
address $688
address $669
address $682
address $670
address $695
address $678
address $696
address $694
address $675
address $693
address $681
address $676
address $672
address $673
address $700
code
LABELV $702
ADDRLP4 0+256
INDIRI4
CNSTI4 300
EQI4 $677
ADDRGP4 $664
JUMPV
line 1747
;1747:	{
LABELV $667
line 1750
;1748:		case MSG_HELP:					//someone calling for help
;1749:		case MSG_ACCOMPANY:				//someone calling for company
;1750:		{
line 1751
;1751:			BotMatch_HelpAccompany(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_HelpAccompany
CALLV
pop
line 1752
;1752:			break;
ADDRGP4 $665
JUMPV
LABELV $668
line 1755
;1753:		}
;1754:		case MSG_DEFENDKEYAREA:			//teamplay defend a key area
;1755:		{
line 1756
;1756:			BotMatch_DefendKeyArea(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_DefendKeyArea
CALLV
pop
line 1757
;1757:			break;
ADDRGP4 $665
JUMPV
LABELV $669
line 1760
;1758:		}
;1759:		case MSG_CAMP:					//camp somewhere
;1760:		{
line 1761
;1761:			BotMatch_Camp(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_Camp
CALLV
pop
line 1762
;1762:			break;
ADDRGP4 $665
JUMPV
LABELV $670
line 1765
;1763:		}
;1764:		case MSG_PATROL:				//patrol between several key areas
;1765:		{
line 1766
;1766:			BotMatch_Patrol(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_Patrol
CALLV
pop
line 1767
;1767:			break;
ADDRGP4 $665
JUMPV
LABELV $671
line 1771
;1768:		}
;1769:		//CTF & 1FCTF
;1770:		case MSG_GETFLAG:				//ctf get the enemy flag
;1771:		{
line 1772
;1772:			BotMatch_GetFlag(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_GetFlag
CALLV
pop
line 1773
;1773:			break;
ADDRGP4 $665
JUMPV
LABELV $672
line 1777
;1774:		}
;1775:		//CTF & 1FCTF & Obelisk & Harvester
;1776:		case MSG_ATTACKENEMYBASE:
;1777:		{
line 1778
;1778:			BotMatch_AttackEnemyBase(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_AttackEnemyBase
CALLV
pop
line 1779
;1779:			break;
ADDRGP4 $665
JUMPV
LABELV $673
line 1783
;1780:		}
;1781:		//Harvester
;1782:		case MSG_HARVEST:
;1783:		{
line 1784
;1784:			BotMatch_Harvest(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_Harvest
CALLV
pop
line 1785
;1785:			break;
ADDRGP4 $665
JUMPV
LABELV $674
line 1789
;1786:		}
;1787:		//CTF & 1FCTF & Harvester
;1788:		case MSG_RUSHBASE:				//ctf rush to the base
;1789:		{
line 1790
;1790:			BotMatch_RushBase(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_RushBase
CALLV
pop
line 1791
;1791:			break;
ADDRGP4 $665
JUMPV
LABELV $675
line 1795
;1792:		}
;1793:		//CTF & 1FCTF
;1794:		case MSG_RETURNFLAG:
;1795:		{
line 1796
;1796:			BotMatch_ReturnFlag(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_ReturnFlag
CALLV
pop
line 1797
;1797:			break;
ADDRGP4 $665
JUMPV
LABELV $676
line 1801
;1798:		}
;1799:		//CTF & 1FCTF & Obelisk & Harvester
;1800:		case MSG_TASKPREFERENCE:
;1801:		{
line 1802
;1802:			BotMatch_TaskPreference(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_TaskPreference
CALLV
pop
line 1803
;1803:			break;
ADDRGP4 $665
JUMPV
LABELV $677
line 1807
;1804:		}
;1805:		//CTF & 1FCTF
;1806:		case MSG_CTF:
;1807:		{
line 1808
;1808:			BotMatch_CTF(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_CTF
CALLV
pop
line 1809
;1809:			break;
ADDRGP4 $665
JUMPV
LABELV $678
line 1812
;1810:		}
;1811:		case MSG_GETITEM:
;1812:		{
line 1813
;1813:			BotMatch_GetItem(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_GetItem
CALLV
pop
line 1814
;1814:			break;
ADDRGP4 $665
JUMPV
LABELV $679
line 1817
;1815:		}
;1816:		case MSG_JOINSUBTEAM:			//join a sub team
;1817:		{
line 1818
;1818:			BotMatch_JoinSubteam(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_JoinSubteam
CALLV
pop
line 1819
;1819:			break;
ADDRGP4 $665
JUMPV
LABELV $680
line 1822
;1820:		}
;1821:		case MSG_LEAVESUBTEAM:			//leave a sub team
;1822:		{
line 1823
;1823:			BotMatch_LeaveSubteam(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_LeaveSubteam
CALLV
pop
line 1824
;1824:			break;
ADDRGP4 $665
JUMPV
LABELV $681
line 1827
;1825:		}
;1826:		case MSG_WHICHTEAM:
;1827:		{
line 1828
;1828:			BotMatch_WhichTeam(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_WhichTeam
CALLV
pop
line 1829
;1829:			break;
ADDRGP4 $665
JUMPV
LABELV $682
line 1832
;1830:		}
;1831:		case MSG_CHECKPOINT:			//remember a check point
;1832:		{
line 1833
;1833:			BotMatch_CheckPoint(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_CheckPoint
CALLV
pop
line 1834
;1834:			break;
ADDRGP4 $665
JUMPV
LABELV $683
line 1837
;1835:		}
;1836:		case MSG_CREATENEWFORMATION:	//start the creation of a new formation
;1837:		{
line 1838
;1838:			trap_EA_SayTeam(bs->client, "the part of my brain to create formations has been damaged");
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 $684
ARGP4
ADDRGP4 trap_EA_SayTeam
CALLV
pop
line 1839
;1839:			break;
ADDRGP4 $665
JUMPV
LABELV $685
line 1842
;1840:		}
;1841:		case MSG_FORMATIONPOSITION:		//tell someone his/her position in the formation
;1842:		{
line 1843
;1843:			trap_EA_SayTeam(bs->client, "the part of my brain to create formations has been damaged");
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 $684
ARGP4
ADDRGP4 trap_EA_SayTeam
CALLV
pop
line 1844
;1844:			break;
ADDRGP4 $665
JUMPV
LABELV $686
line 1847
;1845:		}
;1846:		case MSG_FORMATIONSPACE:		//set the formation space
;1847:		{
line 1848
;1848:			BotMatch_FormationSpace(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_FormationSpace
CALLV
pop
line 1849
;1849:			break;
ADDRGP4 $665
JUMPV
line 1852
;1850:		}
;1851:		case MSG_DOFORMATION:			//form a certain formation
;1852:		{
line 1853
;1853:			break;
LABELV $688
line 1856
;1854:		}
;1855:		case MSG_DISMISS:				//dismiss someone
;1856:		{
line 1857
;1857:			BotMatch_Dismiss(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_Dismiss
CALLV
pop
line 1858
;1858:			break;
ADDRGP4 $665
JUMPV
LABELV $689
line 1861
;1859:		}
;1860:		case MSG_STARTTEAMLEADERSHIP:	//someone will become the team leader
;1861:		{
line 1862
;1862:			BotMatch_StartTeamLeaderShip(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_StartTeamLeaderShip
CALLV
pop
line 1863
;1863:			break;
ADDRGP4 $665
JUMPV
LABELV $690
line 1866
;1864:		}
;1865:		case MSG_STOPTEAMLEADERSHIP:	//someone will stop being the team leader
;1866:		{
line 1867
;1867:			BotMatch_StopTeamLeaderShip(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_StopTeamLeaderShip
CALLV
pop
line 1868
;1868:			break;
ADDRGP4 $665
JUMPV
LABELV $691
line 1871
;1869:		}
;1870:		case MSG_WHOISTEAMLAEDER:
;1871:		{
line 1872
;1872:			BotMatch_WhoIsTeamLeader(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_WhoIsTeamLeader
CALLV
pop
line 1873
;1873:			break;
ADDRGP4 $665
JUMPV
LABELV $692
line 1876
;1874:		}
;1875:		case MSG_WHATAREYOUDOING:		//ask a bot what he/she is doing
;1876:		{
line 1877
;1877:			BotMatch_WhatAreYouDoing(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_WhatAreYouDoing
CALLV
pop
line 1878
;1878:			break;
ADDRGP4 $665
JUMPV
LABELV $693
line 1881
;1879:		}
;1880:		case MSG_WHATISMYCOMMAND:
;1881:		{
line 1882
;1882:			BotMatch_WhatIsMyCommand(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_WhatIsMyCommand
CALLV
pop
line 1883
;1883:			break;
ADDRGP4 $665
JUMPV
LABELV $694
line 1886
;1884:		}
;1885:		case MSG_WHEREAREYOU:
;1886:		{
line 1887
;1887:			BotMatch_WhereAreYou(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_WhereAreYou
CALLV
pop
line 1888
;1888:			break;
ADDRGP4 $665
JUMPV
LABELV $695
line 1891
;1889:		}
;1890:		case MSG_LEADTHEWAY:
;1891:		{
line 1892
;1892:			BotMatch_LeadTheWay(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_LeadTheWay
CALLV
pop
line 1893
;1893:			break;
ADDRGP4 $665
JUMPV
LABELV $696
line 1896
;1894:		}
;1895:		case MSG_KILL:
;1896:		{
line 1897
;1897:			BotMatch_Kill(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_Kill
CALLV
pop
line 1898
;1898:			break;
ADDRGP4 $665
JUMPV
LABELV $697
line 1901
;1899:		}
;1900:		case MSG_ENTERGAME:				//someone entered the game
;1901:		{
line 1902
;1902:			BotMatch_EnterGame(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_EnterGame
CALLV
pop
line 1903
;1903:			break;
ADDRGP4 $665
JUMPV
LABELV $698
line 1906
;1904:		}
;1905:		case MSG_NEWLEADER:
;1906:		{
line 1907
;1907:			BotMatch_NewLeader(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_NewLeader
CALLV
pop
line 1908
;1908:			break;
ADDRGP4 $665
JUMPV
line 1911
;1909:		}
;1910:		case MSG_WAIT:
;1911:		{
line 1912
;1912:			break;
LABELV $700
line 1915
;1913:		}
;1914:		case MSG_SUICIDE:
;1915:		{
line 1916
;1916:			BotMatch_Suicide(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_Suicide
CALLV
pop
line 1917
;1917:			break;
ADDRGP4 $665
JUMPV
LABELV $664
line 1920
;1918:		}
;1919:		default:
;1920:		{
line 1921
;1921:			BotAI_Print(PRT_MESSAGE, "unknown match type\n");
CNSTI4 1
ARGI4
ADDRGP4 $701
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 1922
;1922:			break;
LABELV $665
line 1925
;1923:		}
;1924:	}
;1925:	return qtrue;
CNSTI4 1
RETI4
LABELV $660
endproc BotMatchMessage 336 12
import BotSetTeamMateTaskPreference
import BotGetTeamMateTaskPreference
import BotTeamAI
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
bss
export notleader
align 4
LABELV notleader
skip 256
import BotChatTest
import BotValidChatPosition
import BotChatTime
import BotChat_Random
import BotChat_EnemySuicide
import BotChat_Kill
import BotChat_Death
import BotChat_HitNoKill
import BotChat_HitNoDeath
import BotChat_HitTalking
import BotChat_EndLevel
import BotChat_StartLevel
import BotChat_ExitGame
import BotChat_EnterGame
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
LABELV $701
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $684
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 109
byte 1 121
byte 1 32
byte 1 98
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $593
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $592
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $589
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $588
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $568
byte 1 78
byte 1 101
byte 1 117
byte 1 116
byte 1 114
byte 1 97
byte 1 108
byte 1 32
byte 1 79
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $567
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 79
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $566
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 79
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $565
byte 1 78
byte 1 101
byte 1 117
byte 1 116
byte 1 114
byte 1 97
byte 1 108
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $564
byte 1 65
byte 1 109
byte 1 109
byte 1 111
byte 1 32
byte 1 82
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $563
byte 1 68
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $562
byte 1 71
byte 1 117
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $561
byte 1 83
byte 1 99
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $560
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
LABELV $559
byte 1 80
byte 1 114
byte 1 111
byte 1 120
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
LABELV $558
byte 1 78
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $557
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $556
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $555
byte 1 72
byte 1 101
byte 1 97
byte 1 118
byte 1 121
byte 1 32
byte 1 65
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $554
byte 1 65
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $553
byte 1 70
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $552
byte 1 73
byte 1 110
byte 1 118
byte 1 105
byte 1 115
byte 1 105
byte 1 98
byte 1 105
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $551
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $550
byte 1 66
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 83
byte 1 117
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $549
byte 1 82
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $548
byte 1 81
byte 1 117
byte 1 97
byte 1 100
byte 1 32
byte 1 68
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $547
byte 1 66
byte 1 70
byte 1 71
byte 1 49
byte 1 48
byte 1 75
byte 1 0
align 1
LABELV $546
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
LABELV $545
byte 1 82
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $544
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
LABELV $543
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
LABELV $542
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
LABELV $541
byte 1 83
byte 1 104
byte 1 111
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $517
byte 1 114
byte 1 111
byte 1 97
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $516
byte 1 104
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $514
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 105
byte 1 110
byte 1 103
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $512
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $510
byte 1 114
byte 1 117
byte 1 115
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $508
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $506
byte 1 112
byte 1 97
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $504
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $502
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $500
byte 1 103
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 0
align 1
LABELV $498
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $496
byte 1 97
byte 1 99
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 97
byte 1 110
byte 1 121
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $494
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $486
byte 1 73
byte 1 39
byte 1 109
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 10
byte 1 0
align 1
LABELV $464
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $458
byte 1 100
byte 1 105
byte 1 115
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $442
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 95
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 114
byte 1 109
byte 1 0
align 1
LABELV $441
byte 1 37
byte 1 49
byte 1 46
byte 1 48
byte 1 102
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 48
byte 1 102
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 48
byte 1 102
byte 1 0
align 1
LABELV $430
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 95
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $422
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 0
align 1
LABELV $416
byte 1 110
byte 1 111
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $415
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $407
byte 1 0
align 1
LABELV $406
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $398
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $387
byte 1 107
byte 1 101
byte 1 101
byte 1 112
byte 1 105
byte 1 110
byte 1 109
byte 1 105
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $254
byte 1 119
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 97
byte 1 114
byte 1 101
byte 1 121
byte 1 111
byte 1 117
byte 1 0
align 1
LABELV $253
byte 1 119
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 105
byte 1 115
byte 1 0
align 1
LABELV $234
byte 1 119
byte 1 104
byte 1 111
byte 1 105
byte 1 115
byte 1 0
align 1
LABELV $217
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $168
byte 1 73
byte 1 32
byte 1 110
byte 1 101
byte 1 101
byte 1 100
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 32
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 112
byte 1 97
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 10
byte 1 0
align 1
LABELV $143
byte 1 119
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 100
byte 1 111
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 115
byte 1 97
byte 1 121
byte 1 63
byte 1 0
