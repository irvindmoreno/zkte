LayoutLLenarJade()
{
echo "html
	head
		meta(charset='utf-8')
		meta(name='viewport' content='width=device-width, user-scalable=no')
		script(src='https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js')
		script(src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js')
		script(src='./clases.js')
		link(rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/normalize/3.0.3/normalize.min.css')
		link(rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css')
		link(rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css')		
		block head
	body
		block header
		block navegacion
		block contenido
		block footer">> layout.jade
}
LayoutLLenarStyl()
{
echo 'body
	font-size 16px
	margin 0
	font-family Arial'>> layout.styl
}
guardarRutaDelPoryectoEnConf()
{
	nombreDelProyecto=$1
	rutaZkte="$(pwd)"
	
	rutaProyecto="$(pwd)/proyecto/$nombreDelProyecto"	
	rutaConfigRutas="$(pwd)/config/Rutas"
	configProyecto="$(pwd)/config/Proyecto"
	#Creando el archivo Proyecto.conf
		sudo touch  $rutaConfigRutas"/Proyecto.conf"
		sudo chmod 777 $rutaConfigRutas/Proyecto.conf
		echo "$rutaProyecto">> $rutaConfigRutas/Proyecto.conf
	#Creando el archivo Rutas.conf
		sudo touch  $rutaConfigRutas"/Rutas.conf"
		sudo chmod 777 $rutaConfigRutas/Rutas.conf
		echo "$rutaConfigRutas">> $rutaConfigRutas/Rutas.conf
	#Creando el archivo Rutas.conf
		sudo touch  $configProyecto"/Nombre.conf"
		sudo chmod 777 $configProyecto/Nombre.conf
		echo "$nombreDelProyecto">> $configProyecto/Nombre.conf
}
crearLayout()
{
	#definimos la ruta layout
		rutaLayout="$rutaProyecto/layout"

	if [ -d $rutaLayout ];
		then	
			echo "Ya se tiene un layout, excelente :)"
		else
			#echo "Creando Layout...."		
				#creamos la carpeta layout
					mkdir $rutaLayout
					if [ -d $rutaLayout ];
						then
							#creamos los 2 archivos de layout
								touch "$rutaLayout/layout.jade"
								touch "$rutaLayout/layout.styl"
								touch "$rutaLayout/layout.js"
							#nos ubicamos dentro de la carpeta layout
								cd $rutaLayout
							#llenamos los archivos
								LayoutLLenarJade
								LayoutLLenarStyl
							#echo "Se ah creado el layout Correctamente...."
						else
							echo "!! No se pudo crear el layout"
						fi							
		fi
}
crearProyecto()
{
	
	if [ -d $rutaProyecto ];
		then	
			echo "Ya Existe un proyecto con este nombre"			
		else			
				#Creo la carpeta del proyecto
					mkdir $rutaProyecto
					if [ -d $rutaProyecto ];
						then
							echo "Proyecto creado correctamente"
						else
							echo "!! No se pudo crear la Carpeta Del Proyecto"
						fi
				#creamos el layout
					crearLayout															
		fi
}

inicio()
{
	#echo $1
	guardarRutaDelPoryectoEnConf $1
	crearProyecto
	
	cd $rutaZkte
}

inicio $1