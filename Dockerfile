FROM pytorch/pytorch
WORKDIR /

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

# system
RUN apt update -yq && \
    DEBIAN_FRONTEND=noninteractive apt install -yq --no-install-recommends \
    apt-utils git && \
    rm -rf /var/lib/apt/lists/*

# Python packages for ComfyUI
WORKDIR /ComfyUI
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir --upgrade psutil && \
    pip install --no-cache-dir --upgrade -r requirements.txt && \
    pip install --no-cache-dir --upgrade torch torchvision torchaudio

# run
# python3 main.py
# --listen --port 8188
# --disable-xformers --gpu-only
# --force-fp32 --use-pytorch-cross-attention
ENTRYPOINT ["python3", "main.py", "--listen", "--port", "8188", "--disable-xformers", "--gpu-only"]
