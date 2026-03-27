// Memory Test bench code
module memory_tb(); 
  parameter addr_width=16;   parameter data_width=32; 
  integer count;
  reg cs,clk,reset,re,we;
  reg [addr_width-1:0] addr;
  reg [data_width-1:0] data_in;
  wire [data_width-1:0] data_out;
// memory instance
 memory #(addr_width, data_width) memory_inst(addr,cs,re,we,clk,reset,data_in,data_out);
 
 initial begin
   $dumpvars; // dump the vcd 
    $dumpfile("dump.vcd");
    clk=0;    reset=0;
	#5 reset=1;
	#5 reset=0;
 end
// clock generation
always #5 clk=~clk;
// calling write and read tasks
 initial begin
 for(count=0; count< 'h100000;count=count+1)  begin  
      write_task(count);
      read_task(count);  
       if (data_in != data_out) 
        $display ($time, "  FAIL: Data Mis Match for addr=%0h, data_in=%0h, data_out=%0h\n", count, data_in, data_out);  
       else
        $display ($time, "  PASS: Data Matched for addr=%0h, data_in=%0h, data_out=%0h\n", count, data_in, data_out);
  end
#1000000 $finish; // end the test
end
// write task
task write_task;
input [addr_width-1:0] addr_in;
begin
 @(posedge clk);
  #1;
  cs=1; we=1; re=0;        //data_in=$random;
  data_in=$random;
  addr=addr_in;
  @(posedge clk);
   #1;
  we=0;  cs=0;
end
endtask

//read task
task read_task;
input [addr_width-1:0] addr_in;
begin
   @(posedge clk); 
   #1;
   cs=1; we=0;re=1;
   addr =addr_in;
   @(posedge clk);
    #1;
    re = 0;    cs=0; 
 end
endtask
endmodule
