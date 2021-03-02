export trap_Cvar_VariableValue
code
proc trap_Cvar_VariableValue 132 12
file "..\..\..\..\code\game\g_bot.c"
line 36
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// g_bot.c
;4:
;5:#include "g_local.h"
;6:
;7:
;8:static int		g_numBots;
;9:static char		*g_botInfos[MAX_BOTS];
;10:
;11:
;12:int				g_numArenas;
;13:static char		*g_arenaInfos[MAX_ARENAS];
;14:
;15:
;16:#define BOT_BEGIN_DELAY_BASE		2000
;17:#define BOT_BEGIN_DELAY_INCREMENT	1500
;18:
;19:#define BOT_SPAWN_QUEUE_DEPTH	16
;20:
;21:typedef struct {
;22:	int		clientNum;
;23:	int		spawnTime;
;24:} botSpawnQueue_t;
;25:
;26:static botSpawnQueue_t	botSpawnQueue[BOT_SPAWN_QUEUE_DEPTH];
;27:
;28:vmCvar_t bot_minplayers;
;29:
;30:extern gentity_t	*podium1;
;31:extern gentity_t	*podium2;
;32:extern gentity_t	*podium3;
;33:
;34:extern char mapname[ MAX_QPATH ];
;35:
;36:float trap_Cvar_VariableValue( const char *var_name ) {
line 39
;37:	char buf[128];
;38:
;39:	trap_Cvar_VariableStringBuffer(var_name, buf, sizeof(buf));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 40
;40:	return atof(buf);
ADDRLP4 0
ARGP4
ADDRLP4 128
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 128
INDIRF4
RETF4
LABELV $56
endproc trap_Cvar_VariableValue 132 12
export G_ParseInfos
proc G_ParseInfos 2084 12
line 50
;41:}
;42:
;43:
;44:
;45:/*
;46:===============
;47:G_ParseInfos
;48:===============
;49:*/
;50:int G_ParseInfos( char *buf, int max, char *infos[] ) {
line 56
;51:	char	*token;
;52:	int		count;
;53:	char	key[MAX_TOKEN_CHARS];
;54:	char	info[MAX_INFO_STRING];
;55:
;56:	count = 0;
ADDRLP4 2052
CNSTI4 0
ASGNI4
ADDRGP4 $59
JUMPV
LABELV $58
line 58
;57:
;58:	while ( 1 ) {
line 59
;59:		token = COM_Parse( &buf );
ADDRFP4 0
ARGP4
ADDRLP4 2056
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2056
INDIRP4
ASGNP4
line 60
;60:		if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $61
line 61
;61:			break;
ADDRGP4 $60
JUMPV
LABELV $61
line 63
;62:		}
;63:		if ( strcmp( token, "{" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $65
ARGP4
ADDRLP4 2060
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2060
INDIRI4
CNSTI4 0
EQI4 $63
line 64
;64:			Com_Printf( "Missing { in info file\n" );
ADDRGP4 $66
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 65
;65:			break;
ADDRGP4 $60
JUMPV
LABELV $63
line 68
;66:		}
;67:
;68:		if ( count == max ) {
ADDRLP4 2052
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $67
line 69
;69:			Com_Printf( "Max infos exceeded\n" );
ADDRGP4 $69
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 70
;70:			break;
ADDRGP4 $60
JUMPV
LABELV $67
line 73
;71:		}
;72:
;73:		info[0] = '\0';
ADDRLP4 1028
CNSTI1 0
ASGNI1
ADDRGP4 $71
JUMPV
LABELV $70
line 74
;74:		while ( 1 ) {
line 75
;75:			token = COM_ParseExt( &buf, qtrue );
ADDRFP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 2064
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2064
INDIRP4
ASGNP4
line 76
;76:			if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $73
line 77
;77:				Com_Printf( "Unexpected end of info file\n" );
ADDRGP4 $75
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 78
;78:				break;
ADDRGP4 $72
JUMPV
LABELV $73
line 80
;79:			}
;80:			if ( !strcmp( token, "}" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $78
ARGP4
ADDRLP4 2068
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2068
INDIRI4
CNSTI4 0
NEI4 $76
line 81
;81:				break;
ADDRGP4 $72
JUMPV
LABELV $76
line 83
;82:			}
;83:			Q_strncpyz( key, token, sizeof( key ) );
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 85
;84:
;85:			token = COM_ParseExt( &buf, qfalse );
ADDRFP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 2072
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2072
INDIRP4
ASGNP4
line 86
;86:			if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $79
line 87
;87:				strcpy( token, "<NULL>" );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $81
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 88
;88:			}
LABELV $79
line 89
;89:			Info_SetValueForKey( info, key, token );
ADDRLP4 1028
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 90
;90:		}
LABELV $71
line 74
ADDRGP4 $70
JUMPV
LABELV $72
line 92
;91:		//NOTE: extra space for arena number
;92:		infos[count] = G_Alloc(strlen(info) + strlen("\\num\\") + strlen(va("%d", MAX_ARENAS)) + 1);
ADDRLP4 1028
ARGP4
ADDRLP4 2064
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRGP4 $82
ARGP4
ADDRLP4 2068
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRGP4 $83
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 2072
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2072
INDIRP4
ARGP4
ADDRLP4 2076
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 2064
INDIRI4
ADDRLP4 2068
INDIRI4
ADDI4
ADDRLP4 2076
INDIRI4
ADDI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 2080
ADDRGP4 G_Alloc
CALLP4
ASGNP4
ADDRLP4 2052
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 2080
INDIRP4
ASGNP4
line 93
;93:		if (infos[count]) {
ADDRLP4 2052
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $84
line 94
;94:			strcpy(infos[count], info);
ADDRLP4 2052
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1028
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 95
;95:			count++;
ADDRLP4 2052
ADDRLP4 2052
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 96
;96:		}
LABELV $84
line 97
;97:	}
LABELV $59
line 58
ADDRGP4 $58
JUMPV
LABELV $60
line 98
;98:	return count;
ADDRLP4 2052
INDIRI4
RETI4
LABELV $57
endproc G_ParseInfos 2084 12
proc G_LoadArenasFromFile 8216 16
line 107
;99:}
;100:
;101:
;102:/*
;103:===============
;104:G_LoadArenasFromFile
;105:===============
;106:*/
;107:static void G_LoadArenasFromFile( const char *filename ) {
line 112
;108:	int				len;
;109:	fileHandle_t	f;
;110:	char			buf[MAX_ARENAS_TEXT];
;111:
;112:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8200
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8200
INDIRI4
ASGNI4
line 113
;113:	if ( f == FS_INVALID_HANDLE ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $87
line 114
;114:		trap_Print( va( S_COLOR_RED "file not found: %s\n", filename ) );
ADDRGP4 $89
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8204
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8204
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 115
;115:		return;
ADDRGP4 $86
JUMPV
LABELV $87
line 117
;116:	}
;117:	if ( len >= MAX_ARENAS_TEXT ) {
ADDRLP4 0
INDIRI4
CNSTI4 8192
LTI4 $90
line 118
;118:		trap_Print( va( S_COLOR_RED "file too large: %s is %i, max allowed is %i", filename, len, MAX_ARENAS_TEXT ) );
ADDRGP4 $92
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 8192
ARGI4
ADDRLP4 8204
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8204
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 119
;119:		trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 120
;120:		return;
ADDRGP4 $86
JUMPV
LABELV $90
line 123
;121:	}
;122:
;123:	trap_FS_Read( buf, len, f );
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 124
;124:	buf[len] = 0;
ADDRLP4 0
INDIRI4
ADDRLP4 8
ADDP4
CNSTI1 0
ASGNI1
line 125
;125:	trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 127
;126:
;127:	g_numArenas += G_ParseInfos( buf, MAX_ARENAS - g_numArenas, &g_arenaInfos[g_numArenas] );
ADDRLP4 8
ARGP4
ADDRLP4 8204
ADDRGP4 g_numArenas
ASGNP4
ADDRLP4 8208
ADDRLP4 8204
INDIRP4
INDIRI4
ASGNI4
CNSTI4 1024
ADDRLP4 8208
INDIRI4
SUBI4
ARGI4
ADDRLP4 8208
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_arenaInfos
ADDP4
ARGP4
ADDRLP4 8212
ADDRGP4 G_ParseInfos
CALLI4
ASGNI4
ADDRLP4 8204
INDIRP4
ADDRLP4 8208
INDIRI4
ADDRLP4 8212
INDIRI4
ADDI4
ASGNI4
line 128
;128:}
LABELV $86
endproc G_LoadArenasFromFile 8216 16
proc G_LoadArenas 1456 16
line 136
;129:
;130:
;131:/*
;132:===============
;133:G_LoadArenas
;134:===============
;135:*/
;136:static void G_LoadArenas( void ) {
line 145
;137:	int			numdirs;
;138:	vmCvar_t	arenasFile;
;139:	char		filename[128];
;140:	char		dirlist[1024];
;141:	char*		dirptr;
;142:	int			i, n;
;143:	int			dirlen;
;144:
;145:	g_numArenas = 0;
ADDRGP4 g_numArenas
CNSTI4 0
ASGNI4
line 147
;146:
;147:	trap_Cvar_Register( &arenasFile, "g_arenasFile", "", CVAR_INIT|CVAR_ROM );
ADDRLP4 1172
ARGP4
ADDRGP4 $94
ARGP4
ADDRGP4 $95
ARGP4
CNSTI4 80
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 148
;148:	if( *arenasFile.string ) {
ADDRLP4 1172+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $96
line 149
;149:		G_LoadArenasFromFile(arenasFile.string);
ADDRLP4 1172+16
ARGP4
ADDRGP4 G_LoadArenasFromFile
CALLV
pop
line 150
;150:	}
ADDRGP4 $97
JUMPV
LABELV $96
line 151
;151:	else {
line 152
;152:		G_LoadArenasFromFile("scripts/arenas.txt");
ADDRGP4 $100
ARGP4
ADDRGP4 G_LoadArenasFromFile
CALLV
pop
line 153
;153:	}
LABELV $97
line 156
;154:
;155:	// get all arenas from .arena files
;156:	numdirs = trap_FS_GetFileList( "scripts", ".arena", dirlist, sizeof( dirlist ) );
ADDRGP4 $101
ARGP4
ADDRGP4 $102
ARGP4
ADDRLP4 148
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1444
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 144
ADDRLP4 1444
INDIRI4
ASGNI4
line 157
;157:	dirptr  = dirlist;
ADDRLP4 4
ADDRLP4 148
ASGNP4
line 158
;158:	for (i = 0; i < numdirs; i++, dirptr += dirlen+1) {
ADDRLP4 136
CNSTI4 0
ASGNI4
ADDRGP4 $106
JUMPV
LABELV $103
line 159
;159:		dirlen = (int)strlen(dirptr);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 1448
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 140
ADDRLP4 1448
INDIRI4
ASGNI4
line 160
;160:		strcpy(filename, "scripts/");
ADDRLP4 8
ARGP4
ADDRGP4 $107
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 161
;161:		strcat(filename, dirptr);
ADDRLP4 8
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 162
;162:		G_LoadArenasFromFile(filename);
ADDRLP4 8
ARGP4
ADDRGP4 G_LoadArenasFromFile
CALLV
pop
line 163
;163:	}
LABELV $104
line 158
ADDRLP4 136
ADDRLP4 136
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 4
INDIRP4
ADDP4
ASGNP4
LABELV $106
ADDRLP4 136
INDIRI4
ADDRLP4 144
INDIRI4
LTI4 $103
line 164
;164:	trap_Print( va( "%i arenas parsed\n", g_numArenas ) );
ADDRGP4 $108
ARGP4
ADDRGP4 g_numArenas
INDIRI4
ARGI4
ADDRLP4 1448
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1448
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 166
;165:	
;166:	for( n = 0; n < g_numArenas; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $112
JUMPV
LABELV $109
line 167
;167:		Info_SetValueForKey( g_arenaInfos[n], "num", va( "%i", n ) );
ADDRGP4 $114
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1452
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $113
ARGP4
ADDRLP4 1452
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 168
;168:	}
LABELV $110
line 166
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $112
ADDRLP4 0
INDIRI4
ADDRGP4 g_numArenas
INDIRI4
LTI4 $109
line 169
;169:}
LABELV $93
endproc G_LoadArenas 1456 16
export G_GetArenaInfoByMap
proc G_GetArenaInfoByMap 12 8
line 177
;170:
;171:
;172:/*
;173:===============
;174:G_GetArenaInfoByNumber
;175:===============
;176:*/
;177:const char *G_GetArenaInfoByMap( const char *map ) {
line 180
;178:	int			n;
;179:
;180:	for( n = 0; n < g_numArenas; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $119
JUMPV
LABELV $116
line 181
;181:		if( Q_stricmp( Info_ValueForKey( g_arenaInfos[n], "map" ), map ) == 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $122
ARGP4
ADDRLP4 4
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $120
line 182
;182:			return g_arenaInfos[n];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_arenaInfos
ADDP4
INDIRP4
RETP4
ADDRGP4 $115
JUMPV
LABELV $120
line 184
;183:		}
;184:	}
LABELV $117
line 180
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $119
ADDRLP4 0
INDIRI4
ADDRGP4 g_numArenas
INDIRI4
LTI4 $116
line 186
;185:
;186:	return NULL;
CNSTP4 0
RETP4
LABELV $115
endproc G_GetArenaInfoByMap 12 8
proc PlayerIntroSound 80 12
line 195
;187:}
;188:
;189:
;190:/*
;191:=================
;192:PlayerIntroSound
;193:=================
;194:*/
;195:static void PlayerIntroSound( const char *modelAndSkin ) {
line 199
;196:	char	model[MAX_QPATH];
;197:	char	*skin;
;198:
;199:	Q_strncpyz( model, modelAndSkin, sizeof(model) );
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
line 200
;200:	skin = Q_strrchr( model, '/' );
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
line 201
;201:	if ( skin ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $124
line 202
;202:		*skin++ = '\0';
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
line 203
;203:	}
ADDRGP4 $125
JUMPV
LABELV $124
line 204
;204:	else {
line 205
;205:		skin = model;
ADDRLP4 0
ADDRLP4 4
ASGNP4
line 206
;206:	}
LABELV $125
line 208
;207:
;208:	if( Q_stricmp( skin, "default" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $128
ARGP4
ADDRLP4 72
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $126
line 209
;209:		skin = model;
ADDRLP4 0
ADDRLP4 4
ASGNP4
line 210
;210:	}
LABELV $126
line 212
;211:
;212:	trap_SendConsoleCommand( EXEC_APPEND, va( "play sound/player/announce/%s.wav\n", skin ) );
ADDRGP4 $129
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 213
;213:}
LABELV $123
endproc PlayerIntroSound 80 12
export G_AddRandomBot
proc G_AddRandomBot 96 16
line 221
;214:
;215:
;216:/*
;217:===============
;218:G_AddRandomBot
;219:===============
;220:*/
;221:void G_AddRandomBot( team_t team ) {
line 227
;222:	int		i, n, num;
;223:	float	skill;
;224:	char	*value, netname[36], *teamstr, *skillstr;
;225:	gclient_t	*cl;
;226:
;227:	num = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 228
;228:	for ( n = 0; n < g_numBots ; n++ ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $134
JUMPV
LABELV $131
line 229
;229:		value = Info_ValueForKey( g_botInfos[n], "name" );
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $135
ARGP4
ADDRLP4 68
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 68
INDIRP4
ASGNP4
line 231
;230:		//
;231:		for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $139
JUMPV
LABELV $136
line 232
;232:			cl = level.clients + i;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 1636
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 233
;233:			if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $141
line 234
;234:				continue;
ADDRGP4 $137
JUMPV
LABELV $141
line 236
;235:			}
;236:			if ( !(g_entities[i].r.svFlags & SVF_BOT) ) {
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
NEI4 $143
line 237
;237:				continue;
ADDRGP4 $137
JUMPV
LABELV $143
line 239
;238:			}
;239:			if ( team >= 0 && cl->sess.sessionTeam != team ) {
ADDRLP4 72
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
LTI4 $147
ADDRLP4 4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ADDRLP4 72
INDIRI4
EQI4 $147
line 240
;240:				continue;
ADDRGP4 $137
JUMPV
LABELV $147
line 242
;241:			}
;242:			if ( !Q_stricmp( value, cl->pers.netname ) ) {
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 76
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $149
line 243
;243:				break;
ADDRGP4 $138
JUMPV
LABELV $149
line 245
;244:			}
;245:		}
LABELV $137
line 231
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $139
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $136
LABELV $138
line 246
;246:		if (i >= level.maxclients) {
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $151
line 247
;247:			num++;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 248
;248:		}
LABELV $151
line 249
;249:	}
LABELV $132
line 228
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $134
ADDRLP4 12
INDIRI4
ADDRGP4 g_numBots
INDIRI4
LTI4 $131
line 250
;250:	num = random() * num;
ADDRLP4 68
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 68
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 20
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 251
;251:	for ( n = 0; n < g_numBots ; n++ ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $157
JUMPV
LABELV $154
line 253
;252:
;253:		value = Info_ValueForKey( g_botInfos[ n ], "name" );
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $135
ARGP4
ADDRLP4 72
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 72
INDIRP4
ASGNP4
line 255
;254:
;255:		skillstr = Info_ValueForKey( g_botInfos[ n ], "skill" );
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $158
ARGP4
ADDRLP4 76
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 76
INDIRP4
ASGNP4
line 256
;256:		if ( *skillstr )
ADDRLP4 16
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $159
line 257
;257:			skill = atof( skillstr );
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 80
INDIRF4
ASGNF4
ADDRGP4 $160
JUMPV
LABELV $159
line 259
;258:		else
;259:			skill = trap_Cvar_VariableValue( "g_spSkill" );
ADDRGP4 $161
ARGP4
ADDRLP4 84
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 84
INDIRF4
ASGNF4
LABELV $160
line 261
;260:
;261:		for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $165
JUMPV
LABELV $162
line 262
;262:			cl = level.clients + i;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 1636
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 263
;263:			if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $167
line 264
;264:				continue;
ADDRGP4 $163
JUMPV
LABELV $167
line 266
;265:			}
;266:			if ( !(g_entities[i].r.svFlags & SVF_BOT) ) {
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
NEI4 $169
line 267
;267:				continue;
ADDRGP4 $163
JUMPV
LABELV $169
line 269
;268:			}
;269:			if ( team >= 0 && cl->sess.sessionTeam != team ) {
ADDRLP4 88
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
LTI4 $173
ADDRLP4 4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ADDRLP4 88
INDIRI4
EQI4 $173
line 270
;270:				continue;
ADDRGP4 $163
JUMPV
LABELV $173
line 272
;271:			}
;272:			if ( !Q_stricmp( value, cl->pers.netname ) ) {
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 92
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $175
line 273
;273:				break;
ADDRGP4 $164
JUMPV
LABELV $175
line 275
;274:			}
;275:		}
LABELV $163
line 261
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $165
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $162
LABELV $164
line 276
;276:		if (i >= level.maxclients) {
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $177
line 277
;277:			num--;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 278
;278:			if ( num <= 0 ) {
ADDRLP4 20
INDIRI4
CNSTI4 0
GTI4 $180
line 279
;279:				if (team == TEAM_RED) teamstr = "red";
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $182
ADDRLP4 64
ADDRGP4 $184
ASGNP4
ADDRGP4 $183
JUMPV
LABELV $182
line 280
;280:				else if (team == TEAM_BLUE) teamstr = "blue";
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $185
ADDRLP4 64
ADDRGP4 $187
ASGNP4
ADDRGP4 $186
JUMPV
LABELV $185
line 281
;281:				else teamstr = "";
ADDRLP4 64
ADDRGP4 $95
ASGNP4
LABELV $186
LABELV $183
line 282
;282:				Q_strncpyz(netname, value, sizeof(netname));
ADDRLP4 28
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 283
;283:				Q_CleanStr(netname);
ADDRLP4 28
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 284
;284:				trap_SendConsoleCommand( EXEC_INSERT, va( "addbot %s %1.2f %s 0\n", netname, skill, teamstr ) );
ADDRGP4 $188
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 285
;285:				return;
ADDRGP4 $130
JUMPV
LABELV $180
line 287
;286:			}
;287:		}
LABELV $177
line 288
;288:	}
LABELV $155
line 251
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $157
ADDRLP4 12
INDIRI4
ADDRGP4 g_numBots
INDIRI4
LTI4 $154
line 289
;289:}
LABELV $130
endproc G_AddRandomBot 96 16
export G_RemoveRandomBot
proc G_RemoveRandomBot 52 8
line 297
;290:
;291:
;292:/*
;293:===============
;294:G_RemoveRandomBot
;295:===============
;296:*/
;297:int G_RemoveRandomBot( int team ) {
line 302
;298:	int i;
;299:	char netname[36];
;300:	gclient_t	*cl;
;301:
;302:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $193
JUMPV
LABELV $190
line 303
;303:		cl = level.clients + i;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 1636
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 304
;304:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $195
line 305
;305:			continue;
ADDRGP4 $191
JUMPV
LABELV $195
line 307
;306:		}
;307:		if ( !(g_entities[i].r.svFlags & SVF_BOT) ) {
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
NEI4 $197
line 308
;308:			continue;
ADDRGP4 $191
JUMPV
LABELV $197
line 310
;309:		}
;310:		if ( team >= 0 && cl->sess.sessionTeam != team ) {
ADDRLP4 44
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
LTI4 $201
ADDRLP4 4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $201
line 311
;311:			continue;
ADDRGP4 $191
JUMPV
LABELV $201
line 313
;312:		}
;313:		strcpy(netname, cl->pers.netname);
ADDRLP4 8
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 314
;314:		Q_CleanStr(netname);
ADDRLP4 8
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 315
;315:		trap_SendConsoleCommand( EXEC_INSERT, va("kick %s\n", netname) );
ADDRGP4 $203
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 316
;316:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $189
JUMPV
LABELV $191
line 302
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $193
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $190
line 318
;317:	}
;318:	return qfalse;
CNSTI4 0
RETI4
LABELV $189
endproc G_RemoveRandomBot 52 8
proc G_CountHumanPlayers 16 0
line 327
;319:}
;320:
;321:
;322:/*
;323:===============
;324:G_CountHumanPlayers
;325:===============
;326:*/
;327:static int G_CountHumanPlayers( team_t team ) {
line 331
;328:	int i, num;
;329:	gclient_t	*cl;
;330:
;331:	num = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 332
;332:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $208
JUMPV
LABELV $205
line 333
;333:		cl = level.clients + i;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 1636
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 334
;334:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $210
line 335
;335:			continue;
ADDRGP4 $206
JUMPV
LABELV $210
line 337
;336:		}
;337:		if ( g_entities[i].r.svFlags & SVF_BOT ) {
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
EQI4 $212
line 338
;338:			continue;
ADDRGP4 $206
JUMPV
LABELV $212
line 340
;339:		}
;340:		if ( team >= 0 && cl->sess.sessionTeam != team ) {
ADDRLP4 12
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
LTI4 $216
ADDRLP4 4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $216
line 341
;341:			continue;
ADDRGP4 $206
JUMPV
LABELV $216
line 343
;342:		}
;343:		num++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 344
;344:	}
LABELV $206
line 332
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $208
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $205
line 345
;345:	return num;
ADDRLP4 8
INDIRI4
RETI4
LABELV $204
endproc G_CountHumanPlayers 16 0
proc G_CountBotPlayers 20 0
line 354
;346:}
;347:
;348:
;349:/*
;350:===============
;351:G_CountBotPlayers
;352:===============
;353:*/
;354:static int G_CountBotPlayers( team_t team ) {
line 358
;355:	int i, n, num;
;356:	gclient_t	*cl;
;357:
;358:	num = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 359
;359:	for ( i=0 ; i< level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $222
JUMPV
LABELV $219
line 360
;360:		cl = level.clients + i;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 1636
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 361
;361:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 8
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $224
line 362
;362:			continue;
ADDRGP4 $220
JUMPV
LABELV $224
line 364
;363:		}
;364:		if ( !(g_entities[i].r.svFlags & SVF_BOT) ) {
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
NEI4 $226
line 365
;365:			continue;
ADDRGP4 $220
JUMPV
LABELV $226
line 367
;366:		}
;367:		if ( team >= 0 && cl->sess.sessionTeam != team ) {
ADDRLP4 16
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $230
ADDRLP4 8
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $230
line 368
;368:			continue;
ADDRGP4 $220
JUMPV
LABELV $230
line 370
;369:		}
;370:		num++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 371
;371:	}
LABELV $220
line 359
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $222
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $219
line 372
;372:	for( n = 0; n < BOT_SPAWN_QUEUE_DEPTH; n++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $232
line 373
;373:		if( !botSpawnQueue[n].spawnTime ) {
ADDRLP4 4
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $236
line 374
;374:			continue;
ADDRGP4 $233
JUMPV
LABELV $236
line 376
;375:		}
;376:		if ( botSpawnQueue[n].spawnTime > level.time ) {
ADDRLP4 4
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $239
line 377
;377:			continue;
ADDRGP4 $233
JUMPV
LABELV $239
line 379
;378:		}
;379:		num++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 380
;380:	}
LABELV $233
line 372
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 16
LTI4 $232
line 381
;381:	return num;
ADDRLP4 12
INDIRI4
RETI4
LABELV $218
endproc G_CountBotPlayers 20 0
bss
align 4
LABELV $244
skip 4
export G_CheckMinimumPlayers
code
proc G_CheckMinimumPlayers 36 4
line 390
;382:}
;383:
;384:
;385:/*
;386:===============
;387:G_CheckMinimumPlayers
;388:===============
;389:*/
;390:void G_CheckMinimumPlayers( void ) {
line 395
;391:	int minplayers;
;392:	int humanplayers, botplayers;
;393:	static int checkminimumplayers_time;
;394:
;395:	if ( level.intermissiontime )
ADDRGP4 level+7604
INDIRI4
CNSTI4 0
EQI4 $245
line 396
;396:		return;
ADDRGP4 $243
JUMPV
LABELV $245
line 399
;397:
;398:	//only check once each 10 seconds
;399:	if ( checkminimumplayers_time > level.time - 10000 )
ADDRGP4 $244
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
SUBI4
LEI4 $248
line 400
;400:		return;
ADDRGP4 $243
JUMPV
LABELV $248
line 402
;401:
;402:	if ( level.time - level.startTime < 2000 )
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+40
INDIRI4
SUBI4
CNSTI4 2000
GEI4 $251
line 403
;403:		return;
ADDRGP4 $243
JUMPV
LABELV $251
line 405
;404:
;405:	checkminimumplayers_time = level.time;
ADDRGP4 $244
ADDRGP4 level+32
INDIRI4
ASGNI4
line 406
;406:	trap_Cvar_Update(&bot_minplayers);
ADDRGP4 bot_minplayers
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 407
;407:	minplayers = bot_minplayers.integer;
ADDRLP4 0
ADDRGP4 bot_minplayers+12
INDIRI4
ASGNI4
line 408
;408:	if (minplayers <= 0) return;
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $257
ADDRGP4 $243
JUMPV
LABELV $257
line 410
;409:
;410:	if ( GTx( g_gametype.integer, GTF_TEAMS ) ) {
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
EQI4 $259
line 411
;411:		if (minplayers >= level.maxclients / 2) {
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
CNSTI4 2
DIVI4
LTI4 $263
line 412
;412:			minplayers = (level.maxclients / 2) -1;
ADDRLP4 0
ADDRGP4 level+24
INDIRI4
CNSTI4 2
DIVI4
CNSTI4 1
SUBI4
ASGNI4
line 413
;413:		}
LABELV $263
line 415
;414:
;415:		humanplayers = G_CountHumanPlayers( TEAM_RED );
CNSTI4 1
ARGI4
ADDRLP4 12
ADDRGP4 G_CountHumanPlayers
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 416
;416:		botplayers = G_CountBotPlayers(	TEAM_RED );
CNSTI4 1
ARGI4
ADDRLP4 16
ADDRGP4 G_CountBotPlayers
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 418
;417:		//
;418:		if (humanplayers + botplayers < minplayers) {
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
GEI4 $267
line 419
;419:			G_AddRandomBot( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 G_AddRandomBot
CALLV
pop
line 420
;420:		} else if (humanplayers + botplayers > minplayers && botplayers) {
ADDRGP4 $268
JUMPV
LABELV $267
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
LEI4 $269
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $269
line 421
;421:			G_RemoveRandomBot( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 G_RemoveRandomBot
CALLI4
pop
line 422
;422:		}
LABELV $269
LABELV $268
line 424
;423:		//
;424:		humanplayers = G_CountHumanPlayers( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRLP4 24
ADDRGP4 G_CountHumanPlayers
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 24
INDIRI4
ASGNI4
line 425
;425:		botplayers = G_CountBotPlayers( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRLP4 28
ADDRGP4 G_CountBotPlayers
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 28
INDIRI4
ASGNI4
line 427
;426:		//
;427:		if (humanplayers + botplayers < minplayers) {
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
GEI4 $271
line 428
;428:			G_AddRandomBot( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 G_AddRandomBot
CALLV
pop
line 429
;429:		} else if (humanplayers + botplayers > minplayers && botplayers) {
ADDRGP4 $260
JUMPV
LABELV $271
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
LEI4 $260
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $260
line 430
;430:			G_RemoveRandomBot( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 G_RemoveRandomBot
CALLI4
pop
line 431
;431:		}
line 432
;432:	}
ADDRGP4 $260
JUMPV
LABELV $259
line 433
;433:	else if ( GTx( g_gametype.integer, GTF_DUEL ) ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 36
MULI4
ADDRGP4 gt+20
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $275
line 434
;434:		if (minplayers >= level.maxclients) {
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $279
line 435
;435:			minplayers = level.maxclients-1;
ADDRLP4 0
ADDRGP4 level+24
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 436
;436:		}
LABELV $279
line 437
;437:		humanplayers = G_CountHumanPlayers( -1 );
CNSTI4 -1
ARGI4
ADDRLP4 12
ADDRGP4 G_CountHumanPlayers
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 438
;438:		botplayers = G_CountBotPlayers( -1 );
CNSTI4 -1
ARGI4
ADDRLP4 16
ADDRGP4 G_CountBotPlayers
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 440
;439:		//
;440:		if (humanplayers + botplayers < minplayers) {
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
GEI4 $283
line 441
;441:			G_AddRandomBot( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 G_AddRandomBot
CALLV
pop
line 442
;442:		} else if (humanplayers + botplayers > minplayers && botplayers) {
ADDRGP4 $276
JUMPV
LABELV $283
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
LEI4 $276
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $276
line 444
;443:			// try to remove spectators first
;444:			if (!G_RemoveRandomBot( TEAM_SPECTATOR )) {
CNSTI4 3
ARGI4
ADDRLP4 24
ADDRGP4 G_RemoveRandomBot
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $276
line 446
;445:				// just remove the bot that is playing
;446:				G_RemoveRandomBot( -1 );
CNSTI4 -1
ARGI4
ADDRGP4 G_RemoveRandomBot
CALLI4
pop
line 447
;447:			}
line 448
;448:		}
line 449
;449:	}
ADDRGP4 $276
JUMPV
LABELV $275
line 450
;450:	else if ( gt[g_gametype.integer].gtGoal ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 36
MULI4
ADDRGP4 gt+28
ADDP4
INDIRI4
CNSTI4 0
EQI4 $289
line 451
;451:		if (minplayers >= level.maxclients) {
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $293
line 452
;452:			minplayers = level.maxclients-1;
ADDRLP4 0
ADDRGP4 level+24
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 453
;453:		}
LABELV $293
line 454
;454:		humanplayers = G_CountHumanPlayers( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRLP4 12
ADDRGP4 G_CountHumanPlayers
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 455
;455:		botplayers = G_CountBotPlayers( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRLP4 16
ADDRGP4 G_CountBotPlayers
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 457
;456:		//
;457:		if (humanplayers + botplayers < minplayers) {
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
GEI4 $297
line 458
;458:			G_AddRandomBot( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 G_AddRandomBot
CALLV
pop
line 459
;459:		} else if (humanplayers + botplayers > minplayers && botplayers) {
ADDRGP4 $298
JUMPV
LABELV $297
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
LEI4 $299
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $299
line 460
;460:			G_RemoveRandomBot( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 G_RemoveRandomBot
CALLI4
pop
line 461
;461:		}
LABELV $299
LABELV $298
line 462
;462:	}
LABELV $289
LABELV $276
LABELV $260
line 463
;463:}
LABELV $243
endproc G_CheckMinimumPlayers 36 4
export G_CheckBotSpawn
proc G_CheckBotSpawn 1032 12
line 471
;464:
;465:
;466:/*
;467:===============
;468:G_CheckBotSpawn
;469:===============
;470:*/
;471:void G_CheckBotSpawn( void ) {
line 475
;472:	int		n;
;473:	char	userinfo[MAX_INFO_VALUE];
;474:
;475:	G_CheckMinimumPlayers();
ADDRGP4 G_CheckMinimumPlayers
CALLV
pop
line 477
;476:
;477:	for( n = 0; n < BOT_SPAWN_QUEUE_DEPTH; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $302
line 478
;478:		if( !botSpawnQueue[n].spawnTime ) {
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $306
line 479
;479:			continue;
ADDRGP4 $303
JUMPV
LABELV $306
line 481
;480:		}
;481:		if ( botSpawnQueue[n].spawnTime > level.time ) {
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $309
line 482
;482:			continue;
ADDRGP4 $303
JUMPV
LABELV $309
line 484
;483:		}
;484:		ClientBegin( botSpawnQueue[n].clientNum );
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue
ADDP4
INDIRI4
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 485
;485:		botSpawnQueue[n].spawnTime = 0;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
CNSTI4 0
ASGNI4
line 487
;486:
;487:		if( g_gametype.integer == GT_CAMPAIGN ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
NEI4 $314
line 488
;488:			trap_GetUserinfo( botSpawnQueue[n].clientNum, userinfo, sizeof(userinfo) );
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 489
;489:			PlayerIntroSound( Info_ValueForKey (userinfo, "model") );
ADDRLP4 4
ARGP4
ADDRGP4 $317
ARGP4
ADDRLP4 1028
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 PlayerIntroSound
CALLV
pop
line 490
;490:		}
LABELV $314
line 491
;491:	}
LABELV $303
line 477
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $302
line 492
;492:}
LABELV $301
endproc G_CheckBotSpawn 1032 12
proc AddBotToSpawnQueue 4 4
line 500
;493:
;494:
;495:/*
;496:===============
;497:AddBotToSpawnQueue
;498:===============
;499:*/
;500:static void AddBotToSpawnQueue( int clientNum, int delay ) {
line 503
;501:	int		n;
;502:
;503:	for( n = 0; n < BOT_SPAWN_QUEUE_DEPTH; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $319
line 504
;504:		if( !botSpawnQueue[n].spawnTime ) {
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $323
line 505
;505:			botSpawnQueue[n].spawnTime = level.time + delay;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 506
;506:			botSpawnQueue[n].clientNum = clientNum;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 507
;507:			return;
ADDRGP4 $318
JUMPV
LABELV $323
line 509
;508:		}
;509:	}
LABELV $320
line 503
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $319
line 511
;510:
;511:	G_Printf( S_COLOR_YELLOW "Unable to delay bot spawn\n" );
ADDRGP4 $328
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 513
;512:
;513:	ClientBegin( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 514
;514:}
LABELV $318
endproc AddBotToSpawnQueue 4 4
export G_RemoveQueuedBotBegin
proc G_RemoveQueuedBotBegin 4 0
line 525
;515:
;516:
;517:/*
;518:===============
;519:G_RemoveQueuedBotBegin
;520:
;521:Called on client disconnect to make sure the delayed spawn
;522:doesn't happen on a freed index
;523:===============
;524:*/
;525:void G_RemoveQueuedBotBegin( int clientNum ) {
line 528
;526:	int		n;
;527:
;528:	for( n = 0; n < BOT_SPAWN_QUEUE_DEPTH; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $330
line 529
;529:		if( botSpawnQueue[n].clientNum == clientNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $334
line 530
;530:			botSpawnQueue[n].spawnTime = 0;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
CNSTI4 0
ASGNI4
line 531
;531:			return;
ADDRGP4 $329
JUMPV
LABELV $334
line 533
;532:		}
;533:	}
LABELV $331
line 528
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $330
line 534
;534:}
LABELV $329
endproc G_RemoveQueuedBotBegin 4 0
export G_BotConnect
proc G_BotConnect 1336 12
line 542
;535:
;536:
;537:/*
;538:===============
;539:G_BotConnect
;540:===============
;541:*/
;542:qboolean G_BotConnect( int clientNum, qboolean restart ) {
line 546
;543:	bot_settings_t	settings;
;544:	char			userinfo[MAX_INFO_STRING];
;545:
;546:	trap_GetUserinfo( clientNum, userinfo, sizeof(userinfo) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 292
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 548
;547:
;548:	Q_strncpyz( settings.characterfile, Info_ValueForKey( userinfo, "characterfile" ), sizeof(settings.characterfile) );
ADDRLP4 292
ARGP4
ADDRGP4 $338
ARGP4
ADDRLP4 1316
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 1316
INDIRP4
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 549
;549:	settings.skill = atof( Info_ValueForKey( userinfo, "skill" ) );
ADDRLP4 292
ARGP4
ADDRGP4 $158
ARGP4
ADDRLP4 1320
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1320
INDIRP4
ARGP4
ADDRLP4 1324
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0+144
ADDRLP4 1324
INDIRF4
ASGNF4
line 550
;550:	Q_strncpyz( settings.team, Info_ValueForKey( userinfo, "team" ), sizeof(settings.team) );
ADDRLP4 292
ARGP4
ADDRGP4 $341
ARGP4
ADDRLP4 1328
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0+148
ARGP4
ADDRLP4 1328
INDIRP4
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 552
;551:
;552:	if (!BotAISetupClient( clientNum, &settings, restart )) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 1332
ADDRGP4 BotAISetupClient
CALLI4
ASGNI4
ADDRLP4 1332
INDIRI4
CNSTI4 0
NEI4 $343
line 553
;553:		trap_DropClient( clientNum, "BotAISetupClient failed" );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $345
ARGP4
ADDRGP4 trap_DropClient
CALLV
pop
line 554
;554:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $337
JUMPV
LABELV $343
line 557
;555:	}
;556:
;557:	return qtrue;
CNSTI4 1
RETI4
LABELV $337
endproc G_BotConnect 1336 12
proc G_AddBot 1388 16
line 566
;558:}
;559:
;560:
;561:/*
;562:===============
;563:G_AddBot
;564:===============
;565:*/
;566:static void G_AddBot( const char *name, float skill, const char *team, int delay, const char *altname ) {
line 579
;567:	int				clientNum;
;568:	char			*botinfo;
;569:	gentity_t		*bot;
;570:	char			*key;
;571:	char			*s;
;572:	const char		*botname;
;573:	const char		*model;
;574:	const char		*headmodel;
;575:	char			userinfo[MAX_INFO_STRING];
;576:	char			nm[MAX_CVAR_VALUE_STRING];
;577:
;578:	// get the botinfo from bots.txt
;579:	botinfo = G_GetBotInfoByName( name );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1312
ADDRGP4 G_GetBotInfoByName
CALLP4
ASGNP4
ADDRLP4 1032
ADDRLP4 1312
INDIRP4
ASGNP4
line 580
;580:	if ( !botinfo ) {
ADDRLP4 1032
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $347
line 581
;581:		G_Printf( S_COLOR_RED "Error: Bot '%s' not defined\n", name );
ADDRGP4 $349
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 582
;582:		return;
ADDRGP4 $346
JUMPV
LABELV $347
line 586
;583:	}
;584:
;585:	// create the bot's userinfo
;586:	userinfo[0] = '\0';
ADDRLP4 0
CNSTI1 0
ASGNI1
line 588
;587:
;588:	botname = Info_ValueForKey( botinfo, "funname" );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 $350
ARGP4
ADDRLP4 1316
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1040
ADDRLP4 1316
INDIRP4
ASGNP4
line 589
;589:	if( !botname[0] ) {
ADDRLP4 1040
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $351
line 590
;590:		botname = Info_ValueForKey( botinfo, "name" );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 $135
ARGP4
ADDRLP4 1320
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1040
ADDRLP4 1320
INDIRP4
ASGNP4
line 591
;591:	}
LABELV $351
line 593
;592:	// check for an alternative name
;593:	if (altname && altname[0]) {
ADDRLP4 1320
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 1320
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $353
ADDRLP4 1320
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $353
line 594
;594:		botname = altname;
ADDRLP4 1040
ADDRFP4 16
INDIRP4
ASGNP4
line 595
;595:	}
LABELV $353
line 597
;596:
;597:	BG_CleanName( botname, nm, sizeof( nm ), "unnamed bot" );
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1056
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $355
ARGP4
ADDRGP4 BG_CleanName
CALLV
pop
line 598
;598:	Info_SetValueForKey( userinfo, "name", nm );
ADDRLP4 0
ARGP4
ADDRGP4 $135
ARGP4
ADDRLP4 1056
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 600
;599:
;600:	Info_SetValueForKey( userinfo, "rate", "25000" );
ADDRLP4 0
ARGP4
ADDRGP4 $356
ARGP4
ADDRGP4 $357
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 601
;601:	Info_SetValueForKey( userinfo, "snaps", va( "%i", sv_fps.integer ) );
ADDRGP4 $114
ARGP4
ADDRGP4 sv_fps+12
INDIRI4
ARGI4
ADDRLP4 1324
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRGP4 $358
ARGP4
ADDRLP4 1324
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 602
;602:	Info_SetValueForKey( userinfo, "skill", va("%1.2f", skill) );
ADDRGP4 $360
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 1328
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRGP4 $158
ARGP4
ADDRLP4 1328
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 604
;603:
;604:	if ( skill >= 1 && skill < 2 ) {
ADDRLP4 1332
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 1332
INDIRF4
CNSTF4 1065353216
LTF4 $361
ADDRLP4 1332
INDIRF4
CNSTF4 1073741824
GEF4 $361
line 605
;605:		Info_SetValueForKey( userinfo, "handicap", "50" );
ADDRLP4 0
ARGP4
ADDRGP4 $363
ARGP4
ADDRGP4 $364
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 606
;606:	}
ADDRGP4 $362
JUMPV
LABELV $361
line 607
;607:	else if ( skill >= 2 && skill < 3 ) {
ADDRLP4 1336
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 1336
INDIRF4
CNSTF4 1073741824
LTF4 $365
ADDRLP4 1336
INDIRF4
CNSTF4 1077936128
GEF4 $365
line 608
;608:		Info_SetValueForKey( userinfo, "handicap", "70" );
ADDRLP4 0
ARGP4
ADDRGP4 $363
ARGP4
ADDRGP4 $367
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 609
;609:	}
ADDRGP4 $366
JUMPV
LABELV $365
line 610
;610:	else if ( skill >= 3 && skill < 4 ) {
ADDRLP4 1340
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 1340
INDIRF4
CNSTF4 1077936128
LTF4 $368
ADDRLP4 1340
INDIRF4
CNSTF4 1082130432
GEF4 $368
line 611
;611:		Info_SetValueForKey( userinfo, "handicap", "90" );
ADDRLP4 0
ARGP4
ADDRGP4 $363
ARGP4
ADDRGP4 $370
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 612
;612:	}
LABELV $368
LABELV $366
LABELV $362
line 614
;613:
;614:	key = "model";
ADDRLP4 1024
ADDRGP4 $317
ASGNP4
line 615
;615:	model = Info_ValueForKey( botinfo, key );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1344
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1044
ADDRLP4 1344
INDIRP4
ASGNP4
line 616
;616:	if ( !*model ) {
ADDRLP4 1044
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $371
line 617
;617:		model = "visor/default";
ADDRLP4 1044
ADDRGP4 $373
ASGNP4
line 618
;618:	}
LABELV $371
line 619
;619:	Info_SetValueForKey( userinfo, key, model );
ADDRLP4 0
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 623
;620:	//key = "team_model";
;621:	//Info_SetValueForKey( userinfo, key, model );
;622:
;623:	key = "headmodel";
ADDRLP4 1024
ADDRGP4 $374
ASGNP4
line 624
;624:	headmodel = Info_ValueForKey( botinfo, key );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1348
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1048
ADDRLP4 1348
INDIRP4
ASGNP4
line 625
;625:	if ( !*headmodel ) {
ADDRLP4 1048
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $375
line 626
;626:		headmodel = model;
ADDRLP4 1048
ADDRLP4 1044
INDIRP4
ASGNP4
line 627
;627:	}
LABELV $375
line 628
;628:	Info_SetValueForKey( userinfo, key, headmodel );
ADDRLP4 0
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 632
;629:	//key = "team_headmodel";
;630:	//Info_SetValueForKey( userinfo, key, headmodel );
;631:
;632:	key = "gender";
ADDRLP4 1024
ADDRGP4 $377
ASGNP4
line 633
;633:	s = Info_ValueForKey( botinfo, key );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1352
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1352
INDIRP4
ASGNP4
line 634
;634:	if ( !*s ) {
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $378
line 635
;635:		s = "male";
ADDRLP4 1028
ADDRGP4 $380
ASGNP4
line 636
;636:	}
LABELV $378
line 637
;637:	Info_SetValueForKey( userinfo, "sex", s );
ADDRLP4 0
ARGP4
ADDRGP4 $381
ARGP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 639
;638:
;639:	key = "color1";
ADDRLP4 1024
ADDRGP4 $382
ASGNP4
line 640
;640:	s = Info_ValueForKey( botinfo, key );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1356
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1356
INDIRP4
ASGNP4
line 641
;641:	if ( !*s ) {
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $383
line 642
;642:		s = "4";
ADDRLP4 1028
ADDRGP4 $385
ASGNP4
line 643
;643:	}
LABELV $383
line 644
;644:	Info_SetValueForKey( userinfo, key, s );
ADDRLP4 0
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 646
;645:
;646:	key = "color2";
ADDRLP4 1024
ADDRGP4 $386
ASGNP4
line 647
;647:	s = Info_ValueForKey( botinfo, key );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1360
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1360
INDIRP4
ASGNP4
line 648
;648:	if ( !*s ) {
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $387
line 649
;649:		s = "5";
ADDRLP4 1028
ADDRGP4 $389
ASGNP4
line 650
;650:	}
LABELV $387
line 651
;651:	Info_SetValueForKey( userinfo, key, s );
ADDRLP4 0
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 653
;652:
;653:	s = Info_ValueForKey(botinfo, "aifile");
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 $390
ARGP4
ADDRLP4 1364
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1364
INDIRP4
ASGNP4
line 654
;654:	if (!*s ) {
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $391
line 655
;655:		trap_Print( S_COLOR_RED "Error: bot has no aifile specified\n" );
ADDRGP4 $393
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 656
;656:		return;
ADDRGP4 $346
JUMPV
LABELV $391
line 660
;657:	}
;658:
;659:	// have the server allocate a client slot
;660:	clientNum = trap_BotAllocateClient();
ADDRLP4 1368
ADDRGP4 trap_BotAllocateClient
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 1368
INDIRI4
ASGNI4
line 661
;661:	if ( clientNum == -1 ) {
ADDRLP4 1036
INDIRI4
CNSTI4 -1
NEI4 $394
line 662
;662:		G_Printf( S_COLOR_RED "Unable to add bot.  All player slots are in use.\n" );
ADDRGP4 $396
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 663
;663:		G_Printf( S_COLOR_RED "Start server with more 'open' slots (or check setting of sv_maxclients cvar).\n" );
ADDRGP4 $397
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 664
;664:		return;
ADDRGP4 $346
JUMPV
LABELV $394
line 669
;665:	}
;666:
;667:	// cleanup previous data manually
;668:	// because client may silently (re)connect without ClientDisconnect in case of crash for example
;669:	if ( level.clients[ clientNum ].pers.connected != CON_DISCONNECTED ) {
ADDRLP4 1036
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
EQI4 $398
line 670
;670:		ClientDisconnect( clientNum );
ADDRLP4 1036
INDIRI4
ARGI4
ADDRGP4 ClientDisconnect
CALLV
pop
line 671
;671:	}
LABELV $398
line 673
;672:
;673:	Info_SetValueForKey( userinfo, "characterfile", Info_ValueForKey( botinfo, "aifile" ) );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 $390
ARGP4
ADDRLP4 1372
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRGP4 $338
ARGP4
ADDRLP4 1372
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 674
;674:	Info_SetValueForKey( userinfo, "skill", va( "%1.2f", skill ) );
ADDRGP4 $360
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 1376
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRGP4 $158
ARGP4
ADDRLP4 1376
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 675
;675:	Info_SetValueForKey( userinfo, "team", team );
ADDRLP4 0
ARGP4
ADDRGP4 $341
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 677
;676:
;677:	bot = &g_entities[ clientNum ];
ADDRLP4 1052
ADDRLP4 1036
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 678
;678:	bot->r.svFlags |= SVF_BOT;
ADDRLP4 1380
ADDRLP4 1052
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 1380
INDIRP4
ADDRLP4 1380
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 679
;679:	bot->inuse = qtrue;
ADDRLP4 1052
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 1
ASGNI4
line 682
;680:
;681:	// register the userinfo
;682:	trap_SetUserinfo( clientNum, userinfo );
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 685
;683:
;684:	// have it connect to the game as a normal client
;685:	if ( ClientConnect( clientNum, qtrue, qtrue ) ) {
ADDRLP4 1036
INDIRI4
ARGI4
CNSTI4 1
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 1384
ADDRGP4 ClientConnect
CALLP4
ASGNP4
ADDRLP4 1384
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $400
line 686
;686:		return;
ADDRGP4 $346
JUMPV
LABELV $400
line 689
;687:	}
;688:
;689:	if ( delay == 0 ) {
ADDRFP4 12
INDIRI4
CNSTI4 0
NEI4 $402
line 690
;690:		ClientBegin( clientNum );
ADDRLP4 1036
INDIRI4
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 691
;691:		return;
ADDRGP4 $346
JUMPV
LABELV $402
line 694
;692:	}
;693:
;694:	AddBotToSpawnQueue( clientNum, delay );
ADDRLP4 1036
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 AddBotToSpawnQueue
CALLV
pop
line 695
;695:}
LABELV $346
endproc G_AddBot 1388 16
export Svcmd_AddBot_f
proc Svcmd_AddBot_f 4112 20
line 703
;696:
;697:
;698:/*
;699:===============
;700:Svcmd_AddBot_f
;701:===============
;702:*/
;703:void Svcmd_AddBot_f( void ) {
line 712
;704:	float			skill;
;705:	int				delay;
;706:	char			name[MAX_TOKEN_CHARS];
;707:	char			altname[MAX_TOKEN_CHARS];
;708:	char			string[MAX_TOKEN_CHARS];
;709:	char			team[MAX_TOKEN_CHARS];
;710:
;711:	// are bots enabled?
;712:	if ( !trap_Cvar_VariableIntegerValue( "bot_enable" ) ) {
ADDRGP4 $407
ARGP4
ADDRLP4 4104
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 4104
INDIRI4
CNSTI4 0
NEI4 $405
line 713
;713:		return;
ADDRGP4 $404
JUMPV
LABELV $405
line 717
;714:	}
;715:
;716:	// name
;717:	trap_Argv( 1, name, sizeof( name ) );
CNSTI4 1
ARGI4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 718
;718:	if ( !name[0] ) {
ADDRLP4 1024
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $408
line 719
;719:		trap_Print( "Usage: Addbot <botname> [skill 1-5] [team] [msec delay] [altname]\n" );
ADDRGP4 $410
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 720
;720:		return;
ADDRGP4 $404
JUMPV
LABELV $408
line 724
;721:	}
;722:
;723:	// skill
;724:	trap_Argv( 2, string, sizeof( string ) );
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 725
;725:	if ( !string[0] ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $411
line 726
;726:		skill = 4;
ADDRLP4 2048
CNSTF4 1082130432
ASGNF4
line 727
;727:	}
ADDRGP4 $412
JUMPV
LABELV $411
line 728
;728:	else {
line 729
;729:		skill = atof( string );
ADDRLP4 0
ARGP4
ADDRLP4 4108
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 2048
ADDRLP4 4108
INDIRF4
ASGNF4
line 730
;730:		if ( skill < 1 )
ADDRLP4 2048
INDIRF4
CNSTF4 1065353216
GEF4 $413
line 731
;731:			skill = 1;
ADDRLP4 2048
CNSTF4 1065353216
ASGNF4
ADDRGP4 $414
JUMPV
LABELV $413
line 732
;732:		else if ( skill > 5 )
ADDRLP4 2048
INDIRF4
CNSTF4 1084227584
LEF4 $415
line 733
;733:			skill = 5;
ADDRLP4 2048
CNSTF4 1084227584
ASGNF4
LABELV $415
LABELV $414
line 734
;734:	}
LABELV $412
line 737
;735:
;736:	// team
;737:	trap_Argv( 3, team, sizeof( team ) );
CNSTI4 3
ARGI4
ADDRLP4 3076
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 740
;738:
;739:	// delay
;740:	trap_Argv( 4, string, sizeof( string ) );
CNSTI4 4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 741
;741:	if ( !string[0] ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $417
line 742
;742:		delay = 0;
ADDRLP4 4100
CNSTI4 0
ASGNI4
line 743
;743:	}
ADDRGP4 $418
JUMPV
LABELV $417
line 744
;744:	else {
line 745
;745:		delay = atoi( string );
ADDRLP4 0
ARGP4
ADDRLP4 4108
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4100
ADDRLP4 4108
INDIRI4
ASGNI4
line 746
;746:	}
LABELV $418
line 749
;747:
;748:	// alternative name
;749:	trap_Argv( 5, altname, sizeof( altname ) );
CNSTI4 5
ARGI4
ADDRLP4 2052
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 751
;750:
;751:	G_AddBot( name, skill, team, delay, altname );
ADDRLP4 1024
ARGP4
ADDRLP4 2048
INDIRF4
ARGF4
ADDRLP4 3076
ARGP4
ADDRLP4 4100
INDIRI4
ARGI4
ADDRLP4 2052
ARGP4
ADDRGP4 G_AddBot
CALLV
pop
line 755
;752:
;753:	// if this was issued during gameplay and we are playing locally,
;754:	// go ahead and load the bot's media immediately
;755:	if ( level.time - level.startTime > 1000 &&
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+40
INDIRI4
SUBI4
CNSTI4 1000
LEI4 $419
ADDRGP4 $423
ARGP4
ADDRLP4 4108
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 4108
INDIRI4
CNSTI4 0
EQI4 $419
line 756
;756:		trap_Cvar_VariableIntegerValue( "cl_running" ) ) {
line 757
;757:		trap_SendServerCommand( -1, "loaddeferred\n" );	// FIXME: spelled wrong, but not changing for demo
CNSTI4 -1
ARGI4
ADDRGP4 $424
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 758
;758:	}
LABELV $419
line 759
;759:}
LABELV $404
endproc Svcmd_AddBot_f 4112 20
export Svcmd_BotList_f
proc Svcmd_BotList_f 224 20
line 766
;760:
;761:/*
;762:===============
;763:Svcmd_BotList_f
;764:===============
;765:*/
;766:void Svcmd_BotList_f( void ) {
line 773
;767:	int i;
;768:	char name[MAX_NETNAME];
;769:	char funname[MAX_NETNAME];
;770:	char model[MAX_QPATH];
;771:	char aifile[MAX_QPATH];
;772:
;773:	trap_Print( S_COLOR_RED "name             model            aifile              funname\n" );
ADDRGP4 $426
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 774
;774:	for ( i = 0; i < g_numBots; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $430
JUMPV
LABELV $427
line 775
;775:		Q_strncpyz( name, Info_ValueForKey( g_botInfos[i], "name" ), sizeof( name ) );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $135
ARGP4
ADDRLP4 204
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 204
INDIRP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 776
;776:		if ( !*name ) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $431
line 777
;777:			strcpy(name, "UnnamedPlayer");
ADDRLP4 4
ARGP4
ADDRGP4 $433
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 778
;778:		}
LABELV $431
line 779
;779:		Q_strncpyz( funname, Info_ValueForKey( g_botInfos[i], "funname" ), sizeof( funname ) );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $350
ARGP4
ADDRLP4 208
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 40
ARGP4
ADDRLP4 208
INDIRP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 780
;780:		if ( !*funname ) {
ADDRLP4 40
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $434
line 781
;781:			strcpy( funname, "" );
ADDRLP4 40
ARGP4
ADDRGP4 $95
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 782
;782:		}
LABELV $434
line 783
;783:		Q_strncpyz( model, Info_ValueForKey( g_botInfos[i], "model" ), sizeof( model ) );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $317
ARGP4
ADDRLP4 212
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 76
ARGP4
ADDRLP4 212
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 784
;784:		if ( !*model ) {
ADDRLP4 76
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $436
line 785
;785:			strcpy( model, "visor/default" );
ADDRLP4 76
ARGP4
ADDRGP4 $373
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 786
;786:		}
LABELV $436
line 787
;787:		Q_strncpyz( aifile, Info_ValueForKey( g_botInfos[i], "aifile" ), sizeof( aifile ) );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $390
ARGP4
ADDRLP4 216
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 140
ARGP4
ADDRLP4 216
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 788
;788:		if ( !*aifile ) {
ADDRLP4 140
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $438
line 789
;789:			strcpy( aifile, "bots/default_c.c" );
ADDRLP4 140
ARGP4
ADDRGP4 $440
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 790
;790:		}
LABELV $438
line 791
;791:		trap_Print( va( "%-16s %-16s %-20s %-20s\n", name, model, aifile, funname ) );
ADDRGP4 $441
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 140
ARGP4
ADDRLP4 40
ARGP4
ADDRLP4 220
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 220
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 792
;792:	}
LABELV $428
line 774
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $430
ADDRLP4 0
INDIRI4
ADDRGP4 g_numBots
INDIRI4
LTI4 $427
line 793
;793:}
LABELV $425
endproc Svcmd_BotList_f 224 20
proc G_SpawnBots 1052 16
line 801
;794:
;795:
;796:/*
;797:===============
;798:G_SpawnBots
;799:===============
;800:*/
;801:static void G_SpawnBots( const char *botList, int baseDelay ) {
line 808
;802:	char		*bot;
;803:	char		*p;
;804:	float		skill;
;805:	int			delay;
;806:	char		bots[MAX_INFO_VALUE];
;807:
;808:	podium1 = NULL;
ADDRGP4 podium1
CNSTP4 0
ASGNP4
line 809
;809:	podium2 = NULL;
ADDRGP4 podium2
CNSTP4 0
ASGNP4
line 810
;810:	podium3 = NULL;
ADDRGP4 podium3
CNSTP4 0
ASGNP4
line 812
;811:
;812:	skill = trap_Cvar_VariableValue( "g_spSkill" );
ADDRGP4 $161
ARGP4
ADDRLP4 1040
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 1040
INDIRF4
ASGNF4
line 813
;813:	if( skill < 1 ) {
ADDRLP4 12
INDIRF4
CNSTF4 1065353216
GEF4 $443
line 814
;814:		trap_Cvar_Set( "g_spSkill", "1" );
ADDRGP4 $161
ARGP4
ADDRGP4 $445
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 815
;815:		skill = 1;
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
line 816
;816:	}
ADDRGP4 $444
JUMPV
LABELV $443
line 817
;817:	else if ( skill > 5 ) {
ADDRLP4 12
INDIRF4
CNSTF4 1084227584
LEF4 $446
line 818
;818:		trap_Cvar_Set( "g_spSkill", "5" );
ADDRGP4 $161
ARGP4
ADDRGP4 $389
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 819
;819:		skill = 5;
ADDRLP4 12
CNSTF4 1084227584
ASGNF4
line 820
;820:	}
LABELV $446
LABELV $444
line 822
;821:
;822:	Q_strncpyz( bots, botList, sizeof( bots ) );
ADDRLP4 16
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 823
;823:	p = &bots[0];
ADDRLP4 0
ADDRLP4 16
ASGNP4
line 824
;824:	delay = baseDelay;
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRGP4 $449
JUMPV
line 825
;825:	while( *p ) {
LABELV $451
line 827
;826:		//skip spaces
;827:		while( *p == ' ' ) {
line 828
;828:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 829
;829:		}
LABELV $452
line 827
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $451
line 830
;830:		if( !*p ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $454
line 831
;831:			break;
ADDRGP4 $450
JUMPV
LABELV $454
line 835
;832:		}
;833:
;834:		// mark start of bot name
;835:		bot = p;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $457
JUMPV
LABELV $456
line 838
;836:
;837:		// skip until space of null
;838:		while( *p && *p != ' ' ) {
line 839
;839:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 840
;840:		}
LABELV $457
line 838
ADDRLP4 1044
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $459
ADDRLP4 1044
INDIRI4
CNSTI4 32
NEI4 $456
LABELV $459
line 841
;841:		if( *p ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $460
line 842
;842:			*p++ = '\0';
ADDRLP4 1048
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 1048
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 1048
INDIRP4
CNSTI1 0
ASGNI1
line 843
;843:		}
LABELV $460
line 847
;844:
;845:		// we must add the bot this way, calling G_AddBot directly at this stage
;846:		// does "Bad Things"
;847:		trap_SendConsoleCommand( EXEC_INSERT, va("addbot %s %f free %i\n", bot, skill, delay) );
ADDRGP4 $462
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1048
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 849
;848:
;849:		delay += BOT_BEGIN_DELAY_INCREMENT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 850
;850:	}
LABELV $449
line 825
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $452
LABELV $450
line 851
;851:}
LABELV $442
endproc G_SpawnBots 1052 16
proc G_LoadBotsFromFile 8216 16
line 859
;852:
;853:
;854:/*
;855:===============
;856:G_LoadBotsFromFile
;857:===============
;858:*/
;859:static void G_LoadBotsFromFile( const char *filename ) {
line 864
;860:	int				len;
;861:	fileHandle_t	f;
;862:	char			buf[MAX_BOTS_TEXT];
;863:
;864:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8200
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8200
INDIRI4
ASGNI4
line 865
;865:	if ( f == FS_INVALID_HANDLE ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $464
line 866
;866:		trap_Print( va( S_COLOR_RED "file not found: %s\n", filename ) );
ADDRGP4 $89
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8204
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8204
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 867
;867:		return;
ADDRGP4 $463
JUMPV
LABELV $464
line 869
;868:	}
;869:	if ( len >= MAX_BOTS_TEXT ) {
ADDRLP4 0
INDIRI4
CNSTI4 8192
LTI4 $466
line 870
;870:		trap_Print( va( S_COLOR_RED "file too large: %s is %i, max allowed is %i\n", filename, len, MAX_BOTS_TEXT ) );
ADDRGP4 $468
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 8192
ARGI4
ADDRLP4 8204
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8204
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 871
;871:		trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 872
;872:		return;
ADDRGP4 $463
JUMPV
LABELV $466
line 875
;873:	}
;874:
;875:	trap_FS_Read( buf, len, f );
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 876
;876:	trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 877
;877:	buf[ len ] = '\0';
ADDRLP4 0
INDIRI4
ADDRLP4 8
ADDP4
CNSTI1 0
ASGNI1
line 879
;878:
;879:	g_numBots += G_ParseInfos( buf, MAX_BOTS - g_numBots, &g_botInfos[g_numBots] );
ADDRLP4 8
ARGP4
ADDRLP4 8204
ADDRGP4 g_numBots
ASGNP4
ADDRLP4 8208
ADDRLP4 8204
INDIRP4
INDIRI4
ASGNI4
CNSTI4 1024
ADDRLP4 8208
INDIRI4
SUBI4
ARGI4
ADDRLP4 8208
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
ARGP4
ADDRLP4 8212
ADDRGP4 G_ParseInfos
CALLI4
ASGNI4
ADDRLP4 8204
INDIRP4
ADDRLP4 8208
INDIRI4
ADDRLP4 8212
INDIRI4
ADDI4
ASGNI4
line 880
;880:}
LABELV $463
endproc G_LoadBotsFromFile 8216 16
proc G_LoadBots 1452 16
line 888
;881:
;882:
;883:/*
;884:===============
;885:G_LoadBots
;886:===============
;887:*/
;888:static void G_LoadBots( void ) {
line 897
;889:	vmCvar_t	botsFile;
;890:	int			numdirs;
;891:	char		filename[128];
;892:	char		dirlist[1024];
;893:	char*		dirptr;
;894:	int			i;
;895:	int			dirlen;
;896:
;897:	if ( !trap_Cvar_VariableIntegerValue( "bot_enable" ) ) {
ADDRGP4 $407
ARGP4
ADDRLP4 1440
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 1440
INDIRI4
CNSTI4 0
NEI4 $470
line 898
;898:		return;
ADDRGP4 $469
JUMPV
LABELV $470
line 901
;899:	}
;900:
;901:	g_numBots = 0;
ADDRGP4 g_numBots
CNSTI4 0
ASGNI4
line 903
;902:
;903:	trap_Cvar_Register( &botsFile, "g_botsFile", "", CVAR_ARCHIVE | CVAR_LATCH );
ADDRLP4 1168
ARGP4
ADDRGP4 $472
ARGP4
ADDRGP4 $95
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 905
;904:
;905:	if ( *botsFile.string && g_gametype.integer != GT_CAMPAIGN ) {
ADDRLP4 1168+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $473
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
EQI4 $473
line 906
;906:		G_LoadBotsFromFile( botsFile.string );
ADDRLP4 1168+16
ARGP4
ADDRGP4 G_LoadBotsFromFile
CALLV
pop
line 907
;907:	} else {
ADDRGP4 $474
JUMPV
LABELV $473
line 908
;908:		G_LoadBotsFromFile( "scripts/bots.txt" );
ADDRGP4 $478
ARGP4
ADDRGP4 G_LoadBotsFromFile
CALLV
pop
line 909
;909:	}
LABELV $474
line 912
;910:
;911:	// get all bots from .bot files
;912:	numdirs = trap_FS_GetFileList( "scripts", ".bot", dirlist, sizeof( dirlist ) );
ADDRGP4 $101
ARGP4
ADDRGP4 $479
ARGP4
ADDRLP4 144
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1444
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 140
ADDRLP4 1444
INDIRI4
ASGNI4
line 913
;913:	dirptr  = dirlist;
ADDRLP4 0
ADDRLP4 144
ASGNP4
line 914
;914:	for (i = 0; i < numdirs; i++, dirptr += dirlen+1) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $483
JUMPV
LABELV $480
line 915
;915:		dirlen = (int)strlen(dirptr);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1448
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 136
ADDRLP4 1448
INDIRI4
ASGNI4
line 916
;916:		strcpy(filename, "scripts/");
ADDRLP4 4
ARGP4
ADDRGP4 $107
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 917
;917:		strcat(filename, dirptr);
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 918
;918:		G_LoadBotsFromFile(filename);
ADDRLP4 4
ARGP4
ADDRGP4 G_LoadBotsFromFile
CALLV
pop
line 919
;919:	}
LABELV $481
line 914
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 136
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
LABELV $483
ADDRLP4 132
INDIRI4
ADDRLP4 140
INDIRI4
LTI4 $480
line 920
;920:	trap_Print( va( "%i bots parsed\n", g_numBots ) );
ADDRGP4 $484
ARGP4
ADDRGP4 g_numBots
INDIRI4
ARGI4
ADDRLP4 1448
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1448
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 921
;921:}
LABELV $469
endproc G_LoadBots 1452 16
export G_GetBotInfoByNumber
proc G_GetBotInfoByNumber 8 8
line 930
;922:
;923:
;924:
;925:/*
;926:===============
;927:G_GetBotInfoByNumber
;928:===============
;929:*/
;930:char *G_GetBotInfoByNumber( int num ) {
line 931
;931:	if( num < 0 || num >= g_numBots ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $488
ADDRLP4 0
INDIRI4
ADDRGP4 g_numBots
INDIRI4
LTI4 $486
LABELV $488
line 932
;932:		trap_Print( va( S_COLOR_RED "Invalid bot number: %i\n", num ) );
ADDRGP4 $489
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 933
;933:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $485
JUMPV
LABELV $486
line 935
;934:	}
;935:	return g_botInfos[num];
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
RETP4
LABELV $485
endproc G_GetBotInfoByNumber 8 8
export G_GetBotInfoByName
proc G_GetBotInfoByName 16 8
line 944
;936:}
;937:
;938:
;939:/*
;940:===============
;941:G_GetBotInfoByName
;942:===============
;943:*/
;944:char *G_GetBotInfoByName( const char *name ) {
line 948
;945:	int		n;
;946:	char	*value;
;947:
;948:	for ( n = 0; n < g_numBots ; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $494
JUMPV
LABELV $491
line 949
;949:		value = Info_ValueForKey( g_botInfos[n], "name" );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $135
ARGP4
ADDRLP4 8
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 950
;950:		if ( !Q_stricmp( value, name ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $495
line 951
;951:			return g_botInfos[n];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
RETP4
ADDRGP4 $490
JUMPV
LABELV $495
line 953
;952:		}
;953:	}
LABELV $492
line 948
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $494
ADDRLP4 0
INDIRI4
ADDRGP4 g_numBots
INDIRI4
LTI4 $491
line 955
;954:
;955:	return NULL;
CNSTP4 0
RETP4
LABELV $490
endproc G_GetBotInfoByName 16 8
export G_InitBots
proc G_InitBots 52 16
line 964
;956:}
;957:
;958:
;959:/*
;960:===============
;961:G_InitBots
;962:===============
;963:*/
;964:void G_InitBots( qboolean restart ) {
line 971
;965:	int			fragLimit;
;966:	int			timeLimit;
;967:	const char	*arenainfo;
;968:	char		*strValue;
;969:	int			basedelay;
;970:
;971:	G_LoadBots();
ADDRGP4 G_LoadBots
CALLV
pop
line 972
;972:	G_LoadArenas();
ADDRGP4 G_LoadArenas
CALLV
pop
line 974
;973:
;974:	trap_Cvar_Register( &bot_minplayers, "bot_minplayers", "0", CVAR_SERVERINFO );
ADDRGP4 bot_minplayers
ARGP4
ADDRGP4 $498
ARGP4
ADDRGP4 $499
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 976
;975:
;976:	if( g_gametype.integer == GT_CAMPAIGN ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
NEI4 $500
line 977
;977:		arenainfo = G_GetArenaInfoByMap( mapname );
ADDRGP4 mapname
ARGP4
ADDRLP4 20
ADDRGP4 G_GetArenaInfoByMap
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 978
;978:		if ( !arenainfo ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $503
line 979
;979:			return;
ADDRGP4 $497
JUMPV
LABELV $503
line 982
;980:		}
;981:
;982:		strValue = Info_ValueForKey( arenainfo, "fraglimit" );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $505
ARGP4
ADDRLP4 24
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
ASGNP4
line 983
;983:		fragLimit = atoi( strValue );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 28
INDIRI4
ASGNI4
line 984
;984:		if ( fragLimit ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $506
line 985
;985:			trap_Cvar_Set( "fraglimit", strValue );
ADDRGP4 $505
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 986
;986:		}
ADDRGP4 $507
JUMPV
LABELV $506
line 987
;987:		else {
line 988
;988:			trap_Cvar_Set( "fraglimit", "0" );
ADDRGP4 $505
ARGP4
ADDRGP4 $499
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 989
;989:		}
LABELV $507
line 991
;990:
;991:		strValue = Info_ValueForKey( arenainfo, "timelimit" );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $508
ARGP4
ADDRLP4 32
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 32
INDIRP4
ASGNP4
line 992
;992:		timeLimit = atoi( strValue );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 36
INDIRI4
ASGNI4
line 993
;993:		if ( timeLimit ) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $509
line 994
;994:			trap_Cvar_Set( "timelimit", strValue );
ADDRGP4 $508
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 995
;995:		}
ADDRGP4 $510
JUMPV
LABELV $509
line 996
;996:		else {
line 997
;997:			trap_Cvar_Set( "timelimit", "0" );
ADDRGP4 $508
ARGP4
ADDRGP4 $499
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 998
;998:		}
LABELV $510
line 1000
;999:
;1000:		if ( !fragLimit && !timeLimit ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $511
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $511
line 1001
;1001:			trap_Cvar_Set( "fraglimit", "10" );
ADDRGP4 $505
ARGP4
ADDRGP4 $513
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1002
;1002:			trap_Cvar_Set( "timelimit", "0" );
ADDRGP4 $508
ARGP4
ADDRGP4 $499
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1003
;1003:		}
LABELV $511
line 1005
;1004:
;1005:		basedelay = BOT_BEGIN_DELAY_BASE;
ADDRLP4 16
CNSTI4 2000
ASGNI4
line 1006
;1006:		strValue = Info_ValueForKey( arenainfo, "special" );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $514
ARGP4
ADDRLP4 40
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 40
INDIRP4
ASGNP4
line 1007
;1007:		if( Q_stricmp( strValue, "training" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $517
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $515
line 1008
;1008:			basedelay += 10000;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 1009
;1009:		}
LABELV $515
line 1011
;1010:
;1011:		if( !restart ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $518
line 1012
;1012:			G_SpawnBots( Info_ValueForKey( arenainfo, "bots" ), basedelay );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $520
ARGP4
ADDRLP4 48
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 G_SpawnBots
CALLV
pop
line 1013
;1013:		}
LABELV $518
line 1014
;1014:	}
LABELV $500
line 1015
;1015:}
LABELV $497
endproc G_InitBots 52 16
import mapname
import podium3
import podium2
import podium1
bss
export bot_minplayers
align 4
LABELV bot_minplayers
skip 272
align 4
LABELV botSpawnQueue
skip 128
align 4
LABELV g_arenaInfos
skip 4096
export g_numArenas
align 4
LABELV g_numArenas
skip 4
align 4
LABELV g_botInfos
skip 4096
align 4
LABELV g_numBots
skip 4
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
LABELV $520
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $517
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
LABELV $514
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $513
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $508
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
LABELV $505
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
LABELV $499
byte 1 48
byte 1 0
align 1
LABELV $498
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 109
byte 1 105
byte 1 110
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $489
byte 1 94
byte 1 49
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $484
byte 1 37
byte 1 105
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $479
byte 1 46
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $478
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $472
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $468
byte 1 94
byte 1 49
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 108
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 44
byte 1 32
byte 1 109
byte 1 97
byte 1 120
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $462
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
byte 1 37
byte 1 102
byte 1 32
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $445
byte 1 49
byte 1 0
align 1
LABELV $441
byte 1 37
byte 1 45
byte 1 49
byte 1 54
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 49
byte 1 54
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $440
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 95
byte 1 99
byte 1 46
byte 1 99
byte 1 0
align 1
LABELV $433
byte 1 85
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $426
byte 1 94
byte 1 49
byte 1 110
byte 1 97
byte 1 109
byte 1 101
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
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
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
byte 1 97
byte 1 105
byte 1 102
byte 1 105
byte 1 108
byte 1 101
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
byte 1 102
byte 1 117
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $424
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
byte 1 10
byte 1 0
align 1
LABELV $423
byte 1 99
byte 1 108
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
LABELV $410
byte 1 85
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 65
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 60
byte 1 98
byte 1 111
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 62
byte 1 32
byte 1 91
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 49
byte 1 45
byte 1 53
byte 1 93
byte 1 32
byte 1 91
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 93
byte 1 32
byte 1 91
byte 1 109
byte 1 115
byte 1 101
byte 1 99
byte 1 32
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 93
byte 1 32
byte 1 91
byte 1 97
byte 1 108
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $407
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $397
byte 1 94
byte 1 49
byte 1 83
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 39
byte 1 111
byte 1 112
byte 1 101
byte 1 110
byte 1 39
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 115
byte 1 32
byte 1 40
byte 1 111
byte 1 114
byte 1 32
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 111
byte 1 102
byte 1 32
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
byte 1 32
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 41
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $396
byte 1 94
byte 1 49
byte 1 85
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 97
byte 1 100
byte 1 100
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 46
byte 1 32
byte 1 32
byte 1 65
byte 1 108
byte 1 108
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $393
byte 1 94
byte 1 49
byte 1 69
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 58
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 97
byte 1 105
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $390
byte 1 97
byte 1 105
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $389
byte 1 53
byte 1 0
align 1
LABELV $386
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 50
byte 1 0
align 1
LABELV $385
byte 1 52
byte 1 0
align 1
LABELV $382
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 49
byte 1 0
align 1
LABELV $381
byte 1 115
byte 1 101
byte 1 120
byte 1 0
align 1
LABELV $380
byte 1 109
byte 1 97
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $377
byte 1 103
byte 1 101
byte 1 110
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $374
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
LABELV $373
byte 1 118
byte 1 105
byte 1 115
byte 1 111
byte 1 114
byte 1 47
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $370
byte 1 57
byte 1 48
byte 1 0
align 1
LABELV $367
byte 1 55
byte 1 48
byte 1 0
align 1
LABELV $364
byte 1 53
byte 1 48
byte 1 0
align 1
LABELV $363
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $360
byte 1 37
byte 1 49
byte 1 46
byte 1 50
byte 1 102
byte 1 0
align 1
LABELV $358
byte 1 115
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $357
byte 1 50
byte 1 53
byte 1 48
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $356
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $355
byte 1 117
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $350
byte 1 102
byte 1 117
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $349
byte 1 94
byte 1 49
byte 1 69
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 58
byte 1 32
byte 1 66
byte 1 111
byte 1 116
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $345
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
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $341
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $338
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $328
byte 1 94
byte 1 51
byte 1 85
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $317
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $203
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $188
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
byte 1 37
byte 1 49
byte 1 46
byte 1 50
byte 1 102
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $187
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $184
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $161
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
LABELV $158
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $135
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $129
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 32
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
byte 1 10
byte 1 0
align 1
LABELV $128
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $122
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $114
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $113
byte 1 110
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $108
byte 1 37
byte 1 105
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 115
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $107
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 0
align 1
LABELV $102
byte 1 46
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $101
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $100
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 115
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $95
byte 1 0
align 1
LABELV $94
byte 1 103
byte 1 95
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 115
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $92
byte 1 94
byte 1 49
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 108
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 44
byte 1 32
byte 1 109
byte 1 97
byte 1 120
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $89
byte 1 94
byte 1 49
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $83
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $82
byte 1 92
byte 1 110
byte 1 117
byte 1 109
byte 1 92
byte 1 0
align 1
LABELV $81
byte 1 60
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 62
byte 1 0
align 1
LABELV $78
byte 1 125
byte 1 0
align 1
LABELV $75
byte 1 85
byte 1 110
byte 1 101
byte 1 120
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 101
byte 1 110
byte 1 100
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $69
byte 1 77
byte 1 97
byte 1 120
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 32
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 101
byte 1 100
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $66
byte 1 77
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 123
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $65
byte 1 123
byte 1 0
