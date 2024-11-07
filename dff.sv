module dff(input logic d,
         input logic clk,
          input logic rst,
          output logic  q
          );

    always_ff @(posedge clk or negedge rst) begin
        if(!rst) begin 
            q<=0;
        end
        else begin
            q<=d;
        end
    end

endmodule