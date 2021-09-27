exports.CreatePackageFile = ({ name }) ->
  await IO.copy "#{ROOT}/LICENSE", "#{DIR}/LICENSE"

  { version } = require '../../../package.json'

  spec =
    name: name
    main: "./lib/main.js"
    exports:
      require: "./lib/main.js"
      import:  "./lib/esm.mjs"
    version: "0.0.0"
    author: "Anatoly Chernov <chertoly@gmail.com>"
    description: "left as an exercise to the reader"
    license: "0BSD"
    keywords: [
      'coffeescript'
    ]
    scripts:
      build: "coffeelib build"
      start: "coffeelib watch"
      test: "jasmine"
    devDependencies:
      coffeelib: "^#{version}"
      jasmine: "^3.9.0"

  source = JSON.stringify spec, null, 2
  IO.write "#{DIR}/package.json", source
