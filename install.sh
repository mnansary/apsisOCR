#!/bin/sh

# generall reqs
pip install numpy matplotlib opencv-python pandas tqdm termcolor
pip install -U gdown
# recognizer reqs
pip install bnunicodenormalizer
# api
pip install flask flask_cors
# app 
pip install streamlit

if [ $1 == "gpu" ]; then    # GPU installation
    echo "Installing GPU-specific packages"
    conda install cudatoolkit
    conda install cudnn
    # for recognizer and classifer
    pip install onnxruntime-gpu
    # for detector and svtr
    python -m pip install -U fastdeploy-gpu-python -f https://www.paddlepaddle.org.cn/whl/fastdeploy.html
    # exporting environment variables
    mkdir -p $CONDA_PREFIX/etc/conda/activate.d
    5echo 'export LD_LIBRARY_PATH=$CUDNN_PATH/lib:$CONDA_PREFIX/lib/:$LD_LIBRARY_PATH' >> $CONDA_PREFIX/etc/conda/activate.d/env_vars.sh
else
    echo "Installing CPU-specific packages"
    # CPU installation
    # for recognizer and classifer
    pip install onnxruntime
    # for detector and svtr
    pip install fastdeploy-python -f https://www.paddlepaddle.org.cn/whl/fastdeploy.html
fi

pip install .

