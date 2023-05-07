#!/bin/bash

##----------------------------------------------------------------------------------------##
##		ESCRITOR con GUI v.11 YAD MADNESS
##
## Estado actual: Pasando todo a YAD

## Futuros Updates:

##	- Crear bloques de control de errores
##	- Automatizar código de items
##
##-----------------------------------------------------------------------------------------##

#Introducción de Título, número, fuente, transcript, minuto inicial y final.

# Display Yad window with 7 different fields
fields=$(yad --form \
  --title="Escritor - ComprensionesOrales" \
  --text="Please enter the following data:" \
  --field="Item title:" \
  --field="Item number" \
  --field="Source of the video:" \
  --field="Intitial minute:" \
  --field="Final minute:" \
  --field="Transcript starts with..." \
  --field="Transcript ends with...")

# Extract values entered into fields and store them in separate variables
titulo_item=$(echo $fields | cut -d '|' -f 1)
numero_item=$(echo $fields | cut -d '|' -f 2)
Source=$(echo $fields | cut -d '|' -f 3)
minuto_inicial=$(echo $fields | cut -d '|' -f 4)
minuto_final=$(echo $fields | cut -d '|' -f 5)
transcript_inicio=$(echo $fields | cut -d '|' -f 6)
transcript_final=$(echo $fields | cut -d '|' -f 7)


#Creación del documento

touch "L3 $titulo_item INDS$numero_item.docx"

# Escritura en documento de los datos iniciales

echo "Título del item: $titulo_item. Número del item: $numero_item"
echo "L3 : $titulo_item " >> "L3 $titulo_item INDS$numero_item.docx"
echo "" >> "L3 $titulo_item INDS$numero_item.docx"
echo "" >> "L3 $titulo_item INDS$numero_item.docx"


echo "Transcript - ($transcript_inicio ... - ... $transcript_final) " >> "L3 $titulo_item INDS$numero_item.docx"
echo "" >> "L3 $titulo_item INDS$numero_item.docx"


echo "Source: $Source  ($minuto_inicial - $minuto_final) " >> "L3 $titulo_item INDS$numero_item.docx"
echo "" >> "L3 $titulo_item INDS$numero_item.docx"

variable_fecha="$(date +'%d/%m/%Y')"

echo "INDS$numero_item - $variable_fecha" >> "L3 $titulo_item INDS$numero_item.docx"
echo "" >> "L3 $titulo_item INDS$numero_item.docx"
echo "" >> "L3 $titulo_item INDS$numero_item.docx"

##Pregunta

pregunta=$(zenity --entry --title="Escritor_GUI - Pregunta" --text="Introduce la pregunta: ")

echo "$pregunta ..." >> "L3 $titulo_item INDS$numero_item.docx"
echo "" >> "L3 $titulo_item INDS$numero_item.docx"

## Respuestas

respuesta_correcta=$(zenity --entry --title="Escritor_GUI - Respuesta Correcta" --text="Introduce la respuesta correcta ")
respuesta_erronea_1=$(zenity --entry --title="Escritor_GUI - Respuesta erronea 1" --text="Introduce la respuesta erronea 1: ")
respuesta_erronea_2=$(zenity --entry --title="Escritor_GUI - Respuesta erronea 2" --text="Introduce la respuesta erronea 2: ")
respuesta_erronea_3=$(zenity --entry --title="Escritor_GUI - Respuesta erronea 3" --text="Introduce la respuesta erronea 3: ")

numero_respuesta_correcta=$(shuf -i 1-4 -n1)

case $numero_respuesta_correcta in

	1)
		letra_respuesta_correcta="a"
		;;
	2)
		letra_respuesta_correcta="b"
		;;
	3)  
		letra_respuesta_correcta="c"
		;;
	4)  
		letra_respuesta_correcta="d"
		;;
esac

#echo "El numero de respuesta correcta es $numero_respuesta_correcta, y por lo tanto la letra es la $letra_respuesta_correcta"
#NOTA 24FEB por la mañana: acabas de corregir la variable i, que no iteraba al imprimir la respuesta y solo imprimia la correcta.
#NOTA 24FEB por la noche: corregido error de la mañana. Ahora, las respuestas_erroneas_$i no cargan la variable metida en read.
#NOTA 25FEB: Nos rendimos a hacer una variable dinámica.

case $numero_respuesta_correcta in

	1)
		echo "a ) $respuesta_correcta" >> "L3 $titulo_item INDS$numero_item.docx"
		echo "b ) $respuesta_erronea_1" >> "L3 $titulo_item INDS$numero_item.docx"
		echo "c ) $respuesta_erronea_2" >> "L3 $titulo_item INDS$numero_item.docx"
		echo "d ) $respuesta_erronea_3" >> "L3 $titulo_item INDS$numero_item.docx"
	;;

	2)
		echo "a ) $respuesta_erronea_1" >> "L3 $titulo_item INDS$numero_item.docx"
		echo "b ) $respuesta_correcta" >> "L3 $titulo_item INDS$numero_item.docx"
		echo "c ) $respuesta_erronea_2" >> "L3 $titulo_item INDS$numero_item.docx"
		echo "d ) $respuesta_erronea_3" >> "L3 $titulo_item INDS$numero_item.docx"
	;;

	3)
		echo "a ) $respuesta_erronea_1" >> "L3 $titulo_item INDS$numero_item.docx"
		echo "b ) $respuesta_erronea_2" >> "L3 $titulo_item INDS$numero_item.docx"
		echo "c ) $respuesta_correcta" >> "L3 $titulo_item INDS$numero_item.docx"
		echo "d ) $respuesta_erronea_3" >> "L3 $titulo_item INDS$numero_item.docx"
	;;

	4)
		echo "a ) $respuesta_erronea_1" >> "L3 $titulo_item INDS$numero_item.docx"
		echo "b ) $respuesta_erronea_2" >> "L3 $titulo_item INDS$numero_item.docx"
		echo "c ) $respuesta_erronea_3" >> "L3 $titulo_item INDS$numero_item.docx"
		echo "d ) $respuesta_correcta" >> "L3 $titulo_item INDS$numero_item.docx"
	;;

esac

echo "" >> "L3 $titulo_item INDS$numero_item.docx"

echo "Correct answer: $letra_respuesta_correcta" >> "L3 $titulo_item INDS$numero_item.docx"

zenity --info --title="Success!" --text="Item de comprension oral creado y guardado en L3 $titulo_item INDS$numero_item.docx" --no-wrap
