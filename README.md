# Wise -\`ღ´- Stack

Wise-stack is an opinioned modular Rails 5.2+ application template focused on Ruby developing
best practices. It's compatible with rails 6.0+

Wise-stack aims to provide a customizable stack of recipes for the template. It installs the latest gem version obtained from rubygems.org, so you don't have to bother to have the template up-to-date.

Some recipes are optionals. Wise-stack asks for installation, but you can configure default answers on default_answers.yml

## Usage

```shell
git clone git@github.com:gabrypulzio/wise-stack.git /path/to/wise-stack
rails new [APPLICATION_NAME] -T -m /path/to/wise-stack/template.rb
```

## Features

* Modular recipes
* Produces explicit gem version on Gemfile, to avoid breaking changes on code in
case of gem updates (see: [rubygems guides](http://guides.rubygems.org/patterns/#pessimistic-version-constraint))
* Automatically install latest versions of gems.
* Updates automatically system gem tools (rubocop, html2slim).
* Webpack compatible.
* Uses [Slim](http://slim-lang.com/) as template language.
* Best practices tools:
  * [Overcommit](https://github.com/brigade/overcommit).
  * [Rubocop](https://github.com/rubocop-hq/rubocop) integration.
* Common developing tools:
  * [Slim](http://slim-lang.com/) template laguange.
  * [Awesome_print](https://github.com/awesome-print/awesome_print).
  * [Better_errors](https://github.com/charliesome/better_errors) (automatically configures editor based on user installed editor).
  * Basic bootstrap template ready to use (optional).
  * [Pry](https://github.com/pry/pry).
  * [Devise](https://github.com/plataformatec/devise) (optional).
  * [Simple_form](https://github.com/plataformatec/simple_form) (if bootstrap is installed it automatically handles bootstrap integration).
  * [Xray-rails](https://github.com/brentd/xray-rails).
* security tools:
  * [Brakeman](https://github.com/presidentbeef/brakeman).
  * [Bundler_audit](https://github.com/rubysec/bundler-audit).
* testing tools:
  * [Rspec](https://github.com/rspec/rspec).
  * [Factory Bot](https://github.com/thoughtbot/factory_bot).
  * [database_cleaner](https://github.com/DatabaseCleaner/database_cleaner) (it configures spec_helper automatically).
* customizations:
  * Git gitignore that properly ignores security sensitive files.
  * Rails overwrites for a more clean and secure scaffolding.
  * Custom .rubocop.yml with a rails friendly configuration.


## Special notes on recipes

* Webpack:
  * wise-stack renames app/javascript to app/webpacker because it's possibile to put stylesheets too in this directory. The structure is configured like this:

```
app/webpacker/
├── packs
│   ├── application.js
│   └── stylesheets.scss
└── src
    ├── javascripts # optionals javascripts to be included in packs/application.js
    └── stylesheets # optionals stylesheets to be included in packs/stylesheets.scss
```

* Bootstrap:
  * If used, stylesheets will be served through webpack, to simplify stylesheets management.

* Rails_overwrites:
  * Disables scaffold stylesheets, assets, helpers and json from scaffolding.
  * Sets quiet assets.
  * Removes application.css and install a blank application.scss in favor of scss syntax.

* Rubocop:
  * Installs a custom .rubocop.yml on the project root path.
  * A rubocop autocorrection will be executed in the end of the template process.

* Slim-rails
  * All views will be automatically converted to slim using html2slim in the end of the template process.
