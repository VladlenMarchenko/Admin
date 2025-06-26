#!/bin/bash
curent_dir(){
    echo "Tekyshi katalog $(pwd)"
}
curent_process(){
    echo "Tekyshi process $(ps -o comm= -p $$)"
}
home_dir(){
    echo "Domashni katalog $HOME"
}
system_inf(){
    echo "$(lsb_release -d | cut -f2-)"
}
available_shells(){
    echo "Dostypnie obolochki"
    cat /etc/shells
}
current_users(){
    echo " Tekyshie polzovateli"
    who
}
ussers_count(){
    echo "Koll-vo polzovatelei $(who | wc -l)"
}
disk_info(){
    echo "Inf o diskax"
    df -h
}
cpu_info(){
    echo "inf o processore"
    lscpu
}
memory_info(){
    echo "Inf o pamyti"
    free -h
}
fs_info(){
    echo "Inf o file system"
    df -Th
}
package_info(){
    echo "Ystanovlennie paketi"
    if command -v dpkg >/dev/null 2>&1; then
    dpkg -l | head -n 10
    elif command -v rpm >/dev/null 2>&1; then
    rpm -qa | head -n 10
    else
    echo "NONE 40000400004"
    fi
}
generate_full_report(){
    curent_dir
    curent_process
    home_dir
    system_inf
    available_shells
    current_users
    ussers_count
    disk_info
    cpu_info
    memory_info
    fs_info
    package_info
}
if [[ "$1" == "--tofile" &&  -n "$2" ]]; then
    generate_full_report > "$2"
    echo "Otchet save v file $2"
    exit 0
fi

while true; do 
    clear
    echo "Menu"
    echo "1. Tekushi katalog"
    echo "2. Tekushi process"
    echo "3. Home katalog"
    echo "4. Name and versia OS"
    echo "5. Dostupnie oboloshki"    
    echo "6. Now polzovateli"
    echo "7. Count ussers"
    echo "8. Inf o diskax"
    echo "9. Inf o processor"
    echo "10. Inf o pamyt"
    echo "11. Inf o fil  system"
    echo "12. Download packeg"
    echo "13. Vivesti polni otchet"
    echo "14. Exit"
    read -p "Viberi pynkt menu " choice
    
    case $choice in
 	1)curent_dir;;
	2)curent_process;;
	3)home_dir;;
	4)system_inf;;
	5)available_shells;;
	6)current_users;;
	7)ussers_count;;
	8)disk_info;;
	9)cpu_info;;
	10)memory_info;;
	11)fs_info;;
	12)package_info;;
	13)generate_full_report;;
        14) exit 0;;
    esac
    read -p "For go next press Enter"
    
done
