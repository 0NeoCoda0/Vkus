start:
	poetry run flask --app main --debug run
prod:
	poetry run gunicorn --reload --workers=4 --bind=127.0.0.1:5000  main:app
test:
	poetry run pytest -s -vv

factory:
	poetry run flask --app main_logic run