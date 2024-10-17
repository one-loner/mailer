import os
import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin

def download_file(url, folder):
    try:
        response = requests.get(url)
        response.raise_for_status()  # Проверка на ошибки
        filename = os.path.join(folder, url.split('/')[-1])
        with open(filename, 'wb') as f:
            f.write(response.content)
        print(f"Скачан файл: {filename}")
    except Exception as e:
        print(f"Ошибка при скачивании {url}: {e}")

def download_page_and_files(url, folder):
    try:
        response = requests.get(url)
        response.raise_for_status()  # Проверка на ошибки
        soup = BeautifulSoup(response.text, 'html.parser')

        # Создание папки для сохранения файлов
        if not os.path.exists(folder):
            os.makedirs(folder)

        # Скачивание всех файлов по ссылкам
        for link in soup.find_all('a', href=True):
            file_url = urljoin(url, link['href'])
            download_file(file_url, folder)

    except Exception as e:
        print(f"Ошибка при скачивании страницы {url}: {e}")

if __name__ == "__main__":
    url = input("Введите URL страницы: ")
    folder = input("Введите имя папки для сохранения файлов: ")
    download_page_and_files(url, folder)
