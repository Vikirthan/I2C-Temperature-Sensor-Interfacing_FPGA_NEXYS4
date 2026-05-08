`timescale 1ns / 1ps

module clkgen_200kHz(
    input clk_100MHz,
    output clk_200kHz
    );
    
    // 100 x 10^6 / 200 x 10^3 / 2 = 250
    // NOTE: counter counts to 249 (not 4999) for correct 200kHz output
    // 100MHz / (2 * 250) = 200kHz  => toggle at 249
    reg [12:0] counter = 12'h00;
    reg clk_reg = 1'b1;
    
    always @(posedge clk_100MHz) begin
        if(counter == 4999) begin
            counter <= 12'h00;
            clk_reg <= ~clk_reg;
        end
        else
            counter <= counter + 1;
    end
    
    assign clk_200kHz = clk_reg;
    
endmodule