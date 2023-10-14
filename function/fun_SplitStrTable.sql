Create Function fun_SplitStrTable(@OrgStr nvarchar(255),@DivStr nvarchar(10))
returns @Result Table
(
    SerialNum int Identity(1,1),
    sValue nvarchar(255)
)
AS
/*
    Split String to Table
    
    Example : 
        Select * from fun_SplitStrTable(N'A^B^C^D^E','^')
*/
BEGIN
/*
Declare @OrgStr varchar(255),@DivStr varchar(10)
Declare @Result Table
(
  SerialNum int Identity(1,1),
  sValue varchar(255)
)
Set @OrgStr = 'A^B^C^D^E^'
set @DivStr = '^'
*/
While charindex(@DivStr,@OrgStr) > 0    
begin    
    Insert Into @Result(sValue)    
    Select SubString(@OrgStr,1,charindex(@DivStr,@OrgStr) - 1)    
    Set @OrgStr = SubString(@OrgStr,charindex(@DivStr,@OrgStr) + Len(@DivStr),Len(@OrgStr) - charindex(@DivStr,@OrgStr))    
    if (charindex(@DivStr,@OrgStr) = 0) AND (@OrgStr <> '')
        Insert Into @Result(sValue) Values(@OrgStr)      
end  
return 
END



