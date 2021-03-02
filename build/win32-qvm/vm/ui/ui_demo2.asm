lit
align 1
LABELV dir
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 115
byte 1 0
skip 250
data
align 4
LABELV dirlevel
byte 4 0
align 4
LABELV sorttype
address $71
address $72
address $73
byte 4 0
code
proc Demos_DrawFilter 56 20
file "..\..\..\..\code\q3_ui\ui_demo2.c"
line 98
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:DEMOS MENU
;7:
;8:=======================================================================
;9:*/
;10:
;11:
;12:#include "ui_local.h"
;13:#include "../qcommon/q_shared.h"
;14:
;15:
;16:#define ART_BACK0			"menu/art/back_0"
;17:#define ART_BACK1			"menu/art/back_1"	
;18:#define ART_GO0				"menu/art/play_0"
;19:#define ART_GO1				"menu/art/play_1"
;20:#define ART_ARROWS_VERT		"menu/art/arrows_vert_0"
;21:#define ART_ARROWS_UP		"menu/art/arrows_vert_top"
;22:#define ART_ARROWS_DOWN		"menu/art/arrows_vert_bot"
;23:
;24:#define UI_DEMO_LENGTH      64
;25:#define UI_MAX_DEMOS        1024
;26:#define UI_MAX_ITEMS        18
;27:#define NAMEBUFSIZE         65536
;28:
;29:#define ID_BACK				10
;30:#define ID_GO				11
;31:#define ID_LIST				12
;32:#define ID_UP				13
;33:#define ID_DOWN				14
;34:#define ID_TIMEDEMO			15
;35:#define ID_SORT				16
;36:#define ID_FILTER			17
;37:
;38:
;39:#define ARROWS_WIDTH		48
;40:#define ARROWS_HEIGHT		128
;41:#define ARROWS_TOP			240+4.75f
;42:#define ARROWS_LEFT			512+64
;43:
;44:typedef struct {
;45:	menuframework_s	menu;
;46:
;47:	menutext_s		banner;
;48:
;49:	menulist_s		list;
;50:	menulist_s		sort;
;51:
;52:	menubitmap_s	arrows;
;53:	menubitmap_s	up;
;54:	menubitmap_s	down;
;55:	menubitmap_s	back;
;56:	menubitmap_s	go;
;57:	menuradiobutton_s	timedemo;
;58:
;59:	menufield_s		filter;
;60:
;61:	int				numDemos;
;62:	qboolean		canPlay;
;63:	char			*itemname[UI_MAX_DEMOS];
;64:	char			namefilter[MAX_EDIT_LINE];
;65:} demos_t;
;66:
;67:static demos_t	s_demos;
;68:
;69:typedef struct {
;70:	char *file_name;
;71:	int	 file_nlen;
;72:	char file_type;
;73:} demo_entry_t;
;74:
;75:static demo_entry_t dentry[UI_MAX_DEMOS];	// will be filled by UI_DemosReadDir()
;76:static demo_entry_t *dptr[UI_MAX_DEMOS];	// used for sorting
;77:static int	num_files;
;78:static char	dir[256] = { "demos" }; // current directory
;79:static int	dirlevel = 0;			// directory level
;80:static int	listpos[64][2];			// saved list positions( curvalue, top )
;81:static char	buffer[NAMEBUFSIZE];	// filename buffer
;82:static char	show_names[UI_MAX_DEMOS][UI_DEMO_LENGTH*3];
;83:
;84:static const char* sorttype[] = {
;85:	"No",			
;86:	"Name, asc",
;87:	"Name, desc",
;88:	0
;89:};
;90:
;91:static void UI_DemosFillList( void );
;92:
;93:/*
;94:=================
;95:Demos_DrawFilter
;96:=================
;97:*/
;98:static void Demos_DrawFilter( void *self ) {
line 107
;99:	menufield_s		*f;
;100:	qboolean		focus;
;101:	int				style;
;102:	char			*txt;
;103:	char			c;
;104:	float			*color;
;105:	int				basex, x, y;
;106:
;107:	f = (menufield_s*)self;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
line 108
;108:	basex = f->generic.x;
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 109
;109:	y = f->generic.y;
ADDRLP4 20
ADDRLP4 24
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 110
;110:	focus = (f->generic.parent->cursor == f->generic.menuPosition);
ADDRLP4 24
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $76
ADDRLP4 36
CNSTI4 1
ASGNI4
ADDRGP4 $77
JUMPV
LABELV $76
ADDRLP4 36
CNSTI4 0
ASGNI4
LABELV $77
ADDRLP4 32
ADDRLP4 36
INDIRI4
ASGNI4
line 117
;111:#if 0
;112:	UI_FillRect( f->generic.left, f->generic.top, 
;113:		f->generic.right-f->generic.left, 
;114:		f->generic.bottom-f->generic.top, 
;115:		text_color_disabled );
;116:#endif
;117:	style = UI_LEFT|UI_SMALLFONT;
ADDRLP4 12
CNSTI4 16
ASGNI4
line 118
;118:	color = text_color_normal;
ADDRLP4 16
ADDRGP4 text_color_normal
ASGNP4
line 120
;119:
;120:	if( focus ) {
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $78
line 121
;121:		style |= UI_PULSE;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 122
;122:		color = text_color_highlight;
ADDRLP4 16
ADDRGP4 text_color_highlight
ASGNP4
line 123
;123:	}
LABELV $78
line 125
;124:
;125:	UI_DrawString( basex, y, "Filter:", style, color );
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 $80
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 127
;126:
;127:	basex += 64;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 64
ADDI4
ASGNI4
line 129
;128:	//y += PROP_HEIGHT;
;129:	txt = f->field.buffer;
ADDRLP4 0
ADDRLP4 24
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
line 130
;130:	color = g_color_table[ColorIndex(COLOR_WHITE)];
ADDRLP4 16
ADDRGP4 g_color_table+112
ASGNP4
line 131
;131:	x = basex;
ADDRLP4 8
ADDRLP4 28
INDIRI4
ASGNI4
ADDRGP4 $83
JUMPV
LABELV $82
line 133
;132:
;133:	while ( (c = *txt) != 0 ) {
line 134
;134:		UI_DrawChar( x, y, c, style, color );
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 UI_DrawChar
CALLV
pop
line 135
;135:		txt++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 136
;136:		x += SMALLCHAR_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 8
ADDI4
ASGNI4
line 137
;137:	}
LABELV $83
line 133
ADDRLP4 44
ADDRLP4 0
INDIRP4
INDIRI1
ASGNI1
ADDRLP4 4
ADDRLP4 44
INDIRI1
ASGNI1
ADDRLP4 44
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $82
line 139
;138:
;139:	if ( strcmp( s_demos.namefilter, f->field.buffer) ) {
ADDRGP4 s_demos+5552
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 76
ADDP4
ARGP4
ADDRLP4 48
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $85
line 140
;140:		strcpy( s_demos.namefilter, f->field.buffer );
ADDRGP4 s_demos+5552
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 76
ADDP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 141
;141:		UI_DemosFillList();
ADDRGP4 UI_DemosFillList
CALLV
pop
line 142
;142:	}
LABELV $85
line 145
;143:
;144:	// draw cursor if we have focus
;145:	if( focus ) {
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $89
line 146
;146:		if ( trap_Key_GetOverstrikeMode() ) {
ADDRLP4 52
ADDRGP4 trap_Key_GetOverstrikeMode
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $91
line 147
;147:			c = 11;
ADDRLP4 4
CNSTI1 11
ASGNI1
line 148
;148:		} else {
ADDRGP4 $92
JUMPV
LABELV $91
line 149
;149:			c = 10;
ADDRLP4 4
CNSTI1 10
ASGNI1
line 150
;150:		}
LABELV $92
line 152
;151:
;152:		style &= ~UI_PULSE;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 153
;153:		style |= UI_BLINK;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 155
;154:
;155:		UI_DrawChar( basex + f->field.cursor * SMALLCHAR_WIDTH, y, c, style, color_white );
ADDRLP4 28
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
CNSTI4 3
LSHI4
ADDI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawChar
CALLV
pop
line 156
;156:	}
LABELV $89
line 157
;157:}
LABELV $74
endproc Demos_DrawFilter 56 20
proc UI_DemosSavePosition 0 0
line 160
;158:
;159:
;160:static void UI_DemosSavePosition( void ) {
line 161
;161:	if ( dirlevel < ARRAY_LEN( listpos ) ) {
ADDRGP4 dirlevel
INDIRI4
CVIU4 4
CNSTU4 64
GEU4 $94
line 162
;162:		listpos[dirlevel][0] = s_demos.list.curvalue;
ADDRGP4 dirlevel
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 listpos
ADDP4
ADDRGP4 s_demos+364+68
INDIRI4
ASGNI4
line 163
;163:		listpos[dirlevel][1] = s_demos.list.top;
ADDRGP4 dirlevel
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 listpos+4
ADDP4
ADDRGP4 s_demos+364+76
INDIRI4
ASGNI4
line 164
;164:	}
LABELV $94
line 165
;165:}
LABELV $93
endproc UI_DemosSavePosition 0 0
proc UI_DemosRestorePosition 0 0
line 168
;166:
;167:
;168:static void UI_DemosRestorePosition( void ) {
line 169
;169:	if ( dirlevel < ARRAY_LEN( listpos ) ) {
ADDRGP4 dirlevel
INDIRI4
CVIU4 4
CNSTU4 64
GEU4 $102
line 170
;170:		s_demos.list.curvalue = listpos[dirlevel][0];
ADDRGP4 s_demos+364+68
ADDRGP4 dirlevel
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 listpos
ADDP4
INDIRI4
ASGNI4
line 171
;171:		s_demos.list.top = listpos[dirlevel][1];
ADDRGP4 s_demos+364+76
ADDRGP4 dirlevel
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 listpos+4
ADDP4
INDIRI4
ASGNI4
line 172
;172:	}
LABELV $102
line 173
;173:}
LABELV $101
endproc UI_DemosRestorePosition 0 0
proc UI_DemosReadDir 80 16
line 182
;174:
;175:
;176:/*
;177:===============
;178:UI_DemosReadDir
;179:===============
;180:*/
;181:static void UI_DemosReadDir( void ) 
;182:{
line 186
;183:	char	extension[32], *s;
;184:	int		i, len, n, c, m;
;185:
;186:	c = 0; // count of valid entries
ADDRLP4 8
CNSTI4 0
ASGNI4
line 189
;187:
;188:	// reserve room for ".."
;189:	if ( dirlevel > 0 )
ADDRGP4 dirlevel
INDIRI4
CNSTI4 0
LEI4 $110
line 190
;190:		c++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $110
line 193
;191:
;192:	// get directories first
;193:	n = trap_FS_GetFileList( dir, "/", buffer, sizeof( buffer ) );
ADDRGP4 dir
ARGP4
ADDRGP4 $112
ARGP4
ADDRGP4 buffer
ARGP4
CNSTI4 65536
ARGI4
ADDRLP4 56
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 56
INDIRI4
ASGNI4
line 194
;194:	if ( n > UI_MAX_DEMOS )
ADDRLP4 16
INDIRI4
CNSTI4 1024
LEI4 $113
line 195
;195:		n = UI_MAX_DEMOS;
ADDRLP4 16
CNSTI4 1024
ASGNI4
LABELV $113
line 196
;196:	s = buffer;
ADDRLP4 0
ADDRGP4 buffer
ASGNP4
line 198
;197:
;198:	for ( i = 0; i < n; i++ ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $118
JUMPV
LABELV $115
line 199
;199:		len = strlen( s );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 60
INDIRI4
ASGNI4
line 201
;200:		// don't and "." and ".." entries for demo root dir
;201:		if ( !s[0] || ( s[0]== '.' && !s[1] ) || ( !strcmp( s, ".." ) && dirlevel == 0 ) ) {
ADDRLP4 68
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $123
ADDRLP4 68
INDIRI4
CNSTI4 46
NEI4 $124
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $123
LABELV $124
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $121
ARGP4
ADDRLP4 72
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $119
ADDRGP4 dirlevel
INDIRI4
CNSTI4 0
NEI4 $119
LABELV $123
line 202
;202:			s += len + 1;
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 203
;203:			continue;
ADDRGP4 $116
JUMPV
LABELV $119
line 205
;204:		}
;205:		if ( !strcmp( s, ".." ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $121
ARGP4
ADDRLP4 76
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $125
line 206
;206:			dentry[0].file_type = 2;
ADDRGP4 dentry+8
CNSTI1 2
ASGNI1
line 207
;207:			dentry[0].file_name = s;
ADDRGP4 dentry
ADDRLP4 0
INDIRP4
ASGNP4
line 208
;208:			dentry[0].file_nlen = len;
ADDRGP4 dentry+4
ADDRLP4 4
INDIRI4
ASGNI4
line 209
;209:		} else {
ADDRGP4 $126
JUMPV
LABELV $125
line 210
;210:			dentry[c].file_type = 1;
ADDRLP4 8
INDIRI4
CNSTI4 12
MULI4
ADDRGP4 dentry+8
ADDP4
CNSTI1 1
ASGNI1
line 211
;211:			dentry[c].file_name = s;
ADDRLP4 8
INDIRI4
CNSTI4 12
MULI4
ADDRGP4 dentry
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 212
;212:			dentry[c].file_nlen = len;
ADDRLP4 8
INDIRI4
CNSTI4 12
MULI4
ADDRGP4 dentry+4
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 213
;213:			c++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 214
;214:		}
LABELV $126
line 215
;215:		s += len + 1;
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 216
;216:	}
LABELV $116
line 198
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $118
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $115
line 217
;217:	num_files = c;
ADDRGP4 num_files
ADDRLP4 8
INDIRI4
ASGNI4
line 218
;218:	len = sizeof(buffer) - (s - buffer) - 1;
ADDRLP4 4
CNSTU4 65536
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 buffer
CVPU4 4
SUBU4
CVUI4 4
CVIU4 4
SUBU4
CNSTU4 1
SUBU4
CVUI4 4
ASGNI4
line 219
;219:	if ( len > 2  && num_files < UI_MAX_DEMOS-1 ) {
ADDRLP4 4
INDIRI4
CNSTI4 2
LEI4 $131
ADDRGP4 num_files
INDIRI4
CNSTI4 1023
GEI4 $131
line 221
;220:		// count regular files
;221:		m = trap_FS_GetFileList( dir, "dm_??", s, len ); // try to perform pattern match in first place
ADDRGP4 dir
ARGP4
ADDRGP4 $133
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 60
INDIRI4
ASGNI4
line 222
;222:		if ( !m ) {
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $134
line 223
;223:			Com_sprintf( extension, sizeof( extension ), "dm_%d", (int)trap_Cvar_VariableValue( "protocol" ) );
ADDRGP4 $137
ARGP4
ADDRLP4 64
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 24
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $136
ARGP4
ADDRLP4 64
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 224
;224:			m = trap_FS_GetFileList( dir, extension, s, len );
ADDRGP4 dir
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 68
INDIRI4
ASGNI4
line 225
;225:		}
LABELV $134
line 226
;226:		if ( num_files + m > UI_MAX_DEMOS ) 
ADDRGP4 num_files
INDIRI4
ADDRLP4 20
INDIRI4
ADDI4
CNSTI4 1024
LEI4 $138
line 227
;227:			m = UI_MAX_DEMOS - n;
ADDRLP4 20
CNSTI4 1024
ADDRLP4 16
INDIRI4
SUBI4
ASGNI4
LABELV $138
line 228
;228:		for ( i = 0; i < m; i++, c++ ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $143
JUMPV
LABELV $140
line 229
;229:			len = strlen( s );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 64
INDIRI4
ASGNI4
line 230
;230:			dentry[c].file_name = s;
ADDRLP4 8
INDIRI4
CNSTI4 12
MULI4
ADDRGP4 dentry
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 231
;231:			dentry[c].file_nlen = len;
ADDRLP4 8
INDIRI4
CNSTI4 12
MULI4
ADDRGP4 dentry+4
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 232
;232:			dentry[c].file_type = 0;
ADDRLP4 8
INDIRI4
CNSTI4 12
MULI4
ADDRGP4 dentry+8
ADDP4
CNSTI1 0
ASGNI1
line 233
;233:			s += len + 1;
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 234
;234:		}
LABELV $141
line 228
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $143
ADDRLP4 12
INDIRI4
ADDRLP4 20
INDIRI4
LTI4 $140
line 235
;235:		num_files += m;
ADDRLP4 64
ADDRGP4 num_files
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
ADDRLP4 20
INDIRI4
ADDI4
ASGNI4
line 236
;236:	}
LABELV $131
line 237
;237:	s_demos.numDemos = num_files;
ADDRGP4 s_demos+1448
ADDRGP4 num_files
INDIRI4
ASGNI4
line 238
;238:}
LABELV $109
endproc UI_DemosReadDir 80 16
proc UI_UpdateDirectory 28 12
line 246
;239:
;240:
;241:/*
;242:===============
;243:UI_UpdateDirectory
;244:===============
;245:*/
;246:static qboolean UI_UpdateDirectory( char *name ) {
line 249
;247:	char *s;
;248:
;249:	s_demos.namefilter[0] = '\0';
ADDRGP4 s_demos+5552
CNSTI1 0
ASGNI1
line 250
;250:	s_demos.filter.field.buffer[0] = '\0';
ADDRGP4 s_demos+1108+64+12
CNSTI1 0
ASGNI1
line 251
;251:	s_demos.filter.field.cursor = 0;
ADDRGP4 s_demos+1108+64
CNSTI4 0
ASGNI4
line 253
;252:
;253:	if ( !name || !*name ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $156
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $154
LABELV $156
line 254
;254:		s = Q_strrchr( dir, '/' );
ADDRGP4 dir
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 8
ADDRGP4 Q_strrchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 255
;255:		if ( !s || s == dir ) {
ADDRLP4 12
ADDRLP4 0
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 12
INDIRU4
CNSTU4 0
EQU4 $159
ADDRLP4 12
INDIRU4
ADDRGP4 dir
CVPU4 4
NEU4 $157
LABELV $159
line 256
;256:			dirlevel = 0;
ADDRGP4 dirlevel
CNSTI4 0
ASGNI4
line 257
;257:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $147
JUMPV
LABELV $157
line 258
;258:		} else {
line 259
;259:			*s = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 260
;260:			s = Q_strrchr( dir, '/' );
ADDRGP4 dir
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 16
ADDRGP4 Q_strrchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 261
;261:			if ( dirlevel > 0 )
ADDRGP4 dirlevel
INDIRI4
CNSTI4 0
LEI4 $160
line 262
;262:				dirlevel--;
ADDRLP4 20
ADDRGP4 dirlevel
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $160
line 263
;263:			if ( !s || s == dir )
ADDRLP4 24
ADDRLP4 0
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 24
INDIRU4
CNSTU4 0
EQU4 $164
ADDRLP4 24
INDIRU4
ADDRGP4 dir
CVPU4 4
NEU4 $162
LABELV $164
line 264
;264:				dirlevel = 0;
ADDRGP4 dirlevel
CNSTI4 0
ASGNI4
LABELV $162
line 265
;265:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $147
JUMPV
LABELV $154
line 267
;266:		}		
;267:	} else {
line 268
;268:		Q_strcat( dir, sizeof( dir ), "/" );
ADDRGP4 dir
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $112
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 269
;269:		Q_strcat( dir, sizeof( dir ), name );
ADDRGP4 dir
ARGP4
CNSTI4 256
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 270
;270:		UI_DemosSavePosition();
ADDRGP4 UI_DemosSavePosition
CALLV
pop
line 271
;271:		dirlevel++;
ADDRLP4 8
ADDRGP4 dirlevel
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 272
;272:		return qtrue;
CNSTI4 1
RETI4
LABELV $147
endproc UI_UpdateDirectory 28 12
proc UI_DemoClick 20 12
line 282
;273:	}
;274:}
;275:
;276:
;277:/*
;278:===============
;279:UI_UpdateDirectory
;280:===============
;281:*/
;282:static void UI_DemoClick( void ) {
line 286
;283:	demo_entry_t *d;
;284:	char *s, *r;
;285:
;286:	if ( !s_demos.numDemos || !s_demos.canPlay )
ADDRGP4 s_demos+1448
INDIRI4
CNSTI4 0
EQI4 $170
ADDRGP4 s_demos+1452
INDIRI4
CNSTI4 0
NEI4 $166
LABELV $170
line 287
;287:		return;
ADDRGP4 $165
JUMPV
LABELV $166
line 289
;288:
;289:	d = dptr[ s_demos.list.curvalue ];
ADDRLP4 0
ADDRGP4 s_demos+364+68
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 dptr
ADDP4
INDIRP4
ASGNP4
line 290
;290:	if ( !d )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $173
line 291
;291:		return;
ADDRGP4 $165
JUMPV
LABELV $173
line 293
;292:
;293:	if ( d->file_type > 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $175
line 294
;294:		if ( !strcmp( d->file_name, ".." ) ) {
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $121
ARGP4
ADDRLP4 12
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $177
line 295
;295:			UI_UpdateDirectory( NULL );
CNSTP4 0
ARGP4
ADDRGP4 UI_UpdateDirectory
CALLI4
pop
line 296
;296:			UI_DemosReadDir();
ADDRGP4 UI_DemosReadDir
CALLV
pop
line 297
;297:			UI_DemosFillList();
ADDRGP4 UI_DemosFillList
CALLV
pop
line 298
;298:			UI_DemosRestorePosition();
ADDRGP4 UI_DemosRestorePosition
CALLV
pop
line 299
;299:		} else {
ADDRGP4 $176
JUMPV
LABELV $177
line 300
;300:			UI_UpdateDirectory( d->file_name );
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 UI_UpdateDirectory
CALLI4
pop
line 301
;301:			UI_DemosReadDir();
ADDRGP4 UI_DemosReadDir
CALLV
pop
line 302
;302:			UI_DemosFillList();
ADDRGP4 UI_DemosFillList
CALLV
pop
line 303
;303:		}
line 304
;304:	} else {
ADDRGP4 $176
JUMPV
LABELV $175
line 305
;305:		UI_ForceMenuOff ();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 306
;306:		s = strchr( dir, '/' );
ADDRGP4 dir
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 12
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 307
;307:		if ( s ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $179
line 308
;308:			r = va( "demo \"%s/%s\"\n", s + 1, d->file_name );
ADDRGP4 $181
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 309
;309:		} else
ADDRGP4 $180
JUMPV
LABELV $179
line 310
;310:			r = va( "demo \"%s\"\n", d->file_name );
ADDRGP4 $182
ARGP4
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
LABELV $180
line 311
;311:		trap_Cmd_ExecuteText( EXEC_APPEND, r );
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 312
;312:	}
LABELV $176
line 313
;313:}
LABELV $165
endproc UI_DemoClick 20 12
proc Demos_MenuEvent 12 8
line 321
;314:
;315:
;316:/*
;317:===============
;318:Demos_MenuEvent
;319:===============
;320:*/
;321:static void Demos_MenuEvent( void *ptr, int event ) {
line 322
;322:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $184
line 323
;323:		return;
ADDRGP4 $183
JUMPV
LABELV $184
line 326
;324:	}
;325:
;326:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $186
ADDRLP4 0
INDIRI4
CNSTI4 16
GTI4 $186
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $208-40
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $208
address $190
address $189
address $186
address $191
address $193
address $195
address $203
code
LABELV $189
line 328
;327:	case ID_GO:
;328:		UI_DemoClick();
ADDRGP4 UI_DemoClick
CALLV
pop
line 329
;329:		break;
ADDRGP4 $187
JUMPV
LABELV $190
line 332
;330:
;331:	case ID_BACK:
;332:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 333
;333:		break;
ADDRGP4 $187
JUMPV
LABELV $191
line 336
;334:
;335:	case ID_UP:
;336:		ScrollList_Key( &s_demos.list, K_UPARROW );
ADDRGP4 s_demos+364
ARGP4
CNSTI4 132
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 337
;337:		break;
ADDRGP4 $187
JUMPV
LABELV $193
line 340
;338:
;339:	case ID_DOWN:
;340:		ScrollList_Key( &s_demos.list, K_DOWNARROW );
ADDRGP4 s_demos+364
ARGP4
CNSTI4 133
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 341
;341:		break;
ADDRGP4 $187
JUMPV
LABELV $195
line 344
;342:
;343:	case ID_TIMEDEMO:
;344:		if ( s_demos.timedemo.curvalue )
ADDRGP4 s_demos+1040+64
INDIRI4
CNSTI4 0
EQI4 $196
line 345
;345:			trap_Cvar_Set( "timedemo", "1" );
ADDRGP4 $200
ARGP4
ADDRGP4 $201
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
ADDRGP4 $187
JUMPV
LABELV $196
line 347
;346:		else
;347:			trap_Cvar_Set( "timedemo", "0" );
ADDRGP4 $200
ARGP4
ADDRGP4 $202
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 348
;348:		break;
ADDRGP4 $187
JUMPV
LABELV $203
line 351
;349:
;350:	case ID_SORT:
;351:		trap_Cvar_Set( "ui_demoSort", va( "%i", s_demos.sort.curvalue ) );
ADDRGP4 $205
ARGP4
ADDRGP4 s_demos+472+68
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $204
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 352
;352:		UI_DemosFillList();
ADDRGP4 UI_DemosFillList
CALLV
pop
line 353
;353:		break;
LABELV $186
LABELV $187
line 355
;354:	}
;355:}
LABELV $183
endproc Demos_MenuEvent 12 8
proc UI_DemosDblclick 0 0
line 357
;356:
;357:static void UI_DemosDblclick( void *ptr ) {
line 358
;358:	UI_DemoClick();
ADDRGP4 UI_DemoClick
CALLV
pop
line 359
;359:}
LABELV $210
endproc UI_DemosDblclick 0 0
proc UI_DemosMenu_Key 16 8
line 392
;360:
;361:#if 0
;362:static sfxHandle_t UI_DemosKeydown( void *ptr, int key ) {
;363:/*	
;364:	if ( key == K_ENTER || key == K_KP_ENTER ) {
;365:		UI_DemoClick();
;366:		return menu_move_sound;
;367:	}
;368:	if ( key == K_BACKSPACE ) {
;369:		if ( UI_UpdateDirectory( NULL ) ) {
;370:			UI_DemosReadDir();
;371:			UI_DemosFillList();
;372:			UI_DemosRestorePosition();
;373:		}
;374:		return menu_move_sound;
;375:	}
;376:	if ( key == '/' ) {
;377:		Menu_SetCursorToItem( (menuframework_s *)&s_demos, &s_demos.filter );
;378:		s_demos.filter.field.skipKey = qtrue;
;379:		return menu_null_sound;
;380:	}
;381:*/
;382:	return 0;
;383:
;384:}
;385:#endif
;386:
;387:/*
;388:=================
;389:UI_DemosMenu_Key
;390:=================
;391:*/
;392:static sfxHandle_t UI_DemosMenu_Key( int key ) {
line 395
;393:	menucommon_s	*item;
;394:
;395:	item = Menu_ItemAtCursor( &s_demos.menu );
ADDRGP4 s_demos
ARGP4
ADDRLP4 4
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 397
;396:
;397:	if ( item == (menucommon_s *)&s_demos.list ) {
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 s_demos+364
CVPU4 4
NEU4 $212
line 398
;398:		if ( key == K_ENTER || key == K_KP_ENTER ) {
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 13
EQI4 $217
ADDRLP4 8
INDIRI4
CNSTI4 169
NEI4 $215
LABELV $217
line 399
;399:			UI_DemoClick();
ADDRGP4 UI_DemoClick
CALLV
pop
line 400
;400:			return menu_in_sound;
ADDRGP4 menu_in_sound
INDIRI4
RETI4
ADDRGP4 $211
JUMPV
LABELV $215
line 402
;401:		}
;402:		if ( key == K_BACKSPACE ) {
ADDRFP4 0
INDIRI4
CNSTI4 127
NEI4 $218
line 403
;403:			if ( UI_UpdateDirectory( NULL ) ) {
CNSTP4 0
ARGP4
ADDRLP4 12
ADDRGP4 UI_UpdateDirectory
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $220
line 404
;404:				UI_DemosReadDir();
ADDRGP4 UI_DemosReadDir
CALLV
pop
line 405
;405:				UI_DemosFillList();
ADDRGP4 UI_DemosFillList
CALLV
pop
line 406
;406:				UI_DemosRestorePosition();
ADDRGP4 UI_DemosRestorePosition
CALLV
pop
line 407
;407:			}
LABELV $220
line 408
;408:			return menu_in_sound;
ADDRGP4 menu_in_sound
INDIRI4
RETI4
ADDRGP4 $211
JUMPV
LABELV $218
line 410
;409:		}
;410:		if ( key == '/' ) {
ADDRFP4 0
INDIRI4
CNSTI4 47
NEI4 $222
line 411
;411:			Menu_SetCursorToItem( (menuframework_s *)&s_demos, &s_demos.filter );
ADDRGP4 s_demos
ARGP4
ADDRGP4 s_demos+1108
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 412
;412:			s_demos.filter.field.skipKey = qtrue;
ADDRGP4 s_demos+1108+64+272
CNSTI4 1
ASGNI4
line 413
;413:			return menu_in_sound;
ADDRGP4 menu_in_sound
INDIRI4
RETI4
ADDRGP4 $211
JUMPV
LABELV $222
line 415
;414:		}
;415:	}
LABELV $212
line 417
;416:
;417:	return Menu_DefaultKey( &s_demos.menu, key );
ADDRGP4 s_demos
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
LABELV $211
endproc UI_DemosMenu_Key 16 8
export UI_cstrdiff
proc UI_cstrdiff 8 0
line 422
;418:}
;419:
;420:
;421:// calculate length difference for color strings
;422:int	UI_cstrdiff( char * str ) {
line 424
;423:	int diff;
;424:	if ( !str )
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $229
line 425
;425:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $228
JUMPV
LABELV $229
line 426
;426:	diff = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $232
JUMPV
LABELV $231
line 427
;427:	while ( *str ) {
line 428
;428:		if ( *str == Q_COLOR_ESCAPE && str[1] && str[2] ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $234
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $234
ADDRLP4 4
INDIRP4
CNSTI4 2
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $234
line 429
;429:			diff += 2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
line 430
;430:			str += 2;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 431
;431:		} else
ADDRGP4 $235
JUMPV
LABELV $234
line 432
;432:			str++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $235
line 433
;433:	}
LABELV $232
line 427
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $231
line 434
;434:	return diff;
ADDRLP4 0
INDIRI4
RETI4
LABELV $228
endproc UI_cstrdiff 8 0
export UI_cstricmp
proc UI_cstricmp 32 0
line 437
;435:}
;436:
;437:int UI_cstricmp( const char *src, const char *dst ) {
line 438
;438:    int ret = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 439
;439:    int c1 = 0, c2 = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $237
line 441
;440:	unsigned char	ch1, ch2;
;441:    do {
line 442
;442:        if ( *src == '^' && src[1] ) {
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $240
ADDRLP4 16
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $240
line 443
;443:            c1 = src[1];
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
line 444
;444:            src += 2;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 445
;445:            continue;
ADDRGP4 $238
JUMPV
LABELV $240
line 448
;446:        } 
;447:                
;448:        if ( *dst == '^' && dst[1] ) {
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $242
ADDRLP4 20
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $242
line 449
;449:            c2 = dst[1];
ADDRLP4 12
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
line 450
;450:            dst += 2;
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 451
;451:            continue;
ADDRGP4 $238
JUMPV
LABELV $242
line 454
;452:        } 
;453:		
;454:		ch1 = *src;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CVIU4 4
CVUU1 4
ASGNU1
line 455
;455:		ch2 = *dst;
ADDRLP4 1
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
CVIU4 4
CVUU1 4
ASGNU1
line 457
;456:
;457:		if ( ch1 >= 'a' && ch1 <= 'z' ) 
ADDRLP4 24
ADDRLP4 0
INDIRU1
CVUI4 1
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 97
LTI4 $244
ADDRLP4 24
INDIRI4
CNSTI4 122
GTI4 $244
line 458
;458:			ch1 = ch1 - 'a' + 'A';
ADDRLP4 0
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 97
SUBI4
CNSTI4 65
ADDI4
CVIU4 4
CVUU1 4
ASGNU1
LABELV $244
line 459
;459:		if ( ch2 >= 'a' && ch2 <= 'z' ) 
ADDRLP4 28
ADDRLP4 1
INDIRU1
CVUI4 1
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 97
LTI4 $246
ADDRLP4 28
INDIRI4
CNSTI4 122
GTI4 $246
line 460
;460:			ch2 = ch2 - 'a' + 'A';
ADDRLP4 1
ADDRLP4 1
INDIRU1
CVUI4 1
CNSTI4 97
SUBI4
CNSTI4 65
ADDI4
CVIU4 4
CVUU1 4
ASGNU1
LABELV $246
line 462
;461:
;462:        ret = ch1 - ch2;
ADDRLP4 4
ADDRLP4 0
INDIRU1
CVUI4 1
ADDRLP4 1
INDIRU1
CVUI4 1
SUBI4
ASGNI4
line 463
;463:        if ( !ret )
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $248
line 464
;464:            ret = c1 - c2;
ADDRLP4 4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
ASGNI4
LABELV $248
line 466
;465:
;466:        dst++;
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 467
;467:        if ( ret || !*dst )
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $252
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $250
LABELV $252
line 468
;468:            break;
ADDRGP4 $239
JUMPV
LABELV $250
line 470
;469:
;470:        src++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 472
;471:
;472:    } while ( 1 );
LABELV $238
ADDRGP4 $237
JUMPV
LABELV $239
line 474
;473:
;474:    if ( ret < 0 )
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $253
line 475
;475:        ret = -1;
ADDRLP4 4
CNSTI4 -1
ASGNI4
ADDRGP4 $254
JUMPV
LABELV $253
line 476
;476:    else if ( ret > 0 )
ADDRLP4 4
INDIRI4
CNSTI4 0
LEI4 $255
line 477
;477:        ret = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
LABELV $255
LABELV $254
line 479
;478:
;479:    return( ret );
ADDRLP4 4
INDIRI4
RETI4
LABELV $236
endproc UI_cstricmp 32 0
proc compare_entries 12 8
line 484
;480:}
;481:
;482:
;483:static int compare_entries( demo_entry_t * a, demo_entry_t *b, int mode ) 
;484:{
line 486
;485:	int t;
;486:	t = b->file_type - a->file_type;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI1
CVII4 1
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI1
CVII4 1
SUBI4
ASGNI4
line 487
;487:	if ( !t )
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $258
line 488
;488:		if ( mode == 1 ) 
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $260
line 489
;489:			return UI_cstricmp( a->file_name, b->file_name );
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 UI_cstricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $257
JUMPV
LABELV $260
line 491
;490:		else
;491:			return -UI_cstricmp( a->file_name, b->file_name );
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_cstricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
NEGI4
RETI4
ADDRGP4 $257
JUMPV
LABELV $258
line 494
;492:
;493:	else 
;494:		return t;
ADDRLP4 0
INDIRI4
RETI4
LABELV $257
endproc compare_entries 12 8
proc UI_demosort 28 12
line 499
;495:}
;496:
;497:
;498:static void UI_demosort( demo_entry_t **a, int n, int mode ) 
;499:{
line 501
;500:    demo_entry_t * tmp;
;501:    int i = 0, j = n;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
line 502
;502:    demo_entry_t *m = a[ n>>1 ];
ADDRLP4 8
ADDRFP4 4
INDIRI4
CNSTI4 1
RSHI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRP4
ASGNP4
line 504
;503:    do 
;504:    {
ADDRGP4 $267
JUMPV
LABELV $266
line 505
;505:        while ( compare_entries( a[i], m, mode ) < 0 ) i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $267
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 compare_entries
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $266
ADDRGP4 $270
JUMPV
LABELV $269
line 506
;506:        while ( compare_entries( a[j], m, mode ) > 0 ) j--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $270
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 compare_entries
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
GTI4 $269
line 508
;507:
;508:		if ( i <= j ) 
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
GTI4 $272
line 509
;509:        {
line 510
;510:            tmp = a[i];
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRP4
ASGNP4
line 511
;511:            a[i] = a[j];
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
INDIRP4
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
INDIRP4
ADDP4
INDIRP4
ASGNP4
line 512
;512:            a[j] = tmp;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
ADDRLP4 12
INDIRP4
ASGNP4
line 513
;513:            i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 514
;514:            j--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 515
;515:        }
LABELV $272
line 516
;516:    } 
LABELV $264
line 517
;517:    while ( i <= j );
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LEI4 $267
line 518
;518:    if ( j > 0 ) UI_demosort( a, j, mode );
ADDRLP4 4
INDIRI4
CNSTI4 0
LEI4 $274
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 UI_demosort
CALLV
pop
LABELV $274
line 519
;519:    if ( n > i ) UI_demosort( a+i, n-i, mode );
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $276
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 UI_demosort
CALLV
pop
LABELV $276
line 520
;520:}
LABELV $262
endproc UI_demosort 28 12
proc UI_DemosFillList 288 12
line 523
;521:
;522:
;523:static void UI_DemosFillList( void ) {
line 529
;524:
;525:	int		i, diff, sort, len;
;526:	char	matchname[256];
;527:	demo_entry_t *d;
;528:
;529:	if ( !s_demos.numDemos )
ADDRGP4 s_demos+1448
INDIRI4
CNSTI4 0
NEI4 $279
line 530
;530:		return;
ADDRGP4 $278
JUMPV
LABELV $279
line 532
;531:
;532:	sort = s_demos.sort.curvalue;
ADDRLP4 272
ADDRGP4 s_demos+472+68
INDIRI4
ASGNI4
line 534
;533:
;534:	s_demos.list.numitems = 0;
ADDRGP4 s_demos+364+72
CNSTI4 0
ASGNI4
line 536
;535:
;536:	for ( i = 0; i < s_demos.numDemos; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $289
JUMPV
LABELV $286
line 537
;537:		len = dentry[i].file_nlen;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 12
MULI4
ADDRGP4 dentry+4
ADDP4
INDIRI4
ASGNI4
line 539
;538:
;539:		if ( s_demos.namefilter[0] && strcmp( dentry[i].file_name, ".." ) ) {
ADDRGP4 s_demos+5552
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $292
ADDRLP4 0
INDIRI4
CNSTI4 12
MULI4
ADDRGP4 dentry
ADDP4
INDIRP4
ARGP4
ADDRGP4 $121
ARGP4
ADDRLP4 276
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 276
INDIRI4
CNSTI4 0
EQI4 $292
line 540
;540:			strcpy( matchname, dentry[i].file_name );
ADDRLP4 16
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 12
MULI4
ADDRGP4 dentry
ADDP4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 543
;541:
;542:			// strip extension
;543:			if ( !Q_stricmp( matchname + len - 6, ".dm_68" ) )
ADDRLP4 4
INDIRI4
ADDRLP4 16-6
ADDP4
ARGP4
ADDRGP4 $298
ARGP4
ADDRLP4 280
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
NEI4 $295
line 544
;544:				matchname[ len-6 ] = '\0';
ADDRLP4 4
INDIRI4
ADDRLP4 16-6
ADDP4
CNSTI1 0
ASGNI1
LABELV $295
line 546
;545:		
;546:			BG_StripColor( matchname );
ADDRLP4 16
ARGP4
ADDRGP4 BG_StripColor
CALLP4
pop
line 547
;547:			if ( !Q_stristr( matchname, s_demos.namefilter ) ) {
ADDRLP4 16
ARGP4
ADDRGP4 s_demos+5552
ARGP4
ADDRLP4 284
ADDRGP4 Q_stristr
CALLP4
ASGNP4
ADDRLP4 284
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $300
line 548
;548:				continue;
ADDRGP4 $287
JUMPV
LABELV $300
line 550
;549:			}
;550:		}
LABELV $292
line 551
;551:		dptr[ s_demos.list.numitems++ ] = &dentry[ i ];
ADDRLP4 284
ADDRGP4 s_demos+364+72
ASGNP4
ADDRLP4 280
ADDRLP4 284
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 284
INDIRP4
ADDRLP4 280
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 dptr
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 12
MULI4
ADDRGP4 dentry
ADDP4
ASGNP4
line 552
;552:		if ( s_demos.list.numitems >= UI_MAX_DEMOS )
ADDRGP4 s_demos+364+72
INDIRI4
CNSTI4 1024
LTI4 $305
line 553
;553:			break;
ADDRGP4 $288
JUMPV
LABELV $305
line 554
;554:	}
LABELV $287
line 536
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $289
ADDRLP4 0
INDIRI4
ADDRGP4 s_demos+1448
INDIRI4
LTI4 $286
LABELV $288
line 556
;555:
;556:	if ( sort && s_demos.list.numitems > 1 )
ADDRLP4 272
INDIRI4
CNSTI4 0
EQI4 $309
ADDRGP4 s_demos+364+72
INDIRI4
CNSTI4 1
LEI4 $309
line 557
;557:		UI_demosort( dptr, s_demos.list.numitems - 1, sort );
ADDRGP4 dptr
ARGP4
ADDRGP4 s_demos+364+72
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRLP4 272
INDIRI4
ARGI4
ADDRGP4 UI_demosort
CALLV
pop
LABELV $309
line 559
;558:
;559:	for ( i = 0; i < s_demos.list.numitems; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $318
JUMPV
LABELV $315
line 560
;560:		d = dptr[ i ];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 dptr
ADDP4
INDIRP4
ASGNP4
line 561
;561:		s_demos.list.itemnames[i] = show_names[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_demos+364+88
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 192
MULI4
ADDRGP4 show_names
ADDP4
ASGNP4
line 563
;562:
;563:		Q_strncpyz( show_names[i], d->file_name, sizeof( show_names[i] ) );
ADDRLP4 0
INDIRI4
CNSTI4 192
MULI4
ADDRGP4 show_names
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
INDIRP4
ARGP4
CNSTI4 192
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 564
;564:		if ( d->file_type > 0 ) {
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $323
line 565
;565:			Q_strcat( show_names[i], sizeof( show_names[0] ), "^7/" );
ADDRLP4 0
INDIRI4
CNSTI4 192
MULI4
ADDRGP4 show_names
ADDP4
ARGP4
CNSTI4 192
ARGI4
ADDRGP4 $325
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 566
;566:		}
LABELV $323
line 568
;567:
;568:		len = d->file_nlen;
ADDRLP4 4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 570
;569:		// strip extension
;570:		if ( !Q_stricmp( show_names[i] +  len - 6,".dm_68" ) ) {
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 192
MULI4
ADDRGP4 show_names
ADDP4
ADDP4
CNSTI4 -6
ADDP4
ARGP4
ADDRGP4 $298
ARGP4
ADDRLP4 280
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
NEI4 $326
line 571
;571:			memset( show_names[i] +  len - 6, ' ', 6 );
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 192
MULI4
ADDRGP4 show_names
ADDP4
ADDP4
CNSTI4 -6
ADDP4
ARGP4
CNSTI4 32
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 memset
CALLP4
pop
line 572
;572:			len -= 6;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 6
SUBI4
ASGNI4
line 573
;573:		}
LABELV $326
line 575
;574:		
;575:		diff = UI_cstrdiff ( show_names[i] );
ADDRLP4 0
INDIRI4
CNSTI4 192
MULI4
ADDRGP4 show_names
ADDP4
ARGP4
ADDRLP4 284
ADDRGP4 UI_cstrdiff
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 284
INDIRI4
ASGNI4
line 577
;576:
;577:		show_names[i][s_demos.list.width-1+diff] = '\0';
ADDRGP4 s_demos+364+92
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 12
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
CNSTI4 192
MULI4
ADDRGP4 show_names
ADDP4
ADDP4
CNSTI1 0
ASGNI1
line 581
;578:
;579:		//Q_strupr( show_names[i] );
;580:
;581:		if ( len - diff > s_demos.list.width - 1 ) {
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
ADDRGP4 s_demos+364+92
INDIRI4
CNSTI4 1
SUBI4
LEI4 $330
line 582
;582:			strcpy( &show_names[i][s_demos.list.width-1+diff], "^7>" );
ADDRGP4 s_demos+364+92
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 12
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
CNSTI4 192
MULI4
ADDRGP4 show_names
ADDP4
ADDP4
ARGP4
ADDRGP4 $336
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 583
;583:		}
LABELV $330
line 584
;584:	}
LABELV $316
line 559
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $318
ADDRLP4 0
INDIRI4
ADDRGP4 s_demos+364+72
INDIRI4
LTI4 $315
line 586
;585:
;586:	s_demos.list.curvalue = 0;
ADDRGP4 s_demos+364+68
CNSTI4 0
ASGNI4
line 587
;587:	s_demos.list.top = 0;
ADDRGP4 s_demos+364+76
CNSTI4 0
ASGNI4
line 589
;588:
;589:	if ( !s_demos.list.numitems ) {
ADDRGP4 s_demos+364+72
INDIRI4
CNSTI4 0
NEI4 $341
line 590
;590:		s_demos.list.itemnames[i] = show_names[0];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_demos+364+88
INDIRP4
ADDP4
ADDRGP4 show_names
ASGNP4
line 591
;591:		strcpy( show_names[0], "No files matching your request." );
ADDRGP4 show_names
ARGP4
ADDRGP4 $347
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 592
;592:		s_demos.list.numitems = 1;
ADDRGP4 s_demos+364+72
CNSTI4 1
ASGNI4
line 593
;593:		s_demos.list.curvalue = 1; // will remove selection
ADDRGP4 s_demos+364+68
CNSTI4 1
ASGNI4
line 594
;594:		s_demos.canPlay = qfalse;
ADDRGP4 s_demos+1452
CNSTI4 0
ASGNI4
line 596
;595:		//degenerate case, not selectable
;596:		s_demos.list.generic.flags = QMF_INACTIVE;
ADDRGP4 s_demos+364+44
CNSTU4 16384
ASGNU4
line 597
;597:		s_demos.go.generic.flags = QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_INACTIVE ;
ADDRGP4 s_demos+948+44
CNSTU4 16656
ASGNU4
line 598
;598:	} else {
ADDRGP4 $342
JUMPV
LABELV $341
line 599
;599:		s_demos.canPlay = qtrue;
ADDRGP4 s_demos+1452
CNSTI4 1
ASGNI4
line 600
;600:		s_demos.list.generic.flags = QMF_PULSEIFFOCUS;
ADDRGP4 s_demos+364+44
CNSTU4 256
ASGNU4
line 601
;601:		s_demos.go.generic.flags = QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_demos+948+44
CNSTU4 272
ASGNU4
line 602
;602:	}
LABELV $342
line 604
;603:
;604:	if ( s_demos.list.numitems > 1 ) {
ADDRGP4 s_demos+364+72
INDIRI4
CNSTI4 1
LEI4 $362
line 605
;605:		s_demos.up.generic.flags = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_MOUSEONLY;
ADDRGP4 s_demos+672+44
CNSTU4 2308
ASGNU4
line 606
;606:		s_demos.down.generic.flags = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_MOUSEONLY;
ADDRGP4 s_demos+764+44
CNSTU4 2308
ASGNU4
line 607
;607:	} else {
ADDRGP4 $363
JUMPV
LABELV $362
line 608
;608:		s_demos.up.generic.flags = QMF_INACTIVE;
ADDRGP4 s_demos+672+44
CNSTU4 16384
ASGNU4
line 609
;609:		s_demos.down.generic.flags = QMF_INACTIVE;
ADDRGP4 s_demos+764+44
CNSTU4 16384
ASGNU4
line 610
;610:	}
LABELV $363
line 611
;611:}
LABELV $278
endproc UI_DemosFillList 288 12
proc Demos_MenuInit 12 12
line 619
;612:
;613:
;614:/*
;615:===============
;616:Demos_MenuInit
;617:===============
;618:*/
;619:static void Demos_MenuInit( void ) {
line 621
;620:
;621:	memset( &s_demos, 0 ,sizeof(demos_t) );
ADDRGP4 s_demos
ARGP4
CNSTI4 0
ARGI4
CNSTI4 5808
ARGI4
ADDRGP4 memset
CALLP4
pop
line 622
;622:	s_demos.menu.key = UI_DemosMenu_Key;
ADDRGP4 s_demos+272
ADDRGP4 UI_DemosMenu_Key
ASGNP4
line 624
;623:
;624:	Demos_Cache();
ADDRGP4 Demos_Cache
CALLV
pop
line 626
;625:
;626:	s_demos.menu.fullscreen = qtrue;
ADDRGP4 s_demos+280
CNSTI4 1
ASGNI4
line 627
;627:	s_demos.menu.wrapAround = qtrue;
ADDRGP4 s_demos+276
CNSTI4 1
ASGNI4
line 629
;628:
;629:	s_demos.banner.generic.type		= MTYPE_TEXT;
ADDRGP4 s_demos+288
CNSTI4 7
ASGNI4
line 630
;630:	s_demos.banner.generic.x		= 320;
ADDRGP4 s_demos+288+12
CNSTI4 320
ASGNI4
line 631
;631:	s_demos.banner.generic.y		= 28;
ADDRGP4 s_demos+288+16
CNSTI4 28
ASGNI4
line 632
;632:	s_demos.banner.string			= dir;
ADDRGP4 s_demos+288+64
ADDRGP4 dir
ASGNP4
line 634
;633:	//s_demos.banner.color			= color_white;
;634:	s_demos.banner.color			= text_color_normal;
ADDRGP4 s_demos+288+72
ADDRGP4 text_color_normal
ASGNP4
line 635
;635:	s_demos.banner.style			= UI_CENTER;
ADDRGP4 s_demos+288+68
CNSTI4 1
ASGNI4
line 637
;636:
;637:	s_demos.arrows.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_demos+580
CNSTI4 6
ASGNI4
line 638
;638:	s_demos.arrows.generic.name		= ART_ARROWS_VERT;
ADDRGP4 s_demos+580+4
ADDRGP4 $392
ASGNP4
line 639
;639:	s_demos.arrows.generic.flags	= QMF_INACTIVE;
ADDRGP4 s_demos+580+44
CNSTU4 16384
ASGNU4
line 640
;640:	s_demos.arrows.generic.x		= ARROWS_LEFT;
ADDRGP4 s_demos+580+12
CNSTI4 576
ASGNI4
line 641
;641:	s_demos.arrows.generic.y		= ARROWS_TOP-ARROWS_HEIGHT/2;
ADDRGP4 s_demos+580+16
CNSTI4 180
ASGNI4
line 642
;642:	s_demos.arrows.width			= ARROWS_WIDTH;
ADDRGP4 s_demos+580+80
CNSTI4 48
ASGNI4
line 643
;643:	s_demos.arrows.height			= ARROWS_HEIGHT;
ADDRGP4 s_demos+580+84
CNSTI4 128
ASGNI4
line 645
;644:
;645:	s_demos.up.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_demos+672
CNSTI4 6
ASGNI4
line 646
;646:	s_demos.up.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_MOUSEONLY;
ADDRGP4 s_demos+672+44
CNSTU4 2308
ASGNU4
line 647
;647:	s_demos.up.generic.x			= ARROWS_LEFT;
ADDRGP4 s_demos+672+12
CNSTI4 576
ASGNI4
line 648
;648:	s_demos.up.generic.y			= ARROWS_TOP-ARROWS_HEIGHT/2;
ADDRGP4 s_demos+672+16
CNSTI4 180
ASGNI4
line 649
;649:	s_demos.up.generic.id			= ID_UP;
ADDRGP4 s_demos+672+8
CNSTI4 13
ASGNI4
line 650
;650:	s_demos.up.generic.callback		= Demos_MenuEvent;
ADDRGP4 s_demos+672+48
ADDRGP4 Demos_MenuEvent
ASGNP4
line 651
;651:	s_demos.up.width				= ARROWS_WIDTH;
ADDRGP4 s_demos+672+80
CNSTI4 48
ASGNI4
line 652
;652:	s_demos.up.height				= ARROWS_HEIGHT/2;
ADDRGP4 s_demos+672+84
CNSTI4 64
ASGNI4
line 653
;653:	s_demos.up.focuspic				= ART_ARROWS_UP;
ADDRGP4 s_demos+672+64
ADDRGP4 $420
ASGNP4
line 655
;654:
;655:	s_demos.down.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_demos+764
CNSTI4 6
ASGNI4
line 656
;656:	s_demos.down.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_MOUSEONLY;
ADDRGP4 s_demos+764+44
CNSTU4 2308
ASGNU4
line 657
;657:	s_demos.down.generic.x			= ARROWS_LEFT;
ADDRGP4 s_demos+764+12
CNSTI4 576
ASGNI4
line 658
;658:	s_demos.down.generic.y			= ARROWS_TOP;
ADDRGP4 s_demos+764+16
CNSTI4 244
ASGNI4
line 659
;659:	s_demos.down.generic.id			= ID_DOWN;
ADDRGP4 s_demos+764+8
CNSTI4 14
ASGNI4
line 660
;660:	s_demos.down.generic.callback	= Demos_MenuEvent;
ADDRGP4 s_demos+764+48
ADDRGP4 Demos_MenuEvent
ASGNP4
line 661
;661:	s_demos.down.width				= ARROWS_WIDTH;
ADDRGP4 s_demos+764+80
CNSTI4 48
ASGNI4
line 662
;662:	s_demos.down.height				= ARROWS_HEIGHT/2;
ADDRGP4 s_demos+764+84
CNSTI4 64
ASGNI4
line 663
;663:	s_demos.down.focuspic			= ART_ARROWS_DOWN;
ADDRGP4 s_demos+764+64
ADDRGP4 $438
ASGNP4
line 665
;664:
;665:	s_demos.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_demos+856
CNSTI4 6
ASGNI4
line 666
;666:	s_demos.back.generic.name		= ART_BACK0;
ADDRGP4 s_demos+856+4
ADDRGP4 $442
ASGNP4
line 667
;667:	s_demos.back.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_demos+856+44
CNSTU4 260
ASGNU4
line 668
;668:	s_demos.back.generic.id			= ID_BACK;
ADDRGP4 s_demos+856+8
CNSTI4 10
ASGNI4
line 669
;669:	s_demos.back.generic.callback	= Demos_MenuEvent;
ADDRGP4 s_demos+856+48
ADDRGP4 Demos_MenuEvent
ASGNP4
line 670
;670:	s_demos.back.generic.x			= 0;
ADDRGP4 s_demos+856+12
CNSTI4 0
ASGNI4
line 671
;671:	s_demos.back.generic.y			= 480-64;
ADDRGP4 s_demos+856+16
CNSTI4 416
ASGNI4
line 672
;672:	s_demos.back.width				= 128;
ADDRGP4 s_demos+856+80
CNSTI4 128
ASGNI4
line 673
;673:	s_demos.back.height				= 64;
ADDRGP4 s_demos+856+84
CNSTI4 64
ASGNI4
line 674
;674:	s_demos.back.focuspic			= ART_BACK1;
ADDRGP4 s_demos+856+64
ADDRGP4 $459
ASGNP4
line 676
;675:
;676:	s_demos.go.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_demos+948
CNSTI4 6
ASGNI4
line 677
;677:	s_demos.go.generic.name			= ART_GO0;
ADDRGP4 s_demos+948+4
ADDRGP4 $463
ASGNP4
line 678
;678:	s_demos.go.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_demos+948+44
CNSTU4 272
ASGNU4
line 679
;679:	s_demos.go.generic.id			= ID_GO;
ADDRGP4 s_demos+948+8
CNSTI4 11
ASGNI4
line 680
;680:	s_demos.go.generic.callback		= Demos_MenuEvent;
ADDRGP4 s_demos+948+48
ADDRGP4 Demos_MenuEvent
ASGNP4
line 681
;681:	s_demos.go.generic.x			= 640;
ADDRGP4 s_demos+948+12
CNSTI4 640
ASGNI4
line 682
;682:	s_demos.go.generic.y			= 480-64;
ADDRGP4 s_demos+948+16
CNSTI4 416
ASGNI4
line 683
;683:	s_demos.go.width				= 128;
ADDRGP4 s_demos+948+80
CNSTI4 128
ASGNI4
line 684
;684:	s_demos.go.height				= 64;
ADDRGP4 s_demos+948+84
CNSTI4 64
ASGNI4
line 685
;685:	s_demos.go.focuspic				= ART_GO1;
ADDRGP4 s_demos+948+64
ADDRGP4 $480
ASGNP4
line 687
;686:
;687:	s_demos.timedemo.generic.type		= MTYPE_RADIOBUTTON;
ADDRGP4 s_demos+1040
CNSTI4 5
ASGNI4
line 688
;688:	s_demos.timedemo.generic.name		= "Time Demo:";
ADDRGP4 s_demos+1040+4
ADDRGP4 $484
ASGNP4
line 689
;689:	s_demos.timedemo.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_demos+1040+44
CNSTU4 258
ASGNU4
line 690
;690:	s_demos.timedemo.generic.callback	= Demos_MenuEvent;
ADDRGP4 s_demos+1040+48
ADDRGP4 Demos_MenuEvent
ASGNP4
line 691
;691:	s_demos.timedemo.generic.id			= ID_TIMEDEMO;
ADDRGP4 s_demos+1040+8
CNSTI4 15
ASGNI4
line 692
;692:	s_demos.timedemo.generic.x			= 320+24-4;
ADDRGP4 s_demos+1040+12
CNSTI4 340
ASGNI4
line 693
;693:	s_demos.timedemo.generic.y			= 480-42;
ADDRGP4 s_demos+1040+16
CNSTI4 438
ASGNI4
line 695
;694:
;695:	if ( (int)trap_Cvar_VariableValue("timedemo" ) )
ADDRGP4 $200
ARGP4
ADDRLP4 0
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
INDIRF4
CVFI4 4
CNSTI4 0
EQI4 $495
line 696
;696:		s_demos.timedemo.curvalue = qtrue;
ADDRGP4 s_demos+1040+64
CNSTI4 1
ASGNI4
ADDRGP4 $496
JUMPV
LABELV $495
line 698
;697:	else
;698:		s_demos.timedemo.curvalue = qfalse;
ADDRGP4 s_demos+1040+64
CNSTI4 0
ASGNI4
LABELV $496
line 700
;699:
;700:	s_demos.sort.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 s_demos+472
CNSTI4 3
ASGNI4
line 701
;701:	s_demos.sort.generic.name		= "Sort:";
ADDRGP4 s_demos+472+4
ADDRGP4 $504
ASGNP4
line 702
;702:	s_demos.sort.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_demos+472+44
CNSTU4 258
ASGNU4
line 703
;703:	s_demos.sort.generic.callback	= Demos_MenuEvent;
ADDRGP4 s_demos+472+48
ADDRGP4 Demos_MenuEvent
ASGNP4
line 704
;704:	s_demos.sort.generic.id			= ID_SORT;
ADDRGP4 s_demos+472+8
CNSTI4 16
ASGNI4
line 707
;705:	//s_demos.sort.generic.x			= 332;
;706:	//s_demos.sort.generic.y			= 406;
;707:	s_demos.sort.generic.x			= 485;
ADDRGP4 s_demos+472+12
CNSTI4 485
ASGNI4
line 708
;708:	s_demos.sort.generic.y			= 72;
ADDRGP4 s_demos+472+16
CNSTI4 72
ASGNI4
line 709
;709:	s_demos.sort.itemnames			= sorttype;
ADDRGP4 s_demos+472+88
ADDRGP4 sorttype
ASGNP4
line 710
;710:	s_demos.sort.curvalue			= (int)trap_Cvar_VariableValue( "ui_demoSort" );
ADDRGP4 $204
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_demos+472+68
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 712
;711:	
;712:	if ( s_demos.sort.curvalue < 0 || s_demos.sort.curvalue > 2 )
ADDRGP4 s_demos+472+68
INDIRI4
CNSTI4 0
LTI4 $525
ADDRGP4 s_demos+472+68
INDIRI4
CNSTI4 2
LEI4 $519
LABELV $525
line 713
;713:		 s_demos.sort.curvalue = 0;
ADDRGP4 s_demos+472+68
CNSTI4 0
ASGNI4
LABELV $519
line 715
;714:
;715:	s_demos.filter.generic.type			= MTYPE_FIELD;
ADDRGP4 s_demos+1108
CNSTI4 4
ASGNI4
line 716
;716:	s_demos.filter.generic.flags		= QMF_NODEFAULTINIT;
ADDRGP4 s_demos+1108+44
CNSTU4 32768
ASGNU4
line 717
;717:	s_demos.filter.generic.ownerdraw	= Demos_DrawFilter;
ADDRGP4 s_demos+1108+56
ADDRGP4 Demos_DrawFilter
ASGNP4
line 718
;718:	s_demos.filter.generic.id			= ID_FILTER;
ADDRGP4 s_demos+1108+8
CNSTI4 17
ASGNI4
line 719
;719:	s_demos.filter.field.widthInChars	= 37;
ADDRGP4 s_demos+1108+64+8
CNSTI4 37
ASGNI4
line 720
;720:	s_demos.filter.field.maxchars		= 37;
ADDRGP4 s_demos+1108+64+268
CNSTI4 37
ASGNI4
line 721
;721:	s_demos.filter.generic.x			= 62;
ADDRGP4 s_demos+1108+12
CNSTI4 62
ASGNI4
line 722
;722:	s_demos.filter.generic.y			= 72;
ADDRGP4 s_demos+1108+16
CNSTI4 72
ASGNI4
line 723
;723:	s_demos.filter.generic.left			= 62;
ADDRGP4 s_demos+1108+20
CNSTI4 62
ASGNI4
line 725
;724:	//s_demos.filter.generic.right		= 640 - 64;
;725:	s_demos.filter.generic.right		= 430;
ADDRGP4 s_demos+1108+28
CNSTI4 430
ASGNI4
line 726
;726:	s_demos.filter.generic.top			= 66;
ADDRGP4 s_demos+1108+24
CNSTI4 66
ASGNI4
line 727
;727:	s_demos.filter.generic.bottom		= 94;
ADDRGP4 s_demos+1108+32
CNSTI4 94
ASGNI4
line 729
;728:
;729:	s_demos.list.generic.type		= MTYPE_SCROLLLIST;
ADDRGP4 s_demos+364
CNSTI4 8
ASGNI4
line 730
;730:	s_demos.list.generic.flags		= QMF_PULSEIFFOCUS;
ADDRGP4 s_demos+364+44
CNSTU4 256
ASGNU4
line 731
;731:	s_demos.list.generic.callback	= Demos_MenuEvent;
ADDRGP4 s_demos+364+48
ADDRGP4 Demos_MenuEvent
ASGNP4
line 732
;732:	s_demos.list.generic.id			= ID_LIST;
ADDRGP4 s_demos+364+8
CNSTI4 12
ASGNI4
line 733
;733:	s_demos.list.generic.x			= (640-UI_DEMO_LENGTH*SMALLCHAR_WIDTH)/2;
ADDRGP4 s_demos+364+12
CNSTI4 64
ASGNI4
line 734
;734:	s_demos.list.generic.y			= (480-UI_MAX_ITEMS*SMALLCHAR_HEIGHT)/2;
ADDRGP4 s_demos+364+16
CNSTI4 96
ASGNI4
line 735
;735:	s_demos.list.width				= UI_DEMO_LENGTH;
ADDRGP4 s_demos+364+92
CNSTI4 64
ASGNI4
line 736
;736:	s_demos.list.height				= UI_MAX_ITEMS;
ADDRGP4 s_demos+364+96
CNSTI4 18
ASGNI4
line 737
;737:	s_demos.list.columns			= 1;
ADDRGP4 s_demos+364+100
CNSTI4 1
ASGNI4
line 738
;738:	s_demos.list.scroll				= s_demos.list.height - 1;
ADDRGP4 s_demos+364+80
ADDRGP4 s_demos+364+96
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 739
;739:	s_demos.list.generic.dblclick	= UI_DemosDblclick;
ADDRGP4 s_demos+364+60
ADDRGP4 UI_DemosDblclick
ASGNP4
line 741
;740:
;741:	s_demos.list.itemnames			= (const char **)s_demos.itemname;
ADDRGP4 s_demos+364+88
ADDRGP4 s_demos+1456
ASGNP4
line 743
;742:
;743:	UI_DemosReadDir();
ADDRGP4 UI_DemosReadDir
CALLV
pop
line 745
;744:
;745:	if ( !s_demos.numDemos && dirlevel == 0 ) {
ADDRGP4 s_demos+1448
INDIRI4
CNSTI4 0
NEI4 $579
ADDRGP4 dirlevel
INDIRI4
CNSTI4 0
NEI4 $579
line 746
;746:		strcpy( buffer, "No Demos Found." );
ADDRGP4 buffer
ARGP4
ADDRGP4 $582
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 747
;747:		s_demos.list.numitems = 1;
ADDRGP4 s_demos+364+72
CNSTI4 1
ASGNI4
line 750
;748:
;749:		//degenerate case, not selectable
;750:		s_demos.go.generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 8
ADDRGP4 s_demos+948+44
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 751
;751:		s_demos.up.generic.flags = QMF_INACTIVE;
ADDRGP4 s_demos+672+44
CNSTU4 16384
ASGNU4
line 752
;752:		s_demos.down.generic.flags = QMF_INACTIVE;
ADDRGP4 s_demos+764+44
CNSTU4 16384
ASGNU4
line 753
;753:	} else {
ADDRGP4 $580
JUMPV
LABELV $579
line 754
;754:		UI_DemosFillList();
ADDRGP4 UI_DemosFillList
CALLV
pop
line 755
;755:	}
LABELV $580
line 757
;756:
;757:	Menu_AddItem( &s_demos.menu, &s_demos.banner );
ADDRGP4 s_demos
ARGP4
ADDRGP4 s_demos+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 758
;758:	Menu_AddItem( &s_demos.menu, &s_demos.list );
ADDRGP4 s_demos
ARGP4
ADDRGP4 s_demos+364
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 759
;759:	Menu_AddItem( &s_demos.menu, &s_demos.arrows );
ADDRGP4 s_demos
ARGP4
ADDRGP4 s_demos+580
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 760
;760:	Menu_AddItem( &s_demos.menu, &s_demos.up );
ADDRGP4 s_demos
ARGP4
ADDRGP4 s_demos+672
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 761
;761:	Menu_AddItem( &s_demos.menu, &s_demos.down );
ADDRGP4 s_demos
ARGP4
ADDRGP4 s_demos+764
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 762
;762:	Menu_AddItem( &s_demos.menu, &s_demos.back );
ADDRGP4 s_demos
ARGP4
ADDRGP4 s_demos+856
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 763
;763:	Menu_AddItem( &s_demos.menu, &s_demos.go );
ADDRGP4 s_demos
ARGP4
ADDRGP4 s_demos+948
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 764
;764:	Menu_AddItem( &s_demos.menu, &s_demos.timedemo );
ADDRGP4 s_demos
ARGP4
ADDRGP4 s_demos+1040
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 765
;765:	Menu_AddItem( &s_demos.menu, &s_demos.sort );
ADDRGP4 s_demos
ARGP4
ADDRGP4 s_demos+472
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 766
;766:	Menu_AddItem( &s_demos.menu, &s_demos.filter );
ADDRGP4 s_demos
ARGP4
ADDRGP4 s_demos+1108
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 767
;767:}
LABELV $374
endproc Demos_MenuInit 12 12
export Demos_Cache
proc Demos_Cache 0 4
line 774
;768:
;769:/*
;770:=================
;771:Demos_Cache
;772:=================
;773:*/
;774:void Demos_Cache( void ) {
line 775
;775:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $442
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 776
;776:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $459
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 777
;777:	trap_R_RegisterShaderNoMip( ART_GO0 );
ADDRGP4 $463
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 778
;778:	trap_R_RegisterShaderNoMip( ART_GO1 );
ADDRGP4 $480
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 779
;779:	trap_R_RegisterShaderNoMip( ART_ARROWS_VERT );
ADDRGP4 $392
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 780
;780:	trap_R_RegisterShaderNoMip( ART_ARROWS_UP );
ADDRGP4 $420
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 781
;781:	trap_R_RegisterShaderNoMip( ART_ARROWS_DOWN );
ADDRGP4 $438
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 782
;782:}
LABELV $601
endproc Demos_Cache 0 4
export UI_DemosMenu
proc UI_DemosMenu 0 4
line 789
;783:
;784:/*
;785:===============
;786:UI_DemosMenu
;787:===============
;788:*/
;789:void UI_DemosMenu( void ) {
line 790
;790:	Demos_MenuInit();
ADDRGP4 Demos_MenuInit
CALLV
pop
line 791
;791:	UI_PushMenu( &s_demos.menu );
ADDRGP4 s_demos
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 792
;792:}
LABELV $602
endproc UI_DemosMenu 0 4
bss
align 1
LABELV show_names
skip 196608
align 1
LABELV buffer
skip 65536
align 4
LABELV listpos
skip 512
align 4
LABELV num_files
skip 4
align 4
LABELV dptr
skip 4096
align 4
LABELV dentry
skip 12288
align 4
LABELV s_demos
skip 5808
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
LABELV $582
byte 1 78
byte 1 111
byte 1 32
byte 1 68
byte 1 101
byte 1 109
byte 1 111
byte 1 115
byte 1 32
byte 1 70
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 0
align 1
LABELV $504
byte 1 83
byte 1 111
byte 1 114
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $484
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 68
byte 1 101
byte 1 109
byte 1 111
byte 1 58
byte 1 0
align 1
LABELV $480
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $463
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $459
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
LABELV $442
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
LABELV $438
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 95
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $420
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 95
byte 1 116
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $392
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $347
byte 1 78
byte 1 111
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 115
byte 1 32
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 113
byte 1 117
byte 1 101
byte 1 115
byte 1 116
byte 1 46
byte 1 0
align 1
LABELV $336
byte 1 94
byte 1 55
byte 1 62
byte 1 0
align 1
LABELV $325
byte 1 94
byte 1 55
byte 1 47
byte 1 0
align 1
LABELV $298
byte 1 46
byte 1 100
byte 1 109
byte 1 95
byte 1 54
byte 1 56
byte 1 0
align 1
LABELV $205
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $204
byte 1 117
byte 1 105
byte 1 95
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 83
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $202
byte 1 48
byte 1 0
align 1
LABELV $201
byte 1 49
byte 1 0
align 1
LABELV $200
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $182
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $181
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $137
byte 1 112
byte 1 114
byte 1 111
byte 1 116
byte 1 111
byte 1 99
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $136
byte 1 100
byte 1 109
byte 1 95
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $133
byte 1 100
byte 1 109
byte 1 95
byte 1 63
byte 1 63
byte 1 0
align 1
LABELV $121
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $112
byte 1 47
byte 1 0
align 1
LABELV $80
byte 1 70
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 58
byte 1 0
align 1
LABELV $73
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 44
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 99
byte 1 0
align 1
LABELV $72
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 44
byte 1 32
byte 1 97
byte 1 115
byte 1 99
byte 1 0
align 1
LABELV $71
byte 1 78
byte 1 111
byte 1 0
