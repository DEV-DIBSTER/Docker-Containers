#!/bin/bash

# Signal handling for graceful shutdown
terminate() {
    echo "Shutting down gracefully..."
    # Send termination signal to the main process
    kill -TERM "$SERVER_PID"
    wait "$SERVER_PID"
    exit 0
}

# Trap termination signals
trap terminate SIGTERM SIGINT

# Move to the working directory
cd /home/container

# Replace startup variables
MODIFIED_STARTUP=$(eval echo $(echo "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g'))
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Start the server as the main foreground process
echo "Starting the server..."
${MODIFIED_STARTUP} &
SERVER_PID=$!

# Wait for the server process to finish
wait "$SERVER_PID"

# Exit with the server process's exit code
EXIT_CODE=$?
echo "Server process exited with code: $EXIT_CODE"
exit $EXIT_CODE
