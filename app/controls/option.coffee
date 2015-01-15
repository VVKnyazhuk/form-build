define [
    'knockout'
], ( ko ) ->
    class Option
        constructor: ( data ) ->
            CreateLocale = require('cs!helper/util').CreateLocale

            @name  = new CreateLocale( data.name )
            @value = ko.observable data.value