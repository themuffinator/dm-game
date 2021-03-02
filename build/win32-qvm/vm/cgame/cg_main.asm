data
export forceModelModificationCount
align 4
LABELV forceModelModificationCount
byte 4 -1
export enemyModelModificationCount
align 4
LABELV enemyModelModificationCount
byte 4 -1
export enemyColorsModificationCount
align 4
LABELV enemyColorsModificationCount
byte 4 -1
export teamModelModificationCount
align 4
LABELV teamModelModificationCount
byte 4 -1
export teamColorsModificationCount
align 4
LABELV teamColorsModificationCount
byte 4 -1
export intShaderTime
align 4
LABELV intShaderTime
byte 4 0
export linearLight
align 4
LABELV linearLight
byte 4 0
export vmMain
code
proc vmMain 16 12
file "..\..\..\..\code\cgame\cg_main.c"
line 37
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_main.c -- initialization and primary entry point for cgame
;4:#include "cg_local.h"
;5:
;6:int forceModelModificationCount = -1;
;7:int enemyModelModificationCount  = -1;
;8:int	enemyColorsModificationCount = -1;
;9:int teamModelModificationCount  = -1;
;10:int	teamColorsModificationCount = -1;
;11:
;12:void CG_Init( int serverMessageNum, int serverCommandSequence, int clientNum );
;13:void CG_Shutdown( void );
;14:
;15:// extension interface
;16:qboolean intShaderTime = qfalse;
;17:qboolean linearLight = qfalse;
;18:
;19:#ifdef Q3_VM
;20:qboolean (*trap_GetValue)( char *value, int valueSize, const char *key );
;21:void (*trap_R_AddRefEntityToScene2)( const refEntity_t *re );
;22:void (*trap_R_AddLinearLightToScene)( const vec3_t start, const vec3_t end, float intensity, float r, float g, float b );
;23:#else
;24:int dll_com_trapGetValue;
;25:int dll_trap_R_AddRefEntityToScene2;
;26:int dll_trap_R_AddLinearLightToScene;
;27:#endif
;28:
;29:/*
;30:================
;31:vmMain
;32:
;33:This is the only way control passes into the module.
;34:This must be the very first function compiled into the .q3vm file
;35:================
;36:*/
;37:DLLEXPORT intptr_t vmMain( int command, int arg0, int arg1, int arg2 ) {
line 39
;38:
;39:	switch ( command ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $74
ADDRLP4 0
INDIRI4
CNSTI4 7
GTI4 $74
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $85
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $85
address $76
address $77
address $78
address $79
address $80
address $81
address $82
address $83
code
LABELV $76
line 41
;40:	case CG_INIT:
;41:		CG_Init( arg0, arg1, arg2 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_Init
CALLV
pop
line 42
;42:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $73
JUMPV
LABELV $77
line 44
;43:	case CG_SHUTDOWN:
;44:		CG_Shutdown();
ADDRGP4 CG_Shutdown
CALLV
pop
line 45
;45:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $73
JUMPV
LABELV $78
line 47
;46:	case CG_CONSOLE_COMMAND:
;47:		return CG_ConsoleCommand();
ADDRLP4 4
ADDRGP4 CG_ConsoleCommand
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $73
JUMPV
LABELV $79
line 49
;48:	case CG_DRAW_ACTIVE_FRAME:
;49:		CG_DrawActiveFrame( arg0, arg1, arg2 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_DrawActiveFrame
CALLV
pop
line 50
;50:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $73
JUMPV
LABELV $80
line 52
;51:	case CG_CROSSHAIR_PLAYER:
;52:		return CG_CrosshairPlayer();
ADDRLP4 8
ADDRGP4 CG_CrosshairPlayer
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $73
JUMPV
LABELV $81
line 54
;53:	case CG_LAST_ATTACKER:
;54:		return CG_LastAttacker();
ADDRLP4 12
ADDRGP4 CG_LastAttacker
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $73
JUMPV
LABELV $82
line 56
;55:	case CG_KEY_EVENT:
;56:		CG_KeyEvent(arg0, arg1);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_KeyEvent
CALLV
pop
line 57
;57:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $73
JUMPV
LABELV $83
line 59
;58:	case CG_MOUSE_EVENT:
;59:		CG_MouseEvent(arg0, arg1);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_MouseEvent
CALLV
pop
line 60
;60:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $73
JUMPV
LABELV $74
line 62
;61:	default:
;62:		CG_Error( "vmMain: unknown command %i", command );
ADDRGP4 $84
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 63
;63:		break;
LABELV $75
line 65
;64:	}
;65:	return -1;
CNSTI4 -1
RETI4
LABELV $73
endproc vmMain 16 12
data
align 4
LABELV cvarTable
address cg_ignore
address $87
address $88
byte 4 0
address cg_autoswitch
address $89
address $90
byte 4 1
address cg_drawGun
address $91
address $90
byte 4 1
address cg_zoomFov
address $92
address $93
byte 4 1
address cg_fov
address $94
address $95
byte 4 1
address cg_viewsize
address $96
address $97
byte 4 1
address cg_shadows
address $98
address $90
byte 4 1
address cg_gibs
address $99
address $90
byte 4 1
address cg_draw2D
address $100
address $90
byte 4 1
address cg_drawStatus
address $101
address $90
byte 4 1
address cg_drawTimer
address $102
address $88
byte 4 1
address cg_drawFPS
address $103
address $88
byte 4 1
address cg_drawSnapshot
address $104
address $88
byte 4 1
address cg_draw3dIcons
address $105
address $90
byte 4 1
address cg_drawIcons
address $106
address $90
byte 4 1
address cg_drawAmmoWarning
address $107
address $90
byte 4 1
address cg_drawAttacker
address $108
address $90
byte 4 1
address cg_drawSpeed
address $109
address $88
byte 4 1
address cg_drawCrosshair
address $110
address $111
byte 4 1
address cg_drawCrosshairNames
address $112
address $90
byte 4 1
address cg_drawRewards
address $113
address $90
byte 4 1
address cg_drawWeaponSelect
address $114
address $90
byte 4 1
address cg_crosshairSize
address $115
address $116
byte 4 1
address cg_crosshairHealth
address $117
address $90
byte 4 1
address cg_crosshairX
address $118
address $88
byte 4 1
address cg_crosshairY
address $119
address $88
byte 4 1
address cg_brassTime
address $120
address $121
byte 4 1
address cg_simpleItems
address $122
address $88
byte 4 1
address cg_addMarks
address $123
address $90
byte 4 1
address cg_lagometer
address $124
address $90
byte 4 1
address cg_railTrailTime
address $125
address $126
byte 4 1
address cg_railTrailRadius
address $127
address $88
byte 4 1
address cg_gun_x
address $128
address $88
byte 4 1
address cg_gun_y
address $129
address $88
byte 4 1
address cg_gun_z
address $130
address $88
byte 4 1
address cg_centertime
address $131
address $132
byte 4 512
address cg_runpitch
address $133
address $134
byte 4 1
address cg_runroll
address $135
address $136
byte 4 1
address cg_bobup
address $137
address $136
byte 4 1
address cg_bobpitch
address $138
address $134
byte 4 1
address cg_bobroll
address $139
address $134
byte 4 1
address cg_swingSpeed
address $140
address $141
byte 4 512
address cg_animSpeed
address $142
address $90
byte 4 512
address cg_debugAnim
address $143
address $88
byte 4 512
address cg_debugPosition
address $144
address $88
byte 4 512
address cg_debugEvents
address $145
address $88
byte 4 512
address cg_errorDecay
address $146
address $97
byte 4 0
address cg_nopredict
address $147
address $88
byte 4 0
address cg_noPlayerAnims
address $148
address $88
byte 4 512
address cg_showmiss
address $149
address $88
byte 4 0
address cg_footsteps
address $150
address $90
byte 4 512
address cg_tracerChance
address $151
address $152
byte 4 512
address cg_tracerWidth
address $153
address $90
byte 4 512
address cg_tracerLength
address $154
address $97
byte 4 512
address cg_thirdPersonRange
address $155
address $156
byte 4 512
address cg_thirdPersonAngle
address $157
address $88
byte 4 512
address cg_thirdPerson
address $158
address $88
byte 4 0
address cg_teamChatTime
address $159
address $160
byte 4 1
address cg_teamChatHeight
address $161
address $88
byte 4 1
address cg_forceModel
address $162
address $88
byte 4 1
address cg_predictItems
address $163
address $90
byte 4 1
address cg_deferPlayers
address $164
address $90
byte 4 1
address cg_drawTeamOverlay
address $165
address $88
byte 4 1
address cg_teamOverlayUserinfo
address $166
address $88
byte 4 66
address cg_stats
address $167
address $88
byte 4 0
address cg_drawFriend
address $168
address $90
byte 4 1
address cg_teamChatsOnly
address $169
address $88
byte 4 1
address cg_buildScript
address $170
address $88
byte 4 0
address cg_paused
address $171
address $88
byte 4 64
address cg_blood
address $172
address $90
byte 4 1
address cg_redTeamName
address $173
address $174
byte 4 7
address cg_blueTeamName
address $175
address $176
byte 4 7
address cg_singlePlayer
address $177
address $88
byte 4 2
address cg_enableDust
address $178
address $88
byte 4 4
address cg_enableBreath
address $179
address $88
byte 4 4
address cg_singlePlayerActive
address $177
address $88
byte 4 2
address cg_recordSPDemo
address $180
address $88
byte 4 1
address cg_recordSPDemoName
address $181
address $182
byte 4 1
address cg_obeliskRespawnDelay
address $183
address $184
byte 4 4
address cg_hudFiles
address $185
address $186
byte 4 1
address cg_cameraOrbit
address $187
address $88
byte 4 512
address cg_cameraOrbitDelay
address $188
address $189
byte 4 1
address cg_timescaleFadeEnd
address $190
address $90
byte 4 0
address cg_timescaleFadeSpeed
address $191
address $88
byte 4 0
address cg_timescale
address $192
address $90
byte 4 0
address cg_scorePlum
address $193
address $90
byte 4 3
address cg_smoothClients
address $194
address $88
byte 4 3
address cg_cameraMode
address $195
address $88
byte 4 512
address cg_noTaunt
address $196
address $88
byte 4 1
address cg_noProjectileTrail
address $197
address $88
byte 4 1
address cg_smallFont
address $198
address $199
byte 4 1
address cg_bigFont
address $200
address $152
byte 4 1
address cg_oldRail
address $201
address $90
byte 4 1
address cg_oldRocket
address $202
address $90
byte 4 1
address cg_oldPlasma
address $203
address $90
byte 4 1
address cg_trueLightning
address $204
address $205
byte 4 1
address cg_hitSounds
address $206
address $88
byte 4 1
address cg_enemyModel
address $207
address $182
byte 4 1
address cg_enemyColors
address $208
address $182
byte 4 1
address cg_teamModel
address $209
address $182
byte 4 1
address cg_teamColors
address $210
address $182
byte 4 1
address cg_deadBodyDarken
address $211
address $90
byte 4 1
address cg_fovAdjust
address $212
address $88
byte 4 1
address cg_followKiller
address $213
address $88
byte 4 1
export CG_RegisterCvars
code
proc CG_RegisterCvars 1036 16
line 310
;66:}
;67:
;68:
;69:cg_t				cg;
;70:cgs_t				cgs;
;71:centity_t			cg_entities[MAX_GENTITIES];
;72:weaponInfo_t		cg_weapons[MAX_WEAPONS];
;73:itemInfo_t			cg_items[MAX_ITEMS];
;74:
;75:
;76:vmCvar_t	cg_railTrailTime;
;77:vmCvar_t	cg_railTrailRadius;
;78:vmCvar_t	cg_centertime;
;79:vmCvar_t	cg_runpitch;
;80:vmCvar_t	cg_runroll;
;81:vmCvar_t	cg_bobup;
;82:vmCvar_t	cg_bobpitch;
;83:vmCvar_t	cg_bobroll;
;84:vmCvar_t	cg_swingSpeed;
;85:vmCvar_t	cg_shadows;
;86:vmCvar_t	cg_gibs;
;87:vmCvar_t	cg_drawTimer;
;88:vmCvar_t	cg_drawFPS;
;89:vmCvar_t	cg_drawSnapshot;
;90:vmCvar_t	cg_draw3dIcons;
;91:vmCvar_t	cg_drawIcons;
;92:vmCvar_t	cg_drawAmmoWarning;
;93:vmCvar_t	cg_drawCrosshair;
;94:vmCvar_t	cg_drawCrosshairNames;
;95:vmCvar_t	cg_drawRewards;
;96:vmCvar_t	cg_drawWeaponSelect;
;97:vmCvar_t	cg_crosshairSize;
;98:vmCvar_t	cg_crosshairX;
;99:vmCvar_t	cg_crosshairY;
;100:vmCvar_t	cg_crosshairHealth;
;101:vmCvar_t	cg_draw2D;
;102:vmCvar_t	cg_drawStatus;
;103:vmCvar_t	cg_animSpeed;
;104:vmCvar_t	cg_debugAnim;
;105:vmCvar_t	cg_debugPosition;
;106:vmCvar_t	cg_debugEvents;
;107:vmCvar_t	cg_errorDecay;
;108:vmCvar_t	cg_nopredict;
;109:vmCvar_t	cg_noPlayerAnims;
;110:vmCvar_t	cg_showmiss;
;111:vmCvar_t	cg_footsteps;
;112:vmCvar_t	cg_addMarks;
;113:vmCvar_t	cg_brassTime;
;114:vmCvar_t	cg_viewsize;
;115:vmCvar_t	cg_drawGun;
;116:vmCvar_t	cg_gun_frame;
;117:vmCvar_t	cg_gun_x;
;118:vmCvar_t	cg_gun_y;
;119:vmCvar_t	cg_gun_z;
;120:vmCvar_t	cg_tracerChance;
;121:vmCvar_t	cg_tracerWidth;
;122:vmCvar_t	cg_tracerLength;
;123:vmCvar_t	cg_autoswitch;
;124:vmCvar_t	cg_ignore;
;125:vmCvar_t	cg_simpleItems;
;126:vmCvar_t	cg_fov;
;127:vmCvar_t	cg_zoomFov;
;128:vmCvar_t	cg_thirdPerson;
;129:vmCvar_t	cg_thirdPersonRange;
;130:vmCvar_t	cg_thirdPersonAngle;
;131:vmCvar_t	cg_lagometer;
;132:vmCvar_t	cg_drawAttacker;
;133:vmCvar_t	cg_drawSpeed;
;134:vmCvar_t 	cg_teamChatTime;
;135:vmCvar_t 	cg_teamChatHeight;
;136:vmCvar_t 	cg_stats;
;137:vmCvar_t 	cg_buildScript;
;138:vmCvar_t 	cg_forceModel;
;139:vmCvar_t	cg_paused;
;140:vmCvar_t	cg_blood;
;141:vmCvar_t	cg_predictItems;
;142:vmCvar_t	cg_deferPlayers;
;143:vmCvar_t	cg_drawTeamOverlay;
;144:vmCvar_t	cg_teamOverlayUserinfo;
;145:vmCvar_t	cg_drawFriend;
;146:vmCvar_t	cg_teamChatsOnly;
;147:vmCvar_t	cg_hudFiles;
;148:vmCvar_t 	cg_scorePlum;
;149:vmCvar_t 	cg_smoothClients;
;150:vmCvar_t	cg_cameraMode;
;151:vmCvar_t	cg_cameraOrbit;
;152:vmCvar_t	cg_cameraOrbitDelay;
;153:vmCvar_t	cg_timescaleFadeEnd;
;154:vmCvar_t	cg_timescaleFadeSpeed;
;155:vmCvar_t	cg_timescale;
;156:vmCvar_t	cg_smallFont;
;157:vmCvar_t	cg_bigFont;
;158:vmCvar_t	cg_noTaunt;
;159:vmCvar_t	cg_noProjectileTrail;
;160:vmCvar_t	cg_oldRail;
;161:vmCvar_t	cg_oldRocket;
;162:vmCvar_t	cg_oldPlasma;
;163:vmCvar_t	cg_trueLightning;
;164:
;165:vmCvar_t 	cg_redTeamName;
;166:vmCvar_t 	cg_blueTeamName;
;167:vmCvar_t	cg_singlePlayer;
;168:vmCvar_t	cg_enableDust;
;169:vmCvar_t	cg_enableBreath;
;170:vmCvar_t	cg_singlePlayerActive;
;171:vmCvar_t	cg_recordSPDemo;
;172:vmCvar_t	cg_recordSPDemoName;
;173:vmCvar_t	cg_obeliskRespawnDelay;
;174:
;175:vmCvar_t	cg_hitSounds;
;176:
;177:vmCvar_t	cg_enemyModel;
;178:vmCvar_t	cg_enemyColors;
;179:vmCvar_t	cg_teamModel;
;180:vmCvar_t	cg_teamColors;
;181:
;182:vmCvar_t	cg_deadBodyDarken;
;183:vmCvar_t	cg_fovAdjust;
;184:vmCvar_t	cg_followKiller;
;185:
;186:typedef struct {
;187:	vmCvar_t	*vmCvar;
;188:	const char	*cvarName;
;189:	const char	*defaultString;
;190:	const int	cvarFlags;
;191:} cvarTable_t;
;192:
;193:static const cvarTable_t cvarTable[] = {
;194:	{ &cg_ignore, "cg_ignore", "0", 0 }, // used for debugging
;195:	{ &cg_autoswitch, "cg_autoswitch", "1", CVAR_ARCHIVE },
;196:	{ &cg_drawGun, "cg_drawGun", "1", CVAR_ARCHIVE },
;197:	{ &cg_zoomFov, "cg_zoomfov", "22.5", CVAR_ARCHIVE },
;198:	{ &cg_fov, "cg_fov", "90", CVAR_ARCHIVE },
;199:	{ &cg_viewsize, "cg_viewsize", "100", CVAR_ARCHIVE },
;200:	{ &cg_shadows, "cg_shadows", "1", CVAR_ARCHIVE },
;201:	{ &cg_gibs, "cg_gibs", "1", CVAR_ARCHIVE },
;202:	{ &cg_draw2D, "cg_draw2D", "1", CVAR_ARCHIVE },
;203:	{ &cg_drawStatus, "cg_drawStatus", "1", CVAR_ARCHIVE },
;204:	{ &cg_drawTimer, "cg_drawTimer", "0", CVAR_ARCHIVE },
;205:	{ &cg_drawFPS, "cg_drawFPS", "0", CVAR_ARCHIVE },
;206:	{ &cg_drawSnapshot, "cg_drawSnapshot", "0", CVAR_ARCHIVE  },
;207:	{ &cg_draw3dIcons, "cg_draw3dIcons", "1", CVAR_ARCHIVE },
;208:	{ &cg_drawIcons, "cg_drawIcons", "1", CVAR_ARCHIVE },
;209:	{ &cg_drawAmmoWarning, "cg_drawAmmoWarning", "1", CVAR_ARCHIVE },
;210:	{ &cg_drawAttacker, "cg_drawAttacker", "1", CVAR_ARCHIVE },
;211:	{ &cg_drawSpeed, "cg_drawSpeed", "0", CVAR_ARCHIVE },
;212:	{ &cg_drawCrosshair, "cg_drawCrosshair", "4", CVAR_ARCHIVE },
;213:	{ &cg_drawCrosshairNames, "cg_drawCrosshairNames", "1", CVAR_ARCHIVE },
;214:	{ &cg_drawRewards, "cg_drawRewards", "1", CVAR_ARCHIVE },
;215:	{ &cg_drawWeaponSelect, "cg_drawWeaponSelect", "1", CVAR_ARCHIVE },
;216:	{ &cg_crosshairSize, "cg_crosshairSize", "24", CVAR_ARCHIVE },
;217:	{ &cg_crosshairHealth, "cg_crosshairHealth", "1", CVAR_ARCHIVE },
;218:	{ &cg_crosshairX, "cg_crosshairX", "0", CVAR_ARCHIVE },
;219:	{ &cg_crosshairY, "cg_crosshairY", "0", CVAR_ARCHIVE },
;220:	{ &cg_brassTime, "cg_brassTime", "2500", CVAR_ARCHIVE },
;221:	{ &cg_simpleItems, "cg_simpleItems", "0", CVAR_ARCHIVE },
;222:	{ &cg_addMarks, "cg_marks", "1", CVAR_ARCHIVE },
;223:	{ &cg_lagometer, "cg_lagometer", "1", CVAR_ARCHIVE },
;224:	{ &cg_railTrailTime, "cg_railTrailTime", "400", CVAR_ARCHIVE  },
;225:	{ &cg_railTrailRadius, "cg_railTrailRadius", "0", CVAR_ARCHIVE  },
;226:	{ &cg_gun_x, "cg_gunX", "0", CVAR_ARCHIVE },
;227:	{ &cg_gun_y, "cg_gunY", "0", CVAR_ARCHIVE },
;228:	{ &cg_gun_z, "cg_gunZ", "0", CVAR_ARCHIVE },
;229:	{ &cg_centertime, "cg_centertime", "3", CVAR_CHEAT },
;230:	{ &cg_runpitch, "cg_runpitch", "0.002", CVAR_ARCHIVE},
;231:	{ &cg_runroll, "cg_runroll", "0.005", CVAR_ARCHIVE },
;232:	{ &cg_bobup , "cg_bobup", "0.005", CVAR_ARCHIVE },
;233:	{ &cg_bobpitch, "cg_bobpitch", "0.002", CVAR_ARCHIVE },
;234:	{ &cg_bobroll, "cg_bobroll", "0.002", CVAR_ARCHIVE },
;235:	{ &cg_swingSpeed, "cg_swingSpeed", "0.3", CVAR_CHEAT },
;236:	{ &cg_animSpeed, "cg_animspeed", "1", CVAR_CHEAT },
;237:	{ &cg_debugAnim, "cg_debuganim", "0", CVAR_CHEAT },
;238:	{ &cg_debugPosition, "cg_debugposition", "0", CVAR_CHEAT },
;239:	{ &cg_debugEvents, "cg_debugevents", "0", CVAR_CHEAT },
;240:	{ &cg_errorDecay, "cg_errordecay", "100", 0 },
;241:	{ &cg_nopredict, "cg_nopredict", "0", 0 },
;242:	{ &cg_noPlayerAnims, "cg_noplayeranims", "0", CVAR_CHEAT },
;243:	{ &cg_showmiss, "cg_showmiss", "0", 0 },
;244:	{ &cg_footsteps, "cg_footsteps", "1", CVAR_CHEAT },
;245:	{ &cg_tracerChance, "cg_tracerchance", "0.4", CVAR_CHEAT },
;246:	{ &cg_tracerWidth, "cg_tracerwidth", "1", CVAR_CHEAT },
;247:	{ &cg_tracerLength, "cg_tracerlength", "100", CVAR_CHEAT },
;248:	{ &cg_thirdPersonRange, "cg_thirdPersonRange", "40", CVAR_CHEAT },
;249:	{ &cg_thirdPersonAngle, "cg_thirdPersonAngle", "0", CVAR_CHEAT },
;250:	{ &cg_thirdPerson, "cg_thirdPerson", "0", 0 },
;251:	{ &cg_teamChatTime, "cg_teamChatTime", "3000", CVAR_ARCHIVE  },
;252:	{ &cg_teamChatHeight, "cg_teamChatHeight", "0", CVAR_ARCHIVE  },
;253:	{ &cg_forceModel, "cg_forceModel", "0", CVAR_ARCHIVE  },
;254:	{ &cg_predictItems, "cg_predictItems", "1", CVAR_ARCHIVE },
;255:	{ &cg_deferPlayers, "cg_deferPlayers", "1", CVAR_ARCHIVE },
;256:	{ &cg_drawTeamOverlay, "cg_drawTeamOverlay", "0", CVAR_ARCHIVE },
;257:	{ &cg_teamOverlayUserinfo, "teamoverlay", "0", CVAR_ROM | CVAR_USERINFO },
;258:	{ &cg_stats, "cg_stats", "0", 0 },
;259:	{ &cg_drawFriend, "cg_drawFriend", "1", CVAR_ARCHIVE },
;260:	{ &cg_teamChatsOnly, "cg_teamChatsOnly", "0", CVAR_ARCHIVE },
;261:	// the following variables are created in other parts of the system,
;262:	// but we also reference them here
;263:	{ &cg_buildScript, "com_buildScript", "0", 0 },	// force loading of all possible data amd error on failures
;264:	{ &cg_paused, "cl_paused", "0", CVAR_ROM },
;265:	{ &cg_blood, "com_blood", "1", CVAR_ARCHIVE },
;266:
;267:	{ &cg_redTeamName, "g_redteam", DEFAULT_REDTEAM_NAME, CVAR_ARCHIVE | CVAR_SERVERINFO | CVAR_USERINFO },
;268:	{ &cg_blueTeamName, "g_blueteam", DEFAULT_BLUETEAM_NAME, CVAR_ARCHIVE | CVAR_SERVERINFO | CVAR_USERINFO },
;269:	{ &cg_singlePlayer, "ui_singlePlayerActive", "0", CVAR_USERINFO},
;270:	{ &cg_enableDust, "g_enableDust", "0", CVAR_SERVERINFO},
;271:	{ &cg_enableBreath, "g_enableBreath", "0", CVAR_SERVERINFO},
;272:	{ &cg_singlePlayerActive, "ui_singlePlayerActive", "0", CVAR_USERINFO},
;273:	{ &cg_recordSPDemo, "ui_recordSPDemo", "0", CVAR_ARCHIVE},
;274:	{ &cg_recordSPDemoName, "ui_recordSPDemoName", "", CVAR_ARCHIVE},
;275:	{ &cg_obeliskRespawnDelay, "g_obeliskRespawnDelay", "10", CVAR_SERVERINFO},
;276:	{ &cg_hudFiles, "cg_hudFiles", "ui/hud.txt", CVAR_ARCHIVE},
;277:
;278:	{ &cg_cameraOrbit, "cg_cameraOrbit", "0", CVAR_CHEAT},
;279:	{ &cg_cameraOrbitDelay, "cg_cameraOrbitDelay", "50", CVAR_ARCHIVE},
;280:	{ &cg_timescaleFadeEnd, "cg_timescaleFadeEnd", "1", 0},
;281:	{ &cg_timescaleFadeSpeed, "cg_timescaleFadeSpeed", "0", 0},
;282:	{ &cg_timescale, "timescale", "1", 0},
;283:	{ &cg_scorePlum, "cg_scorePlums", "1", CVAR_USERINFO | CVAR_ARCHIVE},
;284:	{ &cg_smoothClients, "cg_smoothClients", "0", CVAR_USERINFO | CVAR_ARCHIVE},
;285:	{ &cg_cameraMode, "com_cameraMode", "0", CVAR_CHEAT},
;286:	{ &cg_noTaunt, "cg_noTaunt", "0", CVAR_ARCHIVE},
;287:	{ &cg_noProjectileTrail, "cg_noProjectileTrail", "0", CVAR_ARCHIVE},
;288:	{ &cg_smallFont, "ui_smallFont", "0.25", CVAR_ARCHIVE},
;289:	{ &cg_bigFont, "ui_bigFont", "0.4", CVAR_ARCHIVE},
;290:	{ &cg_oldRail, "cg_oldRail", "1", CVAR_ARCHIVE},
;291:	{ &cg_oldRocket, "cg_oldRocket", "1", CVAR_ARCHIVE},
;292:	{ &cg_oldPlasma, "cg_oldPlasma", "1", CVAR_ARCHIVE},
;293:	{ &cg_trueLightning, "cg_trueLightning", "0.0", CVAR_ARCHIVE},
;294:	{ &cg_hitSounds, "cg_hitSounds", "0", CVAR_ARCHIVE},
;295:	{ &cg_enemyModel, "cg_enemyModel", "", CVAR_ARCHIVE},
;296:	{ &cg_enemyColors, "cg_enemyColors", "", CVAR_ARCHIVE},
;297:	{ &cg_teamModel, "cg_teamModel", "", CVAR_ARCHIVE},
;298:	{ &cg_teamColors, "cg_teamColors", "", CVAR_ARCHIVE},
;299:	{ &cg_deadBodyDarken, "cg_deadBodyDarken", "1", CVAR_ARCHIVE},
;300:	{ &cg_fovAdjust, "cg_fovAdjust", "0", CVAR_ARCHIVE},
;301:	{ &cg_followKiller, "cg_followKiller", "0", CVAR_ARCHIVE}
;302:};
;303:
;304:
;305:/*
;306:=================
;307:CG_RegisterCvars
;308:=================
;309:*/
;310:void CG_RegisterCvars( void ) {
line 315
;311:	int			i;
;312:	const cvarTable_t	*cv;
;313:	char		var[MAX_TOKEN_CHARS];
;314:
;315:	for ( i = 0, cv = cvarTable ; i < ARRAY_LEN( cvarTable ) ; i++, cv++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 cvarTable
ASGNP4
ADDRGP4 $218
JUMPV
LABELV $215
line 316
;316:		trap_Cvar_Register( cv->vmCvar, cv->cvarName,
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 318
;317:			cv->defaultString, cv->cvarFlags );
;318:	}
LABELV $216
line 315
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
LABELV $218
ADDRLP4 4
INDIRI4
CVIU4 4
CNSTU4 104
LTU4 $215
line 321
;319:
;320:	// see if we are also running the server on this machine
;321:	trap_Cvar_VariableStringBuffer( "sv_running", var, sizeof( var ) );
ADDRGP4 $219
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 322
;322:	cgs.localServer = atoi( var );
ADDRLP4 8
ARGP4
ADDRLP4 1032
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 cgs+31476
ADDRLP4 1032
INDIRI4
ASGNI4
line 324
;323:
;324:	forceModelModificationCount = cg_forceModel.modificationCount;
ADDRGP4 forceModelModificationCount
ADDRGP4 cg_forceModel+4
INDIRI4
ASGNI4
line 325
;325:	enemyModelModificationCount = cg_enemyModel.modificationCount;
ADDRGP4 enemyModelModificationCount
ADDRGP4 cg_enemyModel+4
INDIRI4
ASGNI4
line 326
;326:	enemyColorsModificationCount = cg_enemyColors.modificationCount;
ADDRGP4 enemyColorsModificationCount
ADDRGP4 cg_enemyColors+4
INDIRI4
ASGNI4
line 327
;327:	teamModelModificationCount = cg_teamModel.modificationCount;
ADDRGP4 teamModelModificationCount
ADDRGP4 cg_teamModel+4
INDIRI4
ASGNI4
line 328
;328:	teamColorsModificationCount = cg_teamColors.modificationCount;
ADDRGP4 teamColorsModificationCount
ADDRGP4 cg_teamColors+4
INDIRI4
ASGNI4
line 331
;329:
;330:
;331:	trap_Cvar_Register(NULL, "model", DEFAULT_MODEL, CVAR_USERINFO | CVAR_ARCHIVE );
CNSTP4 0
ARGP4
ADDRGP4 $226
ARGP4
ADDRGP4 $227
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 332
;332:	trap_Cvar_Register(NULL, "headmodel", DEFAULT_MODEL, CVAR_USERINFO | CVAR_ARCHIVE );
CNSTP4 0
ARGP4
ADDRGP4 $228
ARGP4
ADDRGP4 $227
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 335
;333:	//trap_Cvar_Register(NULL, "team_model", DEFAULT_TEAM_MODEL, CVAR_USERINFO | CVAR_ARCHIVE );
;334:	//trap_Cvar_Register(NULL, "team_headmodel", DEFAULT_TEAM_HEAD, CVAR_USERINFO | CVAR_ARCHIVE );
;335:}
LABELV $214
endproc CG_RegisterCvars 1036 16
export CG_ForceModelChange
proc CG_ForceModelChange 12 4
line 343
;336:
;337:
;338:/*																																			
;339:===================
;340:CG_ForceModelChange
;341:===================
;342:*/
;343:void CG_ForceModelChange( void ) {
line 347
;344:	const char *clientInfo;
;345:	int	i;
;346:
;347:	for ( i = 0 ; i < MAX_CLIENTS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $230
line 348
;348:		clientInfo = CG_ConfigString( CS_PLAYERS + i );
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 8
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 349
;349:		if ( !clientInfo[0] ) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $234
line 350
;350:			continue;
ADDRGP4 $231
JUMPV
LABELV $234
line 352
;351:		}
;352:		CG_NewClientInfo( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_NewClientInfo
CALLV
pop
line 353
;353:	}
LABELV $231
line 347
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $230
line 354
;354:}
LABELV $229
endproc CG_ForceModelChange 12 4
export CG_UpdateCvars
proc CG_UpdateCvars 8 8
line 362
;355:
;356:
;357:/*
;358:=================
;359:CG_UpdateCvars
;360:=================
;361:*/
;362:void CG_UpdateCvars( void ) {
line 366
;363:	int			i;
;364:	const cvarTable_t	*cv;
;365:
;366:	for ( i = 0, cv = cvarTable ; i < ARRAY_LEN( cvarTable ) ; i++, cv++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 4
ADDRGP4 cvarTable
ASGNP4
ADDRGP4 $240
JUMPV
LABELV $237
line 367
;367:		trap_Cvar_Update( cv->vmCvar );
ADDRLP4 4
INDIRP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 368
;368:	}
LABELV $238
line 366
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
LABELV $240
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 104
LTU4 $237
line 374
;369:
;370:	// check for modications here
;371:
;372:	// If team overlay is on, ask for updates from the server.  If its off,
;373:	// let the server know so we don't receive it
;374:	if ( drawTeamOverlayModificationCount != cg_drawTeamOverlay.modificationCount ) {
ADDRGP4 drawTeamOverlayModificationCount
INDIRI4
ADDRGP4 cg_drawTeamOverlay+4
INDIRI4
EQI4 $241
line 375
;375:		drawTeamOverlayModificationCount = cg_drawTeamOverlay.modificationCount;
ADDRGP4 drawTeamOverlayModificationCount
ADDRGP4 cg_drawTeamOverlay+4
INDIRI4
ASGNI4
line 384
;376:#if 0
;377:		if ( cg_drawTeamOverlay.integer > 0 ) {
;378:			trap_Cvar_Set( "teamoverlay", "1" );
;379:		} else {
;380:			trap_Cvar_Set( "teamoverlay", "0" );
;381:		}
;382:#endif
;383:		// FIXME E3 HACK
;384:		trap_Cvar_Set( "teamoverlay", "1" );
ADDRGP4 $166
ARGP4
ADDRGP4 $90
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 385
;385:	}
LABELV $241
line 388
;386:
;387:	// if model changed
;388:	if ( forceModelModificationCount != cg_forceModel.modificationCount 
ADDRGP4 forceModelModificationCount
INDIRI4
ADDRGP4 cg_forceModel+4
INDIRI4
NEI4 $255
ADDRGP4 enemyModelModificationCount
INDIRI4
ADDRGP4 cg_enemyModel+4
INDIRI4
NEI4 $255
ADDRGP4 enemyColorsModificationCount
INDIRI4
ADDRGP4 cg_enemyColors+4
INDIRI4
NEI4 $255
ADDRGP4 teamModelModificationCount
INDIRI4
ADDRGP4 cg_teamModel+4
INDIRI4
NEI4 $255
ADDRGP4 teamColorsModificationCount
INDIRI4
ADDRGP4 cg_teamColors+4
INDIRI4
EQI4 $245
LABELV $255
line 392
;389:		|| enemyModelModificationCount != cg_enemyModel.modificationCount
;390:		|| enemyColorsModificationCount != cg_enemyColors.modificationCount
;391:		|| teamModelModificationCount != cg_teamModel.modificationCount
;392:		|| teamColorsModificationCount != cg_teamColors.modificationCount ) {
line 394
;393:
;394:		forceModelModificationCount = cg_forceModel.modificationCount;
ADDRGP4 forceModelModificationCount
ADDRGP4 cg_forceModel+4
INDIRI4
ASGNI4
line 395
;395:		enemyModelModificationCount = cg_enemyModel.modificationCount;
ADDRGP4 enemyModelModificationCount
ADDRGP4 cg_enemyModel+4
INDIRI4
ASGNI4
line 396
;396:		enemyColorsModificationCount = cg_enemyColors.modificationCount;
ADDRGP4 enemyColorsModificationCount
ADDRGP4 cg_enemyColors+4
INDIRI4
ASGNI4
line 397
;397:		teamModelModificationCount = cg_teamModel.modificationCount;
ADDRGP4 teamModelModificationCount
ADDRGP4 cg_teamModel+4
INDIRI4
ASGNI4
line 398
;398:		teamColorsModificationCount = cg_teamColors.modificationCount;
ADDRGP4 teamColorsModificationCount
ADDRGP4 cg_teamColors+4
INDIRI4
ASGNI4
line 400
;399:
;400:		CG_ForceModelChange();
ADDRGP4 CG_ForceModelChange
CALLV
pop
line 401
;401:	}
LABELV $245
line 402
;402:}
LABELV $236
endproc CG_UpdateCvars 8 8
export CG_CrosshairPlayer
proc CG_CrosshairPlayer 0 0
line 405
;403:
;404:
;405:int CG_CrosshairPlayer( void ) {
line 406
;406:	if ( cg.time > ( cg.crosshairClientTime + 1000 ) ) {
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+125476
INDIRI4
CNSTI4 1000
ADDI4
LEI4 $262
line 407
;407:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $261
JUMPV
LABELV $262
line 409
;408:	}
;409:	return cg.crosshairClientNum;
ADDRGP4 cg+125472
INDIRI4
RETI4
LABELV $261
endproc CG_CrosshairPlayer 0 0
export CG_LastAttacker
proc CG_LastAttacker 0 0
line 412
;410:}
;411:
;412:int CG_LastAttacker( void ) {
line 413
;413:	if ( !cg.attackerTime ) {
ADDRGP4 cg+125524
INDIRI4
CNSTI4 0
NEI4 $268
line 414
;414:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $267
JUMPV
LABELV $268
line 416
;415:	}
;416:	return cg.snap->ps.persistant[PERS_ATTACKER];
ADDRGP4 cg+36
INDIRP4
CNSTI4 316
ADDP4
INDIRI4
RETI4
LABELV $267
endproc CG_LastAttacker 0 0
export CG_Printf
proc CG_Printf 1028 12
line 419
;417:}
;418:
;419:void QDECL CG_Printf( const char *msg, ... ) {
line 423
;420:	va_list		argptr;
;421:	char		text[1024];
;422:
;423:	va_start (argptr, msg);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 424
;424:	ED_vsprintf (text, msg, argptr);
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ED_vsprintf
CALLI4
pop
line 425
;425:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 427
;426:
;427:	trap_Print( text );
ADDRLP4 4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 428
;428:}
LABELV $272
endproc CG_Printf 1028 12
export CG_Error
proc CG_Error 1028 12
line 430
;429:
;430:void QDECL CG_Error( const char *msg, ... ) {
line 434
;431:	va_list		argptr;
;432:	char		text[1024];
;433:
;434:	va_start (argptr, msg);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 435
;435:	ED_vsprintf (text, msg, argptr);
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ED_vsprintf
CALLI4
pop
line 436
;436:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 438
;437:
;438:	trap_Error( text );
ADDRLP4 4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 439
;439:}
LABELV $274
endproc CG_Error 1028 12
export Com_Error
proc Com_Error 1028 12
line 444
;440:
;441:#ifndef CGAME_HARD_LINKED
;442:// this is only here so the functions in q_shared.c and bg_*.c can link (FIXME)
;443:
;444:void QDECL Com_Error( int level, const char *error, ... ) {
line 448
;445:	va_list		argptr;
;446:	char		text[1024];
;447:
;448:	va_start (argptr, error);
ADDRLP4 0
ADDRFP4 4+4
ASGNP4
line 449
;449:	ED_vsprintf (text, error, argptr);
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
line 450
;450:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 452
;451:
;452:	trap_Error( text );
ADDRLP4 4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 453
;453:}
LABELV $276
endproc Com_Error 1028 12
export Com_Printf
proc Com_Printf 1028 12
line 455
;454:
;455:void QDECL Com_Printf( const char *msg, ... ) {
line 459
;456:	va_list		argptr;
;457:	char		text[1024];
;458:
;459:	va_start (argptr, msg);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 460
;460:	ED_vsprintf (text, msg, argptr);
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ED_vsprintf
CALLI4
pop
line 461
;461:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 463
;462:
;463:	trap_Print( text );
ADDRLP4 4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 464
;464:}
LABELV $278
endproc Com_Printf 1028 12
bss
align 1
LABELV $281
skip 2048
data
align 4
LABELV $282
byte 4 0
export CG_Argv
code
proc CG_Argv 4 12
line 474
;465:
;466:#endif
;467:
;468:/*
;469:================
;470:CG_Argv
;471:================
;472:*/
;473:const char *CG_Argv( int arg ) 
;474:{
line 478
;475:	static char	buffer[ 2 ][ MAX_STRING_CHARS ];
;476:	static int index = 0;
;477:
;478:	index ^= 1;
ADDRLP4 0
ADDRGP4 $282
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 479
;479:	trap_Argv( arg, buffer[ index ], sizeof( buffer[ 0 ] ) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $282
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 $281
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 481
;480:
;481:	return buffer[ index ];
ADDRGP4 $282
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 $281
ADDP4
RETP4
LABELV $280
endproc CG_Argv 4 12
proc CG_RegisterItemSounds 96 12
line 494
;482:}
;483:
;484:
;485://========================================================================
;486:
;487:/*
;488:=================
;489:CG_RegisterItemSounds
;490:
;491:The server says this item is used on this level
;492:=================
;493:*/
;494:static void CG_RegisterItemSounds( int itemNum ) {
line 500
;495:	gitem_t			*item;
;496:	char			data[MAX_QPATH];
;497:	const char		*s, *start;
;498:	int				len;
;499:
;500:	item = &bg_itemlist[ itemNum ];
ADDRLP4 76
ADDRFP4 0
INDIRI4
CNSTI4 52
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 502
;501:
;502:	if( item->pickup_sound ) {
ADDRLP4 76
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $284
line 503
;503:		trap_S_RegisterSound( item->pickup_sound, qfalse );
ADDRLP4 76
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound
CALLI4
pop
line 504
;504:	}
LABELV $284
line 507
;505:
;506:	// parse the space seperated precache string for other media
;507:	s = item->sounds;
ADDRLP4 0
ADDRLP4 76
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
ASGNP4
line 508
;508:	if (!s || !s[0])
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $288
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $290
LABELV $288
line 509
;509:		return;
ADDRGP4 $283
JUMPV
LABELV $289
line 511
;510:
;511:	while (*s) {
line 512
;512:		start = s;
ADDRLP4 72
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $293
JUMPV
LABELV $292
line 513
;513:		while (*s && *s != ' ') {
line 514
;514:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 515
;515:		}
LABELV $293
line 513
ADDRLP4 84
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $295
ADDRLP4 84
INDIRI4
CNSTI4 32
NEI4 $292
LABELV $295
line 517
;516:
;517:		len = s-start;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 72
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
ASGNI4
line 518
;518:		if (len >= MAX_QPATH || len < 5) {
ADDRLP4 4
INDIRI4
CNSTI4 64
GEI4 $298
ADDRLP4 4
INDIRI4
CNSTI4 5
GEI4 $296
LABELV $298
line 519
;519:			CG_Error( "PrecacheItem: %s has bad precache string", 
ADDRGP4 $299
ARGP4
ADDRLP4 76
INDIRP4
INDIRP4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 521
;520:				item->classname);
;521:			return;
ADDRGP4 $283
JUMPV
LABELV $296
line 523
;522:		}
;523:		memcpy (data, start, len);
ADDRLP4 8
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 524
;524:		data[len] = 0;
ADDRLP4 4
INDIRI4
ADDRLP4 8
ADDP4
CNSTI1 0
ASGNI1
line 525
;525:		if ( *s ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $300
line 526
;526:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 527
;527:		}
LABELV $300
line 529
;528:
;529:		if ( !strcmp(data+len-3, "wav" )) {
ADDRLP4 4
INDIRI4
ADDRLP4 8-3
ADDP4
ARGP4
ADDRGP4 $305
ARGP4
ADDRLP4 92
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $302
line 530
;530:			trap_S_RegisterSound( data, qfalse );
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound
CALLI4
pop
line 531
;531:		}
LABELV $302
line 532
;532:	}
LABELV $290
line 511
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $289
line 533
;533:}
LABELV $283
endproc CG_RegisterItemSounds 96 12
proc CG_RegisterSounds 684 16
line 543
;534:
;535:
;536:/*
;537:=================
;538:CG_RegisterSounds
;539:
;540:called during a precache command
;541:=================
;542:*/
;543:static void CG_RegisterSounds( void ) {
line 549
;544:	int		i;
;545:	char	items[MAX_ITEMS+1];
;546:	char	name[MAX_QPATH];
;547:	const char	*soundName;
;548:
;549:	cgs.media.oneMinuteSound = trap_S_RegisterSound( "sound/feedback/1_minute.wav", qtrue );
ADDRGP4 $309
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 332
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+904
ADDRLP4 332
INDIRI4
ASGNI4
line 550
;550:	cgs.media.fiveMinuteSound = trap_S_RegisterSound( "sound/feedback/5_minute.wav", qtrue );
ADDRGP4 $312
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 336
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+908
ADDRLP4 336
INDIRI4
ASGNI4
line 551
;551:	cgs.media.suddenDeathSound = trap_S_RegisterSound( "sound/feedback/sudden_death.wav", qtrue );
ADDRGP4 $315
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 340
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+912
ADDRLP4 340
INDIRI4
ASGNI4
line 552
;552:	cgs.media.oneFragSound = trap_S_RegisterSound( "sound/feedback/1_frag.wav", qtrue );
ADDRGP4 $318
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 344
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+924
ADDRLP4 344
INDIRI4
ASGNI4
line 553
;553:	cgs.media.twoFragSound = trap_S_RegisterSound( "sound/feedback/2_frags.wav", qtrue );
ADDRGP4 $321
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 348
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+920
ADDRLP4 348
INDIRI4
ASGNI4
line 554
;554:	cgs.media.threeFragSound = trap_S_RegisterSound( "sound/feedback/3_frags.wav", qtrue );
ADDRGP4 $324
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 352
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+916
ADDRLP4 352
INDIRI4
ASGNI4
line 555
;555:	cgs.media.count3Sound = trap_S_RegisterSound( "sound/feedback/three.wav", qtrue );
ADDRGP4 $327
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 356
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1104
ADDRLP4 356
INDIRI4
ASGNI4
line 556
;556:	cgs.media.count2Sound = trap_S_RegisterSound( "sound/feedback/two.wav", qtrue );
ADDRGP4 $330
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 360
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1108
ADDRLP4 360
INDIRI4
ASGNI4
line 557
;557:	cgs.media.count1Sound = trap_S_RegisterSound( "sound/feedback/one.wav", qtrue );
ADDRGP4 $333
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 364
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1112
ADDRLP4 364
INDIRI4
ASGNI4
line 558
;558:	cgs.media.countFightSound = trap_S_RegisterSound( "sound/feedback/fight.wav", qtrue );
ADDRGP4 $336
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 368
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1116
ADDRLP4 368
INDIRI4
ASGNI4
line 559
;559:	cgs.media.countPrepareSound = trap_S_RegisterSound( "sound/feedback/prepare.wav", qtrue );
ADDRGP4 $339
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 372
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1120
ADDRLP4 372
INDIRI4
ASGNI4
line 561
;560:
;561:	if ( cgs.gametype >= GT_TDM || cg_buildScript.integer ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
GEI4 $344
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $340
LABELV $344
line 563
;562:
;563:		cgs.media.captureAwardSound = trap_S_RegisterSound( "sound/teamplay/flagcapture_yourteam.wav", qtrue );
ADDRGP4 $347
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 376
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1016
ADDRLP4 376
INDIRI4
ASGNI4
line 564
;564:		cgs.media.redLeadsSound = trap_S_RegisterSound( "sound/feedback/redleads.wav", qtrue );
ADDRGP4 $350
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 380
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1028
ADDRLP4 380
INDIRI4
ASGNI4
line 565
;565:		cgs.media.blueLeadsSound = trap_S_RegisterSound( "sound/feedback/blueleads.wav", qtrue );
ADDRGP4 $353
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 384
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1032
ADDRLP4 384
INDIRI4
ASGNI4
line 566
;566:		cgs.media.teamsTiedSound = trap_S_RegisterSound( "sound/feedback/teamstied.wav", qtrue );
ADDRGP4 $356
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 388
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1036
ADDRLP4 388
INDIRI4
ASGNI4
line 567
;567:		cgs.media.hitTeamSound = trap_S_RegisterSound( "sound/feedback/hit_teammate.wav", qtrue );
ADDRGP4 $359
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 392
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+956
ADDRLP4 392
INDIRI4
ASGNI4
line 569
;568:
;569:		cgs.media.redScoredSound = trap_S_RegisterSound( "sound/teamplay/voc_red_scores.wav", qtrue );
ADDRGP4 $362
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 396
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1020
ADDRLP4 396
INDIRI4
ASGNI4
line 570
;570:		cgs.media.blueScoredSound = trap_S_RegisterSound( "sound/teamplay/voc_blue_scores.wav", qtrue );
ADDRGP4 $365
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 400
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1024
ADDRLP4 400
INDIRI4
ASGNI4
line 572
;571:
;572:		cgs.media.captureYourTeamSound = trap_S_RegisterSound( "sound/teamplay/flagcapture_yourteam.wav", qtrue );
ADDRGP4 $347
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 404
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1040
ADDRLP4 404
INDIRI4
ASGNI4
line 573
;573:		cgs.media.captureOpponentSound = trap_S_RegisterSound( "sound/teamplay/flagcapture_opponent.wav", qtrue );
ADDRGP4 $370
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 408
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1044
ADDRLP4 408
INDIRI4
ASGNI4
line 575
;574:
;575:		cgs.media.returnYourTeamSound = trap_S_RegisterSound( "sound/teamplay/flagreturn_yourteam.wav", qtrue );
ADDRGP4 $373
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 412
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1048
ADDRLP4 412
INDIRI4
ASGNI4
line 576
;576:		cgs.media.returnOpponentSound = trap_S_RegisterSound( "sound/teamplay/flagreturn_opponent.wav", qtrue );
ADDRGP4 $376
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 416
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1052
ADDRLP4 416
INDIRI4
ASGNI4
line 578
;577:
;578:		cgs.media.takenYourTeamSound = trap_S_RegisterSound( "sound/teamplay/flagtaken_yourteam.wav", qtrue );
ADDRGP4 $379
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 420
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1056
ADDRLP4 420
INDIRI4
ASGNI4
line 579
;579:		cgs.media.takenOpponentSound = trap_S_RegisterSound( "sound/teamplay/flagtaken_opponent.wav", qtrue );
ADDRGP4 $382
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 424
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1060
ADDRLP4 424
INDIRI4
ASGNI4
line 581
;580:
;581:		if ( cgs.gametype == GT_CTF || cg_buildScript.integer ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 4
EQI4 $387
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $383
LABELV $387
line 582
;582:			cgs.media.redFlagReturnedSound = trap_S_RegisterSound( "sound/teamplay/voc_red_returned.wav", qtrue );
ADDRGP4 $390
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 428
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1064
ADDRLP4 428
INDIRI4
ASGNI4
line 583
;583:			cgs.media.blueFlagReturnedSound = trap_S_RegisterSound( "sound/teamplay/voc_blue_returned.wav", qtrue );
ADDRGP4 $393
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 432
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1068
ADDRLP4 432
INDIRI4
ASGNI4
line 584
;584:			cgs.media.enemyTookYourFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_enemy_flag.wav", qtrue );
ADDRGP4 $396
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 436
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1076
ADDRLP4 436
INDIRI4
ASGNI4
line 585
;585:			cgs.media.yourTeamTookEnemyFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_team_flag.wav", qtrue );
ADDRGP4 $399
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 440
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1084
ADDRLP4 440
INDIRI4
ASGNI4
line 586
;586:		}
LABELV $383
line 588
;587:
;588:		if ( cgs.gametype == GT_ONEFLAG || cg_buildScript.integer ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 5
EQI4 $404
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $400
LABELV $404
line 590
;589:			// FIXME: get a replacement for this sound ?
;590:			cgs.media.neutralFlagReturnedSound = trap_S_RegisterSound( "sound/teamplay/flagreturn_opponent.wav", qtrue );
ADDRGP4 $376
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 428
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1072
ADDRLP4 428
INDIRI4
ASGNI4
line 591
;591:			cgs.media.yourTeamTookTheFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_team_1flag.wav", qtrue );
ADDRGP4 $409
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 432
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1088
ADDRLP4 432
INDIRI4
ASGNI4
line 592
;592:			cgs.media.enemyTookTheFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_enemy_1flag.wav", qtrue );
ADDRGP4 $412
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 436
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1080
ADDRLP4 436
INDIRI4
ASGNI4
line 593
;593:		}
LABELV $400
line 595
;594:
;595:		if ( cgs.gametype == GT_ONEFLAG || cgs.gametype == GT_CTF || cg_buildScript.integer ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 5
EQI4 $419
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 4
EQI4 $419
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $413
LABELV $419
line 596
;596:			cgs.media.youHaveFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_you_flag.wav", qtrue );
ADDRGP4 $422
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 428
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1092
ADDRLP4 428
INDIRI4
ASGNI4
line 597
;597:			cgs.media.holyShitSound = trap_S_RegisterSound("sound/feedback/voc_holyshit.wav", qtrue);
ADDRGP4 $425
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 432
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1100
ADDRLP4 432
INDIRI4
ASGNI4
line 598
;598:		}
LABELV $413
line 600
;599:
;600:		if ( cgs.gametype == GT_OVERLOAD || cg_buildScript.integer ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 6
EQI4 $430
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $426
LABELV $430
line 601
;601:			cgs.media.yourBaseIsUnderAttackSound = trap_S_RegisterSound( "sound/teamplay/voc_base_attack.wav", qtrue );
ADDRGP4 $433
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 428
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1096
ADDRLP4 428
INDIRI4
ASGNI4
line 602
;602:		}
LABELV $426
line 603
;603:		cgs.media.neutralFlagReturnedSound = trap_S_RegisterSound( "sound/teamplay/flagreturn_opponent.wav", qtrue );
ADDRGP4 $376
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 428
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1072
ADDRLP4 428
INDIRI4
ASGNI4
line 604
;604:	}
LABELV $340
line 606
;605:
;606:	cgs.media.tracerSound = trap_S_RegisterSound( "sound/weapons/machinegun/buletby1.wav", qfalse );
ADDRGP4 $438
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 376
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+612
ADDRLP4 376
INDIRI4
ASGNI4
line 607
;607:	cgs.media.selectSound = trap_S_RegisterSound( "sound/weapons/change.wav", qfalse );
ADDRGP4 $441
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 380
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+616
ADDRLP4 380
INDIRI4
ASGNI4
line 608
;608:	cgs.media.wearOffSound = trap_S_RegisterSound( "sound/items/wearoff.wav", qfalse );
ADDRGP4 $444
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 384
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+624
ADDRLP4 384
INDIRI4
ASGNI4
line 609
;609:	cgs.media.useNothingSound = trap_S_RegisterSound( "sound/items/use_nothing.wav", qfalse );
ADDRGP4 $447
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 388
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+620
ADDRLP4 388
INDIRI4
ASGNI4
line 610
;610:	cgs.media.gibSound = trap_S_RegisterSound( "sound/player/gibsplt1.wav", qfalse );
ADDRGP4 $450
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 392
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+860
ADDRLP4 392
INDIRI4
ASGNI4
line 611
;611:	cgs.media.gibBounce1Sound = trap_S_RegisterSound( "sound/player/gibimp1.wav", qfalse );
ADDRGP4 $453
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 396
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+864
ADDRLP4 396
INDIRI4
ASGNI4
line 612
;612:	cgs.media.gibBounce2Sound = trap_S_RegisterSound( "sound/player/gibimp2.wav", qfalse );
ADDRGP4 $456
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 400
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+868
ADDRLP4 400
INDIRI4
ASGNI4
line 613
;613:	cgs.media.gibBounce3Sound = trap_S_RegisterSound( "sound/player/gibimp3.wav", qfalse );
ADDRGP4 $459
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 404
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+872
ADDRLP4 404
INDIRI4
ASGNI4
line 615
;614:
;615:	cgs.media.useInvulnerabilitySound = trap_S_RegisterSound( "sound/items/invul_activate.wav", qfalse );
ADDRGP4 $462
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 408
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+816
ADDRLP4 408
INDIRI4
ASGNI4
line 616
;616:	cgs.media.invulnerabilityImpactSound1 = trap_S_RegisterSound( "sound/items/invul_impact_01.wav", qfalse );
ADDRGP4 $465
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 412
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+820
ADDRLP4 412
INDIRI4
ASGNI4
line 617
;617:	cgs.media.invulnerabilityImpactSound2 = trap_S_RegisterSound( "sound/items/invul_impact_02.wav", qfalse );
ADDRGP4 $468
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 416
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+824
ADDRLP4 416
INDIRI4
ASGNI4
line 618
;618:	cgs.media.invulnerabilityImpactSound3 = trap_S_RegisterSound( "sound/items/invul_impact_03.wav", qfalse );
ADDRGP4 $471
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 420
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+828
ADDRLP4 420
INDIRI4
ASGNI4
line 619
;619:	cgs.media.invulnerabilityJuicedSound = trap_S_RegisterSound( "sound/items/invul_juiced.wav", qfalse );
ADDRGP4 $474
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 424
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+832
ADDRLP4 424
INDIRI4
ASGNI4
line 620
;620:	cgs.media.obeliskHitSound1 = trap_S_RegisterSound( "sound/items/obelisk_hit_01.wav", qfalse );
ADDRGP4 $477
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 428
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+836
ADDRLP4 428
INDIRI4
ASGNI4
line 621
;621:	cgs.media.obeliskHitSound2 = trap_S_RegisterSound( "sound/items/obelisk_hit_02.wav", qfalse );
ADDRGP4 $480
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 432
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+840
ADDRLP4 432
INDIRI4
ASGNI4
line 622
;622:	cgs.media.obeliskHitSound3 = trap_S_RegisterSound( "sound/items/obelisk_hit_03.wav", qfalse );
ADDRGP4 $483
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 436
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+844
ADDRLP4 436
INDIRI4
ASGNI4
line 623
;623:	cgs.media.obeliskRespawnSound = trap_S_RegisterSound( "sound/items/obelisk_respawn.wav", qfalse );
ADDRGP4 $486
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 440
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+848
ADDRLP4 440
INDIRI4
ASGNI4
line 625
;624:
;625:	cgs.media.ammoregenSound = trap_S_RegisterSound("sound/items/cl_ammoregen.wav", qfalse);
ADDRGP4 $489
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 444
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1140
ADDRLP4 444
INDIRI4
ASGNI4
line 626
;626:	cgs.media.doublerSound = trap_S_RegisterSound("sound/items/cl_doubler.wav", qfalse);
ADDRGP4 $492
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 448
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1144
ADDRLP4 448
INDIRI4
ASGNI4
line 627
;627:	cgs.media.guardSound = trap_S_RegisterSound("sound/items/cl_guard.wav", qfalse);
ADDRGP4 $495
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 452
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1148
ADDRLP4 452
INDIRI4
ASGNI4
line 628
;628:	cgs.media.scoutSound = trap_S_RegisterSound("sound/items/cl_scout.wav", qfalse);
ADDRGP4 $498
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 456
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1152
ADDRLP4 456
INDIRI4
ASGNI4
line 630
;629:
;630:	cgs.media.teleInSound = trap_S_RegisterSound( "sound/world/telein.wav", qfalse );
ADDRGP4 $501
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 460
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+876
ADDRLP4 460
INDIRI4
ASGNI4
line 631
;631:	cgs.media.teleOutSound = trap_S_RegisterSound( "sound/world/teleout.wav", qfalse );
ADDRGP4 $504
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 464
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+880
ADDRLP4 464
INDIRI4
ASGNI4
line 632
;632:	cgs.media.respawnSound = trap_S_RegisterSound( "sound/items/respawn1.wav", qfalse );
ADDRGP4 $507
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 468
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+888
ADDRLP4 468
INDIRI4
ASGNI4
line 634
;633:
;634:	cgs.media.noAmmoSound = trap_S_RegisterSound( "sound/weapons/noammo.wav", qfalse );
ADDRGP4 $510
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 472
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+884
ADDRLP4 472
INDIRI4
ASGNI4
line 636
;635:
;636:	cgs.media.talkSound = trap_S_RegisterSound( "sound/player/talk.wav", qfalse );
ADDRGP4 $513
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 476
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+892
ADDRLP4 476
INDIRI4
ASGNI4
line 637
;637:	cgs.media.landSound = trap_S_RegisterSound( "sound/player/land1.wav", qfalse);
ADDRGP4 $516
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 480
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+896
ADDRLP4 480
INDIRI4
ASGNI4
line 639
;638:
;639:	cgs.media.hitSounds[0] = trap_S_RegisterSound( "sound/feedback/hit25.wav", qfalse );
ADDRGP4 $519
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 484
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+932
ADDRLP4 484
INDIRI4
ASGNI4
line 640
;640:	cgs.media.hitSounds[1] = trap_S_RegisterSound( "sound/feedback/hit50.wav", qfalse );
ADDRGP4 $523
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 488
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+932+4
ADDRLP4 488
INDIRI4
ASGNI4
line 641
;641:	cgs.media.hitSounds[2] = trap_S_RegisterSound( "sound/feedback/hit75.wav", qfalse );
ADDRGP4 $527
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 492
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+932+8
ADDRLP4 492
INDIRI4
ASGNI4
line 642
;642:	cgs.media.hitSounds[3] = trap_S_RegisterSound( "sound/feedback/hit100.wav", qfalse );
ADDRGP4 $531
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 496
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+932+12
ADDRLP4 496
INDIRI4
ASGNI4
line 644
;643:
;644:	cgs.media.hitSound = trap_S_RegisterSound( "sound/feedback/hit.wav", qfalse );
ADDRGP4 $534
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 500
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+928
ADDRLP4 500
INDIRI4
ASGNI4
line 646
;645:
;646:	cgs.media.hitSoundHighArmor = trap_S_RegisterSound( "sound/feedback/hithi.wav", qfalse );
ADDRGP4 $537
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 504
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+948
ADDRLP4 504
INDIRI4
ASGNI4
line 647
;647:	cgs.media.hitSoundLowArmor = trap_S_RegisterSound( "sound/feedback/hitlo.wav", qfalse );
ADDRGP4 $540
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 508
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+952
ADDRLP4 508
INDIRI4
ASGNI4
line 649
;648:
;649:	cgs.media.impressiveSound = trap_S_RegisterSound( "sound/feedback/impressive.wav", qtrue );
ADDRGP4 $543
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 512
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+960
ADDRLP4 512
INDIRI4
ASGNI4
line 650
;650:	cgs.media.excellentSound = trap_S_RegisterSound( "sound/feedback/excellent.wav", qtrue );
ADDRGP4 $546
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 516
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+964
ADDRLP4 516
INDIRI4
ASGNI4
line 651
;651:	cgs.media.deniedSound = trap_S_RegisterSound( "sound/feedback/denied.wav", qtrue );
ADDRGP4 $549
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 520
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+968
ADDRLP4 520
INDIRI4
ASGNI4
line 652
;652:	cgs.media.humiliationSound = trap_S_RegisterSound( "sound/feedback/humiliation.wav", qtrue );
ADDRGP4 $552
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 524
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+972
ADDRLP4 524
INDIRI4
ASGNI4
line 653
;653:	cgs.media.assistSound = trap_S_RegisterSound( "sound/feedback/assist.wav", qtrue );
ADDRGP4 $555
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 528
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+976
ADDRLP4 528
INDIRI4
ASGNI4
line 654
;654:	cgs.media.defendSound = trap_S_RegisterSound( "sound/feedback/defense.wav", qtrue );
ADDRGP4 $558
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 532
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+980
ADDRLP4 532
INDIRI4
ASGNI4
line 656
;655:
;656:	cgs.media.takenLeadSound = trap_S_RegisterSound( "sound/feedback/takenlead.wav", qtrue);
ADDRGP4 $561
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 536
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+984
ADDRLP4 536
INDIRI4
ASGNI4
line 657
;657:	cgs.media.tiedLeadSound = trap_S_RegisterSound( "sound/feedback/tiedlead.wav", qtrue);
ADDRGP4 $564
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 540
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+988
ADDRLP4 540
INDIRI4
ASGNI4
line 658
;658:	cgs.media.lostLeadSound = trap_S_RegisterSound( "sound/feedback/lostlead.wav", qtrue);
ADDRGP4 $567
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 544
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+992
ADDRLP4 544
INDIRI4
ASGNI4
line 660
;659:
;660:	cgs.media.watrInSound = trap_S_RegisterSound( "sound/player/watr_in.wav", qfalse);
ADDRGP4 $570
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 548
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+996
ADDRLP4 548
INDIRI4
ASGNI4
line 661
;661:	cgs.media.watrOutSound = trap_S_RegisterSound( "sound/player/watr_out.wav", qfalse);
ADDRGP4 $573
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 552
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1000
ADDRLP4 552
INDIRI4
ASGNI4
line 662
;662:	cgs.media.watrUnSound = trap_S_RegisterSound( "sound/player/watr_un.wav", qfalse);
ADDRGP4 $576
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 556
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1004
ADDRLP4 556
INDIRI4
ASGNI4
line 664
;663:
;664:	cgs.media.jumpPadSound = trap_S_RegisterSound ("sound/world/jumppad.wav", qfalse );
ADDRGP4 $579
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 560
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+900
ADDRLP4 560
INDIRI4
ASGNI4
line 666
;665:
;666:	for (i=0 ; i<4 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $580
line 667
;667:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/step%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $584
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 668
;668:		cgs.media.footsteps[FOOTSTEP_NORMAL][i] = trap_S_RegisterSound (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 564
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+628
ADDP4
ADDRLP4 564
INDIRI4
ASGNI4
line 670
;669:
;670:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/boot%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $587
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 671
;671:		cgs.media.footsteps[FOOTSTEP_BOOT][i] = trap_S_RegisterSound (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 568
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+628+16
ADDP4
ADDRLP4 568
INDIRI4
ASGNI4
line 673
;672:
;673:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/flesh%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $591
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 674
;674:		cgs.media.footsteps[FOOTSTEP_FLESH][i] = trap_S_RegisterSound (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 572
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+628+32
ADDP4
ADDRLP4 572
INDIRI4
ASGNI4
line 676
;675:
;676:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/mech%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $595
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 677
;677:		cgs.media.footsteps[FOOTSTEP_MECH][i] = trap_S_RegisterSound (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 576
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+628+48
ADDP4
ADDRLP4 576
INDIRI4
ASGNI4
line 679
;678:
;679:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/energy%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $599
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 680
;680:		cgs.media.footsteps[FOOTSTEP_ENERGY][i] = trap_S_RegisterSound (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 580
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+628+64
ADDP4
ADDRLP4 580
INDIRI4
ASGNI4
line 682
;681:
;682:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/splash%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $603
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 683
;683:		cgs.media.footsteps[FOOTSTEP_SPLASH][i] = trap_S_RegisterSound (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 584
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+628+96
ADDP4
ADDRLP4 584
INDIRI4
ASGNI4
line 685
;684:
;685:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/clank%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $607
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 686
;686:		cgs.media.footsteps[FOOTSTEP_METAL][i] = trap_S_RegisterSound (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 588
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+628+80
ADDP4
ADDRLP4 588
INDIRI4
ASGNI4
line 687
;687:	}
LABELV $581
line 666
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $580
line 690
;688:
;689:	// only register the items that the server says we need
;690:	Q_strncpyz(items, CG_ConfigString(CS_ITEMS), sizeof(items));
CNSTI4 27
ARGI4
ADDRLP4 564
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 72
ARGP4
ADDRLP4 564
INDIRP4
ARGP4
CNSTI4 257
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 692
;691:
;692:	for ( i = 1 ; i < bg_numItems ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $614
JUMPV
LABELV $611
line 694
;693://		if ( items[ i ] == '1' || cg_buildScript.integer ) {
;694:			CG_RegisterItemSounds( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemSounds
CALLV
pop
line 696
;695://		}
;696:	}
LABELV $612
line 692
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $614
ADDRLP4 0
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $611
line 698
;697:
;698:	for ( i = 1 ; i < MAX_SOUNDS ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $615
line 699
;699:		soundName = CG_ConfigString( CS_SOUNDS+i );
ADDRLP4 0
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 568
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 68
ADDRLP4 568
INDIRP4
ASGNP4
line 700
;700:		if ( !soundName[0] ) {
ADDRLP4 68
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $619
line 701
;701:			break;
ADDRGP4 $617
JUMPV
LABELV $619
line 703
;702:		}
;703:		if ( soundName[0] == '*' ) {
ADDRLP4 68
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $621
line 704
;704:			continue;	// custom sound
ADDRGP4 $616
JUMPV
LABELV $621
line 706
;705:		}
;706:		cgs.gameSounds[i] = trap_S_RegisterSound( soundName, qfalse );
ADDRLP4 68
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 572
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+35872
ADDP4
ADDRLP4 572
INDIRI4
ASGNI4
line 707
;707:	}
LABELV $616
line 698
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $615
LABELV $617
line 710
;708:
;709:	// FIXME: only needed with item
;710:	cgs.media.flightSound = trap_S_RegisterSound( "sound/items/flight.wav", qfalse );
ADDRGP4 $626
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 568
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1008
ADDRLP4 568
INDIRI4
ASGNI4
line 711
;711:	cgs.media.medkitSound = trap_S_RegisterSound ("sound/items/use_medkit.wav", qfalse);
ADDRGP4 $629
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 572
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1012
ADDRLP4 572
INDIRI4
ASGNI4
line 712
;712:	cgs.media.quadSound = trap_S_RegisterSound("sound/items/damage3.wav", qfalse);
ADDRGP4 $632
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 576
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+608
ADDRLP4 576
INDIRI4
ASGNI4
line 713
;713:	cgs.media.sfx_ric1 = trap_S_RegisterSound ("sound/weapons/machinegun/ric1.wav", qfalse);
ADDRGP4 $635
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 580
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+752
ADDRLP4 580
INDIRI4
ASGNI4
line 714
;714:	cgs.media.sfx_ric2 = trap_S_RegisterSound ("sound/weapons/machinegun/ric2.wav", qfalse);
ADDRGP4 $638
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 584
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+756
ADDRLP4 584
INDIRI4
ASGNI4
line 715
;715:	cgs.media.sfx_ric3 = trap_S_RegisterSound ("sound/weapons/machinegun/ric3.wav", qfalse);
ADDRGP4 $641
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 588
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+760
ADDRLP4 588
INDIRI4
ASGNI4
line 717
;716:	//cgs.media.sfx_railg = trap_S_RegisterSound ("sound/weapons/railgun/railgf1a.wav", qfalse);
;717:	cgs.media.sfx_rockexp = trap_S_RegisterSound ("sound/weapons/rocket/rocklx1a.wav", qfalse);
ADDRGP4 $644
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 592
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+768
ADDRLP4 592
INDIRI4
ASGNI4
line 718
;718:	cgs.media.sfx_plasmaexp = trap_S_RegisterSound ("sound/weapons/plasma/plasmx1a.wav", qfalse);
ADDRGP4 $647
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 596
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+772
ADDRLP4 596
INDIRI4
ASGNI4
line 720
;719:
;720:	cgs.media.sfx_proxexp = trap_S_RegisterSound( "sound/weapons/proxmine/wstbexpl.wav" , qfalse);
ADDRGP4 $650
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 600
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+776
ADDRLP4 600
INDIRI4
ASGNI4
line 721
;721:	cgs.media.sfx_nghit = trap_S_RegisterSound( "sound/weapons/nailgun/wnalimpd.wav" , qfalse);
ADDRGP4 $653
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 604
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+780
ADDRLP4 604
INDIRI4
ASGNI4
line 722
;722:	cgs.media.sfx_nghitflesh = trap_S_RegisterSound( "sound/weapons/nailgun/wnalimpl.wav" , qfalse);
ADDRGP4 $656
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 608
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+784
ADDRLP4 608
INDIRI4
ASGNI4
line 723
;723:	cgs.media.sfx_nghitmetal = trap_S_RegisterSound( "sound/weapons/nailgun/wnalimpm.wav", qfalse );
ADDRGP4 $659
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 612
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+788
ADDRLP4 612
INDIRI4
ASGNI4
line 724
;724:	cgs.media.sfx_chghit = trap_S_RegisterSound( "sound/weapons/vulcan/wvulimpd.wav", qfalse );
ADDRGP4 $662
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 616
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+792
ADDRLP4 616
INDIRI4
ASGNI4
line 725
;725:	cgs.media.sfx_chghitflesh = trap_S_RegisterSound( "sound/weapons/vulcan/wvulimpl.wav", qfalse );
ADDRGP4 $665
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 620
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+796
ADDRLP4 620
INDIRI4
ASGNI4
line 726
;726:	cgs.media.sfx_chghitmetal = trap_S_RegisterSound( "sound/weapons/vulcan/wvulimpm.wav", qfalse );
ADDRGP4 $668
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 624
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+800
ADDRLP4 624
INDIRI4
ASGNI4
line 727
;727:	cgs.media.kamikazeExplodeSound = trap_S_RegisterSound( "sound/items/kam_explode.wav", qfalse );
ADDRGP4 $671
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 628
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+804
ADDRLP4 628
INDIRI4
ASGNI4
line 728
;728:	cgs.media.kamikazeImplodeSound = trap_S_RegisterSound( "sound/items/kam_implode.wav", qfalse );
ADDRGP4 $674
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 632
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+808
ADDRLP4 632
INDIRI4
ASGNI4
line 729
;729:	cgs.media.kamikazeFarSound = trap_S_RegisterSound( "sound/items/kam_explode_far.wav", qfalse );
ADDRGP4 $677
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 636
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+812
ADDRLP4 636
INDIRI4
ASGNI4
line 730
;730:	cgs.media.winnerSound = trap_S_RegisterSound( "sound/feedback/voc_youwin.wav", qfalse );
ADDRGP4 $680
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 640
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+852
ADDRLP4 640
INDIRI4
ASGNI4
line 731
;731:	cgs.media.loserSound = trap_S_RegisterSound( "sound/feedback/voc_youlose.wav", qfalse );
ADDRGP4 $683
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 644
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+856
ADDRLP4 644
INDIRI4
ASGNI4
line 733
;732:
;733:	cgs.media.wstbimplSound = trap_S_RegisterSound("sound/weapons/proxmine/wstbimpl.wav", qfalse);
ADDRGP4 $686
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 648
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1180
ADDRLP4 648
INDIRI4
ASGNI4
line 734
;734:	cgs.media.wstbimpmSound = trap_S_RegisterSound("sound/weapons/proxmine/wstbimpm.wav", qfalse);
ADDRGP4 $689
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 652
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1184
ADDRLP4 652
INDIRI4
ASGNI4
line 735
;735:	cgs.media.wstbimpdSound = trap_S_RegisterSound("sound/weapons/proxmine/wstbimpd.wav", qfalse);
ADDRGP4 $692
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 656
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1188
ADDRLP4 656
INDIRI4
ASGNI4
line 736
;736:	cgs.media.wstbactvSound = trap_S_RegisterSound("sound/weapons/proxmine/wstbactv.wav", qfalse);
ADDRGP4 $695
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 660
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1192
ADDRLP4 660
INDIRI4
ASGNI4
line 738
;737:
;738:	cgs.media.regenSound = trap_S_RegisterSound("sound/items/regen.wav", qfalse);
ADDRGP4 $698
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 664
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1160
ADDRLP4 664
INDIRI4
ASGNI4
line 739
;739:	cgs.media.protectSound = trap_S_RegisterSound("sound/items/protect3.wav", qfalse);
ADDRGP4 $701
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 668
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1164
ADDRLP4 668
INDIRI4
ASGNI4
line 740
;740:	cgs.media.n_healthSound = trap_S_RegisterSound("sound/items/n_health.wav", qfalse );
ADDRGP4 $704
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 672
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1168
ADDRLP4 672
INDIRI4
ASGNI4
line 741
;741:	cgs.media.hgrenb1aSound = trap_S_RegisterSound("sound/weapons/grenade/hgrenb1a.wav", qfalse);
ADDRGP4 $707
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 676
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1172
ADDRLP4 676
INDIRI4
ASGNI4
line 742
;742:	cgs.media.hgrenb2aSound = trap_S_RegisterSound("sound/weapons/grenade/hgrenb2a.wav", qfalse);
ADDRGP4 $710
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 680
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1176
ADDRLP4 680
INDIRI4
ASGNI4
line 743
;743:}
LABELV $306
endproc CG_RegisterSounds 684 16
data
align 4
LABELV $712
address $713
address $714
address $715
address $716
address $717
address $718
address $719
address $720
address $721
address $722
address $723
code
proc CG_RegisterGraphics 636 16
line 756
;744:
;745:
;746://===================================================================================
;747:
;748:
;749:/*
;750:=================
;751:CG_RegisterGraphics
;752:
;753:This function may execute for a couple of minutes with a slow disk.
;754:=================
;755:*/
;756:static void CG_RegisterGraphics( void ) {
line 774
;757:	int			i;
;758:	char		items[MAX_ITEMS+1];
;759:	static char		*sb_nums[11] = {
;760:		"gfx/2d/numbers/zero_32b",
;761:		"gfx/2d/numbers/one_32b",
;762:		"gfx/2d/numbers/two_32b",
;763:		"gfx/2d/numbers/three_32b",
;764:		"gfx/2d/numbers/four_32b",
;765:		"gfx/2d/numbers/five_32b",
;766:		"gfx/2d/numbers/six_32b",
;767:		"gfx/2d/numbers/seven_32b",
;768:		"gfx/2d/numbers/eight_32b",
;769:		"gfx/2d/numbers/nine_32b",
;770:		"gfx/2d/numbers/minus_32b",
;771:	};
;772:
;773:	// clear any references to old media
;774:	memset( &cg.refdef, 0, sizeof( cg.refdef ) );
ADDRGP4 cg+109056
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 775
;775:	trap_R_ClearScene();
ADDRGP4 trap_R_ClearScene
CALLV
pop
line 777
;776:
;777:	CG_LoadingString( cgs.mapname );
ADDRGP4 cgs+31508
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 779
;778:
;779:	trap_R_LoadWorldMap( cgs.mapname );
ADDRGP4 cgs+31508
ARGP4
ADDRGP4 trap_R_LoadWorldMap
CALLV
pop
line 782
;780:
;781:	// precache status bar pics
;782:	CG_LoadingString( "game media" );
ADDRGP4 $728
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 784
;783:
;784:	for ( i = 0 ; i < ARRAY_LEN( sb_nums ) ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $732
JUMPV
LABELV $729
line 785
;785:		cgs.media.numberShaders[i] = trap_R_RegisterShader( sb_nums[i] );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $712
ADDP4
INDIRP4
ARGP4
ADDRLP4 268
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+340
ADDP4
ADDRLP4 268
INDIRI4
ASGNI4
line 786
;786:	}
LABELV $730
line 784
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $732
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 11
LTU4 $729
line 788
;787:
;788:	cgs.media.botSkillShaders[0] = trap_R_RegisterShader( "menu/art/skill1.tga" );
ADDRGP4 $737
ARGP4
ADDRLP4 264
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+388
ADDRLP4 264
INDIRI4
ASGNI4
line 789
;789:	cgs.media.botSkillShaders[1] = trap_R_RegisterShader( "menu/art/skill2.tga" );
ADDRGP4 $741
ARGP4
ADDRLP4 268
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+388+4
ADDRLP4 268
INDIRI4
ASGNI4
line 790
;790:	cgs.media.botSkillShaders[2] = trap_R_RegisterShader( "menu/art/skill3.tga" );
ADDRGP4 $745
ARGP4
ADDRLP4 272
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+388+8
ADDRLP4 272
INDIRI4
ASGNI4
line 791
;791:	cgs.media.botSkillShaders[3] = trap_R_RegisterShader( "menu/art/skill4.tga" );
ADDRGP4 $749
ARGP4
ADDRLP4 276
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+388+12
ADDRLP4 276
INDIRI4
ASGNI4
line 792
;792:	cgs.media.botSkillShaders[4] = trap_R_RegisterShader( "menu/art/skill5.tga" );
ADDRGP4 $753
ARGP4
ADDRLP4 280
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+388+16
ADDRLP4 280
INDIRI4
ASGNI4
line 794
;793:
;794:	cgs.media.viewBloodShader = trap_R_RegisterShader( "viewBloodBlend" );
ADDRGP4 $756
ARGP4
ADDRLP4 284
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+248
ADDRLP4 284
INDIRI4
ASGNI4
line 796
;795:
;796:	cgs.media.deferShader = trap_R_RegisterShaderNoMip( "gfx/2d/defer.tga" );
ADDRGP4 $759
ARGP4
ADDRLP4 288
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+164
ADDRLP4 288
INDIRI4
ASGNI4
line 798
;797:
;798:	cgs.media.scoreboardName = trap_R_RegisterShaderNoMip( "menu/tab/name.tga" );
ADDRGP4 $762
ARGP4
ADDRLP4 292
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+568
ADDRLP4 292
INDIRI4
ASGNI4
line 799
;799:	cgs.media.scoreboardPing = trap_R_RegisterShaderNoMip( "menu/tab/ping.tga" );
ADDRGP4 $765
ARGP4
ADDRLP4 296
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+572
ADDRLP4 296
INDIRI4
ASGNI4
line 800
;800:	cgs.media.scoreboardScore = trap_R_RegisterShaderNoMip( "menu/tab/score.tga" );
ADDRGP4 $768
ARGP4
ADDRLP4 300
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+576
ADDRLP4 300
INDIRI4
ASGNI4
line 801
;801:	cgs.media.scoreboardTime = trap_R_RegisterShaderNoMip( "menu/tab/time.tga" );
ADDRGP4 $771
ARGP4
ADDRLP4 304
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+580
ADDRLP4 304
INDIRI4
ASGNI4
line 803
;802:
;803:	cgs.media.smokePuffShader = trap_R_RegisterShader( "smokePuff" );
ADDRGP4 $774
ARGP4
ADDRLP4 308
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+308
ADDRLP4 308
INDIRI4
ASGNI4
line 804
;804:	cgs.media.smokePuffRageProShader = trap_R_RegisterShader( "smokePuffRagePro" );
ADDRGP4 $777
ARGP4
ADDRLP4 312
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+312
ADDRLP4 312
INDIRI4
ASGNI4
line 805
;805:	cgs.media.shotgunSmokePuffShader = trap_R_RegisterShader( "shotgunSmokePuff" );
ADDRGP4 $780
ARGP4
ADDRLP4 316
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+316
ADDRLP4 316
INDIRI4
ASGNI4
line 806
;806:	cgs.media.nailPuffShader = trap_R_RegisterShader( "nailtrail" );
ADDRGP4 $783
ARGP4
ADDRLP4 320
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+332
ADDRLP4 320
INDIRI4
ASGNI4
line 807
;807:	cgs.media.blueProxMine = trap_R_RegisterModel( "models/weaphits/proxmineb.md3" );
ADDRGP4 $786
ARGP4
ADDRLP4 324
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+336
ADDRLP4 324
INDIRI4
ASGNI4
line 808
;808:	cgs.media.plasmaBallShader = trap_R_RegisterShader( "sprites/plasma1" );
ADDRGP4 $789
ARGP4
ADDRLP4 328
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+320
ADDRLP4 328
INDIRI4
ASGNI4
line 809
;809:	cgs.media.bloodTrailShader = trap_R_RegisterShader( "bloodTrail" );
ADDRGP4 $792
ARGP4
ADDRLP4 332
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+328
ADDRLP4 332
INDIRI4
ASGNI4
line 810
;810:	cgs.media.lagometerShader = trap_R_RegisterShader("lagometer" );
ADDRGP4 $795
ARGP4
ADDRLP4 336
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+296
ADDRLP4 336
INDIRI4
ASGNI4
line 811
;811:	cgs.media.connectionShader = trap_R_RegisterShader( "disconnected" );
ADDRGP4 $798
ARGP4
ADDRLP4 340
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+240
ADDRLP4 340
INDIRI4
ASGNI4
line 813
;812:
;813:	cgs.media.waterBubbleShader = trap_R_RegisterShader( "waterBubble" );
ADDRGP4 $801
ARGP4
ADDRLP4 344
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+324
ADDRLP4 344
INDIRI4
ASGNI4
line 815
;814:
;815:	cgs.media.tracerShader = trap_R_RegisterShader( "gfx/misc/tracer" );
ADDRGP4 $804
ARGP4
ADDRLP4 348
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+252
ADDRLP4 348
INDIRI4
ASGNI4
line 816
;816:	cgs.media.selectShader = trap_R_RegisterShader( "gfx/2d/select" );
ADDRGP4 $807
ARGP4
ADDRLP4 352
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+244
ADDRLP4 352
INDIRI4
ASGNI4
line 818
;817:
;818:	for ( i = 0 ; i < NUM_CROSSHAIRS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $808
line 819
;819:		cgs.media.crosshairShader[i] = trap_R_RegisterShader( va("gfx/2d/crosshair%c", 'a'+i) );
ADDRGP4 $814
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 97
ADDI4
ARGI4
ADDRLP4 360
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 360
INDIRP4
ARGP4
ADDRLP4 364
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+256
ADDP4
ADDRLP4 364
INDIRI4
ASGNI4
line 820
;820:	}
LABELV $809
line 818
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $808
line 822
;821:
;822:	cgs.media.backTileShader = trap_R_RegisterShader( "gfx/2d/backtile" );
ADDRGP4 $817
ARGP4
ADDRLP4 356
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+300
ADDRLP4 356
INDIRI4
ASGNI4
line 823
;823:	cgs.media.noammoShader = trap_R_RegisterShader( "icons/noammo" );
ADDRGP4 $820
ARGP4
ADDRLP4 360
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+304
ADDRLP4 360
INDIRI4
ASGNI4
line 826
;824:
;825:	// powerup shaders
;826:	cgs.media.quadShader = trap_R_RegisterShader("powerups/quad" );
ADDRGP4 $823
ARGP4
ADDRLP4 364
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+432
ADDRLP4 364
INDIRI4
ASGNI4
line 827
;827:	cgs.media.quadWeaponShader = trap_R_RegisterShader("powerups/quadWeapon" );
ADDRGP4 $826
ARGP4
ADDRLP4 368
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+440
ADDRLP4 368
INDIRI4
ASGNI4
line 828
;828:	cgs.media.battleSuitShader = trap_R_RegisterShader("powerups/battleSuit" );
ADDRGP4 $829
ARGP4
ADDRLP4 372
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+452
ADDRLP4 372
INDIRI4
ASGNI4
line 829
;829:	cgs.media.battleWeaponShader = trap_R_RegisterShader("powerups/battleWeapon" );
ADDRGP4 $832
ARGP4
ADDRLP4 376
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+456
ADDRLP4 376
INDIRI4
ASGNI4
line 830
;830:	cgs.media.invisShader = trap_R_RegisterShader("powerups/invisibility" );
ADDRGP4 $835
ARGP4
ADDRLP4 380
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+444
ADDRLP4 380
INDIRI4
ASGNI4
line 831
;831:	cgs.media.regenShader = trap_R_RegisterShader("powerups/regen" );
ADDRGP4 $838
ARGP4
ADDRLP4 384
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+448
ADDRLP4 384
INDIRI4
ASGNI4
line 832
;832:	cgs.media.hastePuffShader = trap_R_RegisterShader("hasteSmokePuff" );
ADDRGP4 $841
ARGP4
ADDRLP4 388
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+460
ADDRLP4 388
INDIRI4
ASGNI4
line 834
;833:
;834:	if ( cgs.gametype == GT_CTF || cgs.gametype == GT_ONEFLAG || cgs.gametype == GT_HARVESTER || cg_buildScript.integer ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 4
EQI4 $850
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 5
EQI4 $850
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 7
EQI4 $850
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $842
LABELV $850
line 835
;835:		cgs.media.redCubeModel = trap_R_RegisterModel( "models/powerups/orb/r_orb.md3" );
ADDRGP4 $853
ARGP4
ADDRLP4 392
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+20
ADDRLP4 392
INDIRI4
ASGNI4
line 836
;836:		cgs.media.blueCubeModel = trap_R_RegisterModel( "models/powerups/orb/b_orb.md3" );
ADDRGP4 $856
ARGP4
ADDRLP4 396
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+24
ADDRLP4 396
INDIRI4
ASGNI4
line 837
;837:		cgs.media.redCubeIcon = trap_R_RegisterShader( "icons/skull_red" );
ADDRGP4 $859
ARGP4
ADDRLP4 400
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+28
ADDRLP4 400
INDIRI4
ASGNI4
line 838
;838:		cgs.media.blueCubeIcon = trap_R_RegisterShader( "icons/skull_blue" );
ADDRGP4 $862
ARGP4
ADDRLP4 404
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+32
ADDRLP4 404
INDIRI4
ASGNI4
line 839
;839:	}
LABELV $842
line 841
;840:
;841:	if ( cgs.gametype == GT_CTF || cgs.gametype == GT_ONEFLAG || cgs.gametype == GT_HARVESTER || cg_buildScript.integer ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 4
EQI4 $871
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 5
EQI4 $871
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 7
EQI4 $871
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $863
LABELV $871
line 842
;842:		cgs.media.redFlagModel = trap_R_RegisterModel( "models/flags/r_flag.md3" );
ADDRGP4 $874
ARGP4
ADDRLP4 392
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+36
ADDRLP4 392
INDIRI4
ASGNI4
line 843
;843:		cgs.media.blueFlagModel = trap_R_RegisterModel( "models/flags/b_flag.md3" );
ADDRGP4 $877
ARGP4
ADDRLP4 396
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+40
ADDRLP4 396
INDIRI4
ASGNI4
line 844
;844:		cgs.media.redFlagShader[0] = trap_R_RegisterShaderNoMip( "icons/iconf_red1" );
ADDRGP4 $880
ARGP4
ADDRLP4 400
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+48
ADDRLP4 400
INDIRI4
ASGNI4
line 845
;845:		cgs.media.redFlagShader[1] = trap_R_RegisterShaderNoMip( "icons/iconf_red2" );
ADDRGP4 $884
ARGP4
ADDRLP4 404
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+48+4
ADDRLP4 404
INDIRI4
ASGNI4
line 846
;846:		cgs.media.redFlagShader[2] = trap_R_RegisterShaderNoMip( "icons/iconf_red3" );
ADDRGP4 $888
ARGP4
ADDRLP4 408
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+48+8
ADDRLP4 408
INDIRI4
ASGNI4
line 847
;847:		cgs.media.blueFlagShader[0] = trap_R_RegisterShaderNoMip( "icons/iconf_blu1" );
ADDRGP4 $891
ARGP4
ADDRLP4 412
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+60
ADDRLP4 412
INDIRI4
ASGNI4
line 848
;848:		cgs.media.blueFlagShader[1] = trap_R_RegisterShaderNoMip( "icons/iconf_blu2" );
ADDRGP4 $895
ARGP4
ADDRLP4 416
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+60+4
ADDRLP4 416
INDIRI4
ASGNI4
line 849
;849:		cgs.media.blueFlagShader[2] = trap_R_RegisterShaderNoMip( "icons/iconf_blu3" );
ADDRGP4 $899
ARGP4
ADDRLP4 420
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+60+8
ADDRLP4 420
INDIRI4
ASGNI4
line 851
;850:
;851:		cgs.media.flagPoleModel = trap_R_RegisterModel( "models/flag2/flagpole.md3" );
ADDRGP4 $902
ARGP4
ADDRLP4 424
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+88
ADDRLP4 424
INDIRI4
ASGNI4
line 852
;852:		cgs.media.flagFlapModel = trap_R_RegisterModel( "models/flag2/flagflap3.md3" );
ADDRGP4 $905
ARGP4
ADDRLP4 428
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+92
ADDRLP4 428
INDIRI4
ASGNI4
line 854
;853:
;854:		cgs.media.redFlagFlapSkin = trap_R_RegisterSkin( "models/flag2/red.skin" );
ADDRGP4 $908
ARGP4
ADDRLP4 432
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRGP4 cgs+148692+96
ADDRLP4 432
INDIRI4
ASGNI4
line 855
;855:		cgs.media.blueFlagFlapSkin = trap_R_RegisterSkin( "models/flag2/blue.skin" );
ADDRGP4 $911
ARGP4
ADDRLP4 436
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRGP4 cgs+148692+100
ADDRLP4 436
INDIRI4
ASGNI4
line 856
;856:		cgs.media.neutralFlagFlapSkin = trap_R_RegisterSkin( "models/flag2/white.skin" );
ADDRGP4 $914
ARGP4
ADDRLP4 440
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRGP4 cgs+148692+104
ADDRLP4 440
INDIRI4
ASGNI4
line 857
;857:		cgs.media.redFlagBaseModel = trap_R_RegisterModel( "models/mapobjects/flagbase/red_base.md3" );
ADDRGP4 $917
ARGP4
ADDRLP4 444
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+108
ADDRLP4 444
INDIRI4
ASGNI4
line 858
;858:		cgs.media.blueFlagBaseModel = trap_R_RegisterModel( "models/mapobjects/flagbase/blue_base.md3" );
ADDRGP4 $920
ARGP4
ADDRLP4 448
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+112
ADDRLP4 448
INDIRI4
ASGNI4
line 859
;859:		cgs.media.neutralFlagBaseModel = trap_R_RegisterModel( "models/mapobjects/flagbase/ntrl_base.md3" );
ADDRGP4 $923
ARGP4
ADDRLP4 452
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+116
ADDRLP4 452
INDIRI4
ASGNI4
line 860
;860:	}
LABELV $863
line 862
;861:
;862:	if ( cgs.gametype == GT_ONEFLAG || cg_buildScript.integer ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 5
EQI4 $928
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $924
LABELV $928
line 863
;863:		cgs.media.neutralFlagModel = trap_R_RegisterModel( "models/flags/n_flag.md3" );
ADDRGP4 $931
ARGP4
ADDRLP4 392
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+44
ADDRLP4 392
INDIRI4
ASGNI4
line 864
;864:		cgs.media.flagShader[0] = trap_R_RegisterShaderNoMip( "icons/iconf_neutral1" );
ADDRGP4 $934
ARGP4
ADDRLP4 396
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+72
ADDRLP4 396
INDIRI4
ASGNI4
line 865
;865:		cgs.media.flagShader[1] = trap_R_RegisterShaderNoMip( "icons/iconf_red2" );
ADDRGP4 $884
ARGP4
ADDRLP4 400
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+72+4
ADDRLP4 400
INDIRI4
ASGNI4
line 866
;866:		cgs.media.flagShader[2] = trap_R_RegisterShaderNoMip( "icons/iconf_blu2" );
ADDRGP4 $895
ARGP4
ADDRLP4 404
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+72+8
ADDRLP4 404
INDIRI4
ASGNI4
line 867
;867:		cgs.media.flagShader[3] = trap_R_RegisterShaderNoMip( "icons/iconf_neutral3" );
ADDRGP4 $944
ARGP4
ADDRLP4 408
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+72+12
ADDRLP4 408
INDIRI4
ASGNI4
line 868
;868:	}
LABELV $924
line 870
;869:
;870:	if ( cgs.gametype == GT_OVERLOAD || cg_buildScript.integer ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 6
EQI4 $949
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $945
LABELV $949
line 871
;871:		cgs.media.overloadBaseModel = trap_R_RegisterModel( "models/powerups/overload_base.md3" );
ADDRGP4 $952
ARGP4
ADDRLP4 392
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+120
ADDRLP4 392
INDIRI4
ASGNI4
line 872
;872:		cgs.media.overloadTargetModel = trap_R_RegisterModel( "models/powerups/overload_target.md3" );
ADDRGP4 $955
ARGP4
ADDRLP4 396
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+124
ADDRLP4 396
INDIRI4
ASGNI4
line 873
;873:		cgs.media.overloadLightsModel = trap_R_RegisterModel( "models/powerups/overload_lights.md3" );
ADDRGP4 $958
ARGP4
ADDRLP4 400
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+128
ADDRLP4 400
INDIRI4
ASGNI4
line 874
;874:		cgs.media.overloadEnergyModel = trap_R_RegisterModel( "models/powerups/overload_energy.md3" );
ADDRGP4 $961
ARGP4
ADDRLP4 404
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+132
ADDRLP4 404
INDIRI4
ASGNI4
line 875
;875:	}
LABELV $945
line 877
;876:
;877:	if ( cgs.gametype == GT_HARVESTER || cg_buildScript.integer ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 7
EQI4 $966
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $962
LABELV $966
line 878
;878:		cgs.media.harvesterModel = trap_R_RegisterModel( "models/powerups/harvester/harvester.md3" );
ADDRGP4 $969
ARGP4
ADDRLP4 392
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+136
ADDRLP4 392
INDIRI4
ASGNI4
line 879
;879:		cgs.media.harvesterRedSkin = trap_R_RegisterSkin( "models/powerups/harvester/red.skin" );
ADDRGP4 $972
ARGP4
ADDRLP4 396
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRGP4 cgs+148692+140
ADDRLP4 396
INDIRI4
ASGNI4
line 880
;880:		cgs.media.harvesterBlueSkin = trap_R_RegisterSkin( "models/powerups/harvester/blue.skin" );
ADDRGP4 $975
ARGP4
ADDRLP4 400
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRGP4 cgs+148692+144
ADDRLP4 400
INDIRI4
ASGNI4
line 881
;881:		cgs.media.harvesterNeutralModel = trap_R_RegisterModel( "models/powerups/obelisk/obelisk.md3" );
ADDRGP4 $978
ARGP4
ADDRLP4 404
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+148
ADDRLP4 404
INDIRI4
ASGNI4
line 882
;882:	}
LABELV $962
line 884
;883:
;884:	cgs.media.redKamikazeShader = trap_R_RegisterShader( "models/weaphits/kamikred" );
ADDRGP4 $981
ARGP4
ADDRLP4 392
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+464
ADDRLP4 392
INDIRI4
ASGNI4
line 885
;885:	cgs.media.dustPuffShader = trap_R_RegisterShader("hasteSmokePuff" );
ADDRGP4 $841
ARGP4
ADDRLP4 396
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+560
ADDRLP4 396
INDIRI4
ASGNI4
line 887
;886:
;887:	if ( cgs.gametype >= GT_TDM || cg_buildScript.integer ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
GEI4 $988
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $984
LABELV $988
line 888
;888:		cgs.media.friendShader = trap_R_RegisterShader( "sprites/foe" );
ADDRGP4 $991
ARGP4
ADDRLP4 400
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+232
ADDRLP4 400
INDIRI4
ASGNI4
line 889
;889:		cgs.media.redQuadShader = trap_R_RegisterShader("powerups/blueflag" );
ADDRGP4 $994
ARGP4
ADDRLP4 404
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+436
ADDRLP4 404
INDIRI4
ASGNI4
line 890
;890:		cgs.media.teamStatusBar = trap_R_RegisterShader( "gfx/2d/colorbar.tga" );
ADDRGP4 $997
ARGP4
ADDRLP4 408
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+160
ADDRLP4 408
INDIRI4
ASGNI4
line 891
;891:		cgs.media.blueKamikazeShader = trap_R_RegisterShader( "models/weaphits/kamikblu" );
ADDRGP4 $1000
ARGP4
ADDRLP4 412
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+468
ADDRLP4 412
INDIRI4
ASGNI4
line 892
;892:	}
LABELV $984
line 894
;893:
;894:	cgs.media.armorModel = trap_R_RegisterModel( "models/powerups/armor/armor_yel.md3" );
ADDRGP4 $1003
ARGP4
ADDRLP4 400
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+152
ADDRLP4 400
INDIRI4
ASGNI4
line 895
;895:	cgs.media.armorIcon  = trap_R_RegisterShaderNoMip( "icons/iconr_yellow" );
ADDRGP4 $1006
ARGP4
ADDRLP4 404
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+156
ADDRLP4 404
INDIRI4
ASGNI4
line 897
;896:
;897:	cgs.media.machinegunBrassModel = trap_R_RegisterModel( "models/weapons2/shells/m_shell.md3" );
ADDRGP4 $1009
ARGP4
ADDRLP4 408
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+212
ADDRLP4 408
INDIRI4
ASGNI4
line 898
;898:	cgs.media.shotgunBrassModel = trap_R_RegisterModel( "models/weapons2/shells/s_shell.md3" );
ADDRGP4 $1012
ARGP4
ADDRLP4 412
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+216
ADDRLP4 412
INDIRI4
ASGNI4
line 900
;899:
;900:	cgs.media.gibAbdomen = trap_R_RegisterModel( "models/gibs/abdomen.md3" );
ADDRGP4 $1015
ARGP4
ADDRLP4 416
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+168
ADDRLP4 416
INDIRI4
ASGNI4
line 901
;901:	cgs.media.gibArm = trap_R_RegisterModel( "models/gibs/arm.md3" );
ADDRGP4 $1018
ARGP4
ADDRLP4 420
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+172
ADDRLP4 420
INDIRI4
ASGNI4
line 902
;902:	cgs.media.gibChest = trap_R_RegisterModel( "models/gibs/chest.md3" );
ADDRGP4 $1021
ARGP4
ADDRLP4 424
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+176
ADDRLP4 424
INDIRI4
ASGNI4
line 903
;903:	cgs.media.gibFist = trap_R_RegisterModel( "models/gibs/fist.md3" );
ADDRGP4 $1024
ARGP4
ADDRLP4 428
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+180
ADDRLP4 428
INDIRI4
ASGNI4
line 904
;904:	cgs.media.gibFoot = trap_R_RegisterModel( "models/gibs/foot.md3" );
ADDRGP4 $1027
ARGP4
ADDRLP4 432
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+184
ADDRLP4 432
INDIRI4
ASGNI4
line 905
;905:	cgs.media.gibForearm = trap_R_RegisterModel( "models/gibs/forearm.md3" );
ADDRGP4 $1030
ARGP4
ADDRLP4 436
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+188
ADDRLP4 436
INDIRI4
ASGNI4
line 906
;906:	cgs.media.gibIntestine = trap_R_RegisterModel( "models/gibs/intestine.md3" );
ADDRGP4 $1033
ARGP4
ADDRLP4 440
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+192
ADDRLP4 440
INDIRI4
ASGNI4
line 907
;907:	cgs.media.gibLeg = trap_R_RegisterModel( "models/gibs/leg.md3" );
ADDRGP4 $1036
ARGP4
ADDRLP4 444
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+196
ADDRLP4 444
INDIRI4
ASGNI4
line 908
;908:	cgs.media.gibSkull = trap_R_RegisterModel( "models/gibs/skull.md3" );
ADDRGP4 $1039
ARGP4
ADDRLP4 448
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+200
ADDRLP4 448
INDIRI4
ASGNI4
line 909
;909:	cgs.media.gibBrain = trap_R_RegisterModel( "models/gibs/brain.md3" );
ADDRGP4 $1042
ARGP4
ADDRLP4 452
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+204
ADDRLP4 452
INDIRI4
ASGNI4
line 911
;910:
;911:	cgs.media.smoke2 = trap_R_RegisterModel( "models/weapons2/shells/s_shell.md3" );
ADDRGP4 $1012
ARGP4
ADDRLP4 456
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+208
ADDRLP4 456
INDIRI4
ASGNI4
line 913
;912:
;913:	cgs.media.balloonShader = trap_R_RegisterShader( "sprites/balloon3" );
ADDRGP4 $1047
ARGP4
ADDRLP4 460
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+236
ADDRLP4 460
INDIRI4
ASGNI4
line 915
;914:
;915:	cgs.media.bloodExplosionShader = trap_R_RegisterShader( "bloodExplosion" );
ADDRGP4 $1050
ARGP4
ADDRLP4 464
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+512
ADDRLP4 464
INDIRI4
ASGNI4
line 917
;916:
;917:	cgs.media.bulletFlashModel = trap_R_RegisterModel("models/weaphits/bullet.md3");
ADDRGP4 $1053
ARGP4
ADDRLP4 468
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+472
ADDRLP4 468
INDIRI4
ASGNI4
line 918
;918:	cgs.media.ringFlashModel = trap_R_RegisterModel("models/weaphits/ring02.md3");
ADDRGP4 $1056
ARGP4
ADDRLP4 472
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+476
ADDRLP4 472
INDIRI4
ASGNI4
line 919
;919:	cgs.media.dishFlashModel = trap_R_RegisterModel("models/weaphits/boom01.md3");
ADDRGP4 $1059
ARGP4
ADDRLP4 476
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+480
ADDRLP4 476
INDIRI4
ASGNI4
line 921
;920:
;921:	cgs.media.kamikazeEffectModel = trap_R_RegisterModel( "models/weaphits/kamboom2.md3" );
ADDRGP4 $1062
ARGP4
ADDRLP4 480
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+516
ADDRLP4 480
INDIRI4
ASGNI4
line 922
;922:	cgs.media.kamikazeShockWave = trap_R_RegisterModel( "models/weaphits/kamwave.md3" );
ADDRGP4 $1065
ARGP4
ADDRLP4 484
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+520
ADDRLP4 484
INDIRI4
ASGNI4
line 923
;923:	cgs.media.kamikazeHeadModel = trap_R_RegisterModel( "models/powerups/kamikazi.md3" );
ADDRGP4 $1068
ARGP4
ADDRLP4 488
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+524
ADDRLP4 488
INDIRI4
ASGNI4
line 924
;924:	cgs.media.kamikazeHeadTrail = trap_R_RegisterModel( "models/powerups/trailtest.md3" );
ADDRGP4 $1071
ARGP4
ADDRLP4 492
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+528
ADDRLP4 492
INDIRI4
ASGNI4
line 925
;925:	cgs.media.guardPowerupModel = trap_R_RegisterModel( "models/powerups/guard_player.md3" );
ADDRGP4 $1074
ARGP4
ADDRLP4 496
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+532
ADDRLP4 496
INDIRI4
ASGNI4
line 926
;926:	cgs.media.scoutPowerupModel = trap_R_RegisterModel( "models/powerups/scout_player.md3" );
ADDRGP4 $1077
ARGP4
ADDRLP4 500
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+536
ADDRLP4 500
INDIRI4
ASGNI4
line 927
;927:	cgs.media.doublerPowerupModel = trap_R_RegisterModel( "models/powerups/doubler_player.md3" );
ADDRGP4 $1080
ARGP4
ADDRLP4 504
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+540
ADDRLP4 504
INDIRI4
ASGNI4
line 928
;928:	cgs.media.ammoRegenPowerupModel = trap_R_RegisterModel( "models/powerups/ammo_player.md3" );
ADDRGP4 $1083
ARGP4
ADDRLP4 508
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+544
ADDRLP4 508
INDIRI4
ASGNI4
line 929
;929:	cgs.media.invulnerabilityImpactModel = trap_R_RegisterModel( "models/powerups/shield/impact.md3" );
ADDRGP4 $1086
ARGP4
ADDRLP4 512
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+548
ADDRLP4 512
INDIRI4
ASGNI4
line 930
;930:	cgs.media.invulnerabilityJuicedModel = trap_R_RegisterModel( "models/powerups/shield/juicer.md3" );
ADDRGP4 $1089
ARGP4
ADDRLP4 516
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+552
ADDRLP4 516
INDIRI4
ASGNI4
line 931
;931:	cgs.media.medkitUsageModel = trap_R_RegisterModel( "models/powerups/regen.md3" );
ADDRGP4 $1092
ARGP4
ADDRLP4 520
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+556
ADDRLP4 520
INDIRI4
ASGNI4
line 932
;932:	cgs.media.invulnerabilityPowerupModel = trap_R_RegisterModel( "models/powerups/shield/shield.md3" );
ADDRGP4 $1095
ARGP4
ADDRLP4 524
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+564
ADDRLP4 524
INDIRI4
ASGNI4
line 934
;933:
;934:	cgs.media.medalImpressive = trap_R_RegisterShaderNoMip( "medal_impressive" );
ADDRGP4 $1098
ARGP4
ADDRLP4 528
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+584
ADDRLP4 528
INDIRI4
ASGNI4
line 935
;935:	cgs.media.medalExcellent = trap_R_RegisterShaderNoMip( "medal_excellent" );
ADDRGP4 $1101
ARGP4
ADDRLP4 532
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+588
ADDRLP4 532
INDIRI4
ASGNI4
line 936
;936:	cgs.media.medalGauntlet = trap_R_RegisterShaderNoMip( "medal_gauntlet" );
ADDRGP4 $1104
ARGP4
ADDRLP4 536
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+592
ADDRLP4 536
INDIRI4
ASGNI4
line 937
;937:	cgs.media.medalDefend = trap_R_RegisterShaderNoMip( "medal_defend" );
ADDRGP4 $1107
ARGP4
ADDRLP4 540
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+596
ADDRLP4 540
INDIRI4
ASGNI4
line 938
;938:	cgs.media.medalAssist = trap_R_RegisterShaderNoMip( "medal_assist" );
ADDRGP4 $1110
ARGP4
ADDRLP4 544
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+600
ADDRLP4 544
INDIRI4
ASGNI4
line 939
;939:	cgs.media.medalCapture = trap_R_RegisterShaderNoMip( "medal_capture" );
ADDRGP4 $1113
ARGP4
ADDRLP4 548
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+604
ADDRLP4 548
INDIRI4
ASGNI4
line 942
;940:
;941:
;942:	memset( cg_items, 0, sizeof( cg_items ) );
ADDRGP4 cg_items
ARGP4
CNSTI4 0
ARGI4
CNSTI4 7168
ARGI4
ADDRGP4 memset
CALLP4
pop
line 943
;943:	memset( cg_weapons, 0, sizeof( cg_weapons ) );
ADDRGP4 cg_weapons
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2176
ARGI4
ADDRGP4 memset
CALLP4
pop
line 946
;944:
;945:	// only register the items that the server says we need
;946:	Q_strncpyz( items, CG_ConfigString(CS_ITEMS), sizeof( items ) );
CNSTI4 27
ARGI4
ADDRLP4 552
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 552
INDIRP4
ARGP4
CNSTI4 257
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 948
;947:
;948:	for ( i = 1 ; i < bg_numItems ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $1117
JUMPV
LABELV $1114
line 949
;949:		if ( items[ i ] == '1' || cg_buildScript.integer ) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 49
EQI4 $1121
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $1118
LABELV $1121
line 950
;950:			CG_LoadingItem( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_LoadingItem
CALLV
pop
line 951
;951:			CG_RegisterItemVisuals( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemVisuals
CALLV
pop
line 952
;952:		}
LABELV $1118
line 953
;953:	}
LABELV $1115
line 948
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1117
ADDRLP4 0
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $1114
line 955
;954:
;955:	cg.skipDFshaders = qfalse;
ADDRGP4 cg+157024
CNSTI4 0
ASGNI4
line 958
;956:
;957:	// wall marks
;958:	cgs.media.bulletMarkShader = trap_R_RegisterShader( "gfx/damage/bullet_mrk" );
ADDRGP4 $1125
ARGP4
ADDRLP4 556
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+416
ADDRLP4 556
INDIRI4
ASGNI4
line 959
;959:	cgs.media.burnMarkShader = trap_R_RegisterShader( "gfx/damage/burn_med_mrk" );
ADDRGP4 $1128
ARGP4
ADDRLP4 560
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+420
ADDRLP4 560
INDIRI4
ASGNI4
line 960
;960:	cgs.media.holeMarkShader = trap_R_RegisterShader( "gfx/damage/hole_lg_mrk" );
ADDRGP4 $1131
ARGP4
ADDRLP4 564
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+424
ADDRLP4 564
INDIRI4
ASGNI4
line 961
;961:	cgs.media.energyMarkShader = trap_R_RegisterShader( "gfx/damage/plasma_mrk" );
ADDRGP4 $1134
ARGP4
ADDRLP4 568
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+428
ADDRLP4 568
INDIRI4
ASGNI4
line 962
;962:	cgs.media.shadowMarkShader = trap_R_RegisterShader( "markShadow" );
ADDRGP4 $1137
ARGP4
ADDRLP4 572
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+384
ADDRLP4 572
INDIRI4
ASGNI4
line 963
;963:	cgs.media.wakeMarkShader = trap_R_RegisterShader( "wake" );
ADDRGP4 $1140
ARGP4
ADDRLP4 576
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+408
ADDRLP4 576
INDIRI4
ASGNI4
line 964
;964:	cgs.media.bloodMarkShader = trap_R_RegisterShader( "bloodMark" );
ADDRGP4 $1143
ARGP4
ADDRLP4 580
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+412
ADDRLP4 580
INDIRI4
ASGNI4
line 967
;965:
;966:	// register the inline models
;967:	cgs.numInlineModels = trap_CM_NumInlineModels();
ADDRLP4 584
ADDRGP4 trap_CM_NumInlineModels
CALLI4
ASGNI4
ADDRGP4 cgs+36896
ADDRLP4 584
INDIRI4
ASGNI4
line 968
;968:	for ( i = 1 ; i < cgs.numInlineModels ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $1148
JUMPV
LABELV $1145
line 973
;969:		char	name[10];
;970:		vec3_t			mins, maxs;
;971:		int				j;
;972:
;973:		Com_sprintf( name, sizeof(name), "*%i", i );
ADDRLP4 616
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 $1150
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 974
;974:		cgs.inlineDrawModel[i] = trap_R_RegisterModel( name );
ADDRLP4 616
ARGP4
ADDRLP4 628
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+36900
ADDP4
ADDRLP4 628
INDIRI4
ASGNI4
line 975
;975:		trap_R_ModelBounds( cgs.inlineDrawModel[i], mins, maxs );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+36900
ADDP4
INDIRI4
ARGI4
ADDRLP4 592
ARGP4
ADDRLP4 604
ARGP4
ADDRGP4 trap_R_ModelBounds
CALLV
pop
line 976
;976:		for ( j = 0 ; j < 3 ; j++ ) {
ADDRLP4 588
CNSTI4 0
ASGNI4
LABELV $1153
line 977
;977:			cgs.inlineModelMidpoints[i][j] = mins[j] + 0.5 * ( maxs[j] - mins[j] );
ADDRLP4 588
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRI4
CNSTI4 12
MULI4
ADDRGP4 cgs+37924
ADDP4
ADDP4
ADDRLP4 588
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 592
ADDP4
INDIRF4
ADDRLP4 588
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 604
ADDP4
INDIRF4
ADDRLP4 588
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 592
ADDP4
INDIRF4
SUBF4
CNSTF4 1056964608
MULF4
ADDF4
ASGNF4
line 978
;978:		}
LABELV $1154
line 976
ADDRLP4 588
ADDRLP4 588
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 588
INDIRI4
CNSTI4 3
LTI4 $1153
line 979
;979:	}
LABELV $1146
line 968
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1148
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+36896
INDIRI4
LTI4 $1145
line 982
;980:
;981:	// register all the server specified models
;982:	for (i=1 ; i<MAX_MODELS ; i++) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $1158
line 985
;983:		const char		*modelName;
;984:
;985:		modelName = CG_ConfigString( CS_MODELS+i );
ADDRLP4 0
INDIRI4
CNSTI4 32
ADDI4
ARGI4
ADDRLP4 592
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 588
ADDRLP4 592
INDIRP4
ASGNP4
line 986
;986:		if ( !modelName[0] ) {
ADDRLP4 588
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1162
line 987
;987:			break;
ADDRGP4 $1160
JUMPV
LABELV $1162
line 989
;988:		}
;989:		cgs.gameModels[i] = trap_R_RegisterModel( modelName );
ADDRLP4 588
INDIRP4
ARGP4
ADDRLP4 596
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+34848
ADDP4
ADDRLP4 596
INDIRI4
ASGNI4
line 990
;990:	}
LABELV $1159
line 982
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $1158
LABELV $1160
line 992
;991:	
;992:	cgs.media.cursor = trap_R_RegisterShaderNoMip( "menu/art/3_cursor2" );
ADDRGP4 $1167
ARGP4
ADDRLP4 588
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1156
ADDRLP4 588
INDIRI4
ASGNI4
line 993
;993:	cgs.media.flagShaders[0] = trap_R_RegisterShaderNoMip("ui/assets/statusbar/flag_in_base.tga");
ADDRGP4 $1170
ARGP4
ADDRLP4 592
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1124
ADDRLP4 592
INDIRI4
ASGNI4
line 994
;994:	cgs.media.flagShaders[1] = trap_R_RegisterShaderNoMip("ui/assets/statusbar/flag_capture.tga");
ADDRGP4 $1174
ARGP4
ADDRLP4 596
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1124+4
ADDRLP4 596
INDIRI4
ASGNI4
line 995
;995:	cgs.media.flagShaders[2] = trap_R_RegisterShaderNoMip("ui/assets/statusbar/flag_missing.tga");
ADDRGP4 $1178
ARGP4
ADDRLP4 600
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+1124+8
ADDRLP4 600
INDIRI4
ASGNI4
line 997
;996:
;997:	CG_ClearParticles ();
ADDRGP4 CG_ClearParticles
CALLV
pop
line 998
;998:}
LABELV $711
endproc CG_RegisterGraphics 636 16
export CG_BuildSpectatorString
proc CG_BuildSpectatorString 12 12
line 1008
;999:
;1000:
;1001:
;1002:/*																																			
;1003:=======================
;1004:CG_BuildSpectatorString
;1005:
;1006:=======================
;1007:*/
;1008:void CG_BuildSpectatorString( void ) {
line 1010
;1009:	int i;
;1010:	cg.spectatorList[0] = 0;
ADDRGP4 cg+115436
CNSTI1 0
ASGNI1
line 1011
;1011:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1181
line 1012
;1012:		if (cgs.clientinfo[i].infoValid && cgs.clientinfo[i].team == TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1185
ADDRLP4 0
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996+36
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1185
line 1013
;1013:			Q_strcat(cg.spectatorList, sizeof(cg.spectatorList), va("%s     ", cgs.clientinfo[i].name));
ADDRGP4 $1192
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996+4
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 cg+115436
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 1014
;1014:		}
LABELV $1185
line 1015
;1015:	}
LABELV $1182
line 1011
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $1181
line 1016
;1016:	i = strlen(cg.spectatorList);
ADDRGP4 cg+115436
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1017
;1017:	if (i != cg.spectatorLen) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+116460
INDIRI4
EQI4 $1196
line 1018
;1018:		cg.spectatorLen = i;
ADDRGP4 cg+116460
ADDRLP4 0
INDIRI4
ASGNI4
line 1019
;1019:		cg.spectatorWidth = -1;
ADDRGP4 cg+116464
CNSTF4 3212836864
ASGNF4
line 1020
;1020:	}
LABELV $1196
line 1021
;1021:}
LABELV $1179
endproc CG_BuildSpectatorString 12 12
proc CG_RegisterClients 12 4
line 1029
;1022:
;1023:
;1024:/*																																			
;1025:===================
;1026:CG_RegisterClients
;1027:===================
;1028:*/
;1029:static void CG_RegisterClients( void ) {
line 1032
;1030:	int		i;
;1031:
;1032:	CG_LoadingClient(cg.clientNum);
ADDRGP4 cg+4
INDIRI4
ARGI4
ADDRGP4 CG_LoadingClient
CALLV
pop
line 1033
;1033:	CG_NewClientInfo(cg.clientNum);
ADDRGP4 cg+4
INDIRI4
ARGI4
ADDRGP4 CG_NewClientInfo
CALLV
pop
line 1035
;1034:
;1035:	for (i=0 ; i<MAX_CLIENTS ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1204
line 1038
;1036:		const char		*clientInfo;
;1037:
;1038:		if (cg.clientNum == i) {
ADDRGP4 cg+4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1208
line 1039
;1039:			continue;
ADDRGP4 $1205
JUMPV
LABELV $1208
line 1042
;1040:		}
;1041:
;1042:		clientInfo = CG_ConfigString( CS_PLAYERS+i );
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 8
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 1043
;1043:		if ( !clientInfo[0]) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1211
line 1044
;1044:			continue;
ADDRGP4 $1205
JUMPV
LABELV $1211
line 1046
;1045:		}
;1046:		CG_LoadingClient( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_LoadingClient
CALLV
pop
line 1047
;1047:		CG_NewClientInfo( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_NewClientInfo
CALLV
pop
line 1048
;1048:	}
LABELV $1205
line 1035
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $1204
line 1049
;1049:	CG_BuildSpectatorString();
ADDRGP4 CG_BuildSpectatorString
CALLV
pop
line 1050
;1050:}
LABELV $1201
endproc CG_RegisterClients 12 4
export CG_ConfigString
proc CG_ConfigString 4 8
line 1059
;1051:
;1052://===========================================================================
;1053:
;1054:/*
;1055:=================
;1056:CG_ConfigString
;1057:=================
;1058:*/
;1059:const char *CG_ConfigString( int index ) {
line 1060
;1060:	if ( index < 0 || index >= MAX_CONFIGSTRINGS ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1216
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $1214
LABELV $1216
line 1061
;1061:		CG_Error( "CG_ConfigString: bad index: %i", index );
ADDRGP4 $1217
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 1062
;1062:		return "";
ADDRGP4 $182
RETP4
ADDRGP4 $1213
JUMPV
LABELV $1214
line 1064
;1063:	}
;1064:	return cgs.gameState.stringData + cgs.gameState.stringOffsets[ index ];
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs
ADDP4
INDIRI4
ADDRGP4 cgs+4096
ADDP4
RETP4
LABELV $1213
endproc CG_ConfigString 4 8
export CG_StartMusic
proc CG_StartMusic 144 12
line 1075
;1065:}
;1066:
;1067://==================================================================
;1068:
;1069:/*
;1070:======================
;1071:CG_StartMusic
;1072:
;1073:======================
;1074:*/
;1075:void CG_StartMusic( void ) {
line 1080
;1076:	char	*s;
;1077:	char	parm1[MAX_QPATH], parm2[MAX_QPATH];
;1078:
;1079:	// start the background music
;1080:	s = (char *)CG_ConfigString( CS_MUSIC );
CNSTI4 2
ARGI4
ADDRLP4 132
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 132
INDIRP4
ASGNP4
line 1081
;1081:	Q_strncpyz( parm1, COM_Parse( &s ), sizeof( parm1 ) );
ADDRLP4 0
ARGP4
ADDRLP4 136
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 136
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1082
;1082:	Q_strncpyz( parm2, COM_Parse( &s ), sizeof( parm2 ) );
ADDRLP4 0
ARGP4
ADDRLP4 140
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 68
ARGP4
ADDRLP4 140
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1084
;1083:
;1084:	trap_S_StartBackgroundTrack( parm1, parm2 );
ADDRLP4 4
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 trap_S_StartBackgroundTrack
CALLV
pop
line 1085
;1085:}
LABELV $1219
endproc CG_StartMusic 144 12
export CG_Init
proc CG_Init 312 12
line 1096
;1086:
;1087:
;1088:/*
;1089:=================
;1090:CG_Init
;1091:
;1092:Called after every level change or subsystem restart
;1093:Will perform callbacks to make the loading info screen update.
;1094:=================
;1095:*/
;1096:void CG_Init( int serverMessageNum, int serverCommandSequence, int clientNum ) {
line 1101
;1097:	char  value[MAX_CVAR_VALUE_STRING];
;1098:	const char	*s;
;1099:
;1100:	// clear everything
;1101:	memset( &cgs, 0, sizeof( cgs ) );
ADDRGP4 cgs
ARGP4
CNSTI4 0
ARGI4
CNSTI4 149936
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1102
;1102:	memset( &cg, 0, sizeof( cg ) );
ADDRGP4 cg
ARGP4
CNSTI4 0
ARGI4
CNSTI4 157028
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1103
;1103:	memset( cg_entities, 0, sizeof(cg_entities) );
ADDRGP4 cg_entities
ARGP4
CNSTI4 0
ARGI4
CNSTI4 757760
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1104
;1104:	memset( cg_weapons, 0, sizeof(cg_weapons) );
ADDRGP4 cg_weapons
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2176
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1105
;1105:	memset( cg_items, 0, sizeof(cg_items) );
ADDRGP4 cg_items
ARGP4
CNSTI4 0
ARGI4
CNSTI4 7168
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1107
;1106:
;1107:	cg.clientNum = clientNum;
ADDRGP4 cg+4
ADDRFP4 8
INDIRI4
ASGNI4
line 1109
;1108:
;1109:	cgs.processedSnapshotNum = serverMessageNum;
ADDRGP4 cgs+31472
ADDRFP4 0
INDIRI4
ASGNI4
line 1110
;1110:	cgs.serverCommandSequence = serverCommandSequence;
ADDRGP4 cgs+31468
ADDRFP4 4
INDIRI4
ASGNI4
line 1112
;1111:
;1112:	trap_Cvar_VariableStringBuffer( "//trap_GetValue", value, sizeof( value ) );
ADDRGP4 $1224
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1113
;1113:	if ( value[0] ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1225
line 1115
;1114:#ifdef Q3_VM
;1115:		trap_GetValue = (void*)~atoi( value );
ADDRLP4 0
ARGP4
ADDRLP4 260
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 trap_GetValue
ADDRLP4 260
INDIRI4
BCOMI4
CVIU4 4
CVUP4 4
ASGNP4
line 1116
;1116:		if ( trap_GetValue( value, sizeof( value ), "trap_R_AddRefEntityToScene2" ) ) {
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $1229
ARGP4
ADDRLP4 264
ADDRGP4 trap_GetValue
INDIRP4
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
EQI4 $1227
line 1117
;1117:			trap_R_AddRefEntityToScene2 = (void*)~atoi( value );
ADDRLP4 0
ARGP4
ADDRLP4 268
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 trap_R_AddRefEntityToScene2
ADDRLP4 268
INDIRI4
BCOMI4
CVIU4 4
CVUP4 4
ASGNP4
line 1118
;1118:			intShaderTime = qtrue;
ADDRGP4 intShaderTime
CNSTI4 1
ASGNI4
line 1119
;1119:		}
LABELV $1227
line 1120
;1120:		if ( trap_GetValue( value, sizeof( value ), "trap_R_AddLinearLightToScene_Q3E" ) ) {
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $1232
ARGP4
ADDRLP4 268
ADDRGP4 trap_GetValue
INDIRP4
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
EQI4 $1230
line 1121
;1121:			trap_R_AddLinearLightToScene = (void*)~atoi( value );
ADDRLP4 0
ARGP4
ADDRLP4 272
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 trap_R_AddLinearLightToScene
ADDRLP4 272
INDIRI4
BCOMI4
CVIU4 4
CVUP4 4
ASGNP4
line 1122
;1122:			linearLight = qtrue;
ADDRGP4 linearLight
CNSTI4 1
ASGNI4
line 1123
;1123:		}
LABELV $1230
line 1135
;1124:#else
;1125:		dll_com_trapGetValue = atoi( value );
;1126:		if ( trap_GetValue( value, sizeof( value ), "trap_R_AddRefEntityToScene2" ) ) {
;1127:			dll_trap_R_AddRefEntityToScene2 = atoi( value );
;1128:			intShaderTime = qtrue;
;1129:		}
;1130:		if ( trap_GetValue( value, sizeof( value ), "trap_R_AddLinearLightToScene_Q3E" ) ) {
;1131:			dll_trap_R_AddLinearLightToScene = atoi( value );
;1132:			linearLight = qtrue;
;1133:		}
;1134:#endif
;1135:	}
LABELV $1225
line 1138
;1136:
;1137:	// load a few needed things before we do any screen updates
;1138:	cgs.media.charsetShader		= trap_R_RegisterShader( "gfx/2d/bigchars" );
ADDRGP4 $1234
ARGP4
ADDRLP4 260
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692
ADDRLP4 260
INDIRI4
ASGNI4
line 1139
;1139:	cgs.media.whiteShader		= trap_R_RegisterShader( "white" );
ADDRGP4 $1237
ARGP4
ADDRLP4 264
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+16
ADDRLP4 264
INDIRI4
ASGNI4
line 1140
;1140:	cgs.media.charsetProp		= trap_R_RegisterShaderNoMip( "menu/art/font1_prop.tga" );
ADDRGP4 $1240
ARGP4
ADDRLP4 268
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+4
ADDRLP4 268
INDIRI4
ASGNI4
line 1141
;1141:	cgs.media.charsetPropGlow	= trap_R_RegisterShaderNoMip( "menu/art/font1_prop_glo.tga" );
ADDRGP4 $1243
ARGP4
ADDRLP4 272
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+8
ADDRLP4 272
INDIRI4
ASGNI4
line 1142
;1142:	cgs.media.charsetPropB		= trap_R_RegisterShaderNoMip( "menu/art/font2_prop.tga" );
ADDRGP4 $1246
ARGP4
ADDRLP4 276
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+12
ADDRLP4 276
INDIRI4
ASGNI4
line 1144
;1143:
;1144:	CG_RegisterCvars();
ADDRGP4 CG_RegisterCvars
CALLV
pop
line 1146
;1145:
;1146:	CG_InitConsoleCommands();
ADDRGP4 CG_InitConsoleCommands
CALLV
pop
line 1148
;1147:
;1148:	cg.weaponSelect = WP_MACHINEGUN;
ADDRGP4 cg+108956
CNSTI4 2
ASGNI4
line 1150
;1149:
;1150:	cgs.redflag = cgs.blueflag = -1; // For compatibily, default to unset for
ADDRLP4 280
CNSTI4 -1
ASGNI4
ADDRGP4 cgs+34836
ADDRLP4 280
INDIRI4
ASGNI4
ADDRGP4 cgs+34832
ADDRLP4 280
INDIRI4
ASGNI4
line 1151
;1151:	cgs.flagStatus = -1;
ADDRGP4 cgs+34840
CNSTI4 -1
ASGNI4
line 1155
;1152:	// old servers
;1153:
;1154:	// get the rendering configuration from the client system
;1155:	trap_GetGlconfig( &cgs.glconfig );
ADDRGP4 cgs+20100
ARGP4
ADDRGP4 trap_GetGlconfig
CALLV
pop
line 1157
;1156:
;1157:	cgs.screenXBias = 0.0;
ADDRGP4 cgs+31444
CNSTF4 0
ASGNF4
line 1158
;1158:	cgs.screenYBias = 0.0;
ADDRGP4 cgs+31448
CNSTF4 0
ASGNF4
line 1160
;1159:	
;1160:	if ( cgs.glconfig.vidWidth * 480 > cgs.glconfig.vidHeight * 640 ) {
ADDRGP4 cgs+20100+11304
INDIRI4
CNSTI4 480
MULI4
ADDRGP4 cgs+20100+11308
INDIRI4
CNSTI4 640
MULI4
LEI4 $1254
line 1162
;1161:		// wide screen, scale by height
;1162:		cgs.screenXScale = cgs.screenYScale = cgs.glconfig.vidHeight * (1.0/480.0);
ADDRLP4 284
ADDRGP4 cgs+20100+11308
INDIRI4
CVIF4 4
CNSTF4 990414985
MULF4
ASGNF4
ADDRGP4 cgs+31436
ADDRLP4 284
INDIRF4
ASGNF4
ADDRGP4 cgs+31432
ADDRLP4 284
INDIRF4
ASGNF4
line 1163
;1163:		cgs.screenXBias = 0.5 * ( cgs.glconfig.vidWidth - ( cgs.glconfig.vidHeight * (640.0/480.0) ) );
ADDRGP4 cgs+31444
ADDRGP4 cgs+20100+11304
INDIRI4
CVIF4 4
ADDRGP4 cgs+20100+11308
INDIRI4
CVIF4 4
CNSTF4 1068149419
MULF4
SUBF4
CNSTF4 1056964608
MULF4
ASGNF4
line 1164
;1164:	}
ADDRGP4 $1255
JUMPV
LABELV $1254
line 1165
;1165:	else {
line 1167
;1166:		// no wide screen, scale by width
;1167:		cgs.screenXScale = cgs.screenYScale = cgs.glconfig.vidWidth * (1.0/640.0);
ADDRLP4 284
ADDRGP4 cgs+20100+11304
INDIRI4
CVIF4 4
CNSTF4 986500301
MULF4
ASGNF4
ADDRGP4 cgs+31436
ADDRLP4 284
INDIRF4
ASGNF4
ADDRGP4 cgs+31432
ADDRLP4 284
INDIRF4
ASGNF4
line 1168
;1168:		cgs.screenYBias = 0.5 * ( cgs.glconfig.vidHeight - ( cgs.glconfig.vidWidth * (480.0/640.0) ) );
ADDRGP4 cgs+31448
ADDRGP4 cgs+20100+11308
INDIRI4
CVIF4 4
ADDRGP4 cgs+20100+11304
INDIRI4
CVIF4 4
CNSTF4 1061158912
MULF4
SUBF4
CNSTF4 1056964608
MULF4
ASGNF4
line 1169
;1169:	}
LABELV $1255
line 1171
;1170:
;1171:	cgs.screenXmin = 0.0 - (cgs.screenXBias / cgs.screenXScale);
ADDRGP4 cgs+31452
CNSTF4 0
ADDRGP4 cgs+31444
INDIRF4
ADDRGP4 cgs+31432
INDIRF4
DIVF4
SUBF4
ASGNF4
line 1172
;1172:	cgs.screenXmax = 640.0 + (cgs.screenXBias / cgs.screenXScale);
ADDRGP4 cgs+31456
ADDRGP4 cgs+31444
INDIRF4
ADDRGP4 cgs+31432
INDIRF4
DIVF4
CNSTF4 1142947840
ADDF4
ASGNF4
line 1174
;1173:
;1174:	cgs.screenYmin = 0.0 - (cgs.screenYBias / cgs.screenYScale);
ADDRGP4 cgs+31460
CNSTF4 0
ADDRGP4 cgs+31448
INDIRF4
ADDRGP4 cgs+31436
INDIRF4
DIVF4
SUBF4
ASGNF4
line 1175
;1175:	cgs.screenYmax = 480.0 + (cgs.screenYBias / cgs.screenYScale);
ADDRGP4 cgs+31464
ADDRGP4 cgs+31448
INDIRF4
ADDRGP4 cgs+31436
INDIRF4
DIVF4
CNSTF4 1139802112
ADDF4
ASGNF4
line 1177
;1176:
;1177:	cgs.cursorScaleR = 1.0 / cgs.screenXScale;
ADDRGP4 cgs+31440
CNSTF4 1065353216
ADDRGP4 cgs+31432
INDIRF4
DIVF4
ASGNF4
line 1178
;1178:	if ( cgs.cursorScaleR < 0.5 ) {
ADDRGP4 cgs+31440
INDIRF4
CNSTF4 1056964608
GEF4 $1292
line 1179
;1179:		cgs.cursorScaleR = 0.5;
ADDRGP4 cgs+31440
CNSTF4 1056964608
ASGNF4
line 1180
;1180:	}
LABELV $1292
line 1183
;1181:
;1182:#ifdef USE_NEW_FONT_RENDERER
;1183:	CG_LoadFonts();
ADDRGP4 CG_LoadFonts
CALLV
pop
line 1187
;1184:#endif
;1185:
;1186:	// get the gamestate from the client system
;1187:	trap_GetGameState( &cgs.gameState );
ADDRGP4 cgs
ARGP4
ADDRGP4 trap_GetGameState
CALLV
pop
line 1190
;1188:
;1189:	// check version
;1190:	s = CG_ConfigString( CS_GAME_VERSION );
CNSTI4 20
ARGI4
ADDRLP4 284
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 256
ADDRLP4 284
INDIRP4
ASGNP4
line 1191
;1191:	if ( strstr( s, "defrag-" ) ) {
ADDRLP4 256
INDIRP4
ARGP4
ADDRGP4 $1298
ARGP4
ADDRLP4 288
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 288
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1296
line 1192
;1192:		cgs.defrag = qtrue;
ADDRGP4 cgs+149912
CNSTI4 1
ASGNI4
line 1193
;1193:	} else if ( strcmp( s, GAME_VERSION ) ) {
ADDRGP4 $1297
JUMPV
LABELV $1296
ADDRLP4 256
INDIRP4
ARGP4
ADDRGP4 $1302
ARGP4
ADDRLP4 292
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
EQI4 $1300
line 1194
;1194:		CG_Error( "Client/Server game mismatch: %s/%s", GAME_VERSION, s );
ADDRGP4 $1303
ARGP4
ADDRGP4 $1302
ARGP4
ADDRLP4 256
INDIRP4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 1195
;1195:	}
LABELV $1300
LABELV $1297
line 1197
;1196:
;1197:	cgs.ospEnc = atoi( CG_ConfigString( 872 ) ) & 1;
CNSTI4 872
ARGI4
ADDRLP4 296
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 296
INDIRP4
ARGP4
ADDRLP4 300
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 cgs+149908
ADDRLP4 300
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 1199
;1198:
;1199:	s = CG_ConfigString( CS_LEVEL_START_TIME );
CNSTI4 21
ARGI4
ADDRLP4 304
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 256
ADDRLP4 304
INDIRP4
ASGNP4
line 1200
;1200:	cgs.levelStartTime = atoi( s );
ADDRLP4 256
INDIRP4
ARGP4
ADDRLP4 308
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 cgs+34820
ADDRLP4 308
INDIRI4
ASGNI4
line 1202
;1201:
;1202:	CG_ParseServerinfo();
ADDRGP4 CG_ParseServerinfo
CALLV
pop
line 1203
;1203:	CG_ParseSysteminfo();
ADDRGP4 CG_ParseSysteminfo
CALLV
pop
line 1206
;1204:
;1205:	// load the new map
;1206:	CG_LoadingString( "collision map" );
ADDRGP4 $1306
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 1208
;1207:
;1208:	trap_CM_LoadMap( cgs.mapname );
ADDRGP4 cgs+31508
ARGP4
ADDRGP4 trap_CM_LoadMap
CALLV
pop
line 1210
;1209:
;1210:	cg.loading = qtrue;		// force players to load instead of defer
ADDRGP4 cg+20
CNSTI4 1
ASGNI4
line 1212
;1211:
;1212:	CG_LoadingString( "sounds" );
ADDRGP4 $1309
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 1214
;1213:
;1214:	CG_RegisterSounds();
ADDRGP4 CG_RegisterSounds
CALLV
pop
line 1216
;1215:
;1216:	CG_LoadingString( "graphics" );
ADDRGP4 $1310
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 1218
;1217:
;1218:	CG_RegisterGraphics();
ADDRGP4 CG_RegisterGraphics
CALLV
pop
line 1220
;1219:
;1220:	CG_LoadingString( "clients" );
ADDRGP4 $1311
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 1222
;1221:
;1222:	CG_RegisterClients();		// if low on memory, some clients will be deferred
ADDRGP4 CG_RegisterClients
CALLV
pop
line 1224
;1223:
;1224:	cg.loading = qfalse;	// future players will be deferred
ADDRGP4 cg+20
CNSTI4 0
ASGNI4
line 1226
;1225:
;1226:	CG_InitLocalEntities();
ADDRGP4 CG_InitLocalEntities
CALLV
pop
line 1228
;1227:
;1228:	CG_InitMarkPolys();
ADDRGP4 CG_InitMarkPolys
CALLV
pop
line 1231
;1229:
;1230:	// remove the last loading update
;1231:	cg.infoScreenText[0] = 0;
ADDRGP4 cg+109448
CNSTI1 0
ASGNI1
line 1236
;1232:
;1233:	// Make sure we have update values (scores)
;1234:	// CG_SetConfigValues();
;1235:
;1236:	CG_StartMusic();
ADDRGP4 CG_StartMusic
CALLV
pop
line 1238
;1237:
;1238:	CG_LoadingString( "" );
ADDRGP4 $182
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 1240
;1239:
;1240:	CG_ShaderStateChanged();
ADDRGP4 CG_ShaderStateChanged
CALLV
pop
line 1242
;1241:
;1242:	trap_S_ClearLoopingSounds( qtrue );
CNSTI4 1
ARGI4
ADDRGP4 trap_S_ClearLoopingSounds
CALLV
pop
line 1243
;1243:}
LABELV $1220
endproc CG_Init 312 12
export CG_Shutdown
proc CG_Shutdown 0 0
line 1253
;1244:
;1245:
;1246:/*
;1247:=================
;1248:CG_Shutdown
;1249:
;1250:Called before every level change or subsystem restart
;1251:=================
;1252:*/
;1253:void CG_Shutdown( void ) {
line 1256
;1254:	// some mods may need to do cleanup work here,
;1255:	// like closing files or archiving session data
;1256:}
LABELV $1314
endproc CG_Shutdown 0 0
export CG_SetScoreCatcher
proc CG_SetScoreCatcher 36 4
line 1260
;1257:
;1258:
;1259:void CG_SetScoreCatcher( qboolean enable )
;1260:{
line 1264
;1261:	int	currentCatcher, newCatcher, old_state, new_state;
;1262:	qboolean spectator;
;1263:
;1264:	currentCatcher = trap_Key_GetCatcher();
ADDRLP4 20
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 20
INDIRI4
ASGNI4
line 1266
;1265:
;1266:	if ( currentCatcher & KEYCATCH_CONSOLE || !cg.snap )
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $1319
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1316
LABELV $1319
line 1267
;1267:		return;
ADDRGP4 $1315
JUMPV
LABELV $1316
line 1269
;1268:	
;1269:	spectator = cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR || cg.demoPlayback || ( cg.snap->ps.pm_flags & PMF_FOLLOW );
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1327
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
NEI4 $1327
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $1324
LABELV $1327
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 $1325
JUMPV
LABELV $1324
ADDRLP4 24
CNSTI4 0
ASGNI4
LABELV $1325
ADDRLP4 8
ADDRLP4 24
INDIRI4
ASGNI4
line 1271
;1270:
;1271:	if ( enable && spectator ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $1328
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $1328
line 1272
;1272:		cgs.score_key = trap_Key_GetKey( "+scores" );
ADDRGP4 $1331
ARGP4
ADDRLP4 28
ADDRGP4 trap_Key_GetKey
CALLI4
ASGNI4
ADDRGP4 cgs+149924
ADDRLP4 28
INDIRI4
ASGNI4
line 1273
;1273:		cgs.score_catched = qtrue;
ADDRGP4 cgs+149920
CNSTI4 1
ASGNI4
line 1274
;1274:		newCatcher = currentCatcher | KEYCATCH_CGAME;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 1275
;1275:	} else {
ADDRGP4 $1329
JUMPV
LABELV $1328
line 1276
;1276:		cgs.score_catched = qfalse;
ADDRGP4 cgs+149920
CNSTI4 0
ASGNI4
line 1277
;1277:		newCatcher = currentCatcher & ~KEYCATCH_CGAME;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 1278
;1278:	}
LABELV $1329
line 1280
;1279:
;1280:	if ( newCatcher != currentCatcher ) {
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $1334
line 1281
;1281:		if ( cgs.score_key ) {
ADDRGP4 cgs+149924
INDIRI4
CNSTI4 0
EQI4 $1336
line 1284
;1282:			// keycatcher change may cause reset of all pressed buttons on new engines
;1283:			// so track state of scoreboard key and ignore first upcoming keyup event for it
;1284:			old_state = trap_Key_IsDown( cgs.score_key );
ADDRGP4 cgs+149924
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 trap_Key_IsDown
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 28
INDIRI4
ASGNI4
line 1285
;1285:			trap_Key_SetCatcher( newCatcher );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 1286
;1286:			new_state = trap_Key_IsDown( cgs.score_key );
ADDRGP4 cgs+149924
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 trap_Key_IsDown
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 32
INDIRI4
ASGNI4
line 1287
;1287:			if ( new_state != old_state ) {
ADDRLP4 16
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $1337
line 1288
;1288:				cgs.filterKeyUpEvent = qtrue;
ADDRGP4 cgs+149916
CNSTI4 1
ASGNI4
line 1289
;1289:			}
line 1290
;1290:		} else {
ADDRGP4 $1337
JUMPV
LABELV $1336
line 1291
;1291:			trap_Key_SetCatcher( newCatcher );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 1292
;1292:		}
LABELV $1337
line 1293
;1293:	}
LABELV $1334
line 1294
;1294:}
LABELV $1315
endproc CG_SetScoreCatcher 36 4
export CG_KeyEvent
proc CG_KeyEvent 0 4
line 1298
;1295:
;1296:
;1297:void CG_KeyEvent( int key, qboolean down ) 
;1298:{
line 1300
;1299:	// process scoreboard clicks etc.
;1300:	if ( cgs.score_catched && down ) 
ADDRGP4 cgs+149920
INDIRI4
CNSTI4 0
EQI4 $1345
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $1345
line 1301
;1301:	{
line 1302
;1302:		if ( key == /*K_TAB*/ cgs.score_key )
ADDRFP4 0
INDIRI4
ADDRGP4 cgs+149924
INDIRI4
NEI4 $1348
line 1303
;1303:			return;
ADDRGP4 $1344
JUMPV
LABELV $1348
line 1304
;1304:		if ( key == /*K_MOUSE1*/178 )
ADDRFP4 0
INDIRI4
CNSTI4 178
NEI4 $1351
line 1305
;1305:			CG_ScoreboardClick();
ADDRGP4 CG_ScoreboardClick
CALLV
pop
ADDRGP4 $1352
JUMPV
LABELV $1351
line 1307
;1306:		else
;1307:			CG_SetScoreCatcher( qfalse );
CNSTI4 0
ARGI4
ADDRGP4 CG_SetScoreCatcher
CALLV
pop
LABELV $1352
line 1308
;1308:	}
LABELV $1345
line 1309
;1309:}
LABELV $1344
endproc CG_KeyEvent 0 4
export CG_MouseEvent
proc CG_MouseEvent 8 0
line 1313
;1310:
;1311:
;1312:void CG_MouseEvent( int x, int y )
;1313:{
line 1314
;1314:	cgs.cursorX += x * cgs.cursorScaleR;
ADDRLP4 0
ADDRGP4 cgs+149928
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRGP4 cgs+31440
INDIRF4
MULF4
ADDF4
ASGNF4
line 1315
;1315:	cgs.cursorY += y * cgs.cursorScaleR;
ADDRLP4 4
ADDRGP4 cgs+149932
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRFP4 4
INDIRI4
CVIF4 4
ADDRGP4 cgs+31440
INDIRF4
MULF4
ADDF4
ASGNF4
line 1317
;1316:
;1317:	if ( cgs.cursorX < cgs.screenXmin ) {
ADDRGP4 cgs+149928
INDIRF4
ADDRGP4 cgs+31452
INDIRF4
GEF4 $1358
line 1318
;1318:		cgs.cursorX = cgs.screenXmin;
ADDRGP4 cgs+149928
ADDRGP4 cgs+31452
INDIRF4
ASGNF4
line 1319
;1319:	}
ADDRGP4 $1359
JUMPV
LABELV $1358
line 1320
;1320:	else if ( cgs.cursorX > cgs.screenXmax ) {
ADDRGP4 cgs+149928
INDIRF4
ADDRGP4 cgs+31456
INDIRF4
LEF4 $1364
line 1321
;1321:		cgs.cursorX = cgs.screenXmax;
ADDRGP4 cgs+149928
ADDRGP4 cgs+31456
INDIRF4
ASGNF4
line 1322
;1322:	}
LABELV $1364
LABELV $1359
line 1324
;1323:
;1324:	if ( cgs.cursorY < cgs.screenYmin ) {
ADDRGP4 cgs+149932
INDIRF4
ADDRGP4 cgs+31460
INDIRF4
GEF4 $1370
line 1325
;1325:		cgs.cursorY = cgs.screenYmin;
ADDRGP4 cgs+149932
ADDRGP4 cgs+31460
INDIRF4
ASGNF4
line 1326
;1326:	}
ADDRGP4 $1371
JUMPV
LABELV $1370
line 1327
;1327:	else if ( cgs.cursorY > cgs.screenYmax ) {
ADDRGP4 cgs+149932
INDIRF4
ADDRGP4 cgs+31464
INDIRF4
LEF4 $1376
line 1328
;1328:		cgs.cursorY = cgs.screenYmax;
ADDRGP4 cgs+149932
ADDRGP4 cgs+31464
INDIRF4
ASGNF4
line 1329
;1329:	}
LABELV $1376
LABELV $1371
line 1330
;1330:}
LABELV $1353
endproc CG_MouseEvent 8 0
bss
export cg_hudFiles
align 4
LABELV cg_hudFiles
skip 272
export trap_GetValue
align 4
LABELV trap_GetValue
skip 4
export trap_R_AddLinearLightToScene
align 4
LABELV trap_R_AddLinearLightToScene
skip 4
export trap_R_AddRefEntityToScene2
align 4
LABELV trap_R_AddRefEntityToScene2
skip 4
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
import eventnames
export cg_followKiller
align 4
LABELV cg_followKiller
skip 272
export cg_fovAdjust
align 4
LABELV cg_fovAdjust
skip 272
export cg_deadBodyDarken
align 4
LABELV cg_deadBodyDarken
skip 272
export cg_teamColors
align 4
LABELV cg_teamColors
skip 272
export cg_teamModel
align 4
LABELV cg_teamModel
skip 272
export cg_enemyColors
align 4
LABELV cg_enemyColors
skip 272
export cg_enemyModel
align 4
LABELV cg_enemyModel
skip 272
export cg_hitSounds
align 4
LABELV cg_hitSounds
skip 272
export cg_obeliskRespawnDelay
align 4
LABELV cg_obeliskRespawnDelay
skip 272
export cg_recordSPDemoName
align 4
LABELV cg_recordSPDemoName
skip 272
export cg_recordSPDemo
align 4
LABELV cg_recordSPDemo
skip 272
export cg_singlePlayerActive
align 4
LABELV cg_singlePlayerActive
skip 272
export cg_enableBreath
align 4
LABELV cg_enableBreath
skip 272
export cg_enableDust
align 4
LABELV cg_enableDust
skip 272
export cg_singlePlayer
align 4
LABELV cg_singlePlayer
skip 272
export cg_blueTeamName
align 4
LABELV cg_blueTeamName
skip 272
export cg_redTeamName
align 4
LABELV cg_redTeamName
skip 272
export cg_trueLightning
align 4
LABELV cg_trueLightning
skip 272
export cg_oldPlasma
align 4
LABELV cg_oldPlasma
skip 272
export cg_oldRocket
align 4
LABELV cg_oldRocket
skip 272
export cg_oldRail
align 4
LABELV cg_oldRail
skip 272
export cg_noProjectileTrail
align 4
LABELV cg_noProjectileTrail
skip 272
export cg_noTaunt
align 4
LABELV cg_noTaunt
skip 272
export cg_bigFont
align 4
LABELV cg_bigFont
skip 272
export cg_smallFont
align 4
LABELV cg_smallFont
skip 272
export cg_cameraMode
align 4
LABELV cg_cameraMode
skip 272
export cg_timescale
align 4
LABELV cg_timescale
skip 272
export cg_timescaleFadeSpeed
align 4
LABELV cg_timescaleFadeSpeed
skip 272
export cg_timescaleFadeEnd
align 4
LABELV cg_timescaleFadeEnd
skip 272
export cg_cameraOrbitDelay
align 4
LABELV cg_cameraOrbitDelay
skip 272
export cg_cameraOrbit
align 4
LABELV cg_cameraOrbit
skip 272
export cg_smoothClients
align 4
LABELV cg_smoothClients
skip 272
export cg_scorePlum
align 4
LABELV cg_scorePlum
skip 272
export cg_teamChatsOnly
align 4
LABELV cg_teamChatsOnly
skip 272
export cg_drawFriend
align 4
LABELV cg_drawFriend
skip 272
export cg_deferPlayers
align 4
LABELV cg_deferPlayers
skip 272
export cg_predictItems
align 4
LABELV cg_predictItems
skip 272
export cg_blood
align 4
LABELV cg_blood
skip 272
export cg_paused
align 4
LABELV cg_paused
skip 272
export cg_buildScript
align 4
LABELV cg_buildScript
skip 272
export cg_forceModel
align 4
LABELV cg_forceModel
skip 272
export cg_stats
align 4
LABELV cg_stats
skip 272
export cg_teamChatHeight
align 4
LABELV cg_teamChatHeight
skip 272
export cg_teamChatTime
align 4
LABELV cg_teamChatTime
skip 272
export cg_drawSpeed
align 4
LABELV cg_drawSpeed
skip 272
export cg_drawAttacker
align 4
LABELV cg_drawAttacker
skip 272
export cg_lagometer
align 4
LABELV cg_lagometer
skip 272
export cg_thirdPerson
align 4
LABELV cg_thirdPerson
skip 272
export cg_thirdPersonAngle
align 4
LABELV cg_thirdPersonAngle
skip 272
export cg_thirdPersonRange
align 4
LABELV cg_thirdPersonRange
skip 272
export cg_zoomFov
align 4
LABELV cg_zoomFov
skip 272
export cg_fov
align 4
LABELV cg_fov
skip 272
export cg_simpleItems
align 4
LABELV cg_simpleItems
skip 272
export cg_ignore
align 4
LABELV cg_ignore
skip 272
export cg_autoswitch
align 4
LABELV cg_autoswitch
skip 272
export cg_tracerLength
align 4
LABELV cg_tracerLength
skip 272
export cg_tracerWidth
align 4
LABELV cg_tracerWidth
skip 272
export cg_tracerChance
align 4
LABELV cg_tracerChance
skip 272
export cg_viewsize
align 4
LABELV cg_viewsize
skip 272
export cg_drawGun
align 4
LABELV cg_drawGun
skip 272
export cg_gun_z
align 4
LABELV cg_gun_z
skip 272
export cg_gun_y
align 4
LABELV cg_gun_y
skip 272
export cg_gun_x
align 4
LABELV cg_gun_x
skip 272
export cg_gun_frame
align 4
LABELV cg_gun_frame
skip 272
export cg_brassTime
align 4
LABELV cg_brassTime
skip 272
export cg_addMarks
align 4
LABELV cg_addMarks
skip 272
export cg_footsteps
align 4
LABELV cg_footsteps
skip 272
export cg_showmiss
align 4
LABELV cg_showmiss
skip 272
export cg_noPlayerAnims
align 4
LABELV cg_noPlayerAnims
skip 272
export cg_nopredict
align 4
LABELV cg_nopredict
skip 272
export cg_errorDecay
align 4
LABELV cg_errorDecay
skip 272
export cg_railTrailRadius
align 4
LABELV cg_railTrailRadius
skip 272
export cg_railTrailTime
align 4
LABELV cg_railTrailTime
skip 272
export cg_debugEvents
align 4
LABELV cg_debugEvents
skip 272
export cg_debugPosition
align 4
LABELV cg_debugPosition
skip 272
export cg_debugAnim
align 4
LABELV cg_debugAnim
skip 272
export cg_animSpeed
align 4
LABELV cg_animSpeed
skip 272
export cg_draw2D
align 4
LABELV cg_draw2D
skip 272
export cg_drawStatus
align 4
LABELV cg_drawStatus
skip 272
export cg_crosshairHealth
align 4
LABELV cg_crosshairHealth
skip 272
export cg_crosshairSize
align 4
LABELV cg_crosshairSize
skip 272
export cg_crosshairY
align 4
LABELV cg_crosshairY
skip 272
export cg_crosshairX
align 4
LABELV cg_crosshairX
skip 272
export cg_drawWeaponSelect
align 4
LABELV cg_drawWeaponSelect
skip 272
export cg_teamOverlayUserinfo
align 4
LABELV cg_teamOverlayUserinfo
skip 272
export cg_drawTeamOverlay
align 4
LABELV cg_drawTeamOverlay
skip 272
export cg_drawRewards
align 4
LABELV cg_drawRewards
skip 272
export cg_drawCrosshairNames
align 4
LABELV cg_drawCrosshairNames
skip 272
export cg_drawCrosshair
align 4
LABELV cg_drawCrosshair
skip 272
export cg_drawAmmoWarning
align 4
LABELV cg_drawAmmoWarning
skip 272
export cg_drawIcons
align 4
LABELV cg_drawIcons
skip 272
export cg_draw3dIcons
align 4
LABELV cg_draw3dIcons
skip 272
export cg_drawSnapshot
align 4
LABELV cg_drawSnapshot
skip 272
export cg_drawFPS
align 4
LABELV cg_drawFPS
skip 272
export cg_drawTimer
align 4
LABELV cg_drawTimer
skip 272
export cg_gibs
align 4
LABELV cg_gibs
skip 272
export cg_shadows
align 4
LABELV cg_shadows
skip 272
export cg_swingSpeed
align 4
LABELV cg_swingSpeed
skip 272
export cg_bobroll
align 4
LABELV cg_bobroll
skip 272
export cg_bobpitch
align 4
LABELV cg_bobpitch
skip 272
export cg_bobup
align 4
LABELV cg_bobup
skip 272
export cg_runroll
align 4
LABELV cg_runroll
skip 272
export cg_runpitch
align 4
LABELV cg_runpitch
skip 272
export cg_centertime
align 4
LABELV cg_centertime
skip 272
import cg_markPolys
export cg_items
align 4
LABELV cg_items
skip 7168
export cg_weapons
align 4
LABELV cg_weapons
skip 2176
export cg_entities
align 4
LABELV cg_entities
skip 757760
export cg
align 4
LABELV cg
skip 157028
export cgs
align 4
LABELV cgs
skip 149936
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
LABELV $1331
byte 1 43
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $1311
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $1310
byte 1 103
byte 1 114
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 99
byte 1 115
byte 1 0
align 1
LABELV $1309
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $1306
byte 1 99
byte 1 111
byte 1 108
byte 1 108
byte 1 105
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $1303
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 47
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 109
byte 1 105
byte 1 115
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1302
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 113
byte 1 51
byte 1 45
byte 1 49
byte 1 0
align 1
LABELV $1298
byte 1 100
byte 1 101
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 45
byte 1 0
align 1
LABELV $1246
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 50
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1243
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 49
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 95
byte 1 103
byte 1 108
byte 1 111
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1240
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 49
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1237
byte 1 119
byte 1 104
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $1234
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 98
byte 1 105
byte 1 103
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $1232
byte 1 116
byte 1 114
byte 1 97
byte 1 112
byte 1 95
byte 1 82
byte 1 95
byte 1 65
byte 1 100
byte 1 100
byte 1 76
byte 1 105
byte 1 110
byte 1 101
byte 1 97
byte 1 114
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 84
byte 1 111
byte 1 83
byte 1 99
byte 1 101
byte 1 110
byte 1 101
byte 1 95
byte 1 81
byte 1 51
byte 1 69
byte 1 0
align 1
LABELV $1229
byte 1 116
byte 1 114
byte 1 97
byte 1 112
byte 1 95
byte 1 82
byte 1 95
byte 1 65
byte 1 100
byte 1 100
byte 1 82
byte 1 101
byte 1 102
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 84
byte 1 111
byte 1 83
byte 1 99
byte 1 101
byte 1 110
byte 1 101
byte 1 50
byte 1 0
align 1
LABELV $1224
byte 1 47
byte 1 47
byte 1 116
byte 1 114
byte 1 97
byte 1 112
byte 1 95
byte 1 71
byte 1 101
byte 1 116
byte 1 86
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $1217
byte 1 67
byte 1 71
byte 1 95
byte 1 67
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 83
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1192
byte 1 37
byte 1 115
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $1178
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 98
byte 1 97
byte 1 114
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1174
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 98
byte 1 97
byte 1 114
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1170
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 98
byte 1 97
byte 1 114
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 105
byte 1 110
byte 1 95
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1167
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 51
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 115
byte 1 111
byte 1 114
byte 1 50
byte 1 0
align 1
LABELV $1150
byte 1 42
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1143
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 77
byte 1 97
byte 1 114
byte 1 107
byte 1 0
align 1
LABELV $1140
byte 1 119
byte 1 97
byte 1 107
byte 1 101
byte 1 0
align 1
LABELV $1137
byte 1 109
byte 1 97
byte 1 114
byte 1 107
byte 1 83
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $1134
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 95
byte 1 109
byte 1 114
byte 1 107
byte 1 0
align 1
LABELV $1131
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 47
byte 1 104
byte 1 111
byte 1 108
byte 1 101
byte 1 95
byte 1 108
byte 1 103
byte 1 95
byte 1 109
byte 1 114
byte 1 107
byte 1 0
align 1
LABELV $1128
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 47
byte 1 98
byte 1 117
byte 1 114
byte 1 110
byte 1 95
byte 1 109
byte 1 101
byte 1 100
byte 1 95
byte 1 109
byte 1 114
byte 1 107
byte 1 0
align 1
LABELV $1125
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 47
byte 1 98
byte 1 117
byte 1 108
byte 1 108
byte 1 101
byte 1 116
byte 1 95
byte 1 109
byte 1 114
byte 1 107
byte 1 0
align 1
LABELV $1113
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $1110
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 97
byte 1 115
byte 1 115
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $1107
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $1104
byte 1 109
byte 1 101
byte 1 100
byte 1 97
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
LABELV $1101
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1098
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 105
byte 1 109
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $1095
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 115
byte 1 104
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 47
byte 1 115
byte 1 104
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1092
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1089
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 115
byte 1 104
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 47
byte 1 106
byte 1 117
byte 1 105
byte 1 99
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1086
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 115
byte 1 104
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 47
byte 1 105
byte 1 109
byte 1 112
byte 1 97
byte 1 99
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1083
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1080
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 100
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 114
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1077
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 115
byte 1 99
byte 1 111
byte 1 117
byte 1 116
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1074
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 103
byte 1 117
byte 1 97
byte 1 114
byte 1 100
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1071
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 116
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1068
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 107
byte 1 97
byte 1 109
byte 1 105
byte 1 107
byte 1 97
byte 1 122
byte 1 105
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1065
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 116
byte 1 115
byte 1 47
byte 1 107
byte 1 97
byte 1 109
byte 1 119
byte 1 97
byte 1 118
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1062
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 116
byte 1 115
byte 1 47
byte 1 107
byte 1 97
byte 1 109
byte 1 98
byte 1 111
byte 1 111
byte 1 109
byte 1 50
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1059
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 116
byte 1 115
byte 1 47
byte 1 98
byte 1 111
byte 1 111
byte 1 109
byte 1 48
byte 1 49
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1056
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 116
byte 1 115
byte 1 47
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 48
byte 1 50
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1053
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 116
byte 1 115
byte 1 47
byte 1 98
byte 1 117
byte 1 108
byte 1 108
byte 1 101
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1050
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 69
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $1047
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 115
byte 1 47
byte 1 98
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 111
byte 1 110
byte 1 51
byte 1 0
align 1
LABELV $1042
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 98
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1039
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 115
byte 1 107
byte 1 117
byte 1 108
byte 1 108
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1036
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 108
byte 1 101
byte 1 103
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1033
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1030
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 102
byte 1 111
byte 1 114
byte 1 101
byte 1 97
byte 1 114
byte 1 109
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1027
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1024
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 102
byte 1 105
byte 1 115
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1021
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 101
byte 1 115
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1018
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 97
byte 1 114
byte 1 109
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1015
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 97
byte 1 98
byte 1 100
byte 1 111
byte 1 109
byte 1 101
byte 1 110
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1012
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 115
byte 1 104
byte 1 101
byte 1 108
byte 1 108
byte 1 115
byte 1 47
byte 1 115
byte 1 95
byte 1 115
byte 1 104
byte 1 101
byte 1 108
byte 1 108
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1009
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 115
byte 1 104
byte 1 101
byte 1 108
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 95
byte 1 115
byte 1 104
byte 1 101
byte 1 108
byte 1 108
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1006
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 114
byte 1 95
byte 1 121
byte 1 101
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $1003
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 47
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 95
byte 1 121
byte 1 101
byte 1 108
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1000
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 116
byte 1 115
byte 1 47
byte 1 107
byte 1 97
byte 1 109
byte 1 105
byte 1 107
byte 1 98
byte 1 108
byte 1 117
byte 1 0
align 1
LABELV $997
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 98
byte 1 97
byte 1 114
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $994
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $991
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 115
byte 1 47
byte 1 102
byte 1 111
byte 1 101
byte 1 0
align 1
LABELV $981
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 116
byte 1 115
byte 1 47
byte 1 107
byte 1 97
byte 1 109
byte 1 105
byte 1 107
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $978
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 47
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $975
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 104
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 47
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $972
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 104
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 47
byte 1 114
byte 1 101
byte 1 100
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $969
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 104
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 47
byte 1 104
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $961
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 95
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 103
byte 1 121
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $958
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 95
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 115
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $955
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 95
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $952
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 95
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $944
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 110
byte 1 101
byte 1 117
byte 1 116
byte 1 114
byte 1 97
byte 1 108
byte 1 51
byte 1 0
align 1
LABELV $934
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 110
byte 1 101
byte 1 117
byte 1 116
byte 1 114
byte 1 97
byte 1 108
byte 1 49
byte 1 0
align 1
LABELV $931
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 47
byte 1 110
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $923
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 112
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 47
byte 1 110
byte 1 116
byte 1 114
byte 1 108
byte 1 95
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $920
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 112
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 47
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 95
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $917
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 112
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 47
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $914
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 50
byte 1 47
byte 1 119
byte 1 104
byte 1 105
byte 1 116
byte 1 101
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $911
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 50
byte 1 47
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $908
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 50
byte 1 47
byte 1 114
byte 1 101
byte 1 100
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $905
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 50
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 102
byte 1 108
byte 1 97
byte 1 112
byte 1 51
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $902
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 50
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 112
byte 1 111
byte 1 108
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $899
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 51
byte 1 0
align 1
LABELV $895
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 50
byte 1 0
align 1
LABELV $891
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 49
byte 1 0
align 1
LABELV $888
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $884
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 50
byte 1 0
align 1
LABELV $880
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 49
byte 1 0
align 1
LABELV $877
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 47
byte 1 98
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $874
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 47
byte 1 114
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $862
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 115
byte 1 107
byte 1 117
byte 1 108
byte 1 108
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $859
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 115
byte 1 107
byte 1 117
byte 1 108
byte 1 108
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $856
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 111
byte 1 114
byte 1 98
byte 1 47
byte 1 98
byte 1 95
byte 1 111
byte 1 114
byte 1 98
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $853
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 111
byte 1 114
byte 1 98
byte 1 47
byte 1 114
byte 1 95
byte 1 111
byte 1 114
byte 1 98
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $841
byte 1 104
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 83
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 80
byte 1 117
byte 1 102
byte 1 102
byte 1 0
align 1
LABELV $838
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $835
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 105
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
LABELV $832
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $829
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 83
byte 1 117
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $826
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 113
byte 1 117
byte 1 97
byte 1 100
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $823
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 113
byte 1 117
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $820
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 110
byte 1 111
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $817
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 116
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $814
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 37
byte 1 99
byte 1 0
align 1
LABELV $807
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $804
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $801
byte 1 119
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 66
byte 1 117
byte 1 98
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $798
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
LABELV $795
byte 1 108
byte 1 97
byte 1 103
byte 1 111
byte 1 109
byte 1 101
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $792
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 84
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 0
align 1
LABELV $789
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 49
byte 1 0
align 1
LABELV $786
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 116
byte 1 115
byte 1 47
byte 1 112
byte 1 114
byte 1 111
byte 1 120
byte 1 109
byte 1 105
byte 1 110
byte 1 101
byte 1 98
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $783
byte 1 110
byte 1 97
byte 1 105
byte 1 108
byte 1 116
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 0
align 1
LABELV $780
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 83
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 80
byte 1 117
byte 1 102
byte 1 102
byte 1 0
align 1
LABELV $777
byte 1 115
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 80
byte 1 117
byte 1 102
byte 1 102
byte 1 82
byte 1 97
byte 1 103
byte 1 101
byte 1 80
byte 1 114
byte 1 111
byte 1 0
align 1
LABELV $774
byte 1 115
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 80
byte 1 117
byte 1 102
byte 1 102
byte 1 0
align 1
LABELV $771
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 116
byte 1 97
byte 1 98
byte 1 47
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $768
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 116
byte 1 97
byte 1 98
byte 1 47
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $765
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 116
byte 1 97
byte 1 98
byte 1 47
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $762
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 116
byte 1 97
byte 1 98
byte 1 47
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $759
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $756
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 66
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 66
byte 1 108
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $753
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 53
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $749
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 52
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $745
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 51
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $741
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 50
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $737
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 49
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $728
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 109
byte 1 101
byte 1 100
byte 1 105
byte 1 97
byte 1 0
align 1
LABELV $723
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 110
byte 1 117
byte 1 115
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $722
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 110
byte 1 105
byte 1 110
byte 1 101
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $721
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $720
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 115
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $719
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 115
byte 1 105
byte 1 120
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $718
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 102
byte 1 105
byte 1 118
byte 1 101
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $717
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 102
byte 1 111
byte 1 117
byte 1 114
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $716
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 116
byte 1 104
byte 1 114
byte 1 101
byte 1 101
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $715
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 116
byte 1 119
byte 1 111
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $714
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 111
byte 1 110
byte 1 101
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $713
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 122
byte 1 101
byte 1 114
byte 1 111
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $710
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 47
byte 1 104
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 98
byte 1 50
byte 1 97
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $707
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 47
byte 1 104
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 98
byte 1 49
byte 1 97
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $704
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
byte 1 110
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $701
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
byte 1 114
byte 1 111
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $698
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
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $695
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 112
byte 1 114
byte 1 111
byte 1 120
byte 1 109
byte 1 105
byte 1 110
byte 1 101
byte 1 47
byte 1 119
byte 1 115
byte 1 116
byte 1 98
byte 1 97
byte 1 99
byte 1 116
byte 1 118
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $692
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 112
byte 1 114
byte 1 111
byte 1 120
byte 1 109
byte 1 105
byte 1 110
byte 1 101
byte 1 47
byte 1 119
byte 1 115
byte 1 116
byte 1 98
byte 1 105
byte 1 109
byte 1 112
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $689
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 112
byte 1 114
byte 1 111
byte 1 120
byte 1 109
byte 1 105
byte 1 110
byte 1 101
byte 1 47
byte 1 119
byte 1 115
byte 1 116
byte 1 98
byte 1 105
byte 1 109
byte 1 112
byte 1 109
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $686
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 112
byte 1 114
byte 1 111
byte 1 120
byte 1 109
byte 1 105
byte 1 110
byte 1 101
byte 1 47
byte 1 119
byte 1 115
byte 1 116
byte 1 98
byte 1 105
byte 1 109
byte 1 112
byte 1 108
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $683
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 121
byte 1 111
byte 1 117
byte 1 108
byte 1 111
byte 1 115
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $680
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 121
byte 1 111
byte 1 117
byte 1 119
byte 1 105
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $677
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
byte 1 95
byte 1 101
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 100
byte 1 101
byte 1 95
byte 1 102
byte 1 97
byte 1 114
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $674
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
byte 1 95
byte 1 105
byte 1 109
byte 1 112
byte 1 108
byte 1 111
byte 1 100
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $671
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
byte 1 95
byte 1 101
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 100
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $668
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 118
byte 1 117
byte 1 108
byte 1 99
byte 1 97
byte 1 110
byte 1 47
byte 1 119
byte 1 118
byte 1 117
byte 1 108
byte 1 105
byte 1 109
byte 1 112
byte 1 109
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $665
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 118
byte 1 117
byte 1 108
byte 1 99
byte 1 97
byte 1 110
byte 1 47
byte 1 119
byte 1 118
byte 1 117
byte 1 108
byte 1 105
byte 1 109
byte 1 112
byte 1 108
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $662
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 118
byte 1 117
byte 1 108
byte 1 99
byte 1 97
byte 1 110
byte 1 47
byte 1 119
byte 1 118
byte 1 117
byte 1 108
byte 1 105
byte 1 109
byte 1 112
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $659
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 110
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 47
byte 1 119
byte 1 110
byte 1 97
byte 1 108
byte 1 105
byte 1 109
byte 1 112
byte 1 109
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $656
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 110
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 47
byte 1 119
byte 1 110
byte 1 97
byte 1 108
byte 1 105
byte 1 109
byte 1 112
byte 1 108
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $653
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 110
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 47
byte 1 119
byte 1 110
byte 1 97
byte 1 108
byte 1 105
byte 1 109
byte 1 112
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $650
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 112
byte 1 114
byte 1 111
byte 1 120
byte 1 109
byte 1 105
byte 1 110
byte 1 101
byte 1 47
byte 1 119
byte 1 115
byte 1 116
byte 1 98
byte 1 101
byte 1 120
byte 1 112
byte 1 108
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $647
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 120
byte 1 49
byte 1 97
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $644
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 47
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 108
byte 1 120
byte 1 49
byte 1 97
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $641
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
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
byte 1 47
byte 1 114
byte 1 105
byte 1 99
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $638
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
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
byte 1 47
byte 1 114
byte 1 105
byte 1 99
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $635
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
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
byte 1 47
byte 1 114
byte 1 105
byte 1 99
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $632
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
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $629
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
byte 1 117
byte 1 115
byte 1 101
byte 1 95
byte 1 109
byte 1 101
byte 1 100
byte 1 107
byte 1 105
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $626
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
byte 1 102
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $607
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
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 99
byte 1 108
byte 1 97
byte 1 110
byte 1 107
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $603
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
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $599
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
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 103
byte 1 121
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $595
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
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 99
byte 1 104
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $591
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
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 101
byte 1 115
byte 1 104
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $587
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
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 98
byte 1 111
byte 1 111
byte 1 116
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $584
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
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $579
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 47
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 112
byte 1 97
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $576
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
byte 1 119
byte 1 97
byte 1 116
byte 1 114
byte 1 95
byte 1 117
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $573
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
byte 1 119
byte 1 97
byte 1 116
byte 1 114
byte 1 95
byte 1 111
byte 1 117
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $570
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
byte 1 119
byte 1 97
byte 1 116
byte 1 114
byte 1 95
byte 1 105
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $567
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 108
byte 1 111
byte 1 115
byte 1 116
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $564
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 116
byte 1 105
byte 1 101
byte 1 100
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $561
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 116
byte 1 97
byte 1 107
byte 1 101
byte 1 110
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $558
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 115
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $555
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 105
byte 1 115
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $552
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 104
byte 1 117
byte 1 109
byte 1 105
byte 1 108
byte 1 105
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $549
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 100
byte 1 101
byte 1 110
byte 1 105
byte 1 101
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $546
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $543
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 105
byte 1 109
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $540
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 104
byte 1 105
byte 1 116
byte 1 108
byte 1 111
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $537
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 104
byte 1 105
byte 1 116
byte 1 104
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $534
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 104
byte 1 105
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $531
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 104
byte 1 105
byte 1 116
byte 1 49
byte 1 48
byte 1 48
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $527
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 104
byte 1 105
byte 1 116
byte 1 55
byte 1 53
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $523
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 104
byte 1 105
byte 1 116
byte 1 53
byte 1 48
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $519
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 104
byte 1 105
byte 1 116
byte 1 50
byte 1 53
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $516
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
byte 1 108
byte 1 97
byte 1 110
byte 1 100
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $513
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
byte 1 116
byte 1 97
byte 1 108
byte 1 107
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $510
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 110
byte 1 111
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $507
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
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $504
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $501
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 105
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $498
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
byte 1 99
byte 1 108
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 117
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $495
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
byte 1 99
byte 1 108
byte 1 95
byte 1 103
byte 1 117
byte 1 97
byte 1 114
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $492
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
byte 1 99
byte 1 108
byte 1 95
byte 1 100
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 114
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $489
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
byte 1 99
byte 1 108
byte 1 95
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $486
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
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 95
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
LABELV $483
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
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 95
byte 1 104
byte 1 105
byte 1 116
byte 1 95
byte 1 48
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $480
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
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 95
byte 1 104
byte 1 105
byte 1 116
byte 1 95
byte 1 48
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $477
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
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 95
byte 1 104
byte 1 105
byte 1 116
byte 1 95
byte 1 48
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $474
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
byte 1 105
byte 1 110
byte 1 118
byte 1 117
byte 1 108
byte 1 95
byte 1 106
byte 1 117
byte 1 105
byte 1 99
byte 1 101
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $471
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
byte 1 105
byte 1 110
byte 1 118
byte 1 117
byte 1 108
byte 1 95
byte 1 105
byte 1 109
byte 1 112
byte 1 97
byte 1 99
byte 1 116
byte 1 95
byte 1 48
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $468
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
byte 1 105
byte 1 110
byte 1 118
byte 1 117
byte 1 108
byte 1 95
byte 1 105
byte 1 109
byte 1 112
byte 1 97
byte 1 99
byte 1 116
byte 1 95
byte 1 48
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $465
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
byte 1 105
byte 1 110
byte 1 118
byte 1 117
byte 1 108
byte 1 95
byte 1 105
byte 1 109
byte 1 112
byte 1 97
byte 1 99
byte 1 116
byte 1 95
byte 1 48
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $462
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
byte 1 105
byte 1 110
byte 1 118
byte 1 117
byte 1 108
byte 1 95
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $459
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
byte 1 105
byte 1 98
byte 1 105
byte 1 109
byte 1 112
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $456
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
byte 1 105
byte 1 98
byte 1 105
byte 1 109
byte 1 112
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $453
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
byte 1 105
byte 1 98
byte 1 105
byte 1 109
byte 1 112
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $450
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
byte 1 105
byte 1 98
byte 1 115
byte 1 112
byte 1 108
byte 1 116
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $447
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
byte 1 117
byte 1 115
byte 1 101
byte 1 95
byte 1 110
byte 1 111
byte 1 116
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $444
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
byte 1 119
byte 1 101
byte 1 97
byte 1 114
byte 1 111
byte 1 102
byte 1 102
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $441
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $438
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
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
byte 1 47
byte 1 98
byte 1 117
byte 1 108
byte 1 101
byte 1 116
byte 1 98
byte 1 121
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $433
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 95
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $425
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 104
byte 1 111
byte 1 108
byte 1 121
byte 1 115
byte 1 104
byte 1 105
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $422
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 121
byte 1 111
byte 1 117
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $412
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 95
byte 1 49
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $409
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 49
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $399
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $396
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $393
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 95
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $390
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $382
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 116
byte 1 97
byte 1 107
byte 1 101
byte 1 110
byte 1 95
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $379
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 116
byte 1 97
byte 1 107
byte 1 101
byte 1 110
byte 1 95
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $376
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 95
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $373
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 95
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $370
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 95
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $365
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $362
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $359
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 104
byte 1 105
byte 1 116
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 109
byte 1 97
byte 1 116
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $356
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 116
byte 1 105
byte 1 101
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $353
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $350
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 114
byte 1 101
byte 1 100
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $347
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 95
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $339
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 112
byte 1 114
byte 1 101
byte 1 112
byte 1 97
byte 1 114
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $336
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $333
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 111
byte 1 110
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $330
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 116
byte 1 119
byte 1 111
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $327
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 116
byte 1 104
byte 1 114
byte 1 101
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $324
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 51
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $321
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 50
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $318
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 49
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $315
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 115
byte 1 117
byte 1 100
byte 1 100
byte 1 101
byte 1 110
byte 1 95
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $312
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 53
byte 1 95
byte 1 109
byte 1 105
byte 1 110
byte 1 117
byte 1 116
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $309
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 49
byte 1 95
byte 1 109
byte 1 105
byte 1 110
byte 1 117
byte 1 116
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $305
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $299
byte 1 80
byte 1 114
byte 1 101
byte 1 99
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 112
byte 1 114
byte 1 101
byte 1 99
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $228
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
LABELV $227
byte 1 115
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $226
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $219
byte 1 115
byte 1 118
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $213
byte 1 99
byte 1 103
byte 1 95
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $212
byte 1 99
byte 1 103
byte 1 95
byte 1 102
byte 1 111
byte 1 118
byte 1 65
byte 1 100
byte 1 106
byte 1 117
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $211
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 66
byte 1 111
byte 1 100
byte 1 121
byte 1 68
byte 1 97
byte 1 114
byte 1 107
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $210
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $209
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $208
byte 1 99
byte 1 103
byte 1 95
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 67
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $207
byte 1 99
byte 1 103
byte 1 95
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $206
byte 1 99
byte 1 103
byte 1 95
byte 1 104
byte 1 105
byte 1 116
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $205
byte 1 48
byte 1 46
byte 1 48
byte 1 0
align 1
LABELV $204
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 114
byte 1 117
byte 1 101
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $203
byte 1 99
byte 1 103
byte 1 95
byte 1 111
byte 1 108
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 0
align 1
LABELV $202
byte 1 99
byte 1 103
byte 1 95
byte 1 111
byte 1 108
byte 1 100
byte 1 82
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $201
byte 1 99
byte 1 103
byte 1 95
byte 1 111
byte 1 108
byte 1 100
byte 1 82
byte 1 97
byte 1 105
byte 1 108
byte 1 0
align 1
LABELV $200
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 105
byte 1 103
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $199
byte 1 48
byte 1 46
byte 1 50
byte 1 53
byte 1 0
align 1
LABELV $198
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $197
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 80
byte 1 114
byte 1 111
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 108
byte 1 101
byte 1 84
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 0
align 1
LABELV $196
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 84
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $195
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $194
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 109
byte 1 111
byte 1 111
byte 1 116
byte 1 104
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $193
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 80
byte 1 108
byte 1 117
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $192
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $191
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 70
byte 1 97
byte 1 100
byte 1 101
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $190
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 70
byte 1 97
byte 1 100
byte 1 101
byte 1 69
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $189
byte 1 53
byte 1 48
byte 1 0
align 1
LABELV $188
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
byte 1 68
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $187
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
LABELV $186
byte 1 117
byte 1 105
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $185
byte 1 99
byte 1 103
byte 1 95
byte 1 104
byte 1 117
byte 1 100
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $184
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $183
byte 1 103
byte 1 95
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 82
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 68
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $182
byte 1 0
align 1
LABELV $181
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 114
byte 1 100
byte 1 83
byte 1 80
byte 1 68
byte 1 101
byte 1 109
byte 1 111
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $180
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 114
byte 1 100
byte 1 83
byte 1 80
byte 1 68
byte 1 101
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $179
byte 1 103
byte 1 95
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 66
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $178
byte 1 103
byte 1 95
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 68
byte 1 117
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $177
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $176
byte 1 80
byte 1 97
byte 1 103
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $175
byte 1 103
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $174
byte 1 83
byte 1 116
byte 1 114
byte 1 111
byte 1 103
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $173
byte 1 103
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $172
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $171
byte 1 99
byte 1 108
byte 1 95
byte 1 112
byte 1 97
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $170
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 83
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 0
align 1
LABELV $169
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 115
byte 1 79
byte 1 110
byte 1 108
byte 1 121
byte 1 0
align 1
LABELV $168
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 70
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $167
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $166
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
LABELV $165
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 79
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $164
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $163
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
LABELV $162
byte 1 99
byte 1 103
byte 1 95
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $161
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 72
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $160
byte 1 51
byte 1 48
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $159
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $158
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
LABELV $157
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
LABELV $156
byte 1 52
byte 1 48
byte 1 0
align 1
LABELV $155
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
LABELV $154
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 114
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $153
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 114
byte 1 119
byte 1 105
byte 1 100
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $152
byte 1 48
byte 1 46
byte 1 52
byte 1 0
align 1
LABELV $151
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 114
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $150
byte 1 99
byte 1 103
byte 1 95
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $149
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $148
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $147
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $146
byte 1 99
byte 1 103
byte 1 95
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 100
byte 1 101
byte 1 99
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $145
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $144
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 112
byte 1 111
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $143
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 0
align 1
LABELV $142
byte 1 99
byte 1 103
byte 1 95
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $141
byte 1 48
byte 1 46
byte 1 51
byte 1 0
align 1
LABELV $140
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 119
byte 1 105
byte 1 110
byte 1 103
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $139
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 98
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $138
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 98
byte 1 112
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $137
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 98
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $136
byte 1 48
byte 1 46
byte 1 48
byte 1 48
byte 1 53
byte 1 0
align 1
LABELV $135
byte 1 99
byte 1 103
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $134
byte 1 48
byte 1 46
byte 1 48
byte 1 48
byte 1 50
byte 1 0
align 1
LABELV $133
byte 1 99
byte 1 103
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 112
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $132
byte 1 51
byte 1 0
align 1
LABELV $131
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $130
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 110
byte 1 90
byte 1 0
align 1
LABELV $129
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 110
byte 1 89
byte 1 0
align 1
LABELV $128
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 110
byte 1 88
byte 1 0
align 1
LABELV $127
byte 1 99
byte 1 103
byte 1 95
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 84
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 82
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $126
byte 1 52
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $125
byte 1 99
byte 1 103
byte 1 95
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 84
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $124
byte 1 99
byte 1 103
byte 1 95
byte 1 108
byte 1 97
byte 1 103
byte 1 111
byte 1 109
byte 1 101
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $123
byte 1 99
byte 1 103
byte 1 95
byte 1 109
byte 1 97
byte 1 114
byte 1 107
byte 1 115
byte 1 0
align 1
LABELV $122
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 105
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $121
byte 1 50
byte 1 53
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $120
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 114
byte 1 97
byte 1 115
byte 1 115
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $119
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 89
byte 1 0
align 1
LABELV $118
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 88
byte 1 0
align 1
LABELV $117
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 72
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $116
byte 1 50
byte 1 52
byte 1 0
align 1
LABELV $115
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 83
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $114
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 83
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $113
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 82
byte 1 101
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $112
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $111
byte 1 52
byte 1 0
align 1
LABELV $110
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 0
align 1
LABELV $109
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $108
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 65
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $107
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 65
byte 1 109
byte 1 109
byte 1 111
byte 1 87
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $106
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 73
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $105
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 51
byte 1 100
byte 1 73
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $104
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $103
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 70
byte 1 80
byte 1 83
byte 1 0
align 1
LABELV $102
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $101
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 83
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $100
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 50
byte 1 68
byte 1 0
align 1
LABELV $99
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 0
align 1
LABELV $98
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 115
byte 1 0
align 1
LABELV $97
byte 1 49
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $96
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
LABELV $95
byte 1 57
byte 1 48
byte 1 0
align 1
LABELV $94
byte 1 99
byte 1 103
byte 1 95
byte 1 102
byte 1 111
byte 1 118
byte 1 0
align 1
LABELV $93
byte 1 50
byte 1 50
byte 1 46
byte 1 53
byte 1 0
align 1
LABELV $92
byte 1 99
byte 1 103
byte 1 95
byte 1 122
byte 1 111
byte 1 111
byte 1 109
byte 1 102
byte 1 111
byte 1 118
byte 1 0
align 1
LABELV $91
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 71
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $90
byte 1 49
byte 1 0
align 1
LABELV $89
byte 1 99
byte 1 103
byte 1 95
byte 1 97
byte 1 117
byte 1 116
byte 1 111
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $88
byte 1 48
byte 1 0
align 1
LABELV $87
byte 1 99
byte 1 103
byte 1 95
byte 1 105
byte 1 103
byte 1 110
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $84
byte 1 118
byte 1 109
byte 1 77
byte 1 97
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 0
