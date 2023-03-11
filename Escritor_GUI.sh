#!/bin/bash

##----------------------------------------------------------------------------------------##
##		ESCRITOR con GUI v.10
##
## Estado actual: Editando los cuadros de Zenity

## Futuros Updates:
##	- Pasar todo a YAD con paneles multidialogo
##	- Crear bloques de control de errores
##	- Automatizar código de items
##
##-----------------------------------------------------------------------------------------##

#Introducción de Título, número, fuente, transcript, minuto inicial y final.

titulo_item=$(zenity --entry \
						--title="Escritor_GUI - Titulo del item" \
						--text="Introduce el nombre del item: " \
						--width=500)

numero_item=$(zenity --entry \
						--title="Escritor_GUI - Número del item" \
						--text="Introduce el número del item: " \
						--width=500)

Source=$(zenity --entry \
				--title="Escritor_GUI - Source" \
				--text="Introduce el link al vídeo: " \
				--width=500)

transcript_inicio=$(zenity --entry \
							--title="Escritor_GUI - Transcript inicio" \
							--text="Introduce el inicio del transcript: " \
							--width=500)

transcript_final=$(zenity --entry \
							--title="Escritor_GUI - Transcript final" \
							--text="Introduce el final del transcript: " \
							--width=500)

minuto_inicial=$(zenity --entry \
						--title="Escritor_GUI - Minuto inicial" \
						--text="Introduce el minuto inicial: " \
						--width=500)

minuto_final=$(zenity --entry \
						--title="Escritor_GUI - Minuto final" \
						--text="Introduce el minuto final: " \
						--width=500)


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
