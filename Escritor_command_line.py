########################################################################

##              ESCRITOR_COMMAND_LINE en PYTHON

############## Introducción de los básicos del programa: ###############

#Título del item
#Número del item
#Creación del documento .docx
#Source
## Minutos inicial y final

########################################################################

# Importamos sys para escribir en archivos mediante stdout/stdin
import sys

original_stdout = sys.stdout # Guardamos una referencia al stdout original

titulo_item = input("Introduce el título del item:\n")
numero_item = input("Introduce el número del item:\n")

source = input("Source:\n")
minuto_inicial = input("Minuto inicial: \n")
minuto_final = input("Minuto final: \n")

with open('L3 ' + titulo_item + ' INDS' + numero_item + '.docx', 'w') as nuevo_item:

    sys.stdout = nuevo_item # Cambia stdout a 'nuevo_item'

    print("Source: ", source)
    print(minuto_inicial)
    print(minuto_final)

    sys.stdout = original_stdout


