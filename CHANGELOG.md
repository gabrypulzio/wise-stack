### 1.2.1 - 2020-01-06

* Fix: Disable xray_rails recipe in rails 6 due to a current bug in the xray-rails gem.
* Add rails-ujs javascript code in application.js only for rails 5; rails 6 already add the proper code.

### 1.2.0 - 2020-01-06

* Use webpacker.
* Rails 6.0+ compatibility.
* Use default_answers.yml template for a fully automated template generation.
* Remove secure_headers recipe.
* Update .rubocop.yml template.


### 1.1.0 - 2018-12-29

* Add a gem dependency method.
* Update rails_factory_girl recipe to factory_bot_rails.
* Use mini_racer instead of therubyracer
* Add a basic user dashboard recipe.
* Better_errors: fix initializer.
* Bootstrap: update to 4.2. Add GUI helpers.
* Slim_rails: use pretty format in development.
* Gitignore: updated file.
* Rubocop: better .rubocop.yml more rails friendly.

### 1.0.0 - 2017-08-12

* First version.
