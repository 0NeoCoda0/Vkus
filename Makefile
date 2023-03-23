start:
	poetry run flask --app app --debug run
prod:
	poetry run gunicorn --reload --workers=4 --bind=127.0.0.1:5000  app:app
test:
	poetry run pytest -s -vv

factory:
	poetry run flask --app models.app.create_app:create_app run