#!/bin/bash
set -e

# Install ComfyUI
cd /app
if [ ! -f "/app/.download-complete" ] ; then
    chmod +x /app/download.sh
    bash /app/download.sh
fi ;

echo "########################################"
echo "[INFO] Starting ComfyUI..."
echo "########################################"
cd /app
python3 ./ComfyUI/main.py --listen --port 8188 ${CLI_ARGS}
