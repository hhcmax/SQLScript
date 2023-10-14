# SQLScript (for SQL SERVER 2000)
## Function
**fun_SplitStrTable**
- 依分隔串拆解文字，回傳一個資料表
- Params
  1. @OrgStr : 原始字串
  2. @DivStr : 分隔字串
- Result
  1. Table(SerialNum,sValue)
---
**fun_SplitStrCount**
- 依分隔串拆解文字，回傳資料元素數
- Params
  1. @OrgStr : 原始字串
  2. @DivStr : 分隔字串
- Result
  1. int 拆解後字串元素個數
---
**fun_SplitStrIndexOf**
- 依分隔串拆解文字，傳回第n個元素(first index = 0)
- Params
  1. @OrgStr : 原始字串
  2. @DivStr : 分隔字串
  3. @Index : 取第n個元素(first=0)
- Result
  1. varchar 第n個元素
---
**fun_SplitStrStringOf**
- 依分隔串拆解文字，搜尋字串在第n個元素(first index = 0)
- Params
  1. @OrgStr : 原始字串
  2. @DivStr : 分隔字串
  3. @Target : 搜尋字串
- Result
  1. int 第一次出現搜尋字串的第n個index
  2. not found : -1 