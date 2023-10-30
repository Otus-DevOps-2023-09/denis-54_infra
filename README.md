# denis-54_infra
denis-54 Infra repository

HW: 4
Первая часть задания:

Использование bastion для доступа к хосту во внетренней сети:
ssh -J appuser@51.250.68.243 appuser@10.128.0.5
    где -J -опция указывающая на возможность использовать промежуточный хост
    51.250.68.243 - внешний ip-адрес бастион-зоста
    10.128.0.5 - внетренний ip-адрес someinternalhost

Второй вариант:
ssh -o ProxyCommand="ssh -W %h:%p appuser@51.250.68.243" appuser@10.128.0.5

Третий вариант (c алиасом):
    в ~/.ssh/config добавляем:

Host someinternalhost
    HostName 10.128.0.5
    User appuser
    ProxyCommand ssh -W %h:%p appuser@51.250.68.243

Команда подключения в данном случае будет выглядеть так:

ssh someinternalhost

Вторая часть задания:

bastion_IP = 51.250.68.243
someinternalhost_IP = 10.128.0.5

HW: 5
Тут приложены скрипты для
    Скрипт install_ruby.sh - установка Ruby;
    Скрипт install_mongodb.sh - установка MongoDB;
    Скрипт deploy.sh должен - скачиваниā кода, установка зависимостей через bundler и запуск приложения;
    Скрипт startup-script.sh - всё вместе;
    startup.yaml - файл с метой для создания ВМ;
testapp_IP = 51.250.1.183
testapp_port = 9292
