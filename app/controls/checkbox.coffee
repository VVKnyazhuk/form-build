define [
    'knockout'
    'app'
    'cs!controls/select'
], ( ko, app, Select ) ->
    class Checkbox extends Select
        constructor: ( data ) ->
            super data

            delete @multiple;
            delete @icon;

            @type     = "checkbox";
            @template = "checkboxTemplate";
            @isInline = ko.observable data.isInline

        clone: ->
            new Checkbox(
                id:       @id()
                name:     this.name(),
                title:    ko.toJS( @title )
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
                isInline: @isInline()
            )