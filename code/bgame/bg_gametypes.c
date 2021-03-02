
#include "../qcommon/q_shared.h"
#include "../bgame/bg_public.h"

#define DIS_ITEM_AMMO		( 1 << IT_AMMO )
#define DIS_ITEM_ARMOR		( 1 << IT_ARMOR )
#define DIS_ITEM_HEALTH		( 1 << IT_HEALTH )
#define DIS_ITEM_HOLDABLE	( 1 << IT_HOLDABLE )
#define DIS_ITEM_INSTANT	( 1 << IT_INSTANT )
#define DIS_ITEM_KEY		( 1 << IT_KEY )
#define DIS_ITEM_POWERUP	( 1 << IT_POWERUP )
#define DIS_ITEM_RUNES		( 1 << IT_RUNE )
#define DIS_ITEM_TEAM		( 1 << IT_TEAM )
#define DIS_ITEM_WEAPONS	( 1 << IT_WEAPON )

bggametypes_t	gt[GT_MAX_GAME_TYPE] = {
	{
/* index */			GT_CAMPAIGN,
/* longName */		"Campaign Mode",
/* shortName */		"CAM",
/* gtSpawnRef */	"campaign",
/* gtArenaRef */	"campaign",

/* gtFlags */		GTF_CAMPAIGN,
/* elimLives */		0,
/* gtGoal */		GTL_OBJ,
/* disableItem */	DIS_ITEM_RUNES | DIS_ITEM_TEAM
	},
	{
/* index */			GT_FFA,
/* longName */		"Free For All",
/* shortName */		"FFA",
/* gtSpawnRef */	"ffa",
/* gtArenaRef */	"ffa",

/* gtFlags */		0,
/* elimLives */		0,
/* gtGoal */		GTL_FRAGS,
/* disableItem */	DIS_ITEM_TEAM
	},
	{
/* index */			GT_DUEL,
/* longName */		"Duel",
/* shortName */		"DUEL",
/* gtSpawnRef */	"tournament",
/* gtArenaRef */	"tourney",

/* gtFlags */		GTF_TOURNEY | GTF_DUEL,
/* elimLives */		0,
/* gtGoal */		GTL_FRAGS,
/* disableItem */	DIS_ITEM_RUNES | DIS_ITEM_TEAM | DIS_ITEM_POWERUP
	},
	{
/* index */			GT_TDM,
/* longName */		"Team Deathmatch",
/* shortName */		"TDM",
/* gtSpawnRef */	"team",
/* gtArenaRef */	"team",

/* gtFlags */		GTF_TEAMS | GTF_TDM,
/* elimLives */		0,
/* gtGoal */		GTL_FRAGS,
/* disableItem */	DIS_ITEM_TEAM
	},
	{
/* index */			GT_CTF,
/* longName */		"Capture The Flag",
/* shortName */		"CTF",
/* gtSpawnRef */	"ctf",
/* gtArenaRef */	"ctf",

/* gtFlags */		GTF_CTF | GTF_TEAMS | GTF_TEAMBASES,
/* elimLives */		0,
/* gtGoal */		GTL_CAPTURES,
/* disableItem */	0
	},
	{
/* index */			GT_ONEFLAG,
/* longName */		"One Flag",
/* shortName */		"1F",
/* gtSpawnRef */	"oneflag",
/* gtArenaRef */	"oneflag",

/* gtFlags */		GTF_TEAMS | GTF_TEAMBASES | GTF_BASEOB | GTF_NEUTOB,
/* elimLives */		0,
/* gtGoal */		GTL_CAPTURES,
/* disableItem */	0
	},
	{
/* index */			GT_OVERLOAD,
/* longName */		"Overload",
/* shortName */		"OVL",
/* gtSpawnRef */	"obelisk",
/* gtArenaRef */	"overload",

/* gtFlags */		GTF_TEAMS | GTF_TEAMBASES | GTF_BASEOB,
/* elimLives */		0,
/* gtGoal */		GTL_POINTS,
/* disableItem */	0
	},
	{
/* index */			GT_HARVESTER,
/* longName */		"Harvester",
/* shortName */		"HAR",
/* gtSpawnRef */	"harvester",
/* gtArenaRef */	"harvester",

/* gtFlags */		GTF_TEAMS | GTF_TEAMBASES | GTF_BASEOB | GTF_NEUTOB,
/* elimLives */		0,
/* gtGoal */		GTL_POINTS,
/* disableItem */	0
	},
};
