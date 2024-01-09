module MODA_1334_16(
	a,
	b,
	prod16
);
 
input [15:0] a;
input [15:0] b;

output [31:0] prod16;

wire [7:0] ah,al,bh,bl;

wire [15:0] ll,hl,lh,hh;

assign ah[7:0] = a[15:8];
assign al[7:0] = a[7:0];
assign bh[7:0] = b[15:8];
assign bl[7:0] = b[7:0];

inexact_1334 HH(
	.a(ah),
	.b(bh),
	
	.prod8(hh)
);

inexact_1334 HL(
	.a(ah),
	.b(bl),
	
	.prod8(hl)
);

inexact_1334 LH(
	.a(al),
	.b(bh),
	
	.prod8(lh)
);

inexact_1334 LL(
	.a(al),
	.b(bl),
	
	.prod8(ll)
);

MODA_16 adder(
	.ll(ll),
	.lh(lh),
	.hl(hl),
	.hh(hh),
	
	.result(prod16)
	);



endmodule