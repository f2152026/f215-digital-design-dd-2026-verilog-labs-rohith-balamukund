// tb.v
// Starter testbench template -- YOU complete this file.

module tb;

  // TODO: declare the inputs and outputs
  reg [2:0] sel_test_input ;
  wire [7:0] test_output ;
  integer x;
  parameter TEST_DEPTH = 8;

  // Initiating lut instance here
  lut #(.DEPTH(TEST_DEPTH), .WIDTH(8)) my_lut (
    .sel(sel_test_input), 
    .dout(test_output)
  ) ;


  // Waveform dump configuration (DO NOT CHANGE)
  string vcd_file;
  initial begin
    if ($value$plusargs("vcd=%s", vcd_file)) begin
      $dumpfile(vcd_file);
      $dumpvars(0, my_lut);
    end
  end

  initial begin
    // TODO: apply different input combinations
    sel_test_input = 0;
    for(x=0; x<TEST_DEPTH; x++) begin
      #5 sel_test_input = x;
    end

  end

  initial
    $monitor($time, " Input =%d | Output=%d", sel_test_input, test_output); // change as required

endmodule
