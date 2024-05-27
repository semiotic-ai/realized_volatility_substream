#!/bin/bash

# Replace 'your-api-key' with your actual API key
API_KEY="server_b554992dda57297b8df60748ed61a10e"
LIFETIME=3600

# Check if jq is installed
if ! command -v jq &> /dev/null
then
    echo "jq could not be found, please install it to run this script."
    exit 1
fi

# Get the token from the authentication service
RESPONSE=$(curl -s https://auth.streamingfast.io/v1/auth/issue --data-binary "{\"api_key\": \"${API_KEY}\", \"lifetime\": ${LIFETIME}}")

# Extract the token from the response
TOKEN=$(echo $RESPONSE | jq -r '.token')

# Check if the token was successfully extracted
if [ -z "$TOKEN" ]; then
    echo "Failed to retrieve the token."
    exit 1
fi

# Export the token as an environment variable
export SUBSTREAMS_API_TOKEN="$TOKEN"

# Optionally, you can print the token to verify
echo "SUBSTREAMS_API_TOKEN: $SUBSTREAMS_API_TOKEN"

