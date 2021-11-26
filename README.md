# Практика по DevOps
Igor Golovenok Infrastructure repository

<details>
  <summary>Linux </summary>

### Иерархия файловой системы
`/bin` – исполняемые файлы; `/sbin` – исполяемые файлы; `/dev` – файлы устройств; `/etc` – файлы конфигурации; `/lib` – системные библиотеки; `/home` – каталоги пользователей; `/root` – каталог суперпользователя; `/usr` – размещение приложений; `/var` – данные приложений; `/tmp` – временный каталог системы; `/var/tmp` – временные каталоги приложений; `/proc` – файловый интерфейс ОС; `/opt` – аналог “Program Files”; `/mnt` – монтирование сетевых ФС `/media` – монтирование съемных ФС; `/boot` – загрузчик и ядросистемы; `/sys` – интерфейс кустройствам ОС; `/srv` – размещение Web-сайтов, FTP...

### Система помощи
`man`, `--help`, `info`

### Переменные окружения
(`echo $...`)
- Добавить переменную в `~/.Bashrc` или `~/.zshrc`: `export PATH="/usr/lib/postgresql/12/bin:$PATH"` `export PGDATA="/usr/local/pgsql/data"`
- Обновить `source ~/.bashrc`

- `SHELL` – содержит путь к shell текущего пользователя
- `LS_COLORS` – определяет соответствие между расширениями файлов и теми цветами которыми те отражаются в при выводе командой ls
- `USER` – текущий пользователь
- `HOME` – домашний каталог пользователя USER
- `PATH` – содержит пути для поиска файлов по умолчанию
- `PWD` – указывает на текущий каталог
- `LANG` – определяет текущие настройки локали

### Команды оболочки
- `env` – выводит список переменных окружения
- `export` – экспортирует переменные окружения, делая их доступными для других программ
- `echo` – выводит на терминал то, что передано в качестве параметра, в том числе и esc-последовательности
- `reset` – возврат настроек терминала к значениям по умолчанию
- `logout` – завершение текущего пользовательского сеанса
- `exit` – завершение сеанса работы с оболочкой

### Стандартные ввод, вывод и вывод ошибок
Стандартные потоки (файлы):
- `0` – Стандартный ввод (`stdin`)
- `1` – Стандартный вывод (`stdout`)
- `2` – Стандартный вывод ошибок (`stderr`)

### Основные команды для работы с файлами
- `which` - расположение программы программе
- `ls` – вывод содержимого каталога (`-R` - вложения)
- `tree` - дерево каталога (`-d` - только дирректории)
- `pwd` – выводит на консоль путь к текущему каталогу
- `cd` – смена текущего каталога
- `touch` – создание файла или изменение его временных меток
- `mkdir` – создание каталога
- `rm / rmdir `– удаление файла / каталога , поддерживается рекурсия (`-r`)
- `cp / mv` – копирование / переименование / перенос файлов и каталогов, поддерживается рекурсия (`-r`)
- `more / less` – постраничный просмотр текстовых файлов
- `ln` – создание ссылок на файлы (hard & soft) (`-s` - символьная ссылка)
- `cat / tac` – вывод содежимого файла в прямом и обратном порядках

### Дополнительные команды для работы с файлами
- `df` - отчёт об использовании дискового пространства
- `du` - оценка места на диске , занимаемого файлами и каталогами (`-h`)
- `sort` – сортировка строк в тектовых файлах
- `cut / paste` – работа с секциями файлов (вырезать / вставить)
- `head / tail` – вывод (первых / последних) строк файла на стандартный вывод
- `wc` – подсчет (размера файла, числа символов , слов, строк и т.п.)
- `tr` – замена символов по шаблону
- `dd` - преобразовать и копировать файл
- `tee` – транслящия stdin в stdout c ведением лога 
- `uniq` – нахождение дублирующихся строк
- `find /usr/bin -user root -type f -perm -4000` - поиск в каталоге bim, тип - файлы, с правами "4000"
- `grep` – поиск по шаблону (https://losst.ru/gerp-poisk-vnutri-fajlov-v-linux)
- Архивация (https://zen.yandex.ru/media/id/5bcde82f0c05e200aab52807/sozdanie-prosmotr-i-raspakovka-arhivov-tar-zip-rar-v-linux-targz-tarbz2-zip-rar-5cb49cf476b1a600b216cb7f)

### Типы файлов
Первая буква программы `ls -l`
- `f` или `-` — обыкновенный файл
- `l` — символьная ссылка
- `d` — директория
- `c` — символьное устройство
- `b` — блочное устройство
- `p` — pipe (FIFO) файл
- `s` — файл типа socket

### Управление правами доступа
- `chmod` — изменение прав доступа (`chmod` `[-R]` `[опции]` `права` `файл`) (`chmod u+r,go+w raphael-andres`)
- `umask` — маска прав доступа
- `chown` — изменение хозяина (доступна только для root ) (`chown` `[-R]` `user[:group]` `файл`)
- `chgrp` — изменение группы (`chgrp` `[-R]` `group` `файл`)
- *`-R` - рекурсивная смена

### Типы прав доступа к файлам (к каталогам)
- `r` — право на чтение из файла (право на просмотр содержимого директории)
- `w` — право на запись в файл (право на создание, удаление файлов в директории)
- `x` — право на исполнение (право на «прохождение » в и сквозь директорию)

### Символьный формат записи прав
- `u` - права хозяина; `g` - права группы; `o` - права всех остальных; `a` - все права; `+` - установить бит; `-` - сбросить бит; `=` - установить относительно.

### Права доступа (числа)
- `r = 4`, `w = 2`, `x = 1`,
-  `* _ _ _` - * - sticky бит на каталог (`1` - включить, `0` - выключить). Если включен, то файлы из каталога может удалить только root или владелец.
- для файлов дефолд — `664`; для директорий дефолд — `775` 


### Просмотр процессов
ps [опции]:
- `a` — показывает список всех процессов «привязанных» к терминалам
- `x` — показывает список процессов не «привязанных» к терминалу
- `е` — показывает все процессы системы
- `f` — показывает дерево процессов
- `u user` — список процессов пользователя
- `ps aux | less` `ps -e` `ps xaf` `pstree` `ps xa | grep cupsd` `pgrep cupsd`

### Создание пользователей и групп
- `useradd` (`-c "..."` - комментарий; `-m` - создание домашнего каталога; `-s /bin/sh` - добавление оболочки.)(`userdel` - удалить)
- `passwd [user]` - добавление пароля
- `adduser` - медленное сознание пользователя
- `usermod -L [user]` - блокировка пользователя. (`usermod -U [user]` - разблокировака)
- `vim /etc/passwd` - настройка пользователя (`sudo vipw`)
- `/etc/shadow` - хранение паролей
- `id [user]` - информация о пользователе
- `groupadd [group]` - создание группы (`groupdel` - удалить )
- `vim /etc/group` - добавить пользователя в группу (`sudo vigr`)

### Сетевые комманды
- `ifconfig` - показать мой IP адресс
- `ip addr show ` - показать мой IP адресс
- `route` - показать адресс раутера Gateway
- `ping` - протестировать коннекшен к адрессу
- `host` - дать IP адресс вэб сайта
- `dig` - дать IP адресс вэб сайта
- `netstat`  – выдать сетевые подключения компьютера
- `sudo apt-get install openssh-server -y` - для подключения к серверу (`ssh laptop`)




</details>

<details>
  <summary>Git </summary>

## Основные команды Git

- Настроить информацию об авторе: `git config --global user.name "Igor Golovenok"`, `git config --global user.email golovonokia@mail.ru`
- Инициализация репозитория: `git init`
- Проверка состояния: `git status`
- Создание и переход на ветку second: `git checkout -b second`
- Слияние веток: ` git merge`
- Удаление ветки second: `git branch -d second`
- Добавление файлов: `git add`
- Создание коммита: `git commit -m "..."`
- Настройка удаленного репозитория : `git remote add origin git@github.com:golovenok/infrastructure.git`
- Пушим ветку second `git push --set-upstream origin second`

</details>

<details>
  <summary>SSH </summary>

  ## SSH
https://wiki.archlinux.org/index.php/SSH_keys \
https://rtfm.co.ua/ssh-rsa-klyuchi-i-ssh-agent-upravlenie-ssh-klyuchami-i-ix-parolyami/

  - Создание ключа: `ssh-keygen -t rsa -f ~/.ssh/appuser_ssh -C appuser -P ""`
  - Проверка работы агента: `eval "$(ssh-agent -s)"`
  - Добавление ключа в агента: `ssh-add ~/.ssh/appuser_ssh`
  - Подключение: `ssh -i ~/.ssh/appuser appuser@34.77.105.249`
  - Подключение через bastion: `ssh -J appuser@34.77.105.249 appuser@10.132.0.4`
  

<details>
  <summary>Алиас (~/.ssh/config) </summary>

```
  Host bastion
      HostName 34.77.105.249
      User appuser
      IdentityFile ~/.ssh/appuser
      

  Host someinternalhost
      HostName 10.132.0.4
      User appuser
      ProxyJump bastion
      IdentityFile ~/.ssh/appuser
```
</details>

Копирование файлов через SSH: https://www.shellhacks.com/ru/copy-files-ssh-10-examples

</details>

<details>
  <summary>Google Cloud Platform </summary>

  ### Установка gcloud

- `sudo snap install google-cloud-sdk --classic`
- `gcloud auth application-default login`

  ### Files
- `gsp/create-reddit-vm.sh` - cкрипт cоздает instance "reddit-app"
- `gsp/create-firewall-puma.sh` - скрипт создает firewall rules "default-puma-server"


</details>

<details>
  <summary>Packer </summary>
  
  ## Создание image с приложением Reddit в gsp
  https://github.com/express42/reddit/tree/monolith

  ### Files
  - `packer/variables.json` - файл с переменными.
  - `packer/app.json` - образ reddit-app-base c установленным Ruby.
  - `packer/db.json` - образ reddit-db-base c установленным Mongodb.
  - `packer/reddit-base.json` - образ reddit-base с установленными Ruby и Mongodb.
  - `packer/reddit-full.json` - образ reddit-full (на основе reddit-base) с готовым приложением Reddit.

  
  ### Terminal
  - Проверка на ошибки: `packer validate ./reddit-base.json`
  - Создание image: `packer build -var-file variables.json reddit-full.json`
</details>

<details>
    <summary>Terraform </summary>
  
  ## Создание VM instances в gcp с помощью Terraform


  ### Files
  - `stage/main.tf` - конфигурационный файл.
  - `stage/variables.tf` - файл под input vars.
  - `stage/outputs.tf` - файл выходных переменных.
  - `stage/terraform.tfvars` - значения переменных, которые не имеют дефолтного значения.
  - `terraform.tfstate` - Terraform хранит в этом файле состояние управляемых им ресурсов.
  - `modules` - дирректория, содержащая в себе модули: \
      `app` - модуль создающий instanse "reddit-app", compute address "reddit-app-ip", firewall rules "allow-puma-default" \
      `db` - модуль создающий instanse "reddit-db", firewall rules "allow-mongo-default" \
      `vcp` - создает firewall rules "default-allow-ssh"
  - `storage-bucket` - https://registry.terraform.io/modules/SweetOps/storage-bucket/google/latest
  
  ### Terminal
  - `terraform -v` - узнать версию 
  -  `terraform init` - инициализация модулей Terraform:
  - `terraform plan` - планирование изменений
  -  `terraform apply -auto-approve=true` - пуск
  - `terraform destroy` - удаление
  - `terraform taint "module.vcp.google_compute_firewall.firewall_ssh` - позволяет пометить ресурс, который terraform должен пересоздать, при следующем запуске.
</details>

ss
