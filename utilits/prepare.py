from bs4 import BeautifulSoup
import csv

with open('templates/freeze.html') as file:
    soup = BeautifulSoup(file, 'html.parser')

food_blocks = soup.find_all('div', class_='food-block')


with open('products.csv', 'w', newline='') as csvfile:
    fieldnames = ['name', 'price', 'image', 'category']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    writer.writeheader()

    for block in food_blocks:
        # Найти категорию
        category = block.find('div', class_='article-title').text.strip()

        # Обойти каждый продукт в блоке
        for product in block.find_all('article', class_='product-card'):

            # Найти название продукта
            name = product.find('div', class_='product-name').text.strip()

            # Найти цену продукта
            price = product.find('div', class_='price').text.strip()

            # Найти изображение продукта (если есть)
            image = ''
            if product.find('img', class_='img-product'):
                image = product.find('img', class_='img-product')['src']

            # Записать информацию о продукте в CSV файл
            writer.writerow({ 
                'name' : name, 
                'price' : price, 
                'image' : image, 
                'category' : category})