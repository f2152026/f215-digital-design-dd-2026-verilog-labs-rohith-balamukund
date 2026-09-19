// tb.v
// Starter testbench template -- YOU complete this file.

module tb;

  // TODO: declare the inputs and outputs
  reg [1:0] test_A ;
  reg [1:0] test_B ;
  wire test_LT ;
  wire test_GT ;
  wire test_EQ ;

  integer errors = 0; 

  // Initiating lut instance here
  comp2 my_comp (
    .A(test_A), 
    .B(test_B),
    .LT(test_LT),
    .GT(test_GT),
    .EQ(test_EQ)
  ) ;


  // Waveform dump configuration (DO NOT CHANGE)
  string vcd_file;
  initial begin
    if ($value$plusargs("vcd=%s", vcd_file)) begin
      $dumpfile(vcd_file);
      $dumpvars(0, my_comp);
    end
  end

  initial begin
    // TODO: apply different input combinations
    test_A = 0; test_B = 0; 
    #5 test_A = 0; test_B = 0 ; 
    if ({test_GT, test_LT, test_EQ} !== {1'b0, 1'b0, 1'b1}) begin
        $display("FAIL at time %0t: A=%b B=%b  got GT=%b LT=%b EQ=%b  expected GT=0 LT=0 EQ=1",
                    $time, test_A, test_B, test_GT, test_LT, test_EQ);
        errors = errors + 1;
    end
    #5 test_A = 0; test_B = 1 ; 
    if ({test_GT, test_LT, test_EQ} !== {1'b0, 1'b1, 1'b0}) begin
        $display("FAIL at time %0t: A=%b B=%b  got GT=%b LT=%b EQ=%b  expected GT=0 LT=1 EQ=0",
                    $time, test_A, test_B, test_GT, test_LT, test_EQ);
        errors = errors + 1;
    end
    #5 test_A = 1; test_B = 0 ; 
    if ({test_GT, test_LT, test_EQ} !== {1'b1, 1'b0, 1'b0}) begin
        $display("FAIL at time %0t: A=%b B=%b  got GT=%b LT=%b EQ=%b  expected GT=1 LT=0 EQ=0",
                    $time, test_A, test_B, test_GT, test_LT, test_EQ);
        errors = errors + 1;
    end
    #5 test_A = 1; test_B = 1 ; 
    if ({test_GT, test_LT, test_EQ} !== {1'b0, 1'b0, 1'b1}) begin
        $display("FAIL at time %0t: A=%b B=%b  got GT=%b LT=%b EQ=%b  expected GT=0 LT=0 EQ=1",
                    $time, test_A, test_B, test_GT, test_LT, test_EQ);
        errors = errors + 1;
    end

    $display("Total number of errors : %d", errors) ;


  end

  initial
    $monitor($time, " A =%b B = %b | LT=%d, GT=%d, EQ=%d", test_A, test_B, test_LT, test_GT, test_EQ); // change as required

endmodule
