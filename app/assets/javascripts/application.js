// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .



// The MIT License (MIT) => http://www.opensource.org/licenses/mit-license
// Copyright (c) 2012 Artūrs Mekšs
//
// Runtime depndency jQuery 1.4 or above
(function($, rootspace){
  window[rootspace] = function(namespace, object){
    var setNamespace = function(namespace){
      var root = window[rootspace];
      $(namespace.split(".")).each(function(idx, name){
        root = root[name] = root[name] || {};
      });
      return root;
    };
    return $.extend(true, setNamespace(namespace), object);
  };
})(jQuery, "APP");