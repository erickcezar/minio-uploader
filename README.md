# Vagrant
Utilizei o vagrant para um ambiente de teste, adaptando o minio para executar com docker e ansible.
Só depois de validar os playbooks, executei dentro do host ubuntu.

# Ansible
Utilizei o ansible para realizar a automação da instalação de pacotes necessários e utilizar o módulo docker para instalação do minio.
Com a instalação do ansible, veio junto o python 2.7. 
Para o ansible utilizar a versão correta adicionei a seguinte linha no arquivo /etc/ansible/hosts:

localhost-py3 ansible_host=localhost ansible_connection=local ansible_python_interpreter=/usr/bin/python3

O "localhost-py3" é o ubuntu que rodará a aplicação.
Os playbooks do ansible estão no diretório "setup-configs":

setup-playbook.yaml -> responsável pela instalação dos pacotes necessários para o python3, pipenv e docker.
docker-minio.yaml -> responsável por fazer o deploy e start do minio na porta 9000.

# Shell
Criei um script shell para levantar a aplicação com o gunicorn.
Como instalei o python2.7 nesse processo, indiquei no script para utilizar o gunicorn3, usando a versão 3 do python.
Dentro do script, também são carregadas as variáveis de ambiente para o Minio.

# Travis CI
Como a aplicação está rodando em um único servidor, utilizei o Travis com um SSH.
Fiz toda a criptografia da chave, utilizando a gem travis. Ao realizar o teste da aplicação, o deploy é realizado via rsync com as chaves
ssh criada no servidor ubuntu e adicionada no .travis.yml.

# Gunicorn
Com a instalação do python 2.7, precisei instalar o gunicorn3 para utilizar a versão do python correta.
Dentro do script startup.php adicionei a seguinte linha: 

gunicorn3 --bind 0.0.0.0:5000 wsgi:app --reload --log-file gunicorn.log &

Essa linha manda as logs para um arquivo, sem precisar imprimir tudo na tela. E a flag reload ajusta na hora que o travis realiza o rsync
para o diretório onde a aplicação está executando. Dessa forma, o próprio gunicorn faz um reload com os arquivos atualizados.
