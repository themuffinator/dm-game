export BotResetNodeSwitches
code
proc BotResetNodeSwitches 0 0
file "..\..\..\..\code\game\ai_dmnet.c"
line 49
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:/*****************************************************************************
;5: * name:		ai_dmnet.c
;6: *
;7: * desc:		Quake3 bot AI
;8: *
;9: * $Archive: /MissionPack/code/game/ai_dmnet.c $
;10: *
;11: *****************************************************************************/
;12:
;13:#include "g_local.h"
;14:#include "../botlib/botlib.h"
;15:#include "../botlib/be_aas.h"
;16:#include "../botlib/be_ea.h"
;17:#include "../botlib/be_ai_char.h"
;18:#include "../botlib/be_ai_chat.h"
;19:#include "../botlib/be_ai_gen.h"
;20:#include "../botlib/be_ai_goal.h"
;21:#include "../botlib/be_ai_move.h"
;22:#include "../botlib/be_ai_weap.h"
;23://
;24:#include "ai_main.h"
;25:#include "ai_dmq3.h"
;26:#include "ai_chat.h"
;27:#include "ai_cmd.h"
;28:#include "ai_dmnet.h"
;29:#include "ai_team.h"
;30://data file headers
;31:#include "chars.h"			//characteristics
;32:#include "inv.h"			//indexes into the inventory
;33:#include "syn.h"			//synonyms
;34:#include "match.h"			//string matching types and vars
;35:
;36://goal flag, see be_ai_goal.h for the other GFL_*
;37:#define GFL_AIR			128
;38:
;39:int numnodeswitches;
;40:char nodeswitch[MAX_NODESWITCHES+1][144];
;41:
;42:#define LOOKAHEAD_DISTANCE			300
;43:
;44:/*
;45:==================
;46:BotResetNodeSwitches
;47:==================
;48:*/
;49:void BotResetNodeSwitches(void) {
line 50
;50:	numnodeswitches = 0;
ADDRGP4 numnodeswitches
CNSTI4 0
ASGNI4
line 51
;51:}
LABELV $56
endproc BotResetNodeSwitches 0 0
export BotDumpNodeSwitches
proc BotDumpNodeSwitches 40 20
line 58
;52:
;53:/*
;54:==================
;55:BotDumpNodeSwitches
;56:==================
;57:*/
;58:void BotDumpNodeSwitches(bot_state_t *bs) {
line 62
;59:	int i;
;60:	char netname[MAX_NETNAME];
;61:
;62:	ClientName(bs->client, netname, sizeof(netname));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 63
;63:	BotAI_Print(PRT_MESSAGE, "%s at %1.1f switched more than %d AI nodes\n", netname, FloatTime(), MAX_NODESWITCHES);
CNSTI4 1
ARGI4
ADDRGP4 $58
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 floattime
INDIRF4
ARGF4
CNSTI4 50
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 64
;64:	for (i = 0; i < numnodeswitches; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $62
JUMPV
LABELV $59
line 65
;65:		BotAI_Print( PRT_MESSAGE, "%s", nodeswitch[i] );
CNSTI4 1
ARGI4
ADDRGP4 $63
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 144
MULI4
ADDRGP4 nodeswitch
ADDP4
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 66
;66:	}
LABELV $60
line 64
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $62
ADDRLP4 0
INDIRI4
ADDRGP4 numnodeswitches
INDIRI4
LTI4 $59
line 67
;67:	BotAI_Print(PRT_FATAL, "");
CNSTI4 4
ARGI4
ADDRGP4 $64
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 68
;68:}
LABELV $57
endproc BotDumpNodeSwitches 40 20
export BotRecordNodeSwitch
proc BotRecordNodeSwitch 40 32
line 75
;69:
;70:/*
;71:==================
;72:BotRecordNodeSwitch
;73:==================
;74:*/
;75:void BotRecordNodeSwitch(bot_state_t *bs, char *node, char *str, char *s) {
line 78
;76:	char netname[MAX_NETNAME];
;77:
;78:	ClientName(bs->client, netname, sizeof(netname));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 79
;79:	Com_sprintf(nodeswitch[numnodeswitches], 144, "%s at %2.1f entered %s: %s from %s\n", netname, FloatTime(), node, str, s);
ADDRGP4 numnodeswitches
INDIRI4
CNSTI4 144
MULI4
ADDRGP4 nodeswitch
ADDP4
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 $66
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 floattime
INDIRF4
ARGF4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 85
;80:#ifdef DEBUG
;81:	if (0) {
;82:		BotAI_Print( PRT_MESSAGE, "%s", nodeswitch[numnodeswitches] );
;83:	}
;84:#endif //DEBUG
;85:	numnodeswitches++;
ADDRLP4 36
ADDRGP4 numnodeswitches
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 86
;86:}
LABELV $65
endproc BotRecordNodeSwitch 40 32
data
align 4
LABELV $68
byte 4 3245342720
byte 4 3245342720
byte 4 3221225472
align 4
LABELV $69
byte 4 1097859072
byte 4 1097859072
byte 4 1073741824
export BotGetAirGoal
code
proc BotGetAirGoal 140 28
line 93
;87:
;88:/*
;89:==================
;90:BotGetAirGoal
;91:==================
;92:*/
;93:int BotGetAirGoal(bot_state_t *bs, bot_goal_t *goal) {
line 95
;94:	bsp_trace_t bsptrace;
;95:	vec3_t end, mins = {-15, -15, -2}, maxs = {15, 15, 2};
ADDRLP4 96
ADDRGP4 $68
INDIRB
ASGNB 12
ADDRLP4 108
ADDRGP4 $69
INDIRB
ASGNB 12
line 99
;96:	int areanum;
;97:
;98:	//trace up until we hit solid
;99:	VectorCopy(bs->origin, end);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 100
;100:	end[2] += 1000;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1148846080
ADDF4
ASGNF4
line 101
;101:	BotAI_Trace(&bsptrace, bs->origin, mins, maxs, end, bs->entitynum, CONTENTS_SOLID|CONTENTS_PLAYERCLIP);
ADDRLP4 12
ARGP4
ADDRLP4 124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 124
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 96
ARGP4
ADDRLP4 108
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 124
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 65537
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 103
;102:	//trace down until we hit water
;103:	VectorCopy(bsptrace.endpos, end);
ADDRLP4 0
ADDRLP4 12+12
INDIRB
ASGNB 12
line 104
;104:	BotAI_Trace(&bsptrace, end, mins, maxs, bs->origin, bs->entitynum, CONTENTS_WATER|CONTENTS_SLIME|CONTENTS_LAVA);
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 96
ARGP4
ADDRLP4 108
ARGP4
ADDRLP4 128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 128
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 128
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 106
;105:	//if we found the water surface
;106:	if (bsptrace.fraction > 0) {
ADDRLP4 12+8
INDIRF4
CNSTF4 0
LEF4 $72
line 107
;107:		areanum = BotPointAreaNum(bsptrace.endpos);
ADDRLP4 12+12
ARGP4
ADDRLP4 132
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 120
ADDRLP4 132
INDIRI4
ASGNI4
line 108
;108:		if (areanum) {
ADDRLP4 120
INDIRI4
CNSTI4 0
EQI4 $76
line 109
;109:			VectorCopy(bsptrace.endpos, goal->origin);
ADDRFP4 4
INDIRP4
ADDRLP4 12+12
INDIRB
ASGNB 12
line 110
;110:			goal->origin[2] -= 2;
ADDRLP4 136
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 136
INDIRP4
ADDRLP4 136
INDIRP4
INDIRF4
CNSTF4 1073741824
SUBF4
ASGNF4
line 111
;111:			goal->areanum = areanum;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 120
INDIRI4
ASGNI4
line 112
;112:			goal->mins[0] = -15;
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 3245342720
ASGNF4
line 113
;113:			goal->mins[1] = -15;
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 3245342720
ASGNF4
line 114
;114:			goal->mins[2] = -1;
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
CNSTF4 3212836864
ASGNF4
line 115
;115:			goal->maxs[0] = 15;
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
CNSTF4 1097859072
ASGNF4
line 116
;116:			goal->maxs[1] = 15;
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1097859072
ASGNF4
line 117
;117:			goal->maxs[2] = 1;
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1065353216
ASGNF4
line 118
;118:			goal->flags = GFL_AIR;
ADDRFP4 4
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 128
ASGNI4
line 119
;119:			goal->number = 0;
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 120
;120:			goal->iteminfo = 0;
ADDRFP4 4
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 121
;121:			goal->entitynum = 0;
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
CNSTI4 0
ASGNI4
line 122
;122:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $67
JUMPV
LABELV $76
line 124
;123:		}
;124:	}
LABELV $72
line 125
;125:	return qfalse;
CNSTI4 0
RETI4
LABELV $67
endproc BotGetAirGoal 140 28
export BotGoForAir
proc BotGoForAir 68 24
line 133
;126:}
;127:
;128:/*
;129:==================
;130:BotGoForAir
;131:==================
;132:*/
;133:int BotGoForAir(bot_state_t *bs, int tfl, bot_goal_t *ltg, float range) {
line 137
;134:	bot_goal_t goal;
;135:
;136:	//if the bot needs air
;137:	if (bs->lastair_time < FloatTime() - 6) {
ADDRFP4 0
INDIRP4
CNSTI4 6176
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1086324736
SUBF4
GEF4 $80
line 143
;138:		//
;139:#ifdef DEBUG
;140:		//BotAI_Print(PRT_MESSAGE, "going for air\n");
;141:#endif //DEBUG
;142:		//if we can find an air goal
;143:		if (BotGetAirGoal(bs, &goal)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 56
ADDRGP4 BotGetAirGoal
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $85
line 144
;144:			trap_BotPushGoal(bs->gs, &goal);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotPushGoal
CALLV
pop
line 145
;145:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $79
JUMPV
line 147
;146:		}
;147:		else {
LABELV $84
line 149
;148:			//get a nearby goal outside the water
;149:			while(trap_BotChooseNBGItem(bs->gs, bs->origin, bs->inventory, tfl, ltg, range)) {
line 150
;150:				trap_BotGetTopGoal(bs->gs, &goal);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotGetTopGoal
CALLI4
pop
line 152
;151:				//if the goal is not in water
;152:				if (!(trap_AAS_PointContents(goal.origin) & (CONTENTS_WATER|CONTENTS_SLIME|CONTENTS_LAVA))) {
ADDRLP4 0
ARGP4
ADDRLP4 60
ADDRGP4 trap_AAS_PointContents
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
NEI4 $87
line 153
;153:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $79
JUMPV
LABELV $87
line 155
;154:				}
;155:				trap_BotPopGoal(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotPopGoal
CALLV
pop
line 156
;156:			}
LABELV $85
line 149
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 4952
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 64
ADDRGP4 trap_BotChooseNBGItem
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $84
line 157
;157:			trap_BotResetAvoidGoals(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidGoals
CALLV
pop
line 158
;158:		}
line 159
;159:	}
LABELV $80
line 160
;160:	return qfalse;
CNSTI4 0
RETI4
LABELV $79
endproc BotGoForAir 68 24
export BotNearbyGoal
proc BotNearbyGoal 28 24
line 168
;161:}
;162:
;163:/*
;164:==================
;165:BotNearbyGoal
;166:==================
;167:*/
;168:int BotNearbyGoal(bot_state_t *bs, int tfl, bot_goal_t *ltg, float range) {
line 172
;169:	int ret;
;170:
;171:	//check if the bot should go for air
;172:	if (BotGoForAir(bs, tfl, ltg, range)) return qtrue;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 BotGoForAir
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $90
CNSTI4 1
RETI4
ADDRGP4 $89
JUMPV
LABELV $90
line 174
;173:	// if the bot is carrying a flag or cubes
;174:	if ( BotCTFCarryingFlag(bs) || Bot1FCTFCarryingFlag(bs) || BotHarvesterCarryingCubes(bs) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $95
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Bot1FCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $95
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 BotHarvesterCarryingCubes
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $92
LABELV $95
line 176
;175:		//if the bot is just a few secs away from the base 
;176:		if (trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin,
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 6636
ADDP4
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 24
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 300
GEI4 $96
line 177
;177:				bs->teamgoal.areanum, TFL_DEFAULT) < 300) {
line 179
;178:			//make the range really small
;179:			range = 50;
ADDRFP4 12
CNSTF4 1112014848
ASGNF4
line 180
;180:		}
LABELV $96
line 181
;181:	}
LABELV $92
line 183
;182:	//
;183:	ret = trap_BotChooseNBGItem(bs->gs, bs->origin, bs->inventory, tfl, ltg, range);
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 4952
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 trap_BotChooseNBGItem
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 24
INDIRI4
ASGNI4
line 194
;184:	/*
;185:	if (ret)
;186:	{
;187:		char buf[128];
;188:		//get the goal at the top of the stack
;189:		trap_BotGetTopGoal(bs->gs, &goal);
;190:		trap_BotGoalName(goal.number, buf, sizeof(buf));
;191:		BotAI_Print(PRT_MESSAGE, "%1.1f: new nearby goal %s\n", FloatTime(), buf);
;192:	}
;193:    */
;194:	return ret;
ADDRLP4 0
INDIRI4
RETI4
LABELV $89
endproc BotNearbyGoal 28 24
export BotReachedGoal
proc BotReachedGoal 36 16
line 202
;195:}
;196:
;197:/*
;198:==================
;199:BotReachedGoal
;200:==================
;201:*/
;202:int BotReachedGoal(bot_state_t *bs, bot_goal_t *goal) {
line 203
;203:	if (goal->flags & GFL_ITEM) {
ADDRFP4 4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $99
line 205
;204:		//if touching the goal
;205:		if (trap_BotTouchingGoal(bs->origin, goal)) {
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 trap_BotTouchingGoal
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $101
line 206
;206:			if (!(goal->flags & GFL_DROPPED)) {
ADDRFP4 4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
NEI4 $103
line 207
;207:				trap_BotSetAvoidGoalTime(bs->gs, goal->number, -1);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
ADDRGP4 trap_BotSetAvoidGoalTime
CALLV
pop
line 208
;208:			}
LABELV $103
line 209
;209:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $98
JUMPV
LABELV $101
line 212
;210:		}
;211:		//if the goal isn't there
;212:		if (trap_BotItemGoalInVisButNotVisible(bs->entitynum, bs->eye, bs->viewangles, goal)) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 trap_BotItemGoalInVisButNotVisible
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $105
line 224
;213:			/*
;214:			float avoidtime;
;215:			int t;
;216:
;217:			avoidtime = trap_BotAvoidGoalTime(bs->gs, goal->number);
;218:			if (avoidtime > 0) {
;219:				t = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, goal->areanum, bs->tfl);
;220:				if ((float) t * 0.009 < avoidtime)
;221:					return qtrue;
;222:			}
;223:			*/
;224:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $98
JUMPV
LABELV $105
line 227
;225:		}
;226:		//if in the goal area and below or above the goal and not swimming
;227:		if (bs->areanum == goal->areanum) {
ADDRFP4 0
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
NEI4 $100
line 228
;228:			if (bs->origin[0] > goal->origin[0] + goal->mins[0] && bs->origin[0] < goal->origin[0] + goal->maxs[0]) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 16
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDF4
LEF4 $100
ADDRLP4 12
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDF4
GEF4 $100
line 229
;229:				if (bs->origin[1] > goal->origin[1] + goal->mins[1] && bs->origin[1] < goal->origin[1] + goal->maxs[1]) {
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDF4
LEF4 $100
ADDRLP4 24
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDF4
GEF4 $100
line 230
;230:					if (!trap_AAS_Swimming(bs->origin)) {
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 32
ADDRGP4 trap_AAS_Swimming
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $100
line 231
;231:						return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $98
JUMPV
line 233
;232:					}
;233:				}
line 234
;234:			}
line 235
;235:		}
line 236
;236:	}
LABELV $99
line 237
;237:	else if (goal->flags & GFL_AIR) {
ADDRFP4 4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $115
line 239
;238:		//if touching the goal
;239:		if (trap_BotTouchingGoal(bs->origin, goal)) return qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 trap_BotTouchingGoal
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $117
CNSTI4 1
RETI4
ADDRGP4 $98
JUMPV
LABELV $117
line 241
;240:		//if the bot got air
;241:		if (bs->lastair_time > FloatTime() - 1) return qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6176
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
SUBF4
LEF4 $116
CNSTI4 1
RETI4
ADDRGP4 $98
JUMPV
line 242
;242:	}
LABELV $115
line 243
;243:	else {
line 245
;244:		//if touching the goal
;245:		if (trap_BotTouchingGoal(bs->origin, goal)) return qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 trap_BotTouchingGoal
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $121
CNSTI4 1
RETI4
ADDRGP4 $98
JUMPV
LABELV $121
line 246
;246:	}
LABELV $116
LABELV $100
line 247
;247:	return qfalse;
CNSTI4 0
RETI4
LABELV $98
endproc BotReachedGoal 36 16
export BotGetItemLongTermGoal
proc BotGetItemLongTermGoal 20 16
line 255
;248:}
;249:
;250:/*
;251:==================
;252:BotGetItemLongTermGoal
;253:==================
;254:*/
;255:int BotGetItemLongTermGoal(bot_state_t *bs, int tfl, bot_goal_t *goal) {
line 257
;256:	//if the bot has no goal
;257:	if (!trap_BotGetTopGoal(bs->gs, goal)) {
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 trap_BotGetTopGoal
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $124
line 259
;258:		//BotAI_Print(PRT_MESSAGE, "no ltg on stack\n");
;259:		bs->ltg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6068
ADDP4
CNSTF4 0
ASGNF4
line 260
;260:	}
ADDRGP4 $125
JUMPV
LABELV $124
line 262
;261:	//if the bot touches the current goal
;262:	else if (BotReachedGoal(bs, goal)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 BotReachedGoal
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $126
line 263
;263:		BotChooseWeapon(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotChooseWeapon
CALLV
pop
line 264
;264:		bs->ltg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6068
ADDP4
CNSTF4 0
ASGNF4
line 265
;265:	}
LABELV $126
LABELV $125
line 267
;266:	//if it is time to find a new long term goal
;267:	if (bs->ltg_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6068
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $128
line 269
;268:		//pop the current goal from the stack
;269:		trap_BotPopGoal(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotPopGoal
CALLV
pop
line 273
;270:		//BotAI_Print(PRT_MESSAGE, "%s: choosing new ltg\n", ClientName(bs->client, netname, sizeof(netname)));
;271:		//choose a new goal
;272:		//BotAI_Print(PRT_MESSAGE, "%6.1f client %d: BotChooseLTGItem\n", FloatTime(), bs->client);
;273:		if (trap_BotChooseLTGItem(bs->gs, bs->origin, bs->inventory, tfl)) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 4952
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 trap_BotChooseLTGItem
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $130
line 281
;274:			/*
;275:			char buf[128];
;276:			//get the goal at the top of the stack
;277:			trap_BotGetTopGoal(bs->gs, goal);
;278:			trap_BotGoalName(goal->number, buf, sizeof(buf));
;279:			BotAI_Print(PRT_MESSAGE, "%1.1f: new long term goal %s\n", FloatTime(), buf);
;280:            */
;281:			bs->ltg_time = FloatTime() + 20;
ADDRFP4 0
INDIRP4
CNSTI4 6068
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1101004800
ADDF4
ASGNF4
line 282
;282:		}
ADDRGP4 $131
JUMPV
LABELV $130
line 283
;283:		else {//the bot gets sorta stuck with all the avoid timings, shouldn't happen though
line 292
;284:			//
;285:#ifdef DEBUG
;286:			char netname[128];
;287:
;288:			BotAI_Print(PRT_MESSAGE, "%s: no valid ltg (probably stuck)\n", ClientName(bs->client, netname, sizeof(netname)));
;289:#endif
;290:			//trap_BotDumpAvoidGoals(bs->gs);
;291:			//reset the avoid goals and the avoid reach
;292:			trap_BotResetAvoidGoals(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidGoals
CALLV
pop
line 293
;293:			trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 294
;294:		}
LABELV $131
line 296
;295:		//get the goal at the top of the stack
;296:		return trap_BotGetTopGoal(bs->gs, goal);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_BotGetTopGoal
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
RETI4
ADDRGP4 $123
JUMPV
LABELV $128
line 298
;297:	}
;298:	return qtrue;
CNSTI4 1
RETI4
LABELV $123
endproc BotGetItemLongTermGoal 20 16
export BotGetLongTermGoal
proc BotGetLongTermGoal 672 20
line 309
;299:}
;300:
;301:/*
;302:==================
;303:BotGetLongTermGoal
;304:
;305:we could also create a seperate AI node for every long term goal type
;306:however this saves us a lot of code
;307:==================
;308:*/
;309:int BotGetLongTermGoal(bot_state_t *bs, int tfl, int retreat, bot_goal_t *goal) {
line 318
;310:	vec3_t target, dir, dir2;
;311:	char netname[MAX_NETNAME];
;312:	char buf[MAX_MESSAGE_SIZE];
;313:	int areanum;
;314:	float croucher;
;315:	aas_entityinfo_t entinfo, botinfo;
;316:	bot_waypoint_t *wp;
;317:
;318:	if (bs->ltgtype == LTG_TEAMHELP && !retreat) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 1
NEI4 $133
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $133
line 320
;319:		//check for bot typing status message
;320:		if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
ADDRLP4 620
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 620
INDIRP4
CNSTI4 6740
ADDP4
INDIRF4
CNSTF4 0
EQF4 $135
ADDRLP4 620
INDIRP4
CNSTI4 6740
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $135
line 321
;321:			BotAI_BotInitialChat(bs, "help_start", EasyClientName(bs->teammate, netname, sizeof(netname)), NULL);
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 412
ARGP4
CNSTI4 36
ARGI4
ADDRLP4 624
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $137
ARGP4
ADDRLP4 624
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 322
;322:			trap_BotEnterChat(bs->cs, bs->decisionmaker, CHAT_TELL);
ADDRLP4 628
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 628
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 628
INDIRP4
CNSTI4 6608
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 323
;323:			trap_EA_Action(bs->client, ACTION_AFFIRMATIVE);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1048576
ARGI4
ADDRGP4 trap_EA_Action
CALLV
pop
line 324
;324:			bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 325
;325:		}
LABELV $135
line 327
;326:		//if trying to help the team mate for more than a minute
;327:		if (bs->teamgoal_time < FloatTime())
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $138
line 328
;328:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
LABELV $138
line 330
;329:		//if the team mate IS visible for quite some time
;330:		if (bs->teammatevisible_time < FloatTime() - 10) bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6748
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1092616192
SUBF4
GEF4 $140
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
LABELV $140
line 332
;331:		//get entity information of the companion
;332:		BotEntityInfo(bs->teammate, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 272
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 334
;333:		//if the team mate is visible
;334:		if (BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, bs->teammate)) {
ADDRLP4 624
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 624
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 624
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 624
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 624
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 628
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 628
INDIRF4
CNSTF4 0
EQF4 $142
line 336
;335:			//if close just stand still there
;336:			VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 632
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 260
ADDRLP4 272+24
INDIRF4
ADDRLP4 632
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 260+4
ADDRLP4 272+24+4
INDIRF4
ADDRLP4 632
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 260+8
ADDRLP4 272+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 337
;337:			if (VectorLengthSquared(dir) < Square(100)) {
ADDRLP4 260
ARGP4
ADDRLP4 636
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 636
INDIRF4
CNSTF4 1176256512
GEF4 $143
line 338
;338:				trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 339
;339:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $132
JUMPV
line 341
;340:			}
;341:		}
LABELV $142
line 342
;342:		else {
line 344
;343:			//last time the bot was NOT visible
;344:			bs->teammatevisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6748
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 345
;345:		}
LABELV $143
line 347
;346:		//if the entity information is valid (entity in PVS)
;347:		if (entinfo.valid) {
ADDRLP4 272
INDIRI4
CNSTI4 0
EQI4 $153
line 348
;348:			areanum = BotPointAreaNum(entinfo.origin);
ADDRLP4 272+24
ARGP4
ADDRLP4 632
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 448
ADDRLP4 632
INDIRI4
ASGNI4
line 349
;349:			if (areanum && trap_AAS_AreaReachability(areanum)) {
ADDRLP4 636
ADDRLP4 448
INDIRI4
ASGNI4
ADDRLP4 636
INDIRI4
CNSTI4 0
EQI4 $156
ADDRLP4 636
INDIRI4
ARGI4
ADDRLP4 640
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 640
INDIRI4
CNSTI4 0
EQI4 $156
line 351
;350:				//update team goal
;351:				bs->teamgoal.entitynum = bs->teammate;
ADDRLP4 644
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 644
INDIRP4
CNSTI4 6664
ADDP4
ADDRLP4 644
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ASGNI4
line 352
;352:				bs->teamgoal.areanum = areanum;
ADDRFP4 0
INDIRP4
CNSTI4 6636
ADDP4
ADDRLP4 448
INDIRI4
ASGNI4
line 353
;353:				VectorCopy(entinfo.origin, bs->teamgoal.origin);
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ADDRLP4 272+24
INDIRB
ASGNB 12
line 354
;354:				VectorSet(bs->teamgoal.mins, -8, -8, -8);
ADDRFP4 0
INDIRP4
CNSTI4 6640
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6644
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6648
ADDP4
CNSTF4 3238002688
ASGNF4
line 355
;355:				VectorSet(bs->teamgoal.maxs, 8, 8, 8);
ADDRFP4 0
INDIRP4
CNSTI4 6652
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6656
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6660
ADDP4
CNSTF4 1090519040
ASGNF4
line 356
;356:			}
LABELV $156
line 357
;357:		}
LABELV $153
line 358
;358:		memcpy(goal, &bs->teamgoal, sizeof(bot_goal_t));
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 359
;359:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $132
JUMPV
LABELV $133
line 362
;360:	}
;361:	//if the bot accompanies someone
;362:	if (bs->ltgtype == LTG_TEAMACCOMPANY && !retreat) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 2
NEI4 $159
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $159
line 364
;363:		//check for bot typing status message
;364:		if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
ADDRLP4 620
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 620
INDIRP4
CNSTI4 6740
ADDP4
INDIRF4
CNSTF4 0
EQF4 $161
ADDRLP4 620
INDIRP4
CNSTI4 6740
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $161
line 365
;365:			BotAI_BotInitialChat(bs, "accompany_start", EasyClientName(bs->teammate, netname, sizeof(netname)), NULL);
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 412
ARGP4
CNSTI4 36
ARGI4
ADDRLP4 624
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $163
ARGP4
ADDRLP4 624
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 366
;366:			trap_BotEnterChat(bs->cs, bs->decisionmaker, CHAT_TELL);
ADDRLP4 628
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 628
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 628
INDIRP4
CNSTI4 6608
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 367
;367:			trap_EA_Action(bs->client, ACTION_AFFIRMATIVE);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1048576
ARGI4
ADDRGP4 trap_EA_Action
CALLV
pop
line 368
;368:			bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 369
;369:		}
LABELV $161
line 371
;370:		//if accompanying the companion for 3 minutes
;371:		if (bs->teamgoal_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $164
line 372
;372:			BotAI_BotInitialChat(bs, "accompany_stop", EasyClientName(bs->teammate, netname, sizeof(netname)), NULL);
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 412
ARGP4
CNSTI4 36
ARGI4
ADDRLP4 624
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $166
ARGP4
ADDRLP4 624
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 373
;373:			trap_BotEnterChat(bs->cs, bs->teammate, CHAT_TELL);
ADDRLP4 628
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 628
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 628
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 374
;374:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 375
;375:		}
LABELV $164
line 377
;376:		//get entity information of the companion
;377:		BotEntityInfo(bs->teammate, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 272
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 379
;378:		//if the companion is visible
;379:		if (BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, bs->teammate)) {
ADDRLP4 624
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 624
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 624
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 624
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 624
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 628
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 628
INDIRF4
CNSTF4 0
EQF4 $167
line 381
;380:			//update visible time
;381:			bs->teammatevisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6748
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 382
;382:			VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 632
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 260
ADDRLP4 272+24
INDIRF4
ADDRLP4 632
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 260+4
ADDRLP4 272+24+4
INDIRF4
ADDRLP4 632
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 260+8
ADDRLP4 272+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 383
;383:			if (VectorLengthSquared(dir) < Square(bs->formation_dist)) {
ADDRLP4 260
ARGP4
ADDRLP4 636
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 640
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 636
INDIRF4
ADDRLP4 640
INDIRP4
CNSTI4 7016
ADDP4
INDIRF4
ADDRLP4 640
INDIRP4
CNSTI4 7016
ADDP4
INDIRF4
MULF4
GEF4 $176
line 387
;384:				//
;385:				// if the client being followed bumps into this bot then
;386:				// the bot should back up
;387:				BotEntityInfo(bs->entitynum, &botinfo);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 452
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 389
;388:				// if the followed client is not standing ontop of the bot
;389:				if (botinfo.origin[2] + botinfo.maxs[2] > entinfo.origin[2] + entinfo.mins[2]) {
ADDRLP4 452+24+8
INDIRF4
ADDRLP4 452+84+8
INDIRF4
ADDF4
ADDRLP4 272+24+8
INDIRF4
ADDRLP4 272+72+8
INDIRF4
ADDF4
LEF4 $178
line 391
;390:					// if the bounding boxes touch each other
;391:					if (botinfo.origin[0] + botinfo.maxs[0] > entinfo.origin[0] + entinfo.mins[0] - 4&&
ADDRLP4 452+24
INDIRF4
ADDRLP4 452+84
INDIRF4
ADDF4
ADDRLP4 272+24
INDIRF4
ADDRLP4 272+72
INDIRF4
ADDF4
CNSTF4 1082130432
SUBF4
LEF4 $188
ADDRLP4 452+24
INDIRF4
ADDRLP4 452+72
INDIRF4
ADDF4
ADDRLP4 272+24
INDIRF4
ADDRLP4 272+84
INDIRF4
ADDF4
CNSTF4 1082130432
ADDF4
GEF4 $188
line 392
;392:						botinfo.origin[0] + botinfo.mins[0] < entinfo.origin[0] + entinfo.maxs[0] + 4) {
line 393
;393:						if (botinfo.origin[1] + botinfo.maxs[1] > entinfo.origin[1] + entinfo.mins[1] - 4 &&
ADDRLP4 452+24+4
INDIRF4
ADDRLP4 452+84+4
INDIRF4
ADDF4
ADDRLP4 272+24+4
INDIRF4
ADDRLP4 272+72+4
INDIRF4
ADDF4
CNSTF4 1082130432
SUBF4
LEF4 $198
ADDRLP4 452+24+4
INDIRF4
ADDRLP4 452+72+4
INDIRF4
ADDF4
ADDRLP4 272+24+4
INDIRF4
ADDRLP4 272+84+4
INDIRF4
ADDF4
CNSTF4 1082130432
ADDF4
GEF4 $198
line 394
;394:							botinfo.origin[1] + botinfo.mins[1] < entinfo.origin[1] + entinfo.maxs[1] + 4) {
line 395
;395:							if (botinfo.origin[2] + botinfo.maxs[2] > entinfo.origin[2] + entinfo.mins[2] - 4 &&
ADDRLP4 452+24+8
INDIRF4
ADDRLP4 452+84+8
INDIRF4
ADDF4
ADDRLP4 272+24+8
INDIRF4
ADDRLP4 272+72+8
INDIRF4
ADDF4
CNSTF4 1082130432
SUBF4
LEF4 $216
ADDRLP4 452+24+8
INDIRF4
ADDRLP4 452+72+8
INDIRF4
ADDF4
ADDRLP4 272+24+8
INDIRF4
ADDRLP4 272+84+8
INDIRF4
ADDF4
CNSTF4 1082130432
ADDF4
GEF4 $216
line 396
;396:								botinfo.origin[2] + botinfo.mins[2] < entinfo.origin[2] + entinfo.maxs[2] + 4) {
line 398
;397:								// if the followed client looks in the direction of this bot
;398:								AngleVectors(entinfo.angles, dir, NULL, NULL);
ADDRLP4 272+36
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 399
;399:								dir[2] = 0;
ADDRLP4 260+8
CNSTF4 0
ASGNF4
line 400
;400:								VectorNormalize(dir);
ADDRLP4 260
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 402
;401:								//VectorSubtract(entinfo.origin, entinfo.lastvisorigin, dir);
;402:								VectorSubtract(bs->origin, entinfo.origin, dir2);
ADDRLP4 644
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 608
ADDRLP4 644
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRLP4 272+24
INDIRF4
SUBF4
ASGNF4
ADDRLP4 608+4
ADDRLP4 644
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRLP4 272+24+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 608+8
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
ADDRLP4 272+24+8
INDIRF4
SUBF4
ASGNF4
line 403
;403:								VectorNormalize(dir2);
ADDRLP4 608
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 404
;404:								if (DotProduct(dir, dir2) > 0.7) {
ADDRLP4 260
INDIRF4
ADDRLP4 608
INDIRF4
MULF4
ADDRLP4 260+4
INDIRF4
ADDRLP4 608+4
INDIRF4
MULF4
ADDF4
ADDRLP4 260+8
INDIRF4
ADDRLP4 608+8
INDIRF4
MULF4
ADDF4
CNSTF4 1060320051
LEF4 $243
line 406
;405:									// back up
;406:									BotSetupForMovement(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetupForMovement
CALLV
pop
line 407
;407:									trap_BotMoveInDirection(bs->ms, dir2, 400, MOVE_WALK);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 608
ARGP4
CNSTF4 1137180672
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotMoveInDirection
CALLI4
pop
line 408
;408:								}
LABELV $243
line 409
;409:							}
LABELV $216
line 410
;410:						}
LABELV $198
line 411
;411:					}
LABELV $188
line 412
;412:				}
LABELV $178
line 415
;413:				//check if the bot wants to crouch
;414:				//don't crouch if crouched less than 5 seconds ago
;415:				if (bs->attackcrouch_time < FloatTime() - 5) {
ADDRFP4 0
INDIRP4
CNSTI4 6120
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
SUBF4
GEF4 $249
line 416
;416:					croucher = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CROUCHER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 36
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 644
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 604
ADDRLP4 644
INDIRF4
ASGNF4
line 417
;417:					if (random() < bs->thinktime * croucher) {
ADDRLP4 648
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 648
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 4904
ADDP4
INDIRF4
ADDRLP4 604
INDIRF4
MULF4
GEF4 $251
line 418
;418:						bs->attackcrouch_time = FloatTime() + 5 + croucher * 15;
ADDRFP4 0
INDIRP4
CNSTI4 6120
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
ADDRLP4 604
INDIRF4
CNSTF4 1097859072
MULF4
ADDF4
ASGNF4
line 419
;419:					}
LABELV $251
line 420
;420:				}
LABELV $249
line 422
;421:				//don't crouch when swimming
;422:				if (trap_AAS_Swimming(bs->origin)) bs->attackcrouch_time = FloatTime() - 1;
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 644
ADDRGP4 trap_AAS_Swimming
CALLI4
ASGNI4
ADDRLP4 644
INDIRI4
CNSTI4 0
EQI4 $253
ADDRFP4 0
INDIRP4
CNSTI4 6120
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
SUBF4
ASGNF4
LABELV $253
line 424
;423:				//if not arrived yet or arived some time ago
;424:				if (bs->arrive_time < FloatTime() - 2) {
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
SUBF4
GEF4 $255
line 426
;425:					//if not arrived yet
;426:					if (!bs->arrive_time) {
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
INDIRF4
CNSTF4 0
NEF4 $257
line 427
;427:						trap_EA_Gesture(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Gesture
CALLV
pop
line 428
;428:						BotAI_BotInitialChat(bs, "accompany_arrive", EasyClientName(bs->teammate, netname, sizeof(netname)), NULL);
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 412
ARGP4
CNSTI4 36
ARGI4
ADDRLP4 648
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $259
ARGP4
ADDRLP4 648
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 429
;429:						trap_BotEnterChat(bs->cs, bs->teammate, CHAT_TELL);
ADDRLP4 652
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 652
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 652
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 430
;430:						bs->arrive_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 431
;431:					}
ADDRGP4 $258
JUMPV
LABELV $257
line 433
;432:					//if the bot wants to crouch
;433:					else if (bs->attackcrouch_time > FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6120
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $260
line 434
;434:						trap_EA_Crouch(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Crouch
CALLV
pop
line 435
;435:					}
ADDRGP4 $261
JUMPV
LABELV $260
line 437
;436:					//else do some model taunts
;437:					else if (random() < bs->thinktime * 0.05) {
ADDRLP4 648
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 648
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 4904
ADDP4
INDIRF4
CNSTF4 1028443341
MULF4
GEF4 $262
line 439
;438:						//do a gesture :)
;439:						trap_EA_Gesture(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Gesture
CALLV
pop
line 440
;440:					}
LABELV $262
LABELV $261
LABELV $258
line 441
;441:				}
LABELV $255
line 443
;442:				//if just arrived look at the companion
;443:				if (bs->arrive_time > FloatTime() - 2) {
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
SUBF4
LEF4 $264
line 444
;444:					VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 648
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 260
ADDRLP4 272+24
INDIRF4
ADDRLP4 648
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 260+4
ADDRLP4 272+24+4
INDIRF4
ADDRLP4 648
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 260+8
ADDRLP4 272+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 445
;445:					vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 260
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 446
;446:					bs->ideal_viewangles[2] *= 0.5;
ADDRLP4 652
ADDRFP4 0
INDIRP4
CNSTI4 6584
ADDP4
ASGNP4
ADDRLP4 652
INDIRP4
ADDRLP4 652
INDIRP4
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 447
;447:				}
ADDRGP4 $265
JUMPV
LABELV $264
line 449
;448:				//else look strategically around for enemies
;449:				else if (random() < bs->thinktime * 0.8) {
ADDRLP4 648
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 648
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 4904
ADDP4
INDIRF4
CNSTF4 1061997773
MULF4
GEF4 $273
line 450
;450:					BotRoamGoal(bs, target);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 592
ARGP4
ADDRGP4 BotRoamGoal
CALLV
pop
line 451
;451:					VectorSubtract(target, bs->origin, dir);
ADDRLP4 652
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 260
ADDRLP4 592
INDIRF4
ADDRLP4 652
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 260+4
ADDRLP4 592+4
INDIRF4
ADDRLP4 652
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 260+8
ADDRLP4 592+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 452
;452:					vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 260
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 453
;453:					bs->ideal_viewangles[2] *= 0.5;
ADDRLP4 656
ADDRFP4 0
INDIRP4
CNSTI4 6584
ADDP4
ASGNP4
ADDRLP4 656
INDIRP4
ADDRLP4 656
INDIRP4
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 454
;454:				}
LABELV $273
LABELV $265
line 456
;455:				//check if the bot wants to go for air
;456:				if (BotGoForAir(bs, bs->tfl, &bs->teamgoal, 400)) {
ADDRLP4 652
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 652
INDIRP4
ARGP4
ADDRLP4 652
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
ADDRLP4 652
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
CNSTF4 1137180672
ARGF4
ADDRLP4 656
ADDRGP4 BotGoForAir
CALLI4
ASGNI4
ADDRLP4 656
INDIRI4
CNSTI4 0
EQI4 $279
line 457
;457:					trap_BotResetLastAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetLastAvoidReach
CALLV
pop
line 463
;458:					//get the goal at the top of the stack
;459:					//trap_BotGetTopGoal(bs->gs, &tmpgoal);
;460:					//trap_BotGoalName(tmpgoal.number, buf, 144);
;461:					//BotAI_Print(PRT_MESSAGE, "new nearby goal %s\n", buf);
;462:					//time the bot gets to pick up the nearby goal item
;463:					bs->nbg_time = FloatTime() + 8;
ADDRFP4 0
INDIRP4
CNSTI4 6072
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 464
;464:					AIEnter_Seek_NBG(bs, "BotLongTermGoal: go for air");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $281
ARGP4
ADDRGP4 AIEnter_Seek_NBG
CALLV
pop
line 465
;465:					return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $132
JUMPV
LABELV $279
line 468
;466:				}
;467:				//
;468:				trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 469
;469:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $132
JUMPV
LABELV $176
line 471
;470:			}
;471:		}
LABELV $167
line 473
;472:		//if the entity information is valid (entity in PVS)
;473:		if (entinfo.valid) {
ADDRLP4 272
INDIRI4
CNSTI4 0
EQI4 $282
line 474
;474:			areanum = BotPointAreaNum(entinfo.origin);
ADDRLP4 272+24
ARGP4
ADDRLP4 632
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 448
ADDRLP4 632
INDIRI4
ASGNI4
line 475
;475:			if (areanum && trap_AAS_AreaReachability(areanum)) {
ADDRLP4 636
ADDRLP4 448
INDIRI4
ASGNI4
ADDRLP4 636
INDIRI4
CNSTI4 0
EQI4 $285
ADDRLP4 636
INDIRI4
ARGI4
ADDRLP4 640
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 640
INDIRI4
CNSTI4 0
EQI4 $285
line 477
;476:				//update team goal
;477:				bs->teamgoal.entitynum = bs->teammate;
ADDRLP4 644
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 644
INDIRP4
CNSTI4 6664
ADDP4
ADDRLP4 644
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ASGNI4
line 478
;478:				bs->teamgoal.areanum = areanum;
ADDRFP4 0
INDIRP4
CNSTI4 6636
ADDP4
ADDRLP4 448
INDIRI4
ASGNI4
line 479
;479:				VectorCopy(entinfo.origin, bs->teamgoal.origin);
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ADDRLP4 272+24
INDIRB
ASGNB 12
line 480
;480:				VectorSet(bs->teamgoal.mins, -8, -8, -8);
ADDRFP4 0
INDIRP4
CNSTI4 6640
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6644
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6648
ADDP4
CNSTF4 3238002688
ASGNF4
line 481
;481:				VectorSet(bs->teamgoal.maxs, 8, 8, 8);
ADDRFP4 0
INDIRP4
CNSTI4 6652
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6656
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6660
ADDP4
CNSTF4 1090519040
ASGNF4
line 482
;482:			}
LABELV $285
line 483
;483:		}
LABELV $282
line 485
;484:		//the goal the bot should go for
;485:		memcpy(goal, &bs->teamgoal, sizeof(bot_goal_t));
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 487
;486:		//if the companion is NOT visible for too long
;487:		if (bs->teammatevisible_time < FloatTime() - 60) {
ADDRFP4 0
INDIRP4
CNSTI4 6748
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1114636288
SUBF4
GEF4 $288
line 488
;488:			BotAI_BotInitialChat(bs, "accompany_cannotfind", EasyClientName(bs->teammate, netname, sizeof(netname)), NULL);
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 412
ARGP4
CNSTI4 36
ARGI4
ADDRLP4 632
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $290
ARGP4
ADDRLP4 632
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 489
;489:			trap_BotEnterChat(bs->cs, bs->teammate, CHAT_TELL);
ADDRLP4 636
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 636
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 636
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 490
;490:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 492
;491:			// just to make sure the bot won't spam this message
;492:			bs->teammatevisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6748
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 493
;493:		}
LABELV $288
line 494
;494:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $132
JUMPV
LABELV $159
line 497
;495:	}
;496:	//
;497:	if (bs->ltgtype == LTG_DEFENDKEYAREA) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 3
NEI4 $291
line 498
;498:		if (trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin,
ADDRLP4 620
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 620
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 620
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 620
INDIRP4
CNSTI4 6636
ADDP4
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 624
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 624
INDIRI4
CVIF4 4
ADDRFP4 0
INDIRP4
CNSTI4 6148
ADDP4
INDIRF4
LEF4 $293
line 499
;499:				bs->teamgoal.areanum, TFL_DEFAULT) > bs->defendaway_range) {
line 500
;500:			bs->defendaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6144
ADDP4
CNSTF4 0
ASGNF4
line 501
;501:		}
LABELV $293
line 502
;502:	}
LABELV $291
line 504
;503:	//if defending a key area
;504:	if (bs->ltgtype == LTG_DEFENDKEYAREA && !retreat &&
ADDRLP4 620
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 620
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 3
NEI4 $295
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $295
ADDRLP4 620
INDIRP4
CNSTI4 6144
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $295
line 505
;505:				bs->defendaway_time < FloatTime()) {
line 507
;506:		//check for bot typing status message
;507:		if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
ADDRLP4 624
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 624
INDIRP4
CNSTI4 6740
ADDP4
INDIRF4
CNSTF4 0
EQF4 $297
ADDRLP4 624
INDIRP4
CNSTI4 6740
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $297
line 508
;508:			trap_BotGoalName(bs->teamgoal.number, buf, sizeof(buf));
ADDRFP4 0
INDIRP4
CNSTI4 6668
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 509
;509:			BotAI_BotInitialChat(bs, "defend_start", buf, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $299
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 510
;510:			trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 511
;511:			bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 512
;512:		}
LABELV $297
line 514
;513:		//set the bot goal
;514:		memcpy(goal, &bs->teamgoal, sizeof(bot_goal_t));
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 516
;515:		//stop after 2 minutes
;516:		if (bs->teamgoal_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $300
line 517
;517:			trap_BotGoalName(bs->teamgoal.number, buf, sizeof(buf));
ADDRFP4 0
INDIRP4
CNSTI4 6668
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 518
;518:			BotAI_BotInitialChat(bs, "defend_stop", buf, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $302
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 519
;519:			trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 520
;520:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 521
;521:		}
LABELV $300
line 523
;522:		//if very close... go away for some time
;523:		VectorSubtract(goal->origin, bs->origin, dir);
ADDRLP4 628
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 632
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 260
ADDRLP4 628
INDIRP4
INDIRF4
ADDRLP4 632
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 260+4
ADDRLP4 628
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 632
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 260+8
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 524
;524:		if (VectorLengthSquared(dir) < Square(70)) {
ADDRLP4 260
ARGP4
ADDRLP4 636
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 636
INDIRF4
CNSTF4 1167663104
GEF4 $305
line 525
;525:			trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 526
;526:			bs->defendaway_time = FloatTime() + 3 + 3 * random();
ADDRLP4 640
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6144
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1077936128
ADDF4
ADDRLP4 640
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1077936128
MULF4
ADDF4
ASGNF4
line 527
;527:			if (BotHasPersistantPowerupAndWeapon(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 644
ADDRGP4 BotHasPersistantPowerupAndWeapon
CALLI4
ASGNI4
ADDRLP4 644
INDIRI4
CNSTI4 0
EQI4 $307
line 528
;528:				bs->defendaway_range = 100;
ADDRFP4 0
INDIRP4
CNSTI4 6148
ADDP4
CNSTF4 1120403456
ASGNF4
line 529
;529:			}
ADDRGP4 $308
JUMPV
LABELV $307
line 530
;530:			else {
line 531
;531:				bs->defendaway_range = 350;
ADDRFP4 0
INDIRP4
CNSTI4 6148
ADDP4
CNSTF4 1135542272
ASGNF4
line 532
;532:			}
LABELV $308
line 533
;533:		}
LABELV $305
line 534
;534:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $132
JUMPV
LABELV $295
line 537
;535:	}
;536:	//going to kill someone
;537:	if (bs->ltgtype == LTG_KILL && !retreat) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 11
NEI4 $309
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $309
line 539
;538:		//check for bot typing status message
;539:		if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
ADDRLP4 624
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 624
INDIRP4
CNSTI4 6740
ADDP4
INDIRF4
CNSTF4 0
EQF4 $311
ADDRLP4 624
INDIRP4
CNSTI4 6740
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $311
line 540
;540:			EasyClientName(bs->teamgoal.entitynum, buf, sizeof(buf));
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 541
;541:			BotAI_BotInitialChat(bs, "kill_start", buf, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $313
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 542
;542:			trap_BotEnterChat(bs->cs, bs->decisionmaker, CHAT_TELL);
ADDRLP4 628
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 628
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 628
INDIRP4
CNSTI4 6608
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 543
;543:			bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 544
;544:		}
LABELV $311
line 546
;545:		//
;546:		if (bs->killedenemy_time > bs->teamgoal_time - TEAM_KILL_SOMEONE && bs->lastkilledplayer == bs->teamgoal.entitynum) {
ADDRLP4 628
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 628
INDIRP4
CNSTI4 6168
ADDP4
INDIRF4
ADDRLP4 628
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
CNSTF4 1127481344
SUBF4
LEF4 $314
ADDRLP4 628
INDIRP4
CNSTI4 5992
ADDP4
INDIRI4
ADDRLP4 628
INDIRP4
CNSTI4 6664
ADDP4
INDIRI4
NEI4 $314
line 547
;547:			EasyClientName(bs->teamgoal.entitynum, buf, sizeof(buf));
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 548
;548:			BotAI_BotInitialChat(bs, "kill_done", buf, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $316
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 549
;549:			trap_BotEnterChat(bs->cs, bs->decisionmaker, CHAT_TELL);
ADDRLP4 632
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 632
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 632
INDIRP4
CNSTI4 6608
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 550
;550:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 551
;551:		}
LABELV $314
line 553
;552:		//
;553:		if (bs->teamgoal_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $317
line 554
;554:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 555
;555:		}
LABELV $317
line 557
;556:		//just roam around
;557:		return BotGetItemLongTermGoal(bs, tfl, goal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 632
ADDRGP4 BotGetItemLongTermGoal
CALLI4
ASGNI4
ADDRLP4 632
INDIRI4
RETI4
ADDRGP4 $132
JUMPV
LABELV $309
line 560
;558:	}
;559:	//get an item
;560:	if (bs->ltgtype == LTG_GETITEM && !retreat) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 10
NEI4 $319
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $319
line 562
;561:		//check for bot typing status message
;562:		if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
ADDRLP4 624
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 624
INDIRP4
CNSTI4 6740
ADDP4
INDIRF4
CNSTF4 0
EQF4 $321
ADDRLP4 624
INDIRP4
CNSTI4 6740
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $321
line 563
;563:			trap_BotGoalName(bs->teamgoal.number, buf, sizeof(buf));
ADDRFP4 0
INDIRP4
CNSTI4 6668
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 564
;564:			BotAI_BotInitialChat(bs, "getitem_start", buf, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $323
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 565
;565:			trap_BotEnterChat(bs->cs, bs->decisionmaker, CHAT_TELL);
ADDRLP4 628
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 628
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 628
INDIRP4
CNSTI4 6608
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 566
;566:			trap_EA_Action(bs->client, ACTION_AFFIRMATIVE);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1048576
ARGI4
ADDRGP4 trap_EA_Action
CALLV
pop
line 567
;567:			bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 568
;568:		}
LABELV $321
line 570
;569:		//set the bot goal
;570:		memcpy(goal, &bs->teamgoal, sizeof(bot_goal_t));
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 572
;571:		//stop after some time
;572:		if (bs->teamgoal_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $324
line 573
;573:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 574
;574:		}
LABELV $324
line 576
;575:		//
;576:		if (trap_BotItemGoalInVisButNotVisible(bs->entitynum, bs->eye, bs->viewangles, goal)) {
ADDRLP4 628
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 628
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 628
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 628
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 632
ADDRGP4 trap_BotItemGoalInVisButNotVisible
CALLI4
ASGNI4
ADDRLP4 632
INDIRI4
CNSTI4 0
EQI4 $326
line 577
;577:			trap_BotGoalName(bs->teamgoal.number, buf, sizeof(buf));
ADDRFP4 0
INDIRP4
CNSTI4 6668
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 578
;578:			BotAI_BotInitialChat(bs, "getitem_notthere", buf, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $328
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 579
;579:			trap_BotEnterChat(bs->cs, bs->decisionmaker, CHAT_TELL);
ADDRLP4 636
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 636
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 636
INDIRP4
CNSTI4 6608
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 580
;580:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 581
;581:		}
ADDRGP4 $327
JUMPV
LABELV $326
line 582
;582:		else if (BotReachedGoal(bs, goal)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 636
ADDRGP4 BotReachedGoal
CALLI4
ASGNI4
ADDRLP4 636
INDIRI4
CNSTI4 0
EQI4 $329
line 583
;583:			trap_BotGoalName(bs->teamgoal.number, buf, sizeof(buf));
ADDRFP4 0
INDIRP4
CNSTI4 6668
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 584
;584:			BotAI_BotInitialChat(bs, "getitem_gotit", buf, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $331
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 585
;585:			trap_BotEnterChat(bs->cs, bs->decisionmaker, CHAT_TELL);
ADDRLP4 640
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 640
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 640
INDIRP4
CNSTI4 6608
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 586
;586:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 587
;587:		}
LABELV $329
LABELV $327
line 588
;588:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $132
JUMPV
LABELV $319
line 591
;589:	}
;590:	//if camping somewhere
;591:	if ((bs->ltgtype == LTG_CAMP || bs->ltgtype == LTG_CAMPORDER) && !retreat) {
ADDRLP4 624
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 624
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 7
EQI4 $334
ADDRLP4 624
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 8
NEI4 $332
LABELV $334
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $332
line 593
;592:		//check for bot typing status message
;593:		if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
ADDRLP4 628
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 628
INDIRP4
CNSTI4 6740
ADDP4
INDIRF4
CNSTF4 0
EQF4 $335
ADDRLP4 628
INDIRP4
CNSTI4 6740
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $335
line 594
;594:			if (bs->ltgtype == LTG_CAMPORDER) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 8
NEI4 $337
line 595
;595:				BotAI_BotInitialChat(bs, "camp_start", EasyClientName(bs->teammate, netname, sizeof(netname)), NULL);
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 412
ARGP4
CNSTI4 36
ARGI4
ADDRLP4 632
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $339
ARGP4
ADDRLP4 632
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 596
;596:				trap_BotEnterChat(bs->cs, bs->decisionmaker, CHAT_TELL);
ADDRLP4 636
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 636
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 636
INDIRP4
CNSTI4 6608
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 597
;597:				trap_EA_Action(bs->client, ACTION_AFFIRMATIVE);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1048576
ARGI4
ADDRGP4 trap_EA_Action
CALLV
pop
line 598
;598:			}
LABELV $337
line 599
;599:			bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 600
;600:		}
LABELV $335
line 602
;601:		//set the bot goal
;602:		memcpy(goal, &bs->teamgoal, sizeof(bot_goal_t));
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 604
;603:		//
;604:		if (bs->teamgoal_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $340
line 605
;605:			if (bs->ltgtype == LTG_CAMPORDER) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 8
NEI4 $342
line 606
;606:				BotAI_BotInitialChat(bs, "camp_stop", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $344
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 607
;607:				trap_BotEnterChat(bs->cs, bs->decisionmaker, CHAT_TELL);
ADDRLP4 632
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 632
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 632
INDIRP4
CNSTI4 6608
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 608
;608:			}
LABELV $342
line 609
;609:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 610
;610:		}
LABELV $340
line 612
;611:		//if really near the camp spot
;612:		VectorSubtract(goal->origin, bs->origin, dir);
ADDRLP4 632
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 636
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 260
ADDRLP4 632
INDIRP4
INDIRF4
ADDRLP4 636
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 260+4
ADDRLP4 632
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 636
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 260+8
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 613
;613:		if (VectorLengthSquared(dir) < Square(60))
ADDRLP4 260
ARGP4
ADDRLP4 640
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 640
INDIRF4
CNSTF4 1163984896
GEF4 $347
line 614
;614:		{
line 616
;615:			//if not arrived yet
;616:			if (!bs->arrive_time) {
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
INDIRF4
CNSTF4 0
NEF4 $349
line 617
;617:				if (bs->ltgtype == LTG_CAMPORDER) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 8
NEI4 $351
line 618
;618:					BotAI_BotInitialChat(bs, "camp_arrive", EasyClientName(bs->teammate, netname, sizeof(netname)), NULL);
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 412
ARGP4
CNSTI4 36
ARGI4
ADDRLP4 644
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $353
ARGP4
ADDRLP4 644
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 619
;619:					trap_BotEnterChat(bs->cs, bs->decisionmaker, CHAT_TELL);
ADDRLP4 648
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 648
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 648
INDIRP4
CNSTI4 6608
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 620
;620:				}
LABELV $351
line 621
;621:				bs->arrive_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 622
;622:			}
LABELV $349
line 624
;623:			//look strategically around for enemies
;624:			if (random() < bs->thinktime * 0.8) {
ADDRLP4 644
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 644
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 4904
ADDP4
INDIRF4
CNSTF4 1061997773
MULF4
GEF4 $354
line 625
;625:				BotRoamGoal(bs, target);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 592
ARGP4
ADDRGP4 BotRoamGoal
CALLV
pop
line 626
;626:				VectorSubtract(target, bs->origin, dir);
ADDRLP4 648
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 260
ADDRLP4 592
INDIRF4
ADDRLP4 648
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 260+4
ADDRLP4 592+4
INDIRF4
ADDRLP4 648
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 260+8
ADDRLP4 592+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 627
;627:				vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 260
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 628
;628:				bs->ideal_viewangles[2] *= 0.5;
ADDRLP4 652
ADDRFP4 0
INDIRP4
CNSTI4 6584
ADDP4
ASGNP4
ADDRLP4 652
INDIRP4
ADDRLP4 652
INDIRP4
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 629
;629:			}
LABELV $354
line 632
;630:			//check if the bot wants to crouch
;631:			//don't crouch if crouched less than 5 seconds ago
;632:			if (bs->attackcrouch_time < FloatTime() - 5) {
ADDRFP4 0
INDIRP4
CNSTI4 6120
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
SUBF4
GEF4 $360
line 633
;633:				croucher = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CROUCHER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 36
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 648
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 604
ADDRLP4 648
INDIRF4
ASGNF4
line 634
;634:				if (random() < bs->thinktime * croucher) {
ADDRLP4 652
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 652
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 4904
ADDP4
INDIRF4
ADDRLP4 604
INDIRF4
MULF4
GEF4 $362
line 635
;635:					bs->attackcrouch_time = FloatTime() + 5 + croucher * 15;
ADDRFP4 0
INDIRP4
CNSTI4 6120
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
ADDRLP4 604
INDIRF4
CNSTF4 1097859072
MULF4
ADDF4
ASGNF4
line 636
;636:				}
LABELV $362
line 637
;637:			}
LABELV $360
line 639
;638:			//if the bot wants to crouch
;639:			if (bs->attackcrouch_time > FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6120
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $364
line 640
;640:				trap_EA_Crouch(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Crouch
CALLV
pop
line 641
;641:			}
LABELV $364
line 643
;642:			//don't crouch when swimming
;643:			if (trap_AAS_Swimming(bs->origin)) bs->attackcrouch_time = FloatTime() - 1;
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 648
ADDRGP4 trap_AAS_Swimming
CALLI4
ASGNI4
ADDRLP4 648
INDIRI4
CNSTI4 0
EQI4 $366
ADDRFP4 0
INDIRP4
CNSTI4 6120
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
SUBF4
ASGNF4
LABELV $366
line 645
;644:			//make sure the bot is not gonna drown
;645:			if (trap_PointContents(bs->eye,bs->entitynum) & (CONTENTS_WATER|CONTENTS_SLIME|CONTENTS_LAVA)) {
ADDRLP4 652
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 652
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 652
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 656
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 656
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $368
line 646
;646:				if (bs->ltgtype == LTG_CAMPORDER) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 8
NEI4 $370
line 647
;647:					BotAI_BotInitialChat(bs, "camp_stop", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $344
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 648
;648:					trap_BotEnterChat(bs->cs, bs->decisionmaker, CHAT_TELL);
ADDRLP4 660
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 660
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 660
INDIRP4
CNSTI4 6608
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 650
;649:					//
;650:					if (bs->lastgoal_ltgtype == LTG_CAMPORDER) {
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
CNSTI4 8
NEI4 $372
line 651
;651:						bs->lastgoal_ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
CNSTI4 0
ASGNI4
line 652
;652:					}
LABELV $372
line 653
;653:				}
LABELV $370
line 654
;654:				bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 655
;655:			}
LABELV $368
line 659
;656:			//
;657:			//FIXME: move around a bit
;658:			//
;659:			trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 660
;660:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $132
JUMPV
LABELV $347
line 662
;661:		}
;662:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $132
JUMPV
LABELV $332
line 665
;663:	}
;664:	//patrolling along several waypoints
;665:	if (bs->ltgtype == LTG_PATROL && !retreat) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 9
NEI4 $374
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $374
line 667
;666:		//check for bot typing status message
;667:		if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
ADDRLP4 628
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 628
INDIRP4
CNSTI4 6740
ADDP4
INDIRF4
CNSTF4 0
EQF4 $376
ADDRLP4 628
INDIRP4
CNSTI4 6740
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $376
line 668
;668:			strcpy(buf, "");
ADDRLP4 4
ARGP4
ADDRGP4 $64
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 669
;669:			for (wp = bs->patrolpoints; wp; wp = wp->next) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 9080
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $381
JUMPV
LABELV $378
line 670
;670:				strcat(buf, wp->name);
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 671
;671:				if (wp->next) strcat(buf, " to ");
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $382
ADDRLP4 4
ARGP4
ADDRGP4 $384
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $382
line 672
;672:			}
LABELV $379
line 669
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
ASGNP4
LABELV $381
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $378
line 673
;673:			BotAI_BotInitialChat(bs, "patrol_start", buf, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $385
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 674
;674:			trap_BotEnterChat(bs->cs, bs->decisionmaker, CHAT_TELL);
ADDRLP4 632
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 632
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 632
INDIRP4
CNSTI4 6608
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 675
;675:			trap_EA_Action(bs->client, ACTION_AFFIRMATIVE);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1048576
ARGI4
ADDRGP4 trap_EA_Action
CALLV
pop
line 676
;676:			bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 677
;677:		}
LABELV $376
line 679
;678:		//
;679:		if (!bs->curpatrolpoint) {
ADDRFP4 0
INDIRP4
CNSTI4 9084
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $386
line 680
;680:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 681
;681:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $132
JUMPV
LABELV $386
line 684
;682:		}
;683:		//if the bot touches the current goal
;684:		if (trap_BotTouchingGoal(bs->origin, &bs->curpatrolpoint->goal)) {
ADDRLP4 632
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 632
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 632
INDIRP4
CNSTI4 9084
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRLP4 636
ADDRGP4 trap_BotTouchingGoal
CALLI4
ASGNI4
ADDRLP4 636
INDIRI4
CNSTI4 0
EQI4 $388
line 685
;685:			if (bs->patrolflags & PATROL_BACK) {
ADDRFP4 0
INDIRP4
CNSTI4 9088
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $390
line 686
;686:				if (bs->curpatrolpoint->prev) {
ADDRFP4 0
INDIRP4
CNSTI4 9084
ADDP4
INDIRP4
CNSTI4 96
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $392
line 687
;687:					bs->curpatrolpoint = bs->curpatrolpoint->prev;
ADDRLP4 640
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 640
INDIRP4
CNSTI4 9084
ADDP4
ADDRLP4 640
INDIRP4
CNSTI4 9084
ADDP4
INDIRP4
CNSTI4 96
ADDP4
INDIRP4
ASGNP4
line 688
;688:				}
ADDRGP4 $391
JUMPV
LABELV $392
line 689
;689:				else {
line 690
;690:					bs->curpatrolpoint = bs->curpatrolpoint->next;
ADDRLP4 640
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 640
INDIRP4
CNSTI4 9084
ADDP4
ADDRLP4 640
INDIRP4
CNSTI4 9084
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
ASGNP4
line 691
;691:					bs->patrolflags &= ~PATROL_BACK;
ADDRLP4 644
ADDRFP4 0
INDIRP4
CNSTI4 9088
ADDP4
ASGNP4
ADDRLP4 644
INDIRP4
ADDRLP4 644
INDIRP4
INDIRI4
CNSTI4 -5
BANDI4
ASGNI4
line 692
;692:				}
line 693
;693:			}
ADDRGP4 $391
JUMPV
LABELV $390
line 694
;694:			else {
line 695
;695:				if (bs->curpatrolpoint->next) {
ADDRFP4 0
INDIRP4
CNSTI4 9084
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $394
line 696
;696:					bs->curpatrolpoint = bs->curpatrolpoint->next;
ADDRLP4 640
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 640
INDIRP4
CNSTI4 9084
ADDP4
ADDRLP4 640
INDIRP4
CNSTI4 9084
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
ASGNP4
line 697
;697:				}
ADDRGP4 $395
JUMPV
LABELV $394
line 698
;698:				else {
line 699
;699:					bs->curpatrolpoint = bs->curpatrolpoint->prev;
ADDRLP4 640
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 640
INDIRP4
CNSTI4 9084
ADDP4
ADDRLP4 640
INDIRP4
CNSTI4 9084
ADDP4
INDIRP4
CNSTI4 96
ADDP4
INDIRP4
ASGNP4
line 700
;700:					bs->patrolflags |= PATROL_BACK;
ADDRLP4 644
ADDRFP4 0
INDIRP4
CNSTI4 9088
ADDP4
ASGNP4
ADDRLP4 644
INDIRP4
ADDRLP4 644
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 701
;701:				}
LABELV $395
line 702
;702:			}
LABELV $391
line 703
;703:		}
LABELV $388
line 705
;704:		//stop after 5 minutes
;705:		if (bs->teamgoal_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $396
line 706
;706:			BotAI_BotInitialChat(bs, "patrol_stop", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $398
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 707
;707:			trap_BotEnterChat(bs->cs, bs->decisionmaker, CHAT_TELL);
ADDRLP4 640
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 640
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 640
INDIRP4
CNSTI4 6608
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 708
;708:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 709
;709:		}
LABELV $396
line 710
;710:		if (!bs->curpatrolpoint) {
ADDRFP4 0
INDIRP4
CNSTI4 9084
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $399
line 711
;711:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 712
;712:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $132
JUMPV
LABELV $399
line 714
;713:		}
;714:		memcpy(goal, &bs->curpatrolpoint->goal, sizeof(bot_goal_t));
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 9084
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 715
;715:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $132
JUMPV
LABELV $374
line 718
;716:	}
;717:#ifdef CTF
;718:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $401
line 720
;719:		//if going for enemy flag
;720:		if (bs->ltgtype == LTG_GETFLAG) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 4
NEI4 $403
line 722
;721:			//check for bot typing status message
;722:			if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
ADDRLP4 628
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 628
INDIRP4
CNSTI4 6740
ADDP4
INDIRF4
CNSTF4 0
EQF4 $405
ADDRLP4 628
INDIRP4
CNSTI4 6740
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $405
line 723
;723:				BotAI_BotInitialChat(bs, "captureflag_start", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $407
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 724
;724:				trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 725
;725:				bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 726
;726:			}
LABELV $405
line 728
;727:			//
;728:			switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 636
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 632
ADDRLP4 636
INDIRI4
ASGNI4
ADDRLP4 632
INDIRI4
CNSTI4 1
EQI4 $411
ADDRLP4 632
INDIRI4
CNSTI4 2
EQI4 $412
ADDRGP4 $408
JUMPV
LABELV $411
line 729
;729:				case TEAM_RED: memcpy(goal, &ctf_blueflag, sizeof(bot_goal_t)); break;
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 ctf_blueflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $409
JUMPV
LABELV $412
line 730
;730:				case TEAM_BLUE: memcpy(goal, &ctf_redflag, sizeof(bot_goal_t)); break;
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 ctf_redflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $409
JUMPV
LABELV $408
line 731
;731:				default: bs->ltgtype = 0; return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
CNSTI4 0
RETI4
ADDRGP4 $132
JUMPV
LABELV $409
line 734
;732:			}
;733:			//if touching the flag
;734:			if (trap_BotTouchingGoal(bs->origin, goal)) {
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 644
ADDRGP4 trap_BotTouchingGoal
CALLI4
ASGNI4
ADDRLP4 644
INDIRI4
CNSTI4 0
EQI4 $413
line 736
;735:				// make sure the bot knows the flag isn't there anymore
;736:				switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 652
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 648
ADDRLP4 652
INDIRI4
ASGNI4
ADDRLP4 648
INDIRI4
CNSTI4 1
EQI4 $418
ADDRLP4 648
INDIRI4
CNSTI4 2
EQI4 $419
ADDRGP4 $415
JUMPV
LABELV $418
line 737
;737:					case TEAM_RED: bs->blueflagstatus = 1; break;
ADDRFP4 0
INDIRP4
CNSTI4 6960
ADDP4
CNSTI4 1
ASGNI4
ADDRGP4 $416
JUMPV
LABELV $419
line 738
;738:					case TEAM_BLUE: bs->redflagstatus = 1; break;
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
CNSTI4 1
ASGNI4
LABELV $415
LABELV $416
line 740
;739:				}
;740:				bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 741
;741:			}
LABELV $413
line 743
;742:			//stop after 3 minutes
;743:			if (bs->teamgoal_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $420
line 744
;744:				bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 745
;745:			}
LABELV $420
line 746
;746:			BotAlternateRoute(bs, goal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 BotAlternateRoute
CALLP4
pop
line 747
;747:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $132
JUMPV
LABELV $403
line 750
;748:		}
;749:		//if rushing to the base
;750:		if (bs->ltgtype == LTG_RUSHBASE && bs->rushbaseaway_time < FloatTime()) {
ADDRLP4 628
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 628
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 5
NEI4 $422
ADDRLP4 628
INDIRP4
CNSTI4 6152
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $422
line 751
;751:			switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 636
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 632
ADDRLP4 636
INDIRI4
ASGNI4
ADDRLP4 632
INDIRI4
CNSTI4 1
EQI4 $427
ADDRLP4 632
INDIRI4
CNSTI4 2
EQI4 $428
ADDRGP4 $424
JUMPV
LABELV $427
line 752
;752:				case TEAM_RED: memcpy(goal, &ctf_redflag, sizeof(bot_goal_t)); break;
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 ctf_redflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $425
JUMPV
LABELV $428
line 753
;753:				case TEAM_BLUE: memcpy(goal, &ctf_blueflag, sizeof(bot_goal_t)); break;
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 ctf_blueflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $425
JUMPV
LABELV $424
line 754
;754:				default: bs->ltgtype = 0; return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
CNSTI4 0
RETI4
ADDRGP4 $132
JUMPV
LABELV $425
line 757
;755:			}
;756:			//if not carrying the flag anymore
;757:			if (!BotCTFCarryingFlag(bs)) bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 644
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 644
INDIRI4
CNSTI4 0
NEI4 $429
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
LABELV $429
line 759
;758:			//quit rushing after 2 minutes
;759:			if (bs->teamgoal_time < FloatTime()) bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $431
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
LABELV $431
line 761
;760:			//if touching the base flag the bot should loose the enemy flag
;761:			if (trap_BotTouchingGoal(bs->origin, goal)) {
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 648
ADDRGP4 trap_BotTouchingGoal
CALLI4
ASGNI4
ADDRLP4 648
INDIRI4
CNSTI4 0
EQI4 $433
line 764
;762:				//if the bot is still carrying the enemy flag then the
;763:				//base flag is gone, now just walk near the base a bit
;764:				if (BotCTFCarryingFlag(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 652
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 652
INDIRI4
CNSTI4 0
EQI4 $435
line 765
;765:					trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 766
;766:					bs->rushbaseaway_time = FloatTime() + 5 + 10 * random();
ADDRLP4 656
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
ADDRLP4 656
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1092616192
MULF4
ADDF4
ASGNF4
line 768
;767:					//FIXME: add chat to tell the others to get back the flag
;768:				}
ADDRGP4 $436
JUMPV
LABELV $435
line 769
;769:				else {
line 770
;770:					bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 771
;771:				}
LABELV $436
line 772
;772:			}
LABELV $433
line 773
;773:			BotAlternateRoute(bs, goal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 BotAlternateRoute
CALLP4
pop
line 774
;774:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $132
JUMPV
LABELV $422
line 777
;775:		}
;776:		//returning flag
;777:		if (bs->ltgtype == LTG_RETURNFLAG) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 6
NEI4 $402
line 779
;778:			//check for bot typing status message
;779:			if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
ADDRLP4 632
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 632
INDIRP4
CNSTI4 6740
ADDP4
INDIRF4
CNSTF4 0
EQF4 $439
ADDRLP4 632
INDIRP4
CNSTI4 6740
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $439
line 780
;780:				BotAI_BotInitialChat(bs, "returnflag_start", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $441
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 781
;781:				trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 782
;782:				bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 783
;783:			}
LABELV $439
line 785
;784:			//
;785:			switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 640
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 636
ADDRLP4 640
INDIRI4
ASGNI4
ADDRLP4 636
INDIRI4
CNSTI4 1
EQI4 $445
ADDRLP4 636
INDIRI4
CNSTI4 2
EQI4 $446
ADDRGP4 $442
JUMPV
LABELV $445
line 786
;786:				case TEAM_RED: memcpy(goal, &ctf_blueflag, sizeof(bot_goal_t)); break;
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 ctf_blueflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $443
JUMPV
LABELV $446
line 787
;787:				case TEAM_BLUE: memcpy(goal, &ctf_redflag, sizeof(bot_goal_t)); break;
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 ctf_redflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $443
JUMPV
LABELV $442
line 788
;788:				default: bs->ltgtype = 0; return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
CNSTI4 0
RETI4
ADDRGP4 $132
JUMPV
LABELV $443
line 791
;789:			}
;790:			//if touching the flag
;791:			if (trap_BotTouchingGoal(bs->origin, goal)) bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 648
ADDRGP4 trap_BotTouchingGoal
CALLI4
ASGNI4
ADDRLP4 648
INDIRI4
CNSTI4 0
EQI4 $447
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
LABELV $447
line 793
;792:			//stop after 3 minutes
;793:			if (bs->teamgoal_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $449
line 794
;794:				bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 795
;795:			}
LABELV $449
line 796
;796:			BotAlternateRoute(bs, goal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 BotAlternateRoute
CALLP4
pop
line 797
;797:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $132
JUMPV
line 799
;798:		}
;799:	}
LABELV $401
line 801
;800:#endif //CTF
;801:	else if (gametype == GT_ONEFLAG) {
ADDRGP4 gametype
INDIRI4
CNSTI4 5
NEI4 $451
line 802
;802:		if (bs->ltgtype == LTG_GETFLAG) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 4
NEI4 $453
line 804
;803:			//check for bot typing status message
;804:			if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
ADDRLP4 628
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 628
INDIRP4
CNSTI4 6740
ADDP4
INDIRF4
CNSTF4 0
EQF4 $455
ADDRLP4 628
INDIRP4
CNSTI4 6740
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $455
line 805
;805:				BotAI_BotInitialChat(bs, "captureflag_start", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $407
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 806
;806:				trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 807
;807:				bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 808
;808:			}
LABELV $455
line 809
;809:			memcpy(goal, &ctf_neutralflag, sizeof(bot_goal_t));
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 ctf_neutralflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 811
;810:			//if touching the flag
;811:			if (trap_BotTouchingGoal(bs->origin, goal)) {
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 632
ADDRGP4 trap_BotTouchingGoal
CALLI4
ASGNI4
ADDRLP4 632
INDIRI4
CNSTI4 0
EQI4 $457
line 812
;812:				bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 813
;813:			}
LABELV $457
line 815
;814:			//stop after 3 minutes
;815:			if (bs->teamgoal_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $459
line 816
;816:				bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 817
;817:			}
LABELV $459
line 818
;818:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $132
JUMPV
LABELV $453
line 821
;819:		}
;820:		//if rushing to the base
;821:		if (bs->ltgtype == LTG_RUSHBASE) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 5
NEI4 $461
line 822
;822:			switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 632
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 628
ADDRLP4 632
INDIRI4
ASGNI4
ADDRLP4 628
INDIRI4
CNSTI4 1
EQI4 $466
ADDRLP4 628
INDIRI4
CNSTI4 2
EQI4 $467
ADDRGP4 $463
JUMPV
LABELV $466
line 823
;823:				case TEAM_RED: memcpy(goal, &ctf_blueflag, sizeof(bot_goal_t)); break;
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 ctf_blueflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $464
JUMPV
LABELV $467
line 824
;824:				case TEAM_BLUE: memcpy(goal, &ctf_redflag, sizeof(bot_goal_t)); break;
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 ctf_redflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $464
JUMPV
LABELV $463
line 825
;825:				default: bs->ltgtype = 0; return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
CNSTI4 0
RETI4
ADDRGP4 $132
JUMPV
LABELV $464
line 828
;826:			}
;827:			//if not carrying the flag anymore
;828:			if (!Bot1FCTFCarryingFlag(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 640
ADDRGP4 Bot1FCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 640
INDIRI4
CNSTI4 0
NEI4 $468
line 829
;829:				bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 830
;830:			}
LABELV $468
line 832
;831:			//quit rushing after 2 minutes
;832:			if (bs->teamgoal_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $470
line 833
;833:				bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 834
;834:			}
LABELV $470
line 836
;835:			//if touching the base flag the bot should loose the enemy flag
;836:			if (trap_BotTouchingGoal(bs->origin, goal)) {
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 644
ADDRGP4 trap_BotTouchingGoal
CALLI4
ASGNI4
ADDRLP4 644
INDIRI4
CNSTI4 0
EQI4 $472
line 837
;837:				bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 838
;838:			}
LABELV $472
line 839
;839:			BotAlternateRoute(bs, goal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 BotAlternateRoute
CALLP4
pop
line 840
;840:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $132
JUMPV
LABELV $461
line 843
;841:		}
;842:		//attack the enemy base
;843:		if (bs->ltgtype == LTG_ATTACKENEMYBASE &&
ADDRLP4 628
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 628
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 13
NEI4 $474
ADDRLP4 628
INDIRP4
CNSTI4 6156
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $474
line 844
;844:				bs->attackaway_time < FloatTime()) {
line 846
;845:			//check for bot typing status message
;846:			if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
ADDRLP4 632
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 632
INDIRP4
CNSTI4 6740
ADDP4
INDIRF4
CNSTF4 0
EQF4 $476
ADDRLP4 632
INDIRP4
CNSTI4 6740
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $476
line 847
;847:				BotAI_BotInitialChat(bs, "attackenemybase_start", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $478
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 848
;848:				trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 849
;849:				bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 850
;850:			}
LABELV $476
line 851
;851:			switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 640
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 636
ADDRLP4 640
INDIRI4
ASGNI4
ADDRLP4 636
INDIRI4
CNSTI4 1
EQI4 $482
ADDRLP4 636
INDIRI4
CNSTI4 2
EQI4 $483
ADDRGP4 $479
JUMPV
LABELV $482
line 852
;852:				case TEAM_RED: memcpy(goal, &ctf_blueflag, sizeof(bot_goal_t)); break;
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 ctf_blueflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $480
JUMPV
LABELV $483
line 853
;853:				case TEAM_BLUE: memcpy(goal, &ctf_redflag, sizeof(bot_goal_t)); break;
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 ctf_redflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $480
JUMPV
LABELV $479
line 854
;854:				default: bs->ltgtype = 0; return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
CNSTI4 0
RETI4
ADDRGP4 $132
JUMPV
LABELV $480
line 857
;855:			}
;856:			//quit rushing after 2 minutes
;857:			if (bs->teamgoal_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $484
line 858
;858:				bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 859
;859:			}
LABELV $484
line 861
;860:			//if touching the base flag the bot should loose the enemy flag
;861:			if (trap_BotTouchingGoal(bs->origin, goal)) {
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 648
ADDRGP4 trap_BotTouchingGoal
CALLI4
ASGNI4
ADDRLP4 648
INDIRI4
CNSTI4 0
EQI4 $486
line 862
;862:				bs->attackaway_time = FloatTime() + 2 + 5 * random();
ADDRLP4 652
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6156
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDF4
ADDRLP4 652
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1084227584
MULF4
ADDF4
ASGNF4
line 863
;863:			}
LABELV $486
line 864
;864:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $132
JUMPV
LABELV $474
line 867
;865:		}
;866:		//returning flag
;867:		if (bs->ltgtype == LTG_RETURNFLAG) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 6
NEI4 $452
line 869
;868:			//check for bot typing status message
;869:			if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
ADDRLP4 632
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 632
INDIRP4
CNSTI4 6740
ADDP4
INDIRF4
CNSTF4 0
EQF4 $490
ADDRLP4 632
INDIRP4
CNSTI4 6740
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $490
line 870
;870:				BotAI_BotInitialChat(bs, "returnflag_start", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $441
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 871
;871:				trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 872
;872:				bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 873
;873:			}
LABELV $490
line 875
;874:			//
;875:			if (bs->teamgoal_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $492
line 876
;876:				bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 877
;877:			}
LABELV $492
line 879
;878:			//just roam around
;879:			return BotGetItemLongTermGoal(bs, tfl, goal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 636
ADDRGP4 BotGetItemLongTermGoal
CALLI4
ASGNI4
ADDRLP4 636
INDIRI4
RETI4
ADDRGP4 $132
JUMPV
line 881
;880:		}
;881:	}
LABELV $451
line 882
;882:	else if (gametype == GT_OVERLOAD) {
ADDRGP4 gametype
INDIRI4
CNSTI4 6
NEI4 $494
line 883
;883:		if (bs->ltgtype == LTG_ATTACKENEMYBASE &&
ADDRLP4 628
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 628
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 13
NEI4 $495
ADDRLP4 628
INDIRP4
CNSTI4 6156
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $495
line 884
;884:				bs->attackaway_time < FloatTime()) {
line 887
;885:
;886:			//check for bot typing status message
;887:			if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
ADDRLP4 632
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 632
INDIRP4
CNSTI4 6740
ADDP4
INDIRF4
CNSTF4 0
EQF4 $498
ADDRLP4 632
INDIRP4
CNSTI4 6740
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $498
line 888
;888:				BotAI_BotInitialChat(bs, "attackenemybase_start", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $478
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 889
;889:				trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 890
;890:				bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 891
;891:			}
LABELV $498
line 892
;892:			switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 640
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 636
ADDRLP4 640
INDIRI4
ASGNI4
ADDRLP4 636
INDIRI4
CNSTI4 1
EQI4 $503
ADDRLP4 636
INDIRI4
CNSTI4 2
EQI4 $504
ADDRGP4 $500
JUMPV
LABELV $503
line 893
;893:				case TEAM_RED: memcpy(goal, &blueobelisk, sizeof(bot_goal_t)); break;
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 blueobelisk
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $501
JUMPV
LABELV $504
line 894
;894:				case TEAM_BLUE: memcpy(goal, &redobelisk, sizeof(bot_goal_t)); break;
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 redobelisk
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $501
JUMPV
LABELV $500
line 895
;895:				default: bs->ltgtype = 0; return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
CNSTI4 0
RETI4
ADDRGP4 $132
JUMPV
LABELV $501
line 898
;896:			}
;897:			//if the bot no longer wants to attack the obelisk
;898:			if (BotFeelingBad(bs) > 50) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 648
ADDRGP4 BotFeelingBad
CALLF4
ASGNF4
ADDRLP4 648
INDIRF4
CNSTF4 1112014848
LEF4 $505
line 899
;899:				return BotGetItemLongTermGoal(bs, tfl, goal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 652
ADDRGP4 BotGetItemLongTermGoal
CALLI4
ASGNI4
ADDRLP4 652
INDIRI4
RETI4
ADDRGP4 $132
JUMPV
LABELV $505
line 902
;900:			}
;901:			//if touching the obelisk
;902:			if (trap_BotTouchingGoal(bs->origin, goal)) {
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 652
ADDRGP4 trap_BotTouchingGoal
CALLI4
ASGNI4
ADDRLP4 652
INDIRI4
CNSTI4 0
EQI4 $507
line 903
;903:				bs->attackaway_time = FloatTime() + 3 + 5 * random();
ADDRLP4 656
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6156
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1077936128
ADDF4
ADDRLP4 656
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1084227584
MULF4
ADDF4
ASGNF4
line 904
;904:			}
LABELV $507
line 906
;905:			// or very close to the obelisk
;906:			VectorSubtract(bs->origin, goal->origin, dir);
ADDRLP4 656
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 660
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 260
ADDRLP4 656
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRLP4 660
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 260+4
ADDRLP4 656
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRLP4 660
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 260+8
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 907
;907:			if (VectorLengthSquared(dir) < Square(60)) {
ADDRLP4 260
ARGP4
ADDRLP4 664
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 664
INDIRF4
CNSTF4 1163984896
GEF4 $511
line 908
;908:				bs->attackaway_time = FloatTime() + 3 + 5 * random();
ADDRLP4 668
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6156
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1077936128
ADDF4
ADDRLP4 668
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1084227584
MULF4
ADDF4
ASGNF4
line 909
;909:			}
LABELV $511
line 911
;910:			//quit rushing after 2 minutes
;911:			if (bs->teamgoal_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $513
line 912
;912:				bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 913
;913:			}
LABELV $513
line 914
;914:			BotAlternateRoute(bs, goal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 BotAlternateRoute
CALLP4
pop
line 916
;915:			//just move towards the obelisk
;916:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $132
JUMPV
line 918
;917:		}
;918:	}
LABELV $494
line 919
;919:	else if (gametype == GT_HARVESTER) {
ADDRGP4 gametype
INDIRI4
CNSTI4 7
NEI4 $515
line 921
;920:		//if rushing to the base
;921:		if (bs->ltgtype == LTG_RUSHBASE) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 5
NEI4 $517
line 922
;922:			switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 632
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 628
ADDRLP4 632
INDIRI4
ASGNI4
ADDRLP4 628
INDIRI4
CNSTI4 1
EQI4 $522
ADDRLP4 628
INDIRI4
CNSTI4 2
EQI4 $523
ADDRGP4 $519
JUMPV
LABELV $522
line 923
;923:				case TEAM_RED: memcpy(goal, &blueobelisk, sizeof(bot_goal_t)); break;
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 blueobelisk
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $520
JUMPV
LABELV $523
line 924
;924:				case TEAM_BLUE: memcpy(goal, &redobelisk, sizeof(bot_goal_t)); break;
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 redobelisk
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $520
JUMPV
LABELV $519
line 925
;925:				default: BotGoHarvest(bs); return qfalse;
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotGoHarvest
CALLV
pop
CNSTI4 0
RETI4
ADDRGP4 $132
JUMPV
LABELV $520
line 928
;926:			}
;927:			//if not carrying any cubes
;928:			if (!BotHarvesterCarryingCubes(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 640
ADDRGP4 BotHarvesterCarryingCubes
CALLI4
ASGNI4
ADDRLP4 640
INDIRI4
CNSTI4 0
NEI4 $524
line 929
;929:				BotGoHarvest(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotGoHarvest
CALLV
pop
line 930
;930:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $132
JUMPV
LABELV $524
line 933
;931:			}
;932:			//quit rushing after 2 minutes
;933:			if (bs->teamgoal_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $526
line 934
;934:				BotGoHarvest(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotGoHarvest
CALLV
pop
line 935
;935:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $132
JUMPV
LABELV $526
line 938
;936:			}
;937:			//if touching the base flag the bot should loose the enemy flag
;938:			if (trap_BotTouchingGoal(bs->origin, goal)) {
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 644
ADDRGP4 trap_BotTouchingGoal
CALLI4
ASGNI4
ADDRLP4 644
INDIRI4
CNSTI4 0
EQI4 $528
line 939
;939:				BotGoHarvest(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotGoHarvest
CALLV
pop
line 940
;940:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $132
JUMPV
LABELV $528
line 942
;941:			}
;942:			BotAlternateRoute(bs, goal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 BotAlternateRoute
CALLP4
pop
line 943
;943:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $132
JUMPV
LABELV $517
line 946
;944:		}
;945:		//attack the enemy base
;946:		if (bs->ltgtype == LTG_ATTACKENEMYBASE &&
ADDRLP4 628
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 628
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 13
NEI4 $530
ADDRLP4 628
INDIRP4
CNSTI4 6156
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $530
line 947
;947:				bs->attackaway_time < FloatTime()) {
line 949
;948:			//check for bot typing status message
;949:			if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
ADDRLP4 632
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 632
INDIRP4
CNSTI4 6740
ADDP4
INDIRF4
CNSTF4 0
EQF4 $532
ADDRLP4 632
INDIRP4
CNSTI4 6740
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $532
line 950
;950:				BotAI_BotInitialChat(bs, "attackenemybase_start", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $478
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 951
;951:				trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 952
;952:				bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 953
;953:			}
LABELV $532
line 954
;954:			switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 640
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 636
ADDRLP4 640
INDIRI4
ASGNI4
ADDRLP4 636
INDIRI4
CNSTI4 1
EQI4 $537
ADDRLP4 636
INDIRI4
CNSTI4 2
EQI4 $538
ADDRGP4 $534
JUMPV
LABELV $537
line 955
;955:				case TEAM_RED: memcpy(goal, &blueobelisk, sizeof(bot_goal_t)); break;
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 blueobelisk
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $535
JUMPV
LABELV $538
line 956
;956:				case TEAM_BLUE: memcpy(goal, &redobelisk, sizeof(bot_goal_t)); break;
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 redobelisk
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $535
JUMPV
LABELV $534
line 957
;957:				default: bs->ltgtype = 0; return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
CNSTI4 0
RETI4
ADDRGP4 $132
JUMPV
LABELV $535
line 960
;958:			}
;959:			//quit rushing after 2 minutes
;960:			if (bs->teamgoal_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $539
line 961
;961:				bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 962
;962:			}
LABELV $539
line 964
;963:			//if touching the base flag the bot should loose the enemy flag
;964:			if (trap_BotTouchingGoal(bs->origin, goal)) {
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 648
ADDRGP4 trap_BotTouchingGoal
CALLI4
ASGNI4
ADDRLP4 648
INDIRI4
CNSTI4 0
EQI4 $541
line 965
;965:				bs->attackaway_time = FloatTime() + 2 + 5 * random();
ADDRLP4 652
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6156
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDF4
ADDRLP4 652
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1084227584
MULF4
ADDF4
ASGNF4
line 966
;966:			}
LABELV $541
line 967
;967:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $132
JUMPV
LABELV $530
line 970
;968:		}
;969:		//harvest cubes
;970:		if (bs->ltgtype == LTG_HARVEST &&
ADDRLP4 632
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 632
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 12
NEI4 $543
ADDRLP4 632
INDIRP4
CNSTI4 6160
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $543
line 971
;971:			bs->harvestaway_time < FloatTime()) {
line 973
;972:			//check for bot typing status message
;973:			if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
ADDRLP4 636
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 636
INDIRP4
CNSTI4 6740
ADDP4
INDIRF4
CNSTF4 0
EQF4 $545
ADDRLP4 636
INDIRP4
CNSTI4 6740
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $545
line 974
;974:				BotAI_BotInitialChat(bs, "harvest_start", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $547
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 975
;975:				trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 976
;976:				bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 977
;977:			}
LABELV $545
line 978
;978:			memcpy(goal, &neutralobelisk, sizeof(bot_goal_t));
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 neutralobelisk
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 980
;979:			//
;980:			if (bs->teamgoal_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $548
line 981
;981:				bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 982
;982:			}
LABELV $548
line 984
;983:			//
;984:			if (trap_BotTouchingGoal(bs->origin, goal)) {
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 640
ADDRGP4 trap_BotTouchingGoal
CALLI4
ASGNI4
ADDRLP4 640
INDIRI4
CNSTI4 0
EQI4 $550
line 985
;985:				bs->harvestaway_time = FloatTime() + 4 + 3 * random();
ADDRLP4 644
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6160
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1082130432
ADDF4
ADDRLP4 644
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1077936128
MULF4
ADDF4
ASGNF4
line 986
;986:			}
LABELV $550
line 987
;987:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $132
JUMPV
LABELV $543
line 989
;988:		}
;989:	}
LABELV $515
LABELV $495
LABELV $452
LABELV $402
line 992
;990:
;991:	//normal goal stuff
;992:	return BotGetItemLongTermGoal(bs, tfl, goal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 628
ADDRGP4 BotGetItemLongTermGoal
CALLI4
ASGNI4
ADDRLP4 628
INDIRI4
RETI4
LABELV $132
endproc BotGetLongTermGoal 672 20
export BotLongTermGoal
proc BotLongTermGoal 448 20
line 1000
;993:}
;994:
;995:/*
;996:==================
;997:BotLongTermGoal
;998:==================
;999:*/
;1000:int BotLongTermGoal(bot_state_t *bs, int tfl, int retreat, bot_goal_t *goal) {
line 1010
;1001:	aas_entityinfo_t entinfo;
;1002:	char teammate[MAX_MESSAGE_SIZE];
;1003:	float squaredist;
;1004:	int areanum;
;1005:	vec3_t dir;
;1006:
;1007:	//FIXME: also have air long term goals?
;1008:	//
;1009:	//if the bot is leading someone and not retreating
;1010:	if (bs->lead_time > 0 && !retreat) {
ADDRFP4 0
INDIRP4
CNSTI4 6884
ADDP4
INDIRF4
CNSTF4 0
LEF4 $553
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $553
line 1011
;1011:		if (bs->lead_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6884
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $555
line 1012
;1012:			BotAI_BotInitialChat(bs, "lead_stop", EasyClientName(bs->lead_teammate, teammate, sizeof(teammate)), NULL);
ADDRFP4 0
INDIRP4
CNSTI4 6824
ADDP4
INDIRI4
ARGI4
ADDRLP4 152
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 416
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $557
ARGP4
ADDRLP4 416
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1013
;1013:			trap_BotEnterChat(bs->cs, bs->teammate, CHAT_TELL);
ADDRLP4 420
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 420
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 420
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1014
;1014:			bs->lead_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6884
ADDP4
CNSTF4 0
ASGNF4
line 1015
;1015:			return BotGetLongTermGoal(bs, tfl, retreat, goal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 424
ADDRGP4 BotGetLongTermGoal
CALLI4
ASGNI4
ADDRLP4 424
INDIRI4
RETI4
ADDRGP4 $552
JUMPV
LABELV $555
line 1018
;1016:		}
;1017:		//
;1018:		if (bs->leadmessage_time < 0 && -bs->leadmessage_time < FloatTime()) {
ADDRLP4 416
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 416
INDIRP4
CNSTI4 6892
ADDP4
INDIRF4
CNSTF4 0
GEF4 $558
ADDRLP4 416
INDIRP4
CNSTI4 6892
ADDP4
INDIRF4
NEGF4
ADDRGP4 floattime
INDIRF4
GEF4 $558
line 1019
;1019:			BotAI_BotInitialChat(bs, "followme", EasyClientName(bs->lead_teammate, teammate, sizeof(teammate)), NULL);
ADDRFP4 0
INDIRP4
CNSTI4 6824
ADDP4
INDIRI4
ARGI4
ADDRLP4 152
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 420
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $560
ARGP4
ADDRLP4 420
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1020
;1020:			trap_BotEnterChat(bs->cs, bs->teammate, CHAT_TELL);
ADDRLP4 424
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 424
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 424
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1021
;1021:			bs->leadmessage_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6892
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1022
;1022:		}
LABELV $558
line 1024
;1023:		//get entity information of the companion
;1024:		BotEntityInfo(bs->lead_teammate, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6824
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 1026
;1025:		//
;1026:		if (entinfo.valid) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $561
line 1027
;1027:			areanum = BotPointAreaNum(entinfo.origin);
ADDRLP4 12+24
ARGP4
ADDRLP4 420
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 412
ADDRLP4 420
INDIRI4
ASGNI4
line 1028
;1028:			if (areanum && trap_AAS_AreaReachability(areanum)) {
ADDRLP4 424
ADDRLP4 412
INDIRI4
ASGNI4
ADDRLP4 424
INDIRI4
CNSTI4 0
EQI4 $564
ADDRLP4 424
INDIRI4
ARGI4
ADDRLP4 428
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 428
INDIRI4
CNSTI4 0
EQI4 $564
line 1030
;1029:				//update team goal
;1030:				bs->lead_teamgoal.entitynum = bs->lead_teammate;
ADDRLP4 432
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 432
INDIRP4
CNSTI4 6868
ADDP4
ADDRLP4 432
INDIRP4
CNSTI4 6824
ADDP4
INDIRI4
ASGNI4
line 1031
;1031:				bs->lead_teamgoal.areanum = areanum;
ADDRFP4 0
INDIRP4
CNSTI4 6840
ADDP4
ADDRLP4 412
INDIRI4
ASGNI4
line 1032
;1032:				VectorCopy(entinfo.origin, bs->lead_teamgoal.origin);
ADDRFP4 0
INDIRP4
CNSTI4 6828
ADDP4
ADDRLP4 12+24
INDIRB
ASGNB 12
line 1033
;1033:				VectorSet(bs->lead_teamgoal.mins, -8, -8, -8);
ADDRFP4 0
INDIRP4
CNSTI4 6844
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6848
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6852
ADDP4
CNSTF4 3238002688
ASGNF4
line 1034
;1034:				VectorSet(bs->lead_teamgoal.maxs, 8, 8, 8);
ADDRFP4 0
INDIRP4
CNSTI4 6856
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6860
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6864
ADDP4
CNSTF4 1090519040
ASGNF4
line 1035
;1035:			}
LABELV $564
line 1036
;1036:		}
LABELV $561
line 1038
;1037:		//if the team mate is visible
;1038:		if (BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, bs->lead_teammate)) {
ADDRLP4 420
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 420
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 420
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 420
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 420
INDIRP4
CNSTI4 6824
ADDP4
INDIRI4
ARGI4
ADDRLP4 424
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 424
INDIRF4
CNSTF4 0
EQF4 $567
line 1039
;1039:			bs->leadvisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6888
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1040
;1040:		}
LABELV $567
line 1042
;1041:		//if the team mate is not visible for 1 seconds
;1042:		if (bs->leadvisible_time < FloatTime() - 1) {
ADDRFP4 0
INDIRP4
CNSTI4 6888
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
SUBF4
GEF4 $569
line 1043
;1043:			bs->leadbackup_time = FloatTime() + 2;
ADDRFP4 0
INDIRP4
CNSTI4 6896
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDF4
ASGNF4
line 1044
;1044:		}
LABELV $569
line 1046
;1045:		//distance towards the team mate
;1046:		VectorSubtract(bs->origin, bs->lead_teamgoal.origin, dir);
ADDRLP4 428
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 428
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRLP4 428
INDIRP4
CNSTI4 6828
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 428
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRLP4 428
INDIRP4
CNSTI4 6832
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 432
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 432
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
ADDRLP4 432
INDIRP4
CNSTI4 6836
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1047
;1047:		squaredist = VectorLengthSquared(dir);
ADDRLP4 0
ARGP4
ADDRLP4 436
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 408
ADDRLP4 436
INDIRF4
ASGNF4
line 1049
;1048:		//if backing up towards the team mate
;1049:		if (bs->leadbackup_time > FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6896
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $573
line 1050
;1050:			if (bs->leadmessage_time < FloatTime() - 20) {
ADDRFP4 0
INDIRP4
CNSTI4 6892
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1101004800
SUBF4
GEF4 $575
line 1051
;1051:				BotAI_BotInitialChat(bs, "followme", EasyClientName(bs->lead_teammate, teammate, sizeof(teammate)), NULL);
ADDRFP4 0
INDIRP4
CNSTI4 6824
ADDP4
INDIRI4
ARGI4
ADDRLP4 152
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 440
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $560
ARGP4
ADDRLP4 440
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1052
;1052:				trap_BotEnterChat(bs->cs, bs->teammate, CHAT_TELL);
ADDRLP4 444
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 444
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 444
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1053
;1053:				bs->leadmessage_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6892
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1054
;1054:			}
LABELV $575
line 1056
;1055:			//if very close to the team mate
;1056:			if (squaredist < Square(100)) {
ADDRLP4 408
INDIRF4
CNSTF4 1176256512
GEF4 $577
line 1057
;1057:				bs->leadbackup_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6896
ADDP4
CNSTF4 0
ASGNF4
line 1058
;1058:			}
LABELV $577
line 1060
;1059:			//the bot should go back to the team mate
;1060:			memcpy(goal, &bs->lead_teamgoal, sizeof(bot_goal_t));
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6828
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1061
;1061:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $552
JUMPV
LABELV $573
line 1063
;1062:		}
;1063:		else {
line 1065
;1064:			//if quite distant from the team mate
;1065:			if (squaredist > Square(500)) {
ADDRLP4 408
INDIRF4
CNSTF4 1215570944
LEF4 $579
line 1066
;1066:				if (bs->leadmessage_time < FloatTime() - 20) {
ADDRFP4 0
INDIRP4
CNSTI4 6892
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1101004800
SUBF4
GEF4 $581
line 1067
;1067:					BotAI_BotInitialChat(bs, "followme", EasyClientName(bs->lead_teammate, teammate, sizeof(teammate)), NULL);
ADDRFP4 0
INDIRP4
CNSTI4 6824
ADDP4
INDIRI4
ARGI4
ADDRLP4 152
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 440
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $560
ARGP4
ADDRLP4 440
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1068
;1068:					trap_BotEnterChat(bs->cs, bs->teammate, CHAT_TELL);
ADDRLP4 444
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 444
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 444
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1069
;1069:					bs->leadmessage_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6892
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1070
;1070:				}
LABELV $581
line 1072
;1071:				//look at the team mate
;1072:				VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 440
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12+24
INDIRF4
ADDRLP4 440
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 12+24+4
INDIRF4
ADDRLP4 440
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 12+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1073
;1073:				vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1074
;1074:				bs->ideal_viewangles[2] *= 0.5;
ADDRLP4 444
ADDRFP4 0
INDIRP4
CNSTI4 6584
ADDP4
ASGNP4
ADDRLP4 444
INDIRP4
ADDRLP4 444
INDIRP4
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 1076
;1075:				//just wait for the team mate
;1076:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $552
JUMPV
LABELV $579
line 1078
;1077:			}
;1078:		}
line 1079
;1079:	}
LABELV $553
line 1080
;1080:	return BotGetLongTermGoal(bs, tfl, retreat, goal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 416
ADDRGP4 BotGetLongTermGoal
CALLI4
ASGNI4
ADDRLP4 416
INDIRI4
RETI4
LABELV $552
endproc BotLongTermGoal 448 20
export AIEnter_Intermission
proc AIEnter_Intermission 8 16
line 1088
;1081:}
;1082:
;1083:/*
;1084:==================
;1085:AIEnter_Intermission
;1086:==================
;1087:*/
;1088:void AIEnter_Intermission(bot_state_t *bs, char *s) {
line 1089
;1089:	BotRecordNodeSwitch(bs, "intermission", "", s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $591
ARGP4
ADDRGP4 $64
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRecordNodeSwitch
CALLV
pop
line 1091
;1090:	//reset the bot state
;1091:	BotResetState(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotResetState
CALLV
pop
line 1093
;1092:	//check for end level chat
;1093:	if (BotChat_EndLevel(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotChat_EndLevel
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $592
line 1094
;1094:		trap_BotEnterChat(bs->cs, 0, bs->chatto);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 6052
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1095
;1095:	}
LABELV $592
line 1096
;1096:	bs->ainode = AINode_Intermission;
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
ADDRGP4 AINode_Intermission
ASGNP4
line 1097
;1097:}
LABELV $590
endproc AIEnter_Intermission 8 16
export AINode_Intermission
proc AINode_Intermission 16 8
line 1104
;1098:
;1099:/*
;1100:==================
;1101:AINode_Intermission
;1102:==================
;1103:*/
;1104:int AINode_Intermission(bot_state_t *bs) {
line 1106
;1105:	//if the intermission ended
;1106:	if (!BotIntermission(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotIntermission
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $595
line 1107
;1107:		if (BotChat_StartLevel(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 BotChat_StartLevel
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $597
line 1108
;1108:			bs->stand_time = FloatTime() + BotChatTime(bs);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 BotChatTime
CALLF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 6096
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ASGNF4
line 1109
;1109:		}
ADDRGP4 $598
JUMPV
LABELV $597
line 1110
;1110:		else {
line 1111
;1111:			bs->stand_time = FloatTime() + 2;
ADDRFP4 0
INDIRP4
CNSTI4 6096
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDF4
ASGNF4
line 1112
;1112:		}
LABELV $598
line 1113
;1113:		AIEnter_Stand(bs, "intermission: chat");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $599
ARGP4
ADDRGP4 AIEnter_Stand
CALLV
pop
line 1114
;1114:	}
LABELV $595
line 1115
;1115:	return qtrue;
CNSTI4 1
RETI4
LABELV $594
endproc AINode_Intermission 16 8
export AIEnter_Observer
proc AIEnter_Observer 0 16
line 1123
;1116:}
;1117:
;1118:/*
;1119:==================
;1120:AIEnter_Observer
;1121:==================
;1122:*/
;1123:void AIEnter_Observer(bot_state_t *bs, char *s) {
line 1124
;1124:	BotRecordNodeSwitch(bs, "observer", "", s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $601
ARGP4
ADDRGP4 $64
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRecordNodeSwitch
CALLV
pop
line 1126
;1125:	//reset the bot state
;1126:	BotResetState(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotResetState
CALLV
pop
line 1127
;1127:	bs->ainode = AINode_Observer;
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
ADDRGP4 AINode_Observer
ASGNP4
line 1128
;1128:}
LABELV $600
endproc AIEnter_Observer 0 16
export AINode_Observer
proc AINode_Observer 4 8
line 1135
;1129:
;1130:/*
;1131:==================
;1132:AINode_Observer
;1133:==================
;1134:*/
;1135:int AINode_Observer(bot_state_t *bs) {
line 1137
;1136:	//if the bot left observer mode
;1137:	if (!BotIsObserver(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotIsObserver
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $603
line 1138
;1138:		AIEnter_Stand(bs, "observer: left observer");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $605
ARGP4
ADDRGP4 AIEnter_Stand
CALLV
pop
line 1139
;1139:	}
LABELV $603
line 1140
;1140:	return qtrue;
CNSTI4 1
RETI4
LABELV $602
endproc AINode_Observer 4 8
export AIEnter_Stand
proc AIEnter_Stand 0 16
line 1148
;1141:}
;1142:
;1143:/*
;1144:==================
;1145:AIEnter_Stand
;1146:==================
;1147:*/
;1148:void AIEnter_Stand(bot_state_t *bs, char *s) {
line 1149
;1149:	BotRecordNodeSwitch(bs, "stand", "", s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $607
ARGP4
ADDRGP4 $64
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRecordNodeSwitch
CALLV
pop
line 1150
;1150:	bs->standfindenemy_time = FloatTime() + 1;
ADDRFP4 0
INDIRP4
CNSTI4 6112
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 1151
;1151:	bs->ainode = AINode_Stand;
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
ADDRGP4 AINode_Stand
ASGNP4
line 1152
;1152:}
LABELV $606
endproc AIEnter_Stand 0 16
export AINode_Stand
proc AINode_Stand 24 12
line 1159
;1153:
;1154:/*
;1155:==================
;1156:AINode_Stand
;1157:==================
;1158:*/
;1159:int AINode_Stand(bot_state_t *bs) {
line 1162
;1160:
;1161:	//if the bot's health decreased
;1162:	if (bs->lastframe_health > bs->inventory[INVENTORY_HEALTH]) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 6044
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
LEI4 $609
line 1163
;1163:		if (BotChat_HitTalking(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 BotChat_HitTalking
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $611
line 1164
;1164:			bs->standfindenemy_time = FloatTime() + BotChatTime(bs) + 0.1;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 BotChatTime
CALLF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 6112
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
CNSTF4 1036831949
ADDF4
ASGNF4
line 1165
;1165:			bs->stand_time = FloatTime() + BotChatTime(bs) + 0.1;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 BotChatTime
CALLF4
ASGNF4
ADDRLP4 16
INDIRP4
CNSTI4 6096
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 20
INDIRF4
ADDF4
CNSTF4 1036831949
ADDF4
ASGNF4
line 1166
;1166:		}
LABELV $611
line 1167
;1167:	}
LABELV $609
line 1168
;1168:	if (bs->standfindenemy_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6112
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $613
line 1169
;1169:		if (BotFindEnemy(bs, -1)) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 4
ADDRGP4 BotFindEnemy
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $615
line 1170
;1170:			AIEnter_Battle_Fight(bs, "stand: found enemy");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $617
ARGP4
ADDRGP4 AIEnter_Battle_Fight
CALLV
pop
line 1171
;1171:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $608
JUMPV
LABELV $615
line 1173
;1172:		}
;1173:		bs->standfindenemy_time = FloatTime() + 1;
ADDRFP4 0
INDIRP4
CNSTI4 6112
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 1174
;1174:	}
LABELV $613
line 1176
;1175:	// put up chat icon
;1176:	trap_EA_Talk(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Talk
CALLV
pop
line 1178
;1177:	// when done standing
;1178:	if (bs->stand_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6096
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $618
line 1179
;1179:		trap_BotEnterChat(bs->cs, 0, bs->chatto);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 6052
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1180
;1180:		AIEnter_Seek_LTG(bs, "stand: time out");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $620
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 1181
;1181:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $608
JUMPV
LABELV $618
line 1184
;1182:	}
;1183:	//
;1184:	return qtrue;
CNSTI4 1
RETI4
LABELV $608
endproc AINode_Stand 24 12
export AIEnter_Respawn
proc AIEnter_Respawn 12 16
line 1192
;1185:}
;1186:
;1187:/*
;1188:==================
;1189:AIEnter_Respawn
;1190:==================
;1191:*/
;1192:void AIEnter_Respawn(bot_state_t *bs, char *s) {
line 1193
;1193:	BotRecordNodeSwitch(bs, "respawn", "", s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $622
ARGP4
ADDRGP4 $64
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRecordNodeSwitch
CALLV
pop
line 1195
;1194:	//reset some states
;1195:	trap_BotResetMoveState(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetMoveState
CALLV
pop
line 1196
;1196:	trap_BotResetGoalState(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetGoalState
CALLV
pop
line 1197
;1197:	trap_BotResetAvoidGoals(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidGoals
CALLV
pop
line 1198
;1198:	trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 1200
;1199:	//if the bot wants to chat
;1200:	if (BotChat_Death(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotChat_Death
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $623
line 1201
;1201:		bs->respawn_time = FloatTime() + BotChatTime(bs);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BotChatTime
CALLF4
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 6076
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ASGNF4
line 1202
;1202:		bs->respawnchat_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6080
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1203
;1203:	}
ADDRGP4 $624
JUMPV
LABELV $623
line 1204
;1204:	else {
line 1205
;1205:		bs->respawn_time = FloatTime() + 1 + random();
ADDRLP4 4
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6076
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
ADDF4
ADDRLP4 4
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDF4
ASGNF4
line 1206
;1206:		bs->respawnchat_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6080
ADDP4
CNSTF4 0
ASGNF4
line 1207
;1207:	}
LABELV $624
line 1209
;1208:	//set respawn state
;1209:	bs->respawn_wait = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 5984
ADDP4
CNSTI4 0
ASGNI4
line 1210
;1210:	bs->ainode = AINode_Respawn;
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
ADDRGP4 AINode_Respawn
ASGNP4
line 1211
;1211:}
LABELV $621
endproc AIEnter_Respawn 12 16
export AINode_Respawn
proc AINode_Respawn 4 12
line 1218
;1212:
;1213:/*
;1214:==================
;1215:AINode_Respawn
;1216:==================
;1217:*/
;1218:int AINode_Respawn(bot_state_t *bs) {
line 1220
;1219:	// if waiting for the actual respawn
;1220:	if (bs->respawn_wait) {
ADDRFP4 0
INDIRP4
CNSTI4 5984
ADDP4
INDIRI4
CNSTI4 0
EQI4 $626
line 1221
;1221:		if (!BotIsDead(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotIsDead
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $628
line 1222
;1222:			AIEnter_Seek_LTG(bs, "respawn: respawned");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $630
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 1223
;1223:		}
ADDRGP4 $627
JUMPV
LABELV $628
line 1224
;1224:		else {
line 1225
;1225:			trap_EA_Respawn(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Respawn
CALLV
pop
line 1226
;1226:		}
line 1227
;1227:	}
ADDRGP4 $627
JUMPV
LABELV $626
line 1228
;1228:	else if (bs->respawn_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6076
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $631
line 1230
;1229:		// wait until respawned
;1230:		bs->respawn_wait = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 5984
ADDP4
CNSTI4 1
ASGNI4
line 1232
;1231:		// elementary action respawn
;1232:		trap_EA_Respawn(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Respawn
CALLV
pop
line 1234
;1233:		//
;1234:		if (bs->respawnchat_time) {
ADDRFP4 0
INDIRP4
CNSTI4 6080
ADDP4
INDIRF4
CNSTF4 0
EQF4 $633
line 1235
;1235:			trap_BotEnterChat(bs->cs, 0, bs->chatto);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 6052
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1236
;1236:			bs->enemy = -1;
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
CNSTI4 -1
ASGNI4
line 1237
;1237:		}
LABELV $633
line 1238
;1238:	}
LABELV $631
LABELV $627
line 1239
;1239:	if (bs->respawnchat_time && bs->respawnchat_time < FloatTime() - 0.5) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 6080
ADDP4
INDIRF4
CNSTF4 0
EQF4 $635
ADDRLP4 0
INDIRP4
CNSTI4 6080
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1056964608
SUBF4
GEF4 $635
line 1240
;1240:		trap_EA_Talk(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Talk
CALLV
pop
line 1241
;1241:	}
LABELV $635
line 1243
;1242:	//
;1243:	return qtrue;
CNSTI4 1
RETI4
LABELV $625
endproc AINode_Respawn 4 12
export BotSelectActivateWeapon
proc BotSelectActivateWeapon 44 0
line 1251
;1244:}
;1245:
;1246:/*
;1247:==================
;1248:BotSelectActivateWeapon
;1249:==================
;1250:*/
;1251:int BotSelectActivateWeapon(bot_state_t *bs) {
line 1253
;1252:	//
;1253:	if (bs->inventory[INVENTORY_MACHINEGUN] > 0 && bs->inventory[INVENTORY_BULLETS] > 0)
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 4976
ADDP4
INDIRI4
CNSTI4 0
LEI4 $638
ADDRLP4 0
INDIRP4
CNSTI4 5028
ADDP4
INDIRI4
CNSTI4 0
LEI4 $638
line 1254
;1254:		return WEAPONINDEX_MACHINEGUN;
CNSTI4 2
RETI4
ADDRGP4 $637
JUMPV
LABELV $638
line 1255
;1255:	else if (bs->inventory[INVENTORY_SHOTGUN] > 0 && bs->inventory[INVENTORY_SHELLS] > 0)
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 4972
ADDP4
INDIRI4
CNSTI4 0
LEI4 $640
ADDRLP4 4
INDIRP4
CNSTI4 5024
ADDP4
INDIRI4
CNSTI4 0
LEI4 $640
line 1256
;1256:		return WEAPONINDEX_SHOTGUN;
CNSTI4 3
RETI4
ADDRGP4 $637
JUMPV
LABELV $640
line 1257
;1257:	else if (bs->inventory[INVENTORY_PLASMAGUN] > 0 && bs->inventory[INVENTORY_CELLS] > 0)
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 4996
ADDP4
INDIRI4
CNSTI4 0
LEI4 $642
ADDRLP4 8
INDIRP4
CNSTI4 5036
ADDP4
INDIRI4
CNSTI4 0
LEI4 $642
line 1258
;1258:		return WEAPONINDEX_PLASMAGUN;
CNSTI4 8
RETI4
ADDRGP4 $637
JUMPV
LABELV $642
line 1259
;1259:	else if (bs->inventory[INVENTORY_LIGHTNING] > 0 && bs->inventory[INVENTORY_LIGHTNINGAMMO] > 0)
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 4988
ADDP4
INDIRI4
CNSTI4 0
LEI4 $644
ADDRLP4 12
INDIRP4
CNSTI4 5040
ADDP4
INDIRI4
CNSTI4 0
LEI4 $644
line 1260
;1260:		return WEAPONINDEX_LIGHTNING;
CNSTI4 6
RETI4
ADDRGP4 $637
JUMPV
LABELV $644
line 1261
;1261:	else if (bs->inventory[INVENTORY_CHAINGUN] > 0 && bs->inventory[INVENTORY_BELT] > 0)
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 5020
ADDP4
INDIRI4
CNSTI4 0
LEI4 $646
ADDRLP4 16
INDIRP4
CNSTI4 5064
ADDP4
INDIRI4
CNSTI4 0
LEI4 $646
line 1262
;1262:		return WEAPONINDEX_CHAINGUN;
CNSTI4 13
RETI4
ADDRGP4 $637
JUMPV
LABELV $646
line 1263
;1263:	else if (bs->inventory[INVENTORY_NAILGUN] > 0 && bs->inventory[INVENTORY_NAILS] > 0)
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 5012
ADDP4
INDIRI4
CNSTI4 0
LEI4 $648
ADDRLP4 20
INDIRP4
CNSTI4 5056
ADDP4
INDIRI4
CNSTI4 0
LEI4 $648
line 1264
;1264:		return WEAPONINDEX_NAILGUN;
CNSTI4 11
RETI4
ADDRGP4 $637
JUMPV
LABELV $648
line 1265
;1265:	else if (bs->inventory[INVENTORY_PROXLAUNCHER] > 0 && bs->inventory[INVENTORY_MINES] > 0)
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 5016
ADDP4
INDIRI4
CNSTI4 0
LEI4 $650
ADDRLP4 24
INDIRP4
CNSTI4 5060
ADDP4
INDIRI4
CNSTI4 0
LEI4 $650
line 1266
;1266:		return WEAPONINDEX_PROXLAUNCHER;
CNSTI4 12
RETI4
ADDRGP4 $637
JUMPV
LABELV $650
line 1267
;1267:	else if (bs->inventory[INVENTORY_GRENADELAUNCHER] > 0 && bs->inventory[INVENTORY_GRENADES] > 0)
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 4980
ADDP4
INDIRI4
CNSTI4 0
LEI4 $652
ADDRLP4 28
INDIRP4
CNSTI4 5032
ADDP4
INDIRI4
CNSTI4 0
LEI4 $652
line 1268
;1268:		return WEAPONINDEX_GRENADE_LAUNCHER;
CNSTI4 4
RETI4
ADDRGP4 $637
JUMPV
LABELV $652
line 1269
;1269:	else if (bs->inventory[INVENTORY_RAILGUN] > 0 && bs->inventory[INVENTORY_SLUGS] > 0)
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 4992
ADDP4
INDIRI4
CNSTI4 0
LEI4 $654
ADDRLP4 32
INDIRP4
CNSTI4 5048
ADDP4
INDIRI4
CNSTI4 0
LEI4 $654
line 1270
;1270:		return WEAPONINDEX_RAILGUN;
CNSTI4 7
RETI4
ADDRGP4 $637
JUMPV
LABELV $654
line 1271
;1271:	else if (bs->inventory[INVENTORY_ROCKETLAUNCHER] > 0 && bs->inventory[INVENTORY_ROCKETS] > 0)
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 4984
ADDP4
INDIRI4
CNSTI4 0
LEI4 $656
ADDRLP4 36
INDIRP4
CNSTI4 5044
ADDP4
INDIRI4
CNSTI4 0
LEI4 $656
line 1272
;1272:		return WEAPONINDEX_ROCKET_LAUNCHER;
CNSTI4 5
RETI4
ADDRGP4 $637
JUMPV
LABELV $656
line 1273
;1273:	else if (bs->inventory[INVENTORY_BFG10K] > 0 && bs->inventory[INVENTORY_BFGAMMO] > 0)
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 5004
ADDP4
INDIRI4
CNSTI4 0
LEI4 $658
ADDRLP4 40
INDIRP4
CNSTI4 5052
ADDP4
INDIRI4
CNSTI4 0
LEI4 $658
line 1274
;1274:		return WEAPONINDEX_BFG;
CNSTI4 9
RETI4
ADDRGP4 $637
JUMPV
LABELV $658
line 1275
;1275:	else {
line 1276
;1276:		return -1;
CNSTI4 -1
RETI4
LABELV $637
endproc BotSelectActivateWeapon 44 0
export BotClearPath
proc BotClearPath 360 28
line 1287
;1277:	}
;1278:}
;1279:
;1280:/*
;1281:==================
;1282:BotClearPath
;1283:
;1284: try to deactivate obstacles like proximity mines on the bot's path
;1285:==================
;1286:*/
;1287:void BotClearPath(bot_state_t *bs, bot_moveresult_t *moveresult) {
line 1295
;1288:	int i, bestmine;
;1289:	float dist, bestdist;
;1290:	vec3_t target, dir;
;1291:	bsp_trace_t bsptrace;
;1292:	entityState_t state;
;1293:
;1294:	// if there is a dead body wearing kamikze nearby
;1295:	if (bs->kamikazebody) {
ADDRFP4 0
INDIRP4
CNSTI4 6256
ADDP4
INDIRI4
CNSTI4 0
EQI4 $661
line 1297
;1296:		// if the bot's view angles and weapon are not used for movement
;1297:		if ( !(moveresult->flags & (MOVERESULT_MOVEMENTVIEW | MOVERESULT_MOVEMENTWEAPON)) ) {
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 17
BANDI4
CNSTI4 0
NEI4 $663
line 1299
;1298:			//
;1299:			BotAI_GetEntityState(bs->kamikazebody, &state);
ADDRFP4 0
INDIRP4
CNSTI4 6256
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 BotAI_GetEntityState
CALLI4
pop
line 1300
;1300:			VectorCopy(state.pos.trBase, target);
ADDRLP4 236
ADDRLP4 12+12+12
INDIRB
ASGNB 12
line 1301
;1301:			target[2] += 8;
ADDRLP4 236+8
ADDRLP4 236+8
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 1302
;1302:			VectorSubtract(target, bs->eye, dir);
ADDRLP4 332
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 236
INDIRF4
ADDRLP4 332
INDIRP4
CNSTI4 4936
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 236+4
INDIRF4
ADDRLP4 332
INDIRP4
CNSTI4 4940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 236+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4944
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1303
;1303:			vectoangles(dir, moveresult->ideal_viewangles);
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1305
;1304:			//
;1305:			moveresult->weapon = BotSelectActivateWeapon(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 336
ADDRGP4 BotSelectActivateWeapon
CALLI4
ASGNI4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 336
INDIRI4
ASGNI4
line 1306
;1306:			if (moveresult->weapon == -1) {
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $672
line 1308
;1307:				// FIXME: run away!
;1308:				moveresult->weapon = 0;
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
CNSTI4 0
ASGNI4
line 1309
;1309:			}
LABELV $672
line 1310
;1310:			if (moveresult->weapon) {
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $674
line 1312
;1311:				//
;1312:				moveresult->flags |= MOVERESULT_MOVEMENTWEAPON | MOVERESULT_MOVEMENTVIEW;
ADDRLP4 340
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 340
INDIRP4
ADDRLP4 340
INDIRP4
INDIRI4
CNSTI4 17
BORI4
ASGNI4
line 1314
;1313:				// if holding the right weapon
;1314:				if (bs->cur_ps.weapon == moveresult->weapon) {
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
NEI4 $676
line 1316
;1315:					// if the bot is pretty close with it's aim
;1316:					if (InFieldOfVision(bs->viewangles, 20, moveresult->ideal_viewangles)) {
ADDRFP4 0
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1101004800
ARGF4
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
ARGP4
ADDRLP4 344
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 344
INDIRI4
CNSTI4 0
EQI4 $678
line 1318
;1317:						//
;1318:						BotAI_Trace(&bsptrace, bs->eye, NULL, NULL, target, bs->entitynum, MASK_SHOT);
ADDRLP4 248
ARGP4
ADDRLP4 348
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 348
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 236
ARGP4
ADDRLP4 348
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 1320
;1319:						// if the mine is visible from the current position
;1320:						if (bsptrace.fraction >= 1.0 || bsptrace.ent == state.number) {
ADDRLP4 248+8
INDIRF4
CNSTF4 1065353216
GEF4 $684
ADDRLP4 248+80
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $680
LABELV $684
line 1322
;1321:							// shoot at the mine
;1322:							trap_EA_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Attack
CALLV
pop
line 1323
;1323:						}
LABELV $680
line 1324
;1324:					}
LABELV $678
line 1325
;1325:				}
LABELV $676
line 1326
;1326:			}
LABELV $674
line 1327
;1327:		}
LABELV $663
line 1328
;1328:	}
LABELV $661
line 1329
;1329:	if (moveresult->flags & MOVERESULT_BLOCKEDBYAVOIDSPOT) {
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $685
line 1330
;1330:		bs->blockedbyavoidspot_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 6208
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
ASGNF4
line 1331
;1331:	}
LABELV $685
line 1333
;1332:	// if blocked by an avoid spot and the view angles and weapon are used for movement
;1333:	if (bs->blockedbyavoidspot_time > FloatTime() &&
ADDRFP4 0
INDIRP4
CNSTI4 6208
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $687
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 17
BANDI4
CNSTI4 0
NEI4 $687
line 1334
;1334:		!(moveresult->flags & (MOVERESULT_MOVEMENTVIEW | MOVERESULT_MOVEMENTWEAPON)) ) {
line 1335
;1335:		bestdist = 300;
ADDRLP4 228
CNSTF4 1133903872
ASGNF4
line 1336
;1336:		bestmine = -1;
ADDRLP4 232
CNSTI4 -1
ASGNI4
line 1337
;1337:		for (i = 0; i < bs->numproxmines; i++) {
ADDRLP4 220
CNSTI4 0
ASGNI4
ADDRGP4 $692
JUMPV
LABELV $689
line 1338
;1338:			BotAI_GetEntityState(bs->proxmines[i], &state);
ADDRLP4 220
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 6260
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 BotAI_GetEntityState
CALLI4
pop
line 1339
;1339:			VectorSubtract(state.pos.trBase, bs->origin, dir);
ADDRLP4 332
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12+12+12
INDIRF4
ADDRLP4 332
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 12+12+12+4
INDIRF4
ADDRLP4 332
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 12+12+12+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1340
;1340:			dist = VectorLength(dir);
ADDRLP4 0
ARGP4
ADDRLP4 336
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 224
ADDRLP4 336
INDIRF4
ASGNF4
line 1341
;1341:			if (dist < bestdist) {
ADDRLP4 224
INDIRF4
ADDRLP4 228
INDIRF4
GEF4 $703
line 1342
;1342:				bestdist = dist;
ADDRLP4 228
ADDRLP4 224
INDIRF4
ASGNF4
line 1343
;1343:				bestmine = i;
ADDRLP4 232
ADDRLP4 220
INDIRI4
ASGNI4
line 1344
;1344:			}
LABELV $703
line 1345
;1345:		}
LABELV $690
line 1337
ADDRLP4 220
ADDRLP4 220
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $692
ADDRLP4 220
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6516
ADDP4
INDIRI4
LTI4 $689
line 1346
;1346:		if (bestmine != -1) {
ADDRLP4 232
INDIRI4
CNSTI4 -1
EQI4 $705
line 1352
;1347:			//
;1348:			// state->generic1 == TEAM_RED || state->generic1 == TEAM_BLUE
;1349:			//
;1350:			// deactivate prox mines in the bot's path by shooting
;1351:			// rockets or plasma cells etc. at them
;1352:			BotAI_GetEntityState(bs->proxmines[bestmine], &state);
ADDRLP4 232
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 6260
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 BotAI_GetEntityState
CALLI4
pop
line 1353
;1353:			VectorCopy(state.pos.trBase, target);
ADDRLP4 236
ADDRLP4 12+12+12
INDIRB
ASGNB 12
line 1354
;1354:			target[2] += 2;
ADDRLP4 236+8
ADDRLP4 236+8
INDIRF4
CNSTF4 1073741824
ADDF4
ASGNF4
line 1355
;1355:			VectorSubtract(target, bs->eye, dir);
ADDRLP4 332
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 236
INDIRF4
ADDRLP4 332
INDIRP4
CNSTI4 4936
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 236+4
INDIRF4
ADDRLP4 332
INDIRP4
CNSTI4 4940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 236+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4944
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1356
;1356:			vectoangles(dir, moveresult->ideal_viewangles);
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1358
;1357:			// if the bot has a weapon that does splash damage
;1358:			if (bs->inventory[INVENTORY_PLASMAGUN] > 0 && bs->inventory[INVENTORY_CELLS] > 0)
ADDRLP4 336
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 336
INDIRP4
CNSTI4 4996
ADDP4
INDIRI4
CNSTI4 0
LEI4 $714
ADDRLP4 336
INDIRP4
CNSTI4 5036
ADDP4
INDIRI4
CNSTI4 0
LEI4 $714
line 1359
;1359:				moveresult->weapon = WEAPONINDEX_PLASMAGUN;
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
CNSTI4 8
ASGNI4
ADDRGP4 $715
JUMPV
LABELV $714
line 1360
;1360:			else if (bs->inventory[INVENTORY_ROCKETLAUNCHER] > 0 && bs->inventory[INVENTORY_ROCKETS] > 0)
ADDRLP4 340
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 340
INDIRP4
CNSTI4 4984
ADDP4
INDIRI4
CNSTI4 0
LEI4 $716
ADDRLP4 340
INDIRP4
CNSTI4 5044
ADDP4
INDIRI4
CNSTI4 0
LEI4 $716
line 1361
;1361:				moveresult->weapon = WEAPONINDEX_ROCKET_LAUNCHER;
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
CNSTI4 5
ASGNI4
ADDRGP4 $717
JUMPV
LABELV $716
line 1362
;1362:			else if (bs->inventory[INVENTORY_BFG10K] > 0 && bs->inventory[INVENTORY_BFGAMMO] > 0)
ADDRLP4 344
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 344
INDIRP4
CNSTI4 5004
ADDP4
INDIRI4
CNSTI4 0
LEI4 $718
ADDRLP4 344
INDIRP4
CNSTI4 5052
ADDP4
INDIRI4
CNSTI4 0
LEI4 $718
line 1363
;1363:				moveresult->weapon = WEAPONINDEX_BFG;
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
CNSTI4 9
ASGNI4
ADDRGP4 $719
JUMPV
LABELV $718
line 1364
;1364:			else {
line 1365
;1365:				moveresult->weapon = 0;
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
CNSTI4 0
ASGNI4
line 1366
;1366:			}
LABELV $719
LABELV $717
LABELV $715
line 1367
;1367:			if (moveresult->weapon) {
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $720
line 1369
;1368:				//
;1369:				moveresult->flags |= MOVERESULT_MOVEMENTWEAPON | MOVERESULT_MOVEMENTVIEW;
ADDRLP4 348
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 348
INDIRP4
ADDRLP4 348
INDIRP4
INDIRI4
CNSTI4 17
BORI4
ASGNI4
line 1371
;1370:				// if holding the right weapon
;1371:				if (bs->cur_ps.weapon == moveresult->weapon) {
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
NEI4 $722
line 1373
;1372:					// if the bot is pretty close with it's aim
;1373:					if (InFieldOfVision(bs->viewangles, 20, moveresult->ideal_viewangles)) {
ADDRFP4 0
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1101004800
ARGF4
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
ARGP4
ADDRLP4 352
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 352
INDIRI4
CNSTI4 0
EQI4 $724
line 1375
;1374:						//
;1375:						BotAI_Trace(&bsptrace, bs->eye, NULL, NULL, target, bs->entitynum, MASK_SHOT);
ADDRLP4 248
ARGP4
ADDRLP4 356
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 356
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 236
ARGP4
ADDRLP4 356
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 1377
;1376:						// if the mine is visible from the current position
;1377:						if (bsptrace.fraction >= 1.0 || bsptrace.ent == state.number) {
ADDRLP4 248+8
INDIRF4
CNSTF4 1065353216
GEF4 $730
ADDRLP4 248+80
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $726
LABELV $730
line 1379
;1378:							// shoot at the mine
;1379:							trap_EA_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Attack
CALLV
pop
line 1380
;1380:						}
LABELV $726
line 1381
;1381:					}
LABELV $724
line 1382
;1382:				}
LABELV $722
line 1383
;1383:			}
LABELV $720
line 1384
;1384:		}
LABELV $705
line 1385
;1385:	}
LABELV $687
line 1386
;1386:}
LABELV $660
endproc BotClearPath 360 28
export AIEnter_Seek_ActivateEntity
proc AIEnter_Seek_ActivateEntity 0 16
line 1393
;1387:
;1388:/*
;1389:==================
;1390:AIEnter_Seek_ActivateEntity
;1391:==================
;1392:*/
;1393:void AIEnter_Seek_ActivateEntity(bot_state_t *bs, char *s) {
line 1394
;1394:	BotRecordNodeSwitch(bs, "activate entity", "", s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $732
ARGP4
ADDRGP4 $64
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRecordNodeSwitch
CALLV
pop
line 1395
;1395:	bs->ainode = AINode_Seek_ActivateEntity;
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
ADDRGP4 AINode_Seek_ActivateEntity
ASGNP4
line 1396
;1396:}
LABELV $731
endproc AIEnter_Seek_ActivateEntity 0 16
export AINode_Seek_ActivateEntity
proc AINode_Seek_ActivateEntity 364 28
line 1403
;1397:
;1398:/*
;1399:==================
;1400:AINode_Seek_Activate_Entity
;1401:==================
;1402:*/
;1403:int AINode_Seek_ActivateEntity(bot_state_t *bs) {
line 1411
;1404:	bot_goal_t *goal;
;1405:	vec3_t target, dir, ideal_viewangles;
;1406:	bot_moveresult_t moveresult;
;1407:	int targetvisible;
;1408:	bsp_trace_t bsptrace;
;1409:	aas_entityinfo_t entinfo;
;1410:
;1411:	if (BotIsObserver(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 320
ADDRGP4 BotIsObserver
CALLI4
ASGNI4
ADDRLP4 320
INDIRI4
CNSTI4 0
EQI4 $734
line 1412
;1412:		BotClearActivateGoalStack(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotClearActivateGoalStack
CALLV
pop
line 1413
;1413:		AIEnter_Observer(bs, "active entity: observer");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $736
ARGP4
ADDRGP4 AIEnter_Observer
CALLV
pop
line 1414
;1414:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $733
JUMPV
LABELV $734
line 1417
;1415:	}
;1416:	//if in the intermission
;1417:	if (BotIntermission(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 324
ADDRGP4 BotIntermission
CALLI4
ASGNI4
ADDRLP4 324
INDIRI4
CNSTI4 0
EQI4 $737
line 1418
;1418:		BotClearActivateGoalStack(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotClearActivateGoalStack
CALLV
pop
line 1419
;1419:		AIEnter_Intermission(bs, "activate entity: intermission");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $739
ARGP4
ADDRGP4 AIEnter_Intermission
CALLV
pop
line 1420
;1420:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $733
JUMPV
LABELV $737
line 1423
;1421:	}
;1422:	//respawn if dead
;1423:	if (BotIsDead(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 328
ADDRGP4 BotIsDead
CALLI4
ASGNI4
ADDRLP4 328
INDIRI4
CNSTI4 0
EQI4 $740
line 1424
;1424:		BotClearActivateGoalStack(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotClearActivateGoalStack
CALLV
pop
line 1425
;1425:		AIEnter_Respawn(bs, "activate entity: bot dead");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $742
ARGP4
ADDRGP4 AIEnter_Respawn
CALLV
pop
line 1426
;1426:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $733
JUMPV
LABELV $740
line 1429
;1427:	}
;1428:	//
;1429:	bs->tfl = TFL_DEFAULT;
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
CNSTI4 18616254
ASGNI4
line 1430
;1430:	if (bot_grapple.integer) bs->tfl |= TFL_GRAPPLEHOOK;
ADDRGP4 bot_grapple+12
INDIRI4
CNSTI4 0
EQI4 $743
ADDRLP4 332
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 332
INDIRP4
ADDRLP4 332
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
LABELV $743
line 1432
;1431:	// if in lava or slime the bot should be able to get out
;1432:	if (BotInLavaOrSlime(bs)) bs->tfl |= TFL_LAVA|TFL_SLIME;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 336
ADDRGP4 BotInLavaOrSlime
CALLI4
ASGNI4
ADDRLP4 336
INDIRI4
CNSTI4 0
EQI4 $746
ADDRLP4 340
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 340
INDIRP4
ADDRLP4 340
INDIRP4
INDIRI4
CNSTI4 6291456
BORI4
ASGNI4
LABELV $746
line 1434
;1433:	// map specific code
;1434:	BotMapScripts(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotMapScripts
CALLV
pop
line 1436
;1435:	// no enemy
;1436:	bs->enemy = -1;
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
CNSTI4 -1
ASGNI4
line 1438
;1437:	// if the bot has no activate goal
;1438:	if (!bs->activatestack) {
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $748
line 1439
;1439:		BotClearActivateGoalStack(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotClearActivateGoalStack
CALLV
pop
line 1440
;1440:		AIEnter_Seek_NBG(bs, "activate entity: no goal");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $750
ARGP4
ADDRGP4 AIEnter_Seek_NBG
CALLV
pop
line 1441
;1441:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $733
JUMPV
LABELV $748
line 1444
;1442:	}
;1443:	//
;1444:	goal = &bs->activatestack->goal;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
line 1446
;1445:	// initialize target being visible to false
;1446:	targetvisible = qfalse;
ADDRLP4 68
CNSTI4 0
ASGNI4
line 1448
;1447:	// if the bot has to shoot at a target to activate something
;1448:	if (bs->activatestack->shoot) {
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
EQI4 $751
line 1450
;1449:		//
;1450:		BotAI_Trace(&bsptrace, bs->eye, NULL, NULL, bs->activatestack->target, bs->entitynum, MASK_SHOT);
ADDRLP4 72
ARGP4
ADDRLP4 344
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 344
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 344
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 80
ADDP4
ARGP4
ADDRLP4 344
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 1452
;1451:		// if the shootable entity is visible from the current position
;1452:		if (bsptrace.fraction >= 1.0 || bsptrace.ent == goal->entitynum) {
ADDRLP4 72+8
INDIRF4
CNSTF4 1065353216
GEF4 $757
ADDRLP4 72+80
INDIRI4
ADDRLP4 52
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $753
LABELV $757
line 1453
;1453:			targetvisible = qtrue;
ADDRLP4 68
CNSTI4 1
ASGNI4
line 1455
;1454:			// if holding the right weapon
;1455:			if (bs->cur_ps.weapon == bs->activatestack->weapon) {
ADDRLP4 348
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 348
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRLP4 348
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
NEI4 $758
line 1456
;1456:				VectorSubtract(bs->activatestack->target, bs->eye, dir);
ADDRLP4 352
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 352
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 80
ADDP4
INDIRF4
ADDRLP4 352
INDIRP4
CNSTI4 4936
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56+4
ADDRLP4 352
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 84
ADDP4
INDIRF4
ADDRLP4 352
INDIRP4
CNSTI4 4940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 356
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56+8
ADDRLP4 356
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRF4
ADDRLP4 356
INDIRP4
CNSTI4 4944
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1457
;1457:				vectoangles(dir, ideal_viewangles);
ADDRLP4 56
ARGP4
ADDRLP4 308
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1459
;1458:				// if the bot is pretty close with it's aim
;1459:				if (InFieldOfVision(bs->viewangles, 20, ideal_viewangles)) {
ADDRFP4 0
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1101004800
ARGF4
ADDRLP4 308
ARGP4
ADDRLP4 360
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 360
INDIRI4
CNSTI4 0
EQI4 $762
line 1460
;1460:					trap_EA_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Attack
CALLV
pop
line 1461
;1461:				}
LABELV $762
line 1462
;1462:			}
LABELV $758
line 1463
;1463:		}
LABELV $753
line 1464
;1464:	}
LABELV $751
line 1466
;1465:	// if the shoot target is visible
;1466:	if (targetvisible) {
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $764
line 1468
;1467:		// get the entity info of the entity the bot is shooting at
;1468:		BotEntityInfo(goal->entitynum, &entinfo);
ADDRLP4 52
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRLP4 156
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 1470
;1469:		// if the entity the bot shoots at moved
;1470:		if (!VectorCompare(bs->activatestack->origin, entinfo.origin)) {
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 156+24
ARGP4
ADDRLP4 344
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 344
INDIRI4
CNSTI4 0
NEI4 $766
line 1474
;1471:#ifdef DEBUG
;1472:			BotAI_Print(PRT_MESSAGE, "hit shootable button or trigger\n");
;1473:#endif //DEBUG
;1474:			bs->activatestack->time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 60
ADDP4
CNSTF4 0
ASGNF4
line 1475
;1475:		}
LABELV $766
line 1477
;1476:		// if the activate goal has been activated or the bot takes too long
;1477:		if (bs->activatestack->time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $769
line 1478
;1478:			BotPopFromActivateGoalStack(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotPopFromActivateGoalStack
CALLI4
pop
line 1480
;1479:			// if there are more activate goals on the stack
;1480:			if (bs->activatestack) {
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $771
line 1481
;1481:				bs->activatestack->time = FloatTime() + 10;
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 60
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1092616192
ADDF4
ASGNF4
line 1482
;1482:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $733
JUMPV
LABELV $771
line 1484
;1483:			}
;1484:			AIEnter_Seek_NBG(bs, "activate entity: time out");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $773
ARGP4
ADDRGP4 AIEnter_Seek_NBG
CALLV
pop
line 1485
;1485:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $733
JUMPV
LABELV $769
line 1487
;1486:		}
;1487:		memset(&moveresult, 0, sizeof(bot_moveresult_t));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 52
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1488
;1488:	}
ADDRGP4 $765
JUMPV
LABELV $764
line 1489
;1489:	else {
line 1491
;1490:		// if the bot has no goal
;1491:		if (!goal) { // FIXME: always false?
ADDRLP4 52
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $774
line 1492
;1492:			bs->activatestack->time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 60
ADDP4
CNSTF4 0
ASGNF4
line 1493
;1493:		}
ADDRGP4 $775
JUMPV
LABELV $774
line 1495
;1494:		// if the bot does not have a shoot goal
;1495:		else if (!bs->activatestack->shoot) {
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
NEI4 $776
line 1497
;1496:			//if the bot touches the current goal
;1497:			if (trap_BotTouchingGoal(bs->origin, goal)) {
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 344
ADDRGP4 trap_BotTouchingGoal
CALLI4
ASGNI4
ADDRLP4 344
INDIRI4
CNSTI4 0
EQI4 $778
line 1501
;1498:#ifdef DEBUG
;1499:				BotAI_Print(PRT_MESSAGE, "touched button or trigger\n");
;1500:#endif //DEBUG
;1501:				bs->activatestack->time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 60
ADDP4
CNSTF4 0
ASGNF4
line 1502
;1502:			}
LABELV $778
line 1503
;1503:		}
LABELV $776
LABELV $775
line 1505
;1504:		// if the activate goal has been activated or the bot takes too long
;1505:		if (bs->activatestack->time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $780
line 1506
;1506:			BotPopFromActivateGoalStack(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotPopFromActivateGoalStack
CALLI4
pop
line 1508
;1507:			// if there are more activate goals on the stack
;1508:			if (bs->activatestack) {
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $782
line 1509
;1509:				bs->activatestack->time = FloatTime() + 10;
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 60
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1092616192
ADDF4
ASGNF4
line 1510
;1510:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $733
JUMPV
LABELV $782
line 1512
;1511:			}
;1512:			AIEnter_Seek_NBG(bs, "activate entity: activated");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $784
ARGP4
ADDRGP4 AIEnter_Seek_NBG
CALLV
pop
line 1513
;1513:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $733
JUMPV
LABELV $780
line 1516
;1514:		}
;1515:		//predict obstacles
;1516:		if (BotAIPredictObstacles(bs, goal))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 344
ADDRGP4 BotAIPredictObstacles
CALLI4
ASGNI4
ADDRLP4 344
INDIRI4
CNSTI4 0
EQI4 $785
line 1517
;1517:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $733
JUMPV
LABELV $785
line 1519
;1518:		//initialize the movement state
;1519:		BotSetupForMovement(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetupForMovement
CALLV
pop
line 1521
;1520:		//move towards the goal
;1521:		trap_BotMoveToGoal(&moveresult, bs->ms, goal, bs->tfl);
ADDRLP4 0
ARGP4
ADDRLP4 348
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 348
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 348
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotMoveToGoal
CALLV
pop
line 1523
;1522:		//if the movement failed
;1523:		if (moveresult.failure) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $787
line 1525
;1524:			//reset the avoid reach, otherwise bot is stuck in current area
;1525:			trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 1527
;1526:			//
;1527:			bs->activatestack->time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 60
ADDP4
CNSTF4 0
ASGNF4
line 1528
;1528:		}
LABELV $787
line 1530
;1529:		//check if the bot is blocked
;1530:		BotAIBlocked(bs, &moveresult, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotAIBlocked
CALLV
pop
line 1531
;1531:	}
LABELV $765
line 1533
;1532:	//
;1533:	BotClearPath(bs, &moveresult);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotClearPath
CALLV
pop
line 1535
;1534:	// if the bot has to shoot to activate
;1535:	if (bs->activatestack->shoot) {
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
EQI4 $789
line 1537
;1536:		// if the view angles aren't yet used for the movement
;1537:		if (!(moveresult.flags & MOVERESULT_MOVEMENTVIEW)) {
ADDRLP4 0+20
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $791
line 1538
;1538:			VectorSubtract(bs->activatestack->target, bs->eye, dir);
ADDRLP4 344
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 344
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 80
ADDP4
INDIRF4
ADDRLP4 344
INDIRP4
CNSTI4 4936
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56+4
ADDRLP4 344
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 84
ADDP4
INDIRF4
ADDRLP4 344
INDIRP4
CNSTI4 4940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 348
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56+8
ADDRLP4 348
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRF4
ADDRLP4 348
INDIRP4
CNSTI4 4944
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1539
;1539:			vectoangles(dir, moveresult.ideal_viewangles);
ADDRLP4 56
ARGP4
ADDRLP4 0+40
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1540
;1540:			moveresult.flags |= MOVERESULT_MOVEMENTVIEW;
ADDRLP4 0+20
ADDRLP4 0+20
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 1541
;1541:		}
LABELV $791
line 1543
;1542:		// if there's no weapon yet used for the movement
;1543:		if (!(moveresult.flags & MOVERESULT_MOVEMENTWEAPON)) {
ADDRLP4 0+20
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $798
line 1544
;1544:			moveresult.flags |= MOVERESULT_MOVEMENTWEAPON;
ADDRLP4 0+20
ADDRLP4 0+20
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 1546
;1545:			//
;1546:			bs->activatestack->weapon = BotSelectActivateWeapon(bs);
ADDRLP4 344
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 344
INDIRP4
ARGP4
ADDRLP4 348
ADDRGP4 BotSelectActivateWeapon
CALLI4
ASGNI4
ADDRLP4 344
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 348
INDIRI4
ASGNI4
line 1547
;1547:			if (bs->activatestack->weapon == -1) {
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $802
line 1549
;1548:				//FIXME: find a decent weapon first
;1549:				bs->activatestack->weapon = 0;
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 76
ADDP4
CNSTI4 0
ASGNI4
line 1550
;1550:			}
LABELV $802
line 1551
;1551:			moveresult.weapon = bs->activatestack->weapon;
ADDRLP4 0+24
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
ASGNI4
line 1552
;1552:		}
LABELV $798
line 1553
;1553:	}
LABELV $789
line 1555
;1554:	// if the ideal view angles are set for movement
;1555:	if (moveresult.flags & (MOVERESULT_MOVEMENTVIEWSET|MOVERESULT_MOVEMENTVIEW|MOVERESULT_SWIMVIEW)) {
ADDRLP4 0+20
INDIRI4
CNSTI4 11
BANDI4
CNSTI4 0
EQI4 $805
line 1556
;1556:		VectorCopy(moveresult.ideal_viewangles, bs->ideal_viewangles);
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ADDRLP4 0+40
INDIRB
ASGNB 12
line 1557
;1557:	}
ADDRGP4 $806
JUMPV
LABELV $805
line 1559
;1558:	// if waiting for something
;1559:	else if (moveresult.flags & MOVERESULT_WAITING) {
ADDRLP4 0+20
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $809
line 1560
;1560:		if (random() < bs->thinktime * 0.8) {
ADDRLP4 344
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 344
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 4904
ADDP4
INDIRF4
CNSTF4 1061997773
MULF4
GEF4 $810
line 1561
;1561:			BotRoamGoal(bs, target);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
ARGP4
ADDRGP4 BotRoamGoal
CALLV
pop
line 1562
;1562:			VectorSubtract(target, bs->origin, dir);
ADDRLP4 348
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 296
INDIRF4
ADDRLP4 348
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56+4
ADDRLP4 296+4
INDIRF4
ADDRLP4 348
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56+8
ADDRLP4 296+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1563
;1563:			vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 56
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1564
;1564:			bs->ideal_viewangles[2] *= 0.5;
ADDRLP4 352
ADDRFP4 0
INDIRP4
CNSTI4 6584
ADDP4
ASGNP4
ADDRLP4 352
INDIRP4
ADDRLP4 352
INDIRP4
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 1565
;1565:		}
line 1566
;1566:	}
ADDRGP4 $810
JUMPV
LABELV $809
line 1567
;1567:	else if (!(bs->flags & BFL_IDEALVIEWSET)) {
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $818
line 1568
;1568:		if (trap_BotMovementViewTarget(bs->ms, goal, bs->tfl, 300, target)) {
ADDRLP4 344
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 344
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 344
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
CNSTF4 1133903872
ARGF4
ADDRLP4 296
ARGP4
ADDRLP4 348
ADDRGP4 trap_BotMovementViewTarget
CALLI4
ASGNI4
ADDRLP4 348
INDIRI4
CNSTI4 0
EQI4 $820
line 1569
;1569:			VectorSubtract(target, bs->origin, dir);
ADDRLP4 352
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 296
INDIRF4
ADDRLP4 352
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56+4
ADDRLP4 296+4
INDIRF4
ADDRLP4 352
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56+8
ADDRLP4 296+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1570
;1570:			vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 56
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1571
;1571:		}
ADDRGP4 $821
JUMPV
LABELV $820
line 1572
;1572:		else {
line 1573
;1573:			vectoangles(moveresult.movedir, bs->ideal_viewangles);
ADDRLP4 0+28
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1574
;1574:		}
LABELV $821
line 1575
;1575:		bs->ideal_viewangles[2] *= 0.5;
ADDRLP4 352
ADDRFP4 0
INDIRP4
CNSTI4 6584
ADDP4
ASGNP4
ADDRLP4 352
INDIRP4
ADDRLP4 352
INDIRP4
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 1576
;1576:	}
LABELV $818
LABELV $810
LABELV $806
line 1578
;1577:	// if the weapon is used for the bot movement
;1578:	if (moveresult.flags & MOVERESULT_MOVEMENTWEAPON)
ADDRLP4 0+20
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $827
line 1579
;1579:		bs->weaponnum = moveresult.weapon;
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
ADDRLP4 0+24
INDIRI4
ASGNI4
LABELV $827
line 1581
;1580:	// if there is an enemy
;1581:	if (BotFindEnemy(bs, -1)) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 344
ADDRGP4 BotFindEnemy
CALLI4
ASGNI4
ADDRLP4 344
INDIRI4
CNSTI4 0
EQI4 $831
line 1582
;1582:		if (BotWantsToRetreat(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 348
ADDRGP4 BotWantsToRetreat
CALLI4
ASGNI4
ADDRLP4 348
INDIRI4
CNSTI4 0
EQI4 $833
line 1584
;1583:			//keep the current long term goal and retreat
;1584:			AIEnter_Battle_NBG(bs, "activate entity: found enemy");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $835
ARGP4
ADDRGP4 AIEnter_Battle_NBG
CALLV
pop
line 1585
;1585:		}
ADDRGP4 $834
JUMPV
LABELV $833
line 1586
;1586:		else {
line 1587
;1587:			trap_BotResetLastAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetLastAvoidReach
CALLV
pop
line 1589
;1588:			//empty the goal stack
;1589:			trap_BotEmptyGoalStack(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotEmptyGoalStack
CALLV
pop
line 1591
;1590:			//go fight
;1591:			AIEnter_Battle_Fight(bs, "activate entity: found enemy");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $835
ARGP4
ADDRGP4 AIEnter_Battle_Fight
CALLV
pop
line 1592
;1592:		}
LABELV $834
line 1593
;1593:		BotClearActivateGoalStack(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotClearActivateGoalStack
CALLV
pop
line 1594
;1594:	}
LABELV $831
line 1595
;1595:	return qtrue;
CNSTI4 1
RETI4
LABELV $733
endproc AINode_Seek_ActivateEntity 364 28
export AIEnter_Seek_NBG
proc AIEnter_Seek_NBG 204 16
line 1603
;1596:}
;1597:
;1598:/*
;1599:==================
;1600:AIEnter_Seek_NBG
;1601:==================
;1602:*/
;1603:void AIEnter_Seek_NBG(bot_state_t *bs, char *s) {
line 1607
;1604:	bot_goal_t goal;
;1605:	char buf[144];
;1606:
;1607:	if (trap_BotGetTopGoal(bs->gs, &goal)) {
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 200
ADDRGP4 trap_BotGetTopGoal
CALLI4
ASGNI4
ADDRLP4 200
INDIRI4
CNSTI4 0
EQI4 $837
line 1608
;1608:		trap_BotGoalName(goal.number, buf, 144);
ADDRLP4 0+44
INDIRI4
ARGI4
ADDRLP4 56
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 1609
;1609:		BotRecordNodeSwitch(bs, "seek NBG", buf, s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $840
ARGP4
ADDRLP4 56
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRecordNodeSwitch
CALLV
pop
line 1610
;1610:	}
ADDRGP4 $838
JUMPV
LABELV $837
line 1611
;1611:	else {
line 1612
;1612:		BotRecordNodeSwitch(bs, "seek NBG", "no goal", s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $840
ARGP4
ADDRGP4 $841
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRecordNodeSwitch
CALLV
pop
line 1613
;1613:	}
LABELV $838
line 1614
;1614:	bs->ainode = AINode_Seek_NBG;
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
ADDRGP4 AINode_Seek_NBG
ASGNP4
line 1615
;1615:}
LABELV $836
endproc AIEnter_Seek_NBG 204 16
export AINode_Seek_NBG
proc AINode_Seek_NBG 192 20
line 1622
;1616:
;1617:/*
;1618:==================
;1619:AINode_Seek_NBG
;1620:==================
;1621:*/
;1622:int AINode_Seek_NBG(bot_state_t *bs) {
line 1627
;1623:	bot_goal_t goal;
;1624:	vec3_t target, dir;
;1625:	bot_moveresult_t moveresult;
;1626:
;1627:	if (BotIsObserver(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 132
ADDRGP4 BotIsObserver
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 0
EQI4 $843
line 1628
;1628:		AIEnter_Observer(bs, "seek nbg: observer");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $845
ARGP4
ADDRGP4 AIEnter_Observer
CALLV
pop
line 1629
;1629:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $842
JUMPV
LABELV $843
line 1632
;1630:	}
;1631:	//if in the intermission
;1632:	if (BotIntermission(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 136
ADDRGP4 BotIntermission
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 0
EQI4 $846
line 1633
;1633:		AIEnter_Intermission(bs, "seek nbg: intermision");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $848
ARGP4
ADDRGP4 AIEnter_Intermission
CALLV
pop
line 1634
;1634:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $842
JUMPV
LABELV $846
line 1637
;1635:	}
;1636:	//respawn if dead
;1637:	if (BotIsDead(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotIsDead
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $849
line 1638
;1638:		AIEnter_Respawn(bs, "seek nbg: bot dead");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $851
ARGP4
ADDRGP4 AIEnter_Respawn
CALLV
pop
line 1639
;1639:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $842
JUMPV
LABELV $849
line 1642
;1640:	}
;1641:	//
;1642:	bs->tfl = TFL_DEFAULT;
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
CNSTI4 18616254
ASGNI4
line 1643
;1643:	if (bot_grapple.integer) bs->tfl |= TFL_GRAPPLEHOOK;
ADDRGP4 bot_grapple+12
INDIRI4
CNSTI4 0
EQI4 $852
ADDRLP4 144
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 144
INDIRP4
ADDRLP4 144
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
LABELV $852
line 1645
;1644:	//if in lava or slime the bot should be able to get out
;1645:	if (BotInLavaOrSlime(bs)) bs->tfl |= TFL_LAVA|TFL_SLIME;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 148
ADDRGP4 BotInLavaOrSlime
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $855
ADDRLP4 152
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRI4
CNSTI4 6291456
BORI4
ASGNI4
LABELV $855
line 1647
;1646:	//
;1647:	if (BotCanAndWantsToRocketJump(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 156
ADDRGP4 BotCanAndWantsToRocketJump
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 0
EQI4 $857
line 1648
;1648:		bs->tfl |= TFL_ROCKETJUMP;
ADDRLP4 160
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 160
INDIRP4
ADDRLP4 160
INDIRP4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 1649
;1649:	}
LABELV $857
line 1651
;1650:	//map specific code
;1651:	BotMapScripts(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotMapScripts
CALLV
pop
line 1653
;1652:	//no enemy
;1653:	bs->enemy = -1;
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
CNSTI4 -1
ASGNI4
line 1655
;1654:	//if the bot has no goal
;1655:	if (!trap_BotGetTopGoal(bs->gs, &goal)) bs->nbg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 160
ADDRGP4 trap_BotGetTopGoal
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
NEI4 $859
ADDRFP4 0
INDIRP4
CNSTI4 6072
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 $860
JUMPV
LABELV $859
line 1657
;1656:	//if the bot touches the current goal
;1657:	else if (BotReachedGoal(bs, &goal)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 164
ADDRGP4 BotReachedGoal
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
EQI4 $861
line 1658
;1658:		BotChooseWeapon(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotChooseWeapon
CALLV
pop
line 1659
;1659:		bs->nbg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6072
ADDP4
CNSTF4 0
ASGNF4
line 1660
;1660:	}
LABELV $861
LABELV $860
line 1662
;1661:	//
;1662:	if (bs->nbg_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6072
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $863
line 1664
;1663:		//pop the current goal from the stack
;1664:		trap_BotPopGoal(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotPopGoal
CALLV
pop
line 1667
;1665:		//check for new nearby items right away
;1666:		//NOTE: we canNOT reset the check_time to zero because it would create an endless loop of node switches
;1667:		bs->check_time = FloatTime() + 0.05;
ADDRFP4 0
INDIRP4
CNSTI4 6092
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1028443341
ADDF4
ASGNF4
line 1669
;1668:		//go back to seek ltg
;1669:		AIEnter_Seek_LTG(bs, "seek nbg: time out");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $865
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 1670
;1670:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $842
JUMPV
LABELV $863
line 1673
;1671:	}
;1672:	//predict obstacles
;1673:	if (BotAIPredictObstacles(bs, &goal))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 168
ADDRGP4 BotAIPredictObstacles
CALLI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 0
EQI4 $866
line 1674
;1674:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $842
JUMPV
LABELV $866
line 1676
;1675:	//initialize the movement state
;1676:	BotSetupForMovement(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetupForMovement
CALLV
pop
line 1678
;1677:	//move towards the goal
;1678:	trap_BotMoveToGoal(&moveresult, bs->ms, &goal, bs->tfl);
ADDRLP4 0
ARGP4
ADDRLP4 172
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 172
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 172
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotMoveToGoal
CALLV
pop
line 1680
;1679:	//if the movement failed
;1680:	if (moveresult.failure) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $868
line 1682
;1681:		//reset the avoid reach, otherwise bot is stuck in current area
;1682:		trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 1683
;1683:		bs->nbg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6072
ADDP4
CNSTF4 0
ASGNF4
line 1684
;1684:	}
LABELV $868
line 1686
;1685:	//check if the bot is blocked
;1686:	BotAIBlocked(bs, &moveresult, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotAIBlocked
CALLV
pop
line 1688
;1687:	//
;1688:	BotClearPath(bs, &moveresult);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotClearPath
CALLV
pop
line 1690
;1689:	//if the viewangles are used for the movement
;1690:	if (moveresult.flags & (MOVERESULT_MOVEMENTVIEWSET|MOVERESULT_MOVEMENTVIEW|MOVERESULT_SWIMVIEW)) {
ADDRLP4 0+20
INDIRI4
CNSTI4 11
BANDI4
CNSTI4 0
EQI4 $870
line 1691
;1691:		VectorCopy(moveresult.ideal_viewangles, bs->ideal_viewangles);
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ADDRLP4 0+40
INDIRB
ASGNB 12
line 1692
;1692:	}
ADDRGP4 $871
JUMPV
LABELV $870
line 1694
;1693:	//if waiting for something
;1694:	else if (moveresult.flags & MOVERESULT_WAITING) {
ADDRLP4 0+20
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $874
line 1695
;1695:		if (random() < bs->thinktime * 0.8) {
ADDRLP4 176
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 4904
ADDP4
INDIRF4
CNSTF4 1061997773
MULF4
GEF4 $875
line 1696
;1696:			BotRoamGoal(bs, target);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 108
ARGP4
ADDRGP4 BotRoamGoal
CALLV
pop
line 1697
;1697:			VectorSubtract(target, bs->origin, dir);
ADDRLP4 180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 120
ADDRLP4 108
INDIRF4
ADDRLP4 180
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 120+4
ADDRLP4 108+4
INDIRF4
ADDRLP4 180
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 120+8
ADDRLP4 108+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1698
;1698:			vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 120
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1699
;1699:			bs->ideal_viewangles[2] *= 0.5;
ADDRLP4 184
ADDRFP4 0
INDIRP4
CNSTI4 6584
ADDP4
ASGNP4
ADDRLP4 184
INDIRP4
ADDRLP4 184
INDIRP4
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 1700
;1700:		}
line 1701
;1701:	}
ADDRGP4 $875
JUMPV
LABELV $874
line 1702
;1702:	else if (!(bs->flags & BFL_IDEALVIEWSET)) {
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $883
line 1703
;1703:		if (!trap_BotGetSecondGoal(bs->gs, &goal)) trap_BotGetTopGoal(bs->gs, &goal);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 176
ADDRGP4 trap_BotGetSecondGoal
CALLI4
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 0
NEI4 $885
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRGP4 trap_BotGetTopGoal
CALLI4
pop
LABELV $885
line 1704
;1704:		if (trap_BotMovementViewTarget(bs->ms, &goal, bs->tfl, 300, target)) {
ADDRLP4 180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 180
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 180
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
CNSTF4 1133903872
ARGF4
ADDRLP4 108
ARGP4
ADDRLP4 184
ADDRGP4 trap_BotMovementViewTarget
CALLI4
ASGNI4
ADDRLP4 184
INDIRI4
CNSTI4 0
EQI4 $887
line 1705
;1705:			VectorSubtract(target, bs->origin, dir);
ADDRLP4 188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 120
ADDRLP4 108
INDIRF4
ADDRLP4 188
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 120+4
ADDRLP4 108+4
INDIRF4
ADDRLP4 188
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 120+8
ADDRLP4 108+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1706
;1706:			vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 120
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1707
;1707:		}
ADDRGP4 $888
JUMPV
LABELV $887
line 1709
;1708:		//FIXME: look at cluster portals?
;1709:		else vectoangles(moveresult.movedir, bs->ideal_viewangles);
ADDRLP4 0+28
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
LABELV $888
line 1710
;1710:		bs->ideal_viewangles[2] *= 0.5;
ADDRLP4 188
ADDRFP4 0
INDIRP4
CNSTI4 6584
ADDP4
ASGNP4
ADDRLP4 188
INDIRP4
ADDRLP4 188
INDIRP4
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 1711
;1711:	}
LABELV $883
LABELV $875
LABELV $871
line 1713
;1712:	//if the weapon is used for the bot movement
;1713:	if (moveresult.flags & MOVERESULT_MOVEMENTWEAPON) bs->weaponnum = moveresult.weapon;
ADDRLP4 0+20
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $894
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
ADDRLP4 0+24
INDIRI4
ASGNI4
LABELV $894
line 1715
;1714:	//if there is an enemy
;1715:	if (BotFindEnemy(bs, -1)) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 176
ADDRGP4 BotFindEnemy
CALLI4
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 0
EQI4 $898
line 1716
;1716:		if (BotWantsToRetreat(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 180
ADDRGP4 BotWantsToRetreat
CALLI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 0
EQI4 $900
line 1718
;1717:			//keep the current long term goal and retreat
;1718:			AIEnter_Battle_NBG(bs, "seek nbg: found enemy");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $902
ARGP4
ADDRGP4 AIEnter_Battle_NBG
CALLV
pop
line 1719
;1719:		}
ADDRGP4 $901
JUMPV
LABELV $900
line 1720
;1720:		else {
line 1721
;1721:			trap_BotResetLastAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetLastAvoidReach
CALLV
pop
line 1723
;1722:			//empty the goal stack
;1723:			trap_BotEmptyGoalStack(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotEmptyGoalStack
CALLV
pop
line 1725
;1724:			//go fight
;1725:			AIEnter_Battle_Fight(bs, "seek nbg: found enemy");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $902
ARGP4
ADDRGP4 AIEnter_Battle_Fight
CALLV
pop
line 1726
;1726:		}
LABELV $901
line 1727
;1727:	}
LABELV $898
line 1728
;1728:	return qtrue;
CNSTI4 1
RETI4
LABELV $842
endproc AINode_Seek_NBG 192 20
export AIEnter_Seek_LTG
proc AIEnter_Seek_LTG 204 16
line 1736
;1729:}
;1730:
;1731:/*
;1732:==================
;1733:AIEnter_Seek_LTG
;1734:==================
;1735:*/
;1736:void AIEnter_Seek_LTG(bot_state_t *bs, char *s) {
line 1740
;1737:	bot_goal_t goal;
;1738:	char buf[144];
;1739:
;1740:	if (trap_BotGetTopGoal(bs->gs, &goal)) {
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 200
ADDRGP4 trap_BotGetTopGoal
CALLI4
ASGNI4
ADDRLP4 200
INDIRI4
CNSTI4 0
EQI4 $904
line 1741
;1741:		trap_BotGoalName(goal.number, buf, 144);
ADDRLP4 0+44
INDIRI4
ARGI4
ADDRLP4 56
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 1742
;1742:		BotRecordNodeSwitch(bs, "seek LTG", buf, s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $907
ARGP4
ADDRLP4 56
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRecordNodeSwitch
CALLV
pop
line 1743
;1743:	}
ADDRGP4 $905
JUMPV
LABELV $904
line 1744
;1744:	else {
line 1745
;1745:		BotRecordNodeSwitch(bs, "seek LTG", "no goal", s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $907
ARGP4
ADDRGP4 $841
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRecordNodeSwitch
CALLV
pop
line 1746
;1746:	}
LABELV $905
line 1747
;1747:	bs->ainode = AINode_Seek_LTG;
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
ADDRGP4 AINode_Seek_LTG
ASGNP4
line 1748
;1748:}
LABELV $903
endproc AIEnter_Seek_LTG 204 16
export AINode_Seek_LTG
proc AINode_Seek_LTG 212 20
line 1756
;1749:
;1750:/*
;1751:==================
;1752:AINode_Seek_LTG
;1753:==================
;1754:*/
;1755:int AINode_Seek_LTG(bot_state_t *bs)
;1756:{
line 1764
;1757:	bot_goal_t goal;
;1758:	vec3_t target, dir;
;1759:	bot_moveresult_t moveresult;
;1760:	int range;
;1761:	//char buf[128];
;1762:	//bot_goal_t tmpgoal;
;1763:
;1764:	if (BotIsObserver(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 136
ADDRGP4 BotIsObserver
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 0
EQI4 $909
line 1765
;1765:		AIEnter_Observer(bs, "seek ltg: observer");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $911
ARGP4
ADDRGP4 AIEnter_Observer
CALLV
pop
line 1766
;1766:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $908
JUMPV
LABELV $909
line 1769
;1767:	}
;1768:	//if in the intermission
;1769:	if (BotIntermission(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotIntermission
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $912
line 1770
;1770:		AIEnter_Intermission(bs, "seek ltg: intermission");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $914
ARGP4
ADDRGP4 AIEnter_Intermission
CALLV
pop
line 1771
;1771:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $908
JUMPV
LABELV $912
line 1774
;1772:	}
;1773:	//respawn if dead
;1774:	if (BotIsDead(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 BotIsDead
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $915
line 1775
;1775:		AIEnter_Respawn(bs, "seek ltg: bot dead");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $917
ARGP4
ADDRGP4 AIEnter_Respawn
CALLV
pop
line 1776
;1776:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $908
JUMPV
LABELV $915
line 1779
;1777:	}
;1778:	//
;1779:	if (BotChat_Random(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 148
ADDRGP4 BotChat_Random
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $918
line 1780
;1780:		bs->stand_time = FloatTime() + BotChatTime(bs);
ADDRLP4 152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 152
INDIRP4
ARGP4
ADDRLP4 156
ADDRGP4 BotChatTime
CALLF4
ASGNF4
ADDRLP4 152
INDIRP4
CNSTI4 6096
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 156
INDIRF4
ADDF4
ASGNF4
line 1781
;1781:		AIEnter_Stand(bs, "seek ltg: random chat");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $920
ARGP4
ADDRGP4 AIEnter_Stand
CALLV
pop
line 1782
;1782:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $908
JUMPV
LABELV $918
line 1785
;1783:	}
;1784:	//
;1785:	bs->tfl = TFL_DEFAULT;
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
CNSTI4 18616254
ASGNI4
line 1786
;1786:	if (bot_grapple.integer) bs->tfl |= TFL_GRAPPLEHOOK;
ADDRGP4 bot_grapple+12
INDIRI4
CNSTI4 0
EQI4 $921
ADDRLP4 152
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
LABELV $921
line 1788
;1787:	//if in lava or slime the bot should be able to get out
;1788:	if (BotInLavaOrSlime(bs)) bs->tfl |= TFL_LAVA|TFL_SLIME;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 156
ADDRGP4 BotInLavaOrSlime
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 0
EQI4 $924
ADDRLP4 160
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 160
INDIRP4
ADDRLP4 160
INDIRP4
INDIRI4
CNSTI4 6291456
BORI4
ASGNI4
LABELV $924
line 1790
;1789:	//
;1790:	if (BotCanAndWantsToRocketJump(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 164
ADDRGP4 BotCanAndWantsToRocketJump
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
EQI4 $926
line 1791
;1791:		bs->tfl |= TFL_ROCKETJUMP;
ADDRLP4 168
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 168
INDIRP4
ADDRLP4 168
INDIRP4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 1792
;1792:	}
LABELV $926
line 1794
;1793:	//map specific code
;1794:	BotMapScripts(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotMapScripts
CALLV
pop
line 1796
;1795:	//no enemy
;1796:	bs->enemy = -1;
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
CNSTI4 -1
ASGNI4
line 1798
;1797:	//
;1798:	if (bs->killedenemy_time > FloatTime() - 2) {
ADDRFP4 0
INDIRP4
CNSTI4 6168
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
SUBF4
LEF4 $928
line 1799
;1799:		if (random() < bs->thinktime * 1) {
ADDRLP4 168
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 4904
ADDP4
INDIRF4
GEF4 $930
line 1800
;1800:			trap_EA_Gesture(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Gesture
CALLV
pop
line 1801
;1801:		}
LABELV $930
line 1802
;1802:	}
LABELV $928
line 1804
;1803:	//if there is an enemy
;1804:	if (BotFindEnemy(bs, -1)) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 168
ADDRGP4 BotFindEnemy
CALLI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 0
EQI4 $932
line 1805
;1805:		if (BotWantsToRetreat(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 172
ADDRGP4 BotWantsToRetreat
CALLI4
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 0
EQI4 $934
line 1807
;1806:			//keep the current long term goal and retreat
;1807:			AIEnter_Battle_Retreat(bs, "seek ltg: found enemy");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $936
ARGP4
ADDRGP4 AIEnter_Battle_Retreat
CALLV
pop
line 1808
;1808:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $908
JUMPV
LABELV $934
line 1810
;1809:		}
;1810:		else {
line 1811
;1811:			trap_BotResetLastAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetLastAvoidReach
CALLV
pop
line 1813
;1812:			//empty the goal stack
;1813:			trap_BotEmptyGoalStack(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotEmptyGoalStack
CALLV
pop
line 1815
;1814:			//go fight
;1815:			AIEnter_Battle_Fight(bs, "seek ltg: found enemy");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $936
ARGP4
ADDRGP4 AIEnter_Battle_Fight
CALLV
pop
line 1816
;1816:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $908
JUMPV
LABELV $932
line 1820
;1817:		}
;1818:	}
;1819:	//
;1820:	BotTeamGoals(bs, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotTeamGoals
CALLV
pop
line 1822
;1821:	//get the current long term goal
;1822:	if (!BotLongTermGoal(bs, bs->tfl, qfalse, &goal)) {
ADDRLP4 172
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 172
INDIRP4
ARGP4
ADDRLP4 172
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 176
ADDRGP4 BotLongTermGoal
CALLI4
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 0
NEI4 $937
line 1823
;1823:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $908
JUMPV
LABELV $937
line 1826
;1824:	}
;1825:	//check for nearby goals periodicly
;1826:	if (bs->check_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6092
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $939
line 1827
;1827:		bs->check_time = FloatTime() + 0.5;
ADDRFP4 0
INDIRP4
CNSTI4 6092
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1056964608
ADDF4
ASGNF4
line 1829
;1828:		//check if the bot wants to camp
;1829:		BotWantsToCamp(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotWantsToCamp
CALLI4
pop
line 1831
;1830:		//
;1831:		if (bs->ltgtype == LTG_DEFENDKEYAREA) range = 400;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 3
NEI4 $941
ADDRLP4 108
CNSTI4 400
ASGNI4
ADDRGP4 $942
JUMPV
LABELV $941
line 1832
;1832:		else range = 150;
ADDRLP4 108
CNSTI4 150
ASGNI4
LABELV $942
line 1835
;1833:		//
;1834:#ifdef CTF
;1835:		if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $943
line 1837
;1836:			//if carrying a flag the bot shouldn't be distracted too much
;1837:			if (BotCTFCarryingFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 180
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 0
EQI4 $944
line 1838
;1838:				range = 50;
ADDRLP4 108
CNSTI4 50
ASGNI4
line 1839
;1839:		}
ADDRGP4 $944
JUMPV
LABELV $943
line 1841
;1840:#endif //CTF
;1841:		else if (gametype == GT_ONEFLAG) {
ADDRGP4 gametype
INDIRI4
CNSTI4 5
NEI4 $947
line 1842
;1842:			if (Bot1FCTFCarryingFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 180
ADDRGP4 Bot1FCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 0
EQI4 $948
line 1843
;1843:				range = 50;
ADDRLP4 108
CNSTI4 50
ASGNI4
line 1844
;1844:		}
ADDRGP4 $948
JUMPV
LABELV $947
line 1845
;1845:		else if (gametype == GT_HARVESTER) {
ADDRGP4 gametype
INDIRI4
CNSTI4 7
NEI4 $951
line 1846
;1846:			if (BotHarvesterCarryingCubes(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 180
ADDRGP4 BotHarvesterCarryingCubes
CALLI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 0
EQI4 $953
line 1847
;1847:				range = 80;
ADDRLP4 108
CNSTI4 80
ASGNI4
LABELV $953
line 1848
;1848:		}
LABELV $951
LABELV $948
LABELV $944
line 1850
;1849:		//
;1850:		if (BotNearbyGoal(bs, bs->tfl, &goal, range)) {
ADDRLP4 180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 180
INDIRP4
ARGP4
ADDRLP4 180
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 108
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 184
ADDRGP4 BotNearbyGoal
CALLI4
ASGNI4
ADDRLP4 184
INDIRI4
CNSTI4 0
EQI4 $955
line 1851
;1851:			trap_BotResetLastAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetLastAvoidReach
CALLV
pop
line 1857
;1852:			//get the goal at the top of the stack
;1853:			//trap_BotGetTopGoal(bs->gs, &tmpgoal);
;1854:			//trap_BotGoalName(tmpgoal.number, buf, 144);
;1855:			//BotAI_Print(PRT_MESSAGE, "new nearby goal %s\n", buf);
;1856:			//time the bot gets to pick up the nearby goal item
;1857:			bs->nbg_time = FloatTime() + 4 + range * 0.01;
ADDRFP4 0
INDIRP4
CNSTI4 6072
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1082130432
ADDF4
ADDRLP4 108
INDIRI4
CVIF4 4
CNSTF4 1008981770
MULF4
ADDF4
ASGNF4
line 1858
;1858:			AIEnter_Seek_NBG(bs, "ltg seek: nbg");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $957
ARGP4
ADDRGP4 AIEnter_Seek_NBG
CALLV
pop
line 1859
;1859:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $908
JUMPV
LABELV $955
line 1861
;1860:		}
;1861:	}
LABELV $939
line 1863
;1862:	//predict obstacles
;1863:	if (BotAIPredictObstacles(bs, &goal))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 180
ADDRGP4 BotAIPredictObstacles
CALLI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 0
EQI4 $958
line 1864
;1864:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $908
JUMPV
LABELV $958
line 1866
;1865:	//initialize the movement state
;1866:	BotSetupForMovement(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetupForMovement
CALLV
pop
line 1868
;1867:	//move towards the goal
;1868:	trap_BotMoveToGoal(&moveresult, bs->ms, &goal, bs->tfl);
ADDRLP4 0
ARGP4
ADDRLP4 184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 184
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 184
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotMoveToGoal
CALLV
pop
line 1870
;1869:	//if the movement failed
;1870:	if (moveresult.failure) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $960
line 1872
;1871:		//reset the avoid reach, otherwise bot is stuck in current area
;1872:		trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 1874
;1873:		//BotAI_Print(PRT_MESSAGE, "movement failure %d\n", moveresult.traveltype);
;1874:		bs->ltg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6068
ADDP4
CNSTF4 0
ASGNF4
line 1875
;1875:	}
LABELV $960
line 1877
;1876:	//
;1877:	BotAIBlocked(bs, &moveresult, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotAIBlocked
CALLV
pop
line 1879
;1878:	//
;1879:	BotClearPath(bs, &moveresult);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotClearPath
CALLV
pop
line 1881
;1880:	//if the viewangles are used for the movement
;1881:	if (moveresult.flags & (MOVERESULT_MOVEMENTVIEWSET|MOVERESULT_MOVEMENTVIEW|MOVERESULT_SWIMVIEW)) {
ADDRLP4 0+20
INDIRI4
CNSTI4 11
BANDI4
CNSTI4 0
EQI4 $962
line 1882
;1882:		VectorCopy(moveresult.ideal_viewangles, bs->ideal_viewangles);
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ADDRLP4 0+40
INDIRB
ASGNB 12
line 1883
;1883:	}
ADDRGP4 $963
JUMPV
LABELV $962
line 1885
;1884:	//if waiting for something
;1885:	else if (moveresult.flags & MOVERESULT_WAITING) {
ADDRLP4 0+20
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $966
line 1886
;1886:		if (random() < bs->thinktime * 0.8) {
ADDRLP4 188
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 188
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 4904
ADDP4
INDIRF4
CNSTF4 1061997773
MULF4
GEF4 $967
line 1887
;1887:			BotRoamGoal(bs, target);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 112
ARGP4
ADDRGP4 BotRoamGoal
CALLV
pop
line 1888
;1888:			VectorSubtract(target, bs->origin, dir);
ADDRLP4 192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 124
ADDRLP4 112
INDIRF4
ADDRLP4 192
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 124+4
ADDRLP4 112+4
INDIRF4
ADDRLP4 192
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 124+8
ADDRLP4 112+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1889
;1889:			vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 124
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1890
;1890:			bs->ideal_viewangles[2] *= 0.5;
ADDRLP4 196
ADDRFP4 0
INDIRP4
CNSTI4 6584
ADDP4
ASGNP4
ADDRLP4 196
INDIRP4
ADDRLP4 196
INDIRP4
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 1891
;1891:		}
line 1892
;1892:	}
ADDRGP4 $967
JUMPV
LABELV $966
line 1893
;1893:	else if (!(bs->flags & BFL_IDEALVIEWSET)) {
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $975
line 1894
;1894:		if (trap_BotMovementViewTarget(bs->ms, &goal, bs->tfl, 300, target)) {
ADDRLP4 188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 188
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 188
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
CNSTF4 1133903872
ARGF4
ADDRLP4 112
ARGP4
ADDRLP4 192
ADDRGP4 trap_BotMovementViewTarget
CALLI4
ASGNI4
ADDRLP4 192
INDIRI4
CNSTI4 0
EQI4 $977
line 1895
;1895:			VectorSubtract(target, bs->origin, dir);
ADDRLP4 196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 124
ADDRLP4 112
INDIRF4
ADDRLP4 196
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 124+4
ADDRLP4 112+4
INDIRF4
ADDRLP4 196
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 124+8
ADDRLP4 112+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1896
;1896:			vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 124
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1897
;1897:		}
ADDRGP4 $978
JUMPV
LABELV $977
line 1899
;1898:		//FIXME: look at cluster portals?
;1899:		else if (VectorLengthSquared(moveresult.movedir)) {
ADDRLP4 0+28
ARGP4
ADDRLP4 196
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 196
INDIRF4
CNSTF4 0
EQF4 $983
line 1900
;1900:			vectoangles(moveresult.movedir, bs->ideal_viewangles);
ADDRLP4 0+28
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1901
;1901:		}
ADDRGP4 $984
JUMPV
LABELV $983
line 1902
;1902:		else if (random() < bs->thinktime * 0.8) {
ADDRLP4 200
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 200
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 4904
ADDP4
INDIRF4
CNSTF4 1061997773
MULF4
GEF4 $987
line 1903
;1903:			BotRoamGoal(bs, target);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 112
ARGP4
ADDRGP4 BotRoamGoal
CALLV
pop
line 1904
;1904:			VectorSubtract(target, bs->origin, dir);
ADDRLP4 204
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 124
ADDRLP4 112
INDIRF4
ADDRLP4 204
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 124+4
ADDRLP4 112+4
INDIRF4
ADDRLP4 204
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 124+8
ADDRLP4 112+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1905
;1905:			vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 124
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1906
;1906:			bs->ideal_viewangles[2] *= 0.5;
ADDRLP4 208
ADDRFP4 0
INDIRP4
CNSTI4 6584
ADDP4
ASGNP4
ADDRLP4 208
INDIRP4
ADDRLP4 208
INDIRP4
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 1907
;1907:		}
LABELV $987
LABELV $984
LABELV $978
line 1908
;1908:		bs->ideal_viewangles[2] *= 0.5;
ADDRLP4 204
ADDRFP4 0
INDIRP4
CNSTI4 6584
ADDP4
ASGNP4
ADDRLP4 204
INDIRP4
ADDRLP4 204
INDIRP4
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 1909
;1909:	}
LABELV $975
LABELV $967
LABELV $963
line 1911
;1910:	//if the weapon is used for the bot movement
;1911:	if (moveresult.flags & MOVERESULT_MOVEMENTWEAPON) bs->weaponnum = moveresult.weapon;
ADDRLP4 0+20
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $993
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
ADDRLP4 0+24
INDIRI4
ASGNI4
LABELV $993
line 1913
;1912:	//
;1913:	return qtrue;
CNSTI4 1
RETI4
LABELV $908
endproc AINode_Seek_LTG 212 20
export AIEnter_Battle_Fight
proc AIEnter_Battle_Fight 4 16
line 1921
;1914:}
;1915:
;1916:/*
;1917:==================
;1918:AIEnter_Battle_Fight
;1919:==================
;1920:*/
;1921:void AIEnter_Battle_Fight(bot_state_t *bs, char *s) {
line 1922
;1922:	BotRecordNodeSwitch(bs, "battle fight", "", s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $998
ARGP4
ADDRGP4 $64
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRecordNodeSwitch
CALLV
pop
line 1923
;1923:	trap_BotResetLastAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetLastAvoidReach
CALLV
pop
line 1924
;1924:	bs->ainode = AINode_Battle_Fight;
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
ADDRGP4 AINode_Battle_Fight
ASGNP4
line 1925
;1925:	bs->flags &= ~BFL_FIGHTSUICIDAL;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -65
BANDI4
ASGNI4
line 1926
;1926:}
LABELV $997
endproc AIEnter_Battle_Fight 4 16
export AIEnter_Battle_SuicidalFight
proc AIEnter_Battle_SuicidalFight 4 16
line 1933
;1927:
;1928:/*
;1929:==================
;1930:AIEnter_Battle_SuicidalFight
;1931:==================
;1932:*/
;1933:void AIEnter_Battle_SuicidalFight(bot_state_t *bs, char *s) {
line 1934
;1934:	BotRecordNodeSwitch(bs, "battle fight", "", s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $998
ARGP4
ADDRGP4 $64
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRecordNodeSwitch
CALLV
pop
line 1935
;1935:	trap_BotResetLastAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetLastAvoidReach
CALLV
pop
line 1936
;1936:	bs->ainode = AINode_Battle_Fight;
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
ADDRGP4 AINode_Battle_Fight
ASGNP4
line 1937
;1937:	bs->flags |= BFL_FIGHTSUICIDAL;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 1938
;1938:}
LABELV $999
endproc AIEnter_Battle_SuicidalFight 4 16
export AINode_Battle_Fight
proc AINode_Battle_Fight 300 20
line 1945
;1939:
;1940:/*
;1941:==================
;1942:AINode_Battle_Fight
;1943:==================
;1944:*/
;1945:int AINode_Battle_Fight(bot_state_t *bs) {
line 1951
;1946:	int areanum;
;1947:	vec3_t target;
;1948:	aas_entityinfo_t entinfo;
;1949:	bot_moveresult_t moveresult;
;1950:
;1951:	if (BotIsObserver(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 208
ADDRGP4 BotIsObserver
CALLI4
ASGNI4
ADDRLP4 208
INDIRI4
CNSTI4 0
EQI4 $1001
line 1952
;1952:		AIEnter_Observer(bs, "battle fight: observer");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1003
ARGP4
ADDRGP4 AIEnter_Observer
CALLV
pop
line 1953
;1953:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1000
JUMPV
LABELV $1001
line 1957
;1954:	}
;1955:
;1956:	//if in the intermission
;1957:	if (BotIntermission(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 212
ADDRGP4 BotIntermission
CALLI4
ASGNI4
ADDRLP4 212
INDIRI4
CNSTI4 0
EQI4 $1004
line 1958
;1958:		AIEnter_Intermission(bs, "battle fight: intermission");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1006
ARGP4
ADDRGP4 AIEnter_Intermission
CALLV
pop
line 1959
;1959:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1000
JUMPV
LABELV $1004
line 1962
;1960:	}
;1961:	//respawn if dead
;1962:	if (BotIsDead(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 216
ADDRGP4 BotIsDead
CALLI4
ASGNI4
ADDRLP4 216
INDIRI4
CNSTI4 0
EQI4 $1007
line 1963
;1963:		AIEnter_Respawn(bs, "battle fight: bot dead");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1009
ARGP4
ADDRGP4 AIEnter_Respawn
CALLV
pop
line 1964
;1964:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1000
JUMPV
LABELV $1007
line 1967
;1965:	}
;1966:	//if there is another better enemy
;1967:	if (BotFindEnemy(bs, bs->enemy)) {
ADDRLP4 220
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 220
INDIRP4
ARGP4
ADDRLP4 220
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 224
ADDRGP4 BotFindEnemy
CALLI4
ASGNI4
ADDRLP4 224
INDIRI4
CNSTI4 0
EQI4 $1010
line 1971
;1968:#ifdef DEBUG
;1969:		BotAI_Print(PRT_MESSAGE, "found new better enemy\n");
;1970:#endif
;1971:	}
LABELV $1010
line 1973
;1972:	//if no enemy
;1973:	if (bs->enemy < 0 || ( GTx(g_gametype.integer, GTF_TEAMS) && bs->enemy < level.maxclients &&
ADDRLP4 228
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 228
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 0
LTI4 $1017
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
EQI4 $1012
ADDRLP4 228
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ADDRGP4 level+24
INDIRI4
GEI4 $1012
ADDRLP4 232
ADDRGP4 level
INDIRP4
ASGNP4
ADDRLP4 228
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1636
MULI4
ADDRLP4 232
INDIRP4
ADDP4
CNSTI4 624
ADDP4
INDIRI4
ADDRLP4 228
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 1636
MULI4
ADDRLP4 232
INDIRP4
ADDP4
CNSTI4 624
ADDP4
INDIRI4
NEI4 $1012
LABELV $1017
line 1974
;1974:							level.clients[bs->client].sess.sessionTeam == level.clients[bs->enemy].sess.sessionTeam ) ) {
line 1975
;1975:		bs->enemy = -1;
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
CNSTI4 -1
ASGNI4
line 1976
;1976:		AIEnter_Seek_LTG(bs, "battle fight: no enemy");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1018
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 1977
;1977:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1000
JUMPV
LABELV $1012
line 1980
;1978:	}
;1979:	//
;1980:	BotEntityInfo(bs->enemy, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 1982
;1981:	//if the enemy is dead
;1982:	if (bs->enemydeath_time) {
ADDRFP4 0
INDIRP4
CNSTI4 6136
ADDP4
INDIRF4
CNSTF4 0
EQF4 $1019
line 1983
;1983:		if (bs->enemydeath_time < FloatTime() - 1.0) {
ADDRFP4 0
INDIRP4
CNSTI4 6136
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
SUBF4
GEF4 $1020
line 1984
;1984:			bs->enemydeath_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6136
ADDP4
CNSTF4 0
ASGNF4
line 1985
;1985:			if (bs->enemysuicide) {
ADDRFP4 0
INDIRP4
CNSTI4 6012
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1023
line 1986
;1986:				BotChat_EnemySuicide(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotChat_EnemySuicide
CALLI4
pop
line 1987
;1987:			}
LABELV $1023
line 1988
;1988:			if (bs->lastkilledplayer == bs->enemy && BotChat_Kill(bs)) {
ADDRLP4 236
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 236
INDIRP4
CNSTI4 5992
ADDP4
INDIRI4
ADDRLP4 236
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
NEI4 $1025
ADDRLP4 236
INDIRP4
ARGP4
ADDRLP4 240
ADDRGP4 BotChat_Kill
CALLI4
ASGNI4
ADDRLP4 240
INDIRI4
CNSTI4 0
EQI4 $1025
line 1989
;1989:				bs->stand_time = FloatTime() + BotChatTime(bs);
ADDRLP4 244
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 244
INDIRP4
ARGP4
ADDRLP4 248
ADDRGP4 BotChatTime
CALLF4
ASGNF4
ADDRLP4 244
INDIRP4
CNSTI4 6096
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 248
INDIRF4
ADDF4
ASGNF4
line 1990
;1990:				AIEnter_Stand(bs, "battle fight: enemy dead");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1027
ARGP4
ADDRGP4 AIEnter_Stand
CALLV
pop
line 1991
;1991:			}
ADDRGP4 $1026
JUMPV
LABELV $1025
line 1992
;1992:			else {
line 1993
;1993:				bs->ltg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6068
ADDP4
CNSTF4 0
ASGNF4
line 1994
;1994:				AIEnter_Seek_LTG(bs, "battle fight: enemy dead");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1027
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 1995
;1995:			}
LABELV $1026
line 1996
;1996:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1000
JUMPV
line 1998
;1997:		}
;1998:	}
LABELV $1019
line 1999
;1999:	else {
line 2000
;2000:		if (EntityIsDead(&entinfo)) {
ADDRLP4 0
ARGP4
ADDRLP4 236
ADDRGP4 EntityIsDead
CALLI4
ASGNI4
ADDRLP4 236
INDIRI4
CNSTI4 0
EQI4 $1028
line 2001
;2001:			bs->enemydeath_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6136
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2002
;2002:		}
LABELV $1028
line 2003
;2003:	}
LABELV $1020
line 2005
;2004:	//if the enemy is invisible and not shooting the bot looses track easily
;2005:	if (EntityIsInvisible(&entinfo) && !EntityIsShooting(&entinfo)) {
ADDRLP4 0
ARGP4
ADDRLP4 236
ADDRGP4 EntityIsInvisible
CALLI4
ASGNI4
ADDRLP4 236
INDIRI4
CNSTI4 0
EQI4 $1030
ADDRLP4 0
ARGP4
ADDRLP4 240
ADDRGP4 EntityIsShooting
CALLI4
ASGNI4
ADDRLP4 240
INDIRI4
CNSTI4 0
NEI4 $1030
line 2006
;2006:		if (random() < 0.2) {
ADDRLP4 244
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 244
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1045220557
GEF4 $1032
line 2007
;2007:			AIEnter_Seek_LTG(bs, "battle fight: invisible");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1034
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 2008
;2008:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1000
JUMPV
LABELV $1032
line 2010
;2009:		}
;2010:	}
LABELV $1030
line 2012
;2011:	//
;2012:	VectorCopy(entinfo.origin, target);
ADDRLP4 196
ADDRLP4 0+24
INDIRB
ASGNB 12
line 2014
;2013:	// if not a player enemy
;2014:	if (bs->enemy >= MAX_CLIENTS) {
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 64
LTI4 $1036
line 2016
;2015:		// if attacking an obelisk
;2016:		if ( bs->enemy == redobelisk.entitynum ||
ADDRLP4 244
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 244
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ADDRGP4 redobelisk+40
INDIRI4
EQI4 $1042
ADDRLP4 244
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ADDRGP4 blueobelisk+40
INDIRI4
NEI4 $1038
LABELV $1042
line 2017
;2017:			bs->enemy == blueobelisk.entitynum ) {
line 2018
;2018:			target[2] += 16;
ADDRLP4 196+8
ADDRLP4 196+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 2019
;2019:		}
LABELV $1038
line 2020
;2020:	}
LABELV $1036
line 2022
;2021:	//update the reachability area and origin if possible
;2022:	areanum = BotPointAreaNum(target);
ADDRLP4 196
ARGP4
ADDRLP4 244
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 192
ADDRLP4 244
INDIRI4
ASGNI4
line 2023
;2023:	if (areanum && trap_AAS_AreaReachability(areanum)) {
ADDRLP4 192
INDIRI4
CNSTI4 0
EQI4 $1044
ADDRLP4 192
INDIRI4
ARGI4
ADDRLP4 252
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 252
INDIRI4
CNSTI4 0
EQI4 $1044
line 2024
;2024:		VectorCopy(target, bs->lastenemyorigin);
ADDRFP4 0
INDIRP4
CNSTI4 6548
ADDP4
ADDRLP4 196
INDIRB
ASGNB 12
line 2025
;2025:		bs->lastenemyareanum = areanum;
ADDRFP4 0
INDIRP4
CNSTI4 6544
ADDP4
ADDRLP4 192
INDIRI4
ASGNI4
line 2026
;2026:	}
LABELV $1044
line 2028
;2027:	//update the attack inventory values
;2028:	BotUpdateBattleInventory(bs, bs->enemy);
ADDRLP4 256
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 256
INDIRP4
ARGP4
ADDRLP4 256
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotUpdateBattleInventory
CALLV
pop
line 2030
;2029:	//if the bot's health decreased
;2030:	if (bs->lastframe_health > bs->inventory[INVENTORY_HEALTH]) {
ADDRLP4 260
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 260
INDIRP4
CNSTI4 6044
ADDP4
INDIRI4
ADDRLP4 260
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
LEI4 $1046
line 2031
;2031:		if (BotChat_HitNoDeath(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 BotChat_HitNoDeath
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
EQI4 $1048
line 2032
;2032:			bs->stand_time = FloatTime() + BotChatTime(bs);
ADDRLP4 268
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 268
INDIRP4
ARGP4
ADDRLP4 272
ADDRGP4 BotChatTime
CALLF4
ASGNF4
ADDRLP4 268
INDIRP4
CNSTI4 6096
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 272
INDIRF4
ADDF4
ASGNF4
line 2033
;2033:			AIEnter_Stand(bs, "battle fight: chat health decreased");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1050
ARGP4
ADDRGP4 AIEnter_Stand
CALLV
pop
line 2034
;2034:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1000
JUMPV
LABELV $1048
line 2036
;2035:		}
;2036:	}
LABELV $1046
line 2038
;2037:	//if the bot hit someone
;2038:	if (bs->cur_ps.persistant[PERS_HITS] > bs->lasthitcount) {
ADDRLP4 264
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 264
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
ADDRLP4 264
INDIRP4
CNSTI4 6048
ADDP4
INDIRI4
LEI4 $1051
line 2039
;2039:		if (BotChat_HitNoKill(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 268
ADDRGP4 BotChat_HitNoKill
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
EQI4 $1053
line 2040
;2040:			bs->stand_time = FloatTime() + BotChatTime(bs);
ADDRLP4 272
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 272
INDIRP4
ARGP4
ADDRLP4 276
ADDRGP4 BotChatTime
CALLF4
ASGNF4
ADDRLP4 272
INDIRP4
CNSTI4 6096
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 276
INDIRF4
ADDF4
ASGNF4
line 2041
;2041:			AIEnter_Stand(bs, "battle fight: chat hit someone");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1055
ARGP4
ADDRGP4 AIEnter_Stand
CALLV
pop
line 2042
;2042:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1000
JUMPV
LABELV $1053
line 2044
;2043:		}
;2044:	}
LABELV $1051
line 2046
;2045:	//if the enemy is not visible
;2046:	if (!BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, bs->enemy)) {
ADDRLP4 268
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 268
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 268
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 268
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 268
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 272
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 272
INDIRF4
CNSTF4 0
NEF4 $1056
line 2047
;2047:		if (bs->enemy == redobelisk.entitynum || bs->enemy == blueobelisk.entitynum) {
ADDRLP4 276
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 276
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ADDRGP4 redobelisk+40
INDIRI4
EQI4 $1062
ADDRLP4 276
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ADDRGP4 blueobelisk+40
INDIRI4
NEI4 $1058
LABELV $1062
line 2048
;2048:			AIEnter_Battle_Chase(bs, "battle fight: obelisk out of sight");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1063
ARGP4
ADDRGP4 AIEnter_Battle_Chase
CALLV
pop
line 2049
;2049:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1000
JUMPV
LABELV $1058
line 2051
;2050:		}
;2051:		if (BotWantsToChase(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 280
ADDRGP4 BotWantsToChase
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
EQI4 $1064
line 2052
;2052:			AIEnter_Battle_Chase(bs, "battle fight: enemy out of sight");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1066
ARGP4
ADDRGP4 AIEnter_Battle_Chase
CALLV
pop
line 2053
;2053:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1000
JUMPV
LABELV $1064
line 2055
;2054:		}
;2055:		else {
line 2056
;2056:			AIEnter_Seek_LTG(bs, "battle fight: enemy out of sight");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1066
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 2057
;2057:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1000
JUMPV
LABELV $1056
line 2061
;2058:		}
;2059:	}
;2060:	//use holdable items
;2061:	BotBattleUseItems(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotBattleUseItems
CALLV
pop
line 2063
;2062:	//
;2063:	bs->tfl = TFL_DEFAULT;
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
CNSTI4 18616254
ASGNI4
line 2064
;2064:	if (bot_grapple.integer) bs->tfl |= TFL_GRAPPLEHOOK;
ADDRGP4 bot_grapple+12
INDIRI4
CNSTI4 0
EQI4 $1067
ADDRLP4 276
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 276
INDIRP4
ADDRLP4 276
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
LABELV $1067
line 2066
;2065:	//if in lava or slime the bot should be able to get out
;2066:	if (BotInLavaOrSlime(bs)) bs->tfl |= TFL_LAVA|TFL_SLIME;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 280
ADDRGP4 BotInLavaOrSlime
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
EQI4 $1070
ADDRLP4 284
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 284
INDIRP4
ADDRLP4 284
INDIRP4
INDIRI4
CNSTI4 6291456
BORI4
ASGNI4
LABELV $1070
line 2068
;2067:	//
;2068:	if (BotCanAndWantsToRocketJump(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 288
ADDRGP4 BotCanAndWantsToRocketJump
CALLI4
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 0
EQI4 $1072
line 2069
;2069:		bs->tfl |= TFL_ROCKETJUMP;
ADDRLP4 292
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 292
INDIRP4
ADDRLP4 292
INDIRP4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 2070
;2070:	}
LABELV $1072
line 2072
;2071:	//choose the best weapon to fight with
;2072:	BotChooseWeapon(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotChooseWeapon
CALLV
pop
line 2074
;2073:	//do attack movements
;2074:	moveresult = BotAttackMove(bs, bs->tfl);
ADDRLP4 140
ARGP4
ADDRLP4 292
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 292
INDIRP4
ARGP4
ADDRLP4 292
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotAttackMove
CALLV
pop
line 2076
;2075:	//if the movement failed
;2076:	if (moveresult.failure) {
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $1074
line 2078
;2077:		//reset the avoid reach, otherwise bot is stuck in current area
;2078:		trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 2080
;2079:		//BotAI_Print(PRT_MESSAGE, "movement failure %d\n", moveresult.traveltype);
;2080:		bs->ltg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6068
ADDP4
CNSTF4 0
ASGNF4
line 2081
;2081:	}
LABELV $1074
line 2083
;2082:	//
;2083:	BotAIBlocked(bs, &moveresult, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotAIBlocked
CALLV
pop
line 2085
;2084:	//aim at the enemy
;2085:	BotAimAtEnemy(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotAimAtEnemy
CALLV
pop
line 2087
;2086:	//attack the enemy if possible
;2087:	BotCheckAttack(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCheckAttack
CALLV
pop
line 2089
;2088:	//if the bot wants to retreat
;2089:	if (!(bs->flags & BFL_FIGHTSUICIDAL)) {
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
NEI4 $1076
line 2090
;2090:		if (BotWantsToRetreat(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
ADDRGP4 BotWantsToRetreat
CALLI4
ASGNI4
ADDRLP4 296
INDIRI4
CNSTI4 0
EQI4 $1078
line 2091
;2091:			AIEnter_Battle_Retreat(bs, "battle fight: wants to retreat");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1080
ARGP4
ADDRGP4 AIEnter_Battle_Retreat
CALLV
pop
line 2092
;2092:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1000
JUMPV
LABELV $1078
line 2094
;2093:		}
;2094:	}
LABELV $1076
line 2095
;2095:	return qtrue;
CNSTI4 1
RETI4
LABELV $1000
endproc AINode_Battle_Fight 300 20
export AIEnter_Battle_Chase
proc AIEnter_Battle_Chase 0 16
line 2103
;2096:}
;2097:
;2098:/*
;2099:==================
;2100:AIEnter_Battle_Chase
;2101:==================
;2102:*/
;2103:void AIEnter_Battle_Chase(bot_state_t *bs, char *s) {
line 2104
;2104:	BotRecordNodeSwitch(bs, "battle chase", "", s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1082
ARGP4
ADDRGP4 $64
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRecordNodeSwitch
CALLV
pop
line 2105
;2105:	bs->chase_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6084
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2106
;2106:	bs->ainode = AINode_Battle_Chase;
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
ADDRGP4 AINode_Battle_Chase
ASGNP4
line 2107
;2107:}
LABELV $1081
endproc AIEnter_Battle_Chase 0 16
export AINode_Battle_Chase
proc AINode_Battle_Chase 204 20
line 2115
;2108:
;2109:/*
;2110:==================
;2111:AINode_Battle_Chase
;2112:==================
;2113:*/
;2114:int AINode_Battle_Chase(bot_state_t *bs)
;2115:{
line 2121
;2116:	bot_goal_t goal;
;2117:	vec3_t target, dir;
;2118:	bot_moveresult_t moveresult;
;2119:	float range;
;2120:
;2121:	if (BotIsObserver(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 136
ADDRGP4 BotIsObserver
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 0
EQI4 $1084
line 2122
;2122:		AIEnter_Observer(bs, "battle chase: observer");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1086
ARGP4
ADDRGP4 AIEnter_Observer
CALLV
pop
line 2123
;2123:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1083
JUMPV
LABELV $1084
line 2126
;2124:	}
;2125:	//if in the intermission
;2126:	if (BotIntermission(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotIntermission
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $1087
line 2127
;2127:		AIEnter_Intermission(bs, "battle chase: intermission");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1089
ARGP4
ADDRGP4 AIEnter_Intermission
CALLV
pop
line 2128
;2128:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1083
JUMPV
LABELV $1087
line 2131
;2129:	}
;2130:	//respawn if dead
;2131:	if (BotIsDead(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 BotIsDead
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $1090
line 2132
;2132:		AIEnter_Respawn(bs, "battle chase: bot dead");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1092
ARGP4
ADDRGP4 AIEnter_Respawn
CALLV
pop
line 2133
;2133:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1083
JUMPV
LABELV $1090
line 2136
;2134:	}
;2135:	//if no enemy
;2136:	if (bs->enemy < 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 0
GEI4 $1093
line 2137
;2137:		AIEnter_Seek_LTG(bs, "battle chase: no enemy");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1095
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 2138
;2138:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1083
JUMPV
LABELV $1093
line 2141
;2139:	}
;2140:	//if the enemy is visible
;2141:	if (BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, bs->enemy)) {
ADDRLP4 148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 148
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 148
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 148
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 152
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 152
INDIRF4
CNSTF4 0
EQF4 $1096
line 2142
;2142:		AIEnter_Battle_Fight(bs, "battle chase");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1082
ARGP4
ADDRGP4 AIEnter_Battle_Fight
CALLV
pop
line 2143
;2143:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1083
JUMPV
LABELV $1096
line 2146
;2144:	}
;2145:	//if there is another enemy
;2146:	if (BotFindEnemy(bs, -1)) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 156
ADDRGP4 BotFindEnemy
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 0
EQI4 $1098
line 2147
;2147:		AIEnter_Battle_Fight(bs, "battle chase: better enemy");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1100
ARGP4
ADDRGP4 AIEnter_Battle_Fight
CALLV
pop
line 2148
;2148:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1083
JUMPV
LABELV $1098
line 2151
;2149:	}
;2150:	//there is no last enemy area
;2151:	if (!bs->lastenemyareanum) {
ADDRFP4 0
INDIRP4
CNSTI4 6544
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1101
line 2152
;2152:		AIEnter_Seek_LTG(bs, "battle chase: no enemy area");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1103
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 2153
;2153:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1083
JUMPV
LABELV $1101
line 2156
;2154:	}
;2155:	//
;2156:	bs->tfl = TFL_DEFAULT;
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
CNSTI4 18616254
ASGNI4
line 2157
;2157:	if (bot_grapple.integer) bs->tfl |= TFL_GRAPPLEHOOK;
ADDRGP4 bot_grapple+12
INDIRI4
CNSTI4 0
EQI4 $1104
ADDRLP4 160
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 160
INDIRP4
ADDRLP4 160
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
LABELV $1104
line 2159
;2158:	//if in lava or slime the bot should be able to get out
;2159:	if (BotInLavaOrSlime(bs)) bs->tfl |= TFL_LAVA|TFL_SLIME;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 164
ADDRGP4 BotInLavaOrSlime
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
EQI4 $1107
ADDRLP4 168
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 168
INDIRP4
ADDRLP4 168
INDIRP4
INDIRI4
CNSTI4 6291456
BORI4
ASGNI4
LABELV $1107
line 2161
;2160:	//
;2161:	if (BotCanAndWantsToRocketJump(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 172
ADDRGP4 BotCanAndWantsToRocketJump
CALLI4
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 0
EQI4 $1109
line 2162
;2162:		bs->tfl |= TFL_ROCKETJUMP;
ADDRLP4 176
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 176
INDIRP4
ADDRLP4 176
INDIRP4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 2163
;2163:	}
LABELV $1109
line 2165
;2164:	//map specific code
;2165:	BotMapScripts(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotMapScripts
CALLV
pop
line 2167
;2166:	//create the chase goal
;2167:	goal.entitynum = bs->enemy;
ADDRLP4 0+40
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ASGNI4
line 2168
;2168:	goal.areanum = bs->lastenemyareanum;
ADDRLP4 0+12
ADDRFP4 0
INDIRP4
CNSTI4 6544
ADDP4
INDIRI4
ASGNI4
line 2169
;2169:	VectorCopy(bs->lastenemyorigin, goal.origin);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 6548
ADDP4
INDIRB
ASGNB 12
line 2170
;2170:	VectorSet(goal.mins, -8, -8, -8);
ADDRLP4 0+16
CNSTF4 3238002688
ASGNF4
ADDRLP4 0+16+4
CNSTF4 3238002688
ASGNF4
ADDRLP4 0+16+8
CNSTF4 3238002688
ASGNF4
line 2171
;2171:	VectorSet(goal.maxs, 8, 8, 8);
ADDRLP4 0+28
CNSTF4 1090519040
ASGNF4
ADDRLP4 0+28+4
CNSTF4 1090519040
ASGNF4
ADDRLP4 0+28+8
CNSTF4 1090519040
ASGNF4
line 2173
;2172:	//if the last seen enemy spot is reached the enemy could not be found
;2173:	if (trap_BotTouchingGoal(bs->origin, &goal)) bs->chase_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 176
ADDRGP4 trap_BotTouchingGoal
CALLI4
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 0
EQI4 $1123
ADDRFP4 0
INDIRP4
CNSTI4 6084
ADDP4
CNSTF4 0
ASGNF4
LABELV $1123
line 2175
;2174:	//if there's no chase time left
;2175:	if (!bs->chase_time || bs->chase_time < FloatTime() - 10) {
ADDRLP4 180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 180
INDIRP4
CNSTI4 6084
ADDP4
INDIRF4
CNSTF4 0
EQF4 $1127
ADDRLP4 180
INDIRP4
CNSTI4 6084
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1092616192
SUBF4
GEF4 $1125
LABELV $1127
line 2176
;2176:		AIEnter_Seek_LTG(bs, "battle chase: time out");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1128
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 2177
;2177:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1083
JUMPV
LABELV $1125
line 2180
;2178:	}
;2179:	//check for nearby goals periodicly
;2180:	if (bs->check_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6092
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $1129
line 2181
;2181:		bs->check_time = FloatTime() + 1;
ADDRFP4 0
INDIRP4
CNSTI4 6092
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2182
;2182:		range = 150;
ADDRLP4 108
CNSTF4 1125515264
ASGNF4
line 2184
;2183:		//
;2184:		if (BotNearbyGoal(bs, bs->tfl, &goal, range)) {
ADDRLP4 184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 184
INDIRP4
ARGP4
ADDRLP4 184
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 108
INDIRF4
ARGF4
ADDRLP4 188
ADDRGP4 BotNearbyGoal
CALLI4
ASGNI4
ADDRLP4 188
INDIRI4
CNSTI4 0
EQI4 $1131
line 2186
;2185:			//the bot gets 5 seconds to pick up the nearby goal item
;2186:			bs->nbg_time = FloatTime() + 0.1 * range + 1;
ADDRFP4 0
INDIRP4
CNSTI4 6072
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 108
INDIRF4
CNSTF4 1036831949
MULF4
ADDF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2187
;2187:			trap_BotResetLastAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetLastAvoidReach
CALLV
pop
line 2188
;2188:			AIEnter_Battle_NBG(bs, "battle chase: nbg");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1133
ARGP4
ADDRGP4 AIEnter_Battle_NBG
CALLV
pop
line 2189
;2189:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1083
JUMPV
LABELV $1131
line 2191
;2190:		}
;2191:	}
LABELV $1129
line 2193
;2192:	//
;2193:	BotUpdateBattleInventory(bs, bs->enemy);
ADDRLP4 184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 184
INDIRP4
ARGP4
ADDRLP4 184
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotUpdateBattleInventory
CALLV
pop
line 2195
;2194:	//initialize the movement state
;2195:	BotSetupForMovement(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetupForMovement
CALLV
pop
line 2197
;2196:	//move towards the goal
;2197:	trap_BotMoveToGoal(&moveresult, bs->ms, &goal, bs->tfl);
ADDRLP4 56
ARGP4
ADDRLP4 188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 188
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 188
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotMoveToGoal
CALLV
pop
line 2199
;2198:	//if the movement failed
;2199:	if (moveresult.failure) {
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $1134
line 2201
;2200:		//reset the avoid reach, otherwise bot is stuck in current area
;2201:		trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 2203
;2202:		//BotAI_Print(PRT_MESSAGE, "movement failure %d\n", moveresult.traveltype);
;2203:		bs->ltg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6068
ADDP4
CNSTF4 0
ASGNF4
line 2204
;2204:	}
LABELV $1134
line 2206
;2205:	//
;2206:	BotAIBlocked(bs, &moveresult, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 56
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotAIBlocked
CALLV
pop
line 2208
;2207:	//
;2208:	if (moveresult.flags & (MOVERESULT_MOVEMENTVIEWSET|MOVERESULT_MOVEMENTVIEW|MOVERESULT_SWIMVIEW)) {
ADDRLP4 56+20
INDIRI4
CNSTI4 11
BANDI4
CNSTI4 0
EQI4 $1136
line 2209
;2209:		VectorCopy(moveresult.ideal_viewangles, bs->ideal_viewangles);
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ADDRLP4 56+40
INDIRB
ASGNB 12
line 2210
;2210:	}
ADDRGP4 $1137
JUMPV
LABELV $1136
line 2211
;2211:	else if (!(bs->flags & BFL_IDEALVIEWSET)) {
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $1140
line 2212
;2212:		if (bs->chase_time > FloatTime() - 2) {
ADDRFP4 0
INDIRP4
CNSTI4 6084
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
SUBF4
LEF4 $1142
line 2213
;2213:			BotAimAtEnemy(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotAimAtEnemy
CALLV
pop
line 2214
;2214:		}
ADDRGP4 $1143
JUMPV
LABELV $1142
line 2215
;2215:		else {
line 2216
;2216:			if (trap_BotMovementViewTarget(bs->ms, &goal, bs->tfl, 300, target)) {
ADDRLP4 192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 192
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 192
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
CNSTF4 1133903872
ARGF4
ADDRLP4 112
ARGP4
ADDRLP4 196
ADDRGP4 trap_BotMovementViewTarget
CALLI4
ASGNI4
ADDRLP4 196
INDIRI4
CNSTI4 0
EQI4 $1144
line 2217
;2217:				VectorSubtract(target, bs->origin, dir);
ADDRLP4 200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 124
ADDRLP4 112
INDIRF4
ADDRLP4 200
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 124+4
ADDRLP4 112+4
INDIRF4
ADDRLP4 200
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 124+8
ADDRLP4 112+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2218
;2218:				vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 124
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2219
;2219:			}
ADDRGP4 $1145
JUMPV
LABELV $1144
line 2220
;2220:			else {
line 2221
;2221:				vectoangles(moveresult.movedir, bs->ideal_viewangles);
ADDRLP4 56+28
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2222
;2222:			}
LABELV $1145
line 2223
;2223:		}
LABELV $1143
line 2224
;2224:		bs->ideal_viewangles[2] *= 0.5;
ADDRLP4 192
ADDRFP4 0
INDIRP4
CNSTI4 6584
ADDP4
ASGNP4
ADDRLP4 192
INDIRP4
ADDRLP4 192
INDIRP4
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 2225
;2225:	}
LABELV $1140
LABELV $1137
line 2227
;2226:	//if the weapon is used for the bot movement
;2227:	if (moveresult.flags & MOVERESULT_MOVEMENTWEAPON) bs->weaponnum = moveresult.weapon;
ADDRLP4 56+20
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1151
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
ADDRLP4 56+24
INDIRI4
ASGNI4
LABELV $1151
line 2229
;2228:	//if the bot is in the area the enemy was last seen in
;2229:	if (bs->areanum == bs->lastenemyareanum) bs->chase_time = 0;
ADDRLP4 192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 192
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ADDRLP4 192
INDIRP4
CNSTI4 6544
ADDP4
INDIRI4
NEI4 $1155
ADDRFP4 0
INDIRP4
CNSTI4 6084
ADDP4
CNSTF4 0
ASGNF4
LABELV $1155
line 2231
;2230:	//if the bot wants to retreat (the bot could have been damage during the chase)
;2231:	if (BotWantsToRetreat(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 196
ADDRGP4 BotWantsToRetreat
CALLI4
ASGNI4
ADDRLP4 196
INDIRI4
CNSTI4 0
EQI4 $1157
line 2232
;2232:		AIEnter_Battle_Retreat(bs, "battle chase: wants to retreat");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1159
ARGP4
ADDRGP4 AIEnter_Battle_Retreat
CALLV
pop
line 2233
;2233:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1083
JUMPV
LABELV $1157
line 2235
;2234:	}
;2235:	return qtrue;
CNSTI4 1
RETI4
LABELV $1083
endproc AINode_Battle_Chase 204 20
export AIEnter_Battle_Retreat
proc AIEnter_Battle_Retreat 0 16
line 2243
;2236:}
;2237:
;2238:/*
;2239:==================
;2240:AIEnter_Battle_Retreat
;2241:==================
;2242:*/
;2243:void AIEnter_Battle_Retreat(bot_state_t *bs, char *s) {
line 2244
;2244:	BotRecordNodeSwitch(bs, "battle retreat", "", s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1161
ARGP4
ADDRGP4 $64
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRecordNodeSwitch
CALLV
pop
line 2245
;2245:	bs->ainode = AINode_Battle_Retreat;
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
ADDRGP4 AINode_Battle_Retreat
ASGNP4
line 2246
;2246:}
LABELV $1160
endproc AIEnter_Battle_Retreat 0 16
export AINode_Battle_Retreat
proc AINode_Battle_Retreat 364 20
line 2253
;2247:
;2248:/*
;2249:==================
;2250:AINode_Battle_Retreat
;2251:==================
;2252:*/
;2253:int AINode_Battle_Retreat(bot_state_t *bs) {
line 2261
;2254:	bot_goal_t goal;
;2255:	aas_entityinfo_t entinfo;
;2256:	bot_moveresult_t moveresult;
;2257:	vec3_t target, dir;
;2258:	float attack_skill, range;
;2259:	int areanum;
;2260:
;2261:	if (BotIsObserver(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 284
ADDRGP4 BotIsObserver
CALLI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 0
EQI4 $1163
line 2262
;2262:		AIEnter_Observer(bs, "battle retreat: observer");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1165
ARGP4
ADDRGP4 AIEnter_Observer
CALLV
pop
line 2263
;2263:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1162
JUMPV
LABELV $1163
line 2266
;2264:	}
;2265:	//if in the intermission
;2266:	if (BotIntermission(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 288
ADDRGP4 BotIntermission
CALLI4
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 0
EQI4 $1166
line 2267
;2267:		AIEnter_Intermission(bs, "battle retreat: intermission");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1168
ARGP4
ADDRGP4 AIEnter_Intermission
CALLV
pop
line 2268
;2268:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1162
JUMPV
LABELV $1166
line 2271
;2269:	}
;2270:	//respawn if dead
;2271:	if (BotIsDead(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 292
ADDRGP4 BotIsDead
CALLI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
EQI4 $1169
line 2272
;2272:		AIEnter_Respawn(bs, "battle retreat: bot dead");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1171
ARGP4
ADDRGP4 AIEnter_Respawn
CALLV
pop
line 2273
;2273:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1162
JUMPV
LABELV $1169
line 2276
;2274:	}
;2275:	//if no enemy
;2276:	if (bs->enemy < 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 0
GEI4 $1172
line 2277
;2277:		AIEnter_Seek_LTG(bs, "battle retreat: no enemy");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1174
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 2278
;2278:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1162
JUMPV
LABELV $1172
line 2281
;2279:	}
;2280:	//
;2281:	BotEntityInfo(bs->enemy, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 108
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2282
;2282:	if (EntityIsDead(&entinfo)) {
ADDRLP4 108
ARGP4
ADDRLP4 296
ADDRGP4 EntityIsDead
CALLI4
ASGNI4
ADDRLP4 296
INDIRI4
CNSTI4 0
EQI4 $1175
line 2283
;2283:		AIEnter_Seek_LTG(bs, "battle retreat: enemy dead");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1177
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 2284
;2284:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1162
JUMPV
LABELV $1175
line 2287
;2285:	}
;2286:	//if there is another better enemy
;2287:	if (BotFindEnemy(bs, bs->enemy)) {
ADDRLP4 300
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 300
INDIRP4
ARGP4
ADDRLP4 300
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 304
ADDRGP4 BotFindEnemy
CALLI4
ASGNI4
ADDRLP4 304
INDIRI4
CNSTI4 0
EQI4 $1178
line 2291
;2288:#ifdef DEBUG
;2289:		BotAI_Print(PRT_MESSAGE, "found new better enemy\n");
;2290:#endif
;2291:	}
LABELV $1178
line 2293
;2292:	//
;2293:	bs->tfl = TFL_DEFAULT;
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
CNSTI4 18616254
ASGNI4
line 2294
;2294:	if (bot_grapple.integer) bs->tfl |= TFL_GRAPPLEHOOK;
ADDRGP4 bot_grapple+12
INDIRI4
CNSTI4 0
EQI4 $1180
ADDRLP4 308
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 308
INDIRP4
ADDRLP4 308
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
LABELV $1180
line 2296
;2295:	//if in lava or slime the bot should be able to get out
;2296:	if (BotInLavaOrSlime(bs)) bs->tfl |= TFL_LAVA|TFL_SLIME;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 312
ADDRGP4 BotInLavaOrSlime
CALLI4
ASGNI4
ADDRLP4 312
INDIRI4
CNSTI4 0
EQI4 $1183
ADDRLP4 316
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 316
INDIRP4
ADDRLP4 316
INDIRP4
INDIRI4
CNSTI4 6291456
BORI4
ASGNI4
LABELV $1183
line 2298
;2297:	//map specific code
;2298:	BotMapScripts(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotMapScripts
CALLV
pop
line 2300
;2299:	//update the attack inventory values
;2300:	BotUpdateBattleInventory(bs, bs->enemy);
ADDRLP4 320
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 320
INDIRP4
ARGP4
ADDRLP4 320
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotUpdateBattleInventory
CALLV
pop
line 2302
;2301:	//if the bot doesn't want to retreat anymore... probably picked up some nice items
;2302:	if (BotWantsToChase(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 324
ADDRGP4 BotWantsToChase
CALLI4
ASGNI4
ADDRLP4 324
INDIRI4
CNSTI4 0
EQI4 $1185
line 2304
;2303:		//empty the goal stack, when chasing, only the enemy is the goal
;2304:		trap_BotEmptyGoalStack(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotEmptyGoalStack
CALLV
pop
line 2306
;2305:		//go chase the enemy
;2306:		AIEnter_Battle_Chase(bs, "battle retreat: wants to chase");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1187
ARGP4
ADDRGP4 AIEnter_Battle_Chase
CALLV
pop
line 2307
;2307:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1162
JUMPV
LABELV $1185
line 2310
;2308:	}
;2309:	//update the last time the enemy was visible
;2310:	if (BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, bs->enemy)) {
ADDRLP4 328
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 328
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 328
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 328
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 328
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 332
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 332
INDIRF4
CNSTF4 0
EQF4 $1188
line 2311
;2311:		bs->enemyvisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6088
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2312
;2312:		VectorCopy(entinfo.origin, target);
ADDRLP4 252
ADDRLP4 108+24
INDIRB
ASGNB 12
line 2314
;2313:		// if not a player enemy
;2314:		if (bs->enemy >= MAX_CLIENTS) {
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 64
LTI4 $1191
line 2316
;2315:			// if attacking an obelisk
;2316:			if ( bs->enemy == redobelisk.entitynum ||
ADDRLP4 336
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 336
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ADDRGP4 redobelisk+40
INDIRI4
EQI4 $1197
ADDRLP4 336
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ADDRGP4 blueobelisk+40
INDIRI4
NEI4 $1193
LABELV $1197
line 2317
;2317:				bs->enemy == blueobelisk.entitynum ) {
line 2318
;2318:				target[2] += 16;
ADDRLP4 252+8
ADDRLP4 252+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 2319
;2319:			}
LABELV $1193
line 2320
;2320:		}
LABELV $1191
line 2322
;2321:		//update the reachability area and origin if possible
;2322:		areanum = BotPointAreaNum(target);
ADDRLP4 252
ARGP4
ADDRLP4 336
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 248
ADDRLP4 336
INDIRI4
ASGNI4
line 2323
;2323:		if (areanum && trap_AAS_AreaReachability(areanum)) {
ADDRLP4 340
ADDRLP4 248
INDIRI4
ASGNI4
ADDRLP4 340
INDIRI4
CNSTI4 0
EQI4 $1199
ADDRLP4 340
INDIRI4
ARGI4
ADDRLP4 344
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 344
INDIRI4
CNSTI4 0
EQI4 $1199
line 2324
;2324:			VectorCopy(target, bs->lastenemyorigin);
ADDRFP4 0
INDIRP4
CNSTI4 6548
ADDP4
ADDRLP4 252
INDIRB
ASGNB 12
line 2325
;2325:			bs->lastenemyareanum = areanum;
ADDRFP4 0
INDIRP4
CNSTI4 6544
ADDP4
ADDRLP4 248
INDIRI4
ASGNI4
line 2326
;2326:		}
LABELV $1199
line 2327
;2327:	}
LABELV $1188
line 2329
;2328:	//if the enemy is NOT visible for 4 seconds
;2329:	if (bs->enemyvisible_time < FloatTime() - 4) {
ADDRFP4 0
INDIRP4
CNSTI4 6088
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1082130432
SUBF4
GEF4 $1201
line 2330
;2330:		AIEnter_Seek_LTG(bs, "battle retreat: lost enemy");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1203
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 2331
;2331:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1162
JUMPV
LABELV $1201
line 2334
;2332:	}
;2333:	//else if the enemy is NOT visible
;2334:	else if (bs->enemyvisible_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6088
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $1204
line 2336
;2335:		//if there is another enemy
;2336:		if (BotFindEnemy(bs, -1)) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 336
ADDRGP4 BotFindEnemy
CALLI4
ASGNI4
ADDRLP4 336
INDIRI4
CNSTI4 0
EQI4 $1206
line 2337
;2337:			AIEnter_Battle_Fight(bs, "battle retreat: another enemy");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1208
ARGP4
ADDRGP4 AIEnter_Battle_Fight
CALLV
pop
line 2338
;2338:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1162
JUMPV
LABELV $1206
line 2340
;2339:		}
;2340:	}
LABELV $1204
line 2342
;2341:	//
;2342:	BotTeamGoals(bs, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotTeamGoals
CALLV
pop
line 2344
;2343:	//use holdable items
;2344:	BotBattleUseItems(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotBattleUseItems
CALLV
pop
line 2346
;2345:	//get the current long term goal while retreating
;2346:	if (!BotLongTermGoal(bs, bs->tfl, qtrue, &goal)) {
ADDRLP4 336
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 336
INDIRP4
ARGP4
ADDRLP4 336
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 340
ADDRGP4 BotLongTermGoal
CALLI4
ASGNI4
ADDRLP4 340
INDIRI4
CNSTI4 0
NEI4 $1209
line 2347
;2347:		AIEnter_Battle_SuicidalFight(bs, "battle retreat: no way out");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1211
ARGP4
ADDRGP4 AIEnter_Battle_SuicidalFight
CALLV
pop
line 2348
;2348:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1162
JUMPV
LABELV $1209
line 2351
;2349:	}
;2350:	//check for nearby goals periodicly
;2351:	if (bs->check_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6092
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $1212
line 2352
;2352:		bs->check_time = FloatTime() + 1;
ADDRFP4 0
INDIRP4
CNSTI4 6092
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2353
;2353:		range = 150;
ADDRLP4 264
CNSTF4 1125515264
ASGNF4
line 2355
;2354:#ifdef CTF
;2355:		if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $1214
line 2357
;2356:			//if carrying a flag the bot shouldn't be distracted too much
;2357:			if (BotCTFCarryingFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 344
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 344
INDIRI4
CNSTI4 0
EQI4 $1215
line 2358
;2358:				range = 50;
ADDRLP4 264
CNSTF4 1112014848
ASGNF4
line 2359
;2359:		}
ADDRGP4 $1215
JUMPV
LABELV $1214
line 2361
;2360:#endif //CTF
;2361:		else if (gametype == GT_ONEFLAG) {
ADDRGP4 gametype
INDIRI4
CNSTI4 5
NEI4 $1218
line 2362
;2362:			if (Bot1FCTFCarryingFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 344
ADDRGP4 Bot1FCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 344
INDIRI4
CNSTI4 0
EQI4 $1219
line 2363
;2363:				range = 50;
ADDRLP4 264
CNSTF4 1112014848
ASGNF4
line 2364
;2364:		}
ADDRGP4 $1219
JUMPV
LABELV $1218
line 2365
;2365:		else if (gametype == GT_HARVESTER) {
ADDRGP4 gametype
INDIRI4
CNSTI4 7
NEI4 $1222
line 2366
;2366:			if (BotHarvesterCarryingCubes(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 344
ADDRGP4 BotHarvesterCarryingCubes
CALLI4
ASGNI4
ADDRLP4 344
INDIRI4
CNSTI4 0
EQI4 $1224
line 2367
;2367:				range = 80;
ADDRLP4 264
CNSTF4 1117782016
ASGNF4
LABELV $1224
line 2368
;2368:		}
LABELV $1222
LABELV $1219
LABELV $1215
line 2370
;2369:		//
;2370:		if (BotNearbyGoal(bs, bs->tfl, &goal, range)) {
ADDRLP4 344
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 344
INDIRP4
ARGP4
ADDRLP4 344
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 264
INDIRF4
ARGF4
ADDRLP4 348
ADDRGP4 BotNearbyGoal
CALLI4
ASGNI4
ADDRLP4 348
INDIRI4
CNSTI4 0
EQI4 $1226
line 2371
;2371:			trap_BotResetLastAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetLastAvoidReach
CALLV
pop
line 2373
;2372:			//time the bot gets to pick up the nearby goal item
;2373:			bs->nbg_time = FloatTime() + range / 100 + 1;
ADDRFP4 0
INDIRP4
CNSTI4 6072
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 264
INDIRF4
CNSTF4 1008981770
MULF4
ADDF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2374
;2374:			AIEnter_Battle_NBG(bs, "battle retreat: nbg");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1228
ARGP4
ADDRGP4 AIEnter_Battle_NBG
CALLV
pop
line 2375
;2375:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1162
JUMPV
LABELV $1226
line 2377
;2376:		}
;2377:	}
LABELV $1212
line 2379
;2378:	//initialize the movement state
;2379:	BotSetupForMovement(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetupForMovement
CALLV
pop
line 2381
;2380:	//move towards the goal
;2381:	trap_BotMoveToGoal(&moveresult, bs->ms, &goal, bs->tfl);
ADDRLP4 0
ARGP4
ADDRLP4 344
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 344
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 344
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotMoveToGoal
CALLV
pop
line 2383
;2382:	//if the movement failed
;2383:	if (moveresult.failure) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1229
line 2385
;2384:		//reset the avoid reach, otherwise bot is stuck in current area
;2385:		trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 2387
;2386:		//BotAI_Print(PRT_MESSAGE, "movement failure %d\n", moveresult.traveltype);
;2387:		bs->ltg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6068
ADDP4
CNSTF4 0
ASGNF4
line 2388
;2388:	}
LABELV $1229
line 2390
;2389:	//
;2390:	BotAIBlocked(bs, &moveresult, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotAIBlocked
CALLV
pop
line 2392
;2391:	//choose the best weapon to fight with
;2392:	BotChooseWeapon(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotChooseWeapon
CALLV
pop
line 2394
;2393:	//if the view is fixed for the movement
;2394:	if (moveresult.flags & (MOVERESULT_MOVEMENTVIEW|MOVERESULT_SWIMVIEW)) {
ADDRLP4 0+20
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $1231
line 2395
;2395:		VectorCopy(moveresult.ideal_viewangles, bs->ideal_viewangles);
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ADDRLP4 0+40
INDIRB
ASGNB 12
line 2396
;2396:	}
ADDRGP4 $1232
JUMPV
LABELV $1231
line 2397
;2397:	else if (!(moveresult.flags & MOVERESULT_MOVEMENTVIEWSET)
ADDRLP4 0+20
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $1235
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $1235
line 2398
;2398:				&& !(bs->flags & BFL_IDEALVIEWSET) ) {
line 2399
;2399:		attack_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_ATTACK_SKILL, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 348
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 268
ADDRLP4 348
INDIRF4
ASGNF4
line 2401
;2400:		//if the bot is skilled enough
;2401:		if (attack_skill > 0.3) {
ADDRLP4 268
INDIRF4
CNSTF4 1050253722
LEF4 $1238
line 2402
;2402:			BotAimAtEnemy(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotAimAtEnemy
CALLV
pop
line 2403
;2403:		}
ADDRGP4 $1239
JUMPV
LABELV $1238
line 2404
;2404:		else {
line 2405
;2405:			if (trap_BotMovementViewTarget(bs->ms, &goal, bs->tfl, 300, target)) {
ADDRLP4 352
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 352
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 352
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
CNSTF4 1133903872
ARGF4
ADDRLP4 252
ARGP4
ADDRLP4 356
ADDRGP4 trap_BotMovementViewTarget
CALLI4
ASGNI4
ADDRLP4 356
INDIRI4
CNSTI4 0
EQI4 $1240
line 2406
;2406:				VectorSubtract(target, bs->origin, dir);
ADDRLP4 360
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 272
ADDRLP4 252
INDIRF4
ADDRLP4 360
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 272+4
ADDRLP4 252+4
INDIRF4
ADDRLP4 360
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 272+8
ADDRLP4 252+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2407
;2407:				vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 272
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2408
;2408:			}
ADDRGP4 $1241
JUMPV
LABELV $1240
line 2409
;2409:			else {
line 2410
;2410:				vectoangles(moveresult.movedir, bs->ideal_viewangles);
ADDRLP4 0+28
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2411
;2411:			}
LABELV $1241
line 2412
;2412:			bs->ideal_viewangles[2] *= 0.5;
ADDRLP4 360
ADDRFP4 0
INDIRP4
CNSTI4 6584
ADDP4
ASGNP4
ADDRLP4 360
INDIRP4
ADDRLP4 360
INDIRP4
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 2413
;2413:		}
LABELV $1239
line 2414
;2414:	}
LABELV $1235
LABELV $1232
line 2416
;2415:	//if the weapon is used for the bot movement
;2416:	if (moveresult.flags & MOVERESULT_MOVEMENTWEAPON) bs->weaponnum = moveresult.weapon;
ADDRLP4 0+20
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1247
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
ADDRLP4 0+24
INDIRI4
ASGNI4
LABELV $1247
line 2418
;2417:	//attack the enemy if possible
;2418:	BotCheckAttack(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCheckAttack
CALLV
pop
line 2420
;2419:	//
;2420:	return qtrue;
CNSTI4 1
RETI4
LABELV $1162
endproc AINode_Battle_Retreat 364 20
export AIEnter_Battle_NBG
proc AIEnter_Battle_NBG 0 16
line 2428
;2421:}
;2422:
;2423:/*
;2424:==================
;2425:AIEnter_Battle_NBG
;2426:==================
;2427:*/
;2428:void AIEnter_Battle_NBG(bot_state_t *bs, char *s) {
line 2429
;2429:	BotRecordNodeSwitch(bs, "battle NBG", "", s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1252
ARGP4
ADDRGP4 $64
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRecordNodeSwitch
CALLV
pop
line 2430
;2430:	bs->ainode = AINode_Battle_NBG;
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
ADDRGP4 AINode_Battle_NBG
ASGNP4
line 2431
;2431:}
LABELV $1251
endproc AIEnter_Battle_NBG 0 16
export AINode_Battle_NBG
proc AINode_Battle_NBG 352 20
line 2438
;2432:
;2433:/*
;2434:==================
;2435:AINode_Battle_NBG
;2436:==================
;2437:*/
;2438:int AINode_Battle_NBG(bot_state_t *bs) {
line 2446
;2439:	int areanum;
;2440:	bot_goal_t goal;
;2441:	aas_entityinfo_t entinfo;
;2442:	bot_moveresult_t moveresult;
;2443:	float attack_skill;
;2444:	vec3_t target, dir;
;2445:
;2446:	if (BotIsObserver(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 280
ADDRGP4 BotIsObserver
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
EQI4 $1254
line 2447
;2447:		AIEnter_Observer(bs, "battle nbg: observer");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1256
ARGP4
ADDRGP4 AIEnter_Observer
CALLV
pop
line 2448
;2448:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1253
JUMPV
LABELV $1254
line 2451
;2449:	}
;2450:	//if in the intermission
;2451:	if (BotIntermission(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 284
ADDRGP4 BotIntermission
CALLI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 0
EQI4 $1257
line 2452
;2452:		AIEnter_Intermission(bs, "battle nbg: intermission");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1259
ARGP4
ADDRGP4 AIEnter_Intermission
CALLV
pop
line 2453
;2453:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1253
JUMPV
LABELV $1257
line 2456
;2454:	}
;2455:	//respawn if dead
;2456:	if (BotIsDead(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 288
ADDRGP4 BotIsDead
CALLI4
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 0
EQI4 $1260
line 2457
;2457:		AIEnter_Respawn(bs, "battle nbg: bot dead");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1262
ARGP4
ADDRGP4 AIEnter_Respawn
CALLV
pop
line 2458
;2458:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1253
JUMPV
LABELV $1260
line 2461
;2459:	}
;2460:	//if no enemy
;2461:	if (bs->enemy < 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 0
GEI4 $1263
line 2462
;2462:		AIEnter_Seek_NBG(bs, "battle nbg: no enemy");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1265
ARGP4
ADDRGP4 AIEnter_Seek_NBG
CALLV
pop
line 2463
;2463:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1253
JUMPV
LABELV $1263
line 2466
;2464:	}
;2465:	//
;2466:	BotEntityInfo(bs->enemy, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 108
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2467
;2467:	if (EntityIsDead(&entinfo)) {
ADDRLP4 108
ARGP4
ADDRLP4 292
ADDRGP4 EntityIsDead
CALLI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
EQI4 $1266
line 2468
;2468:		AIEnter_Seek_NBG(bs, "battle nbg: enemy dead");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1268
ARGP4
ADDRGP4 AIEnter_Seek_NBG
CALLV
pop
line 2469
;2469:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1253
JUMPV
LABELV $1266
line 2472
;2470:	}
;2471:	//
;2472:	bs->tfl = TFL_DEFAULT;
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
CNSTI4 18616254
ASGNI4
line 2473
;2473:	if (bot_grapple.integer) bs->tfl |= TFL_GRAPPLEHOOK;
ADDRGP4 bot_grapple+12
INDIRI4
CNSTI4 0
EQI4 $1269
ADDRLP4 296
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 296
INDIRP4
ADDRLP4 296
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
LABELV $1269
line 2475
;2474:	//if in lava or slime the bot should be able to get out
;2475:	if (BotInLavaOrSlime(bs)) bs->tfl |= TFL_LAVA|TFL_SLIME;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 300
ADDRGP4 BotInLavaOrSlime
CALLI4
ASGNI4
ADDRLP4 300
INDIRI4
CNSTI4 0
EQI4 $1272
ADDRLP4 304
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 304
INDIRP4
ADDRLP4 304
INDIRP4
INDIRI4
CNSTI4 6291456
BORI4
ASGNI4
LABELV $1272
line 2477
;2476:	//
;2477:	if (BotCanAndWantsToRocketJump(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
ADDRGP4 BotCanAndWantsToRocketJump
CALLI4
ASGNI4
ADDRLP4 308
INDIRI4
CNSTI4 0
EQI4 $1274
line 2478
;2478:		bs->tfl |= TFL_ROCKETJUMP;
ADDRLP4 312
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 312
INDIRP4
ADDRLP4 312
INDIRP4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 2479
;2479:	}
LABELV $1274
line 2481
;2480:	//map specific code
;2481:	BotMapScripts(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotMapScripts
CALLV
pop
line 2483
;2482:	//update the last time the enemy was visible
;2483:	if (BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, bs->enemy)) {
ADDRLP4 312
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 312
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 312
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 312
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 312
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 316
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 316
INDIRF4
CNSTF4 0
EQF4 $1276
line 2484
;2484:		bs->enemyvisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6088
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2485
;2485:		VectorCopy(entinfo.origin, target);
ADDRLP4 252
ADDRLP4 108+24
INDIRB
ASGNB 12
line 2487
;2486:		// if not a player enemy
;2487:		if (bs->enemy >= MAX_CLIENTS) {
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 64
LTI4 $1279
line 2489
;2488:			// if attacking an obelisk
;2489:			if ( bs->enemy == redobelisk.entitynum ||
ADDRLP4 320
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 320
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ADDRGP4 redobelisk+40
INDIRI4
EQI4 $1285
ADDRLP4 320
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ADDRGP4 blueobelisk+40
INDIRI4
NEI4 $1281
LABELV $1285
line 2490
;2490:				bs->enemy == blueobelisk.entitynum ) {
line 2491
;2491:				target[2] += 16;
ADDRLP4 252+8
ADDRLP4 252+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 2492
;2492:			}
LABELV $1281
line 2493
;2493:		}
LABELV $1279
line 2495
;2494:		//update the reachability area and origin if possible
;2495:		areanum = BotPointAreaNum(target);
ADDRLP4 252
ARGP4
ADDRLP4 320
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 248
ADDRLP4 320
INDIRI4
ASGNI4
line 2496
;2496:		if (areanum && trap_AAS_AreaReachability(areanum)) {
ADDRLP4 324
ADDRLP4 248
INDIRI4
ASGNI4
ADDRLP4 324
INDIRI4
CNSTI4 0
EQI4 $1287
ADDRLP4 324
INDIRI4
ARGI4
ADDRLP4 328
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 328
INDIRI4
CNSTI4 0
EQI4 $1287
line 2497
;2497:			VectorCopy(target, bs->lastenemyorigin);
ADDRFP4 0
INDIRP4
CNSTI4 6548
ADDP4
ADDRLP4 252
INDIRB
ASGNB 12
line 2498
;2498:			bs->lastenemyareanum = areanum;
ADDRFP4 0
INDIRP4
CNSTI4 6544
ADDP4
ADDRLP4 248
INDIRI4
ASGNI4
line 2499
;2499:		}
LABELV $1287
line 2500
;2500:	}
LABELV $1276
line 2502
;2501:	//if the bot has no goal or touches the current goal
;2502:	if (!trap_BotGetTopGoal(bs->gs, &goal)) {
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 320
ADDRGP4 trap_BotGetTopGoal
CALLI4
ASGNI4
ADDRLP4 320
INDIRI4
CNSTI4 0
NEI4 $1289
line 2503
;2503:		bs->nbg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6072
ADDP4
CNSTF4 0
ASGNF4
line 2504
;2504:	}
ADDRGP4 $1290
JUMPV
LABELV $1289
line 2505
;2505:	else if (BotReachedGoal(bs, &goal)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 324
ADDRGP4 BotReachedGoal
CALLI4
ASGNI4
ADDRLP4 324
INDIRI4
CNSTI4 0
EQI4 $1291
line 2506
;2506:		bs->nbg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6072
ADDP4
CNSTF4 0
ASGNF4
line 2507
;2507:	}
LABELV $1291
LABELV $1290
line 2509
;2508:	//
;2509:	if (bs->nbg_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6072
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $1293
line 2511
;2510:		//pop the current goal from the stack
;2511:		trap_BotPopGoal(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotPopGoal
CALLV
pop
line 2513
;2512:		//if the bot still has a goal
;2513:		if (trap_BotGetTopGoal(bs->gs, &goal))
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 328
ADDRGP4 trap_BotGetTopGoal
CALLI4
ASGNI4
ADDRLP4 328
INDIRI4
CNSTI4 0
EQI4 $1295
line 2514
;2514:			AIEnter_Battle_Retreat(bs, "battle nbg: time out");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1297
ARGP4
ADDRGP4 AIEnter_Battle_Retreat
CALLV
pop
ADDRGP4 $1296
JUMPV
LABELV $1295
line 2516
;2515:		else
;2516:			AIEnter_Battle_Fight(bs, "battle nbg: time out");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1297
ARGP4
ADDRGP4 AIEnter_Battle_Fight
CALLV
pop
LABELV $1296
line 2518
;2517:		//
;2518:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1253
JUMPV
LABELV $1293
line 2521
;2519:	}
;2520:	//initialize the movement state
;2521:	BotSetupForMovement(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetupForMovement
CALLV
pop
line 2523
;2522:	//move towards the goal
;2523:	trap_BotMoveToGoal(&moveresult, bs->ms, &goal, bs->tfl);
ADDRLP4 0
ARGP4
ADDRLP4 328
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 328
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 328
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotMoveToGoal
CALLV
pop
line 2525
;2524:	//if the movement failed
;2525:	if (moveresult.failure) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1298
line 2527
;2526:		//reset the avoid reach, otherwise bot is stuck in current area
;2527:		trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 2529
;2528:		//BotAI_Print(PRT_MESSAGE, "movement failure %d\n", moveresult.traveltype);
;2529:		bs->nbg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6072
ADDP4
CNSTF4 0
ASGNF4
line 2530
;2530:	}
LABELV $1298
line 2532
;2531:	//
;2532:	BotAIBlocked(bs, &moveresult, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotAIBlocked
CALLV
pop
line 2534
;2533:	//update the attack inventory values
;2534:	BotUpdateBattleInventory(bs, bs->enemy);
ADDRLP4 332
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 332
INDIRP4
ARGP4
ADDRLP4 332
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotUpdateBattleInventory
CALLV
pop
line 2536
;2535:	//choose the best weapon to fight with
;2536:	BotChooseWeapon(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotChooseWeapon
CALLV
pop
line 2538
;2537:	//if the view is fixed for the movement
;2538:	if (moveresult.flags & (MOVERESULT_MOVEMENTVIEW|MOVERESULT_SWIMVIEW)) {
ADDRLP4 0+20
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $1300
line 2539
;2539:		VectorCopy(moveresult.ideal_viewangles, bs->ideal_viewangles);
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ADDRLP4 0+40
INDIRB
ASGNB 12
line 2540
;2540:	}
ADDRGP4 $1301
JUMPV
LABELV $1300
line 2541
;2541:	else if (!(moveresult.flags & MOVERESULT_MOVEMENTVIEWSET)
ADDRLP4 0+20
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $1304
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $1304
line 2542
;2542:				&& !(bs->flags & BFL_IDEALVIEWSET)) {
line 2543
;2543:		attack_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_ATTACK_SKILL, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 336
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 264
ADDRLP4 336
INDIRF4
ASGNF4
line 2545
;2544:		//if the bot is skilled enough and the enemy is visible
;2545:		if (attack_skill > 0.3) {
ADDRLP4 264
INDIRF4
CNSTF4 1050253722
LEF4 $1307
line 2547
;2546:			//&& BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, bs->enemy)
;2547:			BotAimAtEnemy(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotAimAtEnemy
CALLV
pop
line 2548
;2548:		}
ADDRGP4 $1308
JUMPV
LABELV $1307
line 2549
;2549:		else {
line 2550
;2550:			if (trap_BotMovementViewTarget(bs->ms, &goal, bs->tfl, 300, target)) {
ADDRLP4 340
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 340
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 340
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
CNSTF4 1133903872
ARGF4
ADDRLP4 252
ARGP4
ADDRLP4 344
ADDRGP4 trap_BotMovementViewTarget
CALLI4
ASGNI4
ADDRLP4 344
INDIRI4
CNSTI4 0
EQI4 $1309
line 2551
;2551:				VectorSubtract(target, bs->origin, dir);
ADDRLP4 348
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 268
ADDRLP4 252
INDIRF4
ADDRLP4 348
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 268+4
ADDRLP4 252+4
INDIRF4
ADDRLP4 348
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 268+8
ADDRLP4 252+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2552
;2552:				vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 268
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2553
;2553:			}
ADDRGP4 $1310
JUMPV
LABELV $1309
line 2554
;2554:			else {
line 2555
;2555:				vectoangles(moveresult.movedir, bs->ideal_viewangles);
ADDRLP4 0+28
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2556
;2556:			}
LABELV $1310
line 2557
;2557:			bs->ideal_viewangles[2] *= 0.5;
ADDRLP4 348
ADDRFP4 0
INDIRP4
CNSTI4 6584
ADDP4
ASGNP4
ADDRLP4 348
INDIRP4
ADDRLP4 348
INDIRP4
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 2558
;2558:		}
LABELV $1308
line 2559
;2559:	}
LABELV $1304
LABELV $1301
line 2561
;2560:	//if the weapon is used for the bot movement
;2561:	if (moveresult.flags & MOVERESULT_MOVEMENTWEAPON) bs->weaponnum = moveresult.weapon;
ADDRLP4 0+20
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1316
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
ADDRLP4 0+24
INDIRI4
ASGNI4
LABELV $1316
line 2563
;2562:	//attack the enemy if possible
;2563:	BotCheckAttack(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCheckAttack
CALLV
pop
line 2565
;2564:	//
;2565:	return qtrue;
CNSTI4 1
RETI4
LABELV $1253
endproc AINode_Battle_NBG 352 20
bss
export nodeswitch
align 1
LABELV nodeswitch
skip 7344
export numnodeswitches
align 4
LABELV numnodeswitches
skip 4
import BotSetTeamMateTaskPreference
import BotGetTeamMateTaskPreference
import BotTeamAI
import AIEnter_Seek_Camp
import BotPrintTeamGoal
import BotMatchMessage
import notleader
import BotChatTest
import BotValidChatPosition
import BotChatTime
import BotChat_Random
import BotChat_EnemySuicide
import BotChat_Kill
import BotChat_Death
import BotChat_HitNoKill
import BotChat_HitNoDeath
import BotChat_HitTalking
import BotChat_EndLevel
import BotChat_StartLevel
import BotChat_ExitGame
import BotChat_EnterGame
import neutralobelisk
import blueobelisk
import redobelisk
import ctf_neutralflag
import ctf_blueflag
import ctf_redflag
import bot_challenge
import bot_testrchat
import bot_nochat
import bot_fastchat
import bot_rocketjump
import bot_grapple
import mapname
import gametype
import BotMapScripts
import BotPointAreaNum
import ClientOnSameTeamFromName
import ClientFromName
import stristr
import BotFindWayPoint
import BotCreateWayPoint
import BotAlternateRoute
import BotGetAlternateRouteGoal
import BotEnemyCubeCarrierVisible
import BotTeamCubeCarrierVisible
import BotHarvesterRetreatGoals
import BotHarvesterSeekGoals
import BotGoHarvest
import BotObeliskRetreatGoals
import BotObeliskSeekGoals
import Bot1FCTFRetreatGoals
import Bot1FCTFSeekGoals
import BotHarvesterCarryingCubes
import Bot1FCTFCarryingFlag
import BotCTFRetreatGoals
import BotCTFSeekGoals
import BotRememberLastOrderedTask
import BotCTFCarryingFlag
import BotOppositeTeam
import BotTeam
import BotClearActivateGoalStack
import BotPopFromActivateGoalStack
import BotEnableActivateGoalAreas
import BotAIPredictObstacles
import BotAIBlocked
import BotCheckAttack
import BotAimAtEnemy
import BotEntityVisible
import BotRoamGoal
import BotFindEnemy
import InFieldOfVision
import BotVisibleTeamMatesAndEnemies
import BotEnemyFlagCarrierVisible
import BotTeamFlagCarrierVisible
import BotTeamFlagCarrier
import TeamPlayIsOn
import BotSameTeam
import BotAttackMove
import BotWantsToCamp
import BotHasPersistantPowerupAndWeapon
import BotCanAndWantsToRocketJump
import BotWantsToHelp
import BotWantsToChase
import BotWantsToRetreat
import BotFeelingBad
import BotAggression
import BotTeamGoals
import BotSetLastOrderedTask
import BotSynonymContext
import ClientSkin
import EasyClientName
import ClientName
import BotSetTeamStatus
import EntityHasKamikaze
import EntityIsShooting
import EntityIsInvisible
import EntityIsDead
import BotInLavaOrSlime
import BotIntermission
import BotIsObserver
import BotIsDead
import BotBattleUseItems
import BotUpdateBattleInventory
import BotUpdateInventory
import BotSetupForMovement
import BotChooseWeapon
import BotFreeWaypoints
import BotDeathmatchAI
import BotShutdownDeathmatchAI
import BotSetupDeathmatchAI
import BotTeamLeader
import BotAI_GetSnapshotEntity
import BotAI_GetEntityState
import BotAI_GetClientState
import BotAI_Trace
import BotAI_BotInitialChat
import BotAI_Print
import floattime
import BotEntityInfo
import NumBots
import BotResetState
import BotResetWeaponState
import BotFreeWeaponState
import BotAllocWeaponState
import BotLoadWeaponWeights
import BotGetWeaponInfo
import BotChooseBestFightWeapon
import BotShutdownWeaponAI
import BotSetupWeaponAI
import BotShutdownMoveAI
import BotSetupMoveAI
import BotSetBrushModelTypes
import BotAddAvoidSpot
import BotInitMoveState
import BotFreeMoveState
import BotAllocMoveState
import BotPredictVisiblePosition
import BotMovementViewTarget
import BotReachabilityArea
import BotResetLastAvoidReach
import BotResetAvoidReach
import BotMoveInDirection
import BotMoveToGoal
import BotResetMoveState
import BotShutdownGoalAI
import BotSetupGoalAI
import BotFreeGoalState
import BotAllocGoalState
import BotFreeItemWeights
import BotLoadItemWeights
import BotMutateGoalFuzzyLogic
import BotSaveGoalFuzzyLogic
import BotInterbreedGoalFuzzyLogic
import BotUpdateEntityItems
import BotInitLevelItems
import BotSetAvoidGoalTime
import BotAvoidGoalTime
import BotGetMapLocationGoal
import BotGetNextCampSpotGoal
import BotGetLevelItemGoal
import BotItemGoalInVisButNotVisible
import BotTouchingGoal
import BotChooseNBGItem
import BotChooseLTGItem
import BotGetSecondGoal
import BotGetTopGoal
import BotGoalName
import BotDumpGoalStack
import BotDumpAvoidGoals
import BotEmptyGoalStack
import BotPopGoal
import BotPushGoal
import BotRemoveFromAvoidGoals
import BotResetAvoidGoals
import BotResetGoalState
import GeneticParentsAndChildSelection
import BotSetChatName
import BotSetChatGender
import BotLoadChatFile
import BotReplaceSynonyms
import UnifyWhiteSpaces
import BotMatchVariable
import BotFindMatch
import StringContains
import BotGetChatMessage
import BotEnterChat
import BotChatLength
import BotReplyChat
import BotNumInitialChats
import BotInitialChat
import BotNumConsoleMessages
import BotNextConsoleMessage
import BotRemoveConsoleMessage
import BotQueueConsoleMessage
import BotFreeChatState
import BotAllocChatState
import BotShutdownChatAI
import BotSetupChatAI
import BotShutdownCharacters
import Characteristic_String
import Characteristic_BInteger
import Characteristic_Integer
import Characteristic_BFloat
import Characteristic_Float
import BotFreeCharacter
import BotLoadCharacter
import EA_Shutdown
import EA_Setup
import EA_ResetInput
import EA_GetInput
import EA_EndRegular
import EA_View
import EA_Move
import EA_DelayedJump
import EA_Jump
import EA_SelectWeapon
import EA_Use
import EA_Gesture
import EA_Talk
import EA_Respawn
import EA_Attack
import EA_MoveRight
import EA_MoveLeft
import EA_MoveBack
import EA_MoveForward
import EA_MoveDown
import EA_MoveUp
import EA_Walk
import EA_Crouch
import EA_Action
import EA_Command
import EA_SayTeam
import EA_Say
import GetBotLibAPI
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
LABELV $1297
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 98
byte 1 103
byte 1 58
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $1268
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 98
byte 1 103
byte 1 58
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $1265
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 98
byte 1 103
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 0
align 1
LABELV $1262
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 98
byte 1 103
byte 1 58
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $1259
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 98
byte 1 103
byte 1 58
byte 1 32
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
LABELV $1256
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 98
byte 1 103
byte 1 58
byte 1 32
byte 1 111
byte 1 98
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1252
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 78
byte 1 66
byte 1 71
byte 1 0
align 1
LABELV $1228
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 58
byte 1 32
byte 1 110
byte 1 98
byte 1 103
byte 1 0
align 1
LABELV $1211
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 119
byte 1 97
byte 1 121
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $1208
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 58
byte 1 32
byte 1 97
byte 1 110
byte 1 111
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 0
align 1
LABELV $1203
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 58
byte 1 32
byte 1 108
byte 1 111
byte 1 115
byte 1 116
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 0
align 1
LABELV $1187
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 58
byte 1 32
byte 1 119
byte 1 97
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $1177
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $1174
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 0
align 1
LABELV $1171
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 58
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $1168
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 58
byte 1 32
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
LABELV $1165
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 58
byte 1 32
byte 1 111
byte 1 98
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1161
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $1159
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 115
byte 1 101
byte 1 58
byte 1 32
byte 1 119
byte 1 97
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $1133
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 115
byte 1 101
byte 1 58
byte 1 32
byte 1 110
byte 1 98
byte 1 103
byte 1 0
align 1
LABELV $1128
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 115
byte 1 101
byte 1 58
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $1103
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 115
byte 1 101
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 97
byte 1 0
align 1
LABELV $1100
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 115
byte 1 101
byte 1 58
byte 1 32
byte 1 98
byte 1 101
byte 1 116
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 0
align 1
LABELV $1095
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 115
byte 1 101
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 0
align 1
LABELV $1092
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 115
byte 1 101
byte 1 58
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $1089
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 115
byte 1 101
byte 1 58
byte 1 32
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
LABELV $1086
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 115
byte 1 101
byte 1 58
byte 1 32
byte 1 111
byte 1 98
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1082
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $1080
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 58
byte 1 32
byte 1 119
byte 1 97
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $1066
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 115
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $1063
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 58
byte 1 32
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 115
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $1055
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 58
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 104
byte 1 105
byte 1 116
byte 1 32
byte 1 115
byte 1 111
byte 1 109
byte 1 101
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $1050
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 58
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 32
byte 1 100
byte 1 101
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1034
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 105
byte 1 115
byte 1 105
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $1027
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $1018
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 0
align 1
LABELV $1009
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 58
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $1006
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 58
byte 1 32
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
LABELV $1003
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 58
byte 1 32
byte 1 111
byte 1 98
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $998
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $957
byte 1 108
byte 1 116
byte 1 103
byte 1 32
byte 1 115
byte 1 101
byte 1 101
byte 1 107
byte 1 58
byte 1 32
byte 1 110
byte 1 98
byte 1 103
byte 1 0
align 1
LABELV $936
byte 1 115
byte 1 101
byte 1 101
byte 1 107
byte 1 32
byte 1 108
byte 1 116
byte 1 103
byte 1 58
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 0
align 1
LABELV $920
byte 1 115
byte 1 101
byte 1 101
byte 1 107
byte 1 32
byte 1 108
byte 1 116
byte 1 103
byte 1 58
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $917
byte 1 115
byte 1 101
byte 1 101
byte 1 107
byte 1 32
byte 1 108
byte 1 116
byte 1 103
byte 1 58
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $914
byte 1 115
byte 1 101
byte 1 101
byte 1 107
byte 1 32
byte 1 108
byte 1 116
byte 1 103
byte 1 58
byte 1 32
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
LABELV $911
byte 1 115
byte 1 101
byte 1 101
byte 1 107
byte 1 32
byte 1 108
byte 1 116
byte 1 103
byte 1 58
byte 1 32
byte 1 111
byte 1 98
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $907
byte 1 115
byte 1 101
byte 1 101
byte 1 107
byte 1 32
byte 1 76
byte 1 84
byte 1 71
byte 1 0
align 1
LABELV $902
byte 1 115
byte 1 101
byte 1 101
byte 1 107
byte 1 32
byte 1 110
byte 1 98
byte 1 103
byte 1 58
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 0
align 1
LABELV $865
byte 1 115
byte 1 101
byte 1 101
byte 1 107
byte 1 32
byte 1 110
byte 1 98
byte 1 103
byte 1 58
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $851
byte 1 115
byte 1 101
byte 1 101
byte 1 107
byte 1 32
byte 1 110
byte 1 98
byte 1 103
byte 1 58
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $848
byte 1 115
byte 1 101
byte 1 101
byte 1 107
byte 1 32
byte 1 110
byte 1 98
byte 1 103
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $845
byte 1 115
byte 1 101
byte 1 101
byte 1 107
byte 1 32
byte 1 110
byte 1 98
byte 1 103
byte 1 58
byte 1 32
byte 1 111
byte 1 98
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $841
byte 1 110
byte 1 111
byte 1 32
byte 1 103
byte 1 111
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $840
byte 1 115
byte 1 101
byte 1 101
byte 1 107
byte 1 32
byte 1 78
byte 1 66
byte 1 71
byte 1 0
align 1
LABELV $835
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 58
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 0
align 1
LABELV $784
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 58
byte 1 32
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $773
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 58
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $750
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 103
byte 1 111
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $742
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 58
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $739
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 58
byte 1 32
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
LABELV $736
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 58
byte 1 32
byte 1 111
byte 1 98
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $732
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $630
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 58
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $622
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $620
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 100
byte 1 58
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $617
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 100
byte 1 58
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 0
align 1
LABELV $607
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $605
byte 1 111
byte 1 98
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 32
byte 1 111
byte 1 98
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $601
byte 1 111
byte 1 98
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $599
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
byte 1 58
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $591
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
LABELV $560
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $557
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 95
byte 1 115
byte 1 116
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $547
byte 1 104
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $478
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $441
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $407
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $398
byte 1 112
byte 1 97
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 95
byte 1 115
byte 1 116
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $385
byte 1 112
byte 1 97
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $384
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 0
align 1
LABELV $353
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $344
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 95
byte 1 115
byte 1 116
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $339
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $331
byte 1 103
byte 1 101
byte 1 116
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 103
byte 1 111
byte 1 116
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $328
byte 1 103
byte 1 101
byte 1 116
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 110
byte 1 111
byte 1 116
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $323
byte 1 103
byte 1 101
byte 1 116
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $316
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 95
byte 1 100
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $313
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $302
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 95
byte 1 115
byte 1 116
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $299
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $290
byte 1 97
byte 1 99
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 97
byte 1 110
byte 1 121
byte 1 95
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 102
byte 1 105
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $281
byte 1 66
byte 1 111
byte 1 116
byte 1 76
byte 1 111
byte 1 110
byte 1 103
byte 1 84
byte 1 101
byte 1 114
byte 1 109
byte 1 71
byte 1 111
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 103
byte 1 111
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 97
byte 1 105
byte 1 114
byte 1 0
align 1
LABELV $259
byte 1 97
byte 1 99
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 97
byte 1 110
byte 1 121
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $166
byte 1 97
byte 1 99
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 97
byte 1 110
byte 1 121
byte 1 95
byte 1 115
byte 1 116
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $163
byte 1 97
byte 1 99
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 97
byte 1 110
byte 1 121
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $137
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $66
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 50
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $64
byte 1 0
align 1
LABELV $63
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $58
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 101
byte 1 100
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 65
byte 1 73
byte 1 32
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 115
byte 1 10
byte 1 0
