#!/bin/bash

echo "########################################"
echo "[INFO] Downloading ComfyUI & Manager..."
echo "########################################"

set -euxo pipefail

# ComfyUI
cd /app
git clone --depth=1 --no-tags --recurse-submodules --shallow-submodules \
    https://github.com/comfyanonymous/ComfyUI.git \
    || (cd /app/ComfyUI && git pull)

# ComfyUI Manager
cd /app/ComfyUI/custom_nodes
git clone --depth=1 --no-tags --recurse-submodules --shallow-submodules \
    https://github.com/ltdrdata/ComfyUI-Manager.git \
    || (cd /app/ComfyUI/custom_nodes/ComfyUI-Manager && git pull)

cd /app/ComfyUI/custom_nodes
git clone --depth=1 --no-tags --recurse-submodules --shallow-submodules \
    https://github.com/ltdrdata/ComfyUI-Impact-Pack.git \
    || (cd /app/ComfyUI/custom_nodes/ComfyUI-Impact-Pack && git pull)

cd /app/ComfyUI/custom_nodes
git clone --depth=1 --no-tags --recurse-submodules --shallow-submodules \
    https://github.com/ltdrdata/ComfyUI-Impact-Subpack.git \
    || (cd /app/ComfyUI/custom_nodes/ComfyUI-Impact-Subpack && git pull && python3 install.py)

cd /app/ComfyUI/custom_nodes
git clone --depth=1 --no-tags --recurse-submodules --shallow-submodules \
    https://github.com/ltdrdata/ComfyUI-Inspire-Pack.git \
    || (cd /app/ComfyUI/custom_nodes/ComfyUI-Inspire-Pack && git pull)

cd /app/ComfyUI/custom_nodes
git clone --depth=1 --no-tags --recurse-submodules --shallow-submodules \
    https://github.com/rgthree/rgthree-comfy.git \
    || (cd /app/ComfyUI/custom_nodes/rgthree-comfy && git pull)
    
# Finish
touch /app/.download-complete
