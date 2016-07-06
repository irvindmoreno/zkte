usarVista()
{
	nombreDeLaVista=$1
	
	rutaConfigRutasProyecto="$(pwd)/config/Rutas/Proyecto.conf"
	#variable que me servira para saber si la vista ingresada existe en elproyecto
	verificadorDeVista="no"
	#configProyectoNombre = "$(pwd)/config/Proyecto/Nombre.conf"
	if [ -f rutaConfigRutasProyecto ];
		then
			echo "Ups, tenemos un error, posiblemente no haz creado un proyecto o haz borrado el archivo Proyecto.conf en config/Rutas"
		else

			while read vista
			do
				if [ $vista =  $nombreDeLaVista ];
					then 
						# cambiamos la variable a si, porque si existe una vista con ese nombre
						verificadorDeVista="si"
				else
					echo ""
				fi
				#if [ ];
			done < $(pwd)/config/Vistas/Vistas.conf

			#echo "Mi verificar es $verificadorDeVista"
			if [ $verificadorDeVista = "si" ];
				then
					# verificaremos si el archivo Vista_use.conf existe
					rutaConfigVistasUse="$(pwd)/config/Vistas/Use.conf"
					if [ -f $rutaConfigVistasUse ];
						then
							#modifico la vista en uso en el archivo Use.conf
							sed -i "1,2d" $rutaConfigVistasUse													
							echo "$nombreDeLaVista" >>$rutaConfigVistasUse
					else
						#como no esxiste el archivo use.conf, lo creo y guardo la vista que estara en uso
						touch $rutaConfigVistasUse
						echo "$nombreDeLaVista" >>$rutaConfigVistasUse
					fi
					read rutaProyecto < $rutaConfigRutasProyecto
					read proyectoNombre< "$(pwd)/config/Proyecto/Nombre.conf"
					#echo $rutaProyecto			
					sed -i "1,4d" gulpfile.js
					sed -i "1i var tipo='proyecto';" gulpfile.js
					sed -i "1i var vista='$nombreDeLaVista';" gulpfile.js
					sed -i "1i var proyecto='$proyectoNombre';" gulpfile.js
					sed -i "1i /******no tocar linea 1,2 y 3********/" gulpfile.js
					echo "Se ah cambiado a la vista con éxito"
					google-chrome "http://localhost:8080/public/proyecto/$proyectoNombre/$nombreDeLaVista/$nombreDeLaVista.html"
					gulp					
					
				else
					echo "Error 03: No existe una vista con este nombre"
			fi
			
	fi


	
}
usarVista $1