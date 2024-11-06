`timescale 1ns / 1ps
module TestBench#(
    parameter Rate=90,
    parameter WORD_WIDTH=32,
    parameter TILES = 16
);
	 //DUT parameters

	 logic reset,clk;
	 logic [TILES-1:0][WORD_WIDTH-1:0] DataIn,DataOut;
	 logic [TILES-1:0] DataVoidIn,stop_in,DataVoidOut,stop_out;
	 
	 //2Bit header//6Bit 0 // 3 bit X pos // 3 bit Y pos // 13 bit 0 // 5 bit lookahead
	 logic [0:6][WORD_WIDTH-1:0] dati = '{ 
		  {{2'b10},{6'd0},{3'd3},{3'd2},{13'd0},{5'b00001}} , 
		  {{2'b00}, {32'd1}},
		  {{2'b00}, {32'd2}},
		  {{2'b00}, {32'd3}},
		  {{2'b00}, {32'd4}},
		  {{2'b00}, {32'd5}},
		  {{2'b01},{16'd0},{3'd2},{3'd2},{6'd0}, {2'b00}} };
		  
	always begin
		clk=1'b0;
		#5;
		clk=1'b1;
		#5;
	end
	
	initial begin
		reset=1'b0;
		#100
		reset=1'b1;
	end
	string Path="/home/giuseppe/Documents/Syncssh/SyncSwitch";
   logic [15:0] Finish;
	PackGen #(0, WORD_WIDTH,"Sender_X0Y0",Rate) Sender_X0Y0(Path,clk,reset,DataIn[0 ],DataVoidIn[0 ],stop_out[0 ],Finish[0 ]);
	PackGen #(1, WORD_WIDTH,"Sender_X1Y0",Rate) Sender_X1Y0(Path,clk,reset,DataIn[1 ],DataVoidIn[1 ],stop_out[1 ],Finish[1 ]);
	PackGen #(2, WORD_WIDTH,"Sender_X2Y0",Rate) Sender_X2Y0(Path,clk,reset,DataIn[2 ],DataVoidIn[2 ],stop_out[2 ],Finish[2 ]);
	PackGen #(3, WORD_WIDTH,"Sender_X3Y0",Rate) Sender_X3Y0(Path,clk,reset,DataIn[3 ],DataVoidIn[3 ],stop_out[3 ],Finish[3 ]);
	PackGen #(4, WORD_WIDTH,"Sender_X0Y1",Rate) Sender_X0Y1(Path,clk,reset,DataIn[4 ],DataVoidIn[4 ],stop_out[4 ],Finish[4 ]);
	PackGen #(5, WORD_WIDTH,"Sender_X1Y1",Rate) Sender_X1Y1(Path,clk,reset,DataIn[5 ],DataVoidIn[5 ],stop_out[5 ],Finish[5 ]);
	PackGen #(6, WORD_WIDTH,"Sender_X2Y1",Rate) Sender_X2Y1(Path,clk,reset,DataIn[6 ],DataVoidIn[6 ],stop_out[6 ],Finish[6 ]);
	PackGen #(7, WORD_WIDTH,"Sender_X3Y1",Rate) Sender_X3Y1(Path,clk,reset,DataIn[7 ],DataVoidIn[7 ],stop_out[7 ],Finish[7 ]);
	PackGen #(8, WORD_WIDTH,"Sender_X0Y2",Rate) Sender_X0Y2(Path,clk,reset,DataIn[8 ],DataVoidIn[8 ],stop_out[8 ],Finish[8 ]);
	PackGen #(9, WORD_WIDTH,"Sender_X1Y2",Rate) Sender_X1Y2(Path,clk,reset,DataIn[9 ],DataVoidIn[9 ],stop_out[9 ],Finish[9 ]);
	PackGen #(10,WORD_WIDTH,"Sender_X2Y2",Rate) Sender_X2Y2(Path,clk,reset,DataIn[10],DataVoidIn[10],stop_out[10],Finish[10]);
	PackGen #(11,WORD_WIDTH,"Sender_X3Y2",Rate) Sender_X3Y2(Path,clk,reset,DataIn[11],DataVoidIn[11],stop_out[11],Finish[11]);
	PackGen #(12,WORD_WIDTH,"Sender_X0Y3",Rate) Sender_X0Y3(Path,clk,reset,DataIn[12],DataVoidIn[12],stop_out[12],Finish[12]);
	PackGen #(13,WORD_WIDTH,"Sender_X1Y3",Rate) Sender_X1Y3(Path,clk,reset,DataIn[13],DataVoidIn[13],stop_out[13],Finish[13]);
	PackGen #(14,WORD_WIDTH,"Sender_X2Y3",Rate) Sender_X2Y3(Path,clk,reset,DataIn[14],DataVoidIn[14],stop_out[14],Finish[14]);
	PackGen #(15,WORD_WIDTH,"Sender_X3Y3",Rate) Sender_X3Y3(Path,clk,reset,DataIn[15],DataVoidIn[15],stop_out[15],Finish[15]);
	initial begin
      wait(Finish==16'd65535);
      #50000;
      $finish;
   end 
	
	PackRec #(0 ,WORD_WIDTH,"Receiver_X0Y0") ReceiverX0Y0(Path,clk,reset,DataOut[0 ],DataVoidOut[0 ],stop_in[0 ]);
	PackRec #(1 ,WORD_WIDTH,"Receiver_X1Y0") ReceiverX1Y0(Path,clk,reset,DataOut[1 ],DataVoidOut[1 ],stop_in[1 ]);
	PackRec #(2 ,WORD_WIDTH,"Receiver_X2Y0") ReceiverX2Y0(Path,clk,reset,DataOut[2 ],DataVoidOut[2 ],stop_in[2 ]);
	PackRec #(3 ,WORD_WIDTH,"Receiver_X3Y0") ReceiverX3Y0(Path,clk,reset,DataOut[3 ],DataVoidOut[3 ],stop_in[3 ]);
	PackRec #(4 ,WORD_WIDTH,"Receiver_X0Y1") ReceiverX0Y1(Path,clk,reset,DataOut[4 ],DataVoidOut[4 ],stop_in[4 ]);
	PackRec #(5 ,WORD_WIDTH,"Receiver_X1Y1") ReceiverX1Y1(Path,clk,reset,DataOut[5 ],DataVoidOut[5 ],stop_in[5 ]);
	PackRec #(6 ,WORD_WIDTH,"Receiver_X2Y1") ReceiverX2Y1(Path,clk,reset,DataOut[6 ],DataVoidOut[6 ],stop_in[6 ]);
	PackRec #(7 ,WORD_WIDTH,"Receiver_X3Y1") ReceiverX3Y1(Path,clk,reset,DataOut[7 ],DataVoidOut[7 ],stop_in[7 ]);
	PackRec #(8 ,WORD_WIDTH,"Receiver_X0Y2") ReceiverX0Y2(Path,clk,reset,DataOut[8 ],DataVoidOut[8 ],stop_in[8 ]);
	PackRec #(9 ,WORD_WIDTH,"Receiver_X1Y2") ReceiverX1Y2(Path,clk,reset,DataOut[9 ],DataVoidOut[9 ],stop_in[9 ]);
	PackRec #(10,WORD_WIDTH,"Receiver_X2Y2") ReceiverX2Y2(Path,clk,reset,DataOut[10],DataVoidOut[10],stop_in[10]);
	PackRec #(11,WORD_WIDTH,"Receiver_X3Y2") ReceiverX3Y2(Path,clk,reset,DataOut[11],DataVoidOut[11],stop_in[11]);
	PackRec #(12,WORD_WIDTH,"Receiver_X0Y3") ReceiverX0Y3(Path,clk,reset,DataOut[12],DataVoidOut[12],stop_in[12]);
	PackRec #(13,WORD_WIDTH,"Receiver_X1Y3") ReceiverX1Y3(Path,clk,reset,DataOut[13],DataVoidOut[13],stop_in[13]);
	PackRec #(14,WORD_WIDTH,"Receiver_X2Y3") ReceiverX2Y3(Path,clk,reset,DataOut[14],DataVoidOut[14],stop_in[14]);
	PackRec #(15,WORD_WIDTH,"Receiver_X3Y3") ReceiverX3Y3(Path,clk,reset,DataOut[15],DataVoidOut[15],stop_in[15]);
	 
	noc32_xyInterface #(4,4,16) myRouter(
	.clk(clk),
	.rst(reset),
	.input_port_0 (DataIn[0 ]) ,
	.input_port_1 (DataIn[1 ]) ,
	.input_port_2 (DataIn[2 ]) ,
	.input_port_3 (DataIn[3 ]) ,
	.input_port_4 (DataIn[4 ]) ,
	.input_port_5 (DataIn[5 ]) ,
	.input_port_6 (DataIn[6 ]) ,
	.input_port_7 (DataIn[7 ]) ,
	.input_port_8 (DataIn[8 ]) ,
	.input_port_9 (DataIn[9 ]) ,
	.input_port_10 (DataIn[10]) ,
	.input_port_11 (DataIn[11]) ,
	.input_port_12 (DataIn[12]) ,
	.input_port_13 (DataIn[13]) ,
	.input_port_14 (DataIn[14]) ,
	.input_port_15 (DataIn[15]) ,
	.data_void_in(DataVoidIn),
	.stop_in(stop_in),
	.output_port_0 (DataOut[0 ]) ,
	.output_port_1 (DataOut[1 ]) ,
	.output_port_2 (DataOut[2 ]) ,
	.output_port_3 (DataOut[3 ]) ,
	.output_port_4 (DataOut[4 ]) ,
	.output_port_5 (DataOut[5 ]) ,
	.output_port_6 (DataOut[6 ]) ,
	.output_port_7 (DataOut[7 ]) ,
	.output_port_8 (DataOut[8 ]) ,
	.output_port_9 (DataOut[9 ]) ,
	.output_port_10 (DataOut[10]) ,
	.output_port_11 (DataOut[11]) ,
	.output_port_12 (DataOut[12]) ,
	.output_port_13 (DataOut[13]) ,
	.output_port_14 (DataOut[14]) ,
	.output_port_15 (DataOut[15]) ,
	.data_void_out(DataVoidOut),
	.stop_out(stop_out));


endmodule

/*
noc32_xy #(4,4,16) myRouter(
	.clk(clk),
	.rst(reset),
	.input_port[0] (DataIn[0 ]) ,
	.input_port[1] (DataIn[1 ]) ,
	.input_port[2] (DataIn[2 ]) ,
	.input_port[3] (DataIn[3 ]) ,
	.input_port[4] (DataIn[4 ]) ,
	.input_port[5] (DataIn[5 ]) ,
	.input_port[6] (DataIn[6 ]) ,
	.input_port[7] (DataIn[7 ]) ,
	.input_port[8] (DataIn[8 ]) ,
	.input_port[9] (DataIn[9 ]) ,
	.input_port[10] (DataIn[10]) ,
	.input_port[11] (DataIn[11]) ,
	.input_port[12] (DataIn[12]) ,
	.input_port[13] (DataIn[13]) ,
	.input_port[14] (DataIn[14]) ,
	.input_port[15] (DataIn[15]) ,
	.data_void_in(DataVoidIn),
	.stop_in(stop_in),
	.\output_port[0] (DataOut[0 ]) ,
	.\output_port[1] (DataOut[1 ]) ,
	.\output_port[2] (DataOut[2 ]) ,
	.\output_port[3] (DataOut[3 ]) ,
	.\output_port[4] (DataOut[4 ]) ,
	.\output_port[5] (DataOut[5 ]) ,
	.\output_port[6] (DataOut[6 ]) ,
	.\output_port[7] (DataOut[7 ]) ,
	.\output_port[8] (DataOut[8 ]) ,
	.\output_port[9] (DataOut[9 ]) ,
	.\output_port[10] (DataOut[10]) ,
	.\output_port[11] (DataOut[11]) ,
	.\output_port[12] (DataOut[12]) ,
	.\output_port[13] (DataOut[13]) ,
	.\output_port[14] (DataOut[14]) ,
	.\output_port[15] (DataOut[15]) ,
	.data_void_out(DataVoidOut),
	.stop_out(stop_out));
	*/
