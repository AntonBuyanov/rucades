# Rucades

Вас приветсвует Rucades - CAdESCOM Ruby binding !
Gem реализует интерфейс, аналогичный [CAdESCOM](https://docs.cryptopro.ru/cades/reference/cadescom)
и разработан путём повторения функциональности [pycades](https://docs.cryptopro.ru/cades/pycades)

[![Build-and-test](https://github.com/maxirmx/rucades/actions/workflows/main.yml/badge.svg)](https://github.com/maxirmx/rucades/actions/workflows/main.yml)

## Совместимость

Gem тестировался в следующем окружении:
* Ububtu 20, 22
* Ruby 2.7. 3.0, 3.1, 3.2

Вероятно, Gem совместим с другими вариантами Linux, однако КриптоПро ЭЦП SDK доступно только для Ubuntu.

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
!!! Компиляция расширения может занять 10-15 минут. Во время компиляции Ruby не выводит никаких сообщений. !!!

## Использование

В каталоге samples есть 4 примера, унаследованные от peycades:
* encrypt - decrypt
* sign - verify signature
* sign xml document - verify signature
* sign hash - verify signature

RSpec обеспечивает покрытие тестами вcех классов и примерно 70% функций.
Однако, следует иметь в виду, что тестируются С++ --> Ruby bindings, а не функциональность.
ТО есть RSpec проверяет, что функция создалась с нужным имененм и параметрами, но не правильность её работы.

## Разработка

Этот Gem использует
* [bundler](https://bundler.io/guides/getting_started.html) для управления зависимстями
* [rake](https://ruby.github.io/rake/) для управления сборкой
* [RSpec](https://rspec.info/) 'to make TDD productive and fun'
* [Rice](https://jasonroelofs.com/rice/4.x/introduction.html) для генерации Ruby bindings

Чтобы начать разработку, нужно
* прочитать документацию на Rice
* установить зависимости, как описано выше в разделе установка
* ```bundle install```
* ```rake --tasks```

## Лицензия

[MIT License](https://opensource.org/licenses/MIT).
