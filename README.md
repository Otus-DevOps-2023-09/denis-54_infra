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

HW: 6
    Установли Paker
    Создали сервисный аккаунт
    Делегировали права этому аккаунту
    Создали шаблон для Packer
    Выполнили сборку образа
    Создали ВМ с использованием полученного образа, проверили.
    Параметризировали шаблон
    Построение bake-образа
    Автоматизация создания ВМ

HW:7, Terraform-2
    сделано два окружения prod и stage
    логика создания vpc с ruby, mongodb и установкой приложения вынесена в модули
    создан скрипт для создания бакетов для бекенда terraform
    выполнены все задания со *
        открывается порт на mongodb
        IP адрес базы данных используется приложением
        приложение стартует и работает

HW:8, Управление конфигурацией. Знакомство с Ansible 
    Основное задание:
    Установка ansible
    Составлен inventory файла
    Протестированы ansible модули без плейбуков
    Настроены параметры в файле ansible.cfg
    Модернизирован inventory файл - составлены группы хостов
    Составлен и протестирован inventory файла yaml формата
    Протестированы модули command, shell, service, git
    Создан и протестирован плейбук clone.yml

    Дополнительное задание:
    Создан скрипт динамического inventory формата json - inventory.sh
    При указании в качестве инвентори этого скрипта, будет передан json inventory с адресами, полученными от terraform output.
