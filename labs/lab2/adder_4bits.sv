`include "full_adder.sv"


module adder_4bits (
  input logic [3:0] x_i, // Operando 1
  input logic [3:0] y_i, // Operando 2
  input logic c_i, // Carry entrada
  output logic [3:0] s_o, // Resultado
  output logic c_o // Carry salida
);

logic [4:0] adder;
assign adder[0] = c_i;
assign c_o = adder[4];
genvar i;
generate

  for (i=0; i<=3; i++) begin
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
