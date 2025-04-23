//`timescale 1ns / 1ps

//module Data_Memory
//(
//input [63:0] Mem_Addr,
//input [63:0] Write_Data,
//input clk, MemWrite, MemRead,
//output reg [63:0] Read_Data,
//output [63:0] element1,
//  output [63:0] element2,
//  output [63:0] element3,
//  output [63:0] element4,
//  output [63:0] element5,
//  output [63:0] element6,
//  output [63:0] element7,
//  output [63:0] element8
//);
//reg [7:0] DataMemory [255:0];
//integer i;
//initial
//begin
//for (i = 0;i<256;i = i + 1)begin
//    DataMemory[i] = 0;
//end
//      DataMemory[0] = 8'd172;
//      DataMemory[8] = 8'd17;
//      DataMemory[16] = 8'd56;
//      DataMemory[24] = 8'd32;
//      DataMemory[32] = 8'd15;
//      DataMemory[40] = 8'd163;
//      DataMemory[48] = 8'd87;
//      DataMemory[56] = 8'd92;
//end

//  assign element1 = {DataMemory[7],DataMemory[6],DataMemory[5],DataMemory[4],DataMemory[3],DataMemory[2],DataMemory[1],DataMemory[0]};
//  assign element2 = {DataMemory[15],DataMemory[14],DataMemory[13],DataMemory[12],DataMemory[11],DataMemory[10],DataMemory[9],DataMemory[8]};
//  assign element3 = {DataMemory[23],DataMemory[22],DataMemory[21],DataMemory[20],DataMemory[19],DataMemory[18],DataMemory[17],DataMemory[16]};
//  assign element4 = {DataMemory[31],DataMemory[30],DataMemory[29],DataMemory[28],DataMemory[27],DataMemory[26],DataMemory[25],DataMemory[24]};
//  assign element5 = {DataMemory[39],DataMemory[38],DataMemory[37],DataMemory[36],DataMemory[35],DataMemory[34],DataMemory[33],DataMemory[32]};
//  assign element6 = {DataMemory[47],DataMemory[46],DataMemory[45],DataMemory[44],DataMemory[43],DataMemory[42],DataMemory[41],DataMemory[40]};
//  assign element7 = {DataMemory[55],DataMemory[54],DataMemory[53],DataMemory[52],DataMemory[51],DataMemory[50],DataMemory[49],DataMemory[48]};
//  assign element8 = {DataMemory[63],DataMemory[62],DataMemory[61],DataMemory[60],DataMemory[59],DataMemory[58],DataMemory[57],DataMemory[56]};


//always @ (*)
//begin
//if (MemRead)
//Read_Data =
//{DataMemory[Mem_Addr+7],DataMemory[Mem_Addr+6],DataMemory[Mem_Addr+5],DataMemory[Mem_Addr+4],DataMemory[Mem_Addr+3],DataMemory[Mem_Addr+2],DataMemory[Mem_Addr+1],DataMemory[Mem_Addr]};
//end
//always @ (posedge clk)
//begin
//if (MemWrite)
//begin
//DataMemory[Mem_Addr] = Write_Data[7:0];
//DataMemory[Mem_Addr+1] = Write_Data[15:8];
//DataMemory[Mem_Addr+2] = Write_Data[23:16];
//DataMemory[Mem_Addr+3] = Write_Data[31:24];
//DataMemory[Mem_Addr+4] = Write_Data[39:32];
//DataMemory[Mem_Addr+5] = Write_Data[47:40];
//DataMemory[Mem_Addr+6] = Write_Data[55:48];
//DataMemory[Mem_Addr+7] = Write_Data[63:56];
//end
//end
//endmodule


`timescale 1ns / 1ps  // Define simulation time unit and precision

// Module declaration for Data_Memory
module Data_Memory
(
  input [63:0] Mem_Addr,        // Memory address for accessing data
  input [63:0] Write_Data,      // 64-bit data to write into memory
  input clk,                    // Clock signal
  input MemWrite,               // Enable writing when high
  input MemRead,                // Enable reading when high
  output reg [63:0] Read_Data,  // Output for 64-bit data read from memory

  // Outputs to observe 8 specific memory elements (64-bit each)
  output [63:0] element1,
  output [63:0] element2,
  output [63:0] element3,
  output [63:0] element4,
  output [63:0] element5,
  output [63:0] element6,
  output [63:0] element7,
  output [63:0] element8
);

// Declare memory of 256 bytes (each 8-bit)
reg [7:0] DataMemory [255:0];

integer i;  // Loop index variable

initial begin
  // Initialize all 256 bytes to 0
  for (i = 0; i < 256; i = i + 1) begin
    DataMemory[i] = 0;  // Set each byte to zero
  end

  // Preload memory with some initial values at specific addresses
  DataMemory[0]  = 8'd7;  // First 64-bit value LSB at address 0
  DataMemory[8]  = 8'd5;   // Second 64-bit value LSB at address 8
  DataMemory[16] = 8'd6;   // Third 64-bit value LSB at address 16
  DataMemory[24] = 8'd2;   // Fourth 64-bit value LSB at address 24
  DataMemory[32] = 8'd1;   // Fifth 64-bit value LSB at address 32
  DataMemory[40] = 8'd81;  // Sixth 64-bit value LSB at address 40
  DataMemory[48] = 8'd54;   // Seventh 64-bit value LSB at address 48
  DataMemory[56] = 8'd32;   // Eighth 64-bit value LSB at address 56
end

// Combine 8 bytes into a 64-bit value for observation (element1 from addr 0–7)
assign element1 = {DataMemory[7], DataMemory[6], DataMemory[5], DataMemory[4], DataMemory[3], DataMemory[2], DataMemory[1], DataMemory[0]};

// Combine next 8 bytes (element2 from addr 8–15)
assign element2 = {DataMemory[15], DataMemory[14], DataMemory[13], DataMemory[12], DataMemory[11], DataMemory[10], DataMemory[9], DataMemory[8]};

// Combine bytes for element3 (addr 16–23)
assign element3 = {DataMemory[23], DataMemory[22], DataMemory[21], DataMemory[20], DataMemory[19], DataMemory[18], DataMemory[17], DataMemory[16]};

// Combine bytes for element4 (addr 24–31)
assign element4 = {DataMemory[31], DataMemory[30], DataMemory[29], DataMemory[28], DataMemory[27], DataMemory[26], DataMemory[25], DataMemory[24]};

// Combine bytes for element5 (addr 32–39)
assign element5 = {DataMemory[39], DataMemory[38], DataMemory[37], DataMemory[36], DataMemory[35], DataMemory[34], DataMemory[33], DataMemory[32]};

// Combine bytes for element6 (addr 40–47)
assign element6 = {DataMemory[47], DataMemory[46], DataMemory[45], DataMemory[44], DataMemory[43], DataMemory[42], DataMemory[41], DataMemory[40]};

// Combine bytes for element7 (addr 48–55)
assign element7 = {DataMemory[55], DataMemory[54], DataMemory[53], DataMemory[52], DataMemory[51], DataMemory[50], DataMemory[49], DataMemory[48]};

// Combine bytes for element8 (addr 56–63)
assign element8 = {DataMemory[63], DataMemory[62], DataMemory[61], DataMemory[60], DataMemory[59], DataMemory[58], DataMemory[57], DataMemory[56]};

// Combinational read block
always @(*) begin
  if (MemRead) begin
    // Read 64-bit data starting from Mem_Addr
    Read_Data = {
      DataMemory[Mem_Addr+7], DataMemory[Mem_Addr+6],
      DataMemory[Mem_Addr+5], DataMemory[Mem_Addr+4],
      DataMemory[Mem_Addr+3], DataMemory[Mem_Addr+2],
      DataMemory[Mem_Addr+1], DataMemory[Mem_Addr]
    };
  end
end

// Sequential write block (triggered on rising edge of clk)
always @(posedge clk) begin
  if (MemWrite) begin
    // Write 64-bit data into memory byte by byte starting at Mem_Addr
    DataMemory[Mem_Addr]     = Write_Data[7:0];    // LSB
    DataMemory[Mem_Addr+1]   = Write_Data[15:8];
    DataMemory[Mem_Addr+2]   = Write_Data[23:16];
    DataMemory[Mem_Addr+3]   = Write_Data[31:24];
    DataMemory[Mem_Addr+4]   = Write_Data[39:32];
    DataMemory[Mem_Addr+5]   = Write_Data[47:40];
    DataMemory[Mem_Addr+6]   = Write_Data[55:48];
    DataMemory[Mem_Addr+7]   = Write_Data[63:56];  // MSB
  end
end

endmodule  // End of Data_Memory module

