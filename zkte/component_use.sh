modificarArchivoGulp()
{
	sed -i "1,4d" gulpfile.js
	sed -i "1i var tipo='componente';" gulpfile.js
	sed -i "1i var vista='$componenteNombre';" gulpfile.js
	sed -i "1i var proyecto='$componenteTipo';" gulpfile.js
	sed -i "1i /******no tocar linea 1,2 y 3********/" gulpfile.js
}
escribirLasCabecerasDeHtml()
{
	#cat /dev/null > "$(pwd)/public/componentes/$componenteTipo/$componenteNombre/$componenteNombre.html"
	echo "<link rel='stylesheet' type='text/css' href='https://cdnjs.cloudflare.com/ajax/libs/normalize/3.0.3/normalize.min.css'>
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css'/>
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css'>
<script src='https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js'></script>
<link rel='stylesheet' type='text/css' href='./$componenteTipo.css'>
<style type='text/css'>
	body
	{
		margin: 0;
		font-size: 16px;
	}
</style>
<script src='./$componenteTipo.js'></script>">> "$(pwd)/public/componentes/$componenteTipo/$componenteNombre/estrcutura.html"
	#echo "Se ah escrito la estructura"				
	#cat < "$(pwd)/public/componentes/$componenteTipo/$componenteNombre/$componenteTipo.html"  >> "$(pwd)/public/componentes/$componenteTipo/$componenteNombre/$componenteNombre.html"
}
creamosLosArchivosEnPublic()
{
	
	if [ -d "$(pwd)/public/componentes/$componenteTipo/$componenteNombre" ];
		then
			echo "Se ah cambiado al componente $componenteTipo => $componenteNombre con éxito"			
			gulp componente
			gulp concatenarComponente
			abrirNavegador
			gulp
	else
		mkdir "$(pwd)/public/componentes/$componenteTipo"
		mkdir "$(pwd)/public/componentes/$componenteTipo/$componenteNombre"
		cd "$(pwd)/public/componentes/$componenteTipo/$componenteNombre"
		touch estrcutura.html
		cd ..
		cd ..
		cd ..
		cd ..
		if [ -f "$(pwd)/public/componentes/$componenteTipo/$componenteNombre/estrcutura.html" ];
			then
				escribirLasCabecerasDeHtml
				gulp componente
				gulp concatenarComponente
				abrirNavegador
				gulp
		else
			echo "!Hubo un error que aún no solucionamos lo sentimos"
		fi
		
		echo "se han creado las carpetas"
		#echo "!Importante: ahora debes ejecutar el comando gulp cp en otra terminal y puedes seguir trabajando"
	fi
		
		 			
	
	
	
}
abrirNavegador()
{ 
	
	echo "Se abrira un navegador en donde pordra visualizar sus cambios"	
	google-chrome "http://localhost:8080/public/componentes/$componenteTipo/$componenteNombre/resultado.html"
}
usar()
{
	componenteTipo=$1
	componenteNombre=$2	
	rutaCompenenteAUsar="$(pwd)/componentes/$componenteTipo/$componenteNombre"
	#verificamos si existe dicho componente ingresado
	if [ -d $rutaCompenenteAUsar ];
		then		
			#si existe modificamos el archivo gulp
			modificarArchivoGulp
			creamosLosArchivosEnPublic
			
			
	else
		echo "No existe dicho componente"
	fi
}
usar $1 $2