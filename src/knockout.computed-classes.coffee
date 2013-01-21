root = if module
  module.exports = require 'knockout'
else
  window.ko
root.hasComputedProperties = (klass) ->
  klass._computed_build_procs = {}
  klass.prototype.getComputed = (name) ->
    proc = klass._computed_build_procs[name]
    this["_computed_#{name}"] ||= root.computed(proc, this)
  klass.computed = (name, proc) ->
    klass._computed_build_procs[name] = proc

    klass.prototype[name] = ->
      @getComputed(name)()
