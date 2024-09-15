#!/bin/bash

# System Performance Monitoring Script

# Function to get CPU usage
get_cpu_usage() {
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
    echo "CPU Usage: $cpu_usage%"
}

# Function to get memory usage
get_memory_usage() {
    memory_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
    echo "Memory Usage: $memory_usage%"
}

# Function to get disk usage
get_disk_usage() {
    disk_usage=$(df -h / | awk '/\// {print $(NF-1)}' | sed 's/%//')
    echo "Disk Usage: $disk_usage%"
}

# Main function to log system performance
log_performance() {
    timestamp=$(date "+%Y-%m-%d %H:%M:%S")
    cpu=$(get_cpu_usage)
    memory=$(get_memory_usage)
    disk=$(get_disk_usage)
    
    echo "$timestamp" >> /var/log/system_performance.log
    echo "$cpu" >> /var/log/system_performance.log
    echo "$memory" >> /var/log/system_performance.log
    echo "$disk" >> /var/log/system_performance.log
    echo "-------------------" >> /var/log/system_performance.log
}

# Run the main function
log_performance

# To schedule this script with cron, add the following line to your crontab:
# */5 * * * * /path/to/this/script.sh

# This will run the script every 5 minutes. Adjust as needed.
