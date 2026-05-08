`timescale 1ns / 1ps


module top(
    input         CLK100MHZ,        // nexys clk signal
    input         reset,            // btnC on nexys
    inout         TMP_SDA,          // i2c sda on temp sensor - bidirectional
    output        TMP_SCL,   
           // i2c scl on temp sensor
    output [6:0]  seg,              // 7 segments of each display
    output [3:0]  an,               // 4 anodes of 4 displays
    output [3:0]  NAN,              // 4 anodes always OFF
    output [7:0]  led              // nexys leds = binary temp in deg C
    );
    
    wire sda_dir;                   // direction of SDA signal - to or from master
    wire w_200kHz;                  // 200kHz SCL
    wire [7:0] w_data;              // 8 bits of temperature data

    // Instantiate i2c master
    i2c_master master(
        .clk_200kHz(w_200kHz),
        .reset(reset),
        .temp_data(w_data),
        .SDA(TMP_SDA),
        .SDA_dir(sda_dir),
        .SCL(TMP_SCL)
    );
    
    // Instantiate 200kHz clock generator
    clkgen_200kHz cgen(
        .clk_100MHz(CLK100MHZ),
        .clk_200kHz(w_200kHz)
    );
    
    // Instantiate 7 segment control
    seg7 dut(
        .clk_100MHz(CLK100MHZ),
        .temp_data(w_data),
        .seg(seg),
        .NAN(NAN),
        .an(an)
    );
    
    // Set LED value to temp data
    assign led = w_data;

endmodule
