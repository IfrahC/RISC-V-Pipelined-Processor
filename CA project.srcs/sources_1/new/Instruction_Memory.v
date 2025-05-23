`timescale 1ns / 1ps

module Instruction_Memory
(
input [63:0] Inst_Address,
output reg [31:0] Instruction
);
reg [7:0] inst_mem [87:0];
initial
begin
        {inst_mem[3], inst_mem[2], inst_mem[1], inst_mem[0]}     = 32'h00000913; // addi x18, x0, 0       ; x18 (s2) = 0
        {inst_mem[7], inst_mem[6], inst_mem[5], inst_mem[4]}     = 32'h00000433; // add  x8, x0, x0       ; x8 (s0) = 0
        {inst_mem[11], inst_mem[10], inst_mem[9], inst_mem[8]}   = 32'h04b40863; // beq  x8, x11, +0x10   ; if x8 == x11, skip ahead
        {inst_mem[15], inst_mem[14], inst_mem[13], inst_mem[12]} = 32'h00800eb3; // add  x29, x0, x8      ; x29 (t4) = x8
        {inst_mem[19], inst_mem[18], inst_mem[17], inst_mem[16]} = 32'h000409b3; // add  x19, x8, x0      ; x19 (s3) = x8
        {inst_mem[23], inst_mem[22], inst_mem[21], inst_mem[20]} = 32'h013989b3; // add  x19, x19, x19    ; x19 = x19 + x19
        {inst_mem[27], inst_mem[26], inst_mem[25], inst_mem[24]} = 32'h013989b3; // add  x19, x19, x19    ; x19 = x19 + x19
        {inst_mem[31], inst_mem[30], inst_mem[29], inst_mem[28]} = 32'h013989b3; // add  x19, x19, x19    ; x19 = x19 + x19
        {inst_mem[35], inst_mem[34], inst_mem[33], inst_mem[32]} = 32'h02be8663; // beq  x29, x11, +0x20  ; if x29 == x11, skip ahead
        {inst_mem[39], inst_mem[38], inst_mem[37], inst_mem[36]} = 32'h001e8e93; // addi x29, x29, 1      ; x29++
        {inst_mem[43], inst_mem[42], inst_mem[41], inst_mem[40]} = 32'h00898993; // addi x19, x19, 8      ; x19 += 8
        {inst_mem[47], inst_mem[46], inst_mem[45], inst_mem[44]} = 32'h00093d03; // ld   x26, 0(x18)      ; x26 = Mem[x18]
        {inst_mem[51], inst_mem[50], inst_mem[49], inst_mem[48]} = 32'h0009bd83; // ld   x27, 0(x19)      ; x27 = Mem[x19]
        {inst_mem[55], inst_mem[54], inst_mem[53], inst_mem[52]} = 32'h01bd4463; // beq  x26, x27, +0x10  ; if x26 == x27, skip ahead
        {inst_mem[59], inst_mem[58], inst_mem[57], inst_mem[56]} = 32'hfe0004e3; // beq  x0, x0, -0x20    ; unconditional jump (loop back)
        {inst_mem[63], inst_mem[62], inst_mem[61], inst_mem[60]} = 32'h01a002b3; // add  x5, x0, x26      ; x5 = x26
        {inst_mem[67], inst_mem[66], inst_mem[65], inst_mem[64]} = 32'h01b93023; // sd   x27, 0(x18)      ; Mem[x18] = x27
        {inst_mem[71], inst_mem[70], inst_mem[69], inst_mem[68]} = 32'h0059b023; // sd   x5, 0(x19)       ; Mem[x19] = x5
        {inst_mem[75], inst_mem[74], inst_mem[73], inst_mem[72]} = 32'hfc000ce3; // beq  x0, x0, -0x40    ; unconditional jump (to start loop)
        {inst_mem[79], inst_mem[78], inst_mem[77], inst_mem[76]} = 32'h00140413; // addi x8, x8, 1        ; x8++
        {inst_mem[83], inst_mem[82], inst_mem[81], inst_mem[80]} = 32'h00890913; // addi x18, x18, 8      ; x18 += 8
        {inst_mem[87], inst_mem[86], inst_mem[85], inst_mem[84]} = 32'hfa000ae3; // beq  x0, x0, -0x60    ; unconditional jump (restart outer loop)
        
end
always @(Inst_Address)
begin
Instruction[7:0] = inst_mem[Inst_Address+0];
      Instruction[15:8] = inst_mem[Inst_Address+1];
      Instruction[23:16] = inst_mem[Inst_Address+2];
      Instruction[31:24] = inst_mem[Inst_Address+3];
end
endmodule

