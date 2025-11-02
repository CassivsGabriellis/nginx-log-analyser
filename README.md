# Nginx Log Analyser

This script reads a Nginx log file and provides the following:

1. Top 5 IP addresses with the most requests

2. Top 5 most requested paths

3. Top 5 response status codes

4. Top 5 user agents

## Requirements

- This script file needs to be run in a Unix-based system (Linux/macOS)
- A Nginx access log file is needed (in a standard log format)
- You need the following core Linux command-line tools: `awk`, `sort`, `unique` and `head`.

## Usage

1. Clone this repository.
2. Make the script executable:
```shell
chmod +x log-analyser.sh
```
3. Run the above mentioned script with the log file as argument:
```shell
./log-analyser.sh <nginx-log-file>.log
```
4. It'll show the following output:
```shell
Top 5 IP addresses with the most requests:
178.128.94.113 - 1087 requests
142.93.136.176 - 1087 requests
138.68.248.85 - 1087 requests
159.89.185.30 - 1086 requests
86.134.118.70 - 277 requests

Top 5 most requested paths:
/v1-health - 4560 requests
/ - 270 requests
/v1-me - 232 requests
/v1-list-workspaces - 127 requests
/v1-list-timezone-teams - 75 requests

Top 5 response status codes:
200 - 5740 requests
404 - 937 requests
304 - 621 requests
400 - 192 requests
"-" - 31 requests

Top 5 user agents:
DigitalOcean - 4347 requests
Mozilla/5.0 - 513 requests
Mozilla/5.0 - 332 requests
Custom-AsyncHttpClient - 294 requests
Mozilla/5.0 - 282 requests
```