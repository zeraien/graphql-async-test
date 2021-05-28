#!/bin/bash
# django housekeeping and then run supervisor ####################
./manage.py collectstatic --noinput && ./manage.py migrate && ./manage.py loaddata dummy_data.json && ./manage.py loaddata much_data.json && supervisord -n
