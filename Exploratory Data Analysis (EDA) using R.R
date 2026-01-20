# Exploratory Data Analysis (EDA) using R ####

## Functions that allow the program to run ####

# leer_archivo()
# This function prompts the user to enter the name of the dataset to be analyzed.
# If no input is provided, the function automatically loads the default file
# "StudentsPerformance.csv", assuming it is located in the same directory as
# the script.
# It returns the loaded dataset as a data frame.
leer_archivo <- function(){
  nombre_de_archivo = readline("Ingresa el nombre del archivo a trabajar: ")
  
  if (nchar(nombre_de_archivo) < 1) {
    datos_de_desempeño <- read.csv("StudentsPerformance.csv")
    return (datos_de_desempeño)
  }
  
  datos_de_desempeño <- read.csv(nombre_de_archivo)
  
  return (datos_de_desempeño)
}

# analisis_archivo()
# This function receives a loaded dataset as input and performs a basic
# exploratory check using built-in functions such as names(), head(), and class().
# Its purpose is to confirm that the data was successfully imported and to
# understand its structure before proceeding with further analysis.
analisis_archivo <- function(archivo_de_datos){
  print(names(archivo_de_datos))
  print(head(archivo_de_datos))
  print(sapply(archivo_de_datos, class))
}

# separar_alumnos()
# This function takes the loaded dataset and verifies that it contains the
# column "test.preparation.course", which is required to divide the data.
# If the column is missing, the function stops execution to prevent invalid
# analysis.
# When the column is present, the dataset is split into two subsets using
# subset():
#   - students who completed the test preparation course
#   - students who did not complete the test preparation course
# Both subsets are returned as a list.
separar_alumnos <- function(archivo_de_datos) {
  if (!"test.preparation.course" %in% names(archivo_de_datos)) {
    stop("Tu dataset no puede trabajarse con estas funciones.")
  }
  
  alumnos_cumplidos <- subset(archivo_de_datos, test.preparation.course == "completed")
  alumnos_incumplidos <- subset(archivo_de_datos, test.preparation.course == "none")
  
  cantidad_alumnos_cumplidos <- nrow(alumnos_cumplidos)
  cantidad_alumnos_incumplidos <- nrow(alumnos_incumplidos)
  
  message(
    "There are ", cantidad_alumnos_cumplidos,
    " students who completed the test preparation course, and ",
    cantidad_alumnos_incumplidos, 
    " who did not. 
    This will give further context at the time of analysing the generated figures."
  )

  return (list(alumnos_cumplidos, alumnos_incumplidos))
}

# medidas_tendencia()
# This function performs the first stage of statistical analysis.
# It receives the two previously created subsets and checks that they contain
# the required score columns: math, reading, and writing.
# If any required column is missing, execution is stopped.
# Otherwise, the function computes the mean, median, and standard deviation
# for each subject in both groups.

# This step allows for an initial comparison of overall academic performance
# between students who completed the preparation course and those who did not.
medidas_tendencia <- function(alumnos_cumplidos, alumnos_incumplidos){
  columnas_requeridas <- c("math.score", "reading.score", "writing.score")

  for (grupo in list(alumnos_cumplidos, alumnos_incumplidos) )
    {
    if (!all(columnas_requeridas %in% names(grupo)))
      {
      stop("Uno de los grupos en los que se dividieron los alumnos no contiene
           una de las materias que queremos comparar")
      }
    }
  
  medidas_tendencia_central <- list(
    medidas_cumplidos <- list(
      promedios_completed <- apply(alumnos_cumplidos[, columnas_requeridas], 2, mean),
      mediana_completed <- apply(alumnos_cumplidos[, columnas_requeridas], 2, median),
      desviacion_estandar_completed <- apply(alumnos_cumplidos[, columnas_requeridas], 2, sd)
      ),
   medidas_alumnos_incumplidos <- list(
     promedios_completed <- apply(alumnos_incumplidos[, columnas_requeridas], 2, mean),
     mediana_completed <- apply(alumnos_incumplidos[, columnas_requeridas], 2, median),
    desviacion_estandar_completed <- apply(alumnos_incumplidos[, columnas_requeridas], 2, sd)
  )
) 
  return (medidas_tendencia_central)
}

# diferencias_en_mate()
# This function compares math scores between both groups using a boxplot.
# Students who completed the preparation course are shown in green, while
# those who did not are shown in red, allowing for a clear visual comparison
# of score distributions.
diferencias_en_mate <- function(alumnos_cumplidos, alumnos_incumplidos)
{
  boxplot(alumnos_cumplidos$math.score, alumnos_incumplidos$math.score,
          col = c("darkolivegreen3", "indianred"),
          names = c("Cumplidos", "Incumplidos"),
          main = "Comparación de la distribución de puntajes de matemáticas ",
          xlab = "Grupos", ylab = "Puntajes del examen")
}

# distribucion_scores_lectura()
# This function generates two separate histograms to visualize the distribution
# of reading scores for each group, making it easier to observe differences
# in frequency and spread.
distribucion_scores_lectura <- function(alumnos_cumplidos, alumnos_incumplidos){
  hist(alumnos_cumplidos$reading.score, col = "darkolivegreen3", 
       main = "Distribución de puntajes de lectura", sub = "Alumnos que SÍ hicieron el test",
       xlab = "Puntaje del examen", ylab = "Frecuencia")
  
  hist(alumnos_incumplidos$reading.score, col = "indianred", 
       main = "Distribución de puntajes de lectura", sub = "Alumnos que NO hicieron el test",
       xlab = "Puntaje del examen", ylab = "Frecuencia")
}

# relacion_scores_read_write()
# This function explores the relationship between reading and writing scores
# for both groups using scatter plots, helping to visualize potential
# correlations and differences in dispersion.
relacion_scores_read_write <- function(alumnos_cumplidos, alumnos_incumplidos){
  plot(alumnos_cumplidos$reading.score ~ alumnos_cumplidos$writing.score,
       main = "Relación entre puntajes de lectura y escritura",
       sub = "Alumnos que SÍ hicieron el test",
       xlab = "Puntajes de escritura", ylab = "Puntajes de lectura", 
       pch = 21, col = "darkolivegreen3", bg = "darkolivegreen3")
  
  plot(alumnos_incumplidos$reading.score ~ alumnos_incumplidos$writing.score,
       main = "Relación entre puntajes de lectura y escritura",
       sub = "Alumnos que NO hicieron el test",
       xlab = "Puntajes de escritura", ylab = "Puntajes de lectura", 
       pch = 21, col = "indianred", bg = "indianred")
}

## Running the program ####
# main()
# The main function orchestrates the entire program.
# It is the only function the user needs to call, as it sequentially executes
# all previous steps: loading the data, validating it, performing analysis,
# and generating visualizations.
#I structured them in a logical, storytelling order to make the program 
# easy to follow and to simplify debugging if errors occur.
main <- function() {
  datos_de_desempeño <- leer_archivo()
  #confirmar_upload <- analisis_archivo(datos_de_desempeño)
  
  Alumnos_divididos <- separar_alumnos(datos_de_desempeño)
  Alumnos_cumplidos <- Alumnos_divididos[[1]]
  Alumnos_incumplidos <- Alumnos_divididos[[2]]
  
  estadisticas <- medidas_tendencia(Alumnos_cumplidos, Alumnos_incumplidos)
  
  diferencias_en_mate(Alumnos_cumplidos, Alumnos_incumplidos)
  distribucion_scores_lectura(Alumnos_cumplidos, Alumnos_incumplidos)
  relacion_scores_read_write(Alumnos_cumplidos, Alumnos_incumplidos)
  
  return ("El archivo se ha trabajado exitosamente.")
}

main()