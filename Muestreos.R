#Instalar las respectivas librerías: dplyr y titanic

library(dplyr)
library(titanic)
titanic = titanic_train
head(titanic)


# Veamos cuantas filas y columnas tiene el marco de datos

dim(titanic)


# Tipos de muestreos

## Muestreo aleatorio simple:

# Muestreo aleatorio simple sin reposición: seleccionar el 50 % de los datos
set.seed(123)
Titanic_sample_sin_reemplazo = titanic %>% sample_frac(0.5)
dim(Titanic_sample_sin_reemplazo)

# Muestreo aleatorio simple con reposición: seleccionar el 50 % de los datos
set.seed(123)
Titanic_sample_con_reemplazo = titanic %>% sample_frac(0.5, replace = TRUE)
dim(Titanic_sample_con_reemplazo)


# Muestreo estrateficado

# Crear un muestreo estratificado por clase de pasajero
Titanic_estratificado = titanic %>%
group_by(Pclass) %>%
sample_frac(0.5)
dim(Titanic_estratificado)


# Crear una variable de conglomerado, por ejemplo, la variable 'Embarked' 
# que indica el puerto de embarque
# Realizar el muestreo por conglomerado seleccionando al azar uno 
# de los puertos de embarque

selected_port = sample(unique(titanic$Embarked), 1)

# Filtrar los datos para incluir solo el puerto seleccionado

Titanic_conglom= titanic %>%
filter(Embarked == selected_port)
dim(Titanic_conglom)
