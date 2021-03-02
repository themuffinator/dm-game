code
proc CG_TargetCommand_f 20 12
file "..\..\..\..\code\cgame\cg_consolecmds.c"
line 13
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_consolecmds.c -- text commands typed in at the local console, or
;4:// executed by a key binding
;5:
;6:#include "cg_local.h"
;7:
;8:/*
;9:=================
;10:CG_TargetCommand_f
;11:=================
;12:*/
;13:static void CG_TargetCommand_f( void ) {
line 17
;14:	int		targetNum;
;15:	char	cmd[4];
;16:
;17:	targetNum = CG_CrosshairPlayer();
ADDRLP4 8
ADDRGP4 CG_CrosshairPlayer
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 18
;18:	if ( targetNum == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $74
line 19
;19:		return;
ADDRGP4 $73
JUMPV
LABELV $74
line 22
;20:	}
;21:
;22:	trap_Argv( 1, cmd, sizeof( cmd ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 23
;23:	trap_SendConsoleCommand( va( "gc %i %i", targetNum, atoi( cmd ) ) );
ADDRLP4 4
ARGP4
ADDRLP4 12
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 $76
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 24
;24:}
LABELV $73
endproc CG_TargetCommand_f 20 12
proc CG_SizeUp_f 4 8
line 35
;25:
;26:
;27:
;28:/*
;29:=================
;30:CG_SizeUp_f
;31:
;32:Keybinding command
;33:=================
;34:*/
;35:static void CG_SizeUp_f (void) {
line 36
;36:	trap_Cvar_Set("cg_viewsize", va("%i",(int)(cg_viewsize.integer+10)));
ADDRGP4 $79
ARGP4
ADDRGP4 cg_viewsize+12
INDIRI4
CNSTI4 10
ADDI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $78
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 37
;37:}
LABELV $77
endproc CG_SizeUp_f 4 8
proc CG_SizeDown_f 4 8
line 47
;38:
;39:
;40:/*
;41:=================
;42:CG_SizeDown_f
;43:
;44:Keybinding command
;45:=================
;46:*/
;47:static void CG_SizeDown_f (void) {
line 48
;48:	trap_Cvar_Set("cg_viewsize", va("%i",(int)(cg_viewsize.integer-10)));
ADDRGP4 $79
ARGP4
ADDRGP4 cg_viewsize+12
INDIRI4
CNSTI4 10
SUBI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $78
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 49
;49:}
LABELV $81
endproc CG_SizeDown_f 4 8
proc CG_Viewpos_f 0 20
line 59
;50:
;51:
;52:/*
;53:=============
;54:CG_Viewpos_f
;55:
;56:Debugging command to print the current position
;57:=============
;58:*/
;59:static void CG_Viewpos_f (void) {
line 60
;60:	CG_Printf ("(%i %i %i) : %i\n", (int)cg.refdef.vieworg[0],
ADDRGP4 $84
ARGP4
ADDRGP4 cg+109056+24
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 cg+109056+24+4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 cg+109056+24+8
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 cg+109424+4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 63
;61:		(int)cg.refdef.vieworg[1], (int)cg.refdef.vieworg[2], 
;62:		(int)cg.refdefViewAngles[YAW]);
;63:}
LABELV $83
endproc CG_Viewpos_f 0 20
proc CG_ScoresDown_f 0 4
line 66
;64:
;65:
;66:static void CG_ScoresDown_f( void ) {
line 71
;67:
;68:#ifdef SUI
;69:	CG_BuildSpectatorString();
;70:#endif //SUI
;71:	if ( cg.scoresRequestTime + 2000 < cg.time && !cg.demoPlayback ) {
ADDRGP4 cg+110472
INDIRI4
CNSTI4 2000
ADDI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $96
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
NEI4 $96
line 74
;72:		// the scores are more than two seconds out of data,
;73:		// so request new ones
;74:		cg.scoresRequestTime = cg.time;
ADDRGP4 cg+110472
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 75
;75:		trap_SendClientCommand( "score" );
ADDRGP4 $103
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 79
;76:
;77:		// leave the current scores up if they were already
;78:		// displayed, but if this is the first hit, clear them out
;79:		if ( !cg.showScores ) {
ADDRGP4 cg+115356
INDIRI4
CNSTI4 0
NEI4 $97
line 80
;80:			cg.showScores = qtrue;
ADDRGP4 cg+115356
CNSTI4 1
ASGNI4
line 81
;81:			cg.numScores = 0;
ADDRGP4 cg+110476
CNSTI4 0
ASGNI4
line 82
;82:		}
line 83
;83:	} else {
ADDRGP4 $97
JUMPV
LABELV $96
line 86
;84:		// show the cached contents even if they just pressed if it
;85:		// is within two seconds
;86:		cg.showScores = qtrue;
ADDRGP4 cg+115356
CNSTI4 1
ASGNI4
line 87
;87:	}
LABELV $97
line 89
;88:
;89:	CG_SetScoreCatcher( cg.showScores );
ADDRGP4 cg+115356
INDIRI4
ARGI4
ADDRGP4 CG_SetScoreCatcher
CALLV
pop
line 90
;90:}
LABELV $95
endproc CG_ScoresDown_f 0 4
proc CG_ScoresUp_f 0 4
line 93
;91:
;92:
;93:static void CG_ScoresUp_f( void ) {
line 95
;94:
;95:	if ( cgs.filterKeyUpEvent ) {
ADDRGP4 cgs+149916
INDIRI4
CNSTI4 0
EQI4 $112
line 96
;96:		cgs.filterKeyUpEvent = qfalse;
ADDRGP4 cgs+149916
CNSTI4 0
ASGNI4
line 97
;97:		return;
ADDRGP4 $111
JUMPV
LABELV $112
line 100
;98:	}
;99:
;100:	if ( cg.showScores ) {
ADDRGP4 cg+115356
INDIRI4
CNSTI4 0
EQI4 $116
line 101
;101:		cg.showScores = qfalse;
ADDRGP4 cg+115356
CNSTI4 0
ASGNI4
line 102
;102:		cg.scoreFadeTime = cg.time;
ADDRGP4 cg+115364
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 103
;103:	}
LABELV $116
line 105
;104:
;105:	CG_SetScoreCatcher( cg.showScores );
ADDRGP4 cg+115356
INDIRI4
ARGI4
ADDRGP4 CG_SetScoreCatcher
CALLV
pop
line 106
;106:}
LABELV $111
endproc CG_ScoresUp_f 0 4
proc CG_TellTarget_f 264 20
line 114
;107:
;108:
;109:/*
;110:==================
;111:CG_TellTarget_f
;112:==================
;113:*/
;114:static void CG_TellTarget_f( void ) {
line 119
;115:	int		clientNum;
;116:	char	command[128];
;117:	char	message[128];
;118:
;119:	clientNum = CG_CrosshairPlayer();
ADDRLP4 260
ADDRGP4 CG_CrosshairPlayer
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 260
INDIRI4
ASGNI4
line 120
;120:	if ( clientNum == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $124
line 121
;121:		return;
ADDRGP4 $123
JUMPV
LABELV $124
line 124
;122:	}
;123:
;124:	trap_Args( message, sizeof( message ) );
ADDRLP4 132
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Args
CALLV
pop
line 125
;125:	Com_sprintf( command, sizeof( command ), "tell %i %s", clientNum, message );
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $126
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 132
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 126
;126:	trap_SendClientCommand( command );
ADDRLP4 4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 127
;127:}
LABELV $123
endproc CG_TellTarget_f 264 20
proc CG_TellAttacker_f 264 20
line 135
;128:
;129:
;130:/*
;131:==================
;132:CG_TellAttacker_f
;133:==================
;134:*/
;135:static void CG_TellAttacker_f( void ) {
line 140
;136:	int		clientNum;
;137:	char	command[128];
;138:	char	message[128];
;139:
;140:	clientNum = CG_LastAttacker();
ADDRLP4 260
ADDRGP4 CG_LastAttacker
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 260
INDIRI4
ASGNI4
line 141
;141:	if ( clientNum == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $128
line 142
;142:		return;
ADDRGP4 $127
JUMPV
LABELV $128
line 145
;143:	}
;144:
;145:	trap_Args( message, sizeof( message ) );
ADDRLP4 132
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Args
CALLV
pop
line 146
;146:	Com_sprintf( command, sizeof( command ), "tell %i %s", clientNum, message );
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $126
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 132
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 147
;147:	trap_SendClientCommand( command );
ADDRLP4 4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 148
;148:}
LABELV $127
endproc CG_TellAttacker_f 264 20
proc CG_StartOrbit_f 1028 12
line 157
;149:
;150:
;151:/*
;152:==================
;153:CG_StartOrbit_f
;154:==================
;155:*/
;156:
;157:static void CG_StartOrbit_f( void ) {
line 160
;158:	char var[MAX_TOKEN_CHARS];
;159:
;160:	trap_Cvar_VariableStringBuffer( "developer", var, sizeof( var ) );
ADDRGP4 $131
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 161
;161:	if ( !atoi(var) ) {
ADDRLP4 0
ARGP4
ADDRLP4 1024
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 0
NEI4 $132
line 162
;162:		return;
ADDRGP4 $130
JUMPV
LABELV $132
line 164
;163:	}
;164:	if (cg_cameraOrbit.value != 0) {
ADDRGP4 cg_cameraOrbit+8
INDIRF4
CNSTF4 0
EQF4 $134
line 165
;165:		trap_Cvar_Set ("cg_cameraOrbit", "0");
ADDRGP4 $137
ARGP4
ADDRGP4 $138
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 166
;166:		trap_Cvar_Set("cg_thirdPerson", "0");
ADDRGP4 $139
ARGP4
ADDRGP4 $138
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 167
;167:	} else {
ADDRGP4 $135
JUMPV
LABELV $134
line 168
;168:		trap_Cvar_Set("cg_cameraOrbit", "5");
ADDRGP4 $137
ARGP4
ADDRGP4 $140
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 169
;169:		trap_Cvar_Set("cg_thirdPerson", "1");
ADDRGP4 $139
ARGP4
ADDRGP4 $141
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 170
;170:		trap_Cvar_Set("cg_thirdPersonAngle", "0");
ADDRGP4 $142
ARGP4
ADDRGP4 $138
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 171
;171:		trap_Cvar_Set("cg_thirdPersonRange", "100");
ADDRGP4 $143
ARGP4
ADDRGP4 $144
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 172
;172:	}
LABELV $135
line 173
;173:}
LABELV $130
endproc CG_StartOrbit_f 1028 12
data
align 4
LABELV commands
address $146
address CG_TestGun_f
address $147
address CG_TestModel_f
address $148
address CG_TestModelNextFrame_f
address $149
address CG_TestModelPrevFrame_f
address $150
address CG_TestModelNextSkin_f
address $151
address CG_TestModelPrevSkin_f
address $152
address CG_Viewpos_f
address $153
address CG_ScoresDown_f
address $154
address CG_ScoresUp_f
address $155
address CG_ZoomDown_f
address $156
address CG_ZoomUp_f
address $157
address CG_SizeUp_f
address $158
address CG_SizeDown_f
address $159
address CG_NextWeapon_f
address $160
address CG_PrevWeapon_f
address $161
address CG_Weapon_f
address $162
address CG_TargetCommand_f
address $163
address CG_TellTarget_f
address $164
address CG_TellAttacker_f
address $165
address CG_StartOrbit_f
address $166
address CG_LoadDeferredPlayers
export CG_ConsoleCommand
code
proc CG_ConsoleCommand 16 8
line 215
;174:
;175:
;176:typedef struct {
;177:	const char *cmd;
;178:	void	(*function)(void);
;179:} consoleCommand_t;
;180:
;181:static consoleCommand_t	commands[] = {
;182:	{ "testgun", CG_TestGun_f },
;183:	{ "testmodel", CG_TestModel_f },
;184:	{ "nextframe", CG_TestModelNextFrame_f },
;185:	{ "prevframe", CG_TestModelPrevFrame_f },
;186:	{ "nextskin", CG_TestModelNextSkin_f },
;187:	{ "prevskin", CG_TestModelPrevSkin_f },
;188:	{ "viewpos", CG_Viewpos_f },
;189:	{ "+scores", CG_ScoresDown_f },
;190:	{ "-scores", CG_ScoresUp_f },
;191:	{ "+zoom", CG_ZoomDown_f },
;192:	{ "-zoom", CG_ZoomUp_f },
;193:	{ "sizeup", CG_SizeUp_f },
;194:	{ "sizedown", CG_SizeDown_f },
;195:	{ "weapnext", CG_NextWeapon_f },
;196:	{ "weapprev", CG_PrevWeapon_f },
;197:	{ "weapon", CG_Weapon_f },
;198:	{ "tcmd", CG_TargetCommand_f },
;199:	{ "tell_target", CG_TellTarget_f },
;200:	{ "tell_attacker", CG_TellAttacker_f },
;201:	{ "startOrbit", CG_StartOrbit_f },
;202:	//{ "camera", CG_Camera_f },
;203:	{ "loaddeferred", CG_LoadDeferredPlayers }	
;204:};
;205:
;206:
;207:/*
;208:=================
;209:CG_ConsoleCommand
;210:
;211:The string has been tokenized and can be retrieved with
;212:Cmd_Argc() / Cmd_Argv()
;213:=================
;214:*/
;215:qboolean CG_ConsoleCommand( void ) {
line 219
;216:	const char	*cmd;
;217:	int		i;
;218:
;219:	cmd = CG_Argv(0);
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 CG_Argv
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 221
;220:
;221:	for ( i = 0 ; i < ARRAY_LEN( commands ) ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $171
JUMPV
LABELV $168
line 222
;222:		if ( !Q_stricmp( cmd, commands[i].cmd ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 commands
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $172
line 223
;223:			commands[i].function();
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 commands+4
ADDP4
INDIRP4
CALLV
pop
line 224
;224:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $167
JUMPV
LABELV $172
line 226
;225:		}
;226:	}
LABELV $169
line 221
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $171
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 21
LTU4 $168
line 228
;227:
;228:	return qfalse;
CNSTI4 0
RETI4
LABELV $167
endproc CG_ConsoleCommand 16 8
export CG_InitConsoleCommands
proc CG_InitConsoleCommands 4 4
line 240
;229:}
;230:
;231:
;232:/*
;233:=================
;234:CG_InitConsoleCommands
;235:
;236:Let the client system know about all of our commands
;237:so it can perform tab completion
;238:=================
;239:*/
;240:void CG_InitConsoleCommands( void ) {
line 243
;241:	int		i;
;242:
;243:	for ( i = 0 ; i < ARRAY_LEN( commands ) ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $179
JUMPV
LABELV $176
line 244
;244:		trap_AddCommand( commands[i].cmd );
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 commands
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 245
;245:	}
LABELV $177
line 243
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $179
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 21
LTU4 $176
line 251
;246:
;247:	//
;248:	// the game server will interpret these commands, which will be automatically
;249:	// forwarded to the server after they are not recognized locally
;250:	//
;251:	trap_AddCommand ("kill");
ADDRGP4 $180
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 252
;252:	trap_AddCommand ("say");
ADDRGP4 $181
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 253
;253:	trap_AddCommand ("say_team");
ADDRGP4 $182
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 254
;254:	trap_AddCommand ("tell");
ADDRGP4 $183
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 255
;255:	trap_AddCommand ("give");
ADDRGP4 $184
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 256
;256:	trap_AddCommand ("god");
ADDRGP4 $185
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 257
;257:	trap_AddCommand ("notarget");
ADDRGP4 $186
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 258
;258:	trap_AddCommand ("noclip");
ADDRGP4 $187
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 259
;259:	trap_AddCommand ("team");
ADDRGP4 $188
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 260
;260:	trap_AddCommand ("follow");
ADDRGP4 $189
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 261
;261:	trap_AddCommand ("levelshot");
ADDRGP4 $190
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 262
;262:	trap_AddCommand ("addbot");
ADDRGP4 $191
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 263
;263:	trap_AddCommand ("setviewpos");
ADDRGP4 $192
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 264
;264:	trap_AddCommand ("callvote");
ADDRGP4 $193
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 265
;265:	trap_AddCommand ("vote");
ADDRGP4 $194
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 266
;266:	trap_AddCommand ("callteamvote");
ADDRGP4 $195
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 267
;267:	trap_AddCommand ("teamvote");
ADDRGP4 $196
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 268
;268:	trap_AddCommand ("stats");
ADDRGP4 $197
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 269
;269:	trap_AddCommand ("teamtask");
ADDRGP4 $198
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 270
;270:	trap_AddCommand ("loaddefered");	// spelled wrong, but not changing for demo
ADDRGP4 $199
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 271
;271:}
LABELV $175
endproc CG_InitConsoleCommands 4 4
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
LABELV $199
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $198
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
LABELV $197
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $196
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $195
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $194
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $193
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $192
byte 1 115
byte 1 101
byte 1 116
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 112
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $191
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $190
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $189
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $188
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $187
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $186
byte 1 110
byte 1 111
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $185
byte 1 103
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $184
byte 1 103
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $183
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $182
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $181
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $180
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $166
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $165
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 79
byte 1 114
byte 1 98
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $164
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 95
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $163
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 95
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $162
byte 1 116
byte 1 99
byte 1 109
byte 1 100
byte 1 0
align 1
LABELV $161
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $160
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 0
align 1
LABELV $159
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $158
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $157
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $156
byte 1 45
byte 1 122
byte 1 111
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $155
byte 1 43
byte 1 122
byte 1 111
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $154
byte 1 45
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $153
byte 1 43
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $152
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 112
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $151
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $150
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $149
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $148
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $147
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $146
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $144
byte 1 49
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $143
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 82
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $142
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 65
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $141
byte 1 49
byte 1 0
align 1
LABELV $140
byte 1 53
byte 1 0
align 1
LABELV $139
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $138
byte 1 48
byte 1 0
align 1
LABELV $137
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 79
byte 1 114
byte 1 98
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $131
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
LABELV $126
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $103
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $84
byte 1 40
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 41
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $79
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $78
byte 1 99
byte 1 103
byte 1 95
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $76
byte 1 103
byte 1 99
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 0
