start:
	poetry run flask --app app --debug run
prod:
	poetry run gunicorn --reload --workers=4 --bind=127.0.0.1:5000  app:app