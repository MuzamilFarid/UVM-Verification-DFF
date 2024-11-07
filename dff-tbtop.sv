
module dff-tbtop;
import uvm_pkg::*;

logic clk;

// Declare interface

    dffif if(clk);  // clock generated here passed to the interface

// DUT

dff DUT(
    .d(if.d),
    .clk(if.clk),
    .rst(if.rst),
    .q(if.q)
);

// Clock generation

initial begin
clk <= 1'b0;
end

#10 always clk <= ~ clk;  //clock with period 20ns

initial begin
$dumpfile("variables.vcd");   
$dumpvars();
end

// uvm_config_db to set the interfaces handle

initial begin
    uvm_config_db#(virtual dffif)::set(uvm_root::get(),"","vif",if); 
end

// one initial block to execute run_test() function
initial begin
run_test(dff_test);  // if the test is not specified then must be specified to the tool via command line with +UVM_TESTNAME=dff_test 
end



endmodule