## Ng Generator for Rails

This gem provides you with a set of generators that you can use to organize your front end angular code. According to this architecture your app is divided into three layers

1. Data layer(talks to the backend, contains buisness logic)
2. Components layer(reusable view components, angular directives)
3. Sections layer(page specific logic)

### Usage

1. `rails g ng_app ap` creates the following files in your `app/assets/javascripts` directory

```
  create  app/assets/javascripts/module.js
  create  app/assets/javascripts/components/module.js
  create  app/assets/javascripts/data/module.js
  create  app/assets/javascripts/sections/module.js
```

Here `ap` is the namespace and your global application module. Every other angular component should be named using this namespace. This prevents your components to conflict with vendor components provided by third party libraries.

2. `rails g ng_data ap::user` creates the following file with the following code

`create  app/assets/javascripts/data/user.js`

```javascript
(function(){
  var app = angular.module("gen.data");
  
  app.factory("gen.data.user", [ "$resource", 
    function ($resource) {
      var Resource = $resource( "/users/:id", { id: "@id" }),
          proto = Resource.prototype;

      //    
      // Instance methods and class methods go here
      // 

      return Resource;
    }
  ]);
}());
```

