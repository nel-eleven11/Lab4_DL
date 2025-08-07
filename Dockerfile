FROM python:3.9-slim

# Evitar prompts de configuración
ENV DEBIAN_FRONTEND=noninteractive

# Instalar dependencias del sistema
RUN apt-get update && apt-get install -y \
    build-essential \
    libsm6 \
    libxext6 \
    libxrender-dev \
    && rm -rf /var/lib/apt/lists/*

# Instalar Jupyter y dependencias de Python - SIN CUDA, CON Intel Extension
RUN pip install --no-cache-dir \
    spacy \
    jupyter \
    torch==2.1.0 \
    torchvision \
    torchtext \
    intel-extension-for-pytorch \
    nltk \
    datasets \
    "numpy<2"

# Descargar modelos de spaCy
RUN python -m spacy download en_core_web_sm && \
    python -m spacy download de_core_news_sm

# Preparar NLTK
RUN python -m nltk.downloader stopwords

# Variables de entorno para Intel GPU
ENV SYCL_DEVICE_FILTER=gpu
ENV LIBVA_DRIVER_NAME=iHD

# Crear directorio para notebooks
WORKDIR /workspace
VOLUME /workspace

# Exponer el puerto del Jupyter
EXPOSE 8888

# Script de inicio con diagnósticos
RUN echo '#!/bin/bash\n\
echo "Intel GPU Check:"\n\
python3 -c "import torch; print(f\"PyTorch: {torch.__version__}\"); import intel_extension_for_pytorch as ipex; print(f\"Intel Ext: {ipex.__version__}\"); print(f\"XPU available: {torch.xpu.is_available() if hasattr(torch, \"xpu\") else \"Not available\"}\")"\n\
jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token=\"\" --NotebookApp.password=\"\"\n\
' > /start.sh && chmod +x /start.sh

CMD ["/start.sh"]