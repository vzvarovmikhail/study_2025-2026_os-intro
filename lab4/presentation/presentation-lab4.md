---
author: Взваров Михаил
date: 2026
institute: РУДН, НПИбд-01-25
lang: ru-RU
subtitle: Продвинутое использование Git
title: Лабораторная работа №4
---


# Цель работы

Получить навыки правильной работы с Git-репозиториями, освоить Gitflow
Workflow, Conventional Commits и семантическое версионирование.

---

# Задание

-   Установить git-flow, Node.js и pnpm.
-   Установить Commitizen и standard-changelog.
-   Создать репозиторий.
-   Настроить Conventional Commits.
-   Инициализировать git-flow.
-   Создать релизы '1.0.0' и '1.2.3'.
-   Выполнить работу с feature-веткой.

---

# Установка инструментов

    sudo dnf copr enable elegos/gitflow
    sudo dnf install -y gitflow
    sudo dnf install -y nodejs
    sudo dnf install -y pnpm
    
    pnpm setup
    source ~/.bashrc
    pnpm add -g commitizen
    pnpm add -g standard-changelog

---

# Создание репозитория

    mkdir git-extended
    cd git-extended
    git init
    echo "# git-extended" > README.md
    git add README.md
    git commit -m "first commit"
    git remote add origin git@github.com:mikhailvzvarov/git-extended.git
    git push -u origin master

![Создание репозитория](images/repo-create.png)

---

# Gitflow

    git flow init

Использованы ветки:

-   'master' — production;
-   'develop' — разработка;
-   'feature/' — новая функциональность;
-   'release/' — подготовка релизов;
-   'hotfix/' — исправления.

---

# Релиз 1.0.0

    git flow release start 1.0.0
    standard-changelog --first-release
    git add CHANGELOG.md
    git commit -m "chore(site): add changelog"
    git flow release finish 1.0.0 -m "Release 1.0.0"
    git push --all
    git push --tags
    gh release create v1.0.0 -F CHANGELOG.md

---

# Feature-ветка

    git flow feature start feature_branch
    git flow feature finish feature_branch

Feature-ветка создаётся от 'develop' и после завершения работы
объединяется обратно с 'develop'.

---

# Релиз 1.2.3

    git flow release start 1.2.3
    git add package.json
    git commit -m "chore(package): bump version to 1.2.3"
    standard-changelog
    git add CHANGELOG.md
    git commit -m "chore(site): update changelog"
    git flow release finish 1.2.3 -m "Release 1.2.3"
    git push --all
    git push --tags
    gh release create v1.2.3 -F CHANGELOG.md

---

# Выводы

В ходе работы были освоены Gitflow Workflow, Conventional Commits и
семантическое версионирование.

Были созданы feature- и release-ветки, сформирован CHANGELOG и
опубликованы релизы '1.0.0' и '1.2.3'.

Цель работы достигнута.

---

# Контрольные вопросы

**1. Что такое Gitflow Workflow?**
Модель ветвления с основными ветками 'master', 'develop' и
вспомогательными 'feature', 'release', 'hotfix'.

**2. Что такое семантическое версионирование?**
Формат 'MAJOR.MINOR.PATCH': несовместимые изменения, новая совместимая
функциональность и исправления.

**3. Что такое Conventional Commits?**
Спецификация структуры сообщений коммитов для единообразного описания
изменений.

---

# Библиография

1.  Gitflow Workflow.
2.  Semantic Versioning.
3.  Conventional Commits.
4.  standard-changelog.
5.  Git Documentation.
