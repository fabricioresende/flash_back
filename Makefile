DJANGO_CMD = python src/manage.py

SETTINGS = flash_back.settings



# Helpers

clean:
	@find . -name "*.pyc" | xargs rm -rf
	@find . -name "*.pyo" | xargs rm -rf
	@find . -name "__pycache__" -type d | xargs rm -rf
	@find . -name ".cache" -type d | xargs rm -rf

conf-env:
	@cp -n contrib/localenv .env
	@echo 'Please configure params from .env file.'

requirements-pip:
	@pip install --upgrade pip
	@pip install -r requirements/development.txt


# Install

install: clean conf-env requirements-pip migrate #createsuperuser



# Development

migrations:
	@$(DJANGO_CMD) makemigrations $(app)

migrate:
	@$(DJANGO_CMD) migrate

collectstatic:
	@$(DJANGO_CMD) collectstatic

shell: clean
	export settings=config.settings && \
	$(DJANGO_CMD) shell

createsuperuser:
	@$(DJANGO_CMD) createsuperuser

runserver: clean
	export settings=config.settings && \
	$(DJANGO_CMD) runserver 0.0.0.0:8000