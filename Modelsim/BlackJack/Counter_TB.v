`timescale 1ns/1ns

module Counter_TB;

    parameter WIDTH = 12;

    // DUV input ports
    reg	clk;
    reg	RstCounter;     // Ativa em alto
    reg ActCounter;     // Ativa em alto
    reg Reset;          // Ativa em baixo

    // DUV output ports
    wire [WIDTH-1:0] o_Counter;
    wire TwoSec;

    // Variáveis de teste
    reg [WIDTH-1:0] r_Contador;

    Counter #(.WIDTH(WIDTH)) DUV 
        (
            .clk_2K(clk),
            .i_RstCounter(RstCounter),
            .i_ActCounter(ActCounter),
            .i_Reset(Reset),
            .o_Count(o_Counter),
            .o_TwoSec(TwoSec)
        );

    always #5 clk = !clk;

    initial
    begin
        clk = 0;
        RstCounter = 0;
        ActCounter = 0;
        Reset = 1;
        // #5 RstCounter = 1;
        // @(posedge clk) RstCounter = 0;
        
        #20 PlayerReset;
        #200 TwoSecAct;
        // #100 PlayerReset;
        // #100 TwoSecAct;
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
            repeat($urandom%4500)
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

endmodule
