
`define so 32'd784
`define fa 32'd698
`define mi 32'd659
`define re 32'd587
`define do 32'd523

`define SI 32'd494
`define LA 32'd440
`define SO 32'd392
`define FA 32'd349
`define MI 32'd330
`define RE 32'd294
`define DO 32'd262

`define mi_2 32'd622
`define SI_2 32'd466

`define do_d 32'd131
`define re_d 32'd147
`define mi_d 32'd165
`define fa_d 32'd174
`define so_d 32'd196
`define la_d 32'd220
`define si_d 32'd247
`define DO_d 32'd262
`define RE_d 32'd294


`define re_d_2 32'd73
`define mi_d_2 32'd83
`define fa_d_2 32'd87
`define so_d_2 32'd98
`define la_d_2 32'd110
`define si_d_2 32'd123

`define si_d_2_d 32'd116
`define mi_d_2_d 32'd156
`define mi_d_d 32'd156

`define sil 32'd50000000

module SongOf105 (
	input [11:0] ibeatNum,
	input en,
	output reg [31:0] toneL,
    output reg [31:0] toneR
);

    always @* begin
        if(en == 1) begin
            case(ibeatNum)
                // --- Measure 1 ---
                    12'd0: toneR = `sil;      12'd1: toneR = `sil;// HG (half-beat)
                    12'd2: toneR = `sil;      12'd3: toneR = `sil;
                    12'd4: toneR = `sil;      12'd5: toneR = `sil;
                    12'd6: toneR = `sil;      12'd7: toneR = `sil;
                    12'd8: toneR = `sil;      12'd9: toneR = `sil;// HE (half-beat)
                    12'd10: toneR = `sil;     12'd11: toneR = `sil;
                    12'd12: toneR = `sil;     12'd13: toneR = `sil;
                    12'd14: toneR = `sil;    12'd15: toneR = `sil; // (Short break for repetitive notes: high E)

                    12'd16: toneR = `re;     12'd17: toneR = `re; // HE (one-beat)
                    12'd18: toneR = `re;     12'd19: toneR = `re;
                    12'd20: toneR = `re;     12'd21: toneR = `re;
                    12'd22: toneR = `re;     12'd23: toneR = `sil;
                    12'd24: toneR = `re;     12'd25: toneR = `re;
                    12'd26: toneR = `re;     12'd27: toneR = `re;
                    12'd28: toneR = `re;     12'd29: toneR = `re;
                    12'd30: toneR = `re;     12'd31: toneR = `re;

                    12'd32: toneR = `mi_2;     12'd33: toneR = `mi_2; // HF (half-beat)
                    12'd34: toneR = `mi_2;     12'd35: toneR = `mi_2;
                    12'd36: toneR = `mi_2;     12'd37: toneR = `mi_2;
                    12'd38: toneR = `mi_2;     12'd39: toneR = `mi_2;
                    12'd40: toneR = `re;     12'd41: toneR = `re; // HD (half-beat)
                    12'd42: toneR = `re;     12'd43: toneR = `re;
                    12'd44: toneR = `re;     12'd45: toneR = `re;
                    12'd46: toneR = `re;     12'd47: toneR = `re; // (Short break for repetitive notes: high D)

                    12'd48: toneR = `do;     12'd49: toneR = `do; // HD (one-beat)
                    12'd50: toneR = `do;     12'd51: toneR = `do;
                    12'd52: toneR = `do;     12'd53: toneR = `do;
                    12'd54: toneR = `do;     12'd55: toneR = `do;
                    12'd56: toneR = `re;     12'd57: toneR = `re;
                    12'd58: toneR = `re;     12'd59: toneR = `re;
                    12'd60: toneR = `re;     12'd61: toneR = `re;
                    12'd62: toneR = `re;     12'd63: toneR = `re;

                    // --- Measure 2 ---
                    12'd64: toneR = `FA;     12'd65: toneR = `FA; // HC (half-beat)
                    12'd66: toneR = `FA;     12'd67: toneR = `FA;
                    12'd68: toneR = `FA;     12'd69: toneR = `FA;
                    12'd70: toneR = `FA;     12'd71: toneR = `FA;
                    12'd72: toneR = `FA;     12'd73: toneR = `FA; // HD (half-beat)
                    12'd74: toneR = `FA;     12'd75: toneR = `FA;
                    12'd76: toneR = `FA;     12'd77: toneR = `FA;
                    12'd78: toneR = `FA;     12'd79: toneR = `FA;

                    12'd80: toneR = `do;     12'd81: toneR = `do; // HE (half-beat)
                    12'd82: toneR = `do;     12'd83: toneR = `do;
                    12'd84: toneR = `do;     12'd85: toneR = `do;
                    12'd86: toneR = `do;     12'd87: toneR = `do;
                    12'd88: toneR = `SI_2;     12'd89: toneR = `SI_2; // HF (half-beat)
                    12'd90: toneR = `SI_2;     12'd91: toneR = `SI_2;
                    12'd92: toneR = `SI_2;     12'd93: toneR = `SI_2;
                    12'd94: toneR = `SI_2;     12'd95: toneR = `SI_2;

                    12'd96: toneR = `SO;     12'd97: toneR = `SO; // HG (half-beat)
                    12'd98: toneR = `SO;     12'd99: toneR = `SO;
                    12'd100: toneR = `SO;    12'd101: toneR = `SO;
                    12'd102: toneR = `SO;    12'd103: toneR = `SO; // (Short break for repetitive notes: high G)
                    12'd104: toneR = `SO;    12'd105: toneR = `SO; // HG (half-beat)
                    12'd106: toneR = `SO;    12'd107: toneR = `SO;
                    12'd108: toneR = `SO;    12'd109: toneR = `SO;
                    12'd110: toneR = `SO;    12'd111: toneR = `SO; // (Short break for repetitive notes: high G)

                    12'd112: toneR = `SI_2;    12'd113: toneR = `SI_2; // HG (one-beat)
                    12'd114: toneR = `SI_2;    12'd115: toneR = `SI_2;
                    12'd116: toneR = `SI_2;    12'd117: toneR = `SI_2;
                    12'd118: toneR = `SI_2;    12'd119: toneR = `SI_2;
                    12'd120: toneR = `SI_2;    12'd121: toneR = `SI_2;
                    12'd122: toneR = `SI_2;    12'd123: toneR = `SI_2;
                    12'd124: toneR = `SI_2;    12'd125: toneR = `SI_2;
                    12'd126: toneR = `SI_2;    12'd127: toneR = `SI_2; // (Short break for repetitive notes: high G)

                    // --- Measure 3 ---
                    12'd128: toneR = `do;      12'd129: toneR = `do; // HG (half-beat)
                    12'd130: toneR = `do;      12'd131: toneR = `do;
                    12'd132: toneR = `do;      12'd133: toneR = `do;
                    12'd134: toneR = `do;      12'd135: toneR = `do;
                    12'd136: toneR = `do;      12'd137: toneR = `do; // HE (half-beat)
                    12'd138: toneR = `do;      12'd139: toneR = `do;
                    12'd140: toneR = `do;      12'd141: toneR = `do;
                    12'd142: toneR = `do;      12'd143: toneR = `sil; // (Short break for repetitive notes: high E)

                    12'd144: toneR = `do;     12'd145: toneR = `do; // HE (one-beat)
                    12'd146: toneR = `do;     12'd147: toneR = `do;
                    12'd148: toneR = `do;     12'd149: toneR = `do;
                    12'd150: toneR = `do;     12'd151: toneR = `sil;
                    12'd152: toneR = `do;     12'd153: toneR = `do;
                    12'd154: toneR = `do;     12'd155: toneR = `do;
                    12'd156: toneR = `do;     12'd157: toneR = `do;
                    12'd158: toneR = `do;     12'd159: toneR = `sil;

                    12'd160: toneR = `re;     12'd161: toneR = `re; // HF (half-beat)
                    12'd162: toneR = `re;     12'd163: toneR = `re;
                    12'd164: toneR = `re;     12'd165: toneR = `re;
                    12'd166: toneR = `re;     12'd167: toneR = `re;
                    12'd168: toneR = `do;     12'd169: toneR = `do; // HD (half-beat)
                    12'd170: toneR = `do;     12'd171: toneR = `do;
                    12'd172: toneR = `do;     12'd173: toneR = `do;
                    12'd174: toneR = `do;     12'd175: toneR = `do; // (Short break for repetitive notes: high D)

                    12'd176: toneR = `SI_2;     12'd177: toneR = `SI_2; // HD (one-beat)
                    12'd178: toneR = `SI_2;     12'd179: toneR = `SI_2;
                    12'd180: toneR = `SI_2;     12'd181: toneR = `SI_2;
                    12'd182: toneR = `SI_2;     12'd183: toneR = `SI_2;
                    12'd184: toneR = `do;     12'd185: toneR = `do;
                    12'd186: toneR = `do;     12'd187: toneR = `do;
                    12'd188: toneR = `do;     12'd189: toneR = `do;
                    12'd190: toneR = `do;     12'd191: toneR = `do;

                    // --- Measure 4 ---
                    12'd192: toneR = `re;     12'd193: toneR = `re; // HC (half-beat)
                    12'd194: toneR = `re;     12'd495: toneR = `re;
                    12'd196: toneR = `re;     12'd197: toneR = `re;
                    12'd198: toneR = `re;     12'd199: toneR = `re;
                    12'd200: toneR = `re;     12'd201: toneR = `re; // HE (half-beat)
                    12'd202: toneR = `re;     12'd203: toneR = `re;
                    12'd204: toneR = `re;     12'd205: toneR = `re;
                    12'd206: toneR = `re;     12'd207: toneR = `re;

                    12'd208: toneR = `SI_2;     12'd209: toneR = `SI_2; // HG (half-beat)
                    12'd210: toneR = `SI_2;     12'd211: toneR = `SI_2;
                    12'd212: toneR = `SI_2;     12'd213: toneR = `SI_2;
                    12'd214: toneR = `SI_2;     12'd215: toneR = `SI_2; // (Short break for repetitive notes: high G)
                    12'd216: toneR = `SO;     12'd217: toneR = `SO; // HG (half-beat)
                    12'd218: toneR = `SO;     12'd219: toneR = `SO;
                    12'd220: toneR = `SO;     12'd221: toneR = `SO;
                    12'd222: toneR = `SO;     12'd223: toneR = `SO;

                    12'd224: toneR = `SI_2;     12'd225: toneR = `SI_2; // HC (half-beat)
                    12'd226: toneR = `SI_2;     12'd227: toneR = `SI_2;
                    12'd228: toneR = `SI_2;     12'd229: toneR = `SI_2;
                    12'd230: toneR = `SI_2;     12'd231: toneR = `SI_2; // (Short break for repetitive notes: high C)
                    12'd232: toneR = `SI_2;     12'd233: toneR = `SI_2; // HC (half-beat)
                    12'd234: toneR = `SI_2;     12'd235: toneR = `SI_2;
                    12'd236: toneR = `SI_2;     12'd237: toneR = `SI_2;
                    12'd238: toneR = `SI_2;     12'd239: toneR = `sil; // (Short break for repetitive notes: high C)

                    12'd240: toneR = `SI_2;     12'd241: toneR = `SI_2; // HC (one-beat)
                    12'd242: toneR = `SI_2;     12'd243: toneR = `SI_2;
                    12'd244: toneR = `SI_2;     12'd245: toneR = `SI_2;
                    12'd246: toneR = `SI_2;     12'd247: toneR = `SI_2;
                    12'd248: toneR = `SI_2;     12'd249: toneR = `SI_2;
                    12'd250: toneR = `SI_2;     12'd251: toneR = `SI_2;
                    12'd252: toneR = `SI_2;     12'd253: toneR = `SI_2;
                    12'd254: toneR = `SI_2;     12'd255: toneR = `SI_2;

                    // --- Measure 5 ---
                    12'd256: toneR = `SO;     12'd257: toneR = `SO; // HD (half-beat)
                    12'd258: toneR = `SO;     12'd259: toneR = `SO;
                    12'd260: toneR = `SO;     12'd261: toneR = `SO;
                    12'd262: toneR = `SO;     12'd263: toneR = `SO; // (Short break for repetitive notes: high D)
                    12'd264: toneR = `SO;     12'd265: toneR = `SO; // HD (half-beat)
                    12'd266: toneR = `SO;     12'd267: toneR = `SO;
                    12'd268: toneR = `SO;     12'd269: toneR = `SO;
                    12'd270: toneR = `SO;     12'd271: toneR = `SO; // (Short break for repetitive notes: high D)

                    12'd272: toneR = `re;     12'd273: toneR = `re; // HD (half-beat)
                    12'd274: toneR = `re;     12'd275: toneR = `re;
                    12'd276: toneR = `re;     12'd277: toneR = `re;
                    12'd278: toneR = `re;     12'd279: toneR = `sil; // (Short break for repetitive notes: high D)
                    12'd280: toneR = `re;     12'd281: toneR = `re; // HD (half-beat)
                    12'd282: toneR = `re;     12'd283: toneR = `re;
                    12'd284: toneR = `re;     12'd285: toneR = `re;
                    12'd286: toneR = `re;     12'd287: toneR = `re; // (Short break for repetitive notes: high D)

                    12'd288: toneR = `mi_2;     12'd289: toneR = `mi_2; // HD (half-beat)
                    12'd290: toneR = `mi_2;     12'd291: toneR = `mi_2;
                    12'd292: toneR = `mi_2;     12'd293: toneR = `mi_2;
                    12'd294: toneR = `mi_2;     12'd295: toneR = `mi_2;
                    12'd296: toneR = `re;     12'd297: toneR = `re; // HE (half-beat)
                    12'd298: toneR = `re;     12'd299: toneR = `re;
                    12'd300: toneR = `re;     12'd301: toneR = `re;
                    12'd302: toneR = `re;     12'd303: toneR = `re;

                    12'd304: toneR = `do;     12'd305: toneR = `do; // HF (one-beat)
                    12'd306: toneR = `do;     12'd307: toneR = `do;
                    12'd308: toneR = `do;     12'd309: toneR = `do;
                    12'd310: toneR = `do;     12'd311: toneR = `do;
                    12'd312: toneR = `SI_2;     12'd313: toneR = `SI_2;
                    12'd314: toneR = `SI_2;     12'd315: toneR = `SI_2;
                    12'd316: toneR = `SI_2;     12'd317: toneR = `SI_2;
                    12'd318: toneR = `SI_2;     12'd319: toneR = `SI_2;

                    // --- Measure 6 ---
                    12'd320: toneR = `re;     12'd321: toneR = `re; // HE (half-beat)
                    12'd322: toneR = `re;     12'd323: toneR = `re;
                    12'd324: toneR = `re;     12'd325: toneR = `re;
                    12'd326: toneR = `re;     12'd327: toneR = `re; // (Short break for repetitive notes: high E)
                    12'd328: toneR = `do;     12'd329: toneR = `do; // HE (half-beat)
                    12'd330: toneR = `do;     12'd331: toneR = `do;
                    12'd332: toneR = `do;     12'd333: toneR = `do;
                    12'd334: toneR = `do;     12'd335: toneR = `do; // (Short break for repetitive notes: high E)

                    12'd336: toneR = `do;     12'd337: toneR = `do; // HE (half-beat)
                    12'd338: toneR = `do;     12'd339: toneR = `do;
                    12'd340: toneR = `do;     12'd341: toneR = `do;
                    12'd342: toneR = `do;     12'd343: toneR = `do; // (Short break for repetitive notes: high E)
                    12'd344: toneR = `re;     12'd345: toneR = `re; // HE (half-beat)
                    12'd346: toneR = `re;     12'd347: toneR = `re;
                    12'd348: toneR = `re;     12'd349: toneR = `re;
                    12'd350: toneR = `re;     12'd351: toneR = `re; // (Short break for repetitive notes: high E)

                    12'd352: toneR = `SO;     12'd353: toneR = `SO; // HE (half-beat)
                    12'd354: toneR = `SO;     12'd355: toneR = `SO;
                    12'd356: toneR = `SO;     12'd357: toneR = `SO;
                    12'd358: toneR = `SO;     12'd359: toneR = `SO;
                    12'd360: toneR = `SO;     12'd361: toneR = `SO; // HF (half-beat)
                    12'd362: toneR = `SO;     12'd363: toneR = `SO;
                    12'd364: toneR = `SO;     12'd365: toneR = `SO;
                    12'd366: toneR = `SO;     12'd367: toneR = `sil;

                    12'd368: toneR = `SO;     12'd369: toneR = `SO; // HG (one-beat)
                    12'd370: toneR = `SO;     12'd371: toneR = `SO;
                    12'd372: toneR = `SO;     12'd373: toneR = `SO;
                    12'd374: toneR = `SO;     12'd375: toneR = `SO;
                    12'd376: toneR = `SI_2;     12'd377: toneR = `SI_2;
                    12'd378: toneR = `SI_2;     12'd379: toneR = `SI_2;
                    12'd380: toneR = `SI_2;     12'd381: toneR = `SI_2;
                    12'd382: toneR = `SI_2;     12'd383: toneR = `SI_2; // (Short break for repetitive notes: high G)

                    // --- Measure 7 ---
                    12'd384: toneR = `LA;      12'd385: toneR = `LA; // HG (half-beat)
                    12'd386: toneR = `LA;      12'd387: toneR = `LA;
                    12'd388: toneR = `LA;      12'd389: toneR = `LA;
                    12'd390: toneR = `LA;      12'd391: toneR = `LA;
                    12'd392: toneR = `LA;      12'd393: toneR = `LA; // HE (half-beat)
                    12'd394: toneR = `LA;      12'd395: toneR = `LA;
                    12'd396: toneR = `LA;      12'd397: toneR = `LA;
                    12'd398: toneR = `LA;      12'd399: toneR = `sil; // (Short break for repetitive notes: high E)

                    12'd400: toneR = `LA;      12'd401: toneR = `LA; // HE (one-beat)
                    12'd402: toneR = `LA;      12'd403: toneR = `LA;
                    12'd404: toneR = `LA;      12'd405: toneR = `LA;
                    12'd406: toneR = `LA;      12'd407: toneR = `sil;
                    12'd408: toneR = `LA;      12'd409: toneR = `LA;
                    12'd410: toneR = `LA;      12'd414: toneR = `LA;
                    12'd412: toneR = `LA;      12'd413: toneR = `LA;
                    12'd414: toneR = `LA;      12'd415: toneR = `LA;

                    12'd416: toneR = `re;      12'd417: toneR = `re;// HF (half-beat)
                    12'd418: toneR = `re;      12'd419: toneR = `re;
                    12'd420: toneR = `re;      12'd421: toneR = `re;
                    12'd422: toneR = `re;     12'd423: toneR =  `re;
                    12'd424: toneR = `re;      12'd425: toneR = `re; // HD (half-beat)
                    12'd426: toneR = `re;      12'd427: toneR = `re;
                    12'd428: toneR = `re;      12'd429: toneR = `re;
                    12'd430: toneR = `re;      12'd431: toneR = `re; // (Short break for repetitive notes: high D)

                    12'd432: toneR = `do;      12'd433: toneR = `do;  // HD (one-beat)
                    12'd434: toneR = `do;      12'd435: toneR = `do; 
                    12'd436: toneR = `do;      12'd437: toneR = `do; 
                    12'd438: toneR = `do;       12'd439: toneR = `do; 
                    12'd440: toneR = `do;       12'd441: toneR = `do; 
                    12'd442: toneR = `do;       12'd443: toneR = `do; 
                    12'd444: toneR = `do;       12'd445: toneR = `do; 
                    12'd446: toneR = `do;       12'd447: toneR = `do; 

                    // --- Measure 8 ---
                    12'd448: toneR = `SI_2;   12'd449: toneR = `SI_2; // HC (half-beat)
                    12'd450: toneR = `SI_2;    12'd451: toneR = `SI_2;
                    12'd452: toneR = `SI_2;    12'd453: toneR = `SI_2;
                    12'd454: toneR = `SI_2;    12'd455: toneR = `SI_2;
                    12'd456: toneR = `SI_2;    12'd457: toneR = `SI_2; // HE (half-beat)
                    12'd458: toneR = `SI_2;    12'd459: toneR = `SI_2;
                    12'd460: toneR = `SI_2;    12'd461: toneR = `SI_2;
                    12'd462: toneR = `SI_2;    12'd463: toneR = `SI_2;

                    12'd464: toneR = `SI_2;     12'd465: toneR = `SI_2; // HG (half-beat)
                    12'd466: toneR = `SI_2;   12'd467: toneR = `SI_2;
                    12'd468: toneR = `SI_2;     12'd469: toneR = `SI_2;
                    12'd470: toneR = `SI_2;     12'd471: toneR = `SI_2; // (Short break for repetitive notes: high G)
                    12'd472: toneR = `SI_2;     12'd473: toneR = `SI_2; // HG (half-beat)
                    12'd474: toneR = `SI_2;     12'd475: toneR = `SI_2;
                    12'd476: toneR = `SI_2;     12'd477: toneR = `SI_2;
                    12'd478: toneR = `SI_2;    12'd479: toneR = `SI_2;

                    12'd480: toneR = `SI_2;     12'd481: toneR = `SI_2; // HC (half-beat)
                    12'd482: toneR = `SI_2;     12'd483: toneR = `SI_2;
                    12'd484: toneR = `SI_2;     12'd485: toneR = `SI_2;
                    12'd486: toneR = `SI_2;     12'd487: toneR = `SI_2;
                    12'd488: toneR = `SI_2;     12'd489: toneR = `SI_2; // HC (half-beat)
                    12'd490: toneR = `SI_2;     12'd491: toneR = `SI_2;
                    12'd492: toneR = `SI_2;     12'd493: toneR = `SI_2;
                    12'd494: toneR = `SI_2;     12'd495: toneR = `SI_2;

                    12'd496: toneR = `SI_2;     12'd497: toneR = `SI_2; // HC (one-beat)
                    12'd498: toneR = `SI_2;     12'd499: toneR = `SI_2;
                    12'd500: toneR = `SI_2;     12'd501: toneR = `SI_2;
                    12'd502: toneR = `SI_2;     12'd503: toneR = `SI_2;
                    12'd504: toneR = `SI_2;     12'd505: toneR = `SI_2;
                    12'd506: toneR = `SI_2;     12'd507: toneR = `SI_2;
                    12'd508: toneR = `SI_2;     12'd509: toneR = `SI_2;
                    12'd510: toneR = `SI_2;     12'd511: toneR = `SI_2;

                    default: toneR = `sil;
            endcase
        end else begin
            toneR = `sil;
        end
    end

    always @(*) begin
        if(en == 1)begin
            case(ibeatNum)
                    12'd0: toneL = `sil;  	12'd1: toneL = `sil; // HC (two-beat)
                    12'd2: toneL = `sil;  	12'd3: toneL = `sil;
                    12'd4: toneL = `sil;	12'd5: toneL = `sil;
                    12'd6: toneL = `sil;  	12'd7: toneL = `sil;
                    12'd8: toneL = `sil;    12'd9: toneL = `sil;
                    12'd10: toneL = `sil;	12'd11: toneL = `sil;
                    12'd12: toneL = `sil;	12'd13: toneL = `sil;
                    12'd14: toneL = `sil;	12'd15: toneL = `sil;

                    12'd16: toneL = `sil;	12'd17: toneL = `sil;
                    12'd18: toneL = `sil;	12'd19: toneL = `sil;
                    12'd20: toneL = `sil;	12'd21: toneL = `sil;
                    12'd22: toneL = `sil;	12'd23: toneL = `sil;
                    12'd24: toneL = `sil;	12'd25: toneL = `sil;
                    12'd26: toneL = `sil;	12'd27: toneL = `sil;
                    12'd28: toneL = `sil;	12'd29: toneL = `sil;
                    12'd30: toneL = `sil;	12'd31: toneL = `sil;

                    12'd32: toneL = `sil;	    12'd33: toneL = `sil; // G (one-beat)
                    12'd34: toneL = `sil;	    12'd35: toneL = `sil;
                    12'd36: toneL = `sil;	    12'd37: toneL = `sil;
                    12'd38: toneL = `sil;	    12'd39: toneL = `sil;
                    12'd40: toneL = `sil;	    12'd41: toneL = `sil;
                    12'd42: toneL = `sil;	    12'd43: toneL = `sil;
                    12'd44: toneL = `sil;	    12'd45: toneL = `sil;
                    12'd46: toneL = `sil;	    12'd47: toneL = `sil;

                    12'd48: toneL = `sil;	    12'd49: toneL = `sil; // B (one-beat)
                    12'd50: toneL = `sil;	    12'd51: toneL = `sil;
                    12'd52: toneL = `sil;	    12'd53: toneL = `sil;
                    12'd54: toneL = `sil;	    12'd55: toneL = `sil;
                    12'd56: toneL = `sil;	    12'd57: toneL = `sil;
                    12'd58: toneL = `sil;	    12'd59: toneL = `sil;
                    12'd60: toneL = `sil;	    12'd61: toneL = `sil;
                    12'd62: toneL = `sil;	    12'd63: toneL = `sil;
                    // --- Measure 2 ---
                    12'd64: toneL = `mi_d_2;	12'd65: toneL = `mi_d_2; // HC (two-beat)
                    12'd66: toneL = `mi_d_2;    12'd67: toneL = `mi_d_2;
                    12'd68: toneL = `mi_d_2;	12'd69: toneL = `mi_d_2;
                    12'd70: toneL = `mi_d_2;	12'd71: toneL = `mi_d_2;
                    12'd72: toneL = `si_d_2_d;	12'd73: toneL = `si_d_2_d;
                    12'd74: toneL = `si_d_2_d;	12'd75: toneL = `si_d_2_d;
                    12'd76: toneL = `si_d_2_d;	12'd77: toneL = `si_d_2_d;
                    12'd78: toneL = `si_d_2_d;	12'd79: toneL = `si_d_2_d;

                    12'd80: toneL = `mi_d_d;	12'd81: toneL = `mi_d_d;
                    12'd82: toneL = `mi_d_d;   12'd83: toneL = `mi_d_d;
                    12'd84: toneL = `mi_d_d;   12'd85: toneL = `mi_d_d;
                    12'd86: toneL = `mi_d_d;    12'd87: toneL = `mi_d_d;
                    12'd88: toneL = `so_d;    12'd89: toneL = `so_d;
                    12'd90: toneL = `so_d;    12'd91: toneL = `so_d;
                    12'd92: toneL = `so_d;  12'd93: toneL = `so_d;
                    12'd94: toneL = `so_d;   12'd95: toneL = `so_d;

                    12'd96: toneL = `si_d;	12'd97: toneL = `si_d; // G (one-beat)
                    12'd98: toneL = `si_d;	12'd99: toneL = `si_d;
                    12'd100: toneL = `si_d;	12'd101: toneL = `si_d;
                    12'd102: toneL = `si_d;	12'd103: toneL = `si_d;
                    12'd104: toneL = `si_d;	12'd105: toneL = `si_d;
                    12'd106: toneL = `si_d; 12'd107: toneL = `si_d;
                    12'd108: toneL = `si_d; 12'd109: toneL = `si_d;
                    12'd110: toneL = `si_d; 12'd111: toneL = `si_d;

                    12'd112: toneL = `so_d;	12'd113: toneL = `so_d; // B (one-beat)
                    12'd114: toneL = `so_d;	12'd115: toneL = `so_d;
                    12'd116: toneL = `so_d;	12'd117: toneL = `so_d;
                    12'd118: toneL = `so_d;	12'd119: toneL = `so_d;
                    12'd120: toneL = `so_d;	12'd121: toneL = `so_d;
                    12'd122: toneL = `so_d;	12'd123: toneL = `so_d;
                    12'd124: toneL = `so_d;	12'd125: toneL = `so_d;
                    12'd126: toneL = `so_d;	12'd127: toneL = `so_d;
                    // --- Measure 3 ---
                    12'd128: toneL = `fa_d_2;   12'd129: toneL = `fa_d_2;// HC (two-beat)
                    12'd130: toneL = `fa_d_2;   12'd131: toneL = `fa_d_2;
                    12'd132: toneL = `fa_d_2;   12'd133: toneL = `fa_d_2;
                    12'd134: toneL = `fa_d_2;   12'd135: toneL = `fa_d_2;
                    12'd136: toneL = `do_d;   12'd137: toneL = `do_d;
                    12'd138: toneL = `do_d;   12'd139: toneL = `do_d;
                    12'd140: toneL = `do_d;   12'd141: toneL = `do_d;
                    12'd142: toneL = `do_d;   12'd143: toneL = `do_d;

                    12'd144: toneL = `fa_d;	12'd145: toneL = `fa_d; 
                    12'd146: toneL = `fa_d; 12'd147: toneL = `fa_d;
                    12'd148: toneL = `fa_d;	12'd149: toneL = `fa_d;
                    12'd150: toneL = `fa_d;	12'd151: toneL = `fa_d;
                    12'd152: toneL = `la_d;	12'd153: toneL = `la_d;	
                    12'd154: toneL = `la_d;	12'd155: toneL = `la_d;	
                    12'd156: toneL = `la_d;	12'd157: toneL = `la_d;	
                    12'd158: toneL = `la_d;	12'd159: toneL = `la_d;	

                    12'd160: toneL = `DO_d;	12'd161: toneL = `DO_d; // G (one-beat)
                    12'd162: toneL = `DO_d;	12'd163: toneL = `DO_d;
                    12'd164: toneL = `DO_d;	12'd165: toneL = `DO_d;
                    12'd166: toneL = `DO_d;	12'd167: toneL = `DO_d;
                    12'd168: toneL = `DO_d;	12'd169: toneL = `DO_d;
                    12'd170: toneL = `DO_d;	12'd171: toneL = `DO_d;
                    12'd172: toneL = `DO_d;	12'd173: toneL = `DO_d;
                    12'd174: toneL = `DO_d;	12'd175: toneL = `DO_d;

                    12'd176: toneL = `la_d;	12'd177: toneL = `la_d; // B (one-beat)
                    12'd178: toneL = `la_d; 12'd179: toneL = `la_d;
                    12'd180: toneL = `la_d;	12'd181: toneL = `la_d;
                    12'd182: toneL = `la_d; 12'd183: toneL =`la_d;
                    12'd184: toneL = `la_d;	12'd185: toneL = `la_d;
                    12'd186: toneL = `la_d;	12'd187: toneL = `la_d;
                    12'd188: toneL = `la_d;	12'd189: toneL = `la_d;
                    12'd190: toneL = `la_d;	12'd191: toneL = `la_d;
                    // --- Measure 4 ---
                    12'd192: toneL = `re_d_2;   12'd193: toneL = `re_d_2; // HC (one-beat)
                    12'd194: toneL = `re_d_2;   12'd195: toneL = `re_d_2;
                    12'd196: toneL = `re_d_2;   12'd197: toneL = `re_d_2;
                    12'd198: toneL = `re_d_2;   12'd199: toneL = `re_d_2;
                    12'd200: toneL = `la_d_2;   12'd201: toneL = `la_d_2;
                    12'd202: toneL = `la_d_2;   12'd203: toneL = `la_d_2;
                    12'd204: toneL = `la_d_2;   12'd205: toneL = `la_d_2;
                    12'd206: toneL = `la_d_2;   12'd207: toneL = `la_d_2;

                    12'd208: toneL = `re_d;	12'd209: toneL = `re_d; // G (one-beat)
                    12'd210: toneL = `re_d;	12'd211: toneL = `re_d;
                    12'd212: toneL = `re_d;	12'd213: toneL = `re_d;
                    12'd214: toneL = `re_d;	12'd215: toneL = `re_d;
                    12'd216: toneL = `fa_d;	12'd217: toneL = `fa_d;	
                    12'd218: toneL = `fa_d;	12'd219: toneL = `fa_d;	
                    12'd220: toneL = `fa_d;	12'd221: toneL = `fa_d;	
                    12'd222: toneL = `fa_d;	12'd223: toneL = `fa_d;	

                    12'd224: toneL = `la_d;	12'd225: toneL = `la_d;// E (one-beat)
                    12'd226: toneL = `la_d; 12'd227: toneL = `la_d;
                    12'd228: toneL = `la_d;	12'd229: toneL = `la_d;
                    12'd230: toneL = `la_d;	12'd231: toneL = `la_d;
                    12'd232: toneL = `la_d;	12'd233: toneL = `la_d;
                    12'd234: toneL = `la_d;	12'd235: toneL = `la_d;
                    12'd236: toneL = `la_d;	12'd237: toneL = `la_d;
                    12'd238: toneL = `la_d;	12'd239: toneL = `la_d;

                    12'd240: toneL = `fa_d;	12'd241: toneL = `fa_d; // C (one-beat)
                    12'd242: toneL = `fa_d;   12'd243: toneL =`fa_d;
                    12'd244: toneL = `fa_d;	12'd245: toneL = `fa_d;
                    12'd246: toneL = `fa_d;   12'd247: toneL = `fa_d;
                    12'd248: toneL = `fa_d;	12'd249: toneL = `fa_d;
                    12'd250: toneL = `fa_d;	12'd251: toneL = `fa_d;
                    12'd252: toneL = `fa_d;	12'd253: toneL = `fa_d;
                    12'd254: toneL = `fa_d;	12'd255: toneL = `fa_d;
                    // --- Measure 5 ---
                    12'd256: toneL = `so_d_2;   12'd257: toneL = `so_d_2; // G (two-beat)
                    12'd258: toneL = `so_d_2;   12'd259: toneL = `so_d_2;
                    12'd260: toneL = `so_d_2;   12'd261: toneL = `so_d_2;
                    12'd262: toneL = `so_d_2;   12'd263: toneL = `so_d_2;
                    12'd264: toneL = `re_d;     12'd265: toneL = `re_d; 
                    12'd266: toneL = `re_d;     12'd267: toneL = `re_d; 
                    12'd268: toneL = `re_d;     12'd269: toneL = `re_d; 
                    12'd270: toneL = `re_d;     12'd271: toneL = `re_d; 

                    12'd272: toneL = `so_d;	12'd273: toneL = `so_d; 
                    12'd274: toneL = `so_d; 	12'd275: toneL = `so_d;
                    12'd276: toneL = `so_d;	12'd277: toneL = `so_d;
                    12'd278: toneL = `so_d;	12'd279: toneL = `so_d;
                    12'd280: toneL = `si_d;	12'd281: toneL = `si_d;
                    12'd282: toneL = `si_d;	12'd283: toneL = `si_d;
                    12'd284: toneL = `si_d;	12'd285: toneL = `si_d;
                    12'd286: toneL = `si_d; 12'd287: toneL = `si_d;

                    12'd288: toneL = `RE_d;	12'd289: toneL = `RE_d; // F (one-beat)
                    12'd290: toneL = `RE_d;	12'd291: toneL = `RE_d;
                    12'd292: toneL = `RE_d;	12'd293: toneL = `RE_d;
                    12'd294: toneL = `RE_d;	12'd295: toneL = `RE_d;
                    12'd296: toneL = `RE_d;	12'd297: toneL = `RE_d;
                    12'd298: toneL = `RE_d;	12'd299: toneL = `RE_d;
                    12'd300: toneL = `RE_d;	12'd301: toneL = `RE_d;
                    12'd302: toneL = `RE_d;	12'd303: toneL = `RE_d;

                    12'd304: toneL = `si_d;	12'd305: toneL = `si_d; // D (one-beat)
                    12'd306: toneL = `si_d; 12'd307: toneL = `si_d;
                    12'd308: toneL = `si_d;	12'd309: toneL = `si_d;
                    12'd310: toneL = `si_d; 12'd311: toneL = `si_d;
                    12'd312: toneL = `si_d;	12'd313: toneL = `si_d;
                    12'd314: toneL = `si_d;	12'd315: toneL = `si_d;
                    12'd316: toneL = `si_d;	12'd317: toneL = `si_d;
                    12'd318: toneL = `si_d;	12'd319: toneL = `si_d;

                    // --- Measure 6 ---
                    12'd320: toneL = `mi_d_2_d;     12'd321: toneL = `mi_d_2_d; // E (two-beat)
                    12'd322: toneL = `mi_d_2_d;     12'd323: toneL = `mi_d_2_d;
                    12'd324: toneL = `mi_d_2_d;     12'd325: toneL = `mi_d_2_d;
                    12'd326: toneL = `mi_d_2_d;     12'd327: toneL = `mi_d_2_d;
                    12'd328: toneL = `si_d_2;     12'd329: toneL = `si_d_2;
                    12'd330: toneL = `si_d_2;     12'd331: toneL = `si_d_2;
                    12'd332: toneL = `si_d_2;     12'd333: toneL = `si_d_2;
                    12'd334: toneL = `si_d_2;     12'd335: toneL = `si_d_2;

                    12'd336: toneL = `mi_d_d;     12'd337: toneL = `mi_d_d; 
                    12'd338: toneL = `mi_d_d;      12'd339: toneL = `mi_d_d; 
                    12'd340: toneL = `mi_d_d;     12'd341: toneL = `mi_d_d; 
                    12'd342: toneL = `mi_d_d;     12'd343: toneL = `mi_d_d; 
                    12'd344: toneL = `so_d;     12'd345: toneL = `so_d; 
                    12'd346: toneL = `so_d;      12'd347: toneL = `so_d; 
                    12'd348: toneL = `so_d;      12'd349: toneL = `so_d; 
                    12'd350: toneL = `so_d;      12'd351: toneL =`so_d; 

                    12'd352: toneL = `si_d;     12'd353: toneL = `si_d;  // G (one-beat)
                    12'd354: toneL = `si_d;     12'd355: toneL = `si_d; 
                    12'd356: toneL = `si_d;     12'd357: toneL = `si_d; 
                    12'd358: toneL = `si_d;     12'd359: toneL = `si_d; 
                    12'd360: toneL = `si_d;     12'd361: toneL = `si_d; 
                    12'd362: toneL = `si_d;     12'd363: toneL = `si_d; 
                    12'd364: toneL = `si_d;     12'd365: toneL = `si_d; 
                    12'd366: toneL = `si_d;     12'd367: toneL = `si_d; 

                    12'd368: toneL = `so_d;      12'd369: toneL = `so_d;  // B (one-beat)
                    12'd370: toneL = `so_d;      12'd371: toneL = `so_d; 
                    12'd372: toneL = `so_d;      12'd373: toneL = `so_d; 
                    12'd374: toneL = `so_d;      12'd375: toneL = `so_d; 
                    12'd376: toneL = `so_d;      12'd377: toneL = `so_d; 
                    12'd378: toneL = `so_d;      12'd379: toneL = `so_d; 
                    12'd380: toneL = `so_d;      12'd381: toneL = `so_d; 
                    12'd382: toneL = `so_d;      12'd383: toneL = `so_d; 

                    // --- Measure 7 ---
                    12'd384: toneL = `fa_d_2;       12'd385: toneL = `fa_d_2;  // HC (two-beat)
                    12'd386: toneL = `fa_d_2;       12'd387: toneL = `fa_d_2; 
                    12'd388: toneL = `fa_d_2;       12'd389: toneL = `fa_d_2; 
                    12'd390: toneL = `fa_d_2;       12'd391: toneL = `fa_d_2; 
                    12'd392: toneL = `do_d;         12'd393: toneL = `do_d;
                    12'd394: toneL = `do_d;         12'd395: toneL = `do_d;
                    12'd396: toneL = `do_d;         12'd397: toneL = `do_d;
                    12'd398: toneL = `do_d;         12'd399: toneL = `do_d;

                    12'd400: toneL = `fa_d;       12'd401: toneL = `fa_d; 
                    12'd402: toneL = `fa_d;       12'd403: toneL = `fa_d; 
                    12'd404: toneL = `fa_d;       12'd405: toneL = `fa_d; 
                    12'd406: toneL = `fa_d;       12'd407: toneL = `fa_d; 
                    12'd408: toneL = `la_d;       12'd409: toneL = `la_d;
                    12'd410: toneL = `la_d;       12'd414: toneL = `la_d;
                    12'd412: toneL = `la_d;       12'd413: toneL = `la_d;
                    12'd414: toneL = `la_d;       12'd415: toneL = `la_d;

                    12'd416: toneL = `DO_d;       12'd417: toneL = `DO_d;  // G (one-beat)
                    12'd418: toneL = `DO_d;       12'd419: toneL = `DO_d; 
                    12'd420: toneL = `DO_d;       12'd421: toneL = `DO_d; 
                    12'd422: toneL = `DO_d;       12'd423: toneL = `DO_d; 
                    12'd424: toneL = `DO_d;       12'd425: toneL = `DO_d; 
                    12'd426: toneL = `DO_d;       12'd427: toneL = `DO_d; 
                    12'd428: toneL = `DO_d;       12'd429: toneL = `DO_d; 
                    12'd430: toneL = `DO_d;       12'd431: toneL = `DO_d; 

                    12'd432: toneL = `la_d;      12'd433: toneL = `la_d; // B (one-beat)
                    12'd434: toneL = `la_d;      12'd435: toneL = `la_d;
                    12'd436: toneL = `la_d;      12'd437: toneL = `la_d;
                    12'd438: toneL = `la_d;      12'd439: toneL = `la_d;
                    12'd440: toneL = `la_d;      12'd441: toneL = `la_d;
                    12'd442: toneL = `la_d;      12'd443: toneL = `la_d;
                    12'd444: toneL = `la_d;      12'd445: toneL = `la_d;
                    12'd446: toneL = `la_d;      12'd447: toneL = `la_d;

                    // --- Measure 8 ---
                    12'd448: toneL = `mi_d_2_d;     12'd449: toneL = `mi_d_2_d; // HC (half-beat)
                    12'd450: toneL = `mi_d_2_d;     12'd451: toneL = `mi_d_2_d;
                    12'd452: toneL = `mi_d_2_d;     12'd453: toneL = `mi_d_2_d;
                    12'd454: toneL = `mi_d_2_d;     12'd455: toneL = `mi_d_2_d;
                    12'd456: toneL = `mi_d_2_d;     12'd457: toneL = `mi_d_2_d;
                    12'd458: toneL = `mi_d_2_d;     12'd459: toneL = `mi_d_2_d;
                    12'd460: toneL = `mi_d_2_d;     12'd461: toneL = `mi_d_2_d;
                    12'd462: toneL = `mi_d_2_d;     12'd463: toneL = `mi_d_2_d;

                    12'd464: toneL = `mi_d_2_d;     12'd465: toneL = `mi_d_2_d; // G (one-beat)
                    12'd466: toneL = `mi_d_2_d;     12'd467: toneL = `mi_d_2_d;
                    12'd468: toneL = `mi_d_2_d;     12'd469: toneL = `mi_d_2_d;
                    12'd470: toneL = `mi_d_2_d;     12'd471: toneL = `mi_d_2_d;
                    12'd472: toneL = `mi_d_2_d;     12'd473: toneL = `mi_d_2_d;
                    12'd474: toneL = `mi_d_2_d;     12'd475: toneL = `mi_d_2_d;
                    12'd476: toneL = `mi_d_2_d;     12'd477: toneL = `mi_d_2_d;
                    12'd478: toneL = `mi_d_2_d;     12'd479: toneL = `mi_d_2_d;

                    12'd480: toneL = `mi_d_2_d;     12'd481: toneL = `mi_d_2_d; // C (two-beat)
                    12'd482: toneL = `mi_d_2_d;     12'd483: toneL = `mi_d_2_d;
                    12'd484: toneL = `mi_d_2_d;     12'd485: toneL = `mi_d_2_d;
                    12'd486: toneL = `mi_d_2_d;     12'd487: toneL = `mi_d_2_d;
                    12'd488: toneL = `mi_d_2_d;     12'd489: toneL = `mi_d_2_d;
                    12'd490: toneL = `mi_d_2_d;     12'd491: toneL = `mi_d_2_d;
                    12'd492: toneL = `mi_d_2_d;     12'd493: toneL = `mi_d_2_d;
                    12'd494: toneL = `mi_d_2_d;     12'd495: toneL = `mi_d_2_d;

                    12'd496: toneL = `mi_d_2_d;     12'd497: toneL = `mi_d_2_d;
                    12'd498: toneL = `mi_d_2_d;     12'd499: toneL = `mi_d_2_d;
                    12'd500: toneL = `mi_d_2_d;     12'd501: toneL = `mi_d_2_d;
                    12'd502: toneL = `mi_d_2_d;     12'd503: toneL = `mi_d_2_d;
                    12'd504: toneL = `mi_d_2_d;     12'd505: toneL = `mi_d_2_d;
                    12'd506: toneL = `mi_d_2_d;     12'd507: toneL = `mi_d_2_d;
                    12'd508: toneL = `mi_d_2_d;     12'd509: toneL = `mi_d_2_d;
                    12'd510: toneL = `mi_d_2_d;     12'd511: toneL = `mi_d_2_d;

                    default : toneL = `sil;
            endcase
        end
        else begin
            toneL = `sil;
        end
    end
endmodule