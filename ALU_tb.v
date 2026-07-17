`timescale 1ns/1ps

module tb_ALU_4bit;

    // Inputs
    reg [3:0] A;
    reg [3:0] B;
    reg [3:0] S;
    reg Cin;
    reg Ir;
    reg Il;

    // Outputs
    wire [3:0] F;
    wire Cout;

    //=====================================================
    // Instantiate ALU
    //=====================================================

    ALU_4bit uut (
        .A(A),
        .B(B),
        .S(S),
        .Cin(Cin),
        .Ir(Ir),
        .Il(Il),
        .F(F),
        .Cout(Cout)
    );

    //=====================================================
    // Monitor all signals
    //=====================================================

    initial begin
        $monitor("Time=%0t | A=%b   B=%b   S=%b   Cin=%b   Ir=%b   Il=%b  |  F=%b  Cout=%b",
                  $time,A,B,S,Cin,Ir,Il,F,Cout);
    end

    //=====================================================
    // Test Sequence
    //=====================================================

    initial begin

        // Generate waveform
        $dumpfile("alu_4bit.vcd");
        $dumpvars(0,tb_ALU_4bit);

        //-------------------------------------------------
        // Common Inputs
        //-------------------------------------------------

        A  = 4'b1010;      // Decimal 10
        B  = 4'b0011;      // Decimal 3
        Ir = 1'b1;
        Il = 1'b0;

        //-------------------------------------------------
        // Arithmetic Operations
        //-------------------------------------------------

        // Transfer A
        // F = A
        S   = 4'b0000;
        Cin = 0;
        #10;

        // Increment A
        // F = A + 1
        S   = 4'b0000;
        Cin = 1;
        #10;

        // Add
        // F = A + B
        S   = 4'b0001;
        Cin = 0;
        #10;

        // Add with Carry
        // F = A + B + 1
        S   = 4'b0001;
        Cin = 1;
        #10;

        // Subtract with Borrow
        // F = A + ~B
        S   = 4'b0010;
        Cin = 0;
        #10;

        // Subtract
        // F = A + ~B + 1
        S   = 4'b0010;
        Cin = 1;
        #10;

        // Decrement A
        // F = A - 1
        S   = 4'b0011;
        Cin = 0;
        #10;

        // Transfer A
        // F = A
        S   = 4'b0011;
        Cin = 1;
        #10;

        //-------------------------------------------------
        // Logic Operations
        //-------------------------------------------------

        // AND
        S = 4'b0100;
        #10;

        // OR
        S = 4'b0101;
        #10;

        // XOR
        S = 4'b0110;
        #10;

        // Complement A
        S = 4'b0111;
        #10;

        //-------------------------------------------------
        // Shift Operations
        //-------------------------------------------------

        // Shift Right
        // Ir enters MSB/LSB according to your shifter design
        S = 4'b1100;
        #10;

        // Shift Left
        // Il enters opposite end
        S = 4'b1110;
        #10;

        //-------------------------------------------------
        // Additional Test Case
        //-------------------------------------------------

        A  = 4'b1111;
        B  = 4'b0001;
        Ir = 0;
        Il = 1;

        // Add (overflow test)
        S   = 4'b0001;
        Cin = 0;
        #10;

        // Subtract
        S   = 4'b0010;
        Cin = 1;
        #10;

        // XOR
        S = 4'b0110;
        #10;

        // Shift Right
        S = 4'b1100;
        #10;

        // Shift Left
        S = 4'b1110;
        #10;

        //-------------------------------------------------
        // Finish Simulation
        //-------------------------------------------------

        #10 $finish;

    end

endmodule