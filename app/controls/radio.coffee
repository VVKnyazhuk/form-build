define [
    'knockout'
    'cs!controls/checkbox'
], ( ko, Checkbox ) ->
    class Radio extends Checkbox
        constructor: ( data ) ->
            super data

            @type     = "radio"
            @template = "radioTemplate"

        clone: ->
            new Radio(
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