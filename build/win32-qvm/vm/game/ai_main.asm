export BotAI_Print
code
proc BotAI_Print 2056 12
file "..\..\..\..\code\game\ai_main.c"
line 74
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:/*****************************************************************************
;5: * name:		ai_main.c
;6: *
;7: * desc:		Quake3 bot AI
;8: *
;9: * $Archive: /MissionPack/code/game/ai_main.c $
;10: *
;11: *****************************************************************************/
;12:
;13:
;14:#include "g_local.h"
;15:#include "../qcommon/q_shared.h"
;16:#include "../botlib/botlib.h"
;17:#include "../botlib/be_aas.h"
;18:#include "../botlib/be_ea.h"
;19:#include "../botlib/be_ai_char.h"
;20:#include "../botlib/be_ai_chat.h"
;21:#include "../botlib/be_ai_gen.h"
;22:#include "../botlib/be_ai_goal.h"
;23:#include "../botlib/be_ai_move.h"
;24:#include "../botlib/be_ai_weap.h"
;25://
;26:#include "ai_main.h"
;27:#include "ai_dmq3.h"
;28:#include "ai_chat.h"
;29:#include "ai_cmd.h"
;30:#include "ai_dmnet.h"
;31:
;32://
;33:#include "chars.h"
;34:#include "inv.h"
;35:#include "syn.h"
;36:
;37:#define MAX_PATH		144
;38:
;39://bot states
;40:bot_state_t	*botstates[MAX_CLIENTS];
;41://number of bots
;42:int numbots;
;43://floating point time
;44:float floattime;
;45://time to do a regular update
;46:float regularupdate_time;
;47://
;48:int bot_interbreed;
;49:int bot_interbreedmatchcount;
;50://
;51:vmCvar_t bot_thinktime;
;52:vmCvar_t bot_memorydump;
;53:vmCvar_t bot_saveroutingcache;
;54:vmCvar_t bot_pause;
;55:vmCvar_t bot_report;
;56:vmCvar_t bot_testsolid;
;57:vmCvar_t bot_testclusters;
;58:vmCvar_t bot_developer;
;59:vmCvar_t bot_interbreedchar;
;60:vmCvar_t bot_interbreedbots;
;61:vmCvar_t bot_interbreedcycle;
;62:vmCvar_t bot_interbreedwrite;
;63:
;64:char mapname[MAX_QPATH];
;65:
;66:void ExitLevel( void );
;67:
;68:
;69:/*
;70:==================
;71:BotAI_Print
;72:==================
;73:*/
;74:void QDECL BotAI_Print( int type, const char *fmt, ... ) {
line 78
;75:	char str[2048];
;76:	va_list ap;
;77:
;78:	va_start(ap, fmt);
ADDRLP4 0
ADDRFP4 4+4
ASGNP4
line 79
;79:	ED_vsprintf(str, fmt, ap);
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ED_vsprintf
CALLI4
pop
line 80
;80:	va_end(ap);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 82
;81:
;82:	switch(type) {
ADDRLP4 2052
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 2052
INDIRI4
CNSTI4 1
LTI4 $58
ADDRLP4 2052
INDIRI4
CNSTI4 5
GTI4 $58
ADDRLP4 2052
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $71-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $71
address $60
address $62
address $64
address $66
address $68
code
LABELV $60
line 83
;83:		case PRT_MESSAGE: {
line 84
;84:			G_Printf("%s", str);
ADDRGP4 $61
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 85
;85:			break;
ADDRGP4 $59
JUMPV
LABELV $62
line 87
;86:		}
;87:		case PRT_WARNING: {
line 88
;88:			G_Printf( S_COLOR_YELLOW "Warning: %s", str );
ADDRGP4 $63
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 89
;89:			break;
ADDRGP4 $59
JUMPV
LABELV $64
line 91
;90:		}
;91:		case PRT_ERROR: {
line 92
;92:			G_Printf( S_COLOR_RED "Error: %s", str );
ADDRGP4 $65
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 93
;93:			break;
ADDRGP4 $59
JUMPV
LABELV $66
line 95
;94:		}
;95:		case PRT_FATAL: {
line 96
;96:			G_Printf( S_COLOR_RED "Fatal: %s", str );
ADDRGP4 $67
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 97
;97:			break;
ADDRGP4 $59
JUMPV
LABELV $68
line 99
;98:		}
;99:		case PRT_EXIT: {
line 100
;100:			G_Error( S_COLOR_RED "Exit: %s", str );
ADDRGP4 $69
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 101
;101:			break;
ADDRGP4 $59
JUMPV
LABELV $58
line 103
;102:		}
;103:		default: {
line 104
;104:			G_Printf( "unknown print type\n" );
ADDRGP4 $70
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 105
;105:			break;
LABELV $59
line 108
;106:		}
;107:	}
;108:}
LABELV $56
endproc BotAI_Print 2056 12
export BotAI_Trace
proc BotAI_Trace 56 28
line 116
;109:
;110:
;111:/*
;112:==================
;113:BotAI_Trace
;114:==================
;115:*/
;116:void BotAI_Trace(bsp_trace_t *bsptrace, vec3_t start, vec3_t mins, vec3_t maxs, vec3_t end, int passent, int contentmask) {
line 119
;117:	trace_t trace;
;118:
;119:	trap_Trace(&trace, start, mins, maxs, end, passent, contentmask);
ADDRLP4 0
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
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 121
;120:	//copy the trace information
;121:	bsptrace->allsolid = trace.allsolid;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ASGNI4
line 122
;122:	bsptrace->startsolid = trace.startsolid;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 0+4
INDIRI4
ASGNI4
line 123
;123:	bsptrace->fraction = trace.fraction;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0+8
INDIRF4
ASGNF4
line 124
;124:	VectorCopy(trace.endpos, bsptrace->endpos);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 125
;125:	bsptrace->plane.dist = trace.plane.dist;
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0+24+12
INDIRF4
ASGNF4
line 126
;126:	VectorCopy(trace.plane.normal, bsptrace->plane.normal);
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0+24
INDIRB
ASGNB 12
line 127
;127:	bsptrace->plane.signbits = trace.plane.signbits;
ADDRFP4 0
INDIRP4
CNSTI4 41
ADDP4
ADDRLP4 0+24+17
INDIRU1
ASGNU1
line 128
;128:	bsptrace->plane.type = trace.plane.type;
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0+24+16
INDIRU1
ASGNU1
line 129
;129:	bsptrace->surface.value = 0;
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 0
ASGNI4
line 130
;130:	bsptrace->surface.flags = trace.surfaceFlags;
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 0+44
INDIRI4
ASGNI4
line 131
;131:	bsptrace->ent = trace.entityNum;
ADDRFP4 0
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 0+52
INDIRI4
ASGNI4
line 132
;132:	bsptrace->exp_dist = 0;
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 0
ASGNF4
line 133
;133:	bsptrace->sidenum = 0;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 134
;134:	bsptrace->contents = trace.contents;
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 0+48
INDIRI4
ASGNI4
line 135
;135:}
LABELV $73
endproc BotAI_Trace 56 28
export BotAI_GetClientState
proc BotAI_GetClientState 4 12
line 142
;136:
;137:/*
;138:==================
;139:BotAI_GetClientState
;140:==================
;141:*/
;142:int BotAI_GetClientState( int clientNum, playerState_t *state ) {
line 145
;143:	gentity_t	*ent;
;144:
;145:	ent = &g_entities[clientNum];
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 146
;146:	if ( !ent->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $88
line 147
;147:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $87
JUMPV
LABELV $88
line 149
;148:	}
;149:	if ( !ent->client ) {
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $90
line 150
;150:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $87
JUMPV
LABELV $90
line 153
;151:	}
;152:
;153:	memcpy( state, &ent->client->ps, sizeof(playerState_t) );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
CNSTI4 468
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 154
;154:	return qtrue;
CNSTI4 1
RETI4
LABELV $87
endproc BotAI_GetClientState 4 12
export BotAI_GetEntityState
proc BotAI_GetEntityState 8 12
line 163
;155:}
;156:
;157:
;158:/*
;159:==================
;160:BotAI_GetEntityState
;161:==================
;162:*/
;163:qboolean BotAI_GetEntityState( int entityNum, entityState_t *state ) {
line 166
;164:	const gentity_t *ent;
;165:
;166:	ent = g_entities + entityNum;
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 168
;167:
;168:	if ( !ent->inuse || !ent->r.linked ) {
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $95
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
CNSTI4 0
NEI4 $93
LABELV $95
line 169
;169:		memset( state, 0, sizeof( entityState_t ) );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 208
ARGI4
ADDRGP4 memset
CALLP4
pop
line 170
;170:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $92
JUMPV
LABELV $93
line 173
;171:	}
;172:
;173:	if ( ent->r.svFlags & SVF_NOCLIENT ) {
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $96
line 174
;174:		memset( state, 0, sizeof( entityState_t ) );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 208
ARGI4
ADDRGP4 memset
CALLP4
pop
line 175
;175:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $92
JUMPV
LABELV $96
line 178
;176:	}
;177:
;178:	memcpy( state, &ent->s, sizeof(entityState_t) );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 208
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 179
;179:	return qtrue;
CNSTI4 1
RETI4
LABELV $92
endproc BotAI_GetEntityState 8 12
export BotAI_GetSnapshotEntity
proc BotAI_GetSnapshotEntity 8 12
line 188
;180:}
;181:
;182:
;183:/*
;184:==================
;185:BotAI_GetSnapshotEntity
;186:==================
;187:*/
;188:int BotAI_GetSnapshotEntity( int clientNum, int sequence, entityState_t *state ) {
line 191
;189:	int		entNum;
;190:
;191:	entNum = trap_BotGetSnapshotEntity( clientNum, sequence );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 trap_BotGetSnapshotEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 192
;192:	if ( entNum == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $99
line 193
;193:		memset(state, 0, sizeof(entityState_t));
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 208
ARGI4
ADDRGP4 memset
CALLP4
pop
line 194
;194:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $98
JUMPV
LABELV $99
line 197
;195:	}
;196:
;197:	BotAI_GetEntityState( entNum, state );
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 BotAI_GetEntityState
CALLI4
pop
line 199
;198:
;199:	return sequence + 1;
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
RETI4
LABELV $98
endproc BotAI_GetSnapshotEntity 8 12
export BotAI_BotInitialChat
proc BotAI_BotInitialChat 56 44
line 208
;200:}
;201:
;202:
;203:/*
;204:==================
;205:BotAI_BotInitialChat
;206:==================
;207:*/
;208:void QDECL BotAI_BotInitialChat( bot_state_t *bs, char *type, ... ) {
line 214
;209:	int		i, mcontext;
;210:	va_list	ap;
;211:	char	*p;
;212:	char	*vars[MAX_MATCHVARIABLES];
;213:
;214:	memset(vars, 0, sizeof(vars));
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
CNSTI4 32
ARGI4
ADDRGP4 memset
CALLP4
pop
line 215
;215:	va_start(ap, type);
ADDRLP4 40
ADDRFP4 4+4
ASGNP4
line 216
;216:	p = va_arg(ap, char *);
ADDRLP4 48
ADDRLP4 40
INDIRP4
CNSTU4 4
ADDP4
ASGNP4
ADDRLP4 40
ADDRLP4 48
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 48
INDIRP4
CNSTI4 -4
ADDP4
INDIRP4
ASGNP4
line 217
;217:	for (i = 0; i < MAX_MATCHVARIABLES; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $103
line 218
;218:		if( !p ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $107
line 219
;219:			break;
ADDRGP4 $105
JUMPV
LABELV $107
line 221
;220:		}
;221:		vars[i] = p;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 222
;222:		p = va_arg(ap, char *);
ADDRLP4 52
ADDRLP4 40
INDIRP4
CNSTU4 4
ADDP4
ASGNP4
ADDRLP4 40
ADDRLP4 52
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 52
INDIRP4
CNSTI4 -4
ADDP4
INDIRP4
ASGNP4
line 223
;223:	}
LABELV $104
line 217
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $103
LABELV $105
line 224
;224:	va_end(ap);
ADDRLP4 40
CNSTP4 0
ASGNP4
line 226
;225:
;226:	mcontext = BotSynonymContext(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 BotSynonymContext
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 52
INDIRI4
ASGNI4
line 228
;227:
;228:	trap_BotInitialChat( bs->cs, type, mcontext, vars[0], vars[1], vars[2], vars[3], vars[4], vars[5], vars[6], vars[7] );
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8+4
INDIRP4
ARGP4
ADDRLP4 8+8
INDIRP4
ARGP4
ADDRLP4 8+12
INDIRP4
ARGP4
ADDRLP4 8+16
INDIRP4
ARGP4
ADDRLP4 8+20
INDIRP4
ARGP4
ADDRLP4 8+24
INDIRP4
ARGP4
ADDRLP4 8+28
INDIRP4
ARGP4
ADDRGP4 trap_BotInitialChat
CALLV
pop
line 229
;229:}
LABELV $101
endproc BotAI_BotInitialChat 56 44
export BotTestAAS
proc BotTestAAS 64 16
line 237
;230:
;231:
;232:/*
;233:==================
;234:BotTestAAS
;235:==================
;236:*/
;237:void BotTestAAS(vec3_t origin) {
line 241
;238:	int areanum;
;239:	aas_areainfo_t info;
;240:
;241:	trap_Cvar_Update(&bot_testsolid);
ADDRGP4 bot_testsolid
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 242
;242:	trap_Cvar_Update(&bot_testclusters);
ADDRGP4 bot_testclusters
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 243
;243:	if (bot_testsolid.integer) {
ADDRGP4 bot_testsolid+12
INDIRI4
CNSTI4 0
EQI4 $117
line 244
;244:		if (!trap_AAS_Initialized()) return;
ADDRLP4 56
ADDRGP4 trap_AAS_Initialized
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $120
ADDRGP4 $116
JUMPV
LABELV $120
line 245
;245:		areanum = BotPointAreaNum(origin);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 60
INDIRI4
ASGNI4
line 246
;246:		if (areanum) BotAI_Print(PRT_MESSAGE, "\rempty area");
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $122
CNSTI4 1
ARGI4
ADDRGP4 $124
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
ADDRGP4 $118
JUMPV
LABELV $122
line 247
;247:		else BotAI_Print(PRT_MESSAGE, "\r^1SOLID area");
CNSTI4 1
ARGI4
ADDRGP4 $125
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 248
;248:	}
ADDRGP4 $118
JUMPV
LABELV $117
line 249
;249:	else if (bot_testclusters.integer) {
ADDRGP4 bot_testclusters+12
INDIRI4
CNSTI4 0
EQI4 $126
line 250
;250:		if (!trap_AAS_Initialized()) return;
ADDRLP4 56
ADDRGP4 trap_AAS_Initialized
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $129
ADDRGP4 $116
JUMPV
LABELV $129
line 251
;251:		areanum = BotPointAreaNum(origin);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 60
INDIRI4
ASGNI4
line 252
;252:		if (!areanum)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $131
line 253
;253:			BotAI_Print(PRT_MESSAGE, "\r^1Solid!                              ");
CNSTI4 1
ARGI4
ADDRGP4 $133
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
ADDRGP4 $132
JUMPV
LABELV $131
line 254
;254:		else {
line 255
;255:			trap_AAS_AreaInfo(areanum, &info);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_AAS_AreaInfo
CALLI4
pop
line 256
;256:			BotAI_Print(PRT_MESSAGE, "\rarea %d, cluster %d       ", areanum, info.cluster);
CNSTI4 1
ARGI4
ADDRGP4 $134
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4+12
INDIRI4
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 257
;257:		}
LABELV $132
line 258
;258:	}
LABELV $126
LABELV $118
line 259
;259:}
LABELV $116
endproc BotTestAAS 64 16
export BotReportStatus
proc BotReportStatus 560 24
line 266
;260:
;261:/*
;262:==================
;263:BotReportStatus
;264:==================
;265:*/
;266:void BotReportStatus(bot_state_t *bs) {
line 271
;267:	char goalname[MAX_MESSAGE_SIZE];
;268:	char netname[MAX_MESSAGE_SIZE];
;269:	char *leader, flagstatus[32];
;270:	//
;271:	ClientName(bs->client, netname, sizeof(netname));
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
line 272
;272:	if (Q_stricmp(netname, bs->teamleader) == 0) leader = "L";
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 548
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 548
INDIRI4
CNSTI4 0
NEI4 $137
ADDRLP4 288
ADDRGP4 $139
ASGNP4
ADDRGP4 $138
JUMPV
LABELV $137
line 273
;273:	else leader = " ";
ADDRLP4 288
ADDRGP4 $140
ASGNP4
LABELV $138
line 275
;274:
;275:	strcpy(flagstatus, "  ");
ADDRLP4 256
ARGP4
ADDRGP4 $141
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 276
;276:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $142
line 277
;277:		if (BotCTFCarryingFlag(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 552
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 552
INDIRI4
CNSTI4 0
EQI4 $143
line 278
;278:			if (BotTeam(bs) == TEAM_RED) strcpy(flagstatus, S_COLOR_RED"F ");
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 556
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 556
INDIRI4
CNSTI4 1
NEI4 $146
ADDRLP4 256
ARGP4
ADDRGP4 $148
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $143
JUMPV
LABELV $146
line 279
;279:			else strcpy(flagstatus, S_COLOR_BLUE"F ");
ADDRLP4 256
ARGP4
ADDRGP4 $149
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 280
;280:		}
line 281
;281:	}
ADDRGP4 $143
JUMPV
LABELV $142
line 282
;282:	else if (gametype == GT_ONEFLAG) {
ADDRGP4 gametype
INDIRI4
CNSTI4 5
NEI4 $150
line 283
;283:		if (Bot1FCTFCarryingFlag(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 552
ADDRGP4 Bot1FCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 552
INDIRI4
CNSTI4 0
EQI4 $151
line 284
;284:			if (BotTeam(bs) == TEAM_RED) strcpy(flagstatus, S_COLOR_RED"F ");
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 556
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 556
INDIRI4
CNSTI4 1
NEI4 $154
ADDRLP4 256
ARGP4
ADDRGP4 $148
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $151
JUMPV
LABELV $154
line 285
;285:			else strcpy(flagstatus, S_COLOR_BLUE"F ");
ADDRLP4 256
ARGP4
ADDRGP4 $149
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 286
;286:		}
line 287
;287:	}
ADDRGP4 $151
JUMPV
LABELV $150
line 288
;288:	else if (gametype == GT_HARVESTER) {
ADDRGP4 gametype
INDIRI4
CNSTI4 7
NEI4 $156
line 289
;289:		if (BotHarvesterCarryingCubes(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 552
ADDRGP4 BotHarvesterCarryingCubes
CALLI4
ASGNI4
ADDRLP4 552
INDIRI4
CNSTI4 0
EQI4 $158
line 290
;290:			if (BotTeam(bs) == TEAM_RED) Com_sprintf(flagstatus, sizeof(flagstatus), S_COLOR_RED"%2d", bs->inventory[INVENTORY_REDCUBE]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 556
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 556
INDIRI4
CNSTI4 1
NEI4 $160
ADDRLP4 256
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $162
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 5144
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
ADDRGP4 $161
JUMPV
LABELV $160
line 291
;291:			else Com_sprintf(flagstatus, sizeof(flagstatus), S_COLOR_BLUE"%2d", bs->inventory[INVENTORY_BLUECUBE]);
ADDRLP4 256
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $163
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 5148
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
LABELV $161
line 292
;292:		}
LABELV $158
line 293
;293:	}
LABELV $156
LABELV $151
LABELV $143
line 295
;294:
;295:	switch(bs->ltgtype) {
ADDRLP4 552
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
ASGNI4
ADDRLP4 552
INDIRI4
CNSTI4 1
LTI4 $164
ADDRLP4 552
INDIRI4
CNSTI4 13
GTI4 $164
ADDRLP4 552
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $192-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $192
address $167
address $169
address $171
address $181
address $183
address $185
address $177
address $177
address $179
address $173
address $175
address $189
address $187
code
LABELV $167
line 297
;296:		case LTG_TEAMHELP:
;297:		{
line 298
;298:			EasyClientName(bs->teammate, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 292
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 299
;299:			BotAI_Print(PRT_MESSAGE, "%-20s%s%s: helping %s\n", netname, leader, flagstatus, goalname);
CNSTI4 1
ARGI4
ADDRGP4 $168
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRLP4 292
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 300
;300:			break;
ADDRGP4 $165
JUMPV
LABELV $169
line 303
;301:		}
;302:		case LTG_TEAMACCOMPANY:
;303:		{
line 304
;304:			EasyClientName(bs->teammate, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 292
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 305
;305:			BotAI_Print(PRT_MESSAGE, "%-20s%s%s: accompanying %s\n", netname, leader, flagstatus, goalname);
CNSTI4 1
ARGI4
ADDRGP4 $170
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRLP4 292
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 306
;306:			break;
ADDRGP4 $165
JUMPV
LABELV $171
line 309
;307:		}
;308:		case LTG_DEFENDKEYAREA:
;309:		{
line 310
;310:			trap_BotGoalName(bs->teamgoal.number, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 6668
ADDP4
INDIRI4
ARGI4
ADDRLP4 292
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 311
;311:			BotAI_Print(PRT_MESSAGE, "%-20s%s%s: defending %s\n", netname, leader, flagstatus, goalname);
CNSTI4 1
ARGI4
ADDRGP4 $172
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRLP4 292
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 312
;312:			break;
ADDRGP4 $165
JUMPV
LABELV $173
line 315
;313:		}
;314:		case LTG_GETITEM:
;315:		{
line 316
;316:			trap_BotGoalName(bs->teamgoal.number, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 6668
ADDP4
INDIRI4
ARGI4
ADDRLP4 292
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 317
;317:			BotAI_Print(PRT_MESSAGE, "%-20s%s%s: getting item %s\n", netname, leader, flagstatus, goalname);
CNSTI4 1
ARGI4
ADDRGP4 $174
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRLP4 292
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 318
;318:			break;
ADDRGP4 $165
JUMPV
LABELV $175
line 321
;319:		}
;320:		case LTG_KILL:
;321:		{
line 322
;322:			ClientName(bs->teamgoal.entitynum, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
INDIRI4
ARGI4
ADDRLP4 292
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 323
;323:			BotAI_Print(PRT_MESSAGE, "%-20s%s%s: killing %s\n", netname, leader, flagstatus, goalname);
CNSTI4 1
ARGI4
ADDRGP4 $176
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRLP4 292
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 324
;324:			break;
ADDRGP4 $165
JUMPV
LABELV $177
line 328
;325:		}
;326:		case LTG_CAMP:
;327:		case LTG_CAMPORDER:
;328:		{
line 329
;329:			BotAI_Print(PRT_MESSAGE, "%-20s%s%s: camping\n", netname, leader, flagstatus);
CNSTI4 1
ARGI4
ADDRGP4 $178
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 330
;330:			break;
ADDRGP4 $165
JUMPV
LABELV $179
line 333
;331:		}
;332:		case LTG_PATROL:
;333:		{
line 334
;334:			BotAI_Print(PRT_MESSAGE, "%-20s%s%s: patrolling\n", netname, leader, flagstatus);
CNSTI4 1
ARGI4
ADDRGP4 $180
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 335
;335:			break;
ADDRGP4 $165
JUMPV
LABELV $181
line 338
;336:		}
;337:		case LTG_GETFLAG:
;338:		{
line 339
;339:			BotAI_Print(PRT_MESSAGE, "%-20s%s%s: capturing flag\n", netname, leader, flagstatus);
CNSTI4 1
ARGI4
ADDRGP4 $182
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 340
;340:			break;
ADDRGP4 $165
JUMPV
LABELV $183
line 343
;341:		}
;342:		case LTG_RUSHBASE:
;343:		{
line 344
;344:			BotAI_Print(PRT_MESSAGE, "%-20s%s%s: rushing base\n", netname, leader, flagstatus);
CNSTI4 1
ARGI4
ADDRGP4 $184
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 345
;345:			break;
ADDRGP4 $165
JUMPV
LABELV $185
line 348
;346:		}
;347:		case LTG_RETURNFLAG:
;348:		{
line 349
;349:			BotAI_Print(PRT_MESSAGE, "%-20s%s%s: returning flag\n", netname, leader, flagstatus);
CNSTI4 1
ARGI4
ADDRGP4 $186
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 350
;350:			break;
ADDRGP4 $165
JUMPV
LABELV $187
line 353
;351:		}
;352:		case LTG_ATTACKENEMYBASE:
;353:		{
line 354
;354:			BotAI_Print(PRT_MESSAGE, "%-20s%s%s: attacking the enemy base\n", netname, leader, flagstatus);
CNSTI4 1
ARGI4
ADDRGP4 $188
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 355
;355:			break;
ADDRGP4 $165
JUMPV
LABELV $189
line 358
;356:		}
;357:		case LTG_HARVEST:
;358:		{
line 359
;359:			BotAI_Print(PRT_MESSAGE, "%-20s%s%s: harvesting\n", netname, leader, flagstatus);
CNSTI4 1
ARGI4
ADDRGP4 $190
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 360
;360:			break;
ADDRGP4 $165
JUMPV
LABELV $164
line 363
;361:		}
;362:		default:
;363:		{
line 364
;364:			BotAI_Print(PRT_MESSAGE, "%-20s%s%s: roaming\n", netname, leader, flagstatus);
CNSTI4 1
ARGI4
ADDRGP4 $191
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 365
;365:			break;
LABELV $165
line 368
;366:		}
;367:	}
;368:}
LABELV $136
endproc BotReportStatus 560 24
export BotTeamplayReport
proc BotTeamplayReport 1048 12
line 375
;369:
;370:/*
;371:==================
;372:BotTeamplayReport
;373:==================
;374:*/
;375:void BotTeamplayReport(void) {
line 379
;376:	int i;
;377:	char buf[MAX_INFO_STRING];
;378:
;379:	BotAI_Print(PRT_MESSAGE, S_COLOR_RED"RED\n");
CNSTI4 1
ARGI4
ADDRGP4 $195
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 380
;380:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $199
JUMPV
LABELV $196
line 382
;381:		//
;382:		if ( !botstates[i] || !botstates[i]->inuse ) continue;
ADDRLP4 1032
ADDRGP4 botstates
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1032
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $203
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1032
INDIRP4
ADDP4
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $201
LABELV $203
ADDRGP4 $197
JUMPV
LABELV $201
line 384
;383:		//
;384:		trap_GetConfigstring(CS_PLAYERS+i, buf, sizeof(buf));
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
line 386
;385:		//if no config string or no name
;386:		if (!buf[0] || !*Info_ValueForKey(buf, "n")) continue;
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $207
ADDRLP4 4
ARGP4
ADDRGP4 $206
ARGP4
ADDRLP4 1036
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1036
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $204
LABELV $207
ADDRGP4 $197
JUMPV
LABELV $204
line 388
;387:		//skip spectators
;388:		if (atoi(Info_ValueForKey(buf, "t")) == TEAM_RED) {
ADDRLP4 4
ARGP4
ADDRGP4 $210
ARGP4
ADDRLP4 1040
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1044
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 1
NEI4 $208
line 389
;389:			BotReportStatus(botstates[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotReportStatus
CALLV
pop
line 390
;390:		}
LABELV $208
line 391
;391:	}
LABELV $197
line 380
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $199
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $196
line 392
;392:	BotAI_Print(PRT_MESSAGE, S_COLOR_BLUE"BLUE\n");
CNSTI4 1
ARGI4
ADDRGP4 $211
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 393
;393:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $215
JUMPV
LABELV $212
line 395
;394:		//
;395:		if ( !botstates[i] || !botstates[i]->inuse ) continue;
ADDRLP4 1032
ADDRGP4 botstates
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1032
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $219
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1032
INDIRP4
ADDP4
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $217
LABELV $219
ADDRGP4 $213
JUMPV
LABELV $217
line 397
;396:		//
;397:		trap_GetConfigstring(CS_PLAYERS+i, buf, sizeof(buf));
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
line 399
;398:		//if no config string or no name
;399:		if (!buf[0] || !*Info_ValueForKey(buf, "n")) continue;
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $222
ADDRLP4 4
ARGP4
ADDRGP4 $206
ARGP4
ADDRLP4 1036
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1036
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $220
LABELV $222
ADDRGP4 $213
JUMPV
LABELV $220
line 401
;400:		//skip spectators
;401:		if (atoi(Info_ValueForKey(buf, "t")) == TEAM_BLUE) {
ADDRLP4 4
ARGP4
ADDRGP4 $210
ARGP4
ADDRLP4 1040
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1044
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 2
NEI4 $223
line 402
;402:			BotReportStatus(botstates[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotReportStatus
CALLV
pop
line 403
;403:		}
LABELV $223
line 404
;404:	}
LABELV $213
line 393
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $215
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $212
line 405
;405:}
LABELV $194
endproc BotTeamplayReport 1048 12
export BotSetInfoConfigString
proc BotSetInfoConfigString 880 16
line 412
;406:
;407:/*
;408:==================
;409:BotSetInfoConfigString
;410:==================
;411:*/
;412:void BotSetInfoConfigString(bot_state_t *bs) {
line 419
;413:	char goalname[MAX_MESSAGE_SIZE];
;414:	char netname[MAX_MESSAGE_SIZE];
;415:	char action[MAX_MESSAGE_SIZE];
;416:	char *leader, carrying[32], *cs;
;417:	bot_goal_t goal;
;418:	//
;419:	ClientName(bs->client, netname, sizeof(netname));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 256
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 420
;420:	if (Q_stricmp(netname, bs->teamleader) == 0) leader = "L";
ADDRLP4 256
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 864
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 864
INDIRI4
CNSTI4 0
NEI4 $226
ADDRLP4 544
ADDRGP4 $139
ASGNP4
ADDRGP4 $227
JUMPV
LABELV $226
line 421
;421:	else leader = " ";
ADDRLP4 544
ADDRGP4 $140
ASGNP4
LABELV $227
line 423
;422:
;423:	strcpy(carrying, "  ");
ADDRLP4 512
ARGP4
ADDRGP4 $141
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 424
;424:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $228
line 425
;425:		if (BotCTFCarryingFlag(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 868
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 868
INDIRI4
CNSTI4 0
EQI4 $229
line 426
;426:			strcpy(carrying, "F ");
ADDRLP4 512
ARGP4
ADDRGP4 $232
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 427
;427:		}
line 428
;428:	}
ADDRGP4 $229
JUMPV
LABELV $228
line 429
;429:	else if (gametype == GT_ONEFLAG) {
ADDRGP4 gametype
INDIRI4
CNSTI4 5
NEI4 $233
line 430
;430:		if (Bot1FCTFCarryingFlag(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 868
ADDRGP4 Bot1FCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 868
INDIRI4
CNSTI4 0
EQI4 $234
line 431
;431:			strcpy(carrying, "F ");
ADDRLP4 512
ARGP4
ADDRGP4 $232
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 432
;432:		}
line 433
;433:	}
ADDRGP4 $234
JUMPV
LABELV $233
line 434
;434:	else if (gametype == GT_HARVESTER) {
ADDRGP4 gametype
INDIRI4
CNSTI4 7
NEI4 $237
line 435
;435:		if (BotHarvesterCarryingCubes(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 868
ADDRGP4 BotHarvesterCarryingCubes
CALLI4
ASGNI4
ADDRLP4 868
INDIRI4
CNSTI4 0
EQI4 $239
line 436
;436:			if (BotTeam(bs) == TEAM_RED) Com_sprintf(carrying, sizeof(carrying), "%2d", bs->inventory[INVENTORY_REDCUBE]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 872
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 872
INDIRI4
CNSTI4 1
NEI4 $241
ADDRLP4 512
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $243
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 5144
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
ADDRGP4 $242
JUMPV
LABELV $241
line 437
;437:			else Com_sprintf(carrying, sizeof(carrying), "%2d", bs->inventory[INVENTORY_BLUECUBE]);
ADDRLP4 512
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $243
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 5148
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
LABELV $242
line 438
;438:		}
LABELV $239
line 439
;439:	}
LABELV $237
LABELV $234
LABELV $229
line 441
;440:
;441:	switch(bs->ltgtype) {
ADDRLP4 868
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
ASGNI4
ADDRLP4 868
INDIRI4
CNSTI4 1
LTI4 $244
ADDRLP4 868
INDIRI4
CNSTI4 13
GTI4 $244
ADDRLP4 868
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $273-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $273
address $247
address $249
address $251
address $261
address $263
address $265
address $257
address $257
address $259
address $253
address $255
address $269
address $267
code
LABELV $247
line 443
;442:		case LTG_TEAMHELP:
;443:		{
line 444
;444:			EasyClientName(bs->teammate, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 552
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 445
;445:			Com_sprintf(action, sizeof(action), "helping %s", goalname);
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $248
ARGP4
ADDRLP4 552
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 446
;446:			break;
ADDRGP4 $245
JUMPV
LABELV $249
line 449
;447:		}
;448:		case LTG_TEAMACCOMPANY:
;449:		{
line 450
;450:			EasyClientName(bs->teammate, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 552
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 451
;451:			Com_sprintf(action, sizeof(action), "accompanying %s", goalname);
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $250
ARGP4
ADDRLP4 552
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 452
;452:			break;
ADDRGP4 $245
JUMPV
LABELV $251
line 455
;453:		}
;454:		case LTG_DEFENDKEYAREA:
;455:		{
line 456
;456:			trap_BotGoalName(bs->teamgoal.number, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 6668
ADDP4
INDIRI4
ARGI4
ADDRLP4 552
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 457
;457:			Com_sprintf(action, sizeof(action), "defending %s", goalname);
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $252
ARGP4
ADDRLP4 552
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 458
;458:			break;
ADDRGP4 $245
JUMPV
LABELV $253
line 461
;459:		}
;460:		case LTG_GETITEM:
;461:		{
line 462
;462:			trap_BotGoalName(bs->teamgoal.number, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 6668
ADDP4
INDIRI4
ARGI4
ADDRLP4 552
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 463
;463:			Com_sprintf(action, sizeof(action), "getting item %s", goalname);
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $254
ARGP4
ADDRLP4 552
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 464
;464:			break;
ADDRGP4 $245
JUMPV
LABELV $255
line 467
;465:		}
;466:		case LTG_KILL:
;467:		{
line 468
;468:			ClientName(bs->teamgoal.entitynum, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
INDIRI4
ARGI4
ADDRLP4 552
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 469
;469:			Com_sprintf(action, sizeof(action), "killing %s", goalname);
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $256
ARGP4
ADDRLP4 552
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 470
;470:			break;
ADDRGP4 $245
JUMPV
LABELV $257
line 474
;471:		}
;472:		case LTG_CAMP:
;473:		case LTG_CAMPORDER:
;474:		{
line 475
;475:			Com_sprintf(action, sizeof(action), "camping");
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $258
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 476
;476:			break;
ADDRGP4 $245
JUMPV
LABELV $259
line 479
;477:		}
;478:		case LTG_PATROL:
;479:		{
line 480
;480:			Com_sprintf(action, sizeof(action), "patrolling");
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $260
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 481
;481:			break;
ADDRGP4 $245
JUMPV
LABELV $261
line 484
;482:		}
;483:		case LTG_GETFLAG:
;484:		{
line 485
;485:			Com_sprintf(action, sizeof(action), "capturing flag");
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $262
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 486
;486:			break;
ADDRGP4 $245
JUMPV
LABELV $263
line 489
;487:		}
;488:		case LTG_RUSHBASE:
;489:		{
line 490
;490:			Com_sprintf(action, sizeof(action), "rushing base");
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $264
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 491
;491:			break;
ADDRGP4 $245
JUMPV
LABELV $265
line 494
;492:		}
;493:		case LTG_RETURNFLAG:
;494:		{
line 495
;495:			Com_sprintf(action, sizeof(action), "returning flag");
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $266
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 496
;496:			break;
ADDRGP4 $245
JUMPV
LABELV $267
line 499
;497:		}
;498:		case LTG_ATTACKENEMYBASE:
;499:		{
line 500
;500:			Com_sprintf(action, sizeof(action), "attacking the enemy base");
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $268
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 501
;501:			break;
ADDRGP4 $245
JUMPV
LABELV $269
line 504
;502:		}
;503:		case LTG_HARVEST:
;504:		{
line 505
;505:			Com_sprintf(action, sizeof(action), "harvesting");
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $270
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 506
;506:			break;
ADDRGP4 $245
JUMPV
LABELV $244
line 509
;507:		}
;508:		default:
;509:		{
line 510
;510:			trap_BotGetTopGoal(bs->gs, &goal);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRLP4 808
ARGP4
ADDRGP4 trap_BotGetTopGoal
CALLI4
pop
line 511
;511:			trap_BotGoalName(goal.number, goalname, sizeof(goalname));
ADDRLP4 808+44
INDIRI4
ARGI4
ADDRLP4 552
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 512
;512:			Com_sprintf(action, sizeof(action), "roaming %s", goalname);
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $272
ARGP4
ADDRLP4 552
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 513
;513:			break;
LABELV $245
line 516
;514:		}
;515:	}
;516:  	cs = va("l\\%s\\c\\%s\\a\\%s",
ADDRGP4 $275
ARGP4
ADDRLP4 544
INDIRP4
ARGP4
ADDRLP4 512
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 876
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 548
ADDRLP4 876
INDIRP4
ASGNP4
line 520
;517:				leader,
;518:				carrying,
;519:				action);
;520:  	trap_SetConfigstring (CS_BOTINFO + bs->client, cs);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 25
ADDI4
ARGI4
ADDRLP4 548
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 521
;521:}
LABELV $225
endproc BotSetInfoConfigString 880 16
export BotUpdateInfoConfigStrings
proc BotUpdateInfoConfigStrings 1040 12
line 528
;522:
;523:/*
;524:==============
;525:BotUpdateInfoConfigStrings
;526:==============
;527:*/
;528:void BotUpdateInfoConfigStrings(void) {
line 532
;529:	int i;
;530:	char buf[MAX_INFO_STRING];
;531:
;532:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $280
JUMPV
LABELV $277
line 534
;533:		//
;534:		if ( !botstates[i] || !botstates[i]->inuse )
ADDRLP4 1032
ADDRGP4 botstates
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1032
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $284
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1032
INDIRP4
ADDP4
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $282
LABELV $284
line 535
;535:			continue;
ADDRGP4 $278
JUMPV
LABELV $282
line 537
;536:		//
;537:		trap_GetConfigstring(CS_PLAYERS+i, buf, sizeof(buf));
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
line 539
;538:		//if no config string or no name
;539:		if (!buf[0] || !*Info_ValueForKey(buf, "n"))
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $287
ADDRLP4 4
ARGP4
ADDRGP4 $206
ARGP4
ADDRLP4 1036
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1036
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $285
LABELV $287
line 540
;540:			continue;
ADDRGP4 $278
JUMPV
LABELV $285
line 541
;541:		BotSetInfoConfigString(botstates[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotSetInfoConfigString
CALLV
pop
line 542
;542:	}
LABELV $278
line 532
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $280
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $277
line 543
;543:}
LABELV $276
endproc BotUpdateInfoConfigStrings 1040 12
export BotInterbreedBots
proc BotInterbreedBots 288 20
line 550
;544:
;545:/*
;546:==============
;547:BotInterbreedBots
;548:==============
;549:*/
;550:void BotInterbreedBots(void) {
line 556
;551:	float ranks[MAX_CLIENTS];
;552:	int parent1, parent2, child;
;553:	int i;
;554:
;555:	// get rankings for all the bots
;556:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $289
line 557
;557:		if ( botstates[i] && botstates[i]->inuse ) {
ADDRLP4 276
ADDRGP4 botstates
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 276
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $293
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 276
INDIRP4
ADDP4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $293
line 558
;558:			ranks[i] = botstates[i]->num_kills * 2 - botstates[i]->num_deaths;
ADDRLP4 284
ADDRGP4 botstates
ASGNP4
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
ADDRLP4 284
INDIRP4
ADDP4
INDIRP4
CNSTI4 6032
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 284
INDIRP4
ADDP4
INDIRP4
CNSTI4 6028
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 559
;559:		}
ADDRGP4 $294
JUMPV
LABELV $293
line 560
;560:		else {
line 561
;561:			ranks[i] = -1;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
CNSTF4 3212836864
ASGNF4
line 562
;562:		}
LABELV $294
line 563
;563:	}
LABELV $290
line 556
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $289
line 565
;564:
;565:	if (trap_GeneticParentsAndChildSelection(MAX_CLIENTS, ranks, &parent1, &parent2, &child)) {
CNSTI4 64
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 264
ARGP4
ADDRLP4 268
ARGP4
ADDRLP4 260
ARGP4
ADDRLP4 272
ADDRGP4 trap_GeneticParentsAndChildSelection
CALLI4
ASGNI4
ADDRLP4 272
INDIRI4
CNSTI4 0
EQI4 $295
line 566
;566:		trap_BotInterbreedGoalFuzzyLogic(botstates[parent1]->gs, botstates[parent2]->gs, botstates[child]->gs);
ADDRLP4 276
ADDRGP4 botstates
ASGNP4
ADDRLP4 264
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 276
INDIRP4
ADDP4
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRLP4 268
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 276
INDIRP4
ADDP4
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 276
INDIRP4
ADDP4
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotInterbreedGoalFuzzyLogic
CALLV
pop
line 567
;567:		trap_BotMutateGoalFuzzyLogic(botstates[child]->gs, 1);
ADDRLP4 260
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_BotMutateGoalFuzzyLogic
CALLV
pop
line 568
;568:	}
LABELV $295
line 570
;569:	// reset the kills and deaths
;570:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $297
line 571
;571:		if (botstates[i] && botstates[i]->inuse) {
ADDRLP4 280
ADDRGP4 botstates
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 280
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $301
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 280
INDIRP4
ADDP4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $301
line 572
;572:			botstates[i]->num_kills = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 6032
ADDP4
CNSTI4 0
ASGNI4
line 573
;573:			botstates[i]->num_deaths = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 6028
ADDP4
CNSTI4 0
ASGNI4
line 574
;574:		}
LABELV $301
line 575
;575:	}
LABELV $298
line 570
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $297
line 576
;576:}
LABELV $288
endproc BotInterbreedBots 288 20
export BotWriteInterbreeded
proc BotWriteInterbreeded 32 8
line 583
;577:
;578:/*
;579:==============
;580:BotWriteInterbreeded
;581:==============
;582:*/
;583:void BotWriteInterbreeded(char *filename) {
line 587
;584:	float rank, bestrank;
;585:	int i, bestbot;
;586:
;587:	bestrank = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 588
;588:	bestbot = -1;
ADDRLP4 12
CNSTI4 -1
ASGNI4
line 590
;589:	// get the best bot
;590:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $304
line 591
;591:		if ( botstates[i] && botstates[i]->inuse ) {
ADDRLP4 20
ADDRGP4 botstates
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $308
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
ADDP4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $308
line 592
;592:			rank = botstates[i]->num_kills * 2 - botstates[i]->num_deaths;
ADDRLP4 28
ADDRGP4 botstates
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 28
INDIRP4
ADDP4
INDIRP4
CNSTI4 6032
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 28
INDIRP4
ADDP4
INDIRP4
CNSTI4 6028
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 593
;593:		}
ADDRGP4 $309
JUMPV
LABELV $308
line 594
;594:		else {
line 595
;595:			rank = -1;
ADDRLP4 4
CNSTF4 3212836864
ASGNF4
line 596
;596:		}
LABELV $309
line 597
;597:		if (rank > bestrank) {
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $310
line 598
;598:			bestrank = rank;
ADDRLP4 8
ADDRLP4 4
INDIRF4
ASGNF4
line 599
;599:			bestbot = i;
ADDRLP4 12
ADDRLP4 0
INDIRI4
ASGNI4
line 600
;600:		}
LABELV $310
line 601
;601:	}
LABELV $305
line 590
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $304
line 602
;602:	if (bestbot >= 0) {
ADDRLP4 12
INDIRI4
CNSTI4 0
LTI4 $312
line 604
;603:		//write out the new goal fuzzy logic
;604:		trap_BotSaveGoalFuzzyLogic(botstates[bestbot]->gs, filename);
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_BotSaveGoalFuzzyLogic
CALLV
pop
line 605
;605:	}
LABELV $312
line 606
;606:}
LABELV $303
endproc BotWriteInterbreeded 32 8
export BotInterbreedEndMatch
proc BotInterbreedEndMatch 8 8
line 615
;607:
;608:/*
;609:==============
;610:BotInterbreedEndMatch
;611:
;612:add link back into ExitLevel?
;613:==============
;614:*/
;615:void BotInterbreedEndMatch(void) {
line 617
;616:
;617:	if (!bot_interbreed) return;
ADDRGP4 bot_interbreed
INDIRI4
CNSTI4 0
NEI4 $315
ADDRGP4 $314
JUMPV
LABELV $315
line 618
;618:	bot_interbreedmatchcount++;
ADDRLP4 0
ADDRGP4 bot_interbreedmatchcount
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 619
;619:	if (bot_interbreedmatchcount >= bot_interbreedcycle.integer) {
ADDRGP4 bot_interbreedmatchcount
INDIRI4
ADDRGP4 bot_interbreedcycle+12
INDIRI4
LTI4 $317
line 620
;620:		bot_interbreedmatchcount = 0;
ADDRGP4 bot_interbreedmatchcount
CNSTI4 0
ASGNI4
line 622
;621:		//
;622:		trap_Cvar_Update(&bot_interbreedwrite);
ADDRGP4 bot_interbreedwrite
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 623
;623:		if (strlen(bot_interbreedwrite.string)) {
ADDRGP4 bot_interbreedwrite+16
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $320
line 624
;624:			BotWriteInterbreeded(bot_interbreedwrite.string);
ADDRGP4 bot_interbreedwrite+16
ARGP4
ADDRGP4 BotWriteInterbreeded
CALLV
pop
line 625
;625:			trap_Cvar_Set("bot_interbreedwrite", "");
ADDRGP4 $324
ARGP4
ADDRGP4 $325
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 626
;626:		}
LABELV $320
line 627
;627:		BotInterbreedBots();
ADDRGP4 BotInterbreedBots
CALLV
pop
line 628
;628:	}
LABELV $317
line 629
;629:}
LABELV $314
endproc BotInterbreedEndMatch 8 8
export BotInterbreeding
proc BotInterbreeding 16 20
line 636
;630:
;631:/*
;632:==============
;633:BotInterbreeding
;634:==============
;635:*/
;636:void BotInterbreeding(void) {
line 639
;637:	int i;
;638:
;639:	trap_Cvar_Update(&bot_interbreedchar);
ADDRGP4 bot_interbreedchar
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 640
;640:	if (!strlen(bot_interbreedchar.string)) return;
ADDRGP4 bot_interbreedchar+16
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $327
ADDRGP4 $326
JUMPV
LABELV $327
line 642
;641:	//make sure we are in tournament mode
;642:	if (gametype != GT_DUEL) {
ADDRGP4 gametype
INDIRI4
CNSTI4 2
EQI4 $330
line 643
;643:		trap_Cvar_Set("g_gametype", va("%d", GT_DUEL));
ADDRGP4 $333
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $332
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 644
;644:		ExitLevel();
ADDRGP4 ExitLevel
CALLV
pop
line 645
;645:		return;
ADDRGP4 $326
JUMPV
LABELV $330
line 648
;646:	}
;647:	//shutdown all the bots
;648:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $337
JUMPV
LABELV $334
line 649
;649:		if (botstates[i] && botstates[i]->inuse) {
ADDRLP4 12
ADDRGP4 botstates
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $339
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
ADDP4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $339
line 650
;650:			BotAIShutdownClient(botstates[i]->client, qfalse);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 BotAIShutdownClient
CALLI4
pop
line 651
;651:		}
LABELV $339
line 652
;652:	}
LABELV $335
line 648
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $337
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $334
line 654
;653:	//make sure all item weight configs are reloaded and Not shared
;654:	trap_BotLibVarSet("bot_reloadcharacters", "1");
ADDRGP4 $341
ARGP4
ADDRGP4 $342
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 656
;655:	//add a number of bots using the desired bot character
;656:	for (i = 0; i < bot_interbreedbots.integer; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $346
JUMPV
LABELV $343
line 657
;657:		trap_SendConsoleCommand( EXEC_INSERT, va("addbot %s 4 free %i %s%d\n",
ADDRGP4 $348
ARGP4
ADDRGP4 bot_interbreedchar+16
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 50
MULI4
ARGI4
ADDRGP4 bot_interbreedchar+16
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 659
;658:						bot_interbreedchar.string, i * 50, bot_interbreedchar.string, i) );
;659:	}
LABELV $344
line 656
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $346
ADDRLP4 0
INDIRI4
ADDRGP4 bot_interbreedbots+12
INDIRI4
LTI4 $343
line 661
;660:	//
;661:	trap_Cvar_Set("bot_interbreedchar", "");
ADDRGP4 $351
ARGP4
ADDRGP4 $325
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 662
;662:	bot_interbreed = qtrue;
ADDRGP4 bot_interbreed
CNSTI4 1
ASGNI4
line 663
;663:}
LABELV $326
endproc BotInterbreeding 16 20
export BotEntityInfo
proc BotEntityInfo 0 8
line 670
;664:
;665:/*
;666:==============
;667:BotEntityInfo
;668:==============
;669:*/
;670:void BotEntityInfo(int entnum, aas_entityinfo_t *info) {
line 671
;671:	trap_AAS_EntityInfo(entnum, info);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_AAS_EntityInfo
CALLV
pop
line 672
;672:}
LABELV $352
endproc BotEntityInfo 0 8
export NumBots
proc NumBots 0 0
line 679
;673:
;674:/*
;675:==============
;676:NumBots
;677:==============
;678:*/
;679:int NumBots(void) {
line 680
;680:	return numbots;
ADDRGP4 numbots
INDIRI4
RETI4
LABELV $353
endproc NumBots 0 0
export BotTeamLeader
proc BotTeamLeader 16 4
line 688
;681:}
;682:
;683:/*
;684:==============
;685:BotTeamLeader
;686:==============
;687:*/
;688:int BotTeamLeader(bot_state_t *bs) {
line 691
;689:	int leader;
;690:
;691:	leader = ClientFromName(bs->teamleader);
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 692
;692:	if (leader < 0) return qfalse;
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $355
CNSTI4 0
RETI4
ADDRGP4 $354
JUMPV
LABELV $355
line 693
;693:	if (!botstates[leader] || !botstates[leader]->inuse) return qfalse;
ADDRLP4 12
ADDRGP4 botstates
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $359
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
ADDP4
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $357
LABELV $359
CNSTI4 0
RETI4
ADDRGP4 $354
JUMPV
LABELV $357
line 694
;694:	return qtrue;
CNSTI4 1
RETI4
LABELV $354
endproc BotTeamLeader 16 4
export AngleDifference
proc AngleDifference 4 0
line 702
;695:}
;696:
;697:/*
;698:==============
;699:AngleDifference
;700:==============
;701:*/
;702:float AngleDifference(float ang1, float ang2) {
line 705
;703:	float diff;
;704:
;705:	diff = ang1 - ang2;
ADDRLP4 0
ADDRFP4 0
INDIRF4
ADDRFP4 4
INDIRF4
SUBF4
ASGNF4
line 706
;706:	if (ang1 > ang2) {
ADDRFP4 0
INDIRF4
ADDRFP4 4
INDIRF4
LEF4 $361
line 707
;707:		if (diff > 180.0) diff -= 360.0;
ADDRLP4 0
INDIRF4
CNSTF4 1127481344
LEF4 $362
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
line 708
;708:	}
ADDRGP4 $362
JUMPV
LABELV $361
line 709
;709:	else {
line 710
;710:		if (diff < -180.0) diff += 360.0;
ADDRLP4 0
INDIRF4
CNSTF4 3274964992
GEF4 $365
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
LABELV $365
line 711
;711:	}
LABELV $362
line 712
;712:	return diff;
ADDRLP4 0
INDIRF4
RETF4
LABELV $360
endproc AngleDifference 4 0
export BotChangeViewAngle
proc BotChangeViewAngle 16 4
line 720
;713:}
;714:
;715:/*
;716:==============
;717:BotChangeViewAngle
;718:==============
;719:*/
;720:float BotChangeViewAngle(float angle, float ideal_angle, float speed) {
line 723
;721:	float move;
;722:
;723:	angle = AngleMod(angle);
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 724
;724:	ideal_angle = AngleMod(ideal_angle);
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 4
ADDRLP4 8
INDIRF4
ASGNF4
line 725
;725:	if (angle == ideal_angle) return angle;
ADDRFP4 0
INDIRF4
ADDRFP4 4
INDIRF4
NEF4 $368
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $367
JUMPV
LABELV $368
line 726
;726:	move = ideal_angle - angle;
ADDRLP4 0
ADDRFP4 4
INDIRF4
ADDRFP4 0
INDIRF4
SUBF4
ASGNF4
line 727
;727:	if (ideal_angle > angle) {
ADDRFP4 4
INDIRF4
ADDRFP4 0
INDIRF4
LEF4 $370
line 728
;728:		if (move > 180.0) move -= 360.0;
ADDRLP4 0
INDIRF4
CNSTF4 1127481344
LEF4 $371
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
line 729
;729:	}
ADDRGP4 $371
JUMPV
LABELV $370
line 730
;730:	else {
line 731
;731:		if (move < -180.0) move += 360.0;
ADDRLP4 0
INDIRF4
CNSTF4 3274964992
GEF4 $374
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
LABELV $374
line 732
;732:	}
LABELV $371
line 733
;733:	if (move > 0) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $376
line 734
;734:		if (move > speed) move = speed;
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
LEF4 $377
ADDRLP4 0
ADDRFP4 8
INDIRF4
ASGNF4
line 735
;735:	}
ADDRGP4 $377
JUMPV
LABELV $376
line 736
;736:	else {
line 737
;737:		if (move < -speed) move = -speed;
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
NEGF4
GEF4 $380
ADDRLP4 0
ADDRFP4 8
INDIRF4
NEGF4
ASGNF4
LABELV $380
line 738
;738:	}
LABELV $377
line 739
;739:	return AngleMod(angle + move);
ADDRFP4 0
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 12
INDIRF4
RETF4
LABELV $367
endproc BotChangeViewAngle 16 4
export BotChangeViewAngles
proc BotChangeViewAngles 96 16
line 747
;740:}
;741:
;742:/*
;743:==============
;744:BotChangeViewAngles
;745:==============
;746:*/
;747:void BotChangeViewAngles(bot_state_t *bs, float thinktime) {
line 751
;748:	float diff, factor, maxchange, anglespeed, disired_speed;
;749:	int i;
;750:
;751:	if (bs->ideal_viewangles[PITCH] > 180) bs->ideal_viewangles[PITCH] -= 360;
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
INDIRF4
CNSTF4 1127481344
LEF4 $383
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
LABELV $383
line 753
;752:	//
;753:	if (bs->enemy >= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 0
LTI4 $385
line 754
;754:		factor = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_VIEW_FACTOR, 0.01f, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
CNSTF4 1008981770
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 28
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 28
INDIRF4
ASGNF4
line 755
;755:		maxchange = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_VIEW_MAXCHANGE, 1, 1800);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
CNSTF4 1065353216
ARGF4
CNSTF4 1155596288
ARGF4
ADDRLP4 32
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 32
INDIRF4
ASGNF4
line 756
;756:	}
ADDRGP4 $386
JUMPV
LABELV $385
line 757
;757:	else {
line 758
;758:		factor = 0.05f;
ADDRLP4 16
CNSTF4 1028443341
ASGNF4
line 759
;759:		maxchange = 360;
ADDRLP4 8
CNSTF4 1135869952
ASGNF4
line 760
;760:	}
LABELV $386
line 761
;761:	if (maxchange < 240) maxchange = 240;
ADDRLP4 8
INDIRF4
CNSTF4 1131413504
GEF4 $387
ADDRLP4 8
CNSTF4 1131413504
ASGNF4
LABELV $387
line 762
;762:	maxchange *= thinktime;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRFP4 4
INDIRF4
MULF4
ASGNF4
line 763
;763:	for (i = 0; i < 2; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $389
line 765
;764:		//
;765:		if (bot_challenge.integer) {
ADDRGP4 bot_challenge+12
INDIRI4
CNSTI4 0
EQI4 $393
line 767
;766:			//smooth slowdown view model
;767:			diff = fabs(AngleDifference(bs->viewangles[i], bs->ideal_viewangles[i]));
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
INDIRP4
CNSTI4 6576
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 36
ADDRGP4 AngleDifference
CALLF4
ASGNF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 40
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 40
INDIRF4
ASGNF4
line 768
;768:			anglespeed = diff * factor;
ADDRLP4 4
ADDRLP4 12
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
line 769
;769:			if (anglespeed > maxchange) anglespeed = maxchange;
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $396
ADDRLP4 4
ADDRLP4 8
INDIRF4
ASGNF4
LABELV $396
line 770
;770:			bs->viewangles[i] = BotChangeViewAngle(bs->viewangles[i],
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 48
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 48
INDIRP4
CNSTI4 6576
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 52
ADDRGP4 BotChangeViewAngle
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 48
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
ADDRLP4 52
INDIRF4
ASGNF4
line 772
;771:											bs->ideal_viewangles[i], anglespeed);
;772:		}
ADDRGP4 $394
JUMPV
LABELV $393
line 773
;773:		else {
line 775
;774:			//over reaction view model
;775:			bs->viewangles[i] = AngleMod(bs->viewangles[i]);
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 36
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
ADDRLP4 36
INDIRF4
ASGNF4
line 776
;776:			bs->ideal_viewangles[i] = AngleMod(bs->ideal_viewangles[i]);
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 44
INDIRP4
CNSTI4 6576
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 48
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 44
INDIRP4
CNSTI4 6576
ADDP4
ADDP4
ADDRLP4 48
INDIRF4
ASGNF4
line 777
;777:			diff = AngleDifference(bs->viewangles[i], bs->ideal_viewangles[i]);
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 56
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 56
INDIRP4
CNSTI4 6576
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
ADDRGP4 AngleDifference
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 60
INDIRF4
ASGNF4
line 778
;778:			disired_speed = diff * factor;
ADDRLP4 20
ADDRLP4 12
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
line 779
;779:			bs->viewanglespeed[i] += (bs->viewanglespeed[i] - disired_speed);
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
INDIRP4
CNSTI4 6588
ADDP4
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
INDIRP4
CNSTI4 6588
ADDP4
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
SUBF4
ADDF4
ASGNF4
line 780
;780:			if (bs->viewanglespeed[i] > 180) bs->viewanglespeed[i] = maxchange;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 6588
ADDP4
ADDP4
INDIRF4
CNSTF4 1127481344
LEF4 $398
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 6588
ADDP4
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
LABELV $398
line 781
;781:			if (bs->viewanglespeed[i] < -180) bs->viewanglespeed[i] = -maxchange;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 6588
ADDP4
ADDP4
INDIRF4
CNSTF4 3274964992
GEF4 $400
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 6588
ADDP4
ADDP4
ADDRLP4 8
INDIRF4
NEGF4
ASGNF4
LABELV $400
line 782
;782:			anglespeed = bs->viewanglespeed[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 6588
ADDP4
ADDP4
INDIRF4
ASGNF4
line 783
;783:			if (anglespeed > maxchange) anglespeed = maxchange;
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $402
ADDRLP4 4
ADDRLP4 8
INDIRF4
ASGNF4
LABELV $402
line 784
;784:			if (anglespeed < -maxchange) anglespeed = -maxchange;
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
NEGF4
GEF4 $404
ADDRLP4 4
ADDRLP4 8
INDIRF4
NEGF4
ASGNF4
LABELV $404
line 785
;785:			bs->viewangles[i] += anglespeed;
ADDRLP4 76
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
ADDF4
ASGNF4
line 786
;786:			bs->viewangles[i] = AngleMod(bs->viewangles[i]);
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 84
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 88
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 84
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
ADDRLP4 88
INDIRF4
ASGNF4
line 788
;787:			//demping
;788:			bs->viewanglespeed[i] *= 0.45 * (1 - factor);
ADDRLP4 92
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 6588
ADDP4
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDRLP4 16
INDIRF4
SUBF4
CNSTF4 1055286886
MULF4
MULF4
ASGNF4
line 789
;789:		}
LABELV $394
line 792
;790:		//BotAI_Print(PRT_MESSAGE, "ideal_angles %f %f\n", bs->ideal_viewangles[0], bs->ideal_viewangles[1], bs->ideal_viewangles[2]);`
;791:		//bs->viewangles[i] = bs->ideal_viewangles[i];
;792:	}
LABELV $390
line 763
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $389
line 794
;793:	//bs->viewangles[PITCH] = 0;
;794:	if (bs->viewangles[PITCH] > 180) bs->viewangles[PITCH] -= 360;
ADDRFP4 0
INDIRP4
CNSTI4 6564
ADDP4
INDIRF4
CNSTF4 1127481344
LEF4 $406
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 6564
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
LABELV $406
line 796
;795:	//elementary action: view
;796:	trap_EA_View(bs->client, bs->viewangles);
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 32
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
ADDRGP4 trap_EA_View
CALLV
pop
line 797
;797:}
LABELV $382
endproc BotChangeViewAngles 96 16
export BotInputToUserCommand
proc BotInputToUserCommand 136 16
line 804
;798:
;799:/*
;800:==============
;801:BotInputToUserCommand
;802:==============
;803:*/
;804:void BotInputToUserCommand(bot_input_t *bi, usercmd_t *ucmd, int delta_angles[3], int time) {
line 811
;805:	vec3_t angles, forward, right;
;806:	short temp;
;807:	int j;
;808:	float f, r, u, m;
;809:
;810:	//clear the whole structure
;811:	memset(ucmd, 0, sizeof(usercmd_t));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 24
ARGI4
ADDRGP4 memset
CALLP4
pop
line 815
;812:	//
;813:	//Com_Printf("dir = %f %f %f speed = %f\n", bi->dir[0], bi->dir[1], bi->dir[2], bi->speed);
;814:	//the duration for the user command in milli seconds
;815:	ucmd->serverTime = time;
ADDRFP4 4
INDIRP4
ADDRFP4 12
INDIRI4
ASGNI4
line 817
;816:	//
;817:	if (bi->actionflags & ACTION_DELAYEDJUMP) {
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $409
line 818
;818:		bi->actionflags |= ACTION_JUMP;
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 819
;819:		bi->actionflags &= ~ACTION_DELAYEDJUMP;
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 -32769
BANDI4
ASGNI4
line 820
;820:	}
LABELV $409
line 822
;821:	//set the buttons
;822:	if (bi->actionflags & ACTION_RESPAWN) ucmd->buttons = BUTTON_ATTACK;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $411
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 1
ASGNI4
LABELV $411
line 823
;823:	if (bi->actionflags & ACTION_ATTACK) ucmd->buttons |= BUTTON_ATTACK;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $413
ADDRLP4 60
ADDRFP4 4
INDIRP4
CNSTI4 16
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
LABELV $413
line 824
;824:	if (bi->actionflags & ACTION_TALK) ucmd->buttons |= BUTTON_TALK;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 65536
BANDI4
CNSTI4 0
EQI4 $415
ADDRLP4 64
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
LABELV $415
line 825
;825:	if (bi->actionflags & ACTION_GESTURE) ucmd->buttons |= BUTTON_GESTURE;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 131072
BANDI4
CNSTI4 0
EQI4 $417
ADDRLP4 68
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
LABELV $417
line 826
;826:	if (bi->actionflags & ACTION_USE) ucmd->buttons |= BUTTON_USE_HOLDABLE;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $419
ADDRLP4 72
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
LABELV $419
line 827
;827:	if (bi->actionflags & ACTION_WALK) ucmd->buttons |= BUTTON_WALKING;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 524288
BANDI4
CNSTI4 0
EQI4 $421
ADDRLP4 76
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
LABELV $421
line 828
;828:	if (bi->actionflags & ACTION_AFFIRMATIVE) ucmd->buttons |= BUTTON_AFFIRMATIVE;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 1048576
BANDI4
CNSTI4 0
EQI4 $423
ADDRLP4 80
ADDRFP4 4
INDIRP4
CNSTI4 16
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
LABELV $423
line 829
;829:	if (bi->actionflags & ACTION_NEGATIVE) ucmd->buttons |= BUTTON_NEGATIVE;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 2097152
BANDI4
CNSTI4 0
EQI4 $425
ADDRLP4 84
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
LABELV $425
line 830
;830:	if (bi->actionflags & ACTION_GETFLAG) ucmd->buttons |= BUTTON_GETFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 8388608
BANDI4
CNSTI4 0
EQI4 $427
ADDRLP4 88
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
LABELV $427
line 831
;831:	if (bi->actionflags & ACTION_GUARDBASE) ucmd->buttons |= BUTTON_GUARDBASE;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 16777216
BANDI4
CNSTI4 0
EQI4 $429
ADDRLP4 92
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
LABELV $429
line 832
;832:	if (bi->actionflags & ACTION_PATROL) ucmd->buttons |= BUTTON_PATROL;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 33554432
BANDI4
CNSTI4 0
EQI4 $431
ADDRLP4 96
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
LABELV $431
line 833
;833:	if (bi->actionflags & ACTION_FOLLOWME) ucmd->buttons |= BUTTON_FOLLOWME;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 134217728
BANDI4
CNSTI4 0
EQI4 $433
ADDRLP4 100
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI4
CNSTI4 1024
BORI4
ASGNI4
LABELV $433
line 835
;834:	//
;835:	ucmd->weapon = bi->weapon;
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 838
;836:	//set the view angles
;837:	//NOTE: the ucmd->angles are the angles WITHOUT the delta angles
;838:	ucmd->angles[PITCH] = ANGLE2SHORT(bi->viewangles[PITCH]);
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
CNSTF4 1127615329
MULF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
line 839
;839:	ucmd->angles[YAW] = ANGLE2SHORT(bi->viewangles[YAW]);
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
CNSTF4 1127615329
MULF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
line 840
;840:	ucmd->angles[ROLL] = ANGLE2SHORT(bi->viewangles[ROLL]);
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1127615329
MULF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
line 842
;841:	//subtract the delta angles
;842:	for (j = 0; j < 3; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $435
line 843
;843:		temp = ucmd->angles[j] - delta_angles[j];
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
ADDRFP4 8
INDIRP4
ADDP4
INDIRI4
SUBI4
CVII2 4
ASGNI2
line 851
;844:		/*NOTE: disabled because temp should be mod first
;845:		if ( j == PITCH ) {
;846:			// don't let the player look up or down more than 90 degrees
;847:			if ( temp > 16000 ) temp = 16000;
;848:			else if ( temp < -16000 ) temp = -16000;
;849:		}
;850:		*/
;851:		ucmd->angles[j] = temp;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDP4
ADDRLP4 4
INDIRI2
CVII4 2
ASGNI4
line 852
;852:	}
LABELV $436
line 842
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $435
line 856
;853:	//NOTE: movement is relative to the REAL view angles
;854:	//get the horizontal forward and right vector
;855:	//get the pitch in the range [-180, 180]
;856:	if (bi->dir[2]) angles[PITCH] = bi->viewangles[PITCH];
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CNSTF4 0
EQF4 $439
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ASGNF4
ADDRGP4 $440
JUMPV
LABELV $439
line 857
;857:	else angles[PITCH] = 0;
ADDRLP4 24
CNSTF4 0
ASGNF4
LABELV $440
line 858
;858:	angles[YAW] = bi->viewangles[YAW];
ADDRLP4 24+4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 859
;859:	angles[ROLL] = 0;
ADDRLP4 24+8
CNSTF4 0
ASGNF4
line 860
;860:	AngleVectors(angles, forward, right, NULL);
ADDRLP4 24
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 36
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 862
;861:	//bot input speed is in the range [0, 400]
;862:	bi->speed = bi->speed * 127 / 400;
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 104
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 104
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
CNSTF4 1050840924
MULF4
ASGNF4
line 865
;863:
;864:	//set the view independent movement
;865:	f = DotProduct( forward, bi->dir );
ADDRLP4 108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 12
INDIRF4
ADDRLP4 108
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 108
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 12+8
INDIRF4
ADDRLP4 108
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 866
;866:	r = DotProduct( right, bi->dir );
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
ADDRLP4 36
INDIRF4
ADDRLP4 112
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 36+4
INDIRF4
ADDRLP4 112
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 36+8
INDIRF4
ADDRLP4 112
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 867
;867:	u = fabs( forward[2] ) * bi->dir[2];
ADDRLP4 12+8
INDIRF4
ARGF4
ADDRLP4 116
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 52
ADDRLP4 116
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ASGNF4
line 868
;868:	m = fabs( f );
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 120
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 120
INDIRF4
ASGNF4
line 870
;869:
;870:	if ( fabs( r ) > m ) {
ADDRLP4 48
INDIRF4
ARGF4
ADDRLP4 124
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 124
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $448
line 871
;871:		m = fabs( r );
ADDRLP4 48
INDIRF4
ARGF4
ADDRLP4 128
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 128
INDIRF4
ASGNF4
line 872
;872:	}
LABELV $448
line 874
;873:
;874:	if ( fabs( u ) > m) {
ADDRLP4 52
INDIRF4
ARGF4
ADDRLP4 128
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 128
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $450
line 875
;875:		m = fabs( u );
ADDRLP4 52
INDIRF4
ARGF4
ADDRLP4 132
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 132
INDIRF4
ASGNF4
line 876
;876:	}
LABELV $450
line 878
;877:
;878:	if ( m > 0 ) {
ADDRLP4 8
INDIRF4
CNSTF4 0
LEF4 $452
line 879
;879:		f *= bi->speed / m;
ADDRLP4 56
ADDRLP4 56
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
DIVF4
MULF4
ASGNF4
line 880
;880:		r *= bi->speed / m;
ADDRLP4 48
ADDRLP4 48
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
DIVF4
MULF4
ASGNF4
line 881
;881:		u *= bi->speed / m;
ADDRLP4 52
ADDRLP4 52
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
DIVF4
MULF4
ASGNF4
line 882
;882:	}
LABELV $452
line 884
;883:
;884:	ucmd->forwardmove = f;
ADDRFP4 4
INDIRP4
CNSTI4 21
ADDP4
ADDRLP4 56
INDIRF4
CVFI4 4
CVII1 4
ASGNI1
line 885
;885:	ucmd->rightmove = r;
ADDRFP4 4
INDIRP4
CNSTI4 22
ADDP4
ADDRLP4 48
INDIRF4
CVFI4 4
CVII1 4
ASGNI1
line 886
;886:	ucmd->upmove = u;
ADDRFP4 4
INDIRP4
CNSTI4 23
ADDP4
ADDRLP4 52
INDIRF4
CVFI4 4
CVII1 4
ASGNI1
line 888
;887:
;888:	if (bi->actionflags & ACTION_MOVEFORWARD) ucmd->forwardmove = 127;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $454
ADDRFP4 4
INDIRP4
CNSTI4 21
ADDP4
CNSTI1 127
ASGNI1
LABELV $454
line 889
;889:	if (bi->actionflags & ACTION_MOVEBACK) ucmd->forwardmove = -127;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $456
ADDRFP4 4
INDIRP4
CNSTI4 21
ADDP4
CNSTI1 -127
ASGNI1
LABELV $456
line 890
;890:	if (bi->actionflags & ACTION_MOVELEFT) ucmd->rightmove = -127;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $458
ADDRFP4 4
INDIRP4
CNSTI4 22
ADDP4
CNSTI1 -127
ASGNI1
LABELV $458
line 891
;891:	if (bi->actionflags & ACTION_MOVERIGHT) ucmd->rightmove = 127;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $460
ADDRFP4 4
INDIRP4
CNSTI4 22
ADDP4
CNSTI1 127
ASGNI1
LABELV $460
line 893
;892:	//jump/moveup
;893:	if (bi->actionflags & ACTION_JUMP) ucmd->upmove = 127;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $462
ADDRFP4 4
INDIRP4
CNSTI4 23
ADDP4
CNSTI1 127
ASGNI1
LABELV $462
line 895
;894:	//crouch/movedown
;895:	if (bi->actionflags & ACTION_CROUCH) ucmd->upmove = -127;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $464
ADDRFP4 4
INDIRP4
CNSTI4 23
ADDP4
CNSTI1 -127
ASGNI1
LABELV $464
line 896
;896:}
LABELV $408
endproc BotInputToUserCommand 136 16
export BotUpdateInput
proc BotUpdateInput 60 16
line 903
;897:
;898:/*
;899:==============
;900:BotUpdateInput
;901:==============
;902:*/
;903:void BotUpdateInput(bot_state_t *bs, int time, int elapsed_time) {
line 908
;904:	bot_input_t bi;
;905:	int j;
;906:
;907:	//add the delta angles to the bot's current view angles
;908:	for (j = 0; j < 3; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $467
line 909
;909:		bs->viewangles[j] = AngleMod(bs->viewangles[j] + SHORT2ANGLE(bs->cur_ps.delta_angles[j]));
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 48
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 48
INDIRP4
CNSTI4 72
ADDP4
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1001652224
MULF4
ADDF4
ARGF4
ADDRLP4 52
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 48
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
ADDRLP4 52
INDIRF4
ASGNF4
line 910
;910:	}
LABELV $468
line 908
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
line 912
;911:	//change the bot view angles
;912:	BotChangeViewAngles(bs, (float) elapsed_time / 1000);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
CVIF4 4
CNSTF4 981668463
MULF4
ARGF4
ADDRGP4 BotChangeViewAngles
CALLV
pop
line 914
;913:	//retrieve the bot input
;914:	trap_EA_GetInput(bs->client, (float) time / 1000, &bi);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
CVIF4 4
CNSTF4 981668463
MULF4
ARGF4
ADDRLP4 4
ARGP4
ADDRGP4 trap_EA_GetInput
CALLV
pop
line 916
;915:	//respawn hack
;916:	if (bi.actionflags & ACTION_RESPAWN) {
ADDRLP4 4+32
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $471
line 917
;917:		if (bs->lastucmd.buttons & BUTTON_ATTACK) bi.actionflags &= ~(ACTION_RESPAWN|ACTION_ATTACK);
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $474
ADDRLP4 4+32
ADDRLP4 4+32
INDIRI4
CNSTI4 -10
BANDI4
ASGNI4
LABELV $474
line 918
;918:	}
LABELV $471
line 920
;919:	//convert the bot input to a usercmd
;920:	BotInputToUserCommand(&bi, &bs->lastucmd, bs->cur_ps.delta_angles, time);
ADDRLP4 4
ARGP4
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 72
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 BotInputToUserCommand
CALLV
pop
line 922
;921:	//subtract the delta angles
;922:	for (j = 0; j < 3; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $477
line 923
;923:		bs->viewangles[j] = AngleMod(bs->viewangles[j] - SHORT2ANGLE(bs->cur_ps.delta_angles[j]));
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 52
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 52
INDIRP4
CNSTI4 72
ADDP4
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1001652224
MULF4
SUBF4
ARGF4
ADDRLP4 56
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 52
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
ADDRLP4 56
INDIRF4
ASGNF4
line 924
;924:	}
LABELV $478
line 922
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $477
line 925
;925:}
LABELV $466
endproc BotUpdateInput 60 16
export BotAIRegularUpdate
proc BotAIRegularUpdate 0 0
line 932
;926:
;927:/*
;928:==============
;929:BotAIRegularUpdate
;930:==============
;931:*/
;932:void BotAIRegularUpdate(void) {
line 933
;933:	if (regularupdate_time < FloatTime()) {
ADDRGP4 regularupdate_time
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $482
line 934
;934:		trap_BotUpdateEntityItems();
ADDRGP4 trap_BotUpdateEntityItems
CALLV
pop
line 935
;935:		regularupdate_time = FloatTime() + 0.3;
ADDRGP4 regularupdate_time
ADDRGP4 floattime
INDIRF4
CNSTF4 1050253722
ADDF4
ASGNF4
line 936
;936:	}
LABELV $482
line 937
;937:}
LABELV $481
endproc BotAIRegularUpdate 0 0
export RemoveColorEscapeSequences
proc RemoveColorEscapeSequences 20 0
line 944
;938:
;939:/*
;940:==============
;941:RemoveColorEscapeSequences
;942:==============
;943:*/
;944:void RemoveColorEscapeSequences( char *text ) {
line 947
;945:	int i, l;
;946:
;947:	l = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 948
;948:	for ( i = 0; text[i]; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $488
JUMPV
LABELV $485
line 949
;949:		if (Q_IsColorString(&text[i])) {
ADDRLP4 8
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $489
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $489
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $489
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 94
EQI4 $489
line 950
;950:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 951
;951:			continue;
ADDRGP4 $486
JUMPV
LABELV $489
line 953
;952:		}
;953:		if (text[i] > 0x7E)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 126
LEI4 $491
line 954
;954:			continue;
ADDRGP4 $486
JUMPV
LABELV $491
line 955
;955:		text[l++] = text[i];
ADDRLP4 12
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 956
;956:	}
LABELV $486
line 948
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $488
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $485
line 957
;957:	text[l] = '\0';
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 958
;958:}
LABELV $484
endproc RemoveColorEscapeSequences 20 0
export BotAI
proc BotAI 1088 12
line 965
;959:
;960:/*
;961:==============
;962:BotAI
;963:==============
;964:*/
;965:int BotAI(int client, float thinktime) {
line 970
;966:	bot_state_t *bs;
;967:	char buf[1024], *args;
;968:	int j;
;969:
;970:	trap_EA_ResetInput(client);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 trap_EA_ResetInput
CALLV
pop
line 972
;971:	//
;972:	bs = botstates[client];
ADDRLP4 4
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
line 973
;973:	if (!bs || !bs->inuse) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $496
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $494
LABELV $496
line 974
;974:		BotAI_Print(PRT_FATAL, "BotAI: client %d is not setup\n", client);
CNSTI4 4
ARGI4
ADDRGP4 $497
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 975
;975:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $493
JUMPV
LABELV $494
line 979
;976:	}
;977:
;978:	//retrieve the current client state
;979:	BotAI_GetClientState( client, &bs->cur_ps );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
ARGP4
ADDRGP4 BotAI_GetClientState
CALLI4
pop
ADDRGP4 $499
JUMPV
LABELV $498
line 982
;980:
;981:	//retrieve any waiting server commands
;982:	while( trap_BotGetServerCommand(client, buf, sizeof(buf)) ) {
line 984
;983:		//have buf point to the command and args to the command arguments
;984:		args = strchr( buf, ' ');
ADDRLP4 12
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 1040
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1040
INDIRP4
ASGNP4
line 985
;985:		if (!args) continue;
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $501
ADDRGP4 $499
JUMPV
LABELV $501
line 986
;986:		*args++ = '\0';
ADDRLP4 1044
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 1044
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 1044
INDIRP4
CNSTI1 0
ASGNI1
line 989
;987:
;988:		//remove color espace sequences from the arguments
;989:		RemoveColorEscapeSequences( args );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 RemoveColorEscapeSequences
CALLV
pop
line 991
;990:
;991:		if (!Q_stricmp(buf, "cp "))
ADDRLP4 12
ARGP4
ADDRGP4 $505
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $503
line 992
;992:			{ /*CenterPrintf*/ }
ADDRGP4 $504
JUMPV
LABELV $503
line 993
;993:		else if (!Q_stricmp(buf, "cs"))
ADDRLP4 12
ARGP4
ADDRGP4 $508
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $506
line 994
;994:			{ /*ConfigStringModified*/ }
ADDRGP4 $507
JUMPV
LABELV $506
line 995
;995:		else if (!Q_stricmp(buf, "print")) {
ADDRLP4 12
ARGP4
ADDRGP4 $511
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $509
line 997
;996:			//remove first and last quote from the chat message
;997:			memmove(args, args+1, strlen(args));
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1060
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 1060
INDIRI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 998
;998:			args[strlen(args)-1] = '\0';
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1068
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 999
;999:			trap_BotQueueConsoleMessage(bs->cs, CMS_NORMAL, args);
ADDRLP4 4
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_BotQueueConsoleMessage
CALLV
pop
line 1000
;1000:		}
ADDRGP4 $510
JUMPV
LABELV $509
line 1001
;1001:		else if (!Q_stricmp(buf, "chat")) {
ADDRLP4 12
ARGP4
ADDRGP4 $514
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $512
line 1003
;1002:			//remove first and last quote from the chat message
;1003:			memmove(args, args+1, strlen(args));
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1064
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 1064
INDIRI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 1004
;1004:			args[strlen(args)-1] = '\0';
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1072
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 1005
;1005:			trap_BotQueueConsoleMessage(bs->cs, CMS_CHAT, args);
ADDRLP4 4
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_BotQueueConsoleMessage
CALLV
pop
line 1006
;1006:		}
ADDRGP4 $513
JUMPV
LABELV $512
line 1007
;1007:		else if (!Q_stricmp(buf, "tchat")) {
ADDRLP4 12
ARGP4
ADDRGP4 $517
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $515
line 1009
;1008:			//remove first and last quote from the chat message
;1009:			memmove(args, args+1, strlen(args));
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1068
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 1068
INDIRI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 1010
;1010:			args[strlen(args)-1] = '\0';
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1076
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 1011
;1011:			trap_BotQueueConsoleMessage(bs->cs, CMS_CHAT, args);
ADDRLP4 4
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_BotQueueConsoleMessage
CALLV
pop
line 1012
;1012:		}
ADDRGP4 $516
JUMPV
LABELV $515
line 1013
;1013:		else if (!Q_stricmp(buf, "scores"))
ADDRLP4 12
ARGP4
ADDRGP4 $520
ARGP4
ADDRLP4 1068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $518
line 1014
;1014:			{ /*FIXME: parse scores?*/ }
ADDRGP4 $519
JUMPV
LABELV $518
line 1015
;1015:		else if (!Q_stricmp(buf, "clientLevelShot"))
ADDRLP4 12
ARGP4
ADDRGP4 $523
ARGP4
ADDRLP4 1072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $521
line 1016
;1016:			{ /*ignore*/ }
LABELV $521
LABELV $519
LABELV $516
LABELV $513
LABELV $510
LABELV $507
LABELV $504
line 1017
;1017:	}
LABELV $499
line 982
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1040
ADDRGP4 trap_BotGetServerCommand
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $498
line 1019
;1018:	//add the delta angles to the bot's current view angles
;1019:	for (j = 0; j < 3; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $524
line 1020
;1020:		bs->viewangles[j] = AngleMod(bs->viewangles[j] + SHORT2ANGLE(bs->cur_ps.delta_angles[j]));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 72
ADDP4
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1001652224
MULF4
ADDF4
ARGF4
ADDRLP4 1052
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
ADDRLP4 1052
INDIRF4
ASGNF4
line 1021
;1021:	}
LABELV $525
line 1019
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $524
line 1023
;1022:	//increase the local time of the bot
;1023:	bs->ltime += thinktime;
ADDRLP4 1044
ADDRLP4 4
INDIRP4
CNSTI4 6060
ADDP4
ASGNP4
ADDRLP4 1044
INDIRP4
ADDRLP4 1044
INDIRP4
INDIRF4
ADDRFP4 4
INDIRF4
ADDF4
ASGNF4
line 1025
;1024:	//
;1025:	bs->thinktime = thinktime;
ADDRLP4 4
INDIRP4
CNSTI4 4904
ADDP4
ADDRFP4 4
INDIRF4
ASGNF4
line 1027
;1026:	//origin of the bot
;1027:	VectorCopy(bs->cur_ps.origin, bs->origin);
ADDRLP4 4
INDIRP4
CNSTI4 4908
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 1029
;1028:	//eye coordinates of the bot
;1029:	VectorCopy(bs->cur_ps.origin, bs->eye);
ADDRLP4 4
INDIRP4
CNSTI4 4936
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 1030
;1030:	bs->eye[2] += bs->cur_ps.viewheight;
ADDRLP4 1060
ADDRLP4 4
INDIRP4
CNSTI4 4944
ADDP4
ASGNP4
ADDRLP4 1060
INDIRP4
ADDRLP4 1060
INDIRP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1032
;1031:	//get the area the bot is in
;1032:	bs->areanum = BotPointAreaNum(bs->origin);
ADDRLP4 4
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 1068
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 4948
ADDP4
ADDRLP4 1068
INDIRI4
ASGNI4
line 1034
;1033:	//the real AI
;1034:	BotDeathmatchAI(bs, thinktime);
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRGP4 BotDeathmatchAI
CALLV
pop
line 1036
;1035:	//set the weapon selection every AI frame
;1036:	trap_EA_SelectWeapon(bs->client, bs->weaponnum);
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_SelectWeapon
CALLV
pop
line 1038
;1037:	//subtract the delta angles
;1038:	for (j = 0; j < 3; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $528
line 1039
;1039:		bs->viewangles[j] = AngleMod(bs->viewangles[j] - SHORT2ANGLE(bs->cur_ps.delta_angles[j]));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 72
ADDP4
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1001652224
MULF4
SUBF4
ARGF4
ADDRLP4 1084
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
ADDRLP4 1084
INDIRF4
ASGNF4
line 1040
;1040:	}
LABELV $529
line 1038
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $528
line 1042
;1041:	//everything was ok
;1042:	return qtrue;
CNSTI4 1
RETI4
LABELV $493
endproc BotAI 1088 12
export BotScheduleBotThink
proc BotScheduleBotThink 16 0
line 1050
;1043:}
;1044:
;1045:/*
;1046:==================
;1047:BotScheduleBotThink
;1048:==================
;1049:*/
;1050:void BotScheduleBotThink(void) {
line 1053
;1051:	int i, botnum;
;1052:
;1053:	botnum = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1055
;1054:
;1055:	for( i = 0; i < MAX_CLIENTS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $533
line 1056
;1056:		if( !botstates[i] || !botstates[i]->inuse ) {
ADDRLP4 12
ADDRGP4 botstates
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $539
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
ADDP4
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $537
LABELV $539
line 1057
;1057:			continue;
ADDRGP4 $534
JUMPV
LABELV $537
line 1060
;1058:		}
;1059:		//initialize the bot think residual time
;1060:		botstates[i]->botthink_residual = bot_thinktime.integer * botnum / numbots;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 bot_thinktime+12
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 numbots
INDIRI4
DIVI4
ASGNI4
line 1061
;1061:		botnum++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1062
;1062:	}
LABELV $534
line 1055
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $533
line 1063
;1063:}
LABELV $532
endproc BotScheduleBotThink 16 0
export BotWriteSessionData
proc BotWriteSessionData 20 72
line 1070
;1064:
;1065:/*
;1066:==============
;1067:BotWriteSessionData
;1068:==============
;1069:*/
;1070:void BotWriteSessionData(bot_state_t *bs) {
line 1074
;1071:	const char	*s;
;1072:	const char	*var;
;1073:
;1074:	s = va(
ADDRGP4 $542
ARGP4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 6756
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 6764
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 6780
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 6808
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 6816
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 6820
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 6812
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 6768
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 6772
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 6776
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 6784
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 6788
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 6792
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 6796
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 6800
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 6804
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 1098
;1075:			"%i %i %i %i %i %i %i %i"
;1076:			" %f %f %f"
;1077:			" %f %f %f"
;1078:			" %f %f %f",
;1079:		bs->lastgoal_decisionmaker,
;1080:		bs->lastgoal_ltgtype,
;1081:		bs->lastgoal_teammate,
;1082:		bs->lastgoal_teamgoal.areanum,
;1083:		bs->lastgoal_teamgoal.entitynum,
;1084:		bs->lastgoal_teamgoal.flags,
;1085:		bs->lastgoal_teamgoal.iteminfo,
;1086:		bs->lastgoal_teamgoal.number,
;1087:		bs->lastgoal_teamgoal.origin[0],
;1088:		bs->lastgoal_teamgoal.origin[1],
;1089:		bs->lastgoal_teamgoal.origin[2],
;1090:		bs->lastgoal_teamgoal.mins[0],
;1091:		bs->lastgoal_teamgoal.mins[1],
;1092:		bs->lastgoal_teamgoal.mins[2],
;1093:		bs->lastgoal_teamgoal.maxs[0],
;1094:		bs->lastgoal_teamgoal.maxs[1],
;1095:		bs->lastgoal_teamgoal.maxs[2]
;1096:		);
;1097:
;1098:	var = va( "botsession%i", bs->client );
ADDRGP4 $543
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
ASGNP4
line 1100
;1099:
;1100:	trap_Cvar_Set( var, s );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1101
;1101:}
LABELV $541
endproc BotWriteSessionData 20 72
export BotReadSessionData
proc BotReadSessionData 1036 76
line 1108
;1102:
;1103:/*
;1104:==============
;1105:BotReadSessionData
;1106:==============
;1107:*/
;1108:void BotReadSessionData(bot_state_t *bs) {
line 1112
;1109:	char	s[MAX_STRING_CHARS];
;1110:	const char	*var;
;1111:
;1112:	var = va( "botsession%i", bs->client );
ADDRGP4 $543
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1024
ADDRLP4 1028
INDIRP4
ASGNP4
line 1113
;1113:	trap_Cvar_VariableStringBuffer( var, s, sizeof(s) );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1115
;1114:
;1115:	Q_sscanf(s,
ADDRLP4 0
ARGP4
ADDRGP4 $542
ARGP4
ADDRLP4 1032
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1032
INDIRP4
CNSTI4 6756
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6760
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6764
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6780
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6808
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6816
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6820
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6812
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6768
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6772
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6776
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6784
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6788
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6792
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6796
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6800
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6804
ADDP4
ARGP4
ADDRGP4 Q_sscanf
CALLI4
pop
line 1138
;1116:			"%i %i %i %i %i %i %i %i"
;1117:			" %f %f %f"
;1118:			" %f %f %f"
;1119:			" %f %f %f",
;1120:		&bs->lastgoal_decisionmaker,
;1121:		&bs->lastgoal_ltgtype,
;1122:		&bs->lastgoal_teammate,
;1123:		&bs->lastgoal_teamgoal.areanum,
;1124:		&bs->lastgoal_teamgoal.entitynum,
;1125:		&bs->lastgoal_teamgoal.flags,
;1126:		&bs->lastgoal_teamgoal.iteminfo,
;1127:		&bs->lastgoal_teamgoal.number,
;1128:		&bs->lastgoal_teamgoal.origin[0],
;1129:		&bs->lastgoal_teamgoal.origin[1],
;1130:		&bs->lastgoal_teamgoal.origin[2],
;1131:		&bs->lastgoal_teamgoal.mins[0],
;1132:		&bs->lastgoal_teamgoal.mins[1],
;1133:		&bs->lastgoal_teamgoal.mins[2],
;1134:		&bs->lastgoal_teamgoal.maxs[0],
;1135:		&bs->lastgoal_teamgoal.maxs[1],
;1136:		&bs->lastgoal_teamgoal.maxs[2]
;1137:		);
;1138:}
LABELV $544
endproc BotReadSessionData 1036 76
export BotAISetupClient
proc BotAISetupClient 512 16
line 1145
;1139:
;1140:/*
;1141:==============
;1142:BotAISetupClient
;1143:==============
;1144:*/
;1145:qboolean BotAISetupClient( int client, struct bot_settings_s *settings, qboolean restart ) {
line 1150
;1146:	char filename[MAX_PATH], name[MAX_PATH], gender[MAX_PATH];
;1147:	bot_state_t *bs;
;1148:	int errnum;
;1149:
;1150:	if (!botstates[client]) botstates[client] = G_Alloc(sizeof(bot_state_t));
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $546
CNSTI4 9092
ARGI4
ADDRLP4 440
ADDRGP4 G_Alloc
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
ADDRLP4 440
INDIRP4
ASGNP4
LABELV $546
line 1151
;1151:	bs = botstates[client];
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
line 1152
;1152:	if ( bs == NULL ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $548
line 1153
;1153:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $545
JUMPV
LABELV $548
line 1156
;1154:	}
;1155:
;1156:	if (bs && bs->inuse) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $550
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $550
line 1157
;1157:		BotAI_Print(PRT_FATAL, "BotAISetupClient: client %d already setup\n", client);
CNSTI4 4
ARGI4
ADDRGP4 $552
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 1158
;1158:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $545
JUMPV
LABELV $550
line 1161
;1159:	}
;1160:
;1161:	if (!trap_AAS_Initialized()) {
ADDRLP4 448
ADDRGP4 trap_AAS_Initialized
CALLI4
ASGNI4
ADDRLP4 448
INDIRI4
CNSTI4 0
NEI4 $553
line 1162
;1162:		BotAI_Print(PRT_FATAL, "AAS not initialized\n");
CNSTI4 4
ARGI4
ADDRGP4 $555
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 1163
;1163:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $545
JUMPV
LABELV $553
line 1167
;1164:	}
;1165:
;1166:	//load the bot character
;1167:	bs->character = trap_BotLoadCharacter(settings->characterfile, settings->skill);
ADDRLP4 452
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 452
INDIRP4
ARGP4
ADDRLP4 452
INDIRP4
CNSTI4 144
ADDP4
INDIRF4
ARGF4
ADDRLP4 456
ADDRGP4 trap_BotLoadCharacter
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 6520
ADDP4
ADDRLP4 456
INDIRI4
ASGNI4
line 1168
;1168:	if (!bs->character) {
ADDRLP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $556
line 1169
;1169:		BotAI_Print(PRT_FATAL, "couldn't load skill %f from %s\n", settings->skill, settings->characterfile);
CNSTI4 4
ARGI4
ADDRGP4 $558
ARGP4
ADDRLP4 460
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 460
INDIRP4
CNSTI4 144
ADDP4
INDIRF4
ARGF4
ADDRLP4 460
INDIRP4
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 1170
;1170:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $545
JUMPV
LABELV $556
line 1173
;1171:	}
;1172:	//copy the settings
;1173:	memcpy(&bs->settings, settings, sizeof(bot_settings_t));
ADDRLP4 0
INDIRP4
CNSTI4 4608
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 292
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1175
;1174:	//allocate a goal state
;1175:	bs->gs = trap_BotAllocGoalState(client);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 460
ADDRGP4 trap_BotAllocGoalState
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 6528
ADDP4
ADDRLP4 460
INDIRI4
ASGNI4
line 1177
;1176:	//load the item weights
;1177:	trap_Characteristic_String(bs->character, CHARACTERISTIC_ITEMWEIGHTS, filename, MAX_PATH);
ADDRLP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 40
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Characteristic_String
CALLV
pop
line 1178
;1178:	errnum = trap_BotLoadItemWeights(bs->gs, filename);
ADDRLP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 464
ADDRGP4 trap_BotLoadItemWeights
CALLI4
ASGNI4
ADDRLP4 148
ADDRLP4 464
INDIRI4
ASGNI4
line 1179
;1179:	if (errnum != BLERR_NOERROR) {
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $559
line 1180
;1180:		trap_BotFreeGoalState(bs->gs);
ADDRLP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeGoalState
CALLV
pop
line 1181
;1181:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $545
JUMPV
LABELV $559
line 1184
;1182:	}
;1183:	//allocate a weapon state
;1184:	bs->ws = trap_BotAllocWeaponState();
ADDRLP4 468
ADDRGP4 trap_BotAllocWeaponState
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 6536
ADDP4
ADDRLP4 468
INDIRI4
ASGNI4
line 1186
;1185:	//load the weapon weights
;1186:	trap_Characteristic_String(bs->character, CHARACTERISTIC_WEAPONWEIGHTS, filename, MAX_PATH);
ADDRLP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Characteristic_String
CALLV
pop
line 1187
;1187:	errnum = trap_BotLoadWeaponWeights(bs->ws, filename);
ADDRLP4 0
INDIRP4
CNSTI4 6536
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 472
ADDRGP4 trap_BotLoadWeaponWeights
CALLI4
ASGNI4
ADDRLP4 148
ADDRLP4 472
INDIRI4
ASGNI4
line 1188
;1188:	if (errnum != BLERR_NOERROR) {
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $561
line 1189
;1189:		trap_BotFreeGoalState(bs->gs);
ADDRLP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeGoalState
CALLV
pop
line 1190
;1190:		trap_BotFreeWeaponState(bs->ws);
ADDRLP4 0
INDIRP4
CNSTI4 6536
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeWeaponState
CALLV
pop
line 1191
;1191:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $545
JUMPV
LABELV $561
line 1194
;1192:	}
;1193:	//allocate a chat state
;1194:	bs->cs = trap_BotAllocChatState();
ADDRLP4 476
ADDRGP4 trap_BotAllocChatState
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 6532
ADDP4
ADDRLP4 476
INDIRI4
ASGNI4
line 1196
;1195:	//load the chat file
;1196:	trap_Characteristic_String(bs->character, CHARACTERISTIC_CHAT_FILE, filename, MAX_PATH);
ADDRLP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 21
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Characteristic_String
CALLV
pop
line 1197
;1197:	trap_Characteristic_String(bs->character, CHARACTERISTIC_CHAT_NAME, name, MAX_PATH);
ADDRLP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 22
ARGI4
ADDRLP4 296
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Characteristic_String
CALLV
pop
line 1198
;1198:	errnum = trap_BotLoadChatFile(bs->cs, filename, name);
ADDRLP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 296
ARGP4
ADDRLP4 480
ADDRGP4 trap_BotLoadChatFile
CALLI4
ASGNI4
ADDRLP4 148
ADDRLP4 480
INDIRI4
ASGNI4
line 1199
;1199:	if (errnum != BLERR_NOERROR) {
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $563
line 1200
;1200:		trap_BotFreeChatState(bs->cs);
ADDRLP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeChatState
CALLV
pop
line 1201
;1201:		trap_BotFreeGoalState(bs->gs);
ADDRLP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeGoalState
CALLV
pop
line 1202
;1202:		trap_BotFreeWeaponState(bs->ws);
ADDRLP4 0
INDIRP4
CNSTI4 6536
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeWeaponState
CALLV
pop
line 1203
;1203:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $545
JUMPV
LABELV $563
line 1206
;1204:	}
;1205:	//get the gender characteristic
;1206:	trap_Characteristic_String(bs->character, CHARACTERISTIC_GENDER, gender, MAX_PATH);
ADDRLP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 152
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Characteristic_String
CALLV
pop
line 1208
;1207:	//set the chat gender
;1208:	if (*gender == 'f' || *gender == 'F') trap_BotSetChatGender(bs->cs, CHAT_GENDERFEMALE);
ADDRLP4 484
ADDRLP4 152
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 484
INDIRI4
CNSTI4 102
EQI4 $567
ADDRLP4 484
INDIRI4
CNSTI4 70
NEI4 $565
LABELV $567
ADDRLP4 0
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
ADDRGP4 $566
JUMPV
LABELV $565
line 1209
;1209:	else if (*gender == 'm' || *gender == 'M') trap_BotSetChatGender(bs->cs, CHAT_GENDERMALE);
ADDRLP4 488
ADDRLP4 152
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 488
INDIRI4
CNSTI4 109
EQI4 $570
ADDRLP4 488
INDIRI4
CNSTI4 77
NEI4 $568
LABELV $570
ADDRLP4 0
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
ADDRGP4 $569
JUMPV
LABELV $568
line 1210
;1210:	else trap_BotSetChatGender(bs->cs, CHAT_GENDERLESS);
ADDRLP4 0
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
LABELV $569
LABELV $566
line 1212
;1211:
;1212:	bs->inuse = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 1
ASGNI4
line 1213
;1213:	bs->client = client;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 1214
;1214:	bs->entitynum = client;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 1215
;1215:	bs->setupcount = 4;
ADDRLP4 0
INDIRP4
CNSTI4 6016
ADDP4
CNSTI4 4
ASGNI4
line 1216
;1216:	bs->entergame_time = FloatTime();
ADDRLP4 0
INDIRP4
CNSTI4 6064
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1217
;1217:	bs->ms = trap_BotAllocMoveState();
ADDRLP4 492
ADDRGP4 trap_BotAllocMoveState
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 6524
ADDP4
ADDRLP4 492
INDIRI4
ASGNI4
line 1218
;1218:	bs->walker = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_WALKER, 0, 1);
ADDRLP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 48
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 500
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 6056
ADDP4
ADDRLP4 500
INDIRF4
ASGNF4
line 1219
;1219:	numbots++;
ADDRLP4 504
ADDRGP4 numbots
ASGNP4
ADDRLP4 504
INDIRP4
ADDRLP4 504
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1221
;1220:
;1221:	if (trap_Cvar_VariableIntegerValue("bot_testichat")) {
ADDRGP4 $573
ARGP4
ADDRLP4 508
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 508
INDIRI4
CNSTI4 0
EQI4 $571
line 1222
;1222:		trap_BotLibVarSet("bot_testichat", "1");
ADDRGP4 $573
ARGP4
ADDRGP4 $342
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 1223
;1223:		BotChatTest(bs);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 BotChatTest
CALLV
pop
line 1224
;1224:	}
LABELV $571
line 1226
;1225:	//NOTE: reschedule the bot thinking
;1226:	BotScheduleBotThink();
ADDRGP4 BotScheduleBotThink
CALLV
pop
line 1228
;1227:	//if interbreeding start with a mutation
;1228:	if (bot_interbreed) {
ADDRGP4 bot_interbreed
INDIRI4
CNSTI4 0
EQI4 $574
line 1229
;1229:		trap_BotMutateGoalFuzzyLogic(bs->gs, 1);
ADDRLP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_BotMutateGoalFuzzyLogic
CALLV
pop
line 1230
;1230:	}
LABELV $574
line 1232
;1231:	// if we kept the bot client
;1232:	if (restart) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $576
line 1233
;1233:		BotReadSessionData(bs);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 BotReadSessionData
CALLV
pop
line 1234
;1234:	}
LABELV $576
line 1236
;1235:	//bot has been setup succesfully
;1236:	return qtrue;
CNSTI4 1
RETI4
LABELV $545
endproc BotAISetupClient 512 16
export BotAIShutdownClient
proc BotAIShutdownClient 16 12
line 1244
;1237:}
;1238:
;1239:/*
;1240:==============
;1241:BotAIShutdownClient
;1242:==============
;1243:*/
;1244:int BotAIShutdownClient(int client, qboolean restart) {
line 1247
;1245:	bot_state_t *bs;
;1246:
;1247:	bs = botstates[client];
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
line 1248
;1248:	if (!bs || !bs->inuse) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $581
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $579
LABELV $581
line 1250
;1249:		//BotAI_Print(PRT_ERROR, "BotAIShutdownClient: client %d already shutdown\n", client);
;1250:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $578
JUMPV
LABELV $579
line 1253
;1251:	}
;1252:
;1253:	if (restart) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $582
line 1254
;1254:		BotWriteSessionData(bs);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 BotWriteSessionData
CALLV
pop
line 1255
;1255:	}
LABELV $582
line 1257
;1256:
;1257:	if (BotChat_ExitGame(bs)) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BotChat_ExitGame
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $584
line 1258
;1258:		trap_BotEnterChat(bs->cs, bs->client, CHAT_ALL);
ADDRLP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1259
;1259:	}
LABELV $584
line 1261
;1260:
;1261:	trap_BotFreeMoveState(bs->ms);
ADDRLP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeMoveState
CALLV
pop
line 1263
;1262:	//free the goal state
;1263:	trap_BotFreeGoalState(bs->gs);
ADDRLP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeGoalState
CALLV
pop
line 1265
;1264:	//free the chat file
;1265:	trap_BotFreeChatState(bs->cs);
ADDRLP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeChatState
CALLV
pop
line 1267
;1266:	//free the weapon weights
;1267:	trap_BotFreeWeaponState(bs->ws);
ADDRLP4 0
INDIRP4
CNSTI4 6536
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeWeaponState
CALLV
pop
line 1269
;1268:	//free the bot character
;1269:	trap_BotFreeCharacter(bs->character);
ADDRLP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeCharacter
CALLV
pop
line 1271
;1270:	//
;1271:	BotFreeWaypoints(bs->checkpoints);
ADDRLP4 0
INDIRP4
CNSTI4 9076
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotFreeWaypoints
CALLV
pop
line 1272
;1272:	BotFreeWaypoints(bs->patrolpoints);
ADDRLP4 0
INDIRP4
CNSTI4 9080
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotFreeWaypoints
CALLV
pop
line 1274
;1273:	//clear activate goal stack
;1274:	BotClearActivateGoalStack(bs);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 BotClearActivateGoalStack
CALLV
pop
line 1276
;1275:	//clear the bot state
;1276:	memset(bs, 0, sizeof(bot_state_t));
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 9092
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1278
;1277:	//set the inuse flag to qfalse
;1278:	bs->inuse = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 1280
;1279:	//there's one bot less
;1280:	numbots--;
ADDRLP4 12
ADDRGP4 numbots
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1282
;1281:	//everything went ok
;1282:	return qtrue;
CNSTI4 1
RETI4
LABELV $578
endproc BotAIShutdownClient 16 12
export BotResetState
proc BotResetState 796 12
line 1294
;1283:}
;1284:
;1285:
;1286:/*
;1287:==============
;1288:BotResetState
;1289:
;1290:called when a bot enters the intermission or observer mode and
;1291:when the level is changed
;1292:==============
;1293:*/
;1294:void BotResetState(bot_state_t *bs) {
line 1303
;1295:	int client, entitynum, inuse;
;1296:	int movestate, goalstate, chatstate, weaponstate;
;1297:	bot_settings_t settings;
;1298:	int character;
;1299:	playerState_t ps;							//current player state
;1300:	float entergame_time;
;1301:
;1302:	//save some things that should not be reset here
;1303:	memcpy(&settings, &bs->settings, sizeof(bot_settings_t));
ADDRLP4 28
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 4608
ADDP4
ARGP4
CNSTI4 292
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1304
;1304:	memcpy(&ps, &bs->cur_ps, sizeof(playerState_t));
ADDRLP4 324
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ARGP4
CNSTI4 468
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1305
;1305:	inuse = bs->inuse;
ADDRLP4 8
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1306
;1306:	client = bs->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1307
;1307:	entitynum = bs->entitynum;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1308
;1308:	character = bs->character;
ADDRLP4 320
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ASGNI4
line 1309
;1309:	movestate = bs->ms;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ASGNI4
line 1310
;1310:	goalstate = bs->gs;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ASGNI4
line 1311
;1311:	chatstate = bs->cs;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ASGNI4
line 1312
;1312:	weaponstate = bs->ws;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 6536
ADDP4
INDIRI4
ASGNI4
line 1313
;1313:	entergame_time = bs->entergame_time;
ADDRLP4 792
ADDRFP4 0
INDIRP4
CNSTI4 6064
ADDP4
INDIRF4
ASGNF4
line 1315
;1314:	//free checkpoints and patrol points
;1315:	BotFreeWaypoints(bs->checkpoints);
ADDRFP4 0
INDIRP4
CNSTI4 9076
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotFreeWaypoints
CALLV
pop
line 1316
;1316:	BotFreeWaypoints(bs->patrolpoints);
ADDRFP4 0
INDIRP4
CNSTI4 9080
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotFreeWaypoints
CALLV
pop
line 1318
;1317:	//reset the whole state
;1318:	memset(bs, 0, sizeof(bot_state_t));
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 9092
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1320
;1319:	//copy back some state stuff that should not be reset
;1320:	bs->ms = movestate;
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1321
;1321:	bs->gs = goalstate;
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1322
;1322:	bs->cs = chatstate;
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 1323
;1323:	bs->ws = weaponstate;
ADDRFP4 0
INDIRP4
CNSTI4 6536
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 1324
;1324:	memcpy(&bs->cur_ps, &ps, sizeof(playerState_t));
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ARGP4
ADDRLP4 324
ARGP4
CNSTI4 468
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1325
;1325:	memcpy(&bs->settings, &settings, sizeof(bot_settings_t));
ADDRFP4 0
INDIRP4
CNSTI4 4608
ADDP4
ARGP4
ADDRLP4 28
ARGP4
CNSTI4 292
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1326
;1326:	bs->inuse = inuse;
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1327
;1327:	bs->client = client;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1328
;1328:	bs->entitynum = entitynum;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1329
;1329:	bs->character = character;
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
ADDRLP4 320
INDIRI4
ASGNI4
line 1330
;1330:	bs->entergame_time = entergame_time;
ADDRFP4 0
INDIRP4
CNSTI4 6064
ADDP4
ADDRLP4 792
INDIRF4
ASGNF4
line 1332
;1331:	//reset several states
;1332:	if (bs->ms) trap_BotResetMoveState(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
CNSTI4 0
EQI4 $587
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetMoveState
CALLV
pop
LABELV $587
line 1333
;1333:	if (bs->gs) trap_BotResetGoalState(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
CNSTI4 0
EQI4 $589
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetGoalState
CALLV
pop
LABELV $589
line 1334
;1334:	if (bs->ws) trap_BotResetWeaponState(bs->ws);
ADDRFP4 0
INDIRP4
CNSTI4 6536
ADDP4
INDIRI4
CNSTI4 0
EQI4 $591
ADDRFP4 0
INDIRP4
CNSTI4 6536
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetWeaponState
CALLV
pop
LABELV $591
line 1335
;1335:	if (bs->gs) trap_BotResetAvoidGoals(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
CNSTI4 0
EQI4 $593
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidGoals
CALLV
pop
LABELV $593
line 1336
;1336:	if (bs->ms) trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
CNSTI4 0
EQI4 $595
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
LABELV $595
line 1337
;1337:}
LABELV $586
endproc BotResetState 796 12
export BotAILoadMap
proc BotAILoadMap 1040 12
line 1344
;1338:
;1339:/*
;1340:==============
;1341:BotAILoadMap
;1342:==============
;1343:*/
;1344:int BotAILoadMap( int restart ) {
line 1348
;1345:	char		serverinfo[MAX_INFO_STRING];
;1346:	int			i;
;1347:
;1348:	trap_GetServerinfo( serverinfo, sizeof( serverinfo ) );
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetServerinfo
CALLV
pop
line 1349
;1349:	Q_strncpyz( mapname, Info_ValueForKey( serverinfo, "mapname" ), sizeof( mapname ) );
ADDRLP4 4
ARGP4
ADDRGP4 $598
ARGP4
ADDRLP4 1028
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 mapname
ARGP4
ADDRLP4 1028
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1351
;1350:
;1351:	if ( !restart ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $599
line 1352
;1352:		trap_BotLibLoadMap( mapname );
ADDRGP4 mapname
ARGP4
ADDRGP4 trap_BotLibLoadMap
CALLI4
pop
line 1353
;1353:	}
LABELV $599
line 1355
;1354:
;1355:	for ( i = 0; i < level.maxclients; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $604
JUMPV
LABELV $601
line 1356
;1356:		if ( botstates[i] && botstates[i]->inuse ) {
ADDRLP4 1036
ADDRGP4 botstates
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1036
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $606
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1036
INDIRP4
ADDP4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $606
line 1357
;1357:			BotResetState( botstates[i] );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotResetState
CALLV
pop
line 1358
;1358:			botstates[i]->setupcount = 4;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 6016
ADDP4
CNSTI4 4
ASGNI4
line 1359
;1359:		}
LABELV $606
line 1360
;1360:	}
LABELV $602
line 1355
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $604
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $601
line 1362
;1361:
;1362:	BotSetupDeathmatchAI();
ADDRGP4 BotSetupDeathmatchAI
CALLV
pop
line 1364
;1363:
;1364:	return qtrue;
CNSTI4 1
RETI4
LABELV $597
endproc BotAILoadMap 1040 12
bss
align 4
LABELV $609
skip 4
align 4
LABELV $610
skip 4
align 4
LABELV $611
skip 4
align 4
LABELV $612
skip 4096
align 4
LABELV $613
skip 4
export BotAIStartFrame
code
proc BotAIStartFrame 156 12
line 1374
;1365:}
;1366:
;1367:void ProximityMine_Trigger( gentity_t *trigger, gentity_t *other, trace_t *trace );
;1368:
;1369:/*
;1370:==================
;1371:BotAIStartFrame
;1372:==================
;1373:*/
;1374:int BotAIStartFrame(int time) {
line 1384
;1375:	int i;
;1376:	gentity_t	*ent;
;1377:	bot_entitystate_t state;
;1378:	int elapsed_time, thinktime;
;1379:	static int local_time;
;1380:	static int botlib_residual;
;1381:	static int lastbotthink_time;
;1382:	static qboolean skip[MAX_GENTITIES], *s;
;1383:
;1384:	G_CheckBotSpawn();
ADDRGP4 G_CheckBotSpawn
CALLV
pop
line 1386
;1385:
;1386:	trap_Cvar_Update(&bot_rocketjump);
ADDRGP4 bot_rocketjump
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1387
;1387:	trap_Cvar_Update(&bot_grapple);
ADDRGP4 bot_grapple
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1388
;1388:	trap_Cvar_Update(&bot_fastchat);
ADDRGP4 bot_fastchat
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1389
;1389:	trap_Cvar_Update(&bot_nochat);
ADDRGP4 bot_nochat
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1390
;1390:	trap_Cvar_Update(&bot_testrchat);
ADDRGP4 bot_testrchat
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1391
;1391:	trap_Cvar_Update(&bot_thinktime);
ADDRGP4 bot_thinktime
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1392
;1392:	trap_Cvar_Update(&bot_memorydump);
ADDRGP4 bot_memorydump
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1393
;1393:	trap_Cvar_Update(&bot_saveroutingcache);
ADDRGP4 bot_saveroutingcache
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1394
;1394:	trap_Cvar_Update(&bot_pause);
ADDRGP4 bot_pause
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1395
;1395:	trap_Cvar_Update(&bot_report);
ADDRGP4 bot_report
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1397
;1396:
;1397:	if (bot_report.integer) {
ADDRGP4 bot_report+12
INDIRI4
CNSTI4 0
EQI4 $614
line 1400
;1398://		BotTeamplayReport();
;1399://		trap_Cvar_Set("bot_report", "0");
;1400:		BotUpdateInfoConfigStrings();
ADDRGP4 BotUpdateInfoConfigStrings
CALLV
pop
line 1401
;1401:	}
LABELV $614
line 1403
;1402:
;1403:	if (bot_pause.integer) {
ADDRGP4 bot_pause+12
INDIRI4
CNSTI4 0
EQI4 $617
line 1405
;1404:		// execute bot user commands every frame
;1405:		for( i = 0; i < level.maxclients; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $623
JUMPV
LABELV $620
line 1406
;1406:			if( !botstates[i] || !botstates[i]->inuse ) {
ADDRLP4 132
ADDRGP4 botstates
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 132
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $627
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 132
INDIRP4
ADDP4
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $625
LABELV $627
line 1407
;1407:				continue;
ADDRGP4 $621
JUMPV
LABELV $625
line 1409
;1408:			}
;1409:			if( g_entities[i].client->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $628
line 1410
;1410:				continue;
ADDRGP4 $621
JUMPV
LABELV $628
line 1412
;1411:			}
;1412:			botstates[i]->lastucmd.forwardmove = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 509
ADDP4
CNSTI1 0
ASGNI1
line 1413
;1413:			botstates[i]->lastucmd.rightmove = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 510
ADDP4
CNSTI1 0
ASGNI1
line 1414
;1414:			botstates[i]->lastucmd.upmove = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 511
ADDP4
CNSTI1 0
ASGNI1
line 1415
;1415:			botstates[i]->lastucmd.buttons = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 0
ASGNI4
line 1416
;1416:			botstates[i]->lastucmd.serverTime = time;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 488
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 1417
;1417:			trap_BotUserCommand(botstates[i]->client, &botstates[i]->lastucmd);
ADDRLP4 140
ADDRGP4 botstates
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 140
INDIRP4
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 140
INDIRP4
ADDP4
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRGP4 trap_BotUserCommand
CALLV
pop
line 1418
;1418:		}
LABELV $621
line 1405
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $623
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $620
line 1419
;1419:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $608
JUMPV
LABELV $617
line 1422
;1420:	}
;1421:
;1422:	if (bot_memorydump.integer) {
ADDRGP4 bot_memorydump+12
INDIRI4
CNSTI4 0
EQI4 $631
line 1423
;1423:		trap_BotLibVarSet("memorydump", "1");
ADDRGP4 $634
ARGP4
ADDRGP4 $342
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 1424
;1424:		trap_Cvar_Set("bot_memorydump", "0");
ADDRGP4 $635
ARGP4
ADDRGP4 $636
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1425
;1425:	}
LABELV $631
line 1426
;1426:	if (bot_saveroutingcache.integer) {
ADDRGP4 bot_saveroutingcache+12
INDIRI4
CNSTI4 0
EQI4 $637
line 1427
;1427:		trap_BotLibVarSet("saveroutingcache", "1");
ADDRGP4 $640
ARGP4
ADDRGP4 $342
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 1428
;1428:		trap_Cvar_Set("bot_saveroutingcache", "0");
ADDRGP4 $641
ARGP4
ADDRGP4 $636
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1429
;1429:	}
LABELV $637
line 1431
;1430:	//check if bot interbreeding is activated
;1431:	BotInterbreeding();
ADDRGP4 BotInterbreeding
CALLV
pop
line 1433
;1432:	//cap the bot think time
;1433:	if (bot_thinktime.integer > 200) {
ADDRGP4 bot_thinktime+12
INDIRI4
CNSTI4 200
LEI4 $642
line 1434
;1434:		trap_Cvar_Set("bot_thinktime", "200");
ADDRGP4 $645
ARGP4
ADDRGP4 $646
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1435
;1435:	}
LABELV $642
line 1437
;1436:	//if the bot think time changed we should reschedule the bots
;1437:	if (bot_thinktime.integer != lastbotthink_time) {
ADDRGP4 bot_thinktime+12
INDIRI4
ADDRGP4 $611
INDIRI4
EQI4 $647
line 1438
;1438:		lastbotthink_time = bot_thinktime.integer;
ADDRGP4 $611
ADDRGP4 bot_thinktime+12
INDIRI4
ASGNI4
line 1439
;1439:		BotScheduleBotThink();
ADDRGP4 BotScheduleBotThink
CALLV
pop
line 1440
;1440:	}
LABELV $647
line 1442
;1441:
;1442:	elapsed_time = time - local_time;
ADDRLP4 120
ADDRFP4 0
INDIRI4
ADDRGP4 $609
INDIRI4
SUBI4
ASGNI4
line 1443
;1443:	local_time = time;
ADDRGP4 $609
ADDRFP4 0
INDIRI4
ASGNI4
line 1445
;1444:
;1445:	botlib_residual += elapsed_time;
ADDRLP4 128
ADDRGP4 $610
ASGNP4
ADDRLP4 128
INDIRP4
ADDRLP4 128
INDIRP4
INDIRI4
ADDRLP4 120
INDIRI4
ADDI4
ASGNI4
line 1447
;1446:
;1447:	if (elapsed_time > bot_thinktime.integer) thinktime = elapsed_time;
ADDRLP4 120
INDIRI4
ADDRGP4 bot_thinktime+12
INDIRI4
LEI4 $651
ADDRLP4 124
ADDRLP4 120
INDIRI4
ASGNI4
ADDRGP4 $652
JUMPV
LABELV $651
line 1448
;1448:	else thinktime = bot_thinktime.integer;
ADDRLP4 124
ADDRGP4 bot_thinktime+12
INDIRI4
ASGNI4
LABELV $652
line 1451
;1449:
;1450:	// update the bot library
;1451:	if ( botlib_residual >= thinktime ) {
ADDRGP4 $610
INDIRI4
ADDRLP4 124
INDIRI4
LTI4 $655
line 1452
;1452:		botlib_residual -= thinktime;
ADDRLP4 132
ADDRGP4 $610
ASGNP4
ADDRLP4 132
INDIRP4
ADDRLP4 132
INDIRP4
INDIRI4
ADDRLP4 124
INDIRI4
SUBI4
ASGNI4
line 1454
;1453:
;1454:		trap_BotLibStartFrame((float) time / 1000);
ADDRFP4 0
INDIRI4
CVIF4 4
CNSTF4 981668463
MULF4
ARGF4
ADDRGP4 trap_BotLibStartFrame
CALLI4
pop
line 1456
;1455:
;1456:		if (!trap_AAS_Initialized()) return qfalse;
ADDRLP4 136
ADDRGP4 trap_AAS_Initialized
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 0
NEI4 $657
CNSTI4 0
RETI4
ADDRGP4 $608
JUMPV
LABELV $657
line 1459
;1457:
;1458:		//update entities in the botlib
;1459:		s = skip;
ADDRGP4 $613
ADDRGP4 $612
ASGNP4
line 1460
;1460:		ent = g_entities;
ADDRLP4 4
ADDRGP4 g_entities
ASGNP4
line 1461
;1461:		for ( i = 0; i < level.num_entities; i++, s++, ent++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $662
JUMPV
LABELV $659
line 1462
;1462:			ent = &g_entities[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1463
;1463:			if ( !ent->inuse || !ent->r.linked || ent->r.svFlags & SVF_NOCLIENT ) {
ADDRLP4 4
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $667
ADDRLP4 4
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
CNSTI4 0
EQI4 $667
ADDRLP4 4
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $664
LABELV $667
line 1464
;1464:				if ( *s == qfalse ) {
ADDRGP4 $613
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $660
line 1465
;1465:					*s = qtrue;
ADDRGP4 $613
INDIRP4
CNSTI4 1
ASGNI4
line 1466
;1466:					trap_BotLibUpdateEntity( i, NULL );
ADDRLP4 0
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 trap_BotLibUpdateEntity
CALLI4
pop
line 1467
;1467:				}
line 1468
;1468:				continue;
ADDRGP4 $660
JUMPV
LABELV $664
line 1471
;1469:			}
;1470:			// do not update missiles
;1471:			if ( ent->s.eType == ET_MISSILE && ent->s.weapon != WP_GRAPPLING_HOOK ) {
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $670
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 10
EQI4 $670
line 1472
;1472:				if ( *s == qfalse ) {
ADDRGP4 $613
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $660
line 1473
;1473:					*s = qtrue;
ADDRGP4 $613
INDIRP4
CNSTI4 1
ASGNI4
line 1474
;1474:					trap_BotLibUpdateEntity( i, NULL );
ADDRLP4 0
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 trap_BotLibUpdateEntity
CALLI4
pop
line 1475
;1475:				}
line 1476
;1476:				continue;
ADDRGP4 $660
JUMPV
LABELV $670
line 1479
;1477:			}
;1478:			// do not update event only entities
;1479:			if ( ent->s.eType > ET_EVENTS ) {
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
LEI4 $674
line 1480
;1480:				if ( *s == qfalse ) {
ADDRGP4 $613
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $660
line 1481
;1481:					*s = qtrue;
ADDRGP4 $613
INDIRP4
CNSTI4 1
ASGNI4
line 1482
;1482:					trap_BotLibUpdateEntity( i, NULL );
ADDRLP4 0
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 trap_BotLibUpdateEntity
CALLI4
pop
line 1483
;1483:				}
line 1484
;1484:				continue;
ADDRGP4 $660
JUMPV
LABELV $674
line 1487
;1485:			}
;1486:			// never link prox mine triggers
;1487:			if (ent->r.contents == CONTENTS_TRIGGER) {
ADDRLP4 4
INDIRP4
CNSTI4 460
ADDP4
INDIRI4
CNSTI4 1073741824
NEI4 $678
line 1488
;1488:				if (ent->touch == ProximityMine_Trigger) {
ADDRLP4 4
INDIRP4
CNSTI4 704
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 ProximityMine_Trigger
CVPU4 4
NEU4 $680
line 1489
;1489:					trap_BotLibUpdateEntity(i, NULL);
ADDRLP4 0
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 trap_BotLibUpdateEntity
CALLI4
pop
line 1490
;1490:					continue;
ADDRGP4 $660
JUMPV
LABELV $680
line 1492
;1491:				}
;1492:			}
LABELV $678
line 1494
;1493:			//
;1494:			memset(&state, 0, sizeof(bot_entitystate_t));
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
CNSTI4 112
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1496
;1495:			//
;1496:			VectorCopy(ent->r.currentOrigin, state.origin);
ADDRLP4 8+8
ADDRLP4 4
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 1497
;1497:			if (i < MAX_CLIENTS) {
ADDRLP4 0
INDIRI4
CNSTI4 64
GEI4 $683
line 1498
;1498:				VectorCopy(ent->s.apos.trBase, state.angles);
ADDRLP4 8+20
ADDRLP4 4
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 1499
;1499:			} else {
ADDRGP4 $684
JUMPV
LABELV $683
line 1500
;1500:				VectorCopy(ent->r.currentAngles, state.angles);
ADDRLP4 8+20
ADDRLP4 4
INDIRP4
CNSTI4 500
ADDP4
INDIRB
ASGNB 12
line 1501
;1501:			}
LABELV $684
line 1502
;1502:			VectorCopy(ent->s.origin2, state.old_origin);
ADDRLP4 8+32
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 1503
;1503:			VectorCopy(ent->r.mins, state.mins);
ADDRLP4 8+44
ADDRLP4 4
INDIRP4
CNSTI4 436
ADDP4
INDIRB
ASGNB 12
line 1504
;1504:			VectorCopy(ent->r.maxs, state.maxs);
ADDRLP4 8+56
ADDRLP4 4
INDIRP4
CNSTI4 448
ADDP4
INDIRB
ASGNB 12
line 1505
;1505:			state.type = ent->s.eType;
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1506
;1506:			state.flags = ent->s.eFlags;
ADDRLP4 8+4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1507
;1507:			if (ent->r.bmodel) state.solid = SOLID_BSP;
ADDRLP4 4
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 0
EQI4 $691
ADDRLP4 8+72
CNSTI4 3
ASGNI4
ADDRGP4 $692
JUMPV
LABELV $691
line 1508
;1508:			else state.solid = SOLID_BBOX;
ADDRLP4 8+72
CNSTI4 2
ASGNI4
LABELV $692
line 1509
;1509:			state.groundent = ent->s.groundEntityNum;
ADDRLP4 8+68
ADDRLP4 4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
line 1510
;1510:			state.modelindex = ent->s.modelindex;
ADDRLP4 8+76
ADDRLP4 4
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ASGNI4
line 1511
;1511:			state.modelindex2 = ent->s.modelindex2;
ADDRLP4 8+80
ADDRLP4 4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ASGNI4
line 1512
;1512:			state.frame = ent->s.frame;
ADDRLP4 8+84
ADDRLP4 4
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ASGNI4
line 1513
;1513:			state.event = ent->s.event;
ADDRLP4 8+88
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ASGNI4
line 1514
;1514:			state.eventParm = ent->s.eventParm;
ADDRLP4 8+92
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 1515
;1515:			state.powerups = ent->s.powerups;
ADDRLP4 8+96
ADDRLP4 4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ASGNI4
line 1516
;1516:			state.legsAnim = ent->s.legsAnim;
ADDRLP4 8+104
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
line 1517
;1517:			state.torsoAnim = ent->s.torsoAnim;
ADDRLP4 8+108
ADDRLP4 4
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ASGNI4
line 1518
;1518:			state.weapon = ent->s.weapon;
ADDRLP4 8+100
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
line 1520
;1519:			//
;1520:			*s = qfalse;
ADDRGP4 $613
INDIRP4
CNSTI4 0
ASGNI4
line 1521
;1521:			trap_BotLibUpdateEntity( i, &state );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRGP4 trap_BotLibUpdateEntity
CALLI4
pop
line 1522
;1522:		}
LABELV $660
line 1461
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 140
ADDRGP4 $613
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 824
ADDP4
ASGNP4
LABELV $662
ADDRLP4 0
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $659
line 1524
;1523:
;1524:		BotAIRegularUpdate();
ADDRGP4 BotAIRegularUpdate
CALLV
pop
line 1525
;1525:	}
LABELV $655
line 1527
;1526:
;1527:	floattime = trap_AAS_Time();
ADDRLP4 132
ADDRGP4 trap_AAS_Time
CALLF4
ASGNF4
ADDRGP4 floattime
ADDRLP4 132
INDIRF4
ASGNF4
line 1530
;1528:
;1529:	// execute scheduled bot AI
;1530:	for( i = 0; i < level.maxclients; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $708
JUMPV
LABELV $705
line 1531
;1531:		if( !botstates[i] || !botstates[i]->inuse ) {
ADDRLP4 140
ADDRGP4 botstates
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 140
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $712
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 140
INDIRP4
ADDP4
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $710
LABELV $712
line 1532
;1532:			continue;
ADDRGP4 $706
JUMPV
LABELV $710
line 1535
;1533:		}
;1534:		//
;1535:		botstates[i]->botthink_residual += elapsed_time;
ADDRLP4 144
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 144
INDIRP4
ADDRLP4 144
INDIRP4
INDIRI4
ADDRLP4 120
INDIRI4
ADDI4
ASGNI4
line 1537
;1536:		//
;1537:		if ( botstates[i]->botthink_residual >= thinktime ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 124
INDIRI4
LTI4 $713
line 1538
;1538:			botstates[i]->botthink_residual -= thinktime;
ADDRLP4 148
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 148
INDIRP4
ADDRLP4 148
INDIRP4
INDIRI4
ADDRLP4 124
INDIRI4
SUBI4
ASGNI4
line 1540
;1539:
;1540:			if (!trap_AAS_Initialized()) return qfalse;
ADDRLP4 152
ADDRGP4 trap_AAS_Initialized
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
NEI4 $715
CNSTI4 0
RETI4
ADDRGP4 $608
JUMPV
LABELV $715
line 1542
;1541:
;1542:			if (g_entities[i].client->pers.connected == CON_CONNECTED) {
ADDRLP4 0
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
NEI4 $717
line 1543
;1543:				BotAI(i, (float) thinktime / 1000);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 124
INDIRI4
CVIF4 4
CNSTF4 981668463
MULF4
ARGF4
ADDRGP4 BotAI
CALLI4
pop
line 1544
;1544:			}
LABELV $717
line 1545
;1545:		}
LABELV $713
line 1546
;1546:	}
LABELV $706
line 1530
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $708
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $705
line 1550
;1547:
;1548:
;1549:	// execute bot user commands every frame
;1550:	for( i = 0; i < level.maxclients; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $723
JUMPV
LABELV $720
line 1551
;1551:		if( !botstates[i] || !botstates[i]->inuse ) {
ADDRLP4 140
ADDRGP4 botstates
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 140
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $727
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 140
INDIRP4
ADDP4
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $725
LABELV $727
line 1552
;1552:			continue;
ADDRGP4 $721
JUMPV
LABELV $725
line 1554
;1553:		}
;1554:		if( g_entities[i].client->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $728
line 1555
;1555:			continue;
ADDRGP4 $721
JUMPV
LABELV $728
line 1558
;1556:		}
;1557:
;1558:		BotUpdateInput(botstates[i], time, elapsed_time);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 120
INDIRI4
ARGI4
ADDRGP4 BotUpdateInput
CALLV
pop
line 1559
;1559:		trap_BotUserCommand(botstates[i]->client, &botstates[i]->lastucmd);
ADDRLP4 148
ADDRGP4 botstates
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 148
INDIRP4
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 148
INDIRP4
ADDP4
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRGP4 trap_BotUserCommand
CALLV
pop
line 1560
;1560:	}
LABELV $721
line 1550
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $723
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $720
line 1562
;1561:
;1562:	return qtrue;
CNSTI4 1
RETI4
LABELV $608
endproc BotAIStartFrame 156 12
export BotInitLibrary
proc BotInitLibrary 260 16
line 1570
;1563:}
;1564:
;1565:/*
;1566:==============
;1567:BotInitLibrary
;1568:==============
;1569:*/
;1570:int BotInitLibrary( void ) {
line 1574
;1571:	char buf[MAX_CVAR_VALUE_STRING];
;1572:
;1573:	//set the maxclients and maxentities library variables before calling BotSetupLibrary
;1574:	trap_Cvar_VariableStringBuffer( "sv_maxclients", buf, sizeof( buf ) );
ADDRGP4 $732
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1575
;1575:	if ( !buf[0] )
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $733
line 1576
;1576:		strcpy( buf, "8" );
ADDRLP4 0
ARGP4
ADDRGP4 $735
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $733
line 1577
;1577:	trap_BotLibVarSet( "maxclients", buf );
ADDRGP4 $736
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 1579
;1578:
;1579:	Com_sprintf(buf, sizeof(buf), "%d", MAX_GENTITIES);
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $333
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1580
;1580:	trap_BotLibVarSet("maxentities", buf);
ADDRGP4 $737
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 1582
;1581:	//bsp checksum
;1582:	trap_Cvar_VariableStringBuffer("sv_mapChecksum", buf, sizeof(buf));
ADDRGP4 $738
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1583
;1583:	if ( buf[0] )
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $739
line 1584
;1584:		trap_BotLibVarSet( "sv_mapChecksum", buf );
ADDRGP4 $738
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $739
line 1587
;1585:
;1586:	//maximum number of aas links
;1587:	trap_Cvar_VariableStringBuffer("max_aaslinks", buf, sizeof(buf));
ADDRGP4 $741
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1588
;1588:	if ( buf[0] )
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $742
line 1589
;1589:		trap_BotLibVarSet( "max_aaslinks", buf );
ADDRGP4 $741
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $742
line 1592
;1590:
;1591:	//maximum number of items in a level
;1592:	trap_Cvar_VariableStringBuffer("max_levelitems", buf, sizeof(buf));
ADDRGP4 $744
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1593
;1593:	if ( buf[0] )
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $745
line 1594
;1594:		trap_BotLibVarSet( "max_levelitems", buf );
ADDRGP4 $744
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $745
line 1597
;1595:
;1596:	//game type
;1597:	trap_Cvar_VariableStringBuffer("g_gametype", buf, sizeof(buf));
ADDRGP4 $332
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1598
;1598:	if ( !buf[0] )
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $747
line 1599
;1599:		strcpy( buf, "0" );
ADDRLP4 0
ARGP4
ADDRGP4 $636
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $747
line 1600
;1600:	trap_BotLibVarSet("g_gametype", buf);
ADDRGP4 $332
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 1602
;1601:	//bot developer mode and log file
;1602:	trap_BotLibVarSet("bot_developer", bot_developer.string);
ADDRGP4 $749
ARGP4
ADDRGP4 bot_developer+16
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 1603
;1603:	trap_BotLibVarSet("log", buf);
ADDRGP4 $751
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 1605
;1604:	//no chatting
;1605:	trap_Cvar_VariableStringBuffer("bot_nochat", buf, sizeof(buf));
ADDRGP4 $752
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1606
;1606:	if ( buf[0] )
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $753
line 1607
;1607:		trap_BotLibVarSet( "nochat", "0" );
ADDRGP4 $755
ARGP4
ADDRGP4 $636
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $753
line 1610
;1608:
;1609:	//visualize jump pads
;1610:	trap_Cvar_VariableStringBuffer("bot_visualizejumppads", buf, sizeof(buf));
ADDRGP4 $756
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1611
;1611:	if ( buf[0] )
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $757
line 1612
;1612:		trap_BotLibVarSet( "bot_visualizejumppads", buf );
ADDRGP4 $756
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $757
line 1615
;1613:	
;1614:	//forced clustering calculations
;1615:	trap_Cvar_VariableStringBuffer("bot_forceclustering", buf, sizeof(buf));
ADDRGP4 $759
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1616
;1616:	if ( buf[0] )
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $760
line 1617
;1617:		trap_BotLibVarSet( "forceclustering", buf );
ADDRGP4 $762
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $760
line 1620
;1618:	
;1619:	//forced reachability calculations
;1620:	trap_Cvar_VariableStringBuffer("bot_forcereachability", buf, sizeof(buf));
ADDRGP4 $763
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1621
;1621:	if ( buf[0] )
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $764
line 1622
;1622:		trap_BotLibVarSet( "forcereachability", buf );
ADDRGP4 $766
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $764
line 1625
;1623:	
;1624:	//force writing of AAS to file
;1625:	trap_Cvar_VariableStringBuffer("bot_forcewrite", buf, sizeof(buf));
ADDRGP4 $767
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1626
;1626:	if ( buf[0] )
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $768
line 1627
;1627:		trap_BotLibVarSet( "forcewrite", buf );
ADDRGP4 $770
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $768
line 1630
;1628:	
;1629:	//no AAS optimization
;1630:	trap_Cvar_VariableStringBuffer("bot_aasoptimize", buf, sizeof(buf));
ADDRGP4 $771
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1631
;1631:	if ( buf[0] )
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $772
line 1632
;1632:		trap_BotLibVarSet( "aasoptimize", buf );
ADDRGP4 $774
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $772
line 1635
;1633:	
;1634:	//
;1635:	trap_Cvar_VariableStringBuffer("bot_saveroutingcache", buf, sizeof(buf));
ADDRGP4 $641
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1636
;1636:	if ( buf[0] )
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $775
line 1637
;1637:		trap_BotLibVarSet( "saveroutingcache", buf );
ADDRGP4 $640
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $775
line 1640
;1638:	
;1639:	//reload instead of cache bot character files
;1640:	trap_Cvar_VariableStringBuffer("bot_reloadcharacters", buf, sizeof(buf));
ADDRGP4 $341
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1641
;1641:	if ( !buf[0] )
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $777
line 1642
;1642:		strcpy( buf, "0" );
ADDRLP4 0
ARGP4
ADDRGP4 $636
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $777
line 1643
;1643:	trap_BotLibVarSet("bot_reloadcharacters", buf);
ADDRGP4 $341
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 1645
;1644:	//base directory
;1645:	trap_Cvar_VariableStringBuffer("fs_basepath", buf, sizeof(buf));
ADDRGP4 $779
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1646
;1646:	if ( buf[0] )
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $780
line 1647
;1647:		trap_BotLibVarSet( "basedir", buf );
ADDRGP4 $782
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $780
line 1650
;1648:
;1649:	//home directory
;1650:	trap_Cvar_VariableStringBuffer("fs_homepath", buf, sizeof(buf));
ADDRGP4 $783
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1651
;1651:	if ( buf[0] )
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $784
line 1652
;1652:		trap_BotLibVarSet( "homedir", buf );
ADDRGP4 $786
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $784
line 1655
;1653:
;1654:	//game directory
;1655:	trap_Cvar_VariableStringBuffer( "fs_game", buf, sizeof( buf ) );
ADDRGP4 $787
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1656
;1656:	if ( buf[0] ) 
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $788
line 1657
;1657:		trap_BotLibVarSet( "gamedir", buf );
ADDRGP4 $790
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $788
line 1659
;1658:
;1659:	trap_BotLibDefine("MISSIONPACK");
ADDRGP4 $791
ARGP4
ADDRGP4 trap_BotLibDefine
CALLI4
pop
line 1662
;1660:
;1661:	//setup the bot library
;1662:	return trap_BotLibSetup();
ADDRLP4 256
ADDRGP4 trap_BotLibSetup
CALLI4
ASGNI4
ADDRLP4 256
INDIRI4
RETI4
LABELV $731
endproc BotInitLibrary 260 16
export BotAISetup
proc BotAISetup 8 16
line 1670
;1663:}
;1664:
;1665:/*
;1666:==============
;1667:BotAISetup
;1668:==============
;1669:*/
;1670:int BotAISetup( int restart ) {
line 1673
;1671:	int			errnum;
;1672:
;1673:	trap_Cvar_Register(&bot_thinktime, "bot_thinktime", "100", CVAR_CHEAT);
ADDRGP4 bot_thinktime
ARGP4
ADDRGP4 $645
ARGP4
ADDRGP4 $793
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1674
;1674:	trap_Cvar_Register(&bot_memorydump, "bot_memorydump", "0", CVAR_CHEAT);
ADDRGP4 bot_memorydump
ARGP4
ADDRGP4 $635
ARGP4
ADDRGP4 $636
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1675
;1675:	trap_Cvar_Register(&bot_saveroutingcache, "bot_saveroutingcache", "0", CVAR_CHEAT);
ADDRGP4 bot_saveroutingcache
ARGP4
ADDRGP4 $641
ARGP4
ADDRGP4 $636
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1676
;1676:	trap_Cvar_Register(&bot_pause, "bot_pause", "0", CVAR_CHEAT);
ADDRGP4 bot_pause
ARGP4
ADDRGP4 $794
ARGP4
ADDRGP4 $636
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1677
;1677:	trap_Cvar_Register(&bot_report, "bot_report", "0", CVAR_CHEAT);
ADDRGP4 bot_report
ARGP4
ADDRGP4 $795
ARGP4
ADDRGP4 $636
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1678
;1678:	trap_Cvar_Register(&bot_testsolid, "bot_testsolid", "0", CVAR_CHEAT);
ADDRGP4 bot_testsolid
ARGP4
ADDRGP4 $796
ARGP4
ADDRGP4 $636
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1679
;1679:	trap_Cvar_Register(&bot_testclusters, "bot_testclusters", "0", CVAR_CHEAT);
ADDRGP4 bot_testclusters
ARGP4
ADDRGP4 $797
ARGP4
ADDRGP4 $636
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1680
;1680:	trap_Cvar_Register(&bot_developer, "bot_developer", "0", CVAR_CHEAT);
ADDRGP4 bot_developer
ARGP4
ADDRGP4 $749
ARGP4
ADDRGP4 $636
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1681
;1681:	trap_Cvar_Register(&bot_interbreedchar, "bot_interbreedchar", "", 0);
ADDRGP4 bot_interbreedchar
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 $325
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1682
;1682:	trap_Cvar_Register(&bot_interbreedbots, "bot_interbreedbots", "10", 0);
ADDRGP4 bot_interbreedbots
ARGP4
ADDRGP4 $798
ARGP4
ADDRGP4 $799
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1683
;1683:	trap_Cvar_Register(&bot_interbreedcycle, "bot_interbreedcycle", "20", 0);
ADDRGP4 bot_interbreedcycle
ARGP4
ADDRGP4 $800
ARGP4
ADDRGP4 $801
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1684
;1684:	trap_Cvar_Register(&bot_interbreedwrite, "bot_interbreedwrite", "", 0);
ADDRGP4 bot_interbreedwrite
ARGP4
ADDRGP4 $324
ARGP4
ADDRGP4 $325
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1687
;1685:
;1686:	//if the game is restarted for a tournament
;1687:	if (restart) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $802
line 1688
;1688:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $792
JUMPV
LABELV $802
line 1692
;1689:	}
;1690:
;1691:	//initialize the bot states
;1692:	memset( botstates, 0, sizeof(botstates) );
ADDRGP4 botstates
ARGP4
CNSTI4 0
ARGI4
CNSTI4 256
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1694
;1693:
;1694:	errnum = BotInitLibrary();
ADDRLP4 4
ADDRGP4 BotInitLibrary
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1695
;1695:	if ( errnum != BLERR_NOERROR )
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $804
line 1696
;1696:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $792
JUMPV
LABELV $804
line 1698
;1697:
;1698:	return qtrue;
CNSTI4 1
RETI4
LABELV $792
endproc BotAISetup 8 16
export BotAIShutdown
proc BotAIShutdown 12 8
line 1706
;1699:}
;1700:
;1701:/*
;1702:==============
;1703:BotAIShutdown
;1704:==============
;1705:*/
;1706:int BotAIShutdown( int restart ) {
line 1711
;1707:
;1708:	int i;
;1709:
;1710:	//if the game is restarted for a tournament
;1711:	if ( restart ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $807
line 1713
;1712:		//shutdown all the bots in the botlib
;1713:		for ( i = 0; i < level.maxclients; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $812
JUMPV
LABELV $809
line 1714
;1714:			if ( botstates[i] && botstates[i]->inuse ) {
ADDRLP4 8
ADDRGP4 botstates
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $814
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
ADDP4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $814
line 1715
;1715:				BotAIShutdownClient(botstates[i]->client, restart);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 BotAIShutdownClient
CALLI4
pop
line 1716
;1716:			}
LABELV $814
line 1717
;1717:		}
LABELV $810
line 1713
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $812
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $809
line 1719
;1718:		//don't shutdown the bot library
;1719:	}
ADDRGP4 $808
JUMPV
LABELV $807
line 1720
;1720:	else {
line 1721
;1721:		trap_BotLibShutdown();
ADDRGP4 trap_BotLibShutdown
CALLI4
pop
line 1722
;1722:	}
LABELV $808
line 1723
;1723:	return qtrue;
CNSTI4 1
RETI4
LABELV $806
endproc BotAIShutdown 12 8
import ProximityMine_Trigger
import ExitLevel
bss
export bot_interbreedwrite
align 4
LABELV bot_interbreedwrite
skip 272
export bot_interbreedcycle
align 4
LABELV bot_interbreedcycle
skip 272
export bot_interbreedbots
align 4
LABELV bot_interbreedbots
skip 272
export bot_interbreedchar
align 4
LABELV bot_interbreedchar
skip 272
export bot_developer
align 4
LABELV bot_developer
skip 272
export bot_testclusters
align 4
LABELV bot_testclusters
skip 272
export bot_testsolid
align 4
LABELV bot_testsolid
skip 272
export bot_report
align 4
LABELV bot_report
skip 272
export bot_pause
align 4
LABELV bot_pause
skip 272
export bot_saveroutingcache
align 4
LABELV bot_saveroutingcache
skip 272
export bot_memorydump
align 4
LABELV bot_memorydump
skip 272
export bot_thinktime
align 4
LABELV bot_thinktime
skip 272
export bot_interbreedmatchcount
align 4
LABELV bot_interbreedmatchcount
skip 4
export bot_interbreed
align 4
LABELV bot_interbreed
skip 4
export regularupdate_time
align 4
LABELV regularupdate_time
skip 4
export numbots
align 4
LABELV numbots
skip 4
export botstates
align 4
LABELV botstates
skip 256
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
export mapname
align 1
LABELV mapname
skip 64
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
export floattime
align 4
LABELV floattime
skip 4
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
LABELV $801
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $800
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 98
byte 1 114
byte 1 101
byte 1 101
byte 1 100
byte 1 99
byte 1 121
byte 1 99
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $799
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $798
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 98
byte 1 114
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $797
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 99
byte 1 108
byte 1 117
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $796
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 115
byte 1 111
byte 1 108
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $795
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 114
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $794
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 112
byte 1 97
byte 1 117
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $793
byte 1 49
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $791
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 73
byte 1 79
byte 1 78
byte 1 80
byte 1 65
byte 1 67
byte 1 75
byte 1 0
align 1
LABELV $790
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 105
byte 1 114
byte 1 0
align 1
LABELV $787
byte 1 102
byte 1 115
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $786
byte 1 104
byte 1 111
byte 1 109
byte 1 101
byte 1 100
byte 1 105
byte 1 114
byte 1 0
align 1
LABELV $783
byte 1 102
byte 1 115
byte 1 95
byte 1 104
byte 1 111
byte 1 109
byte 1 101
byte 1 112
byte 1 97
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $782
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 100
byte 1 105
byte 1 114
byte 1 0
align 1
LABELV $779
byte 1 102
byte 1 115
byte 1 95
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 112
byte 1 97
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $774
byte 1 97
byte 1 97
byte 1 115
byte 1 111
byte 1 112
byte 1 116
byte 1 105
byte 1 109
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $771
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 97
byte 1 97
byte 1 115
byte 1 111
byte 1 112
byte 1 116
byte 1 105
byte 1 109
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $770
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 119
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $767
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 119
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $766
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 114
byte 1 101
byte 1 97
byte 1 99
byte 1 104
byte 1 97
byte 1 98
byte 1 105
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $763
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 114
byte 1 101
byte 1 97
byte 1 99
byte 1 104
byte 1 97
byte 1 98
byte 1 105
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $762
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 99
byte 1 108
byte 1 117
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $759
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 99
byte 1 108
byte 1 117
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $756
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 118
byte 1 105
byte 1 115
byte 1 117
byte 1 97
byte 1 108
byte 1 105
byte 1 122
byte 1 101
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 112
byte 1 97
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $755
byte 1 110
byte 1 111
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $752
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
LABELV $751
byte 1 108
byte 1 111
byte 1 103
byte 1 0
align 1
LABELV $749
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 100
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 111
byte 1 112
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $744
byte 1 109
byte 1 97
byte 1 120
byte 1 95
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $741
byte 1 109
byte 1 97
byte 1 120
byte 1 95
byte 1 97
byte 1 97
byte 1 115
byte 1 108
byte 1 105
byte 1 110
byte 1 107
byte 1 115
byte 1 0
align 1
LABELV $738
byte 1 115
byte 1 118
byte 1 95
byte 1 109
byte 1 97
byte 1 112
byte 1 67
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 115
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $737
byte 1 109
byte 1 97
byte 1 120
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 105
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $736
byte 1 109
byte 1 97
byte 1 120
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $735
byte 1 56
byte 1 0
align 1
LABELV $732
byte 1 115
byte 1 118
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $646
byte 1 50
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $645
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 110
byte 1 107
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $641
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 114
byte 1 111
byte 1 117
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 99
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 0
align 1
LABELV $640
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 114
byte 1 111
byte 1 117
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 99
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 0
align 1
LABELV $636
byte 1 48
byte 1 0
align 1
LABELV $635
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 109
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 100
byte 1 117
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $634
byte 1 109
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 100
byte 1 117
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $598
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $573
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $558
byte 1 99
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $555
byte 1 65
byte 1 65
byte 1 83
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 105
byte 1 110
byte 1 105
byte 1 116
byte 1 105
byte 1 97
byte 1 108
byte 1 105
byte 1 122
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $552
byte 1 66
byte 1 111
byte 1 116
byte 1 65
byte 1 73
byte 1 83
byte 1 101
byte 1 116
byte 1 117
byte 1 112
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 117
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $543
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $542
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
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
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
LABELV $523
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 76
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 83
byte 1 104
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $520
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $517
byte 1 116
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $514
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $511
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $508
byte 1 99
byte 1 115
byte 1 0
align 1
LABELV $505
byte 1 99
byte 1 112
byte 1 32
byte 1 0
align 1
LABELV $497
byte 1 66
byte 1 111
byte 1 116
byte 1 65
byte 1 73
byte 1 58
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 117
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $351
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 98
byte 1 114
byte 1 101
byte 1 101
byte 1 100
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $348
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 52
byte 1 32
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $342
byte 1 49
byte 1 0
align 1
LABELV $341
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 114
byte 1 101
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $333
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $332
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
LABELV $325
byte 1 0
align 1
LABELV $324
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 98
byte 1 114
byte 1 101
byte 1 101
byte 1 100
byte 1 119
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $275
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 99
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 97
byte 1 92
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $272
byte 1 114
byte 1 111
byte 1 97
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $270
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
LABELV $268
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $266
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $264
byte 1 114
byte 1 117
byte 1 115
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $262
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $260
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
LABELV $258
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $256
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $254
byte 1 103
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $252
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $250
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
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $248
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $243
byte 1 37
byte 1 50
byte 1 100
byte 1 0
align 1
LABELV $232
byte 1 70
byte 1 32
byte 1 0
align 1
LABELV $211
byte 1 94
byte 1 52
byte 1 66
byte 1 76
byte 1 85
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $210
byte 1 116
byte 1 0
align 1
LABELV $206
byte 1 110
byte 1 0
align 1
LABELV $195
byte 1 94
byte 1 49
byte 1 82
byte 1 69
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $191
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 114
byte 1 111
byte 1 97
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $190
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
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
byte 1 10
byte 1 0
align 1
LABELV $188
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $186
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $184
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 114
byte 1 117
byte 1 115
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $182
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $180
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
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
byte 1 10
byte 1 0
align 1
LABELV $178
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $176
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $174
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 103
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $172
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $170
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
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
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $168
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $163
byte 1 94
byte 1 52
byte 1 37
byte 1 50
byte 1 100
byte 1 0
align 1
LABELV $162
byte 1 94
byte 1 49
byte 1 37
byte 1 50
byte 1 100
byte 1 0
align 1
LABELV $149
byte 1 94
byte 1 52
byte 1 70
byte 1 32
byte 1 0
align 1
LABELV $148
byte 1 94
byte 1 49
byte 1 70
byte 1 32
byte 1 0
align 1
LABELV $141
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $140
byte 1 32
byte 1 0
align 1
LABELV $139
byte 1 76
byte 1 0
align 1
LABELV $134
byte 1 13
byte 1 97
byte 1 114
byte 1 101
byte 1 97
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 99
byte 1 108
byte 1 117
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $133
byte 1 13
byte 1 94
byte 1 49
byte 1 83
byte 1 111
byte 1 108
byte 1 105
byte 1 100
byte 1 33
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $125
byte 1 13
byte 1 94
byte 1 49
byte 1 83
byte 1 79
byte 1 76
byte 1 73
byte 1 68
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 97
byte 1 0
align 1
LABELV $124
byte 1 13
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 97
byte 1 0
align 1
LABELV $70
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $69
byte 1 94
byte 1 49
byte 1 69
byte 1 120
byte 1 105
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $67
byte 1 94
byte 1 49
byte 1 70
byte 1 97
byte 1 116
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $65
byte 1 94
byte 1 49
byte 1 69
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $63
byte 1 94
byte 1 51
byte 1 87
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $61
byte 1 37
byte 1 115
byte 1 0
