install.packages('quantmod')
library(quantmod)
?quantmod
symbolBasket <- c('AAPL', 'AMZN', 'BRK-B', 'SPY')
getSymbols(symbolBasket , src='yahoo')
summary(`BRK-B`)
BRKB <- as.xts(`BRK-B`)
names(BRKB)
names(BRKB) <- c("BRKB.Open"   ,  "BRKB.High"   ,  "BRKB.Low"   ,   "BRKB.Close"  ,  "BRKB.Volume",  "BRKB.Adjusted")
names(BRKB)
plot(BRKB$BRKB.Open)
lineChart(BRKB$BRKB.Open, line.type = 'h', theme = 'white', TA = NULL)
lineChart(BRKB, line.type = 'h', theme = 'white')
barChart(BRKB, bar.type = 'hlc', TA = NULL)
candleChart(BRKB, TA=NULL, subset = '2019')
?candleChart
candleChart(BRKB, TA=c(addMACD(),addVo()), subset = '2019')
?addMACD()
candleChart(BRKB, TA=c(addMACD(),addADX()), subset = '2018-01::')
candleChart(BRKB , TA=c(addMACD()), subset = '2018-01::2018-05', theme = 'white')
candleChart(BRKB , TA=c(addMACD()), subset = '2019-01::', theme = chartTheme('white', up.col='green',dn.col='darkred'))
?chartSeries
chartSeries(BRKB, 
            type = c("auto", "candlesticks"), 
            subset = '2019-01::',
            show.grid = TRUE,
            major.ticks='auto', minor.ticks=TRUE,
            TA=c(addMACD(),addVo()))
chartSeries(BRKB, 
            type = c("auto", "candlesticks"), 
            subset = '2018-01::',
            show.grid = TRUE,
            major.ticks='auto', minor.ticks=TRUE,
            multi.col = TRUE,
            TA=c(addMACD(),addVo()))
chartSeries(BRKB, 
            type = c("auto", "matchsticks"), 
            subset = '2018-01::',
            show.grid = TRUE,
            major.ticks='auto', minor.ticks=TRUE,
            multi.col = TRUE,
            TA=c(addMACD(),addVo()))
?TTR
chartSeries(BRKB, 
            type = c("auto", "matchsticks"), 
            subset = '2018-01::',
            show.grid = TRUE,
            major.ticks='auto', minor.ticks=TRUE,
            multi.col = FALSE,
            TA=c(addMACD(),addVo(),addSMA(n=200,col = 'blue'),addSMA(n=50,col = 'red'),addSMA(n=22,col = 'green'),
                 addROC(n=200,col = 'blue'),addROC(n=50,col = 'red'),addROC(n=22,col = 'green'))) # rate of change
?addBBands
?add_BBands
chartSeries(BRKB, theme="white",
            TA="addVo();addBBands();addCCI()", subset = '2018-01::')
chartSeries(BRKB, theme="white",
            TA="addVo();addBBands();addCCI()", subset = '2018-01::')
chartSeries(BRKB, theme=chartTheme('white'), up.col="black",
            dn.col="black")
BRKB.EMA.20<- EMA(BRKB$BRKB.Close, n=20)
BRKB.EMA.50<- EMA(BRKB$BRKB.Close, n=50)
BRKB.EMA.100<- EMA(BRKB$BRKB.Close, n=100)
BRKB.EMA.200<- EMA(BRKB$BRKB.Close, n=200)
chartSeries(BRKB, theme=chartTheme('white'),
            type = c("auto", "matchsticks"), 
            subset = '2018-01::',
            show.grid = TRUE,
            major.ticks='auto', minor.ticks=TRUE,
            multi.col = FALSE,
            TA=c(addMACD(),addVo(),addADX(n = 14, maType = "EMA")))
addTA(BRKB.EMA.20, on=1, col = "green")
addTA(BRKB.EMA.50, on=1, col = "blue")
addTA(BRKB.EMA.100, on=1, col = "yellow")
addTA(BRKB.EMA.200, on=1, col = "red")
addTA(BRKB.EMA.20 - BRKB.EMA.200, col = "black",
      type = 'h', legend = "100-200 EMA")
