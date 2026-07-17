module arithmetic_unit(
    input  [3:0] A,
    input  [3:0] B,
    input        Cin,
    input  [1:0] Sel,
    output [3:0] Result,
    output       Cout
);

    // Output of MUXes
    wire [3:0] Y;

    // Carry wires
    wire C1, C2, C3;

    //-------------------------
    // 4x1 MUX for each bit
    //-------------------------

    MUX_4X1 mux0(
        .I0(B[0]),
        .I1(~B[0]),
        .I2(1'b0),
        .I3(1'b1),
        .Sel(Sel),
        .Y(Y[0])
    );

    MUX_4X1 mux1(
        .I0(B[1]),
        .I1(~B[1]),
        .I2(1'b0),
        .I3(1'b1),
        .Sel(Sel),
        .Y(Y[1])
    );

    MUX_4X1 mux2(
        .I0(B[2]),
        .I1(~B[2]),
        .I2(1'b0),
        .I3(1'b1),
        .Sel(Sel),
        .Y(Y[2])
    );

    MUX_4X1 mux3(
        .I0(B[3]),
        .I1(~B[3]),
        .I2(1'b0),
        .I3(1'b1),
        .Sel(Sel),
        .Y(Y[3])
    );

    //-------------------------
    // Ripple Carry Adder
    //-------------------------

    FA fa0(
        .A(A[0]),
        .B(Y[0]),
        .Cin(Cin),
        .Sum(Result[0]),
        .Cout(C1)
    );

    FA fa1(
        .A(A[1]),
        .B(Y[1]),
        .Cin(C1),
        .Sum(Result[1]),
        .Cout(C2)
    );

    FA fa2(
        .A(A[2]),
        .B(Y[2]),
        .Cin(C2),
        .Sum(Result[2]),
        .Cout(C3)
    );

    FA fa3(
        .A(A[3]),
        .B(Y[3]),
        .Cin(C3),
        .Sum(Result[3]),
        .Cout(Cout)
    );

endmodule