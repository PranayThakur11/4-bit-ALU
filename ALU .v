module ALU_4bit(
    input  [3:0] A,
    input  [3:0] B,

    input  [3:0] S,      // S3 S2 S1 S0
    input        Cin,

    input        Ir,
    input        Il,

    output [3:0] F,
    output       Cout
);

    //-------------------------------
    // Outputs of each unit
    //-------------------------------

    wire [3:0] arithmetic_out;
    wire [3:0] logic_out;
    wire [3:0] shift_out;

    wire arithmetic_cout;

    //-------------------------------
    // Arithmetic Unit
    //-------------------------------

    arithmetic_unit AU(
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sel(S[1:0]),
        .Result(arithmetic_out),
        .Cout(arithmetic_cout)
    );

    //-------------------------------
    // Logic Unit
    //-------------------------------

    logic_unit LU(
        .A(A),
        .B(B),
        .Sel(S[1:0]),
        .Result(logic_out)
    );

    //-------------------------------
    // Shifter
    //-------------------------------

    combinational_shifter SH(
        .A(A),
        .Ir(Ir),
        .Il(Il),
        .S(S[2]),          // 0=right,1=left
        .H(shift_out)
    );

    //-----------------------------------
    // Final Output Selection
    //-----------------------------------

    reg [3:0] result;

    always @(*) begin

        case(S[3:2])

            2'b00: result = arithmetic_out;

            2'b01: result = logic_out;

            2'b10: result = 4'b0000;       // unused

            2'b11: result = shift_out;

        endcase

    end

    assign F = result;

    //-----------------------------------
    // Carry Output
    //-----------------------------------

    assign Cout = (S[3:2]==2'b00) ? arithmetic_cout : 1'b0;

endmodule