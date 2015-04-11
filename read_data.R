readRangeOfFile <- function(filename) {
  conn <- file(filename, "rt")
  outConn<-textConnection("accu", open="w", local=T)
  writeLines(readLines(conn, n=1), outConn)
  
  while (length(line <- readLines(conn, n = 1, warn = FALSE)) > 0) {
    if ( grepl("^(1/2/2007|2/2/2007).*", line) ) {
      writeLines(line, outConn)
    }
  }
  close(conn)
  close(outConn)
  
  read.table(text=accu)
}

filterConnection <- function(conn, filterString) {
  outConn<-textConnection("accu", open="w", local=T)
  writeLines(readLines(conn, n=1), outConn)
  
  while (length(line <- readLines(conn, n = 1, warn = FALSE)) > 0) {
    if ( grepl(filterString, line) ) {
      writeLines(line, outConn)
    }
  }
  close(conn)
  close(outConn)
  
  textConnection(accu, open = "r")
}

readAssignment1Data <- function() {
  conn <- file("household_power_consumption.txt", "rt")
  filtered <- filterConnection(conn, "^(1/2/2007|2/2/2007).*")
  data <- read.table(filtered, sep = ";", header = T, na.strings = "?", colClasses=c("character", "character", rep("numeric", 7)))
  data.frame(Date_Time=strptime(paste(data$Date , data$Time), format="%d/%m/%Y %H:%M:%S"), data[3:9])
}