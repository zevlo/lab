import socket

target_ip = "127.0.0.1"
target_port = 8080
timeout_seconds = 3.0

# Using a context manager automatically closes the socket upon exit
try:
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        # Prevent indefinite blocking on connect and recv
        s.settimeout(timeout_seconds)

        print(f"Connecting to {target_ip}:{target_port}...")
        s.connect((target_ip, target_port))
        print("Connected successfully.")

        # Receive the banner
        banner_bytes = s.recv(1024)

        if not banner_bytes:
            print("Connected, but the remote host closed the connection without sending data.")
        else:
            # errors='replace' prevents UnicodeDecodeError on non-UTF-8 bytes
            banner_string = banner_bytes.decode('utf-8', errors='replace').strip()
            print("Service Banner Received:")
            print(banner_string)

except socket.timeout:
    print(f"Error: Connection or read operation timed out after {timeout_seconds}s.")

except ConnectionRefusedError:
    print(f"Error: Connection refused. No service is listening on port {target_port}.")

except socket.gaierror:
    print(f"Error: Address resolution failed for host '{target_ip}'.")

except OSError as e:
    print(f"Socket error occurred: {e}")
