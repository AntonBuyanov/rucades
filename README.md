# Rucades

Вас приветсвует Rucades - CAdESCOM Ruby binding !
Gem реализует интерфейс, аналогичный [CAdESCOM](https://docs.cryptopro.ru/cades/reference/cadescom)

[![Build-and-test](https://github.com/maxirmx/rucades/actions/workflows/main.yml/badge.svg)](https://github.com/maxirmx/rucades/actions/workflows/main.yml)

## Установка

* Установите пакеты  для сборки
```
    sudo apt install cmake build-essential libboost-all-dev ruby-dev unzip
```
* Скачайте архив с [КриптоПро CSP](https://cryptopro.ru/products/csp/downloads) , распакуйте его и установите КриптоПро CSP
```
    tar xvf linux-amd64_deb.tgz
    cd linux-amd64_deb
    sudo ./install.sh
```
* Установите пакет cprocsp-devel
```
sudo apt install ./lsb-cprocsp-devel_5.0*.deb
```
* Скачайте архив с [КриптоПро ЭЦП SDK](https://cryptopro.ru/products/cades/downloads) , распакуйте его и установите пакет cprocsp-pki-cades (версия не ниже 2.0.14071)
```
tar xvf cades_linux_amd64.tar.gz
cd cades_linux_amd64
sudo apt install ./cprocsp-pki-cades*.deb
```
* Добавьте в Gemfile Вашего проекта следующую строку:
```
gem 'rucades', git: 'https://github.com/maxirmx/rucades'
```
* Выполните
```
bundle install
```

## Usage

TODO: Write usage instructions here

## Участе в разработке

Bug reports and pull requests are welcome on GitHub at https://github.com/maxirmx/rucades.

## Лицензия

[MIT License](https://opensource.org/licenses/MIT).
