data
align 4
LABELV serverinfo_artlist
address $69
address $70
address $71
address $72
byte 4 0
export Favorites_Add
code
proc Favorites_Add 276 12
file "..\..\..\..\code\q3_ui\ui_serverinfo.c"
line 50
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "ui_local.h"
;4:
;5:#define SERVERINFO_FRAMEL	"menu/art/frame2_l"
;6:#define SERVERINFO_FRAMER	"menu/art/frame1_r"
;7:#define SERVERINFO_BACK0	"menu/art/back_0"
;8:#define SERVERINFO_BACK1	"menu/art/back_1"
;9:
;10:static char* serverinfo_artlist[] =
;11:{
;12:	SERVERINFO_FRAMEL,	
;13:	SERVERINFO_FRAMER,
;14:	SERVERINFO_BACK0,
;15:	SERVERINFO_BACK1,
;16:	NULL
;17:};
;18:
;19:#define ID_ADD	 100
;20:#define ID_BACK	 101
;21:
;22:typedef struct
;23:{
;24:	menuframework_s	menu;
;25:	menutext_s		banner;
;26:	menubitmap_s	framel;
;27:	menubitmap_s	framer;
;28:	menubitmap_s	back;
;29:	menutext_s		add;
;30:	menulist_s		list;
;31:	char			info[MAX_INFO_STRING];
;32:} serverinfo_t;
;33:
;34:static serverinfo_t	s_serverinfo;
;35:
;36:#define MAX_INFO_LINES		64
;37:#define INFO_LINE_WIDTH		51
;38:
;39:static	char	*itemnames[MAX_INFO_LINES];
;40:static	char	show_info[MAX_INFO_LINES][INFO_LINE_WIDTH*3];
;41:
;42:/*
;43:=================
;44:Favorites_Add
;45:
;46:Add current server to favorites
;47:=================
;48:*/
;49:void Favorites_Add( void )
;50:{
line 56
;51:	char	adrstr[128];
;52:	char	serverbuff[128];
;53:	int		i;
;54:	int		best;
;55:
;56:	trap_Cvar_VariableStringBuffer( "cl_currentServerAddress", serverbuff, sizeof(serverbuff) );
ADDRGP4 $75
ARGP4
ADDRLP4 136
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 57
;57:	if (!serverbuff[0])
ADDRLP4 136
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $76
line 58
;58:		return;
ADDRGP4 $74
JUMPV
LABELV $76
line 60
;59:
;60:	best = 0;
ADDRLP4 132
CNSTI4 0
ASGNI4
line 61
;61:	for (i=0; i<MAX_FAVORITESERVERS; i++)
ADDRLP4 128
CNSTI4 0
ASGNI4
LABELV $78
line 62
;62:	{
line 63
;63:		trap_Cvar_VariableStringBuffer( va("server%d",i+1), adrstr, sizeof(adrstr) );
ADDRGP4 $82
ARGP4
ADDRLP4 128
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 264
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 264
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 64
;64:		if (!Q_stricmp(serverbuff,adrstr))
ADDRLP4 136
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 268
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
NEI4 $83
line 65
;65:		{
line 67
;66:			// already in list
;67:			return;
ADDRGP4 $74
JUMPV
LABELV $83
line 71
;68:		}
;69:		
;70:		// use first empty or non-numeric available slot
;71:		if ((adrstr[0]  < '0' || adrstr[0] > '9' ) && !best)
ADDRLP4 272
ADDRLP4 0
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 272
INDIRI4
CNSTI4 48
LTI4 $87
ADDRLP4 272
INDIRI4
CNSTI4 57
LEI4 $85
LABELV $87
ADDRLP4 132
INDIRI4
CNSTI4 0
NEI4 $85
line 72
;72:			best = i+1;
ADDRLP4 132
ADDRLP4 128
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $85
line 73
;73:	}
LABELV $79
line 61
ADDRLP4 128
ADDRLP4 128
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 16
LTI4 $78
line 75
;74:
;75:	if (best)
ADDRLP4 132
INDIRI4
CNSTI4 0
EQI4 $88
line 76
;76:		trap_Cvar_Set( va("server%d",best), serverbuff);
ADDRGP4 $82
ARGP4
ADDRLP4 132
INDIRI4
ARGI4
ADDRLP4 264
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 264
INDIRP4
ARGP4
ADDRLP4 136
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
LABELV $88
line 77
;77:}
LABELV $74
endproc Favorites_Add 276 12
proc ServerInfo_Event 8 0
line 86
;78:
;79:
;80:/*
;81:=================
;82:ServerInfo_Event
;83:=================
;84:*/
;85:static void ServerInfo_Event( void* ptr, int event )
;86:{
line 87
;87:	switch (((menucommon_s*)ptr)->id)
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
EQI4 $94
ADDRLP4 0
INDIRI4
CNSTI4 101
EQI4 $97
ADDRGP4 $91
JUMPV
line 88
;88:	{
LABELV $94
line 90
;89:		case ID_ADD:
;90:			if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $95
line 91
;91:				break;
ADDRGP4 $92
JUMPV
LABELV $95
line 93
;92:		
;93:			Favorites_Add();
ADDRGP4 Favorites_Add
CALLV
pop
line 94
;94:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 95
;95:			break;
ADDRGP4 $92
JUMPV
LABELV $97
line 98
;96:
;97:		case ID_BACK:
;98:			if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $98
line 99
;99:				break;
ADDRGP4 $92
JUMPV
LABELV $98
line 101
;100:
;101:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 102
;102:			break;
LABELV $91
LABELV $92
line 104
;103:	}
;104:}
LABELV $90
endproc ServerInfo_Event 8 0
proc ServerInfo_MenuKey 4 8
line 112
;105:
;106:/*
;107:=================
;108:ServerInfo_MenuKey
;109:=================
;110:*/
;111:static sfxHandle_t ServerInfo_MenuKey( int key )
;112:{
line 113
;113:	return ( Menu_DefaultKey( &s_serverinfo.menu, key ) );
ADDRGP4 s_serverinfo
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $100
endproc ServerInfo_MenuKey 4 8
export ServerInfo_Cache
proc ServerInfo_Cache 4 4
line 122
;114:}
;115:
;116:/*
;117:=================
;118:ServerInfo_Cache
;119:=================
;120:*/
;121:void ServerInfo_Cache( void )
;122:{
line 126
;123:	int	i;
;124:
;125:	// touch all our pics
;126:	for (i=0; ;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $102
line 127
;127:	{
line 128
;128:		if (!serverinfo_artlist[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 serverinfo_artlist
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $106
line 129
;129:			break;
ADDRGP4 $104
JUMPV
LABELV $106
line 130
;130:		trap_R_RegisterShaderNoMip(serverinfo_artlist[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 serverinfo_artlist
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 131
;131:	}
LABELV $103
line 126
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $102
JUMPV
LABELV $104
line 132
;132:}
LABELV $101
endproc ServerInfo_Cache 4 4
export UI_ServerInfoMenu
proc UI_ServerInfoMenu 4128 16
line 140
;133:
;134:/*
;135:=================
;136:UI_ServerInfoMenu
;137:=================
;138:*/
;139:void UI_ServerInfoMenu( void )
;140:{
line 147
;141:	const char		*s;
;142:	char			key[MAX_INFO_KEY], *str;
;143:	char			value[MAX_INFO_VALUE], buf[MAX_INFO_VALUE*2];
;144:	int				i, len, max;
;145:
;146:	// zero set all our globals
;147:	memset( &s_serverinfo, 0 ,sizeof(serverinfo_t) );
ADDRGP4 s_serverinfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1848
ARGI4
ADDRGP4 memset
CALLP4
pop
line 149
;148:
;149:	ServerInfo_Cache();
ADDRGP4 ServerInfo_Cache
CALLV
pop
line 151
;150:
;151:	s_serverinfo.menu.key        = ServerInfo_MenuKey;
ADDRGP4 s_serverinfo+272
ADDRGP4 ServerInfo_MenuKey
ASGNP4
line 152
;152:	s_serverinfo.menu.wrapAround = qtrue;
ADDRGP4 s_serverinfo+276
CNSTI4 1
ASGNI4
line 153
;153:	s_serverinfo.menu.fullscreen = qtrue;
ADDRGP4 s_serverinfo+280
CNSTI4 1
ASGNI4
line 155
;154:
;155:	s_serverinfo.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 s_serverinfo+288
CNSTI4 10
ASGNI4
line 156
;156:	s_serverinfo.banner.generic.x	  = 320;
ADDRGP4 s_serverinfo+288+12
CNSTI4 320
ASGNI4
line 157
;157:	s_serverinfo.banner.generic.y	  = 16;
ADDRGP4 s_serverinfo+288+16
CNSTI4 16
ASGNI4
line 158
;158:	s_serverinfo.banner.string		  = "SERVER INFO";
ADDRGP4 s_serverinfo+288+64
ADDRGP4 $119
ASGNP4
line 159
;159:	s_serverinfo.banner.color	      = color_white;
ADDRGP4 s_serverinfo+288+72
ADDRGP4 color_white
ASGNP4
line 160
;160:	s_serverinfo.banner.style	      = UI_CENTER;
ADDRGP4 s_serverinfo+288+68
CNSTI4 1
ASGNI4
line 162
;161:
;162:	s_serverinfo.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_serverinfo+364
CNSTI4 6
ASGNI4
line 163
;163:	s_serverinfo.framel.generic.name  = SERVERINFO_FRAMEL;
ADDRGP4 s_serverinfo+364+4
ADDRGP4 $69
ASGNP4
line 164
;164:	s_serverinfo.framel.generic.flags = QMF_INACTIVE;
ADDRGP4 s_serverinfo+364+44
CNSTU4 16384
ASGNU4
line 165
;165:	s_serverinfo.framel.generic.x	  = 0;  
ADDRGP4 s_serverinfo+364+12
CNSTI4 0
ASGNI4
line 166
;166:	s_serverinfo.framel.generic.y	  = 78;
ADDRGP4 s_serverinfo+364+16
CNSTI4 78
ASGNI4
line 167
;167:	s_serverinfo.framel.width  	      = 256;
ADDRGP4 s_serverinfo+364+80
CNSTI4 256
ASGNI4
line 168
;168:	s_serverinfo.framel.height  	  = 329;
ADDRGP4 s_serverinfo+364+84
CNSTI4 329
ASGNI4
line 170
;169:
;170:	s_serverinfo.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_serverinfo+456
CNSTI4 6
ASGNI4
line 171
;171:	s_serverinfo.framer.generic.name  = SERVERINFO_FRAMER;
ADDRGP4 s_serverinfo+456+4
ADDRGP4 $70
ASGNP4
line 172
;172:	s_serverinfo.framer.generic.flags = QMF_INACTIVE;
ADDRGP4 s_serverinfo+456+44
CNSTU4 16384
ASGNU4
line 173
;173:	s_serverinfo.framer.generic.x	  = 376;
ADDRGP4 s_serverinfo+456+12
CNSTI4 376
ASGNI4
line 174
;174:	s_serverinfo.framer.generic.y	  = 76;
ADDRGP4 s_serverinfo+456+16
CNSTI4 76
ASGNI4
line 175
;175:	s_serverinfo.framer.width  	      = 256;
ADDRGP4 s_serverinfo+456+80
CNSTI4 256
ASGNI4
line 176
;176:	s_serverinfo.framer.height  	  = 334;
ADDRGP4 s_serverinfo+456+84
CNSTI4 334
ASGNI4
line 178
;177:
;178:	s_serverinfo.add.generic.type	  = MTYPE_PTEXT;
ADDRGP4 s_serverinfo+640
CNSTI4 9
ASGNI4
line 179
;179:	s_serverinfo.add.generic.flags    = QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_serverinfo+640+44
CNSTU4 264
ASGNU4
line 180
;180:	s_serverinfo.add.generic.callback = ServerInfo_Event;
ADDRGP4 s_serverinfo+640+48
ADDRGP4 ServerInfo_Event
ASGNP4
line 181
;181:	s_serverinfo.add.generic.id	      = ID_ADD;
ADDRGP4 s_serverinfo+640+8
CNSTI4 100
ASGNI4
line 182
;182:	s_serverinfo.add.generic.x		  = 320;
ADDRGP4 s_serverinfo+640+12
CNSTI4 320
ASGNI4
line 183
;183:	s_serverinfo.add.generic.y		  = 371;
ADDRGP4 s_serverinfo+640+16
CNSTI4 371
ASGNI4
line 184
;184:	s_serverinfo.add.string  		  = "ADD TO FAVORITES";
ADDRGP4 s_serverinfo+640+64
ADDRGP4 $163
ASGNP4
line 185
;185:	s_serverinfo.add.style  		  = UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_serverinfo+640+68
CNSTI4 17
ASGNI4
line 186
;186:	s_serverinfo.add.color			  =	color_red;
ADDRGP4 s_serverinfo+640+72
ADDRGP4 color_red
ASGNP4
line 187
;187:	if( trap_Cvar_VariableValue( "sv_running" ) ) {
ADDRGP4 $170
ARGP4
ADDRLP4 4116
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4116
INDIRF4
CNSTF4 0
EQF4 $168
line 188
;188:		s_serverinfo.add.generic.flags |= QMF_GRAYED;
ADDRLP4 4120
ADDRGP4 s_serverinfo+640+44
ASGNP4
ADDRLP4 4120
INDIRP4
ADDRLP4 4120
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 189
;189:	}
LABELV $168
line 191
;190:
;191:	s_serverinfo.back.generic.type	   = MTYPE_BITMAP;
ADDRGP4 s_serverinfo+548
CNSTI4 6
ASGNI4
line 192
;192:	s_serverinfo.back.generic.name     = SERVERINFO_BACK0;
ADDRGP4 s_serverinfo+548+4
ADDRGP4 $71
ASGNP4
line 193
;193:	s_serverinfo.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_serverinfo+548+44
CNSTU4 260
ASGNU4
line 194
;194:	s_serverinfo.back.generic.callback = ServerInfo_Event;
ADDRGP4 s_serverinfo+548+48
ADDRGP4 ServerInfo_Event
ASGNP4
line 195
;195:	s_serverinfo.back.generic.id	   = ID_BACK;
ADDRGP4 s_serverinfo+548+8
CNSTI4 101
ASGNI4
line 196
;196:	s_serverinfo.back.generic.x		   = 0;
ADDRGP4 s_serverinfo+548+12
CNSTI4 0
ASGNI4
line 197
;197:	s_serverinfo.back.generic.y		   = 480-64;
ADDRGP4 s_serverinfo+548+16
CNSTI4 416
ASGNI4
line 198
;198:	s_serverinfo.back.width  		   = 128;
ADDRGP4 s_serverinfo+548+80
CNSTI4 128
ASGNI4
line 199
;199:	s_serverinfo.back.height  		   = 64;
ADDRGP4 s_serverinfo+548+84
CNSTI4 64
ASGNI4
line 200
;200:	s_serverinfo.back.focuspic         = SERVERINFO_BACK1;
ADDRGP4 s_serverinfo+548+64
ADDRGP4 $72
ASGNP4
line 202
;201:
;202:	trap_GetConfigString( CS_SERVERINFO, s_serverinfo.info, MAX_INFO_STRING );
CNSTI4 0
ARGI4
ADDRGP4 s_serverinfo+824
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 204
;203:
;204:	max = 0;
ADDRLP4 4112
CNSTI4 0
ASGNI4
line 205
;205:	s = s_serverinfo.info;
ADDRLP4 3080
ADDRGP4 s_serverinfo+824
ASGNP4
ADDRGP4 $195
JUMPV
LABELV $194
line 206
;206:	while ( s ) {
line 207
;207:		Info_NextPair( &s, key, value );
ADDRLP4 3080
ARGP4
ADDRLP4 2056
ARGP4
ADDRLP4 3088
ARGP4
ADDRGP4 Info_NextPair
CALLV
pop
line 208
;208:		if ( !key[0] ) {
ADDRLP4 2056
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $197
line 209
;209:			break;
ADDRGP4 $196
JUMPV
LABELV $197
line 211
;210:		}
;211:		len = strlen( key );
ADDRLP4 2056
ARGP4
ADDRLP4 4120
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 4120
INDIRI4
ASGNI4
line 212
;212:		if ( len > max )
ADDRLP4 4
INDIRI4
ADDRLP4 4112
INDIRI4
LEI4 $199
line 213
;213:			max = len;
ADDRLP4 4112
ADDRLP4 4
INDIRI4
ASGNI4
LABELV $199
line 214
;214:	}
LABELV $195
line 206
ADDRLP4 3080
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $194
LABELV $196
line 216
;215:
;216:	s_serverinfo.list.generic.type		= MTYPE_SCROLLLIST;
ADDRGP4 s_serverinfo+716
CNSTI4 8
ASGNI4
line 217
;217:	s_serverinfo.list.generic.flags		= QMF_PULSEIFFOCUS;
ADDRGP4 s_serverinfo+716+44
CNSTU4 256
ASGNU4
line 218
;218:	s_serverinfo.list.generic.id		= 123;
ADDRGP4 s_serverinfo+716+8
CNSTI4 123
ASGNI4
line 219
;219:	s_serverinfo.list.generic.x			= 120;
ADDRGP4 s_serverinfo+716+12
CNSTI4 120
ASGNI4
line 220
;220:	s_serverinfo.list.generic.y			= 132;
ADDRGP4 s_serverinfo+716+16
CNSTI4 132
ASGNI4
line 221
;221:	s_serverinfo.list.width				= INFO_LINE_WIDTH;
ADDRGP4 s_serverinfo+716+92
CNSTI4 51
ASGNI4
line 222
;222:	s_serverinfo.list.height			= 14;
ADDRGP4 s_serverinfo+716+96
CNSTI4 14
ASGNI4
line 223
;223:	s_serverinfo.list.columns			= 1;
ADDRGP4 s_serverinfo+716+100
CNSTI4 1
ASGNI4
line 224
;224:	s_serverinfo.list.scroll			= 1;
ADDRGP4 s_serverinfo+716+80
CNSTI4 1
ASGNI4
line 226
;225:
;226:	s_serverinfo.list.itemnames = (const char **)itemnames;
ADDRGP4 s_serverinfo+716+88
ADDRGP4 itemnames
ASGNP4
line 228
;227:
;228:	s_serverinfo.list.numitems = 0;
ADDRGP4 s_serverinfo+716+72
CNSTI4 0
ASGNI4
line 229
;229:	s = s_serverinfo.info;
ADDRLP4 3080
ADDRGP4 s_serverinfo+824
ASGNP4
ADDRGP4 $224
JUMPV
LABELV $223
line 230
;230:	while ( s ) {
line 231
;231:		Info_NextPair( &s, key, value );
ADDRLP4 3080
ARGP4
ADDRLP4 2056
ARGP4
ADDRLP4 3088
ARGP4
ADDRGP4 Info_NextPair
CALLV
pop
line 232
;232:		if ( !key[0] || s_serverinfo.list.numitems >= MAX_INFO_LINES )
ADDRLP4 2056
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $230
ADDRGP4 s_serverinfo+716+72
INDIRI4
CNSTI4 64
LTI4 $226
LABELV $230
line 233
;233:			break;
ADDRGP4 $225
JUMPV
LABELV $226
line 235
;234:
;235:		str = show_info[s_serverinfo.list.numitems];
ADDRLP4 3084
ADDRGP4 s_serverinfo+716+72
INDIRI4
CNSTI4 153
MULI4
ADDRGP4 show_info
ADDP4
ASGNP4
line 236
;236:		s_serverinfo.list.itemnames[s_serverinfo.list.numitems] = str;
ADDRGP4 s_serverinfo+716+72
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_serverinfo+716+88
INDIRP4
ADDP4
ADDRLP4 3084
INDIRP4
ASGNP4
line 238
;237:		
;238:		len = strlen( key );
ADDRLP4 2056
ARGP4
ADDRLP4 4120
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 4120
INDIRI4
ASGNI4
line 239
;239:		len = max - len; 
ADDRLP4 4
ADDRLP4 4112
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 242
;240:
;241:		// align key name
;242:		for ( i = 0; i < len; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $240
JUMPV
LABELV $237
line 243
;243:			buf[i] = ' ';
ADDRLP4 0
INDIRI4
ADDRLP4 8
ADDP4
CNSTI1 32
ASGNI1
LABELV $238
line 242
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $240
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $237
line 244
;244:		BG_sprintf( buf + i, "%s ^3%s", key, value );
ADDRLP4 0
INDIRI4
ADDRLP4 8
ADDP4
ARGP4
ADDRGP4 $241
ARGP4
ADDRLP4 2056
ARGP4
ADDRLP4 3088
ARGP4
ADDRGP4 BG_sprintf
CALLI4
pop
line 247
;245:
;246:		// take care about overflow in destination string
;247:		buf[INFO_LINE_WIDTH*3-1] = '\0';
ADDRLP4 8+152
CNSTI1 0
ASGNI1
line 248
;248:		strcpy( str, buf );
ADDRLP4 3084
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 249
;249:		s_serverinfo.list.numitems++;
ADDRLP4 4124
ADDRGP4 s_serverinfo+716+72
ASGNP4
ADDRLP4 4124
INDIRP4
ADDRLP4 4124
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 250
;250:	}
LABELV $224
line 230
ADDRLP4 3080
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $223
LABELV $225
line 252
;251:
;252:	Menu_AddItem( &s_serverinfo.menu, (void*) &s_serverinfo.banner );
ADDRGP4 s_serverinfo
ARGP4
ADDRGP4 s_serverinfo+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 253
;253:	Menu_AddItem( &s_serverinfo.menu, (void*) &s_serverinfo.framel );
ADDRGP4 s_serverinfo
ARGP4
ADDRGP4 s_serverinfo+364
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 254
;254:	Menu_AddItem( &s_serverinfo.menu, (void*) &s_serverinfo.framer );
ADDRGP4 s_serverinfo
ARGP4
ADDRGP4 s_serverinfo+456
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 255
;255:	Menu_AddItem( &s_serverinfo.menu, (void*) &s_serverinfo.add );
ADDRGP4 s_serverinfo
ARGP4
ADDRGP4 s_serverinfo+640
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 256
;256:	Menu_AddItem( &s_serverinfo.menu, (void*) &s_serverinfo.back );
ADDRGP4 s_serverinfo
ARGP4
ADDRGP4 s_serverinfo+548
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 257
;257:	Menu_AddItem( &s_serverinfo.menu, (void*) &s_serverinfo.list );
ADDRGP4 s_serverinfo
ARGP4
ADDRGP4 s_serverinfo+716
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 259
;258:
;259:	UI_PushMenu( &s_serverinfo.menu );
ADDRGP4 s_serverinfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 260
;260:}
LABELV $108
endproc UI_ServerInfoMenu 4128 16
bss
align 1
LABELV show_info
skip 9792
align 4
LABELV itemnames
skip 256
align 4
LABELV s_serverinfo
skip 1848
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
LABELV $241
byte 1 37
byte 1 115
byte 1 32
byte 1 94
byte 1 51
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $170
byte 1 115
byte 1 118
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
LABELV $163
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 84
byte 1 79
byte 1 32
byte 1 70
byte 1 65
byte 1 86
byte 1 79
byte 1 82
byte 1 73
byte 1 84
byte 1 69
byte 1 83
byte 1 0
align 1
LABELV $119
byte 1 83
byte 1 69
byte 1 82
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
LABELV $82
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $75
byte 1 99
byte 1 108
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 65
byte 1 100
byte 1 100
byte 1 114
byte 1 101
byte 1 115
byte 1 115
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
