`timescale 1ns/1ps

module tb_decoder_2to4;

    reg Enable;
    reg A;
    reg B;

    wire [3:0] Y;

    // Instantiate the decoder
    decoder_2to4 uut (
        .Enable(Enable),
        .A(A),
        .B(B),
        .Y(Y)
    );

    // Generate waveform
    initial begin
        $dumpfile("decoder_2to4.vcd");
        $dumpvars(0, tb_decoder_2to4);
    end

    // Test all input combinations
    initial begin

        $monitor(
            "Time = %0t | Enable = %b | A = %b | B = %b | Y = %b",
            $time, Enable, A, B, Y
        );

        // Decoder disabled
        Enable = 0;
        A = 0;
        B = 0;
        #10;

        // Enable decoder
        Enable = 1;

        A = 0;
        B = 0;
        #10;

        A = 0;
        B = 1;
        #10;

        A = 1;
        B = 0;
        #10;

        A = 1;
        B = 1;
        #10;

        // Disable decoder
        Enable = 0;
        #10;

        $finish;
    end

endmodule