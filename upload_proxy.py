import requests

# URL вашего сайта, где находится форма загрузки
url = 'http://localhost/index.php'  # Замените на URL вашего сайта

# Путь к файлу, который вы хотите загрузить
file_path = 'path/to/your/file.txt'  # Замените на путь к вашему файлу

# Настройки прокси
proxies = {
    'http': 'socks5h://username:password@proxy_host:proxy_port',  # Замените на ваши данные
    'https': 'socks5h://username:password@proxy_host:proxy_port',  # Замените на ваши данные
}

# Открываем файл в бинарном режиме
with open(file_path, 'rb') as f:
    # Создаем словарь с файлами для отправки
    files = {'fileToUpload': f}
    
    # Отправляем POST-запрос через прокси
    response = requests.post(url, files=files, proxies=proxies)

# Выводим ответ сервера
print(response.text)

