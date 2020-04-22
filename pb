#%%
import time
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
import datetime
import pandas as pd
from bs4 import BeautifulSoup

url = 'https://account.powerballgame.co.kr/login?url=http%3A%2F%2Fwww.powerballgame.co.kr%2F'
driver = webdriver.Chrome(r'c:\Users\arche\chromedriver.exe')
driver.get(url)
driver.implicitly_wait(5)
driver.find_element_by_id('id').send_keys('kau00')
driver.find_element_by_id('pw').send_keys('1234' + Keys.ENTER)
time.sleep(5)

driver.get('https://www.powerballgame.co.kr/?view=dayLog&date=2020-04-10')

for i in range(10):
    i = driver.find_element_by_xpath('/html/body/div[5]/a')
    i.click()
    time.sleep(2)

html = driver.page_source
soup=BeautifulSoup(html,'html.parser')

tables = soup.select('table')
table_html = str(tables)
table_df_list = pd.read_html(table_html)
table_df = table_df_list[0]

table_df
'''
table = tables[4]

table_html = str(table)
table_df_list = pd.read_html(table_html)

table_df = table_df_list[4]

table_df
'''

'''
if more.is_enabled():
    #driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
    #time.sleep(5)
    body = driver.find_element_by_css_selector('body')
    body.send_keys(Keys.PAGE_DOWN)
    body.send_keys(Keys.PAGE_DOWN)
    time.sleep(2)
    more.click()

else:
    exit()

if more.is_enabled():
    driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
    time.sleep(3)
    more.click()

else:
    exit()
'''

#/html/body/div[5]/a
#/html/body/div[5]/a
#https://www.powerballgame.co.kr/?view=dayLog#
#/html/body/div[5]/a

# %%
