
importJade()
{
	cat < $rutaComponenteIngresado/$componenteTipo.jade >> "$(pwd)/proyecto/$proyectoNombre/$vistaUse/$vistaUse.jade"
}
importStyl()
{
	cat < $rutaComponenteIngresado/$componenteTipo.styl >> "$(pwd)/proyecto/$proyectoNombre/$vistaUse/$vistaUse.styl"
}
importJs()
{
	#importo las clases js
		cat < "$rutaComponenteIngresado/$componenteTipo.js"  >> "$(pwd)/proyecto/$proyectoNombre/$vistaUse/clases.js"
	#instancio el objeto js del componente		
		sed -i '$d' "$(pwd)/proyecto/$proyectoNombre/$vistaUse/$vistaUse.js"
		#cat $nombreDeLaVista.js
		echo "    var "$componenteTipo$(echo $componenteNombre | sed 's/^./\u&/')= new $(echo $componenteTipo | sed 's/^./\u&/')$(echo $componenteNombre | sed 's/^./\u&/')"()">> "$(pwd)/proyecto/$proyectoNombre/$vistaUse/$vistaUse.js"
		echo "}">> "$(pwd)/proyecto/$proyectoNombre/$vistaUse/$vistaUse.js"
}
verificarExistenciaDeComponenteIngresado()
{
	componenteTipo=$1
	componenteNombre=$2
	rutaComponenteIngresado="$(pwd)/componentes/$componenteTipo/$componenteNombre"
	read proyectoNombre < "$(pwd)/config/Proyecto/Nombre.conf"
	read vistaUse < "$(pwd)/config/Vistas/Use.conf"

	if [ -d $rutaComponenteIngresado ];
		then
			importJade
			importStyl
			importJs
			echo "Se ah importado el componente con éxito"
		else
			echo "No existe el componente"
	fi
}
import()
{
	
	verificarExistenciaDeComponenteIngresado $1 $2
	#rutaComponentes="$rutaInicial/componentes/$componenteAImportar/$componenteNombre"

}
verificarExistenciaDeComponenteIngresado $1 $2