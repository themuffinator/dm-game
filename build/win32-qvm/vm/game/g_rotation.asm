export G_MapExist
code
proc G_MapExist 24 12
file "..\..\..\..\code\game\g_rotation.c"
line 6
;1:// Public Domain
;2:
;3:#include "g_local.h"
;4:
;5:qboolean G_MapExist( const char *map ) 
;6:{
line 10
;7:	fileHandle_t fh;
;8:	int len;
;9:
;10:	if ( !map || !*map )
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $58
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $56
LABELV $58
line 11
;11:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $55
JUMPV
LABELV $56
line 13
;12:
;13:	len = trap_FS_FOpenFile( va( "maps/%s.bsp", map ), &fh, FS_READ );
ADDRGP4 $59
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 16
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 16
INDIRI4
ASGNI4
line 15
;14:
;15:	if ( len < 0 )
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $60
line 16
;16:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $55
JUMPV
LABELV $60
line 18
;17:
;18:	trap_FS_FCloseFile( fh );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 20
;19:
;20:	return ( len >= 144 ) ? qtrue : qfalse ;
ADDRLP4 0
INDIRI4
CNSTI4 144
LTI4 $63
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRGP4 $64
JUMPV
LABELV $63
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $64
ADDRLP4 20
INDIRI4
RETI4
LABELV $55
endproc G_MapExist 24 12
export G_LoadMap
proc G_LoadMap 304 12
line 25
;21:}
;22:
;23:
;24:void G_LoadMap( const char *map ) 
;25:{
line 30
;26:	char cmd[ MAX_CVAR_VALUE_STRING ];
;27:	char ver[ 16 ];
;28:	int version;
;29:
;30:	trap_Cvar_VariableStringBuffer( "version", ver, sizeof( ver ) );
ADDRGP4 $66
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 31
;31:	if ( !Q_strncmp( ver, "Q3 1.32 ", 8 ) || !Q_strncmp( ver, "Q3 1.32b ", 9 ) ||
ADDRLP4 0
ARGP4
ADDRGP4 $69
ARGP4
CNSTI4 8
ARGI4
ADDRLP4 276
ADDRGP4 Q_strncmp
CALLI4
ASGNI4
ADDRLP4 276
INDIRI4
CNSTI4 0
EQI4 $73
ADDRLP4 0
ARGP4
ADDRGP4 $70
ARGP4
CNSTI4 9
ARGI4
ADDRLP4 280
ADDRGP4 Q_strncmp
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
EQI4 $73
ADDRLP4 0
ARGP4
ADDRGP4 $71
ARGP4
CNSTI4 9
ARGI4
ADDRLP4 284
ADDRGP4 Q_strncmp
CALLI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 0
NEI4 $67
LABELV $73
line 33
;32:		!Q_strncmp( ver, "Q3 1.32c ", 9 ) ) 
;33:		version = 0; // buggy vanilla binaries
ADDRLP4 272
CNSTI4 0
ASGNI4
ADDRGP4 $68
JUMPV
LABELV $67
line 35
;34:	else
;35:		version = 1;
ADDRLP4 272
CNSTI4 1
ASGNI4
LABELV $68
line 37
;36:
;37:	if ( !map || !*map || !G_MapExist( map ) || !Q_stricmp( map, g_mapname.string ) ) {
ADDRLP4 288
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 288
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $79
ADDRLP4 288
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $79
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 292
ADDRGP4 G_MapExist
CALLI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
EQI4 $79
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 g_mapname+16
ARGP4
ADDRLP4 296
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 296
INDIRI4
CNSTI4 0
NEI4 $74
LABELV $79
line 38
;38:		if ( level.time > 12*60*60*1000 || version == 0 || level.denyMapRestart )
ADDRGP4 level+32
INDIRI4
CNSTI4 43200000
GTI4 $85
ADDRLP4 272
INDIRI4
CNSTI4 0
EQI4 $85
ADDRGP4 level+11800
INDIRI4
CNSTI4 0
EQI4 $80
LABELV $85
line 39
;39:			BG_sprintf( cmd, "map \"%s\"\n", g_mapname.string );
ADDRLP4 16
ARGP4
ADDRGP4 $86
ARGP4
ADDRGP4 g_mapname+16
ARGP4
ADDRGP4 BG_sprintf
CALLI4
pop
ADDRGP4 $75
JUMPV
LABELV $80
line 41
;40:		else
;41:			Q_strcpy( cmd, "map_restart 0\n" );
ADDRLP4 16
ARGP4
ADDRGP4 $88
ARGP4
ADDRGP4 Q_strcpy
CALLV
pop
line 42
;42:	} else {
ADDRGP4 $75
JUMPV
LABELV $74
line 43
;43:		if ( !G_MapExist( map ) ) // required map doesn't exists, reload existing
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 300
ADDRGP4 G_MapExist
CALLI4
ASGNI4
ADDRLP4 300
INDIRI4
CNSTI4 0
NEI4 $89
line 44
;44:			BG_sprintf( cmd, "map \"%s\"\n", g_mapname.string );
ADDRLP4 16
ARGP4
ADDRGP4 $86
ARGP4
ADDRGP4 g_mapname+16
ARGP4
ADDRGP4 BG_sprintf
CALLI4
pop
ADDRGP4 $90
JUMPV
LABELV $89
line 46
;45:		else
;46:			BG_sprintf( cmd, "map \"%s\"\n", map );
ADDRLP4 16
ARGP4
ADDRGP4 $86
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BG_sprintf
CALLI4
pop
LABELV $90
line 47
;47:	}
LABELV $75
line 49
;48:
;49:	trap_SendConsoleCommand( EXEC_APPEND, cmd );
CNSTI4 2
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 50
;50:	level.restarted = qtrue;
ADDRGP4 level+72
CNSTI4 1
ASGNI4
line 51
;51:}
LABELV $65
endproc G_LoadMap 304 12
export ParseMapRotation
proc ParseMapRotation 4660 12
line 55
;52:
;53:
;54:qboolean ParseMapRotation( void ) 
;55:{
line 64
;56:	char buf[ 4096 ];
;57:	char cvar[ 256 ];
;58:	char map[ 256 ];
;59:	char *s;
;60:	fileHandle_t fh;
;61:	int	len;
;62:	char *tk;
;63:	int reqIndex; 
;64:	int curIndex = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 65
;65:	int scopeLevel = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 67
;66:
;67:	if ( g_gametype.integer == GT_CAMPAIGN || !g_rotation.string[0] )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
EQI4 $98
ADDRGP4 g_rotation+16
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $94
LABELV $98
line 68
;68:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $93
JUMPV
LABELV $94
line 70
;69:
;70:	len = trap_FS_FOpenFile( g_rotation.string, &fh, FS_READ );
ADDRGP4 g_rotation+16
ARGP4
ADDRLP4 4376
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4636
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 4372
ADDRLP4 4636
INDIRI4
ASGNI4
line 71
;71:	if ( fh == FS_INVALID_HANDLE ) 
ADDRLP4 4376
INDIRI4
CNSTI4 0
NEI4 $100
line 72
;72:	{
line 73
;73:		Com_Printf( S_COLOR_YELLOW "%s: map rotation file doesn't exists.\n", g_rotation.string );
ADDRGP4 $102
ARGP4
ADDRGP4 g_rotation+16
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 74
;74:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $93
JUMPV
LABELV $100
line 76
;75:	}
;76:	if ( len >= sizeof( buf ) ) 
ADDRLP4 4372
INDIRI4
CVIU4 4
CNSTU4 4096
LTU4 $104
line 77
;77:	{
line 78
;78:		Com_Printf( S_COLOR_YELLOW "%s: map rotation file is too big.\n", g_rotation.string );
ADDRGP4 $106
ARGP4
ADDRGP4 g_rotation+16
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 79
;79:		len = sizeof( buf ) - 1;
ADDRLP4 4372
CNSTI4 4095
ASGNI4
line 80
;80:	}
LABELV $104
line 81
;81:	trap_FS_Read( buf, len, fh );
ADDRLP4 276
ARGP4
ADDRLP4 4372
INDIRI4
ARGI4
ADDRLP4 4376
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 82
;82:	buf[ len ] = '\0';
ADDRLP4 4372
INDIRI4
ADDRLP4 276
ADDP4
CNSTI1 0
ASGNI1
line 83
;83:	trap_FS_FCloseFile( fh );
ADDRLP4 4376
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 85
;84:	
;85:	Com_InitSeparators(); // needed for COM_ParseSep()
ADDRGP4 Com_InitSeparators
CALLV
pop
line 87
;86:
;87:	reqIndex = trap_Cvar_VariableIntegerValue( SV_ROTATION );
ADDRGP4 $108
ARGP4
ADDRLP4 4640
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 4640
INDIRI4
ASGNI4
line 88
;88:	if ( reqIndex == 0 )
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $109
line 89
;89:		reqIndex = 1;
ADDRLP4 8
CNSTI4 1
ASGNI4
LABELV $109
LABELV $111
line 93
;90:
;91:__rescan:
;92:
;93:	COM_BeginParseSession( g_rotation.string );
ADDRGP4 g_rotation+16
ARGP4
ADDRGP4 COM_BeginParseSession
CALLV
pop
line 95
;94:
;95:	s = buf; // initialize token parsing
ADDRLP4 4
ADDRLP4 276
ASGNP4
line 96
;96:	map[0] = '\0';
ADDRLP4 4380
CNSTI1 0
ASGNI1
ADDRGP4 $114
JUMPV
LABELV $113
line 99
;97:
;98:	while ( 1 ) 
;99:	{
line 100
;100:		tk = COM_ParseSep( &s, qtrue );
ADDRLP4 4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 4644
ADDRGP4 COM_ParseSep
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4644
INDIRP4
ASGNP4
line 101
;101:		if ( tk[0] == '\0' ) 
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $116
line 102
;102:			break;
ADDRGP4 $115
JUMPV
LABELV $116
line 104
;103:
;104:		if ( tk[0] == '$' ) // cvar name
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 36
NEI4 $118
line 105
;105:		{
line 107
;106:			 // save cvar name
;107:			strcpy( cvar, tk+1 );
ADDRLP4 20
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 108
;108:			tk = COM_ParseSep( &s, qfalse );
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4648
ADDRGP4 COM_ParseSep
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4648
INDIRP4
ASGNP4
line 110
;109:			// expect '='
;110:			if ( tk[0] == '=' && tk[1] == '\0' ) 
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 61
NEI4 $120
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $120
line 111
;111:			{
line 112
;112:				tk = COM_ParseSep( &s, qtrue );
ADDRLP4 4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 4656
ADDRGP4 COM_ParseSep
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4656
INDIRP4
ASGNP4
line 113
;113:				if ( !scopeLevel || curIndex == reqIndex ) 
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $124
ADDRLP4 12
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $122
LABELV $124
line 114
;114:				{
line 115
;115:					trap_Cvar_Set( cvar, tk );
ADDRLP4 20
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 116
;116:				}
LABELV $122
line 117
;117:				SkipTillSeparators( &s ); 
ADDRLP4 4
ARGP4
ADDRGP4 SkipTillSeparators
CALLV
pop
line 118
;118:				continue;
ADDRGP4 $114
JUMPV
LABELV $120
line 121
;119:			}
;120:			else 
;121:			{
line 122
;122:				COM_ParseWarning( S_COLOR_YELLOW "missing '=' after '%s'", cvar );
ADDRGP4 $125
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 COM_ParseWarning
CALLV
pop
line 123
;123:				SkipRestOfLine( &s );
ADDRLP4 4
ARGP4
ADDRGP4 SkipRestOfLine
CALLV
pop
line 124
;124:				continue;
ADDRGP4 $114
JUMPV
LABELV $118
line 128
;125:			}
;126:
;127:		}
;128:		else if ( tk[0] == '{' && tk[1] == '\0' ) 
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $126
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $126
line 129
;129:		{
line 130
;130:			if ( scopeLevel == 0 && curIndex ) 
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $128
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $128
line 131
;131:			{
line 132
;132:				scopeLevel++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 133
;133:				continue;
ADDRGP4 $114
JUMPV
LABELV $128
line 136
;134:			}
;135:			else 
;136:			{
line 137
;137:				COM_ParseWarning( S_COLOR_YELLOW "unexpected '{'" );
ADDRGP4 $130
ARGP4
ADDRGP4 COM_ParseWarning
CALLV
pop
line 138
;138:				continue;
ADDRGP4 $114
JUMPV
LABELV $126
line 141
;139:			}
;140:		}
;141:		else if ( tk[0] == '}' && tk[1] == '\0' ) 
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $131
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $131
line 142
;142:		{
line 143
;143:			if ( scopeLevel == 1 ) 
ADDRLP4 16
INDIRI4
CNSTI4 1
NEI4 $133
line 144
;144:			{
line 145
;145:				scopeLevel--;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 146
;146:				continue;
ADDRGP4 $114
JUMPV
LABELV $133
line 149
;147:			}
;148:			else 
;149:			{
line 150
;150:				COM_ParseWarning( S_COLOR_YELLOW "unexpected '}'" );
ADDRGP4 $135
ARGP4
ADDRGP4 COM_ParseWarning
CALLV
pop
line 151
;151:			}
line 152
;152:		}
ADDRGP4 $132
JUMPV
LABELV $131
line 153
;153:		else if ( G_MapExist( tk ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4656
ADDRGP4 G_MapExist
CALLI4
ASGNI4
ADDRLP4 4656
INDIRI4
CNSTI4 0
EQI4 $136
line 154
;154:		{
line 155
;155:			curIndex++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 156
;156:			if ( curIndex == reqIndex ) 
ADDRLP4 12
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $137
line 157
;157:			{
line 158
;158:				Q_strncpyz( map, tk, sizeof( map ) );
ADDRLP4 4380
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 159
;159:			}
line 160
;160:		}
ADDRGP4 $137
JUMPV
LABELV $136
line 162
;161:		else 
;162:		{
line 163
;163:			COM_ParseWarning( S_COLOR_YELLOW "map '%s' doesn't exists", tk );
ADDRGP4 $140
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 COM_ParseWarning
CALLV
pop
line 164
;164:			SkipRestOfLine( &s );
ADDRLP4 4
ARGP4
ADDRGP4 SkipRestOfLine
CALLV
pop
line 165
;165:			continue;
LABELV $137
LABELV $132
line 167
;166:		}
;167:	}
LABELV $114
line 98
ADDRGP4 $113
JUMPV
LABELV $115
line 169
;168:
;169:	if ( curIndex == 0 ) // no maps in rotation file
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $141
line 170
;170:	{
line 171
;171:		Com_Printf( S_COLOR_YELLOW "%s: no maps in rotation file.\n", g_rotation.string );
ADDRGP4 $143
ARGP4
ADDRGP4 g_rotation+16
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 172
;172:		trap_Cvar_Set( SV_ROTATION, "1" );
ADDRGP4 $108
ARGP4
ADDRGP4 $145
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 173
;173:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $93
JUMPV
LABELV $141
line 176
;174:	}
;175:
;176:	if ( !map[0] ) // map at required index not found?
ADDRLP4 4380
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $146
line 177
;177:	{
line 178
;178:		if ( reqIndex > 1 ) // try to rescan with lower index
ADDRLP4 8
INDIRI4
CNSTI4 1
LEI4 $148
line 179
;179:		{
line 180
;180:			Com_Printf( S_COLOR_CYAN "%s: map at index %i not found, rescan\n", g_rotation.integer, reqIndex );
ADDRGP4 $150
ARGP4
ADDRGP4 g_rotation+12
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 181
;181:			reqIndex = 1;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 182
;182:			goto __rescan;
ADDRGP4 $111
JUMPV
LABELV $148
line 184
;183:		}
;184:		trap_Cvar_Set( SV_ROTATION, "1" );
ADDRGP4 $108
ARGP4
ADDRGP4 $145
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 185
;185:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $93
JUMPV
LABELV $146
line 188
;186:	}
;187:
;188:	reqIndex++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 189
;189:	if ( reqIndex > curIndex )
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
LEI4 $152
line 190
;190:		reqIndex = 1;
ADDRLP4 8
CNSTI4 1
ASGNI4
LABELV $152
line 192
;191:
;192:	trap_Cvar_Set( SV_ROTATION, va( "%i", reqIndex ) );
ADDRGP4 $154
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 4644
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $108
ARGP4
ADDRLP4 4644
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 193
;193:	trap_Cvar_Set( "g_restarted", "1" );
ADDRGP4 $155
ARGP4
ADDRGP4 $145
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 194
;194:	G_LoadMap( map );
ADDRLP4 4380
ARGP4
ADDRGP4 G_LoadMap
CALLV
pop
line 196
;195:
;196:	return qtrue;
CNSTI4 1
RETI4
LABELV $93
endproc ParseMapRotation 4660 12
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
LABELV $155
byte 1 103
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $154
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $150
byte 1 94
byte 1 53
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 105
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 32
byte 1 37
byte 1 105
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
byte 1 44
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 99
byte 1 97
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $145
byte 1 49
byte 1 0
align 1
LABELV $143
byte 1 94
byte 1 51
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $140
byte 1 94
byte 1 51
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 32
byte 1 100
byte 1 111
byte 1 101
byte 1 115
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 101
byte 1 120
byte 1 105
byte 1 115
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $135
byte 1 94
byte 1 51
byte 1 117
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
byte 1 39
byte 1 125
byte 1 39
byte 1 0
align 1
LABELV $130
byte 1 94
byte 1 51
byte 1 117
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
byte 1 39
byte 1 123
byte 1 39
byte 1 0
align 1
LABELV $125
byte 1 94
byte 1 51
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 39
byte 1 61
byte 1 39
byte 1 32
byte 1 97
byte 1 102
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 0
align 1
LABELV $108
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 77
byte 1 97
byte 1 112
byte 1 73
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 0
align 1
LABELV $106
byte 1 94
byte 1 51
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 98
byte 1 105
byte 1 103
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $102
byte 1 94
byte 1 51
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 100
byte 1 111
byte 1 101
byte 1 115
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 101
byte 1 120
byte 1 105
byte 1 115
byte 1 116
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $88
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $86
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $71
byte 1 81
byte 1 51
byte 1 32
byte 1 49
byte 1 46
byte 1 51
byte 1 50
byte 1 99
byte 1 32
byte 1 0
align 1
LABELV $70
byte 1 81
byte 1 51
byte 1 32
byte 1 49
byte 1 46
byte 1 51
byte 1 50
byte 1 98
byte 1 32
byte 1 0
align 1
LABELV $69
byte 1 81
byte 1 51
byte 1 32
byte 1 49
byte 1 46
byte 1 51
byte 1 50
byte 1 32
byte 1 0
align 1
LABELV $66
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $59
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 46
byte 1 98
byte 1 115
byte 1 112
byte 1 0
