export SP_info_camp
code
proc SP_info_camp 4 8
file "..\..\..\..\code\game\g_misc.c"
line 16
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// g_misc.c
;4:
;5:#include "g_local.h"
;6:
;7:
;8:/*QUAKED func_group (0 0 0) ?
;9:Used to group brushes together just for editor convenience.  They are turned into normal brushes by the utilities.
;10:*/
;11:
;12:
;13:/*QUAKED info_camp (0 0.5 0) (-4 -4 -4) (4 4 4)
;14:Used as a positional target for calculations in the utilities (spotlights, etc), but removed during gameplay.
;15:*/
;16:void SP_info_camp( gentity_t *self ) {
line 17
;17:	G_SetOrigin( self, self->s.origin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 18
;18:}
LABELV $55
endproc SP_info_camp 4 8
export SP_info_null
proc SP_info_null 0 4
line 24
;19:
;20:
;21:/*QUAKED info_null (0 0.5 0) (-4 -4 -4) (4 4 4)
;22:Used as a positional target for calculations in the utilities (spotlights, etc), but removed during gameplay.
;23:*/
;24:void SP_info_null( gentity_t *self ) {
line 25
;25:	G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 26
;26:}
LABELV $56
endproc SP_info_null 0 4
export SP_info_notnull
proc SP_info_notnull 4 8
line 33
;27:
;28:
;29:/*QUAKED info_notnull (0 0.5 0) (-4 -4 -4) (4 4 4)
;30:Used as a positional target for in-game calculation, like jumppad targets.
;31:target_position does the same thing
;32:*/
;33:void SP_info_notnull( gentity_t *self ){
line 34
;34:	G_SetOrigin( self, self->s.origin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 35
;35:}
LABELV $57
endproc SP_info_notnull 4 8
export SP_light
proc SP_light 0 4
line 45
;36:
;37:
;38:/*QUAKED light (0 1 0) (-8 -8 -8) (8 8 8) linear
;39:Non-displayed light.
;40:"light" overrides the default 300 intensity.
;41:Linear checbox gives linear falloff instead of inverse square
;42:Lights pointed at a target will be spotlights.
;43:"radius" overrides the default 64 unit radius of a spotlight at the target point.
;44:*/
;45:void SP_light( gentity_t *self ) {
line 46
;46:	G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 47
;47:}
LABELV $58
endproc SP_light 0 4
export TeleportPlayer
proc TeleportPlayer 36 16
line 59
;48:
;49:
;50:
;51:/*
;52:=================================================================================
;53:
;54:TELEPORTERS
;55:
;56:=================================================================================
;57:*/
;58:
;59:void TeleportPlayer( gentity_t *player, vec3_t origin, vec3_t angles ) {
line 64
;60:	gentity_t	*tent;
;61:
;62:	// use temp events at source and destination to prevent the effect
;63:	// from getting dropped by a second player event
;64:	if ( player->client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
EQI4 $60
line 65
;65:		tent = G_TempEntity( player->client->ps.origin, EV_PLAYER_TELEPORT_OUT );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 43
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 66
;66:		tent->s.clientNum = player->s.clientNum;
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 68
;67:
;68:		tent = G_TempEntity( origin, EV_PLAYER_TELEPORT_IN );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 42
ARGI4
ADDRLP4 8
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 69
;69:		tent->s.clientNum = player->s.clientNum;
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 70
;70:	}
LABELV $60
line 73
;71:
;72:	// unlink to make sure it can't possibly interfere with G_KillBox
;73:	trap_UnlinkEntity( player );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 75
;74:
;75:	VectorCopy( origin, player->client->ps.origin );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 76
;76:	player->client->ps.origin[2] += 1.0f;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 79
;77:
;78:	// spit the player out
;79:	if ( angles )
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $62
line 80
;80:		AngleVectors( angles, player->client->ps.velocity, NULL, NULL );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
LABELV $62
line 81
;81:	VectorScale( player->client->ps.velocity, (g_speed.value * 1.25f), player->client->ps.velocity );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRGP4 g_speed+8
INDIRF4
CNSTF4 1067450368
MULF4
MULF4
ASGNF4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRGP4 g_speed+8
INDIRF4
CNSTF4 1067450368
MULF4
MULF4
ASGNF4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRGP4 g_speed+8
INDIRF4
CNSTF4 1067450368
MULF4
MULF4
ASGNF4
line 82
;82:	player->client->ps.pm_time = 160; // hold time
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 160
ASGNI4
line 83
;83:	player->client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 86
;84:
;85:	// toggle the teleport bit so the client knows to not lerp
;86:	player->client->ps.eFlags ^= EF_TELEPORT_BIT;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 89
;87:
;88:	// set angles
;89:	if ( angles )
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $67
line 90
;90:		SetClientViewAngle( player, angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
LABELV $67
line 93
;91:
;92:	// unlagged
;93:	G_ResetHistory( player );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_ResetHistory
CALLV
pop
line 96
;94:
;95:	// kill anything at the destination
;96:	if ( player->client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
EQI4 $69
line 97
;97:		G_KillBox( player );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_KillBox
CALLV
pop
line 98
;98:	}
LABELV $69
line 101
;99:
;100:	// save results of pmove
;101:	BG_PlayerStateToEntityState( &player->client->ps, &player->s, qtrue );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 104
;102:
;103:	// use the precise origin for linking
;104:	VectorCopy( player->client->ps.origin, player->r.currentOrigin );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 106
;105:
;106:	if ( player->client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
EQI4 $71
line 107
;107:		trap_LinkEntity( player );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 108
;108:	}
LABELV $71
line 109
;109:}
LABELV $59
endproc TeleportPlayer 36 16
export SP_misc_teleporter_dest
proc SP_misc_teleporter_dest 0 0
line 117
;110:
;111:
;112:/*QUAKED misc_teleporter_dest (1 0 0) (-32 -32 -24) (32 32 -16)
;113:Point teleporters at these.
;114:Now that we don't have teleport destination pads, this is just
;115:an info_notnull
;116:*/
;117:void SP_misc_teleporter_dest( gentity_t *ent ) {
line 118
;118:}
LABELV $73
endproc SP_misc_teleporter_dest 0 0
export SP_misc_model
proc SP_misc_model 0 4
line 126
;119:
;120:
;121://===========================================================
;122:
;123:/*QUAKED misc_model (1 0 0) (-16 -16 -16) (16 16 16)
;124:"model"		arbitrary .md3 file to display
;125:*/
;126:void SP_misc_model( gentity_t *ent ) {
line 137
;127:
;128:#if 0
;129:	ent->s.modelindex = G_ModelIndex( ent->model );
;130:	VectorSet (ent->mins, -16, -16, -16);
;131:	VectorSet (ent->maxs, 16, 16, 16);
;132:	trap_LinkEntity (ent);
;133:
;134:	G_SetOrigin( ent, ent->s.origin );
;135:	VectorCopy( ent->s.angles, ent->s.apos.trBase );
;136:#else
;137:	G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 139
;138:#endif
;139:}
LABELV $74
endproc SP_misc_model 0 4
export locateCamera
proc locateCamera 36 8
line 143
;140:
;141://===========================================================
;142:
;143:void locateCamera( gentity_t *ent ) {
line 148
;144:	vec3_t		dir;
;145:	gentity_t	*target;
;146:	gentity_t	*owner;
;147:
;148:	owner = G_PickTarget( ent->target );
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 149
;149:	if ( !owner ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $76
line 150
;150:		G_Printf( "Couldn't find target for misc_partal_surface\n" );
ADDRGP4 $78
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 151
;151:		G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 152
;152:		return;
ADDRGP4 $75
JUMPV
LABELV $76
line 154
;153:	}
;154:	ent->r.ownerNum = owner->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 157
;155:
;156:	// frame holds the rotate speed
;157:	if ( owner->spawnflags & 1 ) {
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $79
line 158
;158:		ent->s.frame = 25;
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
CNSTI4 25
ASGNI4
line 159
;159:	} else if ( owner->spawnflags & 2 ) {
ADDRGP4 $80
JUMPV
LABELV $79
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $81
line 160
;160:		ent->s.frame = 75;
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
CNSTI4 75
ASGNI4
line 161
;161:	}
LABELV $81
LABELV $80
line 164
;162:
;163:	// swing camera ?
;164:	if ( owner->spawnflags & 4 ) {
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $83
line 166
;165:		// set to 0 for no rotation at all
;166:		ent->s.powerups = 0;
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 0
ASGNI4
line 167
;167:	}
ADDRGP4 $84
JUMPV
LABELV $83
line 168
;168:	else {
line 169
;169:		ent->s.powerups = 1;
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 1
ASGNI4
line 170
;170:	}
LABELV $84
line 173
;171:
;172:	// clientNum holds the rotate offset
;173:	ent->s.clientNum = owner->s.clientNum;
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 175
;174:
;175:	VectorCopy( owner->s.origin, ent->s.origin2 );
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 178
;176:
;177:	// see if the portal_camera has a target
;178:	target = G_PickTarget( owner->target );
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 24
INDIRP4
ASGNP4
line 179
;179:	if ( target ) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $85
line 180
;180:		VectorSubtract( target->s.origin, owner->s.origin, dir );
ADDRLP4 4
ADDRLP4 16
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 16
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 16
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 181
;181:		VectorNormalize( dir );
ADDRLP4 4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 182
;182:	} else {
ADDRGP4 $86
JUMPV
LABELV $85
line 183
;183:		G_SetMovedir( owner->s.angles, dir );
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SetMovedir
CALLV
pop
line 184
;184:	}
LABELV $86
line 186
;185:
;186:	ent->s.eventParm = DirToByte( dir );
ADDRLP4 4
ARGP4
ADDRLP4 28
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 187
;187:}
LABELV $75
endproc locateCamera 36 8
export SP_misc_portal_surface
proc SP_misc_portal_surface 4 4
line 193
;188:
;189:/*QUAKED misc_portal_surface (0 0 1) (-8 -8 -8) (8 8 8)
;190:The portal surface nearest this entity will show a view from the targeted misc_portal_camera, or a mirror view if untargeted.
;191:This must be within 64 world units of the surface!
;192:*/
;193:void SP_misc_portal_surface(gentity_t *ent) {
line 194
;194:	VectorClear( ent->r.mins );
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 440
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
CNSTF4 0
ASGNF4
line 195
;195:	VectorClear( ent->r.maxs );
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
CNSTF4 0
ASGNF4
line 196
;196:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 198
;197:
;198:	ent->r.svFlags = SVF_PORTAL;
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 64
ASGNI4
line 199
;199:	ent->s.eType = ET_PORTAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 6
ASGNI4
line 201
;200:
;201:	if ( !ent->target ) {
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $90
line 202
;202:		VectorCopy( ent->s.origin, ent->s.origin2 );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 203
;203:	} else {
ADDRGP4 $91
JUMPV
LABELV $90
line 204
;204:		ent->think = locateCamera;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 locateCamera
ASGNP4
line 205
;205:		ent->nextthink = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 206
;206:	}
LABELV $91
line 207
;207:}
LABELV $89
endproc SP_misc_portal_surface 4 4
export SP_misc_portal_camera
proc SP_misc_portal_camera 4 12
line 213
;208:
;209:/*QUAKED misc_portal_camera (0 0 1) (-8 -8 -8) (8 8 8) slowrotate fastrotate noswing
;210:The target for a misc_portal_director.  You can set either angles or target another entity to determine the direction of view.
;211:"roll" an angle modifier to orient the camera around the target vector;
;212:*/
;213:void SP_misc_portal_camera(gentity_t *ent) {
line 216
;214:	float	roll;
;215:
;216:	VectorClear( ent->r.mins );
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 440
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
CNSTF4 0
ASGNF4
line 217
;217:	VectorClear( ent->r.maxs );
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
CNSTF4 0
ASGNF4
line 218
;218:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 220
;219:
;220:	G_SpawnFloat( "roll", "0", &roll );
ADDRGP4 $94
ARGP4
ADDRGP4 $95
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 222
;221:
;222:	ent->s.clientNum = roll/360.0 * 256;
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
ADDRLP4 0
INDIRF4
CNSTF4 1060506465
MULF4
CVFI4 4
ASGNI4
line 223
;223:}
LABELV $93
endproc SP_misc_portal_camera 4 12
export Use_Shooter
proc Use_Shooter 76 12
line 233
;224:
;225:/*
;226:======================================================================
;227:
;228:  SHOOTERS
;229:
;230:======================================================================
;231:*/
;232:
;233:void Use_Shooter( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 239
;234:	vec3_t		dir;
;235:	float		deg;
;236:	vec3_t		up, right;
;237:
;238:	// see if we have a target
;239:	if ( ent->enemy ) {
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $97
line 240
;240:		VectorSubtract( ent->enemy->r.currentOrigin, ent->s.origin, dir );
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 40
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 40
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 44
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDRLP4 44
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 241
;241:		VectorNormalize( dir );
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 242
;242:	} else {
ADDRGP4 $98
JUMPV
LABELV $97
line 243
;243:		VectorCopy( ent->movedir, dir );
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRB
ASGNB 12
line 244
;244:	}
LABELV $98
line 247
;245:
;246:	// randomize a bit
;247:	PerpendicularVector( up, dir );
ADDRLP4 16
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 PerpendicularVector
CALLV
pop
line 248
;248:	CrossProduct( up, dir, right );
ADDRLP4 16
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 250
;249:
;250:	deg = crandom() * ent->random;
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 40
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
SUBF4
CNSTF4 1073741824
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRF4
MULF4
ASGNF4
line 251
;251:	VectorMA( dir, deg, up, dir );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 16
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 16+4
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 16+8
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 253
;252:
;253:	deg = crandom() * ent->random;
ADDRLP4 48
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 48
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
SUBF4
CNSTF4 1073741824
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRF4
MULF4
ASGNF4
line 254
;254:	VectorMA( dir, deg, right, dir );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 28
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 28+4
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 28+8
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 256
;255:
;256:	VectorNormalize( dir );
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 258
;257:
;258:	switch ( ent->s.weapon ) {
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 4
EQI4 $116
ADDRLP4 56
INDIRI4
CNSTI4 5
EQI4 $117
ADDRLP4 56
INDIRI4
CNSTI4 8
EQI4 $118
ADDRGP4 $113
JUMPV
LABELV $116
line 260
;259:	case WP_GRENADE_LAUNCHER:
;260:		fire_grenade( ent, ent->s.origin, dir );
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 fire_grenade
CALLP4
pop
line 261
;261:		break;
ADDRGP4 $114
JUMPV
LABELV $117
line 263
;262:	case WP_ROCKET_LAUNCHER:
;263:		fire_rocket( ent, ent->s.origin, dir );
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 fire_rocket
CALLP4
pop
line 264
;264:		break;
ADDRGP4 $114
JUMPV
LABELV $118
line 266
;265:	case WP_PLASMAGUN:
;266:		fire_plasma( ent, ent->s.origin, dir );
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 fire_plasma
CALLP4
pop
line 267
;267:		break;
LABELV $113
LABELV $114
line 270
;268:	}
;269:
;270:	G_AddEvent( ent, EV_FIRE_WEAPON, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 23
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 271
;271:}
LABELV $96
endproc Use_Shooter 76 12
proc InitShooter_Finish 8 4
line 274
;272:
;273:
;274:static void InitShooter_Finish( gentity_t *ent ) {
line 275
;275:	ent->enemy = G_PickTarget( ent->target );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 276
;276:	ent->think = 0;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTP4 0
ASGNP4
line 277
;277:	ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
line 278
;278:}
LABELV $119
endproc InitShooter_Finish 8 4
export InitShooter
proc InitShooter 16 8
line 280
;279:
;280:void InitShooter( gentity_t *ent, int weapon ) {
line 281
;281:	ent->use = Use_Shooter;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 Use_Shooter
ASGNP4
line 282
;282:	ent->s.weapon = weapon;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 284
;283:
;284:	RegisterItem( BG_FindItemForWeapon( weapon ) );
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 286
;285:
;286:	G_SetMovedir( ent->s.angles, ent->movedir );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 676
ADDP4
ARGP4
ADDRGP4 G_SetMovedir
CALLV
pop
line 288
;287:
;288:	if ( !ent->random ) {
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRF4
CNSTF4 0
NEF4 $121
line 289
;289:		ent->random = 1.0;
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
CNSTF4 1065353216
ASGNF4
line 290
;290:	}
LABELV $121
line 291
;291:	ent->random = sin( M_PI * ent->random / 180 );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 808
ADDP4
INDIRF4
CNSTF4 1016003125
MULF4
ARGF4
ADDRLP4 12
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 808
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
line 293
;292:	// target might be a moving object, so we can't set movedir for it
;293:	if ( ent->target ) {
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $123
line 294
;294:		ent->think = InitShooter_Finish;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 InitShooter_Finish
ASGNP4
line 295
;295:		ent->nextthink = level.time + 500;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 296
;296:	}
LABELV $123
line 297
;297:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 298
;298:}
LABELV $120
endproc InitShooter 16 8
export SP_shooter_rocket
proc SP_shooter_rocket 0 8
line 304
;299:
;300:/*QUAKED shooter_rocket (1 0 0) (-16 -16 -16) (16 16 16)
;301:Fires at either the target or the current direction.
;302:"random" the number of degrees of deviance from the taget. (1.0 default)
;303:*/
;304:void SP_shooter_rocket( gentity_t *ent ) {
line 305
;305:	InitShooter( ent, WP_ROCKET_LAUNCHER );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 InitShooter
CALLV
pop
line 306
;306:}
LABELV $126
endproc SP_shooter_rocket 0 8
export SP_shooter_plasma
proc SP_shooter_plasma 0 8
line 312
;307:
;308:/*QUAKED shooter_plasma (1 0 0) (-16 -16 -16) (16 16 16)
;309:Fires at either the target or the current direction.
;310:"random" is the number of degrees of deviance from the taget. (1.0 default)
;311:*/
;312:void SP_shooter_plasma( gentity_t *ent ) {
line 313
;313:	InitShooter( ent, WP_PLASMAGUN);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 8
ARGI4
ADDRGP4 InitShooter
CALLV
pop
line 314
;314:}
LABELV $127
endproc SP_shooter_plasma 0 8
export SP_shooter_grenade
proc SP_shooter_grenade 0 8
line 320
;315:
;316:/*QUAKED shooter_grenade (1 0 0) (-16 -16 -16) (16 16 16)
;317:Fires at either the target or the current direction.
;318:"random" is the number of degrees of deviance from the taget. (1.0 default)
;319:*/
;320:void SP_shooter_grenade( gentity_t *ent ) {
line 321
;321:	InitShooter( ent, WP_GRENADE_LAUNCHER);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 InitShooter
CALLV
pop
line 322
;322:}
LABELV $128
endproc SP_shooter_grenade 0 8
proc PortalDie 0 4
line 325
;323:
;324:
;325:static void PortalDie (gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod) {
line 326
;326:	G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 328
;327:	//FIXME do something more interesting
;328:}
LABELV $129
endproc PortalDie 0 4
export DropPortalDestination
proc DropPortalDestination 36 8
line 331
;329:
;330:
;331:void DropPortalDestination( gentity_t *player ) {
line 336
;332:	gentity_t	*ent;
;333:	vec3_t		snapped;
;334:
;335:	// create the portal destination
;336:	ent = G_Spawn();
ADDRLP4 16
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 337
;337:	ent->s.modelindex = G_ModelIndex( "models/powerups/teleporter/tele_exit.md3" );
ADDRGP4 $131
ARGP4
ADDRLP4 20
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 339
;338:
;339:	VectorCopy( player->s.pos.trBase, snapped );
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 340
;340:	SnapVector( snapped );
ADDRLP4 4
ADDRLP4 4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 341
;341:	G_SetOrigin( ent, snapped );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 342
;342:	VectorCopy( player->r.mins, ent->r.mins );
ADDRLP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRB
ASGNB 12
line 343
;343:	VectorCopy( player->r.maxs, ent->r.maxs );
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
INDIRB
ASGNB 12
line 345
;344:
;345:	ent->classname = "hi_portal destination";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $136
ASGNP4
line 346
;346:	ent->s.pos.trType = TR_STATIONARY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 348
;347:
;348:	ent->r.contents = CONTENTS_CORPSE;
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 67108864
ASGNI4
line 349
;349:	ent->takedamage = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
CNSTI4 1
ASGNI4
line 350
;350:	ent->health = 200;
ADDRLP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 200
ASGNI4
line 351
;351:	ent->die = PortalDie;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 PortalDie
ASGNP4
line 353
;352:
;353:	VectorCopy( player->s.apos.trBase, ent->s.angles );
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 355
;354:
;355:	ent->think = G_FreeEntity;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 356
;356:	ent->nextthink = level.time + 2 * 60 * 1000;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 120000
ADDI4
ASGNI4
line 358
;357:
;358:	trap_LinkEntity( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 360
;359:
;360:	player->client->portalID = ++level.portalSequence;
ADDRLP4 24
ADDRGP4 level+7688
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 24
INDIRP4
ADDRLP4 28
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 784
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 361
;361:	ent->count = player->client->portalID;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
ASGNI4
line 364
;362:
;363:	// give the item back so they can drop the source now
;364:	player->client->ps.stats[STAT_HOLDABLE_ITEM] = BG_FindItem( "Portal" ) - bg_itemlist;
ADDRGP4 $139
ARGP4
ADDRLP4 32
ADDRGP4 BG_FindItem
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 188
ADDP4
ADDRLP4 32
INDIRP4
CVPU4 4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
ASGNI4
line 365
;365:}
LABELV $130
endproc DropPortalDestination 36 8
proc PortalTouch 16 32
line 368
;366:
;367:
;368:static void PortalTouch( gentity_t *self, gentity_t *other, trace_t *trace) {
line 372
;369:	gentity_t	*destination;
;370:
;371:	// see if we will even let other try to use it
;372:	if( other->health <= 0 ) {
ADDRFP4 4
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 0
GTI4 $141
line 373
;373:		return;
ADDRGP4 $140
JUMPV
LABELV $141
line 375
;374:	}
;375:	if( !other->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $143
line 376
;376:		return;
ADDRGP4 $140
JUMPV
LABELV $143
line 382
;377:	}
;378://	if( other->client->ps.persistant[PERS_TEAM] != self->spawnflags ) {
;379://		return;
;380://	}
;381:
;382:	if ( other->client->ps.powerups[PW_NEUTRALFLAG] ) {		// only happens in One Flag CTF
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $145
line 383
;383:		Drop_Item( other, BG_FindItemForPowerup( PW_NEUTRALFLAG ), 0 );
CNSTI4 9
ARGI4
ADDRLP4 4
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Drop_Item
CALLP4
pop
line 384
;384:		other->client->ps.powerups[PW_NEUTRALFLAG] = 0;
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 348
ADDP4
CNSTI4 0
ASGNI4
line 385
;385:	}
ADDRGP4 $146
JUMPV
LABELV $145
line 386
;386:	else if ( other->client->ps.powerups[PW_REDFLAG] ) {		// only happens in standard CTF
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $147
line 387
;387:		Drop_Item( other, BG_FindItemForPowerup( PW_REDFLAG ), 0 );
CNSTI4 7
ARGI4
ADDRLP4 4
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Drop_Item
CALLP4
pop
line 388
;388:		other->client->ps.powerups[PW_REDFLAG] = 0;
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 0
ASGNI4
line 389
;389:	}
ADDRGP4 $148
JUMPV
LABELV $147
line 390
;390:	else if ( other->client->ps.powerups[PW_BLUEFLAG] ) {	// only happens in standard CTF
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $149
line 391
;391:		Drop_Item( other, BG_FindItemForPowerup( PW_BLUEFLAG ), 0 );
CNSTI4 8
ARGI4
ADDRLP4 4
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Drop_Item
CALLP4
pop
line 392
;392:		other->client->ps.powerups[PW_BLUEFLAG] = 0;
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 344
ADDP4
CNSTI4 0
ASGNI4
line 393
;393:	}
LABELV $149
LABELV $148
LABELV $146
line 396
;394:
;395:	// find the destination
;396:	destination = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $152
JUMPV
LABELV $151
line 397
;397:	while( (destination = G_Find(destination, FOFS(classname), "hi_portal destination")) != NULL ) {
line 398
;398:		if( destination->count == self->count ) {
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
NEI4 $154
line 399
;399:			break;
ADDRGP4 $153
JUMPV
LABELV $154
line 401
;400:		}
;401:	}
LABELV $152
line 397
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 524
ARGI4
ADDRGP4 $136
ARGP4
ADDRLP4 4
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $151
LABELV $153
line 404
;402:
;403:	// if there is not one, die!
;404:	if( !destination ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $156
line 405
;405:		if( self->pos1[0] || self->pos1[1] || self->pos1[2] ) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 612
ADDP4
INDIRF4
CNSTF4 0
NEF4 $161
ADDRLP4 8
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
CNSTF4 0
NEF4 $161
ADDRLP4 8
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
CNSTF4 0
EQF4 $158
LABELV $161
line 406
;406:			TeleportPlayer( other, self->pos1, self->s.angles );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 612
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRGP4 TeleportPlayer
CALLV
pop
line 407
;407:		}
LABELV $158
line 408
;408:		G_Damage( other, other, other, NULL, NULL, 100000, DAMAGE_NO_PROTECTION, MOD_TELEFRAG );
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTI4 100000
ARGI4
CNSTI4 8
ARGI4
CNSTI4 18
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 409
;409:		return;
ADDRGP4 $140
JUMPV
LABELV $156
line 412
;410:	}
;411:
;412:	TeleportPlayer( other, destination->s.pos.trBase, destination->s.angles );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRGP4 TeleportPlayer
CALLV
pop
line 413
;413:}
LABELV $140
endproc PortalTouch 16 32
proc PortalEnable 0 0
line 416
;414:
;415:
;416:static void PortalEnable( gentity_t *self ) {
line 417
;417:	self->touch = PortalTouch;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 PortalTouch
ASGNP4
line 418
;418:	self->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 419
;419:	self->nextthink = level.time + 2 * 60 * 1000;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 120000
ADDI4
ASGNI4
line 420
;420:}
LABELV $162
endproc PortalEnable 0 0
export DropPortalSource
proc DropPortalSource 32 12
line 423
;421:
;422:
;423:void DropPortalSource( gentity_t *player ) {
line 429
;424:	gentity_t	*ent;
;425:	gentity_t	*destination;
;426:	vec3_t		snapped;
;427:
;428:	// create the portal source
;429:	ent = G_Spawn();
ADDRLP4 20
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 430
;430:	ent->s.modelindex = G_ModelIndex( "models/powerups/teleporter/tele_enter.md3" );
ADDRGP4 $165
ARGP4
ADDRLP4 24
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 160
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 432
;431:
;432:	VectorCopy( player->s.pos.trBase, snapped );
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 433
;433:	SnapVector( snapped );
ADDRLP4 8
ADDRLP4 8
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 8+4
ADDRLP4 8+4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 8+8
ADDRLP4 8+8
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 434
;434:	G_SetOrigin( ent, snapped );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 435
;435:	VectorCopy( player->r.mins, ent->r.mins );
ADDRLP4 4
INDIRP4
CNSTI4 436
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRB
ASGNB 12
line 436
;436:	VectorCopy( player->r.maxs, ent->r.maxs );
ADDRLP4 4
INDIRP4
CNSTI4 448
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
INDIRB
ASGNB 12
line 438
;437:
;438:	ent->classname = "hi_portal source";
ADDRLP4 4
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $170
ASGNP4
line 439
;439:	ent->s.pos.trType = TR_STATIONARY;
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 441
;440:
;441:	ent->r.contents = CONTENTS_CORPSE | CONTENTS_TRIGGER;
ADDRLP4 4
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 1140850688
ASGNI4
line 442
;442:	ent->takedamage = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 736
ADDP4
CNSTI4 1
ASGNI4
line 443
;443:	ent->health = 200;
ADDRLP4 4
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 200
ASGNI4
line 444
;444:	ent->die = PortalDie;
ADDRLP4 4
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 PortalDie
ASGNP4
line 446
;445:
;446:	trap_LinkEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 448
;447:
;448:	ent->count = player->client->portalID;
ADDRLP4 4
INDIRP4
CNSTI4 760
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
ASGNI4
line 449
;449:	player->client->portalID = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 784
ADDP4
CNSTI4 0
ASGNI4
line 453
;450:
;451://	ent->spawnflags = player->client->ps.persistant[PERS_TEAM];
;452:
;453:	ent->nextthink = level.time + 1000;
ADDRLP4 4
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 454
;454:	ent->think = PortalEnable;
ADDRLP4 4
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 PortalEnable
ASGNP4
line 457
;455:
;456:	// find the destination
;457:	destination = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $173
JUMPV
LABELV $172
line 458
;458:	while( (destination = G_Find(destination, FOFS(classname), "hi_portal destination")) != NULL ) {
line 459
;459:		if( destination->count == ent->count ) {
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
NEI4 $175
line 460
;460:			VectorCopy( destination->s.pos.trBase, ent->pos1 );
ADDRLP4 4
INDIRP4
CNSTI4 612
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 461
;461:			break;
ADDRGP4 $174
JUMPV
LABELV $175
line 463
;462:		}
;463:	}
LABELV $173
line 458
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 524
ARGI4
ADDRGP4 $136
ARGP4
ADDRLP4 28
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $172
LABELV $174
line 465
;464:
;465:}
LABELV $164
endproc DropPortalSource 32 12
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
import G_NewString
import G_SpawnEntitiesFromString
import G_SpawnVector
import G_SpawnInt
import G_SpawnFloat
import G_SpawnString
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
LABELV $170
byte 1 104
byte 1 105
byte 1 95
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 97
byte 1 108
byte 1 32
byte 1 115
byte 1 111
byte 1 117
byte 1 114
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $165
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
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
byte 1 47
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 95
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $139
byte 1 80
byte 1 111
byte 1 114
byte 1 116
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $136
byte 1 104
byte 1 105
byte 1 95
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 97
byte 1 108
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $131
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
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
byte 1 47
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 95
byte 1 101
byte 1 120
byte 1 105
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $95
byte 1 48
byte 1 0
align 1
LABELV $94
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $78
byte 1 67
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 102
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 112
byte 1 97
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
byte 1 10
byte 1 0
