//////////////////////////////////////////////////////////////////////////////////
// Design Name: Generate/Propagate
// Engineer: kiran
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps


module GP(
    input  wire A,
    input  wire B,
    input  wire Ci,
    output reg  G,
    output reg  P,
    output reg  C
    );

    always @(*)
        begin
            G = A & B;
            P = A | B;  // A xor B can also be used
            C = G | P & Ci;
        end
endmodule
