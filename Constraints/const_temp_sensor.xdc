############################
## CLOCK (100 MHz)
############################
set_property PACKAGE_PIN E3 [get_ports CLK100MHZ]
set_property IOSTANDARD LVCMOS33 [get_ports CLK100MHZ]
create_clock -name sys_clk -period 10.000 [get_ports CLK100MHZ]


############################
## RESET BUTTON (BTN C)
############################
set_property PACKAGE_PIN C12 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]


############################
## LEDs (LED0-LED7)
############################
set_property PACKAGE_PIN T8 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]

set_property PACKAGE_PIN V9 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]

set_property PACKAGE_PIN R8 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]

set_property PACKAGE_PIN T6 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]

set_property PACKAGE_PIN T5 [get_ports {led[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[4]}]

set_property PACKAGE_PIN T4 [get_ports {led[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[5]}]

set_property PACKAGE_PIN U7 [get_ports {led[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[6]}]

set_property PACKAGE_PIN U6 [get_ports {led[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[7]}]


############################
## 7-SEGMENT SEGMENTS (CA-CG)
############################
set_property PACKAGE_PIN L3 [get_ports {seg[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[0]}]

set_property PACKAGE_PIN N1 [get_ports {seg[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[1]}]

set_property PACKAGE_PIN L5 [get_ports {seg[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[2]}]

set_property PACKAGE_PIN L4 [get_ports {seg[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[3]}]

set_property PACKAGE_PIN K3 [get_ports {seg[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[4]}]

set_property PACKAGE_PIN M2 [get_ports {seg[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[5]}]

set_property PACKAGE_PIN L6 [get_ports {seg[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[6]}]


############################
## 7-SEGMENT ANODES (AN0-AN3)
############################
set_property PACKAGE_PIN N6 [get_ports {an[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]

set_property PACKAGE_PIN M6 [get_ports {an[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]

set_property PACKAGE_PIN M3 [get_ports {an[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]

set_property PACKAGE_PIN N5 [get_ports {an[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]


############################
## UNUSED ANODES (AN4-AN7 ? NAN)
############################
set_property PACKAGE_PIN N2 [get_ports {NAN[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {NAN[0]}]

set_property PACKAGE_PIN N4 [get_ports {NAN[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {NAN[1]}]

set_property PACKAGE_PIN L1 [get_ports {NAN[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {NAN[2]}]

set_property PACKAGE_PIN M1 [get_ports {NAN[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {NAN[3]}]


############################
## TEMPERATURE SENSOR (I2C)
############################
# SCL
set_property PACKAGE_PIN F16 [get_ports TMP_SCL]
set_property IOSTANDARD LVCMOS33 [get_ports TMP_SCL]

# SDA (bidirectional)
set_property PACKAGE_PIN G16 [get_ports TMP_SDA]
set_property IOSTANDARD LVCMOS33 [get_ports TMP_SDA]