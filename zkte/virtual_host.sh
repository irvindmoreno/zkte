echo "Recuerda que debes estar ubicado en /home/usuario/Carrera/Proyectos
"
rutaProyecto=$(pwd)
sudo chmod -R 777 /etc/apache2/sites-enabled/
cd /etc/apache2/sites-enabled/
echo 'Introduzca el nombre del proyecto(ejem: asep):'
read urlLocal
sudo echo "<VirtualHost *:80>
	  ServerName $urlLocal.local
	  ServerAdmin webmaster@localhost
	  DocumentRoot $rutaProyecto/$urlLocal/public
      php_value include_path '$rutaProyecto/$urlLocal/public'
	  <Directory $rutaProyecto/$urlLocal/public>
	  AllowOverride All
	  Require all granted
      </Directory>
      ErrorLog ${APACHE_LOG_DIR}/error.log
      CustomLog ${APACHE_LOG_DIR}/access.log combined
  </VirtualHost>">>$urlLocal.local.conf
 sudo su -c "echo '127.0.0.1 $urlLocal.local' >> /etc/hosts"
 sudo service apache2 restart
 echo "¡IMPORTANTE! Recuerda que apuntamos a public, y en algunos frameworks no se apunta a public, asi que manualmente elimina esas rutas en el conf"
 subl /etc/apache2/sites-enabled/$urlLocal.local.conf