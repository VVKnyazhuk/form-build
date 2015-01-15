define [
    'knockout'
    'app'
    'cs!controls/tab'
    'cs!controls/input'
    'cs!controls/textarea'
    'cs!controls/placeholder'
    'cs!controls/select'
    'cs!controls/checkbox'
    'cs!controls/radio'
], ( ko, app, Tab, Input, Textarea, Placeholder, Select, Checkbox, Radio ) ->
    # private methods
    _getControl = ( data ) ->
        switch data.type
            when 'input'       then new Input( data )
            when 'textarea'    then new Textarea( data )
            when 'placeholder' then new Placeholder( data )
            when 'select'      then new Select( data )
            when 'checkbox'    then new Checkbox( data )
            when 'radio'       then new Radio( data )
            else ''

    # Public
    getControl: ( data ) ->
        _getControl data

    fillTabContent: ( tabData ) ->
        _tempTab = new Tab tabData
        _tempTab.content []

        tabData.content.forEach ( item ) ->
            _tempItem = _getControl item
            _tempTab.content.push _tempItem  if _tempItem
            return

        _tempTab

    SettingsTab: ( root ) ->
        emptyTab =
            id: ""
            title: ""
            content: []

        @tabs       = root.confTabs
        @visibleNew = ko.observable false
        @bufferTab  = new Tab( emptyTab )

        @bufferTab.content []

        @add = =>
            @tabs.push @bufferTab
            root.confSelectTab @bufferTab

            #new temp
            @bufferTab = new Tab( emptyTab )
            @bufferTab.content []

            #Close modal window
            @visibleNew false

            return

        return

    CreateLocale: ( data ) ->
        self = @

        if typeof data is "string"
            eval("self." + locale + " = ko.observable(data)") for locale in app.locales

        if typeof data is "object"
            for locale of data
                eval("self." + locale + " = ko.observable(data." + locale + ")")

        return

    getIcon: ( data ) ->
        if data.icon
            _icon = ko.utils.arrayFirst( app.icons, ( item ) ->
                item.src is data.icon.src
            )
        else
            _icon = app.icons[ 0 ]

        return _icon