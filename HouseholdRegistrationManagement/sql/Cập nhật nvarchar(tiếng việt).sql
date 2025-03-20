-- Xóa ràng buộc CHECK trên cột RegistrationType và Status
ALTER TABLE [dbo].[Registrations] DROP CONSTRAINT CK__Registrat__Regis__3F466844;
ALTER TABLE [dbo].[Registrations] DROP CONSTRAINT CK__Registrat__Statu__412EB0B6;
ALTER TABLE [dbo].[Registrations] DROP CONSTRAINT DF__Registrat__Statu__403A8C7D;

-- Xóa ràng buộc UNIQUE trên Email
ALTER TABLE [dbo].[Users] DROP CONSTRAINT UQ__Users__A9D10534E7A8FD85;

-- Xóa ràng buộc CHECK trên Role
ALTER TABLE [dbo].[Users] DROP CONSTRAINT CK__Users__Role__38996AB5;


--Thay đổi thành nvarchar
-- HouseholdMembers
ALTER TABLE [dbo].[HouseholdMembers] ALTER COLUMN [Relationship] NVARCHAR(50) NOT NULL;

-- Households
ALTER TABLE [dbo].[Households] ALTER COLUMN [Address] NVARCHAR(MAX) NOT NULL;

-- Logs
ALTER TABLE [dbo].[Logs] ALTER COLUMN [Action] NVARCHAR(100) NOT NULL;

-- Notifications
ALTER TABLE [dbo].[Notifications] ALTER COLUMN [Message] NVARCHAR(MAX) NOT NULL;

-- Registrations
ALTER TABLE [dbo].[Registrations] ALTER COLUMN [RegistrationType] NVARCHAR(20) NOT NULL;
ALTER TABLE [dbo].[Registrations] ALTER COLUMN [Status] NVARCHAR(10) NULL;
ALTER TABLE [dbo].[Registrations] ALTER COLUMN [Comments] NVARCHAR(MAX) NULL;
ALTER TABLE [dbo].[Registrations] ALTER COLUMN [Address] NVARCHAR(MAX) NOT NULL;
ALTER TABLE [dbo].[Registrations] ALTER COLUMN [DocumentPath] NVARCHAR(MAX) NULL;

-- Users
ALTER TABLE [dbo].[Users] ALTER COLUMN [FullName] NVARCHAR(100) NOT NULL;
ALTER TABLE [dbo].[Users] ALTER COLUMN [Email] NVARCHAR(100) NOT NULL;
ALTER TABLE [dbo].[Users] ALTER COLUMN [Password] NVARCHAR(255) NOT NULL;
ALTER TABLE [dbo].[Users] ALTER COLUMN [Role] NVARCHAR(20) NOT NULL;
ALTER TABLE [dbo].[Users] ALTER COLUMN [Address] NVARCHAR(MAX) NOT NULL;


-- Thêm lại CHECK CONSTRAINT trên RegistrationType và Status
ALTER TABLE [dbo].[Registrations] ADD CONSTRAINT CK_RegistrationType CHECK ([RegistrationType] IN ('TemporaryStay', 'Temporary', 'Permanent'));
ALTER TABLE [dbo].[Registrations] ADD CONSTRAINT CK_Status CHECK ([Status] IN ('Pending', 'Approved', 'Rejected'));

-- Thêm lại UNIQUE CONSTRAINT trên Email
ALTER TABLE [dbo].[Users] ADD CONSTRAINT UQ_Email UNIQUE ([Email]);

-- Thêm lại CHECK CONSTRAINT trên Role
ALTER TABLE [dbo].[Users] ADD CONSTRAINT CK_UserRole CHECK ([Role] IN ('Police', 'AreaLeader', 'Citizen', 'Admin'));

--Thêm HouseholdSeparation vào loại đăng ký
ALTER TABLE [dbo].[Registrations]  
DROP CONSTRAINT CK_RegistrationType;  

ALTER TABLE [dbo].[Registrations]  
ADD CONSTRAINT CK_RegistrationType  
CHECK (RegistrationType IN ('Permanent', 'Temporary', 'TemporaryStay', 'HouseholdSeparation'));

ALTER TABLE Users
ADD CONSTRAINT CHK_Role CHECK (Role IN ('Citizen', 'AreaLeader', 'Police', 'Admin'));
--Thêm một tài khoản admin
ALTER TABLE [dbo].[Users] DROP CONSTRAINT CK_UserRole;
ALTER TABLE [dbo].[Users] ADD CONSTRAINT CK_UserRole CHECK ([Role] IN ('Police', 'AreaLeader', 'Citizen', 'Admin'));
INSERT INTO Users (FullName, Email, Password, Role, Address) VALUES ('Nguyễn Quang Vinh', 'vinhnqhe194181@gmail.com', '123', 'Admin', 'Cửa Lò, Nghệ An');
