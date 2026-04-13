var spec;

spec = {
  name: project.name,
  main: "./lib/main.js",
  exports: {
    require: "./lib/main.js",
    import: "./lib/esm.mjs"
  },
  version: "0.0.0",
  author: `${git.name} <${git.email}>`,
  description: "left as an exercise to the reader",
  license: "0BSD",
  keywords: ['coffeescript'],
  scripts: {
    build: "coffeelib build",
    start: "coffeelib watch",
    test: "coffee scripts/run_specs.coffee"
  },
  devDependencies: {
    coffeelib: `^${coffeelib.version}`,
    jasmine: "^6.1.0",
    "@ch1c0t/ext": "^0.2.2"
  }
};

jsonify(spec);
