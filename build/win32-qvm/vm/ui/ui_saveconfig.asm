code
proc UI_SaveConfigMenu_BackEvent 0 0
file "..\..\..\..\code\q3_ui\ui_saveconfig.c"
line 43
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=============================================================================
;5:
;6:SAVE CONFIG MENU
;7:
;8:=============================================================================
;9:*/
;10:
;11:#include "ui_local.h"
;12:
;13:
;14:#define ART_BACK0			"menu/art/back_0"
;15:#define ART_BACK1			"menu/art/back_1"	
;16:#define ART_SAVE0			"menu/art/save_0"
;17:#define ART_SAVE1			"menu/art/save_1"
;18:#define ART_BACKGROUND		"menu/art/cut_frame"
;19:
;20:#define ID_NAME			10
;21:#define ID_BACK			11
;22:#define ID_SAVE			12
;23:
;24:
;25:typedef struct {
;26:	menuframework_s	menu;
;27:
;28:	menutext_s		banner;
;29:	menubitmap_s	background;
;30:	menufield_s		savename;
;31:	menubitmap_s	back;
;32:	menubitmap_s	save;
;33:} saveConfig_t;
;34:
;35:static saveConfig_t		saveConfig;
;36:
;37:
;38:/*
;39:===============
;40:UI_SaveConfigMenu_BackEvent
;41:===============
;42:*/
;43:static void UI_SaveConfigMenu_BackEvent( void *ptr, int event ) {
line 44
;44:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $71
line 45
;45:		return;
ADDRGP4 $70
JUMPV
LABELV $71
line 48
;46:	}
;47:
;48:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 49
;49:}
LABELV $70
endproc UI_SaveConfigMenu_BackEvent 0 0
proc UI_SaveConfigMenu_SaveEvent 68 12
line 57
;50:
;51:
;52:/*
;53:===============
;54:UI_SaveConfigMenu_SaveEvent
;55:===============
;56:*/
;57:static void UI_SaveConfigMenu_SaveEvent( void *ptr, int event ) {
line 60
;58:	char	configname[MAX_QPATH];
;59:
;60:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $74
line 61
;61:		return;
ADDRGP4 $73
JUMPV
LABELV $74
line 64
;62:	}
;63:
;64:	if( !saveConfig.savename.field.buffer[0] ) {
ADDRGP4 saveConfig+456+64+12
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $76
line 65
;65:		return;
ADDRGP4 $73
JUMPV
LABELV $76
line 68
;66:	}
;67:
;68:	COM_StripExtension( saveConfig.savename.field.buffer, configname, sizeof( configname ) );
ADDRGP4 saveConfig+456+64+12
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 COM_StripExtension
CALLV
pop
line 69
;69:	trap_Cmd_ExecuteText( EXEC_APPEND, va( "writeconfig %s.cfg\n", configname ) );
ADDRGP4 $84
ARGP4
ADDRLP4 0
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
line 70
;70:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 71
;71:}
LABELV $73
endproc UI_SaveConfigMenu_SaveEvent 68 12
proc UI_SaveConfigMenu_SavenameDraw 24 20
line 79
;72:
;73:
;74:/*
;75:===============
;76:UI_SaveConfigMenu_SavenameDraw
;77:===============
;78:*/
;79:static void UI_SaveConfigMenu_SavenameDraw( void *self ) {
line 84
;80:	menufield_s		*f;
;81:	int				style;
;82:	float			*color;
;83:
;84:	f = (menufield_s *)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 86
;85:
;86:	if( f == Menu_ItemAtCursor( &saveConfig.menu ) ) {
ADDRGP4 saveConfig
ARGP4
ADDRLP4 12
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRP4
CVPU4 4
NEU4 $86
line 87
;87:		style = UI_LEFT|UI_PULSE|UI_SMALLFONT;
ADDRLP4 4
CNSTI4 16400
ASGNI4
line 88
;88:		color = text_color_highlight;
ADDRLP4 8
ADDRGP4 text_color_highlight
ASGNP4
line 89
;89:	}
ADDRGP4 $87
JUMPV
LABELV $86
line 90
;90:	else {
line 91
;91:		style = UI_LEFT|UI_SMALLFONT;
ADDRLP4 4
CNSTI4 16
ASGNI4
line 92
;92:		color = colorRed;
ADDRLP4 8
ADDRGP4 colorRed
ASGNP4
line 93
;93:	}
LABELV $87
line 95
;94:
;95:	UI_DrawProportionalString( 320, 192, "Enter filename:", UI_CENTER|UI_SMALLFONT, color_orange );
CNSTI4 320
ARGI4
CNSTI4 192
ARGI4
ADDRGP4 $88
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 96
;96:	UI_FillRect( f->generic.x, f->generic.y, f->field.widthInChars*SMALLCHAR_WIDTH, SMALLCHAR_HEIGHT, colorBlack );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 3
LSHI4
CVIF4 4
ARGF4
CNSTF4 1098907648
ARGF4
ADDRGP4 colorBlack
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 97
;97:	MField_Draw( &f->field, f->generic.x, f->generic.y, style, color );
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 MField_Draw
CALLV
pop
line 98
;98:}
LABELV $85
endproc UI_SaveConfigMenu_SavenameDraw 24 20
proc UI_SaveConfigMenu_Init 0 12
line 106
;99:
;100:
;101:/*
;102:=================
;103:UI_SaveConfigMenu_Init
;104:=================
;105:*/
;106:static void UI_SaveConfigMenu_Init( void ) {
line 107
;107:	memset( &saveConfig, 0, sizeof(saveConfig) );
ADDRGP4 saveConfig
ARGP4
CNSTI4 0
ARGI4
CNSTI4 980
ARGI4
ADDRGP4 memset
CALLP4
pop
line 109
;108:
;109:	UI_SaveConfigMenu_Cache();
ADDRGP4 UI_SaveConfigMenu_Cache
CALLV
pop
line 110
;110:	saveConfig.menu.wrapAround = qtrue;
ADDRGP4 saveConfig+276
CNSTI4 1
ASGNI4
line 111
;111:	saveConfig.menu.fullscreen = qtrue;
ADDRGP4 saveConfig+280
CNSTI4 1
ASGNI4
line 113
;112:
;113:	saveConfig.banner.generic.type		= MTYPE_BTEXT;
ADDRGP4 saveConfig+288
CNSTI4 10
ASGNI4
line 114
;114:	saveConfig.banner.generic.x			= 320;
ADDRGP4 saveConfig+288+12
CNSTI4 320
ASGNI4
line 115
;115:	saveConfig.banner.generic.y			= 16;
ADDRGP4 saveConfig+288+16
CNSTI4 16
ASGNI4
line 116
;116:	saveConfig.banner.string			= "SAVE CONFIG";
ADDRGP4 saveConfig+288+64
ADDRGP4 $99
ASGNP4
line 117
;117:	saveConfig.banner.color				= color_white;
ADDRGP4 saveConfig+288+72
ADDRGP4 color_white
ASGNP4
line 118
;118:	saveConfig.banner.style				= UI_CENTER;
ADDRGP4 saveConfig+288+68
CNSTI4 1
ASGNI4
line 120
;119:
;120:	saveConfig.background.generic.type		= MTYPE_BITMAP;
ADDRGP4 saveConfig+364
CNSTI4 6
ASGNI4
line 121
;121:	saveConfig.background.generic.name		= ART_BACKGROUND;
ADDRGP4 saveConfig+364+4
ADDRGP4 $107
ASGNP4
line 122
;122:	saveConfig.background.generic.flags		= QMF_INACTIVE;
ADDRGP4 saveConfig+364+44
CNSTU4 16384
ASGNU4
line 123
;123:	saveConfig.background.generic.x			= 142;
ADDRGP4 saveConfig+364+12
CNSTI4 142
ASGNI4
line 124
;124:	saveConfig.background.generic.y			= 118;
ADDRGP4 saveConfig+364+16
CNSTI4 118
ASGNI4
line 125
;125:	saveConfig.background.width				= 359;
ADDRGP4 saveConfig+364+80
CNSTI4 359
ASGNI4
line 126
;126:	saveConfig.background.height			= 256;
ADDRGP4 saveConfig+364+84
CNSTI4 256
ASGNI4
line 128
;127:
;128:	saveConfig.savename.generic.type		= MTYPE_FIELD;
ADDRGP4 saveConfig+456
CNSTI4 4
ASGNI4
line 129
;129:	saveConfig.savename.generic.flags		= QMF_NODEFAULTINIT|QMF_UPPERCASE;
ADDRGP4 saveConfig+456+44
CNSTU4 557056
ASGNU4
line 130
;130:	saveConfig.savename.generic.ownerdraw	= UI_SaveConfigMenu_SavenameDraw;
ADDRGP4 saveConfig+456+56
ADDRGP4 UI_SaveConfigMenu_SavenameDraw
ASGNP4
line 131
;131:	saveConfig.savename.field.widthInChars	= 20;
ADDRGP4 saveConfig+456+64+8
CNSTI4 20
ASGNI4
line 132
;132:	saveConfig.savename.field.maxchars		= 20;
ADDRGP4 saveConfig+456+64+268
CNSTI4 20
ASGNI4
line 133
;133:	saveConfig.savename.generic.x			= 240;
ADDRGP4 saveConfig+456+12
CNSTI4 240
ASGNI4
line 134
;134:	saveConfig.savename.generic.y			= 155+72;
ADDRGP4 saveConfig+456+16
CNSTI4 227
ASGNI4
line 135
;135:	saveConfig.savename.generic.left		= 240;
ADDRGP4 saveConfig+456+20
CNSTI4 240
ASGNI4
line 136
;136:	saveConfig.savename.generic.top			= 155+72;
ADDRGP4 saveConfig+456+24
CNSTI4 227
ASGNI4
line 137
;137:	saveConfig.savename.generic.right		= 233 + 20*SMALLCHAR_WIDTH;
ADDRGP4 saveConfig+456+28
CNSTI4 393
ASGNI4
line 138
;138:	saveConfig.savename.generic.bottom		= 155+72 + SMALLCHAR_HEIGHT+2;
ADDRGP4 saveConfig+456+32
CNSTI4 245
ASGNI4
line 140
;139:
;140:	saveConfig.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 saveConfig+796
CNSTI4 6
ASGNI4
line 141
;141:	saveConfig.back.generic.name		= ART_BACK0;
ADDRGP4 saveConfig+796+4
ADDRGP4 $144
ASGNP4
line 142
;142:	saveConfig.back.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 saveConfig+796+44
CNSTU4 260
ASGNU4
line 143
;143:	saveConfig.back.generic.id			= ID_BACK;
ADDRGP4 saveConfig+796+8
CNSTI4 11
ASGNI4
line 144
;144:	saveConfig.back.generic.callback	= UI_SaveConfigMenu_BackEvent;
ADDRGP4 saveConfig+796+48
ADDRGP4 UI_SaveConfigMenu_BackEvent
ASGNP4
line 145
;145:	saveConfig.back.generic.x			= 0;
ADDRGP4 saveConfig+796+12
CNSTI4 0
ASGNI4
line 146
;146:	saveConfig.back.generic.y			= 480-64;
ADDRGP4 saveConfig+796+16
CNSTI4 416
ASGNI4
line 147
;147:	saveConfig.back.width				= 128;
ADDRGP4 saveConfig+796+80
CNSTI4 128
ASGNI4
line 148
;148:	saveConfig.back.height				= 64;
ADDRGP4 saveConfig+796+84
CNSTI4 64
ASGNI4
line 149
;149:	saveConfig.back.focuspic			= ART_BACK1;
ADDRGP4 saveConfig+796+64
ADDRGP4 $161
ASGNP4
line 151
;150:
;151:	saveConfig.save.generic.type		= MTYPE_BITMAP;
ADDRGP4 saveConfig+888
CNSTI4 6
ASGNI4
line 152
;152:	saveConfig.save.generic.name		= ART_SAVE0;
ADDRGP4 saveConfig+888+4
ADDRGP4 $165
ASGNP4
line 153
;153:	saveConfig.save.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 saveConfig+888+44
CNSTU4 272
ASGNU4
line 154
;154:	saveConfig.save.generic.id			= ID_SAVE;
ADDRGP4 saveConfig+888+8
CNSTI4 12
ASGNI4
line 155
;155:	saveConfig.save.generic.callback	= UI_SaveConfigMenu_SaveEvent;
ADDRGP4 saveConfig+888+48
ADDRGP4 UI_SaveConfigMenu_SaveEvent
ASGNP4
line 156
;156:	saveConfig.save.generic.x			= 640;
ADDRGP4 saveConfig+888+12
CNSTI4 640
ASGNI4
line 157
;157:	saveConfig.save.generic.y			= 480-64;
ADDRGP4 saveConfig+888+16
CNSTI4 416
ASGNI4
line 158
;158:	saveConfig.save.width  				= 128;
ADDRGP4 saveConfig+888+80
CNSTI4 128
ASGNI4
line 159
;159:	saveConfig.save.height  		    = 64;
ADDRGP4 saveConfig+888+84
CNSTI4 64
ASGNI4
line 160
;160:	saveConfig.save.focuspic			= ART_SAVE1;
ADDRGP4 saveConfig+888+64
ADDRGP4 $182
ASGNP4
line 162
;161:
;162:	Menu_AddItem( &saveConfig.menu, &saveConfig.banner );
ADDRGP4 saveConfig
ARGP4
ADDRGP4 saveConfig+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 163
;163:	Menu_AddItem( &saveConfig.menu, &saveConfig.background );
ADDRGP4 saveConfig
ARGP4
ADDRGP4 saveConfig+364
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 164
;164:	Menu_AddItem( &saveConfig.menu, &saveConfig.savename );
ADDRGP4 saveConfig
ARGP4
ADDRGP4 saveConfig+456
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 165
;165:	Menu_AddItem( &saveConfig.menu, &saveConfig.back );
ADDRGP4 saveConfig
ARGP4
ADDRGP4 saveConfig+796
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 166
;166:	Menu_AddItem( &saveConfig.menu, &saveConfig.save );
ADDRGP4 saveConfig
ARGP4
ADDRGP4 saveConfig+888
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 167
;167:}
LABELV $89
endproc UI_SaveConfigMenu_Init 0 12
export UI_SaveConfigMenu_Cache
proc UI_SaveConfigMenu_Cache 0 4
line 175
;168:
;169:
;170:/*
;171:=================
;172:UI_SaveConfigMenu_Cache
;173:=================
;174:*/
;175:void UI_SaveConfigMenu_Cache( void ) {
line 176
;176:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $144
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 177
;177:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $161
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 178
;178:	trap_R_RegisterShaderNoMip( ART_SAVE0 );
ADDRGP4 $165
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 179
;179:	trap_R_RegisterShaderNoMip( ART_SAVE1 );
ADDRGP4 $182
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 180
;180:	trap_R_RegisterShaderNoMip( ART_BACKGROUND );
ADDRGP4 $107
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 181
;181:}
LABELV $188
endproc UI_SaveConfigMenu_Cache 0 4
export UI_SaveConfigMenu
proc UI_SaveConfigMenu 0 4
line 189
;182:
;183:
;184:/*
;185:===============
;186:UI_SaveConfigMenu
;187:===============
;188:*/
;189:void UI_SaveConfigMenu( void ) {
line 190
;190:	UI_SaveConfigMenu_Init();
ADDRGP4 UI_SaveConfigMenu_Init
CALLV
pop
line 191
;191:	UI_PushMenu( &saveConfig.menu );
ADDRGP4 saveConfig
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 192
;192:}
LABELV $189
endproc UI_SaveConfigMenu 0 4
bss
align 4
LABELV saveConfig
skip 980
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
LABELV $182
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
byte 1 97
byte 1 118
byte 1 101
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $165
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
byte 1 97
byte 1 118
byte 1 101
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $161
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
LABELV $144
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
byte 1 99
byte 1 117
byte 1 116
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $99
byte 1 83
byte 1 65
byte 1 86
byte 1 69
byte 1 32
byte 1 67
byte 1 79
byte 1 78
byte 1 70
byte 1 73
byte 1 71
byte 1 0
align 1
LABELV $88
byte 1 69
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $84
byte 1 119
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 10
byte 1 0
