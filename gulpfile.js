var gulp              = require('gulp'),
    gutil             = require('gulp-util'),
    jade              = require('gulp-jade'),
    coffee            = require('gulp-coffee'),
    concatCss         = require('gulp-concat-css'),
    uglifycss         = require('gulp-uglifycss'),
    requirejsOptimize = require('gulp-requirejs-optimize');

// Jade
gulp.task('jade', function () {
    gulp.src('./*.jade')
        .pipe(jade({
            pretty: true
        }))
        .pipe(gulp.dest('./'))
});

// Coffee-script
gulp.task('coffee-controls', function() {
    gulp.src('./app/controls/*.coffee')
        .pipe(coffee({bare: true}).on('error', gutil.log))
        .pipe(gulp.dest('./app/controls/'))
});

gulp.task('coffee-helper', function() {
    gulp.src('./app/helper/*.coffee')
        .pipe(coffee({bare: true}).on('error', gutil.log))
        .pipe(gulp.dest('./app/helper/'))
});

gulp.task('coffee-model', function() {
    gulp.src('./app/viewModel/*.coffee')
        .pipe(coffee({bare: true}).on('error', gutil.log))
        .pipe(gulp.dest('./app/viewModel/'))
});

gulp.task('coffee', ['coffee-controls', 'coffee-helper', 'coffee-model']);


gulp.task('scripts', function () {
    gulp.src('./app/main.js')
        .pipe(requirejsOptimize(function(file) {
            return {
                baseUrl: "./app",
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
            };
        }))
        .pipe(gulp.dest('./dist/js'));
});

// CSS
gulp.task('css', function () {
    gulp.src(['./lib/bootstrap/css/bootstrap.css', './lib/bootstrap/css/bootstrap-select.css', './css/**/*.css'])
        .pipe(concatCss("css/style.css"))
        .pipe(uglifycss())
        .pipe(gulp.dest('dist'));
});

// Default tasks
gulp.task('default', ['jade']);