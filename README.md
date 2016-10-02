# Tod

Tod runs commands from your `.travis.yml` file. Type `tod` instead of `docker run -v $(pwd):/my-app -it my-app some-tests` to run your tests

## Installation

Install it yourself simply as:

```bash
$ gem install tod
```

Check the installation with following:

```bash
$ which tod
/path/to/tod
```

## Usage

#### tod

Runs scripts from the `script` section.

```bash
tod # or tod script
```

#### tod before

Runs scripts from the `before_script` section.

```bash
tod before
```

#### tod setup

Runs scripts from the `before_install` section.

```bash
tod setup
```

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/mckomo/tod](https://github.com/mckomo/tod). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
