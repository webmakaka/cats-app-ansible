# Развертывание приложения. Тестировалось в ubuntu linux 18.04.

Controller - хост с которого запускаем ansible скрипты.  
Node - узел, на котором запускается приложение.

1.  Установить vagrant
    https://www.vagrantup.com/

    \$ vagrant plugin install vagrant-hosts

2)

    $ cd ~
    $ git clone --depth=1 https://github.com/marley-nodejs/cats_app_ansible
    $ cd cats_app_ansible/vm/
    $ ssh-add ~/.vagrant.d/insecure_private_key
    $ vagrant box update
    $ vagrant up

3)

Двумя сессиями подключиться к созданным виртуальным машинам:

    $ vagrant ssh controller
    $ vagrant ssh node

<br/>

### Controller и Node

    $ sudo su  -
    # adduser --disabled-password --gecos "" ansible
    # usermod -aG sudo ansible
    # passwd ansible

    # vi /etc/ssh/sshd_config
    PasswordAuthentication yes

    # service sshd reload

<br/>

### Controller

    # vi /etc/ansible/hosts

добавить ip или достаточно hostname

    node

<br/>

    # su - ansible

    $ ssh-keygen -t rsa -b 2048 -f ~/.ssh/id_rsa -q -N ""

    $ ssh-copy-id ansible@node

    // Проверка подключения без ввода пароля
    $ ssh ansible@node
    exit

    // Устанавливаем python 2.x на сервер
    // $ ssh -tt server "sudo apt install -y python"

    $ cd ~
    $ git clone --depth=1 https://github.com/marley-nodejs/cats_app_ansible
    $ cd cats_app_ansible/
    $ ansible-playbook playbook.yaml -K

<br/>

nginx - http://192.168.56.102:80/

node - http://192.168.56.102:8080/

<br/>

![Application](/img/cat.png?raw=true)

<br/>

# TODO: Что нужно сделать!

- Передавать адрес сервера на котором должно разворачиваться приложение в командной строке
- Сообщение о результатах деплоя в slack и телеграм.
- Nginx должен работать по https
