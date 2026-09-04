---
author: Взваров Михаил
date: 2026
institute: РУДН, НПИбд-01-25
lang: ru-RU
subtitle: Менеджер паролей pass и управление конфигурацией chezmoi
title: Лабораторная работа №5
---


# Цель работы

Практически освоить менеджер паролей 'pass' и инструмент 'chezmoi' для
управления конфигурационными файлами домашнего каталога.

---

# Задание

-   Установить и настроить 'pass'.
-   Создать GPG-ключ и хранилище паролей.
-   Настроить синхронизацию через Git.
-   Добавить тестовые записи.
-   Установить и настроить 'chezmoi'.
-   Подключить репозиторий dotfiles.
-   Освоить основные команды и шаблоны.

---

# GPG и pass

    gpg --list-secret-keys
    gpg --full-generate-key
    pass init 1032251972@rudn.ru

Параметры GPG-ключа:

-   RSA and RSA;
-   4096 бит;
-   бессрочный;
-   Mikhail Vzvarov;
-   '1032251972@rudn.ru'.

---

# Git для хранилища паролей

    pass git init
    pass git remote add origin \
      git@github.com:vzvarovmikhail/password-store.git

Добавлены тестовые записи:

    pass insert example.com
    pass insert example.com/vzvarovmikhail
    pass insert social/vk.com
    pass insert social/tg.com

---

# Синхронизация pass

    pass
    pass git push
    pass git status

Пароли хранятся в '~/.password-store' и шифруются с помощью GPG.

---

# Установка chezmoi

    sudo dnf install -y chezmoi
    chezmoi --version
    
    gh repo create dotfiles --private
    chezmoi init git@github.com:vzvarovmikhail/dotfiles.git

---

# Работа с конфигурацией

    chezmoi diff
    chezmoi apply -v
    chezmoi add --template ~/.bashrc
    chezmoi edit ~/.bashrc

Для шаблонов используется синтаксис Go templates.

---

# Автоматизация Git

В '~/.config/chezmoi/chezmoi.toml':

    [git]
    autoCommit = true
    autoPush = true

Ежедневное обновление:

    chezmoi update
    chezmoi git pull -- --autostash --rebase
    chezmoi diff

---

# Выводы

В ходе работы были освоены 'pass' и 'chezmoi'.

'pass' позволяет хранить зашифрованные GPG пароли и синхронизировать их
через Git.

'chezmoi' позволяет централизованно хранить dotfiles, применять их на
разных машинах и использовать шаблоны.

Цель работы достигнута.

---

# Контрольные вопросы

**1. В чём преимущество 'pass'?**
Пароли хранятся в файловой структуре, шифруются GPG и могут
синхронизироваться через Git.

**2. Зачем нужна семантическая структура имён в 'pass'?**
Чтобы программы могли определять хост, пользователя и порт без
дополнительного описания.

**3. Что хранится в '~/.local/share/chezmoi'?**
Рабочая копия репозитория dotfiles.

**4. Чем шаблоны chezmoi отличаются от обычных файлов?**
Обычные файлы копируются дословно, шаблоны обрабатываются с подстановкой
переменных.

**5. Как развернуть настройки на новой машине?**

    chezmoi init --apply git@github.com:vzvarovmikhail/dotfiles.git

---

# Библиография

1.  Password Store — The standard Unix password manager.
2.  Документация chezmoi.
3.  GnuPG — The GNU Privacy Guard.
4.  Git — распределённая система управления версиями.
5.  Методические указания к лабораторной работе №5.
