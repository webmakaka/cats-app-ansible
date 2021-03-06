# Развертывание приложения. Тестировалось в ubuntu linux 20.04.

Controller - хост с которого запускаем ansible скрипты.  
Node - узел, на котором запускается приложение.

1)  Установить vagrant
    https://www.vagrantup.com/

<br/>

    // Устанавливаем доп плагины
    $ vagrant plugin install vagrant-hosts
    $ vagrant plugin install vagrant-hostmanager

2)

    $ cd ~
    $ git clone --depth=1 https://github.com/marley-nodejs/cats-app-ansible.git
    $ cd cats-app-ansible/vm/
    $ ssh-add ~/.vagrant.d/insecure_private_key
    $ vagrant box update
    $ vagrant up

<br/>

    $ vagrant status
    Current machine states:

    controller                running (virtualbox)
    node                      running (virtualbox)


<br/>

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

    // Подтвеждаем, что хотим подключиться, вводим пароль, копируем ключ
    $ ssh-copy-id ansible@node

    // Проверка подключения без ввода пароля
    $ ssh ansible@node

    // Если удалось подключиться, все ОК. Выходим и продолжаем.
    $ exit

<br/>

    $ cd ~
    $ git clone --depth=1 https://github.com/marley-nodejs/cats-app-ansible.git
    $ cd cats-app-ansible/

<br/>

### Вариант простой установки


    $ ansible-playbook playbook-simple.yaml -K

<br/>

### Вариант с инсталляцией docker (Работает но требует улучшений)

* Устанавливает docker на удаленном хосте
* Собирает приложение в имидж
* Запускает контейнер с приложением
* Поднимается nginx локально как proxy (возможно, нужно перенести в контейнер)

<br/>

    $ ansible-playbook playbook-docker.yaml -K

<br/>

nginx - http://192.168.0.12:80/

node - http://192.168.0.12:8080/

<br/>

![Application](/img/cat.png?raw=true)



<br/>

---

<br/>

**Marley**

Any questions in english: <a href="https://jsdev.org/chat/">Telegram Chat</a>  
Любые вопросы на русском: <a href="https://jsdev.ru/chat/">Телеграм чат</a>
