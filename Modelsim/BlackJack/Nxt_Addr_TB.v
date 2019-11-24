`timescale 1ns/1ns

module Nxt_Addr_TB;

    parameter WIDTH = 12;

    // Counter DUV input ports
    reg	clock_2kHz;
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
    reg [WIDTH-1:0] a; // Random number

    Counter #(.WIDTH(WIDTH)) C_DUV 
        (
            .clk_2K(clock_2kHz),
            .i_RstCounter(RstCounter),
            .i_ActCounter(ActCounter),
            .i_Reset(Reset),
            .o_Count(o_Counter),
            .o_TwoSec(TwoSec)
        );

    Nxt_Addr NA_DUV
        (
            .Addr_i(Addr_i),
            .Count(o_Counter),
            .Addr_j(Addr_j)
        );

    always #5 clock_2kHz = !clock_2kHz;

    initial
    begin
        // Iniciar as variáveis
        clock_2kHz = 0;
        RstCounter = 0;
        ActCounter = 0;
        Reset = 1;
        Addr_i = 0;

        // Resetar o contador
        #5 RstCounter = 1;
        #5 RstCounter = 0;
        #200 test_Counter;
        #100 test_Nxt_Addr;
	    #50 test_Counter;
	    #50 test_Nxt_Addr;
        #5000
        $stop;
    end

    initial
    begin
        #200000 $display("Tempo máximo excedido!! Erro em algum lugar!");
        $stop;
    end

    task test_TwoSec;
        begin
            $display("%g - A função TwoSecond está sendo testada\n", $time);

            // Zerar o contador
            RstCounter = 1;
            #5 RstCounter = 0;

            // Contar até 4095
            repeat(2**(WIDTH))
            begin
                @(posedge clock_2kHz);
                ActCounter = 1;
                RstCounter = 0;
                Reset = 1;
            end

            // Verificar se a a saída está como o esperado
            @(posedge clock_2kHz); // Pulso de clock para estabilizar a saída
            if (TwoSec)
                $display("%g - A função TwoSecond está funcionando corretamente\n", $time);
            else
                $display("%g - A função TwoSecond não está funcionando corretamente\n", $time);
            @(posedge clock_2kHz); // Pulso de clock para zerar o ActCounter
            ActCounter = 0;
        end
    endtask

    task test_Counter;
        begin
            $display("%g - O contador está sendo testado com relação ao reset\n", $time);

            // Inicizalizar o contador de checagem
            r_Contador = o_Counter;

            // Testar um input randomico de reset
            a = $random;

            repeat(a)
            begin
                @(negedge clock_2kHz)
                Reset = 0;
                RstCounter = 0;
                ActCounter = 0;
                @(posedge clock_2kHz);
                r_Contador = r_Contador + 1;
            end

            // Verifica se a saída está como o esperado
            @(posedge clock_2kHz);
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

            @(negedge clock_2kHz);
            c = 0;
            Addr_i = 0;
            #1 First_Addr_j <= Addr_j;

            repeat(52)
            begin
                $display("%g > Addr_i = %d | Addr_j = %d", $time, Addr_i, Addr_j);

                @(negedge clock_2kHz);
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
