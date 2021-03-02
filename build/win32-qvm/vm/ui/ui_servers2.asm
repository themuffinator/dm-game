data
align 4
LABELV master_items
address $69
address $70
address $71
byte 4 0
align 4
LABELV servertype_items
address $72
address $73
address $74
address $75
address $76
byte 4 0
align 4
LABELV sortkey_items
address $77
address $78
address $79
address $80
address $81
byte 4 0
align 4
LABELV netnames
address $82
address $83
address $84
byte 4 0
lit
align 1
LABELV quake3worldMessage
byte 1 86
byte 1 105
byte 1 115
byte 1 105
byte 1 116
byte 1 32
byte 1 119
byte 1 119
byte 1 119
byte 1 46
byte 1 113
byte 1 117
byte 1 97
byte 1 107
byte 1 101
byte 1 51
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 46
byte 1 99
byte 1 111
byte 1 109
byte 1 32
byte 1 45
byte 1 32
byte 1 78
byte 1 101
byte 1 119
byte 1 115
byte 1 44
byte 1 32
byte 1 67
byte 1 111
byte 1 109
byte 1 109
byte 1 117
byte 1 110
byte 1 105
byte 1 116
byte 1 121
byte 1 44
byte 1 32
byte 1 69
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 44
byte 1 32
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 115
byte 1 0
data
export punkbuster_items
align 4
LABELV punkbuster_items
address $85
address $86
byte 4 0
export punkbuster_msg
align 4
LABELV punkbuster_msg
address $87
address $88
address $89
address $90
byte 4 0
code
proc ArenaServers_DrawFilter 56 20
file "..\..\..\..\code\q3_ui\ui_servers2.c"
line 221
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:MULTIPLAYER MENU (SERVER BROWSER)
;7:
;8:=======================================================================
;9:*/
;10:
;11:
;12:#include "ui_local.h"
;13:#include "../qcommon/q_shared.h"
;14:
;15:
;16:#define REFRESH_DELAY			10	  // in ms
;17:#define MAX_RESPONSE_TIME		10000 // in ms
;18:#define MAX_GLOBALSERVERS		MAX_GLOBAL_SERVERS
;19:#define MAX_PINGLISTSIZE		MAX_PINGREQUESTS*8
;20:#define MAX_ADDRESSLENGTH		64
;21:#define MAX_HOSTNAMELENGTH		26
;22:#define MAX_MAPNAMELENGTH		11
;23:#define MAX_GAMENAMELENGTH		8
;24:#define MAX_LISTBOXITEMS		512
;25:#define MAX_LOCALSERVERS		512
;26:#define MAX_STATUSLENGTH		64
;27:
;28:#define MAX_LISTBOXWIDTH		MAX_HOSTNAMELENGTH + 1 + MAX_MAPNAMELENGTH + 1 + 5 /*players/max*/ + 1 + MAX_GAMENAMELENGTH + 1 + 3 /*netname*/ + 1 + 3 /*ping*/
;29:
;30:#define MAX_LISTBOXWIDTH_BUF	MAX_LISTBOXWIDTH + 2 /*color ping */ + 1 /*zero termination*/
;31:
;32:#define FILTER_CAPTION_CHARS	13
;33:
;34:#define ART_BACK0				"menu/art/back_0"
;35:#define ART_BACK1				"menu/art/back_1"
;36:#define ART_CREATE0				"menu/art/create_0"
;37:#define ART_CREATE1				"menu/art/create_1"
;38:#define ART_SPECIFY0			"menu/art/specify_0"
;39:#define ART_SPECIFY1			"menu/art/specify_1"
;40:#define ART_REFRESH0			"menu/art/refresh_0"
;41:#define ART_REFRESH1			"menu/art/refresh_1"
;42:#define ART_CONNECT0			"menu/art/fight_0"
;43:#define ART_CONNECT1			"menu/art/fight_1"
;44:#define ART_ARROWS0				"menu/art/arrows_vert_0"
;45:#define ART_ARROWS_UP			"menu/art/arrows_vert_top"
;46:#define ART_ARROWS_DOWN			"menu/art/arrows_vert_bot"
;47:#define ART_UNKNOWNMAP			"menu/art/unknownmap"
;48:#define ART_REMOVE0				"menu/art/delete_0"
;49:#define ART_REMOVE1				"menu/art/delete_1"
;50:
;51:#define ID_MASTER			10
;52:#define ID_GAMETYPE			11
;53:#define ID_SORTKEY			12
;54:#define ID_SHOW_FULL		13
;55:#define ID_SHOW_EMPTY		14
;56:#define ID_LIST				15
;57:#define ID_SCROLL_UP		16
;58:#define ID_SCROLL_DOWN		17
;59:#define ID_BACK				18
;60:#define ID_REFRESH			19
;61:#define ID_SPECIFY			20
;62:#define ID_CREATE			21
;63:#define ID_CONNECT			22
;64:#define ID_REMOVE			23
;65:#define ID_FILTER			24
;66:
;67:#define GR_LOGO				30
;68:#define GR_LETTERS			31
;69:
;70:#define SORT_HOST			0
;71:#define SORT_MAP			1
;72:#define SORT_CLIENTS		2
;73:#define SORT_GAME			3
;74:#define SORT_PING			4
;75:
;76:#define GAMES_ALL			0
;77:#define GAMES_FFA			1
;78:#define GAMES_TOURNEY		2
;79:#define GAMES_TEAMPLAY		3
;80:#define GAMES_CTF			4
;81:
;82:static const char *master_items[] = {
;83:	"Local",
;84:	"Internet",
;85:	"Favorites",
;86:	NULL
;87:};
;88:
;89:static const char *servertype_items[] = {
;90:	"All",
;91:	"Free For All",
;92:	"Tournament",
;93:	"Team Deathmatch",
;94:	"Capture the Flag",
;95:	NULL
;96:};
;97:
;98:static const char *sortkey_items[] = {
;99:	"Server Name",
;100:	"Map Name",
;101:	"Open Player Spots",
;102:	"Game Type",
;103:	"Ping Time",
;104:	NULL
;105:};
;106:
;107:static char* netnames[] = {
;108:	"???",
;109:	"UDP",
;110:	"IPX",
;111:	NULL
;112:};
;113:
;114:static char quake3worldMessage[] = "Visit www.quake3world.com - News, Community, Events, Files";
;115:
;116:const char* punkbuster_items[] = {
;117:	"Disabled",
;118:	"Enabled",
;119:	NULL
;120:};
;121:
;122:const char* punkbuster_msg[] = {
;123:	"PunkBuster will be",
;124:	"disabled the next time",
;125:	"Quake III Arena",
;126:	"is started.",
;127:	NULL
;128:};
;129:
;130:typedef struct {
;131:	char	adrstr[MAX_ADDRESSLENGTH];
;132:	int		start;
;133:} pinglist_t;
;134:
;135:typedef struct servernode_s {
;136:	char	adrstr[MAX_ADDRESSLENGTH];
;137:	char	hostname[MAX_HOSTNAMELENGTH+1];
;138:	char	mapname[MAX_MAPNAMELENGTH+1];
;139:	int		numclients;
;140:	int		maxclients;
;141:	int		pingtime;
;142:	int		gametype;
;143:	char	gamename[MAX_GAMENAMELENGTH+1];
;144:	int		nettype;
;145:	int		minPing;
;146:	int		maxPing;
;147:} servernode_t; 
;148:
;149:typedef struct {
;150:	char			buff[MAX_LISTBOXWIDTH_BUF];
;151:	servernode_t*	servernode;
;152:} table_t;
;153:
;154:typedef struct {
;155:	menuframework_s		menu;
;156:
;157:	menutext_s			banner;
;158:
;159:	menulist_s			master;
;160:	menulist_s			gametype;
;161:	menulist_s			sortkey;
;162:	menuradiobutton_s	showfull;
;163:	menuradiobutton_s	showempty;
;164:
;165:	menulist_s			list;
;166:	menubitmap_s		mappic;
;167:	menubitmap_s		arrows;
;168:	menubitmap_s		up;
;169:	menubitmap_s		down;
;170:	menutext_s			status;
;171:	menutext_s			statusbar;
;172:
;173:	menubitmap_s		remove;
;174:	menubitmap_s		back;
;175:	menubitmap_s		refresh;
;176:	menubitmap_s		specify;
;177:	menubitmap_s		create;
;178:	menubitmap_s		go;
;179:
;180:	menufield_s			filter;
;181:
;182:	pinglist_t			pinglist[MAX_PINGLISTSIZE];
;183:	table_t				table[MAX_LISTBOXITEMS];
;184:	char*				items[MAX_LISTBOXITEMS];
;185:	int					numqueriedservers;
;186:	int					*numservers;
;187:	servernode_t		*serverlist;	
;188:	int					currentping;
;189:	qboolean			refreshservers;
;190:	int					nextpingtime;
;191:	int					maxservers;
;192:	int					refreshtime;
;193:	char				favoriteaddresses[MAX_FAVORITESERVERS][MAX_ADDRESSLENGTH];
;194:	int					numfavoriteaddresses;
;195:
;196:	char				serverfilter[ MAX_EDIT_LINE ];
;197:} arenaservers_t;
;198:
;199:static arenaservers_t	g_arenaservers;
;200:
;201:static servernode_t		g_globalserverlist[MAX_GLOBALSERVERS];
;202:static int				g_numglobalservers;
;203:static servernode_t		g_localserverlist[MAX_LOCALSERVERS];
;204:static int				g_numlocalservers;
;205:static servernode_t		g_favoriteserverlist[MAX_FAVORITESERVERS];
;206:static int				g_numfavoriteservers;
;207:static int				g_servertype;
;208:static int				g_gametype;
;209:static int				g_sortkey;
;210:static int				g_emptyservers;
;211:static int				g_fullservers;
;212:
;213:static void ArenaServers_UpdateList( void );
;214:static void ArenaServers_UpdatePicture( void );
;215:
;216:/*
;217:=================
;218:ArenaServers_DrawFilter
;219:=================
;220:*/
;221:static void ArenaServers_DrawFilter( void *self ) {
line 230
;222:	menufield_s		*f;
;223:	qboolean		focus;
;224:	int				style;
;225:	char			*txt;
;226:	char			c;
;227:	float			*color;
;228:	int				basex, x, y;
;229:
;230:	f = (menufield_s*)self;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
line 231
;231:	basex = f->generic.x;
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 232
;232:	y = f->generic.y;
ADDRLP4 20
ADDRLP4 24
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 233
;233:	focus = (f->generic.parent->cursor == f->generic.menuPosition);
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
NEI4 $96
ADDRLP4 36
CNSTI4 1
ASGNI4
ADDRGP4 $97
JUMPV
LABELV $96
ADDRLP4 36
CNSTI4 0
ASGNI4
LABELV $97
ADDRLP4 32
ADDRLP4 36
INDIRI4
ASGNI4
line 235
;234:
;235:	style = UI_LEFT|UI_SMALLFONT;
ADDRLP4 12
CNSTI4 16
ASGNI4
line 236
;236:	color = text_color_normal;
ADDRLP4 16
ADDRGP4 text_color_normal
ASGNP4
line 238
;237:
;238:	if( focus ) {
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $98
line 239
;239:		style |= UI_PULSE;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 240
;240:		color = text_color_highlight;
ADDRLP4 16
ADDRGP4 text_color_highlight
ASGNP4
line 241
;241:	}
LABELV $98
line 243
;242:
;243:	UI_DrawString( basex, y, "Filter Name:", style, color );
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 $100
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
line 245
;244:
;245:	basex += FILTER_CAPTION_CHARS * SMALLCHAR_WIDTH;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 104
ADDI4
ASGNI4
line 247
;246:	//y += PROP_HEIGHT;
;247:	txt = f->field.buffer;
ADDRLP4 0
ADDRLP4 24
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
line 248
;248:	x = basex;
ADDRLP4 8
ADDRLP4 28
INDIRI4
ASGNI4
line 250
;249:
;250:	if ( strcmp( g_arenaservers.serverfilter, f->field.buffer) ) {
ADDRGP4 g_arenaservers+57676
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 76
ADDP4
ARGP4
ADDRLP4 44
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $101
line 251
;251:		strcpy( g_arenaservers.serverfilter, f->field.buffer );
ADDRGP4 g_arenaservers+57676
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 76
ADDP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 252
;252:		ArenaServers_UpdateList();
ADDRGP4 ArenaServers_UpdateList
CALLV
pop
line 253
;253:		ArenaServers_UpdatePicture();
ADDRGP4 ArenaServers_UpdatePicture
CALLV
pop
line 254
;254:	}
LABELV $101
line 257
;255:
;256:	// mark input by color depending from filter result
;257:	if ( !g_arenaservers.list.numitems && f->field.buffer[0] && *g_arenaservers.numservers ) 
ADDRGP4 g_arenaservers+824+72
INDIRI4
CNSTI4 0
NEI4 $105
ADDRLP4 24
INDIRP4
CNSTI4 76
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $105
ADDRGP4 g_arenaservers+56620
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $105
line 258
;258:		color = g_color_table[ ColorIndex( COLOR_RED ) ];
ADDRLP4 16
ADDRGP4 g_color_table+16
ASGNP4
ADDRGP4 $113
JUMPV
LABELV $105
line 260
;259:	else
;260:		color = g_color_table[ ColorIndex( COLOR_WHITE ) ];
ADDRLP4 16
ADDRGP4 g_color_table+112
ASGNP4
ADDRGP4 $113
JUMPV
LABELV $112
line 262
;261:
;262:	while ( (c = *txt) != '\0' ) {
line 263
;263:		UI_DrawChar( x, y, c, style, color );
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
line 264
;264:		x += SMALLCHAR_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 8
ADDI4
ASGNI4
line 265
;265:		txt++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 266
;266:	}
LABELV $113
line 262
ADDRLP4 48
ADDRLP4 0
INDIRP4
INDIRI1
ASGNI1
ADDRLP4 4
ADDRLP4 48
INDIRI1
ASGNI1
ADDRLP4 48
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $112
line 269
;267:
;268:	// draw cursor if we have focus
;269:	if ( focus ) {
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $115
line 270
;270:		if ( trap_Key_GetOverstrikeMode() ) {
ADDRLP4 52
ADDRGP4 trap_Key_GetOverstrikeMode
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $117
line 271
;271:			c = 11;
ADDRLP4 4
CNSTI1 11
ASGNI1
line 272
;272:		} else {
ADDRGP4 $118
JUMPV
LABELV $117
line 273
;273:			c = 10;
ADDRLP4 4
CNSTI1 10
ASGNI1
line 274
;274:		}
LABELV $118
line 276
;275:
;276:		style &= ~UI_PULSE;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 277
;277:		style |= UI_BLINK;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 279
;278:
;279:		UI_DrawChar( basex + f->field.cursor * SMALLCHAR_WIDTH, y, c, style, color );
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
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 UI_DrawChar
CALLV
pop
line 280
;280:	}
LABELV $115
line 281
;281:}
LABELV $94
endproc ArenaServers_DrawFilter 56 20
proc ArenaServers_MaxPing 8 4
line 289
;282:
;283:
;284:/*
;285:=================
;286:ArenaServers_MaxPing
;287:=================
;288:*/
;289:static int ArenaServers_MaxPing( void ) {
line 292
;290:	int		maxPing;
;291:
;292:	maxPing = (int)trap_Cvar_VariableValue( "cl_maxPing" );
ADDRGP4 $120
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 293
;293:	if( maxPing < 100 ) {
ADDRLP4 0
INDIRI4
CNSTI4 100
GEI4 $121
line 294
;294:		maxPing = 100;
ADDRLP4 0
CNSTI4 100
ASGNI4
line 295
;295:	}
LABELV $121
line 296
;296:	return maxPing;
ADDRLP4 0
INDIRI4
RETI4
LABELV $119
endproc ArenaServers_MaxPing 8 4
proc ArenaServers_Compare 44 8
line 305
;297:}
;298:
;299:
;300:/*
;301:=================
;302:ArenaServers_Compare
;303:=================
;304:*/
;305:static int QDECL ArenaServers_Compare( const void *arg1, const void *arg2 ) {
line 312
;306:	float			f1;
;307:	float			f2;
;308:	servernode_t*	t1;
;309:	servernode_t*	t2;
;310:	int			result;
;311:
;312:	t1 = (servernode_t *)arg1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 313
;313:	t2 = (servernode_t *)arg2;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
line 315
;314:
;315:	switch( g_sortkey ) {
ADDRLP4 20
ADDRGP4 g_sortkey
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
LTI4 $124
ADDRLP4 20
INDIRI4
CNSTI4 4
GTI4 $124
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $153
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $153
address $126
address $127
address $134
address $143
address $148
code
LABELV $126
line 317
;316:	case SORT_HOST:
;317:		return Q_stricmp( t1->hostname, t2->hostname );
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
RETI4
ADDRGP4 $123
JUMPV
LABELV $127
line 320
;318:
;319:	case SORT_MAP:
;320:		result = Q_stricmp( t1->mapname, t2->mapname );
ADDRLP4 0
INDIRP4
CNSTI4 91
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 91
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 28
INDIRI4
ASGNI4
line 321
;321:		if ( !result ) {
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $128
line 322
;322:			if( t1->pingtime < t2->pingtime ) {
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
GEI4 $130
line 323
;323:				return -1;
CNSTI4 -1
RETI4
ADDRGP4 $123
JUMPV
LABELV $130
line 325
;324:			}
;325:			if( t1->pingtime > t2->pingtime ) {
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
LEI4 $132
line 326
;326:				return 1;
CNSTI4 1
RETI4
ADDRGP4 $123
JUMPV
LABELV $132
line 328
;327:			}				
;328:		}
LABELV $128
line 329
;329:		return result;
ADDRLP4 16
INDIRI4
RETI4
ADDRGP4 $123
JUMPV
LABELV $134
line 331
;330:	case SORT_CLIENTS:
;331:		f1 = t1->maxclients - t1->numclients;
ADDRLP4 32
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 32
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 332
;332:		if( f1 < 0 ) {
ADDRLP4 8
INDIRF4
CNSTF4 0
GEF4 $135
line 333
;333:			f1 = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 334
;334:		}
LABELV $135
line 336
;335:
;336:		f2 = t2->maxclients - t2->numclients;
ADDRLP4 36
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 36
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ADDRLP4 36
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 337
;337:		if( f2 < 0 ) {
ADDRLP4 12
INDIRF4
CNSTF4 0
GEF4 $137
line 338
;338:			f2 = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 339
;339:		}
LABELV $137
line 341
;340:
;341:		if( f1 < f2 ) {
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
GEF4 $139
line 342
;342:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $123
JUMPV
LABELV $139
line 344
;343:		}
;344:		if( f1 == f2 ) {
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
NEF4 $141
line 345
;345:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $123
JUMPV
LABELV $141
line 347
;346:		}
;347:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $123
JUMPV
LABELV $143
line 350
;348:
;349:	case SORT_GAME:
;350:		if( t1->gametype < t2->gametype ) {
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
GEI4 $144
line 351
;351:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $123
JUMPV
LABELV $144
line 353
;352:		}
;353:		if( t1->gametype == t2->gametype ) {
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
NEI4 $146
line 354
;354:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $123
JUMPV
LABELV $146
line 356
;355:		}
;356:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $123
JUMPV
LABELV $148
line 359
;357:
;358:	case SORT_PING:
;359:		if( t1->pingtime < t2->pingtime ) {
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
GEI4 $149
line 360
;360:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $123
JUMPV
LABELV $149
line 362
;361:		}
;362:		if( t1->pingtime > t2->pingtime ) {
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
LEI4 $151
line 363
;363:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $123
JUMPV
LABELV $151
line 365
;364:		}
;365:		return Q_stricmp( t1->hostname, t2->hostname );
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
RETI4
ADDRGP4 $123
JUMPV
LABELV $124
line 368
;366:	}
;367:
;368:	return 0;
CNSTI4 0
RETI4
LABELV $123
endproc ArenaServers_Compare 44 8
proc ArenaServers_Go 8 8
line 377
;369:}
;370:
;371:
;372:/*
;373:=================
;374:ArenaServers_Go
;375:=================
;376:*/
;377:static void ArenaServers_Go( void ) {
line 380
;378:	const servernode_t* servernode;
;379:
;380:	servernode = g_arenaservers.table[ g_arenaservers.list.curvalue ].servernode;
ADDRLP4 0
ADDRGP4 g_arenaservers+824+68
INDIRI4
CNSTI4 68
MULI4
ADDRGP4 g_arenaservers+19752+64
ADDP4
INDIRP4
ASGNP4
line 381
;381:	if ( servernode ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $159
line 382
;382:		trap_Cmd_ExecuteText( EXEC_APPEND, va( "connect %s\n", servernode->adrstr ) );
ADDRGP4 $161
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 383
;383:	}
LABELV $159
line 384
;384:}
LABELV $154
endproc ArenaServers_Go 8 8
proc ArenaServers_Dblclick 0 0
line 392
;385:
;386:
;387:/*
;388:=================
;389:ArenaServers_Dblclick
;390:=================
;391:*/
;392:static void ArenaServers_Dblclick( void * self ) {
line 393
;393:	ArenaServers_Go();
ADDRGP4 ArenaServers_Go
CALLV
pop
line 394
;394:}
LABELV $162
endproc ArenaServers_Dblclick 0 0
bss
align 1
LABELV $164
skip 64
code
proc ArenaServers_UpdatePicture 4 16
line 402
;395:
;396:
;397:/*
;398:=================
;399:ArenaServers_UpdatePicture
;400:=================
;401:*/
;402:static void ArenaServers_UpdatePicture( void ) {
line 406
;403:	static char		picname[ MAX_QPATH ];
;404:	const servernode_t* servernodeptr;
;405:
;406:	if ( !g_arenaservers.list.numitems ) {
ADDRGP4 g_arenaservers+824+72
INDIRI4
CNSTI4 0
NEI4 $165
line 407
;407:		g_arenaservers.mappic.generic.name = NULL;
ADDRGP4 g_arenaservers+932+4
CNSTP4 0
ASGNP4
line 408
;408:	}
ADDRGP4 $166
JUMPV
LABELV $165
line 409
;409:	else {
line 410
;410:		servernodeptr = g_arenaservers.table[ g_arenaservers.list.curvalue ].servernode;
ADDRLP4 0
ADDRGP4 g_arenaservers+824+68
INDIRI4
CNSTI4 68
MULI4
ADDRGP4 g_arenaservers+19752+64
ADDP4
INDIRP4
ASGNP4
line 411
;411:		Com_sprintf( picname, sizeof(picname), "levelshots/%s.tga", servernodeptr->mapname );
ADDRGP4 $164
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $175
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 91
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 412
;412:		g_arenaservers.mappic.generic.name = picname;
ADDRGP4 g_arenaservers+932+4
ADDRGP4 $164
ASGNP4
line 414
;413:	
;414:	}
LABELV $166
line 417
;415:
;416:	// force shader update during draw
;417:	g_arenaservers.mappic.shader = 0;
ADDRGP4 g_arenaservers+932+72
CNSTI4 0
ASGNI4
line 418
;418:}
LABELV $163
endproc ArenaServers_UpdatePicture 4 16
proc ArenaServers_UpdateList 48 68
line 427
;419:
;420:
;421:/*
;422:=================
;423:ArenaServers_UpdateList
;424:=================
;425:*/
;426:static void ArenaServers_UpdateList( void )
;427:{
line 436
;428:	int				i;
;429:	int				j;
;430:	int				count;
;431:	servernode_t*	servernodeptr;
;432:	table_t*		tableptr;
;433:	const char		*pingColor;
;434:
;435:	// build list box strings - apply culling filters
;436:	servernodeptr = g_arenaservers.serverlist;
ADDRLP4 0
ADDRGP4 g_arenaservers+56624
INDIRP4
ASGNP4
line 437
;437:	count         = *g_arenaservers.numservers;
ADDRLP4 20
ADDRGP4 g_arenaservers+56620
INDIRP4
INDIRI4
ASGNI4
line 438
;438:	for( i = 0, j = 0; i < count; i++, servernodeptr++ ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $186
JUMPV
LABELV $183
line 439
;439:		tableptr = &g_arenaservers.table[j];
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 68
MULI4
ADDRGP4 g_arenaservers+19752
ADDP4
ASGNP4
line 440
;440:		tableptr->servernode = servernodeptr;
ADDRLP4 4
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 443
;441:
;442:		// can only cull valid results
;443:		if( !g_emptyservers && !servernodeptr->numclients ) {
ADDRGP4 g_emptyservers
INDIRI4
CNSTI4 0
NEI4 $188
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 0
NEI4 $188
line 444
;444:			continue;
ADDRGP4 $184
JUMPV
LABELV $188
line 447
;445:		}
;446:
;447:		if( !g_fullservers && ( servernodeptr->numclients == servernodeptr->maxclients ) ) {
ADDRGP4 g_fullservers
INDIRI4
CNSTI4 0
NEI4 $190
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
NEI4 $190
line 448
;448:			continue;
ADDRGP4 $184
JUMPV
LABELV $190
line 451
;449:		}
;450:
;451:		if ( g_arenaservers.serverfilter[0] && !Q_stristr( servernodeptr->hostname, g_arenaservers.serverfilter ) ) {
ADDRGP4 g_arenaservers+57676
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $192
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRGP4 g_arenaservers+57676
ARGP4
ADDRLP4 28
ADDRGP4 Q_stristr
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $192
line 452
;452:			continue;
ADDRGP4 $184
JUMPV
LABELV $192
line 455
;453:		}
;454:
;455:		switch( g_gametype ) {
ADDRLP4 32
ADDRGP4 g_gametype
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
LTI4 $196
ADDRLP4 32
INDIRI4
CNSTI4 4
GTI4 $196
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $211
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $211
address $197
address $199
address $205
address $202
address $208
code
line 457
;456:		case GAMES_ALL:
;457:			break;
LABELV $199
line 460
;458:
;459:		case GAMES_FFA:
;460:			if( servernodeptr->gametype != GT_FFA ) {
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
CNSTI4 1
EQI4 $197
line 461
;461:				continue;
ADDRGP4 $184
JUMPV
line 463
;462:			}
;463:			break;
LABELV $202
line 466
;464:
;465:		case GAMES_TEAMPLAY:
;466:			if( servernodeptr->gametype != GT_TDM ) {
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
CNSTI4 3
EQI4 $197
line 467
;467:				continue;
ADDRGP4 $184
JUMPV
line 469
;468:			}
;469:			break;
LABELV $205
line 472
;470:
;471:		case GAMES_TOURNEY:
;472:			if( servernodeptr->gametype != GT_DUEL ) {
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
CNSTI4 2
EQI4 $197
line 473
;473:				continue;
ADDRGP4 $184
JUMPV
line 475
;474:			}
;475:			break;
LABELV $208
line 478
;476:
;477:		case GAMES_CTF:
;478:			if ( servernodeptr->gametype != GT_CTF ) {
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
CNSTI4 4
EQI4 $197
line 479
;479:				continue;
ADDRGP4 $184
JUMPV
line 481
;480:			}
;481:			break;
LABELV $196
LABELV $197
line 484
;482:		}
;483:
;484:		if ( servernodeptr->pingtime < servernodeptr->minPing ) {
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 136
ADDP4
INDIRI4
GEI4 $212
line 485
;485:			pingColor = S_COLOR_BLUE;
ADDRLP4 16
ADDRGP4 $214
ASGNP4
line 486
;486:		}
ADDRGP4 $213
JUMPV
LABELV $212
line 487
;487:		else if ( servernodeptr->maxPing && servernodeptr->pingtime > servernodeptr->maxPing ) {
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
CNSTI4 0
EQI4 $215
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
LEI4 $215
line 488
;488:			pingColor = S_COLOR_BLUE;
ADDRLP4 16
ADDRGP4 $214
ASGNP4
line 489
;489:		}
ADDRGP4 $216
JUMPV
LABELV $215
line 490
;490:		else if ( servernodeptr->pingtime < 200 ) {
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
CNSTI4 200
GEI4 $217
line 491
;491:			pingColor = S_COLOR_GREEN;
ADDRLP4 16
ADDRGP4 $219
ASGNP4
line 492
;492:		}
ADDRGP4 $218
JUMPV
LABELV $217
line 493
;493:		else if( servernodeptr->pingtime < 400 ) {
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
CNSTI4 400
GEI4 $220
line 494
;494:			pingColor = S_COLOR_YELLOW;
ADDRLP4 16
ADDRGP4 $222
ASGNP4
line 495
;495:		}
ADDRGP4 $221
JUMPV
LABELV $220
line 496
;496:		else {
line 497
;497:			pingColor = S_COLOR_RED;
ADDRLP4 16
ADDRGP4 $223
ASGNP4
line 498
;498:		}
LABELV $221
LABELV $218
LABELV $216
LABELV $213
line 500
;499:
;500:		Com_sprintf( tableptr->buff, sizeof( tableptr->buff ), "%-*.*s %-*.*s %2d/%2d %-*.*s %3s %s%3d",
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $224
ARGP4
CNSTI4 26
ARGI4
CNSTI4 26
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
CNSTI4 11
ARGI4
CNSTI4 11
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 91
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ARGI4
CNSTI4 8
ARGI4
CNSTI4 8
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 120
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 netnames
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 507
;501:			MAX_HOSTNAMELENGTH, MAX_HOSTNAMELENGTH, servernodeptr->hostname,
;502:			MAX_MAPNAMELENGTH, MAX_MAPNAMELENGTH, servernodeptr->mapname,
;503:			servernodeptr->numclients, servernodeptr->maxclients,
;504:			MAX_GAMENAMELENGTH, MAX_GAMENAMELENGTH, servernodeptr->gamename,
;505:			netnames[ servernodeptr->nettype ],
;506:			pingColor, servernodeptr->pingtime );
;507:		j++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 508
;508:	}
LABELV $184
line 438
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
ASGNP4
LABELV $186
ADDRLP4 12
INDIRI4
ADDRLP4 20
INDIRI4
LTI4 $183
line 510
;509:
;510:	g_arenaservers.list.numitems = j;
ADDRGP4 g_arenaservers+824+72
ADDRLP4 8
INDIRI4
ASGNI4
line 511
;511:	g_arenaservers.list.curvalue = 0;
ADDRGP4 g_arenaservers+824+68
CNSTI4 0
ASGNI4
line 512
;512:	g_arenaservers.list.top      = 0;
ADDRGP4 g_arenaservers+824+76
CNSTI4 0
ASGNI4
line 513
;513:}
LABELV $180
endproc ArenaServers_UpdateList 48 68
proc ArenaServers_UpdateMenu 32 20
line 521
;514:
;515:
;516:/*
;517:=================
;518:ArenaServers_UpdateMenu
;519:=================
;520:*/
;521:static void ArenaServers_UpdateMenu( void ) {
line 523
;522:
;523:	if ( g_arenaservers.numqueriedservers > 0 )
ADDRGP4 g_arenaservers+56616
INDIRI4
CNSTI4 0
LEI4 $232
line 524
;524:	{
line 526
;525:		// servers found
;526:		if ( g_arenaservers.refreshservers && ( g_arenaservers.currentping <= g_arenaservers.numqueriedservers ) ) 
ADDRGP4 g_arenaservers+56632
INDIRI4
CNSTI4 0
EQI4 $235
ADDRGP4 g_arenaservers+56628
INDIRI4
ADDRGP4 g_arenaservers+56616
INDIRI4
GTI4 $235
line 527
;527:		{
line 529
;528:			// show progress
;529:			Com_sprintf( g_arenaservers.status.string, MAX_STATUSLENGTH, "%d of %d Arena Servers.", g_arenaservers.currentping, g_arenaservers.numqueriedservers);
ADDRGP4 g_arenaservers+1300+64
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $242
ARGP4
ADDRGP4 g_arenaservers+56628
INDIRI4
ARGI4
ADDRGP4 g_arenaservers+56616
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 530
;530:			g_arenaservers.statusbar.string  = "Press SPACE to stop";
ADDRGP4 g_arenaservers+1376+64
ADDRGP4 $247
ASGNP4
line 531
;531:			qsort( g_arenaservers.serverlist, *g_arenaservers.numservers, sizeof( servernode_t ), ArenaServers_Compare);
ADDRGP4 g_arenaservers+56624
INDIRP4
ARGP4
ADDRGP4 g_arenaservers+56620
INDIRP4
INDIRI4
ARGI4
CNSTI4 144
ARGI4
ADDRGP4 ArenaServers_Compare
ARGP4
ADDRGP4 qsort
CALLV
pop
line 532
;532:		}
ADDRGP4 $233
JUMPV
LABELV $235
line 534
;533:		else 
;534:		{
line 540
;535:			// all servers pinged - enable controls
;536:			//g_arenaservers.gametype.generic.flags	&= ~QMF_GRAYED;
;537:			//g_arenaservers.sortkey.generic.flags	&= ~QMF_GRAYED;
;538:			//g_arenaservers.showempty.generic.flags&= ~QMF_GRAYED;
;539:			//g_arenaservers.showfull.generic.flags	&= ~QMF_GRAYED;
;540:			g_arenaservers.list.generic.flags		&= ~QMF_GRAYED;
ADDRLP4 0
ADDRGP4 g_arenaservers+824+44
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 541
;541:			g_arenaservers.refresh.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 4
ADDRGP4 g_arenaservers+1636+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 542
;542:			g_arenaservers.go.generic.flags			&= ~QMF_GRAYED;
ADDRLP4 8
ADDRGP4 g_arenaservers+1912+44
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 546
;543:			//g_arenaservers.punkbuster.generic.flags &= ~QMF_GRAYED;
;544:
;545:			// update status bar
;546:			if ( g_servertype == AS_GLOBAL ) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 2
NEI4 $256
line 547
;547:				g_arenaservers.statusbar.string = quake3worldMessage;
ADDRGP4 g_arenaservers+1376+64
ADDRGP4 quake3worldMessage
ASGNP4
line 548
;548:			} else {
ADDRGP4 $233
JUMPV
LABELV $256
line 549
;549:				g_arenaservers.statusbar.string = "";
ADDRGP4 g_arenaservers+1376+64
ADDRGP4 $262
ASGNP4
line 550
;550:			}
line 551
;551:		}
line 552
;552:	}
ADDRGP4 $233
JUMPV
LABELV $232
line 553
;553:	else {
line 555
;554:		// no servers found
;555:		if( g_arenaservers.refreshservers ) {
ADDRGP4 g_arenaservers+56632
INDIRI4
CNSTI4 0
EQI4 $263
line 556
;556:			strcpy( g_arenaservers.status.string,"Scanning For Servers." );
ADDRGP4 g_arenaservers+1300+64
INDIRP4
ARGP4
ADDRGP4 $268
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 557
;557:			g_arenaservers.statusbar.string = "Press SPACE to stop";
ADDRGP4 g_arenaservers+1376+64
ADDRGP4 $247
ASGNP4
line 564
;558:
;559:			// disable controls during refresh
;560:			//g_arenaservers.gametype.generic.flags	|= QMF_GRAYED;
;561:			//g_arenaservers.sortkey.generic.flags	|= QMF_GRAYED;
;562:			//g_arenaservers.showempty.generic.flags|= QMF_GRAYED;
;563:			//g_arenaservers.showfull.generic.flags	|= QMF_GRAYED;
;564:			g_arenaservers.list.generic.flags		|= QMF_GRAYED;
ADDRLP4 0
ADDRGP4 g_arenaservers+824+44
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 565
;565:			g_arenaservers.refresh.generic.flags	|= QMF_GRAYED;
ADDRLP4 4
ADDRGP4 g_arenaservers+1636+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 566
;566:			g_arenaservers.go.generic.flags			|= QMF_GRAYED;
ADDRLP4 8
ADDRGP4 g_arenaservers+1912+44
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 567
;567:		}
ADDRGP4 $264
JUMPV
LABELV $263
line 569
;568:		else 
;569:		{
line 570
;570:			if ( g_arenaservers.numqueriedservers < 0 ) {
ADDRGP4 g_arenaservers+56616
INDIRI4
CNSTI4 0
GEI4 $277
line 571
;571:				strcpy( g_arenaservers.status.string, "No Response From Master Server." );
ADDRGP4 g_arenaservers+1300+64
INDIRP4
ARGP4
ADDRGP4 $282
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 572
;572:			} else {
ADDRGP4 $278
JUMPV
LABELV $277
line 573
;573:				strcpy( g_arenaservers.status.string, "No Servers Found." );
ADDRGP4 g_arenaservers+1300+64
INDIRP4
ARGP4
ADDRGP4 $285
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 574
;574:			}
LABELV $278
line 577
;575:
;576:			// update status bar
;577:			if ( g_servertype == AS_GLOBAL ) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 2
NEI4 $286
line 578
;578:				g_arenaservers.statusbar.string = quake3worldMessage;
ADDRGP4 g_arenaservers+1376+64
ADDRGP4 quake3worldMessage
ASGNP4
line 579
;579:			} else {
ADDRGP4 $287
JUMPV
LABELV $286
line 580
;580:				g_arenaservers.statusbar.string = "";
ADDRGP4 g_arenaservers+1376+64
ADDRGP4 $262
ASGNP4
line 581
;581:			}
LABELV $287
line 584
;582:
;583:			// end of refresh - set control state
;584:			g_arenaservers.master.generic.flags		&= ~QMF_GRAYED;
ADDRLP4 0
ADDRGP4 g_arenaservers+364+44
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 585
;585:			g_arenaservers.gametype.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 4
ADDRGP4 g_arenaservers+472+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 586
;586:			g_arenaservers.sortkey.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 8
ADDRGP4 g_arenaservers+580+44
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 587
;587:			g_arenaservers.showempty.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 12
ADDRGP4 g_arenaservers+756+44
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 588
;588:			g_arenaservers.showfull.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 16
ADDRGP4 g_arenaservers+688+44
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 589
;589:			g_arenaservers.list.generic.flags		|= QMF_GRAYED;
ADDRLP4 20
ADDRGP4 g_arenaservers+824+44
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 590
;590:			g_arenaservers.refresh.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 24
ADDRGP4 g_arenaservers+1636+44
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 591
;591:			g_arenaservers.go.generic.flags			|= QMF_GRAYED;
ADDRLP4 28
ADDRGP4 g_arenaservers+1912+44
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 592
;592:		}
LABELV $264
line 595
;593:
;594:		// zero out list box
;595:		g_arenaservers.list.numitems = 0;
ADDRGP4 g_arenaservers+824+72
CNSTI4 0
ASGNI4
line 596
;596:		g_arenaservers.list.curvalue = 0;
ADDRGP4 g_arenaservers+824+68
CNSTI4 0
ASGNI4
line 597
;597:		g_arenaservers.list.top      = 0;
ADDRGP4 g_arenaservers+824+76
CNSTI4 0
ASGNI4
line 600
;598:
;599:		// update picture
;600:		ArenaServers_UpdatePicture();
ADDRGP4 ArenaServers_UpdatePicture
CALLV
pop
line 601
;601:		return;
ADDRGP4 $231
JUMPV
LABELV $233
line 604
;602:	}
;603:
;604:	ArenaServers_UpdateList();
ADDRGP4 ArenaServers_UpdateList
CALLV
pop
line 607
;605:
;606:	// update picture
;607:	ArenaServers_UpdatePicture();
ADDRGP4 ArenaServers_UpdatePicture
CALLV
pop
line 608
;608:}
LABELV $231
endproc ArenaServers_UpdateMenu 32 20
proc ArenaServers_Remove 20 12
line 617
;609:
;610:
;611:/*
;612:=================
;613:ArenaServers_Remove
;614:=================
;615:*/
;616:static void ArenaServers_Remove( void )
;617:{
line 622
;618:	int				i;
;619:	servernode_t*	servernodeptr;
;620:	table_t*		tableptr;
;621:
;622:	if (!g_arenaservers.list.numitems)
ADDRGP4 g_arenaservers+824+72
INDIRI4
CNSTI4 0
NEI4 $315
line 623
;623:		return;
ADDRGP4 $314
JUMPV
LABELV $315
line 629
;624:
;625:	// remove selected item from display list
;626:	// items are in scattered order due to sort and cull
;627:	// perform delete on list box contents, resync all lists
;628:
;629:	tableptr      = &g_arenaservers.table[g_arenaservers.list.curvalue];
ADDRLP4 8
ADDRGP4 g_arenaservers+824+68
INDIRI4
CNSTI4 68
MULI4
ADDRGP4 g_arenaservers+19752
ADDP4
ASGNP4
line 630
;630:	servernodeptr = tableptr->servernode;
ADDRLP4 4
ADDRLP4 8
INDIRP4
CNSTI4 64
ADDP4
INDIRP4
ASGNP4
line 633
;631:
;632:	// find address in master list
;633:	for (i=0; i<g_arenaservers.numfavoriteaddresses; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $325
JUMPV
LABELV $322
line 634
;634:		if (!Q_stricmp(g_arenaservers.favoriteaddresses[i],servernodeptr->adrstr))
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+56648
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $327
line 635
;635:				break;
ADDRGP4 $324
JUMPV
LABELV $327
LABELV $323
line 633
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $325
ADDRLP4 0
INDIRI4
ADDRGP4 g_arenaservers+57672
INDIRI4
LTI4 $322
LABELV $324
line 638
;636:
;637:	// delete address from master list
;638:	if (i <= g_arenaservers.numfavoriteaddresses-1)
ADDRLP4 0
INDIRI4
ADDRGP4 g_arenaservers+57672
INDIRI4
CNSTI4 1
SUBI4
GTI4 $330
line 639
;639:	{
line 640
;640:		if (i < g_arenaservers.numfavoriteaddresses-1)
ADDRLP4 0
INDIRI4
ADDRGP4 g_arenaservers+57672
INDIRI4
CNSTI4 1
SUBI4
GEI4 $333
line 641
;641:		{
line 643
;642:			// shift items up
;643:			memcpy( &g_arenaservers.favoriteaddresses[i], &g_arenaservers.favoriteaddresses[i+1], (g_arenaservers.numfavoriteaddresses - i - 1)*MAX_ADDRESSLENGTH);
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+56648
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+56648+64
ADDP4
ARGP4
ADDRGP4 g_arenaservers+57672
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 6
LSHI4
CNSTI4 64
SUBI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 644
;644:		}
LABELV $333
line 645
;645:		g_arenaservers.numfavoriteaddresses--;
ADDRLP4 16
ADDRGP4 g_arenaservers+57672
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 646
;646:	}	
LABELV $330
line 649
;647:
;648:	// find address in server list
;649:	for (i=0; i<g_numfavoriteservers; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $344
JUMPV
LABELV $341
line 650
;650:		if (&g_favoriteserverlist[i] == servernodeptr)
ADDRLP4 0
INDIRI4
CNSTI4 144
MULI4
ADDRGP4 g_favoriteserverlist
ADDP4
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
NEU4 $345
line 651
;651:				break;
ADDRGP4 $343
JUMPV
LABELV $345
LABELV $342
line 649
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $344
ADDRLP4 0
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
LTI4 $341
LABELV $343
line 654
;652:
;653:	// delete address from server list
;654:	if (i <= g_numfavoriteservers-1)
ADDRLP4 0
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
CNSTI4 1
SUBI4
GTI4 $347
line 655
;655:	{
line 656
;656:		if (i < g_numfavoriteservers-1)
ADDRLP4 0
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
CNSTI4 1
SUBI4
GEI4 $349
line 657
;657:		{
line 659
;658:			// shift items up
;659:			memcpy( &g_favoriteserverlist[i], &g_favoriteserverlist[i+1], (g_numfavoriteservers - i - 1)*sizeof(servernode_t));
ADDRLP4 0
INDIRI4
CNSTI4 144
MULI4
ADDRGP4 g_favoriteserverlist
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 144
MULI4
ADDRGP4 g_favoriteserverlist+144
ADDP4
ARGP4
ADDRGP4 g_numfavoriteservers
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 1
SUBI4
CVIU4 4
CNSTU4 144
MULU4
CVUI4 4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 660
;660:		}
LABELV $349
line 661
;661:		g_numfavoriteservers--;
ADDRLP4 16
ADDRGP4 g_numfavoriteservers
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 662
;662:	}	
LABELV $347
line 664
;663:
;664:	g_arenaservers.numqueriedservers = g_arenaservers.numfavoriteaddresses;
ADDRGP4 g_arenaservers+56616
ADDRGP4 g_arenaservers+57672
INDIRI4
ASGNI4
line 665
;665:	g_arenaservers.currentping       = g_arenaservers.numfavoriteaddresses;
ADDRGP4 g_arenaservers+56628
ADDRGP4 g_arenaservers+57672
INDIRI4
ASGNI4
line 666
;666:}
LABELV $314
endproc ArenaServers_Remove 20 12
proc UI_CleanStr 24 0
line 670
;667:
;668:
;669:static qboolean UI_CleanStr( char *dst, int size, const char *src ) 
;670:{
line 671
;671:	char	*max = dst + size - 1;
ADDRLP4 8
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI4 -1
ADDP4
ASGNP4
line 673
;672:	int		c;
;673:	qboolean filtered = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $358
JUMPV
LABELV $357
line 675
;674:
;675:	while ( (c = *src) != '\0' ) {
line 676
;676:		if ( c <= ' ' ) {
ADDRLP4 0
INDIRI4
CNSTI4 32
GTI4 $360
line 677
;677:			filtered = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 678
;678:			src+=1; continue;
ADDRFP4 8
ADDRFP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $358
JUMPV
LABELV $360
line 680
;679:		}
;680:		if ( Q_IsColorString( src ) && *(src+2) <= ' ' ) {
ADDRLP4 12
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $365
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $365
ADDRLP4 12
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $365
ADDRLP4 12
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 94
EQI4 $365
ADDRLP4 12
INDIRP4
CNSTI4 2
ADDP4
INDIRI1
CVII4 1
CNSTI4 32
GTI4 $365
line 681
;681:			filtered = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 682
;682:			src+=2; continue;
ADDRFP4 8
ADDRFP4 8
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 684
;683:		}
;684:		break;
LABELV $358
line 675
ADDRLP4 12
ADDRFP4 8
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
NEI4 $357
ADDRGP4 $365
JUMPV
LABELV $364
line 687
;685:	}
;686:
;687:	while ( (c = *src) != '\0' ) {
line 688
;688:		if ( Q_IsColorString( src ) ) {
ADDRLP4 16
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $367
ADDRLP4 16
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $367
ADDRLP4 16
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $367
ADDRLP4 16
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 94
EQI4 $367
line 689
;689:			filtered = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 690
;690:			src += 2;
ADDRFP4 8
ADDRFP4 8
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 691
;691:			continue;
ADDRGP4 $365
JUMPV
LABELV $367
line 692
;692:		} else if ( c >= ' ' && c <= '~' ) {
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $369
ADDRLP4 0
INDIRI4
CNSTI4 126
GTI4 $369
line 693
;693:			*dst = c; dst++;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
CVII1 4
ASGNI1
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 694
;694:			if ( dst >= max )
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRP4
CVPU4 4
LTU4 $371
line 695
;695:				break;
ADDRGP4 $366
JUMPV
LABELV $371
line 696
;696:		}
LABELV $369
line 697
;697:		src++;
ADDRFP4 8
ADDRFP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 698
;698:	}
LABELV $365
line 687
ADDRLP4 16
ADDRFP4 8
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
NEI4 $364
LABELV $366
line 700
;699:
;700:	*dst = '\0';
ADDRFP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 702
;701:
;702:	return filtered;
ADDRLP4 4
INDIRI4
RETI4
LABELV $356
endproc UI_CleanStr 24 0
proc ArenaServers_Insert 104 12
line 712
;703:}
;704:
;705:
;706:/*
;707:=================
;708:ArenaServers_Insert
;709:=================
;710:*/
;711:static void ArenaServers_Insert( const char *adrstr, const char *info, int pingtime )
;712:{
line 717
;713:	servernode_t	*servernodeptr;
;714:	char			*s;
;715:	int				i;
;716:
;717:	s = Info_ValueForKey( info, "game" );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $374
ARGP4
ADDRLP4 12
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 718
;718:	if ( !Q_stricmp( s, "q3ut4" ) ) 
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $377
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $375
line 719
;719:	{
line 720
;720:		return; // filter urbanterror servers
ADDRGP4 $373
JUMPV
LABELV $375
line 723
;721:	}
;722:
;723:	if ( atoi( Info_ValueForKey( info, "punkbuster" ) ) ) 
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $380
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
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $378
line 724
;724:	{
line 725
;725:		return; // filter PunkBuster servers
ADDRGP4 $373
JUMPV
LABELV $378
line 728
;726:	}
;727:
;728:	if ((pingtime >= ArenaServers_MaxPing()) && (g_servertype != AS_FAVORITES))
ADDRLP4 28
ADDRGP4 ArenaServers_MaxPing
CALLI4
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 28
INDIRI4
LTI4 $381
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
EQI4 $381
line 729
;729:	{
line 731
;730:		// slow global or local servers do not get entered
;731:		return;
ADDRGP4 $373
JUMPV
LABELV $381
line 734
;732:	}
;733:
;734:	if ( pingtime < 0 )
ADDRFP4 8
INDIRI4
CNSTI4 0
GEI4 $383
line 735
;735:		pingtime = 0;
ADDRFP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $384
JUMPV
LABELV $383
line 736
;736:	else if ( pingtime > 999 )
ADDRFP4 8
INDIRI4
CNSTI4 999
LEI4 $385
line 737
;737:		pingtime = 999;
ADDRFP4 8
CNSTI4 999
ASGNI4
LABELV $385
LABELV $384
line 739
;738:
;739:	if ( *g_arenaservers.numservers >= g_arenaservers.maxservers ) {
ADDRGP4 g_arenaservers+56620
INDIRP4
INDIRI4
ADDRGP4 g_arenaservers+56640
INDIRI4
LTI4 $387
line 741
;740:		// list full;
;741:		servernodeptr = g_arenaservers.serverlist+(*g_arenaservers.numservers)-1;
ADDRLP4 0
ADDRGP4 g_arenaservers+56620
INDIRP4
INDIRI4
CNSTI4 144
MULI4
ADDRGP4 g_arenaservers+56624
INDIRP4
ADDP4
CNSTI4 -144
ADDP4
ASGNP4
line 742
;742:	} else {
ADDRGP4 $388
JUMPV
LABELV $387
line 744
;743:		// next slot
;744:		servernodeptr = g_arenaservers.serverlist+(*g_arenaservers.numservers);
ADDRLP4 0
ADDRGP4 g_arenaservers+56620
INDIRP4
INDIRI4
CNSTI4 144
MULI4
ADDRGP4 g_arenaservers+56624
INDIRP4
ADDP4
ASGNP4
line 745
;745:		(*g_arenaservers.numservers)++;
ADDRLP4 32
ADDRGP4 g_arenaservers+56620
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 746
;746:	}
LABELV $388
line 748
;747:
;748:	Q_strncpyz( servernodeptr->adrstr, adrstr, sizeof( servernodeptr->adrstr ) );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 750
;749:
;750:	if ( UI_CleanStr( servernodeptr->hostname, sizeof( servernodeptr->hostname ), Info_ValueForKey( info, "hostname" ) ) ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $398
ARGP4
ADDRLP4 32
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
CNSTI4 27
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 UI_CleanStr
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $396
LABELV $399
line 753
;751:		// some servers abusing color sequences - lets filter them until completely cleaned
;752:		while ( UI_CleanStr( servernodeptr->hostname, sizeof( servernodeptr->hostname ), servernodeptr->hostname ) )
;753:			;
LABELV $400
line 752
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
CNSTI4 27
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRLP4 44
ADDRGP4 UI_CleanStr
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $399
line 754
;754:	}
LABELV $396
line 756
;755:	
;756:	Q_strncpyz( servernodeptr->mapname, Info_ValueForKey( info, "mapname" ), sizeof( servernodeptr->mapname ) );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $402
ARGP4
ADDRLP4 40
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 91
ADDP4
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
CNSTI4 12
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 757
;757:	Q_CleanStr( servernodeptr->mapname );
ADDRLP4 0
INDIRP4
CNSTI4 91
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 758
;758:	Q_strupr( servernodeptr->mapname );
ADDRLP4 0
INDIRP4
CNSTI4 91
ADDP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 760
;759:
;760:	servernodeptr->numclients = abs( atoi( Info_ValueForKey( info, "clients") ) );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $403
ARGP4
ADDRLP4 44
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 52
INDIRI4
ASGNI4
line 761
;761:	servernodeptr->maxclients = abs( atoi( Info_ValueForKey( info, "sv_maxclients") ) );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $404
ARGP4
ADDRLP4 56
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 64
INDIRI4
ASGNI4
line 762
;762:	servernodeptr->pingtime   = pingtime;
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 763
;763:	servernodeptr->minPing    = atoi( Info_ValueForKey( info, "minPing") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $405
ARGP4
ADDRLP4 68
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 136
ADDP4
ADDRLP4 72
INDIRI4
ASGNI4
line 764
;764:	servernodeptr->maxPing    = atoi( Info_ValueForKey( info, "maxPing") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $406
ARGP4
ADDRLP4 76
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 80
INDIRI4
ASGNI4
line 767
;765:
;766:	// avoid potential string overflow
;767:	if( servernodeptr->numclients > 99 )
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 99
LEI4 $407
line 768
;768:		servernodeptr->numclients = 99;
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
CNSTI4 99
ASGNI4
LABELV $407
line 769
;769:	if( servernodeptr->maxclients > 99 )
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 99
LEI4 $409
line 770
;770:		servernodeptr->maxclients = 99;
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
CNSTI4 99
ASGNI4
LABELV $409
line 789
;771:
;772:	/*
;773:	s = Info_ValueForKey( info, "nettype" );
;774:	for (i=0; ;i++)
;775:	{
;776:		if (!netnames[i])
;777:		{
;778:			servernodeptr->nettype = 0;
;779:			break;
;780:		}
;781:		else if (!Q_stricmp( netnames[i], s ))
;782:		{
;783:			servernodeptr->nettype = i;
;784:			break;
;785:		}
;786:	}
;787:	*/
;788:
;789:	servernodeptr->nettype = atoi( Info_ValueForKey( info, "nettype" ) );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $411
ARGP4
ADDRLP4 84
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 132
ADDP4
ADDRLP4 88
INDIRI4
ASGNI4
line 790
;790:	if ( (unsigned)servernodeptr->nettype >= ARRAY_LEN( netnames ) - 1 ) {
ADDRLP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
CVIU4 4
CNSTU4 3
LTU4 $412
line 791
;791:		servernodeptr->nettype = 0;
ADDRLP4 0
INDIRP4
CNSTI4 132
ADDP4
CNSTI4 0
ASGNI4
line 792
;792:	}
LABELV $412
line 794
;793:
;794:	i = atoi( Info_ValueForKey( info, "gametype" ) );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $414
ARGP4
ADDRLP4 92
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 96
INDIRI4
ASGNI4
line 795
;795:	if ( (unsigned)i > GT_MAX_GAME_TYPE-1 ) {
ADDRLP4 8
INDIRI4
CVIU4 4
CNSTU4 7
LEU4 $415
line 796
;796:		i = GT_MAX_GAME_TYPE-1;
ADDRLP4 8
CNSTI4 7
ASGNI4
line 797
;797:	}
LABELV $415
line 798
;798:	servernodeptr->gametype = i;
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 800
;799:
;800:	s = Info_ValueForKey( info, "game" );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $374
ARGP4
ADDRLP4 100
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 100
INDIRP4
ASGNP4
line 801
;801:	if ( *s )
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $417
line 802
;802:		Q_strncpyz( servernodeptr->gamename, s, sizeof( servernodeptr->gamename ) );
ADDRLP4 0
INDIRP4
CNSTI4 120
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 9
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRGP4 $418
JUMPV
LABELV $417
line 804
;803:	else
;804:		Q_strncpyz( servernodeptr->gamename, "unknown", sizeof( servernodeptr->gamename ) );
ADDRLP4 0
INDIRP4
CNSTI4 120
ADDP4
ARGP4
ADDRGP4 $419
ARGP4
CNSTI4 9
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
LABELV $418
line 805
;805:}
LABELV $373
endproc ArenaServers_Insert 104 12
export ArenaServers_LoadFavorites
proc ArenaServers_LoadFavorites 2400 12
line 816
;806:
;807:
;808:/*
;809:=================
;810:ArenaServers_LoadFavorites
;811:
;812:Load cvar address book entries into local lists.
;813:=================
;814:*/
;815:void ArenaServers_LoadFavorites( void )
;816:{
line 824
;817:	int				i;
;818:	int				j;
;819:	int				numtempitems;
;820:	char			adrstr[MAX_ADDRESSLENGTH];
;821:	servernode_t	templist[MAX_FAVORITESERVERS];
;822:	qboolean		found;
;823:
;824:	found        = qfalse;
ADDRLP4 2380
CNSTI4 0
ASGNI4
line 827
;825:
;826:	// copy the old
;827:	memcpy( templist, g_favoriteserverlist, sizeof(servernode_t)*MAX_FAVORITESERVERS );
ADDRLP4 72
ARGP4
ADDRGP4 g_favoriteserverlist
ARGP4
CNSTI4 2304
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 828
;828:	numtempitems = g_numfavoriteservers;
ADDRLP4 68
ADDRGP4 g_numfavoriteservers
INDIRI4
ASGNI4
line 831
;829:
;830:	// clear the current for sync
;831:	memset( g_favoriteserverlist, 0, sizeof(servernode_t)*MAX_FAVORITESERVERS );
ADDRGP4 g_favoriteserverlist
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2304
ARGI4
ADDRGP4 memset
CALLP4
pop
line 832
;832:	g_numfavoriteservers = 0;
ADDRGP4 g_numfavoriteservers
CNSTI4 0
ASGNI4
line 835
;833:
;834:	// resync existing results with new or deleted cvars
;835:	for ( i = 0; i < MAX_FAVORITESERVERS; i++ )
ADDRLP4 2376
CNSTI4 0
ASGNI4
LABELV $421
line 836
;836:	{
line 837
;837:		trap_Cvar_VariableStringBuffer( va("server%d",i+1), adrstr, MAX_ADDRESSLENGTH );
ADDRGP4 $425
ARGP4
ADDRLP4 2376
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 2384
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2384
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 838
;838:		if ( !adrstr[0] )
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $426
line 839
;839:			continue;
ADDRGP4 $422
JUMPV
LABELV $426
line 843
;840:
;841:		// quick sanity check to avoid slow domain name resolving
;842:		// first character must be numeric
;843:		if ( adrstr[0] < '0' || adrstr[0] > '9' )
ADDRLP4 2388
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2388
INDIRI4
CNSTI4 48
LTI4 $430
ADDRLP4 2388
INDIRI4
CNSTI4 57
LEI4 $428
LABELV $430
line 844
;844:			continue;
ADDRGP4 $422
JUMPV
LABELV $428
line 849
;845:
;846:		// favorite server addresses must be maintained outside refresh list
;847:		// this mimics local and global netadr's stored in client
;848:		// these can be fetched to fill ping list
;849:		strcpy( g_arenaservers.favoriteaddresses[g_numfavoriteservers], adrstr );
ADDRGP4 g_numfavoriteservers
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+56648
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 852
;850:
;851:		// find this server in the old list
;852:		for (j=0; j<numtempitems; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $435
JUMPV
LABELV $432
line 853
;853:			if (!Q_stricmp( templist[j].adrstr, adrstr ))
ADDRLP4 0
INDIRI4
CNSTI4 144
MULI4
ADDRLP4 72
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 2392
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2392
INDIRI4
CNSTI4 0
NEI4 $436
line 854
;854:				break;
ADDRGP4 $434
JUMPV
LABELV $436
LABELV $433
line 852
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $435
ADDRLP4 0
INDIRI4
ADDRLP4 68
INDIRI4
LTI4 $432
LABELV $434
line 856
;855:
;856:		if (j < numtempitems)
ADDRLP4 0
INDIRI4
ADDRLP4 68
INDIRI4
GEI4 $438
line 857
;857:		{
line 859
;858:			// found server - add exisiting results
;859:			memcpy( &g_favoriteserverlist[g_numfavoriteservers], &templist[j], sizeof(servernode_t) );
ADDRGP4 g_numfavoriteservers
INDIRI4
CNSTI4 144
MULI4
ADDRGP4 g_favoriteserverlist
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 144
MULI4
ADDRLP4 72
ADDP4
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 860
;860:			found = qtrue;
ADDRLP4 2380
CNSTI4 1
ASGNI4
line 861
;861:		}
ADDRGP4 $439
JUMPV
LABELV $438
line 863
;862:		else
;863:		{
line 865
;864:			// add new server
;865:			Q_strncpyz( g_favoriteserverlist[g_numfavoriteservers].adrstr, adrstr, MAX_ADDRESSLENGTH );
ADDRGP4 g_numfavoriteservers
INDIRI4
CNSTI4 144
MULI4
ADDRGP4 g_favoriteserverlist
ADDP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 866
;866:			g_favoriteserverlist[g_numfavoriteservers].pingtime = ArenaServers_MaxPing();
ADDRLP4 2396
ADDRGP4 ArenaServers_MaxPing
CALLI4
ASGNI4
ADDRGP4 g_numfavoriteservers
INDIRI4
CNSTI4 144
MULI4
ADDRGP4 g_favoriteserverlist+112
ADDP4
ADDRLP4 2396
INDIRI4
ASGNI4
line 867
;867:		}
LABELV $439
line 869
;868:
;869:		g_numfavoriteservers++;
ADDRLP4 2396
ADDRGP4 g_numfavoriteservers
ASGNP4
ADDRLP4 2396
INDIRP4
ADDRLP4 2396
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 870
;870:	}
LABELV $422
line 835
ADDRLP4 2376
ADDRLP4 2376
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 2376
INDIRI4
CNSTI4 16
LTI4 $421
line 872
;871:
;872:	g_arenaservers.numfavoriteaddresses = g_numfavoriteservers;
ADDRGP4 g_arenaservers+57672
ADDRGP4 g_numfavoriteservers
INDIRI4
ASGNI4
line 874
;873:
;874:	if (!found)
ADDRLP4 2380
INDIRI4
CNSTI4 0
NEI4 $442
line 875
;875:	{
line 878
;876:		// no results were found, reset server list
;877:		// list will be automatically refreshed when selected
;878:		g_numfavoriteservers = 0;
ADDRGP4 g_numfavoriteservers
CNSTI4 0
ASGNI4
line 879
;879:	}
LABELV $442
line 880
;880:}
LABELV $420
endproc ArenaServers_LoadFavorites 2400 12
proc ArenaServers_StopRefresh 0 16
line 889
;881:
;882:
;883:/*
;884:=================
;885:ArenaServers_StopRefresh
;886:=================
;887:*/
;888:static void ArenaServers_StopRefresh( void )
;889:{
line 890
;890:	if (!g_arenaservers.refreshservers)
ADDRGP4 g_arenaservers+56632
INDIRI4
CNSTI4 0
NEI4 $445
line 892
;891:		// not currently refreshing
;892:		return;
ADDRGP4 $444
JUMPV
LABELV $445
line 894
;893:
;894:	g_arenaservers.refreshservers = qfalse;
ADDRGP4 g_arenaservers+56632
CNSTI4 0
ASGNI4
line 897
;895:
;896:	// final tally
;897:	if (g_arenaservers.numqueriedservers >= 0)
ADDRGP4 g_arenaservers+56616
INDIRI4
CNSTI4 0
LTI4 $449
line 898
;898:	{
line 899
;899:		g_arenaservers.currentping       = *g_arenaservers.numservers;
ADDRGP4 g_arenaservers+56628
ADDRGP4 g_arenaservers+56620
INDIRP4
INDIRI4
ASGNI4
line 900
;900:		g_arenaservers.numqueriedservers = *g_arenaservers.numservers; 
ADDRGP4 g_arenaservers+56616
ADDRGP4 g_arenaservers+56620
INDIRP4
INDIRI4
ASGNI4
line 901
;901:	}
LABELV $449
line 904
;902:	
;903:	// sort
;904:	qsort( g_arenaservers.serverlist, *g_arenaservers.numservers, sizeof( servernode_t ), ArenaServers_Compare);
ADDRGP4 g_arenaservers+56624
INDIRP4
ARGP4
ADDRGP4 g_arenaservers+56620
INDIRP4
INDIRI4
ARGI4
CNSTI4 144
ARGI4
ADDRGP4 ArenaServers_Compare
ARGP4
ADDRGP4 qsort
CALLV
pop
line 906
;905:
;906:	ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 907
;907:}
LABELV $444
endproc ArenaServers_StopRefresh 0 16
proc ArenaServers_DoRefresh 1120 16
line 916
;908:
;909:
;910:/*
;911:=================
;912:ArenaServers_DoRefresh
;913:=================
;914:*/
;915:static void ArenaServers_DoRefresh( void )
;916:{
line 924
;917:	int		i;
;918:	int		j;
;919:	int		time;
;920:	int		maxPing;
;921:	char	adrstr[MAX_ADDRESSLENGTH];
;922:	char	info[MAX_INFO_STRING];
;923:
;924:	if (uis.realtime < g_arenaservers.refreshtime)
ADDRGP4 uis+4
INDIRI4
ADDRGP4 g_arenaservers+56644
INDIRI4
GEI4 $459
line 925
;925:	{
line 926
;926:	  if (g_servertype != AS_FAVORITES) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
EQI4 $460
line 927
;927:			if (g_servertype == AS_LOCAL) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 0
NEI4 $465
line 928
;928:				if (!trap_LAN_GetServerCount(g_servertype)) {
ADDRGP4 g_servertype
INDIRI4
ARGI4
ADDRLP4 1104
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $467
line 929
;929:					return;
ADDRGP4 $458
JUMPV
LABELV $467
line 931
;930:				}
;931:			}
LABELV $465
line 932
;932:			if (trap_LAN_GetServerCount(g_servertype) < 0) {
ADDRGP4 g_servertype
INDIRI4
ARGI4
ADDRLP4 1104
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
GEI4 $460
line 934
;933:			  // still waiting for response
;934:			  return;
ADDRGP4 $458
JUMPV
line 936
;935:			}
;936:	  }
line 937
;937:	} else if (g_servertype == AS_LOCAL) {
LABELV $459
ADDRGP4 g_servertype
INDIRI4
CNSTI4 0
NEI4 $471
line 938
;938:		if ( !trap_LAN_GetServerCount(AS_LOCAL)) {
CNSTI4 0
ARGI4
ADDRLP4 1104
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $473
line 940
;939:			// no local servers found, check again
;940:			trap_Cmd_ExecuteText( EXEC_APPEND, "localservers\n" );
CNSTI4 2
ARGI4
ADDRGP4 $475
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 941
;941:			g_arenaservers.refreshtime = uis.realtime + 5000;
ADDRGP4 g_arenaservers+56644
ADDRGP4 uis+4
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 942
;942:			return;
ADDRGP4 $458
JUMPV
LABELV $473
line 944
;943:		}
;944:	}
LABELV $471
LABELV $460
line 946
;945:
;946:	if (uis.realtime < g_arenaservers.nextpingtime)
ADDRGP4 uis+4
INDIRI4
ADDRGP4 g_arenaservers+56636
INDIRI4
GEI4 $478
line 947
;947:	{
line 949
;948:		// wait for time trigger
;949:		return;
ADDRGP4 $458
JUMPV
LABELV $478
line 953
;950:	}
;951:
;952:	// trigger after REFRESH_DELAY 
;953:	g_arenaservers.nextpingtime = uis.realtime + REFRESH_DELAY;
ADDRGP4 g_arenaservers+56636
ADDRGP4 uis+4
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 956
;954:
;955:	// process ping results
;956:	maxPing = ArenaServers_MaxPing();
ADDRLP4 1104
ADDRGP4 ArenaServers_MaxPing
CALLI4
ASGNI4
ADDRLP4 76
ADDRLP4 1104
INDIRI4
ASGNI4
line 957
;957:	for (i=0; i<MAX_PINGREQUESTS; i++)
ADDRLP4 68
CNSTI4 0
ASGNI4
LABELV $484
line 958
;958:	{
line 959
;959:		trap_LAN_GetPing( i, adrstr, MAX_ADDRESSLENGTH, &time );
ADDRLP4 68
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 72
ARGP4
ADDRGP4 trap_LAN_GetPing
CALLV
pop
line 960
;960:		if (!adrstr[0])
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $488
line 961
;961:		{
line 963
;962:			// ignore empty or pending pings
;963:			continue;
ADDRGP4 $485
JUMPV
LABELV $488
line 967
;964:		}
;965:
;966:		// find ping result in our local list
;967:		for (j=0; j<MAX_PINGLISTSIZE; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $490
line 968
;968:			if (!Q_stricmp( adrstr, g_arenaservers.pinglist[j].adrstr ))
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 68
MULI4
ADDRGP4 g_arenaservers+2344
ADDP4
ARGP4
ADDRLP4 1108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $494
line 969
;969:				break;
ADDRGP4 $492
JUMPV
LABELV $494
LABELV $491
line 967
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $490
LABELV $492
line 971
;970:
;971:		if (j < MAX_PINGLISTSIZE)
ADDRLP4 0
INDIRI4
CNSTI4 256
GEI4 $497
line 972
;972:		{
line 974
;973:			// found it
;974:			if (!time)
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $499
line 975
;975:			{
line 976
;976:				time = uis.realtime - g_arenaservers.pinglist[j].start;
ADDRLP4 72
ADDRGP4 uis+4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 68
MULI4
ADDRGP4 g_arenaservers+2344+64
ADDP4
INDIRI4
SUBI4
ASGNI4
line 977
;977:				if (time < maxPing)
ADDRLP4 72
INDIRI4
ADDRLP4 76
INDIRI4
GEI4 $504
line 978
;978:				{
line 980
;979:					// still waiting
;980:					continue;
ADDRGP4 $485
JUMPV
LABELV $504
line 982
;981:				}
;982:			}
LABELV $499
line 984
;983:
;984:			if (time > maxPing)
ADDRLP4 72
INDIRI4
ADDRLP4 76
INDIRI4
LEI4 $506
line 985
;985:			{
line 987
;986:				// stale it out
;987:				info[0] = '\0';
ADDRLP4 80
CNSTI1 0
ASGNI1
line 988
;988:				time = maxPing;
ADDRLP4 72
ADDRLP4 76
INDIRI4
ASGNI4
line 991
;989:
;990:				// set hostname for nonresponsive favorite server
;991:				if ( g_servertype == AS_LOCAL ) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 0
NEI4 $507
line 992
;992:					Info_SetValueForKey( info, "hostname", adrstr );
ADDRLP4 80
ARGP4
ADDRGP4 $398
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 993
;993:					Info_SetValueForKey( info, "game", "???" );
ADDRLP4 80
ARGP4
ADDRGP4 $374
ARGP4
ADDRGP4 $82
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 994
;994:				}
line 995
;995:			}
ADDRGP4 $507
JUMPV
LABELV $506
line 997
;996:			else
;997:			{
line 998
;998:				trap_LAN_GetPingInfo( i, info, MAX_INFO_STRING );
ADDRLP4 68
INDIRI4
ARGI4
ADDRLP4 80
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetPingInfo
CALLV
pop
line 999
;999:			}
LABELV $507
line 1002
;1000:
;1001:			// insert ping results
;1002:			if ( time < maxPing && *g_arenaservers.numservers < MAX_LISTBOXITEMS ) 
ADDRLP4 72
INDIRI4
ADDRLP4 76
INDIRI4
GEI4 $510
ADDRGP4 g_arenaservers+56620
INDIRP4
INDIRI4
CNSTI4 512
GEI4 $510
line 1003
;1003:			{
line 1004
;1004:				ArenaServers_Insert( adrstr, info, time );
ADDRLP4 4
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 72
INDIRI4
ARGI4
ADDRGP4 ArenaServers_Insert
CALLV
pop
line 1005
;1005:			}
LABELV $510
line 1008
;1006:
;1007:			// clear this query from internal list
;1008:			g_arenaservers.pinglist[j].adrstr[0] = '\0';
ADDRLP4 0
INDIRI4
CNSTI4 68
MULI4
ADDRGP4 g_arenaservers+2344
ADDP4
CNSTI1 0
ASGNI1
line 1009
;1009:   		}
LABELV $497
line 1012
;1010:
;1011:		// clear this query from external list
;1012:		trap_LAN_ClearPing( i );
ADDRLP4 68
INDIRI4
ARGI4
ADDRGP4 trap_LAN_ClearPing
CALLV
pop
line 1013
;1013:	}
LABELV $485
line 957
ADDRLP4 68
ADDRLP4 68
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 32
LTI4 $484
line 1017
;1014:
;1015:	// get results of servers query
;1016:	// counts can increase as servers respond
;1017:	if ( g_servertype == AS_FAVORITES ) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
NEI4 $514
line 1018
;1018:		g_arenaservers.numqueriedservers = g_arenaservers.numfavoriteaddresses;
ADDRGP4 g_arenaservers+56616
ADDRGP4 g_arenaservers+57672
INDIRI4
ASGNI4
line 1019
;1019:	} else {
ADDRGP4 $515
JUMPV
LABELV $514
line 1020
;1020:		g_arenaservers.numqueriedservers = trap_LAN_GetServerCount( g_servertype );
ADDRGP4 g_servertype
INDIRI4
ARGI4
ADDRLP4 1108
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRGP4 g_arenaservers+56616
ADDRLP4 1108
INDIRI4
ASGNI4
line 1021
;1021:	}
LABELV $515
line 1029
;1022:
;1023://	if (g_arenaservers.numqueriedservers > g_arenaservers.maxservers)
;1024://		g_arenaservers.numqueriedservers = g_arenaservers.maxservers;
;1025:
;1026:	// send ping requests in reasonable bursts
;1027:	// iterate ping through all found servers
;1028:
;1029:	for (i=0; i<MAX_PINGLISTSIZE && g_arenaservers.currentping < g_arenaservers.numqueriedservers; i++)
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRGP4 $522
JUMPV
LABELV $519
line 1030
;1030:	{
line 1031
;1031:		if (trap_LAN_GetPingQueueCount() >= MAX_PINGREQUESTS)
ADDRLP4 1108
ADDRGP4 trap_LAN_GetPingQueueCount
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 32
LTI4 $525
line 1032
;1032:		{
line 1034
;1033:			// ping queue is full
;1034:			break;
ADDRGP4 $521
JUMPV
LABELV $525
line 1038
;1035:		}
;1036:
;1037:		// find empty slot
;1038:		for (j=0; j<MAX_PINGLISTSIZE; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $527
line 1039
;1039:			if (!g_arenaservers.pinglist[j].adrstr[0]) {
ADDRLP4 0
INDIRI4
CNSTI4 68
MULI4
ADDRGP4 g_arenaservers+2344
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $531
line 1040
;1040:				break;
ADDRGP4 $529
JUMPV
LABELV $531
LABELV $528
line 1038
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $527
LABELV $529
line 1043
;1041:			}
;1042:
;1043:		if (j >= MAX_PINGLISTSIZE) {
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $534
line 1048
;1044:			// no empty slots available yet - wait for timeout
;1045:#ifdef _DEBUG
;1046:			Com_Printf( S_COLOR_YELLOW "no empty slots in ping list\n" );
;1047:#endif
;1048:			break;
ADDRGP4 $521
JUMPV
LABELV $534
line 1054
;1049:		}
;1050:			
;1051:
;1052:		// get an address to ping
;1053:
;1054:		if (g_servertype == AS_FAVORITES) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
NEI4 $536
line 1055
;1055:		  strcpy( adrstr, g_arenaservers.favoriteaddresses[g_arenaservers.currentping] ); 		
ADDRLP4 4
ARGP4
ADDRGP4 g_arenaservers+56628
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+56648
ADDP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1056
;1056:		} else {
ADDRGP4 $537
JUMPV
LABELV $536
line 1057
;1057:		  trap_LAN_GetServerAddressString(g_servertype, g_arenaservers.currentping, adrstr, MAX_ADDRESSLENGTH );
ADDRGP4 g_servertype
INDIRI4
ARGI4
ADDRGP4 g_arenaservers+56628
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_LAN_GetServerAddressString
CALLV
pop
line 1058
;1058:		}
LABELV $537
line 1060
;1059:
;1060:		strcpy( g_arenaservers.pinglist[j].adrstr, adrstr );
ADDRLP4 0
INDIRI4
CNSTI4 68
MULI4
ADDRGP4 g_arenaservers+2344
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1061
;1061:		g_arenaservers.pinglist[j].start = uis.realtime;
ADDRLP4 0
INDIRI4
CNSTI4 68
MULI4
ADDRGP4 g_arenaservers+2344+64
ADDP4
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 1063
;1062:
;1063:		trap_Cmd_ExecuteText( EXEC_NOW, va( "ping %s\n", adrstr )  );
ADDRGP4 $545
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1112
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 1112
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1066
;1064:		
;1065:		// advance to next server
;1066:		g_arenaservers.currentping++;
ADDRLP4 1116
ADDRGP4 g_arenaservers+56628
ASGNP4
ADDRLP4 1116
INDIRP4
ADDRLP4 1116
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1067
;1067:	}
LABELV $520
line 1029
ADDRLP4 68
ADDRLP4 68
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $522
ADDRLP4 68
INDIRI4
CNSTI4 256
GEI4 $547
ADDRGP4 g_arenaservers+56628
INDIRI4
ADDRGP4 g_arenaservers+56616
INDIRI4
LTI4 $519
LABELV $547
LABELV $521
line 1069
;1068:
;1069:	if ( !trap_LAN_GetPingQueueCount() )
ADDRLP4 1108
ADDRGP4 trap_LAN_GetPingQueueCount
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $548
line 1070
;1070:	{
line 1072
;1071:		// all pings completed
;1072:		ArenaServers_StopRefresh();
ADDRGP4 ArenaServers_StopRefresh
CALLV
pop
line 1073
;1073:		return;
ADDRGP4 $458
JUMPV
LABELV $548
line 1077
;1074:	}
;1075:
;1076:	// update the user interface with ping status
;1077:	ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1078
;1078:}
LABELV $458
endproc ArenaServers_DoRefresh 1120 16
proc ArenaServers_StartRefresh 68 12
line 1087
;1079:
;1080:
;1081:/*
;1082:=================
;1083:ArenaServers_StartRefresh
;1084:=================
;1085:*/
;1086:static void ArenaServers_StartRefresh( void )
;1087:{
line 1091
;1088:	int		i;
;1089:	char	myargs[32], protocol[24];
;1090:
;1091:	memset( g_arenaservers.serverlist, 0, g_arenaservers.maxservers*sizeof(table_t) );
ADDRGP4 g_arenaservers+56624
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 g_arenaservers+56640
INDIRI4
CVIU4 4
CNSTU4 68
MULU4
CVUI4 4
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1093
;1092:
;1093:	for ( i = 0; i < MAX_PINGLISTSIZE; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $553
line 1094
;1094:		g_arenaservers.pinglist[i].adrstr[0] = '\0';
ADDRLP4 0
INDIRI4
CNSTI4 68
MULI4
ADDRGP4 g_arenaservers+2344
ADDP4
CNSTI1 0
ASGNI1
LABELV $554
line 1093
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $553
line 1096
;1095:
;1096:	for ( i = 0; i < MAX_PINGREQUESTS; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $558
line 1097
;1097:		trap_LAN_ClearPing( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_LAN_ClearPing
CALLV
pop
LABELV $559
line 1096
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $558
line 1099
;1098:
;1099:	g_arenaservers.refreshservers    = qtrue;
ADDRGP4 g_arenaservers+56632
CNSTI4 1
ASGNI4
line 1100
;1100:	g_arenaservers.currentping       = 0;
ADDRGP4 g_arenaservers+56628
CNSTI4 0
ASGNI4
line 1101
;1101:	g_arenaservers.nextpingtime      = 0;
ADDRGP4 g_arenaservers+56636
CNSTI4 0
ASGNI4
line 1102
;1102:	*g_arenaservers.numservers       = 0;
ADDRGP4 g_arenaservers+56620
INDIRP4
CNSTI4 0
ASGNI4
line 1103
;1103:	g_arenaservers.numqueriedservers = 0;
ADDRGP4 g_arenaservers+56616
CNSTI4 0
ASGNI4
line 1106
;1104:
;1105:	// allow max 10 seconds for responses
;1106:	g_arenaservers.refreshtime = uis.realtime + MAX_RESPONSE_TIME;
ADDRGP4 g_arenaservers+56644
ADDRGP4 uis+4
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 1109
;1107:
;1108:	// place menu in zeroed state
;1109:	ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1111
;1110:
;1111:	if ( g_servertype == AS_LOCAL ) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 0
NEI4 $569
line 1112
;1112:		trap_Cmd_ExecuteText( EXEC_APPEND, "localservers\n" );
CNSTI4 2
ARGI4
ADDRGP4 $475
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1113
;1113:		return;
ADDRGP4 $550
JUMPV
LABELV $569
line 1116
;1114:	}
;1115:
;1116:	if ( g_servertype == AS_GLOBAL ) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 2
NEI4 $571
line 1118
;1117:#if 1
;1118:		myargs[0] = '\0';
ADDRLP4 28
CNSTI1 0
ASGNI1
line 1145
;1119:#else
;1120:		switch ( g_arenaservers.gametype.curvalue ) {
;1121:			default:
;1122:			case GAMES_ALL:
;1123:				myargs[0] = 0;
;1124:				break;
;1125:
;1126:			case GAMES_FFA:
;1127:				strcpy( myargs, " ffa" );
;1128:				break;
;1129:
;1130:			case GAMES_TEAMPLAY:
;1131:				strcpy( myargs, " team" );
;1132:				break;
;1133:
;1134:			case GAMES_TOURNEY:
;1135:				strcpy( myargs, " tourney" );
;1136:				break;
;1137:
;1138:			case GAMES_CTF:
;1139:				strcpy( myargs, " ctf" );
;1140:				break;
;1141:		}
;1142:#endif
;1143:
;1144:		//if ( g_emptyservers ) {
;1145:			strcat( myargs, " empty" );
ADDRLP4 28
ARGP4
ADDRGP4 $573
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 1149
;1146:		//}
;1147:
;1148:		//if ( g_fullservers ) {
;1149:			strcat( myargs, " full" );
ADDRLP4 28
ARGP4
ADDRGP4 $574
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 1152
;1150:		//}
;1151:
;1152:		protocol[0] = '\0';
ADDRLP4 4
CNSTI1 0
ASGNI1
line 1153
;1153:		trap_Cvar_VariableStringBuffer( "debug_protocol", protocol, sizeof( protocol ) );
ADDRGP4 $575
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 24
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1154
;1154:		if ( protocol[0] ) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $576
line 1155
;1155:			trap_Cmd_ExecuteText( EXEC_APPEND, va( "globalservers 0 %s%s\n", protocol, myargs ));
ADDRGP4 $578
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1156
;1156:		} else {
ADDRGP4 $577
JUMPV
LABELV $576
line 1157
;1157:			trap_Cmd_ExecuteText( EXEC_APPEND, va( "globalservers 0 %d%s\n", (int)trap_Cvar_VariableValue( "protocol" ), myargs ) );
ADDRGP4 $580
ARGP4
ADDRLP4 60
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 $579
ARGP4
ADDRLP4 60
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 28
ARGP4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1158
;1158:		}
LABELV $577
line 1159
;1159:	}
LABELV $571
line 1160
;1160:}
LABELV $550
endproc ArenaServers_StartRefresh 68 12
export ArenaServers_SaveChanges
proc ArenaServers_SaveChanges 12 8
line 1169
;1161:
;1162:
;1163:/*
;1164:=================
;1165:ArenaServers_SaveChanges
;1166:=================
;1167:*/
;1168:void ArenaServers_SaveChanges( void )
;1169:{
line 1172
;1170:	int	i;
;1171:
;1172:	for (i=0; i<g_arenaservers.numfavoriteaddresses; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $585
JUMPV
LABELV $582
line 1173
;1173:		trap_Cvar_Set( va("server%d",i+1), g_arenaservers.favoriteaddresses[i] );
ADDRGP4 $425
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+56648
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
LABELV $583
line 1172
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $585
ADDRLP4 0
INDIRI4
ADDRGP4 g_arenaservers+57672
INDIRI4
LTI4 $582
line 1175
;1174:
;1175:	for (; i<MAX_FAVORITESERVERS; i++)
ADDRGP4 $591
JUMPV
LABELV $588
line 1176
;1176:		trap_Cvar_Set( va("server%d",i+1), "" );
ADDRGP4 $425
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $262
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
LABELV $589
line 1175
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $591
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $588
line 1177
;1177:}
LABELV $581
endproc ArenaServers_SaveChanges 12 8
export ArenaServers_Sort
proc ArenaServers_Sort 0 16
line 1185
;1178:
;1179:
;1180:/*
;1181:=================
;1182:ArenaServers_Sort
;1183:=================
;1184:*/
;1185:void ArenaServers_Sort( int type ) {
line 1186
;1186:	if ( g_sortkey == type ) {
ADDRGP4 g_sortkey
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $593
line 1187
;1187:		return;
ADDRGP4 $592
JUMPV
LABELV $593
line 1190
;1188:	}
;1189:
;1190:	g_sortkey = type;
ADDRGP4 g_sortkey
ADDRFP4 0
INDIRI4
ASGNI4
line 1191
;1191:	qsort( g_arenaservers.serverlist, *g_arenaservers.numservers, sizeof( servernode_t ), ArenaServers_Compare );
ADDRGP4 g_arenaservers+56624
INDIRP4
ARGP4
ADDRGP4 g_arenaservers+56620
INDIRP4
INDIRI4
ARGI4
CNSTI4 144
ARGI4
ADDRGP4 ArenaServers_Compare
ARGP4
ADDRGP4 qsort
CALLV
pop
line 1192
;1192:}
LABELV $592
endproc ArenaServers_Sort 0 16
export ArenaServers_SetType
proc ArenaServers_SetType 16 8
line 1201
;1193:
;1194:
;1195:/*
;1196:=================
;1197:ArenaServers_SetType
;1198:=================
;1199:*/
;1200:void ArenaServers_SetType( int type )
;1201:{
line 1202
;1202:	if ( g_servertype == type )
ADDRGP4 g_servertype
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $598
line 1203
;1203:		return;
ADDRGP4 $597
JUMPV
LABELV $598
line 1205
;1204:
;1205:	ArenaServers_StopRefresh();
ADDRGP4 ArenaServers_StopRefresh
CALLV
pop
line 1207
;1206:
;1207:	g_servertype = type;
ADDRGP4 g_servertype
ADDRFP4 0
INDIRI4
ASGNI4
line 1209
;1208:
;1209:	switch( type ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $600
ADDRLP4 0
INDIRI4
CNSTI4 3
GTI4 $600
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $620
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $620
address $602
address $608
address $608
address $614
code
LABELV $600
LABELV $602
line 1212
;1210:	default:
;1211:	case AS_LOCAL:
;1212:		g_arenaservers.remove.generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 4
ADDRGP4 g_arenaservers+1452+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 1213
;1213:		g_arenaservers.serverlist = g_localserverlist;
ADDRGP4 g_arenaservers+56624
ADDRGP4 g_localserverlist
ASGNP4
line 1214
;1214:		g_arenaservers.numservers = &g_numlocalservers;
ADDRGP4 g_arenaservers+56620
ADDRGP4 g_numlocalservers
ASGNP4
line 1215
;1215:		g_arenaservers.maxservers = MAX_LOCALSERVERS;
ADDRGP4 g_arenaservers+56640
CNSTI4 512
ASGNI4
line 1216
;1216:		break;
ADDRGP4 $601
JUMPV
LABELV $608
line 1220
;1217:
;1218:	case AS_GLOBAL:
;1219:	case AS_MPLAYER:
;1220:		g_arenaservers.remove.generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 8
ADDRGP4 g_arenaservers+1452+44
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 1221
;1221:		g_arenaservers.serverlist = g_globalserverlist;
ADDRGP4 g_arenaservers+56624
ADDRGP4 g_globalserverlist
ASGNP4
line 1222
;1222:		g_arenaservers.numservers = &g_numglobalservers;
ADDRGP4 g_arenaservers+56620
ADDRGP4 g_numglobalservers
ASGNP4
line 1223
;1223:		g_arenaservers.maxservers = MAX_GLOBALSERVERS;
ADDRGP4 g_arenaservers+56640
CNSTI4 3072
ASGNI4
line 1224
;1224:		break;
ADDRGP4 $601
JUMPV
LABELV $614
line 1227
;1225:
;1226:	case AS_FAVORITES:
;1227:		g_arenaservers.remove.generic.flags &= ~(QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 12
ADDRGP4 g_arenaservers+1452+44
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 1228
;1228:		g_arenaservers.serverlist = g_favoriteserverlist;
ADDRGP4 g_arenaservers+56624
ADDRGP4 g_favoriteserverlist
ASGNP4
line 1229
;1229:		g_arenaservers.numservers = &g_numfavoriteservers;
ADDRGP4 g_arenaservers+56620
ADDRGP4 g_numfavoriteservers
ASGNP4
line 1230
;1230:		g_arenaservers.maxservers = MAX_FAVORITESERVERS;
ADDRGP4 g_arenaservers+56640
CNSTI4 16
ASGNI4
line 1231
;1231:		break;
LABELV $601
line 1234
;1232:	}
;1233:
;1234:	if( !*g_arenaservers.numservers ) {
ADDRGP4 g_arenaservers+56620
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $621
line 1235
;1235:		ArenaServers_StartRefresh();
ADDRGP4 ArenaServers_StartRefresh
CALLV
pop
line 1236
;1236:	}
ADDRGP4 $622
JUMPV
LABELV $621
line 1237
;1237:	else {
line 1239
;1238:		// avoid slow operation, use existing results
;1239:		g_arenaservers.currentping       = *g_arenaservers.numservers;
ADDRGP4 g_arenaservers+56628
ADDRGP4 g_arenaservers+56620
INDIRP4
INDIRI4
ASGNI4
line 1240
;1240:		g_arenaservers.numqueriedservers = *g_arenaservers.numservers; 
ADDRGP4 g_arenaservers+56616
ADDRGP4 g_arenaservers+56620
INDIRP4
INDIRI4
ASGNI4
line 1241
;1241:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1242
;1242:	}
LABELV $622
line 1243
;1243:	strcpy( g_arenaservers.status.string, "hit refresh to update" );
ADDRGP4 g_arenaservers+1300+64
INDIRP4
ARGP4
ADDRGP4 $630
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1244
;1244:}
LABELV $597
endproc ArenaServers_SetType 16 8
proc ArenaServers_Event 16 8
line 1252
;1245:
;1246:
;1247:/*
;1248:=================
;1249:ArenaServers_Event
;1250:=================
;1251:*/
;1252:static void ArenaServers_Event( void* ptr, int event ) {
line 1256
;1253:	int		id;
;1254:	int value;
;1255:
;1256:	id = ((menucommon_s*)ptr)->id;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1258
;1257:
;1258:	if( event != QM_ACTIVATED && id != ID_LIST && id != ID_SHOW_EMPTY && id != ID_SHOW_FULL ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $632
ADDRLP4 0
INDIRI4
CNSTI4 15
EQI4 $632
ADDRLP4 0
INDIRI4
CNSTI4 14
EQI4 $632
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $632
line 1259
;1259:		return;
ADDRGP4 $631
JUMPV
LABELV $632
line 1262
;1260:	}
;1261:
;1262:	switch( id ) {
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $634
ADDRLP4 0
INDIRI4
CNSTI4 23
GTI4 $634
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $695-40
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $695
address $636
address $642
address $652
address $662
address $672
address $682
address $685
address $687
address $689
address $690
address $691
address $692
address $693
address $694
code
LABELV $636
line 1264
;1263:	case ID_MASTER:
;1264:		value = g_arenaservers.master.curvalue;
ADDRLP4 4
ADDRGP4 g_arenaservers+364+68
INDIRI4
ASGNI4
line 1265
;1265:		if (value >= 1)
ADDRLP4 4
INDIRI4
CNSTI4 1
LTI4 $639
line 1266
;1266:		{
line 1267
;1267:			value++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1268
;1268:		}
LABELV $639
line 1269
;1269:		trap_Cvar_SetValue( "ui_browserMaster", value );
ADDRGP4 $641
ARGP4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1270
;1270:		ArenaServers_SetType( value );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 ArenaServers_SetType
CALLV
pop
line 1271
;1271:		break;
ADDRGP4 $635
JUMPV
LABELV $642
line 1274
;1272:
;1273:	case ID_GAMETYPE:
;1274:		trap_Cvar_SetValue( "ui_browserGameType", g_arenaservers.gametype.curvalue );
ADDRGP4 $643
ARGP4
ADDRGP4 g_arenaservers+472+68
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1275
;1275:		if ( g_gametype != g_arenaservers.gametype.curvalue ) 
ADDRGP4 g_gametype
INDIRI4
ADDRGP4 g_arenaservers+472+68
INDIRI4
EQI4 $635
line 1276
;1276:		{
line 1277
;1277:			g_gametype = g_arenaservers.gametype.curvalue;
ADDRGP4 g_gametype
ADDRGP4 g_arenaservers+472+68
INDIRI4
ASGNI4
line 1278
;1278:			ArenaServers_UpdateList();
ADDRGP4 ArenaServers_UpdateList
CALLV
pop
line 1279
;1279:			ArenaServers_UpdatePicture();
ADDRGP4 ArenaServers_UpdatePicture
CALLV
pop
line 1280
;1280:		}
line 1281
;1281:		break;
ADDRGP4 $635
JUMPV
LABELV $652
line 1284
;1282:
;1283:	case ID_SORTKEY:
;1284:		trap_Cvar_SetValue( "ui_browserSortKey", g_arenaservers.sortkey.curvalue );
ADDRGP4 $653
ARGP4
ADDRGP4 g_arenaservers+580+68
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1285
;1285:		if ( g_sortkey != g_arenaservers.sortkey.curvalue ) 
ADDRGP4 g_sortkey
INDIRI4
ADDRGP4 g_arenaservers+580+68
INDIRI4
EQI4 $635
line 1286
;1286:		{
line 1287
;1287:			ArenaServers_Sort( g_arenaservers.sortkey.curvalue );
ADDRGP4 g_arenaservers+580+68
INDIRI4
ARGI4
ADDRGP4 ArenaServers_Sort
CALLV
pop
line 1288
;1288:			ArenaServers_UpdateList();
ADDRGP4 ArenaServers_UpdateList
CALLV
pop
line 1289
;1289:			ArenaServers_UpdatePicture();
ADDRGP4 ArenaServers_UpdatePicture
CALLV
pop
line 1290
;1290:		}
line 1291
;1291:		break;
ADDRGP4 $635
JUMPV
LABELV $662
line 1294
;1292:
;1293:	case ID_SHOW_FULL:
;1294:		trap_Cvar_SetValue( "ui_browserShowFull", g_arenaservers.showfull.curvalue );
ADDRGP4 $663
ARGP4
ADDRGP4 g_arenaservers+688+64
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1295
;1295:		if ( g_fullservers != g_arenaservers.showfull.curvalue )
ADDRGP4 g_fullservers
INDIRI4
ADDRGP4 g_arenaservers+688+64
INDIRI4
EQI4 $635
line 1296
;1296:		{
line 1297
;1297:			g_fullservers = g_arenaservers.showfull.curvalue;
ADDRGP4 g_fullservers
ADDRGP4 g_arenaservers+688+64
INDIRI4
ASGNI4
line 1298
;1298:			ArenaServers_UpdateList();
ADDRGP4 ArenaServers_UpdateList
CALLV
pop
line 1299
;1299:			ArenaServers_UpdatePicture();
ADDRGP4 ArenaServers_UpdatePicture
CALLV
pop
line 1300
;1300:		}
line 1301
;1301:		break;
ADDRGP4 $635
JUMPV
LABELV $672
line 1304
;1302:
;1303:	case ID_SHOW_EMPTY:
;1304:		trap_Cvar_SetValue( "ui_browserShowEmpty", g_arenaservers.showempty.curvalue );
ADDRGP4 $673
ARGP4
ADDRGP4 g_arenaservers+756+64
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1305
;1305:		if ( g_emptyservers != g_arenaservers.showempty.curvalue )
ADDRGP4 g_emptyservers
INDIRI4
ADDRGP4 g_arenaservers+756+64
INDIRI4
EQI4 $635
line 1306
;1306:		{
line 1307
;1307:			g_emptyservers = g_arenaservers.showempty.curvalue;
ADDRGP4 g_emptyservers
ADDRGP4 g_arenaservers+756+64
INDIRI4
ASGNI4
line 1308
;1308:			ArenaServers_UpdateList();
ADDRGP4 ArenaServers_UpdateList
CALLV
pop
line 1309
;1309:			ArenaServers_UpdatePicture();
ADDRGP4 ArenaServers_UpdatePicture
CALLV
pop
line 1310
;1310:		}
line 1311
;1311:		break;
ADDRGP4 $635
JUMPV
LABELV $682
line 1314
;1312:
;1313:	case ID_LIST:
;1314:		if( event == QM_GOTFOCUS ) {
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $635
line 1315
;1315:			ArenaServers_UpdatePicture();
ADDRGP4 ArenaServers_UpdatePicture
CALLV
pop
line 1316
;1316:		}
line 1317
;1317:		break;
ADDRGP4 $635
JUMPV
LABELV $685
line 1320
;1318:
;1319:	case ID_SCROLL_UP:
;1320:		ScrollList_Key( &g_arenaservers.list, K_UPARROW );
ADDRGP4 g_arenaservers+824
ARGP4
CNSTI4 132
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 1321
;1321:		break;
ADDRGP4 $635
JUMPV
LABELV $687
line 1324
;1322:
;1323:	case ID_SCROLL_DOWN:
;1324:		ScrollList_Key( &g_arenaservers.list, K_DOWNARROW );
ADDRGP4 g_arenaservers+824
ARGP4
CNSTI4 133
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 1325
;1325:		break;
ADDRGP4 $635
JUMPV
LABELV $689
line 1328
;1326:
;1327:	case ID_BACK:
;1328:		ArenaServers_StopRefresh();
ADDRGP4 ArenaServers_StopRefresh
CALLV
pop
line 1329
;1329:		ArenaServers_SaveChanges();
ADDRGP4 ArenaServers_SaveChanges
CALLV
pop
line 1330
;1330:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 1331
;1331:		break;
ADDRGP4 $635
JUMPV
LABELV $690
line 1334
;1332:
;1333:	case ID_REFRESH:
;1334:		ArenaServers_StartRefresh();
ADDRGP4 ArenaServers_StartRefresh
CALLV
pop
line 1335
;1335:		break;
ADDRGP4 $635
JUMPV
LABELV $691
line 1338
;1336:
;1337:	case ID_SPECIFY:
;1338:		UI_SpecifyServerMenu();
ADDRGP4 UI_SpecifyServerMenu
CALLV
pop
line 1339
;1339:		break;
ADDRGP4 $635
JUMPV
LABELV $692
line 1342
;1340:
;1341:	case ID_CREATE:
;1342:		UI_StartServerMenu( qtrue );
CNSTI4 1
ARGI4
ADDRGP4 UI_StartServerMenu
CALLV
pop
line 1343
;1343:		break;
ADDRGP4 $635
JUMPV
LABELV $693
line 1346
;1344:
;1345:	case ID_CONNECT:
;1346:		ArenaServers_Go();
ADDRGP4 ArenaServers_Go
CALLV
pop
line 1347
;1347:		break;
ADDRGP4 $635
JUMPV
LABELV $694
line 1350
;1348:
;1349:	case ID_REMOVE:
;1350:		ArenaServers_Remove();
ADDRGP4 ArenaServers_Remove
CALLV
pop
line 1351
;1351:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1352
;1352:		break;
LABELV $634
LABELV $635
line 1354
;1353:	}
;1354:}
LABELV $631
endproc ArenaServers_Event 16 8
proc ArenaServers_MenuDraw 0 4
line 1363
;1355:
;1356:
;1357:/*
;1358:=================
;1359:ArenaServers_MenuDraw
;1360:=================
;1361:*/
;1362:static void ArenaServers_MenuDraw( void )
;1363:{
line 1364
;1364:	if (g_arenaservers.refreshservers)
ADDRGP4 g_arenaservers+56632
INDIRI4
CNSTI4 0
EQI4 $698
line 1365
;1365:		ArenaServers_DoRefresh();
ADDRGP4 ArenaServers_DoRefresh
CALLV
pop
LABELV $698
line 1367
;1366:
;1367:	Menu_Draw( &g_arenaservers.menu );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 1368
;1368:}
LABELV $697
endproc ArenaServers_MenuDraw 0 4
proc ArenaServers_MenuKey 20 8
line 1376
;1369:
;1370:
;1371:/*
;1372:=================
;1373:ArenaServers_MenuKey
;1374:=================
;1375:*/
;1376:static sfxHandle_t ArenaServers_MenuKey( int key ) {
line 1377
;1377:	if ( key == K_SPACE  && g_arenaservers.refreshservers ) {
ADDRFP4 0
INDIRI4
CNSTI4 32
NEI4 $702
ADDRGP4 g_arenaservers+56632
INDIRI4
CNSTI4 0
EQI4 $702
line 1378
;1378:		ArenaServers_StopRefresh();	
ADDRGP4 ArenaServers_StopRefresh
CALLV
pop
line 1379
;1379:		return menu_move_sound;
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $701
JUMPV
LABELV $702
line 1382
;1380:	}
;1381:
;1382:	if ( ( key == K_DEL || key == K_KP_DEL ) && ( g_servertype == AS_FAVORITES ) &&
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 140
EQI4 $708
ADDRLP4 0
INDIRI4
CNSTI4 171
NEI4 $705
LABELV $708
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
NEI4 $705
ADDRGP4 g_arenaservers
ARGP4
ADDRLP4 4
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRGP4 g_arenaservers+824
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
NEU4 $705
line 1383
;1383:		( Menu_ItemAtCursor( &g_arenaservers.menu) == &g_arenaservers.list ) ) {
line 1384
;1384:		ArenaServers_Remove();
ADDRGP4 ArenaServers_Remove
CALLV
pop
line 1385
;1385:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1386
;1386:		return menu_move_sound;
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $701
JUMPV
LABELV $705
line 1389
;1387:	}
;1388:
;1389:	if ( key == K_MOUSE2 || key == K_ESCAPE ) {
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 179
EQI4 $711
ADDRLP4 8
INDIRI4
CNSTI4 27
NEI4 $709
LABELV $711
line 1390
;1390:		ArenaServers_StopRefresh();
ADDRGP4 ArenaServers_StopRefresh
CALLV
pop
line 1391
;1391:		ArenaServers_SaveChanges();
ADDRGP4 ArenaServers_SaveChanges
CALLV
pop
line 1392
;1392:	}
LABELV $709
line 1394
;1393:
;1394:	if ( key == '/' && Menu_ItemAtCursor( &g_arenaservers.menu ) == (menucommon_s *)&g_arenaservers.list ) {
ADDRFP4 0
INDIRI4
CNSTI4 47
NEI4 $712
ADDRGP4 g_arenaservers
ARGP4
ADDRLP4 12
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRGP4 g_arenaservers+824
CVPU4 4
ADDRLP4 12
INDIRP4
CVPU4 4
NEU4 $712
line 1395
;1395:		Menu_SetCursorToItem( (menuframework_s *)&g_arenaservers, &g_arenaservers.filter );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+2004
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 1396
;1396:		g_arenaservers.filter.field.skipKey = qtrue;
ADDRGP4 g_arenaservers+2004+64+272
CNSTI4 1
ASGNI4
line 1397
;1397:		return menu_in_sound;
ADDRGP4 menu_in_sound
INDIRI4
RETI4
ADDRGP4 $701
JUMPV
LABELV $712
line 1400
;1398:	}
;1399:
;1400:	return Menu_DefaultKey( &g_arenaservers.menu, key );
ADDRGP4 g_arenaservers
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
RETI4
LABELV $701
endproc ArenaServers_MenuKey 20 8
bss
align 1
LABELV $720
skip 64
code
proc ArenaServers_MenuInit 36 16
line 1409
;1401:}
;1402:
;1403:
;1404:/*
;1405:=================
;1406:ArenaServers_MenuInit
;1407:=================
;1408:*/
;1409:static void ArenaServers_MenuInit( void ) {
line 1417
;1410:	int			i;
;1411:	int			type;
;1412:	int			y;
;1413:	int			value;
;1414:	static char	statusbuffer[ MAX_STATUSLENGTH ];
;1415:
;1416:	// zero set all our globals
;1417:	memset( &g_arenaservers, 0 ,sizeof(arenaservers_t) );
ADDRGP4 g_arenaservers
ARGP4
CNSTI4 0
ARGI4
CNSTI4 57932
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1419
;1418:
;1419:	ArenaServers_Cache();
ADDRGP4 ArenaServers_Cache
CALLV
pop
line 1421
;1420:
;1421:	g_arenaservers.menu.fullscreen = qtrue;
ADDRGP4 g_arenaservers+280
CNSTI4 1
ASGNI4
line 1422
;1422:	g_arenaservers.menu.wrapAround = qtrue;
ADDRGP4 g_arenaservers+276
CNSTI4 1
ASGNI4
line 1423
;1423:	g_arenaservers.menu.draw       = ArenaServers_MenuDraw;
ADDRGP4 g_arenaservers+268
ADDRGP4 ArenaServers_MenuDraw
ASGNP4
line 1424
;1424:	g_arenaservers.menu.key        = ArenaServers_MenuKey;
ADDRGP4 g_arenaservers+272
ADDRGP4 ArenaServers_MenuKey
ASGNP4
line 1426
;1425:
;1426:	g_arenaservers.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 g_arenaservers+288
CNSTI4 10
ASGNI4
line 1427
;1427:	g_arenaservers.banner.generic.flags = QMF_CENTER_JUSTIFY;
ADDRGP4 g_arenaservers+288+44
CNSTU4 8
ASGNU4
line 1428
;1428:	g_arenaservers.banner.generic.x	    = 320;
ADDRGP4 g_arenaservers+288+12
CNSTI4 320
ASGNI4
line 1429
;1429:	g_arenaservers.banner.generic.y	    = 16;
ADDRGP4 g_arenaservers+288+16
CNSTI4 16
ASGNI4
line 1430
;1430:	g_arenaservers.banner.string  		= "ARENA SERVERS";
ADDRGP4 g_arenaservers+288+64
ADDRGP4 $734
ASGNP4
line 1431
;1431:	g_arenaservers.banner.style  	    = UI_CENTER;
ADDRGP4 g_arenaservers+288+68
CNSTI4 1
ASGNI4
line 1432
;1432:	g_arenaservers.banner.color  	    = color_white;
ADDRGP4 g_arenaservers+288+72
ADDRGP4 color_white
ASGNP4
line 1434
;1433:
;1434:	y = 80;
ADDRLP4 4
CNSTI4 80
ASGNI4
line 1435
;1435:	g_arenaservers.master.generic.type			= MTYPE_SPINCONTROL;
ADDRGP4 g_arenaservers+364
CNSTI4 3
ASGNI4
line 1436
;1436:	g_arenaservers.master.generic.name			= "Servers:";
ADDRGP4 g_arenaservers+364+4
ADDRGP4 $742
ASGNP4
line 1437
;1437:	g_arenaservers.master.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+364+44
CNSTU4 258
ASGNU4
line 1438
;1438:	g_arenaservers.master.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+364+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1439
;1439:	g_arenaservers.master.generic.id			= ID_MASTER;
ADDRGP4 g_arenaservers+364+8
CNSTI4 10
ASGNI4
line 1440
;1440:	g_arenaservers.master.generic.x				= 320;
ADDRGP4 g_arenaservers+364+12
CNSTI4 320
ASGNI4
line 1441
;1441:	g_arenaservers.master.generic.y				= y;
ADDRGP4 g_arenaservers+364+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1442
;1442:	g_arenaservers.master.itemnames				= master_items;
ADDRGP4 g_arenaservers+364+88
ADDRGP4 master_items
ASGNP4
line 1444
;1443:
;1444:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1445
;1445:	g_arenaservers.gametype.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 g_arenaservers+472
CNSTI4 3
ASGNI4
line 1446
;1446:	g_arenaservers.gametype.generic.name		= "Game Type:";
ADDRGP4 g_arenaservers+472+4
ADDRGP4 $758
ASGNP4
line 1447
;1447:	g_arenaservers.gametype.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+472+44
CNSTU4 258
ASGNU4
line 1448
;1448:	g_arenaservers.gametype.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+472+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1449
;1449:	g_arenaservers.gametype.generic.id			= ID_GAMETYPE;
ADDRGP4 g_arenaservers+472+8
CNSTI4 11
ASGNI4
line 1450
;1450:	g_arenaservers.gametype.generic.x			= 320;
ADDRGP4 g_arenaservers+472+12
CNSTI4 320
ASGNI4
line 1451
;1451:	g_arenaservers.gametype.generic.y			= y;
ADDRGP4 g_arenaservers+472+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1452
;1452:	g_arenaservers.gametype.itemnames			= servertype_items;
ADDRGP4 g_arenaservers+472+88
ADDRGP4 servertype_items
ASGNP4
line 1454
;1453:
;1454:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1455
;1455:	g_arenaservers.sortkey.generic.type			= MTYPE_SPINCONTROL;
ADDRGP4 g_arenaservers+580
CNSTI4 3
ASGNI4
line 1456
;1456:	g_arenaservers.sortkey.generic.name			= "Sort By:";
ADDRGP4 g_arenaservers+580+4
ADDRGP4 $774
ASGNP4
line 1457
;1457:	g_arenaservers.sortkey.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+580+44
CNSTU4 258
ASGNU4
line 1458
;1458:	g_arenaservers.sortkey.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+580+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1459
;1459:	g_arenaservers.sortkey.generic.id			= ID_SORTKEY;
ADDRGP4 g_arenaservers+580+8
CNSTI4 12
ASGNI4
line 1460
;1460:	g_arenaservers.sortkey.generic.x			= 320;
ADDRGP4 g_arenaservers+580+12
CNSTI4 320
ASGNI4
line 1461
;1461:	g_arenaservers.sortkey.generic.y			= y;
ADDRGP4 g_arenaservers+580+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1462
;1462:	g_arenaservers.sortkey.itemnames			= sortkey_items;
ADDRGP4 g_arenaservers+580+88
ADDRGP4 sortkey_items
ASGNP4
line 1464
;1463:
;1464:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1465
;1465:	g_arenaservers.showfull.generic.type		= MTYPE_RADIOBUTTON;
ADDRGP4 g_arenaservers+688
CNSTI4 5
ASGNI4
line 1466
;1466:	g_arenaservers.showfull.generic.name		= "Show Full:";
ADDRGP4 g_arenaservers+688+4
ADDRGP4 $790
ASGNP4
line 1467
;1467:	g_arenaservers.showfull.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+688+44
CNSTU4 258
ASGNU4
line 1468
;1468:	g_arenaservers.showfull.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+688+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1469
;1469:	g_arenaservers.showfull.generic.id			= ID_SHOW_FULL;
ADDRGP4 g_arenaservers+688+8
CNSTI4 13
ASGNI4
line 1470
;1470:	g_arenaservers.showfull.generic.x			= 320;
ADDRGP4 g_arenaservers+688+12
CNSTI4 320
ASGNI4
line 1471
;1471:	g_arenaservers.showfull.generic.y			= y;
ADDRGP4 g_arenaservers+688+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1473
;1472:
;1473:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1474
;1474:	g_arenaservers.showempty.generic.type		= MTYPE_RADIOBUTTON;
ADDRGP4 g_arenaservers+756
CNSTI4 5
ASGNI4
line 1475
;1475:	g_arenaservers.showempty.generic.name		= "Show Empty:";
ADDRGP4 g_arenaservers+756+4
ADDRGP4 $804
ASGNP4
line 1476
;1476:	g_arenaservers.showempty.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+756+44
CNSTU4 258
ASGNU4
line 1477
;1477:	g_arenaservers.showempty.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+756+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1478
;1478:	g_arenaservers.showempty.generic.id			= ID_SHOW_EMPTY;
ADDRGP4 g_arenaservers+756+8
CNSTI4 14
ASGNI4
line 1479
;1479:	g_arenaservers.showempty.generic.x			= 320;
ADDRGP4 g_arenaservers+756+12
CNSTI4 320
ASGNI4
line 1480
;1480:	g_arenaservers.showempty.generic.y			= y;
ADDRGP4 g_arenaservers+756+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1482
;1481:
;1482:	g_arenaservers.filter.generic.type			= MTYPE_FIELD;
ADDRGP4 g_arenaservers+2004
CNSTI4 4
ASGNI4
line 1483
;1483:	g_arenaservers.filter.generic.flags			= QMF_NODEFAULTINIT;
ADDRGP4 g_arenaservers+2004+44
CNSTU4 32768
ASGNU4
line 1484
;1484:	g_arenaservers.filter.generic.ownerdraw		= ArenaServers_DrawFilter;
ADDRGP4 g_arenaservers+2004+56
ADDRGP4 ArenaServers_DrawFilter
ASGNP4
line 1485
;1485:	g_arenaservers.filter.generic.id			= ID_FILTER;
ADDRGP4 g_arenaservers+2004+8
CNSTI4 24
ASGNI4
line 1486
;1486:	g_arenaservers.filter.field.widthInChars	= 36;
ADDRGP4 g_arenaservers+2004+64+8
CNSTI4 36
ASGNI4
line 1487
;1487:	g_arenaservers.filter.field.maxchars		= 36;
ADDRGP4 g_arenaservers+2004+64+268
CNSTI4 36
ASGNI4
line 1488
;1488:	g_arenaservers.filter.generic.x				= 216;
ADDRGP4 g_arenaservers+2004+12
CNSTI4 216
ASGNI4
line 1489
;1489:	g_arenaservers.filter.generic.y				= y + SMALLCHAR_HEIGHT;
ADDRGP4 g_arenaservers+2004+16
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1490
;1490:	g_arenaservers.filter.generic.left			= g_arenaservers.filter.generic.x;
ADDRGP4 g_arenaservers+2004+20
ADDRGP4 g_arenaservers+2004+12
INDIRI4
ASGNI4
line 1491
;1491:	g_arenaservers.filter.generic.right			= g_arenaservers.filter.generic.x + (g_arenaservers.filter.field.widthInChars + FILTER_CAPTION_CHARS )* SMALLCHAR_WIDTH + 1;
ADDRGP4 g_arenaservers+2004+28
ADDRGP4 g_arenaservers+2004+12
INDIRI4
ADDRGP4 g_arenaservers+2004+64+8
INDIRI4
CNSTI4 3
LSHI4
CNSTI4 104
ADDI4
ADDI4
CNSTI4 1
ADDI4
ASGNI4
line 1492
;1492:	g_arenaservers.filter.generic.top			= g_arenaservers.filter.generic.y;
ADDRGP4 g_arenaservers+2004+24
ADDRGP4 g_arenaservers+2004+16
INDIRI4
ASGNI4
line 1493
;1493:	g_arenaservers.filter.generic.bottom		= g_arenaservers.filter.generic.y + SMALLCHAR_HEIGHT;
ADDRGP4 g_arenaservers+2004+32
ADDRGP4 g_arenaservers+2004+16
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1495
;1494:
;1495:	y += 3 * SMALLCHAR_HEIGHT - 10;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 38
ADDI4
ASGNI4
line 1496
;1496:	g_arenaservers.list.generic.type			= MTYPE_SCROLLLIST;
ADDRGP4 g_arenaservers+824
CNSTI4 8
ASGNI4
line 1497
;1497:	g_arenaservers.list.generic.flags			= QMF_HIGHLIGHT_IF_FOCUS;
ADDRGP4 g_arenaservers+824+44
CNSTU4 128
ASGNU4
line 1498
;1498:	g_arenaservers.list.generic.id				= ID_LIST;
ADDRGP4 g_arenaservers+824+8
CNSTI4 15
ASGNI4
line 1499
;1499:	g_arenaservers.list.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+824+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1500
;1500:	g_arenaservers.list.generic.x				= 72;
ADDRGP4 g_arenaservers+824+12
CNSTI4 72
ASGNI4
line 1501
;1501:	g_arenaservers.list.generic.y				= y;
ADDRGP4 g_arenaservers+824+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1502
;1502:	g_arenaservers.list.width					= MAX_LISTBOXWIDTH;
ADDRGP4 g_arenaservers+824+92
CNSTI4 61
ASGNI4
line 1503
;1503:	g_arenaservers.list.height					= 12;
ADDRGP4 g_arenaservers+824+96
CNSTI4 12
ASGNI4
line 1504
;1504:	g_arenaservers.list.scroll					= 12;
ADDRGP4 g_arenaservers+824+80
CNSTI4 12
ASGNI4
line 1505
;1505:	g_arenaservers.list.generic.dblclick		= ArenaServers_Dblclick;
ADDRGP4 g_arenaservers+824+60
ADDRGP4 ArenaServers_Dblclick
ASGNP4
line 1506
;1506:	g_arenaservers.list.itemnames				= (const char **)g_arenaservers.items;
ADDRGP4 g_arenaservers+824+88
ADDRGP4 g_arenaservers+54568
ASGNP4
line 1507
;1507:	for( i = 0; i < MAX_LISTBOXITEMS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $873
line 1508
;1508:		g_arenaservers.items[i] = g_arenaservers.table[i].buff;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_arenaservers+54568
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 68
MULI4
ADDRGP4 g_arenaservers+19752
ADDP4
ASGNP4
line 1509
;1509:	}
LABELV $874
line 1507
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 512
LTI4 $873
line 1511
;1510:
;1511:	g_arenaservers.mappic.generic.type		= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+932
CNSTI4 6
ASGNI4
line 1512
;1512:	g_arenaservers.mappic.generic.flags		= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 g_arenaservers+932+44
CNSTU4 16388
ASGNU4
line 1513
;1513:	g_arenaservers.mappic.generic.x			= 72;
ADDRGP4 g_arenaservers+932+12
CNSTI4 72
ASGNI4
line 1514
;1514:	g_arenaservers.mappic.generic.y			= 80;
ADDRGP4 g_arenaservers+932+16
CNSTI4 80
ASGNI4
line 1515
;1515:	g_arenaservers.mappic.width				= 128;
ADDRGP4 g_arenaservers+932+80
CNSTI4 128
ASGNI4
line 1516
;1516:	g_arenaservers.mappic.height			= 96;
ADDRGP4 g_arenaservers+932+84
CNSTI4 96
ASGNI4
line 1517
;1517:	g_arenaservers.mappic.errorpic			= ART_UNKNOWNMAP;
ADDRGP4 g_arenaservers+932+68
ADDRGP4 $892
ASGNP4
line 1519
;1518:
;1519:	g_arenaservers.arrows.generic.type		= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1024
CNSTI4 6
ASGNI4
line 1520
;1520:	g_arenaservers.arrows.generic.name		= ART_ARROWS0;
ADDRGP4 g_arenaservers+1024+4
ADDRGP4 $896
ASGNP4
line 1521
;1521:	g_arenaservers.arrows.generic.flags		= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 g_arenaservers+1024+44
CNSTU4 16388
ASGNU4
line 1522
;1522:	g_arenaservers.arrows.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+1024+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1523
;1523:	g_arenaservers.arrows.generic.x			= 512+48;
ADDRGP4 g_arenaservers+1024+12
CNSTI4 560
ASGNI4
line 1524
;1524:	g_arenaservers.arrows.generic.y			= 240-64+32;
ADDRGP4 g_arenaservers+1024+16
CNSTI4 208
ASGNI4
line 1525
;1525:	g_arenaservers.arrows.width				= 64;
ADDRGP4 g_arenaservers+1024+80
CNSTI4 64
ASGNI4
line 1526
;1526:	g_arenaservers.arrows.height			= 128;
ADDRGP4 g_arenaservers+1024+84
CNSTI4 128
ASGNI4
line 1528
;1527:
;1528:	g_arenaservers.up.generic.type			= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1116
CNSTI4 6
ASGNI4
line 1529
;1529:	g_arenaservers.up.generic.flags			= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_MOUSEONLY;
ADDRGP4 g_arenaservers+1116+44
CNSTU4 2308
ASGNU4
line 1530
;1530:	g_arenaservers.up.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+1116+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1531
;1531:	g_arenaservers.up.generic.id			= ID_SCROLL_UP;
ADDRGP4 g_arenaservers+1116+8
CNSTI4 16
ASGNI4
line 1532
;1532:	g_arenaservers.up.generic.x				= 512+48;
ADDRGP4 g_arenaservers+1116+12
CNSTI4 560
ASGNI4
line 1533
;1533:	g_arenaservers.up.generic.y				= 240-64+32;
ADDRGP4 g_arenaservers+1116+16
CNSTI4 208
ASGNI4
line 1534
;1534:	g_arenaservers.up.width					= 64;
ADDRGP4 g_arenaservers+1116+80
CNSTI4 64
ASGNI4
line 1535
;1535:	g_arenaservers.up.height				= 64;
ADDRGP4 g_arenaservers+1116+84
CNSTI4 64
ASGNI4
line 1536
;1536:	g_arenaservers.up.focuspic				= ART_ARROWS_UP;
ADDRGP4 g_arenaservers+1116+64
ADDRGP4 $926
ASGNP4
line 1538
;1537:
;1538:	g_arenaservers.down.generic.type		= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1208
CNSTI4 6
ASGNI4
line 1539
;1539:	g_arenaservers.down.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_MOUSEONLY;
ADDRGP4 g_arenaservers+1208+44
CNSTU4 2308
ASGNU4
line 1540
;1540:	g_arenaservers.down.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+1208+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1541
;1541:	g_arenaservers.down.generic.id			= ID_SCROLL_DOWN;
ADDRGP4 g_arenaservers+1208+8
CNSTI4 17
ASGNI4
line 1542
;1542:	g_arenaservers.down.generic.x			= 512+48;
ADDRGP4 g_arenaservers+1208+12
CNSTI4 560
ASGNI4
line 1543
;1543:	g_arenaservers.down.generic.y			= 240+32;
ADDRGP4 g_arenaservers+1208+16
CNSTI4 272
ASGNI4
line 1544
;1544:	g_arenaservers.down.width				= 64;
ADDRGP4 g_arenaservers+1208+80
CNSTI4 64
ASGNI4
line 1545
;1545:	g_arenaservers.down.height				= 64;
ADDRGP4 g_arenaservers+1208+84
CNSTI4 64
ASGNI4
line 1546
;1546:	g_arenaservers.down.focuspic			= ART_ARROWS_DOWN;
ADDRGP4 g_arenaservers+1208+64
ADDRGP4 $944
ASGNP4
line 1548
;1547:
;1548:	y = 378;
ADDRLP4 4
CNSTI4 378
ASGNI4
line 1549
;1549:	g_arenaservers.status.generic.type		= MTYPE_TEXT;
ADDRGP4 g_arenaservers+1300
CNSTI4 7
ASGNI4
line 1550
;1550:	g_arenaservers.status.generic.x			= 320;
ADDRGP4 g_arenaservers+1300+12
CNSTI4 320
ASGNI4
line 1551
;1551:	g_arenaservers.status.generic.y			= y;
ADDRGP4 g_arenaservers+1300+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1552
;1552:	g_arenaservers.status.string			= statusbuffer;
ADDRGP4 g_arenaservers+1300+64
ADDRGP4 $720
ASGNP4
line 1553
;1553:	g_arenaservers.status.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 g_arenaservers+1300+68
CNSTI4 17
ASGNI4
line 1554
;1554:	g_arenaservers.status.color				= menu_text_color;
ADDRGP4 g_arenaservers+1300+72
ADDRGP4 menu_text_color
ASGNP4
line 1556
;1555:
;1556:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1557
;1557:	g_arenaservers.statusbar.generic.type   = MTYPE_TEXT;
ADDRGP4 g_arenaservers+1376
CNSTI4 7
ASGNI4
line 1558
;1558:	g_arenaservers.statusbar.generic.x	    = 320;
ADDRGP4 g_arenaservers+1376+12
CNSTI4 320
ASGNI4
line 1559
;1559:	g_arenaservers.statusbar.generic.y	    = y;
ADDRGP4 g_arenaservers+1376+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1560
;1560:	g_arenaservers.statusbar.string	        = "";
ADDRGP4 g_arenaservers+1376+64
ADDRGP4 $262
ASGNP4
line 1561
;1561:	g_arenaservers.statusbar.style	        = UI_CENTER|UI_SMALLFONT;
ADDRGP4 g_arenaservers+1376+68
CNSTI4 17
ASGNI4
line 1562
;1562:	g_arenaservers.statusbar.color	        = text_color_normal;
ADDRGP4 g_arenaservers+1376+72
ADDRGP4 text_color_normal
ASGNP4
line 1564
;1563:
;1564:	g_arenaservers.remove.generic.type		= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1452
CNSTI4 6
ASGNI4
line 1565
;1565:	g_arenaservers.remove.generic.name		= ART_REMOVE0;
ADDRGP4 g_arenaservers+1452+4
ADDRGP4 $970
ASGNP4
line 1566
;1566:	g_arenaservers.remove.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1452+44
CNSTU4 260
ASGNU4
line 1567
;1567:	g_arenaservers.remove.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+1452+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1568
;1568:	g_arenaservers.remove.generic.id		= ID_REMOVE;
ADDRGP4 g_arenaservers+1452+8
CNSTI4 23
ASGNI4
line 1569
;1569:	g_arenaservers.remove.generic.x			= 450;
ADDRGP4 g_arenaservers+1452+12
CNSTI4 450
ASGNI4
line 1570
;1570:	g_arenaservers.remove.generic.y			= 86;
ADDRGP4 g_arenaservers+1452+16
CNSTI4 86
ASGNI4
line 1571
;1571:	g_arenaservers.remove.width				= 96;
ADDRGP4 g_arenaservers+1452+80
CNSTI4 96
ASGNI4
line 1572
;1572:	g_arenaservers.remove.height			= 48;
ADDRGP4 g_arenaservers+1452+84
CNSTI4 48
ASGNI4
line 1573
;1573:	g_arenaservers.remove.focuspic			= ART_REMOVE1;
ADDRGP4 g_arenaservers+1452+64
ADDRGP4 $987
ASGNP4
line 1575
;1574:
;1575:	g_arenaservers.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1544
CNSTI4 6
ASGNI4
line 1576
;1576:	g_arenaservers.back.generic.name		= ART_BACK0;
ADDRGP4 g_arenaservers+1544+4
ADDRGP4 $991
ASGNP4
line 1577
;1577:	g_arenaservers.back.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1544+44
CNSTU4 260
ASGNU4
line 1578
;1578:	g_arenaservers.back.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+1544+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1579
;1579:	g_arenaservers.back.generic.id			= ID_BACK;
ADDRGP4 g_arenaservers+1544+8
CNSTI4 18
ASGNI4
line 1580
;1580:	g_arenaservers.back.generic.x			= 0;
ADDRGP4 g_arenaservers+1544+12
CNSTI4 0
ASGNI4
line 1581
;1581:	g_arenaservers.back.generic.y			= 480-64;
ADDRGP4 g_arenaservers+1544+16
CNSTI4 416
ASGNI4
line 1582
;1582:	g_arenaservers.back.width				= 128;
ADDRGP4 g_arenaservers+1544+80
CNSTI4 128
ASGNI4
line 1583
;1583:	g_arenaservers.back.height				= 64;
ADDRGP4 g_arenaservers+1544+84
CNSTI4 64
ASGNI4
line 1584
;1584:	g_arenaservers.back.focuspic			= ART_BACK1;
ADDRGP4 g_arenaservers+1544+64
ADDRGP4 $1008
ASGNP4
line 1586
;1585:
;1586:	g_arenaservers.specify.generic.type	    = MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1728
CNSTI4 6
ASGNI4
line 1587
;1587:	g_arenaservers.specify.generic.name		= ART_SPECIFY0;
ADDRGP4 g_arenaservers+1728+4
ADDRGP4 $1012
ASGNP4
line 1588
;1588:	g_arenaservers.specify.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1728+44
CNSTU4 260
ASGNU4
line 1589
;1589:	g_arenaservers.specify.generic.callback = ArenaServers_Event;
ADDRGP4 g_arenaservers+1728+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1590
;1590:	g_arenaservers.specify.generic.id	    = ID_SPECIFY;
ADDRGP4 g_arenaservers+1728+8
CNSTI4 20
ASGNI4
line 1591
;1591:	g_arenaservers.specify.generic.x		= 128;
ADDRGP4 g_arenaservers+1728+12
CNSTI4 128
ASGNI4
line 1592
;1592:	g_arenaservers.specify.generic.y		= 480-64;
ADDRGP4 g_arenaservers+1728+16
CNSTI4 416
ASGNI4
line 1593
;1593:	g_arenaservers.specify.width  		    = 128;
ADDRGP4 g_arenaservers+1728+80
CNSTI4 128
ASGNI4
line 1594
;1594:	g_arenaservers.specify.height  		    = 64;
ADDRGP4 g_arenaservers+1728+84
CNSTI4 64
ASGNI4
line 1595
;1595:	g_arenaservers.specify.focuspic         = ART_SPECIFY1;
ADDRGP4 g_arenaservers+1728+64
ADDRGP4 $1029
ASGNP4
line 1597
;1596:
;1597:	g_arenaservers.refresh.generic.type		= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1636
CNSTI4 6
ASGNI4
line 1598
;1598:	g_arenaservers.refresh.generic.name		= ART_REFRESH0;
ADDRGP4 g_arenaservers+1636+4
ADDRGP4 $1033
ASGNP4
line 1599
;1599:	g_arenaservers.refresh.generic.flags	= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1636+44
CNSTU4 260
ASGNU4
line 1600
;1600:	g_arenaservers.refresh.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+1636+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1601
;1601:	g_arenaservers.refresh.generic.id		= ID_REFRESH;
ADDRGP4 g_arenaservers+1636+8
CNSTI4 19
ASGNI4
line 1602
;1602:	g_arenaservers.refresh.generic.x		= 256;
ADDRGP4 g_arenaservers+1636+12
CNSTI4 256
ASGNI4
line 1603
;1603:	g_arenaservers.refresh.generic.y		= 480-64;
ADDRGP4 g_arenaservers+1636+16
CNSTI4 416
ASGNI4
line 1604
;1604:	g_arenaservers.refresh.width			= 128;
ADDRGP4 g_arenaservers+1636+80
CNSTI4 128
ASGNI4
line 1605
;1605:	g_arenaservers.refresh.height			= 64;
ADDRGP4 g_arenaservers+1636+84
CNSTI4 64
ASGNI4
line 1606
;1606:	g_arenaservers.refresh.focuspic			= ART_REFRESH1;
ADDRGP4 g_arenaservers+1636+64
ADDRGP4 $1050
ASGNP4
line 1608
;1607:
;1608:	g_arenaservers.create.generic.type		= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1820
CNSTI4 6
ASGNI4
line 1609
;1609:	g_arenaservers.create.generic.name		= ART_CREATE0;
ADDRGP4 g_arenaservers+1820+4
ADDRGP4 $1054
ASGNP4
line 1610
;1610:	g_arenaservers.create.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1820+44
CNSTU4 260
ASGNU4
line 1611
;1611:	g_arenaservers.create.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+1820+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1612
;1612:	g_arenaservers.create.generic.id		= ID_CREATE;
ADDRGP4 g_arenaservers+1820+8
CNSTI4 21
ASGNI4
line 1613
;1613:	g_arenaservers.create.generic.x			= 384;
ADDRGP4 g_arenaservers+1820+12
CNSTI4 384
ASGNI4
line 1614
;1614:	g_arenaservers.create.generic.y			= 480-64;
ADDRGP4 g_arenaservers+1820+16
CNSTI4 416
ASGNI4
line 1615
;1615:	g_arenaservers.create.width				= 128;
ADDRGP4 g_arenaservers+1820+80
CNSTI4 128
ASGNI4
line 1616
;1616:	g_arenaservers.create.height			= 64;
ADDRGP4 g_arenaservers+1820+84
CNSTI4 64
ASGNI4
line 1617
;1617:	g_arenaservers.create.focuspic			= ART_CREATE1;
ADDRGP4 g_arenaservers+1820+64
ADDRGP4 $1071
ASGNP4
line 1619
;1618:
;1619:	g_arenaservers.go.generic.type			= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1912
CNSTI4 6
ASGNI4
line 1620
;1620:	g_arenaservers.go.generic.name			= ART_CONNECT0;
ADDRGP4 g_arenaservers+1912+4
ADDRGP4 $1075
ASGNP4
line 1621
;1621:	g_arenaservers.go.generic.flags			= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1912+44
CNSTU4 272
ASGNU4
line 1622
;1622:	g_arenaservers.go.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+1912+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1623
;1623:	g_arenaservers.go.generic.id			= ID_CONNECT;
ADDRGP4 g_arenaservers+1912+8
CNSTI4 22
ASGNI4
line 1624
;1624:	g_arenaservers.go.generic.x				= 640;
ADDRGP4 g_arenaservers+1912+12
CNSTI4 640
ASGNI4
line 1625
;1625:	g_arenaservers.go.generic.y				= 480-64;
ADDRGP4 g_arenaservers+1912+16
CNSTI4 416
ASGNI4
line 1626
;1626:	g_arenaservers.go.width					= 128;
ADDRGP4 g_arenaservers+1912+80
CNSTI4 128
ASGNI4
line 1627
;1627:	g_arenaservers.go.height				= 64;
ADDRGP4 g_arenaservers+1912+84
CNSTI4 64
ASGNI4
line 1628
;1628:	g_arenaservers.go.focuspic				= ART_CONNECT1;
ADDRGP4 g_arenaservers+1912+64
ADDRGP4 $1092
ASGNP4
line 1630
;1629:
;1630:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.banner );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1632
;1631:
;1632:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.master );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+364
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1633
;1633:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.gametype );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+472
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1634
;1634:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.sortkey );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+580
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1635
;1635:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.showfull);
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+688
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1636
;1636:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.showempty );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+756
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1638
;1637:
;1638:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.filter );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+2004
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1640
;1639:
;1640:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.mappic );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+932
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1641
;1641:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.list );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+824
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1642
;1642:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.status );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1300
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1643
;1643:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.statusbar );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1376
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1644
;1644:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.arrows );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1024
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1645
;1645:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.up );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1116
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1646
;1646:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.down );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1208
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1648
;1647:
;1648:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.remove );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1452
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1649
;1649:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.back );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1544
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1650
;1650:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.specify );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1728
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1651
;1651:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.refresh );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1636
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1652
;1652:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.create );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1820
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1653
;1653:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.go );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1912
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1655
;1654:
;1655:	ArenaServers_LoadFavorites();
ADDRGP4 ArenaServers_LoadFavorites
CALLV
pop
line 1657
;1656:
;1657:	g_servertype = Com_Clamp( 0, 3, ui_browserMaster.integer );
CNSTF4 0
ARGF4
CNSTF4 1077936128
ARGF4
ADDRGP4 ui_browserMaster+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 g_servertype
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
line 1659
;1658:	// hack to get rid of MPlayer stuff
;1659:	value = g_servertype;
ADDRLP4 8
ADDRGP4 g_servertype
INDIRI4
ASGNI4
line 1660
;1660:	if (value >= 1)
ADDRLP4 8
INDIRI4
CNSTI4 1
LTI4 $1114
line 1661
;1661:		value--;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $1114
line 1662
;1662:	g_arenaservers.master.curvalue = value;
ADDRGP4 g_arenaservers+364+68
ADDRLP4 8
INDIRI4
ASGNI4
line 1664
;1663:
;1664:	g_gametype = Com_Clamp( 0, GT_MAX_GAME_TYPE-1, ui_browserGameType.integer );
CNSTF4 0
ARGF4
CNSTF4 1088421888
ARGF4
ADDRGP4 ui_browserGameType+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 g_gametype
ADDRLP4 20
INDIRF4
CVFI4 4
ASGNI4
line 1665
;1665:	g_arenaservers.gametype.curvalue = g_gametype;
ADDRGP4 g_arenaservers+472+68
ADDRGP4 g_gametype
INDIRI4
ASGNI4
line 1667
;1666:
;1667:	g_sortkey = Com_Clamp( 0, 4, ui_browserSortKey.integer );
CNSTF4 0
ARGF4
CNSTF4 1082130432
ARGF4
ADDRGP4 ui_browserSortKey+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 g_sortkey
ADDRLP4 24
INDIRF4
CVFI4 4
ASGNI4
line 1668
;1668:	g_arenaservers.sortkey.curvalue = g_sortkey;
ADDRGP4 g_arenaservers+580+68
ADDRGP4 g_sortkey
INDIRI4
ASGNI4
line 1670
;1669:
;1670:	g_fullservers = Com_Clamp( 0, 1, ui_browserShowFull.integer );
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 ui_browserShowFull+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 28
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 g_fullservers
ADDRLP4 28
INDIRF4
CVFI4 4
ASGNI4
line 1671
;1671:	g_arenaservers.showfull.curvalue = g_fullservers;
ADDRGP4 g_arenaservers+688+64
ADDRGP4 g_fullservers
INDIRI4
ASGNI4
line 1673
;1672:
;1673:	g_emptyservers = Com_Clamp( 0, 1, ui_browserShowEmpty.integer );
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 ui_browserShowEmpty+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 32
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 g_emptyservers
ADDRLP4 32
INDIRF4
CVFI4 4
ASGNI4
line 1674
;1674:	g_arenaservers.showempty.curvalue = g_emptyservers;
ADDRGP4 g_arenaservers+756+64
ADDRGP4 g_emptyservers
INDIRI4
ASGNI4
line 1677
;1675:	
;1676:	// force to initial state and refresh
;1677:	type = g_servertype;
ADDRLP4 12
ADDRGP4 g_servertype
INDIRI4
ASGNI4
line 1678
;1678:	g_servertype = -1;
ADDRGP4 g_servertype
CNSTI4 -1
ASGNI4
line 1679
;1679:	ArenaServers_SetType( type );
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 ArenaServers_SetType
CALLV
pop
line 1681
;1680:
;1681:	trap_Cvar_Register(NULL, "debug_protocol", "", 0 );
CNSTP4 0
ARGP4
ADDRGP4 $575
ARGP4
ADDRGP4 $262
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1682
;1682:}
LABELV $719
endproc ArenaServers_MenuInit 36 16
export ArenaServers_Cache
proc ArenaServers_Cache 0 4
line 1690
;1683:
;1684:
;1685:/*
;1686:=================
;1687:ArenaServers_Cache
;1688:=================
;1689:*/
;1690:void ArenaServers_Cache( void ) {
line 1691
;1691:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $991
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1692
;1692:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $1008
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1693
;1693:	trap_R_RegisterShaderNoMip( ART_CREATE0 );
ADDRGP4 $1054
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1694
;1694:	trap_R_RegisterShaderNoMip( ART_CREATE1 );
ADDRGP4 $1071
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1695
;1695:	trap_R_RegisterShaderNoMip( ART_SPECIFY0 );
ADDRGP4 $1012
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1696
;1696:	trap_R_RegisterShaderNoMip( ART_SPECIFY1 );
ADDRGP4 $1029
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1697
;1697:	trap_R_RegisterShaderNoMip( ART_REFRESH0 );
ADDRGP4 $1033
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1698
;1698:	trap_R_RegisterShaderNoMip( ART_REFRESH1 );
ADDRGP4 $1050
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1699
;1699:	trap_R_RegisterShaderNoMip( ART_CONNECT0 );
ADDRGP4 $1075
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1700
;1700:	trap_R_RegisterShaderNoMip( ART_CONNECT1 );
ADDRGP4 $1092
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1701
;1701:	trap_R_RegisterShaderNoMip( ART_ARROWS0  );
ADDRGP4 $896
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1702
;1702:	trap_R_RegisterShaderNoMip( ART_ARROWS_UP );
ADDRGP4 $926
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1703
;1703:	trap_R_RegisterShaderNoMip( ART_ARROWS_DOWN );
ADDRGP4 $944
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1704
;1704:	trap_R_RegisterShaderNoMip( ART_UNKNOWNMAP );
ADDRGP4 $892
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1705
;1705:}
LABELV $1130
endproc ArenaServers_Cache 0 4
export UI_ArenaServersMenu
proc UI_ArenaServersMenu 0 4
line 1713
;1706:
;1707:
;1708:/*
;1709:=================
;1710:UI_ArenaServersMenu
;1711:=================
;1712:*/
;1713:void UI_ArenaServersMenu( void ) {
line 1714
;1714:	ArenaServers_MenuInit();
ADDRGP4 ArenaServers_MenuInit
CALLV
pop
line 1715
;1715:	UI_PushMenu( &g_arenaservers.menu );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 1716
;1716:}						  
LABELV $1131
endproc UI_ArenaServersMenu 0 4
bss
align 4
LABELV g_fullservers
skip 4
align 4
LABELV g_emptyservers
skip 4
align 4
LABELV g_sortkey
skip 4
align 4
LABELV g_gametype
skip 4
align 4
LABELV g_servertype
skip 4
align 4
LABELV g_numfavoriteservers
skip 4
align 4
LABELV g_favoriteserverlist
skip 2304
align 4
LABELV g_numlocalservers
skip 4
align 4
LABELV g_localserverlist
skip 73728
align 4
LABELV g_numglobalservers
skip 4
align 4
LABELV g_globalserverlist
skip 442368
align 4
LABELV g_arenaservers
skip 57932
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
LABELV $1092
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
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $1075
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
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $1071
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $1054
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $1050
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 114
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $1033
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 114
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $1029
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 121
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $1012
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 121
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $1008
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
LABELV $991
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
LABELV $987
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 100
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $970
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 100
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $944
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
LABELV $926
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
LABELV $896
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
LABELV $892
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
LABELV $804
byte 1 83
byte 1 104
byte 1 111
byte 1 119
byte 1 32
byte 1 69
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 58
byte 1 0
align 1
LABELV $790
byte 1 83
byte 1 104
byte 1 111
byte 1 119
byte 1 32
byte 1 70
byte 1 117
byte 1 108
byte 1 108
byte 1 58
byte 1 0
align 1
LABELV $774
byte 1 83
byte 1 111
byte 1 114
byte 1 116
byte 1 32
byte 1 66
byte 1 121
byte 1 58
byte 1 0
align 1
LABELV $758
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $742
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $734
byte 1 65
byte 1 82
byte 1 69
byte 1 78
byte 1 65
byte 1 32
byte 1 83
byte 1 69
byte 1 82
byte 1 86
byte 1 69
byte 1 82
byte 1 83
byte 1 0
align 1
LABELV $673
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 83
byte 1 104
byte 1 111
byte 1 119
byte 1 69
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $663
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 83
byte 1 104
byte 1 111
byte 1 119
byte 1 70
byte 1 117
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $653
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 83
byte 1 111
byte 1 114
byte 1 116
byte 1 75
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $643
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $641
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 77
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $630
byte 1 104
byte 1 105
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $580
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
LABELV $579
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 48
byte 1 32
byte 1 37
byte 1 100
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $578
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 48
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $575
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 95
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
LABELV $574
byte 1 32
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $573
byte 1 32
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $545
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $475
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $425
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
LABELV $419
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $414
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
LABELV $411
byte 1 110
byte 1 101
byte 1 116
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $406
byte 1 109
byte 1 97
byte 1 120
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $405
byte 1 109
byte 1 105
byte 1 110
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $404
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
byte 1 0
align 1
LABELV $403
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $402
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $398
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
LABELV $380
byte 1 112
byte 1 117
byte 1 110
byte 1 107
byte 1 98
byte 1 117
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $377
byte 1 113
byte 1 51
byte 1 117
byte 1 116
byte 1 52
byte 1 0
align 1
LABELV $374
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $285
byte 1 78
byte 1 111
byte 1 32
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
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
LABELV $282
byte 1 78
byte 1 111
byte 1 32
byte 1 82
byte 1 101
byte 1 115
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 101
byte 1 32
byte 1 70
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 77
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 46
byte 1 0
align 1
LABELV $268
byte 1 83
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 70
byte 1 111
byte 1 114
byte 1 32
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 46
byte 1 0
align 1
LABELV $262
byte 1 0
align 1
LABELV $247
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 83
byte 1 80
byte 1 65
byte 1 67
byte 1 69
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 116
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $242
byte 1 37
byte 1 100
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 32
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 46
byte 1 0
align 1
LABELV $224
byte 1 37
byte 1 45
byte 1 42
byte 1 46
byte 1 42
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 42
byte 1 46
byte 1 42
byte 1 115
byte 1 32
byte 1 37
byte 1 50
byte 1 100
byte 1 47
byte 1 37
byte 1 50
byte 1 100
byte 1 32
byte 1 37
byte 1 45
byte 1 42
byte 1 46
byte 1 42
byte 1 115
byte 1 32
byte 1 37
byte 1 51
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 51
byte 1 100
byte 1 0
align 1
LABELV $223
byte 1 94
byte 1 49
byte 1 0
align 1
LABELV $222
byte 1 94
byte 1 51
byte 1 0
align 1
LABELV $219
byte 1 94
byte 1 50
byte 1 0
align 1
LABELV $214
byte 1 94
byte 1 52
byte 1 0
align 1
LABELV $175
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
LABELV $161
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $120
byte 1 99
byte 1 108
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $100
byte 1 70
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $90
byte 1 105
byte 1 115
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 101
byte 1 100
byte 1 46
byte 1 0
align 1
LABELV $89
byte 1 81
byte 1 117
byte 1 97
byte 1 107
byte 1 101
byte 1 32
byte 1 73
byte 1 73
byte 1 73
byte 1 32
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $88
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $87
byte 1 80
byte 1 117
byte 1 110
byte 1 107
byte 1 66
byte 1 117
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 98
byte 1 101
byte 1 0
align 1
LABELV $86
byte 1 69
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $85
byte 1 68
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $84
byte 1 73
byte 1 80
byte 1 88
byte 1 0
align 1
LABELV $83
byte 1 85
byte 1 68
byte 1 80
byte 1 0
align 1
LABELV $82
byte 1 63
byte 1 63
byte 1 63
byte 1 0
align 1
LABELV $81
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $80
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $79
byte 1 79
byte 1 112
byte 1 101
byte 1 110
byte 1 32
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 83
byte 1 112
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $78
byte 1 77
byte 1 97
byte 1 112
byte 1 32
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $77
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $76
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $75
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 68
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $74
byte 1 84
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $73
byte 1 70
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 70
byte 1 111
byte 1 114
byte 1 32
byte 1 65
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $72
byte 1 65
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $71
byte 1 70
byte 1 97
byte 1 118
byte 1 111
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $70
byte 1 73
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 110
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $69
byte 1 76
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 0
