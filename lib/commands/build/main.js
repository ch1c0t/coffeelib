(function() {
  var BuildESM, BuildMain, FindNames, compile;

  ({compile} = require('coffeescript'));

  BuildMain = async function() {
    var output, source;
    source = (await IO.read(`${SRC}/main.coffee`));
    output = compile(source);
    IO.write(`${LIB}/main.js`, output);
    return (await BuildESM(source));
  };

  BuildESM = async function(source) {
    var lines, names;
    names = FindNames(source);
    lines = names.map(function(name) {
      return `export const ${name} = m.${name}`;
    });
    return (await IO.write(`${LIB}/esm.mjs`, ["import m from './main.js'", ...lines].join("\n")));
  };

  FindNames = function(source) {
    var ast, i, left, len, names, node, nodes, object, property, ref, ref1, right;
    names = [];
    ast = compile(source, {
      ast: true
    });
    nodes = ast.program.body;
    for (i = 0, len = nodes.length; i < len; i++) {
      node = nodes[i];
      if ((node != null ? (ref = node.expression) != null ? ref.type : void 0 : void 0) === 'AssignmentExpression') {
        ({left, right} = node.expression);
        if (((left != null ? left.type : void 0) === 'MemberExpression') && ((left != null ? (ref1 = left.object) != null ? ref1.type : void 0 : void 0) === 'Identifier')) {
          ({object, property} = left);
          switch (object.name) {
            case 'module':
              if (right.type === 'ObjectExpression') {
                names = right.properties.map(function(property) {
                  return property.key.name;
                });
              }
              break;
            case 'exports':
              names.push(left.property.name);
          }
        }
      }
    }
    return names;
  };

  module.exports = {BuildMain, FindNames};

}).call(this);
