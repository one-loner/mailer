#!/bin/bash
# Запрашиваем у пользователя ID GPG ключей для шифрования
read -p "Введите ID GPG ключей для шифрования (через пробел): " -a gpg_ids
# Запрашиваем у пользователя ID GPG ключа для подписи (необязательно)
read -p "Введите ID GPG ключа для подписи (оставьте пустым, если не нужно): " gpg_sign_id
# Запрашиваем у пользователя имя файла для шифрования
read -p "Введите имя файла для шифрования: " file_to_encrypt
# Проверяем, существует ли файл
if [[ ! -f "$file_to_encrypt" ]]; then 
    echo "Файл $file_to_encrypt не найден!" 
    exit 1
fi
# Формируем команду для шифрования
gpg_command="gpg --output \"${file_to_encrypt}.gpg\" --encrypt --recipient 
\"${gpg_ids[@]}\""
# Если ID для подписи не пустой, добавляем опцию подписи
if [[ -n "$gpg_sign_id" ]]; then 
   gpg_command+=" --sign --local-user \"$gpg_sign_id\"" 
fi
# Добавляем имя файла к команде
gpg_command+=" \"$file_to_encrypt\""
# Выполняем команду
eval $gpg_command
# Проверяем, успешно ли завершилась команда
if [[ $? -eq 0 ]]; then 
   echo "Файл $file_to_encrypt успешно зашифрован в ${file_to_encrypt}.gpg" 
else 
  echo "Произошла ошибка при шифровании файла."
fi
