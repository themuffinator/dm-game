export Com_Clamp
code
proc Com_Clamp 0 0
file "..\..\..\..\code\qcommon\q_shared.c"
line 6
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// q_shared.c -- stateless support routines that are included in each code dll
;4:#include "../qcommon/q_shared.h"
;5:
;6:float Com_Clamp( float min, float max, float value ) {
line 7
;7:	if ( value < min ) {
ADDRFP4 8
INDIRF4
ADDRFP4 0
INDIRF4
GEF4 $22
line 8
;8:		return min;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $21
JUMPV
LABELV $22
line 10
;9:	}
;10:	if ( value > max ) {
ADDRFP4 8
INDIRF4
ADDRFP4 4
INDIRF4
LEF4 $24
line 11
;11:		return max;
ADDRFP4 4
INDIRF4
RETF4
ADDRGP4 $21
JUMPV
LABELV $24
line 13
;12:	}
;13:	return value;
ADDRFP4 8
INDIRF4
RETF4
LABELV $21
endproc Com_Clamp 0 0
export COM_SkipPath
proc COM_SkipPath 4 0
line 23
;14:}
;15:
;16:
;17:/*
;18:============
;19:COM_SkipPath
;20:============
;21:*/
;22:char *COM_SkipPath (char *pathname)
;23:{
line 26
;24:	char	*last;
;25:	
;26:	last = pathname;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $28
JUMPV
LABELV $27
line 28
;27:	while (*pathname)
;28:	{
line 29
;29:		if (*pathname=='/')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $30
line 30
;30:			last = pathname+1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $30
line 31
;31:		pathname++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 32
;32:	}
LABELV $28
line 27
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $27
line 33
;33:	return last;
ADDRLP4 0
INDIRP4
RETP4
LABELV $26
endproc COM_SkipPath 4 0
export COM_StripExtension
proc COM_StripExtension 12 12
line 41
;34:}
;35:
;36:/*
;37:============
;38:COM_StripExtension
;39:============
;40:*/
;41:void COM_StripExtension( const char *in, char *out, int destsize ) {
line 44
;42:	int             length;
;43:
;44:	Q_strncpyz(out, in, destsize);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 46
;45:
;46:	length = strlen(out)-1;
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $34
JUMPV
LABELV $33
line 48
;47:	while (length > 0 && out[length] != '.')
;48:	{
line 49
;49:		length--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 50
;50:		if (out[length] == '/')
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $36
line 51
;51:			return;		// no extension
ADDRGP4 $32
JUMPV
LABELV $36
line 52
;52:	}
LABELV $34
line 47
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $38
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 46
NEI4 $33
LABELV $38
line 53
;53:	if ( length )
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $39
line 54
;54:		out[ length ] = '\0';
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
LABELV $39
line 55
;55:}
LABELV $32
endproc COM_StripExtension 12 12
export COM_DefaultExtension
proc COM_DefaultExtension 76 20
line 63
;56:
;57:
;58:/*
;59:==================
;60:COM_DefaultExtension
;61:==================
;62:*/
;63:void COM_DefaultExtension (char *path, int maxSize, const char *extension ) {
line 71
;64:	char	oldPath[MAX_QPATH];
;65:	char    *src;
;66:
;67://
;68:// if path doesn't have a .EXT, append extension
;69:// (extension should include the .)
;70://
;71:	src = path + strlen(path) - 1;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 68
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI4 -1
ADDP4
ASGNP4
ADDRGP4 $43
JUMPV
LABELV $42
line 73
;72:
;73:	while (*src != '/' && src != path) {
line 74
;74:		if ( *src == '.' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 46
NEI4 $45
line 75
;75:			return;                 // it has an extension
ADDRGP4 $41
JUMPV
LABELV $45
line 77
;76:		}
;77:		src--;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 -1
ADDP4
ASGNP4
line 78
;78:	}
LABELV $43
line 73
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 47
EQI4 $47
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $42
LABELV $47
line 80
;79:
;80:	Q_strncpyz( oldPath, path, sizeof( oldPath ) );
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
line 81
;81:	Com_sprintf( path, maxSize, "%s%s", oldPath, extension );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $48
ARGP4
ADDRLP4 4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 82
;82:}
LABELV $41
endproc COM_DefaultExtension 76 20
export COM_BeginParseSession
proc COM_BeginParseSession 0 16
line 100
;83:
;84:
;85:/*
;86:============================================================================
;87:
;88:PARSING
;89:
;90:============================================================================
;91:*/
;92:
;93:static	char	com_token[MAX_TOKEN_CHARS];
;94:static	char	com_parsename[MAX_TOKEN_CHARS];
;95:static	int		com_lines;
;96:static	int		com_tokenline;
;97:static	int		is_separator[ 256 ];
;98:
;99:void COM_BeginParseSession( const char *name )
;100:{
line 101
;101:	com_lines = 1;
ADDRGP4 com_lines
CNSTI4 1
ASGNI4
line 102
;102:	com_tokenline = 0;
ADDRGP4 com_tokenline
CNSTI4 0
ASGNI4
line 103
;103:	Com_sprintf(com_parsename, sizeof(com_parsename), "%s", name);
ADDRGP4 com_parsename
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $50
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 104
;104:}
LABELV $49
endproc COM_BeginParseSession 0 16
export COM_GetCurrentParseLine
proc COM_GetCurrentParseLine 0 0
line 108
;105:
;106:
;107:int COM_GetCurrentParseLine( void )
;108:{
line 109
;109:	if ( com_tokenline )
ADDRGP4 com_tokenline
INDIRI4
CNSTI4 0
EQI4 $52
line 110
;110:	{
line 111
;111:		return com_tokenline;
ADDRGP4 com_tokenline
INDIRI4
RETI4
ADDRGP4 $51
JUMPV
LABELV $52
line 114
;112:	}
;113:
;114:	return com_lines;
ADDRGP4 com_lines
INDIRI4
RETI4
LABELV $51
endproc COM_GetCurrentParseLine 0 0
export COM_Parse
proc COM_Parse 4 8
line 118
;115:}
;116:
;117:char *COM_Parse( char **data_p )
;118:{
line 119
;119:	return COM_ParseExt( data_p, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 0
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
RETP4
LABELV $54
endproc COM_Parse 4 8
bss
align 1
LABELV $56
skip 4096
export COM_ParseError
code
proc COM_ParseError 4 16
line 127
;120:}
;121:
;122:
;123:extern int ED_vsprintf( char *buffer, const char *fmt, va_list argptr );
;124:
;125:
;126:void COM_ParseError( char *format, ... )
;127:{
line 131
;128:	va_list argptr;
;129:	static char string[4096];
;130:
;131:	va_start (argptr, format);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 132
;132:	ED_vsprintf (string, format, argptr);
ADDRGP4 $56
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
line 133
;133:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 135
;134:
;135:	Com_Printf("ERROR: %s, line %d: %s\n", com_parsename, com_lines, string);
ADDRGP4 $58
ARGP4
ADDRGP4 com_parsename
ARGP4
ADDRGP4 com_lines
INDIRI4
ARGI4
ADDRGP4 $56
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 136
;136:}
LABELV $55
endproc COM_ParseError 4 16
bss
align 1
LABELV $60
skip 4096
export COM_ParseWarning
code
proc COM_ParseWarning 4 16
line 140
;137:
;138:
;139:void COM_ParseWarning( char *format, ... )
;140:{
line 144
;141:	va_list argptr;
;142:	static char string[4096];
;143:
;144:	va_start (argptr, format);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 145
;145:	ED_vsprintf (string, format, argptr);
ADDRGP4 $60
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
line 146
;146:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 148
;147:
;148:	Com_Printf("WARNING: %s, line %d: %s\n", com_parsename, com_lines, string);
ADDRGP4 $62
ARGP4
ADDRGP4 com_parsename
ARGP4
ADDRGP4 com_lines
INDIRI4
ARGI4
ADDRGP4 $60
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 149
;149:}
LABELV $59
endproc COM_ParseWarning 4 16
proc SkipWhitespace 8 0
line 164
;150:
;151:
;152:/*
;153:==============
;154:COM_Parse
;155:
;156:Parse a token out of a string
;157:Will never return NULL, just empty strings
;158:
;159:If "allowLineBreaks" is qtrue then an empty
;160:string will be returned if the next token is
;161:a newline.
;162:==============
;163:*/
;164:static char *SkipWhitespace( char *data, qboolean *hasNewLines ) {
ADDRGP4 $65
JUMPV
LABELV $64
line 167
;165:	int c;
;166:
;167:	while( (c = *data) <= ' ') {
line 168
;168:		if( !c ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $67
line 169
;169:			return NULL;
CNSTP4 0
RETP4
ADDRGP4 $63
JUMPV
LABELV $67
line 171
;170:		}
;171:		if( c == '\n' ) {
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $69
line 172
;172:			com_lines++;
ADDRLP4 4
ADDRGP4 com_lines
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 173
;173:			*hasNewLines = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 1
ASGNI4
line 174
;174:		}
LABELV $69
line 175
;175:		data++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 176
;176:	}
LABELV $65
line 167
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 32
LEI4 $64
line 178
;177:
;178:	return data;
ADDRFP4 0
INDIRP4
RETP4
LABELV $63
endproc SkipWhitespace 8 0
export COM_Compress
proc COM_Compress 44 0
line 182
;179:}
;180:
;181:
;182:int COM_Compress( char *data_p ) {
line 185
;183:	char *in, *out;
;184:	int c;
;185:	qboolean newline = qfalse, whitespace = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 16
CNSTI4 0
ASGNI4
line 187
;186:
;187:	in = out = data_p;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 188
;188:	if (in) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $72
ADDRGP4 $75
JUMPV
LABELV $74
line 189
;189:		while ((c = *in) != 0) {
line 191
;190:			// skip double slash comments
;191:			if ( c == '/' && in[1] == '/' ) {
ADDRLP4 4
INDIRI4
CNSTI4 47
NEI4 $77
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $77
ADDRGP4 $80
JUMPV
LABELV $79
line 192
;192:				while (*in && *in != '\n') {
line 193
;193:					in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 194
;194:				}
LABELV $80
line 192
ADDRLP4 24
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $82
ADDRLP4 24
INDIRI4
CNSTI4 10
NEI4 $79
LABELV $82
line 196
;195:			// skip /* */ comments
;196:			} else if ( c == '/' && in[1] == '*' ) {
ADDRGP4 $78
JUMPV
LABELV $77
ADDRLP4 4
INDIRI4
CNSTI4 47
NEI4 $83
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $83
ADDRGP4 $86
JUMPV
LABELV $85
line 198
;197:				while ( *in && ( *in != '*' || in[1] != '/' ) ) 
;198:					in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $86
line 197
ADDRLP4 28
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $88
ADDRLP4 28
INDIRI4
CNSTI4 42
NEI4 $85
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $85
LABELV $88
line 199
;199:				if ( *in ) 
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $84
line 200
;200:					in += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 202
;201:                        // record when we hit a newline
;202:                        } else if ( c == '\n' || c == '\r' ) {
ADDRGP4 $84
JUMPV
LABELV $83
ADDRLP4 4
INDIRI4
CNSTI4 10
EQI4 $93
ADDRLP4 4
INDIRI4
CNSTI4 13
NEI4 $91
LABELV $93
line 203
;203:                            newline = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 204
;204:                            in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 206
;205:                        // record when we hit whitespace
;206:                        } else if ( c == ' ' || c == '\t') {
ADDRGP4 $92
JUMPV
LABELV $91
ADDRLP4 4
INDIRI4
CNSTI4 32
EQI4 $96
ADDRLP4 4
INDIRI4
CNSTI4 9
NEI4 $94
LABELV $96
line 207
;207:                            whitespace = qtrue;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 208
;208:                            in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 210
;209:                        // an actual token
;210:			} else {
ADDRGP4 $95
JUMPV
LABELV $94
line 212
;211:                            // if we have a pending newline, emit it (and it counts as whitespace)
;212:                            if (newline) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $97
line 213
;213:                                *out++ = '\n';
ADDRLP4 32
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 32
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI1 10
ASGNI1
line 214
;214:                                newline = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 215
;215:                                whitespace = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 216
;216:                            } else if (whitespace) {
ADDRGP4 $98
JUMPV
LABELV $97
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $99
line 217
;217:                                *out++ = ' ';
ADDRLP4 32
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 32
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI1 32
ASGNI1
line 218
;218:                                whitespace = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 219
;219:                            }
LABELV $99
LABELV $98
line 222
;220:                            
;221:                            // copy quoted strings unmolested
;222:                            if (c == '"') {
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $101
line 223
;223:                                    *out++ = c;
ADDRLP4 32
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 32
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 224
;224:                                    in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $104
JUMPV
LABELV $103
line 225
;225:                                    while (1) {
line 226
;226:                                        c = *in;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 227
;227:                                        if (c && c != '"') {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $105
ADDRLP4 4
INDIRI4
CNSTI4 34
EQI4 $105
line 228
;228:                                            *out++ = c;
ADDRLP4 40
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 40
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 229
;229:                                            in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 230
;230:                                        } else {
line 231
;231:                                            break;
LABELV $107
line 233
;232:                                        }
;233:                                    }
LABELV $104
line 225
ADDRGP4 $103
JUMPV
LABELV $105
line 234
;234:                                    if (c == '"') {
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $102
line 235
;235:                                        *out++ = c;
ADDRLP4 36
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 236
;236:                                        in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 237
;237:                                    }
line 238
;238:                            } else {
ADDRGP4 $102
JUMPV
LABELV $101
line 239
;239:                                *out = c;
ADDRLP4 8
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 240
;240:                                out++;
ADDRLP4 8
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 241
;241:                                in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 242
;242:                            }
LABELV $102
line 243
;243:			}
LABELV $95
LABELV $92
LABELV $84
LABELV $78
line 244
;244:		}
LABELV $75
line 189
ADDRLP4 24
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $74
line 245
;245:	}
LABELV $72
line 246
;246:	*out = 0;
ADDRLP4 8
INDIRP4
CNSTI1 0
ASGNI1
line 247
;247:	return out - data_p;
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
RETI4
LABELV $71
endproc COM_Compress 44 0
export COM_ParseExt
proc COM_ParseExt 28 8
line 252
;248:}
;249:
;250:
;251:char *COM_ParseExt( char **data_p, qboolean allowLineBreaks )
;252:{
line 253
;253:	int c = 0, len;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 254
;254:	qboolean hasNewLines = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 257
;255:	char *data;
;256:
;257:	data = *data_p;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 258
;258:	len = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 259
;259:	com_token[0] = '\0';
ADDRGP4 com_token
CNSTI1 0
ASGNI1
line 260
;260:	com_tokenline = 0;
ADDRGP4 com_tokenline
CNSTI4 0
ASGNI4
line 263
;261:
;262:	// make sure incoming data is valid
;263:	if ( !data )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $114
line 264
;264:	{
line 265
;265:		*data_p = NULL;
ADDRFP4 0
INDIRP4
CNSTP4 0
ASGNP4
line 266
;266:		return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $110
JUMPV
LABELV $113
line 270
;267:	}
;268:
;269:	while ( 1 )
;270:	{
line 272
;271:		// skip whitespace
;272:		data = SkipWhitespace( data, &hasNewLines );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 16
ADDRGP4 SkipWhitespace
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 273
;273:		if ( !data )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $116
line 274
;274:		{
line 275
;275:			*data_p = NULL;
ADDRFP4 0
INDIRP4
CNSTP4 0
ASGNP4
line 276
;276:			return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $110
JUMPV
LABELV $116
line 278
;277:		}
;278:		if ( hasNewLines && !allowLineBreaks )
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $118
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $118
line 279
;279:		{
line 280
;280:			*data_p = data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 281
;281:			return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $110
JUMPV
LABELV $118
line 284
;282:		}
;283:
;284:		c = *data;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 287
;285:
;286:		// skip double slash comments
;287:		if ( c == '/' && data[1] == '/' )
ADDRLP4 4
INDIRI4
CNSTI4 47
NEI4 $120
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $120
line 288
;288:		{
line 289
;289:			data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
ADDRGP4 $123
JUMPV
LABELV $122
line 290
;290:			while (*data && *data != '\n') {
line 291
;291:				data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 292
;292:			}
LABELV $123
line 290
ADDRLP4 20
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $125
ADDRLP4 20
INDIRI4
CNSTI4 10
NEI4 $122
LABELV $125
line 293
;293:		}
ADDRGP4 $121
JUMPV
LABELV $120
line 295
;294:		// skip /* */ comments
;295:		else if ( c == '/' && data[1] == '*' ) 
ADDRLP4 4
INDIRI4
CNSTI4 47
NEI4 $115
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $115
line 296
;296:		{
line 297
;297:			data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
ADDRGP4 $129
JUMPV
LABELV $128
line 299
;298:			while ( *data && ( *data != '*' || data[1] != '/' ) ) 
;299:			{
line 300
;300:				if ( *data == '\n' )
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 10
NEI4 $131
line 301
;301:				{
line 302
;302:					com_lines++;
ADDRLP4 20
ADDRGP4 com_lines
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 303
;303:				}
LABELV $131
line 304
;304:				data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 305
;305:			}
LABELV $129
line 298
ADDRLP4 24
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $133
ADDRLP4 24
INDIRI4
CNSTI4 42
NEI4 $128
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $128
LABELV $133
line 306
;306:			if ( *data ) 
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $127
line 307
;307:			{
line 308
;308:				data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 309
;309:			}
line 310
;310:		}
line 312
;311:		else
;312:		{
line 313
;313:			break;
LABELV $127
LABELV $121
line 315
;314:		}
;315:	}
LABELV $114
line 269
ADDRGP4 $113
JUMPV
LABELV $115
line 317
;316:
;317:	com_tokenline = com_lines;
ADDRGP4 com_tokenline
ADDRGP4 com_lines
INDIRI4
ASGNI4
line 320
;318:
;319:	// handle quoted strings
;320:	if ( c == '"' )
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $136
line 321
;321:	{
line 322
;322:		data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $139
JUMPV
LABELV $138
line 324
;323:		while ( 1 )
;324:		{
line 325
;325:			c = *data;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 326
;326:			if ( c == '"' || c == '\0' )
ADDRLP4 4
INDIRI4
CNSTI4 34
EQI4 $143
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $141
LABELV $143
line 327
;327:			{
line 328
;328:				if ( c == '"' )
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $144
line 329
;329:					data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $144
line 331
;330:
;331:				com_token[ len ] = '\0';
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
CNSTI1 0
ASGNI1
line 332
;332:				*data_p = ( char * ) data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 333
;333:				return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $110
JUMPV
LABELV $141
line 335
;334:			}
;335:			data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 336
;336:			if ( c == '\n' )
ADDRLP4 4
INDIRI4
CNSTI4 10
NEI4 $146
line 337
;337:			{
line 338
;338:				com_lines++;
ADDRLP4 20
ADDRGP4 com_lines
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 339
;339:			}
LABELV $146
line 340
;340:			if ( len < MAX_TOKEN_CHARS-1 )
ADDRLP4 8
INDIRI4
CNSTI4 1023
GEI4 $148
line 341
;341:			{
line 342
;342:				com_token[ len ] = c;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 343
;343:				len++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 344
;344:			}
LABELV $148
line 345
;345:		}
LABELV $139
line 323
ADDRGP4 $138
JUMPV
line 346
;346:	}
LABELV $136
LABELV $150
line 350
;347:
;348:	// parse a regular word
;349:	do
;350:	{
line 351
;351:		if ( len < MAX_TOKEN_CHARS - 1 )
ADDRLP4 8
INDIRI4
CNSTI4 1023
GEI4 $153
line 352
;352:		{
line 353
;353:			com_token[ len ] = c;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 354
;354:			len++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 355
;355:		}
LABELV $153
line 356
;356:		data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 357
;357:		c = *data;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 358
;358:	} while ( c > ' ' );
LABELV $151
ADDRLP4 4
INDIRI4
CNSTI4 32
GTI4 $150
line 360
;359:
;360:	com_token[ len ] = '\0';
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
CNSTI1 0
ASGNI1
line 362
;361:
;362:	*data_p = ( char * ) data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 363
;363:	return com_token;
ADDRGP4 com_token
RETP4
LABELV $110
endproc COM_ParseExt 28 8
export COM_MatchToken
proc COM_MatchToken 12 16
line 372
;364:}
;365:
;366:
;367:/*
;368:==================
;369:COM_MatchToken
;370:==================
;371:*/
;372:void COM_MatchToken( char **buf_p, char *match ) {
line 375
;373:	char	*token;
;374:
;375:	token = COM_Parse( buf_p );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 376
;376:	if ( strcmp( token, match ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $156
line 377
;377:		Com_Error( ERR_DROP, "MatchToken: %s != %s", token, match );
CNSTI4 1
ARGI4
ADDRGP4 $158
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 378
;378:	}
LABELV $156
line 379
;379:}
LABELV $155
endproc COM_MatchToken 12 16
export SkipBracedSection
proc SkipBracedSection 12 8
line 391
;380:
;381:
;382:/*
;383:=================
;384:SkipBracedSection
;385:
;386:The next token should be an open brace.
;387:Skips until a matching close brace is found.
;388:Internal brace depths are properly skipped.
;389:=================
;390:*/
;391:void SkipBracedSection( char **program ) {
line 395
;392:	char			*token;
;393:	int				depth;
;394:
;395:	depth = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $160
line 396
;396:	do {
line 397
;397:		token = COM_ParseExt( program, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 398
;398:		if( token[1] == 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $163
line 399
;399:			if( token[0] == '{' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $165
line 400
;400:				depth++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 401
;401:			}
ADDRGP4 $166
JUMPV
LABELV $165
line 402
;402:			else if( token[0] == '}' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $167
line 403
;403:				depth--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 404
;404:			}
LABELV $167
LABELV $166
line 405
;405:		}
LABELV $163
line 406
;406:	} while( depth && *program );
LABELV $161
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $169
ADDRFP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $160
LABELV $169
line 407
;407:}
LABELV $159
endproc SkipBracedSection 12 8
export SkipRestOfLine
proc SkipRestOfLine 12 0
line 415
;408:
;409:
;410:/*
;411:=================
;412:SkipRestOfLine
;413:=================
;414:*/
;415:void SkipRestOfLine( char **data ) {
line 419
;416:	char	*p;
;417:	int		c;
;418:
;419:	p = *data;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 421
;420:
;421:	if ( !*p )
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $174
line 422
;422:		return;
ADDRGP4 $170
JUMPV
LABELV $173
line 424
;423:
;424:	while ( (c = *p) != '\0' ) {
line 425
;425:		p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 426
;426:		if ( c == '\n' ) {
ADDRLP4 4
INDIRI4
CNSTI4 10
NEI4 $176
line 427
;427:			com_lines++;
ADDRLP4 8
ADDRGP4 com_lines
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 428
;428:			break;
ADDRGP4 $175
JUMPV
LABELV $176
line 430
;429:		}
;430:	}
LABELV $174
line 424
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $173
LABELV $175
line 432
;431:
;432:	*data = p;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 433
;433:}
LABELV $170
endproc SkipRestOfLine 12 0
export Com_InitSeparators
proc Com_InitSeparators 0 0
line 437
;434:
;435:
;436:void Com_InitSeparators( void )
;437:{
line 438
;438:	is_separator['\n']=1;
ADDRGP4 is_separator+40
CNSTI4 1
ASGNI4
line 439
;439:	is_separator[';']=1;
ADDRGP4 is_separator+236
CNSTI4 1
ASGNI4
line 440
;440:	is_separator['=']=1;
ADDRGP4 is_separator+244
CNSTI4 1
ASGNI4
line 441
;441:	is_separator['{']=1;
ADDRGP4 is_separator+492
CNSTI4 1
ASGNI4
line 442
;442:	is_separator['}']=1;
ADDRGP4 is_separator+500
CNSTI4 1
ASGNI4
line 443
;443:}
LABELV $178
endproc Com_InitSeparators 0 0
export SkipTillSeparators
proc SkipTillSeparators 12 0
line 447
;444:
;445:
;446:void SkipTillSeparators( char **data )
;447:{
line 451
;448:	char	*p;
;449:	int	c;
;450:
;451:	p = *data;
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 453
;452:
;453:	if ( !*p )
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $188
line 454
;454:		return;
ADDRGP4 $184
JUMPV
LABELV $187
line 457
;455:
;456:	while ( (c = *p) != '\0' ) 
;457:	{
line 458
;458:		p++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 459
;459:		if ( is_separator[ c ] )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 is_separator
ADDP4
INDIRI4
CNSTI4 0
EQI4 $190
line 460
;460:		{
line 461
;461:			if ( c == '\n' )
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $189
line 462
;462:			{
line 463
;463:				com_lines++;
ADDRLP4 8
ADDRGP4 com_lines
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 464
;464:			}
line 465
;465:			break;
ADDRGP4 $189
JUMPV
LABELV $190
line 467
;466:		}
;467:	}
LABELV $188
line 456
ADDRLP4 8
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $187
LABELV $189
line 469
;468:
;469:	*data = p;
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRP4
ASGNP4
line 470
;470:}
LABELV $184
endproc SkipTillSeparators 12 0
export COM_ParseSep
proc COM_ParseSep 28 8
line 474
;471:
;472:
;473:char *COM_ParseSep( char **data_p, qboolean allowLineBreaks )
;474:{
line 475
;475:	int c = 0, len;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 476
;476:	qboolean hasNewLines = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 479
;477:	char *data;
;478:
;479:	data = *data_p;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 480
;480:	len = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 481
;481:	com_token[0] = '\0';
ADDRGP4 com_token
CNSTI1 0
ASGNI1
line 482
;482:	com_tokenline = 0;
ADDRGP4 com_tokenline
CNSTI4 0
ASGNI4
line 485
;483:
;484:	// make sure incoming data is valid
;485:	if ( !data )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $198
line 486
;486:	{
line 487
;487:		*data_p = NULL;
ADDRFP4 0
INDIRP4
CNSTP4 0
ASGNP4
line 488
;488:		return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $194
JUMPV
LABELV $197
line 492
;489:	}
;490:
;491:	while ( 1 )
;492:	{
line 494
;493:		// skip whitespace
;494:		data = SkipWhitespace( data, &hasNewLines );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 16
ADDRGP4 SkipWhitespace
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 495
;495:		if ( !data )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $200
line 496
;496:		{
line 497
;497:			*data_p = NULL;
ADDRFP4 0
INDIRP4
CNSTP4 0
ASGNP4
line 498
;498:			return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $194
JUMPV
LABELV $200
line 500
;499:		}
;500:		if ( hasNewLines && !allowLineBreaks )
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $202
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $202
line 501
;501:		{
line 502
;502:			*data_p = data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 503
;503:			return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $194
JUMPV
LABELV $202
line 506
;504:		}
;505:
;506:		c = *data;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 509
;507:
;508:		// skip double slash comments
;509:		if ( c == '/' && data[1] == '/' )
ADDRLP4 4
INDIRI4
CNSTI4 47
NEI4 $204
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $204
line 510
;510:		{
line 511
;511:			data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
ADDRGP4 $207
JUMPV
LABELV $206
line 512
;512:			while (*data && *data != '\n') {
line 513
;513:				data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 514
;514:			}
LABELV $207
line 512
ADDRLP4 20
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $209
ADDRLP4 20
INDIRI4
CNSTI4 10
NEI4 $206
LABELV $209
line 515
;515:		}
ADDRGP4 $205
JUMPV
LABELV $204
line 517
;516:		// skip /* */ comments
;517:		else if ( c == '/' && data[1] == '*' ) 
ADDRLP4 4
INDIRI4
CNSTI4 47
NEI4 $199
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $199
line 518
;518:		{
line 519
;519:			data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
ADDRGP4 $213
JUMPV
LABELV $212
line 521
;520:			while ( *data && ( *data != '*' || data[1] != '/' ) ) 
;521:			{
line 522
;522:				if ( *data == '\n' )
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 10
NEI4 $215
line 523
;523:				{
line 524
;524:					com_lines++;
ADDRLP4 20
ADDRGP4 com_lines
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 525
;525:				}
LABELV $215
line 526
;526:				data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 527
;527:			}
LABELV $213
line 520
ADDRLP4 24
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $217
ADDRLP4 24
INDIRI4
CNSTI4 42
NEI4 $212
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $212
LABELV $217
line 528
;528:			if ( *data ) 
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $211
line 529
;529:			{
line 530
;530:				data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 531
;531:			}
line 532
;532:		}
line 534
;533:		else
;534:		{
line 535
;535:			break;
LABELV $211
LABELV $205
line 537
;536:		}
;537:	}
LABELV $198
line 491
ADDRGP4 $197
JUMPV
LABELV $199
line 539
;538:
;539:	com_tokenline = com_lines;
ADDRGP4 com_tokenline
ADDRGP4 com_lines
INDIRI4
ASGNI4
line 542
;540:
;541:	// handle quoted strings
;542:	if ( c == '"' )
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $220
line 543
;543:	{
line 544
;544:		data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $223
JUMPV
LABELV $222
line 546
;545:		while ( 1 )
;546:		{
line 547
;547:			c = *data;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 548
;548:			if ( c == '"' || c == '\0' )
ADDRLP4 4
INDIRI4
CNSTI4 34
EQI4 $227
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $225
LABELV $227
line 549
;549:			{
line 550
;550:				if ( c == '"' )
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $228
line 551
;551:					data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $228
line 553
;552:
;553:				com_token[ len ] = '\0';
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
CNSTI1 0
ASGNI1
line 554
;554:				*data_p = ( char * ) data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 555
;555:				return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $194
JUMPV
LABELV $225
line 557
;556:			}
;557:			data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 558
;558:			if ( c == '\n' )
ADDRLP4 4
INDIRI4
CNSTI4 10
NEI4 $230
line 559
;559:			{
line 560
;560:				com_lines++;
ADDRLP4 20
ADDRGP4 com_lines
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 561
;561:			}
LABELV $230
line 562
;562:			if ( len < MAX_TOKEN_CHARS-1 )
ADDRLP4 8
INDIRI4
CNSTI4 1023
GEI4 $232
line 563
;563:			{
line 564
;564:				com_token[ len ] = c;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 565
;565:				len++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 566
;566:			}
LABELV $232
line 567
;567:		}
LABELV $223
line 545
ADDRGP4 $222
JUMPV
line 568
;568:	}
LABELV $220
line 571
;569:
;570:	// special case for separators
;571: 	if ( is_separator[ c ]  )  
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 is_separator
ADDP4
INDIRI4
CNSTI4 0
EQI4 $234
line 572
;572:	{
line 573
;573:		com_token[ len ] = c;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 574
;574:		len++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 575
;575:		data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 576
;576:	} 
ADDRGP4 $235
JUMPV
LABELV $234
LABELV $236
line 579
;577:	else // parse a regular word
;578:	do
;579:	{
line 580
;580:		if ( len < MAX_TOKEN_CHARS - 1 )
ADDRLP4 8
INDIRI4
CNSTI4 1023
GEI4 $239
line 581
;581:		{
line 582
;582:			com_token[ len ] = c;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 583
;583:			len++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 584
;584:		}
LABELV $239
line 585
;585:		data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 586
;586:		c = *data;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 587
;587:	} while ( c > ' ' && !is_separator[ c ] );
LABELV $237
ADDRLP4 4
INDIRI4
CNSTI4 32
LEI4 $241
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 is_separator
ADDP4
INDIRI4
CNSTI4 0
EQI4 $236
LABELV $241
LABELV $235
line 589
;588:
;589:	com_token[ len ] = '\0';
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
CNSTI1 0
ASGNI1
line 591
;590:
;591:	*data_p = ( char * ) data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 592
;592:	return com_token;
ADDRGP4 com_token
RETP4
LABELV $194
endproc COM_ParseSep 28 8
export Com_Split
proc Com_Split 20 0
line 602
;593:}
;594:
;595:
;596:/*
;597:============
;598:Com_Split
;599:============
;600:*/
;601:int Com_Split( char *in, char **out, int outsz, int delim ) 
;602:{
line 604
;603:	int c;
;604:	char **o = out, **end = out + outsz;
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRFP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
ASGNP4
line 606
;605:	// skip leading spaces
;606:	if ( delim >= ' ' ) {
ADDRFP4 12
INDIRI4
CNSTI4 32
LTI4 $243
ADDRGP4 $246
JUMPV
LABELV $245
line 608
;607:		while( (c = *in) != '\0' && c <= ' ' ) 
;608:			in++; 
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $246
line 607
ADDRLP4 12
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $248
ADDRLP4 0
INDIRI4
CNSTI4 32
LEI4 $245
LABELV $248
line 609
;609:	}
LABELV $243
line 610
;610:	*out = in; out++;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRGP4 $250
JUMPV
line 611
;611:	while( out < end ) {
LABELV $252
line 613
;612:		while( (c = *in) != '\0' && c != delim ) 
;613:			in++; 
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $253
line 612
ADDRLP4 12
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $255
ADDRLP4 0
INDIRI4
ADDRFP4 12
INDIRI4
NEI4 $252
LABELV $255
line 614
;614:		*in = '\0';
ADDRFP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 615
;615:		if ( !c ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $256
line 617
;616:			// don't count last null value
;617:			if ( out[-1][0] == '\0' ) 
ADDRFP4 4
INDIRP4
CNSTI4 -4
ADDP4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $267
line 618
;618:				out--;
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 -4
ADDP4
ASGNP4
line 619
;619:			break;
ADDRGP4 $267
JUMPV
LABELV $256
line 621
;620:		}
;621:		in++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 623
;622:		// skip leading spaces
;623:		if ( delim >= ' ' ) {
ADDRFP4 12
INDIRI4
CNSTI4 32
LTI4 $260
ADDRGP4 $263
JUMPV
LABELV $262
line 625
;624:			while( (c = *in) != '\0' && c <= ' ' ) 
;625:				in++; 
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $263
line 624
ADDRLP4 16
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
ADDRLP4 16
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $265
ADDRLP4 0
INDIRI4
CNSTI4 32
LEI4 $262
LABELV $265
line 626
;626:		}
LABELV $260
line 627
;627:		*out = in; out++;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
line 628
;628:	}
LABELV $250
line 611
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
LTU4 $253
ADDRGP4 $267
JUMPV
LABELV $266
line 631
;629:	// sanitize last value
;630:	while( (c = *in) != '\0' && c != delim ) 
;631:		in++; 
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $267
line 630
ADDRLP4 12
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $269
ADDRLP4 0
INDIRI4
ADDRFP4 12
INDIRI4
NEI4 $266
LABELV $269
line 632
;632:	*in = '\0';
ADDRFP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 633
;633:	c = out - o;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 4
DIVI4
ASGNI4
ADDRGP4 $271
JUMPV
LABELV $270
line 635
;634:	// set remaining out pointers
;635:	while( out < end ) {
line 636
;636:		*out = in; out++;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
line 637
;637:	}
LABELV $271
line 635
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
LTU4 $270
line 638
;638:	return c;
ADDRLP4 0
INDIRI4
RETI4
LABELV $242
endproc Com_Split 20 0
export Parse1DMatrix
proc Parse1DMatrix 16 8
line 642
;639:}
;640:
;641:
;642:void Parse1DMatrix (char **buf_p, int x, float *m) {
line 646
;643:	char	*token;
;644:	int		i;
;645:
;646:	COM_MatchToken( buf_p, "(" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $274
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 648
;647:
;648:	for (i = 0 ; i < x ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $278
JUMPV
LABELV $275
line 649
;649:		token = COM_Parse(buf_p);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 650
;650:		m[i] = atof(token);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
line 651
;651:	}
LABELV $276
line 648
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $278
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $275
line 653
;652:
;653:	COM_MatchToken( buf_p, ")" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $279
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 654
;654:}
LABELV $273
endproc Parse1DMatrix 16 8
export Parse2DMatrix
proc Parse2DMatrix 8 12
line 656
;655:
;656:void Parse2DMatrix (char **buf_p, int y, int x, float *m) {
line 659
;657:	int		i;
;658:
;659:	COM_MatchToken( buf_p, "(" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $274
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 661
;660:
;661:	for (i = 0 ; i < y ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $284
JUMPV
LABELV $281
line 662
;662:		Parse1DMatrix (buf_p, x, m + i * x);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
CNSTI4 2
LSHI4
ADDRFP4 12
INDIRP4
ADDP4
ARGP4
ADDRGP4 Parse1DMatrix
CALLV
pop
line 663
;663:	}
LABELV $282
line 661
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $284
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $281
line 665
;664:
;665:	COM_MatchToken( buf_p, ")" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $279
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 666
;666:}
LABELV $280
endproc Parse2DMatrix 8 12
export Parse3DMatrix
proc Parse3DMatrix 12 16
line 668
;667:
;668:void Parse3DMatrix (char **buf_p, int z, int y, int x, float *m) {
line 671
;669:	int		i;
;670:
;671:	COM_MatchToken( buf_p, "(" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $274
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 673
;672:
;673:	for (i = 0 ; i < z ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $289
JUMPV
LABELV $286
line 674
;674:		Parse2DMatrix (buf_p, y, x, m + i * x*y);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
ADDRFP4 12
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 4
INDIRI4
MULI4
CNSTI4 2
LSHI4
ADDRFP4 16
INDIRP4
ADDP4
ARGP4
ADDRGP4 Parse2DMatrix
CALLV
pop
line 675
;675:	}
LABELV $287
line 673
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $289
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $286
line 677
;676:
;677:	COM_MatchToken( buf_p, ")" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $279
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 678
;678:}
LABELV $285
endproc Parse3DMatrix 12 16
lit
export locase
align 1
LABELV locase
byte 1 0
byte 1 1
byte 1 2
byte 1 3
byte 1 4
byte 1 5
byte 1 6
byte 1 7
byte 1 8
byte 1 9
byte 1 10
byte 1 11
byte 1 12
byte 1 13
byte 1 14
byte 1 15
byte 1 16
byte 1 17
byte 1 18
byte 1 19
byte 1 20
byte 1 21
byte 1 22
byte 1 23
byte 1 24
byte 1 25
byte 1 26
byte 1 27
byte 1 28
byte 1 29
byte 1 30
byte 1 31
byte 1 32
byte 1 33
byte 1 34
byte 1 35
byte 1 36
byte 1 37
byte 1 38
byte 1 39
byte 1 40
byte 1 41
byte 1 42
byte 1 43
byte 1 44
byte 1 45
byte 1 46
byte 1 47
byte 1 48
byte 1 49
byte 1 50
byte 1 51
byte 1 52
byte 1 53
byte 1 54
byte 1 55
byte 1 56
byte 1 57
byte 1 58
byte 1 59
byte 1 60
byte 1 61
byte 1 62
byte 1 63
byte 1 64
byte 1 97
byte 1 98
byte 1 99
byte 1 100
byte 1 101
byte 1 102
byte 1 103
byte 1 104
byte 1 105
byte 1 106
byte 1 107
byte 1 108
byte 1 109
byte 1 110
byte 1 111
byte 1 112
byte 1 113
byte 1 114
byte 1 115
byte 1 116
byte 1 117
byte 1 118
byte 1 119
byte 1 120
byte 1 121
byte 1 122
byte 1 91
byte 1 92
byte 1 93
byte 1 94
byte 1 95
byte 1 96
byte 1 97
byte 1 98
byte 1 99
byte 1 100
byte 1 101
byte 1 102
byte 1 103
byte 1 104
byte 1 105
byte 1 106
byte 1 107
byte 1 108
byte 1 109
byte 1 110
byte 1 111
byte 1 112
byte 1 113
byte 1 114
byte 1 115
byte 1 116
byte 1 117
byte 1 118
byte 1 119
byte 1 120
byte 1 121
byte 1 122
byte 1 123
byte 1 124
byte 1 125
byte 1 126
byte 1 127
byte 1 128
byte 1 129
byte 1 130
byte 1 131
byte 1 132
byte 1 133
byte 1 134
byte 1 135
byte 1 136
byte 1 137
byte 1 138
byte 1 139
byte 1 140
byte 1 141
byte 1 142
byte 1 143
byte 1 144
byte 1 145
byte 1 146
byte 1 147
byte 1 148
byte 1 149
byte 1 150
byte 1 151
byte 1 152
byte 1 153
byte 1 154
byte 1 155
byte 1 156
byte 1 157
byte 1 158
byte 1 159
byte 1 160
byte 1 161
byte 1 162
byte 1 163
byte 1 164
byte 1 165
byte 1 166
byte 1 167
byte 1 168
byte 1 169
byte 1 170
byte 1 171
byte 1 172
byte 1 173
byte 1 174
byte 1 175
byte 1 176
byte 1 177
byte 1 178
byte 1 179
byte 1 180
byte 1 181
byte 1 182
byte 1 183
byte 1 184
byte 1 185
byte 1 186
byte 1 187
byte 1 188
byte 1 189
byte 1 190
byte 1 191
byte 1 192
byte 1 193
byte 1 194
byte 1 195
byte 1 196
byte 1 197
byte 1 198
byte 1 199
byte 1 200
byte 1 201
byte 1 202
byte 1 203
byte 1 204
byte 1 205
byte 1 206
byte 1 207
byte 1 208
byte 1 209
byte 1 210
byte 1 211
byte 1 212
byte 1 213
byte 1 214
byte 1 215
byte 1 216
byte 1 217
byte 1 218
byte 1 219
byte 1 220
byte 1 221
byte 1 222
byte 1 223
byte 1 224
byte 1 225
byte 1 226
byte 1 227
byte 1 228
byte 1 229
byte 1 230
byte 1 231
byte 1 232
byte 1 233
byte 1 234
byte 1 235
byte 1 236
byte 1 237
byte 1 238
byte 1 239
byte 1 240
byte 1 241
byte 1 242
byte 1 243
byte 1 244
byte 1 245
byte 1 246
byte 1 247
byte 1 248
byte 1 249
byte 1 250
byte 1 251
byte 1 252
byte 1 253
byte 1 254
byte 1 255
export Q_isprint
code
proc Q_isprint 4 0
line 727
;679:
;680:
;681:/*
;682:============================================================================
;683:
;684:					LIBRARY REPLACEMENT FUNCTIONS
;685:
;686:============================================================================
;687:*/
;688:
;689:const byte locase[ 256 ] =
;690:{
;691:	0x00,0x01,0x02,0x03,0x04,0x05,0x06,0x07,
;692:	0x08,0x09,0x0a,0x0b,0x0c,0x0d,0x0e,0x0f,
;693:	0x10,0x11,0x12,0x13,0x14,0x15,0x16,0x17,
;694:	0x18,0x19,0x1a,0x1b,0x1c,0x1d,0x1e,0x1f,
;695:	0x20,0x21,0x22,0x23,0x24,0x25,0x26,0x27,
;696:	0x28,0x29,0x2a,0x2b,0x2c,0x2d,0x2e,0x2f,
;697:	0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37,
;698:	0x38,0x39,0x3a,0x3b,0x3c,0x3d,0x3e,0x3f,
;699:	0x40,0x61,0x62,0x63,0x64,0x65,0x66,0x67,
;700:	0x68,0x69,0x6a,0x6b,0x6c,0x6d,0x6e,0x6f,
;701:	0x70,0x71,0x72,0x73,0x74,0x75,0x76,0x77,
;702:	0x78,0x79,0x7a,0x5b,0x5c,0x5d,0x5e,0x5f,
;703:	0x60,0x61,0x62,0x63,0x64,0x65,0x66,0x67,
;704:	0x68,0x69,0x6a,0x6b,0x6c,0x6d,0x6e,0x6f,
;705:	0x70,0x71,0x72,0x73,0x74,0x75,0x76,0x77,
;706:	0x78,0x79,0x7a,0x7b,0x7c,0x7d,0x7e,0x7f,
;707:	0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,
;708:	0x88,0x89,0x8a,0x8b,0x8c,0x8d,0x8e,0x8f,
;709:	0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,
;710:	0x98,0x99,0x9a,0x9b,0x9c,0x9d,0x9e,0x9f,
;711:	0xa0,0xa1,0xa2,0xa3,0xa4,0xa5,0xa6,0xa7,
;712:	0xa8,0xa9,0xaa,0xab,0xac,0xad,0xae,0xaf,
;713:	0xb0,0xb1,0xb2,0xb3,0xb4,0xb5,0xb6,0xb7,
;714:	0xb8,0xb9,0xba,0xbb,0xbc,0xbd,0xbe,0xbf,
;715:	0xc0,0xc1,0xc2,0xc3,0xc4,0xc5,0xc6,0xc7,
;716:	0xc8,0xc9,0xca,0xcb,0xcc,0xcd,0xce,0xcf,
;717:	0xd0,0xd1,0xd2,0xd3,0xd4,0xd5,0xd6,0xd7,
;718:	0xd8,0xd9,0xda,0xdb,0xdc,0xdd,0xde,0xdf,
;719:	0xe0,0xe1,0xe2,0xe3,0xe4,0xe5,0xe6,0xe7,
;720:	0xe8,0xe9,0xea,0xeb,0xec,0xed,0xee,0xef,
;721:	0xf0,0xf1,0xf2,0xf3,0xf4,0xf5,0xf6,0xf7,
;722:	0xf8,0xf9,0xfa,0xfb,0xfc,0xfd,0xfe,0xff
;723:};
;724:
;725:
;726:int Q_isprint( int c )
;727:{
line 728
;728:	if ( c >= 0x20 && c <= 0x7E )
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $291
ADDRLP4 0
INDIRI4
CNSTI4 126
GTI4 $291
line 729
;729:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $290
JUMPV
LABELV $291
line 730
;730:	return ( 0 );
CNSTI4 0
RETI4
LABELV $290
endproc Q_isprint 4 0
export Q_islower
proc Q_islower 4 0
line 735
;731:}
;732:
;733:
;734:int Q_islower( int c )
;735:{
line 736
;736:	if (c >= 'a' && c <= 'z')
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 97
LTI4 $294
ADDRLP4 0
INDIRI4
CNSTI4 122
GTI4 $294
line 737
;737:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $293
JUMPV
LABELV $294
line 738
;738:	return ( 0 );
CNSTI4 0
RETI4
LABELV $293
endproc Q_islower 4 0
export Q_isupper
proc Q_isupper 4 0
line 743
;739:}
;740:
;741:
;742:int Q_isupper( int c )
;743:{
line 744
;744:	if (c >= 'A' && c <= 'Z')
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 65
LTI4 $297
ADDRLP4 0
INDIRI4
CNSTI4 90
GTI4 $297
line 745
;745:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $296
JUMPV
LABELV $297
line 746
;746:	return ( 0 );
CNSTI4 0
RETI4
LABELV $296
endproc Q_isupper 4 0
export Q_isalpha
proc Q_isalpha 8 0
line 751
;747:}
;748:
;749:
;750:int Q_isalpha( int c )
;751:{
line 752
;752:	if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z'))
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 97
LTI4 $303
ADDRLP4 0
INDIRI4
CNSTI4 122
LEI4 $302
LABELV $303
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 65
LTI4 $300
ADDRLP4 4
INDIRI4
CNSTI4 90
GTI4 $300
LABELV $302
line 753
;753:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $299
JUMPV
LABELV $300
line 754
;754:	return ( 0 );
CNSTI4 0
RETI4
LABELV $299
endproc Q_isalpha 8 0
export Q_strrchr
proc Q_strrchr 12 0
line 759
;755:}
;756:
;757:
;758:char* Q_strrchr( const char* string, int c )
;759:{
line 760
;760:	char cc = c;
ADDRLP4 4
ADDRFP4 4
INDIRI4
CVII1 4
ASGNI1
line 762
;761:	char *s;
;762:	char *sp=(char *)0;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 764
;763:
;764:	s = (char*)string;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $306
JUMPV
LABELV $305
line 767
;765:
;766:	while (*s)
;767:	{
line 768
;768:		if (*s == cc)
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI1
CVII4 1
NEI4 $308
line 769
;769:			sp = s;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $308
line 770
;770:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 771
;771:	}
LABELV $306
line 766
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $305
line 772
;772:	if (cc == 0)
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $310
line 773
;773:		sp = s;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $310
line 775
;774:
;775:	return sp;
ADDRLP4 8
INDIRP4
RETP4
LABELV $304
endproc Q_strrchr 12 0
export Q_strncpyz
proc Q_strncpyz 0 12
line 787
;776:}
;777:
;778:
;779:/*
;780:=============
;781:Q_strncpyz
;782: 
;783:Safe strncpy that ensures a trailing zero
;784:=============
;785:*/
;786:void Q_strncpyz( char *dest, const char *src, int destsize ) 
;787:{
line 788
;788:	if ( !dest ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $313
line 789
;789:		Com_Error( ERR_FATAL, "Q_strncpyz: NULL dest" );
CNSTI4 0
ARGI4
ADDRGP4 $315
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 790
;790:	}
LABELV $313
line 792
;791:
;792:	if ( !src ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $316
line 793
;793:		Com_Error( ERR_FATAL, "Q_strncpyz: NULL src" );
CNSTI4 0
ARGI4
ADDRGP4 $318
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 794
;794:	}
LABELV $316
line 796
;795:
;796:	if ( destsize < 1 ) {
ADDRFP4 8
INDIRI4
CNSTI4 1
GEI4 $319
line 797
;797:		Com_Error(ERR_FATAL,"Q_strncpyz: destsize < 1" ); 
CNSTI4 0
ARGI4
ADDRGP4 $321
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 798
;798:	}
LABELV $319
line 800
;799:
;800:	strncpy( dest, src, destsize-1 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRGP4 strncpy
CALLP4
pop
line 801
;801:	dest[ destsize-1 ] = '\0';
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 802
;802:}
LABELV $312
endproc Q_strncpyz 0 12
export Q_stricmpn
proc Q_stricmpn 24 0
line 805
;803:
;804:                 
;805:int Q_stricmpn( const char *s1, const char *s2, int n ) {
line 808
;806:	int	c1, c2;
;807:
;808:	if ( s1 == NULL ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $323
line 809
;809:		if ( s2 == NULL )
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $325
line 810
;810:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $322
JUMPV
LABELV $325
line 812
;811:		else
;812:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $322
JUMPV
LABELV $323
line 813
;813:	} else if ( s2 == NULL )
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $327
line 814
;814:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $322
JUMPV
LABELV $327
LABELV $329
line 816
;815:	
;816:	do {
line 817
;817:		c1 = *s1; s1++;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 818
;818:		c2 = *s2; s2++;
ADDRLP4 4
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 820
;819:
;820:		if ( !n-- ) {
ADDRLP4 8
ADDRFP4 8
INDIRI4
ASGNI4
ADDRFP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $332
line 821
;821:			return 0; // strings are equal until end point
CNSTI4 0
RETI4
ADDRGP4 $322
JUMPV
LABELV $332
line 824
;822:		}
;823:		
;824:		if ( c1 != c2 ) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $334
line 825
;825:			if (c1 >= 'a' && c1 <= 'z') {
ADDRLP4 0
INDIRI4
CNSTI4 97
LTI4 $336
ADDRLP4 0
INDIRI4
CNSTI4 122
GTI4 $336
line 826
;826:				c1 -= ('a' - 'A');
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 32
SUBI4
ASGNI4
line 827
;827:			}
LABELV $336
line 828
;828:			if (c2 >= 'a' && c2 <= 'z') {
ADDRLP4 4
INDIRI4
CNSTI4 97
LTI4 $338
ADDRLP4 4
INDIRI4
CNSTI4 122
GTI4 $338
line 829
;829:				c2 -= ('a' - 'A');
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 32
SUBI4
ASGNI4
line 830
;830:			}
LABELV $338
line 831
;831:			if (c1 != c2) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $340
line 832
;832:				return c1 < c2 ? -1 : 1;
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $343
ADDRLP4 20
CNSTI4 -1
ASGNI4
ADDRGP4 $344
JUMPV
LABELV $343
ADDRLP4 20
CNSTI4 1
ASGNI4
LABELV $344
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $322
JUMPV
LABELV $340
line 834
;833:			}
;834:		}
LABELV $334
line 835
;835:	} while (c1);
LABELV $330
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $329
line 837
;836:	
;837:	return 0;		// strings are equal
CNSTI4 0
RETI4
LABELV $322
endproc Q_stricmpn 24 0
export Q_strncmp
proc Q_strncmp 16 0
line 841
;838:}
;839:
;840:
;841:int Q_strncmp( const char *s1, const char *s2, int n ) {
LABELV $346
line 844
;842:	int		c1, c2;
;843:	
;844:	do {
line 845
;845:		c1 = *s1; s1++;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 846
;846:		c2 = *s2; s2++;
ADDRLP4 4
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 848
;847:
;848:		if (!n--) {
ADDRLP4 8
ADDRFP4 8
INDIRI4
ASGNI4
ADDRFP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $349
line 849
;849:			return 0;		// strings are equal until end point
CNSTI4 0
RETI4
ADDRGP4 $345
JUMPV
LABELV $349
line 852
;850:		}
;851:		
;852:		if (c1 != c2) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $351
line 853
;853:			return c1 < c2 ? -1 : 1;
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $354
ADDRLP4 12
CNSTI4 -1
ASGNI4
ADDRGP4 $355
JUMPV
LABELV $354
ADDRLP4 12
CNSTI4 1
ASGNI4
LABELV $355
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $345
JUMPV
LABELV $351
line 855
;854:		}
;855:	} while (c1);
LABELV $347
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $346
line 857
;856:	
;857:	return 0;		// strings are equal
CNSTI4 0
RETI4
LABELV $345
endproc Q_strncmp 16 0
export Q_stricmp
proc Q_stricmp 16 0
line 862
;858:}
;859:
;860:
;861:int Q_stricmp( const char *s1, const char *s2 ) 
;862:{
line 865
;863:	unsigned char c1, c2;
;864:
;865:	if ( s1 == NULL ) 
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $357
line 866
;866:	{
line 867
;867:		if ( s2 == NULL )
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $359
line 868
;868:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $356
JUMPV
LABELV $359
line 870
;869:		else
;870:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $356
JUMPV
LABELV $357
line 872
;871:	}
;872:	else if ( s2 == NULL )
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $361
line 873
;873:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $356
JUMPV
LABELV $361
LABELV $363
line 876
;874:	
;875:	do 
;876:	{
line 877
;877:		c1 = *s1; s1++;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CVIU4 4
CVUU1 4
ASGNU1
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 878
;878:		c2 = *s2; s2++;
ADDRLP4 1
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
CVIU4 4
CVUU1 4
ASGNU1
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 880
;879:
;880:		if ( c1 != c2 ) 
ADDRLP4 0
INDIRU1
CVUI4 1
ADDRLP4 1
INDIRU1
CVUI4 1
EQI4 $366
line 881
;881:		{
line 882
;882:			if ( c1 <= 'Z' && c1 >= 'A' )
ADDRLP4 4
ADDRLP4 0
INDIRU1
CVUI4 1
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 90
GTI4 $368
ADDRLP4 4
INDIRI4
CNSTI4 65
LTI4 $368
line 883
;883:				c1 += ('a' - 'A');
ADDRLP4 0
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 32
ADDI4
CVIU4 4
CVUU1 4
ASGNU1
LABELV $368
line 885
;884:
;885:			if ( c2 <= 'Z' && c2 >= 'A' )
ADDRLP4 8
ADDRLP4 1
INDIRU1
CVUI4 1
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 90
GTI4 $370
ADDRLP4 8
INDIRI4
CNSTI4 65
LTI4 $370
line 886
;886:				c2 += ('a' - 'A');
ADDRLP4 1
ADDRLP4 1
INDIRU1
CVUI4 1
CNSTI4 32
ADDI4
CVIU4 4
CVUU1 4
ASGNU1
LABELV $370
line 888
;887:
;888:			if ( c1 != c2 ) 
ADDRLP4 0
INDIRU1
CVUI4 1
ADDRLP4 1
INDIRU1
CVUI4 1
EQI4 $372
line 889
;889:				return c1 < c2 ? -1 : 1;
ADDRLP4 0
INDIRU1
CVUI4 1
ADDRLP4 1
INDIRU1
CVUI4 1
GEI4 $375
ADDRLP4 12
CNSTI4 -1
ASGNI4
ADDRGP4 $376
JUMPV
LABELV $375
ADDRLP4 12
CNSTI4 1
ASGNI4
LABELV $376
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $356
JUMPV
LABELV $372
line 890
;890:		}
LABELV $366
line 891
;891:	}
LABELV $364
line 892
;892:	while ( c1 != '\0' );
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 0
NEI4 $363
line 894
;893:
;894:	return 0;
CNSTI4 0
RETI4
LABELV $356
endproc Q_stricmp 16 0
export Q_strlwr
proc Q_strlwr 12 4
line 899
;895:}
;896:
;897:
;898:char *Q_strlwr( char *s1 ) 
;899:{
line 902
;900:    char	*s;
;901:
;902:    s = s1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $379
JUMPV
LABELV $378
line 903
;903:	while ( *s ) {
line 904
;904:		*s = tolower(*s);
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8
ADDRGP4 tolower
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
CVII1 4
ASGNI1
line 905
;905:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 906
;906:	}
LABELV $379
line 903
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $378
line 907
;907:    return s1;
ADDRFP4 0
INDIRP4
RETP4
LABELV $377
endproc Q_strlwr 12 4
export Q_strupr
proc Q_strupr 12 4
line 911
;908:}
;909:
;910:
;911:char *Q_strupr( char *s1 ) {
line 914
;912:    char	*s;
;913:
;914:    s = s1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $383
JUMPV
LABELV $382
line 915
;915:	while ( *s ) {
line 916
;916:		*s = toupper(*s);
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8
ADDRGP4 toupper
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
CVII1 4
ASGNI1
line 917
;917:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 918
;918:	}
LABELV $383
line 915
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $382
line 919
;919:    return s1;
ADDRFP4 0
INDIRP4
RETP4
LABELV $381
endproc Q_strupr 12 4
export Q_strcat
proc Q_strcat 12 12
line 924
;920:}
;921:
;922:
;923:// never goes past bounds or leaves without a terminating 0
;924:void Q_strcat( char *dest, int size, const char *src ) {
line 927
;925:	int		l1;
;926:
;927:	l1 = strlen( dest );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 928
;928:	if ( l1 >= size ) {
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $386
line 929
;929:		Com_Error( ERR_FATAL, "Q_strcat: already overflowed" );
CNSTI4 0
ARGI4
ADDRGP4 $388
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 930
;930:	}
LABELV $386
line 931
;931:	Q_strncpyz( dest + l1, src, size - l1 );
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 932
;932:}
LABELV $385
endproc Q_strcat 12 12
export Q_PrintStrlen
proc Q_PrintStrlen 12 0
line 935
;933:
;934:
;935:int Q_PrintStrlen( const char *string ) {
line 939
;936:	int			len;
;937:	const char	*p;
;938:
;939:	if( !string ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $390
line 940
;940:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $389
JUMPV
LABELV $390
line 943
;941:	}
;942:
;943:	len = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 944
;944:	p = string;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $393
JUMPV
LABELV $392
line 945
;945:	while( *p ) {
line 946
;946:		if( Q_IsColorString( p ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $395
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $395
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $395
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 94
EQI4 $395
line 947
;947:			p += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 948
;948:			continue;
ADDRGP4 $393
JUMPV
LABELV $395
line 950
;949:		}
;950:		p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 951
;951:		len++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 952
;952:	}
LABELV $393
line 945
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $392
line 954
;953:
;954:	return len;
ADDRLP4 4
INDIRI4
RETI4
LABELV $389
endproc Q_PrintStrlen 12 0
export Q_CleanStr
proc Q_CleanStr 20 0
line 958
;955:}
;956:
;957:
;958:char *Q_CleanStr( char *string ) {
line 963
;959:	char*	d;
;960:	char*	s;
;961:	int		c;
;962:
;963:	s = string;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 964
;964:	d = string;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $399
JUMPV
LABELV $398
line 965
;965:	while ((c = *s) != '\0' ) {
line 966
;966:		if ( Q_IsColorString( s ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $401
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $401
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $401
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 94
EQI4 $401
line 967
;967:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 968
;968:		}
ADDRGP4 $402
JUMPV
LABELV $401
line 969
;969:		else if ( c >= ' ' && c <= '~' ) {
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $403
ADDRLP4 4
INDIRI4
CNSTI4 126
GTI4 $403
line 970
;970:			*d = c; d++;
ADDRLP4 8
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
ADDRLP4 8
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 971
;971:		}
LABELV $403
LABELV $402
line 972
;972:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 973
;973:	}
LABELV $399
line 965
ADDRLP4 12
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $398
line 974
;974:	*d = '\0';
ADDRLP4 8
INDIRP4
CNSTI1 0
ASGNI1
line 976
;975:
;976:	return string;
ADDRFP4 0
INDIRP4
RETP4
LABELV $397
endproc Q_CleanStr 20 0
export Com_sprintf
proc Com_sprintf 12 16
line 980
;977:}
;978:
;979:
;980:int QDECL Com_sprintf( char *dest, int size, const char *fmt, ... ) {
line 984
;981:	va_list argptr;
;982:	int len;
;983:
;984:	va_start( argptr, fmt );
ADDRLP4 4
ADDRFP4 8+4
ASGNP4
line 985
;985:	len = ED_vsprintf( dest, fmt, argptr );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 ED_vsprintf
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 986
;986:	va_end( argptr );
ADDRLP4 4
CNSTP4 0
ASGNP4
line 988
;987:
;988:	if ( len >= size ) {
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $407
line 989
;989:		Com_Error( ERR_FATAL, "Com_sprintf: overflow of %i in %i\n", len, size );
CNSTI4 0
ARGI4
ADDRGP4 $409
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 Com_Error
CALLV
pop
line 990
;990:	}
LABELV $407
line 992
;991:
;992:	return len;
ADDRLP4 0
INDIRI4
RETI4
LABELV $405
endproc Com_sprintf 12 16
bss
align 1
LABELV $411
skip 64000
data
align 4
LABELV $412
byte 4 0
export va
code
proc va 12 12
line 1006
;993:}
;994:
;995:
;996:/*
;997:============
;998:va
;999:
;1000:does a varargs printf into a temp buffer, so I don't need to have
;1001:varargs versions of all text functions.
;1002:FIXME: make this buffer size safe someday
;1003:============
;1004:*/
;1005:char * QDECL va( const char *format, ... ) 
;1006:{
line 1012
;1007:	va_list		argptr;
;1008:	static char		string[2][32000];	// in case va is called by nested functions
;1009:	static int		index = 0;
;1010:	char	*buf;
;1011:
;1012:	buf = string[ index ];
ADDRLP4 4
ADDRGP4 $412
INDIRI4
CNSTI4 32000
MULI4
ADDRGP4 $411
ADDP4
ASGNP4
line 1013
;1013:	index ^= 1;
ADDRLP4 8
ADDRGP4 $412
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 1015
;1014:
;1015:	va_start( argptr, format );
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 1016
;1016:	ED_vsprintf( buf, format, argptr );
ADDRLP4 4
INDIRP4
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
line 1017
;1017:	va_end( argptr );
ADDRLP4 0
CNSTP4 0
ASGNP4
line 1019
;1018:
;1019:	return buf;
ADDRLP4 4
INDIRP4
RETP4
LABELV $410
endproc va 12 12
proc Q_strkey 12 0
line 1033
;1020:}
;1021:
;1022:
;1023:/*
;1024:=====================================================================
;1025:
;1026:  INFO STRINGS
;1027:
;1028:=====================================================================
;1029:*/
;1030:
;1031:
;1032:static qboolean Q_strkey( const char *str, const char *key, int key_len )
;1033:{
line 1036
;1034:	int i;
;1035:
;1036:	for ( i = 0; i < key_len; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $418
JUMPV
LABELV $415
line 1037
;1037:	{
line 1038
;1038:		if ( locase[ (byte)str[i] ] != locase[ (byte)key[i] ] )
ADDRLP4 8
ADDRGP4 locase
ASGNP4
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CVIU4 4
CVUU1 4
CVUI4 1
ADDRLP4 8
INDIRP4
ADDP4
INDIRU1
CVUI4 1
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CVIU4 4
CVUU1 4
CVUI4 1
ADDRLP4 8
INDIRP4
ADDP4
INDIRU1
CVUI4 1
EQI4 $419
line 1039
;1039:		{
line 1040
;1040:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $414
JUMPV
LABELV $419
line 1042
;1041:		}
;1042:	}
LABELV $416
line 1036
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $418
ADDRLP4 0
INDIRI4
ADDRFP4 8
INDIRI4
LTI4 $415
line 1044
;1043:
;1044:	return qtrue;
CNSTI4 1
RETI4
LABELV $414
endproc Q_strkey 12 0
bss
align 1
LABELV $422
skip 16384
data
align 4
LABELV $423
byte 4 0
export Info_ValueForKey
code
proc Info_ValueForKey 52 12
line 1056
;1045:}
;1046:
;1047:
;1048:/*
;1049:===============
;1050:Info_ValueForKey
;1051:
;1052:Searches the string for the given
;1053:key and returns the associated value, or an empty string.
;1054:===============
;1055:*/
;1056:char *Info_ValueForKey( const char *s, const char *key ) {
line 1064
;1057:	static	char value[2][BIG_INFO_VALUE];	// use two buffers so compares
;1058:											// work without stomping on each other
;1059:	static	int	valueindex = 0;
;1060:	const char *v, *pkey;
;1061:	char	*o, *o2;
;1062:	int		klen, len;
;1063:
;1064:	if ( !s || !key || !*key )
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $427
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $427
ADDRLP4 24
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $424
LABELV $427
line 1065
;1065:		return "";
ADDRGP4 $428
RETP4
ADDRGP4 $421
JUMPV
LABELV $424
line 1067
;1066:
;1067:	klen = (int)strlen( key );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 28
INDIRI4
ASGNI4
line 1069
;1068:
;1069:	if ( *s == '\\' )
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $432
line 1070
;1070:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $432
JUMPV
LABELV $431
line 1073
;1071:
;1072:	while (1)
;1073:	{
line 1074
;1074:		pkey = s;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $435
JUMPV
LABELV $434
line 1076
;1075:		while ( *s != '\\' )
;1076:		{
line 1077
;1077:			if ( *s == '\0' )
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $437
line 1078
;1078:				return "";
ADDRGP4 $428
RETP4
ADDRGP4 $421
JUMPV
LABELV $437
line 1079
;1079:			++s;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1080
;1080:		}
LABELV $435
line 1075
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $434
line 1081
;1081:		len = (int)(s - pkey);
ADDRLP4 16
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
ASGNI4
line 1082
;1082:		s++; // skip '\\'
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1084
;1083:
;1084:		v = s;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $440
JUMPV
LABELV $439
line 1086
;1085:		while ( *s != '\\' && *s !='\0' )
;1086:			s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $440
line 1085
ADDRLP4 32
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 92
EQI4 $442
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $439
LABELV $442
line 1088
;1087:
;1088:		if ( len == klen && Q_strkey( pkey, key, klen ) )
ADDRLP4 16
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $443
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 Q_strkey
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $443
line 1089
;1089:		{
line 1090
;1090:			o = o2 = value[ valueindex ];
ADDRLP4 44
ADDRGP4 $423
INDIRI4
CNSTI4 13
LSHI4
ADDRGP4 $422
ADDP4
ASGNP4
ADDRLP4 20
ADDRLP4 44
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 44
INDIRP4
ASGNP4
line 1091
;1091:			valueindex ^= 1;
ADDRLP4 48
ADDRGP4 $423
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 1092
;1092:			if ( (int)(s - v) >= BIG_INFO_STRING )
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 8192
LTI4 $449
line 1093
;1093:			{
line 1094
;1094:				Com_Error( ERR_DROP, "Info_ValueForKey: oversize infostring value" );
CNSTI4 1
ARGI4
ADDRGP4 $447
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1095
;1095:			}
ADDRGP4 $446
JUMPV
line 1097
;1096:			else 
;1097:			{
LABELV $448
line 1099
;1098:				while ( v < s )
;1099:				{
line 1100
;1100:					*o = *v;
ADDRLP4 4
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI1
ASGNI1
line 1101
;1101:					++o; ++v;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1102
;1102:				}
LABELV $449
line 1098
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
LTU4 $448
line 1103
;1103:			}
LABELV $446
line 1104
;1104:			*o = '\0';
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 1105
;1105:			return o2;
ADDRLP4 20
INDIRP4
RETP4
ADDRGP4 $421
JUMPV
LABELV $443
line 1108
;1106:		}
;1107:
;1108:		if ( *s == '\0' )
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $451
line 1109
;1109:			break;
ADDRGP4 $433
JUMPV
LABELV $451
line 1111
;1110:
;1111:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1112
;1112:	}
LABELV $432
line 1072
ADDRGP4 $431
JUMPV
LABELV $433
line 1114
;1113:
;1114:	return "";
ADDRGP4 $428
RETP4
LABELV $421
endproc Info_ValueForKey 52 12
export Info_NextPair
proc Info_NextPair 16 0
line 1125
;1115:}
;1116:
;1117:
;1118:/*
;1119:===================
;1120:Info_NextPair
;1121:
;1122:Used to itterate through all the key/value pairs in an info string
;1123:===================
;1124:*/
;1125:void Info_NextPair( const char **head, char *key, char *value ) {
line 1129
;1126:	char	*o;
;1127:	const char	*s;
;1128:
;1129:	s = *head;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 1131
;1130:
;1131:	if ( *s == '\\' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $454
line 1132
;1132:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1133
;1133:	}
LABELV $454
line 1134
;1134:	key[0] = '\0';
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 1135
;1135:	value[0] = '\0';
ADDRFP4 8
INDIRP4
CNSTI1 0
ASGNI1
line 1137
;1136:
;1137:	o = key;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRGP4 $457
JUMPV
LABELV $456
line 1138
;1138:	while ( *s != '\\' ) {
line 1139
;1139:		if ( !*s ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $459
line 1140
;1140:			*o = '\0';
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 1141
;1141:			*head = s;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1142
;1142:			return;
ADDRGP4 $453
JUMPV
LABELV $459
line 1144
;1143:		}
;1144:		*o++ = *s++;
ADDRLP4 8
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI1
ASGNI1
line 1145
;1145:	}
LABELV $457
line 1138
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $456
line 1146
;1146:	*o = '\0';
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 1147
;1147:	s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1149
;1148:
;1149:	o = value;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $462
JUMPV
LABELV $461
line 1150
;1150:	while ( *s != '\\' && *s ) {
line 1151
;1151:		*o++ = *s++;
ADDRLP4 8
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI1
ASGNI1
line 1152
;1152:	}
LABELV $462
line 1150
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 92
EQI4 $464
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $461
LABELV $464
line 1153
;1153:	*o = '\0';
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 1155
;1154:
;1155:	*head = s;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1156
;1156:}
LABELV $453
endproc Info_NextPair 16 0
proc Info_RemoveKey 36 12
line 1164
;1157:
;1158:
;1159:/*
;1160:===================
;1161:Info_RemoveKey
;1162:===================
;1163:*/
;1164:static int Info_RemoveKey( char *s, const char *key ) {
line 1169
;1165:	char	*start;
;1166:	char 	*pkey;
;1167:	int		key_len, len;
;1168:
;1169:	key_len = (int) strlen( key );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
ADDRGP4 $467
JUMPV
LABELV $466
line 1172
;1170:
;1171:	while ( 1 )
;1172:	{
line 1173
;1173:		start = s;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
line 1174
;1174:		if ( *s == '\\' )
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $469
line 1175
;1175:			s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $469
line 1176
;1176:		pkey = s;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $472
JUMPV
LABELV $471
line 1178
;1177:		while ( *s != '\\' )
;1178:		{
line 1179
;1179:			if ( *s == '\0' )
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $474
line 1180
;1180:				return 0;
CNSTI4 0
RETI4
ADDRGP4 $465
JUMPV
LABELV $474
line 1181
;1181:			++s;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1182
;1182:		}
LABELV $472
line 1177
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $471
line 1184
;1183:
;1184:		len = (int)(s - pkey);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
ASGNI4
line 1185
;1185:		++s; // skip '\\'
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $477
JUMPV
LABELV $476
line 1188
;1186:
;1187:		while ( *s != '\\' && *s != '\0' )
;1188:			++s;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $477
line 1187
ADDRLP4 20
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 92
EQI4 $479
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $476
LABELV $479
line 1190
;1189:
;1190:		if ( len == key_len && Q_strkey( pkey, key, key_len ) )
ADDRLP4 12
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $480
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 Q_strkey
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $480
line 1191
;1191:		{
line 1192
;1192:			memmove( start, s, strlen( s ) + 1 ); // remove this part
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 1193
;1193:			return (int)(s - start);
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
RETI4
ADDRGP4 $465
JUMPV
LABELV $480
line 1196
;1194:		}
;1195:
;1196:		if ( *s == '\0' )
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $482
line 1197
;1197:			break;
ADDRGP4 $468
JUMPV
LABELV $482
line 1198
;1198:	}
LABELV $467
line 1171
ADDRGP4 $466
JUMPV
LABELV $468
line 1200
;1199:
;1200:	return 0;
CNSTI4 0
RETI4
LABELV $465
endproc Info_RemoveKey 36 12
export Info_Validate
proc Info_Validate 8 0
line 1213
;1201:}
;1202:
;1203:
;1204:/*
;1205:==================
;1206:Info_ValidateKeyValue
;1207:
;1208:Some characters are illegal in info strings because they
;1209:can mess up the server's parsing
;1210:==================
;1211:*/
;1212:qboolean Info_Validate( const char *s )
;1213:{
line 1214
;1214:	for ( ;; )
LABELV $485
line 1215
;1215:	{
line 1216
;1216:		switch ( *s )
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 34
EQI4 $493
ADDRLP4 0
INDIRI4
CNSTI4 34
GTI4 $495
LABELV $494
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $492
ADDRGP4 $489
JUMPV
LABELV $495
ADDRLP4 0
INDIRI4
CNSTI4 59
EQI4 $493
ADDRGP4 $489
JUMPV
line 1217
;1217:		{
LABELV $492
line 1219
;1218:		case '\0':
;1219:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $484
JUMPV
LABELV $493
line 1222
;1220:		case '\"':
;1221:		case ';':
;1222:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $484
JUMPV
LABELV $489
line 1224
;1223:		default:
;1224:			++s;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1225
;1225:			continue;
line 1214
ADDRGP4 $485
JUMPV
LABELV $484
endproc Info_Validate 8 0
export Info_ValidateKeyValue
proc Info_ValidateKeyValue 12 0
line 1237
;1226:		}
;1227:	}
;1228:}
;1229:
;1230:
;1231:/*
;1232:==================
;1233:Info_ValidateKeyValue
;1234:==================
;1235:*/
;1236:qboolean Info_ValidateKeyValue( const char *s )
;1237:{
line 1238
;1238:	for ( ;; )
LABELV $497
line 1239
;1239:	{
line 1240
;1240:		switch ( *s )
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 34
EQI4 $505
ADDRLP4 0
INDIRI4
CNSTI4 34
GTI4 $507
LABELV $506
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $504
ADDRGP4 $501
JUMPV
LABELV $507
ADDRLP4 0
INDIRI4
CNSTI4 59
EQI4 $505
ADDRLP4 0
INDIRI4
CNSTI4 59
LTI4 $501
LABELV $508
ADDRLP4 0
INDIRI4
CNSTI4 92
EQI4 $505
ADDRGP4 $501
JUMPV
line 1241
;1241:		{
LABELV $504
line 1243
;1242:		case '\0':
;1243:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $496
JUMPV
LABELV $505
line 1247
;1244:		case '\\':
;1245:		case '\"':
;1246:		case ';':
;1247:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $496
JUMPV
LABELV $501
line 1249
;1248:		default:
;1249:			++s;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1250
;1250:			continue;
line 1238
ADDRGP4 $497
JUMPV
LABELV $496
endproc Info_ValidateKeyValue 12 0
export Info_SetValueForKey
proc Info_SetValueForKey 1060 20
line 1263
;1251:		}
;1252:	}
;1253:}
;1254:
;1255:
;1256:/*
;1257:==================
;1258:Info_SetValueForKey
;1259:
;1260:Changes or adds a key/value pair
;1261:==================
;1262:*/
;1263:qboolean Info_SetValueForKey( char *s, const char *key, const char *value ) {
line 1267
;1264:	char	newi[MAX_INFO_STRING+2];
;1265:	int		len1, len2;
;1266:
;1267:	len1 = (int)strlen( s );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1036
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1036
INDIRI4
ASGNI4
line 1268
;1268:	if ( len1 >= MAX_INFO_STRING ) {
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $510
line 1269
;1269:		Com_Error( ERR_DROP, "Info_SetValueForKey: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $512
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1270
;1270:	}
LABELV $510
line 1272
;1271:
;1272:	if ( !Info_ValidateKeyValue( key ) || *key == '\0' ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1040
ADDRGP4 Info_ValidateKeyValue
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
EQI4 $515
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $513
LABELV $515
line 1273
;1273:		Com_Printf( S_COLOR_YELLOW "Invalid key name: '%s'\n", key );
ADDRGP4 $516
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1274
;1274:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $509
JUMPV
LABELV $513
line 1277
;1275:	}
;1276:
;1277:	if ( !Info_ValidateKeyValue( value ) ) {
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1044
ADDRGP4 Info_ValidateKeyValue
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $517
line 1278
;1278:		Com_Printf( S_COLOR_YELLOW "Invalid value name: '%s'\n", value );
ADDRGP4 $519
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1279
;1279:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $509
JUMPV
LABELV $517
line 1282
;1280:	}
;1281:
;1282:	len1 -= Info_RemoveKey( s, key );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1048
ADDRGP4 Info_RemoveKey
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 1048
INDIRI4
SUBI4
ASGNI4
line 1283
;1283:	if ( !value || !*value )
ADDRLP4 1052
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 1052
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $522
ADDRLP4 1052
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $520
LABELV $522
line 1284
;1284:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $509
JUMPV
LABELV $520
line 1286
;1285:
;1286:	len2 = Com_sprintf( newi, sizeof( newi ), "\\%s\\%s", key, value );
ADDRLP4 4
ARGP4
CNSTI4 1026
ARGI4
ADDRGP4 $523
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1056
ADDRGP4 Com_sprintf
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 1056
INDIRI4
ASGNI4
line 1288
;1287:	
;1288:	if ( len1 + len2 >= MAX_INFO_STRING )
ADDRLP4 0
INDIRI4
ADDRLP4 1032
INDIRI4
ADDI4
CNSTI4 1024
LTI4 $524
line 1289
;1289:	{
line 1290
;1290:		Com_Printf( S_COLOR_YELLOW "Info string length exceeded\n" );
ADDRGP4 $526
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1291
;1291:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $509
JUMPV
LABELV $524
line 1294
;1292:	}
;1293:
;1294:	strcpy( s + len1, newi );
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1295
;1295:	return qtrue;
CNSTI4 1
RETI4
LABELV $509
endproc Info_SetValueForKey 1060 20
export Info_SetValueForKey_Big
proc Info_SetValueForKey_Big 8228 20
line 1306
;1296:}
;1297:
;1298:
;1299:/*
;1300:==================
;1301:Info_SetValueForKey_Big
;1302:
;1303:Changes or adds a key/value pair
;1304:==================
;1305:*/
;1306:qboolean Info_SetValueForKey_Big( char *s, const char *key, const char *value ) {
line 1310
;1307:	char	newi[BIG_INFO_STRING+2];
;1308:	int		len1, len2;
;1309:
;1310:	len1 = (int)strlen( s );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8204
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8204
INDIRI4
ASGNI4
line 1311
;1311:	if ( len1 >= BIG_INFO_STRING ) {
ADDRLP4 0
INDIRI4
CNSTI4 8192
LTI4 $528
line 1312
;1312:		Com_Error( ERR_DROP, "Info_SetValueForKey: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $512
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1313
;1313:	}
LABELV $528
line 1315
;1314:
;1315:	if ( !Info_ValidateKeyValue( key ) || *key == '\0' ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8208
ADDRGP4 Info_ValidateKeyValue
CALLI4
ASGNI4
ADDRLP4 8208
INDIRI4
CNSTI4 0
EQI4 $532
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $530
LABELV $532
line 1316
;1316:		Com_Printf( S_COLOR_YELLOW "Invalid key name: '%s'\n", key );
ADDRGP4 $516
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1317
;1317:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $527
JUMPV
LABELV $530
line 1320
;1318:	}
;1319:
;1320:	if ( !Info_ValidateKeyValue( value ) ) {
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8212
ADDRGP4 Info_ValidateKeyValue
CALLI4
ASGNI4
ADDRLP4 8212
INDIRI4
CNSTI4 0
NEI4 $533
line 1321
;1321:		Com_Printf( S_COLOR_YELLOW "Invalid value name: '%s'\n", value );
ADDRGP4 $519
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1322
;1322:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $527
JUMPV
LABELV $533
line 1325
;1323:	}
;1324:
;1325:	len1 -= Info_RemoveKey( s, key );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8216
ADDRGP4 Info_RemoveKey
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 8216
INDIRI4
SUBI4
ASGNI4
line 1326
;1326:	if ( !value || !*value )
ADDRLP4 8220
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 8220
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $537
ADDRLP4 8220
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $535
LABELV $537
line 1327
;1327:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $527
JUMPV
LABELV $535
line 1329
;1328:
;1329:	len2 = Com_sprintf( newi, sizeof( newi ), "\\%s\\%s", key, value );
ADDRLP4 4
ARGP4
CNSTI4 8194
ARGI4
ADDRGP4 $523
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8224
ADDRGP4 Com_sprintf
CALLI4
ASGNI4
ADDRLP4 8200
ADDRLP4 8224
INDIRI4
ASGNI4
line 1331
;1330:
;1331:	if ( len1 + len2 >= BIG_INFO_STRING )
ADDRLP4 0
INDIRI4
ADDRLP4 8200
INDIRI4
ADDI4
CNSTI4 8192
LTI4 $538
line 1332
;1332:	{
line 1333
;1333:		Com_Printf( S_COLOR_YELLOW "BIG Info string length exceeded\n" );
ADDRGP4 $540
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1334
;1334:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $527
JUMPV
LABELV $538
line 1337
;1335:	}
;1336:
;1337:	strcpy( s + len1, newi );
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1338
;1338:	return qtrue;
CNSTI4 1
RETI4
LABELV $527
endproc Info_SetValueForKey_Big 8228 20
bss
align 4
LABELV is_separator
skip 1024
align 4
LABELV com_tokenline
skip 4
align 4
LABELV com_lines
skip 4
align 1
LABELV com_parsename
skip 1024
align 1
LABELV com_token
skip 1024
import Com_Printf
import Com_Error
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
LABELV $540
byte 1 94
byte 1 51
byte 1 66
byte 1 73
byte 1 71
byte 1 32
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
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
LABELV $526
byte 1 94
byte 1 51
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
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
LABELV $523
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $519
byte 1 94
byte 1 51
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 10
byte 1 0
align 1
LABELV $516
byte 1 94
byte 1 51
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 10
byte 1 0
align 1
LABELV $512
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 83
byte 1 101
byte 1 116
byte 1 86
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 70
byte 1 111
byte 1 114
byte 1 75
byte 1 101
byte 1 121
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $447
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 86
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 70
byte 1 111
byte 1 114
byte 1 75
byte 1 101
byte 1 121
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $428
byte 1 0
align 1
LABELV $409
byte 1 67
byte 1 111
byte 1 109
byte 1 95
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 102
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $388
byte 1 81
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 99
byte 1 97
byte 1 116
byte 1 58
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $321
byte 1 81
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 110
byte 1 99
byte 1 112
byte 1 121
byte 1 122
byte 1 58
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 60
byte 1 32
byte 1 49
byte 1 0
align 1
LABELV $318
byte 1 81
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 110
byte 1 99
byte 1 112
byte 1 121
byte 1 122
byte 1 58
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 115
byte 1 114
byte 1 99
byte 1 0
align 1
LABELV $315
byte 1 81
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 110
byte 1 99
byte 1 112
byte 1 121
byte 1 122
byte 1 58
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $279
byte 1 41
byte 1 0
align 1
LABELV $274
byte 1 40
byte 1 0
align 1
LABELV $158
byte 1 77
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 84
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 33
byte 1 61
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $62
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $58
byte 1 69
byte 1 82
byte 1 82
byte 1 79
byte 1 82
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $50
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $48
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 0
