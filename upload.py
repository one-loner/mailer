import requests

# URL вашего сайта, где находится форма загрузки
url = 'http://localhost/index.php'  # Замените на URL вашего сайта

# Путь к файлу, который вы хотите загрузить
file_path = 'test'  # Замените на путь к вашему файлу

# Открываем файл в бинарном режиме
with open(file_path, 'rb') as f:
    # Создаем словарь с файлами для отправки
    files = {'fileToUpload': f}
    
    # Отправляем POST-запрос
    response = requests.post(url, files=files)

# Выводим ответ сервера
print(response.text)
