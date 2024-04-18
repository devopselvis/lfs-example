#!/bin/bash

# Create the directory
mkdir -p testdata

# Change to the directory
cd testdata

# Create 20 files
for i in {1..20}
do
  # Determine the extension
  ext=$((i%5 + 1))

  # Create the file
  touch "file${i}.ex${ext}"

  # If the extension is 4 or 5, make the file size between 200 MB and 500 MB
  # Otherwise, make the file size between 1 MB and 10 MB
  if [ $ext -ge 4 ]
  then
    # Generate a random size between 200 MB and 500 MB (204800 blocks to 512000 blocks of 1024 bytes)
    size=$(shuf -i 204800-512000 -n 1)
  else
    # Generate a random size between 1 MB and 10 MB (1024 blocks to 10240 blocks of 1024 bytes)
    size=$(shuf -i 1024-10240 -n 1)
  fi

  # Write the file with the determined size
  dd if=/dev/zero of="file${i}.ex${ext}" bs=1024 count=$size
done