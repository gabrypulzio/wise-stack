## 2.0.0 - 2021-01-14

Wise-stack is now compatible only with rails >= 6.1.0 and adheres to the new
rails conventions. Assets recipes (such as bootstrap) will now only be installed
as yarn packages. There has been some clean up of recipes that are no
more necesessary.

### Complete changelog:

* Minimum Rails version 6.1.0
* Deprecate installation of Boostrap with gem. Bootstrap is now installed only
  as a yarn package.
* Deprecate installation of the Bootstrap template.
* Deprecate installation of the basic user dashboard.
* Deprecate installation of slim-rails.
* Deprecate rails_ujs_webpacker recipe.
* Deprecate xray_rails recipe (you can now use rails configuration
  `config.action_view.annotate_rendered_view_with_filenames`).
* Handle yarn packages installation.
* Re-enable Secure Headers gem installation and configuration.
* Add foreman and a Procfile template to handle developing with webpack-dev-server.
* Deprecate handling of default editor configuration on BetterError
  (you can just set BETTER_ERRORS_EDITOR or EDITOR environment variable).
* Fix require of bundler_audit.
* Fix database_cleaner configuration destination file.
* Deprecate mini_racer recipe.
* Add `overcommit --sign` in overcommit recipe.
* Add rubocop-rails in rubocop recipe.
* Improve .overcommit.yml template configuration.
* Improve .rubocop.yml template configuration.

## 1.2.1 - 2020-01-06

* Fix: Disable xray_rails recipe in rails 6 due to a current bug in the xray-rails gem.
* Add rails-ujs javascript code in application.js only for rails 5; rails 6 already add the proper code.

## 1.2.0 - 2020-01-06

* Use webpacker.
* Rails 6.0+ compatibility.
* Use default_answers.yml template for a fully automated template generation.
* Remove secure_headers recipe.
* Update .rubocop.yml template.


## 1.1.0 - 2018-12-29

* Add a gem dependency method.
* Update rails_factory_girl recipe to factory_bot_rails.
* Use mini_racer instead of therubyracer
* Add a basic user dashboard recipe.
* Better_errors: fix initializer.
* Bootstrap: update to 4.2. Add GUI helpers.
* Slim_rails: use pretty format in development.
* Gitignore: updated file.
* Rubocop: better .rubocop.yml more rails friendly.

## 1.0.0 - 2017-08-12

* First version.
