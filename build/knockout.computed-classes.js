// Generated by CoffeeScript 1.4.0
var root;

root = module ? module.exports = require('knockout') : window.ko;

root.hasComputedProperties = function(klass) {
  klass._computed_build_procs = {};
  klass.prototype.getComputed = function(name) {
    var proc, _name;
    proc = klass._computed_build_procs[name];
    return this[_name = "_computed_" + name] || (this[_name] = root.computed(proc, this));
  };
  return klass.computed = function(name, proc) {
    klass._computed_build_procs[name] = proc;
    return klass.prototype[name] = function() {
      return this.getComputed(name)();
    };
  };
};