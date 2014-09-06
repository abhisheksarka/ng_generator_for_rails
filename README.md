## Ng Generator for Rails

This gem provides you with a set of generators that you can use to organize your front end angular code. According to this architecture your app is divided into three layers

1. Data layer(talks to the backend, contains buisness logic)
2. Components layer(reusable view components, angular directives)
3. Sections layer(page specific logic)

### Usage

## Main application generator
`rails g ng_app ap` creates the following files in your `app/assets/javascripts` directory

```
  create  app/assets/javascripts/module.js
  create  app/assets/javascripts/components/module.js
  create  app/assets/javascripts/data/module.js
  create  app/assets/javascripts/sections/module.js
```

Here `ap` is the namespace and your global application module. Every other angular component should be named using this namespace. This prevents your components to conflict with vendor components provided by third party libraries.

## Resource/Data generator

`rails g ng_data ap::user` creates the following file with the following code

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
The generated code will set up the angular resource for you. If your model name has an underscore it will be converted to camel case for factory naming but file names and urls will be snake cased.

for e.g. `rails g ng_data ap::user_contact` will generate the following

`create  app/assets/javascripts/data/user_contact.js`

```javascript
(function(){
  var app = angular.module("gen.data");
  
  app.factory("gen.data.userContacts", [ "$resource", 
    function ($resource) {
      var Resource = $resource( "/user_contacts/:id", { id: "@id" }),
          proto = Resource.prototype;

      //    
      // Instance methods and class methods go here
      // 

      return Resource;
    }
  ]);
}());
```

## Component generator

`rails g ng_component ap::age_slider` creates the following files

```
create  app/assets/javascripts/components/age_slider/directive.js
create  app/assets/javascripts/components/age_slider/template.html
create  app/assets/javascripts/components/age_slider/controller.js
create  app/assets/javascripts/components/age_slider/module.js
```

The generated codes for these files will be as follows

```javascript
(function(){

  var app = angular.module("ap.components.ageSlider");

  app.directive("apAgeSlider", [function(){
    return{
      scope: { },
      replace: true,
      
      templateUrl: "components/ageSlider/template.html",
      controller: "ap.components.ageSlider.Controller",

      link: function($scope, $element, $attributes){
        // your DOM manipulation logic for this component goes here 
      }
    }; 
  }]); 

}());
```

