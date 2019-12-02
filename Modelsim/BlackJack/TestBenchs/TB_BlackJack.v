`timescale 1ns/1ns

module TB_BlackJack;

// Clock
reg clk, clk_PLL;

// Botões
reg	ResetBtn, StayBtn, HitBtn;

// Fios de saída de fim de jogo
wire o_Win, o_Lose, o_Tie;

// Fios de saída dos leds de Hit e Stay
wire o_Hit_P, o_Hit_D, o_Stay_P, o_Stay_D;

// Fios de saída para o display
wire [0:6] DealerHndDisplayD, DealerHndDisplayU;
wire [0:6] PlayerHndDisplayD, PlayerHndDisplayU;

// Estados dos botões
wire w_ResetDeb, w_StayDeb, w_HitDeb;

// Borda de descida do botão de Stay e de hit
wire w_StayNE, w_HitNE;

// Estados da máquina de estados global:
reg [8*15:0] StateStringGlobal;
wire [4:0] StateFSMGlobal;

// Estados da máquina de estados do embaralhador:
reg [8*15:0] StateStringShuffler;
wire [3:0] StateFSMShuffler;

// Estados da máquina de estados do adicionador de cartas
reg [8*15:0] StateStringCardAdder;
wire [3:0] StateFSMCardAdder;


BlackJack DUV
(
    .inclk0(clk) ,	// input  inclk0_sig
    .i_Reset(ResetBtn) ,	// input  i_Reset_sig
    .i_Stay(StayBtn) ,	// input  i_Stay_sig
    .i_Hit(HitBtn) ,	// input  i_Hit_sig
    .o_Win(o_Win) ,	// output  o_Win_sig
    .o_Lose(o_Lose) ,	// output  o_Lose_sig
    .o_Tie(o_Tie) ,	// output  o_Tie
    .o_Hit_P(o_Hit_P) ,	// output  o_Hit_P
    .o_Hit_D(o_Hit_D) ,	// output  o_Hit_D
    .o_Stay_P(o_Stay_P) ,	// output  o_Stay_P
    .o_Stay_D(o_Stay_D) ,	// output  o_Stay_D
    .DealerHndDisplayU(DealerHndDisplayU) ,	// output [0:6] DealerHndDisplayU
    .DealerHndDisplayD(DealerHndDisplayD) ,	// output [0:6] DealerHndDisplayD
    .PlayerHndDisplayU(PlayerHndDisplayU) ,	// output [0:6] PlayerHndDisplayU
    .PlayerHndDisplayD(PlayerHndDisplayD) ,	// output [0:6] PlayerHndDisplayD
    .w_ResetDeb(w_ResetDeb) ,	// output  w_ResetDeb
    .w_HitDeb(w_HitDeb) ,	// output  w_HitDeb
    .w_HitNE(w_HitNE) ,	// output  w_HitNE
    .w_StayDeb(w_StayDeb) ,	// output  w_StayDeb
    .w_StayNE(w_StayNE) 	// output  w_StayNE
);

// Clocks always

// Clock de 50 MHz
always #5 clk = !clk;

// Clock de 2 kHz
always #10 clk_PLL <= ~clk_PLL;	

assign DUV.clk_PLL = clk_PLL;


// Teste do reset e do contador
initial
begin
    clk = 0;
    clk_PLL = 1'b0;
    HitBtn = 1;
    StayBtn = 1;
    ResetBtn = 1;

    $monitor("%g -> O controlador geral esta no estado %s\n%g - O Shuffler esta no estado: %s\n%g - O CardAdder geral esta no estado: %s",$time , StateStringGlobal,$time, StateStringShuffler, $time, StateStringCardAdder);
    
    PlayerReset(0);
    #100 PlayerReset(1);

    # 100000 $stop;
end



// Acessando os estados da FSM global:
assign StateFSMGlobal = DUV.b2v_FSM_Global.A_State;

always @(*)
begin
    case (StateFSMGlobal)
        5'b 00000 : StateStringGlobal = "Start";
        5'b 00001 : StateStringGlobal = "ShuffleDeck";
        5'b 00010 : StateStringGlobal = "PlayerWith1Card";
        5'b 00011 : StateStringGlobal = "D1_RstCardFSM";
        5'b 00100 : StateStringGlobal = "DealerWith1Card";
        5'b 00101 : StateStringGlobal = "P_RstCardFSM";
        5'b 00110 : StateStringGlobal = "PlayerWith2Card";
        5'b 00111 : StateStringGlobal = "D2_RstCardFSM";
        5'b 01000 : StateStringGlobal = "DealerWith2Card";
        5'b 01001 : StateStringGlobal = "PlayerTurn";
        5'b 01010 : StateStringGlobal = "DealerTurn";
        5'b 01011 : StateStringGlobal = "PlayerHit";
        5'b 01100 : StateStringGlobal = "DealerHit";
        5'b 01101 : StateStringGlobal = "PlayerStay";
        5'b 01110 : StateStringGlobal = "DealerStay";
        5'b 01111 : StateStringGlobal = "CardToPlayer";
        5'b 10000 : StateStringGlobal = "CardToDealer";
        5'b 10001 : StateStringGlobal = "WinState";
        5'b 10010 : StateStringGlobal = "TieState";
        5'b 10011 : StateStringGlobal = "LoseState";
        5'b 10100 : StateStringGlobal = "Measurement";
        5'b 10101 : StateStringGlobal = "DealerBlackJack";
    endcase
end

// Acessando os estados da FSM do embaralhador:
assign StateFSMShuffler = DUV.b2v_FSM_Embaralhador.A_State;

always @(*)
begin
    case (StateFSMShuffler)
        4'b 0000:  StateStringShuffler = "Start";
        4'b 0001:  StateStringShuffler = "InitOutputs";
        4'b 0010:  StateStringShuffler = "I_ReadMemOut";
        4'b 0011:  StateStringShuffler = "I_StoreMemOut";
        4'b 0100:  StateStringShuffler = "GetNxtAddr";
        4'b 0101:  StateStringShuffler = "J_ReadMemOut";
        4'b 0110:  StateStringShuffler = "J_StoreMemOut";
        4'b 0111:  StateStringShuffler = "J_WriteMemAddr";
        4'b 1000:  StateStringShuffler = "ChangeAddr";
        4'b 1001:  StateStringShuffler = "I_WriteMemAddr";
        4'b 1010:  StateStringShuffler = "IfState";
        4'b 1011:  StateStringShuffler = "IncreaseAddr";
        4'b 1100:  StateStringShuffler = "Shuffled";
    endcase
end

// Acessando os estados da FSM do adicionador de cartas
assign StateFSMCardAdder = DUV.b2v_FSM_CardAdder.A_State;

always @(*)
begin
    case (StateFSMCardAdder)
        4'b 0000 : StateStringCardAdder = "Start";
        4'b 0001 : StateStringCardAdder = "Wait_FSM";
        4'b 0010 : StateStringCardAdder = "ReadMem";
        4'b 0011 : StateStringCardAdder = "Value2Dealer";
        4'b 0100 : StateStringCardAdder = "Value2Player";
        4'b 0101 : StateStringCardAdder = "DealerWithAce";
        4'b 0110 : StateStringCardAdder = "DealerWithFace";
        4'b 0111 : StateStringCardAdder = "PlayerWithAce";
        4'b 1000 : StateStringCardAdder = "PlayerWithFace";
        4'b 1001 : StateStringCardAdder = "PlusTenDealer";
        4'b 1010 : StateStringCardAdder = "PlusTenPlayer";
        4'b 1011 : StateStringCardAdder = "CardOK";
    endcase
end

// Task para simular um reset do player e verificar se o contador está
// funcionando corretamente

integer seed, i;
reg [11:0] r_Contador;


task PlayerReset;
    input seed;

    begin
        // Testar um input randomico de reset
        $display("%g - O contador esta sendo testado com relacao ao reset", $time);

        // Inicizalizar o contador de checagem
        @(posedge clk_PLL) ResetBtn = 0;
        @(posedge clk_PLL);
        @(posedge clk_PLL);
        @(posedge clk_PLL);
        @(negedge clk_PLL) r_Contador = DUV.b2v_Contador.o_Count;

        i = $urandom(seed) % 4000;

        repeat(i)
        begin
            @(posedge clk_PLL)
            r_Contador = r_Contador + 1;
        end

        ResetBtn = 1;

        // Verifica se a saída está como o esperado
        @(posedge clk_PLL);
        if (r_Contador == DUV.b2v_Contador.o_Count)
            $display("%g - O contador, quando ativo no reset, esta funcionando corretamente e contou ate %d", $time, DUV.b2v_Contador.o_Count);
        else
            $display("%g - O contador, quando ativo no reset, nao esta funcionando corretamente:\n ContadorTB:%d\nContador:%d", $time,r_Contador, DUV.b2v_Contador.o_Count);
        
    end
endtask

endmodule // TB_BlackJack