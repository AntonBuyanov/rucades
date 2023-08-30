# Rucades

Вас приветсвует Rucades - CAdESCOM Ruby binding !
Gem реализует интерфейс, аналогичный [CAdESCOM](https://docs.cryptopro.ru/cades/reference/cadescom)

## Установка

* Установите пакеты  для сборки  ``` sudo apt install cmake build-essential libboost-all-dev ruby-dev unzip ```
* Скачайте архив с КриптоПро CSP https://cryptopro.ru/products/csp/downloads , распакуйте его и установите КриптоПро CSP
```
    tar xvf linux-amd64_deb.tgz
    cd linux-amd64_deb
    sudo ./install.sh
```
* Установите пакет cprocsp-devel ```sudo apt install ./lsb-cprocsp-devel_5.0*.deb```
* Скачайте архив с КриптоПро ЭЦП SDK https://cryptopro.ru/products/cades/downloads , распакуйте его и установите пакет cprocsp-pki-cades (версия не ниже 2.0.14071)
```
tar xvf cades_linux_amd64.tar.gz
cd cades_linux_amd64
sudo apt install ./cprocsp-pki-cades*.deb
```
* Добавьте в Gemfile Вашего проекта следующую строку:
``` gem 'rucades', git: 'https://github.com/maxirmx/rucades' ```

* Выполните  ``` bundle install ```

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rucades.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
