module.exports = function(grunt) {
    
    grunt.initConfig({
        watch: {
            options: {
                livereload: 1337
            },
            scripts: {
                files: ['app/**/*.coffee'],
                tasks: ['process']
            },
            all: {
                files: ['app/*.*']
            }
        },
        coffee: {
            scripts: {
                expand: true,
                cwd: 'app/',
                src: ['**/*.coffee'],
                dest: 'js/',
                ext: '.js'
            }
        },
        express: {
            all: {
                options: {
                    port: 5000,
                    hostname: 'localhost',
                    bases: ['.'],
                    livereload: 1337,
                }
            }
        }       
    });

    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-contrib-coffee')
    grunt.loadNpmTasks('grunt-newer');
    grunt.loadNpmTasks('grunt-express');
    
    grunt.registerTask(
        'process', 

        ['newer:coffee']);

    grunt.registerTask(
        'default',

        ['coffee', 'express', 'watch']
    );
};
