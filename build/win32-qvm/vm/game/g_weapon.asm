export CalcMuzzlePointOrigin
code
proc CalcMuzzlePointOrigin 4 0
file "..\..\..\..\code\game\g_weapon.c"
line 21
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// g_weapon.c 
;4:// perform the server side effects of a weapon firing
;5:
;6:#include "g_local.h"
;7:
;8:static	float	s_quadFactor;
;9:static	vec3_t	forward, right, up;
;10:static	vec3_t	muzzle;
;11:static	vec3_t	muzzle_origin; // for hitscan weapon trace
;12:
;13:#define NUM_NAILSHOTS 15
;14:
;15:
;16:/*
;17:===============
;18:CalcMuzzlePointOrigin
;19:===============
;20:*/
;21:void CalcMuzzlePointOrigin( const gentity_t *ent, vec3_t origin, const vec3_t forward, const vec3_t right, const vec3_t up, vec3_t muzzlePoint ) {
line 22
;22:	VectorCopy( ent->client->ps.origin, origin );
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 23
;23:	origin[2] += ent->client->ps.viewheight;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 24
;24:	VectorMA( origin, 14.0, forward, muzzlePoint );
ADDRFP4 20
INDIRP4
ADDRFP4 4
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
CNSTF4 1096810496
MULF4
ADDF4
ASGNF4
ADDRFP4 20
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1096810496
MULF4
ADDF4
ASGNF4
ADDRFP4 20
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1096810496
MULF4
ADDF4
ASGNF4
line 27
;25:	// snap to integer coordinates for more efficient network bandwidth usage
;26:	//SnapVector( muzzlePoint );
;27:}
LABELV $55
endproc CalcMuzzlePointOrigin 4 0
export G_BounceProjectile
proc G_BounceProjectile 48 4
line 35
;28:
;29:
;30:/*
;31:================
;32:G_BounceProjectile
;33:================
;34:*/
;35:void G_BounceProjectile( vec3_t start, vec3_t impact, vec3_t dir, vec3_t endout ) {
line 39
;36:	vec3_t v, newv;
;37:	float dot;
;38:
;39:	VectorSubtract( impact, start, v );
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 32
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 40
;40:	dot = DotProduct( v, dir );
ADDRLP4 36
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRP4
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 41
;41:	VectorMA( v, -2*dot, dir, newv );
ADDRLP4 40
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRF4
ADDRLP4 40
INDIRP4
INDIRF4
ADDRLP4 24
INDIRF4
CNSTF4 3221225472
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
CNSTF4 3221225472
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 0+8
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
CNSTF4 3221225472
MULF4
MULF4
ADDF4
ASGNF4
line 43
;42:
;43:	VectorNormalize(newv);
ADDRLP4 12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 44
;44:	VectorMA(impact, 8192, newv, endout);
ADDRFP4 12
INDIRP4
ADDRFP4 4
INDIRP4
INDIRF4
ADDRLP4 12
INDIRF4
CNSTF4 1174405120
MULF4
ADDF4
ASGNF4
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 12+4
INDIRF4
CNSTF4 1174405120
MULF4
ADDF4
ASGNF4
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 12+8
INDIRF4
CNSTF4 1174405120
MULF4
ADDF4
ASGNF4
line 45
;45:}
LABELV $56
endproc G_BounceProjectile 48 4
export Weapon_Gauntlet
proc Weapon_Gauntlet 0 0
line 56
;46:
;47:
;48:/*
;49:======================================================================
;50:
;51:GAUNTLET
;52:
;53:======================================================================
;54:*/
;55:
;56:void Weapon_Gauntlet( gentity_t *ent ) {
line 58
;57:
;58:}
LABELV $67
endproc Weapon_Gauntlet 0 0
export CheckGauntletAttack
proc CheckGauntletAttack 92 32
line 65
;59:
;60:/*
;61:===============
;62:CheckGauntletAttack
;63:===============
;64:*/
;65:qboolean CheckGauntletAttack( gentity_t *ent ) {
line 73
;66:	trace_t		tr;
;67:	vec3_t		end;
;68:	gentity_t	*tent;
;69:	gentity_t	*traceEnt;
;70:	int			damage;
;71:	
;72:	// set aiming directions
;73:	AngleVectors( ent->client->ps.viewangles, forward, right, up );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 75
;74:
;75:	CalcMuzzlePointOrigin( ent, muzzle_origin, forward, right, up, muzzle );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle_origin
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 CalcMuzzlePointOrigin
CALLV
pop
line 77
;76:
;77:	VectorMA( muzzle_origin, ( 32.0 + 14.0 ), forward, end );
ADDRLP4 60
ADDRGP4 muzzle_origin
INDIRF4
ADDRGP4 forward
INDIRF4
CNSTF4 1110966272
MULF4
ADDF4
ASGNF4
ADDRLP4 60+4
ADDRGP4 muzzle_origin+4
INDIRF4
ADDRGP4 forward+4
INDIRF4
CNSTF4 1110966272
MULF4
ADDF4
ASGNF4
ADDRLP4 60+8
ADDRGP4 muzzle_origin+8
INDIRF4
ADDRGP4 forward+8
INDIRF4
CNSTF4 1110966272
MULF4
ADDF4
ASGNF4
line 79
;78:
;79:	trap_Trace( &tr, muzzle_origin, NULL, NULL, end, ent->s.number, MASK_SHOT );
ADDRLP4 4
ARGP4
ADDRGP4 muzzle_origin
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 60
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 80
;80:	if ( tr.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 4+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $75
line 81
;81:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $68
JUMPV
LABELV $75
line 84
;82:	}
;83:
;84:	if ( ent->client->noclip ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
CNSTI4 0
EQI4 $78
line 85
;85:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $68
JUMPV
LABELV $78
line 88
;86:	}
;87:
;88:	traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 0
ADDRLP4 4+52
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 91
;89:
;90:	// send blood impact
;91:	if ( traceEnt->takedamage && traceEnt->client ) {
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
EQI4 $81
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $81
line 92
;92:		tent = G_TempEntity( tr.endpos, EV_MISSILE_HIT );
ADDRLP4 4+12
ARGP4
CNSTI4 50
ARGI4
ADDRLP4 84
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 84
INDIRP4
ASGNP4
line 93
;93:		tent->s.otherEntityNum = traceEnt->s.number;
ADDRLP4 72
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 94
;94:		tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 4+24
ARGP4
ADDRLP4 88
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 88
INDIRI4
ASGNI4
line 95
;95:		tent->s.weapon = ent->s.weapon;
ADDRLP4 72
INDIRP4
CNSTI4 192
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
line 96
;96:	}
LABELV $81
line 98
;97:
;98:	if ( !traceEnt->takedamage ) {
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
NEI4 $85
line 99
;99:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $68
JUMPV
LABELV $85
line 102
;100:	}
;101:
;102:	if (ent->client->ps.powerups[PW_QUAD] ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $87
line 103
;103:		G_AddEvent( ent, EV_POWERUP_QUAD, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 61
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 104
;104:		s_quadFactor = g_quadfactor.value;
ADDRGP4 s_quadFactor
ADDRGP4 g_quadfactor+8
INDIRF4
ASGNF4
line 105
;105:	} else {
ADDRGP4 $88
JUMPV
LABELV $87
line 106
;106:		s_quadFactor = 1.0;
ADDRGP4 s_quadFactor
CNSTF4 1065353216
ASGNF4
line 107
;107:	}
LABELV $88
line 108
;108:	if( ent->client->persistantPowerup && ent->client->persistantPowerup->item && ent->client->persistantPowerup->item->giTag == PW_DOUBLER ) {
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 780
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $90
ADDRLP4 84
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 780
ADDP4
INDIRP4
CNSTI4 812
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $90
ADDRLP4 84
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 780
ADDP4
INDIRP4
CNSTI4 812
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 12
NEI4 $90
line 109
;109:		s_quadFactor *= 2;
ADDRLP4 88
ADDRGP4 s_quadFactor
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRF4
CNSTF4 1073741824
MULF4
ASGNF4
line 110
;110:	}
LABELV $90
line 112
;111:
;112:	damage = 50 * s_quadFactor;
ADDRLP4 76
ADDRGP4 s_quadFactor
INDIRF4
CNSTF4 1112014848
MULF4
CVFI4 4
ASGNI4
line 113
;113:	G_Damage( traceEnt, ent, ent, forward, tr.endpos, damage, 0, MOD_GAUNTLET );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 76
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 115
;114:
;115:	return qtrue;
CNSTI4 1
RETI4
LABELV $68
endproc CheckGauntletAttack 92 32
export SnapVectorTowards
proc SnapVectorTowards 24 0
line 137
;116:}
;117:
;118:
;119:/*
;120:======================================================================
;121:
;122:MACHINEGUN
;123:
;124:======================================================================
;125:*/
;126:
;127:/*
;128:======================
;129:SnapVectorTowards
;130:
;131:Round a vector to integers for more efficient network
;132:transmission, but make sure that it rounds towards a given point
;133:rather than blindly truncating.  This prevents it from truncating 
;134:into a wall.
;135:======================
;136:*/
;137:void SnapVectorTowards( vec3_t v, vec3_t to ) {
line 140
;138:	int		i;
;139:
;140:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $94
line 141
;141:		if ( v[i] < 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $98
line 142
;142:			if ( to[i] >= v[i])
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
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
LTF4 $100
line 143
;143:			v[i] = (int)v[i];
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRGP4 $99
JUMPV
LABELV $100
line 145
;144:			else
;145:				v[i] = (int)v[i] - 1;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
ADDP4
INDIRF4
CVFI4 4
CNSTI4 1
SUBI4
CVIF4 4
ASGNF4
line 146
;146:		} else {
ADDRGP4 $99
JUMPV
LABELV $98
line 147
;147:			if ( to[i] <= v[i] )
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
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
GTF4 $102
line 148
;148:				v[i] = (int)v[i];
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRGP4 $103
JUMPV
LABELV $102
line 150
;149:			else
;150:			v[i] = (int)v[i] + 1;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
ADDP4
INDIRF4
CVFI4 4
CNSTI4 1
ADDI4
CVIF4 4
ASGNF4
LABELV $103
line 151
;151:		}
LABELV $99
line 152
;152:	}
LABELV $95
line 140
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $94
line 153
;153:}
LABELV $93
endproc SnapVectorTowards 24 0
proc Bullet_Fire 160 32
line 160
;154:
;155:#define CHAINGUN_SPREAD		600
;156:#define MACHINEGUN_SPREAD	200
;157:#define	MACHINEGUN_DAMAGE	7
;158:#define	MACHINEGUN_TEAM_DAMAGE	5		// wimpier MG in teamplay
;159:
;160:static void Bullet_Fire( gentity_t *ent, float spread, int damage ) {
line 170
;161:	trace_t		tr;
;162:	vec3_t		end;
;163:	vec3_t		impactpoint, bouncedir;
;164:	float		r;
;165:	float		u;
;166:	gentity_t	*tent;
;167:	gentity_t	*traceEnt;
;168:	int			i, passent;
;169:
;170:	damage *= s_quadFactor;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 172
;171:
;172:	r = random() * M_PI * 2.0f;
ADDRLP4 116
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 84
ADDRLP4 116
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 961089901
MULF4
ASGNF4
line 173
;173:	u = sin(r) * crandom() * spread * 16;
ADDRLP4 84
INDIRF4
ARGF4
ADDRLP4 120
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 124
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 100
ADDRLP4 120
INDIRF4
ADDRLP4 124
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
ADDRFP4 4
INDIRF4
MULF4
CNSTF4 1098907648
MULF4
ASGNF4
line 174
;174:	r = cos(r) * crandom() * spread * 16;
ADDRLP4 84
INDIRF4
ARGF4
ADDRLP4 128
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 132
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 84
ADDRLP4 128
INDIRF4
ADDRLP4 132
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
ADDRFP4 4
INDIRF4
MULF4
CNSTF4 1098907648
MULF4
ASGNF4
line 176
;175:
;176:	VectorMA( muzzle_origin, ( 8192.0 * 16.0 ), forward, end );
ADDRLP4 64
ADDRGP4 muzzle_origin
INDIRF4
ADDRGP4 forward
INDIRF4
CNSTF4 1207959552
MULF4
ADDF4
ASGNF4
ADDRLP4 64+4
ADDRGP4 muzzle_origin+4
INDIRF4
ADDRGP4 forward+4
INDIRF4
CNSTF4 1207959552
MULF4
ADDF4
ASGNF4
ADDRLP4 64+8
ADDRGP4 muzzle_origin+8
INDIRF4
ADDRGP4 forward+8
INDIRF4
CNSTF4 1207959552
MULF4
ADDF4
ASGNF4
line 177
;177:	VectorMA( end, r, right, end );
ADDRLP4 64
ADDRLP4 64
INDIRF4
ADDRGP4 right
INDIRF4
ADDRLP4 84
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 64+4
INDIRF4
ADDRGP4 right+4
INDIRF4
ADDRLP4 84
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64+8
ADDRLP4 64+8
INDIRF4
ADDRGP4 right+8
INDIRF4
ADDRLP4 84
INDIRF4
MULF4
ADDF4
ASGNF4
line 178
;178:	VectorMA( end, u, up, end );
ADDRLP4 64
ADDRLP4 64
INDIRF4
ADDRGP4 up
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 64+4
INDIRF4
ADDRGP4 up+4
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64+8
ADDRLP4 64+8
INDIRF4
ADDRGP4 up+8
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ADDF4
ASGNF4
line 180
;179:
;180:	passent = ent->s.number;
ADDRLP4 80
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 181
;181:	for ( i = 0; i < 10; i++ ) {
ADDRLP4 76
CNSTI4 0
ASGNI4
LABELV $123
line 184
;182:
;183:		// unlagged
;184:		G_DoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 186
;185:
;186:		trap_Trace( &tr, muzzle_origin, NULL, NULL, end, passent, MASK_SHOT );
ADDRLP4 4
ARGP4
ADDRGP4 muzzle_origin
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 80
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 189
;187:
;188:		// unlagged
;189:		G_UndoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 191
;190:
;191:		if ( tr.surfaceFlags & SURF_NOIMPACT )
ADDRLP4 4+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $127
line 192
;192:			return;
ADDRGP4 $104
JUMPV
LABELV $127
line 194
;193:
;194:		traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 0
ADDRLP4 4+52
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 197
;195:
;196:		// snap the endpos to integers, but nudged towards the line
;197:		SnapVectorTowards( tr.endpos, muzzle_origin );
ADDRLP4 4+12
ARGP4
ADDRGP4 muzzle_origin
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 200
;198:
;199:		// send bullet impact
;200:		if ( traceEnt->takedamage && traceEnt->client ) {
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
EQI4 $132
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $132
line 201
;201:			tent = G_TempEntity( tr.endpos, EV_BULLET_HIT_FLESH );
ADDRLP4 4+12
ARGP4
CNSTI4 48
ARGI4
ADDRLP4 148
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 60
ADDRLP4 148
INDIRP4
ASGNP4
line 202
;202:			tent->s.eventParm = traceEnt->s.number;
ADDRLP4 60
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 205
;203:
;204:			// unlagged
;205:			tent->s.clientNum = ent->s.clientNum;
ADDRLP4 60
INDIRP4
CNSTI4 168
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 207
;206:
;207:			if( LogAccuracyHit( traceEnt, ent ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 152
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
EQI4 $133
line 208
;208:				ent->client->accuracy_hits++;
ADDRLP4 156
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 724
ADDP4
ASGNP4
ADDRLP4 156
INDIRP4
ADDRLP4 156
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 209
;209:			}
line 210
;210:		} else {
ADDRGP4 $133
JUMPV
LABELV $132
line 211
;211:			tent = G_TempEntity( tr.endpos, EV_BULLET_HIT_WALL );
ADDRLP4 4+12
ARGP4
CNSTI4 49
ARGI4
ADDRLP4 148
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 60
ADDRLP4 148
INDIRP4
ASGNP4
line 212
;212:			tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 4+24
ARGP4
ADDRLP4 152
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 152
INDIRI4
ASGNI4
line 213
;213:		}
LABELV $133
line 214
;214:		tent->s.otherEntityNum = ent->s.number;
ADDRLP4 60
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 216
;215:
;216:		if ( traceEnt->takedamage ) {
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
EQI4 $125
line 217
;217:			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $141
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $141
line 218
;218:				if (G_InvulnerabilityEffect( traceEnt, forward, tr.endpos, impactpoint, bouncedir )) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 152
ADDRGP4 G_InvulnerabilityEffect
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
EQI4 $144
line 219
;219:					G_BounceProjectile( muzzle, impactpoint, bouncedir, end );
ADDRGP4 muzzle
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 64
ARGP4
ADDRGP4 G_BounceProjectile
CALLV
pop
line 220
;220:					VectorCopy( impactpoint, muzzle );
ADDRGP4 muzzle
ADDRLP4 88
INDIRB
ASGNB 12
line 222
;221:					// the player can hit him/herself with the bounced rail
;222:					passent = ENTITYNUM_NONE;
ADDRLP4 80
CNSTI4 1023
ASGNI4
line 223
;223:				}
ADDRGP4 $124
JUMPV
LABELV $144
line 224
;224:				else {
line 225
;225:					VectorCopy( tr.endpos, muzzle );
ADDRGP4 muzzle
ADDRLP4 4+12
INDIRB
ASGNB 12
line 226
;226:					passent = traceEnt->s.number;
ADDRLP4 80
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 227
;227:				}
line 228
;228:				continue;
ADDRGP4 $124
JUMPV
LABELV $141
line 229
;229:			} else {
line 230
;230:				G_Damage( traceEnt, ent, ent, forward, tr.endpos, damage, 0, MOD_MACHINEGUN );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 152
INDIRP4
ARGP4
ADDRLP4 152
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4+12
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 231
;231:			}
line 232
;232:		}
line 233
;233:		break;
ADDRGP4 $125
JUMPV
LABELV $124
line 181
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 10
LTI4 $123
LABELV $125
line 235
;234:	}
;235:}
LABELV $104
endproc Bullet_Fire 160 32
export BFG_Fire
proc BFG_Fire 16 12
line 246
;236:
;237:
;238:/*
;239:======================================================================
;240:
;241:BFG
;242:
;243:======================================================================
;244:*/
;245:
;246:void BFG_Fire( gentity_t *ent ) {
line 249
;247:	gentity_t *m;
;248:
;249:	m = fire_bfg( ent, muzzle, forward );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4
ADDRGP4 fire_bfg
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 250
;250:	m->damage *= s_quadFactor;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 251
;251:	m->splashDamage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 254
;252:
;253://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;254:}
LABELV $149
endproc BFG_Fire 16 12
proc ShotgunPellet 108 32
line 269
;255:
;256:
;257:/*
;258:======================================================================
;259:
;260:SHOTGUN
;261:
;262:======================================================================
;263:*/
;264:
;265:// DEFAULT_SHOTGUN_SPREAD and DEFAULT_SHOTGUN_COUNT	are in bg_public.h, because
;266:// client predicts same spreads
;267:#define	DEFAULT_SHOTGUN_DAMAGE	10
;268:
;269:static qboolean ShotgunPellet( const vec3_t start, const vec3_t end, gentity_t *ent ) {
line 277
;270:	trace_t		tr;
;271:	int			damage, i, passent;
;272:	gentity_t	*traceEnt;
;273:#ifdef MISSIONPACK
;274:	vec3_t		impactpoint, bouncedir;
;275:#endif
;276:	vec3_t		tr_start, tr_end;
;277:	qboolean	hitClient = qfalse;
ADDRLP4 96
CNSTI4 0
ASGNI4
line 279
;278:
;279:	passent = ent->s.number;
ADDRLP4 64
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 280
;280:	VectorCopy( start, tr_start );
ADDRLP4 68
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 281
;281:	VectorCopy( end, tr_end );
ADDRLP4 80
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 283
;282:
;283:	for ( i = 0; i < 10; i++ ) {
ADDRLP4 60
CNSTI4 0
ASGNI4
LABELV $151
line 284
;284:		trap_Trace( &tr, tr_start, NULL, NULL, tr_end, passent, MASK_SHOT );
ADDRLP4 0
ARGP4
ADDRLP4 68
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 64
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 285
;285:		traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 56
ADDRLP4 0+52
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 288
;286:
;287:		// send bullet impact
;288:		if (  tr.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $156
line 289
;289:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $150
JUMPV
LABELV $156
line 292
;290:		}
;291:
;292:		if ( traceEnt->takedamage ) {
ADDRLP4 56
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
EQI4 $159
line 293
;293:			damage = DEFAULT_SHOTGUN_DAMAGE * s_quadFactor;
ADDRLP4 92
ADDRGP4 s_quadFactor
INDIRF4
CNSTF4 1092616192
MULF4
CVFI4 4
ASGNI4
line 309
;294:#ifdef MISSIONPACK
;295:			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
;296:				if (G_InvulnerabilityEffect( traceEnt, forward, tr.endpos, impactpoint, bouncedir )) {
;297:					G_BounceProjectile( tr_start, impactpoint, bouncedir, tr_end );
;298:					VectorCopy( impactpoint, tr_start );
;299:					// the player can hit him/herself with the bounced rail
;300:					passent = ENTITYNUM_NONE;
;301:				}
;302:				else {
;303:					VectorCopy( tr.endpos, tr_start );
;304:					passent = traceEnt->s.number;
;305:				}
;306:				continue;
;307:			}
;308:#else
;309:			if ( LogAccuracyHit( traceEnt, ent ) ) {
ADDRLP4 56
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
EQI4 $161
line 310
;310:				hitClient = qtrue;
ADDRLP4 96
CNSTI4 1
ASGNI4
line 311
;311:			}
LABELV $161
line 312
;312:			G_Damage( traceEnt, ent, ent, forward, tr.endpos, damage, 0, MOD_SHOTGUN );
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 104
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 92
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 313
;313:			return hitClient;
ADDRLP4 96
INDIRI4
RETI4
ADDRGP4 $150
JUMPV
LABELV $159
line 316
;314:#endif
;315:		}
;316:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $150
JUMPV
LABELV $152
line 283
ADDRLP4 60
ADDRLP4 60
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 10
LTI4 $151
line 318
;317:	}
;318:	return qfalse;
CNSTI4 0
RETI4
LABELV $150
endproc ShotgunPellet 108 32
proc ShotgunPattern 92 12
line 323
;319:}
;320:
;321:
;322:// this should match CG_ShotgunPattern
;323:static void ShotgunPattern( const vec3_t origin, const vec3_t origin2, int seed, gentity_t *ent ) {
line 328
;324:	int			i;
;325:	float		r, u;
;326:	vec3_t		end;
;327:	vec3_t		forward, right, up;
;328:	qboolean	hitClient = qfalse;
ADDRLP4 60
CNSTI4 0
ASGNI4
line 332
;329:
;330:	// derive the right and up vectors from the forward vector, because
;331:	// the client won't have any other information
;332:	VectorNormalize2( origin2, forward );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 VectorNormalize2
CALLF4
pop
line 333
;333:	PerpendicularVector( right, forward );
ADDRLP4 32
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 PerpendicularVector
CALLV
pop
line 334
;334:	CrossProduct( forward, right, up );
ADDRLP4 20
ARGP4
ADDRLP4 32
ARGP4
ADDRLP4 44
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 337
;335:
;336:	// unlagged
;337:	G_DoTimeShiftFor( ent );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 340
;338:
;339:	// generate the "random" spread pattern
;340:	for ( i = 0 ; i < DEFAULT_SHOTGUN_COUNT ; i++ ) {
ADDRLP4 56
CNSTI4 0
ASGNI4
LABELV $165
line 341
;341:		r = Q_crandom( &seed ) * DEFAULT_SHOTGUN_SPREAD * 16;
ADDRFP4 8
ARGP4
ADDRLP4 64
ADDRGP4 Q_crandom
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 64
INDIRF4
CNSTF4 1177485312
MULF4
ASGNF4
line 342
;342:		u = Q_crandom( &seed ) * DEFAULT_SHOTGUN_SPREAD * 16;
ADDRFP4 8
ARGP4
ADDRLP4 68
ADDRGP4 Q_crandom
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 68
INDIRF4
CNSTF4 1177485312
MULF4
ASGNF4
line 343
;343:		VectorMA( origin, ( 8192.0 * 16.0 ), forward, end );
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 72
INDIRP4
INDIRF4
ADDRLP4 20
INDIRF4
CNSTF4 1207959552
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 72
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 20+4
INDIRF4
CNSTF4 1207959552
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 20+8
INDIRF4
CNSTF4 1207959552
MULF4
ADDF4
ASGNF4
line 344
;344:		VectorMA( end, r, right, end );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 32
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 32+4
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 32+8
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 345
;345:		VectorMA( end, u, up, end );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 44
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 44+4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 44+8
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
line 346
;346:		if ( ShotgunPellet( origin, end, ent ) && !hitClient ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 84
ADDRGP4 ShotgunPellet
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $185
ADDRLP4 60
INDIRI4
CNSTI4 0
NEI4 $185
line 347
;347:			hitClient = qtrue;
ADDRLP4 60
CNSTI4 1
ASGNI4
line 348
;348:			ent->client->accuracy_hits++;
ADDRLP4 88
ADDRFP4 12
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 724
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 349
;349:		}
LABELV $185
line 350
;350:	}
LABELV $166
line 340
ADDRLP4 56
ADDRLP4 56
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 11
LTI4 $165
line 353
;351:
;352:	// unlagged
;353:	G_UndoTimeShiftFor( ent );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 354
;354:}
LABELV $164
endproc ShotgunPattern 92 12
proc weapon_supershotgun_fire 20 16
line 357
;355:
;356:
;357:static void weapon_supershotgun_fire( gentity_t *ent ) {
line 361
;358:	gentity_t		*tent;
;359:
;360:	// send shotgun blast
;361:	tent = G_TempEntity( muzzle, EV_SHOTGUN );
ADDRGP4 muzzle
ARGP4
CNSTI4 54
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 362
;362:	VectorScale( forward, 4096.0, tent->s.origin2 );
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRGP4 forward
INDIRF4
CNSTF4 1166016512
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
ADDRGP4 forward+4
INDIRF4
CNSTF4 1166016512
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 forward+8
INDIRF4
CNSTF4 1166016512
MULF4
ASGNF4
line 364
;363:
;364:	SnapVector( tent->s.origin2 );
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 365
;365:	tent->s.eventParm = rand() & 255;		// seed for spread pattern
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 255
BANDI4
ASGNI4
line 366
;366:	tent->s.otherEntityNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 368
;367:
;368:	ShotgunPattern( muzzle_origin, tent->s.origin2, tent->s.eventParm, ent );
ADDRGP4 muzzle_origin
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ShotgunPattern
CALLV
pop
line 369
;369:}
LABELV $187
endproc weapon_supershotgun_fire 20 16
export weapon_grenadelauncher_fire
proc weapon_grenadelauncher_fire 20 12
line 380
;370:
;371:
;372:/*
;373:======================================================================
;374:
;375:GRENADE LAUNCHER
;376:
;377:======================================================================
;378:*/
;379:
;380:void weapon_grenadelauncher_fire (gentity_t *ent) {
line 384
;381:	gentity_t	*m;
;382:
;383:	// extra vertical velocity
;384:	forward[2] += 0.2f;
ADDRLP4 4
ADDRGP4 forward+8
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
CNSTF4 1045220557
ADDF4
ASGNF4
line 385
;385:	VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 387
;386:
;387:	m = fire_grenade (ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 8
ADDRGP4 fire_grenade
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 388
;388:	m->damage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 389
;389:	m->splashDamage *= s_quadFactor;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 392
;390:
;391://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;392:}
LABELV $190
endproc weapon_grenadelauncher_fire 20 12
export Weapon_RocketLauncher_Fire
proc Weapon_RocketLauncher_Fire 16 12
line 402
;393:
;394:/*
;395:======================================================================
;396:
;397:ROCKET
;398:
;399:======================================================================
;400:*/
;401:
;402:void Weapon_RocketLauncher_Fire (gentity_t *ent) {
line 405
;403:	gentity_t	*m;
;404:
;405:	m = fire_rocket (ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4
ADDRGP4 fire_rocket
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 406
;406:	m->damage *= s_quadFactor;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 407
;407:	m->splashDamage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 410
;408:
;409://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;410:}
LABELV $192
endproc Weapon_RocketLauncher_Fire 16 12
export Weapon_Plasmagun_Fire
proc Weapon_Plasmagun_Fire 16 12
line 421
;411:
;412:
;413:/*
;414:======================================================================
;415:
;416:PLASMA GUN
;417:
;418:======================================================================
;419:*/
;420:
;421:void Weapon_Plasmagun_Fire (gentity_t *ent) {
line 424
;422:	gentity_t	*m;
;423:
;424:	m = fire_plasma (ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4
ADDRGP4 fire_plasma
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 425
;425:	m->damage *= s_quadFactor;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 426
;426:	m->splashDamage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 429
;427:
;428://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;429:}
LABELV $193
endproc Weapon_Plasmagun_Fire 16 12
export weapon_railgun_fire
proc weapon_railgun_fire 160 32
line 446
;430:
;431:/*
;432:======================================================================
;433:
;434:RAILGUN
;435:
;436:======================================================================
;437:*/
;438:
;439:
;440:/*
;441:=================
;442:weapon_railgun_fire
;443:=================
;444:*/
;445:#define	MAX_RAIL_HITS	4
;446:void weapon_railgun_fire( gentity_t *ent ) {
line 461
;447:	vec3_t		end;
;448:#ifdef MISSIONPACK
;449:	vec3_t impactpoint, bouncedir;
;450:#endif
;451:	trace_t		trace;
;452:	gentity_t	*tent;
;453:	gentity_t	*traceEnt;
;454:	int			damage;
;455:	int			i;
;456:	int			hits;
;457:	int			unlinked;
;458:	int			passent;
;459:	gentity_t	*unlinkedEntities[MAX_RAIL_HITS];
;460:
;461:	damage = 100 * s_quadFactor;
ADDRLP4 104
ADDRGP4 s_quadFactor
INDIRF4
CNSTF4 1120403456
MULF4
CVFI4 4
ASGNI4
line 463
;462:
;463:	VectorMA( muzzle_origin, 8192.0, forward, end );
ADDRLP4 88
ADDRGP4 muzzle_origin
INDIRF4
ADDRGP4 forward
INDIRF4
CNSTF4 1174405120
MULF4
ADDF4
ASGNF4
ADDRLP4 88+4
ADDRGP4 muzzle_origin+4
INDIRF4
ADDRGP4 forward+4
INDIRF4
CNSTF4 1174405120
MULF4
ADDF4
ASGNF4
ADDRLP4 88+8
ADDRGP4 muzzle_origin+8
INDIRF4
ADDRGP4 forward+8
INDIRF4
CNSTF4 1174405120
MULF4
ADDF4
ASGNF4
line 466
;464:
;465:	// unlagged
;466:	G_DoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 469
;467:
;468:	// trace only against the solids, so the railgun will go through people
;469:	unlinked = 0;
ADDRLP4 60
CNSTI4 0
ASGNI4
line 470
;470:	hits = 0;
ADDRLP4 108
CNSTI4 0
ASGNI4
line 471
;471:	passent = ent->s.number;
ADDRLP4 100
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
LABELV $201
line 472
;472:	do {
line 473
;473:		trap_Trace( &trace, muzzle_origin, NULL, NULL, end, passent, MASK_SHOT );
ADDRLP4 4
ARGP4
ADDRGP4 muzzle_origin
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 100
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 474
;474:		if ( trace.entityNum >= ENTITYNUM_MAX_NORMAL ) {
ADDRLP4 4+52
INDIRI4
CNSTI4 1022
LTI4 $204
line 475
;475:			break;
ADDRGP4 $203
JUMPV
LABELV $204
line 477
;476:		}
;477:		traceEnt = &g_entities[ trace.entityNum ];
ADDRLP4 0
ADDRLP4 4+52
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 478
;478:		if ( traceEnt->takedamage ) {
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
EQI4 $208
line 501
;479:#ifdef MISSIONPACK
;480:			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
;481:				if ( G_InvulnerabilityEffect( traceEnt, forward, trace.endpos, impactpoint, bouncedir ) ) {
;482:					G_BounceProjectile( muzzle, impactpoint, bouncedir, end );
;483:					// snap the endpos to integers to save net bandwidth, but nudged towards the line
;484:					SnapVectorTowards( trace.endpos, muzzle );
;485:					// send railgun beam effect
;486:					tent = G_TempEntity( trace.endpos, EV_RAILTRAIL );
;487:					// set player number for custom colors on the railtrail
;488:					tent->s.clientNum = ent->s.clientNum;
;489:					VectorCopy( muzzle, tent->s.origin2 );
;490:					// move origin a bit to come closer to the drawn gun muzzle
;491:					VectorMA( tent->s.origin2, 4, right, tent->s.origin2 );
;492:					VectorMA( tent->s.origin2, -1, up, tent->s.origin2 );
;493:					tent->s.eventParm = 255;	// don't make the explosion at the end
;494:					//
;495:					VectorCopy( impactpoint, muzzle );
;496:					// the player can hit him/herself with the bounced rail
;497:					passent = ENTITYNUM_NONE;
;498:				}
;499:			} else
;500:#else
;501:			{
line 502
;502:				if ( LogAccuracyHit( traceEnt, ent ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 112
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
EQI4 $210
line 503
;503:					hits++;
ADDRLP4 108
ADDRLP4 108
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 504
;504:				}
LABELV $210
line 505
;505:				G_Damage( traceEnt, ent, ent, forward, trace.endpos, damage, 0, MOD_RAILGUN );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 104
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 10
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 506
;506:			}
line 508
;507:#endif
;508:		}
LABELV $208
line 509
;509:		if ( trace.contents & CONTENTS_SOLID ) {
ADDRLP4 4+48
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $213
line 510
;510:			break;		// we hit something solid enough to stop the beam
ADDRGP4 $203
JUMPV
LABELV $213
line 513
;511:		}
;512:		// unlink this entity, so the next trace will go past it
;513:		trap_UnlinkEntity( traceEnt );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 514
;514:		unlinkedEntities[unlinked] = traceEnt;
ADDRLP4 60
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 72
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 515
;515:		unlinked++;
ADDRLP4 60
ADDRLP4 60
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 516
;516:	} while ( unlinked < MAX_RAIL_HITS );
LABELV $202
ADDRLP4 60
INDIRI4
CNSTI4 4
LTI4 $201
LABELV $203
line 519
;517:
;518:	// unlagged
;519:	G_UndoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 523
;520:
;521:
;522:	// link back in any entities we unlinked
;523:	for ( i = 0 ; i < unlinked ; i++ ) {
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRGP4 $219
JUMPV
LABELV $216
line 524
;524:		trap_LinkEntity( unlinkedEntities[i] );
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 72
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 525
;525:	}
LABELV $217
line 523
ADDRLP4 64
ADDRLP4 64
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $219
ADDRLP4 64
INDIRI4
ADDRLP4 60
INDIRI4
LTI4 $216
line 530
;526:
;527:	// the final trace endpos will be the terminal point of the rail trail
;528:
;529:	// snap the endpos to integers to save net bandwidth, but nudged towards the line
;530:	SnapVectorTowards( trace.endpos, muzzle_origin );
ADDRLP4 4+12
ARGP4
ADDRGP4 muzzle_origin
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 533
;531:
;532:	// send railgun beam effect
;533:	tent = G_TempEntity( trace.endpos, EV_RAILTRAIL );
ADDRLP4 4+12
ARGP4
CNSTI4 53
ARGI4
ADDRLP4 112
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 68
ADDRLP4 112
INDIRP4
ASGNP4
line 536
;534:
;535:	// set player number for custom colors on the railtrail
;536:	tent->s.clientNum = ent->s.clientNum;
ADDRLP4 68
INDIRP4
CNSTI4 168
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 538
;537:
;538:	VectorCopy( muzzle, tent->s.origin2 );
ADDRLP4 68
INDIRP4
CNSTI4 104
ADDP4
ADDRGP4 muzzle
INDIRB
ASGNB 12
line 540
;539:	// move origin a bit to come closer to the drawn gun muzzle
;540:	VectorMA( tent->s.origin2, 4, right, tent->s.origin2 );
ADDRLP4 68
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
ADDRGP4 right
INDIRF4
CNSTF4 1082130432
MULF4
ADDF4
ASGNF4
ADDRLP4 68
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 108
ADDP4
INDIRF4
ADDRGP4 right+4
INDIRF4
CNSTF4 1082130432
MULF4
ADDF4
ASGNF4
ADDRLP4 68
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
ADDRGP4 right+8
INDIRF4
CNSTF4 1082130432
MULF4
ADDF4
ASGNF4
line 541
;541:	VectorMA( tent->s.origin2, -1, up, tent->s.origin2 );
ADDRLP4 68
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
ADDRGP4 up
INDIRF4
CNSTF4 3212836864
MULF4
ADDF4
ASGNF4
ADDRLP4 68
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 108
ADDP4
INDIRF4
ADDRGP4 up+4
INDIRF4
CNSTF4 3212836864
MULF4
ADDF4
ASGNF4
ADDRLP4 68
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
ADDRGP4 up+8
INDIRF4
CNSTF4 3212836864
MULF4
ADDF4
ASGNF4
line 543
;542:
;543:	SnapVector( tent->s.origin2 );
ADDRLP4 68
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 68
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 108
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 68
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 546
;544:
;545:	// no explosion at end if SURF_NOIMPACT, but still make the trail
;546:	if ( trace.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 4+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $226
line 547
;547:		tent->s.eventParm = 255;	// don't make the explosion at the end
ADDRLP4 68
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 255
ASGNI4
line 548
;548:	} else {
ADDRGP4 $227
JUMPV
LABELV $226
line 549
;549:		tent->s.eventParm = DirToByte( trace.plane.normal );
ADDRLP4 4+24
ARGP4
ADDRLP4 140
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 68
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 140
INDIRI4
ASGNI4
line 550
;550:	}
LABELV $227
line 551
;551:	tent->s.clientNum = ent->s.clientNum;
ADDRLP4 68
INDIRP4
CNSTI4 168
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 554
;552:
;553:	// give the shooter a reward sound if they have made two railgun hits in a row
;554:	if ( hits == 0 ) {
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $230
line 556
;555:		// complete miss
;556:		ent->client->accurateCount = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 0
ASGNI4
line 557
;557:	} else {
ADDRGP4 $231
JUMPV
LABELV $230
line 559
;558:		// check for "impressive" reward sound
;559:		ent->client->accurateCount += hits;
ADDRLP4 140
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 716
ADDP4
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRI4
ADDRLP4 108
INDIRI4
ADDI4
ASGNI4
line 560
;560:		if ( ent->client->accurateCount >= 2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 716
ADDP4
INDIRI4
CNSTI4 2
LTI4 $232
line 561
;561:			ent->client->accurateCount -= 2;
ADDRLP4 144
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 716
ADDP4
ASGNP4
ADDRLP4 144
INDIRP4
ADDRLP4 144
INDIRP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 562
;562:			ent->client->ps.persistant[PERS_IMPRESSIVE_COUNT]++;
ADDRLP4 148
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 284
ADDP4
ASGNP4
ADDRLP4 148
INDIRP4
ADDRLP4 148
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 564
;563:			// add the sprite over the player's head
;564:			ent->client->ps.eFlags &= ~EF_AWARDS;
ADDRLP4 152
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 565
;565:			ent->client->ps.eFlags |= EF_AWARD_IMPRESSIVE;
ADDRLP4 156
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 156
INDIRP4
ADDRLP4 156
INDIRP4
INDIRI4
CNSTI4 32768
BORI4
ASGNI4
line 566
;566:			ent->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 752
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 567
;567:		}
LABELV $232
line 568
;568:		ent->client->accuracy_hits++;
ADDRLP4 144
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 724
ADDP4
ASGNP4
ADDRLP4 144
INDIRP4
ADDRLP4 144
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 569
;569:	}
LABELV $231
line 571
;570:
;571:}
LABELV $194
endproc weapon_railgun_fire 160 32
export Weapon_GrapplingHook_Fire
proc Weapon_GrapplingHook_Fire 4 12
line 583
;572:
;573:
;574:/*
;575:======================================================================
;576:
;577:GRAPPLING HOOK
;578:
;579:======================================================================
;580:*/
;581:
;582:void Weapon_GrapplingHook_Fire (gentity_t *ent)
;583:{
line 584
;584:	if (!ent->client->fireHeld && !ent->client->hook)
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
CNSTI4 0
NEI4 $236
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $236
line 585
;585:		fire_grapple (ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 fire_grapple
CALLP4
pop
LABELV $236
line 587
;586:
;587:	ent->client->fireHeld = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 1
ASGNI4
line 588
;588:}
LABELV $235
endproc Weapon_GrapplingHook_Fire 4 12
export Weapon_HookFree
proc Weapon_HookFree 4 4
line 592
;589:
;590:
;591:void Weapon_HookFree (gentity_t *ent)
;592:{
line 593
;593:	ent->parent->client->hook = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 768
ADDP4
CNSTP4 0
ASGNP4
line 594
;594:	ent->parent->client->ps.pm_flags &= ~PMF_GRAPPLE_PULL;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 595
;595:	G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 596
;596:}
LABELV $238
endproc Weapon_HookFree 4 4
export Weapon_HookThink
proc Weapon_HookThink 36 8
line 600
;597:
;598:
;599:void Weapon_HookThink (gentity_t *ent)
;600:{
line 601
;601:	if (ent->enemy) {
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $240
line 604
;602:		vec3_t v, oldorigin;
;603:
;604:		VectorCopy(ent->r.currentOrigin, oldorigin);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 605
;605:		v[0] = ent->enemy->r.currentOrigin[0] + (ent->enemy->r.mins[0] + ent->enemy->r.maxs[0]) * 0.5;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 436
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
ADDF4
CNSTF4 1056964608
MULF4
ADDF4
ASGNF4
line 606
;606:		v[1] = ent->enemy->r.currentOrigin[1] + (ent->enemy->r.mins[1] + ent->enemy->r.maxs[1]) * 0.5;
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+4
ADDRLP4 28
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 440
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
ADDF4
CNSTF4 1056964608
MULF4
ADDF4
ASGNF4
line 607
;607:		v[2] = ent->enemy->r.currentOrigin[2] + (ent->enemy->r.mins[2] + ent->enemy->r.maxs[2]) * 0.5;
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 32
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ADDF4
CNSTF4 1056964608
MULF4
ADDF4
ASGNF4
line 608
;608:		SnapVectorTowards( v, oldorigin );	// save net bandwidth
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 610
;609:
;610:		G_SetOrigin( ent, v );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 611
;611:	}
LABELV $240
line 613
;612:
;613:	VectorCopy( ent->r.currentOrigin, ent->parent->client->ps.grapplePoint);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 614
;614:}
LABELV $239
endproc Weapon_HookThink 36 8
export Weapon_LightningFire
proc Weapon_LightningFire 100 32
line 625
;615:
;616:
;617:/*
;618:======================================================================
;619:
;620:LIGHTNING GUN
;621:
;622:======================================================================
;623:*/
;624:
;625:void Weapon_LightningFire( gentity_t *ent ) {
line 634
;626:	trace_t		tr;
;627:	vec3_t		end;
;628:#ifdef MISSIONPACK
;629:	vec3_t impactpoint, bouncedir;
;630:#endif
;631:	gentity_t	*traceEnt, *tent;
;632:	int			damage, i, passent;
;633:
;634:	damage = 8 * s_quadFactor;
ADDRLP4 84
ADDRGP4 s_quadFactor
INDIRF4
CNSTF4 1090519040
MULF4
CVFI4 4
ASGNI4
line 636
;635:
;636:	passent = ent->s.number;
ADDRLP4 80
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 638
;637:
;638:	for (i = 0; i < 10; i++) {
ADDRLP4 76
CNSTI4 0
ASGNI4
LABELV $245
line 639
;639:		VectorMA( muzzle_origin, LIGHTNING_RANGE, forward, end );
ADDRLP4 60
ADDRGP4 muzzle_origin
INDIRF4
ADDRGP4 forward
INDIRF4
CNSTF4 1145044992
MULF4
ADDF4
ASGNF4
ADDRLP4 60+4
ADDRGP4 muzzle_origin+4
INDIRF4
ADDRGP4 forward+4
INDIRF4
CNSTF4 1145044992
MULF4
ADDF4
ASGNF4
ADDRLP4 60+8
ADDRGP4 muzzle_origin+8
INDIRF4
ADDRGP4 forward+8
INDIRF4
CNSTF4 1145044992
MULF4
ADDF4
ASGNF4
line 642
;640:
;641:		// unlagged
;642:		G_DoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 644
;643:
;644:		trap_Trace( &tr, muzzle_origin, NULL, NULL, end, passent, MASK_SHOT );
ADDRLP4 0
ARGP4
ADDRGP4 muzzle_origin
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 60
ARGP4
ADDRLP4 80
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 647
;645:
;646:		// unlagged
;647:		G_UndoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 661
;648:
;649:#ifdef MISSIONPACK
;650:		// if not the first trace (the lightning bounced of an invulnerability sphere)
;651:		if (i) {
;652:			// add bounced off lightning bolt temp entity
;653:			// the first lightning bolt is a cgame only visual
;654:			//
;655:			tent = G_TempEntity( muzzle, EV_LIGHTNINGBOLT );
;656:			VectorCopy( tr.endpos, end );
;657:			SnapVector( end );
;658:			VectorCopy( end, tent->s.origin2 );
;659:		}
;660:#endif
;661:		if ( tr.entityNum == ENTITYNUM_NONE ) {
ADDRLP4 0+52
INDIRI4
CNSTI4 1023
NEI4 $255
line 662
;662:			return;
ADDRGP4 $244
JUMPV
LABELV $255
line 665
;663:		}
;664:
;665:		traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 56
ADDRLP4 0+52
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 667
;666:
;667:		if ( traceEnt->takedamage ) {
ADDRLP4 56
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
EQI4 $259
line 685
;668:#ifdef MISSIONPACK
;669:			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
;670:				if (G_InvulnerabilityEffect( traceEnt, forward, tr.endpos, impactpoint, bouncedir )) {
;671:					G_BounceProjectile( muzzle, impactpoint, bouncedir, end );
;672:					VectorCopy( impactpoint, muzzle );
;673:					VectorSubtract( end, impactpoint, forward );
;674:					VectorNormalize(forward);
;675:					// the player can hit him/herself with the bounced lightning
;676:					passent = ENTITYNUM_NONE;
;677:				}
;678:				else {
;679:					VectorCopy( tr.endpos, muzzle );
;680:					passent = traceEnt->s.number;
;681:				}
;682:				continue;
;683:			}
;684:#else
;685:			if ( LogAccuracyHit( traceEnt, ent ) ) {
ADDRLP4 56
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $261
line 686
;686:				ent->client->accuracy_hits++;
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 724
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 687
;687:			}
LABELV $261
line 688
;688:			G_Damage( traceEnt, ent, ent, forward, tr.endpos, damage, 0, MOD_LIGHTNING );
ADDRLP4 56
INDIRP4
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
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 84
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 11
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 690
;689:#endif
;690:		}
LABELV $259
line 692
;691:
;692:		if ( traceEnt->takedamage && traceEnt->client ) {
ADDRLP4 56
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
EQI4 $264
ADDRLP4 56
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $264
line 693
;693:			tent = G_TempEntity( tr.endpos, EV_MISSILE_HIT );
ADDRLP4 0+12
ARGP4
CNSTI4 50
ARGI4
ADDRLP4 92
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 92
INDIRP4
ASGNP4
line 694
;694:			tent->s.otherEntityNum = traceEnt->s.number;
ADDRLP4 72
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 56
INDIRP4
INDIRI4
ASGNI4
line 695
;695:			tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 0+24
ARGP4
ADDRLP4 96
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 96
INDIRI4
ASGNI4
line 696
;696:			tent->s.weapon = ent->s.weapon;
ADDRLP4 72
INDIRP4
CNSTI4 192
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
line 697
;697:		} else if ( !( tr.surfaceFlags & SURF_NOIMPACT ) ) {
ADDRGP4 $247
JUMPV
LABELV $264
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $247
line 698
;698:			tent = G_TempEntity( tr.endpos, EV_MISSILE_MISS );
ADDRLP4 0+12
ARGP4
CNSTI4 51
ARGI4
ADDRLP4 92
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 92
INDIRP4
ASGNP4
line 699
;699:			tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 0+24
ARGP4
ADDRLP4 96
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 96
INDIRI4
ASGNI4
line 700
;700:		}
line 702
;701:
;702:		break;
ADDRGP4 $247
JUMPV
LABELV $246
line 638
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 10
LTI4 $245
LABELV $247
line 704
;703:	}
;704:}
LABELV $244
endproc Weapon_LightningFire 100 32
export Weapon_Nailgun_Fire
proc Weapon_Nailgun_Fire 20 20
line 715
;705:
;706:
;707:/*
;708:======================================================================
;709:
;710:NAILGUN
;711:
;712:======================================================================
;713:*/
;714:
;715:void Weapon_Nailgun_Fire (gentity_t *ent) {
line 719
;716:	gentity_t	*m;
;717:	int			count;
;718:
;719:	for( count = 0; count < NUM_NAILSHOTS; count++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $274
line 720
;720:		m = fire_nail (ent, muzzle, forward, right, up );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRLP4 8
ADDRGP4 fire_nail
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 721
;721:		m->damage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 722
;722:		m->splashDamage *= s_quadFactor;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 723
;723:	}
LABELV $275
line 719
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 15
LTI4 $274
line 726
;724:
;725://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;726:}
LABELV $273
endproc Weapon_Nailgun_Fire 20 20
export weapon_proxlauncher_fire
proc weapon_proxlauncher_fire 20 12
line 737
;727:
;728:
;729:/*
;730:======================================================================
;731:
;732:PROXIMITY MINE LAUNCHER
;733:
;734:======================================================================
;735:*/
;736:
;737:void weapon_proxlauncher_fire (gentity_t *ent) {
line 741
;738:	gentity_t	*m;
;739:
;740:	// extra vertical velocity
;741:	forward[2] += 0.2f;
ADDRLP4 4
ADDRGP4 forward+8
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
CNSTF4 1045220557
ADDF4
ASGNF4
line 742
;742:	VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 744
;743:
;744:	m = fire_prox (ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 8
ADDRGP4 fire_prox
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 745
;745:	m->damage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 746
;746:	m->splashDamage *= s_quadFactor;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 749
;747:
;748://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;749:}
LABELV $278
endproc weapon_proxlauncher_fire 20 12
export LogAccuracyHit
proc LogAccuracyHit 4 8
line 760
;750:
;751:
;752://======================================================================
;753:
;754:
;755:/*
;756:===============
;757:LogAccuracyHit
;758:===============
;759:*/
;760:qboolean LogAccuracyHit( gentity_t *target, gentity_t *attacker ) {
line 761
;761:	if( !target->takedamage ) {
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
NEI4 $281
line 762
;762:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $280
JUMPV
LABELV $281
line 765
;763:	}
;764:
;765:	if ( target == attacker ) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
NEU4 $283
line 766
;766:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $280
JUMPV
LABELV $283
line 769
;767:	}
;768:
;769:	if( !target->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $285
line 770
;770:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $280
JUMPV
LABELV $285
line 773
;771:	}
;772:
;773:	if( !attacker->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $287
line 774
;774:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $280
JUMPV
LABELV $287
line 777
;775:	}
;776:
;777:	if( target->client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $289
line 778
;778:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $280
JUMPV
LABELV $289
line 781
;779:	}
;780:
;781:	if ( OnSameTeam( target, attacker ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $291
line 782
;782:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $280
JUMPV
LABELV $291
line 785
;783:	}
;784:
;785:	return qtrue;
CNSTI4 1
RETI4
LABELV $280
endproc LogAccuracyHit 4 8
export FireWeapon
proc FireWeapon 16 24
line 794
;786:}
;787:
;788:
;789:/*
;790:===============
;791:FireWeapon
;792:===============
;793:*/
;794:void FireWeapon( gentity_t *ent ) {
line 795
;795:	if ( ent->client->ps.powerups[PW_QUAD] ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $294
line 796
;796:		s_quadFactor = g_quadfactor.value;
ADDRGP4 s_quadFactor
ADDRGP4 g_quadfactor+8
INDIRF4
ASGNF4
line 797
;797:	} else {
ADDRGP4 $295
JUMPV
LABELV $294
line 798
;798:		s_quadFactor = 1.0;
ADDRGP4 s_quadFactor
CNSTF4 1065353216
ASGNF4
line 799
;799:	}
LABELV $295
line 800
;800:	if( ent->client->persistantPowerup && ent->client->persistantPowerup->item && ent->client->persistantPowerup->item->giTag == PW_DOUBLER ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 780
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $297
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 780
ADDP4
INDIRP4
CNSTI4 812
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $297
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 780
ADDP4
INDIRP4
CNSTI4 812
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 12
NEI4 $297
line 801
;801:		s_quadFactor *= 2;
ADDRLP4 4
ADDRGP4 s_quadFactor
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
CNSTF4 1073741824
MULF4
ASGNF4
line 802
;802:	}
LABELV $297
line 805
;803:
;804:	// track shots taken for accuracy tracking.  Grapple is not a weapon and gauntet is just not tracked
;805:	if( ent->s.weapon != WP_GRAPPLING_HOOK && ent->s.weapon != WP_GAUNTLET ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 10
EQI4 $299
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1
EQI4 $299
line 806
;806:		if( ent->s.weapon == WP_NAILGUN ) {
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 11
NEI4 $301
line 807
;807:			ent->client->accuracy_shots += NUM_NAILSHOTS;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 720
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 15
ADDI4
ASGNI4
line 808
;808:		} else {
ADDRGP4 $302
JUMPV
LABELV $301
line 809
;809:			ent->client->accuracy_shots++;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 720
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 810
;810:		}
LABELV $302
line 811
;811:	}
LABELV $299
line 814
;812:
;813:	// set aiming directions
;814:	AngleVectors( ent->client->ps.viewangles, forward, right, up );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 816
;815:
;816:	CalcMuzzlePointOrigin( ent, muzzle_origin, forward, right, up, muzzle );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle_origin
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 CalcMuzzlePointOrigin
CALLV
pop
line 819
;817:
;818:	// fire the specific weapon
;819:	switch( ent->s.weapon ) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
LTI4 $304
ADDRLP4 8
INDIRI4
CNSTI4 13
GTI4 $304
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $322-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $322
address $306
address $309
address $308
address $313
address $314
address $307
address $316
address $315
address $317
address $318
address $319
address $320
address $321
code
LABELV $306
line 821
;820:	case WP_GAUNTLET:
;821:		Weapon_Gauntlet( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_Gauntlet
CALLV
pop
line 822
;822:		break;
ADDRGP4 $304
JUMPV
LABELV $307
line 824
;823:	case WP_LIGHTNING:
;824:		Weapon_LightningFire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_LightningFire
CALLV
pop
line 825
;825:		break;
ADDRGP4 $304
JUMPV
LABELV $308
line 827
;826:	case WP_SHOTGUN:
;827:		weapon_supershotgun_fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_supershotgun_fire
CALLV
pop
line 828
;828:		break;
ADDRGP4 $304
JUMPV
LABELV $309
line 830
;829:	case WP_MACHINEGUN:
;830:		if ( g_gametype.integer != GT_TDM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $310
line 831
;831:			Bullet_Fire( ent, MACHINEGUN_SPREAD, MACHINEGUN_DAMAGE );
ADDRFP4 0
INDIRP4
ARGP4
CNSTF4 1128792064
ARGF4
CNSTI4 7
ARGI4
ADDRGP4 Bullet_Fire
CALLV
pop
line 832
;832:		} else {
ADDRGP4 $304
JUMPV
LABELV $310
line 833
;833:			Bullet_Fire( ent, MACHINEGUN_SPREAD, MACHINEGUN_TEAM_DAMAGE );
ADDRFP4 0
INDIRP4
ARGP4
CNSTF4 1128792064
ARGF4
CNSTI4 5
ARGI4
ADDRGP4 Bullet_Fire
CALLV
pop
line 834
;834:		}
line 835
;835:		break;
ADDRGP4 $304
JUMPV
LABELV $313
line 837
;836:	case WP_GRENADE_LAUNCHER:
;837:		weapon_grenadelauncher_fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_grenadelauncher_fire
CALLV
pop
line 838
;838:		break;
ADDRGP4 $304
JUMPV
LABELV $314
line 840
;839:	case WP_ROCKET_LAUNCHER:
;840:		Weapon_RocketLauncher_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_RocketLauncher_Fire
CALLV
pop
line 841
;841:		break;
ADDRGP4 $304
JUMPV
LABELV $315
line 843
;842:	case WP_PLASMAGUN:
;843:		Weapon_Plasmagun_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_Plasmagun_Fire
CALLV
pop
line 844
;844:		break;
ADDRGP4 $304
JUMPV
LABELV $316
line 846
;845:	case WP_RAILGUN:
;846:		weapon_railgun_fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_railgun_fire
CALLV
pop
line 847
;847:		break;
ADDRGP4 $304
JUMPV
LABELV $317
line 849
;848:	case WP_BFG:
;849:		BFG_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BFG_Fire
CALLV
pop
line 850
;850:		break;
ADDRGP4 $304
JUMPV
LABELV $318
line 852
;851:	case WP_GRAPPLING_HOOK:
;852:		Weapon_GrapplingHook_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_GrapplingHook_Fire
CALLV
pop
line 853
;853:		break;
ADDRGP4 $304
JUMPV
LABELV $319
line 855
;854:	case WP_NAILGUN:
;855:		Weapon_Nailgun_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_Nailgun_Fire
CALLV
pop
line 856
;856:		break;
ADDRGP4 $304
JUMPV
LABELV $320
line 858
;857:	case WP_PROX_LAUNCHER:
;858:		weapon_proxlauncher_fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_proxlauncher_fire
CALLV
pop
line 859
;859:		break;
ADDRGP4 $304
JUMPV
LABELV $321
line 861
;860:	case WP_CHAINGUN:
;861:		Bullet_Fire( ent, CHAINGUN_SPREAD, MACHINEGUN_DAMAGE );
ADDRFP4 0
INDIRP4
ARGP4
CNSTF4 1142292480
ARGF4
CNSTI4 7
ARGI4
ADDRGP4 Bullet_Fire
CALLV
pop
line 862
;862:		break;
line 865
;863:	default:
;864:// FIXME		G_Error( "Bad ent->s.weapon" );
;865:		break;
LABELV $304
line 867
;866:	}
;867:}
LABELV $293
endproc FireWeapon 16 24
proc KamikazeRadiusDamage 4180 32
line 875
;868:
;869:
;870:/*
;871:===============
;872:KamikazeRadiusDamage
;873:===============
;874:*/
;875:static void KamikazeRadiusDamage( vec3_t origin, gentity_t *attacker, float damage, float radius ) {
line 885
;876:	float		dist;
;877:	gentity_t	*ent;
;878:	int			entityList[MAX_GENTITIES];
;879:	int			numListedEntities;
;880:	vec3_t		mins, maxs;
;881:	vec3_t		v;
;882:	vec3_t		dir;
;883:	int			i, e;
;884:
;885:	if ( radius < 1 ) {
ADDRFP4 12
INDIRF4
CNSTF4 1065353216
GEF4 $325
line 886
;886:		radius = 1;
ADDRFP4 12
CNSTF4 1065353216
ASGNF4
line 887
;887:	}
LABELV $325
line 889
;888:
;889:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $327
line 890
;890:		mins[i] = origin[i] - radius;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4140
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRFP4 12
INDIRF4
SUBF4
ASGNF4
line 891
;891:		maxs[i] = origin[i] + radius;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4152
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRFP4 12
INDIRF4
ADDF4
ASGNF4
line 892
;892:	}
LABELV $328
line 889
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $327
line 894
;893:
;894:	numListedEntities = trap_EntitiesInBox( mins, maxs, entityList, MAX_GENTITIES );
ADDRLP4 4140
ARGP4
ADDRLP4 4152
ARGP4
ADDRLP4 40
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4164
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 4136
ADDRLP4 4164
INDIRI4
ASGNI4
line 896
;895:
;896:	for ( e = 0 ; e < numListedEntities ; e++ ) {
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRGP4 $334
JUMPV
LABELV $331
line 897
;897:		ent = &g_entities[entityList[ e ]];
ADDRLP4 4
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 40
ADDP4
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 899
;898:
;899:		if (!ent->takedamage) {
ADDRLP4 4
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
NEI4 $335
line 900
;900:			continue;
ADDRGP4 $332
JUMPV
LABELV $335
line 904
;901:		}
;902:
;903:		// dont hit things we have already hit
;904:		if( ent->kamikazeTime > level.time ) {
ADDRLP4 4
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $337
line 905
;905:			continue;
ADDRGP4 $332
JUMPV
LABELV $337
line 909
;906:		}
;907:
;908:		// find the distance from the edge of the bounding box
;909:		for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $340
line 910
;910:			if ( origin[i] < ent->r.absmin[i] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 464
ADDP4
ADDP4
INDIRF4
GEF4 $344
line 911
;911:				v[i] = ent->r.absmin[i] - origin[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 464
ADDP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 912
;912:			} else if ( origin[i] > ent->r.absmax[i] ) {
ADDRGP4 $345
JUMPV
LABELV $344
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 476
ADDP4
ADDP4
INDIRF4
LEF4 $346
line 913
;913:				v[i] = origin[i] - ent->r.absmax[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 476
ADDP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 914
;914:			} else {
ADDRGP4 $347
JUMPV
LABELV $346
line 915
;915:				v[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
CNSTF4 0
ASGNF4
line 916
;916:			}
LABELV $347
LABELV $345
line 917
;917:		}
LABELV $341
line 909
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $340
line 919
;918:
;919:		dist = VectorLength( v );
ADDRLP4 8
ARGP4
ADDRLP4 4168
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 36
ADDRLP4 4168
INDIRF4
ASGNF4
line 920
;920:		if ( dist >= radius ) {
ADDRLP4 36
INDIRF4
ADDRFP4 12
INDIRF4
LTF4 $348
line 921
;921:			continue;
ADDRGP4 $332
JUMPV
LABELV $348
line 925
;922:		}
;923:
;924://		if( CanDamage (ent, origin) ) {
;925:			VectorSubtract (ent->r.currentOrigin, origin, dir);
ADDRLP4 4176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 4
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDRLP4 4176
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 4
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDRLP4 4176
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 20+8
ADDRLP4 4
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 928
;926:			// push the center of mass higher than the origin so players
;927:			// get knocked into the air more
;928:			dir[2] += 24;
ADDRLP4 20+8
ADDRLP4 20+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 929
;929:			G_Damage( ent, NULL, attacker, dir, origin, damage, DAMAGE_RADIUS|DAMAGE_NO_TEAM_PROTECTION, MOD_KAMIKAZE );
ADDRLP4 4
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRF4
CVFI4 4
ARGI4
CNSTI4 17
ARGI4
CNSTI4 26
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 930
;930:			ent->kamikazeTime = level.time + 3000;
ADDRLP4 4
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 932
;931://		}
;932:	}
LABELV $332
line 896
ADDRLP4 32
ADDRLP4 32
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $334
ADDRLP4 32
INDIRI4
ADDRLP4 4136
INDIRI4
LTI4 $331
line 933
;933:}
LABELV $324
endproc KamikazeRadiusDamage 4180 32
proc KamikazeShockWave 4180 32
line 940
;934:
;935:/*
;936:===============
;937:KamikazeShockWave
;938:===============
;939:*/
;940:static void KamikazeShockWave( vec3_t origin, gentity_t *attacker, float damage, float push, float radius ) {
line 950
;941:	float		dist;
;942:	gentity_t	*ent;
;943:	int			entityList[MAX_GENTITIES];
;944:	int			numListedEntities;
;945:	vec3_t		mins, maxs;
;946:	vec3_t		v;
;947:	vec3_t		dir;
;948:	int			i, e;
;949:
;950:	if ( radius < 1 )
ADDRFP4 16
INDIRF4
CNSTF4 1065353216
GEF4 $355
line 951
;951:		radius = 1;
ADDRFP4 16
CNSTF4 1065353216
ASGNF4
LABELV $355
line 953
;952:
;953:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $357
line 954
;954:		mins[i] = origin[i] - radius;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4140
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRFP4 16
INDIRF4
SUBF4
ASGNF4
line 955
;955:		maxs[i] = origin[i] + radius;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4152
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRFP4 16
INDIRF4
ADDF4
ASGNF4
line 956
;956:	}
LABELV $358
line 953
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $357
line 958
;957:
;958:	numListedEntities = trap_EntitiesInBox( mins, maxs, entityList, MAX_GENTITIES );
ADDRLP4 4140
ARGP4
ADDRLP4 4152
ARGP4
ADDRLP4 40
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4164
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 4136
ADDRLP4 4164
INDIRI4
ASGNI4
line 960
;959:
;960:	for ( e = 0 ; e < numListedEntities ; e++ ) {
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRGP4 $364
JUMPV
LABELV $361
line 961
;961:		ent = &g_entities[entityList[ e ]];
ADDRLP4 4
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 40
ADDP4
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 964
;962:
;963:		// dont hit things we have already hit
;964:		if( ent->kamikazeShockTime > level.time ) {
ADDRLP4 4
INDIRP4
CNSTI4 788
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $365
line 965
;965:			continue;
ADDRGP4 $362
JUMPV
LABELV $365
line 969
;966:		}
;967:
;968:		// find the distance from the edge of the bounding box
;969:		for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $368
line 970
;970:			if ( origin[i] < ent->r.absmin[i] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 464
ADDP4
ADDP4
INDIRF4
GEF4 $372
line 971
;971:				v[i] = ent->r.absmin[i] - origin[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 464
ADDP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 972
;972:			} else if ( origin[i] > ent->r.absmax[i] ) {
ADDRGP4 $373
JUMPV
LABELV $372
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 476
ADDP4
ADDP4
INDIRF4
LEF4 $374
line 973
;973:				v[i] = origin[i] - ent->r.absmax[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 476
ADDP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 974
;974:			} else {
ADDRGP4 $375
JUMPV
LABELV $374
line 975
;975:				v[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
CNSTF4 0
ASGNF4
line 976
;976:			}
LABELV $375
LABELV $373
line 977
;977:		}
LABELV $369
line 969
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $368
line 979
;978:
;979:		dist = VectorLength( v );
ADDRLP4 8
ARGP4
ADDRLP4 4168
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 36
ADDRLP4 4168
INDIRF4
ASGNF4
line 980
;980:		if ( dist >= radius ) {
ADDRLP4 36
INDIRF4
ADDRFP4 16
INDIRF4
LTF4 $376
line 981
;981:			continue;
ADDRGP4 $362
JUMPV
LABELV $376
line 985
;982:		}
;983:
;984://		if( CanDamage (ent, origin) ) {
;985:			VectorSubtract (ent->r.currentOrigin, origin, dir);
ADDRLP4 4176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 4
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDRLP4 4176
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 4
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDRLP4 4176
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 20+8
ADDRLP4 4
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 986
;986:			dir[2] += 24;
ADDRLP4 20+8
ADDRLP4 20+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 987
;987:			G_Damage( ent, NULL, attacker, dir, origin, damage, DAMAGE_RADIUS|DAMAGE_NO_TEAM_PROTECTION, MOD_KAMIKAZE );
ADDRLP4 4
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRF4
CVFI4 4
ARGI4
CNSTI4 17
ARGI4
CNSTI4 26
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 989
;988:			//
;989:			dir[2] = 0;
ADDRLP4 20+8
CNSTF4 0
ASGNF4
line 990
;990:			VectorNormalize(dir);
ADDRLP4 20
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 991
;991:			if ( ent->client ) {
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $382
line 992
;992:				ent->client->ps.velocity[0] = dir[0] * push;
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 20
INDIRF4
ADDRFP4 12
INDIRF4
MULF4
ASGNF4
line 993
;993:				ent->client->ps.velocity[1] = dir[1] * push;
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 20+4
INDIRF4
ADDRFP4 12
INDIRF4
MULF4
ASGNF4
line 994
;994:				ent->client->ps.velocity[2] = 100;
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1120403456
ASGNF4
line 995
;995:			}
LABELV $382
line 996
;996:			ent->kamikazeShockTime = level.time + 3000;
ADDRLP4 4
INDIRP4
CNSTI4 788
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 998
;997://		}
;998:	}
LABELV $362
line 960
ADDRLP4 32
ADDRLP4 32
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $364
ADDRLP4 32
INDIRI4
ADDRLP4 4136
INDIRI4
LTI4 $361
line 999
;999:}
LABELV $354
endproc KamikazeShockWave 4180 32
proc KamikazeDamage 56 20
line 1006
;1000:
;1001:/*
;1002:===============
;1003:KamikazeDamage
;1004:===============
;1005:*/
;1006:static void KamikazeDamage( gentity_t *self ) {
line 1012
;1007:	int i;
;1008:	float t;
;1009:	gentity_t *ent;
;1010:	vec3_t newangles;
;1011:
;1012:	self->count += 100;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1014
;1013:
;1014:	if (self->count >= KAMI_SHOCKWAVE_STARTTIME) {
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
LTI4 $387
line 1016
;1015:		// shockwave push back
;1016:		t = self->count - KAMI_SHOCKWAVE_STARTTIME;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1017
;1017:		KamikazeShockWave(self->s.pos.trBase, self->activator, 25, 400,	(int) (float) t * KAMI_SHOCKWAVE_MAXRADIUS / (KAMI_SHOCKWAVE_ENDTIME - KAMI_SHOCKWAVE_STARTTIME) );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 772
ADDP4
INDIRP4
ARGP4
CNSTF4 1103626240
ARGF4
CNSTF4 1137180672
ARGF4
ADDRLP4 20
INDIRF4
CVFI4 4
CNSTI4 1320
MULI4
CNSTI4 2000
DIVI4
CVIF4 4
ARGF4
ADDRGP4 KamikazeShockWave
CALLV
pop
line 1018
;1018:	}
LABELV $387
line 1020
;1019:	//
;1020:	if (self->count >= KAMI_EXPLODE_STARTTIME) {
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 250
LTI4 $389
line 1022
;1021:		// do our damage
;1022:		t = self->count - KAMI_EXPLODE_STARTTIME;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 250
SUBI4
CVIF4 4
ASGNF4
line 1023
;1023:		KamikazeRadiusDamage( self->s.pos.trBase, self->activator, 400,	(int) (float) t * KAMI_BOOMSPHERE_MAXRADIUS / (KAMI_IMPLODE_STARTTIME - KAMI_EXPLODE_STARTTIME) );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 772
ADDP4
INDIRP4
ARGP4
CNSTF4 1137180672
ARGF4
ADDRLP4 20
INDIRF4
CVFI4 4
CNSTI4 720
MULI4
CNSTI4 1750
DIVI4
CVIF4 4
ARGF4
ADDRGP4 KamikazeRadiusDamage
CALLV
pop
line 1024
;1024:	}
LABELV $389
line 1027
;1025:
;1026:	// either cycle or kill self
;1027:	if( self->count >= KAMI_SHOCKWAVE_ENDTIME ) {
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 2000
LTI4 $391
line 1028
;1028:		G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1029
;1029:		return;
ADDRGP4 $386
JUMPV
LABELV $391
line 1031
;1030:	}
;1031:	self->nextthink = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1034
;1032:
;1033:	// add earth quake effect
;1034:	newangles[0] = crandom() * 2;
ADDRLP4 28
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 28
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
SUBF4
CNSTF4 1082130432
MULF4
ASGNF4
line 1035
;1035:	newangles[1] = crandom() * 2;
ADDRLP4 32
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4+4
ADDRLP4 32
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
SUBF4
CNSTF4 1082130432
MULF4
ASGNF4
line 1036
;1036:	newangles[2] = 0;
ADDRLP4 4+8
CNSTF4 0
ASGNF4
line 1037
;1037:	for (i = 0; i < MAX_CLIENTS; i++)
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $396
line 1038
;1038:	{
line 1039
;1039:		ent = &g_entities[i];
ADDRLP4 0
ADDRLP4 16
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1040
;1040:		if (!ent->inuse)
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $400
line 1041
;1041:			continue;
ADDRGP4 $397
JUMPV
LABELV $400
line 1042
;1042:		if (!ent->client)
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $402
line 1043
;1043:			continue;
ADDRGP4 $397
JUMPV
LABELV $402
line 1045
;1044:
;1045:		if (ent->client->ps.groundEntityNum != ENTITYNUM_NONE) {
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $404
line 1046
;1046:			ent->client->ps.velocity[0] += crandom() * 120;
ADDRLP4 36
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRF4
ADDRLP4 36
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
SUBF4
CNSTF4 1131413504
MULF4
ADDF4
ASGNF4
line 1047
;1047:			ent->client->ps.velocity[1] += crandom() * 120;
ADDRLP4 44
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 48
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
ADDRLP4 44
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
SUBF4
CNSTF4 1131413504
MULF4
ADDF4
ASGNF4
line 1048
;1048:			ent->client->ps.velocity[2] = 30 + random() * 25;
ADDRLP4 52
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 52
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 977797520
MULF4
CNSTF4 1106247680
ADDF4
ASGNF4
line 1049
;1049:		}
LABELV $404
line 1051
;1050:
;1051:		ent->client->ps.delta_angles[0] += ANGLE2SHORT(newangles[0] - self->movedir[0]);
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 56
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
ADDRLP4 4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRF4
SUBF4
CNSTF4 1127615329
MULF4
CVFI4 4
CNSTI4 65535
BANDI4
ADDI4
ASGNI4
line 1052
;1052:		ent->client->ps.delta_angles[1] += ANGLE2SHORT(newangles[1] - self->movedir[1]);
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
ADDRLP4 4+4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
SUBF4
CNSTF4 1127615329
MULF4
CVFI4 4
CNSTI4 65535
BANDI4
ADDI4
ASGNI4
line 1053
;1053:		ent->client->ps.delta_angles[2] += ANGLE2SHORT(newangles[2] - self->movedir[2]);
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
ADDRLP4 4+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 684
ADDP4
INDIRF4
SUBF4
CNSTF4 1127615329
MULF4
CVFI4 4
CNSTI4 65535
BANDI4
ADDI4
ASGNI4
line 1054
;1054:	}
LABELV $397
line 1037
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 64
LTI4 $396
line 1055
;1055:	VectorCopy(newangles, self->movedir);
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 1056
;1056:}
LABELV $386
endproc KamikazeDamage 56 20
export G_StartKamikaze
proc G_StartKamikaze 32 32
line 1063
;1057:
;1058:/*
;1059:===============
;1060:G_StartKamikaze
;1061:===============
;1062:*/
;1063:void G_StartKamikaze( gentity_t *ent ) {
line 1069
;1064:	gentity_t	*explosion;
;1065:	gentity_t	*te;
;1066:	vec3_t		snapped;
;1067:
;1068:	// start up the explosion logic
;1069:	explosion = G_Spawn();
ADDRLP4 20
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 1071
;1070:
;1071:	explosion->s.eType = ET_EVENTS + EV_KAMIKAZE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 81
ASGNI4
line 1072
;1072:	explosion->eventTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1074
;1073:
;1074:	if ( ent->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $410
line 1075
;1075:		VectorCopy( ent->s.pos.trBase, snapped );
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1076
;1076:	}
ADDRGP4 $411
JUMPV
LABELV $410
line 1077
;1077:	else {
line 1078
;1078:		VectorCopy( ent->activator->s.pos.trBase, snapped );
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1079
;1079:	}
LABELV $411
line 1080
;1080:	SnapVector( snapped );		// save network bandwidth
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
line 1081
;1081:	G_SetOrigin( explosion, snapped );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1083
;1082:
;1083:	explosion->classname = "kamikaze";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $416
ASGNP4
line 1084
;1084:	explosion->s.pos.trType = TR_STATIONARY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 1086
;1085:
;1086:	explosion->kamikazeTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1088
;1087:
;1088:	explosion->think = KamikazeDamage;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 KamikazeDamage
ASGNP4
line 1089
;1089:	explosion->nextthink = level.time + 100;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1090
;1090:	explosion->count = 0;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 0
ASGNI4
line 1091
;1091:	VectorClear(explosion->movedir);
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 684
ADDP4
CNSTF4 0
ASGNF4
line 1093
;1092:
;1093:	trap_LinkEntity( explosion );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1095
;1094:
;1095:	if (ent->client) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $419
line 1097
;1096:		//
;1097:		explosion->activator = ent;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1099
;1098:		//
;1099:		ent->s.eFlags &= ~EF_KAMIKAZE;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 -513
BANDI4
ASGNI4
line 1101
;1100:		// nuke the guy that used it
;1101:		G_Damage( ent, ent, ent, NULL, NULL, 100000, DAMAGE_NO_PROTECTION, MOD_KAMIKAZE );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 28
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
CNSTI4 26
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1102
;1102:	}
ADDRGP4 $420
JUMPV
LABELV $419
line 1103
;1103:	else {
line 1104
;1104:		if ( !strcmp(ent->activator->classname, "bodyque") ) {
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $423
ARGP4
ADDRLP4 24
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $421
line 1105
;1105:			explosion->activator = &g_entities[ent->activator->r.ownerNum];
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1106
;1106:		}
ADDRGP4 $422
JUMPV
LABELV $421
line 1107
;1107:		else {
line 1108
;1108:			explosion->activator = ent->activator;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
INDIRP4
ASGNP4
line 1109
;1109:		}
LABELV $422
line 1110
;1110:	}
LABELV $420
line 1113
;1111:
;1112:	// play global sound at all clients
;1113:	te = G_TempEntity(snapped, EV_GLOBAL_TEAM_SOUND );
ADDRLP4 4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 24
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 24
INDIRP4
ASGNP4
line 1114
;1114:	te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 28
ADDRLP4 16
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 1115
;1115:	te->s.eventParm = GTS_KAMIKAZE;
ADDRLP4 16
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 13
ASGNI4
line 1116
;1116:}
LABELV $408
endproc G_StartKamikaze 32 32
bss
align 4
LABELV muzzle_origin
skip 12
align 4
LABELV muzzle
skip 12
align 4
LABELV up
skip 12
align 4
LABELV right
skip 12
align 4
LABELV forward
skip 12
align 4
LABELV s_quadFactor
skip 4
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
import CalcMuzzlePoint
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
LABELV $423
byte 1 98
byte 1 111
byte 1 100
byte 1 121
byte 1 113
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $416
byte 1 107
byte 1 97
byte 1 109
byte 1 105
byte 1 107
byte 1 97
byte 1 122
byte 1 101
byte 1 0
