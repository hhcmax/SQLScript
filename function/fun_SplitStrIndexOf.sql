Create Function fun_SplitStrIndexOf(@OrgStr nvarchar(1000),@DivStr nvarchar(255),@Index int)
    returns nvarchar(1000)
AS
/*
    Split String Index Of
    Example:
        Select dbo.fun_SplitStrIndexOf('AA~BB~CC~DD~EE~FF','~',3)
        Result : DD
        if not found result ''
*/
BEGIN
    Declare @curIndex int,@resultStr varchar(1000)
    set @resultStr = ''
    set @curIndex = 0
    if charindex(@DivStr,@OrgStr) = 0
        Set @resultStr = ''
    Else
    begin
        While charindex(@DivStr,@OrgStr) > 0    
        begin
            if (@curIndex = @Index)
            begin
                if (charindex(@DivStr,@OrgStr) = 0) AND (@OrgStr <> '')
                    set @resultStr = @OrgStr
                else
                    set @resultStr = SubString(@OrgStr,1,charindex(@DivStr,@OrgStr) - 1)   
                break
             end
            Set @OrgStr = SubString(@OrgStr,charindex(@DivStr,@OrgStr) + Len(@DivStr),Len(@OrgStr) - charindex(@DivStr,@OrgStr))      
            set @curIndex = @curIndex + 1
        end
        if @OrgStr <> ''
            Set @resultStr = @OrgStr
    end
    return @resultStr
END