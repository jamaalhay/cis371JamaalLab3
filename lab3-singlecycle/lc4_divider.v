/* TODO: INSERT NAME AND PENNKEY HERE */

`timescale 1ns / 1ps
`default_nettype none

module lc4_divider(input  wire [15:0] i_dividend,
                   input  wire [15:0] i_divisor,
                   output wire [15:0] o_remainder,
                   output wire [15:0] o_quotient);

      /*** YOUR CODE HERE ***/
  // assign o_quotient = {16{1'b0}};
  // assign o_remainder = {16{1'b0}};
     // if (i_divisor == 16'b0000000000000000) begin
//	 return;
  //    end
   wire [15:0] rem_in = 16'd0;
   wire [15:0] quo_in = 16'd0;
   wire [15:0] div_16;
   wire [15:0] quo_1, quo_2, quo_3, quo_4, quo_5, quo_6, quo_7, quo_8, quo_9, quo_10, quo_11, quo_12, quo_13, quo_14, quo_15, rem_1, rem_2, rem_3, rem_4, rem_5, rem_6, rem_7,  rem_8, rem_9, rem_10, rem_11, rem_12, rem_13, rem_14, rem_15, div_1, div_2, div_3, div_4, div_5, div_6, div_7, div_8, div_9, div_10, div_11, div_12, div_13, div_14, div_15;
   
   
   lc4_divider_one_iter l1(.i_dividend(i_dividend),.i_divisor(i_divisor),.i_remainder(rem_in),.i_quotient(quo_in), .o_dividend(div_1),.o_quotient(quo_1),.o_remainder(rem_1));
  // assign div_o = i_dividend << 1;
   lc4_divider_one_iter l2(.i_dividend(div_1),.i_divisor(i_divisor),.i_remainder(rem_1),.i_quotient(quo_1), .o_dividend(div_2),.o_quotient(quo_2),.o_remainder(rem_2));
   lc4_divider_one_iter l3(.i_dividend(div_2),.i_divisor(i_divisor),.i_remainder(rem_2),.i_quotient(quo_2), .o_dividend(div_3),.o_quotient(quo_3),.o_remainder(rem_3));
   lc4_divider_one_iter l4(.i_dividend(div_3),.i_divisor(i_divisor),.i_remainder(rem_3),.i_quotient(quo_3), .o_dividend(div_4),.o_quotient(quo_4),.o_remainder(rem_4)); // UNMATCHED !!
   lc4_divider_one_iter l5(.i_dividend(div_4),.i_divisor(i_divisor),.i_remainder(rem_4),.i_quotient(quo_4), .o_dividend(div_5),.o_quotient(quo_5),.o_remainder(rem_5)); // UNMATCHED !!
   lc4_divider_one_iter l6(.i_dividend(div_5),.i_divisor(i_divisor),.i_remainder(rem_5),.i_quotient(quo_5), .o_dividend(div_6),.o_quotient(quo_6),.o_remainder(rem_6)); // UNMATCHED !!
   lc4_divider_one_iter l7(.i_dividend(div_6),.i_divisor(i_divisor),.i_remainder(rem_6),.i_quotient(quo_6), .o_dividend(div_7),.o_quotient(quo_7),.o_remainder(rem_7)); // UNMATCHED !!
   lc4_divider_one_iter l8(.i_dividend(div_7),.i_divisor(i_divisor),.i_remainder(rem_7),.i_quotient(quo_7), .o_dividend(div_8),.o_quotient(quo_8),.o_remainder(rem_8)); // UNMATCHED !!
   lc4_divider_one_iter l9(.i_dividend(div_8),.i_divisor(i_divisor),.i_remainder(rem_8),.i_quotient(quo_8), .o_dividend(div_9),.o_quotient(quo_9),.o_remainder(rem_9)); // UNMATCHED !!
   lc4_divider_one_iter l10(.i_dividend(div_9),.i_divisor(i_divisor),.i_remainder(rem_9),.i_quotient(quo_9), .o_dividend(div_10),.o_quotient(quo_10),.o_remainder(rem_10)); // UNMATCHED !!
   lc4_divider_one_iter l11(.i_dividend(div_10),.i_divisor(i_divisor),.i_remainder(rem_10),.i_quotient(quo_10), .o_dividend(div_11),.o_quotient(quo_11),.o_remainder(rem_11)); // UNMATCHED !!
   lc4_divider_one_iter l12(.i_dividend(div_11),.i_divisor(i_divisor),.i_remainder(rem_11),.i_quotient(quo_11), .o_dividend(div_12),.o_quotient(quo_12),.o_remainder(rem_12)); // UNMATCHED !!
   lc4_divider_one_iter l13(.i_dividend(div_12),.i_divisor(i_divisor),.i_remainder(rem_12),.i_quotient(quo_12), .o_dividend(div_13),.o_quotient(quo_13),.o_remainder(rem_13)); // UNMATCHED !!
   lc4_divider_one_iter l14(.i_dividend(div_13),.i_divisor(i_divisor),.i_remainder(rem_13),.i_quotient(quo_13), .o_dividend(div_14),.o_quotient(quo_14),.o_remainder(rem_14)); // UNMATCHED !!
   lc4_divider_one_iter l15(.i_dividend(div_14),.i_divisor(i_divisor),.i_remainder(rem_14),.i_quotient(quo_14), .o_dividend(div_15),.o_quotient(quo_15),.o_remainder(rem_15)); // UNMATCHED !!
   lc4_divider_one_iter l16(.i_dividend(div_15),.i_divisor(i_divisor),.i_remainder(rem_15),.i_quotient(quo_15), .o_dividend(div_16),.o_quotient(o_quotient),.o_remainder(o_remainder)); // UNMATCHED !!

endmodule // lc4_divider

module lc4_divider_one_iter(input  wire [15:0] i_dividend,
                            input  wire [15:0] i_divisor,
                            input  wire [15:0] i_remainder,
                            input  wire [15:0] i_quotient,
                            output wire [15:0] o_dividend,
                            output wire [15:0] o_remainder,
                            output wire [15:0] o_quotient);

   /*** YOUR CODE HERE ***/
     wire[15:0] temp;
     wire [15:0] temp1;
     wire [15:0] temp2;
     wire [15:0] temp3, temp4, temp5, temp6;
   
   assign temp  = (i_remainder << 1) | ((i_dividend >> 15) & 1'd1);
   assign temp3  = i_dividend << 1;
   assign temp1 = ((temp < i_divisor) ? (i_quotient << 1) | 1'd0 :(i_quotient << 1) | 1'd1);
   assign temp2 = (temp < i_divisor ? temp : temp-i_divisor);
   assign temp4 = (i_divisor == 16'd0) ? 16'd0 : temp2;
   assign temp5 = (i_divisor == 16'd0) ? 16'd0 : temp1;
   assign temp6 = (i_divisor == 16'd0) ? temp3 : temp3;
   assign o_remainder = temp4;
   assign o_quotient = temp5;
   assign o_dividend = temp6;
   
   
endmodule
