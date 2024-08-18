`timescale 1ns/1ns
`include "vending_machine.v"
module vending_machine_tb;
   reg clock;
   reg reset;
   reg [1:0]in;

   wire out;
   wire [1:0]change;

   vending_machine vm(
    .clock(clock),
    .reset(reset),
    .in(in),
    .out(out),
    .change(change));

    initial 
    begin
      $dumpfile("vending_machine.vcd");
      $dumpvars(0,vending_machine_tb);
      clock = 0;
      forever #5 clock = ~clock;    
    end 

    initial 
    begin
      reset = 1;
      #10 reset = 0;
      in = 2'b01;
      #10 in = 2'b10;
      #10 in = 2'b01;
      #10 in = 2'b01;
      #10 in = 2'b10;
      #30 $finish;    
    end
endmodule