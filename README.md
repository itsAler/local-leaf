# local-leaf
Repositorio con todo lo necesario para desplegar un entorno de trabajo como el que ofrece overleaf.
Pasos para crear un entorno de desarrollo local de latex parecido a lo que podemos tener en overleaf:

	NO ME HAGO RESPONSABLE DE LOS PROBLEMAS QUE PUEDA OCASIONAR ESTA INSTALACIÓN. UN VERDADERO USUARIO DE LINUX
	SABE LO QUE ESTÁ HACIENDO Y NO COPIA Y PEGA AL TUNTÚN, ASÍ QUE SIÉNTETE LIBRE DE REVISAR TODA LA INFORMACIÓN,
	CONTRASTARLA Y COMPROBAR LO QUE HACEN LOS SCRIPTS.

	SE RECOMIENDA UTILIZAR UBUNTU 24.04 LTS, YA QUE ES DONDE SE HA COMPROBADO SU CORRECTO FUNCIONAMIENTO. OTRAS
	DISTRIBUCIONES PUEDEN REQUERIR DE CAMBIOS O SER INCOMPATIBLE.

### USO TRAS LA INSTALACIÓN ###

	El comando texcompiler <fichero main.tex> se lanza en el directorio raíz del proyecto. Dicho directorio debe tener todos los ficheros
	complementarios y carpetas con imágenes y bibliografías. Se generarán ficheros intermedios de latex y un documento pdf con el resultado final
	de la compilación.

### INSTALACIÓN AUTOMÁTICA ### (En verdad esto todavía no existe xd)

1. 	Ejecutar el script de instalación e introducir los parámetros requeridos por el mismo, si los hubiera.


### ALTERNATIVA MANUAL ###

1. 	Se sobreentiende un IDE como VSCODE con WSL, ya que trabajaremos más cómodamente desde la terminal y
	desde ubuntu preferiblemente. En este caso utilizo la versión 24.04 LTS.

2. 	Instalar tex-live. Lo mejor es utilizar la versión oficial siguiendo la guía de instalación 
	(NO USAR LA GUÍA RÁPIDA DEL APARTADO tl;dr unix(ish), seguir la guía completa para hacerlo correctamente: 
	https://www.tug.org/texlive/quickinstall.html ) sin dejarse un paso (añadir todos los path, paquetes apt indicados, etc...). 
	Es mejor evitar el paquete apt nativo de ubuntu, tal y como indican los desarrolladores. Es normal que la instalación tarde HORAS ya que
	descarga todos los paquetes de latex más populares (entre 3 y 8 GB de instalación).

3. 	Ahora deberemos configurar tex-live para que sea compatible al 100% con ubuntu. Debemos seguir la guía indicada para la instalación 
	nativa "Integrating vanilla TeX Live with Debian"  ello: https://wiki.debian.org/TeXLive .

3.	Instalar en VSCODE dentro de la distribución de WSL empleada la Extensión "Latex Workshop" https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop . Importante configurar
	la extensión en base al paquete para gestionar la bibliografía utilizada, en mi caso biber dentro del paquete biblatex.
	Podría haberse utilizado bibtex, está ya obsoleto y no se recomienda.

4.	Pueden usarse las herramientas disponibles por defecto con la extensión de vscode (preview y build). También puede usarse mi script custom, añadiendo al PATH el script de compilación. 
	De esta forma se puede omitir el uso de vscode y de la herramienta, que si bien puede modificarse para tener el mismo comportamiento (compilar varias veces el pdf para resolver dependencias),
	y hacerlo por CLI.

5.	Pueden usarse git en el proyecto y extensiones de programación como CodeTogether para trabajar con otros compañeros.

6.	En caso de requerir paquetes opcionales, se pueden instalar empleando la siguiente guía, epecíficamente, el apartado "Native TexLive" https://www.tug.org/texlive/pkginstall.html
