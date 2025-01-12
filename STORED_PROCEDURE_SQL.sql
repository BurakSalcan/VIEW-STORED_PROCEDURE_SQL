--STORED PROCEDURE
--Sql'in metot olu�turma tekni�i

CREATE PROCEDURE usp_kategoriEkle
(
	@isim nvarchar(15),
	@aciklama ntext
)AS BEGIN
INSERT INTO Categories (CategoryName, Description) VALUES (@isim, @aciklama)
END

EXEC usp_kategoriEkle 'Deneme', 'Deneme A��klamas�'

CREATE PROCEDURE usp_kategoriEkleListele
(
	@isim nvarchar(15),
	@aciklama ntext
)AS BEGIN
	INSERT INTO Categories (CategoryName, Description) VALUES (@isim, @aciklama)
	SELECT * FROM Categories
END

EXEC usp_kategoriEkleListele '�uayip', '�uayipten Kategori Olur'

CREATE PROCEDURE usp_kategoriYoksaEkle
(
	@isim nvarchar(15),
	@aciklama ntext
)
AS BEGIN
	DECLARE @sayi int
	SELECT @sayi = COUNT(*) FROM Categories WHERE CategoryName = @isim
	IF @sayi = 0
		BEGIN
			INSERT INTO Categories(CategoryName, Description) VALUES (@isim, @aciklama)
		END
	ELSE
		BEGIN
			PRINT('Bu kategori eklenmi�.')
		END
END

EXEC usp_kategoriYoksaEkle 'Murtaza31', 'Murtaza Denemesi'

SELECT * FROM Categories
