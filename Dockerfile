FROM nvidia/cuda:12.4.1-cudnn-devel-ubuntu22.04
RUN apt-get update
RUN apt-get -y install python3-pip git libgl1-mesa-glx libglib2.0-0 libsm6 libxrender1 libxext6 ffmpeg
RUN pip install --upgrade pip wheel setuptools Cython numpy
RUN pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu121
COPY files/entrypoint.sh  /app/entrypoint.sh
COPY files/download.sh  /app/download.sh
COPY files/download.txt  /app/download.txt
VOLUME /app
WORKDIR /app
RUN pip install --break-system-packages \
        -r https://raw.githubusercontent.com/comfyanonymous/ComfyUI/master/requirements.txt \
        -r https://raw.githubusercontent.com/ltdrdata/ComfyUI-Impact-Pack/Main/requirements.txt \
        -r https://raw.githubusercontent.com/ltdrdata/ComfyUI-Impact-Subpack/main/requirements.txt \
        -r https://raw.githubusercontent.com/ltdrdata/ComfyUI-Inspire-Pack/main/requirements.txt \
        -r https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/requirements.txt
EXPOSE 8188
CMD ["bash","/app/entrypoint.sh"]
