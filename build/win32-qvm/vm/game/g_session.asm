export G_WriteClientSessionData
code
proc G_WriteClientSessionData 20 32
file "..\..\..\..\code\game\g_session.c"
line 23
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "g_local.h"
;4:
;5:
;6:/*
;7:=======================================================================
;8:
;9:  SESSION DATA
;10:
;11:Session data is the only data that stays persistant across level loads
;12:and tournament restarts.
;13:=======================================================================
;14:*/
;15:
;16:/*
;17:================
;18:G_WriteClientSessionData
;19:
;20:Called on game shutdown
;21:================
;22:*/
;23:void G_WriteClientSessionData( gclient_t *client ) {
line 27
;24:	const char	*s;
;25:	const char	*var;
;26:
;27:	s = va("%i %i %i %i %i %i %i", 
ADDRGP4 $56
ARGP4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 644
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 648
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 37
;28:		client->sess.sessionTeam,
;29:		client->sess.spectatorTime,
;30:		client->sess.spectatorState,
;31:		client->sess.spectatorClient,
;32:		client->sess.wins,
;33:		client->sess.losses,
;34:		client->sess.teamLeader
;35:		);
;36:
;37:	var = va( "session%i", client - level.clients );
ADDRGP4 $57
ARGP4
ADDRFP4 0
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
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
ASGNP4
line 39
;38:
;39:	trap_Cvar_Set( var, s );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 40
;40:}
LABELV $55
endproc G_WriteClientSessionData 20 32
export G_ReadClientSessionData
proc G_ReadClientSessionData 1048 36
line 50
;41:
;42:
;43:/*
;44:================
;45:G_ReadSessionData
;46:
;47:Called on a reconnect
;48:================
;49:*/
;50:void G_ReadClientSessionData( gclient_t *client ) {
line 57
;51:	char	s[MAX_STRING_CHARS];
;52:	const char	*var;
;53:	int teamLeader;
;54:	int spectatorState;
;55:	int sessionTeam;
;56:
;57:	var = va( "session%i", client - level.clients );
ADDRGP4 $57
ARGP4
ADDRFP4 0
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
ADDRLP4 1040
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1024
ADDRLP4 1040
INDIRP4
ASGNP4
line 58
;58:	trap_Cvar_VariableStringBuffer( var, s, sizeof(s) );
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
line 60
;59:
;60:	Q_sscanf( s, "%i %i %i %i %i %i %i",
ADDRLP4 0
ARGP4
ADDRGP4 $56
ARGP4
ADDRLP4 1036
ARGP4
ADDRLP4 1044
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1044
INDIRP4
CNSTI4 628
ADDP4
ARGP4
ADDRLP4 1032
ARGP4
ADDRLP4 1044
INDIRP4
CNSTI4 636
ADDP4
ARGP4
ADDRLP4 1044
INDIRP4
CNSTI4 640
ADDP4
ARGP4
ADDRLP4 1044
INDIRP4
CNSTI4 644
ADDP4
ARGP4
ADDRLP4 1028
ARGP4
ADDRGP4 Q_sscanf
CALLI4
pop
line 70
;61:		&sessionTeam,
;62:		&client->sess.spectatorTime,
;63:		&spectatorState,
;64:		&client->sess.spectatorClient,
;65:		&client->sess.wins,
;66:		&client->sess.losses,
;67:		&teamLeader
;68:		);
;69:
;70:	client->sess.sessionTeam = (team_t)sessionTeam;
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
ADDRLP4 1036
INDIRI4
ASGNI4
line 71
;71:	client->sess.spectatorState = (spectatorState_t)spectatorState;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRLP4 1032
INDIRI4
ASGNI4
line 72
;72:	client->sess.teamLeader = (qboolean)teamLeader;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRLP4 1028
INDIRI4
ASGNI4
line 74
;73:
;74:	if ( (unsigned)client->sess.sessionTeam >= TEAM_NUM_TEAMS ) {
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CVIU4 4
CNSTU4 4
LTU4 $59
line 75
;75:		client->sess.sessionTeam = TEAM_SPECTATOR;
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 3
ASGNI4
line 76
;76:	}
LABELV $59
line 77
;77:}
LABELV $58
endproc G_ReadClientSessionData 1048 36
export G_ClearClientSessionData
proc G_ClearClientSessionData 8 8
line 86
;78:
;79:
;80:/*
;81:================
;82:G_ClearClientSessionData
;83:================
;84:*/
;85:void G_ClearClientSessionData( gclient_t *client )
;86:{
line 89
;87:	const char	*var;
;88:
;89:	var = va( "session%i", client - level.clients );
ADDRGP4 $57
ARGP4
ADDRFP4 0
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
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 90
;90:	trap_Cvar_Set( var, "" );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $62
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 91
;91:}
LABELV $61
endproc G_ClearClientSessionData 8 8
export G_InitSessionData
proc G_InitSessionData 20 4
line 101
;92:
;93:
;94:/*
;95:================
;96:G_InitSessionData
;97:
;98:Called on a first-time connect
;99:================
;100:*/
;101:void G_InitSessionData( gclient_t *client, const char *team, qboolean isBot ) {
line 104
;102:	clientSession_t	*sess;
;103:	
;104:	sess = &client->sess;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
ASGNP4
line 107
;105:
;106:	// initial team determination
;107:	if ( GTx( g_gametype.integer, GTF_TEAMS ) ) {
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
EQI4 $64
line 108
;108:		if ( team[0] == 's' || team[0] == 'S' ) {
ADDRLP4 4
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 115
EQI4 $70
ADDRLP4 4
INDIRI4
CNSTI4 83
NEI4 $68
LABELV $70
line 110
;109:			// a willing spectator, not a waiting-in-line
;110:			sess->sessionTeam = TEAM_SPECTATOR;
ADDRLP4 0
INDIRP4
CNSTI4 3
ASGNI4
line 111
;111:		} else {
ADDRGP4 $65
JUMPV
LABELV $68
line 112
;112:			if ( g_autoJoin.integer & 2 ) {
ADDRGP4 g_autoJoin+12
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $71
line 113
;113:				sess->sessionTeam = PickTeam( -1 );
CNSTI4 -1
ARGI4
ADDRLP4 8
ADDRGP4 PickTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ASGNI4
line 114
;114:			} else {
ADDRGP4 $65
JUMPV
LABELV $71
line 116
;115:				// always spawn as spectator in team games
;116:				if ( isBot == qfalse ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $74
line 117
;117:					sess->sessionTeam = TEAM_SPECTATOR;	
ADDRLP4 0
INDIRP4
CNSTI4 3
ASGNI4
line 118
;118:				} else  {
ADDRGP4 $65
JUMPV
LABELV $74
line 120
;119:					// bind player to specified team
;120:					if ( team[0] == 'r' || team[0] == 'R' ) {
ADDRLP4 8
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 114
EQI4 $78
ADDRLP4 8
INDIRI4
CNSTI4 82
NEI4 $76
LABELV $78
line 121
;121:						sess->sessionTeam = TEAM_RED;
ADDRLP4 0
INDIRP4
CNSTI4 1
ASGNI4
line 122
;122:					} else if ( team[0] == 'b' || team[0] == 'B' ) {
ADDRGP4 $65
JUMPV
LABELV $76
ADDRLP4 12
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 98
EQI4 $81
ADDRLP4 12
INDIRI4
CNSTI4 66
NEI4 $79
LABELV $81
line 123
;123:						sess->sessionTeam = TEAM_BLUE;
ADDRLP4 0
INDIRP4
CNSTI4 2
ASGNI4
line 124
;124:					} else {
ADDRGP4 $65
JUMPV
LABELV $79
line 126
;125:						// or choose new
;126:						sess->sessionTeam = PickTeam( -1 );
CNSTI4 -1
ARGI4
ADDRLP4 16
ADDRGP4 PickTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ASGNI4
line 127
;127:					}
line 128
;128:				}
line 129
;129:			}
line 130
;130:		}
line 131
;131:	} else {
ADDRGP4 $65
JUMPV
LABELV $64
line 132
;132:		if ( team[0] == 's' || team[0] == 'S' ) {
ADDRLP4 4
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 115
EQI4 $84
ADDRLP4 4
INDIRI4
CNSTI4 83
NEI4 $82
LABELV $84
line 134
;133:			// a willing spectator, not a waiting-in-line
;134:			sess->sessionTeam = TEAM_SPECTATOR;
ADDRLP4 0
INDIRP4
CNSTI4 3
ASGNI4
line 135
;135:		} else {
ADDRGP4 $83
JUMPV
LABELV $82
line 136
;136:			switch ( g_gametype.integer ) {
ADDRLP4 8
ADDRGP4 g_gametype+12
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $88
ADDRLP4 8
INDIRI4
CNSTI4 1
EQI4 $88
ADDRLP4 8
INDIRI4
CNSTI4 2
EQI4 $100
ADDRGP4 $85
JUMPV
LABELV $85
LABELV $88
line 140
;137:			default:
;138:			case GT_FFA:
;139:			case GT_CAMPAIGN:
;140:				if ( g_maxGameClients.integer > 0 && level.numNonSpectatorClients >= g_maxGameClients.integer ) {
ADDRGP4 g_maxGameClients+12
INDIRI4
CNSTI4 0
LEI4 $89
ADDRGP4 level+80
INDIRI4
ADDRGP4 g_maxGameClients+12
INDIRI4
LTI4 $89
line 141
;141:					sess->sessionTeam = TEAM_SPECTATOR;
ADDRLP4 0
INDIRP4
CNSTI4 3
ASGNI4
line 142
;142:				} else {
ADDRGP4 $86
JUMPV
LABELV $89
line 143
;143:					if ( g_autoJoin.integer & 1 || isBot || g_gametype.integer == GT_CAMPAIGN )
ADDRGP4 g_autoJoin+12
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $99
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $99
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
NEI4 $94
LABELV $99
line 144
;144:						sess->sessionTeam = TEAM_FREE;
ADDRLP4 0
INDIRP4
CNSTI4 0
ASGNI4
ADDRGP4 $86
JUMPV
LABELV $94
line 146
;145:					else
;146:						sess->sessionTeam = TEAM_SPECTATOR;
ADDRLP4 0
INDIRP4
CNSTI4 3
ASGNI4
line 147
;147:				}
line 148
;148:				break;
ADDRGP4 $86
JUMPV
LABELV $100
line 151
;149:			case GT_DUEL:
;150:				// if the game is full, go into a waiting mode
;151:				if ( level.numNonSpectatorClients >= 2 ) {
ADDRGP4 level+80
INDIRI4
CNSTI4 2
LTI4 $101
line 152
;152:					sess->sessionTeam = TEAM_SPECTATOR;
ADDRLP4 0
INDIRP4
CNSTI4 3
ASGNI4
line 153
;153:				} else {
ADDRGP4 $86
JUMPV
LABELV $101
line 154
;154:					if ( g_autoJoin.integer & 1 || isBot )
ADDRGP4 g_autoJoin+12
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $107
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $104
LABELV $107
line 155
;155:						sess->sessionTeam = TEAM_FREE;
ADDRLP4 0
INDIRP4
CNSTI4 0
ASGNI4
ADDRGP4 $86
JUMPV
LABELV $104
line 157
;156:					else
;157:						sess->sessionTeam = TEAM_SPECTATOR;
ADDRLP4 0
INDIRP4
CNSTI4 3
ASGNI4
line 158
;158:				}
line 159
;159:				break;
LABELV $86
line 161
;160:			}
;161:		}
LABELV $83
line 162
;162:	}
LABELV $65
line 164
;163:
;164:	sess->spectatorState = SPECTATOR_FREE;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 1
ASGNI4
line 165
;165:	sess->spectatorTime = 0;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 166
;166:}
LABELV $63
endproc G_InitSessionData 20 4
export G_InitWorldSession
proc G_InitWorldSession 1032 12
line 175
;167:
;168:
;169:/*
;170:==================
;171:G_InitWorldSession
;172:
;173:==================
;174:*/
;175:void G_InitWorldSession( void ) {
line 179
;176:	char	s[MAX_STRING_CHARS];
;177:	int			gt;
;178:
;179:	trap_Cvar_VariableStringBuffer( "session", s, sizeof(s) );
ADDRGP4 $109
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 180
;180:	gt = atoi( s );
ADDRLP4 0
ARGP4
ADDRLP4 1028
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1024
ADDRLP4 1028
INDIRI4
ASGNI4
line 184
;181:	
;182:	// if the gametype changed since the last session, don't use any
;183:	// client sessions
;184:	if ( !*s || g_gametype.integer != gt ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $113
ADDRGP4 g_gametype+12
INDIRI4
ADDRLP4 1024
INDIRI4
EQI4 $110
LABELV $113
line 185
;185:		level.newSession = qtrue;
ADDRGP4 level+68
CNSTI4 1
ASGNI4
line 186
;186:		G_Printf( "Gametype changed, clearing session data.\n" );
ADDRGP4 $115
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 187
;187:	}
LABELV $110
line 188
;188:}
LABELV $108
endproc G_InitWorldSession 1032 12
export G_WriteSessionData
proc G_WriteSessionData 8 8
line 197
;189:
;190:
;191:/*
;192:==================
;193:G_WriteSessionData
;194:
;195:==================
;196:*/
;197:void G_WriteSessionData( void ) {
line 200
;198:	int		i;
;199:
;200:	trap_Cvar_Set( "session", va("%i", g_gametype.integer) );
ADDRGP4 $117
ARGP4
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $109
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 202
;201:
;202:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $122
JUMPV
LABELV $119
line 203
;203:		if ( level.clients[i].pers.connected != CON_DISCONNECTED ) {
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
EQI4 $124
line 204
;204:			G_WriteClientSessionData( &level.clients[i] );
ADDRLP4 0
INDIRI4
CNSTI4 1636
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ARGP4
ADDRGP4 G_WriteClientSessionData
CALLV
pop
line 205
;205:		}
LABELV $124
line 206
;206:	}
LABELV $120
line 202
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $122
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $119
line 207
;207:}
LABELV $116
endproc G_WriteSessionData 8 8
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
LABELV $117
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $115
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 99
byte 1 108
byte 1 101
byte 1 97
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 100
byte 1 97
byte 1 116
byte 1 97
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $109
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $62
byte 1 0
align 1
LABELV $57
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
LABELV $56
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
byte 1 0
