`include "full_adder.sv"


module adder_nbits # (
  parameter WIDTH
) (
  input logic [WIDTH-1:0] x_i, // Operando 1
  input logic [WIDTH-1:0] y_i, // Operando 2
  input logic c_i, // Carry entrada
  output logic [WIDTH-1:0] s_o, // Resultado
  output logic c_o // Carry salida
);

logic [WIDTH:0] adder;
assign adder[0] = c_i;
assign c_o = adder[WIDTH];
genvar i;
generate

  for (i=0; i<=WIDTH-1; i++) begin
    full_adder bit_inst  (
      .x_i(x_i[i]),
      .y_i(y_i[i]),
      .c_i(adder[i]),
      .s_o(s_o[i]),
      .c_o(adder[i+1])
    );
  
  end

endgenerate

endmodule
