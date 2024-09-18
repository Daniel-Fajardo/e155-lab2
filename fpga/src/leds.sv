module leds(
    	input logic [3:0] s1,
    	input logic [3:0] s2,
    	output logic [4:0] led
);
    logic [3:0] c;
    // 4-bit adder combinational logic for leds
    always_comb begin
        // sum first bits
        led[0] = ~(s1[0]^s2[0]);
        c[0] = s1[0]&s2[0];
        // sum second bits and carry
        led[1] = ~(s1[1]^s2[1]^c[0]);
        c[1] = (s1[1]&s2[1])|(s1[1]&c[0])|(s2[1]&c[0]);
        // sum third bits and carry
        led[2] = ~(s1[2]^s2[2]^c[1]);
        c[2] = (s1[2]&s2[2])|(s1[2]&c[1])|(s2[2]&c[1]);
        // sum fourth bits and carry
        led[3] = ~(s1[3]^s2[3]^c[2]);
        c[3] = (s1[3]&s2[3])|(s1[3]&c[2])|(s2[3]&c[2]);
        // carry is largest bit in led
        led[4] = ~(c[3]);
    end
endmodule