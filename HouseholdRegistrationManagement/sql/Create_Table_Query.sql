USE [master]
GO
CREATE DATABASE [HouseholdRegistrationManagement]
GO
USE [HouseholdRegistrationManagement]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HouseholdMembers](
	[MemberID] [int] IDENTITY(1,1) NOT NULL,
	[HouseholdID] [int] NULL,
	[UserID] [int] NULL,
	[Relationship] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Households]    Script Date: 09/03/2025 5:30:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Households](
	[HouseholdID] [int] IDENTITY(1,1) NOT NULL,
	[HeadOfHouseholdID] [int] NULL,
	[Address] [text] NOT NULL,
	[CreatedDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[HouseholdID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Action] [varchar](100) NOT NULL,
	[Timestamp] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 09/03/2025 5:30:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[NotificationID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Message] [text] NOT NULL,
	[SentDate] [datetime] NULL,
	[IsRead] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registrations]    Script Date: 09/03/2025 5:30:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registrations](
	[RegistrationID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[RegistrationType] [varchar](20) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[Status] [varchar](10) NULL,
	[ApprovedBy] [int] NULL,
	[Comments] [text] NULL,
	[Address] [text] NOT NULL,
	[DocumentPath] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[RegistrationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 09/03/2025 5:30:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [varchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[Role] [varchar](20) NOT NULL,
	[Address] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Registrations] ON 
GO
INSERT [dbo].[Registrations] ([RegistrationID], [UserID], [RegistrationType], [StartDate], [EndDate], [Status], [ApprovedBy], [Comments], [Address], [DocumentPath]) VALUES (6, 3, N'Temporary', CAST(N'2025-03-10' AS Date), CAST(N'2025-03-20' AS Date), N'Pending', NULL, NULL, N'123 Ðu?ng ABC, Qu?n 1', N'uploads/IMG_7022.CR2')
GO
INSERT [dbo].[Registrations] ([RegistrationID], [UserID], [RegistrationType], [StartDate], [EndDate], [Status], [ApprovedBy], [Comments], [Address], [DocumentPath]) VALUES (17, 1, N'Temporary', CAST(N'2025-03-10' AS Date), CAST(N'2025-03-20' AS Date), N'Pending', NULL, NULL, N'123 Ðu?ng ABC, Qu?n 1', N'uploads/sample.pdf')
GO
INSERT [dbo].[Registrations] ([RegistrationID], [UserID], [RegistrationType], [StartDate], [EndDate], [Status], [ApprovedBy], [Comments], [Address], [DocumentPath]) VALUES (22, 1, N'Permanent', CAST(N'2024-12-12' AS Date), NULL, N'Pending', NULL, NULL, N'42 du?ng Nguy?n Thân M?n, phu?ng Nghi Th?y, Th? xã C?a Lò, Ngh? An', N'uploads/480944976_1171465421649378_5464771121267732387_n.jpg')
GO
SET IDENTITY_INSERT [dbo].[Registrations] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password], [Role], [Address]) VALUES (1, N'Pepe Lent', N'plent0@github.com', N'rT4\.I+iE', N'Citizen', N'Apt 774')
GO
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password], [Role], [Address]) VALUES (2, N'Zorine Michieli', N'zmichieli1@weather.com', N'mJ6<0HKb', N'Police', N'8th Floor')
GO
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password], [Role], [Address]) VALUES (3, N'Meredithe Merioth', N'mmerioth2@edublogs.org', N'sF2#uA,/yI', N'AreaLeader', N'Room 1190')
GO
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password], [Role], [Address]) VALUES (4, N'Corie Axston', N'caxston3@edublogs.org', N'kY7''=9Nkq6y7', N'Citizen', N'Suite 7')
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
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D10534E7A8FD85]    Script Date: 09/03/2025 5:30:28 CH ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
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
ALTER TABLE [dbo].[Registrations] ADD  DEFAULT ('Pending') FOR [Status]
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
ALTER TABLE [dbo].[Registrations]  WITH CHECK ADD CHECK  (([RegistrationType]='TemporaryStay' OR [RegistrationType]='Temporary' OR [RegistrationType]='Permanent'))
GO
ALTER TABLE [dbo].[Registrations]  WITH CHECK ADD CHECK  (([Status]='Rejected' OR [Status]='Approved' OR [Status]='Pending'))
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD CHECK  (([Role]='Police' OR [Role]='AreaLeader' OR [Role]='Citizen' OR [Role]='Admin'))
GO
USE [master]
GO
ALTER DATABASE [HouseholdRegistrationManagement] SET  READ_WRITE 
GO
