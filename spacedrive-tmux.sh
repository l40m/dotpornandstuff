echo `df -k . | awk 'NR==2 {printf $5}'`
