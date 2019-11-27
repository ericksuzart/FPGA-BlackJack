`timescale 1ns/1ns

module Nxt_Addr_TB;

    parameter WIDTH = 12;

    // Counter DUV input ports
    reg	clk;
    reg	RstCounter;     // Ativa em alto
    reg ActCounter;     // Ativa em alto
    reg Reset;          // Ativa em baixo

    // Counter DUV output ports
    wire [WIDTH-1:0] o_Counter;
    wire TwoSec;

    // Variáveis de teste do Counter DUV
    reg [WIDTH-1:0] r_Contador;

    // Nxt_Addr DUV input ports
    reg [5:0] Addr_i;

    // Nxt_Addr DUV output ports
    wire [5:0] Addr_j;

    // Variáveis de teste do Nxt_Addr DUV
    // reg [6*52-1:0] out_Addr_j;
    reg [5:0] First_Addr_j;
    reg [5:0] Second_Addr_j;
    reg seed; // Random number

    Counter #(.WIDTH(WIDTH)) C_DUV 
        (
            .clk_2K(clk),
            .i_RstCounter(RstCounter),
            .i_ActCounter(ActCounter),
            .i_Reset(Reset),
            .o_Count(o_Counter),
            .o_TwoSec(TwoSec)
        );

    Nxt_Addr NA_DUV
        (
            .a_i(Addr_i),
            .cnt(o_Counter),
            .a_j(Addr_j)
        );

    always #5 clk = !clk;

    initial
    begin
        // Iniciar as variáveis
        clk = 0;
        RstCounter = 0;
        ActCounter = 0;
        Reset = 1;
        Addr_i = 0;

        // Resetar o contador
        #5 RstCounter = 1;
        #5 RstCounter = 0;
        #200 PlayerReset;
        #100 test_Nxt_Addr;
	    #50 PlayerReset;
	    #50 test_Nxt_Addr;
        #5000
        $stop;
    end

    initial
    begin
        #200000 $display("Tempo máximo excedido!! Erro em algum lugar!");
        $stop;
    end

    task TwoSecAct;
        begin
            $display("%g - A função TwoSecond está sendo testada\n", $time);

            // Zerar o contador
            @(posedge clk) RstCounter = 1;
            @(posedge clk) RstCounter = 0;

            // Contar até 4095
            repeat(2**(WIDTH))
            begin
                @(posedge clk);
                ActCounter = 1;
                RstCounter = 0;
                Reset = 1;
            end

            // Verificar se a a saída está como o esperado
            @(posedge clk); // Pulso de clock para estabilizar a saída
            if (TwoSec)
                $display("%g - A função TwoSecond está funcionando corretamente\n", $time);
            else
                $display("%g - A função TwoSecond não está funcionando corretamente\n", $time);
            @(posedge clk); // Pulso de clock para zerar o ActCounter
            ActCounter = 0;
        end
    endtask

    task PlayerReset;
        begin
            $display("%g - O contador está sendo testado com relação ao reset\n", $time);

            // Inicizalizar o contador de checagem
            Reset = 0;
            @(posedge clk);
            @(negedge clk) r_Contador = o_Counter;

            // Testar um input randomico de reset
            repeat($urandom%5000)
            begin
                @(posedge clk)
                RstCounter = 0;
                ActCounter = 0;
                r_Contador = r_Contador + 1;
            end


            // Verifica se a saída está como o esperado
            @(posedge clk);
            if (r_Contador == o_Counter)
                $display("%g - O contador, quando ativo no reset, está funcionando corretamente\n", $time);
            else
                $display("%g - O contador, quando ativo no reset, não está funcionando corretamente\n", $time);
            Reset = 1;
        end
    endtask

    task test_Nxt_Addr;
        integer c;
        begin
            $display("%g > Testando o módulo NxtAddr.", $time);

            @(negedge clk);
            c = 0;
            Addr_i = 0;
            #1 First_Addr_j <= Addr_j;

            repeat(52)
            begin
                $display("%g > Addr_i = %d | Addr_j = %d", $time, Addr_i, Addr_j);

                @(negedge clk);
                Addr_i <= Addr_i + 1;
                First_Addr_j <= Addr_j;
                #1 Second_Addr_j <= Addr_j;

                #2 if (Addr_i != 52 && Second_Addr_j == First_Addr_j)
                    begin
                        c = c + 1;
                        $display("%g > Má performace! O endereço J está se repetindo!!", $time);
                    end
            end

            if (!c)
                $display("%g > O teste foi um sucesso!", $time);
        end
    endtask

endmodule
