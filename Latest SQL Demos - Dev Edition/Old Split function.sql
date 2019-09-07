USE Test
GO

CREATE FUNCTION [dbo].[Split] 
   (  @List      varchar(8000), 
      @Delimiter varchar(5)
   ) 
  
   RETURNS @TableOfValues table ([Value] varchar(50)) 

AS
   BEGIN
      
        DECLARE @LenString int 
 
      WHILE len( @List ) > 0 
         BEGIN 
         
            SELECT @LenString = 
               (CASE charindex( @Delimiter, @List ) 
                   WHEN 0 THEN DATALENGTH( @List ) 
                   ELSE ( charindex( @Delimiter, @List ) -1 )
                END
               ) 
                                
            INSERT INTO @TableOfValues 
               SELECT substring( @List, 1, @LenString )
                
            SELECT @List = 
               (CASE ( DATALENGTH( @List ) - @LenString ) 
                   WHEN 0 THEN '' 
                   ELSE right( @List, DATALENGTH( @List ) - @LenString - 1 ) 
                END
               ) 
         END
          
     RETURN
      
   END 

GO
