rutazkte="$(pwd)"
cadena='
#INICIO Del Zkte-front

	alias project.create="'$rutazkte'/zkte/proyecto_crear.sh"
	alias vh="'$rutazkte'/zkte/virtual_host.sh"
	alias project.delete="'$rutazkte'/zkte/proyecto_delete.sh"	
	alias view.create="'$rutazkte'/zkte/view_create.sh"
	alias view.list="'$rutazkte'/zkte/view_show.sh"
	alias view.delete="'$rutazkte'/zkte/view_eliminar.sh"
	alias view.use="'$rutazkte'/zkte/view_use.sh"	
	alias comp.create="'$rutazkte'/zkte/component_create.sh"
	alias comp.list="'$rutazkte'/zkte/component_show.sh"
	alias comp.use="'$rutazkte'/zkte/component_use.sh"
	alias comp.import="'$rutazkte'/zkte/component_import.sh"
	alias comp.compile="'$rutazkte'/zkte/component_compile.sh"
	alias rut.zkte.front="cd '$rutazkte'"
	alias subl.zkte.front.jquery="subl '$HOME'/Carrera/FrontEnd/zkte"
#FIN Del Zkte-front'
echo "$cadena" >> ~/.zshrc
npm install
cd componentes
git fetch origin gh-pages:gh-pages
git checkout gh-pages
