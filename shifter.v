module combinational_shifter(
    input  [3:0] A,
    input        Ir,     // Serial input for right shift
    input        Il,     // Serial input for left shift
    input        S,      // 0 = Right Shift, 1 = Left Shift

    output [3:0] H
);

    // One 2x1 MUX per output bit

    MUX_2X1 mux0(
        .I0(Ir),
        .I1(A[1]),
        .Sel(S),
        .Y(H[0])
    );

    MUX_2X1 mux1(
        .I0(A[0]),
        .I1(A[2]),
        .Sel(S),
        .Y(H[1])
    );

    MUX_2X1 mux2(
        .I0(A[1]),
        .I1(A[3]),
        .Sel(S),
        .Y(H[2])
    );

    MUX_2X1 mux3(
        .I0(A[2]),
        .I1(Il),
        .Sel(S),
        .Y(H[3])
    );

endmodule