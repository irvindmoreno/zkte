crearCarpetaComponenteNombre()
{
	if [ -d $rutaZkte"/componentes/$componenteTipo/$componenteNombre" ];
		then
			echo ".."
	else
		mkdir $rutaZkte"/componentes/$componenteTipo/$componenteNombre"
	fi
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
crearComponente()
{	
	rutaZkte="$(pwd)"
	rutaNuevoComponente=$rutaZkte"/componentes/$componenteTipo/$componenteNombre"
	nombreNuevoComponente=$componenteNombre
	nombreNuevoComponenteArchivo=$componenteTipo
	rutaConfigComponentes="$(pwd)/config/Componentes"

	cd $rutaNuevoComponente
	#crear los archvos del componente
				touch $nombreNuevoComponenteArchivo".jade"
	cd $rutaZkte
	rutaConfigRutasProyecto="$(pwd)/config/Rutas/Proyecto.conf"
	read rutaProyecto < $rutaConfigRutasProyecto

	vistaEnUso="$(pwd)/config/Vistas/Use.conf"
	read vistaEnUso < $vistaEnUso
	sed -n $lineaInicialComponente","$lineaFinalComponente"p" $rutaProyecto"/"$vistaEnUso/$vistaEnUso".jade" > $(pwd)/componentes/$componenteTipo/$componenteNombre/$componenteTipo".jade"
	echo "Componente creado correctamente"
	
}
crearComponenteStyl()
{
	rutaZkte="$(pwd)"
	rutaNuevoComponente=$rutaZkte"/componentes/$componenteTipo/$componenteNombre"
	nombreNuevoComponente=$componenteNombre
	nombreNuevoComponenteArchivo=$componenteTipo
	rutaConfigComponentes="$(pwd)/config/Componentes"

	cd $rutaNuevoComponente
	#crear los archvos del componente
		touch $nombreNuevoComponenteArchivo".styl"
	cd $rutaZkte
	rutaConfigRutasProyecto="$(pwd)/config/Rutas/Proyecto.conf"
	read rutaProyecto < $rutaConfigRutasProyecto

	vistaEnUso="$(pwd)/config/Vistas/Use.conf"
	read vistaEnUso < $vistaEnUso
	sed -n $lineaInicialComponente","$lineaFinalComponente"p" $rutaProyecto"/"$vistaEnUso/$vistaEnUso".jade" > $(pwd)/componentes/$componenteTipo/$componenteNombre/$componenteTipo".jade"
	echo "Componente creado correctamente"
}
validarSiComponenteExiste()
{
	banderaExistenciaComponente=""
	rutaZkte="$(pwd)"
	rutaComponenteACrear=$rutaZkte"/componentes/$componenteTipo/$componenteNombre"
		if [ -d $rutaComponenteACrear ];
		then
			banderaExistenciaComponente="No Procede"
			echo "ya existe un componente $componenteTipo : $componenteNombre"
		else
			#echo "chamaquina el samuel"
			banderaExistenciaComponente="Procede"
			crearCarpetaComponenteTipo
			crearCarpetaComponenteNombre
			crearComponente $componenteTipo $componenteNombre
		fi
}
exportarJades()
{
	rutaZkte="$(pwd)"
	cd $rutaZkte
	rutaConfigRutasProyecto="$(pwd)/config/Rutas/Proyecto.conf"
	read rutaProyecto < $rutaConfigRutasProyecto
	vistaEnUso="$(pwd)/config/Vistas/Use.conf"
	read vistaEnUso < $vistaEnUso
	anteriorComponenteTipo=""
	anteriorComponenteNombre=""
	numberLine=1
	banderaComponente=0
	lineaInicialComponente=0
	lineaFinalComponente=0
	while read vista
		do
			esComponente=`expr substr $vista 12 15`
			if [ "$esComponente" = "componente_zkte" ];
				then
					if [ $banderaComponente = 0 ];
						then
							banderaComponente=1
							lineaInicialComponente=$numberLine
					elif [ $banderaComponente = 1 ];
						then
							banderaComponente=2
							banderaComponente=0
							lineaFinalComponente=$numberLine
							echo "linea" $lineaInicialComponente "hasta la" $lineaFinalComponente"p"
							
							eliminarDiv=(${vista//div\(class\=\"componente_zkte_/ })
							eliminarDivFin=(${eliminarDiv//\"\)/ })
							eliminarEspacios=(${eliminarDivFin//\ / })
							echo $eliminarEspacios | cut -d'_' -f1 | read componenteTipo
							echo $eliminarEspacios | cut -d'_' -f2 | read componenteNombre
							validarSiComponenteExiste $componenteTipo $componenteNombre
							#echo $componenteTipo" y "$componenteNombre							
							
					else
						echo "No hago nada"
					fi
			fi
			numberLine=$(( $numberLine + 1 ))
		done < $rutaProyecto"/"$vistaEnUso/$vistaEnUso".jade"
}
exportarStylus()
{
	if[ "$banderaExistenciaComponente" = "Procede" ];
		then
			rutaZkte="$(pwd)"
			cd $rutaZkte
			rutaConfigRutasProyecto="$(pwd)/config/Rutas/Proyecto.conf"
			read rutaProyecto < $rutaConfigRutasProyecto
			vistaEnUso="$(pwd)/config/Vistas/Use.conf"
			read vistaEnUso < $vistaEnUso
			anteriorComponenteTipo=""
			anteriorComponenteNombre=""
			numberLine=1
			banderaComponente=0
			lineaInicialComponente=0
			lineaFinalComponente=0
			while read vista
				do
					esComponente=`expr substr $vista 3 15`
					#echo $esComponente
					if [ "$esComponente" = "componente_zkte" ];
						then
							if [ $banderaComponente = 0 ];
								then
									banderaComponente=1
									lineaInicialComponente=$numberLine
							elif [ $banderaComponente = 1 ];
								then
									banderaComponente=2
									banderaComponente=0
									lineaFinalComponente=$numberLine
									echo "linea" $lineaInicialComponente "hasta la" $lineaFinalComponente"p"
									
									eliminarDiv=(${vista//\/\*componente_zkte_/ })
									eliminarDivFin=(${eliminarDiv//\*\// })
									eliminarEspacios=(${eliminarDivFin//\ / })
									echo $eliminarEspacios | cut -d'_' -f1 | read componenteTipo
									echo $eliminarEspacios | cut -d'_' -f2 | read componenteNombre
									echo $componenteTipo " y " $componenteNombre
									#validarSiComponenteExiste $componenteTipo $componenteNombre
									crearComponenteStyl $componenteTipo $componenteNombre
							else
								echo "No hago nada"
							fi
					fi
					numberLine=$(( $numberLine + 1 ))

					
				done < $rutaProyecto"/"$vistaEnUso/$vistaEnUso".styl"
	else
		echo "No se pudo exportar los estilos"
	fi
}
exportarJades
exportarStylus

			