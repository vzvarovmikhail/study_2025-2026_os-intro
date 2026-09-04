#!/bin/bash

WAIT_TIME=${1:-5}
USE_TIME=${2:-3}
PROCESS_ID=${3:-1}
LOCK_FILE="/tmp/semaphore.lock"

log() {
    echo "[$(date +%H:%M:%S)] [Процесс $PROCESS_ID] $1"
}

log "Запущен. Время ожидания: $WAIT_TIME сек, время использования: $USE_TIME сек"

while true; do
    log "Пытаюсь захватить ресурс..."
    
    if ( set -o noclobber; echo "$$" > "$LOCK_FILE" ) 2>/dev/null; then
        # Ресурс захвачен
        log "Ресурс захвачен! Использую в течение $USE_TIME секунд..."
        sleep $USE_TIME
        
        rm -f "$LOCK_FILE"
        log "Ресурс освобождён"
    else
        log "Ресурс занят, ожидаю $WAIT_TIME секунд..."
        sleep $WAIT_TIME
    fi
done

