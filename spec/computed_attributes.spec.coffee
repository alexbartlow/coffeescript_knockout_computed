process.on 'uncaughtException', (e) ->
  console.log("Caught unhandled exception: " + e)
  console.log(" ---> : " + e.stack)

ko = require '../src/knockout.computed-classes.coffee'

class TestClass
  constructor: ->
    @name = ko.observable("Foo")
  ko.hasComputedProperties @
  @computed 'fancyName', ->
    @name() + " with style!"
  foo: ->
    "foo"

describe "TestClass computed attributes", ->
  instance = null

  beforeEach ->
    instance = new TestClass

  it "instantiates OK", ->
    instance.foo()
    expect(instance).toEqual(jasmine.any(TestClass))
    expect(instance.name()).toEqual("Foo")
  
  it "allows computed properties", ->
    expect(instance.fancyName()).toEqual("Foo with style!")

  it "is a real computed property", ->
    instance.name("Alex")
    expect(instance.fancyName()).toEqual("Alex with style!")

  it "getComputed returns the raw computed function", ->
    expect(instance.getComputed('fancyName')()).toEqual('Foo with style!')

