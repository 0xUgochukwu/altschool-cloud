# How to setup


- Clone the laravel example application
  `$ git clone https://github.com/alexeymezenin/laravel-realworld-example-app.git`

- Download the `Dockerfile`, `docker-compose.yml`, `.dockerignore` and make sure all the parameters are provided in the `.env` file, (you can use the `.env.exmaple` file provided)
- cd into the repo (make sure you have docker installed) and run 
  `$ docker compose up`
- Run these commands 
  - `$ docker-compose exec laravel-app composer create-project`
  - `$ docker-compose exec laravel-app php artisan key:generate` 
  - `$ docker-compose exec laravel-app php artisan config:cache`
  - `$ docker-compose exec laravel-app php artisan migrate`
- The app starts on port 80 so you can visit http://your-server-ip to view the app
