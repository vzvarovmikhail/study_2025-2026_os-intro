---
title: "Лабораторная работа №1. Установка операционной системы Linux"
author: "vzvarovmichail"
group: "НПИбд-01-25"
date: "2026-08-26"
---

# Лабораторная работа №1
## Установка операционной системы Linux

---

### Цель работы

Приобретение практических навыков установки операционной системы Linux (дистрибутив Fedora) на виртуальную машину VirtualBox, а также настройки минимально необходимых для дальнейшей работы сервисов.

---

### Задание

1. Установить операционную систему **Fedora Workstation** на виртуальную машину **VirtualBox**.
2. Выполнить первоначальную настройку системы.
3. Настроить переключение раскладки клавиатуры.
4. Установить программное обеспечение для создания документации.
5. Выполнить анализ загрузки системы с помощью команды 'dmesg'.

---

### Выполнение работы

#### 1. Создание виртуальной машины

Создана виртуальная машина в VirtualBox со следующими параметрами:

| Параметр | Значение |
|----------|----------|
| Имя | 'vzvarovmichail' |
| Тип ОС | 'Linux' |
| Версия ОС | 'Fedora (64-bit)' |
| Оперативная память | '2048 МБ' |
| Процессоры | '2' |
| Жёсткий диск | '80 ГБ', 'VDI', динамический |
| EFI | Включена |
| Графический контроллер | 'VMSVGA' |
| 3D-ускорение | Включено |

---

#### 2. Установка операционной системы

Был использован образ 'Fedora-Workstation-Live-44-1.7.x86_64.iso'. В ходе установки заданы:

- **Язык:** English
- **Часовой пояс:** Europe/Moscow
- **Раскладка клавиатуры:** English (US) + Russian
- **Пароль root:** Установлен
- **Пользователь:** 'vzvarovmichail' (администратор)
- **Имя хоста:** 'vzvarovmichail'

---

#### 3. Первоначальная настройка системы

**Обновление системы:**

'''bash
sudo -i
dnf -y group install development-tools
dnf -y update
![Обновление системы](images/update.png)
Рисунок 4 — Обновление пакетов системы

---

## Установка удобных программ:
bash

dnf -y install tmux mc
![Установка mc и tmux](images/software-install.png)
Рисунок 5 — Установка mc и tmux

---

## Настройка автоматического обновления:
bash

dnf -y install dnf-automatic
systemctl enable --now dnf-automatic.timer
/
**Отключение SELinux:**

В файле /etc/selinux/config изменено:
bash

SELINUX=enforcing  # было
SELINUX=permissive # стало

![Отключение SELinux](images/selinux.png)

Рисунок 6 — Файл /etc/selinux/config после изменений

---

## 4. Настройка раскладки клавиатуры

Создан конфигурационный файл /etc/X11/xorg.conf.d/00-keyboard.conf:
text

Section "InputClass"
   Identifier "system-keyboard"
   MatchIsKeyboard "on"
   Option "XkbLayout" "us,ru"
   Option "XkbVariant" ",winkeys"
   Option "XkbOptions" "grp:rctrl_toggle,compose:ralt,terminate:ctrl_alt_bksp"
EndSection

![Настройка клавиатуры](images/keyboard.png)

Рисунок 7 — Конфигурационный файл для раскладки клавиатуры

---

## 5. Установка ПО для документации
bash

dnf -y install pandoc
dnf -y install texlive-scheme-full

![Установка pandoc](images/pandoc.png)

Рисунок 8 — Установка pandoc
Домашнее задание

С помощью команды dmesg получена информация о загрузке системы:

---

## 1. Версия ядра Linux
bash

sudo dmesg | grep -i "Linux version"

Результат: Linux fedora 6.19.10-300.fc44.x86_64 #1 SMP PREEMPT_DYNAMIC Wed Mar 25 18:23:49 UTC 2026 x86_64 GNU/Linux


![Версия ядра](images/kernel-version.png)

Рисунок 9 — Версия ядра Linux

---

## 2. Частота процессора
bash

grep "MHz" /proc/cpuinfo

Результат: cpu MHz		: 3593.116

![Частота процессора](images/cpu-frequency.png)

Рисунок 10 — Частота процессора

---

## 3. Модель процессора
bash

sudo dmesg | grep -i "CPU0"

Результат: model name	: AMD Ryzen 5 5500

![Модель процессора](images/cpu-model.png)

Рисунок 11 — Модель процессора

---

## 4. Объём доступной оперативной памяти
bash

sudo dmesg | grep -i "Memory available"

Результат: Memory available: 23Gi

![Объём памяти](images/memory.png)

Рисунок 12 — Объём доступной оперативной памяти

---

## 5. Тип обнаруженного гипервизора
bash

sudo dmesg | grep -i "Hypervisor detected"

Результат: Hypervisor detected: KVM

![Тип гипервизора](images/hypervisor.png)

Рисунок 13 — Обнаруженный гипервизор

---

## 6. Тип файловой системы корневого раздела
bash

df -T /

Результат:Файловая система Тип   1K-блоков Использовано Доступно Использовано% Cмонтировано в
/dev/sda3        btrfs  81944576     12716496 68261776           16% /


![Файловая система корня](images/root-fs.png)

Рисунок 14 — Тип файловой системы корневого раздела

---

## 7. Последовательность монтирования
bash

sudo dmesg | grep -i "mount"

Результат:[    0.979613] Mount-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.980513] Mountpoint-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    3.792422] BTRFS: device label fedora devid 1 transid 649 /dev/sda3 (8:3) scanned by mount (481)
[    3.793971] BTRFS info (device sda3): first mount of filesystem 2e7a6a23-8b86-45d8-9e51-8537e194de9f
[    6.152867] systemd[1]: Set up automount proc-sys-fs-binfmt_misc.automount - Arbitrary Executable File Formats File System Automount Point.


![Последовательность монтирования](images/mount-seq.png)

Рисунок 15 — Последовательность монтирования файловых систем

---

###Контрольные вопросы

## 1. Какую информацию содержит учётная запись пользователя?

Учётная запись содержит:

   Имя пользователя (login)

   UID и GID

   Домашний каталог

   Командную оболочку

   Зашифрованный пароль

   Дату изменения пароля

---

## 2. Команды терминала
Действие	Команда	Пример
Справка	man	man ls
Перемещение	cd	cd /home
Содержимое каталога	ls -la	ls -la /var
Объём каталога	du -sh	du -sh /home
Создать каталог	mkdir	mkdir test
Удалить каталог	rm -rf	rm -rf test
Создать файл	touch	touch file.txt
Удалить файл	rm	rm file.txt
Права доступа	chmod	chmod 755 script.sh
История команд	history	history

---

## 3. Что такое файловая система?

Файловая система — это способ организации и хранения данных на диске.

Примеры:

   ext4 — стандартная ФС Linux, журналируемая

   btrfs — современная ФС с поддержкой снимков

   NTFS — ФС Windows

   FAT32 — старая ФС, файлы ≤4GB

---

## 4. Как посмотреть подмонтированные ФС?
bash

mount
df -h
cat /proc/mounts


---

## 5. Как удалить зависший процесс?
bash

ps aux | grep имя_процесса   # найти PID
kill -9 PID                  # завершить процесс

Сигнал SIGKILL (-9) принудительно завершает процесс.
Вывод

В ходе выполнения лабораторной работы была успешно установлена операционная система Fedora Workstation на виртуальную машину VirtualBox. Выполнена первичная настройка системы: обновлены пакеты, установлены утилиты для комфортной работы, отключён SELinux, настроена раскладка клавиатуры, установлено ПО для создания отчётов.

Выполнено домашнее задание по анализу загрузки системы с помощью команды dmesg. Подготовлены ответы на контрольные вопросы.

Таким образом, цель работы достигнута. Система готова к дальнейшему использованию в рамках курса.

---

### Библиография

   Dash, P. Getting Started with Oracle VM VirtualBox. – 2013.

   Colvin, H. VirtualBox: An Ultimate Guide Book. – 2015.

   Vugt, S. van. Red Hat RHCSA/RHCE 7 cert guide. – 2016.

   Робачевский, А. Операционная система UNIX. – 2010.

   Немет, Э. Unix и Linux: руководство системного администратора. – 2014.

   Колисниченко, Д.Н. Самоучитель системного администратора Linux. – 2011.

   Robbins, A. Bash Pocket Reference. – 2016.
