FROM jupyter/scipy-notebook:latest

MAINTAINER Leonard Aukea <leonard.aukea@volvocars.com>

RUN conda update -y -n base conda && \
    conda config --add channels conda-forge && \
    conda install -y conda-build && \
    conda install -y -c conda-forge -y nodejs jupyterlab ipywidgets cookiecutter black jupyterlab_code_formatter && \
    conda install -y -c plotly plotly_express && \
    conda build purge-all 

RUN pip install https://storage.googleapis.com/ml-pipeline/release/latest/kfp.tar.gz --upgrade && \
    pip install fairing

RUN jupyter labextension install @jupyterlab/toc @ryantam626/jupyterlab_code_formatter --no-build && \
    jupyter serverextension enable --py jupyterlab_code_formatter && \
    jupyter lab build  

ENV NB_PREFIX /

CMD ["sh","-c", "jupyter lab --notebook-dir=/home/jovyan --ip=0.0.0.0 --no-browser --allow-root --port=8888 --LabApp.token='' --LabApp.password='' --LabApp.allow_origin='*' --LabApp.base_url=${NB_PREFIX}"]
