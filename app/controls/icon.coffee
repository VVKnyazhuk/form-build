define ->
    class Icon
        constructor: ( data ) ->
            @name = data.name
            @src  = data.src

        is: ->
            @src.length > 0

        image: ->
            (if @is() then "<img class='image-sm' src='" + @src + "' />" else "")

        content: ->
            @image() + @name