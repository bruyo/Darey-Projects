#!/bin/bash

###############################################
# 1. Ask user for number
# 2. Ask user for table type (full or partial)
# 3. If partial → ask for start and end range
# 4. Generate multiplication table with logic
###############################################

# (C-style comment) Ask user to enter a number
read -p "Enter a number for the multiplication table: " number

# (C-style comment) Ask user if full or partial table is needed
echo "Do you want:"
echo "1) Full multiplication table (1 to 10)"
echo "2) Partial multiplication table"
read -p "Choose (1 or 2): " choice

# (C-style comment) Decision handling
if [ "$choice" -eq 1 ]; then
    # List-style comment:
    # - Generate full table from 1 to 10
    for i in {1..10}
    do
        echo "$number x $i = $((number * i))"
    done

elif [ "$choice" -eq 2 ]; then
    # List-style comment:
    # - Ask user for start of range
    # - Ask user for end of range
    read -p "Enter start of range: " start
    read -p "Enter end of range: " end

    # (C-style comment) Generate partial table using loop
    for (( i=start; i<=end; i++ ))
    do
        echo "$number x $i = $((number * i))"
    done
else
    echo "Invalid choice. Exiting."
fi
