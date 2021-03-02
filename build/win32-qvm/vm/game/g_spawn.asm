export G_SpawnString
code
proc G_SpawnString 8 8
file "..\..\..\..\code\game\g_spawn.c"
line 6
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:#include "g_local.h"
;5:
;6:qboolean	G_SpawnString( const char *key, const char *defaultString, char **out ) {
line 9
;7:	int		i;
;8:
;9:	if ( !level.spawning ) {
ADDRGP4 level+2980
INDIRI4
CNSTI4 0
NEI4 $56
line 10
;10:		*out = (char *)defaultString;
ADDRFP4 8
INDIRP4
ADDRFP4 4
INDIRP4
ASGNP4
line 12
;11://		G_Error( "G_SpawnString() called while not spawning" );
;12:	}
LABELV $56
line 14
;13:
;14:	for ( i = 0 ; i < level.numSpawnVars ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $62
JUMPV
LABELV $59
line 15
;15:		if ( !Q_stricmp( key, level.spawnVars[i][0] ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 level+2988
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $64
line 16
;16:			*out = level.spawnVars[i][1];
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 level+2988+4
ADDP4
INDIRP4
ASGNP4
line 17
;17:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $55
JUMPV
LABELV $64
line 19
;18:		}
;19:	}
LABELV $60
line 14
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $62
ADDRLP4 0
INDIRI4
ADDRGP4 level+2984
INDIRI4
LTI4 $59
line 21
;20:
;21:	*out = (char *)defaultString;
ADDRFP4 8
INDIRP4
ADDRFP4 4
INDIRP4
ASGNP4
line 22
;22:	return qfalse;
CNSTI4 0
RETI4
LABELV $55
endproc G_SpawnString 8 8
export G_SpawnFloat
proc G_SpawnFloat 16 12
line 25
;23:}
;24:
;25:qboolean	G_SpawnFloat( const char *key, const char *defaultString, float *out ) {
line 29
;26:	char		*s;
;27:	qboolean	present;
;28:
;29:	present = G_SpawnString( key, defaultString, &s );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 8
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 30
;30:	*out = atof( s );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atof
CALLF4
ASGNF4
ADDRFP4 8
INDIRP4
ADDRLP4 12
INDIRF4
ASGNF4
line 31
;31:	return present;
ADDRLP4 4
INDIRI4
RETI4
LABELV $69
endproc G_SpawnFloat 16 12
export G_SpawnInt
proc G_SpawnInt 16 12
line 34
;32:}
;33:
;34:qboolean	G_SpawnInt( const char *key, const char *defaultString, int *out ) {
line 38
;35:	char		*s;
;36:	qboolean	present;
;37:
;38:	present = G_SpawnString( key, defaultString, &s );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 8
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 39
;39:	*out = atoi( s );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
line 40
;40:	return present;
ADDRLP4 4
INDIRI4
RETI4
LABELV $70
endproc G_SpawnInt 16 12
export G_SpawnVector
proc G_SpawnVector 16 20
line 43
;41:}
;42:
;43:qboolean	G_SpawnVector( const char *key, const char *defaultString, float *out ) {
line 47
;44:	char		*s;
;45:	qboolean	present;
;46:
;47:	present = G_SpawnString( key, defaultString, &s );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 8
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 48
;48:	Q_sscanf( s, "%f %f %f", &out[0], &out[1], &out[2] );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $72
ARGP4
ADDRLP4 12
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
ARGP4
ADDRGP4 Q_sscanf
CALLI4
pop
line 49
;49:	return present;
ADDRLP4 4
INDIRI4
RETI4
LABELV $71
endproc G_SpawnVector 16 20
data
export fields
align 4
LABELV fields
address $75
byte 4 524
byte 4 2
address $76
byte 4 92
byte 4 4
address $77
byte 4 540
byte 4 2
address $78
byte 4 544
byte 4 2
address $79
byte 4 528
byte 4 0
address $80
byte 4 672
byte 4 1
address $81
byte 4 648
byte 4 2
address $82
byte 4 652
byte 4 2
address $83
byte 4 636
byte 4 2
address $84
byte 4 656
byte 4 2
address $85
byte 4 804
byte 4 1
address $86
byte 4 808
byte 4 1
address $87
byte 4 760
byte 4 0
address $88
byte 4 732
byte 4 0
address $89
byte 4 0
byte 4 9
address $90
byte 4 740
byte 4 0
address $91
byte 4 116
byte 4 4
address $92
byte 4 116
byte 4 5
address $93
byte 4 660
byte 4 2
address $94
byte 4 664
byte 4 2
byte 4 0
skip 8
export SP_item_botroam
code
proc SP_item_botroam 0 0
line 172
;50:}
;51:
;52:
;53:
;54://
;55:// fields are needed for spawning from the entity string
;56://
;57:typedef enum {
;58:	F_INT, 
;59:	F_FLOAT,
;60:	F_LSTRING,			// string on disk, pointer in memory, TAG_LEVEL
;61:	F_GSTRING,			// string on disk, pointer in memory, TAG_GAME
;62:	F_VECTOR,
;63:	F_ANGLEHACK,
;64:	F_ENTITY,			// index on disk, pointer in memory
;65:	F_ITEM,				// index on disk, pointer in memory
;66:	F_CLIENT,			// index on disk, pointer in memory
;67:	F_IGNORE
;68:} fieldtype_t;
;69:
;70:typedef struct
;71:{
;72:	const char *name;
;73:	int		ofs;
;74:	fieldtype_t	type;
;75:	//int		flags;
;76:} field_t;
;77:
;78:const field_t fields[] = {
;79:	{"classname", FOFS(classname), F_LSTRING},
;80:	{"origin", FOFS(s.origin), F_VECTOR},
;81:	{"model", FOFS(model), F_LSTRING},
;82:	{"model2", FOFS(model2), F_LSTRING},
;83:	{"spawnflags", FOFS(spawnflags), F_INT},
;84:	{"speed", FOFS(speed), F_FLOAT},
;85:	{"target", FOFS(target), F_LSTRING},
;86:	{"targetname", FOFS(targetname), F_LSTRING},
;87:	{"message", FOFS(message), F_LSTRING},
;88:	{"team", FOFS(team), F_LSTRING},
;89:	{"wait", FOFS(wait), F_FLOAT},
;90:	{"random", FOFS(random), F_FLOAT},
;91:	{"count", FOFS(count), F_INT},
;92:	{"health", FOFS(health), F_INT},
;93:	{"light", 0, F_IGNORE},
;94:	{"dmg", FOFS(damage), F_INT},
;95:	{"angles", FOFS(s.angles), F_VECTOR},
;96:	{"angle", FOFS(s.angles), F_ANGLEHACK},
;97:	{"targetShaderName", FOFS(targetShaderName), F_LSTRING},
;98:	{"targetShaderNewName", FOFS(targetShaderNewName), F_LSTRING},
;99:
;100:	{NULL}
;101:};
;102:
;103:
;104:typedef struct {
;105:	char	*name;
;106:	void	(*spawn)(gentity_t *ent);
;107:} spawn_t;
;108:
;109:void SP_info_player_start (gentity_t *ent);
;110:void SP_info_player_deathmatch (gentity_t *ent);
;111:void SP_info_player_intermission (gentity_t *ent);
;112:void SP_info_firstplace(gentity_t *ent);
;113:void SP_info_secondplace(gentity_t *ent);
;114:void SP_info_thirdplace(gentity_t *ent);
;115:void SP_info_podium(gentity_t *ent);
;116:
;117:void SP_func_plat (gentity_t *ent);
;118:void SP_func_static (gentity_t *ent);
;119:void SP_func_rotating (gentity_t *ent);
;120:void SP_func_bobbing (gentity_t *ent);
;121:void SP_func_pendulum( gentity_t *ent );
;122:void SP_func_button (gentity_t *ent);
;123:void SP_func_door (gentity_t *ent);
;124:void SP_func_train (gentity_t *ent);
;125:void SP_func_timer (gentity_t *self);
;126:
;127:void SP_trigger_always (gentity_t *ent);
;128:void SP_trigger_multiple (gentity_t *ent);
;129:void SP_trigger_push (gentity_t *ent);
;130:void SP_trigger_teleport (gentity_t *ent);
;131:void SP_trigger_hurt (gentity_t *ent);
;132:
;133:void SP_target_remove_powerups( gentity_t *ent );
;134:void SP_target_give (gentity_t *ent);
;135:void SP_target_delay (gentity_t *ent);
;136:void SP_target_speaker (gentity_t *ent);
;137:void SP_target_print (gentity_t *ent);
;138:void SP_target_laser (gentity_t *self);
;139:void SP_target_character (gentity_t *ent);
;140:void SP_target_score( gentity_t *ent );
;141:void SP_target_teleporter( gentity_t *ent );
;142:void SP_target_relay (gentity_t *ent);
;143:void SP_target_kill (gentity_t *ent);
;144:void SP_target_position (gentity_t *ent);
;145:void SP_target_location (gentity_t *ent);
;146:void SP_target_push (gentity_t *ent);
;147:
;148:void SP_light (gentity_t *self);
;149:void SP_info_null (gentity_t *self);
;150:void SP_info_notnull (gentity_t *self);
;151:void SP_info_camp (gentity_t *self);
;152:void SP_path_corner (gentity_t *self);
;153:
;154:void SP_misc_teleporter_dest (gentity_t *self);
;155:void SP_misc_model(gentity_t *ent);
;156:void SP_misc_portal_camera(gentity_t *ent);
;157:void SP_misc_portal_surface(gentity_t *ent);
;158:
;159:void SP_shooter_rocket( gentity_t *ent );
;160:void SP_shooter_plasma( gentity_t *ent );
;161:void SP_shooter_grenade( gentity_t *ent );
;162:
;163:void SP_team_CTF_redplayer( gentity_t *ent );
;164:void SP_team_CTF_blueplayer( gentity_t *ent );
;165:
;166:void SP_team_CTF_redspawn( gentity_t *ent );
;167:void SP_team_CTF_bluespawn( gentity_t *ent );
;168:
;169:void SP_team_blueobelisk( gentity_t *ent );
;170:void SP_team_redobelisk( gentity_t *ent );
;171:void SP_team_neutralobelisk( gentity_t *ent );
;172:void SP_item_botroam( gentity_t *ent ) {};
LABELV $96
endproc SP_item_botroam 0 0
data
export spawns
align 4
LABELV spawns
address $97
address SP_info_player_start
address $98
address SP_info_player_deathmatch
address $99
address SP_info_player_intermission
address $100
address SP_info_null
address $101
address SP_info_notnull
address $102
address SP_info_camp
address $103
address SP_func_plat
address $104
address SP_func_button
address $105
address SP_func_door
address $106
address SP_func_static
address $107
address SP_func_rotating
address $108
address SP_func_bobbing
address $109
address SP_func_pendulum
address $110
address SP_func_train
address $111
address SP_info_null
address $112
address SP_func_timer
address $113
address SP_trigger_always
address $114
address SP_trigger_multiple
address $115
address SP_trigger_push
address $116
address SP_trigger_teleport
address $117
address SP_trigger_hurt
address $118
address SP_target_give
address $119
address SP_target_remove_powerups
address $120
address SP_target_delay
address $121
address SP_target_speaker
address $122
address SP_target_print
address $123
address SP_target_laser
address $124
address SP_target_score
address $125
address SP_target_teleporter
address $126
address SP_target_relay
address $127
address SP_target_kill
address $128
address SP_target_position
address $129
address SP_target_location
address $130
address SP_target_push
address $89
address SP_light
address $131
address SP_path_corner
address $132
address SP_misc_teleporter_dest
address $133
address SP_misc_model
address $134
address SP_misc_portal_surface
address $135
address SP_misc_portal_camera
address $136
address SP_shooter_rocket
address $137
address SP_shooter_grenade
address $138
address SP_shooter_plasma
address $139
address SP_team_CTF_redplayer
address $140
address SP_team_CTF_blueplayer
address $141
address SP_team_CTF_redspawn
address $142
address SP_team_CTF_bluespawn
address $143
address SP_team_redobelisk
address $144
address SP_team_blueobelisk
address $145
address SP_team_neutralobelisk
address $146
address SP_item_botroam
byte 4 0
byte 4 0
export G_CallSpawn
code
proc G_CallSpawn 12 8
line 256
;173:
;174:spawn_t	spawns[] = {
;175:	// info entities don't do anything at all, but provide positional
;176:	// information for things controlled by other processes
;177:	{"info_player_start", SP_info_player_start},
;178:	{"info_player_deathmatch", SP_info_player_deathmatch},
;179:	{"info_player_intermission", SP_info_player_intermission},
;180:	{"info_null", SP_info_null},
;181:	{"info_notnull", SP_info_notnull},		// use target_position instead
;182:	{"info_camp", SP_info_camp},
;183:
;184:	{"func_plat", SP_func_plat},
;185:	{"func_button", SP_func_button},
;186:	{"func_door", SP_func_door},
;187:	{"func_static", SP_func_static},
;188:	{"func_rotating", SP_func_rotating},
;189:	{"func_bobbing", SP_func_bobbing},
;190:	{"func_pendulum", SP_func_pendulum},
;191:	{"func_train", SP_func_train},
;192:	{"func_group", SP_info_null},
;193:	{"func_timer", SP_func_timer},			// rename trigger_timer?
;194:
;195:	// Triggers are brush objects that cause an effect when contacted
;196:	// by a living player, usually involving firing targets.
;197:	// While almost everything could be done with
;198:	// a single trigger class and different targets, triggered effects
;199:	// could not be client side predicted (push and teleport).
;200:	{"trigger_always", SP_trigger_always},
;201:	{"trigger_multiple", SP_trigger_multiple},
;202:	{"trigger_push", SP_trigger_push},
;203:	{"trigger_teleport", SP_trigger_teleport},
;204:	{"trigger_hurt", SP_trigger_hurt},
;205:
;206:	// targets perform no action by themselves, but must be triggered
;207:	// by another entity
;208:	{"target_give", SP_target_give},
;209:	{"target_remove_powerups", SP_target_remove_powerups},
;210:	{"target_delay", SP_target_delay},
;211:	{"target_speaker", SP_target_speaker},
;212:	{"target_print", SP_target_print},
;213:	{"target_laser", SP_target_laser},
;214:	{"target_score", SP_target_score},
;215:	{"target_teleporter", SP_target_teleporter},
;216:	{"target_relay", SP_target_relay},
;217:	{"target_kill", SP_target_kill},
;218:	{"target_position", SP_target_position},
;219:	{"target_location", SP_target_location},
;220:	{"target_push", SP_target_push},
;221:
;222:	{"light", SP_light},
;223:	{"path_corner", SP_path_corner},
;224:
;225:	{"misc_teleporter_dest", SP_misc_teleporter_dest},
;226:	{"misc_model", SP_misc_model},
;227:	{"misc_portal_surface", SP_misc_portal_surface},
;228:	{"misc_portal_camera", SP_misc_portal_camera},
;229:
;230:	{"shooter_rocket", SP_shooter_rocket},
;231:	{"shooter_grenade", SP_shooter_grenade},
;232:	{"shooter_plasma", SP_shooter_plasma},
;233:
;234:	{"team_CTF_redplayer", SP_team_CTF_redplayer},
;235:	{"team_CTF_blueplayer", SP_team_CTF_blueplayer},
;236:
;237:	{"team_CTF_redspawn", SP_team_CTF_redspawn},
;238:	{"team_CTF_bluespawn", SP_team_CTF_bluespawn},
;239:
;240:	{"team_redobelisk", SP_team_redobelisk},
;241:	{"team_blueobelisk", SP_team_blueobelisk},
;242:	{"team_neutralobelisk", SP_team_neutralobelisk},
;243:	{"item_botroam", SP_item_botroam},
;244:
;245:	{0, 0}
;246:};
;247:
;248:/*
;249:===============
;250:G_CallSpawn
;251:
;252:Finds the spawn function for the entity and calls it,
;253:returning qfalse if not found
;254:===============
;255:*/
;256:qboolean G_CallSpawn( gentity_t *ent ) {
line 260
;257:	spawn_t	*s;
;258:	gitem_t	*item;
;259:
;260:	if ( !ent->classname ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $148
line 261
;261:		G_Printf ("G_CallSpawn: NULL classname\n");
ADDRGP4 $150
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 262
;262:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $147
JUMPV
LABELV $148
line 266
;263:	}
;264:
;265:	// check item spawn functions
;266:	for ( item=bg_itemlist+1 ; item->classname ; item++ ) {
ADDRLP4 4
ADDRGP4 bg_itemlist+52
ASGNP4
ADDRGP4 $154
JUMPV
LABELV $151
line 267
;267:		if ( !strcmp(item->classname, ent->classname) ) {
ADDRLP4 4
INDIRP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $156
line 268
;268:			G_SpawnItem( ent, item );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_SpawnItem
CALLV
pop
line 269
;269:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $147
JUMPV
LABELV $156
line 271
;270:		}
;271:	}
LABELV $152
line 266
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 52
ADDP4
ASGNP4
LABELV $154
ADDRLP4 4
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $151
line 274
;272:
;273:	// check normal spawn functions
;274:	for ( s=spawns ; s->name ; s++ ) {
ADDRLP4 0
ADDRGP4 spawns
ASGNP4
ADDRGP4 $161
JUMPV
LABELV $158
line 275
;275:		if ( !strcmp(s->name, ent->classname) ) {
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $162
line 277
;276:			// found it
;277:			s->spawn(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CALLV
pop
line 278
;278:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $147
JUMPV
LABELV $162
line 280
;279:		}
;280:	}
LABELV $159
line 274
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
LABELV $161
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $158
line 281
;281:	G_Printf ("%s doesn't have a spawn function\n", ent->classname);
ADDRGP4 $164
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 282
;282:	return qfalse;
CNSTI4 0
RETI4
LABELV $147
endproc G_CallSpawn 12 8
export G_NewString
proc G_NewString 32 4
line 293
;283:}
;284:
;285:/*
;286:=============
;287:G_NewString
;288:
;289:Builds a copy of the string, translating \n to real linefeeds
;290:so message texts can be multi-line
;291:=============
;292:*/
;293:char *G_NewString( const char *string ) {
line 297
;294:	char	*newb, *new_p;
;295:	int		i,l;
;296:	
;297:	l = (int)strlen(string) + 1;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 299
;298:
;299:	newb = G_Alloc( l );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 G_Alloc
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 20
INDIRP4
ASGNP4
line 301
;300:
;301:	new_p = newb;
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 304
;302:
;303:	// turn \n into a real linefeed
;304:	for ( i=0 ; i< l ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $169
JUMPV
LABELV $166
line 305
;305:		if (string[i] == '\\' && i < l-1) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $170
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
GEI4 $170
line 306
;306:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 307
;307:			if (string[i] == 'n') {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 110
NEI4 $172
line 308
;308:				*new_p++ = '\n';
ADDRLP4 28
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI1 10
ASGNI1
line 309
;309:			} else {
ADDRGP4 $171
JUMPV
LABELV $172
line 310
;310:				*new_p++ = '\\';
ADDRLP4 28
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI1 92
ASGNI1
line 311
;311:			}
line 312
;312:		} else {
ADDRGP4 $171
JUMPV
LABELV $170
line 313
;313:			*new_p++ = string[i];
ADDRLP4 28
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 314
;314:		}
LABELV $171
line 315
;315:	}
LABELV $167
line 304
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $169
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $166
line 317
;316:	
;317:	return newb;
ADDRLP4 12
INDIRP4
RETP4
LABELV $165
endproc G_NewString 32 4
export G_ParseField
proc G_ParseField 52 20
line 331
;318:}
;319:
;320:
;321:
;322:
;323:/*
;324:===============
;325:G_ParseField
;326:
;327:Takes a key/value pair and sets the binary values
;328:in a gentity
;329:===============
;330:*/
;331:void G_ParseField( const char *key, const char *value, gentity_t *ent ) {
line 337
;332:	const field_t *f;
;333:	byte	*b;
;334:	float	v;
;335:	vec3_t	vec;
;336:
;337:	for ( f=fields ; f->name ; f++ ) {
ADDRLP4 0
ADDRGP4 fields
ASGNP4
ADDRGP4 $178
JUMPV
LABELV $175
line 338
;338:		if ( !Q_stricmp(f->name, key) ) {
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $179
line 340
;339:			// found it
;340:			b = (byte *)ent;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
line 342
;341:
;342:			switch( f->type ) {
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $174
ADDRLP4 28
INDIRI4
CNSTI4 9
GTI4 $174
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $194
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $194
address $190
address $191
address $184
address $174
address $185
address $192
address $174
address $174
address $174
address $174
code
LABELV $184
line 344
;343:			case F_LSTRING:
;344:				*(char **)(b+f->ofs) = G_NewString (value);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 G_NewString
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 36
INDIRP4
ASGNP4
line 345
;345:				break;
ADDRGP4 $174
JUMPV
LABELV $185
line 347
;346:			case F_VECTOR:
;347:				Q_sscanf (value, "%f %f %f", &vec[0], &vec[1], &vec[2]);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $72
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 8+4
ARGP4
ADDRLP4 8+8
ARGP4
ADDRGP4 Q_sscanf
CALLI4
pop
line 348
;348:				((float *)(b+f->ofs))[0] = vec[0];
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
line 349
;349:				((float *)(b+f->ofs))[1] = vec[1];
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 4
ADDP4
ADDRLP4 8+4
INDIRF4
ASGNF4
line 350
;350:				((float *)(b+f->ofs))[2] = vec[2];
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 8+8
INDIRF4
ASGNF4
line 351
;351:				break;
ADDRGP4 $174
JUMPV
LABELV $190
line 353
;352:			case F_INT:
;353:				*(int *)(b+f->ofs) = atoi(value);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 354
;354:				break;
ADDRGP4 $174
JUMPV
LABELV $191
line 356
;355:			case F_FLOAT:
;356:				*(float *)(b+f->ofs) = atof(value);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 44
INDIRF4
ASGNF4
line 357
;357:				break;
ADDRGP4 $174
JUMPV
LABELV $192
line 359
;358:			case F_ANGLEHACK:
;359:				v = atof(value);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 48
INDIRF4
ASGNF4
line 360
;360:				((float *)(b+f->ofs))[0] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTF4 0
ASGNF4
line 361
;361:				((float *)(b+f->ofs))[1] = v;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 4
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
line 362
;362:				((float *)(b+f->ofs))[2] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 363
;363:				break;
line 366
;364:			default:
;365:			case F_IGNORE:
;366:				break;
line 368
;367:			}
;368:			return;
ADDRGP4 $174
JUMPV
LABELV $179
line 370
;369:		}
;370:	}
LABELV $176
line 337
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
LABELV $178
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $175
line 371
;371:}
LABELV $174
endproc G_ParseField 52 20
export G_SpawnGEntityFromSpawnVars
proc G_SpawnGEntityFromSpawnVars 40 12
line 384
;372:
;373:
;374:
;375:
;376:/*
;377:===================
;378:G_SpawnGEntityFromSpawnVars
;379:
;380:Spawn an entity and fill in all of the level fields from
;381:level.spawnVars[], then call the class specfic spawn function
;382:===================
;383:*/
;384:void G_SpawnGEntityFromSpawnVars( void ) {
line 390
;385:	int			i;
;386:	gentity_t	*ent;
;387:	char		*s, *value, *gametypeName;
;388:
;389:	// get the next free entity
;390:	ent = G_Spawn();
ADDRLP4 20
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 392
;391:
;392:	for ( i = 0 ; i < level.numSpawnVars ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $199
JUMPV
LABELV $196
line 393
;393:		G_ParseField( level.spawnVars[i][0], level.spawnVars[i][1], ent );
ADDRLP4 24
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 level+2988
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 level+2988+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_ParseField
CALLV
pop
line 394
;394:	}
LABELV $197
line 392
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $199
ADDRLP4 0
INDIRI4
ADDRGP4 level+2984
INDIRI4
LTI4 $196
line 397
;395:
;396:	// check for "notsingle" flag
;397:	if ( g_singlePlayer.integer ) {
ADDRGP4 g_singlePlayer+12
INDIRI4
CNSTI4 0
EQI4 $204
line 398
;398:		G_SpawnInt( "notsingle", "0", &i );
ADDRGP4 $207
ARGP4
ADDRGP4 $208
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 399
;399:		if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $209
line 400
;400:			G_FreeEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 401
;401:			return;
ADDRGP4 $195
JUMPV
LABELV $209
line 403
;402:		}
;403:	}
LABELV $204
line 406
;404:
;405:	// check for "notteam" flag
;406:	if ( GTx( g_gametype.integer, GTF_TEAMS ) ) {
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
EQI4 $211
line 407
;407:		G_SpawnInt( "notteam", "0", &i );
ADDRGP4 $215
ARGP4
ADDRGP4 $208
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 408
;408:		if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $212
line 409
;409:			G_FreeEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 410
;410:			return;
ADDRGP4 $195
JUMPV
line 412
;411:		}
;412:	} else {
LABELV $211
line 413
;413:		G_SpawnInt( "notfree", "0", &i );
ADDRGP4 $218
ARGP4
ADDRGP4 $208
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 414
;414:		if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $219
line 415
;415:			G_FreeEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 416
;416:			return;
ADDRGP4 $195
JUMPV
LABELV $219
line 418
;417:		}
;418:	}
LABELV $212
line 427
;419:
;420:#ifdef MISSIONPACK
;421:	G_SpawnInt( "notta", "0", &i );
;422:	if ( i ) {
;423:		G_FreeEntity( ent );
;424:		return;
;425:	}
;426:#else
;427:	G_SpawnInt( "notq3a", "0", &i );
ADDRGP4 $221
ARGP4
ADDRGP4 $208
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 428
;428:	if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $222
line 429
;429:		G_FreeEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 430
;430:		return;
ADDRGP4 $195
JUMPV
LABELV $222
line 434
;431:	}
;432:#endif
;433:
;434:	if( G_SpawnString( "gametype", NULL, &value ) ) {
ADDRGP4 $226
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 24
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $224
line 435
;435:		if( g_gametype.integer >= 0 && g_gametype.integer < GT_MAX_GAME_TYPE ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
LTI4 $227
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
GEI4 $227
line 436
;436:			gametypeName = gt[g_gametype.integer].gtSpawnRef;
ADDRLP4 16
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 36
MULI4
ADDRGP4 gt+12
ADDP4
INDIRP4
ASGNP4
line 438
;437:
;438:			s = strstr( value, gametypeName );
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 28
INDIRP4
ASGNP4
line 439
;439:			if( !s ) {
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $233
line 440
;440:				G_FreeEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 441
;441:				return;
ADDRGP4 $195
JUMPV
LABELV $233
line 443
;442:			}
;443:		}
LABELV $227
line 444
;444:	}
LABELV $224
line 447
;445:
;446:	// move editor origin to pos
;447:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 448
;448:	VectorCopy( ent->s.origin, ent->r.currentOrigin );
ADDRLP4 4
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 451
;449:
;450:	// if we didn't get a classname, don't bother spawning anything
;451:	if ( !G_CallSpawn( ent ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 G_CallSpawn
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $235
line 452
;452:		G_FreeEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 453
;453:	}
LABELV $235
line 454
;454:}
LABELV $195
endproc G_SpawnGEntityFromSpawnVars 40 12
export G_AddSpawnVarToken
proc G_AddSpawnVarToken 16 12
line 463
;455:
;456:
;457:
;458:/*
;459:====================
;460:G_AddSpawnVarToken
;461:====================
;462:*/
;463:char *G_AddSpawnVarToken( const char *string ) {
line 467
;464:	int		l;
;465:	char	*dest;
;466:
;467:	l = (int)strlen( string );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 468
;468:	if ( level.numSpawnVarChars + l + 1 > MAX_SPAWN_VARS_CHARS ) {
ADDRGP4 level+3500
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
CNSTI4 1
ADDI4
CNSTI4 4096
LEI4 $238
line 469
;469:		G_Error( "G_AddSpawnVarToken: MAX_SPAWN_VARS_CHARS" );
ADDRGP4 $241
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 470
;470:	}
LABELV $238
line 472
;471:
;472:	dest = level.spawnVarChars + level.numSpawnVarChars;
ADDRLP4 4
ADDRGP4 level+3500
INDIRI4
ADDRGP4 level+3504
ADDP4
ASGNP4
line 473
;473:	memcpy( dest, string, l+1 );
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 475
;474:
;475:	level.numSpawnVarChars += l + 1;
ADDRLP4 12
ADDRGP4 level+3500
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ADDI4
ASGNI4
line 477
;476:
;477:	return dest;
ADDRLP4 4
INDIRP4
RETP4
LABELV $237
endproc G_AddSpawnVarToken 16 12
export G_ParseSpawnVars
proc G_ParseSpawnVars 2072 8
line 490
;478:}
;479:
;480:/*
;481:====================
;482:G_ParseSpawnVars
;483:
;484:Parses a brace bounded set of key / value pairs out of the
;485:level's entity strings into level.spawnVars[]
;486:
;487:This does not actually spawn an entity.
;488:====================
;489:*/
;490:qboolean G_ParseSpawnVars( void ) {
line 494
;491:	char		keyname[MAX_TOKEN_CHARS];
;492:	char		com_token[MAX_TOKEN_CHARS];
;493:
;494:	level.numSpawnVars = 0;
ADDRGP4 level+2984
CNSTI4 0
ASGNI4
line 495
;495:	level.numSpawnVarChars = 0;
ADDRGP4 level+3500
CNSTI4 0
ASGNI4
line 498
;496:
;497:	// parse the opening brace
;498:	if ( !trap_GetEntityToken( com_token, sizeof( com_token ) ) ) {
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 2048
ADDRGP4 trap_GetEntityToken
CALLI4
ASGNI4
ADDRLP4 2048
INDIRI4
CNSTI4 0
NEI4 $248
line 500
;499:		// end of spawn string
;500:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $245
JUMPV
LABELV $248
line 502
;501:	}
;502:	if ( com_token[0] != '{' ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $254
line 503
;503:		G_Error( "G_ParseSpawnVars: found %s when expecting {",com_token );
ADDRGP4 $252
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 504
;504:	}
ADDRGP4 $254
JUMPV
LABELV $253
line 507
;505:
;506:	// go through all the key / value pairs
;507:	while ( 1 ) {	
line 509
;508:		// parse key
;509:		if ( !trap_GetEntityToken( keyname, sizeof( keyname ) ) ) {
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 2052
ADDRGP4 trap_GetEntityToken
CALLI4
ASGNI4
ADDRLP4 2052
INDIRI4
CNSTI4 0
NEI4 $256
line 510
;510:			G_Error( "G_ParseSpawnVars: EOF without closing brace" );
ADDRGP4 $258
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 511
;511:		}
LABELV $256
line 513
;512:
;513:		if ( keyname[0] == '}' ) {
ADDRLP4 1024
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $259
line 514
;514:			break;
ADDRGP4 $255
JUMPV
LABELV $259
line 518
;515:		}
;516:		
;517:		// parse value	
;518:		if ( !trap_GetEntityToken( com_token, sizeof( com_token ) ) ) {
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 2056
ADDRGP4 trap_GetEntityToken
CALLI4
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 0
NEI4 $261
line 519
;519:			G_Error( "G_ParseSpawnVars: EOF without closing brace" );
ADDRGP4 $258
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 520
;520:		}
LABELV $261
line 522
;521:
;522:		if ( com_token[0] == '}' ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $263
line 523
;523:			G_Error( "G_ParseSpawnVars: closing brace without data" );
ADDRGP4 $265
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 524
;524:		}
LABELV $263
line 525
;525:		if ( level.numSpawnVars == MAX_SPAWN_VARS ) {
ADDRGP4 level+2984
INDIRI4
CNSTI4 64
NEI4 $266
line 526
;526:			G_Error( "G_ParseSpawnVars: MAX_SPAWN_VARS" );
ADDRGP4 $269
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 527
;527:		}
LABELV $266
line 528
;528:		level.spawnVars[ level.numSpawnVars ][0] = G_AddSpawnVarToken( keyname );
ADDRLP4 1024
ARGP4
ADDRLP4 2060
ADDRGP4 G_AddSpawnVarToken
CALLP4
ASGNP4
ADDRGP4 level+2984
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 level+2988
ADDP4
ADDRLP4 2060
INDIRP4
ASGNP4
line 529
;529:		level.spawnVars[ level.numSpawnVars ][1] = G_AddSpawnVarToken( com_token );
ADDRLP4 0
ARGP4
ADDRLP4 2064
ADDRGP4 G_AddSpawnVarToken
CALLP4
ASGNP4
ADDRGP4 level+2984
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 level+2988+4
ADDP4
ADDRLP4 2064
INDIRP4
ASGNP4
line 530
;530:		level.numSpawnVars++;
ADDRLP4 2068
ADDRGP4 level+2984
ASGNP4
ADDRLP4 2068
INDIRP4
ADDRLP4 2068
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 531
;531:	}
LABELV $254
line 507
ADDRGP4 $253
JUMPV
LABELV $255
line 533
;532:
;533:	return qtrue;
CNSTI4 1
RETI4
LABELV $245
endproc G_ParseSpawnVars 2072 8
export SP_worldspawn
proc SP_worldspawn 16 12
line 545
;534:}
;535:
;536:
;537:
;538:/*QUAKED worldspawn (0 0 0) ?
;539:
;540:Every map should have exactly one worldspawn.
;541:"music"		music wav file
;542:"gravity"	800 is default gravity
;543:"message"	Text to print during connection process
;544:*/
;545:void SP_worldspawn( void ) {
line 548
;546:	char	*s;
;547:
;548:	G_SpawnString( "classname", "", &s );
ADDRGP4 $75
ARGP4
ADDRGP4 $277
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 549
;549:	if ( Q_stricmp( s, "worldspawn" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $280
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $278
line 550
;550:		G_Error( "SP_worldspawn: The first entity isn't 'worldspawn'" );
ADDRGP4 $281
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 551
;551:	}
LABELV $278
line 554
;552:
;553:	// make some data visible to connecting client
;554:	trap_SetConfigstring( CS_GAME_VERSION, GAME_VERSION );
CNSTI4 20
ARGI4
ADDRGP4 $282
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 556
;555:
;556:	trap_SetConfigstring( CS_LEVEL_START_TIME, va("%i", level.startTime ) );
ADDRGP4 $283
ARGP4
ADDRGP4 level+40
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 21
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 558
;557:
;558:	G_SpawnString( "music", "", &s );
ADDRGP4 $285
ARGP4
ADDRGP4 $277
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 559
;559:	trap_SetConfigstring( CS_MUSIC, s );
CNSTI4 2
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 561
;560:
;561:	G_SpawnString( "message", "", &s );
ADDRGP4 $83
ARGP4
ADDRGP4 $277
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 562
;562:	trap_SetConfigstring( CS_MESSAGE, s );				// map specific message
CNSTI4 3
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 564
;563:
;564:	trap_SetConfigstring( CS_MOTD, g_motd.string );		// message of the day
CNSTI4 4
ARGI4
ADDRGP4 g_motd+16
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 566
;565:
;566:	G_SpawnString( "gravity", "800", &s );
ADDRGP4 $287
ARGP4
ADDRGP4 $288
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 567
;567:	trap_Cvar_Set( "g_gravity", s );
ADDRGP4 $289
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 569
;568:
;569:	G_SpawnString( "enableDust", "0", &s );
ADDRGP4 $290
ARGP4
ADDRGP4 $208
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 570
;570:	trap_Cvar_Set( "g_enableDust", s );
ADDRGP4 $291
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 572
;571:
;572:	G_SpawnString( "enableBreath", "0", &s );
ADDRGP4 $292
ARGP4
ADDRGP4 $208
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 573
;573:	trap_Cvar_Set( "g_enableBreath", s );
ADDRGP4 $293
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 575
;574:
;575:	g_entities[ENTITYNUM_WORLD].s.number = ENTITYNUM_WORLD;
ADDRGP4 g_entities+842128
CNSTI4 1022
ASGNI4
line 576
;576:	g_entities[ENTITYNUM_WORLD].r.ownerNum = ENTITYNUM_NONE;
ADDRGP4 g_entities+842128+208+304
CNSTI4 1023
ASGNI4
line 577
;577:	g_entities[ENTITYNUM_WORLD].classname = "worldspawn";
ADDRGP4 g_entities+842128+524
ADDRGP4 $280
ASGNP4
line 579
;578:
;579:	g_entities[ENTITYNUM_NONE].s.number = ENTITYNUM_NONE;
ADDRGP4 g_entities+842952
CNSTI4 1023
ASGNI4
line 580
;580:	g_entities[ENTITYNUM_NONE].r.ownerNum = ENTITYNUM_NONE;
ADDRGP4 g_entities+842952+208+304
CNSTI4 1023
ASGNI4
line 581
;581:	g_entities[ENTITYNUM_NONE].classname = "nothing";
ADDRGP4 g_entities+842952+524
ADDRGP4 $306
ASGNP4
line 584
;582:
;583:	// see if we want a warmup time
;584:	if ( g_restarted.integer || g_gametype.integer == GT_CAMPAIGN ) {
ADDRGP4 g_restarted+12
INDIRI4
CNSTI4 0
NEI4 $311
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
NEI4 $307
LABELV $311
line 585
;585:		trap_Cvar_Set( "g_restarted", "0" );
ADDRGP4 $312
ARGP4
ADDRGP4 $208
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 586
;586:		level.warmupTime = 0;
ADDRGP4 level+16
CNSTI4 0
ASGNI4
line 587
;587:		trap_SetConfigstring( CS_WARMUP, "" );
CNSTI4 5
ARGI4
ADDRGP4 $277
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 588
;588:	} else {
ADDRGP4 $308
JUMPV
LABELV $307
line 590
;589:		// assume that g_doWarmup is always 1
;590:		level.warmupTime = -1;
ADDRGP4 level+16
CNSTI4 -1
ASGNI4
line 591
;591:		if ( g_warmup.integer > 0 ) {
ADDRGP4 g_warmup+12
INDIRI4
CNSTI4 0
LEI4 $315
line 592
;592:			trap_SetConfigstring( CS_WARMUP, va( "%i", level.warmupTime ) );
ADDRGP4 $283
ARGP4
ADDRGP4 level+16
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 5
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 593
;593:		} else {
ADDRGP4 $316
JUMPV
LABELV $315
line 594
;594:			trap_SetConfigstring( CS_WARMUP, "" );
CNSTI4 5
ARGI4
ADDRGP4 $277
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 595
;595:		}
LABELV $316
line 596
;596:		G_LogPrintf( "Warmup:\n" );
ADDRGP4 $319
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 597
;597:	}
LABELV $308
line 598
;598:}
LABELV $276
endproc SP_worldspawn 16 12
export G_SpawnEntitiesFromString
proc G_SpawnEntitiesFromString 8 4
line 608
;599:
;600:
;601:/*
;602:==============
;603:G_SpawnEntitiesFromString
;604:
;605:Parses textual entity definitions out of an entstring and spawns gentities.
;606:==============
;607:*/
;608:void G_SpawnEntitiesFromString( void ) {
line 610
;609:	// allow calls to G_Spawn*()
;610:	level.spawning = qtrue;
ADDRGP4 level+2980
CNSTI4 1
ASGNI4
line 611
;611:	level.numSpawnVars = 0;
ADDRGP4 level+2984
CNSTI4 0
ASGNI4
line 616
;612:
;613:	// the worldspawn is not an actual entity, but it still
;614:	// has a "spawn" function to perform any global setup
;615:	// needed by a level (setting configstrings or cvars, etc)
;616:	if ( !G_ParseSpawnVars() ) {
ADDRLP4 0
ADDRGP4 G_ParseSpawnVars
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $323
line 617
;617:		G_Error( "SpawnEntities: no entities" );
ADDRGP4 $325
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 618
;618:	}
LABELV $323
line 619
;619:	SP_worldspawn();
ADDRGP4 SP_worldspawn
CALLV
pop
ADDRGP4 $327
JUMPV
LABELV $326
line 622
;620:
;621:	// parse ents
;622:	while( G_ParseSpawnVars() ) {
line 623
;623:		G_SpawnGEntityFromSpawnVars();
ADDRGP4 G_SpawnGEntityFromSpawnVars
CALLV
pop
line 624
;624:	}	
LABELV $327
line 622
ADDRLP4 4
ADDRGP4 G_ParseSpawnVars
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $326
line 626
;625:
;626:	level.spawning = qfalse;			// any future calls to G_Spawn*() will be errors
ADDRGP4 level+2980
CNSTI4 0
ASGNI4
line 627
;627:}
LABELV $320
endproc G_SpawnEntitiesFromString 8 4
import SP_team_neutralobelisk
import SP_team_redobelisk
import SP_team_blueobelisk
import SP_team_CTF_bluespawn
import SP_team_CTF_redspawn
import SP_team_CTF_blueplayer
import SP_team_CTF_redplayer
import SP_shooter_grenade
import SP_shooter_plasma
import SP_shooter_rocket
import SP_misc_portal_surface
import SP_misc_portal_camera
import SP_misc_model
import SP_misc_teleporter_dest
import SP_path_corner
import SP_info_camp
import SP_info_notnull
import SP_info_null
import SP_light
import SP_target_push
import SP_target_location
import SP_target_position
import SP_target_kill
import SP_target_relay
import SP_target_teleporter
import SP_target_score
import SP_target_character
import SP_target_laser
import SP_target_print
import SP_target_speaker
import SP_target_delay
import SP_target_give
import SP_target_remove_powerups
import SP_trigger_hurt
import SP_trigger_teleport
import SP_trigger_push
import SP_trigger_multiple
import SP_trigger_always
import SP_func_timer
import SP_func_train
import SP_func_door
import SP_func_button
import SP_func_pendulum
import SP_func_bobbing
import SP_func_rotating
import SP_func_static
import SP_func_plat
import SP_info_podium
import SP_info_thirdplace
import SP_info_secondplace
import SP_info_firstplace
import SP_info_player_intermission
import SP_info_player_deathmatch
import SP_info_player_start
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
import ClientCommand
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
import DeathmatchScoreboardMessage
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
import G_RevertVote
import Cmd_FollowCycle_f
import SetTeam
import BroadcastTeamChange
import StopFollowing
import Cmd_Score_f
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
LABELV $325
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 105
byte 1 101
byte 1 115
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 105
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $319
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 58
byte 1 10
byte 1 0
align 1
LABELV $312
byte 1 103
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $306
byte 1 110
byte 1 111
byte 1 116
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $293
byte 1 103
byte 1 95
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 66
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $292
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 66
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $291
byte 1 103
byte 1 95
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 68
byte 1 117
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $290
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 68
byte 1 117
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $289
byte 1 103
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $288
byte 1 56
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $287
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $285
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 0
align 1
LABELV $283
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $282
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 113
byte 1 51
byte 1 45
byte 1 49
byte 1 0
align 1
LABELV $281
byte 1 83
byte 1 80
byte 1 95
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 58
byte 1 32
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 114
byte 1 115
byte 1 116
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 105
byte 1 115
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 39
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 39
byte 1 0
align 1
LABELV $280
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $277
byte 1 0
align 1
LABELV $269
byte 1 71
byte 1 95
byte 1 80
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 86
byte 1 97
byte 1 114
byte 1 115
byte 1 58
byte 1 32
byte 1 77
byte 1 65
byte 1 88
byte 1 95
byte 1 83
byte 1 80
byte 1 65
byte 1 87
byte 1 78
byte 1 95
byte 1 86
byte 1 65
byte 1 82
byte 1 83
byte 1 0
align 1
LABELV $265
byte 1 71
byte 1 95
byte 1 80
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 86
byte 1 97
byte 1 114
byte 1 115
byte 1 58
byte 1 32
byte 1 99
byte 1 108
byte 1 111
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 98
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 100
byte 1 97
byte 1 116
byte 1 97
byte 1 0
align 1
LABELV $258
byte 1 71
byte 1 95
byte 1 80
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 86
byte 1 97
byte 1 114
byte 1 115
byte 1 58
byte 1 32
byte 1 69
byte 1 79
byte 1 70
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 99
byte 1 108
byte 1 111
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 98
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $252
byte 1 71
byte 1 95
byte 1 80
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 86
byte 1 97
byte 1 114
byte 1 115
byte 1 58
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 119
byte 1 104
byte 1 101
byte 1 110
byte 1 32
byte 1 101
byte 1 120
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 123
byte 1 0
align 1
LABELV $241
byte 1 71
byte 1 95
byte 1 65
byte 1 100
byte 1 100
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 86
byte 1 97
byte 1 114
byte 1 84
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 58
byte 1 32
byte 1 77
byte 1 65
byte 1 88
byte 1 95
byte 1 83
byte 1 80
byte 1 65
byte 1 87
byte 1 78
byte 1 95
byte 1 86
byte 1 65
byte 1 82
byte 1 83
byte 1 95
byte 1 67
byte 1 72
byte 1 65
byte 1 82
byte 1 83
byte 1 0
align 1
LABELV $226
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
LABELV $221
byte 1 110
byte 1 111
byte 1 116
byte 1 113
byte 1 51
byte 1 97
byte 1 0
align 1
LABELV $218
byte 1 110
byte 1 111
byte 1 116
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 0
align 1
LABELV $215
byte 1 110
byte 1 111
byte 1 116
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $208
byte 1 48
byte 1 0
align 1
LABELV $207
byte 1 110
byte 1 111
byte 1 116
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $164
byte 1 37
byte 1 115
byte 1 32
byte 1 100
byte 1 111
byte 1 101
byte 1 115
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $150
byte 1 71
byte 1 95
byte 1 67
byte 1 97
byte 1 108
byte 1 108
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 58
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $146
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 98
byte 1 111
byte 1 116
byte 1 114
byte 1 111
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $145
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 110
byte 1 101
byte 1 117
byte 1 116
byte 1 114
byte 1 97
byte 1 108
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $144
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $143
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $142
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $141
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $140
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $139
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $138
byte 1 115
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 0
align 1
LABELV $137
byte 1 115
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $136
byte 1 115
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $135
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 97
byte 1 108
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 0
align 1
LABELV $134
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 97
byte 1 108
byte 1 95
byte 1 115
byte 1 117
byte 1 114
byte 1 102
byte 1 97
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $133
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $132
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $131
byte 1 112
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 99
byte 1 111
byte 1 114
byte 1 110
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $130
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 112
byte 1 117
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $129
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
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
LABELV $128
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
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
LABELV $127
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $126
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 114
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $125
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $124
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $123
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 108
byte 1 97
byte 1 115
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $122
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $121
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 115
byte 1 112
byte 1 101
byte 1 97
byte 1 107
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $120
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $119
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 95
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $118
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 103
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $117
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 104
byte 1 117
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $116
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $115
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 112
byte 1 117
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $114
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 109
byte 1 117
byte 1 108
byte 1 116
byte 1 105
byte 1 112
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $113
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 97
byte 1 108
byte 1 119
byte 1 97
byte 1 121
byte 1 115
byte 1 0
align 1
LABELV $112
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $111
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 103
byte 1 114
byte 1 111
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $110
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $109
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 112
byte 1 101
byte 1 110
byte 1 100
byte 1 117
byte 1 108
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $108
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 98
byte 1 111
byte 1 98
byte 1 98
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $107
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $106
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 99
byte 1 0
align 1
LABELV $105
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 100
byte 1 111
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $104
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $103
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $102
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $101
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 110
byte 1 111
byte 1 116
byte 1 110
byte 1 117
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $100
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 110
byte 1 117
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $99
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 95
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $98
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 95
byte 1 100
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
LABELV $97
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $94
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 83
byte 1 104
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 78
byte 1 101
byte 1 119
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $93
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 83
byte 1 104
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $92
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $91
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $90
byte 1 100
byte 1 109
byte 1 103
byte 1 0
align 1
LABELV $89
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $88
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $87
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $86
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $85
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $84
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $83
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $82
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $81
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $80
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $79
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $78
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 50
byte 1 0
align 1
LABELV $77
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $76
byte 1 111
byte 1 114
byte 1 105
byte 1 103
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $75
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $72
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 0
