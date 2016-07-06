crearComponente()
{	
	rutaZkte="$(pwd)"
	rutaNuevoComponente=$rutaZkte"/componentes/$1/$2"
	nombreNuevoComponente=$2
	nombreNuevoComponenteArchivo=$1
	rutaConfigComponentes="$(pwd)/config/Componentes"

	cd $rutaNuevoComponente
	#crear los archvos del componente
				touch $nombreNuevoComponenteArchivo".jade"
				touch $nombreNuevoComponenteArchivo".js"
				touch $nombreNuevoComponenteArchivo".styl"

			#llenar el archivo js nombreNuevoComponente
			echo "//************** $nombreNuevoComponenteArchivo $nombreNuevoComponente **************//">> $nombreNuevoComponenteArchivo.jade
			echo "- rutaImagenes ='../../../imagenes'">> $nombreNuevoComponenteArchivo.jade
			echo "//************** $nombreNuevoComponenteArchivo $nombreNuevoComponente **************//">> $nombreNuevoComponenteArchivo.jade
			echo "//************** $nombreNuevoComponenteArchivo $nombreNuevoComponente **************//">> $nombreNuevoComponenteArchivo.styl
			echo "//************** $nombreNuevoComponenteArchivo $nombreNuevoComponente **************//">> $nombreNuevoComponenteArchivo.styl
			echo "class $(echo $nombreNuevoComponenteArchivo | sed 's/^./\u&/')$(echo $nombreNuevoComponente | sed 's/^./\u&/'){
	constructor()
	{

	}
}" >> $nombreNuevoComponenteArchivo".js"
	echo "Componente creado correctamente"
	
}
crearCarpetaComponenteTipo()
{
	
	if [ -d $rutaZkte"/componentes/$componenteTipo" ];
		then
			echo "."
	else
		mkdir $rutaZkte"/componentes/$componenteTipo"
	fi
}
crearCarpetaComponenteNombre()
{
	if [ -d $rutaZkte"/componentes/$componenteTipo/$componenteNombre" ];
		then
			echo ".."
	else
		mkdir $rutaZkte"/componentes/$componenteTipo/$componenteNombre"
	fi
}
validarSiComponenteExiste()
{

	rutaZkte="$(pwd)"
	#echo $rutaZkte
	componenteTipo=$1
	componenteNombre=$2
	rutaComponenteACrear=$rutaZkte"/componentes/$1/$2"
		if [ -d $rutaComponenteACrear ];
		then
			echo "ya existe un componente $componenteTipo : $componenteNombre"
		else
			#echo "chamaquina el samuel"
			crearCarpetaComponenteTipo
			crearCarpetaComponenteNombre					
			crearComponente $componenteTipo $componenteNombre
		fi
}
validarSiComponenteExiste $1 $2
