#!/bin/bash

echo "Enter a number to generate its multiplication table:"
read number

echo "Do you want the full table (1â€“10) or a partial table?"
echo "Type 'full' or 'partial':"
read choice

if [[ "$choice" == "full" ]]; then
    echo ""
    echo "í³Œ Full Multiplication Table for $number"
    echo "--------------------------------------"
    
    for i in {1..10}
    do
        result=$((number * i))
        echo "$number x $i = $result"
    done

elif [[ "$choice" == "partial" ]]; then
    echo "Enter start of range:"
    read start

    echo "Enter end of range:"
    read end

    echo ""
    echo "í³Œ Partial Multiplication Table for $number (from $start to $end)"
    echo "----------------------------------------------------------------"

    # Ensure start <= end
    if (( start > end )); then
        echo "Error: Start value cannot be greater than end value."
        exit 1
    fi

    for ((i=start; i<=end; i++))
    do
        result=$((number * i))
        echo "$number x $i = $result"
    done

else
    echo "Invalid choice! Please run script again and choose 'full' or 'partial'."
fi

