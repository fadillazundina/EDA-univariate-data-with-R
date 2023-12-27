library(readxl)
library(moments)
library(ggplot2)

#read data from excel
data <- read_excel(path = 
                  "D:/Semester 5/Analisis Eksplorasi Data/Tugas/dataHargaCabaiRawit.xlsx", 
                   sheet= "data", col_names=TRUE)
View(data)

#descriptive statistics

#ukuran pemusatan dan letak data
summary(data)

#menghitung modus dari kolom Harga pada dataframe
modus_data <- names(table(data$Harga)
                               [which.max(table(data$Harga))])

#menghitung frekuensi modus
count_modus <- max(table(data$Harga))

#menampilkan hasil
print(modus_data)
print(count_modus)

#ukuran penyebaran data
range(data$Harga)
var(data$Harga)
sd(data$Harga)

skewness(data$Harga)
kurtosis(data$Harga)

#visualisasi data
is.ts(data$Harga)
datats <- ts(data$Harga)
is.ts(datats)
plot.ts(datats, main="Plot Time Series Harga Cabai Merah", 
        xlab="waktu", ylab="harga (Rp)")

hist(data$Harga, main="Histogram Harga Cabai Merah", 
     xlab="harga (Rp)", ylab="frekuensi", col="skyblue")

ggplot(data, aes(x = Tanggal, y = Harga, group=1)) + 
  geom_line() +
  labs(x = "Tanggal", y = "Harga", title = "Line Chart")


boxplot(data)

