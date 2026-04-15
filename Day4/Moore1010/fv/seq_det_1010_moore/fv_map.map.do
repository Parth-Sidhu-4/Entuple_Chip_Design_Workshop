
//input ports
add mapped point clk clk -type PI PI
add mapped point reset reset -type PI PI
add mapped point din din -type PI PI

//output ports
add mapped point dout dout -type PO PO

//inout ports




//Sequential Pins
add mapped point state[1]/q state_reg[1]/Q  -type DFF DFF
add mapped point dout/q dout_reg/Q  -type DFF DFF
add mapped point state[2]/q state_reg[2]/Q  -type DFF DFF
add mapped point state[0]/q state_reg[0]/Q  -type DFF DFF



//Black Boxes



//Empty Modules as Blackboxes
