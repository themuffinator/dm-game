export G_ResetHistory
code
proc G_ResetHistory 16 0
file "..\..\..\..\code\game\g_unlagged.c"
line 14
;1://
;2:// Based on Neil Toronto's code.
;3://
;4:
;5:#include "g_local.h"
;6:
;7:/*
;8:============
;9:G_ResetHistory
;10:
;11:Clear out the given client's history (should be called when the teleport bit is flipped)
;12:============
;13:*/
;14:void G_ResetHistory( gentity_t *ent ) {
line 18
;15:	int		i, t, dt;
;16:	gclient_t	*client;
;17:
;18:	client = ent->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 19
;19:	dt = 1000 / sv_fps.integer;
ADDRLP4 12
CNSTI4 1000
ADDRGP4 sv_fps+12
INDIRI4
DIVI4
ASGNI4
line 22
;20:
;21:	// fill up the history with data (assume the current position)
;22:	client->historyHead = NUM_CLIENT_HISTORY - 1;
ADDRLP4 4
INDIRP4
CNSTI4 1612
ADDP4
CNSTI4 17
ASGNI4
line 23
;23:	for ( i = client->historyHead, t = level.time; i >= 0; i--, t -= dt ) {
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 1612
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
ADDRGP4 level+32
INDIRI4
ASGNI4
ADDRGP4 $60
JUMPV
LABELV $57
line 24
;24:		VectorCopy( ent->r.mins, client->history[i].mins );
ADDRLP4 0
INDIRI4
CNSTI4 40
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 852
ADDP4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRB
ASGNB 12
line 25
;25:		VectorCopy( ent->r.maxs, client->history[i].maxs );
ADDRLP4 0
INDIRI4
CNSTI4 40
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 852
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
INDIRB
ASGNB 12
line 26
;26:		VectorCopy( ent->r.currentOrigin, client->history[i].currentOrigin );
ADDRLP4 0
INDIRI4
CNSTI4 40
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 852
ADDP4
ADDP4
CNSTI4 24
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 27
;27:		client->history[ i ].leveltime = t;
ADDRLP4 0
INDIRI4
CNSTI4 40
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 852
ADDP4
ADDP4
CNSTI4 36
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 28
;28:	}
LABELV $58
line 23
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
ASGNI4
LABELV $60
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $57
line 29
;29:}
LABELV $55
endproc G_ResetHistory 16 0
export G_StoreHistory
proc G_StoreHistory 12 0
line 39
;30:
;31:
;32:/*
;33:============
;34:G_StoreHistory
;35:
;36:Keep track of where the client's been
;37:============
;38:*/
;39:void G_StoreHistory( gentity_t *ent ) {
line 43
;40:	int		head;
;41:	gclient_t	*client;
;42:
;43:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 45
;44:
;45:	client->historyHead++;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 1612
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
line 46
;46:	if ( client->historyHead >= NUM_CLIENT_HISTORY ) {
ADDRLP4 0
INDIRP4
CNSTI4 1612
ADDP4
INDIRI4
CNSTI4 18
LTI4 $63
line 47
;47:		client->historyHead = 0;
ADDRLP4 0
INDIRP4
CNSTI4 1612
ADDP4
CNSTI4 0
ASGNI4
line 48
;48:	}
LABELV $63
line 50
;49:
;50:	head = client->historyHead;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 1612
ADDP4
INDIRI4
ASGNI4
line 53
;51:
;52:	// store all the collision-detection info and the time
;53:	VectorCopy( ent->r.mins, client->history[head].mins );
ADDRLP4 4
INDIRI4
CNSTI4 40
MULI4
ADDRLP4 0
INDIRP4
CNSTI4 852
ADDP4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRB
ASGNB 12
line 54
;54:	VectorCopy( ent->r.maxs, client->history[head].maxs );
ADDRLP4 4
INDIRI4
CNSTI4 40
MULI4
ADDRLP4 0
INDIRP4
CNSTI4 852
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
INDIRB
ASGNB 12
line 55
;55:	VectorCopy( ent->s.pos.trBase, client->history[head].currentOrigin );
ADDRLP4 4
INDIRI4
CNSTI4 40
MULI4
ADDRLP4 0
INDIRP4
CNSTI4 852
ADDP4
ADDP4
CNSTI4 24
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 56
;56:	client->history[head].leveltime = level.time;
ADDRLP4 4
INDIRI4
CNSTI4 40
MULI4
ADDRLP4 0
INDIRP4
CNSTI4 852
ADDP4
ADDP4
CNSTI4 36
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 57
;57:}
LABELV $62
endproc G_StoreHistory 12 0
proc TimeShiftLerp 12 0
line 68
;58:
;59:
;60:/*
;61:=============
;62:TimeShiftLerp
;63:
;64:Used below to interpolate between two previous vectors
;65:Returns a vector "frac" times the distance between "start" and "end"
;66:=============
;67:*/
;68:static void TimeShiftLerp( float frac, const vec3_t start, const vec3_t end, vec3_t result ) {
line 69
;69:	result[0] = start[0] + frac * ( end[0] - start[0] );
ADDRLP4 0
ADDRFP4 4
INDIRP4
INDIRF4
ASGNF4
ADDRFP4 12
INDIRP4
ADDRLP4 0
INDIRF4
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 70
;70:	result[1] = start[1] + frac * ( end[1] - start[1] );
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 71
;71:	result[2] = start[2] + frac * ( end[2] - start[2] );
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 72
;72:}
LABELV $66
endproc TimeShiftLerp 12 0
export G_TimeShiftClient
proc G_TimeShiftClient 40 16
line 82
;73:
;74:
;75:/*
;76:=================
;77:G_TimeShiftClient
;78:
;79:Move a client back to where he was at the specified "time"
;80:=================
;81:*/
;82:void G_TimeShiftClient( gentity_t *ent, int time, qboolean debug, gentity_t *debugger ) {
line 88
;83:	int		j, k;
;84:	gclient_t	*client;
;85:
;86:	// find two entries in the history whose times sandwich "time"
;87:	// assumes no two adjacent records have the same timestamp
;88:	client = ent->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 89
;89:	j = k = client->historyHead;
ADDRLP4 12
ADDRLP4 4
INDIRP4
CNSTI4 1612
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
LABELV $68
line 90
;90:	do {
line 91
;91:		if ( client->history[j].leveltime <= time )
ADDRLP4 0
INDIRI4
CNSTI4 40
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 852
ADDP4
ADDP4
CNSTI4 36
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
GTI4 $71
line 92
;92:			break;
ADDRGP4 $70
JUMPV
LABELV $71
line 94
;93:
;94:		k = j;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
line 95
;95:		j--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 96
;96:		if ( j < 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $73
line 97
;97:			j = NUM_CLIENT_HISTORY - 1;
ADDRLP4 0
CNSTI4 17
ASGNI4
line 98
;98:		}
LABELV $73
line 99
;99:	}
LABELV $69
line 100
;100:	while ( j != client->historyHead );
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 1612
ADDP4
INDIRI4
NEI4 $68
LABELV $70
line 103
;101:
;102:	// if we got past the first iteration above, we've sandwiched (or wrapped)
;103:	if ( j != k ) {
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $75
line 105
;104:		// make sure it doesn't get re-saved
;105:		if ( client->saved.leveltime != level.time ) {
ADDRLP4 4
INDIRP4
CNSTI4 1608
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
EQI4 $77
line 107
;106:			// save the current origin and bounding box
;107:			VectorCopy( ent->r.mins, client->saved.mins );
ADDRLP4 4
INDIRP4
CNSTI4 1572
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRB
ASGNB 12
line 108
;108:			VectorCopy( ent->r.maxs, client->saved.maxs );
ADDRLP4 4
INDIRP4
CNSTI4 1584
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
INDIRB
ASGNB 12
line 109
;109:			VectorCopy( ent->r.currentOrigin, client->saved.currentOrigin );
ADDRLP4 4
INDIRP4
CNSTI4 1596
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 110
;110:			client->saved.leveltime = level.time;
ADDRLP4 4
INDIRP4
CNSTI4 1608
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 111
;111:		}
LABELV $77
line 115
;112:
;113:		// if we haven't wrapped back to the head, we've sandwiched, so
;114:		// we shift the client's position back to where he was at "time"
;115:		if ( j != client->historyHead ) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 1612
ADDP4
INDIRI4
EQI4 $81
line 116
;116:			float	frac = (float)(time - client->history[j].leveltime) /
ADDRLP4 16
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 40
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 852
ADDP4
ADDP4
CNSTI4 36
ADDP4
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 8
INDIRI4
CNSTI4 40
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 852
ADDP4
ADDP4
CNSTI4 36
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 40
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 852
ADDP4
ADDP4
CNSTI4 36
ADDP4
INDIRI4
SUBI4
CVIF4 4
DIVF4
ASGNF4
line 120
;117:				(float)(client->history[k].leveltime - client->history[j].leveltime);
;118:
;119:			// interpolate between the two origins to give position at time index "time"
;120:			TimeShiftLerp( frac, client->history[j].currentOrigin, client->history[k].currentOrigin, ent->r.currentOrigin );
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 40
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 852
ADDP4
ADDP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 40
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 852
ADDP4
ADDP4
CNSTI4 24
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRGP4 TimeShiftLerp
CALLV
pop
line 123
;121:
;122:			// lerp these too, just for fun (and ducking)
;123:			TimeShiftLerp( frac, client->history[j].mins, client->history[k].mins, ent->r.mins );
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 40
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 852
ADDP4
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 40
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 852
ADDP4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
ARGP4
ADDRGP4 TimeShiftLerp
CALLV
pop
line 125
;124:
;125:			TimeShiftLerp( frac, client->history[j].maxs, client->history[k].maxs,ent->r.maxs );
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 40
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 852
ADDP4
ADDP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 40
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 852
ADDP4
ADDP4
CNSTI4 12
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRGP4 TimeShiftLerp
CALLV
pop
line 128
;126:
;127:			// this will recalculate absmin and absmax
;128:			trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 129
;129:		} else {
ADDRGP4 $82
JUMPV
LABELV $81
line 131
;130:			// we wrapped, so grab the earliest
;131:			VectorCopy( client->history[k].currentOrigin, ent->r.currentOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 40
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 852
ADDP4
ADDP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 132
;132:			VectorCopy( client->history[k].mins, ent->r.mins );
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 40
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 852
ADDP4
ADDP4
INDIRB
ASGNB 12
line 133
;133:			VectorCopy( client->history[k].maxs, ent->r.maxs );
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 40
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 852
ADDP4
ADDP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 136
;134:
;135:			// this will recalculate absmin and absmax
;136:			trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 137
;137:		}
LABELV $82
line 138
;138:	}
LABELV $75
line 139
;139:}
LABELV $67
endproc G_TimeShiftClient 40 16
export G_TimeShiftAllClients
proc G_TimeShiftAllClients 12 16
line 150
;140:
;141:
;142:/*
;143:=====================
;144:G_TimeShiftAllClients
;145:
;146:Move ALL clients back to where they were at the specified "ltime",
;147:except for "skip"
;148:=====================
;149:*/
;150:void G_TimeShiftAllClients( int ltime, gentity_t *skip ) {
line 155
;151:	int			i;
;152:	gentity_t	*ent;
;153:
;154:	// for every client
;155:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 156
;156:	for ( i = 0; i < level.maxclients; i++, ent++ ) 
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $87
JUMPV
LABELV $84
line 157
;157:	{
line 158
;158:		if ( ent == skip )
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
NEU4 $89
line 159
;159:			continue;
ADDRGP4 $85
JUMPV
LABELV $89
line 161
;160:
;161:		if ( !ent->r.linked )
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
CNSTI4 0
NEI4 $91
line 162
;162:			continue;
ADDRGP4 $85
JUMPV
LABELV $91
line 164
;163:
;164:		if ( ent->client && ent->inuse && ent->client->sess.sessionTeam < TEAM_SPECTATOR ) 
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $93
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $93
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
GEI4 $93
line 165
;165:			G_TimeShiftClient( ent, ltime, qfalse, skip );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_TimeShiftClient
CALLV
pop
LABELV $93
line 166
;166:	}
LABELV $85
line 156
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 824
ADDP4
ASGNP4
LABELV $87
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $84
line 167
;167:}
LABELV $83
endproc G_TimeShiftAllClients 12 16
export G_DoTimeShiftFor
proc G_DoTimeShiftFor 8 8
line 177
;168:
;169:
;170:/*
;171:================
;172:G_DoTimeShiftFor
;173:
;174:Decide what time to shift everyone back to, and do it
;175:================
;176:*/
;177:void G_DoTimeShiftFor( gentity_t *ent ) {	
line 181
;178:	int time;
;179:
;180:	// don't time shift for mistakes or bots
;181:	if ( !ent->inuse || !ent->client || (ent->r.svFlags & SVF_BOT) ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $99
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $99
ADDRLP4 4
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $96
LABELV $99
line 182
;182:		return;
ADDRGP4 $95
JUMPV
LABELV $96
line 186
;183:	}
;184:
;185:	// if it's enabled server-side and the client wants it or wants it for this weapon
;186:	if ( g_unlagged.integer ) {
ADDRGP4 g_unlagged+12
INDIRI4
CNSTI4 0
EQI4 $100
line 188
;187:		// full lag compensation
;188:		time = ent->client->lastCmdTime;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 660
ADDP4
INDIRI4
ASGNI4
line 189
;189:	} else {
ADDRGP4 $101
JUMPV
LABELV $100
line 191
;190:		// server frame lag compensation
;191:		time = level.previousTime + ent->client->frameOffset;
ADDRLP4 0
ADDRGP4 level+36
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1616
ADDP4
INDIRI4
ADDI4
ASGNI4
line 192
;192:	}
LABELV $101
line 194
;193:
;194:	G_TimeShiftAllClients( time, ent );
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_TimeShiftAllClients
CALLV
pop
line 195
;195:}
LABELV $95
endproc G_DoTimeShiftFor 8 8
export G_UnTimeShiftClient
proc G_UnTimeShiftClient 12 4
line 205
;196:
;197:
;198:/*
;199:===================
;200:G_UnTimeShiftClient
;201:
;202:Move a client back to where he was before the time shift
;203:===================
;204:*/
;205:void G_UnTimeShiftClient( gentity_t *ent ) {
line 207
;206:	// if it was saved
;207:	if ( ent->client->saved.leveltime == level.time ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1608
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
NEI4 $105
line 209
;208:		// move it back
;209:		VectorCopy( ent->client->saved.mins, ent->r.mins );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1572
ADDP4
INDIRB
ASGNB 12
line 210
;210:		VectorCopy( ent->client->saved.maxs, ent->r.maxs );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 448
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1584
ADDP4
INDIRB
ASGNB 12
line 211
;211:		VectorCopy( ent->client->saved.currentOrigin, ent->r.currentOrigin );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1596
ADDP4
INDIRB
ASGNB 12
line 212
;212:		ent->client->saved.leveltime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1608
ADDP4
CNSTI4 0
ASGNI4
line 215
;213:
;214:		// this will recalculate absmin and absmax
;215:		trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 216
;216:	}
LABELV $105
line 217
;217:}
LABELV $104
endproc G_UnTimeShiftClient 12 4
export G_UnTimeShiftAllClients
proc G_UnTimeShiftAllClients 16 4
line 229
;218:
;219:
;220:/*
;221:=======================
;222:G_UnTimeShiftAllClients
;223:
;224:Move ALL the clients back to where they were before the time shift,
;225:except for "skip"
;226:=======================
;227:*/
;228:void G_UnTimeShiftAllClients( gentity_t *skip ) 
;229:{
line 234
;230:	int		i;
;231:	gentity_t	*ent;
;232:	qboolean	linked;
;233:
;234:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 235
;235:	for ( i = 0; i < level.maxclients; i++, ent++ ) 
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $112
JUMPV
LABELV $109
line 236
;236:	{
line 237
;237:		if ( ent == skip )
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $114
line 238
;238:			continue;
ADDRGP4 $110
JUMPV
LABELV $114
line 240
;239:
;240:		linked = ent->r.linked;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
ASGNI4
line 242
;241:
;242:		if ( ent->client && ent->inuse && ent->client->sess.sessionTeam < TEAM_SPECTATOR ) 
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $116
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $116
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
GEI4 $116
line 243
;243:		{
line 244
;244:			G_UnTimeShiftClient( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_UnTimeShiftClient
CALLV
pop
line 245
;245:			if ( !linked ) 
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $118
line 246
;246:			{
line 247
;247:				trap_UnlinkEntity( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 248
;248:			}
LABELV $118
line 249
;249:		}
LABELV $116
line 250
;250:	}
LABELV $110
line 235
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 824
ADDP4
ASGNP4
LABELV $112
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $109
line 251
;251:}
LABELV $108
endproc G_UnTimeShiftAllClients 16 4
export G_UndoTimeShiftFor
proc G_UndoTimeShiftFor 4 4
line 261
;252:
;253:
;254:/*
;255:==================
;256:G_UndoTimeShiftFor
;257:
;258:Put everyone except for this client back where they were
;259:==================
;260:*/
;261:void G_UndoTimeShiftFor( gentity_t *ent ) {
line 264
;262:
;263:	// don't un-time shift for mistakes or bots
;264:	if ( !ent->inuse || !ent->client || (ent->r.svFlags & SVF_BOT) ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $124
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $124
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $121
LABELV $124
line 265
;265:		return;
ADDRGP4 $120
JUMPV
LABELV $121
line 268
;266:	}
;267:
;268:	G_UnTimeShiftAllClients( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UnTimeShiftAllClients
CALLV
pop
line 269
;269:}
LABELV $120
endproc G_UndoTimeShiftFor 4 4
proc G_PredictPlayerClipVelocity 12 0
line 282
;270:
;271:
;272:/*
;273:===========================
;274:G_PredictPlayerClipVelocity
;275:
;276:Slide on the impacting surface
;277:===========================
;278:*/
;279:
;280:#define	OVERCLIP		1.001f
;281:
;282:static void G_PredictPlayerClipVelocity( const vec3_t in, const vec3_t normal, vec3_t out ) {
line 286
;283:	float	backoff;
;284:
;285:	// find the magnitude of the vector "in" along "normal"
;286:	backoff = DotProduct (in, normal);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 8
INDIRP4
INDIRF4
MULF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 289
;287:
;288:	// tilt the plane a bit to avoid floating-point error issues
;289:	if ( backoff < 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $126
line 290
;290:		backoff *= OVERCLIP;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1065361605
MULF4
ASGNF4
line 291
;291:	} else {
ADDRGP4 $127
JUMPV
LABELV $126
line 292
;292:		backoff /= OVERCLIP;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1065336456
MULF4
ASGNF4
line 293
;293:	}
LABELV $127
line 296
;294:
;295:	// slide along
;296:	VectorMA( in, -backoff, normal, out );
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
line 297
;297:}
LABELV $125
endproc G_PredictPlayerClipVelocity 12 0
export G_PredictPlayerSlideMove
proc G_PredictPlayerSlideMove 288 28
line 309
;298:
;299:
;300:/*
;301:========================
;302:G_PredictPlayerSlideMove
;303:
;304:Advance the given entity frametime seconds, sliding as appropriate
;305:========================
;306:*/
;307:#define	MAX_CLIP_PLANES	5
;308:
;309:qboolean G_PredictPlayerSlideMove( gentity_t *ent, float frametime ) {
line 325
;310:	int			bumpcount, numbumps;
;311:	vec3_t		dir;
;312:	float		d;
;313:	int			numplanes;
;314:	vec3_t		planes[MAX_CLIP_PLANES];
;315:	vec3_t		primal_velocity, velocity, origin;
;316:	vec3_t		clipVelocity;
;317:	int			i, j, k;
;318:	trace_t	trace;
;319:	vec3_t		end;
;320:	float		time_left;
;321:	float		into;
;322:	vec3_t		endVelocity;
;323:	vec3_t		endClipVelocity;
;324:
;325:	numbumps = 4;
ADDRLP4 232
CNSTI4 4
ASGNI4
line 327
;326:
;327:	VectorCopy( ent->s.pos.trDelta, primal_velocity );
ADDRLP4 236
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 328
;328:	VectorCopy( primal_velocity, velocity );
ADDRLP4 76
ADDRLP4 236
INDIRB
ASGNB 12
line 329
;329:	VectorCopy( ent->s.pos.trBase, origin );
ADDRLP4 112
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 331
;330:
;331:	VectorCopy( velocity, endVelocity );
ADDRLP4 140
ADDRLP4 76
INDIRB
ASGNB 12
line 333
;332:
;333:	time_left = frametime;
ADDRLP4 212
ADDRFP4 4
INDIRF4
ASGNF4
line 335
;334:
;335:	numplanes = 0;
ADDRLP4 108
CNSTI4 0
ASGNI4
line 337
;336:
;337:	for ( bumpcount = 0; bumpcount < numbumps; bumpcount++ ) {
ADDRLP4 228
CNSTI4 0
ASGNI4
ADDRGP4 $132
JUMPV
LABELV $129
line 340
;338:
;339:		// calculate position we are trying to move to
;340:		VectorMA( origin, time_left, velocity, end );
ADDRLP4 216
ADDRLP4 112
INDIRF4
ADDRLP4 76
INDIRF4
ADDRLP4 212
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 216+4
ADDRLP4 112+4
INDIRF4
ADDRLP4 76+4
INDIRF4
ADDRLP4 212
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 216+8
ADDRLP4 112+8
INDIRF4
ADDRLP4 76+8
INDIRF4
ADDRLP4 212
INDIRF4
MULF4
ADDF4
ASGNF4
line 343
;341:
;342:		// see if we can make it there
;343:		trap_Trace( &trace, origin, ent->r.mins, ent->r.maxs, end, ent->s.number, ent->clipmask );
ADDRLP4 152
ARGP4
ADDRLP4 112
ARGP4
ADDRLP4 252
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 252
INDIRP4
CNSTI4 436
ADDP4
ARGP4
ADDRLP4 252
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRLP4 216
ARGP4
ADDRLP4 252
INDIRP4
INDIRI4
ARGI4
ADDRLP4 252
INDIRP4
CNSTI4 572
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 345
;344:
;345:		if (trace.allsolid) {
ADDRLP4 152
INDIRI4
CNSTI4 0
EQI4 $139
line 347
;346:			// entity is completely trapped in another solid
;347:			VectorClear( velocity );
ADDRLP4 76
CNSTF4 0
ASGNF4
ADDRLP4 76+4
CNSTF4 0
ASGNF4
ADDRLP4 76+8
CNSTF4 0
ASGNF4
line 348
;348:			VectorCopy( origin, ent->s.pos.trBase );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 112
INDIRB
ASGNB 12
line 349
;349:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $128
JUMPV
LABELV $139
line 352
;350:		}
;351:
;352:		if (trace.fraction > 0) {
ADDRLP4 152+8
INDIRF4
CNSTF4 0
LEF4 $143
line 354
;353:			// actually covered some distance
;354:			VectorCopy( trace.endpos, origin );
ADDRLP4 112
ADDRLP4 152+12
INDIRB
ASGNB 12
line 355
;355:		}
LABELV $143
line 357
;356:
;357:		if (trace.fraction == 1) {
ADDRLP4 152+8
INDIRF4
CNSTF4 1065353216
NEF4 $147
line 358
;358:			break;		// moved the entire distance
ADDRGP4 $131
JUMPV
LABELV $147
line 361
;359:		}
;360:
;361:		time_left -= time_left * trace.fraction;
ADDRLP4 212
ADDRLP4 212
INDIRF4
ADDRLP4 212
INDIRF4
ADDRLP4 152+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 363
;362:
;363:		if ( numplanes >= MAX_CLIP_PLANES ) {
ADDRLP4 108
INDIRI4
CNSTI4 5
LTI4 $151
line 365
;364:			// this shouldn't really happen
;365:			VectorClear( velocity );
ADDRLP4 76
CNSTF4 0
ASGNF4
ADDRLP4 76+4
CNSTF4 0
ASGNF4
ADDRLP4 76+8
CNSTF4 0
ASGNF4
line 366
;366:			VectorCopy( origin, ent->s.pos.trBase );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 112
INDIRB
ASGNB 12
line 367
;367:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $128
JUMPV
LABELV $151
line 375
;368:		}
;369:
;370:		//
;371:		// if this is the same plane we hit before, nudge velocity
;372:		// out along it, which fixes some epsilon issues with
;373:		// non-axial planes
;374:		//
;375:		for ( i = 0; i < numplanes; i++ ) {
ADDRLP4 92
CNSTI4 0
ASGNI4
ADDRGP4 $158
JUMPV
LABELV $155
line 376
;376:			if ( DotProduct( trace.plane.normal, planes[i] ) > 0.99 ) {
ADDRLP4 152+24
INDIRF4
ADDRLP4 92
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 152+24+4
INDIRF4
ADDRLP4 92
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 152+24+8
INDIRF4
ADDRLP4 92
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 1065185444
LEF4 $159
line 377
;377:				VectorAdd( trace.plane.normal, velocity, velocity );
ADDRLP4 76
ADDRLP4 152+24
INDIRF4
ADDRLP4 76
INDIRF4
ADDF4
ASGNF4
ADDRLP4 76+4
ADDRLP4 152+24+4
INDIRF4
ADDRLP4 76+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 76+8
ADDRLP4 152+24+8
INDIRF4
ADDRLP4 76+8
INDIRF4
ADDF4
ASGNF4
line 378
;378:				break;
ADDRGP4 $157
JUMPV
LABELV $159
line 380
;379:			}
;380:		}
LABELV $156
line 375
ADDRLP4 92
ADDRLP4 92
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $158
ADDRLP4 92
INDIRI4
ADDRLP4 108
INDIRI4
LTI4 $155
LABELV $157
line 382
;381:
;382:		if ( i < numplanes ) {
ADDRLP4 92
INDIRI4
ADDRLP4 108
INDIRI4
GEI4 $177
line 383
;383:			continue;
ADDRGP4 $130
JUMPV
LABELV $177
line 386
;384:		}
;385:
;386:		VectorCopy( trace.plane.normal, planes[numplanes] );
ADDRLP4 108
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ADDRLP4 152+24
INDIRB
ASGNB 12
line 387
;387:		numplanes++;
ADDRLP4 108
ADDRLP4 108
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 394
;388:
;389:		//
;390:		// modify velocity so it parallels all of the clip planes
;391:		//
;392:
;393:		// find a plane that it enters
;394:		for ( i = 0; i < numplanes; i++ ) {
ADDRLP4 92
CNSTI4 0
ASGNI4
ADDRGP4 $183
JUMPV
LABELV $180
line 395
;395:			into = DotProduct( velocity, planes[i] );
ADDRLP4 208
ADDRLP4 76
INDIRF4
ADDRLP4 92
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 76+4
INDIRF4
ADDRLP4 92
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 76+8
INDIRF4
ADDRLP4 92
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 396
;396:			if ( into >= 0.1 ) {
ADDRLP4 208
INDIRF4
CNSTF4 1036831949
LTF4 $188
line 397
;397:				continue;		// move doesn't interact with the plane
ADDRGP4 $181
JUMPV
LABELV $188
line 401
;398:			}
;399:
;400:			// slide along the plane
;401:			G_PredictPlayerClipVelocity( velocity, planes[i], clipVelocity );
ADDRLP4 76
ARGP4
ADDRLP4 92
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 64
ARGP4
ADDRGP4 G_PredictPlayerClipVelocity
CALLV
pop
line 404
;402:
;403:			// slide along the plane
;404:			G_PredictPlayerClipVelocity( endVelocity, planes[i], endClipVelocity );
ADDRLP4 140
ARGP4
ADDRLP4 92
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 128
ARGP4
ADDRGP4 G_PredictPlayerClipVelocity
CALLV
pop
line 407
;405:
;406:			// see if there is a second plane that the new move enters
;407:			for ( j = 0; j < numplanes; j++ ) {
ADDRLP4 88
CNSTI4 0
ASGNI4
ADDRGP4 $193
JUMPV
LABELV $190
line 408
;408:				if ( j == i ) {
ADDRLP4 88
INDIRI4
ADDRLP4 92
INDIRI4
NEI4 $194
line 409
;409:					continue;
ADDRGP4 $191
JUMPV
LABELV $194
line 412
;410:				}
;411:
;412:				if ( DotProduct( clipVelocity, planes[j] ) >= 0.1 ) {
ADDRLP4 64
INDIRF4
ADDRLP4 88
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 64+4
INDIRF4
ADDRLP4 88
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 64+8
INDIRF4
ADDRLP4 88
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 1036831949
LTF4 $196
line 413
;413:					continue;		// move doesn't interact with the plane
ADDRGP4 $191
JUMPV
LABELV $196
line 417
;414:				}
;415:
;416:				// try clipping the move to the plane
;417:				G_PredictPlayerClipVelocity( clipVelocity, planes[j], clipVelocity );
ADDRLP4 64
ARGP4
ADDRLP4 88
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 64
ARGP4
ADDRGP4 G_PredictPlayerClipVelocity
CALLV
pop
line 418
;418:				G_PredictPlayerClipVelocity( endClipVelocity, planes[j], endClipVelocity );
ADDRLP4 128
ARGP4
ADDRLP4 88
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 128
ARGP4
ADDRGP4 G_PredictPlayerClipVelocity
CALLV
pop
line 421
;419:
;420:				// see if it goes back into the first clip plane
;421:				if ( DotProduct( clipVelocity, planes[i] ) >= 0 ) {
ADDRLP4 64
INDIRF4
ADDRLP4 92
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 64+4
INDIRF4
ADDRLP4 92
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 64+8
INDIRF4
ADDRLP4 92
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 0
LTF4 $202
line 422
;422:					continue;
ADDRGP4 $191
JUMPV
LABELV $202
line 426
;423:				}
;424:
;425:				// slide the original velocity along the crease
;426:				CrossProduct( planes[i], planes[j], dir );
ADDRLP4 92
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 88
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 96
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 427
;427:				VectorNormalize( dir );
ADDRLP4 96
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 428
;428:				d = DotProduct( dir, velocity );
ADDRLP4 124
ADDRLP4 96
INDIRF4
ADDRLP4 76
INDIRF4
MULF4
ADDRLP4 96+4
INDIRF4
ADDRLP4 76+4
INDIRF4
MULF4
ADDF4
ADDRLP4 96+8
INDIRF4
ADDRLP4 76+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 429
;429:				VectorScale( dir, d, clipVelocity );
ADDRLP4 64
ADDRLP4 96
INDIRF4
ADDRLP4 124
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 96+4
INDIRF4
ADDRLP4 124
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+8
ADDRLP4 96+8
INDIRF4
ADDRLP4 124
INDIRF4
MULF4
ASGNF4
line 431
;430:
;431:				CrossProduct( planes[i], planes[j], dir );
ADDRLP4 92
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 88
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 96
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 432
;432:				VectorNormalize( dir );
ADDRLP4 96
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 433
;433:				d = DotProduct( dir, endVelocity );
ADDRLP4 124
ADDRLP4 96
INDIRF4
ADDRLP4 140
INDIRF4
MULF4
ADDRLP4 96+4
INDIRF4
ADDRLP4 140+4
INDIRF4
MULF4
ADDF4
ADDRLP4 96+8
INDIRF4
ADDRLP4 140+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 434
;434:				VectorScale( dir, d, endClipVelocity );
ADDRLP4 128
ADDRLP4 96
INDIRF4
ADDRLP4 124
INDIRF4
MULF4
ASGNF4
ADDRLP4 128+4
ADDRLP4 96+4
INDIRF4
ADDRLP4 124
INDIRF4
MULF4
ASGNF4
ADDRLP4 128+8
ADDRLP4 96+8
INDIRF4
ADDRLP4 124
INDIRF4
MULF4
ASGNF4
line 437
;435:
;436:				// see if there is a third plane the the new move enters
;437:				for ( k = 0; k < numplanes; k++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $227
JUMPV
LABELV $224
line 438
;438:					if ( k == i || k == j ) {
ADDRLP4 0
INDIRI4
ADDRLP4 92
INDIRI4
EQI4 $230
ADDRLP4 0
INDIRI4
ADDRLP4 88
INDIRI4
NEI4 $228
LABELV $230
line 439
;439:						continue;
ADDRGP4 $225
JUMPV
LABELV $228
line 442
;440:					}
;441:
;442:					if ( DotProduct( clipVelocity, planes[k] ) >= 0.1 ) {
ADDRLP4 64
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 64+4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 64+8
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 1036831949
LTF4 $231
line 443
;443:						continue;		// move doesn't interact with the plane
ADDRGP4 $225
JUMPV
LABELV $231
line 447
;444:					}
;445:
;446:					// stop dead at a tripple plane interaction
;447:					VectorClear( velocity );
ADDRLP4 76
CNSTF4 0
ASGNF4
ADDRLP4 76+4
CNSTF4 0
ASGNF4
ADDRLP4 76+8
CNSTF4 0
ASGNF4
line 448
;448:					VectorCopy( origin, ent->s.pos.trBase );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 112
INDIRB
ASGNB 12
line 449
;449:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $128
JUMPV
LABELV $225
line 437
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $227
ADDRLP4 0
INDIRI4
ADDRLP4 108
INDIRI4
LTI4 $224
line 451
;450:				}
;451:			}
LABELV $191
line 407
ADDRLP4 88
ADDRLP4 88
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $193
ADDRLP4 88
INDIRI4
ADDRLP4 108
INDIRI4
LTI4 $190
line 454
;452:
;453:			// if we have fixed all interactions, try another move
;454:			VectorCopy( clipVelocity, velocity );
ADDRLP4 76
ADDRLP4 64
INDIRB
ASGNB 12
line 455
;455:			VectorCopy( endClipVelocity, endVelocity );
ADDRLP4 140
ADDRLP4 128
INDIRB
ASGNB 12
line 456
;456:			break;
ADDRGP4 $182
JUMPV
LABELV $181
line 394
ADDRLP4 92
ADDRLP4 92
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $183
ADDRLP4 92
INDIRI4
ADDRLP4 108
INDIRI4
LTI4 $180
LABELV $182
line 458
;457:		}
;458:	}
LABELV $130
line 337
ADDRLP4 228
ADDRLP4 228
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $132
ADDRLP4 228
INDIRI4
ADDRLP4 232
INDIRI4
LTI4 $129
LABELV $131
line 460
;459:
;460:	VectorCopy( endVelocity, velocity );
ADDRLP4 76
ADDRLP4 140
INDIRB
ASGNB 12
line 461
;461:	VectorCopy( origin, ent->s.pos.trBase );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 112
INDIRB
ASGNB 12
line 463
;462:
;463:	return (bumpcount != 0);
ADDRLP4 228
INDIRI4
CNSTI4 0
EQI4 $240
ADDRLP4 248
CNSTI4 1
ASGNI4
ADDRGP4 $241
JUMPV
LABELV $240
ADDRLP4 248
CNSTI4 0
ASGNI4
LABELV $241
ADDRLP4 248
INDIRI4
RETI4
LABELV $128
endproc G_PredictPlayerSlideMove 288 28
export G_PredictPlayerStepSlideMove
proc G_PredictPlayerStepSlideMove 124 28
line 474
;464:}
;465:
;466:
;467:/*
;468:============================
;469:G_PredictPlayerStepSlideMove
;470:
;471:Advance the given entity frametime seconds, stepping and sliding as appropriate
;472:============================
;473:*/
;474:void G_PredictPlayerStepSlideMove( gentity_t *ent, float frametime ) {
line 481
;475:	vec3_t start_o, start_v;
;476:	//vec3_t down_o, down_v;
;477:	vec3_t down, up;
;478:	trace_t trace;
;479:	float stepSize;
;480:
;481:	VectorCopy( ent->s.pos.trBase, start_o );
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 482
;482:	VectorCopy( ent->s.pos.trDelta, start_v );
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 484
;483:
;484:	if ( !G_PredictPlayerSlideMove( ent, frametime ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 108
ADDRGP4 G_PredictPlayerSlideMove
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $243
line 486
;485:		// not clipped, so forget stepping
;486:		return;
ADDRGP4 $242
JUMPV
LABELV $243
line 492
;487:	}
;488:
;489:	//VectorCopy( ent->s.pos.trBase, down_o );
;490:	//VectorCopy( ent->s.pos.trDelta, down_v );
;491:
;492:	VectorCopy( start_o, up );
ADDRLP4 80
ADDRLP4 56
INDIRB
ASGNB 12
line 494
;493:
;494:	up[2] += PM_STEP_HEIGHT;
ADDRLP4 80+8
ADDRLP4 80+8
INDIRF4
CNSTF4 1099956224
ADDF4
ASGNF4
line 497
;495:
;496:	// test the player position if they were a stepheight higher
;497:	trap_Trace( &trace, start_o, ent->r.mins, ent->r.maxs, up, ent->s.number, ent->clipmask );
ADDRLP4 0
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
CNSTI4 436
ADDP4
ARGP4
ADDRLP4 112
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 112
INDIRP4
INDIRI4
ARGI4
ADDRLP4 112
INDIRP4
CNSTI4 572
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 498
;498:	if ( trace.allsolid ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $246
line 499
;499:		return;		// can't step up
ADDRGP4 $242
JUMPV
LABELV $246
line 502
;500:	}
;501:
;502:	stepSize = trace.endpos[2] - start_o[2];
ADDRLP4 104
ADDRLP4 0+12+8
INDIRF4
ADDRLP4 56+8
INDIRF4
SUBF4
ASGNF4
line 505
;503:
;504:	// try slidemove from this position
;505:	VectorCopy( trace.endpos, ent->s.pos.trBase );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 506
;506:	VectorCopy( start_v, ent->s.pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 92
INDIRB
ASGNB 12
line 508
;507:
;508:	G_PredictPlayerSlideMove( ent, frametime );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRGP4 G_PredictPlayerSlideMove
CALLI4
pop
line 511
;509:
;510:	// push down the final amount
;511:	VectorCopy( ent->s.pos.trBase, down );
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 512
;512:	down[2] -= stepSize;
ADDRLP4 68+8
ADDRLP4 68+8
INDIRF4
ADDRLP4 104
INDIRF4
SUBF4
ASGNF4
line 513
;513:	trap_Trace( &trace, ent->s.pos.trBase, ent->r.mins, ent->r.maxs, down, ent->s.number, ent->clipmask );
ADDRLP4 0
ARGP4
ADDRLP4 116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 116
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 116
INDIRP4
CNSTI4 436
ADDP4
ARGP4
ADDRLP4 116
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRLP4 68
ARGP4
ADDRLP4 116
INDIRP4
INDIRI4
ARGI4
ADDRLP4 116
INDIRP4
CNSTI4 572
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 514
;514:	if ( !trace.allsolid ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $253
line 515
;515:		VectorCopy( trace.endpos, ent->s.pos.trBase );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 516
;516:	}
LABELV $253
line 517
;517:	if ( trace.fraction < 1.0 ) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
GEF4 $256
line 518
;518:		G_PredictPlayerClipVelocity( ent->s.pos.trDelta, trace.plane.normal, ent->s.pos.trDelta );
ADDRLP4 120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 120
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRLP4 0+24
ARGP4
ADDRLP4 120
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRGP4 G_PredictPlayerClipVelocity
CALLV
pop
line 519
;519:	}
LABELV $256
line 520
;520:}
LABELV $242
endproc G_PredictPlayerStepSlideMove 124 28
export G_PredictPlayerMove
proc G_PredictPlayerMove 0 8
line 532
;521:
;522:
;523:/*
;524:===================
;525:G_PredictPlayerMove
;526:
;527:Advance the given entity frametime seconds, stepping and sliding as appropriate
;528:
;529:This is the entry point to the server-side-only prediction code
;530:===================
;531:*/
;532:void G_PredictPlayerMove( gentity_t *ent, float frametime ) {
line 533
;533:	G_PredictPlayerStepSlideMove( ent, frametime );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRGP4 G_PredictPlayerStepSlideMove
CALLV
pop
line 534
;534:}
LABELV $260
endproc G_PredictPlayerMove 0 8
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
