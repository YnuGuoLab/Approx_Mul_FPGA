module NCCA_1134_16(
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

LUT2_1134 HH(
	.a(ah),
	.b(bh),
	
	.prod8(hh)
);

LUT2_1134 HL(
	.a(ah),
	.b(bl),
	
	.prod8(hl)
);

LUT2_1134 LH(
	.a(al),
	.b(bh),
	
	.prod8(lh)
);

LUT2_1134 LL(
	.a(al),
	.b(bl),
	
	.prod8(ll)
);

NCCA_16 adder(
	.ll(ll),
	.lh(lh),
	.hl(hl),
	.hh(hh),
	
	.result(prod16)
	);



endmodule