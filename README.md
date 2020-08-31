Flash Delivery (Backend)
=================================

Install
-------

Create a virtualenv with `Python 3.6` using [virtualenvwrapper](https://virtualenvwrapper.readthedocs.org/en/latest/):

    $ mkvirtualenv rosa -p /usr/bin/python3.6

Install development requirements:

    $ make install

Configure environment variables:

    $ make conf-env

Import campaigns from backoffice API to local database:

	$ make import_campaigns

Run project:

    $ make runserver
