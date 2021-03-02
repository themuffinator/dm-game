export UI_Alloc
code
proc UI_Alloc 8 0
file "..\..\..\..\code\q3_ui\ui_gameinfo.c"
line 34
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3://
;4:// gameinfo.c
;5://
;6:
;7:#include "ui_local.h"
;8:
;9:
;10://
;11:// arena and bot info
;12://
;13:
;14:#define POOLSIZE	128 * 1024
;15:
;16:int				ui_numBots;
;17:static char		*ui_botInfos[MAX_BOTS];
;18:
;19:static int		ui_numArenas;
;20:static char		*ui_arenaInfos[MAX_ARENAS];
;21:
;22:static int		ui_numSinglePlayerArenas;
;23:static int		ui_numSpecialSinglePlayerArenas;
;24:
;25:static char		memoryPool[POOLSIZE];
;26:static int		allocPoint, outOfMemory;
;27:
;28:
;29:/*
;30:===============
;31:UI_Alloc
;32:===============
;33:*/
;34:void *UI_Alloc( int size ) {
line 37
;35:	char	*p;
;36:
;37:	if ( allocPoint + size > POOLSIZE ) {
ADDRGP4 allocPoint
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
CNSTI4 131072
LEI4 $70
line 38
;38:		outOfMemory = qtrue;
ADDRGP4 outOfMemory
CNSTI4 1
ASGNI4
line 39
;39:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $69
JUMPV
LABELV $70
line 42
;40:	}
;41:
;42:	p = &memoryPool[allocPoint];
ADDRLP4 0
ADDRGP4 allocPoint
INDIRI4
ADDRGP4 memoryPool
ADDP4
ASGNP4
line 44
;43:
;44:	allocPoint += ( size + 31 ) & ~31;
ADDRLP4 4
ADDRGP4 allocPoint
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 0
INDIRI4
CNSTI4 31
ADDI4
CNSTI4 -32
BANDI4
ADDI4
ASGNI4
line 46
;45:
;46:	return p;
ADDRLP4 0
INDIRP4
RETP4
LABELV $69
endproc UI_Alloc 8 0
export UI_InitMemory
proc UI_InitMemory 0 0
line 54
;47:}
;48:
;49:/*
;50:===============
;51:UI_InitMemory
;52:===============
;53:*/
;54:void UI_InitMemory( void ) {
line 55
;55:	allocPoint = 0;
ADDRGP4 allocPoint
CNSTI4 0
ASGNI4
line 56
;56:	outOfMemory = qfalse;
ADDRGP4 outOfMemory
CNSTI4 0
ASGNI4
line 57
;57:}
LABELV $72
endproc UI_InitMemory 0 0
export UI_ParseInfos
proc UI_ParseInfos 2084 12
line 64
;58:
;59:/*
;60:===============
;61:UI_ParseInfos
;62:===============
;63:*/
;64:int UI_ParseInfos( char *buf, int max, char *infos[] ) {
line 70
;65:	char	*token;
;66:	int		count;
;67:	char	key[MAX_TOKEN_CHARS];
;68:	char	info[MAX_INFO_STRING];
;69:
;70:	count = 0;
ADDRLP4 2052
CNSTI4 0
ASGNI4
ADDRGP4 $75
JUMPV
LABELV $74
line 72
;71:
;72:	while ( 1 ) {
line 73
;73:		token = COM_Parse( &buf );
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
line 74
;74:		if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $77
line 75
;75:			break;
ADDRGP4 $76
JUMPV
LABELV $77
line 77
;76:		}
;77:		if ( strcmp( token, "{" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $81
ARGP4
ADDRLP4 2060
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2060
INDIRI4
CNSTI4 0
EQI4 $79
line 78
;78:			Com_Printf( "Missing { in info file\n" );
ADDRGP4 $82
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 79
;79:			break;
ADDRGP4 $76
JUMPV
LABELV $79
line 82
;80:		}
;81:
;82:		if ( count == max ) {
ADDRLP4 2052
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $83
line 83
;83:			Com_Printf( "Max infos exceeded\n" );
ADDRGP4 $85
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 84
;84:			break;
ADDRGP4 $76
JUMPV
LABELV $83
line 87
;85:		}
;86:
;87:		info[0] = '\0';
ADDRLP4 1028
CNSTI1 0
ASGNI1
ADDRGP4 $87
JUMPV
LABELV $86
line 88
;88:		while ( 1 ) {
line 89
;89:			token = COM_ParseExt( &buf, qtrue );
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
line 90
;90:			if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $89
line 91
;91:				Com_Printf( "Unexpected end of info file\n" );
ADDRGP4 $91
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 92
;92:				break;
ADDRGP4 $88
JUMPV
LABELV $89
line 94
;93:			}
;94:			if ( !strcmp( token, "}" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $94
ARGP4
ADDRLP4 2068
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2068
INDIRI4
CNSTI4 0
NEI4 $92
line 95
;95:				break;
ADDRGP4 $88
JUMPV
LABELV $92
line 97
;96:			}
;97:			Q_strncpyz( key, token, sizeof( key ) );
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
line 99
;98:
;99:			token = COM_ParseExt( &buf, qfalse );
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
line 100
;100:			if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $95
line 101
;101:				strcpy( token, "<NULL>" );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $97
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 102
;102:			}
LABELV $95
line 103
;103:			Info_SetValueForKey( info, key, token );
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
line 104
;104:		}
LABELV $87
line 88
ADDRGP4 $86
JUMPV
LABELV $88
line 106
;105:		//NOTE: extra space for arena number
;106:		infos[count] = UI_Alloc(strlen(info) + strlen("\\num\\") + strlen(va("%d", MAX_ARENAS)) + 1);
ADDRLP4 1028
ARGP4
ADDRLP4 2064
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRGP4 $98
ARGP4
ADDRLP4 2068
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRGP4 $99
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
ADDRGP4 UI_Alloc
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
line 107
;107:		if (infos[count]) {
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
EQU4 $100
line 108
;108:			strcpy(infos[count], info);
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
line 109
;109:			count++;
ADDRLP4 2052
ADDRLP4 2052
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 110
;110:		}
LABELV $100
line 111
;111:	}
LABELV $75
line 72
ADDRGP4 $74
JUMPV
LABELV $76
line 112
;112:	return count;
ADDRLP4 2052
INDIRI4
RETI4
LABELV $73
endproc UI_ParseInfos 2084 12
proc UI_LoadArenasFromFile 8216 16
line 120
;113:}
;114:
;115:/*
;116:===============
;117:UI_LoadArenasFromFile
;118:===============
;119:*/
;120:static void UI_LoadArenasFromFile( const char *filename ) {
line 125
;121:	int				len;
;122:	fileHandle_t	f;
;123:	char			buf[MAX_ARENAS_TEXT];
;124:
;125:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
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
line 126
;126:	if ( f == FS_INVALID_HANDLE ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $103
line 127
;127:		trap_Print( va( S_COLOR_RED "file not found: %s\n", filename ) );
ADDRGP4 $105
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
line 128
;128:		return;
ADDRGP4 $102
JUMPV
LABELV $103
line 130
;129:	}
;130:	if ( len >= sizeof( buf ) ) {
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 8192
LTU4 $106
line 131
;131:		trap_Print( va( S_COLOR_RED "file too large: %s is %i, max allowed is %i", filename, len, sizeof( buf ) ) );
ADDRGP4 $108
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTU4 8192
ARGU4
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
line 132
;132:		trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 133
;133:		return;
ADDRGP4 $102
JUMPV
LABELV $106
line 136
;134:	}
;135:
;136:	trap_FS_Read( buf, len, f );
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
line 137
;137:	buf[len] = '\0';
ADDRLP4 0
INDIRI4
ADDRLP4 8
ADDP4
CNSTI1 0
ASGNI1
line 138
;138:	trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 140
;139:
;140:	ui_numArenas += UI_ParseInfos( buf, MAX_ARENAS - ui_numArenas, &ui_arenaInfos[ui_numArenas] );
ADDRLP4 8
ARGP4
ADDRLP4 8204
ADDRGP4 ui_numArenas
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
ADDRGP4 ui_arenaInfos
ADDP4
ARGP4
ADDRLP4 8212
ADDRGP4 UI_ParseInfos
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
line 141
;141:}
LABELV $102
endproc UI_LoadArenasFromFile 8216 16
proc UI_LoadArenas 8660 16
line 149
;142:
;143:
;144:/*
;145:===============
;146:UI_LoadArenas
;147:===============
;148:*/
;149:static void UI_LoadArenas( void ) {
line 161
;150:	int			numdirs;
;151:	vmCvar_t	arenasFile;
;152:	char		filename[128];
;153:	char		dirlist[8192];
;154:	char*		dirptr;
;155:	int			i, n;
;156:	int			dirlen;
;157:	char		*type;
;158:	char		*tag;
;159:	int			singlePlayerNum, specialNum, otherNum;
;160:
;161:	ui_numArenas = 0;
ADDRGP4 ui_numArenas
CNSTI4 0
ASGNI4
line 163
;162:
;163:	trap_Cvar_Register( &arenasFile, "g_arenasFile", "", CVAR_INIT|CVAR_ROM );
ADDRLP4 8360
ARGP4
ADDRGP4 $110
ARGP4
ADDRGP4 $111
ARGP4
CNSTI4 80
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 164
;164:	if( *arenasFile.string ) {
ADDRLP4 8360+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $112
line 165
;165:		UI_LoadArenasFromFile(arenasFile.string);
ADDRLP4 8360+16
ARGP4
ADDRGP4 UI_LoadArenasFromFile
CALLV
pop
line 166
;166:	}
ADDRGP4 $113
JUMPV
LABELV $112
line 167
;167:	else {
line 168
;168:		UI_LoadArenasFromFile("scripts/arenas.txt");
ADDRGP4 $116
ARGP4
ADDRGP4 UI_LoadArenasFromFile
CALLV
pop
line 169
;169:	}
LABELV $113
line 172
;170:
;171:	// get all arenas from .arena files
;172:	numdirs = trap_FS_GetFileList( "scripts", ".arena", dirlist, sizeof( dirlist ) );
ADDRGP4 $117
ARGP4
ADDRGP4 $118
ARGP4
ADDRLP4 168
ARGP4
CNSTI4 8192
ARGI4
ADDRLP4 8632
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 152
ADDRLP4 8632
INDIRI4
ASGNI4
line 174
;173:
;174:	dirptr  = dirlist;
ADDRLP4 8
ADDRLP4 168
ASGNP4
line 175
;175:	for (i = 0; i < numdirs; i++, dirptr += dirlen+1) {
ADDRLP4 140
CNSTI4 0
ASGNI4
ADDRGP4 $122
JUMPV
LABELV $119
line 176
;176:		dirlen = strlen(dirptr);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8636
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 144
ADDRLP4 8636
INDIRI4
ASGNI4
line 177
;177:		strcpy(filename, "scripts/");
ADDRLP4 12
ARGP4
ADDRGP4 $123
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 178
;178:		strcat(filename, dirptr);
ADDRLP4 12
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 179
;179:		UI_LoadArenasFromFile(filename);
ADDRLP4 12
ARGP4
ADDRGP4 UI_LoadArenasFromFile
CALLV
pop
line 180
;180:	}
LABELV $120
line 175
ADDRLP4 140
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
ADDRLP4 144
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 8
INDIRP4
ADDP4
ASGNP4
LABELV $122
ADDRLP4 140
INDIRI4
ADDRLP4 152
INDIRI4
LTI4 $119
line 181
;181:	trap_Print( va( "%i arenas parsed\n", ui_numArenas ) );
ADDRGP4 $124
ARGP4
ADDRGP4 ui_numArenas
INDIRI4
ARGI4
ADDRLP4 8636
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8636
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 182
;182:	if (outOfMemory) trap_Print(S_COLOR_YELLOW"WARNING: not anough memory in pool to load all arenas\n");
ADDRGP4 outOfMemory
INDIRI4
CNSTI4 0
EQI4 $125
ADDRGP4 $127
ARGP4
ADDRGP4 trap_Print
CALLV
pop
LABELV $125
line 185
;183:
;184:	// set initial numbers
;185:	for( n = 0; n < ui_numArenas; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $131
JUMPV
LABELV $128
line 186
;186:		Info_SetValueForKey( ui_arenaInfos[n], "num", va( "%i", n ) );
ADDRGP4 $133
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8640
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $132
ARGP4
ADDRLP4 8640
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 187
;187:	}
LABELV $129
line 185
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $131
ADDRLP4 0
INDIRI4
ADDRGP4 ui_numArenas
INDIRI4
LTI4 $128
line 190
;188:
;189:	// go through and count single players levels
;190:	ui_numSinglePlayerArenas = 0;
ADDRGP4 ui_numSinglePlayerArenas
CNSTI4 0
ASGNI4
line 191
;191:	ui_numSpecialSinglePlayerArenas = 0;
ADDRGP4 ui_numSpecialSinglePlayerArenas
CNSTI4 0
ASGNI4
line 192
;192:	for( n = 0; n < ui_numArenas; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $137
JUMPV
LABELV $134
line 194
;193:		// determine type
;194:		type = Info_ValueForKey( ui_arenaInfos[n], "type" );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $138
ARGP4
ADDRLP4 8640
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8640
INDIRP4
ASGNP4
line 197
;195:
;196:		// if no type specified, it will be treated as "ffa"
;197:		if( !*type ) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $139
line 198
;198:			continue;
ADDRGP4 $135
JUMPV
LABELV $139
line 201
;199:		}
;200:
;201:		if( strstr( type, "single" ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $143
ARGP4
ADDRLP4 8644
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 8644
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $141
line 203
;202:			// check for special single player arenas (training, final)
;203:			tag = Info_ValueForKey( ui_arenaInfos[n], "special" );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $144
ARGP4
ADDRLP4 8648
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 148
ADDRLP4 8648
INDIRP4
ASGNP4
line 204
;204:			if( *tag ) {
ADDRLP4 148
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $145
line 205
;205:				ui_numSpecialSinglePlayerArenas++;
ADDRLP4 8652
ADDRGP4 ui_numSpecialSinglePlayerArenas
ASGNP4
ADDRLP4 8652
INDIRP4
ADDRLP4 8652
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 206
;206:				continue;
ADDRGP4 $135
JUMPV
LABELV $145
line 209
;207:			}
;208:
;209:			ui_numSinglePlayerArenas++;
ADDRLP4 8652
ADDRGP4 ui_numSinglePlayerArenas
ASGNP4
ADDRLP4 8652
INDIRP4
ADDRLP4 8652
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 210
;210:		}
LABELV $141
line 211
;211:	}
LABELV $135
line 192
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $137
ADDRLP4 0
INDIRI4
ADDRGP4 ui_numArenas
INDIRI4
LTI4 $134
line 213
;212:
;213:	n = ui_numSinglePlayerArenas % ARENAS_PER_TIER;
ADDRLP4 0
ADDRGP4 ui_numSinglePlayerArenas
INDIRI4
CNSTI4 4
MODI4
ASGNI4
line 214
;214:	if( n != 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $147
line 215
;215:		ui_numSinglePlayerArenas -= n;
ADDRLP4 8640
ADDRGP4 ui_numSinglePlayerArenas
ASGNP4
ADDRLP4 8640
INDIRP4
ADDRLP4 8640
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ASGNI4
line 216
;216:		trap_Print( va( "%i arenas ignored to make count divisible by %i\n", n, ARENAS_PER_TIER ) );
ADDRGP4 $149
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 8644
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8644
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 217
;217:	}
LABELV $147
line 220
;218:
;219:	// go through once more and assign number to the levels
;220:	singlePlayerNum = 0;
ADDRLP4 160
CNSTI4 0
ASGNI4
line 221
;221:	specialNum = singlePlayerNum + ui_numSinglePlayerArenas;
ADDRLP4 164
ADDRLP4 160
INDIRI4
ADDRGP4 ui_numSinglePlayerArenas
INDIRI4
ADDI4
ASGNI4
line 222
;222:	otherNum = specialNum + ui_numSpecialSinglePlayerArenas;
ADDRLP4 156
ADDRLP4 164
INDIRI4
ADDRGP4 ui_numSpecialSinglePlayerArenas
INDIRI4
ADDI4
ASGNI4
line 223
;223:	for( n = 0; n < ui_numArenas; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $153
JUMPV
LABELV $150
line 225
;224:		// determine type
;225:		type = Info_ValueForKey( ui_arenaInfos[n], "type" );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $138
ARGP4
ADDRLP4 8640
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8640
INDIRP4
ASGNP4
line 228
;226:
;227:		// if no type specified, it will be treated as "ffa"
;228:		if( *type ) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $154
line 229
;229:			if( strstr( type, "single" ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $143
ARGP4
ADDRLP4 8644
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 8644
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $156
line 231
;230:				// check for special single player arenas (training, final)
;231:				tag = Info_ValueForKey( ui_arenaInfos[n], "special" );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $144
ARGP4
ADDRLP4 8648
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 148
ADDRLP4 8648
INDIRP4
ASGNP4
line 232
;232:				if( *tag ) {
ADDRLP4 148
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $158
line 233
;233:					Info_SetValueForKey( ui_arenaInfos[n], "num", va( "%i", specialNum++ ) );
ADDRGP4 $133
ARGP4
ADDRLP4 8652
ADDRLP4 164
INDIRI4
ASGNI4
ADDRLP4 164
ADDRLP4 8652
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8652
INDIRI4
ARGI4
ADDRLP4 8656
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $132
ARGP4
ADDRLP4 8656
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 234
;234:					continue;
ADDRGP4 $151
JUMPV
LABELV $158
line 237
;235:				}
;236:
;237:				Info_SetValueForKey( ui_arenaInfos[n], "num", va( "%i", singlePlayerNum++ ) );
ADDRGP4 $133
ARGP4
ADDRLP4 8652
ADDRLP4 160
INDIRI4
ASGNI4
ADDRLP4 160
ADDRLP4 8652
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8652
INDIRI4
ARGI4
ADDRLP4 8656
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $132
ARGP4
ADDRLP4 8656
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 238
;238:				continue;
ADDRGP4 $151
JUMPV
LABELV $156
line 240
;239:			}
;240:		}
LABELV $154
line 242
;241:
;242:		Info_SetValueForKey( ui_arenaInfos[n], "num", va( "%i", otherNum++ ) );
ADDRGP4 $133
ARGP4
ADDRLP4 8644
ADDRLP4 156
INDIRI4
ASGNI4
ADDRLP4 156
ADDRLP4 8644
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8644
INDIRI4
ARGI4
ADDRLP4 8648
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $132
ARGP4
ADDRLP4 8648
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 243
;243:	}
LABELV $151
line 223
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $153
ADDRLP4 0
INDIRI4
ADDRGP4 ui_numArenas
INDIRI4
LTI4 $150
line 244
;244:}
LABELV $109
endproc UI_LoadArenas 8660 16
export UI_GetArenaInfoByNumber
proc UI_GetArenaInfoByNumber 24 8
line 251
;245:
;246:/*
;247:===============
;248:UI_GetArenaInfoByNumber
;249:===============
;250:*/
;251:const char *UI_GetArenaInfoByNumber( int num ) {
line 255
;252:	int		n;
;253:	char	*value;
;254:
;255:	if( num < 0 || num >= ui_numArenas ) {
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $163
ADDRLP4 8
INDIRI4
ADDRGP4 ui_numArenas
INDIRI4
LTI4 $161
LABELV $163
line 256
;256:		trap_Print( va( S_COLOR_RED "Invalid arena number: %i\n", num ) );
ADDRGP4 $164
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 257
;257:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $160
JUMPV
LABELV $161
line 260
;258:	}
;259:
;260:	for( n = 0; n < ui_numArenas; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $168
JUMPV
LABELV $165
line 261
;261:		value = Info_ValueForKey( ui_arenaInfos[n], "num" );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $132
ARGP4
ADDRLP4 12
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 262
;262:		if( *value && atoi(value) == num ) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $169
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $169
line 263
;263:			return ui_arenaInfos[n];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
RETP4
ADDRGP4 $160
JUMPV
LABELV $169
line 265
;264:		}
;265:	}
LABELV $166
line 260
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $168
ADDRLP4 0
INDIRI4
ADDRGP4 ui_numArenas
INDIRI4
LTI4 $165
line 267
;266:
;267:	return NULL;
CNSTP4 0
RETP4
LABELV $160
endproc UI_GetArenaInfoByNumber 24 8
export UI_GetArenaInfoByMap
proc UI_GetArenaInfoByMap 12 8
line 276
;268:}
;269:
;270:
;271:/*
;272:===============
;273:UI_GetArenaInfoByNumber
;274:===============
;275:*/
;276:const char *UI_GetArenaInfoByMap( const char *map ) {
line 279
;277:	int			n;
;278:
;279:	for( n = 0; n < ui_numArenas; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $175
JUMPV
LABELV $172
line 280
;280:		if( Q_stricmp( Info_ValueForKey( ui_arenaInfos[n], "map" ), map ) == 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $178
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
NEI4 $176
line 281
;281:			return ui_arenaInfos[n];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
RETP4
ADDRGP4 $171
JUMPV
LABELV $176
line 283
;282:		}
;283:	}
LABELV $173
line 279
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $175
ADDRLP4 0
INDIRI4
ADDRGP4 ui_numArenas
INDIRI4
LTI4 $172
line 285
;284:
;285:	return NULL;
CNSTP4 0
RETP4
LABELV $171
endproc UI_GetArenaInfoByMap 12 8
export UI_GetSpecialArenaInfo
proc UI_GetSpecialArenaInfo 12 8
line 294
;286:}
;287:
;288:
;289:/*
;290:===============
;291:UI_GetSpecialArenaInfo
;292:===============
;293:*/
;294:const char *UI_GetSpecialArenaInfo( const char *tag ) {
line 297
;295:	int			n;
;296:
;297:	for( n = 0; n < ui_numArenas; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $183
JUMPV
LABELV $180
line 298
;298:		if( Q_stricmp( Info_ValueForKey( ui_arenaInfos[n], "special" ), tag ) == 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $144
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
NEI4 $184
line 299
;299:			return ui_arenaInfos[n];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
RETP4
ADDRGP4 $179
JUMPV
LABELV $184
line 301
;300:		}
;301:	}
LABELV $181
line 297
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $183
ADDRLP4 0
INDIRI4
ADDRGP4 ui_numArenas
INDIRI4
LTI4 $180
line 303
;302:
;303:	return NULL;
CNSTP4 0
RETP4
LABELV $179
endproc UI_GetSpecialArenaInfo 12 8
proc UI_LoadBotsFromFile 8216 16
line 311
;304:}
;305:
;306:/*
;307:===============
;308:UI_LoadBotsFromFile
;309:===============
;310:*/
;311:static void UI_LoadBotsFromFile( const char *filename ) {
line 316
;312:	int				len;
;313:	fileHandle_t	f;
;314:	char			buf[MAX_BOTS_TEXT];
;315:
;316:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
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
line 317
;317:	if ( f == FS_INVALID_HANDLE ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $187
line 318
;318:		trap_Print( va( S_COLOR_RED "file not found: %s\n", filename ) );
ADDRGP4 $105
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
line 319
;319:		return;
ADDRGP4 $186
JUMPV
LABELV $187
line 321
;320:	}
;321:	if ( len >= MAX_BOTS_TEXT ) {
ADDRLP4 0
INDIRI4
CNSTI4 8192
LTI4 $189
line 322
;322:		trap_Print( va( S_COLOR_RED "file too large: %s is %i, max allowed is %i", filename, len, MAX_BOTS_TEXT ) );
ADDRGP4 $108
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
line 323
;323:		trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 324
;324:		return;
ADDRGP4 $186
JUMPV
LABELV $189
line 327
;325:	}
;326:
;327:	trap_FS_Read( buf, len, f );
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
line 328
;328:	buf[len] = 0;
ADDRLP4 0
INDIRI4
ADDRLP4 8
ADDP4
CNSTI1 0
ASGNI1
line 329
;329:	trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 331
;330:
;331:	ui_numBots += UI_ParseInfos( buf, MAX_BOTS - ui_numBots, &ui_botInfos[ui_numBots] );
ADDRLP4 8
ARGP4
ADDRLP4 8204
ADDRGP4 ui_numBots
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
ADDRGP4 ui_botInfos
ADDP4
ARGP4
ADDRLP4 8212
ADDRGP4 UI_ParseInfos
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
line 332
;332:	if (outOfMemory) trap_Print(S_COLOR_YELLOW"WARNING: not anough memory in pool to load all bots\n");
ADDRGP4 outOfMemory
INDIRI4
CNSTI4 0
EQI4 $191
ADDRGP4 $193
ARGP4
ADDRGP4 trap_Print
CALLV
pop
LABELV $191
line 333
;333:}
LABELV $186
endproc UI_LoadBotsFromFile 8216 16
proc UI_LoadBots 2476 16
line 341
;334:
;335:
;336:/*
;337:===============
;338:UI_LoadBots
;339:===============
;340:*/
;341:static void UI_LoadBots( void ) {
line 350
;342:	vmCvar_t	botsFile;
;343:	int			numdirs;
;344:	char		filename[128];
;345:	char		dirlist[2048];
;346:	char*		dirptr;
;347:	int			i;
;348:	int			dirlen;
;349:
;350:	ui_numBots = 0;
ADDRGP4 ui_numBots
CNSTI4 0
ASGNI4
line 352
;351:
;352:	trap_Cvar_Register( &botsFile, "g_botsFile", "", CVAR_ARCHIVE | CVAR_LATCH );
ADDRLP4 2192
ARGP4
ADDRGP4 $195
ARGP4
ADDRGP4 $111
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 353
;353:	if ( *botsFile.string && trap_Cvar_VariableValue( "ui_gametype" ) != GT_CAMPAIGN ) {
ADDRLP4 2192+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $196
ADDRGP4 $199
ARGP4
ADDRLP4 2464
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 2464
INDIRF4
CNSTF4 0
EQF4 $196
line 354
;354:		UI_LoadBotsFromFile( botsFile.string );
ADDRLP4 2192+16
ARGP4
ADDRGP4 UI_LoadBotsFromFile
CALLV
pop
line 355
;355:	} else {
ADDRGP4 $197
JUMPV
LABELV $196
line 356
;356:		UI_LoadBotsFromFile( "scripts/bots.txt" );
ADDRGP4 $201
ARGP4
ADDRGP4 UI_LoadBotsFromFile
CALLV
pop
line 357
;357:	}
LABELV $197
line 360
;358:
;359:	// get all bots from .bot files
;360:	numdirs = trap_FS_GetFileList( "scripts", ".bot", dirlist, sizeof( dirlist ) );
ADDRGP4 $117
ARGP4
ADDRGP4 $202
ARGP4
ADDRLP4 144
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 2468
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 140
ADDRLP4 2468
INDIRI4
ASGNI4
line 361
;361:	dirptr  = dirlist;
ADDRLP4 0
ADDRLP4 144
ASGNP4
line 362
;362:	for (i = 0; i < numdirs; i++, dirptr += dirlen+1) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $206
JUMPV
LABELV $203
line 363
;363:		dirlen = strlen(dirptr);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2472
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 136
ADDRLP4 2472
INDIRI4
ASGNI4
line 364
;364:		strcpy(filename, "scripts/");
ADDRLP4 4
ARGP4
ADDRGP4 $123
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 365
;365:		strcat(filename, dirptr);
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 366
;366:		UI_LoadBotsFromFile(filename);
ADDRLP4 4
ARGP4
ADDRGP4 UI_LoadBotsFromFile
CALLV
pop
line 367
;367:	}
LABELV $204
line 362
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
LABELV $206
ADDRLP4 132
INDIRI4
ADDRLP4 140
INDIRI4
LTI4 $203
line 368
;368:	trap_Print( va( "%i bots parsed\n", ui_numBots ) );
ADDRGP4 $207
ARGP4
ADDRGP4 ui_numBots
INDIRI4
ARGI4
ADDRLP4 2472
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2472
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 369
;369:}
LABELV $194
endproc UI_LoadBots 2476 16
export UI_GetBotInfoByNumber
proc UI_GetBotInfoByNumber 8 8
line 377
;370:
;371:
;372:/*
;373:===============
;374:UI_GetBotInfoByNumber
;375:===============
;376:*/
;377:char *UI_GetBotInfoByNumber( int num ) {
line 378
;378:	if( num < 0 || num >= ui_numBots ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $211
ADDRLP4 0
INDIRI4
ADDRGP4 ui_numBots
INDIRI4
LTI4 $209
LABELV $211
line 379
;379:		trap_Print( va( S_COLOR_RED "Invalid bot number: %i\n", num ) );
ADDRGP4 $212
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
line 380
;380:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $208
JUMPV
LABELV $209
line 382
;381:	}
;382:	return ui_botInfos[num];
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_botInfos
ADDP4
INDIRP4
RETP4
LABELV $208
endproc UI_GetBotInfoByNumber 8 8
export UI_GetBotInfoByName
proc UI_GetBotInfoByName 16 8
line 391
;383:}
;384:
;385:
;386:/*
;387:===============
;388:UI_GetBotInfoByName
;389:===============
;390:*/
;391:char *UI_GetBotInfoByName( const char *name ) {
line 395
;392:	int		n;
;393:	char	*value;
;394:
;395:	for ( n = 0; n < ui_numBots ; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $217
JUMPV
LABELV $214
line 396
;396:		value = Info_ValueForKey( ui_botInfos[n], "name" );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $218
ARGP4
ADDRLP4 8
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 397
;397:		if ( !Q_stricmp( value, name ) ) {
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
NEI4 $219
line 398
;398:			return ui_botInfos[n];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_botInfos
ADDP4
INDIRP4
RETP4
ADDRGP4 $213
JUMPV
LABELV $219
line 400
;399:		}
;400:	}
LABELV $215
line 395
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $217
ADDRLP4 0
INDIRI4
ADDRGP4 ui_numBots
INDIRI4
LTI4 $214
line 402
;401:
;402:	return NULL;
CNSTP4 0
RETP4
LABELV $213
endproc UI_GetBotInfoByName 16 8
export UI_GetBestScore
proc UI_GetBestScore 1080 16
line 417
;403:}
;404:
;405:
;406://
;407:// single player game info
;408://
;409:
;410:/*
;411:===============
;412:UI_GetBestScore
;413:
;414:Returns the player's best finish on a given level, 0 if the have not played the level
;415:===============
;416:*/
;417:void UI_GetBestScore( int level, int *score, int *skill ) {
line 425
;418:	int		n;
;419:	int		skillScore;
;420:	int		bestScore;
;421:	int		bestScoreSkill;
;422:	char	arenaKey[16];
;423:	char	scores[MAX_INFO_VALUE];
;424:
;425:	if( !score || !skill ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $224
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $222
LABELV $224
line 426
;426:		return;
ADDRGP4 $221
JUMPV
LABELV $222
line 429
;427:	}
;428:
;429:	if( level < 0 || level > ui_numArenas ) {
ADDRLP4 1056
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
LTI4 $227
ADDRLP4 1056
INDIRI4
ADDRGP4 ui_numArenas
INDIRI4
LEI4 $225
LABELV $227
line 430
;430:		return;
ADDRGP4 $221
JUMPV
LABELV $225
line 433
;431:	}
;432:
;433:	bestScore = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 434
;434:	bestScoreSkill = 0;
ADDRLP4 1052
CNSTI4 0
ASGNI4
line 436
;435:
;436:	for( n = 1; n <= 5; n++ ) {
ADDRLP4 4
CNSTI4 1
ASGNI4
LABELV $228
line 437
;437:		trap_Cvar_VariableStringBuffer( va( "g_spScores%i", n ), scores, MAX_INFO_VALUE );
ADDRGP4 $232
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1060
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 439
;438:
;439:		Com_sprintf( arenaKey, sizeof( arenaKey ), "l%i", level );
ADDRLP4 8
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $233
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 440
;440:		skillScore = atoi( Info_ValueForKey( scores, arenaKey ) );
ADDRLP4 28
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 1064
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1064
INDIRP4
ARGP4
ADDRLP4 1068
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1068
INDIRI4
ASGNI4
line 442
;441:
;442:		if( skillScore < 1 || skillScore > 8 ) {
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $236
ADDRLP4 0
INDIRI4
CNSTI4 8
LEI4 $234
LABELV $236
line 443
;443:			continue;
ADDRGP4 $229
JUMPV
LABELV $234
line 446
;444:		}
;445:
;446:		if( !bestScore || skillScore <= bestScore ) {
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $239
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
GTI4 $237
LABELV $239
line 447
;447:			bestScore = skillScore;
ADDRLP4 24
ADDRLP4 0
INDIRI4
ASGNI4
line 448
;448:			bestScoreSkill = n;
ADDRLP4 1052
ADDRLP4 4
INDIRI4
ASGNI4
line 449
;449:		}
LABELV $237
line 450
;450:	}
LABELV $229
line 436
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 5
LEI4 $228
line 452
;451:
;452:	*score = bestScore;
ADDRFP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ASGNI4
line 453
;453:	*skill = bestScoreSkill;
ADDRFP4 8
INDIRP4
ADDRLP4 1052
INDIRI4
ASGNI4
line 454
;454:}
LABELV $221
endproc UI_GetBestScore 1080 16
export UI_SetBestScore
proc UI_SetBestScore 1084 16
line 464
;455:
;456:
;457:/*
;458:===============
;459:UI_SetBestScore
;460:
;461:Set the player's best finish for a level
;462:===============
;463:*/
;464:void UI_SetBestScore( int level, int score ) {
line 471
;465:	int		skill;
;466:	int		oldScore;
;467:	char	arenaKey[16];
;468:	char	scores[MAX_INFO_VALUE];
;469:
;470:	// validate score
;471:	if( score < 1 || score > 8 ) {
ADDRLP4 1048
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 1
LTI4 $243
ADDRLP4 1048
INDIRI4
CNSTI4 8
LEI4 $241
LABELV $243
line 472
;472:		return;
ADDRGP4 $240
JUMPV
LABELV $241
line 476
;473:	}
;474:
;475:	// validate skill
;476:	skill = (int)trap_Cvar_VariableValue( "g_spSkill" );
ADDRGP4 $244
ARGP4
ADDRLP4 1052
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 1052
INDIRF4
CVFI4 4
ASGNI4
line 477
;477:	if( skill < 1 || skill > 5 ) {
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $247
ADDRLP4 0
INDIRI4
CNSTI4 5
LEI4 $245
LABELV $247
line 478
;478:		return;
ADDRGP4 $240
JUMPV
LABELV $245
line 482
;479:	}
;480:
;481:	// get scores
;482:	trap_Cvar_VariableStringBuffer( va( "g_spScores%i", skill ), scores, MAX_INFO_VALUE );
ADDRGP4 $232
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1060
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 485
;483:
;484:	// see if this is better
;485:	Com_sprintf( arenaKey, sizeof( arenaKey ), "l%i", level );
ADDRLP4 4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $233
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 486
;486:	oldScore = atoi( Info_ValueForKey( scores, arenaKey ) );
ADDRLP4 20
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1064
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1064
INDIRP4
ARGP4
ADDRLP4 1068
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1044
ADDRLP4 1068
INDIRI4
ASGNI4
line 487
;487:	if( oldScore && oldScore <= score ) {
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $248
ADDRLP4 1044
INDIRI4
ADDRFP4 4
INDIRI4
GTI4 $248
line 488
;488:		return;
ADDRGP4 $240
JUMPV
LABELV $248
line 492
;489:	}
;490:
;491:	// update scores
;492:	Info_SetValueForKey( scores, arenaKey, va( "%i", score ) );
ADDRGP4 $133
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 1076
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1076
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 493
;493:	trap_Cvar_Set( va( "g_spScores%i", skill ), scores );
ADDRGP4 $232
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1080
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1080
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 494
;494:}
LABELV $240
endproc UI_SetBestScore 1084 16
export UI_LogAwardData
proc UI_LogAwardData 1056 16
line 502
;495:
;496:
;497:/*
;498:===============
;499:UI_LogAwardData
;500:===============
;501:*/
;502:void UI_LogAwardData( int award, int data ) {
line 507
;503:	char	key[16];
;504:	char	awardData[MAX_INFO_VALUE];
;505:	int		oldValue;
;506:
;507:	if( data == 0 ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $251
line 508
;508:		return;
ADDRGP4 $250
JUMPV
LABELV $251
line 511
;509:	}
;510:
;511:	if( award > AWARD_PERFECT ) {
ADDRFP4 0
INDIRI4
CNSTI4 5
LEI4 $253
line 512
;512:		trap_Print( va( S_COLOR_RED "Bad award %i in UI_LogAwardData\n", award ) );
ADDRGP4 $255
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1044
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 513
;513:		return;
ADDRGP4 $250
JUMPV
LABELV $253
line 516
;514:	}
;515:
;516:	trap_Cvar_VariableStringBuffer( "g_spAwards", awardData, sizeof(awardData) );
ADDRGP4 $256
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 518
;517:
;518:	Com_sprintf( key, sizeof(key), "a%i", award );
ADDRLP4 1024
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $257
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 519
;519:	oldValue = atoi( Info_ValueForKey( awardData, key ) );
ADDRLP4 0
ARGP4
ADDRLP4 1024
ARGP4
ADDRLP4 1044
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRLP4 1048
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 1048
INDIRI4
ASGNI4
line 521
;520:
;521:	Info_SetValueForKey( awardData, key, va( "%i", oldValue + data ) );
ADDRGP4 $133
ARGP4
ADDRLP4 1040
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ARGI4
ADDRLP4 1052
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 1024
ARGP4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 522
;522:	trap_Cvar_Set( "g_spAwards", awardData );
ADDRGP4 $256
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 523
;523:}
LABELV $250
endproc UI_LogAwardData 1056 16
export UI_GetAwardLevel
proc UI_GetAwardLevel 1048 16
line 531
;524:
;525:
;526:/*
;527:===============
;528:UI_GetAwardLevel
;529:===============
;530:*/
;531:int UI_GetAwardLevel( int award ) {
line 535
;532:	char	key[16];
;533:	char	awardData[MAX_INFO_VALUE];
;534:
;535:	trap_Cvar_VariableStringBuffer( "g_spAwards", awardData, sizeof(awardData) );
ADDRGP4 $256
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 537
;536:
;537:	Com_sprintf( key, sizeof(key), "a%i", award );
ADDRLP4 0
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $257
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 538
;538:	return atoi( Info_ValueForKey( awardData, key ) );
ADDRLP4 16
ARGP4
ADDRLP4 0
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
RETI4
LABELV $258
endproc UI_GetAwardLevel 1048 16
export UI_TierCompleted
proc UI_TierCompleted 56 12
line 547
;539:}
;540:
;541:
;542:/*
;543:===============
;544:UI_TierCompleted
;545:===============
;546:*/
;547:int UI_TierCompleted( int levelWon ) {
line 555
;548:	int			level;
;549:	int			n;
;550:	int			tier;
;551:	int			score;
;552:	int			skill;
;553:	const char	*info;
;554:
;555:	tier = levelWon / ARENAS_PER_TIER;
ADDRLP4 16
ADDRFP4 0
INDIRI4
CNSTI4 4
DIVI4
ASGNI4
line 556
;556:	level = tier * ARENAS_PER_TIER;
ADDRLP4 0
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
line 558
;557:
;558:	if( tier == UI_GetNumSPTiers() ) {
ADDRLP4 24
ADDRGP4 UI_GetNumSPTiers
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $260
line 559
;559:		info = UI_GetSpecialArenaInfo( "training" );
ADDRGP4 $262
ARGP4
ADDRLP4 28
ADDRGP4 UI_GetSpecialArenaInfo
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 28
INDIRP4
ASGNP4
line 560
;560:		if( levelWon == atoi( Info_ValueForKey( info, "num" ) ) ) {
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 $132
ARGP4
ADDRLP4 32
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $263
line 561
;561:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $259
JUMPV
LABELV $263
line 563
;562:		}
;563:		info = UI_GetSpecialArenaInfo( "final" );
ADDRGP4 $265
ARGP4
ADDRLP4 40
ADDRGP4 UI_GetSpecialArenaInfo
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 40
INDIRP4
ASGNP4
line 564
;564:		if( !info || levelWon == atoi( Info_ValueForKey( info, "num" ) ) ) {
ADDRLP4 44
ADDRLP4 20
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $268
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 $132
ARGP4
ADDRLP4 48
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 52
INDIRI4
NEI4 $266
LABELV $268
line 565
;565:			return tier + 1;
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
RETI4
ADDRGP4 $259
JUMPV
LABELV $266
line 567
;566:		}
;567:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $259
JUMPV
LABELV $260
line 570
;568:	}
;569:
;570:	for( n = 0; n < ARENAS_PER_TIER; n++, level++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $269
line 571
;571:		UI_GetBestScore( level, &score, &skill );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 UI_GetBestScore
CALLV
pop
line 572
;572:		if ( score != 1 ) {
ADDRLP4 8
INDIRI4
CNSTI4 1
EQI4 $273
line 573
;573:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $259
JUMPV
LABELV $273
line 575
;574:		}
;575:	}
LABELV $270
line 570
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 4
LTI4 $269
line 576
;576:	return tier + 1;
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
RETI4
LABELV $259
endproc UI_TierCompleted 56 12
export UI_ShowTierVideo
proc UI_ShowTierVideo 1052 16
line 585
;577:}
;578:
;579:
;580:/*
;581:===============
;582:UI_ShowTierVideo
;583:===============
;584:*/
;585:qboolean UI_ShowTierVideo( int tier ) {
line 589
;586:	char	key[16];
;587:	char	videos[MAX_INFO_VALUE];
;588:
;589:	if( tier <= 0 ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
GTI4 $276
line 590
;590:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $275
JUMPV
LABELV $276
line 593
;591:	}
;592:
;593:	trap_Cvar_VariableStringBuffer( "g_spVideos", videos, sizeof(videos) );
ADDRGP4 $278
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 595
;594:
;595:	Com_sprintf( key, sizeof(key), "tier%i", tier );
ADDRLP4 1024
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $279
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 596
;596:	if( atoi( Info_ValueForKey( videos, key ) ) ) {
ADDRLP4 0
ARGP4
ADDRLP4 1024
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
CNSTI4 0
EQI4 $280
line 597
;597:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $275
JUMPV
LABELV $280
line 600
;598:	}
;599:
;600:	Info_SetValueForKey( videos, key, va( "%i", 1 ) );
ADDRGP4 $133
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1048
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 1024
ARGP4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 601
;601:	trap_Cvar_Set( "g_spVideos", videos );
ADDRGP4 $278
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 603
;602:
;603:	return qtrue;
CNSTI4 1
RETI4
LABELV $275
endproc UI_ShowTierVideo 1052 16
export UI_CanShowTierVideo
proc UI_CanShowTierVideo 1048 16
line 612
;604:}
;605:
;606:
;607:/*
;608:===============
;609:UI_CanShowTierVideo
;610:===============
;611:*/
;612:qboolean UI_CanShowTierVideo( int tier ) {
line 616
;613:	char	key[16];
;614:	char	videos[MAX_INFO_VALUE];
;615:
;616:	if( !tier ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $283
line 617
;617:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $282
JUMPV
LABELV $283
line 620
;618:	}
;619:
;620:	if( uis.demoversion && tier != 8 ) {
ADDRGP4 uis+11464
INDIRI4
CNSTI4 0
EQI4 $285
ADDRFP4 0
INDIRI4
CNSTI4 8
EQI4 $285
line 621
;621:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $282
JUMPV
LABELV $285
line 624
;622:	}
;623:
;624:	trap_Cvar_VariableStringBuffer( "g_spVideos", videos, sizeof(videos) );
ADDRGP4 $278
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 626
;625:
;626:	Com_sprintf( key, sizeof(key), "tier%i", tier );
ADDRLP4 0
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $279
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 627
;627:	if( atoi( Info_ValueForKey( videos, key ) ) ) {
ADDRLP4 16
ARGP4
ADDRLP4 0
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
CNSTI4 0
EQI4 $288
line 628
;628:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $282
JUMPV
LABELV $288
line 631
;629:	}
;630:
;631:	return qfalse;
CNSTI4 0
RETI4
LABELV $282
endproc UI_CanShowTierVideo 1048 16
export UI_GetCurrentGame
proc UI_GetCurrentGame 32 12
line 642
;632:}
;633:
;634:
;635:/*
;636:===============
;637:UI_GetCurrentGame
;638:
;639:Returns the next level the player has not won
;640:===============
;641:*/
;642:int UI_GetCurrentGame( void ) {
line 644
;643:	int		level;
;644:	int		rank = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 648
;645:	int		skill;
;646:	const char *info;
;647:
;648:	info = UI_GetSpecialArenaInfo( "training" );
ADDRGP4 $262
ARGP4
ADDRLP4 16
ADDRGP4 UI_GetSpecialArenaInfo
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 16
INDIRP4
ASGNP4
line 649
;649:	if( info ) {
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $291
line 650
;650:		level = atoi( Info_ValueForKey( info, "num" ) );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $132
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
ADDRLP4 0
ADDRLP4 24
INDIRI4
ASGNI4
line 651
;651:		UI_GetBestScore( level, &rank, &skill );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 UI_GetBestScore
CALLV
pop
line 652
;652:		if ( !rank || rank > 1 ) {
ADDRLP4 28
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $295
ADDRLP4 28
INDIRI4
CNSTI4 1
LEI4 $293
LABELV $295
line 653
;653:			return level;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $290
JUMPV
LABELV $293
line 655
;654:		}
;655:	}
LABELV $291
line 657
;656:
;657:	for( level = 0; level < ui_numSinglePlayerArenas; level++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $299
JUMPV
LABELV $296
line 658
;658:		UI_GetBestScore( level, &rank, &skill );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 UI_GetBestScore
CALLV
pop
line 659
;659:		if ( !rank || rank > 1 ) {
ADDRLP4 20
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $302
ADDRLP4 20
INDIRI4
CNSTI4 1
LEI4 $300
LABELV $302
line 660
;660:			return level;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $290
JUMPV
LABELV $300
line 662
;661:		}
;662:	}
LABELV $297
line 657
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $299
ADDRLP4 0
INDIRI4
ADDRGP4 ui_numSinglePlayerArenas
INDIRI4
LTI4 $296
line 664
;663:
;664:	info = UI_GetSpecialArenaInfo( "final" );
ADDRGP4 $265
ARGP4
ADDRLP4 20
ADDRGP4 UI_GetSpecialArenaInfo
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 20
INDIRP4
ASGNP4
line 665
;665:	if( !info ) {
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $303
line 666
;666:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $290
JUMPV
LABELV $303
line 668
;667:	}
;668:	return atoi( Info_ValueForKey( info, "num" ) );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $132
ARGP4
ADDRLP4 24
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
RETI4
LABELV $290
endproc UI_GetCurrentGame 32 12
export UI_NewGame
proc UI_NewGame 0 8
line 679
;669:}
;670:
;671:
;672:/*
;673:===============
;674:UI_NewGame
;675:
;676:Clears the scores and sets the difficutly level
;677:===============
;678:*/
;679:void UI_NewGame( void ) {
line 680
;680:	trap_Cvar_Set( "g_spScores1", "" );
ADDRGP4 $306
ARGP4
ADDRGP4 $111
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 681
;681:	trap_Cvar_Set( "g_spScores2", "" );
ADDRGP4 $307
ARGP4
ADDRGP4 $111
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 682
;682:	trap_Cvar_Set( "g_spScores3", "" );
ADDRGP4 $308
ARGP4
ADDRGP4 $111
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 683
;683:	trap_Cvar_Set( "g_spScores4", "" );
ADDRGP4 $309
ARGP4
ADDRGP4 $111
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 684
;684:	trap_Cvar_Set( "g_spScores5", "" );
ADDRGP4 $310
ARGP4
ADDRGP4 $111
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 685
;685:	trap_Cvar_Set( "g_spAwards", "" );
ADDRGP4 $256
ARGP4
ADDRGP4 $111
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 686
;686:	trap_Cvar_Set( "g_spVideos", "" );
ADDRGP4 $278
ARGP4
ADDRGP4 $111
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 687
;687:}
LABELV $305
endproc UI_NewGame 0 8
export UI_GetNumArenas
proc UI_GetNumArenas 0 0
line 695
;688:
;689:
;690:/*
;691:===============
;692:UI_GetNumArenas
;693:===============
;694:*/
;695:int UI_GetNumArenas( void ) {
line 696
;696:	return ui_numArenas;
ADDRGP4 ui_numArenas
INDIRI4
RETI4
LABELV $311
endproc UI_GetNumArenas 0 0
export UI_GetNumSPArenas
proc UI_GetNumSPArenas 0 0
line 705
;697:}
;698:
;699:
;700:/*
;701:===============
;702:UI_GetNumSPArenas
;703:===============
;704:*/
;705:int UI_GetNumSPArenas( void ) {
line 706
;706:	return ui_numSinglePlayerArenas;
ADDRGP4 ui_numSinglePlayerArenas
INDIRI4
RETI4
LABELV $312
endproc UI_GetNumSPArenas 0 0
export UI_GetNumSPTiers
proc UI_GetNumSPTiers 0 0
line 715
;707:}
;708:
;709:
;710:/*
;711:===============
;712:UI_GetNumSPTiers
;713:===============
;714:*/
;715:int UI_GetNumSPTiers( void ) {
line 716
;716:	return ui_numSinglePlayerArenas / ARENAS_PER_TIER;
ADDRGP4 ui_numSinglePlayerArenas
INDIRI4
CNSTI4 4
DIVI4
RETI4
LABELV $313
endproc UI_GetNumSPTiers 0 0
export UI_GetNumBots
proc UI_GetNumBots 0 0
line 725
;717:}
;718:
;719:
;720:/*
;721:===============
;722:UI_GetNumBots
;723:===============
;724:*/
;725:int UI_GetNumBots( void ) {
line 726
;726:	return ui_numBots;
ADDRGP4 ui_numBots
INDIRI4
RETI4
LABELV $314
endproc UI_GetNumBots 0 0
export UI_SPUnlock_f
proc UI_SPUnlock_f 1048 16
line 735
;727:}
;728:
;729:
;730:/*
;731:===============
;732:UI_SPUnlock_f
;733:===============
;734:*/
;735:void UI_SPUnlock_f( void ) {
line 742
;736:	char	arenaKey[16];
;737:	char	scores[MAX_INFO_VALUE];
;738:	int		level;
;739:	int		tier;
;740:
;741:	// get scores for skill 1
;742:	trap_Cvar_VariableStringBuffer( "g_spScores1", scores, MAX_INFO_VALUE );
ADDRGP4 $306
ARGP4
ADDRLP4 24
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 745
;743:
;744:	// update scores
;745:	for( level = 0; level < ui_numSinglePlayerArenas + ui_numSpecialSinglePlayerArenas; level++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $319
JUMPV
LABELV $316
line 746
;746:		Com_sprintf( arenaKey, sizeof( arenaKey ), "l%i", level );
ADDRLP4 8
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $233
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 747
;747:		Info_SetValueForKey( scores, arenaKey, "1" );
ADDRLP4 24
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 $320
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 748
;748:	}
LABELV $317
line 745
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $319
ADDRLP4 0
INDIRI4
ADDRGP4 ui_numSinglePlayerArenas
INDIRI4
ADDRGP4 ui_numSpecialSinglePlayerArenas
INDIRI4
ADDI4
LTI4 $316
line 749
;749:	trap_Cvar_Set( "g_spScores1", scores );
ADDRGP4 $306
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 752
;750:
;751:	// unlock cinematics
;752:	for( tier = 1; tier <= 8; tier++ ) {
ADDRLP4 4
CNSTI4 1
ASGNI4
LABELV $321
line 753
;753:		UI_ShowTierVideo( tier );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 UI_ShowTierVideo
CALLI4
pop
line 754
;754:	}
LABELV $322
line 752
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 8
LEI4 $321
line 756
;755:
;756:	trap_Print( "All levels unlocked at skill level 1\n" );
ADDRGP4 $325
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 758
;757:
;758:	UI_SPLevelMenu_ReInit();
ADDRGP4 UI_SPLevelMenu_ReInit
CALLV
pop
line 759
;759:}
LABELV $315
endproc UI_SPUnlock_f 1048 16
export UI_SPUnlockMedals_f
proc UI_SPUnlockMedals_f 1044 16
line 767
;760:
;761:
;762:/*
;763:===============
;764:UI_SPUnlockMedals_f
;765:===============
;766:*/
;767:void UI_SPUnlockMedals_f( void ) {
line 772
;768:	int		n;
;769:	char	key[16];
;770:	char	awardData[MAX_INFO_VALUE];
;771:
;772:	trap_Cvar_VariableStringBuffer( "g_spAwards", awardData, MAX_INFO_VALUE );
ADDRGP4 $256
ARGP4
ADDRLP4 20
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 774
;773:
;774:	for( n = 0; n < 6; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $327
line 775
;775:		Com_sprintf( key, sizeof(key), "a%i", n );
ADDRLP4 4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $257
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 776
;776:		Info_SetValueForKey( awardData, key, "100" );
ADDRLP4 20
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 $331
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 777
;777:	}
LABELV $328
line 774
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $327
line 779
;778:
;779:	trap_Cvar_Set( "g_spAwards", awardData );
ADDRGP4 $256
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 781
;780:
;781:	trap_Print( "All levels unlocked at 100\n" );
ADDRGP4 $332
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 782
;782:}
LABELV $326
endproc UI_SPUnlockMedals_f 1044 16
export UI_InitGameinfo
proc UI_InitGameinfo 4 4
line 790
;783:
;784:
;785:/*
;786:===============
;787:UI_InitGameinfo
;788:===============
;789:*/
;790:void UI_InitGameinfo( void ) {
line 792
;791:
;792:	UI_InitMemory();
ADDRGP4 UI_InitMemory
CALLV
pop
line 793
;793:	UI_LoadArenas();
ADDRGP4 UI_LoadArenas
CALLV
pop
line 794
;794:	UI_LoadBots();
ADDRGP4 UI_LoadBots
CALLV
pop
line 796
;795:
;796:	if( (trap_Cvar_VariableValue( "fs_restrict" )) || (ui_numSpecialSinglePlayerArenas == 0 && ui_numSinglePlayerArenas == 4) ) {
ADDRGP4 $336
ARGP4
ADDRLP4 0
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
INDIRF4
CNSTF4 0
NEF4 $337
ADDRGP4 ui_numSpecialSinglePlayerArenas
INDIRI4
CNSTI4 0
NEI4 $334
ADDRGP4 ui_numSinglePlayerArenas
INDIRI4
CNSTI4 4
NEI4 $334
LABELV $337
line 797
;797:		uis.demoversion = qtrue;
ADDRGP4 uis+11464
CNSTI4 1
ASGNI4
line 798
;798:	}
ADDRGP4 $335
JUMPV
LABELV $334
line 799
;799:	else {
line 800
;800:		uis.demoversion = qfalse;
ADDRGP4 uis+11464
CNSTI4 0
ASGNI4
line 801
;801:	}
LABELV $335
line 802
;802:}
LABELV $333
endproc UI_InitGameinfo 4 4
bss
align 4
LABELV outOfMemory
skip 4
align 4
LABELV allocPoint
skip 4
align 1
LABELV memoryPool
skip 131072
align 4
LABELV ui_numSpecialSinglePlayerArenas
skip 4
align 4
LABELV ui_numSinglePlayerArenas
skip 4
align 4
LABELV ui_arenaInfos
skip 4096
align 4
LABELV ui_numArenas
skip 4
align 4
LABELV ui_botInfos
skip 4096
export ui_numBots
align 4
LABELV ui_numBots
skip 4
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
import UI_SPLevelMenu_ReInit
import UI_SPLevelMenu_f
import UI_SPLevelMenu
import UI_SPLevelMenu_Cache
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
LABELV $336
byte 1 102
byte 1 115
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $332
byte 1 65
byte 1 108
byte 1 108
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 32
byte 1 117
byte 1 110
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 49
byte 1 48
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $331
byte 1 49
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $325
byte 1 65
byte 1 108
byte 1 108
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 32
byte 1 117
byte 1 110
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 49
byte 1 10
byte 1 0
align 1
LABELV $320
byte 1 49
byte 1 0
align 1
LABELV $310
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 53
byte 1 0
align 1
LABELV $309
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 52
byte 1 0
align 1
LABELV $308
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 51
byte 1 0
align 1
LABELV $307
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 50
byte 1 0
align 1
LABELV $306
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 49
byte 1 0
align 1
LABELV $279
byte 1 116
byte 1 105
byte 1 101
byte 1 114
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $278
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 86
byte 1 105
byte 1 100
byte 1 101
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $265
byte 1 102
byte 1 105
byte 1 110
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $262
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
LABELV $257
byte 1 97
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $256
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 65
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $255
byte 1 94
byte 1 49
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 97
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 85
byte 1 73
byte 1 95
byte 1 76
byte 1 111
byte 1 103
byte 1 65
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 68
byte 1 97
byte 1 116
byte 1 97
byte 1 10
byte 1 0
align 1
LABELV $244
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
LABELV $233
byte 1 108
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $232
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $218
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $212
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
LABELV $207
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
LABELV $202
byte 1 46
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $201
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
LABELV $199
byte 1 117
byte 1 105
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
LABELV $195
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
LABELV $193
byte 1 94
byte 1 51
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 110
byte 1 111
byte 1 117
byte 1 103
byte 1 104
byte 1 32
byte 1 109
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 111
byte 1 111
byte 1 108
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $178
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $164
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
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
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
LABELV $149
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
byte 1 105
byte 1 103
byte 1 110
byte 1 111
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 107
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 100
byte 1 105
byte 1 118
byte 1 105
byte 1 115
byte 1 105
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $144
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $143
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $138
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $133
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $132
byte 1 110
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $127
byte 1 94
byte 1 51
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 110
byte 1 111
byte 1 117
byte 1 103
byte 1 104
byte 1 32
byte 1 109
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 111
byte 1 111
byte 1 108
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $124
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
LABELV $123
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
LABELV $118
byte 1 46
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $117
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $116
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
LABELV $111
byte 1 0
align 1
LABELV $110
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
LABELV $108
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
LABELV $105
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
LABELV $99
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $98
byte 1 92
byte 1 110
byte 1 117
byte 1 109
byte 1 92
byte 1 0
align 1
LABELV $97
byte 1 60
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 62
byte 1 0
align 1
LABELV $94
byte 1 125
byte 1 0
align 1
LABELV $91
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
LABELV $85
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
LABELV $82
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
LABELV $81
byte 1 123
byte 1 0
