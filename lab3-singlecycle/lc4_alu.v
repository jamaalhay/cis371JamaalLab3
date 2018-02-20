/* INSERT NAME AND PENNKEY HERE */

`timescale 1ns / 1ps

`default_nettype none

module lc4_alu(input wire [15:0] i_insn,
               input wire [15:0]  i_pc,
               input wire [15:0]  i_r1data,
               input wire [15:0]  i_r2data,
               output wire [15:0] o_result);


      /*** YOUR CODE HERE ***/
   wire [15:0] temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8, temp10, temp11, temp12, temp13, temp14, temp15, temp16, temp17, temp18, temp19, temp20, temp21, temp22, temp23, temp24, temp25, temp26, temp27, temp28, temp29, temp30;
   wire signed [15:0] temp9;
   wire signed [15:0] sext5, sext6, sext7, sext9, sext11;
   assign sext5 = {{11{i_insn[4]}}, i_insn[4:0]};
   assign sext6 = {{10{i_insn[5]}}, i_insn[5:0]};
   assign sext7 = {{9{i_insn[6]}}, i_insn[6:0]};
   assign sext9 = {{7{i_insn[8]}}, i_insn[8:0]};
   assign sext11 = {{5{i_insn[10]}}, i_insn[10:0]};
   
   
   assign temp1 = ((i_insn[15:12]== 4'b0000) ? i_pc + 1 + sext9 : 16'd0);
   
   assign temp2 = (i_insn[15:12]== 4'b0001) ?((i_insn[5:3] == 3'b000) ? i_r1data + i_r2data : 16'd0) : 16'd0;
   assign temp3 = (i_insn[15:12]== 4'b0001) ?((i_insn[5:3] == 3'b001) ? i_r1data* i_r2data : 16'd0): 16'd0;
   assign temp23 = (i_insn[15:12]== 4'b0001) ?((i_insn[5:3] == 3'b010) ? i_r1data - i_r2data : 16'd0) : 16'd0;
   wire [15:0] div1, div2;
   lc4_divider l1(i_r1data, i_r2data, div1, div2);
   
   assign temp4 = (i_insn[15:12]== 4'b0001)? (i_insn[5:3] == 3'b011) ?  div2 : 16'd0 : 16'd0;
   
   assign temp5 = (i_insn[15:12]== 4'b0001) ? ((i_insn[5] == 1'b1) ? i_r1data + sext5 : 16'd0): 16'd0;
   

   assign temp6 = ((i_insn[15:12]== 4'b1010) ?((i_insn[5:4] == 2'b11) ? div1 : 16'd0) : 16'd0);
   assign temp7 = ((i_insn[15:12]== 4'b1010) ?(i_insn[5:4] == 2'b00) ? i_r1data<< i_insn[3:0]: 16'd0 : 16'd0);
   assign temp8 = ((i_insn[15:12]== 4'b1010) ?(i_insn[5:4] == 2'b10) ? i_r1data >> i_insn[3:0]:16'd0 : 16'd0);
   wire signed [15:0] wi;
   wire signed [15:0] wi2;
   wire [15:0] tempShift;
   
   assign wi = i_r1data;
   assign wi2 = i_r2data;
  /* integer  shift;
   shift = (i_insn[3] == 1'b1) ? shift + 8: shift;
   shift = (i_insn[2] ==1) ? shift + 4: shift;
   shift = (i_insn[1] ==1) ? shift + 2: shift;
   shift = (i_insn[0] ==1) ? shift + 1: shift; 
   assign tempShift = {{shift{i_insn[15]}}, i_insn[16 - shift:0]}*/
   assign temp9 = ((i_insn[15:12]== 4'b1010) ?(i_insn[5:4] == 2'b01) ? wi >>> i_insn[3:0] : 16'd0 : 16'd0);
   assign temp10 = ((i_insn[15:12]== 4'b0101) ?(i_insn[5:3] == 3'b000) ? i_r1data & i_r2data:16'd0 : 16'd0);
   assign temp11 = ((i_insn[15:12]== 4'b0101) ?(i_insn[5:3] == 3'b001) ? ~i_r1data : 16'd0 : 16'd0);
   assign temp12 = ((i_insn[15:12]== 4'b0101) ?(i_insn[5:3] == 3'b010) ? i_r1data | i_r2data: 16'd0 : 16'd0);
   assign temp13 = ((i_insn[15:12]== 4'b0101) ?(i_insn[5:3] == 3'b011) ? i_r1data ^ i_r2data : 16'd0 : 16'd0);
   assign temp14 = ((i_insn[15:12]== 4'b0101) ?(i_insn[5] == 1'b1) ? i_r1data & sext5 : 16'd0 : 16'd0);
   assign temp15 = ((i_insn[15:12]== 4'b0110) ? i_r1data + sext6 : 16'd0);
   assign temp16 = ((i_insn[15:12]== 4'b0111) ? i_r1data + sext6 : 16'd0);
   assign temp17 = ((i_insn[15:12]== 4'b1001) ? sext9 : 16'd0);
   assign temp18 = ((i_insn[15:12]== 4'b1101) ? (i_r1data & 8'hff) | (i_insn[7:0] << 8) : 16'd0);
   assign temp19 = ((i_insn[15:12]== 4'b0010) ? (i_insn[8:7] == 2'b00) ? (wi < wi2) ? 16'b1111111111111111: (wi > wi2) ? 16'b0000000000000001 :16'd0 : 16'd0: 16'd0);
   assign temp20 = ((i_insn[15:12]== 4'b0010) ? (i_insn[8:7] == 2'b01) ? (i_r1data < i_r2data) ? 16'b1111111111111111:(i_r1data > i_r2data) ? 16'b0000000000000001:16'd0 : 16'd0:16'd0);
   assign temp21 = ((i_insn[15:12]== 4'b0010) ? (i_insn[8:7] == 2'b10) ? (wi < sext7) ? 16'b1111111111111111:(wi > sext7) ? 16'b0000000000000001:16'd0 : 16'd0:16'd0);
   assign temp22 = ((i_insn[15:12]== 4'b0010) ? (i_insn[8:7] == 2'b11) ? (i_r1data < i_insn[6:0]) ? 16'b1111111111111111:(i_r1data > i_insn[6:0]) ? 16'b0000000000000001:16'd0 : 16'd0: 16'd0);
   assign temp24 = ((i_insn[15:12]== 4'b0100) ? (i_insn[11] == 1'b0) ? i_r1data : 16'd0 : 16'd0);
   assign temp25 = ((i_insn[15:12]== 4'b0100) ? (i_insn[11] == 1'b1) ? (i_pc & 16'h8000) | (i_insn[10:0] << 4) : 16'd0 : 16'd0);
   assign temp26 = ((i_insn[15:12]== 4'b1100) ? (i_insn[11] == 1'b0) ? i_r1data: 16'd0 : 16'd0);
   assign temp27 = ((i_insn[15:12]== 4'b1100) ? (i_insn[11] == 1'b1) ? i_pc + 1 + sext11: 16'd0 : 16'd0);
   assign temp28 =((i_insn[15:12]==4'b1111)?16'h8000 | i_insn[7:0]: 16'd0);
   assign temp29 =((i_insn[15:12]==4'b1000)? i_r1data : 16'd0);
   assign o_result = (temp1 != 16'd0) ? temp1 : (temp2 != 16'd0) ?temp2 : (temp3 != 16'd0) ?temp3 : (temp4 != 16'd0) ?temp4 : (temp5 != 16'd0) ?temp5 : (temp6 != 16'd0) ?temp6 : (temp7 != 16'd0) ?temp7 : (temp8 != 16'd0) ?temp8 : (temp9 != 16'd0) ?temp9 : (temp10 != 16'd0) ?temp10 : (temp11 != 16'd0) ?temp11 : (temp12 != 16'd0) ?temp12 : (temp13 != 16'd0) ?temp13 : (temp14 != 16'd0) ?temp14 : (temp15 != 16'd0) ?temp15 : (temp16 != 16'd0) ?temp16 : (temp17 != 16'd0) ?temp17 : (temp18 != 16'd0) ?temp18 : (temp19 != 16'd0) ?temp19 : (temp20 != 16'd0) ?temp20 : (temp21 != 16'd0) ?temp21 : (temp22 != 16'd0) ?temp22 : (temp23 != 16'd0) ?temp23 : (temp24 != 16'd0) ?temp24 : (temp25 != 16'd0) ?temp25 : (temp26 != 16'd0) ?temp26 : (temp27 != 16'd0) ?temp27 : (temp28 != 16'd0) ?temp28 : (temp29 != 16'd0) ?temp29 : 16'd0;
   		 
endmodule
