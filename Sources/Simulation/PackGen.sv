// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps

module PackGen #(
		parameter PORT = 0,
		parameter WORD_WIDTH = 32,
		parameter Name="Sender_x.txt",
		parameter Rate_ns = 10000
)
(
	input string Path,
	input clk,
	input reset,
	output logic [WORD_WIDTH-1:0]  DataIn,
	output logic DataVoidIn,
	input stop_out,
	output logic Finish
);
  localparam Numpaccheti=200;
  int DIRVar;
  logic[31:0] Queue[$];
  int TimePush;
  int NumPack=0;
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
    $display ("Start PackGen %d", PORT);
    fd   =$fopen ({Path,"/symFiles/",Name} , "w+");
    fd_t   =$fopen ({Path,"/symFiles/",Name,"_times"} , "w+");
    wait(Finish==1'b1);
    $fclose(fd);      
    $fclose(fd_t);    
  end

  always begin
    if(reset==1'b0) #1;
    else begin
	    TimePush = $urandom_range(Rate_ns,1);
	    #(TimePush);
	    if(NumPack<Numpaccheti) begin
	          Finish=1'b0;
			  do
			    DIRVar=$urandom_range(15,0);
			  while(DIRVar==PORT);
			  E = LocX[DIRVar]>LocX[PORT];
			  W = LocX[DIRVar]<LocX[PORT];
			  N = (LocY[DIRVar]<LocY[PORT])  && (LocX[PORT] == LocX[DIRVar]);
			  S = (LocY[DIRVar]>LocY[PORT])  && (LocX[PORT] == LocX[DIRVar]);
			  Loc = (LocY[PORT] == LocY[DIRVar]) && (LocX[PORT] == LocX[DIRVar]);
			  Packet={LocY[PORT],LocX[PORT],LocY[DIRVar],LocX[DIRVar],13'd0,Loc,E,W,S,N};
			  $fwrite(fd,"%0d\t" , {2'b10,Packet});
			  $fwrite(fd_t,"%0g\t" , $realtime);
			  Queue.push_front({2'b10,Packet});
			  
			  randomize(Packet);
			  Queue.push_front({2'b00,Packet});
			  $fwrite(fd,"%0d\t" , {2'b00,Packet});
			  $fwrite(fd_t,"%0g\t" , $realtime);
			  
			  randomize(Packet);
			  Queue.push_front({2'b01,Packet});
			  $fdisplay(fd,"%0d", {2'b01,Packet});
			  $fdisplay(fd_t,"%0g", $realtime);
			  NumPack=NumPack+1;
			end
			else begin
				Finish=1'b1;
			end
	    #(Rate_ns-TimePush);
    end
  end
	
	int newCounter,Counter;
	typedef enum  {HEAD,BODY,TAIL} MX;
	MX MsType;
	
    
    always_comb begin
    if(DataIn[31:30]==2'b10 && DataVoidIn==1'b0)
        MsType<=HEAD;
    else if(DataIn[31:30]==2'b00 && DataVoidIn==1'b0)
         MsType<=BODY;
    else if(DataIn[31:30]==2'b01 && DataVoidIn==1'b0)
        MsType<=TAIL;
    end

	always_ff@(posedge clk) begin
        if(reset==0) begin
            DataVoidIn =  1'b1;
            DataIn =  32'd0; 
            Counter =2;
        end
        else begin
            if(Counter==0) begin
              DataVoidIn<=  1'b1;
              DataIn<=  32'd0; 
              if(stop_out==1'b0) begin
                  if (Queue.size()!=0) begin
                    DataIn<= Queue.pop_back(); 
                    DataVoidIn<=  1'b0;
                  end else
                    Counter<= Counter+1;
              end
            end
            else begin
                if (Queue.size()!=0) begin
                    DataIn<= Queue.pop_back(); 
                    DataVoidIn<=  1'b0;
                    if(stop_out==1'b0);
                    else begin
                      Counter <= Counter-1;
                    end
                end
                else begin
                    DataVoidIn<=  1'b1;
                    DataIn<=  32'd0; 
                    if(stop_out==1'b0 && Counter!=2'd2) Counter<= Counter+1;
                end
             end
           end
	end
	
endmodule
