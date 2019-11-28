// Made by: Erick

module BlackJackController
(
    input i_Clk,        // entrada do clock

    // Inputs físicos
    input i_Reset,              // entrada do botão de reset (Posedge)
    input i_Stay,               // entrada do botão de stay (Posedge)
    input i_Hit,                // entrada do botão de hit (Posedge)
    
    //  Outputs to leds
    output reg o_Win,           // saída indicando vitória
    output reg o_Lose,          // saída indicando derrota
    output reg o_Tie,           // saída indicando empate
    output reg o_Hit_P,         // saída que indica se o player deu hit
    output reg o_Hit_D,         // saída que indica se o dealer deu hit
    output reg o_Stay_P,        // saída que indica se o player deu stay
    output reg o_Stay_D,        // saída que indica se o dealer deu stay
    
    // Saídas indicando se deve-se mostrar a mão do player/dealer
    output reg o_ShwHnd_P,
    output reg o_ShwHnd_D,
    
    // Variáveis de controle do contador
    input vi_TwoSec,            // indica se passaram 2 segundos
    input vi_RstOK,             // indica se o contador foi zerado com sucesso
    output reg vo_ActCounter,   // sinal para ativar o contador
    output reg vo_RstCounter,   // sinal para zerar o contador

    // Variáveis de controle do embaralhador
    input vi_Shuffled,          // indica se o baralho está embaralhado
    output reg vo_ActShuffler,  // sinal para ativar o embaralhador

    // Variáveis de controle do adicionador de cartas
    input vi_CardOK,            // indica que carta foi adicionada a mão do player/dealer
    input [5:0] vi_HandP,       // indica o conteúdo da mão do player
    input [5:0] vi_HandD,       // indica o conteúdo da mão do dealer
    output reg vo_Card2Player,  // indica que deve ser adicionada carta para o player
    output reg vo_Card2Dealer   // indica que deve ser adicionada carta para o dealer
);

reg vc_HitPlayer;   // Indica se o jogador deu hit em algum momento do jogo

reg vc_FirstTurn;   // Indica se estamos no primeiro turno (1) ou no segundo (0)

// State register
reg [4:0] A_State, F_State;

// Código de cada estado
parameter   Start           = 5'b 00000, // estado 0
            ShuffleDeck     = 5'b 00001, // estado 1
            PlayerWith1Card = 5'b 00010, // estado 2
            DealerWith1Card = 5'b 00011, // estado 3
            PlayerWith2Card = 5'b 00100, // estado 4
            DealerWith2Card = 5'b 00101, // estado 5
            PlayerTurn      = 5'b 00110, // estado 6
            DealerTurn      = 5'b 00111, // estado 7
            PlayerHit       = 5'b 01000, // estado 8
            DealerHit       = 5'b 01001, // estado 9
            PlayerStay      = 5'b 01010, // estado 10
            DealerStay      = 5'b 01011, // estado 11
            CardToPlayer    = 5'b 01100, // estado 12
            CardToDealer    = 5'b 01101, // estado 13
            WinState        = 5'b 01110, // estado 14
            TieState        = 5'b 01111, // estado 15
            LoseState       = 5'b 10000, // estado 16
            Measurement     = 5'b 10001, // estado 17
            DealerBlackJack = 5'b 10010; // estado 18


// Clocked block
always @(posedge i_Clk)
begin
    if(i_Reset)
    begin
        A_State <= Start;
        vc_HitPlayer <= 0;
        vc_FirstTurn <= 1;
    end

    else
    begin
        A_State <= F_State;

        if(F_State == DealerTurn)
            vc_FirstTurn <= 0;

        if(F_State == PlayerHit)
            vc_HitPlayer <= 1;
    end
end

/* Decodificador de próximo estado Indica as transições entre estados (as setas
da FSM) */
always @(*)
begin
    case (A_State)
        Start :
            if(i_Reset)
                F_State = Start;
            else
                F_State = ShuffleDeck;

        ShuffleDeck :
            if(!vi_Shuffled)
                F_State = ShuffleDeck;
            else
                F_State = PlayerWith1Card;

        PlayerWith1Card :
            if(!vi_CardOK)
                F_State = PlayerWith1Card;
            else
                F_State = DealerWith1Card;

        DealerWith1Card :
            if(!vi_CardOK)
                F_State = DealerWith1Card;
            else
                F_State = PlayerWith2Card;

        PlayerWith2Card :
            if(!vi_CardOK)
                F_State = PlayerWith2Card;
            else
                F_State = DealerWith2Card;

        DealerWith2Card :
            if(!vi_CardOK)
                F_State = DealerWith2Card;
            else
                F_State = PlayerTurn;

        PlayerTurn :
            if (!vi_RstOK)
                F_State = PlayerTurn;
            else if(i_Hit) // uma das bordas de mudança do botão (posedge or negedge)
                F_State = CardToPlayer;
            else if (i_Stay)
                F_State = PlayerStay;
            else
                F_State = PlayerTurn;

        DealerTurn :
            if (!vi_RstOK)
                F_State = DealerTurn;
            else if(vi_HandD <= 16)
                F_State = CardToDealer;
            else
                F_State = DealerStay;

        PlayerHit :
            if(!vi_TwoSec)
                F_State = PlayerHit;
            else if (vi_HandP <= 21)
                F_State = PlayerTurn;
            else
                F_State = LoseState;

        DealerHit :
            if(!vi_TwoSec)
                F_State = DealerHit;
            else if (vi_HandD <= 21)
                F_State = DealerTurn;
            else
                F_State = WinState;

        PlayerStay :
            if(!vi_TwoSec)
                F_State = PlayerStay;
            else if (!vc_FirstTurn)
                F_State = Measurement;
            else if (vi_HandD == 21)
                F_State = DealerBlackJack;
            else
                F_State = DealerTurn;

        DealerStay :
            if(!vi_TwoSec)
                F_State = DealerStay;
            else if (vc_HitPlayer || vi_HandP < 21)
                F_State = PlayerTurn;
            else if (vi_HandP == 21)
                F_State = WinState;

        CardToPlayer :
            if(vi_CardOK)
                F_State = PlayerHit;
            else
                F_State = CardToPlayer;

        CardToDealer :
            if(vi_CardOK)
                F_State = DealerHit;
            else
                F_State = CardToDealer;

        WinState :
            if(i_Reset)
                F_State = Start;
            else
                F_State = WinState;

        TieState :
            if(i_Reset)
                F_State = Start;
            else
                F_State = TieState;

        LoseState :
            if(i_Reset)
                F_State = Start;
            else
                F_State = LoseState;

        Measurement :
            if(vi_HandP == vi_HandD)
                F_State = TieState;
            else if (vi_HandP < vi_HandD)
                F_State = LoseState;
            else
                F_State = WinState;

        DealerBlackJack :
            if(vc_HitPlayer)
                F_State = LoseState;
            else if (vi_HandP == vi_HandD)
                F_State = TieState;

        // default :
        //     F_State = Start;
    endcase
end

/* Decodificador de saída da máquina de estados, ela indica o que está dentro
dos estados na FSM, ou seja, depende apenas do estado (máquina de Moore)*/

always @(*)
begin
    // Valores de Saída padrões:
    o_Win = 0;
    o_Lose = 0;
    o_Tie = 0;
    o_Hit_P = 0;
    o_Hit_D = 0;
    o_Stay_P = 0;
    o_Stay_D = 0;
    o_ShwHnd_P = 1;
    o_ShwHnd_D = 0;

    // Saídas para módulos internos
    vo_ActCounter = 0;
    vo_RstCounter = 0;
    vo_Card2Player = 0;
    vo_Card2Dealer = 0;
    vo_ActShuffler = 0;

    // Saídas vinculadas a estados
    case (A_State)        
        // Start : Bloco com clock

        ShuffleDeck :
            vo_ActShuffler = 1;

        PlayerWith1Card :
            vo_Card2Player = 1;

        DealerWith1Card :
            vo_Card2Dealer = 1;

        PlayerWith2Card :
            vo_Card2Player = 1;

        DealerWith2Card :
            vo_Card2Dealer = 1;

        PlayerTurn :
            vo_RstCounter = 1;

        DealerTurn :
            vo_RstCounter = 1;

        PlayerHit :
            begin
                o_Hit_P = 1;
                vo_ActCounter = 1;
                // vc_HitPlayer = 1; Bloco com clk
            end

        DealerHit :
            begin
                o_Hit_D = 1;
                vo_ActCounter = 1;
            end

        PlayerStay :
            begin
                o_Stay_P = 1;
                vo_ActCounter = 1;
            end

        DealerStay :
            begin
                o_Stay_D = 1;
                vo_ActCounter = 1;
            end

        CardToPlayer :
            vo_Card2Player = 1;

        CardToDealer :
            vo_Card2Dealer = 1;

        WinState :
            begin
                o_Win = 1;
                o_ShwHnd_D = 1;
            end

        TieState :
            begin
                o_Tie = 1;
                o_ShwHnd_D = 1;
            end

        LoseState :
            begin
                o_Lose = 1;
                o_ShwHnd_D = 1;
            end
        // Measurement : Não tem saídas vinculadas
        // DealerBlackJack : Não tem saídas vinculadas
    endcase
end

endmodule // BlackJackController
