export CG_AdjustFrom640
code
proc CG_AdjustFrom640 16 0
file "..\..\..\..\code\cgame\cg_drawtools.c"
line 14
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_drawtools.c -- helper functions called by cg_draw, cg_scoreboard, cg_info, etc
;4:#include "cg_local.h"
;5:
;6:/*
;7:================
;8:CG_AdjustFrom640
;9:
;10:Adjusted for resolution and screen aspect ratio
;11:================
;12:*/
;13:void CG_AdjustFrom640( float *x, float *y, float *w, float *h ) 
;14:{
line 16
;15:	// scale for screen sizes
;16:	*x = *x * cgs.screenXScale + cgs.screenXBias;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRGP4 cgs+31432
INDIRF4
MULF4
ADDRGP4 cgs+31444
INDIRF4
ADDF4
ASGNF4
line 17
;17:	*y = *y * cgs.screenYScale + cgs.screenYBias;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRGP4 cgs+31436
INDIRF4
MULF4
ADDRGP4 cgs+31448
INDIRF4
ADDF4
ASGNF4
line 18
;18:	*w *= cgs.screenXScale;
ADDRLP4 8
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRGP4 cgs+31432
INDIRF4
MULF4
ASGNF4
line 19
;19:	*h *= cgs.screenYScale;
ADDRLP4 12
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRGP4 cgs+31436
INDIRF4
MULF4
ASGNF4
line 20
;20:}
LABELV $73
endproc CG_AdjustFrom640 16 0
export CG_FillRect
proc CG_FillRect 0 36
line 30
;21:
;22:
;23:/*
;24:================
;25:CG_FillRect
;26:
;27:Coordinates are 640*480 virtual values
;28:=================
;29:*/
;30:void CG_FillRect( float x, float y, float width, float height, const float *color ) {
line 31
;31:	trap_R_SetColor( color );
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 33
;32:
;33:	CG_AdjustFrom640( &x, &y, &width, &height );
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
line 34
;34:	trap_R_DrawStretchPic( x, y, width, height, 0, 0, 0, 0, cgs.media.whiteShader );
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
ADDRGP4 cgs+148692+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 36
;35:
;36:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 37
;37:}
LABELV $80
endproc CG_FillRect 0 36
export CG_FillScreen
proc CG_FillScreen 0 36
line 46
;38:
;39:
;40:/*
;41:================
;42:CG_FillScreen
;43:================
;44:*/
;45:void CG_FillScreen( const float *color )
;46:{
line 47
;47:	trap_R_SetColor( color );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 48
;48:	trap_R_DrawStretchPic( 0, 0, cgs.glconfig.vidWidth, cgs.glconfig.vidHeight, 0, 0, 0, 0, cgs.media.whiteShader );
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
ADDRGP4 cgs+20100+11304
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cgs+20100+11308
INDIRI4
CVIF4 4
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
line 49
;49:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 50
;50:}
LABELV $83
endproc CG_FillScreen 0 36
export CG_DrawSides
proc CG_DrawSides 4 36
line 60
;51:
;52:
;53:/*
;54:================
;55:CG_DrawSides
;56:
;57:Coords are virtual 640x480
;58:================
;59:*/
;60:void CG_DrawSides(float x, float y, float w, float h, float size) {
line 61
;61:	CG_AdjustFrom640( &x, &y, &w, &h );
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
line 62
;62:	size *= cgs.screenXScale;
ADDRFP4 16
ADDRFP4 16
INDIRF4
ADDRGP4 cgs+31432
INDIRF4
MULF4
ASGNF4
line 63
;63:	trap_R_DrawStretchPic( x, y, size, h, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 16
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
ADDRGP4 cgs+148692+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 64
;64:	trap_R_DrawStretchPic( x + w - size, y, size, h, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRLP4 0
ADDRFP4 16
INDIRF4
ASGNF4
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ADDRLP4 0
INDIRF4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 0
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
ADDRGP4 cgs+148692+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 65
;65:}
LABELV $90
endproc CG_DrawSides 4 36
export CG_DrawTopBottom
proc CG_DrawTopBottom 4 36
line 68
;66:
;67:
;68:void CG_DrawTopBottom(float x, float y, float w, float h, float size) {
line 69
;69:	CG_AdjustFrom640( &x, &y, &w, &h );
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
line 70
;70:	size *= cgs.screenYScale;
ADDRFP4 16
ADDRFP4 16
INDIRF4
ADDRGP4 cgs+31436
INDIRF4
MULF4
ASGNF4
line 71
;71:	trap_R_DrawStretchPic( x, y, w, size, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 16
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
line 72
;72:	trap_R_DrawStretchPic( x, y + h - size, w, size, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 0
ADDRFP4 16
INDIRF4
ASGNF4
ADDRFP4 4
INDIRF4
ADDRFP4 12
INDIRF4
ADDF4
ADDRLP4 0
INDIRF4
SUBF4
ARGF4
ADDRFP4 8
INDIRF4
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
line 73
;73:}
LABELV $96
endproc CG_DrawTopBottom 4 36
export CG_DrawRect
proc CG_DrawRect 0 20
line 83
;74:
;75:
;76:/*
;77:================
;78:UI_DrawRect
;79:
;80:Coordinates are 640*480 virtual values
;81:=================
;82:*/
;83:void CG_DrawRect( float x, float y, float width, float height, float size, const float *color ) {
line 84
;84:	trap_R_SetColor( color );
ADDRFP4 20
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 86
;85:
;86:	CG_DrawTopBottom(x, y, width, height, size);
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
ADDRFP4 16
INDIRF4
ARGF4
ADDRGP4 CG_DrawTopBottom
CALLV
pop
line 87
;87:	CG_DrawSides(x, y, width, height, size);
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
ADDRFP4 16
INDIRF4
ARGF4
ADDRGP4 CG_DrawSides
CALLV
pop
line 89
;88:
;89:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 90
;90:}
LABELV $102
endproc CG_DrawRect 0 20
export CG_DrawPic
proc CG_DrawPic 0 36
line 100
;91:
;92:
;93:/*
;94:================
;95:CG_DrawPic
;96:
;97:Coordinates are 640*480 virtual values
;98:=================
;99:*/
;100:void CG_DrawPic( float x, float y, float width, float height, qhandle_t hShader ) {
line 101
;101:	CG_AdjustFrom640( &x, &y, &width, &height );
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
line 102
;102:	trap_R_DrawStretchPic( x, y, width, height, 0, 0, 1, 1, hShader );
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
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 103
;103:}
LABELV $103
endproc CG_DrawPic 0 36
proc CG_DrawChar 48 36
line 113
;104:
;105:
;106:/*
;107:===============
;108:CG_DrawChar
;109:
;110:Coordinates and size in 640*480 virtual screen size
;111:===============
;112:*/
;113:static void CG_DrawChar( int x, int y, int width, int height, int ch ) {
line 119
;114:	int row, col;
;115:	float frow, fcol;
;116:	float size;
;117:	float	ax, ay, aw, ah;
;118:
;119:	ch &= 255;
ADDRFP4 16
ADDRFP4 16
INDIRI4
CNSTI4 255
BANDI4
ASGNI4
line 121
;120:
;121:	if ( ch == ' ' ) {
ADDRFP4 16
INDIRI4
CNSTI4 32
NEI4 $105
line 122
;122:		return;
ADDRGP4 $104
JUMPV
LABELV $105
line 125
;123:	}
;124:
;125:	ax = x;
ADDRLP4 12
ADDRFP4 0
INDIRI4
CVIF4 4
ASGNF4
line 126
;126:	ay = y;
ADDRLP4 16
ADDRFP4 4
INDIRI4
CVIF4 4
ASGNF4
line 127
;127:	aw = width;
ADDRLP4 20
ADDRFP4 8
INDIRI4
CVIF4 4
ASGNF4
line 128
;128:	ah = height;
ADDRLP4 24
ADDRFP4 12
INDIRI4
CVIF4 4
ASGNF4
line 129
;129:	CG_AdjustFrom640( &ax, &ay, &aw, &ah );
ADDRLP4 12
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 131
;130:
;131:	row = ch>>4;
ADDRLP4 28
ADDRFP4 16
INDIRI4
CNSTI4 4
RSHI4
ASGNI4
line 132
;132:	col = ch&15;
ADDRLP4 32
ADDRFP4 16
INDIRI4
CNSTI4 15
BANDI4
ASGNI4
line 134
;133:
;134:	frow = row*0.0625;
ADDRLP4 0
ADDRLP4 28
INDIRI4
CVIF4 4
CNSTF4 1031798784
MULF4
ASGNF4
line 135
;135:	fcol = col*0.0625;
ADDRLP4 4
ADDRLP4 32
INDIRI4
CVIF4 4
CNSTF4 1031798784
MULF4
ASGNF4
line 136
;136:	size = 0.0625;
ADDRLP4 8
CNSTF4 1031798784
ASGNF4
line 138
;137:
;138:	trap_R_DrawStretchPic( ax, ay, aw, ah,
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ARGF4
ADDRLP4 0
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ARGF4
ADDRGP4 cgs+148692
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 142
;139:					   fcol, frow, 
;140:					   fcol + size, frow + size, 
;141:					   cgs.media.charsetShader );
;142:}
LABELV $104
endproc CG_DrawChar 48 36
export CG_DrawStringExt
proc CG_DrawStringExt 36 20
line 156
;143:
;144:
;145:/*
;146:==================
;147:CG_DrawStringExt
;148:
;149:Draws a multi-colored string with a drop shadow, optionally forcing
;150:to a fixed color.
;151:
;152:Coordinates are at 640 by 480 virtual resolution
;153:==================
;154:*/
;155:void CG_DrawStringExt( int x, int y, const char *string, const float *setColor, 
;156:		qboolean forceColor, qboolean shadow, int charWidth, int charHeight, int maxChars ) {
line 162
;157:	vec4_t		color;
;158:	const char	*s;
;159:	int			xx;
;160:	int			cnt;
;161:
;162:	if (maxChars <= 0)
ADDRFP4 32
INDIRI4
CNSTI4 0
GTI4 $109
line 163
;163:		maxChars = 32767; // do them all!
ADDRFP4 32
CNSTI4 32767
ASGNI4
LABELV $109
line 166
;164:
;165:	// draw the drop shadow
;166:	if (shadow) {
ADDRFP4 20
INDIRI4
CNSTI4 0
EQI4 $111
line 167
;167:		color[0] = color[1] = color[2] = 0;
ADDRLP4 28
CNSTF4 0
ASGNF4
ADDRLP4 12+8
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 28
INDIRF4
ASGNF4
line 168
;168:		color[3] = setColor[3];
ADDRLP4 12+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 169
;169:		trap_R_SetColor( color );
ADDRLP4 12
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 170
;170:		s = string;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
line 171
;171:		xx = x;
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
line 172
;172:		cnt = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $117
JUMPV
LABELV $116
line 173
;173:		while ( *s && cnt < maxChars) {
line 174
;174:			if ( Q_IsColorString( s ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $119
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $119
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $119
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 94
EQI4 $119
line 175
;175:				s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 176
;176:				continue;
ADDRGP4 $117
JUMPV
LABELV $119
line 178
;177:			}
;178:			CG_DrawChar( xx + 2, y + 2, charWidth, charHeight, *s );
ADDRLP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRGP4 CG_DrawChar
CALLV
pop
line 179
;179:			cnt++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 180
;180:			xx += charWidth;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRFP4 24
INDIRI4
ADDI4
ASGNI4
line 181
;181:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 182
;182:		}
LABELV $117
line 173
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $121
ADDRLP4 8
INDIRI4
ADDRFP4 32
INDIRI4
LTI4 $116
LABELV $121
line 183
;183:	}
LABELV $111
line 186
;184:
;185:	// draw the colored text
;186:	s = string;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
line 187
;187:	xx = x;
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
line 188
;188:	cnt = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 189
;189:	trap_R_SetColor( setColor );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
ADDRGP4 $123
JUMPV
LABELV $122
line 190
;190:	while ( *s && cnt < maxChars) {
line 191
;191:		if ( Q_IsColorString( s ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $125
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $125
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $125
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 94
EQI4 $125
line 192
;192:			if ( !forceColor ) {
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $127
line 193
;193:				memcpy( color, g_color_table[ColorIndex(*(s+1))], sizeof( color ) );
ADDRLP4 12
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
line 194
;194:				color[3] = setColor[3];
ADDRLP4 12+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 195
;195:				trap_R_SetColor( color );
ADDRLP4 12
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 196
;196:			}
LABELV $127
line 197
;197:			s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 198
;198:			continue;
ADDRGP4 $123
JUMPV
LABELV $125
line 200
;199:		}
;200:		CG_DrawChar( xx, y, charWidth, charHeight, *s );
ADDRLP4 4
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRGP4 CG_DrawChar
CALLV
pop
line 201
;201:		xx += charWidth;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRFP4 24
INDIRI4
ADDI4
ASGNI4
line 202
;202:		cnt++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 203
;203:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 204
;204:	}
LABELV $123
line 190
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $130
ADDRLP4 8
INDIRI4
ADDRFP4 32
INDIRI4
LTI4 $122
LABELV $130
line 205
;205:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 206
;206:}
LABELV $108
endproc CG_DrawStringExt 36 20
data
align 4
LABELV font
address bigchars
align 4
LABELV metrics
address bigchars
export CG_SelectFont
code
proc CG_SelectFont 0 0
line 237
;207:
;208:
;209:// new font renderer
;210:
;211:#ifdef USE_NEW_FONT_RENDERER
;212:
;213:#define MAX_FONT_SHADERS 4
;214:
;215:typedef struct {
;216:	float tc_prop[4];
;217:	float tc_mono[4];
;218:	float space1;
;219:	float space2;
;220:	float width;
;221:} font_metric_t;
;222:
;223:typedef struct {
;224:	font_metric_t	metrics[256];
;225:	qhandle_t		shader[ MAX_FONT_SHADERS ];
;226:	int				shaderThreshold[ MAX_FONT_SHADERS ];
;227:	int				shaderCount;
;228:} font_t;
;229:
;230:static font_t bigchars;
;231:static font_t numbers;
;232:static const font_t *font = &bigchars;
;233:static const font_metric_t *metrics = &bigchars.metrics[0];
;234:
;235:
;236:void CG_SelectFont( int index ) 
;237:{
line 238
;238:	if ( index == 0 )
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $134
line 239
;239:		font = &bigchars;
ADDRGP4 font
ADDRGP4 bigchars
ASGNP4
ADDRGP4 $135
JUMPV
LABELV $134
line 241
;240:	else
;241:		font = &numbers;
ADDRGP4 font
ADDRGP4 numbers
ASGNP4
LABELV $135
line 243
;242:
;243:	metrics = &font->metrics[0];
ADDRGP4 metrics
ADDRGP4 font
INDIRP4
ASGNP4
line 244
;244:}
LABELV $133
endproc CG_SelectFont 0 0
proc CG_FileExist 8 12
line 248
;245:
;246:
;247:static qboolean CG_FileExist( const char *file )
;248:{
line 251
;249:	fileHandle_t	f;
;250:
;251:	if ( !file || !file[0] )
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $139
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $137
LABELV $139
line 252
;252:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $136
JUMPV
LABELV $137
line 254
;253:	
;254:	trap_FS_FOpenFile( file, &f, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_FS_FOpenFile
CALLI4
pop
line 255
;255:	if ( f == FS_INVALID_HANDLE )
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $140
line 256
;256:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $136
JUMPV
LABELV $140
line 257
;257:	else {
line 258
;258:		trap_FS_FCloseFile( f );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 259
;259:		return qtrue;
CNSTI4 1
RETI4
LABELV $136
endproc CG_FileExist 8 12
proc CG_LoadFont 8508 16
line 265
;260:	}
;261:}
;262:
;263:
;264:static void CG_LoadFont( font_t *fnt, const char *fontName )
;265:{
line 282
;266:	char buf[ 8000 ];
;267:	fileHandle_t f;
;268:	char *token, *text;
;269:	float width, height, r_width, r_height;
;270:	float char_width;
;271:	float char_height;
;272:	char shaderName[ MAX_FONT_SHADERS ][ MAX_QPATH ], tmpName[ MAX_QPATH ];
;273:	int shaderCount;
;274:	int shaderThreshold[ MAX_FONT_SHADERS ];
;275:	font_metric_t *fm;
;276:	int i, tmp, len, chars;
;277:	float w1, w2;
;278:	float s1, s2;
;279:	float x0, y0;
;280:	qboolean swapped;
;281:
;282:	memset( fnt, 0, sizeof( *fnt ) );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 11300
ARGI4
ADDRGP4 memset
CALLP4
pop
line 284
;283:
;284:	len = trap_FS_FOpenFile( fontName, &f, FS_READ );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8420
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8424
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 416
ADDRLP4 8424
INDIRI4
ASGNI4
line 285
;285:	if ( f == FS_INVALID_HANDLE ) {
ADDRLP4 8420
INDIRI4
CNSTI4 0
NEI4 $143
line 286
;286:		CG_Printf( S_COLOR_YELLOW "CG_LoadFont: error opening %s\n", fontName );
ADDRGP4 $145
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 287
;287:		return;
ADDRGP4 $142
JUMPV
LABELV $143
line 290
;288:	}
;289:
;290:	if ( len >= sizeof( buf ) ) {
ADDRLP4 416
INDIRI4
CVIU4 4
CNSTU4 8000
LTU4 $146
line 291
;291:		CG_Printf( S_COLOR_YELLOW "CG_LoadFont: font file is too long: %i\n", len );
ADDRGP4 $148
ARGP4
ADDRLP4 416
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 292
;292:		len = sizeof( buf )-1;
ADDRLP4 416
CNSTI4 7999
ASGNI4
line 293
;293:	}
LABELV $146
line 295
;294:
;295:	trap_FS_Read( buf, len, f );
ADDRLP4 420
ARGP4
ADDRLP4 416
INDIRI4
ARGI4
ADDRLP4 8420
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 296
;296:	trap_FS_FCloseFile( f );
ADDRLP4 8420
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 297
;297:	buf[ len ] = '\0';
ADDRLP4 416
INDIRI4
ADDRLP4 420
ADDP4
CNSTI1 0
ASGNI1
line 299
;298:
;299:	shaderCount = 0;
ADDRLP4 284
CNSTI4 0
ASGNI4
line 301
;300:
;301:	text = buf; // initialize parser
ADDRLP4 288
ADDRLP4 420
ASGNP4
line 302
;302:	COM_BeginParseSession( fontName );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 COM_BeginParseSession
CALLV
pop
ADDRGP4 $150
JUMPV
LABELV $149
line 305
;303:
;304:	while ( 1 )
;305:	{
line 306
;306:		token = COM_ParseExt( &text, qtrue );
ADDRLP4 288
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 8428
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 8428
INDIRP4
ASGNP4
line 307
;307:		if ( token[0] == '\0' ) {
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $152
line 308
;308:			Com_Printf( S_COLOR_RED "CG_LoadFont: parse error.\n" );
ADDRGP4 $154
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 309
;309:			return;
ADDRGP4 $142
JUMPV
LABELV $152
line 313
;310:		}
;311:
;312:		// font image
;313:		if ( strcmp( token, "img" ) == 0 ) {
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 $157
ARGP4
ADDRLP4 8432
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8432
INDIRI4
CNSTI4 0
NEI4 $155
line 314
;314:			if ( shaderCount >= MAX_FONT_SHADERS ) {
ADDRLP4 284
INDIRI4
CNSTI4 4
LTI4 $158
line 315
;315:				Com_Printf( "CG_LoadFont: too many font images, ignoring.\n" );
ADDRGP4 $160
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 316
;316:				SkipRestOfLine( &text );
ADDRLP4 288
ARGP4
ADDRGP4 SkipRestOfLine
CALLV
pop
line 317
;317:				continue;
ADDRGP4 $150
JUMPV
LABELV $158
line 319
;318:			}
;319:			token = COM_ParseExt( &text, qfalse );
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8436
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 8436
INDIRP4
ASGNP4
line 320
;320:			if ( !CG_FileExist( token ) ) {
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 8440
ADDRGP4 CG_FileExist
CALLI4
ASGNI4
ADDRLP4 8440
INDIRI4
CNSTI4 0
NEI4 $161
line 321
;321:				Com_Printf( "CG_LoadFont: font image '%s' doesn't exist.\n", token );
ADDRGP4 $163
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 322
;322:				return;
ADDRGP4 $142
JUMPV
LABELV $161
line 325
;323:			}
;324:			// save shader name
;325:			Q_strncpyz( shaderName[ shaderCount ], token, sizeof( shaderName[ shaderCount ] ) );
ADDRLP4 284
INDIRI4
CNSTI4 6
LSHI4
ADDRLP4 24
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 327
;326:			// get threshold
;327:			token = COM_ParseExt( &text, qfalse );
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8444
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 8444
INDIRP4
ASGNP4
line 328
;328:			shaderThreshold[ shaderCount ] = atoi( token );
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 8448
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 8448
INDIRI4
ASGNI4
line 331
;329:
;330:			//Com_Printf( S_COLOR_CYAN "img: %s, threshold: %i\n", shaderName[ shaderCount ], shaderThreshold[ shaderCount ] );
;331:			shaderCount++;
ADDRLP4 284
ADDRLP4 284
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 333
;332:			
;333:			SkipRestOfLine( &text );
ADDRLP4 288
ARGP4
ADDRGP4 SkipRestOfLine
CALLV
pop
line 334
;334:			continue;
ADDRGP4 $150
JUMPV
LABELV $155
line 338
;335:		}
;336:
;337:		// font parameters
;338:		if ( strcmp( token, "fnt" ) == 0 ) {
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 $166
ARGP4
ADDRLP4 8436
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8436
INDIRI4
CNSTI4 0
NEI4 $164
line 339
;339:			token = COM_ParseExt( &text, qfalse );
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8440
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 8440
INDIRP4
ASGNP4
line 340
;340:			if ( token[0] == '\0' || (width = atof( token )) <= 0.0 ) {
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $169
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 8448
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 408
ADDRLP4 8448
INDIRF4
ASGNF4
ADDRLP4 8448
INDIRF4
CNSTF4 0
GTF4 $167
LABELV $169
line 341
;341:				Com_Printf( "CG_LoadFont: error reading image width.\n" );
ADDRGP4 $170
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 342
;342:				return;
ADDRGP4 $142
JUMPV
LABELV $167
line 344
;343:			}
;344:			r_width = 1.0 / width;
ADDRLP4 364
CNSTF4 1065353216
ADDRLP4 408
INDIRF4
DIVF4
ASGNF4
line 346
;345:
;346:			token = COM_ParseExt( &text, qfalse );
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8452
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 8452
INDIRP4
ASGNP4
line 347
;347:			if ( token[0] == '\0' || (height = atof( token )) <= 0.0 ) {
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $173
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 8460
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 412
ADDRLP4 8460
INDIRF4
ASGNF4
ADDRLP4 8460
INDIRF4
CNSTF4 0
GTF4 $171
LABELV $173
line 348
;348:				Com_Printf( "CG_LoadFont: error reading image height.\n" );
ADDRGP4 $174
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 349
;349:				return;
ADDRGP4 $142
JUMPV
LABELV $171
line 351
;350:			}
;351:			r_height = 1.0 / height;
ADDRLP4 384
CNSTF4 1065353216
ADDRLP4 412
INDIRF4
DIVF4
ASGNF4
line 353
;352:			
;353:			token = COM_ParseExt( &text, qfalse );
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8464
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 8464
INDIRP4
ASGNP4
line 354
;354:			if ( token[0] == '\0' ) {
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $175
line 355
;355:				Com_Printf( "CG_LoadFont: error reading char widht.\n" );
ADDRGP4 $177
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 356
;356:				return;
ADDRGP4 $142
JUMPV
LABELV $175
line 358
;357:			}
;358:			char_width = atof( token );
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 8468
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 368
ADDRLP4 8468
INDIRF4
ASGNF4
line 360
;359:
;360:			token = COM_ParseExt( &text, qfalse );
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8472
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 8472
INDIRP4
ASGNP4
line 361
;361:			if ( token[0] == '\0' ) {
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $178
line 362
;362:				Com_Printf( "CG_LoadFont: error reading char height.\n" );
ADDRGP4 $180
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 363
;363:				return;
ADDRGP4 $142
JUMPV
LABELV $178
line 365
;364:			}
;365:			char_height = atof( token );
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 8476
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 400
ADDRLP4 8476
INDIRF4
ASGNF4
line 367
;366:
;367:			break; // parse char metrics
ADDRGP4 $151
JUMPV
LABELV $164
line 369
;368:		}
;369:	}
LABELV $150
line 304
ADDRGP4 $149
JUMPV
LABELV $151
line 371
;370:
;371:	if ( shaderCount == 0 ) {
ADDRLP4 284
INDIRI4
CNSTI4 0
NEI4 $181
line 372
;372:		Com_Printf( "CG_LoadFont: no font images specified in %s.\n", fontName );
ADDRGP4 $183
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 373
;373:		return;
ADDRGP4 $142
JUMPV
LABELV $181
line 376
;374:	}
;375:
;376:	fm = fnt->metrics;
ADDRLP4 280
ADDRFP4 0
INDIRP4
ASGNP4
line 378
;377:
;378:	chars = 0;
ADDRLP4 404
CNSTI4 0
ASGNI4
line 379
;379:	for ( ;; ) {
LABELV $184
line 381
;380:		// char index
;381:		token = COM_ParseExt( &text, qtrue );
ADDRLP4 288
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 8428
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 8428
INDIRP4
ASGNP4
line 382
;382:		if ( !token[0] )
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $188
line 383
;383:			break;
ADDRGP4 $186
JUMPV
LABELV $188
line 385
;384:
;385:		if ( token[0] == '\'' && token[1] && token[2] == '\'' ) // char code in form 'X'
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 39
NEI4 $190
ADDRLP4 20
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $190
ADDRLP4 20
INDIRP4
CNSTI4 2
ADDP4
INDIRI1
CVII4 1
CNSTI4 39
NEI4 $190
line 386
;386:			i = token[1] & 255;
ADDRLP4 0
ADDRLP4 20
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 255
BANDI4
ASGNI4
ADDRGP4 $191
JUMPV
LABELV $190
line 388
;387:		else // integer code
;388:			i = atoi( token );
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 8436
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8436
INDIRI4
ASGNI4
LABELV $191
line 390
;389:
;390:		if ( i < 0 || i > 255 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $194
ADDRLP4 0
INDIRI4
CNSTI4 255
LEI4 $192
LABELV $194
line 391
;391:			CG_Printf( S_COLOR_RED "CG_LoadFont: bad char index %i.\n", i );
ADDRGP4 $195
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 392
;392:			return;
ADDRGP4 $142
JUMPV
LABELV $192
line 394
;393:		}
;394:		fm = fnt->metrics + i;
ADDRLP4 280
ADDRLP4 0
INDIRI4
CNSTI4 44
MULI4
ADDRFP4 0
INDIRP4
ADDP4
ASGNP4
line 397
;395:
;396:		// x0
;397:		token = COM_ParseExt( &text, qfalse );
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8444
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 8444
INDIRP4
ASGNP4
line 398
;398:		if ( !token[0] ) {
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $196
line 399
;399:			CG_Printf( S_COLOR_RED "CG_LoadFont: error reading x0.\n" );
ADDRGP4 $198
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 400
;400:			return;
ADDRGP4 $142
JUMPV
LABELV $196
line 402
;401:		}
;402:		x0 = atof( token );
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 8448
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 376
ADDRLP4 8448
INDIRF4
ASGNF4
line 405
;403:	
;404:		// y0
;405:		token = COM_ParseExt( &text, qfalse );
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8452
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 8452
INDIRP4
ASGNP4
line 406
;406:		if ( !token[0] ) {
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $199
line 407
;407:			CG_Printf( S_COLOR_RED "CG_LoadFont: error reading y0.\n" );
ADDRGP4 $201
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 408
;408:			return;
ADDRGP4 $142
JUMPV
LABELV $199
line 410
;409:		}
;410:		y0 = atof( token );
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 8456
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 380
ADDRLP4 8456
INDIRF4
ASGNF4
line 413
;411:		
;412:		// w1-offset
;413:		token = COM_ParseExt( &text, qfalse );
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8460
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 8460
INDIRP4
ASGNP4
line 414
;414:		if ( !token[0] ) {
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $202
line 415
;415:			CG_Printf( S_COLOR_RED "CG_LoadFont: error reading x-offset.\n" );
ADDRGP4 $204
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 416
;416:			return;
ADDRGP4 $142
JUMPV
LABELV $202
line 418
;417:		}
;418:		w1 = atof( token );
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 8464
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 388
ADDRLP4 8464
INDIRF4
ASGNF4
line 421
;419:
;420:		// w2-offset
;421:		token = COM_ParseExt( &text, qfalse );
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8468
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 8468
INDIRP4
ASGNP4
line 422
;422:		if ( !token[0] ) {
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $205
line 423
;423:			CG_Printf( S_COLOR_RED "CG_LoadFont: error reading x-length.\n" );
ADDRGP4 $207
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 424
;424:			return;
ADDRGP4 $142
JUMPV
LABELV $205
line 426
;425:		}
;426:		w2 = atof( token );
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 8472
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 372
ADDRLP4 8472
INDIRF4
ASGNF4
line 429
;427:
;428:		// space1
;429:		token = COM_ParseExt( &text, qfalse );
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8476
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 8476
INDIRP4
ASGNP4
line 430
;430:		if ( !token[0] ) {
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $208
line 431
;431:			CG_Printf( S_COLOR_RED "CG_LoadFont: error reading space1.\n" );
ADDRGP4 $210
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 432
;432:			return;
ADDRGP4 $142
JUMPV
LABELV $208
line 434
;433:		}
;434:		s1 = atof( token );
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 8480
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 392
ADDRLP4 8480
INDIRF4
ASGNF4
line 437
;435:
;436:		// space2
;437:		token = COM_ParseExt( &text, qfalse );
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8484
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 8484
INDIRP4
ASGNP4
line 438
;438:		if ( !token[0] ) {
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $211
line 439
;439:			CG_Printf( S_COLOR_RED "CG_LoadFont: error reading space2.\n" );
ADDRGP4 $213
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 440
;440:			return;
ADDRGP4 $142
JUMPV
LABELV $211
line 442
;441:		}
;442:		s2 = atof( token );
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 8488
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 396
ADDRLP4 8488
INDIRF4
ASGNF4
line 444
;443:
;444:		fm->tc_mono[0] = x0 * r_width;
ADDRLP4 280
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 376
INDIRF4
ADDRLP4 364
INDIRF4
MULF4
ASGNF4
line 445
;445:		fm->tc_mono[1] = y0 * r_height;
ADDRLP4 280
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 380
INDIRF4
ADDRLP4 384
INDIRF4
MULF4
ASGNF4
line 446
;446:		fm->tc_mono[2] = ( x0 + char_width ) * r_width;
ADDRLP4 280
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 376
INDIRF4
ADDRLP4 368
INDIRF4
ADDF4
ADDRLP4 364
INDIRF4
MULF4
ASGNF4
line 447
;447:		fm->tc_mono[3] = ( y0 + char_height ) * r_height;
ADDRLP4 280
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 380
INDIRF4
ADDRLP4 400
INDIRF4
ADDF4
ADDRLP4 384
INDIRF4
MULF4
ASGNF4
line 450
;448:
;449:		// proportional y-coords is matching with mono
;450:		fm->tc_prop[1] = fm->tc_mono[1];
ADDRLP4 280
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 280
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ASGNF4
line 451
;451:		fm->tc_prop[3] = fm->tc_mono[3];
ADDRLP4 280
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 280
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ASGNF4
line 453
;452:
;453:		fm->width = w2 / char_width;
ADDRLP4 280
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 372
INDIRF4
ADDRLP4 368
INDIRF4
DIVF4
ASGNF4
line 454
;454:		fm->space1 = s1 / char_width;
ADDRLP4 280
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 392
INDIRF4
ADDRLP4 368
INDIRF4
DIVF4
ASGNF4
line 455
;455:		fm->space2 = (s2 + w2) / char_width;
ADDRLP4 280
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 396
INDIRF4
ADDRLP4 372
INDIRF4
ADDF4
ADDRLP4 368
INDIRF4
DIVF4
ASGNF4
line 456
;456:		fm->tc_prop[0] = fm->tc_mono[0] + (w1 * r_width);
ADDRLP4 280
INDIRP4
ADDRLP4 280
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 388
INDIRF4
ADDRLP4 364
INDIRF4
MULF4
ADDF4
ASGNF4
line 457
;457:		fm->tc_prop[2] = fm->tc_prop[0] + (w2 * r_width);
ADDRLP4 280
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 280
INDIRP4
INDIRF4
ADDRLP4 372
INDIRF4
ADDRLP4 364
INDIRF4
MULF4
ADDF4
ASGNF4
line 459
;458:
;459:		chars++;
ADDRLP4 404
ADDRLP4 404
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 461
;460:
;461:		SkipRestOfLine( &text );
ADDRLP4 288
ARGP4
ADDRGP4 SkipRestOfLine
CALLV
pop
line 462
;462:	}
line 379
ADDRGP4 $184
JUMPV
LABELV $186
LABELV $214
line 465
;463:
;464:	// sort images by threshold
;465:	do {
line 466
;466:		for ( swapped = qfalse, i = 1 ; i < shaderCount; i++ ) {
ADDRLP4 360
CNSTI4 0
ASGNI4
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $220
JUMPV
LABELV $217
line 467
;467:			if ( shaderThreshold[i-1] > shaderThreshold[i] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
LEI4 $221
line 468
;468:				tmp = shaderThreshold[i-1];
ADDRLP4 356
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ASGNI4
line 469
;469:				shaderThreshold[i-1] = shaderThreshold[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ASGNI4
line 470
;470:				shaderThreshold[i] = tmp;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 356
INDIRI4
ASGNI4
line 471
;471:				strcpy( tmpName, shaderName[i-1] );
ADDRLP4 292
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRLP4 24-64
ADDP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 472
;472:				strcpy( shaderName[i-1], shaderName[i] );
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRLP4 24-64
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRLP4 24
ADDP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 473
;473:				strcpy( shaderName[i], tmpName );
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRLP4 24
ADDP4
ARGP4
ADDRLP4 292
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 474
;474:				swapped = qtrue;
ADDRLP4 360
CNSTI4 1
ASGNI4
line 475
;475:			}
LABELV $221
line 476
;476:		}
LABELV $218
line 466
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $220
ADDRLP4 0
INDIRI4
ADDRLP4 284
INDIRI4
LTI4 $217
line 477
;477:	} while ( swapped );
LABELV $215
ADDRLP4 360
INDIRI4
CNSTI4 0
NEI4 $214
line 480
;478:
;479:	// always assume zero threshold for lowest-quality shader
;480:	shaderThreshold[0] = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 482
;481:	
;482:	fnt->shaderCount = shaderCount;
ADDRFP4 0
INDIRP4
CNSTI4 11296
ADDP4
ADDRLP4 284
INDIRI4
ASGNI4
line 483
;483:	for ( i = 0; i < shaderCount; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $231
JUMPV
LABELV $228
line 484
;484:		fnt->shader[i] = trap_R_RegisterShaderNoMip( shaderName[i] );
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRLP4 24
ADDP4
ARGP4
ADDRLP4 8432
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 11264
ADDP4
ADDP4
ADDRLP4 8432
INDIRI4
ASGNI4
line 485
;485:		fnt->shaderThreshold[i] = shaderThreshold[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 11280
ADDP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ASGNI4
line 486
;486:	}
LABELV $229
line 483
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $231
ADDRLP4 0
INDIRI4
ADDRLP4 284
INDIRI4
LTI4 $228
line 488
;487:
;488:	CG_Printf( "Font '%s' loaded with %i chars and %i images\n", fontName, chars, shaderCount );
ADDRGP4 $232
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 404
INDIRI4
ARGI4
ADDRLP4 284
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 489
;489:}
LABELV $142
endproc CG_LoadFont 8508 16
export CG_LoadFonts
proc CG_LoadFonts 0 8
line 493
;490:
;491:
;492:void CG_LoadFonts( void ) 
;493:{
line 494
;494:	CG_LoadFont( &bigchars, "gfx/2d/bigchars.cfg" );
ADDRGP4 bigchars
ARGP4
ADDRGP4 $234
ARGP4
ADDRGP4 CG_LoadFont
CALLV
pop
line 495
;495:	CG_LoadFont( &numbers, "gfx/2d/numbers.cfg" );
ADDRGP4 numbers
ARGP4
ADDRGP4 $235
ARGP4
ADDRGP4 CG_LoadFont
CALLV
pop
line 496
;496:}
LABELV $233
endproc CG_LoadFonts 0 8
proc DrawStringLength 20 0
line 500
;497:
;498:
;499:static float DrawStringLength( const char *string, float ax, float aw, float max_ax, int proportional )
;500:{
line 507
;501:	const font_metric_t	*fm;
;502:	//float			aw1;
;503:	float			x_end;
;504:	const byte		*s;
;505:	float			xx;
;506:
;507:	if ( !string )
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $237
line 508
;508:		return 0.0f;
CNSTF4 0
RETF4
ADDRGP4 $236
JUMPV
LABELV $237
line 510
;509:
;510:	s = (const byte*)string;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 512
;511:
;512:	xx = ax;
ADDRLP4 12
ADDRFP4 4
INDIRF4
ASGNF4
ADDRGP4 $240
JUMPV
LABELV $239
line 514
;513:
;514:	while ( *s != '\0' ) {
line 516
;515:
;516:		if ( *s == Q_COLOR_ESCAPE && s[1] != '\0' && s[1] != '^' ) {
ADDRLP4 0
INDIRP4
INDIRU1
CVUI4 1
CNSTI4 94
NEI4 $242
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRU1
CVUI4 1
CNSTI4 0
EQI4 $242
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRU1
CVUI4 1
CNSTI4 94
EQI4 $242
line 518
;517:			//if ( !(flags & DS_SHOW_CODE) ) {
;518:			s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 519
;519:			continue;
ADDRGP4 $240
JUMPV
LABELV $242
line 524
;520:			//}
;521:		}
;522:
;523:		//fm = &font->metrics[ *s ];
;524:		fm = &metrics[ *s ];
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRU1
CVUI4 1
CNSTI4 44
MULI4
ADDRGP4 metrics
INDIRP4
ADDP4
ASGNP4
line 525
;525:		if ( proportional ) {
ADDRFP4 16
INDIRI4
CNSTI4 0
EQI4 $244
line 527
;526:			//aw1 = fm->width * aw;
;527:			ax += fm->space1 * aw;			// add extra space if required by metrics
ADDRFP4 4
ADDRFP4 4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ADDF4
ASGNF4
line 528
;528:			x_end = ax + fm->space2 * aw;	// final position
ADDRLP4 4
ADDRFP4 4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ADDF4
ASGNF4
line 529
;529:		} else {
ADDRGP4 $245
JUMPV
LABELV $244
line 531
;530:			//aw1 = aw;
;531:			x_end = ax + aw;
ADDRLP4 4
ADDRFP4 4
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ASGNF4
line 532
;532:		}
LABELV $245
line 534
;533:
;534:		if ( x_end > max_ax ) 
ADDRLP4 4
INDIRF4
ADDRFP4 12
INDIRF4
LEF4 $246
line 535
;535:			break;
ADDRGP4 $241
JUMPV
LABELV $246
line 537
;536:
;537:		ax = x_end;
ADDRFP4 4
ADDRLP4 4
INDIRF4
ASGNF4
line 538
;538:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 539
;539:	}
LABELV $240
line 514
ADDRLP4 0
INDIRP4
INDIRU1
CVUI4 1
CNSTI4 0
NEI4 $239
LABELV $241
line 541
;540:
;541:	return (ax - xx);
ADDRFP4 4
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
RETF4
LABELV $236
endproc DrawStringLength 20 0
export CG_DrawString
proc CG_DrawString 96 36
line 546
;542:}
;543:
;544:
;545:void CG_DrawString( float x, float y, const char *string, const vec4_t setColor, float charWidth, float charHeight, int maxChars, int flags ) 
;546:{
line 560
;547:	const font_metric_t *fm;
;548:	const float		*tc; // texture coordinates for char
;549:	float			ax, ay, aw, aw1, ah; // absolute positions/dimensions
;550:	float			scale;
;551:	float			x_end, xx;
;552:	vec4_t			color;
;553:	const byte		*s;
;554:	float			xx_add, yy_add;
;555:	float			max_ax;
;556:	int				i;
;557:	qhandle_t		sh;
;558:	int				proportional;
;559:
;560:	if ( !string )
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $249
line 561
;561:		return;
ADDRGP4 $248
JUMPV
LABELV $249
line 563
;562:
;563:	s = (const byte *)string;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
line 565
;564:
;565:	ax = x * cgs.screenXScale + cgs.screenXBias;
ADDRLP4 8
ADDRFP4 0
INDIRF4
ADDRGP4 cgs+31432
INDIRF4
MULF4
ADDRGP4 cgs+31444
INDIRF4
ADDF4
ASGNF4
line 566
;566:	ay = y * cgs.screenYScale + cgs.screenYBias;
ADDRLP4 48
ADDRFP4 4
INDIRF4
ADDRGP4 cgs+31436
INDIRF4
MULF4
ADDRGP4 cgs+31448
INDIRF4
ADDF4
ASGNF4
line 568
;567:
;568:	aw = charWidth * cgs.screenXScale;
ADDRLP4 20
ADDRFP4 16
INDIRF4
ADDRGP4 cgs+31432
INDIRF4
MULF4
ASGNF4
line 569
;569:	ah = charHeight * cgs.screenYScale;
ADDRLP4 32
ADDRFP4 20
INDIRF4
ADDRGP4 cgs+31436
INDIRF4
MULF4
ASGNF4
line 571
;570:
;571:	if ( maxChars <= 0 ) {
ADDRFP4 24
INDIRI4
CNSTI4 0
GTI4 $257
line 572
;572:		max_ax = 9999999.0f;
ADDRLP4 40
CNSTF4 1259902591
ASGNF4
line 573
;573:	} else {
ADDRGP4 $258
JUMPV
LABELV $257
line 574
;574:		max_ax = ax + aw * maxChars;
ADDRLP4 40
ADDRLP4 8
INDIRF4
ADDRLP4 20
INDIRF4
ADDRFP4 24
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 575
;575:	}
LABELV $258
line 577
;576:
;577:	proportional = (flags & DS_PROPORTIONAL);
ADDRLP4 44
ADDRFP4 28
INDIRI4
CNSTI4 4
BANDI4
ASGNI4
line 579
;578:
;579:	if ( flags & ( DS_CENTER | DS_RIGHT ) ) {
ADDRFP4 28
INDIRI4
CNSTI4 24
BANDI4
CNSTI4 0
EQI4 $259
line 580
;580:		if ( flags & DS_CENTER ) {
ADDRFP4 28
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $261
line 581
;581:			ax -= 0.5f * DrawStringLength( string, ax, aw, max_ax, proportional );
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 40
INDIRF4
ARGF4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 DrawStringLength
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 88
INDIRF4
CNSTF4 1056964608
MULF4
SUBF4
ASGNF4
line 582
;582:		} else {
ADDRGP4 $262
JUMPV
LABELV $261
line 583
;583:			ax -= DrawStringLength( string, ax, aw, max_ax, proportional );
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 40
INDIRF4
ARGF4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 DrawStringLength
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 88
INDIRF4
SUBF4
ASGNF4
line 584
;584:		}
LABELV $262
line 585
;585:	}
LABELV $259
line 587
;586:
;587:	sh = font->shader[0]; // low-res shader by default
ADDRLP4 36
ADDRGP4 font
INDIRP4
CNSTI4 11264
ADDP4
INDIRI4
ASGNI4
line 589
;588:
;589:	if ( flags & DS_SHADOW ) { 
ADDRFP4 28
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $263
line 590
;590:		xx = ax;
ADDRLP4 80
ADDRLP4 8
INDIRF4
ASGNF4
line 593
;591:
;592:		// calculate shadow offsets
;593:		scale = charWidth * 0.075f; // charWidth/15
ADDRLP4 76
ADDRFP4 16
INDIRF4
CNSTF4 1033476506
MULF4
ASGNF4
line 594
;594:		xx_add = scale * cgs.screenXScale;
ADDRLP4 68
ADDRLP4 76
INDIRF4
ADDRGP4 cgs+31432
INDIRF4
MULF4
ASGNF4
line 595
;595:		yy_add = scale * cgs.screenYScale;
ADDRLP4 72
ADDRLP4 76
INDIRF4
ADDRGP4 cgs+31436
INDIRF4
MULF4
ASGNF4
line 597
;596:
;597:		color[0] = color[1] = color[2] = 0.0f;
ADDRLP4 84
CNSTF4 0
ASGNF4
ADDRLP4 52+8
ADDRLP4 84
INDIRF4
ASGNF4
ADDRLP4 52+4
ADDRLP4 84
INDIRF4
ASGNF4
ADDRLP4 52
ADDRLP4 84
INDIRF4
ASGNF4
line 598
;598:		color[3] = setColor[3] * 0.5f;
ADDRLP4 52+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 599
;599:		trap_R_SetColor( color );
ADDRLP4 52
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
ADDRGP4 $271
JUMPV
LABELV $270
line 601
;600:
;601:		while ( *s != '\0' ) {
line 602
;602:			if ( *s == Q_COLOR_ESCAPE && s[1] != '\0' && s[1] != '^' ) {
ADDRLP4 0
INDIRP4
INDIRU1
CVUI4 1
CNSTI4 94
NEI4 $273
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRU1
CVUI4 1
CNSTI4 0
EQI4 $273
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRU1
CVUI4 1
CNSTI4 94
EQI4 $273
line 604
;603:				//if ( !(options & DS_SHOW_CODE) ) {
;604:				s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 605
;605:				continue;
ADDRGP4 $271
JUMPV
LABELV $273
line 609
;606:				//}
;607:			}
;608:			//fm = &font->metrics[ *s ];
;609:			fm = &metrics[ *s ];
ADDRLP4 12
ADDRLP4 0
INDIRP4
INDIRU1
CVUI4 1
CNSTI4 44
MULI4
ADDRGP4 metrics
INDIRP4
ADDP4
ASGNP4
line 610
;610:			if ( proportional ) {
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $275
line 611
;611:				tc = fm->tc_prop;
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 612
;612:				aw1 = fm->width * aw;
ADDRLP4 28
ADDRLP4 12
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ASGNF4
line 613
;613:				ax += fm->space1 * aw;			// add extra space if required by metrics
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
line 614
;614:				x_end = ax + fm->space2 * aw;	// final position
ADDRLP4 16
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
line 615
;615:			} else {
ADDRGP4 $276
JUMPV
LABELV $275
line 616
;616:				tc = fm->tc_mono;
ADDRLP4 4
ADDRLP4 12
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
line 617
;617:				aw1 = aw;
ADDRLP4 28
ADDRLP4 20
INDIRF4
ASGNF4
line 618
;618:				x_end = ax + aw;
ADDRLP4 16
ADDRLP4 8
INDIRF4
ADDRLP4 20
INDIRF4
ADDF4
ASGNF4
line 619
;619:			}
LABELV $276
line 621
;620:
;621:			if ( x_end > max_ax || ax >= cgs.glconfig.vidWidth )
ADDRLP4 16
INDIRF4
ADDRLP4 40
INDIRF4
GTF4 $281
ADDRLP4 8
INDIRF4
ADDRGP4 cgs+20100+11304
INDIRI4
CVIF4 4
LTF4 $277
LABELV $281
line 622
;622:				break;
ADDRGP4 $272
JUMPV
LABELV $277
line 624
;623:
;624:			trap_R_DrawStretchPic( ax + xx_add, ay + yy_add, aw1, ah, tc[0], tc[1], tc[2], tc[3], sh );
ADDRLP4 8
INDIRF4
ADDRLP4 68
INDIRF4
ADDF4
ARGF4
ADDRLP4 48
INDIRF4
ADDRLP4 72
INDIRF4
ADDF4
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 36
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 626
;625:
;626:			ax = x_end;
ADDRLP4 8
ADDRLP4 16
INDIRF4
ASGNF4
line 627
;627:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 628
;628:		}
LABELV $271
line 601
ADDRLP4 0
INDIRP4
INDIRU1
CVUI4 1
CNSTI4 0
NEI4 $270
LABELV $272
line 631
;629:
;630:		// recover altered parameters
;631:		s = (const byte*)string;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
line 632
;632:		ax = xx;
ADDRLP4 8
ADDRLP4 80
INDIRF4
ASGNF4
line 633
;633:	}
LABELV $263
line 636
;634:
;635:	// select hi-res shader if accepted
;636:	for ( i = 1; i < font->shaderCount; i++ ) {
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 $285
JUMPV
LABELV $282
line 637
;637:		if ( ah >= font->shaderThreshold[i] ) {
ADDRLP4 32
INDIRF4
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 font
INDIRP4
CNSTI4 11280
ADDP4
ADDP4
INDIRI4
CVIF4 4
LTF4 $286
line 638
;638:			sh = font->shader[i];
ADDRLP4 36
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 font
INDIRP4
CNSTI4 11264
ADDP4
ADDP4
INDIRI4
ASGNI4
line 639
;639:		}
LABELV $286
line 640
;640:	}
LABELV $283
line 636
ADDRLP4 24
ADDRLP4 24
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $285
ADDRLP4 24
INDIRI4
ADDRGP4 font
INDIRP4
CNSTI4 11296
ADDP4
INDIRI4
LTI4 $282
line 642
;641:	
;642:	Vector4Copy( setColor, color );
ADDRLP4 84
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 52
ADDRLP4 84
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 52+4
ADDRLP4 84
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 52+8
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
ADDRLP4 52+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 643
;643:	trap_R_SetColor( color );
ADDRLP4 52
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
ADDRGP4 $292
JUMPV
LABELV $291
line 645
;644:	
;645:	while ( *s != '\0' ) {
line 647
;646:
;647:		if ( *s == Q_COLOR_ESCAPE && s[1] != '\0' && s[1] != '^' ) {
ADDRLP4 0
INDIRP4
INDIRU1
CVUI4 1
CNSTI4 94
NEI4 $294
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRU1
CVUI4 1
CNSTI4 0
EQI4 $294
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRU1
CVUI4 1
CNSTI4 94
EQI4 $294
line 648
;648:			if ( !( flags & DS_FORCE_COLOR ) ) {
ADDRFP4 28
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $296
line 649
;649:				VectorCopy( g_color_table[ ColorIndex( s[1] ) ], color );
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRU1
CVUI4 1
CNSTI4 48
SUBI4
CNSTI4 7
BANDI4
CNSTI4 4
LSHI4
ADDRGP4 g_color_table
ADDP4
INDIRB
ASGNB 12
line 650
;650:				trap_R_SetColor( color );
ADDRLP4 52
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 651
;651:			}
LABELV $296
line 653
;652:			//if ( !(options & DS_SHOW_CODE) ) {
;653:			s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 654
;654:			continue;
ADDRGP4 $292
JUMPV
LABELV $294
line 659
;655:			//}
;656:		}
;657:
;658:		//fm = &font->metrics[ *s ];
;659:		fm = &metrics[ *s ];
ADDRLP4 12
ADDRLP4 0
INDIRP4
INDIRU1
CVUI4 1
CNSTI4 44
MULI4
ADDRGP4 metrics
INDIRP4
ADDP4
ASGNP4
line 660
;660:		if ( proportional ) {
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $298
line 661
;661:			tc = fm->tc_prop;
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 662
;662:			aw1 = fm->width * aw;
ADDRLP4 28
ADDRLP4 12
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ASGNF4
line 663
;663:			ax += fm->space1 * aw;			// add extra space if required by metrics
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
line 664
;664:			x_end = ax + fm->space2 * aw;	// final position
ADDRLP4 16
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
line 665
;665:		} else {
ADDRGP4 $299
JUMPV
LABELV $298
line 666
;666:			tc = fm->tc_mono;
ADDRLP4 4
ADDRLP4 12
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
line 667
;667:			aw1 = aw;
ADDRLP4 28
ADDRLP4 20
INDIRF4
ASGNF4
line 668
;668:			x_end = ax + aw;
ADDRLP4 16
ADDRLP4 8
INDIRF4
ADDRLP4 20
INDIRF4
ADDF4
ASGNF4
line 669
;669:		}
LABELV $299
line 671
;670:
;671:		if ( x_end > max_ax || ax >= cgs.glconfig.vidWidth )
ADDRLP4 16
INDIRF4
ADDRLP4 40
INDIRF4
GTF4 $304
ADDRLP4 8
INDIRF4
ADDRGP4 cgs+20100+11304
INDIRI4
CVIF4 4
LTF4 $300
LABELV $304
line 672
;672:			break;
ADDRGP4 $293
JUMPV
LABELV $300
line 674
;673:
;674:		trap_R_DrawStretchPic( ax, ay, aw1, ah, tc[0], tc[1], tc[2], tc[3], sh );
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 48
INDIRF4
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 36
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 676
;675:
;676:		ax = x_end;
ADDRLP4 8
ADDRLP4 16
INDIRF4
ASGNF4
line 677
;677:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 678
;678:	}
LABELV $292
line 645
ADDRLP4 0
INDIRP4
INDIRU1
CVUI4 1
CNSTI4 0
NEI4 $291
LABELV $293
line 681
;679:
;680:	//trap_R_SetColor( NULL );
;681:}
LABELV $248
endproc CG_DrawString 96 36
export CG_DrawStrlen
proc CG_DrawStrlen 12 0
line 730
;682:#else
;683:
;684:
;685:static float DrawStringLen( const char *s, float charWidth ) 
;686:{
;687:	int count;
;688:	count = 0;
;689:	while ( *s ) {
;690:		if ( Q_IsColorString( s ) ) {
;691:			s += 2;
;692:		} else {
;693:			count++;
;694:			s++;
;695:		}
;696:	}
;697:	return count * charWidth;
;698:}
;699:
;700:
;701:void CG_DrawString( float x, float y, const char *s, const vec4_t color, float charWidth, float charHeight, int maxChars, int flags )
;702:{
;703:	if ( !color ) 
;704:	{
;705:		color = g_color_table[ ColorIndex( COLOR_WHITE ) ];
;706:	}
;707:
;708:	if ( flags & ( DS_CENTER | DS_RIGHT ) )
;709:	{
;710:		float w;
;711:		w = DrawStringLen( s, charWidth );
;712:		if ( flags & DS_CENTER )
;713:			x -= w * 0.5f;
;714:		else
;715:			x -= w;
;716:	}
;717:
;718:	CG_DrawStringExt( x, y, s, color, flags & DS_FORCE_COLOR, flags & DS_SHADOW, charWidth, charHeight, maxChars );
;719:}
;720:#endif
;721:
;722:
;723:/*
;724:=================
;725:CG_DrawStrlen
;726:
;727:Returns character count, skiping color escape codes
;728:=================
;729:*/
;730:int CG_DrawStrlen( const char *str ) {
line 731
;731:	const char *s = str;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 732
;732:	int count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $307
JUMPV
LABELV $306
line 734
;733:
;734:	while ( *s ) {
line 735
;735:		if ( Q_IsColorString( s ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $309
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $309
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $309
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 94
EQI4 $309
line 736
;736:			s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 737
;737:		} else {
ADDRGP4 $310
JUMPV
LABELV $309
line 738
;738:			count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 739
;739:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 740
;740:		}
LABELV $310
line 741
;741:	}
LABELV $307
line 734
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $306
line 743
;742:
;743:	return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $305
endproc CG_DrawStrlen 12 0
proc CG_TileClearBox 16 36
line 755
;744:}
;745:
;746:
;747:/*
;748:=============
;749:CG_TileClearBox
;750:
;751:This repeats a 64*64 tile graphic to fill the screen around a sized down
;752:refresh window.
;753:=============
;754:*/
;755:static void CG_TileClearBox( int x, int y, int w, int h, qhandle_t hShader ) {
line 758
;756:	float	s1, t1, s2, t2;
;757:
;758:	s1 = x/64.0;
ADDRLP4 0
ADDRFP4 0
INDIRI4
CVIF4 4
CNSTF4 1015021568
MULF4
ASGNF4
line 759
;759:	t1 = y/64.0;
ADDRLP4 4
ADDRFP4 4
INDIRI4
CVIF4 4
CNSTF4 1015021568
MULF4
ASGNF4
line 760
;760:	s2 = (x+w)/64.0;
ADDRLP4 8
ADDRFP4 0
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
CVIF4 4
CNSTF4 1015021568
MULF4
ASGNF4
line 761
;761:	t2 = (y+h)/64.0;
ADDRLP4 12
ADDRFP4 4
INDIRI4
ADDRFP4 12
INDIRI4
ADDI4
CVIF4 4
CNSTF4 1015021568
MULF4
ASGNF4
line 762
;762:	trap_R_DrawStretchPic( x, y, w, h, s1, t1, s2, t2, hShader );
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
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
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
line 763
;763:}
LABELV $311
endproc CG_TileClearBox 16 36
export CG_TileClear
proc CG_TileClear 40 20
line 773
;764:
;765:
;766:/*
;767:==============
;768:CG_TileClear
;769:
;770:Clear around a sized down screen
;771:==============
;772:*/
;773:void CG_TileClear( void ) {
line 777
;774:	int		top, bottom, left, right;
;775:	int		w, h;
;776:
;777:	w = cgs.glconfig.vidWidth;
ADDRLP4 8
ADDRGP4 cgs+20100+11304
INDIRI4
ASGNI4
line 778
;778:	h = cgs.glconfig.vidHeight;
ADDRLP4 20
ADDRGP4 cgs+20100+11308
INDIRI4
ASGNI4
line 780
;779:
;780:	if ( cg.refdef.x == 0 && cg.refdef.y == 0 && 
ADDRGP4 cg+109056
INDIRI4
CNSTI4 0
NEI4 $317
ADDRGP4 cg+109056+4
INDIRI4
CNSTI4 0
NEI4 $317
ADDRGP4 cg+109056+8
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $317
ADDRGP4 cg+109056+12
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $317
line 781
;781:		cg.refdef.width == w && cg.refdef.height == h ) {
line 782
;782:		return;		// full screen rendering
ADDRGP4 $312
JUMPV
LABELV $317
line 785
;783:	}
;784:
;785:	top = cg.refdef.y;
ADDRLP4 0
ADDRGP4 cg+109056+4
INDIRI4
ASGNI4
line 786
;786:	bottom = top + cg.refdef.height-1;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ADDRGP4 cg+109056+12
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ASGNI4
line 787
;787:	left = cg.refdef.x;
ADDRLP4 12
ADDRGP4 cg+109056
INDIRI4
ASGNI4
line 788
;788:	right = left + cg.refdef.width-1;
ADDRLP4 16
ADDRLP4 12
INDIRI4
ADDRGP4 cg+109056+8
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ASGNI4
line 791
;789:
;790:	// clear above view screen
;791:	CG_TileClearBox( 0, 0, w, top, cgs.media.backTileShader );
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 cgs+148692+300
INDIRI4
ARGI4
ADDRGP4 CG_TileClearBox
CALLV
pop
line 794
;792:
;793:	// clear below view screen
;794:	CG_TileClearBox( 0, bottom, w, h - bottom, cgs.media.backTileShader );
CNSTI4 0
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ARGI4
ADDRGP4 cgs+148692+300
INDIRI4
ARGI4
ADDRGP4 CG_TileClearBox
CALLV
pop
line 797
;795:
;796:	// clear left of view screen
;797:	CG_TileClearBox( 0, top, left, bottom - top + 1, cgs.media.backTileShader );
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 cgs+148692+300
INDIRI4
ARGI4
ADDRGP4 CG_TileClearBox
CALLV
pop
line 800
;798:
;799:	// clear right of view screen
;800:	CG_TileClearBox( right, top, w - right, bottom - top + 1, cgs.media.backTileShader );
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
SUBI4
ARGI4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 cgs+148692+300
INDIRI4
ARGI4
ADDRGP4 CG_TileClearBox
CALLV
pop
line 801
;801:}
LABELV $312
endproc CG_TileClear 40 20
bss
align 4
LABELV $342
skip 16
export CG_FadeColor
code
proc CG_FadeColor 8 0
line 809
;802:
;803:
;804:/*
;805:================
;806:CG_FadeColor
;807:================
;808:*/
;809:float *CG_FadeColor( int startMsec, int totalMsec ) {
line 813
;810:	static vec4_t		color;
;811:	int			t;
;812:
;813:	if ( startMsec == 0 ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $343
line 814
;814:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $341
JUMPV
LABELV $343
line 817
;815:	}
;816:
;817:	t = cg.time - startMsec;
ADDRLP4 0
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 0
INDIRI4
SUBI4
ASGNI4
line 819
;818:
;819:	if ( t >= totalMsec ) {
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $346
line 820
;820:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $341
JUMPV
LABELV $346
line 824
;821:	}
;822:
;823:	// fade out
;824:	if ( totalMsec - t < FADE_TIME ) {
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 200
GEI4 $348
line 825
;825:		color[3] = ( totalMsec - t ) * 1.0/FADE_TIME;
ADDRGP4 $342+12
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1000593162
MULF4
ASGNF4
line 826
;826:	} else {
ADDRGP4 $349
JUMPV
LABELV $348
line 827
;827:		color[3] = 1.0;
ADDRGP4 $342+12
CNSTF4 1065353216
ASGNF4
line 828
;828:	}
LABELV $349
line 829
;829:	color[0] = color[1] = color[2] = 1;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
ADDRGP4 $342+8
ADDRLP4 4
INDIRF4
ASGNF4
ADDRGP4 $342+4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRGP4 $342
ADDRLP4 4
INDIRF4
ASGNF4
line 831
;830:
;831:	return color;
ADDRGP4 $342
RETP4
LABELV $341
endproc CG_FadeColor 8 0
bss
align 4
LABELV $355
skip 16
export CG_FadeColorTime
code
proc CG_FadeColorTime 8 0
line 840
;832:}
;833:
;834:
;835:/*
;836:================
;837:CG_FadeColorTime
;838:================
;839:*/
;840:float *CG_FadeColorTime( int startMsec, int totalMsec, int fadeMsec ) {
line 844
;841:	static vec4_t		color;
;842:	int			t;
;843:
;844:	if ( startMsec == 0 ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $356
line 845
;845:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $354
JUMPV
LABELV $356
line 848
;846:	}
;847:
;848:	t = cg.time - startMsec;
ADDRLP4 0
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 0
INDIRI4
SUBI4
ASGNI4
line 850
;849:
;850:	if ( t >= totalMsec ) {
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $359
line 851
;851:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $354
JUMPV
LABELV $359
line 855
;852:	}
;853:
;854:	// fade out
;855:	if ( totalMsec - t < fadeMsec ) {
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ADDRFP4 8
INDIRI4
GEI4 $361
line 856
;856:		color[3] = ( totalMsec - t ) * 1.0f/(float)fadeMsec;
ADDRGP4 $355+12
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CVIF4 4
ADDRFP4 8
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 857
;857:	} else {
ADDRGP4 $362
JUMPV
LABELV $361
line 858
;858:		color[3] = 1.0f;
ADDRGP4 $355+12
CNSTF4 1065353216
ASGNF4
line 859
;859:	}
LABELV $362
line 860
;860:	color[0] = color[1] = color[2] = 1.0f;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
ADDRGP4 $355+8
ADDRLP4 4
INDIRF4
ASGNF4
ADDRGP4 $355+4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRGP4 $355
ADDRLP4 4
INDIRF4
ASGNF4
line 862
;861:
;862:	return color;
ADDRGP4 $355
RETP4
LABELV $354
endproc CG_FadeColorTime 8 0
data
align 4
LABELV $368
byte 4 1065353216
byte 4 1045220557
byte 4 1045220557
byte 4 1065353216
align 4
LABELV $369
byte 4 1045220557
byte 4 1045220557
byte 4 1065353216
byte 4 1065353216
align 4
LABELV $370
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
align 4
LABELV $371
byte 4 1060320051
byte 4 1060320051
byte 4 1060320051
byte 4 1065353216
export CG_TeamColor
code
proc CG_TeamColor 8 0
line 871
;863:}
;864:
;865:
;866:/*
;867:================
;868:CG_TeamColor
;869:================
;870:*/
;871:const float *CG_TeamColor( team_t team ) {
line 877
;872:	static vec4_t	red = {1, 0.2f, 0.2f, 1};
;873:	static vec4_t	blue = {0.2f, 0.2f, 1, 1};
;874:	static vec4_t	other = {1, 1, 1, 1};
;875:	static vec4_t	spectator = {0.7f, 0.7f, 0.7f, 1};
;876:
;877:	switch ( team ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $375
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $376
ADDRLP4 0
INDIRI4
CNSTI4 3
EQI4 $377
ADDRGP4 $372
JUMPV
LABELV $375
line 879
;878:	case TEAM_RED:
;879:		return red;
ADDRGP4 $368
RETP4
ADDRGP4 $367
JUMPV
LABELV $376
line 881
;880:	case TEAM_BLUE:
;881:		return blue;
ADDRGP4 $369
RETP4
ADDRGP4 $367
JUMPV
LABELV $377
line 883
;882:	case TEAM_SPECTATOR:
;883:		return spectator;
ADDRGP4 $371
RETP4
ADDRGP4 $367
JUMPV
LABELV $372
line 885
;884:	default:
;885:		return other;
ADDRGP4 $370
RETP4
LABELV $367
endproc CG_TeamColor 8 0
export CG_GetColorForHealth
proc CG_GetColorForHealth 8 0
line 896
;886:	}
;887:}
;888:
;889:
;890:
;891:/*
;892:=================
;893:CG_GetColorForHealth
;894:=================
;895:*/
;896:void CG_GetColorForHealth( int health, int armor, vec4_t hcolor ) {
line 902
;897:	int		count;
;898:	int		max;
;899:
;900:	// calculate the total points of damage that can
;901:	// be sustained at the current health / armor level
;902:	if ( health <= 0 ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
GTI4 $379
line 903
;903:		VectorClear( hcolor );	// black
ADDRFP4 8
INDIRP4
CNSTF4 0
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 904
;904:		hcolor[3] = 1;
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1065353216
ASGNF4
line 905
;905:		return;
ADDRGP4 $378
JUMPV
LABELV $379
line 907
;906:	}
;907:	count = armor;
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
line 908
;908:	max = health * ARMOR_PROTECTION / ( 1.0 - ARMOR_PROTECTION );
ADDRLP4 4
ADDRFP4 0
INDIRI4
CVIF4 4
CNSTF4 1073248376
MULF4
CVFI4 4
ASGNI4
line 909
;909:	if ( max < count ) {
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $381
line 910
;910:		count = max;
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 911
;911:	}
LABELV $381
line 912
;912:	health += count;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 915
;913:
;914:	// set the color based on health
;915:	hcolor[0] = 1.0;
ADDRFP4 8
INDIRP4
CNSTF4 1065353216
ASGNF4
line 916
;916:	hcolor[3] = 1.0;
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1065353216
ASGNF4
line 917
;917:	if ( health >= 100 ) {
ADDRFP4 0
INDIRI4
CNSTI4 100
LTI4 $383
line 918
;918:		hcolor[2] = 1.0;
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1065353216
ASGNF4
line 919
;919:	} else if ( health < 66 ) {
ADDRGP4 $384
JUMPV
LABELV $383
ADDRFP4 0
INDIRI4
CNSTI4 66
GEI4 $385
line 920
;920:		hcolor[2] = 0;
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 921
;921:	} else {
ADDRGP4 $386
JUMPV
LABELV $385
line 922
;922:		hcolor[2] = ( health - 66 ) / 33.0;
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 0
INDIRI4
CNSTI4 66
SUBI4
CVIF4 4
CNSTF4 1022901776
MULF4
ASGNF4
line 923
;923:	}
LABELV $386
LABELV $384
line 925
;924:
;925:	if ( health > 60 ) {
ADDRFP4 0
INDIRI4
CNSTI4 60
LEI4 $387
line 926
;926:		hcolor[1] = 1.0;
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1065353216
ASGNF4
line 927
;927:	} else if ( health < 30 ) {
ADDRGP4 $388
JUMPV
LABELV $387
ADDRFP4 0
INDIRI4
CNSTI4 30
GEI4 $389
line 928
;928:		hcolor[1] = 0;
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 0
ASGNF4
line 929
;929:	} else {
ADDRGP4 $390
JUMPV
LABELV $389
line 930
;930:		hcolor[1] = ( health - 30 ) / 30.0;
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRI4
CNSTI4 30
SUBI4
CVIF4 4
CNSTF4 1023969417
MULF4
ASGNF4
line 931
;931:	}
LABELV $390
LABELV $388
line 932
;932:}
LABELV $378
endproc CG_GetColorForHealth 8 0
export CG_ColorForHealth
proc CG_ColorForHealth 0 12
line 940
;933:
;934:
;935:/*
;936:=================
;937:CG_ColorForHealth
;938:=================
;939:*/
;940:void CG_ColorForHealth( vec4_t hcolor ) {
line 942
;941:
;942:	CG_GetColorForHealth( cg.snap->ps.stats[STAT_HEALTH], 
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 244
ADDP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_GetColorForHealth
CALLV
pop
line 944
;943:		cg.snap->ps.stats[STAT_ARMOR], hcolor );
;944:}
LABELV $391
endproc CG_ColorForHealth 0 12
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
line 1109
;945:
;946:
;947:
;948:// bk001205 - code below duplicated in q3_ui/ui-atoms.c
;949:// bk001205 - FIXME: does this belong in ui_shared.c?
;950:// bk001205 - FIXME: HARD_LINKED flags not visible here
;951:#ifndef Q3_STATIC // bk001205 - q_shared defines not visible here 
;952:/*
;953:=================
;954:UI_DrawProportionalString2
;955:=================
;956:*/
;957:static int	propMap[128][3] = {
;958:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;959:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;960:
;961:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;962:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;963:
;964:{0, 0, PROP_SPACE_WIDTH},		// SPACE
;965:{11, 122, 7},	// !
;966:{154, 181, 14},	// "
;967:{55, 122, 17},	// #
;968:{79, 122, 18},	// $
;969:{101, 122, 23},	// %
;970:{153, 122, 18},	// &
;971:{9, 93, 7},		// '
;972:{207, 122, 8},	// (
;973:{230, 122, 9},	// )
;974:{177, 122, 18},	// *
;975:{30, 152, 18},	// +
;976:{85, 181, 7},	// ,
;977:{34, 93, 11},	// -
;978:{110, 181, 6},	// .
;979:{130, 152, 14},	// /
;980:
;981:{22, 64, 17},	// 0
;982:{41, 64, 12},	// 1
;983:{58, 64, 17},	// 2
;984:{78, 64, 18},	// 3
;985:{98, 64, 19},	// 4
;986:{120, 64, 18},	// 5
;987:{141, 64, 18},	// 6
;988:{204, 64, 16},	// 7
;989:{162, 64, 17},	// 8
;990:{182, 64, 18},	// 9
;991:{59, 181, 7},	// :
;992:{35,181, 7},	// ;
;993:{203, 152, 14},	// <
;994:{56, 93, 14},	// =
;995:{228, 152, 14},	// >
;996:{177, 181, 18},	// ?
;997:
;998:{28, 122, 22},	// @
;999:{5, 4, 18},		// A
;1000:{27, 4, 18},	// B
;1001:{48, 4, 18},	// C
;1002:{69, 4, 17},	// D
;1003:{90, 4, 13},	// E
;1004:{106, 4, 13},	// F
;1005:{121, 4, 18},	// G
;1006:{143, 4, 17},	// H
;1007:{164, 4, 8},	// I
;1008:{175, 4, 16},	// J
;1009:{195, 4, 18},	// K
;1010:{216, 4, 12},	// L
;1011:{230, 4, 23},	// M
;1012:{6, 34, 18},	// N
;1013:{27, 34, 18},	// O
;1014:
;1015:{48, 34, 18},	// P
;1016:{68, 34, 18},	// Q
;1017:{90, 34, 17},	// R
;1018:{110, 34, 18},	// S
;1019:{130, 34, 14},	// T
;1020:{146, 34, 18},	// U
;1021:{166, 34, 19},	// V
;1022:{185, 34, 29},	// W
;1023:{215, 34, 18},	// X
;1024:{234, 34, 18},	// Y
;1025:{5, 64, 14},	// Z
;1026:{60, 152, 7},	// [
;1027:{106, 151, 13},	// '\'
;1028:{83, 152, 7},	// ]
;1029:{128, 122, 17},	// ^
;1030:{4, 152, 21},	// _
;1031:
;1032:{134, 181, 5},	// '
;1033:{5, 4, 18},		// A
;1034:{27, 4, 18},	// B
;1035:{48, 4, 18},	// C
;1036:{69, 4, 17},	// D
;1037:{90, 4, 13},	// E
;1038:{106, 4, 13},	// F
;1039:{121, 4, 18},	// G
;1040:{143, 4, 17},	// H
;1041:{164, 4, 8},	// I
;1042:{175, 4, 16},	// J
;1043:{195, 4, 18},	// K
;1044:{216, 4, 12},	// L
;1045:{230, 4, 23},	// M
;1046:{6, 34, 18},	// N
;1047:{27, 34, 18},	// O
;1048:
;1049:{48, 34, 18},	// P
;1050:{68, 34, 18},	// Q
;1051:{90, 34, 17},	// R
;1052:{110, 34, 18},	// S
;1053:{130, 34, 14},	// T
;1054:{146, 34, 18},	// U
;1055:{166, 34, 19},	// V
;1056:{185, 34, 29},	// W
;1057:{215, 34, 18},	// X
;1058:{234, 34, 18},	// Y
;1059:{5, 64, 14},	// Z
;1060:{153, 152, 13},	// {
;1061:{11, 181, 5},	// |
;1062:{180, 152, 13},	// }
;1063:{79, 93, 17},	// ~
;1064:{0, 0, -1}		// DEL
;1065:};
;1066:
;1067:static int propMapB[26][3] = {
;1068:{11, 12, 33},
;1069:{49, 12, 31},
;1070:{85, 12, 31},
;1071:{120, 12, 30},
;1072:{156, 12, 21},
;1073:{183, 12, 21},
;1074:{207, 12, 32},
;1075:
;1076:{13, 55, 30},
;1077:{49, 55, 13},
;1078:{66, 55, 29},
;1079:{101, 55, 31},
;1080:{135, 55, 21},
;1081:{158, 55, 40},
;1082:{204, 55, 32},
;1083:
;1084:{12, 97, 31},
;1085:{48, 97, 31},
;1086:{82, 97, 30},
;1087:{118, 97, 30},
;1088:{153, 97, 30},
;1089:{185, 97, 25},
;1090:{213, 97, 30},
;1091:
;1092:{11, 139, 32},
;1093:{42, 139, 51},
;1094:{93, 139, 32},
;1095:{126, 139, 31},
;1096:{158, 139, 25},
;1097:};
;1098:
;1099:#define PROPB_GAP_WIDTH		4
;1100:#define PROPB_SPACE_WIDTH	12
;1101:#define PROPB_HEIGHT		36
;1102:
;1103:/*
;1104:=================
;1105:UI_DrawBannerString
;1106:=================
;1107:*/
;1108:static void UI_DrawBannerString2( int x, int y, const char* str, vec4_t color )
;1109:{
line 1122
;1110:	const char* s;
;1111:	unsigned char	ch; // bk001204 : array subscript
;1112:	float	ax;
;1113:	float	ay;
;1114:	float	aw;
;1115:	float	ah;
;1116:	float	frow;
;1117:	float	fcol;
;1118:	float	fwidth;
;1119:	float	fheight;
;1120:
;1121:	// draw the colored text
;1122:	trap_R_SetColor( color );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1124
;1123:	
;1124:	ax = x * cgs.screenXScale + cgs.screenXBias;
ADDRLP4 8
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRGP4 cgs+31432
INDIRF4
MULF4
ADDRGP4 cgs+31444
INDIRF4
ADDF4
ASGNF4
line 1125
;1125:	ay = y * cgs.screenYScale + cgs.screenYBias;
ADDRLP4 36
ADDRFP4 4
INDIRI4
CVIF4 4
ADDRGP4 cgs+31436
INDIRF4
MULF4
ADDRGP4 cgs+31448
INDIRF4
ADDF4
ASGNF4
line 1127
;1126:
;1127:	s = str;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $400
JUMPV
LABELV $399
line 1129
;1128:	while ( *s )
;1129:	{
line 1130
;1130:		ch = *s & 127;
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
line 1131
;1131:		if ( ch == ' ' ) {
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 32
NEI4 $402
line 1132
;1132:			ax += ((float)PROPB_SPACE_WIDTH + (float)PROPB_GAP_WIDTH)* cgs.screenXScale;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRGP4 cgs+31432
INDIRF4
CNSTF4 1098907648
MULF4
ADDF4
ASGNF4
line 1133
;1133:		}
ADDRGP4 $403
JUMPV
LABELV $402
line 1134
;1134:		else if ( ch >= 'A' && ch <= 'Z' ) {
ADDRLP4 40
ADDRLP4 0
INDIRU1
CVUI4 1
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 65
LTI4 $405
ADDRLP4 40
INDIRI4
CNSTI4 90
GTI4 $405
line 1135
;1135:			ch -= 'A';
ADDRLP4 0
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 65
SUBI4
CVIU4 4
CVUU1 4
ASGNU1
line 1136
;1136:			fcol = (float)propMapB[ch][0] / 256.0f;
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
line 1137
;1137:			frow = (float)propMapB[ch][1] / 256.0f;
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
line 1138
;1138:			fwidth = (float)propMapB[ch][2] / 256.0f;
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
line 1139
;1139:			fheight = (float)PROPB_HEIGHT / 256.0f;
ADDRLP4 32
CNSTF4 1041235968
ASGNF4
line 1140
;1140:			aw = (float)propMapB[ch][2] * cgs.screenXScale;
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
ADDRGP4 cgs+31432
INDIRF4
MULF4
ASGNF4
line 1141
;1141:			ah = (float)PROPB_HEIGHT * cgs.screenXScale;
ADDRLP4 24
ADDRGP4 cgs+31432
INDIRF4
CNSTF4 1108344832
MULF4
ASGNF4
line 1142
;1142:			trap_R_DrawStretchPic( ax, ay, aw, ah, fcol, frow, fcol+fwidth, frow+fheight, cgs.media.charsetPropB );
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
ADDRGP4 cgs+148692+12
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1143
;1143:			ax += (aw + (float)PROPB_GAP_WIDTH * cgs.screenXScale);
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
ADDRGP4 cgs+31432
INDIRF4
CNSTF4 1082130432
MULF4
ADDF4
ADDF4
ASGNF4
line 1144
;1144:		}
LABELV $405
LABELV $403
line 1145
;1145:		s++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1146
;1146:	}
LABELV $400
line 1128
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $399
line 1148
;1147:
;1148:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1149
;1149:}
LABELV $394
endproc UI_DrawBannerString2 52 36
export UI_DrawBannerString
proc UI_DrawBannerString 40 16
line 1151
;1150:
;1151:void UI_DrawBannerString( int x, int y, const char* str, int style, vec4_t color ) {
line 1158
;1152:	const char *	s;
;1153:	int				ch;
;1154:	int				width;
;1155:	vec4_t			drawcolor;
;1156:
;1157:	// find the width of the drawn text
;1158:	s = str;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
line 1159
;1159:	width = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $417
JUMPV
LABELV $416
line 1160
;1160:	while ( *s ) {
line 1161
;1161:		ch = *s;
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 1162
;1162:		if ( ch == ' ' ) {
ADDRLP4 0
INDIRI4
CNSTI4 32
NEI4 $419
line 1163
;1163:			width += PROPB_SPACE_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 12
ADDI4
ASGNI4
line 1164
;1164:		}
ADDRGP4 $420
JUMPV
LABELV $419
line 1165
;1165:		else if ( ch >= 'A' && ch <= 'Z' ) {
ADDRLP4 0
INDIRI4
CNSTI4 65
LTI4 $421
ADDRLP4 0
INDIRI4
CNSTI4 90
GTI4 $421
line 1166
;1166:			width += propMapB[ch - 'A'][2] + PROPB_GAP_WIDTH;
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
line 1167
;1167:		}
LABELV $421
LABELV $420
line 1168
;1168:		s++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1169
;1169:	}
LABELV $417
line 1160
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $416
line 1170
;1170:	width -= PROPB_GAP_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 4
SUBI4
ASGNI4
line 1172
;1171:
;1172:	switch( style & UI_FORMATMASK ) {
ADDRLP4 28
ADDRFP4 12
INDIRI4
CNSTI4 7
BANDI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $426
ADDRLP4 28
INDIRI4
CNSTI4 1
EQI4 $428
ADDRLP4 28
INDIRI4
CNSTI4 2
EQI4 $429
ADDRGP4 $426
JUMPV
LABELV $428
line 1174
;1173:		case UI_CENTER:
;1174:			x -= width / 2;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 8
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 1175
;1175:			break;
ADDRGP4 $426
JUMPV
LABELV $429
line 1178
;1176:
;1177:		case UI_RIGHT:
;1178:			x -= width;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 1179
;1179:			break;
line 1183
;1180:
;1181:		case UI_LEFT:
;1182:		default:
;1183:			break;
LABELV $426
line 1186
;1184:	}
;1185:
;1186:	if ( style & UI_DROPSHADOW ) {
ADDRFP4 12
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $431
line 1187
;1187:		drawcolor[0] = drawcolor[1] = drawcolor[2] = 0;
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
line 1188
;1188:		drawcolor[3] = color[3];
ADDRLP4 12+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 1189
;1189:		UI_DrawBannerString2( x+2, y+2, str, drawcolor );
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
line 1190
;1190:	}
LABELV $431
line 1192
;1191:
;1192:	UI_DrawBannerString2( x, y, str, color );
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
line 1193
;1193:}
LABELV $415
endproc UI_DrawBannerString 40 16
export UI_ProportionalStringWidth
proc UI_ProportionalStringWidth 16 0
line 1196
;1194:
;1195:
;1196:int UI_ProportionalStringWidth( const char* str ) {
line 1202
;1197:	const char *	s;
;1198:	int				ch;
;1199:	int				charWidth;
;1200:	int				width;
;1201:
;1202:	s = str;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 1203
;1203:	width = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $438
JUMPV
LABELV $437
line 1204
;1204:	while ( *s ) {
line 1205
;1205:		ch = *s & 127;
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
BANDI4
ASGNI4
line 1206
;1206:		charWidth = propMap[ch][2];
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 12
MULI4
ADDRGP4 propMap+8
ADDP4
INDIRI4
ASGNI4
line 1207
;1207:		if ( charWidth != -1 ) {
ADDRLP4 4
INDIRI4
CNSTI4 -1
EQI4 $441
line 1208
;1208:			width += charWidth;
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 1209
;1209:			width += PROP_GAP_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 3
ADDI4
ASGNI4
line 1210
;1210:		}
LABELV $441
line 1211
;1211:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1212
;1212:	}
LABELV $438
line 1204
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $437
line 1214
;1213:
;1214:	width -= PROP_GAP_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 3
SUBI4
ASGNI4
line 1215
;1215:	return width;
ADDRLP4 12
INDIRI4
RETI4
LABELV $436
endproc UI_ProportionalStringWidth 16 0
proc UI_DrawProportionalString2 48 36
line 1219
;1216:}
;1217:
;1218:static void UI_DrawProportionalString2( int x, int y, const char* str, vec4_t color, float sizeScale, qhandle_t charset )
;1219:{
line 1232
;1220:	const char* s;
;1221:	unsigned char	ch; // bk001204 - unsigned
;1222:	float	ax;
;1223:	float	ay;
;1224:	float	aw;
;1225:	float	ah;
;1226:	float	frow;
;1227:	float	fcol;
;1228:	float	fwidth;
;1229:	float	fheight;
;1230:
;1231:	// draw the colored text
;1232:	trap_R_SetColor( color );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1234
;1233:	
;1234:	ax = x * cgs.screenXScale + cgs.screenXBias;
ADDRLP4 12
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRGP4 cgs+31432
INDIRF4
MULF4
ADDRGP4 cgs+31444
INDIRF4
ADDF4
ASGNF4
line 1235
;1235:	ay = y * cgs.screenYScale + cgs.screenYBias;
ADDRLP4 36
ADDRFP4 4
INDIRI4
CVIF4 4
ADDRGP4 cgs+31436
INDIRF4
MULF4
ADDRGP4 cgs+31448
INDIRF4
ADDF4
ASGNF4
line 1237
;1236:
;1237:	s = str;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $449
JUMPV
LABELV $448
line 1239
;1238:	while ( *s )
;1239:	{
line 1240
;1240:		ch = *s & 127;
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
line 1241
;1241:		if ( ch == ' ' ) {
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 32
NEI4 $451
line 1242
;1242:			aw = (float)PROP_SPACE_WIDTH * cgs.screenXScale * sizeScale;
ADDRLP4 8
ADDRGP4 cgs+31432
INDIRF4
CNSTF4 1090519040
MULF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 1243
;1243:		} else if ( propMap[ch][2] != -1 ) {
ADDRGP4 $452
JUMPV
LABELV $451
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 12
MULI4
ADDRGP4 propMap+8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $454
line 1244
;1244:			fcol = (float)propMap[ch][0] / 256.0f;
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
line 1245
;1245:			frow = (float)propMap[ch][1] / 256.0f;
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
line 1246
;1246:			fwidth = (float)propMap[ch][2] / 256.0f;
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
line 1247
;1247:			fheight = (float)PROP_HEIGHT / 256.0f;
ADDRLP4 32
CNSTF4 1037565952
ASGNF4
line 1248
;1248:			aw = (float)propMap[ch][2] * cgs.screenXScale * sizeScale;
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
ADDRGP4 cgs+31432
INDIRF4
MULF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 1249
;1249:			ah = (float)PROP_HEIGHT * cgs.screenXScale * sizeScale;
ADDRLP4 24
ADDRGP4 cgs+31432
INDIRF4
CNSTF4 1104674816
MULF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 1250
;1250:			trap_R_DrawStretchPic( ax, ay, aw, ah, fcol, frow, fcol+fwidth, frow+fheight, charset );
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
line 1251
;1251:		} else {
ADDRGP4 $455
JUMPV
LABELV $454
line 1252
;1252:			aw = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 1253
;1253:		}
LABELV $455
LABELV $452
line 1255
;1254:
;1255:		ax += (aw + (float)PROP_GAP_WIDTH * cgs.screenXScale * sizeScale);
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
ADDRGP4 cgs+31432
INDIRF4
CNSTF4 1077936128
MULF4
ADDRFP4 16
INDIRF4
MULF4
ADDF4
ADDF4
ASGNF4
line 1256
;1256:		s++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1257
;1257:	}
LABELV $449
line 1238
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $448
line 1259
;1258:
;1259:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1260
;1260:}
LABELV $443
endproc UI_DrawProportionalString2 48 36
export UI_ProportionalSizeScale
proc UI_ProportionalSizeScale 0 0
line 1267
;1261:
;1262:/*
;1263:=================
;1264:UI_ProportionalSizeScale
;1265:=================
;1266:*/
;1267:float UI_ProportionalSizeScale( int style ) {
line 1268
;1268:	if(  style & UI_SMALLFONT ) {
ADDRFP4 0
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $464
line 1269
;1269:		return 0.75;
CNSTF4 1061158912
RETF4
ADDRGP4 $463
JUMPV
LABELV $464
line 1272
;1270:	}
;1271:
;1272:	return 1.00;
CNSTF4 1065353216
RETF4
LABELV $463
endproc UI_ProportionalSizeScale 0 0
export UI_DrawProportionalString
proc UI_DrawProportionalString 44 24
line 1281
;1273:}
;1274:
;1275:
;1276:/*
;1277:=================
;1278:UI_DrawProportionalString
;1279:=================
;1280:*/
;1281:void UI_DrawProportionalString( int x, int y, const char* str, int style, vec4_t color ) {
line 1286
;1282:	vec4_t	drawcolor;
;1283:	int		width;
;1284:	float	sizeScale;
;1285:
;1286:	sizeScale = UI_ProportionalSizeScale( style );
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
line 1288
;1287:
;1288:	switch( style & UI_FORMATMASK ) {
ADDRLP4 28
ADDRFP4 12
INDIRI4
CNSTI4 7
BANDI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $468
ADDRLP4 28
INDIRI4
CNSTI4 1
EQI4 $470
ADDRLP4 28
INDIRI4
CNSTI4 2
EQI4 $471
ADDRGP4 $468
JUMPV
LABELV $470
line 1290
;1289:		case UI_CENTER:
;1290:			width = UI_ProportionalStringWidth( str ) * sizeScale;
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
line 1291
;1291:			x -= width / 2;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 20
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 1292
;1292:			break;
ADDRGP4 $468
JUMPV
LABELV $471
line 1295
;1293:
;1294:		case UI_RIGHT:
;1295:			width = UI_ProportionalStringWidth( str ) * sizeScale;
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
line 1296
;1296:			x -= width;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
ASGNI4
line 1297
;1297:			break;
line 1301
;1298:
;1299:		case UI_LEFT:
;1300:		default:
;1301:			break;
LABELV $468
line 1304
;1302:	}
;1303:
;1304:	if ( style & UI_DROPSHADOW ) {
ADDRFP4 12
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $473
line 1305
;1305:		drawcolor[0] = drawcolor[1] = drawcolor[2] = 0;
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
line 1306
;1306:		drawcolor[3] = color[3];
ADDRLP4 0+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 1307
;1307:		UI_DrawProportionalString2( x+2, y+2, str, drawcolor, sizeScale, cgs.media.charsetProp );
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
ADDRGP4 cgs+148692+4
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 1308
;1308:	}
LABELV $473
line 1310
;1309:
;1310:	if ( style & UI_INVERSE ) {
ADDRFP4 12
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $480
line 1311
;1311:		drawcolor[0] = color[0] * 0.8;
ADDRLP4 0
ADDRFP4 16
INDIRP4
INDIRF4
CNSTF4 1061997773
MULF4
ASGNF4
line 1312
;1312:		drawcolor[1] = color[1] * 0.8;
ADDRLP4 0+4
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1061997773
MULF4
ASGNF4
line 1313
;1313:		drawcolor[2] = color[2] * 0.8;
ADDRLP4 0+8
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1061997773
MULF4
ASGNF4
line 1314
;1314:		drawcolor[3] = color[3];
ADDRLP4 0+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 1315
;1315:		UI_DrawProportionalString2( x, y, str, drawcolor, sizeScale, cgs.media.charsetProp );
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
ADDRGP4 cgs+148692+4
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 1316
;1316:		return;
ADDRGP4 $466
JUMPV
LABELV $480
line 1319
;1317:	}
;1318:
;1319:	if ( style & UI_PULSE ) {
ADDRFP4 12
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $487
line 1320
;1320:		drawcolor[0] = color[0] * 0.8;
ADDRLP4 0
ADDRFP4 16
INDIRP4
INDIRF4
CNSTF4 1061997773
MULF4
ASGNF4
line 1321
;1321:		drawcolor[1] = color[1] * 0.8;
ADDRLP4 0+4
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1061997773
MULF4
ASGNF4
line 1322
;1322:		drawcolor[2] = color[2] * 0.8;
ADDRLP4 0+8
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1061997773
MULF4
ASGNF4
line 1323
;1323:		drawcolor[3] = color[3];
ADDRLP4 0+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 1324
;1324:		UI_DrawProportionalString2( x, y, str, color, sizeScale, cgs.media.charsetProp );
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
ADDRGP4 cgs+148692+4
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 1326
;1325:
;1326:		drawcolor[0] = color[0];
ADDRLP4 0
ADDRFP4 16
INDIRP4
INDIRF4
ASGNF4
line 1327
;1327:		drawcolor[1] = color[1];
ADDRLP4 0+4
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 1328
;1328:		drawcolor[2] = color[2];
ADDRLP4 0+8
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
line 1329
;1329:		drawcolor[3] = 0.5 + 0.5 * sin( ( cg.time % TMOD_075 ) / PULSE_DIVISOR );
ADDRGP4 cg+107604
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
line 1330
;1330:		UI_DrawProportionalString2( x, y, str, drawcolor, sizeScale, cgs.media.charsetPropGlow );
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
ADDRGP4 cgs+148692+8
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 1331
;1331:		return;
ADDRGP4 $466
JUMPV
LABELV $487
line 1334
;1332:	}
;1333:
;1334:	UI_DrawProportionalString2( x, y, str, color, sizeScale, cgs.media.charsetProp );
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
ADDRGP4 cgs+148692+4
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 1335
;1335:}
LABELV $466
endproc UI_DrawProportionalString 44 24
bss
align 4
LABELV numbers
skip 11300
align 4
LABELV bigchars
skip 11300
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
import CG_TrackClientTeamChange
import CG_ForceModelChange
import CG_StatusHandle
import CG_OtherTeamHasFlag
import CG_YourTeamHasFlag
import CG_GameTypeString
import CG_CheckOrderPending
import CG_Text_PaintChar
import CG_Draw3DModel
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
import CG_DrawTeamBackground
import CG_DrawFlagModel
import CG_DrawActive
import CG_DrawHead
import CG_CenterPrint
import CG_AddLagometerSnapshotInfo
import CG_AddLagometerFrameInfo
import teamChat2
import teamChat1
import systemChat
import drawTeamOverlayModificationCount
import numSortedTeamPlayers
import sortedTeamPlayers
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
LABELV $235
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $234
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 98
byte 1 105
byte 1 103
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 115
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $232
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 115
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 105
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $213
byte 1 94
byte 1 49
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 99
byte 1 101
byte 1 50
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $210
byte 1 94
byte 1 49
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 99
byte 1 101
byte 1 49
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $207
byte 1 94
byte 1 49
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 120
byte 1 45
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $204
byte 1 94
byte 1 49
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 120
byte 1 45
byte 1 111
byte 1 102
byte 1 102
byte 1 115
byte 1 101
byte 1 116
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $201
byte 1 94
byte 1 49
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 121
byte 1 48
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $198
byte 1 94
byte 1 49
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 120
byte 1 48
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $195
byte 1 94
byte 1 49
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 32
byte 1 105
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 32
byte 1 37
byte 1 105
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $183
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 32
byte 1 105
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 115
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $180
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 32
byte 1 104
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $177
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 100
byte 1 104
byte 1 116
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $174
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 105
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 104
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $170
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 105
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 119
byte 1 105
byte 1 100
byte 1 116
byte 1 104
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $166
byte 1 102
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $163
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 32
byte 1 105
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 32
byte 1 100
byte 1 111
byte 1 101
byte 1 115
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 101
byte 1 120
byte 1 105
byte 1 115
byte 1 116
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $160
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 32
byte 1 105
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 115
byte 1 44
byte 1 32
byte 1 105
byte 1 103
byte 1 110
byte 1 111
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $157
byte 1 105
byte 1 109
byte 1 103
byte 1 0
align 1
LABELV $154
byte 1 94
byte 1 49
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $148
byte 1 94
byte 1 51
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $145
byte 1 94
byte 1 51
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 111
byte 1 112
byte 1 101
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
