code
proc UI_ReadableSize 12 16
file "..\..\..\..\code\q3_ui\ui_connect.c"
line 20
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "ui_local.h"
;4:
;5:/*
;6:===============================================================================
;7:
;8:CONNECTION SCREEN
;9:
;10:===============================================================================
;11:*/
;12:
;13://qboolean	passwordNeeded = qtrue;
;14://menufield_s passwordField;
;15:
;16:static connstate_t	lastConnState;
;17:static char			lastLoadingText[MAX_INFO_VALUE];
;18:
;19:static void UI_ReadableSize ( char *buf, int bufsize, int value )
;20:{
line 21
;21:	if (value > 1024*1024*1024 ) { // gigs
ADDRFP4 8
INDIRI4
CNSTI4 1073741824
LEI4 $70
line 22
;22:		Com_sprintf( buf, bufsize, "%d", value / (1024*1024*1024) );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $72
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1073741824
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 23
;23:		Com_sprintf( buf+strlen(buf), bufsize-strlen(buf), ".%02d GB", 
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ARGI4
ADDRGP4 $73
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1073741824
MODI4
CNSTI4 100
MULI4
CNSTI4 1073741824
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 25
;24:			(value % (1024*1024*1024))*100 / (1024*1024*1024) );
;25:	} else if (value > 1024*1024 ) { // megs
ADDRGP4 $71
JUMPV
LABELV $70
ADDRFP4 8
INDIRI4
CNSTI4 1048576
LEI4 $74
line 26
;26:		Com_sprintf( buf, bufsize, "%d", value / (1024*1024) );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $72
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1048576
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 27
;27:		Com_sprintf( buf+strlen(buf), bufsize-strlen(buf), ".%02d MB", 
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ARGI4
ADDRGP4 $76
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1048576
MODI4
CNSTI4 100
MULI4
CNSTI4 1048576
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 29
;28:			(value % (1024*1024))*100 / (1024*1024) );
;29:	} else if (value > 1024 ) { // kilos
ADDRGP4 $75
JUMPV
LABELV $74
ADDRFP4 8
INDIRI4
CNSTI4 1024
LEI4 $77
line 30
;30:		Com_sprintf( buf, bufsize, "%d KB", value / 1024 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $79
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1024
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 31
;31:	} else { // bytes
ADDRGP4 $78
JUMPV
LABELV $77
line 32
;32:		Com_sprintf( buf, bufsize, "%d bytes", value );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $80
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 33
;33:	}
LABELV $78
LABELV $75
LABELV $71
line 34
;34:}
LABELV $69
endproc UI_ReadableSize 12 16
proc UI_PrintTime 4 20
line 37
;35:
;36:// Assumes time is in msec
;37:static void UI_PrintTime ( char *buf, int bufsize, int time ) {
line 38
;38:	time /= 1000;  // change to seconds
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 1000
DIVI4
ASGNI4
line 40
;39:
;40:	if (time > 3600) { // in the hours range
ADDRFP4 8
INDIRI4
CNSTI4 3600
LEI4 $82
line 41
;41:		Com_sprintf( buf, bufsize, "%d hr %d min", time / 3600, (time % 3600) / 60 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $84
ARGP4
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3600
DIVI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 3600
MODI4
CNSTI4 60
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 42
;42:	} else if (time > 60) { // mins
ADDRGP4 $83
JUMPV
LABELV $82
ADDRFP4 8
INDIRI4
CNSTI4 60
LEI4 $85
line 43
;43:		Com_sprintf( buf, bufsize, "%d min %d sec", time / 60, time % 60 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $87
ARGP4
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 60
DIVI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 60
MODI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 44
;44:	} else  { // secs
ADDRGP4 $86
JUMPV
LABELV $85
line 45
;45:		Com_sprintf( buf, bufsize, "%d sec", time );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $88
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 46
;46:	}
LABELV $86
LABELV $83
line 47
;47:}
LABELV $81
endproc UI_PrintTime 4 20
lit
align 1
LABELV $90
byte 1 68
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 0
align 1
LABELV $91
byte 1 69
byte 1 115
byte 1 116
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $92
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 102
byte 1 101
byte 1 114
byte 1 32
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 58
byte 1 0
code
proc UI_DisplayDownloadInfo 412 20
line 49
;48:
;49:static void UI_DisplayDownloadInfo( const char *downloadName ) {
line 58
;50:	static char dlText[]	= "Downloading:";
;51:	static char etaText[]	= "Estimated time left:";
;52:	static char xferText[]	= "Transfer rate:";
;53:
;54:	int downloadSize, downloadCount, downloadTime, percentage;
;55:	char dlSizeBuf[64], totalSizeBuf[64], xferRateBuf[64], dlTimeBuf[64], buf[64];
;56:	int xferRate;
;57:	int width, leftWidth, div;
;58:	int style = UI_LEFT|UI_SMALLFONT|UI_DROPSHADOW;
ADDRLP4 0
CNSTI4 2064
ASGNI4
line 61
;59:	const char *s;
;60:
;61:	trap_Cvar_VariableStringBuffer( "cl_downloadSize", buf, sizeof( buf ) );
ADDRGP4 $93
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 62
;62:	downloadSize = atoi( buf );
ADDRLP4 4
ARGP4
ADDRLP4 360
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 76
ADDRLP4 360
INDIRI4
ASGNI4
line 63
;63:	trap_Cvar_VariableStringBuffer( "cl_downloadCount", buf, sizeof( buf ) );
ADDRGP4 $94
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 64
;64:	downloadCount = atoi( buf ); 
ADDRLP4 4
ARGP4
ADDRLP4 364
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 80
ADDRLP4 364
INDIRI4
ASGNI4
line 65
;65:	trap_Cvar_VariableStringBuffer( "cl_downloadTime", buf, sizeof( buf ) );
ADDRGP4 $95
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 66
;66:	downloadTime = atoi( buf );
ADDRLP4 4
ARGP4
ADDRLP4 368
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 212
ADDRLP4 368
INDIRI4
ASGNI4
line 77
;67:
;68:#if 0 // bk010104
;69:	fprintf( stderr, "\n\n-----------------------------------------------\n");
;70:	fprintf( stderr, "DB: downloadSize:  %16d\n", downloadSize );
;71:	fprintf( stderr, "DB: downloadCount: %16d\n", downloadCount );
;72:	fprintf( stderr, "DB: downloadTime:  %16d\n", downloadTime );  
;73:  	fprintf( stderr, "DB: UI realtime:   %16d\n", uis.realtime );	// bk
;74:	fprintf( stderr, "DB: UI frametime:  %16d\n", uis.frametime );	// bk
;75:#endif
;76:
;77:	leftWidth = width = UI_ProportionalStringWidth( dlText ) * UI_ProportionalSizeScale( style );
ADDRGP4 $90
ARGP4
ADDRLP4 372
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 376
ADDRGP4 UI_ProportionalSizeScale
CALLF4
ASGNF4
ADDRLP4 380
ADDRLP4 372
INDIRI4
CVIF4 4
ADDRLP4 376
INDIRF4
MULF4
CVFI4 4
ASGNI4
ADDRLP4 72
ADDRLP4 380
INDIRI4
ASGNI4
ADDRLP4 68
ADDRLP4 380
INDIRI4
ASGNI4
line 78
;78:	width = UI_ProportionalStringWidth( etaText ) * UI_ProportionalSizeScale( style );
ADDRGP4 $91
ARGP4
ADDRLP4 384
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 388
ADDRGP4 UI_ProportionalSizeScale
CALLF4
ASGNF4
ADDRLP4 72
ADDRLP4 384
INDIRI4
CVIF4 4
ADDRLP4 388
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 79
;79:	if (width > leftWidth) leftWidth = width;
ADDRLP4 72
INDIRI4
ADDRLP4 68
INDIRI4
LEI4 $96
ADDRLP4 68
ADDRLP4 72
INDIRI4
ASGNI4
LABELV $96
line 80
;80:	width = UI_ProportionalStringWidth( xferText ) * UI_ProportionalSizeScale( style );
ADDRGP4 $92
ARGP4
ADDRLP4 392
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 396
ADDRGP4 UI_ProportionalSizeScale
CALLF4
ASGNF4
ADDRLP4 72
ADDRLP4 392
INDIRI4
CVIF4 4
ADDRLP4 396
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 81
;81:	if (width > leftWidth) leftWidth = width;
ADDRLP4 72
INDIRI4
ADDRLP4 68
INDIRI4
LEI4 $98
ADDRLP4 68
ADDRLP4 72
INDIRI4
ASGNI4
LABELV $98
line 82
;82:	leftWidth += 16;
ADDRLP4 68
ADDRLP4 68
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 84
;83:
;84:	UI_DrawProportionalString( 8, 128, dlText, style, color_white );
CNSTI4 8
ARGI4
CNSTI4 128
ARGI4
ADDRGP4 $90
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 85
;85:	UI_DrawProportionalString( 8, 160, etaText, style, color_white );
CNSTI4 8
ARGI4
CNSTI4 160
ARGI4
ADDRGP4 $91
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 86
;86:	UI_DrawProportionalString( 8, 224, xferText, style, color_white );
CNSTI4 8
ARGI4
CNSTI4 224
ARGI4
ADDRGP4 $92
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 88
;87:
;88:	if (downloadSize > 0) {
ADDRLP4 76
INDIRI4
CNSTI4 0
LEI4 $100
line 89
;89:		if ( downloadCount > 21474836 ) {// x100 could cause overflow!
ADDRLP4 80
INDIRI4
CNSTI4 21474836
LEI4 $102
line 90
;90:			div = downloadSize >> 8;
ADDRLP4 356
ADDRLP4 76
INDIRI4
CNSTI4 8
RSHI4
ASGNI4
line 91
;91:			if ( div )
ADDRLP4 356
INDIRI4
CNSTI4 0
EQI4 $104
line 92
;92:				percentage = (downloadCount >> 8) * 100 / div;
ADDRLP4 224
ADDRLP4 80
INDIRI4
CNSTI4 8
RSHI4
CNSTI4 100
MULI4
ADDRLP4 356
INDIRI4
DIVI4
ASGNI4
ADDRGP4 $103
JUMPV
LABELV $104
line 94
;93:			else
;94:				percentage = 0;
ADDRLP4 224
CNSTI4 0
ASGNI4
line 95
;95:		} else
ADDRGP4 $103
JUMPV
LABELV $102
line 96
;96:			percentage = downloadCount * 100 / downloadSize;
ADDRLP4 224
ADDRLP4 80
INDIRI4
CNSTI4 100
MULI4
ADDRLP4 76
INDIRI4
DIVI4
ASGNI4
LABELV $103
line 97
;97:		if ( percentage > 100 ) 
ADDRLP4 224
INDIRI4
CNSTI4 100
LEI4 $106
line 98
;98:			percentage = 100;
ADDRLP4 224
CNSTI4 100
ASGNI4
LABELV $106
line 99
;99:		s = va( "%s (%d%%)", downloadName, percentage );
ADDRGP4 $108
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 224
INDIRI4
ARGI4
ADDRLP4 400
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 220
ADDRLP4 400
INDIRP4
ASGNP4
line 100
;100:	} else {
ADDRGP4 $101
JUMPV
LABELV $100
line 101
;101:		s = downloadName;
ADDRLP4 220
ADDRFP4 0
INDIRP4
ASGNP4
line 102
;102:	}
LABELV $101
line 104
;103:
;104:	UI_DrawProportionalString( leftWidth, 128, s, style, color_white );
ADDRLP4 68
INDIRI4
ARGI4
CNSTI4 128
ARGI4
ADDRLP4 220
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 106
;105:
;106:	UI_ReadableSize( dlSizeBuf,		sizeof dlSizeBuf,		downloadCount );
ADDRLP4 84
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 80
INDIRI4
ARGI4
ADDRGP4 UI_ReadableSize
CALLV
pop
line 107
;107:	UI_ReadableSize( totalSizeBuf,	sizeof totalSizeBuf,	downloadSize );
ADDRLP4 148
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 76
INDIRI4
ARGI4
ADDRGP4 UI_ReadableSize
CALLV
pop
line 109
;108:
;109:	if (downloadCount < 4096 || !downloadTime) {
ADDRLP4 80
INDIRI4
CNSTI4 4096
LTI4 $111
ADDRLP4 212
INDIRI4
CNSTI4 0
NEI4 $109
LABELV $111
line 110
;110:		UI_DrawProportionalString( leftWidth, 160, "estimating", style, color_white );
ADDRLP4 68
INDIRI4
ARGI4
CNSTI4 160
ARGI4
ADDRGP4 $112
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 111
;111:		UI_DrawProportionalString( leftWidth, 192, 
ADDRGP4 $113
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 148
ARGP4
ADDRLP4 400
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 68
INDIRI4
ARGI4
CNSTI4 192
ARGI4
ADDRLP4 400
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 113
;112:			va("(%s of %s copied)", dlSizeBuf, totalSizeBuf), style, color_white );
;113:	} else {
ADDRGP4 $110
JUMPV
LABELV $109
line 118
;114:	  // bk010108
;115:	  //float elapsedTime = (float)(uis.realtime - downloadTime); // current - start (msecs)
;116:	  //elapsedTime = elapsedTime * 0.001f; // in seconds
;117:	  //if ( elapsedTime <= 0.0f ) elapsedTime == 0.0f;
;118:	  if ( (uis.realtime - downloadTime) / 1000) {
ADDRGP4 uis+4
INDIRI4
ADDRLP4 212
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
CNSTI4 0
EQI4 $114
line 119
;119:			xferRate = downloadCount / ((uis.realtime - downloadTime) / 1000);
ADDRLP4 216
ADDRLP4 80
INDIRI4
ADDRGP4 uis+4
INDIRI4
ADDRLP4 212
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
DIVI4
ASGNI4
line 121
;120:		  //xferRate = (int)( ((float)downloadCount) / elapsedTime);
;121:		} else {
ADDRGP4 $115
JUMPV
LABELV $114
line 122
;122:			xferRate = 0;
ADDRLP4 216
CNSTI4 0
ASGNI4
line 123
;123:		}
LABELV $115
line 128
;124:
;125:	  //fprintf( stderr, "DB: elapsedTime:  %16.8f\n", elapsedTime );	// bk
;126:	  //fprintf( stderr, "DB: xferRate:   %16d\n", xferRate );	// bk
;127:
;128:		UI_ReadableSize( xferRateBuf, sizeof xferRateBuf, xferRate );
ADDRLP4 228
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 216
INDIRI4
ARGI4
ADDRGP4 UI_ReadableSize
CALLV
pop
line 131
;129:
;130:		// Extrapolate estimated completion time
;131:		if (downloadSize && xferRate) {
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $118
ADDRLP4 216
INDIRI4
CNSTI4 0
EQI4 $118
line 132
;132:			int n = downloadSize / xferRate; // estimated time for entire d/l in secs
ADDRLP4 400
ADDRLP4 76
INDIRI4
ADDRLP4 216
INDIRI4
DIVI4
ASGNI4
line 135
;133:
;134:			// We do it in K (/1024) because we'd overflow around 4MB
;135:			n = (n - (((downloadCount/1024) * n) / (downloadSize/1024))) * 1000;
ADDRLP4 404
ADDRLP4 400
INDIRI4
ASGNI4
ADDRLP4 400
ADDRLP4 404
INDIRI4
ADDRLP4 80
INDIRI4
CNSTI4 1024
DIVI4
ADDRLP4 404
INDIRI4
MULI4
ADDRLP4 76
INDIRI4
CNSTI4 1024
DIVI4
DIVI4
SUBI4
CNSTI4 1000
MULI4
ASGNI4
line 137
;136:			
;137:			UI_PrintTime ( dlTimeBuf, sizeof dlTimeBuf, n ); // bk010104
ADDRLP4 292
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 400
INDIRI4
ARGI4
ADDRGP4 UI_PrintTime
CALLV
pop
line 140
;138:				//(n - (((downloadCount/1024) * n) / (downloadSize/1024))) * 1000);
;139:
;140:			UI_DrawProportionalString( leftWidth, 160, 
ADDRLP4 68
INDIRI4
ARGI4
CNSTI4 160
ARGI4
ADDRLP4 292
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 142
;141:				dlTimeBuf, style, color_white );
;142:			UI_DrawProportionalString( leftWidth, 192, 
ADDRGP4 $113
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 148
ARGP4
ADDRLP4 408
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 68
INDIRI4
ARGI4
CNSTI4 192
ARGI4
ADDRLP4 408
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 144
;143:				va("(%s of %s copied)", dlSizeBuf, totalSizeBuf), style, color_white );
;144:		} else {
ADDRGP4 $119
JUMPV
LABELV $118
line 145
;145:			UI_DrawProportionalString( leftWidth, 160, 
ADDRLP4 68
INDIRI4
ARGI4
CNSTI4 160
ARGI4
ADDRGP4 $112
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 147
;146:				"estimating", style, color_white );
;147:			if (downloadSize) {
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $120
line 148
;148:				UI_DrawProportionalString( leftWidth, 192, 
ADDRGP4 $113
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 148
ARGP4
ADDRLP4 400
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 68
INDIRI4
ARGI4
CNSTI4 192
ARGI4
ADDRLP4 400
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 150
;149:					va("(%s of %s copied)", dlSizeBuf, totalSizeBuf), style, color_white );
;150:			} else {
ADDRGP4 $121
JUMPV
LABELV $120
line 151
;151:				UI_DrawProportionalString( leftWidth, 192, 
ADDRGP4 $122
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 400
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 68
INDIRI4
ARGI4
CNSTI4 192
ARGI4
ADDRLP4 400
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 153
;152:					va("(%s copied)", dlSizeBuf), style, color_white );
;153:			}
LABELV $121
line 154
;154:		}
LABELV $119
line 156
;155:
;156:		if (xferRate) {
ADDRLP4 216
INDIRI4
CNSTI4 0
EQI4 $123
line 157
;157:			UI_DrawProportionalString( leftWidth, 224, 
ADDRGP4 $125
ARGP4
ADDRLP4 228
ARGP4
ADDRLP4 400
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 68
INDIRI4
ARGI4
CNSTI4 224
ARGI4
ADDRLP4 400
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 159
;158:				va("%s/Sec", xferRateBuf), style, color_white );
;159:		}
LABELV $123
line 160
;160:	}
LABELV $110
line 161
;161:}
LABELV $89
endproc UI_DisplayDownloadInfo 412 20
export UI_DrawConnectScreen
proc UI_DrawConnectScreen 5168 36
line 171
;162:
;163:/*
;164:========================
;165:UI_DrawConnectScreen
;166:
;167:This will also be overlaid on the cgame info screen during loading
;168:to prevent it from blinking away too rapidly on local or lan games.
;169:========================
;170:*/
;171:void UI_DrawConnectScreen( qboolean overlay ) {
line 176
;172:	char			*s;
;173:	uiClientState_t	cstate;
;174:	char			info[MAX_INFO_VALUE];
;175:
;176:	UI_VideoCheck( trap_Milliseconds() );
ADDRLP4 4112
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 4112
INDIRI4
ARGI4
ADDRGP4 UI_VideoCheck
CALLV
pop
line 178
;177:
;178:	Menu_Cache();
ADDRGP4 Menu_Cache
CALLV
pop
line 180
;179:
;180:	if ( !overlay ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $127
line 182
;181:		// draw the dialog background
;182:		UI_SetColor( color_white );
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_SetColor
CALLV
pop
line 184
;183:		// fill whole screen, not just 640x480 virtual rectangle
;184:		trap_R_DrawStretchPic( 0, 0, uis.glconfig.vidWidth, uis.glconfig.vidHeight, 0, 0, 1, 1, uis.menuBackShader );
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
ADDRGP4 uis+56+11304
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 uis+56+11308
INDIRI4
CVIF4 4
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 uis+11396
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 185
;185:	}
LABELV $127
line 188
;186:
;187:	// see what information we should display
;188:	trap_GetClientState( &cstate );
ADDRLP4 0
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 190
;189:
;190:	info[0] = '\0';
ADDRLP4 3084
CNSTI1 0
ASGNI1
line 191
;191:	if( trap_GetConfigString( CS_SERVERINFO, info, sizeof(info) ) ) {
CNSTI4 0
ARGI4
ADDRLP4 3084
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4116
ADDRGP4 trap_GetConfigString
CALLI4
ASGNI4
ADDRLP4 4116
INDIRI4
CNSTI4 0
EQI4 $134
line 192
;192:		UI_DrawProportionalString( 320, 16, va( "Loading %s", Info_ValueForKey( info, "mapname" ) ), UI_BIGFONT|UI_CENTER|UI_DROPSHADOW, color_white );
ADDRLP4 3084
ARGP4
ADDRGP4 $137
ARGP4
ADDRLP4 4120
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $136
ARGP4
ADDRLP4 4120
INDIRP4
ARGP4
ADDRLP4 4124
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
CNSTI4 16
ARGI4
ADDRLP4 4124
INDIRP4
ARGP4
CNSTI4 2081
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 193
;193:	}
LABELV $134
line 195
;194:
;195:	UI_DrawProportionalString( 320, 64, va("Connecting to %s", cstate.servername), UI_CENTER|UI_SMALLFONT|UI_DROPSHADOW, menu_text_color );
ADDRGP4 $138
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 4120
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
CNSTI4 64
ARGI4
ADDRLP4 4120
INDIRP4
ARGP4
CNSTI4 2065
ARGI4
ADDRGP4 menu_text_color
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 199
;196:	//UI_DrawProportionalString( 320, 96, "Press Esc to abort", UI_CENTER|UI_SMALLFONT|UI_DROPSHADOW, menu_text_color );
;197:
;198:	// display global MOTD at bottom
;199:	UI_DrawProportionalString( SCREEN_WIDTH/2, SCREEN_HEIGHT-32, 
ADDRLP4 0+1036
ARGP4
ADDRGP4 $141
ARGP4
ADDRLP4 4124
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
CNSTI4 320
ARGI4
CNSTI4 448
ARGI4
ADDRLP4 4124
INDIRP4
ARGP4
CNSTI4 2065
ARGI4
ADDRGP4 menu_text_color
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 203
;200:		Info_ValueForKey( cstate.updateInfoString, "motd" ), UI_CENTER|UI_SMALLFONT|UI_DROPSHADOW, menu_text_color );
;201:	
;202:	// print any server info (server full, bad version, etc)
;203:	if ( cstate.connState < CA_CONNECTED ) {
ADDRLP4 0
INDIRI4
CNSTI4 5
GEI4 $142
line 204
;204:		UI_DrawProportionalString_AutoWrapped( 320, 192, 630, 20, cstate.messageString, UI_CENTER|UI_SMALLFONT|UI_DROPSHADOW, menu_text_color );
CNSTI4 320
ARGI4
CNSTI4 192
ARGI4
CNSTI4 630
ARGI4
CNSTI4 20
ARGI4
ADDRLP4 0+2060
ARGP4
CNSTI4 2065
ARGI4
ADDRGP4 menu_text_color
ARGP4
ADDRGP4 UI_DrawProportionalString_AutoWrapped
CALLV
pop
line 205
;205:	}
LABELV $142
line 231
;206:
;207:#if 0
;208:	// display password field
;209:	if ( passwordNeeded ) {
;210:		s_ingame_menu.x = SCREEN_WIDTH * 0.50 - 128;
;211:		s_ingame_menu.nitems = 0;
;212:		s_ingame_menu.wrapAround = qtrue;
;213:
;214:		passwordField.generic.type = MTYPE_FIELD;
;215:		passwordField.generic.name = "Password:";
;216:		passwordField.generic.callback = 0;
;217:		passwordField.generic.x		= 10;
;218:		passwordField.generic.y		= 180;
;219:		Field_Clear( &passwordField.field );
;220:		passwordField.width = 256;
;221:		passwordField.field.widthInChars = 16;
;222:		Q_strncpyz( passwordField.field.buffer, Cvar_VariableString("password"), 
;223:			sizeof(passwordField.field.buffer) );
;224:
;225:		Menu_AddItem( &s_ingame_menu, ( void * ) &s_customize_player_action );
;226:
;227:		MField_Draw( &passwordField );
;228:	}
;229:#endif
;230:
;231:	if ( lastConnState > cstate.connState ) {
ADDRGP4 lastConnState
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $145
line 232
;232:		lastLoadingText[0] = '\0';
ADDRGP4 lastLoadingText
CNSTI1 0
ASGNI1
line 233
;233:	}
LABELV $145
line 234
;234:	lastConnState = cstate.connState;
ADDRGP4 lastConnState
ADDRLP4 0
INDIRI4
ASGNI4
line 236
;235:
;236:	switch ( cstate.connState ) {
ADDRLP4 4128
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 4128
INDIRI4
CNSTI4 3
LTI4 $126
ADDRLP4 4128
INDIRI4
CNSTI4 7
GTI4 $126
ADDRLP4 4128
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $163-12
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $163
address $150
address $153
address $156
address $126
address $126
code
LABELV $150
line 238
;237:	case CA_CONNECTING:
;238:		s = va("Awaiting challenge...%i", cstate.connectPacketCount);
ADDRGP4 $151
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 4136
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4108
ADDRLP4 4136
INDIRP4
ASGNP4
line 239
;239:		break;
ADDRGP4 $148
JUMPV
LABELV $153
line 241
;240:	case CA_CHALLENGING:
;241:		s = va("Awaiting connection...%i", cstate.connectPacketCount);
ADDRGP4 $154
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 4140
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4108
ADDRLP4 4140
INDIRP4
ASGNP4
line 242
;242:		break;
ADDRGP4 $148
JUMPV
LABELV $156
line 243
;243:	case CA_CONNECTED: {
line 246
;244:		char downloadName[MAX_INFO_VALUE];
;245:
;246:			trap_Cvar_VariableStringBuffer( "cl_downloadName", downloadName, sizeof(downloadName) );
ADDRGP4 $157
ARGP4
ADDRLP4 4144
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 247
;247:			if (*downloadName) {
ADDRLP4 4144
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $158
line 248
;248:				UI_DisplayDownloadInfo( downloadName );
ADDRLP4 4144
ARGP4
ADDRGP4 UI_DisplayDownloadInfo
CALLV
pop
line 249
;249:				return;
ADDRGP4 $126
JUMPV
LABELV $158
line 251
;250:			}
;251:		}
line 252
;252:		s = "Awaiting gamestate...";
ADDRLP4 4108
ADDRGP4 $160
ASGNP4
line 253
;253:		break;
line 255
;254:	case CA_LOADING:
;255:		return;
line 257
;256:	case CA_PRIMED:
;257:		return;
line 259
;258:	default:
;259:		return;
LABELV $148
line 262
;260:	}
;261:
;262:	UI_DrawProportionalString( 320, 128, s, UI_CENTER|UI_SMALLFONT|UI_DROPSHADOW, color_white );
CNSTI4 320
ARGI4
CNSTI4 128
ARGI4
ADDRLP4 4108
INDIRP4
ARGP4
CNSTI4 2065
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 265
;263:
;264:	// password required / connection rejected information goes here
;265:}
LABELV $126
endproc UI_DrawConnectScreen 5168 36
export UI_KeyConnect
proc UI_KeyConnect 0 8
line 273
;266:
;267:
;268:/*
;269:===================
;270:UI_KeyConnect
;271:===================
;272:*/
;273:void UI_KeyConnect( int key ) {
line 274
;274:	if ( key == K_ESCAPE ) {
ADDRFP4 0
INDIRI4
CNSTI4 27
NEI4 $166
line 275
;275:		trap_Cmd_ExecuteText( EXEC_APPEND, "disconnect\n" );
CNSTI4 2
ARGI4
ADDRGP4 $168
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 276
;276:		return;
LABELV $166
line 278
;277:	}
;278:}
LABELV $165
endproc UI_KeyConnect 0 8
bss
align 1
LABELV lastLoadingText
skip 1024
align 4
LABELV lastConnState
skip 4
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
import UI_SaveConfigMenu
import UI_SaveConfigMenu_Cache
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
LABELV $168
byte 1 100
byte 1 105
byte 1 115
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $160
byte 1 65
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 101
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $157
byte 1 99
byte 1 108
byte 1 95
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $154
byte 1 65
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 46
byte 1 46
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $151
byte 1 65
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 101
byte 1 46
byte 1 46
byte 1 46
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $141
byte 1 109
byte 1 111
byte 1 116
byte 1 100
byte 1 0
align 1
LABELV $138
byte 1 67
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $137
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $136
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $125
byte 1 37
byte 1 115
byte 1 47
byte 1 83
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $122
byte 1 40
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 112
byte 1 105
byte 1 101
byte 1 100
byte 1 41
byte 1 0
align 1
LABELV $113
byte 1 40
byte 1 37
byte 1 115
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 112
byte 1 105
byte 1 101
byte 1 100
byte 1 41
byte 1 0
align 1
LABELV $112
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $108
byte 1 37
byte 1 115
byte 1 32
byte 1 40
byte 1 37
byte 1 100
byte 1 37
byte 1 37
byte 1 41
byte 1 0
align 1
LABELV $95
byte 1 99
byte 1 108
byte 1 95
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $94
byte 1 99
byte 1 108
byte 1 95
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 67
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $93
byte 1 99
byte 1 108
byte 1 95
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 83
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $88
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $87
byte 1 37
byte 1 100
byte 1 32
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $84
byte 1 37
byte 1 100
byte 1 32
byte 1 104
byte 1 114
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 109
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $80
byte 1 37
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 116
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $79
byte 1 37
byte 1 100
byte 1 32
byte 1 75
byte 1 66
byte 1 0
align 1
LABELV $76
byte 1 46
byte 1 37
byte 1 48
byte 1 50
byte 1 100
byte 1 32
byte 1 77
byte 1 66
byte 1 0
align 1
LABELV $73
byte 1 46
byte 1 37
byte 1 48
byte 1 50
byte 1 100
byte 1 32
byte 1 71
byte 1 66
byte 1 0
align 1
LABELV $72
byte 1 37
byte 1 100
byte 1 0
