import csv
import psycopg2

# Соединение с базой данных PostgreSQL
conn = psycopg2.connect(
    host="localhost",
    database="vkus",
    user="neocoda",
    password="grand_user"
)

# Открытие курсора для выполнения запросов к базе данных
cur = conn.cursor()

# Чтение данных из CSV файла и вставка их в базу данных
with open('utilits/freeze-food.csv', 'r') as f:
    reader = csv.reader(f, delimiter=',')
    next(reader)  # пропускаем заголовок файла
    for row in reader:
        cur.execute(
            "INSERT INTO products (name, price, image, category, type) VALUES (%s, %s, %s, %s, %s);",
            (row[0], row[1], row[2], row[3], row[4])
        )

# Сохранение изменений в базе данных и закрытие соединения
conn.commit()
cur.close()
conn.close()