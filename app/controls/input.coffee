define [
    'knockout'
    'app'
], ( ko, app ) ->
    class Input
        constructor: ( data ) ->
            util = require 'cs!helper/util'
            CreateLocale = util.CreateLocale

            @type     = 'input'
            @template = 'inputTemplate'

            @locale   = ko.observable app.currentLocale

            @id       = ko.observable data.id
            @name     = ko.observable data.name
            @title    = new CreateLocale( data.title )

            @placeholder = new CreateLocale( data.placeholder )
            @helpText    = new CreateLocale( data.helpText )
            @required    = ko.observable data.required

            @icon    = ko.observable util.getIcon( data )

            @buffer = ( data ) =>
                app.root.buffer ko.toJS( @ )
                initUI()
                return

        clone: ->
            new Input(
                id:          @id()
                name:        @name()
                title:       ko.toJS @title
                placeholder: ko.toJS @placeholder
                helpText:    ko.toJS @helpText
                required:    @required()
            )