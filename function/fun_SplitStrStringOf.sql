Create Function fun_SplitStrStringOf(@OrgStr nvarchar(1000),@DivStr nvarchar(255),@Target nvarchar(255))
    returns int
AS
/*
    Split String String Of Index
    Example:
        Select dbo.fun_SplitStrStringOf('AA~BB~CC~DD~EE~FF','~','DD')
        result : 3
        if not found result : -1
*/
BEGIN
    Declare @Index int
    Declare @_Str nvarchar(255)
    Set @Index = -1
    if (@OrgStr like @Target + @DivStr + '%')
        Set @Index = 0
    else if (@OrgStr like '%' + @DivStr + @Target)
        Set @Index = (LEN(@OrgStr) - LEN(REPLACE(@OrgStr,@DivStr,''))) / LEN(@DivStr)
    else if (@OrgStr like '%' + @DivStr + @Target + @DivStr)
        Set @Index = (LEN(@OrgStr) - LEN(REPLACE(@OrgStr,@DivStr,''))) / LEN(@DivStr) - 2
    else
        begin
            Set @_Str = Left(@OrgStr,charindex(@DivStr+@Target+@DivStr,@OrgStr)+Len(@DivStr)-1)
            Set @Index = (LEN(@_Str) - LEN(REPLACE(@_Str,@DivStr,''))) / LEN(@DivStr)
        end
    return @Index
END