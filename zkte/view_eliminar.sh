eliminarVistaDeVistasConf()
{
	contadorDeLineas=1
	while read vista
	do
		#echo $contadorDeLineas
		if [ $vista ==  $nombreVista ];
			then 
				# cambiamos la variable a si, porque si existe una vista con ese nombre
				#verificadorDeVista="si"
				#echo "si existe esta vista: $contadorDeLineas"
				sed -i "$contadorDeLineas"d $(pwd)/config/Vistas/Vistas.conf
		else
			echo ""
		fi
		contadorDeLineas=$((contadorDeLineas + 1))
		#if [ ];
	done < $(pwd)/config/Vistas/Vistas.conf
	echo "Vista $nombreVista eliminada Correctamente"
}
elliminarVistaDelProyecto()
{
	nombreVista=$1
	read proyectoNombre< "$(pwd)/config/Proyecto/Nombre.conf"
	pwd
	if [ -d "$(pwd)"/proyecto/$proyectoNombre/$nombreVista ];
		then
			sudo rm -R "$(pwd)"/proyecto/$proyectoNombre/$nombreVista
			eliminarVistaDeVistasConf
	else
		echo "No existe esta vista"
	fi
	#echo $nombreVista
}
eliminarVista()
{
	
	elliminarVistaDelProyecto $1
}
eliminarVista $1