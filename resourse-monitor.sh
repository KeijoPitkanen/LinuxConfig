top -b -d 1 -n 120 > metrics.log && grep -E "Cpu\(s\)|Tasks|MiB Mem" metrics.log | awk '/^%Cpu/ 
{ cpu_total_sum += $2 + $4; cpu_total_count++ } 
/^Tasks/ { task_total_sum += $2; task_total_count++; task_running_sum += $4; task_running_count++ }
/^MiB Mem/ { total_mem = $4; used_mem_sum += $8 / total_mem * 100; mem_used_count++ } END 
{ print "Average CPU Usage (User + System): " cpu_total_sum / cpu_total_count "%";
print "Average Total Tasks: " task_total_sum / task_total_count;
print "Average Running Tasks: " task_running_sum / task_running_count;
print "Average Memory Used: " used_mem_sum / mem_used_count "%" }' 
