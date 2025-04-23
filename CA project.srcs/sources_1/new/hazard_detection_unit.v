//module hazard_detection_unit
//  (
//    input Memread,
//    input [31:0] inst,
//    input [4:0] Rd,
//    output reg stall
//  );
  
//  initial
//    begin
//      stall = 1'b0;
//    end
  
//  always @(*)
//    begin
//      if (Memread == 1'b1 && ((Rd == inst[19:15]) || (Rd == inst[24:20])))
//        stall = 1'b1;
//      else
//        stall = 1'b0;
//    end
//endmodule
module hazard_detection_unit
(
    input Memread,           // Signal indicating that the instruction in EX stage is reading from memory
    input [31:0] inst,       // Current instruction in ID stage
    input [4:0] Rd,          // Destination register of instruction in EX stage
    output reg stall         // Output signal to stall the pipeline (1 = stall, 0 = no stall)
);

  // Initialize stall signal to 0 (no stall)
  initial begin
    stall = 1'b0;
  end

  // Check for data hazard that requires a stall
  always @(*) begin
    // If the instruction in EX stage is a memory read and the destination register of that instruction (Rd) is the same as one of the source registers
    if (Memread == 1'b1 && ((Rd == inst[19:15]) || (Rd == inst[24:20])))
      stall = 1'b1;  // Stall the pipeline to prevent data hazard
    else
      stall = 1'b0;  // No hazard, continue without stall
  end

endmodule
