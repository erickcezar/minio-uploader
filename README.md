# Vagrant
Utilizei o vagrant para um ambiente de teste, adaptando o minio para executar com docker e ansible.

# Ansible
Utilizei o ansible para realizar a automação da instalação de pacotes necessários e utilizar o módulo docker para instalação do minio.
Com a instalação do ansible, veio junto o python 2.7. 
Para o ansible utilizar a versão correta adicionei a seguinte linha no arquivo /etc/ansible/hosts:

localhost-py3 ansible_host=localhost ansible_connection=local ansible_python_interpreter=/usr/bin/python3

O "localhost-py3" é o ubuntu que rodará a aplicação.
Os playbooks do ansible estão no diretório "setup-configs":

setup-playbook.yaml -> responsável pela instalação dos pacotes necessários para o python3 e pipenv
docker-minio.yaml -> responsável por instalar os módulos do docker e startar o minio na porta 9000.

# Shell
Criei um script shell para levantar a aplicação com o gunicorn.
Como instalei o python2.7 nesse processo, indiquei no scriṕt para utilizar o gunicorn3, usando a versão 3 do python.

# Travis CI
Como a aplicação está rodando em um único servidor, utilizei o Travis com um SSH.
Fiz toda a criptografia da chave, utilizando a gem travis. Ao realizar o teste da aplicação, o deploy é realizado via rsync com as chaves
ssh criada no servidor ubuntu e adicionada no .travis.yml.
