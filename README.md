This project allows you to use computed attributes with Coffeescript
Classes using Knockout.js, like so:

```
class Animal
  ko.hasComputedProperties @
  computed "greeting", ->
    "#{@name()} says hi!"

  constructor:
    @name = ko.observable("Jaguar")

animal = new Animal
animal.name() # => "Jaguar"
animal.greeting() # => "Jaguar says hi!"
animal.name("Giant Squid")
animal.greeting() # => "Giant Squid says hi!"

animal.getComputed("greeting") # => (the raw computed observable object, for form fields and the like)
```

