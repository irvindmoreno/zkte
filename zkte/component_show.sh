listarComponentes()
{
	while read componente
		do
			echo "$componente"
		done < $(pwd)/config/Componentes/show.conf
}
listarComponentes