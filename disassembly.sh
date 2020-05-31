
if ! type "avr-objdump" > /dev/null; then
    echo "avr-objdump is not installed."
else
    avr-objdump -S .pio/build/uno/firmware.elf > ./disassembly/firmware.S
fi