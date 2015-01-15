({
    baseUrl: ".",
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
    },
    name: "main",
    out: "main-built.js"
})