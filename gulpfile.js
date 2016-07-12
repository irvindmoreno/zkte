/******no tocar linea 1,2 y 3********/
var proyecto='modal';
var vista='gallitoCuentaImg';
var tipo='componente';
/*librerias requeridas para correr gulp*/

var gulp = require('gulp'),
    jade = require('gulp-jade'),
    stylus = require('gulp-stylus'),
    rename=require('gulp-rename'),
    rupture=require('rupture'),
    babel = require('gulp-babel'),
    livereload = require('gulp-livereload'),
    connect = require('gulp-connect'),
    concat = require('gulp-concat');
if(tipo=="proyecto")
{
    var rutaOrigen=['proyecto/'+proyecto+'/'+vista];
    var rutaDestinoVista="public/proyecto/"+proyecto+"/"+vista;
}
else if(tipo=="componente")
{
    var rutaOrigen=['componentes/'+proyecto+'/'+vista];
    var rutaDestinoVista="public/componentes/"+proyecto+"/"+vista;
}

gulp.task("css-reload",function(){
    gulp.src(rutaOrigen+"/*.styl")
        .pipe(stylus({use:[rupture()]}))
        .pipe(gulp.dest(rutaDestinoVista))
        .pipe(connect.reload());

})
gulp.task("js-reload",function(){
    gulp.src(rutaOrigen+"/*.js")         
        .pipe(babel({
            presets: ['es2015']
        }))
        .pipe(gulp.dest(rutaDestinoVista))
        .pipe(connect.reload());
})
gulp.task("jade-reload",function(){
     gulp.src(rutaOrigen+"/*.jade")
            .pipe(jade({
                pretty: true
            }))
            .pipe(rename({extname:'.html'}))
            .pipe(gulp.dest(rutaDestinoVista))
            .pipe(connect.reload());
})
gulp.task("css",function(){
    gulp.src(rutaOrigen+"/*.styl")
        .pipe(stylus({use:[rupture()]}))
        .pipe(gulp.dest(rutaDestinoVista))
        .pipe(connect.reload());

})
gulp.task("js",function(){
    gulp.src(rutaOrigen+"/*.js")         
        .pipe(babel({
            presets: ['es2015']
        }))
        .pipe(gulp.dest(rutaDestinoVista))
        .pipe(connect.reload());
})
gulp.task("jade",function(){
     gulp.src(rutaOrigen+"/*.jade")
            .pipe(jade({
                pretty: true
            }))
            .pipe(rename({extname:'.html'}))
            .pipe(gulp.dest(rutaDestinoVista))
            .pipe(connect.reload());

    if(tipo=="componente")
    {
        console.log("concatenando")
        setTimeout(function(){
            gulp.src(['./public/componentes/'+proyecto+'/'+vista+'/estrcutura.html', './public/componentes/'+proyecto+'/'+vista+'/'+proyecto+'.html'])
            .pipe(concat('resultado.html'))
            .pipe(gulp.dest("public/componentes/"+proyecto+"/"+vista+"/"))
            .pipe(connect.reload())
        }, 2000);
        
    }
})
gulp.task('connect', function() {
    connect.server({
        livereload: true
    });
});
function compile(watch) {
    
    function rebundle()
    {
   
    }
    if(watch)
    {
        console.log("Escuchando archivos del proyecto");
        gulp.watch(rutaOrigen+"/*.styl",['css']);
        gulp.watch(rutaOrigen+"/*.js",['js']);
        gulp.watch(rutaOrigen+"/*.jade",['jade']);
    }
    rebundle();
}
gulp.task('concatenarComponente', function () {
    
        gulp.src(['./public/componentes/'+proyecto+'/'+vista+'/estrcutura.html', './public/componentes/'+proyecto+'/'+vista+'/'+proyecto+'.html'])
        .pipe(concat('resultado.html'))
        .pipe(gulp.dest("public/componentes/"+proyecto+"/"+vista+"/"))

});


gulp.task("watch",function(){
    
    return compile(true);
})

gulp.task("default",["css-reload","js-reload","jade-reload","watch","connect"])
gulp.task("componente",["css","js","jade"])
/* rutas de donde leer y donde escribir archivos para la pp*/

/* Tareas para ejecutar*/
/*
function TareaJade(rutaOrigen,rutaDestinoVista) {
    
    function compilarVistas()
    {
        console.log("vistas html");
        gulp.src(rutaOrigen)
            .pipe(jade({
                pretty: true
            }))
            .pipe(rename({extname:'.html'}))
            .pipe(gulp.dest(rutaDestinoVista))
    }
    gulp.watch(rutaOrigen, compilarVistas);
}
function TareaCss(rutaOrigen,rutaDestinoVista) {
    function compilarVistaCss()
    {
        console.log("vistas css");
         gulp.src(rutaOrigen)
        .pipe(stylus({use:[rupture()]}))
        .pipe(gulp.dest(rutaDestinoVista))
    }
    compilarVistaCss();    
}
function TareaBabel(rutaOrigen,rutaDestinoVista) {
    function compilarVistaJs()
    {
        gulp.src(rutaOrigen)         
        .pipe(babel())
        .pipe(gulp.dest(rutaDestinoVista))
    }  
    compilarVistaJs();
}

function TareaJadeComponente(rutaOrigen,rutaDestinoVista) {
    
    function compilarVistas()
    {  

        console.log("vistas html");
        gulp.src(rutaOrigen)
            .pipe(jade({
                pretty: true
            }))
            .pipe(rename({extname:'.html'}))
            .pipe(gulp.dest(rutaDestinoVista))
        
    }
    compilarVistas();

}
*/

/*
gulp.task('default', function () {

    var rutaOrigen=['proyecto/'+proyecto+'/'+vista];
    var rutaDestinoVista="public/proyecto/"+proyecto+"/"+vista;
    var rutaDestinoComponentes="public/proyecto/"+proyecto;
    
    new TareaJade(rutaOrigen+'/*.jade',rutaDestinoVista);
    new TareaBabel(rutaOrigen+'/*.js',rutaDestinoVista);
    new TareaCss(rutaOrigen+'/*.styl',rutaDestinoVista);
    

});
gulp.task('cp', function () {
   
    var rutaOrigen=['componentes/'+proyecto+'/'+vista];
    var rutaDestinoVista="public/componentes/"+proyecto+"/"+vista;
 
    new TareaJadeComponente(rutaOrigen+'/*.jade',rutaDestinoVista);
    new TareaBabel(rutaOrigen+'/*.js',rutaDestinoVista);
    new TareaCss(rutaOrigen+'/*.styl',rutaDestinoVista);

});





gulp.task('concatenarComponente', function () {
    
        gulp.src(['./public/componentes/'+proyecto+'/'+vista+'/estrcutura.html', './public/componentes/'+proyecto+'/'+vista+'/'+proyecto+'.html'])
        .pipe(concat('resultado.html'))
        .pipe(gulp.dest("public/componentes/"+proyecto+"/"+vista+"/"))

});

gulp.task()*/