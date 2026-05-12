## 作業一：個人資料格式化工具

**目標：** 練習 `input()`、字串索引/切片和跳脫字元。

**任務：** 建立一個程式：
1. 詢問使用者輸入姓名、年齡和城市
2. 使用字串切片擷取：
   - 姓名的第一個字（索引 0）
   - 姓名的最後一個字（使用負數索引）
   - 城市名稱的前三個字
3. 使用 `\n` 和 `\t` 在格式化的框框中顯示資訊

**預期輸出格式：**
```
========================================
\t個人資料
========================================
姓名：[完整姓名]
\t第一個字：[第一個字]
\t最後一個字：[最後一個字]
\t城市開頭：[城市前三個字]

年齡：[年齡]
========================================
```

**解答：**
```python
# 作業一解答
print("=== 個人資料輸入 ===")
full_name = input("請輸入您的完整姓名：")
age = input("請輸入您的年齡：")
city = input("請輸入您居住的城市：")

# 字串切片操作
first_char = full_name[0]  # 第一個字
last_char = full_name[-1]   # 最後一個字（負數索引）
city_start = city[:3]       # 城市前三個字

# 顯示格式化的輸出
print("\n========================================")
print("\t個人資料")
print("========================================")
print(f"姓名：{full_name}")
print(f"\t第一個字：{first_char}")
print(f"\t最後一個字：{last_char}")
print(f"\t城市開頭：{city_start}")
print()
print(f"年齡：{age}")
print("========================================")
```

## 作業二：數字計算機與字串處理

**目標：** 練習 `int()`、`float()` 和結合字串操作與數字運算。

**任務：** 建立一個程式：
1. 詢問三種不同的輸入：
   - 一個整數（使用 `int()`）
   - 一個小數（使用 `float()`）
   - 一個包含多個數字並以空格分隔的字串（例如 "10 20 30"）
2. 執行計算：
   - 將整數和小數相加
   - 將結果乘以字串中的第一個數字
3. 使用字串方法切片擷取字串中的數字
4. 使用 `\t` 對齊欄位顯示結果

**解答：**
```python
# 作業二解答
print("=== 數字計算機 ===")
whole_num = int(input("請輸入一個整數："))
decimal_num = float(input("請輸入一個小數："))
num_string = input("請輸入多個數字（用空格分隔，例如：10 20 30）：")

# 處理字串中的數字
# 方法一：使用 split() 和索引
numbers = num_string.split()  # 將字串分割成列表
first_num = int(numbers[0])   # 第一個數字
last_num = int(numbers[-1])   # 最後一個數字

# 方法二：也可以使用字串切片（較複雜）
# 尋找第一個空格的位置
# space_index = num_string.find(' ')
# first_num = int(num_string[:space_index])

# 執行計算
calc1 = whole_num + decimal_num
calc2 = calc1 * first_num

# 顯示結果
print("\n計算結果：")
print(f"\t計算 1：{whole_num} + {decimal_num} = {calc1}")
print(f"\t計算 2：{calc1} × {first_num} = {calc2}")

print("\n數字分解：")
print(f"\t字串中的第一個數字：{first_num}")
print(f"\t字串中的最後一個數字：{last_num}")
print(f"\t所有數字：{', '.join(numbers)}")
```

## 作業三：資料解析與格式化工具

**目標：** 在實際情境中練習所有概念。

**任務：** 建立一個程式處理特定格式的學生紀錄："學號:姓名:分數1,分數2,分數3"
1. 要求使用者輸入這種格式的學生紀錄字串
2. 使用字串切片/索引擷取：
   - 學號（第一個 ':' 之前的字元）
   - 姓名（第一個 ':' 和第二個 ':' 之間的字元）
   - 分數（第二個 ':' 之後的字元）
3. 將分數轉換為數字並計算：
   - 平均分數（浮點數）
   - 總分（整數）
4. 顯示格式化的成績單

**解答：**
```python
# 作業三解答
print("=== 學生成績解析系統 ===")
record = input("請輸入學生紀錄（格式：學號:姓名:分數1,分數2,分數3）：")

# 使用 find() 方法找到冒號的位置
first_colon = record.find(':')
second_colon = record.find(':', first_colon + 1)

# 使用切片擷取資料
student_id = record[:first_colon]                    # 學號
student_name = record[first_colon + 1:second_colon]  # 姓名
scores_str = record[second_colon + 1:]               # 分數字串

# 處理分數
scores_list = scores_str.split(',')  # 用逗號分割
score1 = int(scores_list[0])
score2 = int(scores_list[1])
score3 = int(scores_list[2])

# 計算總分和平均
total_score = score1 + score2 + score3
average_score = total_score / 3

# 計算等第
if average_score >= 90:
    grade = 'A'
elif average_score >= 80:
    grade = 'B'
elif average_score >= 70:
    grade = 'C'
elif average_score >= 60:
    grade = 'D'
else:
    grade = 'F'

# 顯示格式化的成績單
print("\n" + "=" * 40)
print("\t\t成績單")
print("=" * 40)
print(f"學號：{student_id}")
print(f"姓名：{student_name}")
print("-" * 40)
print("分數：")
print(f"\t考試 1：{score1}")
print(f"\t考試 2：{score2}")
print(f"\t考試 3：{score3}")
print("-" * 40)
print("總結：")
print(f"\t總分：\t{total_score}")
print(f"\t平均：\t{average_score:.1f}\t等第：{grade}")
print("=" * 40)

# 額外資訊：顯示原始資料的解析過程
print("\n【解析過程】")
print(f"原始資料：{record}")
print(f"第一個冒號位置：{first_colon}")
print(f"第二個冒號位置：{second_colon}")
print(f"學號切片 [:{first_colon}]：{student_id}")
print(f"姓名切片 [{first_colon + 1}:{second_colon}]：{student_name}")
print(f"分數切片 [{second_colon + 1}:]：{scores_str}")
```

## 進階挑戰解答（作業三的 bonus）

如果您想要更完整的版本，這裡是加入錯誤處理的進階版本：

```python
# 作業三進階解答（包含錯誤處理）
print("=== 學生成績解析系統（進階版） ===")

try:
    record = input("請輸入學生紀錄（格式：學號:姓名:分數1,分數2,分數3）：")
    
    # 檢查格式是否正確
    if record.count(':') != 2:
        print("錯誤：格式不正確，必須包含兩個冒號！")
    else:
        first_colon = record.find(':')
        second_colon = record.find(':', first_colon + 1)
        
        student_id = record[:first_colon]
        student_name = record[first_colon + 1:second_colon]
        scores_str = record[second_colon + 1:]
        
        # 檢查分數部分
        if ',' not in scores_str:
            print("錯誤：分數必須用逗號分隔！")
        else:
            scores_list = scores_str.split(',')
            
            if len(scores_list) != 3:
                print("錯誤：必須提供三個分數！")
            else:
                score1 = int(scores_list[0])
                score2 = int(scores_list[1])
                score3 = int(scores_list[2])
                
                total_score = score1 + score2 + score3
                average_score = total_score / 3
                
                # 等第計算
                if average_score >= 90:
                    grade = 'A'
                elif average_score >= 80:
                    grade = 'B'
                elif average_score >= 70:
                    grade = 'C'
                elif average_score >= 60:
                    grade = 'D'
                else:
                    grade = 'F'
                
                # 輸出結果（同上）
                print("\n" + "=" * 40)
                print("\t\t成績單")
                print("=" * 40)
                print(f"學號：{student_id}")
                print(f"姓名：{student_name}")
                print("-" * 40)
                print("分數：")
                print(f"\t考試 1：{score1}")
                print(f"\t考試 2：{score2}")
                print(f"\t考試 3：{score3}")
                print("-" * 40)
                print("總結：")
                print(f"\t總分：\t{total_score}")
                print(f"\t平均：\t{average_score:.1f}\t等第：{grade}")
                print("=" * 40)
                
except ValueError:
    print("錯誤：分數必須是有效的數字！")
except Exception as e:
    print(f"發生錯誤：{e}")
```

這些解答示範了如何使用 `input()`、`int()`、`float()`、字串索引和切片，以及 `\n` 和 `\t` 跳脫字元。每個作業都包含完整的註解，解釋程式碼的運作方式。