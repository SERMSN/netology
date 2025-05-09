#!/bin/bash

# Директории
SOURCE_DIR="/home/msn/Projects/"
BACKUP_DIR="/tmp/backup"
LOG_FILE="/var/log/backup.log"

# Проверяем, существует ли директория для бэкапа
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
fi

# Записываем время начала
echo "[$(date +'%Y-%m-%d %H:%M:%S')] Начало резервного копирования" >> "$LOG_FILE"

# Запускаем rsync (зеркальная копия с исключением скрытых папок)
rsync -avh --delete --exclude='.*/' --checksum "$SOURCE_DIR" "$BACKUP_DIR" >> "$LOG_FILE" 2>&1

# Проверяем код завершения rsync
if [ $? -eq 0 ]; then
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] Резервное копирование успешно завершено" >> "$LOG_FILE"
else
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] Ошибка резервного копирования!" >> "$LOG_FILE"
    exit 1
fi
