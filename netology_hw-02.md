# netology_hw-02
## Домашнее задание к занятию «Система мониторинга Zabbix» - Малявко Сергей

#### Установлен Zabbix Server и 2 агента, Apache, PHP и PostgreSQL

#### Задание 1

1) ![Скриншот авторизации в админке рис. 1](https://github.com/SERMSN/netology/blob/main/hw-02-3.png)
2) Текст использованных команд
Установка Zabbix Server с веб-интерфейсом на Ubuntu
```bash
sudo apt update
sudo apt upgrade -y
sudo apt install -y postgresql postgresql-contrib

# Установка зависимостей
sudo apt install -y wget curl gnupg2 software-properties-common

# Добавление репозитория Zabbix
wget https://repo.zabbix.com/zabbix/6.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.4-1+ubuntu22.04_all.deb
sudo dpkg -i zabbix-release_6.4-1+ubuntu22.04_all.deb
sudo apt update

# Установка компонентов Zabbix
sudo apt install -y zabbix-server-pgsql zabbix-frontend-php zabbix-apache-conf zabbix-sql-scripts zabbix-agent

sudo -u postgres createuser --pwprompt zabbix
sudo -u postgres createdb -O zabbix zabbix
zcat /usr/share/zabbix-sql-scripts/postgresql/server.sql.gz | sudo -u zabbix psql zabbix
sudo nano /etc/zabbix/zabbix_server.conf # Установка параметров

sudo nano /etc/php/8.1/apache2/php.ini

sudo systemctl restart zabbix-server zabbix-agent apache2
sudo systemctl enable zabbix-server zabbix-agent apache2

sudo systemctl status zabbix-server
sudo systemctl status zabbix-agent
sudo systemctl status apache2
``` 

#### Задание 2

![Раздела Configuration > Hosts рис. 1](https://github.com/SERMSN/netology/blob/main/hw-02-6.png)
![скриншот раздела Monitoring > Latest data для обоих хостов, где видны поступающие от агентов данные рис. 2](https://github.com/SERMSN/netology/blob/main/hw-02-5.png)

Установите Zabbix Agent на два хоста.
```bash

wget https://repo.zabbix.com/zabbix/7.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_7.0-1+ubuntu24.04_all.deb
sudo dpkg -i zabbix-release_7.0-1+ubuntu24.04_all.deb
sudo apt update

# Установка агента
sudo apt install zabbix-agent

sudo nano /etc/zabbix/zabbix_agentd.conf
sudo systemctl restart zabbix-agent
sudo systemctl status zabbix-agent
```
