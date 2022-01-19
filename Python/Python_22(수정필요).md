# 특정 단어 찾기



### 학습 목표

- 



---



### 라이브러리

```python
```



---



```python
raw_total = pd.read_excel('./files/1_crawling_raw.xlsx')

```



```python
select_word = '해돋이'

check_list = []
for content in raw_total['content']:
    if select_word in content:
        check_list.append(True)
    else:
        check_list.append(False)
        
check_list
select_df = raw_total[check_list]
select_df
```



```python
for i in select_df.index:
    print(select_df.loc[i, 'content'])
    print('-'*50)
```



```python
def select_word(select_word_list):
    for select_word in select_word_list:
        check_list = []
        for content in raw_total['content']:
            if select_word in content:
                check_list.append(True)
            else:
                check_list.append(False)
        select_df = raw_total[check_list]
        fpath = './files/4_select_data_class_{}.xlsx'.format(select_word)
        select_df.to_excel(fpath, index = False)
```

```python
select_word_list = ['해돋이','박물관','힐링','게스트하우스','섭지코지']
select_word(select_word_list)
```

