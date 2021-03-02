export TeamPlayIsOn
code
proc TeamPlayIsOn 0 0
file "..\..\..\..\code\game\ai_dmq3.c"
line 90
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:/*****************************************************************************
;5: * name:		ai_dmq3.c
;6: *
;7: * desc:		Quake3 bot AI
;8: *
;9: * $Archive: /MissionPack/code/game/ai_dmq3.c $
;10: *
;11: *****************************************************************************/
;12:
;13:
;14:#include "g_local.h"
;15:#include "../botlib/botlib.h"
;16:#include "../botlib/be_aas.h"
;17:#include "../botlib/be_ea.h"
;18:#include "../botlib/be_ai_char.h"
;19:#include "../botlib/be_ai_chat.h"
;20:#include "../botlib/be_ai_gen.h"
;21:#include "../botlib/be_ai_goal.h"
;22:#include "../botlib/be_ai_move.h"
;23:#include "../botlib/be_ai_weap.h"
;24://
;25:#include "ai_main.h"
;26:#include "ai_dmq3.h"
;27:#include "ai_chat.h"
;28:#include "ai_cmd.h"
;29:#include "ai_dmnet.h"
;30:#include "ai_team.h"
;31://
;32:#include "chars.h"				//characteristics
;33:#include "inv.h"				//indexes into the inventory
;34:#include "syn.h"				//synonyms
;35:#include "match.h"				//string matching types and vars
;36:
;37:// from aasfile.h
;38:#define AREACONTENTS_MOVER				1024
;39:#define AREACONTENTS_MODELNUMSHIFT		24
;40:#define AREACONTENTS_MAXMODELNUM		0xFF
;41:#define AREACONTENTS_MODELNUM			(AREACONTENTS_MAXMODELNUM << AREACONTENTS_MODELNUMSHIFT)
;42:
;43:#define IDEAL_ATTACKDIST			140
;44:
;45:#define MAX_WAYPOINTS		128
;46://
;47:bot_waypoint_t botai_waypoints[MAX_WAYPOINTS];
;48:bot_waypoint_t *botai_freewaypoints;
;49:
;50://NOTE: not using a cvars which can be updated because the game should be reloaded anyway
;51:int gametype;		//game type
;52://int maxclients;	//maximum number of clients
;53:
;54:vmCvar_t bot_grapple;
;55:vmCvar_t bot_rocketjump;
;56:vmCvar_t bot_fastchat;
;57:vmCvar_t bot_nochat;
;58:vmCvar_t bot_testrchat;
;59:vmCvar_t bot_challenge;
;60:vmCvar_t bot_predictobstacles;
;61:vmCvar_t g_spSkill;
;62:
;63:extern vmCvar_t bot_developer;
;64:
;65:vec3_t lastteleport_origin;		//last teleport event origin
;66:float lastteleport_time;		//last teleport event time
;67:int max_bspmodelindex;			//maximum BSP model index
;68:
;69://CTF flag goals
;70:bot_goal_t ctf_redflag;
;71:bot_goal_t ctf_blueflag;
;72:bot_goal_t ctf_neutralflag;
;73:bot_goal_t redobelisk;
;74:bot_goal_t blueobelisk;
;75:bot_goal_t neutralobelisk;
;76:
;77:#define MAX_ALTROUTEGOALS		32
;78:
;79:int altroutegoals_setup;
;80:aas_altroutegoal_t red_altroutegoals[MAX_ALTROUTEGOALS];
;81:int red_numaltroutegoals;
;82:aas_altroutegoal_t blue_altroutegoals[MAX_ALTROUTEGOALS];
;83:int blue_numaltroutegoals;
;84:
;85:/*
;86:==================
;87:TeamPlayIsOn
;88:==================
;89:*/
;90:int TeamPlayIsOn( void ) {
line 91
;91:	return ( GTx( g_gametype.integer, GTF_TEAMS ) );
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 36
MULI4
ADDRGP4 gt+20
ADDP4
INDIRI4
CNSTI4 128
BANDI4
RETI4
LABELV $56
endproc TeamPlayIsOn 0 0
proc BotSetUserInfo 1024 12
line 99
;92:}
;93:
;94:/*
;95:==================
;96:BotSetUserInfo
;97:==================
;98:*/
;99:static void BotSetUserInfo( bot_state_t *bs, const char *key, const char *value ) {
line 102
;100:	char userinfo[MAX_INFO_STRING];
;101:
;102:	trap_GetUserinfo( bs->client, userinfo, sizeof( userinfo ) );
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 103
;103:	Info_SetValueForKey( userinfo, key, value );
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 104
;104:	trap_SetUserinfo( bs->client, userinfo );
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 105
;105:	ClientUserinfoChanged( bs->client );
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLI4
pop
line 106
;106:}
LABELV $59
endproc BotSetUserInfo 1024 12
export BotCTFCarryingFlag
proc BotCTFCarryingFlag 0 0
line 114
;107:
;108:
;109:/*
;110:==================
;111:BotCTFCarryingFlag
;112:==================
;113:*/
;114:int BotCTFCarryingFlag(bot_state_t *bs) {
line 115
;115:	if (gametype != GT_CTF) return CTF_FLAG_NONE;
ADDRGP4 gametype
INDIRI4
CNSTI4 4
EQI4 $61
CNSTI4 0
RETI4
ADDRGP4 $60
JUMPV
LABELV $61
line 117
;116:
;117:	if (bs->inventory[INVENTORY_REDFLAG] > 0) return CTF_FLAG_RED;
ADDRFP4 0
INDIRP4
CNSTI4 5132
ADDP4
INDIRI4
CNSTI4 0
LEI4 $63
CNSTI4 1
RETI4
ADDRGP4 $60
JUMPV
LABELV $63
line 118
;118:	else if (bs->inventory[INVENTORY_BLUEFLAG] > 0) return CTF_FLAG_BLUE;
ADDRFP4 0
INDIRP4
CNSTI4 5136
ADDP4
INDIRI4
CNSTI4 0
LEI4 $65
CNSTI4 2
RETI4
ADDRGP4 $60
JUMPV
LABELV $65
line 119
;119:	return CTF_FLAG_NONE;
CNSTI4 0
RETI4
LABELV $60
endproc BotCTFCarryingFlag 0 0
export BotTeam
proc BotTeam 1044 12
line 127
;120:}
;121:
;122:/*
;123:==================
;124:BotTeam
;125:==================
;126:*/
;127:int BotTeam(bot_state_t *bs) {
line 130
;128:	char info[1024];
;129:
;130:	if (bs->client < 0 || bs->client >= MAX_CLIENTS) {
ADDRLP4 1024
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1024
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 0
LTI4 $70
ADDRLP4 1024
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 64
LTI4 $68
LABELV $70
line 132
;131:		//BotAI_Print(PRT_ERROR, "BotCTFTeam: client out of range\n");
;132:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $67
JUMPV
LABELV $68
line 134
;133:	}
;134:	trap_GetConfigstring(CS_PLAYERS+bs->client, info, sizeof(info));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
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
line 136
;135:	//
;136:	if (atoi(Info_ValueForKey(info, "t")) == TEAM_RED) return TEAM_RED;
ADDRLP4 0
ARGP4
ADDRGP4 $73
ARGP4
ADDRLP4 1028
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 1032
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 1
NEI4 $71
CNSTI4 1
RETI4
ADDRGP4 $67
JUMPV
LABELV $71
line 137
;137:	else if (atoi(Info_ValueForKey(info, "t")) == TEAM_BLUE) return TEAM_BLUE;
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
CNSTI4 2
NEI4 $74
CNSTI4 2
RETI4
ADDRGP4 $67
JUMPV
LABELV $74
line 138
;138:	return TEAM_FREE;
CNSTI4 0
RETI4
LABELV $67
endproc BotTeam 1044 12
export BotOppositeTeam
proc BotOppositeTeam 12 4
line 146
;139:}
;140:
;141:/*
;142:==================
;143:BotOppositeTeam
;144:==================
;145:*/
;146:int BotOppositeTeam(bot_state_t *bs) {
line 147
;147:	switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $80
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $81
ADDRGP4 $77
JUMPV
LABELV $80
line 148
;148:		case TEAM_RED: return TEAM_BLUE;
CNSTI4 2
RETI4
ADDRGP4 $76
JUMPV
LABELV $81
line 149
;149:		case TEAM_BLUE: return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $76
JUMPV
LABELV $77
line 150
;150:		default: return TEAM_FREE;
CNSTI4 0
RETI4
LABELV $76
endproc BotOppositeTeam 12 4
export BotEnemyFlag
proc BotEnemyFlag 4 4
line 159
;151:	}
;152:}
;153:
;154:/*
;155:==================
;156:BotEnemyFlag
;157:==================
;158:*/
;159:bot_goal_t *BotEnemyFlag(bot_state_t *bs) {
line 160
;160:	if (BotTeam(bs) == TEAM_RED) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $83
line 161
;161:		return &ctf_blueflag;
ADDRGP4 ctf_blueflag
RETP4
ADDRGP4 $82
JUMPV
LABELV $83
line 163
;162:	}
;163:	else {
line 164
;164:		return &ctf_redflag;
ADDRGP4 ctf_redflag
RETP4
LABELV $82
endproc BotEnemyFlag 4 4
export BotTeamFlag
proc BotTeamFlag 4 4
line 173
;165:	}
;166:}
;167:
;168:/*
;169:==================
;170:BotTeamFlag
;171:==================
;172:*/
;173:bot_goal_t *BotTeamFlag(bot_state_t *bs) {
line 174
;174:	if (BotTeam(bs) == TEAM_RED) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $86
line 175
;175:		return &ctf_redflag;
ADDRGP4 ctf_redflag
RETP4
ADDRGP4 $85
JUMPV
LABELV $86
line 177
;176:	}
;177:	else {
line 178
;178:		return &ctf_blueflag;
ADDRGP4 ctf_blueflag
RETP4
LABELV $85
endproc BotTeamFlag 4 4
export EntityIsDead
proc EntityIsDead 472 8
line 188
;179:	}
;180:}
;181:
;182:
;183:/*
;184:==================
;185:EntityIsDead
;186:==================
;187:*/
;188:qboolean EntityIsDead(aas_entityinfo_t *entinfo) {
line 191
;189:	playerState_t ps;
;190:
;191:	if (entinfo->number >= 0 && entinfo->number < MAX_CLIENTS) {
ADDRLP4 468
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 468
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 0
LTI4 $89
ADDRLP4 468
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 64
GEI4 $89
line 193
;192:		//retrieve the current client state
;193:		BotAI_GetClientState( entinfo->number, &ps );
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotAI_GetClientState
CALLI4
pop
line 194
;194:		if (ps.pm_type != PM_NORMAL) return qtrue;
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $91
CNSTI4 1
RETI4
ADDRGP4 $88
JUMPV
LABELV $91
line 195
;195:	}
LABELV $89
line 196
;196:	return qfalse;
CNSTI4 0
RETI4
LABELV $88
endproc EntityIsDead 472 8
export EntityCarriesFlag
proc EntityCarriesFlag 0 0
line 204
;197:}
;198:
;199:/*
;200:==================
;201:EntityCarriesFlag
;202:==================
;203:*/
;204:qboolean EntityCarriesFlag(aas_entityinfo_t *entinfo) {
line 205
;205:	if ( entinfo->powerups & ( 1 << PW_REDFLAG ) )
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $95
line 206
;206:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $94
JUMPV
LABELV $95
line 207
;207:	if ( entinfo->powerups & ( 1 << PW_BLUEFLAG ) )
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $97
line 208
;208:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $94
JUMPV
LABELV $97
line 209
;209:	if ( entinfo->powerups & ( 1 << PW_NEUTRALFLAG ) )
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $99
line 210
;210:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $94
JUMPV
LABELV $99
line 211
;211:	return qfalse;
CNSTI4 0
RETI4
LABELV $94
endproc EntityCarriesFlag 0 0
export EntityIsInvisible
proc EntityIsInvisible 4 4
line 219
;212:}
;213:
;214:/*
;215:==================
;216:EntityIsInvisible
;217:==================
;218:*/
;219:qboolean EntityIsInvisible(aas_entityinfo_t *entinfo) {
line 221
;220:	// the flag is always visible
;221:	if (EntityCarriesFlag(entinfo)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $102
line 222
;222:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $101
JUMPV
LABELV $102
line 224
;223:	}
;224:	if (entinfo->powerups & (1 << PW_INVIS)) {
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $104
line 225
;225:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $101
JUMPV
LABELV $104
line 227
;226:	}
;227:	return qfalse;
CNSTI4 0
RETI4
LABELV $101
endproc EntityIsInvisible 4 4
export EntityIsShooting
proc EntityIsShooting 0 0
line 235
;228:}
;229:
;230:/*
;231:==================
;232:EntityIsShooting
;233:==================
;234:*/
;235:qboolean EntityIsShooting(aas_entityinfo_t *entinfo) {
line 236
;236:	if (entinfo->flags & EF_FIRING) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $107
line 237
;237:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $106
JUMPV
LABELV $107
line 239
;238:	}
;239:	return qfalse;
CNSTI4 0
RETI4
LABELV $106
endproc EntityIsShooting 0 0
export EntityIsChatting
proc EntityIsChatting 0 0
line 247
;240:}
;241:
;242:/*
;243:==================
;244:EntityIsChatting
;245:==================
;246:*/
;247:qboolean EntityIsChatting(aas_entityinfo_t *entinfo) {
line 248
;248:	if (entinfo->flags & EF_TALK) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $110
line 249
;249:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $109
JUMPV
LABELV $110
line 251
;250:	}
;251:	return qfalse;
CNSTI4 0
RETI4
LABELV $109
endproc EntityIsChatting 0 0
export EntityHasQuad
proc EntityHasQuad 0 0
line 259
;252:}
;253:
;254:/*
;255:==================
;256:EntityHasQuad
;257:==================
;258:*/
;259:qboolean EntityHasQuad(aas_entityinfo_t *entinfo) {
line 260
;260:	if (entinfo->powerups & (1 << PW_QUAD)) {
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $113
line 261
;261:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $112
JUMPV
LABELV $113
line 263
;262:	}
;263:	return qfalse;
CNSTI4 0
RETI4
LABELV $112
endproc EntityHasQuad 0 0
export EntityHasKamikaze
proc EntityHasKamikaze 0 0
line 272
;264:}
;265:
;266:
;267:/*
;268:==================
;269:EntityHasKamikze
;270:==================
;271:*/
;272:qboolean EntityHasKamikaze(aas_entityinfo_t *entinfo) {
line 273
;273:	if (entinfo->flags & EF_KAMIKAZE) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $116
line 274
;274:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $115
JUMPV
LABELV $116
line 276
;275:	}
;276:	return qfalse;
CNSTI4 0
RETI4
LABELV $115
endproc EntityHasKamikaze 0 0
export EntityCarriesCubes
proc EntityCarriesCubes 208 8
line 284
;277:}
;278:
;279:/*
;280:==================
;281:EntityCarriesCubes
;282:==================
;283:*/
;284:qboolean EntityCarriesCubes(aas_entityinfo_t *entinfo) {
line 287
;285:	entityState_t state;
;286:
;287:	if (gametype != GT_HARVESTER)
ADDRGP4 gametype
INDIRI4
CNSTI4 7
EQI4 $119
line 288
;288:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $118
JUMPV
LABELV $119
line 290
;289:	//FIXME: get this info from the aas_entityinfo_t ?
;290:	BotAI_GetEntityState(entinfo->number, &state);
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotAI_GetEntityState
CALLI4
pop
line 291
;291:	if (state.generic1 > 0)
ADDRLP4 0+204
INDIRI4
CNSTI4 0
LEI4 $121
line 292
;292:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $118
JUMPV
LABELV $121
line 293
;293:	return qfalse;
CNSTI4 0
RETI4
LABELV $118
endproc EntityCarriesCubes 208 8
export Bot1FCTFCarryingFlag
proc Bot1FCTFCarryingFlag 0 0
line 301
;294:}
;295:
;296:/*
;297:==================
;298:Bot1FCTFCarryingFlag
;299:==================
;300:*/
;301:int Bot1FCTFCarryingFlag(bot_state_t *bs) {
line 302
;302:	if (gametype != GT_ONEFLAG) return qfalse;
ADDRGP4 gametype
INDIRI4
CNSTI4 5
EQI4 $125
CNSTI4 0
RETI4
ADDRGP4 $124
JUMPV
LABELV $125
line 304
;303:
;304:	if (bs->inventory[INVENTORY_NEUTRALFLAG] > 0) return qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 5140
ADDP4
INDIRI4
CNSTI4 0
LEI4 $127
CNSTI4 1
RETI4
ADDRGP4 $124
JUMPV
LABELV $127
line 305
;305:	return qfalse;
CNSTI4 0
RETI4
LABELV $124
endproc Bot1FCTFCarryingFlag 0 0
export BotHarvesterCarryingCubes
proc BotHarvesterCarryingCubes 0 0
line 313
;306:}
;307:
;308:/*
;309:==================
;310:BotHarvesterCarryingCubes
;311:==================
;312:*/
;313:int BotHarvesterCarryingCubes(bot_state_t *bs) {
line 314
;314:	if (gametype != GT_HARVESTER) return qfalse;
ADDRGP4 gametype
INDIRI4
CNSTI4 7
EQI4 $130
CNSTI4 0
RETI4
ADDRGP4 $129
JUMPV
LABELV $130
line 316
;315:
;316:	if (bs->inventory[INVENTORY_REDCUBE] > 0) return qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 5144
ADDP4
INDIRI4
CNSTI4 0
LEI4 $132
CNSTI4 1
RETI4
ADDRGP4 $129
JUMPV
LABELV $132
line 317
;317:	if (bs->inventory[INVENTORY_BLUECUBE] > 0) return qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 5148
ADDP4
INDIRI4
CNSTI4 0
LEI4 $134
CNSTI4 1
RETI4
ADDRGP4 $129
JUMPV
LABELV $134
line 318
;318:	return qfalse;
CNSTI4 0
RETI4
LABELV $129
endproc BotHarvesterCarryingCubes 0 0
export BotRememberLastOrderedTask
proc BotRememberLastOrderedTask 16 12
line 327
;319:}
;320:
;321:
;322:/*
;323:==================
;324:BotRememberLastOrderedTask
;325:==================
;326:*/
;327:void BotRememberLastOrderedTask(bot_state_t *bs) {
line 328
;328:	if (!bs->ordered) {
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
INDIRI4
CNSTI4 0
NEI4 $137
line 329
;329:		return;
ADDRGP4 $136
JUMPV
LABELV $137
line 331
;330:	}
;331:	bs->lastgoal_decisionmaker = bs->decisionmaker;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 6756
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 6608
ADDP4
INDIRI4
ASGNI4
line 332
;332:	bs->lastgoal_ltgtype = bs->ltgtype;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 6760
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
ASGNI4
line 333
;333:	memcpy(&bs->lastgoal_teamgoal, &bs->teamgoal, sizeof(bot_goal_t));
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 6768
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 334
;334:	bs->lastgoal_teammate = bs->teammate;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 6764
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ASGNI4
line 335
;335:}
LABELV $136
endproc BotRememberLastOrderedTask 16 12
export BotSetTeamStatus
proc BotSetTeamStatus 164 12
line 342
;336:
;337:/*
;338:==================
;339:BotSetTeamStatus
;340:==================
;341:*/
;342:void BotSetTeamStatus(bot_state_t *bs) {
line 346
;343:	int teamtask;
;344:	aas_entityinfo_t entinfo;
;345:
;346:	teamtask = TEAMTASK_PATROL;
ADDRLP4 0
CNSTI4 3
ASGNI4
line 348
;347:
;348:	switch(bs->ltgtype) {
ADDRLP4 144
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 1
LTI4 $140
ADDRLP4 144
INDIRI4
CNSTI4 13
GTI4 $140
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $160-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $160
address $141
address $144
address $150
address $151
address $152
address $153
address $154
address $154
address $155
address $156
address $157
address $158
address $159
code
line 350
;349:		case LTG_TEAMHELP:
;350:			break;
LABELV $144
line 352
;351:		case LTG_TEAMACCOMPANY:
;352:			BotEntityInfo(bs->teammate, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 353
;353:			if ( ( (gametype == GT_CTF || gametype == GT_ONEFLAG) && EntityCarriesFlag(&entinfo))
ADDRLP4 152
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 4
EQI4 $149
ADDRLP4 152
INDIRI4
CNSTI4 5
NEI4 $148
LABELV $149
ADDRLP4 4
ARGP4
ADDRLP4 156
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 0
NEI4 $147
LABELV $148
ADDRGP4 gametype
INDIRI4
CNSTI4 7
NEI4 $145
ADDRLP4 4
ARGP4
ADDRLP4 160
ADDRGP4 EntityCarriesCubes
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
EQI4 $145
LABELV $147
line 354
;354:				|| ( gametype == GT_HARVESTER && EntityCarriesCubes(&entinfo)) ) {
line 355
;355:				teamtask = TEAMTASK_ESCORT;
ADDRLP4 0
CNSTI4 6
ASGNI4
line 356
;356:			}
ADDRGP4 $141
JUMPV
LABELV $145
line 357
;357:			else {
line 358
;358:				teamtask = TEAMTASK_FOLLOW;
ADDRLP4 0
CNSTI4 4
ASGNI4
line 359
;359:			}
line 360
;360:			break;
ADDRGP4 $141
JUMPV
LABELV $150
line 362
;361:		case LTG_DEFENDKEYAREA:
;362:			teamtask = TEAMTASK_DEFENSE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 363
;363:			break;
ADDRGP4 $141
JUMPV
LABELV $151
line 365
;364:		case LTG_GETFLAG:
;365:			teamtask = TEAMTASK_OFFENSE;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 366
;366:			break;
ADDRGP4 $141
JUMPV
LABELV $152
line 368
;367:		case LTG_RUSHBASE:
;368:			teamtask = TEAMTASK_DEFENSE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 369
;369:			break;
ADDRGP4 $141
JUMPV
LABELV $153
line 371
;370:		case LTG_RETURNFLAG:
;371:			teamtask = TEAMTASK_RETRIEVE;
ADDRLP4 0
CNSTI4 5
ASGNI4
line 372
;372:			break;
ADDRGP4 $141
JUMPV
LABELV $154
line 375
;373:		case LTG_CAMP:
;374:		case LTG_CAMPORDER:
;375:			teamtask = TEAMTASK_CAMP;
ADDRLP4 0
CNSTI4 7
ASGNI4
line 376
;376:			break;
ADDRGP4 $141
JUMPV
LABELV $155
line 378
;377:		case LTG_PATROL:
;378:			teamtask = TEAMTASK_PATROL;
ADDRLP4 0
CNSTI4 3
ASGNI4
line 379
;379:			break;
ADDRGP4 $141
JUMPV
LABELV $156
line 381
;380:		case LTG_GETITEM:
;381:			teamtask = TEAMTASK_PATROL;
ADDRLP4 0
CNSTI4 3
ASGNI4
line 382
;382:			break;
ADDRGP4 $141
JUMPV
LABELV $157
line 384
;383:		case LTG_KILL:
;384:			teamtask = TEAMTASK_PATROL;
ADDRLP4 0
CNSTI4 3
ASGNI4
line 385
;385:			break;
ADDRGP4 $141
JUMPV
LABELV $158
line 387
;386:		case LTG_HARVEST:
;387:			teamtask = TEAMTASK_OFFENSE;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 388
;388:			break;
ADDRGP4 $141
JUMPV
LABELV $159
line 390
;389:		case LTG_ATTACKENEMYBASE:
;390:			teamtask = TEAMTASK_OFFENSE;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 391
;391:			break;
ADDRGP4 $141
JUMPV
LABELV $140
line 393
;392:		default:
;393:			teamtask = TEAMTASK_PATROL;
ADDRLP4 0
CNSTI4 3
ASGNI4
line 394
;394:			break;
LABELV $141
line 396
;395:	}
;396:	BotSetUserInfo(bs, "teamtask", va("%d", teamtask));
ADDRGP4 $163
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 152
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $162
ARGP4
ADDRLP4 152
INDIRP4
ARGP4
ADDRGP4 BotSetUserInfo
CALLV
pop
line 397
;397:}
LABELV $139
endproc BotSetTeamStatus 164 12
export BotSetLastOrderedTask
proc BotSetLastOrderedTask 60 16
line 404
;398:
;399:/*
;400:==================
;401:BotSetLastOrderedTask
;402:==================
;403:*/
;404:int BotSetLastOrderedTask(bot_state_t *bs) {
line 406
;405:
;406:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $165
line 408
;407:		// don't go back to returning the flag if it's at the base
;408:		if ( bs->lastgoal_ltgtype == LTG_RETURNFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
CNSTI4 6
NEI4 $167
line 409
;409:			if ( BotTeam(bs) == TEAM_RED ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $169
line 410
;410:				if ( bs->redflagstatus == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
INDIRI4
CNSTI4 0
NEI4 $170
line 411
;411:					bs->lastgoal_ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
CNSTI4 0
ASGNI4
line 412
;412:				}
line 413
;413:			}
ADDRGP4 $170
JUMPV
LABELV $169
line 414
;414:			else {
line 415
;415:				if ( bs->blueflagstatus == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 6960
ADDP4
INDIRI4
CNSTI4 0
NEI4 $173
line 416
;416:					bs->lastgoal_ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
CNSTI4 0
ASGNI4
line 417
;417:				}
LABELV $173
line 418
;418:			}
LABELV $170
line 419
;419:		}
LABELV $167
line 420
;420:	}
LABELV $165
line 422
;421:
;422:	if ( bs->lastgoal_ltgtype ) {
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $175
line 423
;423:		bs->decisionmaker = bs->lastgoal_decisionmaker;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 6756
ADDP4
INDIRI4
ASGNI4
line 424
;424:		bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 1
ASGNI4
line 425
;425:		bs->ltgtype = bs->lastgoal_ltgtype;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 6600
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
ASGNI4
line 426
;426:		memcpy(&bs->teamgoal, &bs->lastgoal_teamgoal, sizeof(bot_goal_t));
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 6768
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 427
;427:		bs->teammate = bs->lastgoal_teammate;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 6604
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 6764
ADDP4
INDIRI4
ASGNI4
line 428
;428:		bs->teamgoal_time = FloatTime() + 300;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1133903872
ADDF4
ASGNF4
line 429
;429:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 431
;430:		//
;431:		if ( gametype == GT_CTF ) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $177
line 432
;432:			if ( bs->ltgtype == LTG_GETFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 4
NEI4 $179
line 436
;433:				bot_goal_t *tb, *eb;
;434:				int tt, et;
;435:
;436:				tb = BotTeamFlag(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 BotTeamFlag
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 32
INDIRP4
ASGNP4
line 437
;437:				eb = BotEnemyFlag(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 BotEnemyFlag
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 36
INDIRP4
ASGNP4
line 438
;438:				tt = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, tb->areanum, TFL_DEFAULT);
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 44
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 44
INDIRI4
ASGNI4
line 439
;439:				et = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, eb->areanum, TFL_DEFAULT);
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 52
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 52
INDIRI4
ASGNI4
line 441
;440:				// if the travel time towards the enemy base is larger than towards our base
;441:				if (et > tt) {
ADDRLP4 28
INDIRI4
ADDRLP4 24
INDIRI4
LEI4 $181
line 443
;442:					//get an alternative route goal towards the enemy base
;443:					BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 444
;444:				}
LABELV $181
line 445
;445:			}
LABELV $179
line 446
;446:		}
LABELV $177
line 447
;447:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $164
JUMPV
LABELV $175
line 449
;448:	}
;449:	return qfalse;
CNSTI4 0
RETI4
LABELV $164
endproc BotSetLastOrderedTask 60 16
export BotRefuseOrder
proc BotRefuseOrder 4 8
line 457
;450:}
;451:
;452:/*
;453:==================
;454:BotRefuseOrder
;455:==================
;456:*/
;457:void BotRefuseOrder(bot_state_t *bs) {
line 458
;458:	if (!bs->ordered)
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
INDIRI4
CNSTI4 0
NEI4 $184
line 459
;459:		return;
ADDRGP4 $183
JUMPV
LABELV $184
line 461
;460:	// if the bot was ordered to do something
;461:	if ( bs->order_time && bs->order_time > FloatTime() - 10 ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 6616
ADDP4
INDIRF4
CNSTF4 0
EQF4 $186
ADDRLP4 0
INDIRP4
CNSTI4 6616
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1092616192
SUBF4
LEF4 $186
line 462
;462:		trap_EA_Action(bs->client, ACTION_NEGATIVE);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 2097152
ARGI4
ADDRGP4 trap_EA_Action
CALLV
pop
line 463
;463:		bs->order_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
CNSTF4 0
ASGNF4
line 464
;464:	}
LABELV $186
line 465
;465:}
LABELV $183
endproc BotRefuseOrder 4 8
export BotCTFSeekGoals
proc BotCTFSeekGoals 228 12
line 472
;466:
;467:/*
;468:==================
;469:BotCTFSeekGoals
;470:==================
;471:*/
;472:void BotCTFSeekGoals(bot_state_t *bs) {
line 479
;473:	float rnd, l1, l2;
;474:	int flagstatus, c;
;475:	vec3_t dir;
;476:	aas_entityinfo_t entinfo;
;477:
;478:	//when carrying a flag in ctf the bot should rush to the base
;479:	if (BotCTFCarryingFlag(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 172
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 0
EQI4 $189
line 481
;480:		//if not already rushing to the base
;481:		if (bs->ltgtype != LTG_RUSHBASE) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 5
EQI4 $191
line 482
;482:			BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 483
;483:			bs->ltgtype = LTG_RUSHBASE;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 5
ASGNI4
line 484
;484:			bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 485
;485:			bs->rushbaseaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
CNSTF4 0
ASGNF4
line 486
;486:			bs->decisionmaker = bs->client;
ADDRLP4 176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 176
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 176
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 487
;487:			bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 489
;488:			//
;489:			switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 184
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 180
ADDRLP4 184
INDIRI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 1
EQI4 $196
ADDRLP4 180
INDIRI4
CNSTI4 2
EQI4 $201
ADDRGP4 $193
JUMPV
LABELV $196
line 490
;490:				case TEAM_RED: VectorSubtract(bs->origin, ctf_blueflag.origin, dir); break;
ADDRLP4 192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 160
ADDRLP4 192
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRGP4 ctf_blueflag
INDIRF4
SUBF4
ASGNF4
ADDRLP4 160+4
ADDRLP4 192
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRGP4 ctf_blueflag+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 160+8
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
ADDRGP4 ctf_blueflag+8
INDIRF4
SUBF4
ASGNF4
ADDRGP4 $194
JUMPV
LABELV $201
line 491
;491:				case TEAM_BLUE: VectorSubtract(bs->origin, ctf_redflag.origin, dir); break;
ADDRLP4 196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 160
ADDRLP4 196
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRGP4 ctf_redflag
INDIRF4
SUBF4
ASGNF4
ADDRLP4 160+4
ADDRLP4 196
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRGP4 ctf_redflag+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 160+8
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
ADDRGP4 ctf_redflag+8
INDIRF4
SUBF4
ASGNF4
ADDRGP4 $194
JUMPV
LABELV $193
line 492
;492:				default: VectorSet(dir, 999, 999, 999); break;
ADDRLP4 160
CNSTF4 1148829696
ASGNF4
ADDRLP4 160+4
CNSTF4 1148829696
ASGNF4
ADDRLP4 160+8
CNSTF4 1148829696
ASGNF4
LABELV $194
line 495
;493:			}
;494:			// if the bot picked up the flag very close to the enemy base
;495:			if ( VectorLength(dir) < 128 ) {
ADDRLP4 160
ARGP4
ADDRLP4 192
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 192
INDIRF4
CNSTF4 1124073472
GEF4 $208
line 497
;496:				// get an alternative route goal through the enemy base
;497:				BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 196
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 196
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 498
;498:			} else {
ADDRGP4 $209
JUMPV
LABELV $208
line 500
;499:				// don't use any alt route goal, just get the hell out of the base
;500:				bs->altroutegoal.areanum = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6692
ADDP4
CNSTI4 0
ASGNI4
line 501
;501:			}
LABELV $209
line 502
;502:			BotSetUserInfo(bs, "teamtask", va("%d", TEAMTASK_OFFENSE));
ADDRGP4 $163
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 196
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $162
ARGP4
ADDRLP4 196
INDIRP4
ARGP4
ADDRGP4 BotSetUserInfo
CALLV
pop
line 503
;503:		}
ADDRGP4 $188
JUMPV
LABELV $191
line 504
;504:		else if (bs->rushbaseaway_time > FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $188
line 505
;505:			if (BotTeam(bs) == TEAM_RED) flagstatus = bs->redflagstatus;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 176
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 1
NEI4 $212
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $213
JUMPV
LABELV $212
line 506
;506:			else flagstatus = bs->blueflagstatus;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 6960
ADDP4
INDIRI4
ASGNI4
LABELV $213
line 508
;507:			//if the flag is back
;508:			if (flagstatus == 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $188
line 509
;509:				bs->rushbaseaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
CNSTF4 0
ASGNF4
line 510
;510:			}
line 511
;511:		}
line 512
;512:		return;
ADDRGP4 $188
JUMPV
LABELV $189
line 515
;513:	}
;514:	// if the bot decided to follow someone
;515:	if ( bs->ltgtype == LTG_TEAMACCOMPANY && !bs->ordered ) {
ADDRLP4 176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 176
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 2
NEI4 $216
ADDRLP4 176
INDIRP4
CNSTI4 6612
ADDP4
INDIRI4
CNSTI4 0
NEI4 $216
line 517
;516:		// if the team mate being accompanied no longer carries the flag
;517:		BotEntityInfo(bs->teammate, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 518
;518:		if (!EntityCarriesFlag(&entinfo)) {
ADDRLP4 16
ARGP4
ADDRLP4 180
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 0
NEI4 $218
line 519
;519:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 520
;520:		}
LABELV $218
line 521
;521:	}
LABELV $216
line 523
;522:	//
;523:	if (BotTeam(bs) == TEAM_RED) flagstatus = bs->redflagstatus * 2 + bs->blueflagstatus;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 180
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 1
NEI4 $220
ADDRLP4 184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 184
INDIRP4
CNSTI4 6956
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ADDRLP4 184
INDIRP4
CNSTI4 6960
ADDP4
INDIRI4
ADDI4
ASGNI4
ADDRGP4 $221
JUMPV
LABELV $220
line 524
;524:	else flagstatus = bs->blueflagstatus * 2 + bs->redflagstatus;
ADDRLP4 188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 188
INDIRP4
CNSTI4 6960
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ADDRLP4 188
INDIRP4
CNSTI4 6956
ADDP4
INDIRI4
ADDI4
ASGNI4
LABELV $221
line 526
;525:	//if our team has the enemy flag and our flag is at the base
;526:	if (flagstatus == 1) {
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $222
line 528
;527:		//
;528:		if (bs->owndecision_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 floattime
INDIRF4
GEF4 $188
line 530
;529:			//if Not defending the base already
;530:			if (!(bs->ltgtype == LTG_DEFENDKEYAREA &&
ADDRLP4 192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 192
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 3
NEI4 $230
ADDRLP4 192
INDIRP4
CNSTI4 6668
ADDP4
INDIRI4
ADDRGP4 ctf_redflag+44
INDIRI4
EQI4 $188
ADDRLP4 192
INDIRP4
CNSTI4 6668
ADDP4
INDIRI4
ADDRGP4 ctf_blueflag+44
INDIRI4
EQI4 $188
LABELV $230
line 532
;531:					(bs->teamgoal.number == ctf_redflag.number ||
;532:					bs->teamgoal.number == ctf_blueflag.number))) {
line 534
;533:				//if there is a visible team mate flag carrier
;534:				c = BotTeamFlagCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 196
ADDRGP4 BotTeamFlagCarrierVisible
CALLI4
ASGNI4
ADDRLP4 156
ADDRLP4 196
INDIRI4
ASGNI4
line 535
;535:				if (c >= 0 &&
ADDRLP4 200
ADDRLP4 156
INDIRI4
ASGNI4
ADDRLP4 200
INDIRI4
CNSTI4 0
LTI4 $188
ADDRLP4 204
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 204
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 2
NEI4 $233
ADDRLP4 204
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ADDRLP4 200
INDIRI4
EQI4 $188
LABELV $233
line 537
;536:						// and not already following the team mate flag carrier
;537:						(bs->ltgtype != LTG_TEAMACCOMPANY || bs->teammate != c)) {
line 539
;538:					//
;539:					BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 541
;540:					//follow the flag carrier
;541:					bs->decisionmaker = bs->client;
ADDRLP4 208
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 208
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 208
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 542
;542:					bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 544
;543:					//the team mate
;544:					bs->teammate = c;
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
ADDRLP4 156
INDIRI4
ASGNI4
line 546
;545:					//last time the team mate was visible
;546:					bs->teammatevisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6748
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 548
;547:					//no message
;548:					bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 550
;549:					//no arrive message
;550:					bs->arrive_time = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
CNSTF4 1065353216
ASGNF4
line 553
;551:					//
;552:					//get the team goal time
;553:					bs->teamgoal_time = FloatTime() + TEAM_ACCOMPANY_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 554
;554:					bs->ltgtype = LTG_TEAMACCOMPANY;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 2
ASGNI4
line 555
;555:					bs->formation_dist = 3.5 * 32;		//3.5 meter
ADDRFP4 0
INDIRP4
CNSTI4 7016
ADDP4
CNSTF4 1121976320
ASGNF4
line 556
;556:					BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 557
;557:					bs->owndecision_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CVFI4 4
ASGNI4
line 558
;558:				}
line 559
;559:			}
line 560
;560:		}
line 561
;561:		return;
ADDRGP4 $188
JUMPV
LABELV $222
line 564
;562:	}
;563:	//if the enemy has our flag
;564:	else if (flagstatus == 2) {
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $234
line 566
;565:		//
;566:		if (bs->owndecision_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 floattime
INDIRF4
GEF4 $188
line 568
;567:			//if enemy flag carrier is visible
;568:			c = BotEnemyFlagCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 192
ADDRGP4 BotEnemyFlagCarrierVisible
CALLI4
ASGNI4
ADDRLP4 156
ADDRLP4 192
INDIRI4
ASGNI4
line 569
;569:			if (c >= 0) {
ADDRLP4 156
INDIRI4
CNSTI4 0
LTI4 $238
line 571
;570:				//FIXME: fight enemy flag carrier
;571:			}
LABELV $238
line 573
;572:			//if not already doing something important
;573:			if (bs->ltgtype != LTG_GETFLAG &&
ADDRLP4 196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 196
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 4
EQI4 $188
ADDRLP4 196
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 6
EQI4 $188
ADDRLP4 196
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 1
EQI4 $188
ADDRLP4 196
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 2
EQI4 $188
ADDRLP4 196
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 8
EQI4 $188
ADDRLP4 196
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 9
EQI4 $188
ADDRLP4 196
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 10
EQI4 $188
line 579
;574:				bs->ltgtype != LTG_RETURNFLAG &&
;575:				bs->ltgtype != LTG_TEAMHELP &&
;576:				bs->ltgtype != LTG_TEAMACCOMPANY &&
;577:				bs->ltgtype != LTG_CAMPORDER &&
;578:				bs->ltgtype != LTG_PATROL &&
;579:				bs->ltgtype != LTG_GETITEM) {
line 581
;580:
;581:				BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 582
;582:				bs->decisionmaker = bs->client;
ADDRLP4 200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 200
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 200
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 583
;583:				bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 585
;584:				//
;585:				if (random() < 0.5) {
ADDRLP4 204
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 204
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
GEF4 $242
line 587
;586:					//go for the enemy flag
;587:					bs->ltgtype = LTG_GETFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 4
ASGNI4
line 588
;588:				}
ADDRGP4 $243
JUMPV
LABELV $242
line 589
;589:				else {
line 590
;590:					bs->ltgtype = LTG_RETURNFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 6
ASGNI4
line 591
;591:				}
LABELV $243
line 593
;592:				//no team message
;593:				bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 595
;594:				//set the time the bot will stop getting the flag
;595:				bs->teamgoal_time = FloatTime() + CTF_GETFLAG_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 597
;596:				//get an alternative route goal towards the enemy base
;597:				BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 208
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 208
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 599
;598:				//
;599:				BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 600
;600:				bs->owndecision_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CVFI4 4
ASGNI4
line 601
;601:			}
line 602
;602:		}
line 603
;603:		return;
ADDRGP4 $188
JUMPV
LABELV $234
line 606
;604:	}
;605:	//if both flags Not at their bases
;606:	else if (flagstatus == 3) {
ADDRLP4 0
INDIRI4
CNSTI4 3
NEI4 $244
line 608
;607:		//
;608:		if (bs->owndecision_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 floattime
INDIRF4
GEF4 $188
line 610
;609:			// if not trying to return the flag and not following the team flag carrier
;610:			if ( bs->ltgtype != LTG_RETURNFLAG && bs->ltgtype != LTG_TEAMACCOMPANY ) {
ADDRLP4 192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 192
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 6
EQI4 $188
ADDRLP4 192
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 2
EQI4 $188
line 612
;611:				//
;612:				c = BotTeamFlagCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 196
ADDRGP4 BotTeamFlagCarrierVisible
CALLI4
ASGNI4
ADDRLP4 156
ADDRLP4 196
INDIRI4
ASGNI4
line 614
;613:				// if there is a visible team mate flag carrier
;614:				if (c >= 0) {
ADDRLP4 156
INDIRI4
CNSTI4 0
LTI4 $250
line 615
;615:					BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 617
;616:					//follow the flag carrier
;617:					bs->decisionmaker = bs->client;
ADDRLP4 200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 200
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 200
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 618
;618:					bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 620
;619:					//the team mate
;620:					bs->teammate = c;
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
ADDRLP4 156
INDIRI4
ASGNI4
line 622
;621:					//last time the team mate was visible
;622:					bs->teammatevisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6748
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 624
;623:					//no message
;624:					bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 626
;625:					//no arrive message
;626:					bs->arrive_time = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
CNSTF4 1065353216
ASGNF4
line 629
;627:					//
;628:					//get the team goal time
;629:					bs->teamgoal_time = FloatTime() + TEAM_ACCOMPANY_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 630
;630:					bs->ltgtype = LTG_TEAMACCOMPANY;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 2
ASGNI4
line 631
;631:					bs->formation_dist = 3.5 * 32;		//3.5 meter
ADDRFP4 0
INDIRP4
CNSTI4 7016
ADDP4
CNSTF4 1121976320
ASGNF4
line 633
;632:					//
;633:					BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 634
;634:					bs->owndecision_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CVFI4 4
ASGNI4
line 635
;635:				}
ADDRGP4 $188
JUMPV
LABELV $250
line 636
;636:				else {
line 637
;637:					BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 638
;638:					bs->decisionmaker = bs->client;
ADDRLP4 200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 200
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 200
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 639
;639:					bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 641
;640:					//get the enemy flag
;641:					bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 204
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 204
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
line 643
;642:					//get the flag
;643:					bs->ltgtype = LTG_RETURNFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 6
ASGNI4
line 645
;644:					//set the time the bot will stop getting the flag
;645:					bs->teamgoal_time = FloatTime() + CTF_RETURNFLAG_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 647
;646:					//get an alternative route goal towards the enemy base
;647:					BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 208
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 208
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 649
;648:					//
;649:					BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 650
;650:					bs->owndecision_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CVFI4 4
ASGNI4
line 651
;651:				}
line 652
;652:			}
line 653
;653:		}
line 654
;654:		return;
ADDRGP4 $188
JUMPV
LABELV $244
line 657
;655:	}
;656:	// don't just do something wait for the bot team leader to give orders
;657:	if (BotTeamLeader(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 192
ADDRGP4 BotTeamLeader
CALLI4
ASGNI4
ADDRLP4 192
INDIRI4
CNSTI4 0
EQI4 $252
line 658
;658:		return;
ADDRGP4 $188
JUMPV
LABELV $252
line 661
;659:	}
;660:	// if the bot is ordered to do something
;661:	if ( bs->lastgoal_ltgtype ) {
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $254
line 662
;662:		bs->teamgoal_time += 60;
ADDRLP4 196
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ASGNP4
ADDRLP4 196
INDIRP4
ADDRLP4 196
INDIRP4
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 663
;663:	}
LABELV $254
line 665
;664:	// if the bot decided to do something on it's own and has a last ordered goal
;665:	if ( !bs->ordered && bs->lastgoal_ltgtype ) {
ADDRLP4 196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 196
INDIRP4
CNSTI4 6612
ADDP4
INDIRI4
CNSTI4 0
NEI4 $256
ADDRLP4 196
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $256
line 666
;666:		bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 667
;667:	}
LABELV $256
line 669
;668:	//if already a CTF or team goal
;669:	if (bs->ltgtype == LTG_TEAMHELP ||
ADDRLP4 200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 200
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 1
EQI4 $269
ADDRLP4 200
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 2
EQI4 $269
ADDRLP4 200
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 3
EQI4 $269
ADDRLP4 200
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 4
EQI4 $269
ADDRLP4 200
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 5
EQI4 $269
ADDRLP4 200
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 6
EQI4 $269
ADDRLP4 200
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 8
EQI4 $269
ADDRLP4 200
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 9
EQI4 $269
ADDRLP4 200
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 10
EQI4 $269
ADDRLP4 200
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 14
EQI4 $269
ADDRLP4 200
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 15
NEI4 $258
LABELV $269
line 679
;670:			bs->ltgtype == LTG_TEAMACCOMPANY ||
;671:			bs->ltgtype == LTG_DEFENDKEYAREA ||
;672:			bs->ltgtype == LTG_GETFLAG ||
;673:			bs->ltgtype == LTG_RUSHBASE ||
;674:			bs->ltgtype == LTG_RETURNFLAG ||
;675:			bs->ltgtype == LTG_CAMPORDER ||
;676:			bs->ltgtype == LTG_PATROL ||
;677:			bs->ltgtype == LTG_GETITEM ||
;678:			bs->ltgtype == LTG_MAKELOVE_UNDER ||
;679:			bs->ltgtype == LTG_MAKELOVE_ONTOP) {
line 680
;680:		return;
ADDRGP4 $188
JUMPV
LABELV $258
line 683
;681:	}
;682:	//
;683:	if (BotSetLastOrderedTask(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 204
ADDRGP4 BotSetLastOrderedTask
CALLI4
ASGNI4
ADDRLP4 204
INDIRI4
CNSTI4 0
EQI4 $270
line 684
;684:		return;
ADDRGP4 $188
JUMPV
LABELV $270
line 686
;685:	//
;686:	if (bs->owndecision_time > FloatTime())
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 floattime
INDIRF4
LEF4 $272
line 687
;687:		return;;
ADDRGP4 $188
JUMPV
LABELV $272
line 689
;688:	//if the bot is roaming
;689:	if (bs->ctfroam_time > FloatTime())
ADDRFP4 0
INDIRP4
CNSTI4 6164
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $274
line 690
;690:		return;
ADDRGP4 $188
JUMPV
LABELV $274
line 692
;691:	//if the bot has anough aggression to decide what to do
;692:	if (BotAggression(bs) < 50)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 208
ADDRGP4 BotAggression
CALLF4
ASGNF4
ADDRLP4 208
INDIRF4
CNSTF4 1112014848
GEF4 $276
line 693
;693:		return;
ADDRGP4 $188
JUMPV
LABELV $276
line 695
;694:	//set the time to send a message to the team mates
;695:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 212
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 212
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
line 697
;696:	//
;697:	if (bs->teamtaskpreference & (TEAMTP_ATTACKER|TEAMTP_DEFENDER)) {
ADDRFP4 0
INDIRP4
CNSTI4 6752
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $278
line 698
;698:		if (bs->teamtaskpreference & TEAMTP_ATTACKER) {
ADDRFP4 0
INDIRP4
CNSTI4 6752
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $280
line 699
;699:			l1 = 0.7f;
ADDRLP4 8
CNSTF4 1060320051
ASGNF4
line 700
;700:		}
ADDRGP4 $281
JUMPV
LABELV $280
line 701
;701:		else {
line 702
;702:			l1 = 0.2f;
ADDRLP4 8
CNSTF4 1045220557
ASGNF4
line 703
;703:		}
LABELV $281
line 704
;704:		l2 = 0.9f;
ADDRLP4 12
CNSTF4 1063675494
ASGNF4
line 705
;705:	}
ADDRGP4 $279
JUMPV
LABELV $278
line 706
;706:	else {
line 707
;707:		l1 = 0.4f;
ADDRLP4 8
CNSTF4 1053609165
ASGNF4
line 708
;708:		l2 = 0.7f;
ADDRLP4 12
CNSTF4 1060320051
ASGNF4
line 709
;709:	}
LABELV $279
line 711
;710:	//get the flag or defend the base
;711:	rnd = random();
ADDRLP4 216
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 216
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ASGNF4
line 712
;712:	if (rnd < l1 && ctf_redflag.areanum && ctf_blueflag.areanum) {
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
GEF4 $282
ADDRGP4 ctf_redflag+12
INDIRI4
CNSTI4 0
EQI4 $282
ADDRGP4 ctf_blueflag+12
INDIRI4
CNSTI4 0
EQI4 $282
line 713
;713:		bs->decisionmaker = bs->client;
ADDRLP4 220
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 220
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 220
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 714
;714:		bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 715
;715:		bs->ltgtype = LTG_GETFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 4
ASGNI4
line 717
;716:		//set the time the bot will stop getting the flag
;717:		bs->teamgoal_time = FloatTime() + CTF_GETFLAG_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 719
;718:		//get an alternative route goal towards the enemy base
;719:		BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 224
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 224
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 720
;720:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 721
;721:	}
ADDRGP4 $283
JUMPV
LABELV $282
line 722
;722:	else if (rnd < l2 && ctf_redflag.areanum && ctf_blueflag.areanum) {
ADDRLP4 4
INDIRF4
ADDRLP4 12
INDIRF4
GEF4 $286
ADDRGP4 ctf_redflag+12
INDIRI4
CNSTI4 0
EQI4 $286
ADDRGP4 ctf_blueflag+12
INDIRI4
CNSTI4 0
EQI4 $286
line 723
;723:		bs->decisionmaker = bs->client;
ADDRLP4 220
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 220
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 220
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 724
;724:		bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 726
;725:		//
;726:		if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &ctf_redflag, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 224
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 224
INDIRI4
CNSTI4 1
NEI4 $290
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRGP4 ctf_redflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $291
JUMPV
LABELV $290
line 727
;727:		else memcpy(&bs->teamgoal, &ctf_blueflag, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRGP4 ctf_blueflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
LABELV $291
line 729
;728:		//set the ltg type
;729:		bs->ltgtype = LTG_DEFENDKEYAREA;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 3
ASGNI4
line 731
;730:		//set the time the bot stops defending the base
;731:		bs->teamgoal_time = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 732
;732:		bs->defendaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6144
ADDP4
CNSTF4 0
ASGNF4
line 733
;733:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 734
;734:	}
ADDRGP4 $287
JUMPV
LABELV $286
line 735
;735:	else {
line 736
;736:		bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 738
;737:		//set the time the bot will stop roaming
;738:		bs->ctfroam_time = FloatTime() + CTF_ROAM_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6164
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 739
;739:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 740
;740:	}
LABELV $287
LABELV $283
line 741
;741:	bs->owndecision_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CVFI4 4
ASGNI4
line 745
;742:#ifdef DEBUG
;743:	BotPrintTeamGoal(bs);
;744:#endif //DEBUG
;745:}
LABELV $188
endproc BotCTFSeekGoals 228 12
export BotCTFRetreatGoals
proc BotCTFRetreatGoals 8 4
line 752
;746:
;747:/*
;748:==================
;749:BotCTFRetreatGoals
;750:==================
;751:*/
;752:void BotCTFRetreatGoals(bot_state_t *bs) {
line 754
;753:	//when carrying a flag in ctf the bot should rush to the base
;754:	if (BotCTFCarryingFlag(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $293
line 756
;755:		//if not already rushing to the base
;756:		if (bs->ltgtype != LTG_RUSHBASE) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 5
EQI4 $295
line 757
;757:			BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 758
;758:			bs->ltgtype = LTG_RUSHBASE;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 5
ASGNI4
line 759
;759:			bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 760
;760:			bs->rushbaseaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
CNSTF4 0
ASGNF4
line 761
;761:			bs->decisionmaker = bs->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 762
;762:			bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 763
;763:			BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 764
;764:		}
LABELV $295
line 765
;765:	}
LABELV $293
line 766
;766:}
LABELV $292
endproc BotCTFRetreatGoals 8 4
export Bot1FCTFSeekGoals
proc Bot1FCTFSeekGoals 200 12
line 774
;767:
;768:
;769:/*
;770:==================
;771:Bot1FCTFSeekGoals
;772:==================
;773:*/
;774:void Bot1FCTFSeekGoals(bot_state_t *bs) {
line 780
;775:	aas_entityinfo_t entinfo;
;776:	float rnd, l1, l2;
;777:	int c;
;778:
;779:	//when carrying a flag in ctf the bot should rush to the base
;780:	if (Bot1FCTFCarryingFlag(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 156
ADDRGP4 Bot1FCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 0
EQI4 $298
line 782
;781:		//if not already rushing to the base
;782:		if (bs->ltgtype != LTG_RUSHBASE) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 5
EQI4 $297
line 783
;783:			BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 784
;784:			bs->ltgtype = LTG_RUSHBASE;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 5
ASGNI4
line 785
;785:			bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 786
;786:			bs->rushbaseaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
CNSTF4 0
ASGNF4
line 787
;787:			bs->decisionmaker = bs->client;
ADDRLP4 160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 160
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 160
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 788
;788:			bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 790
;789:			//get an alternative route goal towards the enemy base
;790:			BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 164
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 164
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 792
;791:			//
;792:			BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 793
;793:		}
line 794
;794:		return;
ADDRGP4 $297
JUMPV
LABELV $298
line 797
;795:	}
;796:	// if the bot decided to follow someone
;797:	if ( bs->ltgtype == LTG_TEAMACCOMPANY && !bs->ordered ) {
ADDRLP4 160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 160
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 2
NEI4 $302
ADDRLP4 160
INDIRP4
CNSTI4 6612
ADDP4
INDIRI4
CNSTI4 0
NEI4 $302
line 799
;798:		// if the team mate being accompanied no longer carries the flag
;799:		BotEntityInfo(bs->teammate, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 800
;800:		if (!EntityCarriesFlag(&entinfo)) {
ADDRLP4 12
ARGP4
ADDRLP4 164
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
NEI4 $304
line 801
;801:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 802
;802:		}
LABELV $304
line 803
;803:	}
LABELV $302
line 805
;804:	//our team has the flag
;805:	if (bs->neutralflagstatus == 1) {
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
INDIRI4
CNSTI4 1
NEI4 $306
line 806
;806:		if (bs->owndecision_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 floattime
INDIRF4
GEF4 $297
line 808
;807:			// if not already following someone
;808:			if (bs->ltgtype != LTG_TEAMACCOMPANY) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 2
EQI4 $310
line 810
;809:				//if there is a visible team mate flag carrier
;810:				c = BotTeamFlagCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 164
ADDRGP4 BotTeamFlagCarrierVisible
CALLI4
ASGNI4
ADDRLP4 152
ADDRLP4 164
INDIRI4
ASGNI4
line 811
;811:				if (c >= 0) {
ADDRLP4 152
INDIRI4
CNSTI4 0
LTI4 $312
line 812
;812:					BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 814
;813:					//follow the flag carrier
;814:					bs->decisionmaker = bs->client;
ADDRLP4 168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 168
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 168
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 815
;815:					bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 817
;816:					//the team mate
;817:					bs->teammate = c;
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
ADDRLP4 152
INDIRI4
ASGNI4
line 819
;818:					//last time the team mate was visible
;819:					bs->teammatevisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6748
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 821
;820:					//no message
;821:					bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 823
;822:					//no arrive message
;823:					bs->arrive_time = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
CNSTF4 1065353216
ASGNF4
line 826
;824:					//
;825:					//get the team goal time
;826:					bs->teamgoal_time = FloatTime() + TEAM_ACCOMPANY_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 827
;827:					bs->ltgtype = LTG_TEAMACCOMPANY;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 2
ASGNI4
line 828
;828:					bs->formation_dist = 3.5 * 32;		//3.5 meter
ADDRFP4 0
INDIRP4
CNSTI4 7016
ADDP4
CNSTF4 1121976320
ASGNF4
line 829
;829:					BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 830
;830:					bs->owndecision_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CVFI4 4
ASGNI4
line 831
;831:					return;
ADDRGP4 $297
JUMPV
LABELV $312
line 833
;832:				}
;833:			}
LABELV $310
line 835
;834:			//if already a CTF or team goal
;835:			if (bs->ltgtype == LTG_TEAMHELP ||
ADDRLP4 164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 164
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 1
EQI4 $325
ADDRLP4 164
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 2
EQI4 $325
ADDRLP4 164
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 3
EQI4 $325
ADDRLP4 164
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 4
EQI4 $325
ADDRLP4 164
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 5
EQI4 $325
ADDRLP4 164
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 8
EQI4 $325
ADDRLP4 164
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 9
EQI4 $325
ADDRLP4 164
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 13
EQI4 $325
ADDRLP4 164
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 10
EQI4 $325
ADDRLP4 164
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 14
EQI4 $325
ADDRLP4 164
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 15
NEI4 $314
LABELV $325
line 845
;836:					bs->ltgtype == LTG_TEAMACCOMPANY ||
;837:					bs->ltgtype == LTG_DEFENDKEYAREA ||
;838:					bs->ltgtype == LTG_GETFLAG ||
;839:					bs->ltgtype == LTG_RUSHBASE ||
;840:					bs->ltgtype == LTG_CAMPORDER ||
;841:					bs->ltgtype == LTG_PATROL ||
;842:					bs->ltgtype == LTG_ATTACKENEMYBASE ||
;843:					bs->ltgtype == LTG_GETITEM ||
;844:					bs->ltgtype == LTG_MAKELOVE_UNDER ||
;845:					bs->ltgtype == LTG_MAKELOVE_ONTOP) {
line 846
;846:				return;
ADDRGP4 $297
JUMPV
LABELV $314
line 849
;847:			}
;848:			//if not already attacking the enemy base
;849:			if (bs->ltgtype != LTG_ATTACKENEMYBASE) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 13
EQI4 $297
line 850
;850:				BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 851
;851:				bs->decisionmaker = bs->client;
ADDRLP4 168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 168
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 168
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 852
;852:				bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 854
;853:				//
;854:				if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &ctf_blueflag, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 172
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 1
NEI4 $328
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRGP4 ctf_blueflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $329
JUMPV
LABELV $328
line 855
;855:				else memcpy(&bs->teamgoal, &ctf_redflag, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRGP4 ctf_redflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
LABELV $329
line 857
;856:				//set the ltg type
;857:				bs->ltgtype = LTG_ATTACKENEMYBASE;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 13
ASGNI4
line 859
;858:				//set the time the bot will stop getting the flag
;859:				bs->teamgoal_time = FloatTime() + TEAM_ATTACKENEMYBASE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 860
;860:				BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 861
;861:				bs->owndecision_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CVFI4 4
ASGNI4
line 862
;862:			}
line 863
;863:		}
line 864
;864:		return;
ADDRGP4 $297
JUMPV
LABELV $306
line 867
;865:	}
;866:	//enemy team has the flag
;867:	else if (bs->neutralflagstatus == 2) {
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
INDIRI4
CNSTI4 2
NEI4 $330
line 868
;868:		if (bs->owndecision_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 floattime
INDIRF4
GEF4 $297
line 869
;869:			c = BotEnemyFlagCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 164
ADDRGP4 BotEnemyFlagCarrierVisible
CALLI4
ASGNI4
ADDRLP4 152
ADDRLP4 164
INDIRI4
ASGNI4
line 870
;870:			if (c >= 0) {
ADDRLP4 152
INDIRI4
CNSTI4 0
LTI4 $334
line 872
;871:				//FIXME: attack enemy flag carrier
;872:			}
LABELV $334
line 874
;873:			//if already a CTF or team goal
;874:			if (bs->ltgtype == LTG_TEAMHELP ||
ADDRLP4 168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 168
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 1
EQI4 $341
ADDRLP4 168
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 2
EQI4 $341
ADDRLP4 168
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 8
EQI4 $341
ADDRLP4 168
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 9
EQI4 $341
ADDRLP4 168
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 10
NEI4 $336
LABELV $341
line 878
;875:					bs->ltgtype == LTG_TEAMACCOMPANY ||
;876:					bs->ltgtype == LTG_CAMPORDER ||
;877:					bs->ltgtype == LTG_PATROL ||
;878:					bs->ltgtype == LTG_GETITEM) {
line 879
;879:				return;
ADDRGP4 $297
JUMPV
LABELV $336
line 882
;880:			}
;881:			// if not already defending the base
;882:			if (bs->ltgtype != LTG_DEFENDKEYAREA) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 3
EQI4 $297
line 883
;883:				BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 884
;884:				bs->decisionmaker = bs->client;
ADDRLP4 172
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 172
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 172
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 885
;885:				bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 887
;886:				//
;887:				if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &ctf_redflag, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 176
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 1
NEI4 $344
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRGP4 ctf_redflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $345
JUMPV
LABELV $344
line 888
;888:				else memcpy(&bs->teamgoal, &ctf_blueflag, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRGP4 ctf_blueflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
LABELV $345
line 890
;889:				//set the ltg type
;890:				bs->ltgtype = LTG_DEFENDKEYAREA;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 3
ASGNI4
line 892
;891:				//set the time the bot stops defending the base
;892:				bs->teamgoal_time = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 893
;893:				bs->defendaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6144
ADDP4
CNSTF4 0
ASGNF4
line 894
;894:				BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 895
;895:				bs->owndecision_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CVFI4 4
ASGNI4
line 896
;896:			}
line 897
;897:		}
line 898
;898:		return;
ADDRGP4 $297
JUMPV
LABELV $330
line 901
;899:	}
;900:	// don't just do something wait for the bot team leader to give orders
;901:	if (BotTeamLeader(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 164
ADDRGP4 BotTeamLeader
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
EQI4 $346
line 902
;902:		return;
ADDRGP4 $297
JUMPV
LABELV $346
line 905
;903:	}
;904:	// if the bot is ordered to do something
;905:	if ( bs->lastgoal_ltgtype ) {
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $348
line 906
;906:		bs->teamgoal_time += 60;
ADDRLP4 168
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ASGNP4
ADDRLP4 168
INDIRP4
ADDRLP4 168
INDIRP4
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 907
;907:	}
LABELV $348
line 909
;908:	// if the bot decided to do something on it's own and has a last ordered goal
;909:	if ( !bs->ordered && bs->lastgoal_ltgtype ) {
ADDRLP4 168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 168
INDIRP4
CNSTI4 6612
ADDP4
INDIRI4
CNSTI4 0
NEI4 $350
ADDRLP4 168
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $350
line 910
;910:		bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 911
;911:	}
LABELV $350
line 913
;912:	//if already a CTF or team goal
;913:	if (bs->ltgtype == LTG_TEAMHELP ||
ADDRLP4 172
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 172
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 1
EQI4 $364
ADDRLP4 172
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 2
EQI4 $364
ADDRLP4 172
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 3
EQI4 $364
ADDRLP4 172
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 4
EQI4 $364
ADDRLP4 172
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 5
EQI4 $364
ADDRLP4 172
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 6
EQI4 $364
ADDRLP4 172
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 8
EQI4 $364
ADDRLP4 172
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 9
EQI4 $364
ADDRLP4 172
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 13
EQI4 $364
ADDRLP4 172
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 10
EQI4 $364
ADDRLP4 172
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 14
EQI4 $364
ADDRLP4 172
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 15
NEI4 $352
LABELV $364
line 924
;914:			bs->ltgtype == LTG_TEAMACCOMPANY ||
;915:			bs->ltgtype == LTG_DEFENDKEYAREA ||
;916:			bs->ltgtype == LTG_GETFLAG ||
;917:			bs->ltgtype == LTG_RUSHBASE ||
;918:			bs->ltgtype == LTG_RETURNFLAG ||
;919:			bs->ltgtype == LTG_CAMPORDER ||
;920:			bs->ltgtype == LTG_PATROL ||
;921:			bs->ltgtype == LTG_ATTACKENEMYBASE ||
;922:			bs->ltgtype == LTG_GETITEM ||
;923:			bs->ltgtype == LTG_MAKELOVE_UNDER ||
;924:			bs->ltgtype == LTG_MAKELOVE_ONTOP) {
line 925
;925:		return;
ADDRGP4 $297
JUMPV
LABELV $352
line 928
;926:	}
;927:	//
;928:	if (BotSetLastOrderedTask(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 176
ADDRGP4 BotSetLastOrderedTask
CALLI4
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 0
EQI4 $365
line 929
;929:		return;
ADDRGP4 $297
JUMPV
LABELV $365
line 931
;930:	//
;931:	if (bs->owndecision_time > FloatTime())
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 floattime
INDIRF4
LEF4 $367
line 932
;932:		return;;
ADDRGP4 $297
JUMPV
LABELV $367
line 934
;933:	//if the bot is roaming
;934:	if (bs->ctfroam_time > FloatTime())
ADDRFP4 0
INDIRP4
CNSTI4 6164
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $369
line 935
;935:		return;
ADDRGP4 $297
JUMPV
LABELV $369
line 937
;936:	//if the bot has anough aggression to decide what to do
;937:	if (BotAggression(bs) < 50)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 180
ADDRGP4 BotAggression
CALLF4
ASGNF4
ADDRLP4 180
INDIRF4
CNSTF4 1112014848
GEF4 $371
line 938
;938:		return;
ADDRGP4 $297
JUMPV
LABELV $371
line 940
;939:	//set the time to send a message to the team mates
;940:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 184
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 184
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
line 942
;941:	//
;942:	if (bs->teamtaskpreference & (TEAMTP_ATTACKER|TEAMTP_DEFENDER)) {
ADDRFP4 0
INDIRP4
CNSTI4 6752
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $373
line 943
;943:		if (bs->teamtaskpreference & TEAMTP_ATTACKER) {
ADDRFP4 0
INDIRP4
CNSTI4 6752
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $375
line 944
;944:			l1 = 0.7f;
ADDRLP4 4
CNSTF4 1060320051
ASGNF4
line 945
;945:		}
ADDRGP4 $376
JUMPV
LABELV $375
line 946
;946:		else {
line 947
;947:			l1 = 0.2f;
ADDRLP4 4
CNSTF4 1045220557
ASGNF4
line 948
;948:		}
LABELV $376
line 949
;949:		l2 = 0.9f;
ADDRLP4 8
CNSTF4 1063675494
ASGNF4
line 950
;950:	}
ADDRGP4 $374
JUMPV
LABELV $373
line 951
;951:	else {
line 952
;952:		l1 = 0.4f;
ADDRLP4 4
CNSTF4 1053609165
ASGNF4
line 953
;953:		l2 = 0.7f;
ADDRLP4 8
CNSTF4 1060320051
ASGNF4
line 954
;954:	}
LABELV $374
line 956
;955:	//get the flag or defend the base
;956:	rnd = random();
ADDRLP4 188
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 188
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ASGNF4
line 957
;957:	if (rnd < l1 && ctf_neutralflag.areanum) {
ADDRLP4 0
INDIRF4
ADDRLP4 4
INDIRF4
GEF4 $377
ADDRGP4 ctf_neutralflag+12
INDIRI4
CNSTI4 0
EQI4 $377
line 958
;958:		bs->decisionmaker = bs->client;
ADDRLP4 192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 192
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 192
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 959
;959:		bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 960
;960:		bs->ltgtype = LTG_GETFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 4
ASGNI4
line 962
;961:		//set the time the bot will stop getting the flag
;962:		bs->teamgoal_time = FloatTime() + CTF_GETFLAG_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 963
;963:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 964
;964:	}
ADDRGP4 $378
JUMPV
LABELV $377
line 965
;965:	else if (rnd < l2 && ctf_redflag.areanum && ctf_blueflag.areanum) {
ADDRLP4 0
INDIRF4
ADDRLP4 8
INDIRF4
GEF4 $380
ADDRGP4 ctf_redflag+12
INDIRI4
CNSTI4 0
EQI4 $380
ADDRGP4 ctf_blueflag+12
INDIRI4
CNSTI4 0
EQI4 $380
line 966
;966:		bs->decisionmaker = bs->client;
ADDRLP4 192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 192
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 192
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 967
;967:		bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 969
;968:		//
;969:		if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &ctf_redflag, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 196
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 196
INDIRI4
CNSTI4 1
NEI4 $384
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRGP4 ctf_redflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $385
JUMPV
LABELV $384
line 970
;970:		else memcpy(&bs->teamgoal, &ctf_blueflag, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRGP4 ctf_blueflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
LABELV $385
line 972
;971:		//set the ltg type
;972:		bs->ltgtype = LTG_DEFENDKEYAREA;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 3
ASGNI4
line 974
;973:		//set the time the bot stops defending the base
;974:		bs->teamgoal_time = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 975
;975:		bs->defendaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6144
ADDP4
CNSTF4 0
ASGNF4
line 976
;976:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 977
;977:	}
ADDRGP4 $381
JUMPV
LABELV $380
line 978
;978:	else {
line 979
;979:		bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 981
;980:		//set the time the bot will stop roaming
;981:		bs->ctfroam_time = FloatTime() + CTF_ROAM_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6164
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 982
;982:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 983
;983:	}
LABELV $381
LABELV $378
line 984
;984:	bs->owndecision_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CVFI4 4
ASGNI4
line 988
;985:#ifdef DEBUG
;986:	BotPrintTeamGoal(bs);
;987:#endif //DEBUG
;988:}
LABELV $297
endproc Bot1FCTFSeekGoals 200 12
export Bot1FCTFRetreatGoals
proc Bot1FCTFRetreatGoals 12 8
line 995
;989:
;990:/*
;991:==================
;992:Bot1FCTFRetreatGoals
;993:==================
;994:*/
;995:void Bot1FCTFRetreatGoals(bot_state_t *bs) {
line 997
;996:	//when carrying a flag in ctf the bot should rush to the enemy base
;997:	if (Bot1FCTFCarryingFlag(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 Bot1FCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $387
line 999
;998:		//if not already rushing to the base
;999:		if (bs->ltgtype != LTG_RUSHBASE) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 5
EQI4 $389
line 1000
;1000:			BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 1001
;1001:			bs->ltgtype = LTG_RUSHBASE;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 5
ASGNI4
line 1002
;1002:			bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 1003
;1003:			bs->rushbaseaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
CNSTF4 0
ASGNF4
line 1004
;1004:			bs->decisionmaker = bs->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1005
;1005:			bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 1007
;1006:			//get an alternative route goal towards the enemy base
;1007:			BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 1008
;1008:			BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1009
;1009:		}
LABELV $389
line 1010
;1010:	}
LABELV $387
line 1011
;1011:}
LABELV $386
endproc Bot1FCTFRetreatGoals 12 8
export BotObeliskSeekGoals
proc BotObeliskSeekGoals 48 12
line 1018
;1012:
;1013:/*
;1014:==================
;1015:BotObeliskSeekGoals
;1016:==================
;1017:*/
;1018:void BotObeliskSeekGoals(bot_state_t *bs) {
line 1022
;1019:	float rnd, l1, l2;
;1020:
;1021:	// don't just do something wait for the bot team leader to give orders
;1022:	if (BotTeamLeader(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 BotTeamLeader
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $392
line 1023
;1023:		return;
ADDRGP4 $391
JUMPV
LABELV $392
line 1026
;1024:	}
;1025:	// if the bot is ordered to do something
;1026:	if ( bs->lastgoal_ltgtype ) {
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $394
line 1027
;1027:		bs->teamgoal_time += 60;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 1028
;1028:	}
LABELV $394
line 1030
;1029:	//if already a team goal
;1030:	if (bs->ltgtype == LTG_TEAMHELP ||
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 1
EQI4 $408
ADDRLP4 16
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 2
EQI4 $408
ADDRLP4 16
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 3
EQI4 $408
ADDRLP4 16
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 4
EQI4 $408
ADDRLP4 16
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 5
EQI4 $408
ADDRLP4 16
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 6
EQI4 $408
ADDRLP4 16
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 8
EQI4 $408
ADDRLP4 16
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 9
EQI4 $408
ADDRLP4 16
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 13
EQI4 $408
ADDRLP4 16
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 10
EQI4 $408
ADDRLP4 16
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 14
EQI4 $408
ADDRLP4 16
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 15
NEI4 $396
LABELV $408
line 1041
;1031:			bs->ltgtype == LTG_TEAMACCOMPANY ||
;1032:			bs->ltgtype == LTG_DEFENDKEYAREA ||
;1033:			bs->ltgtype == LTG_GETFLAG ||
;1034:			bs->ltgtype == LTG_RUSHBASE ||
;1035:			bs->ltgtype == LTG_RETURNFLAG ||
;1036:			bs->ltgtype == LTG_CAMPORDER ||
;1037:			bs->ltgtype == LTG_PATROL ||
;1038:			bs->ltgtype == LTG_ATTACKENEMYBASE ||
;1039:			bs->ltgtype == LTG_GETITEM ||
;1040:			bs->ltgtype == LTG_MAKELOVE_UNDER ||
;1041:			bs->ltgtype == LTG_MAKELOVE_ONTOP) {
line 1042
;1042:		return;
ADDRGP4 $391
JUMPV
LABELV $396
line 1045
;1043:	}
;1044:	//
;1045:	if (BotSetLastOrderedTask(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 BotSetLastOrderedTask
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $409
line 1046
;1046:		return;
ADDRGP4 $391
JUMPV
LABELV $409
line 1048
;1047:	//if the bot is roaming
;1048:	if (bs->ctfroam_time > FloatTime())
ADDRFP4 0
INDIRP4
CNSTI4 6164
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $411
line 1049
;1049:		return;
ADDRGP4 $391
JUMPV
LABELV $411
line 1051
;1050:	//if the bot has anough aggression to decide what to do
;1051:	if (BotAggression(bs) < 50)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 BotAggression
CALLF4
ASGNF4
ADDRLP4 24
INDIRF4
CNSTF4 1112014848
GEF4 $413
line 1052
;1052:		return;
ADDRGP4 $391
JUMPV
LABELV $413
line 1054
;1053:	//set the time to send a message to the team mates
;1054:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 28
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 28
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
line 1056
;1055:	//
;1056:	if (bs->teamtaskpreference & (TEAMTP_ATTACKER|TEAMTP_DEFENDER)) {
ADDRFP4 0
INDIRP4
CNSTI4 6752
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $415
line 1057
;1057:		if (bs->teamtaskpreference & TEAMTP_ATTACKER) {
ADDRFP4 0
INDIRP4
CNSTI4 6752
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $417
line 1058
;1058:			l1 = 0.7f;
ADDRLP4 4
CNSTF4 1060320051
ASGNF4
line 1059
;1059:		}
ADDRGP4 $418
JUMPV
LABELV $417
line 1060
;1060:		else {
line 1061
;1061:			l1 = 0.2f;
ADDRLP4 4
CNSTF4 1045220557
ASGNF4
line 1062
;1062:		}
LABELV $418
line 1063
;1063:		l2 = 0.9f;
ADDRLP4 8
CNSTF4 1063675494
ASGNF4
line 1064
;1064:	}
ADDRGP4 $416
JUMPV
LABELV $415
line 1065
;1065:	else {
line 1066
;1066:		l1 = 0.4f;
ADDRLP4 4
CNSTF4 1053609165
ASGNF4
line 1067
;1067:		l2 = 0.7f;
ADDRLP4 8
CNSTF4 1060320051
ASGNF4
line 1068
;1068:	}
LABELV $416
line 1070
;1069:	//get the flag or defend the base
;1070:	rnd = random();
ADDRLP4 32
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 32
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ASGNF4
line 1071
;1071:	if (rnd < l1 && redobelisk.areanum && blueobelisk.areanum) {
ADDRLP4 0
INDIRF4
ADDRLP4 4
INDIRF4
GEF4 $419
ADDRGP4 redobelisk+12
INDIRI4
CNSTI4 0
EQI4 $419
ADDRGP4 blueobelisk+12
INDIRI4
CNSTI4 0
EQI4 $419
line 1072
;1072:		bs->decisionmaker = bs->client;
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1073
;1073:		bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 1075
;1074:		//
;1075:		if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &blueobelisk, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 1
NEI4 $423
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRGP4 blueobelisk
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $424
JUMPV
LABELV $423
line 1076
;1076:		else memcpy(&bs->teamgoal, &redobelisk, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRGP4 redobelisk
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
LABELV $424
line 1078
;1077:		//set the ltg type
;1078:		bs->ltgtype = LTG_ATTACKENEMYBASE;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 13
ASGNI4
line 1080
;1079:		//set the time the bot will stop attacking the enemy base
;1080:		bs->teamgoal_time = FloatTime() + TEAM_ATTACKENEMYBASE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 1082
;1081:		//get an alternate route goal towards the enemy base
;1082:		BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 44
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 1083
;1083:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1084
;1084:	}
ADDRGP4 $420
JUMPV
LABELV $419
line 1085
;1085:	else if (rnd < l2 && redobelisk.areanum && blueobelisk.areanum) {
ADDRLP4 0
INDIRF4
ADDRLP4 8
INDIRF4
GEF4 $425
ADDRGP4 redobelisk+12
INDIRI4
CNSTI4 0
EQI4 $425
ADDRGP4 blueobelisk+12
INDIRI4
CNSTI4 0
EQI4 $425
line 1086
;1086:		bs->decisionmaker = bs->client;
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1087
;1087:		bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 1089
;1088:		//
;1089:		if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &redobelisk, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 1
NEI4 $429
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRGP4 redobelisk
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $430
JUMPV
LABELV $429
line 1090
;1090:		else memcpy(&bs->teamgoal, &blueobelisk, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRGP4 blueobelisk
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
LABELV $430
line 1092
;1091:		//set the ltg type
;1092:		bs->ltgtype = LTG_DEFENDKEYAREA;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 3
ASGNI4
line 1094
;1093:		//set the time the bot stops defending the base
;1094:		bs->teamgoal_time = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 1095
;1095:		bs->defendaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6144
ADDP4
CNSTF4 0
ASGNF4
line 1096
;1096:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1097
;1097:	}
ADDRGP4 $426
JUMPV
LABELV $425
line 1098
;1098:	else {
line 1099
;1099:		bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 1101
;1100:		//set the time the bot will stop roaming
;1101:		bs->ctfroam_time = FloatTime() + CTF_ROAM_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6164
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 1102
;1102:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1103
;1103:	}
LABELV $426
LABELV $420
line 1104
;1104:}
LABELV $391
endproc BotObeliskSeekGoals 48 12
export BotGoHarvest
proc BotGoHarvest 4 12
line 1111
;1105:
;1106:/*
;1107:==================
;1108:BotGoHarvest
;1109:==================
;1110:*/
;1111:void BotGoHarvest(bot_state_t *bs) {
line 1113
;1112:	//
;1113:	if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &blueobelisk, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $432
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRGP4 blueobelisk
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $433
JUMPV
LABELV $432
line 1114
;1114:	else memcpy(&bs->teamgoal, &redobelisk, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRGP4 redobelisk
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
LABELV $433
line 1116
;1115:	//set the ltg type
;1116:	bs->ltgtype = LTG_HARVEST;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 12
ASGNI4
line 1118
;1117:	//set the time the bot will stop harvesting
;1118:	bs->teamgoal_time = FloatTime() + TEAM_HARVEST_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 1119
;1119:	bs->harvestaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6160
ADDP4
CNSTF4 0
ASGNF4
line 1120
;1120:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1121
;1121:}
LABELV $431
endproc BotGoHarvest 4 12
export BotObeliskRetreatGoals
proc BotObeliskRetreatGoals 0 0
line 1128
;1122:
;1123:/*
;1124:==================
;1125:BotObeliskRetreatGoals
;1126:==================
;1127:*/
;1128:void BotObeliskRetreatGoals(bot_state_t *bs) {
line 1130
;1129:	//nothing special
;1130:}
LABELV $434
endproc BotObeliskRetreatGoals 0 0
export BotHarvesterSeekGoals
proc BotHarvesterSeekGoals 200 12
line 1137
;1131:
;1132:/*
;1133:==================
;1134:BotHarvesterSeekGoals
;1135:==================
;1136:*/
;1137:void BotHarvesterSeekGoals(bot_state_t *bs) {
line 1143
;1138:	aas_entityinfo_t entinfo;
;1139:	float rnd, l1, l2;
;1140:	int c;
;1141:
;1142:	//when carrying cubes in harvester the bot should rush to the base
;1143:	if (BotHarvesterCarryingCubes(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 156
ADDRGP4 BotHarvesterCarryingCubes
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 0
EQI4 $436
line 1145
;1144:		//if not already rushing to the base
;1145:		if (bs->ltgtype != LTG_RUSHBASE) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 5
EQI4 $435
line 1146
;1146:			BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 1147
;1147:			bs->ltgtype = LTG_RUSHBASE;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 5
ASGNI4
line 1148
;1148:			bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 1149
;1149:			bs->rushbaseaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
CNSTF4 0
ASGNF4
line 1150
;1150:			bs->decisionmaker = bs->client;
ADDRLP4 160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 160
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 160
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1151
;1151:			bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 1153
;1152:			//get an alternative route goal towards the enemy base
;1153:			BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 164
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 164
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 1155
;1154:			//
;1155:			BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1156
;1156:		}
line 1157
;1157:		return;
ADDRGP4 $435
JUMPV
LABELV $436
line 1160
;1158:	}
;1159:	// don't just do something wait for the bot team leader to give orders
;1160:	if (BotTeamLeader(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 160
ADDRGP4 BotTeamLeader
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
EQI4 $440
line 1161
;1161:		return;
ADDRGP4 $435
JUMPV
LABELV $440
line 1164
;1162:	}
;1163:	// if the bot decided to follow someone
;1164:	if ( bs->ltgtype == LTG_TEAMACCOMPANY && !bs->ordered ) {
ADDRLP4 164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 164
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 2
NEI4 $442
ADDRLP4 164
INDIRP4
CNSTI4 6612
ADDP4
INDIRI4
CNSTI4 0
NEI4 $442
line 1166
;1165:		// if the team mate being accompanied no longer carries the flag
;1166:		BotEntityInfo(bs->teammate, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 1167
;1167:		if (!EntityCarriesCubes(&entinfo)) {
ADDRLP4 16
ARGP4
ADDRLP4 168
ADDRGP4 EntityCarriesCubes
CALLI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 0
NEI4 $444
line 1168
;1168:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 1169
;1169:		}
LABELV $444
line 1170
;1170:	}
LABELV $442
line 1172
;1171:	// if the bot is ordered to do something
;1172:	if ( bs->lastgoal_ltgtype ) {
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $446
line 1173
;1173:		bs->teamgoal_time += 60;
ADDRLP4 168
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ASGNP4
ADDRLP4 168
INDIRP4
ADDRLP4 168
INDIRP4
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 1174
;1174:	}
LABELV $446
line 1176
;1175:	//if not yet doing something
;1176:	if (bs->ltgtype == LTG_TEAMHELP ||
ADDRLP4 168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 168
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 1
EQI4 $459
ADDRLP4 168
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 2
EQI4 $459
ADDRLP4 168
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 3
EQI4 $459
ADDRLP4 168
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 4
EQI4 $459
ADDRLP4 168
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 8
EQI4 $459
ADDRLP4 168
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 9
EQI4 $459
ADDRLP4 168
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 13
EQI4 $459
ADDRLP4 168
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 12
EQI4 $459
ADDRLP4 168
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 10
EQI4 $459
ADDRLP4 168
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 14
EQI4 $459
ADDRLP4 168
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 15
NEI4 $448
LABELV $459
line 1186
;1177:			bs->ltgtype == LTG_TEAMACCOMPANY ||
;1178:			bs->ltgtype == LTG_DEFENDKEYAREA ||
;1179:			bs->ltgtype == LTG_GETFLAG ||
;1180:			bs->ltgtype == LTG_CAMPORDER ||
;1181:			bs->ltgtype == LTG_PATROL ||
;1182:			bs->ltgtype == LTG_ATTACKENEMYBASE ||
;1183:			bs->ltgtype == LTG_HARVEST ||
;1184:			bs->ltgtype == LTG_GETITEM ||
;1185:			bs->ltgtype == LTG_MAKELOVE_UNDER ||
;1186:			bs->ltgtype == LTG_MAKELOVE_ONTOP) {
line 1187
;1187:		return;
ADDRGP4 $435
JUMPV
LABELV $448
line 1190
;1188:	}
;1189:	//
;1190:	if (BotSetLastOrderedTask(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 172
ADDRGP4 BotSetLastOrderedTask
CALLI4
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 0
EQI4 $460
line 1191
;1191:		return;
ADDRGP4 $435
JUMPV
LABELV $460
line 1193
;1192:	//if the bot is roaming
;1193:	if (bs->ctfroam_time > FloatTime())
ADDRFP4 0
INDIRP4
CNSTI4 6164
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $462
line 1194
;1194:		return;
ADDRGP4 $435
JUMPV
LABELV $462
line 1196
;1195:	//if the bot has anough aggression to decide what to do
;1196:	if (BotAggression(bs) < 50)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 176
ADDRGP4 BotAggression
CALLF4
ASGNF4
ADDRLP4 176
INDIRF4
CNSTF4 1112014848
GEF4 $464
line 1197
;1197:		return;
ADDRGP4 $435
JUMPV
LABELV $464
line 1199
;1198:	//set the time to send a message to the team mates
;1199:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 180
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 180
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
line 1201
;1200:	//
;1201:	c = BotEnemyCubeCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 184
ADDRGP4 BotEnemyCubeCarrierVisible
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 184
INDIRI4
ASGNI4
line 1202
;1202:	if (c >= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $466
line 1204
;1203:		//FIXME: attack enemy cube carrier
;1204:	}
LABELV $466
line 1205
;1205:	if (bs->ltgtype != LTG_TEAMACCOMPANY) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 2
EQI4 $468
line 1207
;1206:		//if there is a visible team mate carrying cubes
;1207:		c = BotTeamCubeCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 188
ADDRGP4 BotTeamCubeCarrierVisible
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 188
INDIRI4
ASGNI4
line 1208
;1208:		if (c >= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $470
line 1210
;1209:			//follow the team mate carrying cubes
;1210:			bs->decisionmaker = bs->client;
ADDRLP4 192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 192
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 192
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1211
;1211:			bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 1213
;1212:			//the team mate
;1213:			bs->teammate = c;
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1215
;1214:			//last time the team mate was visible
;1215:			bs->teammatevisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6748
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1217
;1216:			//no message
;1217:			bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 1219
;1218:			//no arrive message
;1219:			bs->arrive_time = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
CNSTF4 1065353216
ASGNF4
line 1222
;1220:			//
;1221:			//get the team goal time
;1222:			bs->teamgoal_time = FloatTime() + TEAM_ACCOMPANY_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 1223
;1223:			bs->ltgtype = LTG_TEAMACCOMPANY;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 2
ASGNI4
line 1224
;1224:			bs->formation_dist = 3.5 * 32;		//3.5 meter
ADDRFP4 0
INDIRP4
CNSTI4 7016
ADDP4
CNSTF4 1121976320
ASGNF4
line 1225
;1225:			BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1226
;1226:			return;
ADDRGP4 $435
JUMPV
LABELV $470
line 1228
;1227:		}
;1228:	}
LABELV $468
line 1230
;1229:	//
;1230:	if (bs->teamtaskpreference & (TEAMTP_ATTACKER|TEAMTP_DEFENDER)) {
ADDRFP4 0
INDIRP4
CNSTI4 6752
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $472
line 1231
;1231:		if (bs->teamtaskpreference & TEAMTP_ATTACKER) {
ADDRFP4 0
INDIRP4
CNSTI4 6752
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $474
line 1232
;1232:			l1 = 0.7f;
ADDRLP4 8
CNSTF4 1060320051
ASGNF4
line 1233
;1233:		}
ADDRGP4 $475
JUMPV
LABELV $474
line 1234
;1234:		else {
line 1235
;1235:			l1 = 0.2f;
ADDRLP4 8
CNSTF4 1045220557
ASGNF4
line 1236
;1236:		}
LABELV $475
line 1237
;1237:		l2 = 0.9f;
ADDRLP4 12
CNSTF4 1063675494
ASGNF4
line 1238
;1238:	}
ADDRGP4 $473
JUMPV
LABELV $472
line 1239
;1239:	else {
line 1240
;1240:		l1 = 0.4f;
ADDRLP4 8
CNSTF4 1053609165
ASGNF4
line 1241
;1241:		l2 = 0.7f;
ADDRLP4 12
CNSTF4 1060320051
ASGNF4
line 1242
;1242:	}
LABELV $473
line 1244
;1243:	//
;1244:	rnd = random();
ADDRLP4 188
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 188
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ASGNF4
line 1245
;1245:	if (rnd < l1 && redobelisk.areanum && blueobelisk.areanum) {
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
GEF4 $476
ADDRGP4 redobelisk+12
INDIRI4
CNSTI4 0
EQI4 $476
ADDRGP4 blueobelisk+12
INDIRI4
CNSTI4 0
EQI4 $476
line 1246
;1246:		bs->decisionmaker = bs->client;
ADDRLP4 192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 192
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 192
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1247
;1247:		bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 1248
;1248:		BotGoHarvest(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotGoHarvest
CALLV
pop
line 1249
;1249:	}
ADDRGP4 $477
JUMPV
LABELV $476
line 1250
;1250:	else if (rnd < l2 && redobelisk.areanum && blueobelisk.areanum) {
ADDRLP4 4
INDIRF4
ADDRLP4 12
INDIRF4
GEF4 $480
ADDRGP4 redobelisk+12
INDIRI4
CNSTI4 0
EQI4 $480
ADDRGP4 blueobelisk+12
INDIRI4
CNSTI4 0
EQI4 $480
line 1251
;1251:		bs->decisionmaker = bs->client;
ADDRLP4 192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 192
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 192
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1252
;1252:		bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 1254
;1253:		//
;1254:		if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &redobelisk, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 196
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 196
INDIRI4
CNSTI4 1
NEI4 $484
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRGP4 redobelisk
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $485
JUMPV
LABELV $484
line 1255
;1255:		else memcpy(&bs->teamgoal, &blueobelisk, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRGP4 blueobelisk
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
LABELV $485
line 1257
;1256:		//set the ltg type
;1257:		bs->ltgtype = LTG_DEFENDKEYAREA;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 3
ASGNI4
line 1259
;1258:		//set the time the bot stops defending the base
;1259:		bs->teamgoal_time = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 1260
;1260:		bs->defendaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6144
ADDP4
CNSTF4 0
ASGNF4
line 1261
;1261:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1262
;1262:	}
ADDRGP4 $481
JUMPV
LABELV $480
line 1263
;1263:	else {
line 1264
;1264:		bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 1266
;1265:		//set the time the bot will stop roaming
;1266:		bs->ctfroam_time = FloatTime() + CTF_ROAM_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6164
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 1267
;1267:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1268
;1268:	}
LABELV $481
LABELV $477
line 1269
;1269:}
LABELV $435
endproc BotHarvesterSeekGoals 200 12
export BotHarvesterRetreatGoals
proc BotHarvesterRetreatGoals 8 4
line 1276
;1270:
;1271:/*
;1272:==================
;1273:BotHarvesterRetreatGoals
;1274:==================
;1275:*/
;1276:void BotHarvesterRetreatGoals(bot_state_t *bs) {
line 1278
;1277:	//when carrying cubes in harvester the bot should rush to the base
;1278:	if (BotHarvesterCarryingCubes(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotHarvesterCarryingCubes
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $487
line 1280
;1279:		//if not already rushing to the base
;1280:		if (bs->ltgtype != LTG_RUSHBASE) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 5
EQI4 $486
line 1281
;1281:			BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 1282
;1282:			bs->ltgtype = LTG_RUSHBASE;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 5
ASGNI4
line 1283
;1283:			bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 1284
;1284:			bs->rushbaseaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
CNSTF4 0
ASGNF4
line 1285
;1285:			bs->decisionmaker = bs->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1286
;1286:			bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 1287
;1287:			BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1288
;1288:		}
line 1289
;1289:		return;
LABELV $487
line 1291
;1290:	}
;1291:}
LABELV $486
endproc BotHarvesterRetreatGoals 8 4
export BotTeamGoals
proc BotTeamGoals 0 4
line 1299
;1292:
;1293:
;1294:/*
;1295:==================
;1296:BotTeamGoals
;1297:==================
;1298:*/
;1299:void BotTeamGoals(bot_state_t *bs, int retreat) {
line 1301
;1300:
;1301:	if ( retreat ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $492
line 1302
;1302:		if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $494
line 1303
;1303:			BotCTFRetreatGoals(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCTFRetreatGoals
CALLV
pop
line 1304
;1304:		}
ADDRGP4 $493
JUMPV
LABELV $494
line 1305
;1305:		else if (gametype == GT_ONEFLAG) {
ADDRGP4 gametype
INDIRI4
CNSTI4 5
NEI4 $496
line 1306
;1306:			Bot1FCTFRetreatGoals(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Bot1FCTFRetreatGoals
CALLV
pop
line 1307
;1307:		}
ADDRGP4 $493
JUMPV
LABELV $496
line 1308
;1308:		else if (gametype == GT_OVERLOAD) {
ADDRGP4 gametype
INDIRI4
CNSTI4 6
NEI4 $498
line 1309
;1309:			BotObeliskRetreatGoals(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotObeliskRetreatGoals
CALLV
pop
line 1310
;1310:		}
ADDRGP4 $493
JUMPV
LABELV $498
line 1311
;1311:		else if (gametype == GT_HARVESTER) {
ADDRGP4 gametype
INDIRI4
CNSTI4 7
NEI4 $493
line 1312
;1312:			BotHarvesterRetreatGoals(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotHarvesterRetreatGoals
CALLV
pop
line 1313
;1313:		}
line 1314
;1314:	}
ADDRGP4 $493
JUMPV
LABELV $492
line 1315
;1315:	else {
line 1316
;1316:		if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $502
line 1318
;1317:			//decide what to do in CTF mode
;1318:			BotCTFSeekGoals(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCTFSeekGoals
CALLV
pop
line 1319
;1319:		}
ADDRGP4 $503
JUMPV
LABELV $502
line 1320
;1320:		else if (gametype == GT_ONEFLAG) {
ADDRGP4 gametype
INDIRI4
CNSTI4 5
NEI4 $504
line 1321
;1321:			Bot1FCTFSeekGoals(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Bot1FCTFSeekGoals
CALLV
pop
line 1322
;1322:		}
ADDRGP4 $505
JUMPV
LABELV $504
line 1323
;1323:		else if (gametype == GT_OVERLOAD) {
ADDRGP4 gametype
INDIRI4
CNSTI4 6
NEI4 $506
line 1324
;1324:			BotObeliskSeekGoals(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotObeliskSeekGoals
CALLV
pop
line 1325
;1325:		}
ADDRGP4 $507
JUMPV
LABELV $506
line 1326
;1326:		else if (gametype == GT_HARVESTER) {
ADDRGP4 gametype
INDIRI4
CNSTI4 7
NEI4 $508
line 1327
;1327:			BotHarvesterSeekGoals(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotHarvesterSeekGoals
CALLV
pop
line 1328
;1328:		}
LABELV $508
LABELV $507
LABELV $505
LABELV $503
line 1329
;1329:	}
LABELV $493
line 1332
;1330:	// reset the order time which is used to see if
;1331:	// we decided to refuse an order
;1332:	bs->order_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
CNSTF4 0
ASGNF4
line 1333
;1333:}
LABELV $491
endproc BotTeamGoals 0 4
export BotPointAreaNum
proc BotPointAreaNum 68 20
line 1340
;1334:
;1335:/*
;1336:==================
;1337:BotPointAreaNum
;1338:==================
;1339:*/
;1340:int BotPointAreaNum(vec3_t origin) {
line 1344
;1341:	int areanum, numareas, areas[10];
;1342:	vec3_t end;
;1343:
;1344:	areanum = trap_AAS_PointAreaNum(origin);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 trap_AAS_PointAreaNum
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 60
INDIRI4
ASGNI4
line 1345
;1345:	if (areanum) return areanum;
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $511
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $510
JUMPV
LABELV $511
line 1346
;1346:	VectorCopy(origin, end);
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 1347
;1347:	end[2] += 10;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1092616192
ADDF4
ASGNF4
line 1348
;1348:	numareas = trap_AAS_TraceAreas(origin, end, areas, NULL, 10);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 20
ARGP4
CNSTP4 0
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 64
ADDRGP4 trap_AAS_TraceAreas
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 64
INDIRI4
ASGNI4
line 1349
;1349:	if (numareas > 0) return areas[0];
ADDRLP4 16
INDIRI4
CNSTI4 0
LEI4 $514
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $510
JUMPV
LABELV $514
line 1350
;1350:	return 0;
CNSTI4 0
RETI4
LABELV $510
endproc BotPointAreaNum 68 20
export ClientName
proc ClientName 1028 12
line 1359
;1351:}
;1352:
;1353:
;1354:/*
;1355:==================
;1356:ClientName
;1357:==================
;1358:*/
;1359:char *ClientName( int client, char *name, int size ) {
line 1362
;1360:	char buf[ MAX_INFO_STRING ];
;1361:
;1362:	if ( (unsigned) client >= MAX_CLIENTS ) {
ADDRFP4 0
INDIRI4
CVIU4 4
CNSTU4 64
LTU4 $517
line 1363
;1363:		BotAI_Print( PRT_ERROR, "ClientName: client out of range\n" );
CNSTI4 3
ARGI4
ADDRGP4 $519
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 1364
;1364:		Q_strncpyz( name, "[client out of range]", size );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $520
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1365
;1365:		return name;
ADDRFP4 4
INDIRP4
RETP4
ADDRGP4 $516
JUMPV
LABELV $517
line 1368
;1366:	}
;1367:
;1368:	trap_GetConfigstring( CS_PLAYERS + client, buf, sizeof( buf ) );
ADDRFP4 0
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
line 1369
;1369:	Q_strncpyz( name, Info_ValueForKey( buf, "n" ), size );
ADDRLP4 0
ARGP4
ADDRGP4 $521
ARGP4
ADDRLP4 1024
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1370
;1370:	Q_CleanStr( name );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1372
;1371:
;1372:	return name;
ADDRFP4 4
INDIRP4
RETP4
LABELV $516
endproc ClientName 1028 12
export ClientSkin
proc ClientSkin 1028 12
line 1381
;1373:}
;1374:
;1375:
;1376:/*
;1377:==================
;1378:ClientSkin
;1379:==================
;1380:*/
;1381:char *ClientSkin( int client, char *skin, int size ) {
line 1384
;1382:	char buf[ MAX_INFO_STRING ];
;1383:
;1384:	if ( (unsigned) client >= MAX_CLIENTS ) {
ADDRFP4 0
INDIRI4
CVIU4 4
CNSTU4 64
LTU4 $523
line 1385
;1385:		BotAI_Print(PRT_ERROR, "ClientSkin: client out of range\n");
CNSTI4 3
ARGI4
ADDRGP4 $525
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 1386
;1386:		return "[client out of range]";
ADDRGP4 $520
RETP4
ADDRGP4 $522
JUMPV
LABELV $523
line 1389
;1387:	}
;1388:
;1389:	trap_GetConfigstring( CS_PLAYERS + client, buf, sizeof( buf ) );
ADDRFP4 0
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
line 1390
;1390:	Q_strncpyz( skin, Info_ValueForKey( buf, "model" ), size );
ADDRLP4 0
ARGP4
ADDRGP4 $526
ARGP4
ADDRLP4 1024
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1392
;1391:
;1392:	return skin;
ADDRFP4 4
INDIRP4
RETP4
LABELV $522
endproc ClientSkin 1028 12
export ClientFromName
proc ClientFromName 1036 12
line 1401
;1393:}
;1394:
;1395:
;1396:/*
;1397:==================
;1398:ClientFromName
;1399:==================
;1400:*/
;1401:int ClientFromName( const char *name ) {
line 1405
;1402:	int i;
;1403:	char buf[ MAX_INFO_STRING ];
;1404:
;1405:	for ( i = 0; i < level.maxclients; i++ ) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $531
JUMPV
LABELV $528
line 1406
;1406:		trap_GetConfigstring( CS_PLAYERS + i, buf, sizeof( buf ) );
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
line 1407
;1407:		Q_CleanStr( buf );
ADDRLP4 0
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1408
;1408:		if ( !Q_stricmp( Info_ValueForKey( buf, "n" ), name ) )
ADDRLP4 0
ARGP4
ADDRGP4 $521
ARGP4
ADDRLP4 1028
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1032
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $533
line 1409
;1409:			return i;
ADDRLP4 1024
INDIRI4
RETI4
ADDRGP4 $527
JUMPV
LABELV $533
line 1410
;1410:	}
LABELV $529
line 1405
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $531
ADDRLP4 1024
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $528
line 1411
;1411:	return -1;
CNSTI4 -1
RETI4
LABELV $527
endproc ClientFromName 1036 12
export ClientOnSameTeamFromName
proc ClientOnSameTeamFromName 1040 12
line 1420
;1412:}
;1413:
;1414:
;1415:/*
;1416:==================
;1417:ClientOnSameTeamFromName
;1418:==================
;1419:*/
;1420:int ClientOnSameTeamFromName( bot_state_t *bs, const char *name ) {
line 1424
;1421:	char buf[MAX_INFO_STRING];
;1422:	int i;
;1423:
;1424:	for ( i = 0; i < level.maxclients; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $539
JUMPV
LABELV $536
line 1425
;1425:		if ( !BotSameTeam( bs, i ) )
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
NEI4 $541
line 1426
;1426:			continue;
ADDRGP4 $537
JUMPV
LABELV $541
line 1427
;1427:		trap_GetConfigstring( CS_PLAYERS + i, buf, sizeof( buf ) );
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
line 1428
;1428:		Q_CleanStr( buf );
ADDRLP4 4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1429
;1429:		if ( !Q_stricmp( Info_ValueForKey( buf, "n" ), name ) )
ADDRLP4 4
ARGP4
ADDRGP4 $521
ARGP4
ADDRLP4 1032
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1032
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $543
line 1430
;1430:			return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $535
JUMPV
LABELV $543
line 1431
;1431:	}
LABELV $537
line 1424
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $539
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $536
line 1433
;1432:
;1433:	return -1;
CNSTI4 -1
RETI4
LABELV $535
endproc ClientOnSameTeamFromName 1040 12
export stristr
proc stristr 12 4
line 1442
;1434:}
;1435:
;1436:
;1437:/*
;1438:==================
;1439:stristr
;1440:==================
;1441:*/
;1442:const char *stristr(const char *str, const char *charset) {
ADDRGP4 $547
JUMPV
LABELV $546
line 1445
;1443:	int i;
;1444:
;1445:	while(*str) {
line 1446
;1446:		for (i = 0; charset[i] && str[i]; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $552
JUMPV
LABELV $549
line 1447
;1447:			if (toupper(charset[i]) != toupper(str[i])) break;
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 4
ADDRGP4 toupper
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8
ADDRGP4 toupper
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $553
ADDRGP4 $551
JUMPV
LABELV $553
line 1448
;1448:		}
LABELV $550
line 1446
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $552
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $555
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $549
LABELV $555
LABELV $551
line 1449
;1449:		if (!charset[i]) return str;
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $556
ADDRFP4 0
INDIRP4
RETP4
ADDRGP4 $545
JUMPV
LABELV $556
line 1450
;1450:		str++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1451
;1451:	}
LABELV $547
line 1445
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $546
line 1452
;1452:	return NULL;
CNSTP4 0
RETP4
LABELV $545
endproc stristr 12 4
export EasyClientName
proc EasyClientName 192 12
line 1461
;1453:}
;1454:
;1455:
;1456:/*
;1457:==================
;1458:EasyClientName
;1459:==================
;1460:*/
;1461:char *EasyClientName(int client, char *buf, int size) {
line 1466
;1462:	int i;
;1463:	char *str1, *str2, *ptr, c;
;1464:	char name[128];
;1465:
;1466:	ClientName( client, name, sizeof( name ) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 5
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1467
;1467:	for (i = 0; name[i]; i++) name[i] &= 127;
ADDRLP4 136
CNSTI4 0
ASGNI4
ADDRGP4 $562
JUMPV
LABELV $559
ADDRLP4 148
ADDRLP4 136
INDIRI4
ADDRLP4 5
ADDP4
ASGNP4
ADDRLP4 148
INDIRP4
ADDRLP4 148
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
BANDI4
CVII1 4
ASGNI1
LABELV $560
ADDRLP4 136
ADDRLP4 136
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $562
ADDRLP4 136
INDIRI4
ADDRLP4 5
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $559
line 1469
;1468:	//remove all spaces
;1469:	for (ptr = strchr(name, ' '); ptr; ptr = strchr(name, ' ')) {
ADDRLP4 5
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 152
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 152
INDIRP4
ASGNP4
ADDRGP4 $566
JUMPV
LABELV $563
line 1470
;1470:		memmove(ptr, ptr+1, strlen(ptr+1)+1);
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 156
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 156
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 1471
;1471:	}
LABELV $564
line 1469
ADDRLP4 5
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 156
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 156
INDIRP4
ASGNP4
LABELV $566
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $563
line 1473
;1472:	//check for [x] and ]x[ clan names
;1473:	str1 = strchr(name, '[');
ADDRLP4 5
ARGP4
CNSTI4 91
ARGI4
ADDRLP4 160
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 140
ADDRLP4 160
INDIRP4
ASGNP4
line 1474
;1474:	str2 = strchr(name, ']');
ADDRLP4 5
ARGP4
CNSTI4 93
ARGI4
ADDRLP4 164
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 144
ADDRLP4 164
INDIRP4
ASGNP4
line 1475
;1475:	if (str1 && str2) {
ADDRLP4 140
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $567
ADDRLP4 144
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $567
line 1476
;1476:		if (str2 > str1) memmove(str1, str2+1, strlen(str2+1)+1);
ADDRLP4 144
INDIRP4
CVPU4 4
ADDRLP4 140
INDIRP4
CVPU4 4
LEU4 $569
ADDRLP4 144
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 168
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 140
INDIRP4
ARGP4
ADDRLP4 144
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 168
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
ADDRGP4 $570
JUMPV
LABELV $569
line 1477
;1477:		else memmove(str2, str1+1, strlen(str1+1)+1);
ADDRLP4 140
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 172
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 144
INDIRP4
ARGP4
ADDRLP4 140
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 172
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
LABELV $570
line 1478
;1478:	}
LABELV $567
line 1480
;1479:	//remove Mr prefix
;1480:	if ((name[0] == 'm' || name[0] == 'M') &&
ADDRLP4 168
ADDRLP4 5
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 109
EQI4 $575
ADDRLP4 168
INDIRI4
CNSTI4 77
NEI4 $571
LABELV $575
ADDRLP4 5+1
INDIRI1
CVII4 1
CNSTI4 114
EQI4 $576
ADDRLP4 5+1
INDIRI1
CVII4 1
CNSTI4 82
NEI4 $571
LABELV $576
line 1481
;1481:			(name[1] == 'r' || name[1] == 'R')) {
line 1482
;1482:		memmove(name, name+2, strlen(name+2)+1);
ADDRLP4 5+2
ARGP4
ADDRLP4 172
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 5
ARGP4
ADDRLP4 5+2
ARGP4
ADDRLP4 172
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 1483
;1483:	}
LABELV $571
line 1485
;1484:	//only allow lower case alphabet characters
;1485:	ptr = name;
ADDRLP4 0
ADDRLP4 5
ASGNP4
ADDRGP4 $580
JUMPV
LABELV $579
line 1486
;1486:	while(*ptr) {
line 1487
;1487:		c = *ptr;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
ASGNI1
line 1488
;1488:		if ((c >= 'a' && c <= 'z') ||
ADDRLP4 172
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 97
LTI4 $585
ADDRLP4 172
INDIRI4
CNSTI4 122
LEI4 $586
LABELV $585
ADDRLP4 176
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 48
LTI4 $587
ADDRLP4 176
INDIRI4
CNSTI4 57
LEI4 $586
LABELV $587
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 95
NEI4 $582
LABELV $586
line 1489
;1489:				(c >= '0' && c <= '9') || c == '_') {
line 1490
;1490:			ptr++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1491
;1491:		}
ADDRGP4 $583
JUMPV
LABELV $582
line 1492
;1492:		else if (c >= 'A' && c <= 'Z') {
ADDRLP4 180
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 65
LTI4 $588
ADDRLP4 180
INDIRI4
CNSTI4 90
GTI4 $588
line 1493
;1493:			*ptr += 'a' - 'A';
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
ADDI4
CVII1 4
ASGNI1
line 1494
;1494:			ptr++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1495
;1495:		}
ADDRGP4 $589
JUMPV
LABELV $588
line 1496
;1496:		else {
line 1497
;1497:			memmove(ptr, ptr+1, strlen(ptr + 1)+1);
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 184
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 184
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 1498
;1498:		}
LABELV $589
LABELV $583
line 1499
;1499:	}
LABELV $580
line 1486
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $579
line 1501
;1500:	
;1501:	Q_strncpyz( buf, name, size );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 5
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1503
;1502:
;1503:	return buf;
ADDRFP4 4
INDIRP4
RETP4
LABELV $558
endproc EasyClientName 192 12
export BotSynonymContext
proc BotSynonymContext 12 4
line 1511
;1504:}
;1505:
;1506:/*
;1507:==================
;1508:BotSynonymContext
;1509:==================
;1510:*/
;1511:int BotSynonymContext(bot_state_t *bs) {
line 1514
;1512:	int context;
;1513:
;1514:	context = CONTEXT_NORMAL|CONTEXT_NEARBYITEM|CONTEXT_NAMES;
ADDRLP4 0
CNSTI4 1027
ASGNI4
line 1516
;1515:	//
;1516:	if ( gametype == GT_CTF || gametype == GT_ONEFLAG ) {
ADDRLP4 4
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 4
EQI4 $593
ADDRLP4 4
INDIRI4
CNSTI4 5
NEI4 $591
LABELV $593
line 1517
;1517:		if (BotTeam(bs) == TEAM_RED) context |= CONTEXT_CTFREDTEAM;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
NEI4 $594
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 4
BORI4
ASGNI4
ADDRGP4 $592
JUMPV
LABELV $594
line 1518
;1518:		else context |= CONTEXT_CTFBLUETEAM;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 1519
;1519:	}
ADDRGP4 $592
JUMPV
LABELV $591
line 1520
;1520:	else if (gametype == GT_OVERLOAD) {
ADDRGP4 gametype
INDIRI4
CNSTI4 6
NEI4 $596
line 1521
;1521:		if (BotTeam(bs) == TEAM_RED) context |= CONTEXT_OBELISKREDTEAM;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
NEI4 $598
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 32
BORI4
ASGNI4
ADDRGP4 $597
JUMPV
LABELV $598
line 1522
;1522:		else context |= CONTEXT_OBELISKBLUETEAM;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 1523
;1523:	}
ADDRGP4 $597
JUMPV
LABELV $596
line 1524
;1524:	else if (gametype == GT_HARVESTER) {
ADDRGP4 gametype
INDIRI4
CNSTI4 7
NEI4 $600
line 1525
;1525:		if (BotTeam(bs) == TEAM_RED) context |= CONTEXT_HARVESTERREDTEAM;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
NEI4 $602
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 128
BORI4
ASGNI4
ADDRGP4 $603
JUMPV
LABELV $602
line 1526
;1526:		else context |= CONTEXT_HARVESTERBLUETEAM;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 256
BORI4
ASGNI4
LABELV $603
line 1527
;1527:	}
LABELV $600
LABELV $597
LABELV $592
line 1528
;1528:	return context;
ADDRLP4 0
INDIRI4
RETI4
LABELV $590
endproc BotSynonymContext 12 4
export BotChooseWeapon
proc BotChooseWeapon 20 8
line 1536
;1529:}
;1530:
;1531:/*
;1532:==================
;1533:BotChooseWeapon
;1534:==================
;1535:*/
;1536:void BotChooseWeapon(bot_state_t *bs) {
line 1539
;1537:	int newweaponnum;
;1538:
;1539:	if (bs->cur_ps.weaponstate == WEAPON_RAISING ||
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 1
EQI4 $607
ADDRLP4 4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 2
NEI4 $605
LABELV $607
line 1540
;1540:			bs->cur_ps.weaponstate == WEAPON_DROPPING) {
line 1541
;1541:		trap_EA_SelectWeapon(bs->client, bs->weaponnum);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_SelectWeapon
CALLV
pop
line 1542
;1542:	}
ADDRGP4 $606
JUMPV
LABELV $605
line 1543
;1543:	else {
line 1544
;1544:		newweaponnum = trap_BotChooseBestFightWeapon(bs->ws, bs->inventory);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 6536
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 4952
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 trap_BotChooseBestFightWeapon
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 1545
;1545:		if (bs->weaponnum != newweaponnum) bs->weaponchange_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $608
ADDRFP4 0
INDIRP4
CNSTI4 6192
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
LABELV $608
line 1546
;1546:		bs->weaponnum = newweaponnum;
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1548
;1547:		//BotAI_Print(PRT_MESSAGE, "bs->weaponnum = %d\n", bs->weaponnum);
;1548:		trap_EA_SelectWeapon(bs->client, bs->weaponnum);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_SelectWeapon
CALLV
pop
line 1549
;1549:	}
LABELV $606
line 1550
;1550:}
LABELV $604
endproc BotChooseWeapon 20 8
export BotSetupForMovement
proc BotSetupForMovement 76 12
line 1557
;1551:
;1552:/*
;1553:==================
;1554:BotSetupForMovement
;1555:==================
;1556:*/
;1557:void BotSetupForMovement(bot_state_t *bs) {
line 1560
;1558:	bot_initmove_t initmove;
;1559:
;1560:	memset(&initmove, 0, sizeof(bot_initmove_t));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 68
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1561
;1561:	VectorCopy(bs->cur_ps.origin, initmove.origin);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 1562
;1562:	VectorCopy(bs->cur_ps.velocity, initmove.velocity);
ADDRLP4 0+12
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRB
ASGNB 12
line 1563
;1563:	VectorClear(initmove.viewoffset);
ADDRLP4 0+24
CNSTF4 0
ASGNF4
ADDRLP4 0+24+4
CNSTF4 0
ASGNF4
ADDRLP4 0+24+8
CNSTF4 0
ASGNF4
line 1564
;1564:	initmove.viewoffset[2] += bs->cur_ps.viewheight;
ADDRLP4 0+24+8
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1565
;1565:	initmove.entitynum = bs->entitynum;
ADDRLP4 0+36
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1566
;1566:	initmove.client = bs->client;
ADDRLP4 0+40
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1567
;1567:	initmove.thinktime = bs->thinktime;
ADDRLP4 0+44
ADDRFP4 0
INDIRP4
CNSTI4 4904
ADDP4
INDIRF4
ASGNF4
line 1569
;1568:	//set the onground flag
;1569:	if (bs->cur_ps.groundEntityNum != ENTITYNUM_NONE) initmove.or_moveflags |= MFL_ONGROUND;
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $622
ADDRLP4 0+64
ADDRLP4 0+64
INDIRI4
CNSTI4 2
BORI4
ASGNI4
LABELV $622
line 1571
;1570:	//set the teleported flag
;1571:	if ((bs->cur_ps.pm_flags & PMF_TIME_KNOCKBACK) && (bs->cur_ps.pm_time > 0)) {
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $625
ADDRLP4 68
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
LEI4 $625
line 1572
;1572:		initmove.or_moveflags |= MFL_TELEPORTED;
ADDRLP4 0+64
ADDRLP4 0+64
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 1573
;1573:	}
LABELV $625
line 1575
;1574:	//set the waterjump flag
;1575:	if ((bs->cur_ps.pm_flags & PMF_TIME_WATERJUMP) && (bs->cur_ps.pm_time > 0)) {
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $628
ADDRLP4 72
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
LEI4 $628
line 1576
;1576:		initmove.or_moveflags |= MFL_WATERJUMP;
ADDRLP4 0+64
ADDRLP4 0+64
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 1577
;1577:	}
LABELV $628
line 1579
;1578:	//set presence type
;1579:	if (bs->cur_ps.pm_flags & PMF_DUCKED) initmove.presencetype = PRESENCE_CROUCH;
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $631
ADDRLP4 0+48
CNSTI4 4
ASGNI4
ADDRGP4 $632
JUMPV
LABELV $631
line 1580
;1580:	else initmove.presencetype = PRESENCE_NORMAL;
ADDRLP4 0+48
CNSTI4 2
ASGNI4
LABELV $632
line 1582
;1581:	//
;1582:	if (bs->walker > 0.5) initmove.or_moveflags |= MFL_WALK;
ADDRFP4 0
INDIRP4
CNSTI4 6056
ADDP4
INDIRF4
CNSTF4 1056964608
LEF4 $635
ADDRLP4 0+64
ADDRLP4 0+64
INDIRI4
CNSTI4 512
BORI4
ASGNI4
LABELV $635
line 1584
;1583:	//
;1584:	VectorCopy(bs->viewangles, initmove.viewangles);
ADDRLP4 0+52
ADDRFP4 0
INDIRP4
CNSTI4 6564
ADDP4
INDIRB
ASGNB 12
line 1586
;1585:	//
;1586:	trap_BotInitMoveState(bs->ms, &initmove);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotInitMoveState
CALLV
pop
line 1587
;1587:}
LABELV $610
endproc BotSetupForMovement 76 12
export BotCheckItemPickup
proc BotCheckItemPickup 28 12
line 1594
;1588:
;1589:/*
;1590:==================
;1591:BotCheckItemPickup
;1592:==================
;1593:*/
;1594:void BotCheckItemPickup(bot_state_t *bs, int *oldinventory) {
line 1597
;1595:	int offence, leader;
;1596:
;1597:	if ( GTx(g_gametype.integer, GTF_TEAMS | GTF_TEAMBASES) )
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
EQI4 $640
line 1598
;1598:		return;
ADDRGP4 $639
JUMPV
LABELV $640
line 1600
;1599:
;1600:	offence = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
line 1602
;1601:	// go into offence if picked up the kamikaze or invulnerability
;1602:	if (!oldinventory[INVENTORY_KAMIKAZE] && bs->inventory[INVENTORY_KAMIKAZE] >= 1) {
ADDRFP4 4
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
CNSTI4 0
NEI4 $644
ADDRFP4 0
INDIRP4
CNSTI4 5080
ADDP4
INDIRI4
CNSTI4 1
LTI4 $644
line 1603
;1603:		offence = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1604
;1604:	}
LABELV $644
line 1605
;1605:	if (!oldinventory[INVENTORY_INVULNERABILITY] && bs->inventory[INVENTORY_INVULNERABILITY] >= 1) {
ADDRFP4 4
INDIRP4
CNSTI4 136
ADDP4
INDIRI4
CNSTI4 0
NEI4 $646
ADDRFP4 0
INDIRP4
CNSTI4 5088
ADDP4
INDIRI4
CNSTI4 1
LTI4 $646
line 1606
;1606:		offence = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1607
;1607:	}
LABELV $646
line 1609
;1608:	// if not already wearing the kamikaze or invulnerability
;1609:	if (!bs->inventory[INVENTORY_KAMIKAZE] && !bs->inventory[INVENTORY_INVULNERABILITY]) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 5080
ADDP4
INDIRI4
CNSTI4 0
NEI4 $648
ADDRLP4 8
INDIRP4
CNSTI4 5088
ADDP4
INDIRI4
CNSTI4 0
NEI4 $648
line 1610
;1610:		if (!oldinventory[INVENTORY_SCOUT] && bs->inventory[INVENTORY_SCOUT] >= 1) {
ADDRFP4 4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 0
NEI4 $650
ADDRFP4 0
INDIRP4
CNSTI4 5116
ADDP4
INDIRI4
CNSTI4 1
LTI4 $650
line 1611
;1611:			offence = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1612
;1612:		}
LABELV $650
line 1613
;1613:		if (!oldinventory[INVENTORY_GUARD] && bs->inventory[INVENTORY_GUARD] >= 1) {
ADDRFP4 4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 0
NEI4 $652
ADDRFP4 0
INDIRP4
CNSTI4 5120
ADDP4
INDIRI4
CNSTI4 1
LTI4 $652
line 1614
;1614:			offence = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1615
;1615:		}
LABELV $652
line 1616
;1616:		if (!oldinventory[INVENTORY_DOUBLER] && bs->inventory[INVENTORY_DOUBLER] >= 1) {
ADDRFP4 4
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
CNSTI4 0
NEI4 $654
ADDRFP4 0
INDIRP4
CNSTI4 5124
ADDP4
INDIRI4
CNSTI4 1
LTI4 $654
line 1617
;1617:			offence = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1618
;1618:		}
LABELV $654
line 1619
;1619:		if (!oldinventory[INVENTORY_AMMOREGEN] && bs->inventory[INVENTORY_AMMOREGEN] >= 1) {
ADDRFP4 4
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 0
NEI4 $656
ADDRFP4 0
INDIRP4
CNSTI4 5128
ADDP4
INDIRI4
CNSTI4 1
LTI4 $656
line 1620
;1620:			offence = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1621
;1621:		}
LABELV $656
line 1622
;1622:	}
LABELV $648
line 1624
;1623:
;1624:	if (offence >= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $658
line 1625
;1625:		leader = ClientFromName(bs->teamleader);
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 1626
;1626:		if (offence) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $660
line 1627
;1627:			if (!(bs->teamtaskpreference & TEAMTP_ATTACKER)) {
ADDRFP4 0
INDIRP4
CNSTI4 6752
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $662
line 1629
;1628:				// if we have a bot team leader
;1629:				if (BotTeamLeader(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 BotTeamLeader
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $664
line 1633
;1630:					// tell the leader we want to be on offence
;1631:					//BotAI_BotInitialChat(bs, "wantoffence", NULL);
;1632:					//trap_BotEnterChat(bs->cs, leader, CHAT_TELL);
;1633:				}
ADDRGP4 $665
JUMPV
LABELV $664
line 1634
;1634:				else if (g_spSkill.integer <= 3) {
ADDRGP4 g_spSkill+12
INDIRI4
CNSTI4 3
GTI4 $666
line 1635
;1635:					if ( bs->ltgtype != LTG_GETFLAG &&
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 4
EQI4 $669
ADDRLP4 20
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 13
EQI4 $669
ADDRLP4 20
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 12
EQI4 $669
line 1637
;1636:						 bs->ltgtype != LTG_ATTACKENEMYBASE &&
;1637:						 bs->ltgtype != LTG_HARVEST ) {
line 1639
;1638:						//
;1639:						if ((gametype != GT_CTF || (bs->redflagstatus == 0 && bs->blueflagstatus == 0)) &&
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $673
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 6956
ADDP4
INDIRI4
CNSTI4 0
NEI4 $671
ADDRLP4 24
INDIRP4
CNSTI4 6960
ADDP4
INDIRI4
CNSTI4 0
NEI4 $671
LABELV $673
ADDRGP4 gametype
INDIRI4
CNSTI4 5
NEI4 $674
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
INDIRI4
CNSTI4 0
NEI4 $671
LABELV $674
line 1640
;1640:								(gametype != GT_ONEFLAG || bs->neutralflagstatus == 0) ) {
line 1642
;1641:							// tell the leader we want to be on offence
;1642:							BotAI_BotInitialChat(bs, "wantoffence", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $675
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1643
;1643:							trap_BotEnterChat(bs->cs, leader, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1644
;1644:						}
LABELV $671
line 1645
;1645:					}
LABELV $669
line 1646
;1646:				}
LABELV $666
LABELV $665
line 1647
;1647:				bs->teamtaskpreference |= TEAMTP_ATTACKER;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 6752
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1648
;1648:			}
LABELV $662
line 1649
;1649:			bs->teamtaskpreference &= ~TEAMTP_DEFENDER;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 6752
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 1650
;1650:		}
ADDRGP4 $661
JUMPV
LABELV $660
line 1651
;1651:		else {
line 1652
;1652:			if (!(bs->teamtaskpreference & TEAMTP_DEFENDER)) {
ADDRFP4 0
INDIRP4
CNSTI4 6752
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $676
line 1654
;1653:				// if we have a bot team leader
;1654:				if (BotTeamLeader(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 BotTeamLeader
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $678
line 1656
;1655:					// tell the leader we want to be on defense
;1656:					BotAI_BotInitialChat(bs, "wantdefence", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $680
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1657
;1657:					trap_BotEnterChat(bs->cs, leader, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1658
;1658:				}
ADDRGP4 $679
JUMPV
LABELV $678
line 1659
;1659:				else if (g_spSkill.integer <= 3) {
ADDRGP4 g_spSkill+12
INDIRI4
CNSTI4 3
GTI4 $681
line 1660
;1660:					if ( bs->ltgtype != LTG_DEFENDKEYAREA ) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 3
EQI4 $684
line 1662
;1661:						//
;1662:						if ((gametype != GT_CTF || (bs->redflagstatus == 0 && bs->blueflagstatus == 0)) &&
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $688
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 6956
ADDP4
INDIRI4
CNSTI4 0
NEI4 $686
ADDRLP4 20
INDIRP4
CNSTI4 6960
ADDP4
INDIRI4
CNSTI4 0
NEI4 $686
LABELV $688
ADDRGP4 gametype
INDIRI4
CNSTI4 5
NEI4 $689
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
INDIRI4
CNSTI4 0
NEI4 $686
LABELV $689
line 1663
;1663:							(gametype != GT_ONEFLAG || bs->neutralflagstatus == 0) ) {
line 1665
;1664:							// tell the leader we want to be on defense
;1665:							BotAI_BotInitialChat(bs, "wantdefence", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $680
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1666
;1666:							trap_BotEnterChat(bs->cs, leader, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1667
;1667:						}
LABELV $686
line 1668
;1668:					}
LABELV $684
line 1669
;1669:				}
LABELV $681
LABELV $679
line 1670
;1670:				bs->teamtaskpreference |= TEAMTP_DEFENDER;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 6752
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 1671
;1671:			}
LABELV $676
line 1672
;1672:			bs->teamtaskpreference &= ~TEAMTP_ATTACKER;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 6752
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 -3
BANDI4
ASGNI4
line 1673
;1673:		}
LABELV $661
line 1674
;1674:	}
LABELV $658
line 1675
;1675:}
LABELV $639
endproc BotCheckItemPickup 28 12
export BotUpdateInventory
proc BotUpdateInventory 1332 12
line 1682
;1676:
;1677:/*
;1678:==================
;1679:BotUpdateInventory
;1680:==================
;1681:*/
;1682:void BotUpdateInventory(bot_state_t *bs) {
line 1685
;1683:	int oldinventory[MAX_ITEMS];
;1684:
;1685:	memcpy(oldinventory, bs->inventory, sizeof(oldinventory));
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 4952
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1687
;1686:	//armor
;1687:	bs->inventory[INVENTORY_ARMOR] = bs->cur_ps.stats[STAT_ARMOR];
ADDRLP4 1024
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1024
INDIRP4
CNSTI4 4956
ADDP4
ADDRLP4 1024
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ASGNI4
line 1689
;1688:	//weapons
;1689:	bs->inventory[INVENTORY_GAUNTLET] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_GAUNTLET)) != 0;
ADDRLP4 1032
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1032
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $692
ADDRLP4 1028
CNSTI4 1
ASGNI4
ADDRGP4 $693
JUMPV
LABELV $692
ADDRLP4 1028
CNSTI4 0
ASGNI4
LABELV $693
ADDRLP4 1032
INDIRP4
CNSTI4 4968
ADDP4
ADDRLP4 1028
INDIRI4
ASGNI4
line 1690
;1690:	bs->inventory[INVENTORY_SHOTGUN] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_SHOTGUN)) != 0;
ADDRLP4 1040
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1040
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $695
ADDRLP4 1036
CNSTI4 1
ASGNI4
ADDRGP4 $696
JUMPV
LABELV $695
ADDRLP4 1036
CNSTI4 0
ASGNI4
LABELV $696
ADDRLP4 1040
INDIRP4
CNSTI4 4972
ADDP4
ADDRLP4 1036
INDIRI4
ASGNI4
line 1691
;1691:	bs->inventory[INVENTORY_MACHINEGUN] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_MACHINEGUN)) != 0;
ADDRLP4 1048
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1048
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $698
ADDRLP4 1044
CNSTI4 1
ASGNI4
ADDRGP4 $699
JUMPV
LABELV $698
ADDRLP4 1044
CNSTI4 0
ASGNI4
LABELV $699
ADDRLP4 1048
INDIRP4
CNSTI4 4976
ADDP4
ADDRLP4 1044
INDIRI4
ASGNI4
line 1692
;1692:	bs->inventory[INVENTORY_GRENADELAUNCHER] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_GRENADE_LAUNCHER)) != 0;
ADDRLP4 1056
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1056
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $701
ADDRLP4 1052
CNSTI4 1
ASGNI4
ADDRGP4 $702
JUMPV
LABELV $701
ADDRLP4 1052
CNSTI4 0
ASGNI4
LABELV $702
ADDRLP4 1056
INDIRP4
CNSTI4 4980
ADDP4
ADDRLP4 1052
INDIRI4
ASGNI4
line 1693
;1693:	bs->inventory[INVENTORY_ROCKETLAUNCHER] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_ROCKET_LAUNCHER)) != 0;
ADDRLP4 1064
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1064
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $704
ADDRLP4 1060
CNSTI4 1
ASGNI4
ADDRGP4 $705
JUMPV
LABELV $704
ADDRLP4 1060
CNSTI4 0
ASGNI4
LABELV $705
ADDRLP4 1064
INDIRP4
CNSTI4 4984
ADDP4
ADDRLP4 1060
INDIRI4
ASGNI4
line 1694
;1694:	bs->inventory[INVENTORY_LIGHTNING] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_LIGHTNING)) != 0;
ADDRLP4 1072
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1072
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $707
ADDRLP4 1068
CNSTI4 1
ASGNI4
ADDRGP4 $708
JUMPV
LABELV $707
ADDRLP4 1068
CNSTI4 0
ASGNI4
LABELV $708
ADDRLP4 1072
INDIRP4
CNSTI4 4988
ADDP4
ADDRLP4 1068
INDIRI4
ASGNI4
line 1695
;1695:	bs->inventory[INVENTORY_RAILGUN] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_RAILGUN)) != 0;
ADDRLP4 1080
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1080
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $710
ADDRLP4 1076
CNSTI4 1
ASGNI4
ADDRGP4 $711
JUMPV
LABELV $710
ADDRLP4 1076
CNSTI4 0
ASGNI4
LABELV $711
ADDRLP4 1080
INDIRP4
CNSTI4 4992
ADDP4
ADDRLP4 1076
INDIRI4
ASGNI4
line 1696
;1696:	bs->inventory[INVENTORY_PLASMAGUN] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_PLASMAGUN)) != 0;
ADDRLP4 1088
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1088
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $713
ADDRLP4 1084
CNSTI4 1
ASGNI4
ADDRGP4 $714
JUMPV
LABELV $713
ADDRLP4 1084
CNSTI4 0
ASGNI4
LABELV $714
ADDRLP4 1088
INDIRP4
CNSTI4 4996
ADDP4
ADDRLP4 1084
INDIRI4
ASGNI4
line 1697
;1697:	bs->inventory[INVENTORY_BFG10K] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_BFG)) != 0;
ADDRLP4 1096
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1096
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $716
ADDRLP4 1092
CNSTI4 1
ASGNI4
ADDRGP4 $717
JUMPV
LABELV $716
ADDRLP4 1092
CNSTI4 0
ASGNI4
LABELV $717
ADDRLP4 1096
INDIRP4
CNSTI4 5004
ADDP4
ADDRLP4 1092
INDIRI4
ASGNI4
line 1698
;1698:	bs->inventory[INVENTORY_GRAPPLINGHOOK] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_GRAPPLING_HOOK)) != 0;
ADDRLP4 1104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1104
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $719
ADDRLP4 1100
CNSTI4 1
ASGNI4
ADDRGP4 $720
JUMPV
LABELV $719
ADDRLP4 1100
CNSTI4 0
ASGNI4
LABELV $720
ADDRLP4 1104
INDIRP4
CNSTI4 5008
ADDP4
ADDRLP4 1100
INDIRI4
ASGNI4
line 1699
;1699:	bs->inventory[INVENTORY_NAILGUN] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_NAILGUN)) != 0;
ADDRLP4 1112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1112
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $722
ADDRLP4 1108
CNSTI4 1
ASGNI4
ADDRGP4 $723
JUMPV
LABELV $722
ADDRLP4 1108
CNSTI4 0
ASGNI4
LABELV $723
ADDRLP4 1112
INDIRP4
CNSTI4 5012
ADDP4
ADDRLP4 1108
INDIRI4
ASGNI4
line 1700
;1700:	bs->inventory[INVENTORY_PROXLAUNCHER] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_PROX_LAUNCHER)) != 0;
ADDRLP4 1120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1120
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $725
ADDRLP4 1116
CNSTI4 1
ASGNI4
ADDRGP4 $726
JUMPV
LABELV $725
ADDRLP4 1116
CNSTI4 0
ASGNI4
LABELV $726
ADDRLP4 1120
INDIRP4
CNSTI4 5016
ADDP4
ADDRLP4 1116
INDIRI4
ASGNI4
line 1701
;1701:	bs->inventory[INVENTORY_CHAINGUN] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_CHAINGUN)) != 0;
ADDRLP4 1128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1128
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $728
ADDRLP4 1124
CNSTI4 1
ASGNI4
ADDRGP4 $729
JUMPV
LABELV $728
ADDRLP4 1124
CNSTI4 0
ASGNI4
LABELV $729
ADDRLP4 1128
INDIRP4
CNSTI4 5020
ADDP4
ADDRLP4 1124
INDIRI4
ASGNI4
line 1703
;1702:	//ammo
;1703:	bs->inventory[INVENTORY_SHELLS] = bs->cur_ps.ammo[WP_SHOTGUN];
ADDRLP4 1132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1132
INDIRP4
CNSTI4 5024
ADDP4
ADDRLP4 1132
INDIRP4
CNSTI4 404
ADDP4
INDIRI4
ASGNI4
line 1704
;1704:	bs->inventory[INVENTORY_BULLETS] = bs->cur_ps.ammo[WP_MACHINEGUN];
ADDRLP4 1136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1136
INDIRP4
CNSTI4 5028
ADDP4
ADDRLP4 1136
INDIRP4
CNSTI4 400
ADDP4
INDIRI4
ASGNI4
line 1705
;1705:	bs->inventory[INVENTORY_GRENADES] = bs->cur_ps.ammo[WP_GRENADE_LAUNCHER];
ADDRLP4 1140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140
INDIRP4
CNSTI4 5032
ADDP4
ADDRLP4 1140
INDIRP4
CNSTI4 408
ADDP4
INDIRI4
ASGNI4
line 1706
;1706:	bs->inventory[INVENTORY_CELLS] = bs->cur_ps.ammo[WP_PLASMAGUN];
ADDRLP4 1144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1144
INDIRP4
CNSTI4 5036
ADDP4
ADDRLP4 1144
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
ASGNI4
line 1707
;1707:	bs->inventory[INVENTORY_LIGHTNINGAMMO] = bs->cur_ps.ammo[WP_LIGHTNING];
ADDRLP4 1148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1148
INDIRP4
CNSTI4 5040
ADDP4
ADDRLP4 1148
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
ASGNI4
line 1708
;1708:	bs->inventory[INVENTORY_ROCKETS] = bs->cur_ps.ammo[WP_ROCKET_LAUNCHER];
ADDRLP4 1152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1152
INDIRP4
CNSTI4 5044
ADDP4
ADDRLP4 1152
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ASGNI4
line 1709
;1709:	bs->inventory[INVENTORY_SLUGS] = bs->cur_ps.ammo[WP_RAILGUN];
ADDRLP4 1156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1156
INDIRP4
CNSTI4 5048
ADDP4
ADDRLP4 1156
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
ASGNI4
line 1710
;1710:	bs->inventory[INVENTORY_BFGAMMO] = bs->cur_ps.ammo[WP_BFG];
ADDRLP4 1160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1160
INDIRP4
CNSTI4 5052
ADDP4
ADDRLP4 1160
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
ASGNI4
line 1711
;1711:	bs->inventory[INVENTORY_NAILS] = bs->cur_ps.ammo[WP_NAILGUN];
ADDRLP4 1164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1164
INDIRP4
CNSTI4 5056
ADDP4
ADDRLP4 1164
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
ASGNI4
line 1712
;1712:	bs->inventory[INVENTORY_MINES] = bs->cur_ps.ammo[WP_PROX_LAUNCHER];
ADDRLP4 1168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1168
INDIRP4
CNSTI4 5060
ADDP4
ADDRLP4 1168
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
ASGNI4
line 1713
;1713:	bs->inventory[INVENTORY_BELT] = bs->cur_ps.ammo[WP_CHAINGUN];
ADDRLP4 1172
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1172
INDIRP4
CNSTI4 5064
ADDP4
ADDRLP4 1172
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
ASGNI4
line 1715
;1714:	//powerups
;1715:	bs->inventory[INVENTORY_HEALTH] = bs->cur_ps.stats[STAT_HEALTH];
ADDRLP4 1176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1176
INDIRP4
CNSTI4 5068
ADDP4
ADDRLP4 1176
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ASGNI4
line 1716
;1716:	bs->inventory[INVENTORY_TELEPORTER] = bs->cur_ps.stats[STAT_HOLDABLE_ITEM] == MODELINDEX_TELEPORTER;
ADDRLP4 1184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1184
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 26
NEI4 $731
ADDRLP4 1180
CNSTI4 1
ASGNI4
ADDRGP4 $732
JUMPV
LABELV $731
ADDRLP4 1180
CNSTI4 0
ASGNI4
LABELV $732
ADDRLP4 1184
INDIRP4
CNSTI4 5072
ADDP4
ADDRLP4 1180
INDIRI4
ASGNI4
line 1717
;1717:	bs->inventory[INVENTORY_MEDKIT] = bs->cur_ps.stats[STAT_HOLDABLE_ITEM] == MODELINDEX_MEDKIT;
ADDRLP4 1192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1192
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 27
NEI4 $734
ADDRLP4 1188
CNSTI4 1
ASGNI4
ADDRGP4 $735
JUMPV
LABELV $734
ADDRLP4 1188
CNSTI4 0
ASGNI4
LABELV $735
ADDRLP4 1192
INDIRP4
CNSTI4 5076
ADDP4
ADDRLP4 1188
INDIRI4
ASGNI4
line 1718
;1718:	bs->inventory[INVENTORY_KAMIKAZE] = bs->cur_ps.stats[STAT_HOLDABLE_ITEM] == MODELINDEX_KAMIKAZE;
ADDRLP4 1200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1200
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 36
NEI4 $737
ADDRLP4 1196
CNSTI4 1
ASGNI4
ADDRGP4 $738
JUMPV
LABELV $737
ADDRLP4 1196
CNSTI4 0
ASGNI4
LABELV $738
ADDRLP4 1200
INDIRP4
CNSTI4 5080
ADDP4
ADDRLP4 1196
INDIRI4
ASGNI4
line 1719
;1719:	bs->inventory[INVENTORY_PORTAL] = bs->cur_ps.stats[STAT_HOLDABLE_ITEM] == MODELINDEX_PORTAL;
ADDRLP4 1208
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1208
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 37
NEI4 $740
ADDRLP4 1204
CNSTI4 1
ASGNI4
ADDRGP4 $741
JUMPV
LABELV $740
ADDRLP4 1204
CNSTI4 0
ASGNI4
LABELV $741
ADDRLP4 1208
INDIRP4
CNSTI4 5084
ADDP4
ADDRLP4 1204
INDIRI4
ASGNI4
line 1720
;1720:	bs->inventory[INVENTORY_INVULNERABILITY] = bs->cur_ps.stats[STAT_HOLDABLE_ITEM] == MODELINDEX_INVULNERABILITY;
ADDRLP4 1216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1216
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 38
NEI4 $743
ADDRLP4 1212
CNSTI4 1
ASGNI4
ADDRGP4 $744
JUMPV
LABELV $743
ADDRLP4 1212
CNSTI4 0
ASGNI4
LABELV $744
ADDRLP4 1216
INDIRP4
CNSTI4 5088
ADDP4
ADDRLP4 1212
INDIRI4
ASGNI4
line 1721
;1721:	bs->inventory[INVENTORY_QUAD] = bs->cur_ps.powerups[PW_QUAD] != 0;
ADDRLP4 1224
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1224
INDIRP4
CNSTI4 332
ADDP4
INDIRI4
CNSTI4 0
EQI4 $746
ADDRLP4 1220
CNSTI4 1
ASGNI4
ADDRGP4 $747
JUMPV
LABELV $746
ADDRLP4 1220
CNSTI4 0
ASGNI4
LABELV $747
ADDRLP4 1224
INDIRP4
CNSTI4 5092
ADDP4
ADDRLP4 1220
INDIRI4
ASGNI4
line 1722
;1722:	bs->inventory[INVENTORY_ENVIRONMENTSUIT] = bs->cur_ps.powerups[PW_BATTLESUIT] != 0;
ADDRLP4 1232
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1232
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
CNSTI4 0
EQI4 $749
ADDRLP4 1228
CNSTI4 1
ASGNI4
ADDRGP4 $750
JUMPV
LABELV $749
ADDRLP4 1228
CNSTI4 0
ASGNI4
LABELV $750
ADDRLP4 1232
INDIRP4
CNSTI4 5096
ADDP4
ADDRLP4 1228
INDIRI4
ASGNI4
line 1723
;1723:	bs->inventory[INVENTORY_HASTE] = bs->cur_ps.powerups[PW_HASTE] != 0;
ADDRLP4 1240
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1240
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $752
ADDRLP4 1236
CNSTI4 1
ASGNI4
ADDRGP4 $753
JUMPV
LABELV $752
ADDRLP4 1236
CNSTI4 0
ASGNI4
LABELV $753
ADDRLP4 1240
INDIRP4
CNSTI4 5100
ADDP4
ADDRLP4 1236
INDIRI4
ASGNI4
line 1724
;1724:	bs->inventory[INVENTORY_INVISIBILITY] = bs->cur_ps.powerups[PW_INVIS] != 0;
ADDRLP4 1248
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1248
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $755
ADDRLP4 1244
CNSTI4 1
ASGNI4
ADDRGP4 $756
JUMPV
LABELV $755
ADDRLP4 1244
CNSTI4 0
ASGNI4
LABELV $756
ADDRLP4 1248
INDIRP4
CNSTI4 5104
ADDP4
ADDRLP4 1244
INDIRI4
ASGNI4
line 1725
;1725:	bs->inventory[INVENTORY_REGEN] = bs->cur_ps.powerups[PW_REGEN] != 0;
ADDRLP4 1256
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1256
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $758
ADDRLP4 1252
CNSTI4 1
ASGNI4
ADDRGP4 $759
JUMPV
LABELV $758
ADDRLP4 1252
CNSTI4 0
ASGNI4
LABELV $759
ADDRLP4 1256
INDIRP4
CNSTI4 5108
ADDP4
ADDRLP4 1252
INDIRI4
ASGNI4
line 1726
;1726:	bs->inventory[INVENTORY_FLIGHT] = bs->cur_ps.powerups[PW_FLIGHT] != 0;
ADDRLP4 1264
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1264
INDIRP4
CNSTI4 352
ADDP4
INDIRI4
CNSTI4 0
EQI4 $761
ADDRLP4 1260
CNSTI4 1
ASGNI4
ADDRGP4 $762
JUMPV
LABELV $761
ADDRLP4 1260
CNSTI4 0
ASGNI4
LABELV $762
ADDRLP4 1264
INDIRP4
CNSTI4 5112
ADDP4
ADDRLP4 1260
INDIRI4
ASGNI4
line 1727
;1727:	bs->inventory[INVENTORY_SCOUT] = bs->cur_ps.stats[STAT_PERSISTANT_POWERUP] == MODELINDEX_SCOUT;
ADDRLP4 1272
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1272
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 42
NEI4 $764
ADDRLP4 1268
CNSTI4 1
ASGNI4
ADDRGP4 $765
JUMPV
LABELV $764
ADDRLP4 1268
CNSTI4 0
ASGNI4
LABELV $765
ADDRLP4 1272
INDIRP4
CNSTI4 5116
ADDP4
ADDRLP4 1268
INDIRI4
ASGNI4
line 1728
;1728:	bs->inventory[INVENTORY_GUARD] = bs->cur_ps.stats[STAT_PERSISTANT_POWERUP] == MODELINDEX_GUARD;
ADDRLP4 1280
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1280
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 43
NEI4 $767
ADDRLP4 1276
CNSTI4 1
ASGNI4
ADDRGP4 $768
JUMPV
LABELV $767
ADDRLP4 1276
CNSTI4 0
ASGNI4
LABELV $768
ADDRLP4 1280
INDIRP4
CNSTI4 5120
ADDP4
ADDRLP4 1276
INDIRI4
ASGNI4
line 1729
;1729:	bs->inventory[INVENTORY_DOUBLER] = bs->cur_ps.stats[STAT_PERSISTANT_POWERUP] == MODELINDEX_DOUBLER;
ADDRLP4 1288
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1288
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 44
NEI4 $770
ADDRLP4 1284
CNSTI4 1
ASGNI4
ADDRGP4 $771
JUMPV
LABELV $770
ADDRLP4 1284
CNSTI4 0
ASGNI4
LABELV $771
ADDRLP4 1288
INDIRP4
CNSTI4 5124
ADDP4
ADDRLP4 1284
INDIRI4
ASGNI4
line 1730
;1730:	bs->inventory[INVENTORY_AMMOREGEN] = bs->cur_ps.stats[STAT_PERSISTANT_POWERUP] == MODELINDEX_AMMOREGEN;
ADDRLP4 1296
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1296
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 45
NEI4 $773
ADDRLP4 1292
CNSTI4 1
ASGNI4
ADDRGP4 $774
JUMPV
LABELV $773
ADDRLP4 1292
CNSTI4 0
ASGNI4
LABELV $774
ADDRLP4 1296
INDIRP4
CNSTI4 5128
ADDP4
ADDRLP4 1292
INDIRI4
ASGNI4
line 1731
;1731:	bs->inventory[INVENTORY_REDFLAG] = bs->cur_ps.powerups[PW_REDFLAG] != 0;
ADDRLP4 1304
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1304
INDIRP4
CNSTI4 356
ADDP4
INDIRI4
CNSTI4 0
EQI4 $776
ADDRLP4 1300
CNSTI4 1
ASGNI4
ADDRGP4 $777
JUMPV
LABELV $776
ADDRLP4 1300
CNSTI4 0
ASGNI4
LABELV $777
ADDRLP4 1304
INDIRP4
CNSTI4 5132
ADDP4
ADDRLP4 1300
INDIRI4
ASGNI4
line 1732
;1732:	bs->inventory[INVENTORY_BLUEFLAG] = bs->cur_ps.powerups[PW_BLUEFLAG] != 0;
ADDRLP4 1312
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1312
INDIRP4
CNSTI4 360
ADDP4
INDIRI4
CNSTI4 0
EQI4 $779
ADDRLP4 1308
CNSTI4 1
ASGNI4
ADDRGP4 $780
JUMPV
LABELV $779
ADDRLP4 1308
CNSTI4 0
ASGNI4
LABELV $780
ADDRLP4 1312
INDIRP4
CNSTI4 5136
ADDP4
ADDRLP4 1308
INDIRI4
ASGNI4
line 1733
;1733:	bs->inventory[INVENTORY_NEUTRALFLAG] = bs->cur_ps.powerups[PW_NEUTRALFLAG] != 0;
ADDRLP4 1320
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1320
INDIRP4
CNSTI4 364
ADDP4
INDIRI4
CNSTI4 0
EQI4 $782
ADDRLP4 1316
CNSTI4 1
ASGNI4
ADDRGP4 $783
JUMPV
LABELV $782
ADDRLP4 1316
CNSTI4 0
ASGNI4
LABELV $783
ADDRLP4 1320
INDIRP4
CNSTI4 5140
ADDP4
ADDRLP4 1316
INDIRI4
ASGNI4
line 1734
;1734:	if (BotTeam(bs) == TEAM_RED) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1324
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 1324
INDIRI4
CNSTI4 1
NEI4 $784
line 1735
;1735:		bs->inventory[INVENTORY_REDCUBE] = bs->cur_ps.generic1;
ADDRLP4 1328
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1328
INDIRP4
CNSTI4 5144
ADDP4
ADDRLP4 1328
INDIRP4
CNSTI4 456
ADDP4
INDIRI4
ASGNI4
line 1736
;1736:		bs->inventory[INVENTORY_BLUECUBE] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 5148
ADDP4
CNSTI4 0
ASGNI4
line 1737
;1737:	} else {
ADDRGP4 $785
JUMPV
LABELV $784
line 1738
;1738:		bs->inventory[INVENTORY_REDCUBE] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 5144
ADDP4
CNSTI4 0
ASGNI4
line 1739
;1739:		bs->inventory[INVENTORY_BLUECUBE] = bs->cur_ps.generic1;
ADDRLP4 1328
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1328
INDIRP4
CNSTI4 5148
ADDP4
ADDRLP4 1328
INDIRP4
CNSTI4 456
ADDP4
INDIRI4
ASGNI4
line 1740
;1740:	}
LABELV $785
line 1741
;1741:	BotCheckItemPickup(bs, oldinventory);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotCheckItemPickup
CALLV
pop
line 1742
;1742:}
LABELV $690
endproc BotUpdateInventory 1332 12
export BotUpdateBattleInventory
proc BotUpdateBattleInventory 160 8
line 1749
;1743:
;1744:/*
;1745:==================
;1746:BotUpdateBattleInventory
;1747:==================
;1748:*/
;1749:void BotUpdateBattleInventory(bot_state_t *bs, int enemy) {
line 1753
;1750:	vec3_t dir;
;1751:	aas_entityinfo_t entinfo;
;1752:
;1753:	BotEntityInfo(enemy, &entinfo);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 1754
;1754:	VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12+24
INDIRF4
ADDRLP4 152
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 12+24+4
INDIRF4
ADDRLP4 152
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 12+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1755
;1755:	bs->inventory[ENEMY_HEIGHT] = (int) dir[2];
ADDRFP4 0
INDIRP4
CNSTI4 5756
ADDP4
ADDRLP4 0+8
INDIRF4
CVFI4 4
ASGNI4
line 1756
;1756:	dir[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1757
;1757:	bs->inventory[ENEMY_HORIZONTAL_DIST] = (int) VectorLength(dir);
ADDRLP4 0
ARGP4
ADDRLP4 156
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 5752
ADDP4
ADDRLP4 156
INDIRF4
CVFI4 4
ASGNI4
line 1759
;1758:	//FIXME: add num visible enemies and num visible team mates to the inventory
;1759:}
LABELV $786
endproc BotUpdateBattleInventory 160 8
export BotUseKamikaze
proc BotUseKamikaze 284 28
line 1769
;1760:
;1761:
;1762:/*
;1763:==================
;1764:BotUseKamikaze
;1765:==================
;1766:*/
;1767:#define KAMIKAZE_DIST		1024
;1768:
;1769:void BotUseKamikaze(bot_state_t *bs) {
line 1777
;1770:	int c, teammates, enemies;
;1771:	aas_entityinfo_t entinfo;
;1772:	vec3_t dir, target;
;1773:	bot_goal_t *goal;
;1774:	bsp_trace_t trace;
;1775:
;1776:	//if the bot has no kamikaze
;1777:	if (bs->inventory[INVENTORY_KAMIKAZE] <= 0)
ADDRFP4 0
INDIRP4
CNSTI4 5080
ADDP4
INDIRI4
CNSTI4 0
GTI4 $797
line 1778
;1778:		return;
ADDRGP4 $796
JUMPV
LABELV $797
line 1779
;1779:	if (bs->kamikaze_time > FloatTime())
ADDRFP4 0
INDIRP4
CNSTI4 6104
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $799
line 1780
;1780:		return;
ADDRGP4 $796
JUMPV
LABELV $799
line 1781
;1781:	bs->kamikaze_time = FloatTime() + 0.2;
ADDRFP4 0
INDIRP4
CNSTI4 6104
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1045220557
ADDF4
ASGNF4
line 1782
;1782:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $801
line 1784
;1783:		//never use kamikaze if the team flag carrier is visible
;1784:		if (BotCTFCarryingFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
EQI4 $803
line 1785
;1785:			return;
ADDRGP4 $796
JUMPV
LABELV $803
line 1786
;1786:		c = BotTeamFlagCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 268
ADDRGP4 BotTeamFlagCarrierVisible
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 268
INDIRI4
ASGNI4
line 1787
;1787:		if (c >= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $805
line 1788
;1788:			BotEntityInfo(c, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 1789
;1789:			VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 272
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 16+24
INDIRF4
ADDRLP4 272
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 16+24+4
INDIRF4
ADDRLP4 272
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 16+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1790
;1790:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST))
ADDRLP4 4
ARGP4
ADDRLP4 276
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 276
INDIRF4
CNSTF4 1233125376
GEF4 $814
line 1791
;1791:				return;
ADDRGP4 $796
JUMPV
LABELV $814
line 1792
;1792:		}
LABELV $805
line 1793
;1793:		c = BotEnemyFlagCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 272
ADDRGP4 BotEnemyFlagCarrierVisible
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 272
INDIRI4
ASGNI4
line 1794
;1794:		if (c >= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $802
line 1795
;1795:			BotEntityInfo(c, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 1796
;1796:			VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 276
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 16+24
INDIRF4
ADDRLP4 276
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 16+24+4
INDIRF4
ADDRLP4 276
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 16+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1797
;1797:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST)) {
ADDRLP4 4
ARGP4
ADDRLP4 280
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 280
INDIRF4
CNSTF4 1233125376
GEF4 $802
line 1798
;1798:				trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 1799
;1799:				return;
ADDRGP4 $796
JUMPV
line 1801
;1800:			}
;1801:		}
line 1802
;1802:	}
LABELV $801
line 1803
;1803:	else if (gametype == GT_ONEFLAG) {
ADDRGP4 gametype
INDIRI4
CNSTI4 5
NEI4 $827
line 1805
;1804:		//never use kamikaze if the team flag carrier is visible
;1805:		if (Bot1FCTFCarryingFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 Bot1FCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
EQI4 $829
line 1806
;1806:			return;
ADDRGP4 $796
JUMPV
LABELV $829
line 1807
;1807:		c = BotTeamFlagCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 268
ADDRGP4 BotTeamFlagCarrierVisible
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 268
INDIRI4
ASGNI4
line 1808
;1808:		if (c >= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $831
line 1809
;1809:			BotEntityInfo(c, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 1810
;1810:			VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 272
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 16+24
INDIRF4
ADDRLP4 272
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 16+24+4
INDIRF4
ADDRLP4 272
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 16+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1811
;1811:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST))
ADDRLP4 4
ARGP4
ADDRLP4 276
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 276
INDIRF4
CNSTF4 1233125376
GEF4 $840
line 1812
;1812:				return;
ADDRGP4 $796
JUMPV
LABELV $840
line 1813
;1813:		}
LABELV $831
line 1814
;1814:		c = BotEnemyFlagCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 272
ADDRGP4 BotEnemyFlagCarrierVisible
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 272
INDIRI4
ASGNI4
line 1815
;1815:		if (c >= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $828
line 1816
;1816:			BotEntityInfo(c, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 1817
;1817:			VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 276
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 16+24
INDIRF4
ADDRLP4 276
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 16+24+4
INDIRF4
ADDRLP4 276
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 16+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1818
;1818:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST)) {
ADDRLP4 4
ARGP4
ADDRLP4 280
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 280
INDIRF4
CNSTF4 1233125376
GEF4 $828
line 1819
;1819:				trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 1820
;1820:				return;
ADDRGP4 $796
JUMPV
line 1822
;1821:			}
;1822:		}
line 1823
;1823:	}
LABELV $827
line 1824
;1824:	else if (gametype == GT_OVERLOAD) {
ADDRGP4 gametype
INDIRI4
CNSTI4 6
NEI4 $853
line 1825
;1825:		switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 268
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 264
ADDRLP4 268
INDIRI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 1
EQI4 $858
ADDRGP4 $855
JUMPV
LABELV $858
line 1826
;1826:			case TEAM_RED: goal = &blueobelisk; break;
ADDRLP4 176
ADDRGP4 blueobelisk
ASGNP4
ADDRGP4 $856
JUMPV
LABELV $855
line 1827
;1827:			default: goal = &redobelisk; break;
ADDRLP4 176
ADDRGP4 redobelisk
ASGNP4
LABELV $856
line 1830
;1828:		}
;1829:		//if the obelisk is visible
;1830:		VectorCopy(goal->origin, target);
ADDRLP4 164
ADDRLP4 176
INDIRP4
INDIRB
ASGNB 12
line 1831
;1831:		target[2] += 1;
ADDRLP4 164+8
ADDRLP4 164+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 1832
;1832:		VectorSubtract(bs->origin, target, dir);
ADDRLP4 272
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 272
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRLP4 164
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 272
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRLP4 164+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
ADDRLP4 164+8
INDIRF4
SUBF4
ASGNF4
line 1833
;1833:		if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST * 0.9)) {
ADDRLP4 4
ARGP4
ADDRLP4 276
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 276
INDIRF4
CNSTF4 1229937705
GEF4 $854
line 1834
;1834:			BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
ADDRLP4 180
ARGP4
ADDRLP4 280
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 280
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 164
ARGP4
ADDRLP4 280
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
line 1835
;1835:			if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
ADDRLP4 180+8
INDIRF4
CNSTF4 1065353216
GEF4 $870
ADDRLP4 180+80
INDIRI4
ADDRLP4 176
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $854
LABELV $870
line 1836
;1836:				trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 1837
;1837:				return;
ADDRGP4 $796
JUMPV
line 1839
;1838:			}
;1839:		}
line 1840
;1840:	}
LABELV $853
line 1841
;1841:	else if (gametype == GT_HARVESTER) {
ADDRGP4 gametype
INDIRI4
CNSTI4 7
NEI4 $871
line 1843
;1842:		//
;1843:		if (BotHarvesterCarryingCubes(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 BotHarvesterCarryingCubes
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
EQI4 $873
line 1844
;1844:			return;
ADDRGP4 $796
JUMPV
LABELV $873
line 1846
;1845:		//never use kamikaze if a team mate carrying cubes is visible
;1846:		c = BotTeamCubeCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 268
ADDRGP4 BotTeamCubeCarrierVisible
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 268
INDIRI4
ASGNI4
line 1847
;1847:		if (c >= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $875
line 1848
;1848:			BotEntityInfo(c, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 1849
;1849:			VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 272
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 16+24
INDIRF4
ADDRLP4 272
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 16+24+4
INDIRF4
ADDRLP4 272
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 16+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1850
;1850:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST))
ADDRLP4 4
ARGP4
ADDRLP4 276
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 276
INDIRF4
CNSTF4 1233125376
GEF4 $884
line 1851
;1851:				return;
ADDRGP4 $796
JUMPV
LABELV $884
line 1852
;1852:		}
LABELV $875
line 1853
;1853:		c = BotEnemyCubeCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 272
ADDRGP4 BotEnemyCubeCarrierVisible
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 272
INDIRI4
ASGNI4
line 1854
;1854:		if (c >= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $886
line 1855
;1855:			BotEntityInfo(c, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 1856
;1856:			VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 276
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 16+24
INDIRF4
ADDRLP4 276
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 16+24+4
INDIRF4
ADDRLP4 276
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 16+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1857
;1857:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST)) {
ADDRLP4 4
ARGP4
ADDRLP4 280
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 280
INDIRF4
CNSTF4 1233125376
GEF4 $895
line 1858
;1858:				trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 1859
;1859:				return;
ADDRGP4 $796
JUMPV
LABELV $895
line 1861
;1860:			}
;1861:		}
LABELV $886
line 1862
;1862:	}
LABELV $871
LABELV $854
LABELV $828
LABELV $802
line 1864
;1863:	//
;1864:	BotVisibleTeamMatesAndEnemies(bs, &teammates, &enemies, KAMIKAZE_DIST);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 160
ARGP4
ADDRLP4 156
ARGP4
CNSTF4 1149239296
ARGF4
ADDRGP4 BotVisibleTeamMatesAndEnemies
CALLV
pop
line 1866
;1865:	//
;1866:	if (enemies > 2 && enemies > teammates+1) {
ADDRLP4 264
ADDRLP4 156
INDIRI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 2
LEI4 $897
ADDRLP4 264
INDIRI4
ADDRLP4 160
INDIRI4
CNSTI4 1
ADDI4
LEI4 $897
line 1867
;1867:		trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 1868
;1868:		return;
LABELV $897
line 1870
;1869:	}
;1870:}
LABELV $796
endproc BotUseKamikaze 284 28
export BotUseInvulnerability
proc BotUseInvulnerability 144 28
line 1877
;1871:
;1872:/*
;1873:==================
;1874:BotUseInvulnerability
;1875:==================
;1876:*/
;1877:void BotUseInvulnerability(bot_state_t *bs) {
line 1884
;1878:	int c;
;1879:	vec3_t dir, target;
;1880:	bot_goal_t *goal;
;1881:	bsp_trace_t trace;
;1882:
;1883:	//if the bot has no invulnerability
;1884:	if (bs->inventory[INVENTORY_INVULNERABILITY] <= 0)
ADDRFP4 0
INDIRP4
CNSTI4 5088
ADDP4
INDIRI4
CNSTI4 0
GTI4 $900
line 1885
;1885:		return;
ADDRGP4 $899
JUMPV
LABELV $900
line 1886
;1886:	if (bs->invulnerability_time > FloatTime())
ADDRFP4 0
INDIRP4
CNSTI4 6108
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $902
line 1887
;1887:		return;
ADDRGP4 $899
JUMPV
LABELV $902
line 1888
;1888:	bs->invulnerability_time = FloatTime() + 0.2;
ADDRFP4 0
INDIRP4
CNSTI4 6108
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1045220557
ADDF4
ASGNF4
line 1889
;1889:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $904
line 1891
;1890:		//never use kamikaze if the team flag carrier is visible
;1891:		if (BotCTFCarryingFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 116
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
EQI4 $906
line 1892
;1892:			return;
ADDRGP4 $899
JUMPV
LABELV $906
line 1893
;1893:		c = BotEnemyFlagCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 120
ADDRGP4 BotEnemyFlagCarrierVisible
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 120
INDIRI4
ASGNI4
line 1894
;1894:		if (c >= 0)
ADDRLP4 24
INDIRI4
CNSTI4 0
LTI4 $908
line 1895
;1895:			return;
ADDRGP4 $899
JUMPV
LABELV $908
line 1897
;1896:		//if near enemy flag and the flag is visible
;1897:		switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 128
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 124
ADDRLP4 128
INDIRI4
ASGNI4
ADDRLP4 124
INDIRI4
CNSTI4 1
EQI4 $913
ADDRGP4 $910
JUMPV
LABELV $913
line 1898
;1898:			case TEAM_RED: goal = &ctf_blueflag; break;
ADDRLP4 28
ADDRGP4 ctf_blueflag
ASGNP4
ADDRGP4 $911
JUMPV
LABELV $910
line 1899
;1899:			default: goal = &ctf_redflag; break;
ADDRLP4 28
ADDRGP4 ctf_redflag
ASGNP4
LABELV $911
line 1902
;1900:		}
;1901:		//if the obelisk is visible
;1902:		VectorCopy(goal->origin, target);
ADDRLP4 0
ADDRLP4 28
INDIRP4
INDIRB
ASGNB 12
line 1903
;1903:		target[2] += 1;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 1904
;1904:		VectorSubtract(bs->origin, target, dir);
ADDRLP4 132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 132
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 132
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 1905
;1905:		if (VectorLengthSquared(dir) < Square(200)) {
ADDRLP4 12
ARGP4
ADDRLP4 136
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 136
INDIRF4
CNSTF4 1193033728
GEF4 $905
line 1906
;1906:			BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
ADDRLP4 32
ARGP4
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
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
ADDRLP4 140
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
line 1907
;1907:			if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
ADDRLP4 32+8
INDIRF4
CNSTF4 1065353216
GEF4 $925
ADDRLP4 32+80
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $905
LABELV $925
line 1908
;1908:				trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 1909
;1909:				return;
ADDRGP4 $899
JUMPV
line 1911
;1910:			}
;1911:		}
line 1912
;1912:	}
LABELV $904
line 1913
;1913:	else if (gametype == GT_ONEFLAG) {
ADDRGP4 gametype
INDIRI4
CNSTI4 5
NEI4 $926
line 1915
;1914:		//never use kamikaze if the team flag carrier is visible
;1915:		if (Bot1FCTFCarryingFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 116
ADDRGP4 Bot1FCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
EQI4 $928
line 1916
;1916:			return;
ADDRGP4 $899
JUMPV
LABELV $928
line 1917
;1917:		c = BotEnemyFlagCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 120
ADDRGP4 BotEnemyFlagCarrierVisible
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 120
INDIRI4
ASGNI4
line 1918
;1918:		if (c >= 0)
ADDRLP4 24
INDIRI4
CNSTI4 0
LTI4 $930
line 1919
;1919:			return;
ADDRGP4 $899
JUMPV
LABELV $930
line 1921
;1920:		//if near enemy flag and the flag is visible
;1921:		switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 128
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 124
ADDRLP4 128
INDIRI4
ASGNI4
ADDRLP4 124
INDIRI4
CNSTI4 1
EQI4 $935
ADDRGP4 $932
JUMPV
LABELV $935
line 1922
;1922:			case TEAM_RED: goal = &ctf_blueflag; break;
ADDRLP4 28
ADDRGP4 ctf_blueflag
ASGNP4
ADDRGP4 $933
JUMPV
LABELV $932
line 1923
;1923:			default: goal = &ctf_redflag; break;
ADDRLP4 28
ADDRGP4 ctf_redflag
ASGNP4
LABELV $933
line 1926
;1924:		}
;1925:		//if the obelisk is visible
;1926:		VectorCopy(goal->origin, target);
ADDRLP4 0
ADDRLP4 28
INDIRP4
INDIRB
ASGNB 12
line 1927
;1927:		target[2] += 1;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 1928
;1928:		VectorSubtract(bs->origin, target, dir);
ADDRLP4 132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 132
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 132
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 1929
;1929:		if (VectorLengthSquared(dir) < Square(200)) {
ADDRLP4 12
ARGP4
ADDRLP4 136
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 136
INDIRF4
CNSTF4 1193033728
GEF4 $927
line 1930
;1930:			BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
ADDRLP4 32
ARGP4
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
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
ADDRLP4 140
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
line 1931
;1931:			if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
ADDRLP4 32+8
INDIRF4
CNSTF4 1065353216
GEF4 $947
ADDRLP4 32+80
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $927
LABELV $947
line 1932
;1932:				trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 1933
;1933:				return;
ADDRGP4 $899
JUMPV
line 1935
;1934:			}
;1935:		}
line 1936
;1936:	}
LABELV $926
line 1937
;1937:	else if (gametype == GT_OVERLOAD) {
ADDRGP4 gametype
INDIRI4
CNSTI4 6
NEI4 $948
line 1938
;1938:		switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 120
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 116
ADDRLP4 120
INDIRI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 1
EQI4 $953
ADDRGP4 $950
JUMPV
LABELV $953
line 1939
;1939:			case TEAM_RED: goal = &blueobelisk; break;
ADDRLP4 28
ADDRGP4 blueobelisk
ASGNP4
ADDRGP4 $951
JUMPV
LABELV $950
line 1940
;1940:			default: goal = &redobelisk; break;
ADDRLP4 28
ADDRGP4 redobelisk
ASGNP4
LABELV $951
line 1943
;1941:		}
;1942:		//if the obelisk is visible
;1943:		VectorCopy(goal->origin, target);
ADDRLP4 0
ADDRLP4 28
INDIRP4
INDIRB
ASGNB 12
line 1944
;1944:		target[2] += 1;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 1945
;1945:		VectorSubtract(bs->origin, target, dir);
ADDRLP4 124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 124
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 124
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 1946
;1946:		if (VectorLengthSquared(dir) < Square(300)) {
ADDRLP4 12
ARGP4
ADDRLP4 128
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 128
INDIRF4
CNSTF4 1202702336
GEF4 $949
line 1947
;1947:			BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
ADDRLP4 32
ARGP4
ADDRLP4 132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 132
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
ADDRLP4 132
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
line 1948
;1948:			if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
ADDRLP4 32+8
INDIRF4
CNSTF4 1065353216
GEF4 $965
ADDRLP4 32+80
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $949
LABELV $965
line 1949
;1949:				trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 1950
;1950:				return;
ADDRGP4 $899
JUMPV
line 1952
;1951:			}
;1952:		}
line 1953
;1953:	}
LABELV $948
line 1954
;1954:	else if (gametype == GT_HARVESTER) {
ADDRGP4 gametype
INDIRI4
CNSTI4 7
NEI4 $966
line 1956
;1955:		//
;1956:		if (BotHarvesterCarryingCubes(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 116
ADDRGP4 BotHarvesterCarryingCubes
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
EQI4 $968
line 1957
;1957:			return;
ADDRGP4 $899
JUMPV
LABELV $968
line 1958
;1958:		c = BotEnemyCubeCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 120
ADDRGP4 BotEnemyCubeCarrierVisible
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 120
INDIRI4
ASGNI4
line 1959
;1959:		if (c >= 0)
ADDRLP4 24
INDIRI4
CNSTI4 0
LTI4 $970
line 1960
;1960:			return;
ADDRGP4 $899
JUMPV
LABELV $970
line 1962
;1961:		//if near enemy base and enemy base is visible
;1962:		switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 128
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 124
ADDRLP4 128
INDIRI4
ASGNI4
ADDRLP4 124
INDIRI4
CNSTI4 1
EQI4 $975
ADDRGP4 $972
JUMPV
LABELV $975
line 1963
;1963:			case TEAM_RED: goal = &blueobelisk; break;
ADDRLP4 28
ADDRGP4 blueobelisk
ASGNP4
ADDRGP4 $973
JUMPV
LABELV $972
line 1964
;1964:			default: goal = &redobelisk; break;
ADDRLP4 28
ADDRGP4 redobelisk
ASGNP4
LABELV $973
line 1967
;1965:		}
;1966:		//if the obelisk is visible
;1967:		VectorCopy(goal->origin, target);
ADDRLP4 0
ADDRLP4 28
INDIRP4
INDIRB
ASGNB 12
line 1968
;1968:		target[2] += 1;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 1969
;1969:		VectorSubtract(bs->origin, target, dir);
ADDRLP4 132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 132
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 132
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 1970
;1970:		if (VectorLengthSquared(dir) < Square(200)) {
ADDRLP4 12
ARGP4
ADDRLP4 136
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 136
INDIRF4
CNSTF4 1193033728
GEF4 $981
line 1971
;1971:			BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
ADDRLP4 32
ARGP4
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
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
ADDRLP4 140
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
line 1972
;1972:			if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
ADDRLP4 32+8
INDIRF4
CNSTF4 1065353216
GEF4 $987
ADDRLP4 32+80
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $983
LABELV $987
line 1973
;1973:				trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 1974
;1974:				return;
LABELV $983
line 1976
;1975:			}
;1976:		}
LABELV $981
line 1977
;1977:	}
LABELV $966
LABELV $949
LABELV $927
LABELV $905
line 1978
;1978:}
LABELV $899
endproc BotUseInvulnerability 144 28
export BotBattleUseItems
proc BotBattleUseItems 12 4
line 1986
;1979:
;1980:
;1981:/*
;1982:==================
;1983:BotBattleUseItems
;1984:==================
;1985:*/
;1986:void BotBattleUseItems(bot_state_t *bs) {
line 1987
;1987:	if (bs->inventory[INVENTORY_HEALTH] < 40) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 40
GEI4 $989
line 1988
;1988:		if (bs->inventory[INVENTORY_TELEPORTER] > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 5072
ADDP4
INDIRI4
CNSTI4 0
LEI4 $991
line 1989
;1989:			if ( !BotCTFCarryingFlag(bs) && !Bot1FCTFCarryingFlag(bs) && !BotHarvesterCarryingCubes(bs) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $993
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Bot1FCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $993
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BotHarvesterCarryingCubes
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $993
line 1990
;1990:				trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 1991
;1991:			}
LABELV $993
line 1992
;1992:		}
LABELV $991
line 1993
;1993:	}
LABELV $989
line 1994
;1994:	if (bs->inventory[INVENTORY_HEALTH] < 60) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 60
GEI4 $995
line 1995
;1995:		if (bs->inventory[INVENTORY_MEDKIT] > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 5076
ADDP4
INDIRI4
CNSTI4 0
LEI4 $997
line 1996
;1996:			trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 1997
;1997:		}
LABELV $997
line 1998
;1998:	}
LABELV $995
line 2000
;1999:
;2000:	BotUseKamikaze(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotUseKamikaze
CALLV
pop
line 2001
;2001:	BotUseInvulnerability(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotUseInvulnerability
CALLV
pop
line 2002
;2002:}
LABELV $988
endproc BotBattleUseItems 12 4
export BotSetTeleportTime
proc BotSetTeleportTime 8 0
line 2009
;2003:
;2004:/*
;2005:==================
;2006:BotSetTeleportTime
;2007:==================
;2008:*/
;2009:void BotSetTeleportTime(bot_state_t *bs) {
line 2010
;2010:	if ((bs->cur_ps.eFlags ^ bs->last_eFlags) & EF_TELEPORT_BIT) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 484
ADDP4
INDIRI4
BXORI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $1000
line 2011
;2011:		bs->teleport_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6180
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2012
;2012:	}
LABELV $1000
line 2013
;2013:	bs->last_eFlags = bs->cur_ps.eFlags;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 484
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
ASGNI4
line 2014
;2014:}
LABELV $999
endproc BotSetTeleportTime 8 0
export BotIsDead
proc BotIsDead 4 0
line 2021
;2015:
;2016:/*
;2017:==================
;2018:BotIsDead
;2019:==================
;2020:*/
;2021:qboolean BotIsDead(bot_state_t *bs) {
line 2022
;2022:	return (bs->cur_ps.pm_type == PM_DEAD);
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1004
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $1005
JUMPV
LABELV $1004
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1005
ADDRLP4 0
INDIRI4
RETI4
LABELV $1002
endproc BotIsDead 4 0
export BotIsObserver
proc BotIsObserver 1032 12
line 2030
;2023:}
;2024:
;2025:/*
;2026:==================
;2027:BotIsObserver
;2028:==================
;2029:*/
;2030:qboolean BotIsObserver(bot_state_t *bs) {
line 2032
;2031:	char buf[MAX_INFO_STRING];
;2032:	if (bs->cur_ps.pm_type == PM_SPECTATOR) return qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1007
CNSTI4 1
RETI4
ADDRGP4 $1006
JUMPV
LABELV $1007
line 2033
;2033:	trap_GetConfigstring(CS_PLAYERS+bs->client, buf, sizeof(buf));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
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
line 2034
;2034:	if (atoi(Info_ValueForKey(buf, "t")) == TEAM_SPECTATOR) return qtrue;
ADDRLP4 0
ARGP4
ADDRGP4 $73
ARGP4
ADDRLP4 1024
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1028
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 3
NEI4 $1009
CNSTI4 1
RETI4
ADDRGP4 $1006
JUMPV
LABELV $1009
line 2035
;2035:	return qfalse;
CNSTI4 0
RETI4
LABELV $1006
endproc BotIsObserver 1032 12
export BotIntermission
proc BotIntermission 8 0
line 2043
;2036:}
;2037:
;2038:/*
;2039:==================
;2040:BotIntermission
;2041:==================
;2042:*/
;2043:qboolean BotIntermission(bot_state_t *bs) {
line 2045
;2044:	//NOTE: we shouldn't be looking at the game code...
;2045:	if (level.intermissiontime) return qtrue;
ADDRGP4 level+7604
INDIRI4
CNSTI4 0
EQI4 $1012
CNSTI4 1
RETI4
ADDRGP4 $1011
JUMPV
LABELV $1012
line 2046
;2046:	return (bs->cur_ps.pm_type == PM_FREEZE || bs->cur_ps.pm_type == PM_INTERMISSION);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 4
EQI4 $1018
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1016
LABELV $1018
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $1017
JUMPV
LABELV $1016
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1017
ADDRLP4 0
INDIRI4
RETI4
LABELV $1011
endproc BotIntermission 8 0
export BotInLavaOrSlime
proc BotInLavaOrSlime 16 4
line 2054
;2047:}
;2048:
;2049:/*
;2050:==================
;2051:BotInLavaOrSlime
;2052:==================
;2053:*/
;2054:qboolean BotInLavaOrSlime(bot_state_t *bs) {
line 2057
;2055:	vec3_t feet;
;2056:
;2057:	VectorCopy(bs->origin, feet);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 2058
;2058:	feet[2] -= 23;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1102577664
SUBF4
ASGNF4
line 2059
;2059:	return (trap_AAS_PointContents(feet) & (CONTENTS_LAVA|CONTENTS_SLIME));
ADDRLP4 0
ARGP4
ADDRLP4 12
ADDRGP4 trap_AAS_PointContents
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 24
BANDI4
RETI4
LABELV $1019
endproc BotInLavaOrSlime 16 4
data
align 4
LABELV $1022
byte 4 3238002688
byte 4 3238002688
byte 4 3238002688
align 4
LABELV $1023
byte 4 1090519040
byte 4 1090519040
byte 4 1090519040
export BotCreateWayPoint
code
proc BotCreateWayPoint 32 12
line 2067
;2060:}
;2061:
;2062:/*
;2063:==================
;2064:BotCreateWayPoint
;2065:==================
;2066:*/
;2067:bot_waypoint_t *BotCreateWayPoint(char *name, vec3_t origin, int areanum) {
line 2069
;2068:	bot_waypoint_t *wp;
;2069:	vec3_t waypointmins = {-8, -8, -8}, waypointmaxs = {8, 8, 8};
ADDRLP4 4
ADDRGP4 $1022
INDIRB
ASGNB 12
ADDRLP4 16
ADDRGP4 $1023
INDIRB
ASGNB 12
line 2071
;2070:
;2071:	wp = botai_freewaypoints;
ADDRLP4 0
ADDRGP4 botai_freewaypoints
INDIRP4
ASGNP4
line 2072
;2072:	if ( !wp ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1024
line 2073
;2073:		BotAI_Print( PRT_WARNING, "BotCreateWayPoint: Out of waypoints\n" );
CNSTI4 2
ARGI4
ADDRGP4 $1026
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 2074
;2074:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $1021
JUMPV
LABELV $1024
line 2076
;2075:	}
;2076:	botai_freewaypoints = botai_freewaypoints->next;
ADDRLP4 28
ADDRGP4 botai_freewaypoints
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
ASGNP4
line 2078
;2077:
;2078:	Q_strncpyz( wp->name, name, sizeof(wp->name) );
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2079
;2079:	VectorCopy(origin, wp->goal.origin);
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 2080
;2080:	VectorCopy(waypointmins, wp->goal.mins);
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 2081
;2081:	VectorCopy(waypointmaxs, wp->goal.maxs);
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 16
INDIRB
ASGNB 12
line 2082
;2082:	wp->goal.areanum = areanum;
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 2083
;2083:	wp->next = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
CNSTP4 0
ASGNP4
line 2084
;2084:	wp->prev = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
CNSTP4 0
ASGNP4
line 2085
;2085:	return wp;
ADDRLP4 0
INDIRP4
RETP4
LABELV $1021
endproc BotCreateWayPoint 32 12
export BotFindWayPoint
proc BotFindWayPoint 8 8
line 2093
;2086:}
;2087:
;2088:/*
;2089:==================
;2090:BotFindWayPoint
;2091:==================
;2092:*/
;2093:bot_waypoint_t *BotFindWayPoint(bot_waypoint_t *waypoints, char *name) {
line 2096
;2094:	bot_waypoint_t *wp;
;2095:
;2096:	for (wp = waypoints; wp; wp = wp->next) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $1031
JUMPV
LABELV $1028
line 2097
;2097:		if (!Q_stricmp(wp->name, name)) return wp;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1032
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $1027
JUMPV
LABELV $1032
line 2098
;2098:	}
LABELV $1029
line 2096
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
ASGNP4
LABELV $1031
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1028
line 2099
;2099:	return NULL;
CNSTP4 0
RETP4
LABELV $1027
endproc BotFindWayPoint 8 8
export BotFreeWaypoints
proc BotFreeWaypoints 4 0
line 2107
;2100:}
;2101:
;2102:/*
;2103:==================
;2104:BotFreeWaypoints
;2105:==================
;2106:*/
;2107:void BotFreeWaypoints(bot_waypoint_t *wp) {
line 2110
;2108:	bot_waypoint_t *nextwp;
;2109:
;2110:	for (; wp; wp = nextwp) {
ADDRGP4 $1038
JUMPV
LABELV $1035
line 2111
;2111:		nextwp = wp->next;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
ASGNP4
line 2112
;2112:		wp->next = botai_freewaypoints;
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRGP4 botai_freewaypoints
INDIRP4
ASGNP4
line 2113
;2113:		botai_freewaypoints = wp;
ADDRGP4 botai_freewaypoints
ADDRFP4 0
INDIRP4
ASGNP4
line 2114
;2114:	}
LABELV $1036
line 2110
ADDRFP4 0
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $1038
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1035
line 2115
;2115:}
LABELV $1034
endproc BotFreeWaypoints 4 0
export BotInitWaypoints
proc BotInitWaypoints 4 0
line 2122
;2116:
;2117:/*
;2118:==================
;2119:BotInitWaypoints
;2120:==================
;2121:*/
;2122:void BotInitWaypoints(void) {
line 2125
;2123:	int i;
;2124:
;2125:	botai_freewaypoints = NULL;
ADDRGP4 botai_freewaypoints
CNSTP4 0
ASGNP4
line 2126
;2126:	for (i = 0; i < MAX_WAYPOINTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1040
line 2127
;2127:		botai_waypoints[i].next = botai_freewaypoints;
ADDRLP4 0
INDIRI4
CNSTI4 100
MULI4
ADDRGP4 botai_waypoints+92
ADDP4
ADDRGP4 botai_freewaypoints
INDIRP4
ASGNP4
line 2128
;2128:		botai_freewaypoints = &botai_waypoints[i];
ADDRGP4 botai_freewaypoints
ADDRLP4 0
INDIRI4
CNSTI4 100
MULI4
ADDRGP4 botai_waypoints
ADDP4
ASGNP4
line 2129
;2129:	}
LABELV $1041
line 2126
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 128
LTI4 $1040
line 2130
;2130:}
LABELV $1039
endproc BotInitWaypoints 4 0
export BotAggression
proc BotAggression 28 0
line 2137
;2131:
;2132:/*
;2133:==================
;2134:BotAggression
;2135:==================
;2136:*/
;2137:float BotAggression(bot_state_t *bs) {
line 2139
;2138:	//if the bot has quad
;2139:	if (bs->inventory[INVENTORY_QUAD]) {
ADDRFP4 0
INDIRP4
CNSTI4 5092
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1046
line 2141
;2140:		//if the bot is not holding the gauntlet or the enemy is really nearby
;2141:		if (bs->weaponnum != WP_GAUNTLET ||
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1050
ADDRLP4 0
INDIRP4
CNSTI4 5752
ADDP4
INDIRI4
CNSTI4 80
GEI4 $1048
LABELV $1050
line 2142
;2142:			bs->inventory[ENEMY_HORIZONTAL_DIST] < 80) {
line 2143
;2143:			return 70;
CNSTF4 1116471296
RETF4
ADDRGP4 $1045
JUMPV
LABELV $1048
line 2145
;2144:		}
;2145:	}
LABELV $1046
line 2147
;2146:	//if the enemy is located way higher than the bot
;2147:	if (bs->inventory[ENEMY_HEIGHT] > 200) return 0;
ADDRFP4 0
INDIRP4
CNSTI4 5756
ADDP4
INDIRI4
CNSTI4 200
LEI4 $1051
CNSTF4 0
RETF4
ADDRGP4 $1045
JUMPV
LABELV $1051
line 2149
;2148:	//if the bot is very low on health
;2149:	if (bs->inventory[INVENTORY_HEALTH] < 60) return 0;
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 60
GEI4 $1053
CNSTF4 0
RETF4
ADDRGP4 $1045
JUMPV
LABELV $1053
line 2151
;2150:	//if the bot is low on health
;2151:	if (bs->inventory[INVENTORY_HEALTH] < 80) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 80
GEI4 $1055
line 2153
;2152:		//if the bot has insufficient armor
;2153:		if (bs->inventory[INVENTORY_ARMOR] < 40) return 0;
ADDRFP4 0
INDIRP4
CNSTI4 4956
ADDP4
INDIRI4
CNSTI4 40
GEI4 $1057
CNSTF4 0
RETF4
ADDRGP4 $1045
JUMPV
LABELV $1057
line 2154
;2154:	}
LABELV $1055
line 2156
;2155:	//if the bot can use the bfg
;2156:	if (bs->inventory[INVENTORY_BFG10K] > 0 &&
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 5004
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1059
ADDRLP4 0
INDIRP4
CNSTI4 5052
ADDP4
INDIRI4
CNSTI4 7
LEI4 $1059
line 2157
;2157:			bs->inventory[INVENTORY_BFGAMMO] > 7) return 100;
CNSTF4 1120403456
RETF4
ADDRGP4 $1045
JUMPV
LABELV $1059
line 2159
;2158:	//if the bot can use the railgun
;2159:	if (bs->inventory[INVENTORY_RAILGUN] > 0 &&
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 4992
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1061
ADDRLP4 4
INDIRP4
CNSTI4 5048
ADDP4
INDIRI4
CNSTI4 5
LEI4 $1061
line 2160
;2160:			bs->inventory[INVENTORY_SLUGS] > 5) return 95;
CNSTF4 1119748096
RETF4
ADDRGP4 $1045
JUMPV
LABELV $1061
line 2162
;2161:	//if the bot can use the lightning gun
;2162:	if (bs->inventory[INVENTORY_LIGHTNING] > 0 &&
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 4988
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1063
ADDRLP4 8
INDIRP4
CNSTI4 5040
ADDP4
INDIRI4
CNSTI4 50
LEI4 $1063
line 2163
;2163:			bs->inventory[INVENTORY_LIGHTNINGAMMO] > 50) return 90;
CNSTF4 1119092736
RETF4
ADDRGP4 $1045
JUMPV
LABELV $1063
line 2165
;2164:	//if the bot can use the rocketlauncher
;2165:	if (bs->inventory[INVENTORY_ROCKETLAUNCHER] > 0 &&
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 4984
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1065
ADDRLP4 12
INDIRP4
CNSTI4 5044
ADDP4
INDIRI4
CNSTI4 5
LEI4 $1065
line 2166
;2166:			bs->inventory[INVENTORY_ROCKETS] > 5) return 90;
CNSTF4 1119092736
RETF4
ADDRGP4 $1045
JUMPV
LABELV $1065
line 2168
;2167:	//if the bot can use the plasmagun
;2168:	if (bs->inventory[INVENTORY_PLASMAGUN] > 0 &&
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 4996
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1067
ADDRLP4 16
INDIRP4
CNSTI4 5036
ADDP4
INDIRI4
CNSTI4 40
LEI4 $1067
line 2169
;2169:			bs->inventory[INVENTORY_CELLS] > 40) return 85;
CNSTF4 1118437376
RETF4
ADDRGP4 $1045
JUMPV
LABELV $1067
line 2171
;2170:	//if the bot can use the grenade launcher
;2171:	if (bs->inventory[INVENTORY_GRENADELAUNCHER] > 0 &&
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 4980
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1069
ADDRLP4 20
INDIRP4
CNSTI4 5032
ADDP4
INDIRI4
CNSTI4 10
LEI4 $1069
line 2172
;2172:			bs->inventory[INVENTORY_GRENADES] > 10) return 80;
CNSTF4 1117782016
RETF4
ADDRGP4 $1045
JUMPV
LABELV $1069
line 2174
;2173:	//if the bot can use the shotgun
;2174:	if (bs->inventory[INVENTORY_SHOTGUN] > 0 &&
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 4972
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1071
ADDRLP4 24
INDIRP4
CNSTI4 5024
ADDP4
INDIRI4
CNSTI4 10
LEI4 $1071
line 2175
;2175:			bs->inventory[INVENTORY_SHELLS] > 10) return 50;
CNSTF4 1112014848
RETF4
ADDRGP4 $1045
JUMPV
LABELV $1071
line 2177
;2176:	//otherwise the bot is not feeling too good
;2177:	return 0;
CNSTF4 0
RETF4
LABELV $1045
endproc BotAggression 28 0
export BotFeelingBad
proc BotFeelingBad 0 0
line 2185
;2178:}
;2179:
;2180:/*
;2181:==================
;2182:BotFeelingBad
;2183:==================
;2184:*/
;2185:float BotFeelingBad(bot_state_t *bs) {
line 2186
;2186:	if (bs->weaponnum == WP_GAUNTLET) {
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1074
line 2187
;2187:		return 100;
CNSTF4 1120403456
RETF4
ADDRGP4 $1073
JUMPV
LABELV $1074
line 2189
;2188:	}
;2189:	if (bs->inventory[INVENTORY_HEALTH] < 40) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 40
GEI4 $1076
line 2190
;2190:		return 100;
CNSTF4 1120403456
RETF4
ADDRGP4 $1073
JUMPV
LABELV $1076
line 2192
;2191:	}
;2192:	if (bs->weaponnum == WP_MACHINEGUN) {
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1078
line 2193
;2193:		return 90;
CNSTF4 1119092736
RETF4
ADDRGP4 $1073
JUMPV
LABELV $1078
line 2195
;2194:	}
;2195:	if (bs->inventory[INVENTORY_HEALTH] < 60) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 60
GEI4 $1080
line 2196
;2196:		return 80;
CNSTF4 1117782016
RETF4
ADDRGP4 $1073
JUMPV
LABELV $1080
line 2198
;2197:	}
;2198:	return 0;
CNSTF4 0
RETF4
LABELV $1073
endproc BotFeelingBad 0 0
export BotWantsToRetreat
proc BotWantsToRetreat 144 8
line 2206
;2199:}
;2200:
;2201:/*
;2202:==================
;2203:BotWantsToRetreat
;2204:==================
;2205:*/
;2206:int BotWantsToRetreat(bot_state_t *bs) {
line 2209
;2207:	aas_entityinfo_t entinfo;
;2208:
;2209:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $1083
line 2211
;2210:		//always retreat when carrying a CTF flag
;2211:		if (BotCTFCarryingFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $1084
line 2212
;2212:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1082
JUMPV
line 2213
;2213:	}
LABELV $1083
line 2214
;2214:	else if (gametype == GT_ONEFLAG) {
ADDRGP4 gametype
INDIRI4
CNSTI4 5
NEI4 $1087
line 2216
;2215:		//if carrying the flag then always retreat
;2216:		if (Bot1FCTFCarryingFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 Bot1FCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $1088
line 2217
;2217:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1082
JUMPV
line 2218
;2218:	}
LABELV $1087
line 2219
;2219:	else if (gametype == GT_OVERLOAD) {
ADDRGP4 gametype
INDIRI4
CNSTI4 6
NEI4 $1091
line 2221
;2220:		//the bots should be dedicated to attacking the enemy obelisk
;2221:		if (bs->ltgtype == LTG_ATTACKENEMYBASE) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 13
NEI4 $1093
line 2222
;2222:			if (bs->enemy != redobelisk.entitynum &&
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ADDRGP4 redobelisk+40
INDIRI4
EQI4 $1095
ADDRLP4 140
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ADDRGP4 blueobelisk+40
INDIRI4
EQI4 $1095
line 2223
;2223:						bs->enemy != blueobelisk.entitynum) {
line 2224
;2224:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1082
JUMPV
LABELV $1095
line 2226
;2225:			}
;2226:		}
LABELV $1093
line 2227
;2227:		if (BotFeelingBad(bs) > 50) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotFeelingBad
CALLF4
ASGNF4
ADDRLP4 140
INDIRF4
CNSTF4 1112014848
LEF4 $1099
line 2228
;2228:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1082
JUMPV
LABELV $1099
line 2230
;2229:		}
;2230:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1082
JUMPV
LABELV $1091
line 2232
;2231:	}
;2232:	else if (gametype == GT_HARVESTER) {
ADDRGP4 gametype
INDIRI4
CNSTI4 7
NEI4 $1101
line 2234
;2233:		//if carrying cubes then always retreat
;2234:		if (BotHarvesterCarryingCubes(bs)) return qtrue;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotHarvesterCarryingCubes
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $1103
CNSTI4 1
RETI4
ADDRGP4 $1082
JUMPV
LABELV $1103
line 2235
;2235:	}
LABELV $1101
LABELV $1088
LABELV $1084
line 2237
;2236:	//
;2237:	if (bs->enemy >= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 0
LTI4 $1105
line 2239
;2238:		//if the enemy is carrying a flag
;2239:		BotEntityInfo(bs->enemy, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2240
;2240:		if (EntityCarriesFlag(&entinfo))
ADDRLP4 0
ARGP4
ADDRLP4 140
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $1107
line 2241
;2241:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1082
JUMPV
LABELV $1107
line 2242
;2242:	}
LABELV $1105
line 2244
;2243:	//if the bot is getting the flag
;2244:	if (bs->ltgtype == LTG_GETFLAG)
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 4
NEI4 $1109
line 2245
;2245:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1082
JUMPV
LABELV $1109
line 2247
;2246:	//
;2247:	if (BotAggression(bs) < 50)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotAggression
CALLF4
ASGNF4
ADDRLP4 140
INDIRF4
CNSTF4 1112014848
GEF4 $1111
line 2248
;2248:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1082
JUMPV
LABELV $1111
line 2249
;2249:	return qfalse;
CNSTI4 0
RETI4
LABELV $1082
endproc BotWantsToRetreat 144 8
export BotWantsToChase
proc BotWantsToChase 148 8
line 2257
;2250:}
;2251:
;2252:/*
;2253:==================
;2254:BotWantsToChase
;2255:==================
;2256:*/
;2257:int BotWantsToChase(bot_state_t *bs) {
line 2260
;2258:	aas_entityinfo_t entinfo;
;2259:
;2260:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $1114
line 2262
;2261:		//never chase when carrying a CTF flag
;2262:		if (BotCTFCarryingFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $1116
line 2263
;2263:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1113
JUMPV
LABELV $1116
line 2265
;2264:		//always chase if the enemy is carrying a flag
;2265:		BotEntityInfo(bs->enemy, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2266
;2266:		if (EntityCarriesFlag(&entinfo))
ADDRLP4 0
ARGP4
ADDRLP4 144
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $1115
line 2267
;2267:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1113
JUMPV
line 2268
;2268:	}
LABELV $1114
line 2269
;2269:	else if (gametype == GT_ONEFLAG) {
ADDRGP4 gametype
INDIRI4
CNSTI4 5
NEI4 $1120
line 2271
;2270:		//never chase if carrying the flag
;2271:		if (Bot1FCTFCarryingFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 Bot1FCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $1122
line 2272
;2272:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1113
JUMPV
LABELV $1122
line 2274
;2273:		//always chase if the enemy is carrying a flag
;2274:		BotEntityInfo(bs->enemy, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2275
;2275:		if (EntityCarriesFlag(&entinfo))
ADDRLP4 0
ARGP4
ADDRLP4 144
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $1121
line 2276
;2276:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1113
JUMPV
line 2277
;2277:	}
LABELV $1120
line 2278
;2278:	else if (gametype == GT_OVERLOAD) {
ADDRGP4 gametype
INDIRI4
CNSTI4 6
NEI4 $1126
line 2280
;2279:		//the bots should be dedicated to attacking the enemy obelisk
;2280:		if (bs->ltgtype == LTG_ATTACKENEMYBASE) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 13
NEI4 $1127
line 2281
;2281:			if (bs->enemy != redobelisk.entitynum &&
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ADDRGP4 redobelisk+40
INDIRI4
EQI4 $1127
ADDRLP4 140
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ADDRGP4 blueobelisk+40
INDIRI4
EQI4 $1127
line 2282
;2282:						bs->enemy != blueobelisk.entitynum) {
line 2283
;2283:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1113
JUMPV
line 2285
;2284:			}
;2285:		}
line 2286
;2286:	}
LABELV $1126
line 2287
;2287:	else if (gametype == GT_HARVESTER) {
ADDRGP4 gametype
INDIRI4
CNSTI4 7
NEI4 $1134
line 2289
;2288:		//never chase if carrying cubes
;2289:		if (BotHarvesterCarryingCubes(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotHarvesterCarryingCubes
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $1136
line 2290
;2290:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1113
JUMPV
LABELV $1136
line 2291
;2291:	}
LABELV $1134
LABELV $1127
LABELV $1121
LABELV $1115
line 2293
;2292:	//if the bot is getting the flag
;2293:	if (bs->ltgtype == LTG_GETFLAG)
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 4
NEI4 $1138
line 2294
;2294:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1113
JUMPV
LABELV $1138
line 2296
;2295:	//
;2296:	if (BotAggression(bs) > 50)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotAggression
CALLF4
ASGNF4
ADDRLP4 140
INDIRF4
CNSTF4 1112014848
LEF4 $1140
line 2297
;2297:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1113
JUMPV
LABELV $1140
line 2298
;2298:	return qfalse;
CNSTI4 0
RETI4
LABELV $1113
endproc BotWantsToChase 148 8
export BotWantsToHelp
proc BotWantsToHelp 0 0
line 2306
;2299:}
;2300:
;2301:/*
;2302:==================
;2303:BotWantsToHelp
;2304:==================
;2305:*/
;2306:int BotWantsToHelp(bot_state_t *bs) {
line 2307
;2307:	return qtrue;
CNSTI4 1
RETI4
LABELV $1142
endproc BotWantsToHelp 0 0
export BotCanAndWantsToRocketJump
proc BotCanAndWantsToRocketJump 8 16
line 2315
;2308:}
;2309:
;2310:/*
;2311:==================
;2312:BotCanAndWantsToRocketJump
;2313:==================
;2314:*/
;2315:int BotCanAndWantsToRocketJump(bot_state_t *bs) {
line 2319
;2316:	float rocketjumper;
;2317:
;2318:	//if rocket jumping is disabled
;2319:	if (!bot_rocketjump.integer) return qfalse;
ADDRGP4 bot_rocketjump+12
INDIRI4
CNSTI4 0
NEI4 $1144
CNSTI4 0
RETI4
ADDRGP4 $1143
JUMPV
LABELV $1144
line 2321
;2320:	//if no rocket launcher
;2321:	if (bs->inventory[INVENTORY_ROCKETLAUNCHER] <= 0) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 4984
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1147
CNSTI4 0
RETI4
ADDRGP4 $1143
JUMPV
LABELV $1147
line 2323
;2322:	//if low on rockets
;2323:	if (bs->inventory[INVENTORY_ROCKETS] < 3) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 5044
ADDP4
INDIRI4
CNSTI4 3
GEI4 $1149
CNSTI4 0
RETI4
ADDRGP4 $1143
JUMPV
LABELV $1149
line 2325
;2324:	//never rocket jump with the Quad
;2325:	if (bs->inventory[INVENTORY_QUAD]) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 5092
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1151
CNSTI4 0
RETI4
ADDRGP4 $1143
JUMPV
LABELV $1151
line 2327
;2326:	//if low on health
;2327:	if (bs->inventory[INVENTORY_HEALTH] < 60) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 60
GEI4 $1153
CNSTI4 0
RETI4
ADDRGP4 $1143
JUMPV
LABELV $1153
line 2329
;2328:	//if not full health
;2329:	if (bs->inventory[INVENTORY_HEALTH] < 90) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 90
GEI4 $1155
line 2331
;2330:		//if the bot has insufficient armor
;2331:		if (bs->inventory[INVENTORY_ARMOR] < 40) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 4956
ADDP4
INDIRI4
CNSTI4 40
GEI4 $1157
CNSTI4 0
RETI4
ADDRGP4 $1143
JUMPV
LABELV $1157
line 2332
;2332:	}
LABELV $1155
line 2333
;2333:	rocketjumper = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_WEAPONJUMPING, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 38
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 4
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 2334
;2334:	if (rocketjumper < 0.5) return qfalse;
ADDRLP4 0
INDIRF4
CNSTF4 1056964608
GEF4 $1159
CNSTI4 0
RETI4
ADDRGP4 $1143
JUMPV
LABELV $1159
line 2335
;2335:	return qtrue;
CNSTI4 1
RETI4
LABELV $1143
endproc BotCanAndWantsToRocketJump 8 16
export BotHasPersistantPowerupAndWeapon
proc BotHasPersistantPowerupAndWeapon 36 0
line 2343
;2336:}
;2337:
;2338:/*
;2339:==================
;2340:BotHasPersistantPowerupAndWeapon
;2341:==================
;2342:*/
;2343:int BotHasPersistantPowerupAndWeapon(bot_state_t *bs) {
line 2345
;2344:	// if the bot does not have a persistant powerup
;2345:	if (!bs->inventory[INVENTORY_SCOUT] &&
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 5116
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1162
ADDRLP4 0
INDIRP4
CNSTI4 5120
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1162
ADDRLP4 0
INDIRP4
CNSTI4 5124
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1162
ADDRLP4 0
INDIRP4
CNSTI4 5128
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1162
line 2348
;2346:		!bs->inventory[INVENTORY_GUARD] &&
;2347:		!bs->inventory[INVENTORY_DOUBLER] &&
;2348:		!bs->inventory[INVENTORY_AMMOREGEN] ) {
line 2349
;2349:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1161
JUMPV
LABELV $1162
line 2352
;2350:	}
;2351:	//if the bot is very low on health
;2352:	if (bs->inventory[INVENTORY_HEALTH] < 60) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 60
GEI4 $1164
CNSTI4 0
RETI4
ADDRGP4 $1161
JUMPV
LABELV $1164
line 2354
;2353:	//if the bot is low on health
;2354:	if (bs->inventory[INVENTORY_HEALTH] < 80) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 80
GEI4 $1166
line 2356
;2355:		//if the bot has insufficient armor
;2356:		if (bs->inventory[INVENTORY_ARMOR] < 40) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 4956
ADDP4
INDIRI4
CNSTI4 40
GEI4 $1168
CNSTI4 0
RETI4
ADDRGP4 $1161
JUMPV
LABELV $1168
line 2357
;2357:	}
LABELV $1166
line 2359
;2358:	//if the bot can use the bfg
;2359:	if (bs->inventory[INVENTORY_BFG10K] > 0 &&
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 5004
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1170
ADDRLP4 4
INDIRP4
CNSTI4 5052
ADDP4
INDIRI4
CNSTI4 7
LEI4 $1170
line 2360
;2360:			bs->inventory[INVENTORY_BFGAMMO] > 7) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1161
JUMPV
LABELV $1170
line 2362
;2361:	//if the bot can use the railgun
;2362:	if (bs->inventory[INVENTORY_RAILGUN] > 0 &&
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 4992
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1172
ADDRLP4 8
INDIRP4
CNSTI4 5048
ADDP4
INDIRI4
CNSTI4 5
LEI4 $1172
line 2363
;2363:			bs->inventory[INVENTORY_SLUGS] > 5) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1161
JUMPV
LABELV $1172
line 2365
;2364:	//if the bot can use the lightning gun
;2365:	if (bs->inventory[INVENTORY_LIGHTNING] > 0 &&
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 4988
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1174
ADDRLP4 12
INDIRP4
CNSTI4 5040
ADDP4
INDIRI4
CNSTI4 50
LEI4 $1174
line 2366
;2366:			bs->inventory[INVENTORY_LIGHTNINGAMMO] > 50) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1161
JUMPV
LABELV $1174
line 2368
;2367:	//if the bot can use the rocketlauncher
;2368:	if (bs->inventory[INVENTORY_ROCKETLAUNCHER] > 0 &&
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 4984
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1176
ADDRLP4 16
INDIRP4
CNSTI4 5044
ADDP4
INDIRI4
CNSTI4 5
LEI4 $1176
line 2369
;2369:			bs->inventory[INVENTORY_ROCKETS] > 5) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1161
JUMPV
LABELV $1176
line 2371
;2370:	//
;2371:	if (bs->inventory[INVENTORY_NAILGUN] > 0 &&
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 5012
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1178
ADDRLP4 20
INDIRP4
CNSTI4 5056
ADDP4
INDIRI4
CNSTI4 5
LEI4 $1178
line 2372
;2372:			bs->inventory[INVENTORY_NAILS] > 5) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1161
JUMPV
LABELV $1178
line 2374
;2373:	//
;2374:	if (bs->inventory[INVENTORY_PROXLAUNCHER] > 0 &&
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 5016
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1180
ADDRLP4 24
INDIRP4
CNSTI4 5060
ADDP4
INDIRI4
CNSTI4 5
LEI4 $1180
line 2375
;2375:			bs->inventory[INVENTORY_MINES] > 5) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1161
JUMPV
LABELV $1180
line 2377
;2376:	//
;2377:	if (bs->inventory[INVENTORY_CHAINGUN] > 0 &&
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 5020
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1182
ADDRLP4 28
INDIRP4
CNSTI4 5064
ADDP4
INDIRI4
CNSTI4 40
LEI4 $1182
line 2378
;2378:			bs->inventory[INVENTORY_BELT] > 40) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1161
JUMPV
LABELV $1182
line 2380
;2379:	//if the bot can use the plasmagun
;2380:	if (bs->inventory[INVENTORY_PLASMAGUN] > 0 &&
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 4996
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1184
ADDRLP4 32
INDIRP4
CNSTI4 5036
ADDP4
INDIRI4
CNSTI4 20
LEI4 $1184
line 2381
;2381:			bs->inventory[INVENTORY_CELLS] > 20) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1161
JUMPV
LABELV $1184
line 2382
;2382:	return qfalse;
CNSTI4 0
RETI4
LABELV $1161
endproc BotHasPersistantPowerupAndWeapon 36 0
export BotGoCamp
proc BotGoCamp 16 16
line 2390
;2383:}
;2384:
;2385:/*
;2386:==================
;2387:BotGoCamp
;2388:==================
;2389:*/
;2390:void BotGoCamp(bot_state_t *bs, bot_goal_t *goal) {
line 2393
;2391:	float camper;
;2392:
;2393:	bs->decisionmaker = bs->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 2395
;2394:	//set message time to zero so bot will NOT show any message
;2395:	bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 2397
;2396:	//set the ltg type
;2397:	bs->ltgtype = LTG_CAMP;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 7
ASGNI4
line 2399
;2398:	//set the team goal
;2399:	memcpy(&bs->teamgoal, goal, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 2401
;2400:	//get the team goal time
;2401:	camper = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CAMPER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 44
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 8
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
ASGNF4
line 2402
;2402:	if (camper > 0.99) bs->teamgoal_time = FloatTime() + 99999;
ADDRLP4 0
INDIRF4
CNSTF4 1065185444
LEF4 $1187
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1203982208
ADDF4
ASGNF4
ADDRGP4 $1188
JUMPV
LABELV $1187
line 2403
;2403:	else bs->teamgoal_time = FloatTime() + 120 + 180 * camper + random() * 15;
ADDRLP4 12
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ADDRLP4 0
INDIRF4
CNSTF4 1127481344
MULF4
ADDF4
ADDRLP4 12
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 972030432
MULF4
ADDF4
ASGNF4
LABELV $1188
line 2405
;2404:	//set the last time the bot started camping
;2405:	bs->camp_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6184
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2407
;2406:	//the teammate that requested the camping
;2407:	bs->teammate = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
CNSTI4 0
ASGNI4
line 2409
;2408:	//do NOT type arrive message
;2409:	bs->arrive_time = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
CNSTF4 1065353216
ASGNF4
line 2410
;2410:}
LABELV $1186
endproc BotGoCamp 16 16
export BotWantsToCamp
proc BotWantsToCamp 172 16
line 2417
;2411:
;2412:/*
;2413:==================
;2414:BotWantsToCamp
;2415:==================
;2416:*/
;2417:int BotWantsToCamp(bot_state_t *bs) {
line 2422
;2418:	float camper;
;2419:	int cs, traveltime, besttraveltime;
;2420:	bot_goal_t goal, bestgoal;
;2421:
;2422:	camper = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CAMPER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 44
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 128
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 124
ADDRLP4 128
INDIRF4
ASGNF4
line 2423
;2423:	if (camper < 0.1) return qfalse;
ADDRLP4 124
INDIRF4
CNSTF4 1036831949
GEF4 $1190
CNSTI4 0
RETI4
ADDRGP4 $1189
JUMPV
LABELV $1190
line 2425
;2424:	//if the bot has a team goal
;2425:	if (bs->ltgtype == LTG_TEAMHELP ||
ADDRLP4 132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 132
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 1
EQI4 $1200
ADDRLP4 132
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1200
ADDRLP4 132
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1200
ADDRLP4 132
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 4
EQI4 $1200
ADDRLP4 132
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 5
EQI4 $1200
ADDRLP4 132
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 7
EQI4 $1200
ADDRLP4 132
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 8
EQI4 $1200
ADDRLP4 132
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 9
NEI4 $1192
LABELV $1200
line 2432
;2426:			bs->ltgtype == LTG_TEAMACCOMPANY ||
;2427:			bs->ltgtype == LTG_DEFENDKEYAREA ||
;2428:			bs->ltgtype == LTG_GETFLAG ||
;2429:			bs->ltgtype == LTG_RUSHBASE ||
;2430:			bs->ltgtype == LTG_CAMP ||
;2431:			bs->ltgtype == LTG_CAMPORDER ||
;2432:			bs->ltgtype == LTG_PATROL) {
line 2433
;2433:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1189
JUMPV
LABELV $1192
line 2436
;2434:	}
;2435:	//if camped recently
;2436:	if (bs->camp_time > FloatTime() - 60 + 300 * (1-camper)) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6184
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1114636288
SUBF4
CNSTF4 1065353216
ADDRLP4 124
INDIRF4
SUBF4
CNSTF4 1133903872
MULF4
ADDF4
LEF4 $1201
CNSTI4 0
RETI4
ADDRGP4 $1189
JUMPV
LABELV $1201
line 2438
;2437:	//
;2438:	if (random() > camper) {
ADDRLP4 136
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 124
INDIRF4
LEF4 $1203
line 2439
;2439:		bs->camp_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6184
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2440
;2440:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1189
JUMPV
LABELV $1203
line 2443
;2441:	}
;2442:	//if the bot isn't healthy anough
;2443:	if (BotAggression(bs) < 50) return qfalse;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotAggression
CALLF4
ASGNF4
ADDRLP4 140
INDIRF4
CNSTF4 1112014848
GEF4 $1205
CNSTI4 0
RETI4
ADDRGP4 $1189
JUMPV
LABELV $1205
line 2445
;2444:	//the bot should have at least have the rocket launcher, the railgun or the bfg10k with some ammo
;2445:	if ((bs->inventory[INVENTORY_ROCKETLAUNCHER] <= 0 || bs->inventory[INVENTORY_ROCKETS] < 10) &&
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CNSTI4 4984
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1209
ADDRLP4 144
INDIRP4
CNSTI4 5044
ADDP4
INDIRI4
CNSTI4 10
GEI4 $1207
LABELV $1209
ADDRLP4 148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 4992
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1210
ADDRLP4 148
INDIRP4
CNSTI4 5048
ADDP4
INDIRI4
CNSTI4 10
GEI4 $1207
LABELV $1210
ADDRLP4 152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 152
INDIRP4
CNSTI4 5004
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1211
ADDRLP4 152
INDIRP4
CNSTI4 5052
ADDP4
INDIRI4
CNSTI4 10
GEI4 $1207
LABELV $1211
line 2447
;2446:		(bs->inventory[INVENTORY_RAILGUN] <= 0 || bs->inventory[INVENTORY_SLUGS] < 10) &&
;2447:		(bs->inventory[INVENTORY_BFG10K] <= 0 || bs->inventory[INVENTORY_BFGAMMO] < 10)) {
line 2448
;2448:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1189
JUMPV
LABELV $1207
line 2451
;2449:	}
;2450:	//find the closest camp spot
;2451:	besttraveltime = 99999;
ADDRLP4 64
CNSTI4 99999
ASGNI4
line 2452
;2452:	for (cs = trap_BotGetNextCampSpotGoal(0, &goal); cs; cs = trap_BotGetNextCampSpotGoal(cs, &goal)) {
CNSTI4 0
ARGI4
ADDRLP4 8
ARGP4
ADDRLP4 156
ADDRGP4 trap_BotGetNextCampSpotGoal
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 156
INDIRI4
ASGNI4
ADDRGP4 $1215
JUMPV
LABELV $1212
line 2453
;2453:		traveltime = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, goal.areanum, TFL_DEFAULT);
ADDRLP4 160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 160
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 160
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 8+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 164
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 164
INDIRI4
ASGNI4
line 2454
;2454:		if (traveltime && traveltime < besttraveltime) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1217
ADDRLP4 0
INDIRI4
ADDRLP4 64
INDIRI4
GEI4 $1217
line 2455
;2455:			besttraveltime = traveltime;
ADDRLP4 64
ADDRLP4 0
INDIRI4
ASGNI4
line 2456
;2456:			memcpy(&bestgoal, &goal, sizeof(bot_goal_t));
ADDRLP4 68
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 2457
;2457:		}
LABELV $1217
line 2458
;2458:	}
LABELV $1213
line 2452
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRLP4 160
ADDRGP4 trap_BotGetNextCampSpotGoal
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 160
INDIRI4
ASGNI4
LABELV $1215
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1212
line 2459
;2459:	if (besttraveltime > 150) return qfalse;
ADDRLP4 64
INDIRI4
CNSTI4 150
LEI4 $1219
CNSTI4 0
RETI4
ADDRGP4 $1189
JUMPV
LABELV $1219
line 2461
;2460:	//ok found a camp spot, go camp there
;2461:	BotGoCamp(bs, &bestgoal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 BotGoCamp
CALLV
pop
line 2462
;2462:	bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 2464
;2463:	//
;2464:	return qtrue;
CNSTI4 1
RETI4
LABELV $1189
endproc BotWantsToCamp 172 16
export BotDontAvoid
proc BotDontAvoid 68 12
line 2472
;2465:}
;2466:
;2467:/*
;2468:==================
;2469:BotDontAvoid
;2470:==================
;2471:*/
;2472:void BotDontAvoid(bot_state_t *bs, char *itemname) {
line 2476
;2473:	bot_goal_t goal;
;2474:	int num;
;2475:
;2476:	num = trap_BotGetLevelItemGoal(-1, itemname, &goal);
CNSTI4 -1
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 60
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 60
INDIRI4
ASGNI4
ADDRGP4 $1223
JUMPV
LABELV $1222
line 2477
;2477:	while(num >= 0) {
line 2478
;2478:		trap_BotRemoveFromAvoidGoals(bs->gs, goal.number);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRLP4 4+44
INDIRI4
ARGI4
ADDRGP4 trap_BotRemoveFromAvoidGoals
CALLV
pop
line 2479
;2479:		num = trap_BotGetLevelItemGoal(num, itemname, &goal);
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 64
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 64
INDIRI4
ASGNI4
line 2480
;2480:	}
LABELV $1223
line 2477
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $1222
line 2481
;2481:}
LABELV $1221
endproc BotDontAvoid 68 12
export BotGoForPowerups
proc BotGoForPowerups 0 8
line 2488
;2482:
;2483:/*
;2484:==================
;2485:BotGoForPowerups
;2486:==================
;2487:*/
;2488:void BotGoForPowerups(bot_state_t *bs) {
line 2491
;2489:
;2490:	//don't avoid any of the powerups anymore
;2491:	BotDontAvoid(bs, "Quad Damage");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1227
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 2492
;2492:	BotDontAvoid(bs, "Regeneration");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1228
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 2493
;2493:	BotDontAvoid(bs, "Battle Suit");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1229
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 2494
;2494:	BotDontAvoid(bs, "Speed");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1230
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 2495
;2495:	BotDontAvoid(bs, "Invisibility");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1231
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 2499
;2496:	//BotDontAvoid(bs, "Flight");
;2497:	//reset the long term goal time so the bot will go for the powerup
;2498:	//NOTE: the long term goal type doesn't change
;2499:	bs->ltg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6068
ADDP4
CNSTF4 0
ASGNF4
line 2500
;2500:}
LABELV $1226
endproc BotGoForPowerups 0 8
export BotRoamGoal
proc BotRoamGoal 168 28
line 2507
;2501:
;2502:/*
;2503:==================
;2504:BotRoamGoal
;2505:==================
;2506:*/
;2507:void BotRoamGoal(bot_state_t *bs, vec3_t goal) {
line 2513
;2508:	int pc, i;
;2509:	float len, rnd;
;2510:	vec3_t dir, bestorg, belowbestorg;
;2511:	bsp_trace_t trace;
;2512:
;2513:	for (i = 0; i < 10; i++) {
ADDRLP4 116
CNSTI4 0
ASGNI4
LABELV $1233
line 2515
;2514:		//start at the bot origin
;2515:		VectorCopy(bs->origin, bestorg);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 2516
;2516:		rnd = random();
ADDRLP4 136
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 112
ADDRLP4 136
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ASGNF4
line 2517
;2517:		if (rnd > 0.25) {
ADDRLP4 112
INDIRF4
CNSTF4 1048576000
LEF4 $1237
line 2519
;2518:			//add a random value to the x-coordinate
;2519:			if (random() < 0.5) bestorg[0] -= 800 * random() + 100;
ADDRLP4 140
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
GEF4 $1239
ADDRLP4 144
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 144
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1145569280
MULF4
CNSTF4 1120403456
ADDF4
SUBF4
ASGNF4
ADDRGP4 $1240
JUMPV
LABELV $1239
line 2520
;2520:			else bestorg[0] += 800 * random() + 100;
ADDRLP4 148
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 148
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1145569280
MULF4
CNSTF4 1120403456
ADDF4
ADDF4
ASGNF4
LABELV $1240
line 2521
;2521:		}
LABELV $1237
line 2522
;2522:		if (rnd < 0.75) {
ADDRLP4 112
INDIRF4
CNSTF4 1061158912
GEF4 $1241
line 2524
;2523:			//add a random value to the y-coordinate
;2524:			if (random() < 0.5) bestorg[1] -= 800 * random() + 100;
ADDRLP4 140
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
GEF4 $1243
ADDRLP4 144
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 144
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1145569280
MULF4
CNSTF4 1120403456
ADDF4
SUBF4
ASGNF4
ADDRGP4 $1244
JUMPV
LABELV $1243
line 2525
;2525:			else bestorg[1] += 800 * random() + 100;
ADDRLP4 148
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 148
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1145569280
MULF4
CNSTF4 1120403456
ADDF4
ADDF4
ASGNF4
LABELV $1244
line 2526
;2526:		}
LABELV $1241
line 2528
;2527:		//add a random value to the z-coordinate (NOTE: 48 = maxjump?)
;2528:		bestorg[2] += 2 * 48 * crandom();
ADDRLP4 140
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
ADDRLP4 140
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
SUBF4
CNSTF4 1073741824
MULF4
CNSTF4 1119879168
MULF4
ADDF4
ASGNF4
line 2530
;2529:		//trace a line from the origin to the roam target
;2530:		BotAI_Trace(&trace, bs->origin, NULL, NULL, bestorg, bs->entitynum, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 144
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 2532
;2531:		//direction and length towards the roam target
;2532:		VectorSubtract(trace.endpos, bs->origin, dir);
ADDRLP4 148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 24+12
INDIRF4
ADDRLP4 148
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 24+12+4
INDIRF4
ADDRLP4 148
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 24+12+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2533
;2533:		len = VectorNormalize(dir);
ADDRLP4 0
ARGP4
ADDRLP4 152
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 108
ADDRLP4 152
INDIRF4
ASGNF4
line 2535
;2534:		//if the roam target is far away anough
;2535:		if (len > 200) {
ADDRLP4 108
INDIRF4
CNSTF4 1128792064
LEF4 $1255
line 2537
;2536:			//the roam target is in the given direction before walls
;2537:			VectorScale(dir, len * trace.fraction - 40, dir);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 24+8
INDIRF4
MULF4
CNSTF4 1109393408
SUBF4
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 24+8
INDIRF4
MULF4
CNSTF4 1109393408
SUBF4
MULF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 24+8
INDIRF4
MULF4
CNSTF4 1109393408
SUBF4
MULF4
ASGNF4
line 2538
;2538:			VectorAdd(bs->origin, dir, bestorg);
ADDRLP4 160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 160
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 160
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
ADDF4
ASGNF4
line 2540
;2539:			//get the coordinates of the floor below the roam target
;2540:			belowbestorg[0] = bestorg[0];
ADDRLP4 120
ADDRLP4 12
INDIRF4
ASGNF4
line 2541
;2541:			belowbestorg[1] = bestorg[1];
ADDRLP4 120+4
ADDRLP4 12+4
INDIRF4
ASGNF4
line 2542
;2542:			belowbestorg[2] = bestorg[2] - 800;
ADDRLP4 120+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1145569280
SUBF4
ASGNF4
line 2543
;2543:			BotAI_Trace(&trace, bestorg, NULL, NULL, belowbestorg, bs->entitynum, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRLP4 12
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 120
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 2545
;2544:			//
;2545:			if (!trace.startsolid) {
ADDRLP4 24+4
INDIRI4
CNSTI4 0
NEI4 $1272
line 2546
;2546:				trace.endpos[2]++;
ADDRLP4 24+12+8
ADDRLP4 24+12+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2547
;2547:				pc = trap_PointContents(trace.endpos, bs->entitynum);
ADDRLP4 24+12
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 164
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 132
ADDRLP4 164
INDIRI4
ASGNI4
line 2548
;2548:				if (!(pc & (CONTENTS_LAVA | CONTENTS_SLIME))) {
ADDRLP4 132
INDIRI4
CNSTI4 24
BANDI4
CNSTI4 0
NEI4 $1278
line 2549
;2549:					VectorCopy(bestorg, goal);
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRB
ASGNB 12
line 2550
;2550:					return;
ADDRGP4 $1232
JUMPV
LABELV $1278
line 2552
;2551:				}
;2552:			}
LABELV $1272
line 2553
;2553:		}
LABELV $1255
line 2554
;2554:	}
LABELV $1234
line 2513
ADDRLP4 116
ADDRLP4 116
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 10
LTI4 $1233
line 2555
;2555:	VectorCopy(bestorg, goal);
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRB
ASGNB 12
line 2556
;2556:}
LABELV $1232
endproc BotRoamGoal 168 28
data
align 4
LABELV $1282
byte 4 0
byte 4 0
byte 4 1065353216
export BotAttackMove
code
proc BotAttackMove 392 16
line 2563
;2557:
;2558:/*
;2559:==================
;2560:BotAttackMove
;2561:==================
;2562:*/
;2563:bot_moveresult_t BotAttackMove(bot_state_t *bs, int tfl) {
line 2567
;2564:	int movetype, i, attackentity;
;2565:	float attack_skill, jumper, croucher, dist, strafechange_time;
;2566:	float attack_dist, attack_range;
;2567:	vec3_t forward, backward, sideward, hordir, up = {0, 0, 1};
ADDRLP4 56
ADDRGP4 $1282
INDIRB
ASGNB 12
line 2572
;2568:	aas_entityinfo_t entinfo;
;2569:	bot_moveresult_t moveresult;
;2570:	bot_goal_t goal;
;2571:
;2572:	attackentity = bs->enemy;
ADDRLP4 332
ADDRFP4 4
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ASGNI4
line 2574
;2573:	//
;2574:	if (bs->attackchase_time > FloatTime()) {
ADDRFP4 4
INDIRP4
CNSTI4 6124
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $1283
line 2576
;2575:		//create the chase goal
;2576:		goal.entitynum = attackentity;
ADDRLP4 136+40
ADDRLP4 332
INDIRI4
ASGNI4
line 2577
;2577:		goal.areanum = bs->lastenemyareanum;
ADDRLP4 136+12
ADDRFP4 4
INDIRP4
CNSTI4 6544
ADDP4
INDIRI4
ASGNI4
line 2578
;2578:		VectorCopy(bs->lastenemyorigin, goal.origin);
ADDRLP4 136
ADDRFP4 4
INDIRP4
CNSTI4 6548
ADDP4
INDIRB
ASGNB 12
line 2579
;2579:		VectorSet(goal.mins, -8, -8, -8);
ADDRLP4 136+16
CNSTF4 3238002688
ASGNF4
ADDRLP4 136+16+4
CNSTF4 3238002688
ASGNF4
ADDRLP4 136+16+8
CNSTF4 3238002688
ASGNF4
line 2580
;2580:		VectorSet(goal.maxs, 8, 8, 8);
ADDRLP4 136+28
CNSTF4 1090519040
ASGNF4
ADDRLP4 136+28+4
CNSTF4 1090519040
ASGNF4
ADDRLP4 136+28+8
CNSTF4 1090519040
ASGNF4
line 2582
;2581:		//initialize the movement state
;2582:		BotSetupForMovement(bs);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotSetupForMovement
CALLV
pop
line 2584
;2583:		//move towards the goal
;2584:		trap_BotMoveToGoal(&moveresult, bs->ms, &goal, tfl);
ADDRLP4 80
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 136
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 trap_BotMoveToGoal
CALLV
pop
line 2585
;2585:		return moveresult;
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $1280
JUMPV
LABELV $1283
line 2588
;2586:	}
;2587:	//
;2588:	memset(&moveresult, 0, sizeof(bot_moveresult_t));
ADDRLP4 80
ARGP4
CNSTI4 0
ARGI4
CNSTI4 52
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2590
;2589:	//
;2590:	attack_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_ATTACK_SKILL, 0, 1);
ADDRFP4 4
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 348
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 132
ADDRLP4 348
INDIRF4
ASGNF4
line 2591
;2591:	jumper = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_JUMPER, 0, 1);
ADDRFP4 4
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 37
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 352
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 340
ADDRLP4 352
INDIRF4
ASGNF4
line 2592
;2592:	croucher = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CROUCHER, 0, 1);
ADDRFP4 4
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 36
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 356
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 344
ADDRLP4 356
INDIRF4
ASGNF4
line 2594
;2593:	//if the bot is really stupid
;2594:	if (attack_skill < 0.2) return moveresult;
ADDRLP4 132
INDIRF4
CNSTF4 1045220557
GEF4 $1297
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $1280
JUMPV
LABELV $1297
line 2596
;2595:	//initialize the movement state
;2596:	BotSetupForMovement(bs);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotSetupForMovement
CALLV
pop
line 2598
;2597:	//get the enemy entity info
;2598:	BotEntityInfo(attackentity, &entinfo);
ADDRLP4 332
INDIRI4
ARGI4
ADDRLP4 192
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2600
;2599:	//direction towards the enemy
;2600:	VectorSubtract(entinfo.origin, bs->origin, forward);
ADDRLP4 360
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 192+24
INDIRF4
ADDRLP4 360
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 192+24+4
INDIRF4
ADDRLP4 360
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+8
ADDRLP4 192+24+8
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2602
;2601:	//the distance towards the enemy
;2602:	dist = VectorNormalize(forward);
ADDRLP4 24
ARGP4
ADDRLP4 364
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 68
ADDRLP4 364
INDIRF4
ASGNF4
line 2603
;2603:	VectorNegate(forward, backward);
ADDRLP4 36
ADDRLP4 24
INDIRF4
NEGF4
ASGNF4
ADDRLP4 36+4
ADDRLP4 24+4
INDIRF4
NEGF4
ASGNF4
ADDRLP4 36+8
ADDRLP4 24+8
INDIRF4
NEGF4
ASGNF4
line 2605
;2604:	//walk, crouch or jump
;2605:	movetype = MOVE_WALK;
ADDRLP4 52
CNSTI4 1
ASGNI4
line 2607
;2606:	//
;2607:	if (bs->attackcrouch_time < FloatTime() - 1) {
ADDRFP4 4
INDIRP4
CNSTI4 6120
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
SUBF4
GEF4 $1310
line 2608
;2608:		if (random() < jumper) {
ADDRLP4 368
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 368
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 340
INDIRF4
GEF4 $1312
line 2609
;2609:			movetype = MOVE_JUMP;
ADDRLP4 52
CNSTI4 4
ASGNI4
line 2610
;2610:		}
ADDRGP4 $1313
JUMPV
LABELV $1312
line 2612
;2611:		//wait at least one second before crouching again
;2612:		else if (bs->attackcrouch_time < FloatTime() - 1 && random() < croucher) {
ADDRFP4 4
INDIRP4
CNSTI4 6120
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
SUBF4
GEF4 $1314
ADDRLP4 372
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 372
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 344
INDIRF4
GEF4 $1314
line 2613
;2613:			bs->attackcrouch_time = FloatTime() + croucher * 5;
ADDRFP4 4
INDIRP4
CNSTI4 6120
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 344
INDIRF4
CNSTF4 1084227584
MULF4
ADDF4
ASGNF4
line 2614
;2614:		}
LABELV $1314
LABELV $1313
line 2615
;2615:	}
LABELV $1310
line 2616
;2616:	if (bs->attackcrouch_time > FloatTime()) movetype = MOVE_CROUCH;
ADDRFP4 4
INDIRP4
CNSTI4 6120
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $1316
ADDRLP4 52
CNSTI4 2
ASGNI4
LABELV $1316
line 2618
;2617:	//if the bot should jump
;2618:	if (movetype == MOVE_JUMP) {
ADDRLP4 52
INDIRI4
CNSTI4 4
NEI4 $1318
line 2620
;2619:		//if jumped last frame
;2620:		if (bs->attackjump_time > FloatTime()) {
ADDRFP4 4
INDIRP4
CNSTI4 6128
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $1320
line 2621
;2621:			movetype = MOVE_WALK;
ADDRLP4 52
CNSTI4 1
ASGNI4
line 2622
;2622:		}
ADDRGP4 $1321
JUMPV
LABELV $1320
line 2623
;2623:		else {
line 2624
;2624:			bs->attackjump_time = FloatTime() + 1;
ADDRFP4 4
INDIRP4
CNSTI4 6128
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2625
;2625:		}
LABELV $1321
line 2626
;2626:	}
LABELV $1318
line 2627
;2627:	if (bs->cur_ps.weapon == WP_GAUNTLET) {
ADDRFP4 4
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1322
line 2628
;2628:		attack_dist = 0;
ADDRLP4 72
CNSTF4 0
ASGNF4
line 2629
;2629:		attack_range = 0;
ADDRLP4 76
CNSTF4 0
ASGNF4
line 2630
;2630:	}
ADDRGP4 $1323
JUMPV
LABELV $1322
line 2631
;2631:	else {
line 2632
;2632:		attack_dist = IDEAL_ATTACKDIST;
ADDRLP4 72
CNSTF4 1124859904
ASGNF4
line 2633
;2633:		attack_range = 40;
ADDRLP4 76
CNSTF4 1109393408
ASGNF4
line 2634
;2634:	}
LABELV $1323
line 2636
;2635:	//if the bot is stupid
;2636:	if (attack_skill <= 0.4) {
ADDRLP4 132
INDIRF4
CNSTF4 1053609165
GTF4 $1324
line 2638
;2637:		//just walk to or away from the enemy
;2638:		if (dist > attack_dist + attack_range) {
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
ADDRLP4 76
INDIRF4
ADDF4
LEF4 $1326
line 2639
;2639:			if (trap_BotMoveInDirection(bs->ms, forward, 400, movetype)) return moveresult;
ADDRFP4 4
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
CNSTF4 1137180672
ARGF4
ADDRLP4 52
INDIRI4
ARGI4
ADDRLP4 368
ADDRGP4 trap_BotMoveInDirection
CALLI4
ASGNI4
ADDRLP4 368
INDIRI4
CNSTI4 0
EQI4 $1328
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $1280
JUMPV
LABELV $1328
line 2640
;2640:		}
LABELV $1326
line 2641
;2641:		if (dist < attack_dist - attack_range) {
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
ADDRLP4 76
INDIRF4
SUBF4
GEF4 $1330
line 2642
;2642:			if (trap_BotMoveInDirection(bs->ms, backward, 400, movetype)) return moveresult;
ADDRFP4 4
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ARGP4
CNSTF4 1137180672
ARGF4
ADDRLP4 52
INDIRI4
ARGI4
ADDRLP4 368
ADDRGP4 trap_BotMoveInDirection
CALLI4
ASGNI4
ADDRLP4 368
INDIRI4
CNSTI4 0
EQI4 $1332
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $1280
JUMPV
LABELV $1332
line 2643
;2643:		}
LABELV $1330
line 2644
;2644:		return moveresult;
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $1280
JUMPV
LABELV $1324
line 2647
;2645:	}
;2646:	//increase the strafe time
;2647:	bs->attackstrafe_time += bs->thinktime;
ADDRLP4 368
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 372
ADDRLP4 368
INDIRP4
CNSTI4 6116
ADDP4
ASGNP4
ADDRLP4 372
INDIRP4
ADDRLP4 372
INDIRP4
INDIRF4
ADDRLP4 368
INDIRP4
CNSTI4 4904
ADDP4
INDIRF4
ADDF4
ASGNF4
line 2649
;2648:	//get the strafe change time
;2649:	strafechange_time = 0.4 + (1 - attack_skill) * 0.2;
ADDRLP4 336
CNSTF4 1065353216
ADDRLP4 132
INDIRF4
SUBF4
CNSTF4 1045220557
MULF4
CNSTF4 1053609165
ADDF4
ASGNF4
line 2650
;2650:	if (attack_skill > 0.7) strafechange_time += crandom() * 0.2;
ADDRLP4 132
INDIRF4
CNSTF4 1060320051
LEF4 $1334
ADDRLP4 376
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 336
ADDRLP4 336
INDIRF4
ADDRLP4 376
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
SUBF4
CNSTF4 1053609165
MULF4
ADDF4
ASGNF4
LABELV $1334
line 2652
;2651:	//if the strafe direction should be changed
;2652:	if (bs->attackstrafe_time > strafechange_time) {
ADDRFP4 4
INDIRP4
CNSTI4 6116
ADDP4
INDIRF4
ADDRLP4 336
INDIRF4
LEF4 $1336
line 2654
;2653:		//some magic number :)
;2654:		if (random() > 0.935) {
ADDRLP4 380
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 380
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1064262697
LEF4 $1338
line 2656
;2655:			//flip the strafe direction
;2656:			bs->flags ^= BFL_STRAFERIGHT;
ADDRLP4 384
ADDRFP4 4
INDIRP4
CNSTI4 5980
ADDP4
ASGNP4
ADDRLP4 384
INDIRP4
ADDRLP4 384
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 2657
;2657:			bs->attackstrafe_time = 0;
ADDRFP4 4
INDIRP4
CNSTI4 6116
ADDP4
CNSTF4 0
ASGNF4
line 2658
;2658:		}
LABELV $1338
line 2659
;2659:	}
LABELV $1336
line 2661
;2660:	//
;2661:	for (i = 0; i < 2; i++) {
ADDRLP4 48
CNSTI4 0
ASGNI4
LABELV $1340
line 2662
;2662:		hordir[0] = forward[0];
ADDRLP4 12
ADDRLP4 24
INDIRF4
ASGNF4
line 2663
;2663:		hordir[1] = forward[1];
ADDRLP4 12+4
ADDRLP4 24+4
INDIRF4
ASGNF4
line 2664
;2664:		hordir[2] = 0;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 2665
;2665:		VectorNormalize(hordir);
ADDRLP4 12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2667
;2666:		//get the sideward vector
;2667:		CrossProduct(hordir, up, sideward);
ADDRLP4 12
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 2669
;2668:		//reverse the vector depending on the strafe direction
;2669:		if (bs->flags & BFL_STRAFERIGHT) VectorNegate(sideward, sideward);
ADDRFP4 4
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1347
ADDRLP4 0
ADDRLP4 0
INDIRF4
NEGF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
NEGF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
NEGF4
ASGNF4
LABELV $1347
line 2671
;2670:		//randomly go back a little
;2671:		if (random() > 0.9) {
ADDRLP4 380
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 380
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1063675494
LEF4 $1353
line 2672
;2672:			VectorAdd(sideward, backward, sideward);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 36+8
INDIRF4
ADDF4
ASGNF4
line 2673
;2673:		}
ADDRGP4 $1354
JUMPV
LABELV $1353
line 2674
;2674:		else {
line 2676
;2675:			//walk forward or backward to get at the ideal attack distance
;2676:			if (dist > attack_dist + attack_range) {
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
ADDRLP4 76
INDIRF4
ADDF4
LEF4 $1361
line 2677
;2677:				VectorAdd(sideward, forward, sideward);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 24
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 24+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 24+8
INDIRF4
ADDF4
ASGNF4
line 2678
;2678:			}
ADDRGP4 $1362
JUMPV
LABELV $1361
line 2679
;2679:			else if (dist < attack_dist - attack_range) {
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
ADDRLP4 76
INDIRF4
SUBF4
GEF4 $1369
line 2680
;2680:				VectorAdd(sideward, backward, sideward);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 36+8
INDIRF4
ADDF4
ASGNF4
line 2681
;2681:			}
LABELV $1369
LABELV $1362
line 2682
;2682:		}
LABELV $1354
line 2684
;2683:		//perform the movement
;2684:		if (trap_BotMoveInDirection(bs->ms, sideward, 400, movetype))
ADDRFP4 4
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTF4 1137180672
ARGF4
ADDRLP4 52
INDIRI4
ARGI4
ADDRLP4 384
ADDRGP4 trap_BotMoveInDirection
CALLI4
ASGNI4
ADDRLP4 384
INDIRI4
CNSTI4 0
EQI4 $1377
line 2685
;2685:			return moveresult;
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $1280
JUMPV
LABELV $1377
line 2687
;2686:		//movement failed, flip the strafe direction
;2687:		bs->flags ^= BFL_STRAFERIGHT;
ADDRLP4 388
ADDRFP4 4
INDIRP4
CNSTI4 5980
ADDP4
ASGNP4
ADDRLP4 388
INDIRP4
ADDRLP4 388
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 2688
;2688:		bs->attackstrafe_time = 0;
ADDRFP4 4
INDIRP4
CNSTI4 6116
ADDP4
CNSTF4 0
ASGNF4
line 2689
;2689:	}
LABELV $1341
line 2661
ADDRLP4 48
ADDRLP4 48
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 2
LTI4 $1340
line 2692
;2690:	//bot couldn't do any usefull movement
;2691://	bs->attackchase_time = AAS_Time() + 6;
;2692:	return moveresult;
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
LABELV $1280
endproc BotAttackMove 392 16
export BotSameTeam
proc BotSameTeam 4 0
line 2700
;2693:}
;2694:
;2695:/*
;2696:==================
;2697:BotSameTeam
;2698:==================
;2699:*/
;2700:int BotSameTeam(bot_state_t *bs, int entnum) {
line 2704
;2701:
;2702:	extern gclient_t g_clients[ MAX_CLIENTS ];
;2703:
;2704:	if ( (unsigned) bs->client >= MAX_CLIENTS ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CVIU4 4
CNSTU4 64
LTU4 $1380
line 2706
;2705:		//BotAI_Print(PRT_ERROR, "BotSameTeam: client out of range\n");
;2706:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1379
JUMPV
LABELV $1380
line 2708
;2707:	}
;2708:	if ( (unsigned) entnum >= MAX_CLIENTS ) {
ADDRFP4 4
INDIRI4
CVIU4 4
CNSTU4 64
LTU4 $1382
line 2710
;2709:		//BotAI_Print(PRT_ERROR, "BotSameTeam: client out of range\n");
;2710:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1379
JUMPV
LABELV $1382
line 2712
;2711:	}
;2712:	if ( TeamPlayIsOn() ) {
ADDRLP4 0
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1384
line 2713
;2713:		if ( g_clients[bs->client].sess.sessionTeam == g_clients[entnum].sess.sessionTeam )
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1636
MULI4
ADDRGP4 g_clients+624
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 1636
MULI4
ADDRGP4 g_clients+624
ADDP4
INDIRI4
NEI4 $1386
line 2714
;2714:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1379
JUMPV
LABELV $1386
line 2715
;2715:	}
LABELV $1384
line 2716
;2716:	return qfalse;
CNSTI4 0
RETI4
LABELV $1379
endproc BotSameTeam 4 0
export InFieldOfVision
proc InFieldOfVision 28 4
line 2725
;2717:}
;2718:
;2719:/*
;2720:==================
;2721:InFieldOfVision
;2722:==================
;2723:*/
;2724:qboolean InFieldOfVision(vec3_t viewangles, float fov, vec3_t angles)
;2725:{
line 2729
;2726:	int i;
;2727:	float diff, angle;
;2728:
;2729:	for (i = 0; i < 2; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1391
line 2730
;2730:		angle = AngleMod(viewangles[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 12
INDIRF4
ASGNF4
line 2731
;2731:		angles[i] = AngleMod(angles[i]);
ADDRLP4 20
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
ADDP4
ADDRLP4 24
INDIRF4
ASGNF4
line 2732
;2732:		diff = angles[i] - angle;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
ASGNF4
line 2733
;2733:		if (angles[i] > angle) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $1395
line 2734
;2734:			if (diff > 180.0) diff -= 360.0;
ADDRLP4 4
INDIRF4
CNSTF4 1127481344
LEF4 $1396
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
line 2735
;2735:		}
ADDRGP4 $1396
JUMPV
LABELV $1395
line 2736
;2736:		else {
line 2737
;2737:			if (diff < -180.0) diff += 360.0;
ADDRLP4 4
INDIRF4
CNSTF4 3274964992
GEF4 $1399
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
LABELV $1399
line 2738
;2738:		}
LABELV $1396
line 2739
;2739:		if (diff > 0) {
ADDRLP4 4
INDIRF4
CNSTF4 0
LEF4 $1401
line 2740
;2740:			if (diff > fov * 0.5) return qfalse;
ADDRLP4 4
INDIRF4
ADDRFP4 4
INDIRF4
CNSTF4 1056964608
MULF4
LEF4 $1402
CNSTI4 0
RETI4
ADDRGP4 $1390
JUMPV
line 2741
;2741:		}
LABELV $1401
line 2742
;2742:		else {
line 2743
;2743:			if (diff < -fov * 0.5) return qfalse;
ADDRLP4 4
INDIRF4
ADDRFP4 4
INDIRF4
NEGF4
CNSTF4 1056964608
MULF4
GEF4 $1405
CNSTI4 0
RETI4
ADDRGP4 $1390
JUMPV
LABELV $1405
line 2744
;2744:		}
LABELV $1402
line 2745
;2745:	}
LABELV $1392
line 2729
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $1391
line 2746
;2746:	return qtrue;
CNSTI4 1
RETI4
LABELV $1390
endproc InFieldOfVision 28 4
export BotEntityVisible
proc BotEntityVisible 360 28
line 2756
;2747:}
;2748:
;2749:/*
;2750:==================
;2751:BotEntityVisible
;2752:
;2753:returns visibility in the range [0, 1] taking fog and water surfaces into account
;2754:==================
;2755:*/
;2756:float BotEntityVisible(int viewer, vec3_t eye, vec3_t viewangles, float fov, int ent) {
line 2764
;2757:	int i, contents_mask, passent, hitent, infog, inwater, otherinfog, pc;
;2758:	float squaredfogdist, waterfactor, vis, bestvis;
;2759:	bsp_trace_t trace;
;2760:	aas_entityinfo_t entinfo;
;2761:	vec3_t dir, entangles, start, end, middle;
;2762:
;2763:	//calculate middle of bounding box
;2764:	BotEntityInfo(ent, &entinfo);
ADDRFP4 16
INDIRI4
ARGI4
ADDRLP4 148
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2765
;2765:	if (!entinfo.valid)
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $1408
line 2766
;2766:		return 0;
CNSTF4 0
RETF4
ADDRGP4 $1407
JUMPV
LABELV $1408
line 2767
;2767:	VectorAdd(entinfo.mins, entinfo.maxs, middle);
ADDRLP4 84
ADDRLP4 148+72
INDIRF4
ADDRLP4 148+84
INDIRF4
ADDF4
ASGNF4
ADDRLP4 84+4
ADDRLP4 148+72+4
INDIRF4
ADDRLP4 148+84+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 84+8
ADDRLP4 148+72+8
INDIRF4
ADDRLP4 148+84+8
INDIRF4
ADDF4
ASGNF4
line 2768
;2768:	VectorScale(middle, 0.5, middle);
ADDRLP4 84
ADDRLP4 84
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
ADDRLP4 84+4
ADDRLP4 84+4
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
ADDRLP4 84+8
ADDRLP4 84+8
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 2769
;2769:	VectorAdd(entinfo.origin, middle, middle);
ADDRLP4 84
ADDRLP4 148+24
INDIRF4
ADDRLP4 84
INDIRF4
ADDF4
ASGNF4
ADDRLP4 84+4
ADDRLP4 148+24+4
INDIRF4
ADDRLP4 84+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 84+8
ADDRLP4 148+24+8
INDIRF4
ADDRLP4 84+8
INDIRF4
ADDF4
ASGNF4
line 2771
;2770:	//check if entity is within field of vision
;2771:	VectorSubtract(middle, eye, dir);
ADDRLP4 332
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 136
ADDRLP4 84
INDIRF4
ADDRLP4 332
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+4
ADDRLP4 84+4
INDIRF4
ADDRLP4 332
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+8
ADDRLP4 84+8
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2772
;2772:	vectoangles(dir, entangles);
ADDRLP4 136
ARGP4
ADDRLP4 320
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2773
;2773:	if (!InFieldOfVision(viewangles, fov, entangles)) return 0;
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 320
ARGP4
ADDRLP4 336
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 336
INDIRI4
CNSTI4 0
NEI4 $1439
CNSTF4 0
RETF4
ADDRGP4 $1407
JUMPV
LABELV $1439
line 2775
;2774:	//
;2775:	pc = trap_AAS_PointContents(eye);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 340
ADDRGP4 trap_AAS_PointContents
CALLI4
ASGNI4
ADDRLP4 316
ADDRLP4 340
INDIRI4
ASGNI4
line 2776
;2776:	infog = (pc & CONTENTS_FOG);
ADDRLP4 312
ADDRLP4 316
INDIRI4
CNSTI4 64
BANDI4
ASGNI4
line 2777
;2777:	inwater = (pc & (CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER));
ADDRLP4 308
ADDRLP4 316
INDIRI4
CNSTI4 56
BANDI4
ASGNI4
line 2779
;2778:	//
;2779:	bestvis = 0;
ADDRLP4 296
CNSTF4 0
ASGNF4
line 2780
;2780:	for (i = 0; i < 3; i++) {
ADDRLP4 100
CNSTI4 0
ASGNI4
LABELV $1441
line 2784
;2781:		//if the point is not in potential visible sight
;2782:		//if (!AAS_inPVS(eye, middle)) continue;
;2783:		//
;2784:		contents_mask = CONTENTS_SOLID|CONTENTS_PLAYERCLIP;
ADDRLP4 96
CNSTI4 65537
ASGNI4
line 2785
;2785:		passent = viewer;
ADDRLP4 116
ADDRFP4 0
INDIRI4
ASGNI4
line 2786
;2786:		hitent = ent;
ADDRLP4 132
ADDRFP4 16
INDIRI4
ASGNI4
line 2787
;2787:		VectorCopy(eye, start);
ADDRLP4 120
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 2788
;2788:		VectorCopy(middle, end);
ADDRLP4 104
ADDRLP4 84
INDIRB
ASGNB 12
line 2790
;2789:		//if the entity is in water, lava or slime
;2790:		if (trap_AAS_PointContents(middle) & (CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER)) {
ADDRLP4 84
ARGP4
ADDRLP4 344
ADDRGP4 trap_AAS_PointContents
CALLI4
ASGNI4
ADDRLP4 344
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $1445
line 2791
;2791:			contents_mask |= (CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER);
ADDRLP4 96
ADDRLP4 96
INDIRI4
CNSTI4 56
BORI4
ASGNI4
line 2792
;2792:		}
LABELV $1445
line 2794
;2793:		//if eye is in water, lava or slime
;2794:		if (inwater) {
ADDRLP4 308
INDIRI4
CNSTI4 0
EQI4 $1447
line 2795
;2795:			if (!(contents_mask & (CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER))) {
ADDRLP4 96
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
NEI4 $1449
line 2796
;2796:				passent = ent;
ADDRLP4 116
ADDRFP4 16
INDIRI4
ASGNI4
line 2797
;2797:				hitent = viewer;
ADDRLP4 132
ADDRFP4 0
INDIRI4
ASGNI4
line 2798
;2798:				VectorCopy(middle, start);
ADDRLP4 120
ADDRLP4 84
INDIRB
ASGNB 12
line 2799
;2799:				VectorCopy(eye, end);
ADDRLP4 104
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 2800
;2800:			}
LABELV $1449
line 2801
;2801:			contents_mask ^= (CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER);
ADDRLP4 96
ADDRLP4 96
INDIRI4
CNSTI4 56
BXORI4
ASGNI4
line 2802
;2802:		}
LABELV $1447
line 2804
;2803:		//trace from start to end
;2804:		BotAI_Trace(&trace, start, NULL, NULL, end, passent, contents_mask);
ADDRLP4 0
ARGP4
ADDRLP4 120
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 116
INDIRI4
ARGI4
ADDRLP4 96
INDIRI4
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 2806
;2805:		//if water was hit
;2806:		waterfactor = 1.0;
ADDRLP4 288
CNSTF4 1065353216
ASGNF4
line 2807
;2807:		if (trace.contents & (CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER)) {
ADDRLP4 0+76
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $1451
line 2809
;2808:			//if the water surface is translucent
;2809:			if (1) {
line 2811
;2810:				//trace through the water
;2811:				contents_mask &= ~(CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER);
ADDRLP4 96
ADDRLP4 96
INDIRI4
CNSTI4 -57
BANDI4
ASGNI4
line 2812
;2812:				BotAI_Trace(&trace, trace.endpos, NULL, NULL, end, passent, contents_mask);
ADDRLP4 0
ARGP4
ADDRLP4 0+12
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 116
INDIRI4
ARGI4
ADDRLP4 96
INDIRI4
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 2813
;2813:				waterfactor = 0.5;
ADDRLP4 288
CNSTF4 1056964608
ASGNF4
line 2814
;2814:			}
LABELV $1454
line 2815
;2815:		}
LABELV $1451
line 2817
;2816:		//if a full trace or the hitent was hit
;2817:		if (trace.fraction >= 1 || trace.ent == hitent) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
GEF4 $1461
ADDRLP4 0+80
INDIRI4
ADDRLP4 132
INDIRI4
NEI4 $1457
LABELV $1461
line 2820
;2818:			//check for fog, assuming there's only one fog brush where
;2819:			//either the viewer or the entity is in or both are in
;2820:			otherinfog = (trap_AAS_PointContents(middle) & CONTENTS_FOG);
ADDRLP4 84
ARGP4
ADDRLP4 348
ADDRGP4 trap_AAS_PointContents
CALLI4
ASGNI4
ADDRLP4 304
ADDRLP4 348
INDIRI4
CNSTI4 64
BANDI4
ASGNI4
line 2821
;2821:			if (infog && otherinfog) {
ADDRLP4 312
INDIRI4
CNSTI4 0
EQI4 $1462
ADDRLP4 304
INDIRI4
CNSTI4 0
EQI4 $1462
line 2822
;2822:				VectorSubtract(trace.endpos, eye, dir);
ADDRLP4 352
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 136
ADDRLP4 0+12
INDIRF4
ADDRLP4 352
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+4
ADDRLP4 0+12+4
INDIRF4
ADDRLP4 352
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+8
ADDRLP4 0+12+8
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2823
;2823:				squaredfogdist = VectorLengthSquared(dir);
ADDRLP4 136
ARGP4
ADDRLP4 356
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 300
ADDRLP4 356
INDIRF4
ASGNF4
line 2824
;2824:			}
ADDRGP4 $1463
JUMPV
LABELV $1462
line 2825
;2825:			else if (infog) {
ADDRLP4 312
INDIRI4
CNSTI4 0
EQI4 $1471
line 2826
;2826:				VectorCopy(trace.endpos, start);
ADDRLP4 120
ADDRLP4 0+12
INDIRB
ASGNB 12
line 2827
;2827:				BotAI_Trace(&trace, start, NULL, NULL, eye, viewer, CONTENTS_FOG);
ADDRLP4 0
ARGP4
ADDRLP4 120
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 64
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 2828
;2828:				VectorSubtract(eye, trace.endpos, dir);
ADDRLP4 352
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 136
ADDRLP4 352
INDIRP4
INDIRF4
ADDRLP4 0+12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+4
ADDRLP4 352
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0+12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0+12+8
INDIRF4
SUBF4
ASGNF4
line 2829
;2829:				squaredfogdist = VectorLengthSquared(dir);
ADDRLP4 136
ARGP4
ADDRLP4 356
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 300
ADDRLP4 356
INDIRF4
ASGNF4
line 2830
;2830:			}
ADDRGP4 $1472
JUMPV
LABELV $1471
line 2831
;2831:			else if (otherinfog) {
ADDRLP4 304
INDIRI4
CNSTI4 0
EQI4 $1481
line 2832
;2832:				VectorCopy(trace.endpos, end);
ADDRLP4 104
ADDRLP4 0+12
INDIRB
ASGNB 12
line 2833
;2833:				BotAI_Trace(&trace, eye, NULL, NULL, end, viewer, CONTENTS_FOG);
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 104
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 64
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 2834
;2834:				VectorSubtract(end, trace.endpos, dir);
ADDRLP4 136
ADDRLP4 104
INDIRF4
ADDRLP4 0+12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+4
ADDRLP4 104+4
INDIRF4
ADDRLP4 0+12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+8
ADDRLP4 104+8
INDIRF4
ADDRLP4 0+12+8
INDIRF4
SUBF4
ASGNF4
line 2835
;2835:				squaredfogdist = VectorLengthSquared(dir);
ADDRLP4 136
ARGP4
ADDRLP4 352
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 300
ADDRLP4 352
INDIRF4
ASGNF4
line 2836
;2836:			}
ADDRGP4 $1482
JUMPV
LABELV $1481
line 2837
;2837:			else {
line 2839
;2838:				//if the entity and the viewer are not in fog assume there's no fog in between
;2839:				squaredfogdist = 0;
ADDRLP4 300
CNSTF4 0
ASGNF4
line 2840
;2840:			}
LABELV $1482
LABELV $1472
LABELV $1463
line 2842
;2841:			//decrease visibility with the view distance through fog
;2842:			vis = 1 / ((squaredfogdist * 0.001) < 1 ? 1 : (squaredfogdist * 0.001));
ADDRLP4 300
INDIRF4
CNSTF4 981668463
MULF4
CNSTF4 1065353216
GEF4 $1494
ADDRLP4 352
CNSTF4 1065353216
ASGNF4
ADDRGP4 $1495
JUMPV
LABELV $1494
ADDRLP4 352
ADDRLP4 300
INDIRF4
CNSTF4 981668463
MULF4
ASGNF4
LABELV $1495
ADDRLP4 292
CNSTF4 1065353216
ADDRLP4 352
INDIRF4
DIVF4
ASGNF4
line 2844
;2843:			//if entering water visibility is reduced
;2844:			vis *= waterfactor;
ADDRLP4 292
ADDRLP4 292
INDIRF4
ADDRLP4 288
INDIRF4
MULF4
ASGNF4
line 2846
;2845:			//
;2846:			if (vis > bestvis) bestvis = vis;
ADDRLP4 292
INDIRF4
ADDRLP4 296
INDIRF4
LEF4 $1496
ADDRLP4 296
ADDRLP4 292
INDIRF4
ASGNF4
LABELV $1496
line 2848
;2847:			//if pretty much no fog
;2848:			if (bestvis >= 0.95) return bestvis;
ADDRLP4 296
INDIRF4
CNSTF4 1064514355
LTF4 $1498
ADDRLP4 296
INDIRF4
RETF4
ADDRGP4 $1407
JUMPV
LABELV $1498
line 2849
;2849:		}
LABELV $1457
line 2851
;2850:		//check bottom and top of bounding box as well
;2851:		if (i == 0) middle[2] += entinfo.mins[2];
ADDRLP4 100
INDIRI4
CNSTI4 0
NEI4 $1500
ADDRLP4 84+8
ADDRLP4 84+8
INDIRF4
ADDRLP4 148+72+8
INDIRF4
ADDF4
ASGNF4
ADDRGP4 $1501
JUMPV
LABELV $1500
line 2852
;2852:		else if (i == 1) middle[2] += entinfo.maxs[2] - entinfo.mins[2];
ADDRLP4 100
INDIRI4
CNSTI4 1
NEI4 $1505
ADDRLP4 84+8
ADDRLP4 84+8
INDIRF4
ADDRLP4 148+84+8
INDIRF4
ADDRLP4 148+72+8
INDIRF4
SUBF4
ADDF4
ASGNF4
LABELV $1505
LABELV $1501
line 2853
;2853:	}
LABELV $1442
line 2780
ADDRLP4 100
ADDRLP4 100
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 3
LTI4 $1441
line 2854
;2854:	return bestvis;
ADDRLP4 296
INDIRF4
RETF4
LABELV $1407
endproc BotEntityVisible 360 28
export BotFindEnemy
proc BotFindEnemy 464 28
line 2862
;2855:}
;2856:
;2857:/*
;2858:==================
;2859:BotFindEnemy
;2860:==================
;2861:*/
;2862:int BotFindEnemy(bot_state_t *bs, int curenemy) {
line 2869
;2863:	int i, healthdecrease;
;2864:	float f, alertness, easyfragger, vis;
;2865:	float squaredist, cursquaredist;
;2866:	aas_entityinfo_t entinfo, curenemyinfo;
;2867:	vec3_t dir, angles;
;2868:
;2869:	alertness = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_ALERTNESS, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 46
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 336
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 164
ADDRLP4 336
INDIRF4
ASGNF4
line 2870
;2870:	easyfragger = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_EASY_FRAGGER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 45
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 340
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 176
ADDRLP4 340
INDIRF4
ASGNF4
line 2872
;2871:	//check if the health decreased
;2872:	healthdecrease = bs->lasthealth > bs->inventory[INVENTORY_HEALTH];
ADDRLP4 348
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 348
INDIRP4
CNSTI4 5988
ADDP4
INDIRI4
ADDRLP4 348
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
LEI4 $1514
ADDRLP4 344
CNSTI4 1
ASGNI4
ADDRGP4 $1515
JUMPV
LABELV $1514
ADDRLP4 344
CNSTI4 0
ASGNI4
LABELV $1515
ADDRLP4 160
ADDRLP4 344
INDIRI4
ASGNI4
line 2874
;2873:	//remember the current health value
;2874:	bs->lasthealth = bs->inventory[INVENTORY_HEALTH];
ADDRLP4 352
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 352
INDIRP4
CNSTI4 5988
ADDP4
ADDRLP4 352
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
ASGNI4
line 2876
;2875:	//
;2876:	if (curenemy >= 0) {
ADDRFP4 4
INDIRI4
CNSTI4 0
LTI4 $1516
line 2877
;2877:		BotEntityInfo(curenemy, &curenemyinfo);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 196
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2878
;2878:		if (EntityCarriesFlag(&curenemyinfo)) return qfalse;
ADDRLP4 196
ARGP4
ADDRLP4 356
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 356
INDIRI4
CNSTI4 0
EQI4 $1518
CNSTI4 0
RETI4
ADDRGP4 $1512
JUMPV
LABELV $1518
line 2879
;2879:		VectorSubtract(curenemyinfo.origin, bs->origin, dir);
ADDRLP4 360
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
ADDRLP4 196+24
INDIRF4
ADDRLP4 360
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+4
ADDRLP4 196+24+4
INDIRF4
ADDRLP4 360
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+8
ADDRLP4 196+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2880
;2880:		cursquaredist = VectorLengthSquared(dir);
ADDRLP4 144
ARGP4
ADDRLP4 364
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 192
ADDRLP4 364
INDIRF4
ASGNF4
line 2881
;2881:	}
ADDRGP4 $1517
JUMPV
LABELV $1516
line 2882
;2882:	else {
line 2883
;2883:		cursquaredist = 0;
ADDRLP4 192
CNSTF4 0
ASGNF4
line 2884
;2884:	}
LABELV $1517
line 2886
;2885:
;2886:	if (gametype == GT_OVERLOAD) {
ADDRGP4 gametype
INDIRI4
CNSTI4 6
NEI4 $1527
line 2891
;2887:		vec3_t target;
;2888:		bot_goal_t *goal;
;2889:		bsp_trace_t trace;
;2890:
;2891:		if (BotTeam(bs) == TEAM_RED)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 456
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 456
INDIRI4
CNSTI4 1
NEI4 $1529
line 2892
;2892:			goal = &blueobelisk;
ADDRLP4 356
ADDRGP4 blueobelisk
ASGNP4
ADDRGP4 $1530
JUMPV
LABELV $1529
line 2894
;2893:		else
;2894:			goal = &redobelisk;
ADDRLP4 356
ADDRGP4 redobelisk
ASGNP4
LABELV $1530
line 2896
;2895:		//if the obelisk is visible
;2896:		VectorCopy(goal->origin, target);
ADDRLP4 360
ADDRLP4 356
INDIRP4
INDIRB
ASGNB 12
line 2897
;2897:		target[2] += 1;
ADDRLP4 360+8
ADDRLP4 360+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2898
;2898:		BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
ADDRLP4 372
ARGP4
ADDRLP4 460
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 460
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 360
ARGP4
ADDRLP4 460
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
line 2899
;2899:		if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
ADDRLP4 372+8
INDIRF4
CNSTF4 1065353216
GEF4 $1536
ADDRLP4 372+80
INDIRI4
ADDRLP4 356
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $1532
LABELV $1536
line 2900
;2900:			if (goal->entitynum == bs->enemy) {
ADDRLP4 356
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
NEI4 $1537
line 2901
;2901:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1512
JUMPV
LABELV $1537
line 2903
;2902:			}
;2903:			bs->enemy = goal->entitynum;
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
ADDRLP4 356
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
line 2904
;2904:			bs->enemysight_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6132
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2905
;2905:			bs->enemysuicide = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6012
ADDP4
CNSTI4 0
ASGNI4
line 2906
;2906:			bs->enemydeath_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6136
ADDP4
CNSTF4 0
ASGNF4
line 2907
;2907:			bs->enemyvisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6088
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2908
;2908:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1512
JUMPV
LABELV $1532
line 2910
;2909:		}
;2910:	}
LABELV $1527
line 2913
;2911:
;2912:	//
;2913:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 140
CNSTI4 0
ASGNI4
ADDRGP4 $1542
JUMPV
LABELV $1539
line 2915
;2914:
;2915:		if (i == bs->client) continue;
ADDRLP4 140
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1544
ADDRGP4 $1540
JUMPV
LABELV $1544
line 2917
;2916:		//if it's the current enemy
;2917:		if (i == curenemy) continue;
ADDRLP4 140
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $1546
ADDRGP4 $1540
JUMPV
LABELV $1546
line 2919
;2918:		//if the enemy has targeting disabled
;2919:		if (g_entities[i].flags & FL_NOTARGET) continue;
ADDRLP4 140
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities+536
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $1548
ADDRGP4 $1540
JUMPV
LABELV $1548
line 2921
;2920:		//
;2921:		BotEntityInfo(i, &entinfo);
ADDRLP4 140
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2923
;2922:		//
;2923:		if (!entinfo.valid) continue;
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1551
ADDRGP4 $1540
JUMPV
LABELV $1551
line 2925
;2924:		//if the enemy isn't dead and the enemy isn't the bot self
;2925:		if (EntityIsDead(&entinfo) || entinfo.number == bs->entitynum) continue;
ADDRLP4 0
ARGP4
ADDRLP4 356
ADDRGP4 EntityIsDead
CALLI4
ASGNI4
ADDRLP4 356
INDIRI4
CNSTI4 0
NEI4 $1556
ADDRLP4 0+20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
NEI4 $1553
LABELV $1556
ADDRGP4 $1540
JUMPV
LABELV $1553
line 2927
;2926:		//if the enemy is invisible and not shooting
;2927:		if (EntityIsInvisible(&entinfo) && !EntityIsShooting(&entinfo)) {
ADDRLP4 0
ARGP4
ADDRLP4 360
ADDRGP4 EntityIsInvisible
CALLI4
ASGNI4
ADDRLP4 360
INDIRI4
CNSTI4 0
EQI4 $1557
ADDRLP4 0
ARGP4
ADDRLP4 364
ADDRGP4 EntityIsShooting
CALLI4
ASGNI4
ADDRLP4 364
INDIRI4
CNSTI4 0
NEI4 $1557
line 2928
;2928:			continue;
ADDRGP4 $1540
JUMPV
LABELV $1557
line 2931
;2929:		}
;2930:		//if not an easy fragger don't shoot at chatting players
;2931:		if (easyfragger < 0.5 && EntityIsChatting(&entinfo)) continue;
ADDRLP4 176
INDIRF4
CNSTF4 1056964608
GEF4 $1559
ADDRLP4 0
ARGP4
ADDRLP4 368
ADDRGP4 EntityIsChatting
CALLI4
ASGNI4
ADDRLP4 368
INDIRI4
CNSTI4 0
EQI4 $1559
ADDRGP4 $1540
JUMPV
LABELV $1559
line 2933
;2932:		//
;2933:		if (lastteleport_time > FloatTime() - 3) {
ADDRGP4 lastteleport_time
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1077936128
SUBF4
LEF4 $1561
line 2934
;2934:			VectorSubtract(entinfo.origin, lastteleport_origin, dir);
ADDRLP4 144
ADDRLP4 0+24
INDIRF4
ADDRGP4 lastteleport_origin
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+4
ADDRLP4 0+24+4
INDIRF4
ADDRGP4 lastteleport_origin+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+8
ADDRLP4 0+24+8
INDIRF4
ADDRGP4 lastteleport_origin+8
INDIRF4
SUBF4
ASGNF4
line 2935
;2935:			if (VectorLengthSquared(dir) < Square(70)) continue;
ADDRLP4 144
ARGP4
ADDRLP4 372
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 372
INDIRF4
CNSTF4 1167663104
GEF4 $1572
ADDRGP4 $1540
JUMPV
LABELV $1572
line 2936
;2936:		}
LABELV $1561
line 2938
;2937:		//calculate the distance towards the enemy
;2938:		VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 372
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
ADDRLP4 0+24
INDIRF4
ADDRLP4 372
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 372
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+8
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2939
;2939:		squaredist = VectorLengthSquared(dir);
ADDRLP4 144
ARGP4
ADDRLP4 376
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 376
INDIRF4
ASGNF4
line 2941
;2940:		//if this entity is not carrying a flag
;2941:		if (!EntityCarriesFlag(&entinfo))
ADDRLP4 0
ARGP4
ADDRLP4 380
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 380
INDIRI4
CNSTI4 0
NEI4 $1581
line 2942
;2942:		{
line 2944
;2943:			//if this enemy is further away than the current one
;2944:			if (curenemy >= 0 && squaredist > cursquaredist) continue;
ADDRFP4 4
INDIRI4
CNSTI4 0
LTI4 $1583
ADDRLP4 156
INDIRF4
ADDRLP4 192
INDIRF4
LEF4 $1583
ADDRGP4 $1540
JUMPV
LABELV $1583
line 2945
;2945:		} //end if
LABELV $1581
line 2947
;2946:		//if the bot has no
;2947:		if (squaredist > Square(900.0 + alertness * 4000.0)) continue;
ADDRLP4 156
INDIRF4
ADDRLP4 164
INDIRF4
CNSTF4 1165623296
MULF4
CNSTF4 1147207680
ADDF4
ADDRLP4 164
INDIRF4
CNSTF4 1165623296
MULF4
CNSTF4 1147207680
ADDF4
MULF4
LEF4 $1585
ADDRGP4 $1540
JUMPV
LABELV $1585
line 2949
;2948:		//if on the same team
;2949:		if (BotSameTeam(bs, i)) continue;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
INDIRI4
ARGI4
ADDRLP4 388
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 388
INDIRI4
CNSTI4 0
EQI4 $1587
ADDRGP4 $1540
JUMPV
LABELV $1587
line 2951
;2950:		//if the bot's health decreased or the enemy is shooting
;2951:		if (curenemy < 0 && (healthdecrease || EntityIsShooting(&entinfo)))
ADDRFP4 4
INDIRI4
CNSTI4 0
GEI4 $1589
ADDRLP4 160
INDIRI4
CNSTI4 0
NEI4 $1591
ADDRLP4 0
ARGP4
ADDRLP4 392
ADDRGP4 EntityIsShooting
CALLI4
ASGNI4
ADDRLP4 392
INDIRI4
CNSTI4 0
EQI4 $1589
LABELV $1591
line 2952
;2952:			f = 360;
ADDRLP4 168
CNSTF4 1135869952
ASGNF4
ADDRGP4 $1590
JUMPV
LABELV $1589
line 2954
;2953:		else
;2954:			f = 90 + 90 - (90 - (squaredist > Square(810) ? Square(810) : squaredist) / (810 * 9));
ADDRLP4 156
INDIRF4
CNSTF4 1226845760
LEF4 $1593
ADDRLP4 396
CNSTF4 1226845760
ASGNF4
ADDRGP4 $1594
JUMPV
LABELV $1593
ADDRLP4 396
ADDRLP4 156
INDIRF4
ASGNF4
LABELV $1594
ADDRLP4 168
CNSTF4 1127481344
CNSTF4 1119092736
ADDRLP4 396
INDIRF4
CNSTF4 957339244
MULF4
SUBF4
SUBF4
ASGNF4
LABELV $1590
line 2956
;2955:		//check if the enemy is visible
;2956:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, f, i);
ADDRLP4 400
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 400
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 400
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 400
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
ADDRLP4 168
INDIRF4
ARGF4
ADDRLP4 140
INDIRI4
ARGI4
ADDRLP4 404
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 172
ADDRLP4 404
INDIRF4
ASGNF4
line 2957
;2957:		if (vis <= 0) continue;
ADDRLP4 172
INDIRF4
CNSTF4 0
GTF4 $1595
ADDRGP4 $1540
JUMPV
LABELV $1595
line 2959
;2958:		//if the enemy is quite far away, not shooting and the bot is not damaged
;2959:		if (curenemy < 0 && squaredist > Square(100) && !healthdecrease && !EntityIsShooting(&entinfo))
ADDRFP4 4
INDIRI4
CNSTI4 0
GEI4 $1597
ADDRLP4 156
INDIRF4
CNSTF4 1176256512
LEF4 $1597
ADDRLP4 160
INDIRI4
CNSTI4 0
NEI4 $1597
ADDRLP4 0
ARGP4
ADDRLP4 408
ADDRGP4 EntityIsShooting
CALLI4
ASGNI4
ADDRLP4 408
INDIRI4
CNSTI4 0
NEI4 $1597
line 2960
;2960:		{
line 2962
;2961:			//check if we can avoid this enemy
;2962:			VectorSubtract(bs->origin, entinfo.origin, dir);
ADDRLP4 412
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
ADDRLP4 412
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRLP4 0+24
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+4
ADDRLP4 412
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRLP4 0+24+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+8
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
ADDRLP4 0+24+8
INDIRF4
SUBF4
ASGNF4
line 2963
;2963:			vectoangles(dir, angles);
ADDRLP4 144
ARGP4
ADDRLP4 180
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2965
;2964:			//if the bot isn't in the fov of the enemy
;2965:			if (!InFieldOfVision(entinfo.angles, 90, angles)) {
ADDRLP4 0+36
ARGP4
CNSTF4 1119092736
ARGF4
ADDRLP4 180
ARGP4
ADDRLP4 416
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 416
INDIRI4
CNSTI4 0
NEI4 $1606
line 2967
;2966:				//update some stuff for this enemy
;2967:				BotUpdateBattleInventory(bs, i);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
INDIRI4
ARGI4
ADDRGP4 BotUpdateBattleInventory
CALLV
pop
line 2969
;2968:				//if the bot doesn't really want to fight
;2969:				if (BotWantsToRetreat(bs)) continue;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 420
ADDRGP4 BotWantsToRetreat
CALLI4
ASGNI4
ADDRLP4 420
INDIRI4
CNSTI4 0
EQI4 $1609
ADDRGP4 $1540
JUMPV
LABELV $1609
line 2970
;2970:			}
LABELV $1606
line 2971
;2971:		}
LABELV $1597
line 2973
;2972:		//found an enemy
;2973:		bs->enemy = entinfo.number;
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
ADDRLP4 0+20
INDIRI4
ASGNI4
line 2974
;2974:		if (curenemy >= 0) bs->enemysight_time = FloatTime() - 2;
ADDRFP4 4
INDIRI4
CNSTI4 0
LTI4 $1612
ADDRFP4 0
INDIRP4
CNSTI4 6132
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
SUBF4
ASGNF4
ADDRGP4 $1613
JUMPV
LABELV $1612
line 2975
;2975:		else bs->enemysight_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6132
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
LABELV $1613
line 2976
;2976:		bs->enemysuicide = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6012
ADDP4
CNSTI4 0
ASGNI4
line 2977
;2977:		bs->enemydeath_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6136
ADDP4
CNSTF4 0
ASGNF4
line 2978
;2978:		bs->enemyvisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6088
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2979
;2979:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1512
JUMPV
LABELV $1540
line 2913
ADDRLP4 140
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1542
ADDRLP4 140
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1539
line 2981
;2980:	}
;2981:	return qfalse;
CNSTI4 0
RETI4
LABELV $1512
endproc BotFindEnemy 464 28
export BotTeamFlagCarrierVisible
proc BotTeamFlagCarrierVisible 164 20
line 2989
;2982:}
;2983:
;2984:/*
;2985:==================
;2986:BotTeamFlagCarrierVisible
;2987:==================
;2988:*/
;2989:int BotTeamFlagCarrierVisible(bot_state_t *bs) {
line 2994
;2990:	int i;
;2991:	float vis;
;2992:	aas_entityinfo_t entinfo;
;2993:
;2994:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1618
JUMPV
LABELV $1615
line 2995
;2995:		if (i == bs->client)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1620
line 2996
;2996:			continue;
ADDRGP4 $1616
JUMPV
LABELV $1620
line 2998
;2997:		//
;2998:		BotEntityInfo(i, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3000
;2999:		//if this player is active
;3000:		if (!entinfo.valid)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1622
line 3001
;3001:			continue;
ADDRGP4 $1616
JUMPV
LABELV $1622
line 3003
;3002:		//if this player is carrying a flag
;3003:		if (!EntityCarriesFlag(&entinfo))
ADDRLP4 4
ARGP4
ADDRLP4 148
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $1624
line 3004
;3004:			continue;
ADDRGP4 $1616
JUMPV
LABELV $1624
line 3006
;3005:		//if the flag carrier is not on the same team
;3006:		if (!BotSameTeam(bs, i))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 152
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
NEI4 $1626
line 3007
;3007:			continue;
ADDRGP4 $1616
JUMPV
LABELV $1626
line 3009
;3008:		//if the flag carrier is not visible
;3009:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i);
ADDRLP4 156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 156
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 156
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 156
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 160
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 144
ADDRLP4 160
INDIRF4
ASGNF4
line 3010
;3010:		if (vis <= 0)
ADDRLP4 144
INDIRF4
CNSTF4 0
GTF4 $1628
line 3011
;3011:			continue;
ADDRGP4 $1616
JUMPV
LABELV $1628
line 3013
;3012:		//
;3013:		return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1614
JUMPV
LABELV $1616
line 2994
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1618
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1615
line 3015
;3014:	}
;3015:	return -1;
CNSTI4 -1
RETI4
LABELV $1614
endproc BotTeamFlagCarrierVisible 164 20
export BotTeamFlagCarrier
proc BotTeamFlagCarrier 152 8
line 3023
;3016:}
;3017:
;3018:/*
;3019:==================
;3020:BotTeamFlagCarrier
;3021:==================
;3022:*/
;3023:int BotTeamFlagCarrier(bot_state_t *bs) {
line 3027
;3024:	int i;
;3025:	aas_entityinfo_t entinfo;
;3026:
;3027:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1634
JUMPV
LABELV $1631
line 3028
;3028:		if (i == bs->client)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1636
line 3029
;3029:			continue;
ADDRGP4 $1632
JUMPV
LABELV $1636
line 3031
;3030:		//
;3031:		BotEntityInfo(i, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3033
;3032:		//if this player is active
;3033:		if (!entinfo.valid)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1638
line 3034
;3034:			continue;
ADDRGP4 $1632
JUMPV
LABELV $1638
line 3036
;3035:		//if this player is carrying a flag
;3036:		if (!EntityCarriesFlag(&entinfo))
ADDRLP4 4
ARGP4
ADDRLP4 144
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
NEI4 $1640
line 3037
;3037:			continue;
ADDRGP4 $1632
JUMPV
LABELV $1640
line 3039
;3038:		//if the flag carrier is not on the same team
;3039:		if (!BotSameTeam(bs, i))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 148
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $1642
line 3040
;3040:			continue;
ADDRGP4 $1632
JUMPV
LABELV $1642
line 3042
;3041:		//
;3042:		return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1630
JUMPV
LABELV $1632
line 3027
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1634
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1631
line 3044
;3043:	}
;3044:	return -1;
CNSTI4 -1
RETI4
LABELV $1630
endproc BotTeamFlagCarrier 152 8
export BotEnemyFlagCarrierVisible
proc BotEnemyFlagCarrierVisible 164 20
line 3052
;3045:}
;3046:
;3047:/*
;3048:==================
;3049:BotEnemyFlagCarrierVisible
;3050:==================
;3051:*/
;3052:int BotEnemyFlagCarrierVisible(bot_state_t *bs) {
line 3057
;3053:	int i;
;3054:	float vis;
;3055:	aas_entityinfo_t entinfo;
;3056:
;3057:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1648
JUMPV
LABELV $1645
line 3058
;3058:		if (i == bs->client)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1650
line 3059
;3059:			continue;
ADDRGP4 $1646
JUMPV
LABELV $1650
line 3061
;3060:		//
;3061:		BotEntityInfo(i, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3063
;3062:		//if this player is active
;3063:		if (!entinfo.valid)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1652
line 3064
;3064:			continue;
ADDRGP4 $1646
JUMPV
LABELV $1652
line 3066
;3065:		//if this player is carrying a flag
;3066:		if (!EntityCarriesFlag(&entinfo))
ADDRLP4 4
ARGP4
ADDRLP4 148
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $1654
line 3067
;3067:			continue;
ADDRGP4 $1646
JUMPV
LABELV $1654
line 3069
;3068:		//if the flag carrier is on the same team
;3069:		if (BotSameTeam(bs, i))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 152
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
EQI4 $1656
line 3070
;3070:			continue;
ADDRGP4 $1646
JUMPV
LABELV $1656
line 3072
;3071:		//if the flag carrier is not visible
;3072:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i);
ADDRLP4 156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 156
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 156
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 156
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 160
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 144
ADDRLP4 160
INDIRF4
ASGNF4
line 3073
;3073:		if (vis <= 0)
ADDRLP4 144
INDIRF4
CNSTF4 0
GTF4 $1658
line 3074
;3074:			continue;
ADDRGP4 $1646
JUMPV
LABELV $1658
line 3076
;3075:		//
;3076:		return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1644
JUMPV
LABELV $1646
line 3057
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1648
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1645
line 3078
;3077:	}
;3078:	return -1;
CNSTI4 -1
RETI4
LABELV $1644
endproc BotEnemyFlagCarrierVisible 164 20
export BotVisibleTeamMatesAndEnemies
proc BotVisibleTeamMatesAndEnemies 192 20
line 3086
;3079:}
;3080:
;3081:/*
;3082:==================
;3083:BotVisibleTeamMatesAndEnemies
;3084:==================
;3085:*/
;3086:void BotVisibleTeamMatesAndEnemies(bot_state_t *bs, int *teammates, int *enemies, float range) {
line 3092
;3087:	int i;
;3088:	float vis;
;3089:	aas_entityinfo_t entinfo;
;3090:	vec3_t dir;
;3091:
;3092:	if (teammates)
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1661
line 3093
;3093:		*teammates = 0;
ADDRFP4 4
INDIRP4
CNSTI4 0
ASGNI4
LABELV $1661
line 3094
;3094:	if (enemies)
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1663
line 3095
;3095:		*enemies = 0;
ADDRFP4 8
INDIRP4
CNSTI4 0
ASGNI4
LABELV $1663
line 3096
;3096:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1668
JUMPV
LABELV $1665
line 3097
;3097:		if (i == bs->client)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1670
line 3098
;3098:			continue;
ADDRGP4 $1666
JUMPV
LABELV $1670
line 3100
;3099:		//
;3100:		BotEntityInfo(i, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3102
;3101:		//if this player is active
;3102:		if (!entinfo.valid)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1672
line 3103
;3103:			continue;
ADDRGP4 $1666
JUMPV
LABELV $1672
line 3105
;3104:		//if this player is carrying a flag
;3105:		if (!EntityCarriesFlag(&entinfo))
ADDRLP4 4
ARGP4
ADDRLP4 160
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
NEI4 $1674
line 3106
;3106:			continue;
ADDRGP4 $1666
JUMPV
LABELV $1674
line 3108
;3107:		//if not within range
;3108:		VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
ADDRLP4 4+24
INDIRF4
ADDRLP4 164
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+4
ADDRLP4 4+24+4
INDIRF4
ADDRLP4 164
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+8
ADDRLP4 4+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3109
;3109:		if (VectorLengthSquared(dir) > Square(range))
ADDRLP4 144
ARGP4
ADDRLP4 168
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 172
ADDRFP4 12
INDIRF4
ASGNF4
ADDRLP4 168
INDIRF4
ADDRLP4 172
INDIRF4
ADDRLP4 172
INDIRF4
MULF4
LEF4 $1683
line 3110
;3110:			continue;
ADDRGP4 $1666
JUMPV
LABELV $1683
line 3112
;3111:		//if the flag carrier is not visible
;3112:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i);
ADDRLP4 176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 176
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 176
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 176
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 180
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 180
INDIRF4
ASGNF4
line 3113
;3113:		if (vis <= 0)
ADDRLP4 156
INDIRF4
CNSTF4 0
GTF4 $1685
line 3114
;3114:			continue;
ADDRGP4 $1666
JUMPV
LABELV $1685
line 3116
;3115:		//if the flag carrier is on the same team
;3116:		if (BotSameTeam(bs, i)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 184
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 184
INDIRI4
CNSTI4 0
EQI4 $1687
line 3117
;3117:			if (teammates)
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1688
line 3118
;3118:				(*teammates)++;
ADDRLP4 188
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 188
INDIRP4
ADDRLP4 188
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3119
;3119:		}
ADDRGP4 $1688
JUMPV
LABELV $1687
line 3120
;3120:		else {
line 3121
;3121:			if (enemies)
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1691
line 3122
;3122:				(*enemies)++;
ADDRLP4 188
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 188
INDIRP4
ADDRLP4 188
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1691
line 3123
;3123:		}
LABELV $1688
line 3124
;3124:	}
LABELV $1666
line 3096
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1668
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1665
line 3125
;3125:}
LABELV $1660
endproc BotVisibleTeamMatesAndEnemies 192 20
export BotTeamCubeCarrierVisible
proc BotTeamCubeCarrierVisible 164 20
line 3133
;3126:
;3127:
;3128:/*
;3129:==================
;3130:BotTeamCubeCarrierVisible
;3131:==================
;3132:*/
;3133:int BotTeamCubeCarrierVisible(bot_state_t *bs) {
line 3138
;3134:	int i;
;3135:	float vis;
;3136:	aas_entityinfo_t entinfo;
;3137:
;3138:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1697
JUMPV
LABELV $1694
line 3139
;3139:		if (i == bs->client) continue;
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1699
ADDRGP4 $1695
JUMPV
LABELV $1699
line 3141
;3140:		//
;3141:		BotEntityInfo(i, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3143
;3142:		//if this player is active
;3143:		if (!entinfo.valid) continue;
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1701
ADDRGP4 $1695
JUMPV
LABELV $1701
line 3145
;3144:		//if this player is carrying a flag
;3145:		if (!EntityCarriesCubes(&entinfo)) continue;
ADDRLP4 4
ARGP4
ADDRLP4 148
ADDRGP4 EntityCarriesCubes
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $1703
ADDRGP4 $1695
JUMPV
LABELV $1703
line 3147
;3146:		//if the flag carrier is not on the same team
;3147:		if (!BotSameTeam(bs, i)) continue;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 152
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
NEI4 $1705
ADDRGP4 $1695
JUMPV
LABELV $1705
line 3149
;3148:		//if the flag carrier is not visible
;3149:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i);
ADDRLP4 156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 156
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 156
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 156
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 160
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 144
ADDRLP4 160
INDIRF4
ASGNF4
line 3150
;3150:		if (vis <= 0) continue;
ADDRLP4 144
INDIRF4
CNSTF4 0
GTF4 $1707
ADDRGP4 $1695
JUMPV
LABELV $1707
line 3152
;3151:		//
;3152:		return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1693
JUMPV
LABELV $1695
line 3138
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1697
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1694
line 3154
;3153:	}
;3154:	return -1;
CNSTI4 -1
RETI4
LABELV $1693
endproc BotTeamCubeCarrierVisible 164 20
export BotEnemyCubeCarrierVisible
proc BotEnemyCubeCarrierVisible 164 20
line 3162
;3155:}
;3156:
;3157:/*
;3158:==================
;3159:BotEnemyCubeCarrierVisible
;3160:==================
;3161:*/
;3162:int BotEnemyCubeCarrierVisible(bot_state_t *bs) {
line 3167
;3163:	int i;
;3164:	float vis;
;3165:	aas_entityinfo_t entinfo;
;3166:
;3167:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1713
JUMPV
LABELV $1710
line 3168
;3168:		if (i == bs->client)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1715
line 3169
;3169:			continue;
ADDRGP4 $1711
JUMPV
LABELV $1715
line 3171
;3170:		//
;3171:		BotEntityInfo(i, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3173
;3172:		//if this player is active
;3173:		if (!entinfo.valid)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1717
line 3174
;3174:			continue;
ADDRGP4 $1711
JUMPV
LABELV $1717
line 3176
;3175:		//if this player is carrying a flag
;3176:		if (!EntityCarriesCubes(&entinfo)) continue;
ADDRLP4 4
ARGP4
ADDRLP4 148
ADDRGP4 EntityCarriesCubes
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $1719
ADDRGP4 $1711
JUMPV
LABELV $1719
line 3178
;3177:		//if the flag carrier is on the same team
;3178:		if (BotSameTeam(bs, i))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 152
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
EQI4 $1721
line 3179
;3179:			continue;
ADDRGP4 $1711
JUMPV
LABELV $1721
line 3181
;3180:		//if the flag carrier is not visible
;3181:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i);
ADDRLP4 156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 156
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 156
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 156
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 160
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 144
ADDRLP4 160
INDIRF4
ASGNF4
line 3182
;3182:		if (vis <= 0)
ADDRLP4 144
INDIRF4
CNSTF4 0
GTF4 $1723
line 3183
;3183:			continue;
ADDRGP4 $1711
JUMPV
LABELV $1723
line 3185
;3184:		//
;3185:		return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1709
JUMPV
LABELV $1711
line 3167
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1713
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1710
line 3187
;3186:	}
;3187:	return -1;
CNSTI4 -1
RETI4
LABELV $1709
endproc BotEnemyCubeCarrierVisible 164 20
data
align 4
LABELV $1726
byte 4 3229614080
byte 4 3229614080
byte 4 3229614080
align 4
LABELV $1727
byte 4 1082130432
byte 4 1082130432
byte 4 1082130432
export BotAimAtEnemy
code
proc BotAimAtEnemy 1128 52
line 3196
;3188:}
;3189:
;3190:
;3191:/*
;3192:==================
;3193:BotAimAtEnemy
;3194:==================
;3195:*/
;3196:void BotAimAtEnemy(bot_state_t *bs) {
line 3200
;3197:	int i, enemyvisible;
;3198:	float dist, f, aim_skill, aim_accuracy, speed, reactiontime;
;3199:	vec3_t dir, bestorigin, end, start, groundtarget, cmdmove, enemyvelocity;
;3200:	vec3_t mins = {-4,-4,-4}, maxs = {4, 4, 4};
ADDRLP4 860
ADDRGP4 $1726
INDIRB
ASGNB 12
ADDRLP4 872
ADDRGP4 $1727
INDIRB
ASGNB 12
line 3208
;3201:	weaponinfo_t wi;
;3202:	aas_entityinfo_t entinfo;
;3203:	bot_goal_t goal;
;3204:	bsp_trace_t trace;
;3205:	vec3_t target;
;3206:
;3207:	//if the bot has no enemy
;3208:	if (bs->enemy < 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 0
GEI4 $1728
line 3209
;3209:		return;
ADDRGP4 $1725
JUMPV
LABELV $1728
line 3212
;3210:	}
;3211:	//get the enemy entity information
;3212:	BotEntityInfo(bs->enemy, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3214
;3213:	//if this is not a player (should be an obelisk)
;3214:	if (bs->enemy >= MAX_CLIENTS) {
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 64
LTI4 $1730
line 3216
;3215:		//if the obelisk is visible
;3216:		VectorCopy(entinfo.origin, target);
ADDRLP4 824
ADDRLP4 0+24
INDIRB
ASGNB 12
line 3219
;3217:
;3218:		// if attacking an obelisk
;3219:		if ( bs->enemy == redobelisk.entitynum ||
ADDRLP4 984
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 984
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ADDRGP4 redobelisk+40
INDIRI4
EQI4 $1737
ADDRLP4 984
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ADDRGP4 blueobelisk+40
INDIRI4
NEI4 $1733
LABELV $1737
line 3220
;3220:			bs->enemy == blueobelisk.entitynum ) {
line 3221
;3221:			target[2] += 32;
ADDRLP4 824+8
ADDRLP4 824+8
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 3222
;3222:		}
LABELV $1733
line 3225
;3223:
;3224:		//aim at the obelisk
;3225:		VectorSubtract(target, bs->eye, dir);
ADDRLP4 988
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 824
INDIRF4
ADDRLP4 988
INDIRP4
CNSTI4 4936
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 824+4
INDIRF4
ADDRLP4 988
INDIRP4
CNSTI4 4940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 824+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4944
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3226
;3226:		vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 140
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3228
;3227:		//set the aim target before trying to attack
;3228:		VectorCopy(target, bs->aimtarget);
ADDRFP4 0
INDIRP4
CNSTI4 6220
ADDP4
ADDRLP4 824
INDIRB
ASGNB 12
line 3229
;3229:		return;
ADDRGP4 $1725
JUMPV
LABELV $1730
line 3234
;3230:	}
;3231:	//
;3232:	//BotAI_Print(PRT_MESSAGE, "client %d: aiming at client %d\n", bs->entitynum, bs->enemy);
;3233:	//
;3234:	aim_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_SKILL, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 16
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 984
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 736
ADDRLP4 984
INDIRF4
ASGNF4
line 3235
;3235:	aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 7
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 988
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 988
INDIRF4
ASGNF4
line 3237
;3236:	//
;3237:	if (aim_skill > 0.95) {
ADDRLP4 736
INDIRF4
CNSTF4 1064514355
LEF4 $1743
line 3239
;3238:		//don't aim too early
;3239:		reactiontime = 0.5 * trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_REACTIONTIME, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 6
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 992
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 856
ADDRLP4 992
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 3240
;3240:		if (bs->enemysight_time > FloatTime() - reactiontime) return;
ADDRFP4 0
INDIRP4
CNSTI4 6132
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
ADDRLP4 856
INDIRF4
SUBF4
LEF4 $1745
ADDRGP4 $1725
JUMPV
LABELV $1745
line 3241
;3241:		if (bs->teleport_time > FloatTime() - reactiontime) return;
ADDRFP4 0
INDIRP4
CNSTI4 6180
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
ADDRLP4 856
INDIRF4
SUBF4
LEF4 $1747
ADDRGP4 $1725
JUMPV
LABELV $1747
line 3242
;3242:	}
LABELV $1743
line 3245
;3243:
;3244:	//get the weapon information
;3245:	trap_BotGetWeaponInfo(bs->ws, bs->weaponnum, &wi);
ADDRLP4 992
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 992
INDIRP4
CNSTI4 6536
ADDP4
INDIRI4
ARGI4
ADDRLP4 992
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
ARGI4
ADDRLP4 160
ARGP4
ADDRGP4 trap_BotGetWeaponInfo
CALLV
pop
line 3247
;3246:	//get the weapon specific aim accuracy and or aim skill
;3247:	if (wi.number == WP_MACHINEGUN) {
ADDRLP4 160+4
INDIRI4
CNSTI4 2
NEI4 $1749
line 3248
;3248:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_MACHINEGUN, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 8
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 996
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 996
INDIRF4
ASGNF4
line 3249
;3249:	}
ADDRGP4 $1750
JUMPV
LABELV $1749
line 3250
;3250:	else if (wi.number == WP_SHOTGUN) {
ADDRLP4 160+4
INDIRI4
CNSTI4 3
NEI4 $1752
line 3251
;3251:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_SHOTGUN, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 9
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 996
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 996
INDIRF4
ASGNF4
line 3252
;3252:	}
ADDRGP4 $1753
JUMPV
LABELV $1752
line 3253
;3253:	else if (wi.number == WP_GRENADE_LAUNCHER) {
ADDRLP4 160+4
INDIRI4
CNSTI4 4
NEI4 $1755
line 3254
;3254:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_GRENADELAUNCHER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 11
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 996
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 996
INDIRF4
ASGNF4
line 3255
;3255:		aim_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_SKILL_GRENADELAUNCHER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 18
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 1000
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 736
ADDRLP4 1000
INDIRF4
ASGNF4
line 3256
;3256:	}
ADDRGP4 $1756
JUMPV
LABELV $1755
line 3257
;3257:	else if (wi.number == WP_ROCKET_LAUNCHER) {
ADDRLP4 160+4
INDIRI4
CNSTI4 5
NEI4 $1758
line 3258
;3258:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_ROCKETLAUNCHER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 10
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 996
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 996
INDIRF4
ASGNF4
line 3259
;3259:		aim_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_SKILL_ROCKETLAUNCHER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 17
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 1000
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 736
ADDRLP4 1000
INDIRF4
ASGNF4
line 3260
;3260:	}
ADDRGP4 $1759
JUMPV
LABELV $1758
line 3261
;3261:	else if (wi.number == WP_LIGHTNING) {
ADDRLP4 160+4
INDIRI4
CNSTI4 6
NEI4 $1761
line 3262
;3262:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_LIGHTNING, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 12
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 996
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 996
INDIRF4
ASGNF4
line 3263
;3263:	}
ADDRGP4 $1762
JUMPV
LABELV $1761
line 3264
;3264:	else if (wi.number == WP_RAILGUN) {
ADDRLP4 160+4
INDIRI4
CNSTI4 7
NEI4 $1764
line 3265
;3265:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_RAILGUN, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 14
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 996
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 996
INDIRF4
ASGNF4
line 3266
;3266:	}
ADDRGP4 $1765
JUMPV
LABELV $1764
line 3267
;3267:	else if (wi.number == WP_PLASMAGUN) {
ADDRLP4 160+4
INDIRI4
CNSTI4 8
NEI4 $1767
line 3268
;3268:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_PLASMAGUN, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 13
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 996
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 996
INDIRF4
ASGNF4
line 3269
;3269:		aim_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_SKILL_PLASMAGUN, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 19
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 1000
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 736
ADDRLP4 1000
INDIRF4
ASGNF4
line 3270
;3270:	}
ADDRGP4 $1768
JUMPV
LABELV $1767
line 3271
;3271:	else if (wi.number == WP_BFG) {
ADDRLP4 160+4
INDIRI4
CNSTI4 9
NEI4 $1770
line 3272
;3272:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_BFG10K, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 15
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 996
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 996
INDIRF4
ASGNF4
line 3273
;3273:		aim_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_SKILL_BFG10K, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 20
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 1000
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 736
ADDRLP4 1000
INDIRF4
ASGNF4
line 3274
;3274:	}
LABELV $1770
LABELV $1768
LABELV $1765
LABELV $1762
LABELV $1759
LABELV $1756
LABELV $1753
LABELV $1750
line 3276
;3275:	//
;3276:	if (aim_accuracy <= 0) aim_accuracy = 0.0001f;
ADDRLP4 156
INDIRF4
CNSTF4 0
GTF4 $1773
ADDRLP4 156
CNSTF4 953267991
ASGNF4
LABELV $1773
line 3278
;3277:	//get the enemy entity information
;3278:	BotEntityInfo(bs->enemy, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3280
;3279:	//if the enemy is invisible then shoot crappy most of the time
;3280:	if (EntityIsInvisible(&entinfo)) {
ADDRLP4 0
ARGP4
ADDRLP4 996
ADDRGP4 EntityIsInvisible
CALLI4
ASGNI4
ADDRLP4 996
INDIRI4
CNSTI4 0
EQI4 $1775
line 3281
;3281:		if (random() > 0.1) aim_accuracy *= 0.4f;
ADDRLP4 1000
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1000
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1036831949
LEF4 $1777
ADDRLP4 156
ADDRLP4 156
INDIRF4
CNSTF4 1053609165
MULF4
ASGNF4
LABELV $1777
line 3282
;3282:	}
LABELV $1775
line 3284
;3283:	//
;3284:	VectorSubtract(entinfo.origin, entinfo.lastvisorigin, enemyvelocity);
ADDRLP4 712
ADDRLP4 0+24
INDIRF4
ADDRLP4 0+60
INDIRF4
SUBF4
ASGNF4
ADDRLP4 712+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 0+60+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 712+8
ADDRLP4 0+24+8
INDIRF4
ADDRLP4 0+60+8
INDIRF4
SUBF4
ASGNF4
line 3285
;3285:	VectorScale(enemyvelocity, 1 / entinfo.update_time, enemyvelocity);
ADDRLP4 712
ADDRLP4 712
INDIRF4
CNSTF4 1065353216
ADDRLP4 0+16
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 712+4
ADDRLP4 712+4
INDIRF4
CNSTF4 1065353216
ADDRLP4 0+16
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 712+8
ADDRLP4 712+8
INDIRF4
CNSTF4 1065353216
ADDRLP4 0+16
INDIRF4
DIVF4
MULF4
ASGNF4
line 3287
;3286:	//enemy origin and velocity is remembered every 0.5 seconds
;3287:	if (bs->enemyposition_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6140
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $1798
line 3289
;3288:		//
;3289:		bs->enemyposition_time = FloatTime() + 0.5;
ADDRFP4 0
INDIRP4
CNSTI4 6140
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1056964608
ADDF4
ASGNF4
line 3290
;3290:		VectorCopy(enemyvelocity, bs->enemyvelocity);
ADDRFP4 0
INDIRP4
CNSTI4 6232
ADDP4
ADDRLP4 712
INDIRB
ASGNB 12
line 3291
;3291:		VectorCopy(entinfo.origin, bs->enemyorigin);
ADDRFP4 0
INDIRP4
CNSTI4 6244
ADDP4
ADDRLP4 0+24
INDIRB
ASGNB 12
line 3292
;3292:	}
LABELV $1798
line 3294
;3293:	//if not extremely skilled
;3294:	if (aim_skill < 0.9) {
ADDRLP4 736
INDIRF4
CNSTF4 1063675494
GEF4 $1801
line 3295
;3295:		VectorSubtract(entinfo.origin, bs->enemyorigin, dir);
ADDRLP4 1000
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 0+24
INDIRF4
ADDRLP4 1000
INDIRP4
CNSTI4 6244
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 1000
INDIRP4
CNSTI4 6248
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 6252
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3297
;3296:		//if the enemy moved a bit
;3297:		if (VectorLengthSquared(dir) > Square(48)) {
ADDRLP4 140
ARGP4
ADDRLP4 1004
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1004
INDIRF4
CNSTF4 1158676480
LEF4 $1810
line 3299
;3298:			//if the enemy changed direction
;3299:			if (DotProduct(bs->enemyvelocity, enemyvelocity) < 0) {
ADDRLP4 1008
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1008
INDIRP4
CNSTI4 6232
ADDP4
INDIRF4
ADDRLP4 712
INDIRF4
MULF4
ADDRLP4 1008
INDIRP4
CNSTI4 6236
ADDP4
INDIRF4
ADDRLP4 712+4
INDIRF4
MULF4
ADDF4
ADDRLP4 1008
INDIRP4
CNSTI4 6240
ADDP4
INDIRF4
ADDRLP4 712+8
INDIRF4
MULF4
ADDF4
CNSTF4 0
GEF4 $1812
line 3301
;3300:				//aim accuracy should be worse now
;3301:				aim_accuracy *= 0.7f;
ADDRLP4 156
ADDRLP4 156
INDIRF4
CNSTF4 1060320051
MULF4
ASGNF4
line 3302
;3302:			}
LABELV $1812
line 3303
;3303:		}
LABELV $1810
line 3304
;3304:	}
LABELV $1801
line 3306
;3305:	//check visibility of enemy
;3306:	enemyvisible = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, bs->enemy);
ADDRLP4 1000
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1000
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 1000
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 1000
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 1000
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 1004
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 836
ADDRLP4 1004
INDIRF4
CVFI4 4
ASGNI4
line 3308
;3307:	//if the enemy is visible
;3308:	if (enemyvisible) {
ADDRLP4 836
INDIRI4
CNSTI4 0
EQI4 $1816
line 3310
;3309:		//
;3310:		VectorCopy(entinfo.origin, bestorigin);
ADDRLP4 724
ADDRLP4 0+24
INDIRB
ASGNB 12
line 3311
;3311:		bestorigin[2] += 8;
ADDRLP4 724+8
ADDRLP4 724+8
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 3314
;3312:		//get the start point shooting from
;3313:		//NOTE: the x and y projectile start offsets are ignored
;3314:		VectorCopy(bs->origin, start);
ADDRLP4 844
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 3315
;3315:		start[2] += bs->cur_ps.viewheight;
ADDRLP4 844+8
ADDRLP4 844+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 3316
;3316:		start[2] += wi.offset[2];
ADDRLP4 844+8
ADDRLP4 844+8
INDIRF4
ADDRLP4 160+292+8
INDIRF4
ADDF4
ASGNF4
line 3318
;3317:		//
;3318:		BotAI_Trace(&trace, start, mins, maxs, bestorigin, bs->entitynum, MASK_SHOT);
ADDRLP4 740
ARGP4
ADDRLP4 844
ARGP4
ADDRLP4 860
ARGP4
ADDRLP4 872
ARGP4
ADDRLP4 724
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3320
;3319:		//if the enemy is NOT hit
;3320:		if (trace.fraction <= 1 && trace.ent != entinfo.number) {
ADDRLP4 740+8
INDIRF4
CNSTF4 1065353216
GTF4 $1824
ADDRLP4 740+80
INDIRI4
ADDRLP4 0+20
INDIRI4
EQI4 $1824
line 3321
;3321:			bestorigin[2] += 16;
ADDRLP4 724+8
ADDRLP4 724+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 3322
;3322:		}
LABELV $1824
line 3324
;3323:		//if it is not an instant hit weapon the bot might want to predict the enemy
;3324:		if (wi.speed) {
ADDRLP4 160+272
INDIRF4
CNSTF4 0
EQF4 $1830
line 3326
;3325:			//
;3326:			VectorSubtract(bestorigin, bs->origin, dir);
ADDRLP4 1008
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 724
INDIRF4
ADDRLP4 1008
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 724+4
INDIRF4
ADDRLP4 1008
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 724+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3327
;3327:			dist = VectorLength(dir);
ADDRLP4 140
ARGP4
ADDRLP4 1012
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 840
ADDRLP4 1012
INDIRF4
ASGNF4
line 3328
;3328:			VectorSubtract(entinfo.origin, bs->enemyorigin, dir);
ADDRLP4 1016
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 0+24
INDIRF4
ADDRLP4 1016
INDIRP4
CNSTI4 6244
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 1016
INDIRP4
CNSTI4 6248
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 6252
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3330
;3329:			//if the enemy is NOT pretty far away and strafing just small steps left and right
;3330:			if (!(dist > 100 && VectorLengthSquared(dir) < Square(32))) {
ADDRLP4 840
INDIRF4
CNSTF4 1120403456
LEF4 $1846
ADDRLP4 140
ARGP4
ADDRLP4 1020
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1020
INDIRF4
CNSTF4 1149239296
LTF4 $1844
LABELV $1846
line 3332
;3331:				//if skilled anough do exact prediction
;3332:				if (aim_skill > 0.8 &&
ADDRLP4 736
INDIRF4
CNSTF4 1061997773
LEF4 $1847
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1847
line 3334
;3333:						//if the weapon is ready to fire
;3334:						bs->cur_ps.weaponstate == WEAPON_READY) {
line 3338
;3335:					aas_clientmove_t move;
;3336:					vec3_t origin;
;3337:
;3338:					VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 1120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 0+24
INDIRF4
ADDRLP4 1120
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 1120
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3340
;3339:					//distance towards the enemy
;3340:					dist = VectorLength(dir);
ADDRLP4 140
ARGP4
ADDRLP4 1124
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 840
ADDRLP4 1124
INDIRF4
ASGNF4
line 3342
;3341:					//direction the enemy is moving in
;3342:					VectorSubtract(entinfo.origin, entinfo.lastvisorigin, dir);
ADDRLP4 140
ADDRLP4 0+24
INDIRF4
ADDRLP4 0+60
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 0+60+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 0+24+8
INDIRF4
ADDRLP4 0+60+8
INDIRF4
SUBF4
ASGNF4
line 3344
;3343:					//
;3344:					VectorScale(dir, 1 / entinfo.update_time, dir);
ADDRLP4 140
ADDRLP4 140
INDIRF4
CNSTF4 1065353216
ADDRLP4 0+16
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 140+4
INDIRF4
CNSTF4 1065353216
ADDRLP4 0+16
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 140+8
INDIRF4
CNSTF4 1065353216
ADDRLP4 0+16
INDIRF4
DIVF4
MULF4
ASGNF4
line 3346
;3345:					//
;3346:					VectorCopy(entinfo.origin, origin);
ADDRLP4 1024
ADDRLP4 0+24
INDIRB
ASGNB 12
line 3347
;3347:					origin[2] += 1;
ADDRLP4 1024+8
ADDRLP4 1024+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 3349
;3348:					//
;3349:					VectorClear(cmdmove);
ADDRLP4 968
CNSTF4 0
ASGNF4
ADDRLP4 968+4
CNSTF4 0
ASGNF4
ADDRLP4 968+8
CNSTF4 0
ASGNF4
line 3351
;3350:					//AAS_ClearShownDebugLines();
;3351:					trap_AAS_PredictClientMovement(&move, bs->enemy, origin,
ADDRLP4 1036
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 1024
ARGP4
CNSTI4 4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 140
ARGP4
ADDRLP4 968
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 840
INDIRF4
CNSTF4 1092616192
MULF4
ADDRLP4 160+272
INDIRF4
DIVF4
CVFI4 4
ARGI4
CNSTF4 1036831949
ARGF4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_AAS_PredictClientMovement
CALLI4
pop
line 3355
;3352:														PRESENCE_CROUCH, qfalse,
;3353:														dir, cmdmove, 0,
;3354:														dist * 10 / wi.speed, 0.1f, 0, 0, qfalse);
;3355:					VectorCopy(move.endpos, bestorigin);
ADDRLP4 724
ADDRLP4 1036
INDIRB
ASGNB 12
line 3357
;3356:					//BotAI_Print(PRT_MESSAGE, "%1.1f predicted speed = %f, frames = %f\n", FloatTime(), VectorLength(dir), dist * 10 / wi.speed);
;3357:				}
ADDRGP4 $1848
JUMPV
LABELV $1847
line 3359
;3358:				//if not that skilled do linear prediction
;3359:				else if (aim_skill > 0.4) {
ADDRLP4 736
INDIRF4
CNSTF4 1053609165
LEF4 $1880
line 3360
;3360:					VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 1024
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 0+24
INDIRF4
ADDRLP4 1024
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 1024
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3362
;3361:					//distance towards the enemy
;3362:					dist = VectorLength(dir);
ADDRLP4 140
ARGP4
ADDRLP4 1028
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 840
ADDRLP4 1028
INDIRF4
ASGNF4
line 3364
;3363:					//direction the enemy is moving in
;3364:					VectorSubtract(entinfo.origin, entinfo.lastvisorigin, dir);
ADDRLP4 140
ADDRLP4 0+24
INDIRF4
ADDRLP4 0+60
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 0+60+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 0+24+8
INDIRF4
ADDRLP4 0+60+8
INDIRF4
SUBF4
ASGNF4
line 3365
;3365:					dir[2] = 0;
ADDRLP4 140+8
CNSTF4 0
ASGNF4
line 3367
;3366:					//
;3367:					speed = VectorNormalize(dir) / entinfo.update_time;
ADDRLP4 140
ARGP4
ADDRLP4 1032
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 980
ADDRLP4 1032
INDIRF4
ADDRLP4 0+16
INDIRF4
DIVF4
ASGNF4
line 3370
;3368:					//botimport.Print(PRT_MESSAGE, "speed = %f, wi->speed = %f\n", speed, wi->speed);
;3369:					//best spot to aim at
;3370:					VectorMA(entinfo.origin, (dist / wi.speed) * speed, dir, bestorigin);
ADDRLP4 1036
ADDRLP4 840
INDIRF4
ASGNF4
ADDRLP4 1040
ADDRLP4 980
INDIRF4
ASGNF4
ADDRLP4 724
ADDRLP4 0+24
INDIRF4
ADDRLP4 140
INDIRF4
ADDRLP4 1036
INDIRF4
ADDRLP4 160+272
INDIRF4
DIVF4
ADDRLP4 1040
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 724+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 140+4
INDIRF4
ADDRLP4 1036
INDIRF4
ADDRLP4 160+272
INDIRF4
DIVF4
ADDRLP4 1040
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 724+8
ADDRLP4 0+24+8
INDIRF4
ADDRLP4 140+8
INDIRF4
ADDRLP4 840
INDIRF4
ADDRLP4 160+272
INDIRF4
DIVF4
ADDRLP4 980
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 3371
;3371:				}
LABELV $1880
LABELV $1848
line 3372
;3372:			}
LABELV $1844
line 3373
;3373:		}
LABELV $1830
line 3375
;3374:		//if the projectile does radial damage
;3375:		if (aim_skill > 0.6 && wi.proj.damagetype & DAMAGETYPE_RADIAL) {
ADDRLP4 736
INDIRF4
CNSTF4 1058642330
LEF4 $1915
ADDRLP4 160+344+180
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1915
line 3377
;3376:			//if the enemy isn't standing significantly higher than the bot
;3377:			if (entinfo.origin[2] < bs->origin[2] + 16) {
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
CNSTF4 1098907648
ADDF4
GEF4 $1919
line 3379
;3378:				//try to aim at the ground in front of the enemy
;3379:				VectorCopy(entinfo.origin, end);
ADDRLP4 956
ADDRLP4 0+24
INDIRB
ASGNB 12
line 3380
;3380:				end[2] -= 64;
ADDRLP4 956+8
ADDRLP4 956+8
INDIRF4
CNSTF4 1115684864
SUBF4
ASGNF4
line 3381
;3381:				BotAI_Trace(&trace, entinfo.origin, NULL, NULL, end, entinfo.number, MASK_SHOT);
ADDRLP4 740
ARGP4
ADDRLP4 0+24
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 956
ARGP4
ADDRLP4 0+20
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3383
;3382:				//
;3383:				VectorCopy(bestorigin, groundtarget);
ADDRLP4 944
ADDRLP4 724
INDIRB
ASGNB 12
line 3384
;3384:				if (trace.startsolid) groundtarget[2] = entinfo.origin[2] - 16;
ADDRLP4 740+4
INDIRI4
CNSTI4 0
EQI4 $1927
ADDRLP4 944+8
ADDRLP4 0+24+8
INDIRF4
CNSTF4 1098907648
SUBF4
ASGNF4
ADDRGP4 $1928
JUMPV
LABELV $1927
line 3385
;3385:				else groundtarget[2] = trace.endpos[2] - 8;
ADDRLP4 944+8
ADDRLP4 740+12+8
INDIRF4
CNSTF4 1090519040
SUBF4
ASGNF4
LABELV $1928
line 3387
;3386:				//trace a line from projectile start to ground target
;3387:				BotAI_Trace(&trace, start, NULL, NULL, groundtarget, bs->entitynum, MASK_SHOT);
ADDRLP4 740
ARGP4
ADDRLP4 844
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 944
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3389
;3388:				//if hitpoint is not vertically too far from the ground target
;3389:				if (fabs(trace.endpos[2] - groundtarget[2]) < 50) {
ADDRLP4 740+12+8
INDIRF4
ADDRLP4 944+8
INDIRF4
SUBF4
ARGF4
ADDRLP4 1008
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 1008
INDIRF4
CNSTF4 1112014848
GEF4 $1936
line 3390
;3390:					VectorSubtract(trace.endpos, groundtarget, dir);
ADDRLP4 140
ADDRLP4 740+12
INDIRF4
ADDRLP4 944
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 740+12+4
INDIRF4
ADDRLP4 944+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 740+12+8
INDIRF4
ADDRLP4 944+8
INDIRF4
SUBF4
ASGNF4
line 3392
;3391:					//if the hitpoint is near enough the ground target
;3392:					if (VectorLengthSquared(dir) < Square(60)) {
ADDRLP4 140
ARGP4
ADDRLP4 1012
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1012
INDIRF4
CNSTF4 1163984896
GEF4 $1950
line 3393
;3393:						VectorSubtract(trace.endpos, start, dir);
ADDRLP4 140
ADDRLP4 740+12
INDIRF4
ADDRLP4 844
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 740+12+4
INDIRF4
ADDRLP4 844+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 740+12+8
INDIRF4
ADDRLP4 844+8
INDIRF4
SUBF4
ASGNF4
line 3395
;3394:						//if the hitpoint is far enough from the bot
;3395:						if (VectorLengthSquared(dir) > Square(100)) {
ADDRLP4 140
ARGP4
ADDRLP4 1016
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1016
INDIRF4
CNSTF4 1176256512
LEF4 $1961
line 3397
;3396:							//check if the bot is visible from the ground target
;3397:							trace.endpos[2] += 1;
ADDRLP4 740+12+8
ADDRLP4 740+12+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 3398
;3398:							BotAI_Trace(&trace, trace.endpos, NULL, NULL, entinfo.origin, entinfo.number, MASK_SHOT);
ADDRLP4 740
ARGP4
ADDRLP4 740+12
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 0+24
ARGP4
ADDRLP4 0+20
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3399
;3399:							if (trace.fraction >= 1) {
ADDRLP4 740+8
INDIRF4
CNSTF4 1065353216
LTF4 $1968
line 3401
;3400:								//botimport.Print(PRT_MESSAGE, "%1.1f aiming at ground\n", AAS_Time());
;3401:								VectorCopy(groundtarget, bestorigin);
ADDRLP4 724
ADDRLP4 944
INDIRB
ASGNB 12
line 3402
;3402:							}
LABELV $1968
line 3403
;3403:						}
LABELV $1961
line 3404
;3404:					}
LABELV $1950
line 3405
;3405:				}
LABELV $1936
line 3406
;3406:			}
LABELV $1919
line 3407
;3407:		}
LABELV $1915
line 3408
;3408:		bestorigin[0] += 20 * crandom() * (1 - aim_accuracy);
ADDRLP4 1008
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 724
ADDRLP4 724
INDIRF4
ADDRLP4 1008
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
SUBF4
CNSTF4 1073741824
MULF4
CNSTF4 1101004800
MULF4
CNSTF4 1065353216
ADDRLP4 156
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3409
;3409:		bestorigin[1] += 20 * crandom() * (1 - aim_accuracy);
ADDRLP4 1012
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 724+4
ADDRLP4 724+4
INDIRF4
ADDRLP4 1012
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
SUBF4
CNSTF4 1073741824
MULF4
CNSTF4 1101004800
MULF4
CNSTF4 1065353216
ADDRLP4 156
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3410
;3410:		bestorigin[2] += 10 * crandom() * (1 - aim_accuracy);
ADDRLP4 1016
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 724+8
ADDRLP4 724+8
INDIRF4
ADDRLP4 1016
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
SUBF4
CNSTF4 1073741824
MULF4
CNSTF4 1092616192
MULF4
CNSTF4 1065353216
ADDRLP4 156
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3411
;3411:	}
ADDRGP4 $1817
JUMPV
LABELV $1816
line 3412
;3412:	else {
line 3414
;3413:		//
;3414:		VectorCopy(bs->lastenemyorigin, bestorigin);
ADDRLP4 724
ADDRFP4 0
INDIRP4
CNSTI4 6548
ADDP4
INDIRB
ASGNB 12
line 3415
;3415:		bestorigin[2] += 8;
ADDRLP4 724+8
ADDRLP4 724+8
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 3417
;3416:		//if the bot is skilled enough
;3417:		if (aim_skill > 0.5) {
ADDRLP4 736
INDIRF4
CNSTF4 1056964608
LEF4 $1974
line 3419
;3418:			//do prediction shots around corners
;3419:			if (wi.number == WP_BFG ||
ADDRLP4 160+4
INDIRI4
CNSTI4 9
EQI4 $1982
ADDRLP4 160+4
INDIRI4
CNSTI4 5
EQI4 $1982
ADDRLP4 160+4
INDIRI4
CNSTI4 4
NEI4 $1976
LABELV $1982
line 3421
;3420:				wi.number == WP_ROCKET_LAUNCHER ||
;3421:				wi.number == WP_GRENADE_LAUNCHER) {
line 3423
;3422:				//create the chase goal
;3423:				goal.entitynum = bs->client;
ADDRLP4 884+40
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 3424
;3424:				goal.areanum = bs->areanum;
ADDRLP4 884+12
ADDRFP4 0
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ASGNI4
line 3425
;3425:				VectorCopy(bs->eye, goal.origin);
ADDRLP4 884
ADDRFP4 0
INDIRP4
CNSTI4 4936
ADDP4
INDIRB
ASGNB 12
line 3426
;3426:				VectorSet(goal.mins, -8, -8, -8);
ADDRLP4 884+16
CNSTF4 3238002688
ASGNF4
ADDRLP4 884+16+4
CNSTF4 3238002688
ASGNF4
ADDRLP4 884+16+8
CNSTF4 3238002688
ASGNF4
line 3427
;3427:				VectorSet(goal.maxs, 8, 8, 8);
ADDRLP4 884+28
CNSTF4 1090519040
ASGNF4
ADDRLP4 884+28+4
CNSTF4 1090519040
ASGNF4
ADDRLP4 884+28+8
CNSTF4 1090519040
ASGNF4
line 3429
;3428:				//
;3429:				if (trap_BotPredictVisiblePosition(bs->lastenemyorigin, bs->lastenemyareanum, &goal, TFL_DEFAULT, target)) {
ADDRLP4 1008
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1008
INDIRP4
CNSTI4 6548
ADDP4
ARGP4
ADDRLP4 1008
INDIRP4
CNSTI4 6544
ADDP4
INDIRI4
ARGI4
ADDRLP4 884
ARGP4
CNSTI4 18616254
ARGI4
ADDRLP4 824
ARGP4
ADDRLP4 1012
ADDRGP4 trap_BotPredictVisiblePosition
CALLI4
ASGNI4
ADDRLP4 1012
INDIRI4
CNSTI4 0
EQI4 $1995
line 3430
;3430:					VectorSubtract(target, bs->eye, dir);
ADDRLP4 1016
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 824
INDIRF4
ADDRLP4 1016
INDIRP4
CNSTI4 4936
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 824+4
INDIRF4
ADDRLP4 1016
INDIRP4
CNSTI4 4940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 824+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4944
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3431
;3431:					if (VectorLengthSquared(dir) > Square(80)) {
ADDRLP4 140
ARGP4
ADDRLP4 1020
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1020
INDIRF4
CNSTF4 1170735104
LEF4 $2001
line 3432
;3432:						VectorCopy(target, bestorigin);
ADDRLP4 724
ADDRLP4 824
INDIRB
ASGNB 12
line 3433
;3433:						bestorigin[2] -= 20;
ADDRLP4 724+8
ADDRLP4 724+8
INDIRF4
CNSTF4 1101004800
SUBF4
ASGNF4
line 3434
;3434:					}
LABELV $2001
line 3435
;3435:				}
LABELV $1995
line 3436
;3436:				aim_accuracy = 1;
ADDRLP4 156
CNSTF4 1065353216
ASGNF4
line 3437
;3437:			}
LABELV $1976
line 3438
;3438:		}
LABELV $1974
line 3439
;3439:	}
LABELV $1817
line 3441
;3440:	//
;3441:	if (enemyvisible) {
ADDRLP4 836
INDIRI4
CNSTI4 0
EQI4 $2004
line 3442
;3442:		BotAI_Trace(&trace, bs->eye, NULL, NULL, bestorigin, bs->entitynum, MASK_SHOT);
ADDRLP4 740
ARGP4
ADDRLP4 1008
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1008
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 724
ARGP4
ADDRLP4 1008
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3443
;3443:		VectorCopy(trace.endpos, bs->aimtarget);
ADDRFP4 0
INDIRP4
CNSTI4 6220
ADDP4
ADDRLP4 740+12
INDIRB
ASGNB 12
line 3444
;3444:	}
ADDRGP4 $2005
JUMPV
LABELV $2004
line 3445
;3445:	else {
line 3446
;3446:		VectorCopy(bestorigin, bs->aimtarget);
ADDRFP4 0
INDIRP4
CNSTI4 6220
ADDP4
ADDRLP4 724
INDIRB
ASGNB 12
line 3447
;3447:	}
LABELV $2005
line 3449
;3448:	//get aim direction
;3449:	VectorSubtract(bestorigin, bs->eye, dir);
ADDRLP4 1008
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 724
INDIRF4
ADDRLP4 1008
INDIRP4
CNSTI4 4936
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 724+4
INDIRF4
ADDRLP4 1008
INDIRP4
CNSTI4 4940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 724+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4944
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3451
;3450:	//
;3451:	if (wi.number == WP_MACHINEGUN ||
ADDRLP4 160+4
INDIRI4
CNSTI4 2
EQI4 $2019
ADDRLP4 160+4
INDIRI4
CNSTI4 3
EQI4 $2019
ADDRLP4 160+4
INDIRI4
CNSTI4 6
EQI4 $2019
ADDRLP4 160+4
INDIRI4
CNSTI4 7
NEI4 $2011
LABELV $2019
line 3454
;3452:		wi.number == WP_SHOTGUN ||
;3453:		wi.number == WP_LIGHTNING ||
;3454:		wi.number == WP_RAILGUN) {
line 3456
;3455:		//distance towards the enemy
;3456:		dist = VectorLength(dir);
ADDRLP4 140
ARGP4
ADDRLP4 1012
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 840
ADDRLP4 1012
INDIRF4
ASGNF4
line 3457
;3457:		if (dist > 150) dist = 150;
ADDRLP4 840
INDIRF4
CNSTF4 1125515264
LEF4 $2020
ADDRLP4 840
CNSTF4 1125515264
ASGNF4
LABELV $2020
line 3458
;3458:		f = 0.6 + dist / 150 * 0.4;
ADDRLP4 940
ADDRLP4 840
INDIRF4
CNSTF4 992920382
MULF4
CNSTF4 1058642330
ADDF4
ASGNF4
line 3459
;3459:		aim_accuracy *= f;
ADDRLP4 156
ADDRLP4 156
INDIRF4
ADDRLP4 940
INDIRF4
MULF4
ASGNF4
line 3460
;3460:	}
LABELV $2011
line 3462
;3461:	//add some random stuff to the aim direction depending on the aim accuracy
;3462:	if (aim_accuracy < 0.8) {
ADDRLP4 156
INDIRF4
CNSTF4 1061997773
GEF4 $2022
line 3463
;3463:		VectorNormalize(dir);
ADDRLP4 140
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3464
;3464:		for (i = 0; i < 3; i++) dir[i] += 0.3 * crandom() * (1 - aim_accuracy);
ADDRLP4 152
CNSTI4 0
ASGNI4
LABELV $2024
ADDRLP4 1012
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1016
ADDRLP4 152
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 140
ADDP4
ASGNP4
ADDRLP4 1016
INDIRP4
ADDRLP4 1016
INDIRP4
INDIRF4
ADDRLP4 1012
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
SUBF4
CNSTF4 1073741824
MULF4
CNSTF4 1050253722
MULF4
CNSTF4 1065353216
ADDRLP4 156
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
LABELV $2025
ADDRLP4 152
ADDRLP4 152
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 3
LTI4 $2024
line 3465
;3465:	}
LABELV $2022
line 3467
;3466:	//set the ideal view angles
;3467:	vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 140
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3469
;3468:	//take the weapon spread into account for lower skilled bots
;3469:	bs->ideal_viewangles[PITCH] += 6 * wi.vspread * crandom() * (1 - aim_accuracy);
ADDRLP4 1012
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1016
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ASGNP4
ADDRLP4 1016
INDIRP4
ADDRLP4 1016
INDIRP4
INDIRF4
ADDRLP4 160+268
INDIRF4
CNSTF4 1086324736
MULF4
ADDRLP4 1012
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
SUBF4
CNSTF4 1073741824
MULF4
MULF4
CNSTF4 1065353216
ADDRLP4 156
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3470
;3470:	bs->ideal_viewangles[PITCH] = AngleMod(bs->ideal_viewangles[PITCH]);
ADDRLP4 1020
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1020
INDIRP4
CNSTI4 6576
ADDP4
INDIRF4
ARGF4
ADDRLP4 1024
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 1020
INDIRP4
CNSTI4 6576
ADDP4
ADDRLP4 1024
INDIRF4
ASGNF4
line 3471
;3471:	bs->ideal_viewangles[YAW] += 6 * wi.hspread * crandom() * (1 - aim_accuracy);
ADDRLP4 1028
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1032
ADDRFP4 0
INDIRP4
CNSTI4 6580
ADDP4
ASGNP4
ADDRLP4 1032
INDIRP4
ADDRLP4 1032
INDIRP4
INDIRF4
ADDRLP4 160+264
INDIRF4
CNSTF4 1086324736
MULF4
ADDRLP4 1028
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
SUBF4
CNSTF4 1073741824
MULF4
MULF4
CNSTF4 1065353216
ADDRLP4 156
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3472
;3472:	bs->ideal_viewangles[YAW] = AngleMod(bs->ideal_viewangles[YAW]);
ADDRLP4 1036
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1036
INDIRP4
CNSTI4 6580
ADDP4
INDIRF4
ARGF4
ADDRLP4 1040
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 1036
INDIRP4
CNSTI4 6580
ADDP4
ADDRLP4 1040
INDIRF4
ASGNF4
line 3474
;3473:	//if the bots should be really challenging
;3474:	if (bot_challenge.integer) {
ADDRGP4 bot_challenge+12
INDIRI4
CNSTI4 0
EQI4 $2030
line 3476
;3475:		//if the bot is really accurate and has the enemy in view for some time
;3476:		if (aim_accuracy > 0.9 && bs->enemysight_time < FloatTime() - 1) {
ADDRLP4 156
INDIRF4
CNSTF4 1063675494
LEF4 $2033
ADDRFP4 0
INDIRP4
CNSTI4 6132
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
SUBF4
GEF4 $2033
line 3478
;3477:			//set the view angles directly
;3478:			if (bs->ideal_viewangles[PITCH] > 180) bs->ideal_viewangles[PITCH] -= 360;
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
INDIRF4
CNSTF4 1127481344
LEF4 $2035
ADDRLP4 1044
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ASGNP4
ADDRLP4 1044
INDIRP4
ADDRLP4 1044
INDIRP4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
LABELV $2035
line 3479
;3479:			VectorCopy(bs->ideal_viewangles, bs->viewangles);
ADDRLP4 1048
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1048
INDIRP4
CNSTI4 6564
ADDP4
ADDRLP4 1048
INDIRP4
CNSTI4 6576
ADDP4
INDIRB
ASGNB 12
line 3480
;3480:			trap_EA_View(bs->client, bs->viewangles);
ADDRLP4 1052
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1052
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 1052
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
ADDRGP4 trap_EA_View
CALLV
pop
line 3481
;3481:		}
LABELV $2033
line 3482
;3482:	}
LABELV $2030
line 3483
;3483:}
LABELV $1725
endproc BotAimAtEnemy 1128 52
data
align 4
LABELV $2038
byte 4 3238002688
byte 4 3238002688
byte 4 3238002688
align 4
LABELV $2039
byte 4 1090519040
byte 4 1090519040
byte 4 1090519040
export BotCheckAttack
code
proc BotCheckAttack 1024 28
line 3490
;3484:
;3485:/*
;3486:==================
;3487:BotCheckAttack
;3488:==================
;3489:*/
;3490:void BotCheckAttack(bot_state_t *bs) {
line 3500
;3491:	float points, reactiontime, fov, firethrottle;
;3492:	int attackentity;
;3493:	bsp_trace_t bsptrace;
;3494:	//float selfpreservation;
;3495:	vec3_t forward, right, start, end, dir, angles;
;3496:	weaponinfo_t wi;
;3497:	bsp_trace_t trace;
;3498:	aas_entityinfo_t entinfo;
;3499:	weapon_t weapon;
;3500:	vec3_t mins = {-8, -8, -8}, maxs = {8, 8, 8};
ADDRLP4 952
ADDRGP4 $2038
INDIRB
ASGNB 12
ADDRLP4 964
ADDRGP4 $2039
INDIRB
ASGNB 12
line 3502
;3501:
;3502:	attackentity = bs->enemy;
ADDRLP4 576
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ASGNI4
line 3504
;3503:	//
;3504:	BotEntityInfo(attackentity, &entinfo);
ADDRLP4 576
INDIRI4
ARGI4
ADDRLP4 792
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3506
;3505:	// if not attacking a player
;3506:	if (attackentity >= MAX_CLIENTS) {
ADDRLP4 576
INDIRI4
CNSTI4 64
LTI4 $2040
line 3509
;3507:
;3508:		// if attacking an obelisk
;3509:		if ( entinfo.number == redobelisk.entitynum ||
ADDRLP4 792+20
INDIRI4
ADDRGP4 redobelisk+40
INDIRI4
EQI4 $2048
ADDRLP4 792+20
INDIRI4
ADDRGP4 blueobelisk+40
INDIRI4
NEI4 $2042
LABELV $2048
line 3510
;3510:			entinfo.number == blueobelisk.entitynum ) {
line 3512
;3511:			// if obelisk is respawning return
;3512:			if ( g_entities[entinfo.number].activator &&
ADDRLP4 792+20
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities+772
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2049
ADDRLP4 792+20
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities+772
ADDP4
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2049
line 3513
;3513:				g_entities[entinfo.number].activator->s.frame == 2 ) {
line 3514
;3514:				return;
ADDRGP4 $2037
JUMPV
LABELV $2049
line 3516
;3515:			}
;3516:		}
LABELV $2042
line 3518
;3517:
;3518:	}
LABELV $2040
line 3520
;3519:	//
;3520:	reactiontime = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_REACTIONTIME, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 6
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 980
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 704
ADDRLP4 980
INDIRF4
ASGNF4
line 3521
;3521:	if (bs->enemysight_time > FloatTime() - reactiontime) return;
ADDRFP4 0
INDIRP4
CNSTI4 6132
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
ADDRLP4 704
INDIRF4
SUBF4
LEF4 $2055
ADDRGP4 $2037
JUMPV
LABELV $2055
line 3522
;3522:	if (bs->teleport_time > FloatTime() - reactiontime) return;
ADDRFP4 0
INDIRP4
CNSTI4 6180
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
ADDRLP4 704
INDIRF4
SUBF4
LEF4 $2057
ADDRGP4 $2037
JUMPV
LABELV $2057
line 3524
;3523:	//if changing weapons
;3524:	if (bs->weaponchange_time > FloatTime() - 0.1) return;
ADDRFP4 0
INDIRP4
CNSTI4 6192
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1036831949
SUBF4
LEF4 $2059
ADDRGP4 $2037
JUMPV
LABELV $2059
line 3526
;3525:	//check fire throttle characteristic
;3526:	if (bs->firethrottlewait_time > FloatTime()) return;
ADDRFP4 0
INDIRP4
CNSTI4 6196
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $2061
ADDRGP4 $2037
JUMPV
LABELV $2061
line 3527
;3527:	firethrottle = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_FIRETHROTTLE, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 47
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 984
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 936
ADDRLP4 984
INDIRF4
ASGNF4
line 3528
;3528:	if (bs->firethrottleshoot_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6200
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $2063
line 3529
;3529:		if (random() > firethrottle) {
ADDRLP4 988
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 988
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 936
INDIRF4
LEF4 $2065
line 3530
;3530:			bs->firethrottlewait_time = FloatTime() + firethrottle;
ADDRFP4 0
INDIRP4
CNSTI4 6196
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 936
INDIRF4
ADDF4
ASGNF4
line 3531
;3531:			bs->firethrottleshoot_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6200
ADDP4
CNSTF4 0
ASGNF4
line 3532
;3532:		}
ADDRGP4 $2066
JUMPV
LABELV $2065
line 3533
;3533:		else {
line 3534
;3534:			bs->firethrottleshoot_time = FloatTime() + 1 - firethrottle;
ADDRFP4 0
INDIRP4
CNSTI4 6200
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
ADDF4
ADDRLP4 936
INDIRF4
SUBF4
ASGNF4
line 3535
;3535:			bs->firethrottlewait_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6196
ADDP4
CNSTF4 0
ASGNF4
line 3536
;3536:		}
LABELV $2066
line 3537
;3537:	}
LABELV $2063
line 3540
;3538:	//
;3539:	//
;3540:	VectorSubtract(bs->aimtarget, bs->eye, dir);
ADDRLP4 988
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 580
ADDRLP4 988
INDIRP4
CNSTI4 6220
ADDP4
INDIRF4
ADDRLP4 988
INDIRP4
CNSTI4 4936
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 580+4
ADDRLP4 988
INDIRP4
CNSTI4 6224
ADDP4
INDIRF4
ADDRLP4 988
INDIRP4
CNSTI4 4940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 992
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 580+8
ADDRLP4 992
INDIRP4
CNSTI4 6228
ADDP4
INDIRF4
ADDRLP4 992
INDIRP4
CNSTI4 4944
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3542
;3541:	//
;3542:	if (bs->weaponnum == WP_GAUNTLET) {
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
CNSTI4 1
NEI4 $2069
line 3543
;3543:		if (VectorLengthSquared(dir) > Square(60)) {
ADDRLP4 580
ARGP4
ADDRLP4 996
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 996
INDIRF4
CNSTF4 1163984896
LEF4 $2071
line 3544
;3544:			return;
ADDRGP4 $2037
JUMPV
LABELV $2071
line 3546
;3545:		}
;3546:	}
LABELV $2069
line 3547
;3547:	if (VectorLengthSquared(dir) < Square(100))
ADDRLP4 580
ARGP4
ADDRLP4 996
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 996
INDIRF4
CNSTF4 1176256512
GEF4 $2073
line 3548
;3548:		fov = 120;
ADDRLP4 932
CNSTF4 1123024896
ASGNF4
ADDRGP4 $2074
JUMPV
LABELV $2073
line 3550
;3549:	else
;3550:		fov = 50;
ADDRLP4 932
CNSTF4 1112014848
ASGNF4
LABELV $2074
line 3552
;3551:	//
;3552:	vectoangles(dir, angles);
ADDRLP4 580
ARGP4
ADDRLP4 940
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3553
;3553:	if (!InFieldOfVision(bs->viewangles, fov, angles))
ADDRFP4 0
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
ADDRLP4 932
INDIRF4
ARGF4
ADDRLP4 940
ARGP4
ADDRLP4 1000
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 1000
INDIRI4
CNSTI4 0
NEI4 $2075
line 3554
;3554:		return;
ADDRGP4 $2037
JUMPV
LABELV $2075
line 3555
;3555:	BotAI_Trace(&bsptrace, bs->eye, NULL, NULL, bs->aimtarget, bs->client, CONTENTS_SOLID|CONTENTS_PLAYERCLIP);
ADDRLP4 708
ARGP4
ADDRLP4 1004
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1004
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 1004
INDIRP4
CNSTI4 6220
ADDP4
ARGP4
ADDRLP4 1004
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
line 3556
;3556:	if (bsptrace.fraction < 1 && bsptrace.ent != attackentity)
ADDRLP4 708+8
INDIRF4
CNSTF4 1065353216
GEF4 $2077
ADDRLP4 708+80
INDIRI4
ADDRLP4 576
INDIRI4
EQI4 $2077
line 3557
;3557:		return;
ADDRGP4 $2037
JUMPV
LABELV $2077
line 3560
;3558:
;3559:	//get the weapon info
;3560:	trap_BotGetWeaponInfo(bs->ws, bs->weaponnum, &wi);
ADDRLP4 1008
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1008
INDIRP4
CNSTI4 6536
ADDP4
INDIRI4
ARGI4
ADDRLP4 1008
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
ADDRGP4 trap_BotGetWeaponInfo
CALLV
pop
line 3562
;3561:	//get the start point shooting from
;3562:	VectorCopy(bs->origin, start);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 3563
;3563:	start[2] += bs->cur_ps.viewheight;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 3564
;3564:	AngleVectors(bs->viewangles, forward, right, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 676
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3565
;3565:	start[0] += forward[0] * wi.offset[0] + right[0] * wi.offset[1];
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
ADDRLP4 24+292
INDIRF4
MULF4
ADDRLP4 676
INDIRF4
ADDRLP4 24+292+4
INDIRF4
MULF4
ADDF4
ADDF4
ASGNF4
line 3566
;3566:	start[1] += forward[1] * wi.offset[0] + right[1] * wi.offset[1];
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 24+292
INDIRF4
MULF4
ADDRLP4 676+4
INDIRF4
ADDRLP4 24+292+4
INDIRF4
MULF4
ADDF4
ADDF4
ASGNF4
line 3567
;3567:	start[2] += forward[2] * wi.offset[0] + right[2] * wi.offset[1] + wi.offset[2];
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 12+8
INDIRF4
ADDRLP4 24+292
INDIRF4
MULF4
ADDRLP4 676+8
INDIRF4
ADDRLP4 24+292+4
INDIRF4
MULF4
ADDF4
ADDRLP4 24+292+8
INDIRF4
ADDF4
ADDF4
ASGNF4
line 3569
;3568:	//end point aiming at
;3569:	VectorMA(start, 1000, forward, end);
ADDRLP4 688
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
CNSTF4 1148846080
MULF4
ADDF4
ASGNF4
ADDRLP4 688+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12+4
INDIRF4
CNSTF4 1148846080
MULF4
ADDF4
ASGNF4
ADDRLP4 688+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 12+8
INDIRF4
CNSTF4 1148846080
MULF4
ADDF4
ASGNF4
line 3571
;3570:	//a little back to make sure not inside a very close enemy
;3571:	VectorMA(start, -12, forward, start);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
CNSTF4 3242196992
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12+4
INDIRF4
CNSTF4 3242196992
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 12+8
INDIRF4
CNSTF4 3242196992
MULF4
ADDF4
ASGNF4
line 3572
;3572:	BotAI_Trace(&trace, start, mins, maxs, end, bs->entitynum, MASK_SHOT);
ADDRLP4 592
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 952
ARGP4
ADDRLP4 964
ARGP4
ADDRLP4 688
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3574
;3573:	//if the entity is a client
;3574:	if (trace.ent >= 0 && trace.ent < MAX_CLIENTS) {
ADDRLP4 592+80
INDIRI4
CNSTI4 0
LTI4 $2111
ADDRLP4 592+80
INDIRI4
CNSTI4 64
GEI4 $2111
line 3575
;3575:		if (trace.ent != attackentity) {
ADDRLP4 592+80
INDIRI4
ADDRLP4 576
INDIRI4
EQI4 $2115
line 3577
;3576:			//if a teammate is hit
;3577:			if (BotSameTeam(bs, trace.ent))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 592+80
INDIRI4
ARGI4
ADDRLP4 1012
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 1012
INDIRI4
CNSTI4 0
EQI4 $2118
line 3578
;3578:				return;
ADDRGP4 $2037
JUMPV
LABELV $2118
line 3579
;3579:		}
LABELV $2115
line 3580
;3580:	}
LABELV $2111
line 3582
;3581:	//if won't hit the enemy or not attacking a player (obelisk)
;3582:	if (trace.ent != attackentity || attackentity >= MAX_CLIENTS) {
ADDRLP4 592+80
INDIRI4
ADDRLP4 576
INDIRI4
NEI4 $2124
ADDRLP4 576
INDIRI4
CNSTI4 64
LTI4 $2121
LABELV $2124
line 3584
;3583:		//if the projectile does radial damage
;3584:		if (wi.proj.damagetype & DAMAGETYPE_RADIAL) {
ADDRLP4 24+344+180
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $2125
line 3585
;3585:			if (trace.fraction * 1000 < wi.proj.radius) {
ADDRLP4 592+8
INDIRF4
CNSTF4 1148846080
MULF4
ADDRLP4 24+344+172
INDIRF4
GEF4 $2129
line 3586
;3586:				points = (wi.proj.damage - 0.5 * trace.fraction * 1000) * 0.5;
ADDRLP4 976
ADDRLP4 24+344+168
INDIRI4
CVIF4 4
ADDRLP4 592+8
INDIRF4
CNSTF4 1140457472
MULF4
SUBF4
CNSTF4 1056964608
MULF4
ASGNF4
line 3587
;3587:				if (points > 0) {
ADDRLP4 976
INDIRF4
CNSTF4 0
LEF4 $2137
line 3588
;3588:					return;
ADDRGP4 $2037
JUMPV
LABELV $2137
line 3590
;3589:				}
;3590:			}
LABELV $2129
line 3592
;3591:			//FIXME: check if a teammate gets radial damage
;3592:		}
LABELV $2125
line 3593
;3593:	}
LABELV $2121
line 3595
;3594:
;3595:	weapon = bs->cur_ps.weapon;
ADDRLP4 700
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ASGNI4
line 3596
;3596:	if ( weapon >= WP_MACHINEGUN && weapon <= WP_BFG && !bs->cur_ps.ammo[ weapon ] ) {
ADDRLP4 700
INDIRI4
CNSTI4 2
LTI4 $2139
ADDRLP4 700
INDIRI4
CNSTI4 9
GTI4 $2139
ADDRLP4 700
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 392
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2139
line 3597
;3597:		return;
ADDRGP4 $2037
JUMPV
LABELV $2139
line 3601
;3598:	}
;3599:
;3600:	//if fire has to be release to activate weapon
;3601:	if (wi.flags & WFL_FIRERELEASED) {
ADDRLP4 24+176
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $2141
line 3602
;3602:		if (bs->flags & BFL_ATTACKED) {
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $2142
line 3603
;3603:			trap_EA_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Attack
CALLV
pop
line 3604
;3604:		}
line 3605
;3605:	}
ADDRGP4 $2142
JUMPV
LABELV $2141
line 3606
;3606:	else {
line 3607
;3607:		trap_EA_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Attack
CALLV
pop
line 3608
;3608:	}
LABELV $2142
line 3609
;3609:	bs->flags ^= BFL_ATTACKED;
ADDRLP4 1020
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
ASGNP4
ADDRLP4 1020
INDIRP4
ADDRLP4 1020
INDIRP4
INDIRI4
CNSTI4 2
BXORI4
ASGNI4
line 3610
;3610:}
LABELV $2037
endproc BotCheckAttack 1024 28
data
align 4
LABELV $2150
byte 4 1143930880
byte 4 1129054208
byte 4 1143472128
align 4
LABELV $2151
byte 4 1148256256
byte 4 1139408896
byte 4 1143603200
align 4
LABELV $2152
byte 4 1134034944
byte 4 1135607808
byte 4 1147535360
export BotMapScripts
code
proc BotMapScripts 264 16
line 3617
;3611:
;3612:/*
;3613:==================
;3614:BotMapScripts
;3615:==================
;3616:*/
;3617:void BotMapScripts(bot_state_t *bs) {
line 3623
;3618:	int i, shootbutton;
;3619:	float aim_accuracy;
;3620:	aas_entityinfo_t entinfo;
;3621:	vec3_t dir;
;3622:
;3623:	if (!Q_stricmp(mapname, "q3tourney6")) {
ADDRGP4 mapname
ARGP4
ADDRGP4 $2149
ARGP4
ADDRLP4 164
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
NEI4 $2147
line 3624
;3624:		vec3_t mins = {700, 204, 672}, maxs = {964, 468, 680};
ADDRLP4 168
ADDRGP4 $2150
INDIRB
ASGNB 12
ADDRLP4 180
ADDRGP4 $2151
INDIRB
ASGNB 12
line 3625
;3625:		vec3_t buttonorg = {304, 352, 920};
ADDRLP4 192
ADDRGP4 $2152
INDIRB
ASGNB 12
line 3627
;3626:		//NOTE: NEVER use the func_bobbing in q3tourney6
;3627:		bs->tfl &= ~TFL_FUNCBOB;
ADDRLP4 204
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 204
INDIRP4
ADDRLP4 204
INDIRP4
INDIRI4
CNSTI4 -16777217
BANDI4
ASGNI4
line 3629
;3628:		//if the bot is below the bounding box
;3629:		if (bs->origin[0] > mins[0] && bs->origin[0] < maxs[0]) {
ADDRLP4 208
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 208
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRLP4 168
INDIRF4
LEF4 $2153
ADDRLP4 208
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRLP4 180
INDIRF4
GEF4 $2153
line 3630
;3630:			if (bs->origin[1] > mins[1] && bs->origin[1] < maxs[1]) {
ADDRLP4 212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 212
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRLP4 168+4
INDIRF4
LEF4 $2155
ADDRLP4 212
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRLP4 180+4
INDIRF4
GEF4 $2155
line 3631
;3631:				if (bs->origin[2] < mins[2]) {
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
ADDRLP4 168+8
INDIRF4
GEF4 $2159
line 3632
;3632:					return;
ADDRGP4 $2146
JUMPV
LABELV $2159
line 3634
;3633:				}
;3634:			}
LABELV $2155
line 3635
;3635:		}
LABELV $2153
line 3636
;3636:		shootbutton = qfalse;
ADDRLP4 144
CNSTI4 0
ASGNI4
line 3638
;3637:		//if an enemy is below this bounding box then shoot the button
;3638:		for (i = 0; i < level.maxclients; i++) {
ADDRLP4 140
CNSTI4 0
ASGNI4
ADDRGP4 $2165
JUMPV
LABELV $2162
line 3640
;3639:
;3640:			if (i == bs->client) continue;
ADDRLP4 140
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $2167
ADDRGP4 $2163
JUMPV
LABELV $2167
line 3642
;3641:			//
;3642:			BotEntityInfo(i, &entinfo);
ADDRLP4 140
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3644
;3643:			//
;3644:			if (!entinfo.valid) continue;
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2169
ADDRGP4 $2163
JUMPV
LABELV $2169
line 3646
;3645:			//if the enemy isn't dead and the enemy isn't the bot self
;3646:			if (EntityIsDead(&entinfo) || entinfo.number == bs->entitynum) continue;
ADDRLP4 0
ARGP4
ADDRLP4 212
ADDRGP4 EntityIsDead
CALLI4
ASGNI4
ADDRLP4 212
INDIRI4
CNSTI4 0
NEI4 $2174
ADDRLP4 0+20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
NEI4 $2171
LABELV $2174
ADDRGP4 $2163
JUMPV
LABELV $2171
line 3648
;3647:			//
;3648:			if (entinfo.origin[0] > mins[0] && entinfo.origin[0] < maxs[0]) {
ADDRLP4 0+24
INDIRF4
ADDRLP4 168
INDIRF4
LEF4 $2175
ADDRLP4 0+24
INDIRF4
ADDRLP4 180
INDIRF4
GEF4 $2175
line 3649
;3649:				if (entinfo.origin[1] > mins[1] && entinfo.origin[1] < maxs[1]) {
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 168+4
INDIRF4
LEF4 $2179
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 180+4
INDIRF4
GEF4 $2179
line 3650
;3650:					if (entinfo.origin[2] < mins[2]) {
ADDRLP4 0+24+8
INDIRF4
ADDRLP4 168+8
INDIRF4
GEF4 $2187
line 3652
;3651:						//if there's a team mate below the crusher
;3652:						if (BotSameTeam(bs, i)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
INDIRI4
ARGI4
ADDRLP4 216
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 216
INDIRI4
CNSTI4 0
EQI4 $2192
line 3653
;3653:							shootbutton = qfalse;
ADDRLP4 144
CNSTI4 0
ASGNI4
line 3654
;3654:							break;
ADDRGP4 $2164
JUMPV
LABELV $2192
line 3656
;3655:						}
;3656:						else {
line 3657
;3657:							shootbutton = qtrue;
ADDRLP4 144
CNSTI4 1
ASGNI4
line 3658
;3658:						}
line 3659
;3659:					}
LABELV $2187
line 3660
;3660:				}
LABELV $2179
line 3661
;3661:			}
LABELV $2175
line 3662
;3662:		}
LABELV $2163
line 3638
ADDRLP4 140
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2165
ADDRLP4 140
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $2162
LABELV $2164
line 3663
;3663:		if (shootbutton) {
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $2148
line 3664
;3664:			bs->flags |= BFL_IDEALVIEWSET;
ADDRLP4 212
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
ASGNP4
ADDRLP4 212
INDIRP4
ADDRLP4 212
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 3665
;3665:			VectorSubtract(buttonorg, bs->eye, dir);
ADDRLP4 216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 148
ADDRLP4 192
INDIRF4
ADDRLP4 216
INDIRP4
CNSTI4 4936
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 148+4
ADDRLP4 192+4
INDIRF4
ADDRLP4 216
INDIRP4
CNSTI4 4940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 148+8
ADDRLP4 192+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4944
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3666
;3666:			vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 148
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3667
;3667:			aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 7
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 220
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 160
ADDRLP4 220
INDIRF4
ASGNF4
line 3668
;3668:			bs->ideal_viewangles[PITCH] += 8 * crandom() * (1 - aim_accuracy);
ADDRLP4 224
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 228
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ASGNP4
ADDRLP4 228
INDIRP4
ADDRLP4 228
INDIRP4
INDIRF4
ADDRLP4 224
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
SUBF4
CNSTF4 1073741824
MULF4
CNSTF4 1090519040
MULF4
CNSTF4 1065353216
ADDRLP4 160
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3669
;3669:			bs->ideal_viewangles[PITCH] = AngleMod(bs->ideal_viewangles[PITCH]);
ADDRLP4 232
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 232
INDIRP4
CNSTI4 6576
ADDP4
INDIRF4
ARGF4
ADDRLP4 236
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 232
INDIRP4
CNSTI4 6576
ADDP4
ADDRLP4 236
INDIRF4
ASGNF4
line 3670
;3670:			bs->ideal_viewangles[YAW] += 8 * crandom() * (1 - aim_accuracy);
ADDRLP4 240
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 244
ADDRFP4 0
INDIRP4
CNSTI4 6580
ADDP4
ASGNP4
ADDRLP4 244
INDIRP4
ADDRLP4 244
INDIRP4
INDIRF4
ADDRLP4 240
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
SUBF4
CNSTF4 1073741824
MULF4
CNSTF4 1090519040
MULF4
CNSTF4 1065353216
ADDRLP4 160
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3671
;3671:			bs->ideal_viewangles[YAW] = AngleMod(bs->ideal_viewangles[YAW]);
ADDRLP4 248
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 248
INDIRP4
CNSTI4 6580
ADDP4
INDIRF4
ARGF4
ADDRLP4 252
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 248
INDIRP4
CNSTI4 6580
ADDP4
ADDRLP4 252
INDIRF4
ASGNF4
line 3673
;3672:			//
;3673:			if (InFieldOfVision(bs->viewangles, 20, bs->ideal_viewangles)) {
ADDRLP4 256
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 256
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1101004800
ARGF4
ADDRLP4 256
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRLP4 260
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
EQI4 $2148
line 3674
;3674:				trap_EA_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Attack
CALLV
pop
line 3675
;3675:			}
line 3676
;3676:		}
line 3677
;3677:	}
ADDRGP4 $2148
JUMPV
LABELV $2147
line 3678
;3678:	else if (!Q_stricmp(mapname, "mpq3tourney6")) {
ADDRGP4 mapname
ARGP4
ADDRGP4 $2204
ARGP4
ADDRLP4 168
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 0
NEI4 $2202
line 3680
;3679:		//NOTE: NEVER use the func_bobbing in mpq3tourney6
;3680:		bs->tfl &= ~TFL_FUNCBOB;
ADDRLP4 172
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 172
INDIRP4
ADDRLP4 172
INDIRP4
INDIRI4
CNSTI4 -16777217
BANDI4
ASGNI4
line 3681
;3681:	}
LABELV $2202
LABELV $2148
line 3682
;3682:}
LABELV $2146
endproc BotMapScripts 264 16
data
align 4
LABELV VEC_UP
byte 4 0
byte 4 3212836864
byte 4 0
align 4
LABELV MOVEDIR_UP
byte 4 0
byte 4 0
byte 4 1065353216
align 4
LABELV VEC_DOWN
byte 4 0
byte 4 3221225472
byte 4 0
align 4
LABELV MOVEDIR_DOWN
byte 4 0
byte 4 0
byte 4 3212836864
export BotSetMovedir
code
proc BotSetMovedir 8 16
line 3695
;3683:
;3684:/*
;3685:==================
;3686:BotSetMovedir
;3687:==================
;3688:*/
;3689:// bk001205 - made these static
;3690:static vec3_t VEC_UP		= {0, -1,  0};
;3691:static vec3_t MOVEDIR_UP	= {0,  0,  1};
;3692:static vec3_t VEC_DOWN		= {0, -2,  0};
;3693:static vec3_t MOVEDIR_DOWN	= {0,  0, -1};
;3694:
;3695:void BotSetMovedir(vec3_t angles, vec3_t movedir) {
line 3696
;3696:	if (VectorCompare(angles, VEC_UP)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 VEC_UP
ARGP4
ADDRLP4 0
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $2206
line 3697
;3697:		VectorCopy(MOVEDIR_UP, movedir);
ADDRFP4 4
INDIRP4
ADDRGP4 MOVEDIR_UP
INDIRB
ASGNB 12
line 3698
;3698:	}
ADDRGP4 $2207
JUMPV
LABELV $2206
line 3699
;3699:	else if (VectorCompare(angles, VEC_DOWN)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 VEC_DOWN
ARGP4
ADDRLP4 4
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $2208
line 3700
;3700:		VectorCopy(MOVEDIR_DOWN, movedir);
ADDRFP4 4
INDIRP4
ADDRGP4 MOVEDIR_DOWN
INDIRB
ASGNB 12
line 3701
;3701:	}
ADDRGP4 $2209
JUMPV
LABELV $2208
line 3702
;3702:	else {
line 3703
;3703:		AngleVectors(angles, movedir, NULL, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3704
;3704:	}
LABELV $2209
LABELV $2207
line 3705
;3705:}
LABELV $2205
endproc BotSetMovedir 8 16
export BotModelMinsMaxs
proc BotModelMinsMaxs 40 0
line 3714
;3706:
;3707:/*
;3708:==================
;3709:BotModelMinsMaxs
;3710:
;3711:this is ugly
;3712:==================
;3713:*/
;3714:int BotModelMinsMaxs(int modelindex, int eType, int contents, vec3_t mins, vec3_t maxs) {
line 3718
;3715:	gentity_t *ent;
;3716:	int i;
;3717:
;3718:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 3719
;3719:	for (i = 0; i < level.num_entities; i++, ent++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $2214
JUMPV
LABELV $2211
line 3720
;3720:		if ( !ent->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2216
line 3721
;3721:			continue;
ADDRGP4 $2212
JUMPV
LABELV $2216
line 3723
;3722:		}
;3723:		if ( eType && ent->s.eType != eType) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $2218
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $2218
line 3724
;3724:			continue;
ADDRGP4 $2212
JUMPV
LABELV $2218
line 3726
;3725:		}
;3726:		if ( contents && ent->r.contents != contents) {
ADDRLP4 12
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $2220
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $2220
line 3727
;3727:			continue;
ADDRGP4 $2212
JUMPV
LABELV $2220
line 3729
;3728:		}
;3729:		if (ent->s.modelindex == modelindex) {
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $2222
line 3730
;3730:			if (mins)
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2224
line 3731
;3731:				VectorAdd(ent->r.currentOrigin, ent->r.mins, mins);
ADDRFP4 12
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 440
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
ADDF4
ASGNF4
LABELV $2224
line 3732
;3732:			if (maxs)
ADDRFP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2226
line 3733
;3733:				VectorAdd(ent->r.currentOrigin, ent->r.maxs, maxs);
ADDRFP4 16
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ADDF4
ASGNF4
LABELV $2226
line 3734
;3734:			return i;
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $2210
JUMPV
LABELV $2222
line 3736
;3735:		}
;3736:	}
LABELV $2212
line 3719
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 824
ADDP4
ASGNP4
LABELV $2214
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $2211
line 3737
;3737:	if (mins)
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2228
line 3738
;3738:		VectorClear(mins);
ADDRFP4 12
INDIRP4
CNSTF4 0
ASGNF4
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
LABELV $2228
line 3739
;3739:	if (maxs)
ADDRFP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2230
line 3740
;3740:		VectorClear(maxs);
ADDRFP4 16
INDIRP4
CNSTF4 0
ASGNF4
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
LABELV $2230
line 3741
;3741:	return 0;
CNSTI4 0
RETI4
LABELV $2210
endproc BotModelMinsMaxs 40 0
data
align 4
LABELV $2233
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
align 4
LABELV $2234
byte 4 3212836864
byte 4 3212836864
byte 4 3212836864
export BotFuncButtonActivateGoal
code
proc BotFuncButtonActivateGoal 628 28
line 3749
;3742:}
;3743:
;3744:/*
;3745:==================
;3746:BotFuncButtonGoal
;3747:==================
;3748:*/
;3749:int BotFuncButtonActivateGoal(bot_state_t *bs, int bspent, bot_activategoal_t *activategoal) {
line 3755
;3750:	int i, areas[10], numareas, modelindex, entitynum;
;3751:	char model[128];
;3752:	float lip, dist, health, angle;
;3753:	vec3_t size, start, end, mins, maxs, angles, points[10];
;3754:	vec3_t movedir, origin, goalorigin, bboxmins, bboxmaxs;
;3755:	vec3_t extramins = {1, 1, 1}, extramaxs = {-1, -1, -1};
ADDRLP4 304
ADDRGP4 $2233
INDIRB
ASGNB 12
ADDRLP4 316
ADDRGP4 $2234
INDIRB
ASGNB 12
line 3758
;3756:	bsp_trace_t bsptrace;
;3757:
;3758:	activategoal->shoot = qfalse;
ADDRFP4 8
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 0
ASGNI4
line 3759
;3759:	VectorClear(activategoal->target);
ADDRFP4 8
INDIRP4
CNSTI4 80
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 84
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 88
ADDP4
CNSTF4 0
ASGNF4
line 3761
;3760:	//create a bot goal towards the button
;3761:	trap_AAS_ValueForBSPEpairKey(bspent, "model", model, sizeof(model));
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $526
ARGP4
ADDRLP4 160
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 3762
;3762:	if (!*model)
ADDRLP4 160
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $2235
line 3763
;3763:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2232
JUMPV
LABELV $2235
line 3764
;3764:	modelindex = atoi(model+1);
ADDRLP4 160+1
ARGP4
ADDRLP4 560
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 288
ADDRLP4 560
INDIRI4
ASGNI4
line 3765
;3765:	if (!modelindex)
ADDRLP4 288
INDIRI4
CNSTI4 0
NEI4 $2238
line 3766
;3766:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2232
JUMPV
LABELV $2238
line 3767
;3767:	VectorClear(angles);
ADDRLP4 96
CNSTF4 0
ASGNF4
ADDRLP4 96+4
CNSTF4 0
ASGNF4
ADDRLP4 96+8
CNSTF4 0
ASGNF4
line 3768
;3768:	entitynum = BotModelMinsMaxs(modelindex, ET_MOVER, 0, mins, maxs);
ADDRLP4 288
INDIRI4
ARGI4
CNSTI4 4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 72
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 564
ADDRGP4 BotModelMinsMaxs
CALLI4
ASGNI4
ADDRLP4 344
ADDRLP4 564
INDIRI4
ASGNI4
line 3770
;3769:	//get the lip of the button
;3770:	trap_AAS_FloatForBSPEpairKey(bspent, "lip", &lip);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $2242
ARGP4
ADDRLP4 328
ARGP4
ADDRGP4 trap_AAS_FloatForBSPEpairKey
CALLI4
pop
line 3771
;3771:	if (!lip) lip = 4;
ADDRLP4 328
INDIRF4
CNSTF4 0
NEF4 $2243
ADDRLP4 328
CNSTF4 1082130432
ASGNF4
LABELV $2243
line 3773
;3772:	//get the move direction from the angle
;3773:	trap_AAS_FloatForBSPEpairKey(bspent, "angle", &angle);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $2245
ARGP4
ADDRLP4 352
ARGP4
ADDRGP4 trap_AAS_FloatForBSPEpairKey
CALLI4
pop
line 3774
;3774:	VectorSet(angles, 0, angle, 0);
ADDRLP4 96
CNSTF4 0
ASGNF4
ADDRLP4 96+4
ADDRLP4 352
INDIRF4
ASGNF4
ADDRLP4 96+8
CNSTF4 0
ASGNF4
line 3775
;3775:	BotSetMovedir(angles, movedir);
ADDRLP4 96
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 BotSetMovedir
CALLV
pop
line 3777
;3776:	//button size
;3777:	VectorSubtract(maxs, mins, size);
ADDRLP4 112
ADDRLP4 84
INDIRF4
ADDRLP4 72
INDIRF4
SUBF4
ASGNF4
ADDRLP4 112+4
ADDRLP4 84+4
INDIRF4
ADDRLP4 72+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 112+8
ADDRLP4 84+8
INDIRF4
ADDRLP4 72+8
INDIRF4
SUBF4
ASGNF4
line 3779
;3778:	//button origin
;3779:	VectorAdd(mins, maxs, origin);
ADDRLP4 16
ADDRLP4 72
INDIRF4
ADDRLP4 84
INDIRF4
ADDF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 72+4
INDIRF4
ADDRLP4 84+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 16+8
ADDRLP4 72+8
INDIRF4
ADDRLP4 84+8
INDIRF4
ADDF4
ASGNF4
line 3780
;3780:	VectorScale(origin, 0.5, origin);
ADDRLP4 16
ADDRLP4 16
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 16+4
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
ADDRLP4 16+8
ADDRLP4 16+8
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 3782
;3781:	//touch distance of the button
;3782:	dist = fabs(movedir[0]) * size[0] + fabs(movedir[1]) * size[1] + fabs(movedir[2]) * size[2];
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 568
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 4+4
INDIRF4
ARGF4
ADDRLP4 572
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 4+8
INDIRF4
ARGF4
ADDRLP4 576
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 568
INDIRF4
ADDRLP4 112
INDIRF4
MULF4
ADDRLP4 572
INDIRF4
ADDRLP4 112+4
INDIRF4
MULF4
ADDF4
ADDRLP4 576
INDIRF4
ADDRLP4 112+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3783
;3783:	dist *= 0.5;
ADDRLP4 28
ADDRLP4 28
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 3785
;3784:	//
;3785:	trap_AAS_FloatForBSPEpairKey(bspent, "health", &health);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $2268
ARGP4
ADDRLP4 348
ARGP4
ADDRGP4 trap_AAS_FloatForBSPEpairKey
CALLI4
pop
line 3787
;3786:	//if the button is shootable
;3787:	if (health) {
ADDRLP4 348
INDIRF4
CNSTF4 0
EQF4 $2269
line 3789
;3788:		//calculate the shoot target
;3789:		VectorMA(origin, -dist, movedir, goalorigin);
ADDRLP4 580
ADDRLP4 28
INDIRF4
NEGF4
ASGNF4
ADDRLP4 124
ADDRLP4 16
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 580
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+4
ADDRLP4 16+4
INDIRF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 580
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+8
ADDRLP4 16+8
INDIRF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 28
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
line 3791
;3790:		//
;3791:		VectorCopy(goalorigin, activategoal->target);
ADDRFP4 8
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 124
INDIRB
ASGNB 12
line 3792
;3792:		activategoal->shoot = qtrue;
ADDRFP4 8
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 1
ASGNI4
line 3794
;3793:		//
;3794:		BotAI_Trace(&bsptrace, bs->eye, NULL, NULL, goalorigin, bs->entitynum, MASK_SHOT);
ADDRLP4 356
ARGP4
ADDRLP4 584
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 584
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 124
ARGP4
ADDRLP4 584
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3796
;3795:		// if the button is visible from the current position
;3796:		if (bsptrace.fraction >= 1.0 || bsptrace.ent == entitynum) {
ADDRLP4 356+8
INDIRF4
CNSTF4 1065353216
GEF4 $2281
ADDRLP4 356+80
INDIRI4
ADDRLP4 344
INDIRI4
NEI4 $2277
LABELV $2281
line 3798
;3797:			//
;3798:			activategoal->goal.entitynum = entitynum; //NOTE: this is the entity number of the shootable button
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 344
INDIRI4
ASGNI4
line 3799
;3799:			activategoal->goal.number = 0;
ADDRFP4 8
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 3800
;3800:			activategoal->goal.flags = 0;
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 3801
;3801:			VectorCopy(bs->origin, activategoal->goal.origin);
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 3802
;3802:			activategoal->goal.areanum = bs->areanum;
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ASGNI4
line 3803
;3803:			VectorSet(activategoal->goal.mins, -8, -8, -8);
ADDRFP4 8
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 28
ADDP4
CNSTF4 3238002688
ASGNF4
line 3804
;3804:			VectorSet(activategoal->goal.maxs, 8, 8, 8);
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1090519040
ASGNF4
line 3806
;3805:			//
;3806:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2232
JUMPV
LABELV $2277
line 3808
;3807:		}
;3808:		else {
line 3811
;3809:			//create a goal from where the button is visible and shoot at the button from there
;3810:			//add bounding box size to the dist
;3811:			trap_AAS_PresenceTypeBoundingBox(PRESENCE_CROUCH, bboxmins, bboxmaxs);
CNSTI4 4
ARGI4
ADDRLP4 136
ARGP4
ADDRLP4 148
ARGP4
ADDRGP4 trap_AAS_PresenceTypeBoundingBox
CALLV
pop
line 3812
;3812:			for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2282
line 3813
;3813:				if (movedir[i] < 0) dist += fabs(movedir[i]) * fabs(bboxmaxs[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $2286
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 588
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 148
ADDP4
INDIRF4
ARGF4
ADDRLP4 592
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 28
INDIRF4
ADDRLP4 588
INDIRF4
ADDRLP4 592
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 $2287
JUMPV
LABELV $2286
line 3814
;3814:				else dist += fabs(movedir[i]) * fabs(bboxmins[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 596
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 136
ADDP4
INDIRF4
ARGF4
ADDRLP4 600
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 28
INDIRF4
ADDRLP4 596
INDIRF4
ADDRLP4 600
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $2287
line 3815
;3815:			}
LABELV $2283
line 3812
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $2282
line 3817
;3816:			//calculate the goal origin
;3817:			VectorMA(origin, -dist, movedir, goalorigin);
ADDRLP4 588
ADDRLP4 28
INDIRF4
NEGF4
ASGNF4
ADDRLP4 124
ADDRLP4 16
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 588
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+4
ADDRLP4 16+4
INDIRF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 588
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+8
ADDRLP4 16+8
INDIRF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 28
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
line 3819
;3818:			//
;3819:			VectorCopy(goalorigin, start);
ADDRLP4 292
ADDRLP4 124
INDIRB
ASGNB 12
line 3820
;3820:			start[2] += 24;
ADDRLP4 292+8
ADDRLP4 292+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 3821
;3821:			VectorCopy(start, end);
ADDRLP4 332
ADDRLP4 292
INDIRB
ASGNB 12
line 3822
;3822:			end[2] -= 512;
ADDRLP4 332+8
ADDRLP4 332+8
INDIRF4
CNSTF4 1140850688
SUBF4
ASGNF4
line 3823
;3823:			numareas = trap_AAS_TraceAreas(start, end, areas, points, 10);
ADDRLP4 292
ARGP4
ADDRLP4 332
ARGP4
ADDRLP4 32
ARGP4
ADDRLP4 440
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 592
ADDRGP4 trap_AAS_TraceAreas
CALLI4
ASGNI4
ADDRLP4 108
ADDRLP4 592
INDIRI4
ASGNI4
line 3825
;3824:			//
;3825:			for (i = numareas-1; i >= 0; i--) {
ADDRLP4 0
ADDRLP4 108
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $2299
JUMPV
LABELV $2296
line 3826
;3826:				if (trap_AAS_AreaReachability(areas[i])) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
ADDP4
INDIRI4
ARGI4
ADDRLP4 596
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 596
INDIRI4
CNSTI4 0
EQI4 $2300
line 3827
;3827:					break;
ADDRGP4 $2298
JUMPV
LABELV $2300
line 3829
;3828:				}
;3829:			}
LABELV $2297
line 3825
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $2299
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $2296
LABELV $2298
line 3830
;3830:			if (i < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $2302
line 3832
;3831:				// FIXME: trace forward and maybe in other directions to find a valid area
;3832:			}
LABELV $2302
line 3833
;3833:			if (i >= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $2304
line 3835
;3834:				//
;3835:				VectorCopy(points[i], activategoal->goal.origin);
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 440
ADDP4
INDIRB
ASGNB 12
line 3836
;3836:				activategoal->goal.areanum = areas[i];
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
ADDP4
INDIRI4
ASGNI4
line 3837
;3837:				VectorSet(activategoal->goal.mins, 8, 8, 8);
ADDRFP4 8
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 28
ADDP4
CNSTF4 1090519040
ASGNF4
line 3838
;3838:				VectorSet(activategoal->goal.maxs, -8, -8, -8);
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 3238002688
ASGNF4
line 3840
;3839:				//
;3840:				for (i = 0; i < 3; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2306
line 3841
;3841:				{
line 3842
;3842:					if (movedir[i] < 0) activategoal->goal.maxs[i] += fabs(movedir[i]) * fabs(extramaxs[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $2310
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 600
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 316
ADDP4
INDIRF4
ARGF4
ADDRLP4 604
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 608
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
ADDP4
ASGNP4
ADDRLP4 608
INDIRP4
ADDRLP4 608
INDIRP4
INDIRF4
ADDRLP4 600
INDIRF4
ADDRLP4 604
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 $2311
JUMPV
LABELV $2310
line 3843
;3843:					else activategoal->goal.mins[i] += fabs(movedir[i]) * fabs(extramins[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 616
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 304
ADDP4
INDIRF4
ARGF4
ADDRLP4 620
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 624
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
CNSTI4 20
ADDP4
ADDP4
ASGNP4
ADDRLP4 624
INDIRP4
ADDRLP4 624
INDIRP4
INDIRF4
ADDRLP4 616
INDIRF4
ADDRLP4 620
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $2311
line 3844
;3844:				} //end for
LABELV $2307
line 3840
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $2306
line 3846
;3845:				//
;3846:				activategoal->goal.entitynum = entitynum;
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 344
INDIRI4
ASGNI4
line 3847
;3847:				activategoal->goal.number = 0;
ADDRFP4 8
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 3848
;3848:				activategoal->goal.flags = 0;
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 3849
;3849:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2232
JUMPV
LABELV $2304
line 3851
;3850:			}
;3851:		}
line 3852
;3852:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2232
JUMPV
LABELV $2269
line 3854
;3853:	}
;3854:	else {
line 3856
;3855:		//add bounding box size to the dist
;3856:		trap_AAS_PresenceTypeBoundingBox(PRESENCE_CROUCH, bboxmins, bboxmaxs);
CNSTI4 4
ARGI4
ADDRLP4 136
ARGP4
ADDRLP4 148
ARGP4
ADDRGP4 trap_AAS_PresenceTypeBoundingBox
CALLV
pop
line 3857
;3857:		for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2312
line 3858
;3858:			if (movedir[i] < 0) dist += fabs(movedir[i]) * fabs(bboxmaxs[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $2316
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 580
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 148
ADDP4
INDIRF4
ARGF4
ADDRLP4 584
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 28
INDIRF4
ADDRLP4 580
INDIRF4
ADDRLP4 584
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 $2317
JUMPV
LABELV $2316
line 3859
;3859:			else dist += fabs(movedir[i]) * fabs(bboxmins[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 588
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 136
ADDP4
INDIRF4
ARGF4
ADDRLP4 592
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 28
INDIRF4
ADDRLP4 588
INDIRF4
ADDRLP4 592
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $2317
line 3860
;3860:		}
LABELV $2313
line 3857
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $2312
line 3862
;3861:		//calculate the goal origin
;3862:		VectorMA(origin, -dist, movedir, goalorigin);
ADDRLP4 580
ADDRLP4 28
INDIRF4
NEGF4
ASGNF4
ADDRLP4 124
ADDRLP4 16
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 580
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+4
ADDRLP4 16+4
INDIRF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 580
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+8
ADDRLP4 16+8
INDIRF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 28
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
line 3864
;3863:		//
;3864:		VectorCopy(goalorigin, start);
ADDRLP4 292
ADDRLP4 124
INDIRB
ASGNB 12
line 3865
;3865:		start[2] += 24;
ADDRLP4 292+8
ADDRLP4 292+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 3866
;3866:		VectorCopy(start, end);
ADDRLP4 332
ADDRLP4 292
INDIRB
ASGNB 12
line 3867
;3867:		end[2] -= 100;
ADDRLP4 332+8
ADDRLP4 332+8
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 3868
;3868:		numareas = trap_AAS_TraceAreas(start, end, areas, NULL, 10);
ADDRLP4 292
ARGP4
ADDRLP4 332
ARGP4
ADDRLP4 32
ARGP4
CNSTP4 0
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 584
ADDRGP4 trap_AAS_TraceAreas
CALLI4
ASGNI4
ADDRLP4 108
ADDRLP4 584
INDIRI4
ASGNI4
line 3870
;3869:		//
;3870:		for (i = 0; i < numareas; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2329
JUMPV
LABELV $2326
line 3871
;3871:			if (trap_AAS_AreaReachability(areas[i])) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
ADDP4
INDIRI4
ARGI4
ADDRLP4 588
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 588
INDIRI4
CNSTI4 0
EQI4 $2330
line 3872
;3872:				break;
ADDRGP4 $2328
JUMPV
LABELV $2330
line 3874
;3873:			}
;3874:		}
LABELV $2327
line 3870
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2329
ADDRLP4 0
INDIRI4
ADDRLP4 108
INDIRI4
LTI4 $2326
LABELV $2328
line 3875
;3875:		if (i < numareas) {
ADDRLP4 0
INDIRI4
ADDRLP4 108
INDIRI4
GEI4 $2332
line 3877
;3876:			//
;3877:			VectorCopy(origin, activategoal->goal.origin);
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 16
INDIRB
ASGNB 12
line 3878
;3878:			activategoal->goal.areanum = areas[i];
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
ADDP4
INDIRI4
ASGNI4
line 3879
;3879:			VectorSubtract(mins, origin, activategoal->goal.mins);
ADDRFP4 8
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 72
INDIRF4
ADDRLP4 16
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 72+4
INDIRF4
ADDRLP4 16+4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 72+8
INDIRF4
ADDRLP4 16+8
INDIRF4
SUBF4
ASGNF4
line 3880
;3880:			VectorSubtract(maxs, origin, activategoal->goal.maxs);
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 84
INDIRF4
ADDRLP4 16
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 84+4
INDIRF4
ADDRLP4 16+4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 84+8
INDIRF4
ADDRLP4 16+8
INDIRF4
SUBF4
ASGNF4
line 3882
;3881:			//
;3882:			for (i = 0; i < 3; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2342
line 3883
;3883:			{
line 3884
;3884:				if (movedir[i] < 0) activategoal->goal.maxs[i] += fabs(movedir[i]) * fabs(extramaxs[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $2346
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 592
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 316
ADDP4
INDIRF4
ARGF4
ADDRLP4 596
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 600
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
ADDP4
ASGNP4
ADDRLP4 600
INDIRP4
ADDRLP4 600
INDIRP4
INDIRF4
ADDRLP4 592
INDIRF4
ADDRLP4 596
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 $2347
JUMPV
LABELV $2346
line 3885
;3885:				else activategoal->goal.mins[i] += fabs(movedir[i]) * fabs(extramins[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 608
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 304
ADDP4
INDIRF4
ARGF4
ADDRLP4 612
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 616
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
CNSTI4 20
ADDP4
ADDP4
ASGNP4
ADDRLP4 616
INDIRP4
ADDRLP4 616
INDIRP4
INDIRF4
ADDRLP4 608
INDIRF4
ADDRLP4 612
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $2347
line 3886
;3886:			} //end for
LABELV $2343
line 3882
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $2342
line 3888
;3887:			//
;3888:			activategoal->goal.entitynum = entitynum;
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 344
INDIRI4
ASGNI4
line 3889
;3889:			activategoal->goal.number = 0;
ADDRFP4 8
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 3890
;3890:			activategoal->goal.flags = 0;
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 3891
;3891:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2232
JUMPV
LABELV $2332
line 3893
;3892:		}
;3893:	}
line 3894
;3894:	return qfalse;
CNSTI4 0
RETI4
LABELV $2232
endproc BotFuncButtonActivateGoal 628 28
export BotFuncDoorActivateGoal
proc BotFuncDoorActivateGoal 1076 20
line 3902
;3895:}
;3896:
;3897:/*
;3898:==================
;3899:BotFuncDoorGoal
;3900:==================
;3901:*/
;3902:int BotFuncDoorActivateGoal(bot_state_t *bs, int bspent, bot_activategoal_t *activategoal) {
line 3909
;3903:	int modelindex, entitynum;
;3904:	char model[MAX_INFO_STRING];
;3905:	vec3_t mins, maxs, origin;
;3906:	//vec3_t angles;
;3907:
;3908:	//shoot at the shootable door
;3909:	trap_AAS_ValueForBSPEpairKey(bspent, "model", model, sizeof(model));
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $526
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 3910
;3910:	if (!*model)
ADDRLP4 12
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $2349
line 3911
;3911:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2348
JUMPV
LABELV $2349
line 3912
;3912:	modelindex = atoi(model+1);
ADDRLP4 12+1
ARGP4
ADDRLP4 1068
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1060
ADDRLP4 1068
INDIRI4
ASGNI4
line 3913
;3913:	if (!modelindex)
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $2352
line 3914
;3914:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2348
JUMPV
LABELV $2352
line 3916
;3915:	//VectorClear(angles);
;3916:	entitynum = BotModelMinsMaxs(modelindex, ET_MOVER, 0, mins, maxs);
ADDRLP4 1060
INDIRI4
ARGI4
CNSTI4 4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 1036
ARGP4
ADDRLP4 1048
ARGP4
ADDRLP4 1072
ADDRGP4 BotModelMinsMaxs
CALLI4
ASGNI4
ADDRLP4 1064
ADDRLP4 1072
INDIRI4
ASGNI4
line 3918
;3917:	//door origin
;3918:	VectorAdd(mins, maxs, origin);
ADDRLP4 0
ADDRLP4 1036
INDIRF4
ADDRLP4 1048
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 1036+4
INDIRF4
ADDRLP4 1048+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 1036+8
INDIRF4
ADDRLP4 1048+8
INDIRF4
ADDF4
ASGNF4
line 3919
;3919:	VectorScale(origin, 0.5, origin);
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 3920
;3920:	VectorCopy(origin, activategoal->target);
ADDRFP4 8
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 3921
;3921:	activategoal->shoot = qtrue;
ADDRFP4 8
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 1
ASGNI4
line 3923
;3922:	//
;3923:	activategoal->goal.entitynum = entitynum; //NOTE: this is the entity number of the shootable door
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 1064
INDIRI4
ASGNI4
line 3924
;3924:	activategoal->goal.number = 0;
ADDRFP4 8
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 3925
;3925:	activategoal->goal.flags = 0;
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 3926
;3926:	VectorCopy(bs->origin, activategoal->goal.origin);
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 3927
;3927:	activategoal->goal.areanum = bs->areanum;
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ASGNI4
line 3928
;3928:	VectorSet(activategoal->goal.mins, -8, -8, -8);
ADDRFP4 8
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 28
ADDP4
CNSTF4 3238002688
ASGNF4
line 3929
;3929:	VectorSet(activategoal->goal.maxs, 8, 8, 8);
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1090519040
ASGNF4
line 3930
;3930:	return qtrue;
CNSTI4 1
RETI4
LABELV $2348
endproc BotFuncDoorActivateGoal 1076 20
export BotTriggerMultipleActivateGoal
proc BotTriggerMultipleActivateGoal 272 20
line 3938
;3931:}
;3932:
;3933:/*
;3934:==================
;3935:BotTriggerMultipleGoal
;3936:==================
;3937:*/
;3938:int BotTriggerMultipleActivateGoal(bot_state_t *bs, int bspent, bot_activategoal_t *activategoal) {
line 3945
;3939:	int i, areas[10], numareas, modelindex, entitynum;
;3940:	char model[128];
;3941:	vec3_t start, end, mins, maxs;
;3942:	//vec3_t angles;
;3943:	vec3_t origin, goalorigin;
;3944:
;3945:	activategoal->shoot = qfalse;
ADDRFP4 8
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 0
ASGNI4
line 3946
;3946:	VectorClear(activategoal->target);
ADDRFP4 8
INDIRP4
CNSTI4 80
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 84
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 88
ADDP4
CNSTF4 0
ASGNF4
line 3948
;3947:	//create a bot goal towards the trigger
;3948:	trap_AAS_ValueForBSPEpairKey(bspent, "model", model, sizeof(model));
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $526
ARGP4
ADDRLP4 84
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 3949
;3949:	if (!*model)
ADDRLP4 84
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $2365
line 3950
;3950:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2364
JUMPV
LABELV $2365
line 3951
;3951:	modelindex = atoi(model+1);
ADDRLP4 84+1
ARGP4
ADDRLP4 256
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 224
ADDRLP4 256
INDIRI4
ASGNI4
line 3952
;3952:	if (!modelindex)
ADDRLP4 224
INDIRI4
CNSTI4 0
NEI4 $2368
line 3953
;3953:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2364
JUMPV
LABELV $2368
line 3955
;3954:	//VectorClear(angles);
;3955:	entitynum = BotModelMinsMaxs(modelindex, 0, CONTENTS_TRIGGER, mins, maxs);
ADDRLP4 224
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1073741824
ARGI4
ADDRLP4 60
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 260
ADDRGP4 BotModelMinsMaxs
CALLI4
ASGNI4
ADDRLP4 252
ADDRLP4 260
INDIRI4
ASGNI4
line 3957
;3956:	//trigger origin
;3957:	VectorAdd(mins, maxs, origin);
ADDRLP4 4
ADDRLP4 60
INDIRF4
ADDRLP4 72
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 60+4
INDIRF4
ADDRLP4 72+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 60+8
INDIRF4
ADDRLP4 72+8
INDIRF4
ADDF4
ASGNF4
line 3958
;3958:	VectorScale(origin, 0.5, origin);
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 3959
;3959:	VectorCopy(origin, goalorigin);
ADDRLP4 240
ADDRLP4 4
INDIRB
ASGNB 12
line 3961
;3960:	//
;3961:	VectorCopy(goalorigin, start);
ADDRLP4 212
ADDRLP4 240
INDIRB
ASGNB 12
line 3962
;3962:	start[2] += 24;
ADDRLP4 212+8
ADDRLP4 212+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 3963
;3963:	VectorCopy(start, end);
ADDRLP4 228
ADDRLP4 212
INDIRB
ASGNB 12
line 3964
;3964:	end[2] -= 100;
ADDRLP4 228+8
ADDRLP4 228+8
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 3965
;3965:	numareas = trap_AAS_TraceAreas(start, end, areas, NULL, 10);
ADDRLP4 212
ARGP4
ADDRLP4 228
ARGP4
ADDRLP4 20
ARGP4
CNSTP4 0
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 264
ADDRGP4 trap_AAS_TraceAreas
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 264
INDIRI4
ASGNI4
line 3967
;3966:	//
;3967:	for (i = 0; i < numareas; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2385
JUMPV
LABELV $2382
line 3968
;3968:		if (trap_AAS_AreaReachability(areas[i])) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
ADDP4
INDIRI4
ARGI4
ADDRLP4 268
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
EQI4 $2386
line 3969
;3969:			break;
ADDRGP4 $2384
JUMPV
LABELV $2386
line 3971
;3970:		}
;3971:	}
LABELV $2383
line 3967
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2385
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $2382
LABELV $2384
line 3972
;3972:	if (i < numareas) {
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
GEI4 $2388
line 3973
;3973:		VectorCopy(origin, activategoal->goal.origin);
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 3974
;3974:		activategoal->goal.areanum = areas[i];
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
ADDP4
INDIRI4
ASGNI4
line 3975
;3975:		VectorSubtract(mins, origin, activategoal->goal.mins);
ADDRFP4 8
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 60
INDIRF4
ADDRLP4 4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 60+4
INDIRF4
ADDRLP4 4+4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 60+8
INDIRF4
ADDRLP4 4+8
INDIRF4
SUBF4
ASGNF4
line 3976
;3976:		VectorSubtract(maxs, origin, activategoal->goal.maxs);
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 72
INDIRF4
ADDRLP4 4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 72+4
INDIRF4
ADDRLP4 4+4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 72+8
INDIRF4
ADDRLP4 4+8
INDIRF4
SUBF4
ASGNF4
line 3978
;3977:		//
;3978:		activategoal->goal.entitynum = entitynum;
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 252
INDIRI4
ASGNI4
line 3979
;3979:		activategoal->goal.number = 0;
ADDRFP4 8
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 3980
;3980:		activategoal->goal.flags = 0;
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 3981
;3981:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2364
JUMPV
LABELV $2388
line 3983
;3982:	}
;3983:	return qfalse;
CNSTI4 0
RETI4
LABELV $2364
endproc BotTriggerMultipleActivateGoal 272 20
export BotPopFromActivateGoalStack
proc BotPopFromActivateGoalStack 4 8
line 3991
;3984:}
;3985:
;3986:/*
;3987:==================
;3988:BotPopFromActivateGoalStack
;3989:==================
;3990:*/
;3991:int BotPopFromActivateGoalStack(bot_state_t *bs) {
line 3992
;3992:	if (!bs->activatestack)
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2399
line 3993
;3993:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2398
JUMPV
LABELV $2399
line 3994
;3994:	BotEnableActivateGoalAreas(bs->activatestack, qtrue);
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 3995
;3995:	bs->activatestack->inuse = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 0
ASGNI4
line 3996
;3996:	bs->activatestack->justused_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 68
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 3997
;3997:	bs->activatestack = bs->activatestack->next;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 7120
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 240
ADDP4
INDIRP4
ASGNP4
line 3998
;3998:	return qtrue;
CNSTI4 1
RETI4
LABELV $2398
endproc BotPopFromActivateGoalStack 4 8
export BotPushOntoActivateGoalStack
proc BotPushOntoActivateGoalStack 20 12
line 4006
;3999:}
;4000:
;4001:/*
;4002:==================
;4003:BotPushOntoActivateGoalStack
;4004:==================
;4005:*/
;4006:int BotPushOntoActivateGoalStack(bot_state_t *bs, bot_activategoal_t *activategoal) {
line 4010
;4007:	int i, best;
;4008:	float besttime;
;4009:
;4010:	best = -1;
ADDRLP4 8
CNSTI4 -1
ASGNI4
line 4011
;4011:	besttime = FloatTime() + 9999;
ADDRLP4 4
ADDRGP4 floattime
INDIRF4
CNSTF4 1176255488
ADDF4
ASGNF4
line 4013
;4012:	//
;4013:	for (i = 0; i < MAX_ACTIVATESTACK; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2402
line 4014
;4014:		if (!bs->activategoalheap[i].inuse) {
ADDRLP4 0
INDIRI4
CNSTI4 244
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 7124
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2406
line 4015
;4015:			if (bs->activategoalheap[i].justused_time < besttime) {
ADDRLP4 0
INDIRI4
CNSTI4 244
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 7124
ADDP4
ADDP4
CNSTI4 68
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
GEF4 $2408
line 4016
;4016:				besttime = bs->activategoalheap[i].justused_time;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 244
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 7124
ADDP4
ADDP4
CNSTI4 68
ADDP4
INDIRF4
ASGNF4
line 4017
;4017:				best = i;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
line 4018
;4018:			}
LABELV $2408
line 4019
;4019:		}
LABELV $2406
line 4020
;4020:	}
LABELV $2403
line 4013
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $2402
line 4021
;4021:	if (best != -1) {
ADDRLP4 8
INDIRI4
CNSTI4 -1
EQI4 $2410
line 4022
;4022:		memcpy(&bs->activategoalheap[best], activategoal, sizeof(bot_activategoal_t));
ADDRLP4 8
INDIRI4
CNSTI4 244
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 7124
ADDP4
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 244
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 4023
;4023:		bs->activategoalheap[best].inuse = qtrue;
ADDRLP4 8
INDIRI4
CNSTI4 244
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 7124
ADDP4
ADDP4
CNSTI4 1
ASGNI4
line 4024
;4024:		bs->activategoalheap[best].next = bs->activatestack;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRI4
CNSTI4 244
MULI4
ADDRLP4 12
INDIRP4
CNSTI4 7124
ADDP4
ADDP4
CNSTI4 240
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
ASGNP4
line 4025
;4025:		bs->activatestack = &bs->activategoalheap[best];
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 7120
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 244
MULI4
ADDRLP4 16
INDIRP4
CNSTI4 7124
ADDP4
ADDP4
ASGNP4
line 4026
;4026:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2401
JUMPV
LABELV $2410
line 4028
;4027:	}
;4028:	return qfalse;
CNSTI4 0
RETI4
LABELV $2401
endproc BotPushOntoActivateGoalStack 20 12
export BotClearActivateGoalStack
proc BotClearActivateGoalStack 0 4
line 4036
;4029:}
;4030:
;4031:/*
;4032:==================
;4033:BotClearActivateGoalStack
;4034:==================
;4035:*/
;4036:void BotClearActivateGoalStack(bot_state_t *bs) {
ADDRGP4 $2414
JUMPV
LABELV $2413
line 4038
;4037:	while(bs->activatestack)
;4038:		BotPopFromActivateGoalStack(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotPopFromActivateGoalStack
CALLI4
pop
LABELV $2414
line 4037
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2413
line 4039
;4039:}
LABELV $2412
endproc BotClearActivateGoalStack 0 4
export BotEnableActivateGoalAreas
proc BotEnableActivateGoalAreas 12 8
line 4046
;4040:
;4041:/*
;4042:==================
;4043:BotEnableActivateGoalAreas
;4044:==================
;4045:*/
;4046:void BotEnableActivateGoalAreas(bot_activategoal_t *activategoal, int enable) {
line 4049
;4047:	int i;
;4048:
;4049:	if (activategoal->areasdisabled == !enable)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $2420
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $2421
JUMPV
LABELV $2420
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $2421
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $2417
line 4050
;4050:		return;
ADDRGP4 $2416
JUMPV
LABELV $2417
line 4051
;4051:	for (i = 0; i < activategoal->numareas; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2425
JUMPV
LABELV $2422
line 4052
;4052:		trap_AAS_EnableRoutingArea( activategoal->areas[i], enable );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 trap_AAS_EnableRoutingArea
CALLI4
pop
LABELV $2423
line 4051
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2425
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
LTI4 $2422
line 4053
;4053:	activategoal->areasdisabled = !enable;
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $2427
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $2428
JUMPV
LABELV $2427
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $2428
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 4054
;4054:}
LABELV $2416
endproc BotEnableActivateGoalAreas 12 8
export BotIsGoingToActivateEntity
proc BotIsGoingToActivateEntity 8 0
line 4061
;4055:
;4056:/*
;4057:==================
;4058:BotIsGoingToActivateEntity
;4059:==================
;4060:*/
;4061:int BotIsGoingToActivateEntity(bot_state_t *bs, int entitynum) {
line 4065
;4062:	bot_activategoal_t *a;
;4063:	int i;
;4064:
;4065:	for (a = bs->activatestack; a; a = a->next) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $2433
JUMPV
LABELV $2430
line 4066
;4066:		if (a->time < FloatTime())
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $2434
line 4067
;4067:			continue;
ADDRGP4 $2431
JUMPV
LABELV $2434
line 4068
;4068:		if (a->goal.entitynum == entitynum)
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $2436
line 4069
;4069:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2429
JUMPV
LABELV $2436
line 4070
;4070:	}
LABELV $2431
line 4065
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRP4
ASGNP4
LABELV $2433
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2430
line 4071
;4071:	for (i = 0; i < MAX_ACTIVATESTACK; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $2438
line 4072
;4072:		if (bs->activategoalheap[i].inuse)
ADDRLP4 4
INDIRI4
CNSTI4 244
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 7124
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2442
line 4073
;4073:			continue;
ADDRGP4 $2439
JUMPV
LABELV $2442
line 4075
;4074:		//
;4075:		if (bs->activategoalheap[i].goal.entitynum == entitynum) {
ADDRLP4 4
INDIRI4
CNSTI4 244
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 7124
ADDP4
ADDP4
CNSTI4 44
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $2444
line 4077
;4076:			// if the bot went for this goal less than 2 seconds ago
;4077:			if (bs->activategoalheap[i].justused_time > FloatTime() - 2)
ADDRLP4 4
INDIRI4
CNSTI4 244
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 7124
ADDP4
ADDP4
CNSTI4 68
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
SUBF4
LEF4 $2446
line 4078
;4078:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2429
JUMPV
LABELV $2446
line 4079
;4079:		}
LABELV $2444
line 4080
;4080:	}
LABELV $2439
line 4071
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 8
LTI4 $2438
line 4081
;4081:	return qfalse;
CNSTI4 0
RETI4
LABELV $2429
endproc BotIsGoingToActivateEntity 8 0
export BotGetActivateGoal
proc BotGetActivateGoal 3304 20
line 4094
;4082:}
;4083:
;4084:/*
;4085:==================
;4086:BotGetActivateGoal
;4087:
;4088:  returns the number of the bsp entity to activate
;4089:  goal->entitynum will be set to the game entity to activate
;4090:==================
;4091:*/
;4092://#define OBSTACLEDEBUG
;4093:
;4094:int BotGetActivateGoal(bot_state_t *bs, int entitynum, bot_activategoal_t *activategoal) {
line 4105
;4095:	int i, ent, cur_entities[10], spawnflags, modelindex, areas[MAX_ACTIVATEAREAS*2], numareas, t;
;4096:	char model[MAX_INFO_STRING], tmpmodel[128];
;4097:	char target[128], classname[128];
;4098:	float health;
;4099:	char targetname[10][128];
;4100:	aas_entityinfo_t entinfo;
;4101:	aas_areainfo_t areainfo;
;4102:	vec3_t origin, absmins, absmaxs;
;4103:	//vec3_t angles;
;4104:
;4105:	memset(activategoal, 0, sizeof(bot_activategoal_t));
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 244
ARGI4
ADDRGP4 memset
CALLP4
pop
line 4106
;4106:	BotEntityInfo(entitynum, &entinfo);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 3052
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 4107
;4107:	Com_sprintf(model, sizeof( model ), "*%d", entinfo.modelindex);
ADDRLP4 1712
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2449
ARGP4
ADDRLP4 3052+104
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 4108
;4108:	for (ent = trap_AAS_NextBSPEntity(0); ent; ent = trap_AAS_NextBSPEntity(ent)) {
CNSTI4 0
ARGI4
ADDRLP4 3240
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 3240
INDIRI4
ASGNI4
ADDRGP4 $2454
JUMPV
LABELV $2451
line 4109
;4109:		if (!trap_AAS_ValueForBSPEpairKey(ent, "model", tmpmodel, sizeof(tmpmodel))) continue;
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $526
ARGP4
ADDRLP4 1584
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 3244
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3244
INDIRI4
CNSTI4 0
NEI4 $2455
ADDRGP4 $2452
JUMPV
LABELV $2455
line 4110
;4110:		if (!strcmp(model, tmpmodel)) break;
ADDRLP4 1712
ARGP4
ADDRLP4 1584
ARGP4
ADDRLP4 3248
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3248
INDIRI4
CNSTI4 0
NEI4 $2457
ADDRGP4 $2453
JUMPV
LABELV $2457
line 4111
;4111:	}
LABELV $2452
line 4108
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 3244
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 3244
INDIRI4
ASGNI4
LABELV $2454
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2451
LABELV $2453
line 4112
;4112:	if (!ent) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2459
line 4113
;4113:		BotAI_Print(PRT_ERROR, "BotGetActivateGoal: no entity found with model %s\n", model);
CNSTI4 3
ARGI4
ADDRGP4 $2461
ARGP4
ADDRLP4 1712
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4114
;4114:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2448
JUMPV
LABELV $2459
line 4116
;4115:	}
;4116:	trap_AAS_ValueForBSPEpairKey(ent, "classname", classname, sizeof(classname));
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $2462
ARGP4
ADDRLP4 1456
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 4117
;4117:	if (!*classname) {
ADDRLP4 1456
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $2463
line 4118
;4118:		BotAI_Print(PRT_ERROR, "BotGetActivateGoal: entity with model %s has no classname\n", model);
CNSTI4 3
ARGI4
ADDRGP4 $2465
ARGP4
ADDRLP4 1712
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4119
;4119:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2448
JUMPV
LABELV $2463
line 4122
;4120:	}
;4121:	//if it is a door
;4122:	if (!strcmp(classname, "func_door")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $2468
ARGP4
ADDRLP4 3248
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3248
INDIRI4
CNSTI4 0
NEI4 $2466
line 4123
;4123:		if (trap_AAS_FloatForBSPEpairKey(ent, "health", &health)) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $2268
ARGP4
ADDRLP4 3208
ARGP4
ADDRLP4 3252
ADDRGP4 trap_AAS_FloatForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3252
INDIRI4
CNSTI4 0
EQI4 $2469
line 4125
;4124:			//if the door has health then the door must be shot to open
;4125:			if (health) {
ADDRLP4 3208
INDIRF4
CNSTF4 0
EQF4 $2471
line 4126
;4126:				BotFuncDoorActivateGoal(bs, ent, activategoal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 BotFuncDoorActivateGoal
CALLI4
pop
line 4127
;4127:				return ent;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $2448
JUMPV
LABELV $2471
line 4129
;4128:			}
;4129:		}
LABELV $2469
line 4131
;4130:		//
;4131:		trap_AAS_IntForBSPEpairKey(ent, "spawnflags", &spawnflags);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $2473
ARGP4
ADDRLP4 3204
ARGP4
ADDRGP4 trap_AAS_IntForBSPEpairKey
CALLI4
pop
line 4133
;4132:		// if the door starts open then just wait for the door to return
;4133:		if ( spawnflags & 1 )
ADDRLP4 3204
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $2474
line 4134
;4134:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $2448
JUMPV
LABELV $2474
line 4136
;4135:		//get the door origin
;4136:		if (!trap_AAS_VectorForBSPEpairKey(ent, "origin", origin)) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $2478
ARGP4
ADDRLP4 3192
ARGP4
ADDRLP4 3256
ADDRGP4 trap_AAS_VectorForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3256
INDIRI4
CNSTI4 0
NEI4 $2476
line 4137
;4137:			VectorClear(origin);
ADDRLP4 3192
CNSTF4 0
ASGNF4
ADDRLP4 3192+4
CNSTF4 0
ASGNF4
ADDRLP4 3192+8
CNSTF4 0
ASGNF4
line 4138
;4138:		}
LABELV $2476
line 4140
;4139:		//if the door is open or opening already
;4140:		if (!VectorCompare(origin, entinfo.origin))
ADDRLP4 3192
ARGP4
ADDRLP4 3052+24
ARGP4
ADDRLP4 3260
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 3260
INDIRI4
CNSTI4 0
NEI4 $2481
line 4141
;4141:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $2448
JUMPV
LABELV $2481
line 4143
;4142:		// store all the areas the door is in
;4143:		trap_AAS_ValueForBSPEpairKey(ent, "model", model, sizeof(model));
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $526
ARGP4
ADDRLP4 1712
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 4144
;4144:		if (*model) {
ADDRLP4 1712
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $2484
line 4145
;4145:			modelindex = atoi(model+1);
ADDRLP4 1712+1
ARGP4
ADDRLP4 3264
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 3212
ADDRLP4 3264
INDIRI4
ASGNI4
line 4146
;4146:			if (modelindex) {
ADDRLP4 3212
INDIRI4
CNSTI4 0
EQI4 $2487
line 4148
;4147:				//VectorClear(angles);
;4148:				BotModelMinsMaxs(modelindex, ET_MOVER, 0, absmins, absmaxs);
ADDRLP4 3212
INDIRI4
ARGI4
CNSTI4 4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 3216
ARGP4
ADDRLP4 3228
ARGP4
ADDRGP4 BotModelMinsMaxs
CALLI4
pop
line 4150
;4149:				//
;4150:				numareas = trap_AAS_BBoxAreas(absmins, absmaxs, areas, MAX_ACTIVATEAREAS*2);
ADDRLP4 3216
ARGP4
ADDRLP4 3228
ARGP4
ADDRLP4 2740
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 3268
ADDRGP4 trap_AAS_BBoxAreas
CALLI4
ASGNI4
ADDRLP4 3048
ADDRLP4 3268
INDIRI4
ASGNI4
line 4152
;4151:				// store the areas with reachabilities first
;4152:				for (i = 0; i < numareas; i++) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $2492
JUMPV
LABELV $2489
line 4153
;4153:					if (activategoal->numareas >= MAX_ACTIVATEAREAS)
ADDRFP4 8
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 32
LTI4 $2493
line 4154
;4154:						break;
ADDRGP4 $2491
JUMPV
LABELV $2493
line 4155
;4155:					if ( !trap_AAS_AreaReachability(areas[i]) ) {
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 2740
ADDP4
INDIRI4
ARGI4
ADDRLP4 3272
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 3272
INDIRI4
CNSTI4 0
NEI4 $2495
line 4156
;4156:						continue;
ADDRGP4 $2490
JUMPV
LABELV $2495
line 4158
;4157:					}
;4158:					trap_AAS_AreaInfo(areas[i], &areainfo);
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 2740
ADDP4
INDIRI4
ARGI4
ADDRLP4 2996
ARGP4
ADDRGP4 trap_AAS_AreaInfo
CALLI4
pop
line 4159
;4159:					if (areainfo.contents & AREACONTENTS_MOVER) {
ADDRLP4 2996
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $2497
line 4160
;4160:						activategoal->areas[activategoal->numareas++] = areas[i];
ADDRLP4 3280
ADDRFP4 8
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 3276
ADDRLP4 3280
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 3280
INDIRP4
ADDRLP4 3276
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 3276
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
CNSTI4 104
ADDP4
ADDP4
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 2740
ADDP4
INDIRI4
ASGNI4
line 4161
;4161:					}
LABELV $2497
line 4162
;4162:				}
LABELV $2490
line 4152
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2492
ADDRLP4 132
INDIRI4
ADDRLP4 3048
INDIRI4
LTI4 $2489
LABELV $2491
line 4164
;4163:				// store any remaining areas
;4164:				for (i = 0; i < numareas; i++) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $2502
JUMPV
LABELV $2499
line 4165
;4165:					if (activategoal->numareas >= MAX_ACTIVATEAREAS)
ADDRFP4 8
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 32
LTI4 $2503
line 4166
;4166:						break;
ADDRGP4 $2501
JUMPV
LABELV $2503
line 4167
;4167:					if ( trap_AAS_AreaReachability(areas[i]) ) {
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 2740
ADDP4
INDIRI4
ARGI4
ADDRLP4 3272
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 3272
INDIRI4
CNSTI4 0
EQI4 $2505
line 4168
;4168:						continue;
ADDRGP4 $2500
JUMPV
LABELV $2505
line 4170
;4169:					}
;4170:					trap_AAS_AreaInfo(areas[i], &areainfo);
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 2740
ADDP4
INDIRI4
ARGI4
ADDRLP4 2996
ARGP4
ADDRGP4 trap_AAS_AreaInfo
CALLI4
pop
line 4171
;4171:					if (areainfo.contents & AREACONTENTS_MOVER) {
ADDRLP4 2996
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $2507
line 4172
;4172:						activategoal->areas[activategoal->numareas++] = areas[i];
ADDRLP4 3280
ADDRFP4 8
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 3276
ADDRLP4 3280
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 3280
INDIRP4
ADDRLP4 3276
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 3276
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
CNSTI4 104
ADDP4
ADDP4
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 2740
ADDP4
INDIRI4
ASGNI4
line 4173
;4173:					}
LABELV $2507
line 4174
;4174:				}
LABELV $2500
line 4164
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2502
ADDRLP4 132
INDIRI4
ADDRLP4 3048
INDIRI4
LTI4 $2499
LABELV $2501
line 4175
;4175:			}
LABELV $2487
line 4176
;4176:		}
LABELV $2484
line 4177
;4177:	}
LABELV $2466
line 4179
;4178:	// if the bot is blocked by or standing on top of a button
;4179:	if (!strcmp(classname, "func_button")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $2511
ARGP4
ADDRLP4 3252
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3252
INDIRI4
CNSTI4 0
NEI4 $2509
line 4180
;4180:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2448
JUMPV
LABELV $2509
line 4183
;4181:	}
;4182:	// get the targetname so we can find an entity with a matching target
;4183:	if (!trap_AAS_ValueForBSPEpairKey(ent, "targetname", targetname[0], sizeof(targetname[0]))) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $2514
ARGP4
ADDRLP4 136
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 3256
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3256
INDIRI4
CNSTI4 0
NEI4 $2512
line 4184
;4184:		if (bot_developer.integer) {
ADDRGP4 bot_developer+12
INDIRI4
CNSTI4 0
EQI4 $2515
line 4185
;4185:			BotAI_Print(PRT_ERROR, "BotGetActivateGoal: entity with model \"%s\" has no targetname\n", model);
CNSTI4 3
ARGI4
ADDRGP4 $2518
ARGP4
ADDRLP4 1712
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4186
;4186:		}
LABELV $2515
line 4187
;4187:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2448
JUMPV
LABELV $2512
line 4190
;4188:	}
;4189:	// allow tree-like activation
;4190:	cur_entities[0] = trap_AAS_NextBSPEntity(0);
CNSTI4 0
ARGI4
ADDRLP4 3260
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 1416
ADDRLP4 3260
INDIRI4
ASGNI4
line 4191
;4191:	for (i = 0; i >= 0 && i < 10;) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $2522
JUMPV
LABELV $2519
line 4192
;4192:		for (ent = cur_entities[i]; ent; ent = trap_AAS_NextBSPEntity(ent)) {
ADDRLP4 0
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1416
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $2526
JUMPV
LABELV $2523
line 4193
;4193:			if (!trap_AAS_ValueForBSPEpairKey(ent, "target", target, sizeof(target))) continue;
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $2529
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 3264
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3264
INDIRI4
CNSTI4 0
NEI4 $2527
ADDRGP4 $2524
JUMPV
LABELV $2527
line 4194
;4194:			if (!strcmp(targetname[i], target)) {
ADDRLP4 132
INDIRI4
CNSTI4 7
LSHI4
ADDRLP4 136
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 3268
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3268
INDIRI4
CNSTI4 0
NEI4 $2530
line 4195
;4195:				cur_entities[i] = trap_AAS_NextBSPEntity(ent);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 3272
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1416
ADDP4
ADDRLP4 3272
INDIRI4
ASGNI4
line 4196
;4196:				break;
ADDRGP4 $2525
JUMPV
LABELV $2530
line 4198
;4197:			}
;4198:		}
LABELV $2524
line 4192
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 3264
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 3264
INDIRI4
ASGNI4
LABELV $2526
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2523
LABELV $2525
line 4199
;4199:		if (!ent) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2532
line 4200
;4200:			if (bot_developer.integer) {
ADDRGP4 bot_developer+12
INDIRI4
CNSTI4 0
EQI4 $2534
line 4201
;4201:				BotAI_Print(PRT_ERROR, "BotGetActivateGoal: no entity with target \"%s\"\n", targetname[i]);
CNSTI4 3
ARGI4
ADDRGP4 $2537
ARGP4
ADDRLP4 132
INDIRI4
CNSTI4 7
LSHI4
ADDRLP4 136
ADDP4
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4202
;4202:			}
LABELV $2534
line 4203
;4203:			i--;
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 4204
;4204:			continue;
ADDRGP4 $2520
JUMPV
LABELV $2532
line 4206
;4205:		}
;4206:		if (!trap_AAS_ValueForBSPEpairKey(ent, "classname", classname, sizeof(classname))) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $2462
ARGP4
ADDRLP4 1456
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 3268
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3268
INDIRI4
CNSTI4 0
NEI4 $2538
line 4207
;4207:			if (bot_developer.integer) {
ADDRGP4 bot_developer+12
INDIRI4
CNSTI4 0
EQI4 $2520
line 4208
;4208:				BotAI_Print(PRT_ERROR, "BotGetActivateGoal: entity with target \"%s\" has no classname\n", targetname[i]);
CNSTI4 3
ARGI4
ADDRGP4 $2543
ARGP4
ADDRLP4 132
INDIRI4
CNSTI4 7
LSHI4
ADDRLP4 136
ADDP4
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4209
;4209:			}
line 4210
;4210:			continue;
ADDRGP4 $2520
JUMPV
LABELV $2538
line 4213
;4211:		}
;4212:		// BSP button model
;4213:		if (!strcmp(classname, "func_button")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $2511
ARGP4
ADDRLP4 3272
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3272
INDIRI4
CNSTI4 0
NEI4 $2544
line 4215
;4214:			//
;4215:			if (!BotFuncButtonActivateGoal(bs, ent, activategoal))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 3276
ADDRGP4 BotFuncButtonActivateGoal
CALLI4
ASGNI4
ADDRLP4 3276
INDIRI4
CNSTI4 0
NEI4 $2546
line 4216
;4216:				continue;
ADDRGP4 $2520
JUMPV
LABELV $2546
line 4218
;4217:			// if the bot tries to activate this button already
;4218:			if ( bs->activatestack && bs->activatestack->inuse &&
ADDRLP4 3280
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 3280
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2548
ADDRLP4 3280
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $2548
ADDRLP4 3280
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
NEI4 $2548
ADDRLP4 3284
ADDRGP4 floattime
INDIRF4
ASGNF4
ADDRLP4 3280
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
ADDRLP4 3284
INDIRF4
LEF4 $2548
ADDRLP4 3280
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ADDRLP4 3284
INDIRF4
CNSTF4 1073741824
SUBF4
GEF4 $2548
line 4222
;4219:				 bs->activatestack->goal.entitynum == activategoal->goal.entitynum &&
;4220:				 bs->activatestack->time > FloatTime() &&
;4221:				 bs->activatestack->start_time < FloatTime() - 2)
;4222:				continue;
ADDRGP4 $2520
JUMPV
LABELV $2548
line 4224
;4223:			// if the bot is in a reachability area
;4224:			if ( trap_AAS_AreaReachability(bs->areanum) ) {
ADDRFP4 0
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 3288
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 3288
INDIRI4
CNSTI4 0
EQI4 $2550
line 4226
;4225:				// disable all areas the blocking entity is in
;4226:				BotEnableActivateGoalAreas( activategoal, qfalse );
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4228
;4227:				//
;4228:				t = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, activategoal->goal.areanum, bs->tfl);
ADDRLP4 3292
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 3292
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 3292
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 3292
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
ADDRLP4 3296
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 2736
ADDRLP4 3296
INDIRI4
ASGNI4
line 4230
;4229:				// if the button is not reachable
;4230:				if (!t) {
ADDRLP4 2736
INDIRI4
CNSTI4 0
NEI4 $2552
line 4231
;4231:					continue;
ADDRGP4 $2520
JUMPV
LABELV $2552
line 4233
;4232:				}
;4233:				activategoal->time = FloatTime() + t * 0.01 + 5;
ADDRFP4 8
INDIRP4
CNSTI4 60
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 2736
INDIRI4
CVIF4 4
CNSTF4 1008981770
MULF4
ADDF4
CNSTF4 1084227584
ADDF4
ASGNF4
line 4234
;4234:			}
LABELV $2550
line 4235
;4235:			return ent;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $2448
JUMPV
LABELV $2544
line 4238
;4236:		}
;4237:		// invisible trigger multiple box
;4238:		else if (!strcmp(classname, "trigger_multiple")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $2556
ARGP4
ADDRLP4 3276
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3276
INDIRI4
CNSTI4 0
NEI4 $2554
line 4240
;4239:			//
;4240:			if (!BotTriggerMultipleActivateGoal(bs, ent, activategoal))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 3280
ADDRGP4 BotTriggerMultipleActivateGoal
CALLI4
ASGNI4
ADDRLP4 3280
INDIRI4
CNSTI4 0
NEI4 $2557
line 4241
;4241:				continue;
ADDRGP4 $2520
JUMPV
LABELV $2557
line 4243
;4242:			// if the bot tries to activate this trigger already
;4243:			if ( bs->activatestack && bs->activatestack->inuse &&
ADDRLP4 3284
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 3284
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2559
ADDRLP4 3284
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $2559
ADDRLP4 3284
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
NEI4 $2559
ADDRLP4 3288
ADDRGP4 floattime
INDIRF4
ASGNF4
ADDRLP4 3284
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
ADDRLP4 3288
INDIRF4
LEF4 $2559
ADDRLP4 3284
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ADDRLP4 3288
INDIRF4
CNSTF4 1073741824
SUBF4
GEF4 $2559
line 4247
;4244:				 bs->activatestack->goal.entitynum == activategoal->goal.entitynum &&
;4245:				 bs->activatestack->time > FloatTime() &&
;4246:				 bs->activatestack->start_time < FloatTime() - 2)
;4247:				continue;
ADDRGP4 $2520
JUMPV
LABELV $2559
line 4249
;4248:			// if the bot is in a reachability area
;4249:			if ( trap_AAS_AreaReachability(bs->areanum) ) {
ADDRFP4 0
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 3292
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 3292
INDIRI4
CNSTI4 0
EQI4 $2561
line 4251
;4250:				// disable all areas the blocking entity is in
;4251:				BotEnableActivateGoalAreas( activategoal, qfalse );
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4253
;4252:				//
;4253:				t = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, activategoal->goal.areanum, bs->tfl);
ADDRLP4 3296
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 3296
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 3296
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 3296
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
ADDRLP4 3300
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 2736
ADDRLP4 3300
INDIRI4
ASGNI4
line 4255
;4254:				// if the trigger is not reachable
;4255:				if (!t) {
ADDRLP4 2736
INDIRI4
CNSTI4 0
NEI4 $2563
line 4256
;4256:					continue;
ADDRGP4 $2520
JUMPV
LABELV $2563
line 4258
;4257:				}
;4258:				activategoal->time = FloatTime() + t * 0.01 + 5;
ADDRFP4 8
INDIRP4
CNSTI4 60
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 2736
INDIRI4
CVIF4 4
CNSTF4 1008981770
MULF4
ADDF4
CNSTF4 1084227584
ADDF4
ASGNF4
line 4259
;4259:			}
LABELV $2561
line 4260
;4260:			return ent;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $2448
JUMPV
LABELV $2554
line 4262
;4261:		}
;4262:		else if (!strcmp(classname, "func_timer")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $2567
ARGP4
ADDRLP4 3280
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3280
INDIRI4
CNSTI4 0
NEI4 $2565
line 4264
;4263:			// just skip the func_timer
;4264:			continue;
ADDRGP4 $2520
JUMPV
LABELV $2565
line 4267
;4265:		}
;4266:		// the actual button or trigger might be linked through a target_relay or target_delay
;4267:		else if (!strcmp(classname, "target_relay") || !strcmp(classname, "target_delay")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $2570
ARGP4
ADDRLP4 3284
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3284
INDIRI4
CNSTI4 0
EQI4 $2572
ADDRLP4 1456
ARGP4
ADDRGP4 $2571
ARGP4
ADDRLP4 3288
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3288
INDIRI4
CNSTI4 0
NEI4 $2568
LABELV $2572
line 4268
;4268:			if (trap_AAS_ValueForBSPEpairKey(ent, "targetname", targetname[i+1], sizeof(targetname[0]))) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $2514
ARGP4
ADDRLP4 132
INDIRI4
CNSTI4 7
LSHI4
ADDRLP4 136+128
ADDP4
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 3292
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3292
INDIRI4
CNSTI4 0
EQI4 $2573
line 4269
;4269:				i++;
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4270
;4270:				cur_entities[i] = trap_AAS_NextBSPEntity(0);
CNSTI4 0
ARGI4
ADDRLP4 3296
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1416
ADDP4
ADDRLP4 3296
INDIRI4
ASGNI4
line 4271
;4271:			}
LABELV $2573
line 4272
;4272:		}
LABELV $2568
line 4273
;4273:	}
LABELV $2520
line 4191
LABELV $2522
ADDRLP4 132
INDIRI4
CNSTI4 0
LTI4 $2576
ADDRLP4 132
INDIRI4
CNSTI4 10
LTI4 $2519
LABELV $2576
line 4277
;4274:#ifdef OBSTACLEDEBUG
;4275:	BotAI_Print(PRT_ERROR, "BotGetActivateGoal: no valid activator for entity with target \"%s\"\n", targetname[0]);
;4276:#endif
;4277:	return 0;
CNSTI4 0
RETI4
LABELV $2448
endproc BotGetActivateGoal 3304 20
export BotGoForActivateGoal
proc BotGoForActivateGoal 144 8
line 4285
;4278:}
;4279:
;4280:/*
;4281:==================
;4282:BotGoForActivateGoal
;4283:==================
;4284:*/
;4285:int BotGoForActivateGoal(bot_state_t *bs, bot_activategoal_t *activategoal) {
line 4288
;4286:	aas_entityinfo_t activateinfo;
;4287:
;4288:	activategoal->inuse = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 1
ASGNI4
line 4289
;4289:	if (!activategoal->time)
ADDRFP4 4
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
CNSTF4 0
NEF4 $2578
line 4290
;4290:		activategoal->time = FloatTime() + 10;
ADDRFP4 4
INDIRP4
CNSTI4 60
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1092616192
ADDF4
ASGNF4
LABELV $2578
line 4291
;4291:	activategoal->start_time = FloatTime();
ADDRFP4 4
INDIRP4
CNSTI4 64
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4292
;4292:	BotEntityInfo(activategoal->goal.entitynum, &activateinfo);
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 4293
;4293:	VectorCopy(activateinfo.origin, activategoal->origin);
ADDRFP4 4
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0+24
INDIRB
ASGNB 12
line 4295
;4294:	//
;4295:	if (BotPushOntoActivateGoalStack(bs, activategoal)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotPushOntoActivateGoalStack
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $2581
line 4297
;4296:		// enter the activate entity AI node
;4297:		AIEnter_Seek_ActivateEntity(bs, "BotGoForActivateGoal");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2583
ARGP4
ADDRGP4 AIEnter_Seek_ActivateEntity
CALLV
pop
line 4298
;4298:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2577
JUMPV
LABELV $2581
line 4300
;4299:	}
;4300:	else {
line 4302
;4301:		// enable any routing areas that were disabled
;4302:		BotEnableActivateGoalAreas(activategoal, qtrue);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4303
;4303:		return qfalse;
CNSTI4 0
RETI4
LABELV $2577
endproc BotGoForActivateGoal 144 8
export BotPrintActivateGoalInfo
proc BotPrintActivateGoalInfo 296 36
line 4312
;4304:	}
;4305:}
;4306:
;4307:/*
;4308:==================
;4309:BotPrintActivateGoalInfo
;4310:==================
;4311:*/
;4312:void BotPrintActivateGoalInfo(bot_state_t *bs, bot_activategoal_t *activategoal, int bspent) {
line 4317
;4313:	char netname[MAX_NETNAME];
;4314:	char classname[128];
;4315:	char buf[128];
;4316:
;4317:	ClientName(bs->client, netname, sizeof(netname));
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
line 4318
;4318:	trap_AAS_ValueForBSPEpairKey(bspent, "classname", classname, sizeof(classname));
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $2462
ARGP4
ADDRLP4 36
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 4319
;4319:	if (activategoal->shoot) {
ADDRFP4 4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2585
line 4320
;4320:		Com_sprintf(buf, sizeof(buf), "%s: I have to shoot at a %s from %1.1f %1.1f %1.1f in area %d\n",
ADDRLP4 164
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $2587
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 292
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 292
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 292
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 292
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 292
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 4326
;4321:						netname, classname,
;4322:						activategoal->goal.origin[0],
;4323:						activategoal->goal.origin[1],
;4324:						activategoal->goal.origin[2],
;4325:						activategoal->goal.areanum);
;4326:	}
ADDRGP4 $2586
JUMPV
LABELV $2585
line 4327
;4327:	else {
line 4328
;4328:		Com_sprintf(buf, sizeof(buf), "%s: I have to activate a %s at %1.1f %1.1f %1.1f in area %d\n",
ADDRLP4 164
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $2588
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 292
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 292
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 292
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 292
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 292
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 4334
;4329:						netname, classname,
;4330:						activategoal->goal.origin[0],
;4331:						activategoal->goal.origin[1],
;4332:						activategoal->goal.origin[2],
;4333:						activategoal->goal.areanum);
;4334:	}
LABELV $2586
line 4335
;4335:	trap_EA_Say(bs->client, buf);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 164
ARGP4
ADDRGP4 trap_EA_Say
CALLV
pop
line 4336
;4336:}
LABELV $2584
endproc BotPrintActivateGoalInfo 296 36
export BotRandomMove
proc BotRandomMove 28 16
line 4343
;4337:
;4338:/*
;4339:==================
;4340:BotRandomMove
;4341:==================
;4342:*/
;4343:void BotRandomMove(bot_state_t *bs, bot_moveresult_t *moveresult) {
line 4346
;4344:	vec3_t dir, angles;
;4345:
;4346:	angles[0] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 4347
;4347:	angles[1] = random() * 360;
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0+4
ADDRLP4 24
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1010041192
MULF4
ASGNF4
line 4348
;4348:	angles[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 4349
;4349:	AngleVectors(angles, dir, NULL, NULL);
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 4351
;4350:
;4351:	trap_BotMoveInDirection(bs->ms, dir, 400, MOVE_WALK);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTF4 1137180672
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotMoveInDirection
CALLI4
pop
line 4353
;4352:
;4353:	moveresult->failure = qfalse;
ADDRFP4 4
INDIRP4
CNSTI4 0
ASGNI4
line 4354
;4354:	VectorCopy(dir, moveresult->movedir);
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 12
INDIRB
ASGNB 12
line 4355
;4355:}
LABELV $2589
endproc BotRandomMove 28 16
data
align 4
LABELV $2593
byte 4 0
byte 4 0
byte 4 1065353216
export BotAIBlocked
code
proc BotAIBlocked 468 16
line 4368
;4356:
;4357:/*
;4358:==================
;4359:BotAIBlocked
;4360:
;4361:Very basic handling of bots being blocked by other entities.
;4362:Check what kind of entity is blocking the bot and try to activate
;4363:it. If that's not an option then try to walk around or over the entity.
;4364:Before the bot ends in this part of the AI it should predict which doors to
;4365:open, which buttons to activate etc.
;4366:==================
;4367:*/
;4368:void BotAIBlocked(bot_state_t *bs, bot_moveresult_t *moveresult, int activate) {
line 4370
;4369:	int movetype, bspent;
;4370:	vec3_t hordir, start, /*end, mins, maxs,*/ sideward, angles, up = {0, 0, 1};
ADDRLP4 192
ADDRGP4 $2593
INDIRB
ASGNB 12
line 4375
;4371:	aas_entityinfo_t entinfo;
;4372:	bot_activategoal_t activategoal;
;4373:
;4374:	// if the bot is not blocked by anything
;4375:	if (!moveresult->blocked) {
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2594
line 4376
;4376:		bs->notblocked_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6204
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4377
;4377:		return;
ADDRGP4 $2592
JUMPV
LABELV $2594
line 4380
;4378:	}
;4379:	// if stuck in a solid area
;4380:	if ( moveresult->type == RESULTTYPE_INSOLIDAREA ) {
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 8
NEI4 $2596
line 4382
;4381:		// move in a random direction in the hope to get out
;4382:		BotRandomMove(bs, moveresult);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRandomMove
CALLV
pop
line 4384
;4383:		//
;4384:		return;
ADDRGP4 $2592
JUMPV
LABELV $2596
line 4387
;4385:	}
;4386:	// get info for the entity that is blocking the bot
;4387:	BotEntityInfo(moveresult->blockentity, &entinfo);
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 4393
;4388:#ifdef OBSTACLEDEBUG
;4389:	ClientName(bs->client, netname, sizeof(netname));
;4390:	BotAI_Print(PRT_MESSAGE, "%s: I'm blocked by model %d\n", netname, entinfo.modelindex);
;4391:#endif
;4392:	// if blocked by a bsp model and the bot wants to activate it
;4393:	if (activate && entinfo.modelindex > 0 && entinfo.modelindex <= max_bspmodelindex) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $2598
ADDRLP4 24+104
INDIRI4
CNSTI4 0
LEI4 $2598
ADDRLP4 24+104
INDIRI4
ADDRGP4 max_bspmodelindex
INDIRI4
GTI4 $2598
line 4395
;4394:		// find the bsp entity which should be activated in order to get the blocking entity out of the way
;4395:		bspent = BotGetActivateGoal(bs, entinfo.number, &activategoal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24+20
INDIRI4
ARGI4
ADDRLP4 204
ARGP4
ADDRLP4 452
ADDRGP4 BotGetActivateGoal
CALLI4
ASGNI4
ADDRLP4 448
ADDRLP4 452
INDIRI4
ASGNI4
line 4396
;4396:		if (bspent) {
ADDRLP4 448
INDIRI4
CNSTI4 0
EQI4 $2603
line 4398
;4397:			//
;4398:			if (bs->activatestack && !bs->activatestack->inuse)
ADDRLP4 456
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 456
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2605
ADDRLP4 456
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $2605
line 4399
;4399:				bs->activatestack = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
CNSTP4 0
ASGNP4
LABELV $2605
line 4401
;4400:			// if not already trying to activate this entity
;4401:			if (!BotIsGoingToActivateEntity(bs, activategoal.goal.entitynum)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 204+4+40
INDIRI4
ARGI4
ADDRLP4 460
ADDRGP4 BotIsGoingToActivateEntity
CALLI4
ASGNI4
ADDRLP4 460
INDIRI4
CNSTI4 0
NEI4 $2607
line 4403
;4402:				//
;4403:				BotGoForActivateGoal(bs, &activategoal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 204
ARGP4
ADDRGP4 BotGoForActivateGoal
CALLI4
pop
line 4404
;4404:			}
LABELV $2607
line 4408
;4405:			// if ontop of an obstacle or
;4406:			// if the bot is not in a reachability area it'll still
;4407:			// need some dynamic obstacle avoidance, otherwise return
;4408:			if (!(moveresult->flags & MOVERESULT_ONTOPOFOBSTACLE) &&
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $2604
ADDRFP4 0
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 464
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 464
INDIRI4
CNSTI4 0
EQI4 $2604
line 4410
;4409:				trap_AAS_AreaReachability(bs->areanum))
;4410:				return;
ADDRGP4 $2592
JUMPV
line 4411
;4411:		}
LABELV $2603
line 4412
;4412:		else {
line 4414
;4413:			// enable any routing areas that were disabled
;4414:			BotEnableActivateGoalAreas(&activategoal, qtrue);
ADDRLP4 204
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4415
;4415:		}
LABELV $2604
line 4416
;4416:	}
LABELV $2598
line 4418
;4417:	// just some basic dynamic obstacle avoidance code
;4418:	hordir[0] = moveresult->movedir[0];
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ASGNF4
line 4419
;4419:	hordir[1] = moveresult->movedir[1];
ADDRLP4 0+4
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ASGNF4
line 4420
;4420:	hordir[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 4422
;4421:	// if no direction just take a random direction
;4422:	if (VectorNormalize(hordir) < 0.1) {
ADDRLP4 0
ARGP4
ADDRLP4 452
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 452
INDIRF4
CNSTF4 1036831949
GEF4 $2615
line 4423
;4423:		VectorSet(angles, 0, 360 * random(), 0);
ADDRLP4 180
CNSTF4 0
ASGNF4
ADDRLP4 456
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 180+4
ADDRLP4 456
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1135869952
MULF4
ASGNF4
ADDRLP4 180+8
CNSTF4 0
ASGNF4
line 4424
;4424:		AngleVectors(angles, hordir, NULL, NULL);
ADDRLP4 180
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
line 4425
;4425:	}
LABELV $2615
line 4429
;4426:	//
;4427:	//if (moveresult->flags & MOVERESULT_ONTOPOFOBSTACLE) movetype = MOVE_JUMP;
;4428:	//else
;4429:	movetype = MOVE_WALK;
ADDRLP4 164
CNSTI4 1
ASGNI4
line 4432
;4430:	// if there's an obstacle at the bot's feet and head then
;4431:	// the bot might be able to crouch through
;4432:	VectorCopy(bs->origin, start);
ADDRLP4 168
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 4433
;4433:	start[2] += 18;
ADDRLP4 168+8
ADDRLP4 168+8
INDIRF4
CNSTF4 1099956224
ADDF4
ASGNF4
line 4441
;4434:	//VectorMA(start, 5, hordir, end);
;4435:	//VectorSet(mins, -16, -16, -24);
;4436:	//VectorSet(maxs, 16, 16, 4);
;4437:	//
;4438:	//bsptrace = AAS_Trace(start, mins, maxs, end, bs->entitynum, MASK_PLAYERSOLID);
;4439:	//if (bsptrace.fraction >= 1) movetype = MOVE_CROUCH;
;4440:	// get the sideward vector
;4441:	CrossProduct(hordir, up, sideward);
ADDRLP4 0
ARGP4
ADDRLP4 192
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 4443
;4442:	//
;4443:	if (bs->flags & BFL_AVOIDRIGHT) VectorNegate(sideward, sideward);
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $2620
ADDRLP4 12
ADDRLP4 12
INDIRF4
NEGF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
NEGF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
NEGF4
ASGNF4
LABELV $2620
line 4445
;4444:	// try to crouch straight forward?
;4445:	if (!trap_BotMoveInDirection(bs->ms, hordir, 400, movetype)) {
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTF4 1137180672
ARGF4
ADDRLP4 164
INDIRI4
ARGI4
ADDRLP4 456
ADDRGP4 trap_BotMoveInDirection
CALLI4
ASGNI4
ADDRLP4 456
INDIRI4
CNSTI4 0
NEI4 $2626
line 4447
;4446:		// perform the movement
;4447:		if (!trap_BotMoveInDirection(bs->ms, sideward, 400, movetype)) {
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTF4 1137180672
ARGF4
ADDRLP4 164
INDIRI4
ARGI4
ADDRLP4 460
ADDRGP4 trap_BotMoveInDirection
CALLI4
ASGNI4
ADDRLP4 460
INDIRI4
CNSTI4 0
NEI4 $2628
line 4449
;4448:			// flip the avoid direction flag
;4449:			bs->flags ^= BFL_AVOIDRIGHT;
ADDRLP4 464
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
ASGNP4
ADDRLP4 464
INDIRP4
ADDRLP4 464
INDIRP4
INDIRI4
CNSTI4 16
BXORI4
ASGNI4
line 4452
;4450:			// flip the direction
;4451:			// VectorNegate(sideward, sideward);
;4452:			VectorMA(sideward, -1, hordir, sideward);
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 0
INDIRF4
CNSTF4 3212836864
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 0+4
INDIRF4
CNSTF4 3212836864
MULF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
ADDRLP4 0+8
INDIRF4
CNSTF4 3212836864
MULF4
ADDF4
ASGNF4
line 4454
;4453:			// move in the other direction
;4454:			trap_BotMoveInDirection(bs->ms, sideward, 400, movetype);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTF4 1137180672
ARGF4
ADDRLP4 164
INDIRI4
ARGI4
ADDRGP4 trap_BotMoveInDirection
CALLI4
pop
line 4455
;4455:		}
LABELV $2628
line 4456
;4456:	}
LABELV $2626
line 4458
;4457:	//
;4458:	if (bs->notblocked_time < FloatTime() - 0.4) {
ADDRFP4 0
INDIRP4
CNSTI4 6204
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1053609165
SUBF4
GEF4 $2636
line 4461
;4459:		// just reset goals and hope the bot will go into another direction?
;4460:		// is this still needed??
;4461:		if (bs->ainode == AINode_Seek_NBG) bs->nbg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 AINode_Seek_NBG
CVPU4 4
NEU4 $2638
ADDRFP4 0
INDIRP4
CNSTI4 6072
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 $2639
JUMPV
LABELV $2638
line 4462
;4462:		else if (bs->ainode == AINode_Seek_LTG) bs->ltg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 AINode_Seek_LTG
CVPU4 4
NEU4 $2640
ADDRFP4 0
INDIRP4
CNSTI4 6068
ADDP4
CNSTF4 0
ASGNF4
LABELV $2640
LABELV $2639
line 4463
;4463:	}
LABELV $2636
line 4464
;4464:}
LABELV $2592
endproc BotAIBlocked 468 16
export BotAIPredictObstacles
proc BotAIPredictObstacles 316 44
line 4476
;4465:
;4466:/*
;4467:==================
;4468:BotAIPredictObstacles
;4469:
;4470:Predict the route towards the goal and check if the bot
;4471:will be blocked by certain obstacles. When the bot has obstacles
;4472:on it's path the bot should figure out if they can be removed
;4473:by activating certain entities.
;4474:==================
;4475:*/
;4476:int BotAIPredictObstacles(bot_state_t *bs, bot_goal_t *goal) {
line 4481
;4477:	int modelnum, entitynum, bspent;
;4478:	bot_activategoal_t activategoal;
;4479:	aas_predictroute_t route;
;4480:
;4481:	if (!bot_predictobstacles.integer)
ADDRGP4 bot_predictobstacles+12
INDIRI4
CNSTI4 0
NEI4 $2643
line 4482
;4482:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2642
JUMPV
LABELV $2643
line 4485
;4483:
;4484:	// always predict when the goal change or at regular intervals
;4485:	if (bs->predictobstacles_goalareanum == goal->areanum &&
ADDRLP4 292
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 292
INDIRP4
CNSTI4 6216
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
NEI4 $2646
ADDRLP4 292
INDIRP4
CNSTI4 6212
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1086324736
SUBF4
LEF4 $2646
line 4486
;4486:		bs->predictobstacles_time > FloatTime() - 6) {
line 4487
;4487:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2642
JUMPV
LABELV $2646
line 4489
;4488:	}
;4489:	bs->predictobstacles_goalareanum = goal->areanum;
ADDRFP4 0
INDIRP4
CNSTI4 6216
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 4490
;4490:	bs->predictobstacles_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6212
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4493
;4491:
;4492:	// predict at most 100 areas or 10 seconds ahead
;4493:	trap_AAS_PredictRoute(&route, bs->areanum, bs->origin,
ADDRLP4 0
ARGP4
ADDRLP4 296
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 296
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 296
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 296
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
CNSTI4 100
ARGI4
CNSTI4 1000
ARGI4
CNSTI4 6
ARGI4
CNSTI4 1024
ARGI4
CNSTI4 67108864
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_AAS_PredictRoute
CALLI4
pop
line 4498
;4494:							goal->areanum, bs->tfl, 100, 1000,
;4495:							RSE_USETRAVELTYPE|RSE_ENTERCONTENTS,
;4496:							AREACONTENTS_MOVER, TFL_BRIDGE, 0);
;4497:	// if bot has to travel through an area with a mover
;4498:	if (route.stopevent & RSE_ENTERCONTENTS) {
ADDRLP4 0+16
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $2648
line 4500
;4499:		// if the bot will run into a mover
;4500:		if (route.endcontents & AREACONTENTS_MOVER) {
ADDRLP4 0+20
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $2649
line 4502
;4501:			//NOTE: this only works with bspc 2.1 or higher
;4502:			modelnum = (route.endcontents & AREACONTENTS_MODELNUM) >> AREACONTENTS_MODELNUMSHIFT;
ADDRLP4 36
ADDRLP4 0+20
INDIRI4
CNSTI4 255
CNSTI4 24
LSHI4
BANDI4
CNSTI4 24
RSHI4
ASGNI4
line 4503
;4503:			if (modelnum) {
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $2649
line 4505
;4504:				//
;4505:				entitynum = BotModelMinsMaxs(modelnum, ET_MOVER, 0, NULL, NULL);
ADDRLP4 36
INDIRI4
ARGI4
CNSTI4 4
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 300
ADDRGP4 BotModelMinsMaxs
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 300
INDIRI4
ASGNI4
line 4506
;4506:				if (entitynum) {
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $2649
line 4508
;4507:					//NOTE: BotGetActivateGoal already checks if the door is open or not
;4508:					bspent = BotGetActivateGoal(bs, entitynum, &activategoal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 48
ARGP4
ADDRLP4 304
ADDRGP4 BotGetActivateGoal
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 304
INDIRI4
ASGNI4
line 4509
;4509:					if (bspent) {
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $2649
line 4511
;4510:						//
;4511:						if (bs->activatestack && !bs->activatestack->inuse)
ADDRLP4 308
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 308
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2661
ADDRLP4 308
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $2661
line 4512
;4512:							bs->activatestack = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
CNSTP4 0
ASGNP4
LABELV $2661
line 4514
;4513:						// if not already trying to activate this entity
;4514:						if (!BotIsGoingToActivateEntity(bs, activategoal.goal.entitynum)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48+4+40
INDIRI4
ARGI4
ADDRLP4 312
ADDRGP4 BotIsGoingToActivateEntity
CALLI4
ASGNI4
ADDRLP4 312
INDIRI4
CNSTI4 0
NEI4 $2663
line 4518
;4515:							//
;4516:							//BotAI_Print(PRT_MESSAGE, "blocked by mover model %d, entity %d ?\n", modelnum, entitynum);
;4517:							//
;4518:							BotGoForActivateGoal(bs, &activategoal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48
ARGP4
ADDRGP4 BotGoForActivateGoal
CALLI4
pop
line 4519
;4519:							return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2642
JUMPV
LABELV $2663
line 4521
;4520:						}
;4521:						else {
line 4523
;4522:							// enable any routing areas that were disabled
;4523:							BotEnableActivateGoalAreas(&activategoal, qtrue);
ADDRLP4 48
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4524
;4524:						}
line 4525
;4525:					}
line 4526
;4526:				}
line 4527
;4527:			}
line 4528
;4528:		}
line 4529
;4529:	}
ADDRGP4 $2649
JUMPV
LABELV $2648
line 4530
;4530:	else if (route.stopevent & RSE_USETRAVELTYPE) {
ADDRLP4 0+16
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $2667
line 4531
;4531:		if (route.endtravelflags & TFL_BRIDGE) {
ADDRLP4 0+24
INDIRI4
CNSTI4 67108864
BANDI4
CNSTI4 0
EQI4 $2670
line 4533
;4532:			//FIXME: check if the bridge is available to travel over
;4533:		}
LABELV $2670
line 4534
;4534:	}
LABELV $2667
LABELV $2649
line 4535
;4535:	return qfalse;
CNSTI4 0
RETI4
LABELV $2642
endproc BotAIPredictObstacles 316 44
export BotCheckConsoleMessages
proc BotCheckConsoleMessages 1008 48
line 4543
;4536:}
;4537:
;4538:/*
;4539:==================
;4540:BotCheckConsoleMessages
;4541:==================
;4542:*/
;4543:void BotCheckConsoleMessages(bot_state_t *bs) {
line 4551
;4544:	char botname[MAX_NETNAME], message[MAX_MESSAGE_SIZE], netname[MAX_NETNAME], *ptr;
;4545:	float chat_reply;
;4546:	int context, handle;
;4547:	bot_consolemessage_t m;
;4548:	bot_match_t match;
;4549:
;4550:	//the name of this bot
;4551:	ClientName(bs->client, botname, sizeof(botname));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 908
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
ADDRGP4 $2675
JUMPV
LABELV $2674
line 4553
;4552:	//
;4553:	while((handle = trap_BotNextConsoleMessage(bs->cs, &m)) != 0) {
line 4555
;4554:		//if the chat state is flooded with messages the bot will read them quickly
;4555:		if (trap_BotNumConsoleMessages(bs->cs) < 10) {
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 948
ADDRGP4 trap_BotNumConsoleMessages
CALLI4
ASGNI4
ADDRLP4 948
INDIRI4
CNSTI4 10
GEI4 $2677
line 4557
;4556:			//if it is a chat message the bot needs some time to read it
;4557:			if (m.type == CMS_CHAT && m.time > FloatTime() - (1 + random())) break;
ADDRLP4 0+8
INDIRI4
CNSTI4 1
NEI4 $2679
ADDRLP4 952
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0+4
INDIRF4
ADDRGP4 floattime
INDIRF4
ADDRLP4 952
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1065353216
ADDF4
SUBF4
LEF4 $2679
ADDRGP4 $2676
JUMPV
LABELV $2679
line 4558
;4558:		}
LABELV $2677
line 4560
;4559:		//
;4560:		ptr = m.message;
ADDRLP4 276
ADDRLP4 0+12
ASGNP4
line 4563
;4561:		//if it is a chat message then don't unify white spaces and don't
;4562:		//replace synonyms in the netname
;4563:		if (m.type == CMS_CHAT) {
ADDRLP4 0+8
INDIRI4
CNSTI4 1
NEI4 $2684
line 4565
;4564:			//
;4565:			if (trap_BotFindMatch(m.message, &match, MTCONTEXT_REPLYCHAT)) {
ADDRLP4 0+12
ARGP4
ADDRLP4 288
ARGP4
CNSTU4 128
ARGU4
ADDRLP4 952
ADDRGP4 trap_BotFindMatch
CALLI4
ASGNI4
ADDRLP4 952
INDIRI4
CNSTI4 0
EQI4 $2687
line 4566
;4566:				ptr = m.message + match.variables[MESSAGE].offset;
ADDRLP4 276
ADDRLP4 288+264+16
INDIRI1
CVII4 1
ADDRLP4 0+12
ADDP4
ASGNP4
line 4567
;4567:			}
LABELV $2687
line 4568
;4568:		}
LABELV $2684
line 4570
;4569:		//unify the white spaces in the message
;4570:		trap_UnifyWhiteSpaces(ptr);
ADDRLP4 276
INDIRP4
ARGP4
ADDRGP4 trap_UnifyWhiteSpaces
CALLV
pop
line 4572
;4571:		//replace synonyms in the right context
;4572:		context = BotSynonymContext(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 952
ADDRGP4 BotSynonymContext
CALLI4
ASGNI4
ADDRLP4 284
ADDRLP4 952
INDIRI4
ASGNI4
line 4573
;4573:		trap_BotReplaceSynonyms(ptr, context);
ADDRLP4 276
INDIRP4
ARGP4
ADDRLP4 284
INDIRI4
CVIU4 4
ARGU4
ADDRGP4 trap_BotReplaceSynonyms
CALLV
pop
line 4575
;4574:		//if there's no match
;4575:		if (!BotMatchMessage(bs, m.message)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 956
ADDRGP4 BotMatchMessage
CALLI4
ASGNI4
ADDRLP4 956
INDIRI4
CNSTI4 0
NEI4 $2693
line 4577
;4576:			//if it is a chat message
;4577:			if (m.type == CMS_CHAT && !bot_nochat.integer) {
ADDRLP4 0+8
INDIRI4
CNSTI4 1
NEI4 $2696
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 0
NEI4 $2696
line 4579
;4578:				//
;4579:				if (!trap_BotFindMatch(m.message, &match, MTCONTEXT_REPLYCHAT)) {
ADDRLP4 0+12
ARGP4
ADDRLP4 288
ARGP4
CNSTU4 128
ARGU4
ADDRLP4 960
ADDRGP4 trap_BotFindMatch
CALLI4
ASGNI4
ADDRLP4 960
INDIRI4
CNSTI4 0
NEI4 $2700
line 4580
;4580:					trap_BotRemoveConsoleMessage(bs->cs, handle);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 280
INDIRI4
ARGI4
ADDRGP4 trap_BotRemoveConsoleMessage
CALLV
pop
line 4581
;4581:					continue;
ADDRGP4 $2675
JUMPV
LABELV $2700
line 4584
;4582:				}
;4583:				//don't use eliza chats with team messages
;4584:				if (match.subtype & ST_TEAM) {
ADDRLP4 288+260
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $2703
line 4585
;4585:					trap_BotRemoveConsoleMessage(bs->cs, handle);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 280
INDIRI4
ARGI4
ADDRGP4 trap_BotRemoveConsoleMessage
CALLV
pop
line 4586
;4586:					continue;
ADDRGP4 $2675
JUMPV
LABELV $2703
line 4589
;4587:				}
;4588:				//
;4589:				trap_BotMatchVariable(&match, NETNAME, netname, sizeof(netname));
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 872
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 4590
;4590:				trap_BotMatchVariable(&match, MESSAGE, message, sizeof(message));
ADDRLP4 288
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 616
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 4592
;4591:				//if this is a message from the bot self
;4592:				if (bs->client == ClientFromName(netname)) {
ADDRLP4 872
ARGP4
ADDRLP4 964
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 964
INDIRI4
NEI4 $2706
line 4593
;4593:					trap_BotRemoveConsoleMessage(bs->cs, handle);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 280
INDIRI4
ARGI4
ADDRGP4 trap_BotRemoveConsoleMessage
CALLV
pop
line 4594
;4594:					continue;
ADDRGP4 $2675
JUMPV
LABELV $2706
line 4597
;4595:				}
;4596:				//unify the message
;4597:				trap_UnifyWhiteSpaces(message);
ADDRLP4 616
ARGP4
ADDRGP4 trap_UnifyWhiteSpaces
CALLV
pop
line 4599
;4598:				//
;4599:				trap_Cvar_Update(&bot_testrchat);
ADDRGP4 bot_testrchat
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 4600
;4600:				if (bot_testrchat.integer) {
ADDRGP4 bot_testrchat+12
INDIRI4
CNSTI4 0
EQI4 $2708
line 4602
;4601:					//
;4602:					trap_BotLibVarSet("bot_testrchat", "1");
ADDRGP4 $2711
ARGP4
ADDRGP4 $2712
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 4604
;4603:					//if bot replies with a chat message
;4604:					if (trap_BotReplyChat(bs->cs, message, context, CONTEXT_REPLY,
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 616
ARGP4
ADDRLP4 284
INDIRI4
ARGI4
CNSTI4 16
ARGI4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 908
ARGP4
ADDRLP4 872
ARGP4
ADDRLP4 968
ADDRGP4 trap_BotReplyChat
CALLI4
ASGNI4
ADDRLP4 968
INDIRI4
CNSTI4 0
EQI4 $2713
line 4608
;4605:															NULL, NULL,
;4606:															NULL, NULL,
;4607:															NULL, NULL,
;4608:															botname, netname)) {
line 4609
;4609:						BotAI_Print(PRT_MESSAGE, "------------------------\n");
CNSTI4 1
ARGI4
ADDRGP4 $2715
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4610
;4610:					}
ADDRGP4 $2709
JUMPV
LABELV $2713
line 4611
;4611:					else {
line 4612
;4612:						BotAI_Print(PRT_MESSAGE, "**** no valid reply ****\n");
CNSTI4 1
ARGI4
ADDRGP4 $2716
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4613
;4613:					}
line 4614
;4614:				}
ADDRGP4 $2709
JUMPV
LABELV $2708
line 4616
;4615:				//if at a valid chat position and not chatting already and not in teamplay
;4616:				else if (bs->ainode != AINode_Stand && BotValidChatPosition(bs) && !TeamPlayIsOn()) {
ADDRLP4 968
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 968
INDIRP4
CNSTI4 4900
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 AINode_Stand
CVPU4 4
EQU4 $2717
ADDRLP4 968
INDIRP4
ARGP4
ADDRLP4 972
ADDRGP4 BotValidChatPosition
CALLI4
ASGNI4
ADDRLP4 972
INDIRI4
CNSTI4 0
EQI4 $2717
ADDRLP4 976
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 976
INDIRI4
CNSTI4 0
NEI4 $2717
line 4617
;4617:					chat_reply = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CHAT_REPLY, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 35
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 980
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 944
ADDRLP4 980
INDIRF4
ASGNF4
line 4618
;4618:					if (random() < 1.5 / (NumBots()+1) && random() < chat_reply) {
ADDRLP4 984
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 988
ADDRGP4 NumBots
CALLI4
ASGNI4
ADDRLP4 984
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1069547520
ADDRLP4 988
INDIRI4
CNSTI4 1
ADDI4
CVIF4 4
DIVF4
GEF4 $2719
ADDRLP4 992
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 992
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 944
INDIRF4
GEF4 $2719
line 4620
;4619:						//if bot replies with a chat message
;4620:						if (trap_BotReplyChat(bs->cs, message, context, CONTEXT_REPLY,
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 616
ARGP4
ADDRLP4 284
INDIRI4
ARGI4
CNSTI4 16
ARGI4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 908
ARGP4
ADDRLP4 872
ARGP4
ADDRLP4 996
ADDRGP4 trap_BotReplyChat
CALLI4
ASGNI4
ADDRLP4 996
INDIRI4
CNSTI4 0
EQI4 $2721
line 4624
;4621:																NULL, NULL,
;4622:																NULL, NULL,
;4623:																NULL, NULL,
;4624:																botname, netname)) {
line 4626
;4625:							//remove the console message
;4626:							trap_BotRemoveConsoleMessage(bs->cs, handle);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 280
INDIRI4
ARGI4
ADDRGP4 trap_BotRemoveConsoleMessage
CALLV
pop
line 4627
;4627:							bs->stand_time = FloatTime() + BotChatTime(bs);
ADDRLP4 1000
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1000
INDIRP4
ARGP4
ADDRLP4 1004
ADDRGP4 BotChatTime
CALLF4
ASGNF4
ADDRLP4 1000
INDIRP4
CNSTI4 6096
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 1004
INDIRF4
ADDF4
ASGNF4
line 4628
;4628:							AIEnter_Stand(bs, "BotCheckConsoleMessages: reply chat");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2723
ARGP4
ADDRGP4 AIEnter_Stand
CALLV
pop
line 4630
;4629:							//EA_Say(bs->client, bs->cs.chatmessage);
;4630:							break;
ADDRGP4 $2676
JUMPV
LABELV $2721
line 4632
;4631:						}
;4632:					}
LABELV $2719
line 4633
;4633:				}
LABELV $2717
LABELV $2709
line 4634
;4634:			}
LABELV $2696
line 4635
;4635:		}
LABELV $2693
line 4637
;4636:		//remove the console message
;4637:		trap_BotRemoveConsoleMessage(bs->cs, handle);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 280
INDIRI4
ARGI4
ADDRGP4 trap_BotRemoveConsoleMessage
CALLV
pop
line 4638
;4638:	}
LABELV $2675
line 4553
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 948
ADDRGP4 trap_BotNextConsoleMessage
CALLI4
ASGNI4
ADDRLP4 280
ADDRLP4 948
INDIRI4
ASGNI4
ADDRLP4 948
INDIRI4
CNSTI4 0
NEI4 $2674
LABELV $2676
line 4639
;4639:}
LABELV $2673
endproc BotCheckConsoleMessages 1008 48
export BotCheckForGrenades
proc BotCheckForGrenades 4 16
line 4646
;4640:
;4641:/*
;4642:==================
;4643:BotCheckEvents
;4644:==================
;4645:*/
;4646:void BotCheckForGrenades(bot_state_t *bs, entityState_t *state) {
line 4648
;4647:	// if this is not a grenade
;4648:	if (state->eType != ET_MISSILE || state->weapon != WP_GRENADE_LAUNCHER)
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $2727
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 4
EQI4 $2725
LABELV $2727
line 4649
;4649:		return;
ADDRGP4 $2724
JUMPV
LABELV $2725
line 4651
;4650:	// try to avoid the grenade
;4651:	trap_BotAddAvoidSpot(bs->ms, state->pos.trBase, 160, AVOID_ALWAYS);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTF4 1126170624
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotAddAvoidSpot
CALLV
pop
line 4652
;4652:}
LABELV $2724
endproc BotCheckForGrenades 4 16
export BotCheckForProxMines
proc BotCheckForProxMines 28 16
line 4660
;4653:
;4654:
;4655:/*
;4656:==================
;4657:BotCheckForProxMines
;4658:==================
;4659:*/
;4660:void BotCheckForProxMines(bot_state_t *bs, entityState_t *state) {
line 4662
;4661:	// if this is not a prox mine
;4662:	if (state->eType != ET_MISSILE || state->weapon != WP_PROX_LAUNCHER)
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $2731
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 12
EQI4 $2729
LABELV $2731
line 4663
;4663:		return;
ADDRGP4 $2728
JUMPV
LABELV $2729
line 4665
;4664:	// if this prox mine is from someone on our own team
;4665:	if (state->generic1 == BotTeam(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRFP4 4
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $2732
line 4666
;4666:		return;
ADDRGP4 $2728
JUMPV
LABELV $2732
line 4668
;4667:	// if the bot doesn't have a weapon to deactivate the mine
;4668:	if (!(bs->inventory[INVENTORY_PLASMAGUN] > 0 && bs->inventory[INVENTORY_CELLS] > 0) &&
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 4996
ADDP4
INDIRI4
CNSTI4 0
LEI4 $2736
ADDRLP4 8
INDIRP4
CNSTI4 5036
ADDP4
INDIRI4
CNSTI4 0
GTI4 $2734
LABELV $2736
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 4984
ADDP4
INDIRI4
CNSTI4 0
LEI4 $2737
ADDRLP4 12
INDIRP4
CNSTI4 5044
ADDP4
INDIRI4
CNSTI4 0
GTI4 $2734
LABELV $2737
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 5004
ADDP4
INDIRI4
CNSTI4 0
LEI4 $2738
ADDRLP4 16
INDIRP4
CNSTI4 5052
ADDP4
INDIRI4
CNSTI4 0
GTI4 $2734
LABELV $2738
line 4670
;4669:		!(bs->inventory[INVENTORY_ROCKETLAUNCHER] > 0 && bs->inventory[INVENTORY_ROCKETS] > 0) &&
;4670:		!(bs->inventory[INVENTORY_BFG10K] > 0 && bs->inventory[INVENTORY_BFGAMMO] > 0) ) {
line 4671
;4671:		return;
ADDRGP4 $2728
JUMPV
LABELV $2734
line 4674
;4672:	}
;4673:	// try to avoid the prox mine
;4674:	trap_BotAddAvoidSpot(bs->ms, state->pos.trBase, 160, AVOID_ALWAYS);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTF4 1126170624
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotAddAvoidSpot
CALLV
pop
line 4676
;4675:	//
;4676:	if (bs->numproxmines >= MAX_PROXMINES)
ADDRFP4 0
INDIRP4
CNSTI4 6516
ADDP4
INDIRI4
CNSTI4 64
LTI4 $2739
line 4677
;4677:		return;
ADDRGP4 $2728
JUMPV
LABELV $2739
line 4678
;4678:	bs->proxmines[bs->numproxmines] = state->number;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 6516
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
CNSTI4 6260
ADDP4
ADDP4
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
line 4679
;4679:	bs->numproxmines++;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 6516
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4680
;4680:}
LABELV $2728
endproc BotCheckForProxMines 28 16
export BotCheckForKamikazeBody
proc BotCheckForKamikazeBody 0 0
line 4687
;4681:
;4682:/*
;4683:==================
;4684:BotCheckForKamikazeBody
;4685:==================
;4686:*/
;4687:void BotCheckForKamikazeBody(bot_state_t *bs, entityState_t *state) {
line 4689
;4688:	// if this entity is not wearing the kamikaze
;4689:	if (!(state->eFlags & EF_KAMIKAZE))
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
NEI4 $2742
line 4690
;4690:		return;
ADDRGP4 $2741
JUMPV
LABELV $2742
line 4692
;4691:	// if this entity isn't dead
;4692:	if (!(state->eFlags & EF_DEAD))
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $2744
line 4693
;4693:		return;
ADDRGP4 $2741
JUMPV
LABELV $2744
line 4695
;4694:	//remember this kamikaze body
;4695:	bs->kamikazebody = state->number;
ADDRFP4 0
INDIRP4
CNSTI4 6256
ADDP4
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
line 4696
;4696:}
LABELV $2741
endproc BotCheckForKamikazeBody 0 0
export BotCheckEvents
proc BotCheckEvents 316 12
line 4704
;4697:
;4698:
;4699:/*
;4700:==================
;4701:BotCheckEvents
;4702:==================
;4703:*/
;4704:void BotCheckEvents(bot_state_t *bs, entityState_t *state) {
line 4711
;4705:	int event;
;4706:	char buf[128];
;4707:	aas_entityinfo_t entinfo;
;4708:
;4709:	//NOTE: this sucks, we're accessing the gentity_t directly
;4710:	//but there's no other fast way to do it right now
;4711:	if (bs->entityeventTime[state->number] == g_entities[state->number].eventTime) {
ADDRLP4 272
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 272
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDP4
INDIRI4
ADDRLP4 272
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities+552
ADDP4
INDIRI4
NEI4 $2747
line 4712
;4712:		return;
ADDRGP4 $2746
JUMPV
LABELV $2747
line 4714
;4713:	}
;4714:	bs->entityeventTime[state->number] = g_entities[state->number].eventTime;
ADDRLP4 276
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 276
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDP4
ADDRLP4 276
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities+552
ADDP4
INDIRI4
ASGNI4
line 4716
;4715:	//if it's an event only entity
;4716:	if (state->eType > ET_EVENTS) {
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
LEI4 $2751
line 4717
;4717:		event = (state->eType - ET_EVENTS) & ~EV_EVENT_BITS;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
SUBI4
CNSTI4 -769
BANDI4
ASGNI4
line 4718
;4718:	}
ADDRGP4 $2752
JUMPV
LABELV $2751
line 4719
;4719:	else {
line 4720
;4720:		event = state->event & ~EV_EVENT_BITS;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
ASGNI4
line 4721
;4721:	}
LABELV $2752
line 4723
;4722:	//
;4723:	switch(event) {
ADDRLP4 280
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 1
LTI4 $2753
ADDRLP4 280
INDIRI4
CNSTI4 76
GTI4 $2753
ADDRLP4 280
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2831-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $2831
address $2754
address $2754
address $2754
address $2754
address $2754
address $2754
address $2754
address $2754
address $2754
address $2754
address $2754
address $2754
address $2754
address $2754
address $2754
address $2754
address $2754
address $2754
address $2754
address $2754
address $2754
address $2754
address $2754
address $2754
address $2754
address $2754
address $2754
address $2754
address $2754
address $2754
address $2754
address $2754
address $2754
address $2754
address $2754
address $2754
address $2754
address $2754
address $2754
address $2753
address $2753
address $2816
address $2753
address $2753
address $2817
address $2773
address $2785
address $2753
address $2753
address $2753
address $2753
address $2753
address $2753
address $2753
address $2753
address $2753
address $2753
address $2753
address $2753
address $2755
address $2753
address $2753
address $2753
address $2753
address $2753
address $2753
address $2753
address $2753
address $2753
address $2753
address $2753
address $2753
address $2753
address $2753
address $2753
address $2754
code
LABELV $2755
line 4726
;4724:		//client obituary event
;4725:		case EV_OBITUARY:
;4726:		{
line 4729
;4727:			int target, attacker, mod;
;4728:
;4729:			target = state->otherEntityNum;
ADDRLP4 284
ADDRFP4 4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 4730
;4730:			attacker = state->otherEntityNum2;
ADDRLP4 288
ADDRFP4 4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 4731
;4731:			mod = state->eventParm;
ADDRLP4 292
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 4733
;4732:			//
;4733:			if (target == bs->client) {
ADDRLP4 284
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $2756
line 4734
;4734:				bs->botdeathtype = mod;
ADDRFP4 0
INDIRP4
CNSTI4 6000
ADDP4
ADDRLP4 292
INDIRI4
ASGNI4
line 4735
;4735:				bs->lastkilledby = attacker;
ADDRFP4 0
INDIRP4
CNSTI4 5996
ADDP4
ADDRLP4 288
INDIRI4
ASGNI4
line 4737
;4736:				//
;4737:				if (target == attacker ||
ADDRLP4 296
ADDRLP4 284
INDIRI4
ASGNI4
ADDRLP4 296
INDIRI4
ADDRLP4 288
INDIRI4
EQI4 $2761
ADDRLP4 296
INDIRI4
CNSTI4 1023
EQI4 $2761
ADDRLP4 296
INDIRI4
CNSTI4 1022
NEI4 $2758
LABELV $2761
line 4739
;4738:					target == ENTITYNUM_NONE ||
;4739:					target == ENTITYNUM_WORLD) bs->botsuicide = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6008
ADDP4
CNSTI4 1
ASGNI4
ADDRGP4 $2759
JUMPV
LABELV $2758
line 4740
;4740:				else bs->botsuicide = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6008
ADDP4
CNSTI4 0
ASGNI4
LABELV $2759
line 4742
;4741:				//
;4742:				bs->num_deaths++;
ADDRLP4 300
ADDRFP4 0
INDIRP4
CNSTI4 6028
ADDP4
ASGNP4
ADDRLP4 300
INDIRP4
ADDRLP4 300
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4743
;4743:			}
ADDRGP4 $2757
JUMPV
LABELV $2756
line 4745
;4744:			//else if this client was killed by the bot
;4745:			else if (attacker == bs->client) {
ADDRLP4 288
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $2762
line 4746
;4746:				bs->enemydeathtype = mod;
ADDRFP4 0
INDIRP4
CNSTI4 6004
ADDP4
ADDRLP4 292
INDIRI4
ASGNI4
line 4747
;4747:				bs->lastkilledplayer = target;
ADDRFP4 0
INDIRP4
CNSTI4 5992
ADDP4
ADDRLP4 284
INDIRI4
ASGNI4
line 4748
;4748:				bs->killedenemy_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6168
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4750
;4749:				//
;4750:				bs->num_kills++;
ADDRLP4 296
ADDRFP4 0
INDIRP4
CNSTI4 6032
ADDP4
ASGNP4
ADDRLP4 296
INDIRP4
ADDRLP4 296
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4751
;4751:			}
ADDRGP4 $2763
JUMPV
LABELV $2762
line 4752
;4752:			else if (attacker == bs->enemy && target == attacker) {
ADDRLP4 296
ADDRLP4 288
INDIRI4
ASGNI4
ADDRLP4 296
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
NEI4 $2764
ADDRLP4 284
INDIRI4
ADDRLP4 296
INDIRI4
NEI4 $2764
line 4753
;4753:				bs->enemysuicide = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6012
ADDP4
CNSTI4 1
ASGNI4
line 4754
;4754:			}
LABELV $2764
LABELV $2763
LABELV $2757
line 4756
;4755:			//
;4756:			if (gametype == GT_ONEFLAG) {
ADDRGP4 gametype
INDIRI4
CNSTI4 5
NEI4 $2754
line 4758
;4757:				//
;4758:				BotEntityInfo(target, &entinfo);
ADDRLP4 284
INDIRI4
ARGI4
ADDRLP4 132
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 4759
;4759:				if ( entinfo.powerups & ( 1 << PW_NEUTRALFLAG ) ) {
ADDRLP4 132+124
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $2754
line 4760
;4760:					if (!BotSameTeam(bs, target)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 284
INDIRI4
ARGI4
ADDRLP4 300
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 300
INDIRI4
CNSTI4 0
NEI4 $2754
line 4761
;4761:						bs->neutralflagstatus = 3;	//enemy dropped the flag
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
CNSTI4 3
ASGNI4
line 4762
;4762:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6968
ADDP4
CNSTI4 1
ASGNI4
line 4763
;4763:					}
line 4764
;4764:				}
line 4765
;4765:			}
line 4766
;4766:			break;
ADDRGP4 $2754
JUMPV
LABELV $2773
line 4769
;4767:		}
;4768:		case EV_GLOBAL_SOUND:
;4769:		{
line 4770
;4770:			if (state->eventParm < 0 || state->eventParm >= MAX_SOUNDS) {
ADDRLP4 284
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 284
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
LTI4 $2776
ADDRLP4 284
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 256
LTI4 $2774
LABELV $2776
line 4771
;4771:				BotAI_Print(PRT_ERROR, "EV_GLOBAL_SOUND: eventParm (%d) out of range\n", state->eventParm);
CNSTI4 3
ARGI4
ADDRGP4 $2777
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 4772
;4772:				break;
ADDRGP4 $2754
JUMPV
LABELV $2774
line 4774
;4773:			}
;4774:			trap_GetConfigstring(CS_SOUNDS + state->eventParm, buf, sizeof(buf));
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 4787
;4775:			/*
;4776:			if (!strcmp(buf, "sound/teamplay/flagret_red.wav")) {
;4777:				//red flag is returned
;4778:				bs->redflagstatus = 0;
;4779:				bs->flagstatuschanged = qtrue;
;4780:			}
;4781:			else if (!strcmp(buf, "sound/teamplay/flagret_blu.wav")) {
;4782:				//blue flag is returned
;4783:				bs->blueflagstatus = 0;
;4784:				bs->flagstatuschanged = qtrue;
;4785:			}
;4786:			else*/
;4787:			if (!strcmp(buf, "sound/items/kamikazerespawn.wav" )) {
ADDRLP4 4
ARGP4
ADDRGP4 $2780
ARGP4
ADDRLP4 288
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 0
NEI4 $2778
line 4789
;4788:				//the kamikaze respawned so dont avoid it
;4789:				BotDontAvoid(bs, "Kamikaze");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2781
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 4790
;4790:			} else if (!strcmp(buf, "sound/items/poweruprespawn.wav")) {
ADDRGP4 $2754
JUMPV
LABELV $2778
ADDRLP4 4
ARGP4
ADDRGP4 $2784
ARGP4
ADDRLP4 292
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
NEI4 $2754
line 4792
;4791:				//powerup respawned... go get it
;4792:				BotGoForPowerups(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotGoForPowerups
CALLV
pop
line 4793
;4793:			}
line 4794
;4794:			break;
ADDRGP4 $2754
JUMPV
LABELV $2785
line 4797
;4795:		}
;4796:		case EV_GLOBAL_TEAM_SOUND:
;4797:		{
line 4798
;4798:			if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $2786
line 4799
;4799:				switch(state->eventParm) {
ADDRLP4 284
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 0
LTI4 $2754
ADDRLP4 284
INDIRI4
CNSTI4 5
GTI4 $2754
ADDRLP4 284
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2797
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $2797
address $2791
address $2792
address $2793
address $2794
address $2795
address $2796
code
LABELV $2791
line 4801
;4800:					case GTS_RED_CAPTURE:
;4801:						bs->blueflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6960
ADDP4
CNSTI4 0
ASGNI4
line 4802
;4802:						bs->redflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
CNSTI4 0
ASGNI4
line 4803
;4803:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6968
ADDP4
CNSTI4 1
ASGNI4
line 4804
;4804:						break; //see BotMatch_CTF
ADDRGP4 $2754
JUMPV
LABELV $2792
line 4806
;4805:					case GTS_BLUE_CAPTURE:
;4806:						bs->blueflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6960
ADDP4
CNSTI4 0
ASGNI4
line 4807
;4807:						bs->redflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
CNSTI4 0
ASGNI4
line 4808
;4808:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6968
ADDP4
CNSTI4 1
ASGNI4
line 4809
;4809:						break; //see BotMatch_CTF
ADDRGP4 $2754
JUMPV
LABELV $2793
line 4812
;4810:					case GTS_RED_RETURN:
;4811:						//blue flag is returned
;4812:						bs->blueflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6960
ADDP4
CNSTI4 0
ASGNI4
line 4813
;4813:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6968
ADDP4
CNSTI4 1
ASGNI4
line 4814
;4814:						break;
ADDRGP4 $2754
JUMPV
LABELV $2794
line 4817
;4815:					case GTS_BLUE_RETURN:
;4816:						//red flag is returned
;4817:						bs->redflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
CNSTI4 0
ASGNI4
line 4818
;4818:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6968
ADDP4
CNSTI4 1
ASGNI4
line 4819
;4819:						break;
ADDRGP4 $2754
JUMPV
LABELV $2795
line 4822
;4820:					case GTS_RED_TAKEN:
;4821:						//blue flag is taken
;4822:						bs->blueflagstatus = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6960
ADDP4
CNSTI4 1
ASGNI4
line 4823
;4823:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6968
ADDP4
CNSTI4 1
ASGNI4
line 4824
;4824:						break; //see BotMatch_CTF
ADDRGP4 $2754
JUMPV
LABELV $2796
line 4827
;4825:					case GTS_BLUE_TAKEN:
;4826:						//red flag is taken
;4827:						bs->redflagstatus = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
CNSTI4 1
ASGNI4
line 4828
;4828:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6968
ADDP4
CNSTI4 1
ASGNI4
line 4829
;4829:						break; //see BotMatch_CTF
line 4831
;4830:				}
;4831:			}
ADDRGP4 $2754
JUMPV
LABELV $2786
line 4832
;4832:			else if (gametype == GT_ONEFLAG) {
ADDRGP4 gametype
INDIRI4
CNSTI4 5
NEI4 $2754
line 4833
;4833:				switch(state->eventParm) {
ADDRLP4 284
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 0
LTI4 $2754
ADDRLP4 284
INDIRI4
CNSTI4 5
GTI4 $2754
ADDRLP4 284
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2815
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $2815
address $2803
address $2804
address $2805
address $2806
address $2807
address $2811
code
LABELV $2803
line 4835
;4834:					case GTS_RED_CAPTURE:
;4835:						bs->neutralflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
CNSTI4 0
ASGNI4
line 4836
;4836:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6968
ADDP4
CNSTI4 1
ASGNI4
line 4837
;4837:						break;
ADDRGP4 $2754
JUMPV
LABELV $2804
line 4839
;4838:					case GTS_BLUE_CAPTURE:
;4839:						bs->neutralflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
CNSTI4 0
ASGNI4
line 4840
;4840:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6968
ADDP4
CNSTI4 1
ASGNI4
line 4841
;4841:						break;
ADDRGP4 $2754
JUMPV
LABELV $2805
line 4844
;4842:					case GTS_RED_RETURN:
;4843:						//flag has returned
;4844:						bs->neutralflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
CNSTI4 0
ASGNI4
line 4845
;4845:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6968
ADDP4
CNSTI4 1
ASGNI4
line 4846
;4846:						break;
ADDRGP4 $2754
JUMPV
LABELV $2806
line 4849
;4847:					case GTS_BLUE_RETURN:
;4848:						//flag has returned
;4849:						bs->neutralflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
CNSTI4 0
ASGNI4
line 4850
;4850:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6968
ADDP4
CNSTI4 1
ASGNI4
line 4851
;4851:						break;
ADDRGP4 $2754
JUMPV
LABELV $2807
line 4853
;4852:					case GTS_RED_TAKEN:
;4853:						bs->neutralflagstatus = BotTeam(bs) == TEAM_RED ? 2 : 1; //FIXME: check Team_TakeFlagSound in g_team.c
ADDRLP4 296
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 296
INDIRP4
ARGP4
ADDRLP4 300
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 300
INDIRI4
CNSTI4 1
NEI4 $2809
ADDRLP4 292
CNSTI4 2
ASGNI4
ADDRGP4 $2810
JUMPV
LABELV $2809
ADDRLP4 292
CNSTI4 1
ASGNI4
LABELV $2810
ADDRLP4 296
INDIRP4
CNSTI4 6964
ADDP4
ADDRLP4 292
INDIRI4
ASGNI4
line 4854
;4854:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6968
ADDP4
CNSTI4 1
ASGNI4
line 4855
;4855:						break;
ADDRGP4 $2754
JUMPV
LABELV $2811
line 4857
;4856:					case GTS_BLUE_TAKEN:
;4857:						bs->neutralflagstatus = BotTeam(bs) == TEAM_BLUE ? 2 : 1; //FIXME: check Team_TakeFlagSound in g_team.c
ADDRLP4 308
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 308
INDIRP4
ARGP4
ADDRLP4 312
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 312
INDIRI4
CNSTI4 2
NEI4 $2813
ADDRLP4 304
CNSTI4 2
ASGNI4
ADDRGP4 $2814
JUMPV
LABELV $2813
ADDRLP4 304
CNSTI4 1
ASGNI4
LABELV $2814
ADDRLP4 308
INDIRP4
CNSTI4 6964
ADDP4
ADDRLP4 304
INDIRI4
ASGNI4
line 4858
;4858:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6968
ADDP4
CNSTI4 1
ASGNI4
line 4859
;4859:						break;
line 4861
;4860:				}
;4861:			}
line 4862
;4862:			break;
ADDRGP4 $2754
JUMPV
LABELV $2816
line 4865
;4863:		}
;4864:		case EV_PLAYER_TELEPORT_IN:
;4865:		{
line 4866
;4866:			VectorCopy(state->origin, lastteleport_origin);
ADDRGP4 lastteleport_origin
ADDRFP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 4867
;4867:			lastteleport_time = FloatTime();
ADDRGP4 lastteleport_time
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4868
;4868:			break;
ADDRGP4 $2754
JUMPV
LABELV $2817
line 4871
;4869:		}
;4870:		case EV_GENERAL_SOUND:
;4871:		{
line 4873
;4872:			//if this sound is played on the bot
;4873:			if (state->number == bs->client) {
ADDRFP4 4
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $2754
line 4874
;4874:				if (state->eventParm < 0 || state->eventParm >= MAX_SOUNDS) {
ADDRLP4 284
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 284
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
LTI4 $2822
ADDRLP4 284
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 256
LTI4 $2820
LABELV $2822
line 4875
;4875:					BotAI_Print(PRT_ERROR, "EV_GENERAL_SOUND: eventParm (%d) out of range\n", state->eventParm);
CNSTI4 3
ARGI4
ADDRGP4 $2823
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 4876
;4876:					break;
ADDRGP4 $2754
JUMPV
LABELV $2820
line 4879
;4877:				}
;4878:				//check out the sound
;4879:				trap_GetConfigstring(CS_SOUNDS + state->eventParm, buf, sizeof(buf));
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 4881
;4880:				//if falling into a death pit
;4881:				if (!strcmp(buf, "*falling1.wav")) {
ADDRLP4 4
ARGP4
ADDRGP4 $2826
ARGP4
ADDRLP4 288
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 0
NEI4 $2754
line 4883
;4882:					//if the bot has a personal teleporter
;4883:					if (bs->inventory[INVENTORY_TELEPORTER] > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 5072
ADDP4
INDIRI4
CNSTI4 0
LEI4 $2754
line 4885
;4884:						//use the holdable item
;4885:						trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 4886
;4886:					}
line 4887
;4887:				}
line 4888
;4888:			}
line 4889
;4889:			break;
line 4916
;4890:		}
;4891:		case EV_FOOTSTEP:
;4892:		case EV_FOOTSTEP_METAL:
;4893:		case EV_FOOTSPLASH:
;4894:		case EV_FOOTWADE:
;4895:		case EV_SWIM:
;4896:		case EV_FALL_SHORT:
;4897:		case EV_FALL_MEDIUM:
;4898:		case EV_FALL_FAR:
;4899:		case EV_STEP_4:
;4900:		case EV_STEP_8:
;4901:		case EV_STEP_12:
;4902:		case EV_STEP_16:
;4903:		case EV_JUMP_PAD:
;4904:		case EV_JUMP:
;4905:		case EV_TAUNT:
;4906:		case EV_WATER_TOUCH:
;4907:		case EV_WATER_LEAVE:
;4908:		case EV_WATER_UNDER:
;4909:		case EV_WATER_CLEAR:
;4910:		case EV_ITEM_PICKUP:
;4911:		case EV_GLOBAL_ITEM_PICKUP:
;4912:		case EV_NOAMMO:
;4913:		case EV_CHANGE_WEAPON:
;4914:		case EV_FIRE_WEAPON:
;4915:			//FIXME: either add to sound queue or mark player as someone making noise
;4916:			break;
line 4933
;4917:		case EV_USE_ITEM0:
;4918:		case EV_USE_ITEM1:
;4919:		case EV_USE_ITEM2:
;4920:		case EV_USE_ITEM3:
;4921:		case EV_USE_ITEM4:
;4922:		case EV_USE_ITEM5:
;4923:		case EV_USE_ITEM6:
;4924:		case EV_USE_ITEM7:
;4925:		case EV_USE_ITEM8:
;4926:		case EV_USE_ITEM9:
;4927:		case EV_USE_ITEM10:
;4928:		case EV_USE_ITEM11:
;4929:		case EV_USE_ITEM12:
;4930:		case EV_USE_ITEM13:
;4931:		case EV_USE_ITEM14:
;4932:		case EV_USE_ITEM15:
;4933:			break;
LABELV $2753
LABELV $2754
line 4935
;4934:	}
;4935:}
LABELV $2746
endproc BotCheckEvents 316 12
export BotCheckSnapshot
proc BotCheckSnapshot 216 16
line 4942
;4936:
;4937:/*
;4938:==================
;4939:BotCheckSnapshot
;4940:==================
;4941:*/
;4942:void BotCheckSnapshot(bot_state_t *bs) {
line 4947
;4943:	int ent;
;4944:	entityState_t state;
;4945:
;4946:	//remove all avoid spots
;4947:	trap_BotAddAvoidSpot(bs->ms, vec3_origin, 0, AVOID_CLEAR);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 vec3_origin
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotAddAvoidSpot
CALLV
pop
line 4949
;4948:	//reset kamikaze body
;4949:	bs->kamikazebody = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6256
ADDP4
CNSTI4 0
ASGNI4
line 4951
;4950:	//reset number of proxmines
;4951:	bs->numproxmines = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6516
ADDP4
CNSTI4 0
ASGNI4
line 4953
;4952:	//
;4953:	ent = 0;
ADDRLP4 208
CNSTI4 0
ASGNI4
ADDRGP4 $2835
JUMPV
LABELV $2834
line 4954
;4954:	while( ( ent = BotAI_GetSnapshotEntity( bs->client, ent, &state ) ) != -1 ) {
line 4956
;4955:		//check the entity state for events
;4956:		BotCheckEvents(bs, &state);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotCheckEvents
CALLV
pop
line 4958
;4957:		//check for grenades the bot should avoid
;4958:		BotCheckForGrenades(bs, &state);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotCheckForGrenades
CALLV
pop
line 4961
;4959:		//
;4960:		//check for proximity mines which the bot should deactivate
;4961:		BotCheckForProxMines(bs, &state);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotCheckForProxMines
CALLV
pop
line 4963
;4962:		//check for dead bodies with the kamikaze effect which should be gibbed
;4963:		BotCheckForKamikazeBody(bs, &state);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotCheckForKamikazeBody
CALLV
pop
line 4964
;4964:	}
LABELV $2835
line 4954
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 208
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 212
ADDRGP4 BotAI_GetSnapshotEntity
CALLI4
ASGNI4
ADDRLP4 208
ADDRLP4 212
INDIRI4
ASGNI4
ADDRLP4 212
INDIRI4
CNSTI4 -1
NEI4 $2834
line 4966
;4965:	//check the player state for events
;4966:	BotAI_GetEntityState(bs->client, &state);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotAI_GetEntityState
CALLI4
pop
line 4968
;4967:	//copy the player state events to the entity state
;4968:	state.event = bs->cur_ps.externalEvent;
ADDRLP4 0+180
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 4969
;4969:	state.eventParm = bs->cur_ps.externalEventParm;
ADDRLP4 0+184
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
line 4971
;4970:	//
;4971:	BotCheckEvents(bs, &state);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotCheckEvents
CALLV
pop
line 4972
;4972:}
LABELV $2833
endproc BotCheckSnapshot 216 16
export BotCheckAir
proc BotCheckAir 4 4
line 4979
;4973:
;4974:/*
;4975:==================
;4976:BotCheckAir
;4977:==================
;4978:*/
;4979:void BotCheckAir(bot_state_t *bs) {
line 4980
;4980:	if (bs->inventory[INVENTORY_ENVIRONMENTSUIT] <= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 5096
ADDP4
INDIRI4
CNSTI4 0
GTI4 $2840
line 4981
;4981:		if (trap_AAS_PointContents(bs->eye) & (CONTENTS_WATER|CONTENTS_SLIME|CONTENTS_LAVA)) {
ADDRFP4 0
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 trap_AAS_PointContents
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $2842
line 4982
;4982:			return;
ADDRGP4 $2839
JUMPV
LABELV $2842
line 4984
;4983:		}
;4984:	}
LABELV $2840
line 4985
;4985:	bs->lastair_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6176
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4986
;4986:}
LABELV $2839
endproc BotCheckAir 4 4
export BotAlternateRoute
proc BotAlternateRoute 16 16
line 4993
;4987:
;4988:/*
;4989:==================
;4990:BotAlternateRoute
;4991:==================
;4992:*/
;4993:bot_goal_t *BotAlternateRoute(bot_state_t *bs, bot_goal_t *goal) {
line 4997
;4994:	int t;
;4995:
;4996:	// if the bot has an alternative route goal
;4997:	if (bs->altroutegoal.areanum) {
ADDRFP4 0
INDIRP4
CNSTI4 6692
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2845
line 4999
;4998:		//
;4999:		if (bs->reachedaltroutegoal_time)
ADDRFP4 0
INDIRP4
CNSTI4 6736
ADDP4
INDIRF4
CNSTF4 0
EQF4 $2847
line 5000
;5000:			return goal;
ADDRFP4 4
INDIRP4
RETP4
ADDRGP4 $2844
JUMPV
LABELV $2847
line 5002
;5001:		// travel time towards alternative route goal
;5002:		t = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, bs->altroutegoal.areanum, bs->tfl);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 6692
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 5003
;5003:		if (t && t < 20) {
ADDRLP4 12
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $2849
ADDRLP4 12
INDIRI4
CNSTI4 20
GEI4 $2849
line 5005
;5004:			//BotAI_Print(PRT_MESSAGE, "reached alternate route goal\n");
;5005:			bs->reachedaltroutegoal_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6736
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 5006
;5006:		}
LABELV $2849
line 5007
;5007:		memcpy(goal, &bs->altroutegoal, sizeof(bot_goal_t));
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6680
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 5008
;5008:		return &bs->altroutegoal;
ADDRFP4 0
INDIRP4
CNSTI4 6680
ADDP4
RETP4
ADDRGP4 $2844
JUMPV
LABELV $2845
line 5010
;5009:	}
;5010:	return goal;
ADDRFP4 4
INDIRP4
RETP4
LABELV $2844
endproc BotAlternateRoute 16 16
export BotGetAlternateRouteGoal
proc BotGetAlternateRouteGoal 20 0
line 5018
;5011:}
;5012:
;5013:/*
;5014:==================
;5015:BotGetAlternateRouteGoal
;5016:==================
;5017:*/
;5018:int BotGetAlternateRouteGoal(bot_state_t *bs, int base) {
line 5023
;5019:	aas_altroutegoal_t *altroutegoals;
;5020:	bot_goal_t *goal;
;5021:	int numaltroutegoals, rnd;
;5022:
;5023:	if (base == TEAM_RED) {
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $2852
line 5024
;5024:		altroutegoals = red_altroutegoals;
ADDRLP4 12
ADDRGP4 red_altroutegoals
ASGNP4
line 5025
;5025:		numaltroutegoals = red_numaltroutegoals;
ADDRLP4 4
ADDRGP4 red_numaltroutegoals
INDIRI4
ASGNI4
line 5026
;5026:	}
ADDRGP4 $2853
JUMPV
LABELV $2852
line 5027
;5027:	else {
line 5028
;5028:		altroutegoals = blue_altroutegoals;
ADDRLP4 12
ADDRGP4 blue_altroutegoals
ASGNP4
line 5029
;5029:		numaltroutegoals = blue_numaltroutegoals;
ADDRLP4 4
ADDRGP4 blue_numaltroutegoals
INDIRI4
ASGNI4
line 5030
;5030:	}
LABELV $2853
line 5031
;5031:	if (!numaltroutegoals)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2854
line 5032
;5032:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2851
JUMPV
LABELV $2854
line 5033
;5033:	rnd = (float) random() * numaltroutegoals;
ADDRLP4 16
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 16
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 5034
;5034:	if (rnd >= numaltroutegoals)
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $2856
line 5035
;5035:		rnd = numaltroutegoals-1;
ADDRLP4 8
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $2856
line 5036
;5036:	goal = &bs->altroutegoal;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 6680
ADDP4
ASGNP4
line 5037
;5037:	goal->areanum = altroutegoals[rnd].areanum;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 24
MULI4
ADDRLP4 12
INDIRP4
ADDP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 5038
;5038:	VectorCopy(altroutegoals[rnd].origin, goal->origin);
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
CNSTI4 24
MULI4
ADDRLP4 12
INDIRP4
ADDP4
INDIRB
ASGNB 12
line 5039
;5039:	VectorSet(goal->mins, -8, -8, -8);
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
CNSTF4 3238002688
ASGNF4
line 5040
;5040:	VectorSet(goal->maxs, 8, 8, 8);
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1090519040
ASGNF4
line 5041
;5041:	goal->entitynum = 0;
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTI4 0
ASGNI4
line 5042
;5042:	goal->iteminfo = 0;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 5043
;5043:	goal->number = 0;
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 5044
;5044:	goal->flags = 0;
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 5046
;5045:	//
;5046:	bs->reachedaltroutegoal_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6736
ADDP4
CNSTF4 0
ASGNF4
line 5047
;5047:	return qtrue;
CNSTI4 1
RETI4
LABELV $2851
endproc BotGetAlternateRouteGoal 20 0
export BotSetupAlternativeRouteGoals
proc BotSetupAlternativeRouteGoals 12 32
line 5055
;5048:}
;5049:
;5050:/*
;5051:==================
;5052:BotSetupAlternateRouteGoals
;5053:==================
;5054:*/
;5055:void BotSetupAlternativeRouteGoals(void) {
line 5057
;5056:
;5057:	if (altroutegoals_setup)
ADDRGP4 altroutegoals_setup
INDIRI4
CNSTI4 0
EQI4 $2859
line 5058
;5058:		return;
ADDRGP4 $2858
JUMPV
LABELV $2859
line 5059
;5059:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $2861
line 5060
;5060:		if (trap_BotGetLevelItemGoal(-1, "Neutral Flag", &ctf_neutralflag) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $2865
ARGP4
ADDRGP4 ctf_neutralflag
ARGP4
ADDRLP4 0
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $2863
line 5061
;5061:			BotAI_Print(PRT_WARNING, "no alt routes without Neutral Flag\n");
CNSTI4 2
ARGI4
ADDRGP4 $2866
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $2863
line 5062
;5062:		if (ctf_neutralflag.areanum) {
ADDRGP4 ctf_neutralflag+12
INDIRI4
CNSTI4 0
EQI4 $2862
line 5064
;5063:			//
;5064:			red_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
ADDRGP4 ctf_neutralflag
ARGP4
ADDRGP4 ctf_neutralflag+12
INDIRI4
ARGI4
ADDRGP4 ctf_redflag
ARGP4
ADDRGP4 ctf_redflag+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRGP4 red_altroutegoals
ARGP4
CNSTI4 32
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 4
ADDRGP4 trap_AAS_AlternativeRouteGoals
CALLI4
ASGNI4
ADDRGP4 red_numaltroutegoals
ADDRLP4 4
INDIRI4
ASGNI4
line 5070
;5065:										ctf_neutralflag.origin, ctf_neutralflag.areanum,
;5066:										ctf_redflag.origin, ctf_redflag.areanum, TFL_DEFAULT,
;5067:										red_altroutegoals, MAX_ALTROUTEGOALS,
;5068:										ALTROUTEGOAL_CLUSTERPORTALS|
;5069:										ALTROUTEGOAL_VIEWPORTALS);
;5070:			blue_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
ADDRGP4 ctf_neutralflag
ARGP4
ADDRGP4 ctf_neutralflag+12
INDIRI4
ARGI4
ADDRGP4 ctf_blueflag
ARGP4
ADDRGP4 ctf_blueflag+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRGP4 blue_altroutegoals
ARGP4
CNSTI4 32
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 8
ADDRGP4 trap_AAS_AlternativeRouteGoals
CALLI4
ASGNI4
ADDRGP4 blue_numaltroutegoals
ADDRLP4 8
INDIRI4
ASGNI4
line 5076
;5071:										ctf_neutralflag.origin, ctf_neutralflag.areanum,
;5072:										ctf_blueflag.origin, ctf_blueflag.areanum, TFL_DEFAULT,
;5073:										blue_altroutegoals, MAX_ALTROUTEGOALS,
;5074:										ALTROUTEGOAL_CLUSTERPORTALS|
;5075:										ALTROUTEGOAL_VIEWPORTALS);
;5076:		}
line 5077
;5077:	}
ADDRGP4 $2862
JUMPV
LABELV $2861
line 5078
;5078:	else if (gametype == GT_ONEFLAG) {
ADDRGP4 gametype
INDIRI4
CNSTI4 5
NEI4 $2874
line 5080
;5079:		//
;5080:		red_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
ADDRGP4 ctf_neutralflag
ARGP4
ADDRGP4 ctf_neutralflag+12
INDIRI4
ARGI4
ADDRGP4 ctf_redflag
ARGP4
ADDRGP4 ctf_redflag+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRGP4 red_altroutegoals
ARGP4
CNSTI4 32
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 0
ADDRGP4 trap_AAS_AlternativeRouteGoals
CALLI4
ASGNI4
ADDRGP4 red_numaltroutegoals
ADDRLP4 0
INDIRI4
ASGNI4
line 5086
;5081:									ctf_neutralflag.origin, ctf_neutralflag.areanum,
;5082:									ctf_redflag.origin, ctf_redflag.areanum, TFL_DEFAULT,
;5083:									red_altroutegoals, MAX_ALTROUTEGOALS,
;5084:									ALTROUTEGOAL_CLUSTERPORTALS|
;5085:									ALTROUTEGOAL_VIEWPORTALS);
;5086:		blue_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
ADDRGP4 ctf_neutralflag
ARGP4
ADDRGP4 ctf_neutralflag+12
INDIRI4
ARGI4
ADDRGP4 ctf_blueflag
ARGP4
ADDRGP4 ctf_blueflag+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRGP4 blue_altroutegoals
ARGP4
CNSTI4 32
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 4
ADDRGP4 trap_AAS_AlternativeRouteGoals
CALLI4
ASGNI4
ADDRGP4 blue_numaltroutegoals
ADDRLP4 4
INDIRI4
ASGNI4
line 5092
;5087:									ctf_neutralflag.origin, ctf_neutralflag.areanum,
;5088:									ctf_blueflag.origin, ctf_blueflag.areanum, TFL_DEFAULT,
;5089:									blue_altroutegoals, MAX_ALTROUTEGOALS,
;5090:									ALTROUTEGOAL_CLUSTERPORTALS|
;5091:									ALTROUTEGOAL_VIEWPORTALS);
;5092:	}
ADDRGP4 $2875
JUMPV
LABELV $2874
line 5093
;5093:	else if (gametype == GT_OVERLOAD) {
ADDRGP4 gametype
INDIRI4
CNSTI4 6
NEI4 $2880
line 5094
;5094:		if (trap_BotGetLevelItemGoal(-1, "Neutral Obelisk", &neutralobelisk) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $2884
ARGP4
ADDRGP4 neutralobelisk
ARGP4
ADDRLP4 0
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $2882
line 5095
;5095:			BotAI_Print(PRT_WARNING, "Harvester without neutral obelisk\n");
CNSTI4 2
ARGI4
ADDRGP4 $2885
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $2882
line 5097
;5096:		//
;5097:		red_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
ADDRGP4 neutralobelisk
ARGP4
ADDRGP4 neutralobelisk+12
INDIRI4
ARGI4
ADDRGP4 redobelisk
ARGP4
ADDRGP4 redobelisk+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRGP4 red_altroutegoals
ARGP4
CNSTI4 32
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 4
ADDRGP4 trap_AAS_AlternativeRouteGoals
CALLI4
ASGNI4
ADDRGP4 red_numaltroutegoals
ADDRLP4 4
INDIRI4
ASGNI4
line 5103
;5098:									neutralobelisk.origin, neutralobelisk.areanum,
;5099:									redobelisk.origin, redobelisk.areanum, TFL_DEFAULT,
;5100:									red_altroutegoals, MAX_ALTROUTEGOALS,
;5101:									ALTROUTEGOAL_CLUSTERPORTALS|
;5102:									ALTROUTEGOAL_VIEWPORTALS);
;5103:		blue_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
ADDRGP4 neutralobelisk
ARGP4
ADDRGP4 neutralobelisk+12
INDIRI4
ARGI4
ADDRGP4 blueobelisk
ARGP4
ADDRGP4 blueobelisk+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRGP4 blue_altroutegoals
ARGP4
CNSTI4 32
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 8
ADDRGP4 trap_AAS_AlternativeRouteGoals
CALLI4
ASGNI4
ADDRGP4 blue_numaltroutegoals
ADDRLP4 8
INDIRI4
ASGNI4
line 5109
;5104:									neutralobelisk.origin, neutralobelisk.areanum,
;5105:									blueobelisk.origin, blueobelisk.areanum, TFL_DEFAULT,
;5106:									blue_altroutegoals, MAX_ALTROUTEGOALS,
;5107:									ALTROUTEGOAL_CLUSTERPORTALS|
;5108:									ALTROUTEGOAL_VIEWPORTALS);
;5109:	}
ADDRGP4 $2881
JUMPV
LABELV $2880
line 5110
;5110:	else if (gametype == GT_HARVESTER) {
ADDRGP4 gametype
INDIRI4
CNSTI4 7
NEI4 $2890
line 5112
;5111:		//
;5112:		red_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
ADDRGP4 neutralobelisk
ARGP4
ADDRGP4 neutralobelisk+12
INDIRI4
ARGI4
ADDRGP4 redobelisk
ARGP4
ADDRGP4 redobelisk+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRGP4 red_altroutegoals
ARGP4
CNSTI4 32
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 0
ADDRGP4 trap_AAS_AlternativeRouteGoals
CALLI4
ASGNI4
ADDRGP4 red_numaltroutegoals
ADDRLP4 0
INDIRI4
ASGNI4
line 5118
;5113:									neutralobelisk.origin, neutralobelisk.areanum,
;5114:									redobelisk.origin, redobelisk.areanum, TFL_DEFAULT,
;5115:									red_altroutegoals, MAX_ALTROUTEGOALS,
;5116:									ALTROUTEGOAL_CLUSTERPORTALS|
;5117:									ALTROUTEGOAL_VIEWPORTALS);
;5118:		blue_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
ADDRGP4 neutralobelisk
ARGP4
ADDRGP4 neutralobelisk+12
INDIRI4
ARGI4
ADDRGP4 blueobelisk
ARGP4
ADDRGP4 blueobelisk+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRGP4 blue_altroutegoals
ARGP4
CNSTI4 32
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 4
ADDRGP4 trap_AAS_AlternativeRouteGoals
CALLI4
ASGNI4
ADDRGP4 blue_numaltroutegoals
ADDRLP4 4
INDIRI4
ASGNI4
line 5124
;5119:									neutralobelisk.origin, neutralobelisk.areanum,
;5120:									blueobelisk.origin, blueobelisk.areanum, TFL_DEFAULT,
;5121:									blue_altroutegoals, MAX_ALTROUTEGOALS,
;5122:									ALTROUTEGOAL_CLUSTERPORTALS|
;5123:									ALTROUTEGOAL_VIEWPORTALS);
;5124:	}
LABELV $2890
LABELV $2881
LABELV $2875
LABELV $2862
line 5125
;5125:	altroutegoals_setup = qtrue;
ADDRGP4 altroutegoals_setup
CNSTI4 1
ASGNI4
line 5126
;5126:}
LABELV $2858
endproc BotSetupAlternativeRouteGoals 12 32
export BotDeathmatchAI
proc BotDeathmatchAI 1492 20
line 5133
;5127:
;5128:/*
;5129:==================
;5130:BotDeathmatchAI
;5131:==================
;5132:*/
;5133:void BotDeathmatchAI(bot_state_t *bs, float thinktime) {
line 5139
;5134:	char gender[144], name[144], buf[144];
;5135:	char userinfo[MAX_INFO_STRING];
;5136:	int i;
;5137:
;5138:	//if the bot has just been setup
;5139:	if (bs->setupcount > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6016
ADDP4
INDIRI4
CNSTI4 0
LEI4 $2897
line 5140
;5140:		bs->setupcount--;
ADDRLP4 1460
ADDRFP4 0
INDIRP4
CNSTI4 6016
ADDP4
ASGNP4
ADDRLP4 1460
INDIRP4
ADDRLP4 1460
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 5141
;5141:		if (bs->setupcount > 0) return;
ADDRFP4 0
INDIRP4
CNSTI4 6016
ADDP4
INDIRI4
CNSTI4 0
LEI4 $2899
ADDRGP4 $2896
JUMPV
LABELV $2899
line 5143
;5142:		//get the gender characteristic
;5143:		trap_Characteristic_String(bs->character, CHARACTERISTIC_GENDER, gender, sizeof(gender));
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 148
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Characteristic_String
CALLV
pop
line 5145
;5144:		//set the bot gender
;5145:		trap_GetUserinfo(bs->client, userinfo, sizeof(userinfo));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 292
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 5146
;5146:		Info_SetValueForKey(userinfo, "sex", gender);
ADDRLP4 292
ARGP4
ADDRGP4 $2901
ARGP4
ADDRLP4 148
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 5147
;5147:		trap_SetUserinfo(bs->client, userinfo);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 292
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 5149
;5148:		//set the team
;5149:		if ( !bs->map_restart && g_gametype.integer != GT_DUEL ) {
ADDRFP4 0
INDIRP4
CNSTI4 6020
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2902
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $2902
line 5150
;5150:			Com_sprintf(buf, sizeof(buf), "team %s", bs->settings.team);
ADDRLP4 1316
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 $2905
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 4756
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 5151
;5151:			trap_EA_Command(bs->client, buf);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 1316
ARGP4
ADDRGP4 trap_EA_Command
CALLV
pop
line 5152
;5152:		}
LABELV $2902
line 5154
;5153:		//set the chat gender
;5154:		if (gender[0] == 'm') trap_BotSetChatGender(bs->cs, CHAT_GENDERMALE);
ADDRLP4 148
INDIRI1
CVII4 1
CNSTI4 109
NEI4 $2906
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotSetChatGender
CALLV
pop
ADDRGP4 $2907
JUMPV
LABELV $2906
line 5155
;5155:		else if (gender[0] == 'f')  trap_BotSetChatGender(bs->cs, CHAT_GENDERFEMALE);
ADDRLP4 148
INDIRI1
CVII4 1
CNSTI4 102
NEI4 $2908
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotSetChatGender
CALLV
pop
ADDRGP4 $2909
JUMPV
LABELV $2908
line 5156
;5156:		else  trap_BotSetChatGender(bs->cs, CHAT_GENDERLESS);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotSetChatGender
CALLV
pop
LABELV $2909
LABELV $2907
line 5158
;5157:		//set the chat name
;5158:		ClientName(bs->client, name, sizeof(name));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 5159
;5159:		trap_BotSetChatName(bs->cs, name, bs->client);
ADDRLP4 1464
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1464
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 1464
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotSetChatName
CALLV
pop
line 5161
;5160:		//
;5161:		bs->lastframe_health = bs->inventory[INVENTORY_HEALTH];
ADDRLP4 1468
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1468
INDIRP4
CNSTI4 6044
ADDP4
ADDRLP4 1468
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
ASGNI4
line 5162
;5162:		bs->lasthitcount = bs->cur_ps.persistant[PERS_HITS];
ADDRLP4 1472
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1472
INDIRP4
CNSTI4 6048
ADDP4
ADDRLP4 1472
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
ASGNI4
line 5164
;5163:		//
;5164:		bs->setupcount = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6016
ADDP4
CNSTI4 0
ASGNI4
line 5166
;5165:		//
;5166:		BotSetupAlternativeRouteGoals();
ADDRGP4 BotSetupAlternativeRouteGoals
CALLV
pop
line 5167
;5167:	}
LABELV $2897
line 5169
;5168:	//no ideal view set
;5169:	bs->flags &= ~BFL_IDEALVIEWSET;
ADDRLP4 1460
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
ASGNP4
ADDRLP4 1460
INDIRP4
ADDRLP4 1460
INDIRP4
INDIRI4
CNSTI4 -33
BANDI4
ASGNI4
line 5171
;5170:	//
;5171:	if (!BotIntermission(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1464
ADDRGP4 BotIntermission
CALLI4
ASGNI4
ADDRLP4 1464
INDIRI4
CNSTI4 0
NEI4 $2910
line 5173
;5172:		//set the teleport time
;5173:		BotSetTeleportTime(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeleportTime
CALLV
pop
line 5175
;5174:		//update some inventory values
;5175:		BotUpdateInventory(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotUpdateInventory
CALLV
pop
line 5177
;5176:		//check out the snapshot
;5177:		BotCheckSnapshot(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCheckSnapshot
CALLV
pop
line 5179
;5178:		//check for air
;5179:		BotCheckAir(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCheckAir
CALLV
pop
line 5180
;5180:	}
LABELV $2910
line 5182
;5181:	//check the console messages
;5182:	BotCheckConsoleMessages(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCheckConsoleMessages
CALLV
pop
line 5184
;5183:	//if not in the intermission and not in observer mode
;5184:	if (!BotIntermission(bs) && !BotIsObserver(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1468
ADDRGP4 BotIntermission
CALLI4
ASGNI4
ADDRLP4 1468
INDIRI4
CNSTI4 0
NEI4 $2912
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1472
ADDRGP4 BotIsObserver
CALLI4
ASGNI4
ADDRLP4 1472
INDIRI4
CNSTI4 0
NEI4 $2912
line 5186
;5185:		//do team AI
;5186:		BotTeamAI(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotTeamAI
CALLV
pop
line 5187
;5187:	}
LABELV $2912
line 5189
;5188:	//if the bot has no ai node
;5189:	if (!bs->ainode) {
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2914
line 5190
;5190:		AIEnter_Seek_LTG(bs, "BotDeathmatchAI: no ai node");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2916
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 5191
;5191:	}
LABELV $2914
line 5193
;5192:	//if the bot entered the game less than 8 seconds ago
;5193:	if (!bs->entergamechat && bs->entergame_time > FloatTime() - 8) {
ADDRLP4 1476
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1476
INDIRP4
CNSTI4 6024
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2917
ADDRLP4 1476
INDIRP4
CNSTI4 6064
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1090519040
SUBF4
LEF4 $2917
line 5194
;5194:		if (BotChat_EnterGame(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1480
ADDRGP4 BotChat_EnterGame
CALLI4
ASGNI4
ADDRLP4 1480
INDIRI4
CNSTI4 0
EQI4 $2919
line 5195
;5195:			bs->stand_time = FloatTime() + BotChatTime(bs);
ADDRLP4 1484
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1484
INDIRP4
ARGP4
ADDRLP4 1488
ADDRGP4 BotChatTime
CALLF4
ASGNF4
ADDRLP4 1484
INDIRP4
CNSTI4 6096
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 1488
INDIRF4
ADDF4
ASGNF4
line 5196
;5196:			AIEnter_Stand(bs, "BotDeathmatchAI: chat enter game");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2921
ARGP4
ADDRGP4 AIEnter_Stand
CALLV
pop
line 5197
;5197:		}
LABELV $2919
line 5198
;5198:		bs->entergamechat = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6024
ADDP4
CNSTI4 1
ASGNI4
line 5199
;5199:	}
LABELV $2917
line 5201
;5200:	//reset the node switches from the previous frame
;5201:	BotResetNodeSwitches();
ADDRGP4 BotResetNodeSwitches
CALLV
pop
line 5203
;5202:	//execute AI nodes
;5203:	for (i = 0; i < MAX_NODESWITCHES; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2922
line 5204
;5204:		if (bs->ainode(bs)) break;
ADDRLP4 1480
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1480
INDIRP4
ARGP4
ADDRLP4 1484
ADDRLP4 1480
INDIRP4
CNSTI4 4900
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 1484
INDIRI4
CNSTI4 0
EQI4 $2926
ADDRGP4 $2924
JUMPV
LABELV $2926
line 5205
;5205:	}
LABELV $2923
line 5203
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 50
LTI4 $2922
LABELV $2924
line 5207
;5206:	//if the bot removed itself :)
;5207:	if (!bs->inuse) return;
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $2928
ADDRGP4 $2896
JUMPV
LABELV $2928
line 5209
;5208:	//if the bot executed too many AI nodes
;5209:	if (i >= MAX_NODESWITCHES) {
ADDRLP4 0
INDIRI4
CNSTI4 50
LTI4 $2930
line 5210
;5210:		trap_BotDumpGoalStack(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotDumpGoalStack
CALLV
pop
line 5211
;5211:		trap_BotDumpAvoidGoals(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotDumpAvoidGoals
CALLV
pop
line 5212
;5212:		BotDumpNodeSwitches(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotDumpNodeSwitches
CALLV
pop
line 5213
;5213:		ClientName(bs->client, name, sizeof(name));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 5214
;5214:		BotAI_Print(PRT_ERROR, "%s at %1.1f switched more than %d AI nodes\n", name, FloatTime(), MAX_NODESWITCHES);
CNSTI4 3
ARGI4
ADDRGP4 $2932
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 floattime
INDIRF4
ARGF4
CNSTI4 50
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 5215
;5215:	}
LABELV $2930
line 5217
;5216:	//
;5217:	bs->lastframe_health = bs->inventory[INVENTORY_HEALTH];
ADDRLP4 1480
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1480
INDIRP4
CNSTI4 6044
ADDP4
ADDRLP4 1480
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
ASGNI4
line 5218
;5218:	bs->lasthitcount = bs->cur_ps.persistant[PERS_HITS];
ADDRLP4 1484
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1484
INDIRP4
CNSTI4 6048
ADDP4
ADDRLP4 1484
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
ASGNI4
line 5219
;5219:}
LABELV $2896
endproc BotDeathmatchAI 1492 20
export BotSetEntityNumForGoalWithModel
proc BotSetEntityNumForGoalWithModel 44 4
line 5226
;5220:
;5221:/*
;5222:==================
;5223:BotSetEntityNumForGoalWithModel
;5224:==================
;5225:*/
;5226:void BotSetEntityNumForGoalWithModel(bot_goal_t *goal, int eType, char *modelname) {
line 5231
;5227:	gentity_t *ent;
;5228:	int i, modelindex;
;5229:	vec3_t dir;
;5230:
;5231:	modelindex = G_ModelIndex( modelname );
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 24
INDIRI4
ASGNI4
line 5232
;5232:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 5233
;5233:	for (i = 0; i < level.num_entities; i++, ent++) {
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 $2937
JUMPV
LABELV $2934
line 5234
;5234:		if ( !ent->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2939
line 5235
;5235:			continue;
ADDRGP4 $2935
JUMPV
LABELV $2939
line 5237
;5236:		}
;5237:		if ( eType && ent->s.eType != eType) {
ADDRLP4 28
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $2941
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $2941
line 5238
;5238:			continue;
ADDRGP4 $2935
JUMPV
LABELV $2941
line 5240
;5239:		}
;5240:		if (ent->s.modelindex != modelindex) {
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $2943
line 5241
;5241:			continue;
ADDRGP4 $2935
JUMPV
LABELV $2943
line 5243
;5242:		}
;5243:		VectorSubtract(goal->origin, ent->s.origin, dir);
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 5244
;5244:		if (VectorLengthSquared(dir) < Square(10)) {
ADDRLP4 4
ARGP4
ADDRLP4 40
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 40
INDIRF4
CNSTF4 1120403456
GEF4 $2947
line 5245
;5245:			goal->entitynum = i;
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 5246
;5246:			return;
ADDRGP4 $2933
JUMPV
LABELV $2947
line 5248
;5247:		}
;5248:	}
LABELV $2935
line 5233
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 824
ADDP4
ASGNP4
LABELV $2937
ADDRLP4 16
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $2934
line 5249
;5249:}
LABELV $2933
endproc BotSetEntityNumForGoalWithModel 44 4
export BotSetEntityNumForGoal
proc BotSetEntityNumForGoal 36 8
line 5256
;5250:
;5251:/*
;5252:==================
;5253:BotSetEntityNumForGoal
;5254:==================
;5255:*/
;5256:void BotSetEntityNumForGoal(bot_goal_t *goal, char *classname) {
line 5261
;5257:	gentity_t *ent;
;5258:	int i;
;5259:	vec3_t dir;
;5260:
;5261:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 5262
;5262:	for (i = 0; i < level.num_entities; i++, ent++) {
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 $2953
JUMPV
LABELV $2950
line 5263
;5263:		if ( !ent->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2955
line 5264
;5264:			continue;
ADDRGP4 $2951
JUMPV
LABELV $2955
line 5266
;5265:		}
;5266:		if ( !Q_stricmp(ent->classname, classname) ) {
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $2957
line 5267
;5267:			continue;
ADDRGP4 $2951
JUMPV
LABELV $2957
line 5269
;5268:		}
;5269:		VectorSubtract(goal->origin, ent->s.origin, dir);
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 5270
;5270:		if (VectorLengthSquared(dir) < Square(10)) {
ADDRLP4 4
ARGP4
ADDRLP4 32
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 32
INDIRF4
CNSTF4 1120403456
GEF4 $2961
line 5271
;5271:			goal->entitynum = i;
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 5272
;5272:			return;
ADDRGP4 $2949
JUMPV
LABELV $2961
line 5274
;5273:		}
;5274:	}
LABELV $2951
line 5262
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 824
ADDP4
ASGNP4
LABELV $2953
ADDRLP4 16
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $2950
line 5275
;5275:}
LABELV $2949
endproc BotSetEntityNumForGoal 36 8
export BotGoalForBSPEntity
proc BotGoalForBSPEntity 1128 20
line 5282
;5276:
;5277:/*
;5278:==================
;5279:BotGoalForBSPEntity
;5280:==================
;5281:*/
;5282:int BotGoalForBSPEntity( char *classname, bot_goal_t *goal ) {
line 5287
;5283:	char value[MAX_INFO_STRING];
;5284:	vec3_t origin, start, end;
;5285:	int ent, numareas, areas[10];
;5286:
;5287:	memset(goal, 0, sizeof(bot_goal_t));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 memset
CALLP4
pop
line 5288
;5288:	for (ent = trap_AAS_NextBSPEntity(0); ent; ent = trap_AAS_NextBSPEntity(ent)) {
CNSTI4 0
ARGI4
ADDRLP4 1108
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1108
INDIRI4
ASGNI4
ADDRGP4 $2967
JUMPV
LABELV $2964
line 5289
;5289:		if (!trap_AAS_ValueForBSPEpairKey(ent, "classname", value, sizeof(value)))
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $2462
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1112
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
NEI4 $2968
line 5290
;5290:			continue;
ADDRGP4 $2965
JUMPV
LABELV $2968
line 5291
;5291:		if (!strcmp(value, classname)) {
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1116
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $2970
line 5292
;5292:			if (!trap_AAS_VectorForBSPEpairKey(ent, "origin", origin))
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $2478
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 1120
ADDRGP4 trap_AAS_VectorForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 1120
INDIRI4
CNSTI4 0
NEI4 $2972
line 5293
;5293:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2963
JUMPV
LABELV $2972
line 5294
;5294:			VectorCopy(origin, goal->origin);
ADDRFP4 4
INDIRP4
ADDRLP4 1028
INDIRB
ASGNB 12
line 5295
;5295:			VectorCopy(origin, start);
ADDRLP4 1040
ADDRLP4 1028
INDIRB
ASGNB 12
line 5296
;5296:			start[2] -= 32;
ADDRLP4 1040+8
ADDRLP4 1040+8
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 5297
;5297:			VectorCopy(origin, end);
ADDRLP4 1052
ADDRLP4 1028
INDIRB
ASGNB 12
line 5298
;5298:			end[2] += 32;
ADDRLP4 1052+8
ADDRLP4 1052+8
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 5299
;5299:			numareas = trap_AAS_TraceAreas(start, end, areas, NULL, 10);
ADDRLP4 1040
ARGP4
ADDRLP4 1052
ARGP4
ADDRLP4 1068
ARGP4
CNSTP4 0
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 1124
ADDRGP4 trap_AAS_TraceAreas
CALLI4
ASGNI4
ADDRLP4 1064
ADDRLP4 1124
INDIRI4
ASGNI4
line 5300
;5300:			if (!numareas)
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $2976
line 5301
;5301:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2963
JUMPV
LABELV $2976
line 5302
;5302:			goal->areanum = areas[0];
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 1068
INDIRI4
ASGNI4
line 5303
;5303:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2963
JUMPV
LABELV $2970
line 5305
;5304:		}
;5305:	}
LABELV $2965
line 5288
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1112
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1112
INDIRI4
ASGNI4
LABELV $2967
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2964
line 5306
;5306:	return qfalse;
CNSTI4 0
RETI4
LABELV $2963
endproc BotGoalForBSPEntity 1128 20
export BotSetupDeathmatchAI
proc BotSetupDeathmatchAI 152 16
line 5314
;5307:}
;5308:
;5309:/*
;5310:==================
;5311:BotSetupDeathmatchAI
;5312:==================
;5313:*/
;5314:void BotSetupDeathmatchAI(void) {
line 5318
;5315:	int ent, modelnum;
;5316:	char model[128];
;5317:
;5318:	gametype = trap_Cvar_VariableIntegerValue( "g_gametype" );
ADDRGP4 $2979
ARGP4
ADDRLP4 136
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRGP4 gametype
ADDRLP4 136
INDIRI4
ASGNI4
line 5320
;5319:
;5320:	trap_Cvar_Register(&bot_rocketjump, "bot_rocketjump", "1", 0);
ADDRGP4 bot_rocketjump
ARGP4
ADDRGP4 $2980
ARGP4
ADDRGP4 $2712
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5321
;5321:	trap_Cvar_Register(&bot_grapple, "bot_grapple", "0", 0);
ADDRGP4 bot_grapple
ARGP4
ADDRGP4 $2981
ARGP4
ADDRGP4 $2982
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5322
;5322:	trap_Cvar_Register(&bot_fastchat, "bot_fastchat", "0", 0);
ADDRGP4 bot_fastchat
ARGP4
ADDRGP4 $2983
ARGP4
ADDRGP4 $2982
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5323
;5323:	trap_Cvar_Register(&bot_nochat, "bot_nochat", "0", 0);
ADDRGP4 bot_nochat
ARGP4
ADDRGP4 $2984
ARGP4
ADDRGP4 $2982
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5324
;5324:	trap_Cvar_Register(&bot_testrchat, "bot_testrchat", "0", 0);
ADDRGP4 bot_testrchat
ARGP4
ADDRGP4 $2711
ARGP4
ADDRGP4 $2982
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5325
;5325:	trap_Cvar_Register(&bot_challenge, "bot_challenge", "0", 0);
ADDRGP4 bot_challenge
ARGP4
ADDRGP4 $2985
ARGP4
ADDRGP4 $2982
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5326
;5326:	trap_Cvar_Register(&bot_predictobstacles, "bot_predictobstacles", "1", 0);
ADDRGP4 bot_predictobstacles
ARGP4
ADDRGP4 $2986
ARGP4
ADDRGP4 $2712
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5327
;5327:	trap_Cvar_Register(&g_spSkill, "g_spSkill", "2", 0);
ADDRGP4 g_spSkill
ARGP4
ADDRGP4 $2987
ARGP4
ADDRGP4 $2988
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5329
;5328:	//
;5329:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $2989
line 5330
;5330:		if (trap_BotGetLevelItemGoal(-1, "Red Flag", &ctf_redflag) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $2993
ARGP4
ADDRGP4 ctf_redflag
ARGP4
ADDRLP4 140
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
GEI4 $2991
line 5331
;5331:			BotAI_Print(PRT_WARNING, "CTF without Red Flag\n");
CNSTI4 2
ARGI4
ADDRGP4 $2994
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $2991
line 5332
;5332:		if (trap_BotGetLevelItemGoal(-1, "Blue Flag", &ctf_blueflag) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $2997
ARGP4
ADDRGP4 ctf_blueflag
ARGP4
ADDRLP4 144
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
GEI4 $2990
line 5333
;5333:			BotAI_Print(PRT_WARNING, "CTF without Blue Flag\n");
CNSTI4 2
ARGI4
ADDRGP4 $2998
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 5334
;5334:	}
ADDRGP4 $2990
JUMPV
LABELV $2989
line 5335
;5335:	else if (gametype == GT_ONEFLAG) {
ADDRGP4 gametype
INDIRI4
CNSTI4 5
NEI4 $2999
line 5336
;5336:		if (trap_BotGetLevelItemGoal(-1, "Neutral Flag", &ctf_neutralflag) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $2865
ARGP4
ADDRGP4 ctf_neutralflag
ARGP4
ADDRLP4 140
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
GEI4 $3001
line 5337
;5337:			BotAI_Print(PRT_WARNING, "One Flag CTF without Neutral Flag\n");
CNSTI4 2
ARGI4
ADDRGP4 $3003
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $3001
line 5338
;5338:		if (trap_BotGetLevelItemGoal(-1, "Red Flag", &ctf_redflag) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $2993
ARGP4
ADDRGP4 ctf_redflag
ARGP4
ADDRLP4 144
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
GEI4 $3004
line 5339
;5339:			BotAI_Print(PRT_WARNING, "One Flag CTF without Red Flag\n");
CNSTI4 2
ARGI4
ADDRGP4 $3006
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $3004
line 5340
;5340:		if (trap_BotGetLevelItemGoal(-1, "Blue Flag", &ctf_blueflag) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $2997
ARGP4
ADDRGP4 ctf_blueflag
ARGP4
ADDRLP4 148
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
GEI4 $3000
line 5341
;5341:			BotAI_Print(PRT_WARNING, "One Flag CTF without Blue Flag\n");
CNSTI4 2
ARGI4
ADDRGP4 $3009
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 5342
;5342:	}
ADDRGP4 $3000
JUMPV
LABELV $2999
line 5343
;5343:	else if (gametype == GT_OVERLOAD) {
ADDRGP4 gametype
INDIRI4
CNSTI4 6
NEI4 $3010
line 5344
;5344:		if (trap_BotGetLevelItemGoal(-1, "Red Obelisk", &redobelisk) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $3014
ARGP4
ADDRGP4 redobelisk
ARGP4
ADDRLP4 140
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
GEI4 $3012
line 5345
;5345:			BotAI_Print(PRT_WARNING, "Obelisk without red obelisk\n");
CNSTI4 2
ARGI4
ADDRGP4 $3015
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $3012
line 5346
;5346:		BotSetEntityNumForGoal(&redobelisk, "team_redobelisk");
ADDRGP4 redobelisk
ARGP4
ADDRGP4 $3016
ARGP4
ADDRGP4 BotSetEntityNumForGoal
CALLV
pop
line 5347
;5347:		if (trap_BotGetLevelItemGoal(-1, "Blue Obelisk", &blueobelisk) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $3019
ARGP4
ADDRGP4 blueobelisk
ARGP4
ADDRLP4 144
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
GEI4 $3017
line 5348
;5348:			BotAI_Print(PRT_WARNING, "Obelisk without blue obelisk\n");
CNSTI4 2
ARGI4
ADDRGP4 $3020
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $3017
line 5349
;5349:		BotSetEntityNumForGoal(&blueobelisk, "team_blueobelisk");
ADDRGP4 blueobelisk
ARGP4
ADDRGP4 $3021
ARGP4
ADDRGP4 BotSetEntityNumForGoal
CALLV
pop
line 5350
;5350:	}
ADDRGP4 $3011
JUMPV
LABELV $3010
line 5351
;5351:	else if (gametype == GT_HARVESTER) {
ADDRGP4 gametype
INDIRI4
CNSTI4 7
NEI4 $3022
line 5352
;5352:		if (trap_BotGetLevelItemGoal(-1, "Red Obelisk", &redobelisk) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $3014
ARGP4
ADDRGP4 redobelisk
ARGP4
ADDRLP4 140
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
GEI4 $3024
line 5353
;5353:			BotAI_Print(PRT_WARNING, "Harvester without red obelisk\n");
CNSTI4 2
ARGI4
ADDRGP4 $3026
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $3024
line 5354
;5354:		BotSetEntityNumForGoal(&redobelisk, "team_redobelisk");
ADDRGP4 redobelisk
ARGP4
ADDRGP4 $3016
ARGP4
ADDRGP4 BotSetEntityNumForGoal
CALLV
pop
line 5355
;5355:		if (trap_BotGetLevelItemGoal(-1, "Blue Obelisk", &blueobelisk) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $3019
ARGP4
ADDRGP4 blueobelisk
ARGP4
ADDRLP4 144
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
GEI4 $3027
line 5356
;5356:			BotAI_Print(PRT_WARNING, "Harvester without blue obelisk\n");
CNSTI4 2
ARGI4
ADDRGP4 $3029
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $3027
line 5357
;5357:		BotSetEntityNumForGoal(&blueobelisk, "team_blueobelisk");
ADDRGP4 blueobelisk
ARGP4
ADDRGP4 $3021
ARGP4
ADDRGP4 BotSetEntityNumForGoal
CALLV
pop
line 5358
;5358:		if (trap_BotGetLevelItemGoal(-1, "Neutral Obelisk", &neutralobelisk) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $2884
ARGP4
ADDRGP4 neutralobelisk
ARGP4
ADDRLP4 148
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
GEI4 $3030
line 5359
;5359:			BotAI_Print(PRT_WARNING, "Harvester without neutral obelisk\n");
CNSTI4 2
ARGI4
ADDRGP4 $2885
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $3030
line 5360
;5360:		BotSetEntityNumForGoal(&neutralobelisk, "team_neutralobelisk");
ADDRGP4 neutralobelisk
ARGP4
ADDRGP4 $3032
ARGP4
ADDRGP4 BotSetEntityNumForGoal
CALLV
pop
line 5361
;5361:	}
LABELV $3022
LABELV $3011
LABELV $3000
LABELV $2990
line 5363
;5362:
;5363:	max_bspmodelindex = 0;
ADDRGP4 max_bspmodelindex
CNSTI4 0
ASGNI4
line 5364
;5364:	for (ent = trap_AAS_NextBSPEntity(0); ent; ent = trap_AAS_NextBSPEntity(ent)) {
CNSTI4 0
ARGI4
ADDRLP4 140
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 140
INDIRI4
ASGNI4
ADDRGP4 $3036
JUMPV
LABELV $3033
line 5365
;5365:		if (!trap_AAS_ValueForBSPEpairKey(ent, "model", model, sizeof(model))) continue;
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $526
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 144
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
NEI4 $3037
ADDRGP4 $3034
JUMPV
LABELV $3037
line 5366
;5366:		if (model[0] == '*') {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $3039
line 5367
;5367:			modelnum = atoi(model+1);
ADDRLP4 4+1
ARGP4
ADDRLP4 148
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 132
ADDRLP4 148
INDIRI4
ASGNI4
line 5368
;5368:			if (modelnum > max_bspmodelindex)
ADDRLP4 132
INDIRI4
ADDRGP4 max_bspmodelindex
INDIRI4
LEI4 $3042
line 5369
;5369:				max_bspmodelindex = modelnum;
ADDRGP4 max_bspmodelindex
ADDRLP4 132
INDIRI4
ASGNI4
LABELV $3042
line 5370
;5370:		}
LABELV $3039
line 5371
;5371:	}
LABELV $3034
line 5364
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 144
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 144
INDIRI4
ASGNI4
LABELV $3036
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $3033
line 5373
;5372:	//initialize the waypoint heap
;5373:	BotInitWaypoints();
ADDRGP4 BotInitWaypoints
CALLV
pop
line 5374
;5374:}
LABELV $2978
endproc BotSetupDeathmatchAI 152 16
export BotShutdownDeathmatchAI
proc BotShutdownDeathmatchAI 0 0
line 5381
;5375:
;5376:/*
;5377:==================
;5378:BotShutdownDeathmatchAI
;5379:==================
;5380:*/
;5381:void BotShutdownDeathmatchAI(void) {
line 5382
;5382:	altroutegoals_setup = qfalse;
ADDRGP4 altroutegoals_setup
CNSTI4 0
ASGNI4
line 5383
;5383:}
LABELV $3044
endproc BotShutdownDeathmatchAI 0 0
import g_clients
bss
export blue_numaltroutegoals
align 4
LABELV blue_numaltroutegoals
skip 4
export blue_altroutegoals
align 4
LABELV blue_altroutegoals
skip 768
export red_numaltroutegoals
align 4
LABELV red_numaltroutegoals
skip 4
export red_altroutegoals
align 4
LABELV red_altroutegoals
skip 768
export altroutegoals_setup
align 4
LABELV altroutegoals_setup
skip 4
export max_bspmodelindex
align 4
LABELV max_bspmodelindex
skip 4
export lastteleport_time
align 4
LABELV lastteleport_time
skip 4
export lastteleport_origin
align 4
LABELV lastteleport_origin
skip 12
import bot_developer
export g_spSkill
align 4
LABELV g_spSkill
skip 272
export bot_predictobstacles
align 4
LABELV bot_predictobstacles
skip 272
export botai_freewaypoints
align 4
LABELV botai_freewaypoints
skip 4
export botai_waypoints
align 4
LABELV botai_waypoints
skip 12800
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
export neutralobelisk
align 4
LABELV neutralobelisk
skip 56
export blueobelisk
align 4
LABELV blueobelisk
skip 56
export redobelisk
align 4
LABELV redobelisk
skip 56
export ctf_neutralflag
align 4
LABELV ctf_neutralflag
skip 56
export ctf_blueflag
align 4
LABELV ctf_blueflag
skip 56
export ctf_redflag
align 4
LABELV ctf_redflag
skip 56
export bot_challenge
align 4
LABELV bot_challenge
skip 272
export bot_testrchat
align 4
LABELV bot_testrchat
skip 272
export bot_nochat
align 4
LABELV bot_nochat
skip 272
export bot_fastchat
align 4
LABELV bot_fastchat
skip 272
export bot_rocketjump
align 4
LABELV bot_rocketjump
skip 272
export bot_grapple
align 4
LABELV bot_grapple
skip 272
import mapname
export gametype
align 4
LABELV gametype
skip 4
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
LABELV $3032
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 110
byte 1 101
byte 1 117
byte 1 116
byte 1 114
byte 1 97
byte 1 108
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $3029
byte 1 72
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 10
byte 1 0
align 1
LABELV $3026
byte 1 72
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 10
byte 1 0
align 1
LABELV $3021
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $3020
byte 1 79
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 10
byte 1 0
align 1
LABELV $3019
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
LABELV $3016
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $3015
byte 1 79
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 10
byte 1 0
align 1
LABELV $3014
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
LABELV $3009
byte 1 79
byte 1 110
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 67
byte 1 84
byte 1 70
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $3006
byte 1 79
byte 1 110
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 67
byte 1 84
byte 1 70
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $3003
byte 1 79
byte 1 110
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 67
byte 1 84
byte 1 70
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
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
byte 1 10
byte 1 0
align 1
LABELV $2998
byte 1 67
byte 1 84
byte 1 70
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $2997
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
LABELV $2994
byte 1 67
byte 1 84
byte 1 70
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $2993
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
LABELV $2988
byte 1 50
byte 1 0
align 1
LABELV $2987
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $2986
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 111
byte 1 98
byte 1 115
byte 1 116
byte 1 97
byte 1 99
byte 1 108
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $2985
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 99
byte 1 104
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $2984
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 110
byte 1 111
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $2983
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 102
byte 1 97
byte 1 115
byte 1 116
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $2982
byte 1 48
byte 1 0
align 1
LABELV $2981
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 112
byte 1 112
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $2980
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $2979
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $2932
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 101
byte 1 100
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 65
byte 1 73
byte 1 32
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2921
byte 1 66
byte 1 111
byte 1 116
byte 1 68
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 65
byte 1 73
byte 1 58
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $2916
byte 1 66
byte 1 111
byte 1 116
byte 1 68
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 65
byte 1 73
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 97
byte 1 105
byte 1 32
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $2905
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $2901
byte 1 115
byte 1 101
byte 1 120
byte 1 0
align 1
LABELV $2885
byte 1 72
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 110
byte 1 101
byte 1 117
byte 1 116
byte 1 114
byte 1 97
byte 1 108
byte 1 32
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 10
byte 1 0
align 1
LABELV $2884
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
LABELV $2866
byte 1 110
byte 1 111
byte 1 32
byte 1 97
byte 1 108
byte 1 116
byte 1 32
byte 1 114
byte 1 111
byte 1 117
byte 1 116
byte 1 101
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
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
byte 1 10
byte 1 0
align 1
LABELV $2865
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
LABELV $2826
byte 1 42
byte 1 102
byte 1 97
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $2823
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 69
byte 1 78
byte 1 69
byte 1 82
byte 1 65
byte 1 76
byte 1 95
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 58
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 80
byte 1 97
byte 1 114
byte 1 109
byte 1 32
byte 1 40
byte 1 37
byte 1 100
byte 1 41
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
byte 1 10
byte 1 0
align 1
LABELV $2784
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $2781
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
LABELV $2780
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 107
byte 1 97
byte 1 109
byte 1 105
byte 1 107
byte 1 97
byte 1 122
byte 1 101
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $2777
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 76
byte 1 79
byte 1 66
byte 1 65
byte 1 76
byte 1 95
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 58
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 80
byte 1 97
byte 1 114
byte 1 109
byte 1 32
byte 1 40
byte 1 37
byte 1 100
byte 1 41
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
byte 1 10
byte 1 0
align 1
LABELV $2723
byte 1 66
byte 1 111
byte 1 116
byte 1 67
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 67
byte 1 111
byte 1 110
byte 1 115
byte 1 111
byte 1 108
byte 1 101
byte 1 77
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 115
byte 1 58
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 121
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $2716
byte 1 42
byte 1 42
byte 1 42
byte 1 42
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 121
byte 1 32
byte 1 42
byte 1 42
byte 1 42
byte 1 42
byte 1 10
byte 1 0
align 1
LABELV $2715
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 10
byte 1 0
align 1
LABELV $2712
byte 1 49
byte 1 0
align 1
LABELV $2711
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $2588
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 73
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 97
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $2587
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 73
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 97
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $2583
byte 1 66
byte 1 111
byte 1 116
byte 1 71
byte 1 111
byte 1 70
byte 1 111
byte 1 114
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 71
byte 1 111
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $2571
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $2570
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 114
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $2567
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2556
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 109
byte 1 117
byte 1 108
byte 1 116
byte 1 105
byte 1 112
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $2543
byte 1 66
byte 1 111
byte 1 116
byte 1 71
byte 1 101
byte 1 116
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 71
byte 1 111
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $2537
byte 1 66
byte 1 111
byte 1 116
byte 1 71
byte 1 101
byte 1 116
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 71
byte 1 111
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $2529
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $2518
byte 1 66
byte 1 111
byte 1 116
byte 1 71
byte 1 101
byte 1 116
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 71
byte 1 111
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $2514
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $2511
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $2478
byte 1 111
byte 1 114
byte 1 105
byte 1 103
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $2473
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $2468
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 100
byte 1 111
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $2465
byte 1 66
byte 1 111
byte 1 116
byte 1 71
byte 1 101
byte 1 116
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 71
byte 1 111
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $2462
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $2461
byte 1 66
byte 1 111
byte 1 116
byte 1 71
byte 1 101
byte 1 116
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 71
byte 1 111
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2449
byte 1 42
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $2268
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $2245
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $2242
byte 1 108
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $2204
byte 1 109
byte 1 112
byte 1 113
byte 1 51
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 121
byte 1 54
byte 1 0
align 1
LABELV $2149
byte 1 113
byte 1 51
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 121
byte 1 54
byte 1 0
align 1
LABELV $1231
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
LABELV $1230
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1229
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
LABELV $1228
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
LABELV $1227
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
LABELV $1026
byte 1 66
byte 1 111
byte 1 116
byte 1 67
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 87
byte 1 97
byte 1 121
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 79
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 119
byte 1 97
byte 1 121
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $680
byte 1 119
byte 1 97
byte 1 110
byte 1 116
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $675
byte 1 119
byte 1 97
byte 1 110
byte 1 116
byte 1 111
byte 1 102
byte 1 102
byte 1 101
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $526
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $525
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 83
byte 1 107
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
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
byte 1 10
byte 1 0
align 1
LABELV $521
byte 1 110
byte 1 0
align 1
LABELV $520
byte 1 91
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
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
byte 1 93
byte 1 0
align 1
LABELV $519
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
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
byte 1 10
byte 1 0
align 1
LABELV $163
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $162
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
LABELV $73
byte 1 116
byte 1 0
