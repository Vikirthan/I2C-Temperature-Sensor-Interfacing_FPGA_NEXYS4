`timescale 1ns / 1ps



module seg7(
    input clk_100MHz,               // Nexys A7 clock
    input [7:0] temp_data,          // Temp data from i2c master
    output reg [6:0] seg,           // 7 Segments of Displays
    output reg [3:0] NAN = 4'hF,    // 4 Anodes of 8 turned OFF
    output reg [3:0] an             // 4 Anodes of 8 to display Temp
    );
    
    // Binary to BCD conversion of temperature data
    wire [3:0] tens, ones;
    assign tens = temp_data / 10;           // Tens value of temp data
    assign ones = temp_data % 10;           // Ones value of temp data
    
    // Parameters for segment patterns
    parameter ZERO  = 7'b100_0000;  // 0
    parameter ONE   = 7'b111_1001;  // 1
    parameter TWO   = 7'b010_0100;  // 2 
    parameter THREE = 7'b011_0000;  // 3
    parameter FOUR  = 7'b001_1001;  // 4
    parameter FIVE  = 7'b001_0010;  // 5
    parameter SIX   = 7'b000_0010;  // 6
    parameter SEVEN = 7'b111_1000;  // 7
    parameter EIGHT = 7'b000_0000;  // 8
    parameter NINE  = 7'b001_0000;  // 9
    parameter DEG   = 7'b001_1100;  // degrees symbol
    parameter C     = 7'b100_0110;  // C
    
    // To select each digit in turn
    reg [1:0] anode_select;         // 2 bit counter for selecting each of 4 digits
    reg [16:0] anode_timer;         // counter for digit refresh
    
    // Logic for controlling digit select and digit timer
    always @(posedge clk_100MHz) begin
        // 1ms x 4 displays = 4ms refresh period
        if(anode_timer == 99_999) begin         // The period of 100MHz clock is 10ns (1/100,000,000 seconds)
            anode_timer <= 0;                   // 10ns x 100,000 = 1ms
            anode_select <=  anode_select + 1;
        end
        else
            anode_timer <=  anode_timer + 1;
    end
    
    // Logic for driving the 4 bit anode output based on digit select
    always @(anode_select) begin
        case(anode_select) 
            2'b00 : an = 4'b1110;   // Turn on ones digit
            2'b01 : an = 4'b1101;   // Turn on tens digit
            2'b10 : an = 4'b1011;   // Turn on hundreds digit
            2'b11 : an = 4'b0111;   // Turn on thousands digit
        endcase
    end
    
    always @*
        case(anode_select)
            2'b00 : seg = C;    // Set to C for Celsuis
                        
            2'b01 : seg= DEG;  // Set to degrees symbol
                    
            2'b10 : begin       // TEMPERATURE ONES DIGIT
                        case(ones)
                            4'b0000 :  seg = ZERO;
                            4'b0001 :  seg = ONE;
                            4'b0010 :  seg = TWO;
                            4'b0011 :  seg = THREE;
                            4'b0100 :  seg = FOUR;
                            4'b0101 :  seg = FIVE;
                            4'b0110 :  seg = SIX;
                            4'b0111 :  seg = SEVEN;
                            4'b1000 : seg = EIGHT;
                            4'b1001 : seg = NINE;
                        endcase
                    end
                    
            2'b11 : begin       // TEMPERATURE TENS DIGIT
                        case(tens)
                            4'b0000 :  seg = ZERO;
                            4'b0001 :  seg = ONE;
                            4'b0010 :  seg = TWO;
                            4'b0011 :  seg = THREE;
                            4'b0100 :  seg = FOUR;
                            4'b0101 : seg = FIVE;
                            4'b0110 : seg= SIX;
                            4'b0111 : seg = SEVEN;
                            4'b1000 : seg = EIGHT;
                            4'b1001 :  seg = NINE;
                        endcase
                    end
        endcase
    
endmodule
