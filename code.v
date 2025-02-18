`timescale 1ns / 1ps

module multiplier (
    input [31:0] A, B,
    output reg [63:0] P
);

    reg [31:0] multiplicand, multiplier;
    reg [63:0] product;
    integer i;

    always @(*) begin
        multiplicand = A;
        multiplier = B;
        product = 0;

        for (i = 0; i < 32; i = i + 2) begin
            case ({multiplier[i+1], multiplier[i]})
                2'b00: product = product; // No operation
                2'b01: product = product + (multiplicand << i); // Multiply by 1
                2'b10: product = product - (multiplicand << i); // Multiply by -1
                2'b11: product = product; // No operation
            endcase
        end

        P = product;
    end
endmodule
