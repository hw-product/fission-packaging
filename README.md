# Fission Packaging

Make a packge of a fission product.

## Usage

### Installing

```
$ git clone git@github.com:heavywater/fission-packaging.git
$ cd fission-packaging
$ command-to-use-jruby
$ bundle install
```

### Setup

You'll need a jruby-complete.jar. If you haven't fetched it
yet, run:

```
$ bundle exec make-package jrubyjar
```

### Building

```
$ bundle exec make-package build nellie --gemfile gemfiles/nellie
$ java -jar package/nellie.jar -c path/to/config.json
```

### Cleaning

```
$ bundle exec make-package clean
```

## Result

yay!