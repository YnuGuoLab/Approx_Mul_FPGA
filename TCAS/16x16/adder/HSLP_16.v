`timescale 1ns / 1ps


module add_HSLP_16(
	ll,
	lh,
	hl,
	hh,
	
	result
    );
input [15:0] ll,lh,hl,hh;

output [31:0] result;

wire [16:0] p,g;
wire [15:0] sum;
wire [16:0] c_i;

assign p[15:8] = hh[15:8];
assign g[16:9] = 8'b00000000;
    
    LUT6 #(
      .INIT(64'hFEFEFEFEFEFEFEFE) // Specify LUT Contents
   ) LUT6_inst1 (
      .O(P8), // 1-bit LUT6 output
      .I0(ll[8]), // 1-bit LUT input
      .I1(lh[0]), // 1-bit LUT input
      .I2(hl[0]), // 1-bit LUT input
      .I3(1'b0), // 1-bit LUT input
      .I4(1'b0), // 1-bit LUT input
      .I5(1'b0)  // 1-bit LUT input (fast MUX select only available to O6 output)
   );
   LUT6 #(
      .INIT(64'hFFFFFFFEFFFEFEFE) // Specify LUT Contents
   ) LUT6_inst2 (
      .O(P9), // 1-bit LUT6 output
      .I0(ll[9]), // 1-bit LUT input
      .I1(lh[1]), // 1-bit LUT input
      .I2(hl[1]), // 1-bit LUT input
      .I3(ll[8]), // 1-bit LUT input
      .I4(lh[0]), // 1-bit LUT input
      .I5(hl[0])  // 1-bit LUT input
   );
   LUT6 #(
      .INIT(64'hFFFFFFFEFFFEFEFE) // Specify LUT Contents
   ) LUT6_inst3 (
      .O(P10), // 1-bit LUT6 output
      .I0(ll[10]), // 1-bit LUT input
      .I1(lh[2]), // 1-bit LUT input
      .I2(hl[2]), // 1-bit LUT input
      .I3(ll[9]), // 1-bit LUT input
      .I4(lh[1]), // 1-bit LUT input
      .I5(hl[1]) // 1-bit LUT input
   );
   LUT6 #(
      .INIT(64'hFFFFFFFEFFFEFEFE) // Specify LUT Contents
   ) LUT6_inst4 (
      .O(P11), // 1-bit LUT6 output
      .I0(ll[11]), // 1-bit LUT input
      .I1(lh[3]), // 1-bit LUT input
      .I2(hl[3]), // 1-bit LUT input
      .I3(ll[10]), // 1-bit LUT input
      .I4(lh[2]), // 1-bit LUT input
      .I5(hl[2]) // 1-bit LUT input
   );
   LUT6 #(
      .INIT(64'hFFFFFFFEFFFEFEFE) // Specify LUT Contents
   ) LUT6_inst5 (
      .O(P12), // 1-bit LUT6 output
      .I0(ll[12]), // 1-bit LUT input
      .I1(lh[4]), // 1-bit LUT input
      .I2(hl[4]), // 1-bit LUT input
      .I3(ll[11]), // 1-bit LUT input
      .I4(lh[3]), // 1-bit LUT input
      .I5(hl[3]) // 1-bit LUT input
   );
   LUT6 #(
      .INIT(64'hFFFFFFFEFFFEFEFE) // Specify LUT Contents
   ) LUT6_inst6 (
      .O(P13), // 1-bit LUT6 output
      .I0(ll[13]), // 1-bit LUT input
      .I1(lh[5]), // 1-bit LUT input
      .I2(hl[5]), // 1-bit LUT input
      .I3(ll[12]), // 1-bit LUT input
      .I4(lh[4]), // 1-bit LUT input
      .I5(hl[4]) // 1-bit LUT input
   );
   LUT6 #(
      .INIT(64'hFFFFFFFEFFFEFEFE) // Specify LUT Contents
   ) LUT6_inst7 (
      .O(P14), // 1-bit LUT6 output
      .I0(ll[14]), // 1-bit LUT input
      .I1(lh[6]), // 1-bit LUT input
      .I2(hl[6]), // 1-bit LUT input
      .I3(ll[13]), // 1-bit LUT input
      .I4(lh[5]), // 1-bit LUT input
      .I5(hl[5])// 1-bit LUT input (fast MUX select only available to O6 output)
   );
   LUT6 #(
      .INIT(64'hFFFFFFFEFFFEFEFE) // Specify LUT Contents
   ) LUT6_inst8 (
      .O(P15), // 1-bit LUT6 output
      .I0(ll[15]), // 1-bit LUT input
      .I1(lh[7]), // 1-bit LUT input
      .I2(hl[7]), // 1-bit LUT input
      .I3(ll[14]), // 1-bit LUT input
      .I4(lh[6]), // 1-bit LUT input
      .I5(hl[6])  // 1-bit LUT input (fast MUX select only available to O6 output)
   );
    LUT6 #(
      .INIT(64'hFFFFFFFEFFFEFEFE) // Specify LUT Contents
   ) LUT6_inst9 (
      .O(P16), // 1-bit LUT6 output
      .I0(lh[8]), // 1-bit LUT input
      .I1(hl[8]), // 1-bit LUT input
      .I2(hh[0]), // 1-bit LUT input
      .I3(ll[15]), // 1-bit LUT input
      .I4(lh[7]), // 1-bit LUT input
      .I5(hl[7])  // 1-bit LUT input (fast MUX select only available to O6 output)
   );
    LUT6 #(
      .INIT(64'hFFFFFFFEFFFEFEFE) // Specify LUT Contents
   ) LUT6_inst10 (
      .O(P17), // 1-bit LUT6 output
      .I0(lh[9]), // 1-bit LUT input
      .I1(hl[9]), // 1-bit LUT input
      .I2(hh[1]), // 1-bit LUT input
      .I3(lh[8]), // 1-bit LUT input
      .I4(hl[8]), // 1-bit LUT input
      .I5(hh[0])  // 1-bit LUT input (fast MUX select only available to O6 output)
   );     
      LUT6 #(
      .INIT(64'hFFFFFFFEFFFEFEFE) // Specify LUT Contents
   ) LUT6_inst11 (
      .O(P18), // 1-bit LUT6 output
      .I0(lh[10]), // 1-bit LUT input
      .I1(hl[10]), // 1-bit LUT input
      .I2(hh[2]), // 1-bit LUT input
      .I3(lh[9]), // 1-bit LUT input
      .I4(hl[9]), // 1-bit LUT input
      .I5(hh[1])  // 1-bit LUT input (fast MUX select only available to O6 output)
   );    
      LUT6 #(
      .INIT(64'hFFFFFFFEFFFEFEFE) // Specify LUT Contents
   ) LUT6_inst12 (
      .O(P19), // 1-bit LUT6 output
      .I0(lh[11]), // 1-bit LUT input
      .I1(hl[11]), // 1-bit LUT input
      .I2(hh[3]), // 1-bit LUT input
      .I3(lh[10]), // 1-bit LUT input
      .I4(hl[10]), // 1-bit LUT input
      .I5(hh[2])  // 1-bit LUT input (fast MUX select only available to O6 output)
   );
      LUT6 #(
      .INIT(64'hFFFFFFFEFFFEFEFE) // Specify LUT Contents
   ) LUT6_inst13 (
      .O(P20), // 1-bit LUT6 output
      .I0(lh[12]), // 1-bit LUT input
      .I1(hl[12]), // 1-bit LUT input
      .I2(hh[4]), // 1-bit LUT input
      .I3(lh[11]), // 1-bit LUT input
      .I4(hl[11]), // 1-bit LUT input
      .I5(hh[3])  // 1-bit LUT input (fast MUX select only available to O6 output)
   );
      LUT6 #(
      .INIT(64'hFFFFFFFEFFFEFEFE) // Specify LUT Contents
   ) LUT6_inst14 (
      .O(P21), // 1-bit LUT6 output
      .I0(lh[13]), // 1-bit LUT input
      .I1(hl[13]), // 1-bit LUT input
      .I2(hh[5]), // 1-bit LUT input
      .I3(lh[12]), // 1-bit LUT input
      .I4(hl[12]), // 1-bit LUT input
      .I5(hh[4])  // 1-bit LUT input (fast MUX select only available to O6 output)
   );
     LUT6 #(
      .INIT(64'hFFFFFFFEFFFEFEFE) // Specify LUT Contents
   ) LUT6_inst15 (
      .O(P22), // 1-bit LUT6 output
      .I0(lh[14]), // 1-bit LUT input
      .I1(hl[14]), // 1-bit LUT input
      .I2(hh[6]), // 1-bit LUT input
      .I3(lh[13]), // 1-bit LUT input
      .I4(hl[13]), // 1-bit LUT input
      .I5(hh[5])  // 1-bit LUT input (fast MUX select only available to O6 output)
   );
     LUT6 #(
      .INIT(64'hFFFFFFFEFFFEFEFE) // Specify LUT Contents
   ) LUT6_inst16 (
      .O(P23), // 1-bit LUT6 output
      .I0(lh[15]), // 1-bit LUT input
      .I1(hl[15]), // 1-bit LUT input
      .I2(hh[7]), // 1-bit LUT input
      .I3(lh[14]), // 1-bit LUT input
      .I4(hl[14]), // 1-bit LUT input
      .I5(hh[6])  // 1-bit LUT input (fast MUX select only available to O6 output)
   );
      LUT6 #(
      .INIT(64'hE8E8E8E8E8E8E8E8) // Specify LUT Contents
   ) LUT6_inst17 (
      .O(c_i[8]), // 1-bit LUT6 output
      .I0(lh[15]), // 1-bit LUT input
      .I1(hl[15]), // 1-bit LUT input
      .I2(hh[7]), // 1-bit LUT input
      .I3(1'd0), // 1-bit LUT input
      .I4(1'd0), // 1-bit LUT input
      .I5(1'd0)  // 1-bit LUT input (fast MUX select only available to O6 output)
   );
 CARRY4 CARRY4_inst1 (
.CO(c_i[12:9]),
.O(sum[11:8]),
.CI(c_i[8]),
.CYINIT(1'd0),
.DI(g[12:9]),
.S(p[11:8])
);

  CARRY4 CARRY4_inst2 (
.CO(c_i[16:13]),
.O(sum[15:12]),
.CI(c_i[12]),
.CYINIT(1'd0),
.DI(g[16:13]),
.S(p[15:12])
); 

  assign result = {sum[15],sum[14],sum[13],sum[12],sum[11],sum[10],sum[9],sum[8],P23,P22,P21,P20,P19,P18,P17,P16,P15,P14,P13,P12,P11,P10,P9,P8,ll[7],ll[6],ll[5],ll[4],ll[3],ll[2],ll[1],ll[0]};
endmodule 
