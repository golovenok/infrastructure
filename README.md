# Практика по DevOps
Igor Golovenok Infrastructure repository

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
https://wiki.archlinux.org/index.php/SSH_keys

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

Копирование файлов через SSH: \
https://www.shellhacks.com/ru/copy-files-ssh-10-examples

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