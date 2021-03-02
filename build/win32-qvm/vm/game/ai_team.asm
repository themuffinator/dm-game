export BotValidTeamLeader
code
proc BotValidTeamLeader 8 4
file "..\..\..\..\code\game\ai_team.c"
line 48
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:/*****************************************************************************
;5: * name:		ai_team.c
;6: *
;7: * desc:		Quake3 bot AI
;8: *
;9: * $Archive: /MissionPack/code/game/ai_team.c $
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
;30:
;31:#include "match.h"
;32:
;33://ctf task preferences for a client
;34:typedef struct bot_ctftaskpreference_s
;35:{
;36:	char		name[36];
;37:	int			preference;
;38:} bot_ctftaskpreference_t;
;39:
;40:bot_ctftaskpreference_t ctftaskpreferences[MAX_CLIENTS];
;41:
;42:
;43:/*
;44:==================
;45:BotValidTeamLeader
;46:==================
;47:*/
;48:int BotValidTeamLeader(bot_state_t *bs) {
line 49
;49:	if (!strlen(bs->teamleader)) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $57
CNSTI4 0
RETI4
ADDRGP4 $56
JUMPV
LABELV $57
line 50
;50:	if (ClientFromName(bs->teamleader) == -1) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 -1
NEI4 $59
CNSTI4 0
RETI4
ADDRGP4 $56
JUMPV
LABELV $59
line 51
;51:	return qtrue;
CNSTI4 1
RETI4
LABELV $56
endproc BotValidTeamLeader 8 4
export BotNumTeamMates
proc BotNumTeamMates 1048 12
line 59
;52:}
;53:
;54:/*
;55:==================
;56:BotNumTeamMates
;57:==================
;58:*/
;59:int BotNumTeamMates(bot_state_t *bs) {
line 63
;60:	int i, numplayers;
;61:	char buf[MAX_INFO_STRING];
;62:
;63:	numplayers = 0;
ADDRLP4 1028
CNSTI4 0
ASGNI4
line 64
;64:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $65
JUMPV
LABELV $62
line 65
;65:		trap_GetConfigstring(CS_PLAYERS+i, buf, sizeof(buf));
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
line 67
;66:		//if no config string or no name
;67:		if (!buf[0] || !*Info_ValueForKey(buf, "n")) continue;
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $70
ADDRLP4 0
ARGP4
ADDRGP4 $69
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
NEI4 $67
LABELV $70
ADDRGP4 $63
JUMPV
LABELV $67
line 69
;68:		//skip spectators
;69:		if (atoi(Info_ValueForKey(buf, "t")) == TEAM_SPECTATOR) continue;
ADDRLP4 0
ARGP4
ADDRGP4 $73
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
NEI4 $71
ADDRGP4 $63
JUMPV
LABELV $71
line 71
;70:		//
;71:		if (BotSameTeam(bs, i)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 1044
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $74
line 72
;72:			numplayers++;
ADDRLP4 1028
ADDRLP4 1028
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 73
;73:		}
LABELV $74
line 74
;74:	}
LABELV $63
line 64
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $65
ADDRLP4 1024
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $62
line 75
;75:	return numplayers;
ADDRLP4 1028
INDIRI4
RETI4
LABELV $61
endproc BotNumTeamMates 1048 12
export BotClientTravelTimeToGoal
proc BotClientTravelTimeToGoal 480 16
line 83
;76:}
;77:
;78:/*
;79:==================
;80:BotClientTravelTimeToGoal
;81:==================
;82:*/
;83:int BotClientTravelTimeToGoal(int client, bot_goal_t *goal) {
line 87
;84:	playerState_t ps;
;85:	int areanum;
;86:
;87:	BotAI_GetClientState(client, &ps);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotAI_GetClientState
CALLI4
pop
line 88
;88:	areanum = BotPointAreaNum(ps.origin);
ADDRLP4 0+20
ARGP4
ADDRLP4 472
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 468
ADDRLP4 472
INDIRI4
ASGNI4
line 89
;89:	if (!areanum) return 1;
ADDRLP4 468
INDIRI4
CNSTI4 0
NEI4 $78
CNSTI4 1
RETI4
ADDRGP4 $76
JUMPV
LABELV $78
line 90
;90:	return trap_AAS_AreaTravelTimeToGoalArea(areanum, ps.origin, goal->areanum, TFL_DEFAULT);
ADDRLP4 468
INDIRI4
ARGI4
ADDRLP4 0+20
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 476
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 476
INDIRI4
RETI4
LABELV $76
endproc BotClientTravelTimeToGoal 480 16
export BotSortTeamMatesByBaseTravelTime
proc BotSortTeamMatesByBaseTravelTime 1340 12
line 98
;91:}
;92:
;93:/*
;94:==================
;95:BotSortTeamMatesByBaseTravelTime
;96:==================
;97:*/
;98:int BotSortTeamMatesByBaseTravelTime(bot_state_t *bs, int *teammates, int maxteammates) {
line 103
;99:
;100:	int i, j, k, numteammates, traveltime;
;101:	char buf[MAX_INFO_STRING];
;102:	int traveltimes[MAX_CLIENTS];
;103:	bot_goal_t *goal = NULL;
ADDRLP4 1300
CNSTP4 0
ASGNP4
line 105
;104:
;105:	if ( gametype == GT_CTF || gametype == GT_ONEFLAG ) {
ADDRLP4 1304
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 1304
INDIRI4
CNSTI4 4
EQI4 $84
ADDRLP4 1304
INDIRI4
CNSTI4 5
NEI4 $82
LABELV $84
line 106
;106:		if (BotTeam(bs) == TEAM_RED)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1308
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 1308
INDIRI4
CNSTI4 1
NEI4 $85
line 107
;107:			goal = &ctf_redflag;
ADDRLP4 1300
ADDRGP4 ctf_redflag
ASGNP4
ADDRGP4 $83
JUMPV
LABELV $85
line 109
;108:		else
;109:			goal = &ctf_blueflag;
ADDRLP4 1300
ADDRGP4 ctf_blueflag
ASGNP4
line 110
;110:	} else {
ADDRGP4 $83
JUMPV
LABELV $82
line 111
;111:		if (BotTeam(bs) == TEAM_RED)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1308
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 1308
INDIRI4
CNSTI4 1
NEI4 $87
line 112
;112:			goal = &redobelisk;
ADDRLP4 1300
ADDRGP4 redobelisk
ASGNP4
ADDRGP4 $88
JUMPV
LABELV $87
line 114
;113:		else
;114:			goal = &blueobelisk;
ADDRLP4 1300
ADDRGP4 blueobelisk
ASGNP4
LABELV $88
line 115
;115:	}
LABELV $83
line 117
;116:
;117:	numteammates = 0;
ADDRLP4 264
CNSTI4 0
ASGNI4
line 118
;118:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 272
CNSTI4 0
ASGNI4
ADDRGP4 $92
JUMPV
LABELV $89
line 119
;119:		trap_GetConfigstring(CS_PLAYERS+i, buf, sizeof(buf));
ADDRLP4 272
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 276
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 121
;120:		//if no config string or no name
;121:		if (!buf[0] || !*Info_ValueForKey(buf, "n")) continue;
ADDRLP4 276
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $96
ADDRLP4 276
ARGP4
ADDRGP4 $69
ARGP4
ADDRLP4 1308
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1308
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $94
LABELV $96
ADDRGP4 $90
JUMPV
LABELV $94
line 123
;122:		//skip spectators
;123:		if (atoi(Info_ValueForKey(buf, "t")) == TEAM_SPECTATOR) continue;
ADDRLP4 276
ARGP4
ADDRGP4 $73
ARGP4
ADDRLP4 1312
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1312
INDIRP4
ARGP4
ADDRLP4 1316
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1316
INDIRI4
CNSTI4 3
NEI4 $97
ADDRGP4 $90
JUMPV
LABELV $97
line 125
;124:		//
;125:		if (BotSameTeam(bs, i) && goal) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 272
INDIRI4
ARGI4
ADDRLP4 1320
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 1320
INDIRI4
CNSTI4 0
EQI4 $99
ADDRLP4 1300
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $99
line 127
;126:			//
;127:			traveltime = BotClientTravelTimeToGoal(i, goal);
ADDRLP4 272
INDIRI4
ARGI4
ADDRLP4 1300
INDIRP4
ARGP4
ADDRLP4 1324
ADDRGP4 BotClientTravelTimeToGoal
CALLI4
ASGNI4
ADDRLP4 268
ADDRLP4 1324
INDIRI4
ASGNI4
line 129
;128:			//
;129:			for (j = 0; j < numteammates; j++) {
ADDRLP4 260
CNSTI4 0
ASGNI4
ADDRGP4 $104
JUMPV
LABELV $101
line 130
;130:				if (traveltime < traveltimes[j]) {
ADDRLP4 268
INDIRI4
ADDRLP4 260
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
GEI4 $105
line 131
;131:					for (k = numteammates; k > j; k--) {
ADDRLP4 0
ADDRLP4 264
INDIRI4
ASGNI4
ADDRGP4 $110
JUMPV
LABELV $107
line 132
;132:						traveltimes[k] = traveltimes[k-1];
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
INDIRI4
ASGNI4
line 133
;133:						teammates[k] = teammates[k-1];
ADDRLP4 1336
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1336
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 4
SUBI4
ADDRLP4 1336
INDIRP4
ADDP4
INDIRI4
ASGNI4
line 134
;134:					}
LABELV $108
line 131
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $110
ADDRLP4 0
INDIRI4
ADDRLP4 260
INDIRI4
GTI4 $107
line 135
;135:					break;
ADDRGP4 $103
JUMPV
LABELV $105
line 137
;136:				}
;137:			}
LABELV $102
line 129
ADDRLP4 260
ADDRLP4 260
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $104
ADDRLP4 260
INDIRI4
ADDRLP4 264
INDIRI4
LTI4 $101
LABELV $103
line 138
;138:			traveltimes[j] = traveltime;
ADDRLP4 260
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 268
INDIRI4
ASGNI4
line 139
;139:			teammates[j] = i;
ADDRLP4 260
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
ADDRLP4 272
INDIRI4
ASGNI4
line 140
;140:			numteammates++;
ADDRLP4 264
ADDRLP4 264
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 141
;141:			if (numteammates >= maxteammates) break;
ADDRLP4 264
INDIRI4
ADDRFP4 8
INDIRI4
LTI4 $112
ADDRGP4 $91
JUMPV
LABELV $112
line 142
;142:		}
LABELV $99
line 143
;143:	}
LABELV $90
line 118
ADDRLP4 272
ADDRLP4 272
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $92
ADDRLP4 272
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $89
LABELV $91
line 144
;144:	return numteammates;
ADDRLP4 264
INDIRI4
RETI4
LABELV $81
endproc BotSortTeamMatesByBaseTravelTime 1340 12
export BotSetTeamMateTaskPreference
proc BotSetTeamMateTaskPreference 36 12
line 152
;145:}
;146:
;147:/*
;148:==================
;149:BotSetTeamMateTaskPreference
;150:==================
;151:*/
;152:void BotSetTeamMateTaskPreference(bot_state_t *bs, int teammate, int preference) {
line 155
;153:	char teammatename[MAX_NETNAME];
;154:
;155:	ctftaskpreferences[teammate].preference = preference;
ADDRFP4 4
INDIRI4
CNSTI4 40
MULI4
ADDRGP4 ctftaskpreferences+36
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 156
;156:	ClientName(teammate, teammatename, sizeof(teammatename));
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 157
;157:	strcpy(ctftaskpreferences[teammate].name, teammatename);
ADDRFP4 4
INDIRI4
CNSTI4 40
MULI4
ADDRGP4 ctftaskpreferences
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 158
;158:}
LABELV $114
endproc BotSetTeamMateTaskPreference 36 12
export BotGetTeamMateTaskPreference
proc BotGetTeamMateTaskPreference 40 12
line 165
;159:
;160:/*
;161:==================
;162:BotGetTeamMateTaskPreference
;163:==================
;164:*/
;165:int BotGetTeamMateTaskPreference(bot_state_t *bs, int teammate) {
line 168
;166:	char teammatename[MAX_NETNAME];
;167:
;168:	if (!ctftaskpreferences[teammate].preference) return 0;
ADDRFP4 4
INDIRI4
CNSTI4 40
MULI4
ADDRGP4 ctftaskpreferences+36
ADDP4
INDIRI4
CNSTI4 0
NEI4 $117
CNSTI4 0
RETI4
ADDRGP4 $116
JUMPV
LABELV $117
line 169
;169:	ClientName(teammate, teammatename, sizeof(teammatename));
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 170
;170:	if (Q_stricmp(teammatename, ctftaskpreferences[teammate].name)) return 0;
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRI4
CNSTI4 40
MULI4
ADDRGP4 ctftaskpreferences
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $120
CNSTI4 0
RETI4
ADDRGP4 $116
JUMPV
LABELV $120
line 171
;171:	return ctftaskpreferences[teammate].preference;
ADDRFP4 4
INDIRI4
CNSTI4 40
MULI4
ADDRGP4 ctftaskpreferences+36
ADDP4
INDIRI4
RETI4
LABELV $116
endproc BotGetTeamMateTaskPreference 40 12
export BotSortTeamMatesByTaskPreference
proc BotSortTeamMatesByTaskPreference 800 12
line 179
;172:}
;173:
;174:/*
;175:==================
;176:BotSortTeamMatesByTaskPreference
;177:==================
;178:*/
;179:int BotSortTeamMatesByTaskPreference(bot_state_t *bs, int *teammates, int numteammates) {
line 185
;180:	int defenders[MAX_CLIENTS], numdefenders;
;181:	int attackers[MAX_CLIENTS], numattackers;
;182:	int roamers[MAX_CLIENTS], numroamers;
;183:	int i, preference;
;184:
;185:	numdefenders = numattackers = numroamers = 0;
ADDRLP4 788
CNSTI4 0
ASGNI4
ADDRLP4 272
ADDRLP4 788
INDIRI4
ASGNI4
ADDRLP4 268
ADDRLP4 788
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 788
INDIRI4
ASGNI4
line 186
;186:	for (i = 0; i < numteammates; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $127
JUMPV
LABELV $124
line 187
;187:		preference = BotGetTeamMateTaskPreference(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 792
ADDRGP4 BotGetTeamMateTaskPreference
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 792
INDIRI4
ASGNI4
line 188
;188:		if (preference & TEAMTP_DEFENDER) {
ADDRLP4 4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $128
line 189
;189:			defenders[numdefenders++] = teammates[i];
ADDRLP4 796
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 796
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 796
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI4
ASGNI4
line 190
;190:		}
ADDRGP4 $129
JUMPV
LABELV $128
line 191
;191:		else if (preference & TEAMTP_ATTACKER) {
ADDRLP4 4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $130
line 192
;192:			attackers[numattackers++] = teammates[i];
ADDRLP4 796
ADDRLP4 268
INDIRI4
ASGNI4
ADDRLP4 268
ADDRLP4 796
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 796
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 276
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI4
ASGNI4
line 193
;193:		}
ADDRGP4 $131
JUMPV
LABELV $130
line 194
;194:		else {
line 195
;195:			roamers[numroamers++] = teammates[i];
ADDRLP4 796
ADDRLP4 272
INDIRI4
ASGNI4
ADDRLP4 272
ADDRLP4 796
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 796
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 532
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI4
ASGNI4
line 196
;196:		}
LABELV $131
LABELV $129
line 197
;197:	}
LABELV $125
line 186
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $127
ADDRLP4 0
INDIRI4
ADDRFP4 8
INDIRI4
LTI4 $124
line 198
;198:	numteammates = 0;
ADDRFP4 8
CNSTI4 0
ASGNI4
line 200
;199:	//defenders at the front of the list
;200:	memcpy(&teammates[numteammates], defenders, numdefenders * sizeof(int));
ADDRFP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 8
INDIRI4
CVIU4 4
CNSTI4 2
LSHU4
CVUI4 4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 201
;201:	numteammates += numdefenders;
ADDRFP4 8
ADDRFP4 8
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 203
;202:	//roamers in the middle
;203:	memcpy(&teammates[numteammates], roamers, numroamers * sizeof(int));
ADDRFP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
ARGP4
ADDRLP4 532
ARGP4
ADDRLP4 272
INDIRI4
CVIU4 4
CNSTI4 2
LSHU4
CVUI4 4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 204
;204:	numteammates += numroamers;
ADDRFP4 8
ADDRFP4 8
INDIRI4
ADDRLP4 272
INDIRI4
ADDI4
ASGNI4
line 206
;205:	//attacker in the back of the list
;206:	memcpy(&teammates[numteammates], attackers, numattackers * sizeof(int));
ADDRFP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
ARGP4
ADDRLP4 276
ARGP4
ADDRLP4 268
INDIRI4
CVIU4 4
CNSTI4 2
LSHU4
CVUI4 4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 207
;207:	numteammates += numattackers;
ADDRFP4 8
ADDRFP4 8
INDIRI4
ADDRLP4 268
INDIRI4
ADDI4
ASGNI4
line 209
;208:
;209:	return numteammates;
ADDRFP4 8
INDIRI4
RETI4
LABELV $123
endproc BotSortTeamMatesByTaskPreference 800 12
export BotSayTeamOrderAlways
proc BotSayTeamOrderAlways 548 20
line 217
;210:}
;211:
;212:/*
;213:==================
;214:BotSayTeamOrders
;215:==================
;216:*/
;217:void BotSayTeamOrderAlways(bot_state_t *bs, int toclient) {
line 223
;218:	char teamchat[MAX_MESSAGE_SIZE];
;219:	char buf[MAX_MESSAGE_SIZE];
;220:	char name[MAX_NETNAME];
;221:
;222:	//if the bot is talking to itself
;223:	if (bs->client == toclient) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $133
line 225
;224:		//don't show the message just put it in the console message queue
;225:		trap_BotGetChatMessage(bs->cs, buf, sizeof(buf));
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 256
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGetChatMessage
CALLV
pop
line 226
;226:		ClientName(bs->client, name, sizeof(name));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 512
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 227
;227:		Com_sprintf(teamchat, sizeof(teamchat), EC"(%s"EC")"EC": %s", name, buf);
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $135
ARGP4
ADDRLP4 512
ARGP4
ADDRLP4 256
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 228
;228:		trap_BotQueueConsoleMessage(bs->cs, CMS_CHAT, teamchat);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotQueueConsoleMessage
CALLV
pop
line 229
;229:	}
ADDRGP4 $134
JUMPV
LABELV $133
line 230
;230:	else {
line 231
;231:		trap_BotEnterChat(bs->cs, toclient, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 232
;232:	}
LABELV $134
line 233
;233:}
LABELV $132
endproc BotSayTeamOrderAlways 548 20
export BotSayTeamOrder
proc BotSayTeamOrder 0 8
line 240
;234:
;235:/*
;236:==================
;237:BotSayTeamOrders
;238:==================
;239:*/
;240:void BotSayTeamOrder(bot_state_t *bs, int toclient) {
line 241
;241:	BotSayTeamOrderAlways(bs, toclient);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrderAlways
CALLV
pop
line 242
;242:}
LABELV $136
endproc BotSayTeamOrder 0 8
export BotCTFOrders_BothFlagsNotAtBase
proc BotCTFOrders_BothFlagsNotAtBase 364 20
line 249
;243:
;244:/*
;245:==================
;246:BotCTFOrders
;247:==================
;248:*/
;249:void BotCTFOrders_BothFlagsNotAtBase(bot_state_t *bs) {
line 254
;250:	int numteammates, defenders, attackers, i, other;
;251:	int teammates[MAX_CLIENTS];
;252:	char name[MAX_NETNAME], carriername[MAX_NETNAME];
;253:
;254:	memset( teammates, 0, sizeof( teammates ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 256
ARGI4
ADDRGP4 memset
CALLP4
pop
line 255
;255:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 348
ADDRGP4 BotSortTeamMatesByBaseTravelTime
CALLI4
ASGNI4
ADDRLP4 296
ADDRLP4 348
INDIRI4
ASGNI4
line 256
;256:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 296
INDIRI4
ARGI4
ADDRGP4 BotSortTeamMatesByTaskPreference
CALLI4
pop
line 258
;257:	//different orders based on the number of team mates
;258:	switch(bs->numteammates) {
ADDRLP4 352
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
INDIRI4
ASGNI4
ADDRLP4 352
INDIRI4
CNSTI4 1
EQI4 $139
ADDRLP4 352
INDIRI4
CNSTI4 2
EQI4 $142
ADDRLP4 352
INDIRI4
CNSTI4 3
EQI4 $147
ADDRGP4 $138
JUMPV
line 259
;259:		case 1: break;
LABELV $142
line 261
;260:		case 2:
;261:		{
line 263
;262:			//tell the one not carrying the flag to attack the enemy base
;263:			if (teammates[0] != bs->flagcarrier) other = teammates[0];
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
EQI4 $143
ADDRLP4 308
ADDRLP4 0
INDIRI4
ASGNI4
ADDRGP4 $144
JUMPV
LABELV $143
line 264
;264:			else other = teammates[1];
ADDRLP4 308
ADDRLP4 0+4
INDIRI4
ASGNI4
LABELV $144
line 265
;265:			ClientName(other, name, sizeof(name));
ADDRLP4 308
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 266
;266:			BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $146
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 267
;267:			BotSayTeamOrder(bs, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 268
;268:			break;
ADDRGP4 $139
JUMPV
LABELV $147
line 271
;269:		}
;270:		case 3:
;271:		{
line 273
;272:			//tell the one closest to the base not carrying the flag to accompany the flag carrier
;273:			if (teammates[0] != bs->flagcarrier) other = teammates[0];
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
EQI4 $148
ADDRLP4 308
ADDRLP4 0
INDIRI4
ASGNI4
ADDRGP4 $149
JUMPV
LABELV $148
line 274
;274:			else other = teammates[1];
ADDRLP4 308
ADDRLP4 0+4
INDIRI4
ASGNI4
LABELV $149
line 275
;275:			ClientName(other, name, sizeof(name));
ADDRLP4 308
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 276
;276:			if ( bs->flagcarrier != -1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $151
line 277
;277:				ClientName(bs->flagcarrier, carriername, sizeof(carriername));
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
ARGI4
ADDRLP4 312
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 278
;278:				if (bs->flagcarrier == bs->client) {
ADDRLP4 360
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 360
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
ADDRLP4 360
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $153
line 279
;279:					BotAI_BotInitialChat(bs, "cmd_accompanyme", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $155
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 280
;280:				}
ADDRGP4 $152
JUMPV
LABELV $153
line 281
;281:				else {
line 282
;282:					BotAI_BotInitialChat(bs, "cmd_accompany", name, carriername, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $156
ARGP4
ADDRLP4 260
ARGP4
ADDRLP4 312
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 283
;283:				}
line 284
;284:			}
ADDRGP4 $152
JUMPV
LABELV $151
line 285
;285:			else {
line 287
;286:				//
;287:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $146
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 288
;288:			}
LABELV $152
line 289
;289:			BotSayTeamOrder(bs, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 291
;290:			//tell the one furthest from the the base not carrying the flag to get the enemy flag
;291:			if (teammates[2] != bs->flagcarrier) other = teammates[2];
ADDRLP4 0+8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
EQI4 $157
ADDRLP4 308
ADDRLP4 0+8
INDIRI4
ASGNI4
ADDRGP4 $158
JUMPV
LABELV $157
line 292
;292:			else other = teammates[1];
ADDRLP4 308
ADDRLP4 0+4
INDIRI4
ASGNI4
LABELV $158
line 293
;293:			ClientName(other, name, sizeof(name));
ADDRLP4 308
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 294
;294:			BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $146
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 295
;295:			BotSayTeamOrder(bs, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 296
;296:			break;
ADDRGP4 $139
JUMPV
LABELV $138
line 299
;297:		}
;298:		default:
;299:		{
line 300
;300:			defenders = (int) (float) numteammates * 0.4 + 0.5;
ADDRLP4 300
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1053609165
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 301
;301:			if (defenders > 4) defenders = 4;
ADDRLP4 300
INDIRI4
CNSTI4 4
LEI4 $162
ADDRLP4 300
CNSTI4 4
ASGNI4
LABELV $162
line 302
;302:			attackers = (int) (float) numteammates * 0.5 + 0.5;
ADDRLP4 304
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1056964608
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 303
;303:			if (attackers > 5) attackers = 5;
ADDRLP4 304
INDIRI4
CNSTI4 5
LEI4 $164
ADDRLP4 304
CNSTI4 5
ASGNI4
LABELV $164
line 304
;304:			if (bs->flagcarrier != -1) {
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $166
line 305
;305:				ClientName(bs->flagcarrier, carriername, sizeof(carriername));
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
ARGI4
ADDRLP4 312
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 306
;306:				for (i = 0; i < defenders; i++) {
ADDRLP4 256
CNSTI4 0
ASGNI4
ADDRGP4 $171
JUMPV
LABELV $168
line 308
;307:					//
;308:					if (teammates[i] == bs->flagcarrier) {
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
NEI4 $172
line 309
;309:						continue;
ADDRGP4 $169
JUMPV
LABELV $172
line 312
;310:					}
;311:					//
;312:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
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
line 313
;313:					if (bs->flagcarrier == bs->client) {
ADDRLP4 360
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 360
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
ADDRLP4 360
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $174
line 314
;314:						BotAI_BotInitialChat(bs, "cmd_accompanyme", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $155
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 315
;315:					}
ADDRGP4 $175
JUMPV
LABELV $174
line 316
;316:					else {
line 317
;317:						BotAI_BotInitialChat(bs, "cmd_accompany", name, carriername, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $156
ARGP4
ADDRLP4 260
ARGP4
ADDRLP4 312
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 318
;318:					}
LABELV $175
line 319
;319:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 320
;320:				}
LABELV $169
line 306
ADDRLP4 256
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $171
ADDRLP4 256
INDIRI4
ADDRLP4 300
INDIRI4
LTI4 $168
line 321
;321:			}
ADDRGP4 $167
JUMPV
LABELV $166
line 322
;322:			else {
line 323
;323:				for (i = 0; i < defenders; i++) {
ADDRLP4 256
CNSTI4 0
ASGNI4
ADDRGP4 $179
JUMPV
LABELV $176
line 325
;324:					//
;325:					if (teammates[i] == bs->flagcarrier) {
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
NEI4 $180
line 326
;326:						continue;
ADDRGP4 $177
JUMPV
LABELV $180
line 329
;327:					}
;328:					//
;329:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
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
line 330
;330:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $146
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 331
;331:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 332
;332:				}
LABELV $177
line 323
ADDRLP4 256
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $179
ADDRLP4 256
INDIRI4
ADDRLP4 300
INDIRI4
LTI4 $176
line 333
;333:			}
LABELV $167
line 334
;334:			for (i = 0; i < attackers; i++) {
ADDRLP4 256
CNSTI4 0
ASGNI4
ADDRGP4 $185
JUMPV
LABELV $182
line 336
;335:				//
;336:				if (teammates[numteammates - i - 1] == bs->flagcarrier) {
ADDRLP4 296
INDIRI4
ADDRLP4 256
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
NEI4 $186
line 337
;337:					continue;
ADDRGP4 $183
JUMPV
LABELV $186
line 340
;338:				}
;339:				//
;340:				ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 296
INDIRI4
ADDRLP4 256
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
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
line 341
;341:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $146
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 342
;342:				BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 256
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 343
;343:			}
LABELV $183
line 334
ADDRLP4 256
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $185
ADDRLP4 256
INDIRI4
ADDRLP4 304
INDIRI4
LTI4 $182
line 345
;344:			//
;345:			break;
LABELV $139
line 348
;346:		}
;347:	}
;348:}
LABELV $137
endproc BotCTFOrders_BothFlagsNotAtBase 364 20
export BotCTFOrders_FlagNotAtBase
proc BotCTFOrders_FlagNotAtBase 320 16
line 355
;349:
;350:/*
;351:==================
;352:BotCTFOrders
;353:==================
;354:*/
;355:void BotCTFOrders_FlagNotAtBase(bot_state_t *bs) {
line 360
;356:	int numteammates, defenders, attackers, i;
;357:	int teammates[MAX_CLIENTS];
;358:	char name[MAX_NETNAME];
;359:
;360:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 308
ADDRGP4 BotSortTeamMatesByBaseTravelTime
CALLI4
ASGNI4
ADDRLP4 296
ADDRLP4 308
INDIRI4
ASGNI4
line 361
;361:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 296
INDIRI4
ARGI4
ADDRGP4 BotSortTeamMatesByTaskPreference
CALLI4
pop
line 363
;362:	//passive strategy
;363:	if (!(bs->ctfstrategy & CTFS_AGRESSIVE)) {
ADDRFP4 0
INDIRP4
CNSTI4 6980
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $192
line 365
;364:		//different orders based on the number of team mates
;365:		switch(bs->numteammates) {
ADDRLP4 312
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
INDIRI4
ASGNI4
ADDRLP4 312
INDIRI4
CNSTI4 1
EQI4 $193
ADDRLP4 312
INDIRI4
CNSTI4 2
EQI4 $198
ADDRLP4 312
INDIRI4
CNSTI4 3
EQI4 $202
ADDRGP4 $194
JUMPV
line 366
;366:			case 1: break;
LABELV $198
line 368
;367:			case 2:
;368:			{
line 370
;369:				//both will go for the enemy flag
;370:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 371
;371:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 372
;372:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 374
;373:				//
;374:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 375
;375:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $146
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 376
;376:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 377
;377:				break;
ADDRGP4 $193
JUMPV
LABELV $202
line 380
;378:			}
;379:			case 3:
;380:			{
line 382
;381:				//keep one near the base for when the flag is returned
;382:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 383
;383:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 384
;384:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 386
;385:				//the other two get the flag
;386:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 387
;387:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $146
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 388
;388:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 390
;389:      			//
;390:				ClientName(teammates[2], name, sizeof(name));
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 391
;391:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $146
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 392
;392:				BotSayTeamOrder(bs, teammates[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 393
;393:				break;
ADDRGP4 $193
JUMPV
LABELV $194
line 396
;394:			}
;395:			default:
;396:			{
line 398
;397:				//keep some people near the base for when the flag is returned
;398:				defenders = (int) (float) numteammates * 0.3 + 0.5;
ADDRLP4 300
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1050253722
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 399
;399:				if (defenders > 3) defenders = 3;
ADDRLP4 300
INDIRI4
CNSTI4 3
LEI4 $207
ADDRLP4 300
CNSTI4 3
ASGNI4
LABELV $207
line 400
;400:				attackers = (int) (float) numteammates * 0.7 + 0.5;
ADDRLP4 304
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1060320051
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 401
;401:				if (attackers > 6) attackers = 6;
ADDRLP4 304
INDIRI4
CNSTI4 6
LEI4 $209
ADDRLP4 304
CNSTI4 6
ASGNI4
LABELV $209
line 402
;402:				for (i = 0; i < defenders; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $214
JUMPV
LABELV $211
line 404
;403:					//
;404:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
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
line 405
;405:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 406
;406:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 407
;407:				}
LABELV $212
line 402
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $214
ADDRLP4 0
INDIRI4
ADDRLP4 300
INDIRI4
LTI4 $211
line 408
;408:				for (i = 0; i < attackers; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $218
JUMPV
LABELV $215
line 410
;409:					//
;410:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
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
line 411
;411:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $146
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 412
;412:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 413
;413:				}
LABELV $216
line 408
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $218
ADDRLP4 0
INDIRI4
ADDRLP4 304
INDIRI4
LTI4 $215
line 415
;414:				//
;415:				break;
line 418
;416:			}
;417:		}
;418:	}
ADDRGP4 $193
JUMPV
LABELV $192
line 419
;419:	else {
line 421
;420:		//different orders based on the number of team mates
;421:		switch(bs->numteammates) {
ADDRLP4 312
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
INDIRI4
ASGNI4
ADDRLP4 312
INDIRI4
CNSTI4 1
EQI4 $222
ADDRLP4 312
INDIRI4
CNSTI4 2
EQI4 $225
ADDRLP4 312
INDIRI4
CNSTI4 3
EQI4 $228
ADDRGP4 $221
JUMPV
line 422
;422:			case 1: break;
LABELV $225
line 424
;423:			case 2:
;424:			{
line 426
;425:				//both will go for the enemy flag
;426:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 427
;427:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $146
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 428
;428:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 430
;429:				//
;430:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 431
;431:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $146
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 432
;432:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 433
;433:				break;
ADDRGP4 $222
JUMPV
LABELV $228
line 436
;434:			}
;435:			case 3:
;436:			{
line 438
;437:				//everyone go for the flag
;438:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 439
;439:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 440
;440:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 442
;441:				//
;442:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 443
;443:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $146
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 444
;444:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 446
;445:				//
;446:				ClientName(teammates[2], name, sizeof(name));
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 447
;447:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $146
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 448
;448:				BotSayTeamOrder(bs, teammates[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 449
;449:				break;
ADDRGP4 $222
JUMPV
LABELV $221
line 452
;450:			}
;451:			default:
;452:			{
line 454
;453:				//keep some people near the base for when the flag is returned
;454:				defenders = (int) (float) numteammates * 0.2 + 0.5;
ADDRLP4 300
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1045220557
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 455
;455:				if (defenders > 2) defenders = 2;
ADDRLP4 300
INDIRI4
CNSTI4 2
LEI4 $233
ADDRLP4 300
CNSTI4 2
ASGNI4
LABELV $233
line 456
;456:				attackers = (int) (float) numteammates * 0.7 + 0.5;
ADDRLP4 304
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1060320051
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 457
;457:				if (attackers > 7) attackers = 7;
ADDRLP4 304
INDIRI4
CNSTI4 7
LEI4 $235
ADDRLP4 304
CNSTI4 7
ASGNI4
LABELV $235
line 458
;458:				for (i = 0; i < defenders; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $240
JUMPV
LABELV $237
line 460
;459:					//
;460:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
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
line 461
;461:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 462
;462:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 463
;463:				}
LABELV $238
line 458
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $240
ADDRLP4 0
INDIRI4
ADDRLP4 300
INDIRI4
LTI4 $237
line 464
;464:				for (i = 0; i < attackers; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $244
JUMPV
LABELV $241
line 466
;465:					//
;466:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
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
line 467
;467:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $146
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 468
;468:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 469
;469:				}
LABELV $242
line 464
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $244
ADDRLP4 0
INDIRI4
ADDRLP4 304
INDIRI4
LTI4 $241
line 471
;470:				//
;471:				break;
LABELV $222
line 474
;472:			}
;473:		}
;474:	}
LABELV $193
line 475
;475:}
LABELV $191
endproc BotCTFOrders_FlagNotAtBase 320 16
export BotCTFOrders_EnemyFlagNotAtBase
proc BotCTFOrders_EnemyFlagNotAtBase 360 20
line 482
;476:
;477:/*
;478:==================
;479:BotCTFOrders
;480:==================
;481:*/
;482:void BotCTFOrders_EnemyFlagNotAtBase(bot_state_t *bs) {
line 487
;483:	int numteammates, defenders, attackers, i, other;
;484:	int teammates[MAX_CLIENTS];
;485:	char name[MAX_NETNAME], carriername[MAX_NETNAME];
;486:
;487:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 348
ADDRGP4 BotSortTeamMatesByBaseTravelTime
CALLI4
ASGNI4
ADDRLP4 296
ADDRLP4 348
INDIRI4
ASGNI4
line 488
;488:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 296
INDIRI4
ARGI4
ADDRGP4 BotSortTeamMatesByTaskPreference
CALLI4
pop
line 490
;489:	//different orders based on the number of team mates
;490:	switch(numteammates) {
ADDRLP4 296
INDIRI4
CNSTI4 1
EQI4 $249
ADDRLP4 296
INDIRI4
CNSTI4 2
EQI4 $251
ADDRLP4 296
INDIRI4
CNSTI4 3
EQI4 $255
ADDRGP4 $248
JUMPV
line 491
;491:		case 1: break;
LABELV $251
line 493
;492:		case 2:
;493:		{
line 495
;494:			//tell the one not carrying the flag to defend the base
;495:			if (teammates[0] == bs->flagcarrier) other = teammates[1];
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
NEI4 $252
ADDRLP4 308
ADDRLP4 4+4
INDIRI4
ASGNI4
ADDRGP4 $253
JUMPV
LABELV $252
line 496
;496:			else other = teammates[0];
ADDRLP4 308
ADDRLP4 4
INDIRI4
ASGNI4
LABELV $253
line 497
;497:			ClientName(other, name, sizeof(name));
ADDRLP4 308
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 498
;498:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 499
;499:			BotSayTeamOrder(bs, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 500
;500:			break;
ADDRGP4 $249
JUMPV
LABELV $255
line 503
;501:		}
;502:		case 3:
;503:		{
line 505
;504:			//tell the one closest to the base not carrying the flag to defend the base
;505:			if (teammates[0] != bs->flagcarrier) other = teammates[0];
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
EQI4 $256
ADDRLP4 308
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $257
JUMPV
LABELV $256
line 506
;506:			else other = teammates[1];
ADDRLP4 308
ADDRLP4 4+4
INDIRI4
ASGNI4
LABELV $257
line 507
;507:			ClientName(other, name, sizeof(name));
ADDRLP4 308
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 508
;508:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 509
;509:			BotSayTeamOrder(bs, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 511
;510:			//tell the other also to defend the base
;511:			if (teammates[2] != bs->flagcarrier) other = teammates[2];
ADDRLP4 4+8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
EQI4 $259
ADDRLP4 308
ADDRLP4 4+8
INDIRI4
ASGNI4
ADDRGP4 $260
JUMPV
LABELV $259
line 512
;512:			else other = teammates[1];
ADDRLP4 308
ADDRLP4 4+4
INDIRI4
ASGNI4
LABELV $260
line 513
;513:			ClientName(other, name, sizeof(name));
ADDRLP4 308
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 514
;514:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 515
;515:			BotSayTeamOrder(bs, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 516
;516:			break;
ADDRGP4 $249
JUMPV
LABELV $248
line 519
;517:		}
;518:		default:
;519:		{
line 521
;520:			//60% will defend the base
;521:			defenders = (int) (float) numteammates * 0.6 + 0.5;
ADDRLP4 300
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1058642330
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 522
;522:			if (defenders > 6) defenders = 6;
ADDRLP4 300
INDIRI4
CNSTI4 6
LEI4 $264
ADDRLP4 300
CNSTI4 6
ASGNI4
LABELV $264
line 524
;523:			//30% accompanies the flag carrier
;524:			attackers = (int) (float) numteammates * 0.3 + 0.5;
ADDRLP4 304
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1050253722
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 525
;525:			if (attackers > 3) attackers = 3;
ADDRLP4 304
INDIRI4
CNSTI4 3
LEI4 $266
ADDRLP4 304
CNSTI4 3
ASGNI4
LABELV $266
line 526
;526:			for (i = 0; i < defenders; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $271
JUMPV
LABELV $268
line 528
;527:				//
;528:				if (teammates[i] == bs->flagcarrier) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
NEI4 $272
line 529
;529:					continue;
ADDRGP4 $269
JUMPV
LABELV $272
line 531
;530:				}
;531:				ClientName(teammates[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
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
line 532
;532:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 533
;533:				BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 534
;534:			}
LABELV $269
line 526
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $271
ADDRLP4 0
INDIRI4
ADDRLP4 300
INDIRI4
LTI4 $268
line 536
;535:			// if we have a flag carrier
;536:			if ( bs->flagcarrier != -1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $274
line 537
;537:				ClientName(bs->flagcarrier, carriername, sizeof(carriername));
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
ARGI4
ADDRLP4 312
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 538
;538:				for (i = 0; i < attackers; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $279
JUMPV
LABELV $276
line 540
;539:					//
;540:					if (teammates[numteammates - i - 1] == bs->flagcarrier) {
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
NEI4 $280
line 541
;541:						continue;
ADDRGP4 $277
JUMPV
LABELV $280
line 544
;542:					}
;543:					//
;544:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
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
line 545
;545:					if (bs->flagcarrier == bs->client) {
ADDRLP4 356
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 356
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
ADDRLP4 356
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $284
line 546
;546:						BotAI_BotInitialChat(bs, "cmd_accompanyme", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $155
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 547
;547:					}
ADDRGP4 $285
JUMPV
LABELV $284
line 548
;548:					else {
line 549
;549:						BotAI_BotInitialChat(bs, "cmd_accompany", name, carriername, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $156
ARGP4
ADDRLP4 260
ARGP4
ADDRLP4 312
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 550
;550:					}
LABELV $285
line 551
;551:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 552
;552:				}
LABELV $277
line 538
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $279
ADDRLP4 0
INDIRI4
ADDRLP4 304
INDIRI4
LTI4 $276
line 553
;553:			}
ADDRGP4 $249
JUMPV
LABELV $274
line 554
;554:			else {
line 555
;555:				for (i = 0; i < attackers; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $290
JUMPV
LABELV $287
line 557
;556:					//
;557:					if (teammates[numteammates - i - 1] == bs->flagcarrier) {
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
NEI4 $291
line 558
;558:						continue;
ADDRGP4 $288
JUMPV
LABELV $291
line 561
;559:					}
;560:					//
;561:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
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
line 562
;562:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $146
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 563
;563:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 564
;564:				}
LABELV $288
line 555
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $290
ADDRLP4 0
INDIRI4
ADDRLP4 304
INDIRI4
LTI4 $287
line 565
;565:			}
line 567
;566:			//
;567:			break;
LABELV $249
line 570
;568:		}
;569:	}
;570:}
LABELV $247
endproc BotCTFOrders_EnemyFlagNotAtBase 360 20
export BotCTFOrders_BothFlagsAtBase
proc BotCTFOrders_BothFlagsAtBase 316 16
line 578
;571:
;572:
;573:/*
;574:==================
;575:BotCTFOrders
;576:==================
;577:*/
;578:void BotCTFOrders_BothFlagsAtBase(bot_state_t *bs) {
line 583
;579:	int numteammates, defenders, attackers, i;
;580:	int teammates[MAX_CLIENTS];
;581:	char name[MAX_NETNAME];
;582:
;583:	memset( teammates, 0, sizeof( teammates ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 256
ARGI4
ADDRGP4 memset
CALLP4
pop
line 585
;584:	//sort team mates by travel time to base
;585:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 308
ADDRGP4 BotSortTeamMatesByBaseTravelTime
CALLI4
ASGNI4
ADDRLP4 296
ADDRLP4 308
INDIRI4
ASGNI4
line 587
;586:	//sort team mates by CTF preference
;587:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 296
INDIRI4
ARGI4
ADDRGP4 BotSortTeamMatesByTaskPreference
CALLI4
pop
line 589
;588:	//passive strategy
;589:	if (!(bs->ctfstrategy & CTFS_AGRESSIVE)) {
ADDRFP4 0
INDIRP4
CNSTI4 6980
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $297
line 591
;590:		//different orders based on the number of team mates
;591:		switch(numteammates) {
ADDRLP4 296
INDIRI4
CNSTI4 1
EQI4 $298
ADDRLP4 296
INDIRI4
CNSTI4 2
EQI4 $302
ADDRLP4 296
INDIRI4
CNSTI4 3
EQI4 $305
ADDRGP4 $299
JUMPV
line 592
;592:			case 1: break;
LABELV $302
line 594
;593:			case 2:
;594:			{
line 596
;595:				//the one closest to the base will defend the base
;596:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 597
;597:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 598
;598:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 600
;599:				//the other will get the flag
;600:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 601
;601:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $146
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 602
;602:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 603
;603:				break;
ADDRGP4 $298
JUMPV
LABELV $305
line 606
;604:			}
;605:			case 3:
;606:			{
line 608
;607:				//the one closest to the base will defend the base
;608:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 609
;609:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 610
;610:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 612
;611:				//the second one closest to the base will defend the base
;612:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 613
;613:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 614
;614:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 616
;615:				//the other will get the flag
;616:				ClientName(teammates[2], name, sizeof(name));
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 617
;617:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $146
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 618
;618:				BotSayTeamOrder(bs, teammates[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 619
;619:				break;
ADDRGP4 $298
JUMPV
LABELV $299
line 622
;620:			}
;621:			default:
;622:			{
line 623
;623:				defenders = (int) (float) numteammates * 0.5 + 0.5;
ADDRLP4 300
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1056964608
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 624
;624:				if (defenders > 5) defenders = 5;
ADDRLP4 300
INDIRI4
CNSTI4 5
LEI4 $310
ADDRLP4 300
CNSTI4 5
ASGNI4
LABELV $310
line 625
;625:				attackers = (int) (float) numteammates * 0.4 + 0.5;
ADDRLP4 304
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1053609165
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 626
;626:				if (attackers > 4) attackers = 4;
ADDRLP4 304
INDIRI4
CNSTI4 4
LEI4 $312
ADDRLP4 304
CNSTI4 4
ASGNI4
LABELV $312
line 627
;627:				for (i = 0; i < defenders; i++) {
ADDRLP4 256
CNSTI4 0
ASGNI4
ADDRGP4 $317
JUMPV
LABELV $314
line 629
;628:					//
;629:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
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
line 630
;630:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 631
;631:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 632
;632:				}
LABELV $315
line 627
ADDRLP4 256
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $317
ADDRLP4 256
INDIRI4
ADDRLP4 300
INDIRI4
LTI4 $314
line 633
;633:				for (i = 0; i < attackers; i++) {
ADDRLP4 256
CNSTI4 0
ASGNI4
ADDRGP4 $321
JUMPV
LABELV $318
line 635
;634:					//
;635:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 296
INDIRI4
ADDRLP4 256
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
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
line 636
;636:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $146
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 637
;637:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 256
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 638
;638:				}
LABELV $319
line 633
ADDRLP4 256
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $321
ADDRLP4 256
INDIRI4
ADDRLP4 304
INDIRI4
LTI4 $318
line 640
;639:				//
;640:				break;
line 643
;641:			}
;642:		}
;643:	}
ADDRGP4 $298
JUMPV
LABELV $297
line 644
;644:	else {
line 646
;645:		//different orders based on the number of team mates
;646:		switch(numteammates) {
ADDRLP4 296
INDIRI4
CNSTI4 1
EQI4 $325
ADDRLP4 296
INDIRI4
CNSTI4 2
EQI4 $327
ADDRLP4 296
INDIRI4
CNSTI4 3
EQI4 $330
ADDRGP4 $324
JUMPV
line 647
;647:			case 1: break;
LABELV $327
line 649
;648:			case 2:
;649:			{
line 651
;650:				//the one closest to the base will defend the base
;651:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 652
;652:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 653
;653:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 655
;654:				//the other will get the flag
;655:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 656
;656:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $146
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 657
;657:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 658
;658:				break;
ADDRGP4 $325
JUMPV
LABELV $330
line 661
;659:			}
;660:			case 3:
;661:			{
line 663
;662:				//the one closest to the base will defend the base
;663:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 664
;664:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 665
;665:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 667
;666:				//the others should go for the enemy flag
;667:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 668
;668:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $146
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 669
;669:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 671
;670:				//
;671:				ClientName(teammates[2], name, sizeof(name));
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 672
;672:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $146
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 673
;673:				BotSayTeamOrder(bs, teammates[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 674
;674:				break;
ADDRGP4 $325
JUMPV
LABELV $324
line 677
;675:			}
;676:			default:
;677:			{
line 678
;678:				defenders = (int) (float) numteammates * 0.4 + 0.5;
ADDRLP4 300
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1053609165
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 679
;679:				if (defenders > 4) defenders = 4;
ADDRLP4 300
INDIRI4
CNSTI4 4
LEI4 $335
ADDRLP4 300
CNSTI4 4
ASGNI4
LABELV $335
line 680
;680:				attackers = (int) (float) numteammates * 0.5 + 0.5;
ADDRLP4 304
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1056964608
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 681
;681:				if (attackers > 5) attackers = 5;
ADDRLP4 304
INDIRI4
CNSTI4 5
LEI4 $337
ADDRLP4 304
CNSTI4 5
ASGNI4
LABELV $337
line 682
;682:				for (i = 0; i < defenders; i++) {
ADDRLP4 256
CNSTI4 0
ASGNI4
ADDRGP4 $342
JUMPV
LABELV $339
line 684
;683:					//
;684:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
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
line 685
;685:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 686
;686:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 687
;687:				}
LABELV $340
line 682
ADDRLP4 256
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $342
ADDRLP4 256
INDIRI4
ADDRLP4 300
INDIRI4
LTI4 $339
line 688
;688:				for (i = 0; i < attackers; i++) {
ADDRLP4 256
CNSTI4 0
ASGNI4
ADDRGP4 $346
JUMPV
LABELV $343
line 690
;689:					//
;690:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 296
INDIRI4
ADDRLP4 256
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
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
line 691
;691:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $146
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 692
;692:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 256
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 693
;693:				}
LABELV $344
line 688
ADDRLP4 256
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $346
ADDRLP4 256
INDIRI4
ADDRLP4 304
INDIRI4
LTI4 $343
line 695
;694:				//
;695:				break;
LABELV $325
line 698
;696:			}
;697:		}
;698:	}
LABELV $298
line 699
;699:}
LABELV $296
endproc BotCTFOrders_BothFlagsAtBase 316 16
export BotCTFOrders
proc BotCTFOrders 20 4
line 706
;700:
;701:/*
;702:==================
;703:BotCTFOrders
;704:==================
;705:*/
;706:void BotCTFOrders(bot_state_t *bs) {
line 710
;707:	int flagstatus;
;708:
;709:	//
;710:	if (BotTeam(bs) == TEAM_RED) flagstatus = bs->redflagstatus * 2 + bs->blueflagstatus;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $350
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 6956
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 6960
ADDP4
INDIRI4
ADDI4
ASGNI4
ADDRGP4 $351
JUMPV
LABELV $350
line 711
;711:	else flagstatus = bs->blueflagstatus * 2 + bs->redflagstatus;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
CNSTI4 6960
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 6956
ADDP4
INDIRI4
ADDI4
ASGNI4
LABELV $351
line 713
;712:	//
;713:	switch(flagstatus) {
ADDRLP4 16
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $352
ADDRLP4 16
INDIRI4
CNSTI4 3
GTI4 $352
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $358
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $358
address $354
address $355
address $356
address $357
code
LABELV $354
line 714
;714:		case 0: BotCTFOrders_BothFlagsAtBase(bs); break;
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCTFOrders_BothFlagsAtBase
CALLV
pop
ADDRGP4 $353
JUMPV
LABELV $355
line 715
;715:		case 1: BotCTFOrders_EnemyFlagNotAtBase(bs); break;
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCTFOrders_EnemyFlagNotAtBase
CALLV
pop
ADDRGP4 $353
JUMPV
LABELV $356
line 716
;716:		case 2: BotCTFOrders_FlagNotAtBase(bs); break;
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCTFOrders_FlagNotAtBase
CALLV
pop
ADDRGP4 $353
JUMPV
LABELV $357
line 717
;717:		case 3: BotCTFOrders_BothFlagsNotAtBase(bs); break;
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCTFOrders_BothFlagsNotAtBase
CALLV
pop
LABELV $352
LABELV $353
line 719
;718:	}
;719:}
LABELV $349
endproc BotCTFOrders 20 4
export BotCreateGroup
proc BotCreateGroup 76 20
line 727
;720:
;721:
;722:/*
;723:==================
;724:BotCreateGroup
;725:==================
;726:*/
;727:void BotCreateGroup(bot_state_t *bs, int *teammates, int groupsize) {
line 732
;728:	char name[MAX_NETNAME], leadername[MAX_NETNAME];
;729:	int i;
;730:
;731:	// the others in the group will follow the teammates[0]
;732:	ClientName(teammates[0], leadername, sizeof(leadername));
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRLP4 40
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 733
;733:	for (i = 1; i < groupsize; i++)
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $363
JUMPV
LABELV $360
line 734
;734:	{
line 735
;735:		ClientName(teammates[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 736
;736:		if (teammates[0] == bs->client) {
ADDRFP4 4
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $364
line 737
;737:			BotAI_BotInitialChat(bs, "cmd_accompanyme", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $155
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 738
;738:		}
ADDRGP4 $365
JUMPV
LABELV $364
line 739
;739:		else {
line 740
;740:			BotAI_BotInitialChat(bs, "cmd_accompany", name, leadername, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $156
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 40
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 741
;741:		}
LABELV $365
line 742
;742:		BotSayTeamOrderAlways(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrderAlways
CALLV
pop
line 743
;743:	}
LABELV $361
line 733
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $363
ADDRLP4 0
INDIRI4
ADDRFP4 8
INDIRI4
LTI4 $360
line 744
;744:}
LABELV $359
endproc BotCreateGroup 76 20
export BotTeamOrders
proc BotTeamOrders 1304 12
line 753
;745:
;746:/*
;747:==================
;748:BotTeamOrders
;749:
;750:  FIXME: defend key areas?
;751:==================
;752:*/
;753:void BotTeamOrders(bot_state_t *bs) {
line 758
;754:	int teammates[MAX_CLIENTS];
;755:	int numteammates, i;
;756:	char buf[MAX_INFO_STRING];
;757:
;758:	numteammates = 0;
ADDRLP4 1028
CNSTI4 0
ASGNI4
line 759
;759:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $370
JUMPV
LABELV $367
line 760
;760:		trap_GetConfigstring(CS_PLAYERS+i, buf, sizeof(buf));
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
line 762
;761:		//if no config string or no name
;762:		if (!buf[0] || !*Info_ValueForKey(buf, "n")) continue;
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $374
ADDRLP4 0
ARGP4
ADDRGP4 $69
ARGP4
ADDRLP4 1288
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1288
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $372
LABELV $374
ADDRGP4 $368
JUMPV
LABELV $372
line 764
;763:		//skip spectators
;764:		if (atoi(Info_ValueForKey(buf, "t")) == TEAM_SPECTATOR) continue;
ADDRLP4 0
ARGP4
ADDRGP4 $73
ARGP4
ADDRLP4 1292
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1292
INDIRP4
ARGP4
ADDRLP4 1296
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1296
INDIRI4
CNSTI4 3
NEI4 $375
ADDRGP4 $368
JUMPV
LABELV $375
line 766
;765:		//
;766:		if (BotSameTeam(bs, i)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 1300
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 1300
INDIRI4
CNSTI4 0
EQI4 $377
line 767
;767:			teammates[numteammates] = i;
ADDRLP4 1028
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1032
ADDP4
ADDRLP4 1024
INDIRI4
ASGNI4
line 768
;768:			numteammates++;
ADDRLP4 1028
ADDRLP4 1028
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 769
;769:		}
LABELV $377
line 770
;770:	}
LABELV $368
line 759
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $370
ADDRLP4 1024
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $367
line 772
;771:	//
;772:	switch(numteammates) {
ADDRLP4 1028
INDIRI4
CNSTI4 1
LTI4 $379
ADDRLP4 1028
INDIRI4
CNSTI4 5
GTI4 $379
ADDRLP4 1028
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $394-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $394
address $380
address $380
address $383
address $384
address $386
code
line 773
;773:		case 1: break;
line 775
;774:		case 2:
;775:		{
line 777
;776:			//nothing special
;777:			break;
LABELV $383
line 780
;778:		}
;779:		case 3:
;780:		{
line 782
;781:			//have one follow another and one free roaming
;782:			BotCreateGroup(bs, teammates, 2);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1032
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 BotCreateGroup
CALLV
pop
line 783
;783:			break;
ADDRGP4 $380
JUMPV
LABELV $384
line 786
;784:		}
;785:		case 4:
;786:		{
line 787
;787:			BotCreateGroup(bs, teammates, 2);		//a group of 2
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1032
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 BotCreateGroup
CALLV
pop
line 788
;788:			BotCreateGroup(bs, &teammates[2], 2);	//a group of 2
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1032+8
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 BotCreateGroup
CALLV
pop
line 789
;789:			break;
ADDRGP4 $380
JUMPV
LABELV $386
line 792
;790:		}
;791:		case 5:
;792:		{
line 793
;793:			BotCreateGroup(bs, teammates, 2);		//a group of 2
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1032
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 BotCreateGroup
CALLV
pop
line 794
;794:			BotCreateGroup(bs, &teammates[2], 3);	//a group of 3
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1032+8
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 BotCreateGroup
CALLV
pop
line 795
;795:			break;
ADDRGP4 $380
JUMPV
LABELV $379
line 798
;796:		}
;797:		default:
;798:		{
line 799
;799:			if (numteammates <= 10) {
ADDRLP4 1028
INDIRI4
CNSTI4 10
GTI4 $380
line 800
;800:				for (i = 0; i < numteammates / 2; i++) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $393
JUMPV
LABELV $390
line 801
;801:					BotCreateGroup(bs, &teammates[i*2], 2);	//groups of 2
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 2
LSHI4
ADDRLP4 1032
ADDP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 BotCreateGroup
CALLV
pop
line 802
;802:				}
LABELV $391
line 800
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $393
ADDRLP4 1024
INDIRI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
DIVI4
LTI4 $390
line 803
;803:			}
line 804
;804:			break;
LABELV $380
line 807
;805:		}
;806:	}
;807:}
LABELV $366
endproc BotTeamOrders 1304 12
export Bot1FCTFOrders_FlagAtCenter
proc Bot1FCTFOrders_FlagAtCenter 316 16
line 817
;808:
;809:
;810:/*
;811:==================
;812:Bot1FCTFOrders_FlagAtCenter
;813:
;814:  X% defend the base, Y% get the flag
;815:==================
;816:*/
;817:void Bot1FCTFOrders_FlagAtCenter(bot_state_t *bs) {
line 823
;818:	int numteammates, defenders, attackers, i;
;819:	int teammates[MAX_CLIENTS];
;820:	char name[MAX_NETNAME];
;821:
;822:	//sort team mates by travel time to base
;823:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 308
ADDRGP4 BotSortTeamMatesByBaseTravelTime
CALLI4
ASGNI4
ADDRLP4 296
ADDRLP4 308
INDIRI4
ASGNI4
line 825
;824:	//sort team mates by CTF preference
;825:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 296
INDIRI4
ARGI4
ADDRGP4 BotSortTeamMatesByTaskPreference
CALLI4
pop
line 827
;826:	//passive strategy
;827:	if (!(bs->ctfstrategy & CTFS_AGRESSIVE)) {
ADDRFP4 0
INDIRP4
CNSTI4 6980
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $397
line 829
;828:		//different orders based on the number of team mates
;829:		switch(numteammates) {
ADDRLP4 296
INDIRI4
CNSTI4 1
EQI4 $398
ADDRLP4 296
INDIRI4
CNSTI4 2
EQI4 $402
ADDRLP4 296
INDIRI4
CNSTI4 3
EQI4 $405
ADDRGP4 $399
JUMPV
line 830
;830:			case 1: break;
LABELV $402
line 832
;831:			case 2:
;832:			{
line 834
;833:				//the one closest to the base will defend the base
;834:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 835
;835:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 836
;836:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 838
;837:				//the other will get the flag
;838:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 839
;839:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $146
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 840
;840:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 841
;841:				break;
ADDRGP4 $398
JUMPV
LABELV $405
line 844
;842:			}
;843:			case 3:
;844:			{
line 846
;845:				//the one closest to the base will defend the base
;846:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 847
;847:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 848
;848:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 850
;849:				//the second one closest to the base will defend the base
;850:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 851
;851:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 852
;852:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 854
;853:				//the other will get the flag
;854:				ClientName(teammates[2], name, sizeof(name));
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 855
;855:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $146
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 856
;856:				BotSayTeamOrder(bs, teammates[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 857
;857:				break;
ADDRGP4 $398
JUMPV
LABELV $399
line 860
;858:			}
;859:			default:
;860:			{
line 862
;861:				//50% defend the base
;862:				defenders = (int) (float) numteammates * 0.5 + 0.5;
ADDRLP4 300
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1056964608
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 863
;863:				if (defenders > 5) defenders = 5;
ADDRLP4 300
INDIRI4
CNSTI4 5
LEI4 $410
ADDRLP4 300
CNSTI4 5
ASGNI4
LABELV $410
line 865
;864:				//40% get the flag
;865:				attackers = (int) (float) numteammates * 0.4 + 0.5;
ADDRLP4 304
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1053609165
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 866
;866:				if (attackers > 4) attackers = 4;
ADDRLP4 304
INDIRI4
CNSTI4 4
LEI4 $412
ADDRLP4 304
CNSTI4 4
ASGNI4
LABELV $412
line 867
;867:				for (i = 0; i < defenders; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $417
JUMPV
LABELV $414
line 869
;868:					//
;869:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
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
line 870
;870:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 871
;871:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 872
;872:				}
LABELV $415
line 867
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $417
ADDRLP4 0
INDIRI4
ADDRLP4 300
INDIRI4
LTI4 $414
line 873
;873:				for (i = 0; i < attackers; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $421
JUMPV
LABELV $418
line 875
;874:					//
;875:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
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
line 876
;876:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $146
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 877
;877:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 878
;878:				}
LABELV $419
line 873
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $421
ADDRLP4 0
INDIRI4
ADDRLP4 304
INDIRI4
LTI4 $418
line 880
;879:				//
;880:				break;
line 883
;881:			}
;882:		}
;883:	}
ADDRGP4 $398
JUMPV
LABELV $397
line 884
;884:	else { //agressive
line 886
;885:		//different orders based on the number of team mates
;886:		switch(numteammates) {
ADDRLP4 296
INDIRI4
CNSTI4 1
EQI4 $425
ADDRLP4 296
INDIRI4
CNSTI4 2
EQI4 $427
ADDRLP4 296
INDIRI4
CNSTI4 3
EQI4 $430
ADDRGP4 $424
JUMPV
line 887
;887:			case 1: break;
LABELV $427
line 889
;888:			case 2:
;889:			{
line 891
;890:				//the one closest to the base will defend the base
;891:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 892
;892:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 893
;893:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 895
;894:				//the other will get the flag
;895:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 896
;896:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $146
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 897
;897:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 898
;898:				break;
ADDRGP4 $425
JUMPV
LABELV $430
line 901
;899:			}
;900:			case 3:
;901:			{
line 903
;902:				//the one closest to the base will defend the base
;903:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 904
;904:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 905
;905:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 907
;906:				//the others should go for the enemy flag
;907:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 908
;908:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $146
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 909
;909:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 911
;910:				//
;911:				ClientName(teammates[2], name, sizeof(name));
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 912
;912:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $146
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 913
;913:				BotSayTeamOrder(bs, teammates[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 914
;914:				break;
ADDRGP4 $425
JUMPV
LABELV $424
line 917
;915:			}
;916:			default:
;917:			{
line 919
;918:				//30% defend the base
;919:				defenders = (int) (float) numteammates * 0.3 + 0.5;
ADDRLP4 300
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1050253722
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 920
;920:				if (defenders > 3) defenders = 3;
ADDRLP4 300
INDIRI4
CNSTI4 3
LEI4 $435
ADDRLP4 300
CNSTI4 3
ASGNI4
LABELV $435
line 922
;921:				//60% get the flag
;922:				attackers = (int) (float) numteammates * 0.6 + 0.5;
ADDRLP4 304
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1058642330
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 923
;923:				if (attackers > 6) attackers = 6;
ADDRLP4 304
INDIRI4
CNSTI4 6
LEI4 $437
ADDRLP4 304
CNSTI4 6
ASGNI4
LABELV $437
line 924
;924:				for (i = 0; i < defenders; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $442
JUMPV
LABELV $439
line 926
;925:					//
;926:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
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
line 927
;927:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 928
;928:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 929
;929:				}
LABELV $440
line 924
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $442
ADDRLP4 0
INDIRI4
ADDRLP4 300
INDIRI4
LTI4 $439
line 930
;930:				for (i = 0; i < attackers; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $446
JUMPV
LABELV $443
line 932
;931:					//
;932:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
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
line 933
;933:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $146
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 934
;934:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 935
;935:				}
LABELV $444
line 930
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $446
ADDRLP4 0
INDIRI4
ADDRLP4 304
INDIRI4
LTI4 $443
line 937
;936:				//
;937:				break;
LABELV $425
line 940
;938:			}
;939:		}
;940:	}
LABELV $398
line 941
;941:}
LABELV $396
endproc Bot1FCTFOrders_FlagAtCenter 316 16
export Bot1FCTFOrders_TeamHasFlag
proc Bot1FCTFOrders_TeamHasFlag 360 20
line 950
;942:
;943:/*
;944:==================
;945:Bot1FCTFOrders_TeamHasFlag
;946:
;947:  X% towards neutral flag, Y% go towards enemy base and accompany flag carrier if visible
;948:==================
;949:*/
;950:void Bot1FCTFOrders_TeamHasFlag(bot_state_t *bs) {
line 956
;951:	int numteammates, defenders, attackers, i, other;
;952:	int teammates[MAX_CLIENTS];
;953:	char name[MAX_NETNAME], carriername[MAX_NETNAME];
;954:
;955:	//sort team mates by travel time to base
;956:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 348
ADDRGP4 BotSortTeamMatesByBaseTravelTime
CALLI4
ASGNI4
ADDRLP4 296
ADDRLP4 348
INDIRI4
ASGNI4
line 958
;957:	//sort team mates by CTF preference
;958:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 296
INDIRI4
ARGI4
ADDRGP4 BotSortTeamMatesByTaskPreference
CALLI4
pop
line 960
;959:	//passive strategy
;960:	if (!(bs->ctfstrategy & CTFS_AGRESSIVE)) {
ADDRFP4 0
INDIRP4
CNSTI4 6980
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $450
line 962
;961:		//different orders based on the number of team mates
;962:		switch(numteammates) {
ADDRLP4 296
INDIRI4
CNSTI4 1
EQI4 $451
ADDRLP4 296
INDIRI4
CNSTI4 2
EQI4 $455
ADDRLP4 296
INDIRI4
CNSTI4 3
EQI4 $460
ADDRGP4 $452
JUMPV
line 963
;963:			case 1: break;
LABELV $455
line 965
;964:			case 2:
;965:			{
line 967
;966:				//tell the one not carrying the flag to attack the enemy base
;967:				if (teammates[0] == bs->flagcarrier) other = teammates[1];
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
NEI4 $456
ADDRLP4 308
ADDRLP4 4+4
INDIRI4
ASGNI4
ADDRGP4 $457
JUMPV
LABELV $456
line 968
;968:				else other = teammates[0];
ADDRLP4 308
ADDRLP4 4
INDIRI4
ASGNI4
LABELV $457
line 969
;969:				ClientName(other, name, sizeof(name));
ADDRLP4 308
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 970
;970:				BotAI_BotInitialChat(bs, "cmd_attackenemybase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $459
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 971
;971:				BotSayTeamOrder(bs, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 972
;972:				break;
ADDRGP4 $451
JUMPV
LABELV $460
line 975
;973:			}
;974:			case 3:
;975:			{
line 977
;976:				//tell the one closest to the base not carrying the flag to defend the base
;977:				if (teammates[0] != bs->flagcarrier) other = teammates[0];
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
EQI4 $461
ADDRLP4 308
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $462
JUMPV
LABELV $461
line 978
;978:				else other = teammates[1];
ADDRLP4 308
ADDRLP4 4+4
INDIRI4
ASGNI4
LABELV $462
line 979
;979:				ClientName(other, name, sizeof(name));
ADDRLP4 308
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 980
;980:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 981
;981:				BotSayTeamOrder(bs, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 983
;982:				//tell the one furthest from the base not carrying the flag to accompany the flag carrier
;983:				if (teammates[2] != bs->flagcarrier) other = teammates[2];
ADDRLP4 4+8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
EQI4 $464
ADDRLP4 308
ADDRLP4 4+8
INDIRI4
ASGNI4
ADDRGP4 $465
JUMPV
LABELV $464
line 984
;984:				else other = teammates[1];
ADDRLP4 308
ADDRLP4 4+4
INDIRI4
ASGNI4
LABELV $465
line 985
;985:				ClientName(other, name, sizeof(name));
ADDRLP4 308
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 986
;986:				if ( bs->flagcarrier != -1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $469
line 987
;987:					ClientName(bs->flagcarrier, carriername, sizeof(carriername));
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
ARGI4
ADDRLP4 312
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 988
;988:					if (bs->flagcarrier == bs->client) {
ADDRLP4 356
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 356
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
ADDRLP4 356
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $471
line 989
;989:						BotAI_BotInitialChat(bs, "cmd_accompanyme", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $155
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 990
;990:					}
ADDRGP4 $470
JUMPV
LABELV $471
line 991
;991:					else {
line 992
;992:						BotAI_BotInitialChat(bs, "cmd_accompany", name, carriername, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $156
ARGP4
ADDRLP4 260
ARGP4
ADDRLP4 312
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 993
;993:					}
line 994
;994:				}
ADDRGP4 $470
JUMPV
LABELV $469
line 995
;995:				else {
line 997
;996:					//
;997:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $146
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 998
;998:				}
LABELV $470
line 999
;999:				BotSayTeamOrder(bs, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1000
;1000:				break;
ADDRGP4 $451
JUMPV
LABELV $452
line 1003
;1001:			}
;1002:			default:
;1003:			{
line 1005
;1004:				//30% will defend the base
;1005:				defenders = (int) (float) numteammates * 0.3 + 0.5;
ADDRLP4 300
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1050253722
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 1006
;1006:				if (defenders > 3) defenders = 3;
ADDRLP4 300
INDIRI4
CNSTI4 3
LEI4 $473
ADDRLP4 300
CNSTI4 3
ASGNI4
LABELV $473
line 1008
;1007:				//70% accompanies the flag carrier
;1008:				attackers = (int) (float) numteammates * 0.7 + 0.5;
ADDRLP4 304
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1060320051
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 1009
;1009:				if (attackers > 7) attackers = 7;
ADDRLP4 304
INDIRI4
CNSTI4 7
LEI4 $475
ADDRLP4 304
CNSTI4 7
ASGNI4
LABELV $475
line 1010
;1010:				for (i = 0; i < defenders; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $480
JUMPV
LABELV $477
line 1012
;1011:					//
;1012:					if (teammates[i] == bs->flagcarrier) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
NEI4 $481
line 1013
;1013:						continue;
ADDRGP4 $478
JUMPV
LABELV $481
line 1015
;1014:					}
;1015:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
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
line 1016
;1016:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1017
;1017:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1018
;1018:				}
LABELV $478
line 1010
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $480
ADDRLP4 0
INDIRI4
ADDRLP4 300
INDIRI4
LTI4 $477
line 1019
;1019:				if (bs->flagcarrier != -1) {
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $483
line 1020
;1020:					ClientName(bs->flagcarrier, carriername, sizeof(carriername));
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
ARGI4
ADDRLP4 312
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1021
;1021:					for (i = 0; i < attackers; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $488
JUMPV
LABELV $485
line 1023
;1022:						//
;1023:						if (teammates[numteammates - i - 1] == bs->flagcarrier) {
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
NEI4 $489
line 1024
;1024:							continue;
ADDRGP4 $486
JUMPV
LABELV $489
line 1027
;1025:						}
;1026:						//
;1027:						ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
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
line 1028
;1028:						if (bs->flagcarrier == bs->client) {
ADDRLP4 356
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 356
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
ADDRLP4 356
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $493
line 1029
;1029:							BotAI_BotInitialChat(bs, "cmd_accompanyme", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $155
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1030
;1030:						}
ADDRGP4 $494
JUMPV
LABELV $493
line 1031
;1031:						else {
line 1032
;1032:							BotAI_BotInitialChat(bs, "cmd_accompany", name, carriername, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $156
ARGP4
ADDRLP4 260
ARGP4
ADDRLP4 312
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1033
;1033:						}
LABELV $494
line 1034
;1034:						BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1035
;1035:					}
LABELV $486
line 1021
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $488
ADDRLP4 0
INDIRI4
ADDRLP4 304
INDIRI4
LTI4 $485
line 1036
;1036:				}
ADDRGP4 $451
JUMPV
LABELV $483
line 1037
;1037:				else {
line 1038
;1038:					for (i = 0; i < attackers; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $499
JUMPV
LABELV $496
line 1040
;1039:						//
;1040:						if (teammates[numteammates - i - 1] == bs->flagcarrier) {
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
NEI4 $500
line 1041
;1041:							continue;
ADDRGP4 $497
JUMPV
LABELV $500
line 1044
;1042:						}
;1043:						//
;1044:						ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
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
line 1045
;1045:						BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $146
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1046
;1046:						BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1047
;1047:					}
LABELV $497
line 1038
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $499
ADDRLP4 0
INDIRI4
ADDRLP4 304
INDIRI4
LTI4 $496
line 1048
;1048:				}
line 1050
;1049:				//
;1050:				break;
line 1053
;1051:			}
;1052:		}
;1053:	}
ADDRGP4 $451
JUMPV
LABELV $450
line 1054
;1054:	else { //agressive
line 1056
;1055:		//different orders based on the number of team mates
;1056:		switch(numteammates) {
ADDRLP4 296
INDIRI4
CNSTI4 1
EQI4 $506
ADDRLP4 296
INDIRI4
CNSTI4 2
EQI4 $508
ADDRLP4 296
INDIRI4
CNSTI4 3
EQI4 $512
ADDRGP4 $505
JUMPV
line 1057
;1057:			case 1: break;
LABELV $508
line 1059
;1058:			case 2:
;1059:			{
line 1061
;1060:				//tell the one not carrying the flag to defend the base
;1061:				if (teammates[0] == bs->flagcarrier) other = teammates[1];
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
NEI4 $509
ADDRLP4 308
ADDRLP4 4+4
INDIRI4
ASGNI4
ADDRGP4 $510
JUMPV
LABELV $509
line 1062
;1062:				else other = teammates[0];
ADDRLP4 308
ADDRLP4 4
INDIRI4
ASGNI4
LABELV $510
line 1063
;1063:				ClientName(other, name, sizeof(name));
ADDRLP4 308
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1064
;1064:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1065
;1065:				BotSayTeamOrder(bs, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1066
;1066:				break;
ADDRGP4 $506
JUMPV
LABELV $512
line 1069
;1067:			}
;1068:			case 3:
;1069:			{
line 1071
;1070:				//tell the one closest to the base not carrying the flag to defend the base
;1071:				if (teammates[0] != bs->flagcarrier) other = teammates[0];
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
EQI4 $513
ADDRLP4 308
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $514
JUMPV
LABELV $513
line 1072
;1072:				else other = teammates[1];
ADDRLP4 308
ADDRLP4 4+4
INDIRI4
ASGNI4
LABELV $514
line 1073
;1073:				ClientName(other, name, sizeof(name));
ADDRLP4 308
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1074
;1074:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1075
;1075:				BotSayTeamOrder(bs, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1077
;1076:				//tell the one furthest from the base not carrying the flag to accompany the flag carrier
;1077:				if (teammates[2] != bs->flagcarrier) other = teammates[2];
ADDRLP4 4+8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
EQI4 $516
ADDRLP4 308
ADDRLP4 4+8
INDIRI4
ASGNI4
ADDRGP4 $517
JUMPV
LABELV $516
line 1078
;1078:				else other = teammates[1];
ADDRLP4 308
ADDRLP4 4+4
INDIRI4
ASGNI4
LABELV $517
line 1079
;1079:				ClientName(other, name, sizeof(name));
ADDRLP4 308
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1080
;1080:				ClientName(bs->flagcarrier, carriername, sizeof(carriername));
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
ARGI4
ADDRLP4 312
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1081
;1081:				if (bs->flagcarrier == bs->client) {
ADDRLP4 356
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 356
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
ADDRLP4 356
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $521
line 1082
;1082:					BotAI_BotInitialChat(bs, "cmd_accompanyme", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $155
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1083
;1083:				}
ADDRGP4 $522
JUMPV
LABELV $521
line 1084
;1084:				else {
line 1085
;1085:					BotAI_BotInitialChat(bs, "cmd_accompany", name, carriername, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $156
ARGP4
ADDRLP4 260
ARGP4
ADDRLP4 312
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1086
;1086:				}
LABELV $522
line 1087
;1087:				BotSayTeamOrder(bs, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1088
;1088:				break;
ADDRGP4 $506
JUMPV
LABELV $505
line 1091
;1089:			}
;1090:			default:
;1091:			{
line 1093
;1092:				//20% will defend the base
;1093:				defenders = (int) (float) numteammates * 0.2 + 0.5;
ADDRLP4 300
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1045220557
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 1094
;1094:				if (defenders > 2) defenders = 2;
ADDRLP4 300
INDIRI4
CNSTI4 2
LEI4 $523
ADDRLP4 300
CNSTI4 2
ASGNI4
LABELV $523
line 1096
;1095:				//80% accompanies the flag carrier
;1096:				attackers = (int) (float) numteammates * 0.8 + 0.5;
ADDRLP4 304
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1061997773
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 1097
;1097:				if (attackers > 8) attackers = 8;
ADDRLP4 304
INDIRI4
CNSTI4 8
LEI4 $525
ADDRLP4 304
CNSTI4 8
ASGNI4
LABELV $525
line 1098
;1098:				for (i = 0; i < defenders; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $530
JUMPV
LABELV $527
line 1100
;1099:					//
;1100:					if (teammates[i] == bs->flagcarrier) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
NEI4 $531
line 1101
;1101:						continue;
ADDRGP4 $528
JUMPV
LABELV $531
line 1103
;1102:					}
;1103:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
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
line 1104
;1104:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1105
;1105:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1106
;1106:				}
LABELV $528
line 1098
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $530
ADDRLP4 0
INDIRI4
ADDRLP4 300
INDIRI4
LTI4 $527
line 1107
;1107:				ClientName(bs->flagcarrier, carriername, sizeof(carriername));
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
ARGI4
ADDRLP4 312
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1108
;1108:				for (i = 0; i < attackers; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $536
JUMPV
LABELV $533
line 1110
;1109:					//
;1110:					if (teammates[numteammates - i - 1] == bs->flagcarrier) {
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
NEI4 $537
line 1111
;1111:						continue;
ADDRGP4 $534
JUMPV
LABELV $537
line 1114
;1112:					}
;1113:					//
;1114:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
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
line 1115
;1115:					if (bs->flagcarrier == bs->client) {
ADDRLP4 356
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 356
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
ADDRLP4 356
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $541
line 1116
;1116:						BotAI_BotInitialChat(bs, "cmd_accompanyme", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $155
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1117
;1117:					}
ADDRGP4 $542
JUMPV
LABELV $541
line 1118
;1118:					else {
line 1119
;1119:						BotAI_BotInitialChat(bs, "cmd_accompany", name, carriername, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $156
ARGP4
ADDRLP4 260
ARGP4
ADDRLP4 312
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1120
;1120:					}
LABELV $542
line 1121
;1121:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1122
;1122:				}
LABELV $534
line 1108
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $536
ADDRLP4 0
INDIRI4
ADDRLP4 304
INDIRI4
LTI4 $533
line 1124
;1123:				//
;1124:				break;
LABELV $506
line 1127
;1125:			}
;1126:		}
;1127:	}
LABELV $451
line 1128
;1128:}
LABELV $449
endproc Bot1FCTFOrders_TeamHasFlag 360 20
export Bot1FCTFOrders_EnemyHasFlag
proc Bot1FCTFOrders_EnemyHasFlag 316 16
line 1137
;1129:
;1130:/*
;1131:==================
;1132:Bot1FCTFOrders_EnemyHasFlag
;1133:
;1134:  X% defend the base, Y% towards neutral flag
;1135:==================
;1136:*/
;1137:void Bot1FCTFOrders_EnemyHasFlag(bot_state_t *bs) {
line 1143
;1138:	int numteammates, defenders, attackers, i;
;1139:	int teammates[MAX_CLIENTS];
;1140:	char name[MAX_NETNAME];
;1141:
;1142:	//sort team mates by travel time to base
;1143:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 308
ADDRGP4 BotSortTeamMatesByBaseTravelTime
CALLI4
ASGNI4
ADDRLP4 296
ADDRLP4 308
INDIRI4
ASGNI4
line 1145
;1144:	//sort team mates by CTF preference
;1145:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 296
INDIRI4
ARGI4
ADDRGP4 BotSortTeamMatesByTaskPreference
CALLI4
pop
line 1147
;1146:	//passive strategy
;1147:	if (!(bs->ctfstrategy & CTFS_AGRESSIVE)) {
ADDRFP4 0
INDIRP4
CNSTI4 6980
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $545
line 1149
;1148:		//different orders based on the number of team mates
;1149:		switch(numteammates) {
ADDRLP4 296
INDIRI4
CNSTI4 1
EQI4 $546
ADDRLP4 296
INDIRI4
CNSTI4 2
EQI4 $550
ADDRLP4 296
INDIRI4
CNSTI4 3
EQI4 $553
ADDRGP4 $547
JUMPV
line 1150
;1150:			case 1: break;
LABELV $550
line 1152
;1151:			case 2:
;1152:			{
line 1154
;1153:				//both defend the base
;1154:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1155
;1155:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1156
;1156:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1158
;1157:				//
;1158:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1159
;1159:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1160
;1160:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1161
;1161:				break;
ADDRGP4 $546
JUMPV
LABELV $553
line 1164
;1162:			}
;1163:			case 3:
;1164:			{
line 1166
;1165:				//the one closest to the base will defend the base
;1166:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1167
;1167:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1168
;1168:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1170
;1169:				//the second one closest to the base will defend the base
;1170:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1171
;1171:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1172
;1172:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1174
;1173:				//the other will also defend the base
;1174:				ClientName(teammates[2], name, sizeof(name));
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1175
;1175:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1176
;1176:				BotSayTeamOrder(bs, teammates[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1177
;1177:				break;
ADDRGP4 $546
JUMPV
LABELV $547
line 1180
;1178:			}
;1179:			default:
;1180:			{
line 1182
;1181:				//80% will defend the base
;1182:				defenders = (int) (float) numteammates * 0.8 + 0.5;
ADDRLP4 300
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1061997773
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 1183
;1183:				if (defenders > 8) defenders = 8;
ADDRLP4 300
INDIRI4
CNSTI4 8
LEI4 $558
ADDRLP4 300
CNSTI4 8
ASGNI4
LABELV $558
line 1185
;1184:				//10% will try to return the flag
;1185:				attackers = (int) (float) numteammates * 0.1 + 0.5;
ADDRLP4 304
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1036831949
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 1186
;1186:				if (attackers > 1) attackers = 1;
ADDRLP4 304
INDIRI4
CNSTI4 1
LEI4 $560
ADDRLP4 304
CNSTI4 1
ASGNI4
LABELV $560
line 1187
;1187:				for (i = 0; i < defenders; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $565
JUMPV
LABELV $562
line 1189
;1188:					//
;1189:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
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
line 1190
;1190:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1191
;1191:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1192
;1192:				}
LABELV $563
line 1187
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $565
ADDRLP4 0
INDIRI4
ADDRLP4 300
INDIRI4
LTI4 $562
line 1193
;1193:				for (i = 0; i < attackers; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $569
JUMPV
LABELV $566
line 1195
;1194:					//
;1195:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
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
line 1196
;1196:					BotAI_BotInitialChat(bs, "cmd_returnflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $571
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1197
;1197:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1198
;1198:				}
LABELV $567
line 1193
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $569
ADDRLP4 0
INDIRI4
ADDRLP4 304
INDIRI4
LTI4 $566
line 1200
;1199:				//
;1200:				break;
line 1203
;1201:			}
;1202:		}
;1203:	}
ADDRGP4 $546
JUMPV
LABELV $545
line 1204
;1204:	else { //agressive
line 1206
;1205:		//different orders based on the number of team mates
;1206:		switch(numteammates) {
ADDRLP4 296
INDIRI4
CNSTI4 1
EQI4 $574
ADDRLP4 296
INDIRI4
CNSTI4 2
EQI4 $576
ADDRLP4 296
INDIRI4
CNSTI4 3
EQI4 $579
ADDRGP4 $573
JUMPV
line 1207
;1207:			case 1: break;
LABELV $576
line 1209
;1208:			case 2:
;1209:			{
line 1211
;1210:				//the one closest to the base will defend the base
;1211:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1212
;1212:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1213
;1213:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1215
;1214:				//the other will get the flag
;1215:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1216
;1216:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1217
;1217:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1218
;1218:				break;
ADDRGP4 $574
JUMPV
LABELV $579
line 1221
;1219:			}
;1220:			case 3:
;1221:			{
line 1223
;1222:				//the one closest to the base will defend the base
;1223:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1224
;1224:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1225
;1225:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1227
;1226:				//the others should go for the enemy flag
;1227:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1228
;1228:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1229
;1229:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1231
;1230:				//
;1231:				ClientName(teammates[2], name, sizeof(name));
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1232
;1232:				BotAI_BotInitialChat(bs, "cmd_returnflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $571
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1233
;1233:				BotSayTeamOrder(bs, teammates[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1234
;1234:				break;
ADDRGP4 $574
JUMPV
LABELV $573
line 1237
;1235:			}
;1236:			default:
;1237:			{
line 1239
;1238:				//70% defend the base
;1239:				defenders = (int) (float) numteammates * 0.7 + 0.5;
ADDRLP4 300
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1060320051
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 1240
;1240:				if (defenders > 7) defenders = 7;
ADDRLP4 300
INDIRI4
CNSTI4 7
LEI4 $584
ADDRLP4 300
CNSTI4 7
ASGNI4
LABELV $584
line 1242
;1241:				//20% try to return the flag
;1242:				attackers = (int) (float) numteammates * 0.2 + 0.5;
ADDRLP4 304
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1045220557
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 1243
;1243:				if (attackers > 2) attackers = 2;
ADDRLP4 304
INDIRI4
CNSTI4 2
LEI4 $586
ADDRLP4 304
CNSTI4 2
ASGNI4
LABELV $586
line 1244
;1244:				for (i = 0; i < defenders; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $591
JUMPV
LABELV $588
line 1246
;1245:					//
;1246:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
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
line 1247
;1247:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1248
;1248:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1249
;1249:				}
LABELV $589
line 1244
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $591
ADDRLP4 0
INDIRI4
ADDRLP4 300
INDIRI4
LTI4 $588
line 1250
;1250:				for (i = 0; i < attackers; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $595
JUMPV
LABELV $592
line 1252
;1251:					//
;1252:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
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
line 1253
;1253:					BotAI_BotInitialChat(bs, "cmd_returnflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $571
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1254
;1254:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1255
;1255:				}
LABELV $593
line 1250
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $595
ADDRLP4 0
INDIRI4
ADDRLP4 304
INDIRI4
LTI4 $592
line 1257
;1256:				//
;1257:				break;
LABELV $574
line 1260
;1258:			}
;1259:		}
;1260:	}
LABELV $546
line 1261
;1261:}
LABELV $544
endproc Bot1FCTFOrders_EnemyHasFlag 316 16
export Bot1FCTFOrders_EnemyDroppedFlag
proc Bot1FCTFOrders_EnemyDroppedFlag 316 16
line 1270
;1262:
;1263:/*
;1264:==================
;1265:Bot1FCTFOrders_EnemyDroppedFlag
;1266:
;1267:  X% defend the base, Y% get the flag
;1268:==================
;1269:*/
;1270:void Bot1FCTFOrders_EnemyDroppedFlag(bot_state_t *bs) {
line 1276
;1271:	int numteammates, defenders, attackers, i;
;1272:	int teammates[MAX_CLIENTS];
;1273:	char name[MAX_NETNAME];
;1274:
;1275:	//sort team mates by travel time to base
;1276:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 308
ADDRGP4 BotSortTeamMatesByBaseTravelTime
CALLI4
ASGNI4
ADDRLP4 296
ADDRLP4 308
INDIRI4
ASGNI4
line 1278
;1277:	//sort team mates by CTF preference
;1278:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 296
INDIRI4
ARGI4
ADDRGP4 BotSortTeamMatesByTaskPreference
CALLI4
pop
line 1280
;1279:	//passive strategy
;1280:	if (!(bs->ctfstrategy & CTFS_AGRESSIVE)) {
ADDRFP4 0
INDIRP4
CNSTI4 6980
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $599
line 1282
;1281:		//different orders based on the number of team mates
;1282:		switch(numteammates) {
ADDRLP4 296
INDIRI4
CNSTI4 1
EQI4 $600
ADDRLP4 296
INDIRI4
CNSTI4 2
EQI4 $604
ADDRLP4 296
INDIRI4
CNSTI4 3
EQI4 $607
ADDRGP4 $601
JUMPV
line 1283
;1283:			case 1: break;
LABELV $604
line 1285
;1284:			case 2:
;1285:			{
line 1287
;1286:				//the one closest to the base will defend the base
;1287:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1288
;1288:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1289
;1289:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1291
;1290:				//the other will get the flag
;1291:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1292
;1292:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $146
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1293
;1293:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1294
;1294:				break;
ADDRGP4 $600
JUMPV
LABELV $607
line 1297
;1295:			}
;1296:			case 3:
;1297:			{
line 1299
;1298:				//the one closest to the base will defend the base
;1299:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1300
;1300:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1301
;1301:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1303
;1302:				//the second one closest to the base will defend the base
;1303:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1304
;1304:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1305
;1305:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1307
;1306:				//the other will get the flag
;1307:				ClientName(teammates[2], name, sizeof(name));
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1308
;1308:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $146
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1309
;1309:				BotSayTeamOrder(bs, teammates[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1310
;1310:				break;
ADDRGP4 $600
JUMPV
LABELV $601
line 1313
;1311:			}
;1312:			default:
;1313:			{
line 1315
;1314:				//50% defend the base
;1315:				defenders = (int) (float) numteammates * 0.5 + 0.5;
ADDRLP4 300
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1056964608
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 1316
;1316:				if (defenders > 5) defenders = 5;
ADDRLP4 300
INDIRI4
CNSTI4 5
LEI4 $612
ADDRLP4 300
CNSTI4 5
ASGNI4
LABELV $612
line 1318
;1317:				//40% get the flag
;1318:				attackers = (int) (float) numteammates * 0.4 + 0.5;
ADDRLP4 304
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1053609165
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 1319
;1319:				if (attackers > 4) attackers = 4;
ADDRLP4 304
INDIRI4
CNSTI4 4
LEI4 $614
ADDRLP4 304
CNSTI4 4
ASGNI4
LABELV $614
line 1320
;1320:				for (i = 0; i < defenders; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $619
JUMPV
LABELV $616
line 1322
;1321:					//
;1322:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
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
line 1323
;1323:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1324
;1324:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1325
;1325:				}
LABELV $617
line 1320
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $619
ADDRLP4 0
INDIRI4
ADDRLP4 300
INDIRI4
LTI4 $616
line 1326
;1326:				for (i = 0; i < attackers; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $623
JUMPV
LABELV $620
line 1328
;1327:					//
;1328:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
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
line 1329
;1329:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $146
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1330
;1330:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1331
;1331:				}
LABELV $621
line 1326
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $623
ADDRLP4 0
INDIRI4
ADDRLP4 304
INDIRI4
LTI4 $620
line 1333
;1332:				//
;1333:				break;
line 1336
;1334:			}
;1335:		}
;1336:	}
ADDRGP4 $600
JUMPV
LABELV $599
line 1337
;1337:	else { //agressive
line 1339
;1338:		//different orders based on the number of team mates
;1339:		switch(numteammates) {
ADDRLP4 296
INDIRI4
CNSTI4 1
EQI4 $627
ADDRLP4 296
INDIRI4
CNSTI4 2
EQI4 $629
ADDRLP4 296
INDIRI4
CNSTI4 3
EQI4 $632
ADDRGP4 $626
JUMPV
line 1340
;1340:			case 1: break;
LABELV $629
line 1342
;1341:			case 2:
;1342:			{
line 1344
;1343:				//the one closest to the base will defend the base
;1344:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1345
;1345:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1346
;1346:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1348
;1347:				//the other will get the flag
;1348:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1349
;1349:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $146
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1350
;1350:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1351
;1351:				break;
ADDRGP4 $627
JUMPV
LABELV $632
line 1354
;1352:			}
;1353:			case 3:
;1354:			{
line 1356
;1355:				//the one closest to the base will defend the base
;1356:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1357
;1357:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1358
;1358:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1360
;1359:				//the others should go for the enemy flag
;1360:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1361
;1361:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $146
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1362
;1362:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1364
;1363:				//
;1364:				ClientName(teammates[2], name, sizeof(name));
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1365
;1365:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $146
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1366
;1366:				BotSayTeamOrder(bs, teammates[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1367
;1367:				break;
ADDRGP4 $627
JUMPV
LABELV $626
line 1370
;1368:			}
;1369:			default:
;1370:			{
line 1372
;1371:				//30% defend the base
;1372:				defenders = (int) (float) numteammates * 0.3 + 0.5;
ADDRLP4 300
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1050253722
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 1373
;1373:				if (defenders > 3) defenders = 3;
ADDRLP4 300
INDIRI4
CNSTI4 3
LEI4 $637
ADDRLP4 300
CNSTI4 3
ASGNI4
LABELV $637
line 1375
;1374:				//60% get the flag
;1375:				attackers = (int) (float) numteammates * 0.6 + 0.5;
ADDRLP4 304
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1058642330
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 1376
;1376:				if (attackers > 6) attackers = 6;
ADDRLP4 304
INDIRI4
CNSTI4 6
LEI4 $639
ADDRLP4 304
CNSTI4 6
ASGNI4
LABELV $639
line 1377
;1377:				for (i = 0; i < defenders; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $644
JUMPV
LABELV $641
line 1379
;1378:					//
;1379:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
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
line 1380
;1380:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1381
;1381:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1382
;1382:				}
LABELV $642
line 1377
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $644
ADDRLP4 0
INDIRI4
ADDRLP4 300
INDIRI4
LTI4 $641
line 1383
;1383:				for (i = 0; i < attackers; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $648
JUMPV
LABELV $645
line 1385
;1384:					//
;1385:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
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
line 1386
;1386:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $146
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1387
;1387:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1388
;1388:				}
LABELV $646
line 1383
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $648
ADDRLP4 0
INDIRI4
ADDRLP4 304
INDIRI4
LTI4 $645
line 1390
;1389:				//
;1390:				break;
LABELV $627
line 1393
;1391:			}
;1392:		}
;1393:	}
LABELV $600
line 1394
;1394:}
LABELV $598
endproc Bot1FCTFOrders_EnemyDroppedFlag 316 16
export Bot1FCTFOrders
proc Bot1FCTFOrders 8 4
line 1401
;1395:
;1396:/*
;1397:==================
;1398:Bot1FCTFOrders
;1399:==================
;1400:*/
;1401:void Bot1FCTFOrders(bot_state_t *bs) {
line 1402
;1402:	switch(bs->neutralflagstatus) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $652
ADDRLP4 0
INDIRI4
CNSTI4 3
GTI4 $652
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $659
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $659
address $655
address $656
address $657
address $658
code
LABELV $655
line 1403
;1403:		case 0: Bot1FCTFOrders_FlagAtCenter(bs); break;
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Bot1FCTFOrders_FlagAtCenter
CALLV
pop
ADDRGP4 $653
JUMPV
LABELV $656
line 1404
;1404:		case 1: Bot1FCTFOrders_TeamHasFlag(bs); break;
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Bot1FCTFOrders_TeamHasFlag
CALLV
pop
ADDRGP4 $653
JUMPV
LABELV $657
line 1405
;1405:		case 2: Bot1FCTFOrders_EnemyHasFlag(bs); break;
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Bot1FCTFOrders_EnemyHasFlag
CALLV
pop
ADDRGP4 $653
JUMPV
LABELV $658
line 1406
;1406:		case 3: Bot1FCTFOrders_EnemyDroppedFlag(bs); break;
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Bot1FCTFOrders_EnemyDroppedFlag
CALLV
pop
LABELV $652
LABELV $653
line 1408
;1407:	}
;1408:}
LABELV $651
endproc Bot1FCTFOrders 8 4
export BotObeliskOrders
proc BotObeliskOrders 316 16
line 1417
;1409:
;1410:/*
;1411:==================
;1412:BotObeliskOrders
;1413:
;1414:  X% in defence Y% in offence
;1415:==================
;1416:*/
;1417:void BotObeliskOrders(bot_state_t *bs) {
line 1423
;1418:	int numteammates, defenders, attackers, i;
;1419:	int teammates[MAX_CLIENTS];
;1420:	char name[MAX_NETNAME];
;1421:
;1422:	//sort team mates by travel time to base
;1423:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 308
ADDRGP4 BotSortTeamMatesByBaseTravelTime
CALLI4
ASGNI4
ADDRLP4 296
ADDRLP4 308
INDIRI4
ASGNI4
line 1425
;1424:	//sort team mates by CTF preference
;1425:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 296
INDIRI4
ARGI4
ADDRGP4 BotSortTeamMatesByTaskPreference
CALLI4
pop
line 1427
;1426:	//passive strategy
;1427:	if (!(bs->ctfstrategy & CTFS_AGRESSIVE)) {
ADDRFP4 0
INDIRP4
CNSTI4 6980
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $661
line 1429
;1428:		//different orders based on the number of team mates
;1429:		switch(numteammates) {
ADDRLP4 296
INDIRI4
CNSTI4 1
EQI4 $662
ADDRLP4 296
INDIRI4
CNSTI4 2
EQI4 $666
ADDRLP4 296
INDIRI4
CNSTI4 3
EQI4 $669
ADDRGP4 $663
JUMPV
line 1430
;1430:			case 1: break;
LABELV $666
line 1432
;1431:			case 2:
;1432:			{
line 1434
;1433:				//the one closest to the base will defend the base
;1434:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1435
;1435:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1436
;1436:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1438
;1437:				//the other will attack the enemy base
;1438:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1439
;1439:				BotAI_BotInitialChat(bs, "cmd_attackenemybase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $459
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1440
;1440:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1441
;1441:				break;
ADDRGP4 $662
JUMPV
LABELV $669
line 1444
;1442:			}
;1443:			case 3:
;1444:			{
line 1446
;1445:				//the one closest to the base will defend the base
;1446:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1447
;1447:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1448
;1448:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1450
;1449:				//the one second closest to the base also defends the base
;1450:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1451
;1451:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1452
;1452:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1454
;1453:				//the other one attacks the enemy base
;1454:				ClientName(teammates[2], name, sizeof(name));
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1455
;1455:				BotAI_BotInitialChat(bs, "cmd_attackenemybase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $459
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1456
;1456:				BotSayTeamOrder(bs, teammates[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1457
;1457:				break;
ADDRGP4 $662
JUMPV
LABELV $663
line 1460
;1458:			}
;1459:			default:
;1460:			{
line 1462
;1461:				//50% defend the base
;1462:				defenders = (int) (float) numteammates * 0.5 + 0.5;
ADDRLP4 300
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1056964608
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 1463
;1463:				if (defenders > 5) defenders = 5;
ADDRLP4 300
INDIRI4
CNSTI4 5
LEI4 $674
ADDRLP4 300
CNSTI4 5
ASGNI4
LABELV $674
line 1465
;1464:				//40% attack the enemy base
;1465:				attackers = (int) (float) numteammates * 0.4 + 0.5;
ADDRLP4 304
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1053609165
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 1466
;1466:				if (attackers > 4) attackers = 4;
ADDRLP4 304
INDIRI4
CNSTI4 4
LEI4 $676
ADDRLP4 304
CNSTI4 4
ASGNI4
LABELV $676
line 1467
;1467:				for (i = 0; i < defenders; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $681
JUMPV
LABELV $678
line 1469
;1468:					//
;1469:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
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
line 1470
;1470:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1471
;1471:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1472
;1472:				}
LABELV $679
line 1467
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $681
ADDRLP4 0
INDIRI4
ADDRLP4 300
INDIRI4
LTI4 $678
line 1473
;1473:				for (i = 0; i < attackers; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $685
JUMPV
LABELV $682
line 1475
;1474:					//
;1475:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
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
line 1476
;1476:					BotAI_BotInitialChat(bs, "cmd_attackenemybase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $459
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1477
;1477:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1478
;1478:				}
LABELV $683
line 1473
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $685
ADDRLP4 0
INDIRI4
ADDRLP4 304
INDIRI4
LTI4 $682
line 1480
;1479:				//
;1480:				break;
line 1483
;1481:			}
;1482:		}
;1483:	}
ADDRGP4 $662
JUMPV
LABELV $661
line 1484
;1484:	else {
line 1486
;1485:		//different orders based on the number of team mates
;1486:		switch(numteammates) {
ADDRLP4 296
INDIRI4
CNSTI4 1
EQI4 $689
ADDRLP4 296
INDIRI4
CNSTI4 2
EQI4 $691
ADDRLP4 296
INDIRI4
CNSTI4 3
EQI4 $694
ADDRGP4 $688
JUMPV
line 1487
;1487:			case 1: break;
LABELV $691
line 1489
;1488:			case 2:
;1489:			{
line 1491
;1490:				//the one closest to the base will defend the base
;1491:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1492
;1492:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1493
;1493:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1495
;1494:				//the other will attack the enemy base
;1495:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1496
;1496:				BotAI_BotInitialChat(bs, "cmd_attackenemybase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $459
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1497
;1497:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1498
;1498:				break;
ADDRGP4 $689
JUMPV
LABELV $694
line 1501
;1499:			}
;1500:			case 3:
;1501:			{
line 1503
;1502:				//the one closest to the base will defend the base
;1503:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1504
;1504:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1505
;1505:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1507
;1506:				//the others attack the enemy base
;1507:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1508
;1508:				BotAI_BotInitialChat(bs, "cmd_attackenemybase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $459
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1509
;1509:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1511
;1510:				//
;1511:				ClientName(teammates[2], name, sizeof(name));
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1512
;1512:				BotAI_BotInitialChat(bs, "cmd_attackenemybase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $459
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1513
;1513:				BotSayTeamOrder(bs, teammates[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1514
;1514:				break;
ADDRGP4 $689
JUMPV
LABELV $688
line 1517
;1515:			}
;1516:			default:
;1517:			{
line 1519
;1518:				//30% defend the base
;1519:				defenders = (int) (float) numteammates * 0.3 + 0.5;
ADDRLP4 300
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1050253722
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 1520
;1520:				if (defenders > 3) defenders = 3;
ADDRLP4 300
INDIRI4
CNSTI4 3
LEI4 $699
ADDRLP4 300
CNSTI4 3
ASGNI4
LABELV $699
line 1522
;1521:				//70% attack the enemy base
;1522:				attackers = (int) (float) numteammates * 0.7 + 0.5;
ADDRLP4 304
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1060320051
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 1523
;1523:				if (attackers > 7) attackers = 7;
ADDRLP4 304
INDIRI4
CNSTI4 7
LEI4 $701
ADDRLP4 304
CNSTI4 7
ASGNI4
LABELV $701
line 1524
;1524:				for (i = 0; i < defenders; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $706
JUMPV
LABELV $703
line 1526
;1525:					//
;1526:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
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
line 1527
;1527:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1528
;1528:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1529
;1529:				}
LABELV $704
line 1524
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $706
ADDRLP4 0
INDIRI4
ADDRLP4 300
INDIRI4
LTI4 $703
line 1530
;1530:				for (i = 0; i < attackers; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $710
JUMPV
LABELV $707
line 1532
;1531:					//
;1532:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
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
line 1533
;1533:					BotAI_BotInitialChat(bs, "cmd_attackenemybase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $459
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1534
;1534:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1535
;1535:				}
LABELV $708
line 1530
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $710
ADDRLP4 0
INDIRI4
ADDRLP4 304
INDIRI4
LTI4 $707
line 1537
;1536:				//
;1537:				break;
LABELV $689
line 1540
;1538:			}
;1539:		}
;1540:	}
LABELV $662
line 1541
;1541:}
LABELV $660
endproc BotObeliskOrders 316 16
export BotHarvesterOrders
proc BotHarvesterOrders 316 16
line 1550
;1542:
;1543:/*
;1544:==================
;1545:BotHarvesterOrders
;1546:
;1547:  X% defend the base, Y% harvest
;1548:==================
;1549:*/
;1550:void BotHarvesterOrders(bot_state_t *bs) {
line 1555
;1551:	int numteammates, defenders, attackers, i;
;1552:	int teammates[MAX_CLIENTS];
;1553:	char name[MAX_NETNAME];
;1554:
;1555:	memset( teammates, 0, sizeof( teammates ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 256
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1557
;1556:	//sort team mates by travel time to base
;1557:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 308
ADDRGP4 BotSortTeamMatesByBaseTravelTime
CALLI4
ASGNI4
ADDRLP4 296
ADDRLP4 308
INDIRI4
ASGNI4
line 1559
;1558:	//sort team mates by CTF preference
;1559:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 296
INDIRI4
ARGI4
ADDRGP4 BotSortTeamMatesByTaskPreference
CALLI4
pop
line 1561
;1560:	//passive strategy
;1561:	if (!(bs->ctfstrategy & CTFS_AGRESSIVE)) {
ADDRFP4 0
INDIRP4
CNSTI4 6980
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $714
line 1563
;1562:		//different orders based on the number of team mates
;1563:		switch(numteammates) {
ADDRLP4 296
INDIRI4
CNSTI4 1
EQI4 $715
ADDRLP4 296
INDIRI4
CNSTI4 2
EQI4 $719
ADDRLP4 296
INDIRI4
CNSTI4 3
EQI4 $723
ADDRGP4 $716
JUMPV
line 1564
;1564:			case 1: break;
LABELV $719
line 1566
;1565:			case 2:
;1566:			{
line 1568
;1567:				//the one closest to the base will defend the base
;1568:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1569
;1569:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1570
;1570:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1572
;1571:				//the other will harvest
;1572:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1573
;1573:				BotAI_BotInitialChat(bs, "cmd_harvest", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $721
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1574
;1574:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1575
;1575:				break;
ADDRGP4 $715
JUMPV
LABELV $723
line 1578
;1576:			}
;1577:			case 3:
;1578:			{
line 1580
;1579:				//the one closest to the base will defend the base
;1580:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1581
;1581:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1582
;1582:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1584
;1583:				//the one second closest to the base also defends the base
;1584:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1585
;1585:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1586
;1586:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1588
;1587:				//the other one goes harvesting
;1588:				ClientName(teammates[2], name, sizeof(name));
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1589
;1589:				BotAI_BotInitialChat(bs, "cmd_harvest", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $721
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1590
;1590:				BotSayTeamOrder(bs, teammates[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1591
;1591:				break;
ADDRGP4 $715
JUMPV
LABELV $716
line 1594
;1592:			}
;1593:			default:
;1594:			{
line 1596
;1595:				//50% defend the base
;1596:				defenders = (int) (float) numteammates * 0.5 + 0.5;
ADDRLP4 300
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1056964608
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 1597
;1597:				if (defenders > 5) defenders = 5;
ADDRLP4 300
INDIRI4
CNSTI4 5
LEI4 $728
ADDRLP4 300
CNSTI4 5
ASGNI4
LABELV $728
line 1599
;1598:				//40% goes harvesting
;1599:				attackers = (int) (float) numteammates * 0.4 + 0.5;
ADDRLP4 304
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1053609165
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 1600
;1600:				if (attackers > 4) attackers = 4;
ADDRLP4 304
INDIRI4
CNSTI4 4
LEI4 $730
ADDRLP4 304
CNSTI4 4
ASGNI4
LABELV $730
line 1601
;1601:				for (i = 0; i < defenders; i++) {
ADDRLP4 256
CNSTI4 0
ASGNI4
ADDRGP4 $735
JUMPV
LABELV $732
line 1603
;1602:					//
;1603:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
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
line 1604
;1604:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1605
;1605:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1606
;1606:				}
LABELV $733
line 1601
ADDRLP4 256
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $735
ADDRLP4 256
INDIRI4
ADDRLP4 300
INDIRI4
LTI4 $732
line 1607
;1607:				for (i = 0; i < attackers; i++) {
ADDRLP4 256
CNSTI4 0
ASGNI4
ADDRGP4 $739
JUMPV
LABELV $736
line 1609
;1608:					//
;1609:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 296
INDIRI4
ADDRLP4 256
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
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
line 1610
;1610:					BotAI_BotInitialChat(bs, "cmd_harvest", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $721
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1611
;1611:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 256
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1612
;1612:				}
LABELV $737
line 1607
ADDRLP4 256
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $739
ADDRLP4 256
INDIRI4
ADDRLP4 304
INDIRI4
LTI4 $736
line 1614
;1613:				//
;1614:				break;
line 1617
;1615:			}
;1616:		}
;1617:	}
ADDRGP4 $715
JUMPV
LABELV $714
line 1618
;1618:	else {
line 1620
;1619:		//different orders based on the number of team mates
;1620:		switch(numteammates) {
ADDRLP4 296
INDIRI4
CNSTI4 1
EQI4 $743
ADDRLP4 296
INDIRI4
CNSTI4 2
EQI4 $745
ADDRLP4 296
INDIRI4
CNSTI4 3
EQI4 $748
ADDRGP4 $742
JUMPV
line 1621
;1621:			case 1: break;
LABELV $745
line 1623
;1622:			case 2:
;1623:			{
line 1625
;1624:				//the one closest to the base will defend the base
;1625:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1626
;1626:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1627
;1627:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1629
;1628:				//the other will harvest
;1629:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1630
;1630:				BotAI_BotInitialChat(bs, "cmd_harvest", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $721
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1631
;1631:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1632
;1632:				break;
ADDRGP4 $743
JUMPV
LABELV $748
line 1635
;1633:			}
;1634:			case 3:
;1635:			{
line 1637
;1636:				//the one closest to the base will defend the base
;1637:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1638
;1638:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1639
;1639:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1641
;1640:				//the others go harvesting
;1641:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1642
;1642:				BotAI_BotInitialChat(bs, "cmd_harvest", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $721
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1643
;1643:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1645
;1644:				//
;1645:				ClientName(teammates[2], name, sizeof(name));
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1646
;1646:				BotAI_BotInitialChat(bs, "cmd_harvest", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $721
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1647
;1647:				BotSayTeamOrder(bs, teammates[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1648
;1648:				break;
ADDRGP4 $743
JUMPV
LABELV $742
line 1651
;1649:			}
;1650:			default:
;1651:			{
line 1653
;1652:				//30% defend the base
;1653:				defenders = (int) (float) numteammates * 0.3 + 0.5;
ADDRLP4 300
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1050253722
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 1654
;1654:				if (defenders > 3) defenders = 3;
ADDRLP4 300
INDIRI4
CNSTI4 3
LEI4 $753
ADDRLP4 300
CNSTI4 3
ASGNI4
LABELV $753
line 1656
;1655:				//70% go harvesting
;1656:				attackers = (int) (float) numteammates * 0.7 + 0.5;
ADDRLP4 304
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1060320051
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 1657
;1657:				if (attackers > 7) attackers = 7;
ADDRLP4 304
INDIRI4
CNSTI4 7
LEI4 $755
ADDRLP4 304
CNSTI4 7
ASGNI4
LABELV $755
line 1658
;1658:				for (i = 0; i < defenders; i++) {
ADDRLP4 256
CNSTI4 0
ASGNI4
ADDRGP4 $760
JUMPV
LABELV $757
line 1660
;1659:					//
;1660:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
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
line 1661
;1661:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1662
;1662:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1663
;1663:				}
LABELV $758
line 1658
ADDRLP4 256
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $760
ADDRLP4 256
INDIRI4
ADDRLP4 300
INDIRI4
LTI4 $757
line 1664
;1664:				for (i = 0; i < attackers; i++) {
ADDRLP4 256
CNSTI4 0
ASGNI4
ADDRGP4 $764
JUMPV
LABELV $761
line 1666
;1665:					//
;1666:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 296
INDIRI4
ADDRLP4 256
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
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
line 1667
;1667:					BotAI_BotInitialChat(bs, "cmd_harvest", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $721
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1668
;1668:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 256
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1669
;1669:				}
LABELV $762
line 1664
ADDRLP4 256
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $764
ADDRLP4 256
INDIRI4
ADDRLP4 304
INDIRI4
LTI4 $761
line 1671
;1670:				//
;1671:				break;
LABELV $743
line 1674
;1672:			}
;1673:		}
;1674:	}
LABELV $715
line 1675
;1675:}
LABELV $713
endproc BotHarvesterOrders 316 16
export FindHumanTeamLeader
proc FindHumanTeamLeader 12 12
line 1683
;1676:
;1677:
;1678:/*
;1679:==================
;1680:FindHumanTeamLeader
;1681:==================
;1682:*/
;1683:int FindHumanTeamLeader(bot_state_t *bs) {
line 1686
;1684:	int i;
;1685:
;1686:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $768
line 1687
;1687:		if ( g_entities[i].inuse ) {
ADDRLP4 0
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities+520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $772
line 1689
;1688:			// if this player is not a bot
;1689:			if ( !(g_entities[i].r.svFlags & SVF_BOT) ) {
ADDRLP4 0
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities+208+216
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $775
line 1691
;1690:				// if this player is ok with being the leader
;1691:				if (!notleader[i]) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 notleader
ADDP4
INDIRI4
CNSTI4 0
NEI4 $779
line 1693
;1692:					// if this player is on the same team
;1693:					if ( BotSameTeam(bs, i) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $781
line 1694
;1694:						ClientName(i, bs->teamleader, sizeof(bs->teamleader));
ADDRLP4 0
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
line 1696
;1695:						// if not yet ordered to do anything
;1696:						if ( !BotSetLastOrderedTask(bs) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BotSetLastOrderedTask
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $783
line 1698
;1697:							// go on defense by default
;1698:						}
LABELV $783
line 1699
;1699:						return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $767
JUMPV
LABELV $781
line 1701
;1700:					}
;1701:				}
LABELV $779
line 1702
;1702:			}
LABELV $775
line 1703
;1703:		}
LABELV $772
line 1704
;1704:	}
LABELV $769
line 1686
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $768
line 1705
;1705:	return qfalse;
CNSTI4 0
RETI4
LABELV $767
endproc FindHumanTeamLeader 12 12
export BotTeamAI
proc BotTeamAI 68 12
line 1713
;1706:}
;1707:
;1708:/*
;1709:==================
;1710:BotTeamAI
;1711:==================
;1712:*/
;1713:void BotTeamAI(bot_state_t *bs) {
line 1718
;1714:	int numteammates;
;1715:	char netname[MAX_NETNAME];
;1716:
;1717:	//
;1718:	if ( !(GTx( g_gametype.integer, GTF_TEAMS )) )
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
NEI4 $786
line 1719
;1719:		return;
ADDRGP4 $785
JUMPV
LABELV $786
line 1721
;1720:	// make sure we've got a valid team leader
;1721:	if (!BotValidTeamLeader(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 BotValidTeamLeader
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $790
line 1723
;1722:		//
;1723:		if (!FindHumanTeamLeader(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 FindHumanTeamLeader
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $792
line 1725
;1724:			//
;1725:			if (!bs->askteamleader_time && !bs->becometeamleader_time) {
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 6936
ADDP4
INDIRF4
CNSTF4 0
NEF4 $794
ADDRLP4 48
INDIRP4
CNSTI4 6940
ADDP4
INDIRF4
CNSTF4 0
NEF4 $794
line 1726
;1726:				if (bs->entergame_time + 10 > FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6064
ADDP4
INDIRF4
CNSTF4 1092616192
ADDF4
ADDRGP4 floattime
INDIRF4
LEF4 $796
line 1727
;1727:					bs->askteamleader_time = FloatTime() + 5 + random() * 10;
ADDRLP4 52
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6936
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
ADDRLP4 52
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 966787392
MULF4
ADDF4
ASGNF4
line 1728
;1728:				}
ADDRGP4 $797
JUMPV
LABELV $796
line 1729
;1729:				else {
line 1730
;1730:					bs->becometeamleader_time = FloatTime() + 5 + random() * 10;
ADDRLP4 52
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6940
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
ADDRLP4 52
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 966787392
MULF4
ADDF4
ASGNF4
line 1731
;1731:				}
LABELV $797
line 1732
;1732:			}
LABELV $794
line 1733
;1733:			if (bs->askteamleader_time && bs->askteamleader_time < FloatTime()) {
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 6936
ADDP4
INDIRF4
CNSTF4 0
EQF4 $798
ADDRLP4 52
INDIRP4
CNSTI4 6936
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $798
line 1735
;1734:				// if asked for a team leader and no response
;1735:				BotAI_BotInitialChat(bs, "whoisteamleader", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $800
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1736
;1736:				trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1737
;1737:				bs->askteamleader_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6936
ADDP4
CNSTF4 0
ASGNF4
line 1738
;1738:				bs->becometeamleader_time = FloatTime() + 8 + random() * 10;
ADDRLP4 56
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6940
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1090519040
ADDF4
ADDRLP4 56
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 966787392
MULF4
ADDF4
ASGNF4
line 1739
;1739:			}
LABELV $798
line 1740
;1740:			if (bs->becometeamleader_time && bs->becometeamleader_time < FloatTime()) {
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 6940
ADDP4
INDIRF4
CNSTF4 0
EQF4 $785
ADDRLP4 56
INDIRP4
CNSTI4 6940
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $785
line 1741
;1741:				BotAI_BotInitialChat(bs, "iamteamleader", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $803
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1742
;1742:				trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1743
;1743:				ClientName(bs->client, netname, sizeof(netname));
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
line 1744
;1744:				Q_strncpyz( bs->teamleader, netname, sizeof( bs->teamleader ) );
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
line 1745
;1745:				bs->becometeamleader_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6940
ADDP4
CNSTF4 0
ASGNF4
line 1746
;1746:			}
line 1747
;1747:			return;
ADDRGP4 $785
JUMPV
LABELV $792
line 1749
;1748:		}
;1749:	}
LABELV $790
line 1750
;1750:	bs->askteamleader_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6936
ADDP4
CNSTF4 0
ASGNF4
line 1751
;1751:	bs->becometeamleader_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6940
ADDP4
CNSTF4 0
ASGNF4
line 1754
;1752:
;1753:	//return if this bot is NOT the team leader
;1754:	ClientName(bs->client, netname, sizeof(netname));
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
line 1755
;1755:	if (Q_stricmp(netname, bs->teamleader) != 0) return;
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $804
ADDRGP4 $785
JUMPV
LABELV $804
line 1757
;1756:	//
;1757:	numteammates = BotNumTeamMates(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 BotNumTeamMates
CALLI4
ASGNI4
ADDRLP4 36
ADDRLP4 48
INDIRI4
ASGNI4
line 1759
;1758:	//give orders
;1759:	switch(gametype) {
ADDRLP4 52
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 3
LTI4 $806
ADDRLP4 52
INDIRI4
CNSTI4 7
GTI4 $806
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $848-12
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $848
address $808
address $814
address $825
address $836
address $842
code
LABELV $808
line 1761
;1760:		case GT_TDM:
;1761:		{
line 1762
;1762:			if (bs->numteammates != numteammates || bs->forceorders) {
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 6952
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $811
ADDRLP4 56
INDIRP4
CNSTI4 6972
ADDP4
INDIRI4
CNSTI4 0
EQI4 $809
LABELV $811
line 1763
;1763:				bs->teamgiveorders_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6944
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1764
;1764:				bs->numteammates = numteammates;
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 1765
;1765:				bs->forceorders = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6972
ADDP4
CNSTI4 0
ASGNI4
line 1766
;1766:			}
LABELV $809
line 1768
;1767:			//if it's time to give orders
;1768:			if (bs->teamgiveorders_time && bs->teamgiveorders_time < FloatTime() - 5) {
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 6944
ADDP4
INDIRF4
CNSTF4 0
EQF4 $807
ADDRLP4 60
INDIRP4
CNSTI4 6944
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
SUBF4
GEF4 $807
line 1769
;1769:				BotTeamOrders(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotTeamOrders
CALLV
pop
line 1771
;1770:				//give orders again after 120 seconds
;1771:				bs->teamgiveorders_time = FloatTime() + 120;
ADDRFP4 0
INDIRP4
CNSTI4 6944
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 1772
;1772:			}
line 1773
;1773:			break;
ADDRGP4 $807
JUMPV
LABELV $814
line 1776
;1774:		}
;1775:		case GT_CTF:
;1776:		{
line 1779
;1777:			//if the number of team mates changed or the flag status changed
;1778:			//or someone wants to know what to do
;1779:			if (bs->numteammates != numteammates || bs->flagstatuschanged || bs->forceorders) {
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 6952
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $818
ADDRLP4 56
INDIRP4
CNSTI4 6968
ADDP4
INDIRI4
CNSTI4 0
NEI4 $818
ADDRLP4 56
INDIRP4
CNSTI4 6972
ADDP4
INDIRI4
CNSTI4 0
EQI4 $815
LABELV $818
line 1780
;1780:				bs->teamgiveorders_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6944
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1781
;1781:				bs->numteammates = numteammates;
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 1782
;1782:				bs->flagstatuschanged = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6968
ADDP4
CNSTI4 0
ASGNI4
line 1783
;1783:				bs->forceorders = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6972
ADDP4
CNSTI4 0
ASGNI4
line 1784
;1784:			}
LABELV $815
line 1786
;1785:			//if there were no flag captures the last 3 minutes
;1786:			if (bs->lastflagcapture_time < FloatTime() - 240) {
ADDRFP4 0
INDIRP4
CNSTI4 6948
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1131413504
SUBF4
GEF4 $819
line 1787
;1787:				bs->lastflagcapture_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6948
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1789
;1788:				//randomly change the CTF strategy
;1789:				if (random() < 0.4) {
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
CNSTF4 1053609165
GEF4 $821
line 1790
;1790:					bs->ctfstrategy ^= CTFS_AGRESSIVE;
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 6980
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 1791
;1791:					bs->teamgiveorders_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6944
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1792
;1792:				}
LABELV $821
line 1793
;1793:			}
LABELV $819
line 1795
;1794:			//if it's time to give orders
;1795:			if (bs->teamgiveorders_time && bs->teamgiveorders_time < FloatTime() - 3) {
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 6944
ADDP4
INDIRF4
CNSTF4 0
EQF4 $807
ADDRLP4 60
INDIRP4
CNSTI4 6944
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1077936128
SUBF4
GEF4 $807
line 1796
;1796:				BotCTFOrders(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCTFOrders
CALLV
pop
line 1798
;1797:				//
;1798:				bs->teamgiveorders_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6944
ADDP4
CNSTF4 0
ASGNF4
line 1799
;1799:			}
line 1800
;1800:			break;
ADDRGP4 $807
JUMPV
LABELV $825
line 1803
;1801:		}
;1802:		case GT_ONEFLAG:
;1803:		{
line 1804
;1804:			if (bs->numteammates != numteammates || bs->flagstatuschanged || bs->forceorders) {
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 6952
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $829
ADDRLP4 56
INDIRP4
CNSTI4 6968
ADDP4
INDIRI4
CNSTI4 0
NEI4 $829
ADDRLP4 56
INDIRP4
CNSTI4 6972
ADDP4
INDIRI4
CNSTI4 0
EQI4 $826
LABELV $829
line 1805
;1805:				bs->teamgiveorders_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6944
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1806
;1806:				bs->numteammates = numteammates;
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 1807
;1807:				bs->flagstatuschanged = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6968
ADDP4
CNSTI4 0
ASGNI4
line 1808
;1808:				bs->forceorders = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6972
ADDP4
CNSTI4 0
ASGNI4
line 1809
;1809:			}
LABELV $826
line 1811
;1810:			//if there were no flag captures the last 4 minutes
;1811:			if (bs->lastflagcapture_time < FloatTime() - 240) {
ADDRFP4 0
INDIRP4
CNSTI4 6948
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1131413504
SUBF4
GEF4 $830
line 1812
;1812:				bs->lastflagcapture_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6948
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1814
;1813:				//randomly change the CTF strategy
;1814:				if (random() < 0.4) {
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
CNSTF4 1053609165
GEF4 $832
line 1815
;1815:					bs->ctfstrategy ^= CTFS_AGRESSIVE;
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 6980
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 1816
;1816:					bs->teamgiveorders_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6944
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1817
;1817:				}
LABELV $832
line 1818
;1818:			}
LABELV $830
line 1820
;1819:			//if it's time to give orders
;1820:			if (bs->teamgiveorders_time && bs->teamgiveorders_time < FloatTime() - 2) {
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 6944
ADDP4
INDIRF4
CNSTF4 0
EQF4 $807
ADDRLP4 60
INDIRP4
CNSTI4 6944
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
SUBF4
GEF4 $807
line 1821
;1821:				Bot1FCTFOrders(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Bot1FCTFOrders
CALLV
pop
line 1823
;1822:				//
;1823:				bs->teamgiveorders_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6944
ADDP4
CNSTF4 0
ASGNF4
line 1824
;1824:			}
line 1825
;1825:			break;
ADDRGP4 $807
JUMPV
LABELV $836
line 1828
;1826:		}
;1827:		case GT_OVERLOAD:
;1828:		{
line 1829
;1829:			if (bs->numteammates != numteammates || bs->forceorders) {
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 6952
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $839
ADDRLP4 56
INDIRP4
CNSTI4 6972
ADDP4
INDIRI4
CNSTI4 0
EQI4 $837
LABELV $839
line 1830
;1830:				bs->teamgiveorders_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6944
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1831
;1831:				bs->numteammates = numteammates;
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 1832
;1832:				bs->forceorders = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6972
ADDP4
CNSTI4 0
ASGNI4
line 1833
;1833:			}
LABELV $837
line 1835
;1834:			//if it's time to give orders
;1835:			if (bs->teamgiveorders_time && bs->teamgiveorders_time < FloatTime() - 5) {
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 6944
ADDP4
INDIRF4
CNSTF4 0
EQF4 $807
ADDRLP4 60
INDIRP4
CNSTI4 6944
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
SUBF4
GEF4 $807
line 1836
;1836:				BotObeliskOrders(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotObeliskOrders
CALLV
pop
line 1838
;1837:				//give orders again after 30 seconds
;1838:				bs->teamgiveorders_time = FloatTime() + 30;
ADDRFP4 0
INDIRP4
CNSTI4 6944
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1106247680
ADDF4
ASGNF4
line 1839
;1839:			}
line 1840
;1840:			break;
ADDRGP4 $807
JUMPV
LABELV $842
line 1843
;1841:		}
;1842:		case GT_HARVESTER:
;1843:		{
line 1844
;1844:			if (bs->numteammates != numteammates || bs->forceorders) {
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 6952
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $845
ADDRLP4 56
INDIRP4
CNSTI4 6972
ADDP4
INDIRI4
CNSTI4 0
EQI4 $843
LABELV $845
line 1845
;1845:				bs->teamgiveorders_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6944
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1846
;1846:				bs->numteammates = numteammates;
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 1847
;1847:				bs->forceorders = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6972
ADDP4
CNSTI4 0
ASGNI4
line 1848
;1848:			}
LABELV $843
line 1850
;1849:			//if it's time to give orders
;1850:			if (bs->teamgiveorders_time && bs->teamgiveorders_time < FloatTime() - 5) {
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 6944
ADDP4
INDIRF4
CNSTF4 0
EQF4 $807
ADDRLP4 60
INDIRP4
CNSTI4 6944
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
SUBF4
GEF4 $807
line 1851
;1851:				BotHarvesterOrders(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotHarvesterOrders
CALLV
pop
line 1853
;1852:				//give orders again after 30 seconds
;1853:				bs->teamgiveorders_time = FloatTime() + 30;
ADDRFP4 0
INDIRP4
CNSTI4 6944
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1106247680
ADDF4
ASGNF4
line 1854
;1854:			}
line 1855
;1855:			break;
LABELV $806
LABELV $807
line 1858
;1856:		}
;1857:	}
;1858:}
LABELV $785
endproc BotTeamAI 68 12
bss
export ctftaskpreferences
align 4
LABELV ctftaskpreferences
skip 2560
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
LABELV $803
byte 1 105
byte 1 97
byte 1 109
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $800
byte 1 119
byte 1 104
byte 1 111
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $721
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 104
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $571
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $459
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
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
LABELV $199
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $156
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 97
byte 1 99
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 97
byte 1 110
byte 1 121
byte 1 0
align 1
LABELV $155
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 97
byte 1 99
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 97
byte 1 110
byte 1 121
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $146
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 103
byte 1 101
byte 1 116
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $135
byte 1 25
byte 1 40
byte 1 37
byte 1 115
byte 1 25
byte 1 41
byte 1 25
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $73
byte 1 116
byte 1 0
align 1
LABELV $69
byte 1 110
byte 1 0
