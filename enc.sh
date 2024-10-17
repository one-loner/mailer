#!/bin/bash

gpg --list-keys

# Запрашиваем у пользователя ID GPG ключей
read -p "Введите ID GPG ключей для шифрования (через пробел): " -a gpg_ids

# Запрашиваем у пользователя имя файла для шифрования
read -p "Введите имя файла для шифрования: " file_to_encrypt

# Проверяем, существует ли файл
if [[ ! -f "$file_to_encrypt" ]]; then
    echo "Файл $file_to_encrypt не найден!"
    exit 1
fi

# Шифруем файл с использованием указанных GPG ключей
gpg --output "${file_to_encrypt}.gpg" --encrypt --recipient "${gpg_ids[@]}" "$file_to_encrypt"

# Проверяем, успешно ли завершилась команда
if [[ $? -eq 0 ]]; then
    echo "Файл $file_to_encrypt успешно зашифрован в ${file_to_encrypt}.gpg"
else
    echo "Произошла ошибка при шифровании файла."
fi
