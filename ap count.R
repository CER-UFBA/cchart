dados.cont=  matrix(c(
  8 ,7  ,1  ,  11,  17,
  11,1  ,11,   2,  9,
  1 ,1  ,8  ,  2,  5,
  3 ,2  ,5  ,  1,  4,
  3 ,2  ,13,   6,  5,
  6 ,3  ,3  ,  3,  1,
  8 ,8  ,2  ,  1,  5,
  4 ,10 ,2  , 6 , 4,
  1 ,6  ,1  ,  3,  2,
  15, 1 ,3  , 2 , 8,
  1 ,7 ,13  ,5 , 1 ,
 6 ,7 ,9   ,3 , 1,
 7 ,6 ,3   ,3 , 1,
 2 ,9 ,3   ,8 , 7,
 6 ,14, 7  ,1 , 8,
 2 ,9 ,4   ,2 , 1,
 11, 1, 1  ,3 , 2,
 5 ,5 ,19  ,1 , 3,
 6 ,15,5   ,6 , 6,
 2 ,7 ,9   ,2 , 8,
 7 ,5 ,6   ,14,  10,
 4 ,3 ,8   ,1 , 2,
 4 ,1 ,4   ,20,  5,
 15, 2, 7  ,10,  17,
 2 ,15, 3  ,11,  2), ncol = 5,byrow = T )

dados.cont |> head()

x = dados.cont |> apply(1, mean)


plot.control(x, type = 'count', fase1 = 15/25, xlab = 'Amostra', ylab = 'Total', 
             tit = 'Curso csds', size =  30, L = 3, samples = 5)
