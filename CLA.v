//////////////////////////////////////////////////////////////////////////////////
// Design: Carry Lookahead Adder
// Engineer: kiran
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module CLA (A,B,Ci,S,Co,PG,GG,CG);

    parameter N = 4;
    input  wire [N-1:0] A;
    input  wire [N-1:0] B;
    input  wire Ci;
    output wire [N-1:0] S;
    output wire Co;
    output reg  PG,GG,CG;

    wire [N-1:0] P;
    wire [N-1:0] G;

    wire [N:0] C;


    assign C[0] = Ci;

    genvar i;
    generate
       for (i=0; i < N; i=i+1)
        begin : Build
        full_adder_gp COMP1(.A(A[i]), .B(B[i]), .Ci(C[i]), .S(S[i]));
        GP            COMP2(.A(A[i]), .B(B[i]), .Ci(C[i]), .G(G[i]), .P(P[i]), .C(C[i+1]));
        end
     endgenerate

     assign Co = C[N];

     always@(*)
        begin
            PG = &P;
            GG = C[N];
            CG = GG | PG & Ci;
        end

endmodule
