define [
    'knockout'
    'cs!controls/input'
], ( ko, Input ) ->
    class Textarea extends Input
        constructor: ( data ) ->
            super data

            @type     = 'textarea'
            @template = 'textareaTemplate'

        clone: ->
            new Textarea(
                id:          @id()
                name:        this.name()
                title:       ko.toJS @title
                placeholder: ko.toJS @placeholder
                helpText:    ko.toJS @helpText
                required:    @required()
            )