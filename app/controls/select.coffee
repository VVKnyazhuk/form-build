define [
    'knockout'
    'app'
    'cs!controls/option'
], ( ko, app, Option ) ->
    class Select
        constructor: ( data ) ->
            util = require 'cs!helper/util'
            CreateLocale = util.CreateLocale

            @type     = 'select'
            @template = 'selectTemplate'

            @locale   = ko.observable app.currentLocale

            @id       = ko.observable data.id
            @name     = ko.observable data.name
            @title    = new CreateLocale( data.title )
            @icon     = ko.observable util.getIcon( data )

            @multiple = ko.observable data.multiple

            @options = ko.observableArray []

            @options.push( new Option option ) for option in data.options

            @addOption = =>
                @options.push( new Option(
                    name: 'New option'
                    value: 0
                ))
                return

            @removeOption = ( data ) =>
                @options.remove( data )
                return

            @buffer = ( data ) =>
                app.root.buffer ko.toJS( @ )
                initUI()
                return

        clone: ->
            new Select(
                id:       @id()
                title:    ko.toJS( @title )
                name:     @name()
                options:  [
                    {
                        name: "One options"
                        value: 1
                    }
                    {
                        name: "Two options"
                        value: 2
                    }
                ]
                multiple: @multiple()
                icon:     @icon()
            )