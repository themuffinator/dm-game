export Com_Error
code
proc Com_Error 2052 12
file "..\..\..\..\code\q3_ui\ui_atoms.c"
line 16
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/**********************************************************************
;4:	UI_ATOMS.C
;5:
;6:	User interface building blocks and support functions.
;7:**********************************************************************/
;8:#include "ui_local.h"
;9:
;10:uiStatic_t		uis;
;11:qboolean		m_entersound;		// after a frame, so caching won't disrupt the sound
;12:
;13:// these are here so the functions in q_shared.c can link
;14:#ifndef UI_HARD_LINKED
;15:
;16:void QDECL Com_Error( int level, const char *fmt, ... ) {
line 20
;17:	va_list		argptr;
;18:	char		text[2048];
;19:
;20:	va_start( argptr, fmt );
ADDRLP4 0
ADDRFP4 4+4
ASGNP4
line 21
;21:	ED_vsprintf( text, fmt, argptr );
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ED_vsprintf
CALLI4
pop
line 22
;22:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 24
;23:
;24:	trap_Error( text );
ADDRLP4 4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 25
;25:}
LABELV $69
endproc Com_Error 2052 12
export Com_Printf
proc Com_Printf 2052 12
line 27
;26:
;27:void QDECL Com_Printf( const char *fmt, ... ) {
line 31
;28:	va_list		argptr;
;29:	char		text[2048];
;30:
;31:	va_start( argptr, fmt );
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 32
;32:	ED_vsprintf( text, fmt, argptr );
ADDRLP4 4
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
line 33
;33:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 35
;34:
;35:	trap_Print( text );
ADDRLP4 4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 36
;36:}
LABELV $71
endproc Com_Printf 2052 12
export UI_ClampCvar
proc UI_ClampCvar 0 0
line 46
;37:
;38:#endif
;39:
;40:/*
;41:=================
;42:UI_ClampCvar
;43:=================
;44:*/
;45:float UI_ClampCvar( float min, float max, float value )
;46:{
line 47
;47:	if ( value < min ) return min;
ADDRFP4 8
INDIRF4
ADDRFP4 0
INDIRF4
GEF4 $74
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $73
JUMPV
LABELV $74
line 48
;48:	if ( value > max ) return max;
ADDRFP4 8
INDIRF4
ADDRFP4 4
INDIRF4
LEF4 $76
ADDRFP4 4
INDIRF4
RETF4
ADDRGP4 $73
JUMPV
LABELV $76
line 49
;49:	return value;
ADDRFP4 8
INDIRF4
RETF4
LABELV $73
endproc UI_ClampCvar 0 0
export UI_StartDemoLoop
proc UI_StartDemoLoop 0 8
line 57
;50:}
;51:
;52:/*
;53:=================
;54:UI_StartDemoLoop
;55:=================
;56:*/
;57:void UI_StartDemoLoop( void ) {
line 58
;58:	trap_Cmd_ExecuteText( EXEC_APPEND, "d1\n" );
CNSTI4 2
ARGI4
ADDRGP4 $79
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 59
;59:}
LABELV $78
endproc UI_StartDemoLoop 0 8
export UI_PushMenu
proc UI_PushMenu 16 8
line 67
;60:
;61:/*
;62:=================
;63:UI_PushMenu
;64:=================
;65:*/
;66:void UI_PushMenu( menuframework_s *menu )
;67:{
line 72
;68:	int				i;
;69:	menucommon_s*	item;
;70:
;71:	// avoid stacking menus invoked by hotkeys
;72:	for (i=0 ; i<uis.menusp ; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $84
JUMPV
LABELV $81
line 73
;73:	{
line 74
;74:		if (uis.stack[i] == menu)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uis+24
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $86
line 75
;75:		{
line 76
;76:			uis.menusp = i;
ADDRGP4 uis+16
ADDRLP4 0
INDIRI4
ASGNI4
line 77
;77:			break;
ADDRGP4 $83
JUMPV
LABELV $86
line 79
;78:		}
;79:	}
LABELV $82
line 72
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $84
ADDRLP4 0
INDIRI4
ADDRGP4 uis+16
INDIRI4
LTI4 $81
LABELV $83
line 81
;80:
;81:	if (i == uis.menusp)
ADDRLP4 0
INDIRI4
ADDRGP4 uis+16
INDIRI4
NEI4 $90
line 82
;82:	{
line 83
;83:		if (uis.menusp >= MAX_MENUDEPTH)
ADDRGP4 uis+16
INDIRI4
CNSTI4 8
LTI4 $93
line 84
;84:			trap_Error("UI_PushMenu: menu stack overflow");
ADDRGP4 $96
ARGP4
ADDRGP4 trap_Error
CALLV
pop
LABELV $93
line 86
;85:
;86:		uis.stack[uis.menusp++] = menu;
ADDRLP4 12
ADDRGP4 uis+16
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRP4
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uis+24
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 87
;87:	}
LABELV $90
line 89
;88:
;89:	uis.activemenu = menu;
ADDRGP4 uis+20
ADDRFP4 0
INDIRP4
ASGNP4
line 92
;90:
;91:	// default cursor position
;92:	menu->cursor      = 0;
ADDRFP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 93
;93:	menu->cursor_prev = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 95
;94:
;95:	m_entersound = qtrue;
ADDRGP4 m_entersound
CNSTI4 1
ASGNI4
line 97
;96:
;97:	trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 100
;98:
;99:	// force first available item to have focus
;100:	for (i=0; i<menu->nitems; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $103
JUMPV
LABELV $100
line 101
;101:	{
line 102
;102:		item = (menucommon_s *)menu->items[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDP4
INDIRP4
ASGNP4
line 103
;103:		if (!(item->flags & (QMF_GRAYED|QMF_MOUSEONLY|QMF_INACTIVE)))
ADDRLP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 26624
BANDU4
CNSTU4 0
NEU4 $104
line 104
;104:		{
line 105
;105:			menu->cursor_prev = -1;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 -1
ASGNI4
line 106
;106:			Menu_SetCursor( menu, i );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Menu_SetCursor
CALLV
pop
line 107
;107:			break;
ADDRGP4 $102
JUMPV
LABELV $104
line 109
;108:		}
;109:	}
LABELV $101
line 100
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $103
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
LTI4 $100
LABELV $102
line 111
;110:
;111:	uis.firstdraw = qtrue;
ADDRGP4 uis+11468
CNSTI4 1
ASGNI4
line 112
;112:}
LABELV $80
endproc UI_PushMenu 16 8
export UI_PopMenu
proc UI_PopMenu 4 8
line 120
;113:
;114:/*
;115:=================
;116:UI_PopMenu
;117:=================
;118:*/
;119:void UI_PopMenu (void)
;120:{
line 121
;121:	trap_S_StartLocalSound( menu_out_sound, CHAN_LOCAL_SOUND );
ADDRGP4 menu_out_sound
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 123
;122:
;123:	uis.menusp--;
ADDRLP4 0
ADDRGP4 uis+16
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 125
;124:
;125:	if (uis.menusp < 0)
ADDRGP4 uis+16
INDIRI4
CNSTI4 0
GEI4 $109
line 126
;126:		trap_Error ("UI_PopMenu: menu stack underflow");
ADDRGP4 $112
ARGP4
ADDRGP4 trap_Error
CALLV
pop
LABELV $109
line 128
;127:
;128:	if (uis.menusp) {
ADDRGP4 uis+16
INDIRI4
CNSTI4 0
EQI4 $113
line 129
;129:		uis.activemenu = uis.stack[uis.menusp-1];
ADDRGP4 uis+20
ADDRGP4 uis+16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uis+24-4
ADDP4
INDIRP4
ASGNP4
line 130
;130:		uis.firstdraw = qtrue;
ADDRGP4 uis+11468
CNSTI4 1
ASGNI4
line 131
;131:	}
ADDRGP4 $114
JUMPV
LABELV $113
line 132
;132:	else {
line 133
;133:		UI_ForceMenuOff ();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 134
;134:	}
LABELV $114
line 135
;135:}
LABELV $107
endproc UI_PopMenu 4 8
export UI_ForceMenuOff
proc UI_ForceMenuOff 4 8
line 138
;136:
;137:void UI_ForceMenuOff (void)
;138:{
line 139
;139:	uis.menusp     = 0;
ADDRGP4 uis+16
CNSTI4 0
ASGNI4
line 140
;140:	uis.activemenu = NULL;
ADDRGP4 uis+20
CNSTP4 0
ASGNP4
line 142
;141:
;142:	trap_Key_SetCatcher( trap_Key_GetCatcher() & ~KEYCATCH_UI );
ADDRLP4 0
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 143
;143:	trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 144
;144:	trap_Cvar_Set( "cl_paused", "0" );
ADDRGP4 $124
ARGP4
ADDRGP4 $125
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 145
;145:}
LABELV $121
endproc UI_ForceMenuOff 4 8
export UI_LerpColor
proc UI_LerpColor 12 0
line 153
;146:
;147:/*
;148:=================
;149:UI_LerpColor
;150:=================
;151:*/
;152:void UI_LerpColor(vec4_t a, vec4_t b, vec4_t c, float t)
;153:{
line 157
;154:	int i;
;155:
;156:	// lerp and clamp each component
;157:	for (i=0; i<4; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $127
line 158
;158:	{
line 159
;159:		c[i] = a[i] + t*(b[i]-a[i]);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
ADDP4
INDIRF4
ADDRFP4 12
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
ADDP4
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 160
;160:		if (c[i] < 0)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $131
line 161
;161:			c[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 $132
JUMPV
LABELV $131
line 162
;162:		else if (c[i] > 1.0)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRF4
CNSTF4 1065353216
LEF4 $133
line 163
;163:			c[i] = 1.0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTF4 1065353216
ASGNF4
LABELV $133
LABELV $132
line 164
;164:	}
LABELV $128
line 157
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $127
line 165
;165:}
LABELV $126
endproc UI_LerpColor 12 0
data
align 4
LABELV propMap
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 8
byte 4 11
byte 4 122
byte 4 7
byte 4 154
byte 4 181
byte 4 14
byte 4 55
byte 4 122
byte 4 17
byte 4 79
byte 4 122
byte 4 18
byte 4 101
byte 4 122
byte 4 23
byte 4 153
byte 4 122
byte 4 18
byte 4 9
byte 4 93
byte 4 7
byte 4 207
byte 4 122
byte 4 8
byte 4 230
byte 4 122
byte 4 9
byte 4 177
byte 4 122
byte 4 18
byte 4 30
byte 4 152
byte 4 18
byte 4 85
byte 4 181
byte 4 7
byte 4 34
byte 4 93
byte 4 11
byte 4 110
byte 4 181
byte 4 6
byte 4 130
byte 4 152
byte 4 14
byte 4 22
byte 4 64
byte 4 17
byte 4 41
byte 4 64
byte 4 12
byte 4 58
byte 4 64
byte 4 17
byte 4 78
byte 4 64
byte 4 18
byte 4 98
byte 4 64
byte 4 19
byte 4 120
byte 4 64
byte 4 18
byte 4 141
byte 4 64
byte 4 18
byte 4 204
byte 4 64
byte 4 16
byte 4 162
byte 4 64
byte 4 17
byte 4 182
byte 4 64
byte 4 18
byte 4 59
byte 4 181
byte 4 7
byte 4 35
byte 4 181
byte 4 7
byte 4 203
byte 4 152
byte 4 14
byte 4 56
byte 4 93
byte 4 14
byte 4 228
byte 4 152
byte 4 14
byte 4 177
byte 4 181
byte 4 18
byte 4 28
byte 4 122
byte 4 22
byte 4 5
byte 4 4
byte 4 18
byte 4 27
byte 4 4
byte 4 18
byte 4 48
byte 4 4
byte 4 18
byte 4 69
byte 4 4
byte 4 17
byte 4 90
byte 4 4
byte 4 13
byte 4 106
byte 4 4
byte 4 13
byte 4 121
byte 4 4
byte 4 18
byte 4 143
byte 4 4
byte 4 17
byte 4 164
byte 4 4
byte 4 8
byte 4 175
byte 4 4
byte 4 16
byte 4 195
byte 4 4
byte 4 18
byte 4 216
byte 4 4
byte 4 12
byte 4 230
byte 4 4
byte 4 23
byte 4 6
byte 4 34
byte 4 18
byte 4 27
byte 4 34
byte 4 18
byte 4 48
byte 4 34
byte 4 18
byte 4 68
byte 4 34
byte 4 18
byte 4 90
byte 4 34
byte 4 17
byte 4 110
byte 4 34
byte 4 18
byte 4 130
byte 4 34
byte 4 14
byte 4 146
byte 4 34
byte 4 18
byte 4 166
byte 4 34
byte 4 19
byte 4 185
byte 4 34
byte 4 29
byte 4 215
byte 4 34
byte 4 18
byte 4 234
byte 4 34
byte 4 18
byte 4 5
byte 4 64
byte 4 14
byte 4 60
byte 4 152
byte 4 7
byte 4 106
byte 4 151
byte 4 13
byte 4 83
byte 4 152
byte 4 7
byte 4 128
byte 4 122
byte 4 17
byte 4 4
byte 4 152
byte 4 21
byte 4 134
byte 4 181
byte 4 5
byte 4 5
byte 4 4
byte 4 18
byte 4 27
byte 4 4
byte 4 18
byte 4 48
byte 4 4
byte 4 18
byte 4 69
byte 4 4
byte 4 17
byte 4 90
byte 4 4
byte 4 13
byte 4 106
byte 4 4
byte 4 13
byte 4 121
byte 4 4
byte 4 18
byte 4 143
byte 4 4
byte 4 17
byte 4 164
byte 4 4
byte 4 8
byte 4 175
byte 4 4
byte 4 16
byte 4 195
byte 4 4
byte 4 18
byte 4 216
byte 4 4
byte 4 12
byte 4 230
byte 4 4
byte 4 23
byte 4 6
byte 4 34
byte 4 18
byte 4 27
byte 4 34
byte 4 18
byte 4 48
byte 4 34
byte 4 18
byte 4 68
byte 4 34
byte 4 18
byte 4 90
byte 4 34
byte 4 17
byte 4 110
byte 4 34
byte 4 18
byte 4 130
byte 4 34
byte 4 14
byte 4 146
byte 4 34
byte 4 18
byte 4 166
byte 4 34
byte 4 19
byte 4 185
byte 4 34
byte 4 29
byte 4 215
byte 4 34
byte 4 18
byte 4 234
byte 4 34
byte 4 18
byte 4 5
byte 4 64
byte 4 14
byte 4 153
byte 4 152
byte 4 13
byte 4 11
byte 4 181
byte 4 5
byte 4 180
byte 4 152
byte 4 13
byte 4 79
byte 4 93
byte 4 17
byte 4 0
byte 4 0
byte 4 -1
align 4
LABELV propMapB
byte 4 11
byte 4 12
byte 4 33
byte 4 49
byte 4 12
byte 4 31
byte 4 85
byte 4 12
byte 4 31
byte 4 120
byte 4 12
byte 4 30
byte 4 156
byte 4 12
byte 4 21
byte 4 183
byte 4 12
byte 4 21
byte 4 207
byte 4 12
byte 4 32
byte 4 13
byte 4 55
byte 4 30
byte 4 49
byte 4 55
byte 4 13
byte 4 66
byte 4 55
byte 4 29
byte 4 101
byte 4 55
byte 4 31
byte 4 135
byte 4 55
byte 4 21
byte 4 158
byte 4 55
byte 4 40
byte 4 204
byte 4 55
byte 4 32
byte 4 12
byte 4 97
byte 4 31
byte 4 48
byte 4 97
byte 4 31
byte 4 82
byte 4 97
byte 4 30
byte 4 118
byte 4 97
byte 4 30
byte 4 153
byte 4 97
byte 4 30
byte 4 185
byte 4 97
byte 4 25
byte 4 213
byte 4 97
byte 4 30
byte 4 11
byte 4 139
byte 4 32
byte 4 42
byte 4 139
byte 4 51
byte 4 93
byte 4 139
byte 4 32
byte 4 126
byte 4 139
byte 4 31
byte 4 158
byte 4 139
byte 4 25
code
proc UI_DrawBannerString2 52 36
line 326
;166:
;167:/*
;168:=================
;169:UI_DrawProportionalString2
;170:=================
;171:*/
;172:static int	propMap[128][3] = {
;173:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;174:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;175:
;176:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;177:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;178:
;179:{0, 0, PROP_SPACE_WIDTH},		// SPACE
;180:{11, 122, 7},	// !
;181:{154, 181, 14},	// "
;182:{55, 122, 17},	// #
;183:{79, 122, 18},	// $
;184:{101, 122, 23},	// %
;185:{153, 122, 18},	// &
;186:{9, 93, 7},		// '
;187:{207, 122, 8},	// (
;188:{230, 122, 9},	// )
;189:{177, 122, 18},	// *
;190:{30, 152, 18},	// +
;191:{85, 181, 7},	// ,
;192:{34, 93, 11},	// -
;193:{110, 181, 6},	// .
;194:{130, 152, 14},	// /
;195:
;196:{22, 64, 17},	// 0
;197:{41, 64, 12},	// 1
;198:{58, 64, 17},	// 2
;199:{78, 64, 18},	// 3
;200:{98, 64, 19},	// 4
;201:{120, 64, 18},	// 5
;202:{141, 64, 18},	// 6
;203:{204, 64, 16},	// 7
;204:{162, 64, 17},	// 8
;205:{182, 64, 18},	// 9
;206:{59, 181, 7},	// :
;207:{35,181, 7},	// ;
;208:{203, 152, 14},	// <
;209:{56, 93, 14},	// =
;210:{228, 152, 14},	// >
;211:{177, 181, 18},	// ?
;212:
;213:{28, 122, 22},	// @
;214:{5, 4, 18},		// A
;215:{27, 4, 18},	// B
;216:{48, 4, 18},	// C
;217:{69, 4, 17},	// D
;218:{90, 4, 13},	// E
;219:{106, 4, 13},	// F
;220:{121, 4, 18},	// G
;221:{143, 4, 17},	// H
;222:{164, 4, 8},	// I
;223:{175, 4, 16},	// J
;224:{195, 4, 18},	// K
;225:{216, 4, 12},	// L
;226:{230, 4, 23},	// M
;227:{6, 34, 18},	// N
;228:{27, 34, 18},	// O
;229:
;230:{48, 34, 18},	// P
;231:{68, 34, 18},	// Q
;232:{90, 34, 17},	// R
;233:{110, 34, 18},	// S
;234:{130, 34, 14},	// T
;235:{146, 34, 18},	// U
;236:{166, 34, 19},	// V
;237:{185, 34, 29},	// W
;238:{215, 34, 18},	// X
;239:{234, 34, 18},	// Y
;240:{5, 64, 14},	// Z
;241:{60, 152, 7},	// [
;242:{106, 151, 13},	// '\'
;243:{83, 152, 7},	// ]
;244:{128, 122, 17},	// ^
;245:{4, 152, 21},	// _
;246:
;247:{134, 181, 5},	// '
;248:{5, 4, 18},		// A
;249:{27, 4, 18},	// B
;250:{48, 4, 18},	// C
;251:{69, 4, 17},	// D
;252:{90, 4, 13},	// E
;253:{106, 4, 13},	// F
;254:{121, 4, 18},	// G
;255:{143, 4, 17},	// H
;256:{164, 4, 8},	// I
;257:{175, 4, 16},	// J
;258:{195, 4, 18},	// K
;259:{216, 4, 12},	// L
;260:{230, 4, 23},	// M
;261:{6, 34, 18},	// N
;262:{27, 34, 18},	// O
;263:
;264:{48, 34, 18},	// P
;265:{68, 34, 18},	// Q
;266:{90, 34, 17},	// R
;267:{110, 34, 18},	// S
;268:{130, 34, 14},	// T
;269:{146, 34, 18},	// U
;270:{166, 34, 19},	// V
;271:{185, 34, 29},	// W
;272:{215, 34, 18},	// X
;273:{234, 34, 18},	// Y
;274:{5, 64, 14},	// Z
;275:{153, 152, 13},	// {
;276:{11, 181, 5},	// |
;277:{180, 152, 13},	// }
;278:{79, 93, 17},	// ~
;279:{0, 0, -1}		// DEL
;280:};
;281:
;282:static int propMapB[26][3] = {
;283:{11, 12, 33},
;284:{49, 12, 31},
;285:{85, 12, 31},
;286:{120, 12, 30},
;287:{156, 12, 21},
;288:{183, 12, 21},
;289:{207, 12, 32},
;290:
;291:{13, 55, 30},
;292:{49, 55, 13},
;293:{66, 55, 29},
;294:{101, 55, 31},
;295:{135, 55, 21},
;296:{158, 55, 40},
;297:{204, 55, 32},
;298:
;299:{12, 97, 31},
;300:{48, 97, 31},
;301:{82, 97, 30},
;302:{118, 97, 30},
;303:{153, 97, 30},
;304:{185, 97, 25},
;305:{213, 97, 30},
;306:
;307:{11, 139, 32},
;308:{42, 139, 51},
;309:{93, 139, 32},
;310:{126, 139, 31},
;311:{158, 139, 25},
;312:};
;313:
;314:#define PROPB_GAP_WIDTH		4
;315:#define PROPB_SPACE_WIDTH	12
;316:#define PROPB_HEIGHT		36
;317:
;318:// bk001205 - code below duplicated in cgame/cg_drawtools.c
;319:// bk001205 - FIXME: does this belong in ui_shared.c?
;320:/*
;321:=================
;322:UI_DrawBannerString
;323:=================
;324:*/
;325:static void UI_DrawBannerString2( int x, int y, const char* str, vec4_t color )
;326:{
line 339
;327:	const char* s;
;328:	unsigned char	ch; // bk001204 - unsigned
;329:	float	ax;
;330:	float	ay;
;331:	float	aw;
;332:	float	ah;
;333:	float	frow;
;334:	float	fcol;
;335:	float	fwidth;
;336:	float	fheight;
;337:
;338:	// draw the colored text
;339:	trap_R_SetColor( color );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 341
;340:	
;341:	ax = x * uis.scale + uis.biasX;
ADDRLP4 8
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRGP4 uis+11432
INDIRF4
MULF4
ADDRGP4 uis+11436
INDIRF4
ADDF4
ASGNF4
line 342
;342:	ay = y * uis.scale + uis.biasY;
ADDRLP4 36
ADDRFP4 4
INDIRI4
CVIF4 4
ADDRGP4 uis+11432
INDIRF4
MULF4
ADDRGP4 uis+11440
INDIRF4
ADDF4
ASGNF4
line 344
;343:
;344:	s = str;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $141
JUMPV
LABELV $140
line 346
;345:	while ( *s )
;346:	{
line 347
;347:		ch = *s & 127;
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 348
;348:		if ( ch == ' ' ) {
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 32
NEI4 $143
line 349
;349:			ax += ((float)PROPB_SPACE_WIDTH + (float)PROPB_GAP_WIDTH)* uis.scale;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRGP4 uis+11432
INDIRF4
CNSTF4 1098907648
MULF4
ADDF4
ASGNF4
line 350
;350:		}
ADDRGP4 $144
JUMPV
LABELV $143
line 351
;351:		else if ( ch >= 'A' && ch <= 'Z' ) {
ADDRLP4 40
ADDRLP4 0
INDIRU1
CVUI4 1
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 65
LTI4 $146
ADDRLP4 40
INDIRI4
CNSTI4 90
GTI4 $146
line 352
;352:			ch -= 'A';
ADDRLP4 0
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 65
SUBI4
CVIU4 4
CVUU1 4
ASGNU1
line 353
;353:			fcol = (float)propMapB[ch][0] / 256.0f;
ADDRLP4 20
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 12
MULI4
ADDRGP4 propMapB
ADDP4
INDIRI4
CVIF4 4
CNSTF4 998244352
MULF4
ASGNF4
line 354
;354:			frow = (float)propMapB[ch][1] / 256.0f;
ADDRLP4 16
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 12
MULI4
ADDRGP4 propMapB+4
ADDP4
INDIRI4
CVIF4 4
CNSTF4 998244352
MULF4
ASGNF4
line 355
;355:			fwidth = (float)propMapB[ch][2] / 256.0f;
ADDRLP4 28
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 12
MULI4
ADDRGP4 propMapB+8
ADDP4
INDIRI4
CVIF4 4
CNSTF4 998244352
MULF4
ASGNF4
line 356
;356:			fheight = (float)PROPB_HEIGHT / 256.0f;
ADDRLP4 32
CNSTF4 1041235968
ASGNF4
line 357
;357:			aw = (float)propMapB[ch][2] * uis.scale;
ADDRLP4 12
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 12
MULI4
ADDRGP4 propMapB+8
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 uis+11432
INDIRF4
MULF4
ASGNF4
line 358
;358:			ah = (float)PROPB_HEIGHT * uis.scale;
ADDRLP4 24
ADDRGP4 uis+11432
INDIRF4
CNSTF4 1108344832
MULF4
ASGNF4
line 359
;359:			trap_R_DrawStretchPic( ax, ay, aw, ah, fcol, frow, fcol+fwidth, frow+fheight, uis.charsetPropB );
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ADDRLP4 28
INDIRF4
ADDF4
ARGF4
ADDRLP4 16
INDIRF4
ADDRLP4 32
INDIRF4
ADDF4
ARGF4
ADDRGP4 uis+11416
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 360
;360:			ax += (aw + (float)PROPB_GAP_WIDTH * uis.scale);
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
ADDRGP4 uis+11432
INDIRF4
CNSTF4 1082130432
MULF4
ADDF4
ADDF4
ASGNF4
line 361
;361:		}
LABELV $146
LABELV $144
line 362
;362:		s++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 363
;363:	}
LABELV $141
line 345
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $140
line 365
;364:
;365:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 366
;366:}
LABELV $135
endproc UI_DrawBannerString2 52 36
export UI_DrawBannerString
proc UI_DrawBannerString 40 16
line 368
;367:
;368:void UI_DrawBannerString( int x, int y, const char* str, int style, vec4_t color ) {
line 375
;369:	const char *	s;
;370:	int				ch;
;371:	int				width;
;372:	vec4_t			drawcolor;
;373:
;374:	// find the width of the drawn text
;375:	s = str;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
line 376
;376:	width = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $157
JUMPV
LABELV $156
line 377
;377:	while ( *s ) {
line 378
;378:		ch = *s;
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 379
;379:		if ( ch == ' ' ) {
ADDRLP4 0
INDIRI4
CNSTI4 32
NEI4 $159
line 380
;380:			width += PROPB_SPACE_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 12
ADDI4
ASGNI4
line 381
;381:		}
ADDRGP4 $160
JUMPV
LABELV $159
line 382
;382:		else if ( ch >= 'A' && ch <= 'Z' ) {
ADDRLP4 0
INDIRI4
CNSTI4 65
LTI4 $161
ADDRLP4 0
INDIRI4
CNSTI4 90
GTI4 $161
line 383
;383:			width += propMapB[ch - 'A'][2] + PROPB_GAP_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 12
MULI4
ADDRGP4 propMapB-780+8
ADDP4
INDIRI4
CNSTI4 4
ADDI4
ADDI4
ASGNI4
line 384
;384:		}
LABELV $161
LABELV $160
line 385
;385:		s++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 386
;386:	}
LABELV $157
line 377
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $156
line 387
;387:	width -= PROPB_GAP_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 4
SUBI4
ASGNI4
line 389
;388:
;389:	switch( style & UI_FORMATMASK ) {
ADDRLP4 28
ADDRFP4 12
INDIRI4
CNSTI4 7
BANDI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $166
ADDRLP4 28
INDIRI4
CNSTI4 1
EQI4 $168
ADDRLP4 28
INDIRI4
CNSTI4 2
EQI4 $169
ADDRGP4 $166
JUMPV
LABELV $168
line 391
;390:		case UI_CENTER:
;391:			x -= width / 2;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 8
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 392
;392:			break;
ADDRGP4 $166
JUMPV
LABELV $169
line 395
;393:
;394:		case UI_RIGHT:
;395:			x -= width;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 396
;396:			break;
line 400
;397:
;398:		case UI_LEFT:
;399:		default:
;400:			break;
LABELV $166
line 403
;401:	}
;402:
;403:	if ( style & UI_DROPSHADOW ) {
ADDRFP4 12
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $171
line 404
;404:		drawcolor[0] = drawcolor[1] = drawcolor[2] = 0;
ADDRLP4 36
CNSTF4 0
ASGNF4
ADDRLP4 12+8
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 36
INDIRF4
ASGNF4
line 405
;405:		drawcolor[3] = color[3];
ADDRLP4 12+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 406
;406:		UI_DrawBannerString2( x+2, y+2, str, drawcolor );
ADDRFP4 0
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 UI_DrawBannerString2
CALLV
pop
line 407
;407:	}
LABELV $171
line 409
;408:
;409:	UI_DrawBannerString2( x, y, str, color );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 UI_DrawBannerString2
CALLV
pop
line 410
;410:}
LABELV $155
endproc UI_DrawBannerString 40 16
export UI_ProportionalStringWidth
proc UI_ProportionalStringWidth 16 0
line 413
;411:
;412:
;413:int UI_ProportionalStringWidth( const char* str ) {
line 419
;414:	const char *	s;
;415:	int				ch;
;416:	int				charWidth;
;417:	int				width;
;418:
;419:	s = str;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 420
;420:	width = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $178
JUMPV
LABELV $177
line 421
;421:	while ( *s ) {
line 422
;422:		ch = *s & 127;
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
BANDI4
ASGNI4
line 423
;423:		charWidth = propMap[ch][2];
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 12
MULI4
ADDRGP4 propMap+8
ADDP4
INDIRI4
ASGNI4
line 424
;424:		if ( charWidth != -1 ) {
ADDRLP4 4
INDIRI4
CNSTI4 -1
EQI4 $181
line 425
;425:			width += charWidth;
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 426
;426:			width += PROP_GAP_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 3
ADDI4
ASGNI4
line 427
;427:		}
LABELV $181
line 428
;428:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 429
;429:	}
LABELV $178
line 421
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $177
line 431
;430:
;431:	width -= PROP_GAP_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 3
SUBI4
ASGNI4
line 432
;432:	return width;
ADDRLP4 12
INDIRI4
RETI4
LABELV $176
endproc UI_ProportionalStringWidth 16 0
proc UI_DrawProportionalString2 48 36
line 436
;433:}
;434:
;435:static void UI_DrawProportionalString2( int x, int y, const char* str, vec4_t color, float sizeScale, qhandle_t charset )
;436:{
line 441
;437:	const char* s;
;438:	unsigned char	ch; // bk001204 - unsigned
;439:	float	ax;
;440:	float	ay;
;441:	float	aw = 0; // bk001204 - init
ADDRLP4 8
CNSTF4 0
ASGNF4
line 449
;442:	float	ah;
;443:	float	frow;
;444:	float	fcol;
;445:	float	fwidth;
;446:	float	fheight;
;447:
;448:	// draw the colored text
;449:	trap_R_SetColor( color );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 451
;450:	
;451:	ax = x * uis.scale + uis.biasX;
ADDRLP4 12
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRGP4 uis+11432
INDIRF4
MULF4
ADDRGP4 uis+11436
INDIRF4
ADDF4
ASGNF4
line 452
;452:	ay = y * uis.scale + uis.biasY;
ADDRLP4 36
ADDRFP4 4
INDIRI4
CVIF4 4
ADDRGP4 uis+11432
INDIRF4
MULF4
ADDRGP4 uis+11440
INDIRF4
ADDF4
ASGNF4
line 454
;453:
;454:	s = str;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $189
JUMPV
LABELV $188
line 456
;455:	while ( *s )
;456:	{
line 457
;457:		ch = *s & 127;
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 458
;458:		if ( ch == ' ' ) {
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 32
NEI4 $191
line 459
;459:			aw = (float)PROP_SPACE_WIDTH * uis.scale * sizeScale;
ADDRLP4 8
ADDRGP4 uis+11432
INDIRF4
CNSTF4 1090519040
MULF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 460
;460:		}
ADDRGP4 $192
JUMPV
LABELV $191
line 461
;461:		else if ( propMap[ch][2] != -1 ) {
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 12
MULI4
ADDRGP4 propMap+8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $194
line 462
;462:			fcol = (float)propMap[ch][0] / 256.0f;
ADDRLP4 20
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 12
MULI4
ADDRGP4 propMap
ADDP4
INDIRI4
CVIF4 4
CNSTF4 998244352
MULF4
ASGNF4
line 463
;463:			frow = (float)propMap[ch][1] / 256.0f;
ADDRLP4 16
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 12
MULI4
ADDRGP4 propMap+4
ADDP4
INDIRI4
CVIF4 4
CNSTF4 998244352
MULF4
ASGNF4
line 464
;464:			fwidth = (float)propMap[ch][2] / 256.0f;
ADDRLP4 28
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 12
MULI4
ADDRGP4 propMap+8
ADDP4
INDIRI4
CVIF4 4
CNSTF4 998244352
MULF4
ASGNF4
line 465
;465:			fheight = (float)PROP_HEIGHT / 256.0f;
ADDRLP4 32
CNSTF4 1037565952
ASGNF4
line 466
;466:			aw = (float)propMap[ch][2] * uis.scale * sizeScale;
ADDRLP4 8
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 12
MULI4
ADDRGP4 propMap+8
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 uis+11432
INDIRF4
MULF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 467
;467:			ah = (float)PROP_HEIGHT * uis.scale * sizeScale;
ADDRLP4 24
ADDRGP4 uis+11432
INDIRF4
CNSTF4 1104674816
MULF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 468
;468:			trap_R_DrawStretchPic( ax, ay, aw, ah, fcol, frow, fcol+fwidth, frow+fheight, charset );
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ADDRLP4 28
INDIRF4
ADDF4
ARGF4
ADDRLP4 16
INDIRF4
ADDRLP4 32
INDIRF4
ADDF4
ARGF4
ADDRFP4 20
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 469
;469:		}
LABELV $194
LABELV $192
line 471
;470:
;471:		ax += (aw + (float)PROP_GAP_WIDTH * uis.scale * sizeScale);
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
ADDRGP4 uis+11432
INDIRF4
CNSTF4 1077936128
MULF4
ADDRFP4 16
INDIRF4
MULF4
ADDF4
ADDF4
ASGNF4
line 472
;472:		s++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 473
;473:	}
LABELV $189
line 455
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $188
line 475
;474:
;475:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 476
;476:}
LABELV $183
endproc UI_DrawProportionalString2 48 36
export UI_ProportionalSizeScale
proc UI_ProportionalSizeScale 0 0
line 483
;477:
;478:/*
;479:=================
;480:UI_ProportionalSizeScale
;481:=================
;482:*/
;483:float UI_ProportionalSizeScale( int style ) {
line 484
;484:	if(  style & UI_SMALLFONT ) {
ADDRFP4 0
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $204
line 485
;485:		return PROP_SMALL_SIZE_SCALE;
CNSTF4 1061158912
RETF4
ADDRGP4 $203
JUMPV
LABELV $204
line 488
;486:	}
;487:
;488:	return 1.00;
CNSTF4 1065353216
RETF4
LABELV $203
endproc UI_ProportionalSizeScale 0 0
export UI_DrawProportionalString
proc UI_DrawProportionalString 44 24
line 497
;489:}
;490:
;491:
;492:/*
;493:=================
;494:UI_DrawProportionalString
;495:=================
;496:*/
;497:void UI_DrawProportionalString( int x, int y, const char* str, int style, vec4_t color ) {
line 502
;498:	vec4_t	drawcolor;
;499:	int		width;
;500:	float	sizeScale;
;501:
;502:	sizeScale = UI_ProportionalSizeScale( style );
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 UI_ProportionalSizeScale
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 24
INDIRF4
ASGNF4
line 504
;503:
;504:	switch( style & UI_FORMATMASK ) {
ADDRLP4 28
ADDRFP4 12
INDIRI4
CNSTI4 7
BANDI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $208
ADDRLP4 28
INDIRI4
CNSTI4 1
EQI4 $210
ADDRLP4 28
INDIRI4
CNSTI4 2
EQI4 $211
ADDRGP4 $208
JUMPV
LABELV $210
line 506
;505:		case UI_CENTER:
;506:			width = UI_ProportionalStringWidth( str ) * sizeScale;
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 36
INDIRI4
CVIF4 4
ADDRLP4 16
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 507
;507:			x -= width / 2;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 20
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 508
;508:			break;
ADDRGP4 $208
JUMPV
LABELV $211
line 511
;509:
;510:		case UI_RIGHT:
;511:			width = UI_ProportionalStringWidth( str ) * sizeScale;
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 40
INDIRI4
CVIF4 4
ADDRLP4 16
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 512
;512:			x -= width;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
ASGNI4
line 513
;513:			break;
line 517
;514:
;515:		case UI_LEFT:
;516:		default:
;517:			break;
LABELV $208
line 520
;518:	}
;519:
;520:	if ( style & UI_DROPSHADOW ) {
ADDRFP4 12
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $213
line 521
;521:		drawcolor[0] = drawcolor[1] = drawcolor[2] = 0;
ADDRLP4 36
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 36
INDIRF4
ASGNF4
line 522
;522:		drawcolor[3] = color[3];
ADDRLP4 0+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 523
;523:		UI_DrawProportionalString2( x+2, y+2, str, drawcolor, sizeScale, uis.charsetProp );
ADDRFP4 0
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 uis+11408
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 524
;524:	}
LABELV $213
line 526
;525:
;526:	if ( style & UI_INVERSE ) {
ADDRFP4 12
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $219
line 527
;527:		drawcolor[0] = color[0] * 0.7;
ADDRLP4 0
ADDRFP4 16
INDIRP4
INDIRF4
CNSTF4 1060320051
MULF4
ASGNF4
line 528
;528:		drawcolor[1] = color[1] * 0.7;
ADDRLP4 0+4
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1060320051
MULF4
ASGNF4
line 529
;529:		drawcolor[2] = color[2] * 0.7;
ADDRLP4 0+8
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1060320051
MULF4
ASGNF4
line 530
;530:		drawcolor[3] = color[3];
ADDRLP4 0+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 531
;531:		UI_DrawProportionalString2( x, y, str, drawcolor, sizeScale, uis.charsetProp );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 uis+11408
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 532
;532:		return;
ADDRGP4 $206
JUMPV
LABELV $219
line 535
;533:	}
;534:
;535:	if ( style & UI_PULSE ) {
ADDRFP4 12
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $225
line 536
;536:		drawcolor[0] = color[0] * 0.7;
ADDRLP4 0
ADDRFP4 16
INDIRP4
INDIRF4
CNSTF4 1060320051
MULF4
ASGNF4
line 537
;537:		drawcolor[1] = color[1] * 0.7;
ADDRLP4 0+4
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1060320051
MULF4
ASGNF4
line 538
;538:		drawcolor[2] = color[2] * 0.7;
ADDRLP4 0+8
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1060320051
MULF4
ASGNF4
line 539
;539:		drawcolor[3] = color[3];
ADDRLP4 0+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 540
;540:		UI_DrawProportionalString2( x, y, str, color, sizeScale, uis.charsetProp );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 uis+11408
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 542
;541:
;542:		drawcolor[0] = color[0];
ADDRLP4 0
ADDRFP4 16
INDIRP4
INDIRF4
ASGNF4
line 543
;543:		drawcolor[1] = color[1];
ADDRLP4 0+4
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 544
;544:		drawcolor[2] = color[2];
ADDRLP4 0+8
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
line 545
;545:		drawcolor[3] = 0.5 + 0.5 * sin( ( uis.realtime % TMOD_075 ) / PULSE_DIVISOR );
ADDRGP4 uis+4
INDIRI4
CNSTI4 2292106
MODI4
CNSTI4 75
DIVI4
CVIF4 4
ARGF4
ADDRLP4 36
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 0+12
ADDRLP4 36
INDIRF4
CNSTF4 1056964608
MULF4
CNSTF4 1056964608
ADDF4
ASGNF4
line 546
;546:		UI_DrawProportionalString2( x, y, str, drawcolor, sizeScale, uis.charsetPropGlow );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 uis+11412
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 547
;547:		return;
ADDRGP4 $206
JUMPV
LABELV $225
line 550
;548:	}
;549:
;550:	UI_DrawProportionalString2( x, y, str, color, sizeScale, uis.charsetProp );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 uis+11408
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 551
;551:}
LABELV $206
endproc UI_DrawProportionalString 44 24
export UI_DrawProportionalString_AutoWrapped
proc UI_DrawProportionalString_AutoWrapped 1064 20
line 558
;552:
;553:/*
;554:=================
;555:UI_DrawProportionalString_Wrapped
;556:=================
;557:*/
;558:void UI_DrawProportionalString_AutoWrapped( int x, int y, int xmax, int ystep, const char* str, int style, vec4_t color ) {
line 565
;559:	int width;
;560:	char *s1,*s2,*s3;
;561:	char c_bcp;
;562:	char buf[1024];
;563:	float   sizeScale;
;564:
;565:	if (!str || str[0]=='\0')
ADDRLP4 1048
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 1048
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $240
ADDRLP4 1048
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $238
LABELV $240
line 566
;566:		return;
ADDRGP4 $237
JUMPV
LABELV $238
line 568
;567:	
;568:	sizeScale = UI_ProportionalSizeScale( style );
ADDRFP4 20
INDIRI4
ARGI4
ADDRLP4 1052
ADDRGP4 UI_ProportionalSizeScale
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 1052
INDIRF4
ASGNF4
line 570
;569:	
;570:	Q_strncpyz(buf, str, sizeof(buf));
ADDRLP4 24
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 571
;571:	s1 = s2 = s3 = buf;
ADDRLP4 0
ADDRLP4 24
ASGNP4
ADDRLP4 4
ADDRLP4 24
ASGNP4
ADDRLP4 12
ADDRLP4 24
ASGNP4
ADDRGP4 $242
JUMPV
LABELV $241
line 573
;572:
;573:	while (1) {
LABELV $244
line 574
;574:		do {
line 575
;575:			s3++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 576
;576:		} while (*s3!=' ' && *s3!='\0');
LABELV $245
ADDRLP4 1056
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 32
EQI4 $247
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $244
LABELV $247
line 577
;577:		c_bcp = *s3;
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI1
ASGNI1
line 578
;578:		*s3 = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 579
;579:		width = UI_ProportionalStringWidth(s1) * sizeScale;
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 1060
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 1060
INDIRI4
CVIF4 4
ADDRLP4 20
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 580
;580:		*s3 = c_bcp;
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI1
ASGNI1
line 581
;581:		if (width > xmax) {
ADDRLP4 16
INDIRI4
ADDRFP4 8
INDIRI4
LEI4 $248
line 582
;582:			if (s1==s2)
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
NEU4 $250
line 583
;583:			{
line 585
;584:				// fuck, don't have a clean cut, we'll overflow
;585:				s2 = s3;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 586
;586:			}
LABELV $250
line 587
;587:			*s2 = '\0';
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 588
;588:			UI_DrawProportionalString(x, y, s1, style, color);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRP4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 589
;589:			y += ystep;
ADDRFP4 4
ADDRFP4 4
INDIRI4
ADDRFP4 12
INDIRI4
ADDI4
ASGNI4
line 590
;590:			if (c_bcp == '\0')
ADDRLP4 8
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $252
line 591
;591:      {
line 596
;592:        // that was the last word
;593:        // we could start a new loop, but that wouldn't be much use
;594:        // even if the word is too long, we would overflow it (see above)
;595:        // so just print it now if needed
;596:        s2++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 597
;597:        if (*s2 != '\0') // if we are printing an overflowing line we have s2 == s3
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $243
line 598
;598:          UI_DrawProportionalString(x, y, s2, style, color);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRP4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 599
;599:				break; 
ADDRGP4 $243
JUMPV
LABELV $252
line 601
;600:      }
;601:			s2++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 602
;602:			s1 = s2;
ADDRLP4 12
ADDRLP4 4
INDIRP4
ASGNP4
line 603
;603:			s3 = s2;
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 604
;604:		}
ADDRGP4 $249
JUMPV
LABELV $248
line 606
;605:		else
;606:		{
line 607
;607:			s2 = s3;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 608
;608:			if (c_bcp == '\0') // we reached the end
ADDRLP4 8
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $256
line 609
;609:			{
line 610
;610:				UI_DrawProportionalString(x, y, s1, style, color);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRP4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 611
;611:				break;
ADDRGP4 $243
JUMPV
LABELV $256
line 613
;612:			}
;613:		}
LABELV $249
line 614
;614:	}
LABELV $242
line 573
ADDRGP4 $241
JUMPV
LABELV $243
line 615
;615:}
LABELV $237
endproc UI_DrawProportionalString_AutoWrapped 1064 20
proc UI_DrawString2 64 36
line 623
;616:
;617:/*
;618:=================
;619:UI_DrawString2
;620:=================
;621:*/
;622:static void UI_DrawString2( int x, int y, const char* str, vec4_t color, int charw, int charh )
;623:{
line 626
;624:	const char* s;
;625:	char	ch;
;626:	int forceColor = qfalse; //APSFIXME;
ADDRLP4 40
CNSTI4 0
ASGNI4
line 635
;627:	vec4_t	tempcolor;
;628:	float	ax;
;629:	float	ay;
;630:	float	aw;
;631:	float	ah;
;632:	float	frow;
;633:	float	fcol;
;634:
;635:	if (y < -charh)
ADDRFP4 4
INDIRI4
ADDRFP4 20
INDIRI4
NEGI4
GEI4 $259
line 637
;636:		// offscreen
;637:		return;
ADDRGP4 $258
JUMPV
LABELV $259
line 640
;638:
;639:	// draw the colored text
;640:	trap_R_SetColor( color );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 642
;641:	
;642:	ax = x * uis.scale + uis.biasX;
ADDRLP4 8
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRGP4 uis+11432
INDIRF4
MULF4
ADDRGP4 uis+11436
INDIRF4
ADDF4
ASGNF4
line 643
;643:	ay = y * uis.scale + uis.biasY;
ADDRLP4 44
ADDRFP4 4
INDIRI4
CVIF4 4
ADDRGP4 uis+11432
INDIRF4
MULF4
ADDRGP4 uis+11440
INDIRF4
ADDF4
ASGNF4
line 644
;644:	aw = charw * uis.scale;
ADDRLP4 12
ADDRFP4 16
INDIRI4
CVIF4 4
ADDRGP4 uis+11432
INDIRF4
MULF4
ASGNF4
line 645
;645:	ah = charh * uis.scale;
ADDRLP4 48
ADDRFP4 20
INDIRI4
CVIF4 4
ADDRGP4 uis+11432
INDIRF4
MULF4
ASGNF4
line 647
;646:
;647:	s = str;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $268
JUMPV
LABELV $267
line 649
;648:	while ( *s )
;649:	{
line 650
;650:		if ( Q_IsColorString( s ) )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $270
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $270
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $270
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 94
EQI4 $270
line 651
;651:		{
line 652
;652:			if ( !forceColor )
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $272
line 653
;653:			{
line 654
;654:				memcpy( tempcolor, g_color_table[ColorIndex(s[1])], sizeof( tempcolor ) );
ADDRLP4 24
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
CNSTI4 7
BANDI4
CNSTI4 4
LSHI4
ADDRGP4 g_color_table
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 655
;655:				tempcolor[3] = color[3];
ADDRLP4 24+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 656
;656:				trap_R_SetColor( tempcolor );
ADDRLP4 24
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 657
;657:			}
LABELV $272
line 658
;658:			s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 659
;659:			continue;
ADDRGP4 $268
JUMPV
LABELV $270
line 662
;660:		}
;661:
;662:		ch = *s & 255;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 255
BANDI4
CVII1 4
ASGNI1
line 663
;663:		if (ch != ' ')
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $275
line 664
;664:		{
line 665
;665:			frow = (ch>>4)*0.0625;
ADDRLP4 16
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 4
RSHI4
CVIF4 4
CNSTF4 1031798784
MULF4
ASGNF4
line 666
;666:			fcol = (ch&15)*0.0625;
ADDRLP4 20
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 15
BANDI4
CVIF4 4
CNSTF4 1031798784
MULF4
ASGNF4
line 667
;667:			trap_R_DrawStretchPic( ax, ay, aw, ah, fcol, frow, fcol + 0.0625, frow + 0.0625, uis.charset );
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 48
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
CNSTF4 1031798784
ADDF4
ARGF4
ADDRLP4 16
INDIRF4
CNSTF4 1031798784
ADDF4
ARGF4
ADDRGP4 uis+11404
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 668
;668:		}
LABELV $275
line 670
;669:
;670:		ax += aw;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ASGNF4
line 671
;671:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 672
;672:	}
LABELV $268
line 648
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $267
line 674
;673:
;674:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 675
;675:}
LABELV $258
endproc UI_DrawString2 64 36
export UI_DrawString
proc UI_DrawString 80 24
line 684
;676:
;677:
;678:/*
;679:=================
;680:UI_DrawString
;681:=================
;682:*/
;683:void UI_DrawString( int x, int y, const char* str, int style, vec4_t color )
;684:{
line 693
;685:	int		len;
;686:	int		charw;
;687:	int		charh;
;688:	vec4_t	newcolor;
;689:	vec4_t	lowlight;
;690:	float	*drawcolor;
;691:	vec4_t	dropcolor;
;692:
;693:	if( !str ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $279
line 694
;694:		return;
ADDRGP4 $278
JUMPV
LABELV $279
line 697
;695:	}
;696:
;697:	if ((style & UI_BLINK) && ((uis.realtime/BLINK_DIVISOR) & 1))
ADDRFP4 12
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $281
ADDRGP4 uis+4
INDIRI4
CNSTI4 200
DIVI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $281
line 698
;698:		return;
ADDRGP4 $278
JUMPV
LABELV $281
line 700
;699:
;700:	if (style & UI_SMALLFONT)
ADDRFP4 12
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $284
line 701
;701:	{
line 702
;702:		charw =	SMALLCHAR_WIDTH;
ADDRLP4 0
CNSTI4 8
ASGNI4
line 703
;703:		charh =	SMALLCHAR_HEIGHT;
ADDRLP4 4
CNSTI4 16
ASGNI4
line 704
;704:	}
ADDRGP4 $285
JUMPV
LABELV $284
line 705
;705:	else if (style & UI_GIANTFONT)
ADDRFP4 12
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $286
line 706
;706:	{
line 707
;707:		charw =	GIANTCHAR_WIDTH;
ADDRLP4 0
CNSTI4 32
ASGNI4
line 708
;708:		charh =	GIANTCHAR_HEIGHT;
ADDRLP4 4
CNSTI4 48
ASGNI4
line 709
;709:	}
ADDRGP4 $287
JUMPV
LABELV $286
line 711
;710:	else
;711:	{
line 712
;712:		charw =	BIGCHAR_WIDTH;
ADDRLP4 0
CNSTI4 16
ASGNI4
line 713
;713:		charh =	BIGCHAR_HEIGHT;
ADDRLP4 4
CNSTI4 16
ASGNI4
line 714
;714:	}
LABELV $287
LABELV $285
line 716
;715:
;716:	if (style & UI_PULSE)
ADDRFP4 12
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $288
line 717
;717:	{
line 718
;718:		lowlight[0] = 0.8*color[0]; 
ADDRLP4 8
ADDRFP4 16
INDIRP4
INDIRF4
CNSTF4 1061997773
MULF4
ASGNF4
line 719
;719:		lowlight[1] = 0.8*color[1];
ADDRLP4 8+4
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1061997773
MULF4
ASGNF4
line 720
;720:		lowlight[2] = 0.8*color[2];
ADDRLP4 8+8
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1061997773
MULF4
ASGNF4
line 721
;721:		lowlight[3] = 0.8*color[3];
ADDRLP4 8+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CNSTF4 1061997773
MULF4
ASGNF4
line 722
;722:		UI_LerpColor(color,lowlight,newcolor,0.5+0.5*sin(uis.realtime/PULSE_DIVISOR));
ADDRGP4 uis+4
INDIRI4
CNSTI4 75
DIVI4
CVIF4 4
ARGF4
ADDRLP4 64
ADDRGP4 sin
CALLF4
ASGNF4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 44
ARGP4
ADDRLP4 64
INDIRF4
CNSTF4 1056964608
MULF4
CNSTF4 1056964608
ADDF4
ARGF4
ADDRGP4 UI_LerpColor
CALLV
pop
line 723
;723:		drawcolor = newcolor;
ADDRLP4 24
ADDRLP4 44
ASGNP4
line 724
;724:	}	
ADDRGP4 $289
JUMPV
LABELV $288
line 726
;725:	else
;726:		drawcolor = color;
ADDRLP4 24
ADDRFP4 16
INDIRP4
ASGNP4
LABELV $289
line 728
;727:
;728:	switch (style & UI_FORMATMASK)
ADDRLP4 64
ADDRFP4 12
INDIRI4
CNSTI4 7
BANDI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 1
EQI4 $297
ADDRLP4 64
INDIRI4
CNSTI4 2
EQI4 $298
ADDRGP4 $295
JUMPV
line 729
;729:	{
LABELV $297
line 732
;730:		case UI_CENTER:
;731:			// center justify at x
;732:			len = strlen(str);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 60
ADDRLP4 72
INDIRI4
ASGNI4
line 733
;733:			x   = x - len*charw/2;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 60
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 734
;734:			break;
ADDRGP4 $295
JUMPV
LABELV $298
line 738
;735:
;736:		case UI_RIGHT:
;737:			// right justify at x
;738:			len = strlen(str);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 60
ADDRLP4 76
INDIRI4
ASGNI4
line 739
;739:			x   = x - len*charw;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 60
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
SUBI4
ASGNI4
line 740
;740:			break;
line 744
;741:
;742:		default:
;743:			// left justify at x
;744:			break;
LABELV $295
line 747
;745:	}
;746:
;747:	if ( style & UI_DROPSHADOW )
ADDRFP4 12
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $299
line 748
;748:	{
line 749
;749:		dropcolor[0] = dropcolor[1] = dropcolor[2] = 0;
ADDRLP4 72
CNSTF4 0
ASGNF4
ADDRLP4 28+8
ADDRLP4 72
INDIRF4
ASGNF4
ADDRLP4 28+4
ADDRLP4 72
INDIRF4
ASGNF4
ADDRLP4 28
ADDRLP4 72
INDIRF4
ASGNF4
line 750
;750:		dropcolor[3] = drawcolor[3];
ADDRLP4 28+12
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 751
;751:		UI_DrawString2(x+2,y+2,str,dropcolor,charw,charh);
ADDRFP4 0
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 UI_DrawString2
CALLV
pop
line 752
;752:	}
LABELV $299
line 754
;753:
;754:	UI_DrawString2(x,y,str,drawcolor,charw,charh);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 UI_DrawString2
CALLV
pop
line 755
;755:}
LABELV $278
endproc UI_DrawString 80 24
export UI_DrawChar
proc UI_DrawChar 2 20
line 764
;756:
;757:
;758:/*
;759:=================
;760:UI_DrawChar
;761:=================
;762:*/
;763:void UI_DrawChar( int x, int y, int ch, int style, vec4_t color )
;764:{
line 767
;765:	char	buff[2];
;766:
;767:	buff[0] = ch;
ADDRLP4 0
ADDRFP4 8
INDIRI4
CVII1 4
ASGNI1
line 768
;768:	buff[1] = '\0';
ADDRLP4 0+1
CNSTI1 0
ASGNI1
line 770
;769:
;770:	UI_DrawString( x, y, buff, style, color );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 771
;771:}
LABELV $304
endproc UI_DrawChar 2 20
export UI_IsFullscreen
proc UI_IsFullscreen 4 0
line 774
;772:
;773:
;774:qboolean UI_IsFullscreen( void ) {
line 775
;775:	if ( uis.activemenu && ( trap_Key_GetCatcher() & KEYCATCH_UI ) ) {
ADDRGP4 uis+20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $307
ADDRLP4 0
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $307
line 776
;776:		return uis.activemenu->fullscreen;
ADDRGP4 uis+20
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
RETI4
ADDRGP4 $306
JUMPV
LABELV $307
line 779
;777:	}
;778:
;779:	return qfalse;
CNSTI4 0
RETI4
LABELV $306
endproc UI_IsFullscreen 4 0
proc NeedCDAction 0 8
line 783
;780:}
;781:
;782:
;783:static void NeedCDAction( qboolean result ) {
line 784
;784:	if ( !result ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $312
line 785
;785:		trap_Cmd_ExecuteText( EXEC_APPEND, "quit\n" );
CNSTI4 2
ARGI4
ADDRGP4 $314
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 786
;786:	}
LABELV $312
line 787
;787:}
LABELV $311
endproc NeedCDAction 0 8
proc NeedCDKeyAction 0 8
line 789
;788:
;789:static void NeedCDKeyAction( qboolean result ) {
line 790
;790:	if ( !result ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $316
line 791
;791:		trap_Cmd_ExecuteText( EXEC_APPEND, "quit\n" );
CNSTI4 2
ARGI4
ADDRGP4 $314
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 792
;792:	}
LABELV $316
line 793
;793:}
LABELV $315
endproc NeedCDKeyAction 0 8
export UI_SetActiveMenu
proc UI_SetActiveMenu 8 12
line 796
;794:
;795:
;796:void UI_SetActiveMenu( uiMenuCommand_t menu ) {
line 799
;797:	// this should be the ONLY way the menu system is brought up
;798:	// enusure minumum menu data is cached
;799:	Menu_Cache();
ADDRGP4 Menu_Cache
CALLV
pop
line 801
;800:
;801:	switch ( menu ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $319
ADDRLP4 0
INDIRI4
CNSTI4 6
GTI4 $319
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $332
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $332
address $322
address $323
address $328
address $324
address $326
address $330
address $330
code
LABELV $322
line 803
;802:	case UIMENU_NONE:
;803:		UI_ForceMenuOff();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 804
;804:		return;
ADDRGP4 $318
JUMPV
LABELV $323
line 806
;805:	case UIMENU_MAIN:
;806:		UI_MainMenu();
ADDRGP4 UI_MainMenu
CALLV
pop
line 807
;807:		return;
ADDRGP4 $318
JUMPV
LABELV $324
line 809
;808:	case UIMENU_NEED_CD:
;809:		UI_ConfirmMenu( "Insert the CD", (voidfunc_f)NULL, NeedCDAction );
ADDRGP4 $325
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 NeedCDAction
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 810
;810:		return;
ADDRGP4 $318
JUMPV
LABELV $326
line 812
;811:	case UIMENU_BAD_CD_KEY:
;812:		UI_ConfirmMenu( "Bad CD Key", (voidfunc_f)NULL, NeedCDKeyAction );
ADDRGP4 $327
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 NeedCDKeyAction
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 813
;813:		return;
ADDRGP4 $318
JUMPV
LABELV $328
line 820
;814:	case UIMENU_INGAME:
;815:		/*
;816:		//GRank
;817:		UI_RankingsMenu();
;818:		return;
;819:		*/
;820:		trap_Cvar_Set( "cl_paused", "1" );
ADDRGP4 $124
ARGP4
ADDRGP4 $329
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 821
;821:		UI_InGameMenu();
ADDRGP4 UI_InGameMenu
CALLV
pop
line 822
;822:		return;
ADDRGP4 $318
JUMPV
LABELV $330
LABELV $319
line 829
;823:		
;824:	// bk001204
;825:	case UIMENU_TEAM:
;826:	case UIMENU_POSTGAME:
;827:	default:
;828:#ifndef NDEBUG
;829:	  Com_Printf("UI_SetActiveMenu: bad enum %d\n", menu );
ADDRGP4 $331
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 831
;830:#endif
;831:	  break;
LABELV $320
line 833
;832:	}
;833:}
LABELV $318
endproc UI_SetActiveMenu 8 12
export UI_KeyEvent
proc UI_KeyEvent 20 8
line 841
;834:
;835:
;836:/*
;837:=================
;838:UI_KeyEvent
;839:=================
;840:*/
;841:void UI_KeyEvent( int key, int down ) {
line 844
;842:	sfxHandle_t		s;
;843:
;844:	UI_VideoCheck( trap_Milliseconds() );
ADDRLP4 4
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 UI_VideoCheck
CALLV
pop
line 845
;845:	if (!uis.activemenu) {
ADDRGP4 uis+20
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $334
line 846
;846:		return;
ADDRGP4 $333
JUMPV
LABELV $334
line 849
;847:	}
;848:
;849:	if (!down) {
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $337
line 850
;850:		return;
ADDRGP4 $333
JUMPV
LABELV $337
line 853
;851:	}
;852:
;853:	if (uis.activemenu->key)
ADDRGP4 uis+20
INDIRP4
CNSTI4 272
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $339
line 854
;854:		s = uis.activemenu->key( key );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 uis+20
INDIRP4
CNSTI4 272
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
ADDRGP4 $340
JUMPV
LABELV $339
line 856
;855:	else
;856:		s = Menu_DefaultKey( uis.activemenu, key );
ADDRGP4 uis+20
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
LABELV $340
line 858
;857:
;858:	if ((s > 0) && (s != menu_null_sound))
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $344
ADDRLP4 0
INDIRI4
ADDRGP4 menu_null_sound
INDIRI4
EQI4 $344
line 859
;859:		trap_S_StartLocalSound( s, CHAN_LOCAL_SOUND );
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
LABELV $344
line 860
;860:}
LABELV $333
endproc UI_KeyEvent 20 8
export UI_MouseEvent
proc UI_MouseEvent 24 8
line 869
;861:
;862:
;863:/*
;864:=================
;865:UI_MouseEvent
;866:=================
;867:*/
;868:void UI_MouseEvent( int dx, int dy )
;869:{
line 873
;870:	int				i;
;871:	menucommon_s*	m;
;872:
;873:	if ( !uis.activemenu )
ADDRGP4 uis+20
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $347
line 874
;874:		return;
ADDRGP4 $346
JUMPV
LABELV $347
line 877
;875:
;876:	// update virtual mouse cursor coordinates
;877:	uis.cursorx += dx * uis.cursorScaleR;
ADDRLP4 8
ADDRGP4 uis+8
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRGP4 uis+11444
INDIRF4
MULF4
ADDF4
ASGNF4
line 878
;878:	uis.cursory += dy * uis.cursorScaleR;
ADDRLP4 12
ADDRGP4 uis+12
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRFP4 4
INDIRI4
CVIF4 4
ADDRGP4 uis+11444
INDIRF4
MULF4
ADDF4
ASGNF4
line 881
;879:	
;880:	// clamp virtual coordinates
;881:	if ( uis.cursorx < uis.screenXmin )
ADDRGP4 uis+8
INDIRF4
ADDRGP4 uis+11448
INDIRF4
GEF4 $354
line 882
;882:		uis.cursorx = uis.screenXmin;
ADDRGP4 uis+8
ADDRGP4 uis+11448
INDIRF4
ASGNF4
ADDRGP4 $355
JUMPV
LABELV $354
line 883
;883:	else if ( uis.cursorx > uis.screenXmax )
ADDRGP4 uis+8
INDIRF4
ADDRGP4 uis+11452
INDIRF4
LEF4 $360
line 884
;884:		uis.cursorx = uis.screenXmax;
ADDRGP4 uis+8
ADDRGP4 uis+11452
INDIRF4
ASGNF4
LABELV $360
LABELV $355
line 886
;885:
;886:	if ( uis.cursory < uis.screenYmin )
ADDRGP4 uis+12
INDIRF4
ADDRGP4 uis+11456
INDIRF4
GEF4 $366
line 887
;887:		uis.cursory = uis.screenYmin;
ADDRGP4 uis+12
ADDRGP4 uis+11456
INDIRF4
ASGNF4
ADDRGP4 $367
JUMPV
LABELV $366
line 888
;888:	else if ( uis.cursory > uis.screenYmax )
ADDRGP4 uis+12
INDIRF4
ADDRGP4 uis+11460
INDIRF4
LEF4 $372
line 889
;889:		uis.cursory = uis.screenYmax;
ADDRGP4 uis+12
ADDRGP4 uis+11460
INDIRF4
ASGNF4
LABELV $372
LABELV $367
line 892
;890:
;891:	// region test the active menu items
;892:	for ( i = 0; i < uis.activemenu->nitems; i++ )
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $381
JUMPV
LABELV $378
line 893
;893:	{
line 894
;894:		m = (menucommon_s*)uis.activemenu->items[i];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uis+20
INDIRP4
CNSTI4 12
ADDP4
ADDP4
INDIRP4
ASGNP4
line 896
;895:
;896:		if (m->flags & (QMF_GRAYED|QMF_INACTIVE))
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 24576
BANDU4
CNSTU4 0
EQU4 $384
line 897
;897:			continue;
ADDRGP4 $379
JUMPV
LABELV $384
line 899
;898:
;899:		if ((uis.cursorx < m->left) ||
ADDRGP4 uis+8
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
LTF4 $394
ADDRGP4 uis+8
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CVIF4 4
GTF4 $394
ADDRGP4 uis+12
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
LTF4 $394
ADDRGP4 uis+12
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CVIF4 4
LEF4 $386
LABELV $394
line 903
;900:			(uis.cursorx > m->right) ||
;901:			(uis.cursory < m->top) ||
;902:			(uis.cursory > m->bottom))
;903:		{
line 905
;904:			// cursor out of item bounds
;905:			continue;
ADDRGP4 $379
JUMPV
LABELV $386
line 909
;906:		}
;907:
;908:		// set focus to item at cursor
;909:		if (uis.activemenu->cursor != i)
ADDRGP4 uis+20
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $395
line 910
;910:		{
line 911
;911:			Menu_SetCursor( uis.activemenu, i );
ADDRGP4 uis+20
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 Menu_SetCursor
CALLV
pop
line 912
;912:			((menucommon_s*)(uis.activemenu->items[uis.activemenu->cursor_prev]))->flags &= ~QMF_HASMOUSEFOCUS;
ADDRLP4 20
ADDRGP4 uis+20
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uis+20
INDIRP4
CNSTI4 12
ADDP4
ADDP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 4294966783
BANDU4
ASGNU4
line 914
;913:
;914:			if ( !(((menucommon_s*)(uis.activemenu->items[uis.activemenu->cursor]))->flags & QMF_SILENT ) ) {
ADDRGP4 uis+20
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uis+20
INDIRP4
CNSTI4 12
ADDP4
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 1048576
BANDU4
CNSTU4 0
NEU4 $401
line 915
;915:				trap_S_StartLocalSound( menu_move_sound, CHAN_LOCAL_SOUND );
ADDRGP4 menu_move_sound
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 916
;916:			}
LABELV $401
line 917
;917:		}
LABELV $395
line 919
;918:
;919:		((menucommon_s*)(uis.activemenu->items[uis.activemenu->cursor]))->flags |= QMF_HASMOUSEFOCUS;
ADDRLP4 20
ADDRGP4 uis+20
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uis+20
INDIRP4
CNSTI4 12
ADDP4
ADDP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 512
BORU4
ASGNU4
line 920
;920:		return;
ADDRGP4 $346
JUMPV
LABELV $379
line 892
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $381
ADDRLP4 4
INDIRI4
ADDRGP4 uis+20
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
LTI4 $378
line 923
;921:	}  
;922:
;923:	if (uis.activemenu->nitems > 0) {
ADDRGP4 uis+20
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 0
LEI4 $407
line 925
;924:		// out of any region
;925:		((menucommon_s*)(uis.activemenu->items[uis.activemenu->cursor]))->flags &= ~QMF_HASMOUSEFOCUS;
ADDRLP4 16
ADDRGP4 uis+20
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uis+20
INDIRP4
CNSTI4 12
ADDP4
ADDP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 4294966783
BANDU4
ASGNU4
line 926
;926:	}
LABELV $407
line 927
;927:}
LABELV $346
endproc UI_MouseEvent 24 8
bss
align 1
LABELV $413
skip 1024
export UI_Argv
code
proc UI_Argv 0 12
line 930
;928:
;929:
;930:char *UI_Argv( int arg ) {
line 933
;931:	static char	buffer[MAX_STRING_CHARS];
;932:
;933:	trap_Argv( arg, buffer, sizeof( buffer ) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $413
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 935
;934:
;935:	return buffer;
ADDRGP4 $413
RETP4
LABELV $412
endproc UI_Argv 0 12
bss
align 1
LABELV $415
skip 1024
export UI_Cvar_VariableString
code
proc UI_Cvar_VariableString 0 12
line 939
;936:}
;937:
;938:
;939:char *UI_Cvar_VariableString( const char *var_name ) {
line 942
;940:	static char	buffer[MAX_STRING_CHARS];
;941:
;942:	trap_Cvar_VariableStringBuffer( var_name, buffer, sizeof( buffer ) );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $415
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 944
;943:
;944:	return buffer;
ADDRGP4 $415
RETP4
LABELV $414
endproc UI_Cvar_VariableString 0 12
export UI_Cache_f
proc UI_Cache_f 0 0
line 953
;945:}
;946:
;947:
;948:/*
;949:=================
;950:UI_Cache
;951:=================
;952:*/
;953:void UI_Cache_f( void ) {
line 954
;954:	MainMenu_Cache();
ADDRGP4 MainMenu_Cache
CALLV
pop
line 955
;955:	InGame_Cache();
ADDRGP4 InGame_Cache
CALLV
pop
line 956
;956:	ConfirmMenu_Cache();
ADDRGP4 ConfirmMenu_Cache
CALLV
pop
line 957
;957:	PlayerModel_Cache();
ADDRGP4 PlayerModel_Cache
CALLV
pop
line 958
;958:	PlayerSettings_Cache();
ADDRGP4 PlayerSettings_Cache
CALLV
pop
line 959
;959:	Controls_Cache();
ADDRGP4 Controls_Cache
CALLV
pop
line 960
;960:	Demos_Cache();
ADDRGP4 Demos_Cache
CALLV
pop
line 961
;961:	UI_CinematicsMenu_Cache();
ADDRGP4 UI_CinematicsMenu_Cache
CALLV
pop
line 962
;962:	Preferences_Cache();
ADDRGP4 Preferences_Cache
CALLV
pop
line 963
;963:	ServerInfo_Cache();
ADDRGP4 ServerInfo_Cache
CALLV
pop
line 964
;964:	SpecifyServer_Cache();
ADDRGP4 SpecifyServer_Cache
CALLV
pop
line 965
;965:	ArenaServers_Cache();
ADDRGP4 ArenaServers_Cache
CALLV
pop
line 966
;966:	StartServer_Cache();
ADDRGP4 StartServer_Cache
CALLV
pop
line 967
;967:	ServerOptions_Cache();
ADDRGP4 ServerOptions_Cache
CALLV
pop
line 968
;968:	DriverInfo_Cache();
ADDRGP4 DriverInfo_Cache
CALLV
pop
line 969
;969:	GraphicsOptions_Cache();
ADDRGP4 GraphicsOptions_Cache
CALLV
pop
line 970
;970:	UI_DisplayOptionsMenu_Cache();
ADDRGP4 UI_DisplayOptionsMenu_Cache
CALLV
pop
line 971
;971:	UI_SoundOptionsMenu_Cache();
ADDRGP4 UI_SoundOptionsMenu_Cache
CALLV
pop
line 972
;972:	UI_NetworkOptionsMenu_Cache();
ADDRGP4 UI_NetworkOptionsMenu_Cache
CALLV
pop
line 973
;973:	UI_SPLevelMenu_Cache();
ADDRGP4 UI_SPLevelMenu_Cache
CALLV
pop
line 974
;974:	UI_SPSkillMenu_Cache();
ADDRGP4 UI_SPSkillMenu_Cache
CALLV
pop
line 975
;975:	UI_SPPostgameMenu_Cache();
ADDRGP4 UI_SPPostgameMenu_Cache
CALLV
pop
line 976
;976:	TeamMain_Cache();
ADDRGP4 TeamMain_Cache
CALLV
pop
line 977
;977:	UI_AddBots_Cache();
ADDRGP4 UI_AddBots_Cache
CALLV
pop
line 978
;978:	UI_RemoveBots_Cache();
ADDRGP4 UI_RemoveBots_Cache
CALLV
pop
line 979
;979:	UI_SetupMenu_Cache();
ADDRGP4 UI_SetupMenu_Cache
CALLV
pop
line 982
;980://	UI_LoadConfig_Cache();
;981://	UI_SaveConfigMenu_Cache();
;982:	UI_BotSelectMenu_Cache();
ADDRGP4 UI_BotSelectMenu_Cache
CALLV
pop
line 983
;983:	UI_CDKeyMenu_Cache();
ADDRGP4 UI_CDKeyMenu_Cache
CALLV
pop
line 984
;984:	UI_ModsMenu_Cache();
ADDRGP4 UI_ModsMenu_Cache
CALLV
pop
line 985
;985:}
LABELV $416
endproc UI_Cache_f 0 0
export UI_ConsoleCommand
proc UI_ConsoleCommand 40 8
line 993
;986:
;987:
;988:/*
;989:=================
;990:UI_ConsoleCommand
;991:=================
;992:*/
;993:qboolean UI_ConsoleCommand( int realTime ) {
line 996
;994:	char	*cmd;
;995:
;996:	uis.frametime = realTime - uis.realtime;
ADDRGP4 uis
ADDRFP4 0
INDIRI4
ADDRGP4 uis+4
INDIRI4
SUBI4
ASGNI4
line 997
;997:	uis.realtime = realTime;
ADDRGP4 uis+4
ADDRFP4 0
INDIRI4
ASGNI4
line 999
;998:
;999:	cmd = UI_Argv( 0 );
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1002
;1000:
;1001:	// ensure minimum menu data is available
;1002:	Menu_Cache();
ADDRGP4 Menu_Cache
CALLV
pop
line 1004
;1003:
;1004:	if ( Q_stricmp (cmd, "levelselect") == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $422
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $420
line 1005
;1005:		UI_SPLevelMenu_f();
ADDRGP4 UI_SPLevelMenu_f
CALLV
pop
line 1006
;1006:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $417
JUMPV
LABELV $420
line 1009
;1007:	}
;1008:
;1009:	if ( Q_stricmp (cmd, "postgame") == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $425
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $423
line 1010
;1010:		UI_SPPostgameMenu_f();
ADDRGP4 UI_SPPostgameMenu_f
CALLV
pop
line 1011
;1011:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $417
JUMPV
LABELV $423
line 1014
;1012:	}
;1013:
;1014:	if ( Q_stricmp (cmd, "ui_cache") == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $428
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $426
line 1015
;1015:		UI_Cache_f();
ADDRGP4 UI_Cache_f
CALLV
pop
line 1016
;1016:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $417
JUMPV
LABELV $426
line 1019
;1017:	}
;1018:
;1019:	if ( Q_stricmp (cmd, "ui_cinematics") == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $431
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $429
line 1020
;1020:		UI_CinematicsMenu_f();
ADDRGP4 UI_CinematicsMenu_f
CALLV
pop
line 1021
;1021:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $417
JUMPV
LABELV $429
line 1024
;1022:	}
;1023:
;1024:	if ( Q_stricmp (cmd, "ui_teamOrders") == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $434
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $432
line 1025
;1025:		UI_TeamOrdersMenu_f();
ADDRGP4 UI_TeamOrdersMenu_f
CALLV
pop
line 1026
;1026:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $417
JUMPV
LABELV $432
line 1029
;1027:	}
;1028:
;1029:	if ( Q_stricmp (cmd, "iamacheater") == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $437
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $435
line 1030
;1030:		UI_SPUnlock_f();
ADDRGP4 UI_SPUnlock_f
CALLV
pop
line 1031
;1031:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $417
JUMPV
LABELV $435
line 1034
;1032:	}
;1033:
;1034:	if ( Q_stricmp (cmd, "iamamonkey") == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $440
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $438
line 1035
;1035:		UI_SPUnlockMedals_f();
ADDRGP4 UI_SPUnlockMedals_f
CALLV
pop
line 1036
;1036:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $417
JUMPV
LABELV $438
line 1039
;1037:	}
;1038:
;1039:	if ( Q_stricmp (cmd, "ui_cdkey") == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $443
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $441
line 1040
;1040:		UI_CDKeyMenu_f();
ADDRGP4 UI_CDKeyMenu_f
CALLV
pop
line 1041
;1041:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $417
JUMPV
LABELV $441
line 1044
;1042:	}
;1043:
;1044:	return qfalse;
CNSTI4 0
RETI4
LABELV $417
endproc UI_ConsoleCommand 40 8
export UI_Shutdown
proc UI_Shutdown 0 0
line 1053
;1045:}
;1046:
;1047:
;1048:/*
;1049:=================
;1050:UI_Shutdown
;1051:=================
;1052:*/
;1053:void UI_Shutdown( void ) {
line 1054
;1054:}
LABELV $444
endproc UI_Shutdown 0 0
export UI_Init
proc UI_Init 0 4
line 1062
;1055:
;1056:
;1057:/*
;1058:=================
;1059:UI_Init
;1060:=================
;1061:*/
;1062:void UI_Init( void ) {
line 1063
;1063:	UI_RegisterCvars();
ADDRGP4 UI_RegisterCvars
CALLV
pop
line 1065
;1064:
;1065:	UI_InitGameinfo();
ADDRGP4 UI_InitGameinfo
CALLV
pop
line 1068
;1066:
;1067:	// cache redundant calulations
;1068:	UI_VideoCheck( -99999 );
CNSTI4 -99999
ARGI4
ADDRGP4 UI_VideoCheck
CALLV
pop
line 1071
;1069:
;1070:	// initialize the menu system
;1071:	Menu_Cache();
ADDRGP4 Menu_Cache
CALLV
pop
line 1073
;1072:
;1073:	uis.activemenu = NULL;
ADDRGP4 uis+20
CNSTP4 0
ASGNP4
line 1074
;1074:	uis.menusp     = 0;
ADDRGP4 uis+16
CNSTI4 0
ASGNI4
line 1075
;1075:}
LABELV $445
endproc UI_Init 0 4
export UI_AdjustFrom640
proc UI_AdjustFrom640 16 0
line 1085
;1076:
;1077:
;1078:/*
;1079:================
;1080:UI_AdjustFrom640
;1081:
;1082:Adjusted for resolution and screen aspect ratio
;1083:================
;1084:*/
;1085:void UI_AdjustFrom640( float *x, float *y, float *w, float *h ) {
line 1087
;1086:	// expect valid pointers
;1087:	*x = *x * uis.scale + uis.biasX;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRGP4 uis+11432
INDIRF4
MULF4
ADDRGP4 uis+11436
INDIRF4
ADDF4
ASGNF4
line 1088
;1088:	*y = *y * uis.scale + uis.biasY;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRGP4 uis+11432
INDIRF4
MULF4
ADDRGP4 uis+11440
INDIRF4
ADDF4
ASGNF4
line 1089
;1089:	*w *= uis.scale;
ADDRLP4 8
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRGP4 uis+11432
INDIRF4
MULF4
ASGNF4
line 1090
;1090:	*h *= uis.scale;
ADDRLP4 12
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRGP4 uis+11432
INDIRF4
MULF4
ASGNF4
line 1091
;1091:}
LABELV $448
endproc UI_AdjustFrom640 16 0
export UI_DrawNamedPic
proc UI_DrawNamedPic 8 36
line 1094
;1092:
;1093:
;1094:void UI_DrawNamedPic( float x, float y, float width, float height, const char *picname ) {
line 1097
;1095:	qhandle_t	hShader;
;1096:
;1097:	hShader = trap_R_RegisterShaderNoMip( picname );
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1098
;1098:	UI_AdjustFrom640( &x, &y, &width, &height );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 1099
;1099:	trap_R_DrawStretchPic( x, y, width, height, 0, 0, 1, 1, hShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1100
;1100:}
LABELV $455
endproc UI_DrawNamedPic 8 36
export UI_DrawHandlePic
proc UI_DrawHandlePic 16 36
line 1103
;1101:
;1102:
;1103:void UI_DrawHandlePic( float x, float y, float w, float h, qhandle_t hShader ) {
line 1109
;1104:	float	s0;
;1105:	float	s1;
;1106:	float	t0;
;1107:	float	t1;
;1108:
;1109:	if( w < 0 ) {	// flip about vertical
ADDRFP4 8
INDIRF4
CNSTF4 0
GEF4 $457
line 1110
;1110:		w  = -w;
ADDRFP4 8
ADDRFP4 8
INDIRF4
NEGF4
ASGNF4
line 1111
;1111:		s0 = 1;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 1112
;1112:		s1 = 0;
ADDRLP4 4
CNSTF4 0
ASGNF4
line 1113
;1113:	}
ADDRGP4 $458
JUMPV
LABELV $457
line 1114
;1114:	else {
line 1115
;1115:		s0 = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1116
;1116:		s1 = 1;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 1117
;1117:	}
LABELV $458
line 1119
;1118:
;1119:	if( h < 0 ) {	// flip about horizontal
ADDRFP4 12
INDIRF4
CNSTF4 0
GEF4 $459
line 1120
;1120:		h  = -h;
ADDRFP4 12
ADDRFP4 12
INDIRF4
NEGF4
ASGNF4
line 1121
;1121:		t0 = 1;
ADDRLP4 8
CNSTF4 1065353216
ASGNF4
line 1122
;1122:		t1 = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 1123
;1123:	}
ADDRGP4 $460
JUMPV
LABELV $459
line 1124
;1124:	else {
line 1125
;1125:		t0 = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 1126
;1126:		t1 = 1;
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
line 1127
;1127:	}
LABELV $460
line 1129
;1128:	
;1129:	UI_AdjustFrom640( &x, &y, &w, &h );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 1130
;1130:	trap_R_DrawStretchPic( x, y, w, h, s0, t0, s1, t1, hShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1131
;1131:}
LABELV $456
endproc UI_DrawHandlePic 16 36
proc UI_DrawCursor 0 36
line 1134
;1132:
;1133:
;1134:static void UI_DrawCursor( float x, float y, float w, float h ) {
line 1136
;1135:
;1136:	UI_AdjustFrom640( &x, &y, &w, &h );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 1137
;1137:	trap_R_DrawStretchPic( x, y, w, h, 0, 0, 1, 1, uis.cursor );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 uis+11420
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1138
;1138:}
LABELV $461
endproc UI_DrawCursor 0 36
export UI_FillRect
proc UI_FillRect 0 36
line 1148
;1139:
;1140:
;1141:/*
;1142:================
;1143:UI_FillRect
;1144:
;1145:Coordinates are 640*480 virtual values
;1146:=================
;1147:*/
;1148:void UI_FillRect( float x, float y, float width, float height, const float *color ) {
line 1149
;1149:	trap_R_SetColor( color );
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1151
;1150:
;1151:	UI_AdjustFrom640( &x, &y, &width, &height );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 1152
;1152:	trap_R_DrawStretchPic( x, y, width, height, 0, 0, 0, 0, uis.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
ADDRGP4 uis+11392
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1154
;1153:
;1154:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1155
;1155:}
LABELV $463
endproc UI_FillRect 0 36
export UI_DrawRect
proc UI_DrawRect 0 36
line 1164
;1156:
;1157:/*
;1158:================
;1159:UI_DrawRect
;1160:
;1161:Coordinates are 640*480 virtual values
;1162:=================
;1163:*/
;1164:void UI_DrawRect( float x, float y, float width, float height, const float *color ) {
line 1165
;1165:	trap_R_SetColor( color );
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1167
;1166:
;1167:	UI_AdjustFrom640( &x, &y, &width, &height );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 1169
;1168:
;1169:	trap_R_DrawStretchPic( x, y, width, 1, 0, 0, 0, 0, uis.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
ADDRGP4 uis+11392
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1170
;1170:	trap_R_DrawStretchPic( x, y, 1, height, 0, 0, 0, 0, uis.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
ADDRGP4 uis+11392
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1171
;1171:	trap_R_DrawStretchPic( x, y + height - 1, width, 1, 0, 0, 0, 0, uis.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRFP4 12
INDIRF4
ADDF4
CNSTF4 1065353216
SUBF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
ADDRGP4 uis+11392
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1172
;1172:	trap_R_DrawStretchPic( x + width - 1, y, 1, height, 0, 0, 0, 0, uis.whiteShader );
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
CNSTF4 1065353216
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
ADDRGP4 uis+11392
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1174
;1173:
;1174:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1175
;1175:}
LABELV $465
endproc UI_DrawRect 0 36
export UI_SetColor
proc UI_SetColor 0 4
line 1177
;1176:
;1177:void UI_SetColor( const float *rgba ) {
line 1178
;1178:	trap_R_SetColor( rgba );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1179
;1179:}
LABELV $470
endproc UI_SetColor 0 4
export UI_UpdateScreen
proc UI_UpdateScreen 0 0
line 1181
;1180:
;1181:void UI_UpdateScreen( void ) {
line 1182
;1182:	trap_UpdateScreen();
ADDRGP4 trap_UpdateScreen
CALLV
pop
line 1183
;1183:}
LABELV $471
endproc UI_UpdateScreen 0 0
export UI_Refresh
proc UI_Refresh 8 36
line 1191
;1184:
;1185:/*
;1186:=================
;1187:UI_Refresh
;1188:=================
;1189:*/
;1190:void UI_Refresh( int realtime )
;1191:{
line 1192
;1192:	uis.frametime = realtime - uis.realtime;
ADDRGP4 uis
ADDRFP4 0
INDIRI4
ADDRGP4 uis+4
INDIRI4
SUBI4
ASGNI4
line 1193
;1193:	uis.realtime  = realtime;
ADDRGP4 uis+4
ADDRFP4 0
INDIRI4
ASGNI4
line 1195
;1194:
;1195:	if ( !( trap_Key_GetCatcher() & KEYCATCH_UI ) ) {
ADDRLP4 0
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $475
line 1196
;1196:		return;
ADDRGP4 $472
JUMPV
LABELV $475
line 1199
;1197:	}
;1198:
;1199:	UI_UpdateCvars();
ADDRGP4 UI_UpdateCvars
CALLV
pop
line 1201
;1200:
;1201:	UI_VideoCheck( realtime );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 UI_VideoCheck
CALLV
pop
line 1203
;1202:	
;1203:	if ( uis.activemenu )
ADDRGP4 uis+20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $477
line 1204
;1204:	{
line 1205
;1205:		if (uis.activemenu->fullscreen)
ADDRGP4 uis+20
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 0
EQI4 $480
line 1206
;1206:		{
line 1208
;1207:			// draw the background
;1208:			trap_R_DrawStretchPic( 0, 0, uis.glconfig.vidWidth, uis.glconfig.vidHeight, 0, 0, 1, 1, uis.menuBackNoLogoShader );
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
ADDRGP4 uis+56+11304
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 uis+56+11308
INDIRI4
CVIF4 4
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 uis+11400
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1209
;1209:			if ( uis.activemenu->showlogo ) {
ADDRGP4 uis+20
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 0
EQI4 $488
line 1210
;1210:				UI_DrawHandlePic( 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, uis.menuBackShader );
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
ADDRGP4 uis+11396
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1211
;1211:			}
LABELV $488
line 1212
;1212:		}
LABELV $480
line 1214
;1213:
;1214:		if (uis.activemenu->draw)
ADDRGP4 uis+20
INDIRP4
CNSTI4 268
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $492
line 1215
;1215:			uis.activemenu->draw();
ADDRGP4 uis+20
INDIRP4
CNSTI4 268
ADDP4
INDIRP4
CALLV
pop
ADDRGP4 $493
JUMPV
LABELV $492
line 1217
;1216:		else
;1217:			Menu_Draw( uis.activemenu );
ADDRGP4 uis+20
INDIRP4
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
LABELV $493
line 1219
;1218:
;1219:		if( uis.firstdraw ) {
ADDRGP4 uis+11468
INDIRI4
CNSTI4 0
EQI4 $497
line 1220
;1220:			UI_MouseEvent( 0, 0 );
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 UI_MouseEvent
CALLV
pop
line 1221
;1221:			uis.firstdraw = qfalse;
ADDRGP4 uis+11468
CNSTI4 0
ASGNI4
line 1222
;1222:		}
LABELV $497
line 1223
;1223:	}
LABELV $477
line 1226
;1224:
;1225:	// draw cursor
;1226:	UI_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 UI_SetColor
CALLV
pop
line 1227
;1227:	UI_DrawCursor( uis.cursorx-16, uis.cursory-16, 32, 32 );
ADDRGP4 uis+8
INDIRF4
CNSTF4 1098907648
SUBF4
ARGF4
ADDRGP4 uis+12
INDIRF4
CNSTF4 1098907648
SUBF4
ARGF4
CNSTF4 1107296256
ARGF4
CNSTF4 1107296256
ARGF4
ADDRGP4 UI_DrawCursor
CALLV
pop
line 1230
;1228:
;1229:#ifndef NDEBUG
;1230:	if ( uis.debug )
ADDRGP4 uis+11388
INDIRI4
CNSTI4 0
EQI4 $503
line 1231
;1231:	{
line 1233
;1232:		// cursor coordinates
;1233:		UI_DrawString( 0, 0, va( "(%1.1f,%1.1f)", uis.cursorx, uis.cursory ), UI_LEFT|UI_SMALLFONT, colorRed );
ADDRGP4 $506
ARGP4
ADDRGP4 uis+8
INDIRF4
ARGF4
ADDRGP4 uis+12
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 colorRed
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1234
;1234:	}
LABELV $503
line 1240
;1235:#endif
;1236:
;1237:	// delay playing the enter sound until after the
;1238:	// menu has been drawn, to avoid delay while
;1239:	// caching images
;1240:	if (m_entersound)
ADDRGP4 m_entersound
INDIRI4
CNSTI4 0
EQI4 $509
line 1241
;1241:	{
line 1242
;1242:		trap_S_StartLocalSound( menu_in_sound, CHAN_LOCAL_SOUND );
ADDRGP4 menu_in_sound
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 1243
;1243:		m_entersound = qfalse;
ADDRGP4 m_entersound
CNSTI4 0
ASGNI4
line 1244
;1244:	}
LABELV $509
line 1245
;1245:}
LABELV $472
endproc UI_Refresh 8 36
export UI_DrawTextBox
proc UI_DrawTextBox 0 20
line 1248
;1246:
;1247:void UI_DrawTextBox (int x, int y, int width, int lines)
;1248:{
line 1249
;1249:	UI_FillRect( x + BIGCHAR_WIDTH/2, y + BIGCHAR_HEIGHT/2, ( width + 1 ) * BIGCHAR_WIDTH, ( lines + 1 ) * BIGCHAR_HEIGHT, colorBlack );
ADDRFP4 0
INDIRI4
CNSTI4 8
ADDI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CNSTI4 8
ADDI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 16
ADDI4
CVIF4 4
ARGF4
ADDRFP4 12
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 16
ADDI4
CVIF4 4
ARGF4
ADDRGP4 colorBlack
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 1250
;1250:	UI_DrawRect( x + BIGCHAR_WIDTH/2, y + BIGCHAR_HEIGHT/2, ( width + 1 ) * BIGCHAR_WIDTH, ( lines + 1 ) * BIGCHAR_HEIGHT, colorWhite );
ADDRFP4 0
INDIRI4
CNSTI4 8
ADDI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CNSTI4 8
ADDI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 16
ADDI4
CVIF4 4
ARGF4
ADDRFP4 12
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 16
ADDI4
CVIF4 4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawRect
CALLV
pop
line 1251
;1251:}
LABELV $511
endproc UI_DrawTextBox 0 20
export UI_CursorInRect
proc UI_CursorInRect 8 0
line 1254
;1252:
;1253:qboolean UI_CursorInRect (int x, int y, int width, int height)
;1254:{
line 1255
;1255:	if (uis.cursorx < x ||
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRGP4 uis+8
INDIRF4
ADDRLP4 0
INDIRI4
CVIF4 4
LTF4 $521
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRGP4 uis+12
INDIRF4
ADDRLP4 4
INDIRI4
CVIF4 4
LTF4 $521
ADDRGP4 uis+8
INDIRF4
ADDRLP4 0
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
CVIF4 4
GTF4 $521
ADDRGP4 uis+12
INDIRF4
ADDRLP4 4
INDIRI4
ADDRFP4 12
INDIRI4
ADDI4
CVIF4 4
LEF4 $513
LABELV $521
line 1259
;1256:		uis.cursory < y ||
;1257:		uis.cursorx > x+width ||
;1258:		uis.cursory > y+height)
;1259:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $512
JUMPV
LABELV $513
line 1261
;1260:
;1261:	return qtrue;
CNSTI4 1
RETI4
LABELV $512
endproc UI_CursorInRect 8 0
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
bss
export uis
align 4
LABELV uis
skip 11476
export m_entersound
align 4
LABELV m_entersound
skip 4
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
LABELV $506
byte 1 40
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 44
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 41
byte 1 0
align 1
LABELV $443
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 100
byte 1 107
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $440
byte 1 105
byte 1 97
byte 1 109
byte 1 97
byte 1 109
byte 1 111
byte 1 110
byte 1 107
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $437
byte 1 105
byte 1 97
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $434
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 79
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $431
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 105
byte 1 110
byte 1 101
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 99
byte 1 115
byte 1 0
align 1
LABELV $428
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 0
align 1
LABELV $425
byte 1 112
byte 1 111
byte 1 115
byte 1 116
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $422
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $331
byte 1 85
byte 1 73
byte 1 95
byte 1 83
byte 1 101
byte 1 116
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 77
byte 1 101
byte 1 110
byte 1 117
byte 1 58
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 101
byte 1 110
byte 1 117
byte 1 109
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $329
byte 1 49
byte 1 0
align 1
LABELV $327
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 67
byte 1 68
byte 1 32
byte 1 75
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $325
byte 1 73
byte 1 110
byte 1 115
byte 1 101
byte 1 114
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 67
byte 1 68
byte 1 0
align 1
LABELV $314
byte 1 113
byte 1 117
byte 1 105
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $125
byte 1 48
byte 1 0
align 1
LABELV $124
byte 1 99
byte 1 108
byte 1 95
byte 1 112
byte 1 97
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $112
byte 1 85
byte 1 73
byte 1 95
byte 1 80
byte 1 111
byte 1 112
byte 1 77
byte 1 101
byte 1 110
byte 1 117
byte 1 58
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 117
byte 1 110
byte 1 100
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $96
byte 1 85
byte 1 73
byte 1 95
byte 1 80
byte 1 117
byte 1 115
byte 1 104
byte 1 77
byte 1 101
byte 1 110
byte 1 117
byte 1 58
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $79
byte 1 100
byte 1 49
byte 1 10
byte 1 0
