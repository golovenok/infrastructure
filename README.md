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

- Создание ключа: `ssh-keygen -t rsa -f ~/.ssh/appuser_ssh -C appuser -P ""`
- Проверка работы агента: `eval "$(ssh-agent -s)"`
- Добавление ключа в агента: `ssh-add ~/.ssh/appuser_ssh`
- Подключение: `ssh -i ~/.ssh/appuser appuser@34.77.105.249`
- Подключение через bastion: `ssh -J appuser@34.77.105.249 appuser@10.132.0.4`

 <details>
  <summary>Alias (~/.ssh/config)</summary>

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
</details>

<details>
  <summary>Google Cloud Platform </summary>

  ## Установка gcloud

- `sudo snap install google-cloud-sdk --classic`
- `gcloud auth application-default login`

</details>

<details>
  <summary>Packer </summary>
  
  ## Создание image с приложением Reddit 
  https://github.com/express42/reddit/tree/monolith

  ### Files
  - `packer/variables.json` - содержит параметры
  - `packer/reddit-base.json` - создает image reddit-base с установленными Ruby и Mongodb
  - `packer/reddit-full.json` - создает image reddit-full (на основе reddit-base) с готовым приложением Reddit
  - `config-scripts/create-firewall-puma.sh` - создает firewall rules для puma server
  - `config-scripts/create-reddit-vm.sh` - cоздает instance на основе reddit-full
  
  ### Terminal
  - Проверка на ошибки: `packer validate ./reddit-base.json`
  - Создание image: `packer build -var-file variables.json reddit-full.json`
  </details>