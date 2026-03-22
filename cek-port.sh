#!/bin/bash

# URUTAN TAMPILAN (ini yang menentukan urutan)
server_order=(
  
)

# Alias => domain (domain tidak ditampilkan)
declare -A servers=(
  
)

# Port + label
declare -A ports=(
  [22]="VPS LOGIN"
)

green="\e[32m"; red="\e[31m"; nc="\e[0m"

echo "🔍 Cek status server"
echo "-------------------------------------------"

for alias in "${server_order[@]}"; do
  host="${servers[$alias]}"
  echo -e "\n🌐 Server: $alias"

  port=22
  timeout 2 bash -c "</dev/tcp/$host/$port" &>/dev/null
  if [[ $? -eq 0 ]]; then
    echo -e "  Port $port (${ports[$port]}): ${green}OPEN${nc}"
  else
    echo -e "  Port $port (${ports[$port]}): ${red}CLOSED${nc}"
  fi
done
