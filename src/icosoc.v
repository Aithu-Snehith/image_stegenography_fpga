// #### This file is auto-generated from icosoc.py. Do not edit! ####

// ++ 10-moddecl ++
module icosoc (
    input CLKIN,
    output reg LED1, LED2, LED3,

// ++ 12-iopins ++
    inout pmod3_3,
    inout pmod3_2,
    inout pmod2_10,
    inout pmod2_9,
    inout pmod2_8,
    inout pmod2_7,
    inout pmod2_4,
    inout pmod2_3,
    inout pmod2_2,
    inout pmod2_1,
    inout pmod1_10,
    inout pmod1_9,
    inout pmod1_8,
    inout pmod1_7,
    inout pmod1_4,
    inout pmod1_3,
    inout pmod1_2,
    inout pmod1_1,
    inout C16,
    inout pmod4_1,
    inout pmod4_2,
    inout pmod4_3,
    inout pmod4_4,

// ++ 15-moddecl ++
    output SPI_FLASH_CS,
    output SPI_FLASH_SCLK,
    output SPI_FLASH_MOSI,
    input  SPI_FLASH_MISO,

    // RasPi Interface: 9 Data Lines (cmds have MSB set)
    inout RASPI_11, RASPI_12, RASPI_15, RASPI_16, RASPI_19, RASPI_21, RASPI_26, RASPI_35, RASPI_36,

    // RasPi Interface: Control Lines
    input RASPI_38, RASPI_40,

    // SRAM and HRAM Interface
    output SRAM_A0, SRAM_A1, SRAM_A2, SRAM_A3, SRAM_A4, SRAM_A5, SRAM_A6, SRAM_A7,
    output SRAM_A8, SRAM_A9, SRAM_A10, SRAM_A11, SRAM_A12, SRAM_A13, SRAM_A14, SRAM_A15,
    output SRAM_A16, SRAM_A17, SRAM_A18,
    inout SRAM_D0, SRAM_D1, SRAM_D2, SRAM_D3, SRAM_D4, SRAM_D5, SRAM_D6, SRAM_D7,
    inout SRAM_D8, SRAM_D9, SRAM_D10, SRAM_D11, SRAM_D12, SRAM_D13, SRAM_D14, SRAM_D15,
    output SRAM_CE, SRAM_WE, SRAM_OE, SRAM_LB, SRAM_UB, HRAM_CK
);
// ++ 20-clockgen ++

    // -------------------------------
    // Clock Generator

    wire clk, clk90;
    wire pll_locked;

`ifdef TESTBENCH
    reg r_clk = 0, r_clk90 = 0;

    always @(posedge CLKIN)
        r_clk <= !r_clk;

    always @(negedge CLKIN)
        r_clk90 <= r_clk;

    assign clk = r_clk, clk90 = r_clk90;
    assign pll_locked = 1;
`else
    wire clk_100mhz, pll1_locked, pll2_locked;
    assign pll_locked = pll1_locked && pll2_locked;
    assign clk_100mhz = CLKIN;
    assign pll1_locked = 1;

    SB_PLL40_2F_CORE #(
        .FEEDBACK_PATH("PHASE_AND_DELAY"),
        .DELAY_ADJUSTMENT_MODE_FEEDBACK("FIXED"),
        .DELAY_ADJUSTMENT_MODE_RELATIVE("FIXED"),
        .PLLOUT_SELECT_PORTA("SHIFTREG_0deg"),
        .PLLOUT_SELECT_PORTB("SHIFTREG_90deg"),
        .SHIFTREG_DIV_MODE(1'b0),
        .FDA_FEEDBACK(4'b1111),
        .FDA_RELATIVE(4'b1111),
        .DIVR(4'b0100),
        .DIVF(7'b0000000),
        .DIVQ(3'b101),
        .FILTER_RANGE(3'b111)
    ) pll2 (
        .REFERENCECLK   (clk_100mhz   ),
        .PLLOUTGLOBALA  (clk          ),
        .PLLOUTGLOBALB  (clk90        ),
        .LOCK           (pll2_locked  ),
        .BYPASS         (1'b0         ),
        .RESETB         (1'b1         )
    );
`endif

    // -------------------------------
    // Reset Generator

    reg [7:0] resetn_counter = 0;
    wire resetn = &resetn_counter;

    always @(posedge clk) begin
        if (!pll_locked)
            resetn_counter <= 0;
        else if (!resetn)
            resetn_counter <= resetn_counter + 1;
    end

// ++ 30-raspif ++

    // -------------------------------
    // RasPi Interface

    wire recv_sync;

    // recv ep0: transmission test
    wire recv_ep0_valid;
    wire recv_ep0_ready;
    wire [7:0] recv_ep0_data;

    // recv ep1: unused
    wire recv_ep1_valid;
    wire recv_ep1_ready = 1;
    wire [7:0] recv_ep1_data = recv_ep0_data;

    // recv ep2: console input
    wire recv_ep2_valid;
    reg  recv_ep2_ready;
    wire [7:0] recv_ep2_data = recv_ep0_data;

    // recv ep3: unused
    wire recv_ep3_valid;
    wire recv_ep3_ready = 1;
    wire [7:0] recv_ep3_data = recv_ep0_data;

    // send ep0: transmission test
    wire send_ep0_valid;
    wire send_ep0_ready;
    wire [7:0] send_ep0_data;

    // send ep1: debugger
    wire send_ep1_valid;
    wire send_ep1_ready;
    wire [7:0] send_ep1_data;

    // send ep2: console output
    reg  send_ep2_valid;
    wire send_ep2_ready;
    reg  [7:0] send_ep2_data;

    // send ep3: unused
    wire send_ep3_valid = 0;
    wire send_ep3_ready;
    wire [7:0] send_ep3_data = 'bx;

    // trigger lines
    wire trigger_0;  // unused
    wire trigger_1;  // debugger
    wire trigger_2;  // unused
    wire trigger_3;  // unused

    icosoc_raspif #(
        .NUM_RECV_EP(4),
        .NUM_SEND_EP(4),
        .NUM_TRIGGERS(4)
    ) raspi_interface (
        .clk(clk),
        .sync(recv_sync),

        .recv_valid({
            recv_ep3_valid,
            recv_ep2_valid,
            recv_ep1_valid,
            recv_ep0_valid
        }),
        .recv_ready({
            recv_ep3_ready,
            recv_ep2_ready,
            recv_ep1_ready,
            recv_ep0_ready
        }),
        .recv_tdata(
            recv_ep0_data
        ),

        .send_valid({
            send_ep3_valid,
            send_ep2_valid,
            send_ep1_valid,
            send_ep0_valid
        }),
        .send_ready({
            send_ep3_ready,
            send_ep2_ready,
            send_ep1_ready,
            send_ep0_ready
        }),
        .send_tdata(
            (send_ep3_data & {8{send_ep3_valid && send_ep3_ready}}) |
            (send_ep2_data & {8{send_ep2_valid && send_ep2_ready}}) |
            (send_ep1_data & {8{send_ep1_valid && send_ep1_ready}}) |
            (send_ep0_data & {8{send_ep0_valid && send_ep0_ready}})
        ),

        .trigger({
            trigger_3,
            trigger_2,
            trigger_1,
            trigger_0
        }),

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
        .RASPI_40(RASPI_40)
    );

    // -------------------------------
    // Transmission test (recv ep0, send ep0)

    assign send_ep0_data = ((recv_ep0_data << 5) + recv_ep0_data) ^ 7;
    assign send_ep0_valid = recv_ep0_valid;
    assign recv_ep0_ready = send_ep0_ready;

// ++ 30-sramif ++

    // -------------------------------
    // SRAM/HRAM Interface

    reg [1:0] sram_state;
    reg sram_wrlb, sram_wrub;
    reg [18:0] sram_addr;
    reg [15:0] sram_dout;
    wire [15:0] sram_din;

    SB_IO #(
        .PIN_TYPE(6'b 1010_01),
        .PULLUP(1'b 0)
    ) sram_io [15:0] (
        .PACKAGE_PIN({SRAM_D15, SRAM_D14, SRAM_D13, SRAM_D12, SRAM_D11, SRAM_D10, SRAM_D9, SRAM_D8,
                      SRAM_D7, SRAM_D6, SRAM_D5, SRAM_D4, SRAM_D3, SRAM_D2, SRAM_D1, SRAM_D0}),
        .OUTPUT_ENABLE(sram_wrlb || sram_wrub),
        .D_OUT_0(sram_dout),
        .D_IN_0(sram_din)
    );


    assign {SRAM_A18, SRAM_A17, SRAM_A16, SRAM_A15, SRAM_A14, SRAM_A13, SRAM_A12, SRAM_A11, SRAM_A10, SRAM_A9, SRAM_A8,
            SRAM_A7, SRAM_A6, SRAM_A5, SRAM_A4, SRAM_A3, SRAM_A2, SRAM_A1, SRAM_A0} = sram_addr;

    assign SRAM_CE = 0;
    assign SRAM_WE = (sram_wrlb || sram_wrub) ? !clk90 : 1;
    assign SRAM_OE = (sram_wrlb || sram_wrub);
    assign SRAM_LB = (sram_wrlb || sram_wrub) ? !sram_wrlb : 0;
    assign SRAM_UB = (sram_wrlb || sram_wrub) ? !sram_wrub : 0;
    assign HRAM_CK = 0;

// ++ 40-cpu ++

    // -------------------------------
    // PicoRV32 Core

    wire cpu_trap;
    wire [31:0] cpu_irq;

    wire mem_valid;
    wire mem_instr;
    wire [31:0] mem_addr;
    wire [31:0] mem_wdata;
    wire [3:0] mem_wstrb;

    reg mem_ready;
    reg [31:0] mem_rdata;

    picorv32 #(
        .COMPRESSED_ISA(1),
        .ENABLE_MUL(0),
        .ENABLE_DIV(0),
        .ENABLE_IRQ(1)
    ) cpu (
        .clk       (clk      ),
        .resetn    (resetn   ),
        .trap      (cpu_trap ),
        .mem_valid (mem_valid),
        .mem_instr (mem_instr),
        .mem_ready (mem_ready),
        .mem_addr  (mem_addr ),
        .mem_wdata (mem_wdata),
        .mem_wstrb (mem_wstrb),
        .mem_rdata (mem_rdata),
        .irq       (cpu_irq  )
    );

// ++ 50-mods ++

    // -------------------------------
    // IcoSoC Modules

    reg [3:0] mod_ser0_ctrl_wr;
    reg mod_ser0_ctrl_rd;
    reg [15:0] mod_ser0_ctrl_addr;
    reg [31:0] mod_ser0_ctrl_wdat;
    wire [31:0] mod_ser0_ctrl_rdat;
    wire mod_ser0_ctrl_done;

    icosoc_mod_rs232 #(
        .BAUD_RATE(115200),
        .CLOCK_FREQ_HZ(20000000)
    ) mod_ser0 (
        .clk(clk),
        .resetn(resetn),
        .ctrl_wr(mod_ser0_ctrl_wr),
        .ctrl_rd(mod_ser0_ctrl_rd),
        .ctrl_addr(mod_ser0_ctrl_addr),
        .ctrl_wdat(mod_ser0_ctrl_wdat),
        .ctrl_rdat(mod_ser0_ctrl_rdat),
        .ctrl_done(mod_ser0_ctrl_done),
        .tx({pmod3_2}),
        .rx({pmod3_3})
    );

    reg [3:0] mod_pwm0_ctrl_wr;
    reg mod_pwm0_ctrl_rd;
    reg [15:0] mod_pwm0_ctrl_addr;
    reg [31:0] mod_pwm0_ctrl_wdat;
    wire [31:0] mod_pwm0_ctrl_rdat;
    wire mod_pwm0_ctrl_done;

    icosoc_mod_pwm #(
        .CLOCK_FREQ_HZ(20000000)
    ) mod_pwm0 (
        .clk(clk),
        .resetn(resetn),
        .ctrl_wr(mod_pwm0_ctrl_wr),
        .ctrl_rd(mod_pwm0_ctrl_rd),
        .ctrl_addr(mod_pwm0_ctrl_addr),
        .ctrl_wdat(mod_pwm0_ctrl_wdat),
        .ctrl_rdat(mod_pwm0_ctrl_rdat),
        .ctrl_done(mod_pwm0_ctrl_done),
        .pin({C16})
    );

    reg [3:0] mod_ledstrip_ctrl_wr;
    reg mod_ledstrip_ctrl_rd;
    reg [15:0] mod_ledstrip_ctrl_addr;
    reg [31:0] mod_ledstrip_ctrl_wdat;
    wire [31:0] mod_ledstrip_ctrl_rdat;
    wire mod_ledstrip_ctrl_done;

    icosoc_mod_gpio #(
        .IO_LENGTH(16),
        .CLOCK_FREQ_HZ(20000000)
    ) mod_ledstrip (
        .clk(clk),
        .resetn(resetn),
        .ctrl_wr(mod_ledstrip_ctrl_wr),
        .ctrl_rd(mod_ledstrip_ctrl_rd),
        .ctrl_addr(mod_ledstrip_ctrl_addr),
        .ctrl_wdat(mod_ledstrip_ctrl_wdat),
        .ctrl_rdat(mod_ledstrip_ctrl_rdat),
        .ctrl_done(mod_ledstrip_ctrl_done),
        .IO({pmod2_10,pmod2_9,pmod2_8,pmod2_7,pmod2_4,pmod2_3,pmod2_2,pmod2_1,pmod1_10,pmod1_9,pmod1_8,pmod1_7,pmod1_4,pmod1_3,pmod1_2,pmod1_1})
    );


    assign cpu_irq = 0;
// ++ 68-flashmem ++

    // -------------------------------
    // SPI Flash Interface

    reg spiflash_cs;
    reg spiflash_sclk;
    reg spiflash_mosi;
    wire spiflash_miso;

    reg [7:0] spiflash_data;
    reg [3:0] spiflash_state;

    assign SPI_FLASH_CS = spiflash_cs;
    assign SPI_FLASH_SCLK = spiflash_sclk;
    assign SPI_FLASH_MOSI = spiflash_mosi;
    assign spiflash_miso = SPI_FLASH_MISO;

    wire flashmem_cond = 0;

// ++ 70-bus ++

    // -------------------------------
    // Memory/IO Interface

    localparam BOOT_MEM_SIZE = 1024;
    reg [31:0] memory [0:BOOT_MEM_SIZE-1];
`ifdef TESTBENCH
    initial $readmemh("firmware.hex", memory);
`else
    initial $readmemh("firmware_seed.hex", memory);
`endif

    always @(posedge clk) begin
        mem_ready <= 0;
        sram_state <= 0;
        sram_wrlb <= 0;
        sram_wrub <= 0;
        sram_addr <= 'bx;
        sram_dout <= 'bx;

// ++ 71-bus-modinit ++
        mod_ser0_ctrl_wr <= 0;
        mod_ser0_ctrl_rd <= 0;
        mod_ser0_ctrl_addr <= mem_addr[15:0];
        mod_ser0_ctrl_wdat <= mem_wdata;

        mod_pwm0_ctrl_wr <= 0;
        mod_pwm0_ctrl_rd <= 0;
        mod_pwm0_ctrl_addr <= mem_addr[15:0];
        mod_pwm0_ctrl_wdat <= mem_wdata;

        mod_ledstrip_ctrl_wr <= 0;
        mod_ledstrip_ctrl_rd <= 0;
        mod_ledstrip_ctrl_addr <= mem_addr[15:0];
        mod_ledstrip_ctrl_wdat <= mem_wdata;
// ++ 72-bus ++

        if (send_ep2_ready)
            send_ep2_valid <= 0;

        recv_ep2_ready <= 0;

        if (!resetn) begin
            LED1 <= 0;
            LED2 <= 0;
            LED3 <= 0;

            spiflash_cs   <= 1;
            spiflash_sclk <= 1;
            spiflash_mosi <= 0;

            send_ep2_valid <= 0;
            spiflash_state <= 0;
        end else
        if (mem_valid && !mem_ready) begin
            (* parallel_case *)
            case (1)
                (mem_addr >> 2) < BOOT_MEM_SIZE: begin
                    if (mem_wstrb) begin
                        if (mem_wstrb[0]) memory[mem_addr >> 2][ 7: 0] <= mem_wdata[ 7: 0];
                        if (mem_wstrb[1]) memory[mem_addr >> 2][15: 8] <= mem_wdata[15: 8];
                        if (mem_wstrb[2]) memory[mem_addr >> 2][23:16] <= mem_wdata[23:16];
                        if (mem_wstrb[3]) memory[mem_addr >> 2][31:24] <= mem_wdata[31:24];
                    end else begin
                        mem_rdata <= memory[mem_addr >> 2];
                    end
                    mem_ready <= 1;
                end
                (mem_addr & 32'hF000_0000) == 32'h0000_0000 && (mem_addr >> 2) >= BOOT_MEM_SIZE && !flashmem_cond: begin
                    if (mem_wstrb) begin
                        (* parallel_case, full_case *)
                        case (sram_state)
                            0: begin
                                sram_addr <= {mem_addr >> 2, 1'b0};
                                sram_dout <= mem_wdata[15:0];
                                sram_wrlb <= mem_wstrb[0];
                                sram_wrub <= mem_wstrb[1];
                                sram_state <= 1;
                            end
                            1: begin
                                sram_addr <= {mem_addr >> 2, 1'b1};
                                sram_dout <= mem_wdata[31:16];
                                sram_wrlb <= mem_wstrb[2];
                                sram_wrub <= mem_wstrb[3];
                                sram_state <= 0;
                                mem_ready <= 1;
                            end
                        endcase
                    end else begin
                        (* parallel_case, full_case *)
                        case (sram_state)
                            0: begin
                                sram_addr <= {mem_addr >> 2, 1'b0};
                                sram_state <= 1;
                            end
                            1: begin
                                sram_addr <= {mem_addr >> 2, 1'b1};
                                mem_rdata[15:0] <= sram_din;
                                sram_state <= 2;
                            end
                            2: begin
                                mem_rdata[31:16] <= sram_din;
                                sram_state <= 0;
                                mem_ready <= 1;
                            end
                        endcase
                    end
                end
                (mem_addr & 32'hF000_0000) == 32'h2000_0000: begin
                    mem_ready <= 1;
                    mem_rdata <= 0;
                    if (mem_wstrb) begin
                        if (mem_addr[23:16] == 0) begin
                            if (mem_addr[7:0] == 8'h 00) {LED3, LED2, LED1} <= mem_wdata;
                            if (mem_addr[7:0] == 8'h 04) {spiflash_cs, spiflash_sclk, spiflash_mosi} <= mem_wdata[3:1];
                            if (mem_addr[7:0] == 8'h 08) begin
                                if (spiflash_state == 0) begin
                                    spiflash_data <= mem_wdata;
                                    spiflash_mosi <= mem_wdata[7];
                                end else begin
                                    if (spiflash_state[0])
                                        spiflash_data <= {spiflash_data, spiflash_miso};
                                    else
                                        spiflash_mosi <= spiflash_data[7];
                                end
                                spiflash_sclk <= spiflash_state[0];
                                mem_ready <= spiflash_state == 15;
                                spiflash_state <= spiflash_state + 1;
                            end
                        end

// ++ 73-bus-modwrite ++

                        if (mem_addr[23:16] == 1) begin
                            mem_ready <= mod_ser0_ctrl_done;
                            mod_ser0_ctrl_wr <= mod_ser0_ctrl_done ? 0 : mem_wstrb;
                        end


                        if (mem_addr[23:16] == 3) begin
                            mem_ready <= mod_pwm0_ctrl_done;
                            mod_pwm0_ctrl_wr <= mod_pwm0_ctrl_done ? 0 : mem_wstrb;
                        end


                        if (mem_addr[23:16] == 2) begin
                            mem_ready <= mod_ledstrip_ctrl_done;
                            mod_ledstrip_ctrl_wr <= mod_ledstrip_ctrl_done ? 0 : mem_wstrb;
                        end

// ++ 74-bus ++

                    end else begin
                        if (mem_addr[23:16] == 0) begin
`ifdef TESTBENCH
                            if (mem_addr[7:0] == 8'h 00) mem_rdata <= {LED3, LED2, LED1} | 32'h8000_0000;
`else
                            if (mem_addr[7:0] == 8'h 00) mem_rdata <= {LED3, LED2, LED1};
`endif
                            if (mem_addr[7:0] == 8'h 04) mem_rdata <= {spiflash_cs, spiflash_sclk, spiflash_mosi, spiflash_miso};
                            if (mem_addr[7:0] == 8'h 08) mem_rdata <= spiflash_data;
                        end

// ++ 75-bus-modread ++

                        if (mem_addr[23:16] == 1) begin
                            mem_ready <= mod_ser0_ctrl_done;
                            mod_ser0_ctrl_rd <= !mod_ser0_ctrl_done;
                            mem_rdata <= mod_ser0_ctrl_rdat;
                        end


                        if (mem_addr[23:16] == 3) begin
                            mem_ready <= mod_pwm0_ctrl_done;
                            mod_pwm0_ctrl_rd <= !mod_pwm0_ctrl_done;
                            mem_rdata <= mod_pwm0_ctrl_rdat;
                        end


                        if (mem_addr[23:16] == 2) begin
                            mem_ready <= mod_ledstrip_ctrl_done;
                            mod_ledstrip_ctrl_rd <= !mod_ledstrip_ctrl_done;
                            mem_rdata <= mod_ledstrip_ctrl_rdat;
                        end

// ++ 76-bus ++

                    end
                end
                (mem_addr & 32'hF000_0000) == 32'h3000_0000: begin
                    if (mem_wstrb) begin
                        if (send_ep2_ready || !send_ep2_valid) begin
                            send_ep2_valid <= 1;
                            send_ep2_data <= mem_wdata;
                            mem_ready <= 1;
                        end
                    end else begin
                        if (recv_ep2_valid && !recv_ep2_ready) begin
                            recv_ep2_ready <= 1;
                            mem_rdata <= recv_ep2_data;
                        end else begin
                            mem_rdata <= ~0;
                        end
                        mem_ready <= 1;
                    end
                end

// ++ 78-bus ++

            endcase
        end
    end

// ++ 90-debug ++

    // -------------------------------
    // Additional debug code

    assign pmod4_3 = cpu_trap;
    assign pmod4_1 = clk;
    assign pmod4_4 = mem_valid;
    assign pmod4_2 = resetn;

    // -------------------------------
    // On-chip logic analyzer (send ep1, trig1)

    wire debug_enable;
    wire debug_trigger;
    wire debug_triggered;
    wire [31:0] debug_data;

    icosoc_debugger #(
        .WIDTH(32),
        .DEPTH(256),
        .TRIGAT(0),
        .MODE("FIRST_TRIGGER")
    ) debugger (
        .clk(clk),
        .resetn(resetn),

        .enable(debug_enable),
        .trigger(debug_trigger),
        .triggered(debug_triggered),
        .data(debug_data),

        .dump_en(trigger_1),
        .dump_valid(send_ep1_valid),
        .dump_ready(send_ep1_ready),
        .dump_data(send_ep1_data)
    );

    assign debug_enable = 1;
    assign debug_trigger = 1;

    assign debug_data = {
        cpu_trap,            // debug_31 -> cpu_trap
        mem_addr[0],         // debug_30 -> mem_addr[0]
        mem_addr[1],         // debug_29 -> mem_addr[1]
        mem_addr[2],         // debug_28 -> mem_addr[2]
        mem_addr[3],         // debug_27 -> mem_addr[3]
        mem_addr[4],         // debug_26 -> mem_addr[4]
        mem_addr[5],         // debug_25 -> mem_addr[5]
        mem_addr[6],         // debug_24 -> mem_addr[6]
        mem_addr[7],         // debug_23 -> mem_addr[7]
        mem_addr[8],         // debug_22 -> mem_addr[8]
        mem_addr[9],         // debug_21 -> mem_addr[9]
        mem_addr[10],        // debug_20 -> mem_addr[10]
        mem_addr[11],        // debug_19 -> mem_addr[11]
        mem_addr[12],        // debug_18 -> mem_addr[12]
        mem_addr[13],        // debug_17 -> mem_addr[13]
        mem_addr[14],        // debug_16 -> mem_addr[14]
        mem_addr[15],        // debug_15 -> mem_addr[15]
        mem_addr[16],        // debug_14 -> mem_addr[16]
        mem_addr[17],        // debug_13 -> mem_addr[17]
        mem_addr[28],        // debug_12 -> mem_addr[28]
        mem_addr[29],        // debug_11 -> mem_addr[29]
        mem_addr[30],        // debug_10 -> mem_addr[30]
        mem_addr[31],        // debug_9 -> mem_addr[31]
        |mem_addr[27:18],    // debug_8 -> mem_addr_midbits
        mem_instr,           // debug_7 -> mem_instr
        mem_ready,           // debug_6 -> mem_ready
        mem_valid,           // debug_5 -> mem_valid
        mem_wstrb[0],        // debug_4 -> mem_wstrb[0]
        mem_wstrb[1],        // debug_3 -> mem_wstrb[1]
        mem_wstrb[2],        // debug_2 -> mem_wstrb[2]
        mem_wstrb[3],        // debug_1 -> mem_wstrb[3]
        resetn               // debug_0 -> resetn
    };
// ++ 95-endmod ++
endmodule
