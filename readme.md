## Introduction

`coffeelib` is a tool to create isomorphic libraries with CoffeeScript. You can install it globally with

```
npm install coffeelib -g
```

and then use

```
coffeelib new NAME
```

to create a directory named NAME and a new library inside of it. For example, `coffeelib new name0`.

After entering the directory with `cd name0`, you can use

- `npm test`;
- `coffeelib build`;
- `coffeelib watch`;

### `npm test`

is to run the tests. `coffeelib` creates all new libraries with a basic function and a basic test for it.

### `coffeelib build`

is to build the library. It compiles the sources in the `src` directory to the `lib` directory.

It creates automatically [a ES module wrapper for a CommonJS module][wrapper]. This makes it easier to use the library both in Node.js and Webpack.

[wrapper]: https://nodejs.org/api/packages.html#packages_writing_dual_packages_while_avoiding_or_minimizing_hazards

### `coffeelib watch`(or `npm start`)

is to rebuild the library when the sources in the `src` directory change.

## Development

To work on `coffeelib` itself, you can use the following commands.

`npm start` to start a development session.

`npm test` to run the tests.
