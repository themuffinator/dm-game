data
align 4
LABELV gametype_items
address $70
address $71
address $72
address $73
byte 4 0
align 4
LABELV gametype_remap
byte 4 1
byte 4 2
byte 4 3
byte 4 4
align 4
LABELV gametype_remap2
byte 4 0
byte 4 1
byte 4 0
byte 4 2
byte 4 3
code
proc GametypeBits 24 8
file "..\..\..\..\code\q3_ui\ui_startserver.c"
line 94
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=============================================================================
;5:
;6:START SERVER MENU *****
;7:
;8:=============================================================================
;9:*/
;10:
;11:
;12:#include "ui_local.h"
;13:
;14:
;15:#define GAMESERVER_BACK0		"menu/art/back_0"
;16:#define GAMESERVER_BACK1		"menu/art/back_1"
;17:#define GAMESERVER_NEXT0		"menu/art/next_0"
;18:#define GAMESERVER_NEXT1		"menu/art/next_1"
;19:#define GAMESERVER_FRAMEL		"menu/art/frame2_l"
;20:#define GAMESERVER_FRAMER		"menu/art/frame1_r"
;21:#define GAMESERVER_SELECT		"menu/art/maps_select"
;22:#define GAMESERVER_SELECTED		"menu/art/maps_selected"
;23:#define GAMESERVER_FIGHT0		"menu/art/fight_0"
;24:#define GAMESERVER_FIGHT1		"menu/art/fight_1"
;25:#define GAMESERVER_UNKNOWNMAP	"menu/art/unknownmap"
;26:#define GAMESERVER_ARROWS		"menu/art/gs_arrows_0"
;27:#define GAMESERVER_ARROWSL		"menu/art/gs_arrows_l"
;28:#define GAMESERVER_ARROWSR		"menu/art/gs_arrows_r"
;29:
;30:#define MAX_MAPROWS		2
;31:#define MAX_MAPCOLS		2
;32:#define MAX_MAPSPERPAGE	4
;33:
;34:#define MAX_NAMELENGTH	16
;35:
;36:#define ID_GAMETYPE				10
;37:#define ID_PICTURES				11	// 12, 13, 14
;38:#define ID_PREVPAGE				15
;39:#define ID_NEXTPAGE				16
;40:#define ID_STARTSERVERBACK		17
;41:#define ID_STARTSERVERNEXT		18
;42:
;43:typedef struct {
;44:	menuframework_s	menu;
;45:
;46:	menutext_s		banner;
;47:	menubitmap_s	framel;
;48:	menubitmap_s	framer;
;49:
;50:	menulist_s		gametype;
;51:	menubitmap_s	mappics[MAX_MAPSPERPAGE];
;52:	menubitmap_s	mapbuttons[MAX_MAPSPERPAGE];
;53:	menubitmap_s	arrows;
;54:	menubitmap_s	prevpage;
;55:	menubitmap_s	nextpage;
;56:	menubitmap_s	back;
;57:	menubitmap_s	next;
;58:
;59:	menutext_s		mapname;
;60:	menubitmap_s	item_null;
;61:
;62:	qboolean		multiplayer;
;63:	int				currentmap;
;64:	int				nummaps;
;65:	int				page;
;66:	int				maxpages;
;67:	int 			maplist[MAX_ARENAS];
;68:} startserver_t;
;69:
;70:static startserver_t s_startserver;
;71:
;72:static const char *gametype_items[] = {
;73:	"Free For All",
;74:	"Tournament",
;75:	"Team Deathmatch",
;76:	"Capture the Flag",
;77:	NULL
;78:};
;79:
;80:static int gametype_remap[] = { GT_FFA, GT_DUEL, GT_TDM, GT_CTF };
;81:static int gametype_remap2[] = {0, 1, 0, 2, 3};
;82:
;83:// use ui_servers2.c definition
;84:extern const char* punkbuster_items[];
;85:
;86:static void UI_ServerOptionsMenu( qboolean multiplayer );
;87:
;88:
;89:/*
;90:=================
;91:GametypeBits
;92:=================
;93:*/
;94:static int GametypeBits( char *string ) {
line 99
;95:	int		bits, i;
;96:	char	*p;
;97:	char	*token;
;98:
;99:	bits = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 100
;100:	p = string;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $76
JUMPV
LABELV $75
line 101
;101:	while( 1 ) {
line 102
;102:		token = COM_ParseExt( &p, qfalse );
ADDRLP4 12
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 16
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
ASGNP4
line 103
;103:		if( token[0] == 0 ) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $78
line 104
;104:			break;
ADDRGP4 $77
JUMPV
LABELV $78
line 106
;105:		}
;106:		for ( i = 0; i < GT_MAX_GAME_TYPE; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $80
line 107
;107:			if ( Q_stricmp( token, gt[i].gtArenaRef ) == 0 ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 36
MULI4
ADDRGP4 gt+16
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $84
line 108
;108:				bits |= 1 << gt[i].index;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
CNSTI4 36
MULI4
ADDRGP4 gt
ADDP4
INDIRI4
LSHI4
BORI4
ASGNI4
line 109
;109:				continue;
LABELV $84
line 111
;110:			}
;111:		}
LABELV $81
line 106
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $80
line 112
;112:	}
LABELV $76
line 101
ADDRGP4 $75
JUMPV
LABELV $77
line 114
;113:
;114:	return bits;
ADDRLP4 8
INDIRI4
RETI4
LABELV $74
endproc GametypeBits 24 8
bss
align 1
LABELV $88
skip 256
code
proc StartServer_Update 52 16
line 123
;115:}
;116:
;117:
;118:/*
;119:=================
;120:StartServer_Update
;121:=================
;122:*/
;123:static void StartServer_Update( void ) {
line 130
;124:	int				i;
;125:	int				top;
;126:	static	char	picname[MAX_MAPSPERPAGE][MAX_QPATH];
;127:	const char		*info;
;128:	char			mapname[MAX_NAMELENGTH];
;129:
;130:	top = s_startserver.page*MAX_MAPSPERPAGE;
ADDRLP4 20
ADDRGP4 s_startserver+2032
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
line 132
;131:
;132:	for (i=0; i<MAX_MAPSPERPAGE; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $90
line 133
;133:	{
line 134
;134:		if (top+i >= s_startserver.nummaps)
ADDRLP4 20
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ADDRGP4 s_startserver+2028
INDIRI4
LTI4 $94
line 135
;135:			break;
ADDRGP4 $113
JUMPV
LABELV $94
line 137
;136:
;137:		info = UI_GetArenaInfoByNumber( s_startserver.maplist[ top + i ]);
ADDRLP4 20
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
CNSTI4 2
LSHI4
ADDRGP4 s_startserver+2040
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 28
INDIRP4
ASGNP4
line 138
;138:		Q_strncpyz( mapname, Info_ValueForKey( info, "map"), MAX_NAMELENGTH );
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 $98
ARGP4
ADDRLP4 32
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 139
;139:		Q_strupr( mapname );
ADDRLP4 4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 141
;140:
;141:		Com_sprintf( picname[i], sizeof(picname[i]), "levelshots/%s", mapname );
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 $88
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $99
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 143
;142:
;143:		s_startserver.mappics[i].generic.flags &= ~QMF_HIGHLIGHT;
ADDRLP4 36
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+656+44
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRU4
CNSTU4 4294967231
BANDU4
ASGNU4
line 144
;144:		s_startserver.mappics[i].generic.name   = picname[i];
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+656+4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 $88
ADDP4
ASGNP4
line 145
;145:		s_startserver.mappics[i].shader         = 0;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+656+72
ADDP4
CNSTI4 0
ASGNI4
line 148
;146:
;147:		// reset
;148:		s_startserver.mapbuttons[i].generic.flags |= QMF_PULSEIFFOCUS;
ADDRLP4 44
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+1024+44
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRU4
CNSTU4 256
BORU4
ASGNU4
line 149
;149:		s_startserver.mapbuttons[i].generic.flags &= ~QMF_INACTIVE;
ADDRLP4 48
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+1024+44
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
line 150
;150:	}
LABELV $91
line 132
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $90
line 152
;151:
;152:	for (; i<MAX_MAPSPERPAGE; i++)
ADDRGP4 $113
JUMPV
LABELV $110
line 153
;153:	{
line 154
;154:		s_startserver.mappics[i].generic.flags &= ~QMF_HIGHLIGHT;
ADDRLP4 28
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+656+44
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRU4
CNSTU4 4294967231
BANDU4
ASGNU4
line 155
;155:		s_startserver.mappics[i].generic.name   = NULL;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+656+4
ADDP4
CNSTP4 0
ASGNP4
line 156
;156:		s_startserver.mappics[i].shader         = 0;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+656+72
ADDP4
CNSTI4 0
ASGNI4
line 159
;157:
;158:		// disable
;159:		s_startserver.mapbuttons[i].generic.flags &= ~QMF_PULSEIFFOCUS;
ADDRLP4 32
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+1024+44
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRU4
CNSTU4 4294967039
BANDU4
ASGNU4
line 160
;160:		s_startserver.mapbuttons[i].generic.flags |= QMF_INACTIVE;
ADDRLP4 36
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+1024+44
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 161
;161:	}
LABELV $111
line 152
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $113
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $110
line 165
;162:
;163:
;164:	// no servers to start
;165:	if( !s_startserver.nummaps ) {
ADDRGP4 s_startserver+2028
INDIRI4
CNSTI4 0
NEI4 $124
line 166
;166:		s_startserver.next.generic.flags |= QMF_INACTIVE;
ADDRLP4 28
ADDRGP4 s_startserver+1760+44
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 169
;167:
;168:		// set the map name
;169:		strcpy( s_startserver.mapname.string, "NO MAPS FOUND" );
ADDRGP4 s_startserver+1852+64
INDIRP4
ARGP4
ADDRGP4 $131
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 170
;170:	}
ADDRGP4 $125
JUMPV
LABELV $124
line 171
;171:	else {
line 173
;172:		// set the highlight
;173:		s_startserver.next.generic.flags &= ~QMF_INACTIVE;
ADDRLP4 28
ADDRGP4 s_startserver+1760+44
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
line 174
;174:		i = s_startserver.currentmap - top;
ADDRLP4 0
ADDRGP4 s_startserver+2024
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
ASGNI4
line 175
;175:		if ( i >=0 && i < MAX_MAPSPERPAGE ) 
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $135
ADDRLP4 0
INDIRI4
CNSTI4 4
GEI4 $135
line 176
;176:		{
line 177
;177:			s_startserver.mappics[i].generic.flags    |= QMF_HIGHLIGHT;
ADDRLP4 36
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+656+44
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRU4
CNSTU4 64
BORU4
ASGNU4
line 178
;178:			s_startserver.mapbuttons[i].generic.flags &= ~QMF_PULSEIFFOCUS;
ADDRLP4 40
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+1024+44
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRU4
CNSTU4 4294967039
BANDU4
ASGNU4
line 179
;179:		}
LABELV $135
line 182
;180:
;181:		// set the map name
;182:		info = UI_GetArenaInfoByNumber( s_startserver.maplist[ s_startserver.currentmap ]);
ADDRGP4 s_startserver+2024
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_startserver+2040
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 36
INDIRP4
ASGNP4
line 183
;183:		Q_strncpyz( s_startserver.mapname.string, Info_ValueForKey( info, "map" ), MAX_NAMELENGTH);
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 $98
ARGP4
ADDRLP4 40
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 s_startserver+1852+64
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 184
;184:	}
LABELV $125
line 186
;185:	
;186:	Q_strupr( s_startserver.mapname.string );
ADDRGP4 s_startserver+1852+64
INDIRP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 187
;187:}
LABELV $87
endproc StartServer_Update 52 16
proc StartServer_MapEvent 0 0
line 195
;188:
;189:
;190:/*
;191:=================
;192:StartServer_MapEvent
;193:=================
;194:*/
;195:static void StartServer_MapEvent( void* ptr, int event ) {
line 196
;196:	if( event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $148
line 197
;197:		return;
ADDRGP4 $147
JUMPV
LABELV $148
line 200
;198:	}
;199:
;200:	s_startserver.currentmap = (s_startserver.page*MAX_MAPSPERPAGE) + (((menucommon_s*)ptr)->id - ID_PICTURES);
ADDRGP4 s_startserver+2024
ADDRGP4 s_startserver+2032
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 11
SUBI4
ADDI4
ASGNI4
line 201
;201:	StartServer_Update();
ADDRGP4 StartServer_Update
CALLV
pop
line 202
;202:}
LABELV $147
endproc StartServer_MapEvent 0 0
proc StartServer_GametypeEvent 40 8
line 210
;203:
;204:
;205:/*
;206:=================
;207:StartServer_GametypeEvent
;208:=================
;209:*/
;210:static void StartServer_GametypeEvent( void* ptr, int event ) {
line 217
;211:	int			i;
;212:	int			count;
;213:	int			gamebits;
;214:	int			matchbits;
;215:	const char	*info;
;216:
;217:	if( event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $153
line 218
;218:		return;
ADDRGP4 $152
JUMPV
LABELV $153
line 221
;219:	}
;220:
;221:	count = UI_GetNumArenas();
ADDRLP4 20
ADDRGP4 UI_GetNumArenas
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 20
INDIRI4
ASGNI4
line 222
;222:	s_startserver.nummaps = 0;
ADDRGP4 s_startserver+2028
CNSTI4 0
ASGNI4
line 223
;223:	matchbits = 1 << gametype_remap[s_startserver.gametype.curvalue];
ADDRLP4 12
CNSTI4 1
ADDRGP4 s_startserver+548+68
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gametype_remap
ADDP4
INDIRI4
LSHI4
ASGNI4
line 224
;224:	if( gametype_remap[s_startserver.gametype.curvalue] == GT_FFA ) {
ADDRGP4 s_startserver+548+68
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gametype_remap
ADDP4
INDIRI4
CNSTI4 1
NEI4 $158
line 225
;225:		matchbits |= ( 1 << GT_CAMPAIGN );
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 226
;226:	}
LABELV $158
line 227
;227:	for( i = 0; i < count; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $165
JUMPV
LABELV $162
line 228
;228:		info = UI_GetArenaInfoByNumber( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 24
INDIRP4
ASGNP4
line 230
;229:
;230:		gamebits = GametypeBits( Info_ValueForKey( info, "type") );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $166
ARGP4
ADDRLP4 28
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 GametypeBits
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 32
INDIRI4
ASGNI4
line 231
;231:		if( !( gamebits & matchbits ) ) {
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
BANDI4
CNSTI4 0
NEI4 $167
line 232
;232:			continue;
ADDRGP4 $163
JUMPV
LABELV $167
line 235
;233:		}
;234:
;235:		s_startserver.maplist[ s_startserver.nummaps ] = i;
ADDRGP4 s_startserver+2028
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_startserver+2040
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 236
;236:		s_startserver.nummaps++;
ADDRLP4 36
ADDRGP4 s_startserver+2028
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 237
;237:	}
LABELV $163
line 227
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $165
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $162
line 238
;238:	s_startserver.maxpages = (s_startserver.nummaps + MAX_MAPSPERPAGE-1)/MAX_MAPSPERPAGE;
ADDRGP4 s_startserver+2036
ADDRGP4 s_startserver+2028
INDIRI4
CNSTI4 4
ADDI4
CNSTI4 1
SUBI4
CNSTI4 4
DIVI4
ASGNI4
line 239
;239:	s_startserver.page = 0;
ADDRGP4 s_startserver+2032
CNSTI4 0
ASGNI4
line 240
;240:	s_startserver.currentmap = 0;
ADDRGP4 s_startserver+2024
CNSTI4 0
ASGNI4
line 242
;241:
;242:	StartServer_Update();
ADDRGP4 StartServer_Update
CALLV
pop
line 243
;243:}
LABELV $152
endproc StartServer_GametypeEvent 40 8
proc StartServer_MenuEvent 12 8
line 251
;244:
;245:
;246:/*
;247:=================
;248:StartServer_MenuEvent
;249:=================
;250:*/
;251:static void StartServer_MenuEvent( void* ptr, int event ) {
line 252
;252:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $177
line 253
;253:		return;
ADDRGP4 $176
JUMPV
LABELV $177
line 256
;254:	}
;255:
;256:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 15
LTI4 $179
ADDRLP4 0
INDIRI4
CNSTI4 18
GTI4 $179
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $199-60
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $199
address $182
address $187
address $198
address $193
code
LABELV $182
line 258
;257:	case ID_PREVPAGE:
;258:		if( s_startserver.page > 0 ) {
ADDRGP4 s_startserver+2032
INDIRI4
CNSTI4 0
LEI4 $180
line 259
;259:			s_startserver.page--;
ADDRLP4 8
ADDRGP4 s_startserver+2032
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 260
;260:			StartServer_Update();
ADDRGP4 StartServer_Update
CALLV
pop
line 261
;261:		}
line 262
;262:		break;
ADDRGP4 $180
JUMPV
LABELV $187
line 265
;263:
;264:	case ID_NEXTPAGE:
;265:		if( s_startserver.page < s_startserver.maxpages - 1 ) {
ADDRGP4 s_startserver+2032
INDIRI4
ADDRGP4 s_startserver+2036
INDIRI4
CNSTI4 1
SUBI4
GEI4 $180
line 266
;266:			s_startserver.page++;
ADDRLP4 8
ADDRGP4 s_startserver+2032
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 267
;267:			StartServer_Update();
ADDRGP4 StartServer_Update
CALLV
pop
line 268
;268:		}
line 269
;269:		break;
ADDRGP4 $180
JUMPV
LABELV $193
line 272
;270:
;271:	case ID_STARTSERVERNEXT:
;272:		trap_Cvar_SetValue( "g_gameType", gametype_remap[s_startserver.gametype.curvalue] );
ADDRGP4 $194
ARGP4
ADDRGP4 s_startserver+548+68
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gametype_remap
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 273
;273:		UI_ServerOptionsMenu( s_startserver.multiplayer );
ADDRGP4 s_startserver+2020
INDIRI4
ARGI4
ADDRGP4 UI_ServerOptionsMenu
CALLV
pop
line 274
;274:		break;
ADDRGP4 $180
JUMPV
LABELV $198
line 277
;275:
;276:	case ID_STARTSERVERBACK:
;277:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 278
;278:		break;
LABELV $179
LABELV $180
line 280
;279:	}
;280:}
LABELV $176
endproc StartServer_MenuEvent 12 8
proc StartServer_LevelshotDraw 52 20
line 288
;281:
;282:
;283:/*
;284:===============
;285:StartServer_LevelshotDraw
;286:===============
;287:*/
;288:static void StartServer_LevelshotDraw( void *self ) {
line 297
;289:	menubitmap_s	*b;
;290:	int				x;
;291:	int				y;
;292:	int				w;
;293:	int				h;
;294:	int				n;
;295:	const char		*info;
;296:
;297:	b = (menubitmap_s *)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 299
;298:
;299:	if( !b->generic.name ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $202
line 300
;300:		return;
ADDRGP4 $201
JUMPV
LABELV $202
line 303
;301:	}
;302:
;303:	if( b->generic.name && !b->shader ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $204
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
NEI4 $204
line 304
;304:		b->shader = trap_R_RegisterShaderNoMip( b->generic.name );
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 305
;305:		if( !b->shader && b->errorpic ) {
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
NEI4 $206
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $206
line 306
;306:			b->shader = trap_R_RegisterShaderNoMip( b->errorpic );
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 48
INDIRI4
ASGNI4
line 307
;307:		}
LABELV $206
line 308
;308:	}
LABELV $204
line 310
;309:
;310:	if( b->focuspic && !b->focusshader ) {
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $208
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 0
NEI4 $208
line 311
;311:		b->focusshader = trap_R_RegisterShaderNoMip( b->focuspic );
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 312
;312:	}
LABELV $208
line 314
;313:
;314:	x = b->generic.x;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 315
;315:	y = b->generic.y;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 316
;316:	w = b->width;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ASGNI4
line 317
;317:	h =	b->height;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ASGNI4
line 318
;318:	if( b->shader ) {
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
EQI4 $210
line 319
;319:		UI_DrawHandlePic( x, y, w, h, b->shader );
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 320
;320:	}
LABELV $210
line 322
;321:
;322:	x = b->generic.x;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 323
;323:	y = b->generic.y + b->height;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ADDI4
ASGNI4
line 324
;324:	UI_FillRect( x, y, b->width, 28, colorBlack );
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1105199104
ARGF4
ADDRGP4 colorBlack
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 326
;325:
;326:	x += b->width / 2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 2
DIVI4
ADDI4
ASGNI4
line 327
;327:	y += 4;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 4
ADDI4
ASGNI4
line 328
;328:	n = s_startserver.page * MAX_MAPSPERPAGE + b->generic.id - ID_PICTURES;
ADDRLP4 20
ADDRGP4 s_startserver+2032
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDI4
CNSTI4 11
SUBI4
ASGNI4
line 330
;329:
;330:	info = UI_GetArenaInfoByNumber( s_startserver.maplist[ n ]);
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_startserver+2040
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 40
INDIRP4
ASGNP4
line 331
;331:	UI_DrawString( x, y, Info_ValueForKey( info, "map" ), UI_CENTER|UI_SMALLFONT, color_orange );
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 $98
ARGP4
ADDRLP4 44
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 44
INDIRP4
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 333
;332:
;333:	x = b->generic.x;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 334
;334:	y = b->generic.y;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 335
;335:	w = b->width;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ASGNI4
line 336
;336:	h =	b->height + 28;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 337
;337:	if( b->generic.flags & QMF_HIGHLIGHT ) {	
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 64
BANDU4
CNSTU4 0
EQU4 $214
line 338
;338:		UI_DrawHandlePic( x, y, w, h, b->focusshader );
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 339
;339:	}
LABELV $214
line 340
;340:}
LABELV $201
endproc StartServer_LevelshotDraw 52 20
bss
align 1
LABELV $217
skip 64
code
proc StartServer_MenuInit 20 12
line 348
;341:
;342:
;343:/*
;344:=================
;345:StartServer_MenuInit
;346:=================
;347:*/
;348:static void StartServer_MenuInit( void ) {
line 355
;349:	int	i;
;350:	int	x;
;351:	int	y;
;352:	static char mapnamebuffer[64];
;353:
;354:	// zero set all our globals
;355:	memset( &s_startserver, 0 ,sizeof(startserver_t) );
ADDRGP4 s_startserver
ARGP4
CNSTI4 0
ARGI4
CNSTI4 6136
ARGI4
ADDRGP4 memset
CALLP4
pop
line 357
;356:
;357:	StartServer_Cache();
ADDRGP4 StartServer_Cache
CALLV
pop
line 359
;358:
;359:	s_startserver.menu.wrapAround = qtrue;
ADDRGP4 s_startserver+276
CNSTI4 1
ASGNI4
line 360
;360:	s_startserver.menu.fullscreen = qtrue;
ADDRGP4 s_startserver+280
CNSTI4 1
ASGNI4
line 362
;361:
;362:	s_startserver.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 s_startserver+288
CNSTI4 10
ASGNI4
line 363
;363:	s_startserver.banner.generic.x	   = 320;
ADDRGP4 s_startserver+288+12
CNSTI4 320
ASGNI4
line 364
;364:	s_startserver.banner.generic.y	   = 16;
ADDRGP4 s_startserver+288+16
CNSTI4 16
ASGNI4
line 365
;365:	s_startserver.banner.string        = "GAME SERVER";
ADDRGP4 s_startserver+288+64
ADDRGP4 $227
ASGNP4
line 366
;366:	s_startserver.banner.color         = color_white;
ADDRGP4 s_startserver+288+72
ADDRGP4 color_white
ASGNP4
line 367
;367:	s_startserver.banner.style         = UI_CENTER;
ADDRGP4 s_startserver+288+68
CNSTI4 1
ASGNI4
line 369
;368:
;369:	s_startserver.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_startserver+364
CNSTI4 6
ASGNI4
line 370
;370:	s_startserver.framel.generic.name  = GAMESERVER_FRAMEL;
ADDRGP4 s_startserver+364+4
ADDRGP4 $235
ASGNP4
line 371
;371:	s_startserver.framel.generic.flags = QMF_INACTIVE;
ADDRGP4 s_startserver+364+44
CNSTU4 16384
ASGNU4
line 372
;372:	s_startserver.framel.generic.x	   = 0;  
ADDRGP4 s_startserver+364+12
CNSTI4 0
ASGNI4
line 373
;373:	s_startserver.framel.generic.y	   = 78;
ADDRGP4 s_startserver+364+16
CNSTI4 78
ASGNI4
line 374
;374:	s_startserver.framel.width  	   = 256;
ADDRGP4 s_startserver+364+80
CNSTI4 256
ASGNI4
line 375
;375:	s_startserver.framel.height  	   = 329;
ADDRGP4 s_startserver+364+84
CNSTI4 329
ASGNI4
line 377
;376:
;377:	s_startserver.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_startserver+456
CNSTI4 6
ASGNI4
line 378
;378:	s_startserver.framer.generic.name  = GAMESERVER_FRAMER;
ADDRGP4 s_startserver+456+4
ADDRGP4 $249
ASGNP4
line 379
;379:	s_startserver.framer.generic.flags = QMF_INACTIVE;
ADDRGP4 s_startserver+456+44
CNSTU4 16384
ASGNU4
line 380
;380:	s_startserver.framer.generic.x	   = 376;
ADDRGP4 s_startserver+456+12
CNSTI4 376
ASGNI4
line 381
;381:	s_startserver.framer.generic.y	   = 76;
ADDRGP4 s_startserver+456+16
CNSTI4 76
ASGNI4
line 382
;382:	s_startserver.framer.width  	   = 256;
ADDRGP4 s_startserver+456+80
CNSTI4 256
ASGNI4
line 383
;383:	s_startserver.framer.height  	   = 334;
ADDRGP4 s_startserver+456+84
CNSTI4 334
ASGNI4
line 385
;384:
;385:	s_startserver.gametype.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 s_startserver+548
CNSTI4 3
ASGNI4
line 386
;386:	s_startserver.gametype.generic.name		= "Game Type:";
ADDRGP4 s_startserver+548+4
ADDRGP4 $263
ASGNP4
line 387
;387:	s_startserver.gametype.generic.flags	= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_startserver+548+44
CNSTU4 258
ASGNU4
line 388
;388:	s_startserver.gametype.generic.callback	= StartServer_GametypeEvent;
ADDRGP4 s_startserver+548+48
ADDRGP4 StartServer_GametypeEvent
ASGNP4
line 389
;389:	s_startserver.gametype.generic.id		= ID_GAMETYPE;
ADDRGP4 s_startserver+548+8
CNSTI4 10
ASGNI4
line 390
;390:	s_startserver.gametype.generic.x		= 320 - 24;
ADDRGP4 s_startserver+548+12
CNSTI4 296
ASGNI4
line 391
;391:	s_startserver.gametype.generic.y		= 368;
ADDRGP4 s_startserver+548+16
CNSTI4 368
ASGNI4
line 392
;392:	s_startserver.gametype.itemnames		= gametype_items;
ADDRGP4 s_startserver+548+88
ADDRGP4 gametype_items
ASGNP4
line 394
;393:
;394:	for (i=0; i<MAX_MAPSPERPAGE; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $276
line 395
;395:	{
line 396
;396:		x =	(i % MAX_MAPCOLS) * (128+8) + 188;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
MODI4
CNSTI4 136
MULI4
CNSTI4 188
ADDI4
ASGNI4
line 397
;397:		y = (i / MAX_MAPROWS) * (128+8) + 96;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
DIVI4
CNSTI4 136
MULI4
CNSTI4 96
ADDI4
ASGNI4
line 399
;398:
;399:		s_startserver.mappics[i].generic.type   = MTYPE_BITMAP;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+656
ADDP4
CNSTI4 6
ASGNI4
line 400
;400:		s_startserver.mappics[i].generic.flags  = QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+656+44
ADDP4
CNSTU4 16388
ASGNU4
line 401
;401:		s_startserver.mappics[i].generic.x	    = x;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+656+12
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 402
;402:		s_startserver.mappics[i].generic.y	    = y;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+656+16
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 403
;403:		s_startserver.mappics[i].generic.id		= ID_PICTURES+i;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+656+8
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 11
ADDI4
ASGNI4
line 404
;404:		s_startserver.mappics[i].width  		= 128;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+656+80
ADDP4
CNSTI4 128
ASGNI4
line 405
;405:		s_startserver.mappics[i].height  	    = 96;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+656+84
ADDP4
CNSTI4 96
ASGNI4
line 406
;406:		s_startserver.mappics[i].focuspic       = GAMESERVER_SELECTED;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+656+64
ADDP4
ADDRGP4 $295
ASGNP4
line 407
;407:		s_startserver.mappics[i].errorpic       = GAMESERVER_UNKNOWNMAP;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+656+68
ADDP4
ADDRGP4 $298
ASGNP4
line 408
;408:		s_startserver.mappics[i].generic.ownerdraw = StartServer_LevelshotDraw;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+656+56
ADDP4
ADDRGP4 StartServer_LevelshotDraw
ASGNP4
line 410
;409:
;410:		s_startserver.mapbuttons[i].generic.type     = MTYPE_BITMAP;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+1024
ADDP4
CNSTI4 6
ASGNI4
line 411
;411:		s_startserver.mapbuttons[i].generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_NODEFAULTINIT;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+1024+44
ADDP4
CNSTU4 33028
ASGNU4
line 412
;412:		s_startserver.mapbuttons[i].generic.id       = ID_PICTURES+i;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+1024+8
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 11
ADDI4
ASGNI4
line 413
;413:		s_startserver.mapbuttons[i].generic.callback = StartServer_MapEvent;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+1024+48
ADDP4
ADDRGP4 StartServer_MapEvent
ASGNP4
line 414
;414:		s_startserver.mapbuttons[i].generic.x	     = x - 30;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+1024+12
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 30
SUBI4
ASGNI4
line 415
;415:		s_startserver.mapbuttons[i].generic.y	     = y - 32;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+1024+16
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 32
SUBI4
ASGNI4
line 416
;416:		s_startserver.mapbuttons[i].width  		     = 256;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+1024+80
ADDP4
CNSTI4 256
ASGNI4
line 417
;417:		s_startserver.mapbuttons[i].height  	     = 248;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+1024+84
ADDP4
CNSTI4 248
ASGNI4
line 418
;418:		s_startserver.mapbuttons[i].generic.left     = x;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+1024+20
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 419
;419:		s_startserver.mapbuttons[i].generic.top  	 = y;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+1024+24
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 420
;420:		s_startserver.mapbuttons[i].generic.right    = x + 128;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+1024+28
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 128
ADDI4
ASGNI4
line 421
;421:		s_startserver.mapbuttons[i].generic.bottom   = y + 128;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+1024+32
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 128
ADDI4
ASGNI4
line 422
;422:		s_startserver.mapbuttons[i].focuspic         = GAMESERVER_SELECT;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+1024+64
ADDP4
ADDRGP4 $326
ASGNP4
line 423
;423:	}
LABELV $277
line 394
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $276
line 425
;424:
;425:	s_startserver.arrows.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_startserver+1392
CNSTI4 6
ASGNI4
line 426
;426:	s_startserver.arrows.generic.name  = GAMESERVER_ARROWS;
ADDRGP4 s_startserver+1392+4
ADDRGP4 $330
ASGNP4
line 427
;427:	s_startserver.arrows.generic.flags = QMF_INACTIVE;
ADDRGP4 s_startserver+1392+44
CNSTU4 16384
ASGNU4
line 428
;428:	s_startserver.arrows.generic.x	   = 260;
ADDRGP4 s_startserver+1392+12
CNSTI4 260
ASGNI4
line 429
;429:	s_startserver.arrows.generic.y	   = 400;
ADDRGP4 s_startserver+1392+16
CNSTI4 400
ASGNI4
line 430
;430:	s_startserver.arrows.width  	   = 128;
ADDRGP4 s_startserver+1392+80
CNSTI4 128
ASGNI4
line 431
;431:	s_startserver.arrows.height  	   = 32;
ADDRGP4 s_startserver+1392+84
CNSTI4 32
ASGNI4
line 433
;432:
;433:	s_startserver.prevpage.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_startserver+1484
CNSTI4 6
ASGNI4
line 434
;434:	s_startserver.prevpage.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_startserver+1484+44
CNSTU4 260
ASGNU4
line 435
;435:	s_startserver.prevpage.generic.callback = StartServer_MenuEvent;
ADDRGP4 s_startserver+1484+48
ADDRGP4 StartServer_MenuEvent
ASGNP4
line 436
;436:	s_startserver.prevpage.generic.id	    = ID_PREVPAGE;
ADDRGP4 s_startserver+1484+8
CNSTI4 15
ASGNI4
line 437
;437:	s_startserver.prevpage.generic.x		= 260;
ADDRGP4 s_startserver+1484+12
CNSTI4 260
ASGNI4
line 438
;438:	s_startserver.prevpage.generic.y		= 400;
ADDRGP4 s_startserver+1484+16
CNSTI4 400
ASGNI4
line 439
;439:	s_startserver.prevpage.width  		    = 64;
ADDRGP4 s_startserver+1484+80
CNSTI4 64
ASGNI4
line 440
;440:	s_startserver.prevpage.height  		    = 32;
ADDRGP4 s_startserver+1484+84
CNSTI4 32
ASGNI4
line 441
;441:	s_startserver.prevpage.focuspic         = GAMESERVER_ARROWSL;
ADDRGP4 s_startserver+1484+64
ADDRGP4 $358
ASGNP4
line 443
;442:
;443:	s_startserver.nextpage.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_startserver+1576
CNSTI4 6
ASGNI4
line 444
;444:	s_startserver.nextpage.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_startserver+1576+44
CNSTU4 260
ASGNU4
line 445
;445:	s_startserver.nextpage.generic.callback = StartServer_MenuEvent;
ADDRGP4 s_startserver+1576+48
ADDRGP4 StartServer_MenuEvent
ASGNP4
line 446
;446:	s_startserver.nextpage.generic.id	    = ID_NEXTPAGE;
ADDRGP4 s_startserver+1576+8
CNSTI4 16
ASGNI4
line 447
;447:	s_startserver.nextpage.generic.x		= 321;
ADDRGP4 s_startserver+1576+12
CNSTI4 321
ASGNI4
line 448
;448:	s_startserver.nextpage.generic.y		= 400;
ADDRGP4 s_startserver+1576+16
CNSTI4 400
ASGNI4
line 449
;449:	s_startserver.nextpage.width  		    = 64;
ADDRGP4 s_startserver+1576+80
CNSTI4 64
ASGNI4
line 450
;450:	s_startserver.nextpage.height  		    = 32;
ADDRGP4 s_startserver+1576+84
CNSTI4 32
ASGNI4
line 451
;451:	s_startserver.nextpage.focuspic         = GAMESERVER_ARROWSR;
ADDRGP4 s_startserver+1576+64
ADDRGP4 $376
ASGNP4
line 453
;452:
;453:	s_startserver.mapname.generic.type  = MTYPE_PTEXT;
ADDRGP4 s_startserver+1852
CNSTI4 9
ASGNI4
line 454
;454:	s_startserver.mapname.generic.flags = QMF_CENTER_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_startserver+1852+44
CNSTU4 16392
ASGNU4
line 455
;455:	s_startserver.mapname.generic.x	    = 320;
ADDRGP4 s_startserver+1852+12
CNSTI4 320
ASGNI4
line 456
;456:	s_startserver.mapname.generic.y	    = 440;
ADDRGP4 s_startserver+1852+16
CNSTI4 440
ASGNI4
line 457
;457:	s_startserver.mapname.string        = mapnamebuffer;
ADDRGP4 s_startserver+1852+64
ADDRGP4 $217
ASGNP4
line 458
;458:	s_startserver.mapname.style         = UI_CENTER|UI_BIGFONT;
ADDRGP4 s_startserver+1852+68
CNSTI4 33
ASGNI4
line 459
;459:	s_startserver.mapname.color         = text_color_normal;
ADDRGP4 s_startserver+1852+72
ADDRGP4 text_color_normal
ASGNP4
line 461
;460:
;461:	s_startserver.back.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_startserver+1668
CNSTI4 6
ASGNI4
line 462
;462:	s_startserver.back.generic.name     = GAMESERVER_BACK0;
ADDRGP4 s_startserver+1668+4
ADDRGP4 $393
ASGNP4
line 463
;463:	s_startserver.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_startserver+1668+44
CNSTU4 260
ASGNU4
line 464
;464:	s_startserver.back.generic.callback = StartServer_MenuEvent;
ADDRGP4 s_startserver+1668+48
ADDRGP4 StartServer_MenuEvent
ASGNP4
line 465
;465:	s_startserver.back.generic.id	    = ID_STARTSERVERBACK;
ADDRGP4 s_startserver+1668+8
CNSTI4 17
ASGNI4
line 466
;466:	s_startserver.back.generic.x		= 0;
ADDRGP4 s_startserver+1668+12
CNSTI4 0
ASGNI4
line 467
;467:	s_startserver.back.generic.y		= 480-64;
ADDRGP4 s_startserver+1668+16
CNSTI4 416
ASGNI4
line 468
;468:	s_startserver.back.width  		    = 128;
ADDRGP4 s_startserver+1668+80
CNSTI4 128
ASGNI4
line 469
;469:	s_startserver.back.height  		    = 64;
ADDRGP4 s_startserver+1668+84
CNSTI4 64
ASGNI4
line 470
;470:	s_startserver.back.focuspic         = GAMESERVER_BACK1;
ADDRGP4 s_startserver+1668+64
ADDRGP4 $410
ASGNP4
line 472
;471:
;472:	s_startserver.next.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_startserver+1760
CNSTI4 6
ASGNI4
line 473
;473:	s_startserver.next.generic.name     = GAMESERVER_NEXT0;
ADDRGP4 s_startserver+1760+4
ADDRGP4 $414
ASGNP4
line 474
;474:	s_startserver.next.generic.flags    = QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_startserver+1760+44
CNSTU4 272
ASGNU4
line 475
;475:	s_startserver.next.generic.callback = StartServer_MenuEvent;
ADDRGP4 s_startserver+1760+48
ADDRGP4 StartServer_MenuEvent
ASGNP4
line 476
;476:	s_startserver.next.generic.id	    = ID_STARTSERVERNEXT;
ADDRGP4 s_startserver+1760+8
CNSTI4 18
ASGNI4
line 477
;477:	s_startserver.next.generic.x		= 640;
ADDRGP4 s_startserver+1760+12
CNSTI4 640
ASGNI4
line 478
;478:	s_startserver.next.generic.y		= 480-64;
ADDRGP4 s_startserver+1760+16
CNSTI4 416
ASGNI4
line 479
;479:	s_startserver.next.width  		    = 128;
ADDRGP4 s_startserver+1760+80
CNSTI4 128
ASGNI4
line 480
;480:	s_startserver.next.height  		    = 64;
ADDRGP4 s_startserver+1760+84
CNSTI4 64
ASGNI4
line 481
;481:	s_startserver.next.focuspic         = GAMESERVER_NEXT1;
ADDRGP4 s_startserver+1760+64
ADDRGP4 $431
ASGNP4
line 483
;482:
;483:	s_startserver.item_null.generic.type	= MTYPE_BITMAP;
ADDRGP4 s_startserver+1928
CNSTI4 6
ASGNI4
line 484
;484:	s_startserver.item_null.generic.flags	= QMF_LEFT_JUSTIFY|QMF_MOUSEONLY|QMF_SILENT;
ADDRGP4 s_startserver+1928+44
CNSTU4 1050628
ASGNU4
line 485
;485:	s_startserver.item_null.generic.x		= 0;
ADDRGP4 s_startserver+1928+12
CNSTI4 0
ASGNI4
line 486
;486:	s_startserver.item_null.generic.y		= 0;
ADDRGP4 s_startserver+1928+16
CNSTI4 0
ASGNI4
line 487
;487:	s_startserver.item_null.width			= 640;
ADDRGP4 s_startserver+1928+80
CNSTI4 640
ASGNI4
line 488
;488:	s_startserver.item_null.height			= 480;
ADDRGP4 s_startserver+1928+84
CNSTI4 480
ASGNI4
line 490
;489:
;490:	Menu_AddItem( &s_startserver.menu, &s_startserver.banner );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 491
;491:	Menu_AddItem( &s_startserver.menu, &s_startserver.framel );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+364
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 492
;492:	Menu_AddItem( &s_startserver.menu, &s_startserver.framer );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+456
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 494
;493:
;494:	Menu_AddItem( &s_startserver.menu, &s_startserver.gametype );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+548
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 495
;495:	for (i=0; i<MAX_MAPSPERPAGE; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $447
line 496
;496:	{
line 497
;497:		Menu_AddItem( &s_startserver.menu, &s_startserver.mappics[i] );
ADDRGP4 s_startserver
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+656
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 498
;498:		Menu_AddItem( &s_startserver.menu, &s_startserver.mapbuttons[i] );
ADDRGP4 s_startserver
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+1024
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 499
;499:	}
LABELV $448
line 495
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $447
line 501
;500:
;501:	Menu_AddItem( &s_startserver.menu, &s_startserver.arrows );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+1392
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 502
;502:	Menu_AddItem( &s_startserver.menu, &s_startserver.prevpage );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+1484
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 503
;503:	Menu_AddItem( &s_startserver.menu, &s_startserver.nextpage );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+1576
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 504
;504:	Menu_AddItem( &s_startserver.menu, &s_startserver.back );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+1668
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 505
;505:	Menu_AddItem( &s_startserver.menu, &s_startserver.next );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+1760
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 506
;506:	Menu_AddItem( &s_startserver.menu, &s_startserver.mapname );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+1852
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 507
;507:	Menu_AddItem( &s_startserver.menu, &s_startserver.item_null );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+1928
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 509
;508:
;509:	StartServer_GametypeEvent( NULL, QM_ACTIVATED );
CNSTP4 0
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 StartServer_GametypeEvent
CALLV
pop
line 510
;510:}
LABELV $216
endproc StartServer_MenuInit 20 12
export StartServer_Cache
proc StartServer_Cache 104 16
line 519
;511:
;512:
;513:/*
;514:=================
;515:StartServer_Cache
;516:=================
;517:*/
;518:void StartServer_Cache( void )
;519:{
line 526
;520:	int				i;
;521:	const char		*info;
;522:	qboolean		precache;
;523:	char			picname[ MAX_QPATH ];
;524:	char			mapname[ MAX_NAMELENGTH ];
;525:
;526:	trap_R_RegisterShaderNoMip( GAMESERVER_BACK0 );	
ADDRGP4 $393
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 527
;527:	trap_R_RegisterShaderNoMip( GAMESERVER_BACK1 );	
ADDRGP4 $410
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 528
;528:	trap_R_RegisterShaderNoMip( GAMESERVER_NEXT0 );	
ADDRGP4 $414
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 529
;529:	trap_R_RegisterShaderNoMip( GAMESERVER_NEXT1 );	
ADDRGP4 $431
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 530
;530:	trap_R_RegisterShaderNoMip( GAMESERVER_FRAMEL );	
ADDRGP4 $235
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 531
;531:	trap_R_RegisterShaderNoMip( GAMESERVER_FRAMER );	
ADDRGP4 $249
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 532
;532:	trap_R_RegisterShaderNoMip( GAMESERVER_SELECT );	
ADDRGP4 $326
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 533
;533:	trap_R_RegisterShaderNoMip( GAMESERVER_SELECTED );	
ADDRGP4 $295
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 534
;534:	trap_R_RegisterShaderNoMip( GAMESERVER_UNKNOWNMAP );
ADDRGP4 $298
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 535
;535:	trap_R_RegisterShaderNoMip( GAMESERVER_ARROWS );
ADDRGP4 $330
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 536
;536:	trap_R_RegisterShaderNoMip( GAMESERVER_ARROWSL );
ADDRGP4 $358
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 537
;537:	trap_R_RegisterShaderNoMip( GAMESERVER_ARROWSR );
ADDRGP4 $376
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 539
;538:
;539:	precache = trap_Cvar_VariableValue("com_buildscript");
ADDRGP4 $461
ARGP4
ADDRLP4 92
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 88
ADDRLP4 92
INDIRF4
CVFI4 4
ASGNI4
line 541
;540:
;541:	if( precache ) {
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $462
line 542
;542:		for( i = 0; i < UI_GetNumArenas(); i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $467
JUMPV
LABELV $464
line 543
;543:			info = UI_GetArenaInfoByNumber( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 84
ADDRLP4 96
INDIRP4
ASGNP4
line 544
;544:			Q_strncpyz( mapname, Info_ValueForKey( info, "map"), MAX_NAMELENGTH );
ADDRLP4 84
INDIRP4
ARGP4
ADDRGP4 $98
ARGP4
ADDRLP4 100
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 68
ARGP4
ADDRLP4 100
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 545
;545:			Q_strupr( mapname );
ADDRLP4 68
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 547
;546:
;547:			Com_sprintf( picname, sizeof(picname), "levelshots/%s", mapname );
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $99
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 548
;548:			trap_R_RegisterShaderNoMip(picname);
ADDRLP4 4
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 549
;549:		}
LABELV $465
line 542
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $467
ADDRLP4 96
ADDRGP4 UI_GetNumArenas
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 96
INDIRI4
LTI4 $464
line 550
;550:	}
LABELV $462
line 551
;551:}
LABELV $460
endproc StartServer_Cache 104 16
export UI_StartServerMenu
proc UI_StartServerMenu 0 4
line 559
;552:
;553:
;554:/*
;555:=================
;556:UI_StartServerMenu
;557:=================
;558:*/
;559:void UI_StartServerMenu( qboolean multiplayer ) {
line 560
;560:	StartServer_MenuInit();
ADDRGP4 StartServer_MenuInit
CALLV
pop
line 561
;561:	s_startserver.multiplayer = multiplayer;
ADDRGP4 s_startserver+2020
ADDRFP4 0
INDIRI4
ASGNI4
line 562
;562:	UI_PushMenu( &s_startserver.menu );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 563
;563:}
LABELV $468
endproc UI_StartServerMenu 0 4
data
align 4
LABELV dedicated_list
address $471
address $472
address $473
byte 4 0
align 4
LABELV playerType_list
address $474
address $475
address $476
byte 4 0
align 4
LABELV playerTeam_list
address $477
address $478
byte 4 0
align 4
LABELV botSkill_list
address $479
address $480
address $481
address $482
address $483
byte 4 0
code
proc BotAlreadySelected 8 8
line 659
;564:
;565:
;566:
;567:/*
;568:=============================================================================
;569:
;570:SERVER OPTIONS MENU *****
;571:
;572:=============================================================================
;573:*/
;574:
;575:#define ID_PLAYER_TYPE			20
;576:#define ID_MAXCLIENTS			21
;577:#define ID_DEDICATED			22
;578:#define ID_GO					23
;579:#define ID_BACK					24
;580:
;581:#define PLAYER_SLOTS			12
;582:
;583:
;584:typedef struct {
;585:	menuframework_s		menu;
;586:
;587:	menutext_s			banner;
;588:
;589:	menubitmap_s		mappic;
;590:	menubitmap_s		picframe;
;591:
;592:	menulist_s			dedicated;
;593:	menufield_s			timelimit;
;594:	menufield_s			fraglimit;
;595:	menufield_s			flaglimit;
;596:	menuradiobutton_s	friendlyfire;
;597:	menufield_s			hostname;
;598:	menuradiobutton_s	pure;
;599:	menulist_s			botSkill;
;600:
;601:	menutext_s			player0;
;602:	menulist_s			playerType[PLAYER_SLOTS];
;603:	menutext_s			playerName[PLAYER_SLOTS];
;604:	menulist_s			playerTeam[PLAYER_SLOTS];
;605:
;606:	menubitmap_s		go;
;607:	menubitmap_s		next;
;608:	menubitmap_s		back;
;609:
;610:	qboolean			multiplayer;
;611:	int					gametype;
;612:	char				mapnamebuffer[32];
;613:	char				playerNameBuffers[PLAYER_SLOTS][16];
;614:
;615:	qboolean			newBot;
;616:	int					newBotIndex;
;617:	char				newBotName[16];
;618:	
;619:	menulist_s		punkbuster;
;620:} serveroptions_t;
;621:
;622:static serveroptions_t s_serveroptions;
;623:
;624:static const char *dedicated_list[] = {
;625:	"No",
;626:	"LAN",
;627:	"Internet",
;628:	NULL
;629:};
;630:
;631:static const char *playerType_list[] = {
;632:	"Open",
;633:	"Bot",
;634:	"----",
;635:	NULL
;636:};
;637:
;638:static const char *playerTeam_list[] = {
;639:	"Blue",
;640:	"Red",
;641:	NULL
;642:};
;643:
;644:static const char *botSkill_list[] = {
;645:	"I Can Win",
;646:	"Bring It On",
;647:	"Hurt Me Plenty",
;648:	"Hardcore",
;649:	"Nightmare!",
;650:	NULL
;651:};
;652:
;653:
;654:/*
;655:=================
;656:BotAlreadySelected
;657:=================
;658:*/
;659:static qboolean BotAlreadySelected( const char *checkName ) {
line 662
;660:	int		n;
;661:
;662:	for( n = 1; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $485
line 663
;663:		if( s_serveroptions.playerType[n].curvalue != 1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+2336+68
ADDP4
INDIRI4
CNSTI4 1
EQI4 $489
line 664
;664:			continue;
ADDRGP4 $486
JUMPV
LABELV $489
line 666
;665:		}
;666:		if( (s_serveroptions.gametype >= GT_TDM) &&
ADDRGP4 s_serveroptions+6120
INDIRI4
CNSTI4 3
LTI4 $493
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+4544+68
ADDP4
INDIRI4
ADDRGP4 s_serveroptions+6352
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+4544+68
ADDP4
INDIRI4
EQI4 $493
line 667
;667:			(s_serveroptions.playerTeam[n].curvalue != s_serveroptions.playerTeam[s_serveroptions.newBotIndex].curvalue ) ) {
line 668
;668:			continue;
ADDRGP4 $486
JUMPV
LABELV $493
line 670
;669:		}
;670:		if( Q_stricmp( checkName, s_serveroptions.playerNameBuffers[n] ) == 0 ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+6156
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $501
line 671
;671:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $484
JUMPV
LABELV $501
line 673
;672:		}
;673:	}
LABELV $486
line 662
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $485
line 675
;674:
;675:	return qfalse;
CNSTI4 0
RETI4
LABELV $484
endproc BotAlreadySelected 8 8
proc ServerOptions_Start 168 24
line 684
;676:}
;677:
;678:
;679:/*
;680:=================
;681:ServerOptions_Start
;682:=================
;683:*/
;684:static void ServerOptions_Start( void ) {
line 697
;685:	int		timelimit;
;686:	int		fraglimit;
;687:	int		maxclients;
;688:	int		dedicated;
;689:	int		friendlyfire;
;690:	int		flaglimit;
;691:	int		pure;
;692:	int		skill;
;693:	int		n;
;694:	char	buf[64];
;695:	const char *info;
;696:
;697:	timelimit	 = atoi( s_serveroptions.timelimit.field.buffer );
ADDRGP4 s_serveroptions+656+64+12
ARGP4
ADDRLP4 104
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 76
ADDRLP4 104
INDIRI4
ASGNI4
line 698
;698:	fraglimit	 = atoi( s_serveroptions.fraglimit.field.buffer );
ADDRGP4 s_serveroptions+996+64+12
ARGP4
ADDRLP4 108
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 80
ADDRLP4 108
INDIRI4
ASGNI4
line 699
;699:	flaglimit	 = atoi( s_serveroptions.flaglimit.field.buffer );
ADDRGP4 s_serveroptions+1336+64+12
ARGP4
ADDRLP4 112
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 84
ADDRLP4 112
INDIRI4
ASGNI4
line 700
;700:	dedicated	 = s_serveroptions.dedicated.curvalue;
ADDRLP4 88
ADDRGP4 s_serveroptions+548+68
INDIRI4
ASGNI4
line 701
;701:	friendlyfire = s_serveroptions.friendlyfire.curvalue;
ADDRLP4 92
ADDRGP4 s_serveroptions+1676+64
INDIRI4
ASGNI4
line 702
;702:	pure		 = s_serveroptions.pure.curvalue;
ADDRLP4 96
ADDRGP4 s_serveroptions+2084+64
INDIRI4
ASGNI4
line 703
;703:	skill		 = s_serveroptions.botSkill.curvalue + 1;
ADDRLP4 72
ADDRGP4 s_serveroptions+2152+68
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 706
;704:
;705:	//set maxclients
;706:	for( n = 0, maxclients = 0; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRGP4 $525
JUMPV
LABELV $522
line 707
;707:		if( s_serveroptions.playerType[n].curvalue == 2 ) {
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+2336+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $526
line 708
;708:			continue;
ADDRGP4 $523
JUMPV
LABELV $526
line 710
;709:		}
;710:		if( (s_serveroptions.playerType[n].curvalue == 1) && (s_serveroptions.playerNameBuffers[n][0] == 0) ) {
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+2336+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $530
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+6156
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $530
line 711
;711:			continue;
ADDRGP4 $523
JUMPV
LABELV $530
line 713
;712:		}
;713:		maxclients++;
ADDRLP4 68
ADDRLP4 68
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 714
;714:	}
LABELV $523
line 706
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $525
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $522
line 716
;715:
;716:	switch( s_serveroptions.gametype ) {
ADDRLP4 116
ADDRGP4 s_serveroptions+6120
INDIRI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 1
LTI4 $535
ADDRLP4 116
INDIRI4
CNSTI4 4
GTI4 $535
ADDRLP4 116
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $552-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $552
address $538
address $541
address $544
address $548
code
LABELV $538
LABELV $535
line 719
;717:	case GT_FFA:
;718:	default:
;719:		trap_Cvar_SetValue( "ui_ffa_fraglimit", fraglimit );
ADDRGP4 $539
ARGP4
ADDRLP4 80
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 720
;720:		trap_Cvar_SetValue( "ui_ffa_timelimit", timelimit );
ADDRGP4 $540
ARGP4
ADDRLP4 76
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 721
;721:		break;
ADDRGP4 $536
JUMPV
LABELV $541
line 724
;722:
;723:	case GT_DUEL:
;724:		trap_Cvar_SetValue( "ui_tourney_fraglimit", fraglimit );
ADDRGP4 $542
ARGP4
ADDRLP4 80
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 725
;725:		trap_Cvar_SetValue( "ui_tourney_timelimit", timelimit );
ADDRGP4 $543
ARGP4
ADDRLP4 76
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 726
;726:		break;
ADDRGP4 $536
JUMPV
LABELV $544
line 729
;727:
;728:	case GT_TDM:
;729:		trap_Cvar_SetValue( "ui_team_fraglimit", fraglimit );
ADDRGP4 $545
ARGP4
ADDRLP4 80
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 730
;730:		trap_Cvar_SetValue( "ui_team_timelimit", timelimit );
ADDRGP4 $546
ARGP4
ADDRLP4 76
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 731
;731:		trap_Cvar_SetValue( "ui_team_friendly", friendlyfire );
ADDRGP4 $547
ARGP4
ADDRLP4 92
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 732
;732:		break;
ADDRGP4 $536
JUMPV
LABELV $548
line 735
;733:
;734:	case GT_CTF:
;735:		trap_Cvar_SetValue( "ui_ctf_capturelimit", flaglimit );
ADDRGP4 $549
ARGP4
ADDRLP4 84
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 736
;736:		trap_Cvar_SetValue( "ui_ctf_timelimit", timelimit );
ADDRGP4 $550
ARGP4
ADDRLP4 76
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 737
;737:		trap_Cvar_SetValue( "ui_ctf_friendly", friendlyfire );
ADDRGP4 $551
ARGP4
ADDRLP4 92
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 738
;738:		break;
LABELV $536
line 741
;739:	}
;740:
;741:	trap_Cvar_SetValue( "sv_maxclients", Com_Clamp( 0, 12, maxclients ) );
CNSTF4 0
ARGF4
CNSTF4 1094713344
ARGF4
ADDRLP4 68
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 120
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $554
ARGP4
ADDRLP4 120
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 742
;742:	trap_Cvar_SetValue( "dedicated", Com_Clamp( 0, 2, dedicated ) );
CNSTF4 0
ARGF4
CNSTF4 1073741824
ARGF4
ADDRLP4 88
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 124
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $555
ARGP4
ADDRLP4 124
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 743
;743:	trap_Cvar_SetValue ("timelimit", Com_Clamp( 0, timelimit, timelimit ) );
CNSTF4 0
ARGF4
ADDRLP4 128
ADDRLP4 76
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 128
INDIRF4
ARGF4
ADDRLP4 128
INDIRF4
ARGF4
ADDRLP4 132
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $556
ARGP4
ADDRLP4 132
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 744
;744:	trap_Cvar_SetValue ("fraglimit", Com_Clamp( 0, fraglimit, fraglimit ) );
CNSTF4 0
ARGF4
ADDRLP4 136
ADDRLP4 80
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 136
INDIRF4
ARGF4
ADDRLP4 136
INDIRF4
ARGF4
ADDRLP4 140
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $557
ARGP4
ADDRLP4 140
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 745
;745:	trap_Cvar_SetValue ("capturelimit", Com_Clamp( 0, flaglimit, flaglimit ) );
CNSTF4 0
ARGF4
ADDRLP4 144
ADDRLP4 84
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 144
INDIRF4
ARGF4
ADDRLP4 144
INDIRF4
ARGF4
ADDRLP4 148
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $558
ARGP4
ADDRLP4 148
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 746
;746:	trap_Cvar_SetValue( "g_friendlyfire", friendlyfire );
ADDRGP4 $559
ARGP4
ADDRLP4 92
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 747
;747:	trap_Cvar_SetValue( "sv_pure", pure );
ADDRGP4 $560
ARGP4
ADDRLP4 96
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 748
;748:	trap_Cvar_Set("sv_hostname", s_serveroptions.hostname.field.buffer );
ADDRGP4 $561
ARGP4
ADDRGP4 s_serveroptions+1744+64+12
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 750
;749:	
;750:	trap_Cvar_SetValue( "sv_punkbuster", s_serveroptions.punkbuster.curvalue );
ADDRGP4 $565
ARGP4
ADDRGP4 s_serveroptions+6372+68
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 753
;751:
;752:	// the wait commands will allow the dedicated to take effect
;753:	info = UI_GetArenaInfoByNumber( s_startserver.maplist[ s_startserver.currentmap ]);
ADDRGP4 s_startserver+2024
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_startserver+2040
ADDP4
INDIRI4
ARGI4
ADDRLP4 152
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 100
ADDRLP4 152
INDIRP4
ASGNP4
line 754
;754:	trap_Cmd_ExecuteText( EXEC_APPEND, va( "wait ; wait ; map %s\n", Info_ValueForKey( info, "map" )));
ADDRLP4 100
INDIRP4
ARGP4
ADDRGP4 $98
ARGP4
ADDRLP4 156
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $570
ARGP4
ADDRLP4 156
INDIRP4
ARGP4
ADDRLP4 160
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 160
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 757
;755:
;756:	// add bots
;757:	trap_Cmd_ExecuteText( EXEC_APPEND, "wait 3\n" );
CNSTI4 2
ARGI4
ADDRGP4 $571
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 758
;758:	for( n = 1; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $572
line 759
;759:		if( s_serveroptions.playerType[n].curvalue != 1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+2336+68
ADDP4
INDIRI4
CNSTI4 1
EQI4 $576
line 760
;760:			continue;
ADDRGP4 $573
JUMPV
LABELV $576
line 762
;761:		}
;762:		if( s_serveroptions.playerNameBuffers[n][0] == 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+6156
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $580
line 763
;763:			continue;
ADDRGP4 $573
JUMPV
LABELV $580
line 765
;764:		}
;765:		if( s_serveroptions.playerNameBuffers[n][0] == '-' ) {
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+6156
ADDP4
INDIRI1
CVII4 1
CNSTI4 45
NEI4 $583
line 766
;766:			continue;
ADDRGP4 $573
JUMPV
LABELV $583
line 768
;767:		}
;768:		if( s_serveroptions.gametype >= GT_TDM ) {
ADDRGP4 s_serveroptions+6120
INDIRI4
CNSTI4 3
LTI4 $586
line 769
;769:			Com_sprintf( buf, sizeof(buf), "addbot %s %i %s\n", s_serveroptions.playerNameBuffers[n], skill,
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $589
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+6156
ADDP4
ARGP4
ADDRLP4 72
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+4544+68
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 playerTeam_list
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 771
;770:				playerTeam_list[s_serveroptions.playerTeam[n].curvalue] );
;771:		}
ADDRGP4 $587
JUMPV
LABELV $586
line 772
;772:		else {
line 773
;773:			Com_sprintf( buf, sizeof(buf), "addbot %s %i\n", s_serveroptions.playerNameBuffers[n], skill );
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $593
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+6156
ADDP4
ARGP4
ADDRLP4 72
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 774
;774:		}
LABELV $587
line 775
;775:		trap_Cmd_ExecuteText( EXEC_APPEND, buf );
CNSTI4 2
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 776
;776:	}
LABELV $573
line 758
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $572
line 779
;777:
;778:	// set player's team
;779:	if( dedicated == 0 && s_serveroptions.gametype >= GT_TDM ) {
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $595
ADDRGP4 s_serveroptions+6120
INDIRI4
CNSTI4 3
LTI4 $595
line 780
;780:		trap_Cmd_ExecuteText( EXEC_APPEND, va( "team %s\n", playerTeam_list[s_serveroptions.playerTeam[0].curvalue] ) );
ADDRGP4 $598
ARGP4
ADDRGP4 s_serveroptions+4544+68
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 playerTeam_list
ADDP4
INDIRP4
ARGP4
ADDRLP4 164
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 164
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 781
;781:	}
LABELV $595
line 782
;782:}
LABELV $504
endproc ServerOptions_Start 168 24
proc ServerOptions_InitPlayerItems 12 12
line 790
;783:
;784:
;785:/*
;786:=================
;787:ServerOptions_InitPlayerItems
;788:=================
;789:*/
;790:static void ServerOptions_InitPlayerItems( void ) {
line 795
;791:	int		n;
;792:	int		v;
;793:
;794:	// init types
;795:	if( s_serveroptions.multiplayer ) {
ADDRGP4 s_serveroptions+6116
INDIRI4
CNSTI4 0
EQI4 $602
line 796
;796:		v = 0;	// open
ADDRLP4 4
CNSTI4 0
ASGNI4
line 797
;797:	}
ADDRGP4 $603
JUMPV
LABELV $602
line 798
;798:	else {
line 799
;799:		v = 1;	// bot
ADDRLP4 4
CNSTI4 1
ASGNI4
line 800
;800:	}
LABELV $603
line 802
;801:	
;802:	for( n = 0; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $605
line 803
;803:		s_serveroptions.playerType[n].curvalue = v;
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+2336+68
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 804
;804:	}
LABELV $606
line 802
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $605
line 806
;805:
;806:	if( s_serveroptions.multiplayer && (s_serveroptions.gametype < GT_TDM) ) {
ADDRGP4 s_serveroptions+6116
INDIRI4
CNSTI4 0
EQI4 $611
ADDRGP4 s_serveroptions+6120
INDIRI4
CNSTI4 3
GEI4 $611
line 807
;807:		for( n = 8; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 8
ASGNI4
LABELV $615
line 808
;808:			s_serveroptions.playerType[n].curvalue = 2;
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+2336+68
ADDP4
CNSTI4 2
ASGNI4
line 809
;809:		}
LABELV $616
line 807
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $615
line 810
;810:	}
LABELV $611
line 813
;811:
;812:	// if not a dedicated server, first slot is reserved for the human on the server
;813:	if( s_serveroptions.dedicated.curvalue == 0 ) {
ADDRGP4 s_serveroptions+548+68
INDIRI4
CNSTI4 0
NEI4 $621
line 815
;814:		// human
;815:		s_serveroptions.playerType[0].generic.flags |= QMF_INACTIVE;
ADDRLP4 8
ADDRGP4 s_serveroptions+2336+44
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 816
;816:		s_serveroptions.playerType[0].curvalue = 0;
ADDRGP4 s_serveroptions+2336+68
CNSTI4 0
ASGNI4
line 817
;817:		trap_Cvar_VariableStringBuffer( "name", s_serveroptions.playerNameBuffers[0], sizeof(s_serveroptions.playerNameBuffers[0]) );
ADDRGP4 $629
ARGP4
ADDRGP4 s_serveroptions+6156
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 818
;818:		Q_CleanStr( s_serveroptions.playerNameBuffers[0] );
ADDRGP4 s_serveroptions+6156
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 819
;819:	}
LABELV $621
line 822
;820:
;821:	// init teams
;822:	if( s_serveroptions.gametype >= GT_TDM ) {
ADDRGP4 s_serveroptions+6120
INDIRI4
CNSTI4 3
LTI4 $633
line 823
;823:		for( n = 0; n < (PLAYER_SLOTS / 2); n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $636
line 824
;824:			s_serveroptions.playerTeam[n].curvalue = 0;
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+4544+68
ADDP4
CNSTI4 0
ASGNI4
line 825
;825:		}
LABELV $637
line 823
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $636
line 826
;826:		for( ; n < PLAYER_SLOTS; n++ ) {
ADDRGP4 $645
JUMPV
LABELV $642
line 827
;827:			s_serveroptions.playerTeam[n].curvalue = 1;
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+4544+68
ADDP4
CNSTI4 1
ASGNI4
line 828
;828:		}
LABELV $643
line 826
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $645
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $642
line 829
;829:	}
ADDRGP4 $634
JUMPV
LABELV $633
line 830
;830:	else {
line 831
;831:		for( n = 0; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $648
line 832
;832:			s_serveroptions.playerTeam[n].generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+4544+44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 833
;833:		}
LABELV $649
line 831
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $648
line 834
;834:	}
LABELV $634
line 835
;835:}
LABELV $601
endproc ServerOptions_InitPlayerItems 12 12
proc ServerOptions_SetPlayerItems 12 0
line 843
;836:
;837:
;838:/*
;839:=================
;840:ServerOptions_SetPlayerItems
;841:=================
;842:*/
;843:static void ServerOptions_SetPlayerItems( void ) {
line 855
;844:	int		start;
;845:	int		n;
;846:
;847:	// types
;848://	for( n = 0; n < PLAYER_SLOTS; n++ ) {
;849://		if( (!s_serveroptions.multiplayer) && (n > 0) && (s_serveroptions.playerType[n].curvalue == 0) ) {
;850://			s_serveroptions.playerType[n].curvalue = 1;
;851://		}
;852://	}
;853:
;854:	// names
;855:	if( s_serveroptions.dedicated.curvalue == 0 ) {
ADDRGP4 s_serveroptions+548+68
INDIRI4
CNSTI4 0
NEI4 $655
line 856
;856:		s_serveroptions.player0.string = "Human";
ADDRGP4 s_serveroptions+2260+64
ADDRGP4 $661
ASGNP4
line 857
;857:		s_serveroptions.playerName[0].generic.flags &= ~QMF_HIDDEN;
ADDRLP4 8
ADDRGP4 s_serveroptions+3632+44
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 4294963199
BANDU4
ASGNU4
line 859
;858:
;859:		start = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 860
;860:	}
ADDRGP4 $656
JUMPV
LABELV $655
line 861
;861:	else {
line 862
;862:		s_serveroptions.player0.string = "Open";
ADDRGP4 s_serveroptions+2260+64
ADDRGP4 $474
ASGNP4
line 863
;863:		start = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 864
;864:	}
LABELV $656
line 865
;865:	for( n = start; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $669
JUMPV
LABELV $666
line 866
;866:		if( s_serveroptions.playerType[n].curvalue == 1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+2336+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $670
line 867
;867:			s_serveroptions.playerName[n].generic.flags &= ~(QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 s_serveroptions+3632+44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 868
;868:		}
ADDRGP4 $671
JUMPV
LABELV $670
line 869
;869:		else {
line 870
;870:			s_serveroptions.playerName[n].generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 s_serveroptions+3632+44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 871
;871:		}
LABELV $671
line 872
;872:	}
LABELV $667
line 865
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $669
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $666
line 875
;873:
;874:	// teams
;875:	if( s_serveroptions.gametype < GT_TDM ) {
ADDRGP4 s_serveroptions+6120
INDIRI4
CNSTI4 3
GEI4 $678
line 876
;876:		return;
ADDRGP4 $654
JUMPV
LABELV $678
line 878
;877:	}
;878:	for( n = start; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $684
JUMPV
LABELV $681
line 879
;879:		if( s_serveroptions.playerType[n].curvalue == 2 ) {
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+2336+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $685
line 880
;880:			s_serveroptions.playerTeam[n].generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+4544+44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 881
;881:		}
ADDRGP4 $686
JUMPV
LABELV $685
line 882
;882:		else {
line 883
;883:			s_serveroptions.playerTeam[n].generic.flags &= ~(QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+4544+44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 884
;884:		}
LABELV $686
line 885
;885:	}
LABELV $682
line 878
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $684
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $681
line 886
;886:}
LABELV $654
endproc ServerOptions_SetPlayerItems 12 0
proc ServerOptions_Event 8 0
line 894
;887:
;888:
;889:/*
;890:=================
;891:ServerOptions_Event
;892:=================
;893:*/
;894:static void ServerOptions_Event( void* ptr, int event ) {
line 895
;895:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $694
ADDRLP4 0
INDIRI4
CNSTI4 24
GTI4 $694
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $710-72
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $710
address $704
address $694
address $697
address $700
address $700
address $701
address $707
code
LABELV $697
line 901
;896:	
;897:	//if( event != QM_ACTIVATED && event != QM_LOSTFOCUS) {
;898:	//	return;
;899:	//}
;900:	case ID_PLAYER_TYPE:
;901:		if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $698
line 902
;902:			break;
ADDRGP4 $695
JUMPV
LABELV $698
line 904
;903:		}
;904:		ServerOptions_SetPlayerItems();
ADDRGP4 ServerOptions_SetPlayerItems
CALLV
pop
line 905
;905:		break;
ADDRGP4 $695
JUMPV
LABELV $700
line 909
;906:
;907:	case ID_MAXCLIENTS:
;908:	case ID_DEDICATED:
;909:		ServerOptions_SetPlayerItems();
ADDRGP4 ServerOptions_SetPlayerItems
CALLV
pop
line 910
;910:		break;
ADDRGP4 $695
JUMPV
LABELV $701
line 912
;911:	case ID_GO:
;912:		if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $702
line 913
;913:			break;
ADDRGP4 $695
JUMPV
LABELV $702
line 915
;914:		}
;915:		ServerOptions_Start();
ADDRGP4 ServerOptions_Start
CALLV
pop
line 916
;916:		break;
ADDRGP4 $695
JUMPV
LABELV $704
line 919
;917:
;918:	case ID_STARTSERVERNEXT:
;919:		if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $695
line 920
;920:			break;
ADDRGP4 $695
JUMPV
line 922
;921:		}
;922:		break;
LABELV $707
line 924
;923:	case ID_BACK:
;924:		if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $708
line 925
;925:			break;
ADDRGP4 $695
JUMPV
LABELV $708
line 927
;926:		}
;927:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 928
;928:		break;
LABELV $694
LABELV $695
line 930
;929:	}
;930:}
LABELV $693
endproc ServerOptions_Event 8 0
proc ServerOptions_PlayerNameEvent 4 4
line 933
;931:
;932:
;933:static void ServerOptions_PlayerNameEvent( void* ptr, int event ) {
line 936
;934:	int		n;
;935:
;936:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $713
line 937
;937:		return;
ADDRGP4 $712
JUMPV
LABELV $713
line 939
;938:	}
;939:	n = ((menutext_s*)ptr)->generic.id;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 940
;940:	s_serveroptions.newBotIndex = n;
ADDRGP4 s_serveroptions+6352
ADDRLP4 0
INDIRI4
ASGNI4
line 941
;941:	UI_BotSelectMenu( s_serveroptions.playerNameBuffers[n] );
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+6156
ADDP4
ARGP4
ADDRGP4 UI_BotSelectMenu
CALLV
pop
line 942
;942:}
LABELV $712
endproc ServerOptions_PlayerNameEvent 4 4
proc ServerOptions_StatusBar 4 20
line 950
;943:
;944:
;945:/*
;946:=================
;947:ServerOptions_StatusBar
;948:=================
;949:*/
;950:static void ServerOptions_StatusBar( void* ptr ) {
line 951
;951:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $718
JUMPV
LABELV $718
line 953
;952:	default:
;953:		UI_DrawString( 320, 440, "0 = NO LIMIT", UI_CENTER|UI_SMALLFONT, colorWhite );
CNSTI4 320
ARGI4
CNSTI4 440
ARGI4
ADDRGP4 $721
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 954
;954:		break;
LABELV $719
line 956
;955:	}
;956:}
LABELV $717
endproc ServerOptions_StatusBar 4 20
proc ServerOptions_LevelshotDraw 16 20
line 964
;957:
;958:
;959:/*
;960:===============
;961:ServerOptions_LevelshotDraw
;962:===============
;963:*/
;964:static void ServerOptions_LevelshotDraw( void *self ) {
line 970
;965:	menubitmap_s	*b;
;966:	int				x;
;967:	int				y;
;968:
;969:	// strange place for this, but it works
;970:	if( s_serveroptions.newBot ) {
ADDRGP4 s_serveroptions+6348
INDIRI4
CNSTI4 0
EQI4 $723
line 971
;971:		Q_strncpyz( s_serveroptions.playerNameBuffers[s_serveroptions.newBotIndex], s_serveroptions.newBotName, 16 );
ADDRGP4 s_serveroptions+6352
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+6156
ADDP4
ARGP4
ADDRGP4 s_serveroptions+6356
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 972
;972:		s_serveroptions.newBot = qfalse;
ADDRGP4 s_serveroptions+6348
CNSTI4 0
ASGNI4
line 973
;973:	}
LABELV $723
line 975
;974:
;975:	b = (menubitmap_s *)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 977
;976:
;977:	Bitmap_Draw( b );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Bitmap_Draw
CALLV
pop
line 979
;978:
;979:	x = b->generic.x;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 980
;980:	y = b->generic.y + b->height;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ADDI4
ASGNI4
line 981
;981:	UI_FillRect( x, y, b->width, 40, colorBlack );
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1109393408
ARGF4
ADDRGP4 colorBlack
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 983
;982:
;983:	x += b->width / 2;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 2
DIVI4
ADDI4
ASGNI4
line 984
;984:	y += 4;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 4
ADDI4
ASGNI4
line 985
;985:	UI_DrawString( x, y, s_serveroptions.mapnamebuffer, UI_CENTER|UI_SMALLFONT, color_orange );
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 s_serveroptions+6124
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 987
;986:
;987:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 988
;988:	UI_DrawString( x, y, gametype_items[gametype_remap2[s_serveroptions.gametype]], UI_CENTER|UI_SMALLFONT, color_orange );
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 s_serveroptions+6120
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gametype_remap2
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gametype_items
ADDP4
INDIRP4
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 989
;989:}
LABELV $722
endproc ServerOptions_LevelshotDraw 16 20
proc ServerOptions_InitBotNames 1068 12
line 992
;990:
;991:
;992:static void ServerOptions_InitBotNames( void ) {
line 1001
;993:	int			count;
;994:	int			n;
;995:	const char	*arenaInfo;
;996:	const char	*botInfo;
;997:	char		*p;
;998:	char		*bot;
;999:	char		bots[MAX_INFO_STRING];
;1000:
;1001:	if( s_serveroptions.gametype >= GT_TDM ) {
ADDRGP4 s_serveroptions+6120
INDIRI4
CNSTI4 3
LTI4 $733
line 1002
;1002:		Q_strncpyz( s_serveroptions.playerNameBuffers[1], "grunt", 16 );
ADDRGP4 s_serveroptions+6156+16
ARGP4
ADDRGP4 $738
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1003
;1003:		Q_strncpyz( s_serveroptions.playerNameBuffers[2], "major", 16 );
ADDRGP4 s_serveroptions+6156+32
ARGP4
ADDRGP4 $741
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1004
;1004:		if( s_serveroptions.gametype == GT_TDM ) {
ADDRGP4 s_serveroptions+6120
INDIRI4
CNSTI4 3
NEI4 $742
line 1005
;1005:			Q_strncpyz( s_serveroptions.playerNameBuffers[3], "visor", 16 );
ADDRGP4 s_serveroptions+6156+48
ARGP4
ADDRGP4 $747
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1006
;1006:		}
ADDRGP4 $743
JUMPV
LABELV $742
line 1007
;1007:		else {
line 1008
;1008:			s_serveroptions.playerType[3].curvalue = 2;
ADDRGP4 s_serveroptions+2336+324+68
CNSTI4 2
ASGNI4
line 1009
;1009:		}
LABELV $743
line 1010
;1010:		s_serveroptions.playerType[4].curvalue = 2;
ADDRGP4 s_serveroptions+2336+432+68
CNSTI4 2
ASGNI4
line 1011
;1011:		s_serveroptions.playerType[5].curvalue = 2;
ADDRGP4 s_serveroptions+2336+540+68
CNSTI4 2
ASGNI4
line 1013
;1012:
;1013:		Q_strncpyz( s_serveroptions.playerNameBuffers[6], "sarge", 16 );
ADDRGP4 s_serveroptions+6156+96
ARGP4
ADDRGP4 $759
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1014
;1014:		Q_strncpyz( s_serveroptions.playerNameBuffers[7], "grunt", 16 );
ADDRGP4 s_serveroptions+6156+112
ARGP4
ADDRGP4 $738
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1015
;1015:		Q_strncpyz( s_serveroptions.playerNameBuffers[8], "major", 16 );
ADDRGP4 s_serveroptions+6156+128
ARGP4
ADDRGP4 $741
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1016
;1016:		if( s_serveroptions.gametype == GT_TDM ) {
ADDRGP4 s_serveroptions+6120
INDIRI4
CNSTI4 3
NEI4 $764
line 1017
;1017:			Q_strncpyz( s_serveroptions.playerNameBuffers[9], "visor", 16 );
ADDRGP4 s_serveroptions+6156+144
ARGP4
ADDRGP4 $747
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1018
;1018:		}
ADDRGP4 $765
JUMPV
LABELV $764
line 1019
;1019:		else {
line 1020
;1020:			s_serveroptions.playerType[9].curvalue = 2;
ADDRGP4 s_serveroptions+2336+972+68
CNSTI4 2
ASGNI4
line 1021
;1021:		}
LABELV $765
line 1022
;1022:		s_serveroptions.playerType[10].curvalue = 2;
ADDRGP4 s_serveroptions+2336+1080+68
CNSTI4 2
ASGNI4
line 1023
;1023:		s_serveroptions.playerType[11].curvalue = 2;
ADDRGP4 s_serveroptions+2336+1188+68
CNSTI4 2
ASGNI4
line 1025
;1024:
;1025:		return;
ADDRGP4 $732
JUMPV
LABELV $733
line 1028
;1026:	}
;1027:
;1028:	count = 1;	// skip the first slot, reserved for a human
ADDRLP4 4
CNSTI4 1
ASGNI4
line 1031
;1029:
;1030:	// get info for this map
;1031:	arenaInfo = UI_GetArenaInfoByMap( s_serveroptions.mapnamebuffer );
ADDRGP4 s_serveroptions+6124
ARGP4
ADDRLP4 1048
ADDRGP4 UI_GetArenaInfoByMap
CALLP4
ASGNP4
ADDRLP4 1044
ADDRLP4 1048
INDIRP4
ASGNP4
line 1034
;1032:
;1033:	// get the bot info - we'll seed with them if any are listed
;1034:	Q_strncpyz( bots, Info_ValueForKey( arenaInfo, "bots" ), sizeof(bots) );
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 $779
ARGP4
ADDRLP4 1052
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 20
ARGP4
ADDRLP4 1052
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1035
;1035:	p = &bots[0];
ADDRLP4 0
ADDRLP4 20
ASGNP4
ADDRGP4 $781
JUMPV
line 1036
;1036:	while( *p && count < PLAYER_SLOTS ) {
LABELV $783
line 1038
;1037:		//skip spaces
;1038:		while( *p == ' ' ) {
line 1039
;1039:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1040
;1040:		}
LABELV $784
line 1038
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $783
line 1041
;1041:		if( !*p ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $786
line 1042
;1042:			break;
ADDRGP4 $782
JUMPV
LABELV $786
line 1046
;1043:		}
;1044:
;1045:		// mark start of bot name
;1046:		bot = p;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $789
JUMPV
LABELV $788
line 1049
;1047:
;1048:		// skip until space of null
;1049:		while( *p && *p != ' ' ) {
line 1050
;1050:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1051
;1051:		}
LABELV $789
line 1049
ADDRLP4 1056
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
EQI4 $791
ADDRLP4 1056
INDIRI4
CNSTI4 32
NEI4 $788
LABELV $791
line 1052
;1052:		if( *p ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $792
line 1053
;1053:			*p++ = 0;
ADDRLP4 1060
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 1060
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 1060
INDIRP4
CNSTI1 0
ASGNI1
line 1054
;1054:		}
LABELV $792
line 1056
;1055:
;1056:		botInfo = UI_GetBotInfoByName( bot );
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1060
ADDRGP4 UI_GetBotInfoByName
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 1060
INDIRP4
ASGNP4
line 1057
;1057:		bot = Info_ValueForKey( botInfo, "name" );
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 $629
ARGP4
ADDRLP4 1064
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1064
INDIRP4
ASGNP4
line 1059
;1058:
;1059:		Q_strncpyz( s_serveroptions.playerNameBuffers[count], bot, sizeof(s_serveroptions.playerNameBuffers[count]) );
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+6156
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1060
;1060:		count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1061
;1061:	}
LABELV $781
line 1036
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $796
ADDRLP4 4
INDIRI4
CNSTI4 12
LTI4 $784
LABELV $796
LABELV $782
line 1064
;1062:
;1063:	// set the rest of the bot slots to "---"
;1064:	for( n = count; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 12
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $800
JUMPV
LABELV $797
line 1065
;1065:		strcpy( s_serveroptions.playerNameBuffers[n], "--------" );
ADDRLP4 12
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+6156
ADDP4
ARGP4
ADDRGP4 $802
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1066
;1066:	}
LABELV $798
line 1064
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $800
ADDRLP4 12
INDIRI4
CNSTI4 12
LTI4 $797
line 1069
;1067:
;1068:	// pad up to #8 as open slots
;1069:	for( ;count < 8; count++ ) {
ADDRGP4 $806
JUMPV
LABELV $803
line 1070
;1070:		s_serveroptions.playerType[count].curvalue = 0;
ADDRLP4 4
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+2336+68
ADDP4
CNSTI4 0
ASGNI4
line 1071
;1071:	}
LABELV $804
line 1069
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $806
ADDRLP4 4
INDIRI4
CNSTI4 8
LTI4 $803
line 1074
;1072:
;1073:	// close off the rest by default
;1074:	for( ;count < PLAYER_SLOTS; count++ ) {
ADDRGP4 $812
JUMPV
LABELV $809
line 1075
;1075:		if( s_serveroptions.playerType[count].curvalue == 1 ) {
ADDRLP4 4
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+2336+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $813
line 1076
;1076:			s_serveroptions.playerType[count].curvalue = 2;
ADDRLP4 4
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+2336+68
ADDP4
CNSTI4 2
ASGNI4
line 1077
;1077:		}
LABELV $813
line 1078
;1078:	}
LABELV $810
line 1074
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $812
ADDRLP4 4
INDIRI4
CNSTI4 12
LTI4 $809
line 1079
;1079:}
LABELV $732
endproc ServerOptions_InitBotNames 1068 12
bss
align 1
LABELV $820
skip 64
code
proc ServerOptions_SetMenuItems 104 16
line 1087
;1080:
;1081:
;1082:/*
;1083:=================
;1084:ServerOptions_SetMenuItems
;1085:=================
;1086:*/
;1087:static void ServerOptions_SetMenuItems( void ) {
line 1092
;1088:	static char picname[MAX_QPATH];
;1089:	char		mapname[MAX_NAMELENGTH];
;1090:	const char	*info;
;1091:
;1092:	switch( s_serveroptions.gametype ) {
ADDRLP4 20
ADDRGP4 s_serveroptions+6120
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 1
LTI4 $821
ADDRLP4 20
INDIRI4
CNSTI4 4
GTI4 $821
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $857-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $857
address $824
address $832
address $839
address $848
code
LABELV $824
LABELV $821
line 1095
;1093:	case GT_FFA:
;1094:	default:
;1095:		Com_sprintf( s_serveroptions.fraglimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_ffa_fraglimit" ) ) );
ADDRGP4 $539
ARGP4
ADDRLP4 24
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+996+64+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $828
ARGP4
ADDRLP4 28
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1096
;1096:		Com_sprintf( s_serveroptions.timelimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_ffa_timelimit" ) ) );
ADDRGP4 $540
ARGP4
ADDRLP4 32
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 36
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+656+64+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $828
ARGP4
ADDRLP4 36
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1097
;1097:		break;
ADDRGP4 $822
JUMPV
LABELV $832
line 1100
;1098:
;1099:	case GT_DUEL:
;1100:		Com_sprintf( s_serveroptions.fraglimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_tourney_fraglimit" ) ) );
ADDRGP4 $542
ARGP4
ADDRLP4 40
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 40
INDIRF4
ARGF4
ADDRLP4 44
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+996+64+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $828
ARGP4
ADDRLP4 44
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1101
;1101:		Com_sprintf( s_serveroptions.timelimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_tourney_timelimit" ) ) );
ADDRGP4 $543
ARGP4
ADDRLP4 48
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 48
INDIRF4
ARGF4
ADDRLP4 52
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+656+64+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $828
ARGP4
ADDRLP4 52
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1102
;1102:		break;
ADDRGP4 $822
JUMPV
LABELV $839
line 1105
;1103:
;1104:	case GT_TDM:
;1105:		Com_sprintf( s_serveroptions.fraglimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_team_fraglimit" ) ) );
ADDRGP4 $545
ARGP4
ADDRLP4 56
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 60
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+996+64+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $828
ARGP4
ADDRLP4 60
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1106
;1106:		Com_sprintf( s_serveroptions.timelimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_team_timelimit" ) ) );
ADDRGP4 $546
ARGP4
ADDRLP4 64
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 68
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+656+64+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $828
ARGP4
ADDRLP4 68
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1107
;1107:		s_serveroptions.friendlyfire.curvalue = (int)Com_Clamp( 0, 1, trap_Cvar_VariableValue( "ui_team_friendly" ) );
ADDRGP4 $547
ARGP4
ADDRLP4 72
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 72
INDIRF4
ARGF4
ADDRLP4 76
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+1676+64
ADDRLP4 76
INDIRF4
CVFI4 4
ASGNI4
line 1108
;1108:		break;
ADDRGP4 $822
JUMPV
LABELV $848
line 1111
;1109:
;1110:	case GT_CTF:
;1111:		Com_sprintf( s_serveroptions.flaglimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 100, trap_Cvar_VariableValue( "ui_ctf_capturelimit" ) ) );
ADDRGP4 $549
ARGP4
ADDRLP4 80
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1120403456
ARGF4
ADDRLP4 80
INDIRF4
ARGF4
ADDRLP4 84
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+1336+64+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $828
ARGP4
ADDRLP4 84
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1112
;1112:		Com_sprintf( s_serveroptions.timelimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_ctf_timelimit" ) ) );
ADDRGP4 $550
ARGP4
ADDRLP4 88
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 88
INDIRF4
ARGF4
ADDRLP4 92
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+656+64+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $828
ARGP4
ADDRLP4 92
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1113
;1113:		s_serveroptions.friendlyfire.curvalue = (int)Com_Clamp( 0, 1, trap_Cvar_VariableValue( "ui_ctf_friendly" ) );
ADDRGP4 $551
ARGP4
ADDRLP4 96
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 96
INDIRF4
ARGF4
ADDRLP4 100
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+1676+64
ADDRLP4 100
INDIRF4
CVFI4 4
ASGNI4
line 1114
;1114:		break;
LABELV $822
line 1117
;1115:	}
;1116:
;1117:	Q_strncpyz( s_serveroptions.hostname.field.buffer, UI_Cvar_VariableString( "sv_hostname" ), sizeof( s_serveroptions.hostname.field.buffer ) );
ADDRGP4 $561
ARGP4
ADDRLP4 24
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 s_serveroptions+1744+64+12
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1118
;1118:	s_serveroptions.pure.curvalue = Com_Clamp( 0, 1, trap_Cvar_VariableValue( "sv_pure" ) );
ADDRGP4 $560
ARGP4
ADDRLP4 28
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 32
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+2084+64
ADDRLP4 32
INDIRF4
CVFI4 4
ASGNI4
line 1121
;1119:
;1120:	// set the map pic
;1121:	info = UI_GetArenaInfoByNumber( s_startserver.maplist[ s_startserver.currentmap ]);
ADDRGP4 s_startserver+2024
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_startserver+2040
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 36
INDIRP4
ASGNP4
line 1122
;1122:	Q_strncpyz( mapname, Info_ValueForKey( info, "map" ), sizeof( mapname ) );
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 $98
ARGP4
ADDRLP4 40
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1123
;1123:	Q_strupr( mapname );
ADDRLP4 0
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 1124
;1124:	Com_sprintf( picname, sizeof( picname ), "levelshots/%s", mapname );
ADDRGP4 $820
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $99
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1125
;1125:	s_serveroptions.mappic.generic.name = picname;
ADDRGP4 s_serveroptions+364+4
ADDRGP4 $820
ASGNP4
line 1128
;1126:
;1127:	// set the map name
;1128:	strcpy( s_serveroptions.mapnamebuffer, s_startserver.mapname.string );
ADDRGP4 s_serveroptions+6124
ARGP4
ADDRGP4 s_startserver+1852+64
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1129
;1129:	Q_strupr( s_serveroptions.mapnamebuffer );
ADDRGP4 s_serveroptions+6124
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 1132
;1130:
;1131:	// get the player selections initialized
;1132:	ServerOptions_InitPlayerItems();
ADDRGP4 ServerOptions_InitPlayerItems
CALLV
pop
line 1133
;1133:	ServerOptions_SetPlayerItems();
ADDRGP4 ServerOptions_SetPlayerItems
CALLV
pop
line 1136
;1134:
;1135:	// seed bot names
;1136:	ServerOptions_InitBotNames();
ADDRGP4 ServerOptions_InitBotNames
CALLV
pop
line 1137
;1137:	ServerOptions_SetPlayerItems();
ADDRGP4 ServerOptions_SetPlayerItems
CALLV
pop
line 1138
;1138:}
LABELV $819
endproc ServerOptions_SetMenuItems 104 16
proc PlayerName_Draw 36 20
line 1145
;1139:
;1140:/*
;1141:=================
;1142:PlayerName_Draw
;1143:=================
;1144:*/
;1145:static void PlayerName_Draw( void *item ) {
line 1152
;1146:	menutext_s	*s;
;1147:	float		*color;
;1148:	int			x, y;
;1149:	int			style;
;1150:	qboolean	focus;
;1151:
;1152:	s = (menutext_s *)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 1154
;1153:
;1154:	x = s->generic.x;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1155
;1155:	y =	s->generic.y;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 1157
;1156:
;1157:	style = UI_SMALLFONT;
ADDRLP4 16
CNSTI4 16
ASGNI4
line 1158
;1158:	focus = (s->generic.parent->cursor == s->generic.menuPosition);
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $877
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 $878
JUMPV
LABELV $877
ADDRLP4 24
CNSTI4 0
ASGNI4
LABELV $878
ADDRLP4 20
ADDRLP4 24
INDIRI4
ASGNI4
line 1160
;1159:
;1160:	if ( s->generic.flags & QMF_GRAYED )
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 8192
BANDU4
CNSTU4 0
EQU4 $879
line 1161
;1161:		color = text_color_disabled;
ADDRLP4 4
ADDRGP4 text_color_disabled
ASGNP4
ADDRGP4 $880
JUMPV
LABELV $879
line 1162
;1162:	else if ( focus )
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $881
line 1163
;1163:	{
line 1164
;1164:		color = text_color_highlight;
ADDRLP4 4
ADDRGP4 text_color_highlight
ASGNP4
line 1165
;1165:		style |= UI_PULSE;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 1166
;1166:	}
ADDRGP4 $882
JUMPV
LABELV $881
line 1167
;1167:	else if ( s->generic.flags & QMF_BLINK )
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 1
BANDU4
CNSTU4 0
EQU4 $883
line 1168
;1168:	{
line 1169
;1169:		color = text_color_highlight;
ADDRLP4 4
ADDRGP4 text_color_highlight
ASGNP4
line 1170
;1170:		style |= UI_BLINK;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 1171
;1171:	}
ADDRGP4 $884
JUMPV
LABELV $883
line 1173
;1172:	else
;1173:		color = text_color_normal;
ADDRLP4 4
ADDRGP4 text_color_normal
ASGNP4
LABELV $884
LABELV $882
LABELV $880
line 1175
;1174:
;1175:	if ( focus )
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $885
line 1176
;1176:	{
line 1178
;1177:		// draw cursor
;1178:		UI_FillRect( s->generic.left, s->generic.top, s->generic.right-s->generic.left+1, s->generic.bottom-s->generic.top+1, listbar_color ); 
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
SUBI4
CNSTI4 1
ADDI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
SUBI4
CNSTI4 1
ADDI4
CVIF4 4
ARGF4
ADDRGP4 listbar_color
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 1179
;1179:		UI_DrawChar( x, y, 13, UI_CENTER|UI_BLINK|UI_SMALLFONT, color);
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
CNSTI4 13
ARGI4
CNSTI4 4113
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 UI_DrawChar
CALLV
pop
line 1180
;1180:	}
LABELV $885
line 1182
;1181:
;1182:	UI_DrawString( x - SMALLCHAR_WIDTH, y, s->generic.name, style|UI_RIGHT, color );
ADDRLP4 8
INDIRI4
CNSTI4 8
SUBI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
INDIRI4
CNSTI4 2
BORI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1183
;1183:	UI_DrawString( x + SMALLCHAR_WIDTH, y, s->string, style|UI_LEFT, color );
ADDRLP4 8
INDIRI4
CNSTI4 8
ADDI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1184
;1184:}
LABELV $875
endproc PlayerName_Draw 36 20
proc ServerOptions_MenuInit 52 12
line 1194
;1185:
;1186:
;1187:/*
;1188:=================
;1189:ServerOptions_MenuInit
;1190:=================
;1191:*/
;1192:#define OPTIONS_X	456
;1193:
;1194:static void ServerOptions_MenuInit( qboolean multiplayer ) {
line 1198
;1195:	int		y;
;1196:	int		n;
;1197:
;1198:	memset( &s_serveroptions, 0 ,sizeof(serveroptions_t) );
ADDRGP4 s_serveroptions
ARGP4
CNSTI4 0
ARGI4
CNSTI4 6480
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1199
;1199:	s_serveroptions.multiplayer = multiplayer;
ADDRGP4 s_serveroptions+6116
ADDRFP4 0
INDIRI4
ASGNI4
line 1200
;1200:	s_serveroptions.gametype = (int)Com_Clamp( 0, GT_MAX_GAME_TYPE-1, trap_Cvar_VariableValue( "g_gameType" ) );
ADDRGP4 $194
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1088421888
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+6120
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 1201
;1201:	s_serveroptions.punkbuster.curvalue = Com_Clamp( 0, 1, trap_Cvar_VariableValue( "sv_punkbuster" ) );
ADDRGP4 $565
ARGP4
ADDRLP4 16
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+6372+68
ADDRLP4 20
INDIRF4
CVFI4 4
ASGNI4
line 1203
;1202:
;1203:	ServerOptions_Cache();
ADDRGP4 ServerOptions_Cache
CALLV
pop
line 1205
;1204:
;1205:	s_serveroptions.menu.wrapAround = qtrue;
ADDRGP4 s_serveroptions+276
CNSTI4 1
ASGNI4
line 1206
;1206:	s_serveroptions.menu.fullscreen = qtrue;
ADDRGP4 s_serveroptions+280
CNSTI4 1
ASGNI4
line 1208
;1207:
;1208:	s_serveroptions.banner.generic.type			= MTYPE_BTEXT;
ADDRGP4 s_serveroptions+288
CNSTI4 10
ASGNI4
line 1209
;1209:	s_serveroptions.banner.generic.x			= 320;
ADDRGP4 s_serveroptions+288+12
CNSTI4 320
ASGNI4
line 1210
;1210:	s_serveroptions.banner.generic.y			= 16;
ADDRGP4 s_serveroptions+288+16
CNSTI4 16
ASGNI4
line 1211
;1211:	s_serveroptions.banner.string  				= "GAME SERVER";
ADDRGP4 s_serveroptions+288+64
ADDRGP4 $227
ASGNP4
line 1212
;1212:	s_serveroptions.banner.color  				= color_white;
ADDRGP4 s_serveroptions+288+72
ADDRGP4 color_white
ASGNP4
line 1213
;1213:	s_serveroptions.banner.style  				= UI_CENTER;
ADDRGP4 s_serveroptions+288+68
CNSTI4 1
ASGNI4
line 1215
;1214:
;1215:	s_serveroptions.mappic.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_serveroptions+364
CNSTI4 6
ASGNI4
line 1216
;1216:	s_serveroptions.mappic.generic.flags		= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_serveroptions+364+44
CNSTU4 16388
ASGNU4
line 1217
;1217:	s_serveroptions.mappic.generic.x			= 352;
ADDRGP4 s_serveroptions+364+12
CNSTI4 352
ASGNI4
line 1218
;1218:	s_serveroptions.mappic.generic.y			= 80;
ADDRGP4 s_serveroptions+364+16
CNSTI4 80
ASGNI4
line 1219
;1219:	s_serveroptions.mappic.width				= 160;
ADDRGP4 s_serveroptions+364+80
CNSTI4 160
ASGNI4
line 1220
;1220:	s_serveroptions.mappic.height				= 120;
ADDRGP4 s_serveroptions+364+84
CNSTI4 120
ASGNI4
line 1221
;1221:	s_serveroptions.mappic.errorpic				= GAMESERVER_UNKNOWNMAP;
ADDRGP4 s_serveroptions+364+68
ADDRGP4 $298
ASGNP4
line 1222
;1222:	s_serveroptions.mappic.generic.ownerdraw	= ServerOptions_LevelshotDraw;
ADDRGP4 s_serveroptions+364+56
ADDRGP4 ServerOptions_LevelshotDraw
ASGNP4
line 1224
;1223:
;1224:	s_serveroptions.picframe.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_serveroptions+456
CNSTI4 6
ASGNI4
line 1225
;1225:	s_serveroptions.picframe.generic.flags		= QMF_LEFT_JUSTIFY|QMF_INACTIVE|QMF_HIGHLIGHT;
ADDRGP4 s_serveroptions+456+44
CNSTU4 16452
ASGNU4
line 1226
;1226:	s_serveroptions.picframe.generic.x			= 352 - 38;
ADDRGP4 s_serveroptions+456+12
CNSTI4 314
ASGNI4
line 1227
;1227:	s_serveroptions.picframe.generic.y			= 80 - 40;
ADDRGP4 s_serveroptions+456+16
CNSTI4 40
ASGNI4
line 1228
;1228:	s_serveroptions.picframe.width  			= 320;
ADDRGP4 s_serveroptions+456+80
CNSTI4 320
ASGNI4
line 1229
;1229:	s_serveroptions.picframe.height  			= 320;
ADDRGP4 s_serveroptions+456+84
CNSTI4 320
ASGNI4
line 1230
;1230:	s_serveroptions.picframe.focuspic			= GAMESERVER_SELECT;
ADDRGP4 s_serveroptions+456+64
ADDRGP4 $326
ASGNP4
line 1232
;1231:
;1232:	y = 272;
ADDRLP4 4
CNSTI4 272
ASGNI4
line 1233
;1233:	if( s_serveroptions.gametype != GT_CTF ) {
ADDRGP4 s_serveroptions+6120
INDIRI4
CNSTI4 4
EQI4 $933
line 1234
;1234:		s_serveroptions.fraglimit.generic.type       = MTYPE_FIELD;
ADDRGP4 s_serveroptions+996
CNSTI4 4
ASGNI4
line 1235
;1235:		s_serveroptions.fraglimit.generic.name       = "Frag Limit:";
ADDRGP4 s_serveroptions+996+4
ADDRGP4 $939
ASGNP4
line 1236
;1236:		s_serveroptions.fraglimit.generic.flags      = QMF_NUMBERSONLY|QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+996+44
CNSTU4 290
ASGNU4
line 1237
;1237:		s_serveroptions.fraglimit.generic.x	         = OPTIONS_X;
ADDRGP4 s_serveroptions+996+12
CNSTI4 456
ASGNI4
line 1238
;1238:		s_serveroptions.fraglimit.generic.y	         = y;
ADDRGP4 s_serveroptions+996+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1239
;1239:		s_serveroptions.fraglimit.generic.statusbar  = ServerOptions_StatusBar;
ADDRGP4 s_serveroptions+996+52
ADDRGP4 ServerOptions_StatusBar
ASGNP4
line 1240
;1240:		s_serveroptions.fraglimit.field.widthInChars = 3;
ADDRGP4 s_serveroptions+996+64+8
CNSTI4 3
ASGNI4
line 1241
;1241:		s_serveroptions.fraglimit.field.maxchars     = 3;
ADDRGP4 s_serveroptions+996+64+268
CNSTI4 3
ASGNI4
line 1242
;1242:	}
ADDRGP4 $934
JUMPV
LABELV $933
line 1243
;1243:	else {
line 1244
;1244:		s_serveroptions.flaglimit.generic.type       = MTYPE_FIELD;
ADDRGP4 s_serveroptions+1336
CNSTI4 4
ASGNI4
line 1245
;1245:		s_serveroptions.flaglimit.generic.name       = "Capture Limit:";
ADDRGP4 s_serveroptions+1336+4
ADDRGP4 $957
ASGNP4
line 1246
;1246:		s_serveroptions.flaglimit.generic.flags      = QMF_NUMBERSONLY|QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+1336+44
CNSTU4 290
ASGNU4
line 1247
;1247:		s_serveroptions.flaglimit.generic.x	         = OPTIONS_X;
ADDRGP4 s_serveroptions+1336+12
CNSTI4 456
ASGNI4
line 1248
;1248:		s_serveroptions.flaglimit.generic.y	         = y;
ADDRGP4 s_serveroptions+1336+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1249
;1249:		s_serveroptions.flaglimit.generic.statusbar  = ServerOptions_StatusBar;
ADDRGP4 s_serveroptions+1336+52
ADDRGP4 ServerOptions_StatusBar
ASGNP4
line 1250
;1250:		s_serveroptions.flaglimit.field.widthInChars = 3;
ADDRGP4 s_serveroptions+1336+64+8
CNSTI4 3
ASGNI4
line 1251
;1251:		s_serveroptions.flaglimit.field.maxchars     = 3;
ADDRGP4 s_serveroptions+1336+64+268
CNSTI4 3
ASGNI4
line 1252
;1252:	}
LABELV $934
line 1254
;1253:
;1254:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1255
;1255:	s_serveroptions.timelimit.generic.type       = MTYPE_FIELD;
ADDRGP4 s_serveroptions+656
CNSTI4 4
ASGNI4
line 1256
;1256:	s_serveroptions.timelimit.generic.name       = "Time Limit:";
ADDRGP4 s_serveroptions+656+4
ADDRGP4 $975
ASGNP4
line 1257
;1257:	s_serveroptions.timelimit.generic.flags      = QMF_NUMBERSONLY|QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+656+44
CNSTU4 290
ASGNU4
line 1258
;1258:	s_serveroptions.timelimit.generic.x	         = OPTIONS_X;
ADDRGP4 s_serveroptions+656+12
CNSTI4 456
ASGNI4
line 1259
;1259:	s_serveroptions.timelimit.generic.y	         = y;
ADDRGP4 s_serveroptions+656+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1260
;1260:	s_serveroptions.timelimit.generic.statusbar  = ServerOptions_StatusBar;
ADDRGP4 s_serveroptions+656+52
ADDRGP4 ServerOptions_StatusBar
ASGNP4
line 1261
;1261:	s_serveroptions.timelimit.field.widthInChars = 3;
ADDRGP4 s_serveroptions+656+64+8
CNSTI4 3
ASGNI4
line 1262
;1262:	s_serveroptions.timelimit.field.maxchars     = 3;
ADDRGP4 s_serveroptions+656+64+268
CNSTI4 3
ASGNI4
line 1264
;1263:
;1264:	if( s_serveroptions.gametype >= GT_TDM ) {
ADDRGP4 s_serveroptions+6120
INDIRI4
CNSTI4 3
LTI4 $990
line 1265
;1265:		y += BIGCHAR_HEIGHT+2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1266
;1266:		s_serveroptions.friendlyfire.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_serveroptions+1676
CNSTI4 5
ASGNI4
line 1267
;1267:		s_serveroptions.friendlyfire.generic.flags    = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+1676+44
CNSTU4 258
ASGNU4
line 1268
;1268:		s_serveroptions.friendlyfire.generic.x	      = OPTIONS_X;
ADDRGP4 s_serveroptions+1676+12
CNSTI4 456
ASGNI4
line 1269
;1269:		s_serveroptions.friendlyfire.generic.y	      = y;
ADDRGP4 s_serveroptions+1676+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1270
;1270:		s_serveroptions.friendlyfire.generic.name	  = "Friendly Fire:";
ADDRGP4 s_serveroptions+1676+4
ADDRGP4 $1002
ASGNP4
line 1271
;1271:	}
LABELV $990
line 1273
;1272:
;1273:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1274
;1274:	s_serveroptions.pure.generic.type			= MTYPE_RADIOBUTTON;
ADDRGP4 s_serveroptions+2084
CNSTI4 5
ASGNI4
line 1275
;1275:	s_serveroptions.pure.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+2084+44
CNSTU4 258
ASGNU4
line 1276
;1276:	s_serveroptions.pure.generic.x				= OPTIONS_X;
ADDRGP4 s_serveroptions+2084+12
CNSTI4 456
ASGNI4
line 1277
;1277:	s_serveroptions.pure.generic.y				= y;
ADDRGP4 s_serveroptions+2084+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1278
;1278:	s_serveroptions.pure.generic.name			= "Pure Server:";
ADDRGP4 s_serveroptions+2084+4
ADDRGP4 $1012
ASGNP4
line 1280
;1279:
;1280:	if( s_serveroptions.multiplayer ) {
ADDRGP4 s_serveroptions+6116
INDIRI4
CNSTI4 0
EQI4 $1013
line 1281
;1281:		y += BIGCHAR_HEIGHT+2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1282
;1282:		s_serveroptions.dedicated.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 s_serveroptions+548
CNSTI4 3
ASGNI4
line 1283
;1283:		s_serveroptions.dedicated.generic.id		= ID_DEDICATED;
ADDRGP4 s_serveroptions+548+8
CNSTI4 22
ASGNI4
line 1284
;1284:		s_serveroptions.dedicated.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+548+44
CNSTU4 258
ASGNU4
line 1285
;1285:		s_serveroptions.dedicated.generic.callback	= ServerOptions_Event;
ADDRGP4 s_serveroptions+548+48
ADDRGP4 ServerOptions_Event
ASGNP4
line 1286
;1286:		s_serveroptions.dedicated.generic.x			= OPTIONS_X;
ADDRGP4 s_serveroptions+548+12
CNSTI4 456
ASGNI4
line 1287
;1287:		s_serveroptions.dedicated.generic.y			= y;
ADDRGP4 s_serveroptions+548+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1288
;1288:		s_serveroptions.dedicated.generic.name		= "Dedicated:";
ADDRGP4 s_serveroptions+548+4
ADDRGP4 $1029
ASGNP4
line 1289
;1289:		s_serveroptions.dedicated.itemnames			= dedicated_list;
ADDRGP4 s_serveroptions+548+88
ADDRGP4 dedicated_list
ASGNP4
line 1290
;1290:	}
LABELV $1013
line 1292
;1291:
;1292:	if( s_serveroptions.multiplayer ) {
ADDRGP4 s_serveroptions+6116
INDIRI4
CNSTI4 0
EQI4 $1032
line 1293
;1293:		y += BIGCHAR_HEIGHT+2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1294
;1294:		s_serveroptions.hostname.generic.type       = MTYPE_FIELD;
ADDRGP4 s_serveroptions+1744
CNSTI4 4
ASGNI4
line 1295
;1295:		s_serveroptions.hostname.generic.name       = "Hostname:";
ADDRGP4 s_serveroptions+1744+4
ADDRGP4 $1038
ASGNP4
line 1296
;1296:		s_serveroptions.hostname.generic.flags      = QMF_SMALLFONT;
ADDRGP4 s_serveroptions+1744+44
CNSTU4 2
ASGNU4
line 1297
;1297:		s_serveroptions.hostname.generic.x          = OPTIONS_X;
ADDRGP4 s_serveroptions+1744+12
CNSTI4 456
ASGNI4
line 1298
;1298:		s_serveroptions.hostname.generic.y	        = y;
ADDRGP4 s_serveroptions+1744+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1299
;1299:		s_serveroptions.hostname.field.widthInChars = 18;
ADDRGP4 s_serveroptions+1744+64+8
CNSTI4 18
ASGNI4
line 1300
;1300:		s_serveroptions.hostname.field.maxchars     = 64;
ADDRGP4 s_serveroptions+1744+64+268
CNSTI4 64
ASGNI4
line 1301
;1301:	}
LABELV $1032
line 1303
;1302:
;1303:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1304
;1304:	s_serveroptions.punkbuster.generic.type			= MTYPE_SPINCONTROL;
ADDRGP4 s_serveroptions+6372
CNSTI4 3
ASGNI4
line 1305
;1305:	s_serveroptions.punkbuster.generic.name			= "Punkbuster:";
ADDRGP4 s_serveroptions+6372+4
ADDRGP4 $1054
ASGNP4
line 1306
;1306:	s_serveroptions.punkbuster.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+6372+44
CNSTU4 258
ASGNU4
line 1307
;1307:	s_serveroptions.punkbuster.generic.id			= 0;
ADDRGP4 s_serveroptions+6372+8
CNSTI4 0
ASGNI4
line 1308
;1308:	s_serveroptions.punkbuster.generic.x				= OPTIONS_X;
ADDRGP4 s_serveroptions+6372+12
CNSTI4 456
ASGNI4
line 1309
;1309:	s_serveroptions.punkbuster.generic.y				= y;
ADDRGP4 s_serveroptions+6372+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1310
;1310:	s_serveroptions.punkbuster.itemnames				= punkbuster_items;
ADDRGP4 s_serveroptions+6372+88
ADDRGP4 punkbuster_items
ASGNP4
line 1312
;1311:	
;1312:	y = 80;
ADDRLP4 4
CNSTI4 80
ASGNI4
line 1313
;1313:	s_serveroptions.botSkill.generic.type			= MTYPE_SPINCONTROL;
ADDRGP4 s_serveroptions+2152
CNSTI4 3
ASGNI4
line 1314
;1314:	s_serveroptions.botSkill.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+2152+44
CNSTU4 258
ASGNU4
line 1315
;1315:	s_serveroptions.botSkill.generic.name			= "Bot Skill:  ";
ADDRGP4 s_serveroptions+2152+4
ADDRGP4 $1070
ASGNP4
line 1316
;1316:	s_serveroptions.botSkill.generic.x				= 32 + (strlen(s_serveroptions.botSkill.generic.name) + 2 ) * SMALLCHAR_WIDTH;
ADDRGP4 s_serveroptions+2152+4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRGP4 s_serveroptions+2152+12
ADDRLP4 24
INDIRI4
CNSTI4 3
LSHI4
CNSTI4 16
ADDI4
CNSTI4 32
ADDI4
ASGNI4
line 1317
;1317:	s_serveroptions.botSkill.generic.y				= y;
ADDRGP4 s_serveroptions+2152+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1318
;1318:	s_serveroptions.botSkill.itemnames				= botSkill_list;
ADDRGP4 s_serveroptions+2152+88
ADDRGP4 botSkill_list
ASGNP4
line 1319
;1319:	s_serveroptions.botSkill.curvalue				= 1;
ADDRGP4 s_serveroptions+2152+68
CNSTI4 1
ASGNI4
line 1321
;1320:
;1321:	y += ( 2 * SMALLCHAR_HEIGHT );
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 32
ADDI4
ASGNI4
line 1322
;1322:	s_serveroptions.player0.generic.type			= MTYPE_TEXT;
ADDRGP4 s_serveroptions+2260
CNSTI4 7
ASGNI4
line 1323
;1323:	s_serveroptions.player0.generic.flags			= QMF_SMALLFONT;
ADDRGP4 s_serveroptions+2260+44
CNSTU4 2
ASGNU4
line 1324
;1324:	s_serveroptions.player0.generic.x				= 32 + SMALLCHAR_WIDTH;
ADDRGP4 s_serveroptions+2260+12
CNSTI4 40
ASGNI4
line 1325
;1325:	s_serveroptions.player0.generic.y				= y;
ADDRGP4 s_serveroptions+2260+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1326
;1326:	s_serveroptions.player0.color					= color_orange;
ADDRGP4 s_serveroptions+2260+72
ADDRGP4 color_orange
ASGNP4
line 1327
;1327:	s_serveroptions.player0.style					= UI_LEFT|UI_SMALLFONT;
ADDRGP4 s_serveroptions+2260+68
CNSTI4 16
ASGNI4
line 1329
;1328:
;1329:	for( n = 0; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1092
line 1330
;1330:		s_serveroptions.playerType[n].generic.type		= MTYPE_SPINCONTROL;
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+2336
ADDP4
CNSTI4 3
ASGNI4
line 1331
;1331:		s_serveroptions.playerType[n].generic.flags		= QMF_SMALLFONT;
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+2336+44
ADDP4
CNSTU4 2
ASGNU4
line 1332
;1332:		s_serveroptions.playerType[n].generic.id		= ID_PLAYER_TYPE;
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+2336+8
ADDP4
CNSTI4 20
ASGNI4
line 1333
;1333:		s_serveroptions.playerType[n].generic.callback	= ServerOptions_Event;
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+2336+48
ADDP4
ADDRGP4 ServerOptions_Event
ASGNP4
line 1334
;1334:		s_serveroptions.playerType[n].generic.x			= 32;
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+2336+12
ADDP4
CNSTI4 32
ASGNI4
line 1335
;1335:		s_serveroptions.playerType[n].generic.y			= y;
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+2336+16
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1336
;1336:		s_serveroptions.playerType[n].itemnames			= playerType_list;
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+2336+88
ADDP4
ADDRGP4 playerType_list
ASGNP4
line 1338
;1337:
;1338:		s_serveroptions.playerName[n].generic.type		= MTYPE_TEXT;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 s_serveroptions+3632
ADDP4
CNSTI4 7
ASGNI4
line 1339
;1339:		s_serveroptions.playerName[n].generic.flags		= QMF_SMALLFONT;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 s_serveroptions+3632+44
ADDP4
CNSTU4 2
ASGNU4
line 1340
;1340:		s_serveroptions.playerName[n].generic.x			= 96;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 s_serveroptions+3632+12
ADDP4
CNSTI4 96
ASGNI4
line 1341
;1341:		s_serveroptions.playerName[n].generic.y			= y;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 s_serveroptions+3632+16
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1342
;1342:		s_serveroptions.playerName[n].generic.callback	= ServerOptions_PlayerNameEvent;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 s_serveroptions+3632+48
ADDP4
ADDRGP4 ServerOptions_PlayerNameEvent
ASGNP4
line 1343
;1343:		s_serveroptions.playerName[n].generic.id		= n;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 s_serveroptions+3632+8
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1344
;1344:		s_serveroptions.playerName[n].generic.ownerdraw	= PlayerName_Draw;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 s_serveroptions+3632+56
ADDP4
ADDRGP4 PlayerName_Draw
ASGNP4
line 1345
;1345:		s_serveroptions.playerName[n].color				= color_orange;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 s_serveroptions+3632+72
ADDP4
ADDRGP4 color_orange
ASGNP4
line 1346
;1346:		s_serveroptions.playerName[n].style				= UI_SMALLFONT;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 s_serveroptions+3632+68
ADDP4
CNSTI4 16
ASGNI4
line 1347
;1347:		s_serveroptions.playerName[n].string			= s_serveroptions.playerNameBuffers[n];
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 s_serveroptions+3632+64
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+6156
ADDP4
ASGNP4
line 1348
;1348:		s_serveroptions.playerName[n].generic.top		= s_serveroptions.playerName[n].generic.y;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 s_serveroptions+3632+24
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 s_serveroptions+3632+16
ADDP4
INDIRI4
ASGNI4
line 1349
;1349:		s_serveroptions.playerName[n].generic.bottom	= s_serveroptions.playerName[n].generic.y + SMALLCHAR_HEIGHT;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 s_serveroptions+3632+32
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 s_serveroptions+3632+16
ADDP4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1350
;1350:		s_serveroptions.playerName[n].generic.left		= s_serveroptions.playerName[n].generic.x - SMALLCHAR_HEIGHT/ 2;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 s_serveroptions+3632+20
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 s_serveroptions+3632+12
ADDP4
INDIRI4
CNSTI4 8
SUBI4
ASGNI4
line 1351
;1351:		s_serveroptions.playerName[n].generic.right		= s_serveroptions.playerName[n].generic.x + 16 * SMALLCHAR_WIDTH;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 s_serveroptions+3632+28
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 s_serveroptions+3632+12
ADDP4
INDIRI4
CNSTI4 128
ADDI4
ASGNI4
line 1353
;1352:
;1353:		s_serveroptions.playerTeam[n].generic.type		= MTYPE_SPINCONTROL;
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+4544
ADDP4
CNSTI4 3
ASGNI4
line 1354
;1354:		s_serveroptions.playerTeam[n].generic.flags		= QMF_SMALLFONT;
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+4544+44
ADDP4
CNSTU4 2
ASGNU4
line 1355
;1355:		s_serveroptions.playerTeam[n].generic.x			= 240;
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+4544+12
ADDP4
CNSTI4 240
ASGNI4
line 1356
;1356:		s_serveroptions.playerTeam[n].generic.y			= y;
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+4544+16
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1357
;1357:		s_serveroptions.playerTeam[n].itemnames			= playerTeam_list;
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+4544+88
ADDP4
ADDRGP4 playerTeam_list
ASGNP4
line 1359
;1358:
;1359:		y += ( SMALLCHAR_HEIGHT + 4 );
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 1360
;1360:	}
LABELV $1093
line 1329
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $1092
line 1362
;1361:
;1362:	s_serveroptions.back.generic.type	  = MTYPE_BITMAP;
ADDRGP4 s_serveroptions+6024
CNSTI4 6
ASGNI4
line 1363
;1363:	s_serveroptions.back.generic.name     = GAMESERVER_BACK0;
ADDRGP4 s_serveroptions+6024+4
ADDRGP4 $393
ASGNP4
line 1364
;1364:	s_serveroptions.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_serveroptions+6024+44
CNSTU4 260
ASGNU4
line 1365
;1365:	s_serveroptions.back.generic.callback = ServerOptions_Event;
ADDRGP4 s_serveroptions+6024+48
ADDRGP4 ServerOptions_Event
ASGNP4
line 1366
;1366:	s_serveroptions.back.generic.id	      = ID_BACK;
ADDRGP4 s_serveroptions+6024+8
CNSTI4 24
ASGNI4
line 1367
;1367:	s_serveroptions.back.generic.x		  = 0;
ADDRGP4 s_serveroptions+6024+12
CNSTI4 0
ASGNI4
line 1368
;1368:	s_serveroptions.back.generic.y		  = 480-64;
ADDRGP4 s_serveroptions+6024+16
CNSTI4 416
ASGNI4
line 1369
;1369:	s_serveroptions.back.width  		  = 128;
ADDRGP4 s_serveroptions+6024+80
CNSTI4 128
ASGNI4
line 1370
;1370:	s_serveroptions.back.height  		  = 64;
ADDRGP4 s_serveroptions+6024+84
CNSTI4 64
ASGNI4
line 1371
;1371:	s_serveroptions.back.focuspic         = GAMESERVER_BACK1;
ADDRGP4 s_serveroptions+6024+64
ADDRGP4 $410
ASGNP4
line 1373
;1372:
;1373:	s_serveroptions.next.generic.type	  = MTYPE_BITMAP;
ADDRGP4 s_serveroptions+5932
CNSTI4 6
ASGNI4
line 1374
;1374:	s_serveroptions.next.generic.name     = GAMESERVER_NEXT0;
ADDRGP4 s_serveroptions+5932+4
ADDRGP4 $414
ASGNP4
line 1375
;1375:	s_serveroptions.next.generic.flags    = QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_INACTIVE|QMF_GRAYED|QMF_HIDDEN;
ADDRGP4 s_serveroptions+5932+44
CNSTU4 28944
ASGNU4
line 1376
;1376:	s_serveroptions.next.generic.callback = ServerOptions_Event;
ADDRGP4 s_serveroptions+5932+48
ADDRGP4 ServerOptions_Event
ASGNP4
line 1377
;1377:	s_serveroptions.next.generic.id	      = ID_STARTSERVERNEXT;
ADDRGP4 s_serveroptions+5932+8
CNSTI4 18
ASGNI4
line 1378
;1378:	s_serveroptions.next.generic.x		  = 640;
ADDRGP4 s_serveroptions+5932+12
CNSTI4 640
ASGNI4
line 1379
;1379:	s_serveroptions.next.generic.y		  = 480-64-72;
ADDRGP4 s_serveroptions+5932+16
CNSTI4 344
ASGNI4
line 1380
;1380:	s_serveroptions.next.generic.statusbar  = ServerOptions_StatusBar;
ADDRGP4 s_serveroptions+5932+52
ADDRGP4 ServerOptions_StatusBar
ASGNP4
line 1381
;1381:	s_serveroptions.next.width  		  = 128;
ADDRGP4 s_serveroptions+5932+80
CNSTI4 128
ASGNI4
line 1382
;1382:	s_serveroptions.next.height  		  = 64;
ADDRGP4 s_serveroptions+5932+84
CNSTI4 64
ASGNI4
line 1383
;1383:	s_serveroptions.next.focuspic         = GAMESERVER_NEXT1;
ADDRGP4 s_serveroptions+5932+64
ADDRGP4 $431
ASGNP4
line 1385
;1384:
;1385:	s_serveroptions.go.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_serveroptions+5840
CNSTI4 6
ASGNI4
line 1386
;1386:	s_serveroptions.go.generic.name     = GAMESERVER_FIGHT0;
ADDRGP4 s_serveroptions+5840+4
ADDRGP4 $1197
ASGNP4
line 1387
;1387:	s_serveroptions.go.generic.flags    = QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_serveroptions+5840+44
CNSTU4 272
ASGNU4
line 1388
;1388:	s_serveroptions.go.generic.callback = ServerOptions_Event;
ADDRGP4 s_serveroptions+5840+48
ADDRGP4 ServerOptions_Event
ASGNP4
line 1389
;1389:	s_serveroptions.go.generic.id	    = ID_GO;
ADDRGP4 s_serveroptions+5840+8
CNSTI4 23
ASGNI4
line 1390
;1390:	s_serveroptions.go.generic.x		= 640;
ADDRGP4 s_serveroptions+5840+12
CNSTI4 640
ASGNI4
line 1391
;1391:	s_serveroptions.go.generic.y		= 480-64;
ADDRGP4 s_serveroptions+5840+16
CNSTI4 416
ASGNI4
line 1392
;1392:	s_serveroptions.go.width  		    = 128;
ADDRGP4 s_serveroptions+5840+80
CNSTI4 128
ASGNI4
line 1393
;1393:	s_serveroptions.go.height  		    = 64;
ADDRGP4 s_serveroptions+5840+84
CNSTI4 64
ASGNI4
line 1394
;1394:	s_serveroptions.go.focuspic         = GAMESERVER_FIGHT1;
ADDRGP4 s_serveroptions+5840+64
ADDRGP4 $1214
ASGNP4
line 1396
;1395:
;1396:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.banner );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1398
;1397:
;1398:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.mappic );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+364
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1399
;1399:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.picframe );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+456
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1401
;1400:
;1401:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.botSkill );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+2152
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1402
;1402:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.player0 );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+2260
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1403
;1403:	for( n = 0; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1220
line 1404
;1404:		if( n != 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1224
line 1405
;1405:			Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.playerType[n] );
ADDRGP4 s_serveroptions
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+2336
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1406
;1406:		}
LABELV $1224
line 1407
;1407:		Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.playerName[n] );
ADDRGP4 s_serveroptions
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 s_serveroptions+3632
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1408
;1408:		if( s_serveroptions.gametype >= GT_TDM ) {
ADDRGP4 s_serveroptions+6120
INDIRI4
CNSTI4 3
LTI4 $1228
line 1409
;1409:			Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.playerTeam[n] );
ADDRGP4 s_serveroptions
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+4544
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1410
;1410:		}
LABELV $1228
line 1411
;1411:	}
LABELV $1221
line 1403
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $1220
line 1413
;1412:
;1413:	if( s_serveroptions.gametype != GT_CTF ) {
ADDRGP4 s_serveroptions+6120
INDIRI4
CNSTI4 4
EQI4 $1232
line 1414
;1414:		Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.fraglimit );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+996
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1415
;1415:	}
ADDRGP4 $1233
JUMPV
LABELV $1232
line 1416
;1416:	else {
line 1417
;1417:		Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.flaglimit );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+1336
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1418
;1418:	}
LABELV $1233
line 1419
;1419:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.timelimit );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+656
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1420
;1420:	if( s_serveroptions.gametype >= GT_TDM ) {
ADDRGP4 s_serveroptions+6120
INDIRI4
CNSTI4 3
LTI4 $1238
line 1421
;1421:		Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.friendlyfire );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+1676
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1422
;1422:	}
LABELV $1238
line 1423
;1423:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.pure );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+2084
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1424
;1424:	if( s_serveroptions.multiplayer ) {
ADDRGP4 s_serveroptions+6116
INDIRI4
CNSTI4 0
EQI4 $1243
line 1425
;1425:		Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.dedicated );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+548
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1426
;1426:	}
LABELV $1243
line 1427
;1427:	if( s_serveroptions.multiplayer ) {
ADDRGP4 s_serveroptions+6116
INDIRI4
CNSTI4 0
EQI4 $1247
line 1428
;1428:		Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.hostname );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+1744
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1429
;1429:	}
LABELV $1247
line 1431
;1430:
;1431:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.back );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+6024
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1432
;1432:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.next );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+5932
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1433
;1433:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.go );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+5840
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1435
;1434:
;1435:	Menu_AddItem( &s_serveroptions.menu, (void*) &s_serveroptions.punkbuster );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+6372
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1437
;1436:	
;1437:	ServerOptions_SetMenuItems();
ADDRGP4 ServerOptions_SetMenuItems
CALLV
pop
line 1438
;1438:}
LABELV $887
endproc ServerOptions_MenuInit 52 12
export ServerOptions_Cache
proc ServerOptions_Cache 0 4
line 1445
;1439:
;1440:/*
;1441:=================
;1442:ServerOptions_Cache
;1443:=================
;1444:*/
;1445:void ServerOptions_Cache( void ) {
line 1446
;1446:	trap_R_RegisterShaderNoMip( GAMESERVER_BACK0 );
ADDRGP4 $393
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1447
;1447:	trap_R_RegisterShaderNoMip( GAMESERVER_BACK1 );
ADDRGP4 $410
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1448
;1448:	trap_R_RegisterShaderNoMip( GAMESERVER_FIGHT0 );
ADDRGP4 $1197
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1449
;1449:	trap_R_RegisterShaderNoMip( GAMESERVER_FIGHT1 );
ADDRGP4 $1214
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1450
;1450:	trap_R_RegisterShaderNoMip( GAMESERVER_SELECT );
ADDRGP4 $326
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1451
;1451:	trap_R_RegisterShaderNoMip( GAMESERVER_UNKNOWNMAP );
ADDRGP4 $298
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1452
;1452:}
LABELV $1255
endproc ServerOptions_Cache 0 4
proc UI_ServerOptionsMenu 0 4
line 1460
;1453:
;1454:
;1455:/*
;1456:=================
;1457:UI_ServerOptionsMenu
;1458:=================
;1459:*/
;1460:static void UI_ServerOptionsMenu( qboolean multiplayer ) {
line 1461
;1461:	ServerOptions_MenuInit( multiplayer );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 ServerOptions_MenuInit
CALLV
pop
line 1462
;1462:	UI_PushMenu( &s_serveroptions.menu );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 1463
;1463:}
LABELV $1256
endproc UI_ServerOptionsMenu 0 4
proc UI_BotSelectMenu_SortCompare 44 8
line 1524
;1464:
;1465:
;1466:
;1467:/*
;1468:=============================================================================
;1469:
;1470:BOT SELECT MENU *****
;1471:
;1472:=============================================================================
;1473:*/
;1474:
;1475:
;1476:#define BOTSELECT_BACK0			"menu/art/back_0"
;1477:#define BOTSELECT_BACK1			"menu/art/back_1"
;1478:#define BOTSELECT_ACCEPT0		"menu/art/accept_0"
;1479:#define BOTSELECT_ACCEPT1		"menu/art/accept_1"
;1480:#define BOTSELECT_SELECT		"menu/art/opponents_select"
;1481:#define BOTSELECT_SELECTED		"menu/art/opponents_selected"
;1482:#define BOTSELECT_ARROWS		"menu/art/gs_arrows_0"
;1483:#define BOTSELECT_ARROWSL		"menu/art/gs_arrows_l"
;1484:#define BOTSELECT_ARROWSR		"menu/art/gs_arrows_r"
;1485:
;1486:#define PLAYERGRID_COLS			4
;1487:#define PLAYERGRID_ROWS			4
;1488:#define MAX_MODELSPERPAGE		(PLAYERGRID_ROWS * PLAYERGRID_COLS)
;1489:
;1490:
;1491:typedef struct {
;1492:	menuframework_s	menu;
;1493:
;1494:	menutext_s		banner;
;1495:
;1496:	menubitmap_s	pics[MAX_MODELSPERPAGE];
;1497:	menubitmap_s	picbuttons[MAX_MODELSPERPAGE];
;1498:	menutext_s		picnames[MAX_MODELSPERPAGE];
;1499:
;1500:	menubitmap_s	arrows;
;1501:	menubitmap_s	left;
;1502:	menubitmap_s	right;
;1503:
;1504:	menubitmap_s	go;
;1505:	menubitmap_s	back;
;1506:
;1507:	int				numBots;
;1508:	int				modelpage;
;1509:	int				numpages;
;1510:	int				selectedmodel;
;1511:	int				sortedBotNums[MAX_BOTS];
;1512:	char			boticons[MAX_MODELSPERPAGE][MAX_QPATH];
;1513:	char			botnames[MAX_MODELSPERPAGE][16];
;1514:} botSelectInfo_t;
;1515:
;1516:static botSelectInfo_t	botSelectInfo;
;1517:
;1518:
;1519:/*
;1520:=================
;1521:UI_BotSelectMenu_SortCompare
;1522:=================
;1523:*/
;1524:static int QDECL UI_BotSelectMenu_SortCompare( const void *arg1, const void *arg2 ) {
line 1529
;1525:	int			num1, num2;
;1526:	const char	*info1, *info2;
;1527:	const char	*name1, *name2;
;1528:
;1529:	num1 = *(int *)arg1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1530
;1530:	num2 = *(int *)arg2;
ADDRLP4 4
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
line 1532
;1531:
;1532:	info1 = UI_GetBotInfoByNumber( num1 );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 UI_GetBotInfoByNumber
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 24
INDIRP4
ASGNP4
line 1533
;1533:	info2 = UI_GetBotInfoByNumber( num2 );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 UI_GetBotInfoByNumber
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 28
INDIRP4
ASGNP4
line 1535
;1534:
;1535:	name1 = Info_ValueForKey( info1, "name" );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $629
ARGP4
ADDRLP4 32
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 32
INDIRP4
ASGNP4
line 1536
;1536:	name2 = Info_ValueForKey( info2, "name" );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $629
ARGP4
ADDRLP4 36
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 36
INDIRP4
ASGNP4
line 1538
;1537:
;1538:	return Q_stricmp( name1, name2 );
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
RETI4
LABELV $1258
endproc UI_BotSelectMenu_SortCompare 44 8
proc UI_BotSelectMenu_BuildList 12 16
line 1547
;1539:}
;1540:
;1541:
;1542:/*
;1543:=================
;1544:UI_BotSelectMenu_BuildList
;1545:=================
;1546:*/
;1547:static void UI_BotSelectMenu_BuildList( void ) {
line 1550
;1548:	int		n;
;1549:
;1550:	botSelectInfo.modelpage = 0;
ADDRGP4 botSelectInfo+4988
CNSTI4 0
ASGNI4
line 1551
;1551:	botSelectInfo.numBots = UI_GetNumBots();
ADDRLP4 4
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRGP4 botSelectInfo+4984
ADDRLP4 4
INDIRI4
ASGNI4
line 1552
;1552:	botSelectInfo.numpages = botSelectInfo.numBots / MAX_MODELSPERPAGE;
ADDRGP4 botSelectInfo+4992
ADDRGP4 botSelectInfo+4984
INDIRI4
CNSTI4 16
DIVI4
ASGNI4
line 1553
;1553:	if( botSelectInfo.numBots % MAX_MODELSPERPAGE ) {
ADDRGP4 botSelectInfo+4984
INDIRI4
CNSTI4 16
MODI4
CNSTI4 0
EQI4 $1264
line 1554
;1554:		botSelectInfo.numpages++;
ADDRLP4 8
ADDRGP4 botSelectInfo+4992
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1555
;1555:	}
LABELV $1264
line 1558
;1556:
;1557:	// initialize the array
;1558:	for( n = 0; n < botSelectInfo.numBots; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1271
JUMPV
LABELV $1268
line 1559
;1559:		botSelectInfo.sortedBotNums[n] = n;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botSelectInfo+5000
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1560
;1560:	}
LABELV $1269
line 1558
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1271
ADDRLP4 0
INDIRI4
ADDRGP4 botSelectInfo+4984
INDIRI4
LTI4 $1268
line 1563
;1561:
;1562:	// now sort it
;1563:	qsort( botSelectInfo.sortedBotNums, botSelectInfo.numBots, sizeof(botSelectInfo.sortedBotNums[0]), UI_BotSelectMenu_SortCompare );
ADDRGP4 botSelectInfo+5000
ARGP4
ADDRGP4 botSelectInfo+4984
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 UI_BotSelectMenu_SortCompare
ARGP4
ADDRGP4 qsort
CALLV
pop
line 1564
;1564:}
LABELV $1259
endproc UI_BotSelectMenu_BuildList 12 16
proc ServerPlayerIcon 80 20
line 1572
;1565:
;1566:
;1567:/*
;1568:=================
;1569:ServerPlayerIcon
;1570:=================
;1571:*/
;1572:static void ServerPlayerIcon( const char *modelAndSkin, char *iconName, int iconNameMaxSize ) {
line 1576
;1573:	char	*skin;
;1574:	char	model[MAX_QPATH];
;1575:
;1576:	Q_strncpyz( model, modelAndSkin, sizeof(model));
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
line 1577
;1577:	skin = Q_strrchr( model, '/' );
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
line 1578
;1578:	if ( skin ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1278
line 1579
;1579:		*skin++ = '\0';
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
line 1580
;1580:	}
ADDRGP4 $1279
JUMPV
LABELV $1278
line 1581
;1581:	else {
line 1582
;1582:		skin = "default";
ADDRLP4 0
ADDRGP4 $1280
ASGNP4
line 1583
;1583:	}
LABELV $1279
line 1585
;1584:
;1585:	Com_sprintf(iconName, iconNameMaxSize, "models/players/%s/icon_%s.tga", model, skin );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $1281
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1587
;1586:
;1587:	if( !trap_R_RegisterShaderNoMip( iconName ) && Q_stricmp( skin, "default" ) != 0 ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $1282
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1280
ARGP4
ADDRLP4 76
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $1282
line 1588
;1588:		Com_sprintf(iconName, iconNameMaxSize, "models/players/%s/icon_default.tga", model );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $1284
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1589
;1589:	}
LABELV $1282
line 1590
;1590:}
LABELV $1277
endproc ServerPlayerIcon 80 20
proc UI_BotSelectMenu_UpdateGrid 36 12
line 1598
;1591:
;1592:
;1593:/*
;1594:=================
;1595:UI_BotSelectMenu_UpdateGrid
;1596:=================
;1597:*/
;1598:static void UI_BotSelectMenu_UpdateGrid( void ) {
line 1603
;1599:	const char	*info;
;1600:	int			i;
;1601:    int			j;
;1602:
;1603:	j = botSelectInfo.modelpage * MAX_MODELSPERPAGE;
ADDRLP4 4
ADDRGP4 botSelectInfo+4988
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
line 1604
;1604:	for( i = 0; i < (PLAYERGRID_ROWS * PLAYERGRID_COLS); i++, j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1287
line 1605
;1605:		if( j < botSelectInfo.numBots ) { 
ADDRLP4 4
INDIRI4
ADDRGP4 botSelectInfo+4984
INDIRI4
GEI4 $1291
line 1606
;1606:			info = UI_GetBotInfoByNumber( botSelectInfo.sortedBotNums[j] );
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botSelectInfo+5000
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 UI_GetBotInfoByNumber
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 1607
;1607:			ServerPlayerIcon( Info_ValueForKey( info, "model" ), botSelectInfo.boticons[i], MAX_QPATH );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $1295
ARGP4
ADDRLP4 16
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 botSelectInfo+9096
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 ServerPlayerIcon
CALLV
pop
line 1608
;1608:			Q_strncpyz( botSelectInfo.botnames[i], Info_ValueForKey( info, "name" ), 16 );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $629
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 botSelectInfo+10120
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1609
;1609:			Q_CleanStr( botSelectInfo.botnames[i] );
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 botSelectInfo+10120
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1610
;1610: 			botSelectInfo.pics[i].generic.name = botSelectInfo.boticons[i];
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+364+4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 botSelectInfo+9096
ADDP4
ASGNP4
line 1611
;1611:			if( BotAlreadySelected( botSelectInfo.botnames[i] ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 botSelectInfo+10120
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 BotAlreadySelected
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $1302
line 1612
;1612:				botSelectInfo.picnames[i].color = color_red;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 botSelectInfo+3308+72
ADDP4
ADDRGP4 color_red
ASGNP4
line 1613
;1613:			}
ADDRGP4 $1303
JUMPV
LABELV $1302
line 1614
;1614:			else {
line 1615
;1615:				botSelectInfo.picnames[i].color = color_orange;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 botSelectInfo+3308+72
ADDP4
ADDRGP4 color_orange
ASGNP4
line 1616
;1616:			}
LABELV $1303
line 1617
;1617:			botSelectInfo.picbuttons[i].generic.flags &= ~QMF_INACTIVE;
ADDRLP4 32
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+1836+44
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
line 1618
;1618:		}
ADDRGP4 $1292
JUMPV
LABELV $1291
line 1619
;1619:		else {
line 1621
;1620:			// dead slot
;1621: 			botSelectInfo.pics[i].generic.name         = NULL;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+364+4
ADDP4
CNSTP4 0
ASGNP4
line 1622
;1622:			botSelectInfo.picbuttons[i].generic.flags |= QMF_INACTIVE;
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+1836+44
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 1623
;1623:			botSelectInfo.botnames[i][0] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 botSelectInfo+10120
ADDP4
CNSTI1 0
ASGNI1
line 1624
;1624:		}
LABELV $1292
line 1626
;1625:
;1626: 		botSelectInfo.pics[i].generic.flags       &= ~QMF_HIGHLIGHT;
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+364+44
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 4294967231
BANDU4
ASGNU4
line 1627
;1627: 		botSelectInfo.pics[i].shader               = 0;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+364+72
ADDP4
CNSTI4 0
ASGNI4
line 1628
;1628: 		botSelectInfo.picbuttons[i].generic.flags |= QMF_PULSEIFFOCUS;
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+1836+44
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 256
BORU4
ASGNU4
line 1629
;1629:	}
LABELV $1288
line 1604
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $1287
line 1632
;1630:
;1631:	// set selected model
;1632:	i = botSelectInfo.selectedmodel % MAX_MODELSPERPAGE;
ADDRLP4 0
ADDRGP4 botSelectInfo+4996
INDIRI4
CNSTI4 16
MODI4
ASGNI4
line 1633
;1633:	botSelectInfo.pics[i].generic.flags |= QMF_HIGHLIGHT;
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+364+44
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 64
BORU4
ASGNU4
line 1634
;1634:	botSelectInfo.picbuttons[i].generic.flags &= ~QMF_PULSEIFFOCUS;
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+1836+44
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 4294967039
BANDU4
ASGNU4
line 1636
;1635:
;1636:	if( botSelectInfo.numpages > 1 ) {
ADDRGP4 botSelectInfo+4992
INDIRI4
CNSTI4 1
LEI4 $1327
line 1637
;1637:		if( botSelectInfo.modelpage > 0 ) {
ADDRGP4 botSelectInfo+4988
INDIRI4
CNSTI4 0
LEI4 $1330
line 1638
;1638:			botSelectInfo.left.generic.flags &= ~QMF_INACTIVE;
ADDRLP4 20
ADDRGP4 botSelectInfo+4616+44
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
line 1639
;1639:		}
ADDRGP4 $1331
JUMPV
LABELV $1330
line 1640
;1640:		else {
line 1641
;1641:			botSelectInfo.left.generic.flags |= QMF_INACTIVE;
ADDRLP4 20
ADDRGP4 botSelectInfo+4616+44
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 1642
;1642:		}
LABELV $1331
line 1644
;1643:
;1644:		if( botSelectInfo.modelpage < (botSelectInfo.numpages - 1) ) {
ADDRGP4 botSelectInfo+4988
INDIRI4
ADDRGP4 botSelectInfo+4992
INDIRI4
CNSTI4 1
SUBI4
GEI4 $1337
line 1645
;1645:			botSelectInfo.right.generic.flags &= ~QMF_INACTIVE;
ADDRLP4 20
ADDRGP4 botSelectInfo+4708+44
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
line 1646
;1646:		}
ADDRGP4 $1328
JUMPV
LABELV $1337
line 1647
;1647:		else {
line 1648
;1648:			botSelectInfo.right.generic.flags |= QMF_INACTIVE;
ADDRLP4 20
ADDRGP4 botSelectInfo+4708+44
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 1649
;1649:		}
line 1650
;1650:	}
ADDRGP4 $1328
JUMPV
LABELV $1327
line 1651
;1651:	else {
line 1653
;1652:		// hide left/right markers
;1653:		botSelectInfo.left.generic.flags |= QMF_INACTIVE;
ADDRLP4 20
ADDRGP4 botSelectInfo+4616+44
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 1654
;1654:		botSelectInfo.right.generic.flags |= QMF_INACTIVE;
ADDRLP4 24
ADDRGP4 botSelectInfo+4708+44
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 1655
;1655:	}
LABELV $1328
line 1656
;1656:}
LABELV $1285
endproc UI_BotSelectMenu_UpdateGrid 36 12
proc UI_BotSelectMenu_Default 28 8
line 1664
;1657:
;1658:
;1659:/*
;1660:=================
;1661:UI_BotSelectMenu_Default
;1662:=================
;1663:*/
;1664:static void UI_BotSelectMenu_Default( char *bot ) {
line 1670
;1665:	const char	*botInfo;
;1666:	const char	*test;
;1667:	int			n;
;1668:	int			i;
;1669:
;1670:	for( n = 0; n < botSelectInfo.numBots; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1353
JUMPV
LABELV $1350
line 1671
;1671:		botInfo = UI_GetBotInfoByNumber( n );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 UI_GetBotInfoByNumber
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 1672
;1672:		test = Info_ValueForKey( botInfo, "name" );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $629
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 20
INDIRP4
ASGNP4
line 1673
;1673:		if( Q_stricmp( bot, test ) == 0 ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $1355
line 1674
;1674:			break;
ADDRGP4 $1352
JUMPV
LABELV $1355
line 1676
;1675:		}
;1676:	}
LABELV $1351
line 1670
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1353
ADDRLP4 0
INDIRI4
ADDRGP4 botSelectInfo+4984
INDIRI4
LTI4 $1350
LABELV $1352
line 1677
;1677:	if( n == botSelectInfo.numBots ) {
ADDRLP4 0
INDIRI4
ADDRGP4 botSelectInfo+4984
INDIRI4
NEI4 $1357
line 1678
;1678:		botSelectInfo.selectedmodel = 0;
ADDRGP4 botSelectInfo+4996
CNSTI4 0
ASGNI4
line 1679
;1679:		return;
ADDRGP4 $1349
JUMPV
LABELV $1357
line 1682
;1680:	}
;1681:
;1682:	for( i = 0; i < botSelectInfo.numBots; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1364
JUMPV
LABELV $1361
line 1683
;1683:		if( botSelectInfo.sortedBotNums[i] == n ) {
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botSelectInfo+5000
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1366
line 1684
;1684:			break;
ADDRGP4 $1363
JUMPV
LABELV $1366
line 1686
;1685:		}
;1686:	}
LABELV $1362
line 1682
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1364
ADDRLP4 4
INDIRI4
ADDRGP4 botSelectInfo+4984
INDIRI4
LTI4 $1361
LABELV $1363
line 1687
;1687:	if( i == botSelectInfo.numBots ) {
ADDRLP4 4
INDIRI4
ADDRGP4 botSelectInfo+4984
INDIRI4
NEI4 $1369
line 1688
;1688:		botSelectInfo.selectedmodel = 0;
ADDRGP4 botSelectInfo+4996
CNSTI4 0
ASGNI4
line 1689
;1689:		return;
ADDRGP4 $1349
JUMPV
LABELV $1369
line 1692
;1690:	}
;1691:
;1692:	botSelectInfo.selectedmodel = i;
ADDRGP4 botSelectInfo+4996
ADDRLP4 4
INDIRI4
ASGNI4
line 1693
;1693:}
LABELV $1349
endproc UI_BotSelectMenu_Default 28 8
proc UI_BotSelectMenu_LeftEvent 4 0
line 1701
;1694:
;1695:
;1696:/*
;1697:=================
;1698:UI_BotSelectMenu_LeftEvent
;1699:=================
;1700:*/
;1701:static void UI_BotSelectMenu_LeftEvent( void* ptr, int event ) {
line 1702
;1702:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $1375
line 1703
;1703:		return;
ADDRGP4 $1374
JUMPV
LABELV $1375
line 1705
;1704:	}
;1705:	if( botSelectInfo.modelpage > 0 ) {
ADDRGP4 botSelectInfo+4988
INDIRI4
CNSTI4 0
LEI4 $1377
line 1706
;1706:		botSelectInfo.modelpage--;
ADDRLP4 0
ADDRGP4 botSelectInfo+4988
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1707
;1707:		botSelectInfo.selectedmodel = botSelectInfo.modelpage * MAX_MODELSPERPAGE;
ADDRGP4 botSelectInfo+4996
ADDRGP4 botSelectInfo+4988
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
line 1708
;1708:		UI_BotSelectMenu_UpdateGrid();
ADDRGP4 UI_BotSelectMenu_UpdateGrid
CALLV
pop
line 1709
;1709:	}
LABELV $1377
line 1710
;1710:}
LABELV $1374
endproc UI_BotSelectMenu_LeftEvent 4 0
proc UI_BotSelectMenu_RightEvent 4 0
line 1718
;1711:
;1712:
;1713:/*
;1714:=================
;1715:UI_BotSelectMenu_RightEvent
;1716:=================
;1717:*/
;1718:static void UI_BotSelectMenu_RightEvent( void* ptr, int event ) {
line 1719
;1719:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $1384
line 1720
;1720:		return;
ADDRGP4 $1383
JUMPV
LABELV $1384
line 1722
;1721:	}
;1722:	if( botSelectInfo.modelpage < botSelectInfo.numpages - 1 ) {
ADDRGP4 botSelectInfo+4988
INDIRI4
ADDRGP4 botSelectInfo+4992
INDIRI4
CNSTI4 1
SUBI4
GEI4 $1386
line 1723
;1723:		botSelectInfo.modelpage++;
ADDRLP4 0
ADDRGP4 botSelectInfo+4988
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1724
;1724:		botSelectInfo.selectedmodel = botSelectInfo.modelpage * MAX_MODELSPERPAGE;
ADDRGP4 botSelectInfo+4996
ADDRGP4 botSelectInfo+4988
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
line 1725
;1725:		UI_BotSelectMenu_UpdateGrid();
ADDRGP4 UI_BotSelectMenu_UpdateGrid
CALLV
pop
line 1726
;1726:	}
LABELV $1386
line 1727
;1727:}
LABELV $1383
endproc UI_BotSelectMenu_RightEvent 4 0
proc UI_BotSelectMenu_BotEvent 12 0
line 1735
;1728:
;1729:
;1730:/*
;1731:=================
;1732:UI_BotSelectMenu_BotEvent
;1733:=================
;1734:*/
;1735:static void UI_BotSelectMenu_BotEvent( void* ptr, int event ) {
line 1738
;1736:	int		i;
;1737:
;1738:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $1394
line 1739
;1739:		return;
ADDRGP4 $1393
JUMPV
LABELV $1394
line 1742
;1740:	}
;1741:
;1742:	for( i = 0; i < (PLAYERGRID_ROWS * PLAYERGRID_COLS); i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1396
line 1743
;1743: 		botSelectInfo.pics[i].generic.flags &= ~QMF_HIGHLIGHT;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+364+44
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 4294967231
BANDU4
ASGNU4
line 1744
;1744: 		botSelectInfo.picbuttons[i].generic.flags |= QMF_PULSEIFFOCUS;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+1836+44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 256
BORU4
ASGNU4
line 1745
;1745:	}
LABELV $1397
line 1742
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $1396
line 1748
;1746:
;1747:	// set selected
;1748:	i = ((menucommon_s*)ptr)->id;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1749
;1749:	botSelectInfo.pics[i].generic.flags |= QMF_HIGHLIGHT;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+364+44
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 64
BORU4
ASGNU4
line 1750
;1750:	botSelectInfo.picbuttons[i].generic.flags &= ~QMF_PULSEIFFOCUS;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+1836+44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 4294967039
BANDU4
ASGNU4
line 1751
;1751:	botSelectInfo.selectedmodel = botSelectInfo.modelpage * MAX_MODELSPERPAGE + i;
ADDRGP4 botSelectInfo+4996
ADDRGP4 botSelectInfo+4988
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 1752
;1752:}
LABELV $1393
endproc UI_BotSelectMenu_BotEvent 12 0
proc UI_BotSelectMenu_BackEvent 0 0
line 1760
;1753:
;1754:
;1755:/*
;1756:=================
;1757:UI_BotSelectMenu_BackEvent
;1758:=================
;1759:*/
;1760:static void UI_BotSelectMenu_BackEvent( void* ptr, int event ) {
line 1761
;1761:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $1411
line 1762
;1762:		return;
ADDRGP4 $1410
JUMPV
LABELV $1411
line 1764
;1763:	}
;1764:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 1765
;1765:}
LABELV $1410
endproc UI_BotSelectMenu_BackEvent 0 0
proc UI_BotSelectMenu_SelectEvent 0 12
line 1773
;1766:
;1767:
;1768:/*
;1769:=================
;1770:UI_BotSelectMenu_SelectEvent
;1771:=================
;1772:*/
;1773:static void UI_BotSelectMenu_SelectEvent( void* ptr, int event ) {
line 1774
;1774:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $1414
line 1775
;1775:		return;
ADDRGP4 $1413
JUMPV
LABELV $1414
line 1777
;1776:	}
;1777:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 1779
;1778:
;1779:	s_serveroptions.newBot = qtrue;
ADDRGP4 s_serveroptions+6348
CNSTI4 1
ASGNI4
line 1780
;1780:	Q_strncpyz( s_serveroptions.newBotName, botSelectInfo.botnames[botSelectInfo.selectedmodel % MAX_MODELSPERPAGE], 16 );
ADDRGP4 s_serveroptions+6356
ARGP4
ADDRGP4 botSelectInfo+4996
INDIRI4
CNSTI4 16
MODI4
CNSTI4 4
LSHI4
ADDRGP4 botSelectInfo+10120
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1781
;1781:}
LABELV $1413
endproc UI_BotSelectMenu_SelectEvent 0 12
export UI_BotSelectMenu_Cache
proc UI_BotSelectMenu_Cache 0 4
line 1789
;1782:
;1783:
;1784:/*
;1785:=================
;1786:UI_BotSelectMenu_Cache
;1787:=================
;1788:*/
;1789:void UI_BotSelectMenu_Cache( void ) {
line 1790
;1790:	trap_R_RegisterShaderNoMip( BOTSELECT_BACK0 );
ADDRGP4 $393
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1791
;1791:	trap_R_RegisterShaderNoMip( BOTSELECT_BACK1 );
ADDRGP4 $410
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1792
;1792:	trap_R_RegisterShaderNoMip( BOTSELECT_ACCEPT0 );
ADDRGP4 $1421
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1793
;1793:	trap_R_RegisterShaderNoMip( BOTSELECT_ACCEPT1 );
ADDRGP4 $1422
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1794
;1794:	trap_R_RegisterShaderNoMip( BOTSELECT_SELECT );
ADDRGP4 $1423
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1795
;1795:	trap_R_RegisterShaderNoMip( BOTSELECT_SELECTED );
ADDRGP4 $1424
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1796
;1796:	trap_R_RegisterShaderNoMip( BOTSELECT_ARROWS );
ADDRGP4 $330
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1797
;1797:	trap_R_RegisterShaderNoMip( BOTSELECT_ARROWSL );
ADDRGP4 $358
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1798
;1798:	trap_R_RegisterShaderNoMip( BOTSELECT_ARROWSR );
ADDRGP4 $376
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1799
;1799:}
LABELV $1420
endproc UI_BotSelectMenu_Cache 0 4
proc UI_BotSelectMenu_Init 32 12
line 1802
;1800:
;1801:
;1802:static void UI_BotSelectMenu_Init( char *bot ) {
line 1806
;1803:	int		i, j, k;
;1804:	int		x, y;
;1805:
;1806:	memset( &botSelectInfo, 0 ,sizeof(botSelectInfo) );
ADDRGP4 botSelectInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 10376
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1807
;1807:	botSelectInfo.menu.wrapAround = qtrue;
ADDRGP4 botSelectInfo+276
CNSTI4 1
ASGNI4
line 1808
;1808:	botSelectInfo.menu.fullscreen = qtrue;
ADDRGP4 botSelectInfo+280
CNSTI4 1
ASGNI4
line 1810
;1809:
;1810:	UI_BotSelectMenu_Cache();
ADDRGP4 UI_BotSelectMenu_Cache
CALLV
pop
line 1812
;1811:
;1812:	botSelectInfo.banner.generic.type	= MTYPE_BTEXT;
ADDRGP4 botSelectInfo+288
CNSTI4 10
ASGNI4
line 1813
;1813:	botSelectInfo.banner.generic.x		= 320;
ADDRGP4 botSelectInfo+288+12
CNSTI4 320
ASGNI4
line 1814
;1814:	botSelectInfo.banner.generic.y		= 16;
ADDRGP4 botSelectInfo+288+16
CNSTI4 16
ASGNI4
line 1815
;1815:	botSelectInfo.banner.string			= "SELECT BOT";
ADDRGP4 botSelectInfo+288+64
ADDRGP4 $1435
ASGNP4
line 1816
;1816:	botSelectInfo.banner.color			= color_white;
ADDRGP4 botSelectInfo+288+72
ADDRGP4 color_white
ASGNP4
line 1817
;1817:	botSelectInfo.banner.style			= UI_CENTER;
ADDRGP4 botSelectInfo+288+68
CNSTI4 1
ASGNI4
line 1819
;1818:
;1819:	y =	80;
ADDRLP4 8
CNSTI4 80
ASGNI4
line 1820
;1820:	for( i = 0, k = 0; i < PLAYERGRID_ROWS; i++) {
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1443
JUMPV
LABELV $1440
line 1821
;1821:		x =	180;
ADDRLP4 4
CNSTI4 180
ASGNI4
line 1822
;1822:		for( j = 0; j < PLAYERGRID_COLS; j++, k++ ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $1444
line 1823
;1823:			botSelectInfo.pics[k].generic.type				= MTYPE_BITMAP;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+364
ADDP4
CNSTI4 6
ASGNI4
line 1824
;1824:			botSelectInfo.pics[k].generic.flags				= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+364+44
ADDP4
CNSTU4 16388
ASGNU4
line 1825
;1825:			botSelectInfo.pics[k].generic.x					= x;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+364+12
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1826
;1826:			botSelectInfo.pics[k].generic.y					= y;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+364+16
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1827
;1827: 			botSelectInfo.pics[k].generic.name				= botSelectInfo.boticons[k];
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+364+4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 botSelectInfo+9096
ADDP4
ASGNP4
line 1828
;1828:			botSelectInfo.pics[k].width						= 64;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+364+80
ADDP4
CNSTI4 64
ASGNI4
line 1829
;1829:			botSelectInfo.pics[k].height					= 64;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+364+84
ADDP4
CNSTI4 64
ASGNI4
line 1830
;1830:			botSelectInfo.pics[k].focuspic					= BOTSELECT_SELECTED;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+364+64
ADDP4
ADDRGP4 $1424
ASGNP4
line 1831
;1831:			botSelectInfo.pics[k].focuscolor				= colorRed;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+364+88
ADDP4
ADDRGP4 colorRed
ASGNP4
line 1833
;1832:
;1833:			botSelectInfo.picbuttons[k].generic.type		= MTYPE_BITMAP;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+1836
ADDP4
CNSTI4 6
ASGNI4
line 1834
;1834:			botSelectInfo.picbuttons[k].generic.flags		= QMF_LEFT_JUSTIFY|QMF_NODEFAULTINIT|QMF_PULSEIFFOCUS;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+1836+44
ADDP4
CNSTU4 33028
ASGNU4
line 1835
;1835:			botSelectInfo.picbuttons[k].generic.callback	= UI_BotSelectMenu_BotEvent;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+1836+48
ADDP4
ADDRGP4 UI_BotSelectMenu_BotEvent
ASGNP4
line 1836
;1836:			botSelectInfo.picbuttons[k].generic.id			= k;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+1836+8
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1837
;1837:			botSelectInfo.picbuttons[k].generic.x			= x - 16;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+1836+12
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 16
SUBI4
ASGNI4
line 1838
;1838:			botSelectInfo.picbuttons[k].generic.y			= y - 16;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+1836+16
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 16
SUBI4
ASGNI4
line 1839
;1839:			botSelectInfo.picbuttons[k].generic.left		= x;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+1836+20
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1840
;1840:			botSelectInfo.picbuttons[k].generic.top			= y;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+1836+24
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1841
;1841:			botSelectInfo.picbuttons[k].generic.right		= x + 64;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+1836+28
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 64
ADDI4
ASGNI4
line 1842
;1842:			botSelectInfo.picbuttons[k].generic.bottom		= y + 64;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+1836+32
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 64
ADDI4
ASGNI4
line 1843
;1843:			botSelectInfo.picbuttons[k].width				= 128;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+1836+80
ADDP4
CNSTI4 128
ASGNI4
line 1844
;1844:			botSelectInfo.picbuttons[k].height				= 128;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+1836+84
ADDP4
CNSTI4 128
ASGNI4
line 1845
;1845:			botSelectInfo.picbuttons[k].focuspic			= BOTSELECT_SELECT;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+1836+64
ADDP4
ADDRGP4 $1423
ASGNP4
line 1846
;1846:			botSelectInfo.picbuttons[k].focuscolor			= colorRed;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+1836+88
ADDP4
ADDRGP4 colorRed
ASGNP4
line 1848
;1847:
;1848:			botSelectInfo.picnames[k].generic.type			= MTYPE_TEXT;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 botSelectInfo+3308
ADDP4
CNSTI4 7
ASGNI4
line 1849
;1849:			botSelectInfo.picnames[k].generic.flags			= QMF_SMALLFONT;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 botSelectInfo+3308+44
ADDP4
CNSTU4 2
ASGNU4
line 1850
;1850:			botSelectInfo.picnames[k].generic.x				= x + 32;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 botSelectInfo+3308+12
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 32
ADDI4
ASGNI4
line 1851
;1851:			botSelectInfo.picnames[k].generic.y				= y + 64;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 botSelectInfo+3308+16
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 64
ADDI4
ASGNI4
line 1852
;1852:			botSelectInfo.picnames[k].string				= botSelectInfo.botnames[k];
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 botSelectInfo+3308+64
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 botSelectInfo+10120
ADDP4
ASGNP4
line 1853
;1853:			botSelectInfo.picnames[k].color					= color_orange;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 botSelectInfo+3308+72
ADDP4
ADDRGP4 color_orange
ASGNP4
line 1854
;1854:			botSelectInfo.picnames[k].style					= UI_CENTER|UI_SMALLFONT;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 botSelectInfo+3308+68
ADDP4
CNSTI4 17
ASGNI4
line 1856
;1855:
;1856:			x += (64 + 6);
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 70
ADDI4
ASGNI4
line 1857
;1857:		}
LABELV $1445
line 1822
ADDRLP4 12
ADDRLP4 12
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
ADDRLP4 12
INDIRI4
CNSTI4 4
LTI4 $1444
line 1858
;1858:		y += (64 + SMALLCHAR_HEIGHT + 6);
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 86
ADDI4
ASGNI4
line 1859
;1859:	}
LABELV $1441
line 1820
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1443
ADDRLP4 16
INDIRI4
CNSTI4 4
LTI4 $1440
line 1861
;1860:
;1861:	botSelectInfo.arrows.generic.type		= MTYPE_BITMAP;
ADDRGP4 botSelectInfo+4524
CNSTI4 6
ASGNI4
line 1862
;1862:	botSelectInfo.arrows.generic.name		= BOTSELECT_ARROWS;
ADDRGP4 botSelectInfo+4524+4
ADDRGP4 $330
ASGNP4
line 1863
;1863:	botSelectInfo.arrows.generic.flags		= QMF_INACTIVE;
ADDRGP4 botSelectInfo+4524+44
CNSTU4 16384
ASGNU4
line 1864
;1864:	botSelectInfo.arrows.generic.x			= 260;
ADDRGP4 botSelectInfo+4524+12
CNSTI4 260
ASGNI4
line 1865
;1865:	botSelectInfo.arrows.generic.y			= 440;
ADDRGP4 botSelectInfo+4524+16
CNSTI4 440
ASGNI4
line 1866
;1866:	botSelectInfo.arrows.width				= 128;
ADDRGP4 botSelectInfo+4524+80
CNSTI4 128
ASGNI4
line 1867
;1867:	botSelectInfo.arrows.height				= 32;
ADDRGP4 botSelectInfo+4524+84
CNSTI4 32
ASGNI4
line 1869
;1868:
;1869:	botSelectInfo.left.generic.type			= MTYPE_BITMAP;
ADDRGP4 botSelectInfo+4616
CNSTI4 6
ASGNI4
line 1870
;1870:	botSelectInfo.left.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 botSelectInfo+4616+44
CNSTU4 260
ASGNU4
line 1871
;1871:	botSelectInfo.left.generic.callback		= UI_BotSelectMenu_LeftEvent;
ADDRGP4 botSelectInfo+4616+48
ADDRGP4 UI_BotSelectMenu_LeftEvent
ASGNP4
line 1872
;1872:	botSelectInfo.left.generic.x			= 260;
ADDRGP4 botSelectInfo+4616+12
CNSTI4 260
ASGNI4
line 1873
;1873:	botSelectInfo.left.generic.y			= 440;
ADDRGP4 botSelectInfo+4616+16
CNSTI4 440
ASGNI4
line 1874
;1874:	botSelectInfo.left.width  				= 64;
ADDRGP4 botSelectInfo+4616+80
CNSTI4 64
ASGNI4
line 1875
;1875:	botSelectInfo.left.height  				= 32;
ADDRGP4 botSelectInfo+4616+84
CNSTI4 32
ASGNI4
line 1876
;1876:	botSelectInfo.left.focuspic				= BOTSELECT_ARROWSL;
ADDRGP4 botSelectInfo+4616+64
ADDRGP4 $358
ASGNP4
line 1878
;1877:
;1878:	botSelectInfo.right.generic.type	    = MTYPE_BITMAP;
ADDRGP4 botSelectInfo+4708
CNSTI4 6
ASGNI4
line 1879
;1879:	botSelectInfo.right.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 botSelectInfo+4708+44
CNSTU4 260
ASGNU4
line 1880
;1880:	botSelectInfo.right.generic.callback	= UI_BotSelectMenu_RightEvent;
ADDRGP4 botSelectInfo+4708+48
ADDRGP4 UI_BotSelectMenu_RightEvent
ASGNP4
line 1881
;1881:	botSelectInfo.right.generic.x			= 321;
ADDRGP4 botSelectInfo+4708+12
CNSTI4 321
ASGNI4
line 1882
;1882:	botSelectInfo.right.generic.y			= 440;
ADDRGP4 botSelectInfo+4708+16
CNSTI4 440
ASGNI4
line 1883
;1883:	botSelectInfo.right.width  				= 64;
ADDRGP4 botSelectInfo+4708+80
CNSTI4 64
ASGNI4
line 1884
;1884:	botSelectInfo.right.height  		    = 32;
ADDRGP4 botSelectInfo+4708+84
CNSTI4 32
ASGNI4
line 1885
;1885:	botSelectInfo.right.focuspic			= BOTSELECT_ARROWSR;
ADDRGP4 botSelectInfo+4708+64
ADDRGP4 $376
ASGNP4
line 1887
;1886:
;1887:	botSelectInfo.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 botSelectInfo+4892
CNSTI4 6
ASGNI4
line 1888
;1888:	botSelectInfo.back.generic.name		= BOTSELECT_BACK0;
ADDRGP4 botSelectInfo+4892+4
ADDRGP4 $393
ASGNP4
line 1889
;1889:	botSelectInfo.back.generic.flags	= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 botSelectInfo+4892+44
CNSTU4 260
ASGNU4
line 1890
;1890:	botSelectInfo.back.generic.callback	= UI_BotSelectMenu_BackEvent;
ADDRGP4 botSelectInfo+4892+48
ADDRGP4 UI_BotSelectMenu_BackEvent
ASGNP4
line 1891
;1891:	botSelectInfo.back.generic.x		= 0;
ADDRGP4 botSelectInfo+4892+12
CNSTI4 0
ASGNI4
line 1892
;1892:	botSelectInfo.back.generic.y		= 480-64;
ADDRGP4 botSelectInfo+4892+16
CNSTI4 416
ASGNI4
line 1893
;1893:	botSelectInfo.back.width			= 128;
ADDRGP4 botSelectInfo+4892+80
CNSTI4 128
ASGNI4
line 1894
;1894:	botSelectInfo.back.height			= 64;
ADDRGP4 botSelectInfo+4892+84
CNSTI4 64
ASGNI4
line 1895
;1895:	botSelectInfo.back.focuspic			= BOTSELECT_BACK1;
ADDRGP4 botSelectInfo+4892+64
ADDRGP4 $410
ASGNP4
line 1897
;1896:
;1897:	botSelectInfo.go.generic.type		= MTYPE_BITMAP;
ADDRGP4 botSelectInfo+4800
CNSTI4 6
ASGNI4
line 1898
;1898:	botSelectInfo.go.generic.name		= BOTSELECT_ACCEPT0;
ADDRGP4 botSelectInfo+4800+4
ADDRGP4 $1421
ASGNP4
line 1899
;1899:	botSelectInfo.go.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 botSelectInfo+4800+44
CNSTU4 272
ASGNU4
line 1900
;1900:	botSelectInfo.go.generic.callback	= UI_BotSelectMenu_SelectEvent;
ADDRGP4 botSelectInfo+4800+48
ADDRGP4 UI_BotSelectMenu_SelectEvent
ASGNP4
line 1901
;1901:	botSelectInfo.go.generic.x			= 640;
ADDRGP4 botSelectInfo+4800+12
CNSTI4 640
ASGNI4
line 1902
;1902:	botSelectInfo.go.generic.y			= 480-64;
ADDRGP4 botSelectInfo+4800+16
CNSTI4 416
ASGNI4
line 1903
;1903:	botSelectInfo.go.width				= 128;
ADDRGP4 botSelectInfo+4800+80
CNSTI4 128
ASGNI4
line 1904
;1904:	botSelectInfo.go.height				= 64;
ADDRGP4 botSelectInfo+4800+84
CNSTI4 64
ASGNI4
line 1905
;1905:	botSelectInfo.go.focuspic			= BOTSELECT_ACCEPT1;
ADDRGP4 botSelectInfo+4800+64
ADDRGP4 $1422
ASGNP4
line 1907
;1906:
;1907:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.banner );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1908
;1908:	for( i = 0; i < MAX_MODELSPERPAGE; i++ ) {
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $1585
line 1909
;1909:		Menu_AddItem( &botSelectInfo.menu,	&botSelectInfo.pics[i] );
ADDRGP4 botSelectInfo
ARGP4
ADDRLP4 16
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+364
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1910
;1910:		Menu_AddItem( &botSelectInfo.menu,	&botSelectInfo.picbuttons[i] );
ADDRGP4 botSelectInfo
ARGP4
ADDRLP4 16
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+1836
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1911
;1911:		Menu_AddItem( &botSelectInfo.menu,	&botSelectInfo.picnames[i] );
ADDRGP4 botSelectInfo
ARGP4
ADDRLP4 16
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 botSelectInfo+3308
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1912
;1912:	}
LABELV $1586
line 1908
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 16
LTI4 $1585
line 1913
;1913:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.arrows );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+4524
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1914
;1914:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.left );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+4616
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1915
;1915:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.right );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+4708
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1916
;1916:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.back );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+4892
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1917
;1917:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.go );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+4800
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1919
;1918:
;1919:	UI_BotSelectMenu_BuildList();
ADDRGP4 UI_BotSelectMenu_BuildList
CALLV
pop
line 1920
;1920:	UI_BotSelectMenu_Default( bot );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 UI_BotSelectMenu_Default
CALLV
pop
line 1921
;1921:	botSelectInfo.modelpage = botSelectInfo.selectedmodel / MAX_MODELSPERPAGE;
ADDRGP4 botSelectInfo+4988
ADDRGP4 botSelectInfo+4996
INDIRI4
CNSTI4 16
DIVI4
ASGNI4
line 1922
;1922:	UI_BotSelectMenu_UpdateGrid();
ADDRGP4 UI_BotSelectMenu_UpdateGrid
CALLV
pop
line 1923
;1923:}
LABELV $1425
endproc UI_BotSelectMenu_Init 32 12
export UI_BotSelectMenu
proc UI_BotSelectMenu 0 4
line 1931
;1924:
;1925:
;1926:/*
;1927:=================
;1928:UI_BotSelectMenu
;1929:=================
;1930:*/
;1931:void UI_BotSelectMenu( char *bot ) {
line 1932
;1932:	UI_BotSelectMenu_Init( bot );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 UI_BotSelectMenu_Init
CALLV
pop
line 1933
;1933:	UI_PushMenu( &botSelectInfo.menu );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 1934
;1934:}
LABELV $1599
endproc UI_BotSelectMenu 0 4
bss
align 4
LABELV botSelectInfo
skip 10376
align 4
LABELV s_serveroptions
skip 6480
import punkbuster_items
align 4
LABELV s_startserver
skip 6136
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
LABELV $1435
byte 1 83
byte 1 69
byte 1 76
byte 1 69
byte 1 67
byte 1 84
byte 1 32
byte 1 66
byte 1 79
byte 1 84
byte 1 0
align 1
LABELV $1424
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1423
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $1422
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
LABELV $1421
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
LABELV $1295
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $1284
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
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1281
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
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1280
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $1214
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
LABELV $1197
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
LABELV $1070
byte 1 66
byte 1 111
byte 1 116
byte 1 32
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 58
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $1054
byte 1 80
byte 1 117
byte 1 110
byte 1 107
byte 1 98
byte 1 117
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 58
byte 1 0
align 1
LABELV $1038
byte 1 72
byte 1 111
byte 1 115
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $1029
byte 1 68
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 58
byte 1 0
align 1
LABELV $1012
byte 1 80
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 58
byte 1 0
align 1
LABELV $1002
byte 1 70
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 32
byte 1 70
byte 1 105
byte 1 114
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $975
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 76
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $957
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 76
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $939
byte 1 70
byte 1 114
byte 1 97
byte 1 103
byte 1 32
byte 1 76
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $828
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $802
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 0
align 1
LABELV $779
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $759
byte 1 115
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $747
byte 1 118
byte 1 105
byte 1 115
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $741
byte 1 109
byte 1 97
byte 1 106
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $738
byte 1 103
byte 1 114
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $721
byte 1 48
byte 1 32
byte 1 61
byte 1 32
byte 1 78
byte 1 79
byte 1 32
byte 1 76
byte 1 73
byte 1 77
byte 1 73
byte 1 84
byte 1 0
align 1
LABELV $661
byte 1 72
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $629
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $598
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $593
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
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $589
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
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $571
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 32
byte 1 51
byte 1 10
byte 1 0
align 1
LABELV $570
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 32
byte 1 59
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 32
byte 1 59
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $565
byte 1 115
byte 1 118
byte 1 95
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
LABELV $561
byte 1 115
byte 1 118
byte 1 95
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
LABELV $560
byte 1 115
byte 1 118
byte 1 95
byte 1 112
byte 1 117
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $559
byte 1 103
byte 1 95
byte 1 102
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $558
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
LABELV $557
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
LABELV $556
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
LABELV $555
byte 1 100
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $554
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
LABELV $551
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 116
byte 1 102
byte 1 95
byte 1 102
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 0
align 1
LABELV $550
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 116
byte 1 102
byte 1 95
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
LABELV $549
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 116
byte 1 102
byte 1 95
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
LABELV $547
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 102
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 0
align 1
LABELV $546
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
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
LABELV $545
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
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
LABELV $543
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 121
byte 1 95
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
LABELV $542
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 121
byte 1 95
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
LABELV $540
byte 1 117
byte 1 105
byte 1 95
byte 1 102
byte 1 102
byte 1 97
byte 1 95
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
LABELV $539
byte 1 117
byte 1 105
byte 1 95
byte 1 102
byte 1 102
byte 1 97
byte 1 95
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
LABELV $483
byte 1 78
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 109
byte 1 97
byte 1 114
byte 1 101
byte 1 33
byte 1 0
align 1
LABELV $482
byte 1 72
byte 1 97
byte 1 114
byte 1 100
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $481
byte 1 72
byte 1 117
byte 1 114
byte 1 116
byte 1 32
byte 1 77
byte 1 101
byte 1 32
byte 1 80
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $480
byte 1 66
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 73
byte 1 116
byte 1 32
byte 1 79
byte 1 110
byte 1 0
align 1
LABELV $479
byte 1 73
byte 1 32
byte 1 67
byte 1 97
byte 1 110
byte 1 32
byte 1 87
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $478
byte 1 82
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $477
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $476
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 0
align 1
LABELV $475
byte 1 66
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $474
byte 1 79
byte 1 112
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $473
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
LABELV $472
byte 1 76
byte 1 65
byte 1 78
byte 1 0
align 1
LABELV $471
byte 1 78
byte 1 111
byte 1 0
align 1
LABELV $461
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 0
align 1
LABELV $431
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $414
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $410
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
LABELV $393
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
LABELV $376
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 103
byte 1 115
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 114
byte 1 0
align 1
LABELV $358
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 103
byte 1 115
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 108
byte 1 0
align 1
LABELV $330
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 103
byte 1 115
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $326
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $298
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
LABELV $295
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $263
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
LABELV $249
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
LABELV $235
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
align 1
LABELV $227
byte 1 71
byte 1 65
byte 1 77
byte 1 69
byte 1 32
byte 1 83
byte 1 69
byte 1 82
byte 1 86
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $194
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $166
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $131
byte 1 78
byte 1 79
byte 1 32
byte 1 77
byte 1 65
byte 1 80
byte 1 83
byte 1 32
byte 1 70
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $99
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
byte 1 0
align 1
LABELV $98
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $73
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
LABELV $72
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
LABELV $71
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
LABELV $70
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
