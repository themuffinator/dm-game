export Use_Target_Give
code
proc Use_Target_Give 64 12
file "..\..\..\..\code\game\g_target.c"
line 10
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "g_local.h"
;4:
;5://==========================================================
;6:
;7:/*QUAKED target_give (1 0 0) (-8 -8 -8) (8 8 8)
;8:Gives the activator all the items pointed to.
;9:*/
;10:void Use_Target_Give( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 14
;11:	gentity_t	*t;
;12:	trace_t		trace;
;13:
;14:	if ( !activator->client ) {
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $56
line 15
;15:		return;
ADDRGP4 $55
JUMPV
LABELV $56
line 18
;16:	}
;17:
;18:	if ( !ent->target ) {
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $58
line 19
;19:		return;
ADDRGP4 $55
JUMPV
LABELV $58
line 22
;20:	}
;21:
;22:	memset( &trace, 0, sizeof( trace ) );
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 memset
CALLP4
pop
line 23
;23:	t = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $61
JUMPV
LABELV $60
line 24
;24:	while ( (t = G_Find (t, FOFS(targetname), ent->target)) != NULL ) {
line 25
;25:		if ( !t->item ) {
ADDRLP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $63
line 26
;26:			continue;
ADDRGP4 $61
JUMPV
LABELV $63
line 28
;27:		}
;28:		Touch_Item( t, activator, &trace );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Touch_Item
CALLV
pop
line 31
;29:
;30:		// make sure it isn't going to respawn or show any events
;31:		t->tag = TAG_DONTSPAWN;
ADDRLP4 0
INDIRP4
CNSTI4 820
ADDP4
CNSTI4 1
ASGNI4
line 32
;32:		t->nextthink = 0;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
line 33
;33:		trap_UnlinkEntity( t );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 34
;34:	}
LABELV $61
line 24
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 652
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 60
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $60
line 35
;35:}
LABELV $55
endproc Use_Target_Give 64 12
export SP_target_give
proc SP_target_give 0 0
line 37
;36:
;37:void SP_target_give( gentity_t *ent ) {
line 38
;38:	ent->use = Use_Target_Give;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 Use_Target_Give
ASGNP4
line 39
;39:}
LABELV $65
endproc SP_target_give 0 0
export Use_target_remove_powerups
proc Use_target_remove_powerups 0 12
line 48
;40:
;41:
;42://==========================================================
;43:
;44:/*QUAKED target_remove_powerups (1 0 0) (-8 -8 -8) (8 8 8)
;45:takes away all the activators powerups.
;46:Used to drop flight powerups into death puts.
;47:*/
;48:void Use_target_remove_powerups( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 49
;49:	if( !activator->client ) {
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $67
line 50
;50:		return;
ADDRGP4 $66
JUMPV
LABELV $67
line 53
;51:	}
;52:
;53:	if( activator->client->ps.powerups[PW_REDFLAG] ) {
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $69
line 54
;54:		Team_ReturnFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 55
;55:	} else if( activator->client->ps.powerups[PW_BLUEFLAG] ) {
ADDRGP4 $70
JUMPV
LABELV $69
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $71
line 56
;56:		Team_ReturnFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 57
;57:	} else if( activator->client->ps.powerups[PW_NEUTRALFLAG] ) {
ADDRGP4 $72
JUMPV
LABELV $71
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $73
line 58
;58:		Team_ReturnFlag( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 59
;59:	}
LABELV $73
LABELV $72
LABELV $70
line 61
;60:
;61:	memset( activator->client->ps.powerups, 0, sizeof( activator->client->ps.powerups ) );
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 64
ARGI4
ADDRGP4 memset
CALLP4
pop
line 62
;62:}
LABELV $66
endproc Use_target_remove_powerups 0 12
export SP_target_remove_powerups
proc SP_target_remove_powerups 0 0
line 64
;63:
;64:void SP_target_remove_powerups( gentity_t *ent ) {
line 65
;65:	ent->use = Use_target_remove_powerups;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 Use_target_remove_powerups
ASGNP4
line 66
;66:}
LABELV $75
endproc SP_target_remove_powerups 0 0
export Think_Target_Delay
proc Think_Target_Delay 4 8
line 75
;67:
;68:
;69://==========================================================
;70:
;71:/*QUAKED target_delay (1 0 0) (-8 -8 -8) (8 8 8)
;72:"wait" seconds to pause before firing targets.
;73:"random" delay variance, total delay = delay +/- random seconds
;74:*/
;75:void Think_Target_Delay( gentity_t *ent ) {
line 76
;76:	G_UseTargets( ent, ent->activator );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 77
;77:}
LABELV $76
endproc Think_Target_Delay 4 8
export Use_Target_Delay
proc Use_Target_Delay 8 0
line 79
;78:
;79:void Use_Target_Delay( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 80
;80:	ent->nextthink = level.time + ( ent->wait + ent->random * crandom() ) * 1000;
ADDRLP4 0
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRP4
CNSTI4 804
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 808
ADDP4
INDIRF4
ADDRLP4 0
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
MULF4
ADDF4
CNSTF4 1148846080
MULF4
ADDF4
CVFI4 4
ASGNI4
line 81
;81:	ent->think = Think_Target_Delay;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 Think_Target_Delay
ASGNP4
line 82
;82:	ent->activator = activator;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 83
;83:}
LABELV $77
endproc Use_Target_Delay 8 0
export SP_target_delay
proc SP_target_delay 4 12
line 85
;84:
;85:void SP_target_delay( gentity_t *ent ) {
line 87
;86:	// check delay for backwards compatability
;87:	if ( !G_SpawnFloat( "delay", "0", &ent->wait ) ) {
ADDRGP4 $82
ARGP4
ADDRGP4 $83
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 G_SpawnFloat
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $80
line 88
;88:		G_SpawnFloat( "wait", "1", &ent->wait );
ADDRGP4 $84
ARGP4
ADDRGP4 $85
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 89
;89:	}
LABELV $80
line 91
;90:
;91:	if ( !ent->wait ) {
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRF4
CNSTF4 0
NEF4 $86
line 92
;92:		ent->wait = 1;
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
CNSTF4 1065353216
ASGNF4
line 93
;93:	}
LABELV $86
line 94
;94:	ent->use = Use_Target_Delay;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 Use_Target_Delay
ASGNP4
line 95
;95:}
LABELV $79
endproc SP_target_delay 4 12
export Use_Target_Score
proc Use_Target_Score 4 12
line 105
;96:
;97:
;98://==========================================================
;99:
;100:/*QUAKED target_score (1 0 0) (-8 -8 -8) (8 8 8)
;101:"count" number of points to add, default 1
;102:
;103:The activator is given this many points.
;104:*/
;105:void Use_Target_Score (gentity_t *ent, gentity_t *other, gentity_t *activator) {
line 106
;106:	if ( !activator )
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $89
line 107
;107:		return;
ADDRGP4 $88
JUMPV
LABELV $89
line 108
;108:	AddScore( activator, ent->r.currentOrigin, ent->count );
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 109
;109:}
LABELV $88
endproc Use_Target_Score 4 12
export SP_target_score
proc SP_target_score 0 0
line 111
;110:
;111:void SP_target_score( gentity_t *ent ) {
line 112
;112:	if ( !ent->count ) {
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
NEI4 $92
line 113
;113:		ent->count = 1;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 1
ASGNI4
line 114
;114:	}
LABELV $92
line 115
;115:	ent->use = Use_Target_Score;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 Use_Target_Score
ASGNP4
line 116
;116:}
LABELV $91
endproc SP_target_score 0 0
export Use_Target_Print
proc Use_Target_Print 8 8
line 125
;117:
;118:
;119://==========================================================
;120:
;121:/*QUAKED target_print (1 0 0) (-8 -8 -8) (8 8 8) redteam blueteam private
;122:"message"	text to print
;123:If "private", only the activator gets the message.  If no checks, all clients get the message.
;124:*/
;125:void Use_Target_Print (gentity_t *ent, gentity_t *other, gentity_t *activator) {
line 126
;126:	if ( activator && activator->client && ( ent->spawnflags & 4 ) ) {
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $95
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $95
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $95
line 127
;127:		trap_SendServerCommand( activator-g_entities, va("cp \"%s\"", ent->message ));
ADDRGP4 $97
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 8
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 128
;128:		return;
ADDRGP4 $94
JUMPV
LABELV $95
line 131
;129:	}
;130:
;131:	if ( ent->spawnflags & 3 ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $98
line 132
;132:		if ( ent->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $100
line 133
;133:			G_TeamCommand( TEAM_RED, va("cp \"%s\"", ent->message) );
ADDRGP4 $97
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_TeamCommand
CALLV
pop
line 134
;134:		}
LABELV $100
line 135
;135:		if ( ent->spawnflags & 2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $94
line 136
;136:			G_TeamCommand( TEAM_BLUE, va("cp \"%s\"", ent->message) );
ADDRGP4 $97
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
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
ADDRGP4 G_TeamCommand
CALLV
pop
line 137
;137:		}
line 138
;138:		return;
ADDRGP4 $94
JUMPV
LABELV $98
line 141
;139:	}
;140:
;141:	G_BroadcastServerCommand( -1, va("cp \"%s\"", ent->message ));
ADDRGP4 $97
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 142
;142:}
LABELV $94
endproc Use_Target_Print 8 8
export SP_target_print
proc SP_target_print 0 0
line 144
;143:
;144:void SP_target_print( gentity_t *ent ) {
line 145
;145:	ent->use = Use_Target_Print;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 Use_Target_Print
ASGNP4
line 146
;146:}
LABELV $104
endproc SP_target_print 0 0
export Use_Target_Speaker
proc Use_Target_Speaker 4 12
line 164
;147:
;148:
;149://==========================================================
;150:
;151:
;152:/*QUAKED target_speaker (1 0 0) (-8 -8 -8) (8 8 8) looped-on looped-off global activator
;153:"noise"		wav file to play
;154:
;155:A global sound will play full volume throughout the level.
;156:Activator sounds will play on the player that activated the target.
;157:Global and activator sounds can't be combined with looping.
;158:Normal sounds play each time the target is used.
;159:Looped sounds will be toggled by use functions.
;160:Multiple identical looping sounds will just increase volume without any speed cost.
;161:"wait" : Seconds between auto triggerings, 0 = don't auto trigger
;162:"random"	wait variance, default is 0
;163:*/
;164:void Use_Target_Speaker (gentity_t *ent, gentity_t *other, gentity_t *activator) {
line 165
;165:	if (ent->spawnflags & 3) {	// looping sound toggles
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $106
line 166
;166:		if (ent->s.loopSound)
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
CNSTI4 0
EQI4 $108
line 167
;167:			ent->s.loopSound = 0;	// turn it off
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $107
JUMPV
LABELV $108
line 169
;168:		else
;169:			ent->s.loopSound = ent->noise_index;	// start it
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRI4
ASGNI4
line 170
;170:	}else {	// normal sound
ADDRGP4 $107
JUMPV
LABELV $106
line 171
;171:		if ( ent->spawnflags & 8 && activator ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $110
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $110
line 172
;172:			G_AddEvent( activator, EV_GENERAL_SOUND, ent->noise_index );
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 45
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 173
;173:		} else if (ent->spawnflags & 4) {
ADDRGP4 $111
JUMPV
LABELV $110
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $112
line 174
;174:			G_AddEvent( ent, EV_GLOBAL_SOUND, ent->noise_index );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 46
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 175
;175:		} else {
ADDRGP4 $113
JUMPV
LABELV $112
line 176
;176:			G_AddEvent( ent, EV_GENERAL_SOUND, ent->noise_index );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 45
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 177
;177:		}
LABELV $113
LABELV $111
line 178
;178:	}
LABELV $107
line 179
;179:}
LABELV $105
endproc Use_Target_Speaker 4 12
export SP_target_speaker
proc SP_target_speaker 100 16
line 181
;180:
;181:void SP_target_speaker( gentity_t *ent ) {
line 185
;182:	char	buffer[MAX_QPATH];
;183:	char	*s;
;184:
;185:	G_SpawnFloat( "wait", "0", &ent->wait );
ADDRGP4 $84
ARGP4
ADDRGP4 $83
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 186
;186:	G_SpawnFloat( "random", "0", &ent->random );
ADDRGP4 $115
ARGP4
ADDRGP4 $83
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 188
;187:
;188:	if ( !G_SpawnString( "noise", "NOSOUND", &s ) ) {
ADDRGP4 $118
ARGP4
ADDRGP4 $119
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 68
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
NEI4 $116
line 189
;189:		G_Error( "target_speaker without a noise key at %s", vtos( ent->s.origin ) );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 72
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $120
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 190
;190:	}
LABELV $116
line 194
;191:
;192:	// force all client relative sounds to be "activator" speakers that
;193:	// play on the entity that activates it
;194:	if ( s[0] == '*' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $121
line 195
;195:		ent->spawnflags |= 8;
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 196
;196:	}
LABELV $121
line 198
;197:
;198:	if (!strstr( s, ".wav" )) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $125
ARGP4
ADDRLP4 72
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 72
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $123
line 199
;199:		Com_sprintf (buffer, sizeof(buffer), "%s.wav", s );
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $126
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 200
;200:	} else {
ADDRGP4 $124
JUMPV
LABELV $123
line 201
;201:		Q_strncpyz( buffer, s, sizeof(buffer) );
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 202
;202:	}
LABELV $124
line 203
;203:	ent->noise_index = G_SoundIndex(buffer);
ADDRLP4 4
ARGP4
ADDRLP4 76
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
ADDRLP4 76
INDIRI4
ASGNI4
line 206
;204:
;205:	// a repeating speaker can be done completely client side
;206:	ent->s.eType = ET_SPEAKER;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 7
ASGNI4
line 207
;207:	ent->s.eventParm = ent->noise_index;
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 80
INDIRP4
CNSTI4 800
ADDP4
INDIRI4
ASGNI4
line 208
;208:	ent->s.frame = ent->wait * 10;
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 172
ADDP4
ADDRLP4 84
INDIRP4
CNSTI4 804
ADDP4
INDIRF4
CNSTF4 1092616192
MULF4
CVFI4 4
ASGNI4
line 209
;209:	ent->s.clientNum = ent->random * 10;
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 168
ADDP4
ADDRLP4 88
INDIRP4
CNSTI4 808
ADDP4
INDIRF4
CNSTF4 1092616192
MULF4
CVFI4 4
ASGNI4
line 213
;210:
;211:
;212:	// check for prestarted looping sound
;213:	if ( ent->spawnflags & 1 )
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $127
line 214
;214:		ent->s.loopSound = ent->noise_index;
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 156
ADDP4
ADDRLP4 92
INDIRP4
CNSTI4 800
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $128
JUMPV
LABELV $127
line 216
;215:	else
;216:		ent->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
LABELV $128
line 218
;217:
;218:	ent->use = Use_Target_Speaker;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 Use_Target_Speaker
ASGNP4
line 220
;219:
;220:	if (ent->spawnflags & 4) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $129
line 221
;221:		ent->r.svFlags |= SVF_BROADCAST;
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 222
;222:	}
LABELV $129
line 224
;223:
;224:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 96
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 228
;225:
;226:	// must link the entity so we get areas and clusters so
;227:	// the server can determine who to send updates to
;228:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 229
;229:}
LABELV $114
endproc SP_target_speaker 100 16
export target_laser_think
proc target_laser_think 104 32
line 238
;230:
;231:
;232:
;233://==========================================================
;234:
;235:/*QUAKED target_laser (0 .5 .8) (-8 -8 -8) (8 8 8) START_ON
;236:When triggered, fires a laser.  You can either set a target or a direction.
;237:*/
;238:void target_laser_think (gentity_t *self) {
line 244
;239:	vec3_t	end;
;240:	trace_t	tr;
;241:	vec3_t	point;
;242:
;243:	// if pointed at another entity, set movedir to point at it
;244:	if ( self->enemy ) {
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $132
line 245
;245:		VectorMA (self->enemy->s.origin, 0.5, self->enemy->r.mins, point);
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 80
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 436
ADDP4
INDIRF4
CNSTF4 1056964608
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 80
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 440
ADDP4
INDIRF4
CNSTF4 1056964608
MULF4
ADDF4
ASGNF4
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 84
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
CNSTF4 1056964608
MULF4
ADDF4
ASGNF4
line 246
;246:		VectorMA (point, 0.5, self->enemy->r.maxs, point);
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 88
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
CNSTF4 1056964608
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 88
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
CNSTF4 1056964608
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
CNSTF4 1056964608
MULF4
ADDF4
ASGNF4
line 247
;247:		VectorSubtract (point, self->s.origin, self->movedir);
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 676
ADDP4
ADDRLP4 0
INDIRF4
ADDRLP4 92
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 680
ADDP4
ADDRLP4 0+4
INDIRF4
ADDRLP4 96
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
CNSTI4 684
ADDP4
ADDRLP4 0+8
INDIRF4
ADDRLP4 100
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 248
;248:		VectorNormalize (self->movedir);
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 249
;249:	}
LABELV $132
line 252
;250:
;251:	// fire forward and see what we hit
;252:	VectorMA (self->s.origin, 2048, self->movedir, end);
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 80
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 676
ADDP4
INDIRF4
CNSTF4 1157627904
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 80
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
CNSTF4 1157627904
MULF4
ADDF4
ASGNF4
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12+8
ADDRLP4 84
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 684
ADDP4
INDIRF4
CNSTF4 1157627904
MULF4
ADDF4
ASGNF4
line 254
;253:
;254:	trap_Trace( &tr, self->s.origin, NULL, NULL, end, self->s.number, CONTENTS_SOLID|CONTENTS_BODY|CONTENTS_CORPSE);
ADDRLP4 24
ARGP4
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 92
ADDP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 88
INDIRP4
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 256
;255:
;256:	if ( tr.entityNum ) {
ADDRLP4 24+52
INDIRI4
CNSTI4 0
EQI4 $144
line 258
;257:		// hurt it if we can
;258:		G_Damage ( &g_entities[tr.entityNum], self, self->activator, self->movedir, 
ADDRLP4 24+52
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 92
INDIRP4
CNSTI4 772
ADDP4
INDIRP4
ARGP4
ADDRLP4 92
INDIRP4
CNSTI4 676
ADDP4
ARGP4
ADDRLP4 24+12
ARGP4
ADDRLP4 92
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
CNSTI4 21
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 260
;259:			tr.endpos, self->damage, DAMAGE_NO_KNOCKBACK, MOD_TARGET_LASER);
;260:	}
LABELV $144
line 262
;261:
;262:	VectorCopy (tr.endpos, self->s.origin2);
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 24+12
INDIRB
ASGNB 12
line 264
;263:
;264:	trap_LinkEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 265
;265:	self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 266
;266:}
LABELV $131
endproc target_laser_think 104 32
export target_laser_on
proc target_laser_on 4 4
line 269
;267:
;268:void target_laser_on (gentity_t *self)
;269:{
line 270
;270:	if (!self->activator)
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $152
line 271
;271:		self->activator = self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $152
line 272
;272:	target_laser_think (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 target_laser_think
CALLV
pop
line 273
;273:}
LABELV $151
endproc target_laser_on 4 4
export target_laser_off
proc target_laser_off 0 4
line 276
;274:
;275:void target_laser_off (gentity_t *self)
;276:{
line 277
;277:	trap_UnlinkEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 278
;278:	self->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
line 279
;279:}
LABELV $154
endproc target_laser_off 0 4
export target_laser_use
proc target_laser_use 0 4
line 282
;280:
;281:void target_laser_use (gentity_t *self, gentity_t *other, gentity_t *activator)
;282:{
line 283
;283:	self->activator = activator;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 284
;284:	if ( self->nextthink > 0 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
LEI4 $156
line 285
;285:		target_laser_off (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 target_laser_off
CALLV
pop
ADDRGP4 $157
JUMPV
LABELV $156
line 287
;286:	else
;287:		target_laser_on (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 target_laser_on
CALLV
pop
LABELV $157
line 288
;288:}
LABELV $155
endproc target_laser_use 0 4
export target_laser_start
proc target_laser_start 16 16
line 291
;289:
;290:void target_laser_start (gentity_t *self)
;291:{
line 294
;292:	gentity_t *ent;
;293:
;294:	self->s.eType = ET_BEAM;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 5
ASGNI4
line 296
;295:
;296:	if (self->target) {
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $159
line 297
;297:		ent = G_Find (NULL, FOFS(targetname), self->target);
CNSTP4 0
ARGP4
CNSTI4 652
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 298
;298:		if (!ent) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $161
line 299
;299:			G_Printf ("%s at %s: %s is a bad target\n", self->classname, vtos(self->s.origin), self->target);
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $163
ARGP4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 300
;300:		}
LABELV $161
line 301
;301:		self->enemy = ent;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 302
;302:	} else {
ADDRGP4 $160
JUMPV
LABELV $159
line 303
;303:		G_SetMovedir (self->s.angles, self->movedir);
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
line 304
;304:	}
LABELV $160
line 306
;305:
;306:	self->use = target_laser_use;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 target_laser_use
ASGNP4
line 307
;307:	self->think = target_laser_think;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 target_laser_think
ASGNP4
line 309
;308:
;309:	if ( !self->damage ) {
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
CNSTI4 0
NEI4 $164
line 310
;310:		self->damage = 1;
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
CNSTI4 1
ASGNI4
line 311
;311:	}
LABELV $164
line 313
;312:
;313:	if (self->spawnflags & 1)
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $166
line 314
;314:		target_laser_on (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 target_laser_on
CALLV
pop
ADDRGP4 $167
JUMPV
LABELV $166
line 316
;315:	else
;316:		target_laser_off (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 target_laser_off
CALLV
pop
LABELV $167
line 317
;317:}
LABELV $158
endproc target_laser_start 16 16
export SP_target_laser
proc SP_target_laser 0 0
line 320
;318:
;319:void SP_target_laser (gentity_t *self)
;320:{
line 322
;321:	// let everything else get spawned before we start firing
;322:	self->think = target_laser_start;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 target_laser_start
ASGNP4
line 323
;323:	self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 324
;324:}
LABELV $168
endproc SP_target_laser 0 0
export target_teleporter_use
proc target_teleporter_use 16 12
line 329
;325:
;326:
;327://==========================================================
;328:
;329:void target_teleporter_use( gentity_t *self, gentity_t *other, gentity_t *activator ) {
line 332
;330:	gentity_t	*dest;
;331:
;332:	if ( !activator || !activator->client )
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $173
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $171
LABELV $173
line 333
;333:		return;
ADDRGP4 $170
JUMPV
LABELV $171
line 334
;334:	dest = 	G_PickTarget( self->target );
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 335
;335:	if (!dest) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $174
line 336
;336:		G_Printf ("Couldn't find teleporter destination\n");
ADDRGP4 $176
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 337
;337:		return;
ADDRGP4 $170
JUMPV
LABELV $174
line 340
;338:	}
;339:
;340:	TeleportPlayer( activator, dest->s.origin, dest->s.angles );
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
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
line 341
;341:}
LABELV $170
endproc target_teleporter_use 16 12
export SP_target_teleporter
proc SP_target_teleporter 4 12
line 346
;342:
;343:/*QUAKED target_teleporter (1 0 0) (-8 -8 -8) (8 8 8)
;344:The activator will be teleported away.
;345:*/
;346:void SP_target_teleporter( gentity_t *self ) {
line 347
;347:	if (!self->targetname)
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $178
line 348
;348:		G_Printf("untargeted %s at %s\n", self->classname, vtos(self->s.origin));
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $180
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
LABELV $178
line 350
;349:
;350:	self->use = target_teleporter_use;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 target_teleporter_use
ASGNP4
line 351
;351:}
LABELV $177
endproc SP_target_teleporter 4 12
export target_relay_use
proc target_relay_use 24 12
line 361
;352:
;353://==========================================================
;354:
;355:
;356:/*QUAKED target_relay (.5 .5 .5) (-8 -8 -8) (8 8 8) RED_ONLY BLUE_ONLY RANDOM
;357:This doesn't perform any actions except fire its targets.
;358:The activator can be forced to be from a certain team.
;359:if RANDOM is checked, only one of the targets will be fired, not all of them
;360:*/
;361:void target_relay_use (gentity_t *self, gentity_t *other, gentity_t *activator) {
line 363
;362:
;363:	if ( ( self->spawnflags & 1 ) && activator && activator->client 
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $182
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $182
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $182
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 1
EQI4 $182
line 364
;364:		&& activator->client->sess.sessionTeam != TEAM_RED ) {
line 365
;365:		return;
ADDRGP4 $181
JUMPV
LABELV $182
line 367
;366:	}
;367:	if ( ( self->spawnflags & 2 ) && activator && activator->client 
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $184
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $184
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $184
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 2
EQI4 $184
line 368
;368:		&& activator->client->sess.sessionTeam != TEAM_BLUE ) {
line 369
;369:		return;
ADDRGP4 $181
JUMPV
LABELV $184
line 371
;370:	}
;371:	if ( self->spawnflags & 4 ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $186
line 374
;372:		gentity_t	*ent;
;373:
;374:		ent = G_PickTarget( self->target );
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 375
;375:		if ( ent && ent->use ) {
ADDRLP4 16
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $181
ADDRLP4 16
INDIRP4
CNSTI4 708
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $181
line 376
;376:			ent->use( ent, self, activator );
ADDRLP4 20
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 708
ADDP4
INDIRP4
CALLV
pop
line 377
;377:		}
line 378
;378:		return;
ADDRGP4 $181
JUMPV
LABELV $186
line 380
;379:	}
;380:	G_UseTargets (self, activator);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 381
;381:}
LABELV $181
endproc target_relay_use 24 12
export SP_target_relay
proc SP_target_relay 0 0
line 383
;382:
;383:void SP_target_relay (gentity_t *self) {
line 384
;384:	self->use = target_relay_use;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 target_relay_use
ASGNP4
line 385
;385:}
LABELV $190
endproc SP_target_relay 0 0
export target_kill_use
proc target_kill_use 0 32
line 393
;386:
;387:
;388://==========================================================
;389:
;390:/*QUAKED target_kill (.5 .5 .5) (-8 -8 -8) (8 8 8)
;391:Kills the activator.
;392:*/
;393:void target_kill_use( gentity_t *self, gentity_t *other, gentity_t *activator ) {
line 394
;394:	if ( !activator )
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $192
line 395
;395:		return;
ADDRGP4 $191
JUMPV
LABELV $192
line 396
;396:	G_Damage ( activator, NULL, NULL, NULL, NULL, 100000, DAMAGE_NO_PROTECTION, MOD_TELEFRAG);
ADDRFP4 8
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
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
line 397
;397:}
LABELV $191
endproc target_kill_use 0 32
export SP_target_kill
proc SP_target_kill 0 0
line 399
;398:
;399:void SP_target_kill( gentity_t *self ) {
line 400
;400:	self->use = target_kill_use;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 target_kill_use
ASGNP4
line 401
;401:}
LABELV $194
endproc SP_target_kill 0 0
export SP_target_position
proc SP_target_position 4 8
line 406
;402:
;403:/*QUAKED target_position (0 0.5 0) (-4 -4 -4) (4 4 4)
;404:Used as a positional target for in-game calculation, like jumppad targets.
;405:*/
;406:void SP_target_position( gentity_t *self ){
line 407
;407:	G_SetOrigin( self, self->s.origin );
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
line 408
;408:}
LABELV $195
endproc SP_target_position 4 8
proc target_location_linkup 16 8
line 411
;409:
;410:static void target_location_linkup(gentity_t *ent)
;411:{
line 415
;412:	int i;
;413:	int n;
;414:
;415:	if (level.locationLinked) 
ADDRGP4 level+7644
INDIRI4
CNSTI4 0
EQI4 $197
line 416
;416:		return;
ADDRGP4 $196
JUMPV
LABELV $197
line 418
;417:
;418:	level.locationLinked = qtrue;
ADDRGP4 level+7644
CNSTI4 1
ASGNI4
line 420
;419:
;420:	level.locationHead = NULL;
ADDRGP4 level+7648
CNSTP4 0
ASGNP4
line 422
;421:
;422:	trap_SetConfigstring( CS_LOCATIONS, "unknown" );
CNSTI4 608
ARGI4
ADDRGP4 $202
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 424
;423:
;424:	for (i = 0, ent = g_entities, n = 1;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRFP4 0
ADDRGP4 g_entities
ASGNP4
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $206
JUMPV
LABELV $203
line 426
;425:			i < level.num_entities;
;426:			i++, ent++) {
line 427
;427:		if (ent->classname && !Q_stricmp(ent->classname, "target_location")) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $208
ADDRLP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $210
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $208
line 429
;428:			// lets overload some variables!
;429:			ent->health = n; // use for location marking
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 430
;430:			trap_SetConfigstring( CS_LOCATIONS + n, ent->message );
ADDRLP4 4
INDIRI4
CNSTI4 608
ADDI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 431
;431:			n++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 432
;432:			ent->nextTrain = level.locationHead;
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
ADDRGP4 level+7648
INDIRP4
ASGNP4
line 433
;433:			level.locationHead = ent;
ADDRGP4 level+7648
ADDRFP4 0
INDIRP4
ASGNP4
line 434
;434:		}
LABELV $208
line 435
;435:	}
LABELV $204
line 426
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
ASGNP4
LABELV $206
line 425
ADDRLP4 0
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $203
line 438
;436:
;437:	// All linked together now
;438:}
LABELV $196
endproc target_location_linkup 16 8
export SP_target_location
proc SP_target_location 4 8
line 448
;439:
;440:/*QUAKED target_location (0 0.5 0) (-8 -8 -8) (8 8 8)
;441:Set "message" to the name of this location.
;442:Set "count" to 0-7 for color.
;443:0:white 1:red 2:green 3:yellow 4:blue 5:cyan 6:magenta 7:white
;444:
;445:Closest target_location in sight used for the location, if none
;446:in site, closest in distance
;447:*/
;448:void SP_target_location( gentity_t *self ){
line 449
;449:	self->think = target_location_linkup;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 target_location_linkup
ASGNP4
line 450
;450:	self->nextthink = level.time + 200;  // Let them all spawn first
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 452
;451:
;452:	G_SetOrigin( self, self->s.origin );
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
line 453
;453:}
LABELV $213
endproc SP_target_location 4 8
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
LABELV $210
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
LABELV $202
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $180
byte 1 117
byte 1 110
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $176
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
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 114
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
byte 1 10
byte 1 0
align 1
LABELV $163
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $126
byte 1 37
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $125
byte 1 46
byte 1 119
byte 1 97
byte 1 118
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
byte 1 115
byte 1 112
byte 1 101
byte 1 97
byte 1 107
byte 1 101
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 110
byte 1 111
byte 1 105
byte 1 115
byte 1 101
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $119
byte 1 78
byte 1 79
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $118
byte 1 110
byte 1 111
byte 1 105
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $115
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $97
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $85
byte 1 49
byte 1 0
align 1
LABELV $84
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $83
byte 1 48
byte 1 0
align 1
LABELV $82
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
