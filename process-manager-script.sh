#!/bin/bash
# advanced_system_manager.sh

# Function to display the main menu
show_main_menu() {
    clear
    echo "Advanced System Management Tool"
    echo "1. Process Management"
    echo "2. System Monitoring"
    echo "3. File System Operations"
    echo "4. Network Management"
    echo "5. User Management"
    echo "6. Security Operations"
    echo "7. Package Management"
    echo "8. Service Management"
    echo "9. Performance Tuning"
    echo "10. Backup and Restore"
    echo "11. Log Management"
    echo "12. Scheduled Tasks"
    echo "13. Hardware Information"
    echo "14. Virtualization Management"
    echo "15. Docker Management"
    echo "16. Exit"
}

# Process Management Functions
process_management_menu() {
    while true; do
        echo "Process Management Menu"
        echo "1. List all processes"
        echo "2. Find process by name"
        echo "3. Kill process by PID"
        echo "4. Change process priority"
        echo "5. View process tree"
        echo "6. Monitor CPU usage of a process"
        echo "7. List top CPU consuming processes"
        echo "8. List top memory consuming processes"
        echo "9. View open files for a process"
        echo "10. Back to main menu"
        read -p "Enter your choice: " choice
        case $choice in
            1) ps aux ;;
            2) read -p "Enter process name: " name; pgrep -l "$name" ;;
            3) read -p "Enter PID to kill: " pid; kill -15 "$pid" ;;
            4) read -p "Enter PID: " pid; read -p "Enter nice value (-20 to 19): " nice_val; renice $nice_val $pid ;;
            5) pstree ;;
            6) read -p "Enter PID: " pid; top -p "$pid" ;;
            7) ps aux --sort=-%cpu | head -n 11 ;;
            8) ps aux --sort=-%mem | head -n 11 ;;
            9) read -p "Enter PID: " pid; lsof -p "$pid" ;;
            10) break ;;
            *) echo "Invalid option" ;;
        esac
        read -p "Press enter to continue"
    done
}

# System Monitoring Functions
system_monitoring_menu() {
    while true; do
        echo "System Monitoring Menu"
        echo "1. View system uptime"
        echo "2. Check disk usage"
        echo "3. Check memory usage"
        echo "4. Monitor system load"
        echo "5. View network statistics"
        echo "6. Check running services"
        echo "7. Monitor I/O operations"
        echo "8. View system logs"
        echo "9. Check CPU temperature"
        echo "10. Back to main menu"
        read -p "Enter your choice: " choice
        case $choice in
            1) uptime ;;
            2) df -h ;;
            3) free -m ;;
            4) top -b -n 1 ;;
            5) netstat -tuln ;;
            6) systemctl list-units --type=service --state=running ;;
            7) iostat ;;
            8) journalctl -n 50 ;;
            9) sensors ;;
            10) break ;;
            *) echo "Invalid option" ;;
        esac
        read -p "Press enter to continue"
    done
}

# File System Operations Functions
file_system_menu() {
    while true; do
        echo "File System Operations Menu"
        echo "1. List files in directory"
        echo "2. Create new directory"
        echo "3. Remove directory"
        echo "4. Copy file/directory"
        echo "5. Move file/directory"
        echo "6. Change file permissions"
        echo "7. Find files by name"
        echo "8. Search file contents"
        echo "9. Check disk space usage of directory"
        echo "10. Back to main menu"
        read -p "Enter your choice: " choice
        case $choice in
            1) read -p "Enter directory path: " dir; ls -l "$dir" ;;
            2) read -p "Enter new directory name: " dir; mkdir "$dir" ;;
            3) read -p "Enter directory to remove: " dir; rm -ri "$dir" ;;
            4) read -p "Enter source path: " src; read -p "Enter destination path: " dest; cp -r "$src" "$dest" ;;
            5) read -p "Enter source path: " src; read -p "Enter destination path: " dest; mv "$src" "$dest" ;;
            6) read -p "Enter file path: " file; read -p "Enter new permissions (e.g., 644): " perms; chmod "$perms" "$file" ;;
            7) read -p "Enter file name to find: " name; find / -name "$name" 2>/dev/null ;;
            8) read -p "Enter search term: " term; read -p "Enter file/directory to search: " dir; grep -r "$term" "$dir" ;;
            9) read -p "Enter directory path: " dir; du -sh "$dir" ;;
            10) break ;;
            *) echo "Invalid option" ;;
        esac
        read -p "Press enter to continue"
    done
}

# Network Management Functions
network_management_menu() {
    while true; do
        echo "Network Management Menu"
        echo "1. View network interfaces"
        echo "2. Check IP address"
        echo "3. Ping a host"
        echo "4. Trace route to host"
        echo "5. View open ports"
        echo "6. View active network connections"
        echo "7. Download file"
        echo "8. Check DNS resolution"
        echo "9. View firewall rules"
        echo "10. Back to main menu"
        read -p "Enter your choice: " choice
        case $choice in
            1) ip addr show ;;
            2) hostname -I ;;
            3) read -p "Enter host to ping: " host; ping -c 4 "$host" ;;
            4) read -p "Enter host to trace: " host; traceroute "$host" ;;
            5) ss -tuln ;;
            6) netstat -atn ;;
            7) read -p "Enter URL to download: " url; wget "$url" ;;
            8) read -p "Enter domain to resolve: " domain; nslookup "$domain" ;;
            9) sudo iptables -L ;;
            10) break ;;
            *) echo "Invalid option" ;;
        esac
        read -p "Press enter to continue"
    done
}

# User Management Functions
user_management_menu() {
    while true; do
        echo "User Management Menu"
        echo "1. List all users"
        echo "2. Add new user"
        echo "3. Delete user"
        echo "4. Change user password"
        echo "5. Add user to group"
        echo "6. Remove user from group"
        echo "7. Lock user account"
        echo "8. Unlock user account"
        echo "9. View user login history"
        echo "10. Back to main menu"
        read -p "Enter your choice: " choice
        case $choice in
            1) cat /etc/passwd ;;
            2) read -p "Enter username: " username; sudo adduser "$username" ;;
            3) read -p "Enter username to delete: " username; sudo deluser "$username" ;;
            4) read -p "Enter username: " username; sudo passwd "$username" ;;
            5) read -p "Enter username: " username; read -p "Enter group name: " group; sudo usermod -aG "$group" "$username" ;;
            6) read -p "Enter username: " username; read -p "Enter group name: " group; sudo gpasswd -d "$username" "$group" ;;
            7) read -p "Enter username to lock: " username; sudo passwd -l "$username" ;;
            8) read -p "Enter username to unlock: " username; sudo passwd -u "$username" ;;
            9) last ;;
            10) break ;;
            *) echo "Invalid option" ;;
        esac
        read -p "Press enter to continue"
    done
}

# Security Operations Functions
security_operations_menu() {
    while true; do
        echo "Security Operations Menu"
        echo "1. View system logs"
        echo "2. Check for failed login attempts"
        echo "3. View current logged-in users"
        echo "4. Check listening ports"
        echo "5. View sudo commands history"
        echo "6. Check for rootkits"
        echo "7. Scan for vulnerabilities"
        echo "8. Check file integrity"
        echo "9. View SSH key fingerprints"
        echo "10. Back to main menu"
        read -p "Enter your choice: " choice
        case $choice in
            1) sudo tail -n 50 /var/log/syslog ;;
            2) sudo grep "Failed password" /var/log/auth.log ;;
            3) w ;;
            4) sudo netstat -tuln ;;
            5) sudo cat /var/log/auth.log | grep sudo ;;
            6) sudo rkhunter --check ;;
            7) sudo nmap localhost ;;
            8) sudo aide --check ;;
            9) for key in /etc/ssh/*.pub; do ssh-keygen -lf "$key"; done ;;
            10) break ;;
            *) echo "Invalid option" ;;
        esac
        read -p "Press enter to continue"
    done
}

# Package Management Functions
package_management_menu() {
    while true; do
        echo "Package Management Menu"
        echo "1. Update package lists"
        echo "2. Upgrade all packages"
        echo "3. Install a package"
        echo "4. Remove a package"
        echo "5. Search for a package"
        echo "6. List installed packages"
        echo "7. Show package information"
        echo "8. Clean package cache"
        echo "9. Check for broken dependencies"
        echo "10. Back to main menu"
        read -p "Enter your choice: " choice
        case $choice in
            1) sudo apt update ;;
            2) sudo apt upgrade ;;
            3) read -p "Enter package name: " package; sudo apt install "$package" ;;
            4) read -p "Enter package name: " package; sudo apt remove "$package" ;;
            5) read -p "Enter package name: " package; apt search "$package" ;;
            6) dpkg --list ;;
            7) read -p "Enter package name: " package; apt show "$package" ;;
            8) sudo apt clean ;;
            9) sudo apt check ;;
            10) break ;;
            *) echo "Invalid option" ;;
        esac
        read -p "Press enter to continue"
    done
}

# Service Management Functions
service_management_menu() {
    while true; do
        echo "Service Management Menu"
        echo "1. List all services"
        echo "2. Start a service"
        echo "3. Stop a service"
        echo "4. Restart a service"
        echo "5. Check status of a service"
        echo "6. Enable a service to start on boot"
        echo "7. Disable a service from starting on boot"
        echo "8. View service logs"
        echo "9. Reload service configuration"
        echo "10. Back to main menu"
        read -p "Enter your choice: " choice
        case $choice in
            1) systemctl list-units --type=service ;;
            2) read -p "Enter service name: " service; sudo systemctl start "$service" ;;
            3) read -p "Enter service name: " service; sudo systemctl stop "$service" ;;
            4) read -p "Enter service name: " service; sudo systemctl restart "$service" ;;
            5) read -p "Enter service name: " service; systemctl status "$service" ;;
            6) read -p "Enter service name: " service; sudo systemctl enable "$service" ;;
            7) read -p "Enter service name: " service; sudo systemctl disable "$service" ;;
            8) read -p "Enter service name: " service; journalctl -u "$service" ;;
            9) read -p "Enter service name: " service; sudo systemctl reload "$service" ;;
            10) break ;;
            *) echo "Invalid option" ;;
        esac
        read -p "Press enter to continue"
    done
}

# Performance Tuning Functions
performance_tuning_menu() {
    while true; do
        echo "Performance Tuning Menu"
        echo "1. View current CPU governor"
        echo "2. Change CPU governor"
        echo "3. View current swappiness"
        echo "4. Change swappiness"
        echo "5. View open file limits"
        echo "6. Change open file limits"
        echo "7. View current I/O scheduler"
        echo "8. Change I/O scheduler"
        echo "9. View network performance parameters"
        echo "10. Back to main menu"
        read -p "Enter your choice: " choice
        case $choice in
            1) cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor ;;
            2) read -p "Enter governor (e.g., performance, powersave): " gov; echo "$gov" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor ;;
            3) cat /proc/sys/vm/swappiness ;;
            4) read -p "Enter swappiness value (0-100): " swappiness; echo "$swappiness" | sudo tee /proc/sys/vm/swappiness ;;
            5) ulimit -n ;;
            6) read -p "Enter new limit: " limit; ulimit -n "$limit" ;;
            7) cat /sys/block/sda/queue/scheduler ;;
            8) read -p "Enter scheduler (e.g., noop, deadline, cfq): " scheduler; echo "$scheduler" | sudo tee /sys/block/sda/queue/scheduler ;;
            9) sysctl -a | grep net ;;
            10) break ;;
            *) echo "Invalid option" ;;
        esac
        read -p "Press enter to continue"
    done
}

# Backup and Restore Functions
backup_restore_menu() {
    while true; do
        echo "Backup and Restore Menu"
        echo "1. Create a full system backup"
        echo "2. Backup home directory"
        echo "3. Restore from full system backup"
        echo "4. Restore home directory"
        echo "5. Create incremental backup"
        echo "6. List available backups"
        echo "7. Verify backup integrity"
        echo "8. Clean old backups"
        echo "9. Schedule automatic backup"
        echo "10. Back to main menu"
        read -p "Enter your choice: " choice
        case $choice in
            1) sudo tar -cvpzf backup.tar.gz --exclude=/backup.tar.gz --one-file-system / ;;
            2) tar -cvzf home_backup.tar.gz /home ;;
            3) sudo tar -xvpzf backup.tar.gz -C / --numeric-owner ;;
            4) tar -xvzf home_backup.tar.gz -C / ;;
            5) read -p "Enter backup name: " name; sudo rsync -av --link-dest=../backup.1 / /path/to/backup/$name ;;
            6) ls -l /path/to/backups ;;
            7) read -p "Enter backup file: " file; tar -tvf "$file" ;;
            8) find /path/to/backups -type f -mtime +30 -delete ;;
            9) (crontab -l ; echo "0 2 * * * /path/to/backup_script.sh") | crontab - ;;
            10) break ;;
            *) echo "Invalid option" ;;
        esac
        read -p "Press enter to continue"
    done
}

# Log Management Functions
log_management_menu() {
    while true; do
        echo "Log Management Menu"
        echo "1. View system logs"
        echo "2. View auth logs"
        echo "3. View apache access logs"
        echo "4. View apache error logs"
        echo "5. Search logs for keyword"
        echo "6. Rotate logs"
        echo "7. Compress old logs"
        echo "8. Clear log file"
        echo "9. Monitor log file in real-time"
        echo "10. Back to main menu"
        read -p "Enter your choice: " choice
        case $choice in
            1) sudo tail -n 50 /var/log/syslog ;;
            2) sudo tail -n 50 /var/log/auth.log ;;
            3) sudo tail -n 50 /var/log/apache2/access.log ;;
            4) sudo tail -n 50 /var/log/apache2/error.log ;;
            5) read -p "Enter keyword: " keyword; read -p "Enter log file: " logfile; sudo grep "$keyword" "$logfile" ;;
            6) sudo logrotate -f /etc/logrotate.conf ;;
            7) sudo find /var/log -type f -regex ".*\.

[0-9]$" -exec gzip {} + ;;
            8) read -p "Enter log file to clear: " logfile; sudo truncate -s 0 "$logfile" ;;
            9) read -p "Enter log file to monitor: " logfile; sudo tail -f "$logfile" ;;
            10) break ;;
            *) echo "Invalid option" ;;
        esac
        read -p "Press enter to continue"
    done
}

# Scheduled Tasks Functions
scheduled_tasks_menu() {
    while true; do
        echo "Scheduled Tasks Menu"
        echo "1. List all cron jobs"
        echo "2. Add new cron job"
        echo "3. Remove cron job"
        echo "4. Edit crontab"
        echo "5. View scheduled tasks (at jobs)"
        echo "6. Schedule a new at job"
        echo "7. Remove at job"
        echo "8. List anacron jobs"
        echo "9. Add new anacron job"
        echo "10. Back to main menu"
        read -p "Enter your choice: " choice
        case $choice in
            1) crontab -l ;;
            2) read -p "Enter cron schedule and command: " cron_job; (crontab -l ; echo "$cron_job") | crontab - ;;
            3) crontab -r ;;
            4) crontab -e ;;
            5) atq ;;
            6) read -p "Enter time for job: " time; read -p "Enter command: " command; echo "$command" | at "$time" ;;
            7) read -p "Enter job number to remove: " job_num; atrm "$job_num" ;;
            8) cat /etc/anacrontab ;;
            9) read -p "Enter anacron job details: " anacron_job; echo "$anacron_job" | sudo tee -a /etc/anacrontab ;;
            10) break ;;
            *) echo "Invalid option" ;;
        esac
        read -p "Press enter to continue"
    done
}

# Hardware Information Functions
hardware_info_menu() {
    while true; do
        echo "Hardware Information Menu"
        echo "1. View CPU info"
        echo "2. View memory info"
        echo "3. View disk info"
        echo "4. View PCI devices"
        echo "5. View USB devices"
        echo "6. View network interfaces"
        echo "7. View BIOS info"
        echo "8. Check CPU temperature"
        echo "9. View graphics card info"
        echo "10. Back to main menu"
        read -p "Enter your choice: " choice
        case $choice in
            1) lscpu ;;
            2) free -h ;;
            3) lsblk -f ;;
            4) lspci ;;
            5) lsusb ;;
            6) ip link show ;;
            7) sudo dmidecode -t bios ;;
            8) sensors ;;
            9) lspci | grep VGA ;;
            10) break ;;
            *) echo "Invalid option" ;;
        esac
        read -p "Press enter to continue"
    done
}

# Virtualization Management Functions
virtualization_menu() {
    while true; do
        echo "Virtualization Management Menu"
        echo "1. List all VMs"
        echo "2. Start a VM"
        echo "3. Stop a VM"
        echo "4. Create a new VM"
        echo "5. Delete a VM"
        echo "6. Show VM details"
        echo "7. Connect to VM console"
        echo "8. Take VM snapshot"
        echo "9. Restore VM from snapshot"
        echo "10. Back to main menu"
        read -p "Enter your choice: " choice
        case $choice in
            1) virsh list --all ;;
            2) read -p "Enter VM name: " vm; virsh start "$vm" ;;
            3) read -p "Enter VM name: " vm; virsh shutdown "$vm" ;;
            4) read -p "Enter new VM name: " vm; virt-install --name "$vm" --memory 1024 --vcpus 1 --disk size=10 --cdrom /path/to/iso ;;
            5) read -p "Enter VM name to delete: " vm; virsh undefine "$vm" --remove-all-storage ;;
            6) read -p "Enter VM name: " vm; virsh dominfo "$vm" ;;
            7) read -p "Enter VM name: " vm; virsh console "$vm" ;;
            8) read -p "Enter VM name: " vm; read -p "Enter snapshot name: " snap; virsh snapshot-create-as "$vm" "$snap" ;;
            9) read -p "Enter VM name: " vm; read -p "Enter snapshot name: " snap; virsh snapshot-revert "$vm" "$snap" ;;
            10) break ;;
            *) echo "Invalid option" ;;
        esac
        read -p "Press enter to continue"
    done
}

# Docker Management Functions
docker_menu() {
    while true; do
        echo "Docker Management Menu"
        echo "1. List running containers"
        echo "2. List all containers"
        echo "3. Start a container"
        echo "4. Stop a container"
        echo "5. Remove a container"
        echo "6. Pull an image"
        echo "7. List images"
        echo "8. Remove an image"
        echo "9. View container logs"
        echo "10. Back to main menu"
        read -p "Enter your choice: " choice
        case $choice in
            1) docker ps ;;
            2) docker ps -a ;;
            3) read -p "Enter container name: " container; docker start "$container" ;;
            4) read -p "Enter container name: " container; docker stop "$container" ;;
            5) read -p "Enter container name: " container; docker rm "$container" ;;
            6) read -p "Enter image name: " image; docker pull "$image" ;;
            7) docker images ;;
            8) read -p "Enter image name: " image; docker rmi "$image" ;;
            9) read -p "Enter container name: " container; docker logs "$container" ;;
            10) break ;;
            *) echo "Invalid option" ;;
        esac
        read -p "Press enter to continue"
    done
}

# Main function to run the script
main() {
    while true; do
        show_main_menu
        read -p "Enter your choice: " main_choice
        case $main_choice in
            1) process_management_menu ;;
            2) system_monitoring_menu ;;
            3) file_system_menu ;;
            4) network_management_menu ;;
            5) user_management_menu ;;
            6) security_operations_menu ;;
            7) package_management_menu ;;
            8) service_management_menu ;;
            9) performance_tuning_menu ;;
            10) backup_restore_menu ;;
            11) log_management_menu ;;
            12) scheduled_tasks_menu ;;
            13) hardware_info_menu ;;
            14) virtualization_menu ;;
            15) docker_menu ;;
            16) echo "Exiting..."; exit 0 ;;
            *) echo "Invalid option" ;;
        esac
    done
}

# Run the main function
main
            