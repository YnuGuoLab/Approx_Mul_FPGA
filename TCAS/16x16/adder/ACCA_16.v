module ACCA_16(
	ll,
	lh,
	hl,
	hh,
	result
);                   

input [15:0] ll,lh,hl,hh;

output [31:0] result;


wire [15:0] a_reg,b_reg,c_reg;
wire [7:0] d_reg;

wire [24:0] p,g;

assign a_reg[7:0] = ll[15:8];
assign a_reg[15:8] = hh[7:0];
assign b_reg[15:0] = lh[15:0];
assign c_reg[15:0] = hl[15:0];
assign d_reg[7:0] = hh[15:8];

assign g[0] = 1'd0;
assign g[24:18] = 7'b0;
assign p[23:17] = d_reg[7:1];
assign result[7:0] = ll[7:0];



LUT6_2 #(
.INIT(64'h96969696E8E8E8E8) 
) LUT6_2_inst1 (

.I0(c_reg[0]),
.I1(b_reg[0]), 
.I2(a_reg[0]), 
.I3(1'd1), 
.I4(1'd1), 
.I5(1'd1), 

.O6(p[0]), 
.O5(g[1]) 
);


genvar i;
for(i = 1;i < 16;i = i+1) begin:GP

LUT6_2 #(
.INIT(64'h69966996E8E8E8E8) 
) LUT6_2_inst2 (

.I0(c_reg[i]),
.I1(b_reg[i]), 
.I2(a_reg[i]), 
.I3(g[i]), 
.I4(1'd1), 
.I5(1'd1), 

.O6(p[i]), 
.O5(g[i+1]) 
);
end


LUT6_2 #(
.INIT(64'h17E817E8E8E8E8E8) 
) LUT6_2_inst3 (

.I0(c_reg[15]),
.I1(b_reg[15]), 
.I2(a_reg[15]), 
.I3(d_reg[0]), 
.I4(1'd1), 
.I5(1'd1), 

.O6(p[16]), 
.O5(g[17]) 
);

wire [24:0] c_i;
wire [23:0] sum;
assign c_i[0] = 1'd0;
CARRY4 CARRY4_inst1 (
.CO(c_i[4:1]), // 4-bit carry out
.O(sum[3:0]), // 4-bit carry chain XOR data out

.CI(c_i[0]), // 1-bit carry cascade input
.CYINIT(1'd0), // 1-bit carry initialization
.DI(g[3:0]), // 4-bit carry-MUX data in
.S(p[3:0]) // 4-bit carry-MUX select input
);

CARRY4 CARRY4_inst2 (
.CO(c_i[8:5]), // 4-bit carry out
.O(sum[7:4]), // 4-bit carry chain XOR data out

.CI(c_i[4]), // 1-bit carry cascade input
.CYINIT(1'd0), // 1-bit carry initialization
.DI(g[7:4]), // 4-bit carry-MUX data in
.S(p[7:4]) // 4-bit carry-MUX select input
);

CARRY4 CARRY4_inst3 (
.CO(c_i[12:9]), // 4-bit carry out
.O(sum[11:8]), // 4-bit carry chain XOR data out

.CI(c_i[8]), // 1-bit carry cascade input
.CYINIT(1'd0), // 1-bit carry initialization
.DI(g[11:8]), // 4-bit carry-MUX data in
.S(p[11:8]) // 4-bit carry-MUX select input
);

CARRY4 CARRY4_inst4 (
.CO(c_i[16:13]), // 4-bit carry out
.O(sum[15:12]), // 4-bit carry chain XOR data out

.CI(c_i[12]), // 1-bit carry cascade input
.CYINIT(1'd0), // 1-bit carry initialization
.DI(g[15:12]), // 4-bit carry-MUX data in
.S(p[15:12]) // 4-bit carry-MUX select input
);

CARRY4 CARRY4_inst5 (
.CO(c_i[20:17]), // 4-bit carry out
.O(sum[19:16]), // 4-bit carry chain XOR data out

.CI(c_i[16]), // 1-bit carry cascade input
.CYINIT(1'd0), // 1-bit carry initialization
.DI(g[20:17]), // 4-bit carry-MUX data in
.S(p[19:16]) // 4-bit carry-MUX select input
);

CARRY4 CARRY4_inst6 (
.CO(c_i[24:21]), // 4-bit carry out
.O(sum[23:20]), // 4-bit carry chain XOR data out

.CI(c_i[20]), // 1-bit carry cascade input
.CYINIT(1'd0), // 1-bit carry initialization
.DI(g[24:21]), // 4-bit carry-MUX data in
.S(p[23:20]) // 4-bit carry-MUX select input
);

assign result[31:8] = sum;

endmodule