module logic_unit(
    input  [3:0] A,
    input  [3:0] B,
    input  [1:0] Sel,
    output [3:0] Result
);

    // Outputs of logic gates
    wire [3:0] AND_out;
    wire [3:0] OR_out;
    wire [3:0] XOR_out;
    wire [3:0] NOT_out;

    // Logic operations
    assign AND_out = A & B;
    assign OR_out  = A | B;
    assign XOR_out = A ^ B;
    assign NOT_out = ~A;

    // One 4x1 MUX per bit
    MUX_4X1 mux0(
        .I0(AND_out[0]),
        .I1(OR_out[0]),
        .I2(XOR_out[0]),
        .I3(NOT_out[0]),
        .Sel(Sel),
        .Y(Result[0])
    );

    MUX_4X1 mux1(
        .I0(AND_out[1]),
        .I1(OR_out[1]),
        .I2(XOR_out[1]),
        .I3(NOT_out[1]),
        .Sel(Sel),
        .Y(Result[1])
    );

    MUX_4X1 mux2(
        .I0(AND_out[2]),
        .I1(OR_out[2]),
        .I2(XOR_out[2]),
        .I3(NOT_out[2]),
        .Sel(Sel),
        .Y(Result[2])
    );

    MUX_4X1 mux3(
        .I0(AND_out[3]),
        .I1(OR_out[3]),
        .I2(XOR_out[3]),
        .I3(NOT_out[3]),
        .Sel(Sel),
        .Y(Result[3])
    );

endmodule