Create Function fun_SplitStrCount(@OrgStr nvarchar(1000),@DivStr nvarchar(255))
  returns int
AS
/*
    Split String Count
    Example :
        Select dbo.fun_SplitStrCount(N'我@@是@@程@@序@@員@@',N'@@')
*/
BEGIN
    Declare @resultCount int
    Set @resultCount = (LEN(@OrgStr) - LEN(REPLACE(@OrgStr,@DivStr,''))) / LEN(@DivStr)
    IF @resultCount = 0
        Set @resultCount = @resultCount + 1
    IF (@OrgStr like '%' + @DivStr)
        Set @resultCount = @resultCount - 1
    return @resultCount
END