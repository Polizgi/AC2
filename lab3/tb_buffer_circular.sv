module tb_buffer_circular;

    parameter WIDTH = 32;
    parameter NUM = 8;
    parameter INDEX_SIZE = $clog2(NUM);
    // Signal declaration
    reg				  clk; 			// Senyal de reloj
    reg 				rstn; 		// Senyal negada de reset
    reg 				insercion; 	// Senyal de insercion
    reg [WIDTH-1:0] 	dato_i; 		// Dato a insertar
    reg 				delecion; 	// Senyal de delecion
    wire [WIDTH-1:0] 	dato_o; 		// Dato leido
    wire 				vacia; 		// Senyal de cola vacıa
    wire 				llena; 		// Senyal de cola llena
    integer i, pos;

    initial begin
        
    end

    // Instance of the full_adder under test
    BufferCircular #( .WIDTH(WIDTH), .NUM(NUM)) CD (
      .clk_i(clk), 			   // Senyal de reloj
  		.rstn_i(rstn), 		       // Senyal negada de reset
      .insercion_i(insercion),
      .dato_i(dato_i),
      .delecion_i(delecion),
      .dato_o(dato_o),
      .vacia_o(vacia),
      .llena_o(llena)
    );

    task insert_data(input [WIDTH-1:0] data_in);
      insercion = 1;
      $display("Data Escrita cb[%d], %d",cola_q,data_in);
      dato_i = data_in;
    endtask

    task delete_data();
      delecion = 1;
    endtask

    // Basic test for all the input combinations
    task basic_functional_testing();
        $display(" ------------------------------------------------");
        $display(" Basic test ");
        $display(" ------------------------------------------------");

        clk = 1; rstn = 0;
        #500 clk = 0; rstn = 1;
        #500;
        for (i=1; i<=8; i++) begin
             clk = 1;
             if (i <= 4)
              insert_data(i);
             else
              delete_data();
            
             #500 clk = 0;
             insercion = 0;
             delecion = 0;
             #500; 
        end
    endtask

    /*
    * TESTS A HACER
    *
      * Que vaya escribiendo y leyendo
      * Que pasa si llega al final y lee / escribe?
      * */



    // Main execution flow of the testbench
    initial begin 
        // wavefrom generation
        $dumpfile("waveform.vcd");
        $dumpvars();

        // Functionality testing of the 
        basic_functional_testing();
        $finish();
    end
                 
endmodule
