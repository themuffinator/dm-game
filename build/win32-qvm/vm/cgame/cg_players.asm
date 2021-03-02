data
align 4
LABELV cg_customSoundNames
address $73
address $74
address $75
address $76
address $77
address $78
address $79
address $80
address $81
address $82
address $83
address $84
address $85
skip 76
export CG_CustomSound
code
proc CG_CustomSound 16 8
file "..\..\..\..\code\cgame\cg_players.c"
line 31
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_players.c -- handle the media and animation for player entities
;4:#include "cg_local.h"
;5:
;6:#define	PM_SKIN "pm"
;7:
;8:static const char *cg_customSoundNames[ MAX_CUSTOM_SOUNDS ] = {
;9:	"*death1.wav",
;10:	"*death2.wav",
;11:	"*death3.wav",
;12:	"*jump1.wav",
;13:	"*pain25_1.wav",
;14:	"*pain50_1.wav",
;15:	"*pain75_1.wav",
;16:	"*pain100_1.wav",
;17:	"*falling1.wav",
;18:	"*gasp.wav",
;19:	"*drown.wav",
;20:	"*fall1.wav",
;21:	"*taunt.wav"
;22:};
;23:
;24:
;25:/*
;26:================
;27:CG_CustomSound
;28:
;29:================
;30:*/
;31:sfxHandle_t	CG_CustomSound( int clientNum, const char *soundName ) {
line 35
;32:	clientInfo_t *ci;
;33:	int			i;
;34:
;35:	if ( soundName[0] != '*' ) {
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
EQI4 $87
line 36
;36:		return trap_S_RegisterSound( soundName, qfalse );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $86
JUMPV
LABELV $87
line 39
;37:	}
;38:
;39:	if ( clientNum < 0 || clientNum >= MAX_CLIENTS ) {
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $91
ADDRLP4 8
INDIRI4
CNSTI4 64
LTI4 $89
LABELV $91
line 40
;40:		clientNum = 0;
ADDRFP4 0
CNSTI4 0
ASGNI4
line 41
;41:	}
LABELV $89
line 42
;42:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 4
ADDRFP4 0
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 44
;43:
;44:	for ( i = 0 ; i < MAX_CUSTOM_SOUNDS && cg_customSoundNames[i] ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $96
JUMPV
LABELV $93
line 45
;45:		if ( !strcmp( soundName, cg_customSoundNames[i] ) ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_customSoundNames
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $97
line 46
;46:			return ci->sounds[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 1484
ADDP4
ADDP4
INDIRI4
RETI4
ADDRGP4 $86
JUMPV
LABELV $97
line 48
;47:		}
;48:	}
LABELV $94
line 44
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $96
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $99
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_customSoundNames
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $93
LABELV $99
line 50
;49:
;50:	CG_Error( "Unknown custom sound: %s", soundName );
ADDRGP4 $100
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 51
;51:	return 0;
CNSTI4 0
RETI4
LABELV $86
endproc CG_CustomSound 16 8
proc CG_ParseAnimationFile 20076 12
line 72
;52:}
;53:
;54:
;55:
;56:/*
;57:=============================================================================
;58:
;59:CLIENT INFO
;60:
;61:=============================================================================
;62:*/
;63:
;64:/*
;65:======================
;66:CG_ParseAnimationFile
;67:
;68:Read a configuration file containing animation counts and rates
;69:models/players/visor/animation.cfg, etc
;70:======================
;71:*/
;72:static qboolean	CG_ParseAnimationFile( const char *filename, clientInfo_t *ci ) {
line 83
;73:	char		*text_p, *prev;
;74:	int			len;
;75:	int			i;
;76:	char		*token;
;77:	float		fps;
;78:	int			skip;
;79:	char		text[20000];
;80:	fileHandle_t	f;
;81:	animation_t *animations;
;82:
;83:	animations = ci->animations;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 448
ADDP4
ASGNP4
line 86
;84:
;85:	// load the file
;86:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20036
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 20036
INDIRI4
ASGNI4
line 87
;87:	if ( f == FS_INVALID_HANDLE ) {
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $102
line 88
;88:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $101
JUMPV
LABELV $102
line 90
;89:	}
;90:	if ( len <= 0 ) {
ADDRLP4 28
INDIRI4
CNSTI4 0
GTI4 $104
line 91
;91:		trap_FS_FCloseFile( f );
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 92
;92:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $101
JUMPV
LABELV $104
line 94
;93:	}
;94:	if ( len >= sizeof( text ) - 1 ) {
ADDRLP4 28
INDIRI4
CVIU4 4
CNSTU4 19999
LTU4 $106
line 95
;95:		CG_Printf( "File %s too long\n", filename );
ADDRGP4 $108
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 96
;96:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $101
JUMPV
LABELV $106
line 98
;97:	}
;98:	trap_FS_Read( text, len, f );
ADDRLP4 36
ARGP4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 99
;99:	text[len] = '\0';
ADDRLP4 28
INDIRI4
ADDRLP4 36
ADDP4
CNSTI1 0
ASGNI1
line 100
;100:	trap_FS_FCloseFile( f );
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 103
;101:
;102:	// parse the text
;103:	text_p = text;
ADDRLP4 12
ADDRLP4 36
ASGNP4
line 104
;104:	skip = 0;	// quite the compiler warning
ADDRLP4 24
CNSTI4 0
ASGNI4
line 106
;105:
;106:	ci->footsteps = FOOTSTEP_NORMAL;
ADDRFP4 4
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 0
ASGNI4
line 107
;107:	VectorClear( ci->headOffset );
ADDRFP4 4
INDIRP4
CNSTI4 400
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 404
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
CNSTF4 0
ASGNF4
line 108
;108:	ci->gender = GENDER_MALE;
ADDRFP4 4
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 0
ASGNI4
line 109
;109:	ci->fixedlegs = qfalse;
ADDRFP4 4
INDIRP4
CNSTI4 392
ADDP4
CNSTI4 0
ASGNI4
line 110
;110:	ci->fixedtorso = qfalse;
ADDRFP4 4
INDIRP4
CNSTI4 396
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $110
JUMPV
LABELV $109
line 113
;111:
;112:	// read optional parameters
;113:	while ( 1 ) {
line 114
;114:		prev = text_p;	// so we can unget
ADDRLP4 20
ADDRLP4 12
INDIRP4
ASGNP4
line 115
;115:		token = COM_Parse( &text_p );
ADDRLP4 12
ARGP4
ADDRLP4 20040
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20040
INDIRP4
ASGNP4
line 116
;116:		if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $112
line 117
;117:			break;
ADDRGP4 $111
JUMPV
LABELV $112
line 119
;118:		}
;119:		if ( !Q_stricmp( token, "footsteps" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $116
ARGP4
ADDRLP4 20044
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20044
INDIRI4
CNSTI4 0
NEI4 $114
line 120
;120:			token = COM_Parse( &text_p );
ADDRLP4 12
ARGP4
ADDRLP4 20048
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20048
INDIRP4
ASGNP4
line 121
;121:			if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $117
line 122
;122:				break;
ADDRGP4 $111
JUMPV
LABELV $117
line 124
;123:			}
;124:			if ( !Q_stricmp( token, "default" ) || !Q_stricmp( token, "normal" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $121
ARGP4
ADDRLP4 20052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20052
INDIRI4
CNSTI4 0
EQI4 $123
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $122
ARGP4
ADDRLP4 20056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20056
INDIRI4
CNSTI4 0
NEI4 $119
LABELV $123
line 125
;125:				ci->footsteps = FOOTSTEP_NORMAL;
ADDRFP4 4
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 0
ASGNI4
line 126
;126:			} else if ( !Q_stricmp( token, "boot" ) ) {
ADDRGP4 $110
JUMPV
LABELV $119
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $126
ARGP4
ADDRLP4 20060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20060
INDIRI4
CNSTI4 0
NEI4 $124
line 127
;127:				ci->footsteps = FOOTSTEP_BOOT;
ADDRFP4 4
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 1
ASGNI4
line 128
;128:			} else if ( !Q_stricmp( token, "flesh" ) ) {
ADDRGP4 $110
JUMPV
LABELV $124
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $129
ARGP4
ADDRLP4 20064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20064
INDIRI4
CNSTI4 0
NEI4 $127
line 129
;129:				ci->footsteps = FOOTSTEP_FLESH;
ADDRFP4 4
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 2
ASGNI4
line 130
;130:			} else if ( !Q_stricmp( token, "mech" ) ) {
ADDRGP4 $110
JUMPV
LABELV $127
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $132
ARGP4
ADDRLP4 20068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20068
INDIRI4
CNSTI4 0
NEI4 $130
line 131
;131:				ci->footsteps = FOOTSTEP_MECH;
ADDRFP4 4
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 3
ASGNI4
line 132
;132:			} else if ( !Q_stricmp( token, "energy" ) ) {
ADDRGP4 $110
JUMPV
LABELV $130
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $135
ARGP4
ADDRLP4 20072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20072
INDIRI4
CNSTI4 0
NEI4 $133
line 133
;133:				ci->footsteps = FOOTSTEP_ENERGY;
ADDRFP4 4
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 4
ASGNI4
line 134
;134:			} else {
ADDRGP4 $110
JUMPV
LABELV $133
line 135
;135:				CG_Printf( "Bad footsteps parm in %s: %s\n", filename, token );
ADDRGP4 $136
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 136
;136:			}
line 137
;137:			continue;
ADDRGP4 $110
JUMPV
LABELV $114
line 138
;138:		} else if ( !Q_stricmp( token, "headoffset" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $139
ARGP4
ADDRLP4 20048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20048
INDIRI4
CNSTI4 0
NEI4 $137
line 139
;139:			for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $140
line 140
;140:				token = COM_Parse( &text_p );
ADDRLP4 12
ARGP4
ADDRLP4 20052
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20052
INDIRP4
ASGNP4
line 141
;141:				if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $144
line 142
;142:					break;
ADDRGP4 $110
JUMPV
LABELV $144
line 144
;143:				}
;144:				ci->headOffset[i] = atof( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20056
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 400
ADDP4
ADDP4
ADDRLP4 20056
INDIRF4
ASGNF4
line 145
;145:			}
LABELV $141
line 139
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
LTI4 $140
line 146
;146:			continue;
ADDRGP4 $110
JUMPV
LABELV $137
line 147
;147:		} else if ( !Q_stricmp( token, "sex" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $148
ARGP4
ADDRLP4 20052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20052
INDIRI4
CNSTI4 0
NEI4 $146
line 148
;148:			token = COM_Parse( &text_p );
ADDRLP4 12
ARGP4
ADDRLP4 20056
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20056
INDIRP4
ASGNP4
line 149
;149:			if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $149
line 150
;150:				break;
ADDRGP4 $111
JUMPV
LABELV $149
line 152
;151:			}
;152:			if ( token[0] == 'f' || token[0] == 'F' ) {
ADDRLP4 20060
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20060
INDIRI4
CNSTI4 102
EQI4 $153
ADDRLP4 20060
INDIRI4
CNSTI4 70
NEI4 $151
LABELV $153
line 153
;153:				ci->gender = GENDER_FEMALE;
ADDRFP4 4
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 1
ASGNI4
line 154
;154:			} else if ( token[0] == 'n' || token[0] == 'N' ) {
ADDRGP4 $110
JUMPV
LABELV $151
ADDRLP4 20064
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20064
INDIRI4
CNSTI4 110
EQI4 $156
ADDRLP4 20064
INDIRI4
CNSTI4 78
NEI4 $154
LABELV $156
line 155
;155:				ci->gender = GENDER_NEUTER;
ADDRFP4 4
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 2
ASGNI4
line 156
;156:			} else {
ADDRGP4 $110
JUMPV
LABELV $154
line 157
;157:				ci->gender = GENDER_MALE;
ADDRFP4 4
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 0
ASGNI4
line 158
;158:			}
line 159
;159:			continue;
ADDRGP4 $110
JUMPV
LABELV $146
line 160
;160:		} else if ( !Q_stricmp( token, "fixedlegs" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $159
ARGP4
ADDRLP4 20056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20056
INDIRI4
CNSTI4 0
NEI4 $157
line 161
;161:			ci->fixedlegs = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 392
ADDP4
CNSTI4 1
ASGNI4
line 162
;162:			continue;
ADDRGP4 $110
JUMPV
LABELV $157
line 163
;163:		} else if ( !Q_stricmp( token, "fixedtorso" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $162
ARGP4
ADDRLP4 20060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20060
INDIRI4
CNSTI4 0
NEI4 $160
line 164
;164:			ci->fixedtorso = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 396
ADDP4
CNSTI4 1
ASGNI4
line 165
;165:			continue;
ADDRGP4 $110
JUMPV
LABELV $160
line 169
;166:		}
;167:
;168:		// if it is a number, start parsing animations
;169:		if ( token[0] >= '0' && token[0] <= '9' ) {
ADDRLP4 20064
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20064
INDIRI4
CNSTI4 48
LTI4 $163
ADDRLP4 20064
INDIRI4
CNSTI4 57
GTI4 $163
line 170
;170:			text_p = prev;	// unget the token
ADDRLP4 12
ADDRLP4 20
INDIRP4
ASGNP4
line 171
;171:			break;
ADDRGP4 $111
JUMPV
LABELV $163
line 173
;172:		}
;173:		Com_Printf( "unknown token '%s' in %s\n", token, filename );
ADDRGP4 $165
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 174
;174:	}
LABELV $110
line 113
ADDRGP4 $109
JUMPV
LABELV $111
line 177
;175:
;176:	// read information for each frame
;177:	for ( i = 0 ; i < MAX_ANIMATIONS ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $166
line 179
;178:
;179:		token = COM_Parse( &text_p );
ADDRLP4 12
ARGP4
ADDRLP4 20040
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20040
INDIRP4
ASGNP4
line 180
;180:		if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $170
line 181
;181:			if( i >= TORSO_GETFLAG && i <= TORSO_NEGATIVE ) {
ADDRLP4 4
INDIRI4
CNSTI4 25
LTI4 $168
ADDRLP4 4
INDIRI4
CNSTI4 30
GTI4 $168
line 182
;182:				animations[i].firstFrame = animations[TORSO_GESTURE].firstFrame;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 183
;183:				animations[i].frameLerp = animations[TORSO_GESTURE].frameLerp;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 12
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ASGNI4
line 184
;184:				animations[i].initialLerp = animations[TORSO_GESTURE].initialLerp;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 16
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 185
;185:				animations[i].loopFrames = animations[TORSO_GESTURE].loopFrames;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ASGNI4
line 186
;186:				animations[i].numFrames = animations[TORSO_GESTURE].numFrames;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 4
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ASGNI4
line 187
;187:				animations[i].reversed = qfalse;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
CNSTI4 0
ASGNI4
line 188
;188:				animations[i].flipflop = qfalse;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 24
ADDP4
CNSTI4 0
ASGNI4
line 189
;189:				continue;
ADDRGP4 $167
JUMPV
line 191
;190:			}
;191:			break;
LABELV $170
line 193
;192:		}
;193:		animations[i].firstFrame = atoi( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20044
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
ADDRLP4 20044
INDIRI4
ASGNI4
line 195
;194:		// leg only frames are adjusted to not count the upper body only frames
;195:		if ( i == LEGS_WALKCR ) {
ADDRLP4 4
INDIRI4
CNSTI4 13
NEI4 $174
line 196
;196:			skip = animations[LEGS_WALKCR].firstFrame - animations[TORSO_GESTURE].firstFrame;
ADDRLP4 24
ADDRLP4 8
INDIRP4
CNSTI4 364
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
SUBI4
ASGNI4
line 197
;197:		}
LABELV $174
line 198
;198:		if ( i >= LEGS_WALKCR && i<TORSO_GETFLAG) {
ADDRLP4 4
INDIRI4
CNSTI4 13
LTI4 $176
ADDRLP4 4
INDIRI4
CNSTI4 25
GEI4 $176
line 199
;199:			animations[i].firstFrame -= skip;
ADDRLP4 20052
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
ASGNP4
ADDRLP4 20052
INDIRP4
ADDRLP4 20052
INDIRP4
INDIRI4
ADDRLP4 24
INDIRI4
SUBI4
ASGNI4
line 200
;200:		}
LABELV $176
line 202
;201:
;202:		token = COM_Parse( &text_p );
ADDRLP4 12
ARGP4
ADDRLP4 20052
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20052
INDIRP4
ASGNP4
line 203
;203:		if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $178
line 204
;204:			break;
ADDRGP4 $168
JUMPV
LABELV $178
line 206
;205:		}
;206:		animations[i].numFrames = atoi( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20056
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 4
ADDP4
ADDRLP4 20056
INDIRI4
ASGNI4
line 208
;207:
;208:		animations[i].reversed = qfalse;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
CNSTI4 0
ASGNI4
line 209
;209:		animations[i].flipflop = qfalse;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 24
ADDP4
CNSTI4 0
ASGNI4
line 211
;210:		// if numFrames is negative the animation is reversed
;211:		if (animations[i].numFrames < 0) {
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
GEI4 $180
line 212
;212:			animations[i].numFrames = -animations[i].numFrames;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
NEGI4
ASGNI4
line 213
;213:			animations[i].reversed = qtrue;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
CNSTI4 1
ASGNI4
line 214
;214:		}
LABELV $180
line 216
;215:
;216:		token = COM_Parse( &text_p );
ADDRLP4 12
ARGP4
ADDRLP4 20060
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20060
INDIRP4
ASGNP4
line 217
;217:		if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $182
line 218
;218:			break;
ADDRGP4 $168
JUMPV
LABELV $182
line 220
;219:		}
;220:		animations[i].loopFrames = atoi( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20064
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 20064
INDIRI4
ASGNI4
line 222
;221:
;222:		token = COM_Parse( &text_p );
ADDRLP4 12
ARGP4
ADDRLP4 20068
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20068
INDIRP4
ASGNP4
line 223
;223:		if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $184
line 224
;224:			break;
ADDRGP4 $168
JUMPV
LABELV $184
line 226
;225:		}
;226:		fps = atof( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20072
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 20072
INDIRF4
ASGNF4
line 227
;227:		if ( fps == 0 ) {
ADDRLP4 16
INDIRF4
CNSTF4 0
NEF4 $186
line 228
;228:			fps = 1;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
line 229
;229:		}
LABELV $186
line 230
;230:		animations[i].frameLerp = 1000 / fps;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 12
ADDP4
CNSTF4 1148846080
ADDRLP4 16
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 231
;231:		animations[i].initialLerp = 1000 / fps;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 16
ADDP4
CNSTF4 1148846080
ADDRLP4 16
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 232
;232:	}
LABELV $167
line 177
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 31
LTI4 $166
LABELV $168
line 234
;233:
;234:	if ( i != MAX_ANIMATIONS ) {
ADDRLP4 4
INDIRI4
CNSTI4 31
EQI4 $188
line 235
;235:		CG_Printf( "Error parsing animation file: %s\n", filename );
ADDRGP4 $190
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 236
;236:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $101
JUMPV
LABELV $188
line 240
;237:	}
;238:
;239:	// crouch backward animation
;240:	memcpy(&animations[LEGS_BACKCR], &animations[LEGS_WALKCR], sizeof(animation_t));
ADDRLP4 8
INDIRP4
CNSTI4 896
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 364
ADDP4
ARGP4
CNSTI4 28
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 241
;241:	animations[LEGS_BACKCR].reversed = qtrue;
ADDRLP4 8
INDIRP4
CNSTI4 916
ADDP4
CNSTI4 1
ASGNI4
line 243
;242:	// walk backward animation
;243:	memcpy(&animations[LEGS_BACKWALK], &animations[LEGS_WALK], sizeof(animation_t));
ADDRLP4 8
INDIRP4
CNSTI4 924
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 392
ADDP4
ARGP4
CNSTI4 28
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 244
;244:	animations[LEGS_BACKWALK].reversed = qtrue;
ADDRLP4 8
INDIRP4
CNSTI4 944
ADDP4
CNSTI4 1
ASGNI4
line 246
;245:	// flag moving fast
;246:	animations[FLAG_RUN].firstFrame = 0;
ADDRLP4 8
INDIRP4
CNSTI4 952
ADDP4
CNSTI4 0
ASGNI4
line 247
;247:	animations[FLAG_RUN].numFrames = 16;
ADDRLP4 8
INDIRP4
CNSTI4 956
ADDP4
CNSTI4 16
ASGNI4
line 248
;248:	animations[FLAG_RUN].loopFrames = 16;
ADDRLP4 8
INDIRP4
CNSTI4 960
ADDP4
CNSTI4 16
ASGNI4
line 249
;249:	animations[FLAG_RUN].frameLerp = 1000 / 15;
ADDRLP4 8
INDIRP4
CNSTI4 964
ADDP4
CNSTI4 66
ASGNI4
line 250
;250:	animations[FLAG_RUN].initialLerp = 1000 / 15;
ADDRLP4 8
INDIRP4
CNSTI4 968
ADDP4
CNSTI4 66
ASGNI4
line 251
;251:	animations[FLAG_RUN].reversed = qfalse;
ADDRLP4 8
INDIRP4
CNSTI4 972
ADDP4
CNSTI4 0
ASGNI4
line 253
;252:	// flag not moving or moving slowly
;253:	animations[FLAG_STAND].firstFrame = 16;
ADDRLP4 8
INDIRP4
CNSTI4 980
ADDP4
CNSTI4 16
ASGNI4
line 254
;254:	animations[FLAG_STAND].numFrames = 5;
ADDRLP4 8
INDIRP4
CNSTI4 984
ADDP4
CNSTI4 5
ASGNI4
line 255
;255:	animations[FLAG_STAND].loopFrames = 0;
ADDRLP4 8
INDIRP4
CNSTI4 988
ADDP4
CNSTI4 0
ASGNI4
line 256
;256:	animations[FLAG_STAND].frameLerp = 1000 / 20;
ADDRLP4 8
INDIRP4
CNSTI4 992
ADDP4
CNSTI4 50
ASGNI4
line 257
;257:	animations[FLAG_STAND].initialLerp = 1000 / 20;
ADDRLP4 8
INDIRP4
CNSTI4 996
ADDP4
CNSTI4 50
ASGNI4
line 258
;258:	animations[FLAG_STAND].reversed = qfalse;
ADDRLP4 8
INDIRP4
CNSTI4 1000
ADDP4
CNSTI4 0
ASGNI4
line 260
;259:	// flag speeding up
;260:	animations[FLAG_STAND2RUN].firstFrame = 16;
ADDRLP4 8
INDIRP4
CNSTI4 1008
ADDP4
CNSTI4 16
ASGNI4
line 261
;261:	animations[FLAG_STAND2RUN].numFrames = 5;
ADDRLP4 8
INDIRP4
CNSTI4 1012
ADDP4
CNSTI4 5
ASGNI4
line 262
;262:	animations[FLAG_STAND2RUN].loopFrames = 1;
ADDRLP4 8
INDIRP4
CNSTI4 1016
ADDP4
CNSTI4 1
ASGNI4
line 263
;263:	animations[FLAG_STAND2RUN].frameLerp = 1000 / 15;
ADDRLP4 8
INDIRP4
CNSTI4 1020
ADDP4
CNSTI4 66
ASGNI4
line 264
;264:	animations[FLAG_STAND2RUN].initialLerp = 1000 / 15;
ADDRLP4 8
INDIRP4
CNSTI4 1024
ADDP4
CNSTI4 66
ASGNI4
line 265
;265:	animations[FLAG_STAND2RUN].reversed = qtrue;
ADDRLP4 8
INDIRP4
CNSTI4 1028
ADDP4
CNSTI4 1
ASGNI4
line 275
;266:	//
;267:	// new anims changes
;268:	//
;269://	animations[TORSO_GETFLAG].flipflop = qtrue;
;270://	animations[TORSO_GUARDBASE].flipflop = qtrue;
;271://	animations[TORSO_PATROL].flipflop = qtrue;
;272://	animations[TORSO_AFFIRMATIVE].flipflop = qtrue;
;273://	animations[TORSO_NEGATIVE].flipflop = qtrue;
;274:	//
;275:	return qtrue;
CNSTI4 1
RETI4
LABELV $101
endproc CG_ParseAnimationFile 20076 12
proc CG_FileExists 12 12
line 284
;276:}
;277:
;278:
;279:/*
;280:==========================
;281:CG_FileExists
;282:==========================
;283:*/
;284:static qboolean	CG_FileExists( const char *filename ) {
line 288
;285:	int len;
;286:	fileHandle_t	f;
;287:
;288:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 290
;289:
;290:	if ( f != FS_INVALID_HANDLE ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $192
line 291
;291:		trap_FS_FCloseFile( f );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 292
;292:	}
LABELV $192
line 294
;293:
;294:	if ( len > 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LEI4 $194
line 295
;295:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $191
JUMPV
LABELV $194
line 298
;296:	}
;297:
;298:	return qfalse;
CNSTI4 0
RETI4
LABELV $191
endproc CG_FileExists 12 12
proc CG_FindClientModelFile 36 40
line 307
;299:}
;300:
;301:
;302:/*
;303:==========================
;304:CG_FindClientModelFile
;305:==========================
;306:*/
;307:static qboolean	CG_FindClientModelFile( char *filename, int length, clientInfo_t *ci, const char *teamName, const char *modelName, const char *skinName, const char *base, const char *ext ) {
line 311
;308:	char *team, *charactersFolder;
;309:	int i;
;310:
;311:	if ( cgs.gametype >= GT_TDM ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $197
line 312
;312:		switch ( ci->team ) {
ADDRLP4 12
ADDRFP4 8
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 2
EQI4 $203
ADDRGP4 $200
JUMPV
LABELV $203
line 313
;313:			case TEAM_BLUE: {
line 314
;314:				team = "blue";
ADDRLP4 8
ADDRGP4 $204
ASGNP4
line 315
;315:				break;
ADDRGP4 $198
JUMPV
LABELV $200
line 317
;316:			}
;317:			default: {
line 318
;318:				team = "red";
ADDRLP4 8
ADDRGP4 $205
ASGNP4
line 319
;319:				break;
line 322
;320:			}
;321:		}
;322:	}
ADDRGP4 $198
JUMPV
LABELV $197
line 323
;323:	else {
line 324
;324:		team = "default";
ADDRLP4 8
ADDRGP4 $121
ASGNP4
line 325
;325:	}
LABELV $198
line 328
;326:
;327:	// colored skins
;328:	if ( ci->coloredSkin && !Q_stricmp( ci->skinName, PM_SKIN ) ) {
ADDRLP4 12
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 1612
ADDP4
INDIRI4
CNSTI4 0
EQI4 $206
ADDRLP4 12
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRGP4 $208
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $206
line 329
;329:		team = PM_SKIN;
ADDRLP4 8
ADDRGP4 $208
ASGNP4
line 330
;330:	}
LABELV $206
line 332
;331:
;332:	charactersFolder = "";
ADDRLP4 4
ADDRGP4 $209
ASGNP4
ADDRGP4 $211
JUMPV
LABELV $210
line 333
;333:	while(1) {
line 334
;334:		for ( i = 0; i < 2; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $213
line 335
;335:			if ( i == 0 && teamName && *teamName ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $217
ADDRLP4 20
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $217
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $217
line 337
;336:				//								"models/players/characters/james/stroggs/lower_lily_red.skin"
;337:				Com_sprintf( filename, length, "models/players/%s%s/%s%s_%s_%s.%s", charactersFolder, modelName, teamName, base, skinName, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $219
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 338
;338:			}
ADDRGP4 $218
JUMPV
LABELV $217
line 339
;339:			else {
line 341
;340:				//								"models/players/characters/james/lower_lily_red.skin"
;341:				Com_sprintf( filename, length, "models/players/%s%s/%s_%s_%s.%s", charactersFolder, modelName, base, skinName, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $220
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 342
;342:			}
LABELV $218
line 343
;343:			if ( CG_FileExists( filename ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 CG_FileExists
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $221
line 344
;344:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $196
JUMPV
LABELV $221
line 346
;345:			}
;346:			if ( cgs.gametype >= GT_TDM ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $223
line 347
;347:				if ( i == 0 && teamName && *teamName ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $226
ADDRLP4 28
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $226
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $226
line 349
;348:					//								"models/players/characters/james/stroggs/lower_red.skin"
;349:					Com_sprintf( filename, length, "models/players/%s%s/%s%s_%s.%s", charactersFolder, modelName, teamName, base, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 350
;350:				}
ADDRGP4 $224
JUMPV
LABELV $226
line 351
;351:				else {
line 353
;352:					//								"models/players/characters/james/lower_red.skin"
;353:					Com_sprintf( filename, length, "models/players/%s%s/%s_%s.%s", charactersFolder, modelName, base, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $229
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 354
;354:				}
line 355
;355:			}
ADDRGP4 $224
JUMPV
LABELV $223
line 356
;356:			else {
line 357
;357:				if ( i == 0 && teamName && *teamName ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $230
ADDRLP4 28
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $230
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $230
line 359
;358:					//								"models/players/characters/james/stroggs/lower_lily.skin"
;359:					Com_sprintf( filename, length, "models/players/%s%s/%s%s_%s.%s", charactersFolder, modelName, teamName, base, skinName, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 360
;360:				}
ADDRGP4 $231
JUMPV
LABELV $230
line 361
;361:				else {
line 363
;362:					//								"models/players/characters/james/lower_lily.skin"
;363:					Com_sprintf( filename, length, "models/players/%s%s/%s_%s.%s", charactersFolder, modelName, base, skinName, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $229
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 364
;364:				}
LABELV $231
line 365
;365:			}
LABELV $224
line 366
;366:			if ( CG_FileExists( filename ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 CG_FileExists
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $232
line 367
;367:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $196
JUMPV
LABELV $232
line 369
;368:			}
;369:			if ( !teamName || !*teamName ) {
ADDRLP4 32
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $236
ADDRLP4 32
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $234
LABELV $236
line 370
;370:				break;
ADDRGP4 $215
JUMPV
LABELV $234
line 372
;371:			}
;372:		}
LABELV $214
line 334
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $213
LABELV $215
line 374
;373:		// if tried the heads folder first
;374:		if ( charactersFolder[0] ) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $237
line 375
;375:			break;
ADDRGP4 $212
JUMPV
LABELV $237
line 377
;376:		}
;377:		charactersFolder = "characters/";
ADDRLP4 4
ADDRGP4 $239
ASGNP4
line 378
;378:	}
LABELV $211
line 333
ADDRGP4 $210
JUMPV
LABELV $212
line 380
;379:
;380:	return qfalse;
CNSTI4 0
RETI4
LABELV $196
endproc CG_FindClientModelFile 36 40
proc CG_FindClientHeadFile 36 40
line 389
;381:}
;382:
;383:
;384:/*
;385:==========================
;386:CG_FindClientHeadFile
;387:==========================
;388:*/
;389:static qboolean	CG_FindClientHeadFile( char *filename, int length, clientInfo_t *ci, const char *teamName, const char *headModelName, const char *headSkinName, const char *base, const char *ext ) {
line 393
;390:	char *team, *headsFolder;
;391:	int i;
;392:
;393:	if ( cgs.gametype >= GT_TDM ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $241
line 394
;394:		switch ( ci->team ) {
ADDRLP4 12
ADDRFP4 8
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
EQI4 $247
ADDRLP4 12
INDIRI4
CNSTI4 2
EQI4 $248
ADDRGP4 $244
JUMPV
LABELV $247
line 395
;395:			case TEAM_RED: {
line 396
;396:				team = "red";
ADDRLP4 8
ADDRGP4 $205
ASGNP4
line 397
;397:				break;
ADDRGP4 $242
JUMPV
LABELV $248
line 399
;398:			}
;399:			case TEAM_BLUE: {
line 400
;400:				team = "blue";
ADDRLP4 8
ADDRGP4 $204
ASGNP4
line 401
;401:				break;
ADDRGP4 $242
JUMPV
LABELV $244
line 403
;402:			}
;403:			default: {
line 404
;404:				team = "default";
ADDRLP4 8
ADDRGP4 $121
ASGNP4
line 405
;405:				break;
line 408
;406:			}
;407:		}
;408:	}
ADDRGP4 $242
JUMPV
LABELV $241
line 409
;409:	else {
line 410
;410:		team = "default";
ADDRLP4 8
ADDRGP4 $121
ASGNP4
line 411
;411:	}
LABELV $242
line 414
;412:
;413:	// colored skins
;414:	if ( ci->coloredSkin && !Q_stricmp( ci->headSkinName, PM_SKIN ) ) {
ADDRLP4 12
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 1612
ADDP4
INDIRI4
CNSTI4 0
EQI4 $249
ADDRLP4 12
INDIRP4
CNSTI4 320
ADDP4
ARGP4
ADDRGP4 $208
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $249
line 415
;415:		team = PM_SKIN;
ADDRLP4 8
ADDRGP4 $208
ASGNP4
line 416
;416:	}
LABELV $249
line 418
;417:
;418:	if ( headModelName[0] == '*' ) {
ADDRFP4 16
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $251
line 419
;419:		headsFolder = "heads/";
ADDRLP4 4
ADDRGP4 $253
ASGNP4
line 420
;420:		headModelName++;
ADDRFP4 16
ADDRFP4 16
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 421
;421:	}
ADDRGP4 $255
JUMPV
LABELV $251
line 422
;422:	else {
line 423
;423:		headsFolder = "";
ADDRLP4 4
ADDRGP4 $209
ASGNP4
line 424
;424:	}
ADDRGP4 $255
JUMPV
LABELV $254
line 425
;425:	while(1) {
line 426
;426:		for ( i = 0; i < 2; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $257
line 427
;427:			if ( i == 0 && teamName && *teamName ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $261
ADDRLP4 20
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $261
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $261
line 428
;428:				Com_sprintf( filename, length, "models/players/%s%s/%s/%s%s_%s.%s", headsFolder, headModelName, headSkinName, teamName, base, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $263
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 429
;429:			}
ADDRGP4 $262
JUMPV
LABELV $261
line 430
;430:			else {
line 431
;431:				Com_sprintf( filename, length, "models/players/%s%s/%s/%s_%s.%s", headsFolder, headModelName, headSkinName, base, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $264
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 432
;432:			}
LABELV $262
line 433
;433:			if ( CG_FileExists( filename ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 CG_FileExists
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $265
line 434
;434:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $240
JUMPV
LABELV $265
line 436
;435:			}
;436:			if ( cgs.gametype >= GT_TDM ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $267
line 437
;437:				if ( i == 0 &&  teamName && *teamName ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $270
ADDRLP4 28
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $270
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $270
line 438
;438:					Com_sprintf( filename, length, "models/players/%s%s/%s%s_%s.%s", headsFolder, headModelName, teamName, base, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 439
;439:				}
ADDRGP4 $268
JUMPV
LABELV $270
line 440
;440:				else {
line 441
;441:					Com_sprintf( filename, length, "models/players/%s%s/%s_%s.%s", headsFolder, headModelName, base, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $229
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 442
;442:				}
line 443
;443:			}
ADDRGP4 $268
JUMPV
LABELV $267
line 444
;444:			else {
line 445
;445:				if ( i == 0 && teamName && *teamName ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $272
ADDRLP4 28
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $272
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $272
line 446
;446:					Com_sprintf( filename, length, "models/players/%s%s/%s%s_%s.%s", headsFolder, headModelName, teamName, base, headSkinName, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 447
;447:				}
ADDRGP4 $273
JUMPV
LABELV $272
line 448
;448:				else {
line 449
;449:					Com_sprintf( filename, length, "models/players/%s%s/%s_%s.%s", headsFolder, headModelName, base, headSkinName, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $229
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 450
;450:				}
LABELV $273
line 451
;451:			}
LABELV $268
line 452
;452:			if ( CG_FileExists( filename ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 CG_FileExists
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $274
line 453
;453:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $240
JUMPV
LABELV $274
line 455
;454:			}
;455:			if ( !teamName || !*teamName ) {
ADDRLP4 32
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $278
ADDRLP4 32
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $276
LABELV $278
line 456
;456:				break;
ADDRGP4 $259
JUMPV
LABELV $276
line 458
;457:			}
;458:		}
LABELV $258
line 426
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $257
LABELV $259
line 460
;459:		// if tried the heads folder first
;460:		if ( headsFolder[0] ) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $279
line 461
;461:			break;
ADDRGP4 $256
JUMPV
LABELV $279
line 463
;462:		}
;463:		headsFolder = "heads/";
ADDRLP4 4
ADDRGP4 $253
ASGNP4
line 464
;464:	}
LABELV $255
line 425
ADDRGP4 $254
JUMPV
LABELV $256
line 466
;465:
;466:	return qfalse;
CNSTI4 0
RETI4
LABELV $240
endproc CG_FindClientHeadFile 36 40
proc CG_RegisterClientSkin 80 32
line 475
;467:}
;468:
;469:
;470:/*
;471:==========================
;472:CG_RegisterClientSkin
;473:==========================
;474:*/
;475:static qboolean	CG_RegisterClientSkin( clientInfo_t *ci, const char *teamName, const char *modelName, const char *skinName, const char *headModelName, const char *headSkinName ) {
line 500
;476:	char filename[MAX_QPATH];
;477:
;478:	/*
;479:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/%slower_%s.skin", modelName, teamName, skinName );
;480:	ci->legsSkin = trap_R_RegisterSkin( filename );
;481:	if (!ci->legsSkin) {
;482:		Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/%slower_%s.skin", modelName, teamName, skinName );
;483:		ci->legsSkin = trap_R_RegisterSkin( filename );
;484:		if (!ci->legsSkin) {
;485:			Com_Printf( "Leg skin load failure: %s\n", filename );
;486:		}
;487:	}
;488:
;489:
;490:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/%supper_%s.skin", modelName, teamName, skinName );
;491:	ci->torsoSkin = trap_R_RegisterSkin( filename );
;492:	if (!ci->torsoSkin) {
;493:		Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/%supper_%s.skin", modelName, teamName, skinName );
;494:		ci->torsoSkin = trap_R_RegisterSkin( filename );
;495:		if (!ci->torsoSkin) {
;496:			Com_Printf( "Torso skin load failure: %s\n", filename );
;497:		}
;498:	}
;499:	*/
;500:	if ( CG_FindClientModelFile( filename, sizeof(filename), ci, teamName, modelName, skinName, "lower", "skin" ) ) {
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 $284
ARGP4
ADDRGP4 $285
ARGP4
ADDRLP4 64
ADDRGP4 CG_FindClientModelFile
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $282
line 501
;501:		ci->legsSkin = trap_R_RegisterSkin( filename );
ADDRLP4 0
ARGP4
ADDRLP4 68
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ADDRLP4 68
INDIRI4
ASGNI4
line 502
;502:	}
LABELV $282
line 503
;503:	if (!ci->legsSkin) {
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 0
NEI4 $286
line 504
;504:		Com_Printf( "Leg skin load failure: %s\n", filename );
ADDRGP4 $288
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 505
;505:	}
LABELV $286
line 507
;506:
;507:	if ( CG_FindClientModelFile( filename, sizeof(filename), ci, teamName, modelName, skinName, "upper", "skin" ) ) {
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 $291
ARGP4
ADDRGP4 $285
ARGP4
ADDRLP4 68
ADDRGP4 CG_FindClientModelFile
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $289
line 508
;508:		ci->torsoSkin = trap_R_RegisterSkin( filename );
ADDRLP4 0
ARGP4
ADDRLP4 72
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
ADDRLP4 72
INDIRI4
ASGNI4
line 509
;509:	}
LABELV $289
line 510
;510:	if (!ci->torsoSkin) {
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 0
NEI4 $292
line 511
;511:		Com_Printf( "Torso skin load failure: %s\n", filename );
ADDRGP4 $294
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 512
;512:	}
LABELV $292
line 514
;513:
;514:	if ( CG_FindClientHeadFile( filename, sizeof(filename), ci, teamName, headModelName, headSkinName, "head", "skin" ) ) {
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRGP4 $297
ARGP4
ADDRGP4 $285
ARGP4
ADDRLP4 72
ADDRGP4 CG_FindClientHeadFile
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $295
line 515
;515:		ci->headSkin = trap_R_RegisterSkin( filename );
ADDRLP4 0
ARGP4
ADDRLP4 76
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 440
ADDP4
ADDRLP4 76
INDIRI4
ASGNI4
line 516
;516:	}
LABELV $295
line 517
;517:	if (!ci->headSkin) {
ADDRFP4 0
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
CNSTI4 0
NEI4 $298
line 518
;518:		Com_Printf( "Head skin load failure: %s\n", filename );
ADDRGP4 $300
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 519
;519:	}
LABELV $298
line 522
;520:
;521:	// if any skins failed to load
;522:	if ( !ci->legsSkin || !ci->torsoSkin || !ci->headSkin ) {
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 0
EQI4 $304
ADDRLP4 76
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 0
EQI4 $304
ADDRLP4 76
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
CNSTI4 0
NEI4 $301
LABELV $304
line 523
;523:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $281
JUMPV
LABELV $301
line 525
;524:	}
;525:	return qtrue;
CNSTI4 1
RETI4
LABELV $281
endproc CG_RegisterClientSkin 80 32
proc CG_RegisterClientModelname 164 32
line 534
;526:}
;527:
;528:
;529:/*
;530:==========================
;531:CG_RegisterClientModelname
;532:==========================
;533:*/
;534:static qboolean CG_RegisterClientModelname( clientInfo_t *ci, const char *modelName, const char *skinName, const char *headModelName, const char *headSkinName, const char *teamName ) {
line 539
;535:	char	filename[MAX_QPATH];
;536:	const char		*headName;
;537:	char newTeamName[MAX_QPATH];
;538:
;539:	if ( headModelName[0] == '\0' ) {
ADDRFP4 12
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $306
line 540
;540:		headName = modelName;
ADDRLP4 64
ADDRFP4 4
INDIRP4
ASGNP4
line 541
;541:	}
ADDRGP4 $307
JUMPV
LABELV $306
line 542
;542:	else {
line 543
;543:		headName = headModelName;
ADDRLP4 64
ADDRFP4 12
INDIRP4
ASGNP4
line 544
;544:	}
LABELV $307
line 545
;545:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/lower.md3", modelName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $308
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 546
;546:	ci->legsModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 132
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
ADDRLP4 132
INDIRI4
ASGNI4
line 547
;547:	if ( !ci->legsModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 0
NEI4 $309
line 548
;548:		Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/lower.md3", modelName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $311
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 549
;549:		ci->legsModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 136
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
ADDRLP4 136
INDIRI4
ASGNI4
line 550
;550:		if ( !ci->legsModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 0
NEI4 $312
line 551
;551:			Com_Printf( "Failed to load model file %s\n", filename );
ADDRGP4 $314
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 552
;552:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $305
JUMPV
LABELV $312
line 554
;553:		}
;554:	}
LABELV $309
line 556
;555:
;556:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/upper.md3", modelName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $315
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 557
;557:	ci->torsoModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 136
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
ADDRLP4 136
INDIRI4
ASGNI4
line 558
;558:	if ( !ci->torsoModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
CNSTI4 0
NEI4 $316
line 559
;559:		Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/upper.md3", modelName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $318
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 560
;560:		ci->torsoModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 140
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
ADDRLP4 140
INDIRI4
ASGNI4
line 561
;561:		if ( !ci->torsoModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
CNSTI4 0
NEI4 $319
line 562
;562:			Com_Printf( "Failed to load model file %s\n", filename );
ADDRGP4 $314
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 563
;563:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $305
JUMPV
LABELV $319
line 565
;564:		}
;565:	}
LABELV $316
line 567
;566:
;567:	if( headName[0] == '*' ) {
ADDRLP4 64
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $321
line 568
;568:		Com_sprintf( filename, sizeof( filename ), "models/players/heads/%s/%s.md3", &headModelName[1], &headModelName[1] );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $323
ARGP4
ADDRLP4 140
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 140
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 140
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 569
;569:	}
ADDRGP4 $322
JUMPV
LABELV $321
line 570
;570:	else {
line 571
;571:		Com_sprintf( filename, sizeof( filename ), "models/players/%s/head.md3", headName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $324
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 572
;572:	}
LABELV $322
line 573
;573:	ci->headModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 140
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRLP4 140
INDIRI4
ASGNI4
line 575
;574:	// if the head model could not be found and we didn't load from the heads folder try to load from there
;575:	if ( !ci->headModel && headName[0] != '*' ) {
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
CNSTI4 0
NEI4 $325
ADDRLP4 64
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
EQI4 $325
line 576
;576:		Com_sprintf( filename, sizeof( filename ), "models/players/heads/%s/%s.md3", headModelName, headModelName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $323
ARGP4
ADDRLP4 144
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 577
;577:		ci->headModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 148
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRLP4 148
INDIRI4
ASGNI4
line 578
;578:	}
LABELV $325
line 579
;579:	if ( !ci->headModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
CNSTI4 0
NEI4 $327
line 580
;580:		Com_Printf( "Failed to load model file %s\n", filename );
ADDRGP4 $314
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 581
;581:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $305
JUMPV
LABELV $327
line 585
;582:	}
;583:
;584:	// if any skins failed to load, return failure
;585:	if ( !CG_RegisterClientSkin( ci, teamName, modelName, skinName, headName, headSkinName ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 CG_RegisterClientSkin
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
NEI4 $329
line 586
;586:		if ( teamName && *teamName) {
ADDRLP4 148
ADDRFP4 20
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $331
ADDRLP4 148
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $331
line 587
;587:			Com_Printf( "Failed to load skin file: %s : %s : %s, %s : %s\n", teamName, modelName, skinName, headName, headSkinName );
ADDRGP4 $333
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 588
;588:			if( ci->team == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 2
NEI4 $334
line 589
;589:				Com_sprintf(newTeamName, sizeof(newTeamName), "%s/", DEFAULT_BLUETEAM_NAME);
ADDRLP4 68
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $336
ARGP4
ADDRGP4 $337
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 590
;590:			}
ADDRGP4 $335
JUMPV
LABELV $334
line 591
;591:			else {
line 592
;592:				Com_sprintf(newTeamName, sizeof(newTeamName), "%s/", DEFAULT_REDTEAM_NAME);
ADDRLP4 68
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $336
ARGP4
ADDRGP4 $338
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 593
;593:			}
LABELV $335
line 594
;594:			if ( !CG_RegisterClientSkin( ci, newTeamName, modelName, skinName, headName, headSkinName ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 68
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 152
ADDRGP4 CG_RegisterClientSkin
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
NEI4 $332
line 595
;595:				Com_Printf( "Failed to load skin file: %s : %s : %s, %s : %s\n", newTeamName, modelName, skinName, headName, headSkinName );
ADDRGP4 $333
ARGP4
ADDRLP4 68
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 596
;596:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $305
JUMPV
line 598
;597:			}
;598:		} else {
LABELV $331
line 599
;599:			Com_Printf( "Failed to load skin file: %s : %s, %s : %s\n", modelName, skinName, headName, headSkinName );
ADDRGP4 $341
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 600
;600:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $305
JUMPV
LABELV $332
line 602
;601:		}
;602:	}
LABELV $329
line 605
;603:
;604:	// load the animations
;605:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/animation.cfg", modelName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $342
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 606
;606:	if ( !CG_ParseAnimationFile( filename, ci ) ) {
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 148
ADDRGP4 CG_ParseAnimationFile
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $343
line 607
;607:		Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/animation.cfg", modelName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $345
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 608
;608:		if ( !CG_ParseAnimationFile( filename, ci ) ) {
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 152
ADDRGP4 CG_ParseAnimationFile
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
NEI4 $346
line 609
;609:			Com_Printf( "Failed to load animation file %s\n", filename );
ADDRGP4 $348
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 610
;610:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $305
JUMPV
LABELV $346
line 612
;611:		}
;612:	}
LABELV $343
line 614
;613:
;614:	if ( CG_FindClientHeadFile( filename, sizeof(filename), ci, teamName, headName, headSkinName, "icon", "skin" ) ) {
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 $285
ARGP4
ADDRLP4 152
ADDRGP4 CG_FindClientHeadFile
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
EQI4 $349
line 615
;615:		ci->modelIcon = trap_R_RegisterShaderNoMip( filename );
ADDRLP4 0
ARGP4
ADDRLP4 156
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
ADDRLP4 156
INDIRI4
ASGNI4
line 616
;616:	}
ADDRGP4 $350
JUMPV
LABELV $349
line 617
;617:	else if ( CG_FindClientHeadFile( filename, sizeof(filename), ci, teamName, headName, headSkinName, "icon", "tga" ) ) {
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 $354
ARGP4
ADDRLP4 156
ADDRGP4 CG_FindClientHeadFile
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 0
EQI4 $352
line 618
;618:		ci->modelIcon = trap_R_RegisterShaderNoMip( filename );
ADDRLP4 0
ARGP4
ADDRLP4 160
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
ADDRLP4 160
INDIRI4
ASGNI4
line 619
;619:	}
LABELV $352
LABELV $350
line 621
;620:
;621:	if ( !ci->modelIcon ) {
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
CNSTI4 0
NEI4 $355
line 622
;622:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $305
JUMPV
LABELV $355
line 625
;623:	}
;624:
;625:	return qtrue;
CNSTI4 1
RETI4
LABELV $305
endproc CG_RegisterClientModelname 164 32
proc CG_IsKnownModel 92 8
line 630
;626:}
;627:
;628:
;629:/* advance this function on any new pm skin added */
;630:static qboolean CG_IsKnownModel( const char *modelName ) {
line 632
;631:
;632:	if ( Q_stricmp(modelName, "anarki") &&
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $360
ARGP4
ADDRLP4 0
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $358
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $361
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $358
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $358
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $363
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $358
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $364
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $358
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $365
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $358
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $366
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $358
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $367
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $358
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $368
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $358
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $369
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $358
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $370
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $358
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $371
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $358
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $372
ARGP4
ADDRLP4 48
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $358
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $373
ARGP4
ADDRLP4 52
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $358
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $374
ARGP4
ADDRLP4 56
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $358
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $375
ARGP4
ADDRLP4 60
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $358
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $376
ARGP4
ADDRLP4 64
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $358
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $377
ARGP4
ADDRLP4 68
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $358
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $378
ARGP4
ADDRLP4 72
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $358
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $379
ARGP4
ADDRLP4 76
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $358
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $380
ARGP4
ADDRLP4 80
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $358
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $381
ARGP4
ADDRLP4 84
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $358
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $382
ARGP4
ADDRLP4 88
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $358
line 655
;633:		 Q_stricmp(modelName, "biker") &&
;634:		 Q_stricmp(modelName, "bitterman") &&
;635:		 Q_stricmp(modelName, "bones") &&
;636:		 Q_stricmp(modelName, "crash") &&
;637:		 Q_stricmp(modelName, "doom") &&
;638:		 Q_stricmp(modelName, "grunt") &&
;639:		 Q_stricmp(modelName, "hunter") &&
;640:		 Q_stricmp(modelName, "keel") &&
;641:		 Q_stricmp(modelName, "klesk") &&
;642:		 Q_stricmp(modelName, "lucy") &&
;643:		 Q_stricmp(modelName, "major") &&
;644:		 Q_stricmp(modelName, "mynx") &&
;645:		 Q_stricmp(modelName, "orbb") &&
;646:		 Q_stricmp(modelName, "ranger") &&
;647:		 Q_stricmp(modelName, "razor") &&
;648:		 Q_stricmp(modelName, "sarge") &&
;649:		 Q_stricmp(modelName, "slash") &&
;650:		 Q_stricmp(modelName, "sorlag") &&
;651:		 Q_stricmp(modelName, "tankjr") &&
;652:		 Q_stricmp(modelName, "uriel") &&
;653:		 Q_stricmp(modelName, "visor") &&
;654:		 Q_stricmp(modelName, "xaero") )
;655:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $357
JUMPV
LABELV $358
line 657
;656:	else
;657:		return qtrue;
CNSTI4 1
RETI4
LABELV $357
endproc CG_IsKnownModel 92 8
proc CG_ColorFromChar 8 0
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVII1 4
ASGNI1
line 666
;658:}
;659:
;660:
;661:/*
;662:====================
;663:CG_ColorFromString
;664:====================
;665:*/
;666:static void CG_ColorFromChar( char v, vec3_t color ) {
line 669
;667:	int val;
;668:
;669:	val = v - '0';
ADDRLP4 0
ADDRFP4 0
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
ASGNI4
line 671
;670:
;671:	if ( val < 1 || val > 7 ) {
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $386
ADDRLP4 0
INDIRI4
CNSTI4 7
LEI4 $384
LABELV $386
line 672
;672:		VectorSet( color, 1.0f, 1.0f, 1.0f );
ADDRFP4 4
INDIRP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1065353216
ASGNF4
line 673
;673:	} else {
ADDRGP4 $385
JUMPV
LABELV $384
line 674
;674:		VectorClear( color );
ADDRFP4 4
INDIRP4
CNSTF4 0
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 675
;675:		if ( val & 1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $387
line 676
;676:			color[0] = 1.0f;
ADDRFP4 4
INDIRP4
CNSTF4 1065353216
ASGNF4
line 677
;677:		}
LABELV $387
line 678
;678:		if ( val & 2 ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $389
line 679
;679:			color[1] = 1.0f;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1065353216
ASGNF4
line 680
;680:		}
LABELV $389
line 681
;681:		if ( val & 4 ) {
ADDRLP4 0
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $391
line 682
;682:			color[2] = 1.0f;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1065353216
ASGNF4
line 683
;683:		}
LABELV $391
line 684
;684:	}
LABELV $385
line 685
;685:}
LABELV $383
endproc CG_ColorFromChar 8 0
proc CG_SetColorInfo 0 8
line 689
;686:
;687:
;688:static void CG_SetColorInfo( const char *color, clientInfo_t *info ) 
;689:{
line 690
;690:	VectorSet ( info->headColor, 1.0f, 1.0f, 1.0f );
ADDRFP4 4
INDIRP4
CNSTI4 1616
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 1620
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 1624
ADDP4
CNSTF4 1065353216
ASGNF4
line 691
;691:	VectorSet ( info->bodyColor, 1.0f, 1.0f, 1.0f );
ADDRFP4 4
INDIRP4
CNSTI4 1628
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 1632
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 1636
ADDP4
CNSTF4 1065353216
ASGNF4
line 692
;692:	VectorSet ( info->legsColor, 1.0f, 1.0f, 1.0f );
ADDRFP4 4
INDIRP4
CNSTI4 1640
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 1644
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 1648
ADDP4
CNSTF4 1065353216
ASGNF4
line 694
;693:	
;694:	if ( !color[0] )
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $394
line 695
;695:		return;
ADDRGP4 $393
JUMPV
LABELV $394
line 696
;696:	CG_ColorFromChar( color[0], info->headColor );
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 1616
ADDP4
ARGP4
ADDRGP4 CG_ColorFromChar
CALLV
pop
line 698
;697:	
;698:	if ( !color[1] )
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $396
line 699
;699:		return;
ADDRGP4 $393
JUMPV
LABELV $396
line 700
;700:	CG_ColorFromChar( color[1], info->bodyColor );
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 1628
ADDP4
ARGP4
ADDRGP4 CG_ColorFromChar
CALLV
pop
line 702
;701:
;702:	if ( !color[2] )
ADDRFP4 0
INDIRP4
CNSTI4 2
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $398
line 703
;703:		return;
ADDRGP4 $393
JUMPV
LABELV $398
line 704
;704:	CG_ColorFromChar( color[2], info->legsColor );
ADDRFP4 0
INDIRP4
CNSTI4 2
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 1640
ADDP4
ARGP4
ADDRGP4 CG_ColorFromChar
CALLV
pop
line 707
;705:
;706:	// override color1/color2 if specified
;707:	if ( !color[3] )
ADDRFP4 0
INDIRP4
CNSTI4 3
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $400
line 708
;708:		return;
ADDRGP4 $393
JUMPV
LABELV $400
line 709
;709:	CG_ColorFromChar( color[3], info->color1 );
ADDRFP4 0
INDIRP4
CNSTI4 3
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
ARGP4
ADDRGP4 CG_ColorFromChar
CALLV
pop
line 711
;710:
;711:	if ( !color[4] )
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $402
line 712
;712:		return;
ADDRGP4 $393
JUMPV
LABELV $402
line 713
;713:	CG_ColorFromChar( color[4], info->color2 );
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 56
ADDP4
ARGP4
ADDRGP4 CG_ColorFromChar
CALLV
pop
line 714
;714:}
LABELV $393
endproc CG_SetColorInfo 0 8
bss
align 1
LABELV $405
skip 6
code
proc CG_GetTeamColors 8 12
line 717
;715:
;716:
;717:static const char *CG_GetTeamColors( const char *color, team_t team ) {
line 720
;718:	static char str[6];
;719:
;720:	Q_strncpyz( str, color, sizeof( str ) );
ADDRGP4 $405
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 722
;721:
;722:	switch ( team ) {
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $411
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $409
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $410
ADDRGP4 $407
JUMPV
LABELV $409
line 723
;723:		case TEAM_RED:  replace1( '?', '1', str ); break;
CNSTI4 63
ARGI4
CNSTI4 49
ARGI4
ADDRGP4 $405
ARGP4
ADDRGP4 replace1
CALLI4
pop
ADDRGP4 $407
JUMPV
LABELV $410
line 724
;724:		case TEAM_BLUE: replace1( '?', '4', str ); break;
CNSTI4 63
ARGI4
CNSTI4 52
ARGI4
ADDRGP4 $405
ARGP4
ADDRGP4 replace1
CALLI4
pop
ADDRGP4 $407
JUMPV
LABELV $411
line 725
;725:		case TEAM_FREE: replace1( '?', '7', str ); break;
CNSTI4 63
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 $405
ARGP4
ADDRGP4 replace1
CALLI4
pop
line 726
;726:		default: break;
LABELV $407
line 729
;727:    }
;728:
;729:	return str;
ADDRGP4 $405
RETP4
LABELV $404
endproc CG_GetTeamColors 8 12
proc CG_LoadClientInfo 404 24
line 741
;730:}
;731:
;732:
;733:/*
;734:===================
;735:CG_LoadClientInfo
;736:
;737:Load it now, taking the disk hits.
;738:This will usually be deferred to a safe time
;739:===================
;740:*/
;741:static void CG_LoadClientInfo( clientInfo_t *ci ) {
line 749
;742:	const char	*dir;
;743:	int			i, modelloaded;
;744:	const char	*s;
;745:	int			clientNum;
;746:	char		teamname[MAX_QPATH];
;747:	char		vertexlit[MAX_CVAR_VALUE_STRING];
;748:
;749:	teamname[0] = '\0';
ADDRLP4 276
CNSTI1 0
ASGNI1
line 752
;750:
;751:	// disable vertexlight for colored skins
;752:	trap_Cvar_VariableStringBuffer( "r_vertexlight", vertexlit, sizeof( vertexlit ) );
ADDRGP4 $413
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 753
;753:	if ( vertexlit[0] && vertexlit[0] != '0' ) {
ADDRLP4 340
ADDRLP4 16
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 340
INDIRI4
CNSTI4 0
EQI4 $414
ADDRLP4 340
INDIRI4
CNSTI4 48
EQI4 $414
line 754
;754:		trap_Cvar_Set( "r_vertexlight", "0" );
ADDRGP4 $413
ARGP4
ADDRGP4 $416
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 755
;755:	}
LABELV $414
line 757
;756:
;757:	if( cgs.gametype >= GT_TDM) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $417
line 758
;758:		if( ci->team == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 2
NEI4 $420
line 759
;759:			Q_strncpyz(teamname, cg_blueTeamName.string, sizeof(teamname) );
ADDRLP4 276
ARGP4
ADDRGP4 cg_blueTeamName+16
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 760
;760:		} else {
ADDRGP4 $421
JUMPV
LABELV $420
line 761
;761:			Q_strncpyz(teamname, cg_redTeamName.string, sizeof(teamname) );
ADDRLP4 276
ARGP4
ADDRGP4 cg_redTeamName+16
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 762
;762:		}
LABELV $421
line 763
;763:	}
LABELV $417
line 764
;764:	if( teamname[0] ) {
ADDRLP4 276
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $424
line 765
;765:		strcat( teamname, "/" );
ADDRLP4 276
ARGP4
ADDRGP4 $426
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 766
;766:	}
LABELV $424
line 768
;767:
;768:	modelloaded = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 769
;769:	if ( !CG_RegisterClientModelname( ci, ci->modelName, ci->skinName, ci->headModelName, ci->headSkinName, teamname ) ) {
ADDRLP4 344
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 344
INDIRP4
ARGP4
ADDRLP4 344
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRLP4 344
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 344
INDIRP4
CNSTI4 256
ADDP4
ARGP4
ADDRLP4 344
INDIRP4
CNSTI4 320
ADDP4
ARGP4
ADDRLP4 276
ARGP4
ADDRLP4 348
ADDRGP4 CG_RegisterClientModelname
CALLI4
ASGNI4
ADDRLP4 348
INDIRI4
CNSTI4 0
NEI4 $427
line 770
;770:		if ( cg_buildScript.integer ) {
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $429
line 771
;771:			CG_Error( "CG_RegisterClientModelname( %s, %s, %s, %s %s ) failed", ci->modelName, ci->skinName, ci->headModelName, ci->headSkinName, teamname );
ADDRGP4 $432
ARGP4
ADDRLP4 352
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 352
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRLP4 352
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 352
INDIRP4
CNSTI4 256
ADDP4
ARGP4
ADDRLP4 352
INDIRP4
CNSTI4 320
ADDP4
ARGP4
ADDRLP4 276
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 772
;772:		}
LABELV $429
line 775
;773:
;774:		// fall back to default team name
;775:		if( cgs.gametype >= GT_TDM) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $433
line 777
;776:			// keep skin name
;777:			if( ci->team == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 2
NEI4 $436
line 778
;778:				Q_strncpyz(teamname, DEFAULT_BLUETEAM_NAME, sizeof(teamname) );
ADDRLP4 276
ARGP4
ADDRGP4 $337
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 779
;779:			} else {
ADDRGP4 $437
JUMPV
LABELV $436
line 780
;780:				Q_strncpyz(teamname, DEFAULT_REDTEAM_NAME, sizeof(teamname) );
ADDRLP4 276
ARGP4
ADDRGP4 $338
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 781
;781:			}
LABELV $437
line 782
;782:			if ( !CG_RegisterClientModelname( ci, DEFAULT_MODEL, ci->skinName, DEFAULT_MODEL, ci->skinName, teamname ) ) {
ADDRLP4 352
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 352
INDIRP4
ARGP4
ADDRLP4 356
ADDRGP4 $376
ASGNP4
ADDRLP4 356
INDIRP4
ARGP4
ADDRLP4 352
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 356
INDIRP4
ARGP4
ADDRLP4 352
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 276
ARGP4
ADDRLP4 360
ADDRGP4 CG_RegisterClientModelname
CALLI4
ASGNI4
ADDRLP4 360
INDIRI4
CNSTI4 0
NEI4 $434
line 783
;783:				CG_Error( "DEFAULT_TEAM_MODEL / skin (%s/%s) failed to register", DEFAULT_MODEL, ci->skinName );
ADDRGP4 $440
ARGP4
ADDRGP4 $376
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 784
;784:			}
line 785
;785:		} else {
ADDRGP4 $434
JUMPV
LABELV $433
line 786
;786:			if ( !CG_RegisterClientModelname( ci, DEFAULT_MODEL, "default", DEFAULT_MODEL, "default", teamname ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 352
ADDRGP4 $376
ASGNP4
ADDRLP4 352
INDIRP4
ARGP4
ADDRLP4 356
ADDRGP4 $121
ASGNP4
ADDRLP4 356
INDIRP4
ARGP4
ADDRLP4 352
INDIRP4
ARGP4
ADDRLP4 356
INDIRP4
ARGP4
ADDRLP4 276
ARGP4
ADDRLP4 360
ADDRGP4 CG_RegisterClientModelname
CALLI4
ASGNI4
ADDRLP4 360
INDIRI4
CNSTI4 0
NEI4 $441
line 787
;787:				CG_Error( "DEFAULT_MODEL (%s) failed to register", DEFAULT_MODEL );
ADDRGP4 $443
ARGP4
ADDRGP4 $376
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 788
;788:			}
LABELV $441
line 789
;789:		}
LABELV $434
line 790
;790:		modelloaded = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 791
;791:	}
LABELV $427
line 793
;792:
;793:	ci->newAnims = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 388
ADDP4
CNSTI4 0
ASGNI4
line 794
;794:	if ( ci->torsoModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
CNSTI4 0
EQI4 $444
line 797
;795:		orientation_t tag;
;796:		// if the torso model has the "tag_flag"
;797:		if ( trap_R_LerpTag( &tag, ci->torsoModel, 0, 0, 1, "tag_flag" ) ) {
ADDRLP4 352
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 $448
ARGP4
ADDRLP4 400
ADDRGP4 trap_R_LerpTag
CALLI4
ASGNI4
ADDRLP4 400
INDIRI4
CNSTI4 0
EQI4 $446
line 798
;798:			ci->newAnims = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 388
ADDP4
CNSTI4 1
ASGNI4
line 799
;799:		}
LABELV $446
line 800
;800:	}
LABELV $444
line 803
;801:
;802:	// sounds
;803:	dir = ci->modelName;
ADDRLP4 272
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ASGNP4
line 805
;804:
;805:	for ( i = 0 ; i < MAX_CUSTOM_SOUNDS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $449
line 806
;806:		s = cg_customSoundNames[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_customSoundNames
ADDP4
INDIRP4
ASGNP4
line 807
;807:		if ( !s ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $453
line 808
;808:			break;
ADDRGP4 $451
JUMPV
LABELV $453
line 810
;809:		}
;810:		ci->sounds[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1484
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 812
;811:		// if the model didn't load use the sounds of the default model
;812:		if (modelloaded) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $455
line 813
;813:			ci->sounds[i] = trap_S_RegisterSound( va("sound/player/%s/%s", dir, s + 1), qfalse );
ADDRGP4 $457
ARGP4
ADDRLP4 272
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 352
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 352
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 356
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1484
ADDP4
ADDP4
ADDRLP4 356
INDIRI4
ASGNI4
line 814
;814:		}
LABELV $455
line 815
;815:		if ( !ci->sounds[i] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1484
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $458
line 816
;816:			ci->sounds[i] = trap_S_RegisterSound( va("sound/player/%s/%s", DEFAULT_MODEL, s + 1), qfalse );
ADDRGP4 $457
ARGP4
ADDRGP4 $376
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 352
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 352
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 356
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1484
ADDP4
ADDP4
ADDRLP4 356
INDIRI4
ASGNI4
line 817
;817:		}
LABELV $458
line 818
;818:	}
LABELV $450
line 805
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $449
LABELV $451
line 820
;819:
;820:	ci->deferred = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 0
ASGNI4
line 824
;821:
;822:	// reset any existing players and bodies, because they might be in bad
;823:	// frames for this new model
;824:	clientNum = ci - cgs.clientinfo;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 cgs+40996
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1652
DIVI4
ASGNI4
line 825
;825:	for ( i = 0 ; i < MAX_GENTITIES ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $461
line 826
;826:		if ( cg_entities[i].currentState.clientNum == clientNum
ADDRLP4 0
INDIRI4
CNSTI4 740
MULI4
ADDRGP4 cg_entities+168
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $465
ADDRLP4 0
INDIRI4
CNSTI4 740
MULI4
ADDRGP4 cg_entities+4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $465
line 827
;827:			&& cg_entities[i].currentState.eType == ET_PLAYER ) {
line 828
;828:			CG_ResetPlayerEntity( &cg_entities[i] );
ADDRLP4 0
INDIRI4
CNSTI4 740
MULI4
ADDRGP4 cg_entities
ADDP4
ARGP4
ADDRGP4 CG_ResetPlayerEntity
CALLV
pop
line 829
;829:		}
LABELV $465
line 830
;830:	}
LABELV $462
line 825
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $461
line 833
;831:
;832:	// restore vertexlight mode
;833:	if ( vertexlit[0] && vertexlit[0] != '0' ) {
ADDRLP4 352
ADDRLP4 16
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 352
INDIRI4
CNSTI4 0
EQI4 $469
ADDRLP4 352
INDIRI4
CNSTI4 48
EQI4 $469
line 834
;834:		trap_Cvar_Set( "r_vertexlight", vertexlit );
ADDRGP4 $413
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 835
;835:	}
LABELV $469
line 836
;836:}
LABELV $412
endproc CG_LoadClientInfo 404 24
proc CG_CopyClientInfoModel 0 12
line 844
;837:
;838:
;839:/*
;840:======================
;841:CG_CopyClientInfoModel
;842:======================
;843:*/
;844:static void CG_CopyClientInfoModel( const clientInfo_t *from, clientInfo_t *to ) {
line 845
;845:	VectorCopy( from->headOffset, to->headOffset );
ADDRFP4 4
INDIRP4
CNSTI4 400
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 400
ADDP4
INDIRB
ASGNB 12
line 846
;846:	to->footsteps = from->footsteps;
ADDRFP4 4
INDIRP4
CNSTI4 412
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ASGNI4
line 847
;847:	to->gender = from->gender;
ADDRFP4 4
INDIRP4
CNSTI4 416
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
ASGNI4
line 849
;848:
;849:	to->legsModel = from->legsModel;
ADDRFP4 4
INDIRP4
CNSTI4 420
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
ASGNI4
line 850
;850:	to->legsSkin = from->legsSkin;
ADDRFP4 4
INDIRP4
CNSTI4 424
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
ASGNI4
line 851
;851:	to->torsoModel = from->torsoModel;
ADDRFP4 4
INDIRP4
CNSTI4 428
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
ASGNI4
line 852
;852:	to->torsoSkin = from->torsoSkin;
ADDRFP4 4
INDIRP4
CNSTI4 432
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
ASGNI4
line 853
;853:	to->headModel = from->headModel;
ADDRFP4 4
INDIRP4
CNSTI4 436
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
ASGNI4
line 854
;854:	to->headSkin = from->headSkin;
ADDRFP4 4
INDIRP4
CNSTI4 440
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
ASGNI4
line 855
;855:	to->modelIcon = from->modelIcon;
ADDRFP4 4
INDIRP4
CNSTI4 444
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
ASGNI4
line 857
;856:
;857:	to->newAnims = from->newAnims;
ADDRFP4 4
INDIRP4
CNSTI4 388
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
ASGNI4
line 858
;858:	to->coloredSkin = from->coloredSkin;
ADDRFP4 4
INDIRP4
CNSTI4 1612
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1612
ADDP4
INDIRI4
ASGNI4
line 860
;859:
;860:	memcpy( to->animations, from->animations, sizeof( to->animations ) );
ADDRFP4 4
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
ARGP4
CNSTI4 1036
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 861
;861:	memcpy( to->sounds, from->sounds, sizeof( to->sounds ) );
ADDRFP4 4
INDIRP4
CNSTI4 1484
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1484
ADDP4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 862
;862:}
LABELV $471
endproc CG_CopyClientInfoModel 0 12
proc CG_ScanForExistingClientInfo 24 8
line 870
;863:
;864:
;865:/*
;866:======================
;867:CG_ScanForExistingClientInfo
;868:======================
;869:*/
;870:static qboolean CG_ScanForExistingClientInfo( clientInfo_t *ci ) {
line 874
;871:	int		i;
;872:	clientInfo_t	*match;
;873:
;874:	for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $476
JUMPV
LABELV $473
line 875
;875:		match = &cgs.clientinfo[ i ];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 876
;876:		if ( !match->infoValid ) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $479
line 877
;877:			continue;
ADDRGP4 $474
JUMPV
LABELV $479
line 879
;878:		}
;879:		if ( match->deferred ) {
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 0
EQI4 $481
line 880
;880:			continue;
ADDRGP4 $474
JUMPV
LABELV $481
line 882
;881:		}
;882:		if ( !Q_stricmp( ci->modelName, match->modelName )
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $483
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $483
ADDRFP4 0
INDIRP4
CNSTI4 256
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $483
ADDRFP4 0
INDIRP4
CNSTI4 320
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $483
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $486
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
NEI4 $483
LABELV $486
line 888
;883:			&& !Q_stricmp( ci->skinName, match->skinName )
;884:			&& !Q_stricmp( ci->headModelName, match->headModelName )
;885:			&& !Q_stricmp( ci->headSkinName, match->headSkinName ) 
;886:			//&& !Q_stricmp( ci->blueTeam, match->blueTeam ) 
;887:			//&& !Q_stricmp( ci->redTeam, match->redTeam )
;888:			&& (cgs.gametype < GT_TDM || ci->team == match->team) ) {
line 891
;889:			// this clientinfo is identical, so use it's handles
;890:
;891:			ci->deferred = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 0
ASGNI4
line 893
;892:
;893:			CG_CopyClientInfoModel( match, ci );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CopyClientInfoModel
CALLV
pop
line 895
;894:
;895:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $472
JUMPV
LABELV $483
line 897
;896:		}
;897:	}
LABELV $474
line 874
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $476
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+31504
INDIRI4
LTI4 $473
line 900
;898:
;899:	// nothing matches, so defer the load
;900:	return qfalse;
CNSTI4 0
RETI4
LABELV $472
endproc CG_ScanForExistingClientInfo 24 8
proc CG_SetDeferredClientInfo 20 8
line 912
;901:}
;902:
;903:
;904:/*
;905:======================
;906:CG_SetDeferredClientInfo
;907:
;908:We aren't going to load it now, so grab some other
;909:client's info to use until we have some spare time.
;910:======================
;911:*/
;912:static void CG_SetDeferredClientInfo( clientInfo_t *ci ) {
line 918
;913:	int		i;
;914:	clientInfo_t	*match;
;915:
;916:	// if someone else is already the same models and skins we
;917:	// can just load the client info
;918:	for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $491
JUMPV
LABELV $488
line 919
;919:		match = &cgs.clientinfo[ i ];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 920
;920:		if ( !match->infoValid || match->deferred ) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $496
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 0
EQI4 $494
LABELV $496
line 921
;921:			continue;
ADDRGP4 $489
JUMPV
LABELV $494
line 923
;922:		}
;923:		if ( Q_stricmp( ci->skinName, match->skinName ) ||
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $501
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $501
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $497
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
EQI4 $497
LABELV $501
line 927
;924:			 Q_stricmp( ci->modelName, match->modelName ) ||
;925://			 Q_stricmp( ci->headModelName, match->headModelName ) ||
;926://			 Q_stricmp( ci->headSkinName, match->headSkinName ) ||
;927:			 (cgs.gametype >= GT_TDM && ci->team != match->team) ) {
line 928
;928:			continue;
ADDRGP4 $489
JUMPV
LABELV $497
line 931
;929:		}
;930:		// just load the real info cause it uses the same models and skins
;931:		CG_LoadClientInfo( ci );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 932
;932:		return;
ADDRGP4 $487
JUMPV
LABELV $489
line 918
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $491
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+31504
INDIRI4
LTI4 $488
line 936
;933:	}
;934:
;935:	// if we are in teamplay, only grab a model if the skin is correct
;936:	if ( cgs.gametype >= GT_TDM ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $502
line 937
;937:		for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $508
JUMPV
LABELV $505
line 938
;938:			match = &cgs.clientinfo[ i ];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 939
;939:			if ( !match->infoValid || match->deferred ) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $513
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 0
EQI4 $511
LABELV $513
line 940
;940:				continue;
ADDRGP4 $506
JUMPV
LABELV $511
line 942
;941:			}
;942:			if ( Q_stricmp( ci->skinName, match->skinName ) ||
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $517
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $514
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
EQI4 $514
LABELV $517
line 943
;943:				(cgs.gametype >= GT_TDM && ci->team != match->team) ) {
line 944
;944:				continue;
ADDRGP4 $506
JUMPV
LABELV $514
line 946
;945:			}
;946:			ci->deferred = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 1
ASGNI4
line 947
;947:			CG_CopyClientInfoModel( match, ci );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CopyClientInfoModel
CALLV
pop
line 948
;948:			return;
ADDRGP4 $487
JUMPV
LABELV $506
line 937
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $508
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+31504
INDIRI4
LTI4 $505
line 954
;949:		}
;950:		// load the full model, because we don't ever want to show
;951:		// an improper team skin.  This will cause a hitch for the first
;952:		// player, when the second enters.  Combat shouldn't be going on
;953:		// yet, so it shouldn't matter
;954:		CG_LoadClientInfo( ci );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 955
;955:		return;
ADDRGP4 $487
JUMPV
LABELV $502
line 959
;956:	}
;957:
;958:	// find the first valid clientinfo and grab its stuff
;959:	for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $521
JUMPV
LABELV $518
line 960
;960:		match = &cgs.clientinfo[ i ];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 961
;961:		if ( !match->infoValid ) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $524
line 962
;962:			continue;
ADDRGP4 $519
JUMPV
LABELV $524
line 965
;963:		}
;964:
;965:		ci->deferred = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 1
ASGNI4
line 966
;966:		CG_CopyClientInfoModel( match, ci );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CopyClientInfoModel
CALLV
pop
line 967
;967:		return;
ADDRGP4 $487
JUMPV
LABELV $519
line 959
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $521
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+31504
INDIRI4
LTI4 $518
line 971
;968:	}
;969:
;970:	// we should never get here...
;971:	CG_Printf( "CG_SetDeferredClientInfo: no valid clients!\n" );
ADDRGP4 $526
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 973
;972:
;973:	CG_LoadClientInfo( ci );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 974
;974:}
LABELV $487
endproc CG_SetDeferredClientInfo 20 8
proc CG_SetSkinAndModel 188 12
line 985
;975:
;976:
;977:static void CG_SetSkinAndModel( clientInfo_t *newInfo,
;978:		clientInfo_t *curInfo,
;979:		const char *infomodel,
;980:		qboolean allowNativeModel,
;981:		int clientNum, int myClientNum,
;982:		team_t myTeam, qboolean setColor,
;983:		char *modelName, int modelNameSize,
;984:		char *skinName, int skinNameSize ) 
;985:{
line 993
;986:	char modelStr[ MAX_QPATH ];
;987:	char newSkin[ MAX_QPATH ];
;988:	char *skin, *slash;
;989:	qboolean	pm_model;
;990:	team_t		team;
;991:	const char	*colors;
;992:	
;993:	team = newInfo->team;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
line 994
;994:	pm_model = ( Q_stricmp( cg_enemyModel.string, PM_SKIN ) == 0 ) ? qtrue : qfalse;
ADDRGP4 cg_enemyModel+16
ARGP4
ADDRGP4 $208
ARGP4
ADDRLP4 152
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
NEI4 $530
ADDRLP4 148
CNSTI4 1
ASGNI4
ADDRGP4 $531
JUMPV
LABELV $530
ADDRLP4 148
CNSTI4 0
ASGNI4
LABELV $531
ADDRLP4 8
ADDRLP4 148
INDIRI4
ASGNI4
line 996
;995:
;996:	if ( cg_forceModel.integer || cg_enemyModel.string[0] || cg_teamModel.string[0] )
ADDRGP4 cg_forceModel+12
INDIRI4
CNSTI4 0
NEI4 $538
ADDRGP4 cg_enemyModel+16
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $538
ADDRGP4 cg_teamModel+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $532
LABELV $538
line 997
;997:	{
line 998
;998:		if ( cgs.gametype >= GT_TDM )
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $539
line 999
;999:		{
line 1001
;1000:			// enemy model
;1001:			if ( cg_enemyModel.string[0] && team != myTeam && team != TEAM_SPECTATOR ) {
ADDRGP4 cg_enemyModel+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $542
ADDRLP4 156
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 156
INDIRI4
ADDRFP4 24
INDIRI4
EQI4 $542
ADDRLP4 156
INDIRI4
CNSTI4 3
EQI4 $542
line 1002
;1002:				if ( pm_model )
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $545
line 1003
;1003:					Q_strncpyz( modelName, infomodel, modelNameSize );
ADDRFP4 32
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRGP4 $546
JUMPV
LABELV $545
line 1005
;1004:				else
;1005:					Q_strncpyz( modelName, cg_enemyModel.string, modelNameSize );
ADDRFP4 32
INDIRP4
ARGP4
ADDRGP4 cg_enemyModel+16
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
LABELV $546
line 1007
;1006:
;1007:				skin = strchr( modelName, '/' );
ADDRFP4 32
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 160
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 160
INDIRP4
ASGNP4
line 1009
;1008:				// force skin
;1009:				strcpy( newSkin, PM_SKIN );
ADDRLP4 16
ARGP4
ADDRGP4 $208
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1010
;1010:				if ( skin )
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $548
line 1011
;1011:					*skin = '\0';
ADDRLP4 12
INDIRP4
CNSTI1 0
ASGNI1
LABELV $548
line 1013
;1012:
;1013:				if ( pm_model && !CG_IsKnownModel( modelName ) ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $550
ADDRFP4 32
INDIRP4
ARGP4
ADDRLP4 164
ADDRGP4 CG_IsKnownModel
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
NEI4 $550
line 1015
;1014:					// revert to default model if specified skin is not known
;1015:					Q_strncpyz( modelName, "sarge", modelNameSize );
ADDRFP4 32
INDIRP4
ARGP4
ADDRGP4 $376
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1016
;1016:				}
LABELV $550
line 1017
;1017:				Q_strncpyz( skinName, newSkin, skinNameSize );
ADDRFP4 40
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1019
;1018:
;1019:				if ( setColor ) {
ADDRFP4 28
INDIRI4
CNSTI4 0
EQI4 $533
line 1020
;1020:					if ( cg_enemyColors.string[0] && myTeam != TEAM_SPECTATOR ) // free-fly?
ADDRGP4 cg_enemyColors+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $554
ADDRFP4 24
INDIRI4
CNSTI4 3
EQI4 $554
line 1021
;1021:						colors = CG_GetTeamColors( cg_enemyColors.string, newInfo->team );
ADDRGP4 cg_enemyColors+16
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRLP4 168
ADDRGP4 CG_GetTeamColors
CALLP4
ASGNP4
ADDRLP4 80
ADDRLP4 168
INDIRP4
ASGNP4
ADDRGP4 $555
JUMPV
LABELV $554
line 1023
;1022:					else
;1023:						colors = CG_GetTeamColors( "???", newInfo->team );
ADDRGP4 $558
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRLP4 172
ADDRGP4 CG_GetTeamColors
CALLP4
ASGNP4
ADDRLP4 80
ADDRLP4 172
INDIRP4
ASGNP4
LABELV $555
line 1025
;1024:
;1025:					CG_SetColorInfo( colors, newInfo );
ADDRLP4 80
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetColorInfo
CALLV
pop
line 1026
;1026:					newInfo->coloredSkin = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 1612
ADDP4
CNSTI4 1
ASGNI4
line 1027
;1027:				}
line 1029
;1028:
;1029:			} else if ( cg_teamModel.string[0] && team == myTeam && team != TEAM_SPECTATOR && clientNum != myClientNum ) {
ADDRGP4 $533
JUMPV
LABELV $542
ADDRGP4 cg_teamModel+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $559
ADDRLP4 160
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 160
INDIRI4
ADDRFP4 24
INDIRI4
NEI4 $559
ADDRLP4 160
INDIRI4
CNSTI4 3
EQI4 $559
ADDRFP4 16
INDIRI4
ADDRFP4 20
INDIRI4
EQI4 $559
line 1031
;1030:				// teammodel
;1031:				pm_model = ( Q_stricmp( cg_teamModel.string, PM_SKIN ) == 0 ) ? qtrue : qfalse;
ADDRGP4 cg_teamModel+16
ARGP4
ADDRGP4 $208
ARGP4
ADDRLP4 168
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 0
NEI4 $564
ADDRLP4 164
CNSTI4 1
ASGNI4
ADDRGP4 $565
JUMPV
LABELV $564
ADDRLP4 164
CNSTI4 0
ASGNI4
LABELV $565
ADDRLP4 8
ADDRLP4 164
INDIRI4
ASGNI4
line 1033
;1032:
;1033:				if ( pm_model )
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $566
line 1034
;1034:					Q_strncpyz( modelName, infomodel, modelNameSize );
ADDRFP4 32
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRGP4 $567
JUMPV
LABELV $566
line 1036
;1035:				else
;1036:					Q_strncpyz( modelName, cg_teamModel.string, modelNameSize );
ADDRFP4 32
INDIRP4
ARGP4
ADDRGP4 cg_teamModel+16
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
LABELV $567
line 1038
;1037:
;1038:				skin = strchr( modelName, '/' );
ADDRFP4 32
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 172
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 172
INDIRP4
ASGNP4
line 1040
;1039:				// force skin
;1040:				strcpy( newSkin, PM_SKIN );
ADDRLP4 16
ARGP4
ADDRGP4 $208
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1041
;1041:				if ( skin )
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $569
line 1042
;1042:					*skin = '\0';
ADDRLP4 12
INDIRP4
CNSTI1 0
ASGNI1
LABELV $569
line 1044
;1043:
;1044:				if ( pm_model && !CG_IsKnownModel( modelName ) ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $571
ADDRFP4 32
INDIRP4
ARGP4
ADDRLP4 176
ADDRGP4 CG_IsKnownModel
CALLI4
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 0
NEI4 $571
line 1046
;1045:					// revert to default model if specified skin is not known
;1046:					Q_strncpyz( modelName, "sarge", modelNameSize );
ADDRFP4 32
INDIRP4
ARGP4
ADDRGP4 $376
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1047
;1047:				}
LABELV $571
line 1048
;1048:				Q_strncpyz( skinName, newSkin, skinNameSize );
ADDRFP4 40
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1050
;1049:
;1050:				if ( setColor ) {
ADDRFP4 28
INDIRI4
CNSTI4 0
EQI4 $533
line 1051
;1051:					if ( cg_teamColors.string[0] && myTeam != TEAM_SPECTATOR ) // free-fly?
ADDRGP4 cg_teamColors+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $575
ADDRFP4 24
INDIRI4
CNSTI4 3
EQI4 $575
line 1052
;1052:						colors = CG_GetTeamColors( cg_teamColors.string, newInfo->team );
ADDRGP4 cg_teamColors+16
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRLP4 180
ADDRGP4 CG_GetTeamColors
CALLP4
ASGNP4
ADDRLP4 80
ADDRLP4 180
INDIRP4
ASGNP4
ADDRGP4 $576
JUMPV
LABELV $575
line 1054
;1053:					else
;1054:						colors = CG_GetTeamColors( "???", newInfo->team );
ADDRGP4 $558
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRLP4 184
ADDRGP4 CG_GetTeamColors
CALLP4
ASGNP4
ADDRLP4 80
ADDRLP4 184
INDIRP4
ASGNP4
LABELV $576
line 1056
;1055:
;1056:					CG_SetColorInfo( colors, newInfo );
ADDRLP4 80
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetColorInfo
CALLV
pop
line 1057
;1057:					newInfo->coloredSkin = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 1612
ADDP4
CNSTI4 1
ASGNI4
line 1058
;1058:				}
line 1060
;1059:
;1060:			} else {
ADDRGP4 $533
JUMPV
LABELV $559
line 1062
;1061:				// forcemodel etc.
;1062:				if ( cg_forceModel.integer ) {
ADDRGP4 cg_forceModel+12
INDIRI4
CNSTI4 0
EQI4 $579
line 1064
;1063:
;1064:					trap_Cvar_VariableStringBuffer( "model", modelStr, sizeof( modelStr ) );
ADDRGP4 $582
ARGP4
ADDRLP4 84
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1065
;1065:					if ( ( skin = strchr( modelStr, '/' ) ) == NULL) {
ADDRLP4 84
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 164
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 164
INDIRP4
ASGNP4
ADDRLP4 164
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $583
line 1066
;1066:						skin = "default";
ADDRLP4 12
ADDRGP4 $121
ASGNP4
line 1067
;1067:					} else {
ADDRGP4 $584
JUMPV
LABELV $583
line 1068
;1068:						*skin++ = '\0';
ADDRLP4 168
ADDRLP4 12
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 168
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 168
INDIRP4
CNSTI1 0
ASGNI1
line 1069
;1069:					}
LABELV $584
line 1071
;1070:
;1071:					Q_strncpyz( skinName, skin, skinNameSize );
ADDRFP4 40
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1072
;1072:					Q_strncpyz( modelName, modelStr, modelNameSize );
ADDRFP4 32
INDIRP4
ARGP4
ADDRLP4 84
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1074
;1073:
;1074:				} else {
ADDRGP4 $533
JUMPV
LABELV $579
line 1075
;1075:					Q_strncpyz( modelName, infomodel, modelNameSize );
ADDRFP4 32
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1076
;1076:					slash = strchr( modelName, '/' );
ADDRFP4 32
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 164
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 164
INDIRP4
ASGNP4
line 1077
;1077:					if ( !slash ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $585
line 1078
;1078:						Q_strncpyz( skinName, "default", skinNameSize );
ADDRFP4 40
INDIRP4
ARGP4
ADDRGP4 $121
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1079
;1079:					} else {
ADDRGP4 $533
JUMPV
LABELV $585
line 1080
;1080:						Q_strncpyz( skinName, slash + 1, skinNameSize );
ADDRFP4 40
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1081
;1081:						*slash = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1082
;1082:					}
line 1083
;1083:				}
line 1084
;1084:			}
line 1085
;1085:		} else { // not team game
ADDRGP4 $533
JUMPV
LABELV $539
line 1087
;1086:
;1087:			if ( pm_model && myClientNum != clientNum && cgs.gametype != GT_CAMPAIGN ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $587
ADDRFP4 20
INDIRI4
ADDRFP4 16
INDIRI4
EQI4 $587
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 0
EQI4 $587
line 1088
;1088:				Q_strncpyz( modelName, infomodel, modelNameSize );
ADDRFP4 32
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1091
;1089:
;1090:				// strip skin name from model name
;1091:				slash = strchr( modelName, '/' );
ADDRFP4 32
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 156
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 156
INDIRP4
ASGNP4
line 1092
;1092:				if ( !slash ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $590
line 1093
;1093:					Q_strncpyz( skinName, PM_SKIN, skinNameSize );
ADDRFP4 40
INDIRP4
ARGP4
ADDRGP4 $208
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1094
;1094:				} else {
ADDRGP4 $591
JUMPV
LABELV $590
line 1095
;1095:					Q_strncpyz( skinName, PM_SKIN, skinNameSize );
ADDRFP4 40
INDIRP4
ARGP4
ADDRGP4 $208
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1096
;1096:					*slash = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1097
;1097:				}
LABELV $591
line 1099
;1098:
;1099:				if ( !CG_IsKnownModel( modelName ) )
ADDRFP4 32
INDIRP4
ARGP4
ADDRLP4 160
ADDRGP4 CG_IsKnownModel
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
NEI4 $592
line 1100
;1100:					Q_strncpyz( modelName, "sarge", modelNameSize );
ADDRFP4 32
INDIRP4
ARGP4
ADDRGP4 $376
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
LABELV $592
line 1102
;1101:
;1102:				if ( setColor ) {
ADDRFP4 28
INDIRI4
CNSTI4 0
EQI4 $533
line 1103
;1103:					colors = CG_GetTeamColors( cg_enemyColors.string, newInfo->team );
ADDRGP4 cg_enemyColors+16
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRLP4 164
ADDRGP4 CG_GetTeamColors
CALLP4
ASGNP4
ADDRLP4 80
ADDRLP4 164
INDIRP4
ASGNP4
line 1104
;1104:					CG_SetColorInfo( colors, newInfo );
ADDRLP4 80
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetColorInfo
CALLV
pop
line 1105
;1105:					newInfo->coloredSkin = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 1612
ADDP4
CNSTI4 1
ASGNI4
line 1106
;1106:				}
line 1108
;1107:
;1108:			} else if ( cg_enemyModel.string[0] && myClientNum != clientNum && !allowNativeModel && cgs.gametype != GT_CAMPAIGN ) {
ADDRGP4 $533
JUMPV
LABELV $587
ADDRGP4 cg_enemyModel+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $597
ADDRFP4 20
INDIRI4
ADDRFP4 16
INDIRI4
EQI4 $597
ADDRFP4 12
INDIRI4
CNSTI4 0
NEI4 $597
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 0
EQI4 $597
line 1110
;1109:
;1110:				Q_strncpyz( modelName, cg_enemyModel.string, modelNameSize );
ADDRFP4 32
INDIRP4
ARGP4
ADDRGP4 cg_enemyModel+16
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1112
;1111:
;1112:				slash = strchr( modelName, '/' );
ADDRFP4 32
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 156
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 156
INDIRP4
ASGNP4
line 1113
;1113:				if ( !slash ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $602
line 1114
;1114:					Q_strncpyz( skinName, PM_SKIN, skinNameSize );
ADDRFP4 40
INDIRP4
ARGP4
ADDRGP4 $208
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1115
;1115:				} else {
ADDRGP4 $603
JUMPV
LABELV $602
line 1116
;1116:					Q_strncpyz( skinName, slash + 1, skinNameSize );
ADDRFP4 40
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1117
;1117:					*slash = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1118
;1118:				}
LABELV $603
line 1120
;1119:
;1120:				if ( setColor ) {
ADDRFP4 28
INDIRI4
CNSTI4 0
EQI4 $533
line 1121
;1121:					colors = CG_GetTeamColors( cg_enemyColors.string, newInfo->team );
ADDRGP4 cg_enemyColors+16
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRLP4 160
ADDRGP4 CG_GetTeamColors
CALLP4
ASGNP4
ADDRLP4 80
ADDRLP4 160
INDIRP4
ASGNP4
line 1122
;1122:					CG_SetColorInfo( colors, newInfo );
ADDRLP4 80
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetColorInfo
CALLV
pop
line 1123
;1123:					newInfo->coloredSkin = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 1612
ADDP4
CNSTI4 1
ASGNI4
line 1124
;1124:				}
line 1125
;1125:			} else { // forcemodel, etc.
ADDRGP4 $533
JUMPV
LABELV $597
line 1126
;1126:				if ( cg_forceModel.integer ) {
ADDRGP4 cg_forceModel+12
INDIRI4
CNSTI4 0
EQI4 $607
line 1128
;1127:
;1128:					trap_Cvar_VariableStringBuffer( "model", modelStr, sizeof( modelStr ) );
ADDRGP4 $582
ARGP4
ADDRLP4 84
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1129
;1129:					if ( ( skin = strchr( modelStr, '/' ) ) == NULL ) {
ADDRLP4 84
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 156
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 156
INDIRP4
ASGNP4
ADDRLP4 156
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $610
line 1130
;1130:						skin = "default";
ADDRLP4 12
ADDRGP4 $121
ASGNP4
line 1131
;1131:					} else {
ADDRGP4 $611
JUMPV
LABELV $610
line 1132
;1132:						*skin++ = '\0';
ADDRLP4 160
ADDRLP4 12
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 160
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 160
INDIRP4
CNSTI1 0
ASGNI1
line 1133
;1133:					}
LABELV $611
line 1135
;1134:
;1135:					Q_strncpyz( skinName, skin, skinNameSize );
ADDRFP4 40
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1136
;1136:					Q_strncpyz( modelName, modelStr, modelNameSize );
ADDRFP4 32
INDIRP4
ARGP4
ADDRLP4 84
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1137
;1137:				} else {
ADDRGP4 $533
JUMPV
LABELV $607
line 1138
;1138:					Q_strncpyz( modelName, infomodel, modelNameSize );
ADDRFP4 32
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1139
;1139:						slash = strchr( modelName, '/' );
ADDRFP4 32
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 156
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 156
INDIRP4
ASGNP4
line 1140
;1140:					if ( !slash ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $612
line 1142
;1141:						// modelName didn not include a skin name
;1142:						Q_strncpyz( skinName, "default", skinNameSize );
ADDRFP4 40
INDIRP4
ARGP4
ADDRGP4 $121
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1143
;1143:					} else {
ADDRGP4 $533
JUMPV
LABELV $612
line 1144
;1144:						Q_strncpyz( skinName, slash + 1, skinNameSize );
ADDRFP4 40
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1146
;1145:						// truncate modelName
;1146:						*slash = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1147
;1147:					}
line 1148
;1148:				}
line 1149
;1149:			}
line 1150
;1150:		}
line 1151
;1151:	}
ADDRGP4 $533
JUMPV
LABELV $532
line 1153
;1152:	else // !cg_forcemodel && !cg_enemyModel && !cg_teamModel
;1153:	{
line 1154
;1154:		Q_strncpyz( modelName, infomodel, modelNameSize );
ADDRFP4 32
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1155
;1155:		slash = strchr( modelName, '/' );
ADDRFP4 32
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 156
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 156
INDIRP4
ASGNP4
line 1156
;1156:		if ( !slash ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $614
line 1158
;1157:			// modelName didn not include a skin name
;1158:			Q_strncpyz( skinName, "default", skinNameSize );
ADDRFP4 40
INDIRP4
ARGP4
ADDRGP4 $121
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1159
;1159:		} else {
ADDRGP4 $615
JUMPV
LABELV $614
line 1160
;1160:			Q_strncpyz( skinName, slash + 1, skinNameSize );
ADDRFP4 40
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1162
;1161:			// truncate modelName
;1162:			*slash = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1163
;1163:		}
LABELV $615
line 1164
;1164:	}
LABELV $533
line 1165
;1165:}
LABELV $527
endproc CG_SetSkinAndModel 188 12
export CG_NewClientInfo
proc CG_NewClientInfo 1788 48
line 1173
;1166:
;1167:
;1168:/*
;1169:======================
;1170:CG_NewClientInfo
;1171:======================
;1172:*/
;1173:void CG_NewClientInfo( int clientNum ) {
line 1187
;1174:	clientInfo_t *ci;
;1175:	clientInfo_t newInfo;
;1176:	const char	*configstring;
;1177:	const char	*v;
;1178:
;1179:	// for colored skins
;1180:	qboolean	allowNativeModel;
;1181:	int			can_defer;
;1182:	int			myClientNum;
;1183:	team_t		myTeam;
;1184:	team_t		team;
;1185:	int			len;
;1186:
;1187:	ci = &cgs.clientinfo[clientNum];
ADDRLP4 1668
ADDRFP4 0
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 1189
;1188:
;1189:	configstring = CG_ConfigString( clientNum + CS_PLAYERS );
ADDRFP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 1688
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 1656
ADDRLP4 1688
INDIRP4
ASGNP4
line 1190
;1190:	if ( !configstring[0] ) {
ADDRLP4 1656
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $618
line 1191
;1191:		memset( ci, 0, sizeof( *ci ) );
ADDRLP4 1668
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1652
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1192
;1192:		return;	// player just left
ADDRGP4 $616
JUMPV
LABELV $618
line 1195
;1193:	}
;1194:
;1195:	if ( cg.snap ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $620
line 1196
;1196:		myClientNum = cg.snap->ps.clientNum;
ADDRLP4 1672
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 1197
;1197:		myTeam = cgs.clientinfo[ myClientNum ].team;
ADDRLP4 1664
ADDRLP4 1672
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996+36
ADDP4
INDIRI4
ASGNI4
line 1198
;1198:	} else {
ADDRGP4 $621
JUMPV
LABELV $620
line 1199
;1199:		myClientNum = cg.clientNum;
ADDRLP4 1672
ADDRGP4 cg+4
INDIRI4
ASGNI4
line 1200
;1200:		myTeam = TEAM_SPECTATOR;
ADDRLP4 1664
CNSTI4 3
ASGNI4
line 1201
;1201:	}
LABELV $621
line 1204
;1202:
;1203:	// "join" team if spectating
;1204:	if ( myTeam == TEAM_SPECTATOR && cg.snap ) {
ADDRLP4 1664
INDIRI4
CNSTI4 3
NEI4 $627
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $627
line 1205
;1205:		myTeam = cg.snap->ps.persistant[ PERS_TEAM ];
ADDRLP4 1664
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ASGNI4
line 1206
;1206:	}
LABELV $627
line 1208
;1207:
;1208:	allowNativeModel = qfalse;
ADDRLP4 1676
CNSTI4 0
ASGNI4
line 1209
;1209:	if ( cgs.gametype < GT_TDM ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
GEI4 $631
line 1210
;1210:		if ( !cg.snap || ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_FREE && cg.snap->ps.clientNum == clientNum ) ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $639
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 0
NEI4 $634
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $634
LABELV $639
line 1211
;1211:			if ( cg.demoPlayback || ( cg.snap && cg.snap->ps.pm_flags & PMF_FOLLOW ) ) {
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
NEI4 $645
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $640
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $640
LABELV $645
line 1212
;1212:				allowNativeModel = qtrue;
ADDRLP4 1676
CNSTI4 1
ASGNI4
line 1213
;1213:			}
LABELV $640
line 1214
;1214:		}
LABELV $634
line 1215
;1215:	}
LABELV $631
line 1219
;1216:
;1217:	// build into a temp buffer so the defer checks can use
;1218:	// the old value
;1219:	memset( &newInfo, 0, sizeof( newInfo ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1652
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1222
;1220:
;1221:	// isolate the player's name
;1222:	v = Info_ValueForKey( configstring, "n" );
ADDRLP4 1656
INDIRP4
ARGP4
ADDRGP4 $646
ARGP4
ADDRLP4 1692
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1652
ADDRLP4 1692
INDIRP4
ASGNP4
line 1223
;1223:	Q_strncpyz( newInfo.name, v, sizeof( newInfo.name ) );
ADDRLP4 0+4
ARGP4
ADDRLP4 1652
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1226
;1224:
;1225:	// team
;1226:	v = Info_ValueForKey( configstring, "t" );
ADDRLP4 1656
INDIRP4
ARGP4
ADDRGP4 $649
ARGP4
ADDRLP4 1696
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1652
ADDRLP4 1696
INDIRP4
ASGNP4
line 1227
;1227:	team = atoi( v );
ADDRLP4 1652
INDIRP4
ARGP4
ADDRLP4 1700
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1660
ADDRLP4 1700
INDIRI4
ASGNI4
line 1228
;1228:	if ( (unsigned) team > TEAM_NUM_TEAMS ) {
ADDRLP4 1660
INDIRI4
CVIU4 4
CNSTU4 4
LEU4 $650
line 1229
;1229:		team = TEAM_SPECTATOR;
ADDRLP4 1660
CNSTI4 3
ASGNI4
line 1230
;1230:	}
LABELV $650
line 1231
;1231:	newInfo.team = team;
ADDRLP4 0+36
ADDRLP4 1660
INDIRI4
ASGNI4
line 1234
;1232:
;1233:	// colors
;1234:	v = Info_ValueForKey( configstring, "c1" );
ADDRLP4 1656
INDIRP4
ARGP4
ADDRGP4 $653
ARGP4
ADDRLP4 1704
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1652
ADDRLP4 1704
INDIRP4
ASGNP4
line 1235
;1235:	CG_ColorFromChar( v[0], newInfo.color1 );
ADDRLP4 1652
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 0+44
ARGP4
ADDRGP4 CG_ColorFromChar
CALLV
pop
line 1237
;1236:
;1237:	v = Info_ValueForKey( configstring, "c2" );
ADDRLP4 1656
INDIRP4
ARGP4
ADDRGP4 $655
ARGP4
ADDRLP4 1708
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1652
ADDRLP4 1708
INDIRP4
ASGNP4
line 1238
;1238:	CG_ColorFromChar( v[0], newInfo.color2 );
ADDRLP4 1652
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 0+56
ARGP4
ADDRGP4 CG_ColorFromChar
CALLV
pop
line 1240
;1239:
;1240:	VectorSet( newInfo.headColor, 1.0, 1.0, 1.0 );
ADDRLP4 0+1616
CNSTF4 1065353216
ASGNF4
ADDRLP4 0+1616+4
CNSTF4 1065353216
ASGNF4
ADDRLP4 0+1616+8
CNSTF4 1065353216
ASGNF4
line 1241
;1241:	VectorSet( newInfo.bodyColor, 1.0, 1.0, 1.0 );
ADDRLP4 0+1628
CNSTF4 1065353216
ASGNF4
ADDRLP4 0+1628+4
CNSTF4 1065353216
ASGNF4
ADDRLP4 0+1628+8
CNSTF4 1065353216
ASGNF4
line 1242
;1242:	VectorSet( newInfo.legsColor, 1.0, 1.0, 1.0 );
ADDRLP4 0+1640
CNSTF4 1065353216
ASGNF4
ADDRLP4 0+1640+4
CNSTF4 1065353216
ASGNF4
ADDRLP4 0+1640+8
CNSTF4 1065353216
ASGNF4
line 1245
;1243:
;1244:	// bot skill
;1245:	v = Info_ValueForKey( configstring, "skill" );
ADDRLP4 1656
INDIRP4
ARGP4
ADDRGP4 $672
ARGP4
ADDRLP4 1712
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1652
ADDRLP4 1712
INDIRP4
ASGNP4
line 1246
;1246:	newInfo.botSkill = atoi( v );
ADDRLP4 1652
INDIRP4
ARGP4
ADDRLP4 1716
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+40
ADDRLP4 1716
INDIRI4
ASGNI4
line 1249
;1247:
;1248:	// handicap
;1249:	v = Info_ValueForKey( configstring, "hc" );
ADDRLP4 1656
INDIRP4
ARGP4
ADDRGP4 $674
ARGP4
ADDRLP4 1720
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1652
ADDRLP4 1720
INDIRP4
ASGNP4
line 1250
;1250:	newInfo.handicap = atoi( v );
ADDRLP4 1652
INDIRP4
ARGP4
ADDRLP4 1724
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+88
ADDRLP4 1724
INDIRI4
ASGNI4
line 1253
;1251:
;1252:	// wins
;1253:	v = Info_ValueForKey( configstring, "w" );
ADDRLP4 1656
INDIRP4
ARGP4
ADDRGP4 $676
ARGP4
ADDRLP4 1728
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1652
ADDRLP4 1728
INDIRP4
ASGNP4
line 1254
;1254:	newInfo.wins = atoi( v );
ADDRLP4 1652
INDIRP4
ARGP4
ADDRLP4 1732
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+92
ADDRLP4 1732
INDIRI4
ASGNI4
line 1257
;1255:
;1256:	// losses
;1257:	v = Info_ValueForKey( configstring, "l" );
ADDRLP4 1656
INDIRP4
ARGP4
ADDRGP4 $678
ARGP4
ADDRLP4 1736
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1652
ADDRLP4 1736
INDIRP4
ASGNP4
line 1258
;1258:	newInfo.losses = atoi( v );
ADDRLP4 1652
INDIRP4
ARGP4
ADDRLP4 1740
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+96
ADDRLP4 1740
INDIRI4
ASGNI4
line 1261
;1259:
;1260:	// always apply team colors [4] and [5] if specified, this will work in non-team games too
;1261:	if ( cg_teamColors.string[0] && team != TEAM_SPECTATOR ) {
ADDRGP4 cg_teamColors+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $680
ADDRLP4 1660
INDIRI4
CNSTI4 3
EQI4 $680
line 1262
;1262:		if ( allowNativeModel || ( ( team == TEAM_RED || team == TEAM_BLUE ) && team == myTeam && ( clientNum != myClientNum || cg.demoPlayback ) ) ) {
ADDRLP4 1676
INDIRI4
CNSTI4 0
NEI4 $688
ADDRLP4 1660
INDIRI4
CNSTI4 1
EQI4 $687
ADDRLP4 1660
INDIRI4
CNSTI4 2
NEI4 $683
LABELV $687
ADDRLP4 1660
INDIRI4
ADDRLP4 1664
INDIRI4
NEI4 $683
ADDRFP4 0
INDIRI4
ADDRLP4 1672
INDIRI4
NEI4 $688
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
EQI4 $683
LABELV $688
line 1263
;1263:			v = CG_GetTeamColors( cg_teamColors.string, team );
ADDRGP4 cg_teamColors+16
ARGP4
ADDRLP4 1660
INDIRI4
ARGI4
ADDRLP4 1748
ADDRGP4 CG_GetTeamColors
CALLP4
ASGNP4
ADDRLP4 1652
ADDRLP4 1748
INDIRP4
ASGNP4
line 1264
;1264:			len = strlen( v );
ADDRLP4 1652
INDIRP4
ARGP4
ADDRLP4 1752
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1684
ADDRLP4 1752
INDIRI4
ASGNI4
line 1265
;1265:			if ( len >= 4 )
ADDRLP4 1684
INDIRI4
CNSTI4 4
LTI4 $690
line 1266
;1266:				CG_ColorFromChar( v[3], newInfo.color1 );
ADDRLP4 1652
INDIRP4
CNSTI4 3
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 0+44
ARGP4
ADDRGP4 CG_ColorFromChar
CALLV
pop
LABELV $690
line 1267
;1267:			if ( len >= 5 )
ADDRLP4 1684
INDIRI4
CNSTI4 5
LTI4 $693
line 1268
;1268:				CG_ColorFromChar( v[4], newInfo.color2 );
ADDRLP4 1652
INDIRP4
CNSTI4 4
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 0+56
ARGP4
ADDRGP4 CG_ColorFromChar
CALLV
pop
LABELV $693
line 1269
;1269:		}
LABELV $683
line 1270
;1270:	}
LABELV $680
line 1273
;1271:
;1272:	// team task
;1273:	v = Info_ValueForKey( configstring, "tt" );
ADDRLP4 1656
INDIRP4
ARGP4
ADDRGP4 $696
ARGP4
ADDRLP4 1744
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1652
ADDRLP4 1744
INDIRP4
ASGNP4
line 1274
;1274:	newInfo.teamTask = atoi(v);
ADDRLP4 1652
INDIRP4
ARGP4
ADDRLP4 1748
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+100
ADDRLP4 1748
INDIRI4
ASGNI4
line 1277
;1275:
;1276:	// team leader
;1277:	v = Info_ValueForKey( configstring, "tl" );
ADDRLP4 1656
INDIRP4
ARGP4
ADDRGP4 $698
ARGP4
ADDRLP4 1752
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1652
ADDRLP4 1752
INDIRP4
ASGNP4
line 1278
;1278:	newInfo.teamLeader = atoi(v);
ADDRLP4 1652
INDIRP4
ARGP4
ADDRLP4 1756
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+104
ADDRLP4 1756
INDIRI4
ASGNI4
line 1281
;1279:
;1280:	// model
;1281:	v = Info_ValueForKey( configstring, "model" );
ADDRLP4 1656
INDIRP4
ARGP4
ADDRGP4 $582
ARGP4
ADDRLP4 1760
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1652
ADDRLP4 1760
INDIRP4
ASGNP4
line 1282
;1282:	CG_SetSkinAndModel( &newInfo, ci, v, allowNativeModel, clientNum, myClientNum, myTeam, qtrue, 
ADDRLP4 0
ARGP4
ADDRLP4 1668
INDIRP4
ARGP4
ADDRLP4 1652
INDIRP4
ARGP4
ADDRLP4 1676
INDIRI4
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1672
INDIRI4
ARGI4
ADDRLP4 1664
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 0+128
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 0+192
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 CG_SetSkinAndModel
CALLV
pop
line 1286
;1283:		newInfo.modelName, sizeof( newInfo.modelName ),	newInfo.skinName, sizeof( newInfo.skinName ) );
;1284:
;1285:	// head model
;1286:	v = Info_ValueForKey( configstring, "hmodel" );
ADDRLP4 1656
INDIRP4
ARGP4
ADDRGP4 $704
ARGP4
ADDRLP4 1764
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1652
ADDRLP4 1764
INDIRP4
ASGNP4
line 1287
;1287:	CG_SetSkinAndModel( &newInfo, ci, v, allowNativeModel, clientNum, myClientNum, myTeam, qfalse, 
ADDRLP4 0
ARGP4
ADDRLP4 1668
INDIRP4
ARGP4
ADDRLP4 1652
INDIRP4
ARGP4
ADDRLP4 1676
INDIRI4
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1672
INDIRI4
ARGI4
ADDRLP4 1664
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0+256
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 0+320
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 CG_SetSkinAndModel
CALLV
pop
line 1291
;1288:		newInfo.headModelName, sizeof( newInfo.headModelName ),	newInfo.headSkinName, sizeof( newInfo.headSkinName ) );
;1289:
;1290:	// allow deferred load at some conditions
;1291:	can_defer = cg_deferPlayers.integer == 2 || ( cg_deferPlayers.integer == 1 && myTeam != TEAM_SPECTATOR && team == TEAM_SPECTATOR );
ADDRGP4 cg_deferPlayers+12
INDIRI4
CNSTI4 2
EQI4 $714
ADDRGP4 cg_deferPlayers+12
INDIRI4
CNSTI4 1
NEI4 $712
ADDRLP4 1664
INDIRI4
CNSTI4 3
EQI4 $712
ADDRLP4 1660
INDIRI4
CNSTI4 3
NEI4 $712
LABELV $714
ADDRLP4 1768
CNSTI4 1
ASGNI4
ADDRGP4 $713
JUMPV
LABELV $712
ADDRLP4 1768
CNSTI4 0
ASGNI4
LABELV $713
ADDRLP4 1680
ADDRLP4 1768
INDIRI4
ASGNI4
line 1295
;1292:
;1293:	// scan for an existing clientinfo that matches this modelname
;1294:	// so we can avoid loading checks if possible
;1295:	if ( !CG_ScanForExistingClientInfo( &newInfo ) ) {
ADDRLP4 0
ARGP4
ADDRLP4 1772
ADDRGP4 CG_ScanForExistingClientInfo
CALLI4
ASGNI4
ADDRLP4 1772
INDIRI4
CNSTI4 0
NEI4 $715
line 1298
;1296:		qboolean	forceDefer;
;1297:
;1298:		forceDefer = trap_MemoryRemaining() < 4000000;
ADDRLP4 1784
ADDRGP4 trap_MemoryRemaining
CALLI4
ASGNI4
ADDRLP4 1784
INDIRI4
CNSTI4 4000000
GEI4 $718
ADDRLP4 1780
CNSTI4 1
ASGNI4
ADDRGP4 $719
JUMPV
LABELV $718
ADDRLP4 1780
CNSTI4 0
ASGNI4
LABELV $719
ADDRLP4 1776
ADDRLP4 1780
INDIRI4
ASGNI4
line 1301
;1299:
;1300:		// if we are defering loads, just have it pick the first valid
;1301:		if ( forceDefer || (can_defer && !cg_buildScript.integer && !cg.loading) )  {
ADDRLP4 1776
INDIRI4
CNSTI4 0
NEI4 $724
ADDRLP4 1680
INDIRI4
CNSTI4 0
EQI4 $720
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
NEI4 $720
ADDRGP4 cg+20
INDIRI4
CNSTI4 0
NEI4 $720
LABELV $724
line 1303
;1302:			// keep whatever they had if it won't violate team skins
;1303:			CG_SetDeferredClientInfo( &newInfo );
ADDRLP4 0
ARGP4
ADDRGP4 CG_SetDeferredClientInfo
CALLV
pop
line 1305
;1304:			// if we are low on memory, leave them with this model
;1305:			if ( forceDefer ) {
ADDRLP4 1776
INDIRI4
CNSTI4 0
EQI4 $721
line 1306
;1306:				CG_Printf( "Memory is low. Using deferred model.\n" );
ADDRGP4 $727
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1307
;1307:				newInfo.deferred = qfalse;
ADDRLP4 0+384
CNSTI4 0
ASGNI4
line 1308
;1308:			}
line 1309
;1309:		} else {
ADDRGP4 $721
JUMPV
LABELV $720
line 1310
;1310:			CG_LoadClientInfo( &newInfo );
ADDRLP4 0
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 1311
;1311:		}
LABELV $721
line 1312
;1312:	}
LABELV $715
line 1315
;1313:
;1314:	// replace whatever was there with the new one
;1315:	newInfo.infoValid = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1316
;1316:	*ci = newInfo;
ADDRLP4 1668
INDIRP4
ADDRLP4 0
INDIRB
ASGNB 1652
line 1317
;1317:}
LABELV $616
endproc CG_NewClientInfo 1788 48
export CG_LoadDeferredPlayers
proc CG_LoadDeferredPlayers 16 4
line 1329
;1318:
;1319:
;1320:/*
;1321:======================
;1322:CG_LoadDeferredPlayers
;1323:
;1324:Called each frame when a player is dead
;1325:and the scoreboard is up
;1326:so deferred players can be loaded
;1327:======================
;1328:*/
;1329:void CG_LoadDeferredPlayers( void ) {
line 1334
;1330:	int		i;
;1331:	clientInfo_t	*ci;
;1332:
;1333:	// scan for a deferred player to load
;1334:	for ( i = 0, ci = cgs.clientinfo ; i < cgs.maxclients ; i++, ci++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 cgs+40996
ASGNP4
ADDRGP4 $733
JUMPV
LABELV $730
line 1335
;1335:		if ( ci->infoValid && ci->deferred ) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $736
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 0
EQI4 $736
line 1337
;1336:			// if we are low on memory, leave it deferred
;1337:			if ( trap_MemoryRemaining() < 4000000 ) {
ADDRLP4 12
ADDRGP4 trap_MemoryRemaining
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 4000000
GEI4 $738
line 1338
;1338:				CG_Printf( "Memory is low.  Using deferred model.\n" );
ADDRGP4 $740
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1339
;1339:				ci->deferred = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 0
ASGNI4
line 1340
;1340:				continue;
ADDRGP4 $731
JUMPV
LABELV $738
line 1342
;1341:			}
;1342:			CG_LoadClientInfo( ci );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 1344
;1343://			break;
;1344:		}
LABELV $736
line 1345
;1345:	}
LABELV $731
line 1334
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1652
ADDP4
ASGNP4
LABELV $733
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+31504
INDIRI4
LTI4 $730
line 1346
;1346:}
LABELV $729
endproc CG_LoadDeferredPlayers 16 4
proc CG_SetLerpFrameAnimation 12 8
line 1364
;1347:
;1348:/*
;1349:=============================================================================
;1350:
;1351:PLAYER ANIMATION
;1352:
;1353:=============================================================================
;1354:*/
;1355:
;1356:
;1357:/*
;1358:===============
;1359:CG_SetLerpFrameAnimation
;1360:
;1361:may include ANIM_TOGGLEBIT
;1362:===============
;1363:*/
;1364:static void CG_SetLerpFrameAnimation( clientInfo_t *ci, lerpFrame_t *lf, int newAnimation ) {
line 1367
;1365:	animation_t	*anim;
;1366:
;1367:	lf->animationNumber = newAnimation;
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 1368
;1368:	newAnimation &= ~ANIM_TOGGLEBIT;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 1370
;1369:
;1370:	if ( newAnimation < 0 || newAnimation >= MAX_TOTALANIMATIONS ) {
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $744
ADDRLP4 4
INDIRI4
CNSTI4 37
LTI4 $742
LABELV $744
line 1371
;1371:		CG_Error( "Bad animation number: %i", newAnimation );
ADDRGP4 $745
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 1372
;1372:	}
LABELV $742
line 1374
;1373:
;1374:	anim = &ci->animations[ newAnimation ];
ADDRLP4 0
ADDRFP4 8
INDIRI4
CNSTI4 28
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
ADDP4
ASGNP4
line 1376
;1375:
;1376:	lf->animation = anim;
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1377
;1377:	lf->animationTime = lf->frameTime + anim->initialLerp;
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1379
;1378:
;1379:	if ( cg_debugAnim.integer ) {
ADDRGP4 cg_debugAnim+12
INDIRI4
CNSTI4 0
EQI4 $746
line 1380
;1380:		CG_Printf( "Anim: %i\n", newAnimation );
ADDRGP4 $749
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 1381
;1381:	}
LABELV $746
line 1382
;1382:}
LABELV $741
endproc CG_SetLerpFrameAnimation 12 8
proc CG_RunLerpFrame 36 12
line 1393
;1383:
;1384:
;1385:/*
;1386:===============
;1387:CG_RunLerpFrame
;1388:
;1389:Sets cg.snap, cg.oldFrame, and cg.backlerp
;1390:cg.time should be between oldFrameTime and frameTime after exit
;1391:===============
;1392:*/
;1393:static void CG_RunLerpFrame( clientInfo_t *ci, lerpFrame_t *lf, int newAnimation, float speedScale ) {
line 1398
;1394:	int			f, numFrames;
;1395:	animation_t	*anim;
;1396:
;1397:	// debugging tool to get no animations
;1398:	if ( cg_animSpeed.integer == 0 ) {
ADDRGP4 cg_animSpeed+12
INDIRI4
CNSTI4 0
NEI4 $751
line 1399
;1399:		lf->oldFrame = lf->frame = lf->backlerp = 0;
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTF4 0
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
ADDRLP4 12
INDIRP4
ADDRLP4 20
INDIRI4
ASGNI4
line 1400
;1400:		return;
ADDRGP4 $750
JUMPV
LABELV $751
line 1404
;1401:	}
;1402:
;1403:	// see if the animation sequence is switching
;1404:	if ( newAnimation != lf->animationNumber || !lf->animation ) {
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 8
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
NEI4 $756
ADDRLP4 12
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $754
LABELV $756
line 1405
;1405:		CG_SetLerpFrameAnimation( ci, lf, newAnimation );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_SetLerpFrameAnimation
CALLV
pop
line 1406
;1406:	}
LABELV $754
line 1410
;1407:
;1408:	// if we have passed the current frame, move it to
;1409:	// oldFrame and calculate a new frame
;1410:	if ( cg.time >= lf->frameTime ) {
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
LTI4 $757
line 1411
;1411:		lf->oldFrame = lf->frame;
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1412
;1412:		lf->oldFrameTime = lf->frameTime;
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1415
;1413:
;1414:		// get the next frame based on the animation
;1415:		anim = lf->animation;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
ASGNP4
line 1416
;1416:		if ( !anim->frameLerp ) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $760
line 1417
;1417:			return;		// shouldn't happen
ADDRGP4 $750
JUMPV
LABELV $760
line 1419
;1418:		}
;1419:		if ( cg.time < lf->animationTime ) {
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
GEI4 $762
line 1420
;1420:			lf->frameTime = lf->animationTime;		// initial lerp
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ASGNI4
line 1421
;1421:		} else {
ADDRGP4 $763
JUMPV
LABELV $762
line 1422
;1422:			lf->frameTime = lf->oldFrameTime + anim->frameLerp;
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1423
;1423:		}
LABELV $763
line 1424
;1424:		f = ( lf->frameTime - lf->animationTime ) / anim->frameLerp;
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
SUBI4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
DIVI4
ASGNI4
line 1425
;1425:		f *= speedScale;		// adjust for haste, etc
ADDRLP4 4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRFP4 12
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1427
;1426:
;1427:		numFrames = anim->numFrames;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1428
;1428:		if (anim->flipflop) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $765
line 1429
;1429:			numFrames *= 2;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 1430
;1430:		}
LABELV $765
line 1431
;1431:		if ( f >= numFrames ) {
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $767
line 1432
;1432:			f -= numFrames;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 1433
;1433:			if ( anim->loopFrames ) {
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 0
EQI4 $769
line 1434
;1434:				f %= anim->loopFrames;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MODI4
ASGNI4
line 1435
;1435:				f += anim->numFrames - anim->loopFrames;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
SUBI4
ADDI4
ASGNI4
line 1436
;1436:			} else {
ADDRGP4 $770
JUMPV
LABELV $769
line 1437
;1437:				f = numFrames - 1;
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1440
;1438:				// the animation is stuck at the end, so it
;1439:				// can immediately transition to another sequence
;1440:				lf->frameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1441
;1441:			}
LABELV $770
line 1442
;1442:		}
LABELV $767
line 1443
;1443:		if ( anim->reversed ) {
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 0
EQI4 $772
line 1444
;1444:			lf->frame = anim->firstFrame + anim->numFrames - 1 - f;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 1445
;1445:		}
ADDRGP4 $773
JUMPV
LABELV $772
line 1446
;1446:		else if (anim->flipflop && f>=anim->numFrames) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $774
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
LTI4 $774
line 1447
;1447:			lf->frame = anim->firstFrame + anim->numFrames - 1 - (f%anim->numFrames);
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
MODI4
SUBI4
ASGNI4
line 1448
;1448:		}
ADDRGP4 $775
JUMPV
LABELV $774
line 1449
;1449:		else {
line 1450
;1450:			lf->frame = anim->firstFrame + f;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 1451
;1451:		}
LABELV $775
LABELV $773
line 1452
;1452:		if ( cg.time > lf->frameTime ) {
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
LEI4 $776
line 1453
;1453:			lf->frameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1454
;1454:			if ( cg_debugAnim.integer ) {
ADDRGP4 cg_debugAnim+12
INDIRI4
CNSTI4 0
EQI4 $780
line 1455
;1455:				CG_Printf( "Clamp lf->frameTime\n");
ADDRGP4 $783
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1456
;1456:			}
LABELV $780
line 1457
;1457:		}
LABELV $776
line 1458
;1458:	}
LABELV $757
line 1460
;1459:
;1460:	if ( lf->frameTime > cg.time + 200 ) {
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
CNSTI4 200
ADDI4
LEI4 $784
line 1461
;1461:		lf->frameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1462
;1462:	}
LABELV $784
line 1464
;1463:
;1464:	if ( lf->oldFrameTime > cg.time ) {
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
LEI4 $788
line 1465
;1465:		lf->oldFrameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1466
;1466:	}
LABELV $788
line 1468
;1467:	// calculate current lerp value
;1468:	if ( lf->frameTime == lf->oldFrameTime ) {
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
NEI4 $792
line 1469
;1469:		lf->backlerp = 0;
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 0
ASGNF4
line 1470
;1470:	} else {
ADDRGP4 $793
JUMPV
LABELV $792
line 1471
;1471:		lf->backlerp = 1.0 - (float)( cg.time - lf->oldFrameTime ) / ( lf->frameTime - lf->oldFrameTime );
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 1065353216
ADDRGP4 cg+107604
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
SUBI4
CVIF4 4
DIVF4
SUBF4
ASGNF4
line 1472
;1472:	}
LABELV $793
line 1473
;1473:}
LABELV $750
endproc CG_RunLerpFrame 36 12
proc CG_ClearLerpFrame 16 12
line 1481
;1474:
;1475:
;1476:/*
;1477:===============
;1478:CG_ClearLerpFrame
;1479:===============
;1480:*/
;1481:static void CG_ClearLerpFrame( clientInfo_t *ci, lerpFrame_t *lf, int animationNumber ) {
line 1482
;1482:	lf->frameTime = lf->oldFrameTime = cg.time;
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1483
;1483:	CG_SetLerpFrameAnimation( ci, lf, animationNumber );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_SetLerpFrameAnimation
CALLV
pop
line 1484
;1484:	lf->oldFrame = lf->frame = lf->animation->firstFrame;
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1485
;1485:}
LABELV $795
endproc CG_ClearLerpFrame 16 12
proc CG_PlayerAnimation 20 16
line 1494
;1486:
;1487:
;1488:/*
;1489:===============
;1490:CG_PlayerAnimation
;1491:===============
;1492:*/
;1493:static void CG_PlayerAnimation( centity_t *cent, int *legsOld, int *legs, float *legsBackLerp,
;1494:						int *torsoOld, int *torso, float *torsoBackLerp ) {
line 1499
;1495:	clientInfo_t	*ci;
;1496:	int				clientNum;
;1497:	float			speedScale;
;1498:
;1499:	clientNum = cent->currentState.clientNum;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 1501
;1500:
;1501:	if ( cg_noPlayerAnims.integer ) {
ADDRGP4 cg_noPlayerAnims+12
INDIRI4
CNSTI4 0
EQI4 $798
line 1502
;1502:		*legsOld = *legs = *torsoOld = *torso = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRFP4 20
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1503
;1503:		return;
ADDRGP4 $797
JUMPV
LABELV $798
line 1506
;1504:	}
;1505:
;1506:	if ( cent->currentState.powerups & ( 1 << PW_HASTE ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $801
line 1507
;1507:		speedScale = 1.5;
ADDRLP4 4
CNSTF4 1069547520
ASGNF4
line 1508
;1508:	} else {
ADDRGP4 $802
JUMPV
LABELV $801
line 1509
;1509:		speedScale = 1;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 1510
;1510:	}
LABELV $802
line 1512
;1511:
;1512:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 1515
;1513:
;1514:	// do the shuffle turn frames locally
;1515:	if ( cent->pe.legs.yawing && ( cent->currentState.legsAnim & ~ANIM_TOGGLEBIT ) == LEGS_IDLE ) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 484
ADDP4
INDIRI4
CNSTI4 0
EQI4 $804
ADDRLP4 12
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
CNSTI4 22
NEI4 $804
line 1516
;1516:		CG_RunLerpFrame( ci, &cent->pe.legs, LEGS_TURN, speedScale );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
ARGP4
CNSTI4 24
ARGI4
ADDRLP4 4
INDIRF4
ARGF4
ADDRGP4 CG_RunLerpFrame
CALLV
pop
line 1517
;1517:	} else {
ADDRGP4 $805
JUMPV
LABELV $804
line 1518
;1518:		CG_RunLerpFrame( ci, &cent->pe.legs, cent->currentState.legsAnim, speedScale );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 460
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRF4
ARGF4
ADDRGP4 CG_RunLerpFrame
CALLV
pop
line 1519
;1519:	}
LABELV $805
line 1521
;1520:
;1521:	*legsOld = cent->pe.legs.oldFrame;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
INDIRI4
ASGNI4
line 1522
;1522:	*legs = cent->pe.legs.frame;
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
ASGNI4
line 1523
;1523:	*legsBackLerp = cent->pe.legs.backlerp;
ADDRFP4 12
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRF4
ASGNF4
line 1525
;1524:
;1525:	CG_RunLerpFrame( ci, &cent->pe.torso, cent->currentState.torsoAnim, speedScale );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRF4
ARGF4
ADDRGP4 CG_RunLerpFrame
CALLV
pop
line 1527
;1526:
;1527:	*torsoOld = cent->pe.torso.oldFrame;
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
ASGNI4
line 1528
;1528:	*torso = cent->pe.torso.frame;
ADDRFP4 20
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
ASGNI4
line 1529
;1529:	*torsoBackLerp = cent->pe.torso.backlerp;
ADDRFP4 24
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRF4
ASGNF4
line 1530
;1530:}
LABELV $797
endproc CG_PlayerAnimation 20 16
proc CG_SwingAngles 28 8
line 1546
;1531:
;1532:/*
;1533:=============================================================================
;1534:
;1535:PLAYER ANGLES
;1536:
;1537:=============================================================================
;1538:*/
;1539:
;1540:/*
;1541:==================
;1542:CG_SwingAngles
;1543:==================
;1544:*/
;1545:static void CG_SwingAngles( float destination, float swingTolerance, float clampTolerance,
;1546:					float speed, float *angle, qboolean *swinging ) {
line 1551
;1547:	float	swing;
;1548:	float	move;
;1549:	float	scale;
;1550:
;1551:	if ( !*swinging ) {
ADDRFP4 20
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $807
line 1553
;1552:		// see if a swing should be started
;1553:		swing = AngleSubtract( *angle, destination );
ADDRFP4 16
INDIRP4
INDIRF4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ASGNF4
line 1554
;1554:		if ( swing > swingTolerance || swing < -swingTolerance ) {
ADDRLP4 20
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRF4
GTF4 $811
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRF4
NEGF4
GEF4 $809
LABELV $811
line 1555
;1555:			*swinging = qtrue;
ADDRFP4 20
INDIRP4
CNSTI4 1
ASGNI4
line 1556
;1556:		}
LABELV $809
line 1557
;1557:	}
LABELV $807
line 1559
;1558:
;1559:	if ( !*swinging ) {
ADDRFP4 20
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $812
line 1560
;1560:		return;
ADDRGP4 $806
JUMPV
LABELV $812
line 1565
;1561:	}
;1562:	
;1563:	// modify the speed depending on the delta
;1564:	// so it doesn't seem so linear
;1565:	swing = AngleSubtract( destination, *angle );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ASGNF4
line 1566
;1566:	scale = fabs( swing );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 16
INDIRF4
ASGNF4
line 1567
;1567:	if ( scale < swingTolerance * 0.5 ) {
ADDRLP4 4
INDIRF4
ADDRFP4 4
INDIRF4
CNSTF4 1056964608
MULF4
GEF4 $814
line 1568
;1568:		scale = 0.5;
ADDRLP4 4
CNSTF4 1056964608
ASGNF4
line 1569
;1569:	} else if ( scale < swingTolerance ) {
ADDRGP4 $815
JUMPV
LABELV $814
ADDRLP4 4
INDIRF4
ADDRFP4 4
INDIRF4
GEF4 $816
line 1570
;1570:		scale = 1.0;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 1571
;1571:	} else {
ADDRGP4 $817
JUMPV
LABELV $816
line 1572
;1572:		scale = 2.0;
ADDRLP4 4
CNSTF4 1073741824
ASGNF4
line 1573
;1573:	}
LABELV $817
LABELV $815
line 1576
;1574:
;1575:	// swing towards the destination angle
;1576:	if ( swing >= 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LTF4 $818
line 1577
;1577:		move = cg.frametime * scale * speed;
ADDRLP4 8
ADDRGP4 cg+107600
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
MULF4
ADDRFP4 12
INDIRF4
MULF4
ASGNF4
line 1578
;1578:		if ( move >= swing ) {
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
LTF4 $821
line 1579
;1579:			move = swing;
ADDRLP4 8
ADDRLP4 0
INDIRF4
ASGNF4
line 1580
;1580:			*swinging = qfalse;
ADDRFP4 20
INDIRP4
CNSTI4 0
ASGNI4
line 1581
;1581:		}
LABELV $821
line 1582
;1582:		*angle = AngleMod( *angle + move );
ADDRLP4 20
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 1583
;1583:	} else {
ADDRGP4 $819
JUMPV
LABELV $818
line 1584
;1584:		move = cg.frametime * scale * -speed;
ADDRLP4 8
ADDRGP4 cg+107600
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
MULF4
ADDRFP4 12
INDIRF4
NEGF4
MULF4
ASGNF4
line 1585
;1585:		if ( move <= swing ) {
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
GTF4 $824
line 1586
;1586:			move = swing;
ADDRLP4 8
ADDRLP4 0
INDIRF4
ASGNF4
line 1587
;1587:			*swinging = qfalse;
ADDRFP4 20
INDIRP4
CNSTI4 0
ASGNI4
line 1588
;1588:		}
LABELV $824
line 1589
;1589:		*angle = AngleMod( *angle + move );
ADDRLP4 20
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 1590
;1590:	}
LABELV $819
line 1593
;1591:
;1592:	// clamp to no more than tolerance
;1593:	swing = AngleSubtract( destination, *angle );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 20
INDIRF4
ASGNF4
line 1594
;1594:	if ( swing > clampTolerance ) {
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
LEF4 $826
line 1595
;1595:		*angle = AngleMod( destination - (clampTolerance - 1) );
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
CNSTF4 1065353216
SUBF4
SUBF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 16
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 1596
;1596:	} else if ( swing < -clampTolerance ) {
ADDRGP4 $827
JUMPV
LABELV $826
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
NEGF4
GEF4 $828
line 1597
;1597:		*angle = AngleMod( destination + (clampTolerance - 1) );
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
CNSTF4 1065353216
SUBF4
ADDF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 16
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 1598
;1598:	}
LABELV $828
LABELV $827
line 1599
;1599:}
LABELV $806
endproc CG_SwingAngles 28 8
proc CG_AddPainTwitch 12 0
line 1607
;1600:
;1601:
;1602:/*
;1603:=================
;1604:CG_AddPainTwitch
;1605:=================
;1606:*/
;1607:static void CG_AddPainTwitch( centity_t *cent, vec3_t torsoAngles ) {
line 1611
;1608:	int		t;
;1609:	float	f;
;1610:
;1611:	t = cg.time - cent->pe.painTime;
ADDRLP4 0
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1612
;1612:	if ( t >= PAIN_TWITCH_TIME ) {
ADDRLP4 0
INDIRI4
CNSTI4 200
LTI4 $832
line 1613
;1613:		return;
ADDRGP4 $830
JUMPV
LABELV $832
line 1616
;1614:	}
;1615:
;1616:	f = 1.0 - (float)t / PAIN_TWITCH_TIME;
ADDRLP4 4
CNSTF4 1065353216
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1000593162
MULF4
SUBF4
ASGNF4
line 1618
;1617:
;1618:	if ( cent->pe.painDirection ) {
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRI4
CNSTI4 0
EQI4 $834
line 1619
;1619:		torsoAngles[ROLL] += 20 * f;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
CNSTF4 1101004800
MULF4
ADDF4
ASGNF4
line 1620
;1620:	} else {
ADDRGP4 $835
JUMPV
LABELV $834
line 1621
;1621:		torsoAngles[ROLL] -= 20 * f;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
CNSTF4 1101004800
MULF4
SUBF4
ASGNF4
line 1622
;1622:	}
LABELV $835
line 1623
;1623:}
LABELV $830
endproc CG_AddPainTwitch 12 0
data
align 4
LABELV $837
byte 4 0
byte 4 22
byte 4 45
byte 4 -22
byte 4 0
byte 4 22
byte 4 -45
byte 4 -22
code
proc CG_PlayerAngles 136 24
line 1640
;1624:
;1625:
;1626:/*
;1627:===============
;1628:CG_PlayerAngles
;1629:
;1630:Handles seperate torso motion
;1631:
;1632:  legs pivot based on direction of movement
;1633:
;1634:  head always looks exactly at cent->lerpAngles
;1635:
;1636:  if motion < 20 degrees, show in head only
;1637:  if < 45 degrees, also show in torso
;1638:===============
;1639:*/
;1640:static void CG_PlayerAngles( centity_t *cent, vec3_t legs[3], vec3_t torso[3], vec3_t head[3] ) {
line 1649
;1641:	vec3_t		legsAngles, torsoAngles, headAngles;
;1642:	float		dest;
;1643:	static	int	movementOffsets[8] = { 0, 22, 45, -22, 0, 22, -45, -22 };
;1644:	vec3_t		velocity;
;1645:	float		speed;
;1646:	int			dir, clientNum;
;1647:	clientInfo_t	*ci;
;1648:
;1649:	VectorCopy( cent->lerpAngles, headAngles );
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRB
ASGNB 12
line 1650
;1650:	headAngles[YAW] = AngleMod( headAngles[YAW] );
ADDRLP4 24+4
INDIRF4
ARGF4
ADDRLP4 68
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 68
INDIRF4
ASGNF4
line 1651
;1651:	VectorClear( legsAngles );
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 12+4
CNSTF4 0
ASGNF4
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 1652
;1652:	VectorClear( torsoAngles );
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0+4
CNSTF4 0
ASGNF4
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1657
;1653:
;1654:	// --------- yaw -------------
;1655:
;1656:	// allow yaw to drift a bit
;1657:	if ( ( cent->currentState.legsAnim & ~ANIM_TOGGLEBIT ) != LEGS_IDLE 
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
CNSTI4 22
NEI4 $846
ADDRLP4 72
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
CNSTI4 11
EQI4 $844
ADDRLP4 72
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
CNSTI4 12
EQI4 $844
LABELV $846
line 1659
;1658:		|| ((cent->currentState.torsoAnim & ~ANIM_TOGGLEBIT) != TORSO_STAND 
;1659:		&& (cent->currentState.torsoAnim & ~ANIM_TOGGLEBIT) != TORSO_STAND2)) {
line 1661
;1660:		// if not standing still, always point all in the same direction
;1661:		cent->pe.torso.yawing = qtrue;	// always center
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
CNSTI4 1
ASGNI4
line 1662
;1662:		cent->pe.torso.pitching = qtrue;	// always center
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
CNSTI4 1
ASGNI4
line 1663
;1663:		cent->pe.legs.yawing = qtrue;	// always center
ADDRFP4 0
INDIRP4
CNSTI4 484
ADDP4
CNSTI4 1
ASGNI4
line 1664
;1664:	}
LABELV $844
line 1667
;1665:
;1666:	// adjust legs for movement dir
;1667:	if ( cent->currentState.eFlags & EF_DEAD ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $847
line 1669
;1668:		// don't let dead bodies twitch
;1669:		dir = 0;
ADDRLP4 52
CNSTI4 0
ASGNI4
line 1670
;1670:	} else {
ADDRGP4 $848
JUMPV
LABELV $847
line 1671
;1671:		dir = cent->currentState.angles2[YAW];
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 1672
;1672:		if ( dir < 0 || dir > 7 ) {
ADDRLP4 52
INDIRI4
CNSTI4 0
LTI4 $851
ADDRLP4 52
INDIRI4
CNSTI4 7
LEI4 $849
LABELV $851
line 1673
;1673:			CG_Error( "Bad player movement angle" );
ADDRGP4 $852
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 1674
;1674:		}
LABELV $849
line 1675
;1675:	}
LABELV $848
line 1676
;1676:	legsAngles[YAW] = headAngles[YAW] + movementOffsets[ dir ];
ADDRLP4 12+4
ADDRLP4 24+4
INDIRF4
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $837
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1677
;1677:	torsoAngles[YAW] = headAngles[YAW] + 0.25 * movementOffsets[ dir ];
ADDRLP4 0+4
ADDRLP4 24+4
INDIRF4
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $837
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1048576000
MULF4
ADDF4
ASGNF4
line 1680
;1678:
;1679:	// torso
;1680:	CG_SwingAngles( torsoAngles[YAW], 25, 90, cg_swingSpeed.value, &cent->pe.torso.yawAngle, &cent->pe.torso.yawing );
ADDRLP4 0+4
INDIRF4
ARGF4
CNSTF4 1103626240
ARGF4
CNSTF4 1119092736
ARGF4
ADDRGP4 cg_swingSpeed+8
INDIRF4
ARGF4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 528
ADDP4
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 532
ADDP4
ARGP4
ADDRGP4 CG_SwingAngles
CALLV
pop
line 1681
;1681:	CG_SwingAngles( legsAngles[YAW], 40, 90, cg_swingSpeed.value, &cent->pe.legs.yawAngle, &cent->pe.legs.yawing );
ADDRLP4 12+4
INDIRF4
ARGF4
CNSTF4 1109393408
ARGF4
CNSTF4 1119092736
ARGF4
ADDRGP4 cg_swingSpeed+8
INDIRF4
ARGF4
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 480
ADDP4
ARGP4
ADDRLP4 80
INDIRP4
CNSTI4 484
ADDP4
ARGP4
ADDRGP4 CG_SwingAngles
CALLV
pop
line 1683
;1682:
;1683:	torsoAngles[YAW] = cent->pe.torso.yawAngle;
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ASGNF4
line 1684
;1684:	legsAngles[YAW] = cent->pe.legs.yawAngle;
ADDRLP4 12+4
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
INDIRF4
ASGNF4
line 1690
;1685:
;1686:
;1687:	// --------- pitch -------------
;1688:
;1689:	// only show a fraction of the pitch angle in the torso
;1690:	if ( headAngles[PITCH] > 180 ) {
ADDRLP4 24
INDIRF4
CNSTF4 1127481344
LEF4 $863
line 1691
;1691:		dest = (-360 + headAngles[PITCH]) * 0.75f;
ADDRLP4 60
ADDRLP4 24
INDIRF4
CNSTF4 3283353600
ADDF4
CNSTF4 1061158912
MULF4
ASGNF4
line 1692
;1692:	} else {
ADDRGP4 $864
JUMPV
LABELV $863
line 1693
;1693:		dest = headAngles[PITCH] * 0.75f;
ADDRLP4 60
ADDRLP4 24
INDIRF4
CNSTF4 1061158912
MULF4
ASGNF4
line 1694
;1694:	}
LABELV $864
line 1695
;1695:	CG_SwingAngles( dest, 15, 30, 0.1f, &cent->pe.torso.pitchAngle, &cent->pe.torso.pitching );
ADDRLP4 60
INDIRF4
ARGF4
CNSTF4 1097859072
ARGF4
CNSTF4 1106247680
ARGF4
CNSTF4 1036831949
ARGF4
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 536
ADDP4
ARGP4
ADDRLP4 84
INDIRP4
CNSTI4 540
ADDP4
ARGP4
ADDRGP4 CG_SwingAngles
CALLV
pop
line 1696
;1696:	torsoAngles[PITCH] = cent->pe.torso.pitchAngle;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRF4
ASGNF4
line 1699
;1697:
;1698:	//
;1699:	clientNum = cent->currentState.clientNum;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 1700
;1700:	if ( clientNum >= 0 && clientNum < MAX_CLIENTS ) {
ADDRLP4 36
INDIRI4
CNSTI4 0
LTI4 $865
ADDRLP4 36
INDIRI4
CNSTI4 64
GEI4 $865
line 1701
;1701:		ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 64
ADDRLP4 36
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 1702
;1702:		if ( ci->fixedtorso ) {
ADDRLP4 64
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
CNSTI4 0
EQI4 $868
line 1703
;1703:			torsoAngles[PITCH] = 0.0f;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1704
;1704:		}
LABELV $868
line 1705
;1705:	}
LABELV $865
line 1711
;1706:
;1707:	// --------- roll -------------
;1708:
;1709:
;1710:	// lean towards the direction of travel
;1711:	VectorCopy( cent->currentState.pos.trDelta, velocity );
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 1712
;1712:	speed = VectorNormalize( velocity );
ADDRLP4 40
ARGP4
ADDRLP4 92
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 56
ADDRLP4 92
INDIRF4
ASGNF4
line 1713
;1713:	if ( speed ) {
ADDRLP4 56
INDIRF4
CNSTF4 0
EQF4 $870
line 1717
;1714:		vec3_t	axis[3];
;1715:		float	side;
;1716:
;1717:		speed *= 0.05f;
ADDRLP4 56
ADDRLP4 56
INDIRF4
CNSTF4 1028443341
MULF4
ASGNF4
line 1719
;1718:
;1719:		AnglesToAxis( legsAngles, axis );
ADDRLP4 12
ARGP4
ADDRLP4 96
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1720
;1720:		side = speed * DotProduct( velocity, axis[1] );
ADDRLP4 132
ADDRLP4 56
INDIRF4
ADDRLP4 40
INDIRF4
ADDRLP4 96+12
INDIRF4
MULF4
ADDRLP4 40+4
INDIRF4
ADDRLP4 96+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 40+8
INDIRF4
ADDRLP4 96+12+8
INDIRF4
MULF4
ADDF4
MULF4
ASGNF4
line 1721
;1721:		legsAngles[ROLL] -= side;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
ADDRLP4 132
INDIRF4
SUBF4
ASGNF4
line 1723
;1722:
;1723:		side = speed * DotProduct( velocity, axis[0] );
ADDRLP4 132
ADDRLP4 56
INDIRF4
ADDRLP4 40
INDIRF4
ADDRLP4 96
INDIRF4
MULF4
ADDRLP4 40+4
INDIRF4
ADDRLP4 96+4
INDIRF4
MULF4
ADDF4
ADDRLP4 40+8
INDIRF4
ADDRLP4 96+8
INDIRF4
MULF4
ADDF4
MULF4
ASGNF4
line 1724
;1724:		legsAngles[PITCH] += side;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 132
INDIRF4
ADDF4
ASGNF4
line 1725
;1725:	}
LABELV $870
line 1728
;1726:
;1727:	//
;1728:	clientNum = cent->currentState.clientNum;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 1729
;1729:	if ( clientNum >= 0 && clientNum < MAX_CLIENTS ) {
ADDRLP4 36
INDIRI4
CNSTI4 0
LTI4 $884
ADDRLP4 36
INDIRI4
CNSTI4 64
GEI4 $884
line 1730
;1730:		ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 64
ADDRLP4 36
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 1731
;1731:		if ( ci->fixedlegs ) {
ADDRLP4 64
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
CNSTI4 0
EQI4 $887
line 1732
;1732:			legsAngles[YAW] = torsoAngles[YAW];
ADDRLP4 12+4
ADDRLP4 0+4
INDIRF4
ASGNF4
line 1733
;1733:			legsAngles[PITCH] = 0.0f;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 1734
;1734:			legsAngles[ROLL] = 0.0f;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 1735
;1735:		}
LABELV $887
line 1736
;1736:	}
LABELV $884
line 1739
;1737:
;1738:	// pain twitch
;1739:	CG_AddPainTwitch( cent, torsoAngles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_AddPainTwitch
CALLV
pop
line 1742
;1740:
;1741:	// pull the angles back out of the hierarchial chain
;1742:	AnglesSubtract( headAngles, torsoAngles, headAngles );
ADDRLP4 24
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 AnglesSubtract
CALLV
pop
line 1743
;1743:	AnglesSubtract( torsoAngles, legsAngles, torsoAngles );
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 AnglesSubtract
CALLV
pop
line 1744
;1744:	AnglesToAxis( legsAngles, legs );
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1745
;1745:	AnglesToAxis( torsoAngles, torso );
ADDRLP4 0
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1746
;1746:	AnglesToAxis( headAngles, head );
ADDRLP4 24
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1747
;1747:}
LABELV $836
endproc CG_PlayerAngles 136 24
proc CG_HasteTrail 32 48
line 1757
;1748:
;1749:
;1750://==========================================================================
;1751:
;1752:/*
;1753:===============
;1754:CG_HasteTrail
;1755:===============
;1756:*/
;1757:static void CG_HasteTrail( centity_t *cent ) {
line 1762
;1758:	localEntity_t	*smoke;
;1759:	vec3_t			origin;
;1760:	int				anim;
;1761:
;1762:	if ( cent->trailTime > cg.time ) {
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
LEI4 $893
line 1763
;1763:		return;
ADDRGP4 $892
JUMPV
LABELV $893
line 1765
;1764:	}
;1765:	anim = cent->pe.legs.animationNumber & ~ANIM_TOGGLEBIT;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 1766
;1766:	if ( anim != LEGS_RUN && anim != LEGS_BACK ) {
ADDRLP4 12
INDIRI4
CNSTI4 15
EQI4 $896
ADDRLP4 12
INDIRI4
CNSTI4 16
EQI4 $896
line 1767
;1767:		return;
ADDRGP4 $892
JUMPV
LABELV $896
line 1770
;1768:	}
;1769:
;1770:	cent->trailTime += 100;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1771
;1771:	if ( cent->trailTime < cg.time ) {
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $898
line 1772
;1772:		cent->trailTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1773
;1773:	}
LABELV $898
line 1775
;1774:
;1775:	VectorCopy( cent->lerpOrigin, origin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 1776
;1776:	origin[2] -= 16;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1098907648
SUBF4
ASGNF4
line 1778
;1777:
;1778:	smoke = CG_SmokePuff( origin, vec3_origin, 
ADDRLP4 0
ARGP4
ADDRGP4 vec3_origin
ARGP4
CNSTF4 1090519040
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1140457472
ARGF4
ADDRGP4 cg+107604
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+148692+460
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 CG_SmokePuff
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 28
INDIRP4
ASGNP4
line 1788
;1779:				  8, 
;1780:				  1, 1, 1, 1,
;1781:				  500, 
;1782:				  cg.time,
;1783:				  0,
;1784:				  0,
;1785:				  cgs.media.hastePuffShader );
;1786:
;1787:	// use the optimized local entity add
;1788:	smoke->leType = LE_SCALE_FADE;
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 7
ASGNI4
line 1789
;1789:}
LABELV $892
endproc CG_HasteTrail 32 48
proc CG_BreathPuffs 48 48
line 1797
;1790:
;1791:
;1792:/*
;1793:===============
;1794:CG_BreathPuffs
;1795:===============
;1796:*/
;1797:static void CG_BreathPuffs( centity_t *cent, refEntity_t *head) {
line 1802
;1798:	clientInfo_t *ci;
;1799:	vec3_t up, origin;
;1800:	int contents;
;1801:
;1802:	ci = &cgs.clientinfo[ cent->currentState.number ];
ADDRLP4 24
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 1804
;1803:
;1804:	if (!cg_enableBreath.integer) {
ADDRGP4 cg_enableBreath+12
INDIRI4
CNSTI4 0
NEI4 $908
line 1805
;1805:		return;
ADDRGP4 $906
JUMPV
LABELV $908
line 1807
;1806:	}
;1807:	if ( cent->currentState.number == cg.snap->ps.clientNum && !cg.renderingThirdPerson) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $911
ADDRGP4 cg+107628
INDIRI4
CNSTI4 0
NEI4 $911
line 1808
;1808:		return;
ADDRGP4 $906
JUMPV
LABELV $911
line 1810
;1809:	}
;1810:	if ( cent->currentState.eFlags & EF_DEAD ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $915
line 1811
;1811:		return;
ADDRGP4 $906
JUMPV
LABELV $915
line 1813
;1812:	}
;1813:	contents = CG_PointContents( head->origin, 0 );
ADDRFP4 4
INDIRP4
CNSTI4 68
ADDP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 32
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 32
INDIRI4
ASGNI4
line 1814
;1814:	if ( contents & ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) ) {
ADDRLP4 28
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $917
line 1815
;1815:		return;
ADDRGP4 $906
JUMPV
LABELV $917
line 1817
;1816:	}
;1817:	if ( ci->breathPuffTime > cg.time ) {
ADDRLP4 24
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
LEI4 $919
line 1818
;1818:		return;
ADDRGP4 $906
JUMPV
LABELV $919
line 1821
;1819:	}
;1820:
;1821:	VectorSet( up, 0, 0, 8 );
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 12+4
CNSTF4 0
ASGNF4
ADDRLP4 12+8
CNSTF4 1090519040
ASGNF4
line 1822
;1822:	VectorMA(head->origin, 8, head->axis[0], origin);
ADDRLP4 36
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 36
INDIRP4
CNSTI4 68
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1090519040
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 36
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 1090519040
MULF4
ADDF4
ASGNF4
ADDRLP4 40
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 40
INDIRP4
CNSTI4 76
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
CNSTF4 1090519040
MULF4
ADDF4
ASGNF4
line 1823
;1823:	VectorMA(origin, -4, head->axis[2], origin);
ADDRLP4 44
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 44
INDIRP4
CNSTI4 52
ADDP4
INDIRF4
CNSTF4 3229614080
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 44
INDIRP4
CNSTI4 56
ADDP4
INDIRF4
CNSTF4 3229614080
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
CNSTF4 3229614080
MULF4
ADDF4
ASGNF4
line 1824
;1824:	CG_SmokePuff( origin, up, 16, 1, 1, 1, 0.66f, 1500, cg.time, cg.time + 400, LEF_PUFF_DONT_SCALE, cgs.media.shotgunSmokePuffShader );
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1059648963
ARGF4
CNSTF4 1153138688
ARGF4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRGP4 cg+107604
INDIRI4
CNSTI4 400
ADDI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 cgs+148692+316
INDIRI4
ARGI4
ADDRGP4 CG_SmokePuff
CALLP4
pop
line 1825
;1825:	ci->breathPuffTime = cg.time + 2000;
ADDRLP4 24
INDIRP4
CNSTI4 124
ADDP4
ADDRGP4 cg+107604
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 1826
;1826:}
LABELV $906
endproc CG_BreathPuffs 48 48
proc CG_DustTrail 96 48
line 1833
;1827:
;1828:/*
;1829:===============
;1830:CG_DustTrail
;1831:===============
;1832:*/
;1833:static void CG_DustTrail( centity_t *cent ) {
line 1838
;1834:	int				anim;
;1835:	vec3_t end, vel;
;1836:	trace_t tr;
;1837:
;1838:	if (!cg_enableDust.integer)
ADDRGP4 cg_enableDust+12
INDIRI4
CNSTI4 0
NEI4 $936
line 1839
;1839:		return;
ADDRGP4 $935
JUMPV
LABELV $936
line 1841
;1840:
;1841:	if ( cent->dustTrailTime > cg.time ) {
ADDRFP4 0
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
LEI4 $939
line 1842
;1842:		return;
ADDRGP4 $935
JUMPV
LABELV $939
line 1845
;1843:	}
;1844:
;1845:	anim = cent->pe.legs.animationNumber & ~ANIM_TOGGLEBIT;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 1846
;1846:	if ( anim != LEGS_LANDB && anim != LEGS_LAND ) {
ADDRLP4 24
INDIRI4
CNSTI4 21
EQI4 $942
ADDRLP4 24
INDIRI4
CNSTI4 19
EQI4 $942
line 1847
;1847:		return;
ADDRGP4 $935
JUMPV
LABELV $942
line 1850
;1848:	}
;1849:
;1850:	cent->dustTrailTime += 40;
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 440
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRI4
CNSTI4 40
ADDI4
ASGNI4
line 1851
;1851:	if ( cent->dustTrailTime < cg.time ) {
ADDRFP4 0
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $944
line 1852
;1852:		cent->dustTrailTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 440
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1853
;1853:	}
LABELV $944
line 1855
;1854:
;1855:	VectorCopy(cent->currentState.pos.trBase, end);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1856
;1856:	end[2] -= 64;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1115684864
SUBF4
ASGNF4
line 1857
;1857:	CG_Trace( &tr, cent->currentState.pos.trBase, NULL, NULL, end, cent->currentState.number, MASK_PLAYERSOLID );
ADDRLP4 28
ARGP4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 92
INDIRP4
INDIRI4
ARGI4
CNSTI4 33619969
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 1859
;1858:
;1859:	if ( !(tr.surfaceFlags & SURF_DUST) )
ADDRLP4 28+44
INDIRI4
CNSTI4 262144
BANDI4
CNSTI4 0
NEI4 $949
line 1860
;1860:		return;
ADDRGP4 $935
JUMPV
LABELV $949
line 1862
;1861:
;1862:	VectorCopy( cent->currentState.pos.trBase, end );
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1863
;1863:	end[2] -= 16;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1098907648
SUBF4
ASGNF4
line 1865
;1864:
;1865:	VectorSet(vel, 0, 0, -30);
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 12+4
CNSTF4 0
ASGNF4
ADDRLP4 12+8
CNSTF4 3253731328
ASGNF4
line 1866
;1866:	CG_SmokePuff( end, vel,
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
CNSTF4 1103101952
ARGF4
CNSTF4 1061997773
ARGF4
CNSTF4 1061997773
ARGF4
CNSTF4 1060320051
ARGF4
CNSTF4 1051260355
ARGF4
CNSTF4 1140457472
ARGF4
ADDRGP4 cg+107604
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+148692+560
INDIRI4
ARGI4
ADDRGP4 CG_SmokePuff
CALLP4
pop
line 1874
;1867:				  24,
;1868:				  .8f, .8f, 0.7f, 0.33f,
;1869:				  500,
;1870:				  cg.time,
;1871:				  0,
;1872:				  0,
;1873:				  cgs.media.dustPuffShader );
;1874:}
LABELV $935
endproc CG_DustTrail 96 48
proc CG_TrailItem 188 12
line 1882
;1875:
;1876:
;1877:/*
;1878:===============
;1879:CG_TrailItem
;1880:===============
;1881:*/
;1882:static void CG_TrailItem( const centity_t *cent, qhandle_t hModel ) {
line 1887
;1883:	refEntity_t		ent;
;1884:	vec3_t			angles;
;1885:	vec3_t			axis[3];
;1886:
;1887:	VectorCopy( cent->lerpAngles, angles );
ADDRLP4 140
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRB
ASGNB 12
line 1888
;1888:	angles[PITCH] = 0;
ADDRLP4 140
CNSTF4 0
ASGNF4
line 1889
;1889:	angles[ROLL] = 0;
ADDRLP4 140+8
CNSTF4 0
ASGNF4
line 1890
;1890:	AnglesToAxis( angles, axis );
ADDRLP4 140
ARGP4
ADDRLP4 152
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1892
;1891:
;1892:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1893
;1893:	VectorMA( cent->lerpOrigin, -16, axis[0], ent.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRF4
ADDRLP4 152
INDIRF4
CNSTF4 3246391296
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRF4
ADDRLP4 152+4
INDIRF4
CNSTF4 3246391296
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+8
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
INDIRF4
ADDRLP4 152+8
INDIRF4
CNSTF4 3246391296
MULF4
ADDF4
ASGNF4
line 1894
;1894:	ent.origin[2] += 16;
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 1895
;1895:	angles[YAW] += 90;
ADDRLP4 140+4
ADDRLP4 140+4
INDIRF4
CNSTF4 1119092736
ADDF4
ASGNF4
line 1896
;1896:	AnglesToAxis( angles, ent.axis );
ADDRLP4 140
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1898
;1897:
;1898:	ent.hModel = hModel;
ADDRLP4 0+8
ADDRFP4 4
INDIRI4
ASGNI4
line 1899
;1899:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1900
;1900:}
LABELV $958
endproc CG_TrailItem 188 12
proc CG_PlayerFlag 352 24
line 1908
;1901:
;1902:
;1903:/*
;1904:===============
;1905:CG_PlayerFlag
;1906:===============
;1907:*/
;1908:static void CG_PlayerFlag( centity_t *cent, qhandle_t hSkin, refEntity_t *torso ) {
line 1917
;1909:	clientInfo_t	*ci;
;1910:	refEntity_t	pole;
;1911:	refEntity_t	flag;
;1912:	vec3_t		angles, dir;
;1913:	int			legsAnim, flagAnim, updateangles;
;1914:	float		angle, d;
;1915:
;1916:	// show the flag pole model
;1917:	memset( &pole, 0, sizeof(pole) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1918
;1918:	pole.hModel = cgs.media.flagPoleModel;
ADDRLP4 0+8
ADDRGP4 cgs+148692+88
INDIRI4
ASGNI4
line 1919
;1919:	VectorCopy( torso->lightingOrigin, pole.lightingOrigin );
ADDRLP4 0+12
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 1920
;1920:	pole.shadowPlane = torso->shadowPlane;
ADDRLP4 0+24
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 1921
;1921:	pole.renderfx = torso->renderfx;
ADDRLP4 0+4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1922
;1922:	CG_PositionEntityOnTag( &pole, torso, torso->hModel, "tag_flag" );
ADDRLP4 0
ARGP4
ADDRLP4 328
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 328
INDIRP4
ARGP4
ADDRLP4 328
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 $448
ARGP4
ADDRGP4 CG_PositionEntityOnTag
CALLV
pop
line 1923
;1923:	trap_R_AddRefEntityToScene( &pole );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1926
;1924:
;1925:	// show the flag model
;1926:	memset( &flag, 0, sizeof(flag) );
ADDRLP4 140
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1927
;1927:	flag.hModel = cgs.media.flagFlapModel;
ADDRLP4 140+8
ADDRGP4 cgs+148692+92
INDIRI4
ASGNI4
line 1928
;1928:	flag.customSkin = hSkin;
ADDRLP4 140+108
ADDRFP4 4
INDIRI4
ASGNI4
line 1929
;1929:	VectorCopy( torso->lightingOrigin, flag.lightingOrigin );
ADDRLP4 140+12
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 1930
;1930:	flag.shadowPlane = torso->shadowPlane;
ADDRLP4 140+24
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 1931
;1931:	flag.renderfx = torso->renderfx;
ADDRLP4 140+4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1933
;1932:
;1933:	VectorClear(angles);
ADDRLP4 280
CNSTF4 0
ASGNF4
ADDRLP4 280+4
CNSTF4 0
ASGNF4
ADDRLP4 280+8
CNSTF4 0
ASGNF4
line 1935
;1934:
;1935:	updateangles = qfalse;
ADDRLP4 312
CNSTI4 0
ASGNI4
line 1936
;1936:	legsAnim = cent->currentState.legsAnim & ~ANIM_TOGGLEBIT;
ADDRLP4 304
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 1937
;1937:	if( legsAnim == LEGS_IDLE || legsAnim == LEGS_IDLECR ) {
ADDRLP4 304
INDIRI4
CNSTI4 22
EQI4 $990
ADDRLP4 304
INDIRI4
CNSTI4 23
NEI4 $988
LABELV $990
line 1938
;1938:		flagAnim = FLAG_STAND;
ADDRLP4 320
CNSTI4 35
ASGNI4
line 1939
;1939:	} else if ( legsAnim == LEGS_WALK || legsAnim == LEGS_WALKCR ) {
ADDRGP4 $989
JUMPV
LABELV $988
ADDRLP4 304
INDIRI4
CNSTI4 14
EQI4 $993
ADDRLP4 304
INDIRI4
CNSTI4 13
NEI4 $991
LABELV $993
line 1940
;1940:		flagAnim = FLAG_STAND;
ADDRLP4 320
CNSTI4 35
ASGNI4
line 1941
;1941:		updateangles = qtrue;
ADDRLP4 312
CNSTI4 1
ASGNI4
line 1942
;1942:	} else {
ADDRGP4 $992
JUMPV
LABELV $991
line 1943
;1943:		flagAnim = FLAG_RUN;
ADDRLP4 320
CNSTI4 34
ASGNI4
line 1944
;1944:		updateangles = qtrue;
ADDRLP4 312
CNSTI4 1
ASGNI4
line 1945
;1945:	}
LABELV $992
LABELV $989
line 1947
;1946:
;1947:	if ( updateangles ) {
ADDRLP4 312
INDIRI4
CNSTI4 0
EQI4 $994
line 1949
;1948:
;1949:		VectorCopy( cent->currentState.pos.trDelta, dir );
ADDRLP4 292
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 1951
;1950:		// add gravity
;1951:		dir[2] += 100;
ADDRLP4 292+8
ADDRLP4 292+8
INDIRF4
CNSTF4 1120403456
ADDF4
ASGNF4
line 1952
;1952:		VectorNormalize( dir );
ADDRLP4 292
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1953
;1953:		d = DotProduct(pole.axis[2], dir);
ADDRLP4 308
ADDRLP4 0+28+24
INDIRF4
ADDRLP4 292
INDIRF4
MULF4
ADDRLP4 0+28+24+4
INDIRF4
ADDRLP4 292+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+28+24+8
INDIRF4
ADDRLP4 292+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1955
;1954:		// if there is enough movement orthogonal to the flag pole
;1955:		if (fabs(d) < 0.9) {
ADDRLP4 308
INDIRF4
ARGF4
ADDRLP4 340
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 340
INDIRF4
CNSTF4 1063675494
GEF4 $1007
line 1957
;1956:			//
;1957:			d = DotProduct(pole.axis[0], dir);
ADDRLP4 308
ADDRLP4 0+28
INDIRF4
ADDRLP4 292
INDIRF4
MULF4
ADDRLP4 0+28+4
INDIRF4
ADDRLP4 292+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+28+8
INDIRF4
ADDRLP4 292+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1958
;1958:			if (d > 1.0f) {
ADDRLP4 308
INDIRF4
CNSTF4 1065353216
LEF4 $1016
line 1959
;1959:				d = 1.0f;
ADDRLP4 308
CNSTF4 1065353216
ASGNF4
line 1960
;1960:			}
ADDRGP4 $1017
JUMPV
LABELV $1016
line 1961
;1961:			else if (d < -1.0f) {
ADDRLP4 308
INDIRF4
CNSTF4 3212836864
GEF4 $1018
line 1962
;1962:				d = -1.0f;
ADDRLP4 308
CNSTF4 3212836864
ASGNF4
line 1963
;1963:			}
LABELV $1018
LABELV $1017
line 1964
;1964:			angle = acos(d);
ADDRLP4 308
INDIRF4
ARGF4
ADDRLP4 344
ADDRGP4 acos
CALLF4
ASGNF4
ADDRLP4 324
ADDRLP4 344
INDIRF4
ASGNF4
line 1966
;1965:
;1966:			d = DotProduct(pole.axis[1], dir);
ADDRLP4 308
ADDRLP4 0+28+12
INDIRF4
ADDRLP4 292
INDIRF4
MULF4
ADDRLP4 0+28+12+4
INDIRF4
ADDRLP4 292+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+28+12+8
INDIRF4
ADDRLP4 292+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1967
;1967:			if (d < 0) {
ADDRLP4 308
INDIRF4
CNSTF4 0
GEF4 $1030
line 1968
;1968:				angles[YAW] = 360 - angle * 180 / M_PI;
ADDRLP4 280+4
CNSTF4 1135869952
ADDRLP4 324
INDIRF4
CNSTF4 1113927393
MULF4
SUBF4
ASGNF4
line 1969
;1969:			}
ADDRGP4 $1031
JUMPV
LABELV $1030
line 1970
;1970:			else {
line 1971
;1971:				angles[YAW] = angle * 180 / M_PI;
ADDRLP4 280+4
ADDRLP4 324
INDIRF4
CNSTF4 1113927393
MULF4
ASGNF4
line 1972
;1972:			}
LABELV $1031
line 1973
;1973:			if (angles[YAW] < 0)
ADDRLP4 280+4
INDIRF4
CNSTF4 0
GEF4 $1034
line 1974
;1974:				angles[YAW] += 360;
ADDRLP4 280+4
ADDRLP4 280+4
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
LABELV $1034
line 1975
;1975:			if (angles[YAW] > 360)
ADDRLP4 280+4
INDIRF4
CNSTF4 1135869952
LEF4 $1038
line 1976
;1976:				angles[YAW] -= 360;
ADDRLP4 280+4
ADDRLP4 280+4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
LABELV $1038
line 1981
;1977:
;1978:			//vectoangles( cent->currentState.pos.trDelta, tmpangles );
;1979:			//angles[YAW] = tmpangles[YAW] + 45 - cent->pe.torso.yawAngle;
;1980:			// change the yaw angle
;1981:			CG_SwingAngles( angles[YAW], 25, 90, 0.15f, &cent->pe.flag.yawAngle, &cent->pe.flag.yawing );
ADDRLP4 280+4
INDIRF4
ARGF4
CNSTF4 1103626240
ARGF4
CNSTF4 1119092736
ARGF4
CNSTF4 1041865114
ARGF4
ADDRLP4 348
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 348
INDIRP4
CNSTI4 576
ADDP4
ARGP4
ADDRLP4 348
INDIRP4
CNSTI4 580
ADDP4
ARGP4
ADDRGP4 CG_SwingAngles
CALLV
pop
line 1982
;1982:		}
LABELV $1007
line 2002
;1983:
;1984:		/*
;1985:		d = DotProduct(pole.axis[2], dir);
;1986:		angle = Q_acos(d);
;1987:
;1988:		d = DotProduct(pole.axis[1], dir);
;1989:		if (d < 0) {
;1990:			angle = 360 - angle * 180 / M_PI;
;1991:		}
;1992:		else {
;1993:			angle = angle * 180 / M_PI;
;1994:		}
;1995:		if (angle > 340 && angle < 20) {
;1996:			flagAnim = FLAG_RUNUP;
;1997:		}
;1998:		if (angle > 160 && angle < 200) {
;1999:			flagAnim = FLAG_RUNDOWN;
;2000:		}
;2001:		*/
;2002:	}
LABELV $994
line 2005
;2003:
;2004:	// set the yaw angle
;2005:	angles[YAW] = cent->pe.flag.yawAngle;
ADDRLP4 280+4
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRF4
ASGNF4
line 2007
;2006:	// lerp the flag animation frames
;2007:	ci = &cgs.clientinfo[ cent->currentState.clientNum ];
ADDRLP4 316
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 2008
;2008:	CG_RunLerpFrame( ci, &cent->pe.flag, flagAnim, 1 );
ADDRLP4 316
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
ARGP4
ADDRLP4 320
INDIRI4
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_RunLerpFrame
CALLV
pop
line 2009
;2009:	flag.oldframe = cent->pe.flag.oldFrame;
ADDRLP4 140+96
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRI4
ASGNI4
line 2010
;2010:	flag.frame = cent->pe.flag.frame;
ADDRLP4 140+80
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRI4
ASGNI4
line 2011
;2011:	flag.backlerp = cent->pe.flag.backlerp;
ADDRLP4 140+100
ADDRFP4 0
INDIRP4
CNSTI4 572
ADDP4
INDIRF4
ASGNF4
line 2013
;2012:
;2013:	AnglesToAxis( angles, flag.axis );
ADDRLP4 280
ARGP4
ADDRLP4 140+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 2014
;2014:	CG_PositionRotatedEntityOnTag( &flag, &pole, pole.hModel, "tag_flag" );
ADDRLP4 140
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 $448
ARGP4
ADDRGP4 CG_PositionRotatedEntityOnTag
CALLV
pop
line 2016
;2015:
;2016:	trap_R_AddRefEntityToScene( &flag );
ADDRLP4 140
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2017
;2017:}
LABELV $972
endproc CG_PlayerFlag 352 24
proc CG_PlayerTokens 196 12
line 2025
;2018:
;2019:
;2020:/*
;2021:===============
;2022:CG_PlayerTokens
;2023:===============
;2024:*/
;2025:static void CG_PlayerTokens( centity_t *cent, int renderfx ) {
line 2031
;2026:	int			tokens, i, j;
;2027:	float		angle;
;2028:	refEntity_t	ent;
;2029:	vec3_t		dir, origin;
;2030:	skulltrail_t *trail;
;2031:	trail = &cg.skulltrails[cent->currentState.number];
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 124
MULI4
ADDRGP4 cg+116488
ADDP4
ASGNP4
line 2032
;2032:	tokens = cent->currentState.generic1;
ADDRLP4 180
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
ASGNI4
line 2033
;2033:	if ( !tokens ) {
ADDRLP4 180
INDIRI4
CNSTI4 0
NEI4 $1052
line 2034
;2034:		trail->numpositions = 0;
ADDRLP4 4
INDIRP4
CNSTI4 120
ADDP4
CNSTI4 0
ASGNI4
line 2035
;2035:		return;
ADDRGP4 $1050
JUMPV
LABELV $1052
line 2038
;2036:	}
;2037:
;2038:	if ( tokens > MAX_SKULLTRAIL ) {
ADDRLP4 180
INDIRI4
CNSTI4 10
LEI4 $1054
line 2039
;2039:		tokens = MAX_SKULLTRAIL;
ADDRLP4 180
CNSTI4 10
ASGNI4
line 2040
;2040:	}
LABELV $1054
line 2043
;2041:
;2042:	// add skulls if there are more than last time
;2043:	for (i = 0; i < tokens - trail->numpositions; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $1059
JUMPV
LABELV $1056
line 2044
;2044:		for (j = trail->numpositions; j > 0; j--) {
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1063
JUMPV
LABELV $1060
line 2045
;2045:			VectorCopy(trail->positions[j-1], trail->positions[j]);
ADDRLP4 0
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 12
MULI4
CNSTI4 12
SUBI4
ADDRLP4 4
INDIRP4
ADDP4
INDIRB
ASGNB 12
line 2046
;2046:		}
LABELV $1061
line 2044
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $1063
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $1060
line 2047
;2047:		VectorCopy(cent->lerpOrigin, trail->positions[0]);
ADDRLP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 2048
;2048:	}
LABELV $1057
line 2043
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1059
ADDRLP4 8
INDIRI4
ADDRLP4 180
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
SUBI4
LTI4 $1056
line 2049
;2049:	trail->numpositions = tokens;
ADDRLP4 4
INDIRP4
CNSTI4 120
ADDP4
ADDRLP4 180
INDIRI4
ASGNI4
line 2052
;2050:
;2051:	// move all the skulls along the trail
;2052:	VectorCopy(cent->lerpOrigin, origin);
ADDRLP4 152
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 2053
;2053:	for (i = 0; i < trail->numpositions; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $1067
JUMPV
LABELV $1064
line 2054
;2054:		VectorSubtract(trail->positions[i], origin, dir);
ADDRLP4 164
ADDRLP4 8
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
INDIRP4
ADDP4
INDIRF4
ADDRLP4 152
INDIRF4
SUBF4
ASGNF4
ADDRLP4 164+4
ADDRLP4 8
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 152+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 164+8
ADDRLP4 8
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 152+8
INDIRF4
SUBF4
ASGNF4
line 2055
;2055:		if (VectorNormalize(dir) > 30) {
ADDRLP4 164
ARGP4
ADDRLP4 192
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 192
INDIRF4
CNSTF4 1106247680
LEF4 $1072
line 2056
;2056:			VectorMA(origin, 30, dir, trail->positions[i]);
ADDRLP4 8
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 152
INDIRF4
ADDRLP4 164
INDIRF4
CNSTF4 1106247680
MULF4
ADDF4
ASGNF4
ADDRLP4 8
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 4
ADDP4
ADDRLP4 152+4
INDIRF4
ADDRLP4 164+4
INDIRF4
CNSTF4 1106247680
MULF4
ADDF4
ASGNF4
ADDRLP4 8
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 152+8
INDIRF4
ADDRLP4 164+8
INDIRF4
CNSTF4 1106247680
MULF4
ADDF4
ASGNF4
line 2057
;2057:		}
LABELV $1072
line 2058
;2058:		VectorCopy(trail->positions[i], origin);
ADDRLP4 152
ADDRLP4 8
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
INDIRP4
ADDP4
INDIRB
ASGNB 12
line 2059
;2059:	}
LABELV $1065
line 2053
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1067
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
LTI4 $1064
line 2061
;2060:
;2061:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 12
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2062
;2062:	if( cgs.clientinfo[ cent->currentState.clientNum ].team == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996+36
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1078
line 2063
;2063:		ent.hModel = cgs.media.redCubeModel;
ADDRLP4 12+8
ADDRGP4 cgs+148692+20
INDIRI4
ASGNI4
line 2064
;2064:	} else {
ADDRGP4 $1079
JUMPV
LABELV $1078
line 2065
;2065:		ent.hModel = cgs.media.blueCubeModel;
ADDRLP4 12+8
ADDRGP4 cgs+148692+24
INDIRI4
ASGNI4
line 2066
;2066:	}
LABELV $1079
line 2067
;2067:	ent.renderfx = renderfx;
ADDRLP4 12+4
ADDRFP4 4
INDIRI4
ASGNI4
line 2069
;2068:
;2069:	VectorCopy(cent->lerpOrigin, origin);
ADDRLP4 152
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 2070
;2070:	for (i = 0; i < trail->numpositions; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $1092
JUMPV
LABELV $1089
line 2071
;2071:		VectorSubtract(origin, trail->positions[i], ent.axis[0]);
ADDRLP4 12+28
ADDRLP4 152
INDIRF4
ADDRLP4 8
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
INDIRP4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+28+4
ADDRLP4 152+4
INDIRF4
ADDRLP4 8
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+28+8
ADDRLP4 152+8
INDIRF4
ADDRLP4 8
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2072
;2072:		ent.axis[0][2] = 0;
ADDRLP4 12+28+8
CNSTF4 0
ASGNF4
line 2073
;2073:		VectorNormalize(ent.axis[0]);
ADDRLP4 12+28
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2074
;2074:		VectorSet(ent.axis[2], 0, 0, 1);
ADDRLP4 12+28+24
CNSTF4 0
ASGNF4
ADDRLP4 12+28+24+4
CNSTF4 0
ASGNF4
ADDRLP4 12+28+24+8
CNSTF4 1065353216
ASGNF4
line 2075
;2075:		CrossProduct(ent.axis[0], ent.axis[2], ent.axis[1]);
ADDRLP4 12+28
ARGP4
ADDRLP4 12+28+24
ARGP4
ADDRLP4 12+28+12
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 2077
;2076:
;2077:		VectorCopy(trail->positions[i], ent.origin);
ADDRLP4 12+68
ADDRLP4 8
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
INDIRP4
ADDP4
INDIRB
ASGNB 12
line 2078
;2078:		angle = (((cg.time + 500 * MAX_SKULLTRAIL - 500 * i) / 16) & 255) * (M_PI * 2) / 255;
ADDRLP4 176
ADDRGP4 cg+107604
INDIRI4
CNSTI4 5000
ADDI4
ADDRLP4 8
INDIRI4
CNSTI4 500
MULI4
SUBI4
CNSTI4 16
DIVI4
CNSTI4 255
BANDI4
CVIF4 4
CNSTF4 1019861428
MULF4
ASGNF4
line 2079
;2079:		ent.origin[2] += sin(angle) * 10;
ADDRLP4 176
INDIRF4
ARGF4
ADDRLP4 184
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 12+68+8
ADDRLP4 12+68+8
INDIRF4
ADDRLP4 184
INDIRF4
CNSTF4 1092616192
MULF4
ADDF4
ASGNF4
line 2080
;2080:		trap_R_AddRefEntityToScene( &ent );
ADDRLP4 12
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2081
;2081:		VectorCopy(trail->positions[i], origin);
ADDRLP4 152
ADDRLP4 8
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
INDIRP4
ADDP4
INDIRB
ASGNB 12
line 2082
;2082:	}
LABELV $1090
line 2070
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1092
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
LTI4 $1089
line 2083
;2083:}
LABELV $1050
endproc CG_PlayerTokens 196 12
proc CG_PlayerPowerups 12 20
line 2091
;2084:
;2085:
;2086:/*
;2087:===============
;2088:CG_PlayerPowerups
;2089:===============
;2090:*/
;2091:static void CG_PlayerPowerups( centity_t *cent, refEntity_t *torso ) {
line 2095
;2092:	int		powerups;
;2093:	clientInfo_t	*ci;
;2094:
;2095:	powerups = cent->currentState.powerups;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ASGNI4
line 2096
;2096:	if ( !powerups ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1121
line 2097
;2097:		return;
ADDRGP4 $1120
JUMPV
LABELV $1121
line 2101
;2098:	}
;2099:
;2100:	// quad gives a dlight
;2101:	if ( powerups & ( 1 << PW_QUAD ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1123
line 2102
;2102:		if ( cgs.clientinfo[ cent->currentState.clientNum ].team == TEAM_RED ) {
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996+36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1125
line 2103
;2103:			trap_R_AddLightToScene( cent->lerpOrigin, ( POWERUP_GLOW_RADIUS + (rand() & POWERUP_GLOW_RADIUS_MOD) ), 1.0f, 0.2f, 0.2f );
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 200
ADDI4
CVIF4 4
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1045220557
ARGF4
CNSTF4 1045220557
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 2104
;2104:		} else {
ADDRGP4 $1126
JUMPV
LABELV $1125
line 2105
;2105:			trap_R_AddLightToScene( cent->lerpOrigin, ( POWERUP_GLOW_RADIUS + (rand() & POWERUP_GLOW_RADIUS_MOD) ), 0.2f, 0.2f, 1.0f );
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 200
ADDI4
CVIF4 4
ARGF4
CNSTF4 1045220557
ARGF4
CNSTF4 1045220557
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 2106
;2106:		}
LABELV $1126
line 2107
;2107:	}
LABELV $1123
line 2110
;2108:
;2109:	// flight plays a looped sound
;2110:	if ( powerups & ( 1 << PW_FLIGHT ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $1129
line 2111
;2111:		trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, cgs.media.flightSound );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRGP4 cgs+148692+1008
INDIRI4
ARGI4
ADDRGP4 trap_S_AddLoopingSound
CALLV
pop
line 2112
;2112:	}
LABELV $1129
line 2114
;2113:
;2114:	ci = &cgs.clientinfo[ cent->currentState.clientNum ];
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 2116
;2115:	// redflag
;2116:	if ( powerups & ( 1 << PW_REDFLAG ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $1134
line 2117
;2117:		if (ci->newAnims) {
ADDRLP4 4
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1136
line 2118
;2118:			CG_PlayerFlag( cent, cgs.media.redFlagFlapSkin, torso );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+96
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_PlayerFlag
CALLV
pop
line 2119
;2119:		}
ADDRGP4 $1137
JUMPV
LABELV $1136
line 2120
;2120:		else {
line 2121
;2121:			CG_TrailItem( cent, cgs.media.redFlagModel );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+36
INDIRI4
ARGI4
ADDRGP4 CG_TrailItem
CALLV
pop
line 2122
;2122:		}
LABELV $1137
line 2123
;2123:		trap_R_AddLightToScene( cent->lerpOrigin, ( POWERUP_GLOW_RADIUS + (rand() & POWERUP_GLOW_RADIUS_MOD) ), 1.0f, 0.2f, 0.2f );
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 200
ADDI4
CVIF4 4
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1045220557
ARGF4
CNSTF4 1045220557
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 2124
;2124:	}
LABELV $1134
line 2127
;2125:
;2126:	// blueflag
;2127:	if ( powerups & ( 1 << PW_BLUEFLAG ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $1142
line 2128
;2128:		if (ci->newAnims){
ADDRLP4 4
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1144
line 2129
;2129:			CG_PlayerFlag( cent, cgs.media.blueFlagFlapSkin, torso );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+100
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_PlayerFlag
CALLV
pop
line 2130
;2130:		}
ADDRGP4 $1145
JUMPV
LABELV $1144
line 2131
;2131:		else {
line 2132
;2132:			CG_TrailItem( cent, cgs.media.blueFlagModel );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+40
INDIRI4
ARGI4
ADDRGP4 CG_TrailItem
CALLV
pop
line 2133
;2133:		}
LABELV $1145
line 2134
;2134:		trap_R_AddLightToScene( cent->lerpOrigin, ( POWERUP_GLOW_RADIUS + (rand() & POWERUP_GLOW_RADIUS_MOD) ), 0.2f, 0.2f, 1.0f );
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 200
ADDI4
CVIF4 4
ARGF4
CNSTF4 1045220557
ARGF4
CNSTF4 1045220557
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 2135
;2135:	}
LABELV $1142
line 2138
;2136:
;2137:	// neutralflag
;2138:	if ( powerups & ( 1 << PW_NEUTRALFLAG ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $1150
line 2139
;2139:		if (ci->newAnims) {
ADDRLP4 4
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1152
line 2140
;2140:			CG_PlayerFlag( cent, cgs.media.neutralFlagFlapSkin, torso );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+104
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_PlayerFlag
CALLV
pop
line 2141
;2141:		}
ADDRGP4 $1153
JUMPV
LABELV $1152
line 2142
;2142:		else {
line 2143
;2143:			CG_TrailItem( cent, cgs.media.neutralFlagModel );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+44
INDIRI4
ARGI4
ADDRGP4 CG_TrailItem
CALLV
pop
line 2144
;2144:		}
LABELV $1153
line 2145
;2145:		trap_R_AddLightToScene( cent->lerpOrigin, ( POWERUP_GLOW_RADIUS + (rand() & POWERUP_GLOW_RADIUS_MOD) ), 1.0f, 1.0f, 1.0f );
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 200
ADDI4
CVIF4 4
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 2146
;2146:	}
LABELV $1150
line 2149
;2147:
;2148:	// haste leaves smoke trails
;2149:	if ( powerups & ( 1 << PW_HASTE ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $1158
line 2150
;2150:		CG_HasteTrail( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_HasteTrail
CALLV
pop
line 2151
;2151:	}
LABELV $1158
line 2152
;2152:}
LABELV $1120
endproc CG_PlayerPowerups 12 20
proc CG_PlayerFloatSprite 144 12
line 2162
;2153:
;2154:
;2155:/*
;2156:===============
;2157:CG_PlayerFloatSprite
;2158:
;2159:Float a sprite over the player's head
;2160:===============
;2161:*/
;2162:static void CG_PlayerFloatSprite( const centity_t *cent, qhandle_t shader ) {
line 2166
;2163:	int				rf;
;2164:	refEntity_t		ent;
;2165:
;2166:	if ( cent->currentState.number == cg.snap->ps.clientNum && !cg.renderingThirdPerson ) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $1161
ADDRGP4 cg+107628
INDIRI4
CNSTI4 0
NEI4 $1161
line 2167
;2167:		rf = RF_THIRD_PERSON;		// only show in mirrors
ADDRLP4 140
CNSTI4 2
ASGNI4
line 2168
;2168:	} else {
ADDRGP4 $1162
JUMPV
LABELV $1161
line 2169
;2169:		rf = 0;
ADDRLP4 140
CNSTI4 0
ASGNI4
line 2170
;2170:	}
LABELV $1162
line 2172
;2171:
;2172:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2173
;2173:	VectorCopy( cent->lerpOrigin, ent.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 2174
;2174:	ent.origin[2] += 48;
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
CNSTF4 1111490560
ADDF4
ASGNF4
line 2175
;2175:	ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 2176
;2176:	ent.customShader = shader;
ADDRLP4 0+112
ADDRFP4 4
INDIRI4
ASGNI4
line 2177
;2177:	ent.radius = 10;
ADDRLP4 0+132
CNSTF4 1092616192
ASGNF4
line 2178
;2178:	ent.renderfx = rf;
ADDRLP4 0+4
ADDRLP4 140
INDIRI4
ASGNI4
line 2179
;2179:	ent.shaderRGBA[0] = 255;
ADDRLP4 0+116
CNSTU1 255
ASGNU1
line 2180
;2180:	ent.shaderRGBA[1] = 255;
ADDRLP4 0+116+1
CNSTU1 255
ASGNU1
line 2181
;2181:	ent.shaderRGBA[2] = 255;
ADDRLP4 0+116+2
CNSTU1 255
ASGNU1
line 2182
;2182:	ent.shaderRGBA[3] = 255;
ADDRLP4 0+116+3
CNSTU1 255
ASGNU1
line 2183
;2183:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2184
;2184:}
LABELV $1160
endproc CG_PlayerFloatSprite 144 12
proc CG_PlayerSprites 4 8
line 2194
;2185:
;2186:
;2187:/*
;2188:===============
;2189:CG_PlayerSprites
;2190:
;2191:Float sprites over the player's head
;2192:===============
;2193:*/
;2194:static void CG_PlayerSprites( centity_t *cent ) {
line 2197
;2195:	int		team;
;2196:
;2197:	if ( cent->currentState.eFlags & EF_CONNECTION ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $1179
line 2198
;2198:		CG_PlayerFloatSprite( cent, cgs.media.connectionShader );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+240
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2199
;2199:		return;
ADDRGP4 $1178
JUMPV
LABELV $1179
line 2202
;2200:	}
;2201:
;2202:	if ( cent->currentState.eFlags & EF_TALK ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $1183
line 2203
;2203:		CG_PlayerFloatSprite( cent, cgs.media.balloonShader );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+236
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2204
;2204:		return;
ADDRGP4 $1178
JUMPV
LABELV $1183
line 2207
;2205:	}
;2206:
;2207:	if ( cent->currentState.eFlags & EF_AWARD_IMPRESSIVE ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $1187
line 2208
;2208:		CG_PlayerFloatSprite( cent, cgs.media.medalImpressive );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+584
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2209
;2209:		return;
ADDRGP4 $1178
JUMPV
LABELV $1187
line 2212
;2210:	}
;2211:
;2212:	if ( cent->currentState.eFlags & EF_AWARD_EXCELLENT ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $1191
line 2213
;2213:		CG_PlayerFloatSprite( cent, cgs.media.medalExcellent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+588
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2214
;2214:		return;
ADDRGP4 $1178
JUMPV
LABELV $1191
line 2217
;2215:	}
;2216:
;2217:	if ( cent->currentState.eFlags & EF_AWARD_GAUNTLET ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $1195
line 2218
;2218:		CG_PlayerFloatSprite( cent, cgs.media.medalGauntlet );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+592
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2219
;2219:		return;
ADDRGP4 $1178
JUMPV
LABELV $1195
line 2222
;2220:	}
;2221:
;2222:	if ( cent->currentState.eFlags & EF_AWARD_DEFEND ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 65536
BANDI4
CNSTI4 0
EQI4 $1199
line 2223
;2223:		CG_PlayerFloatSprite( cent, cgs.media.medalDefend );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+596
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2224
;2224:		return;
ADDRGP4 $1178
JUMPV
LABELV $1199
line 2227
;2225:	}
;2226:
;2227:	if ( cent->currentState.eFlags & EF_AWARD_ASSIST ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 131072
BANDI4
CNSTI4 0
EQI4 $1203
line 2228
;2228:		CG_PlayerFloatSprite( cent, cgs.media.medalAssist );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+600
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2229
;2229:		return;
ADDRGP4 $1178
JUMPV
LABELV $1203
line 2232
;2230:	}
;2231:
;2232:	if ( cent->currentState.eFlags & EF_AWARD_CAP ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $1207
line 2233
;2233:		CG_PlayerFloatSprite( cent, cgs.media.medalCapture );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+604
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2234
;2234:		return;
ADDRGP4 $1178
JUMPV
LABELV $1207
line 2237
;2235:	}
;2236:
;2237:	team = cgs.clientinfo[ cent->currentState.clientNum ].team;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996+36
ADDP4
INDIRI4
ASGNI4
line 2238
;2238:	if ( !(cent->currentState.eFlags & EF_DEAD) && 
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $1213
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1213
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $1213
line 2240
;2239:		cg.snap->ps.persistant[PERS_TEAM] == team &&
;2240:		cgs.gametype >= GT_TDM) {
line 2241
;2241:		if (cg_drawFriend.integer) {
ADDRGP4 cg_drawFriend+12
INDIRI4
CNSTI4 0
EQI4 $1178
line 2242
;2242:			CG_PlayerFloatSprite( cent, cgs.media.friendShader );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+232
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2243
;2243:		}
line 2244
;2244:		return;
LABELV $1213
line 2246
;2245:	}
;2246:}
LABELV $1178
endproc CG_PlayerSprites 4 8
data
align 4
LABELV $1223
byte 4 3245342720
byte 4 3245342720
byte 4 0
align 4
LABELV $1224
byte 4 1097859072
byte 4 1097859072
byte 4 1073741824
code
proc CG_PlayerShadow 100 44
line 2259
;2247:
;2248:
;2249:/*
;2250:===============
;2251:CG_PlayerShadow
;2252:
;2253:Returns the Z component of the surface being shadowed
;2254:
;2255:  should it return a full plane instead of a Z?
;2256:===============
;2257:*/
;2258:#define	SHADOW_DISTANCE		128
;2259:static qboolean CG_PlayerShadow( centity_t *cent, float *shadowPlane ) {
line 2260
;2260:	vec3_t		end, mins = {-15, -15, 0}, maxs = {15, 15, 2};
ADDRLP4 72
ADDRGP4 $1223
INDIRB
ASGNB 12
ADDRLP4 84
ADDRGP4 $1224
INDIRB
ASGNB 12
line 2264
;2261:	trace_t		trace;
;2262:	float		alpha;
;2263:
;2264:	*shadowPlane = 0;
ADDRFP4 4
INDIRP4
CNSTF4 0
ASGNF4
line 2266
;2265:
;2266:	if ( cg_shadows.integer == 0 ) {
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 0
NEI4 $1225
line 2267
;2267:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1222
JUMPV
LABELV $1225
line 2271
;2268:	}
;2269:
;2270:	// no shadows when invisible
;2271:	if ( cent->currentState.powerups & ( 1 << PW_INVIS ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1228
line 2272
;2272:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1222
JUMPV
LABELV $1228
line 2276
;2273:	}
;2274:
;2275:	// send a trace down from the player to the ground
;2276:	VectorCopy( cent->lerpOrigin, end );
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 2277
;2277:	end[2] -= SHADOW_DISTANCE;
ADDRLP4 60+8
ADDRLP4 60+8
INDIRF4
CNSTF4 1124073472
SUBF4
ASGNF4
line 2279
;2278:
;2279:	trap_CM_BoxTrace( &trace, cent->lerpOrigin, end, mins, maxs, 0, MASK_PLAYERSOLID );
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRLP4 60
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 84
ARGP4
CNSTI4 0
ARGI4
CNSTI4 33619969
ARGI4
ADDRGP4 trap_CM_BoxTrace
CALLV
pop
line 2282
;2280:
;2281:	// no shadow if too high
;2282:	if ( trace.fraction == 1.0 || trace.startsolid || trace.allsolid ) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $1236
ADDRLP4 0+4
INDIRI4
CNSTI4 0
NEI4 $1236
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1231
LABELV $1236
line 2283
;2283:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1222
JUMPV
LABELV $1231
line 2286
;2284:	}
;2285:
;2286:	*shadowPlane = trace.endpos[2] + 1;
ADDRFP4 4
INDIRP4
ADDRLP4 0+12+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2288
;2287:
;2288:	if ( cg_shadows.integer != 1 ) {	// no mark for stencil or projection shadows
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 1
EQI4 $1239
line 2289
;2289:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1222
JUMPV
LABELV $1239
line 2293
;2290:	}
;2291:
;2292:	// fade the shadow out with height
;2293:	alpha = 1.0 - trace.fraction;
ADDRLP4 56
CNSTF4 1065353216
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 2300
;2294:
;2295:	// bk0101022 - hack / FPE - bogus planes?
;2296:	//assert( DotProduct( trace.plane.normal, trace.plane.normal ) != 0.0f ) 
;2297:
;2298:	// add the mark as a temporary, so it goes directly to the renderer
;2299:	// without taking a spot in the cg_marks array
;2300:	CG_ImpactMark( cgs.media.shadowMarkShader, trace.endpos, trace.plane.normal, 
ADDRGP4 cgs+148692+384
INDIRI4
ARGI4
ADDRLP4 0+12
ARGP4
ADDRLP4 0+24
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
INDIRF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
CNSTI4 0
ARGI4
CNSTF4 1103101952
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 CG_ImpactMark
CALLV
pop
line 2303
;2301:		cent->pe.legs.yawAngle, alpha,alpha,alpha,1, qfalse, 24, qtrue );
;2302:
;2303:	return qtrue;
CNSTI4 1
RETI4
LABELV $1222
endproc CG_PlayerShadow 100 44
proc CG_PlayerSplash 188 28
line 2314
;2304:}
;2305:
;2306:
;2307:/*
;2308:===============
;2309:CG_PlayerSplash
;2310:
;2311:Draw a mark at the water surface
;2312:===============
;2313:*/
;2314:static void CG_PlayerSplash( const centity_t *cent ) {
line 2320
;2315:	vec3_t		start, end;
;2316:	trace_t		trace;
;2317:	int			contents;
;2318:	polyVert_t	verts[4];
;2319:
;2320:	if ( !cg_shadows.integer ) {
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 0
NEI4 $1248
line 2321
;2321:		return;
ADDRGP4 $1247
JUMPV
LABELV $1248
line 2324
;2322:	}
;2323:
;2324:	VectorCopy( cent->lerpOrigin, end );
ADDRLP4 164
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 2325
;2325:	end[2] -= 24;
ADDRLP4 164+8
ADDRLP4 164+8
INDIRF4
CNSTF4 1103101952
SUBF4
ASGNF4
line 2329
;2326:
;2327:	// if the feet aren't in liquid, don't make a mark
;2328:	// this won't handle moving water brushes, but they wouldn't draw right anyway...
;2329:	contents = CG_PointContents( end, 0 );
ADDRLP4 164
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 180
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 176
ADDRLP4 180
INDIRI4
ASGNI4
line 2330
;2330:	if ( !( contents & ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) ) ) {
ADDRLP4 176
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
NEI4 $1252
line 2331
;2331:		return;
ADDRGP4 $1247
JUMPV
LABELV $1252
line 2334
;2332:	}
;2333:
;2334:	VectorCopy( cent->lerpOrigin, start );
ADDRLP4 152
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 2335
;2335:	start[2] += 32;
ADDRLP4 152+8
ADDRLP4 152+8
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 2338
;2336:
;2337:	// if the head isn't out of liquid, don't make a mark
;2338:	contents = CG_PointContents( start, 0 );
ADDRLP4 152
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 184
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 176
ADDRLP4 184
INDIRI4
ASGNI4
line 2339
;2339:	if ( contents & ( CONTENTS_SOLID | CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) ) {
ADDRLP4 176
INDIRI4
CNSTI4 57
BANDI4
CNSTI4 0
EQI4 $1255
line 2340
;2340:		return;
ADDRGP4 $1247
JUMPV
LABELV $1255
line 2344
;2341:	}
;2342:
;2343:	// trace down to find the surface
;2344:	trap_CM_BoxTrace( &trace, start, end, NULL, NULL, 0, ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) );
ADDRLP4 96
ARGP4
ADDRLP4 152
ARGP4
ADDRLP4 164
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 trap_CM_BoxTrace
CALLV
pop
line 2346
;2345:
;2346:	if ( trace.fraction == 1.0 ) {
ADDRLP4 96+8
INDIRF4
CNSTF4 1065353216
NEF4 $1257
line 2347
;2347:		return;
ADDRGP4 $1247
JUMPV
LABELV $1257
line 2351
;2348:	}
;2349:
;2350:	// create a mark polygon
;2351:	VectorCopy( trace.endpos, verts[0].xyz );
ADDRLP4 0
ADDRLP4 96+12
INDIRB
ASGNB 12
line 2352
;2352:	verts[0].xyz[0] -= 32;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 2353
;2353:	verts[0].xyz[1] -= 32;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 2354
;2354:	verts[0].st[0] = 0;
ADDRLP4 0+12
CNSTF4 0
ASGNF4
line 2355
;2355:	verts[0].st[1] = 0;
ADDRLP4 0+12+4
CNSTF4 0
ASGNF4
line 2356
;2356:	verts[0].modulate[0] = 255;
ADDRLP4 0+20
CNSTU1 255
ASGNU1
line 2357
;2357:	verts[0].modulate[1] = 255;
ADDRLP4 0+20+1
CNSTU1 255
ASGNU1
line 2358
;2358:	verts[0].modulate[2] = 255;
ADDRLP4 0+20+2
CNSTU1 255
ASGNU1
line 2359
;2359:	verts[0].modulate[3] = 255;
ADDRLP4 0+20+3
CNSTU1 255
ASGNU1
line 2361
;2360:
;2361:	VectorCopy( trace.endpos, verts[1].xyz );
ADDRLP4 0+24
ADDRLP4 96+12
INDIRB
ASGNB 12
line 2362
;2362:	verts[1].xyz[0] -= 32;
ADDRLP4 0+24
ADDRLP4 0+24
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 2363
;2363:	verts[1].xyz[1] += 32;
ADDRLP4 0+24+4
ADDRLP4 0+24+4
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 2364
;2364:	verts[1].st[0] = 0;
ADDRLP4 0+24+12
CNSTF4 0
ASGNF4
line 2365
;2365:	verts[1].st[1] = 1;
ADDRLP4 0+24+12+4
CNSTF4 1065353216
ASGNF4
line 2366
;2366:	verts[1].modulate[0] = 255;
ADDRLP4 0+24+20
CNSTU1 255
ASGNU1
line 2367
;2367:	verts[1].modulate[1] = 255;
ADDRLP4 0+24+20+1
CNSTU1 255
ASGNU1
line 2368
;2368:	verts[1].modulate[2] = 255;
ADDRLP4 0+24+20+2
CNSTU1 255
ASGNU1
line 2369
;2369:	verts[1].modulate[3] = 255;
ADDRLP4 0+24+20+3
CNSTU1 255
ASGNU1
line 2371
;2370:
;2371:	VectorCopy( trace.endpos, verts[2].xyz );
ADDRLP4 0+48
ADDRLP4 96+12
INDIRB
ASGNB 12
line 2372
;2372:	verts[2].xyz[0] += 32;
ADDRLP4 0+48
ADDRLP4 0+48
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 2373
;2373:	verts[2].xyz[1] += 32;
ADDRLP4 0+48+4
ADDRLP4 0+48+4
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 2374
;2374:	verts[2].st[0] = 1;
ADDRLP4 0+48+12
CNSTF4 1065353216
ASGNF4
line 2375
;2375:	verts[2].st[1] = 1;
ADDRLP4 0+48+12+4
CNSTF4 1065353216
ASGNF4
line 2376
;2376:	verts[2].modulate[0] = 255;
ADDRLP4 0+48+20
CNSTU1 255
ASGNU1
line 2377
;2377:	verts[2].modulate[1] = 255;
ADDRLP4 0+48+20+1
CNSTU1 255
ASGNU1
line 2378
;2378:	verts[2].modulate[2] = 255;
ADDRLP4 0+48+20+2
CNSTU1 255
ASGNU1
line 2379
;2379:	verts[2].modulate[3] = 255;
ADDRLP4 0+48+20+3
CNSTU1 255
ASGNU1
line 2381
;2380:
;2381:	VectorCopy( trace.endpos, verts[3].xyz );
ADDRLP4 0+72
ADDRLP4 96+12
INDIRB
ASGNB 12
line 2382
;2382:	verts[3].xyz[0] += 32;
ADDRLP4 0+72
ADDRLP4 0+72
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 2383
;2383:	verts[3].xyz[1] -= 32;
ADDRLP4 0+72+4
ADDRLP4 0+72+4
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 2384
;2384:	verts[3].st[0] = 1;
ADDRLP4 0+72+12
CNSTF4 1065353216
ASGNF4
line 2385
;2385:	verts[3].st[1] = 0;
ADDRLP4 0+72+12+4
CNSTF4 0
ASGNF4
line 2386
;2386:	verts[3].modulate[0] = 255;
ADDRLP4 0+72+20
CNSTU1 255
ASGNU1
line 2387
;2387:	verts[3].modulate[1] = 255;
ADDRLP4 0+72+20+1
CNSTU1 255
ASGNU1
line 2388
;2388:	verts[3].modulate[2] = 255;
ADDRLP4 0+72+20+2
CNSTU1 255
ASGNU1
line 2389
;2389:	verts[3].modulate[3] = 255;
ADDRLP4 0+72+20+3
CNSTU1 255
ASGNU1
line 2391
;2390:
;2391:	trap_R_AddPolyToScene( cgs.media.wakeMarkShader, 4, verts );
ADDRGP4 cgs+148692+408
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddPolyToScene
CALLV
pop
line 2392
;2392:}
LABELV $1247
endproc CG_PlayerSplash 188 28
export CG_AddRefEntityWithPowerups
proc CG_AddRefEntityWithPowerups 0 4
line 2403
;2393:
;2394:
;2395:/*
;2396:===============
;2397:CG_AddRefEntityWithPowerups
;2398:
;2399:Adds a piece with modifications or duplications for powerups
;2400:Also called by CG_Missile for quad rockets, but nobody can tell...
;2401:===============
;2402:*/
;2403:void CG_AddRefEntityWithPowerups( refEntity_t *ent, entityState_t *state, int team ) {
line 2405
;2404:
;2405:	if ( state->powerups & ( 1 << PW_INVIS ) ) {
ADDRFP4 4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1338
line 2406
;2406:		ent->customShader = cgs.media.invisShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+148692+444
INDIRI4
ASGNI4
line 2407
;2407:		trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2408
;2408:	} else {
ADDRGP4 $1339
JUMPV
LABELV $1338
line 2418
;2409:		/*
;2410:		if ( state->eFlags & EF_KAMIKAZE ) {
;2411:			if (team == TEAM_BLUE)
;2412:				ent->customShader = cgs.media.blueKamikazeShader;
;2413:			else
;2414:				ent->customShader = cgs.media.redKamikazeShader;
;2415:			trap_R_AddRefEntityToScene( ent );
;2416:		}
;2417:		else {*/
;2418:			trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2421
;2419:		//}
;2420:
;2421:		if ( state->powerups & ( 1 << PW_QUAD ) )
ADDRFP4 4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1342
line 2422
;2422:		{
line 2423
;2423:			if (team == TEAM_RED)
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $1344
line 2424
;2424:				ent->customShader = cgs.media.redQuadShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+148692+436
INDIRI4
ASGNI4
ADDRGP4 $1345
JUMPV
LABELV $1344
line 2426
;2425:			else
;2426:				ent->customShader = cgs.media.quadShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+148692+432
INDIRI4
ASGNI4
LABELV $1345
line 2427
;2427:			trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2428
;2428:		}
LABELV $1342
line 2429
;2429:		if ( state->powerups & ( 1 << PW_REGEN ) ) {
ADDRFP4 4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $1350
line 2430
;2430:			if ( ( ( cg.time / 100 ) % 10 ) == 1 ) {
ADDRGP4 cg+107604
INDIRI4
CNSTI4 100
DIVI4
CNSTI4 10
MODI4
CNSTI4 1
NEI4 $1352
line 2431
;2431:				ent->customShader = cgs.media.regenShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+148692+448
INDIRI4
ASGNI4
line 2432
;2432:				trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2433
;2433:			}
LABELV $1352
line 2434
;2434:		}
LABELV $1350
line 2435
;2435:		if ( state->powerups & ( 1 << PW_BATTLESUIT ) ) {
ADDRFP4 4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $1357
line 2436
;2436:			ent->customShader = cgs.media.battleSuitShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+148692+452
INDIRI4
ASGNI4
line 2437
;2437:			trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2438
;2438:		}
LABELV $1357
line 2439
;2439:	}
LABELV $1339
line 2440
;2440:}
LABELV $1337
endproc CG_AddRefEntityWithPowerups 0 4
export CG_LightVerts
proc CG_LightVerts 88 16
line 2449
;2441:
;2442:
;2443:/*
;2444:=================
;2445:CG_LightVerts
;2446:=================
;2447:*/
;2448:int CG_LightVerts( vec3_t normal, int numVerts, polyVert_t *verts )
;2449:{
line 2456
;2450:	int				i, j;
;2451:	float			incoming;
;2452:	vec3_t			ambientLight;
;2453:	vec3_t			lightDir;
;2454:	vec3_t			directedLight;
;2455:
;2456:	trap_R_LightForPoint( verts[0].xyz, ambientLight, directedLight, lightDir );
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 trap_R_LightForPoint
CALLI4
pop
line 2458
;2457:
;2458:	for (i = 0; i < numVerts; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1365
JUMPV
LABELV $1362
line 2459
;2459:		incoming = DotProduct (normal, lightDir);
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 48
INDIRP4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDRLP4 48
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 48
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2460
;2460:		if ( incoming <= 0 ) {
ADDRLP4 8
INDIRF4
CNSTF4 0
GTF4 $1368
line 2461
;2461:			verts[i].modulate[0] = ambientLight[0];
ADDRLP4 56
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 60
CNSTF4 1325400064
ASGNF4
ADDRLP4 56
INDIRF4
ADDRLP4 60
INDIRF4
LTF4 $1371
ADDRLP4 52
ADDRLP4 56
INDIRF4
ADDRLP4 60
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1372
JUMPV
LABELV $1371
ADDRLP4 52
ADDRLP4 56
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1372
ADDRLP4 4
INDIRI4
CNSTI4 24
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
ADDRLP4 52
INDIRU4
CVUU1 4
ASGNU1
line 2462
;2462:			verts[i].modulate[1] = ambientLight[1];
ADDRLP4 68
ADDRLP4 12+4
INDIRF4
ASGNF4
ADDRLP4 72
CNSTF4 1325400064
ASGNF4
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
LTF4 $1375
ADDRLP4 64
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1376
JUMPV
LABELV $1375
ADDRLP4 64
ADDRLP4 68
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1376
ADDRLP4 4
INDIRI4
CNSTI4 24
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 21
ADDP4
ADDRLP4 64
INDIRU4
CVUU1 4
ASGNU1
line 2463
;2463:			verts[i].modulate[2] = ambientLight[2];
ADDRLP4 80
ADDRLP4 12+8
INDIRF4
ASGNF4
ADDRLP4 84
CNSTF4 1325400064
ASGNF4
ADDRLP4 80
INDIRF4
ADDRLP4 84
INDIRF4
LTF4 $1379
ADDRLP4 76
ADDRLP4 80
INDIRF4
ADDRLP4 84
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1380
JUMPV
LABELV $1379
ADDRLP4 76
ADDRLP4 80
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1380
ADDRLP4 4
INDIRI4
CNSTI4 24
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 22
ADDP4
ADDRLP4 76
INDIRU4
CVUU1 4
ASGNU1
line 2464
;2464:			verts[i].modulate[3] = 255;
ADDRLP4 4
INDIRI4
CNSTI4 24
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 23
ADDP4
CNSTU1 255
ASGNU1
line 2465
;2465:			continue;
ADDRGP4 $1363
JUMPV
LABELV $1368
line 2467
;2466:		} 
;2467:		j = ( ambientLight[0] + incoming * directedLight[0] );
ADDRLP4 0
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 2468
;2468:		if ( j > 255 ) {
ADDRLP4 0
INDIRI4
CNSTI4 255
LEI4 $1381
line 2469
;2469:			j = 255;
ADDRLP4 0
CNSTI4 255
ASGNI4
line 2470
;2470:		}
LABELV $1381
line 2471
;2471:		verts[i].modulate[0] = j;
ADDRLP4 4
INDIRI4
CNSTI4 24
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
ADDRLP4 0
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 2473
;2472:
;2473:		j = ( ambientLight[1] + incoming * directedLight[1] );
ADDRLP4 0
ADDRLP4 12+4
INDIRF4
ADDRLP4 8
INDIRF4
ADDRLP4 36+4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 2474
;2474:		if ( j > 255 ) {
ADDRLP4 0
INDIRI4
CNSTI4 255
LEI4 $1385
line 2475
;2475:			j = 255;
ADDRLP4 0
CNSTI4 255
ASGNI4
line 2476
;2476:		}
LABELV $1385
line 2477
;2477:		verts[i].modulate[1] = j;
ADDRLP4 4
INDIRI4
CNSTI4 24
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 21
ADDP4
ADDRLP4 0
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 2479
;2478:
;2479:		j = ( ambientLight[2] + incoming * directedLight[2] );
ADDRLP4 0
ADDRLP4 12+8
INDIRF4
ADDRLP4 8
INDIRF4
ADDRLP4 36+8
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 2480
;2480:		if ( j > 255 ) {
ADDRLP4 0
INDIRI4
CNSTI4 255
LEI4 $1389
line 2481
;2481:			j = 255;
ADDRLP4 0
CNSTI4 255
ASGNI4
line 2482
;2482:		}
LABELV $1389
line 2483
;2483:		verts[i].modulate[2] = j;
ADDRLP4 4
INDIRI4
CNSTI4 24
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 22
ADDP4
ADDRLP4 0
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 2485
;2484:
;2485:		verts[i].modulate[3] = 255;
ADDRLP4 4
INDIRI4
CNSTI4 24
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 23
ADDP4
CNSTU1 255
ASGNU1
line 2486
;2486:	}
LABELV $1363
line 2458
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1365
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $1362
line 2487
;2487:	return qtrue;
CNSTI4 1
RETI4
LABELV $1361
endproc CG_LightVerts 88 16
export CG_Player
proc CG_Player 812 28
line 2496
;2488:}
;2489:
;2490:
;2491:/*
;2492:===============
;2493:CG_Player
;2494:===============
;2495:*/
;2496:void CG_Player( centity_t *cent ) {
line 2516
;2497:	clientInfo_t	*ci;
;2498:	refEntity_t		legs;
;2499:	refEntity_t		torso;
;2500:	refEntity_t		head;
;2501:	int				clientNum;
;2502:	int				renderfx;
;2503:	qboolean		shadow;
;2504:	float			shadowPlane;
;2505:	refEntity_t		skull;
;2506:	refEntity_t		powerup;
;2507:	int				t;
;2508:	float			c;
;2509:	float			angle;
;2510:	vec3_t			dir, angles;
;2511:	qboolean		darken;
;2512:
;2513:	// the client number is stored in clientNum.  It can't be derived
;2514:	// from the entity number, because a single client may have
;2515:	// multiple corpses on the level using the same clientinfo
;2516:	clientNum = cent->currentState.clientNum;
ADDRLP4 752
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 2517
;2517:	if ( (unsigned) clientNum >= MAX_CLIENTS ) {
ADDRLP4 752
INDIRI4
CVIU4 4
CNSTU4 64
LTU4 $1392
line 2518
;2518:		CG_Error( "Bad clientNum on player entity" );
ADDRGP4 $1394
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 2519
;2519:	}
LABELV $1392
line 2520
;2520:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 280
ADDRLP4 752
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 2524
;2521:
;2522:	// it is possible to see corpses from disconnected players that may
;2523:	// not have valid clientinfo
;2524:	if ( !ci->infoValid ) {
ADDRLP4 280
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $1396
line 2525
;2525:		return;
ADDRGP4 $1391
JUMPV
LABELV $1396
line 2529
;2526:	}
;2527:
;2528:	// get the player model information
;2529:	renderfx = 0;
ADDRLP4 704
CNSTI4 0
ASGNI4
line 2530
;2530:	if ( cent->currentState.number == cg.snap->ps.clientNum) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $1398
line 2531
;2531:		if (!cg.renderingThirdPerson) {
ADDRGP4 cg+107628
INDIRI4
CNSTI4 0
NEI4 $1401
line 2532
;2532:			renderfx = RF_THIRD_PERSON;			// only draw in mirrors
ADDRLP4 704
CNSTI4 2
ASGNI4
line 2533
;2533:		} else {
ADDRGP4 $1402
JUMPV
LABELV $1401
line 2534
;2534:			if (cg_cameraMode.integer) {
ADDRGP4 cg_cameraMode+12
INDIRI4
CNSTI4 0
EQI4 $1404
line 2535
;2535:				return;
ADDRGP4 $1391
JUMPV
LABELV $1404
line 2537
;2536:			}
;2537:		}
LABELV $1402
line 2538
;2538:	}
LABELV $1398
line 2540
;2539:
;2540:	if ( cg_deadBodyDarken.integer && cent->currentState.eFlags & EF_DEAD )
ADDRGP4 cg_deadBodyDarken+12
INDIRI4
CNSTI4 0
EQI4 $1407
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1407
line 2541
;2541:		darken = qtrue;
ADDRLP4 740
CNSTI4 1
ASGNI4
ADDRGP4 $1408
JUMPV
LABELV $1407
line 2543
;2542:	else
;2543:		darken = qfalse;
ADDRLP4 740
CNSTI4 0
ASGNI4
LABELV $1408
line 2545
;2544:
;2545:	memset( &legs, 0, sizeof(legs) );
ADDRLP4 284
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2546
;2546:	memset( &torso, 0, sizeof(torso) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2547
;2547:	memset( &head, 0, sizeof(head) );
ADDRLP4 424
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2550
;2548:
;2549:	// get the rotation information
;2550:	CG_PlayerAngles( cent, legs.axis, torso.axis, head.axis );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 284+28
ARGP4
ADDRLP4 0+28
ARGP4
ADDRLP4 424+28
ARGP4
ADDRGP4 CG_PlayerAngles
CALLV
pop
line 2553
;2551:	
;2552:	// get the animation state (after rotation, to allow feet shuffle)
;2553:	CG_PlayerAnimation( cent, &legs.oldframe, &legs.frame, &legs.backlerp,
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 284+96
ARGP4
ADDRLP4 284+80
ARGP4
ADDRLP4 284+100
ARGP4
ADDRLP4 0+96
ARGP4
ADDRLP4 0+80
ARGP4
ADDRLP4 0+100
ARGP4
ADDRGP4 CG_PlayerAnimation
CALLV
pop
line 2557
;2554:		 &torso.oldframe, &torso.frame, &torso.backlerp );
;2555:
;2556:	// add the talk baloon or disconnect icon
;2557:	CG_PlayerSprites( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_PlayerSprites
CALLV
pop
line 2560
;2558:
;2559:	// add the shadow
;2560:	shadow = CG_PlayerShadow( cent, &shadowPlane );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 736
ARGP4
ADDRLP4 760
ADDRGP4 CG_PlayerShadow
CALLI4
ASGNI4
ADDRLP4 756
ADDRLP4 760
INDIRI4
ASGNI4
line 2563
;2561:
;2562:	// add a water splash if partially in and out of water
;2563:	CG_PlayerSplash( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_PlayerSplash
CALLV
pop
line 2565
;2564:
;2565:	if ( cg_shadows.integer == 3 && shadow ) {
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 3
NEI4 $1419
ADDRLP4 756
INDIRI4
CNSTI4 0
EQI4 $1419
line 2566
;2566:		renderfx |= RF_SHADOW_PLANE;
ADDRLP4 704
ADDRLP4 704
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 2567
;2567:	}
LABELV $1419
line 2568
;2568:	renderfx |= RF_LIGHTING_ORIGIN;			// use the same origin for all
ADDRLP4 704
ADDRLP4 704
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 2570
;2569:
;2570:	if( cgs.gametype == GT_HARVESTER ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 7
NEI4 $1422
line 2571
;2571:		CG_PlayerTokens( cent, renderfx );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 704
INDIRI4
ARGI4
ADDRGP4 CG_PlayerTokens
CALLV
pop
line 2572
;2572:	}
LABELV $1422
line 2577
;2573:
;2574:	//
;2575:	// add the legs
;2576:	//
;2577:	legs.hModel = ci->legsModel;
ADDRLP4 284+8
ADDRLP4 280
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
ASGNI4
line 2578
;2578:	legs.customSkin = ci->legsSkin;
ADDRLP4 284+108
ADDRLP4 280
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
ASGNI4
line 2580
;2579:
;2580:	VectorCopy( cent->lerpOrigin, legs.origin );
ADDRLP4 284+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 2582
;2581:
;2582:	VectorCopy( cent->lerpOrigin, legs.lightingOrigin );
ADDRLP4 284+12
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 2583
;2583:	legs.shadowPlane = shadowPlane;
ADDRLP4 284+24
ADDRLP4 736
INDIRF4
ASGNF4
line 2584
;2584:	legs.renderfx = renderfx;
ADDRLP4 284+4
ADDRLP4 704
INDIRI4
ASGNI4
line 2585
;2585:	VectorCopy (legs.origin, legs.oldorigin);	// don't positionally lerp at all
ADDRLP4 284+84
ADDRLP4 284+68
INDIRB
ASGNB 12
line 2588
;2586:
;2587:	// colored skin
;2588:	if ( darken ) {
ADDRLP4 740
INDIRI4
CNSTI4 0
EQI4 $1433
line 2589
;2589:		legs.shaderRGBA[0] = 85;
ADDRLP4 284+116
CNSTU1 85
ASGNU1
line 2590
;2590:		legs.shaderRGBA[1] = 85;
ADDRLP4 284+116+1
CNSTU1 85
ASGNU1
line 2591
;2591:		legs.shaderRGBA[2] = 85;
ADDRLP4 284+116+2
CNSTU1 85
ASGNU1
line 2592
;2592:	} else {
ADDRGP4 $1434
JUMPV
LABELV $1433
line 2593
;2593:		legs.shaderRGBA[0] = ci->legsColor[0] * 255;
ADDRLP4 768
ADDRLP4 280
INDIRP4
CNSTI4 1640
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 772
CNSTF4 1325400064
ASGNF4
ADDRLP4 768
INDIRF4
ADDRLP4 772
INDIRF4
LTF4 $1442
ADDRLP4 764
ADDRLP4 768
INDIRF4
ADDRLP4 772
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1443
JUMPV
LABELV $1442
ADDRLP4 764
ADDRLP4 768
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1443
ADDRLP4 284+116
ADDRLP4 764
INDIRU4
CVUU1 4
ASGNU1
line 2594
;2594:		legs.shaderRGBA[1] = ci->legsColor[1] * 255;
ADDRLP4 780
ADDRLP4 280
INDIRP4
CNSTI4 1644
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 784
CNSTF4 1325400064
ASGNF4
ADDRLP4 780
INDIRF4
ADDRLP4 784
INDIRF4
LTF4 $1447
ADDRLP4 776
ADDRLP4 780
INDIRF4
ADDRLP4 784
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1448
JUMPV
LABELV $1447
ADDRLP4 776
ADDRLP4 780
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1448
ADDRLP4 284+116+1
ADDRLP4 776
INDIRU4
CVUU1 4
ASGNU1
line 2595
;2595:		legs.shaderRGBA[2] = ci->legsColor[2] * 255;
ADDRLP4 792
ADDRLP4 280
INDIRP4
CNSTI4 1648
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 796
CNSTF4 1325400064
ASGNF4
ADDRLP4 792
INDIRF4
ADDRLP4 796
INDIRF4
LTF4 $1452
ADDRLP4 788
ADDRLP4 792
INDIRF4
ADDRLP4 796
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1453
JUMPV
LABELV $1452
ADDRLP4 788
ADDRLP4 792
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1453
ADDRLP4 284+116+2
ADDRLP4 788
INDIRU4
CVUU1 4
ASGNU1
line 2596
;2596:	}
LABELV $1434
line 2597
;2597:	legs.shaderRGBA[3] = 255;
ADDRLP4 284+116+3
CNSTU1 255
ASGNU1
line 2599
;2598:
;2599:	CG_AddRefEntityWithPowerups( &legs, &cent->currentState, ci->team );
ADDRLP4 284
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 280
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_AddRefEntityWithPowerups
CALLV
pop
line 2602
;2600:
;2601:	// if the model failed, allow the default nullmodel to be displayed
;2602:	if (!legs.hModel) {
ADDRLP4 284+8
INDIRI4
CNSTI4 0
NEI4 $1456
line 2603
;2603:		return;
ADDRGP4 $1391
JUMPV
LABELV $1456
line 2609
;2604:	}
;2605:
;2606:	//
;2607:	// add the torso
;2608:	//
;2609:	torso.hModel = ci->torsoModel;
ADDRLP4 0+8
ADDRLP4 280
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
ASGNI4
line 2610
;2610:	if (!torso.hModel) {
ADDRLP4 0+8
INDIRI4
CNSTI4 0
NEI4 $1460
line 2611
;2611:		return;
ADDRGP4 $1391
JUMPV
LABELV $1460
line 2614
;2612:	}
;2613:
;2614:	torso.customSkin = ci->torsoSkin;
ADDRLP4 0+108
ADDRLP4 280
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
ASGNI4
line 2616
;2615:
;2616:	VectorCopy( cent->lerpOrigin, torso.lightingOrigin );
ADDRLP4 0+12
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 2618
;2617:
;2618:	CG_PositionRotatedEntityOnTag( &torso, &legs, ci->legsModel, "tag_torso");
ADDRLP4 0
ARGP4
ADDRLP4 284
ARGP4
ADDRLP4 280
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
ARGI4
ADDRGP4 $1465
ARGP4
ADDRGP4 CG_PositionRotatedEntityOnTag
CALLV
pop
line 2620
;2619:
;2620:	torso.shadowPlane = shadowPlane;
ADDRLP4 0+24
ADDRLP4 736
INDIRF4
ASGNF4
line 2621
;2621:	torso.renderfx = renderfx;
ADDRLP4 0+4
ADDRLP4 704
INDIRI4
ASGNI4
line 2624
;2622:
;2623:	// colored skin
;2624:	if ( darken ) {
ADDRLP4 740
INDIRI4
CNSTI4 0
EQI4 $1468
line 2625
;2625:		torso.shaderRGBA[0] = 85;
ADDRLP4 0+116
CNSTU1 85
ASGNU1
line 2626
;2626:		torso.shaderRGBA[1] = 85;
ADDRLP4 0+116+1
CNSTU1 85
ASGNU1
line 2627
;2627:		torso.shaderRGBA[2] = 85;
ADDRLP4 0+116+2
CNSTU1 85
ASGNU1
line 2628
;2628:	} else {
ADDRGP4 $1469
JUMPV
LABELV $1468
line 2629
;2629:		torso.shaderRGBA[0] = ci->bodyColor[0] * 255;
ADDRLP4 768
ADDRLP4 280
INDIRP4
CNSTI4 1628
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 772
CNSTF4 1325400064
ASGNF4
ADDRLP4 768
INDIRF4
ADDRLP4 772
INDIRF4
LTF4 $1477
ADDRLP4 764
ADDRLP4 768
INDIRF4
ADDRLP4 772
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1478
JUMPV
LABELV $1477
ADDRLP4 764
ADDRLP4 768
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1478
ADDRLP4 0+116
ADDRLP4 764
INDIRU4
CVUU1 4
ASGNU1
line 2630
;2630:		torso.shaderRGBA[1] = ci->bodyColor[1] * 255;
ADDRLP4 780
ADDRLP4 280
INDIRP4
CNSTI4 1632
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 784
CNSTF4 1325400064
ASGNF4
ADDRLP4 780
INDIRF4
ADDRLP4 784
INDIRF4
LTF4 $1482
ADDRLP4 776
ADDRLP4 780
INDIRF4
ADDRLP4 784
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1483
JUMPV
LABELV $1482
ADDRLP4 776
ADDRLP4 780
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1483
ADDRLP4 0+116+1
ADDRLP4 776
INDIRU4
CVUU1 4
ASGNU1
line 2631
;2631:		torso.shaderRGBA[2] = ci->bodyColor[2] * 255;
ADDRLP4 792
ADDRLP4 280
INDIRP4
CNSTI4 1636
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 796
CNSTF4 1325400064
ASGNF4
ADDRLP4 792
INDIRF4
ADDRLP4 796
INDIRF4
LTF4 $1487
ADDRLP4 788
ADDRLP4 792
INDIRF4
ADDRLP4 796
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1488
JUMPV
LABELV $1487
ADDRLP4 788
ADDRLP4 792
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1488
ADDRLP4 0+116+2
ADDRLP4 788
INDIRU4
CVUU1 4
ASGNU1
line 2632
;2632:	}
LABELV $1469
line 2633
;2633:	torso.shaderRGBA[3] = 255;
ADDRLP4 0+116+3
CNSTU1 255
ASGNU1
line 2635
;2634:
;2635:	CG_AddRefEntityWithPowerups( &torso, &cent->currentState, ci->team );
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 280
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_AddRefEntityWithPowerups
CALLV
pop
line 2637
;2636:
;2637:	if ( cent->currentState.eFlags & EF_KAMIKAZE ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $1491
line 2639
;2638:
;2639:		memset( &skull, 0, sizeof(skull) );
ADDRLP4 564
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2641
;2640:
;2641:		VectorCopy( cent->lerpOrigin, skull.lightingOrigin );
ADDRLP4 564+12
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 2642
;2642:		skull.shadowPlane = shadowPlane;
ADDRLP4 564+24
ADDRLP4 736
INDIRF4
ASGNF4
line 2643
;2643:		skull.renderfx = renderfx;
ADDRLP4 564+4
ADDRLP4 704
INDIRI4
ASGNI4
line 2645
;2644:
;2645:		if ( cent->currentState.eFlags & EF_DEAD ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1496
line 2647
;2646:			// one skull bobbing above the dead body
;2647:			angle = ((cg.time / 7) & 255) * (M_PI * 2) / 255;
ADDRLP4 720
ADDRGP4 cg+107604
INDIRI4
CNSTI4 7
DIVI4
CNSTI4 255
BANDI4
CVIF4 4
CNSTF4 1019861428
MULF4
ASGNF4
line 2648
;2648:			if (angle > M_PI * 2)
ADDRLP4 720
INDIRF4
CNSTF4 1086918619
LEF4 $1499
line 2649
;2649:				angle -= (float)M_PI * 2;
ADDRLP4 720
ADDRLP4 720
INDIRF4
CNSTF4 1086918619
SUBF4
ASGNF4
LABELV $1499
line 2650
;2650:			dir[0] = sin(angle) * 20;
ADDRLP4 720
INDIRF4
ARGF4
ADDRLP4 764
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 708
ADDRLP4 764
INDIRF4
CNSTF4 1101004800
MULF4
ASGNF4
line 2651
;2651:			dir[1] = cos(angle) * 20;
ADDRLP4 720
INDIRF4
ARGF4
ADDRLP4 768
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 708+4
ADDRLP4 768
INDIRF4
CNSTF4 1101004800
MULF4
ASGNF4
line 2652
;2652:			angle = ((cg.time / 4) & 255) * (M_PI * 2) / 255;
ADDRLP4 720
ADDRGP4 cg+107604
INDIRI4
CNSTI4 4
DIVI4
CNSTI4 255
BANDI4
CVIF4 4
CNSTF4 1019861428
MULF4
ASGNF4
line 2653
;2653:			dir[2] = 15 + sin(angle) * 8;
ADDRLP4 720
INDIRF4
ARGF4
ADDRLP4 772
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 708+8
ADDRLP4 772
INDIRF4
CNSTF4 1090519040
MULF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 2654
;2654:			VectorAdd(torso.origin, dir, skull.origin);
ADDRLP4 564+68
ADDRLP4 0+68
INDIRF4
ADDRLP4 708
INDIRF4
ADDF4
ASGNF4
ADDRLP4 564+68+4
ADDRLP4 0+68+4
INDIRF4
ADDRLP4 708+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 564+68+8
ADDRLP4 0+68+8
INDIRF4
ADDRLP4 708+8
INDIRF4
ADDF4
ASGNF4
line 2656
;2655:			
;2656:			dir[2] = 0;
ADDRLP4 708+8
CNSTF4 0
ASGNF4
line 2657
;2657:			VectorCopy(dir, skull.axis[1]);
ADDRLP4 564+28+12
ADDRLP4 708
INDIRB
ASGNB 12
line 2658
;2658:			VectorNormalize(skull.axis[1]);
ADDRLP4 564+28+12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2659
;2659:			VectorSet(skull.axis[2], 0, 0, 1);
ADDRLP4 564+28+24
CNSTF4 0
ASGNF4
ADDRLP4 564+28+24+4
CNSTF4 0
ASGNF4
ADDRLP4 564+28+24+8
CNSTF4 1065353216
ASGNF4
line 2660
;2660:			CrossProduct(skull.axis[1], skull.axis[2], skull.axis[0]);
ADDRLP4 564+28+12
ARGP4
ADDRLP4 564+28+24
ARGP4
ADDRLP4 564+28
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 2662
;2661:
;2662:			skull.hModel = cgs.media.kamikazeHeadModel;
ADDRLP4 564+8
ADDRGP4 cgs+148692+524
INDIRI4
ASGNI4
line 2663
;2663:			trap_R_AddRefEntityToScene( &skull );
ADDRLP4 564
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2664
;2664:			skull.hModel = cgs.media.kamikazeHeadTrail;
ADDRLP4 564+8
ADDRGP4 cgs+148692+528
INDIRI4
ASGNI4
line 2665
;2665:			trap_R_AddRefEntityToScene( &skull );
ADDRLP4 564
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2666
;2666:		}
ADDRGP4 $1497
JUMPV
LABELV $1496
line 2667
;2667:		else {
line 2669
;2668:			// three skulls spinning around the player
;2669:			angle = ((cg.time / 4) & 255) * (M_PI * 2) / 255;
ADDRLP4 720
ADDRGP4 cg+107604
INDIRI4
CNSTI4 4
DIVI4
CNSTI4 255
BANDI4
CVIF4 4
CNSTF4 1019861428
MULF4
ASGNF4
line 2670
;2670:			dir[0] = cos(angle) * 20;
ADDRLP4 720
INDIRF4
ARGF4
ADDRLP4 764
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 708
ADDRLP4 764
INDIRF4
CNSTF4 1101004800
MULF4
ASGNF4
line 2671
;2671:			dir[1] = sin(angle) * 20;
ADDRLP4 720
INDIRF4
ARGF4
ADDRLP4 768
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 708+4
ADDRLP4 768
INDIRF4
CNSTF4 1101004800
MULF4
ASGNF4
line 2672
;2672:			dir[2] = cos(angle) * 20;
ADDRLP4 720
INDIRF4
ARGF4
ADDRLP4 772
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 708+8
ADDRLP4 772
INDIRF4
CNSTF4 1101004800
MULF4
ASGNF4
line 2673
;2673:			VectorAdd(torso.origin, dir, skull.origin);
ADDRLP4 564+68
ADDRLP4 0+68
INDIRF4
ADDRLP4 708
INDIRF4
ADDF4
ASGNF4
ADDRLP4 564+68+4
ADDRLP4 0+68+4
INDIRF4
ADDRLP4 708+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 564+68+8
ADDRLP4 0+68+8
INDIRF4
ADDRLP4 708+8
INDIRF4
ADDF4
ASGNF4
line 2675
;2674:
;2675:			angles[0] = sin(angle) * 30;
ADDRLP4 720
INDIRF4
ARGF4
ADDRLP4 776
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 724
ADDRLP4 776
INDIRF4
CNSTF4 1106247680
MULF4
ASGNF4
line 2676
;2676:			angles[1] = (angle * 180 / M_PI) + 90;
ADDRLP4 724+4
ADDRLP4 720
INDIRF4
CNSTF4 1113927393
MULF4
CNSTF4 1119092736
ADDF4
ASGNF4
line 2677
;2677:			if (angles[1] > 360)
ADDRLP4 724+4
INDIRF4
CNSTF4 1135869952
LEF4 $1556
line 2678
;2678:				angles[1] -= 360;
ADDRLP4 724+4
ADDRLP4 724+4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
LABELV $1556
line 2679
;2679:			angles[2] = 0;
ADDRLP4 724+8
CNSTF4 0
ASGNF4
line 2680
;2680:			AnglesToAxis( angles, skull.axis );
ADDRLP4 724
ARGP4
ADDRLP4 564+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 2691
;2681:
;2682:			/*
;2683:			dir[2] = 0;
;2684:			VectorInverse(dir);
;2685:			VectorCopy(dir, skull.axis[1]);
;2686:			VectorNormalize(skull.axis[1]);
;2687:			VectorSet(skull.axis[2], 0, 0, 1);
;2688:			CrossProduct(skull.axis[1], skull.axis[2], skull.axis[0]);
;2689:			*/
;2690:
;2691:			skull.hModel = cgs.media.kamikazeHeadModel;
ADDRLP4 564+8
ADDRGP4 cgs+148692+524
INDIRI4
ASGNI4
line 2692
;2692:			trap_R_AddRefEntityToScene( &skull );
ADDRLP4 564
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2694
;2693:			// flip the trail because this skull is spinning in the other direction
;2694:			VectorInverse(skull.axis[1]);
ADDRLP4 564+28+12
ARGP4
ADDRGP4 VectorInverse
CALLV
pop
line 2695
;2695:			skull.hModel = cgs.media.kamikazeHeadTrail;
ADDRLP4 564+8
ADDRGP4 cgs+148692+528
INDIRI4
ASGNI4
line 2696
;2696:			trap_R_AddRefEntityToScene( &skull );
ADDRLP4 564
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2698
;2697:
;2698:			angle = ((cg.time / 4) & 255) * (M_PI * 2) / 255 + M_PI;
ADDRLP4 720
ADDRGP4 cg+107604
INDIRI4
CNSTI4 4
DIVI4
CNSTI4 255
BANDI4
CVIF4 4
CNSTF4 1019861428
MULF4
CNSTF4 1078530011
ADDF4
ASGNF4
line 2699
;2699:			if (angle > M_PI * 2)
ADDRLP4 720
INDIRF4
CNSTF4 1086918619
LEF4 $1571
line 2700
;2700:				angle -= (float)M_PI * 2;
ADDRLP4 720
ADDRLP4 720
INDIRF4
CNSTF4 1086918619
SUBF4
ASGNF4
LABELV $1571
line 2701
;2701:			dir[0] = sin(angle) * 20;
ADDRLP4 720
INDIRF4
ARGF4
ADDRLP4 780
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 708
ADDRLP4 780
INDIRF4
CNSTF4 1101004800
MULF4
ASGNF4
line 2702
;2702:			dir[1] = cos(angle) * 20;
ADDRLP4 720
INDIRF4
ARGF4
ADDRLP4 784
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 708+4
ADDRLP4 784
INDIRF4
CNSTF4 1101004800
MULF4
ASGNF4
line 2703
;2703:			dir[2] = cos(angle) * 20;
ADDRLP4 720
INDIRF4
ARGF4
ADDRLP4 788
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 708+8
ADDRLP4 788
INDIRF4
CNSTF4 1101004800
MULF4
ASGNF4
line 2704
;2704:			VectorAdd(torso.origin, dir, skull.origin);
ADDRLP4 564+68
ADDRLP4 0+68
INDIRF4
ADDRLP4 708
INDIRF4
ADDF4
ASGNF4
ADDRLP4 564+68+4
ADDRLP4 0+68+4
INDIRF4
ADDRLP4 708+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 564+68+8
ADDRLP4 0+68+8
INDIRF4
ADDRLP4 708+8
INDIRF4
ADDF4
ASGNF4
line 2706
;2705:
;2706:			angles[0] = cos(angle - 0.5 * M_PI) * 30;
ADDRLP4 720
INDIRF4
CNSTF4 1070141403
SUBF4
ARGF4
ADDRLP4 792
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 724
ADDRLP4 792
INDIRF4
CNSTF4 1106247680
MULF4
ASGNF4
line 2707
;2707:			angles[1] = 360 - (angle * 180 / M_PI);
ADDRLP4 724+4
CNSTF4 1135869952
ADDRLP4 720
INDIRF4
CNSTF4 1113927393
MULF4
SUBF4
ASGNF4
line 2708
;2708:			if (angles[1] > 360)
ADDRLP4 724+4
INDIRF4
CNSTF4 1135869952
LEF4 $1588
line 2709
;2709:				angles[1] -= 360;
ADDRLP4 724+4
ADDRLP4 724+4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
LABELV $1588
line 2710
;2710:			angles[2] = 0;
ADDRLP4 724+8
CNSTF4 0
ASGNF4
line 2711
;2711:			AnglesToAxis( angles, skull.axis );
ADDRLP4 724
ARGP4
ADDRLP4 564+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 2721
;2712:
;2713:			/*
;2714:			dir[2] = 0;
;2715:			VectorCopy(dir, skull.axis[1]);
;2716:			VectorNormalize(skull.axis[1]);
;2717:			VectorSet(skull.axis[2], 0, 0, 1);
;2718:			CrossProduct(skull.axis[1], skull.axis[2], skull.axis[0]);
;2719:			*/
;2720:
;2721:			skull.hModel = cgs.media.kamikazeHeadModel;
ADDRLP4 564+8
ADDRGP4 cgs+148692+524
INDIRI4
ASGNI4
line 2722
;2722:			trap_R_AddRefEntityToScene( &skull );
ADDRLP4 564
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2723
;2723:			skull.hModel = cgs.media.kamikazeHeadTrail;
ADDRLP4 564+8
ADDRGP4 cgs+148692+528
INDIRI4
ASGNI4
line 2724
;2724:			trap_R_AddRefEntityToScene( &skull );
ADDRLP4 564
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2726
;2725:
;2726:			angle = ((cg.time / 3) & 255) * (M_PI * 2) / 255 + 0.5 * M_PI;
ADDRLP4 720
ADDRGP4 cg+107604
INDIRI4
CNSTI4 3
DIVI4
CNSTI4 255
BANDI4
CVIF4 4
CNSTF4 1019861428
MULF4
CNSTF4 1070141403
ADDF4
ASGNF4
line 2727
;2727:			if (angle > M_PI * 2)
ADDRLP4 720
INDIRF4
CNSTF4 1086918619
LEF4 $1601
line 2728
;2728:				angle -= (float)M_PI * 2;
ADDRLP4 720
ADDRLP4 720
INDIRF4
CNSTF4 1086918619
SUBF4
ASGNF4
LABELV $1601
line 2729
;2729:			dir[0] = sin(angle) * 20;
ADDRLP4 720
INDIRF4
ARGF4
ADDRLP4 796
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 708
ADDRLP4 796
INDIRF4
CNSTF4 1101004800
MULF4
ASGNF4
line 2730
;2730:			dir[1] = cos(angle) * 20;
ADDRLP4 720
INDIRF4
ARGF4
ADDRLP4 800
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 708+4
ADDRLP4 800
INDIRF4
CNSTF4 1101004800
MULF4
ASGNF4
line 2731
;2731:			dir[2] = 0;
ADDRLP4 708+8
CNSTF4 0
ASGNF4
line 2732
;2732:			VectorAdd(torso.origin, dir, skull.origin);
ADDRLP4 564+68
ADDRLP4 0+68
INDIRF4
ADDRLP4 708
INDIRF4
ADDF4
ASGNF4
ADDRLP4 564+68+4
ADDRLP4 0+68+4
INDIRF4
ADDRLP4 708+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 564+68+8
ADDRLP4 0+68+8
INDIRF4
ADDRLP4 708+8
INDIRF4
ADDF4
ASGNF4
line 2734
;2733:			
;2734:			VectorCopy(dir, skull.axis[1]);
ADDRLP4 564+28+12
ADDRLP4 708
INDIRB
ASGNB 12
line 2735
;2735:			VectorNormalize(skull.axis[1]);
ADDRLP4 564+28+12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2736
;2736:			VectorSet(skull.axis[2], 0, 0, 1);
ADDRLP4 564+28+24
CNSTF4 0
ASGNF4
ADDRLP4 564+28+24+4
CNSTF4 0
ASGNF4
ADDRLP4 564+28+24+8
CNSTF4 1065353216
ASGNF4
line 2737
;2737:			CrossProduct(skull.axis[1], skull.axis[2], skull.axis[0]);
ADDRLP4 564+28+12
ARGP4
ADDRLP4 564+28+24
ARGP4
ADDRLP4 564+28
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 2739
;2738:
;2739:			skull.hModel = cgs.media.kamikazeHeadModel;
ADDRLP4 564+8
ADDRGP4 cgs+148692+524
INDIRI4
ASGNI4
line 2740
;2740:			trap_R_AddRefEntityToScene( &skull );
ADDRLP4 564
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2741
;2741:			skull.hModel = cgs.media.kamikazeHeadTrail;
ADDRLP4 564+8
ADDRGP4 cgs+148692+528
INDIRI4
ASGNI4
line 2742
;2742:			trap_R_AddRefEntityToScene( &skull );
ADDRLP4 564
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2743
;2743:		}
LABELV $1497
line 2744
;2744:	}
LABELV $1491
line 2746
;2745:
;2746:	if ( cent->currentState.powerups & ( 1 << PW_GUARD ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $1640
line 2747
;2747:		memcpy(&powerup, &torso, sizeof(torso));
ADDRLP4 140
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 140
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 2748
;2748:		powerup.hModel = cgs.media.guardPowerupModel;
ADDRLP4 140+8
ADDRGP4 cgs+148692+532
INDIRI4
ASGNI4
line 2749
;2749:		powerup.frame = 0;
ADDRLP4 140+80
CNSTI4 0
ASGNI4
line 2750
;2750:		powerup.oldframe = 0;
ADDRLP4 140+96
CNSTI4 0
ASGNI4
line 2751
;2751:		powerup.customSkin = 0;
ADDRLP4 140+108
CNSTI4 0
ASGNI4
line 2752
;2752:		trap_R_AddRefEntityToScene( &powerup );
ADDRLP4 140
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2753
;2753:	}
LABELV $1640
line 2754
;2754:	if ( cent->currentState.powerups & ( 1 << PW_SCOUT ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $1648
line 2755
;2755:		memcpy(&powerup, &torso, sizeof(torso));
ADDRLP4 140
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 140
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 2756
;2756:		powerup.hModel = cgs.media.scoutPowerupModel;
ADDRLP4 140+8
ADDRGP4 cgs+148692+536
INDIRI4
ASGNI4
line 2757
;2757:		powerup.frame = 0;
ADDRLP4 140+80
CNSTI4 0
ASGNI4
line 2758
;2758:		powerup.oldframe = 0;
ADDRLP4 140+96
CNSTI4 0
ASGNI4
line 2759
;2759:		powerup.customSkin = 0;
ADDRLP4 140+108
CNSTI4 0
ASGNI4
line 2760
;2760:		trap_R_AddRefEntityToScene( &powerup );
ADDRLP4 140
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2761
;2761:	}
LABELV $1648
line 2762
;2762:	if ( cent->currentState.powerups & ( 1 << PW_DOUBLER ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $1656
line 2763
;2763:		memcpy(&powerup, &torso, sizeof(torso));
ADDRLP4 140
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 140
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 2764
;2764:		powerup.hModel = cgs.media.doublerPowerupModel;
ADDRLP4 140+8
ADDRGP4 cgs+148692+540
INDIRI4
ASGNI4
line 2765
;2765:		powerup.frame = 0;
ADDRLP4 140+80
CNSTI4 0
ASGNI4
line 2766
;2766:		powerup.oldframe = 0;
ADDRLP4 140+96
CNSTI4 0
ASGNI4
line 2767
;2767:		powerup.customSkin = 0;
ADDRLP4 140+108
CNSTI4 0
ASGNI4
line 2768
;2768:		trap_R_AddRefEntityToScene( &powerup );
ADDRLP4 140
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2769
;2769:	}
LABELV $1656
line 2770
;2770:	if ( cent->currentState.powerups & ( 1 << PW_AMMOREGEN ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $1664
line 2771
;2771:		memcpy(&powerup, &torso, sizeof(torso));
ADDRLP4 140
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 140
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 2772
;2772:		powerup.hModel = cgs.media.ammoRegenPowerupModel;
ADDRLP4 140+8
ADDRGP4 cgs+148692+544
INDIRI4
ASGNI4
line 2773
;2773:		powerup.frame = 0;
ADDRLP4 140+80
CNSTI4 0
ASGNI4
line 2774
;2774:		powerup.oldframe = 0;
ADDRLP4 140+96
CNSTI4 0
ASGNI4
line 2775
;2775:		powerup.customSkin = 0;
ADDRLP4 140+108
CNSTI4 0
ASGNI4
line 2776
;2776:		trap_R_AddRefEntityToScene( &powerup );
ADDRLP4 140
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2777
;2777:	}
LABELV $1664
line 2778
;2778:	if ( cent->currentState.powerups & ( 1 << PW_INVULNERABILITY ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $1672
line 2779
;2779:		if ( !ci->invulnerabilityStartTime ) {
ADDRLP4 280
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1674
line 2780
;2780:			ci->invulnerabilityStartTime = cg.time;
ADDRLP4 280
INDIRP4
CNSTI4 116
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 2781
;2781:		}
LABELV $1674
line 2782
;2782:		ci->invulnerabilityStopTime = cg.time;
ADDRLP4 280
INDIRP4
CNSTI4 120
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 2783
;2783:	}
ADDRGP4 $1673
JUMPV
LABELV $1672
line 2784
;2784:	else {
line 2785
;2785:		ci->invulnerabilityStartTime = 0;
ADDRLP4 280
INDIRP4
CNSTI4 116
ADDP4
CNSTI4 0
ASGNI4
line 2786
;2786:	}
LABELV $1673
line 2787
;2787:	if ( (cent->currentState.powerups & ( 1 << PW_INVULNERABILITY ) ) ||
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
NEI4 $1681
ADDRGP4 cg+107604
INDIRI4
ADDRLP4 280
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
SUBI4
CNSTI4 250
GEI4 $1678
LABELV $1681
line 2788
;2788:		cg.time - ci->invulnerabilityStopTime < 250 ) {
line 2790
;2789:
;2790:		memcpy(&powerup, &torso, sizeof(torso));
ADDRLP4 140
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 140
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 2791
;2791:		powerup.hModel = cgs.media.invulnerabilityPowerupModel;
ADDRLP4 140+8
ADDRGP4 cgs+148692+564
INDIRI4
ASGNI4
line 2792
;2792:		powerup.customSkin = 0;
ADDRLP4 140+108
CNSTI4 0
ASGNI4
line 2794
;2793:		// always draw
;2794:		powerup.renderfx &= ~RF_THIRD_PERSON;
ADDRLP4 140+4
ADDRLP4 140+4
INDIRI4
CNSTI4 -3
BANDI4
ASGNI4
line 2795
;2795:		VectorCopy(cent->lerpOrigin, powerup.origin);
ADDRLP4 140+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 2797
;2796:
;2797:		if ( cg.time - ci->invulnerabilityStartTime < 250 ) {
ADDRGP4 cg+107604
INDIRI4
ADDRLP4 280
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
SUBI4
CNSTI4 250
GEI4 $1688
line 2798
;2798:			c = (float) (cg.time - ci->invulnerabilityStartTime) / 250;
ADDRLP4 748
ADDRGP4 cg+107604
INDIRI4
ADDRLP4 280
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
SUBI4
CVIF4 4
CNSTF4 998445679
MULF4
ASGNF4
line 2799
;2799:		}
ADDRGP4 $1689
JUMPV
LABELV $1688
line 2800
;2800:		else if (cg.time - ci->invulnerabilityStopTime < 250 ) {
ADDRGP4 cg+107604
INDIRI4
ADDRLP4 280
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
SUBI4
CNSTI4 250
GEI4 $1692
line 2801
;2801:			c = (float) (250 - (cg.time - ci->invulnerabilityStopTime)) / 250;
ADDRLP4 748
CNSTI4 250
ADDRGP4 cg+107604
INDIRI4
ADDRLP4 280
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
SUBI4
SUBI4
CVIF4 4
CNSTF4 998445679
MULF4
ASGNF4
line 2802
;2802:		}
ADDRGP4 $1693
JUMPV
LABELV $1692
line 2803
;2803:		else {
line 2804
;2804:			c = 1;
ADDRLP4 748
CNSTF4 1065353216
ASGNF4
line 2805
;2805:		}
LABELV $1693
LABELV $1689
line 2806
;2806:		VectorSet( powerup.axis[0], c, 0, 0 );
ADDRLP4 140+28
ADDRLP4 748
INDIRF4
ASGNF4
ADDRLP4 140+28+4
CNSTF4 0
ASGNF4
ADDRLP4 140+28+8
CNSTF4 0
ASGNF4
line 2807
;2807:		VectorSet( powerup.axis[1], 0, c, 0 );
ADDRLP4 140+28+12
CNSTF4 0
ASGNF4
ADDRLP4 140+28+12+4
ADDRLP4 748
INDIRF4
ASGNF4
ADDRLP4 140+28+12+8
CNSTF4 0
ASGNF4
line 2808
;2808:		VectorSet( powerup.axis[2], 0, 0, c );
ADDRLP4 140+28+24
CNSTF4 0
ASGNF4
ADDRLP4 140+28+24+4
CNSTF4 0
ASGNF4
ADDRLP4 140+28+24+8
ADDRLP4 748
INDIRF4
ASGNF4
line 2809
;2809:		trap_R_AddRefEntityToScene( &powerup );
ADDRLP4 140
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2810
;2810:	}
LABELV $1678
line 2812
;2811:
;2812:	t = cg.time - ci->medkitUsageTime;
ADDRLP4 744
ADDRGP4 cg+107604
INDIRI4
ADDRLP4 280
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
SUBI4
ASGNI4
line 2813
;2813:	if ( ci->medkitUsageTime && t < 500 ) {
ADDRLP4 280
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1718
ADDRLP4 744
INDIRI4
CNSTI4 500
GEI4 $1718
line 2814
;2814:		memcpy(&powerup, &torso, sizeof(torso));
ADDRLP4 140
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 140
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 2815
;2815:		powerup.hModel = cgs.media.medkitUsageModel;
ADDRLP4 140+8
ADDRGP4 cgs+148692+556
INDIRI4
ASGNI4
line 2816
;2816:		powerup.customSkin = 0;
ADDRLP4 140+108
CNSTI4 0
ASGNI4
line 2818
;2817:		// always draw
;2818:		powerup.renderfx &= ~RF_THIRD_PERSON;
ADDRLP4 140+4
ADDRLP4 140+4
INDIRI4
CNSTI4 -3
BANDI4
ASGNI4
line 2819
;2819:		VectorClear(angles);
ADDRLP4 724
CNSTF4 0
ASGNF4
ADDRLP4 724+4
CNSTF4 0
ASGNF4
ADDRLP4 724+8
CNSTF4 0
ASGNF4
line 2820
;2820:		AnglesToAxis(angles, powerup.axis);
ADDRLP4 724
ARGP4
ADDRLP4 140+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 2821
;2821:		VectorCopy(cent->lerpOrigin, powerup.origin);
ADDRLP4 140+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 2822
;2822:		powerup.origin[2] += -24 + (float) t * 80 / 500;
ADDRLP4 140+68+8
ADDRLP4 140+68+8
INDIRF4
ADDRLP4 744
INDIRI4
CVIF4 4
CNSTF4 1042536202
MULF4
CNSTF4 3250585600
ADDF4
ADDF4
ASGNF4
line 2823
;2823:		if ( t > 400 ) {
ADDRLP4 744
INDIRI4
CNSTI4 400
LEI4 $1731
line 2824
;2824:			c = (float) (t - 1000) * 0xff / 100;
ADDRLP4 748
ADDRLP4 744
INDIRI4
CNSTI4 1000
SUBI4
CVIF4 4
CNSTF4 1076048691
MULF4
ASGNF4
line 2825
;2825:			powerup.shaderRGBA[0] = 0xff - c;
ADDRLP4 768
CNSTF4 1132396544
ADDRLP4 748
INDIRF4
SUBF4
ASGNF4
ADDRLP4 772
CNSTF4 1325400064
ASGNF4
ADDRLP4 768
INDIRF4
ADDRLP4 772
INDIRF4
LTF4 $1735
ADDRLP4 764
ADDRLP4 768
INDIRF4
ADDRLP4 772
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1736
JUMPV
LABELV $1735
ADDRLP4 764
ADDRLP4 768
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1736
ADDRLP4 140+116
ADDRLP4 764
INDIRU4
CVUU1 4
ASGNU1
line 2826
;2826:			powerup.shaderRGBA[1] = 0xff - c;
ADDRLP4 780
CNSTF4 1132396544
ADDRLP4 748
INDIRF4
SUBF4
ASGNF4
ADDRLP4 784
CNSTF4 1325400064
ASGNF4
ADDRLP4 780
INDIRF4
ADDRLP4 784
INDIRF4
LTF4 $1740
ADDRLP4 776
ADDRLP4 780
INDIRF4
ADDRLP4 784
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1741
JUMPV
LABELV $1740
ADDRLP4 776
ADDRLP4 780
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1741
ADDRLP4 140+116+1
ADDRLP4 776
INDIRU4
CVUU1 4
ASGNU1
line 2827
;2827:			powerup.shaderRGBA[2] = 0xff - c;
ADDRLP4 792
CNSTF4 1132396544
ADDRLP4 748
INDIRF4
SUBF4
ASGNF4
ADDRLP4 796
CNSTF4 1325400064
ASGNF4
ADDRLP4 792
INDIRF4
ADDRLP4 796
INDIRF4
LTF4 $1745
ADDRLP4 788
ADDRLP4 792
INDIRF4
ADDRLP4 796
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1746
JUMPV
LABELV $1745
ADDRLP4 788
ADDRLP4 792
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1746
ADDRLP4 140+116+2
ADDRLP4 788
INDIRU4
CVUU1 4
ASGNU1
line 2828
;2828:			powerup.shaderRGBA[3] = 0xff - c;
ADDRLP4 804
CNSTF4 1132396544
ADDRLP4 748
INDIRF4
SUBF4
ASGNF4
ADDRLP4 808
CNSTF4 1325400064
ASGNF4
ADDRLP4 804
INDIRF4
ADDRLP4 808
INDIRF4
LTF4 $1750
ADDRLP4 800
ADDRLP4 804
INDIRF4
ADDRLP4 808
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1751
JUMPV
LABELV $1750
ADDRLP4 800
ADDRLP4 804
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1751
ADDRLP4 140+116+3
ADDRLP4 800
INDIRU4
CVUU1 4
ASGNU1
line 2829
;2829:		}
ADDRGP4 $1732
JUMPV
LABELV $1731
line 2830
;2830:		else {
line 2831
;2831:			powerup.shaderRGBA[0] = 0xff;
ADDRLP4 140+116
CNSTU1 255
ASGNU1
line 2832
;2832:			powerup.shaderRGBA[1] = 0xff;
ADDRLP4 140+116+1
CNSTU1 255
ASGNU1
line 2833
;2833:			powerup.shaderRGBA[2] = 0xff;
ADDRLP4 140+116+2
CNSTU1 255
ASGNU1
line 2834
;2834:			powerup.shaderRGBA[3] = 0xff;
ADDRLP4 140+116+3
CNSTU1 255
ASGNU1
line 2835
;2835:		}
LABELV $1732
line 2836
;2836:		trap_R_AddRefEntityToScene( &powerup );
ADDRLP4 140
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2837
;2837:	}
LABELV $1718
line 2843
;2838:
;2839:
;2840:	//
;2841:	// add the head
;2842:	//
;2843:	head.hModel = ci->headModel;
ADDRLP4 424+8
ADDRLP4 280
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
ASGNI4
line 2844
;2844:	if (!head.hModel) {
ADDRLP4 424+8
INDIRI4
CNSTI4 0
NEI4 $1760
line 2845
;2845:		return;
ADDRGP4 $1391
JUMPV
LABELV $1760
line 2847
;2846:	}
;2847:	head.customSkin = ci->headSkin;
ADDRLP4 424+108
ADDRLP4 280
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
ASGNI4
line 2849
;2848:
;2849:	VectorCopy( cent->lerpOrigin, head.lightingOrigin );
ADDRLP4 424+12
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 2851
;2850:
;2851:	CG_PositionRotatedEntityOnTag( &head, &torso, ci->torsoModel, "tag_head");
ADDRLP4 424
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 280
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
ARGI4
ADDRGP4 $1765
ARGP4
ADDRGP4 CG_PositionRotatedEntityOnTag
CALLV
pop
line 2853
;2852:
;2853:	head.shadowPlane = shadowPlane;
ADDRLP4 424+24
ADDRLP4 736
INDIRF4
ASGNF4
line 2854
;2854:	head.renderfx = renderfx;
ADDRLP4 424+4
ADDRLP4 704
INDIRI4
ASGNI4
line 2857
;2855:
;2856:	// colored skin
;2857:	if ( darken ) {
ADDRLP4 740
INDIRI4
CNSTI4 0
EQI4 $1768
line 2858
;2858:		head.shaderRGBA[0] = 85;
ADDRLP4 424+116
CNSTU1 85
ASGNU1
line 2859
;2859:		head.shaderRGBA[1] = 85;
ADDRLP4 424+116+1
CNSTU1 85
ASGNU1
line 2860
;2860:		head.shaderRGBA[2] = 85;
ADDRLP4 424+116+2
CNSTU1 85
ASGNU1
line 2861
;2861:	} else {
ADDRGP4 $1769
JUMPV
LABELV $1768
line 2862
;2862:		head.shaderRGBA[0] = ci->headColor[0] * 255;
ADDRLP4 768
ADDRLP4 280
INDIRP4
CNSTI4 1616
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 772
CNSTF4 1325400064
ASGNF4
ADDRLP4 768
INDIRF4
ADDRLP4 772
INDIRF4
LTF4 $1777
ADDRLP4 764
ADDRLP4 768
INDIRF4
ADDRLP4 772
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1778
JUMPV
LABELV $1777
ADDRLP4 764
ADDRLP4 768
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1778
ADDRLP4 424+116
ADDRLP4 764
INDIRU4
CVUU1 4
ASGNU1
line 2863
;2863:		head.shaderRGBA[1] = ci->headColor[1] * 255;
ADDRLP4 780
ADDRLP4 280
INDIRP4
CNSTI4 1620
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 784
CNSTF4 1325400064
ASGNF4
ADDRLP4 780
INDIRF4
ADDRLP4 784
INDIRF4
LTF4 $1782
ADDRLP4 776
ADDRLP4 780
INDIRF4
ADDRLP4 784
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1783
JUMPV
LABELV $1782
ADDRLP4 776
ADDRLP4 780
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1783
ADDRLP4 424+116+1
ADDRLP4 776
INDIRU4
CVUU1 4
ASGNU1
line 2864
;2864:		head.shaderRGBA[2] = ci->headColor[2] * 255;
ADDRLP4 792
ADDRLP4 280
INDIRP4
CNSTI4 1624
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 796
CNSTF4 1325400064
ASGNF4
ADDRLP4 792
INDIRF4
ADDRLP4 796
INDIRF4
LTF4 $1787
ADDRLP4 788
ADDRLP4 792
INDIRF4
ADDRLP4 796
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1788
JUMPV
LABELV $1787
ADDRLP4 788
ADDRLP4 792
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1788
ADDRLP4 424+116+2
ADDRLP4 788
INDIRU4
CVUU1 4
ASGNU1
line 2865
;2865:	}
LABELV $1769
line 2866
;2866:	head.shaderRGBA[3] = 255;
ADDRLP4 424+116+3
CNSTU1 255
ASGNU1
line 2868
;2867:	
;2868:	CG_AddRefEntityWithPowerups( &head, &cent->currentState, ci->team );
ADDRLP4 424
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 280
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_AddRefEntityWithPowerups
CALLV
pop
line 2870
;2869:
;2870:	CG_BreathPuffs(cent, &head);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 424
ARGP4
ADDRGP4 CG_BreathPuffs
CALLV
pop
line 2872
;2871:
;2872:	CG_DustTrail(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_DustTrail
CALLV
pop
line 2877
;2873:
;2874:	//
;2875:	// add the gun / barrel / flash
;2876:	//
;2877:	CG_AddPlayerWeapon( &torso, NULL, cent, ci->team );
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 280
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_AddPlayerWeapon
CALLV
pop
line 2880
;2878:
;2879:	// add powerups floating behind the player
;2880:	CG_PlayerPowerups( cent, &torso );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_PlayerPowerups
CALLV
pop
line 2881
;2881:}
LABELV $1391
endproc CG_Player 812 28
export CG_ResetPlayerEntity
proc CG_ResetPlayerEntity 40 12
line 2893
;2882:
;2883:
;2884://=====================================================================
;2885:
;2886:/*
;2887:===============
;2888:CG_ResetPlayerEntity
;2889:
;2890:A player just came into view or teleported, so reset all animation info
;2891:===============
;2892:*/
;2893:void CG_ResetPlayerEntity( centity_t *cent ) {
line 2894
;2894:	cent->errorTime = -99999;		// guarantee no error decay added
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
CNSTI4 -99999
ASGNI4
line 2895
;2895:	cent->extrapolated = qfalse;	
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTI4 0
ASGNI4
line 2897
;2896:
;2897:	CG_ClearLerpFrame( &cgs.clientinfo[ cent->currentState.clientNum ], &cent->pe.legs, cent->currentState.legsAnim );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ClearLerpFrame
CALLV
pop
line 2898
;2898:	CG_ClearLerpFrame( &cgs.clientinfo[ cent->currentState.clientNum ], &cent->pe.torso, cent->currentState.torsoAnim );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ClearLerpFrame
CALLV
pop
line 2900
;2899:
;2900:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.time, cent->lerpOrigin );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 2901
;2901:	BG_EvaluateTrajectory( &cent->currentState.apos, cg.time, cent->lerpAngles );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 728
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 2903
;2902:
;2903:	VectorCopy( cent->lerpOrigin, cent->rawOrigin );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 680
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 2904
;2904:	VectorCopy( cent->lerpAngles, cent->rawAngles );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 692
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 728
ADDP4
INDIRB
ASGNB 12
line 2906
;2905:
;2906:	memset( &cent->pe.legs, 0, sizeof( cent->pe.legs ) );
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 48
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2907
;2907:	cent->pe.legs.yawAngle = cent->rawAngles[YAW];
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 480
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 696
ADDP4
INDIRF4
ASGNF4
line 2908
;2908:	cent->pe.legs.yawing = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 484
ADDP4
CNSTI4 0
ASGNI4
line 2909
;2909:	cent->pe.legs.pitchAngle = 0;
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
CNSTF4 0
ASGNF4
line 2910
;2910:	cent->pe.legs.pitching = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
CNSTI4 0
ASGNI4
line 2912
;2911:
;2912:	memset( &cent->pe.torso, 0, sizeof( cent->pe.torso ) );
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 48
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2913
;2913:	cent->pe.torso.yawAngle = cent->rawAngles[YAW];
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 696
ADDP4
INDIRF4
ASGNF4
line 2914
;2914:	cent->pe.torso.yawing = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
CNSTI4 0
ASGNI4
line 2915
;2915:	cent->pe.torso.pitchAngle = cent->rawAngles[PITCH];
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 536
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 692
ADDP4
INDIRF4
ASGNF4
line 2916
;2916:	cent->pe.torso.pitching = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
CNSTI4 0
ASGNI4
line 2918
;2917:
;2918:	if ( cg_debugPosition.integer ) {
ADDRGP4 cg_debugPosition+12
INDIRI4
CNSTI4 0
EQI4 $1796
line 2919
;2919:		CG_Printf("%i ResetPlayerEntity yaw=%f\n", cent->currentState.number, cent->pe.torso.yawAngle );
ADDRGP4 $1799
ARGP4
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
INDIRI4
ARGI4
ADDRLP4 36
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ARGF4
ADDRGP4 CG_Printf
CALLV
pop
line 2920
;2920:	}
LABELV $1796
line 2921
;2921:}
LABELV $1791
endproc CG_ResetPlayerEntity 40 12
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
import CG_PredictPlayerState
import CG_Trace
import CG_PointContents
import CG_BuildSolidList
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
LABELV $1799
byte 1 37
byte 1 105
byte 1 32
byte 1 82
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 121
byte 1 97
byte 1 119
byte 1 61
byte 1 37
byte 1 102
byte 1 10
byte 1 0
align 1
LABELV $1765
byte 1 116
byte 1 97
byte 1 103
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $1465
byte 1 116
byte 1 97
byte 1 103
byte 1 95
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 111
byte 1 0
align 1
LABELV $1394
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
byte 1 78
byte 1 117
byte 1 109
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $852
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $783
byte 1 67
byte 1 108
byte 1 97
byte 1 109
byte 1 112
byte 1 32
byte 1 108
byte 1 102
byte 1 45
byte 1 62
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $749
byte 1 65
byte 1 110
byte 1 105
byte 1 109
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $745
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
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
byte 1 0
align 1
LABELV $740
byte 1 77
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 108
byte 1 111
byte 1 119
byte 1 46
byte 1 32
byte 1 32
byte 1 85
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $727
byte 1 77
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 108
byte 1 111
byte 1 119
byte 1 46
byte 1 32
byte 1 85
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $704
byte 1 104
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $698
byte 1 116
byte 1 108
byte 1 0
align 1
LABELV $696
byte 1 116
byte 1 116
byte 1 0
align 1
LABELV $678
byte 1 108
byte 1 0
align 1
LABELV $676
byte 1 119
byte 1 0
align 1
LABELV $674
byte 1 104
byte 1 99
byte 1 0
align 1
LABELV $672
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $655
byte 1 99
byte 1 50
byte 1 0
align 1
LABELV $653
byte 1 99
byte 1 49
byte 1 0
align 1
LABELV $649
byte 1 116
byte 1 0
align 1
LABELV $646
byte 1 110
byte 1 0
align 1
LABELV $582
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $558
byte 1 63
byte 1 63
byte 1 63
byte 1 0
align 1
LABELV $526
byte 1 67
byte 1 71
byte 1 95
byte 1 83
byte 1 101
byte 1 116
byte 1 68
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 114
byte 1 101
byte 1 100
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $457
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
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $448
byte 1 116
byte 1 97
byte 1 103
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $443
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 95
byte 1 77
byte 1 79
byte 1 68
byte 1 69
byte 1 76
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 114
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $440
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 95
byte 1 84
byte 1 69
byte 1 65
byte 1 77
byte 1 95
byte 1 77
byte 1 79
byte 1 68
byte 1 69
byte 1 76
byte 1 32
byte 1 47
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 41
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 114
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $432
byte 1 67
byte 1 71
byte 1 95
byte 1 82
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 40
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 41
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $426
byte 1 47
byte 1 0
align 1
LABELV $416
byte 1 48
byte 1 0
align 1
LABELV $413
byte 1 114
byte 1 95
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 101
byte 1 120
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $382
byte 1 120
byte 1 97
byte 1 101
byte 1 114
byte 1 111
byte 1 0
align 1
LABELV $381
byte 1 118
byte 1 105
byte 1 115
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $380
byte 1 117
byte 1 114
byte 1 105
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $379
byte 1 116
byte 1 97
byte 1 110
byte 1 107
byte 1 106
byte 1 114
byte 1 0
align 1
LABELV $378
byte 1 115
byte 1 111
byte 1 114
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $377
byte 1 115
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $376
byte 1 115
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $375
byte 1 114
byte 1 97
byte 1 122
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $374
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $373
byte 1 111
byte 1 114
byte 1 98
byte 1 98
byte 1 0
align 1
LABELV $372
byte 1 109
byte 1 121
byte 1 110
byte 1 120
byte 1 0
align 1
LABELV $371
byte 1 109
byte 1 97
byte 1 106
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $370
byte 1 108
byte 1 117
byte 1 99
byte 1 121
byte 1 0
align 1
LABELV $369
byte 1 107
byte 1 108
byte 1 101
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $368
byte 1 107
byte 1 101
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $367
byte 1 104
byte 1 117
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $366
byte 1 103
byte 1 114
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $365
byte 1 100
byte 1 111
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $364
byte 1 99
byte 1 114
byte 1 97
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $363
byte 1 98
byte 1 111
byte 1 110
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $362
byte 1 98
byte 1 105
byte 1 116
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $361
byte 1 98
byte 1 105
byte 1 107
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $360
byte 1 97
byte 1 110
byte 1 97
byte 1 114
byte 1 107
byte 1 105
byte 1 0
align 1
LABELV $354
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $351
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $348
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
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
byte 1 110
byte 1 105
byte 1 109
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
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $345
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
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $342
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
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $341
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $338
byte 1 83
byte 1 116
byte 1 114
byte 1 111
byte 1 103
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $337
byte 1 80
byte 1 97
byte 1 103
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $336
byte 1 37
byte 1 115
byte 1 47
byte 1 0
align 1
LABELV $333
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $324
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
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $323
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
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $318
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
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $315
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
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $314
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $311
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
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $308
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
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $300
byte 1 72
byte 1 101
byte 1 97
byte 1 100
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 117
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $297
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $294
byte 1 84
byte 1 111
byte 1 114
byte 1 115
byte 1 111
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 117
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $291
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $288
byte 1 76
byte 1 101
byte 1 103
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 117
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $285
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $284
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $264
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
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $263
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
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $253
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 47
byte 1 0
align 1
LABELV $239
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
byte 1 0
align 1
LABELV $229
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
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $228
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
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $220
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
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $219
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
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $209
byte 1 0
align 1
LABELV $208
byte 1 112
byte 1 109
byte 1 0
align 1
LABELV $205
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $204
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $190
byte 1 69
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 97
byte 1 110
byte 1 105
byte 1 109
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
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $165
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 116
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $162
byte 1 102
byte 1 105
byte 1 120
byte 1 101
byte 1 100
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 111
byte 1 0
align 1
LABELV $159
byte 1 102
byte 1 105
byte 1 120
byte 1 101
byte 1 100
byte 1 108
byte 1 101
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $148
byte 1 115
byte 1 101
byte 1 120
byte 1 0
align 1
LABELV $139
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 111
byte 1 102
byte 1 102
byte 1 115
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $136
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 109
byte 1 32
byte 1 105
byte 1 110
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
LABELV $135
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 103
byte 1 121
byte 1 0
align 1
LABELV $132
byte 1 109
byte 1 101
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $129
byte 1 102
byte 1 108
byte 1 101
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $126
byte 1 98
byte 1 111
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $122
byte 1 110
byte 1 111
byte 1 114
byte 1 109
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $121
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $116
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
LABELV $108
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $100
byte 1 85
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 99
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 32
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $85
byte 1 42
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $84
byte 1 42
byte 1 102
byte 1 97
byte 1 108
byte 1 108
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $83
byte 1 42
byte 1 100
byte 1 114
byte 1 111
byte 1 119
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $82
byte 1 42
byte 1 103
byte 1 97
byte 1 115
byte 1 112
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $81
byte 1 42
byte 1 102
byte 1 97
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $80
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 49
byte 1 48
byte 1 48
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $79
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 55
byte 1 53
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $78
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 53
byte 1 48
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $77
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 50
byte 1 53
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $76
byte 1 42
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $75
byte 1 42
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $74
byte 1 42
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $73
byte 1 42
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
