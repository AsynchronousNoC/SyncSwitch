// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps
module PackRec #(
		parameter PORT = 0,
		parameter WORD_WIDTH = 32,
		parameter Name="Receiver_x.txt"
)
(
	input string Path,
	input clk,
	input reset,
	input [WORD_WIDTH-1:0]  DataOut,
	input DataVoidOut,
	output logic stop_in,
	input Finish
);
  //localparam Rate_ns = 1000000;
  localparam Rate_ns = 10000;
  int DIRVar;
  logic[31:0] Queue[$];
  int TimePush = Rate_ns;
  int Counter=0;
  logic [29:0] Packet;
  logic E,W,S,N,Loc;
  logic [0:15][0:2] LocX = '{
    3'd0, 
    3'd1,
    3'd2,
    3'd3,
    3'd0,
    3'd1,
    3'd2,
    3'd3,
    3'd0,
    3'd1, 
    3'd2,
    3'd3,
    3'd0,
    3'd1,
    3'd2, 
    3'd3 };
  logic [0:15][0:2] LocY = '{
    3'd0,
    3'd0,
    3'd0,
    3'd0,
    3'd1,
    3'd1,
    3'd1,
    3'd1,
    3'd2,
    3'd2, 
    3'd2,
    3'd2,
    3'd3,
    3'd3,
    3'd3, 
    3'd3 
    };
    int fd,fd_t;
  initial begin
    $display ("Start PackRec %d", PORT);
    fd   =$fopen ({Path,"/symFiles/",Name} , "w+");
    fd_t   =$fopen ({Path,"/symFiles/",Name,"_times"} , "w+");
    wait(Finish==1'b1);
    $fclose(fd);     
    $fclose(fd_t);      
  end

	
	
	assign #10 stop_in =  DataVoidOut;
	always @(posedge(clk)) begin
		if(reset==0)begin
			stop_in= #1 1'b1;
		end
		else begin
		    if(DataVoidOut==1'b0) begin
		    	if (DataOut[31:30]==2'b10) begin
				  	    $fwrite(fd,"%0d\t" , DataOut);
						$fwrite(fd_t,"%0g\t" , $realtime);
					end else if (DataOut[31:30]==2'b00) begin
						$fwrite(fd,"%0d\t" , DataOut);
						$fwrite(fd_t,"%0g\t" , $realtime);
					end else begin
						$fdisplay(fd,"%0d" , DataOut);
						$fdisplay(fd_t,"%0g" , $realtime);
					end
			 end
		  	end
		end
	
endmodule
