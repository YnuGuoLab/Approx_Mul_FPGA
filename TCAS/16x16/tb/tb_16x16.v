`timescale 1ns / 1ps

module testbench_multi16();

parameter n = 16;

reg [n-1:0] mul_A;
reg [n-1:0] mul_B;
reg [n-1:0] temp[999:0];
wire [2*n-1:0] result;



integer i;
integer j;
integer fp;	


// You can change the module name for different design
ACCA_1111_16 testmul_multi16(
	.a(mul_A),
	.b(mul_B),
	.prod16(result)
	);


initial begin
fp = $fopen("out_result.txt","w");

$readmemb("FilePath/input16.txt",temp);
for(i = 0;i < 1000;i = i+1)
begin

	mul_A = temp[i];
for(j = 0;j < 1000;j = j+1)
begin
	mul_B = temp[j];
	#1;
	$fdisplay(fp,"%b\n",result);

	
end
end

	$fclose(fp);
end


endmodule	
