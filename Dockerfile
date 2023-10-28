FROM pytorch/pytorch
WORKDIR /

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

# system
RUN apt-get update -yq && apt-get upgrade -yq && \
    DEBIAN_FRONTEND=noninteractive apt install -yq --no-install-recommends \
    apt-utils git && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Python packages for ComfyUI with ComfyUI-Manager
WORKDIR /ComfyUI
COPY comfyui/requirements.txt requirements.txt
COPY manager/requirements.txt manager_requirements.txt
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir --upgrade -r requirements.txt && \
    pip install --no-cache-dir --upgrade -r manager_requirements.txt

# run
# python3 main.py
# --listen [ip address] --port 8188
# --disable-xformers
# --disable-smart-memory
# --gpu-only / --highvram / --normalvram (default) / --lowvram / --novram / --cpu 
# --force-fp32 / --force-fp16
# --use-pytorch-cross-attention (default)
# --cuda-malloc (default) / --disable-cuda-malloc
ENTRYPOINT ["python3", "main.py", "--listen", "--port", "8188", "--highvram"]
