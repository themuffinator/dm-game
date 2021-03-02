code
proc CG_DrawLoadingIcons 12 20
file "..\..\..\..\code\cgame\cg_info.c"
line 21
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_info.c -- display information while data is being loading
;4:
;5:#include "cg_local.h"
;6:
;7:#define MAX_LOADING_PLAYER_ICONS	16
;8:#define MAX_LOADING_ITEM_ICONS		26
;9:
;10:static int			loadingPlayerIconCount;
;11:static int			loadingItemIconCount;
;12:static qhandle_t	loadingPlayerIcons[MAX_LOADING_PLAYER_ICONS];
;13:static qhandle_t	loadingItemIcons[MAX_LOADING_ITEM_ICONS];
;14:
;15:
;16:/*
;17:===================
;18:CG_DrawLoadingIcons
;19:===================
;20:*/
;21:static void CG_DrawLoadingIcons( void ) {
line 25
;22:	int		n;
;23:	int		x, y;
;24:
;25:	for( n = 0; n < loadingPlayerIconCount; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $77
JUMPV
LABELV $74
line 26
;26:		x = 16 + n * 78;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 78
MULI4
CNSTI4 16
ADDI4
ASGNI4
line 27
;27:		y = 324-40;
ADDRLP4 4
CNSTI4 284
ASGNI4
line 28
;28:		CG_DrawPic( x, y, 64, 64, loadingPlayerIcons[n] );
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
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
ADDRGP4 loadingPlayerIcons
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 29
;29:	}
LABELV $75
line 25
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $77
ADDRLP4 0
INDIRI4
ADDRGP4 loadingPlayerIconCount
INDIRI4
LTI4 $74
line 31
;30:
;31:	for( n = 0; n < loadingItemIconCount; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $81
JUMPV
LABELV $78
line 32
;32:		y = 400-40;
ADDRLP4 4
CNSTI4 360
ASGNI4
line 33
;33:		if( n >= 13 ) {
ADDRLP4 0
INDIRI4
CNSTI4 13
LTI4 $82
line 34
;34:			y += 40;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 40
ADDI4
ASGNI4
line 35
;35:		}
LABELV $82
line 36
;36:		x = 16 + n % 13 * 48;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 13
MODI4
CNSTI4 48
MULI4
CNSTI4 16
ADDI4
ASGNI4
line 37
;37:		CG_DrawPic( x, y, 32, 32, loadingItemIcons[n] );
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1107296256
ARGF4
CNSTF4 1107296256
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 loadingItemIcons
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 38
;38:	}
LABELV $79
line 31
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $81
ADDRLP4 0
INDIRI4
ADDRGP4 loadingItemIconCount
INDIRI4
LTI4 $78
line 39
;39:}
LABELV $73
endproc CG_DrawLoadingIcons 12 20
export CG_LoadingString
proc CG_LoadingString 12 12
line 48
;40:
;41:
;42:/*
;43:======================
;44:CG_LoadingString
;45:
;46:======================
;47:*/
;48:void CG_LoadingString( const char *s ) {
line 50
;49:	int i;
;50:	Q_strncpyz( cg.infoScreenText, DecodedString( (char *)s ), sizeof( cg.infoScreenText ) );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 DecodedString
CALLP4
ASGNP4
ADDRGP4 cg+109448
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 52
;51:
;52:	for ( i=0; i < sizeof( cg.infoScreenText ); i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $90
JUMPV
LABELV $87
line 53
;53:		if ( !cg.infoScreenText[i] ) 
ADDRLP4 0
INDIRI4
ADDRGP4 cg+109448
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $92
line 54
;54:			break;
ADDRGP4 $89
JUMPV
LABELV $92
line 56
;55:		// convert to normal unless UI font will support extended characters 
;56:		cg.infoScreenText[i]&=127;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ADDRGP4 cg+109448
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
BANDI4
CVII1 4
ASGNI1
line 57
;57:	}
LABELV $88
line 52
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $90
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 1024
LTU4 $87
LABELV $89
line 58
;58:	trap_UpdateScreen();
ADDRGP4 trap_UpdateScreen
CALLV
pop
line 59
;59:}
LABELV $84
endproc CG_LoadingString 12 12
export CG_LoadingItem
proc CG_LoadingItem 12 4
line 66
;60:
;61:/*
;62:===================
;63:CG_LoadingItem
;64:===================
;65:*/
;66:void CG_LoadingItem( int itemNum ) {
line 69
;67:	gitem_t		*item;
;68:
;69:	item = &bg_itemlist[itemNum];
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 52
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 71
;70:	
;71:	if ( item->icon && loadingItemIconCount < MAX_LOADING_ITEM_ICONS ) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $97
ADDRGP4 loadingItemIconCount
INDIRI4
CNSTI4 26
GEI4 $97
line 72
;72:		loadingItemIcons[loadingItemIconCount] = trap_R_RegisterShaderNoMip( item->icon );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 loadingItemIconCount
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 loadingItemIcons
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 73
;73:		loadingItemIconCount++;
ADDRLP4 8
ADDRGP4 loadingItemIconCount
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 74
;74:	}
LABELV $97
line 76
;75:
;76:	CG_LoadingString( item->pickup_name );
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRP4
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 77
;77:}
LABELV $96
endproc CG_LoadingItem 12 4
export CG_LoadingClient
proc CG_LoadingClient 220 20
line 84
;78:
;79:/*
;80:===================
;81:CG_LoadingClient
;82:===================
;83:*/
;84:void CG_LoadingClient( int clientNum ) {
line 91
;85:	const char		*info;
;86:	char			*skin;
;87:	char			personality[MAX_QPATH];
;88:	char			model[MAX_QPATH];
;89:	char			iconName[MAX_QPATH];
;90:
;91:	info = CG_ConfigString( CS_PLAYERS + clientNum );
ADDRFP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 200
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 64
ADDRLP4 200
INDIRP4
ASGNP4
line 93
;92:
;93:	if ( loadingPlayerIconCount < MAX_LOADING_PLAYER_ICONS ) {
ADDRGP4 loadingPlayerIconCount
INDIRI4
CNSTI4 16
GEI4 $100
line 94
;94:		Q_strncpyz( model, Info_ValueForKey( info, "model" ), sizeof( model ) );
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 $102
ARGP4
ADDRLP4 204
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 72
ARGP4
ADDRLP4 204
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 95
;95:		skin = Q_strrchr( model, '/' );
ADDRLP4 72
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 208
ADDRGP4 Q_strrchr
CALLP4
ASGNP4
ADDRLP4 68
ADDRLP4 208
INDIRP4
ASGNP4
line 96
;96:		if ( skin ) {
ADDRLP4 68
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $103
line 97
;97:			*skin++ = '\0';
ADDRLP4 212
ADDRLP4 68
INDIRP4
ASGNP4
ADDRLP4 68
ADDRLP4 212
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 212
INDIRP4
CNSTI1 0
ASGNI1
line 98
;98:		} else {
ADDRGP4 $104
JUMPV
LABELV $103
line 99
;99:			skin = "default";
ADDRLP4 68
ADDRGP4 $105
ASGNP4
line 100
;100:		}
LABELV $104
line 102
;101:
;102:		Com_sprintf( iconName, MAX_QPATH, "models/players/%s/icon_%s.tga", model, skin );
ADDRLP4 136
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $106
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 104
;103:		
;104:		loadingPlayerIcons[loadingPlayerIconCount] = trap_R_RegisterShaderNoMip( iconName );
ADDRLP4 136
ARGP4
ADDRLP4 212
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 loadingPlayerIconCount
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 loadingPlayerIcons
ADDP4
ADDRLP4 212
INDIRI4
ASGNI4
line 105
;105:		if ( !loadingPlayerIcons[loadingPlayerIconCount] ) {
ADDRGP4 loadingPlayerIconCount
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 loadingPlayerIcons
ADDP4
INDIRI4
CNSTI4 0
NEI4 $107
line 106
;106:			Com_sprintf( iconName, MAX_QPATH, "models/players/characters/%s/icon_%s.tga", model, skin );
ADDRLP4 136
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $109
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 107
;107:			loadingPlayerIcons[loadingPlayerIconCount] = trap_R_RegisterShaderNoMip( iconName );
ADDRLP4 136
ARGP4
ADDRLP4 216
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 loadingPlayerIconCount
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 loadingPlayerIcons
ADDP4
ADDRLP4 216
INDIRI4
ASGNI4
line 108
;108:		}
LABELV $107
line 109
;109:		if ( !loadingPlayerIcons[loadingPlayerIconCount] ) {
ADDRGP4 loadingPlayerIconCount
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 loadingPlayerIcons
ADDP4
INDIRI4
CNSTI4 0
NEI4 $110
line 110
;110:			Com_sprintf( iconName, MAX_QPATH, "models/players/%s/icon_%s.tga", DEFAULT_MODEL, "default" );
ADDRLP4 136
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $106
ARGP4
ADDRGP4 $112
ARGP4
ADDRGP4 $105
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 111
;111:			loadingPlayerIcons[loadingPlayerIconCount] = trap_R_RegisterShaderNoMip( iconName );
ADDRLP4 136
ARGP4
ADDRLP4 216
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 loadingPlayerIconCount
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 loadingPlayerIcons
ADDP4
ADDRLP4 216
INDIRI4
ASGNI4
line 112
;112:		}
LABELV $110
line 113
;113:		if ( loadingPlayerIcons[loadingPlayerIconCount] ) {
ADDRGP4 loadingPlayerIconCount
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 loadingPlayerIcons
ADDP4
INDIRI4
CNSTI4 0
EQI4 $113
line 114
;114:			loadingPlayerIconCount++;
ADDRLP4 216
ADDRGP4 loadingPlayerIconCount
ASGNP4
ADDRLP4 216
INDIRP4
ADDRLP4 216
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 115
;115:		}
LABELV $113
line 116
;116:	}
LABELV $100
line 118
;117:
;118:	BG_CleanName( Info_ValueForKey( info, "n" ), personality, sizeof( personality ), "unknown client" );
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 $115
ARGP4
ADDRLP4 204
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 204
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $116
ARGP4
ADDRGP4 BG_CleanName
CALLV
pop
line 119
;119:	BG_StripColor( personality );
ADDRLP4 0
ARGP4
ADDRGP4 BG_StripColor
CALLP4
pop
line 121
;120:
;121:	if ( cgs.gametype == GT_CAMPAIGN ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 0
NEI4 $117
line 122
;122:		trap_S_RegisterSound( va( "sound/player/announce/%s.wav", personality ), qtrue );
ADDRGP4 $120
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 208
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 208
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 trap_S_RegisterSound
CALLI4
pop
line 123
;123:	}
LABELV $117
line 125
;124:
;125:	CG_LoadingString( personality );
ADDRLP4 0
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 126
;126:}
LABELV $99
endproc CG_LoadingClient 220 20
export CG_DrawInformation
proc CG_DrawInformation 1108 36
line 136
;127:
;128:
;129:/*
;130:====================
;131:CG_DrawInformation
;132:
;133:Draw all the status / pacifier stuff during level loading
;134:====================
;135:*/
;136:void CG_DrawInformation( void ) {
line 147
;137:	const char	*s;
;138:	const char	*info;
;139:	const char	*sysInfo;
;140:	int			y;
;141:	int			value;
;142:	qhandle_t	levelshot;
;143:	qhandle_t	detail;
;144:	char		buf[1024];
;145:	char		*ptr;
;146:
;147:	info = CG_ConfigString( CS_SERVERINFO );
CNSTI4 0
ARGI4
ADDRLP4 1056
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 1032
ADDRLP4 1056
INDIRP4
ASGNP4
line 148
;148:	sysInfo = CG_ConfigString( CS_SYSTEMINFO );
CNSTI4 1
ARGI4
ADDRLP4 1060
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 1048
ADDRLP4 1060
INDIRP4
ASGNP4
line 150
;149:
;150:	s = Info_ValueForKey( info, "mapname" );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 $122
ARGP4
ADDRLP4 1064
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1064
INDIRP4
ASGNP4
line 151
;151:	levelshot = trap_R_RegisterShaderNoMip( va( "levelshots/%s.tga", s ) );
ADDRGP4 $123
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1068
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRLP4 1072
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 1044
ADDRLP4 1072
INDIRI4
ASGNI4
line 152
;152:	if ( !levelshot ) {
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $124
line 153
;153:		levelshot = trap_R_RegisterShaderNoMip( "menu/art/unknownmap" );
ADDRGP4 $126
ARGP4
ADDRLP4 1076
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 1044
ADDRLP4 1076
INDIRI4
ASGNI4
line 154
;154:	}
LABELV $124
line 156
;155:
;156:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 158
;157:	// fill whole screen, not just 640x480 virtual rectangle
;158:	trap_R_DrawStretchPic( 0, 0, cgs.glconfig.vidWidth, cgs.glconfig.vidHeight, 0, 0, 1, 1, levelshot );
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
ADDRGP4 cgs+20100+11304
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cgs+20100+11308
INDIRI4
CVIF4 4
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 1044
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 161
;159:
;160:	// blend a detail texture over it
;161:	detail = trap_R_RegisterShader( "levelShotDetail" );
ADDRGP4 $131
ARGP4
ADDRLP4 1076
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 1052
ADDRLP4 1076
INDIRI4
ASGNI4
line 162
;162:	trap_R_DrawStretchPic( 0, 0, cgs.glconfig.vidWidth, cgs.glconfig.vidHeight, 0, 0, 2.5, 2, detail );
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
ADDRGP4 cgs+20100+11304
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cgs+20100+11308
INDIRI4
CVIF4 4
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 1075838976
ARGF4
CNSTF4 1073741824
ARGF4
ADDRLP4 1052
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 165
;163:
;164:	// draw the icons of things as they are loaded
;165:	CG_DrawLoadingIcons();
ADDRGP4 CG_DrawLoadingIcons
CALLV
pop
line 169
;166:
;167:	// the first 150 rows are reserved for the client connection
;168:	// screen to write into
;169:	if ( cg.infoScreenText[0] ) {
ADDRGP4 cg+109448
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $136
line 170
;170:		UI_DrawProportionalString( 320, 128-32, va("Loading... %s", cg.infoScreenText),
ADDRGP4 $139
ARGP4
ADDRGP4 cg+109448
ARGP4
ADDRLP4 1080
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
CNSTI4 96
ARGI4
ADDRLP4 1080
INDIRP4
ARGP4
CNSTI4 2065
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 172
;171:			UI_CENTER|UI_SMALLFONT|UI_DROPSHADOW, colorWhite );
;172:	} else {
ADDRGP4 $137
JUMPV
LABELV $136
line 173
;173:		UI_DrawProportionalString( 320, 128-32, "Awaiting snapshot...",
CNSTI4 320
ARGI4
CNSTI4 96
ARGI4
ADDRGP4 $141
ARGP4
CNSTI4 2065
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 175
;174:			UI_CENTER|UI_SMALLFONT|UI_DROPSHADOW, colorWhite );
;175:	}
LABELV $137
line 179
;176:
;177:	// draw info string information
;178:
;179:	y = 180-32;
ADDRLP4 4
CNSTI4 148
ASGNI4
line 184
;180:
;181:	// don't print server lines if playing a local game
;182:	//trap_Cvar_VariableStringBuffer( "sv_running", buf, sizeof( buf ) );
;183:	//if ( !atoi( buf ) ) 
;184:	{
line 186
;185:		// server hostname
;186:		Q_strncpyz( buf, Info_ValueForKey( info, "sv_hostname" ), sizeof( buf ) );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 $142
ARGP4
ADDRLP4 1080
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ARGP4
ADDRLP4 1080
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 187
;187:		Q_CleanStr( buf );
ADDRLP4 8
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 188
;188:		UI_DrawProportionalString( 320, y, buf,
CNSTI4 320
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 2065
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 190
;189:			UI_CENTER|UI_SMALLFONT|UI_DROPSHADOW, colorWhite );
;190:		y += PROP_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 27
ADDI4
ASGNI4
line 192
;191:
;192:		buf[0] = '\0';
ADDRLP4 8
CNSTI1 0
ASGNI1
line 193
;193:		ptr = buf;
ADDRLP4 1040
ADDRLP4 8
ASGNP4
line 196
;194:
;195:		// unlagged server
;196:		s = Info_ValueForKey( info, "g_unlagged" );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 $143
ARGP4
ADDRLP4 1084
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1084
INDIRP4
ASGNP4
line 197
;197:		if ( s[0] == '1' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 49
NEI4 $144
line 198
;198:			ptr = Q_stradd( ptr, "Unlagged" );
ADDRLP4 1040
INDIRP4
ARGP4
ADDRGP4 $146
ARGP4
ADDRLP4 1088
ADDRGP4 Q_stradd
CALLP4
ASGNP4
ADDRLP4 1040
ADDRLP4 1088
INDIRP4
ASGNP4
line 199
;199:		}
LABELV $144
line 202
;200:
;201:		// pure server
;202:		s = Info_ValueForKey( sysInfo, "sv_pure" );
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 $147
ARGP4
ADDRLP4 1088
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1088
INDIRP4
ASGNP4
line 203
;203:		if ( s[0] == '1' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 49
NEI4 $148
line 204
;204:			if ( buf[0] ) {
ADDRLP4 8
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $150
line 205
;205:				ptr = Q_stradd( ptr, ", " );
ADDRLP4 1040
INDIRP4
ARGP4
ADDRGP4 $152
ARGP4
ADDRLP4 1092
ADDRGP4 Q_stradd
CALLP4
ASGNP4
ADDRLP4 1040
ADDRLP4 1092
INDIRP4
ASGNP4
line 206
;206:			}
LABELV $150
line 207
;207:			ptr = Q_stradd( ptr, "Pure" );
ADDRLP4 1040
INDIRP4
ARGP4
ADDRGP4 $153
ARGP4
ADDRLP4 1092
ADDRGP4 Q_stradd
CALLP4
ASGNP4
ADDRLP4 1040
ADDRLP4 1092
INDIRP4
ASGNP4
line 208
;208:		}
LABELV $148
line 210
;209:
;210:		if ( buf[0] ) {
ADDRLP4 8
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $154
line 211
;211:			ptr = Q_stradd( ptr, " Server" );
ADDRLP4 1040
INDIRP4
ARGP4
ADDRGP4 $156
ARGP4
ADDRLP4 1092
ADDRGP4 Q_stradd
CALLP4
ASGNP4
ADDRLP4 1040
ADDRLP4 1092
INDIRP4
ASGNP4
line 212
;212:			UI_DrawProportionalString( 320, y, buf,	UI_CENTER|UI_SMALLFONT|UI_DROPSHADOW, colorWhite );
CNSTI4 320
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 2065
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 213
;213:			y += PROP_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 27
ADDI4
ASGNI4
line 214
;214:		}
LABELV $154
line 217
;215:
;216:		// server-specific message of the day
;217:		s = CG_ConfigString( CS_MOTD );
CNSTI4 4
ARGI4
ADDRLP4 1092
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1092
INDIRP4
ASGNP4
line 218
;218:		if ( s[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $157
line 219
;219:			UI_DrawProportionalString( 320, y, s,
CNSTI4 320
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2065
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 221
;220:				UI_CENTER|UI_SMALLFONT|UI_DROPSHADOW, colorWhite );
;221:			y += PROP_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 27
ADDI4
ASGNI4
line 222
;222:		}
LABELV $157
line 225
;223:
;224:		// some extra space after hostname and motd
;225:		y += 10;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 226
;226:	}
line 229
;227:
;228:	// map-specific message (long map name)
;229:	s = CG_ConfigString( CS_MESSAGE );
CNSTI4 3
ARGI4
ADDRLP4 1080
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1080
INDIRP4
ASGNP4
line 230
;230:	if ( s[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $159
line 231
;231:		UI_DrawProportionalString( 320, y, s,
CNSTI4 320
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2065
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 233
;232:			UI_CENTER|UI_SMALLFONT|UI_DROPSHADOW, colorWhite );
;233:		y += PROP_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 27
ADDI4
ASGNI4
line 234
;234:	}
LABELV $159
line 237
;235:
;236:	// cheats warning
;237:	s = Info_ValueForKey( sysInfo, "sv_cheats" );
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 $161
ARGP4
ADDRLP4 1084
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1084
INDIRP4
ASGNP4
line 238
;238:	if ( s[0] == '1' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 49
NEI4 $162
line 239
;239:		UI_DrawProportionalString( 320, y, "CHEATS ARE ENABLED",
CNSTI4 320
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 $164
ARGP4
CNSTI4 2065
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 241
;240:			UI_CENTER|UI_SMALLFONT|UI_DROPSHADOW, colorWhite );
;241:		y += PROP_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 27
ADDI4
ASGNI4
line 242
;242:	}
LABELV $162
line 245
;243:
;244:	// game type
;245:	s = gt[cgs.gametype].longName;
ADDRLP4 0
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 36
MULI4
ADDRGP4 gt+4
ADDP4
INDIRP4
ASGNP4
line 247
;246:
;247:	UI_DrawProportionalString( 320, y, s,
CNSTI4 320
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2065
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 249
;248:		UI_CENTER|UI_SMALLFONT|UI_DROPSHADOW, colorWhite );
;249:	y += PROP_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 27
ADDI4
ASGNI4
line 251
;250:		
;251:	value = atoi( Info_ValueForKey( info, "timelimit" ) );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 $167
ARGP4
ADDRLP4 1088
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1088
INDIRP4
ARGP4
ADDRLP4 1092
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 1092
INDIRI4
ASGNI4
line 252
;252:	if ( value ) {
ADDRLP4 1036
INDIRI4
CNSTI4 0
EQI4 $168
line 253
;253:		UI_DrawProportionalString( 320, y, va( "timelimit %i", value ),
ADDRGP4 $170
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1096
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1096
INDIRP4
ARGP4
CNSTI4 2065
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 255
;254:			UI_CENTER|UI_SMALLFONT|UI_DROPSHADOW, colorWhite );
;255:		y += PROP_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 27
ADDI4
ASGNI4
line 256
;256:	}
LABELV $168
line 258
;257:
;258:	if (cgs.gametype < GT_CTF ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 4
GEI4 $171
line 259
;259:		value = atoi( Info_ValueForKey( info, "fraglimit" ) );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 $174
ARGP4
ADDRLP4 1096
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1096
INDIRP4
ARGP4
ADDRLP4 1100
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 1100
INDIRI4
ASGNI4
line 260
;260:		if ( value ) {
ADDRLP4 1036
INDIRI4
CNSTI4 0
EQI4 $175
line 261
;261:			UI_DrawProportionalString( 320, y, va( "fraglimit %i", value ),
ADDRGP4 $177
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1104
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1104
INDIRP4
ARGP4
CNSTI4 2065
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 263
;262:				UI_CENTER|UI_SMALLFONT|UI_DROPSHADOW, colorWhite );
;263:			y += PROP_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 27
ADDI4
ASGNI4
line 264
;264:		}
LABELV $175
line 265
;265:	}
LABELV $171
line 267
;266:
;267:	if (cgs.gametype >= GT_CTF) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 4
LTI4 $178
line 268
;268:		value = atoi( Info_ValueForKey( info, "capturelimit" ) );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 $181
ARGP4
ADDRLP4 1096
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1096
INDIRP4
ARGP4
ADDRLP4 1100
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 1100
INDIRI4
ASGNI4
line 269
;269:		if ( value ) {
ADDRLP4 1036
INDIRI4
CNSTI4 0
EQI4 $182
line 270
;270:			UI_DrawProportionalString( 320, y, va( "capturelimit %i", value ),
ADDRGP4 $184
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1104
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1104
INDIRP4
ARGP4
CNSTI4 2065
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 272
;271:				UI_CENTER|UI_SMALLFONT|UI_DROPSHADOW, colorWhite );
;272:			y += PROP_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 27
ADDI4
ASGNI4
line 273
;273:		}
LABELV $182
line 274
;274:	}
LABELV $178
line 275
;275:}
LABELV $121
endproc CG_DrawInformation 1108 36
bss
align 4
LABELV loadingItemIcons
skip 104
align 4
LABELV loadingPlayerIcons
skip 64
align 4
LABELV loadingItemIconCount
skip 4
align 4
LABELV loadingPlayerIconCount
skip 4
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
LABELV $184
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $181
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $177
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $174
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $170
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $167
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $164
byte 1 67
byte 1 72
byte 1 69
byte 1 65
byte 1 84
byte 1 83
byte 1 32
byte 1 65
byte 1 82
byte 1 69
byte 1 32
byte 1 69
byte 1 78
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 68
byte 1 0
align 1
LABELV $161
byte 1 115
byte 1 118
byte 1 95
byte 1 99
byte 1 104
byte 1 101
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $156
byte 1 32
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $153
byte 1 80
byte 1 117
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $152
byte 1 44
byte 1 32
byte 1 0
align 1
LABELV $147
byte 1 115
byte 1 118
byte 1 95
byte 1 112
byte 1 117
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $146
byte 1 85
byte 1 110
byte 1 108
byte 1 97
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $143
byte 1 103
byte 1 95
byte 1 117
byte 1 110
byte 1 108
byte 1 97
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $142
byte 1 115
byte 1 118
byte 1 95
byte 1 104
byte 1 111
byte 1 115
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $141
byte 1 65
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 115
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $139
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 46
byte 1 46
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $131
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 83
byte 1 104
byte 1 111
byte 1 116
byte 1 68
byte 1 101
byte 1 116
byte 1 97
byte 1 105
byte 1 108
byte 1 0
align 1
LABELV $126
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
LABELV $123
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
LABELV $122
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $120
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
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 47
byte 1 37
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $116
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $115
byte 1 110
byte 1 0
align 1
LABELV $112
byte 1 115
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $109
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
LABELV $106
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
LABELV $105
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $102
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
