# Wise -\`ღ´- Stack

Wise-stack is an opinioned modular Rails 6.1+ application template focused on Ruby on Rails developing
best practices.
Wise-stack aims to provide a customizable stack of recipes to simplify the installation
and configuration of the most useful tools for rails developing.

Every gem in the recipes will be installed with the latest version obtained from rubygems.org and described
in Gemfile with the pessimistic version constraint operator, to avoid breaking
changes in case of a bundle update.

Some recipes are optionals. Wise-stack asks for installation, but you can configure default answers on default_answers.yml

## Usage

```shell
git clone git@github.com:gabrypulzio/wise-stack.git /path/to/wise-stack
rails new [APPLICATION_NAME] -T -m /path/to/wise-stack/template.rb
```

## Features

* Modular recipes
* Use pessimistic version constraint operator on Gemfile, to avoid breaking changes on code in
case of gem updates (see: [rubygems guides](http://guides.rubygems.org/patterns/#pessimistic-version-constraint))
* Best practices tools:
  * [Overcommit](https://github.com/brigade/overcommit).
  * [Rubocop](https://github.com/rubocop-hq/rubocop).
* Common developing tools:
  * [Awesome_print](https://github.com/awesome-print/awesome_print).
  * [Better_errors](https://github.com/charliesome/better_errors).
  * [Pry](https://github.com/pry/pry).
  * [Devise](https://github.com/plataformatec/devise) (optional).
  * [Simple_form](https://github.com/plataformatec/simple_form) (if bootstrap is installed it handles automatically bootstrap integration).
  * [Foreman](https://github.com/ddollar/foreman) to simplify development with webpack-dev-server
* security tools:
  * [Brakeman](https://github.com/presidentbeef/brakeman).
  * [Bundler_audit](https://github.com/rubysec/bundler-audit).
* testing tools:
  * [Rspec](https://github.com/rspec/rspec).
  * [Factory Bot](https://github.com/thoughtbot/factory_bot).
  * [database_cleaner](https://github.com/DatabaseCleaner/database_cleaner)
    (with a tailored configuration for rspec installed with the recipe).
* customizations:
  * Git gitignore that properly ignores security sensitive files.
  * Rails overwrites for a more clean and secure scaffolding.
  * Custom .rubocop.yml with a rails friendly configuration.


## Special notes on recipes

* Webpack:
  * Use stylesheet_pack_tag for stylesheets.
  * wise-stack renames app/javascript to app/webpacker because it's possibile to
  handle stylesheets too with wepbacker. The structure is configured as below:

```
app/webpacker/
├── packs
│   ├── application.js
│   └── stylesheets.scss
└── src
    ├── javascripts # optionals javascripts to be included in packs/application.js
    └── stylesheets # optionals stylesheets to be included in packs/application.scss
```

* Bootstrap:
  * Inject bootstrap helpers for flash messages in application.html.erb

* Rails_overwrites:
  * Disable scaffold stylesheets, assets, helpers and json from scaffolding.
  * Remove application.css and install a blank application.scss in favor of scss syntax.

* Rubocop:
  * Install a custom .rubocop.yml on the project root path.
  * A rubocop autocorrection will be executed at the end of the template process.
