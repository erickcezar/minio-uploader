# Vagrant
Adicionado vagrant ao projeto para executar testes com o ansible.
O primeiro passo foi criar o playbook que instale as dependências e também 
realizar o deploy do minio docker para utilizar com o flask, apenas para testes em um ubuntu.

# Ansible
Para executar o playbook no localhost, foi necessário a instalação do python
2.7 quando executei apt install ansible.
Para o playbook executar com o python 3, adicionei a seguinte linha no hosts do /etc/ansible/:

localhost-py3 ansible_host=localhost ansible_connection=local ansible_python_interpreter=/usr/bin/python3

Dentro do diretório "setup-configs" estão os playbooks:

setup-playbook.yaml - Responsável por instalar o python 3, fazer o download do repositório no git e instalar todas as dependências do docker
docker-minio.yaml - Responsável por iniciar o minio com as credenciais necessárias

# Shell script
Dentro do diretório "src" que contém os fontes da aplicação há o startup.sh para carregar as variáveis e iniciar a aplicação.

# Travis CI
