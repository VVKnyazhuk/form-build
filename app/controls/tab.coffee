define [
    'knockout'
    'app'
], ( ko, app ) ->
    class Tab
        constructor: ( data ) ->
            util = require 'cs!helper/util'

            @type    = "tab";
            @id      = ko.observable data.id

            @locale  = ko.observable app.currentLocale

            @title   = new util.CreateLocale( data.title )
            @content = ko.observableArray data.content

            @icon    = ko.observable util.getIcon( data )

            @buffer = ( data ) =>
                app.root.buffer ko.toJS( @ )
                initUI()
                return

            @cancelChange = ( data ) =>
                @content.replace( data, util.getControl( app.root.buffer() ) )
                return

            @removeItem = ( item ) =>
                @content.remove( item )
                return