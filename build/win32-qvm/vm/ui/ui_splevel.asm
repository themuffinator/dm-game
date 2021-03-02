code
proc PlayerIcon 80 20
file "..\..\..\..\code\q3_ui\ui_splevel.c"
line 108
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=============================================================================
;5:
;6:SINGLE PLAYER LEVEL SELECT MENU
;7:
;8:=============================================================================
;9:*/
;10:
;11:#include "ui_local.h"
;12:
;13:
;14:#define ART_LEVELFRAME_FOCUS		"menu/art/maps_select"
;15:#define ART_LEVELFRAME_SELECTED		"menu/art/maps_selected"
;16:#define ART_ARROW					"menu/art/narrow_0"
;17:#define ART_ARROW_FOCUS				"menu/art/narrow_1"
;18:#define ART_MAP_UNKNOWN				"menu/art/unknownmap"
;19:#define ART_MAP_COMPLETE1			"menu/art/level_complete1"
;20:#define ART_MAP_COMPLETE2			"menu/art/level_complete2"
;21:#define ART_MAP_COMPLETE3			"menu/art/level_complete3"
;22:#define ART_MAP_COMPLETE4			"menu/art/level_complete4"
;23:#define ART_MAP_COMPLETE5			"menu/art/level_complete5"
;24:#define ART_BACK0					"menu/art/back_0"
;25:#define ART_BACK1					"menu/art/back_1"	
;26:#define ART_FIGHT0					"menu/art/fight_0"
;27:#define ART_FIGHT1					"menu/art/fight_1"
;28:#define ART_RESET0					"menu/art/reset_0"
;29:#define ART_RESET1					"menu/art/reset_1"	
;30:#define ART_CUSTOM0					"menu/art/skirmish_0"
;31:#define ART_CUSTOM1					"menu/art/skirmish_1"
;32:
;33:#define ID_LEFTARROW		10
;34:#define ID_PICTURE0			11
;35:#define ID_PICTURE1			12
;36:#define ID_PICTURE2			13
;37:#define ID_PICTURE3			14
;38:#define ID_RIGHTARROW		15
;39:#define ID_PLAYERPIC		16
;40:#define ID_AWARD1			17
;41:#define ID_AWARD2			18
;42:#define ID_AWARD3			19
;43:#define ID_AWARD4			20
;44:#define ID_AWARD5			21
;45:#define ID_AWARD6			22
;46:#define ID_BACK				23
;47:#define ID_RESET			24
;48:#define ID_CUSTOM			25
;49:#define ID_NEXT				26
;50:
;51:#define PLAYER_Y			314
;52:#define AWARDS_Y			(PLAYER_Y + 26)
;53:
;54:
;55:typedef struct {
;56:	menuframework_s	menu;
;57:	menutext_s		item_banner;
;58:	menubitmap_s	item_leftarrow;
;59:	menubitmap_s	item_maps[4];
;60:	menubitmap_s	item_rightarrow;
;61:	menubitmap_s	item_player;
;62:	menubitmap_s	item_awards[6];
;63:	menubitmap_s	item_back;
;64:	menubitmap_s	item_reset;
;65:	menubitmap_s	item_custom;
;66:	menubitmap_s	item_next;
;67:	menubitmap_s	item_null;
;68:
;69:	qboolean		reinit;
;70:
;71:	const char *	selectedArenaInfo;
;72:	int				numMaps;
;73:	char			levelPicNames[4][MAX_QPATH];
;74:	char			levelNames[4][16];
;75:	int				levelScores[4];
;76:	int				levelScoresSkill[4];
;77:	qhandle_t		levelSelectedPic;
;78:	qhandle_t		levelFocusPic;
;79:	qhandle_t		levelCompletePic[5];
;80:
;81:	char			playerModel[MAX_QPATH];
;82:	char			playerPicName[MAX_QPATH];
;83:	int				awardLevels[6];
;84:	sfxHandle_t		awardSounds[6];
;85:
;86:	int				numBots;
;87:	qhandle_t		botPics[7];
;88:	char			botNames[7][10];
;89:} levelMenuInfo_t;
;90:
;91:static levelMenuInfo_t	levelMenuInfo;
;92:
;93:static int	selectedArenaSet;
;94:static int	selectedArena;
;95:static int	currentSet;
;96:static int	currentGame;
;97:static int	trainingTier;
;98:static int	finalTier;
;99:static int	minTier;
;100:static int	maxTier;
;101:
;102:
;103:/*
;104:=================
;105:PlayerIcon
;106:=================
;107:*/
;108:static void PlayerIcon( const char *modelAndSkin, char *iconName, int iconNameMaxSize ) {
line 112
;109:	char	*skin;
;110:	char	model[MAX_QPATH];
;111:
;112:	Q_strncpyz( model, modelAndSkin, sizeof(model));
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 113
;113:	skin = Q_strrchr( model, '/' );
ADDRLP4 4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 68
ADDRGP4 Q_strrchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 68
INDIRP4
ASGNP4
line 114
;114:	if ( skin ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $71
line 115
;115:		*skin++ = '\0';
ADDRLP4 72
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 72
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI1 0
ASGNI1
line 116
;116:	}
ADDRGP4 $72
JUMPV
LABELV $71
line 117
;117:	else {
line 118
;118:		skin = "default";
ADDRLP4 0
ADDRGP4 $73
ASGNP4
line 119
;119:	}
LABELV $72
line 121
;120:
;121:	Com_sprintf(iconName, iconNameMaxSize, "models/players/%s/icon_%s.tga", model, skin );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $74
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 123
;122:
;123:	if( !trap_R_RegisterShaderNoMip( iconName ) && Q_stricmp( skin, "default" ) != 0 ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $75
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $73
ARGP4
ADDRLP4 76
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $75
line 124
;124:		Com_sprintf(iconName, iconNameMaxSize, "models/players/%s/icon_default.tga", model );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $77
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 125
;125:	}
LABELV $75
line 126
;126:}
LABELV $70
endproc PlayerIcon 80 20
proc PlayerIconHandle 68 12
line 134
;127:
;128:
;129:/*
;130:=================
;131:PlayerIconhandle
;132:=================
;133:*/
;134:static qhandle_t PlayerIconHandle( const char *modelAndSkin ) {
line 137
;135:	char	iconName[MAX_QPATH];
;136:
;137:	PlayerIcon( modelAndSkin, iconName, sizeof(iconName) );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 PlayerIcon
CALLV
pop
line 138
;138:	return trap_R_RegisterShaderNoMip( iconName );
ADDRLP4 0
ARGP4
ADDRLP4 64
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
RETI4
LABELV $78
endproc PlayerIconHandle 68 12
proc UI_SPLevelMenu_SetBots 1060 12
line 147
;139:}
;140:
;141:
;142:/*
;143:=================
;144:UI_SPLevelMenu_SetBots
;145:=================
;146:*/
;147:static void UI_SPLevelMenu_SetBots( void ) {
line 153
;148:	char	*p;
;149:	char	*bot;
;150:	char	*botInfo;
;151:	char	bots[MAX_INFO_STRING];
;152:
;153:	levelMenuInfo.numBots = 0;
ADDRGP4 levelMenuInfo+2588
CNSTI4 0
ASGNI4
line 154
;154:	if ( selectedArenaSet > currentSet ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 currentSet
INDIRI4
LEI4 $81
line 155
;155:		return;
ADDRGP4 $79
JUMPV
LABELV $81
line 158
;156:	}
;157:
;158:	Q_strncpyz( bots, Info_ValueForKey( levelMenuInfo.selectedArenaInfo, "bots" ), sizeof(bots) );
ADDRGP4 levelMenuInfo+2024
INDIRP4
ARGP4
ADDRGP4 $84
ARGP4
ADDRLP4 1036
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 12
ARGP4
ADDRLP4 1036
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 160
;159:
;160:	p = &bots[0];
ADDRLP4 0
ADDRLP4 12
ASGNP4
ADDRGP4 $86
JUMPV
line 161
;161:	while( *p && levelMenuInfo.numBots < 7 ) {
LABELV $89
line 163
;162:		//skip spaces
;163:		while( *p == ' ' ) {
line 164
;164:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 165
;165:		}
LABELV $90
line 163
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $89
line 166
;166:		if( !*p ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $92
line 167
;167:			break;
ADDRGP4 $87
JUMPV
LABELV $92
line 171
;168:		}
;169:
;170:		// mark start of bot name
;171:		bot = p;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $95
JUMPV
LABELV $94
line 174
;172:
;173:		// skip until space of null
;174:		while( *p && *p != ' ' ) {
line 175
;175:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 176
;176:		}
LABELV $95
line 174
ADDRLP4 1040
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
EQI4 $97
ADDRLP4 1040
INDIRI4
CNSTI4 32
NEI4 $94
LABELV $97
line 177
;177:		if( *p ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $98
line 178
;178:			*p++ = 0;
ADDRLP4 1044
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 1044
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 1044
INDIRP4
CNSTI1 0
ASGNI1
line 179
;179:		}
LABELV $98
line 181
;180:
;181:		botInfo = UI_GetBotInfoByName( bot );
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1044
ADDRGP4 UI_GetBotInfoByName
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 1044
INDIRP4
ASGNP4
line 182
;182:		if( botInfo ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $100
line 183
;183:			levelMenuInfo.botPics[levelMenuInfo.numBots] = PlayerIconHandle( Info_ValueForKey( botInfo, "model" ) );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $104
ARGP4
ADDRLP4 1048
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRLP4 1052
ADDRGP4 PlayerIconHandle
CALLI4
ASGNI4
ADDRGP4 levelMenuInfo+2588
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2592
ADDP4
ADDRLP4 1052
INDIRI4
ASGNI4
line 184
;184:			Q_strncpyz( levelMenuInfo.botNames[levelMenuInfo.numBots], Info_ValueForKey( botInfo, "name" ), 10 );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $107
ARGP4
ADDRLP4 1056
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 levelMenuInfo+2588
INDIRI4
CNSTI4 10
MULI4
ADDRGP4 levelMenuInfo+2620
ADDP4
ARGP4
ADDRLP4 1056
INDIRP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 185
;185:		}
ADDRGP4 $101
JUMPV
LABELV $100
line 186
;186:		else {
line 187
;187:			levelMenuInfo.botPics[levelMenuInfo.numBots] = 0;
ADDRGP4 levelMenuInfo+2588
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2592
ADDP4
CNSTI4 0
ASGNI4
line 188
;188:			Q_strncpyz( levelMenuInfo.botNames[levelMenuInfo.numBots], bot, 10 );
ADDRGP4 levelMenuInfo+2588
INDIRI4
CNSTI4 10
MULI4
ADDRGP4 levelMenuInfo+2620
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 189
;189:		}
LABELV $101
line 190
;190:		Q_CleanStr( levelMenuInfo.botNames[levelMenuInfo.numBots] );
ADDRGP4 levelMenuInfo+2588
INDIRI4
CNSTI4 10
MULI4
ADDRGP4 levelMenuInfo+2620
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 191
;191:		levelMenuInfo.numBots++;
ADDRLP4 1048
ADDRGP4 levelMenuInfo+2588
ASGNP4
ADDRLP4 1048
INDIRP4
ADDRLP4 1048
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 192
;192:	}
LABELV $86
line 161
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $115
ADDRGP4 levelMenuInfo+2588
INDIRI4
CNSTI4 7
LTI4 $90
LABELV $115
LABELV $87
line 193
;193:}
LABELV $79
endproc UI_SPLevelMenu_SetBots 1060 12
proc UI_SPLevelMenu_SetMenuArena 80 16
line 201
;194:
;195:
;196:/*
;197:=================
;198:UI_SPLevelMenu_SetMenuItems
;199:=================
;200:*/
;201:static void UI_SPLevelMenu_SetMenuArena( int n, int level, const char *arenaInfo ) {
line 204
;202:	char		map[MAX_QPATH];
;203:
;204:	Q_strncpyz( map, Info_ValueForKey( arenaInfo, "map" ), sizeof(map) );
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 $117
ARGP4
ADDRLP4 64
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 206
;205:
;206:	Q_strncpyz( levelMenuInfo.levelNames[n], map, sizeof(levelMenuInfo.levelNames[n]) );
ADDRFP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 levelMenuInfo+2288
ADDP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 207
;207:	Q_strupr( levelMenuInfo.levelNames[n] );
ADDRFP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 levelMenuInfo+2288
ADDP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 209
;208:
;209:	UI_GetBestScore( level, &levelMenuInfo.levelScores[n], &levelMenuInfo.levelScoresSkill[n] );
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 68
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2352
ADDP4
ARGP4
ADDRLP4 68
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2368
ADDP4
ARGP4
ADDRGP4 UI_GetBestScore
CALLV
pop
line 210
;210:	if( levelMenuInfo.levelScores[n] > 8 ) {
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2352
ADDP4
INDIRI4
CNSTI4 8
LEI4 $123
line 211
;211:		levelMenuInfo.levelScores[n] = 8;
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2352
ADDP4
CNSTI4 8
ASGNI4
line 212
;212:	}
LABELV $123
line 214
;213:
;214:	Com_sprintf( levelMenuInfo.levelPicNames[n], sizeof( levelMenuInfo.levelPicNames[n] ), "levelshots/%s.tga", map );
ADDRFP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 levelMenuInfo+2032
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $129
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 215
;215:	if( !trap_R_RegisterShaderNoMip( levelMenuInfo.levelPicNames[n] ) ) {
ADDRFP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 levelMenuInfo+2032
ADDP4
ARGP4
ADDRLP4 72
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $130
line 216
;216:		strcpy( levelMenuInfo.levelPicNames[n], ART_MAP_UNKNOWN );
ADDRFP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 levelMenuInfo+2032
ADDP4
ARGP4
ADDRGP4 $134
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 217
;217:	}
LABELV $130
line 218
;218:	levelMenuInfo.item_maps[n].shader = 0;
ADDRFP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 levelMenuInfo+456+72
ADDP4
CNSTI4 0
ASGNI4
line 219
;219:	if ( selectedArenaSet > currentSet ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 currentSet
INDIRI4
LEI4 $137
line 220
;220:		levelMenuInfo.item_maps[n].generic.flags |= QMF_GRAYED;
ADDRLP4 76
ADDRFP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 levelMenuInfo+456+44
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 221
;221:	}
ADDRGP4 $138
JUMPV
LABELV $137
line 222
;222:	else {
line 223
;223:		levelMenuInfo.item_maps[n].generic.flags &= ~QMF_GRAYED;
ADDRLP4 76
ADDRFP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 levelMenuInfo+456+44
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 224
;224:	}
LABELV $138
line 226
;225:
;226:	levelMenuInfo.item_maps[n].generic.flags &= ~QMF_INACTIVE;
ADDRLP4 76
ADDRFP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 levelMenuInfo+456+44
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
line 227
;227:}
LABELV $116
endproc UI_SPLevelMenu_SetMenuArena 80 16
proc UI_SPLevelMenu_SetMenuItems 44 12
line 229
;228:
;229:static void UI_SPLevelMenu_SetMenuItems( void ) {
line 234
;230:	int			n;
;231:	int			level;
;232:	const char	*arenaInfo;
;233:
;234:	if ( selectedArenaSet > currentSet ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 currentSet
INDIRI4
LEI4 $146
line 235
;235:		selectedArena = -1;
ADDRGP4 selectedArena
CNSTI4 -1
ASGNI4
line 236
;236:	}
ADDRGP4 $147
JUMPV
LABELV $146
line 237
;237:	else if ( selectedArena == -1 ) {
ADDRGP4 selectedArena
INDIRI4
CNSTI4 -1
NEI4 $148
line 238
;238:		selectedArena = 0;
ADDRGP4 selectedArena
CNSTI4 0
ASGNI4
line 239
;239:	}
LABELV $148
LABELV $147
line 241
;240:
;241:	if( selectedArenaSet == trainingTier || selectedArenaSet == finalTier ) {
ADDRLP4 12
ADDRGP4 selectedArenaSet
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 trainingTier
INDIRI4
EQI4 $152
ADDRLP4 12
INDIRI4
ADDRGP4 finalTier
INDIRI4
NEI4 $150
LABELV $152
line 242
;242:		selectedArena = 0;
ADDRGP4 selectedArena
CNSTI4 0
ASGNI4
line 243
;243:	}
LABELV $150
line 245
;244:
;245:	if( selectedArena != -1 ) {
ADDRGP4 selectedArena
INDIRI4
CNSTI4 -1
EQI4 $153
line 246
;246:		trap_Cvar_SetValue( "ui_spSelection", selectedArenaSet * ARENAS_PER_TIER + selectedArena );
ADDRGP4 $155
ARGP4
ADDRGP4 selectedArenaSet
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 selectedArena
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 247
;247:	}
LABELV $153
line 249
;248:
;249:	if( selectedArenaSet == trainingTier ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 trainingTier
INDIRI4
NEI4 $156
line 250
;250:		arenaInfo = UI_GetSpecialArenaInfo( "training" );
ADDRGP4 $158
ARGP4
ADDRLP4 16
ADDRGP4 UI_GetSpecialArenaInfo
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 251
;251:		level = atoi( Info_ValueForKey( arenaInfo, "num" ) );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $159
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 24
INDIRI4
ASGNI4
line 252
;252:		UI_SPLevelMenu_SetMenuArena( 0, level, arenaInfo );
CNSTI4 0
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 UI_SPLevelMenu_SetMenuArena
CALLV
pop
line 253
;253:		levelMenuInfo.selectedArenaInfo = arenaInfo;
ADDRGP4 levelMenuInfo+2024
ADDRLP4 8
INDIRP4
ASGNP4
line 255
;254:
;255:		levelMenuInfo.item_maps[0].generic.x = 256;
ADDRGP4 levelMenuInfo+456+12
CNSTI4 256
ASGNI4
line 256
;256:		Bitmap_Init( &levelMenuInfo.item_maps[0] );
ADDRGP4 levelMenuInfo+456
ARGP4
ADDRGP4 Bitmap_Init
CALLV
pop
line 257
;257:		levelMenuInfo.item_maps[0].generic.bottom += 32;
ADDRLP4 28
ADDRGP4 levelMenuInfo+456+32
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 32
ADDI4
ASGNI4
line 258
;258:		levelMenuInfo.numMaps = 1;
ADDRGP4 levelMenuInfo+2028
CNSTI4 1
ASGNI4
line 260
;259:
;260:		levelMenuInfo.item_maps[1].generic.flags |= QMF_INACTIVE;
ADDRLP4 32
ADDRGP4 levelMenuInfo+456+92+44
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 261
;261:		levelMenuInfo.item_maps[2].generic.flags |= QMF_INACTIVE;
ADDRLP4 36
ADDRGP4 levelMenuInfo+456+184+44
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 262
;262:		levelMenuInfo.item_maps[3].generic.flags |= QMF_INACTIVE;
ADDRLP4 40
ADDRGP4 levelMenuInfo+456+276+44
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 263
;263:		levelMenuInfo.levelPicNames[1][0] = 0;
ADDRGP4 levelMenuInfo+2032+64
CNSTI1 0
ASGNI1
line 264
;264:		levelMenuInfo.levelPicNames[2][0] = 0;
ADDRGP4 levelMenuInfo+2032+128
CNSTI1 0
ASGNI1
line 265
;265:		levelMenuInfo.levelPicNames[3][0] = 0;
ADDRGP4 levelMenuInfo+2032+192
CNSTI1 0
ASGNI1
line 266
;266:		levelMenuInfo.item_maps[1].shader = 0;
ADDRGP4 levelMenuInfo+456+92+72
CNSTI4 0
ASGNI4
line 267
;267:		levelMenuInfo.item_maps[2].shader = 0;
ADDRGP4 levelMenuInfo+456+184+72
CNSTI4 0
ASGNI4
line 268
;268:		levelMenuInfo.item_maps[3].shader = 0;
ADDRGP4 levelMenuInfo+456+276+72
CNSTI4 0
ASGNI4
line 269
;269:	}
ADDRGP4 $157
JUMPV
LABELV $156
line 270
;270:	else if( selectedArenaSet == finalTier ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 finalTier
INDIRI4
NEI4 $191
line 271
;271:		arenaInfo = UI_GetSpecialArenaInfo( "final" );
ADDRGP4 $193
ARGP4
ADDRLP4 16
ADDRGP4 UI_GetSpecialArenaInfo
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 272
;272:		level = atoi( Info_ValueForKey( arenaInfo, "num" ) );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $159
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 24
INDIRI4
ASGNI4
line 273
;273:		UI_SPLevelMenu_SetMenuArena( 0, level, arenaInfo );
CNSTI4 0
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 UI_SPLevelMenu_SetMenuArena
CALLV
pop
line 274
;274:		levelMenuInfo.selectedArenaInfo = arenaInfo;
ADDRGP4 levelMenuInfo+2024
ADDRLP4 8
INDIRP4
ASGNP4
line 276
;275:
;276:		levelMenuInfo.item_maps[0].generic.x = 256;
ADDRGP4 levelMenuInfo+456+12
CNSTI4 256
ASGNI4
line 277
;277:		Bitmap_Init( &levelMenuInfo.item_maps[0] );
ADDRGP4 levelMenuInfo+456
ARGP4
ADDRGP4 Bitmap_Init
CALLV
pop
line 278
;278:		levelMenuInfo.item_maps[0].generic.bottom += 32;
ADDRLP4 28
ADDRGP4 levelMenuInfo+456+32
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 32
ADDI4
ASGNI4
line 279
;279:		levelMenuInfo.numMaps = 1;
ADDRGP4 levelMenuInfo+2028
CNSTI4 1
ASGNI4
line 281
;280:
;281:		levelMenuInfo.item_maps[1].generic.flags |= QMF_INACTIVE;
ADDRLP4 32
ADDRGP4 levelMenuInfo+456+92+44
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 282
;282:		levelMenuInfo.item_maps[2].generic.flags |= QMF_INACTIVE;
ADDRLP4 36
ADDRGP4 levelMenuInfo+456+184+44
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 283
;283:		levelMenuInfo.item_maps[3].generic.flags |= QMF_INACTIVE;
ADDRLP4 40
ADDRGP4 levelMenuInfo+456+276+44
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 284
;284:		levelMenuInfo.levelPicNames[1][0] = 0;
ADDRGP4 levelMenuInfo+2032+64
CNSTI1 0
ASGNI1
line 285
;285:		levelMenuInfo.levelPicNames[2][0] = 0;
ADDRGP4 levelMenuInfo+2032+128
CNSTI1 0
ASGNI1
line 286
;286:		levelMenuInfo.levelPicNames[3][0] = 0;
ADDRGP4 levelMenuInfo+2032+192
CNSTI1 0
ASGNI1
line 287
;287:		levelMenuInfo.item_maps[1].shader = 0;
ADDRGP4 levelMenuInfo+456+92+72
CNSTI4 0
ASGNI4
line 288
;288:		levelMenuInfo.item_maps[2].shader = 0;
ADDRGP4 levelMenuInfo+456+184+72
CNSTI4 0
ASGNI4
line 289
;289:		levelMenuInfo.item_maps[3].shader = 0;
ADDRGP4 levelMenuInfo+456+276+72
CNSTI4 0
ASGNI4
line 290
;290:	}
ADDRGP4 $192
JUMPV
LABELV $191
line 291
;291:	else {
line 292
;292:		levelMenuInfo.item_maps[0].generic.x = 46;
ADDRGP4 levelMenuInfo+456+12
CNSTI4 46
ASGNI4
line 293
;293:		Bitmap_Init( &levelMenuInfo.item_maps[0] );
ADDRGP4 levelMenuInfo+456
ARGP4
ADDRGP4 Bitmap_Init
CALLV
pop
line 294
;294:		levelMenuInfo.item_maps[0].generic.bottom += 18;
ADDRLP4 16
ADDRGP4 levelMenuInfo+456+32
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 295
;295:		levelMenuInfo.numMaps = 4;
ADDRGP4 levelMenuInfo+2028
CNSTI4 4
ASGNI4
line 297
;296:
;297:		for ( n = 0; n < 4; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $231
line 298
;298:			level = selectedArenaSet * ARENAS_PER_TIER + n;
ADDRLP4 4
ADDRGP4 selectedArenaSet
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 299
;299:			arenaInfo = UI_GetArenaInfoByNumber( level );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
ASGNP4
line 300
;300:			UI_SPLevelMenu_SetMenuArena( n, level, arenaInfo );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 UI_SPLevelMenu_SetMenuArena
CALLV
pop
line 301
;301:		}
LABELV $232
line 297
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $231
line 303
;302:
;303:		if( selectedArena != -1 ) {
ADDRGP4 selectedArena
INDIRI4
CNSTI4 -1
EQI4 $235
line 304
;304:			levelMenuInfo.selectedArenaInfo = UI_GetArenaInfoByNumber( selectedArenaSet * ARENAS_PER_TIER + selectedArena );
ADDRGP4 selectedArenaSet
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 selectedArena
INDIRI4
ADDI4
ARGI4
ADDRLP4 20
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRGP4 levelMenuInfo+2024
ADDRLP4 20
INDIRP4
ASGNP4
line 305
;305:		}
LABELV $235
line 306
;306:	}
LABELV $192
LABELV $157
line 309
;307:
;308:	// enable/disable arrows when they are valid/invalid
;309:	if ( selectedArenaSet == minTier ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 minTier
INDIRI4
NEI4 $238
line 310
;310:		levelMenuInfo.item_leftarrow.generic.flags |= ( QMF_INACTIVE | QMF_HIDDEN );
ADDRLP4 16
ADDRGP4 levelMenuInfo+364+44
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 311
;311:	}
ADDRGP4 $239
JUMPV
LABELV $238
line 312
;312:	else {
line 313
;313:		levelMenuInfo.item_leftarrow.generic.flags &= ~( QMF_INACTIVE | QMF_HIDDEN );
ADDRLP4 16
ADDRGP4 levelMenuInfo+364+44
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 314
;314:	}
LABELV $239
line 316
;315:
;316:	if ( selectedArenaSet == maxTier ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 maxTier
INDIRI4
NEI4 $244
line 317
;317:		levelMenuInfo.item_rightarrow.generic.flags |= ( QMF_INACTIVE | QMF_HIDDEN );
ADDRLP4 16
ADDRGP4 levelMenuInfo+824+44
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 318
;318:	}
ADDRGP4 $245
JUMPV
LABELV $244
line 319
;319:	else {
line 320
;320:		levelMenuInfo.item_rightarrow.generic.flags &= ~( QMF_INACTIVE | QMF_HIDDEN );
ADDRLP4 16
ADDRGP4 levelMenuInfo+824+44
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 321
;321:	}
LABELV $245
line 323
;322:
;323:	UI_SPLevelMenu_SetBots();
ADDRGP4 UI_SPLevelMenu_SetBots
CALLV
pop
line 324
;324:}
LABELV $145
endproc UI_SPLevelMenu_SetMenuItems 44 12
proc UI_SPLevelMenu_ResetDraw 0 20
line 332
;325:
;326:
;327:/*
;328:=================
;329:UI_SPLevelMenu_ResetEvent
;330:=================
;331:*/
;332:static void UI_SPLevelMenu_ResetDraw( void ) {
line 333
;333:	UI_DrawProportionalString( SCREEN_WIDTH/2, 356 + PROP_HEIGHT * 0, "WARNING: This resets all of the", UI_CENTER|UI_SMALLFONT, color_yellow );
CNSTI4 320
ARGI4
CNSTI4 356
ARGI4
ADDRGP4 $251
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 334
;334:	UI_DrawProportionalString( SCREEN_WIDTH/2, 356 + PROP_HEIGHT * 1, "single player game variables.", UI_CENTER|UI_SMALLFONT, color_yellow );
CNSTI4 320
ARGI4
CNSTI4 383
ARGI4
ADDRGP4 $252
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 335
;335:	UI_DrawProportionalString( SCREEN_WIDTH/2, 356 + PROP_HEIGHT * 2, "Do this only if you want to", UI_CENTER|UI_SMALLFONT, color_yellow );
CNSTI4 320
ARGI4
CNSTI4 410
ARGI4
ADDRGP4 $253
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 336
;336:	UI_DrawProportionalString( SCREEN_WIDTH/2, 356 + PROP_HEIGHT * 3, "start over from the beginning.", UI_CENTER|UI_SMALLFONT, color_yellow );
CNSTI4 320
ARGI4
CNSTI4 437
ARGI4
ADDRGP4 $254
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 337
;337:}
LABELV $250
endproc UI_SPLevelMenu_ResetDraw 0 20
proc UI_SPLevelMenu_ResetAction 0 8
line 339
;338:
;339:static void UI_SPLevelMenu_ResetAction( qboolean result ) {
line 340
;340:	if( !result ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $256
line 341
;341:		return;
ADDRGP4 $255
JUMPV
LABELV $256
line 345
;342:	}
;343:
;344:	// clear game variables
;345:	UI_NewGame();
ADDRGP4 UI_NewGame
CALLV
pop
line 346
;346:	trap_Cvar_SetValue( "ui_spSelection", -4 );
ADDRGP4 $155
ARGP4
CNSTF4 3229614080
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 349
;347:
;348:	// make the level select menu re-initialize
;349:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 350
;350:	UI_SPLevelMenu();
ADDRGP4 UI_SPLevelMenu
CALLV
pop
line 351
;351:}
LABELV $255
endproc UI_SPLevelMenu_ResetAction 0 8
proc UI_SPLevelMenu_ResetEvent 0 12
line 354
;352:
;353:static void UI_SPLevelMenu_ResetEvent( void* ptr, int event )
;354:{
line 355
;355:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $259
line 356
;356:		return;
ADDRGP4 $258
JUMPV
LABELV $259
line 359
;357:	}
;358:
;359:	UI_ConfirmMenu( "RESET GAME?", UI_SPLevelMenu_ResetDraw, UI_SPLevelMenu_ResetAction );
ADDRGP4 $261
ARGP4
ADDRGP4 UI_SPLevelMenu_ResetDraw
ARGP4
ADDRGP4 UI_SPLevelMenu_ResetAction
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 360
;360:}
LABELV $258
endproc UI_SPLevelMenu_ResetEvent 0 12
proc UI_SPLevelMenu_LevelEvent 8 8
line 368
;361:
;362:
;363:/*
;364:=================
;365:UI_SPLevelMenu_LevelEvent
;366:=================
;367:*/
;368:static void UI_SPLevelMenu_LevelEvent( void* ptr, int notification ) {
line 369
;369:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $263
line 370
;370:		return;
ADDRGP4 $262
JUMPV
LABELV $263
line 373
;371:	}
;372:
;373:	if ( selectedArenaSet == trainingTier || selectedArenaSet == finalTier ) {
ADDRLP4 0
ADDRGP4 selectedArenaSet
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRGP4 trainingTier
INDIRI4
EQI4 $267
ADDRLP4 0
INDIRI4
ADDRGP4 finalTier
INDIRI4
NEI4 $265
LABELV $267
line 374
;374:		return;
ADDRGP4 $262
JUMPV
LABELV $265
line 377
;375:	}
;376:
;377:	selectedArena = ((menucommon_s*)ptr)->id - ID_PICTURE0;
ADDRGP4 selectedArena
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 11
SUBI4
ASGNI4
line 378
;378:	levelMenuInfo.selectedArenaInfo = UI_GetArenaInfoByNumber( selectedArenaSet * ARENAS_PER_TIER + selectedArena );
ADDRGP4 selectedArenaSet
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 selectedArena
INDIRI4
ADDI4
ARGI4
ADDRLP4 4
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRGP4 levelMenuInfo+2024
ADDRLP4 4
INDIRP4
ASGNP4
line 379
;379:	UI_SPLevelMenu_SetBots();
ADDRGP4 UI_SPLevelMenu_SetBots
CALLV
pop
line 381
;380:
;381:	trap_Cvar_SetValue( "ui_spSelection", selectedArenaSet * ARENAS_PER_TIER + selectedArena );
ADDRGP4 $155
ARGP4
ADDRGP4 selectedArenaSet
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 selectedArena
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 382
;382:}
LABELV $262
endproc UI_SPLevelMenu_LevelEvent 8 8
proc UI_SPLevelMenu_LeftArrowEvent 4 0
line 390
;383:
;384:
;385:/*
;386:=================
;387:UI_SPLevelMenu_LeftArrowEvent
;388:=================
;389:*/
;390:static void UI_SPLevelMenu_LeftArrowEvent( void* ptr, int notification ) {
line 391
;391:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $270
line 392
;392:		return;
ADDRGP4 $269
JUMPV
LABELV $270
line 395
;393:	}
;394:
;395:	if ( selectedArenaSet == minTier ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 minTier
INDIRI4
NEI4 $272
line 396
;396:		return;
ADDRGP4 $269
JUMPV
LABELV $272
line 399
;397:	}
;398:
;399:	selectedArenaSet--;
ADDRLP4 0
ADDRGP4 selectedArenaSet
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 400
;400:	UI_SPLevelMenu_SetMenuItems();
ADDRGP4 UI_SPLevelMenu_SetMenuItems
CALLV
pop
line 401
;401:}
LABELV $269
endproc UI_SPLevelMenu_LeftArrowEvent 4 0
proc UI_SPLevelMenu_RightArrowEvent 4 0
line 409
;402:
;403:
;404:/*
;405:=================
;406:UI_SPLevelMenu_RightArrowEvent
;407:=================
;408:*/
;409:static void UI_SPLevelMenu_RightArrowEvent( void* ptr, int notification ) {
line 410
;410:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $275
line 411
;411:		return;
ADDRGP4 $274
JUMPV
LABELV $275
line 414
;412:	}
;413:
;414:	if ( selectedArenaSet == maxTier ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 maxTier
INDIRI4
NEI4 $277
line 415
;415:		return;
ADDRGP4 $274
JUMPV
LABELV $277
line 418
;416:	}
;417:
;418:	selectedArenaSet++;
ADDRLP4 0
ADDRGP4 selectedArenaSet
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 419
;419:	UI_SPLevelMenu_SetMenuItems();
ADDRGP4 UI_SPLevelMenu_SetMenuItems
CALLV
pop
line 420
;420:}
LABELV $274
endproc UI_SPLevelMenu_RightArrowEvent 4 0
proc UI_SPLevelMenu_PlayerEvent 0 0
line 428
;421:
;422:
;423:/*
;424:=================
;425:UI_SPLevelMenu_PlayerEvent
;426:=================
;427:*/
;428:static void UI_SPLevelMenu_PlayerEvent( void* ptr, int notification ) {
line 429
;429:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $280
line 430
;430:		return;
ADDRGP4 $279
JUMPV
LABELV $280
line 433
;431:	}
;432:
;433:	UI_PlayerSettingsMenu();
ADDRGP4 UI_PlayerSettingsMenu
CALLV
pop
line 434
;434:}
LABELV $279
endproc UI_SPLevelMenu_PlayerEvent 0 0
proc UI_SPLevelMenu_AwardEvent 4 8
line 442
;435:
;436:
;437:/*
;438:=================
;439:UI_SPLevelMenu_AwardEvent
;440:=================
;441:*/
;442:static void UI_SPLevelMenu_AwardEvent( void* ptr, int notification ) {
line 445
;443:	int		n;
;444:
;445:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $283
line 446
;446:		return;
ADDRGP4 $282
JUMPV
LABELV $283
line 449
;447:	}
;448:
;449:	n = ((menucommon_s*)ptr)->id - ID_AWARD1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 17
SUBI4
ASGNI4
line 450
;450:	trap_S_StartLocalSound( levelMenuInfo.awardSounds[n], CHAN_ANNOUNCER );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2564
ADDP4
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 451
;451:}
LABELV $282
endproc UI_SPLevelMenu_AwardEvent 4 8
proc UI_SPLevelMenu_NextEvent 0 4
line 459
;452:
;453:
;454:/*
;455:=================
;456:UI_SPLevelMenu_NextEvent
;457:=================
;458:*/
;459:static void UI_SPLevelMenu_NextEvent( void* ptr, int notification ) {
line 460
;460:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $287
line 461
;461:		return;
ADDRGP4 $286
JUMPV
LABELV $287
line 464
;462:	}
;463:
;464:	if ( selectedArenaSet > currentSet ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 currentSet
INDIRI4
LEI4 $289
line 465
;465:		return;
ADDRGP4 $286
JUMPV
LABELV $289
line 468
;466:	}
;467:
;468:	if ( selectedArena == -1 ) {
ADDRGP4 selectedArena
INDIRI4
CNSTI4 -1
NEI4 $291
line 469
;469:		selectedArena = 0;
ADDRGP4 selectedArena
CNSTI4 0
ASGNI4
line 470
;470:	}
LABELV $291
line 472
;471:
;472:	UI_SPSkillMenu( levelMenuInfo.selectedArenaInfo );
ADDRGP4 levelMenuInfo+2024
INDIRP4
ARGP4
ADDRGP4 UI_SPSkillMenu
CALLV
pop
line 473
;473:}
LABELV $286
endproc UI_SPLevelMenu_NextEvent 0 4
proc UI_SPLevelMenu_BackEvent 0 0
line 481
;474:
;475:
;476:/*
;477:=================
;478:UI_SPLevelMenu_BackEvent
;479:=================
;480:*/
;481:static void UI_SPLevelMenu_BackEvent( void* ptr, int notification ) {
line 482
;482:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $295
line 483
;483:		return;
ADDRGP4 $294
JUMPV
LABELV $295
line 486
;484:	}
;485:
;486:	if ( selectedArena == -1 ) {
ADDRGP4 selectedArena
INDIRI4
CNSTI4 -1
NEI4 $297
line 487
;487:		selectedArena = 0;
ADDRGP4 selectedArena
CNSTI4 0
ASGNI4
line 488
;488:	}
LABELV $297
line 490
;489:
;490:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 491
;491:}
LABELV $294
endproc UI_SPLevelMenu_BackEvent 0 0
proc UI_SPLevelMenu_CustomEvent 0 4
line 499
;492:
;493:
;494:/*
;495:=================
;496:UI_SPLevelMenu_CustomEvent
;497:=================
;498:*/
;499:static void UI_SPLevelMenu_CustomEvent( void* ptr, int notification ) {
line 500
;500:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $300
line 501
;501:		return;
ADDRGP4 $299
JUMPV
LABELV $300
line 504
;502:	}
;503:
;504:	UI_StartServerMenu( qfalse );
CNSTI4 0
ARGI4
ADDRGP4 UI_StartServerMenu
CALLV
pop
line 505
;505:}
LABELV $299
endproc UI_SPLevelMenu_CustomEvent 0 4
proc UI_SPLevelMenu_MenuDraw 1116 20
line 515
;506:
;507:
;508:/*
;509:=================
;510:UI_SPLevelMenu_MenuDraw
;511:=================
;512:*/
;513:#define LEVEL_DESC_LEFT_MARGIN		332
;514:
;515:static void UI_SPLevelMenu_MenuDraw( void ) {
line 525
;516:	int				n, i;
;517:	int				x, y;
;518:	vec4_t			color;
;519:	int				level;
;520://	int				fraglimit;
;521:	int				pad;
;522:	char			buf[MAX_INFO_VALUE];
;523:	char			string[MAX_NAME_LENGTH];
;524:
;525:	if(	levelMenuInfo.reinit ) {
ADDRGP4 levelMenuInfo+2020
INDIRI4
CNSTI4 0
EQI4 $303
line 526
;526:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 527
;527:		UI_SPLevelMenu();
ADDRGP4 UI_SPLevelMenu
CALLV
pop
line 528
;528:		return;
ADDRGP4 $302
JUMPV
LABELV $303
line 532
;529:	}
;530:
;531:	// draw player name
;532:	trap_Cvar_VariableStringBuffer( "name", string, sizeof( string ) );
ADDRGP4 $107
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 533
;533:	Q_CleanStr( string );
ADDRLP4 16
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 534
;534:	UI_DrawProportionalString( 320, PLAYER_Y, string, UI_CENTER|UI_SMALLFONT, color_orange );
CNSTI4 320
ARGI4
CNSTI4 314
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 537
;535:
;536:	// check for model changes
;537:	trap_Cvar_VariableStringBuffer( "model", buf, sizeof(buf) );
ADDRGP4 $104
ARGP4
ADDRLP4 72
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 538
;538:	if( Q_stricmp( buf, levelMenuInfo.playerModel ) != 0 ) {
ADDRLP4 72
ARGP4
ADDRGP4 levelMenuInfo+2412
ARGP4
ADDRLP4 1096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
EQI4 $306
line 539
;539:		Q_strncpyz( levelMenuInfo.playerModel, buf, sizeof(levelMenuInfo.playerModel) );
ADDRGP4 levelMenuInfo+2412
ARGP4
ADDRLP4 72
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 540
;540:		PlayerIcon( levelMenuInfo.playerModel, levelMenuInfo.playerPicName, sizeof(levelMenuInfo.playerPicName) );
ADDRGP4 levelMenuInfo+2412
ARGP4
ADDRGP4 levelMenuInfo+2476
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 PlayerIcon
CALLV
pop
line 541
;541:		levelMenuInfo.item_player.shader = 0;
ADDRGP4 levelMenuInfo+916+72
CNSTI4 0
ASGNI4
line 542
;542:	}
LABELV $306
line 545
;543:
;544:	// standard menu drawing
;545:	Menu_Draw( &levelMenuInfo.menu );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 548
;546:
;547:	// draw player award levels
;548:	y = AWARDS_Y;
ADDRLP4 8
CNSTI4 340
ASGNI4
line 549
;549:	i = 0;
ADDRLP4 48
CNSTI4 0
ASGNI4
line 550
;550:	for( n = 0; n < 6; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $316
line 551
;551:		level = levelMenuInfo.awardLevels[n];
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2540
ADDP4
INDIRI4
ASGNI4
line 552
;552:		if( level > 0 ) {
ADDRLP4 12
INDIRI4
CNSTI4 0
LEI4 $321
line 553
;553:			if( i & 1 ) {
ADDRLP4 48
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $323
line 554
;554:				x = 224 - (i - 1 ) / 2 * (48 + 16);
ADDRLP4 4
CNSTI4 224
ADDRLP4 48
INDIRI4
CNSTI4 1
SUBI4
CNSTI4 2
DIVI4
CNSTI4 6
LSHI4
SUBI4
ASGNI4
line 555
;555:			}
ADDRGP4 $324
JUMPV
LABELV $323
line 556
;556:			else {
line 557
;557:				x = 368 + i / 2 * (48 + 16);
ADDRLP4 4
ADDRLP4 48
INDIRI4
CNSTI4 2
DIVI4
CNSTI4 6
LSHI4
CNSTI4 368
ADDI4
ASGNI4
line 558
;558:			}
LABELV $324
line 559
;559:			i++;
ADDRLP4 48
ADDRLP4 48
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 561
;560:
;561:			if( level == 1 ) {
ADDRLP4 12
INDIRI4
CNSTI4 1
NEI4 $325
line 562
;562:				continue;
ADDRGP4 $317
JUMPV
LABELV $325
line 565
;563:			}
;564:
;565:			if( level >= 1000000 ) {
ADDRLP4 12
INDIRI4
CNSTI4 1000000
LTI4 $327
line 566
;566:				Com_sprintf( string, sizeof(string), "%im", level / 1000000 );
ADDRLP4 16
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $329
ARGP4
ADDRLP4 12
INDIRI4
CNSTI4 1000000
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 567
;567:			}
ADDRGP4 $328
JUMPV
LABELV $327
line 568
;568:			else if( level >= 1000 ) {
ADDRLP4 12
INDIRI4
CNSTI4 1000
LTI4 $330
line 569
;569:				Com_sprintf( string, sizeof(string), "%ik", level / 1000 );
ADDRLP4 16
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $332
ARGP4
ADDRLP4 12
INDIRI4
CNSTI4 1000
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 570
;570:			}
ADDRGP4 $331
JUMPV
LABELV $330
line 571
;571:			else {
line 572
;572:				Com_sprintf( string, sizeof(string), "%i", level );
ADDRLP4 16
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $333
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 573
;573:			}
LABELV $331
LABELV $328
line 575
;574:
;575:			UI_DrawString( x + 24, y + 48, string, UI_CENTER, color_yellow );
ADDRLP4 4
INDIRI4
CNSTI4 24
ADDI4
ARGI4
ADDRLP4 8
INDIRI4
CNSTI4 48
ADDI4
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 576
;576:		}
LABELV $321
line 577
;577:	}
LABELV $317
line 550
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $316
line 579
;578:
;579:	UI_DrawProportionalString( 18, 38, va( "Tier %i", selectedArenaSet + 1 ), UI_LEFT|UI_SMALLFONT, color_orange );
ADDRGP4 $334
ARGP4
ADDRGP4 selectedArenaSet
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1100
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 18
ARGI4
CNSTI4 38
ARGI4
ADDRLP4 1100
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 581
;580:
;581:	for ( n = 0; n < levelMenuInfo.numMaps; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $338
JUMPV
LABELV $335
line 582
;582:		x = levelMenuInfo.item_maps[n].generic.x;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 levelMenuInfo+456+12
ADDP4
INDIRI4
ASGNI4
line 583
;583:		y = levelMenuInfo.item_maps[n].generic.y;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 levelMenuInfo+456+16
ADDP4
INDIRI4
ASGNI4
line 584
;584:		UI_FillRect( x, y + 96, 128, 18, color_black );
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CNSTI4 96
ADDI4
CVIF4 4
ARGF4
CNSTF4 1124073472
ARGF4
CNSTF4 1099956224
ARGF4
ADDRGP4 color_black
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 585
;585:	}
LABELV $336
line 581
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $338
ADDRLP4 0
INDIRI4
ADDRGP4 levelMenuInfo+2028
INDIRI4
LTI4 $335
line 587
;586:
;587:	if ( selectedArenaSet > currentSet ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 currentSet
INDIRI4
LEI4 $344
line 588
;588:		UI_DrawProportionalString( 320, 216, "ACCESS DENIED", UI_CENTER|UI_BIGFONT, color_red );
CNSTI4 320
ARGI4
CNSTI4 216
ARGI4
ADDRGP4 $346
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 589
;589:		return;
ADDRGP4 $302
JUMPV
LABELV $344
line 593
;590:	}
;591:
;592:	// show levelshots for levels of current tier
;593:	Vector4Copy( color_white, color );
ADDRLP4 56
ADDRGP4 color_white
INDIRF4
ASGNF4
ADDRLP4 56+4
ADDRGP4 color_white+4
INDIRF4
ASGNF4
ADDRLP4 56+8
ADDRGP4 color_white+8
INDIRF4
ASGNF4
ADDRLP4 56+12
ADDRGP4 color_white+12
INDIRF4
ASGNF4
line 594
;594:	color[3] = 0.5+0.5*sin( ( uis.realtime % TMOD_075 ) / PULSE_DIVISOR );
ADDRGP4 uis+4
INDIRI4
CNSTI4 2292106
MODI4
CNSTI4 75
DIVI4
CVIF4 4
ARGF4
ADDRLP4 1104
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 56+12
ADDRLP4 1104
INDIRF4
CNSTF4 1056964608
MULF4
CNSTF4 1056964608
ADDF4
ASGNF4
line 595
;595:	for ( n = 0; n < levelMenuInfo.numMaps; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $358
JUMPV
LABELV $355
line 596
;596:		x = levelMenuInfo.item_maps[n].generic.x;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 levelMenuInfo+456+12
ADDP4
INDIRI4
ASGNI4
line 597
;597:		y = levelMenuInfo.item_maps[n].generic.y;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 levelMenuInfo+456+16
ADDP4
INDIRI4
ASGNI4
line 599
;598:
;599:		UI_DrawString( x + 64, y + 96, levelMenuInfo.levelNames[n], UI_CENTER|UI_SMALLFONT, color_orange );
ADDRLP4 4
INDIRI4
CNSTI4 64
ADDI4
ARGI4
ADDRLP4 8
INDIRI4
CNSTI4 96
ADDI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 levelMenuInfo+2288
ADDP4
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 601
;600:
;601:		if( levelMenuInfo.levelScores[n] == 1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2352
ADDP4
INDIRI4
CNSTI4 1
NEI4 $365
line 602
;602:			UI_DrawHandlePic( x, y, 128, 96, levelMenuInfo.levelCompletePic[levelMenuInfo.levelScoresSkill[n] - 1] ); 
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1124073472
ARGF4
CNSTF4 1119879168
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2368
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2392-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 603
;603:		}
LABELV $365
line 605
;604:
;605:		if ( n == selectedArena ) {
ADDRLP4 0
INDIRI4
ADDRGP4 selectedArena
INDIRI4
NEI4 $371
line 606
;606:			if( Menu_ItemAtCursor( &levelMenuInfo.menu ) == &levelMenuInfo.item_maps[n] ) {
ADDRGP4 levelMenuInfo
ARGP4
ADDRLP4 1108
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 levelMenuInfo+456
ADDP4
CVPU4 4
ADDRLP4 1108
INDIRP4
CVPU4 4
NEU4 $373
line 607
;607:				trap_R_SetColor( color );
ADDRLP4 56
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 608
;608:			}
LABELV $373
line 609
;609:			UI_DrawHandlePic( x-1, y-1, 130, 130 - 14, levelMenuInfo.levelSelectedPic ); 
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
CVIF4 4
ARGF4
CNSTF4 1124204544
ARGF4
CNSTF4 1122500608
ARGF4
ADDRGP4 levelMenuInfo+2384
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 610
;610:			trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 611
;611:		}
ADDRGP4 $372
JUMPV
LABELV $371
line 612
;612:		else if( Menu_ItemAtCursor( &levelMenuInfo.menu ) == &levelMenuInfo.item_maps[n] ) {
ADDRGP4 levelMenuInfo
ARGP4
ADDRLP4 1108
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 levelMenuInfo+456
ADDP4
CVPU4 4
ADDRLP4 1108
INDIRP4
CVPU4 4
NEU4 $377
line 613
;613:			trap_R_SetColor( color );
ADDRLP4 56
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 614
;614:			UI_DrawHandlePic( x-31, y-30, 256, 256-27, levelMenuInfo.levelFocusPic); 
ADDRLP4 4
INDIRI4
CNSTI4 31
SUBI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CNSTI4 30
SUBI4
CVIF4 4
ARGF4
CNSTF4 1132462080
ARGF4
CNSTF4 1130692608
ARGF4
ADDRGP4 levelMenuInfo+2388
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 615
;615:			trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 616
;616:		}
LABELV $377
LABELV $372
line 617
;617:	}
LABELV $356
line 595
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $358
ADDRLP4 0
INDIRI4
ADDRGP4 levelMenuInfo+2028
INDIRI4
LTI4 $355
line 620
;618:
;619:	// show map name and long name of selected level
;620:	y = 192;
ADDRLP4 8
CNSTI4 192
ASGNI4
line 621
;621:	Q_strncpyz( buf, Info_ValueForKey( levelMenuInfo.selectedArenaInfo, "map" ), 20 );
ADDRGP4 levelMenuInfo+2024
INDIRP4
ARGP4
ADDRGP4 $117
ARGP4
ADDRLP4 1108
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 72
ARGP4
ADDRLP4 1108
INDIRP4
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 622
;622:	Q_strupr( buf );
ADDRLP4 72
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 623
;623:	Com_sprintf( string, sizeof(string), "%s: %s", buf, Info_ValueForKey( levelMenuInfo.selectedArenaInfo, "longname" ) );
ADDRGP4 levelMenuInfo+2024
INDIRP4
ARGP4
ADDRGP4 $384
ARGP4
ADDRLP4 1112
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 16
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $382
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 1112
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 624
;624:	UI_DrawProportionalString( 320, y, string, UI_CENTER|UI_SMALLFONT, color_orange );
CNSTI4 320
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 630
;625:
;626://	fraglimit = atoi( Info_ValueForKey( levelMenuInfo.selectedArenaInfo, "fraglimit" ) );
;627://	UI_DrawString( 18, 212, va("Frags %i", fraglimit) , UI_LEFT|UI_SMALLFONT, color_orange );
;628:
;629:	// draw bot opponents
;630:	y += 24;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 24
ADDI4
ASGNI4
line 631
;631:	pad = (7 - levelMenuInfo.numBots) * (64 + 26) / 2;
ADDRLP4 52
CNSTI4 7
ADDRGP4 levelMenuInfo+2588
INDIRI4
SUBI4
CNSTI4 90
MULI4
CNSTI4 2
DIVI4
ASGNI4
line 632
;632:	for( n = 0; n < levelMenuInfo.numBots; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $389
JUMPV
LABELV $386
line 633
;633:		x = 18 + pad + (64 + 26) * n;
ADDRLP4 4
ADDRLP4 52
INDIRI4
CNSTI4 18
ADDI4
ADDRLP4 0
INDIRI4
CNSTI4 90
MULI4
ADDI4
ASGNI4
line 634
;634:		if( levelMenuInfo.botPics[n] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2592
ADDP4
INDIRI4
CNSTI4 0
EQI4 $391
line 635
;635:			UI_DrawHandlePic( x, y, 64, 64, levelMenuInfo.botPics[n]);
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1115684864
ARGF4
CNSTF4 1115684864
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2592
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 636
;636:		}
ADDRGP4 $392
JUMPV
LABELV $391
line 637
;637:		else {
line 638
;638:			UI_FillRect( x, y, 64, 64, color_black );
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1115684864
ARGF4
CNSTF4 1115684864
ARGF4
ADDRGP4 color_black
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 639
;639:			UI_DrawProportionalString( x+22, y+18, "?", UI_BIGFONT, color_orange );
ADDRLP4 4
INDIRI4
CNSTI4 22
ADDI4
ARGI4
ADDRLP4 8
INDIRI4
CNSTI4 18
ADDI4
ARGI4
ADDRGP4 $395
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 640
;640:		}
LABELV $392
line 641
;641:		UI_DrawString( x, y + 64, levelMenuInfo.botNames[n], UI_SMALLFONT|UI_LEFT, color_orange );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
CNSTI4 64
ADDI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 10
MULI4
ADDRGP4 levelMenuInfo+2620
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 642
;642:	}
LABELV $387
line 632
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $389
ADDRLP4 0
INDIRI4
ADDRGP4 levelMenuInfo+2588
INDIRI4
LTI4 $386
line 643
;643:}
LABELV $302
endproc UI_SPLevelMenu_MenuDraw 1116 20
export UI_SPLevelMenu_Cache
proc UI_SPLevelMenu_Cache 32 8
line 651
;644:
;645:
;646:/*
;647:=================
;648:UI_SPLevelMenu_Cache
;649:=================
;650:*/
;651:void UI_SPLevelMenu_Cache( void ) {
line 654
;652:	int				n;
;653:
;654:	trap_R_RegisterShaderNoMip( ART_LEVELFRAME_FOCUS );
ADDRGP4 $398
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 655
;655:	trap_R_RegisterShaderNoMip( ART_LEVELFRAME_SELECTED );
ADDRGP4 $399
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 656
;656:	trap_R_RegisterShaderNoMip( ART_ARROW );
ADDRGP4 $400
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 657
;657:	trap_R_RegisterShaderNoMip( ART_ARROW_FOCUS );
ADDRGP4 $401
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 658
;658:	trap_R_RegisterShaderNoMip( ART_MAP_UNKNOWN );
ADDRGP4 $134
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 659
;659:	trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE1 );
ADDRGP4 $402
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 660
;660:	trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE2 );
ADDRGP4 $403
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 661
;661:	trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE3 );
ADDRGP4 $404
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 662
;662:	trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE4 );
ADDRGP4 $405
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 663
;663:	trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE5 );
ADDRGP4 $406
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 664
;664:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $407
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 665
;665:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $408
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 666
;666:	trap_R_RegisterShaderNoMip( ART_FIGHT0 );
ADDRGP4 $409
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 667
;667:	trap_R_RegisterShaderNoMip( ART_FIGHT1 );
ADDRGP4 $410
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 668
;668:	trap_R_RegisterShaderNoMip( ART_RESET0 );
ADDRGP4 $411
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 669
;669:	trap_R_RegisterShaderNoMip( ART_RESET1 );
ADDRGP4 $412
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 670
;670:	trap_R_RegisterShaderNoMip( ART_CUSTOM0 );
ADDRGP4 $413
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 671
;671:	trap_R_RegisterShaderNoMip( ART_CUSTOM1 );
ADDRGP4 $414
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 673
;672:
;673:	for( n = 0; n < 6; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $415
line 674
;674:		trap_R_RegisterShaderNoMip( ui_medalPicNames[n] );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_medalPicNames
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 675
;675:		levelMenuInfo.awardSounds[n] = trap_S_RegisterSound( ui_medalSounds[n], qfalse );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_medalSounds
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2564
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 676
;676:	}
LABELV $416
line 673
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $415
line 678
;677:
;678:	levelMenuInfo.levelSelectedPic = trap_R_RegisterShaderNoMip( ART_LEVELFRAME_SELECTED );
ADDRGP4 $399
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 levelMenuInfo+2384
ADDRLP4 4
INDIRI4
ASGNI4
line 679
;679:	levelMenuInfo.levelFocusPic = trap_R_RegisterShaderNoMip( ART_LEVELFRAME_FOCUS );
ADDRGP4 $398
ARGP4
ADDRLP4 8
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 levelMenuInfo+2388
ADDRLP4 8
INDIRI4
ASGNI4
line 680
;680:	levelMenuInfo.levelCompletePic[0] = trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE1 );
ADDRGP4 $402
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 levelMenuInfo+2392
ADDRLP4 12
INDIRI4
ASGNI4
line 681
;681:	levelMenuInfo.levelCompletePic[1] = trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE2 );
ADDRGP4 $403
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 levelMenuInfo+2392+4
ADDRLP4 16
INDIRI4
ASGNI4
line 682
;682:	levelMenuInfo.levelCompletePic[2] = trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE3 );
ADDRGP4 $404
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 levelMenuInfo+2392+8
ADDRLP4 20
INDIRI4
ASGNI4
line 683
;683:	levelMenuInfo.levelCompletePic[3] = trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE4 );
ADDRGP4 $405
ARGP4
ADDRLP4 24
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 levelMenuInfo+2392+12
ADDRLP4 24
INDIRI4
ASGNI4
line 684
;684:	levelMenuInfo.levelCompletePic[4] = trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE5 );
ADDRGP4 $406
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 levelMenuInfo+2392+16
ADDRLP4 28
INDIRI4
ASGNI4
line 685
;685:}
LABELV $397
endproc UI_SPLevelMenu_Cache 32 8
proc UI_SPLevelMenu_Init 112 12
line 693
;686:
;687:
;688:/*
;689:=================
;690:UI_SPLevelMenu_Init
;691:=================
;692:*/
;693:static void UI_SPLevelMenu_Init( void ) {
line 700
;694:	int		skill;
;695:	int		n;
;696:	int		x, y;
;697:	int		count;
;698:	char	buf[MAX_QPATH];
;699:
;700:	skill = (int)trap_Cvar_VariableValue( "g_spSkill" );
ADDRGP4 $432
ARGP4
ADDRLP4 84
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 80
ADDRLP4 84
INDIRF4
CVFI4 4
ASGNI4
line 701
;701:	if( skill < 1 || skill > 5 ) {
ADDRLP4 80
INDIRI4
CNSTI4 1
LTI4 $435
ADDRLP4 80
INDIRI4
CNSTI4 5
LEI4 $433
LABELV $435
line 702
;702:		trap_Cvar_Set( "g_spSkill", "2" );
ADDRGP4 $432
ARGP4
ADDRGP4 $436
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 703
;703:	}
LABELV $433
line 705
;704:
;705:	memset( &levelMenuInfo, 0, sizeof(levelMenuInfo) );
ADDRGP4 levelMenuInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2692
ARGI4
ADDRGP4 memset
CALLP4
pop
line 706
;706:	levelMenuInfo.menu.fullscreen = qtrue;
ADDRGP4 levelMenuInfo+280
CNSTI4 1
ASGNI4
line 707
;707:	levelMenuInfo.menu.wrapAround = qtrue;
ADDRGP4 levelMenuInfo+276
CNSTI4 1
ASGNI4
line 708
;708:	levelMenuInfo.menu.draw = UI_SPLevelMenu_MenuDraw;
ADDRGP4 levelMenuInfo+268
ADDRGP4 UI_SPLevelMenu_MenuDraw
ASGNP4
line 710
;709:
;710:	UI_SPLevelMenu_Cache();
ADDRGP4 UI_SPLevelMenu_Cache
CALLV
pop
line 712
;711:
;712:	levelMenuInfo.item_banner.generic.type			= MTYPE_BTEXT;
ADDRGP4 levelMenuInfo+288
CNSTI4 10
ASGNI4
line 713
;713:	levelMenuInfo.item_banner.generic.x				= 320;
ADDRGP4 levelMenuInfo+288+12
CNSTI4 320
ASGNI4
line 714
;714:	levelMenuInfo.item_banner.generic.y				= 16;
ADDRGP4 levelMenuInfo+288+16
CNSTI4 16
ASGNI4
line 715
;715:	levelMenuInfo.item_banner.string				= "CHOOSE LEVEL";
ADDRGP4 levelMenuInfo+288+64
ADDRGP4 $447
ASGNP4
line 716
;716:	levelMenuInfo.item_banner.color					= color_red;
ADDRGP4 levelMenuInfo+288+72
ADDRGP4 color_red
ASGNP4
line 717
;717:	levelMenuInfo.item_banner.style					= UI_CENTER;
ADDRGP4 levelMenuInfo+288+68
CNSTI4 1
ASGNI4
line 719
;718:
;719:	levelMenuInfo.item_leftarrow.generic.type		= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+364
CNSTI4 6
ASGNI4
line 720
;720:	levelMenuInfo.item_leftarrow.generic.name		= ART_ARROW;
ADDRGP4 levelMenuInfo+364+4
ADDRGP4 $400
ASGNP4
line 721
;721:	levelMenuInfo.item_leftarrow.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 levelMenuInfo+364+44
CNSTU4 260
ASGNU4
line 722
;722:	levelMenuInfo.item_leftarrow.generic.x			= 18;
ADDRGP4 levelMenuInfo+364+12
CNSTI4 18
ASGNI4
line 723
;723:	levelMenuInfo.item_leftarrow.generic.y			= 64;
ADDRGP4 levelMenuInfo+364+16
CNSTI4 64
ASGNI4
line 724
;724:	levelMenuInfo.item_leftarrow.generic.callback	= UI_SPLevelMenu_LeftArrowEvent;
ADDRGP4 levelMenuInfo+364+48
ADDRGP4 UI_SPLevelMenu_LeftArrowEvent
ASGNP4
line 725
;725:	levelMenuInfo.item_leftarrow.generic.id			= ID_LEFTARROW;
ADDRGP4 levelMenuInfo+364+8
CNSTI4 10
ASGNI4
line 726
;726:	levelMenuInfo.item_leftarrow.width				= 16;
ADDRGP4 levelMenuInfo+364+80
CNSTI4 16
ASGNI4
line 727
;727:	levelMenuInfo.item_leftarrow.height				= 114;
ADDRGP4 levelMenuInfo+364+84
CNSTI4 114
ASGNI4
line 728
;728:	levelMenuInfo.item_leftarrow.focuspic			= ART_ARROW_FOCUS;
ADDRGP4 levelMenuInfo+364+64
ADDRGP4 $401
ASGNP4
line 730
;729:
;730:	levelMenuInfo.item_maps[0].generic.type			= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+456
CNSTI4 6
ASGNI4
line 731
;731:	levelMenuInfo.item_maps[0].generic.name			= levelMenuInfo.levelPicNames[0];
ADDRGP4 levelMenuInfo+456+4
ADDRGP4 levelMenuInfo+2032
ASGNP4
line 732
;732:	levelMenuInfo.item_maps[0].generic.flags		= QMF_LEFT_JUSTIFY;
ADDRGP4 levelMenuInfo+456+44
CNSTU4 4
ASGNU4
line 733
;733:	levelMenuInfo.item_maps[0].generic.x			= 46;
ADDRGP4 levelMenuInfo+456+12
CNSTI4 46
ASGNI4
line 734
;734:	levelMenuInfo.item_maps[0].generic.y			= 64;
ADDRGP4 levelMenuInfo+456+16
CNSTI4 64
ASGNI4
line 735
;735:	levelMenuInfo.item_maps[0].generic.id			= ID_PICTURE0;
ADDRGP4 levelMenuInfo+456+8
CNSTI4 11
ASGNI4
line 736
;736:	levelMenuInfo.item_maps[0].generic.callback		= UI_SPLevelMenu_LevelEvent;
ADDRGP4 levelMenuInfo+456+48
ADDRGP4 UI_SPLevelMenu_LevelEvent
ASGNP4
line 737
;737:	levelMenuInfo.item_maps[0].width				= 128;
ADDRGP4 levelMenuInfo+456+80
CNSTI4 128
ASGNI4
line 738
;738:	levelMenuInfo.item_maps[0].height				= 96;
ADDRGP4 levelMenuInfo+456+84
CNSTI4 96
ASGNI4
line 740
;739:
;740:	levelMenuInfo.item_maps[1].generic.type			= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+456+92
CNSTI4 6
ASGNI4
line 741
;741:	levelMenuInfo.item_maps[1].generic.name			= levelMenuInfo.levelPicNames[1];
ADDRGP4 levelMenuInfo+456+92+4
ADDRGP4 levelMenuInfo+2032+64
ASGNP4
line 742
;742:	levelMenuInfo.item_maps[1].generic.flags		= QMF_LEFT_JUSTIFY;
ADDRGP4 levelMenuInfo+456+92+44
CNSTU4 4
ASGNU4
line 743
;743:	levelMenuInfo.item_maps[1].generic.x			= 186;
ADDRGP4 levelMenuInfo+456+92+12
CNSTI4 186
ASGNI4
line 744
;744:	levelMenuInfo.item_maps[1].generic.y			= 64;
ADDRGP4 levelMenuInfo+456+92+16
CNSTI4 64
ASGNI4
line 745
;745:	levelMenuInfo.item_maps[1].generic.id			= ID_PICTURE1;
ADDRGP4 levelMenuInfo+456+92+8
CNSTI4 12
ASGNI4
line 746
;746:	levelMenuInfo.item_maps[1].generic.callback		= UI_SPLevelMenu_LevelEvent;
ADDRGP4 levelMenuInfo+456+92+48
ADDRGP4 UI_SPLevelMenu_LevelEvent
ASGNP4
line 747
;747:	levelMenuInfo.item_maps[1].width				= 128;
ADDRGP4 levelMenuInfo+456+92+80
CNSTI4 128
ASGNI4
line 748
;748:	levelMenuInfo.item_maps[1].height				= 96;
ADDRGP4 levelMenuInfo+456+92+84
CNSTI4 96
ASGNI4
line 750
;749:
;750:	levelMenuInfo.item_maps[2].generic.type			= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+456+184
CNSTI4 6
ASGNI4
line 751
;751:	levelMenuInfo.item_maps[2].generic.name			= levelMenuInfo.levelPicNames[2];
ADDRGP4 levelMenuInfo+456+184+4
ADDRGP4 levelMenuInfo+2032+128
ASGNP4
line 752
;752:	levelMenuInfo.item_maps[2].generic.flags		= QMF_LEFT_JUSTIFY;
ADDRGP4 levelMenuInfo+456+184+44
CNSTU4 4
ASGNU4
line 753
;753:	levelMenuInfo.item_maps[2].generic.x			= 326;
ADDRGP4 levelMenuInfo+456+184+12
CNSTI4 326
ASGNI4
line 754
;754:	levelMenuInfo.item_maps[2].generic.y			= 64;
ADDRGP4 levelMenuInfo+456+184+16
CNSTI4 64
ASGNI4
line 755
;755:	levelMenuInfo.item_maps[2].generic.id			= ID_PICTURE2;
ADDRGP4 levelMenuInfo+456+184+8
CNSTI4 13
ASGNI4
line 756
;756:	levelMenuInfo.item_maps[2].generic.callback		= UI_SPLevelMenu_LevelEvent;
ADDRGP4 levelMenuInfo+456+184+48
ADDRGP4 UI_SPLevelMenu_LevelEvent
ASGNP4
line 757
;757:	levelMenuInfo.item_maps[2].width				= 128;
ADDRGP4 levelMenuInfo+456+184+80
CNSTI4 128
ASGNI4
line 758
;758:	levelMenuInfo.item_maps[2].height				= 96;
ADDRGP4 levelMenuInfo+456+184+84
CNSTI4 96
ASGNI4
line 760
;759:
;760:	levelMenuInfo.item_maps[3].generic.type			= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+456+276
CNSTI4 6
ASGNI4
line 761
;761:	levelMenuInfo.item_maps[3].generic.name			= levelMenuInfo.levelPicNames[3];
ADDRGP4 levelMenuInfo+456+276+4
ADDRGP4 levelMenuInfo+2032+192
ASGNP4
line 762
;762:	levelMenuInfo.item_maps[3].generic.flags		= QMF_LEFT_JUSTIFY;
ADDRGP4 levelMenuInfo+456+276+44
CNSTU4 4
ASGNU4
line 763
;763:	levelMenuInfo.item_maps[3].generic.x			= 466;
ADDRGP4 levelMenuInfo+456+276+12
CNSTI4 466
ASGNI4
line 764
;764:	levelMenuInfo.item_maps[3].generic.y			= 64;
ADDRGP4 levelMenuInfo+456+276+16
CNSTI4 64
ASGNI4
line 765
;765:	levelMenuInfo.item_maps[3].generic.id			= ID_PICTURE3;
ADDRGP4 levelMenuInfo+456+276+8
CNSTI4 14
ASGNI4
line 766
;766:	levelMenuInfo.item_maps[3].generic.callback		= UI_SPLevelMenu_LevelEvent;
ADDRGP4 levelMenuInfo+456+276+48
ADDRGP4 UI_SPLevelMenu_LevelEvent
ASGNP4
line 767
;767:	levelMenuInfo.item_maps[3].width				= 128;
ADDRGP4 levelMenuInfo+456+276+80
CNSTI4 128
ASGNI4
line 768
;768:	levelMenuInfo.item_maps[3].height				= 96;
ADDRGP4 levelMenuInfo+456+276+84
CNSTI4 96
ASGNI4
line 770
;769:
;770:	levelMenuInfo.item_rightarrow.generic.type		= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+824
CNSTI4 6
ASGNI4
line 771
;771:	levelMenuInfo.item_rightarrow.generic.name		= ART_ARROW;
ADDRGP4 levelMenuInfo+824+4
ADDRGP4 $400
ASGNP4
line 772
;772:	levelMenuInfo.item_rightarrow.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 levelMenuInfo+824+44
CNSTU4 260
ASGNU4
line 773
;773:	levelMenuInfo.item_rightarrow.generic.x			= 606;
ADDRGP4 levelMenuInfo+824+12
CNSTI4 606
ASGNI4
line 774
;774:	levelMenuInfo.item_rightarrow.generic.y			= 64;
ADDRGP4 levelMenuInfo+824+16
CNSTI4 64
ASGNI4
line 775
;775:	levelMenuInfo.item_rightarrow.generic.callback	= UI_SPLevelMenu_RightArrowEvent;
ADDRGP4 levelMenuInfo+824+48
ADDRGP4 UI_SPLevelMenu_RightArrowEvent
ASGNP4
line 776
;776:	levelMenuInfo.item_rightarrow.generic.id		= ID_RIGHTARROW;
ADDRGP4 levelMenuInfo+824+8
CNSTI4 15
ASGNI4
line 777
;777:	levelMenuInfo.item_rightarrow.width				= -16;
ADDRGP4 levelMenuInfo+824+80
CNSTI4 -16
ASGNI4
line 778
;778:	levelMenuInfo.item_rightarrow.height			= 114;
ADDRGP4 levelMenuInfo+824+84
CNSTI4 114
ASGNI4
line 779
;779:	levelMenuInfo.item_rightarrow.focuspic			= ART_ARROW_FOCUS;
ADDRGP4 levelMenuInfo+824+64
ADDRGP4 $401
ASGNP4
line 781
;780:
;781:	trap_Cvar_VariableStringBuffer( "model", levelMenuInfo.playerModel, sizeof(levelMenuInfo.playerModel) );
ADDRGP4 $104
ARGP4
ADDRGP4 levelMenuInfo+2412
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 782
;782:	PlayerIcon( levelMenuInfo.playerModel, levelMenuInfo.playerPicName, sizeof(levelMenuInfo.playerPicName) );
ADDRGP4 levelMenuInfo+2412
ARGP4
ADDRGP4 levelMenuInfo+2476
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 PlayerIcon
CALLV
pop
line 783
;783:	levelMenuInfo.item_player.generic.type			= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+916
CNSTI4 6
ASGNI4
line 784
;784:	levelMenuInfo.item_player.generic.name			= levelMenuInfo.playerPicName;
ADDRGP4 levelMenuInfo+916+4
ADDRGP4 levelMenuInfo+2476
ASGNP4
line 785
;785:	levelMenuInfo.item_player.generic.flags			= QMF_LEFT_JUSTIFY|QMF_MOUSEONLY;
ADDRGP4 levelMenuInfo+916+44
CNSTU4 2052
ASGNU4
line 786
;786:	levelMenuInfo.item_player.generic.x				= 288;
ADDRGP4 levelMenuInfo+916+12
CNSTI4 288
ASGNI4
line 787
;787:	levelMenuInfo.item_player.generic.y				= AWARDS_Y;
ADDRGP4 levelMenuInfo+916+16
CNSTI4 340
ASGNI4
line 788
;788:	levelMenuInfo.item_player.generic.id			= ID_PLAYERPIC;
ADDRGP4 levelMenuInfo+916+8
CNSTI4 16
ASGNI4
line 789
;789:	levelMenuInfo.item_player.generic.callback		= UI_SPLevelMenu_PlayerEvent;
ADDRGP4 levelMenuInfo+916+48
ADDRGP4 UI_SPLevelMenu_PlayerEvent
ASGNP4
line 790
;790:	levelMenuInfo.item_player.width					= 64;
ADDRGP4 levelMenuInfo+916+80
CNSTI4 64
ASGNI4
line 791
;791:	levelMenuInfo.item_player.height				= 64;
ADDRGP4 levelMenuInfo+916+84
CNSTI4 64
ASGNI4
line 793
;792:
;793:	for( n = 0; n < 6; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $615
line 794
;794:		levelMenuInfo.awardLevels[n] = UI_GetAwardLevel( n );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 UI_GetAwardLevel
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2540
ADDP4
ADDRLP4 96
INDIRI4
ASGNI4
line 795
;795:	}
LABELV $616
line 793
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $615
line 796
;796:	levelMenuInfo.awardLevels[AWARD_FRAGS] = 100 * (levelMenuInfo.awardLevels[AWARD_FRAGS] / 100);
ADDRGP4 levelMenuInfo+2540+16
ADDRGP4 levelMenuInfo+2540+16
INDIRI4
CNSTI4 100
DIVI4
CNSTI4 100
MULI4
ASGNI4
line 798
;797:
;798:	y = AWARDS_Y;
ADDRLP4 12
CNSTI4 340
ASGNI4
line 799
;799:	count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 800
;800:	for( n = 0; n < 6; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $624
line 801
;801:		if( levelMenuInfo.awardLevels[n] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2540
ADDP4
INDIRI4
CNSTI4 0
EQI4 $628
line 802
;802:			if( count & 1 ) {
ADDRLP4 4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $631
line 803
;803:				x = 224 - (count - 1 ) / 2 * (48 + 16);
ADDRLP4 8
CNSTI4 224
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
CNSTI4 2
DIVI4
CNSTI4 6
LSHI4
SUBI4
ASGNI4
line 804
;804:			}
ADDRGP4 $632
JUMPV
LABELV $631
line 805
;805:			else {
line 806
;806:				x = 368 + count / 2 * (48 + 16);
ADDRLP4 8
ADDRLP4 4
INDIRI4
CNSTI4 2
DIVI4
CNSTI4 6
LSHI4
CNSTI4 368
ADDI4
ASGNI4
line 807
;807:			}
LABELV $632
line 809
;808:
;809:			levelMenuInfo.item_awards[count].generic.type		= MTYPE_BITMAP;
ADDRLP4 4
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 levelMenuInfo+1008
ADDP4
CNSTI4 6
ASGNI4
line 810
;810:			levelMenuInfo.item_awards[count].generic.name		= ui_medalPicNames[n];
ADDRLP4 4
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 levelMenuInfo+1008+4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_medalPicNames
ADDP4
INDIRP4
ASGNP4
line 811
;811:			levelMenuInfo.item_awards[count].generic.flags		= QMF_LEFT_JUSTIFY|QMF_SILENT|QMF_MOUSEONLY;
ADDRLP4 4
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 levelMenuInfo+1008+44
ADDP4
CNSTU4 1050628
ASGNU4
line 812
;812:			levelMenuInfo.item_awards[count].generic.x			= x;
ADDRLP4 4
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 levelMenuInfo+1008+12
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 813
;813:			levelMenuInfo.item_awards[count].generic.y			= y;
ADDRLP4 4
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 levelMenuInfo+1008+16
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 814
;814:			levelMenuInfo.item_awards[count].generic.id			= ID_AWARD1 + n;
ADDRLP4 4
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 levelMenuInfo+1008+8
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 17
ADDI4
ASGNI4
line 815
;815:			levelMenuInfo.item_awards[count].generic.callback	= UI_SPLevelMenu_AwardEvent;
ADDRLP4 4
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 levelMenuInfo+1008+48
ADDP4
ADDRGP4 UI_SPLevelMenu_AwardEvent
ASGNP4
line 816
;816:			levelMenuInfo.item_awards[count].width				= 48;
ADDRLP4 4
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 levelMenuInfo+1008+80
ADDP4
CNSTI4 48
ASGNI4
line 817
;817:			levelMenuInfo.item_awards[count].height				= 48;
ADDRLP4 4
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 levelMenuInfo+1008+84
ADDP4
CNSTI4 48
ASGNI4
line 818
;818:			count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 819
;819:		}
LABELV $628
line 820
;820:	}
LABELV $625
line 800
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $624
line 822
;821:
;822:	levelMenuInfo.item_back.generic.type			= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+1560
CNSTI4 6
ASGNI4
line 823
;823:	levelMenuInfo.item_back.generic.name			= ART_BACK0;
ADDRGP4 levelMenuInfo+1560+4
ADDRGP4 $407
ASGNP4
line 824
;824:	levelMenuInfo.item_back.generic.flags			= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 levelMenuInfo+1560+44
CNSTU4 260
ASGNU4
line 825
;825:	levelMenuInfo.item_back.generic.x				= 0;
ADDRGP4 levelMenuInfo+1560+12
CNSTI4 0
ASGNI4
line 826
;826:	levelMenuInfo.item_back.generic.y				= 480-64;
ADDRGP4 levelMenuInfo+1560+16
CNSTI4 416
ASGNI4
line 827
;827:	levelMenuInfo.item_back.generic.callback		= UI_SPLevelMenu_BackEvent;
ADDRGP4 levelMenuInfo+1560+48
ADDRGP4 UI_SPLevelMenu_BackEvent
ASGNP4
line 828
;828:	levelMenuInfo.item_back.generic.id				= ID_BACK;
ADDRGP4 levelMenuInfo+1560+8
CNSTI4 23
ASGNI4
line 829
;829:	levelMenuInfo.item_back.width					= 128;
ADDRGP4 levelMenuInfo+1560+80
CNSTI4 128
ASGNI4
line 830
;830:	levelMenuInfo.item_back.height					= 64;
ADDRGP4 levelMenuInfo+1560+84
CNSTI4 64
ASGNI4
line 831
;831:	levelMenuInfo.item_back.focuspic				= ART_BACK1;
ADDRGP4 levelMenuInfo+1560+64
ADDRGP4 $408
ASGNP4
line 833
;832:
;833:	levelMenuInfo.item_reset.generic.type			= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+1652
CNSTI4 6
ASGNI4
line 834
;834:	levelMenuInfo.item_reset.generic.name			= ART_RESET0;
ADDRGP4 levelMenuInfo+1652+4
ADDRGP4 $411
ASGNP4
line 835
;835:	levelMenuInfo.item_reset.generic.flags			= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 levelMenuInfo+1652+44
CNSTU4 260
ASGNU4
line 836
;836:	levelMenuInfo.item_reset.generic.x				= 170;
ADDRGP4 levelMenuInfo+1652+12
CNSTI4 170
ASGNI4
line 837
;837:	levelMenuInfo.item_reset.generic.y				= 480-64;
ADDRGP4 levelMenuInfo+1652+16
CNSTI4 416
ASGNI4
line 838
;838:	levelMenuInfo.item_reset.generic.callback		= UI_SPLevelMenu_ResetEvent;
ADDRGP4 levelMenuInfo+1652+48
ADDRGP4 UI_SPLevelMenu_ResetEvent
ASGNP4
line 839
;839:	levelMenuInfo.item_reset.generic.id				= ID_RESET;
ADDRGP4 levelMenuInfo+1652+8
CNSTI4 24
ASGNI4
line 840
;840:	levelMenuInfo.item_reset.width					= 128;
ADDRGP4 levelMenuInfo+1652+80
CNSTI4 128
ASGNI4
line 841
;841:	levelMenuInfo.item_reset.height					= 64;
ADDRGP4 levelMenuInfo+1652+84
CNSTI4 64
ASGNI4
line 842
;842:	levelMenuInfo.item_reset.focuspic				= ART_RESET1;
ADDRGP4 levelMenuInfo+1652+64
ADDRGP4 $412
ASGNP4
line 844
;843:
;844:	levelMenuInfo.item_custom.generic.type			= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+1744
CNSTI4 6
ASGNI4
line 845
;845:	levelMenuInfo.item_custom.generic.name			= ART_CUSTOM0;
ADDRGP4 levelMenuInfo+1744+4
ADDRGP4 $413
ASGNP4
line 846
;846:	levelMenuInfo.item_custom.generic.flags			= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 levelMenuInfo+1744+44
CNSTU4 260
ASGNU4
line 847
;847:	levelMenuInfo.item_custom.generic.x				= 342;
ADDRGP4 levelMenuInfo+1744+12
CNSTI4 342
ASGNI4
line 848
;848:	levelMenuInfo.item_custom.generic.y				= 480-64;
ADDRGP4 levelMenuInfo+1744+16
CNSTI4 416
ASGNI4
line 849
;849:	levelMenuInfo.item_custom.generic.callback		= UI_SPLevelMenu_CustomEvent;
ADDRGP4 levelMenuInfo+1744+48
ADDRGP4 UI_SPLevelMenu_CustomEvent
ASGNP4
line 850
;850:	levelMenuInfo.item_custom.generic.id			= ID_CUSTOM;
ADDRGP4 levelMenuInfo+1744+8
CNSTI4 25
ASGNI4
line 851
;851:	levelMenuInfo.item_custom.width					= 128;
ADDRGP4 levelMenuInfo+1744+80
CNSTI4 128
ASGNI4
line 852
;852:	levelMenuInfo.item_custom.height				= 64;
ADDRGP4 levelMenuInfo+1744+84
CNSTI4 64
ASGNI4
line 853
;853:	levelMenuInfo.item_custom.focuspic				= ART_CUSTOM1;
ADDRGP4 levelMenuInfo+1744+64
ADDRGP4 $414
ASGNP4
line 855
;854:
;855:	levelMenuInfo.item_next.generic.type			= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+1836
CNSTI4 6
ASGNI4
line 856
;856:	levelMenuInfo.item_next.generic.name			= ART_FIGHT0;
ADDRGP4 levelMenuInfo+1836+4
ADDRGP4 $409
ASGNP4
line 857
;857:	levelMenuInfo.item_next.generic.flags			= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 levelMenuInfo+1836+44
CNSTU4 272
ASGNU4
line 858
;858:	levelMenuInfo.item_next.generic.x				= 640;
ADDRGP4 levelMenuInfo+1836+12
CNSTI4 640
ASGNI4
line 859
;859:	levelMenuInfo.item_next.generic.y				= 480-64;
ADDRGP4 levelMenuInfo+1836+16
CNSTI4 416
ASGNI4
line 860
;860:	levelMenuInfo.item_next.generic.callback		= UI_SPLevelMenu_NextEvent;
ADDRGP4 levelMenuInfo+1836+48
ADDRGP4 UI_SPLevelMenu_NextEvent
ASGNP4
line 861
;861:	levelMenuInfo.item_next.generic.id				= ID_NEXT;
ADDRGP4 levelMenuInfo+1836+8
CNSTI4 26
ASGNI4
line 862
;862:	levelMenuInfo.item_next.width					= 128;
ADDRGP4 levelMenuInfo+1836+80
CNSTI4 128
ASGNI4
line 863
;863:	levelMenuInfo.item_next.height					= 64;
ADDRGP4 levelMenuInfo+1836+84
CNSTI4 64
ASGNI4
line 864
;864:	levelMenuInfo.item_next.focuspic				= ART_FIGHT1;
ADDRGP4 levelMenuInfo+1836+64
ADDRGP4 $410
ASGNP4
line 866
;865:
;866:	levelMenuInfo.item_null.generic.type			= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+1928
CNSTI4 6
ASGNI4
line 867
;867:	levelMenuInfo.item_null.generic.flags			= QMF_LEFT_JUSTIFY|QMF_MOUSEONLY|QMF_SILENT;
ADDRGP4 levelMenuInfo+1928+44
CNSTU4 1050628
ASGNU4
line 868
;868:	levelMenuInfo.item_null.generic.x				= 0;
ADDRGP4 levelMenuInfo+1928+12
CNSTI4 0
ASGNI4
line 869
;869:	levelMenuInfo.item_null.generic.y				= 0;
ADDRGP4 levelMenuInfo+1928+16
CNSTI4 0
ASGNI4
line 870
;870:	levelMenuInfo.item_null.width					= 640;
ADDRGP4 levelMenuInfo+1928+80
CNSTI4 640
ASGNI4
line 871
;871:	levelMenuInfo.item_null.height					= 480;
ADDRGP4 levelMenuInfo+1928+84
CNSTI4 480
ASGNI4
line 873
;872:
;873:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_banner );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 875
;874:
;875:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_leftarrow );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+364
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 876
;876:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_maps[0] );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+456
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 877
;877:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_maps[1] );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+456+92
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 878
;878:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_maps[2] );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+456+184
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 879
;879:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_maps[3] );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+456+276
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 880
;880:	levelMenuInfo.item_maps[0].generic.bottom += 18;
ADDRLP4 92
ADDRGP4 levelMenuInfo+456+32
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 881
;881:	levelMenuInfo.item_maps[1].generic.bottom += 18;
ADDRLP4 96
ADDRGP4 levelMenuInfo+456+92+32
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 882
;882:	levelMenuInfo.item_maps[2].generic.bottom += 18;
ADDRLP4 100
ADDRGP4 levelMenuInfo+456+184+32
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 883
;883:	levelMenuInfo.item_maps[3].generic.bottom += 18;
ADDRLP4 104
ADDRGP4 levelMenuInfo+456+276+32
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 884
;884:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_rightarrow );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+824
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 886
;885:
;886:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_player );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+916
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 888
;887:
;888:	for( n = 0; n < count; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $762
JUMPV
LABELV $759
line 889
;889:		Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_awards[n] );
ADDRGP4 levelMenuInfo
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 levelMenuInfo+1008
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 890
;890:	}
LABELV $760
line 888
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $762
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $759
line 891
;891:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_back );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+1560
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 892
;892:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_reset );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+1652
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 893
;893:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_custom );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+1744
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 894
;894:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_next );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+1836
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 895
;895:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_null );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+1928
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 897
;896:
;897:	trap_Cvar_VariableStringBuffer( "ui_spSelection", buf, sizeof(buf) );
ADDRGP4 $155
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 898
;898:	if( *buf ) {
ADDRLP4 16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $769
line 899
;899:		n = atoi( buf );
ADDRLP4 16
ARGP4
ADDRLP4 108
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 108
INDIRI4
ASGNI4
line 900
;900:		selectedArenaSet = n / ARENAS_PER_TIER;
ADDRGP4 selectedArenaSet
ADDRLP4 0
INDIRI4
CNSTI4 4
DIVI4
ASGNI4
line 901
;901:		selectedArena = n % ARENAS_PER_TIER;
ADDRGP4 selectedArena
ADDRLP4 0
INDIRI4
CNSTI4 4
MODI4
ASGNI4
line 902
;902:	}
ADDRGP4 $770
JUMPV
LABELV $769
line 903
;903:	else {
line 904
;904:		selectedArenaSet = currentSet;
ADDRGP4 selectedArenaSet
ADDRGP4 currentSet
INDIRI4
ASGNI4
line 905
;905:		selectedArena = currentGame;
ADDRGP4 selectedArena
ADDRGP4 currentGame
INDIRI4
ASGNI4
line 906
;906:	}
LABELV $770
line 908
;907:
;908:	UI_SPLevelMenu_SetMenuItems();
ADDRGP4 UI_SPLevelMenu_SetMenuItems
CALLV
pop
line 909
;909:}
LABELV $431
endproc UI_SPLevelMenu_Init 112 12
export UI_SPLevelMenu
proc UI_SPLevelMenu 32 8
line 917
;910:
;911:
;912:/*
;913:=================
;914:UI_SPLevelMenu
;915:=================
;916:*/
;917:void UI_SPLevelMenu( void ) {
line 922
;918:	int			level;
;919:	int			trainingLevel;
;920:	const char	*arenaInfo;
;921:
;922:	trainingTier = -1;
ADDRGP4 trainingTier
CNSTI4 -1
ASGNI4
line 923
;923:	arenaInfo = UI_GetSpecialArenaInfo( "training" );
ADDRGP4 $158
ARGP4
ADDRLP4 12
ADDRGP4 UI_GetSpecialArenaInfo
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 924
;924:	if( arenaInfo ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $772
line 925
;925:		minTier = trainingTier;
ADDRGP4 minTier
ADDRGP4 trainingTier
INDIRI4
ASGNI4
line 926
;926:		trainingLevel = atoi( Info_ValueForKey( arenaInfo, "num" ) );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $159
ARGP4
ADDRLP4 16
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 20
INDIRI4
ASGNI4
line 927
;927:	}
ADDRGP4 $773
JUMPV
LABELV $772
line 928
;928:	else {
line 929
;929:		minTier = 0;
ADDRGP4 minTier
CNSTI4 0
ASGNI4
line 930
;930:		trainingLevel = -2;
ADDRLP4 8
CNSTI4 -2
ASGNI4
line 931
;931:	}
LABELV $773
line 933
;932:
;933:	finalTier = UI_GetNumSPTiers();
ADDRLP4 16
ADDRGP4 UI_GetNumSPTiers
CALLI4
ASGNI4
ADDRGP4 finalTier
ADDRLP4 16
INDIRI4
ASGNI4
line 934
;934:	arenaInfo = UI_GetSpecialArenaInfo( "final" );
ADDRGP4 $193
ARGP4
ADDRLP4 20
ADDRGP4 UI_GetSpecialArenaInfo
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 935
;935:	if( arenaInfo ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $774
line 936
;936:		maxTier = finalTier;
ADDRGP4 maxTier
ADDRGP4 finalTier
INDIRI4
ASGNI4
line 937
;937:	}
ADDRGP4 $775
JUMPV
LABELV $774
line 938
;938:	else {
line 939
;939:		maxTier = finalTier - 1;
ADDRGP4 maxTier
ADDRGP4 finalTier
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 940
;940:		if( maxTier < minTier ) {
ADDRGP4 maxTier
INDIRI4
ADDRGP4 minTier
INDIRI4
GEI4 $776
line 941
;941:			maxTier = minTier;
ADDRGP4 maxTier
ADDRGP4 minTier
INDIRI4
ASGNI4
line 942
;942:		}
LABELV $776
line 943
;943:	}
LABELV $775
line 945
;944:
;945:	level = UI_GetCurrentGame();
ADDRLP4 24
ADDRGP4 UI_GetCurrentGame
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 24
INDIRI4
ASGNI4
line 946
;946:	if ( level == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $778
line 947
;947:		level = UI_GetNumSPArenas() - 1;
ADDRLP4 28
ADDRGP4 UI_GetNumSPArenas
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 28
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 948
;948:		if( maxTier == finalTier ) {
ADDRGP4 maxTier
INDIRI4
ADDRGP4 finalTier
INDIRI4
NEI4 $780
line 949
;949:			level++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 950
;950:		}
LABELV $780
line 951
;951:	}
LABELV $778
line 953
;952:
;953:	if( level == trainingLevel ) {
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $782
line 954
;954:		currentSet = -1;
ADDRGP4 currentSet
CNSTI4 -1
ASGNI4
line 955
;955:		currentGame = 0;
ADDRGP4 currentGame
CNSTI4 0
ASGNI4
line 956
;956:	}
ADDRGP4 $783
JUMPV
LABELV $782
line 957
;957:	else {
line 958
;958:		currentSet = level / ARENAS_PER_TIER;
ADDRGP4 currentSet
ADDRLP4 0
INDIRI4
CNSTI4 4
DIVI4
ASGNI4
line 959
;959:		currentGame = level % ARENAS_PER_TIER;
ADDRGP4 currentGame
ADDRLP4 0
INDIRI4
CNSTI4 4
MODI4
ASGNI4
line 960
;960:	}
LABELV $783
line 962
;961:
;962:	UI_SPLevelMenu_Init();
ADDRGP4 UI_SPLevelMenu_Init
CALLV
pop
line 963
;963:	UI_PushMenu( &levelMenuInfo.menu );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 964
;964:	Menu_SetCursorToItem( &levelMenuInfo.menu, &levelMenuInfo.item_next );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+1836
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 965
;965:}
LABELV $771
endproc UI_SPLevelMenu 32 8
export UI_SPLevelMenu_f
proc UI_SPLevelMenu_f 0 4
line 973
;966:
;967:
;968:/*
;969:=================
;970:UI_SPLevelMenu_f
;971:=================
;972:*/
;973:void UI_SPLevelMenu_f( void ) {
line 974
;974:	trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 975
;975:	uis.menusp = 0;
ADDRGP4 uis+16
CNSTI4 0
ASGNI4
line 976
;976:	UI_SPLevelMenu();
ADDRGP4 UI_SPLevelMenu
CALLV
pop
line 977
;977:}
LABELV $785
endproc UI_SPLevelMenu_f 0 4
export UI_SPLevelMenu_ReInit
proc UI_SPLevelMenu_ReInit 0 0
line 985
;978:
;979:
;980:/*
;981:=================
;982:UI_SPLevelMenu_ReInit
;983:=================
;984:*/
;985:void UI_SPLevelMenu_ReInit( void ) {
line 986
;986:	levelMenuInfo.reinit = qtrue;
ADDRGP4 levelMenuInfo+2020
CNSTI4 1
ASGNI4
line 987
;987:}
LABELV $787
endproc UI_SPLevelMenu_ReInit 0 0
bss
align 4
LABELV maxTier
skip 4
align 4
LABELV minTier
skip 4
align 4
LABELV finalTier
skip 4
align 4
LABELV trainingTier
skip 4
align 4
LABELV currentGame
skip 4
align 4
LABELV currentSet
skip 4
align 4
LABELV selectedArena
skip 4
align 4
LABELV selectedArenaSet
skip 4
align 4
LABELV levelMenuInfo
skip 2692
import UI_RankStatusMenu
import RankStatus_Cache
import UI_SignupMenu
import Signup_Cache
import UI_LoginMenu
import Login_Cache
import UI_RankingsMenu
import Rankings_Cache
import Rankings_DrawPassword
import Rankings_DrawName
import Rankings_DrawText
import UI_InitGameinfo
import UI_SPUnlockMedals_f
import UI_SPUnlock_f
import UI_GetAwardLevel
import UI_LogAwardData
import UI_NewGame
import UI_GetCurrentGame
import UI_CanShowTierVideo
import UI_ShowTierVideo
import UI_TierCompleted
import UI_SetBestScore
import UI_GetBestScore
import UI_GetNumBots
import UI_GetBotInfoByName
import UI_GetBotInfoByNumber
import UI_GetNumSPTiers
import UI_GetNumSPArenas
import UI_GetNumArenas
import UI_GetSpecialArenaInfo
import UI_GetArenaInfoByMap
import UI_GetArenaInfoByNumber
import UI_NetworkOptionsMenu
import UI_NetworkOptionsMenu_Cache
import UI_SoundOptionsMenu
import UI_SoundOptionsMenu_Cache
import UI_DisplayOptionsMenu
import UI_DisplayOptionsMenu_Cache
import UI_SaveConfigMenu
import UI_SaveConfigMenu_Cache
import UI_LoadConfigMenu
import UI_LoadConfig_Cache
import UI_TeamOrdersMenu_Cache
import UI_TeamOrdersMenu_f
import UI_TeamOrdersMenu
import UI_RemoveBotsMenu
import UI_RemoveBots_Cache
import UI_AddBotsMenu
import UI_AddBots_Cache
import trap_SetPbClStatus
import trap_VerifyCDKey
import trap_SetCDKey
import trap_GetCDKey
import trap_MemoryRemaining
import trap_LAN_GetPingInfo
import trap_LAN_GetPing
import trap_LAN_ClearPing
import trap_LAN_ServerStatus
import trap_LAN_LoadCachedServers
import trap_LAN_SaveCachedServers
import trap_LAN_GetPingQueueCount
import trap_LAN_GetServerInfo
import trap_LAN_GetServerAddressString
import trap_LAN_GetServerCount
import trap_GetConfigString
import trap_GetGlconfig
import trap_GetClientState
import trap_GetClipboardData
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_ClearStates
import trap_Key_SetOverstrikeMode
import trap_Key_GetOverstrikeMode
import trap_Key_IsDown
import trap_Key_SetBinding
import trap_Key_GetBindingBuf
import trap_Key_KeynumToStringBuf
import trap_S_RegisterSound
import trap_S_StartLocalSound
import trap_CM_LerpTag
import trap_UpdateScreen
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_AddLightToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_FS_Seek
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Cmd_ExecuteText
import trap_Argv
import trap_Argc
import trap_Cvar_InfoStringBuffer
import trap_Cvar_Create
import trap_Cvar_Reset
import trap_Cvar_SetValue
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import UI_SPSkillMenu_Cache
import UI_SPSkillMenu
import UI_SPPostgameMenu_f
import UI_SPPostgameMenu_Cache
import UI_SPArena_Start
import uis
import m_entersound
import UI_StartDemoLoop
import UI_Cvar_VariableString
import UI_Argv
import UI_ForceMenuOff
import UI_PopMenu
import UI_PushMenu
import UI_SetActiveMenu
import UI_IsFullscreen
import UI_DrawTextBox
import UI_AdjustFrom640
import UI_CursorInRect
import UI_DrawChar
import UI_DrawString
import UI_ProportionalStringWidth
import UI_DrawProportionalString_AutoWrapped
import UI_DrawProportionalString
import UI_ProportionalSizeScale
import UI_DrawBannerString
import UI_LerpColor
import UI_SetColor
import UI_UpdateScreen
import UI_DrawRect
import UI_FillRect
import UI_DrawHandlePic
import UI_DrawNamedPic
import UI_ClampCvar
import UI_ConsoleCommand
import UI_Refresh
import UI_MouseEvent
import UI_KeyEvent
import UI_Shutdown
import UI_Init
import UI_RegisterClientModelname
import UI_PlayerInfo_SetInfo
import UI_PlayerInfo_SetModel
import UI_DrawPlayer
import DriverInfo_Cache
import GraphicsOptions_Cache
import UI_GraphicsOptionsMenu
import ServerInfo_Cache
import UI_ServerInfoMenu
import UI_BotSelectMenu_Cache
import UI_BotSelectMenu
import ServerOptions_Cache
import StartServer_Cache
import UI_StartServerMenu
import ArenaServers_Cache
import UI_ArenaServersMenu
import SpecifyServer_Cache
import UI_SpecifyServerMenu
import SpecifyLeague_Cache
import UI_SpecifyLeagueMenu
import Preferences_Cache
import UI_PreferencesMenu
import PlayerSettings_Cache
import UI_PlayerSettingsMenu
import PlayerModel_Cache
import UI_PlayerModelMenu
import UI_CDKeyMenu_f
import UI_CDKeyMenu_Cache
import UI_CDKeyMenu
import UI_ModsMenu_Cache
import UI_ModsMenu
import UI_CinematicsMenu_Cache
import UI_CinematicsMenu_f
import UI_CinematicsMenu
import Demos_Cache
import UI_DemosMenu
import Controls_Cache
import UI_ControlsMenu
import UI_DrawConnectScreen
import TeamMain_Cache
import UI_TeamMainMenu
import UI_SetupMenu
import UI_SetupMenu_Cache
import UI_Message
import UI_ConfirmMenu_Style
import UI_ConfirmMenu
import ConfirmMenu_Cache
import UI_InGameMenu
import InGame_Cache
import UI_CreditMenu
import UI_UpdateCvars
import UI_RegisterCvars
import UI_MainMenu
import MainMenu_Cache
import MenuField_Key
import MenuField_Draw
import MenuField_Init
import MField_Draw
import MField_CharEvent
import MField_KeyDownEvent
import MField_Clear
import UI_VideoCheck
import ui_medalSounds
import ui_medalPicNames
import ui_medalNames
import text_color_highlight
import text_color_normal
import text_color_disabled
import listbar_color
import list_color
import name_color
import color_dim
import color_red
import color_orange
import color_blue
import color_yellow
import color_white
import color_black
import menu_dim_color
import menu_black_color
import menu_red_color
import menu_highlight_color
import menu_dark_color
import menu_grayed_color
import menu_text_color
import weaponChangeSound
import menu_null_sound
import menu_buzz_sound
import menu_out_sound
import menu_move_sound
import menu_in_sound
import ScrollList_Key
import ScrollList_Draw
import Bitmap_Draw
import Bitmap_Init
import Menu_DefaultKey
import Menu_SetCursorToItem
import Menu_SetCursor
import Menu_ActivateItem
import Menu_ItemAtCursor
import Menu_Draw
import Menu_AdjustCursor
import Menu_AddItem
import Menu_Focus
import Menu_Cache
import ui_cdkeychecked
import ui_cdkey
import ui_server16
import ui_server15
import ui_server14
import ui_server13
import ui_server12
import ui_server11
import ui_server10
import ui_server9
import ui_server8
import ui_server7
import ui_server6
import ui_server5
import ui_server4
import ui_server3
import ui_server2
import ui_server1
import ui_marks
import ui_drawCrosshairNames
import ui_drawCrosshair
import ui_brassTime
import ui_browserShowEmpty
import ui_browserShowFull
import ui_browserSortKey
import ui_browserGameType
import ui_browserMaster
import ui_spSelection
import ui_spSkill
import ui_spVideos
import ui_spAwards
import ui_spScores5
import ui_spScores4
import ui_spScores3
import ui_spScores2
import ui_spScores1
import ui_botsFile
import ui_arenasFile
import ui_ctf_friendly
import ui_ctf_timelimit
import ui_ctf_capturelimit
import ui_team_friendly
import ui_team_timelimit
import ui_team_fraglimit
import ui_tourney_timelimit
import ui_tourney_fraglimit
import ui_ffa_timelimit
import ui_ffa_fraglimit
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
LABELV $447
byte 1 67
byte 1 72
byte 1 79
byte 1 79
byte 1 83
byte 1 69
byte 1 32
byte 1 76
byte 1 69
byte 1 86
byte 1 69
byte 1 76
byte 1 0
align 1
LABELV $436
byte 1 50
byte 1 0
align 1
LABELV $432
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
LABELV $414
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
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 104
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $413
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
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 104
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $412
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 114
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $411
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 114
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $410
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
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $409
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
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $408
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $407
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $406
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 53
byte 1 0
align 1
LABELV $405
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 52
byte 1 0
align 1
LABELV $404
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 51
byte 1 0
align 1
LABELV $403
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 50
byte 1 0
align 1
LABELV $402
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 49
byte 1 0
align 1
LABELV $401
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 110
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $400
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 110
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $399
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $398
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $395
byte 1 63
byte 1 0
align 1
LABELV $384
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $382
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $346
byte 1 65
byte 1 67
byte 1 67
byte 1 69
byte 1 83
byte 1 83
byte 1 32
byte 1 68
byte 1 69
byte 1 78
byte 1 73
byte 1 69
byte 1 68
byte 1 0
align 1
LABELV $334
byte 1 84
byte 1 105
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $333
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $332
byte 1 37
byte 1 105
byte 1 107
byte 1 0
align 1
LABELV $329
byte 1 37
byte 1 105
byte 1 109
byte 1 0
align 1
LABELV $261
byte 1 82
byte 1 69
byte 1 83
byte 1 69
byte 1 84
byte 1 32
byte 1 71
byte 1 65
byte 1 77
byte 1 69
byte 1 63
byte 1 0
align 1
LABELV $254
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 98
byte 1 101
byte 1 103
byte 1 105
byte 1 110
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 0
align 1
LABELV $253
byte 1 68
byte 1 111
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 111
byte 1 110
byte 1 108
byte 1 121
byte 1 32
byte 1 105
byte 1 102
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 119
byte 1 97
byte 1 110
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 0
align 1
LABELV $252
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 118
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 115
byte 1 46
byte 1 0
align 1
LABELV $251
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 84
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 0
align 1
LABELV $193
byte 1 102
byte 1 105
byte 1 110
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $159
byte 1 110
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $158
byte 1 116
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $155
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $134
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $129
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $117
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $107
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $104
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $84
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $77
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $74
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $73
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
