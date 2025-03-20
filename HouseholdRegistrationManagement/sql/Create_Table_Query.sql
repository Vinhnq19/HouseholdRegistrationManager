USE [master]
GO
/****** Object:  Database [HouseholdRegistrationManagement]    Script Date: 3/21/2025 12:08:15 AM ******/
CREATE DATABASE [HouseholdRegistrationManagement] 
GO
USE [HouseholdRegistrationManagement]
GO
/****** Object:  Table [dbo].[HouseholdMembers]    Script Date: 3/21/2025 12:08:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HouseholdMembers](
	[MemberID] [int] IDENTITY(1,1) NOT NULL,
	[HouseholdID] [int] NULL,
	[UserID] [int] NULL,
	[Relationship] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Households]    Script Date: 3/21/2025 12:08:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Households](
	[HouseholdID] [int] IDENTITY(1,1) NOT NULL,
	[HeadOfHouseholdID] [int] NULL,
	[Address] [nvarchar](max) NOT NULL,
	[CreatedDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[HouseholdID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 3/21/2025 12:08:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Action] [nvarchar](100) NOT NULL,
	[Timestamp] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 3/21/2025 12:08:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[NotificationID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Message] [nvarchar](max) NOT NULL,
	[SentDate] [datetime] NULL,
	[IsRead] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registrations]    Script Date: 3/21/2025 12:08:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registrations](
	[RegistrationID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[RegistrationType] [nvarchar](20) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[Status] [nvarchar](10) NULL,
	[ApprovedBy] [int] NULL,
	[Comments] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NOT NULL,
	[DocumentPath] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[RegistrationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/21/2025 12:08:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[Role] [nvarchar](20) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Households] ON 
GO
INSERT [dbo].[Households] ([HouseholdID], [HeadOfHouseholdID], [Address], [CreatedDate]) VALUES (1, 1, N'Th?ch Th?t, Hà N?i', CAST(N'2025-03-10' AS Date))
GO
INSERT [dbo].[Households] ([HouseholdID], [HeadOfHouseholdID], [Address], [CreatedDate]) VALUES (2, 1, N'Th?ch Th?t, Hà N?i', CAST(N'2025-03-10' AS Date))
GO
INSERT [dbo].[Households] ([HouseholdID], [HeadOfHouseholdID], [Address], [CreatedDate]) VALUES (3, 1, N'Th?ch Th?t, Hà N?i', CAST(N'2025-03-10' AS Date))
GO
INSERT [dbo].[Households] ([HouseholdID], [HeadOfHouseholdID], [Address], [CreatedDate]) VALUES (4, 1, N'Th?ch Th?t, Hà N?i', CAST(N'2025-03-10' AS Date))
GO
INSERT [dbo].[Households] ([HouseholdID], [HeadOfHouseholdID], [Address], [CreatedDate]) VALUES (5, 1, N'Th?ch Th?t, Hà N?i', CAST(N'2025-03-10' AS Date))
GO
INSERT [dbo].[Households] ([HouseholdID], [HeadOfHouseholdID], [Address], [CreatedDate]) VALUES (6, 1, N'Th?ch Th?t, Hà N?i', CAST(N'2025-03-10' AS Date))
GO
INSERT [dbo].[Households] ([HouseholdID], [HeadOfHouseholdID], [Address], [CreatedDate]) VALUES (7, 1, N'Th?ch Th?t, Hà N?i', CAST(N'2025-03-10' AS Date))
GO
INSERT [dbo].[Households] ([HouseholdID], [HeadOfHouseholdID], [Address], [CreatedDate]) VALUES (8, 1, N'Th?ch Th?t, Hà N?i', CAST(N'2025-03-10' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Households] OFF
GO
SET IDENTITY_INSERT [dbo].[Registrations] ON 
GO
INSERT [dbo].[Registrations] ([RegistrationID], [UserID], [RegistrationType], [StartDate], [EndDate], [Status], [ApprovedBy], [Comments], [Address], [DocumentPath]) VALUES (1073, 11, N'Permanent', CAST(N'2005-06-23' AS Date), CAST(N'2024-03-30' AS Date), N'Approved', 17, NULL, N'43A đường Nguyễn Thị Minh Khai, Hương Khê, Hà Tĩnh', N'uploads/445773029_1199525614550182_248706004247581571_n.jpg')
GO
INSERT [dbo].[Registrations] ([RegistrationID], [UserID], [RegistrationType], [StartDate], [EndDate], [Status], [ApprovedBy], [Comments], [Address], [DocumentPath]) VALUES (1074, 11, N'HouseholdSeparation', CAST(N'2025-03-19' AS Date), NULL, N'Approved', 17, N'43A đường Nguyễn Thị Minh Khai, Hương Khê, Hà Tĩnh', N'Quận Ba Đình, Hà Nội', N'uploads/431601977_1451460365764779_4270657843896295410_n (2).jpg')
GO
INSERT [dbo].[Registrations] ([RegistrationID], [UserID], [RegistrationType], [StartDate], [EndDate], [Status], [ApprovedBy], [Comments], [Address], [DocumentPath]) VALUES (1075, 16, N'Permanent', CAST(N'2025-03-02' AS Date), CAST(N'2030-02-28' AS Date), N'Approved', NULL, NULL, N'Nghĩ Thuận, Nghĩa Đàn, Nghệ An', N'uploads/393739563_847242443716352_4861979720965618749_n.jpg')
GO
INSERT [dbo].[Registrations] ([RegistrationID], [UserID], [RegistrationType], [StartDate], [EndDate], [Status], [ApprovedBy], [Comments], [Address], [DocumentPath]) VALUES (1076, 11, N'Permanent', CAST(N'2025-03-08' AS Date), CAST(N'2028-02-26' AS Date), N'Approved', 17, NULL, N'Nghĩ Thuận, Nghĩa Đàn, Nghệ An', N'uploads/431981308_3667347980204541_3995986646029422631_n.jpg')
GO
INSERT [dbo].[Registrations] ([RegistrationID], [UserID], [RegistrationType], [StartDate], [EndDate], [Status], [ApprovedBy], [Comments], [Address], [DocumentPath]) VALUES (1077, 11, N'HouseholdSeparation', CAST(N'2025-03-20' AS Date), NULL, N'Approved', 17, N'Nghĩ Thuận, Nghĩa Đàn, Nghệ An', N'Quận Ba Đình, Hà Nội', N'uploads/393739563_847242443716352_4861979720965618749_n.jpg')
GO
INSERT [dbo].[Registrations] ([RegistrationID], [UserID], [RegistrationType], [StartDate], [EndDate], [Status], [ApprovedBy], [Comments], [Address], [DocumentPath]) VALUES (1078, 11, N'Permanent', CAST(N'2025-03-08' AS Date), CAST(N'2028-02-29' AS Date), N'Approved', 17, NULL, N'Nghĩ Thuận, Nghĩa Đàn, Nghệ An', N'uploads/409950234_686392267020574_7379570985097880896_n.jpg')
GO
INSERT [dbo].[Registrations] ([RegistrationID], [UserID], [RegistrationType], [StartDate], [EndDate], [Status], [ApprovedBy], [Comments], [Address], [DocumentPath]) VALUES (1079, 11, N'HouseholdSeparation', CAST(N'2025-03-20' AS Date), NULL, N'Rejected', 17, N'Nghĩ Thuận, Nghĩa Đàn, Nghệ An', N'Quận Ba Đình, Hà Nội', N'uploads/393739563_847242443716352_4861979720965618749_n.jpg')
GO
SET IDENTITY_INSERT [dbo].[Registrations] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password], [Role], [Address]) VALUES (1, N'Pepe Lent', N'plent0@github.com', N'rT4\.I+iE', N'Citizen', N'Sơn Tây, Hà Nội')
GO
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password], [Role], [Address]) VALUES (2, N'Zorine Michieli', N'zmichieli1@weather.com', N'mJ6<0HKb', N'Police', N'8th Floor')
GO
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password], [Role], [Address]) VALUES (3, N'Meredithe Merioth', N'mmerioth2@edublogs.org', N'sF2#uA,/yI', N'AreaLeader', N'Room 1190')
GO
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password], [Role], [Address]) VALUES (5, N'Tull Klimschak', N'tklimschak4@imdb.com', N'mL2)erWIH', N'AreaLeader', N'Suite 44')
GO
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password], [Role], [Address]) VALUES (6, N'Darrel Antoney', N'dantoney5@aol.com', N'tY3%BVo.>', N'Police', N'Apt 1581')
GO
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password], [Role], [Address]) VALUES (7, N'Calley O''Devey', N'codevey6@fc2.com', N'iW1*99No(ro', N'Citizen', N'Apt 1136')
GO
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password], [Role], [Address]) VALUES (8, N'Car Tarry', N'ctarry7@patch.com', N'kG7,cPIP|&', N'Police', N'Room 1918')
GO
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password], [Role], [Address]) VALUES (9, N'Raffaello Burgen', N'rburgen8@ehow.com', N'dG8"/''~"+7}tC)=''', N'AreaLeader', N'Apt 201')
GO
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password], [Role], [Address]) VALUES (10, N'Pavlov Nettle', N'pnettle9@github.com', N'pS0\hpN~|%', N'Citizen', N'Suite 87')
GO
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password], [Role], [Address]) VALUES (11, N'Nguyễn Quang Vinh', N'52vhilovehvh@gmail.com', N'123', N'Citizen', N'Sơn Tây, Hà Nội')
GO
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password], [Role], [Address]) VALUES (12, N'Trần Hải Đăng', N'asdasdasdas@gmail.com', N'123', N'Citizen', N'Hưng Yên')
GO
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password], [Role], [Address]) VALUES (13, N'Lebron James', N'lebron@gmail.com', N'123', N'Citizen', N'Nghệ An')
GO
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password], [Role], [Address]) VALUES (14, N'Lebron James', N'james@gmail.com', N'123', N'Citizen', N'Hà Tĩnh')
GO
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password], [Role], [Address]) VALUES (15, N'Atus', N'atus@gmail.com', N'123', N'Citizen', N'Hà Đông')
GO
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password], [Role], [Address]) VALUES (16, N'Naruto', N'naruto@gmail.com', N'123', N'Citizen', N'Naruto')
GO
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password], [Role], [Address]) VALUES (17, N'Naruto', N'hokage@gmail.com', N'123', N'AreaLeader', N'Naruto')
GO
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password], [Role], [Address]) VALUES (21, N'Nguy?n Quang Vinh', N'vinhnqhe194181@gmail.com', N'123', N'Admin', N'C?a Lò, Ngh? An')
GO
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password], [Role], [Address]) VALUES (22, N'Nguyễn Thu Trang', N'holavina@gmail.com', N'123', N'Police', N'43A đường Nguyễn Thị Minh Khai, Hương Khê, Hà Tĩnh')
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Email]    Script Date: 3/21/2025 12:08:15 AM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UQ_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Households] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Logs] ADD  DEFAULT (getdate()) FOR [Timestamp]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT (getdate()) FOR [SentDate]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT ((0)) FOR [IsRead]
GO
ALTER TABLE [dbo].[HouseholdMembers]  WITH CHECK ADD FOREIGN KEY([HouseholdID])
REFERENCES [dbo].[Households] ([HouseholdID])
GO
ALTER TABLE [dbo].[HouseholdMembers]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Households]  WITH CHECK ADD FOREIGN KEY([HeadOfHouseholdID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Logs]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Registrations]  WITH CHECK ADD FOREIGN KEY([ApprovedBy])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Registrations]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Registrations]  WITH CHECK ADD  CONSTRAINT [CK_RegistrationType] CHECK  (([RegistrationType]='HouseholdSeparation' OR [RegistrationType]='TemporaryStay' OR [RegistrationType]='Temporary' OR [RegistrationType]='Permanent'))
GO
ALTER TABLE [dbo].[Registrations] CHECK CONSTRAINT [CK_RegistrationType]
GO
ALTER TABLE [dbo].[Registrations]  WITH CHECK ADD  CONSTRAINT [CK_Status] CHECK  (([Status]='Rejected' OR [Status]='Approved' OR [Status]='Pending'))
GO
ALTER TABLE [dbo].[Registrations] CHECK CONSTRAINT [CK_Status]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [CHK_Role] CHECK  (([Role]='Admin' OR [Role]='Police' OR [Role]='AreaLeader' OR [Role]='Citizen'))
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [CHK_Role]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD CHECK  (([Role]='Police' OR [Role]='AreaLeader' OR [Role]='Citizen' OR [Role]='Admin'))
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [CK_UserRole] CHECK  (([Role]='Admin' OR [Role]='Citizen' OR [Role]='AreaLeader' OR [Role]='Police'))
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [CK_UserRole]
GO
USE [master]
GO
ALTER DATABASE [HouseholdRegistrationManagement] SET  READ_WRITE 
GO
