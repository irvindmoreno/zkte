VistaLLenarJade()
{
	#escribimos el head
		echo "extends ../layout/layout.jade
block head
	link(href='./$nombreDeLaVista.css' rel='stylesheet')
block header
block navegacion	
block contenido	
block footer
	script(src='./$nombreDeLaVista.js')" >> $nombreDeLaVista.jade
}
VistaLLenarStyle()
{
echo "rutaComponentes='../../../componentes'
rutaImagenes='../../../imagenes'


/************Layout****************/
@import('$rutaProyecto/layout/layout.styl')
/************Layout****************/">> $nombreDeLaVista.styl
			
}
VistaLLenarJs()
{
	cd ..
	cd ..
	cd ..
	rutaConfigProyectoNombre="$(pwd)"/config/Proyecto/Nombre.conf
	#echo "mi vista es: $rutaConfigProyectoNombre"
	if [ -f $rutaConfigProyectoNombre ];
		then
			cd $rutaVista
			read nombreProyecto < $rutaConfigProyectoNombre
			#echo "mi proyecto es: $nombreProyecto"
	else
		echo "No existe la vista"
	fi
echo '$(document).on("ready",inicio)
function inicio()
{	
}// ESTA SIEMPRE DEBE SER LA ULTIMA LINEA DEL ARCHVO DE LO CONTRARI DARA ERROR'>> $nombreDeLaVista.js
}
crearVista()
{	
	rutaZkte="$(pwd)"

	rutaConfigRutasProyecto="$(pwd)/config/Rutas/Proyecto.conf"
	read rutaProyecto < $rutaConfigRutasProyecto

	rutaConfigRutas="$(pwd)/config/Rutas"
	rutaConfigVistas="$(pwd)/config/Vistas"

	#$1 es el parametro enviado nombreDeLavista
	nombreDeLaVista=$1

	
	rutaVista="$rutaProyecto/$nombreDeLaVista"
	if [ -d $rutaVista ];
		then
			echo "ya existe una vista con este nombre"
		else					
			#creamos la carpeta de la vista
				mkdir $rutaVista
				if [ -d $rutaVista ];
					then						
						#nos ubicamos en la carpeta de la vista	
							cd $rutaVista
						#creamos los 3  archivos de la vista
							touch $nombreDeLaVista".jade"
							touch $nombreDeLaVista".styl"
							touch $nombreDeLaVista".js"
							touch "clases.js"
						#llenamos los archivos de la vista
							VistaLLenarStyle
							VistaLLenarJade
							VistaLLenarJs
						#copiaremos el nombre de la vista al archiv conf
							
							
									echo "$nombreDeLaVista" >>$rutaConfigVistas/Vistas.conf
								
						#echo "Vista creada correctamente"
					else
						echo "!! No se pudo crear la vista"
					fi
				#nos ubicamos en la ruta de donde estuvo al inicio
					#cd $rutaInicial	
			echo "Vista $nombreDeLaVista creada correctamente"
		fi	
	
}
validarSiEsPosibleEjecutarEsteComando()
{
	rutaZkte="$(pwd)"

	configProyectoNombre="$(pwd)/config/Proyecto/Nombre.conf"
	#echo $configProyectoNombre
	if [ -f $rutaZkte/config/Proyecto/Nombre.conf ];
		then
			crearVista $1			
		else
			echo "Error 02: Usted no ah creado un proyecto, cree el proyecto primero por favor"
		fi

}
validarSiEsPosibleEjecutarEsteComando $1
