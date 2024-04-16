module HSLP_1134_16(
	a,
	b,
	/*
	ll,
	lh,
	hl,
	hh,
	*/
	
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

HSLP_1134 HH(
	.a(ah),
	.b(bh),
	
	.prod8(hh)
);

HSLP_1134 HL(
	.a(ah),
	.b(bl),
	
	.prod8(hl)
);

HSLP_1134 LH(
	.a(al),
	.b(bh),
	
	.prod8(lh)
);

HSLP_1134 LL(
	.a(al),
	.b(bl),
	
	.prod8(ll)
);

add_HSLP_16 adder(
	.ll(ll),
	.lh(lh),
	.hl(hl),
	.hh(hh),
	
	.result(prod16)
	);



endmodule