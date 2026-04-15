
set_db init_lib_search_path /home/install/FOUNDRY/digital/45nm/LIBS/lib/max
set_db lef_library /home/install/FOUNDRY/digital/45nm/LIBS/lef/gsclib045.fixed.lef

set_db library  slow.lib    
read_hdl {./counter.v}
elaborate
read_sdc ./constraints_top_2GHz.sdc


set_db syn_generic_effort medium
set_db syn_map_effort  medium
set_db syn_opt_effort  medium

syn_generic
syn_map
syn_opt

write_hdl > output_2GHZ/counter_netlist.v
write_sdc  > output_2GHZ/counter_tool.sdc
   
gui_show

report timing > output_2GHZ/counter_timing.rpt
report power > output_2GHZ/counter_power.rpt
report area > output_2GHZ/counter_cell.rpt
report gates > output_2GHZ/counter_gates.rpt
   
