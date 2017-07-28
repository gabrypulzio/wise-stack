# Wise -\`ღ´- Stack

Wise-stack is a modular Rails 5.1+ application template focused on Ruby developing
best practices.

Wise-stack aims to provide a customizable stack of recipes for the template. It always install the gem latest version obtained from rubygems.org, so you don't have to bother to
have the template up-to-date

## Usage

```shell
git clone git@github.com:gabrypulzio/wise-stack.git /path/to/wise-stack
rails new [APPLICATION_NAME] -m /path/to/wise-stack/template.rb
```

## Features

* modular recipes
* produces explicit gem version on Gemfile, to avoid breaking changes on code in
case of gem updates (see: [rubygems guides](http://guides.rubygems.org/patterns/#pessimistic-version-constraint)
* automatically install latest versions of gems
* avoids garbaging of Gemfile for indipendent tools (like rubocop and html2slim)
* updates automatically system gem tools (rubocop, html2slim)
* uses [Slim](http://slim-lang.com/) as template laguange
* testing with [Rspec](http://rspec.info/) and [Factory Girl](https://github.com/thoughtbot/factory_girl)
* best practices tools:
  * overcommit
  * rubocop integration
* common developing tools:
  * [Slim](http://slim-lang.com/) template laguange
  * [awesome_print](https://github.com/awesome-print/awesome_print)
  * [better_errors](https://github.com/charliesome/better_errors) (automatically configures editor if sublime or atom are installed)
  * [boostrap-sass](https://github.com/twbs/bootstrap-sass) (optional)
  * bootstrap 'navbar-static-top' [layout template](http://getbootstrap.com/examples/navbar-static-top/) ready to use (optional)
  * [brakeman](https://github.com/presidentbeef/brakeman)
  * [pry](https://github.com/pry/pry)
  * [devise](https://github.com/plataformatec/devise) (optional)
  * [simple_form](https://github.com/plataformatec/simple_form) (if bootstrap is installed it automatically handles bootstrap integration)
  * [xray-rails](https://github.com/brentd/xray-rails)
* security tools:
  * [brakeman](https://github.com/presidentbeef/brakeman)
  * [bundler_audit](https://github.com/rubysec/bundler-audit)
  * [secure_headers](https://github.com/anotherhale/secure_headers) with a minimal working configuration (https://github.com/anotherhale/secure_headers)
* testing tools:
  * [Rspec](https://github.com/rspec/rspec)
  * [Factory Girl](https://github.com/thoughtbot/factory_girl)
  * [database_cleaner](https://github.com/DatabaseCleaner/database_cleaner) (it configures spec_helper automatically)
* customizations:
  * git gitignore that properly ignores security sensitive files
  * rails overwrites for a more clean and secure scaffolding


## Special notes on recipes

* rails_overwrites:
  * disables scaffold stylesheets, assets, helpers and json from scaffolding
  * sets quiet assets
  * removes application.css and install a blank application.scss in favor of scss syntax

* rubocop:
  * uses user ~/.rubocop.yml for configuration. If the configuration is not present, the recipe will
  download [this](https://gist.githubusercontent.com/gabrypulzio/892dbb0bae11048da89772fcb109705c/raw/5a39c628d3e274140a973aa4d0af7baa0ab65da8/.rubocop.yml) rubocop configuration on the root of the project
  * a rubocop autocorrection will be executed on the project after bundle

* slim-rails
  * all views will be automatically converted to slim using html2slim

* secure_headers
  * a basic configuration is provided. Remember to review secure_headers initializers before going
  to production
