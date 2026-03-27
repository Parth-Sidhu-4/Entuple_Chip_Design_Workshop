
set_db init_lib_search_path /home/install/FOUNDRY/digital/90nm/dig/lib

set_db library  slow.lib
    
read_hdl {./memory.v}

elaborate

read_sdc ./constraints_top.sdc


set_db syn_generic_effort medium
set_db syn_map_effort  medium
set_db syn_opt_effort  medium

syn_generic
syn_map
syn_opt

write_hdl > memory_netlist.v
write_sdc  > memory_tool.sdc
   
gui_show

report timing > memory_timing.rpt
report power > memory_power.rpt
report area > memory_cell.rpt
report gates > memory_gates.rpt
   
