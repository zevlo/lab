  1 #!/bin/bash
  2  
  3 if [ $# -eq 0 ]; then
  4   echo "Usage: $0 <username>"
  5   exit 1
  6 fi
  7  
  8 USER_NAME=$1
  9  
 10 if id "$USER_NAME" &> /dev/null; then
 11   echo "User $USER_NAME already exists."
 12   exit 1
 13 fi
 14  
 15 echo "Creating user $USER_NAME..."
 16 sudo useradd -m -s /bin/bash "$USER_NAME"
 17  
 18 echo "Setting up work directory..."
 19 sudo mkdir -p "/home/$USER_NAME/work"
 20 sudo chown "$USER_NAME:$USER_NAME" "/home/$USER_NAME/work"
 21  
 22 # Logging
 23 LOG_FILE="/home/labex/project/onboard.log"
 24 echo "[$(date)] User $USER_NAME created." >> "$LOG_FILE"
 25  
 26 echo "User setup complete."  
