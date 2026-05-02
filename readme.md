## Introduction

`coffeelib` is a tool to create isomorphic projects with CoffeeScript. You can install it globally with

```
npm install coffeelib -g
```

## Usage

### `coffeelib new NAME [TEMPLATE]`

creates a directory named NAME and a new project inside of it.

TEMPLATE determines what kind of project will be created.
Omitting TEMPLATE, as in `coffeelib new name`, creates a basic CoffeeScript library.

Specifying TEMPLATE, as in `coffeelib new name cli`, creates a CLI project.
It provides a CLI which implements common commands(like `help`, `version`, `-v`, `--version`),
and a setup based on [Jasmine](https://jasmine.github.io/), which shows how to test these commands.
This makes adding new commands easier.

Inside of a project directory, you can use

- `npm start`;
- `npm run build`;
- `npm test`;

### `npm start`

is to build the project on startup, and then
rebuild it when the sources in the `src` directory change.

### `npm run build`

is to build the project. It compiles the sources in the `src` directory to the `lib` directory.

It creates automatically [a ES module wrapper for a CommonJS module][wrapper].
This allows to use the library both with `require` and `import`.

[wrapper]: https://nodejs.org/api/packages.html#packages_writing_dual_packages_while_avoiding_or_minimizing_hazards

### `npm test`

is to run the tests. All `coffeelib` templates go together with passing tests
and means to evolve test environments.

### Usage examples

- https://github.com/ch1c0t/fun
- https://github.com/ch1c0t/pascalize.lispcase
- https://github.com/ch1c0t/hyphenate.pascalcase
- https://github.com/ch1c0t/hobby-rpc.clients.nodejs

## Development

To work on `coffeelib` itself, you can use the following commands.

`npm start` to start a development session.

`npm test` to run the tests.
