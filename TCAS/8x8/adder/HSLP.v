module add_hslp(
	ll,
	lh,
	hl,
	hh,
	
	result
);                   

input [7:0] ll,lh,hl,hh;

output [15:0] result;




wire [8:0] p,g;
wire [15:0] sum;
wire [8:0] c_i;

assign p[7:4] = hh[7:4];
assign g[8:5] = 4'b0000;





 LUT6 #(
      .INIT(64'hFEFEFEFEFEFEFEFE)
   ) LUT6_inst1 (
      .O(P4),
      .I0(ll[4]),
      .I1(lh[0]),
      .I2(hl[0]),
      .I3(1'b0),
      .I4(1'b0),
      .I5(1'b0)
   );
   LUT6 #(
      .INIT(64'hFFFFFFFEFFFEFEFE)
   ) LUT6_inst2 (
      .O(P5),
      .I0(ll[5]),
      .I1(lh[1]),
      .I2(hl[1]),
      .I3(ll[4]),
      .I4(lh[0]),
      .I5(hl[0])
   );
   LUT6 #(
      .INIT(64'hFFFFFFFEFFFEFEFE) 
   ) LUT6_inst3 (
      .O(P6),
      .I0(ll[6]),
      .I1(lh[2]),
      .I2(hl[2]),
      .I3(ll[5]),
      .I4(lh[1]),
      .I5(hl[1])
   );
   LUT6 #(
      .INIT(64'hFFFFFFFEFFFEFEFE)
   ) LUT6_inst4 (
      .O(P7), 
      .I0(ll[7]),
      .I1(lh[3]),
      .I2(hl[3]),
      .I3(ll[6]),
      .I4(lh[2]),
      .I5(hl[2])
   );
   LUT6 #(
      .INIT(64'hFFFFFFFEFFFEFEFE)
   ) LUT6_inst5 (
      .O(P8),
      .I0(lh[4]),
      .I1(hl[4]),
      .I2(hh[0]),
      .I3(ll[7]), 
      .I4(lh[3]),
      .I5(hl[3])
   );
   LUT6 #(
      .INIT(64'hFFFFFFFEFFFEFEFE)
   ) LUT6_inst6 (
      .O(P9),
      .I0(lh[5]),
      .I1(hl[5]),
      .I2(hh[1]),
      .I3(lh[4]),
      .I4(hl[4]),
      .I5(hh[0])
   );
   LUT6 #(
      .INIT(64'hFFFFFFFEFFFEFEFE)
   ) LUT6_inst7 (
      .O(P10),
      .I0(lh[6]),
      .I1(hl[6]),
      .I2(hh[2]),
      .I3(lh[5]),
      .I4(hl[5]),
      .I5(hh[1])
   );
 
   LUT6 #(
      .INIT(64'hFFFFFFFEFFFEFEFE)
   ) LUT6_inst8 (
      .O(P11),
      .I0(lh[7]), 
      .I1(hl[7]),
      .I2(hh[3]),
      .I3(lh[6]),
      .I4(hl[6]),
      .I5(hh[2])
   ); 


   LUT6 #(
      .INIT(64'hE8E8E8E8E8E8E8E8)
   ) LUT6_inst9 (
 
      .I0(hl[7]),
      .I1(lh[7]),
      .I2(hh[3]),
	  .I3(1'b0),
	  .I4(1'b0),
	  .I5(1'b0),
	  .O(c_i[4])
 
   );


CARRY4 CARRY4_inst1 (
.CO(c_i[8:5]),
.O(sum[7:4]),

.CI(c_i[4]),
.CYINIT(1'd0),
.DI(g[8:5]),
.S(p[7:4])
);

assign result = {sum[7],sum[6],sum[5],sum[4],P11,P10,P9,P8,P7,P6,P5,P4,ll[3],ll[2],ll[1],ll[0]};

endmodule














