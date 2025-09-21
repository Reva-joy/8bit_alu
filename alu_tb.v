`timescale 1ns / 1ps

module alu_tb;

    // Inputs
    reg [7:0] a, b;
    reg [2:0] alu_op;
    // Outputs
    wire [7:0] result;
    wire carry_out, zero, overflow;

    // Instantiate the ALU (replace 'alu' with your ALU module name if different)
    alu uut (
        .a(a),
        .b(b),
        .alu_op(alu_op),
        .result(result),
        .carry_out(carry_out),
        .zero(zero),
        .overflow(overflow)
    );

    initial begin
        // Test ADD
        a = 8'h15; b = 8'h23; alu_op = 3'b000; #10;
        // Test SUB
        a = 8'h50; b = 8'h10; alu_op = 3'b001; #10;
        // Test AND
        a = 8'hAA; b = 8'h0F; alu_op = 3'b010; #10;
        // Test OR
        a = 8'hF0; b = 8'h0F; alu_op = 3'b011; #10;
        // Test XOR
        a = 8'hFF; b = 8'h0F; alu_op = 3'b100; #10;
        // Test NOT (on a)
        a = 8'h55; b = 8'h00; alu_op = 3'b101; #10;
        // Test INC (a)
        a = 8'h7F; b = 8'h00; alu_op = 3'b110; #10;
        // Test DEC (a)
        a = 8'h01; b = 8'h00; alu_op = 3'b111; #10;

        $stop;
    end

endmodule