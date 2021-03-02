data
align 4
LABELV driverinfo_artlist
address $69
address $70
address $71
address $72
byte 4 0
code
proc DriverInfo_Event 4 0
file "..\..\..\..\code\q3_ui\ui_video.c"
line 52
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "ui_local.h"
;4:
;5:void GraphicsOptions_MenuInit( void );
;6:
;7:/*
;8:=======================================================================
;9:
;10:DRIVER INFORMATION MENU
;11:
;12:=======================================================================
;13:*/
;14:
;15:
;16:#define DRIVERINFO_FRAMEL	"menu/art/frame2_l"
;17:#define DRIVERINFO_FRAMER	"menu/art/frame1_r"
;18:#define DRIVERINFO_BACK0	"menu/art/back_0"
;19:#define DRIVERINFO_BACK1	"menu/art/back_1"
;20:
;21:static char* driverinfo_artlist[] = 
;22:{
;23:	DRIVERINFO_FRAMEL,
;24:	DRIVERINFO_FRAMER,
;25:	DRIVERINFO_BACK0,
;26:	DRIVERINFO_BACK1,
;27:	NULL,
;28:};
;29:
;30:#define ID_DRIVERINFOBACK	100
;31:
;32:typedef struct
;33:{
;34:	menuframework_s	menu;
;35:	menutext_s		banner;
;36:	menubitmap_s	back;
;37:	menubitmap_s	framel;
;38:	menubitmap_s	framer;
;39:	char			stringbuff[1024];
;40:	char*			strings[64];
;41:	int				numstrings;
;42:} driverinfo_t;
;43:
;44:static driverinfo_t	s_driverinfo;
;45:
;46:/*
;47:=================
;48:DriverInfo_Event
;49:=================
;50:*/
;51:static void DriverInfo_Event( void* ptr, int event )
;52:{
line 53
;53:	if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $75
line 54
;54:		return;
ADDRGP4 $74
JUMPV
LABELV $75
line 56
;55:
;56:	switch (((menucommon_s*)ptr)->id)
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 100
EQI4 $80
ADDRGP4 $77
JUMPV
line 57
;57:	{
LABELV $80
line 59
;58:		case ID_DRIVERINFOBACK:
;59:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 60
;60:			break;
LABELV $77
LABELV $78
line 62
;61:	}
;62:}
LABELV $74
endproc DriverInfo_Event 4 0
proc DriverInfo_MenuDraw 12 20
line 70
;63:
;64:/*
;65:=================
;66:DriverInfo_MenuDraw
;67:=================
;68:*/
;69:static void DriverInfo_MenuDraw( void )
;70:{
line 74
;71:	int	i;
;72:	int	y;
;73:
;74:	Menu_Draw( &s_driverinfo.menu );
ADDRGP4 s_driverinfo
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 76
;75:
;76:	UI_DrawString( 320, 80, "VENDOR", UI_CENTER|UI_SMALLFONT, color_red );
CNSTI4 320
ARGI4
CNSTI4 80
ARGI4
ADDRGP4 $82
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 77
;77:	UI_DrawString( 320, 152, "PIXELFORMAT", UI_CENTER|UI_SMALLFONT, color_red );
CNSTI4 320
ARGI4
CNSTI4 152
ARGI4
ADDRGP4 $83
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 78
;78:	UI_DrawString( 320, 192, "EXTENSIONS", UI_CENTER|UI_SMALLFONT, color_red );
CNSTI4 320
ARGI4
CNSTI4 192
ARGI4
ADDRGP4 $84
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 80
;79:
;80:	UI_DrawString( 320, 80+16, uis.glconfig.vendor_string, UI_CENTER|UI_SMALLFONT, text_color_normal );
CNSTI4 320
ARGI4
CNSTI4 96
ARGI4
ADDRGP4 uis+56+1024
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 81
;81:	UI_DrawString( 320, 96+16, uis.glconfig.version_string, UI_CENTER|UI_SMALLFONT, text_color_normal );
CNSTI4 320
ARGI4
CNSTI4 112
ARGI4
ADDRGP4 uis+56+2048
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 82
;82:	UI_DrawString( 320, 112+16, uis.glconfig.renderer_string, UI_CENTER|UI_SMALLFONT, text_color_normal );
CNSTI4 320
ARGI4
CNSTI4 128
ARGI4
ADDRGP4 uis+56
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 83
;83:	UI_DrawString( 320, 152+16, va ("color(%d-bits) Z(%d-bits) stencil(%d-bits)", uis.glconfig.colorBits, uis.glconfig.depthBits, uis.glconfig.stencilBits), UI_CENTER|UI_SMALLFONT, text_color_normal );
ADDRGP4 $90
ARGP4
ADDRGP4 uis+56+11272
INDIRI4
ARGI4
ADDRGP4 uis+56+11276
INDIRI4
ARGI4
ADDRGP4 uis+56+11280
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
CNSTI4 168
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 86
;84:
;85:	// double column
;86:	y = 192+16;
ADDRLP4 4
CNSTI4 208
ASGNI4
line 87
;87:	for (i=0; i<s_driverinfo.numstrings/2; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $100
JUMPV
LABELV $97
line 88
;88:		UI_DrawString( 320-4, y, s_driverinfo.strings[i*2], UI_RIGHT|UI_SMALLFONT, text_color_normal );
CNSTI4 316
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 2
LSHI4
ADDRGP4 s_driverinfo+1664
ADDP4
INDIRP4
ARGP4
CNSTI4 18
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 89
;89:		UI_DrawString( 320+4, y, s_driverinfo.strings[i*2+1], UI_LEFT|UI_SMALLFONT, text_color_normal );
CNSTI4 324
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 2
LSHI4
ADDRGP4 s_driverinfo+1664+4
ADDP4
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 90
;90:		y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 91
;91:	}
LABELV $98
line 87
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $100
ADDRLP4 0
INDIRI4
ADDRGP4 s_driverinfo+1920
INDIRI4
CNSTI4 2
DIVI4
LTI4 $97
line 93
;92:
;93:	if (s_driverinfo.numstrings & 1)
ADDRGP4 s_driverinfo+1920
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $105
line 94
;94:		UI_DrawString( 320, y, s_driverinfo.strings[s_driverinfo.numstrings-1], UI_CENTER|UI_SMALLFONT, text_color_normal );
CNSTI4 320
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 s_driverinfo+1920
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_driverinfo+1664-4
ADDP4
INDIRP4
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
LABELV $105
line 95
;95:}
LABELV $81
endproc DriverInfo_MenuDraw 12 20
export DriverInfo_Cache
proc DriverInfo_Cache 4 4
line 103
;96:
;97:/*
;98:=================
;99:DriverInfo_Cache
;100:=================
;101:*/
;102:void DriverInfo_Cache( void )
;103:{
line 107
;104:	int	i;
;105:
;106:	// touch all our pics
;107:	for (i=0; ;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $112
line 108
;108:	{
line 109
;109:		if (!driverinfo_artlist[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 driverinfo_artlist
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $116
line 110
;110:			break;
ADDRGP4 $114
JUMPV
LABELV $116
line 111
;111:		trap_R_RegisterShaderNoMip(driverinfo_artlist[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 driverinfo_artlist
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 112
;112:	}
LABELV $113
line 107
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $112
JUMPV
LABELV $114
line 113
;113:}
LABELV $111
endproc DriverInfo_Cache 4 4
proc UI_DriverInfo_Menu 32 12
line 121
;114:
;115:/*
;116:=================
;117:UI_DriverInfo_Menu
;118:=================
;119:*/
;120:static void UI_DriverInfo_Menu( void )
;121:{
line 127
;122:	char*	eptr;
;123:	int		i;
;124:	int		len;
;125:
;126:	// zero set all our globals
;127:	memset( &s_driverinfo, 0 ,sizeof(driverinfo_t) );
ADDRGP4 s_driverinfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1924
ARGI4
ADDRGP4 memset
CALLP4
pop
line 129
;128:
;129:	DriverInfo_Cache();
ADDRGP4 DriverInfo_Cache
CALLV
pop
line 131
;130:
;131:	s_driverinfo.menu.fullscreen = qtrue;
ADDRGP4 s_driverinfo+280
CNSTI4 1
ASGNI4
line 132
;132:	s_driverinfo.menu.draw       = DriverInfo_MenuDraw;
ADDRGP4 s_driverinfo+268
ADDRGP4 DriverInfo_MenuDraw
ASGNP4
line 134
;133:
;134:	s_driverinfo.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 s_driverinfo+288
CNSTI4 10
ASGNI4
line 135
;135:	s_driverinfo.banner.generic.x	  = 320;
ADDRGP4 s_driverinfo+288+12
CNSTI4 320
ASGNI4
line 136
;136:	s_driverinfo.banner.generic.y	  = 16;
ADDRGP4 s_driverinfo+288+16
CNSTI4 16
ASGNI4
line 137
;137:	s_driverinfo.banner.string		  = "DRIVER INFO";
ADDRGP4 s_driverinfo+288+64
ADDRGP4 $128
ASGNP4
line 138
;138:	s_driverinfo.banner.color	      = color_white;
ADDRGP4 s_driverinfo+288+72
ADDRGP4 color_white
ASGNP4
line 139
;139:	s_driverinfo.banner.style	      = UI_CENTER;
ADDRGP4 s_driverinfo+288+68
CNSTI4 1
ASGNI4
line 141
;140:
;141:	s_driverinfo.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_driverinfo+456
CNSTI4 6
ASGNI4
line 142
;142:	s_driverinfo.framel.generic.name  = DRIVERINFO_FRAMEL;
ADDRGP4 s_driverinfo+456+4
ADDRGP4 $69
ASGNP4
line 143
;143:	s_driverinfo.framel.generic.flags = QMF_INACTIVE;
ADDRGP4 s_driverinfo+456+44
CNSTU4 16384
ASGNU4
line 144
;144:	s_driverinfo.framel.generic.x	  = 0;
ADDRGP4 s_driverinfo+456+12
CNSTI4 0
ASGNI4
line 145
;145:	s_driverinfo.framel.generic.y	  = 78;
ADDRGP4 s_driverinfo+456+16
CNSTI4 78
ASGNI4
line 146
;146:	s_driverinfo.framel.width  	      = 256;
ADDRGP4 s_driverinfo+456+80
CNSTI4 256
ASGNI4
line 147
;147:	s_driverinfo.framel.height  	  = 329;
ADDRGP4 s_driverinfo+456+84
CNSTI4 329
ASGNI4
line 149
;148:
;149:	s_driverinfo.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_driverinfo+548
CNSTI4 6
ASGNI4
line 150
;150:	s_driverinfo.framer.generic.name  = DRIVERINFO_FRAMER;
ADDRGP4 s_driverinfo+548+4
ADDRGP4 $70
ASGNP4
line 151
;151:	s_driverinfo.framer.generic.flags = QMF_INACTIVE;
ADDRGP4 s_driverinfo+548+44
CNSTU4 16384
ASGNU4
line 152
;152:	s_driverinfo.framer.generic.x	  = 376;
ADDRGP4 s_driverinfo+548+12
CNSTI4 376
ASGNI4
line 153
;153:	s_driverinfo.framer.generic.y	  = 76;
ADDRGP4 s_driverinfo+548+16
CNSTI4 76
ASGNI4
line 154
;154:	s_driverinfo.framer.width  	      = 256;
ADDRGP4 s_driverinfo+548+80
CNSTI4 256
ASGNI4
line 155
;155:	s_driverinfo.framer.height  	  = 334;
ADDRGP4 s_driverinfo+548+84
CNSTI4 334
ASGNI4
line 157
;156:
;157:	s_driverinfo.back.generic.type	   = MTYPE_BITMAP;
ADDRGP4 s_driverinfo+364
CNSTI4 6
ASGNI4
line 158
;158:	s_driverinfo.back.generic.name     = DRIVERINFO_BACK0;
ADDRGP4 s_driverinfo+364+4
ADDRGP4 $71
ASGNP4
line 159
;159:	s_driverinfo.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_driverinfo+364+44
CNSTU4 260
ASGNU4
line 160
;160:	s_driverinfo.back.generic.callback = DriverInfo_Event;
ADDRGP4 s_driverinfo+364+48
ADDRGP4 DriverInfo_Event
ASGNP4
line 161
;161:	s_driverinfo.back.generic.id	   = ID_DRIVERINFOBACK;
ADDRGP4 s_driverinfo+364+8
CNSTI4 100
ASGNI4
line 162
;162:	s_driverinfo.back.generic.x		   = 0;
ADDRGP4 s_driverinfo+364+12
CNSTI4 0
ASGNI4
line 163
;163:	s_driverinfo.back.generic.y		   = 480-64;
ADDRGP4 s_driverinfo+364+16
CNSTI4 416
ASGNI4
line 164
;164:	s_driverinfo.back.width  		   = 128;
ADDRGP4 s_driverinfo+364+80
CNSTI4 128
ASGNI4
line 165
;165:	s_driverinfo.back.height  		   = 64;
ADDRGP4 s_driverinfo+364+84
CNSTI4 64
ASGNI4
line 166
;166:	s_driverinfo.back.focuspic         = DRIVERINFO_BACK1;
ADDRGP4 s_driverinfo+364+64
ADDRGP4 $72
ASGNP4
line 172
;167:
;168:  // TTimo: overflow with particularly long GL extensions (such as the gf3)
;169:  // https://zerowing.idsoftware.com/bugzilla/show_bug.cgi?id=399
;170:  // NOTE: could have pushed the size of stringbuff, but the list is already out of the screen
;171:  // (no matter what your resolution)
;172:  Q_strncpyz(s_driverinfo.stringbuff, uis.glconfig.extensions_string, 1024);
ADDRGP4 s_driverinfo+640
ARGP4
ADDRGP4 uis+56+3072
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 175
;173:
;174:	// build null terminated extension strings
;175:	eptr = s_driverinfo.stringbuff;
ADDRLP4 0
ADDRGP4 s_driverinfo+640
ASGNP4
ADDRGP4 $183
JUMPV
line 177
;176:	while ( s_driverinfo.numstrings<40 && *eptr )
;177:	{
LABELV $186
line 179
;178:		while ( *eptr == ' ' )
;179:			*eptr++ = '\0';
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
ADDRLP4 12
INDIRP4
CNSTI1 0
ASGNI1
LABELV $187
line 178
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $186
line 182
;180:
;181:		// track start of valid string
;182:		if (*eptr && *eptr != ' ')
ADDRLP4 16
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $194
ADDRLP4 16
INDIRI4
CNSTI4 32
EQI4 $194
line 183
;183:			s_driverinfo.strings[s_driverinfo.numstrings++] = eptr;
ADDRLP4 24
ADDRGP4 s_driverinfo+1920
ASGNP4
ADDRLP4 20
ADDRLP4 24
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRP4
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_driverinfo+1664
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $194
JUMPV
LABELV $193
line 186
;184:
;185:		while ( *eptr && *eptr != ' ' )
;186:			eptr++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $194
line 185
ADDRLP4 28
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $196
ADDRLP4 28
INDIRI4
CNSTI4 32
NEI4 $193
LABELV $196
line 187
;187:	}
LABELV $183
line 176
ADDRGP4 s_driverinfo+1920
INDIRI4
CNSTI4 40
GEI4 $197
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $187
LABELV $197
line 190
;188:
;189:	// safety length strings for display
;190:	for (i=0; i<s_driverinfo.numstrings; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $201
JUMPV
LABELV $198
line 191
;191:		len = strlen(s_driverinfo.strings[i]);
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_driverinfo+1664
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 192
;192:		if (len > 32) {
ADDRLP4 8
INDIRI4
CNSTI4 32
LEI4 $204
line 193
;193:			s_driverinfo.strings[i][len-1] = '>';
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_driverinfo+1664
ADDP4
INDIRP4
ADDP4
CNSTI1 62
ASGNI1
line 194
;194:			s_driverinfo.strings[i][len]   = '\0';
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_driverinfo+1664
ADDP4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 195
;195:		}
LABELV $204
line 196
;196:	}
LABELV $199
line 190
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $201
ADDRLP4 4
INDIRI4
ADDRGP4 s_driverinfo+1920
INDIRI4
LTI4 $198
line 198
;197:
;198:	Menu_AddItem( &s_driverinfo.menu, &s_driverinfo.banner );
ADDRGP4 s_driverinfo
ARGP4
ADDRGP4 s_driverinfo+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 199
;199:	Menu_AddItem( &s_driverinfo.menu, &s_driverinfo.framel );
ADDRGP4 s_driverinfo
ARGP4
ADDRGP4 s_driverinfo+456
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 200
;200:	Menu_AddItem( &s_driverinfo.menu, &s_driverinfo.framer );
ADDRGP4 s_driverinfo
ARGP4
ADDRGP4 s_driverinfo+548
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 201
;201:	Menu_AddItem( &s_driverinfo.menu, &s_driverinfo.back );
ADDRGP4 s_driverinfo
ARGP4
ADDRGP4 s_driverinfo+364
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 203
;202:
;203:	UI_PushMenu( &s_driverinfo.menu );
ADDRGP4 s_driverinfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 204
;204:}
LABELV $118
endproc UI_DriverInfo_Menu 32 12
data
align 4
LABELV s_ivo_templates
byte 4 4
byte 4 1
byte 4 2
byte 4 0
byte 4 2
byte 4 2
byte 4 1
byte 4 1
byte 4 1
byte 4 3
byte 4 1
byte 4 2
byte 4 0
byte 4 0
byte 4 0
byte 4 1
byte 4 0
byte 4 1
byte 4 2
byte 4 1
byte 4 1
byte 4 0
byte 4 1
byte 4 0
byte 4 0
byte 4 0
byte 4 1
byte 4 2
byte 4 1
byte 4 1
byte 4 1
byte 4 1
byte 4 0
byte 4 0
byte 4 0
byte 4 1
byte 4 3
byte 4 1
byte 4 1
byte 4 0
byte 4 0
byte 4 0
byte 4 1
byte 4 0
byte 4 1
code
proc GraphicsOptions_GetInitialVideo 0 0
line 302
;205:
;206:/*
;207:=======================================================================
;208:
;209:GRAPHICS OPTIONS MENU
;210:
;211:=======================================================================
;212:*/
;213:
;214:#define GRAPHICSOPTIONS_FRAMEL	"menu/art/frame2_l"
;215:#define GRAPHICSOPTIONS_FRAMER	"menu/art/frame1_r"
;216:#define GRAPHICSOPTIONS_BACK0	"menu/art/back_0"
;217:#define GRAPHICSOPTIONS_BACK1	"menu/art/back_1"
;218:#define GRAPHICSOPTIONS_ACCEPT0	"menu/art/accept_0"
;219:#define GRAPHICSOPTIONS_ACCEPT1	"menu/art/accept_1"
;220:
;221:#define ID_BACK2		101
;222:#define ID_FULLSCREEN	102
;223:#define ID_LIST			103
;224:#define ID_MODE			104
;225:#define ID_DRIVERINFO	105
;226:#define ID_GRAPHICS		106
;227:#define ID_DISPLAY		107
;228:#define ID_SOUND		108
;229:#define ID_NETWORK		109
;230:
;231:typedef struct {
;232:	menuframework_s	menu;
;233:
;234:	menutext_s		banner;
;235:	menubitmap_s	framel;
;236:	menubitmap_s	framer;
;237:
;238:	menutext_s		graphics;
;239:	menutext_s		display;
;240:	menutext_s		sound;
;241:	menutext_s		network;
;242:
;243:	menulist_s		list;
;244:	menulist_s		mode;
;245:	menuslider_s	tq;
;246:	menulist_s  	fs;
;247:	menulist_s  	lighting;
;248:	menulist_s  	allow_extensions;
;249:	menulist_s  	texturebits;
;250:	menulist_s  	colordepth;
;251:	menulist_s  	geometry;
;252:	menulist_s  	filter;
;253:	menutext_s		driverinfo;
;254:
;255:	menubitmap_s	apply;
;256:	menubitmap_s	back;
;257:} graphicsoptions_t;
;258:
;259:typedef struct
;260:{
;261:	int mode;
;262:	qboolean fullscreen;
;263:	int tq;
;264:	int lighting;
;265:	int colordepth;
;266:	int texturebits;
;267:	int geometry;
;268:	int filter;
;269:	qboolean extensions;
;270:} InitialVideoOptions_s;
;271:
;272:static InitialVideoOptions_s	s_ivo;
;273:static graphicsoptions_t		s_graphicsoptions;	
;274:
;275:static InitialVideoOptions_s s_ivo_templates[] =
;276:{
;277:	{
;278:		4, qtrue, 2, 0, 2, 2, 1, 1, qtrue	// JDC: this was tq 3
;279:	},
;280:	{
;281:		3, qtrue, 2, 0, 0, 0, 1, 0, qtrue
;282:	},
;283:	{
;284:		2, qtrue, 1, 0, 1, 0, 0, 0, qtrue
;285:	},
;286:	{
;287:		2, qtrue, 1, 1, 1, 0, 0, 0, qtrue
;288:	},
;289:	{
;290:		3, qtrue, 1, 0, 0, 0, 1, 0, qtrue
;291:	}
;292:};
;293:
;294:#define NUM_IVO_TEMPLATES ( ARRAY_LEN( s_ivo_templates ) )
;295:
;296:/*
;297:=================
;298:GraphicsOptions_GetInitialVideo
;299:=================
;300:*/
;301:static void GraphicsOptions_GetInitialVideo( void )
;302:{
line 303
;303:	s_ivo.colordepth  = s_graphicsoptions.colordepth.curvalue;
ADDRGP4 s_ivo+16
ADDRGP4 s_graphicsoptions+1580+68
INDIRI4
ASGNI4
line 304
;304:	s_ivo.mode        = s_graphicsoptions.mode.curvalue;
ADDRGP4 s_ivo
ADDRGP4 s_graphicsoptions+960+68
INDIRI4
ASGNI4
line 305
;305:	s_ivo.fullscreen  = s_graphicsoptions.fs.curvalue;
ADDRGP4 s_ivo+4
ADDRGP4 s_graphicsoptions+1148+68
INDIRI4
ASGNI4
line 306
;306:	s_ivo.extensions  = s_graphicsoptions.allow_extensions.curvalue;
ADDRGP4 s_ivo+32
ADDRGP4 s_graphicsoptions+1364+68
INDIRI4
ASGNI4
line 307
;307:	s_ivo.tq          = s_graphicsoptions.tq.curvalue;
ADDRGP4 s_ivo+8
ADDRGP4 s_graphicsoptions+1068+72
INDIRF4
CVFI4 4
ASGNI4
line 308
;308:	s_ivo.lighting    = s_graphicsoptions.lighting.curvalue;
ADDRGP4 s_ivo+12
ADDRGP4 s_graphicsoptions+1256+68
INDIRI4
ASGNI4
line 309
;309:	s_ivo.geometry    = s_graphicsoptions.geometry.curvalue;
ADDRGP4 s_ivo+24
ADDRGP4 s_graphicsoptions+1688+68
INDIRI4
ASGNI4
line 310
;310:	s_ivo.filter      = s_graphicsoptions.filter.curvalue;
ADDRGP4 s_ivo+28
ADDRGP4 s_graphicsoptions+1796+68
INDIRI4
ASGNI4
line 311
;311:	s_ivo.texturebits = s_graphicsoptions.texturebits.curvalue;
ADDRGP4 s_ivo+20
ADDRGP4 s_graphicsoptions+1472+68
INDIRI4
ASGNI4
line 312
;312:}
LABELV $214
endproc GraphicsOptions_GetInitialVideo 0 0
proc GraphicsOptions_CheckConfig 4 0
line 320
;313:
;314:/*
;315:=================
;316:GraphicsOptions_CheckConfig
;317:=================
;318:*/
;319:static void GraphicsOptions_CheckConfig( void )
;320:{
line 323
;321:	int i;
;322:
;323:	for ( i = 0; i < NUM_IVO_TEMPLATES; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $245
JUMPV
LABELV $242
line 324
;324:	{
line 325
;325:		if ( s_ivo_templates[i].colordepth != s_graphicsoptions.colordepth.curvalue )
ADDRLP4 0
INDIRI4
CNSTI4 36
MULI4
ADDRGP4 s_ivo_templates+16
ADDP4
INDIRI4
ADDRGP4 s_graphicsoptions+1580+68
INDIRI4
EQI4 $246
line 326
;326:			continue;
ADDRGP4 $243
JUMPV
LABELV $246
line 327
;327:		if ( s_ivo_templates[i].mode != s_graphicsoptions.mode.curvalue )
ADDRLP4 0
INDIRI4
CNSTI4 36
MULI4
ADDRGP4 s_ivo_templates
ADDP4
INDIRI4
ADDRGP4 s_graphicsoptions+960+68
INDIRI4
EQI4 $251
line 328
;328:			continue;
ADDRGP4 $243
JUMPV
LABELV $251
line 329
;329:		if ( s_ivo_templates[i].fullscreen != s_graphicsoptions.fs.curvalue )
ADDRLP4 0
INDIRI4
CNSTI4 36
MULI4
ADDRGP4 s_ivo_templates+4
ADDP4
INDIRI4
ADDRGP4 s_graphicsoptions+1148+68
INDIRI4
EQI4 $255
line 330
;330:			continue;
ADDRGP4 $243
JUMPV
LABELV $255
line 331
;331:		if ( s_ivo_templates[i].tq != s_graphicsoptions.tq.curvalue )
ADDRLP4 0
INDIRI4
CNSTI4 36
MULI4
ADDRGP4 s_ivo_templates+8
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 s_graphicsoptions+1068+72
INDIRF4
EQF4 $260
line 332
;332:			continue;
ADDRGP4 $243
JUMPV
LABELV $260
line 333
;333:		if ( s_ivo_templates[i].lighting != s_graphicsoptions.lighting.curvalue )
ADDRLP4 0
INDIRI4
CNSTI4 36
MULI4
ADDRGP4 s_ivo_templates+12
ADDP4
INDIRI4
ADDRGP4 s_graphicsoptions+1256+68
INDIRI4
EQI4 $265
line 334
;334:			continue;
ADDRGP4 $243
JUMPV
LABELV $265
line 335
;335:		if ( s_ivo_templates[i].geometry != s_graphicsoptions.geometry.curvalue )
ADDRLP4 0
INDIRI4
CNSTI4 36
MULI4
ADDRGP4 s_ivo_templates+24
ADDP4
INDIRI4
ADDRGP4 s_graphicsoptions+1688+68
INDIRI4
EQI4 $270
line 336
;336:			continue;
ADDRGP4 $243
JUMPV
LABELV $270
line 337
;337:		if ( s_ivo_templates[i].filter != s_graphicsoptions.filter.curvalue )
ADDRLP4 0
INDIRI4
CNSTI4 36
MULI4
ADDRGP4 s_ivo_templates+28
ADDP4
INDIRI4
ADDRGP4 s_graphicsoptions+1796+68
INDIRI4
EQI4 $275
line 338
;338:			continue;
ADDRGP4 $243
JUMPV
LABELV $275
line 341
;339://		if ( s_ivo_templates[i].texturebits != s_graphicsoptions.texturebits.curvalue )
;340://			continue;
;341:		s_graphicsoptions.list.curvalue = i;
ADDRGP4 s_graphicsoptions+852+68
ADDRLP4 0
INDIRI4
ASGNI4
line 342
;342:		return;
ADDRGP4 $241
JUMPV
LABELV $243
line 323
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $245
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 5
LTU4 $242
line 344
;343:	}
;344:	s_graphicsoptions.list.curvalue = 4;
ADDRGP4 s_graphicsoptions+852+68
CNSTI4 4
ASGNI4
line 345
;345:}
LABELV $241
endproc GraphicsOptions_CheckConfig 4 0
proc GraphicsOptions_UpdateMenuItems 8 0
line 353
;346:
;347:/*
;348:=================
;349:GraphicsOptions_UpdateMenuItems
;350:=================
;351:*/
;352:static void GraphicsOptions_UpdateMenuItems( void )
;353:{
line 354
;354:	if ( s_graphicsoptions.fs.curvalue == 0 )
ADDRGP4 s_graphicsoptions+1148+68
INDIRI4
CNSTI4 0
NEI4 $285
line 355
;355:	{
line 356
;356:		s_graphicsoptions.colordepth.curvalue = 0;
ADDRGP4 s_graphicsoptions+1580+68
CNSTI4 0
ASGNI4
line 357
;357:		s_graphicsoptions.colordepth.generic.flags |= QMF_GRAYED;
ADDRLP4 0
ADDRGP4 s_graphicsoptions+1580+44
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 358
;358:	}
ADDRGP4 $286
JUMPV
LABELV $285
line 360
;359:	else
;360:	{
line 361
;361:		s_graphicsoptions.colordepth.generic.flags &= ~QMF_GRAYED;
ADDRLP4 0
ADDRGP4 s_graphicsoptions+1580+44
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 362
;362:	}
LABELV $286
line 364
;363:
;364:	if ( s_graphicsoptions.allow_extensions.curvalue == 0 )
ADDRGP4 s_graphicsoptions+1364+68
INDIRI4
CNSTI4 0
NEI4 $295
line 365
;365:	{
line 366
;366:		if ( s_graphicsoptions.texturebits.curvalue == 0 )
ADDRGP4 s_graphicsoptions+1472+68
INDIRI4
CNSTI4 0
NEI4 $299
line 367
;367:		{
line 368
;368:			s_graphicsoptions.texturebits.curvalue = 1;
ADDRGP4 s_graphicsoptions+1472+68
CNSTI4 1
ASGNI4
line 369
;369:		}
LABELV $299
line 370
;370:	}
LABELV $295
line 372
;371:
;372:	s_graphicsoptions.apply.generic.flags |= QMF_HIDDEN|QMF_INACTIVE;
ADDRLP4 0
ADDRGP4 s_graphicsoptions+1980+44
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 374
;373:
;374:	if ( s_ivo.mode != s_graphicsoptions.mode.curvalue )
ADDRGP4 s_ivo
INDIRI4
ADDRGP4 s_graphicsoptions+960+68
INDIRI4
EQI4 $307
line 375
;375:	{
line 376
;376:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+1980+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 377
;377:	}
LABELV $307
line 378
;378:	if ( s_ivo.fullscreen != s_graphicsoptions.fs.curvalue )
ADDRGP4 s_ivo+4
INDIRI4
ADDRGP4 s_graphicsoptions+1148+68
INDIRI4
EQI4 $313
line 379
;379:	{
line 380
;380:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+1980+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 381
;381:	}
LABELV $313
line 382
;382:	if ( s_ivo.extensions != s_graphicsoptions.allow_extensions.curvalue )
ADDRGP4 s_ivo+32
INDIRI4
ADDRGP4 s_graphicsoptions+1364+68
INDIRI4
EQI4 $320
line 383
;383:	{
line 384
;384:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+1980+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 385
;385:	}
LABELV $320
line 386
;386:	if ( s_ivo.tq != s_graphicsoptions.tq.curvalue )
ADDRGP4 s_ivo+8
INDIRI4
CVIF4 4
ADDRGP4 s_graphicsoptions+1068+72
INDIRF4
EQF4 $327
line 387
;387:	{
line 388
;388:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+1980+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 389
;389:	}
LABELV $327
line 390
;390:	if ( s_ivo.lighting != s_graphicsoptions.lighting.curvalue )
ADDRGP4 s_ivo+12
INDIRI4
ADDRGP4 s_graphicsoptions+1256+68
INDIRI4
EQI4 $334
line 391
;391:	{
line 392
;392:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+1980+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 393
;393:	}
LABELV $334
line 394
;394:	if ( s_ivo.colordepth != s_graphicsoptions.colordepth.curvalue )
ADDRGP4 s_ivo+16
INDIRI4
ADDRGP4 s_graphicsoptions+1580+68
INDIRI4
EQI4 $341
line 395
;395:	{
line 396
;396:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+1980+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 397
;397:	}
LABELV $341
line 398
;398:	if ( s_ivo.texturebits != s_graphicsoptions.texturebits.curvalue )
ADDRGP4 s_ivo+20
INDIRI4
ADDRGP4 s_graphicsoptions+1472+68
INDIRI4
EQI4 $348
line 399
;399:	{
line 400
;400:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+1980+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 401
;401:	}
LABELV $348
line 402
;402:	if ( s_ivo.geometry != s_graphicsoptions.geometry.curvalue )
ADDRGP4 s_ivo+24
INDIRI4
ADDRGP4 s_graphicsoptions+1688+68
INDIRI4
EQI4 $355
line 403
;403:	{
line 404
;404:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+1980+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 405
;405:	}
LABELV $355
line 406
;406:	if ( s_ivo.filter != s_graphicsoptions.filter.curvalue )
ADDRGP4 s_ivo+28
INDIRI4
ADDRGP4 s_graphicsoptions+1796+68
INDIRI4
EQI4 $362
line 407
;407:	{
line 408
;408:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+1980+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 409
;409:	}
LABELV $362
line 411
;410:
;411:	GraphicsOptions_CheckConfig();
ADDRGP4 GraphicsOptions_CheckConfig
CALLV
pop
line 412
;412:}	
LABELV $284
endproc GraphicsOptions_UpdateMenuItems 8 0
proc GraphicsOptions_ApplyChanges 8 8
line 420
;413:
;414:/*
;415:=================
;416:GraphicsOptions_ApplyChanges
;417:=================
;418:*/
;419:static void GraphicsOptions_ApplyChanges( void *unused, int notification )
;420:{
line 421
;421:	if (notification != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $370
line 422
;422:		return;
ADDRGP4 $369
JUMPV
LABELV $370
line 424
;423:
;424:	switch ( s_graphicsoptions.texturebits.curvalue  )
ADDRLP4 0
ADDRGP4 s_graphicsoptions+1472+68
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $376
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $378
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $379
ADDRGP4 $372
JUMPV
line 425
;425:	{
LABELV $376
line 427
;426:	case 0:
;427:		trap_Cvar_Reset( "r_texturebits" );
ADDRGP4 $377
ARGP4
ADDRGP4 trap_Cvar_Reset
CALLV
pop
line 428
;428:		break;
ADDRGP4 $373
JUMPV
LABELV $378
line 430
;429:	case 1:
;430:		trap_Cvar_SetValue( "r_texturebits", 16 );
ADDRGP4 $377
ARGP4
CNSTF4 1098907648
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 431
;431:		break;
ADDRGP4 $373
JUMPV
LABELV $379
line 433
;432:	case 2:
;433:		trap_Cvar_SetValue( "r_texturebits", 32 );
ADDRGP4 $377
ARGP4
CNSTF4 1107296256
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 434
;434:		break;
LABELV $372
LABELV $373
line 436
;435:	}
;436:	trap_Cvar_SetValue( "r_picmip", 3 - s_graphicsoptions.tq.curvalue );
ADDRGP4 $380
ARGP4
CNSTF4 1077936128
ADDRGP4 s_graphicsoptions+1068+72
INDIRF4
SUBF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 437
;437:	trap_Cvar_SetValue( "r_allowExtensions", s_graphicsoptions.allow_extensions.curvalue );
ADDRGP4 $383
ARGP4
ADDRGP4 s_graphicsoptions+1364+68
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 438
;438:	trap_Cvar_SetValue( "r_mode", s_graphicsoptions.mode.curvalue );
ADDRGP4 $386
ARGP4
ADDRGP4 s_graphicsoptions+960+68
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 439
;439:	trap_Cvar_SetValue( "r_fullscreen", s_graphicsoptions.fs.curvalue );
ADDRGP4 $389
ARGP4
ADDRGP4 s_graphicsoptions+1148+68
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 441
;440:
;441:	switch ( s_graphicsoptions.colordepth.curvalue )
ADDRLP4 4
ADDRGP4 s_graphicsoptions+1580+68
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $396
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $400
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $401
ADDRGP4 $392
JUMPV
line 442
;442:	{
LABELV $396
line 444
;443:	case 0:
;444:		trap_Cvar_Reset( "r_colorbits" );
ADDRGP4 $397
ARGP4
ADDRGP4 trap_Cvar_Reset
CALLV
pop
line 445
;445:		trap_Cvar_Reset( "r_depthbits" );
ADDRGP4 $398
ARGP4
ADDRGP4 trap_Cvar_Reset
CALLV
pop
line 446
;446:		trap_Cvar_Reset( "r_stencilbits" );
ADDRGP4 $399
ARGP4
ADDRGP4 trap_Cvar_Reset
CALLV
pop
line 447
;447:		break;
ADDRGP4 $393
JUMPV
LABELV $400
line 449
;448:	case 1:
;449:		trap_Cvar_SetValue( "r_colorbits", 16 );
ADDRGP4 $397
ARGP4
CNSTF4 1098907648
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 450
;450:		trap_Cvar_SetValue( "r_depthbits", 16 );
ADDRGP4 $398
ARGP4
CNSTF4 1098907648
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 451
;451:		trap_Cvar_SetValue( "r_stencilbits", 0 );
ADDRGP4 $399
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 452
;452:		break;
ADDRGP4 $393
JUMPV
LABELV $401
line 454
;453:	case 2:
;454:		trap_Cvar_SetValue( "r_colorbits", 32 );
ADDRGP4 $397
ARGP4
CNSTF4 1107296256
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 455
;455:		trap_Cvar_SetValue( "r_depthbits", 24 );
ADDRGP4 $398
ARGP4
CNSTF4 1103101952
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 456
;456:		break;
LABELV $392
LABELV $393
line 458
;457:	}
;458:	trap_Cvar_SetValue( "r_vertexLight", s_graphicsoptions.lighting.curvalue );
ADDRGP4 $402
ARGP4
ADDRGP4 s_graphicsoptions+1256+68
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 460
;459:
;460:	if ( s_graphicsoptions.geometry.curvalue == 2 )
ADDRGP4 s_graphicsoptions+1688+68
INDIRI4
CNSTI4 2
NEI4 $405
line 461
;461:	{
line 462
;462:		trap_Cvar_SetValue( "r_lodBias", 0 );
ADDRGP4 $409
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 463
;463:		trap_Cvar_SetValue( "r_subdivisions", 4 );
ADDRGP4 $410
ARGP4
CNSTF4 1082130432
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 464
;464:	}
ADDRGP4 $406
JUMPV
LABELV $405
line 465
;465:	else if ( s_graphicsoptions.geometry.curvalue == 1 )
ADDRGP4 s_graphicsoptions+1688+68
INDIRI4
CNSTI4 1
NEI4 $411
line 466
;466:	{
line 467
;467:		trap_Cvar_SetValue( "r_lodBias", 1 );
ADDRGP4 $409
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 468
;468:		trap_Cvar_SetValue( "r_subdivisions", 12 );
ADDRGP4 $410
ARGP4
CNSTF4 1094713344
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 469
;469:	}
ADDRGP4 $412
JUMPV
LABELV $411
line 471
;470:	else
;471:	{
line 472
;472:		trap_Cvar_SetValue( "r_lodBias", 1 );
ADDRGP4 $409
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 473
;473:		trap_Cvar_SetValue( "r_subdivisions", 20 );
ADDRGP4 $410
ARGP4
CNSTF4 1101004800
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 474
;474:	}
LABELV $412
LABELV $406
line 476
;475:
;476:	if ( s_graphicsoptions.filter.curvalue )
ADDRGP4 s_graphicsoptions+1796+68
INDIRI4
CNSTI4 0
EQI4 $415
line 477
;477:	{
line 478
;478:		trap_Cvar_Set( "r_textureMode", "GL_LINEAR_MIPMAP_LINEAR" );
ADDRGP4 $419
ARGP4
ADDRGP4 $420
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 479
;479:	}
ADDRGP4 $416
JUMPV
LABELV $415
line 481
;480:	else
;481:	{
line 482
;482:		trap_Cvar_Set( "r_textureMode", "GL_LINEAR_MIPMAP_NEAREST" );
ADDRGP4 $419
ARGP4
ADDRGP4 $421
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 483
;483:	}
LABELV $416
line 485
;484:
;485:	trap_Cmd_ExecuteText( EXEC_APPEND, "vid_restart\n" );
CNSTI4 2
ARGI4
ADDRGP4 $422
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 486
;486:}
LABELV $369
endproc GraphicsOptions_ApplyChanges 8 8
proc GraphicsOptions_Event 12 0
line 493
;487:
;488:/*
;489:=================
;490:GraphicsOptions_Event
;491:=================
;492:*/
;493:static void GraphicsOptions_Event( void* ptr, int event ) {
line 496
;494:	InitialVideoOptions_s *ivo;
;495:
;496:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $424
line 497
;497:	 	return;
ADDRGP4 $423
JUMPV
LABELV $424
line 500
;498:	}
;499:
;500:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 101
LTI4 $426
ADDRLP4 4
INDIRI4
CNSTI4 109
GTI4 $426
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $455-404
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $455
address $450
address $426
address $430
address $427
address $449
address $427
address $452
address $453
address $454
code
line 502
;501:	case ID_MODE:
;502:		break;
LABELV $430
line 505
;503:
;504:	case ID_LIST:
;505:		ivo = &s_ivo_templates[s_graphicsoptions.list.curvalue];
ADDRLP4 0
ADDRGP4 s_graphicsoptions+852+68
INDIRI4
CNSTI4 36
MULI4
ADDRGP4 s_ivo_templates
ADDP4
ASGNP4
line 507
;506:
;507:		s_graphicsoptions.mode.curvalue        = ivo->mode;
ADDRGP4 s_graphicsoptions+960+68
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 508
;508:		s_graphicsoptions.tq.curvalue          = ivo->tq;
ADDRGP4 s_graphicsoptions+1068+72
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 509
;509:		s_graphicsoptions.lighting.curvalue    = ivo->lighting;
ADDRGP4 s_graphicsoptions+1256+68
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 510
;510:		s_graphicsoptions.colordepth.curvalue  = ivo->colordepth;
ADDRGP4 s_graphicsoptions+1580+68
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 511
;511:		s_graphicsoptions.texturebits.curvalue = ivo->texturebits;
ADDRGP4 s_graphicsoptions+1472+68
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
line 512
;512:		s_graphicsoptions.geometry.curvalue    = ivo->geometry;
ADDRGP4 s_graphicsoptions+1688+68
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
line 513
;513:		s_graphicsoptions.filter.curvalue      = ivo->filter;
ADDRGP4 s_graphicsoptions+1796+68
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ASGNI4
line 514
;514:		s_graphicsoptions.fs.curvalue          = ivo->fullscreen;
ADDRGP4 s_graphicsoptions+1148+68
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 515
;515:		break;
ADDRGP4 $427
JUMPV
LABELV $449
line 518
;516:
;517:	case ID_DRIVERINFO:
;518:		UI_DriverInfo_Menu();
ADDRGP4 UI_DriverInfo_Menu
CALLV
pop
line 519
;519:		break;
ADDRGP4 $427
JUMPV
LABELV $450
line 522
;520:
;521:	case ID_BACK2:
;522:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 523
;523:		break;
ADDRGP4 $427
JUMPV
line 526
;524:
;525:	case ID_GRAPHICS:
;526:		break;
LABELV $452
line 529
;527:
;528:	case ID_DISPLAY:
;529:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 530
;530:		UI_DisplayOptionsMenu();
ADDRGP4 UI_DisplayOptionsMenu
CALLV
pop
line 531
;531:		break;
ADDRGP4 $427
JUMPV
LABELV $453
line 534
;532:
;533:	case ID_SOUND:
;534:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 535
;535:		UI_SoundOptionsMenu();
ADDRGP4 UI_SoundOptionsMenu
CALLV
pop
line 536
;536:		break;
ADDRGP4 $427
JUMPV
LABELV $454
line 539
;537:
;538:	case ID_NETWORK:
;539:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 540
;540:		UI_NetworkOptionsMenu();
ADDRGP4 UI_NetworkOptionsMenu
CALLV
pop
line 541
;541:		break;
LABELV $426
LABELV $427
line 543
;542:	}
;543:}
LABELV $423
endproc GraphicsOptions_Event 12 0
proc GraphicsOptions_TQEvent 0 0
line 551
;544:
;545:
;546:/*
;547:================
;548:GraphicsOptions_TQEvent
;549:================
;550:*/
;551:static void GraphicsOptions_TQEvent( void *ptr, int event ) {
line 552
;552:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $458
line 553
;553:	 	return;
ADDRGP4 $457
JUMPV
LABELV $458
line 555
;554:	}
;555:	s_graphicsoptions.tq.curvalue = (int)(s_graphicsoptions.tq.curvalue + 0.5);
ADDRGP4 s_graphicsoptions+1068+72
ADDRGP4 s_graphicsoptions+1068+72
INDIRF4
CNSTF4 1056964608
ADDF4
CVFI4 4
CVIF4 4
ASGNF4
line 556
;556:}
LABELV $457
endproc GraphicsOptions_TQEvent 0 0
export GraphicsOptions_MenuDraw
proc GraphicsOptions_MenuDraw 0 4
line 565
;557:
;558:
;559:/*
;560:================
;561:GraphicsOptions_MenuDraw
;562:================
;563:*/
;564:void GraphicsOptions_MenuDraw (void)
;565:{
line 567
;566://APSFIX - rework this
;567:	GraphicsOptions_UpdateMenuItems();
ADDRGP4 GraphicsOptions_UpdateMenuItems
CALLV
pop
line 569
;568:
;569:	Menu_Draw( &s_graphicsoptions.menu );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 570
;570:}
LABELV $464
endproc GraphicsOptions_MenuDraw 0 4
proc GraphicsOptions_SetMenuItems 60 8
line 578
;571:
;572:/*
;573:=================
;574:GraphicsOptions_SetMenuItems
;575:=================
;576:*/
;577:static void GraphicsOptions_SetMenuItems( void )
;578:{
line 579
;579:	s_graphicsoptions.mode.curvalue = trap_Cvar_VariableValue( "r_mode" );
ADDRGP4 $386
ARGP4
ADDRLP4 0
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_graphicsoptions+960+68
ADDRLP4 0
INDIRF4
CVFI4 4
ASGNI4
line 580
;580:	if ( s_graphicsoptions.mode.curvalue < 0 )
ADDRGP4 s_graphicsoptions+960+68
INDIRI4
CNSTI4 0
GEI4 $468
line 581
;581:	{
line 582
;582:		s_graphicsoptions.mode.curvalue = 3;
ADDRGP4 s_graphicsoptions+960+68
CNSTI4 3
ASGNI4
line 583
;583:	}
LABELV $468
line 584
;584:	s_graphicsoptions.fs.curvalue = trap_Cvar_VariableValue("r_fullscreen");
ADDRGP4 $389
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_graphicsoptions+1148+68
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 585
;585:	s_graphicsoptions.allow_extensions.curvalue = trap_Cvar_VariableValue("r_allowExtensions");
ADDRGP4 $383
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_graphicsoptions+1364+68
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 586
;586:	s_graphicsoptions.tq.curvalue = 3-trap_Cvar_VariableValue( "r_picmip");
ADDRGP4 $380
ARGP4
ADDRLP4 12
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_graphicsoptions+1068+72
CNSTF4 1077936128
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
line 587
;587:	if ( s_graphicsoptions.tq.curvalue < 0 )
ADDRGP4 s_graphicsoptions+1068+72
INDIRF4
CNSTF4 0
GEF4 $480
line 588
;588:	{
line 589
;589:		s_graphicsoptions.tq.curvalue = 0;
ADDRGP4 s_graphicsoptions+1068+72
CNSTF4 0
ASGNF4
line 590
;590:	}
ADDRGP4 $481
JUMPV
LABELV $480
line 591
;591:	else if ( s_graphicsoptions.tq.curvalue > 3 )
ADDRGP4 s_graphicsoptions+1068+72
INDIRF4
CNSTF4 1077936128
LEF4 $486
line 592
;592:	{
line 593
;593:		s_graphicsoptions.tq.curvalue = 3;
ADDRGP4 s_graphicsoptions+1068+72
CNSTF4 1077936128
ASGNF4
line 594
;594:	}
LABELV $486
LABELV $481
line 596
;595:
;596:	s_graphicsoptions.lighting.curvalue = trap_Cvar_VariableValue( "r_vertexLight" ) != 0;
ADDRGP4 $402
ARGP4
ADDRLP4 20
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 20
INDIRF4
CNSTF4 0
EQF4 $495
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRGP4 $496
JUMPV
LABELV $495
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $496
ADDRGP4 s_graphicsoptions+1256+68
ADDRLP4 16
INDIRI4
ASGNI4
line 597
;597:	switch ( ( int ) trap_Cvar_VariableValue( "r_texturebits" ) )
ADDRGP4 $377
ARGP4
ADDRLP4 28
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 28
INDIRF4
CVFI4 4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 16
EQI4 $503
ADDRLP4 24
INDIRI4
CNSTI4 16
GTI4 $510
LABELV $509
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $500
ADDRGP4 $497
JUMPV
LABELV $510
ADDRLP4 24
INDIRI4
CNSTI4 32
EQI4 $506
ADDRGP4 $497
JUMPV
line 598
;598:	{
LABELV $497
LABELV $500
line 601
;599:	default:
;600:	case 0:
;601:		s_graphicsoptions.texturebits.curvalue = 0;
ADDRGP4 s_graphicsoptions+1472+68
CNSTI4 0
ASGNI4
line 602
;602:		break;
ADDRGP4 $498
JUMPV
LABELV $503
line 604
;603:	case 16:
;604:		s_graphicsoptions.texturebits.curvalue = 1;
ADDRGP4 s_graphicsoptions+1472+68
CNSTI4 1
ASGNI4
line 605
;605:		break;
ADDRGP4 $498
JUMPV
LABELV $506
line 607
;606:	case 32:
;607:		s_graphicsoptions.texturebits.curvalue = 2;
ADDRGP4 s_graphicsoptions+1472+68
CNSTI4 2
ASGNI4
line 608
;608:		break;
LABELV $498
line 611
;609:	}
;610:
;611:	if ( !Q_stricmp( UI_Cvar_VariableString( "r_textureMode" ), "GL_LINEAR_MIPMAP_NEAREST" ) )
ADDRGP4 $419
ARGP4
ADDRLP4 36
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 $421
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $511
line 612
;612:	{
line 613
;613:		s_graphicsoptions.filter.curvalue = 0;
ADDRGP4 s_graphicsoptions+1796+68
CNSTI4 0
ASGNI4
line 614
;614:	}
ADDRGP4 $512
JUMPV
LABELV $511
line 616
;615:	else
;616:	{
line 617
;617:		s_graphicsoptions.filter.curvalue = 1;
ADDRGP4 s_graphicsoptions+1796+68
CNSTI4 1
ASGNI4
line 618
;618:	}
LABELV $512
line 620
;619:
;620:	if ( trap_Cvar_VariableValue( "r_lodBias" ) > 0 )
ADDRGP4 $409
ARGP4
ADDRLP4 44
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 44
INDIRF4
CNSTF4 0
LEF4 $517
line 621
;621:	{
line 622
;622:		if ( trap_Cvar_VariableValue( "r_subdivisions" ) >= 20 )
ADDRGP4 $410
ARGP4
ADDRLP4 48
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 48
INDIRF4
CNSTF4 1101004800
LTF4 $519
line 623
;623:		{
line 624
;624:			s_graphicsoptions.geometry.curvalue = 0;
ADDRGP4 s_graphicsoptions+1688+68
CNSTI4 0
ASGNI4
line 625
;625:		}
ADDRGP4 $518
JUMPV
LABELV $519
line 627
;626:		else
;627:		{
line 628
;628:			s_graphicsoptions.geometry.curvalue = 1;
ADDRGP4 s_graphicsoptions+1688+68
CNSTI4 1
ASGNI4
line 629
;629:		}
line 630
;630:	}
ADDRGP4 $518
JUMPV
LABELV $517
line 632
;631:	else
;632:	{
line 633
;633:		s_graphicsoptions.geometry.curvalue = 2;
ADDRGP4 s_graphicsoptions+1688+68
CNSTI4 2
ASGNI4
line 634
;634:	}
LABELV $518
line 636
;635:
;636:	switch ( ( int ) trap_Cvar_VariableValue( "r_colorbits" ) )
ADDRGP4 $397
ARGP4
ADDRLP4 52
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 48
ADDRLP4 52
INDIRF4
CVFI4 4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 16
EQI4 $533
ADDRLP4 48
INDIRI4
CNSTI4 16
GTI4 $540
LABELV $539
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $530
ADDRGP4 $527
JUMPV
LABELV $540
ADDRLP4 48
INDIRI4
CNSTI4 32
EQI4 $536
ADDRGP4 $527
JUMPV
line 637
;637:	{
LABELV $527
LABELV $530
line 640
;638:	default:
;639:	case 0:
;640:		s_graphicsoptions.colordepth.curvalue = 0;
ADDRGP4 s_graphicsoptions+1580+68
CNSTI4 0
ASGNI4
line 641
;641:		break;
ADDRGP4 $528
JUMPV
LABELV $533
line 643
;642:	case 16:
;643:		s_graphicsoptions.colordepth.curvalue = 1;
ADDRGP4 s_graphicsoptions+1580+68
CNSTI4 1
ASGNI4
line 644
;644:		break;
ADDRGP4 $528
JUMPV
LABELV $536
line 646
;645:	case 32:
;646:		s_graphicsoptions.colordepth.curvalue = 2;
ADDRGP4 s_graphicsoptions+1580+68
CNSTI4 2
ASGNI4
line 647
;647:		break;
LABELV $528
line 650
;648:	}
;649:
;650:	if ( s_graphicsoptions.fs.curvalue == 0 )
ADDRGP4 s_graphicsoptions+1148+68
INDIRI4
CNSTI4 0
NEI4 $541
line 651
;651:	{
line 652
;652:		s_graphicsoptions.colordepth.curvalue = 0;
ADDRGP4 s_graphicsoptions+1580+68
CNSTI4 0
ASGNI4
line 653
;653:	}
LABELV $541
line 654
;654:}
LABELV $465
endproc GraphicsOptions_SetMenuItems 60 8
data
align 4
LABELV $548
address $549
address $550
address $551
byte 4 0
align 4
LABELV $552
address $553
address $554
address $555
address $556
address $557
byte 4 0
align 4
LABELV $558
address $559
address $560
byte 4 0
align 4
LABELV $561
address $549
address $550
address $551
byte 4 0
align 4
LABELV $562
address $563
address $564
address $565
address $566
address $567
address $568
address $569
address $570
address $571
address $572
address $573
address $574
byte 4 0
align 4
LABELV $575
address $576
address $577
byte 4 0
align 4
LABELV $578
address $579
address $580
address $581
byte 4 0
align 4
LABELV $582
address $583
address $584
byte 4 0
export GraphicsOptions_MenuInit
code
proc GraphicsOptions_MenuInit 4 12
line 662
;655:
;656:/*
;657:================
;658:GraphicsOptions_MenuInit
;659:================
;660:*/
;661:void GraphicsOptions_MenuInit( void )
;662:{
line 736
;663:
;664:	static const char *tq_names[] =
;665:	{
;666:		"Default",
;667:		"16 bit",
;668:		"32 bit",
;669:		NULL
;670:	};
;671:
;672:	static const char *s_graphics_options_names[] =
;673:	{
;674:		"High Quality",
;675:		"Normal",
;676:		"Fast",
;677:		"Fastest",
;678:		"Custom",
;679:		0
;680:	};
;681:
;682:	static const char *lighting_names[] =
;683:	{
;684:		"Lightmap",
;685:		"Vertex",
;686:		0
;687:	};
;688:
;689:	static const char *colordepth_names[] =
;690:	{
;691:		"Default",
;692:		"16 bit",
;693:		"32 bit",
;694:		0
;695:	};
;696:
;697:	static const char *resolutions[] = 
;698:	{
;699:		"320x240",
;700:		"400x300",
;701:		"512x384",
;702:		"640x480",
;703:		"800x600",
;704:		"960x720",
;705:		"1024x768",
;706:		"1152x864",
;707:		"1280x1024",
;708:		"1600x1200",
;709:		"2048x1536",
;710:		"856x480 wide screen",
;711:		0
;712:	};
;713:	static const char *filter_names[] =
;714:	{
;715:		"Bilinear",
;716:		"Trilinear",
;717:		NULL
;718:	};
;719:	static const char *quality_names[] =
;720:	{
;721:		"Low",
;722:		"Medium",
;723:		"High",
;724:		NULL
;725:	};
;726:	static const char *enabled_names[] =
;727:	{
;728:		"Off",
;729:		"On",
;730:		NULL
;731:	};
;732:
;733:	int y;
;734:
;735:	// zero set all our globals
;736:	memset( &s_graphicsoptions, 0 ,sizeof(graphicsoptions_t) );
ADDRGP4 s_graphicsoptions
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2164
ARGI4
ADDRGP4 memset
CALLP4
pop
line 738
;737:
;738:	GraphicsOptions_Cache();
ADDRGP4 GraphicsOptions_Cache
CALLV
pop
line 740
;739:
;740:	s_graphicsoptions.menu.wrapAround = qtrue;
ADDRGP4 s_graphicsoptions+276
CNSTI4 1
ASGNI4
line 741
;741:	s_graphicsoptions.menu.fullscreen = qtrue;
ADDRGP4 s_graphicsoptions+280
CNSTI4 1
ASGNI4
line 742
;742:	s_graphicsoptions.menu.draw       = GraphicsOptions_MenuDraw;
ADDRGP4 s_graphicsoptions+268
ADDRGP4 GraphicsOptions_MenuDraw
ASGNP4
line 744
;743:
;744:	s_graphicsoptions.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 s_graphicsoptions+288
CNSTI4 10
ASGNI4
line 745
;745:	s_graphicsoptions.banner.generic.x	   = 320;
ADDRGP4 s_graphicsoptions+288+12
CNSTI4 320
ASGNI4
line 746
;746:	s_graphicsoptions.banner.generic.y	   = 16;
ADDRGP4 s_graphicsoptions+288+16
CNSTI4 16
ASGNI4
line 747
;747:	s_graphicsoptions.banner.string  	   = "SYSTEM SETUP";
ADDRGP4 s_graphicsoptions+288+64
ADDRGP4 $595
ASGNP4
line 748
;748:	s_graphicsoptions.banner.color         = color_white;
ADDRGP4 s_graphicsoptions+288+72
ADDRGP4 color_white
ASGNP4
line 749
;749:	s_graphicsoptions.banner.style         = UI_CENTER;
ADDRGP4 s_graphicsoptions+288+68
CNSTI4 1
ASGNI4
line 751
;750:
;751:	s_graphicsoptions.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_graphicsoptions+364
CNSTI4 6
ASGNI4
line 752
;752:	s_graphicsoptions.framel.generic.name  = GRAPHICSOPTIONS_FRAMEL;
ADDRGP4 s_graphicsoptions+364+4
ADDRGP4 $69
ASGNP4
line 753
;753:	s_graphicsoptions.framel.generic.flags = QMF_INACTIVE;
ADDRGP4 s_graphicsoptions+364+44
CNSTU4 16384
ASGNU4
line 754
;754:	s_graphicsoptions.framel.generic.x	   = 0;
ADDRGP4 s_graphicsoptions+364+12
CNSTI4 0
ASGNI4
line 755
;755:	s_graphicsoptions.framel.generic.y	   = 78;
ADDRGP4 s_graphicsoptions+364+16
CNSTI4 78
ASGNI4
line 756
;756:	s_graphicsoptions.framel.width  	   = 256;
ADDRGP4 s_graphicsoptions+364+80
CNSTI4 256
ASGNI4
line 757
;757:	s_graphicsoptions.framel.height  	   = 329;
ADDRGP4 s_graphicsoptions+364+84
CNSTI4 329
ASGNI4
line 759
;758:
;759:	s_graphicsoptions.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_graphicsoptions+456
CNSTI4 6
ASGNI4
line 760
;760:	s_graphicsoptions.framer.generic.name  = GRAPHICSOPTIONS_FRAMER;
ADDRGP4 s_graphicsoptions+456+4
ADDRGP4 $70
ASGNP4
line 761
;761:	s_graphicsoptions.framer.generic.flags = QMF_INACTIVE;
ADDRGP4 s_graphicsoptions+456+44
CNSTU4 16384
ASGNU4
line 762
;762:	s_graphicsoptions.framer.generic.x	   = 376;
ADDRGP4 s_graphicsoptions+456+12
CNSTI4 376
ASGNI4
line 763
;763:	s_graphicsoptions.framer.generic.y	   = 76;
ADDRGP4 s_graphicsoptions+456+16
CNSTI4 76
ASGNI4
line 764
;764:	s_graphicsoptions.framer.width  	   = 256;
ADDRGP4 s_graphicsoptions+456+80
CNSTI4 256
ASGNI4
line 765
;765:	s_graphicsoptions.framer.height  	   = 334;
ADDRGP4 s_graphicsoptions+456+84
CNSTI4 334
ASGNI4
line 767
;766:
;767:	s_graphicsoptions.graphics.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_graphicsoptions+548
CNSTI4 9
ASGNI4
line 768
;768:	s_graphicsoptions.graphics.generic.flags	= QMF_RIGHT_JUSTIFY;
ADDRGP4 s_graphicsoptions+548+44
CNSTU4 16
ASGNU4
line 769
;769:	s_graphicsoptions.graphics.generic.id		= ID_GRAPHICS;
ADDRGP4 s_graphicsoptions+548+8
CNSTI4 106
ASGNI4
line 770
;770:	s_graphicsoptions.graphics.generic.callback	= GraphicsOptions_Event;
ADDRGP4 s_graphicsoptions+548+48
ADDRGP4 GraphicsOptions_Event
ASGNP4
line 771
;771:	s_graphicsoptions.graphics.generic.x		= 216;
ADDRGP4 s_graphicsoptions+548+12
CNSTI4 216
ASGNI4
line 772
;772:	s_graphicsoptions.graphics.generic.y		= 240 - 2 * PROP_HEIGHT;
ADDRGP4 s_graphicsoptions+548+16
CNSTI4 186
ASGNI4
line 773
;773:	s_graphicsoptions.graphics.string			= "GRAPHICS";
ADDRGP4 s_graphicsoptions+548+64
ADDRGP4 $639
ASGNP4
line 774
;774:	s_graphicsoptions.graphics.style			= UI_RIGHT;
ADDRGP4 s_graphicsoptions+548+68
CNSTI4 2
ASGNI4
line 775
;775:	s_graphicsoptions.graphics.color			= color_red;
ADDRGP4 s_graphicsoptions+548+72
ADDRGP4 color_red
ASGNP4
line 777
;776:
;777:	s_graphicsoptions.display.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_graphicsoptions+624
CNSTI4 9
ASGNI4
line 778
;778:	s_graphicsoptions.display.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_graphicsoptions+624+44
CNSTU4 272
ASGNU4
line 779
;779:	s_graphicsoptions.display.generic.id		= ID_DISPLAY;
ADDRGP4 s_graphicsoptions+624+8
CNSTI4 107
ASGNI4
line 780
;780:	s_graphicsoptions.display.generic.callback	= GraphicsOptions_Event;
ADDRGP4 s_graphicsoptions+624+48
ADDRGP4 GraphicsOptions_Event
ASGNP4
line 781
;781:	s_graphicsoptions.display.generic.x			= 216;
ADDRGP4 s_graphicsoptions+624+12
CNSTI4 216
ASGNI4
line 782
;782:	s_graphicsoptions.display.generic.y			= 240 - PROP_HEIGHT;
ADDRGP4 s_graphicsoptions+624+16
CNSTI4 213
ASGNI4
line 783
;783:	s_graphicsoptions.display.string			= "DISPLAY";
ADDRGP4 s_graphicsoptions+624+64
ADDRGP4 $657
ASGNP4
line 784
;784:	s_graphicsoptions.display.style				= UI_RIGHT;
ADDRGP4 s_graphicsoptions+624+68
CNSTI4 2
ASGNI4
line 785
;785:	s_graphicsoptions.display.color				= color_red;
ADDRGP4 s_graphicsoptions+624+72
ADDRGP4 color_red
ASGNP4
line 787
;786:
;787:	s_graphicsoptions.sound.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_graphicsoptions+700
CNSTI4 9
ASGNI4
line 788
;788:	s_graphicsoptions.sound.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_graphicsoptions+700+44
CNSTU4 272
ASGNU4
line 789
;789:	s_graphicsoptions.sound.generic.id			= ID_SOUND;
ADDRGP4 s_graphicsoptions+700+8
CNSTI4 108
ASGNI4
line 790
;790:	s_graphicsoptions.sound.generic.callback	= GraphicsOptions_Event;
ADDRGP4 s_graphicsoptions+700+48
ADDRGP4 GraphicsOptions_Event
ASGNP4
line 791
;791:	s_graphicsoptions.sound.generic.x			= 216;
ADDRGP4 s_graphicsoptions+700+12
CNSTI4 216
ASGNI4
line 792
;792:	s_graphicsoptions.sound.generic.y			= 240;
ADDRGP4 s_graphicsoptions+700+16
CNSTI4 240
ASGNI4
line 793
;793:	s_graphicsoptions.sound.string				= "SOUND";
ADDRGP4 s_graphicsoptions+700+64
ADDRGP4 $675
ASGNP4
line 794
;794:	s_graphicsoptions.sound.style				= UI_RIGHT;
ADDRGP4 s_graphicsoptions+700+68
CNSTI4 2
ASGNI4
line 795
;795:	s_graphicsoptions.sound.color				= color_red;
ADDRGP4 s_graphicsoptions+700+72
ADDRGP4 color_red
ASGNP4
line 797
;796:
;797:	s_graphicsoptions.network.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_graphicsoptions+776
CNSTI4 9
ASGNI4
line 798
;798:	s_graphicsoptions.network.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_graphicsoptions+776+44
CNSTU4 272
ASGNU4
line 799
;799:	s_graphicsoptions.network.generic.id		= ID_NETWORK;
ADDRGP4 s_graphicsoptions+776+8
CNSTI4 109
ASGNI4
line 800
;800:	s_graphicsoptions.network.generic.callback	= GraphicsOptions_Event;
ADDRGP4 s_graphicsoptions+776+48
ADDRGP4 GraphicsOptions_Event
ASGNP4
line 801
;801:	s_graphicsoptions.network.generic.x			= 216;
ADDRGP4 s_graphicsoptions+776+12
CNSTI4 216
ASGNI4
line 802
;802:	s_graphicsoptions.network.generic.y			= 240 + PROP_HEIGHT;
ADDRGP4 s_graphicsoptions+776+16
CNSTI4 267
ASGNI4
line 803
;803:	s_graphicsoptions.network.string			= "NETWORK";
ADDRGP4 s_graphicsoptions+776+64
ADDRGP4 $693
ASGNP4
line 804
;804:	s_graphicsoptions.network.style				= UI_RIGHT;
ADDRGP4 s_graphicsoptions+776+68
CNSTI4 2
ASGNI4
line 805
;805:	s_graphicsoptions.network.color				= color_red;
ADDRGP4 s_graphicsoptions+776+72
ADDRGP4 color_red
ASGNP4
line 807
;806:
;807:	y = 240 - 6 * (BIGCHAR_HEIGHT + 2);
ADDRLP4 0
CNSTI4 132
ASGNI4
line 808
;808:	s_graphicsoptions.list.generic.type     = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+852
CNSTI4 3
ASGNI4
line 809
;809:	s_graphicsoptions.list.generic.name     = "Graphics Settings:";
ADDRGP4 s_graphicsoptions+852+4
ADDRGP4 $701
ASGNP4
line 810
;810:	s_graphicsoptions.list.generic.flags    = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+852+44
CNSTU4 258
ASGNU4
line 811
;811:	s_graphicsoptions.list.generic.x        = 400;
ADDRGP4 s_graphicsoptions+852+12
CNSTI4 400
ASGNI4
line 812
;812:	s_graphicsoptions.list.generic.y        = y;
ADDRGP4 s_graphicsoptions+852+16
ADDRLP4 0
INDIRI4
ASGNI4
line 813
;813:	s_graphicsoptions.list.generic.callback = GraphicsOptions_Event;
ADDRGP4 s_graphicsoptions+852+48
ADDRGP4 GraphicsOptions_Event
ASGNP4
line 814
;814:	s_graphicsoptions.list.generic.id       = ID_LIST;
ADDRGP4 s_graphicsoptions+852+8
CNSTI4 103
ASGNI4
line 815
;815:	s_graphicsoptions.list.itemnames        = s_graphics_options_names;
ADDRGP4 s_graphicsoptions+852+88
ADDRGP4 $552
ASGNP4
line 816
;816:	y += 2 * ( BIGCHAR_HEIGHT + 2 );
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 36
ADDI4
ASGNI4
line 819
;817:
;818:	// references/modifies "r_allowExtensions"
;819:	s_graphicsoptions.allow_extensions.generic.type     = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+1364
CNSTI4 3
ASGNI4
line 820
;820:	s_graphicsoptions.allow_extensions.generic.name	    = "GL Extensions:";
ADDRGP4 s_graphicsoptions+1364+4
ADDRGP4 $717
ASGNP4
line 821
;821:	s_graphicsoptions.allow_extensions.generic.flags	= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+1364+44
CNSTU4 258
ASGNU4
line 822
;822:	s_graphicsoptions.allow_extensions.generic.x	    = 400;
ADDRGP4 s_graphicsoptions+1364+12
CNSTI4 400
ASGNI4
line 823
;823:	s_graphicsoptions.allow_extensions.generic.y	    = y;
ADDRGP4 s_graphicsoptions+1364+16
ADDRLP4 0
INDIRI4
ASGNI4
line 824
;824:	s_graphicsoptions.allow_extensions.itemnames        = enabled_names;
ADDRGP4 s_graphicsoptions+1364+88
ADDRGP4 $582
ASGNP4
line 825
;825:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 828
;826:
;827:	// references/modifies "r_mode"
;828:	s_graphicsoptions.mode.generic.type     = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+960
CNSTI4 3
ASGNI4
line 829
;829:	s_graphicsoptions.mode.generic.name     = "Video Mode:";
ADDRGP4 s_graphicsoptions+960+4
ADDRGP4 $729
ASGNP4
line 830
;830:	s_graphicsoptions.mode.generic.flags    = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+960+44
CNSTU4 258
ASGNU4
line 831
;831:	s_graphicsoptions.mode.generic.x        = 400;
ADDRGP4 s_graphicsoptions+960+12
CNSTI4 400
ASGNI4
line 832
;832:	s_graphicsoptions.mode.generic.y        = y;
ADDRGP4 s_graphicsoptions+960+16
ADDRLP4 0
INDIRI4
ASGNI4
line 833
;833:	s_graphicsoptions.mode.itemnames        = resolutions;
ADDRGP4 s_graphicsoptions+960+88
ADDRGP4 $562
ASGNP4
line 834
;834:	s_graphicsoptions.mode.generic.callback = GraphicsOptions_Event;
ADDRGP4 s_graphicsoptions+960+48
ADDRGP4 GraphicsOptions_Event
ASGNP4
line 835
;835:	s_graphicsoptions.mode.generic.id       = ID_MODE;
ADDRGP4 s_graphicsoptions+960+8
CNSTI4 104
ASGNI4
line 836
;836:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 839
;837:
;838:	// references "r_colorbits"
;839:	s_graphicsoptions.colordepth.generic.type     = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+1580
CNSTI4 3
ASGNI4
line 840
;840:	s_graphicsoptions.colordepth.generic.name     = "Color Depth:";
ADDRGP4 s_graphicsoptions+1580+4
ADDRGP4 $745
ASGNP4
line 841
;841:	s_graphicsoptions.colordepth.generic.flags    = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+1580+44
CNSTU4 258
ASGNU4
line 842
;842:	s_graphicsoptions.colordepth.generic.x        = 400;
ADDRGP4 s_graphicsoptions+1580+12
CNSTI4 400
ASGNI4
line 843
;843:	s_graphicsoptions.colordepth.generic.y        = y;
ADDRGP4 s_graphicsoptions+1580+16
ADDRLP4 0
INDIRI4
ASGNI4
line 844
;844:	s_graphicsoptions.colordepth.itemnames        = colordepth_names;
ADDRGP4 s_graphicsoptions+1580+88
ADDRGP4 $561
ASGNP4
line 845
;845:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 848
;846:
;847:	// references/modifies "r_fullscreen"
;848:	s_graphicsoptions.fs.generic.type     = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+1148
CNSTI4 3
ASGNI4
line 849
;849:	s_graphicsoptions.fs.generic.name	  = "Fullscreen:";
ADDRGP4 s_graphicsoptions+1148+4
ADDRGP4 $757
ASGNP4
line 850
;850:	s_graphicsoptions.fs.generic.flags	  = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+1148+44
CNSTU4 258
ASGNU4
line 851
;851:	s_graphicsoptions.fs.generic.x	      = 400;
ADDRGP4 s_graphicsoptions+1148+12
CNSTI4 400
ASGNI4
line 852
;852:	s_graphicsoptions.fs.generic.y	      = y;
ADDRGP4 s_graphicsoptions+1148+16
ADDRLP4 0
INDIRI4
ASGNI4
line 853
;853:	s_graphicsoptions.fs.itemnames	      = enabled_names;
ADDRGP4 s_graphicsoptions+1148+88
ADDRGP4 $582
ASGNP4
line 854
;854:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 857
;855:
;856:	// references/modifies "r_vertexLight"
;857:	s_graphicsoptions.lighting.generic.type  = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+1256
CNSTI4 3
ASGNI4
line 858
;858:	s_graphicsoptions.lighting.generic.name	 = "Lighting:";
ADDRGP4 s_graphicsoptions+1256+4
ADDRGP4 $769
ASGNP4
line 859
;859:	s_graphicsoptions.lighting.generic.flags = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+1256+44
CNSTU4 258
ASGNU4
line 860
;860:	s_graphicsoptions.lighting.generic.x	 = 400;
ADDRGP4 s_graphicsoptions+1256+12
CNSTI4 400
ASGNI4
line 861
;861:	s_graphicsoptions.lighting.generic.y	 = y;
ADDRGP4 s_graphicsoptions+1256+16
ADDRLP4 0
INDIRI4
ASGNI4
line 862
;862:	s_graphicsoptions.lighting.itemnames     = lighting_names;
ADDRGP4 s_graphicsoptions+1256+88
ADDRGP4 $558
ASGNP4
line 863
;863:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 866
;864:
;865:	// references/modifies "r_lodBias" & "subdivisions"
;866:	s_graphicsoptions.geometry.generic.type  = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+1688
CNSTI4 3
ASGNI4
line 867
;867:	s_graphicsoptions.geometry.generic.name	 = "Geometric Detail:";
ADDRGP4 s_graphicsoptions+1688+4
ADDRGP4 $781
ASGNP4
line 868
;868:	s_graphicsoptions.geometry.generic.flags = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+1688+44
CNSTU4 258
ASGNU4
line 869
;869:	s_graphicsoptions.geometry.generic.x	 = 400;
ADDRGP4 s_graphicsoptions+1688+12
CNSTI4 400
ASGNI4
line 870
;870:	s_graphicsoptions.geometry.generic.y	 = y;
ADDRGP4 s_graphicsoptions+1688+16
ADDRLP4 0
INDIRI4
ASGNI4
line 871
;871:	s_graphicsoptions.geometry.itemnames     = quality_names;
ADDRGP4 s_graphicsoptions+1688+88
ADDRGP4 $578
ASGNP4
line 872
;872:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 875
;873:
;874:	// references/modifies "r_picmip"
;875:	s_graphicsoptions.tq.generic.type	= MTYPE_SLIDER;
ADDRGP4 s_graphicsoptions+1068
CNSTI4 1
ASGNI4
line 876
;876:	s_graphicsoptions.tq.generic.name	= "Texture Detail:";
ADDRGP4 s_graphicsoptions+1068+4
ADDRGP4 $793
ASGNP4
line 877
;877:	s_graphicsoptions.tq.generic.flags	= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+1068+44
CNSTU4 258
ASGNU4
line 878
;878:	s_graphicsoptions.tq.generic.x		= 400;
ADDRGP4 s_graphicsoptions+1068+12
CNSTI4 400
ASGNI4
line 879
;879:	s_graphicsoptions.tq.generic.y		= y;
ADDRGP4 s_graphicsoptions+1068+16
ADDRLP4 0
INDIRI4
ASGNI4
line 880
;880:	s_graphicsoptions.tq.minvalue       = 0;
ADDRGP4 s_graphicsoptions+1068+64
CNSTF4 0
ASGNF4
line 881
;881:	s_graphicsoptions.tq.maxvalue       = 3;
ADDRGP4 s_graphicsoptions+1068+68
CNSTF4 1077936128
ASGNF4
line 882
;882:	s_graphicsoptions.tq.generic.callback = GraphicsOptions_TQEvent;
ADDRGP4 s_graphicsoptions+1068+48
ADDRGP4 GraphicsOptions_TQEvent
ASGNP4
line 883
;883:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 886
;884:
;885:	// references/modifies "r_textureBits"
;886:	s_graphicsoptions.texturebits.generic.type  = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+1472
CNSTI4 3
ASGNI4
line 887
;887:	s_graphicsoptions.texturebits.generic.name	= "Texture Quality:";
ADDRGP4 s_graphicsoptions+1472+4
ADDRGP4 $809
ASGNP4
line 888
;888:	s_graphicsoptions.texturebits.generic.flags	= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+1472+44
CNSTU4 258
ASGNU4
line 889
;889:	s_graphicsoptions.texturebits.generic.x	    = 400;
ADDRGP4 s_graphicsoptions+1472+12
CNSTI4 400
ASGNI4
line 890
;890:	s_graphicsoptions.texturebits.generic.y	    = y;
ADDRGP4 s_graphicsoptions+1472+16
ADDRLP4 0
INDIRI4
ASGNI4
line 891
;891:	s_graphicsoptions.texturebits.itemnames     = tq_names;
ADDRGP4 s_graphicsoptions+1472+88
ADDRGP4 $548
ASGNP4
line 892
;892:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 895
;893:
;894:	// references/modifies "r_textureMode"
;895:	s_graphicsoptions.filter.generic.type   = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+1796
CNSTI4 3
ASGNI4
line 896
;896:	s_graphicsoptions.filter.generic.name	= "Texture Filter:";
ADDRGP4 s_graphicsoptions+1796+4
ADDRGP4 $821
ASGNP4
line 897
;897:	s_graphicsoptions.filter.generic.flags	= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+1796+44
CNSTU4 258
ASGNU4
line 898
;898:	s_graphicsoptions.filter.generic.x	    = 400;
ADDRGP4 s_graphicsoptions+1796+12
CNSTI4 400
ASGNI4
line 899
;899:	s_graphicsoptions.filter.generic.y	    = y;
ADDRGP4 s_graphicsoptions+1796+16
ADDRLP4 0
INDIRI4
ASGNI4
line 900
;900:	s_graphicsoptions.filter.itemnames      = filter_names;
ADDRGP4 s_graphicsoptions+1796+88
ADDRGP4 $575
ASGNP4
line 901
;901:	y += 2*BIGCHAR_HEIGHT;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 32
ADDI4
ASGNI4
line 903
;902:
;903:	s_graphicsoptions.driverinfo.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_graphicsoptions+1904
CNSTI4 9
ASGNI4
line 904
;904:	s_graphicsoptions.driverinfo.generic.flags    = QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_graphicsoptions+1904+44
CNSTU4 264
ASGNU4
line 905
;905:	s_graphicsoptions.driverinfo.generic.callback = GraphicsOptions_Event;
ADDRGP4 s_graphicsoptions+1904+48
ADDRGP4 GraphicsOptions_Event
ASGNP4
line 906
;906:	s_graphicsoptions.driverinfo.generic.id       = ID_DRIVERINFO;
ADDRGP4 s_graphicsoptions+1904+8
CNSTI4 105
ASGNI4
line 907
;907:	s_graphicsoptions.driverinfo.generic.x        = 320;
ADDRGP4 s_graphicsoptions+1904+12
CNSTI4 320
ASGNI4
line 908
;908:	s_graphicsoptions.driverinfo.generic.y        = y;
ADDRGP4 s_graphicsoptions+1904+16
ADDRLP4 0
INDIRI4
ASGNI4
line 909
;909:	s_graphicsoptions.driverinfo.string           = "Driver Info";
ADDRGP4 s_graphicsoptions+1904+64
ADDRGP4 $843
ASGNP4
line 910
;910:	s_graphicsoptions.driverinfo.style            = UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_graphicsoptions+1904+68
CNSTI4 17
ASGNI4
line 911
;911:	s_graphicsoptions.driverinfo.color            = color_red;
ADDRGP4 s_graphicsoptions+1904+72
ADDRGP4 color_red
ASGNP4
line 912
;912:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 914
;913:
;914:	s_graphicsoptions.back.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_graphicsoptions+2072
CNSTI4 6
ASGNI4
line 915
;915:	s_graphicsoptions.back.generic.name     = GRAPHICSOPTIONS_BACK0;
ADDRGP4 s_graphicsoptions+2072+4
ADDRGP4 $71
ASGNP4
line 916
;916:	s_graphicsoptions.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_graphicsoptions+2072+44
CNSTU4 260
ASGNU4
line 917
;917:	s_graphicsoptions.back.generic.callback = GraphicsOptions_Event;
ADDRGP4 s_graphicsoptions+2072+48
ADDRGP4 GraphicsOptions_Event
ASGNP4
line 918
;918:	s_graphicsoptions.back.generic.id	    = ID_BACK2;
ADDRGP4 s_graphicsoptions+2072+8
CNSTI4 101
ASGNI4
line 919
;919:	s_graphicsoptions.back.generic.x		= 0;
ADDRGP4 s_graphicsoptions+2072+12
CNSTI4 0
ASGNI4
line 920
;920:	s_graphicsoptions.back.generic.y		= 480-64;
ADDRGP4 s_graphicsoptions+2072+16
CNSTI4 416
ASGNI4
line 921
;921:	s_graphicsoptions.back.width  		    = 128;
ADDRGP4 s_graphicsoptions+2072+80
CNSTI4 128
ASGNI4
line 922
;922:	s_graphicsoptions.back.height  		    = 64;
ADDRGP4 s_graphicsoptions+2072+84
CNSTI4 64
ASGNI4
line 923
;923:	s_graphicsoptions.back.focuspic         = GRAPHICSOPTIONS_BACK1;
ADDRGP4 s_graphicsoptions+2072+64
ADDRGP4 $72
ASGNP4
line 925
;924:
;925:	s_graphicsoptions.apply.generic.type     = MTYPE_BITMAP;
ADDRGP4 s_graphicsoptions+1980
CNSTI4 6
ASGNI4
line 926
;926:	s_graphicsoptions.apply.generic.name     = GRAPHICSOPTIONS_ACCEPT0;
ADDRGP4 s_graphicsoptions+1980+4
ADDRGP4 $870
ASGNP4
line 927
;927:	s_graphicsoptions.apply.generic.flags    = QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_HIDDEN|QMF_INACTIVE;
ADDRGP4 s_graphicsoptions+1980+44
CNSTU4 20752
ASGNU4
line 928
;928:	s_graphicsoptions.apply.generic.callback = GraphicsOptions_ApplyChanges;
ADDRGP4 s_graphicsoptions+1980+48
ADDRGP4 GraphicsOptions_ApplyChanges
ASGNP4
line 929
;929:	s_graphicsoptions.apply.generic.x        = 640;
ADDRGP4 s_graphicsoptions+1980+12
CNSTI4 640
ASGNI4
line 930
;930:	s_graphicsoptions.apply.generic.y        = 480-64;
ADDRGP4 s_graphicsoptions+1980+16
CNSTI4 416
ASGNI4
line 931
;931:	s_graphicsoptions.apply.width  		     = 128;
ADDRGP4 s_graphicsoptions+1980+80
CNSTI4 128
ASGNI4
line 932
;932:	s_graphicsoptions.apply.height  		 = 64;
ADDRGP4 s_graphicsoptions+1980+84
CNSTI4 64
ASGNI4
line 933
;933:	s_graphicsoptions.apply.focuspic         = GRAPHICSOPTIONS_ACCEPT1;
ADDRGP4 s_graphicsoptions+1980+64
ADDRGP4 $885
ASGNP4
line 935
;934:
;935:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.banner );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 936
;936:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.framel );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+364
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 937
;937:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.framer );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+456
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 939
;938:
;939:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.graphics );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+548
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 940
;940:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.display );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+624
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 941
;941:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.sound );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+700
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 942
;942:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.network );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+776
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 944
;943:
;944:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.list );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+852
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 945
;945:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.allow_extensions );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1364
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 946
;946:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.mode );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+960
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 947
;947:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.colordepth );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1580
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 948
;948:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.fs );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1148
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 949
;949:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.lighting );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1256
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 950
;950:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.geometry );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1688
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 951
;951:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.tq );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1068
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 952
;952:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.texturebits );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1472
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 953
;953:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.filter );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1796
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 954
;954:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.driverinfo );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1904
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 956
;955:
;956:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.back );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+2072
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 957
;957:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.apply );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1980
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 959
;958:
;959:	GraphicsOptions_SetMenuItems();
ADDRGP4 GraphicsOptions_SetMenuItems
CALLV
pop
line 960
;960:	GraphicsOptions_GetInitialVideo();
ADDRGP4 GraphicsOptions_GetInitialVideo
CALLV
pop
line 962
;961:
;962:}
LABELV $547
endproc GraphicsOptions_MenuInit 4 12
export GraphicsOptions_Cache
proc GraphicsOptions_Cache 0 4
line 970
;963:
;964:
;965:/*
;966:=================
;967:GraphicsOptions_Cache
;968:=================
;969:*/
;970:void GraphicsOptions_Cache( void ) {
line 971
;971:	trap_R_RegisterShaderNoMip( GRAPHICSOPTIONS_FRAMEL );
ADDRGP4 $69
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 972
;972:	trap_R_RegisterShaderNoMip( GRAPHICSOPTIONS_FRAMER );
ADDRGP4 $70
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 973
;973:	trap_R_RegisterShaderNoMip( GRAPHICSOPTIONS_BACK0 );
ADDRGP4 $71
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 974
;974:	trap_R_RegisterShaderNoMip( GRAPHICSOPTIONS_BACK1 );
ADDRGP4 $72
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 975
;975:	trap_R_RegisterShaderNoMip( GRAPHICSOPTIONS_ACCEPT0 );
ADDRGP4 $870
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 976
;976:	trap_R_RegisterShaderNoMip( GRAPHICSOPTIONS_ACCEPT1 );
ADDRGP4 $885
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 977
;977:}
LABELV $906
endproc GraphicsOptions_Cache 0 4
export UI_GraphicsOptionsMenu
proc UI_GraphicsOptionsMenu 0 8
line 985
;978:
;979:
;980:/*
;981:=================
;982:UI_GraphicsOptionsMenu
;983:=================
;984:*/
;985:void UI_GraphicsOptionsMenu( void ) {
line 986
;986:	GraphicsOptions_MenuInit();
ADDRGP4 GraphicsOptions_MenuInit
CALLV
pop
line 987
;987:	UI_PushMenu( &s_graphicsoptions.menu );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 988
;988:	Menu_SetCursorToItem( &s_graphicsoptions.menu, &s_graphicsoptions.graphics );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+548
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 989
;989:}
LABELV $907
endproc UI_GraphicsOptionsMenu 0 8
bss
align 4
LABELV s_graphicsoptions
skip 2164
align 4
LABELV s_ivo
skip 36
align 4
LABELV s_driverinfo
skip 1924
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
LABELV $885
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
byte 1 99
byte 1 99
byte 1 101
byte 1 112
byte 1 116
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $870
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
byte 1 99
byte 1 99
byte 1 101
byte 1 112
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $843
byte 1 68
byte 1 114
byte 1 105
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 0
align 1
LABELV $821
byte 1 84
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 70
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 58
byte 1 0
align 1
LABELV $809
byte 1 84
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 81
byte 1 117
byte 1 97
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 58
byte 1 0
align 1
LABELV $793
byte 1 84
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 68
byte 1 101
byte 1 116
byte 1 97
byte 1 105
byte 1 108
byte 1 58
byte 1 0
align 1
LABELV $781
byte 1 71
byte 1 101
byte 1 111
byte 1 109
byte 1 101
byte 1 116
byte 1 114
byte 1 105
byte 1 99
byte 1 32
byte 1 68
byte 1 101
byte 1 116
byte 1 97
byte 1 105
byte 1 108
byte 1 58
byte 1 0
align 1
LABELV $769
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 0
align 1
LABELV $757
byte 1 70
byte 1 117
byte 1 108
byte 1 108
byte 1 115
byte 1 99
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 58
byte 1 0
align 1
LABELV $745
byte 1 67
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 32
byte 1 68
byte 1 101
byte 1 112
byte 1 116
byte 1 104
byte 1 58
byte 1 0
align 1
LABELV $729
byte 1 86
byte 1 105
byte 1 100
byte 1 101
byte 1 111
byte 1 32
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $717
byte 1 71
byte 1 76
byte 1 32
byte 1 69
byte 1 120
byte 1 116
byte 1 101
byte 1 110
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $701
byte 1 71
byte 1 114
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 99
byte 1 115
byte 1 32
byte 1 83
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $693
byte 1 78
byte 1 69
byte 1 84
byte 1 87
byte 1 79
byte 1 82
byte 1 75
byte 1 0
align 1
LABELV $675
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $657
byte 1 68
byte 1 73
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 0
align 1
LABELV $639
byte 1 71
byte 1 82
byte 1 65
byte 1 80
byte 1 72
byte 1 73
byte 1 67
byte 1 83
byte 1 0
align 1
LABELV $595
byte 1 83
byte 1 89
byte 1 83
byte 1 84
byte 1 69
byte 1 77
byte 1 32
byte 1 83
byte 1 69
byte 1 84
byte 1 85
byte 1 80
byte 1 0
align 1
LABELV $584
byte 1 79
byte 1 110
byte 1 0
align 1
LABELV $583
byte 1 79
byte 1 102
byte 1 102
byte 1 0
align 1
LABELV $581
byte 1 72
byte 1 105
byte 1 103
byte 1 104
byte 1 0
align 1
LABELV $580
byte 1 77
byte 1 101
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $579
byte 1 76
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $577
byte 1 84
byte 1 114
byte 1 105
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $576
byte 1 66
byte 1 105
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $574
byte 1 56
byte 1 53
byte 1 54
byte 1 120
byte 1 52
byte 1 56
byte 1 48
byte 1 32
byte 1 119
byte 1 105
byte 1 100
byte 1 101
byte 1 32
byte 1 115
byte 1 99
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $573
byte 1 50
byte 1 48
byte 1 52
byte 1 56
byte 1 120
byte 1 49
byte 1 53
byte 1 51
byte 1 54
byte 1 0
align 1
LABELV $572
byte 1 49
byte 1 54
byte 1 48
byte 1 48
byte 1 120
byte 1 49
byte 1 50
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $571
byte 1 49
byte 1 50
byte 1 56
byte 1 48
byte 1 120
byte 1 49
byte 1 48
byte 1 50
byte 1 52
byte 1 0
align 1
LABELV $570
byte 1 49
byte 1 49
byte 1 53
byte 1 50
byte 1 120
byte 1 56
byte 1 54
byte 1 52
byte 1 0
align 1
LABELV $569
byte 1 49
byte 1 48
byte 1 50
byte 1 52
byte 1 120
byte 1 55
byte 1 54
byte 1 56
byte 1 0
align 1
LABELV $568
byte 1 57
byte 1 54
byte 1 48
byte 1 120
byte 1 55
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $567
byte 1 56
byte 1 48
byte 1 48
byte 1 120
byte 1 54
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $566
byte 1 54
byte 1 52
byte 1 48
byte 1 120
byte 1 52
byte 1 56
byte 1 48
byte 1 0
align 1
LABELV $565
byte 1 53
byte 1 49
byte 1 50
byte 1 120
byte 1 51
byte 1 56
byte 1 52
byte 1 0
align 1
LABELV $564
byte 1 52
byte 1 48
byte 1 48
byte 1 120
byte 1 51
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $563
byte 1 51
byte 1 50
byte 1 48
byte 1 120
byte 1 50
byte 1 52
byte 1 48
byte 1 0
align 1
LABELV $560
byte 1 86
byte 1 101
byte 1 114
byte 1 116
byte 1 101
byte 1 120
byte 1 0
align 1
LABELV $559
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $557
byte 1 67
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $556
byte 1 70
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $555
byte 1 70
byte 1 97
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $554
byte 1 78
byte 1 111
byte 1 114
byte 1 109
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $553
byte 1 72
byte 1 105
byte 1 103
byte 1 104
byte 1 32
byte 1 81
byte 1 117
byte 1 97
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $551
byte 1 51
byte 1 50
byte 1 32
byte 1 98
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $550
byte 1 49
byte 1 54
byte 1 32
byte 1 98
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $549
byte 1 68
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $422
byte 1 118
byte 1 105
byte 1 100
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $421
byte 1 71
byte 1 76
byte 1 95
byte 1 76
byte 1 73
byte 1 78
byte 1 69
byte 1 65
byte 1 82
byte 1 95
byte 1 77
byte 1 73
byte 1 80
byte 1 77
byte 1 65
byte 1 80
byte 1 95
byte 1 78
byte 1 69
byte 1 65
byte 1 82
byte 1 69
byte 1 83
byte 1 84
byte 1 0
align 1
LABELV $420
byte 1 71
byte 1 76
byte 1 95
byte 1 76
byte 1 73
byte 1 78
byte 1 69
byte 1 65
byte 1 82
byte 1 95
byte 1 77
byte 1 73
byte 1 80
byte 1 77
byte 1 65
byte 1 80
byte 1 95
byte 1 76
byte 1 73
byte 1 78
byte 1 69
byte 1 65
byte 1 82
byte 1 0
align 1
LABELV $419
byte 1 114
byte 1 95
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $410
byte 1 114
byte 1 95
byte 1 115
byte 1 117
byte 1 98
byte 1 100
byte 1 105
byte 1 118
byte 1 105
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $409
byte 1 114
byte 1 95
byte 1 108
byte 1 111
byte 1 100
byte 1 66
byte 1 105
byte 1 97
byte 1 115
byte 1 0
align 1
LABELV $402
byte 1 114
byte 1 95
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 101
byte 1 120
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $399
byte 1 114
byte 1 95
byte 1 115
byte 1 116
byte 1 101
byte 1 110
byte 1 99
byte 1 105
byte 1 108
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $398
byte 1 114
byte 1 95
byte 1 100
byte 1 101
byte 1 112
byte 1 116
byte 1 104
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $397
byte 1 114
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $389
byte 1 114
byte 1 95
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 115
byte 1 99
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $386
byte 1 114
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $383
byte 1 114
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 69
byte 1 120
byte 1 116
byte 1 101
byte 1 110
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $380
byte 1 114
byte 1 95
byte 1 112
byte 1 105
byte 1 99
byte 1 109
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $377
byte 1 114
byte 1 95
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $128
byte 1 68
byte 1 82
byte 1 73
byte 1 86
byte 1 69
byte 1 82
byte 1 32
byte 1 73
byte 1 78
byte 1 70
byte 1 79
byte 1 0
align 1
LABELV $90
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 40
byte 1 37
byte 1 100
byte 1 45
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 41
byte 1 32
byte 1 90
byte 1 40
byte 1 37
byte 1 100
byte 1 45
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 41
byte 1 32
byte 1 115
byte 1 116
byte 1 101
byte 1 110
byte 1 99
byte 1 105
byte 1 108
byte 1 40
byte 1 37
byte 1 100
byte 1 45
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 41
byte 1 0
align 1
LABELV $84
byte 1 69
byte 1 88
byte 1 84
byte 1 69
byte 1 78
byte 1 83
byte 1 73
byte 1 79
byte 1 78
byte 1 83
byte 1 0
align 1
LABELV $83
byte 1 80
byte 1 73
byte 1 88
byte 1 69
byte 1 76
byte 1 70
byte 1 79
byte 1 82
byte 1 77
byte 1 65
byte 1 84
byte 1 0
align 1
LABELV $82
byte 1 86
byte 1 69
byte 1 78
byte 1 68
byte 1 79
byte 1 82
byte 1 0
align 1
LABELV $72
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
LABELV $71
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
LABELV $70
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
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 49
byte 1 95
byte 1 114
byte 1 0
align 1
LABELV $69
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
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 50
byte 1 95
byte 1 108
byte 1 0
