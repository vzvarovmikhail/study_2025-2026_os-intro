---
author: Взваров Михаил
date: 2026
institute: РУДН, НПИбд-01-25
lang: ru-RU
subtitle: Установка операционной системы Linux
title: Лабораторная работа №1
---


# Цель работы

Приобрести практические навыки установки операционной системы Linux
(Fedora) на виртуальную машину VirtualBox и выполнить первоначальную
настройку системы.

---

# Задание

-   Установить Fedora Workstation в VirtualBox.
-   Выполнить первоначальную настройку системы.
-   Настроить переключение раскладки клавиатуры.
-   Установить ПО для создания документации.
-   Выполнить анализ загрузки системы.

---

# Создание виртуальной машины

Основные параметры виртуальной машины:

-   ОС: Fedora (64-bit).
-   Оперативная память: 2048 МБ.
-   Процессоры: 2.
-   Диск: 80 ГБ, VDI, динамический.
-   EFI и 3D-ускорение включены.

---

# Установка Fedora

Использован образ 'Fedora-Workstation-Live-44-1.7.x86_64.iso'.

Были настроены:

-   English + Russian;
-   часовой пояс Europe/Moscow;
-   пользователь 'vzvarovmichail';
-   имя хоста 'vzvarovmichail'.

---

# Первоначальная настройка

    sudo -i
    dnf -y group install development-tools
    dnf -y update
    dnf -y install tmux mc
    dnf -y install dnf-automatic
    systemctl enable --now dnf-automatic.timer

![Обновление системы](images/update.png)

---

# Настройка системы

Для SELinux установлен режим 'permissive'.

Настроено переключение раскладки клавиатуры через
'/etc/X11/xorg.conf.d/00-keyboard.conf'.

    Option "XkbLayout" "us,ru"
    Option "XkbOptions" "grp:rctrl_toggle,compose:ralt,terminate:ctrl_alt_bksp"

![Настройка клавиатуры](images/keyboard.png)

---

# ПО для документации

    dnf -y install pandoc
    dnf -y install texlive-scheme-full

![Установка pandoc](images/pandoc.png)

---

# Анализ системы

Для получения информации о системе использовались:

    sudo dmesg | grep -i "Linux version"
    grep "MHz" /proc/cpuinfo
    sudo dmesg | grep -i "CPU0"
    sudo dmesg | grep -i "Memory available"
    df -T /

Были определены версия ядра, частота и модель процессора, объём памяти и
тип файловой системы.

---

# Выводы

В ходе работы была установлена Fedora Workstation, выполнена
первоначальная настройка системы, установлены необходимые утилиты и
средства подготовки документации.

Также были получены практические навыки анализа параметров системы с
помощью 'dmesg' и других команд Linux.

Цель работы достигнута.

---

# Контрольные вопросы

**1. Какую информацию содержит учётная запись пользователя?**
Имя пользователя, UID и GID, домашний каталог, командную оболочку,
зашифрованный пароль и дату его изменения.

**2. Что такое файловая система?**
Файловая система — способ организации и хранения данных на диске.
Примеры: 'ext4', 'btrfs', 'NTFS', 'FAT32'.

**3. Как посмотреть подмонтированные файловые системы?**

    mount
    df -h
    cat /proc/mounts

**4. Как удалить зависший процесс?**

    ps aux | grep имя_процесса
    kill -9 PID

---

# Библиография

1.  Dash, P. *Getting Started with Oracle VM VirtualBox*. — 2013.
2.  Colvin, H. *VirtualBox: An Ultimate Guide Book*. — 2015.
3.  Vugt, S. van. *Red Hat RHCSA/RHCE 7 cert guide*. — 2016.
4.  Робачевский, А. *Операционная система UNIX*. — 2010.
5.  Немет, Э. *Unix и Linux: руководство системного администратора*. ---
    2014.
6.  Колисниченко, Д. Н. *Самоучитель системного администратора Linux*.
    — 2011.
