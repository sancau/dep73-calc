module.exports = function(grunt) {

    grunt.initConfig({
        watch: {
            options: {
                livereload: true
            },
            scripts: {
                files: ['app/**/*.coffee', 'app/**/*.jade'],
                tasks: ['process']
            },
            all: {
                files: ['app/*.*']
            }
        },
        coffee: {
            scripts: {
                expand: true,
                flatten: true,
                cwd: 'app/',
                src: ['**/*.coffee'],
                dest: 'js/',
                ext: '.js'
            }
        },
        html2js: {
            main: {
                options: {
                    base: 'app',
                    module: 'app.views'
                },
                src: ['app/**/*.jade'],
                dest: 'js/views.js'
            }
        },
        concat: {
            dist: {
                src: [
                    'js/app.js',
                    'js/calculation.js',
                    'js/list.js',
                    'js/preset.js',
                    'js/auth.js',
                    'js/views.js',
                    'js/*.js',
                ],
                dest: 'dist/js/all.js'
            }
        },
        uglify: {
            options: {
                mangle: true
            },
            dist: {
                options: {
                    banner: '/* dep73-calc | github.com/sancau */ '
                },
                files: {
                    'dist/js/all.min.js' : ['dist/js/all.js']
                }
            }
        },
        express: {
            all: {
                options: {
                    port: 9000,
                    hostname: 'localhost',
                    bases: ['.'],
                    livereload: true
                }
            }
        }
    });

    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-contrib-coffee')
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-newer');
    grunt.loadNpmTasks('grunt-express');
    grunt.loadNpmTasks('grunt-html2js');

    grunt.registerTask(
        'process',

        ['newer:coffee', 'newer:html2js', 'concat', 'uglify']);

    grunt.registerTask(
        'default',

        ['coffee', 'html2js', 'concat', 'uglify', 'express', 'watch']
    );
};
