#!/bin/sh

MODEL_DIR="/root/.ollama/models/manifests/registry.ollama.ai/library/mistral"

ollama serve &

echo 'Waiting for Ollama service to start...'
sleep 30

if [ ! "$(ls -A $MODEL_DIR)" ]; then
    echo 'Models not found, downloading...'
    ollama pull mistral:latest
    ollama pull llama3:latest
    echo 'Models downloaded successfully.'
else
    echo 'Models already present, skipping download.'
fi

# Keep the container running
tail -f /dev/null
