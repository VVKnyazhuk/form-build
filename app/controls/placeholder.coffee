define [
    'knockout',
    'app'
], ( ko, app ) ->
    class Placeholder
        constructor: ( data ) ->
            util = require 'cs!helper/util'

            @type     = 'placeholder'
            @template = 'placeholderTemplate'

            @contentLeft  = ko.observableArray []
            @contentRight = ko.observableArray []

            @leftClass    = ko.observable null
            @rightClass   = ko.observable null
            @ratio        = ko.observable( data.ratio )

            for control in data.contentLeft
                _itemTempLeft = util.getControl( control )
                @contentLeft.push( _itemTempLeft ) if _itemTempLeft

            for control in data.contentRight
                _itemTempRight = util.getControl( control )
                @contentRight.push( _itemTempRight ) if _itemTempRight

            ko.computed =>
                proportion = @ratio().split(":")
                leftInd  = parseInt(proportion[ 0 ], 10)
                rightInd = parseInt(proportion[ 1 ], 10)

                @leftClass (if leftInd is 0 then "hide" else "col-xs-" + leftInd)
                @rightClass (if rightInd is 0 then "hide" else "col-xs-" + rightInd)
                return

            @removeItem = =>
                @contentLeft.remove( data )
                @contentRight.remove( data )
                return

            @buffer = ( data ) =>
                app.root.buffer ko.toJS( @ )
                initUI()
                return

            @cancelChange = ( data ) =>
                @contentLeft.replace( data, util.getControl app.root.buffer() )
                @contentRight.replace( data, util.getControl app.root.buffer() )
                return

        clone: ->
            new Placeholder(
                ratio:        @ratio()
                contentLeft:  []
                contentRight: []
            )