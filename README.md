This directory contains the Verilog HDL codes of this paper. There are two folders in this directory: 4x4 and 8x8. The proposed design is coded with Verilog and synthesized for the xc7vx330tffg1157 device with Vivado 2019.1. The detailed information is as follows:

# 4x4
   # src
        - Contains the Verilog codes of one accurate 4x4 multiplier and four approximate 4x4 multipliers.
        - Correspondence
          |   Filenames    |   Module name    |             Behavior                      | Order Number |
          |  accurate.v    |    accurate      |    accurate 4x4 multiplication            |       -      |
          |   LSAM1.v      |      ap1         |    approximate 4x4 multiplication (LSAM1) |       1      |
          |   LSAM2.v      |      ap2         |    approximate 4x4 multiplication (LSAM2) |       2      |
          |   CSAM1.v      |      ap3         |    approximate 4x4 multiplication (CSAM1) |       3      |
          |   CSAM2.v      |      ap4         |    approximate 4x4 multiplication (CSAM2) |       4      |
        * Please modify the corresponding module name in the tb file when testing their performance after adding them into project files.
   
   # tb
        - Contains the Verilog codes of the testbench, named testbench_multi4a; another file input_bin_4.txt contains all input combinations of 4x4 multiplier for simulation.
        
    *** For example, when testing the performance and accuracy of the multiplier LSAM1, please first add 'LSAM1.v' and 'testbench_multi4a.v' to the same project file. Then, in the testbench file, please change the design name to "ap1" and modify the filepath to the address of “input_bin_4.txt”.


# 8x8
   # adder
        - Contains the Verilog codes of three adders used to construct 8x8 multipliers.
        - Correspondence
          |  Filenames     |     Module name        |          Behavior                      
          |   ACCA.v       |       add_acc          |       accurate adder                |
          |   MODA.v       |     add_inexact        |    moderate approximate adder       |
          |   NCCA.v       |       add_LUT2         |  pure LUT-based approximate adder   |
   
   # src
         - Contains the Verilog codes of approximate 8x8 multipliers.
         - Correspondence
          |  Filenames     |   Module name     |                                       Behavior                                             |  
          |  ACCA_xxxx.v   |     ac_xxxx       | approximate 8x8 multiplier with ACCA adder summing the results of four 4x4 multipliers.    |
          |  MODA_xxxx.v   |    inexact_xxxx   | approximate 8x8 multiplier with MODA adder summing the results of four 4x4 multipliers.    |
          |  NCCA_xxxx.v   |     LUT2_xxxx     | approximate 8x8 multiplier with NCCA adder summing the results of four 4x4 multipliers.    |
        * "xxxx" represents the order number of 4x4 approximate multiplier when constructing 8x8 multiplier.
  
    *** An 8x8 multiplier is constructed by four 4x4 multipliers and one adder. Adder is used to sum the results of four 4x4 multipliers. 
    *** For example, ACCA_1234 means that the adder type is ACCA and four 4x4 multipliers as LSAM1, LSAM2, CSAM1, CSAM2.
  
   # tb
        - Contains the Verilog codes of the testbench, named tb_8x8; another file input_bin_8.txt includes all input combinations of 8x8 multiplier for simulation.
      
    *** For example, when testing the performance and accuracy of ACCA_1234, please first add ACCA_1234.v, LSAM1.v, LSAM2.v, CSAM1.v, CSAM2.v, ACCA.v and testbench_multi8a.v to the same project file. Then, change the module name in the testbench to “ac_1234” and modify the input file path to the address of “input_bin_8”.


# 16x16
   # adder
        - Contains the Verilog codes of three adders used to construct 16x16 multipliers.
        - Correspondence
          |  Filenames     |     Module name        |          Behavior                      
          |   ACCA_16.v       |       ACCA_16          |       accurate adder                |
          |   MODA_16.v       |      MODA_16        |    moderate approximate adder       |
          |   NCCA_16.v       |       NCCA_16         |  pure LUT-based approximate adder   |
   
   # src
         - Contains the Verilog codes of approximate 16x16 multipliers.
         - Correspondence
          |  Filenames     |   Module name     |                                       Behavior                                             |  
          |  ACCA_1111_16.v   |    ACCA_1111_16       | approximate 16x16 multiplier with ACCA adder summing the results of four 8x8 multipliers.    |
          |  MODA_1334_16.v   |     MODA_1334_16   | approximate 16x16 multiplier with MODA adder summing the results of four 8x8 multipliers.    |
          |  NCCA_1134_16.v   |    NCCA_1134_16     | approximate 16x16 multiplier with NCCA adder summing the results of four 8x8 multipliers.    |
 
  
    *** A 16x16 multiplier is constructed by four 8x8 multipliers and one adder. Adder is used to sum the results of four 8x8 multipliers. 
    *** For 16x16 multipliers, there are many configurations actually. Limited to the size of file, only three configurations are provided.
    *** For example, ACCA_1111_16 means that the adder type is ACCA and four 8x8 ACCA_1111 multipliers. 
  
   # tb
        - Contains the Verilog codes of the testbench, named tb_16x16; another file input16.txt includes 10^6 randam input combinations of 16x16 multiplier for simulation.
      
    *** For example, when testing the performance and accuracy of ACCA_1111_16, please first add ACCA_1111.v, LSAM1.v, ACCA.v and testbench_multi16a.v to the same project file. Then, change the module name in the testbench to “ACCA_1111_16” and modify the input file path to the address of “input16”.

============
This library provides accurate and approximate 4x4 multipliers, 8x8 multipliers, 16x16 multipliers and adders.
For widespread usage, this library can be used to provide the multipliers and adders as elementary units to construct higher-order multiplier (e.g. 32x32).
============ 


