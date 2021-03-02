code
proc LoadConfig_MenuEvent 12 8
file "..\..\..\..\code\q3_ui\ui_loadconfig.c"
line 64
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=============================================================================
;5:
;6:LOAD CONFIG MENU
;7:
;8:=============================================================================
;9:*/
;10:
;11:#include "ui_local.h"
;12:
;13:
;14:#define ART_BACK0			"menu/art/back_0"
;15:#define ART_BACK1			"menu/art/back_1"	
;16:#define ART_FIGHT0			"menu/art/load_0"
;17:#define ART_FIGHT1			"menu/art/load_1"
;18:#define ART_FRAMEL			"menu/art/frame2_l"
;19:#define ART_FRAMER			"menu/art/frame1_r"
;20:#define ART_ARROWS			"menu/art/arrows_horz_0"
;21:#define ART_ARROWLEFT		"menu/art/arrows_horz_left"
;22:#define ART_ARROWRIGHT		"menu/art/arrows_horz_right"
;23:
;24:#define MAX_CONFIGS			128
;25:#define NAMEBUFSIZE			( MAX_CONFIGS * 16 )
;26:
;27:#define ID_BACK				10
;28:#define ID_GO				11
;29:#define ID_LIST				12
;30:#define ID_LEFT				13
;31:#define ID_RIGHT			14
;32:
;33:#define ARROWS_WIDTH		128
;34:#define ARROWS_HEIGHT		48
;35:
;36:
;37:typedef struct {
;38:	menuframework_s	menu;
;39:
;40:	menutext_s		banner;
;41:	menubitmap_s	framel;
;42:	menubitmap_s	framer;
;43:
;44:	menulist_s		list;
;45:
;46:	menubitmap_s	arrows;
;47:	menubitmap_s	left;
;48:	menubitmap_s	right;
;49:	menubitmap_s	back;
;50:	menubitmap_s	go;
;51:
;52:	char			names[NAMEBUFSIZE];
;53:	char*			configlist[MAX_CONFIGS];
;54:} configs_t;
;55:
;56:static configs_t	s_configs;
;57:
;58:
;59:/*
;60:===============
;61:LoadConfig_MenuEvent
;62:===============
;63:*/
;64:static void LoadConfig_MenuEvent( void *ptr, int event ) {
line 65
;65:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $71
line 66
;66:		return;
ADDRGP4 $70
JUMPV
LABELV $71
line 69
;67:	}
;68:
;69:	switch ( ((menucommon_s*)ptr)->id ) {
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
LTI4 $73
ADDRLP4 0
INDIRI4
CNSTI4 14
GTI4 $73
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $87-40
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $87
address $82
address $76
address $73
address $83
address $85
code
LABELV $76
line 71
;70:	case ID_GO:
;71:		trap_Cmd_ExecuteText( EXEC_APPEND, va( "exec %s\n", s_configs.list.itemnames[s_configs.list.curvalue] ) );
ADDRGP4 $77
ARGP4
ADDRGP4 s_configs+548+68
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_configs+548+88
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 72
;72:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 73
;73:		break;
ADDRGP4 $74
JUMPV
LABELV $82
line 76
;74:
;75:	case ID_BACK:
;76:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 77
;77:		break;
ADDRGP4 $74
JUMPV
LABELV $83
line 80
;78:
;79:	case ID_LEFT:
;80:		ScrollList_Key( &s_configs.list, K_LEFTARROW );
ADDRGP4 s_configs+548
ARGP4
CNSTI4 134
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 81
;81:		break;
ADDRGP4 $74
JUMPV
LABELV $85
line 84
;82:
;83:	case ID_RIGHT:
;84:		ScrollList_Key( &s_configs.list, K_RIGHTARROW );
ADDRGP4 s_configs+548
ARGP4
CNSTI4 135
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 85
;85:		break;
LABELV $73
LABELV $74
line 87
;86:	}
;87:}
LABELV $70
endproc LoadConfig_MenuEvent 12 8
proc LoadConfig_MenuInit 24 16
line 95
;88:
;89:
;90:/*
;91:===============
;92:LoadConfig_MenuInit
;93:===============
;94:*/
;95:static void LoadConfig_MenuInit( void ) {
line 100
;96:	int		i;
;97:	int		len;
;98:	char	*configname;
;99:
;100:	UI_LoadConfig_Cache();
ADDRGP4 UI_LoadConfig_Cache
CALLV
pop
line 102
;101:
;102:	memset( &s_configs, 0 ,sizeof(configs_t) );
ADDRGP4 s_configs
ARGP4
CNSTI4 0
ARGI4
CNSTI4 3676
ARGI4
ADDRGP4 memset
CALLP4
pop
line 103
;103:	s_configs.menu.wrapAround = qtrue;
ADDRGP4 s_configs+276
CNSTI4 1
ASGNI4
line 104
;104:	s_configs.menu.fullscreen = qtrue;
ADDRGP4 s_configs+280
CNSTI4 1
ASGNI4
line 106
;105:
;106:	s_configs.banner.generic.type	= MTYPE_BTEXT;
ADDRGP4 s_configs+288
CNSTI4 10
ASGNI4
line 107
;107:	s_configs.banner.generic.x		= 320;
ADDRGP4 s_configs+288+12
CNSTI4 320
ASGNI4
line 108
;108:	s_configs.banner.generic.y		= 16;
ADDRGP4 s_configs+288+16
CNSTI4 16
ASGNI4
line 109
;109:	s_configs.banner.string			= "LOAD CONFIG";
ADDRGP4 s_configs+288+64
ADDRGP4 $99
ASGNP4
line 110
;110:	s_configs.banner.color			= color_white;
ADDRGP4 s_configs+288+72
ADDRGP4 color_white
ASGNP4
line 111
;111:	s_configs.banner.style			= UI_CENTER;
ADDRGP4 s_configs+288+68
CNSTI4 1
ASGNI4
line 113
;112:
;113:	s_configs.framel.generic.type	= MTYPE_BITMAP;
ADDRGP4 s_configs+364
CNSTI4 6
ASGNI4
line 114
;114:	s_configs.framel.generic.name	= ART_FRAMEL;
ADDRGP4 s_configs+364+4
ADDRGP4 $107
ASGNP4
line 115
;115:	s_configs.framel.generic.flags	= QMF_INACTIVE;
ADDRGP4 s_configs+364+44
CNSTU4 16384
ASGNU4
line 116
;116:	s_configs.framel.generic.x		= 0;  
ADDRGP4 s_configs+364+12
CNSTI4 0
ASGNI4
line 117
;117:	s_configs.framel.generic.y		= 78;
ADDRGP4 s_configs+364+16
CNSTI4 78
ASGNI4
line 118
;118:	s_configs.framel.width			= 256;
ADDRGP4 s_configs+364+80
CNSTI4 256
ASGNI4
line 119
;119:	s_configs.framel.height			= 329;
ADDRGP4 s_configs+364+84
CNSTI4 329
ASGNI4
line 121
;120:
;121:	s_configs.framer.generic.type	= MTYPE_BITMAP;
ADDRGP4 s_configs+456
CNSTI4 6
ASGNI4
line 122
;122:	s_configs.framer.generic.name	= ART_FRAMER;
ADDRGP4 s_configs+456+4
ADDRGP4 $121
ASGNP4
line 123
;123:	s_configs.framer.generic.flags	= QMF_INACTIVE;
ADDRGP4 s_configs+456+44
CNSTU4 16384
ASGNU4
line 124
;124:	s_configs.framer.generic.x		= 376;
ADDRGP4 s_configs+456+12
CNSTI4 376
ASGNI4
line 125
;125:	s_configs.framer.generic.y		= 76;
ADDRGP4 s_configs+456+16
CNSTI4 76
ASGNI4
line 126
;126:	s_configs.framer.width			= 256;
ADDRGP4 s_configs+456+80
CNSTI4 256
ASGNI4
line 127
;127:	s_configs.framer.height			= 334;
ADDRGP4 s_configs+456+84
CNSTI4 334
ASGNI4
line 129
;128:
;129:	s_configs.arrows.generic.type	= MTYPE_BITMAP;
ADDRGP4 s_configs+656
CNSTI4 6
ASGNI4
line 130
;130:	s_configs.arrows.generic.name	= ART_ARROWS;
ADDRGP4 s_configs+656+4
ADDRGP4 $135
ASGNP4
line 131
;131:	s_configs.arrows.generic.flags	= QMF_INACTIVE;
ADDRGP4 s_configs+656+44
CNSTU4 16384
ASGNU4
line 132
;132:	s_configs.arrows.generic.x		= 320-ARROWS_WIDTH/2;
ADDRGP4 s_configs+656+12
CNSTI4 256
ASGNI4
line 133
;133:	s_configs.arrows.generic.y		= 400;
ADDRGP4 s_configs+656+16
CNSTI4 400
ASGNI4
line 134
;134:	s_configs.arrows.width			= ARROWS_WIDTH;
ADDRGP4 s_configs+656+80
CNSTI4 128
ASGNI4
line 135
;135:	s_configs.arrows.height			= ARROWS_HEIGHT;
ADDRGP4 s_configs+656+84
CNSTI4 48
ASGNI4
line 137
;136:
;137:	s_configs.left.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_configs+748
CNSTI4 6
ASGNI4
line 138
;138:	s_configs.left.generic.flags	= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_MOUSEONLY;
ADDRGP4 s_configs+748+44
CNSTU4 2308
ASGNU4
line 139
;139:	s_configs.left.generic.x		= 320-ARROWS_WIDTH/2;
ADDRGP4 s_configs+748+12
CNSTI4 256
ASGNI4
line 140
;140:	s_configs.left.generic.y		= 400;
ADDRGP4 s_configs+748+16
CNSTI4 400
ASGNI4
line 141
;141:	s_configs.left.generic.id		= ID_LEFT;
ADDRGP4 s_configs+748+8
CNSTI4 13
ASGNI4
line 142
;142:	s_configs.left.generic.callback	= LoadConfig_MenuEvent;
ADDRGP4 s_configs+748+48
ADDRGP4 LoadConfig_MenuEvent
ASGNP4
line 143
;143:	s_configs.left.width			= ARROWS_WIDTH/2;
ADDRGP4 s_configs+748+80
CNSTI4 64
ASGNI4
line 144
;144:	s_configs.left.height			= ARROWS_HEIGHT;
ADDRGP4 s_configs+748+84
CNSTI4 48
ASGNI4
line 145
;145:	s_configs.left.focuspic			= ART_ARROWLEFT;
ADDRGP4 s_configs+748+64
ADDRGP4 $163
ASGNP4
line 147
;146:
;147:	s_configs.right.generic.type	= MTYPE_BITMAP;
ADDRGP4 s_configs+840
CNSTI4 6
ASGNI4
line 148
;148:	s_configs.right.generic.flags	= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_MOUSEONLY;
ADDRGP4 s_configs+840+44
CNSTU4 2308
ASGNU4
line 149
;149:	s_configs.right.generic.x		= 320;
ADDRGP4 s_configs+840+12
CNSTI4 320
ASGNI4
line 150
;150:	s_configs.right.generic.y		= 400;
ADDRGP4 s_configs+840+16
CNSTI4 400
ASGNI4
line 151
;151:	s_configs.right.generic.id		= ID_RIGHT;
ADDRGP4 s_configs+840+8
CNSTI4 14
ASGNI4
line 152
;152:	s_configs.right.generic.callback = LoadConfig_MenuEvent;
ADDRGP4 s_configs+840+48
ADDRGP4 LoadConfig_MenuEvent
ASGNP4
line 153
;153:	s_configs.right.width			= ARROWS_WIDTH/2;
ADDRGP4 s_configs+840+80
CNSTI4 64
ASGNI4
line 154
;154:	s_configs.right.height			= ARROWS_HEIGHT;
ADDRGP4 s_configs+840+84
CNSTI4 48
ASGNI4
line 155
;155:	s_configs.right.focuspic		= ART_ARROWRIGHT;
ADDRGP4 s_configs+840+64
ADDRGP4 $181
ASGNP4
line 157
;156:
;157:	s_configs.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_configs+932
CNSTI4 6
ASGNI4
line 158
;158:	s_configs.back.generic.name		= ART_BACK0;
ADDRGP4 s_configs+932+4
ADDRGP4 $185
ASGNP4
line 159
;159:	s_configs.back.generic.flags	= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_configs+932+44
CNSTU4 260
ASGNU4
line 160
;160:	s_configs.back.generic.id		= ID_BACK;
ADDRGP4 s_configs+932+8
CNSTI4 10
ASGNI4
line 161
;161:	s_configs.back.generic.callback	= LoadConfig_MenuEvent;
ADDRGP4 s_configs+932+48
ADDRGP4 LoadConfig_MenuEvent
ASGNP4
line 162
;162:	s_configs.back.generic.x		= 0;
ADDRGP4 s_configs+932+12
CNSTI4 0
ASGNI4
line 163
;163:	s_configs.back.generic.y		= 480-64;
ADDRGP4 s_configs+932+16
CNSTI4 416
ASGNI4
line 164
;164:	s_configs.back.width			= 128;
ADDRGP4 s_configs+932+80
CNSTI4 128
ASGNI4
line 165
;165:	s_configs.back.height			= 64;
ADDRGP4 s_configs+932+84
CNSTI4 64
ASGNI4
line 166
;166:	s_configs.back.focuspic			= ART_BACK1;
ADDRGP4 s_configs+932+64
ADDRGP4 $202
ASGNP4
line 168
;167:
;168:	s_configs.go.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_configs+1024
CNSTI4 6
ASGNI4
line 169
;169:	s_configs.go.generic.name		= ART_FIGHT0;
ADDRGP4 s_configs+1024+4
ADDRGP4 $206
ASGNP4
line 170
;170:	s_configs.go.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_configs+1024+44
CNSTU4 272
ASGNU4
line 171
;171:	s_configs.go.generic.id			= ID_GO;
ADDRGP4 s_configs+1024+8
CNSTI4 11
ASGNI4
line 172
;172:	s_configs.go.generic.callback	= LoadConfig_MenuEvent;
ADDRGP4 s_configs+1024+48
ADDRGP4 LoadConfig_MenuEvent
ASGNP4
line 173
;173:	s_configs.go.generic.x			= 640;
ADDRGP4 s_configs+1024+12
CNSTI4 640
ASGNI4
line 174
;174:	s_configs.go.generic.y			= 480-64;
ADDRGP4 s_configs+1024+16
CNSTI4 416
ASGNI4
line 175
;175:	s_configs.go.width				= 128;
ADDRGP4 s_configs+1024+80
CNSTI4 128
ASGNI4
line 176
;176:	s_configs.go.height				= 64;
ADDRGP4 s_configs+1024+84
CNSTI4 64
ASGNI4
line 177
;177:	s_configs.go.focuspic			= ART_FIGHT1;
ADDRGP4 s_configs+1024+64
ADDRGP4 $223
ASGNP4
line 180
;178:
;179:	// scan for configs
;180:	s_configs.list.generic.type		= MTYPE_SCROLLLIST;
ADDRGP4 s_configs+548
CNSTI4 8
ASGNI4
line 181
;181:	s_configs.list.generic.flags	= QMF_PULSEIFFOCUS;
ADDRGP4 s_configs+548+44
CNSTU4 256
ASGNU4
line 182
;182:	s_configs.list.generic.callback	= LoadConfig_MenuEvent;
ADDRGP4 s_configs+548+48
ADDRGP4 LoadConfig_MenuEvent
ASGNP4
line 183
;183:	s_configs.list.generic.id		= ID_LIST;
ADDRGP4 s_configs+548+8
CNSTI4 12
ASGNI4
line 184
;184:	s_configs.list.generic.x		= 118;
ADDRGP4 s_configs+548+12
CNSTI4 118
ASGNI4
line 185
;185:	s_configs.list.generic.y		= 130;
ADDRGP4 s_configs+548+16
CNSTI4 130
ASGNI4
line 186
;186:	s_configs.list.width			= 16;
ADDRGP4 s_configs+548+92
CNSTI4 16
ASGNI4
line 187
;187:	s_configs.list.height			= 14;
ADDRGP4 s_configs+548+96
CNSTI4 14
ASGNI4
line 188
;188:	s_configs.list.numitems			= trap_FS_GetFileList( "", "cfg", s_configs.names, NAMEBUFSIZE );
ADDRGP4 $241
ARGP4
ADDRGP4 $242
ARGP4
ADDRGP4 s_configs+1116
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 12
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRGP4 s_configs+548+72
ADDRLP4 12
INDIRI4
ASGNI4
line 189
;189:	s_configs.list.itemnames		= (const char **)s_configs.configlist;
ADDRGP4 s_configs+548+88
ADDRGP4 s_configs+3164
ASGNP4
line 190
;190:	s_configs.list.columns			= 3;
ADDRGP4 s_configs+548+100
CNSTI4 3
ASGNI4
line 192
;191:
;192:	if (!s_configs.list.numitems) {
ADDRGP4 s_configs+548+72
INDIRI4
CNSTI4 0
NEI4 $249
line 193
;193:		strcpy(s_configs.names,"No Files Found.");
ADDRGP4 s_configs+1116
ARGP4
ADDRGP4 $254
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 194
;194:		s_configs.list.numitems = 1;
ADDRGP4 s_configs+548+72
CNSTI4 1
ASGNI4
line 197
;195:
;196:		//degenerate case, not selectable
;197:		s_configs.go.generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 16
ADDRGP4 s_configs+1024+44
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 198
;198:	}
ADDRGP4 $250
JUMPV
LABELV $249
line 199
;199:	else if (s_configs.list.numitems > MAX_CONFIGS)
ADDRGP4 s_configs+548+72
INDIRI4
CNSTI4 128
LEI4 $259
line 200
;200:		s_configs.list.numitems = MAX_CONFIGS;
ADDRGP4 s_configs+548+72
CNSTI4 128
ASGNI4
LABELV $259
LABELV $250
line 202
;201:	
;202:	configname = s_configs.names;
ADDRLP4 0
ADDRGP4 s_configs+1116
ASGNP4
line 203
;203:	for ( i = 0; i < s_configs.list.numitems; i++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $269
JUMPV
LABELV $266
line 204
;204:		s_configs.list.itemnames[i] = configname;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_configs+548+88
INDIRP4
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 207
;205:		
;206:		// strip extension
;207:		len = strlen( configname );
ADDRLP4 0
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
line 208
;208:		if (!Q_stricmp(configname +  len - 4,".cfg"))
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
CNSTI4 -4
ADDP4
ARGP4
ADDRGP4 $276
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $274
line 209
;209:			configname[len-4] = '\0';
ADDRLP4 4
INDIRI4
CNSTI4 4
SUBI4
ADDRLP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
LABELV $274
line 211
;210:
;211:		Q_strupr(configname);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 213
;212:
;213:		configname += len + 1;
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 214
;214:	}
LABELV $267
line 203
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $269
ADDRLP4 8
INDIRI4
ADDRGP4 s_configs+548+72
INDIRI4
LTI4 $266
line 216
;215:
;216:	Menu_AddItem( &s_configs.menu, &s_configs.banner );
ADDRGP4 s_configs
ARGP4
ADDRGP4 s_configs+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 217
;217:	Menu_AddItem( &s_configs.menu, &s_configs.framel );
ADDRGP4 s_configs
ARGP4
ADDRGP4 s_configs+364
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 218
;218:	Menu_AddItem( &s_configs.menu, &s_configs.framer );
ADDRGP4 s_configs
ARGP4
ADDRGP4 s_configs+456
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 219
;219:	Menu_AddItem( &s_configs.menu, &s_configs.list );
ADDRGP4 s_configs
ARGP4
ADDRGP4 s_configs+548
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 220
;220:	Menu_AddItem( &s_configs.menu, &s_configs.arrows );
ADDRGP4 s_configs
ARGP4
ADDRGP4 s_configs+656
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 221
;221:	Menu_AddItem( &s_configs.menu, &s_configs.left );
ADDRGP4 s_configs
ARGP4
ADDRGP4 s_configs+748
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 222
;222:	Menu_AddItem( &s_configs.menu, &s_configs.right );
ADDRGP4 s_configs
ARGP4
ADDRGP4 s_configs+840
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 223
;223:	Menu_AddItem( &s_configs.menu, &s_configs.back );
ADDRGP4 s_configs
ARGP4
ADDRGP4 s_configs+932
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 224
;224:	Menu_AddItem( &s_configs.menu, &s_configs.go );
ADDRGP4 s_configs
ARGP4
ADDRGP4 s_configs+1024
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 225
;225:}
LABELV $89
endproc LoadConfig_MenuInit 24 16
export UI_LoadConfig_Cache
proc UI_LoadConfig_Cache 0 4
line 232
;226:
;227:/*
;228:=================
;229:UI_LoadConfig_Cache
;230:=================
;231:*/
;232:void UI_LoadConfig_Cache( void ) {
line 233
;233:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $185
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 234
;234:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $202
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 235
;235:	trap_R_RegisterShaderNoMip( ART_FIGHT0 );
ADDRGP4 $206
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 236
;236:	trap_R_RegisterShaderNoMip( ART_FIGHT1 );
ADDRGP4 $223
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 237
;237:	trap_R_RegisterShaderNoMip( ART_FRAMEL );
ADDRGP4 $107
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 238
;238:	trap_R_RegisterShaderNoMip( ART_FRAMER );
ADDRGP4 $121
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 239
;239:	trap_R_RegisterShaderNoMip( ART_ARROWS );
ADDRGP4 $135
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 240
;240:	trap_R_RegisterShaderNoMip( ART_ARROWLEFT );
ADDRGP4 $163
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 241
;241:	trap_R_RegisterShaderNoMip( ART_ARROWRIGHT );
ADDRGP4 $181
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 242
;242:}
LABELV $286
endproc UI_LoadConfig_Cache 0 4
export UI_LoadConfigMenu
proc UI_LoadConfigMenu 0 4
line 250
;243:
;244:
;245:/*
;246:===============
;247:UI_LoadConfigMenu
;248:===============
;249:*/
;250:void UI_LoadConfigMenu( void ) {
line 251
;251:	LoadConfig_MenuInit();
ADDRGP4 LoadConfig_MenuInit
CALLV
pop
line 252
;252:	UI_PushMenu( &s_configs.menu );
ADDRGP4 s_configs
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 253
;253:}
LABELV $287
endproc UI_LoadConfigMenu 0 4
bss
align 4
LABELV s_configs
skip 3676
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
LABELV $276
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $254
byte 1 78
byte 1 111
byte 1 32
byte 1 70
byte 1 105
byte 1 108
byte 1 101
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
LABELV $242
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $241
byte 1 0
align 1
LABELV $223
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $206
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $202
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
LABELV $185
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
LABELV $181
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
byte 1 104
byte 1 111
byte 1 114
byte 1 122
byte 1 95
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $163
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
byte 1 104
byte 1 111
byte 1 114
byte 1 122
byte 1 95
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 0
align 1
LABELV $135
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
byte 1 104
byte 1 111
byte 1 114
byte 1 122
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $121
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
LABELV $107
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
LABELV $99
byte 1 76
byte 1 79
byte 1 65
byte 1 68
byte 1 32
byte 1 67
byte 1 79
byte 1 78
byte 1 70
byte 1 73
byte 1 71
byte 1 0
align 1
LABELV $77
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
