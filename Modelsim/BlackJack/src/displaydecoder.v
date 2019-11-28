// Made by: Gustavo

module displaydecoder (hand,enable,displayu,displayd);

input [5:0]hand;
input enable;
output [0:6]displayu;
output [0:6]displayd;

wire [5:0]hand; //recebe mão do jogador
wire enable; //liga e desliga o display
reg [0:6]displayu; //envia a informação para o display das unidades
reg [0:6]displayd; //envia a informação para o display das dezenas

always @(*) //display de unidades
	begin
		if (enable==1'b1) //liga o display com nível baixo
			case(hand)
				6'b000000: displayu = 7'b0000001; // numero 0
				6'b000001: displayu = 7'b1001111; // numero 1
				6'b000010: displayu = 7'b0010010; // numero 2
				6'b000011: displayu = 7'b0000110; // numero 3
				6'b000100: displayu = 7'b1001100; // numero 4
				6'b000101: displayu = 7'b0100100; // numero 5
				6'b000110: displayu = 7'b0100000; // numero 6
				6'b000111: displayu = 7'b0001111; // numero 7
				6'b001000: displayu = 7'b0000000; // numero 8
				6'b001001: displayu = 7'b0000100; // numero 9
				6'b001010: displayu = 7'b0000001; // numero 10
				6'b001011: displayu = 7'b1001111; // numero 11
				6'b001100: displayu = 7'b0010010; // numero 12
				6'b001101: displayu = 7'b0000110; // numero 13
				6'b001110: displayu = 7'b1001100; // numero 14
				6'b001111: displayu = 7'b0100100; // numero 15
				6'b010000: displayu = 7'b0100000; // numero 16
				6'b010001: displayu = 7'b0001111; // numero 17
				6'b010010: displayu = 7'b0000000; // numero 18
				6'b010011: displayu = 7'b0000100; // numero 19
				6'b010100: displayu = 7'b0000001; // numero 20
				6'b010101: displayu = 7'b1001111; // numero 21
				6'b010110: displayu = 7'b0010010; // numero 22
				6'b010111: displayu = 7'b0000110; // numero 23
				6'b011000: displayu = 7'b1001100; // numero 24
				6'b011001: displayu = 7'b0100100; // numero 25
				6'b011010: displayu = 7'b0100000; // numero 26
				6'b011011: displayu = 7'b0001111; // numero 27
				6'b011100: displayu = 7'b0000000; // numero 28
				6'b011101: displayu = 7'b0000100; // numero 29
				6'b011110: displayu = 7'b0000001; // numero 30
				6'b011111: displayu = 7'b1001111; // numero 31
				6'b100000: displayu = 7'b0010010; // numero 32
				6'b100001: displayu = 7'b0000110; // numero 33
				6'b100010: displayu = 7'b1001100; // numero 34
				6'b100011: displayu = 7'b0100100; // numero 35
				6'b100100: displayu = 7'b0100000; // numero 36
				6'b100101: displayu = 7'b0001111; // numero 37
				6'b100110: displayu = 7'b0000000; // numero 38
				6'b100111: displayu = 7'b0000100; // numero 39
				6'b101000: displayu = 7'b0000001; // numero 40
				default: displayu = 7'b0110000; // amostra a letra E - caso de erro
			endcase
		else
			displayu = 7'b1111111; //desliga o display
	end	
always @(*) //display de dezenas
	begin
		if (enable==1'b1) //liga o display com nível baixo
			case(hand)
				6'b000000: displayd = 7'b0000001; // numero 0
				6'b000001: displayd = 7'b0000001; // numero 1
				6'b000010: displayd = 7'b0000001; // numero 2
				6'b000011: displayd = 7'b0000001; // numero 3
				6'b000100: displayd = 7'b0000001; // numero 4
				6'b000101: displayd = 7'b0000001; // numero 5
				6'b000110: displayd = 7'b0000001; // numero 6
				6'b000111: displayd = 7'b0000001; // numero 7
				6'b001000: displayd = 7'b0000001; // numero 8
				6'b001001: displayd = 7'b0000001; // numero 9
				6'b001010: displayd = 7'b1001111; // numero 10
				6'b001011: displayd = 7'b1001111; // numero 11
				6'b001100: displayd = 7'b1001111; // numero 12
				6'b001101: displayd = 7'b1001111; // numero 13
				6'b001110: displayd = 7'b1001111; // numero 14
				6'b001111: displayd = 7'b1001111; // numero 15
				6'b010000: displayd = 7'b1001111; // numero 16
				6'b010001: displayd = 7'b1001111; // numero 17
				6'b010010: displayd = 7'b1001111; // numero 18
				6'b010011: displayd = 7'b1001111; // numero 19
				6'b010100: displayd = 7'b0010010; // numero 20
				6'b010101: displayd = 7'b0010010; // numero 21
				6'b010110: displayd = 7'b0010010; // numero 22
				6'b010111: displayd = 7'b0010010; // numero 23
				6'b011000: displayd = 7'b0010010; // numero 24
				6'b011001: displayd = 7'b0010010; // numero 25
				6'b011010: displayd = 7'b0010010; // numero 26
				6'b011011: displayd = 7'b0010010; // numero 27
				6'b011100: displayd = 7'b0010010; // numero 28
				6'b011101: displayd = 7'b0010010; // numero 29
				6'b011110: displayd = 7'b0000110; // numero 30
				6'b011111: displayd = 7'b0000110; // numero 31
				6'b100000: displayd = 7'b0000110; // numero 32
				6'b100001: displayd = 7'b0000110; // numero 33
				6'b100010: displayd = 7'b0000110; // numero 34
				6'b100011: displayd = 7'b0000110; // numero 35
				6'b100100: displayd = 7'b0000110; // numero 36
				6'b100101: displayd = 7'b0000110; // numero 37
				6'b100110: displayd = 7'b0000110; // numero 38
				6'b100111: displayd = 7'b0000110; // numero 39
				6'b101000: displayd = 7'b1001100; // numero 40
				default: displayd = 7'b0110000; // amostra a letra E - caso de erro
			endcase

		else
			displayd = 7'b1111111; //desliga o display
	end
endmodule