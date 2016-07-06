listarVistas()
{
	while read vista
		do
			echo "$vista"
		done < $(pwd)/config/Vistas/Vistas.conf
}
listarVistas