#!/bin/bash
# Comandos do job, em bash (o job.yaml aponta para cá em script:). Rode com:
#   sauron submit -f job.yaml

set -e

# segredos ficam num .env na pasta do projeto, nunca no job.yaml
source .env 2>/dev/null || true

# dependências num venv na pasta do projeto, sobre os pacotes da imagem
export PYTHONNOUSERSITE=1
python -m venv --without-pip --system-site-packages .venv
. .venv/bin/activate
python -m pip install -r requirements.txt

python train.py --epochs 50
