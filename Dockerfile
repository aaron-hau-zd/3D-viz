FROM ubuntu:20.04
WORKDIR /3d_viz
COPY . /3d_viz

# Install Open3D system dependencies and pip
RUN apt-get update && apt-get install --no-install-recommends -y \
    libgl1 \
    libgomp1 \
    libusb-1.0-0 \
    libgl1-mesa-dev \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Install Open3D from the pypi repositories
RUN python3 -m pip install --no-cache-dir --upgrade open3d

# install jupyter and asyncio
RUN pip3 install jupyter asyncio

EXPOSE 8888
EXPOSE 8899

RUN cd /3d_viz
CMD ["jupyter", "notebook", "--port=8899", "--no-browser", "--ip=0.0.0.0", "--allow-root", "--NotebookApp.kernel_manager_class=notebook.services.kernels.kernelmanager.AsyncMappingKernelManager"]