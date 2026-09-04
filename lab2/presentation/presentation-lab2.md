---
author: Взваров Михаил
date: 2026
institute: РУДН, НПИбд-01-25
lang: ru-RU
subtitle: Первоначальная настройка Git
title: Лабораторная работа №2
---


# Цель работы

Изучить идеологию и применение средств контроля версий и освоить
основные навыки работы с Git.

---

# Задание

-   Установить Git и GitHub CLI.
-   Выполнить базовую настройку Git.
-   Создать SSH-ключи RSA и Ed25519.
-   Создать PGP-ключ.
-   Настроить GitHub и подпись коммитов.
-   Создать рабочее пространство курса и загрузить его на GitHub.

---

# Установка и настройка Git

    sudo dnf install git
    sudo dnf install gh
    
    git config --global user.name "Mikhail Vzvarov"
    git config --global user.email "1032251972@rudn.ru"
    git config --global core.quotepath false
    git config --global init.defaultBranch master
    git config --global core.autocrlf input
    git config --global core.safecrlf warn

---

# Создание SSH-ключей

    ssh-keygen -t rsa -b 4096
    ssh-keygen -t ed25519
    ls -la ~/.ssh/

Созданные ключи используются для безопасной аутентификации при работе с
удалёнными репозиториями.

---

# Создание PGP-ключа

    gpg --full-generate-key
    gpg --list-keys

Параметры ключа:

-   RSA and RSA;
-   4096 бит;
-   бессрочный;
-   Mikhail Vzvarov;
-   '1032251972@rudn.ru'.

---

# GitHub и подпись коммитов

SSH- и PGP-ключи были добавлены в GitHub.

    git config --global user.signingkey <key>
    git config --global commit.gpgsign true
    git config --global gpg.program $(which gpg2)
    gh auth login

---

# Создание рабочего пространства

    mkdir -p ~/work/study/2025-2026/"Операционные системы"
    cd ~/work/study/2025-2026/"Операционные системы"
    
    gh repo create study_2025-2026_os-intro \
      --template=yamadharma/course-directory-student-template \
      --public

---

# Клонирование и настройка курса

    git clone --recursive \
      git@github.com:vzvarovmikhail/study_2025-2026_os-intro.git os-intro
    
    cd os-intro
    rm package.json
    echo os-intro > COURSE
    make

---

# Отправка изменений

    git add .
    git commit -am 'feat(main): make course structure'
    git push

В результате рабочее пространство курса было создано и загружено в
удалённый репозиторий.

---

# Выводы

В ходе работы были установлены Git и GitHub CLI, выполнена базовая
настройка Git, созданы SSH- и PGP-ключи и настроена подпись коммитов.

Было создано рабочее пространство курса на основе шаблона и выполнена
его загрузка на GitHub.

Цель работы достигнута.

---

# Контрольные вопросы

**1. Что такое VCS?**
Инструмент управления изменениями файлов, позволяющий хранить историю,
выполнять откат и организовывать совместную работу.

**2. Чем централизованные VCS отличаются от распределённых?**
В централизованных системах используется единый сервер. В
распределённых, например Git, каждый разработчик имеет полную копию
репозитория.

**3. Какие основные команды Git используются?**
'git init', 'git add', 'git commit', 'git status', 'git log',
'git push', 'git pull', 'git clone'.

**4. Зачем нужны ветви?**
Для параллельной разработки функций, исправления ошибок и экспериментов
без влияния на основную ветку.

**5. Для чего нужен '.gitignore'?**
Чтобы Git не отслеживал временные файлы, логи, кэш и конфигурации с
секретными данными.

---

# Библиография

1.  Dash, P. *Getting Started with Oracle VM VirtualBox*. — 2013.
2.  Vugt, S. van. *Red Hat RHCSA/RHCE 7 cert guide*. — 2016.
3.  Робачевский, А. *Операционная система UNIX*. — 2010.
4.  Немет, Э. *Unix и Linux*. — 2014.
5.  Robbins, A. *Bash Pocket Reference*. — 2016.
