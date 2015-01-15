define [
    'knockout'
    'app'
    'cs!helper/util'
    'cs!controls/icon'
    'text!data/tabInput.json'
    'text!data/tabPlaceholder.json'
    'text!data/tabSelect.json'
    'text!data/tabCheckboxRadio.json'
], ( ko, app, util, Icon, dTabInput, dTabPlaceholder, dTabSelect, dTabCheckboxRadio ) ->
    class FormBuild
        constructor: ->
            app.root = @

            @currentLocale = ko.observable app.currentLocale
            @locales       = ko.observableArray app.locales

            #Tabs
            @confTabs = ko.observableArray []
            @componentsTabs = ko.observableArray []

            # Active tab
            @confSelectTab = ko.observable null
            @compSelectTab = ko.observable null

            @settingsTab = new util.SettingsTab( @ )

            @buffer = ko.observable {}

            @icons = ko.observableArray []

            @isLocales = =>
                @locales().length > 1

            @changeLocale = ( data ) =>
                @currentLocale data
                return

            @removeTab = ( data ) =>
                @confTabs.remove data
                @confSelectTab @confTabs()[ 0 ]
                return

            @cancelChange = ( data ) =>
                _index = @confTabs.indexOf( data )
                @confTabs.replace( data, util.fillTabContent( @buffer() ) )
                @confSelectTab @confTabs()[ _index ]
                return


        # Methods
        save: ->
            ko.toJSON @confTabs

        load: ( data ) ->
            @confTabs []

            @componentsTabs( [
                util.fillTabContent ko.utils.parseJson( dTabPlaceholder )[ 0 ]
                util.fillTabContent ko.utils.parseJson( dTabInput )[ 0 ]
                util.fillTabContent ko.utils.parseJson( dTabSelect )[ 0 ]
                util.fillTabContent ko.utils.parseJson( dTabCheckboxRadio )[ 0 ]
            ])

            @confTabs.push( util.fillTabContent tab ) for tab in data

            #Active tab
            @confSelectTab @confTabs()[ 0 ]
            @compSelectTab @componentsTabs()[ 1 ]
            return @

        loadIcons: ( data ) ->
            @icons.push new Icon( icon ) for icon in data
            app.icons = @icons()
            return @