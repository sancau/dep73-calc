module.exports = function(grunt) {
    grunt.initConfig({
        watch: {
            options: {
                livereload: true
            },
            scripts: {
                files: ['js/*.js', 'directives/*.js'],
                tasks: ['process']
            },
            all: {
                files: ['*.*']
            }
        },
        concat: {
            dist: {
                src: ['js/*.js', 'directives/*.js'],
                dest: 'dist/js/all.js'
            }
        },
        uglify: {
            options: {
                mangle: true
            },
            dist: {
                options: {
                    banner: '/* github.com/sancau */ '
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
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-newer');
    grunt.loadNpmTasks('grunt-express');
    
    grunt.registerTask('process', ['concat', 'uglify']);
    grunt.registerTask(
        'default', 
        ['concat', 'uglify', 'express', 'watch']
    );
};
