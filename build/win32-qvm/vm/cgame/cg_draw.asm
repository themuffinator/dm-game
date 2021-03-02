data
export drawTeamOverlayModificationCount
align 4
LABELV drawTeamOverlayModificationCount
byte 4 -1
code
proc CG_DrawField 64 20
file "..\..\..\..\code\cgame\cg_draw.c"
line 183
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_draw.c -- draw all of the graphical elements during
;4:// active (after loading) gameplay
;5:
;6:#include "cg_local.h"
;7:
;8:int drawTeamOverlayModificationCount = -1;
;9:
;10:int sortedTeamPlayers[TEAM_MAXOVERLAY];
;11:int	numSortedTeamPlayers;
;12:
;13:char systemChat[256];
;14:char teamChat1[256];
;15:char teamChat2[256];
;16:
;17:#ifdef SUI
;18:
;19:int CG_Text_Width(const char *text, float scale, int limit) {
;20:  int count,len;
;21:	float out;
;22:	glyphInfo_t *glyph;
;23:	float useScale;
;24:// FIXME: see ui_main.c, same problem
;25://	const unsigned char *s = text;
;26:	const char *s = text;
;27:	fontInfo_t *font = &cgDC.Assets.textFont;
;28:	if (scale <= cg_smallFont.value) {
;29:		font = &cgDC.Assets.smallFont;
;30:	} else if (scale > cg_bigFont.value) {
;31:		font = &cgDC.Assets.bigFont;
;32:	}
;33:	useScale = scale * font->glyphScale;
;34:  out = 0;
;35:  if (text) {
;36:    len = strlen(text);
;37:		if (limit > 0 && len > limit) {
;38:			len = limit;
;39:		}
;40:		count = 0;
;41:		while (s && *s && count < len) {
;42:			if ( Q_IsColorString(s) ) {
;43:				s += 2;
;44:				continue;
;45:			} else {
;46:				glyph = &font->glyphs[(int)*s]; // TTimo: FIXME: getting nasty warnings without the cast, hopefully this doesn't break the VM build
;47:				out += glyph->xSkip;
;48:				s++;
;49:				count++;
;50:			}
;51:    }
;52:  }
;53:  return out * useScale;
;54:}
;55:
;56:int CG_Text_Height(const char *text, float scale, int limit) {
;57:  int len, count;
;58:	float max;
;59:	glyphInfo_t *glyph;
;60:	float useScale;
;61:// TTimo: FIXME
;62://	const unsigned char *s = text;
;63:	const char *s = text;
;64:	fontInfo_t *font = &cgDC.Assets.textFont;
;65:	if (scale <= cg_smallFont.value) {
;66:		font = &cgDC.Assets.smallFont;
;67:	} else if (scale > cg_bigFont.value) {
;68:		font = &cgDC.Assets.bigFont;
;69:	}
;70:	useScale = scale * font->glyphScale;
;71:  max = 0;
;72:  if (text) {
;73:    len = strlen(text);
;74:		if (limit > 0 && len > limit) {
;75:			len = limit;
;76:		}
;77:		count = 0;
;78:		while (s && *s && count < len) {
;79:			if ( Q_IsColorString(s) ) {
;80:				s += 2;
;81:				continue;
;82:			} else {
;83:				glyph = &font->glyphs[(int)*s]; // TTimo: FIXME: getting nasty warnings without the cast, hopefully this doesn't break the VM build
;84:	      if (max < glyph->height) {
;85:		      max = glyph->height;
;86:			  }
;87:				s++;
;88:				count++;
;89:			}
;90:    }
;91:  }
;92:  return max * useScale;
;93:}
;94:
;95:void CG_Text_PaintChar(float x, float y, float width, float height, float scale, float s, float t, float s2, float t2, qhandle_t hShader) {
;96:  float w, h;
;97:  w = width * scale;
;98:  h = height * scale;
;99:  CG_AdjustFrom640( &x, &y, &w, &h );
;100:  trap_R_DrawStretchPic( x, y, w, h, s, t, s2, t2, hShader );
;101:}
;102:
;103:void CG_Text_Paint(float x, float y, float scale, vec4_t color, const char *text, float adjust, int limit, int style) {
;104:  int len, count;
;105:	vec4_t newColor;
;106:	glyphInfo_t *glyph;
;107:	float useScale;
;108:	fontInfo_t *font = &cgDC.Assets.textFont;
;109:	if (scale <= cg_smallFont.value) {
;110:		font = &cgDC.Assets.smallFont;
;111:	} else if (scale > cg_bigFont.value) {
;112:		font = &cgDC.Assets.bigFont;
;113:	}
;114:	useScale = scale * font->glyphScale;
;115:  if (text) {
;116:// TTimo: FIXME
;117://		const unsigned char *s = text;
;118:		const char *s = text;
;119:		trap_R_SetColor( color );
;120:		memcpy(&newColor[0], &color[0], sizeof(vec4_t));
;121:    len = strlen(text);
;122:		if (limit > 0 && len > limit) {
;123:			len = limit;
;124:		}
;125:		count = 0;
;126:		while (s && *s && count < len) {
;127:			glyph = &font->glyphs[(int)*s]; // TTimo: FIXME: getting nasty warnings without the cast, hopefully this doesn't break the VM build
;128:      //int yadj = Assets.textFont.glyphs[text[i]].bottom + Assets.textFont.glyphs[text[i]].top;
;129:      //float yadj = scale * (Assets.textFont.glyphs[text[i]].imageHeight - Assets.textFont.glyphs[text[i]].height);
;130:			if ( Q_IsColorString( s ) ) {
;131:				memcpy( newColor, g_color_table[ColorIndex(*(s+1))], sizeof( newColor ) );
;132:				newColor[3] = color[3];
;133:				trap_R_SetColor( newColor );
;134:				s += 2;
;135:				continue;
;136:			} else {
;137:				float yadj = useScale * glyph->top;
;138:				if (style == ITEM_TEXTSTYLE_SHADOWED || style == ITEM_TEXTSTYLE_SHADOWEDMORE) {
;139:					int ofs = style == ITEM_TEXTSTYLE_SHADOWED ? 1 : 2;
;140:					colorBlack[3] = newColor[3];
;141:					trap_R_SetColor( colorBlack );
;142:					CG_Text_PaintChar(x + ofs, y - yadj + ofs, 
;143:														glyph->imageWidth,
;144:														glyph->imageHeight,
;145:														useScale, 
;146:														glyph->s,
;147:														glyph->t,
;148:														glyph->s2,
;149:														glyph->t2,
;150:														glyph->glyph);
;151:					colorBlack[3] = 1.0;
;152:					trap_R_SetColor( newColor );
;153:				}
;154:				CG_Text_PaintChar(x, y - yadj, 
;155:													glyph->imageWidth,
;156:													glyph->imageHeight,
;157:													useScale, 
;158:													glyph->s,
;159:													glyph->t,
;160:													glyph->s2,
;161:													glyph->t2,
;162:													glyph->glyph);
;163:				// CG_DrawPic(x, y - yadj, scale * cgDC.Assets.textFont.glyphs[text[i]].imageWidth, scale * cgDC.Assets.textFont.glyphs[text[i]].imageHeight, cgDC.Assets.textFont.glyphs[text[i]].glyph);
;164:				x += (glyph->xSkip * useScale) + adjust;
;165:				s++;
;166:				count++;
;167:			}
;168:    }
;169:	  trap_R_SetColor( NULL );
;170:  }
;171:}
;172:
;173:
;174:#endif //SUI
;175:
;176:/*
;177:==============
;178:CG_DrawField
;179:
;180:Draws large numbers for status bar and powerups
;181:==============
;182:*/
;183:static void CG_DrawField (int x, int y, int width, int value) {
line 188
;184:	char	num[16], *ptr;
;185:	int		l;
;186:	int		frame;
;187:
;188:	if ( width < 1 ) {
ADDRFP4 8
INDIRI4
CNSTI4 1
GEI4 $74
line 189
;189:		return;
ADDRGP4 $73
JUMPV
LABELV $74
line 193
;190:	}
;191:
;192:	// draw number string
;193:	if ( width > 5 ) {
ADDRFP4 8
INDIRI4
CNSTI4 5
LEI4 $76
line 194
;194:		width = 5;
ADDRFP4 8
CNSTI4 5
ASGNI4
line 195
;195:	}
LABELV $76
line 197
;196:
;197:	switch ( width ) {
ADDRLP4 28
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 1
LTI4 $78
ADDRLP4 28
INDIRI4
CNSTI4 4
GTI4 $78
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $108-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $108
address $80
address $87
address $94
address $101
code
LABELV $80
line 199
;198:	case 1:
;199:		value = value > 9 ? 9 : value;
ADDRFP4 12
INDIRI4
CNSTI4 9
LEI4 $82
ADDRLP4 32
CNSTI4 9
ASGNI4
ADDRGP4 $83
JUMPV
LABELV $82
ADDRLP4 32
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $83
ADDRFP4 12
ADDRLP4 32
INDIRI4
ASGNI4
line 200
;200:		value = value < 0 ? 0 : value;
ADDRFP4 12
INDIRI4
CNSTI4 0
GEI4 $85
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRGP4 $86
JUMPV
LABELV $85
ADDRLP4 36
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $86
ADDRFP4 12
ADDRLP4 36
INDIRI4
ASGNI4
line 201
;201:		break;
ADDRGP4 $79
JUMPV
LABELV $87
line 203
;202:	case 2:
;203:		value = value > 99 ? 99 : value;
ADDRFP4 12
INDIRI4
CNSTI4 99
LEI4 $89
ADDRLP4 40
CNSTI4 99
ASGNI4
ADDRGP4 $90
JUMPV
LABELV $89
ADDRLP4 40
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $90
ADDRFP4 12
ADDRLP4 40
INDIRI4
ASGNI4
line 204
;204:		value = value < -9 ? -9 : value;
ADDRFP4 12
INDIRI4
CNSTI4 -9
GEI4 $92
ADDRLP4 44
CNSTI4 -9
ASGNI4
ADDRGP4 $93
JUMPV
LABELV $92
ADDRLP4 44
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $93
ADDRFP4 12
ADDRLP4 44
INDIRI4
ASGNI4
line 205
;205:		break;
ADDRGP4 $79
JUMPV
LABELV $94
line 207
;206:	case 3:
;207:		value = value > 999 ? 999 : value;
ADDRFP4 12
INDIRI4
CNSTI4 999
LEI4 $96
ADDRLP4 48
CNSTI4 999
ASGNI4
ADDRGP4 $97
JUMPV
LABELV $96
ADDRLP4 48
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $97
ADDRFP4 12
ADDRLP4 48
INDIRI4
ASGNI4
line 208
;208:		value = value < -99 ? -99 : value;
ADDRFP4 12
INDIRI4
CNSTI4 -99
GEI4 $99
ADDRLP4 52
CNSTI4 -99
ASGNI4
ADDRGP4 $100
JUMPV
LABELV $99
ADDRLP4 52
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $100
ADDRFP4 12
ADDRLP4 52
INDIRI4
ASGNI4
line 209
;209:		break;
ADDRGP4 $79
JUMPV
LABELV $101
line 211
;210:	case 4:
;211:		value = value > 9999 ? 9999 : value;
ADDRFP4 12
INDIRI4
CNSTI4 9999
LEI4 $103
ADDRLP4 56
CNSTI4 9999
ASGNI4
ADDRGP4 $104
JUMPV
LABELV $103
ADDRLP4 56
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $104
ADDRFP4 12
ADDRLP4 56
INDIRI4
ASGNI4
line 212
;212:		value = value < -999 ? -999 : value;
ADDRFP4 12
INDIRI4
CNSTI4 -999
GEI4 $106
ADDRLP4 60
CNSTI4 -999
ASGNI4
ADDRGP4 $107
JUMPV
LABELV $106
ADDRLP4 60
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $107
ADDRFP4 12
ADDRLP4 60
INDIRI4
ASGNI4
line 213
;213:		break;
LABELV $78
LABELV $79
line 216
;214:	}
;215:
;216:	Com_sprintf (num, sizeof(num), "%i", value);
ADDRLP4 12
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $110
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 217
;217:	l = strlen(num);
ADDRLP4 12
ARGP4
ADDRLP4 32
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 32
INDIRI4
ASGNI4
line 218
;218:	if (l > width)
ADDRLP4 4
INDIRI4
ADDRFP4 8
INDIRI4
LEI4 $111
line 219
;219:		l = width;
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
LABELV $111
line 220
;220:	x += 2 + CHAR_WIDTH*(width - l);
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRFP4 8
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
CNSTI4 5
LSHI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 222
;221:
;222:	ptr = num;
ADDRLP4 0
ADDRLP4 12
ASGNP4
ADDRGP4 $114
JUMPV
LABELV $113
line 224
;223:	while (*ptr && l)
;224:	{
line 225
;225:		if (*ptr == '-')
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 45
NEI4 $116
line 226
;226:			frame = STAT_MINUS;
ADDRLP4 8
CNSTI4 10
ASGNI4
ADDRGP4 $117
JUMPV
LABELV $116
line 228
;227:		else
;228:			frame = *ptr -'0';
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
ASGNI4
LABELV $117
line 230
;229:
;230:		CG_DrawPic( x,y, CHAR_WIDTH, CHAR_HEIGHT, cgs.media.numberShaders[frame] );
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1107296256
ARGF4
CNSTF4 1111490560
ARGF4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+340
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 231
;231:		x += CHAR_WIDTH;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 32
ADDI4
ASGNI4
line 232
;232:		ptr++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 233
;233:		l--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 234
;234:	}
LABELV $114
line 223
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $120
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $113
LABELV $120
line 235
;235:}
LABELV $73
endproc CG_DrawField 64 20
export CG_Draw3DModel
proc CG_Draw3DModel 508 16
line 243
;236:
;237:
;238:/*
;239:================
;240:CG_Draw3DModel
;241:================
;242:*/
;243:void CG_Draw3DModel( float x, float y, float w, float h, qhandle_t model, qhandle_t skin, vec3_t origin, vec3_t angles ) {
line 247
;244:	refdef_t		refdef;
;245:	refEntity_t		ent;
;246:
;247:	if ( !cg_draw3dIcons.integer || !cg_drawIcons.integer ) {
ADDRGP4 cg_draw3dIcons+12
INDIRI4
CNSTI4 0
EQI4 $126
ADDRGP4 cg_drawIcons+12
INDIRI4
CNSTI4 0
NEI4 $122
LABELV $126
line 248
;248:		return;
ADDRGP4 $121
JUMPV
LABELV $122
line 251
;249:	}
;250:
;251:	CG_AdjustFrom640( &x, &y, &w, &h );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 253
;252:
;253:	memset( &refdef, 0, sizeof( refdef ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 255
;254:
;255:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 368
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 256
;256:	AnglesToAxis( angles, ent.axis );
ADDRFP4 28
INDIRP4
ARGP4
ADDRLP4 368+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 257
;257:	VectorCopy( origin, ent.origin );
ADDRLP4 368+68
ADDRFP4 24
INDIRP4
INDIRB
ASGNB 12
line 258
;258:	ent.hModel = model;
ADDRLP4 368+8
ADDRFP4 16
INDIRI4
ASGNI4
line 259
;259:	ent.customSkin = skin;
ADDRLP4 368+108
ADDRFP4 20
INDIRI4
ASGNI4
line 260
;260:	ent.renderfx = RF_NOSHADOW;		// no stencil shadows
ADDRLP4 368+4
CNSTI4 64
ASGNI4
line 262
;261:
;262:	refdef.rdflags = RDF_NOWORLDMODEL;
ADDRLP4 0+76
CNSTI4 1
ASGNI4
line 264
;263:
;264:	AxisClear( refdef.viewaxis );
ADDRLP4 0+36
ARGP4
ADDRGP4 AxisClear
CALLV
pop
line 266
;265:
;266:	refdef.fov_x = 30;
ADDRLP4 0+16
CNSTF4 1106247680
ASGNF4
line 267
;267:	refdef.fov_y = 30;
ADDRLP4 0+20
CNSTF4 1106247680
ASGNF4
line 269
;268:
;269:	refdef.x = x;
ADDRLP4 0
ADDRFP4 0
INDIRF4
CVFI4 4
ASGNI4
line 270
;270:	refdef.y = y;
ADDRLP4 0+4
ADDRFP4 4
INDIRF4
CVFI4 4
ASGNI4
line 271
;271:	refdef.width = w;
ADDRLP4 0+8
ADDRFP4 8
INDIRF4
CVFI4 4
ASGNI4
line 272
;272:	refdef.height = h;
ADDRLP4 0+12
ADDRFP4 12
INDIRF4
CVFI4 4
ASGNI4
line 274
;273:
;274:	refdef.time = cg.time;
ADDRLP4 0+72
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 276
;275:
;276:	trap_R_ClearScene();
ADDRGP4 trap_R_ClearScene
CALLV
pop
line 277
;277:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 368
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 278
;278:	trap_R_RenderScene( &refdef );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_RenderScene
CALLV
pop
line 279
;279:}
LABELV $121
endproc CG_Draw3DModel 508 16
export CG_Draw3DModelColor
proc CG_Draw3DModelColor 544 16
line 288
;280:
;281:
;282:
;283:/*
;284:================
;285:CG_Draw3DModel
;286:================
;287:*/
;288:void CG_Draw3DModelColor( float x, float y, float w, float h, qhandle_t model, qhandle_t skin, vec3_t origin, vec3_t angles, vec3_t color ) {
line 292
;289:	refdef_t		refdef;
;290:	refEntity_t		ent;
;291:
;292:	if ( !cg_draw3dIcons.integer || !cg_drawIcons.integer ) {
ADDRGP4 cg_draw3dIcons+12
INDIRI4
CNSTI4 0
EQI4 $146
ADDRGP4 cg_drawIcons+12
INDIRI4
CNSTI4 0
NEI4 $142
LABELV $146
line 293
;293:		return;
ADDRGP4 $141
JUMPV
LABELV $142
line 296
;294:	}
;295:
;296:	CG_AdjustFrom640( &x, &y, &w, &h );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 298
;297:
;298:	memset( &refdef, 0, sizeof( refdef ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 300
;299:
;300:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 368
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 301
;301:	AnglesToAxis( angles, ent.axis );
ADDRFP4 28
INDIRP4
ARGP4
ADDRLP4 368+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 302
;302:	VectorCopy( origin, ent.origin );
ADDRLP4 368+68
ADDRFP4 24
INDIRP4
INDIRB
ASGNB 12
line 303
;303:	ent.hModel = model;
ADDRLP4 368+8
ADDRFP4 16
INDIRI4
ASGNI4
line 304
;304:	ent.customSkin = skin;
ADDRLP4 368+108
ADDRFP4 20
INDIRI4
ASGNI4
line 305
;305:	ent.renderfx = RF_NOSHADOW;		// no stencil shadows
ADDRLP4 368+4
CNSTI4 64
ASGNI4
line 307
;306:
;307:	refdef.rdflags = RDF_NOWORLDMODEL;
ADDRLP4 0+76
CNSTI4 1
ASGNI4
line 309
;308:
;309:	AxisClear( refdef.viewaxis );
ADDRLP4 0+36
ARGP4
ADDRGP4 AxisClear
CALLV
pop
line 311
;310:
;311:	refdef.fov_x = 30;
ADDRLP4 0+16
CNSTF4 1106247680
ASGNF4
line 312
;312:	refdef.fov_y = 30;
ADDRLP4 0+20
CNSTF4 1106247680
ASGNF4
line 314
;313:
;314:	refdef.x = x;
ADDRLP4 0
ADDRFP4 0
INDIRF4
CVFI4 4
ASGNI4
line 315
;315:	refdef.y = y;
ADDRLP4 0+4
ADDRFP4 4
INDIRF4
CVFI4 4
ASGNI4
line 316
;316:	refdef.width = w;
ADDRLP4 0+8
ADDRFP4 8
INDIRF4
CVFI4 4
ASGNI4
line 317
;317:	refdef.height = h;
ADDRLP4 0+12
ADDRFP4 12
INDIRF4
CVFI4 4
ASGNI4
line 319
;318:
;319:	refdef.time = cg.time;
ADDRLP4 0+72
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 321
;320:
;321:	ent.shaderRGBA[0] = color[0] * 255;
ADDRLP4 512
ADDRFP4 32
INDIRP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 516
CNSTF4 1325400064
ASGNF4
ADDRLP4 512
INDIRF4
ADDRLP4 516
INDIRF4
LTF4 $163
ADDRLP4 508
ADDRLP4 512
INDIRF4
ADDRLP4 516
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $164
JUMPV
LABELV $163
ADDRLP4 508
ADDRLP4 512
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $164
ADDRLP4 368+116
ADDRLP4 508
INDIRU4
CVUU1 4
ASGNU1
line 322
;322:	ent.shaderRGBA[1] = color[1] * 255;
ADDRLP4 524
ADDRFP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 528
CNSTF4 1325400064
ASGNF4
ADDRLP4 524
INDIRF4
ADDRLP4 528
INDIRF4
LTF4 $168
ADDRLP4 520
ADDRLP4 524
INDIRF4
ADDRLP4 528
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $169
JUMPV
LABELV $168
ADDRLP4 520
ADDRLP4 524
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $169
ADDRLP4 368+116+1
ADDRLP4 520
INDIRU4
CVUU1 4
ASGNU1
line 323
;323:	ent.shaderRGBA[2] = color[2] * 255;
ADDRLP4 536
ADDRFP4 32
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 540
CNSTF4 1325400064
ASGNF4
ADDRLP4 536
INDIRF4
ADDRLP4 540
INDIRF4
LTF4 $173
ADDRLP4 532
ADDRLP4 536
INDIRF4
ADDRLP4 540
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $174
JUMPV
LABELV $173
ADDRLP4 532
ADDRLP4 536
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $174
ADDRLP4 368+116+2
ADDRLP4 532
INDIRU4
CVUU1 4
ASGNU1
line 324
;324:	ent.shaderRGBA[3] = 255;
ADDRLP4 368+116+3
CNSTU1 255
ASGNU1
line 326
;325:
;326:	trap_R_ClearScene();
ADDRGP4 trap_R_ClearScene
CALLV
pop
line 327
;327:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 368
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 328
;328:	trap_R_RenderScene( &refdef );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_RenderScene
CALLV
pop
line 329
;329:}
LABELV $141
endproc CG_Draw3DModelColor 544 16
export CG_DrawHead
proc CG_DrawHead 56 36
line 339
;330:
;331:
;332:/*
;333:================
;334:CG_DrawHead
;335:
;336:Used for both the status bar and the scoreboard
;337:================
;338:*/
;339:void CG_DrawHead( float x, float y, float w, float h, int clientNum, vec3_t headAngles ) {
line 346
;340:	clipHandle_t	cm;
;341:	clientInfo_t	*ci;
;342:	float			len;
;343:	vec3_t			origin;
;344:	vec3_t			mins, maxs;
;345:
;346:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 0
ADDRFP4 16
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 348
;347:
;348:	if ( cg_draw3dIcons.integer ) {
ADDRGP4 cg_draw3dIcons+12
INDIRI4
CNSTI4 0
EQI4 $179
line 349
;349:		cm = ci->headModel;
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
ASGNI4
line 350
;350:		if ( !cm ) {
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $182
line 351
;351:			return;
ADDRGP4 $177
JUMPV
LABELV $182
line 355
;352:		}
;353:
;354:		// offset the origin y and z to center the head
;355:		trap_R_ModelBounds( cm, mins, maxs );
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 trap_R_ModelBounds
CALLV
pop
line 357
;356:
;357:		origin[2] = -0.5 * ( mins[2] + maxs[2] );
ADDRLP4 4+8
ADDRLP4 16+8
INDIRF4
ADDRLP4 28+8
INDIRF4
ADDF4
CNSTF4 3204448256
MULF4
ASGNF4
line 358
;358:		origin[1] = 0.5 * ( mins[1] + maxs[1] );
ADDRLP4 4+4
ADDRLP4 16+4
INDIRF4
ADDRLP4 28+4
INDIRF4
ADDF4
CNSTF4 1056964608
MULF4
ASGNF4
line 362
;359:
;360:		// calculate distance so the head nearly fills the box
;361:		// assume heads are taller than wide
;362:		len = 0.7 * ( maxs[2] - mins[2] );		
ADDRLP4 44
ADDRLP4 28+8
INDIRF4
ADDRLP4 16+8
INDIRF4
SUBF4
CNSTF4 1060320051
MULF4
ASGNF4
line 363
;363:		origin[0] = len / 0.268;	// len / tan( fov/2 )
ADDRLP4 4
ADDRLP4 44
INDIRF4
CNSTF4 1081003604
MULF4
ASGNF4
line 366
;364:
;365:		// allow per-model tweaking
;366:		VectorAdd( origin, ci->headOffset, origin );
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 400
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 404
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRF4
ADDF4
ASGNF4
line 368
;367:
;368:		CG_Draw3DModelColor( x, y, w, h, ci->headModel, ci->headSkin, origin, headAngles, ci->headColor );
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
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1616
ADDP4
ARGP4
ADDRGP4 CG_Draw3DModelColor
CALLV
pop
line 369
;369:	} else if ( cg_drawIcons.integer ) {
ADDRGP4 $180
JUMPV
LABELV $179
ADDRGP4 cg_drawIcons+12
INDIRI4
CNSTI4 0
EQI4 $196
line 370
;370:		trap_R_SetColor ( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 371
;371:		CG_DrawPic( x, y, w, h, ci->modelIcon );
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
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 372
;372:	}
LABELV $196
LABELV $180
line 375
;373:
;374:	// if they are deferred, draw a cross out
;375:	if ( ci->deferred ) {
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 0
EQI4 $199
line 376
;376:		trap_R_SetColor ( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 377
;377:		CG_DrawPic( x, y, w, h, cgs.media.deferShader );
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
ADDRGP4 cgs+148692+164
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 378
;378:	}
LABELV $199
line 379
;379:}
LABELV $177
endproc CG_DrawHead 56 36
export CG_DrawFlagModel
proc CG_DrawFlagModel 68 32
line 388
;380:
;381:/*
;382:================
;383:CG_DrawFlagModel
;384:
;385:Used for both the status bar and the scoreboard
;386:================
;387:*/
;388:void CG_DrawFlagModel( float x, float y, float w, float h, int team, qboolean force2D ) {
line 395
;389:	qhandle_t		cm;
;390:	float			len;
;391:	vec3_t			origin, angles;
;392:	vec3_t			mins, maxs;
;393:	qhandle_t		handle;
;394:
;395:	if ( !force2D && cg_draw3dIcons.integer ) {
ADDRFP4 20
INDIRI4
CNSTI4 0
NEI4 $204
ADDRGP4 cg_draw3dIcons+12
INDIRI4
CNSTI4 0
EQI4 $204
line 397
;396:
;397:		VectorClear( angles );
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0+4
CNSTF4 0
ASGNF4
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 399
;398:
;399:		cm = cgs.media.redFlagModel;
ADDRLP4 48
ADDRGP4 cgs+148692+36
INDIRI4
ASGNI4
line 402
;400:
;401:		// offset the origin y and z to center the flag
;402:		trap_R_ModelBounds( cm, mins, maxs );
ADDRLP4 48
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
ADDRLP4 36
ARGP4
ADDRGP4 trap_R_ModelBounds
CALLV
pop
line 404
;403:
;404:		origin[2] = -0.5 * ( mins[2] + maxs[2] );
ADDRLP4 12+8
ADDRLP4 24+8
INDIRF4
ADDRLP4 36+8
INDIRF4
ADDF4
CNSTF4 3204448256
MULF4
ASGNF4
line 405
;405:		origin[1] = 0.5 * ( mins[1] + maxs[1] );
ADDRLP4 12+4
ADDRLP4 24+4
INDIRF4
ADDRLP4 36+4
INDIRF4
ADDF4
CNSTF4 1056964608
MULF4
ASGNF4
line 409
;406:
;407:		// calculate distance so the flag nearly fills the box
;408:		// assume heads are taller than wide
;409:		len = 0.5 * ( maxs[2] - mins[2] );		
ADDRLP4 52
ADDRLP4 36+8
INDIRF4
ADDRLP4 24+8
INDIRF4
SUBF4
CNSTF4 1056964608
MULF4
ASGNF4
line 410
;410:		origin[0] = len / 0.268;	// len / tan( fov/2 )
ADDRLP4 12
ADDRLP4 52
INDIRF4
CNSTF4 1081003604
MULF4
ASGNF4
line 412
;411:
;412:		angles[YAW] = 60 * sin( ( cg.time % TMOD_2000 ) / 2000.0 );;
ADDRGP4 cg+107604
INDIRI4
CNSTI4 5730265
MODI4
CVIF4 4
CNSTF4 973279855
MULF4
ARGF4
ADDRLP4 60
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 60
INDIRF4
CNSTF4 1114636288
MULF4
ASGNF4
line 414
;413:
;414:		if( team == TEAM_RED ) {
ADDRFP4 16
INDIRI4
CNSTI4 1
NEI4 $221
line 415
;415:			handle = cgs.media.redFlagModel;
ADDRLP4 56
ADDRGP4 cgs+148692+36
INDIRI4
ASGNI4
line 416
;416:		} else if( team == TEAM_BLUE ) {
ADDRGP4 $222
JUMPV
LABELV $221
ADDRFP4 16
INDIRI4
CNSTI4 2
NEI4 $225
line 417
;417:			handle = cgs.media.blueFlagModel;
ADDRLP4 56
ADDRGP4 cgs+148692+40
INDIRI4
ASGNI4
line 418
;418:		} else if( team == TEAM_FREE ) {
ADDRGP4 $226
JUMPV
LABELV $225
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $203
line 419
;419:			handle = cgs.media.neutralFlagModel;
ADDRLP4 56
ADDRGP4 cgs+148692+44
INDIRI4
ASGNI4
line 420
;420:		} else {
line 421
;421:			return;
LABELV $230
LABELV $226
LABELV $222
line 423
;422:		}
;423:		CG_Draw3DModel( x, y, w, h, handle, 0, origin, angles );
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
ADDRLP4 56
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_Draw3DModel
CALLV
pop
line 424
;424:	} else if ( cg_drawIcons.integer ) {
ADDRGP4 $205
JUMPV
LABELV $204
ADDRGP4 cg_drawIcons+12
INDIRI4
CNSTI4 0
EQI4 $233
line 427
;425:		gitem_t *item;
;426:
;427:		if( team == TEAM_RED ) {
ADDRFP4 16
INDIRI4
CNSTI4 1
NEI4 $236
line 428
;428:			item = BG_FindItemForPowerup( PW_REDFLAG );
CNSTI4 7
ARGI4
ADDRLP4 64
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 60
ADDRLP4 64
INDIRP4
ASGNP4
line 429
;429:		} else if( team == TEAM_BLUE ) {
ADDRGP4 $237
JUMPV
LABELV $236
ADDRFP4 16
INDIRI4
CNSTI4 2
NEI4 $238
line 430
;430:			item = BG_FindItemForPowerup( PW_BLUEFLAG );
CNSTI4 8
ARGI4
ADDRLP4 64
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 60
ADDRLP4 64
INDIRP4
ASGNP4
line 431
;431:		} else if( team == TEAM_FREE ) {
ADDRGP4 $239
JUMPV
LABELV $238
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $203
line 432
;432:			item = BG_FindItemForPowerup( PW_NEUTRALFLAG );
CNSTI4 9
ARGI4
ADDRLP4 64
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 60
ADDRLP4 64
INDIRP4
ASGNP4
line 433
;433:		} else {
line 434
;434:			return;
LABELV $241
LABELV $239
LABELV $237
line 436
;435:		}
;436:		if (item) {
ADDRLP4 60
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $242
line 437
;437:		  CG_DrawPic( x, y, w, h, cg_items[ ITEM_INDEX(item) ].icon );
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
ADDRLP4 60
INDIRP4
CVPU4 4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
CNSTI4 28
MULI4
ADDRGP4 cg_items+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 438
;438:		}
LABELV $242
line 439
;439:	}
LABELV $233
LABELV $205
line 440
;440:}
LABELV $203
endproc CG_DrawFlagModel 68 32
proc CG_DrawStatusBarHead 48 24
line 448
;441:
;442:/*
;443:================
;444:CG_DrawStatusBarHead
;445:
;446:================
;447:*/
;448:static void CG_DrawStatusBarHead( float x ) {
line 453
;449:	vec3_t		angles;
;450:	float		size, stretch;
;451:	float		frac;
;452:
;453:	VectorClear( angles );
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 4+4
CNSTF4 0
ASGNF4
ADDRLP4 4+8
CNSTF4 0
ASGNF4
line 455
;454:
;455:	if ( cg.damageTime && cg.time - cg.damageTime < DAMAGE_TIME ) {
ADDRGP4 cg+125796
INDIRI4
CNSTI4 0
EQI4 $248
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+125796
INDIRI4
SUBI4
CNSTI4 500
GEI4 $248
line 456
;456:		frac = (float)(cg.time - cg.damageTime ) / DAMAGE_TIME;
ADDRLP4 0
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+125796
INDIRI4
SUBI4
CVIF4 4
CNSTF4 990057071
MULF4
ASGNF4
line 457
;457:		size = ICON_SIZE * 1.25 * ( 1.5 - frac * 0.5 );
ADDRLP4 16
CNSTF4 1069547520
ADDRLP4 0
INDIRF4
CNSTF4 1056964608
MULF4
SUBF4
CNSTF4 1114636288
MULF4
ASGNF4
line 459
;458:
;459:		stretch = size - ICON_SIZE * 1.25;
ADDRLP4 20
ADDRLP4 16
INDIRF4
CNSTF4 1114636288
SUBF4
ASGNF4
line 461
;460:		// kick in the direction of damage
;461:		x -= stretch * 0.5 + cg.damageX * stretch * 0.5;
ADDRLP4 24
ADDRLP4 20
INDIRF4
ASGNF4
ADDRFP4 0
ADDRFP4 0
INDIRF4
ADDRLP4 24
INDIRF4
CNSTF4 1056964608
MULF4
ADDRGP4 cg+125800
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
CNSTF4 1056964608
MULF4
ADDF4
SUBF4
ASGNF4
line 463
;462:
;463:		cg.headStartYaw = 180 + cg.damageX * 45;
ADDRGP4 cg+125832
ADDRGP4 cg+125800
INDIRF4
CNSTF4 1110704128
MULF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 465
;464:
;465:		cg.headEndYaw = 180 + 20 * cos( crandom()*M_PI );
ADDRLP4 28
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
SUBF4
CNSTF4 1086918619
MULF4
ARGF4
ADDRLP4 32
ADDRGP4 cos
CALLF4
ASGNF4
ADDRGP4 cg+125820
ADDRLP4 32
INDIRF4
CNSTF4 1101004800
MULF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 466
;466:		cg.headEndPitch = 5 * cos( crandom()*M_PI );
ADDRLP4 36
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
SUBF4
CNSTF4 1086918619
MULF4
ARGF4
ADDRLP4 40
ADDRGP4 cos
CALLF4
ASGNF4
ADDRGP4 cg+125816
ADDRLP4 40
INDIRF4
CNSTF4 1084227584
MULF4
ASGNF4
line 468
;467:
;468:		cg.headStartTime = cg.time;
ADDRGP4 cg+125836
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 469
;469:		cg.headEndTime = cg.time + 100 + random() * 2000;
ADDRLP4 44
ADDRGP4 rand
CALLI4
ASGNI4
ADDRGP4 cg+125824
ADDRGP4 cg+107604
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
ADDRLP4 44
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1031406068
MULF4
ADDF4
CVFI4 4
ASGNI4
line 470
;470:	} else {
ADDRGP4 $249
JUMPV
LABELV $248
line 471
;471:		if ( cg.time >= cg.headEndTime ) {
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+125824
INDIRI4
LTI4 $264
line 473
;472:			// select a new head angle
;473:			cg.headStartYaw = cg.headEndYaw;
ADDRGP4 cg+125832
ADDRGP4 cg+125820
INDIRF4
ASGNF4
line 474
;474:			cg.headStartPitch = cg.headEndPitch;
ADDRGP4 cg+125828
ADDRGP4 cg+125816
INDIRF4
ASGNF4
line 475
;475:			cg.headStartTime = cg.headEndTime;
ADDRGP4 cg+125836
ADDRGP4 cg+125824
INDIRI4
ASGNI4
line 476
;476:			cg.headEndTime = cg.time + 100 + random() * 2000;
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRGP4 cg+125824
ADDRGP4 cg+107604
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
ADDRLP4 24
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1031406068
MULF4
ADDF4
CVFI4 4
ASGNI4
line 478
;477:
;478:			cg.headEndYaw = 180 + 20 * cos( crandom()*M_PI );
ADDRLP4 28
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
SUBF4
CNSTF4 1086918619
MULF4
ARGF4
ADDRLP4 32
ADDRGP4 cos
CALLF4
ASGNF4
ADDRGP4 cg+125820
ADDRLP4 32
INDIRF4
CNSTF4 1101004800
MULF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 479
;479:			cg.headEndPitch = 5 * cos( crandom()*M_PI );
ADDRLP4 36
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
SUBF4
CNSTF4 1086918619
MULF4
ARGF4
ADDRLP4 40
ADDRGP4 cos
CALLF4
ASGNF4
ADDRGP4 cg+125816
ADDRLP4 40
INDIRF4
CNSTF4 1084227584
MULF4
ASGNF4
line 480
;480:		}
LABELV $264
line 482
;481:
;482:		size = ICON_SIZE * 1.25;
ADDRLP4 16
CNSTF4 1114636288
ASGNF4
line 483
;483:	}
LABELV $249
line 486
;484:
;485:	// if the server was frozen for a while we may have a bad head start time
;486:	if ( cg.headStartTime > cg.time ) {
ADDRGP4 cg+125836
INDIRI4
ADDRGP4 cg+107604
INDIRI4
LEI4 $278
line 487
;487:		cg.headStartTime = cg.time;
ADDRGP4 cg+125836
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 488
;488:	}
LABELV $278
line 490
;489:
;490:	frac = ( cg.time - cg.headStartTime ) / (float)( cg.headEndTime - cg.headStartTime );
ADDRLP4 0
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+125836
INDIRI4
SUBI4
CVIF4 4
ADDRGP4 cg+125824
INDIRI4
ADDRGP4 cg+125836
INDIRI4
SUBI4
CVIF4 4
DIVF4
ASGNF4
line 491
;491:	frac = frac * frac * ( 3 - 2 * frac );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
CNSTF4 1077936128
ADDRLP4 0
INDIRF4
CNSTF4 1073741824
MULF4
SUBF4
MULF4
ASGNF4
line 492
;492:	angles[YAW] = cg.headStartYaw + ( cg.headEndYaw - cg.headStartYaw ) * frac;
ADDRLP4 4+4
ADDRGP4 cg+125832
INDIRF4
ADDRGP4 cg+125820
INDIRF4
ADDRGP4 cg+125832
INDIRF4
SUBF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 493
;493:	angles[PITCH] = cg.headStartPitch + ( cg.headEndPitch - cg.headStartPitch ) * frac;
ADDRLP4 4
ADDRGP4 cg+125828
INDIRF4
ADDRGP4 cg+125816
INDIRF4
ADDRGP4 cg+125828
INDIRF4
SUBF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 495
;494:
;495:	CG_DrawHead( x, cgs.screenYmax + 1 - size, size, size, cg.snap->ps.clientNum, angles );
ADDRFP4 0
INDIRF4
ARGF4
ADDRGP4 cgs+31464
INDIRF4
CNSTF4 1065353216
ADDF4
ADDRLP4 16
INDIRF4
SUBF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 CG_DrawHead
CALLV
pop
line 496
;496:}
LABELV $245
endproc CG_DrawStatusBarHead 48 24
proc CG_DrawStatusBarFlag 0 24
line 505
;497:
;498:
;499:/*
;500:================
;501:CG_DrawStatusBarFlag
;502:
;503:================
;504:*/
;505:static void CG_DrawStatusBarFlag( float x, int team ) {
line 506
;506:	CG_DrawFlagModel( x, cgs.screenYmax + 1 - ICON_SIZE, ICON_SIZE, ICON_SIZE, team, qfalse );
ADDRFP4 0
INDIRF4
ARGF4
ADDRGP4 cgs+31464
INDIRF4
CNSTF4 1065353216
ADDF4
CNSTF4 1111490560
SUBF4
ARGF4
CNSTF4 1111490560
ARGF4
CNSTF4 1111490560
ARGF4
ADDRFP4 4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawFlagModel
CALLV
pop
line 507
;507:}
LABELV $297
endproc CG_DrawStatusBarFlag 0 24
export CG_DrawTeamBackground
proc CG_DrawTeamBackground 16 20
line 517
;508:
;509:
;510:/*
;511:================
;512:CG_DrawTeamBackground
;513:
;514:================
;515:*/
;516:void CG_DrawTeamBackground( int x, int y, int w, int h, float alpha, int team )
;517:{
line 520
;518:	vec4_t		hcolor;
;519:
;520:	hcolor[3] = alpha;
ADDRLP4 0+12
ADDRFP4 16
INDIRF4
ASGNF4
line 521
;521:	if ( team == TEAM_RED ) {
ADDRFP4 20
INDIRI4
CNSTI4 1
NEI4 $301
line 522
;522:		hcolor[0] = 1.0f;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 523
;523:		hcolor[1] = 0.0f;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 524
;524:		hcolor[2] = 0.0f;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 525
;525:	} else if ( team == TEAM_BLUE ) {
ADDRGP4 $302
JUMPV
LABELV $301
ADDRFP4 20
INDIRI4
CNSTI4 2
NEI4 $299
line 526
;526:		hcolor[0] = 0.0f;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 527
;527:		hcolor[1] = 0.1f;
ADDRLP4 0+4
CNSTF4 1036831949
ASGNF4
line 528
;528:		hcolor[2] = 1.0f;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 529
;529:	} else {
line 530
;530:		return;
LABELV $306
LABELV $302
line 532
;531:	}
;532:	trap_R_SetColor( hcolor );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 533
;533:	CG_DrawPic( x, y, w, h, cgs.media.teamStatusBar );
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cgs+148692+160
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 534
;534:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 535
;535:}
LABELV $299
endproc CG_DrawTeamBackground 16 20
data
align 4
LABELV $312
byte 4 1065353216
byte 4 1060152279
byte 4 0
byte 4 1065353216
byte 4 1065353216
byte 4 1045220557
byte 4 1045220557
byte 4 1065353216
byte 4 1056964608
byte 4 1056964608
byte 4 1056964608
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
code
proc CG_DrawStatusBar 76 32
line 544
;536:
;537:
;538:/*
;539:================
;540:CG_DrawStatusBar
;541:================
;542:*/
;543:#define STATUSBAR_HEIGHT 60
;544:static void CG_DrawStatusBar( void ) {
line 561
;545:	int			color;
;546:	centity_t	*cent;
;547:	playerState_t	*ps;
;548:	int			value;
;549:	vec4_t		hcolor;
;550:	vec3_t		angles;
;551:	vec3_t		origin;
;552:	float		y;
;553:	qhandle_t	handle;
;554:	static float colors[4][4] = { 
;555://		{ 0.2, 1.0, 0.2, 1.0 } , { 1.0, 0.2, 0.2, 1.0 }, {0.5, 0.5, 0.5, 1} };
;556:		{ 1.0f, 0.69f, 0.0f, 1.0f },    // normal
;557:		{ 1.0f, 0.2f, 0.2f, 1.0f },     // low health
;558:		{ 0.5f, 0.5f, 0.5f, 1.0f },     // weapon firing
;559:		{ 1.0f, 1.0f, 1.0f, 1.0f } };   // health > 100
;560:
;561:	if ( cg_drawStatus.integer == 0 ) {
ADDRGP4 cg_drawStatus+12
INDIRI4
CNSTI4 0
NEI4 $313
line 562
;562:		return;
ADDRGP4 $311
JUMPV
LABELV $313
line 566
;563:	}
;564:
;565:	// draw the team background
;566:	CG_DrawTeamBackground( cgs.screenXmin, cgs.screenYmax - STATUSBAR_HEIGHT + 1,
ADDRGP4 cgs+31452
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 cgs+31464
INDIRF4
CNSTF4 1114636288
SUBF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ARGI4
ADDRGP4 cgs+31456
INDIRF4
ADDRGP4 cgs+31452
INDIRF4
SUBF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ARGI4
CNSTI4 60
ARGI4
CNSTF4 1051260355
ARGF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawTeamBackground
CALLV
pop
line 570
;567:		cgs.screenXmax - cgs.screenXmin + 1, STATUSBAR_HEIGHT, 
;568:		0.33f, cg.snap->ps.persistant[ PERS_TEAM ] );
;569:
;570:	y = cgs.screenYmax + 1 - ICON_SIZE;
ADDRLP4 36
ADDRGP4 cgs+31464
INDIRF4
CNSTF4 1065353216
ADDF4
CNSTF4 1111490560
SUBF4
ASGNF4
line 572
;571:
;572:	cent = &cg_entities[cg.snap->ps.clientNum];
ADDRLP4 28
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 740
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 573
;573:	ps = &cg.snap->ps;
ADDRLP4 32
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 575
;574:
;575:	VectorClear( angles );
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 4+4
CNSTF4 0
ASGNF4
ADDRLP4 4+8
CNSTF4 0
ASGNF4
line 578
;576:
;577:	// draw any 3D icons first, so the changes back to 2D are minimized
;578:	if ( cent->currentState.weapon && cg_weapons[ cent->currentState.weapon ].ammoModel ) {
ADDRLP4 28
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 0
EQI4 $326
ADDRLP4 28
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 136
MULI4
ADDRGP4 cg_weapons+76
ADDP4
INDIRI4
CNSTI4 0
EQI4 $326
line 579
;579:		origin[0] = 70;
ADDRLP4 16
CNSTF4 1116471296
ASGNF4
line 580
;580:		origin[1] = 0;
ADDRLP4 16+4
CNSTF4 0
ASGNF4
line 581
;581:		origin[2] = 0;
ADDRLP4 16+8
CNSTF4 0
ASGNF4
line 582
;582:		angles[YAW] = 90 + 20 * sin( ( cg.time % TMOD_1000 ) / 1000.0 );
ADDRGP4 cg+107604
INDIRI4
CNSTI4 5730265
MODI4
CVIF4 4
CNSTF4 981668463
MULF4
ARGF4
ADDRLP4 68
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 68
INDIRF4
CNSTF4 1101004800
MULF4
CNSTF4 1119092736
ADDF4
ASGNF4
line 583
;583:		CG_Draw3DModel( CHAR_WIDTH*3 + TEXT_ICON_SPACE, y, ICON_SIZE, ICON_SIZE,
CNSTF4 1120403456
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
CNSTF4 1111490560
ARGF4
CNSTF4 1111490560
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 136
MULI4
ADDRGP4 cg_weapons+76
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 16
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 CG_Draw3DModel
CALLV
pop
line 585
;584:					   cg_weapons[ cent->currentState.weapon ].ammoModel, 0, origin, angles );
;585:	}
LABELV $326
line 587
;586:
;587:	CG_DrawStatusBarHead( 185 + CHAR_WIDTH*3 + TEXT_ICON_SPACE );
CNSTF4 1133412352
ARGF4
ADDRGP4 CG_DrawStatusBarHead
CALLV
pop
line 589
;588:
;589:	if( cg.predictedPlayerState.powerups[PW_REDFLAG] ) {
ADDRGP4 cg+107636+312+28
INDIRI4
CNSTI4 0
EQI4 $334
line 590
;590:		CG_DrawStatusBarFlag( 185 + CHAR_WIDTH*3 + TEXT_ICON_SPACE + ICON_SIZE, TEAM_RED );
CNSTF4 1134985216
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 CG_DrawStatusBarFlag
CALLV
pop
line 591
;591:	} else if( cg.predictedPlayerState.powerups[PW_BLUEFLAG] ) {
ADDRGP4 $335
JUMPV
LABELV $334
ADDRGP4 cg+107636+312+32
INDIRI4
CNSTI4 0
EQI4 $339
line 592
;592:		CG_DrawStatusBarFlag( 185 + CHAR_WIDTH*3 + TEXT_ICON_SPACE + ICON_SIZE, TEAM_BLUE );
CNSTF4 1134985216
ARGF4
CNSTI4 2
ARGI4
ADDRGP4 CG_DrawStatusBarFlag
CALLV
pop
line 593
;593:	} else if( cg.predictedPlayerState.powerups[PW_NEUTRALFLAG] ) {
ADDRGP4 $340
JUMPV
LABELV $339
ADDRGP4 cg+107636+312+36
INDIRI4
CNSTI4 0
EQI4 $344
line 594
;594:		CG_DrawStatusBarFlag( 185 + CHAR_WIDTH*3 + TEXT_ICON_SPACE + ICON_SIZE, TEAM_FREE );
CNSTF4 1134985216
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawStatusBarFlag
CALLV
pop
line 595
;595:	}
LABELV $344
LABELV $340
LABELV $335
line 597
;596:
;597:	if ( ps->stats[ STAT_ARMOR ] ) {
ADDRLP4 32
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CNSTI4 0
EQI4 $349
line 598
;598:		origin[0] = 90;
ADDRLP4 16
CNSTF4 1119092736
ASGNF4
line 599
;599:		origin[1] = 0;
ADDRLP4 16+4
CNSTF4 0
ASGNF4
line 600
;600:		origin[2] = -10;
ADDRLP4 16+8
CNSTF4 3240099840
ASGNF4
line 601
;601:		angles[YAW] = ( cg.time & 2047 ) * 360 / 2048.0;
ADDRLP4 4+4
ADDRGP4 cg+107604
INDIRI4
CNSTI4 2047
BANDI4
CNSTI4 360
MULI4
CVIF4 4
CNSTF4 973078528
MULF4
ASGNF4
line 602
;602:		CG_Draw3DModel( 370 + CHAR_WIDTH*3 + TEXT_ICON_SPACE, y, ICON_SIZE, ICON_SIZE,
CNSTF4 1139474432
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
CNSTF4 1111490560
ARGF4
CNSTF4 1111490560
ARGF4
ADDRGP4 cgs+148692+152
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 16
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 CG_Draw3DModel
CALLV
pop
line 604
;603:					   cgs.media.armorModel, 0, origin, angles );
;604:	}
LABELV $349
line 605
;605:	if( cgs.gametype == GT_HARVESTER ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 7
NEI4 $357
line 606
;606:		origin[0] = 90;
ADDRLP4 16
CNSTF4 1119092736
ASGNF4
line 607
;607:		origin[1] = 0;
ADDRLP4 16+4
CNSTF4 0
ASGNF4
line 608
;608:		origin[2] = -10;
ADDRLP4 16+8
CNSTF4 3240099840
ASGNF4
line 609
;609:		angles[YAW] = ( cg.time & 2047 ) * 360 / 2048.0;
ADDRLP4 4+4
ADDRGP4 cg+107604
INDIRI4
CNSTI4 2047
BANDI4
CNSTI4 360
MULI4
CVIF4 4
CNSTF4 973078528
MULF4
ASGNF4
line 610
;610:		if( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $364
line 611
;611:			handle = cgs.media.redCubeModel;
ADDRLP4 60
ADDRGP4 cgs+148692+20
INDIRI4
ASGNI4
line 612
;612:		} else {
ADDRGP4 $365
JUMPV
LABELV $364
line 613
;613:			handle = cgs.media.blueCubeModel;
ADDRLP4 60
ADDRGP4 cgs+148692+24
INDIRI4
ASGNI4
line 614
;614:		}
LABELV $365
line 615
;615:		CG_Draw3DModel( 640 - (TEXT_ICON_SPACE + ICON_SIZE), 416, ICON_SIZE, ICON_SIZE, handle, 0, origin, angles );
CNSTF4 1142095872
ARGF4
CNSTF4 1137704960
ARGF4
CNSTF4 1111490560
ARGF4
CNSTF4 1111490560
ARGF4
ADDRLP4 60
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 16
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 CG_Draw3DModel
CALLV
pop
line 616
;616:	}
LABELV $357
line 621
;617:
;618:	//
;619:	// ammo
;620:	//
;621:	if ( cent->currentState.weapon ) {
ADDRLP4 28
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 0
EQI4 $371
line 622
;622:		value = ps->ammo[cent->currentState.weapon];
ADDRLP4 0
ADDRLP4 28
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
ASGNI4
line 623
;623:		if ( value > -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
LEI4 $373
line 624
;624:			if ( cg.predictedPlayerState.weaponstate == WEAPON_FIRING
ADDRGP4 cg+107636+148
INDIRI4
CNSTI4 3
NEI4 $375
ADDRGP4 cg+107636+44
INDIRI4
CNSTI4 100
LEI4 $375
line 625
;625:				&& cg.predictedPlayerState.weaponTime > 100 ) {
line 627
;626:				// draw as dark grey when reloading
;627:				color = 2;	// dark grey
ADDRLP4 40
CNSTI4 2
ASGNI4
line 628
;628:			} else {
ADDRGP4 $376
JUMPV
LABELV $375
line 629
;629:				if ( value >= 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $381
line 630
;630:					color = 0;	// yellow
ADDRLP4 40
CNSTI4 0
ASGNI4
line 631
;631:				} else {
ADDRGP4 $382
JUMPV
LABELV $381
line 632
;632:					color = 1;	// red
ADDRLP4 40
CNSTI4 1
ASGNI4
line 633
;633:				}
LABELV $382
line 634
;634:			}
LABELV $376
line 636
;635:#ifdef USE_NEW_FONT_RENDERER
;636:			CG_SelectFont( 1 );
CNSTI4 1
ARGI4
ADDRGP4 CG_SelectFont
CALLV
pop
line 637
;637:			CG_DrawString( CHAR_WIDTH*3, y, va( "%i", value ), colors[ color ], CHAR_WIDTH, CHAR_HEIGHT, 0, DS_RIGHT | DS_PROPORTIONAL );
ADDRGP4 $110
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
CNSTF4 1119879168
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 40
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 $312
ADDP4
ARGP4
CNSTF4 1107296256
ARGF4
CNSTF4 1111490560
ARGF4
CNSTI4 0
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 638
;638:			CG_SelectFont( 0 );
CNSTI4 0
ARGI4
ADDRGP4 CG_SelectFont
CALLV
pop
line 643
;639:#else
;640:			trap_R_SetColor( colors[color] );
;641:			CG_DrawField( 0, y, 3, value );
;642:#endif
;643:			trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 646
;644:
;645:			// if we didn't draw a 3D icon, draw a 2D icon for ammo
;646:			if ( !cg_draw3dIcons.integer && cg_drawIcons.integer ) {
ADDRGP4 cg_draw3dIcons+12
INDIRI4
CNSTI4 0
NEI4 $383
ADDRGP4 cg_drawIcons+12
INDIRI4
CNSTI4 0
EQI4 $383
line 649
;647:				qhandle_t	icon;
;648:
;649:				icon = cg_weapons[ cg.predictedPlayerState.weapon ].ammoIcon;
ADDRLP4 72
ADDRGP4 cg+107636+144
INDIRI4
CNSTI4 136
MULI4
ADDRGP4 cg_weapons+72
ADDP4
INDIRI4
ASGNI4
line 650
;650:				if ( icon ) {
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $390
line 651
;651:					CG_DrawPic( CHAR_WIDTH*3 + TEXT_ICON_SPACE, y, ICON_SIZE, ICON_SIZE, icon );
CNSTF4 1120403456
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
CNSTF4 1111490560
ARGF4
CNSTF4 1111490560
ARGF4
ADDRLP4 72
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 652
;652:				}
LABELV $390
line 653
;653:			}
LABELV $383
line 654
;654:		}
LABELV $373
line 655
;655:	}
LABELV $371
line 660
;656:
;657:	//
;658:	// health
;659:	//
;660:	value = ps->stats[STAT_HEALTH];
ADDRLP4 0
ADDRLP4 32
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 661
;661:	if ( value > 100 ) {
ADDRLP4 0
INDIRI4
CNSTI4 100
LEI4 $392
line 662
;662:		color = 3; // white
ADDRLP4 40
CNSTI4 3
ASGNI4
line 663
;663:	} else if ( value > 25 ) {
ADDRGP4 $393
JUMPV
LABELV $392
ADDRLP4 0
INDIRI4
CNSTI4 25
LEI4 $394
line 664
;664:		color = 0; 	// yellow
ADDRLP4 40
CNSTI4 0
ASGNI4
line 665
;665:	} else if (value > 0) {
ADDRGP4 $395
JUMPV
LABELV $394
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $396
line 666
;666:		color = (cg.time >> 8) & 1;	// red/yellow flashing
ADDRLP4 40
ADDRGP4 cg+107604
INDIRI4
CNSTI4 8
RSHI4
CNSTI4 1
BANDI4
ASGNI4
line 667
;667:	} else {
ADDRGP4 $397
JUMPV
LABELV $396
line 668
;668:		color = 1; // red
ADDRLP4 40
CNSTI4 1
ASGNI4
line 669
;669:	}
LABELV $397
LABELV $395
LABELV $393
line 672
;670:
;671:#ifdef USE_NEW_FONT_RENDERER
;672:	CG_SelectFont( 1 );
CNSTI4 1
ARGI4
ADDRGP4 CG_SelectFont
CALLV
pop
line 673
;673:	CG_DrawString( 185 + CHAR_WIDTH*3, y, va( "%i", value ), colors[ color ], CHAR_WIDTH, CHAR_HEIGHT, 0, DS_RIGHT | DS_PROPORTIONAL );
ADDRGP4 $110
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
CNSTF4 1133281280
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 40
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 $312
ADDP4
ARGP4
CNSTF4 1107296256
ARGF4
CNSTF4 1111490560
ARGF4
CNSTI4 0
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 674
;674:	CG_SelectFont( 0 );
CNSTI4 0
ARGI4
ADDRGP4 CG_SelectFont
CALLV
pop
line 681
;675:#else
;676:	trap_R_SetColor( colors[ color ] );
;677:	// stretch the health up when taking damage
;678:	CG_DrawField( 185, y, 3, value );
;679:#endif
;680:	
;681:	CG_ColorForHealth( hcolor );
ADDRLP4 44
ARGP4
ADDRGP4 CG_ColorForHealth
CALLV
pop
line 682
;682:	trap_R_SetColor( hcolor );
ADDRLP4 44
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 687
;683:
;684:	//
;685:	// armor
;686:	//
;687:	value = ps->stats[STAT_ARMOR];
ADDRLP4 0
ADDRLP4 32
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ASGNI4
line 688
;688:	if ( value > 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $399
line 690
;689:#ifdef USE_NEW_FONT_RENDERER
;690:		CG_SelectFont( 1 );
CNSTI4 1
ARGI4
ADDRGP4 CG_SelectFont
CALLV
pop
line 691
;691:		CG_DrawString( 370 + CHAR_WIDTH*3, y, va( "%i", value ), colors[ color ], CHAR_WIDTH, CHAR_HEIGHT, 0, DS_RIGHT | DS_PROPORTIONAL );
ADDRGP4 $110
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 va
CALLP4
ASGNP4
CNSTF4 1139343360
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 40
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 $312
ADDP4
ARGP4
CNSTF4 1107296256
ARGF4
CNSTF4 1111490560
ARGF4
CNSTI4 0
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 692
;692:		CG_SelectFont( 0 );
CNSTI4 0
ARGI4
ADDRGP4 CG_SelectFont
CALLV
pop
line 697
;693:#else
;694:		trap_R_SetColor( colors[0] );
;695:		CG_DrawField( 370, y, 3, value );
;696:#endif
;697:		trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 699
;698:		// if we didn't draw a 3D icon, draw a 2D icon for armor
;699:		if ( !cg_draw3dIcons.integer && cg_drawIcons.integer ) {
ADDRGP4 cg_draw3dIcons+12
INDIRI4
CNSTI4 0
NEI4 $401
ADDRGP4 cg_drawIcons+12
INDIRI4
CNSTI4 0
EQI4 $401
line 700
;700:			CG_DrawPic( 370 + CHAR_WIDTH*3 + TEXT_ICON_SPACE, y, ICON_SIZE, ICON_SIZE, cgs.media.armorIcon );
CNSTF4 1139474432
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
CNSTF4 1111490560
ARGF4
CNSTF4 1111490560
ARGF4
ADDRGP4 cgs+148692+156
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 701
;701:		}
LABELV $401
line 702
;702:	}
LABELV $399
line 707
;703:
;704:	//
;705:	// cubes
;706:	//
;707:	if( cgs.gametype == GT_HARVESTER ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 7
NEI4 $407
line 708
;708:		value = ps->generic1;
ADDRLP4 0
ADDRLP4 32
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
ASGNI4
line 709
;709:		if( value > 99 ) {
ADDRLP4 0
INDIRI4
CNSTI4 99
LEI4 $410
line 710
;710:			value = 99;
ADDRLP4 0
CNSTI4 99
ASGNI4
line 711
;711:		}
LABELV $410
line 712
;712:		trap_R_SetColor( colors[0] );
ADDRGP4 $312
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 713
;713:		CG_DrawField (640 - (CHAR_WIDTH*2 + TEXT_ICON_SPACE + ICON_SIZE), y, 2, value);
CNSTI4 524
ARGI4
ADDRLP4 36
INDIRF4
CVFI4 4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_DrawField
CALLV
pop
line 714
;714:		trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 716
;715:		// if we didn't draw a 3D icon, draw a 2D icon for armor
;716:		if ( !cg_draw3dIcons.integer && cg_drawIcons.integer ) {
ADDRGP4 cg_draw3dIcons+12
INDIRI4
CNSTI4 0
NEI4 $412
ADDRGP4 cg_drawIcons+12
INDIRI4
CNSTI4 0
EQI4 $412
line 717
;717:			if( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $416
line 718
;718:				handle = cgs.media.redCubeIcon;
ADDRLP4 60
ADDRGP4 cgs+148692+28
INDIRI4
ASGNI4
line 719
;719:			} else {
ADDRGP4 $417
JUMPV
LABELV $416
line 720
;720:				handle = cgs.media.blueCubeIcon;
ADDRLP4 60
ADDRGP4 cgs+148692+32
INDIRI4
ASGNI4
line 721
;721:			}
LABELV $417
line 722
;722:			CG_DrawPic( 640 - (TEXT_ICON_SPACE + ICON_SIZE), y, ICON_SIZE, ICON_SIZE, handle );
CNSTF4 1142095872
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
CNSTF4 1111490560
ARGF4
CNSTF4 1111490560
ARGF4
ADDRLP4 60
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 723
;723:		}
LABELV $412
line 724
;724:	}
LABELV $407
line 725
;725:}
LABELV $311
endproc CG_DrawStatusBar 76 32
proc CG_DrawAttacker 64 32
line 742
;726:
;727:
;728:/*
;729:===========================================================================================
;730:
;731:  UPPER RIGHT CORNER
;732:
;733:===========================================================================================
;734:*/
;735:
;736:/*
;737:================
;738:CG_DrawAttacker
;739:
;740:================
;741:*/
;742:static float CG_DrawAttacker( float y ) {
line 751
;743:	int			t;
;744:	float		size;
;745:	vec3_t		angles;
;746:	const char	*info;
;747:	const char	*name;
;748:	int			clientNum;
;749:	vec4_t		color;
;750:
;751:	if ( cg.predictedPlayerState.stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 cg+107636+184
INDIRI4
CNSTI4 0
GTI4 $424
line 752
;752:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $423
JUMPV
LABELV $424
line 755
;753:	}
;754:
;755:	if ( !cg.attackerTime ) {
ADDRGP4 cg+125524
INDIRI4
CNSTI4 0
NEI4 $428
line 756
;756:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $423
JUMPV
LABELV $428
line 759
;757:	}
;758:
;759:	clientNum = cg.predictedPlayerState.persistant[PERS_ATTACKER];
ADDRLP4 0
ADDRGP4 cg+107636+248+24
INDIRI4
ASGNI4
line 760
;760:	if ( clientNum < 0 || clientNum >= MAX_CLIENTS || clientNum == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $438
ADDRLP4 0
INDIRI4
CNSTI4 64
GEI4 $438
ADDRLP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $434
LABELV $438
line 761
;761:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $423
JUMPV
LABELV $434
line 764
;762:	}
;763:
;764:	t = cg.time - cg.attackerTime;
ADDRLP4 36
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+125524
INDIRI4
SUBI4
ASGNI4
line 765
;765:	if ( t > ATTACKER_HEAD_TIME ) {
ADDRLP4 36
INDIRI4
CNSTI4 10000
LEI4 $441
line 766
;766:		cg.attackerTime = 0;
ADDRGP4 cg+125524
CNSTI4 0
ASGNI4
line 767
;767:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $423
JUMPV
LABELV $441
line 770
;768:	}
;769:
;770:	size = ICON_SIZE * 1.25;
ADDRLP4 4
CNSTF4 1114636288
ASGNF4
line 772
;771:
;772:	angles[PITCH] = 0;
ADDRLP4 24
CNSTF4 0
ASGNF4
line 773
;773:	angles[YAW] = 180;
ADDRLP4 24+4
CNSTF4 1127481344
ASGNF4
line 774
;774:	angles[ROLL] = 0;
ADDRLP4 24+8
CNSTF4 0
ASGNF4
line 775
;775:	CG_DrawHead( cgs.screenXmax + 1 - size, y, size, size, clientNum, angles );
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1065353216
ADDF4
ADDRLP4 4
INDIRF4
SUBF4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
ADDRGP4 CG_DrawHead
CALLV
pop
line 777
;776:
;777:	info = CG_ConfigString( CS_PLAYERS + clientNum );
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 56
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 40
ADDRLP4 56
INDIRP4
ASGNP4
line 778
;778:	name = Info_ValueForKey(  info, "n" );
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 $447
ARGP4
ADDRLP4 60
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 44
ADDRLP4 60
INDIRP4
ASGNP4
line 779
;779:	y += size;
ADDRFP4 0
ADDRFP4 0
INDIRF4
ADDRLP4 4
INDIRF4
ADDF4
ASGNF4
line 781
;780:
;781:	VectorSet( color, 1, 1, 1 );
ADDRLP4 8
CNSTF4 1065353216
ASGNF4
ADDRLP4 8+4
CNSTF4 1065353216
ASGNF4
ADDRLP4 8+8
CNSTF4 1065353216
ASGNF4
line 782
;782:	color[3] = 0.5f;
ADDRLP4 8+12
CNSTF4 1056964608
ASGNF4
line 784
;783:
;784:	CG_DrawString( cgs.screenXmax - 4, y, name, color, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_PROPORTIONAL | DS_RIGHT );
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 786
;785:
;786:	return y + BIGCHAR_HEIGHT + 2;
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
ADDF4
CNSTF4 1073741824
ADDF4
RETF4
LABELV $423
endproc CG_DrawAttacker 64 32
proc CG_DrawSpeedMeter 8 32
line 795
;787:}
;788:
;789:
;790:/*
;791:================
;792:CG_DrawSpeedMeter
;793:================
;794:*/
;795:static float CG_DrawSpeedMeter( float y ) {
line 799
;796:	const char *s;
;797:
;798:	/* speed meter can get in the way of the scoreboard */
;799:	if ( cg.scoreBoardShowing ) {
ADDRGP4 cg+115360
INDIRI4
CNSTI4 0
EQI4 $453
line 800
;800:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $452
JUMPV
LABELV $453
line 803
;801:	}
;802:
;803:	s = va( "%1.0fups", cg.xyspeed );
ADDRGP4 $456
ARGP4
ADDRGP4 cg+125884
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 805
;804:
;805:	if ( cg_drawSpeed.integer == 1 ) {
ADDRGP4 cg_drawSpeed+12
INDIRI4
CNSTI4 1
NEI4 $458
line 807
;806:		/* top left-hand corner of screen */
;807:		CG_DrawString( cgs.screenXmax - 4, y + 2, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT | DS_PROPORTIONAL );
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
ADDF4
ARGF4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 21
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 808
;808:		return y + BIGCHAR_HEIGHT + 4;
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
ADDF4
CNSTF4 1082130432
ADDF4
RETF4
ADDRGP4 $452
JUMPV
LABELV $458
line 809
;809:	} else {
line 811
;810:		/* center of screen */
;811:		CG_DrawString( 320, 300, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_CENTER | DS_PROPORTIONAL );
CNSTF4 1134559232
ARGF4
CNSTF4 1133903872
ARGF4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 13
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 812
;812:		return y;
ADDRFP4 0
INDIRF4
RETF4
LABELV $452
endproc CG_DrawSpeedMeter 8 32
proc CG_DrawSnapshot 8 32
line 822
;813:	}
;814:}
;815:
;816:
;817:/*
;818:==================
;819:CG_DrawSnapshot
;820:==================
;821:*/
;822:static float CG_DrawSnapshot( float y ) {
line 825
;823:	const char *s;
;824:
;825:	s = va( "time:%i snap:%i cmd:%i", cg.snap->serverTime, 
ADDRGP4 $463
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+28
INDIRI4
ARGI4
ADDRGP4 cgs+31468
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 828
;826:		cg.latestSnapshotNum, cgs.serverCommandSequence );
;827:
;828:	CG_DrawString( cgs.screenXmax - 4, y + 2, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT );
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
ADDF4
ARGF4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 17
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 830
;829:
;830:	return y + BIGCHAR_HEIGHT + 4;
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
ADDF4
CNSTF4 1082130432
ADDF4
RETF4
LABELV $462
endproc CG_DrawSnapshot 8 32
bss
align 4
LABELV $469
skip 16
align 4
LABELV $470
skip 4
align 4
LABELV $471
skip 4
code
proc CG_DrawFPS 36 32
line 840
;831:}
;832:
;833:
;834:/*
;835:==================
;836:CG_DrawFPS
;837:==================
;838:*/
;839:#define	FPS_FRAMES	4
;840:static float CG_DrawFPS( float y ) {
line 851
;841:	const char	*s;
;842:	static int	previousTimes[FPS_FRAMES];
;843:	static int	index;
;844:	int		i, total;
;845:	int		fps;
;846:	static	int	previous;
;847:	int		t, frameTime;
;848:
;849:	// don't use serverTime, because that will be drifting to
;850:	// correct for internet lag changes, timescales, timedemos, etc
;851:	t = trap_Milliseconds();
ADDRLP4 24
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 24
INDIRI4
ASGNI4
line 852
;852:	frameTime = t - previous;
ADDRLP4 12
ADDRLP4 8
INDIRI4
ADDRGP4 $471
INDIRI4
SUBI4
ASGNI4
line 853
;853:	previous = t;
ADDRGP4 $471
ADDRLP4 8
INDIRI4
ASGNI4
line 855
;854:
;855:	previousTimes[index % FPS_FRAMES] = frameTime;
ADDRGP4 $470
INDIRI4
CNSTI4 4
MODI4
CNSTI4 2
LSHI4
ADDRGP4 $469
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 856
;856:	index++;
ADDRLP4 28
ADDRGP4 $470
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 857
;857:	if ( index > FPS_FRAMES ) {
ADDRGP4 $470
INDIRI4
CNSTI4 4
LEI4 $472
line 859
;858:		// average multiple frames together to smooth changes out a bit
;859:		total = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 860
;860:		for ( i = 0 ; i < FPS_FRAMES ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $474
line 861
;861:			total += previousTimes[i];
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $469
ADDP4
INDIRI4
ADDI4
ASGNI4
line 862
;862:		}
LABELV $475
line 860
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $474
line 863
;863:		if ( !total ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $478
line 864
;864:			total = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 865
;865:		}
LABELV $478
line 866
;866:		fps = 1000 * FPS_FRAMES / total;
ADDRLP4 20
CNSTI4 4000
ADDRLP4 4
INDIRI4
DIVI4
ASGNI4
line 868
;867:
;868:		s = va( "%ifps", fps );
ADDRGP4 $480
ARGP4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 32
INDIRP4
ASGNP4
line 869
;869:		CG_DrawString( cgs.screenXmax - 4, y + 2, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT | DS_PROPORTIONAL );
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
ADDF4
ARGF4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 21
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 870
;870:	}
LABELV $472
line 872
;871:
;872:	return y + BIGCHAR_HEIGHT + 4;
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
ADDF4
CNSTF4 1082130432
ADDF4
RETF4
LABELV $468
endproc CG_DrawFPS 36 32
proc CG_DrawTimer 20 32
line 881
;873:}
;874:
;875:
;876:/*
;877:=================
;878:CG_DrawTimer
;879:=================
;880:*/
;881:static float CG_DrawTimer( float y ) {
line 886
;882:	const char	*s;
;883:	int			mins, seconds;
;884:	int			msec;
;885:
;886:	msec = cg.time - cgs.levelStartTime;
ADDRLP4 12
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cgs+34820
INDIRI4
SUBI4
ASGNI4
line 888
;887:
;888:	seconds = msec / 1000;
ADDRLP4 0
ADDRLP4 12
INDIRI4
CNSTI4 1000
DIVI4
ASGNI4
line 889
;889:	mins = seconds / 60;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 60
DIVI4
ASGNI4
line 890
;890:	seconds -= mins * 60;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 60
MULI4
SUBI4
ASGNI4
line 892
;891:
;892:	s = va( "%i:%02i", mins, seconds );
ADDRGP4 $485
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 893
;893:	CG_DrawString( cgs.screenXmax - 4, y + 2, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT | DS_PROPORTIONAL );
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
ADDF4
ARGF4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 21
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 895
;894:
;895:	return y + BIGCHAR_HEIGHT + 4;
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
ADDF4
CNSTF4 1082130432
ADDF4
RETF4
LABELV $482
endproc CG_DrawTimer 20 32
proc CG_DrawTeamOverlay 120 32
line 904
;896:}
;897:
;898:
;899:/*
;900:=================
;901:CG_DrawTeamOverlay
;902:=================
;903:*/
;904:static float CG_DrawTeamOverlay( float y, qboolean right, qboolean upper ) {
line 916
;905:	int x, w, h, xx;
;906:	int i, j, len;
;907:	const char *p;
;908:	vec4_t		hcolor;
;909:	int pwidth, lwidth;
;910:	int plyrs;
;911:	char st[16];
;912:	clientInfo_t *ci;
;913:	gitem_t	*item;
;914:	int ret_y, count;
;915:
;916:	if ( !cg_drawTeamOverlay.integer ) {
ADDRGP4 cg_drawTeamOverlay+12
INDIRI4
CNSTI4 0
NEI4 $488
line 917
;917:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $487
JUMPV
LABELV $488
line 920
;918:	}
;919:
;920:	if ( cg.snap->ps.persistant[PERS_TEAM] != TEAM_RED && cg.snap->ps.persistant[PERS_TEAM] != TEAM_BLUE ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
EQI4 $491
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
EQI4 $491
line 921
;921:		return y; // Not on any team
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $487
JUMPV
LABELV $491
line 924
;922:	}
;923:
;924:	plyrs = 0;
ADDRLP4 76
CNSTI4 0
ASGNI4
line 927
;925:
;926:	// max player name width
;927:	pwidth = 0;
ADDRLP4 56
CNSTI4 0
ASGNI4
line 928
;928:	count = (numSortedTeamPlayers > 8) ? 8 : numSortedTeamPlayers;
ADDRGP4 numSortedTeamPlayers
INDIRI4
CNSTI4 8
LEI4 $496
ADDRLP4 92
CNSTI4 8
ASGNI4
ADDRGP4 $497
JUMPV
LABELV $496
ADDRLP4 92
ADDRGP4 numSortedTeamPlayers
INDIRI4
ASGNI4
LABELV $497
ADDRLP4 48
ADDRLP4 92
INDIRI4
ASGNI4
line 929
;929:	for (i = 0; i < count; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $501
JUMPV
LABELV $498
line 930
;930:		ci = cgs.clientinfo + sortedTeamPlayers[i];
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 931
;931:		if ( ci->infoValid && ci->team == cg.snap->ps.persistant[PERS_TEAM]) {
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $503
ADDRLP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
NEI4 $503
line 932
;932:			plyrs++;
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 933
;933:			len = CG_DrawStrlen(ci->name);
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 100
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 100
INDIRI4
ASGNI4
line 934
;934:			if (len > pwidth)
ADDRLP4 40
INDIRI4
ADDRLP4 56
INDIRI4
LEI4 $506
line 935
;935:				pwidth = len;
ADDRLP4 56
ADDRLP4 40
INDIRI4
ASGNI4
LABELV $506
line 936
;936:		}
LABELV $503
line 937
;937:	}
LABELV $499
line 929
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $501
ADDRLP4 8
INDIRI4
ADDRLP4 48
INDIRI4
LTI4 $498
line 939
;938:
;939:	if (!plyrs)
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $508
line 940
;940:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $487
JUMPV
LABELV $508
line 942
;941:
;942:	if (pwidth > TEAM_OVERLAY_MAXNAME_WIDTH)
ADDRLP4 56
INDIRI4
CNSTI4 12
LEI4 $510
line 943
;943:		pwidth = TEAM_OVERLAY_MAXNAME_WIDTH;
ADDRLP4 56
CNSTI4 12
ASGNI4
LABELV $510
line 946
;944:
;945:	// max location name width
;946:	lwidth = 0;
ADDRLP4 44
CNSTI4 0
ASGNI4
line 947
;947:	for (i = 1; i < MAX_LOCATIONS; i++) {
ADDRLP4 8
CNSTI4 1
ASGNI4
LABELV $512
line 948
;948:		p = CG_ConfigString(CS_LOCATIONS + i);
ADDRLP4 8
INDIRI4
CNSTI4 608
ADDI4
ARGI4
ADDRLP4 96
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 96
INDIRP4
ASGNP4
line 949
;949:		if (p && *p) {
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $516
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $516
line 950
;950:			len = CG_DrawStrlen(p);
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 104
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 104
INDIRI4
ASGNI4
line 951
;951:			if (len > lwidth)
ADDRLP4 40
INDIRI4
ADDRLP4 44
INDIRI4
LEI4 $518
line 952
;952:				lwidth = len;
ADDRLP4 44
ADDRLP4 40
INDIRI4
ASGNI4
LABELV $518
line 953
;953:		}
LABELV $516
line 954
;954:	}
LABELV $513
line 947
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 64
LTI4 $512
line 956
;955:
;956:	if (lwidth > TEAM_OVERLAY_MAXLOCATION_WIDTH)
ADDRLP4 44
INDIRI4
CNSTI4 16
LEI4 $520
line 957
;957:		lwidth = TEAM_OVERLAY_MAXLOCATION_WIDTH;
ADDRLP4 44
CNSTI4 16
ASGNI4
LABELV $520
line 959
;958:
;959:	w = (pwidth + lwidth + 4 + 7) * TINYCHAR_WIDTH;
ADDRLP4 80
ADDRLP4 56
INDIRI4
ADDRLP4 44
INDIRI4
ADDI4
CNSTI4 3
LSHI4
CNSTI4 32
ADDI4
CNSTI4 56
ADDI4
ASGNI4
line 961
;960:
;961:	if ( right )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $522
line 962
;962:		x = cgs.screenXmax + 1 - w;
ADDRLP4 52
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1065353216
ADDF4
ADDRLP4 80
INDIRI4
CVIF4 4
SUBF4
CVFI4 4
ASGNI4
ADDRGP4 $523
JUMPV
LABELV $522
line 964
;963:	else
;964:		x = cgs.screenXmin;
ADDRLP4 52
ADDRGP4 cgs+31452
INDIRF4
CVFI4 4
ASGNI4
LABELV $523
line 966
;965:
;966:	h = plyrs * TINYCHAR_HEIGHT;
ADDRLP4 84
ADDRLP4 76
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
line 968
;967:
;968:	if ( upper ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $526
line 969
;969:		ret_y = y + h;
ADDRLP4 88
ADDRFP4 0
INDIRF4
ADDRLP4 84
INDIRI4
CVIF4 4
ADDF4
CVFI4 4
ASGNI4
line 970
;970:	} else {
ADDRGP4 $527
JUMPV
LABELV $526
line 971
;971:		y -= h;
ADDRFP4 0
ADDRFP4 0
INDIRF4
ADDRLP4 84
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 972
;972:		ret_y = y;
ADDRLP4 88
ADDRFP4 0
INDIRF4
CVFI4 4
ASGNI4
line 973
;973:	}
LABELV $527
line 975
;974:
;975:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $528
line 976
;976:		hcolor[0] = 1.0f;
ADDRLP4 24
CNSTF4 1065353216
ASGNF4
line 977
;977:		hcolor[1] = 0.0f;
ADDRLP4 24+4
CNSTF4 0
ASGNF4
line 978
;978:		hcolor[2] = 0.0f;
ADDRLP4 24+8
CNSTF4 0
ASGNF4
line 979
;979:		hcolor[3] = 0.33f;
ADDRLP4 24+12
CNSTF4 1051260355
ASGNF4
line 980
;980:	} else { // if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE )
ADDRGP4 $529
JUMPV
LABELV $528
line 981
;981:		hcolor[0] = 0.0f;
ADDRLP4 24
CNSTF4 0
ASGNF4
line 982
;982:		hcolor[1] = 0.0f;
ADDRLP4 24+4
CNSTF4 0
ASGNF4
line 983
;983:		hcolor[2] = 1.0f;
ADDRLP4 24+8
CNSTF4 1065353216
ASGNF4
line 984
;984:		hcolor[3] = 0.33f;
ADDRLP4 24+12
CNSTF4 1051260355
ASGNF4
line 985
;985:	}
LABELV $529
line 986
;986:	trap_R_SetColor( hcolor );
ADDRLP4 24
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 987
;987:	CG_DrawPic( x, y, w, h, cgs.media.teamStatusBar );
ADDRLP4 52
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 80
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 84
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cgs+148692+160
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 988
;988:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 990
;989:
;990:	for (i = 0; i < count; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $542
JUMPV
LABELV $539
line 991
;991:		ci = cgs.clientinfo + sortedTeamPlayers[i];
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 992
;992:		if ( ci->infoValid && ci->team == cg.snap->ps.persistant[PERS_TEAM]) {
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $544
ADDRLP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
NEI4 $544
line 994
;993:
;994:			hcolor[0] = hcolor[1] = hcolor[2] = hcolor[3] = 1.0;
ADDRLP4 100
CNSTF4 1065353216
ASGNF4
ADDRLP4 24+12
ADDRLP4 100
INDIRF4
ASGNF4
ADDRLP4 24+8
ADDRLP4 100
INDIRF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 100
INDIRF4
ASGNF4
ADDRLP4 24
ADDRLP4 100
INDIRF4
ASGNF4
line 996
;995:
;996:			xx = x + TINYCHAR_WIDTH;
ADDRLP4 12
ADDRLP4 52
INDIRI4
CNSTI4 8
ADDI4
ASGNI4
line 998
;997:
;998:			CG_DrawString( xx, y, ci->name, hcolor, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, TEAM_OVERLAY_MAXNAME_WIDTH, DS_PROPORTIONAL );
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 24
ARGP4
CNSTF4 1090519040
ARGF4
CNSTF4 1090519040
ARGF4
CNSTI4 12
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1000
;999:
;1000:			if (lwidth) {
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $550
line 1001
;1001:				p = CG_ConfigString(CS_LOCATIONS + ci->location);
ADDRLP4 4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 608
ADDI4
ARGI4
ADDRLP4 104
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 104
INDIRP4
ASGNP4
line 1002
;1002:				if (!p || !*p)
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $554
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $552
LABELV $554
line 1003
;1003:					p = "unknown";
ADDRLP4 20
ADDRGP4 $555
ASGNP4
LABELV $552
line 1004
;1004:				len = CG_DrawStrlen(p);
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 112
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 112
INDIRI4
ASGNI4
line 1005
;1005:				if (len > lwidth)
ADDRLP4 40
INDIRI4
ADDRLP4 44
INDIRI4
LEI4 $556
line 1006
;1006:					len = lwidth;
ADDRLP4 40
ADDRLP4 44
INDIRI4
ASGNI4
LABELV $556
line 1010
;1007:
;1008://				xx = x + TINYCHAR_WIDTH * 2 + TINYCHAR_WIDTH * pwidth + 
;1009://					((lwidth/2 - len/2) * TINYCHAR_WIDTH);
;1010:				xx = x + TINYCHAR_WIDTH * 2 + TINYCHAR_WIDTH * pwidth;
ADDRLP4 12
ADDRLP4 52
INDIRI4
CNSTI4 16
ADDI4
ADDRLP4 56
INDIRI4
CNSTI4 3
LSHI4
ADDI4
ASGNI4
line 1011
;1011:				CG_DrawString( xx, y, p, hcolor, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, TEAM_OVERLAY_MAXLOCATION_WIDTH, DS_PROPORTIONAL );
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
CNSTF4 1090519040
ARGF4
CNSTF4 1090519040
ARGF4
CNSTI4 16
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1012
;1012:			}
LABELV $550
line 1014
;1013:
;1014:			CG_GetColorForHealth( ci->health, ci->armor, hcolor );
ADDRLP4 4
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
ADDRGP4 CG_GetColorForHealth
CALLV
pop
line 1016
;1015:
;1016:			Com_sprintf (st, sizeof(st), "%3i %3i", ci->health,	ci->armor);
ADDRLP4 60
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $558
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1018
;1017:
;1018:			xx = x + TINYCHAR_WIDTH * 3 + 
ADDRLP4 12
ADDRLP4 52
INDIRI4
CNSTI4 24
ADDI4
ADDRLP4 56
INDIRI4
CNSTI4 3
LSHI4
ADDI4
ADDRLP4 44
INDIRI4
CNSTI4 3
LSHI4
ADDI4
ASGNI4
line 1021
;1019:				TINYCHAR_WIDTH * pwidth + TINYCHAR_WIDTH * lwidth;
;1020:
;1021:			CG_DrawString( xx, y, st, hcolor, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 0, 0 );
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 60
ARGP4
ADDRLP4 24
ARGP4
CNSTF4 1090519040
ARGF4
CNSTF4 1090519040
ARGF4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1024
;1022:
;1023:			// draw weapon icon
;1024:			xx += TINYCHAR_WIDTH * 3;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 24
ADDI4
ASGNI4
line 1026
;1025:
;1026:			if ( cg_weapons[ci->curWeapon].weaponIcon ) {
ADDRLP4 4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 136
MULI4
ADDRGP4 cg_weapons+68
ADDP4
INDIRI4
CNSTI4 0
EQI4 $559
line 1027
;1027:				CG_DrawPic( xx, y, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
CNSTF4 1090519040
ARGF4
CNSTF4 1090519040
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 136
MULI4
ADDRGP4 cg_weapons+68
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1029
;1028:					cg_weapons[ci->curWeapon].weaponIcon );
;1029:			} else {
ADDRGP4 $560
JUMPV
LABELV $559
line 1030
;1030:				CG_DrawPic( xx, y, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
CNSTF4 1090519040
ARGF4
CNSTF4 1090519040
ARGF4
ADDRGP4 cgs+148692+164
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1032
;1031:					cgs.media.deferShader );
;1032:			}
LABELV $560
line 1035
;1033:
;1034:			// Draw powerup icons
;1035:			if (right) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $565
line 1036
;1036:				xx = x;
ADDRLP4 12
ADDRLP4 52
INDIRI4
ASGNI4
line 1037
;1037:			} else {
ADDRGP4 $566
JUMPV
LABELV $565
line 1038
;1038:				xx = x + w - TINYCHAR_WIDTH;
ADDRLP4 12
ADDRLP4 52
INDIRI4
ADDRLP4 80
INDIRI4
ADDI4
CNSTI4 8
SUBI4
ASGNI4
line 1039
;1039:			}
LABELV $566
line 1040
;1040:			for (j = 0; j <= PW_NUM_POWERUPS; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $567
line 1041
;1041:				if (ci->powerups & (1 << j)) {
ADDRLP4 4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $571
line 1043
;1042:
;1043:					item = BG_FindItemForPowerup( j );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 112
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 112
INDIRP4
ASGNP4
line 1045
;1044:
;1045:					if (item) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $573
line 1046
;1046:						CG_DrawPic( xx, y, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 
ADDRLP4 16
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
ARGP4
ADDRLP4 116
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
CNSTF4 1090519040
ARGF4
CNSTF4 1090519040
ARGF4
ADDRLP4 116
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1048
;1047:						trap_R_RegisterShader( item->icon ) );
;1048:						if (right) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $575
line 1049
;1049:							xx -= TINYCHAR_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 8
SUBI4
ASGNI4
line 1050
;1050:						} else {
ADDRGP4 $576
JUMPV
LABELV $575
line 1051
;1051:							xx += TINYCHAR_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 8
ADDI4
ASGNI4
line 1052
;1052:						}
LABELV $576
line 1053
;1053:					}
LABELV $573
line 1054
;1054:				}
LABELV $571
line 1055
;1055:			}
LABELV $568
line 1040
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 15
LEI4 $567
line 1057
;1056:
;1057:			y += TINYCHAR_HEIGHT;
ADDRFP4 0
ADDRFP4 0
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 1058
;1058:		}
LABELV $544
line 1059
;1059:	}
LABELV $540
line 990
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $542
ADDRLP4 8
INDIRI4
ADDRLP4 48
INDIRI4
LTI4 $539
line 1061
;1060:
;1061:	return ret_y;
ADDRLP4 88
INDIRI4
CVIF4 4
RETF4
LABELV $487
endproc CG_DrawTeamOverlay 120 32
proc CG_DrawUpperRight 12 12
line 1072
;1062:}
;1063:
;1064:
;1065:/*
;1066:=====================
;1067:CG_DrawUpperRight
;1068:
;1069:=====================
;1070:*/
;1071:static void CG_DrawUpperRight(stereoFrame_t stereoFrame)
;1072:{
line 1075
;1073:	float	y;
;1074:
;1075:	y = cgs.screenYmin;
ADDRLP4 0
ADDRGP4 cgs+31460
INDIRF4
ASGNF4
line 1077
;1076:
;1077:	if ( cgs.gametype >= GT_TDM && cg_drawTeamOverlay.integer == 1 ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $579
ADDRGP4 cg_drawTeamOverlay+12
INDIRI4
CNSTI4 1
NEI4 $579
line 1078
;1078:		y = CG_DrawTeamOverlay( y, qtrue, qtrue );
ADDRLP4 0
INDIRF4
ARGF4
CNSTI4 1
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 4
ADDRGP4 CG_DrawTeamOverlay
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 1079
;1079:	} 
LABELV $579
line 1080
;1080:	if ( cg_drawSnapshot.integer ) {
ADDRGP4 cg_drawSnapshot+12
INDIRI4
CNSTI4 0
EQI4 $583
line 1081
;1081:		y = CG_DrawSnapshot( y );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 CG_DrawSnapshot
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 1082
;1082:	}
LABELV $583
line 1083
;1083:	if (cg_drawFPS.integer && (stereoFrame == STEREO_CENTER || stereoFrame == STEREO_RIGHT)) {
ADDRGP4 cg_drawFPS+12
INDIRI4
CNSTI4 0
EQI4 $586
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $589
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $586
LABELV $589
line 1084
;1084:		y = CG_DrawFPS( y );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 CG_DrawFPS
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
ASGNF4
line 1085
;1085:	}
LABELV $586
line 1086
;1086:	if ( cg_drawSpeed.integer ) {
ADDRGP4 cg_drawSpeed+12
INDIRI4
CNSTI4 0
EQI4 $590
line 1087
;1087:		y = CG_DrawSpeedMeter( y );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 CG_DrawSpeedMeter
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
ASGNF4
line 1088
;1088:	}	
LABELV $590
line 1089
;1089:	if ( cg_drawTimer.integer ) {
ADDRGP4 cg_drawTimer+12
INDIRI4
CNSTI4 0
EQI4 $593
line 1090
;1090:		y = CG_DrawTimer( y );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 CG_DrawTimer
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
ASGNF4
line 1091
;1091:	}
LABELV $593
line 1092
;1092:	if ( cg_drawAttacker.integer ) {
ADDRGP4 cg_drawAttacker+12
INDIRI4
CNSTI4 0
EQI4 $596
line 1093
;1093:		y = CG_DrawAttacker( y );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 CG_DrawAttacker
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
ASGNF4
line 1094
;1094:	}
LABELV $596
line 1095
;1095:}
LABELV $577
endproc CG_DrawUpperRight 12 12
proc CG_DrawScores 76 32
line 1113
;1096:
;1097:
;1098:/*
;1099:===========================================================================================
;1100:
;1101:  LOWER RIGHT CORNER
;1102:
;1103:===========================================================================================
;1104:*/
;1105:
;1106:/*
;1107:=================
;1108:CG_DrawScores
;1109:
;1110:Draw the small two score display
;1111:=================
;1112:*/
;1113:static float CG_DrawScores( float y ) {
line 1122
;1114:	const char	*s;
;1115:	int			s1, s2, score;
;1116:	int			x, x0, w;
;1117:	int			v;
;1118:	vec4_t		color;
;1119:	float		y1;
;1120:	gitem_t		*item;
;1121:
;1122:	s1 = cgs.scores1;
ADDRLP4 32
ADDRGP4 cgs+34824
INDIRI4
ASGNI4
line 1123
;1123:	s2 = cgs.scores2;
ADDRLP4 36
ADDRGP4 cgs+34828
INDIRI4
ASGNI4
line 1125
;1124:
;1125:	y -=  BIGCHAR_HEIGHT + 8 - 4;
ADDRFP4 0
ADDRFP4 0
INDIRF4
CNSTF4 1101004800
SUBF4
ASGNF4
line 1127
;1126:
;1127:	y1 = y;
ADDRLP4 40
ADDRFP4 0
INDIRF4
ASGNF4
line 1130
;1128:
;1129:	// draw from the right side to left
;1130:	if ( cgs.gametype >= GT_TDM ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $602
line 1131
;1131:		x0 = cgs.screenXmax + 1;
ADDRLP4 28
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ASGNI4
line 1132
;1132:		color[0] = 0.0f;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1133
;1133:		color[1] = 0.1f;
ADDRLP4 0+4
CNSTF4 1036831949
ASGNF4
line 1134
;1134:		color[2] = 1.0f;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 1135
;1135:		color[3] = 0.33f;
ADDRLP4 0+12
CNSTF4 1051260355
ASGNF4
line 1137
;1136:		// second score
;1137:		s = va( "%2i", s2 );
ADDRGP4 $609
ARGP4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 56
INDIRP4
ASGNP4
line 1138
;1138:		w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH + 8;
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 60
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 8
ADDI4
ASGNI4
line 1139
;1139:		x = x0 - w;
ADDRLP4 16
ADDRLP4 28
INDIRI4
ADDRLP4 24
INDIRI4
SUBI4
ASGNI4
line 1140
;1140:		CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 1141
;1141:		if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $610
line 1142
;1142:			CG_DrawPic( x, y-4, w, BIGCHAR_HEIGHT+8, cgs.media.selectShader );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRGP4 cgs+148692+244
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1143
;1143:		}
LABELV $610
line 1144
;1144:		CG_DrawString( x0-4, y, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT );
ADDRLP4 28
INDIRI4
CNSTI4 4
SUBI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 17
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1146
;1145:
;1146:		if ( cgs.gametype == GT_CTF ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 4
NEI4 $615
line 1148
;1147:			// Display flag status
;1148:			item = BG_FindItemForPowerup( PW_BLUEFLAG );
CNSTI4 8
ARGI4
ADDRLP4 64
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 48
ADDRLP4 64
INDIRP4
ASGNP4
line 1150
;1149:
;1150:			if (item) {
ADDRLP4 48
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $618
line 1151
;1151:				y1 = y - BIGCHAR_HEIGHT - 8;
ADDRLP4 40
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
SUBF4
CNSTF4 1090519040
SUBF4
ASGNF4
line 1152
;1152:				if( cgs.blueflag >= 0 && cgs.blueflag <= 2 ) {
ADDRGP4 cgs+34836
INDIRI4
CNSTI4 0
LTI4 $620
ADDRGP4 cgs+34836
INDIRI4
CNSTI4 2
GTI4 $620
line 1153
;1153:					CG_DrawPic( x, y1-4, w, BIGCHAR_HEIGHT+8, cgs.media.blueFlagShader[cgs.blueflag] );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 40
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRGP4 cgs+34836
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+60
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1154
;1154:				}
LABELV $620
line 1155
;1155:			}
LABELV $618
line 1156
;1156:		}
LABELV $615
line 1157
;1157:		color[0] = 1.0f;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 1158
;1158:		color[1] = 0.0f;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 1159
;1159:		color[2] = 0.0f;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1160
;1160:		color[3] = 0.33f;
ADDRLP4 0+12
CNSTF4 1051260355
ASGNF4
line 1162
;1161:		// first score
;1162:		x0 = x;
ADDRLP4 28
ADDRLP4 16
INDIRI4
ASGNI4
line 1163
;1163:		s = va( "%2i", s1 );
ADDRGP4 $609
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 64
INDIRP4
ASGNP4
line 1164
;1164:		w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH + 8;
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 68
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 8
ADDI4
ASGNI4
line 1165
;1165:		x -= w;
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 24
INDIRI4
SUBI4
ASGNI4
line 1166
;1166:		CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 1167
;1167:		if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $630
line 1168
;1168:			CG_DrawPic( x, y-4, w, BIGCHAR_HEIGHT+8, cgs.media.selectShader );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRGP4 cgs+148692+244
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1169
;1169:		}
LABELV $630
line 1171
;1170:
;1171:		CG_DrawString( x0-4, y, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT );
ADDRLP4 28
INDIRI4
CNSTI4 4
SUBI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 17
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1173
;1172:
;1173:		if ( cgs.gametype == GT_CTF ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 4
NEI4 $635
line 1175
;1174:			// Display flag status
;1175:			item = BG_FindItemForPowerup( PW_REDFLAG );
CNSTI4 7
ARGI4
ADDRLP4 72
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 48
ADDRLP4 72
INDIRP4
ASGNP4
line 1177
;1176:
;1177:			if (item) {
ADDRLP4 48
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $638
line 1178
;1178:				y1 = y - BIGCHAR_HEIGHT - 8;
ADDRLP4 40
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
SUBF4
CNSTF4 1090519040
SUBF4
ASGNF4
line 1179
;1179:				if( cgs.redflag >= 0 && cgs.redflag <= 2 ) {
ADDRGP4 cgs+34832
INDIRI4
CNSTI4 0
LTI4 $640
ADDRGP4 cgs+34832
INDIRI4
CNSTI4 2
GTI4 $640
line 1180
;1180:					CG_DrawPic( x, y1-4, w, BIGCHAR_HEIGHT+8, cgs.media.redFlagShader[cgs.redflag] );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 40
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRGP4 cgs+34832
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+48
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1181
;1181:				}
LABELV $640
line 1182
;1182:			}
LABELV $638
line 1183
;1183:		}
LABELV $635
line 1185
;1184:
;1185:		if ( cgs.gametype == GT_ONEFLAG ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 5
NEI4 $647
line 1187
;1186:			// Display flag status
;1187:			item = BG_FindItemForPowerup( PW_NEUTRALFLAG );
CNSTI4 9
ARGI4
ADDRLP4 72
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 48
ADDRLP4 72
INDIRP4
ASGNP4
line 1189
;1188:
;1189:			if (item) {
ADDRLP4 48
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $650
line 1190
;1190:				y1 = y - BIGCHAR_HEIGHT - 8;
ADDRLP4 40
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
SUBF4
CNSTF4 1090519040
SUBF4
ASGNF4
line 1191
;1191:				if( cgs.flagStatus >= 0 && cgs.flagStatus <= 3 ) {
ADDRGP4 cgs+34840
INDIRI4
CNSTI4 0
LTI4 $652
ADDRGP4 cgs+34840
INDIRI4
CNSTI4 3
GTI4 $652
line 1192
;1192:					CG_DrawPic( x, y1-4, w, BIGCHAR_HEIGHT+8, cgs.media.flagShader[cgs.flagStatus] );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 40
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRGP4 cgs+34840
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+72
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1193
;1193:				}
LABELV $652
line 1194
;1194:			}
LABELV $650
line 1195
;1195:		}
LABELV $647
line 1197
;1196:
;1197:		if ( cgs.gametype >= GT_CTF ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 4
LTI4 $659
line 1198
;1198:			v = cgs.capturelimit;
ADDRLP4 52
ADDRGP4 cgs+31496
INDIRI4
ASGNI4
line 1199
;1199:		} else {
ADDRGP4 $660
JUMPV
LABELV $659
line 1200
;1200:			v = cgs.fraglimit;
ADDRLP4 52
ADDRGP4 cgs+31492
INDIRI4
ASGNI4
line 1201
;1201:		}
LABELV $660
line 1202
;1202:		if ( v ) {
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $603
line 1203
;1203:			s = va( "%2i", v );
ADDRGP4 $609
ARGP4
ADDRLP4 52
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 72
INDIRP4
ASGNP4
line 1204
;1204:			CG_DrawString( x-4, y, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT );
ADDRLP4 16
INDIRI4
CNSTI4 4
SUBI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 17
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1205
;1205:		}
line 1207
;1206:
;1207:	} else {
ADDRGP4 $603
JUMPV
LABELV $602
line 1210
;1208:		qboolean	spectator;
;1209:
;1210:		x = cgs.screenXmax + 1;
ADDRLP4 16
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ASGNI4
line 1212
;1211:
;1212:		score = cg.snap->ps.persistant[PERS_SCORE];
ADDRLP4 44
ADDRGP4 cg+36
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ASGNI4
line 1213
;1213:		spectator = ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR );
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $670
ADDRLP4 60
CNSTI4 1
ASGNI4
ADDRGP4 $671
JUMPV
LABELV $670
ADDRLP4 60
CNSTI4 0
ASGNI4
LABELV $671
ADDRLP4 56
ADDRLP4 60
INDIRI4
ASGNI4
line 1216
;1214:
;1215:		// always show your score in the second box if not in first place
;1216:		if ( s1 != score ) {
ADDRLP4 32
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $672
line 1217
;1217:			s2 = score;
ADDRLP4 36
ADDRLP4 44
INDIRI4
ASGNI4
line 1218
;1218:		}
LABELV $672
line 1219
;1219:		if ( s2 != SCORE_NOT_PRESENT ) {
ADDRLP4 36
INDIRI4
CNSTI4 -9999
EQI4 $674
line 1220
;1220:			x0 = x;
ADDRLP4 28
ADDRLP4 16
INDIRI4
ASGNI4
line 1221
;1221:			s = va( "%2i", s2 );
ADDRGP4 $609
ARGP4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 64
INDIRP4
ASGNP4
line 1222
;1222:			w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH + 8;
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 68
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 8
ADDI4
ASGNI4
line 1223
;1223:			x -= w;
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 24
INDIRI4
SUBI4
ASGNI4
line 1224
;1224:			if ( !spectator && score == s2 && score != s1 ) {
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $676
ADDRLP4 72
ADDRLP4 44
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $676
ADDRLP4 72
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $676
line 1225
;1225:				color[0] = 1.0f;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 1226
;1226:				color[1] = 0.0f;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 1227
;1227:				color[2] = 0.0f;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1228
;1228:				color[3] = 0.33f;
ADDRLP4 0+12
CNSTF4 1051260355
ASGNF4
line 1229
;1229:				CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 1230
;1230:				CG_DrawPic( x, y-4, w, BIGCHAR_HEIGHT+8, cgs.media.selectShader );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRGP4 cgs+148692+244
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1231
;1231:			} else {
ADDRGP4 $677
JUMPV
LABELV $676
line 1232
;1232:				color[0] = 0.5f;
ADDRLP4 0
CNSTF4 1056964608
ASGNF4
line 1233
;1233:				color[1] = 0.5f;
ADDRLP4 0+4
CNSTF4 1056964608
ASGNF4
line 1234
;1234:				color[2] = 0.5f;
ADDRLP4 0+8
CNSTF4 1056964608
ASGNF4
line 1235
;1235:				color[3] = 0.33f;
ADDRLP4 0+12
CNSTF4 1051260355
ASGNF4
line 1236
;1236:				CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 1237
;1237:			}	
LABELV $677
line 1238
;1238:			CG_DrawString( x0-4, y, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT );
ADDRLP4 28
INDIRI4
CNSTI4 4
SUBI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 17
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1239
;1239:		}
LABELV $674
line 1242
;1240:
;1241:		// first place
;1242:		if ( s1 != SCORE_NOT_PRESENT ) {
ADDRLP4 32
INDIRI4
CNSTI4 -9999
EQI4 $686
line 1243
;1243:			x0 = x;
ADDRLP4 28
ADDRLP4 16
INDIRI4
ASGNI4
line 1244
;1244:			s = va( "%2i", s1 );
ADDRGP4 $609
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 64
INDIRP4
ASGNP4
line 1245
;1245:			w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH + 8;
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 68
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 8
ADDI4
ASGNI4
line 1246
;1246:			x -= w;
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 24
INDIRI4
SUBI4
ASGNI4
line 1247
;1247:			if ( !spectator && score == s1 ) {
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $688
ADDRLP4 44
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $688
line 1248
;1248:				color[0] = 0.0f;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1249
;1249:				color[1] = 0.1f;
ADDRLP4 0+4
CNSTF4 1036831949
ASGNF4
line 1250
;1250:				color[2] = 1.0f;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 1251
;1251:				color[3] = 0.33f;
ADDRLP4 0+12
CNSTF4 1051260355
ASGNF4
line 1252
;1252:				CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 1253
;1253:				CG_DrawPic( x, y-4, w, BIGCHAR_HEIGHT+8, cgs.media.selectShader );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRGP4 cgs+148692+244
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1254
;1254:			} else {
ADDRGP4 $689
JUMPV
LABELV $688
line 1255
;1255:				color[0] = 0.5f;
ADDRLP4 0
CNSTF4 1056964608
ASGNF4
line 1256
;1256:				color[1] = 0.5f;
ADDRLP4 0+4
CNSTF4 1056964608
ASGNF4
line 1257
;1257:				color[2] = 0.5f;
ADDRLP4 0+8
CNSTF4 1056964608
ASGNF4
line 1258
;1258:				color[3] = 0.33f;
ADDRLP4 0+12
CNSTF4 1051260355
ASGNF4
line 1259
;1259:				CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 1260
;1260:			}
LABELV $689
line 1261
;1261:			CG_DrawString( x0-4, y, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT );
ADDRLP4 28
INDIRI4
CNSTI4 4
SUBI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 17
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1262
;1262:		}
LABELV $686
line 1264
;1263:
;1264:		if ( cgs.fraglimit ) {
ADDRGP4 cgs+31492
INDIRI4
CNSTI4 0
EQI4 $698
line 1265
;1265:			s = va( "%2i", cgs.fraglimit );
ADDRGP4 $609
ARGP4
ADDRGP4 cgs+31492
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 64
INDIRP4
ASGNP4
line 1266
;1266:			CG_DrawString( x-4, y, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT );
ADDRLP4 16
INDIRI4
CNSTI4 4
SUBI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 17
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1267
;1267:		}
LABELV $698
line 1268
;1268:	}
LABELV $603
line 1270
;1269:
;1270:	return y1 - 8;
ADDRLP4 40
INDIRF4
CNSTF4 1090519040
SUBF4
RETF4
LABELV $599
endproc CG_DrawScores 76 32
data
align 4
LABELV $703
byte 4 1045220557
byte 4 1065353216
byte 4 1045220557
byte 4 1065353216
byte 4 1065353216
byte 4 1045220557
byte 4 1045220557
byte 4 1065353216
code
proc CG_DrawPowerups 200 20
line 1279
;1271:}
;1272:
;1273:
;1274:/*
;1275:================
;1276:CG_DrawPowerups
;1277:================
;1278:*/
;1279:static float CG_DrawPowerups( float y ) {
line 1296
;1280:	int		sorted[MAX_POWERUPS];
;1281:	int		sortedTime[MAX_POWERUPS];
;1282:	int		i, j, k;
;1283:	int		active;
;1284:	playerState_t	*ps;
;1285:	int		t;
;1286:	gitem_t	*item;
;1287:	int		x;
;1288:	int		color;
;1289:	float	size;
;1290:	float	f;
;1291:	static const float colors[2][4] = { 
;1292:		{ 0.2f, 1.0f, 0.2f, 1.0f },
;1293:		{ 1.0f, 0.2f, 0.2f, 1.0f } 
;1294:	};
;1295:
;1296:	ps = &cg.snap->ps;
ADDRLP4 148
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 1298
;1297:
;1298:	if ( ps->stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 148
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $705
line 1299
;1299:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $702
JUMPV
LABELV $705
line 1303
;1300:	}
;1301:
;1302:	// sort the list by time remaining
;1303:	active = 0;
ADDRLP4 136
CNSTI4 0
ASGNI4
line 1304
;1304:	for ( i = 0 ; i < MAX_POWERUPS ; i++ ) {
ADDRLP4 144
CNSTI4 0
ASGNI4
LABELV $707
line 1305
;1305:		if ( !ps->powerups[ i ] ) {
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 148
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $711
line 1306
;1306:			continue;
ADDRGP4 $708
JUMPV
LABELV $711
line 1308
;1307:		}
;1308:		t = ps->powerups[ i ] - cg.time;
ADDRLP4 140
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 148
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
SUBI4
ASGNI4
line 1311
;1309:		// ZOID--don't draw if the power up has unlimited time (999 seconds)
;1310:		// This is true of the CTF flags
;1311:		if ( t < 0 || t > 999000) {
ADDRLP4 140
INDIRI4
CNSTI4 0
LTI4 $716
ADDRLP4 140
INDIRI4
CNSTI4 999000
LEI4 $714
LABELV $716
line 1312
;1312:			continue;
ADDRGP4 $708
JUMPV
LABELV $714
line 1316
;1313:		}
;1314:
;1315:		// insert into the list
;1316:		for ( j = 0 ; j < active ; j++ ) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $720
JUMPV
LABELV $717
line 1317
;1317:			if ( sortedTime[j] >= t ) {
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ADDRLP4 140
INDIRI4
LTI4 $721
line 1318
;1318:				for ( k = active - 1 ; k >= j ; k-- ) {
ADDRLP4 0
ADDRLP4 136
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $726
JUMPV
LABELV $723
line 1319
;1319:					sorted[k+1] = sorted[k];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68+4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
ADDP4
INDIRI4
ASGNI4
line 1320
;1320:					sortedTime[k+1] = sortedTime[k];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4+4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ASGNI4
line 1321
;1321:				}
LABELV $724
line 1318
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $726
ADDRLP4 0
INDIRI4
ADDRLP4 132
INDIRI4
GEI4 $723
line 1322
;1322:				break;
ADDRGP4 $719
JUMPV
LABELV $721
line 1324
;1323:			}
;1324:		}
LABELV $718
line 1316
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $720
ADDRLP4 132
INDIRI4
ADDRLP4 136
INDIRI4
LTI4 $717
LABELV $719
line 1325
;1325:		sorted[j] = i;
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
ADDP4
ADDRLP4 144
INDIRI4
ASGNI4
line 1326
;1326:		sortedTime[j] = t;
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 140
INDIRI4
ASGNI4
line 1327
;1327:		active++;
ADDRLP4 136
ADDRLP4 136
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1328
;1328:	}
LABELV $708
line 1304
ADDRLP4 144
ADDRLP4 144
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 16
LTI4 $707
line 1331
;1329:
;1330:	// draw the icons and timers
;1331:	x = cgs.screenXmax + 1 - ICON_SIZE - CHAR_WIDTH * 2;
ADDRLP4 168
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1065353216
ADDF4
CNSTF4 1111490560
SUBF4
CNSTF4 1115684864
SUBF4
CVFI4 4
ASGNI4
line 1332
;1332:	for ( i = 0 ; i < active ; i++ ) {
ADDRLP4 144
CNSTI4 0
ASGNI4
ADDRGP4 $733
JUMPV
LABELV $730
line 1333
;1333:		item = BG_FindItemForPowerup( sorted[i] );
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
ADDP4
INDIRI4
ARGI4
ADDRLP4 172
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 152
ADDRLP4 172
INDIRP4
ASGNP4
line 1335
;1334:
;1335:		if ( item ) {
ADDRLP4 152
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $734
line 1337
;1336:
;1337:			color = 1;
ADDRLP4 164
CNSTI4 1
ASGNI4
line 1339
;1338:
;1339:			y -= ICON_SIZE;
ADDRFP4 0
ADDRFP4 0
INDIRF4
CNSTF4 1111490560
SUBF4
ASGNF4
line 1341
;1340:
;1341:			trap_R_SetColor( colors[color] );
ADDRLP4 164
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 $703
ADDP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1342
;1342:			CG_DrawField( x, y, 2, sortedTime[ i ] / 1000 );
ADDRLP4 168
INDIRI4
ARGI4
ADDRFP4 0
INDIRF4
CVFI4 4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
CNSTI4 1000
DIVI4
ARGI4
ADDRGP4 CG_DrawField
CALLV
pop
line 1344
;1343:
;1344:			t = ps->powerups[ sorted[i] ];
ADDRLP4 140
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 148
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1345
;1345:			if ( t - cg.time >= POWERUP_BLINKS * POWERUP_BLINK_TIME ) {
ADDRLP4 140
INDIRI4
ADDRGP4 cg+107604
INDIRI4
SUBI4
CNSTI4 5000
LTI4 $736
line 1346
;1346:				trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1347
;1347:			} else {
ADDRGP4 $737
JUMPV
LABELV $736
line 1350
;1348:				vec4_t	modulate;
;1349:
;1350:				f = (float)( t - cg.time ) / POWERUP_BLINK_TIME;
ADDRLP4 160
ADDRLP4 140
INDIRI4
ADDRGP4 cg+107604
INDIRI4
SUBI4
CVIF4 4
CNSTF4 981668463
MULF4
ASGNF4
line 1351
;1351:				f -= (int)f;
ADDRLP4 160
ADDRLP4 160
INDIRF4
ADDRLP4 160
INDIRF4
CVFI4 4
CVIF4 4
SUBF4
ASGNF4
line 1352
;1352:				modulate[0] = modulate[1] = modulate[2] = modulate[3] = f;
ADDRLP4 176+12
ADDRLP4 160
INDIRF4
ASGNF4
ADDRLP4 176+8
ADDRLP4 160
INDIRF4
ASGNF4
ADDRLP4 176+4
ADDRLP4 160
INDIRF4
ASGNF4
ADDRLP4 176
ADDRLP4 160
INDIRF4
ASGNF4
line 1353
;1353:				trap_R_SetColor( modulate );
ADDRLP4 176
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1354
;1354:			}
LABELV $737
line 1356
;1355:
;1356:			if ( cg.powerupActive == sorted[i] && 
ADDRGP4 cg+125480
INDIRI4
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
ADDP4
INDIRI4
NEI4 $743
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+125484
INDIRI4
SUBI4
CNSTI4 200
GEI4 $743
line 1357
;1357:				cg.time - cg.powerupTime < PULSE_TIME ) {
line 1358
;1358:				f = 1.0 - ( (float)( cg.time - cg.powerupTime ) / PULSE_TIME );
ADDRLP4 160
CNSTF4 1065353216
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+125484
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1000593162
MULF4
SUBF4
ASGNF4
line 1359
;1359:				size = ICON_SIZE * ( 1.0 + ( PULSE_SCALE - 1.0 ) * f );
ADDRLP4 156
ADDRLP4 160
INDIRF4
CNSTF4 1056964608
MULF4
CNSTF4 1065353216
ADDF4
CNSTF4 1111490560
MULF4
ASGNF4
line 1360
;1360:			} else {
ADDRGP4 $744
JUMPV
LABELV $743
line 1361
;1361:				size = ICON_SIZE;
ADDRLP4 156
CNSTF4 1111490560
ASGNF4
line 1362
;1362:			}
LABELV $744
line 1364
;1363:
;1364:			CG_DrawPic( cgs.screenXmax + 1 - size, y + ICON_SIZE / 2 - size / 2, 
ADDRLP4 152
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
ARGP4
ADDRLP4 176
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1065353216
ADDF4
ADDRLP4 156
INDIRF4
SUBF4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1103101952
ADDF4
ADDRLP4 156
INDIRF4
CNSTF4 1056964608
MULF4
SUBF4
ARGF4
ADDRLP4 156
INDIRF4
ARGF4
ADDRLP4 156
INDIRF4
ARGF4
ADDRLP4 176
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1366
;1365:				size, size, trap_R_RegisterShader( item->icon ) );
;1366:		} // if ( item )
LABELV $734
line 1367
;1367:	}
LABELV $731
line 1332
ADDRLP4 144
ADDRLP4 144
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $733
ADDRLP4 144
INDIRI4
ADDRLP4 136
INDIRI4
LTI4 $730
line 1368
;1368:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1370
;1369:
;1370:	return y;
ADDRFP4 0
INDIRF4
RETF4
LABELV $702
endproc CG_DrawPowerups 200 20
proc CG_DrawLowerRight 12 12
line 1380
;1371:}
;1372:
;1373:
;1374:/*
;1375:=====================
;1376:CG_DrawLowerRight
;1377:
;1378:=====================
;1379:*/
;1380:static void CG_DrawLowerRight( void ) {
line 1383
;1381:	float	y;
;1382:
;1383:	y = cgs.screenYmax + 1 - STATUSBAR_HEIGHT;
ADDRLP4 0
ADDRGP4 cgs+31464
INDIRF4
CNSTF4 1065353216
ADDF4
CNSTF4 1114636288
SUBF4
ASGNF4
line 1385
;1384:
;1385:	if ( cgs.gametype >= GT_TDM && cg_drawTeamOverlay.integer == 2 ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $753
ADDRGP4 cg_drawTeamOverlay+12
INDIRI4
CNSTI4 2
NEI4 $753
line 1386
;1386:		y = CG_DrawTeamOverlay( y, qtrue, qfalse );
ADDRLP4 0
INDIRF4
ARGF4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 CG_DrawTeamOverlay
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 1387
;1387:	} 
LABELV $753
line 1389
;1388:
;1389:	y = CG_DrawScores( y );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 CG_DrawScores
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 1390
;1390:	y = CG_DrawPowerups( y );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 CG_DrawPowerups
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
ASGNF4
line 1391
;1391:}
LABELV $751
endproc CG_DrawLowerRight 12 12
proc CG_DrawPickupItem 20 32
line 1399
;1392:
;1393:
;1394:/*
;1395:===================
;1396:CG_DrawPickupItem
;1397:===================
;1398:*/
;1399:static int CG_DrawPickupItem( int y ) {
line 1404
;1400:	int		value;
;1401:	float	*fadeColor;
;1402:	const char *text;
;1403:
;1404:	if ( cg.snap->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
GTI4 $758
line 1405
;1405:		return y;
ADDRFP4 0
INDIRI4
RETI4
ADDRGP4 $757
JUMPV
LABELV $758
line 1408
;1406:	}
;1407:
;1408:	y -= PICKUP_ICON_SIZE;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 32
SUBI4
ASGNI4
line 1410
;1409:
;1410:	value = cg.itemPickup;
ADDRLP4 0
ADDRGP4 cg+125768
INDIRI4
ASGNI4
line 1411
;1411:	if ( value ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $762
line 1412
;1412:		fadeColor = CG_FadeColorTime( cg.itemPickupTime, 3000, 250 );
ADDRGP4 cg+125776
INDIRI4
ARGI4
CNSTI4 3000
ARGI4
CNSTI4 250
ARGI4
ADDRLP4 12
ADDRGP4 CG_FadeColorTime
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 1413
;1413:		if ( fadeColor ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $765
line 1414
;1414:			CG_RegisterItemVisuals( value );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemVisuals
CALLV
pop
line 1415
;1415:			trap_R_SetColor( fadeColor );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1416
;1416:			CG_DrawPic( cgs.screenXmin + 8, y, PICKUP_ICON_SIZE, PICKUP_ICON_SIZE, cg_items[ value ].icon );
ADDRGP4 cgs+31452
INDIRF4
CNSTF4 1090519040
ADDF4
ARGF4
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1107296256
ARGF4
CNSTF4 1107296256
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 28
MULI4
ADDRGP4 cg_items+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1417
;1417:			if ( cg.itemPickupCount > 1 ) {
ADDRGP4 cg+125772
INDIRI4
CNSTI4 1
LEI4 $769
line 1418
;1418:				text = va( "%s x%i", bg_itemlist[ value ].pickup_name, cg.itemPickupCount );
ADDRGP4 $772
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 52
MULI4
ADDRGP4 bg_itemlist+28
ADDP4
INDIRP4
ARGP4
ADDRGP4 cg+125772
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 1419
;1419:			} else {
ADDRGP4 $770
JUMPV
LABELV $769
line 1420
;1420:				text = bg_itemlist[ value ].pickup_name;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 52
MULI4
ADDRGP4 bg_itemlist+28
ADDP4
INDIRP4
ASGNP4
line 1421
;1421:			}
LABELV $770
line 1423
;1422:
;1423:			CG_DrawString( cgs.screenXmin + PICKUP_ICON_SIZE + 16, y + (PICKUP_ICON_SIZE/2 - PICKUP_TEXT_SIZE/2), 
ADDRGP4 cgs+31452
INDIRF4
CNSTF4 1107296256
ADDF4
CNSTF4 1098907648
ADDF4
ARGF4
ADDRFP4 0
INDIRI4
CNSTI4 10
ADDI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 1094713344
ARGF4
CNSTF4 1094713344
ARGF4
CNSTI4 0
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1426
;1424:				text, fadeColor, PICKUP_TEXT_SIZE, PICKUP_TEXT_SIZE, 0, DS_SHADOW | DS_PROPORTIONAL );
;1425:			
;1426:			trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1427
;1427:		} else {
ADDRGP4 $766
JUMPV
LABELV $765
line 1428
;1428:			cg.itemPickupCount = 0;
ADDRGP4 cg+125772
CNSTI4 0
ASGNI4
line 1429
;1429:		}
LABELV $766
line 1430
;1430:	}
LABELV $762
line 1432
;1431:	
;1432:	return y;
ADDRFP4 0
INDIRI4
RETI4
LABELV $757
endproc CG_DrawPickupItem 20 32
proc CG_DrawLowerLeft 8 12
line 1441
;1433:}
;1434:
;1435:
;1436:/*
;1437:=====================
;1438:CG_DrawLowerLeft
;1439:=====================
;1440:*/
;1441:static void CG_DrawLowerLeft( void ) {
line 1444
;1442:	float	y;
;1443:
;1444:	y = cgs.screenYmax + 1 - STATUSBAR_HEIGHT;
ADDRLP4 0
ADDRGP4 cgs+31464
INDIRF4
CNSTF4 1065353216
ADDF4
CNSTF4 1114636288
SUBF4
ASGNF4
line 1446
;1445:
;1446:	if ( cgs.gametype >= GT_TDM && cg_drawTeamOverlay.integer == 3 ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $780
ADDRGP4 cg_drawTeamOverlay+12
INDIRI4
CNSTI4 3
NEI4 $780
line 1447
;1447:		y = CG_DrawTeamOverlay( y, qfalse, qfalse );
ADDRLP4 0
INDIRF4
ARGF4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 CG_DrawTeamOverlay
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 1448
;1448:	} 
LABELV $780
line 1450
;1449:
;1450:	y = CG_DrawPickupItem( y );
ADDRLP4 0
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 4
ADDRGP4 CG_DrawPickupItem
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
CVIF4 4
ASGNF4
line 1451
;1451:}
LABELV $778
endproc CG_DrawLowerLeft 8 12
proc CG_DrawTeamInfo 48 32
line 1461
;1452:
;1453:
;1454://===========================================================================================
;1455:
;1456:/*
;1457:=================
;1458:CG_DrawTeamInfo
;1459:=================
;1460:*/
;1461:static void CG_DrawTeamInfo( void ) {
line 1470
;1462:	int w, h;
;1463:	int i, len;
;1464:	vec4_t		hcolor;
;1465:	int		chatHeight;
;1466:
;1467:	#define CHATLOC_Y (cgs.screenYmax + 1 - STATUSBAR_HEIGHT ) // bottom end
;1468:	#define CHATLOC_X (cgs.screenXmin)
;1469:
;1470:	if (cg_teamChatHeight.integer < TEAMCHAT_HEIGHT)
ADDRGP4 cg_teamChatHeight+12
INDIRI4
CNSTI4 8
GEI4 $785
line 1471
;1471:		chatHeight = cg_teamChatHeight.integer;
ADDRLP4 8
ADDRGP4 cg_teamChatHeight+12
INDIRI4
ASGNI4
ADDRGP4 $786
JUMPV
LABELV $785
line 1473
;1472:	else
;1473:		chatHeight = TEAMCHAT_HEIGHT;
ADDRLP4 8
CNSTI4 8
ASGNI4
LABELV $786
line 1474
;1474:	if (chatHeight <= 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
GTI4 $789
line 1475
;1475:		return; // disabled
ADDRGP4 $784
JUMPV
LABELV $789
line 1477
;1476:
;1477:	if (cgs.teamLastChatPos != cgs.teamChatPos) {
ADDRGP4 cgs+148688
INDIRI4
ADDRGP4 cgs+148684
INDIRI4
EQI4 $791
line 1478
;1478:		if (cg.time - cgs.teamChatMsgTimes[cgs.teamLastChatPos % chatHeight] > cg_teamChatTime.integer) {
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cgs+148688
INDIRI4
ADDRLP4 8
INDIRI4
MODI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148652
ADDP4
INDIRI4
SUBI4
ADDRGP4 cg_teamChatTime+12
INDIRI4
LEI4 $795
line 1479
;1479:			cgs.teamLastChatPos++;
ADDRLP4 36
ADDRGP4 cgs+148688
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1480
;1480:		}
LABELV $795
line 1482
;1481:
;1482:		h = (cgs.teamChatPos - cgs.teamLastChatPos) * TINYCHAR_HEIGHT;
ADDRLP4 32
ADDRGP4 cgs+148684
INDIRI4
ADDRGP4 cgs+148688
INDIRI4
SUBI4
CNSTI4 3
LSHI4
ASGNI4
line 1484
;1483:
;1484:		w = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 1486
;1485:
;1486:		for (i = cgs.teamLastChatPos; i < cgs.teamChatPos; i++) {
ADDRLP4 0
ADDRGP4 cgs+148688
INDIRI4
ASGNI4
ADDRGP4 $807
JUMPV
LABELV $804
line 1487
;1487:			len = CG_DrawStrlen(cgs.teamChatMsgs[i % chatHeight]);
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
MODI4
CNSTI4 241
MULI4
ADDRGP4 cgs+146724
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 36
INDIRI4
ASGNI4
line 1488
;1488:			if (len > w)
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
LEI4 $811
line 1489
;1489:				w = len;
ADDRLP4 12
ADDRLP4 4
INDIRI4
ASGNI4
LABELV $811
line 1490
;1490:		}
LABELV $805
line 1486
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $807
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+148684
INDIRI4
LTI4 $804
line 1491
;1491:		w *= TINYCHAR_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
line 1492
;1492:		w += TINYCHAR_WIDTH * 2;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1494
;1493:
;1494:		if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $813
line 1495
;1495:			hcolor[0] = 1.0f;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
line 1496
;1496:			hcolor[1] = 0.0f;
ADDRLP4 16+4
CNSTF4 0
ASGNF4
line 1497
;1497:			hcolor[2] = 0.0f;
ADDRLP4 16+8
CNSTF4 0
ASGNF4
line 1498
;1498:			hcolor[3] = 0.33f;
ADDRLP4 16+12
CNSTF4 1051260355
ASGNF4
line 1499
;1499:		} else if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE ) {
ADDRGP4 $814
JUMPV
LABELV $813
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $819
line 1500
;1500:			hcolor[0] = 0.0f;
ADDRLP4 16
CNSTF4 0
ASGNF4
line 1501
;1501:			hcolor[1] = 0.0f;
ADDRLP4 16+4
CNSTF4 0
ASGNF4
line 1502
;1502:			hcolor[2] = 1.0f;
ADDRLP4 16+8
CNSTF4 1065353216
ASGNF4
line 1503
;1503:			hcolor[3] = 0.33f;
ADDRLP4 16+12
CNSTF4 1051260355
ASGNF4
line 1504
;1504:		} else {
ADDRGP4 $820
JUMPV
LABELV $819
line 1505
;1505:			hcolor[0] = 0.0f;
ADDRLP4 16
CNSTF4 0
ASGNF4
line 1506
;1506:			hcolor[1] = 1.0f;
ADDRLP4 16+4
CNSTF4 1065353216
ASGNF4
line 1507
;1507:			hcolor[2] = 0.0f;
ADDRLP4 16+8
CNSTF4 0
ASGNF4
line 1508
;1508:			hcolor[3] = 0.33f;
ADDRLP4 16+12
CNSTF4 1051260355
ASGNF4
line 1509
;1509:		}
LABELV $820
LABELV $814
line 1511
;1510:
;1511:		trap_R_SetColor( hcolor );
ADDRLP4 16
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1512
;1512:		CG_DrawPic( CHATLOC_X, CHATLOC_Y - h, w, h, cgs.media.teamStatusBar );
ADDRGP4 cgs+31452
INDIRF4
ARGF4
ADDRLP4 36
ADDRLP4 32
INDIRI4
CVIF4 4
ASGNF4
ADDRGP4 cgs+31464
INDIRF4
CNSTF4 1065353216
ADDF4
CNSTF4 1114636288
SUBF4
ADDRLP4 36
INDIRF4
SUBF4
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRGP4 cgs+148692+160
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1513
;1513:		trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1515
;1514:
;1515:		hcolor[0] = hcolor[1] = hcolor[2] = 1.0f;
ADDRLP4 40
CNSTF4 1065353216
ASGNF4
ADDRLP4 16+8
ADDRLP4 40
INDIRF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 40
INDIRF4
ASGNF4
ADDRLP4 16
ADDRLP4 40
INDIRF4
ASGNF4
line 1516
;1516:		hcolor[3] = 1.0f;
ADDRLP4 16+12
CNSTF4 1065353216
ASGNF4
line 1518
;1517:
;1518:		for ( i = cgs.teamChatPos - 1; i >= cgs.teamLastChatPos; i-- ) {
ADDRLP4 0
ADDRGP4 cgs+148684
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $838
JUMPV
LABELV $835
line 1519
;1519:			CG_DrawString( CHATLOC_X + TINYCHAR_WIDTH, CHATLOC_Y - (cgs.teamChatPos - i)*TINYCHAR_HEIGHT, 
ADDRGP4 cgs+31452
INDIRF4
CNSTF4 1090519040
ADDF4
ARGF4
ADDRGP4 cgs+31464
INDIRF4
CNSTF4 1065353216
ADDF4
CNSTF4 1114636288
SUBF4
ADDRGP4 cgs+148684
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 3
LSHI4
CVIF4 4
SUBF4
ARGF4
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
MODI4
CNSTI4 241
MULI4
ADDRGP4 cgs+146724
ADDP4
ARGP4
ADDRLP4 16
ARGP4
CNSTF4 1090519040
ARGF4
CNSTF4 1090519040
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1521
;1520:				cgs.teamChatMsgs[i % chatHeight], hcolor, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 0, DS_PROPORTIONAL );
;1521:		}
LABELV $836
line 1518
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $838
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+148688
INDIRI4
GEI4 $835
line 1522
;1522:	}
LABELV $791
line 1523
;1523:}
LABELV $784
endproc CG_DrawTeamInfo 48 32
proc CG_DrawHoldableItem 4 20
line 1531
;1524:
;1525:
;1526:/*
;1527:===================
;1528:CG_DrawHoldableItem
;1529:===================
;1530:*/
;1531:static void CG_DrawHoldableItem( void ) { 
line 1534
;1532:	int		value;
;1533:
;1534:	value = cg.snap->ps.stats[STAT_HOLDABLE_ITEM];
ADDRLP4 0
ADDRGP4 cg+36
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
ASGNI4
line 1535
;1535:	if ( value ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $847
line 1536
;1536:		CG_RegisterItemVisuals( value );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemVisuals
CALLV
pop
line 1537
;1537:		CG_DrawPic( cgs.screenXmax + 1 - ICON_SIZE, (SCREEN_HEIGHT-ICON_SIZE)/2, ICON_SIZE, ICON_SIZE, cg_items[ value ].icon );
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1065353216
ADDF4
CNSTF4 1111490560
SUBF4
ARGF4
CNSTF4 1129840640
ARGF4
CNSTF4 1111490560
ARGF4
CNSTF4 1111490560
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 28
MULI4
ADDRGP4 cg_items+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1538
;1538:	}
LABELV $847
line 1539
;1539:}
LABELV $845
endproc CG_DrawHoldableItem 4 20
proc CG_DrawPersistantPowerup 0 0
line 1547
;1540:
;1541:
;1542:/*
;1543:===================
;1544:CG_DrawPersistantPowerup
;1545:===================
;1546:*/
;1547:static void CG_DrawPersistantPowerup( void ) {
line 1557
;1548:#if 0 // sos001208 - DEAD
;1549:	int		value;
;1550:
;1551:	value = cg.snap->ps.stats[STAT_PERSISTANT_POWERUP];
;1552:	if ( value ) {
;1553:		CG_RegisterItemVisuals( value );
;1554:		CG_DrawPic( 640-ICON_SIZE, (SCREEN_HEIGHT-ICON_SIZE)/2 - ICON_SIZE, ICON_SIZE, ICON_SIZE, cg_items[ value ].icon );
;1555:	}
;1556:#endif
;1557:}
LABELV $851
endproc CG_DrawPersistantPowerup 0 0
proc CG_DrawReward 68 32
line 1565
;1558:
;1559:
;1560:/*
;1561:===================
;1562:CG_DrawReward
;1563:===================
;1564:*/
;1565:static void CG_DrawReward( void ) { 
line 1571
;1566:	float	*color;
;1567:	int		i, count;
;1568:	float	x, y;
;1569:	char	buf[32];
;1570:
;1571:	if ( !cg_drawRewards.integer ) {
ADDRGP4 cg_drawRewards+12
INDIRI4
CNSTI4 0
NEI4 $853
line 1572
;1572:		return;
ADDRGP4 $852
JUMPV
LABELV $853
line 1575
;1573:	}
;1574:
;1575:	color = CG_FadeColor( cg.rewardTime, REWARD_TIME );
ADDRGP4 cg+125536
INDIRI4
ARGI4
CNSTI4 3000
ARGI4
ADDRLP4 52
ADDRGP4 CG_FadeColor
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 52
INDIRP4
ASGNP4
line 1576
;1576:	if ( !color ) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $857
line 1577
;1577:		if (cg.rewardStack > 0) {
ADDRGP4 cg+125532
INDIRI4
CNSTI4 0
LEI4 $852
line 1578
;1578:			for(i = 0; i < cg.rewardStack; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $865
JUMPV
LABELV $862
line 1579
;1579:				cg.rewardSound[i] = cg.rewardSound[i+1];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+125620
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+125620+4
ADDP4
INDIRI4
ASGNI4
line 1580
;1580:				cg.rewardShader[i] = cg.rewardShader[i+1];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+125580
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+125580+4
ADDP4
INDIRI4
ASGNI4
line 1581
;1581:				cg.rewardCount[i] = cg.rewardCount[i+1];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+125540
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+125540+4
ADDP4
INDIRI4
ASGNI4
line 1582
;1582:			}
LABELV $863
line 1578
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $865
ADDRLP4 0
INDIRI4
ADDRGP4 cg+125532
INDIRI4
LTI4 $862
line 1583
;1583:			cg.rewardTime = cg.time;
ADDRGP4 cg+125536
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1584
;1584:			cg.rewardStack--;
ADDRLP4 56
ADDRGP4 cg+125532
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1585
;1585:			color = CG_FadeColor( cg.rewardTime, REWARD_TIME );
ADDRGP4 cg+125536
INDIRI4
ARGI4
CNSTI4 3000
ARGI4
ADDRLP4 60
ADDRGP4 CG_FadeColor
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 60
INDIRP4
ASGNP4
line 1586
;1586:			trap_S_StartLocalSound(cg.rewardSound[0], CHAN_ANNOUNCER);
ADDRGP4 cg+125620
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 1587
;1587:		} else {
line 1588
;1588:			return;
LABELV $860
line 1590
;1589:		}
;1590:	}
LABELV $857
line 1592
;1591:
;1592:	trap_R_SetColor( color );
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1609
;1593:
;1594:	/*
;1595:	count = cg.rewardCount[0]/10;				// number of big rewards to draw
;1596:
;1597:	if (count) {
;1598:		y = 4;
;1599:		x = 320 - count * ICON_SIZE;
;1600:		for ( i = 0 ; i < count ; i++ ) {
;1601:			CG_DrawPic( x, y, (ICON_SIZE*2)-4, (ICON_SIZE*2)-4, cg.rewardShader[0] );
;1602:			x += (ICON_SIZE*2);
;1603:		}
;1604:	}
;1605:
;1606:	count = cg.rewardCount[0] - count*10;		// number of small rewards to draw
;1607:	*/
;1608:
;1609:	if ( cg.rewardCount[0] >= 10 ) {
ADDRGP4 cg+125540
INDIRI4
CNSTI4 10
LTI4 $881
line 1610
;1610:		y = 56; // FIXME: cgs.screenYmin + 56?
ADDRLP4 8
CNSTF4 1113587712
ASGNF4
line 1611
;1611:		x = 320 - ICON_SIZE/2;
ADDRLP4 4
CNSTF4 1133772800
ASGNF4
line 1612
;1612:		CG_DrawPic( x, y, ICON_SIZE-4, ICON_SIZE-4, cg.rewardShader[0] );
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
CNSTF4 1110441984
ARGF4
CNSTF4 1110441984
ARGF4
ADDRGP4 cg+125580
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1613
;1613:		Com_sprintf( buf, sizeof( buf ), "%d", cg.rewardCount[0] );
ADDRLP4 20
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $885
ARGP4
ADDRGP4 cg+125540
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1614
;1614:		CG_DrawString( 320, y + ICON_SIZE, buf, color, SMALLCHAR_WIDTH, SMALLCHAR_HEIGHT, 0, DS_SHADOW | DS_CENTER );
CNSTF4 1134559232
ARGF4
ADDRLP4 8
INDIRF4
CNSTF4 1111490560
ADDF4
ARGF4
ADDRLP4 20
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTF4 1090519040
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 9
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1615
;1615:	}
ADDRGP4 $882
JUMPV
LABELV $881
line 1616
;1616:	else {
line 1618
;1617:
;1618:		count = cg.rewardCount[0];
ADDRLP4 12
ADDRGP4 cg+125540
INDIRI4
ASGNI4
line 1620
;1619:
;1620:		y = 56; // FIXME: cgs.screenYmin + 56?
ADDRLP4 8
CNSTF4 1113587712
ASGNF4
line 1621
;1621:		x = 320 - count * ICON_SIZE/2;
ADDRLP4 4
CNSTI4 320
ADDRLP4 12
INDIRI4
CNSTI4 48
MULI4
CNSTI4 2
DIVI4
SUBI4
CVIF4 4
ASGNF4
line 1622
;1622:		for ( i = 0 ; i < count ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $891
JUMPV
LABELV $888
line 1623
;1623:			CG_DrawPic( x, y, ICON_SIZE-4, ICON_SIZE-4, cg.rewardShader[0] );
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
CNSTF4 1110441984
ARGF4
CNSTF4 1110441984
ARGF4
ADDRGP4 cg+125580
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1624
;1624:			x += ICON_SIZE;
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1111490560
ADDF4
ASGNF4
line 1625
;1625:		}
LABELV $889
line 1622
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $891
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
LTI4 $888
line 1626
;1626:	}
LABELV $882
line 1627
;1627:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1628
;1628:}
LABELV $852
endproc CG_DrawReward 68 32
export CG_AddLagometerFrameInfo
proc CG_AddLagometerFrameInfo 8 0
line 1659
;1629:
;1630:
;1631:/*
;1632:===============================================================================
;1633:
;1634:LAGOMETER
;1635:
;1636:===============================================================================
;1637:*/
;1638:
;1639:#define	LAG_SAMPLES		128
;1640:
;1641:
;1642:typedef struct {
;1643:	int		frameSamples[LAG_SAMPLES];
;1644:	int		frameCount;
;1645:	int		snapshotFlags[LAG_SAMPLES];
;1646:	int		snapshotSamples[LAG_SAMPLES];
;1647:	int		snapshotCount;
;1648:} lagometer_t;
;1649:
;1650:lagometer_t		lagometer;
;1651:
;1652:/*
;1653:==============
;1654:CG_AddLagometerFrameInfo
;1655:
;1656:Adds the current interpolate / extrapolate bar for this frame
;1657:==============
;1658:*/
;1659:void CG_AddLagometerFrameInfo( void ) {
line 1662
;1660:	int			offset;
;1661:
;1662:	offset = cg.time - cg.latestSnapshotTime;
ADDRLP4 0
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+32
INDIRI4
SUBI4
ASGNI4
line 1663
;1663:	lagometer.frameSamples[ lagometer.frameCount & ( LAG_SAMPLES - 1) ] = offset;
ADDRGP4 lagometer+512
INDIRI4
CNSTI4 127
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1664
;1664:	lagometer.frameCount++;
ADDRLP4 4
ADDRGP4 lagometer+512
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1665
;1665:}
LABELV $894
endproc CG_AddLagometerFrameInfo 8 0
export CG_AddLagometerSnapshotInfo
proc CG_AddLagometerSnapshotInfo 4 0
line 1678
;1666:
;1667:
;1668:/*
;1669:==============
;1670:CG_AddLagometerSnapshotInfo
;1671:
;1672:Each time a snapshot is received, log its ping time and
;1673:the number of snapshots that were dropped before it.
;1674:
;1675:Pass NULL for a dropped packet.
;1676:==============
;1677:*/
;1678:void CG_AddLagometerSnapshotInfo( snapshot_t *snap ) {
line 1680
;1679:	// dropped packet
;1680:	if ( !snap ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $900
line 1681
;1681:		lagometer.snapshotSamples[ lagometer.snapshotCount & ( LAG_SAMPLES - 1) ] = -1;
ADDRGP4 lagometer+1540
INDIRI4
CNSTI4 127
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer+1028
ADDP4
CNSTI4 -1
ASGNI4
line 1682
;1682:		lagometer.snapshotCount++;
ADDRLP4 0
ADDRGP4 lagometer+1540
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1683
;1683:		return;
ADDRGP4 $899
JUMPV
LABELV $900
line 1687
;1684:	}
;1685:
;1686:	// add this snapshot's info
;1687:	lagometer.snapshotSamples[ lagometer.snapshotCount & ( LAG_SAMPLES - 1) ] = snap->ping;
ADDRGP4 lagometer+1540
INDIRI4
CNSTI4 127
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer+1028
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1688
;1688:	lagometer.snapshotFlags[ lagometer.snapshotCount & ( LAG_SAMPLES - 1) ] = snap->snapFlags;
ADDRGP4 lagometer+1540
INDIRI4
CNSTI4 127
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer+516
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1689
;1689:	lagometer.snapshotCount++;
ADDRLP4 0
ADDRGP4 lagometer+1540
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1690
;1690:}
LABELV $899
endproc CG_AddLagometerSnapshotInfo 4 0
proc CG_DrawDisconnect 52 32
line 1700
;1691:
;1692:
;1693:/*
;1694:==============
;1695:CG_DrawDisconnect
;1696:
;1697:Should we draw something differnet for long lag vs no packets?
;1698:==============
;1699:*/
;1700:static void CG_DrawDisconnect( void ) {
line 1707
;1701:	float		x, y;
;1702:	int			cmdNum;
;1703:	usercmd_t	cmd;
;1704:	const char	*s;
;1705:
;1706:	// draw the phone jack if we are completely past our buffers
;1707:	cmdNum = trap_GetCurrentCmdNumber() - CMD_BACKUP + 1;
ADDRLP4 40
ADDRGP4 trap_GetCurrentCmdNumber
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 40
INDIRI4
CNSTI4 64
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 1708
;1708:	trap_GetUserCmd( cmdNum, &cmd );
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_GetUserCmd
CALLI4
pop
line 1709
;1709:	if ( cmd.serverTime <= cg.snap->ps.commandTime
ADDRLP4 44
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
LEI4 $915
ADDRLP4 44
INDIRI4
ADDRGP4 cg+107604
INDIRI4
LEI4 $911
LABELV $915
line 1710
;1710:		|| cmd.serverTime > cg.time ) {	// special check for map_restart // bk 0102165 - FIXME
line 1711
;1711:		return;
ADDRGP4 $910
JUMPV
LABELV $911
line 1715
;1712:	}
;1713:
;1714:	// also add text in center of screen
;1715:	s = "Connection Interrupted";
ADDRLP4 36
ADDRGP4 $916
ASGNP4
line 1716
;1716:	CG_DrawString( 320, cgs.screenYmin + 100, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_PROPORTIONAL | DS_CENTER );
CNSTF4 1134559232
ARGF4
ADDRGP4 cgs+31460
INDIRF4
CNSTF4 1120403456
ADDF4
ARGF4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 13
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1719
;1717:
;1718:	// blink the icon
;1719:	if ( ( cg.time >> 9 ) & 1 ) {
ADDRGP4 cg+107604
INDIRI4
CNSTI4 9
RSHI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $918
line 1720
;1720:		return;
ADDRGP4 $910
JUMPV
LABELV $918
line 1723
;1721:	}
;1722:
;1723:	x = cgs.screenXmax + 1 - 48;
ADDRLP4 24
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1065353216
ADDF4
CNSTF4 1111490560
SUBF4
ASGNF4
line 1724
;1724:	y = cgs.screenYmax + 1 - 48;
ADDRLP4 28
ADDRGP4 cgs+31464
INDIRF4
CNSTF4 1065353216
ADDF4
CNSTF4 1111490560
SUBF4
ASGNF4
line 1726
;1725:
;1726:	CG_DrawPic( x, y, 48, 48, trap_R_RegisterShader( "gfx/2d/net.tga" ) );
ADDRGP4 $923
ARGP4
ADDRLP4 48
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
CNSTF4 1111490560
ARGF4
CNSTF4 1111490560
ARGF4
ADDRLP4 48
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1727
;1727:}
LABELV $910
endproc CG_DrawDisconnect 52 32
proc CG_DrawLagometer 56 36
line 1738
;1728:
;1729:
;1730:#define	MAX_LAGOMETER_PING	900
;1731:#define	MAX_LAGOMETER_RANGE	300
;1732:
;1733:/*
;1734:==============
;1735:CG_DrawLagometer
;1736:==============
;1737:*/
;1738:static void CG_DrawLagometer( void ) {
line 1745
;1739:	int		a, x, y, i;
;1740:	float	v;
;1741:	float	ax, ay, aw, ah, mid, range;
;1742:	int		color;
;1743:	float	vscale;
;1744:
;1745:	if ( !cg_lagometer.integer || cgs.localServer ) {
ADDRGP4 cg_lagometer+12
INDIRI4
CNSTI4 0
EQI4 $929
ADDRGP4 cgs+31476
INDIRI4
CNSTI4 0
EQI4 $925
LABELV $929
line 1746
;1746:		CG_DrawDisconnect();
ADDRGP4 CG_DrawDisconnect
CALLV
pop
line 1747
;1747:		return;
ADDRGP4 $924
JUMPV
LABELV $925
line 1753
;1748:	}
;1749:
;1750:	//
;1751:	// draw the graph
;1752:	//
;1753:	x = cgs.screenXmax + 1 - 48;
ADDRLP4 48
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1065353216
ADDF4
CNSTF4 1111490560
SUBF4
CVFI4 4
ASGNI4
line 1754
;1754:	y = cgs.screenYmax + 1 - 48;
ADDRLP4 44
ADDRGP4 cgs+31464
INDIRF4
CNSTF4 1065353216
ADDF4
CNSTF4 1111490560
SUBF4
CVFI4 4
ASGNI4
line 1756
;1755:
;1756:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1757
;1757:	CG_DrawPic( x, y, 48, 48, cgs.media.lagometerShader );
ADDRLP4 48
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 44
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1111490560
ARGF4
CNSTF4 1111490560
ARGF4
ADDRGP4 cgs+148692+296
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1759
;1758:
;1759:	ax = x;
ADDRLP4 24
ADDRLP4 48
INDIRI4
CVIF4 4
ASGNF4
line 1760
;1760:	ay = y;
ADDRLP4 36
ADDRLP4 44
INDIRI4
CVIF4 4
ASGNF4
line 1761
;1761:	aw = 48;
ADDRLP4 12
CNSTF4 1111490560
ASGNF4
line 1762
;1762:	ah = 48;
ADDRLP4 32
CNSTF4 1111490560
ASGNF4
line 1763
;1763:	CG_AdjustFrom640( &ax, &ay, &aw, &ah );
ADDRLP4 24
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 32
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 1765
;1764:
;1765:	color = -1;
ADDRLP4 20
CNSTI4 -1
ASGNI4
line 1766
;1766:	range = ah / 3;
ADDRLP4 16
ADDRLP4 32
INDIRF4
CNSTF4 1051372203
MULF4
ASGNF4
line 1767
;1767:	mid = ay + range;
ADDRLP4 40
ADDRLP4 36
INDIRF4
ADDRLP4 16
INDIRF4
ADDF4
ASGNF4
line 1769
;1768:
;1769:	vscale = range / MAX_LAGOMETER_RANGE;
ADDRLP4 28
ADDRLP4 16
INDIRF4
CNSTF4 995783694
MULF4
ASGNF4
line 1772
;1770:
;1771:	// draw the frame interpoalte / extrapolate graph
;1772:	for ( a = 0 ; a < aw ; a++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $937
JUMPV
LABELV $934
line 1773
;1773:		i = ( lagometer.frameCount - 1 - a ) & (LAG_SAMPLES - 1);
ADDRLP4 8
ADDRGP4 lagometer+512
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 4
INDIRI4
SUBI4
CNSTI4 127
BANDI4
ASGNI4
line 1774
;1774:		v = lagometer.frameSamples[i];
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1775
;1775:		v *= vscale;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 1776
;1776:		if ( v > 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $939
line 1777
;1777:			if ( color != 1 ) {
ADDRLP4 20
INDIRI4
CNSTI4 1
EQI4 $941
line 1778
;1778:				color = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 1779
;1779:				trap_R_SetColor( g_color_table[ColorIndex(COLOR_YELLOW)] );
ADDRGP4 g_color_table+48
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1780
;1780:			}
LABELV $941
line 1781
;1781:			if ( v > range ) {
ADDRLP4 0
INDIRF4
ADDRLP4 16
INDIRF4
LEF4 $944
line 1782
;1782:				v = range;
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 1783
;1783:			}
LABELV $944
line 1784
;1784:			trap_R_DrawStretchPic ( ax + aw - a, mid - v, 1, v, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRLP4 24
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ADDRLP4 4
INDIRI4
CVIF4 4
SUBF4
ARGF4
ADDRLP4 40
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 0
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
ADDRGP4 cgs+148692+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1785
;1785:		} else if ( v < 0 ) {
ADDRGP4 $940
JUMPV
LABELV $939
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $948
line 1786
;1786:			if ( color != 2 ) {
ADDRLP4 20
INDIRI4
CNSTI4 2
EQI4 $950
line 1787
;1787:				color = 2;
ADDRLP4 20
CNSTI4 2
ASGNI4
line 1788
;1788:				trap_R_SetColor( g_color_table[ColorIndex(COLOR_BLUE)] );
ADDRGP4 g_color_table+64
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1789
;1789:			}
LABELV $950
line 1790
;1790:			v = -v;
ADDRLP4 0
ADDRLP4 0
INDIRF4
NEGF4
ASGNF4
line 1791
;1791:			if ( v > range ) {
ADDRLP4 0
INDIRF4
ADDRLP4 16
INDIRF4
LEF4 $953
line 1792
;1792:				v = range;
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 1793
;1793:			}
LABELV $953
line 1794
;1794:			trap_R_DrawStretchPic( ax + aw - a, mid, 1, v, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRLP4 24
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ADDRLP4 4
INDIRI4
CVIF4 4
SUBF4
ARGF4
ADDRLP4 40
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 0
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
ADDRGP4 cgs+148692+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1795
;1795:		}
LABELV $948
LABELV $940
line 1796
;1796:	}
LABELV $935
line 1772
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $937
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRLP4 12
INDIRF4
LTF4 $934
line 1799
;1797:
;1798:	// draw the snapshot latency / drop graph
;1799:	range = ah / 2;
ADDRLP4 16
ADDRLP4 32
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 1800
;1800:	vscale = range / MAX_LAGOMETER_PING;
ADDRLP4 28
ADDRLP4 16
INDIRF4
CNSTF4 982622900
MULF4
ASGNF4
line 1802
;1801:
;1802:	for ( a = 0 ; a < aw ; a++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $960
JUMPV
LABELV $957
line 1803
;1803:		i = ( lagometer.snapshotCount - 1 - a ) & (LAG_SAMPLES - 1);
ADDRLP4 8
ADDRGP4 lagometer+1540
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 4
INDIRI4
SUBI4
CNSTI4 127
BANDI4
ASGNI4
line 1804
;1804:		v = lagometer.snapshotSamples[i];
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer+1028
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1805
;1805:		if ( v > 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $963
line 1806
;1806:			if ( lagometer.snapshotFlags[i] & SNAPFLAG_RATE_DELAYED ) {
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer+516
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $965
line 1807
;1807:				if ( color != 5 ) {
ADDRLP4 20
INDIRI4
CNSTI4 5
EQI4 $966
line 1808
;1808:					color = 5;	// YELLOW for rate delay
ADDRLP4 20
CNSTI4 5
ASGNI4
line 1809
;1809:					trap_R_SetColor( g_color_table[ColorIndex(COLOR_YELLOW)] );
ADDRGP4 g_color_table+48
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1810
;1810:				}
line 1811
;1811:			} else {
ADDRGP4 $966
JUMPV
LABELV $965
line 1812
;1812:				if ( color != 3 ) {
ADDRLP4 20
INDIRI4
CNSTI4 3
EQI4 $971
line 1813
;1813:					color = 3;
ADDRLP4 20
CNSTI4 3
ASGNI4
line 1814
;1814:					trap_R_SetColor( g_color_table[ColorIndex(COLOR_GREEN)] );
ADDRGP4 g_color_table+32
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1815
;1815:				}
LABELV $971
line 1816
;1816:			}
LABELV $966
line 1817
;1817:			v = v * vscale;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 1818
;1818:			if ( v > range ) {
ADDRLP4 0
INDIRF4
ADDRLP4 16
INDIRF4
LEF4 $974
line 1819
;1819:				v = range;
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 1820
;1820:			}
LABELV $974
line 1821
;1821:			trap_R_DrawStretchPic( ax + aw - a, ay + ah - v, 1, v, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRLP4 24
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ADDRLP4 4
INDIRI4
CVIF4 4
SUBF4
ARGF4
ADDRLP4 36
INDIRF4
ADDRLP4 32
INDIRF4
ADDF4
ADDRLP4 0
INDIRF4
SUBF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 0
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
ADDRGP4 cgs+148692+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1822
;1822:		} else if ( v < 0 ) {
ADDRGP4 $964
JUMPV
LABELV $963
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $978
line 1823
;1823:			if ( color != 4 ) {
ADDRLP4 20
INDIRI4
CNSTI4 4
EQI4 $980
line 1824
;1824:				color = 4;		// RED for dropped snapshots
ADDRLP4 20
CNSTI4 4
ASGNI4
line 1825
;1825:				trap_R_SetColor( g_color_table[ColorIndex(COLOR_RED)] );
ADDRGP4 g_color_table+16
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1826
;1826:			}
LABELV $980
line 1827
;1827:			trap_R_DrawStretchPic( ax + aw - a, ay + ah - range, 1, range, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRLP4 24
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ADDRLP4 4
INDIRI4
CVIF4 4
SUBF4
ARGF4
ADDRLP4 36
INDIRF4
ADDRLP4 32
INDIRF4
ADDF4
ADDRLP4 16
INDIRF4
SUBF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 16
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
ADDRGP4 cgs+148692+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1828
;1828:		}
LABELV $978
LABELV $964
line 1829
;1829:	}
LABELV $958
line 1802
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $960
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRLP4 12
INDIRF4
LTF4 $957
line 1831
;1830:
;1831:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1833
;1832:
;1833:	if ( cg_nopredict.integer || cgs.synchronousClients ) {
ADDRGP4 cg_nopredict+12
INDIRI4
CNSTI4 0
NEI4 $989
ADDRGP4 cgs+149904
INDIRI4
CNSTI4 0
EQI4 $985
LABELV $989
line 1834
;1834:		CG_DrawString( cgs.screenXmax-1, y, "snc", colorWhite, 5, 10, 0, DS_PROPORTIONAL | DS_RIGHT );
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1065353216
SUBF4
ARGF4
ADDRLP4 44
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 $991
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1084227584
ARGF4
CNSTF4 1092616192
ARGF4
CNSTI4 0
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1835
;1835:	}
LABELV $985
line 1837
;1836:
;1837:	if ( !cg.demoPlayback ) {
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
NEI4 $992
line 1838
;1838:		CG_DrawString( x+1, y, va( "%ims", cg.meanPing ), colorWhite, 5, 10, 0, DS_PROPORTIONAL );
ADDRGP4 $995
ARGP4
ADDRGP4 cg+157004
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 48
INDIRI4
CNSTI4 1
ADDI4
CVIF4 4
ARGF4
ADDRLP4 44
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1084227584
ARGF4
CNSTF4 1092616192
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1839
;1839:	}
LABELV $992
line 1841
;1840:
;1841:	CG_DrawDisconnect();
ADDRGP4 CG_DrawDisconnect
CALLV
pop
line 1842
;1842:}
LABELV $924
endproc CG_DrawLagometer 56 36
export CG_CenterPrint
proc CG_CenterPrint 8 12
line 1863
;1843:
;1844:
;1845:
;1846:/*
;1847:===============================================================================
;1848:
;1849:CENTER PRINTING
;1850:
;1851:===============================================================================
;1852:*/
;1853:
;1854:
;1855:/*
;1856:==============
;1857:CG_CenterPrint
;1858:
;1859:Called for important messages that should stay in the center of the screen
;1860:for a few moments
;1861:==============
;1862:*/
;1863:void CG_CenterPrint( const char *str, int y, int charWidth ) {
line 1866
;1864:	char	*s;
;1865:
;1866:	Q_strncpyz( cg.centerPrint, str, sizeof(cg.centerPrint) );
ADDRGP4 cg+124436
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1868
;1867:
;1868:	cg.centerPrintTime = cg.time;
ADDRGP4 cg+124424
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1869
;1869:	cg.centerPrintY = y;
ADDRGP4 cg+124432
ADDRFP4 4
INDIRI4
ASGNI4
line 1870
;1870:	cg.centerPrintCharWidth = charWidth;
ADDRGP4 cg+124428
ADDRFP4 8
INDIRI4
ASGNI4
line 1873
;1871:
;1872:	// count the number of lines for centering
;1873:	cg.centerPrintLines = 1;
ADDRGP4 cg+125460
CNSTI4 1
ASGNI4
line 1874
;1874:	s = cg.centerPrint;
ADDRLP4 0
ADDRGP4 cg+124436
ASGNP4
ADDRGP4 $1007
JUMPV
LABELV $1006
line 1875
;1875:	while( *s ) {
line 1876
;1876:		if (*s == '\n')
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 10
NEI4 $1009
line 1877
;1877:			cg.centerPrintLines++;
ADDRLP4 4
ADDRGP4 cg+125460
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1009
line 1878
;1878:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1879
;1879:	}
LABELV $1007
line 1875
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1006
line 1880
;1880:}
LABELV $997
endproc CG_CenterPrint 8 12
proc CG_DrawCenterString 1052 32
line 1888
;1881:
;1882:
;1883:/*
;1884:===================
;1885:CG_DrawCenterString
;1886:===================
;1887:*/
;1888:static void CG_DrawCenterString( void ) {
line 1897
;1889:	char	*start;
;1890:	int		l;
;1891:	int		y;
;1892:#ifdef SUI // bk010221 - unused else
;1893:  int h;
;1894:#endif //SUI
;1895:	float	*color;
;1896:
;1897:	if ( !cg.centerPrintTime ) {
ADDRGP4 cg+124424
INDIRI4
CNSTI4 0
NEI4 $1013
line 1898
;1898:		return;
ADDRGP4 $1012
JUMPV
LABELV $1013
line 1901
;1899:	}
;1900:
;1901:	color = CG_FadeColor( cg.centerPrintTime, 1000 * cg_centertime.value );
ADDRGP4 cg+124424
INDIRI4
ARGI4
ADDRGP4 cg_centertime+8
INDIRF4
CNSTF4 1148846080
MULF4
CVFI4 4
ARGI4
ADDRLP4 16
ADDRGP4 CG_FadeColor
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 16
INDIRP4
ASGNP4
line 1902
;1902:	if ( !color ) {
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1018
line 1903
;1903:		return;
ADDRGP4 $1012
JUMPV
LABELV $1018
line 1906
;1904:	}
;1905:
;1906:	trap_R_SetColor( color );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1908
;1907:
;1908:	start = cg.centerPrint;
ADDRLP4 0
ADDRGP4 cg+124436
ASGNP4
line 1910
;1909:
;1910:	y = cg.centerPrintY - cg.centerPrintLines * BIGCHAR_HEIGHT / 2;
ADDRLP4 8
ADDRGP4 cg+124432
INDIRI4
ADDRGP4 cg+125460
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
ADDRGP4 $1024
JUMPV
LABELV $1023
line 1912
;1911:
;1912:	while ( 1 ) {
line 1915
;1913:		char linebuffer[1024];
;1914:
;1915:		for ( l = 0; l < 50; l++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $1026
line 1916
;1916:			if ( !start[l] || start[l] == '\n' ) {
ADDRLP4 1044
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $1032
ADDRLP4 1044
INDIRI4
CNSTI4 10
NEI4 $1030
LABELV $1032
line 1917
;1917:				break;
ADDRGP4 $1028
JUMPV
LABELV $1030
line 1919
;1918:			}
;1919:			linebuffer[l] = start[l];
ADDRLP4 4
INDIRI4
ADDRLP4 20
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 1920
;1920:		}
LABELV $1027
line 1915
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 50
LTI4 $1026
LABELV $1028
line 1921
;1921:		linebuffer[l] = 0;
ADDRLP4 4
INDIRI4
ADDRLP4 20
ADDP4
CNSTI1 0
ASGNI1
line 1930
;1922:
;1923:#ifdef SUI
;1924:		w = CG_Text_Width(linebuffer, 0.5, 0);
;1925:		h = CG_Text_Height(linebuffer, 0.5, 0);
;1926:		x = (SCREEN_WIDTH - w) / 2;
;1927:		CG_Text_Paint(x, y + h, 0.5, color, linebuffer, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
;1928:		y += h + 6;
;1929:#else //SUI
;1930:		CG_DrawString( 320, y, linebuffer, color, cg.centerPrintCharWidth, cg.centerPrintCharWidth * 1.5, 0, DS_SHADOW | DS_CENTER | DS_PROPORTIONAL );
CNSTF4 1134559232
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 cg+124428
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cg+124428
INDIRI4
CVIF4 4
CNSTF4 1069547520
MULF4
ARGF4
CNSTI4 0
ARGI4
CNSTI4 13
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1932
;1931:
;1932:		y += cg.centerPrintCharWidth * 1.5;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CVIF4 4
ADDRGP4 cg+124428
INDIRI4
CVIF4 4
CNSTF4 1069547520
MULF4
ADDF4
CVFI4 4
ASGNI4
ADDRGP4 $1037
JUMPV
LABELV $1036
line 1934
;1933:#endif //SUI
;1934:		while ( *start && ( *start != '\n' ) ) {
line 1935
;1935:			start++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1936
;1936:		}
LABELV $1037
line 1934
ADDRLP4 1044
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $1039
ADDRLP4 1044
INDIRI4
CNSTI4 10
NEI4 $1036
LABELV $1039
line 1937
;1937:		if ( !*start ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1040
line 1938
;1938:			break;
ADDRGP4 $1025
JUMPV
LABELV $1040
line 1940
;1939:		}
;1940:		start++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1941
;1941:	}
LABELV $1024
line 1912
ADDRGP4 $1023
JUMPV
LABELV $1025
line 1943
;1942:
;1943:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1944
;1944:}
LABELV $1012
endproc CG_DrawCenterString 1052 32
proc CG_DrawCrosshair 44 36
line 1962
;1945:
;1946:
;1947:
;1948:/*
;1949:================================================================================
;1950:
;1951:CROSSHAIR
;1952:
;1953:================================================================================
;1954:*/
;1955:
;1956:
;1957:/*
;1958:=================
;1959:CG_DrawCrosshair
;1960:=================
;1961:*/
;1962:static void CG_DrawCrosshair( void ) {
line 1969
;1963:	float		w, h;
;1964:	qhandle_t	hShader;
;1965:	float		f;
;1966:	float		x, y;
;1967:	int			ca;
;1968:
;1969:	if ( !cg_drawCrosshair.integer ) {
ADDRGP4 cg_drawCrosshair+12
INDIRI4
CNSTI4 0
NEI4 $1043
line 1970
;1970:		return;
ADDRGP4 $1042
JUMPV
LABELV $1043
line 1973
;1971:	}
;1972:
;1973:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1046
line 1974
;1974:		return;
ADDRGP4 $1042
JUMPV
LABELV $1046
line 1977
;1975:	}
;1976:
;1977:	if ( cg.renderingThirdPerson ) {
ADDRGP4 cg+107628
INDIRI4
CNSTI4 0
EQI4 $1049
line 1978
;1978:		return;
ADDRGP4 $1042
JUMPV
LABELV $1049
line 1982
;1979:	}
;1980:
;1981:	// set color based on health
;1982:	if ( cg_crosshairHealth.integer ) {
ADDRGP4 cg_crosshairHealth+12
INDIRI4
CNSTI4 0
EQI4 $1052
line 1985
;1983:		vec4_t		hcolor;
;1984:
;1985:		CG_ColorForHealth( hcolor );
ADDRLP4 28
ARGP4
ADDRGP4 CG_ColorForHealth
CALLV
pop
line 1986
;1986:		trap_R_SetColor( hcolor );
ADDRLP4 28
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1987
;1987:	} else {
ADDRGP4 $1053
JUMPV
LABELV $1052
line 1988
;1988:		trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1989
;1989:	}
LABELV $1053
line 1991
;1990:
;1991:	w = h = cg_crosshairSize.value;
ADDRLP4 28
ADDRGP4 cg_crosshairSize+8
INDIRF4
ASGNF4
ADDRLP4 4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 28
INDIRF4
ASGNF4
line 1994
;1992:
;1993:	// pulse the size of the crosshair when picking up items
;1994:	f = cg.time - cg.itemPickupBlendTime;
ADDRLP4 8
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+125780
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 1995
;1995:	if ( f > 0 && f < ITEM_BLOB_TIME ) {
ADDRLP4 8
INDIRF4
CNSTF4 0
LEF4 $1058
ADDRLP4 8
INDIRF4
CNSTF4 1128792064
GEF4 $1058
line 1996
;1996:		f /= ITEM_BLOB_TIME;
ADDRLP4 8
ADDRLP4 8
INDIRF4
CNSTF4 1000593162
MULF4
ASGNF4
line 1997
;1997:		w *= ( 1 + f );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 8
INDIRF4
CNSTF4 1065353216
ADDF4
MULF4
ASGNF4
line 1998
;1998:		h *= ( 1 + f );
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
CNSTF4 1065353216
ADDF4
MULF4
ASGNF4
line 1999
;1999:	}
LABELV $1058
line 2001
;2000:
;2001:	x = cg_crosshairX.integer;
ADDRLP4 16
ADDRGP4 cg_crosshairX+12
INDIRI4
CVIF4 4
ASGNF4
line 2002
;2002:	y = cg_crosshairY.integer;
ADDRLP4 20
ADDRGP4 cg_crosshairY+12
INDIRI4
CVIF4 4
ASGNF4
line 2004
;2003:
;2004:	CG_AdjustFrom640( &x, &y, &w, &h );
ADDRLP4 16
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 2006
;2005:
;2006:	ca = cg_drawCrosshair.integer;
ADDRLP4 12
ADDRGP4 cg_drawCrosshair+12
INDIRI4
ASGNI4
line 2007
;2007:	if ( ca < 0 ) {
ADDRLP4 12
INDIRI4
CNSTI4 0
GEI4 $1063
line 2008
;2008:		ca = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 2009
;2009:	}
LABELV $1063
line 2011
;2010:
;2011:	hShader = cgs.media.crosshairShader[ ca % NUM_CROSSHAIRS ];
ADDRLP4 24
ADDRLP4 12
INDIRI4
CNSTI4 10
MODI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+256
ADDP4
INDIRI4
ASGNI4
line 2013
;2012:
;2013:	trap_R_DrawStretchPic( x + cg.refdef.x + 0.5 * (cg.refdef.width - w) - cgs.screenXBias,
ADDRLP4 36
ADDRLP4 0
INDIRF4
ASGNF4
ADDRLP4 16
INDIRF4
ADDRGP4 cg+109056
INDIRI4
CVIF4 4
ADDF4
ADDRGP4 cg+109056+8
INDIRI4
CVIF4 4
ADDRLP4 36
INDIRF4
SUBF4
CNSTF4 1056964608
MULF4
ADDF4
ADDRGP4 cgs+31444
INDIRF4
SUBF4
ARGF4
ADDRLP4 40
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 20
INDIRF4
ADDRGP4 cg+109056+4
INDIRI4
CVIF4 4
ADDF4
ADDRGP4 cg+109056+12
INDIRI4
CVIF4 4
ADDRLP4 40
INDIRF4
SUBF4
CNSTF4 1056964608
MULF4
ADDF4
ADDRGP4 cgs+31448
INDIRF4
SUBF4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 40
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
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 2016
;2014:		y + cg.refdef.y + 0.5 * (cg.refdef.height - h) - cgs.screenYBias,
;2015:		w, h, 0, 0, 1, 1, hShader );
;2016:}
LABELV $1042
endproc CG_DrawCrosshair 44 36
proc CG_ScanForCrosshairEntity 92 28
line 2025
;2017:
;2018:
;2019:
;2020:/*
;2021:=================
;2022:CG_ScanForCrosshairEntity
;2023:=================
;2024:*/
;2025:static void CG_ScanForCrosshairEntity( void ) {
line 2030
;2026:	trace_t		trace;
;2027:	vec3_t		start, end;
;2028:	int			content;
;2029:
;2030:	VectorCopy( cg.refdef.vieworg, start );
ADDRLP4 56
ADDRGP4 cg+109056+24
INDIRB
ASGNB 12
line 2031
;2031:	VectorMA( start, 131072, cg.refdef.viewaxis[0], end );
ADDRLP4 68
ADDRLP4 56
INDIRF4
ADDRGP4 cg+109056+36
INDIRF4
CNSTF4 1207959552
MULF4
ADDF4
ASGNF4
ADDRLP4 68+4
ADDRLP4 56+4
INDIRF4
ADDRGP4 cg+109056+36+4
INDIRF4
CNSTF4 1207959552
MULF4
ADDF4
ASGNF4
ADDRLP4 68+8
ADDRLP4 56+8
INDIRF4
ADDRGP4 cg+109056+36+8
INDIRF4
CNSTF4 1207959552
MULF4
ADDF4
ASGNF4
line 2033
;2032:
;2033:	CG_Trace( &trace, start, vec3_origin, vec3_origin, end, 
ADDRLP4 0
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 84
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
CNSTI4 33554433
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 2035
;2034:		cg.snap->ps.clientNum, CONTENTS_SOLID|CONTENTS_BODY );
;2035:	if ( trace.entityNum >= MAX_CLIENTS ) {
ADDRLP4 0+52
INDIRI4
CNSTI4 64
LTI4 $1092
line 2036
;2036:		return;
ADDRGP4 $1076
JUMPV
LABELV $1092
line 2040
;2037:	}
;2038:
;2039:	// if the player is in fog, don't show it
;2040:	content = CG_PointContents( trace.endpos, 0 );
ADDRLP4 0+12
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 88
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 80
ADDRLP4 88
INDIRI4
ASGNI4
line 2041
;2041:	if ( content & CONTENTS_FOG ) {
ADDRLP4 80
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $1096
line 2042
;2042:		return;
ADDRGP4 $1076
JUMPV
LABELV $1096
line 2046
;2043:	}
;2044:
;2045:	// if the player is invisible, don't show it
;2046:	if ( cg_entities[ trace.entityNum ].currentState.powerups & ( 1 << PW_INVIS ) ) {
ADDRLP4 0+52
INDIRI4
CNSTI4 740
MULI4
ADDRGP4 cg_entities+188
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1098
line 2047
;2047:		return;
ADDRGP4 $1076
JUMPV
LABELV $1098
line 2051
;2048:	}
;2049:
;2050:	// update the fade timer
;2051:	cg.crosshairClientNum = trace.entityNum;
ADDRGP4 cg+125472
ADDRLP4 0+52
INDIRI4
ASGNI4
line 2052
;2052:	cg.crosshairClientTime = cg.time;
ADDRGP4 cg+125476
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 2053
;2053:}
LABELV $1076
endproc CG_ScanForCrosshairEntity 92 28
proc CG_DrawCrosshairNames 16 32
line 2061
;2054:
;2055:
;2056:/*
;2057:=====================
;2058:CG_DrawCrosshairNames
;2059:=====================
;2060:*/
;2061:static void CG_DrawCrosshairNames( void ) {
line 2065
;2062:	float		*color;
;2063:	const char	*name;
;2064:
;2065:	if ( !cg_drawCrosshair.integer ) {
ADDRGP4 cg_drawCrosshair+12
INDIRI4
CNSTI4 0
NEI4 $1107
line 2066
;2066:		return;
ADDRGP4 $1106
JUMPV
LABELV $1107
line 2068
;2067:	}
;2068:	if ( !cg_drawCrosshairNames.integer ) {
ADDRGP4 cg_drawCrosshairNames+12
INDIRI4
CNSTI4 0
NEI4 $1110
line 2069
;2069:		return;
ADDRGP4 $1106
JUMPV
LABELV $1110
line 2071
;2070:	}
;2071:	if ( cg.renderingThirdPerson ) {
ADDRGP4 cg+107628
INDIRI4
CNSTI4 0
EQI4 $1113
line 2072
;2072:		return;
ADDRGP4 $1106
JUMPV
LABELV $1113
line 2076
;2073:	}
;2074:
;2075:	// scan the known entities to see if the crosshair is sighted on one
;2076:	CG_ScanForCrosshairEntity();
ADDRGP4 CG_ScanForCrosshairEntity
CALLV
pop
line 2079
;2077:
;2078:	// draw the name of the player being looked at
;2079:	color = CG_FadeColor( cg.crosshairClientTime, 1000 );
ADDRGP4 cg+125476
INDIRI4
ARGI4
CNSTI4 1000
ARGI4
ADDRLP4 8
ADDRGP4 CG_FadeColor
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 2080
;2080:	if ( !color ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1117
line 2081
;2081:		trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2082
;2082:		return;
ADDRGP4 $1106
JUMPV
LABELV $1117
line 2085
;2083:	}
;2084:
;2085:	name = cgs.clientinfo[ cg.crosshairClientNum ].name;
ADDRLP4 4
ADDRGP4 cg+125472
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996+4
ADDP4
ASGNP4
line 2091
;2086:#ifdef SUI
;2087:	color[3] *= 0.5f;
;2088:	w = CG_Text_Width(name, 0.3f, 0);
;2089:	CG_Text_Paint( 320 - w / 2, 190, 0.3f, color, name, 0, 0, ITEM_TEXTSTYLE_SHADOWED);
;2090:#else //SUI
;2091:	color[3] *= 0.5f;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 2092
;2092:	CG_DrawString( 320, 174, name, color, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_CENTER | DS_PROPORTIONAL );
CNSTF4 1134559232
ARGF4
CNSTF4 1127088128
ARGF4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 12
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 2094
;2093:#endif //SUI
;2094:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2095
;2095:}
LABELV $1106
endproc CG_DrawCrosshairNames 16 32
proc CG_DrawSpectator 0 32
line 2105
;2096:
;2097:
;2098://==============================================================================
;2099:
;2100:/*
;2101:=================
;2102:CG_DrawSpectator
;2103:=================
;2104:*/
;2105:static void CG_DrawSpectator( void ) {
line 2106
;2106:	CG_DrawString( 320, cgs.screenYmax - 40 + 1, "SPECTATOR", colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_CENTER | DS_PROPORTIONAL );
CNSTF4 1134559232
ARGF4
ADDRGP4 cgs+31464
INDIRF4
CNSTF4 1109393408
SUBF4
CNSTF4 1065353216
ADDF4
ARGF4
ADDRGP4 $1124
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 13
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 2107
;2107:	if ( cgs.gametype == GT_DUEL ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 2
NEI4 $1125
line 2108
;2108:		CG_DrawString( 320, cgs.screenYmax - 20 + 1, "waiting to play", colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_CENTER | DS_PROPORTIONAL );
CNSTF4 1134559232
ARGF4
ADDRGP4 cgs+31464
INDIRF4
CNSTF4 1101004800
SUBF4
CNSTF4 1065353216
ADDF4
ARGF4
ADDRGP4 $1129
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 13
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 2109
;2109:	} else if ( cgs.gametype >= GT_TDM ) {
ADDRGP4 $1126
JUMPV
LABELV $1125
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $1130
line 2110
;2110:		CG_DrawString( 320, cgs.screenYmax - 20 + 1, "press ESC and use the JOIN menu to play", colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_CENTER | DS_PROPORTIONAL );
CNSTF4 1134559232
ARGF4
ADDRGP4 cgs+31464
INDIRF4
CNSTF4 1101004800
SUBF4
CNSTF4 1065353216
ADDF4
ARGF4
ADDRGP4 $1134
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 13
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 2111
;2111:	}
LABELV $1130
LABELV $1126
line 2112
;2112:}
LABELV $1122
endproc CG_DrawSpectator 0 32
proc CG_DrawVote 12 32
line 2120
;2113:
;2114:
;2115:/*
;2116:=================
;2117:CG_DrawVote
;2118:=================
;2119:*/
;2120:static void CG_DrawVote( void ) {
line 2124
;2121:	char	*s;
;2122:	int		sec;
;2123:
;2124:	if ( !cgs.voteTime ) {
ADDRGP4 cgs+31700
INDIRI4
CNSTI4 0
NEI4 $1136
line 2125
;2125:		return;
ADDRGP4 $1135
JUMPV
LABELV $1136
line 2129
;2126:	}
;2127:
;2128:	// play a talk beep whenever it is modified
;2129:	if ( cgs.voteModified ) {
ADDRGP4 cgs+31712
INDIRI4
CNSTI4 0
EQI4 $1139
line 2130
;2130:		cgs.voteModified = qfalse;
ADDRGP4 cgs+31712
CNSTI4 0
ASGNI4
line 2131
;2131:		trap_S_StartLocalSound( cgs.media.talkSound, CHAN_LOCAL_SOUND );
ADDRGP4 cgs+148692+892
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2132
;2132:	}
LABELV $1139
line 2134
;2133:
;2134:	sec = ( VOTE_TIME - ( cg.time - cgs.voteTime ) ) / 1000;
ADDRLP4 0
CNSTI4 30000
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cgs+31700
INDIRI4
SUBI4
SUBI4
CNSTI4 1000
DIVI4
ASGNI4
line 2135
;2135:	if ( sec < 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $1147
line 2136
;2136:		sec = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2137
;2137:	}
LABELV $1147
line 2139
;2138:
;2139:	s = va( "VOTE(%i):%s yes:%i no:%i", sec, cgs.voteString, cgs.voteYes, cgs.voteNo );
ADDRGP4 $1149
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 cgs+31716
ARGP4
ADDRGP4 cgs+31704
INDIRI4
ARGI4
ADDRGP4 cgs+31708
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 2140
;2140:	CG_DrawString( cgs.screenXmin - 0, 58, s, colorWhite, SMALLCHAR_WIDTH, SMALLCHAR_HEIGHT, 0, DS_PROPORTIONAL ); // DS_SHADOW?
ADDRGP4 cgs+31452
INDIRF4
CNSTF4 0
SUBF4
ARGF4
CNSTF4 1114112000
ARGF4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1090519040
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 2142
;2141:
;2142:}
LABELV $1135
endproc CG_DrawVote 12 32
proc CG_DrawTeamVote 20 32
line 2150
;2143:
;2144:
;2145:/*
;2146:=================
;2147:CG_DrawTeamVote
;2148:=================
;2149:*/
;2150:static void CG_DrawTeamVote(void) {
line 2154
;2151:	char	*s;
;2152:	int		sec, cs_offset;
;2153:
;2154:	if ( cgs.clientinfo[ cg.clientNum ].team == TEAM_RED )
ADDRGP4 cg+4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996+36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1155
line 2155
;2155:		cs_offset = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1156
JUMPV
LABELV $1155
line 2156
;2156:	else if ( cgs.clientinfo[ cg.clientNum ].team == TEAM_BLUE )
ADDRGP4 cg+4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996+36
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1154
line 2157
;2157:		cs_offset = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 2159
;2158:	else
;2159:		return;
LABELV $1161
LABELV $1156
line 2161
;2160:
;2161:	if ( !cgs.teamVoteTime[cs_offset] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+32740
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1165
line 2162
;2162:		return;
ADDRGP4 $1154
JUMPV
LABELV $1165
line 2166
;2163:	}
;2164:
;2165:	// play a talk beep whenever it is modified
;2166:	if ( cgs.teamVoteModified[cs_offset] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+32764
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1168
line 2167
;2167:		cgs.teamVoteModified[cs_offset] = qfalse;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+32764
ADDP4
CNSTI4 0
ASGNI4
line 2168
;2168:		trap_S_StartLocalSound( cgs.media.talkSound, CHAN_LOCAL_SOUND );
ADDRGP4 cgs+148692+892
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2169
;2169:	}
LABELV $1168
line 2171
;2170:
;2171:	sec = ( VOTE_TIME - ( cg.time - cgs.teamVoteTime[cs_offset] ) ) / 1000;
ADDRLP4 4
CNSTI4 30000
ADDRGP4 cg+107604
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+32740
ADDP4
INDIRI4
SUBI4
SUBI4
CNSTI4 1000
DIVI4
ASGNI4
line 2172
;2172:	if ( sec < 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $1176
line 2173
;2173:		sec = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2174
;2174:	}
LABELV $1176
line 2175
;2175:	s = va("TEAMVOTE(%i):%s yes:%i no:%i", sec, cgs.teamVoteString[cs_offset],
ADDRGP4 $1178
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 cgs+32772
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+32748
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+32756
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 2178
;2176:							cgs.teamVoteYes[cs_offset], cgs.teamVoteNo[cs_offset] );
;2177:
;2178:	CG_DrawString( cgs.screenXmin - 0, 90, s, colorWhite, SMALLCHAR_WIDTH, SMALLCHAR_HEIGHT, 0, DS_PROPORTIONAL ); // DF_SHADOW?
ADDRGP4 cgs+31452
INDIRF4
CNSTF4 0
SUBF4
ARGF4
CNSTF4 1119092736
ARGF4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1090519040
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 2179
;2179:}
LABELV $1154
endproc CG_DrawTeamVote 20 32
proc CG_DrawScoreboard 4 0
line 2182
;2180:
;2181:
;2182:static qboolean CG_DrawScoreboard( void ) {
line 2183
;2183:	return CG_DrawOldScoreboard();
ADDRLP4 0
ADDRGP4 CG_DrawOldScoreboard
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $1183
endproc CG_DrawScoreboard 4 0
proc CG_DrawIntermission 4 0
line 2192
;2184:}
;2185:
;2186:
;2187:/*
;2188:=================
;2189:CG_DrawIntermission
;2190:=================
;2191:*/
;2192:static void CG_DrawIntermission( void ) {
line 2195
;2193://	int key;
;2194:
;2195:	if ( cgs.gametype == GT_CAMPAIGN ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 0
NEI4 $1185
line 2196
;2196:		CG_DrawCenterString();
ADDRGP4 CG_DrawCenterString
CALLV
pop
line 2197
;2197:		return;
ADDRGP4 $1184
JUMPV
LABELV $1185
line 2199
;2198:	}
;2199:	cg.scoreFadeTime = cg.time;
ADDRGP4 cg+115364
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 2200
;2200:	cg.scoreBoardShowing = CG_DrawScoreboard();
ADDRLP4 0
ADDRGP4 CG_DrawScoreboard
CALLI4
ASGNI4
ADDRGP4 cg+115360
ADDRLP4 0
INDIRI4
ASGNI4
line 2201
;2201:}
LABELV $1184
endproc CG_DrawIntermission 4 0
proc CG_DrawFollow 4 32
line 2209
;2202:
;2203:
;2204:/*
;2205:=================
;2206:CG_DrawFollow
;2207:=================
;2208:*/
;2209:static qboolean CG_DrawFollow( void ) {
line 2213
;2210:
;2211:	const char	*name;
;2212:
;2213:	if ( !(cg.snap->ps.pm_flags & PMF_FOLLOW) ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $1192
line 2214
;2214:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1191
JUMPV
LABELV $1192
line 2217
;2215:	}
;2216:
;2217:	CG_DrawString( 320, cgs.screenYmin + 24, "following", colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_CENTER | DS_SHADOW );
CNSTF4 1134559232
ARGF4
ADDRGP4 cgs+31460
INDIRF4
CNSTF4 1103101952
ADDF4
ARGF4
ADDRGP4 $1196
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 9
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 2219
;2218:
;2219:	name = cgs.clientinfo[ cg.snap->ps.clientNum ].name;
ADDRLP4 0
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996+4
ADDP4
ASGNP4
line 2221
;2220:
;2221:	CG_DrawString( 320, cgs.screenYmin + 40, name, colorWhite, GIANT_WIDTH, GIANT_HEIGHT, 0, DS_FORCE_COLOR | DS_SHADOW | DS_CENTER );
CNSTF4 1134559232
ARGF4
ADDRGP4 cgs+31460
INDIRF4
CNSTF4 1109393408
ADDF4
ARGF4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1107296256
ARGF4
CNSTF4 1111490560
ARGF4
CNSTI4 0
ARGI4
CNSTI4 11
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 2223
;2222:
;2223:	return qtrue;
CNSTI4 1
RETI4
LABELV $1191
endproc CG_DrawFollow 4 32
proc CG_DrawAmmoWarning 4 32
line 2233
;2224:}
;2225:
;2226:
;2227:
;2228:/*
;2229:=================
;2230:CG_DrawAmmoWarning
;2231:=================
;2232:*/
;2233:static void CG_DrawAmmoWarning( void ) {
line 2236
;2234:	const char	*s;
;2235:
;2236:	if ( cg_drawAmmoWarning.integer == 0 ) {
ADDRGP4 cg_drawAmmoWarning+12
INDIRI4
CNSTI4 0
NEI4 $1202
line 2237
;2237:		return;
ADDRGP4 $1201
JUMPV
LABELV $1202
line 2240
;2238:	}
;2239:
;2240:	if ( !cg.lowAmmoWarning ) {
ADDRGP4 cg+125464
INDIRI4
CNSTI4 0
NEI4 $1205
line 2241
;2241:		return;
ADDRGP4 $1201
JUMPV
LABELV $1205
line 2244
;2242:	}
;2243:
;2244:	if ( cg.lowAmmoWarning == 2 ) {
ADDRGP4 cg+125464
INDIRI4
CNSTI4 2
NEI4 $1208
line 2245
;2245:		s = "OUT OF AMMO";
ADDRLP4 0
ADDRGP4 $1211
ASGNP4
line 2246
;2246:	} else {
ADDRGP4 $1209
JUMPV
LABELV $1208
line 2247
;2247:		s = "LOW AMMO WARNING";
ADDRLP4 0
ADDRGP4 $1212
ASGNP4
line 2248
;2248:	}
LABELV $1209
line 2250
;2249:
;2250:	CG_DrawString( 320, 64, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_PROPORTIONAL | DS_CENTER | DS_SHADOW );
CNSTF4 1134559232
ARGF4
CNSTF4 1115684864
ARGF4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 13
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 2251
;2251:}
LABELV $1201
endproc CG_DrawAmmoWarning 4 32
proc CG_DrawProxWarning 0 0
line 2259
;2252:
;2253:
;2254:/*
;2255:=================
;2256:CG_DrawProxWarning
;2257:=================
;2258:*/
;2259:static void CG_DrawProxWarning( void ) {
line 2291
;2260:#ifdef SUI
;2261:	char s[32];
;2262:	static int proxTime;
;2263:	static int proxCounter;
;2264:	static int proxTick;
;2265:
;2266:	if ( !( cg.snap->ps.eFlags & EF_TICKING ) ) {
;2267:		proxTime = 0;
;2268:		return;
;2269:	}
;2270:
;2271:	if ( proxTime == 0 ) {
;2272:		proxTime = cg.time + 5000;
;2273:		proxCounter = 5;
;2274:		proxTick = 0;
;2275:	}
;2276:
;2277:	if ( cg.time > proxTime ) {
;2278:		proxTick = proxCounter--;
;2279:		proxTime = cg.time + 1000;
;2280:	}
;2281:
;2282:	if ( proxTick != 0 ) {
;2283:		Com_sprintf( s, sizeof( s ), "INTERNAL COMBUSTION IN: %i", proxTick );
;2284:	}
;2285:	else {
;2286:		Com_sprintf( s, sizeof( s ), "YOU HAVE BEEN MINED" );
;2287:	}
;2288:
;2289:	CG_DrawString( 320, 64 + 64 + BIGCHAR_HEIGHT, s, g_color_table[ColorIndex( COLOR_RED )], BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DF_SHADOW | DF_FORCE_COLOR | DF_CENTER );
;2290:#endif
;2291:}
LABELV $1213
endproc CG_DrawProxWarning 0 0
proc CG_DrawWarmup 36 32
line 2298
;2292:
;2293:/*
;2294:=================
;2295:CG_DrawWarmup
;2296:=================
;2297:*/
;2298:static void CG_DrawWarmup( void ) {
line 2308
;2299:	int			w;
;2300:	int			i;
;2301:#ifdef SUI
;2302:	float scale;
;2303:#endif //SUI
;2304:	clientInfo_t *ci1, *ci2;
;2305:	int			cw;
;2306:	const char	*s;
;2307:
;2308:	if ( !cg.warmup ) {
ADDRGP4 cg+125756
INDIRI4
CNSTI4 0
NEI4 $1215
line 2309
;2309:		return;
ADDRGP4 $1214
JUMPV
LABELV $1215
line 2312
;2310:	}
;2311:
;2312:	if ( cg.warmup < 0 ) {
ADDRGP4 cg+125756
INDIRI4
CNSTI4 0
GEI4 $1218
line 2313
;2313:		CG_DrawString( 320,24, "Waiting for players", colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0,
CNSTF4 1134559232
ARGF4
CNSTF4 1103101952
ARGF4
ADDRGP4 $1221
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 13
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 2315
;2314:			DS_PROPORTIONAL | DS_CENTER | DS_SHADOW );
;2315:		return;
ADDRGP4 $1214
JUMPV
LABELV $1218
line 2318
;2316:	}
;2317:
;2318:	if ( cgs.gametype == GT_DUEL ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 2
NEI4 $1222
line 2320
;2319:		// find the two active players
;2320:		ci1 = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 2321
;2321:		ci2 = NULL;
ADDRLP4 16
CNSTP4 0
ASGNP4
line 2322
;2322:		for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1228
JUMPV
LABELV $1225
line 2323
;2323:			if ( cgs.clientinfo[i].infoValid && cgs.clientinfo[i].team == TEAM_FREE ) {
ADDRLP4 0
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1230
ADDRLP4 0
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996+36
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1230
line 2324
;2324:				if ( !ci1 ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1235
line 2325
;2325:					ci1 = &cgs.clientinfo[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 2326
;2326:				} else {
ADDRGP4 $1236
JUMPV
LABELV $1235
line 2327
;2327:					ci2 = &cgs.clientinfo[i];
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 2328
;2328:				}
LABELV $1236
line 2329
;2329:			}
LABELV $1230
line 2330
;2330:		}
LABELV $1226
line 2322
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1228
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+31504
INDIRI4
LTI4 $1225
line 2332
;2331:
;2332:		if ( ci1 && ci2 ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1223
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1223
line 2333
;2333:			s = va( "%s vs %s", ci1->name, ci2->name );
ADDRGP4 $1241
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 24
INDIRP4
ASGNP4
line 2338
;2334:#ifdef SUI
;2335:			w = CG_Text_Width(s, 0.6f, 0);
;2336:			CG_Text_Paint(320 - w / 2, 60, 0.6f, colorWhite, s, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
;2337:#else //SUI
;2338:			w = CG_DrawStrlen( s );
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 28
INDIRI4
ASGNI4
line 2339
;2339:			if ( w > 640 / GIANT_WIDTH ) {
ADDRLP4 20
INDIRI4
CNSTI4 20
LEI4 $1242
line 2340
;2340:				cw = 640 / w;
ADDRLP4 8
CNSTI4 640
ADDRLP4 20
INDIRI4
DIVI4
ASGNI4
line 2341
;2341:			} else {
ADDRGP4 $1243
JUMPV
LABELV $1242
line 2342
;2342:				cw = GIANT_WIDTH;
ADDRLP4 8
CNSTI4 32
ASGNI4
line 2343
;2343:			}
LABELV $1243
line 2344
;2344:			CG_DrawString( 320, 20, s, colorWhite, cw, cw*1.5, 0, DS_SHADOW | DS_CENTER | DS_PROPORTIONAL );
CNSTF4 1134559232
ARGF4
CNSTF4 1101004800
ARGF4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 32
ADDRLP4 8
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 32
INDIRF4
CNSTF4 1069547520
MULF4
ARGF4
CNSTI4 0
ARGI4
CNSTI4 13
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 2346
;2345:#endif //SUI
;2346:		}
line 2347
;2347:	} else {
ADDRGP4 $1223
JUMPV
LABELV $1222
line 2348
;2348:		s = gt[cgs.gametype].longName;
ADDRLP4 12
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 36
MULI4
ADDRGP4 gt+4
ADDP4
INDIRP4
ASGNP4
line 2353
;2349:#ifdef SUI
;2350:		w = CG_Text_Width(s, 0.6f, 0);
;2351:		CG_Text_Paint(320 - w / 2, 90, 0.6f, colorWhite, s, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
;2352:#else //SUI
;2353:		w = CG_DrawStrlen( s );
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 24
INDIRI4
ASGNI4
line 2354
;2354:		if ( w > 640 / GIANT_WIDTH ) {
ADDRLP4 20
INDIRI4
CNSTI4 20
LEI4 $1246
line 2355
;2355:			cw = 640 / w;
ADDRLP4 8
CNSTI4 640
ADDRLP4 20
INDIRI4
DIVI4
ASGNI4
line 2356
;2356:		} else {
ADDRGP4 $1247
JUMPV
LABELV $1246
line 2357
;2357:			cw = GIANT_WIDTH;
ADDRLP4 8
CNSTI4 32
ASGNI4
line 2358
;2358:		}
LABELV $1247
line 2359
;2359:		CG_DrawString( 320, 25, s, colorWhite, cw, cw*1.1f, 0, DS_PROPORTIONAL | DS_SHADOW | DS_CENTER );
CNSTF4 1134559232
ARGF4
CNSTF4 1103626240
ARGF4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 28
ADDRLP4 8
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 28
INDIRF4
CNSTF4 1066192077
MULF4
ARGF4
CNSTI4 0
ARGI4
CNSTI4 13
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 2361
;2360:#endif //SUI
;2361:	}
LABELV $1223
line 2363
;2362:
;2363:	if ( cg.warmupCount <= 0 )
ADDRGP4 cg+125760
INDIRI4
CNSTI4 0
GTI4 $1248
line 2364
;2364:		return;
ADDRGP4 $1214
JUMPV
LABELV $1248
line 2366
;2365:
;2366:	s = va( "Starts in: %i", cg.warmupCount );
ADDRGP4 $1251
ARGP4
ADDRGP4 cg+125760
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 24
INDIRP4
ASGNP4
line 2368
;2367:
;2368:	switch ( cg.warmupCount ) {
ADDRLP4 28
ADDRGP4 cg+125760
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 1
EQI4 $1256
ADDRLP4 28
INDIRI4
CNSTI4 2
EQI4 $1257
ADDRLP4 28
INDIRI4
CNSTI4 3
EQI4 $1258
ADDRGP4 $1253
JUMPV
LABELV $1256
line 2370
;2369:	case 1:
;2370:		cw = 28;
ADDRLP4 8
CNSTI4 28
ASGNI4
line 2374
;2371:#ifdef SUI
;2372:		scale = 0.54f;
;2373:#endif //SUI
;2374:		break;
ADDRGP4 $1254
JUMPV
LABELV $1257
line 2376
;2375:	case 2:
;2376:		cw = 24;
ADDRLP4 8
CNSTI4 24
ASGNI4
line 2380
;2377:#ifdef SUI
;2378:		scale = 0.51f;
;2379:#endif //SUI
;2380:		break;
ADDRGP4 $1254
JUMPV
LABELV $1258
line 2382
;2381:	case 3:
;2382:		cw = 20;
ADDRLP4 8
CNSTI4 20
ASGNI4
line 2386
;2383:#ifdef SUI
;2384:		scale = 0.48f;
;2385:#endif //SUI
;2386:		break;
ADDRGP4 $1254
JUMPV
LABELV $1253
line 2388
;2387:	default:
;2388:		cw = 16;
ADDRLP4 8
CNSTI4 16
ASGNI4
line 2392
;2389:#ifdef SUI
;2390:		scale = 0.45f;
;2391:#endif //SUI
;2392:		break;
LABELV $1254
line 2399
;2393:	}
;2394:
;2395:#ifdef SUI
;2396:	w = CG_Text_Width(s, scale, 0);
;2397:	CG_Text_Paint(320 - w / 2, 125, scale, colorWhite, s, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
;2398:#else //SUI
;2399:	CG_DrawString( 320, 70, s, colorWhite, cw, cw * 1.5, 0, DS_CENTER | DS_SHADOW | DS_PROPORTIONAL );
CNSTF4 1134559232
ARGF4
CNSTF4 1116471296
ARGF4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 32
ADDRLP4 8
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 32
INDIRF4
CNSTF4 1069547520
MULF4
ARGF4
CNSTI4 0
ARGI4
CNSTI4 13
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 2401
;2400:#endif //SUI
;2401:}
LABELV $1214
endproc CG_DrawWarmup 36 32
proc CG_Draw2D 24 36
line 2412
;2402:
;2403:
;2404://==================================================================================
;2405:
;2406:
;2407:/*
;2408:=================
;2409:CG_Draw2D
;2410:=================
;2411:*/
;2412:static void CG_Draw2D( stereoFrame_t stereoFrame ) {
line 2414
;2413:	// if we are taking a levelshot for the menu, don't draw anything
;2414:	if ( cg.levelShot ) {
ADDRGP4 cg+12
INDIRI4
CNSTI4 0
EQI4 $1260
line 2415
;2415:		return;
ADDRGP4 $1259
JUMPV
LABELV $1260
line 2418
;2416:	}
;2417:
;2418:	if ( cg_draw2D.integer == 0 ) {
ADDRGP4 cg_draw2D+12
INDIRI4
CNSTI4 0
NEI4 $1263
line 2419
;2419:		return;
ADDRGP4 $1259
JUMPV
LABELV $1263
line 2422
;2420:	}
;2421:
;2422:	if ( cg.snap->ps.pm_type == PM_INTERMISSION ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1266
line 2423
;2423:		CG_DrawIntermission();
ADDRGP4 CG_DrawIntermission
CALLV
pop
line 2424
;2424:		return;
ADDRGP4 $1259
JUMPV
LABELV $1266
line 2432
;2425:	}
;2426:
;2427:/*
;2428:	if (cg.cameraMode) {
;2429:		return;
;2430:	}
;2431:*/
;2432:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1269
line 2433
;2433:		CG_DrawSpectator();
ADDRGP4 CG_DrawSpectator
CALLV
pop
line 2434
;2434:		CG_DrawCrosshair();
ADDRGP4 CG_DrawCrosshair
CALLV
pop
line 2435
;2435:		CG_DrawCrosshairNames();
ADDRGP4 CG_DrawCrosshairNames
CALLV
pop
line 2436
;2436:	} else {
ADDRGP4 $1270
JUMPV
LABELV $1269
line 2438
;2437:		// don't draw any status if dead or the scoreboard is being explicitly shown
;2438:		if ( !cg.showScores && cg.snap->ps.stats[STAT_HEALTH] > 0 ) {
ADDRGP4 cg+115356
INDIRI4
CNSTI4 0
NEI4 $1272
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1272
line 2439
;2439:			CG_DrawStatusBar();
ADDRGP4 CG_DrawStatusBar
CALLV
pop
line 2441
;2440:      
;2441:			CG_DrawAmmoWarning();
ADDRGP4 CG_DrawAmmoWarning
CALLV
pop
line 2442
;2442:			CG_DrawProxWarning();
ADDRGP4 CG_DrawProxWarning
CALLV
pop
line 2444
;2443:
;2444:			CG_DrawCrosshair();
ADDRGP4 CG_DrawCrosshair
CALLV
pop
line 2445
;2445:			CG_DrawCrosshairNames();
ADDRGP4 CG_DrawCrosshairNames
CALLV
pop
line 2446
;2446:			CG_DrawWeaponSelect();
ADDRGP4 CG_DrawWeaponSelect
CALLV
pop
line 2448
;2447:
;2448:			CG_DrawHoldableItem();
ADDRGP4 CG_DrawHoldableItem
CALLV
pop
line 2449
;2449:			CG_DrawPersistantPowerup();
ADDRGP4 CG_DrawPersistantPowerup
CALLV
pop
line 2450
;2450:			CG_DrawReward();
ADDRGP4 CG_DrawReward
CALLV
pop
line 2451
;2451:		}
LABELV $1272
line 2453
;2452:    
;2453:		if ( cgs.gametype >= GT_TDM ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $1276
line 2454
;2454:			CG_DrawTeamInfo();
ADDRGP4 CG_DrawTeamInfo
CALLV
pop
line 2455
;2455:		}
LABELV $1276
line 2456
;2456:	}
LABELV $1270
line 2458
;2457:
;2458:	CG_DrawVote();
ADDRGP4 CG_DrawVote
CALLV
pop
line 2459
;2459:	CG_DrawTeamVote();
ADDRGP4 CG_DrawTeamVote
CALLV
pop
line 2461
;2460:
;2461:	CG_DrawLagometer();
ADDRGP4 CG_DrawLagometer
CALLV
pop
line 2463
;2462:
;2463:	CG_DrawUpperRight(stereoFrame);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 CG_DrawUpperRight
CALLV
pop
line 2465
;2464:
;2465:	CG_DrawLowerRight();
ADDRGP4 CG_DrawLowerRight
CALLV
pop
line 2466
;2466:	CG_DrawLowerLeft();
ADDRGP4 CG_DrawLowerLeft
CALLV
pop
line 2468
;2467:
;2468:	if ( !CG_DrawFollow() ) {
ADDRLP4 0
ADDRGP4 CG_DrawFollow
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1279
line 2469
;2469:		CG_DrawWarmup();
ADDRGP4 CG_DrawWarmup
CALLV
pop
line 2470
;2470:	}
LABELV $1279
line 2473
;2471:
;2472:	// don't draw center string if scoreboard is up
;2473:	cg.scoreBoardShowing = CG_DrawScoreboard();
ADDRLP4 4
ADDRGP4 CG_DrawScoreboard
CALLI4
ASGNI4
ADDRGP4 cg+115360
ADDRLP4 4
INDIRI4
ASGNI4
line 2474
;2474:	if ( !cg.scoreBoardShowing ) {
ADDRGP4 cg+115360
INDIRI4
CNSTI4 0
NEI4 $1282
line 2475
;2475:		CG_DrawCenterString();
ADDRGP4 CG_DrawCenterString
CALLV
pop
line 2476
;2476:	}
LABELV $1282
line 2478
;2477:
;2478:	if ( cgs.score_catched ) {
ADDRGP4 cgs+149920
INDIRI4
CNSTI4 0
EQI4 $1285
line 2480
;2479:		float x, y, w, h;
;2480:		trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2481
;2481:		x = cgs.cursorX - 12;
ADDRLP4 8
ADDRGP4 cgs+149928
INDIRF4
CNSTF4 1094713344
SUBF4
ASGNF4
line 2482
;2482:		y = cgs.cursorY - 12;
ADDRLP4 12
ADDRGP4 cgs+149932
INDIRF4
CNSTF4 1094713344
SUBF4
ASGNF4
line 2483
;2483:		w = 24;
ADDRLP4 16
CNSTF4 1103101952
ASGNF4
line 2484
;2484:		h = 24;
ADDRLP4 20
CNSTF4 1103101952
ASGNF4
line 2485
;2485:		CG_AdjustFrom640( &x, &y, &w, &h );
ADDRLP4 8
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 2486
;2486:		trap_R_DrawStretchPic( x, y, w, h, 0, 0, 1, 1, cgs.media.cursor );
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 20
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
ADDRGP4 cgs+148692+1156
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 2487
;2487:	}
LABELV $1285
line 2488
;2488:}
LABELV $1259
endproc CG_Draw2D 24 36
proc CG_DrawTourneyScoreboard 0 0
line 2491
;2489:
;2490:
;2491:static void CG_DrawTourneyScoreboard( void ) {
line 2492
;2492:	CG_DrawOldTourneyScoreboard();
ADDRGP4 CG_DrawOldTourneyScoreboard
CALLV
pop
line 2493
;2493:}
LABELV $1292
endproc CG_DrawTourneyScoreboard 0 0
proc CG_CalculatePing 16 0
line 2496
;2494:
;2495:
;2496:static void CG_CalculatePing( void ) {
line 2499
;2497:	int count, i, v;
;2498:
;2499:	cg.meanPing = 0;
ADDRGP4 cg+157004
CNSTI4 0
ASGNI4
line 2501
;2500:
;2501:	for ( i = 0, count = 0; i < LAG_SAMPLES; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $1298
JUMPV
LABELV $1295
line 2503
;2502:
;2503:		v = lagometer.snapshotSamples[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer+1028
ADDP4
INDIRI4
ASGNI4
line 2504
;2504:		if ( v >= 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $1300
line 2505
;2505:			cg.meanPing += v;
ADDRLP4 12
ADDRGP4 cg+157004
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 2506
;2506:			count++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2507
;2507:		}
LABELV $1300
line 2509
;2508:
;2509:	}
LABELV $1296
line 2501
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1298
ADDRLP4 0
INDIRI4
CNSTI4 128
LTI4 $1295
line 2511
;2510:
;2511:	if ( count ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $1303
line 2512
;2512:		cg.meanPing /= count;
ADDRLP4 12
ADDRGP4 cg+157004
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
DIVI4
ASGNI4
line 2513
;2513:	}
LABELV $1303
line 2514
;2514:}
LABELV $1293
endproc CG_CalculatePing 16 0
proc CG_WarmupEvents 8 12
line 2517
;2515:
;2516:
;2517:static void CG_WarmupEvents( void ) {
line 2521
;2518:
;2519:	int	count;
;2520:
;2521:	if ( !cg.warmup )
ADDRGP4 cg+125756
INDIRI4
CNSTI4 0
NEI4 $1307
line 2522
;2522:		return;
ADDRGP4 $1306
JUMPV
LABELV $1307
line 2524
;2523:
;2524:	if ( cg.warmup < 0 ) {
ADDRGP4 cg+125756
INDIRI4
CNSTI4 0
GEI4 $1310
line 2525
;2525:		cg.warmupCount = -1;
ADDRGP4 cg+125760
CNSTI4 -1
ASGNI4
line 2526
;2526:		return;
ADDRGP4 $1306
JUMPV
LABELV $1310
line 2529
;2527:	}
;2528:
;2529:	if ( cg.warmup < cg.time ) {
ADDRGP4 cg+125756
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $1314
line 2530
;2530:		cg.warmup = 0;
ADDRGP4 cg+125756
CNSTI4 0
ASGNI4
line 2531
;2531:		count = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2532
;2532:	} else {
ADDRGP4 $1315
JUMPV
LABELV $1314
line 2533
;2533:		count = ( cg.warmup - cg.time + 999 ) / 1000;
ADDRLP4 0
ADDRGP4 cg+125756
INDIRI4
ADDRGP4 cg+107604
INDIRI4
SUBI4
CNSTI4 999
ADDI4
CNSTI4 1000
DIVI4
ASGNI4
line 2534
;2534:	}
LABELV $1315
line 2536
;2535:
;2536:	if ( cg.warmupCount == -2 && cg.demoPlayback ) {
ADDRGP4 cg+125760
INDIRI4
CNSTI4 -2
NEI4 $1321
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
EQI4 $1321
line 2537
;2537:		cg.warmupCount = 0;
ADDRGP4 cg+125760
CNSTI4 0
ASGNI4
line 2538
;2538:	}
LABELV $1321
line 2540
;2539:
;2540:	if ( cg.warmupCount == count ) {
ADDRGP4 cg+125760
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1326
line 2541
;2541:		return;
ADDRGP4 $1306
JUMPV
LABELV $1326
line 2544
;2542:	}
;2543:
;2544:	cg.warmupCount = count;
ADDRGP4 cg+125760
ADDRLP4 0
INDIRI4
ASGNI4
line 2545
;2545:	cg.timelimitWarnings = 0;
ADDRGP4 cg+107616
CNSTI4 0
ASGNI4
line 2547
;2546:
;2547:	switch ( count ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1332
ADDRLP4 0
INDIRI4
CNSTI4 3
GTI4 $1332
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1352
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $1352
address $1333
address $1343
address $1346
address $1349
code
LABELV $1333
line 2549
;2548:		case 0:
;2549:			if ( cg.warmupFightSound <= cg.time ) {
ADDRGP4 cg+125764
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GTI4 $1334
line 2550
;2550:				trap_S_StartLocalSound( cgs.media.countFightSound, CHAN_ANNOUNCER );
ADDRGP4 cgs+148692+1116
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2551
;2551:				cg.warmupFightSound = cg.time + 750;
ADDRGP4 cg+125764
ADDRGP4 cg+107604
INDIRI4
CNSTI4 750
ADDI4
ASGNI4
line 2552
;2552:			}
LABELV $1334
line 2553
;2553:			CG_CenterPrint( "FIGHT!", 120, GIANTCHAR_WIDTH*2 );
ADDRGP4 $1342
ARGP4
CNSTI4 120
ARGI4
CNSTI4 64
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 2554
;2554:			break;
ADDRGP4 $1332
JUMPV
LABELV $1343
line 2557
;2555:
;2556:		case 1:
;2557:			trap_S_StartLocalSound( cgs.media.count1Sound, CHAN_ANNOUNCER );
ADDRGP4 cgs+148692+1112
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2558
;2558:			break;
ADDRGP4 $1332
JUMPV
LABELV $1346
line 2561
;2559:
;2560:		case 2:
;2561:			trap_S_StartLocalSound( cgs.media.count2Sound, CHAN_ANNOUNCER );
ADDRGP4 cgs+148692+1108
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2562
;2562:			break;
ADDRGP4 $1332
JUMPV
LABELV $1349
line 2565
;2563:
;2564:		case 3:
;2565:			trap_S_StartLocalSound( cgs.media.count3Sound, CHAN_ANNOUNCER );
ADDRGP4 cgs+148692+1104
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2566
;2566:			break;
line 2569
;2567:
;2568:		default:
;2569:			break;
LABELV $1332
line 2571
;2570:	}
;2571:}
LABELV $1306
endproc CG_WarmupEvents 8 12
export CG_WarmupEvent
proc CG_WarmupEvent 0 0
line 2576
;2572:
;2573:
;2574:
;2575:// will be called on warmup end and when client changed
;2576:void CG_WarmupEvent( void ) {
line 2578
;2577:
;2578:	cg.attackerTime = 0;
ADDRGP4 cg+125524
CNSTI4 0
ASGNI4
line 2579
;2579:	cg.attackerName[0] = '\0';
ADDRGP4 cg+125488
CNSTI1 0
ASGNI1
line 2581
;2580:
;2581:	cg.itemPickupTime = 0;
ADDRGP4 cg+125776
CNSTI4 0
ASGNI4
line 2582
;2582:	cg.itemPickupBlendTime = 0;
ADDRGP4 cg+125780
CNSTI4 0
ASGNI4
line 2583
;2583:	cg.itemPickupCount = 0;
ADDRGP4 cg+125772
CNSTI4 0
ASGNI4
line 2585
;2584:
;2585:	cg.killerTime = 0;
ADDRGP4 cg+115432
CNSTI4 0
ASGNI4
line 2586
;2586:	cg.killerName[0] = '\0';
ADDRGP4 cg+115368
CNSTI1 0
ASGNI1
line 2588
;2587:	
;2588:	cg.damageTime = 0;
ADDRGP4 cg+125796
CNSTI4 0
ASGNI4
line 2590
;2589:
;2590:	cg.rewardStack = 0;
ADDRGP4 cg+125532
CNSTI4 0
ASGNI4
line 2591
;2591:	cg.rewardTime = 0;
ADDRGP4 cg+125536
CNSTI4 0
ASGNI4
line 2593
;2592:	
;2593:	cg.weaponSelectTime = cg.time;
ADDRGP4 cg+125784
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 2595
;2594:
;2595:	cg.lowAmmoWarning = 0;
ADDRGP4 cg+125464
CNSTI4 0
ASGNI4
line 2597
;2596:
;2597:	cg.followTime = 0;
ADDRGP4 cg+157016
CNSTI4 0
ASGNI4
line 2598
;2598:}
LABELV $1353
endproc CG_WarmupEvent 0 0
proc CG_ApplyClientChange 0 0
line 2603
;2599:
;2600:
;2601:// called each time client team changed
;2602:static void CG_ApplyClientChange( void )
;2603:{
line 2604
;2604:	CG_WarmupEvent();
ADDRGP4 CG_WarmupEvent
CALLV
pop
line 2605
;2605:	CG_ForceModelChange();
ADDRGP4 CG_ForceModelChange
CALLV
pop
line 2606
;2606:}
LABELV $1368
endproc CG_ApplyClientChange 0 0
data
align 4
LABELV $1370
byte 4 -1
align 4
LABELV $1371
byte 4 -1
align 4
LABELV $1372
byte 4 -1
export CG_TrackClientTeamChange
code
proc CG_TrackClientTeamChange 8 4
line 2615
;2607:
;2608:
;2609:/*
;2610:=====================
;2611:CG_TrackClientTeamChange
;2612:=====================
;2613:*/
;2614:void CG_TrackClientTeamChange( void ) 
;2615:{
line 2623
;2616:	static int spec_client = -1;
;2617:	static int spec_team = -1;
;2618:	static int curr_team = -1;
;2619:
;2620:	int		ti; // team from clientinfo 
;2621:	int		tp; // persistant team from snapshot
;2622:
;2623:	if ( !cg.snap )
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1373
line 2624
;2624:		return;
ADDRGP4 $1369
JUMPV
LABELV $1373
line 2626
;2625:
;2626:	tp = cg.snap->ps.persistant[ PERS_TEAM ];
ADDRLP4 0
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ASGNI4
line 2627
;2627:	ti = cgs.clientinfo[ cg.snap->ps.clientNum ].team;
ADDRLP4 4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996+36
ADDP4
INDIRI4
ASGNI4
line 2629
;2628:
;2629:	if ( !(cg.snap->ps.pm_flags & PMF_FOLLOW) && tp != TEAM_SPECTATOR ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $1380
ADDRLP4 0
INDIRI4
CNSTI4 3
EQI4 $1380
line 2630
;2630:		ti = tp; // use team from persistant info
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 2631
;2631:	}
LABELV $1380
line 2634
;2632:
;2633:	// team changed
;2634:	if ( curr_team != ti )
ADDRGP4 $1372
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $1383
line 2635
;2635:	{
line 2636
;2636:		curr_team = ti;
ADDRGP4 $1372
ADDRLP4 4
INDIRI4
ASGNI4
line 2637
;2637:		spec_client = cg.snap->ps.clientNum;
ADDRGP4 $1370
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 2638
;2638:		spec_team = tp;
ADDRGP4 $1371
ADDRLP4 0
INDIRI4
ASGNI4
line 2640
;2639:
;2640:		if ( spec_team == TEAM_SPECTATOR )
ADDRGP4 $1371
INDIRI4
CNSTI4 3
NEI4 $1386
line 2641
;2641:			spec_team = curr_team;
ADDRGP4 $1371
ADDRGP4 $1372
INDIRI4
ASGNI4
LABELV $1386
line 2643
;2642:
;2643:		CG_ApplyClientChange();
ADDRGP4 CG_ApplyClientChange
CALLV
pop
line 2644
;2644:		CG_ResetPlayerEntity( &cg.predictedPlayerEntity );
ADDRGP4 cg+108104
ARGP4
ADDRGP4 CG_ResetPlayerEntity
CALLV
pop
line 2645
;2645:		return;
ADDRGP4 $1369
JUMPV
LABELV $1383
line 2648
;2646:	}
;2647:
;2648:	if ( curr_team == TEAM_SPECTATOR )
ADDRGP4 $1372
INDIRI4
CNSTI4 3
NEI4 $1389
line 2649
;2649:	{
line 2650
;2650:		if ( spec_team != tp )
ADDRGP4 $1371
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $1391
line 2651
;2651:		{
line 2652
;2652:			spec_team  = tp;
ADDRGP4 $1371
ADDRLP4 0
INDIRI4
ASGNI4
line 2653
;2653:			spec_client = cg.snap->ps.clientNum;
ADDRGP4 $1370
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 2655
;2654:
;2655:			CG_ApplyClientChange();
ADDRGP4 CG_ApplyClientChange
CALLV
pop
line 2656
;2656:			CG_ResetPlayerEntity( &cg.predictedPlayerEntity );
ADDRGP4 cg+108104
ARGP4
ADDRGP4 CG_ResetPlayerEntity
CALLV
pop
line 2657
;2657:			return;
ADDRGP4 $1369
JUMPV
LABELV $1391
line 2660
;2658:		}
;2659:
;2660:		if ( cgs.gametype >= GT_TDM ) 
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $1395
line 2661
;2661:		{
line 2662
;2662:			spec_client = cg.snap->ps.clientNum;
ADDRGP4 $1370
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 2663
;2663:			return;
ADDRGP4 $1369
JUMPV
LABELV $1395
line 2666
;2664:		}
;2665:		// pass through to spec client checks
;2666:	}
LABELV $1389
line 2668
;2667:	
;2668:	if ( spec_client != cg.snap->ps.clientNum ) 
ADDRGP4 $1370
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
EQI4 $1399
line 2669
;2669:	{
line 2670
;2670:		spec_client = cg.snap->ps.clientNum;
ADDRGP4 $1370
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 2671
;2671:		spec_team = tp;
ADDRGP4 $1371
ADDRLP4 0
INDIRI4
ASGNI4
line 2673
;2672:
;2673:		if ( spec_team == TEAM_SPECTATOR )
ADDRGP4 $1371
INDIRI4
CNSTI4 3
NEI4 $1403
line 2674
;2674:			spec_team = cgs.clientinfo[ cg.snap->ps.clientNum ].team;
ADDRGP4 $1371
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996+36
ADDP4
INDIRI4
ASGNI4
LABELV $1403
line 2676
;2675:
;2676:		CG_ApplyClientChange();
ADDRGP4 CG_ApplyClientChange
CALLV
pop
line 2677
;2677:		CG_ResetPlayerEntity( &cg.predictedPlayerEntity );
ADDRGP4 cg+108104
ARGP4
ADDRGP4 CG_ResetPlayerEntity
CALLV
pop
line 2678
;2678:	}
LABELV $1399
line 2679
;2679:}
LABELV $1369
endproc CG_TrackClientTeamChange 8 4
export CG_DrawActive
proc CG_DrawActive 0 4
line 2689
;2680:
;2681:
;2682:/*
;2683:=====================
;2684:CG_DrawActive
;2685:
;2686:Perform all drawing needed to completely fill the screen
;2687:=====================
;2688:*/
;2689:void CG_DrawActive( stereoFrame_t stereoView ) {
line 2691
;2690:	// optionally draw the info screen instead
;2691:	if ( !cg.snap ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1410
line 2692
;2692:		CG_DrawInformation();
ADDRGP4 CG_DrawInformation
CALLV
pop
line 2693
;2693:		return;
ADDRGP4 $1409
JUMPV
LABELV $1410
line 2696
;2694:	}
;2695:
;2696:	if ( !cg.demoPlayback ) {
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
NEI4 $1413
line 2697
;2697:		CG_CalculatePing();
ADDRGP4 CG_CalculatePing
CALLV
pop
line 2698
;2698:	}
LABELV $1413
line 2701
;2699:
;2700:	// optionally draw the tournement scoreboard instead
;2701:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR &&
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1416
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $1416
line 2702
;2702:		( cg.snap->ps.pm_flags & PMF_SCOREBOARD ) ) {
line 2703
;2703:		CG_DrawTourneyScoreboard();
ADDRGP4 CG_DrawTourneyScoreboard
CALLV
pop
line 2704
;2704:		return;
ADDRGP4 $1409
JUMPV
LABELV $1416
line 2708
;2705:	}
;2706:
;2707:	// clear around the rendered view if sized down
;2708:	CG_TileClear();
ADDRGP4 CG_TileClear
CALLV
pop
line 2711
;2709:
;2710:	// draw 3D view
;2711:	trap_R_RenderScene( &cg.refdef );
ADDRGP4 cg+109056
ARGP4
ADDRGP4 trap_R_RenderScene
CALLV
pop
line 2714
;2712:
;2713:	// play warmup sounds and display text
;2714:	CG_WarmupEvents();
ADDRGP4 CG_WarmupEvents
CALLV
pop
line 2717
;2715:
;2716:	// draw status bar and other floating elements
;2717: 	CG_Draw2D( stereoView );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 CG_Draw2D
CALLV
pop
line 2718
;2718:}
LABELV $1409
endproc CG_DrawActive 0 4
bss
export lagometer
align 4
LABELV lagometer
skip 1544
import trap_R_AddLinearLightToScene
import trap_R_AddRefEntityToScene2
import linearLight
import intShaderTime
import CG_NewParticleArea
import initparticles
import CG_ParticleExplosion
import CG_ParticleMisc
import CG_ParticleDust
import CG_ParticleSparks
import CG_ParticleBulletDebris
import CG_ParticleSnowFlurry
import CG_AddParticleShrapnel
import CG_ParticleSmoke
import CG_ParticleSnow
import CG_AddParticles
import CG_ClearParticles
import trap_GetEntityToken
import trap_getCameraInfo
import trap_startCamera
import trap_loadCamera
import trap_SnapVector
import trap_CIN_SetExtents
import trap_CIN_DrawCinematic
import trap_CIN_RunCinematic
import trap_CIN_StopCinematic
import trap_CIN_PlayCinematic
import trap_Key_GetKey
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_IsDown
import trap_R_RegisterFont
import trap_MemoryRemaining
import testPrintFloat
import testPrintInt
import trap_SetUserCmdValue
import trap_GetUserCmd
import trap_GetCurrentCmdNumber
import trap_GetServerCommand
import trap_GetSnapshot
import trap_GetCurrentSnapshotNumber
import trap_GetGameState
import trap_GetGlconfig
import trap_R_inPVS
import trap_R_RemapShader
import trap_R_LerpTag
import trap_R_ModelBounds
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_LightForPoint
import trap_R_AddAdditiveLightToScene
import trap_R_AddLightToScene
import trap_R_AddPolysToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterShader
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_R_LoadWorldMap
import trap_S_StopBackgroundTrack
import trap_S_StartBackgroundTrack
import trap_S_RegisterSound
import trap_S_Respatialize
import trap_S_UpdateEntityPosition
import trap_S_AddRealLoopingSound
import trap_S_AddLoopingSound
import trap_S_ClearLoopingSounds
import trap_S_StartLocalSound
import trap_S_StopLoopingSound
import trap_S_StartSound
import trap_CM_MarkFragments
import trap_CM_TransformedCapsuleTrace
import trap_CM_TransformedBoxTrace
import trap_CM_CapsuleTrace
import trap_CM_BoxTrace
import trap_CM_TransformedPointContents
import trap_CM_PointContents
import trap_CM_TempBoxModel
import trap_CM_InlineModel
import trap_CM_NumInlineModels
import trap_CM_LoadMap
import trap_UpdateScreen
import trap_SendClientCommand
import trap_RemoveCommand
import trap_AddCommand
import trap_RealTime
import trap_SendConsoleCommand
import trap_FS_Seek
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Cvar_VariableStringBuffer
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import CG_CheckChangedPredictableEvents
import CG_TransitionPlayerState
import CG_Respawn
import CG_ShaderStateChanged
import CG_SetConfigValues
import CG_ParseSysteminfo
import CG_ParseServerinfo
import CG_ExecuteNewServerCommands
import CG_InitConsoleCommands
import CG_ConsoleCommand
import CG_ScoreboardClick
import CG_DrawOldTourneyScoreboard
import CG_DrawOldScoreboard
import CG_DrawInformation
import CG_LoadingClient
import CG_LoadingItem
import CG_LoadingString
import CG_ProcessSnapshots
import CG_MakeExplosion
import CG_Bleed
import CG_BigExplode
import CG_GibPlayer
import CG_ScorePlum
import CG_LightningBoltBeam
import CG_InvulnerabilityJuiced
import CG_InvulnerabilityImpact
import CG_ObeliskPain
import CG_ObeliskExplode
import CG_KamikazeEffect
import CG_SpawnEffect
import CG_BubbleTrail
import CG_SmokePuff
import CG_AddLocalEntities
import CG_AllocLocalEntity
import CG_InitLocalEntities
import CG_ImpactMark
import CG_AddMarks
import CG_InitMarkPolys
import CG_OutOfAmmoChange
import CG_DrawWeaponSelect
import CG_AddPlayerWeapon
import CG_AddViewWeapon
import CG_GrappleTrail
import CG_RailTrail
import CG_Bullet
import CG_ShotgunFire
import CG_MissileHitPlayer
import CG_MissileHitWall
import CG_FireWeapon
import CG_RegisterItemVisuals
import CG_RegisterWeapon
import CG_Weapon_f
import CG_PrevWeapon_f
import CG_NextWeapon_f
import CG_PositionRotatedEntityOnTag
import CG_PositionEntityOnTag
import CG_AdjustPositionForMover
import CG_Beam
import CG_AddPacketEntities
import CG_SetEntitySoundPosition
import CG_PainEvent
import CG_EntityEvent
import CG_PlaceString
import CG_CheckEvents
import CG_PlayDroppedEvents
import CG_LoadDeferredPlayers
import CG_PredictPlayerState
import CG_Trace
import CG_PointContents
import CG_BuildSolidList
import CG_CustomSound
import CG_NewClientInfo
import CG_AddRefEntityWithPowerups
import CG_ResetPlayerEntity
import CG_Player
import CG_ForceModelChange
import CG_StatusHandle
import CG_OtherTeamHasFlag
import CG_YourTeamHasFlag
import CG_GameTypeString
import CG_CheckOrderPending
import CG_Text_PaintChar
import CG_GetKillerText
import CG_GetGameStatusText
import CG_GetTeamColor
import CG_InitTeamChat
import CG_SetPrintString
import CG_ShowResponseHead
import CG_RunMenuScript
import CG_OwnerDrawVisible
import CG_GetValue
import CG_SelectNextPlayer
import CG_SelectPrevPlayer
import CG_Text_Height
import CG_Text_Width
import CG_Text_Paint
import CG_OwnerDraw
export teamChat2
align 1
LABELV teamChat2
skip 256
export teamChat1
align 1
LABELV teamChat1
skip 256
export systemChat
align 1
LABELV systemChat
skip 256
export numSortedTeamPlayers
align 4
LABELV numSortedTeamPlayers
skip 4
export sortedTeamPlayers
align 4
LABELV sortedTeamPlayers
skip 128
import CG_SelectFont
import CG_LoadFonts
import CG_DrawString
import CG_DrawTopBottom
import CG_DrawSides
import CG_DrawRect
import UI_DrawProportionalString
import CG_GetColorForHealth
import CG_ColorForHealth
import CG_TileClear
import CG_TeamColor
import CG_FadeColorTime
import CG_FadeColor
import CG_DrawStrlen
import CG_DrawStringExt
import CG_DrawPic
import CG_FillScreen
import CG_FillRect
import CG_AdjustFrom640
import CG_DrawActiveFrame
import CG_AddBufferedSound
import CG_ZoomUp_f
import CG_ZoomDown_f
import CG_TestModelPrevSkin_f
import CG_TestModelNextSkin_f
import CG_TestModelPrevFrame_f
import CG_TestModelNextFrame_f
import CG_TestGun_f
import CG_TestModel_f
import CG_SetScoreCatcher
import CG_BuildSpectatorString
import CG_MouseEvent
import CG_KeyEvent
import CG_LastAttacker
import CG_CrosshairPlayer
import CG_UpdateCvars
import CG_StartMusic
import CG_Error
import CG_Printf
import CG_Argv
import CG_ConfigString
import eventnames
import cg_followKiller
import cg_fovAdjust
import cg_deadBodyDarken
import cg_teamColors
import cg_teamModel
import cg_enemyColors
import cg_enemyModel
import cg_hitSounds
import cg_obeliskRespawnDelay
import cg_recordSPDemoName
import cg_recordSPDemo
import cg_singlePlayerActive
import cg_enableBreath
import cg_enableDust
import cg_singlePlayer
import cg_blueTeamName
import cg_redTeamName
import cg_trueLightning
import cg_oldPlasma
import cg_oldRocket
import cg_oldRail
import cg_noProjectileTrail
import cg_noTaunt
import cg_bigFont
import cg_smallFont
import cg_cameraMode
import cg_timescale
import cg_timescaleFadeSpeed
import cg_timescaleFadeEnd
import cg_cameraOrbitDelay
import cg_cameraOrbit
import cg_smoothClients
import cg_scorePlum
import cg_teamChatsOnly
import cg_drawFriend
import cg_deferPlayers
import cg_predictItems
import cg_blood
import cg_paused
import cg_buildScript
import cg_forceModel
import cg_stats
import cg_teamChatHeight
import cg_teamChatTime
import cg_drawSpeed
import cg_drawAttacker
import cg_lagometer
import cg_thirdPerson
import cg_thirdPersonAngle
import cg_thirdPersonRange
import cg_zoomFov
import cg_fov
import cg_simpleItems
import cg_ignore
import cg_autoswitch
import cg_tracerLength
import cg_tracerWidth
import cg_tracerChance
import cg_viewsize
import cg_drawGun
import cg_gun_z
import cg_gun_y
import cg_gun_x
import cg_gun_frame
import cg_brassTime
import cg_addMarks
import cg_footsteps
import cg_showmiss
import cg_noPlayerAnims
import cg_nopredict
import cg_errorDecay
import cg_railTrailRadius
import cg_railTrailTime
import cg_debugEvents
import cg_debugPosition
import cg_debugAnim
import cg_animSpeed
import cg_draw2D
import cg_drawStatus
import cg_crosshairHealth
import cg_crosshairSize
import cg_crosshairY
import cg_crosshairX
import cg_drawWeaponSelect
import cg_teamOverlayUserinfo
import cg_drawTeamOverlay
import cg_drawRewards
import cg_drawCrosshairNames
import cg_drawCrosshair
import cg_drawAmmoWarning
import cg_drawIcons
import cg_draw3dIcons
import cg_drawSnapshot
import cg_drawFPS
import cg_drawTimer
import cg_gibs
import cg_shadows
import cg_swingSpeed
import cg_bobroll
import cg_bobpitch
import cg_bobup
import cg_runroll
import cg_runpitch
import cg_centertime
import cg_markPolys
import cg_items
import cg_weapons
import cg_entities
import cg
import cgs
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
LABELV $1342
byte 1 70
byte 1 73
byte 1 71
byte 1 72
byte 1 84
byte 1 33
byte 1 0
align 1
LABELV $1251
byte 1 83
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1241
byte 1 37
byte 1 115
byte 1 32
byte 1 118
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1221
byte 1 87
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $1212
byte 1 76
byte 1 79
byte 1 87
byte 1 32
byte 1 65
byte 1 77
byte 1 77
byte 1 79
byte 1 32
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 0
align 1
LABELV $1211
byte 1 79
byte 1 85
byte 1 84
byte 1 32
byte 1 79
byte 1 70
byte 1 32
byte 1 65
byte 1 77
byte 1 77
byte 1 79
byte 1 0
align 1
LABELV $1196
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $1178
byte 1 84
byte 1 69
byte 1 65
byte 1 77
byte 1 86
byte 1 79
byte 1 84
byte 1 69
byte 1 40
byte 1 37
byte 1 105
byte 1 41
byte 1 58
byte 1 37
byte 1 115
byte 1 32
byte 1 121
byte 1 101
byte 1 115
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 110
byte 1 111
byte 1 58
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1149
byte 1 86
byte 1 79
byte 1 84
byte 1 69
byte 1 40
byte 1 37
byte 1 105
byte 1 41
byte 1 58
byte 1 37
byte 1 115
byte 1 32
byte 1 121
byte 1 101
byte 1 115
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 110
byte 1 111
byte 1 58
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1134
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 69
byte 1 83
byte 1 67
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 74
byte 1 79
byte 1 73
byte 1 78
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1129
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1124
byte 1 83
byte 1 80
byte 1 69
byte 1 67
byte 1 84
byte 1 65
byte 1 84
byte 1 79
byte 1 82
byte 1 0
align 1
LABELV $995
byte 1 37
byte 1 105
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $991
byte 1 115
byte 1 110
byte 1 99
byte 1 0
align 1
LABELV $923
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 101
byte 1 116
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $916
byte 1 67
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 73
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 114
byte 1 117
byte 1 112
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $885
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $772
byte 1 37
byte 1 115
byte 1 32
byte 1 120
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $609
byte 1 37
byte 1 50
byte 1 105
byte 1 0
align 1
LABELV $558
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 37
byte 1 51
byte 1 105
byte 1 0
align 1
LABELV $555
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $485
byte 1 37
byte 1 105
byte 1 58
byte 1 37
byte 1 48
byte 1 50
byte 1 105
byte 1 0
align 1
LABELV $480
byte 1 37
byte 1 105
byte 1 102
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $463
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 115
byte 1 110
byte 1 97
byte 1 112
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 99
byte 1 109
byte 1 100
byte 1 58
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $456
byte 1 37
byte 1 49
byte 1 46
byte 1 48
byte 1 102
byte 1 117
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $447
byte 1 110
byte 1 0
align 1
LABELV $110
byte 1 37
byte 1 105
byte 1 0
