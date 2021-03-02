export DeathmatchScoreboardMessage
code
proc DeathmatchScoreboardMessage 1344 64
file "..\..\..\..\code\game\g_cmds.c"
line 11
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "g_local.h"
;4:
;5:/*
;6:==================
;7:DeathmatchScoreboardMessage
;8:
;9:==================
;10:*/
;11:void DeathmatchScoreboardMessage( gentity_t *ent ) {
line 20
;12:	char		entry[256]; // enough to hold 14 integers
;13:	char		string[MAX_STRING_CHARS-1];
;14:	int			stringlength;
;15:	int			i, j, ping, prefix;
;16:	gclient_t	*cl;
;17:	int			numSorted, scoreFlags, accuracy, perfect;
;18:
;19:	// send the latest information on all clients
;20:	string[0] = '\0';
ADDRLP4 16
CNSTI1 0
ASGNI1
line 21
;21:	stringlength = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 22
;22:	scoreFlags = 0;
ADDRLP4 1316
CNSTI4 0
ASGNI4
line 24
;23:
;24:	numSorted = level.numConnectedClients;
ADDRLP4 1308
ADDRGP4 level+76
INDIRI4
ASGNI4
line 27
;25:
;26:	// estimate prefix length to avoid oversize of final string
;27:	prefix = BG_sprintf( entry, "scores %i %i %i", level.teamScores[TEAM_RED], level.teamScores[TEAM_BLUE], numSorted );
ADDRLP4 1039
ARGP4
ADDRGP4 $57
ARGP4
ADDRGP4 level+48+4
INDIRI4
ARGI4
ADDRGP4 level+48+8
INDIRI4
ARGI4
ADDRLP4 1308
INDIRI4
ARGI4
ADDRLP4 1320
ADDRGP4 BG_sprintf
CALLI4
ASGNI4
ADDRLP4 1312
ADDRLP4 1320
INDIRI4
ASGNI4
line 29
;28:	
;29:	for ( i = 0 ; i < numSorted ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $65
JUMPV
LABELV $62
line 31
;30:
;31:		cl = &level.clients[level.sortedClients[i]];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+88
ADDP4
INDIRI4
CNSTI4 1636
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 33
;32:
;33:		if ( cl->pers.connected == CON_CONNECTING ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 1
NEI4 $67
line 34
;34:			ping = -1;
ADDRLP4 1296
CNSTI4 -1
ASGNI4
line 35
;35:		} else {
ADDRGP4 $68
JUMPV
LABELV $67
line 36
;36:			ping = cl->ps.ping < 999 ? cl->ps.ping : 999;
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
CNSTI4 999
GEI4 $70
ADDRLP4 1324
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $71
JUMPV
LABELV $70
ADDRLP4 1324
CNSTI4 999
ASGNI4
LABELV $71
ADDRLP4 1296
ADDRLP4 1324
INDIRI4
ASGNI4
line 37
;37:		}
LABELV $68
line 39
;38:
;39:		if( cl->accuracy_shots ) {
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRI4
CNSTI4 0
EQI4 $72
line 40
;40:			accuracy = cl->accuracy_hits * 100 / cl->accuracy_shots;
ADDRLP4 1300
ADDRLP4 0
INDIRP4
CNSTI4 724
ADDP4
INDIRI4
CNSTI4 100
MULI4
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRI4
DIVI4
ASGNI4
line 41
;41:		} else {
ADDRGP4 $73
JUMPV
LABELV $72
line 42
;42:			accuracy = 0;
ADDRLP4 1300
CNSTI4 0
ASGNI4
line 43
;43:		}
LABELV $73
line 45
;44:
;45:		perfect = ( cl->ps.persistant[PERS_RANK] == 0 && cl->ps.persistant[PERS_KILLED] == 0 ) ? 1 : 0;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 0
NEI4 $75
ADDRLP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 0
NEI4 $75
ADDRLP4 1324
CNSTI4 1
ASGNI4
ADDRGP4 $76
JUMPV
LABELV $75
ADDRLP4 1324
CNSTI4 0
ASGNI4
LABELV $76
ADDRLP4 1304
ADDRLP4 1324
INDIRI4
ASGNI4
line 47
;46:
;47:		j = BG_sprintf( entry, " %i %i %i %i %i %i %i %i %i %i %i %i %i %i",
ADDRLP4 1039
ARGP4
ADDRGP4 $77
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+88
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ARGI4
ADDRLP4 1296
INDIRI4
ARGI4
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
INDIRI4
SUBI4
CNSTI4 60000
DIVI4
ARGI4
ADDRLP4 1316
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+88
ADDP4
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities+188
ADDP4
INDIRI4
ARGI4
ADDRLP4 1300
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 300
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ARGI4
ADDRLP4 1304
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ARGI4
ADDRLP4 1340
ADDRGP4 BG_sprintf
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 1340
INDIRI4
ASGNI4
line 63
;48:			level.sortedClients[i],
;49:			cl->ps.persistant[PERS_SCORE],
;50:			ping,
;51:			(level.time - cl->pers.enterTime)/60000,
;52:			scoreFlags,
;53:			g_entities[level.sortedClients[i]].s.powerups,
;54:			accuracy, 
;55:			cl->ps.persistant[PERS_IMPRESSIVE_COUNT],
;56:			cl->ps.persistant[PERS_EXCELLENT_COUNT],
;57:			cl->ps.persistant[PERS_GAUNTLET_FRAG_COUNT], 
;58:			cl->ps.persistant[PERS_DEFEND_COUNT], 
;59:			cl->ps.persistant[PERS_ASSIST_COUNT], 
;60:			perfect,
;61:			cl->ps.persistant[PERS_CAPTURES]);
;62:
;63:		if ( stringlength + j + prefix >= sizeof( string ) )
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ADDRLP4 1312
INDIRI4
ADDI4
CVIU4 4
CNSTU4 1023
LTU4 $82
line 64
;64:			break;
ADDRGP4 $64
JUMPV
LABELV $82
line 66
;65:
;66:		strcpy( string + stringlength, entry );
ADDRLP4 8
INDIRI4
ADDRLP4 16
ADDP4
ARGP4
ADDRLP4 1039
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 67
;67:		stringlength += j;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 68
;68:	}
LABELV $63
line 29
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $65
ADDRLP4 4
INDIRI4
ADDRLP4 1308
INDIRI4
LTI4 $62
LABELV $64
line 70
;69:
;70:	trap_SendServerCommand( ent-g_entities, va( "scores %i %i %i%s", i,
ADDRGP4 $84
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 level+48+4
INDIRI4
ARGI4
ADDRGP4 level+48+8
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRLP4 1324
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRLP4 1324
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 73
;71:		level.teamScores[TEAM_RED], level.teamScores[TEAM_BLUE],
;72:		string ) );
;73:}
LABELV $55
endproc DeathmatchScoreboardMessage 1344 64
export Cmd_Score_f
proc Cmd_Score_f 0 4
line 83
;74:
;75:
;76:/*
;77:==================
;78:Cmd_Score_f
;79:
;80:Request current scoreboard information
;81:==================
;82:*/
;83:void Cmd_Score_f( gentity_t *ent ) {
line 84
;84:	DeathmatchScoreboardMessage( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 DeathmatchScoreboardMessage
CALLV
pop
line 85
;85:}
LABELV $89
endproc Cmd_Score_f 0 4
export CheatsOk
proc CheatsOk 0 8
line 93
;86:
;87:
;88:/*
;89:==================
;90:CheatsOk
;91:==================
;92:*/
;93:qboolean	CheatsOk( gentity_t *ent ) {
line 94
;94:	if ( !g_cheats.integer ) {
ADDRGP4 g_cheats+12
INDIRI4
CNSTI4 0
NEI4 $91
line 95
;95:		trap_SendServerCommand( ent-g_entities, "print \"Cheats are not enabled on this server.\n\"");
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRGP4 $94
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 96
;96:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $90
JUMPV
LABELV $91
line 98
;97:	}
;98:	if ( ent->health <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 0
GTI4 $95
line 99
;99:		trap_SendServerCommand( ent-g_entities, "print \"You must be alive to use this command.\n\"");
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRGP4 $97
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 100
;100:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $90
JUMPV
LABELV $95
line 102
;101:	}
;102:	return qtrue;
CNSTI4 1
RETI4
LABELV $90
endproc CheatsOk 0 8
bss
align 1
LABELV $99
skip 1024
export ConcatArgs
code
proc ConcatArgs 1048 12
line 111
;103:}
;104:
;105:
;106:/*
;107:==================
;108:ConcatArgs
;109:==================
;110:*/
;111:char *ConcatArgs( int start ) {
line 117
;112:	static char line[MAX_STRING_CHARS];
;113:	char	arg[MAX_STRING_CHARS];
;114:	int		i, c, tlen;
;115:	int		len;
;116:
;117:	len = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 118
;118:	c = trap_Argc();
ADDRLP4 1040
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 1040
INDIRI4
ASGNI4
line 119
;119:	for ( i = start ; i < c ; i++ ) {
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRGP4 $103
JUMPV
LABELV $100
line 120
;120:		trap_Argv( i, arg, sizeof( arg ) );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 121
;121:		tlen = (int)strlen( arg );
ADDRLP4 8
ARGP4
ADDRLP4 1044
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 1044
INDIRI4
ASGNI4
line 122
;122:		if ( len + tlen >= sizeof( line )-1 ) {
ADDRLP4 0
INDIRI4
ADDRLP4 1032
INDIRI4
ADDI4
CVIU4 4
CNSTU4 1023
LTU4 $104
line 123
;123:			break;
ADDRGP4 $102
JUMPV
LABELV $104
line 125
;124:		}
;125:		memcpy( line + len, arg, tlen );
ADDRLP4 0
INDIRI4
ADDRGP4 $99
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 1032
INDIRI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 126
;126:		len += tlen;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 1032
INDIRI4
ADDI4
ASGNI4
line 127
;127:		if ( i != c - 1 ) {
ADDRLP4 4
INDIRI4
ADDRLP4 1036
INDIRI4
CNSTI4 1
SUBI4
EQI4 $106
line 128
;128:			line[len] = ' ';
ADDRLP4 0
INDIRI4
ADDRGP4 $99
ADDP4
CNSTI1 32
ASGNI1
line 129
;129:			len++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 130
;130:		}
LABELV $106
line 131
;131:	}
LABELV $101
line 119
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $103
ADDRLP4 4
INDIRI4
ADDRLP4 1036
INDIRI4
LTI4 $100
LABELV $102
line 133
;132:
;133:	line[len] = '\0';
ADDRLP4 0
INDIRI4
ADDRGP4 $99
ADDP4
CNSTI1 0
ASGNI1
line 135
;134:
;135:	return line;
ADDRGP4 $99
RETP4
LABELV $98
endproc ConcatArgs 1048 12
export SanitizeString
proc SanitizeString 4 4
line 146
;136:}
;137:
;138:
;139:/*
;140:==================
;141:SanitizeString
;142:
;143:Remove case and control characters
;144:==================
;145:*/
;146:void SanitizeString( const char *in, char *out ) {
ADDRGP4 $110
JUMPV
LABELV $109
line 147
;147:	while ( *in ) {
line 148
;148:		if ( *in == 27 ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 27
NEI4 $112
line 149
;149:			in += 2;		// skip color code
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 150
;150:			continue;
ADDRGP4 $110
JUMPV
LABELV $112
line 152
;151:		}
;152:		if ( *in < ' ' ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
GEI4 $114
line 153
;153:			in++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 154
;154:			continue;
ADDRGP4 $110
JUMPV
LABELV $114
line 156
;155:		}
;156:		*out = tolower( *in );
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 0
ADDRGP4 tolower
CALLI4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
CVII1 4
ASGNI1
line 157
;157:		out++;
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 158
;158:		in++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 159
;159:	}
LABELV $110
line 147
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $109
line 161
;160:
;161:	*out = '\0';
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 162
;162:}
LABELV $108
endproc SanitizeString 4 4
export ClientNumberFromString
proc ClientNumberFromString 2068 8
line 173
;163:
;164:
;165:/*
;166:==================
;167:ClientNumberFromString
;168:
;169:Returns a player number for either a number or name string
;170:Returns -1 if invalid
;171:==================
;172:*/
;173:int ClientNumberFromString( gentity_t *to, char *s ) {
line 180
;174:	gclient_t	*cl;
;175:	int			idnum;
;176:	char		s2[MAX_STRING_CHARS];
;177:	char		n2[MAX_STRING_CHARS];
;178:
;179:	// numeric values are just slot numbers
;180:	if (s[0] >= '0' && s[0] <= '9') {
ADDRLP4 2056
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 48
LTI4 $117
ADDRLP4 2056
INDIRI4
CNSTI4 57
GTI4 $117
line 181
;181:		idnum = atoi( s );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 2060
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 2060
INDIRI4
ASGNI4
line 182
;182:		if ( (unsigned) idnum >= (unsigned)level.maxclients ) {
ADDRLP4 4
INDIRI4
CVIU4 4
ADDRGP4 level+24
INDIRI4
CVIU4 4
LTU4 $119
line 183
;183:			trap_SendServerCommand( to-g_entities, va("print \"Bad client slot: %i\n\"", idnum));
ADDRGP4 $122
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 2064
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRLP4 2064
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 184
;184:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $116
JUMPV
LABELV $119
line 187
;185:		}
;186:
;187:		cl = &level.clients[idnum];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1636
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 188
;188:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $123
line 189
;189:			trap_SendServerCommand( to-g_entities, va("print \"Client %i is not active\n\"", idnum));
ADDRGP4 $125
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 2064
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRLP4 2064
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 190
;190:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $116
JUMPV
LABELV $123
line 192
;191:		}
;192:		return idnum;
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $116
JUMPV
LABELV $117
line 196
;193:	}
;194:
;195:	// check for a name match
;196:	SanitizeString( s, s2 );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1032
ARGP4
ADDRGP4 SanitizeString
CALLV
pop
line 197
;197:	for ( idnum=0,cl=level.clients ; idnum < level.maxclients ; idnum++,cl++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 level
INDIRP4
ASGNP4
ADDRGP4 $129
JUMPV
LABELV $126
line 198
;198:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $131
line 199
;199:			continue;
ADDRGP4 $127
JUMPV
LABELV $131
line 201
;200:		}
;201:		SanitizeString( cl->pers.netname, n2 );
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 SanitizeString
CALLV
pop
line 202
;202:		if ( !strcmp( n2, s2 ) ) {
ADDRLP4 8
ARGP4
ADDRLP4 1032
ARGP4
ADDRLP4 2060
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2060
INDIRI4
CNSTI4 0
NEI4 $133
line 203
;203:			return idnum;
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $116
JUMPV
LABELV $133
line 205
;204:		}
;205:	}
LABELV $127
line 197
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1636
ADDP4
ASGNP4
LABELV $129
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $126
line 207
;206:
;207:	trap_SendServerCommand( to-g_entities, va("print \"User %s is not on the server\n\"", s));
ADDRGP4 $135
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 2060
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRLP4 2060
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 208
;208:	return -1;
CNSTI4 -1
RETI4
LABELV $116
endproc ClientNumberFromString 2068 8
export Cmd_Give_f
proc Cmd_Give_f 132 12
line 220
;209:}
;210:
;211:
;212:/*
;213:==================
;214:Cmd_Give_f
;215:
;216:Give items to a client
;217:==================
;218:*/
;219:void Cmd_Give_f( gentity_t *ent )
;220:{
line 228
;221:	char		*name;
;222:	gitem_t		*it;
;223:	int			i;
;224:	qboolean	give_all;
;225:	gentity_t	*it_ent;
;226:	trace_t		trace;
;227:
;228:	if ( !CheatsOk( ent ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $137
line 229
;229:		return;
ADDRGP4 $136
JUMPV
LABELV $137
line 232
;230:	}
;231:
;232:	name = ConcatArgs( 1 );
CNSTI4 1
ARGI4
ADDRLP4 80
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 80
INDIRP4
ASGNP4
line 234
;233:
;234:	if (Q_stricmp(name, "all") == 0)
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $141
ARGP4
ADDRLP4 84
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
NEI4 $139
line 235
;235:		give_all = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $140
JUMPV
LABELV $139
line 237
;236:	else
;237:		give_all = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $140
line 239
;238:
;239:	if (give_all || Q_stricmp( name, "health") == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $145
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $144
ARGP4
ADDRLP4 88
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $142
LABELV $145
line 240
;240:	{
line 241
;241:		ent->health = ent->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 92
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ASGNI4
line 242
;242:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $146
line 243
;243:			return;
ADDRGP4 $136
JUMPV
LABELV $146
line 244
;244:	}
LABELV $142
line 246
;245:
;246:	if (give_all || Q_stricmp(name, "weapons") == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $151
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $150
ARGP4
ADDRLP4 92
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $148
LABELV $151
line 247
;247:	{
line 248
;248:		ent->client->ps.stats[STAT_WEAPONS] = (1 << WP_NUM_WEAPONS) - 1 - 
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 15358
ASGNI4
line 250
;249:			( 1 << WP_GRAPPLING_HOOK ) - ( 1 << WP_NONE );
;250:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $152
line 251
;251:			return;
ADDRGP4 $136
JUMPV
LABELV $152
line 252
;252:	}
LABELV $148
line 254
;253:
;254:	if (give_all || Q_stricmp(name, "ammo") == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $157
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $156
ARGP4
ADDRLP4 96
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
NEI4 $154
LABELV $157
line 255
;255:	{
line 256
;256:		for ( i = 0 ; i < MAX_WEAPONS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $158
line 257
;257:			ent->client->ps.ammo[i] = 999;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
CNSTI4 999
ASGNI4
line 258
;258:		}
LABELV $159
line 256
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $158
line 259
;259:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $162
line 260
;260:			return;
ADDRGP4 $136
JUMPV
LABELV $162
line 261
;261:	}
LABELV $154
line 263
;262:
;263:	if (give_all || Q_stricmp(name, "armor") == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $167
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $166
ARGP4
ADDRLP4 100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
NEI4 $164
LABELV $167
line 264
;264:	{
line 265
;265:		ent->client->ps.stats[STAT_ARMOR] = 200;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 200
ASGNI4
line 267
;266:
;267:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $168
line 268
;268:			return;
ADDRGP4 $136
JUMPV
LABELV $168
line 269
;269:	}
LABELV $164
line 271
;270:
;271:	if (Q_stricmp(name, "excellent") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $172
ARGP4
ADDRLP4 104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
NEI4 $170
line 272
;272:		ent->client->ps.persistant[PERS_EXCELLENT_COUNT]++;
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 288
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 273
;273:		return;
ADDRGP4 $136
JUMPV
LABELV $170
line 275
;274:	}
;275:	if (Q_stricmp(name, "impressive") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $175
ARGP4
ADDRLP4 108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $173
line 276
;276:		ent->client->ps.persistant[PERS_IMPRESSIVE_COUNT]++;
ADDRLP4 112
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 284
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 277
;277:		return;
ADDRGP4 $136
JUMPV
LABELV $173
line 279
;278:	}
;279:	if (Q_stricmp(name, "gauntletaward") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $178
ARGP4
ADDRLP4 112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
NEI4 $176
line 280
;280:		ent->client->ps.persistant[PERS_GAUNTLET_FRAG_COUNT]++;
ADDRLP4 116
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 300
ADDP4
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 281
;281:		return;
ADDRGP4 $136
JUMPV
LABELV $176
line 283
;282:	}
;283:	if (Q_stricmp(name, "defend") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $181
ARGP4
ADDRLP4 116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
NEI4 $179
line 284
;284:		ent->client->ps.persistant[PERS_DEFEND_COUNT]++;
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 292
ADDP4
ASGNP4
ADDRLP4 120
INDIRP4
ADDRLP4 120
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 285
;285:		return;
ADDRGP4 $136
JUMPV
LABELV $179
line 287
;286:	}
;287:	if (Q_stricmp(name, "assist") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $184
ARGP4
ADDRLP4 120
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 0
NEI4 $182
line 288
;288:		ent->client->ps.persistant[PERS_ASSIST_COUNT]++;
ADDRLP4 124
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 296
ADDP4
ASGNP4
ADDRLP4 124
INDIRP4
ADDRLP4 124
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 289
;289:		return;
ADDRGP4 $136
JUMPV
LABELV $182
line 293
;290:	}
;291:
;292:	// spawn a specific item right on the player
;293:	if ( !give_all ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $185
line 294
;294:		it = BG_FindItem (name);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 124
ADDRGP4 BG_FindItem
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 124
INDIRP4
ASGNP4
line 295
;295:		if (!it) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $187
line 296
;296:			return;
ADDRGP4 $136
JUMPV
LABELV $187
line 299
;297:		}
;298:
;299:		it_ent = G_Spawn();
ADDRLP4 128
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 128
INDIRP4
ASGNP4
line 300
;300:		VectorCopy( ent->r.currentOrigin, it_ent->s.origin );
ADDRLP4 12
INDIRP4
CNSTI4 92
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 301
;301:		it_ent->classname = it->classname;
ADDRLP4 12
INDIRP4
CNSTI4 524
ADDP4
ADDRLP4 16
INDIRP4
INDIRP4
ASGNP4
line 302
;302:		G_SpawnItem (it_ent, it);
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 G_SpawnItem
CALLV
pop
line 303
;303:		FinishSpawningItem(it_ent );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 FinishSpawningItem
CALLV
pop
line 304
;304:		memset( &trace, 0, sizeof( trace ) );
ADDRLP4 20
ARGP4
CNSTI4 0
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 memset
CALLP4
pop
line 305
;305:		Touch_Item (it_ent, ent, &trace);
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 Touch_Item
CALLV
pop
line 306
;306:		if (it_ent->inuse) {
ADDRLP4 12
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $189
line 307
;307:			G_FreeEntity( it_ent );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 308
;308:		}
LABELV $189
line 309
;309:	}
LABELV $185
line 310
;310:}
LABELV $136
endproc Cmd_Give_f 132 12
export Cmd_God_f
proc Cmd_God_f 16 8
line 323
;311:
;312:
;313:/*
;314:==================
;315:Cmd_God_f
;316:
;317:Sets client to godmode
;318:
;319:argv(0) god
;320:==================
;321:*/
;322:void Cmd_God_f( gentity_t *ent )
;323:{
line 326
;324:	const char *msg;
;325:
;326:	if ( !CheatsOk( ent ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $192
line 327
;327:		return;
ADDRGP4 $191
JUMPV
LABELV $192
line 330
;328:	}
;329:
;330:	ent->flags ^= FL_GODMODE;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 16
BXORI4
ASGNI4
line 331
;331:	if (!(ent->flags & FL_GODMODE) )
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $194
line 332
;332:		msg = "godmode OFF\n";
ADDRLP4 0
ADDRGP4 $196
ASGNP4
ADDRGP4 $195
JUMPV
LABELV $194
line 334
;333:	else
;334:		msg = "godmode ON\n";
ADDRLP4 0
ADDRGP4 $197
ASGNP4
LABELV $195
line 336
;335:
;336:	trap_SendServerCommand( ent-g_entities, va( "print \"%s\"", msg ) );
ADDRGP4 $198
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 337
;337:}
LABELV $191
endproc Cmd_God_f 16 8
export Cmd_Notarget_f
proc Cmd_Notarget_f 16 8
line 349
;338:
;339:
;340:/*
;341:==================
;342:Cmd_Notarget_f
;343:
;344:Sets client to notarget
;345:
;346:argv(0) notarget
;347:==================
;348:*/
;349:void Cmd_Notarget_f( gentity_t *ent ) {
line 352
;350:	const char *msg;
;351:
;352:	if ( !CheatsOk( ent ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $200
line 353
;353:		return;
ADDRGP4 $199
JUMPV
LABELV $200
line 356
;354:	}
;355:
;356:	ent->flags ^= FL_NOTARGET;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32
BXORI4
ASGNI4
line 357
;357:	if (!(ent->flags & FL_NOTARGET) )
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $202
line 358
;358:		msg = "notarget OFF\n";
ADDRLP4 0
ADDRGP4 $204
ASGNP4
ADDRGP4 $203
JUMPV
LABELV $202
line 360
;359:	else
;360:		msg = "notarget ON\n";
ADDRLP4 0
ADDRGP4 $205
ASGNP4
LABELV $203
line 362
;361:
;362:	trap_SendServerCommand( ent-g_entities, va( "print \"%s\"", msg ) );
ADDRGP4 $198
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 363
;363:}
LABELV $199
endproc Cmd_Notarget_f 16 8
export Cmd_Noclip_f
proc Cmd_Noclip_f 20 8
line 373
;364:
;365:
;366:/*
;367:==================
;368:Cmd_Noclip_f
;369:
;370:argv(0) noclip
;371:==================
;372:*/
;373:void Cmd_Noclip_f( gentity_t *ent ) {
line 376
;374:	const char *msg;
;375:
;376:	if ( !CheatsOk( ent ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $207
line 377
;377:		return;
ADDRGP4 $206
JUMPV
LABELV $207
line 380
;378:	}
;379:
;380:	if ( ent->client->noclip ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
CNSTI4 0
EQI4 $209
line 381
;381:		msg = "noclip OFF\n";
ADDRLP4 0
ADDRGP4 $211
ASGNP4
line 382
;382:	} else {
ADDRGP4 $210
JUMPV
LABELV $209
line 383
;383:		msg = "noclip ON\n";
ADDRLP4 0
ADDRGP4 $212
ASGNP4
line 384
;384:	}
LABELV $210
line 385
;385:	ent->client->noclip = !ent->client->noclip;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
CNSTI4 0
NEI4 $214
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $215
JUMPV
LABELV $214
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $215
ADDRLP4 12
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 656
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 387
;386:
;387:	trap_SendServerCommand( ent-g_entities, va("print \"%s\"", msg));
ADDRGP4 $198
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 388
;388:}
LABELV $206
endproc Cmd_Noclip_f 20 8
export Cmd_LevelShot_f
proc Cmd_LevelShot_f 4 8
line 401
;389:
;390:
;391:/*
;392:==================
;393:Cmd_LevelShot_f
;394:
;395:This is just to help generate the level pictures
;396:for the menus.  It goes to the intermission immediately
;397:and sends over a command to the client to resize the view,
;398:hide the scoreboard, and take a special screenshot
;399:==================
;400:*/
;401:void Cmd_LevelShot_f( gentity_t *ent ) {
line 402
;402:	if ( !CheatsOk( ent ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $217
line 403
;403:		return;
ADDRGP4 $216
JUMPV
LABELV $217
line 407
;404:	}
;405:
;406:	// doesn't work in single player
;407:	if ( g_gametype.integer == GT_CAMPAIGN ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
NEI4 $219
line 408
;408:		trap_SendServerCommand( ent-g_entities, 
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRGP4 $222
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 410
;409:			"print \"Must be in g_gametype 0 for levelshot\n\"" );
;410:		return;
ADDRGP4 $216
JUMPV
LABELV $219
line 413
;411:	}
;412:
;413:	if ( !ent->client->pers.localClient )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
CNSTI4 0
NEI4 $223
line 414
;414:	{
line 415
;415:		trap_SendServerCommand( ent - g_entities,
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRGP4 $225
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 417
;416:			"print \"The levelshot command must be executed by a local client\n\"" );
;417:		return;
ADDRGP4 $216
JUMPV
LABELV $223
line 420
;418:	}
;419:
;420:	BeginIntermission();
ADDRGP4 BeginIntermission
CALLV
pop
line 421
;421:	trap_SendServerCommand( ent-g_entities, "clientLevelShot" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRGP4 $226
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 422
;422:}
LABELV $216
endproc Cmd_LevelShot_f 4 8
export Cmd_TeamTask_f
proc Cmd_TeamTask_f 2068 12
line 430
;423:
;424:
;425:/*
;426:==================
;427:Cmd_TeamTask_f
;428:==================
;429:*/
;430:void Cmd_TeamTask_f( gentity_t *ent ) {
line 434
;431:	char userinfo[MAX_INFO_STRING];
;432:	char arg[MAX_TOKEN_CHARS];
;433:	int task;
;434:	int client = ent->client - level.clients;
ADDRLP4 1024
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1636
DIVI4
ASGNI4
line 436
;435:
;436:	if ( trap_Argc() != 2 ) {
ADDRLP4 2056
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 2
EQI4 $228
line 437
;437:		return;
ADDRGP4 $227
JUMPV
LABELV $228
line 439
;438:	}
;439:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 440
;440:	task = atoi( arg );
ADDRLP4 1028
ARGP4
ADDRLP4 2060
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2052
ADDRLP4 2060
INDIRI4
ASGNI4
line 442
;441:
;442:	trap_GetUserinfo( client, userinfo, sizeof( userinfo ) );
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 443
;443:	Info_SetValueForKey( userinfo, "teamtask", va( "%d", task ) );
ADDRGP4 $231
ARGP4
ADDRLP4 2052
INDIRI4
ARGI4
ADDRLP4 2064
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRGP4 $230
ARGP4
ADDRLP4 2064
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 444
;444:	trap_SetUserinfo( client, userinfo );
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 445
;445:	ClientUserinfoChanged( client );
ADDRLP4 1024
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLI4
pop
line 446
;446:}
LABELV $227
endproc Cmd_TeamTask_f 2068 12
export Cmd_Kill_f
proc Cmd_Kill_f 16 20
line 454
;447:
;448:
;449:/*
;450:=================
;451:Cmd_Kill_f
;452:=================
;453:*/
;454:void Cmd_Kill_f( gentity_t *ent ) {
line 455
;455:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
NEI4 $233
line 456
;456:		return;
ADDRGP4 $232
JUMPV
LABELV $233
line 458
;457:	}
;458:	if (ent->health <= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 0
GTI4 $235
line 459
;459:		return;
ADDRGP4 $232
JUMPV
LABELV $235
line 461
;460:	}
;461:	ent->flags &= ~FL_GODMODE;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 462
;462:	ent->client->ps.stats[STAT_HEALTH] = ent->health = -999;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 -999
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 463
;463:	player_die (ent, ent, ent, 100000, MOD_SUICIDE);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 100000
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 player_die
CALLV
pop
line 464
;464:}
LABELV $232
endproc Cmd_Kill_f 16 20
export BroadcastTeamChange
proc BroadcastTeamChange 8 8
line 475
;465:
;466:
;467:/*
;468:=================
;469:BroadcastTeamChange
;470:
;471:Let everyone know about a team change
;472:=================
;473:*/
;474:void BroadcastTeamChange( gclient_t *client, team_t oldTeam )
;475:{
line 476
;476:	int clientNum = client - level.clients;
ADDRLP4 0
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
ASGNI4
line 478
;477:
;478:	if ( client->sess.sessionTeam == TEAM_RED ) {
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 1
NEI4 $238
line 479
;479:		G_BroadcastServerCommand( clientNum, va("cp \"%s" S_COLOR_WHITE " joined the " S_COLOR_RED "red" S_COLOR_WHITE " team.\n\"",
ADDRGP4 $240
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 481
;480:			client->pers.netname) );
;481:	} else if ( client->sess.sessionTeam == TEAM_BLUE ) {
ADDRGP4 $239
JUMPV
LABELV $238
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 2
NEI4 $241
line 482
;482:		G_BroadcastServerCommand( clientNum, va("cp \"%s" S_COLOR_WHITE " joined the " S_COLOR_BLUE "blue" S_COLOR_WHITE " team.\n\"",
ADDRGP4 $243
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 484
;483:		client->pers.netname));
;484:	} else if ( client->sess.sessionTeam == TEAM_SPECTATOR && oldTeam != TEAM_SPECTATOR ) {
ADDRGP4 $242
JUMPV
LABELV $241
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
NEI4 $244
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $244
line 485
;485:		G_BroadcastServerCommand( clientNum, va("cp \"%s" S_COLOR_WHITE " joined the spectators.\n\"",
ADDRGP4 $246
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 487
;486:		client->pers.netname));
;487:	} else if ( client->sess.sessionTeam == TEAM_FREE ) {
ADDRGP4 $245
JUMPV
LABELV $244
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 0
NEI4 $247
line 488
;488:		G_BroadcastServerCommand( clientNum, va("cp \"%s" S_COLOR_WHITE " joined the battle.\n\"",
ADDRGP4 $249
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 490
;489:		client->pers.netname));
;490:	}
LABELV $247
LABELV $245
LABELV $242
LABELV $239
line 491
;491:}
LABELV $237
endproc BroadcastTeamChange 8 8
proc AllowTeamSwitch 24 8
line 494
;492:
;493:
;494:static qboolean AllowTeamSwitch( int clientNum, team_t newTeam ) {
line 496
;495:
;496:	if ( g_teamForceBalance.integer  ) {
ADDRGP4 g_teamForceBalance+12
INDIRI4
CNSTI4 0
EQI4 $251
line 499
;497:		int		counts[TEAM_NUM_TEAMS];
;498:
;499:		counts[TEAM_BLUE] = TeamCount( clientNum, TEAM_BLUE );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 16
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 0+8
ADDRLP4 16
INDIRI4
ASGNI4
line 500
;500:		counts[TEAM_RED] = TeamCount( clientNum, TEAM_RED );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 20
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 0+4
ADDRLP4 20
INDIRI4
ASGNI4
line 503
;501:
;502:		// We allow a spread of two
;503:		if ( newTeam == TEAM_RED && counts[TEAM_RED] - counts[TEAM_BLUE] > 1 ) {
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $256
ADDRLP4 0+4
INDIRI4
ADDRLP4 0+8
INDIRI4
SUBI4
CNSTI4 1
LEI4 $256
line 504
;504:			trap_SendServerCommand( clientNum, "cp \"Red team has too many players.\n\"" );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $260
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 505
;505:			return qfalse; // ignore the request
CNSTI4 0
RETI4
ADDRGP4 $250
JUMPV
LABELV $256
line 508
;506:		}
;507:
;508:		if ( newTeam == TEAM_BLUE && counts[TEAM_BLUE] - counts[TEAM_RED] > 1 ) {
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $261
ADDRLP4 0+8
INDIRI4
ADDRLP4 0+4
INDIRI4
SUBI4
CNSTI4 1
LEI4 $261
line 509
;509:			trap_SendServerCommand( clientNum, "cp \"Blue team has too many players.\n\"" );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $265
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 510
;510:			return qfalse; // ignore the request
CNSTI4 0
RETI4
ADDRGP4 $250
JUMPV
LABELV $261
line 514
;511:		}
;512:
;513:		// It's ok, the team we are switching to has less or same number of players
;514:	}
LABELV $251
line 516
;515:
;516:	return qtrue;
CNSTI4 1
RETI4
LABELV $250
endproc AllowTeamSwitch 24 8
export SetTeam
proc SetTeam 76 20
line 525
;517:}
;518:
;519:
;520:/*
;521:=================
;522:SetTeam
;523:=================
;524:*/
;525:qboolean SetTeam( gentity_t *ent, const char *s ) {
line 538
;526:	team_t				team, oldTeam;
;527:	gclient_t			*client;
;528:	int					clientNum;
;529:	spectatorState_t	specState;
;530:	int					specClient;
;531:	int					teamLeader;
;532:	qboolean			checkTeamLeader;
;533:
;534:	//
;535:	// see what change is requested
;536:	//
;537:
;538:	clientNum = ent - g_entities;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ASGNI4
line 539
;539:	client = level.clients + clientNum;
ADDRLP4 0
ADDRLP4 12
INDIRI4
CNSTI4 1636
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 542
;540:
;541:	// early team override
;542:	if ( client->pers.connected == CON_CONNECTING && GTx( g_gametype.integer, GTF_TEAMS ) ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 1
NEI4 $267
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
EQI4 $267
line 543
;543:		if ( !Q_stricmp( s, "red" ) || !Q_stricmp( s, "r" ) ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $273
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $275
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $274
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $271
LABELV $275
line 544
;544:			team = TEAM_RED;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 545
;545:		} else if ( !Q_stricmp( s, "blue" ) || !Q_stricmp( s, "b" ) ) {
ADDRGP4 $272
JUMPV
LABELV $271
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $278
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $280
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $279
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $276
LABELV $280
line 546
;546:			team = TEAM_BLUE; 
ADDRLP4 4
CNSTI4 2
ASGNI4
line 547
;547:		} else {
ADDRGP4 $277
JUMPV
LABELV $276
line 548
;548:			team = -1;
ADDRLP4 4
CNSTI4 -1
ASGNI4
line 549
;549:		}
LABELV $277
LABELV $272
line 550
;550:		if ( team != -1 && AllowTeamSwitch( clientNum, team ) ) {
ADDRLP4 4
INDIRI4
CNSTI4 -1
EQI4 $281
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 AllowTeamSwitch
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $281
line 551
;551:			client->sess.sessionTeam = team;
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 552
;552:			client->pers.teamState.state = TEAM_BEGIN;
ADDRLP4 0
INDIRP4
CNSTI4 552
ADDP4
CNSTI4 0
ASGNI4
line 553
;553:			G_WriteClientSessionData( client );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_WriteClientSessionData
CALLV
pop
line 555
;554:			// count current clients and rank for scoreboard
;555:			CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 556
;556:		}
LABELV $281
line 557
;557:		return qfalse; // bypass flood protection
CNSTI4 0
RETI4
ADDRGP4 $266
JUMPV
LABELV $267
line 560
;558:	}
;559:
;560:	specClient = clientNum;
ADDRLP4 20
ADDRLP4 12
INDIRI4
ASGNI4
line 561
;561:	specState = SPECTATOR_NOT;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 562
;562:	if ( !Q_stricmp( s, "scoreboard" ) || !Q_stricmp( s, "score" )  ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $285
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $287
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $286
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $283
LABELV $287
line 563
;563:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 564
;564:		specState = SPECTATOR_SCOREBOARD;
ADDRLP4 16
CNSTI4 3
ASGNI4
line 565
;565:	} else if ( !Q_stricmp( s, "follow1" ) ) {
ADDRGP4 $284
JUMPV
LABELV $283
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $290
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $288
line 566
;566:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 567
;567:		specState = SPECTATOR_FOLLOW;
ADDRLP4 16
CNSTI4 2
ASGNI4
line 568
;568:		specClient = -1;
ADDRLP4 20
CNSTI4 -1
ASGNI4
line 569
;569:	} else if ( !Q_stricmp( s, "follow2" ) ) {
ADDRGP4 $289
JUMPV
LABELV $288
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $293
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $291
line 570
;570:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 571
;571:		specState = SPECTATOR_FOLLOW;
ADDRLP4 16
CNSTI4 2
ASGNI4
line 572
;572:		specClient = -2;
ADDRLP4 20
CNSTI4 -2
ASGNI4
line 573
;573:	} else if ( !Q_stricmp( s, "spectator" ) || !Q_stricmp( s, "s" ) ) {
ADDRGP4 $292
JUMPV
LABELV $291
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $296
ARGP4
ADDRLP4 48
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $298
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $297
ARGP4
ADDRLP4 52
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $294
LABELV $298
line 574
;574:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 575
;575:		specState = SPECTATOR_FREE;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 576
;576:	} else if ( GTx( g_gametype.integer, GTF_TEAMS ) ) {
ADDRGP4 $295
JUMPV
LABELV $294
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
EQI4 $299
line 578
;577:		// if running a team game, assign player to one of the teams
;578:		specState = SPECTATOR_NOT;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 579
;579:		if ( !Q_stricmp( s, "red" ) || !Q_stricmp( s, "r" ) ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $273
ARGP4
ADDRLP4 56
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $305
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $274
ARGP4
ADDRLP4 60
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
NEI4 $303
LABELV $305
line 580
;580:			team = TEAM_RED;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 581
;581:		} else if ( !Q_stricmp( s, "blue" ) || !Q_stricmp( s, "b" ) ) {
ADDRGP4 $304
JUMPV
LABELV $303
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $278
ARGP4
ADDRLP4 64
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $308
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $279
ARGP4
ADDRLP4 68
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
NEI4 $306
LABELV $308
line 582
;582:			team = TEAM_BLUE;
ADDRLP4 4
CNSTI4 2
ASGNI4
line 583
;583:		} else {
ADDRGP4 $307
JUMPV
LABELV $306
line 585
;584:			// pick the team with the least number of players
;585:			team = PickTeam( clientNum );
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 PickTeam
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 72
INDIRI4
ASGNI4
line 586
;586:		}
LABELV $307
LABELV $304
line 588
;587:
;588:		if ( !AllowTeamSwitch( clientNum, team ) ) {
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 AllowTeamSwitch
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $300
line 589
;589:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $266
JUMPV
line 592
;590:		}
;591:
;592:	} else {
LABELV $299
line 594
;593:		// force them to spectators if there aren't any spots free
;594:		team = TEAM_FREE;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 595
;595:	}
LABELV $300
LABELV $295
LABELV $292
LABELV $289
LABELV $284
line 598
;596:
;597:	// override decision if limiting the players
;598:	if ( (g_gametype.integer == GT_DUEL)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $311
ADDRGP4 level+80
INDIRI4
CNSTI4 2
LTI4 $311
line 599
;599:		&& level.numNonSpectatorClients >= 2 ) {
line 600
;600:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 601
;601:	} else if ( g_maxGameClients.integer > 0 && 
ADDRGP4 $312
JUMPV
LABELV $311
ADDRGP4 g_maxGameClients+12
INDIRI4
CNSTI4 0
LEI4 $315
ADDRGP4 level+80
INDIRI4
ADDRGP4 g_maxGameClients+12
INDIRI4
LTI4 $315
line 602
;602:		level.numNonSpectatorClients >= g_maxGameClients.integer ) {
line 603
;603:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 604
;604:	}
LABELV $315
LABELV $312
line 609
;605:
;606:	//
;607:	// decide if we will allow the change
;608:	//
;609:	oldTeam = client->sess.sessionTeam;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ASGNI4
line 610
;610:	if ( team == oldTeam ) {
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $320
line 611
;611:		if ( team != TEAM_SPECTATOR )
ADDRLP4 4
INDIRI4
CNSTI4 3
EQI4 $322
line 612
;612:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $266
JUMPV
LABELV $322
line 615
;613:
;614:		// do soft release if possible
;615:		if ( ( client->ps.pm_flags & PMF_FOLLOW ) && client->sess.spectatorState == SPECTATOR_FOLLOW ) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $324
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
CNSTI4 2
NEI4 $324
line 616
;616:			StopFollowing( ent, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 StopFollowing
CALLV
pop
line 617
;617:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $266
JUMPV
LABELV $324
line 621
;618:		}
;619:
;620:		// second spectator team request will move player to intermission point
;621:		if ( client->ps.persistant[ PERS_TEAM ] == TEAM_SPECTATOR && !( client->ps.pm_flags & PMF_FOLLOW )
ADDRLP4 0
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 3
NEI4 $326
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $326
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
CNSTI4 1
NEI4 $326
line 622
;622:			&& client->sess.spectatorState == SPECTATOR_FREE ) {
line 623
;623:			VectorCopy( level.intermission_origin, ent->s.origin );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRGP4 level+7616
INDIRB
ASGNB 12
line 624
;624:			VectorCopy( level.intermission_origin, client->ps.origin );
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ADDRGP4 level+7616
INDIRB
ASGNB 12
line 625
;625:			SetClientViewAngle( ent, level.intermission_angle );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 level+7628
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 626
;626:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $266
JUMPV
LABELV $326
line 628
;627:		}
;628:	}
LABELV $320
line 635
;629:
;630:	//
;631:	// execute the team change
;632:	//
;633:
;634:	// if the player was dead leave the body
;635:	if ( ent->health <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 0
GTI4 $331
line 636
;636:		CopyToBodyQue( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CopyToBodyQue
CALLV
pop
line 637
;637:	}
LABELV $331
line 640
;638:
;639:	// he starts at 'base'
;640:	client->pers.teamState.state = TEAM_BEGIN;
ADDRLP4 0
INDIRP4
CNSTI4 552
ADDP4
CNSTI4 0
ASGNI4
line 642
;641:
;642:	if ( oldTeam != TEAM_SPECTATOR ) {
ADDRLP4 8
INDIRI4
CNSTI4 3
EQI4 $333
line 645
;643:		
;644:		// revert any casted votes
;645:		if ( oldTeam != team )
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $335
line 646
;646:			G_RevertVote( ent->client );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_RevertVote
CALLV
pop
LABELV $335
line 649
;647:
;648:		// Kill him (makes sure he loses flags, etc)
;649:		ent->flags &= ~FL_GODMODE;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 650
;650:		ent->client->ps.stats[STAT_HEALTH] = ent->health = 0;
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 64
INDIRI4
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 64
INDIRI4
ASGNI4
line 651
;651:		player_die (ent, ent, ent, 100000, MOD_SUICIDE);
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
CNSTI4 100000
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 player_die
CALLV
pop
line 652
;652:	}
LABELV $333
line 655
;653:
;654:	// they go to the end of the line for tournements
;655:	if ( team == TEAM_SPECTATOR ) {
ADDRLP4 4
INDIRI4
CNSTI4 3
NEI4 $337
line 656
;656:		client->sess.spectatorTime = 0;
ADDRLP4 0
INDIRP4
CNSTI4 628
ADDP4
CNSTI4 0
ASGNI4
line 657
;657:	}
LABELV $337
line 659
;658:
;659:	client->sess.sessionTeam = team;
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 660
;660:	client->sess.spectatorState = specState;
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 661
;661:	client->sess.spectatorClient = specClient;
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 663
;662:
;663:	checkTeamLeader = client->sess.teamLeader;
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRI4
ASGNI4
line 664
;664:	client->sess.teamLeader = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
CNSTI4 0
ASGNI4
line 666
;665:
;666:	if ( team == TEAM_RED || team == TEAM_BLUE ) {
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $341
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $339
LABELV $341
line 667
;667:		teamLeader = TeamLeader( team );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 TeamLeader
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 60
INDIRI4
ASGNI4
line 669
;668:		// if there is no team leader or the team leader is a bot and this client is not a bot
;669:		if ( teamLeader == -1 || ( !(g_entities[clientNum].r.svFlags & SVF_BOT) && (g_entities[teamLeader].r.svFlags & SVF_BOT) ) ) {
ADDRLP4 64
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 -1
EQI4 $348
ADDRLP4 12
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities+208+216
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $342
ADDRLP4 64
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities+208+216
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $342
LABELV $348
line 670
;670:			SetLeader( team, clientNum );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 SetLeader
CALLV
pop
line 671
;671:		}
LABELV $342
line 672
;672:	}
LABELV $339
line 675
;673:
;674:	// make sure there is a team leader on the team the player came from
;675:	if ( oldTeam == TEAM_RED || oldTeam == TEAM_BLUE ) {
ADDRLP4 8
INDIRI4
CNSTI4 1
EQI4 $351
ADDRLP4 8
INDIRI4
CNSTI4 2
NEI4 $349
LABELV $351
line 676
;676:		if ( checkTeamLeader ) {
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $352
line 677
;677:			CheckTeamLeader( oldTeam );
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CheckTeamLeader
CALLV
pop
line 678
;678:		}
LABELV $352
line 679
;679:	}
LABELV $349
line 681
;680:
;681:	G_WriteClientSessionData( client );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_WriteClientSessionData
CALLV
pop
line 683
;682:
;683:	BroadcastTeamChange( client, oldTeam );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 BroadcastTeamChange
CALLV
pop
line 686
;684:
;685:	// get and distribute relevent paramters
;686:	ClientUserinfoChanged( clientNum );
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLI4
pop
line 688
;687:
;688:	ClientBegin( clientNum );
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 690
;689:
;690:	return qtrue;
CNSTI4 1
RETI4
LABELV $266
endproc SetTeam 76 20
export StopFollowing
proc StopFollowing 12 12
line 702
;691:}
;692:
;693:
;694:/*
;695:=================
;696:StopFollowing
;697:
;698:If the client being followed leaves the game, or you just want to drop
;699:to free floating spectator mode
;700:=================
;701:*/
;702:void StopFollowing( gentity_t *ent, qboolean release ) {
line 705
;703:	gclient_t *client;
;704:
;705:	if ( ent->r.svFlags & SVF_BOT || !ent->inuse )
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $357
ADDRLP4 4
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $355
LABELV $357
line 706
;706:		return;
ADDRGP4 $354
JUMPV
LABELV $355
line 708
;707:
;708:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 710
;709:
;710:	client->ps.persistant[ PERS_TEAM ] = TEAM_SPECTATOR;	
ADDRLP4 0
INDIRP4
CNSTI4 260
ADDP4
CNSTI4 3
ASGNI4
line 711
;711:	client->sess.sessionTeam = TEAM_SPECTATOR;	
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 3
ASGNI4
line 712
;712:	if ( release ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $358
line 713
;713:		client->ps.stats[STAT_HEALTH] = ent->health = 1;
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 714
;714:		memset( client->ps.powerups, 0, sizeof ( client->ps.powerups ) );
ADDRLP4 0
INDIRP4
CNSTI4 312
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 64
ARGI4
ADDRGP4 memset
CALLP4
pop
line 715
;715:	}
LABELV $358
line 716
;716:	SetClientViewAngle( ent, client->ps.viewangles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 718
;717:
;718:	client->sess.spectatorState = SPECTATOR_FREE;
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
CNSTI4 1
ASGNI4
line 719
;719:	client->ps.pm_flags &= ~PMF_FOLLOW;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -4097
BANDI4
ASGNI4
line 722
;720:	//ent->r.svFlags &= ~SVF_BOT;
;721:
;722:	client->ps.clientNum = ent - g_entities;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ASGNI4
line 723
;723:}
LABELV $354
endproc StopFollowing 12 12
proc Cmd_Team_f 1036 12
line 731
;724:
;725:
;726:/*
;727:=================
;728:Cmd_Team_f
;729:=================
;730:*/
;731:static void Cmd_Team_f( gentity_t *ent ) {
line 734
;732:	char		s[MAX_TOKEN_CHARS];
;733:
;734:	if ( trap_Argc() != 2 ) {
ADDRLP4 1024
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 2
EQI4 $361
line 735
;735:		switch ( ent->client->sess.sessionTeam ) {
ADDRLP4 1028
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
LTI4 $360
ADDRLP4 1028
INDIRI4
CNSTI4 3
GTI4 $360
ADDRLP4 1028
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $374
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $374
address $370
address $368
address $366
address $372
code
LABELV $366
line 737
;736:		case TEAM_BLUE:
;737:			trap_SendServerCommand( ent-g_entities, "print \"Blue team\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRGP4 $367
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 738
;738:			break;
ADDRGP4 $360
JUMPV
LABELV $368
line 740
;739:		case TEAM_RED:
;740:			trap_SendServerCommand( ent-g_entities, "print \"Red team\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRGP4 $369
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 741
;741:			break;
ADDRGP4 $360
JUMPV
LABELV $370
line 743
;742:		case TEAM_FREE:
;743:			trap_SendServerCommand( ent-g_entities, "print \"Free team\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRGP4 $371
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 744
;744:			break;
ADDRGP4 $360
JUMPV
LABELV $372
line 746
;745:		case TEAM_SPECTATOR:
;746:			trap_SendServerCommand( ent-g_entities, "print \"Spectator team\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRGP4 $373
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 747
;747:			break;
line 749
;748:		default:
;749:			break;
line 751
;750:		}
;751:		return;
ADDRGP4 $360
JUMPV
LABELV $361
line 754
;752:	}
;753:
;754:	if ( ent->client->switchTeamTime > level.time ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 772
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $375
line 755
;755:		trap_SendServerCommand( ent-g_entities, "print \"May not switch teams more than once per 5 seconds.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRGP4 $378
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 756
;756:		return;
ADDRGP4 $360
JUMPV
LABELV $375
line 760
;757:	}
;758:
;759:	// if they are playing a tournement game, count as a loss
;760:	if ( (g_gametype.integer == GT_DUEL )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $379
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 0
NEI4 $379
line 761
;761:		&& ent->client->sess.sessionTeam == TEAM_FREE ) {
line 762
;762:		ent->client->sess.losses++;
ADDRLP4 1028
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 644
ADDP4
ASGNP4
ADDRLP4 1028
INDIRP4
ADDRLP4 1028
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 763
;763:	}
LABELV $379
line 765
;764:
;765:	trap_Argv( 1, s, sizeof( s ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 767
;766:
;767:	if ( SetTeam( ent, s ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1028
ADDRGP4 SetTeam
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
EQI4 $382
line 768
;768:		ent->client->switchTeamTime = level.time + 5000;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 769
;769:	}
LABELV $382
line 770
;770:}
LABELV $360
endproc Cmd_Team_f 1036 12
proc Cmd_Follow_f 1040 12
line 778
;771:
;772:
;773:/*
;774:=================
;775:Cmd_Follow_f
;776:=================
;777:*/
;778:static void Cmd_Follow_f( gentity_t *ent ) {
line 782
;779:	int		i;
;780:	char	arg[MAX_TOKEN_CHARS];
;781:
;782:	if ( trap_Argc() != 2 ) {
ADDRLP4 1028
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
EQI4 $386
line 783
;783:		if ( ent->client->sess.spectatorState == SPECTATOR_FOLLOW ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
CNSTI4 2
NEI4 $385
line 784
;784:			StopFollowing( ent, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 StopFollowing
CALLV
pop
line 785
;785:		}
line 786
;786:		return;
ADDRGP4 $385
JUMPV
LABELV $386
line 789
;787:	}
;788:
;789:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 790
;790:	i = ClientNumberFromString( ent, arg );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1032
ADDRGP4 ClientNumberFromString
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1032
INDIRI4
ASGNI4
line 791
;791:	if ( i == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $390
line 792
;792:		return;
ADDRGP4 $385
JUMPV
LABELV $390
line 796
;793:	}
;794:
;795:	// can't follow self
;796:	if ( &level.clients[ i ] == ent->client ) {
ADDRLP4 0
INDIRI4
CNSTI4 1636
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CVPU4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
NEU4 $392
line 797
;797:		return;
ADDRGP4 $385
JUMPV
LABELV $392
line 801
;798:	}
;799:
;800:	// can't follow another spectator
;801:	if ( level.clients[ i ].sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRI4
CNSTI4 1636
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
NEI4 $394
line 802
;802:		return;
ADDRGP4 $385
JUMPV
LABELV $394
line 806
;803:	}
;804:
;805:	// if they are playing a tournement game, count as a loss
;806:	if ( (g_gametype.integer == GT_DUEL )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $396
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 0
NEI4 $396
line 807
;807:		&& ent->client->sess.sessionTeam == TEAM_FREE ) {
line 808
;808:		ent->client->sess.losses++;
ADDRLP4 1036
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 644
ADDP4
ASGNP4
ADDRLP4 1036
INDIRP4
ADDRLP4 1036
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 809
;809:	}
LABELV $396
line 812
;810:
;811:	// first set them to spectator
;812:	if ( ent->client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
EQI4 $399
line 813
;813:		SetTeam( ent, "spectator" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $296
ARGP4
ADDRGP4 SetTeam
CALLI4
pop
line 814
;814:	}
LABELV $399
line 816
;815:
;816:	ent->client->sess.spectatorState = SPECTATOR_FOLLOW;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 632
ADDP4
CNSTI4 2
ASGNI4
line 817
;817:	ent->client->sess.spectatorClient = i;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 636
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 818
;818:}
LABELV $385
endproc Cmd_Follow_f 1040 12
export Cmd_FollowCycle_f
proc Cmd_FollowCycle_f 16 8
line 826
;819:
;820:
;821:/*
;822:=================
;823:Cmd_FollowCycle_f
;824:=================
;825:*/
;826:void Cmd_FollowCycle_f( gentity_t *ent, int dir ) {
line 832
;827:	int		clientnum;
;828:	int		original;
;829:	gclient_t	*client;
;830:
;831:	// if they are playing a tournement game, count as a loss
;832:	if ( (g_gametype.integer == GT_DUEL )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $402
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 0
NEI4 $402
line 833
;833:		&& ent->client->sess.sessionTeam == TEAM_FREE ) {
line 834
;834:		ent->client->sess.losses++;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 644
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 835
;835:	}
LABELV $402
line 837
;836:
;837:	client = ent->client;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 840
;838:
;839:	// first set them to spectator
;840:	if ( client->sess.spectatorState == SPECTATOR_NOT ) {
ADDRLP4 8
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
CNSTI4 0
NEI4 $405
line 841
;841:		SetTeam( ent, "spectator" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $296
ARGP4
ADDRGP4 SetTeam
CALLI4
pop
line 842
;842:	}
LABELV $405
line 844
;843:
;844:	if ( dir != 1 && dir != -1 ) {
ADDRLP4 12
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
EQI4 $407
ADDRLP4 12
INDIRI4
CNSTI4 -1
EQI4 $407
line 845
;845:		G_Error( "Cmd_FollowCycle_f: bad dir %i", dir );
ADDRGP4 $409
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_Error
CALLV
pop
line 846
;846:	}
LABELV $407
line 848
;847:
;848:	clientnum = client->sess.spectatorClient;
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
ASGNI4
line 849
;849:	original = clientnum;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
LABELV $410
line 850
;850:	do {
line 851
;851:		clientnum += dir;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 852
;852:		if ( clientnum >= level.maxclients ) {
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $413
line 853
;853:			clientnum = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 854
;854:		}
LABELV $413
line 855
;855:		if ( clientnum < 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $416
line 856
;856:			clientnum = level.maxclients - 1;
ADDRLP4 0
ADDRGP4 level+24
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 857
;857:		}
LABELV $416
line 860
;858:
;859:		// can only follow connected clients
;860:		if ( level.clients[ clientnum ].pers.connected != CON_CONNECTED ) {
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
CNSTI4 2
EQI4 $419
line 861
;861:			continue;
ADDRGP4 $411
JUMPV
LABELV $419
line 865
;862:		}
;863:
;864:		// can't follow another spectator
;865:		if ( level.clients[ clientnum ].sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRI4
CNSTI4 1636
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
NEI4 $421
line 866
;866:			continue;
ADDRGP4 $411
JUMPV
LABELV $421
line 870
;867:		}
;868:
;869:		// this is good, we can use it
;870:		ent->client->sess.spectatorClient = clientnum;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 636
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 871
;871:		ent->client->sess.spectatorState = SPECTATOR_FOLLOW;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 632
ADDP4
CNSTI4 2
ASGNI4
line 872
;872:		return;
ADDRGP4 $401
JUMPV
LABELV $411
line 873
;873:	} while ( clientnum != original );
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $410
line 876
;874:
;875:	// leave it where it was
;876:}
LABELV $401
endproc Cmd_FollowCycle_f 16 8
proc G_SayTo 12 28
line 884
;877:
;878:
;879:/*
;880:==================
;881:G_Say
;882:==================
;883:*/
;884:static void G_SayTo( gentity_t *ent, gentity_t *other, int mode, int color, const char *name, const char *message ) {
line 885
;885:	if (!other) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $424
line 886
;886:		return;
ADDRGP4 $423
JUMPV
LABELV $424
line 888
;887:	}
;888:	if (!other->inuse) {
ADDRFP4 4
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $426
line 889
;889:		return;
ADDRGP4 $423
JUMPV
LABELV $426
line 891
;890:	}
;891:	if (!other->client) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $428
line 892
;892:		return;
ADDRGP4 $423
JUMPV
LABELV $428
line 894
;893:	}
;894:	if ( other->client->pers.connected != CON_CONNECTED ) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $430
line 895
;895:		return;
ADDRGP4 $423
JUMPV
LABELV $430
line 897
;896:	}
;897:	if ( mode == SAY_TEAM  && !OnSameTeam(ent, other) ) {
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $432
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $432
line 898
;898:		return;
ADDRGP4 $423
JUMPV
LABELV $432
line 901
;899:	}
;900:	// no chatting to players in tournements
;901:	if ( (g_gametype.integer == GT_DUEL )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $434
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 0
NEI4 $434
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 0
EQI4 $434
line 903
;902:		&& other->client->sess.sessionTeam == TEAM_FREE
;903:		&& ent->client->sess.sessionTeam != TEAM_FREE ) {
line 904
;904:		return;
ADDRGP4 $423
JUMPV
LABELV $434
line 907
;905:	}
;906:
;907:	trap_SendServerCommand( other-g_entities, va( "%s \"%s%c%c%s\" %i", mode == SAY_TEAM ? "tchat" : "chat", 
ADDRGP4 $437
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $441
ADDRLP4 4
ADDRGP4 $438
ASGNP4
ADDRGP4 $442
JUMPV
LABELV $441
ADDRLP4 4
ADDRGP4 $439
ASGNP4
LABELV $442
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
CNSTI4 94
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 909
;908:		name, Q_COLOR_ESCAPE, color, message, ent - g_entities ) );
;909:}
LABELV $423
endproc G_SayTo 12 28
proc G_Say 312 28
line 913
;910:
;911:#define EC		"\x19"
;912:
;913:static void G_Say( gentity_t *ent, gentity_t *target, int mode, const char *chatText ) {
line 922
;914:	int			j;
;915:	gentity_t	*other;
;916:	int			color;
;917:	char		name[64];
;918:	// don't let text be too long for malicious reasons
;919:	char		text[MAX_SAY_TEXT];
;920:	char		location[64];
;921:
;922:	if ( !( GTx( g_gametype.integer, GTF_TEAMS )) && mode == SAY_TEAM ) {
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
NEI4 $444
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $444
line 923
;923:		mode = SAY_ALL;
ADDRFP4 8
CNSTI4 0
ASGNI4
line 924
;924:	}
LABELV $444
line 926
;925:
;926:	switch ( mode ) {
ADDRLP4 292
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
EQI4 $450
ADDRLP4 292
INDIRI4
CNSTI4 1
EQI4 $453
ADDRLP4 292
INDIRI4
CNSTI4 2
EQI4 $459
ADDRGP4 $448
JUMPV
LABELV $448
LABELV $450
line 929
;927:	default:
;928:	case SAY_ALL:
;929:		G_LogPrintf( "say: %s: %s\n", ent->client->pers.netname, chatText );
ADDRGP4 $451
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 930
;930:		Com_sprintf (name, sizeof(name), "%s%c%c"EC": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE );
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $452
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 931
;931:		color = COLOR_GREEN;
ADDRLP4 224
CNSTI4 50
ASGNI4
line 932
;932:		break;
ADDRGP4 $449
JUMPV
LABELV $453
line 934
;933:	case SAY_TEAM:
;934:		G_LogPrintf( "sayteam: %s: %s\n", ent->client->pers.netname, chatText );
ADDRGP4 $454
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 935
;935:		if (Team_GetLocationMsg(ent, location, sizeof(location)))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 228
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 296
ADDRGP4 Team_GetLocationMsg
CALLI4
ASGNI4
ADDRLP4 296
INDIRI4
CNSTI4 0
EQI4 $455
line 936
;936:			Com_sprintf (name, sizeof(name), EC"(%s%c%c"EC") (%s)"EC": ", 
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $457
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRLP4 228
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
ADDRGP4 $456
JUMPV
LABELV $455
line 939
;937:				ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE, location);
;938:		else
;939:			Com_sprintf (name, sizeof(name), EC"(%s%c%c"EC")"EC": ", 
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $458
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
LABELV $456
line 941
;940:				ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE );
;941:		color = COLOR_CYAN;
ADDRLP4 224
CNSTI4 53
ASGNI4
line 942
;942:		break;
ADDRGP4 $449
JUMPV
LABELV $459
line 944
;943:	case SAY_TELL:
;944:		if (target && target->inuse && target->client && GTx( g_gametype.integer, GTF_TEAMS ) &&
ADDRLP4 300
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 300
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $460
ADDRLP4 300
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $460
ADDRLP4 300
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $460
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
EQI4 $460
ADDRLP4 304
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 300
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ADDRLP4 304
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
NEI4 $460
ADDRLP4 304
INDIRP4
ARGP4
ADDRLP4 228
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 308
ADDRGP4 Team_GetLocationMsg
CALLI4
ASGNI4
ADDRLP4 308
INDIRI4
CNSTI4 0
EQI4 $460
line 947
;945:			target->client->sess.sessionTeam == ent->client->sess.sessionTeam &&
;946:			Team_GetLocationMsg(ent, location, sizeof(location)))
;947:			Com_sprintf (name, sizeof(name), EC"[%s%c%c"EC"] (%s)"EC": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE, location );
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $464
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRLP4 228
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
ADDRGP4 $461
JUMPV
LABELV $460
line 949
;948:		else
;949:			Com_sprintf (name, sizeof(name), EC"[%s%c%c"EC"]"EC": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE );
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $465
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
LABELV $461
line 950
;950:		color = COLOR_MAGENTA;
ADDRLP4 224
CNSTI4 54
ASGNI4
line 951
;951:		break;
LABELV $449
line 954
;952:	}
;953:
;954:	Q_strncpyz( text, chatText, sizeof(text) );
ADDRLP4 8
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 150
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 956
;955:
;956:	if ( target ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $466
line 957
;957:		G_SayTo( ent, target, mode, color, name, text );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 224
INDIRI4
ARGI4
ADDRLP4 158
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_SayTo
CALLV
pop
line 958
;958:		return;
ADDRGP4 $443
JUMPV
LABELV $466
line 962
;959:	}
;960:
;961:	// echo the text to the console
;962:	if ( g_dedicated.integer ) {
ADDRGP4 g_dedicated+12
INDIRI4
CNSTI4 0
EQI4 $468
line 963
;963:		G_Printf( "%s%s\n", name, text);
ADDRGP4 $471
ARGP4
ADDRLP4 158
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 964
;964:	}
LABELV $468
line 967
;965:
;966:	// send it to all the apropriate clients
;967:	for (j = 0; j < level.maxclients; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $475
JUMPV
LABELV $472
line 968
;968:		other = &g_entities[j];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 969
;969:		G_SayTo( ent, other, mode, color, name, text );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 224
INDIRI4
ARGI4
ADDRLP4 158
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_SayTo
CALLV
pop
line 970
;970:	}
LABELV $473
line 967
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $475
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $472
line 971
;971:}
LABELV $443
endproc G_Say 312 28
proc Cmd_Say_f 12 16
line 979
;972:
;973:
;974:/*
;975:==================
;976:Cmd_Say_f
;977:==================
;978:*/
;979:static void Cmd_Say_f( gentity_t *ent, int mode, qboolean arg0 ) {
line 982
;980:	char		*p;
;981:
;982:	if ( trap_Argc () < 2 && !arg0 ) {
ADDRLP4 4
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 2
GEI4 $478
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $478
line 983
;983:		return;
ADDRGP4 $477
JUMPV
LABELV $478
line 986
;984:	}
;985:
;986:	if (arg0)
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $480
line 987
;987:	{
line 988
;988:		p = ConcatArgs( 0 );
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 989
;989:	}
ADDRGP4 $481
JUMPV
LABELV $480
line 991
;990:	else
;991:	{
line 992
;992:		p = ConcatArgs( 1 );
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 993
;993:	}
LABELV $481
line 995
;994:
;995:	G_Say( ent, NULL, mode, p );
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 996
;996:}
LABELV $477
endproc Cmd_Say_f 12 16
proc Cmd_Tell_f 1060 16
line 1004
;997:
;998:
;999:/*
;1000:==================
;1001:Cmd_Tell_f
;1002:==================
;1003:*/
;1004:static void Cmd_Tell_f( gentity_t *ent ) {
line 1010
;1005:	int			targetNum;
;1006:	gentity_t	*target;
;1007:	char		*p;
;1008:	char		arg[MAX_TOKEN_CHARS];
;1009:
;1010:	if ( trap_Argc () < 2 ) {
ADDRLP4 1036
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 2
GEI4 $483
line 1011
;1011:		return;
ADDRGP4 $482
JUMPV
LABELV $483
line 1014
;1012:	}
;1013:
;1014:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1015
;1015:	targetNum = atoi( arg );
ADDRLP4 12
ARGP4
ADDRLP4 1040
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 1040
INDIRI4
ASGNI4
line 1016
;1016:	if ( (unsigned)targetNum >= (unsigned)level.maxclients ) {
ADDRLP4 8
INDIRI4
CVIU4 4
ADDRGP4 level+24
INDIRI4
CVIU4 4
LTU4 $485
line 1017
;1017:		return;
ADDRGP4 $482
JUMPV
LABELV $485
line 1020
;1018:	}
;1019:
;1020:	target = &g_entities[targetNum];
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1021
;1021:	if ( !target->inuse || !target->client ) {
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $490
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $488
LABELV $490
line 1022
;1022:		return;
ADDRGP4 $482
JUMPV
LABELV $488
line 1025
;1023:	}
;1024:
;1025:	p = ConcatArgs( 2 );
CNSTI4 2
ARGI4
ADDRLP4 1048
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 1048
INDIRP4
ASGNP4
line 1027
;1026:
;1027:	G_LogPrintf( "tell: %s to %s: %s\n", ent->client->pers.netname, target->client->pers.netname, p );
ADDRGP4 $491
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1028
;1028:	G_Say( ent, target, SAY_TELL, p );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 1031
;1029:	// don't tell to the player self if it was already directed to this player
;1030:	// also don't send the chat back to a bot
;1031:	if ( ent != target && !(ent->r.svFlags & SVF_BOT)) {
ADDRLP4 1052
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1052
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRP4
CVPU4 4
EQU4 $492
ADDRLP4 1052
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $492
line 1032
;1032:		G_Say( ent, ent, SAY_TELL, p );
ADDRLP4 1056
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRLP4 1056
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 1033
;1033:	}
LABELV $492
line 1034
;1034:}
LABELV $482
endproc Cmd_Tell_f 1060 16
data
align 4
LABELV gc_orders
address $494
address $495
address $496
address $497
address $498
address $499
address $500
export Cmd_GameCommand_f
code
proc Cmd_GameCommand_f 1044 16
line 1047
;1035:
;1036:
;1037:static char	*gc_orders[] = {
;1038:	"hold your position",
;1039:	"hold this position",
;1040:	"come here",
;1041:	"cover me",
;1042:	"guard location",
;1043:	"search and destroy",
;1044:	"report"
;1045:};
;1046:
;1047:void Cmd_GameCommand_f( gentity_t *ent ) {
line 1052
;1048:	int		player;
;1049:	int		order;
;1050:	char	str[MAX_TOKEN_CHARS];
;1051:
;1052:	trap_Argv( 1, str, sizeof( str ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1053
;1053:	player = atoi( str );
ADDRLP4 0
ARGP4
ADDRLP4 1032
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 1032
INDIRI4
ASGNI4
line 1054
;1054:	trap_Argv( 2, str, sizeof( str ) );
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1055
;1055:	order = atoi( str );
ADDRLP4 0
ARGP4
ADDRLP4 1036
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1024
ADDRLP4 1036
INDIRI4
ASGNI4
line 1057
;1056:
;1057:	if ( (unsigned)player >= MAX_CLIENTS ) {
ADDRLP4 1028
INDIRI4
CVIU4 4
CNSTU4 64
LTU4 $502
line 1058
;1058:		return;
ADDRGP4 $501
JUMPV
LABELV $502
line 1060
;1059:	}
;1060:	if ( (unsigned) order > ARRAY_LEN( gc_orders ) ) {
ADDRLP4 1024
INDIRI4
CVIU4 4
CNSTU4 7
LEU4 $504
line 1061
;1061:		return;
ADDRGP4 $501
JUMPV
LABELV $504
line 1063
;1062:	}
;1063:	G_Say( ent, &g_entities[player], SAY_TELL, gc_orders[order] );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 1024
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gc_orders
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 1064
;1064:	G_Say( ent, ent, SAY_TELL, gc_orders[order] );
ADDRLP4 1040
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1040
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 1024
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gc_orders
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 1065
;1065:}
LABELV $501
endproc Cmd_GameCommand_f 1044 16
export Cmd_Where_f
proc Cmd_Where_f 8 8
line 1073
;1066:
;1067:
;1068:/*
;1069:==================
;1070:Cmd_Where_f
;1071:==================
;1072:*/
;1073:void Cmd_Where_f( gentity_t *ent ) {
line 1074
;1074:	trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", vtos( ent->s.origin ) ) );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $507
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1075
;1075:}
LABELV $506
endproc Cmd_Where_f 8 8
data
align 4
LABELV voteCommands
address $508
address $509
address $510
address $511
address $512
address $513
address $514
address $515
address $516
address $517
address $518
address $519
code
proc ValidVoteCommand 304 12
line 1101
;1076:
;1077:static const char *voteCommands[] = {
;1078:	"map_restart",
;1079:	"map",
;1080:	"rotate",
;1081:	"nextmap",
;1082:	"kick",
;1083:	"clientkick",
;1084:	"g_gametype",
;1085:	"g_unlagged",
;1086:	"g_warmup",
;1087:	"timelimit",
;1088:	"fraglimit",
;1089:	"capturelimit"
;1090:};
;1091:
;1092:
;1093:/*
;1094:==================
;1095:ValidVoteCommand
;1096:
;1097:Input string can be modified by overwriting gametype number instead of text value, for example
;1098:==================
;1099:*/
;1100:static qboolean ValidVoteCommand( int clientNum, char *command ) 
;1101:{
line 1107
;1102:	char buf[ MAX_CVAR_VALUE_STRING ];
;1103:	char *base;
;1104:	char *s;
;1105:	int	i;
;1106:
;1107:	if ( strchr( command, ';' ) || strchr( command, '\n' ) || strchr( command, '\r' ) )
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 268
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 268
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $524
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 272
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 272
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $524
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 13
ARGI4
ADDRLP4 276
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 276
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $521
LABELV $524
line 1108
;1108:	{
line 1109
;1109:		trap_SendServerCommand( clientNum, "print \"Invalid vote command.\n\"" );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $525
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1110
;1110:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $520
JUMPV
LABELV $521
line 1113
;1111:	}
;1112:
;1113:	base = command;
ADDRLP4 264
ADDRFP4 4
INDIRP4
ASGNP4
line 1115
;1114:	
;1115:	s = buf; // extract command name
ADDRLP4 4
ADDRLP4 8
ASGNP4
ADDRGP4 $527
JUMPV
LABELV $526
line 1116
;1116:	while ( *command != '\0' && *command != ' ' ) {
line 1117
;1117:		*s = *command; s++; command++;
ADDRLP4 4
INDIRP4
ADDRFP4 4
INDIRP4
INDIRI1
ASGNI1
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1118
;1118:	}
LABELV $527
line 1116
ADDRLP4 280
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
EQI4 $529
ADDRLP4 280
INDIRI4
CNSTI4 32
NEI4 $526
LABELV $529
line 1119
;1119:	*s = '\0';
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
ADDRGP4 $531
JUMPV
LABELV $530
line 1122
;1120:	// point cmd on first argument
;1121:	while ( *command == ' ' || *command == '\t' )
;1122:		command++;
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $531
line 1121
ADDRLP4 284
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 32
EQI4 $530
ADDRLP4 284
INDIRI4
CNSTI4 9
EQI4 $530
line 1124
;1123:
;1124:	for ( i = 0; i < ARRAY_LEN( voteCommands ); i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $536
JUMPV
LABELV $533
line 1125
;1125:		if ( !Q_stricmp( buf, voteCommands[i] ) ) {
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 voteCommands
ADDP4
INDIRP4
ARGP4
ADDRLP4 288
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 0
NEI4 $537
line 1126
;1126:			break;
ADDRGP4 $535
JUMPV
LABELV $537
line 1128
;1127:		}
;1128:	}
LABELV $534
line 1124
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $536
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 12
LTU4 $533
LABELV $535
line 1130
;1129:
;1130:	if ( i == ARRAY_LEN( voteCommands ) ) {
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 12
NEU4 $539
line 1131
;1131:		trap_SendServerCommand( clientNum, "print \"Invalid vote command.\nVote commands are: \n"
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $541
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1137
;1132:			" g_gametype <n|ffa|duel|tdm|ctf>\n"
;1133:			" map_restart, map <mapname>, rotate [round], nextmap\n"
;1134:			" kick <player>, clientkick <clientnum>\n"
;1135:			" g_unlagged <0|1>, g_warmup <-1|0|seconds>\n"
;1136:			" timelimit <time>, fraglimit <frags>, capturelimit <captures>.\n\"" );
;1137:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $520
JUMPV
LABELV $539
line 1140
;1138:	}
;1139:
;1140:	if ( Q_stricmp( buf, "g_gametype" ) == 0 )
ADDRLP4 8
ARGP4
ADDRGP4 $514
ARGP4
ADDRLP4 288
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 0
NEI4 $542
line 1141
;1141:	{
line 1142
;1142:		for ( i = 0; i < GT_MAX_GAME_TYPE; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $544
line 1143
;1143:			if ( i == GT_CAMPAIGN ) continue;
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $548
ADDRGP4 $545
JUMPV
LABELV $548
line 1144
;1144:			if ( !Q_stricmp( command, gt[i].shortName ) ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 36
MULI4
ADDRGP4 gt+8
ADDP4
INDIRP4
ARGP4
ADDRLP4 292
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
NEI4 $550
line 1145
;1145:				i = gt[i].index;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 36
MULI4
ADDRGP4 gt
ADDP4
INDIRI4
ASGNI4
line 1146
;1146:				break;
ADDRGP4 $546
JUMPV
LABELV $550
line 1148
;1147:			}
;1148:		}
LABELV $545
line 1142
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $544
LABELV $546
line 1151
;1149:
;1150:		// handle string values
;1151:		BG_sprintf( base, "g_gametype %i", i );
ADDRLP4 264
INDIRP4
ARGP4
ADDRGP4 $553
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BG_sprintf
CALLI4
pop
line 1153
;1152:
;1153:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $520
JUMPV
LABELV $542
line 1156
;1154:	}
;1155:
;1156:	if ( Q_stricmp( buf, "map" ) == 0 ) {
ADDRLP4 8
ARGP4
ADDRGP4 $509
ARGP4
ADDRLP4 292
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
NEI4 $554
line 1157
;1157:		if ( !G_MapExist( command ) ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 296
ADDRGP4 G_MapExist
CALLI4
ASGNI4
ADDRLP4 296
INDIRI4
CNSTI4 0
NEI4 $556
line 1158
;1158:			trap_SendServerCommand( clientNum, va( "print \"No such map on server: %s.\n\"", command ) );
ADDRGP4 $558
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 300
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 300
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1159
;1159:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $520
JUMPV
LABELV $556
line 1161
;1160:		} 
;1161:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $520
JUMPV
LABELV $554
line 1164
;1162:	}
;1163:
;1164:	if ( Q_stricmp( buf, "nextmap" ) == 0 ) {
ADDRLP4 8
ARGP4
ADDRGP4 $511
ARGP4
ADDRLP4 296
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 296
INDIRI4
CNSTI4 0
NEI4 $559
line 1165
;1165:		strcpy( base, "rotate" );
ADDRLP4 264
INDIRP4
ARGP4
ADDRGP4 $510
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1166
;1166:	}
LABELV $559
line 1168
;1167:
;1168:	return qtrue;
CNSTI4 1
RETI4
LABELV $520
endproc ValidVoteCommand 304 12
export Cmd_CallVote_f
proc Cmd_CallVote_f 2108 16
line 1177
;1169:}
;1170:
;1171:
;1172:/*
;1173:==================
;1174:Cmd_CallVote_f
;1175:==================
;1176:*/
;1177:void Cmd_CallVote_f( gentity_t *ent ) {
line 1182
;1178:	int		i, n;
;1179:	char	arg[MAX_STRING_TOKENS], *argn[4];
;1180:	char	cmd[MAX_STRING_TOKENS], *s;
;1181:
;1182:	if ( !g_allowVote.integer ) {
ADDRGP4 g_allowVote+12
INDIRI4
CNSTI4 0
NEI4 $562
line 1183
;1183:		trap_SendServerCommand( ent-g_entities, "print \"Voting not allowed here.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRGP4 $565
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1184
;1184:		return;
ADDRGP4 $561
JUMPV
LABELV $562
line 1187
;1185:	}
;1186:
;1187:	if ( level.voteTime ) {
ADDRGP4 level+872
INDIRI4
CNSTI4 0
EQI4 $566
line 1188
;1188:		trap_SendServerCommand( ent-g_entities, "print \"A vote is already in progress.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRGP4 $569
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1189
;1189:		return;
ADDRGP4 $561
JUMPV
LABELV $566
line 1193
;1190:	}
;1191:
;1192:	// if there is still a vote to be executed
;1193:	if ( level.voteExecuteTime || level.restarted ) {
ADDRGP4 level+876
INDIRI4
CNSTI4 0
NEI4 $574
ADDRGP4 level+72
INDIRI4
CNSTI4 0
EQI4 $570
LABELV $574
line 1194
;1194:		trap_SendServerCommand( ent-g_entities, "print \"Previous vote command is waiting execution^1.^7\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRGP4 $575
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1195
;1195:		return;
ADDRGP4 $561
JUMPV
LABELV $570
line 1198
;1196:	}
;1197:
;1198:	if ( ent->client->pers.voteCount >= MAX_VOTE_COUNT ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 600
ADDP4
INDIRI4
CNSTI4 3
LTI4 $576
line 1199
;1199:		trap_SendServerCommand( ent-g_entities, "print \"You have called the maximum number of votes.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRGP4 $578
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1200
;1200:		return;
ADDRGP4 $561
JUMPV
LABELV $576
line 1202
;1201:	}
;1202:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
NEI4 $579
line 1203
;1203:		trap_SendServerCommand( ent-g_entities, "print \"Not allowed to call a vote as spectator.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRGP4 $581
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1204
;1204:		return;
ADDRGP4 $561
JUMPV
LABELV $579
line 1208
;1205:	}
;1206:
;1207:	// build command buffer
;1208:	arg[ 0 ] = '\0'; s = arg;
ADDRLP4 1052
CNSTI1 0
ASGNI1
ADDRLP4 4
ADDRLP4 1052
ASGNP4
line 1209
;1209:	for ( i = 1; i < trap_Argc(); i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $585
JUMPV
LABELV $582
line 1210
;1210:		if ( arg[ 0 ] )
ADDRLP4 1052
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $586
line 1211
;1211:			s = Q_stradd( s, " " );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $588
ARGP4
ADDRLP4 2076
ADDRGP4 Q_stradd
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 2076
INDIRP4
ASGNP4
LABELV $586
line 1212
;1212:		trap_Argv( i, cmd, sizeof( cmd ) );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1213
;1213:		s = Q_stradd( s, cmd );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 2080
ADDRGP4 Q_stradd
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 2080
INDIRP4
ASGNP4
line 1214
;1214:	}
LABELV $583
line 1209
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $585
ADDRLP4 2076
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 2076
INDIRI4
LTI4 $582
line 1217
;1215:
;1216:	// split by ';' seperators
;1217:	n = Com_Split( arg, argn, ARRAY_LEN( argn ), ';' );
ADDRLP4 1052
ARGP4
ADDRLP4 1032
ARGP4
CNSTI4 4
ARGI4
CNSTI4 59
ARGI4
ADDRLP4 2080
ADDRGP4 Com_Split
CALLI4
ASGNI4
ADDRLP4 1048
ADDRLP4 2080
INDIRI4
ASGNI4
line 1218
;1218:	if ( n == 0 || *argn[0] == '\0' ) 
ADDRLP4 1048
INDIRI4
CNSTI4 0
EQI4 $591
ADDRLP4 1032
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $589
LABELV $591
line 1219
;1219:		return; // empty callvote command?
ADDRGP4 $561
JUMPV
LABELV $589
line 1222
;1220:
;1221:	// validate all split commands
;1222:	for ( i = 0; i < n; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $595
JUMPV
LABELV $592
line 1224
;1223:		// make sure it is a valid command to vote on
;1224:		if ( !ValidVoteCommand( ent - g_entities, argn[i] ) )
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1032
ADDP4
INDIRP4
ARGP4
ADDRLP4 2084
ADDRGP4 ValidVoteCommand
CALLI4
ASGNI4
ADDRLP4 2084
INDIRI4
CNSTI4 0
NEI4 $596
line 1225
;1225:			return;
ADDRGP4 $561
JUMPV
LABELV $596
line 1226
;1226:	}
LABELV $593
line 1222
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $595
ADDRLP4 0
INDIRI4
ADDRLP4 1048
INDIRI4
LTI4 $592
line 1229
;1227:
;1228:	// rebuild command buffer
;1229:	cmd[0] = '\0';
ADDRLP4 8
CNSTI1 0
ASGNI1
line 1230
;1230:	for ( s = cmd, i = 0; i < n; i++ ) {
ADDRLP4 4
ADDRLP4 8
ASGNP4
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $601
JUMPV
LABELV $598
line 1231
;1231:		if ( cmd[0] )
ADDRLP4 8
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $602
line 1232
;1232:			s = Q_stradd( s, ";" );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $604
ARGP4
ADDRLP4 2084
ADDRGP4 Q_stradd
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 2084
INDIRP4
ASGNP4
LABELV $602
line 1233
;1233:		s = Q_stradd( s, argn[ i ] );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1032
ADDP4
INDIRP4
ARGP4
ADDRLP4 2088
ADDRGP4 Q_stradd
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 2088
INDIRP4
ASGNP4
line 1234
;1234:	}
LABELV $599
line 1230
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $601
ADDRLP4 0
INDIRI4
ADDRLP4 1048
INDIRI4
LTI4 $598
line 1236
;1235:
;1236:	Com_sprintf( level.voteString, sizeof( level.voteString ), cmd );
ADDRGP4 level+360
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 8
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1237
;1237:	Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s", level.voteString );
ADDRGP4 level+616
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $609
ARGP4
ADDRGP4 level+360
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1239
;1238:
;1239:	trap_SendServerCommand( -1, va( "print \"%s called a vote(%s).\n\"", ent->client->pers.netname, cmd ) );
ADDRGP4 $611
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 2084
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 2084
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1242
;1240:
;1241:	// start the voting, the caller automatically votes yes
;1242:	level.voteTime = level.time;
ADDRGP4 level+872
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1243
;1243:	level.voteYes = 1;
ADDRGP4 level+880
CNSTI4 1
ASGNI4
line 1244
;1244:	level.voteNo = 0;
ADDRGP4 level+884
CNSTI4 0
ASGNI4
line 1246
;1245:
;1246:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $619
JUMPV
LABELV $616
line 1247
;1247:		level.clients[i].ps.eFlags &= ~EF_VOTED;
ADDRLP4 2088
ADDRLP4 0
INDIRI4
CNSTI4 1636
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 2088
INDIRP4
ADDRLP4 2088
INDIRP4
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 1248
;1248:		level.clients[i].pers.voted = 0;
ADDRLP4 0
INDIRI4
CNSTI4 1636
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 612
ADDP4
CNSTI4 0
ASGNI4
line 1249
;1249:	}
LABELV $617
line 1246
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $619
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $616
line 1251
;1250:
;1251:	ent->client->ps.eFlags |= EF_VOTED;
ADDRLP4 2088
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 2088
INDIRP4
ADDRLP4 2088
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 1252
;1252:	ent->client->pers.voted = 1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 1
ASGNI4
line 1254
;1253:
;1254:	ent->client->pers.voteCount++;
ADDRLP4 2092
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 600
ADDP4
ASGNP4
ADDRLP4 2092
INDIRP4
ADDRLP4 2092
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1256
;1255:
;1256:	trap_SetConfigstring( CS_VOTE_TIME, va("%i", level.voteTime ) );
ADDRGP4 $621
ARGP4
ADDRGP4 level+872
INDIRI4
ARGI4
ADDRLP4 2096
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 8
ARGI4
ADDRLP4 2096
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1257
;1257:	trap_SetConfigstring( CS_VOTE_STRING, level.voteDisplayString );	
CNSTI4 9
ARGI4
ADDRGP4 level+616
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1258
;1258:	trap_SetConfigstring( CS_VOTE_YES, va("%i", level.voteYes ) );
ADDRGP4 $621
ARGP4
ADDRGP4 level+880
INDIRI4
ARGI4
ADDRLP4 2100
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 10
ARGI4
ADDRLP4 2100
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1259
;1259:	trap_SetConfigstring( CS_VOTE_NO, va("%i", level.voteNo ) );	
ADDRGP4 $621
ARGP4
ADDRGP4 level+884
INDIRI4
ARGI4
ADDRLP4 2104
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 11
ARGI4
ADDRLP4 2104
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1260
;1260:}
LABELV $561
endproc Cmd_CallVote_f 2108 16
proc Cmd_Vote_f 80 12
line 1268
;1261:
;1262:
;1263:/*
;1264:==================
;1265:Cmd_Vote_f
;1266:==================
;1267:*/
;1268:static void Cmd_Vote_f( gentity_t *ent ) {
line 1271
;1269:	char		msg[64];
;1270:
;1271:	if ( !level.voteTime ) {
ADDRGP4 level+872
INDIRI4
CNSTI4 0
NEI4 $627
line 1272
;1272:		trap_SendServerCommand( ent-g_entities, "print \"No vote in progress.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRGP4 $630
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1273
;1273:		return;
ADDRGP4 $626
JUMPV
LABELV $627
line 1276
;1274:	}
;1275:
;1276:	if ( ent->client->pers.voted != 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 612
ADDP4
INDIRI4
CNSTI4 0
EQI4 $631
line 1277
;1277:		trap_SendServerCommand( ent-g_entities, "print \"Vote already cast.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRGP4 $633
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1278
;1278:		return;
ADDRGP4 $626
JUMPV
LABELV $631
line 1281
;1279:	}
;1280:
;1281:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
NEI4 $634
line 1282
;1282:		trap_SendServerCommand( ent-g_entities, "print \"Not allowed to vote as spectator.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRGP4 $636
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1283
;1283:		return;
ADDRGP4 $626
JUMPV
LABELV $634
line 1286
;1284:	}
;1285:
;1286:	trap_SendServerCommand( ent-g_entities, "print \"Vote cast.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRGP4 $637
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1288
;1287:
;1288:	ent->client->ps.eFlags |= EF_VOTED;
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 1290
;1289:
;1290:	trap_Argv( 1, msg, sizeof( msg ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1292
;1291:
;1292:	if ( msg[0] == 'y' || msg[0] == 'Y' || msg[0] == '1' ) {
ADDRLP4 68
ADDRLP4 0
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 121
EQI4 $641
ADDRLP4 68
INDIRI4
CNSTI4 89
EQI4 $641
ADDRLP4 68
INDIRI4
CNSTI4 49
NEI4 $638
LABELV $641
line 1293
;1293:		level.voteYes++;
ADDRLP4 72
ADDRGP4 level+880
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1294
;1294:		ent->client->pers.voted = 1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 1
ASGNI4
line 1295
;1295:		trap_SetConfigstring( CS_VOTE_YES, va( "%i", level.voteYes ) );
ADDRGP4 $621
ARGP4
ADDRGP4 level+880
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 10
ARGI4
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1296
;1296:	} else {
ADDRGP4 $639
JUMPV
LABELV $638
line 1297
;1297:		level.voteNo++;
ADDRLP4 72
ADDRGP4 level+884
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1298
;1298:		ent->client->pers.voted = -1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 -1
ASGNI4
line 1299
;1299:		trap_SetConfigstring( CS_VOTE_NO, va( "%i", level.voteNo ) );	
ADDRGP4 $621
ARGP4
ADDRGP4 level+884
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 11
ARGI4
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1300
;1300:	}
LABELV $639
line 1304
;1301:
;1302:	// a majority will be determined in CheckVote, which will also account
;1303:	// for players entering or leaving
;1304:}
LABELV $626
endproc Cmd_Vote_f 80 12
export G_RevertVote
proc G_RevertVote 20 8
line 1307
;1305:
;1306:
;1307:void G_RevertVote( gclient_t *client ) {
line 1308
;1308:	if ( level.voteTime ) {
ADDRGP4 level+872
INDIRI4
CNSTI4 0
EQI4 $647
line 1309
;1309:		if ( client->pers.voted == 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
INDIRI4
CNSTI4 1
NEI4 $650
line 1310
;1310:			level.voteYes--;
ADDRLP4 0
ADDRGP4 level+880
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1311
;1311:			client->pers.voted = 0;
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 0
ASGNI4
line 1312
;1312:			client->ps.eFlags &= ~EF_VOTED;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 1313
;1313:			trap_SetConfigstring( CS_VOTE_YES, va( "%i", level.voteYes ) );
ADDRGP4 $621
ARGP4
ADDRGP4 level+880
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 10
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1314
;1314:		} else if ( client->pers.voted == -1 ) {
ADDRGP4 $651
JUMPV
LABELV $650
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $654
line 1315
;1315:			level.voteNo--;
ADDRLP4 0
ADDRGP4 level+884
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1316
;1316:			client->pers.voted = 0;
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 0
ASGNI4
line 1317
;1317:			client->ps.eFlags &= ~EF_VOTED;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 1318
;1318:			trap_SetConfigstring( CS_VOTE_NO, va( "%i", level.voteNo ) );
ADDRGP4 $621
ARGP4
ADDRGP4 level+884
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 11
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1319
;1319:		}
LABELV $654
LABELV $651
line 1320
;1320:	}
LABELV $647
line 1321
;1321:	if ( client->sess.sessionTeam == TEAM_RED || client->sess.sessionTeam == TEAM_BLUE ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 1
EQI4 $660
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 2
NEI4 $658
LABELV $660
line 1323
;1322:		int cs_offset;
;1323:		if ( client->sess.sessionTeam == TEAM_RED )
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 1
NEI4 $661
line 1324
;1324:			cs_offset = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $662
JUMPV
LABELV $661
line 1326
;1325:		else
;1326:			cs_offset = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
LABELV $662
line 1327
;1327:		if ( client->pers.teamVoted == 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CNSTI4 1
NEI4 $663
line 1328
;1328:			level.teamVoteYes[cs_offset]--;
ADDRLP4 8
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2948
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1329
;1329:			client->pers.teamVoted = 0;
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 0
ASGNI4
line 1330
;1330:			client->ps.eFlags &= ~EF_TEAMVOTED;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 -524289
BANDI4
ASGNI4
line 1331
;1331:			trap_SetConfigstring( CS_TEAMVOTE_YES + cs_offset, va("%i", level.teamVoteYes[cs_offset] ) );
ADDRGP4 $621
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2948
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1332
;1332:		} else if ( client->pers.teamVoted == -1 ) {
ADDRGP4 $664
JUMPV
LABELV $663
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $667
line 1333
;1333:			level.teamVoteNo[cs_offset]--;
ADDRLP4 8
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2956
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1334
;1334:			client->pers.teamVoted = 0;
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 0
ASGNI4
line 1335
;1335:			client->ps.eFlags &= ~EF_TEAMVOTED;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 -524289
BANDI4
ASGNI4
line 1336
;1336:			trap_SetConfigstring( CS_TEAMVOTE_NO + cs_offset, va("%i", level.teamVoteNo[cs_offset] ) );
ADDRGP4 $621
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2956
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1337
;1337:		}
LABELV $667
LABELV $664
line 1338
;1338:	} 
LABELV $658
line 1339
;1339:}
LABELV $646
endproc G_RevertVote 20 8
proc Cmd_CallTeamVote_f 2172 20
line 1347
;1340:
;1341:
;1342:/*
;1343:==================
;1344:Cmd_CallTeamVote_f
;1345:==================
;1346:*/
;1347:static void Cmd_CallTeamVote_f( gentity_t *ent ) {
line 1352
;1348:	int		i, team, cs_offset;
;1349:	char	arg1[MAX_STRING_TOKENS];
;1350:	char	arg2[MAX_STRING_TOKENS];
;1351:
;1352:	team = ent->client->sess.sessionTeam;
ADDRLP4 1028
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ASGNI4
line 1353
;1353:	if ( team == TEAM_RED )
ADDRLP4 1028
INDIRI4
CNSTI4 1
NEI4 $672
line 1354
;1354:		cs_offset = 0;
ADDRLP4 1032
CNSTI4 0
ASGNI4
ADDRGP4 $673
JUMPV
LABELV $672
line 1355
;1355:	else if ( team == TEAM_BLUE )
ADDRLP4 1028
INDIRI4
CNSTI4 2
NEI4 $671
line 1356
;1356:		cs_offset = 1;
ADDRLP4 1032
CNSTI4 1
ASGNI4
line 1358
;1357:	else
;1358:		return;
LABELV $675
LABELV $673
line 1360
;1359:
;1360:	if ( !g_allowVote.integer ) {
ADDRGP4 g_allowVote+12
INDIRI4
CNSTI4 0
NEI4 $676
line 1361
;1361:		trap_SendServerCommand( ent-g_entities, "print \"Voting not allowed here.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRGP4 $565
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1362
;1362:		return;
ADDRGP4 $671
JUMPV
LABELV $676
line 1365
;1363:	}
;1364:
;1365:	if ( level.teamVoteTime[cs_offset] ) {
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2940
ADDP4
INDIRI4
CNSTI4 0
EQI4 $679
line 1366
;1366:		trap_SendServerCommand( ent-g_entities, "print \"A team vote is already in progress.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRGP4 $682
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1367
;1367:		return;
ADDRGP4 $671
JUMPV
LABELV $679
line 1369
;1368:	}
;1369:	if ( ent->client->pers.teamVoteCount >= MAX_VOTE_COUNT ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 3
LTI4 $683
line 1370
;1370:		trap_SendServerCommand( ent-g_entities, "print \"You have called the maximum number of team votes.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRGP4 $685
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1371
;1371:		return;
ADDRGP4 $671
JUMPV
LABELV $683
line 1374
;1372:	}
;1373:
;1374:	if ( level.voteExecuteTime || level.restarted ) {
ADDRGP4 level+876
INDIRI4
CNSTI4 0
NEI4 $690
ADDRGP4 level+72
INDIRI4
CNSTI4 0
EQI4 $686
LABELV $690
line 1375
;1375:		return;
ADDRGP4 $671
JUMPV
LABELV $686
line 1378
;1376:	}
;1377:
;1378:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
NEI4 $691
line 1379
;1379:		trap_SendServerCommand( ent-g_entities, "print \"Not allowed to call a vote as spectator.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRGP4 $581
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1380
;1380:		return;
ADDRGP4 $671
JUMPV
LABELV $691
line 1384
;1381:	}
;1382:
;1383:	// make sure it is a valid command to vote on
;1384:	trap_Argv( 1, arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 1036
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1385
;1385:	arg2[0] = '\0';
ADDRLP4 4
CNSTI1 0
ASGNI1
line 1386
;1386:	for ( i = 2; i < trap_Argc(); i++ ) {
ADDRLP4 0
CNSTI4 2
ASGNI4
ADDRGP4 $696
JUMPV
LABELV $693
line 1387
;1387:		if (i > 2)
ADDRLP4 0
INDIRI4
CNSTI4 2
LEI4 $697
line 1388
;1388:			strcat(arg2, " ");
ADDRLP4 4
ARGP4
ADDRGP4 $588
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $697
line 1389
;1389:		trap_Argv( i, &arg2[strlen(arg2)], sizeof( arg2 ) - (int)strlen(arg2) );
ADDRLP4 4
ARGP4
ADDRLP4 2060
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ARGP4
ADDRLP4 2064
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2060
INDIRI4
ADDRLP4 4
ADDP4
ARGP4
CNSTU4 1024
ADDRLP4 2064
INDIRI4
CVIU4 4
SUBU4
CVUI4 4
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1390
;1390:	}
LABELV $694
line 1386
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $696
ADDRLP4 2060
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 2060
INDIRI4
LTI4 $693
line 1392
;1391:
;1392:	if( strchr( arg1, ';' ) || strchr( arg2, ';' ) || strchr( arg2, '\n' ) || strchr( arg2, '\r' ) ) {
ADDRLP4 1036
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 2064
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2064
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $703
ADDRLP4 4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 2068
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2068
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $703
ADDRLP4 4
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 2072
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2072
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $703
ADDRLP4 4
ARGP4
CNSTI4 13
ARGI4
ADDRLP4 2076
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2076
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $699
LABELV $703
line 1393
;1393:		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRGP4 $704
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1394
;1394:		return;
ADDRGP4 $671
JUMPV
LABELV $699
line 1397
;1395:	}
;1396:
;1397:	if ( !Q_stricmp( arg1, "leader" ) ) {
ADDRLP4 1036
ARGP4
ADDRGP4 $707
ARGP4
ADDRLP4 2080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2080
INDIRI4
CNSTI4 0
NEI4 $705
line 1400
;1398:		char netname[MAX_NETNAME], leader[MAX_NETNAME];
;1399:
;1400:		if ( !arg2[0] ) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $708
line 1401
;1401:			i = ent->client->ps.clientNum;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 1402
;1402:		}
ADDRGP4 $709
JUMPV
LABELV $708
line 1403
;1403:		else {
line 1405
;1404:			// numeric values are just slot numbers
;1405:			for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $710
line 1406
;1406:				if ( !arg2[i] || arg2[i] < '0' || arg2[i] > '9' )
ADDRLP4 2156
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2156
INDIRI4
CNSTI4 0
EQI4 $717
ADDRLP4 2156
INDIRI4
CNSTI4 48
LTI4 $717
ADDRLP4 2156
INDIRI4
CNSTI4 57
LEI4 $714
LABELV $717
line 1407
;1407:					break;
ADDRGP4 $712
JUMPV
LABELV $714
line 1408
;1408:			}
LABELV $711
line 1405
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $710
LABELV $712
line 1409
;1409:			if ( i >= 3 || !arg2[i]) {
ADDRLP4 0
INDIRI4
CNSTI4 3
GEI4 $720
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $718
LABELV $720
line 1410
;1410:				i = atoi( arg2 );
ADDRLP4 4
ARGP4
ADDRLP4 2160
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 2160
INDIRI4
ASGNI4
line 1411
;1411:				if ( i < 0 || i >= level.maxclients ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $724
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $721
LABELV $724
line 1412
;1412:					trap_SendServerCommand( ent-g_entities, va("print \"Bad client slot: %i\n\"", i) );
ADDRGP4 $122
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2168
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRLP4 2168
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1413
;1413:					return;
ADDRGP4 $671
JUMPV
LABELV $721
line 1416
;1414:				}
;1415:
;1416:				if ( !g_entities[i].inuse ) {
ADDRLP4 0
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities+520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $719
line 1417
;1417:					trap_SendServerCommand( ent-g_entities, va("print \"Client %i is not active\n\"", i) );
ADDRGP4 $125
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2168
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRLP4 2168
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1418
;1418:					return;
ADDRGP4 $671
JUMPV
line 1420
;1419:				}
;1420:			}
LABELV $718
line 1421
;1421:			else {
line 1422
;1422:				Q_strncpyz(leader, arg2, sizeof(leader));
ADDRLP4 2120
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1423
;1423:				Q_CleanStr(leader);
ADDRLP4 2120
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1424
;1424:				for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $731
JUMPV
LABELV $728
line 1425
;1425:					if ( level.clients[i].pers.connected == CON_DISCONNECTED )
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
NEI4 $733
line 1426
;1426:						continue;
ADDRGP4 $729
JUMPV
LABELV $733
line 1427
;1427:					if (level.clients[i].sess.sessionTeam != team)
ADDRLP4 0
INDIRI4
CNSTI4 1636
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 624
ADDP4
INDIRI4
ADDRLP4 1028
INDIRI4
EQI4 $735
line 1428
;1428:						continue;
ADDRGP4 $729
JUMPV
LABELV $735
line 1429
;1429:					Q_strncpyz(netname, level.clients[i].pers.netname, sizeof(netname));
ADDRLP4 2084
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1636
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 508
ADDP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1430
;1430:					Q_CleanStr(netname);
ADDRLP4 2084
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1431
;1431:					if ( !Q_stricmp(netname, leader) ) {
ADDRLP4 2084
ARGP4
ADDRLP4 2120
ARGP4
ADDRLP4 2160
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2160
INDIRI4
CNSTI4 0
NEI4 $737
line 1432
;1432:						break;
ADDRGP4 $730
JUMPV
LABELV $737
line 1434
;1433:					}
;1434:				}
LABELV $729
line 1424
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $731
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $728
LABELV $730
line 1435
;1435:				if ( i >= level.maxclients ) {
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $739
line 1436
;1436:					trap_SendServerCommand( ent-g_entities, va("print \"%s is not a valid player on your team.\n\"", arg2) );
ADDRGP4 $742
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 2160
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRLP4 2160
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1437
;1437:					return;
ADDRGP4 $671
JUMPV
LABELV $739
line 1439
;1438:				}
;1439:			}
LABELV $719
line 1440
;1440:		}
LABELV $709
line 1441
;1441:		Com_sprintf(arg2, sizeof(arg2), "%d", i);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $231
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1442
;1442:	} else {
ADDRGP4 $706
JUMPV
LABELV $705
line 1443
;1443:		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRGP4 $704
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1444
;1444:		trap_SendServerCommand( ent-g_entities, "print \"Team vote commands are: leader <player>.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRGP4 $743
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1445
;1445:		return;
ADDRGP4 $671
JUMPV
LABELV $706
line 1448
;1446:	}
;1447:
;1448:	Com_sprintf( level.teamVoteString[cs_offset], sizeof( level.teamVoteString[cs_offset] ), "%s %s", arg1, arg2 );
ADDRLP4 1032
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+892
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $746
ARGP4
ADDRLP4 1036
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1450
;1449:
;1450:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $750
JUMPV
LABELV $747
line 1451
;1451:		if ( level.clients[i].pers.connected == CON_DISCONNECTED )
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
NEI4 $752
line 1452
;1452:			continue;
ADDRGP4 $748
JUMPV
LABELV $752
line 1453
;1453:		if (level.clients[i].sess.sessionTeam == team)
ADDRLP4 0
INDIRI4
CNSTI4 1636
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 624
ADDP4
INDIRI4
ADDRLP4 1028
INDIRI4
NEI4 $754
line 1454
;1454:			trap_SendServerCommand( i, va("print \"%s called a team vote.\n\"", ent->client->pers.netname ) );
ADDRGP4 $756
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 2084
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2084
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $754
line 1455
;1455:	}
LABELV $748
line 1450
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $750
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $747
line 1458
;1456:
;1457:	// start the voting, the caller automatically votes yes
;1458:	level.teamVoteTime[cs_offset] = level.time;
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2940
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1459
;1459:	level.teamVoteYes[cs_offset] = 1;
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2948
ADDP4
CNSTI4 1
ASGNI4
line 1460
;1460:	level.teamVoteNo[cs_offset] = 0;
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2956
ADDP4
CNSTI4 0
ASGNI4
line 1462
;1461:
;1462:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $764
JUMPV
LABELV $761
line 1463
;1463:		if ( level.clients[i].sess.sessionTeam == team ) {
ADDRLP4 0
INDIRI4
CNSTI4 1636
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 624
ADDP4
INDIRI4
ADDRLP4 1028
INDIRI4
NEI4 $766
line 1464
;1464:			level.clients[i].ps.eFlags &= ~EF_TEAMVOTED;
ADDRLP4 2084
ADDRLP4 0
INDIRI4
CNSTI4 1636
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 2084
INDIRP4
ADDRLP4 2084
INDIRP4
INDIRI4
CNSTI4 -524289
BANDI4
ASGNI4
line 1465
;1465:			level.clients[i].pers.teamVoted = 0;
ADDRLP4 0
INDIRI4
CNSTI4 1636
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 616
ADDP4
CNSTI4 0
ASGNI4
line 1466
;1466:		}
LABELV $766
line 1467
;1467:	}
LABELV $762
line 1462
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $764
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $761
line 1468
;1468:	ent->client->ps.eFlags |= EF_TEAMVOTED;
ADDRLP4 2084
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 2084
INDIRP4
ADDRLP4 2084
INDIRP4
INDIRI4
CNSTI4 524288
BORI4
ASGNI4
line 1469
;1469:	ent->client->pers.teamVoted = 1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 1
ASGNI4
line 1471
;1470:
;1471:	ent->client->pers.teamVoteCount++;
ADDRLP4 2088
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 604
ADDP4
ASGNP4
ADDRLP4 2088
INDIRP4
ADDRLP4 2088
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1473
;1472:
;1473:	trap_SetConfigstring( CS_TEAMVOTE_TIME + cs_offset, va("%i", level.teamVoteTime[cs_offset] ) );
ADDRGP4 $621
ARGP4
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2940
ADDP4
INDIRI4
ARGI4
ADDRLP4 2092
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1032
INDIRI4
CNSTI4 12
ADDI4
ARGI4
ADDRLP4 2092
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1474
;1474:	trap_SetConfigstring( CS_TEAMVOTE_STRING + cs_offset, level.teamVoteString[cs_offset] );
ADDRLP4 1032
INDIRI4
CNSTI4 14
ADDI4
ARGI4
ADDRLP4 1032
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+892
ADDP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1475
;1475:	trap_SetConfigstring( CS_TEAMVOTE_YES + cs_offset, va("%i", level.teamVoteYes[cs_offset] ) );
ADDRGP4 $621
ARGP4
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2948
ADDP4
INDIRI4
ARGI4
ADDRLP4 2100
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1032
INDIRI4
CNSTI4 16
ADDI4
ARGI4
ADDRLP4 2100
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1476
;1476:	trap_SetConfigstring( CS_TEAMVOTE_NO + cs_offset, va("%i", level.teamVoteNo[cs_offset] ) );
ADDRGP4 $621
ARGP4
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2956
ADDP4
INDIRI4
ARGI4
ADDRLP4 2104
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1032
INDIRI4
CNSTI4 18
ADDI4
ARGI4
ADDRLP4 2104
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1477
;1477:}
LABELV $671
endproc Cmd_CallTeamVote_f 2172 20
proc Cmd_TeamVote_f 92 12
line 1485
;1478:
;1479:
;1480:/*
;1481:==================
;1482:Cmd_TeamVote_f
;1483:==================
;1484:*/
;1485:static void Cmd_TeamVote_f( gentity_t *ent ) {
line 1489
;1486:	int			team, cs_offset;
;1487:	char		msg[64];
;1488:
;1489:	team = ent->client->sess.sessionTeam;
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ASGNI4
line 1490
;1490:	if ( team == TEAM_RED )
ADDRLP4 68
INDIRI4
CNSTI4 1
NEI4 $773
line 1491
;1491:		cs_offset = 0;
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRGP4 $774
JUMPV
LABELV $773
line 1492
;1492:	else if ( team == TEAM_BLUE )
ADDRLP4 68
INDIRI4
CNSTI4 2
NEI4 $772
line 1493
;1493:		cs_offset = 1;
ADDRLP4 64
CNSTI4 1
ASGNI4
line 1495
;1494:	else
;1495:		return;
LABELV $776
LABELV $774
line 1497
;1496:
;1497:	if ( !level.teamVoteTime[cs_offset] ) {
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2940
ADDP4
INDIRI4
CNSTI4 0
NEI4 $777
line 1498
;1498:		trap_SendServerCommand( ent-g_entities, "print \"No team vote in progress.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRGP4 $780
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1499
;1499:		return;
ADDRGP4 $772
JUMPV
LABELV $777
line 1501
;1500:	}
;1501:	if ( ent->client->pers.teamVoted != 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CNSTI4 0
EQI4 $781
line 1502
;1502:		trap_SendServerCommand( ent-g_entities, "print \"Team vote already cast.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRGP4 $783
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1503
;1503:		return;
ADDRGP4 $772
JUMPV
LABELV $781
line 1505
;1504:	}
;1505:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
NEI4 $784
line 1506
;1506:		trap_SendServerCommand( ent-g_entities, "print \"Not allowed to vote as spectator.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRGP4 $636
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1507
;1507:		return;
ADDRGP4 $772
JUMPV
LABELV $784
line 1510
;1508:	}
;1509:
;1510:	trap_SendServerCommand( ent-g_entities, "print \"Team vote cast.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRGP4 $786
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1512
;1511:
;1512:	ent->client->ps.eFlags |= EF_TEAMVOTED;
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 524288
BORI4
ASGNI4
line 1513
;1513:	ent->client->pers.teamVoteCount++;
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 604
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1515
;1514:
;1515:	trap_Argv( 1, msg, sizeof( msg ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1517
;1516:
;1517:	if ( msg[0] == 'y' || msg[0] == 'Y' || msg[0] == '1' ) {
ADDRLP4 80
ADDRLP4 0
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 121
EQI4 $790
ADDRLP4 80
INDIRI4
CNSTI4 89
EQI4 $790
ADDRLP4 80
INDIRI4
CNSTI4 49
NEI4 $787
LABELV $790
line 1518
;1518:		level.teamVoteYes[cs_offset]++;
ADDRLP4 84
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2948
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1519
;1519:		trap_SetConfigstring( CS_TEAMVOTE_YES + cs_offset, va("%i", level.teamVoteYes[cs_offset] ) );
ADDRGP4 $621
ARGP4
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2948
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRI4
CNSTI4 16
ADDI4
ARGI4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1520
;1520:	} else {
ADDRGP4 $788
JUMPV
LABELV $787
line 1521
;1521:		level.teamVoteNo[cs_offset]++;
ADDRLP4 84
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2956
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1522
;1522:		trap_SetConfigstring( CS_TEAMVOTE_NO + cs_offset, va("%i", level.teamVoteNo[cs_offset] ) );	
ADDRGP4 $621
ARGP4
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2956
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRI4
CNSTI4 18
ADDI4
ARGI4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1523
;1523:	}
LABELV $788
line 1527
;1524:
;1525:	// a majority will be determined in TeamCheckVote, which will also account
;1526:	// for players entering or leaving
;1527:}
LABELV $772
endproc Cmd_TeamVote_f 92 12
proc Cmd_SetViewpos_f 1060 12
line 1535
;1528:
;1529:
;1530:/*
;1531:=================
;1532:Cmd_SetViewpos_f
;1533:=================
;1534:*/
;1535:static void Cmd_SetViewpos_f( gentity_t *ent ) {
line 1540
;1536:	vec3_t		origin, angles;
;1537:	char		buffer[MAX_TOKEN_CHARS];
;1538:	int			i;
;1539:
;1540:	if ( !g_cheats.integer ) {
ADDRGP4 g_cheats+12
INDIRI4
CNSTI4 0
NEI4 $796
line 1541
;1541:		trap_SendServerCommand( ent-g_entities, "print \"Cheats are not enabled on this server.\n\"");
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRGP4 $94
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1542
;1542:		return;
ADDRGP4 $795
JUMPV
LABELV $796
line 1544
;1543:	}
;1544:	if ( trap_Argc() != 5 ) {
ADDRLP4 1052
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 5
EQI4 $799
line 1545
;1545:		trap_SendServerCommand( ent-g_entities, "print \"usage: setviewpos x y z yaw\n\"");
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRGP4 $801
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1546
;1546:		return;
ADDRGP4 $795
JUMPV
LABELV $799
line 1549
;1547:	}
;1548:
;1549:	VectorClear( angles );
ADDRLP4 1040
CNSTF4 0
ASGNF4
ADDRLP4 1040+4
CNSTF4 0
ASGNF4
ADDRLP4 1040+8
CNSTF4 0
ASGNF4
line 1550
;1550:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $804
line 1551
;1551:		trap_Argv( i + 1, buffer, sizeof( buffer ) );
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1552
;1552:		origin[i] = atof( buffer );
ADDRLP4 4
ARGP4
ADDRLP4 1056
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1028
ADDP4
ADDRLP4 1056
INDIRF4
ASGNF4
line 1553
;1553:	}
LABELV $805
line 1550
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $804
line 1555
;1554:
;1555:	trap_Argv( 4, buffer, sizeof( buffer ) );
CNSTI4 4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1556
;1556:	angles[YAW] = atof( buffer );
ADDRLP4 4
ARGP4
ADDRLP4 1056
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 1040+4
ADDRLP4 1056
INDIRF4
ASGNF4
line 1558
;1557:
;1558:	TeleportPlayer( ent, origin, angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 1040
ARGP4
ADDRGP4 TeleportPlayer
CALLV
pop
line 1559
;1559:}
LABELV $795
endproc Cmd_SetViewpos_f 1060 12
proc Cmd_Stats_f 0 0
line 1568
;1560:
;1561:
;1562:
;1563:/*
;1564:=================
;1565:Cmd_Stats_f
;1566:=================
;1567:*/
;1568:static void Cmd_Stats_f( gentity_t *ent ) {
line 1583
;1569:/*
;1570:	int max, n, i;
;1571:
;1572:	max = trap_AAS_PointReachabilityAreaIndex( NULL );
;1573:
;1574:	n = 0;
;1575:	for ( i = 0; i < max; i++ ) {
;1576:		if ( ent->client->areabits[i >> 3] & (1 << (i & 7)) )
;1577:			n++;
;1578:	}
;1579:
;1580:	//trap_SendServerCommand( ent-g_entities, va("print \"visited %d of %d areas\n\"", n, max));
;1581:	trap_SendServerCommand( ent-g_entities, va("print \"%d%% level coverage\n\"", n * 100 / max));
;1582:*/
;1583:}
LABELV $809
endproc Cmd_Stats_f 0 0
export ClientCommand
proc ClientCommand 1124 12
line 1591
;1584:
;1585:
;1586:/*
;1587:=================
;1588:ClientCommand
;1589:=================
;1590:*/
;1591:void ClientCommand( int clientNum ) {
line 1595
;1592:	gentity_t *ent;
;1593:	char	cmd[MAX_TOKEN_CHARS];
;1594:
;1595:	ent = g_entities + clientNum;
ADDRLP4 1024
ADDRFP4 0
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1596
;1596:	if ( !ent->client )
ADDRLP4 1024
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $811
line 1597
;1597:		return;
ADDRGP4 $810
JUMPV
LABELV $811
line 1599
;1598:
;1599:	trap_Argv( 0, cmd, sizeof( cmd ) );
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1601
;1600:
;1601:	if ( ent->client->pers.connected != CON_CONNECTED ) {
ADDRLP4 1024
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $813
line 1602
;1602:		if ( ent->client->pers.connected == CON_CONNECTING && GTx( g_gametype.integer, GTF_TEAMS ) ) {
ADDRLP4 1024
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 1
NEI4 $810
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
EQI4 $810
line 1603
;1603:			if ( Q_stricmp( cmd, "team" ) == 0 && !level.restarted ) {
ADDRLP4 0
ARGP4
ADDRGP4 $821
ARGP4
ADDRLP4 1028
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $810
ADDRGP4 level+72
INDIRI4
CNSTI4 0
NEI4 $810
line 1604
;1604:				Cmd_Team_f( ent ); // early team override
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Team_f
CALLV
pop
line 1605
;1605:			}
line 1606
;1606:		}
line 1607
;1607:		return;	// not fully in game yet
ADDRGP4 $810
JUMPV
LABELV $813
line 1610
;1608:	}
;1609:
;1610:	if (Q_stricmp (cmd, "say") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $825
ARGP4
ADDRLP4 1028
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $823
line 1611
;1611:		Cmd_Say_f (ent, SAY_ALL, qfalse);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Cmd_Say_f
CALLV
pop
line 1612
;1612:		return;
ADDRGP4 $810
JUMPV
LABELV $823
line 1614
;1613:	}
;1614:	if (Q_stricmp (cmd, "say_team") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $828
ARGP4
ADDRLP4 1032
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $826
line 1615
;1615:		Cmd_Say_f (ent, SAY_TEAM, qfalse);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Cmd_Say_f
CALLV
pop
line 1616
;1616:		return;
ADDRGP4 $810
JUMPV
LABELV $826
line 1618
;1617:	}
;1618:	if (Q_stricmp (cmd, "tell") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $831
ARGP4
ADDRLP4 1036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $829
line 1619
;1619:		Cmd_Tell_f ( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Tell_f
CALLV
pop
line 1620
;1620:		return;
ADDRGP4 $810
JUMPV
LABELV $829
line 1622
;1621:	}
;1622:	if (Q_stricmp (cmd, "score") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $286
ARGP4
ADDRLP4 1040
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $832
line 1623
;1623:		Cmd_Score_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Score_f
CALLV
pop
line 1624
;1624:		return;
ADDRGP4 $810
JUMPV
LABELV $832
line 1628
;1625:	}
;1626:
;1627:	// ignore all other commands when at intermission
;1628:	if (level.intermissiontime) {
ADDRGP4 level+7604
INDIRI4
CNSTI4 0
EQI4 $834
line 1629
;1629:		Cmd_Say_f (ent, qfalse, qtrue);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_Say_f
CALLV
pop
line 1630
;1630:		return;
ADDRGP4 $810
JUMPV
LABELV $834
line 1633
;1631:	}
;1632:
;1633:	if (Q_stricmp (cmd, "give") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $839
ARGP4
ADDRLP4 1044
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $837
line 1634
;1634:		Cmd_Give_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Give_f
CALLV
pop
ADDRGP4 $838
JUMPV
LABELV $837
line 1635
;1635:	else if (Q_stricmp (cmd, "god") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $842
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $840
line 1636
;1636:		Cmd_God_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_God_f
CALLV
pop
ADDRGP4 $841
JUMPV
LABELV $840
line 1637
;1637:	else if (Q_stricmp (cmd, "notarget") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $845
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $843
line 1638
;1638:		Cmd_Notarget_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Notarget_f
CALLV
pop
ADDRGP4 $844
JUMPV
LABELV $843
line 1639
;1639:	else if (Q_stricmp (cmd, "noclip") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $848
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $846
line 1640
;1640:		Cmd_Noclip_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Noclip_f
CALLV
pop
ADDRGP4 $847
JUMPV
LABELV $846
line 1641
;1641:	else if (Q_stricmp (cmd, "kill") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $851
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $849
line 1642
;1642:		Cmd_Kill_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Kill_f
CALLV
pop
ADDRGP4 $850
JUMPV
LABELV $849
line 1643
;1643:	else if (Q_stricmp (cmd, "teamtask") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $230
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $852
line 1644
;1644:		Cmd_TeamTask_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_TeamTask_f
CALLV
pop
ADDRGP4 $853
JUMPV
LABELV $852
line 1645
;1645:	else if (Q_stricmp (cmd, "levelshot") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $856
ARGP4
ADDRLP4 1068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $854
line 1646
;1646:		Cmd_LevelShot_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_LevelShot_f
CALLV
pop
ADDRGP4 $855
JUMPV
LABELV $854
line 1647
;1647:	else if (Q_stricmp (cmd, "follow") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $859
ARGP4
ADDRLP4 1072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $857
line 1648
;1648:		Cmd_Follow_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Follow_f
CALLV
pop
ADDRGP4 $858
JUMPV
LABELV $857
line 1649
;1649:	else if (Q_stricmp (cmd, "follownext") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $862
ARGP4
ADDRLP4 1076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $860
line 1650
;1650:		Cmd_FollowCycle_f (ent, 1);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_FollowCycle_f
CALLV
pop
ADDRGP4 $861
JUMPV
LABELV $860
line 1651
;1651:	else if (Q_stricmp (cmd, "followprev") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $865
ARGP4
ADDRLP4 1080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $863
line 1652
;1652:		Cmd_FollowCycle_f (ent, -1);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 Cmd_FollowCycle_f
CALLV
pop
ADDRGP4 $864
JUMPV
LABELV $863
line 1653
;1653:	else if (Q_stricmp (cmd, "team") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $821
ARGP4
ADDRLP4 1084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
NEI4 $866
line 1654
;1654:		Cmd_Team_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Team_f
CALLV
pop
ADDRGP4 $867
JUMPV
LABELV $866
line 1655
;1655:	else if (Q_stricmp (cmd, "where") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $870
ARGP4
ADDRLP4 1088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
NEI4 $868
line 1656
;1656:		Cmd_Where_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Where_f
CALLV
pop
ADDRGP4 $869
JUMPV
LABELV $868
line 1657
;1657:	else if (Q_stricmp (cmd, "callvote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $873
ARGP4
ADDRLP4 1092
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
NEI4 $871
line 1658
;1658:		Cmd_CallVote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_CallVote_f
CALLV
pop
ADDRGP4 $872
JUMPV
LABELV $871
line 1659
;1659:	else if (Q_stricmp (cmd, "vote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $876
ARGP4
ADDRLP4 1096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $874
line 1660
;1660:		Cmd_Vote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Vote_f
CALLV
pop
ADDRGP4 $875
JUMPV
LABELV $874
line 1661
;1661:	else if (Q_stricmp (cmd, "callteamvote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $879
ARGP4
ADDRLP4 1100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $877
line 1662
;1662:		Cmd_CallTeamVote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_CallTeamVote_f
CALLV
pop
ADDRGP4 $878
JUMPV
LABELV $877
line 1663
;1663:	else if (Q_stricmp (cmd, "teamvote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $882
ARGP4
ADDRLP4 1104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $880
line 1664
;1664:		Cmd_TeamVote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_TeamVote_f
CALLV
pop
ADDRGP4 $881
JUMPV
LABELV $880
line 1665
;1665:	else if (Q_stricmp (cmd, "gc") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $885
ARGP4
ADDRLP4 1108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $883
line 1666
;1666:		Cmd_GameCommand_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_GameCommand_f
CALLV
pop
ADDRGP4 $884
JUMPV
LABELV $883
line 1667
;1667:	else if (Q_stricmp (cmd, "setviewpos") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $888
ARGP4
ADDRLP4 1112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
NEI4 $886
line 1668
;1668:		Cmd_SetViewpos_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_SetViewpos_f
CALLV
pop
ADDRGP4 $887
JUMPV
LABELV $886
line 1669
;1669:	else if (Q_stricmp (cmd, "stats") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $891
ARGP4
ADDRLP4 1116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $889
line 1670
;1670:		Cmd_Stats_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Stats_f
CALLV
pop
ADDRGP4 $890
JUMPV
LABELV $889
line 1672
;1671:	else
;1672:		trap_SendServerCommand( clientNum, va( "print \"unknown cmd %s\n\"", cmd ) );
ADDRGP4 $892
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1120
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1120
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $890
LABELV $887
LABELV $884
LABELV $881
LABELV $878
LABELV $875
LABELV $872
LABELV $869
LABELV $867
LABELV $864
LABELV $861
LABELV $858
LABELV $855
LABELV $853
LABELV $850
LABELV $847
LABELV $844
LABELV $841
LABELV $838
line 1673
;1673:}
LABELV $810
endproc ClientCommand 1124 12
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
LABELV $892
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $891
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $888
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
LABELV $885
byte 1 103
byte 1 99
byte 1 0
align 1
LABELV $882
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
LABELV $879
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
LABELV $876
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $873
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
LABELV $870
byte 1 119
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $865
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 0
align 1
LABELV $862
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $859
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $856
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
LABELV $851
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $848
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $845
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
LABELV $842
byte 1 103
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $839
byte 1 103
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $831
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $828
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
LABELV $825
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $821
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $801
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
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
byte 1 32
byte 1 120
byte 1 32
byte 1 121
byte 1 32
byte 1 122
byte 1 32
byte 1 121
byte 1 97
byte 1 119
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $786
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 115
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $783
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 99
byte 1 97
byte 1 115
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $780
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 103
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $756
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $746
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $743
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 32
byte 1 60
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 62
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $742
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $707
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $704
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $685
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 120
byte 1 105
byte 1 109
byte 1 117
byte 1 109
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $682
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 65
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 103
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $637
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 115
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $636
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 115
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $633
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 99
byte 1 97
byte 1 115
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $630
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 103
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $621
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $611
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $609
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $604
byte 1 59
byte 1 0
align 1
LABELV $588
byte 1 32
byte 1 0
align 1
LABELV $581
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 97
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 115
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $578
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 120
byte 1 105
byte 1 109
byte 1 117
byte 1 109
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $575
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 80
byte 1 114
byte 1 101
byte 1 118
byte 1 105
byte 1 111
byte 1 117
byte 1 115
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 117
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 94
byte 1 49
byte 1 46
byte 1 94
byte 1 55
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $569
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 65
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 103
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $565
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 86
byte 1 111
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $558
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 32
byte 1 115
byte 1 117
byte 1 99
byte 1 104
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $553
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
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $541
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 10
byte 1 32
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
byte 1 32
byte 1 60
byte 1 110
byte 1 124
byte 1 102
byte 1 102
byte 1 97
byte 1 124
byte 1 100
byte 1 117
byte 1 101
byte 1 108
byte 1 124
byte 1 116
byte 1 100
byte 1 109
byte 1 124
byte 1 99
byte 1 116
byte 1 102
byte 1 62
byte 1 10
byte 1 32
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
byte 1 44
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 60
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 62
byte 1 44
byte 1 32
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 91
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 93
byte 1 44
byte 1 32
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 10
byte 1 32
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 60
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 62
byte 1 44
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 60
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 110
byte 1 117
byte 1 109
byte 1 62
byte 1 10
byte 1 32
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
byte 1 32
byte 1 60
byte 1 48
byte 1 124
byte 1 49
byte 1 62
byte 1 44
byte 1 32
byte 1 103
byte 1 95
byte 1 119
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 32
byte 1 60
byte 1 45
byte 1 49
byte 1 124
byte 1 48
byte 1 124
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 62
byte 1 10
byte 1 32
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
byte 1 60
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 62
byte 1 44
byte 1 32
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
byte 1 60
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 115
byte 1 62
byte 1 44
byte 1 32
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
byte 1 60
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 115
byte 1 62
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $525
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $519
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
LABELV $518
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
LABELV $517
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
LABELV $516
byte 1 103
byte 1 95
byte 1 119
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $515
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
LABELV $514
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
LABELV $513
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $512
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $511
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $510
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $509
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $508
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
byte 1 0
align 1
LABELV $507
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $500
byte 1 114
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $499
byte 1 115
byte 1 101
byte 1 97
byte 1 114
byte 1 99
byte 1 104
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 111
byte 1 121
byte 1 0
align 1
LABELV $498
byte 1 103
byte 1 117
byte 1 97
byte 1 114
byte 1 100
byte 1 32
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $497
byte 1 99
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $496
byte 1 99
byte 1 111
byte 1 109
byte 1 101
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $495
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
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
LABELV $494
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
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
LABELV $491
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $471
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $465
byte 1 25
byte 1 91
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 93
byte 1 25
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $464
byte 1 25
byte 1 91
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 93
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 25
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $458
byte 1 25
byte 1 40
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 41
byte 1 25
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $457
byte 1 25
byte 1 40
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 41
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 25
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $454
byte 1 115
byte 1 97
byte 1 121
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $452
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $451
byte 1 115
byte 1 97
byte 1 121
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $439
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $438
byte 1 116
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $437
byte 1 37
byte 1 115
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $409
byte 1 67
byte 1 109
byte 1 100
byte 1 95
byte 1 70
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 67
byte 1 121
byte 1 99
byte 1 108
byte 1 101
byte 1 95
byte 1 102
byte 1 58
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 100
byte 1 105
byte 1 114
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $378
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 77
byte 1 97
byte 1 121
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 111
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 112
byte 1 101
byte 1 114
byte 1 32
byte 1 53
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $373
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 83
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $371
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 70
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $369
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $367
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $297
byte 1 115
byte 1 0
align 1
LABELV $296
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $293
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 50
byte 1 0
align 1
LABELV $290
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 49
byte 1 0
align 1
LABELV $286
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $285
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 98
byte 1 111
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $279
byte 1 98
byte 1 0
align 1
LABELV $278
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $274
byte 1 114
byte 1 0
align 1
LABELV $273
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $265
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $260
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $249
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $246
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $243
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 94
byte 1 52
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 94
byte 1 55
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $240
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 94
byte 1 49
byte 1 114
byte 1 101
byte 1 100
byte 1 94
byte 1 55
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $231
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $230
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
LABELV $226
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
LABELV $225
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 117
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 97
byte 1 32
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $222
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 77
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
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
byte 1 32
byte 1 48
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $212
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 32
byte 1 79
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $211
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 32
byte 1 79
byte 1 70
byte 1 70
byte 1 10
byte 1 0
align 1
LABELV $205
byte 1 110
byte 1 111
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 79
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $204
byte 1 110
byte 1 111
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 79
byte 1 70
byte 1 70
byte 1 10
byte 1 0
align 1
LABELV $198
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $197
byte 1 103
byte 1 111
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 32
byte 1 79
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $196
byte 1 103
byte 1 111
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 32
byte 1 79
byte 1 70
byte 1 70
byte 1 10
byte 1 0
align 1
LABELV $184
byte 1 97
byte 1 115
byte 1 115
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $181
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $178
byte 1 103
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 97
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $175
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
LABELV $172
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
LABELV $166
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $156
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $150
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $144
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $141
byte 1 97
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $135
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 85
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $125
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $122
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $97
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 97
byte 1 108
byte 1 105
byte 1 118
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $94
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 67
byte 1 104
byte 1 101
byte 1 97
byte 1 116
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $84
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $77
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
align 1
LABELV $57
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
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
