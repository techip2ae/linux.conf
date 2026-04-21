#!/usr/bin/env bash

# Путь к файлу истории
HISTORY_FILE="$HOME/.cache/rofi_clipboard_history.txt"
MAX_LINES=50  # Сколько последних записей хранить

# Создаем файл, если его нет
touch "$HISTORY_FILE"

# 1. Читаем текущее содержимое буфера обмена
# Для X11 используем xclip. Для Wayland см. примечание ниже.
CURRENT_CLIP=$(xclip -selection clipboard -o 2>/dev/null)

# Если буфер пуст, выходим (или можно показать сообщение)
if [ -z "$CURRENT_CLIP" ]; then
    exit 0
fi

# 2. Добавляем новое значение в начало файла, если его там еще нет
# grep -qFx ищет точное совпадение всей строки
if ! grep -qFx "$CURRENT_CLIP" "$HISTORY_FILE"; then
    echo "$CURRENT_CLIP" >> "$HISTORY_FILE"
fi

# 3. Обрезаем файл до MAX_LINES самых свежих записей
# tac переворачивает файл, head берет первые N строк, tac возвращает порядок
tail -n "$MAX_LINES" "$HISTORY_FILE" | tac > "$HISTORY_FILE.tmp" && mv "$HISTORY_FILE.tmp" "$HISTORY_FILE"


# 4. Запускаем rofi
# -dmenu: режим ввода-вывода через stdin/stdout
# -i: регистронезависимый поиск
# -p "Clipboard": подсказка в поле ввода
SELECTED=$(cat "$HISTORY_FILE" | rofi -dmenu -i -p "📋 Clipboard" -lines 10)

# 5. Если пользователь что-то выбрал
if [ -n "$SELECTED" ]; then
    # Копируем выбранное обратно в буфер обмена
    echo -n "$SELECTED" | xclip -selection clipboard
    
    # Опционально: показать уведомление (требует notify-send)
    if command -v notify-send &> /dev/null; then
        notify-send "Clipboard" "Copied: ${SELECTED:0:50}..." -t 2000
    fi
fi