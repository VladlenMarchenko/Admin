#!/bin/bash
source_dir="$1"
backup_dir="$2"
timestamp=$(date +%Y-%m-%d)
backup_file="${backup_dir}/$(basename "$source_dir")_${timestamp}.tar.gz"

tar -czf "$backup_file" -C "$(dirname "$source_dir")" "$(basename "$source_dir")"
echo "Ydalil .gz > 7 days" 
find "$backup_dir" -type f -name "*.gz" -mtime +7 -exec rm -fv {} \;
echo "END all nice"
exit 0
