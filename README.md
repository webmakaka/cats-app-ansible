# Развертывание приложения. Тестировалось в ubuntu linux 18.04.

Controller - хост с которого запускаем ansible скрипты.  
Node - узел, на котором запускается приложение.

1.  Установить vagrant
    https://www.vagrantup.com/

    \$ vagrant plugin install vagrant-hosts

2)

    $ cd ~
    $ git clone --depth=1 https://github.com/marley-nodejs/cats-app-ansible.git
    $ cd cats-app-ansible/vm/
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

    # sed -i "s/.*PasswordAuthentication.*/PasswordAuthentication yes/g" /etc/ssh/sshd_config
    # service sshd reload

<br/>

### Controller

<br/>

    # su - ansible

    $ ssh-keygen -t rsa -b 2048 -f ~/.ssh/id_rsa -q -N ""

    $ ssh-copy-id ansible@node

    // Проверка подключения без ввода пароля
    $ ssh ansible@node
    exit

    $ cd ~
    $ git clone --depth=1 https://github.com/marley-nodejs/cats-app-ansible
    $ cd cats-app-ansible/
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

---

**Marley**

<a href="https://jsdev.org">jsdev.org</a>
