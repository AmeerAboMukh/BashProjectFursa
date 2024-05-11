#!/bin/bash

# Greet the user
echo "Hello $USER"

# Define COURSE_ID environment variable
export COURSE_ID="DevOpsFursa"

# Check permissions of .token file
if [ -e ~/.token ]; then
    # Retrieve the permissions of the .token file
    permissions=$(stat -c "%a" ~/.token)

    # Check if permissions are different from 600
    if [ "$permissions" != "600" ]; then
        echo "Warning: .token file has too open permissions"
    fi
fi

# Change the Umask for permission r & w only for user and group
umask 0006

# Add to PATH
PATH=$PATH:/home/$USER/usercommands

# Print the current date on screen in ISO 8601 format
echo "The current date is: $(date -u +"%Y-%m-%dT%H:%M:%S%:z")"

# Define a command alias
alias ltxt='ls *.txt'

# Create or clean ~/tmp directory
if [ -d ~/tmp ]; then
    rm -rf ~/tmp/*
else # if ~/tmp does not exists
    mkdir ~/tmp
fi

# If a process exists then Kill it by bound to port 8080
fuser -k 8088/tcp