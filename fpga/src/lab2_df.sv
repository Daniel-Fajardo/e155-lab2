module top(
		input logic [3:0] s1,
    	input logic [3:0] s2,
		input logic reset,
    	output logic [6:0] seg,
    	output logic anode1,
    	output logic anode2,
    	output logic [4:0] led
);
	logic state;
	logic clk;
	logic [3:0] s;
	logic int_osc;
	logic [18:0] counter; 
	
	clockdivider clockdivider(reset, clk, counter[18:0]); // controls clock frequency
	leds leds(s1[3:0], s2[3:0], led[4:0]); // logic for 4 bit adder in leds
	chooseanode chooseanode(clk, reset, s1[3:0], s2[3:0], anode1, anode2, s[3:0]); // alternates which display is active
	segmentlogic segmentlogic1(s[3:0], seg[6:0]); // logic for the segment display

endmodule
