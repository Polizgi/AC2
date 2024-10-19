
module full_adder (
  input logic x_i,
  input logic y_i,
  input logic c_i,
  output logic s_o,
  output logic c_o
);

// Declaraci ́on de se~nyales intermedias
// Aquitectura de un Full Adder

logic A;
logic B;
logic D;




assign #(100) A = x_i ^ y_i;
assign #(50) B = A & c_i;
assign #(50) D = x_i & y_i;
assign #(100) s_o = A ^ c_i;
assign #(100) c_o = B | D;


// 1) declaracion de variables
// 2) instanciacion del diseño bajo test
// 3) definicion de los diferentes test en forma de taask
// 4) ejecucion del banco de pruebas


// and = 50ps;
// or = 100ps;
// xor = 100ps;


endmodule
