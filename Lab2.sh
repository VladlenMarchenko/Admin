#!/bin/bash
read -p "Введите размер доски: " size
color1='\e[44m'  
color2='\e[42m'  
reset='\e[0m'   
for ((row = 0; row < size; row++)); do
    for ((col = 0; col < size; col++)); do
                if (( (row + col) % 2 == 0 )); then
            echo -ne "${color1}  ${reset}"
        else
            echo -ne "${color2}  ${reset}"
        fi
    done
    echo 
done
