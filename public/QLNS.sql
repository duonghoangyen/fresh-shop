Create database QLNS;

go
	use QLNS;

go
	Create table Banner(
		ID int identity primary key,
		Code nvarchar(50) not null,
		Name nvarchar(150) not null,
		Images nvarchar(150) not null,
		Status bit default 1,
		CreatedDate date DEFAULT GETDATE(),
		ModiredDate date DEFAULT GETDATE()
	);

go
	Create table Blog(
		ID int identity primary key,
		Code nvarchar(50) not null,
		Name nvarchar(150) not null,
		Description ntext not null,
		Images nvarchar(150) not null,
		Status bit default 1,
		CreatedDate date DEFAULT GETDATE(),
		ModiredDate date DEFAULT GETDATE()
	);

go
	Create table Account(
		ID int identity primary key,
		Code nvarchar(50) not null,
		Name nvarchar(150) not null,
		Email nvarchar(150) not null,
		Phone nvarchar(150) not null,
		Password nvarchar(50) not null,
		Address nvarchar(150) not null,
		Birthday nvarchar(150) not null,
		Gender bit default 1,
		Images nvarchar(150) null,
		Role bit default 1,
		CreatedDate date DEFAULT GETDATE(),
		ModiredDate date DEFAULT GETDATE()
	);

go
	Create table Category(
		ID int identity primary key,
		Code nvarchar(50) not null,
		Name nvarchar(150) not null,
		Description ntext not null,
		Status bit default 1,
		CreatedDate date DEFAULT GETDATE(),
		ModiredDate date DEFAULT GETDATE()
	);

go
	Create table Product(
		ID int identity primary key,
		Code nvarchar(50) not null,
		Name nvarchar(150) not null,
		Price float not null,
		SalePrice float default 0,
		Images nvarchar(150) not null,
		CategoryID int foreign key references Category(ID) not null,
		Description ntext not null,
		Status bit default 1,
		CreatedDate date DEFAULT GETDATE(),
		ModiredDate date DEFAULT GETDATE()
	);

go
	Create table Orders(
		ID int identity primary key,
		Code nvarchar(50) not null,
		Name nvarchar(150) not null,
		Email varchar(150) not null,
		Phone varchar(150) not null,
		Address nvarchar(150) not null,
		TotalQuantity int,
		TotalPrice float,
		Status bit default 1,
		AccountID int foreign key references Account(ID),
		CreatedDate date DEFAULT GETDATE(),
		ModiredDate date DEFAULT GETDATE()
	);

go
	Create table OrderDetail(
		ID int identity primary key,
		ProductID int foreign key references Product(ID) not null,
		OrderID int foreign key references Orders(ID) not null,
		Price float NOT NULL,
		Quantity int not null,
		CreatedDate date DEFAULT GETDATE(),
		ModiredDate date DEFAULT GETDATE()
	);

go
	Create table Favorite(
		ID int identity primary key,
		ProductID int foreign key references Product(ID) not null,
		AccountID int foreign key references Account(ID) not null,
		CreatedDate date DEFAULT GETDATE(),
		ModiredDate date DEFAULT GETDATE()
	);

go
	Create table Rating(
		ID int identity primary key,
		ProductID int foreign key references Product(ID) not null,
		AccountID int foreign key references Account(ID) not null,
		Star float not null,
		Description ntext not null,
		Status bit default 1,
		CreatedDate date DEFAULT GETDATE(),
		ModiredDate date DEFAULT GETDATE()
	);

GO
INSERT INTO
	Category (Code, Name, Description)
values
(
		N 'NK342',
		N'Tr??i c??y nh???p kh???u',
		N'Tr??i c??y ???????c nh???p kh???u t??? c??c n?????c kh??c nhau'
	);

INSERT INTO
	Category (Code, Name, Description)
values
(
		N 'TN236',
		N'Tr??i c??y trong n?????c',
		N'Tr??i c??y ?????c s???n c???a c??c v??ng mi???n trong n?????c'
	);

INSERT INTO
	Category (Code, Name, Description)
values
(
		N'GQ872',
		N'Gi??? qu??',
		N'Tr??i c??y ho???c ????? kh?? ???????c ????ng th??nh gi???'
	);

INSERT INTO
	Category (Code, Name, Description)
values
(
		N'TP895',
		N'Th???c ph???m',
		N'Th???c ph???m ??n u???ng h??ng ng??y'
	);

INSERT INTO
	Category (Code, Name, Description)
values
(
		N'??K357',
		N'????? kh??',
		N'Th???c ph???m kh?? v?? c??c lo???i h???t'
	);

Go
INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00001',
		N 'Nho ??en Nam Phi',
		100000,
		N'nhodennamphi1.jpg',
		1,
		N' '
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00002',
		N 'Nho ??c Sweetglobe',
		175000,
		N'nhoxanhuc1.jpg',
		1,
		N' '
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00003',
		N'Qu??t Baby ????i Loan',
		75000,
		N'quytbabydailoan1.jpg',
		1,
		N'M???ng v???, th??m, t????i, ng???t ?????m. 1kg kho???ng 8-9 qu???'
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00005',
		N'D??a L?????i ????i Loan',
		160000,
		N'dualuoidailoan1.jpg',
		1,
		N'Ru???t cam, ng???t l???m, th??m, thanh m??t  '
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00006',
		N 'Nho xanh Nam Phi',
		155000,
		N'nhoxanhnamphi1.png',
		1,
		N ' Nho c?? d??ng thu??n, v??? m???ng, m??u xanh h??? ph??ch b???t m???t. Th???t nho gi??n tan, kh??ng h???t, v??? ng???t ?????m ???? r???t ngon. '
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00007',
		N'H???ng Xi??m Xu??n ?????nh',
		45000,
		N'hongxiemxuandinh1.png',
		2,
		N 'H???ng xi??m Xu??n ?????nh c?? h????ng th??m v?? v??? ng???t r???t ?????c bi???t. Nh???ng mi???ng h???ng xi??m khi c???t m??u m???t ong ??ng ???,th???t h???ng m???n'
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00008',
		N'B?? S??p Qu???c Minh',
		75000,
		N'bosapquocminh1.jpg',
		2,
		N'C??m b??: v??ng m??u m??? g??, d???o v?? b??o d???ng ??? m???c ????? v???a ph???i, th??ch h???p cho ??n s???ng ho???c xay sinh t???, ??n salad '
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00009',
		N '???i N??? Ho??ng',
		30000,
		N'oinuhoang1.jpg',
		2,
		N '???i n??? ho??ng qu??? to, xanh, gi??n, ??n v??o c?? v??? chua ng???t, h???t r???t ??t. M???t ????a ???i N??? Ho??ng k??m ch??n mu???i ???t cay n???ng s??? l?? s??? k???t h???p ho??n h???o cho b???a ??n v???t th??m ngon, t???t cho s???c kh???e. '
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00010',
		N'Xo??i Keo',
		28000,
		N'xoaikeo1.png',
		2,
		N'Lo???i tr??i c??y ph??? bi???n ???????c ??a chu???ng gi??u ch???t x??, vitamin, kho??ng ch???t thi???t y???u gi??p cung c???p ch???t dinh d?????ng cho c?? th??? con ng?????i v?? mang l???i nhi???u l???i ??ch tuy???t v???i cho h??? ti??u h??a, tim m???ch, gi??p m???t s??ng, l??m ?????p da. Xo??i keo c?? qu??? ch???c gi??n gi??n chua ng???t th??m ngon ???????c nhi???u ng?????i ??a th??ch '
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00011',
		N'V?? S???a T??m',
		45000,
		N'vusuatim1.jpg',
		2,
		N'Kh??ng ch??? th??m v?? ng???t, v?? s???a c?? nhi???u c??ng d???ng ?????i v???i s???c kh???e  '
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00012',
		N'V???i Thi???u Thanh H??',
		30000,
		N'vaithieuthanhha1.jpg',
		2,
		N'Th???t nhi???u, c??i d???y, h???t nh???,m??i th??m ?????c tr??ng, khi ??n b???n s??? c???m nh???n ???????c v??? ng???t, thanh m??t. '
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00013',
		N'B?????i Da Xanh',
		80000,
		N'buoidaxanh1.jpg',
		2,
		N' ch???c qua??, vo?? thi?? la??i mo??ng,ha??t thi?? ra????t i??t '
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00014',
		N'Cam S??nh Ti???n Giang',
		50000,
		N'camsanhtiengiang1.png',
		2,
		N'V??? cam s??nh m??u xanh ?????n xanh v??ng khi ch??n, s???n v?? d???y 3-5mm, t??p m??u v??ng cam ?????m, nhi???u n?????c, v??? ng???t chua m??i r???t th??m v?? kh?? nhi???u h???t '
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00015',
		N'Ch??m ch??m nh??n',
		175000,
		N'nhoxanhuc1.jpg',
		2,
		N' '
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00016',
		N'Gi??? tr??i c??y GR10',
		550000,
		N'giotraicay1.jpg',
		3,
		N '2 cam m???/??c Premier
2 qu??t ??c S36
1 L?? H??n qu???c premium
1 kiwi v??ng
0.5 kg nho xanh/??en/????? M???/??c/Nam Phi
1 t??o xanh M???/Ph??p
gi??? m??y
n?? v?? v???t d???ng trang tr?? '
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00017',
		N'Gi??? tr??i c??y GQTC1',
		1540000,
		N'giotraicay2.jpg',
		3,
		N 'Nho xanh nh???p kh???u 1kg (M???, ??c, Nam Phi)
Nho ?????/k???o/??en nh???p kh???u 1kg (M???, ??c, Nam Phi)
2 kiwi v??ng New Zealand/Ph??p
4 t??o Envy
3 l?? Nam Phi
3 l?? H??n Qu???c Premier
3 cam v??ng ??c Premier
gi??? m??y cao c???p
n?? v?? v???t d???ng trang tr?? '
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00018',
		N'Gi??? tr??i c??y GQTC21',
		750000,
		N'giotraicay3.jpg',
		3,
		N '1 l?? H??n Qu???c Premier
8 t??o gala M??? S90 (ho???c t????ng ??????ng)
0.5kg nho xanh/?????/??en M???
2 cam v??ng ??c Premier
3 l?? Nam Phi
2 Qu??t ??c
gi??? c???p L
n?? v?? v???t d???ng trang tr?? '
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00019',
		N'H???p tr??i c??y HT4',
		490000,
		N'hoptraicay1.jpg',
		3,
		N ' T??o queen, Breeze NZ ho???c t????ng ??????ng
Nho xanh M???/nho ??en M???
Cam ??c
L?? H??n Qu???c Premier
Kiwi xanh ho???c t????ng ??????ng
H???p qu?? in gi???y m??? thu???t th??m
N?? v?? v???t d???ng trang tr??'
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00019',
		N'H???p tr??i c??y HQTC4',
		1600000,
		N'hoptraicay2.jpg',
		3,
		N 'D??u t??y H??n Qu???c 700gr lo???i 1
Nho xanh M???/??c/Nam Phi 2kg
Hoa trang tr??
1 c??nh h???ng ?????p th??m
h???p qu?? in gi???y m??? thu???t th??m
n?? v?? v???t d???ng trang tr??'
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00020',
		N'Mi???n Gogi H??n Qu???c',
		850000,
		N'miengogihanquoc1.jpg',
		5,
		N'Mi???n khoai lang Gogi - H??n Qu???c 1kg'
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00021',
		N'B???t Cacao Choco Quick Kruger H???p 800G',
		135000,
		N'botcacao1.png',
		5,
		N'???t ca cao pha s???a tr??? em Choco Quick Kkh??ng ch???a ch???t t???o m??u, t???o v??? v?? ch???t l??m ng???t nh??n t???o,l?? b???t s?? c?? la ho?? tan, b??? sung ch???t x??, t??ng h???p th??? Calcium, h??? tr??? ti??u ho??.'
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00022',
		N 'Ru???c C?? H???i Soboro 160g Nh???t B???n',
		95000,
		N'ruoccahoi.jpg',
		5,
		N'Ru???c c?? h???i l?? th???c ph???m r???t gi??u omega 3 ??? DHA, c?? h??m l?????ng dinh d?????ng cao c??ng nh?? h????ng v??? th??m ngon, r???t t???t cho s??? ph??t tri???n c???a tr??? v?? ?????c bi???t t???t cho n??o b???.'
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00023',
		N 'D???u ??n H???t C???i Nh???t B???n',
		78000,
		N'dauanhatcai1.jpg',
		5,
		N' '
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00024',
		N'S???a Kid Essentials ??c 800g',
		570000,
		N'sua1.jpg',
		5,
		N' '
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00025',
		N'S???a Devondale 1Kg ??c',
		260000,
		N'sua2.jpg',
		5,
		N' '
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00026',
		N 'Kiwi V??ng Newzealand 500g',
		110000,
		N'kiwivang1.jpg',
		1,
		N''
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00027',
		N 'Kiwi Xanh Newzealand 500g',
		190000,
		N'kiwixanh1.jpg',
		1,
		N''
	);

Go
INSERT INTO
	Banner (Code, Name, Images)
values
(
		N'00001',
		N'Th???c ph???m h???u c?? ngon v?? t???t cho s???c kh???e',
		N'banner1.png'
	);

INSERT INTO
	Banner (Code, Name, Images)
values
(
		N'00002',
		N'M??n ??n y??u th??ch nh???t c???a V?????n ch??ng t??i',
		N'banner2.png'
	);

go
INSERT INTO
	Account(
		Code,
		Name,
		Email,
		Phone,
		Password,
		Address,
		Birthday,
		Gender,
		Images,
		Role
	)
VALUES
	(
		N'00001',
		N'Ho??ng Th???y',
		'thuyhoang@gmail.com',
		'0912384756',
		'123456789',
		N'H???i Ph??ng',
		'1978-02-21',
		0,
		'',
		1
	),
	(
		N'00002',
		N'L???i H???i L??m',
		'lam345@gmail.com',
		'0987258445',
		'123456789',
		N'H???i D????ng',
		'1983-06-15',
		0,
		'',
		1
	),
	(
		N'00003',
		N'Ph???m Di???u Huy???n',
		'huyendieu@gmail.com',
		'0565798321',
		'123456789',
		N 'B???c Ninh',
		'1989-12-06',
		1,
		'',
		1
	),
	(
		N'00004',
		N 'Nguy???n Thanh Tr??c',
		'thanhtruc@gmail.com',
		'0366984656',
		'123456789',
		N'H???i Ph??ng',
		'1990-04-17',
		1,
		'',
		1
	),
	(
		N'00005',
		N'Ho??ng Kh??? H??n',
		'hanhan@gmail.com',
		'0984554398',
		'123456789',
		N'B???c K???n',
		'1987-10-06',
		1,
		'',
		0
	),
	(
		N'00006',
		N 'Nguy???n Ph??c An',
		'anphuc@gmail.com',
		'0326589398',
		'123456789',
		N 'Ngh??? An',
		'1990-11-13',
		0,
		'',
		1
	),
	(
		N'00007',
		N'Ph???m Gia Huy',
		'huypham332@gmail.com',
		'0563489798',
		'123456789',
		N'Thanh H??a',
		'1990-01-11',
		0,
		'',
		1
	),
	(
		N'00008',
		N'V?? Qu???c Tr?????ng',
		'quoctruong@gmail.com',
		'024568798',
		'123456789',
		N 'Ngh??? An',
		'1987-10-23',
		0,
		'',
		1
	),
	(
		N'00009',
		N'Ho??ng M???nh B??nh',
		'hoangmanhbinh@gmail.com',
		'0456825398',
		'123456789',
		N'H??ng Y??n',
		'1999-09-27',
		0,
		'',
		0
	),
	(
		N'00010',
		N'Tr???nh Thanh H??',
		'hathanh@gmail.com',
		'0988756398',
		'123456789',
		N 'H?? Nam',
		'1999-07-03',
		1,
		'',
		1
	);

go
INSERT INTO
	Blog (Code, Name, Description, Images)
VALUES
	(
		N'00001',
		N 'D???U HI???U NH???N BI???T HOA QU??? NG??M THU???C',
		N 'Hoa qu??? ng??m thu???c ??? m???t v???n ????? nh???c nh???i ??ang khi???n cho t???t c??? ng?????i ti??u d??ng Vi???t lu??n v?? c??ng hoang mang m???i l???n mua s???m. V???i mong mu???n gi??p nh???ng ng?????i n???i tr??? c?? th??? ch???n ???????c ????ng hoa qu??? t????i ngon cho gia ????nh, trong b??i vi???t sau ????y, c???a h??ng hoa qu??? s???ch ?????ng ??a ch??ng t??i s??? t???ng h???p c??c d???u hi???u c???a hoa qu??? ng??m thu???c, ?????c bi???t l?? nh???ng lo???i hoa qu??? Vi???t Nam th??ng d???ng.

D???u hi???u nh???n bi???t c??c lo???i hoa qu??? ng??m thu???c
Chu???i: D???u hi???u nh???n bi???t chu???i ch??n do ng??m thu???c th?????ng c?? m??u v??ng r???m, ?????u ?????p m???t. Khi ch???n chu???i, h??y ch???n nh???ng n???i chu???i c?? v??? m??u v??ng kh??ng ?????u, c?? m???t v??i ?????m th??m, cu???ng t????i v?? khi ???n v??o qu??? c?? ????? m???m v???a ph???i.

d???u hi???u nh???n bi???t chu???i ng??m thu???c


Ch??m ch??m: Ch??m ch??m ngon nh???t khi ch??n tr??n c??y v?? ???????c h??i xu???ng, ????? ??n trong v??ng 2 ??? 3 ng??y. V?? lo???i qu??? n??y th?????ng ch??? ???????c gi?? trong m???t th???i gian ng???n n??n s??? c?? tr?????ng h???p qu??? b??? ??p ch??n b???ng c??c lo???i thu???c ??? ?????c h???i. Khi ch???n mua ch??m ch??m, tuy???t ?????i tr??nh nh???ng qu??? c?? v??? ngo??i m??u t???i, m???m, gai qu??? b??? h??o cho d?? cu???ng v?? l?? c??n t????i. Ngo??i ra, ch??m ch??m ngon s??? c?? c??i m?? tr???ng ?????c, gi??n v?? r??c, khi t??ch v??? l???p t???c c?? n?????c ch???y ra, v?? v???y, n???u ch??m ch??m c?? hi???n t?????ng c??i ng??? vang, m???m nh??n th?? kh??ng n??n mua.

Xo??i: Xo??i ng??m h??a ch???t th?????ng c?? cu???ng b??? h??o, ??en, v??? ch??n m??u v??ng kh??ng ?????u v?? th?????ng c?? nh???ng ?????m ??en. Khi ch???n mua xo??i, h??y ch??? l???a nh???ng qu??? xo??i ch??n c?? m??u v??ng t????i ?????u, m??i th??m tinh khi???t, c???m v??o ch???c tay, cu???ng c??n nguy??n v?? c???ng b???i ????y l?? nh???ng qu??? xo??i ch??n t??? nhi??n, ch??a b??? ??? qua h??a ch???t.

T??o: C??c h??? kinh doanh hoa qu??? s???ch nh???p kh???u ??? H?? N???i chia s??? r???ng, nh???ng qu??? t??o c?? v??? nhi???u v??ng ho???c m???t l???p tr???ng m???n b??n ngo??i v??? ch??nh l?? t??o ???? b??? t???m nhi???u ch???t b???o qu???n. Khi mua t??o, c??c b???n n??n ch?? ?? k??? v??? t??o b??n trong l???p x???p ????? kh??ng b??? mua nh???m lo???i kh??ng ngon s???ch.

????o: N??n tr??nh mua nh???ng qu??? ????o c?? v??? ngo??i tr??n b??ng, to tr??n, ???n v??o qu??? m???m nh??n v?? kh??ng c?? m??i th??m tinh khi???t c???a qu??? ch??n b???i ????y r???t c?? th??? l?? ????o Trung Qu???c v?? lu??n b??? ng??m t???m h??a ch???t. H??y ch???n mua nh???ng qu??? ????o nh???, nhi???u l??ng, ?????u qu??? nh???n, cu???ng t????i, qu??? c???ng. Lo???i n??o n??y tuy c?? v??? ngo??i kh??ng b???t m???t nh??ng s??? r???t gi??n, v??? chua ng???t r???t d??? ??n v?? quan tr???ng nh???t l?? kh??ng b??? ng??m ch???t b???o qu???n.

D??a l?????i: Khi mua d??a l?????i n??n tr??nh mua nh???ng qu??? qu?? to, l???p l?????i tr??n v??? th??a, tr??n v??? c?? nh???ng ?????m n??u l???, v?? ????y l?? d??a Trung Qu???c, b??? ng??m thu???c ho???c b??? h???ng. Ch??? n??n ch???n mua nh???ng qu??? d??a l?????i d?????i 1,5kg, l???p l?????i tr??n v??? d??y, v??? h??i m???m v?? ????n h???i t???t, n???u cu???ng ???? r???ng th?? tr??n ?????u qu??? d??a ph???i c?? m???t h??? l??m n??ng, tr??n, ngo??i m??p h??nh r??ng c??a, c?? m??i th??m ng???t c???a hoa qu??? ch??n.

d???u hi???u nh???n bi???t d??a l?????i ngon s???ch 


M??t: M??t ch??n c??y c?? m??u v??ng t????i, khi b??? ra ??t m???, m??i th??m ng??t. Ch??nh v?? v???y, khi ch???n mua m??t, n??n tr??nh nh???ng qu??? m??t gai nh???, s??t, b??? ra c?? nhi???u m??? tr???ng l???ng ch???y ra, m??i v??ng nh???t ho???c kh??ng ?????u m??u.

S???u ri??ng: S???u ri??ng ngon c?? m??i th??m ng??t ?????c tr??ng, gai m???ng v?? cu???ng t????i, c?? th??? d??ng tay ????? t??ch l???y c??m. Ng?????c l???i, nh???ng qu??? s???u ri??ng c?? gai b??? b???m d???p, v??? d??y c???ng, m??i kh??ng th??m th?? c?? kh??? n??ng ???? b??? h??i non, ti??m thu???c ??p ch??n.

Cam: Cam b??? ng??m thu???c ??p ch??n th?????ng c?? m??u v??ng nh???t ?????u kh???p qu???, c??c h??? li ti ch???a tinh d???u nh???, cu???ng h??o, qu??? kh??ng ???????c tr??n c??ng. Khi mua n??n ch???n nh???ng qu??? cam cu???ng t????i, qu??? c??ng tr??n, c??c h??? ch???a tinh d???u mi???ng gi??n n??? ra, qu??? ch??n v??ng ?????m ??? ?????u cu???ng v?? nh???t d???n v??? ph??a ??u??i qu???.

??u ?????: ??u ????? b??? ng??m thu???c tuy v??? c?? m??u tr??n, m??u v??ng ??ng nh??ng khi ???n v??o kh??ng m???m, b??? ra s??? c?? r???t nhi???u nh???a. N??n ch???n mua nh???ng qu??? ??u ????? c?? cu???ng t????i, khi ???n v??o c?? ????? ????n h???i, b??? ra kh??ng c?? m??? v?? ??t h???t t???i nh???ng c???a h??ng hoa qu??? s???ch uy t??n, ???????c cam k???t v??? ch???t l?????ng ????? c?? th??? y??n t??m nh???t.

Thanh long: Thanh long c?? v??? d??y, gai h??o, m??u nh???t th?? r???t c?? th??? l?? lo???i qu??? non b??? h??i s???m, t???m thu???c. N??n ch???n nh???ng qu??? thanh long da m???ng c??ng b??ng, th??n qu??? m???y, gai t????i, m??u v??? th???m ????? mua.

B??n bon: Qu??? b??n bon ch??n chu???n s??? c?? m??u s???c ?????m, d?????i ??u??i qu??? c?? nh???ng ?????m ??en li ti nh?? b??? kim ch??m, kh??ng c?? m??, h???t ??en nh???. Ng?????c l???i, b??n bon ng??m h??a ch???t s??? c?? m??u v??ng ?????t nh???t v?? ?????u, da tr??n b??ng, h???t to m??u h???ng v?? c?? nhi???u m???.

d???u hi???u nh???n bi???t b??n bon s???ch


Nh??n: Nh??n b??? phun thu???c b???o qu???n th?????ng c?? h??nh d??ng ?????p, v??? ?????u m??u, c??ng, kh??ng c?? l???p s???n t??? nhi??n. Nh??n ch??n c??y th?????ng c?? m??i th??m ng???t n??n c??c b???n c??ng c?? th??? d???a v??o m??i h????ng ????? nh???n bi???t c?? ph???i nh??n s???ch ch??n c??y hay kh??ng. N??n tr??nh b??? thu h??t b???i nh???ng qu??? nh??n ?????p m?? ch???n nh???m lo???i qu??? ?????c h???i.

Hy v???ng r???ng v???i nh???ng chia s??? v??? c??c d???u hi???u nh???n bi???t hoa qu??? ng??m thu???c tr??n ????y c???a ch??ng t??i s??? gi??p cho c??c b???n d??? d??ng h??n trong vi???c ch???n v?? ??n hoa qu??? th???t s??? s???ch, kh??ng b??? ng??m t???m c??c ch???t h??a h???c.

N???u c??c b???n v???n ??ang t??m cho m??nh m???t c???a h??ng hoa qu??? s???ch ?????ng ??a H?? N???i th???t s??? uy t??n ????? kh??ng c??n ph???i lo l???ng nhi???u v??? v???n ????? ch???t l?????ng hoa qu???, h??y li??n h??? ngay v???i c???a h??ng hoa qu??? s???ch ????ng D????ng ????? ???????c ph???c v??? t???n n??i v?? cam k???t tuy???t ?????i v??? ????? an to??n c???a s???n ph???m.',
		N'1.jpg'
	),
	(
		N'00002',
		N '??N HOA QU??? N??O ????? PH??NG CH???NG D???CH CORONA?',
		N '??n hoa qu??? n??o ????? ph??ng ch???ng d???ch Corona?
D???ch c??m do virus Corona hi???n ??ang l?? ?????i d???ch tr??n th??? gi???i v???i con s??? ng?????i nhi???m b???nh l??n ?????n h??n 20 ngh??n ng?????i, v???i g???n 400 ng?????i t??? vong. Do ????, c??ng t??c ph??ng ch???ng d???ch c??m Corona ??ang ???????c c??c qu???c gia r??o ri???t th???c thi. B??n c???nh c??c khuy???n c??o c???a B??? Y t??? Vi???t Nam v??? vi???c ph??ng ch???ng Corona nh??: Th?????ng xuy??n r???a tay b???ng x?? ph??ng, tr??nh t??? t???p ????ng ng?????i, s??? d???ng kh???u trang khi ra ngo??i ho???c ti???p x??c n??i ????ng ng?????i, ??n th???c ph???m n???u ch??n,... th?? vi???c t??ng c?????ng s???c ????? kh??ng cho c?? th??? c??ng l?? ??i???u r???t c???n thi???t. Khi nh???c ?????n s???c ????? kh??ng th?? kh??ng th??? kh??ng nh???c ?????n Vitamin C, lo???i Vitamin th??c ?????y h??? th???ng mi???n d???ch. V???y n??n ??n nh???ng lo???i hoa qu??? t????i n??o ????? c?? nhi???u Vitamin C nh???t m?? l???i v???a d??? mua, m???i c??c b???n c??ng theo d??i b??i vi???t sau.

C?? th??? b???n quan t??m: L???a ch???n v?? ??n hoa qu??? ????ng c??ch.

1. ???i
C?? 228 gram Vitamin C m???i 100 gram ???i. ????y l?? lo???i tr??i c??y nhi???t ?????i c?? v??? ng???t v???i nhi???u ch???t x??, vitamin A, axit folic, ?????ng, v?? nhi???u vitamin C h??n b???n l???n so v???i cam. B???n n??n ??n lu??n c??? v??? khi ??n ???i, v?? ch??ng c??ng ch???a m???t ngu???n vitamin d???i d??o.

2. Kiwi
C?? 90 gram Vitamin C m???i 100 gram kiwi. Kiwi l?? lo???i qu??? c?? v??? ng???t nh???, h????ng th??m m??t d??? ch???u v?? r???t gi??u vitamin C, v?? c??ng c?? nhi???u kali h??n chu???i. Ng?????i ta th?????ng th??i l??t kiwi ????? l??m m??n salad tr??i c??y, c?? th??? k???t h???p v???i d??u t??y.

3. D??u t??y
C?? 60 gram c???a Vitamin C m???i 100 gram d??u t??y. ????y l?? m???t m??n ??n ngon gi??u Vitamin C, th???m ch?? nhi???u h??n cho m???i gram c???a qu??? cam. D??u t??y c?? th??? ??n t????i ho???c l??m salad, xay sinh t??? ?????u r???t ngon m?? l???i b??? d?????ng.

4. Cam
C?? 50 gram Vitamin C m???i 100 gram cam. T???i sao khi nghe v?? nh??n th???y qu??? n??y ??i???u ch??ng ta ngh?? ?????n ?????u ti??n l?? n?? r???t gi??u vitamin C? H??? nh?? cam qu??t kh??ng nh???ng r???t gi??u vitamin C, m?? ch??ng r???t ngon. C??c nh?? khoa h???c c??ng ch??? ra r???ng m??i h????ng cam l??m cho m???i ng?????i c???m th???y d??? ch???u v?? vui v??? h??n.

Hy v???ng v???i chia s??? tr??n ????y s??? gi??p c??c b???n c?? th??m c??ch ph??ng ch???ng d???ch c??m Corona. Tuy nhi??n, khi th???y b???n th??n ho???c ng?????i trong gia ????nh b??? ho, s???t, kh?? th??? c???n ph???i ?????n c?? s??? y t??? g???n nh???t ????? ki???m tra s???c kh???e.',
		N'2.jpg'
	),
	(
		N'00003',
		N 'GI???M C??N B???NG HOA QU??? T????I C?? TH???C S??? HI???U QU????',
		N 'Gi???m c??n b???ng hoa qu??? t????i c?? th???c s??? hi???u qu????
????y l?? m???t s??? tin t???t n???u b???n y??u th??ch c??c lo???i hoa qu??? nh???p kh???u: T??o, c??c lo???i d??u, l??. ??n tr??i c??y li???u c?? ph???i l?? ph????ng ph??p gi???m c??n hi???u qu???. ????ng, tr??i c??y ch???a carbs v?? ???????ng t??? nhi??n. Nh??ng c?? nh???ng l?? do quan tr???ng ????? l??m cho tr??i c??y tr??? th??nh m???t lo???i th???c ph???m h??ng ng??y trong ch??? ????? ??n u???ng c???a b???n, ngay c??? khi b???n gi???m c??n. ??i???u quan tr???ng l?? ph???i ??n hoa qu??? theo m???t ch??? ????? khoa h???c th?? vi???c gi???m c??n m???i th??nh c??ng.

S??? li??n quan gi???a c??c ch???t t??? nhi??n trong hoa qu??? v???i vi???c gi???m c??n.
C??c ch???t t??? nhi??n trong hoa qu???, bao g???m vitamin, kho??ng ch???t, ch???t ch???ng oxy h??a, ch???t x?? v?? prebiotic, c???c k??? t???t cho b???n, kh??ng ch??? trong vi???c b???o v??? ch???ng l???i c??c b???nh m??n t??nh m?? c??n gi??p ki???m so??t c??n n???ng c???a b???n. 

Trong nghi??n c???u, hoa qu??? th???c s??? ???? ???????c g???n li???n v???i gi???m c??n, kh??ng l??m t??ng c??n. M???t nghi??n c???u cho th???y nh???ng ng?????i tr?????ng th??nh th???a c??n v?? b??o ph?? ??n nhi???u tr??i c??y s??? gi???m c??n nhi???u h??n so v???i nh???ng ng?????i kh??ng ??n. M???t nghi??n c???u kh??c, theo d??i h??n 130.000 ng?????i tr?????ng th??nh trong 24 n??m, cho th???y ti??u th??? tr??i c??y c?? li??n quan ?????n vi???c gi???m c??n ???????c c???i thi???n theo th???i gian.

Li??n k???t n??y c?? th??? l?? v?? tr??i c??y c?? th??? gi??p t??ng c???m gi??c no, th???a m??n c??n th??m ng???t v?? gi???m ham mu???n ????o s??u v??o c??c m??n ngon nh?? k???o ho???c ????? n?????ng. Tr??i c??y c??ng c?? xu h?????ng thay th??? c??c m??n ??n c?? l?????ng calo cao h??n, trong khi rau c?? xu h?????ng tr??? th??nh m??n b??? sung. N??i c??ch kh??c, b???n c?? nhi???u kh??? n??ng ch???n m???t qu??? t??o h??n l?? m???t mi???ng b??ng c???i xanh thay cho b??nh quy; v?? s??? ho??n ?????i ???? c?? th??? gi??p b???n h???n ch??? t???ng l?????ng calo v?? tr??nh th??m ???????ng, th??? ph???m th???c s??? g??y ra vi???c t??ng c??n.


C??ch ??n hoa qu??? ????? gi???m c??n hi???u qu???.
So s??nh v???i m???t mu???ng canh ???????ng, ch???a 16 gram carbs v?? kh??ng c?? ch???t dinh d?????ng. V??? c?? b???n, to??n b???, hoa qu??? t????i v?? ???????ng kh??ng c??ng chung m???t lo???i.

T???t nhi??n, ??i???u ???? kh??ng c?? ngh??a l?? b???n c?? th??? ??n kh??ng gi???i h???n s??? l?????ng tr??i c??y. Tr??i c??y c?? ch???a carbohydrate, v?? c??ng vi???c c???a carbs l?? th??c ?????y ho???t ?????ng c???a c??c t??? b??o c???a b???n. Khi b???n ??n nhi???u carbs h??n m???c b???n c?? th??? ?????t ch??y sau b???a ??n ho???c b???a ??n nh???, th???m ch?? t??? tr??i c??y, th???ng d?? kh??ng c???n thi???t c?? th??? cung c???p ch???t b??o hi???n c??, ho???c l??m ?????y c??c t??? b??o m???.

V?? l?? do n??y, t???ng l?????ng carb c???a b???n, bao g???m c??? tr??i c??y, n??n t????ng ???ng v???i nhu c???u ph?? h???p v???i th??? tr???ng c???a b???n, d???a tr??n chi???u cao, c??n n???ng l?? t?????ng, gi???i t??nh, tu???i t??c v?? m???c ????? ho???t ?????ng th??? ch???t c???a b???n. H???u h???t n??? gi???i c?? th??? ????? kh??? n??ng ??n hai ph???n tr??i c??y m???i ng??y (nhi???u h??n n???u h??? cao h??n ho???c n??ng ?????ng h??n), v???i m???t kh???u ph???n l?? m???t c???c, ho???c m???t mi???ng c?? k??ch th?????c b???ng m???t qu??? b??ng ch??y.

V?? carbs trong tr??i c??y gi??p cung c???p n??ng l?????ng, khi b???n ??n tr??i c??y c??ng v???y. V?? d???: ??n m???t d??a nho k???o xanh v??o ????m khuya trong khi b???n ??ang xem TV ho???c l?????t web (khi nhu c???u n??ng l?????ng c???a b???n th???p) th?? kh??ng c?? ?? ngh??a g?? c???. Thay v??o ????, l??n kh???u ph???n tr??i c??y v??o c??c b???a ??n v?? ????? ??n nh??? b???n ti??u th??? tr?????c gi??? ho???t ?????ng nhi???u h??n trong ng??y. Ch???ng h???n, b???n c?? th??? ??n m???t qu??? chu???i nh??? 20 ho???c 30 ph??t tr?????c khi t???p luy???n th??? d???c, ho???c ??n qu??? m???ng v???i b???a s??ng tr?????c khi ??i l??m vi???c v?? k???t h???p m???t qu??? t??o v???i b?? h???nh nh??n v??o bu???i chi???u ????? gi??p cung c???p n??ng l?????ng cho c??? ng??y.


Theo nh?? lo???i tr??i c??y b???n ch???n, h??y c??? g???ng c?? ???????c m???t lo???i t???t ????? ????a c?? th??? b???n h???p th??? h???t c??c ch???t dinh d?????ng v?? ch???t ch???ng oxy h??a. Kh??ng c?? tr??i c??y n??o v?????t qu?? gi???i h???n n???u b???n ph???i suy ngh?? k??? v??? s??? l?????ng v?? th???i gian. V?? d???, trong khi d??a h???u l?? m???t lo???i tr??i c??y c?? ch??? s??? ???????ng huy???t cao, h??y th?????ng th???c n?? khi v??o m??a m???t l?????ng v???a ?????, v?? m???t c???c ch???a ??t h??n 50 calo, v?? n?? cung c???p vitamin C, kali v?? ch???t ch???ng oxy h??a g???n v???i kh??? n??ng ch???ng vi??m, b???o v??? ch???ng l???i b???nh tim, v?? c???i thi???n s???c b???n t???p th??? d???c v?? ph???c h???i.

T??m l???i: Hoa qu??? t????i l?? v?? c??ng b??? d?????ng v?? kh??ng ph???i l?? v??? b??o. T??c ?????ng c???a n?? ?????n c??n n???ng c???a b???n ph??? thu???c v??o th???i ??i???m b???n ti??u th??? n??, v?? b???n ??n bao nhi??u. Kh??ng ??n tr??i c??y ho??n to??n c?? th??? ph???n t??c d???ng ????? gi???m c??n, v?? t??c ?????ng ti??u c???c ?????n s???c kh???e t???ng th??? c???a b???n. Thay v??o ????, h??y ?????t ???????c s??? c??n b???ng ph?? h???p ????? g???t h??i t???t c??? nh???ng l???i ??ch c???a tr??i c??y v?? v???n ?????t ???????c m???c ti??u gi???m c??n c???a b???n.

gi???m c??n b???ng hoa qu??? t????i 3
M???t khi ???? l???a ch???n gi???m c??n b???ng hoa qu??? th?? ??u ti??n h??ng ?????u ph???i l?? s??? t????i ngon v?? an to??n c???a tr??i c??y. Shophoaqua.vn h??n h???nh ph???c v??? Q??y kh??ch h??ng ??a d???ng c??c lo???i hoa qu??? t??? Vi???t Nam cho ?????n tr??i c??y nh???p kh???u ch???t l?????ng cao, ?????m b???o ngu???n g???c xu???t x??? r?? r??ng v?? gi?? c??? ph???i ch??ng',
		N'3.jpg'
	),
	(
		N'00004',
		N 'C??CH B???O QU???N TR??I C??Y G???T S???N LU??N T????I NGON',
		N 'Ch???c ???? kh??ng ??t l???n b???n th???c m???c, t???i sao nh???ng ch??? b??n tr??i c??y g???t s???n, nh???ng h???p tr??i c??y c???a h??? lu??n t????i ngon nh?? v???y. Trong khi ??? nh?? m??nh, tr??i c??y v???a c???t ra ???? ngay l???p t???c b??? ?????i m??u, c?? khi c??n th??m d???p.

C??ch b???o qu???n tr??i c??y g???t s???n
T???t c??? ?????u c?? b?? quy???t. Sau ????y, shophoaqua.vn s??? b???t m?? cho b???n m???t v??i c??ch ????? gi??? hoa qu??? c???t s???n kh??ng b??? ?????i m??u, b???m d???p, ????? b???n lu??n c?? nh???ng ????a hoa qu??? t????i ngon nh???t cho gia ????nh. H???u h???t t???t c??? c??c lo???i tr??i c??y ?????u c?? c??ch b???o qu???n nh?? nhau, tuy nhi??n, c??ng s??? c?? m???t v??i lo???i ?????c bi???t nh?? t??o v?? l?? ch???ng h???n. Sau ????y ch??ng ta s??? c??ng nhau t??m hi???u nh??!

B???o qu???n t??o v?? l?? sau khi g???t v???

L?? v?? t??o g???t s???n l?? 2 lo???i qu??? d??? b??? th??m d???p sau khi g???t, c???n ph???i b???o qu???n ????ng c??ch ????? qu??? lu??n t????i ngon

T??o v?? l?? ch??nh l?? 2 lo???i qu??? ???g??y phi???n mu???n??? nhi???u nh???t b???i c?? khi, b???n ch??a g???t xong th?? ch??ng ???? b??? b???m r???i. ????? kh??ng c??n g???p nh???ng t??nh tr???ng nh?? tr??n, c??c b???n h??y g???t t??o, l?? ??? n??i k??n gi??, sau khi g???t xong th?? ngay l???p t???c ng??m v??o 1 trong 2 dung d???ch sau:

N?????c mu???i pha th???t lo??ng
N?????c ???m pha 1 th??a n?????c c???t chanh
Sau khi v???t qu??? ra kh???i dung d???ch, hay ????? r??o n?????c v?? cho qu??? v??o h???p ????ng k??n, ho???c cho l??n ????a v?? b???c b???ng m??ng b???c th???c ph???m, sau ???? cho v??o ng??n m??t th???c ph???m ????? qu??? t????i v?? gi??n nh??.

B???o qu???n ??u ?????, d??a h???u v?? d??a l?????i sau khi g???t v???
????y l?? 3 lo???i qu??? t????ng ?????i ???d??? ch???u??? h??n v?? ch??ng s??? kh??ng c?? t??nh tr???ng th??m, d???p ngay l???p t???c, m?? ch??? khi ????? b??n ngo??i kh?? l??u th?? m???i b??? ?????i v???. V???i 3 lo???i hoa qu??? b??? s???n n??y, ch??ng ta ch??? c???n ????? r??o, sau ???? cho v??o h???p ????ng k??n, ho???c d??ng m??ng b???c th???c ph???m ????? b???c l???i, sau ???? cho v??o ng??n m??t t??? l???nh ????? gi??? ???????c ????? t????i ngon cho ch??ng.

B???o qu???n cam, qu??t, d???a g???t s???n
Cam qu??t sau khi g???t s???n n??n ????? kh?? r??o v?? b???c b???ng m??ng b???c th???c ph???m, tr??nh cho ti???p x??c v???i kh??ng kh?? ????? gi??? nguy??n v??? t????i, ng???t cho qu???.


M???t s??? l??u ?? kh??c v???i hoa qu??? t????i g???t s???n
Khi b???o qu???n hoa qu???, h??y t??ch ri??ng t???ng lo???i qu??? ????? ?????m b???o v??? ngon ???????c gi??? tr???n v???n.
Nh???ng m???o tr??n ????y c?? th??? gi??p b???n b???o qu???n hoa qu??? t????i g???t s???n ngon su???t c??? m???t ng??y. Tuy nhi??n b???n n??n nh??? r???ng, hoa qu??? g???t s???n ch??? n??n ???????c s??? d???ng trong v??ng t???i ??a 8h ????? ?????m b???o nh???ng vitamin trong qu??? ???????c c?? th??? h???p th??? l?? ?????y ????? v?? t???t nh???t nh??.',
		N'1.jpg'
	);

Select
	*
from
	Account
	