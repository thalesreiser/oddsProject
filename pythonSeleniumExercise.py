from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import pandas as pd

driver = webdriver.Chrome('./chromedriver')
down=driver.get("https://query1.finance.yahoo.com/v7/finance/download/BTC-EUR?period1=1605681896&period2=1637217896&interval=1d&events=history&includeAdjustedClose=true")


df=pd.read_csv(".\BTC-EUR.csv", ',')

del df['Open']
del df['High']
del df['Low']
del df['Adj Close']
del df['Volume']

print(df.tail(10))

print(driver.current_url)
driver.close()