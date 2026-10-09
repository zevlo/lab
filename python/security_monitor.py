import socket
import requests
import re

def grab_banner(host, port):
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.settimeout(2)
        s.connect((host, port))
        request = f"GET / HTTP/1.1\r\nHost: {host}\r\n\r\n"
        s.sendall(request.encode())
        response = s.recv(1024).decode()
        s.close()
        for line in response.split('\r\n'):
            if line.startswith('Server:'):
                return line.split(': ')[1].strip()
        return "Unknown"
    except Exception as e:
        return f"Error: {str(e)}"

def check_auth(url, username, password):
    try:
        response = requests.get(url, auth=(username, password), timeout=3)
        if response.status_code == 200:
            return response.text
        else:
            return f"Authentication failed with status code: {response.status_code}"
    except Exception as e:
        return f"Request Error: {str(e)}"

def parse_logs(log_file):
    suspicious_ips = set()
    pattern = re.compile(r'^(\d{1,3}(?:\.\d{1,3}){3}).*" 401 ')
    try:
        with open(log_file, 'r') as f:
            for line in f:
                match = pattern.search(line)
                if match:
                    suspicious_ips.add(match.group(1))
    except Exception as e:
        return [f"Error reading log: {str(e)}"]
    return list(suspicious_ips)

def main():
    # Configuration
    host = '127.0.0.1'
    port = 8080
    auth_url = f'http://{host}:{port}/auth'
    log_file = '/home/labex/project/access.log'
    output_file = '/home/labex/project/security_summary.txt'

    # Gather data
    banner = grab_banner(host, port)
    auth_status = check_auth(auth_url, 'admin', 'secret')
    suspicious_ips = parse_logs(log_file)

    # Format report
    report = "--- Daily Security Summary ---\n"
    report += f"Server Banner: {banner}\n"
    report += f"Authentication Check: {auth_status}\n"
    report += "Suspicious IPs (401 Unauthorized):\n"
    
    if suspicious_ips:
        for ip in suspicious_ips:
            report += f" - {ip}\n"
    else:
        report += " - None detected\n"

    # Write to file
    with open(output_file, 'w') as f:
        f.write(report)
        
    print(f"Security summary successfully generated at {output_file}")

if __name__ == '__main__':
    main()
