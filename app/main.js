requirejs.config({
    paths: {
        // Require plugins
        'text':          '../lib/require/text',
        'cs':            '../lib/require/cs',
        'domReady':      '../lib/require/domReady',
        'coffee-script': '../lib/coffee-script/coffee-script',
        // Jquery
        'jquery':    '../lib/jquery/jquery',
        'jquery.ui': '../lib/jquery/jquery-ui',
        // Bootstrap
        'bootstrap':        '../lib/bootstrap/js/bootstrap',
        'bootstrap-select': '../lib/bootstrap/js/bootstrap-select',
        //Knockout
        'knockout':          '../lib/knockout/knockout-3.2.0.debug',
        'knockout-sortable': '../lib/knockout/knockout-sortable',
        'knockstrap':        '../lib/knockout/knockstrap',
        //===============================================
        'ui': 'helper/ui'
    },
    shim: {
        'bootstrap': {
            deps: ['jquery'],
            exports: "jQuery"
        },
        'bootstrap-select': {
            deps: ['jquery']
        },
        'knockstrap': {
            deps: ['bootstrap']
        },
        'jquery-ui': {
            deps: ["jquery"]
        },
        'ui': {
            deps: ['jquery']
        }
    }
});

define('app', {
    root: null,
    locales: ["en", "de", "fr"],
    currentLocale: "en",
    icons: []
});

require(['bootstrap', 'bootstrap-select']);

require(['knockout', 'knockstrap', 'knockout-sortable', 'ui'], function ( ko ) {
    ko.bindingHandlers.sortable.options = {
        placeholder: 'component-placeholder',
        revert: true,
        handle: '.handler',
        helper: 'clone',
        cursorAt: {
            top: 0,
            left: 0
        }
    };
    ko.bindingHandlers.draggable.options = {
        handle: '.handler',
        helper: 'clone',
        cursorAt: {
            top: 0,
            left: 0
        }
    };
});

require(['knockout', 'cs!viewModel/formBuild', 'domReady!'], function ( ko, FormBuild ) {
    var formBuild = new FormBuild();

    formBuild
        .loadIcons([
            {
                name: 'Choose ...',
                src: ''
            },
            {
                name: 'mail',
                src: 'http://cdn.flaticon.com/png/256/12194.png'
            },
            {
                name: 'photo',
                src: 'http://cdn.flaticon.com/png/256/12537.png'
            },
            {
                name: 'help',
                src: 'http://cdn.flaticon.com/png/256/12433.png'
            }
        ])
        .load([
                {
                    type: "tab",
                    id: "hiddenTab",
                    title: "Tab",
                    content: []
                }
            ]
        );

    window.model = formBuild;
    window.ko = ko;

    ko.applyBindings( formBuild );
});