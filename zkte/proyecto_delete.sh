eliminarConfiguracionProyectoNombre()
{
	if [ -f "$(pwd)/config/Proyecto/Nombre.conf" ];
		then
			sudo rm -R "$(pwd)/config/Proyecto/Nombre.conf"
			echo "."
	else
		echo "."
	fi
}
eliminarConfiguracionRutaProyecto()
{
	if [ -f "$(pwd)/config/Rutas/Proyecto.conf" ];
		then
			sudo rm -R "$(pwd)/config/Rutas/Proyecto.conf"
			echo ".."
	else
		echo ".."
	fi
}
eliminarConfiguracionRutaRuta()
{
	if [ -f "$(pwd)/config/Rutas/Rutas.conf" ];
		then
			sudo rm -R "$(pwd)/config/Rutas/Rutas.conf"
			echo "..."
	else
		echo "..."
	fi
}
eliminarConfiguracionVistasVistas()
{
	if [ -f "$(pwd)/config/Vistas/Vistas.conf" ];
		then
			sudo rm -R "$(pwd)/config/Vistas/Vistas.conf"
			echo "...."
	else
		echo "...."
	fi
}
eliminarConfiguracionVistasUse()
{
	if [ -f "$(pwd)/config/Vistas/Use.conf" ];
		then
			sudo rm -R "$(pwd)/config/Vistas/Use.conf"
			echo "....."
	else
		echo "....."
	fi
}
eliminarCarpetaProyecto()
{
	
	if [ -d "$(pwd)"/proyecto/$1 ];
		then
			sudo rm -R "$(pwd)"/proyecto/$1
			eliminarConfiguracionProyectoNombre
			eliminarConfiguracionRutaProyecto
			eliminarConfiguracionRutaRuta
			eliminarConfiguracionVistasVistas
			eliminarConfiguracionVistasUse
			echo "Se ah eliminado el proyecto $1 correctamente"
	else
		echo "no existe este proyecto"
	fi
	#sudo rm -R "$(pwd)"/proyecto/$proyectoNombre
}
eliminarProyecto()
{
	eliminarCarpetaProyecto $1	
}
eliminarProyecto $1
