# ####################################################################

#  Created by Genus(TM) Synthesis Solution 20.11-s111_1 on Mon Mar 30 15:44:25 IST 2026

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design seq_det_1010_moore

create_clock -name "clk" -period 0.5 -waveform {0.0 0.25} [get_ports clk]
set_clock_transition 0.05 [get_clocks clk]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports reset]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports dout]
set_clock_uncertainty -setup 0.005 [get_ports clk]
set_clock_uncertainty -hold 0.005 [get_ports clk]
