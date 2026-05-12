## 練習一：班級點名系統

### 題目說明
請撰寫一個程式，使用清單來管理班級的學生名單。這個練習將幫助你熟悉清單的新增、插入、刪除和修改操作。

### 需求功能
1. 建立一個清單 `students`，包含以下學生：`["Amy", "Bob", "Charlie", "David"]`

2. 有一位新同學「Emma」轉入，請使用 `append()` 將她加入清單最後面

3. 有一位新同學「Frank」轉入，請使用 `insert()` 將他插入到第二位（索引1的位置）

4. Charlie 轉學了，請使用 `remove()` 將他從清單中移除

5. David 改名為「Diana」，請修改清單中對應的名字

6. 使用 `for` 迴圈印出所有學生名單，格式為：`學生：Amy`

### 程式輸出範例
```
初始學生名單: ['Amy', 'Bob', 'Charlie', 'David']
加入 Emma 後: ['Amy', 'Bob', 'Charlie', 'David', 'Emma']
插入 Frank 後: ['Amy', 'Frank', 'Bob', 'Charlie', 'David', 'Emma']
移除 Charlie 後: ['Amy', 'Frank', 'Bob', 'David', 'Emma']
改名後: ['Amy', 'Frank', 'Bob', 'Diana', 'Emma']

班級學生名單:
學生：Amy
學生：Frank
學生：Bob
學生：Diana
學生：Emma
```

### 提示
- 清單索引從0開始
- `append()` 會將元素加入清單最後
- `insert(位置, 元素)` 可以指定插入位置
- `remove()` 會移除第一個符合的元素
- 修改元素時，需要先找到該元素的索引，再使用 `清單[索引] = 新值` 進行修改
- 使用 `for` 迴圈搭配 `range()` 和 `len()` 可以同時取得索引和元素

---

## 練習二：水果購物清單

### 題目說明
建立一個水果購物清單程式，這個練習將幫助你熟悉清單的新增、刪除、修改以及切片操作。

### 需求功能
1. 建立一個空清單 `fruits`

2. 使用 `append()` 依序加入以下水果：apple、banana、orange、grape

3. 媽媽說還要買 watermelon，請使用 `append()` 加入 watermelon

4. 爸爸說不要買 banana 了，請使用 `remove()` 移除 banana

5. 妹妹說想吃 strawberry，請使用 `insert()` 將 strawberry 加入清單的第一個位置

6. grape 買不到，要改成 blueberry，請修改清單中 grape 的位置（先找到 grape 的索引，再修改）

7. 使用切片取出前三個水果，儲存到新清單 `top_three`

8. 使用 `for` 迴圈印出 `top_three` 的所有水果

### 程式輸出範例
```
加入水果後: ['apple', 'banana', 'orange', 'grape']
加入 watermelon 後: ['apple', 'banana', 'orange', 'grape', 'watermelon']
移除 banana 後: ['apple', 'orange', 'grape', 'watermelon']
插入 strawberry 後: ['strawberry', 'apple', 'orange', 'grape', 'watermelon']
修改後: ['strawberry', 'apple', 'orange', 'blueberry', 'watermelon']
前三項水果: ['strawberry', 'apple', 'orange']

前三項水果:
strawberry
apple
orange
```

### 提示
- 空清單寫法：`變數 = []`
- 切片語法：`清單[開始索引:結束索引]`，結束索引不包含
- 要修改特定元素，可以使用 `for` 迴圈搭配 `range()` 和 `len()` 來找到索引
- `for i in range(len(清單)):` 可以同時取得索引和元素

---

## 練習三：成績總分計算

### 題目說明
設計一個成績計算程式，這個練習將幫助你熟悉使用 `for` 迴圈來計算清單中數字的總和，而不使用內建的 `sum()` 函數。

### 需求功能
1. 建立一個清單 `scores`，包含以下成績：85, 92, 78, 90, 88, 76, 95

2. 有一位同學補考，成績為 82，請使用 `append()` 加入這個成績

3. 老師發現第二個成績輸入錯誤（92），應該改成 94，請修改清單中對應的位置

4. 請使用 `for` 迴圈計算所有成績的總分（不能使用 `sum()` 函數）

5. 請計算平均分數（總分除以人數），並印出結果（小數點後兩位）

6. 請使用 `for` 迴圈印出所有成績，並在每個成績後面加上「分」
   例如：`85分`

### 程式輸出範例
```
初始成績: [85, 92, 78, 90, 88, 76, 95]
加入補考成績後: [85, 92, 78, 90, 88, 76, 95, 82]
修改成績後: [85, 94, 78, 90, 88, 76, 95, 82]
總分: 688
平均分數: 86.00

所有成績:
85分
94分
78分
90分
88分
76分
95分
82分
```

### 提示
- 計算總分時，先設定一個變數 `total = 0`
- 使用 `for score in scores:` 逐一取出成績並加到 `total`
- 平均分數 = 總分 / 人數，人數可以用 `len(scores)` 取得
- 使用 f-string 來控制小數點位數：`f"{average:.2f}"`
