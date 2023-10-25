# denis-54_infra
denis-54 Infra repository

Первая часть задания:

Использование bastion для доступа к хосту во внетренней сети:
ssh -J appuser@51.250.75.102 appuser@10.128.0.32
    где -J -опция указывающая на возможность использовать промежуточный хост
    51.250.75.102 - внешний ip-адрес бастион-зоста
    10.128.0.32 - внетренний ip-адрес someinternalhost

Второй вариант:
ssh -o ProxyCommand="ssh -W %h:%p appuser@51.250.75.102" appuser@10.128.0.32

Третий вариант (c алиасом):
    в ~/.ssh/config добавляем:

Host someinternalhost
    HostName 10.128.0.32
    User appuser
    ProxyCommand ssh -W %h:%p appuser@51.250.75.102

Команда подключения в данном случае будет выглядеть так:

ssh someinternalhost

Вторая часть задания:

bastion_IP = 158.160.120.193
someinternalhost_IP = 10.128.0.32
