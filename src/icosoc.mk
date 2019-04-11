# #### This file is auto-generated from icosoc.py. Do not edit! ####

# ++ 10-top ++

ICOSOC_ROOT ?= ../..
RISCV_TOOLS_PREFIX ?= /opt/riscv32ic/bin/riscv32-unknown-elf-
LDSCRIPT ?= ../../common/riscv_orig.ld

ifeq ($(shell bash -c 'type -p icoprog'),)
SSH_RASPI ?= ssh pi@raspi
else
SSH_RASPI ?= sh -c
endif

help:
	@echo ""
	@echo "Building FPGA bitstream and program:"
	@echo "   make prog_sram"
	@echo "   make prog_flash"
	@echo ""
	@echo "Resetting FPGA (prevent boot from flash):"
	@echo "   make reset_halt"
	@echo ""
	@echo "Resetting FPGA (load image from flash):"
	@echo "   make reset_boot"
	@echo ""
	@echo "Erasing image from flash (erase first sector):"
	@echo "   make reset_flash"
	@echo ""
	@echo "Build and upload FPGA + application image:"
	@echo "   make run"
	@echo ""
	@echo "Upload FPGA (no rebuild) + application image:"
	@echo "   make softrun"
	@echo ""
	@echo "Console session (close with Ctrl-D):"
	@echo "   make console"
	@echo ""
	@echo "Download debug trace (to 'debug.vcd'):"
	@echo "   make debug"
	@echo ""
	@echo "Run testbench and write trace (to 'testbench.vcd'):"
	@echo "   make testbench_vcd"
	@echo ""
	@echo "Run testbench without writing VCD trace file:"
	@echo "   make testbench_novcd"
	@echo ""

prog_sram: icosoc.bin
	$(SSH_RASPI) 'killall -9 icoprog || true'
	$(SSH_RASPI) 'icoprog -p' < icosoc.bin

prog_flash: icosoc.bin appimage.hex
	python3 ../../common/flashbin.py
	$(SSH_RASPI) 'killall -9 icoprog || true'
	$(SSH_RASPI) 'icoprog -f' < icosoc.bin
	$(SSH_RASPI) 'icoprog -O8 -f' < appimage_lo.bin
	$(SSH_RASPI) 'icoprog -O16 -f' < appimage_hi.bin

reset_halt:
	$(SSH_RASPI) 'killall -9 icoprog || true'
	$(SSH_RASPI) 'icoprog -R'

reset_flash:
	$(SSH_RASPI) 'killall -9 icoprog || true'
	dd if=/dev/zero bs=1K count=64 | $(SSH_RASPI) 'icoprog -f'

reset_boot:
	$(SSH_RASPI) 'killall -9 icoprog || true'
	$(SSH_RASPI) 'icoprog -b'
	$(SSH_RASPI) 'icoprog -Zr2'

run: icosoc.bin appimage.hex
	$(SSH_RASPI) 'killall -9 icoprog || true'
	$(SSH_RASPI) 'icoprog -p' < icosoc.bin
	$(SSH_RASPI) 'icoprog -zZc2' < appimage.hex

softrun: appimage.hex
	$(SSH_RASPI) 'killall -9 icoprog || true'
	$(SSH_RASPI) 'icoprog -p' < icosoc.bin
	$(SSH_RASPI) 'icoprog -zZc2' < appimage.hex

console:
	$(SSH_RASPI) 'killall -9 icoprog || true'
	$(SSH_RASPI) 'icoprog -c2'

debug:
	grep '// debug_.*->' icosoc.v
	$(SSH_RASPI) 'killall -9 icoprog || true'
	sedexpr="$$( grep '// debug_.*->' icosoc.v | sed 's,.*// \(debug_\),s/\1,; s, *-> *, /,; s, *$$, /;,;'; )"; \
			$(SSH_RASPI) "icoprog -V $$( grep '// debug_.*->' icosoc.v | wc -l; )" | sed -e "$$sedexpr" > debug.vcd
# ++ 50-synthesis ++
icosoc.blif: icosoc.v icosoc.ys firmware_seed.hex
	yosys -l icosoc.log -v3 icosoc.ys
icosoc.asc: icosoc.blif icosoc.pcf
	set -x; for seed in 1234 2345 3456 4567 5678 6789 7890; do \
		arachne-pnr -s $$seed -d 8k -p icosoc.pcf -o icosoc.new_asc icosoc.blif && \
		icetime -c 20 -d hx8k -tr icosoc.rpt icosoc.new_asc && exit 0; \
	done; false
	mv icosoc.new_asc icosoc.asc
icosoc.bin: icosoc.asc firmware_seed.hex firmware.hex
	icebram firmware_seed.hex firmware.hex < icosoc.asc | icepack > icosoc.new_bin
	mv icosoc.new_bin icosoc.bin
# ++ 60-simulation ++
testbench: icosoc.v ../../common/icosoc_flashmem.v ../../mod_rs232/mod_rs232.v ../../common/icosoc_debugger.v ../../mod_gpio/mod_gpio.v ../../common/icosoc_raspif.v ../../mod_pwm/mod_pwm.v ../../common/picorv32.v ../../common/icosoc_crossclkfifo.v ../../common/sim_sram.v ../../common/sim_spiflash.v testbench.v
	iverilog -D ICOSOC -D TESTBENCH -o testbench icosoc.v ../../common/icosoc_flashmem.v ../../mod_rs232/mod_rs232.v ../../common/icosoc_debugger.v ../../mod_gpio/mod_gpio.v ../../common/icosoc_raspif.v ../../mod_pwm/mod_pwm.v ../../common/picorv32.v ../../common/icosoc_crossclkfifo.v ../../common/sim_sram.v ../../common/sim_spiflash.v testbench.v $(shell yosys-config --datdir/ice40/cells_sim.v)
testbench_vcd: testbench firmware.hex appimage.hex
	vvp -N testbench +vcd
testbench_novcd: testbench firmware.hex appimage.hex
	vvp -N testbench
# ++ 70-firmware ++
firmware.elf: ../../common/firmware.S ../../common/firmware.c ../../common/firmware.lds icosoc.cfg
	$(RISCV_TOOLS_PREFIX)gcc -Os -march=rv32i -ffreestanding -nostdlib -Wall -o firmware.elf ../../common/firmware.S ../../common/firmware.c \
			--std=gnu99 -Wl,-Bstatic,-T,../../common/firmware.lds,-Map,firmware.map,--strip-debug -lgcc
	chmod -x firmware.elf
firmware.bin: firmware.elf
	$(RISCV_TOOLS_PREFIX)objcopy -O binary firmware.elf firmware.bin
	chmod -x firmware.bin
firmware.hex: ../../common/makehex.py firmware.bin
	python3 ../../common/makehex.py firmware.bin 1024 > firmware.hex
	@echo "Firmware size: $$(grep .. firmware.hex | wc -l) / $$(wc -l < firmware.hex)"
firmware_seed.hex:
	icebram -g 32 1024 > firmware_seed.hex
# ++ 90-extradeps ++
icosoc.v: icosoc.mk
icosoc.ys: icosoc.mk
icosoc.pcf: icosoc.mk
icosoc.mk: icosoc.cfg
icosoc.mk: ../../icosoc.py
icosoc.mk: ../../mod_*/*.py
icosoc.blif: ../../common/*.v
icosoc.blif: ../../mod_*/*.v
# ++ 95-clean ++
clean::
	rm -f firmware.bin firmware.elf firmware_seed.hex firmware.hex firmware.map
	rm -f icosoc.mk icosoc.ys icosoc.pcf icosoc.v icosoc.h icosoc.c icosoc.ld
	rm -f icosoc.blif icosoc.asc icosoc.bin icosoc.log icosoc.rpt debug.vcd
	rm -f testbench testbench.v testbench.vcd
	rm -f appimage_lo.bin appimage_hi.bin
# ++ 99-special ++
.PHONY: clean
.SECONDARY:
