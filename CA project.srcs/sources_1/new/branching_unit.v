//`timescale 1ns / 1ps

//module branching_unit
//  (
//   input [2:0] funct3,
//    input [63:0] readData1,
//    input [63:0] b,
//   output reg addermuxselect
//  );
  
//  initial
//    begin
//      addermuxselect = 1'b0;
//    end
  
//  always @(*)
//	begin
//      case (funct3)
//        3'b000:
//          begin
//            if (readData1 == b)
//              addermuxselect = 1'b1;
//            else
//              addermuxselect = 1'b0;
//            end
//         3'b100:
//    		begin
//              if (readData1 < b)
//              addermuxselect = 1'b1;
//            else
//              addermuxselect = 1'b0;
//            end
//        3'b101:
//          begin
//            if (readData1 > b)
//          	addermuxselect = 1'b1;
//           else
//              addermuxselect = 1'b0;
//          end    
//      endcase
//     end
//endmodule
`timescale 1ns / 1ps

module branching_unit
(
    input [2:0] funct3,          // Determines the type of branch
    input [63:0] readData1,      // First operand
    input [63:0] b,              // Second operand
    output reg addermuxselect    // Output signal to select PC source (1 = take branch, 0 = don't take)
);

  // Set initial value of output to 0 (no branch)
  initial begin
    addermuxselect = 1'b0;
  end

  // check branch conditions
  always @(*) begin
    case (funct3)
      3'b000: begin
        // BEQ
        if (readData1 == b)
          addermuxselect = 1'b1;
        else
          addermuxselect = 1'b0;
      end

      3'b100: begin
        // BLT
        if (readData1 < b)
          addermuxselect = 1'b1;
        else
          addermuxselect = 1'b0;
      end

      3'b101: begin
        // BGT
        if (readData1 > b)
          addermuxselect = 1'b1;
        else
          addermuxselect = 1'b0;
      end

    endcase
  end

endmodule
