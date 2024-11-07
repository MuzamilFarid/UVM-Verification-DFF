// clock is usually an input to interface because if there are multiple instances of interafce then all interfaces share same clock
// usually Clock is the good candidate, its shared mostly to other interfaces, modules within design

interface dffif(input logic clk);  
logic rst;
logic d;
logic q;

// use clocking block, input/outputs inside clocking block are always with respect to TB NOT DUT.

clocking cb @(posedge clk);
default input #2 output #1step;  // input is sampled 2ns before clock edge, output is sampled 1step after clock edge
output rst, d;
input q;
endclocking


endinterface