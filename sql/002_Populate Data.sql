USE [E:\FDA\TEST TECNICOS - PARA INGRESOS LABORALES\PRACTICOS\MVCAPPRESEARCH\MVCAPPRESEARCH\APP_DATA\DATABASE.MDF]
GO

BEGIN TRANSACTION
GO
PRINT N'Insertando datos en [dbo].[Events]...';
GO

declare	@EventTitle		varchar(50)
declare @Technology	varchar(50)
declare @StartingDate		varchar(150)
declare @RegistrationLink	varchar(32)
declare @counter	int
declare @top	int
declare @counterDesc varchar(10)

set @counter=1
set @top=10000


while	(@counter<=@top)
	begin
	
		set @counterDesc=cast(@counter as varchar)



		set	@EventTitle	='EventTitle'+@counterDesc
		set	@Technology='Apellido'+@counterDesc
		set	@StartingDate=getDate()-@top+@counter
		set @RegistrationLink='Link'+@counterDesc


		INSERT INTO [dbo].[Events]
				   ([EventTitle]
				   ,[Technology]
				   ,[StartingDate]
				   ,[RegistrationLink])
			select	@EventTitle,
					@Technology, 
					@StartingDate, 
					@RegistrationLink
		
		SET	@counter=@counter+1
	END
GO

IF @@ERROR <> 0
	AND @@TRANCOUNT > 0
	BEGIN
		ROLLBACK;
	END




IF @@TRANCOUNT>0 
	BEGIN
		PRINT N'La inserción de datos en la base de datos se realizó correctamente.'
		COMMIT TRANSACTION
	END

GO
