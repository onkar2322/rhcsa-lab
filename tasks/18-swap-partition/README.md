# Task 18 - Add a Swap Partition of 512MB and Mount it Permanently

## Question
**Add a swap partition of 512MB and mount it permanently.**

## Instructions

1. Use `fdisk` or `parted` to create a new partition of size 512MB.
2. Set the partition type to `Linux swap` (ID 82).
3. Format the partition as swap using:
   mkswap /dev/sdXn

## Validation 
-  Run =  './validate.sh'

