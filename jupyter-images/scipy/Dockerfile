FROM jupyter/scipy-notebook:latest

MAINTAINER Leonard Aukea <leonard.aukea@volvocars.com>

RUN conda install --quiet --yes --channel plotly && \
    conda config --add channels conda-forge && \
    conda install cookiecutter -y && \
    conda clean -tipsy && \
    jupyter labextension install @jupyterlab/plotly-extension @jupyterlab/toc @mflevine/jupyterlab_html @jupyterlab/celltags && \
    npm cache clean --force && \
    rm -rf /home/$NB_USER/.cache/yarn

ENV NB_PREFIX /

CMD ["sh","-c", "jupyter notebook --notebook-dir=/home/jovyan --ip=0.0.0.0 --no-browser --allow-root --port=8888 --NotebookApp.token='' --NotebookApp.password='' --NotebookApp.allow_origin='*' --NotebookApp.base_url=${NB_PREFIX}"]
