# denis-54_infra
denis-54 Infra repository

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
