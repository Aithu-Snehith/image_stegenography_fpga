// #### This file is auto-generated from icosoc.py. Do not edit! ####

// ++ 10-header ++

module testbench;

    reg clk = 1;
    always #5 clk = ~clk;

// ++ 20-ionets ++
    wire C16;
    wire CLKIN;
    wire HRAM_CK;
    wire LED1;
    wire LED2;
    wire LED3;
    wire RASPI_11;
    wire RASPI_12;
    wire RASPI_15;
    wire RASPI_16;
    wire RASPI_19;
    wire RASPI_21;
    wire RASPI_26;
    wire RASPI_35;
    wire RASPI_36;
    wire RASPI_38;
    wire RASPI_40;
    wire SPI_FLASH_CS;
    wire SPI_FLASH_MISO;
    wire SPI_FLASH_MOSI;
    wire SPI_FLASH_SCLK;
    wire SRAM_A0;
    wire SRAM_A1;
    wire SRAM_A10;
    wire SRAM_A11;
    wire SRAM_A12;
    wire SRAM_A13;
    wire SRAM_A14;
    wire SRAM_A15;
    wire SRAM_A2;
    wire SRAM_A3;
    wire SRAM_A4;
    wire SRAM_A5;
    wire SRAM_A6;
    wire SRAM_A7;
    wire SRAM_A8;
    wire SRAM_A9;
    wire SRAM_CE;
    wire SRAM_D0;
    wire SRAM_D1;
    wire SRAM_D10;
    wire SRAM_D11;
    wire SRAM_D12;
    wire SRAM_D13;
    wire SRAM_D14;
    wire SRAM_D15;
    wire SRAM_D2;
    wire SRAM_D3;
    wire SRAM_D4;
    wire SRAM_D5;
    wire SRAM_D6;
    wire SRAM_D7;
    wire SRAM_D8;
    wire SRAM_D9;
    wire SRAM_LB;
    wire SRAM_OE;
    wire SRAM_UB;
    wire SRAM_WE;
    wire pmod1_1;
    wire pmod1_10;
    wire pmod1_2;
    wire pmod1_3;
    wire pmod1_4;
    wire pmod1_7;
    wire pmod1_8;
    wire pmod1_9;
    wire pmod2_1;
    wire pmod2_10;
    wire pmod2_2;
    wire pmod2_3;
    wire pmod2_4;
    wire pmod2_7;
    wire pmod2_8;
    wire pmod2_9;
    wire pmod3_2;
    wire pmod3_3;
    wire pmod4_1;
    wire pmod4_2;
    wire pmod4_3;
    wire pmod4_4;

// ++ 30-inst ++
    icosoc uut (
        .C16(C16),
        .CLKIN(CLKIN),
        .HRAM_CK(HRAM_CK),
        .LED1(LED1),
        .LED2(LED2),
        .LED3(LED3),
        .RASPI_11(RASPI_11),
        .RASPI_12(RASPI_12),
        .RASPI_15(RASPI_15),
        .RASPI_16(RASPI_16),
        .RASPI_19(RASPI_19),
        .RASPI_21(RASPI_21),
        .RASPI_26(RASPI_26),
        .RASPI_35(RASPI_35),
        .RASPI_36(RASPI_36),
        .RASPI_38(RASPI_38),
        .RASPI_40(RASPI_40),
        .SPI_FLASH_CS(SPI_FLASH_CS),
        .SPI_FLASH_MISO(SPI_FLASH_MISO),
        .SPI_FLASH_MOSI(SPI_FLASH_MOSI),
        .SPI_FLASH_SCLK(SPI_FLASH_SCLK),
        .SRAM_A0(SRAM_A0),
        .SRAM_A1(SRAM_A1),
        .SRAM_A10(SRAM_A10),
        .SRAM_A11(SRAM_A11),
        .SRAM_A12(SRAM_A12),
        .SRAM_A13(SRAM_A13),
        .SRAM_A14(SRAM_A14),
        .SRAM_A15(SRAM_A15),
        .SRAM_A2(SRAM_A2),
        .SRAM_A3(SRAM_A3),
        .SRAM_A4(SRAM_A4),
        .SRAM_A5(SRAM_A5),
        .SRAM_A6(SRAM_A6),
        .SRAM_A7(SRAM_A7),
        .SRAM_A8(SRAM_A8),
        .SRAM_A9(SRAM_A9),
        .SRAM_CE(SRAM_CE),
        .SRAM_D0(SRAM_D0),
        .SRAM_D1(SRAM_D1),
        .SRAM_D10(SRAM_D10),
        .SRAM_D11(SRAM_D11),
        .SRAM_D12(SRAM_D12),
        .SRAM_D13(SRAM_D13),
        .SRAM_D14(SRAM_D14),
        .SRAM_D15(SRAM_D15),
        .SRAM_D2(SRAM_D2),
        .SRAM_D3(SRAM_D3),
        .SRAM_D4(SRAM_D4),
        .SRAM_D5(SRAM_D5),
        .SRAM_D6(SRAM_D6),
        .SRAM_D7(SRAM_D7),
        .SRAM_D8(SRAM_D8),
        .SRAM_D9(SRAM_D9),
        .SRAM_LB(SRAM_LB),
        .SRAM_OE(SRAM_OE),
        .SRAM_UB(SRAM_UB),
        .SRAM_WE(SRAM_WE),
        .pmod1_1(pmod1_1),
        .pmod1_10(pmod1_10),
        .pmod1_2(pmod1_2),
        .pmod1_3(pmod1_3),
        .pmod1_4(pmod1_4),
        .pmod1_7(pmod1_7),
        .pmod1_8(pmod1_8),
        .pmod1_9(pmod1_9),
        .pmod2_1(pmod2_1),
        .pmod2_10(pmod2_10),
        .pmod2_2(pmod2_2),
        .pmod2_3(pmod2_3),
        .pmod2_4(pmod2_4),
        .pmod2_7(pmod2_7),
        .pmod2_8(pmod2_8),
        .pmod2_9(pmod2_9),
        .pmod3_2(pmod3_2),
        .pmod3_3(pmod3_3),
        .pmod4_1(pmod4_1),
        .pmod4_2(pmod4_2),
        .pmod4_3(pmod4_3),
        .pmod4_4(pmod4_4)
    );

    sim_sram sram (
        .SRAM_A0(SRAM_A0),
        .SRAM_A1(SRAM_A1),
        .SRAM_A10(SRAM_A10),
        .SRAM_A11(SRAM_A11),
        .SRAM_A12(SRAM_A12),
        .SRAM_A13(SRAM_A13),
        .SRAM_A14(SRAM_A14),
        .SRAM_A15(SRAM_A15),
        .SRAM_A2(SRAM_A2),
        .SRAM_A3(SRAM_A3),
        .SRAM_A4(SRAM_A4),
        .SRAM_A5(SRAM_A5),
        .SRAM_A6(SRAM_A6),
        .SRAM_A7(SRAM_A7),
        .SRAM_A8(SRAM_A8),
        .SRAM_A9(SRAM_A9),
        .SRAM_CE(SRAM_CE),
        .SRAM_D0(SRAM_D0),
        .SRAM_D1(SRAM_D1),
        .SRAM_D10(SRAM_D10),
        .SRAM_D11(SRAM_D11),
        .SRAM_D12(SRAM_D12),
        .SRAM_D13(SRAM_D13),
        .SRAM_D14(SRAM_D14),
        .SRAM_D15(SRAM_D15),
        .SRAM_D2(SRAM_D2),
        .SRAM_D3(SRAM_D3),
        .SRAM_D4(SRAM_D4),
        .SRAM_D5(SRAM_D5),
        .SRAM_D6(SRAM_D6),
        .SRAM_D7(SRAM_D7),
        .SRAM_D8(SRAM_D8),
        .SRAM_D9(SRAM_D9),
        .SRAM_LB(SRAM_LB),
        .SRAM_OE(SRAM_OE),
        .SRAM_UB(SRAM_UB),
        .SRAM_WE(SRAM_WE)
    );

    sim_spiflash spiflash (
        .SPI_FLASH_CS(SPI_FLASH_CS),
        .SPI_FLASH_MISO(SPI_FLASH_MISO),
        .SPI_FLASH_MOSI(SPI_FLASH_MOSI),
        .SPI_FLASH_SCLK(SPI_FLASH_SCLK)
    );

// ++ 90-footer ++

    assign CLKIN = clk;

    wire [8:0] raspi_din;
    reg [8:0] raspi_dout = 9'b z_zzzz_zzzz;
    reg raspi_clk = 0;
    reg raspi_dir = 0;

    assign {RASPI_11, RASPI_12, RASPI_15, RASPI_16, RASPI_19, RASPI_21, RASPI_26, RASPI_35, RASPI_36} = raspi_dout;
    assign raspi_din = {RASPI_11, RASPI_12, RASPI_15, RASPI_16, RASPI_19, RASPI_21, RASPI_26, RASPI_35, RASPI_36};
    assign RASPI_40 = raspi_clk, RASPI_38 = raspi_dir;

    task raspi_send_word(input [8:0] data);
        begin
            raspi_clk <= 0;
            raspi_dir <= 1;
            raspi_dout <= {1'b0, data};

            repeat (5) @(posedge clk);
            raspi_clk <= 1;
            repeat (10) @(posedge clk);
            raspi_clk <= 0;
            repeat (5) @(posedge clk);
        end
    endtask

    task raspi_recv_word(output [8:0] data);
        begin
            raspi_clk <= 0;
            raspi_dir <= 0;
            raspi_dout <= 9'b z_zzzz_zzzz;

            repeat (5) @(posedge clk);
            raspi_clk <= 1;
            repeat (10) @(posedge clk);
            data = raspi_din;
            raspi_clk <= 0;
            repeat (5) @(posedge clk);
        end
    endtask

    reg [7:0] raspi_current_ep;
    reg [8:0] raspi_current_word;

    event appimage_ready;

    initial begin
        @(appimage_ready);

        if ($test$plusargs("vcd")) begin
            $dumpfile("testbench.vcd");
            $dumpvars(0, testbench);
        end

        $display("-- Printing console messages --");
        forever begin
            raspi_recv_word(raspi_current_word);
            if (raspi_current_word[8]) begin
                raspi_current_ep = raspi_current_word[7:0];
            end else if (raspi_current_ep == 2) begin
                $write("%c", raspi_current_word[7:0]);
                $fflush();
            end
        end
    end

    initial begin
        @(appimage_ready);
        repeat (100) @(posedge clk);
        @(posedge uut.cpu_trap);
        repeat (100) @(posedge clk);
        $display("-- CPU Trapped --");
        $finish;
    end

    initial begin:appimgage_init
        reg [7:0] appimage [0:16*1024*1024-1];
        integer i;

        $display("-- Loading appimage --");

        $readmemh("appimage.hex", appimage);

        for (i = 0; i < 'h10000; i=i+1) begin
            sram.sram_memory[(i + 'h8000) % 'h10000][7:0] = appimage['h10000 + 2*i];
            sram.sram_memory[(i + 'h8000) % 'h10000][15:8] = appimage['h10000 + 2*i + 1];
        end

        for (i = 1*1024*1024; i < 2*1024*1024; i=i+1) begin
            spiflash.memory[i] = appimage[i];
        end

        -> appimage_ready;
    end
endmodule

