# README

# Steps to Create

* rails new <app_pathname> --api

* Gemfile: Uncomment rack-cors gem

* Run bundle install.

* Go to cors.rb in the config and uncomment out the middleware code.

* rails g scaffold post title body:text

* rails db:migrate

* npm create vite@latest

** Project Name: Vue (or whatever)
** Select Framework: Vue
** Select variant: JavaScript

# To get your application running

* In your Rails backend, run rails s

* In your Rails/Vue front end, run npm run dev

