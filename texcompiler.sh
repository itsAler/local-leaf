#! /bin/bash

# Necesitamos compilar el proyecto varias veces y generar la bibliografía durante
# el proceso con el fin de resolver las referencias cruzadas.
# Este sencillo script permite escribir cuatro comandos por el precio de uno.

# La variable de entorno LOCAL_LEAF_AUX_DIR contiene el directorio donde
# se generarán los ficheros intermedios de latex (.aux, .bbl, .log, .out, etc ...).
# El fichero pdf se mostrará en el directorio desde el que se a ejecutado el comando.

if [ "$LOCAL_LEAF_AUX_DIR" = "" ]; then
	LOCAL_LEAF_AUX_DIR="/tmp/local-leaf"
fi

# https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash

POSITIONAL_ARGS=()
OUTPUT_DEFAULT="main"
MAIN_DEFAULT="main.tex"


while [[ $# -gt 0 ]]; do
  case $1 in
    -h|--help)
      HELP="YES"
      shift # past argument
      ;;
    -m|--main)
      MAIN="$2"
      shift # past argument
      shift # past value
      ;;
    -o|--output)
      OUTPUT="$2"
      shift # past argument
      shift # past value
      ;;
    -*|--*)
      echo "Argumento desconocido $1"
      exit 1
      ;;
    *)
      POSITIONAL_ARGS+=("$1") # save positional arg
      shift # past argument
      ;;
  esac
done

if [ "$HELP" = "YES" ]; then
	echo "Uso: <nombre> [Opciones]"
	echo ""
	echo "OPCIONES"
	echo "-h | --help : Muestra la ayuda."
	echo "-o | --output : Indica el nombre del fichero pdf generado. Por defecto \"$OUTPUT_DEFAULT\"."
	echo "-m | --main : Indica el fichero principal de tex para compilar. Por defecto \"main.tex\"."
	exit 0
fi

if [ "$OUTPUT" = "" ]; then
	OUTPUT=$OUTPUT_DEFAULT
fi

if [ "$MAIN" = "" ]; then
	MAIN=$MAIN_DEFAULT
fi


	pdflatex $MAIN
	biber main
	pdflatex $MAIN
	pdflatex $MAIN

	mv $OUTPUT $()
	mv "$LOCAL_LEAF_AUX_DIR/$OUTPUT" $(pwd)

	exit 0
