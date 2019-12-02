`timescale 1ns/1ns

module TB_Debouncer;

    parameter WIDTH = 12;

    // DUV input ports
    reg	clk;
    reg	RstCounter;     // Ativa em alto
    reg ActCounter;     // Ativa em alto
    reg Reset;          // Ativa em baixo

    // DUV output ports
    wire [WIDTH-1:0] o_Counter;
    wire TwoSec;
    wire RstOK;

    // Variáveis de teste
    reg [WIDTH-1:0] r_Contador;
    integer i;

    // Instanciação do debouncer
    wire ResetDeb, ResetNE, ResetPE;

    Debouncer ResetButton
    (
        .i_Clk(clk),
        .i_Button(Reset),
        .o_ButtonDeb(ResetDeb),
        .o_ButtonDown(ResetNE),
        .o_ButtonUp(ResetPE) 
    );

    // Instanciação do contador
    Counter #(.WIDTH(WIDTH)) DUV 
    (
        .clk_2K(clk),
        .i_ActCounter(ActCounter),
        .i_RstCounter(RstCounter),
        .i_ResetNeg(ResetNE),
        .i_ResetDeb(ResetDeb),
        .o_Count(o_Counter),
        .o_TwoSec(TwoSec),
        .o_RstOK(RstOK)
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
        
        #20 PlayerReset(1);
        #100 PlayerReset(2);
        #100 PlayerReset(3);
        #100 PlayerReset(4);
        #100 PlayerReset(5);
        #200 TwoSecAct;
        #100 TwoSecAct;
        // #5000
        $stop;
    end

    initial
    begin
        #200000 $display("Tempo máximo excedido!! Erro em algum lugar!");
        $stop;
    end

    task TwoSecAct;
        begin
            $display("%g - A funcao TwoSecond esta sendo testada:", $time);

            // Zerar o contador
            @(posedge clk) RstCounter = 0;
            
            while (RstOK == 0)
                @(posedge clk) RstCounter = 1;

            $display("%g - Contador resetado com sucesso!", $time);

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
                $display("%g - A funcao TwoSecond esta funcionando corretamente", $time);
            else
                $display("%g - A funcao TwoSecond não esta funcionando corretamente", $time);
            @(posedge clk); // Pulso de clock para zerar o ActCounter
            ActCounter = 0;
        end
    endtask

    task PlayerReset;
        input integer seed;

        begin
            // Testar um input randomico de reset
            $display("%g - O contador esta sendo testado com relacao ao reset", $time);

            // Inicizalizar o contador de checagem
            @(posedge clk) Reset = 0;
            @(posedge clk);
            @(posedge clk);
            @(posedge clk);
            @(negedge clk) r_Contador = o_Counter;

            i = $urandom(seed) % 4000;
            
            RstCounter = 0;
            ActCounter = 0;

            repeat(i)
            begin
                @(posedge clk)
                r_Contador = r_Contador + 1;
            end

            // Verifica se a saída está como o esperado
            @(posedge clk);
            if (r_Contador == o_Counter)
                $display("%g - O contador, quando ativo no reset, esta funcionando corretamente e contou ate %d", $time, o_Counter);
            else
                $display("%g - O contador, quando ativo no reset, nao esta funcionando corretamente:\n ContadorTB:%d\nContador:%d", $time,r_Contador, o_Counter);
            
            @(posedge clk) Reset = 1;
        end
    endtask

endmodule
