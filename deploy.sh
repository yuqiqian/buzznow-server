git add .
git commit -m "fixing pg error"
git push heroku master
heroku run rake db:migrate