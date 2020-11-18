find .  -name "__pycache__" -exec rm -rf {} \;
find .  -name "000*" -exec rm -rf {} \;
./manage.py makemigrations
./manage.py migrate
# ./manage.py loaddata test_data.json