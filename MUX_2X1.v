module MUX_2X1(
    input I0,
    input I1,
    input Sel,
    output reg Y
);

always @(*) begin
    case(Sel)
        1'b0: Y = I0;
        1'b1: Y = I1;
    endcase
end

endmodule