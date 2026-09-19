// tb.v
// Starter testbench template -- YOU complete this file.

module tb;

  // TODO: declare the inputs and outputs
  reg [3:0] N1 ;
  reg [3:0] N2;
  wire [3:0] sum ;
  reg opcode ;

  integer i ; 
  integer j ;
  integer l ;


/*
  reg [3:0] answers [511:0] ;


  

  initial begin
  for (i = 0; i < 15; i = i + 1) begin
      for (j = 0; j < 15; j = j + 1) begin
          answers[(i*16) + j] = i+j ; 
      end
  end

  for (i = 0; i < 15; i = i + 1) begin
      for (j = 0; j < 15; j = j + 1) begin
           answers[(i*16) + j + 255] = i-j+16 ; 
      end
  end

end

*/


  // Initiating lut instance here
  alu my_alu (
    .a(N1), 
    .b(N2),
    .op(opcode),
    .result(sum)
  ) ;


  // Waveform dump configuration (DO NOT CHANGE)
  string vcd_file;
  initial begin
    if ($value$plusargs("vcd=%s", vcd_file)) begin
      $dumpfile(vcd_file);
      $dumpvars(0, my_alu);
    end
  end

  initial begin
    // TODO: apply different input combinations
    N1 = 0; N2 = 0; opcode = 0; 

    for (i = 0; i< 15; i = i + 1) begin
      for (j = 0; j< 15; j = j + 1) begin
        #5 N1 = i; N2 = j ; 
        if ( sum !== (i + j)) begin
            $display("FAIL at time %0t: N1=%d N2=%d op = %b got sum=%d  expected %d",
                        $time, N1, N2, opcode, sum, (i+j));
            //errors = errors + 1;
        end
      end
    end

    N1 = 0; N2 = 0; opcode = 1; 

    for (i = 0; i< 15; i = i + 1) begin
      for (j = 0; j< 15; j = j + 1) begin
        #5 N1 = i; N2 = j ; 
        if ( sum !== (16 + i - j)) begin
            $display("FAIL at time %0t: N1=%d N2=%d op = %b got sum=%d  expected %d",
                        $time, N1, N2, opcode, sum, 16+i-j);
            //errors = errors + 1;
        end
      end
    end
  


  end

  initial
    $monitor($time, " N1 =Db N2 = %D op = %d| sum=%d", N1, N2, opcode, sum); // change as required

endmodule
