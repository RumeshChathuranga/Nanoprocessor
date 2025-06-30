## Clock signal 
set_property PACKAGE_PIN W5 [get_ports NanoClock] 
set_property IOSTANDARD LVCMOS33 [get_ports NanoClock] 
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} 
[get_ports NanoClock] 


## LEDs 
set_property PACKAGE_PIN U16 [get_ports {FourLED[0]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {FourLED[0]}] 
set_property PACKAGE_PIN E19 [get_ports {FourLED[1]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {FourLED[1]}] 
set_property PACKAGE_PIN U19 [get_ports {FourLED[2]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {FourLED[2]}] 
set_property PACKAGE_PIN V19 [get_ports {FourLED[3]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {FourLED[3]}] 
set_property PACKAGE_PIN P1 [get_ports {ZeroLED}] 
set_property IOSTANDARD LVCMOS33 [get_ports {ZeroLED}] 
set_property PACKAGE_PIN L1 [get_ports {OverflowLED}] 
set_property IOSTANDARD LVCMOS33 [get_ports {OverflowLED}] 


##7 segment display 
set_property PACKAGE_PIN W7 [get_ports {SevenSegment[0]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {SevenSegment[0]}] 
set_property PACKAGE_PIN W6 [get_ports {SevenSegment[1]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {SevenSegment[1]}] 
set_property PACKAGE_PIN U8 [get_ports {SevenSegment[2]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {SevenSegment[2]}] 
set_property PACKAGE_PIN V8 [get_ports {SevenSegment[3]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {SevenSegment[3]}] 
set_property PACKAGE_PIN U5 [get_ports {SevenSegment[4]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {SevenSegment[4]}] 
set_property PACKAGE_PIN V5 [get_ports {SevenSegment[5]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {SevenSegment[5]}] 
set_property PACKAGE_PIN U7 [get_ports {SevenSegment[6]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {SevenSegment[6]}] 
 


set_property PACKAGE_PIN U2 [get_ports Anode[0]] 
set_property IOSTANDARD LVCMOS33 [get_ports Anode[0]] 
set_property PACKAGE_PIN U4 [get_ports Anode[1]] 
set_property IOSTANDARD LVCMOS33 [get_ports Anode[1]] 
set_property PACKAGE_PIN V4 [get_ports Anode[2]] 
set_property IOSTANDARD LVCMOS33 [get_ports Anode[2]] 
set_property PACKAGE_PIN W4 [get_ports Anode[3]] 
set_property IOSTANDARD LVCMOS33 [get_ports Anode[3]] 

##Buttons 
set_property PACKAGE_PIN U18 [get_ports Reset] 
set_property IOSTANDARD LVCMOS33 [get_ports Reset]