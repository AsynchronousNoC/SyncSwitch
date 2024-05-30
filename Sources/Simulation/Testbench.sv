`timescale 1ns / 1ps

module TestBench();
	     
     //DUT parameters
     parameter WORD_WIDTH=34;
     parameter OUTPORTS = 5;
     logic reset,clk;
     logic [OUTPORTS-1:0][WORD_WIDTH-1:0] DataIn,DataOut;
     logic [OUTPORTS-1:0] DataVoidIn,stop_in,DataVoidOut,stop_out;
     int Counter=2;
     logic [0:6][WORD_WIDTH-1:0] dati = '{ 
        {{2'b10},{6'd0},{3'd3},{3'd2},{15'd0},{5'b00001}} , 
        {{2'b00}, {32'd1}},
        {{2'b00}, {32'd2}},
        {{2'b00}, {32'd3}},
        {{2'b00}, {32'd4}},
        {{2'b00}, {32'd5}},
        {{2'b01},{18'd0},{3'd2},{3'd2},{6'd0}, {2'b00}} };
     
     initial begin
     	reset=0;
        clk=0;
        DataIn[0]=34'd0;
        DataIn[1]=34'd0;
        DataIn[2]=34'd0;
        DataIn[3]=34'd0;
        DataIn[4]=34'd0;
        DataVoidIn=5'h1f;
        #100
        reset=1;
        #10;
        wait(clk==1'b0);
        wait(clk==1'b1);
     end
     assign #5 clk= ~clk;
     
     
        
     always @(posedge(clk)) begin
        if(stop_out[4]==1'b0 && DataVoidIn[4]==1'b0) ;
        else if(stop_out[4]==1'b0 ) Counter= Counter+1;
        else if(DataVoidIn[4]==1'b0) Counter = Counter-1;
     end
     int i;logic Stop=0;
     always @(posedge(clk)) begin
        if(reset==0);
        else begin
            if(Counter==0) DataVoidIn[4]= #1  1'b1;
            else begin
                if(!Stop) begin 
                    DataIn[4]= #1 dati[i];   
                    DataVoidIn[4]= #1 1'b0;
                    i=i+1;
                    if(i==7)begin  i=0;Stop=1'b1;end
                end
            end
        end
     end
     assign #8 stop_in =  DataVoidOut;
     router #(.flow_control(noc::kFlowControlAckNack),.width(WORD_WIDTH),.depth(OUTPORTS),.ports(5'b11111)) 
     myRouter(.clk(clk),
     .rst(reset),
     .CONST_localx(3'h2),
     .CONST_localy(3'h2),
     .data_n_in(DataIn[0]),
     .data_s_in(DataIn[1]),
     .data_w_in(DataIn[2]),
     .data_e_in(DataIn[3]),
     .data_p_in(DataIn[4]),
     .data_void_in(DataVoidIn),
     .stop_in(stop_in),
     .data_n_out(DataOut[0]),
     .data_s_out(DataOut[1]),
     .data_w_out(DataOut[2]),
     .data_e_out(DataOut[3]),
     .data_p_out(DataOut[4]),
     .data_void_out(DataVoidOut),
     .stop_out(stop_out));


endmodule