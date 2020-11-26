# Практика по DevOps
Igor Golovenok Infrastructure repository

<details>
  <summary>Командная работа с Git
  </summary>

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

## SSH

- Создание ключа: `ssh-keygen -t rsa -f ~/.ssh/appuser_ssh -C appuser -P ""`
- Проверка работы агента `eval "$(ssh-agent -s)"`
- Добавление ключа в агента `ssh-add ~/.ssh/appuser_ssh`
</details>