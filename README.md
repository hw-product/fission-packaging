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

### Building

```
$ bundle exec make-package build nellie --gemfile gemfiles/nellie
$ java -jar package/jar/nellie.jar
```

### Cleaning

```
$ bundle exec make-package clean
```

## Result

yay!