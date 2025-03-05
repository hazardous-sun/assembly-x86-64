#!/bin/bash

# Extract the base name without the .asm extension
basename="${1%.asm}"

# Assemble the .asm file into an object file
nasm -f elf64 -o "./${basename}.o" "$1"

# Check if nasm ran successfully
if [ $? -ne 0 ]; then
  echo "Invalid Assembly code. Exiting."
  exit 1
fi

# Link the object file to create the executable
ld -o "./${basename}" "./${basename}.o"

# Check if ld ran successfully
if [ $? -ne 0 ]; then
  echo "Linking failed. Exiting."
  exit 1
fi

echo "Compilation and linking successful. Output: ./{$basename}"
