#!/bin/bash

service_name="jupiter-service"
service_file="/etc/systemd/system/$service_name.service"
working_directory="/home/ubuntu/sd-startup"
script_path="$working_directory/startup.sh"

# Check if the service file exists
if [ -e "$service_file" ]; then
  echo "Service file already exists. Updating the service..."
else
  echo "Creating a new service file..."
fi

# Create or update the service file
cat <<EOL | sudo tee "$service_file" >/dev/null
[Unit]
Description=Jupiter Service
After=network.target

[Service]
Type=simple
WorkingDirectory=$working_directory
ExecStart=$script_path
Restart=always
RestartSec=10
User=ubuntu

[Install]
WantedBy=multi-user.target
EOL

# Reload systemd and enable/start the service
sudo systemctl daemon-reload
sudo systemctl enable "$service_name"

# Display the service status
sudo systemctl status "$service_name"
