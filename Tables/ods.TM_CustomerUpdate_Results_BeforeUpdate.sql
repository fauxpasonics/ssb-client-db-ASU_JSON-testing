CREATE TABLE [ods].[TM_CustomerUpdate_Results_BeforeUpdate]
(
[multi_query_value_for_audit] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AccountId] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[cust_name_id] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[other_info_3] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[other_info_8] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[other_info_2] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[other_info_6] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[logon_attempts] [int] NULL,
[other_info_5] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[other_info_4] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[other_info_1] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[account_id_list] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[other_info_7] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[rec_status] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name_first] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[acct_id] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[text_on_mobile_phone] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[email] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[phone_eve] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[street_addr_2] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[street_addr_1] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[honorary_donor] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[country] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[add_date] [date] NULL,
[acct_access_level] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[city] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[state] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[qualified_donation_amount] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[phone_eve_do_not_solicit] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[points_ITD] [decimal] (18, 2) NULL,
[name_type] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[phone_day] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[zip] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[email_deliv_opt] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[points_YTD] [decimal] (18, 2) NULL,
[acct_type] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[email_optout] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[owner_name] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[phone_day_do_not_solicit] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name_last] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[title] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[total_donation_amount] [decimal] (18, 2) NULL,
[ITD_donations] [decimal] (18, 2) NULL,
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__TM_Custom__ETL_C__2EDAF651] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__TM_Custom__ETL_C__2FCF1A8A] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__TM_Custom__ETL_U__30C33EC3] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__TM_Custom__ETL_U__31B762FC] DEFAULT (suser_sname())
)
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

----------- CREATE TRIGGER -----------
CREATE TRIGGER [ods].[Snapshot_TM_CustomerUpdate_Results_BeforeUpdateUpdate] ON [ods].[TM_CustomerUpdate_Results_BeforeUpdate]
AFTER UPDATE, DELETE

AS
BEGIN

DECLARE @ETL_UpdatedOn DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS DATETIME2(0))))
DECLARE @ETL_UpdatedBy NVARCHAR(400) = (SELECT SYSTEM_USER)

UPDATE t SET
[ETL_UpdatedOn] = @ETL_UpdatedOn
,[ETL_UpdatedBy] = @ETL_UpdatedBy
FROM [ods].[TM_CustomerUpdate_Results_BeforeUpdate] t
	JOIN inserted i ON  t.[multi_query_value_for_audit] = i.[multi_query_value_for_audit] AND t.[AccountId] = i.[AccountId]

INSERT INTO [ods].[Snapshot_TM_CustomerUpdate_Results_BeforeUpdate] ([multi_query_value_for_audit],[AccountId],[cust_name_id],[other_info_3],[other_info_8],[other_info_2],[other_info_6],[logon_attempts],[other_info_5],[other_info_4],[other_info_1],[account_id_list],[other_info_7],[rec_status],[name_first],[acct_id],[text_on_mobile_phone],[email],[phone_eve],[street_addr_2],[street_addr_1],[honorary_donor],[country],[add_date],[acct_access_level],[city],[state],[qualified_donation_amount],[phone_eve_do_not_solicit],[points_ITD],[name_type],[phone_day],[zip],[email_deliv_opt],[points_YTD],[acct_type],[email_optout],[owner_name],[phone_day_do_not_solicit],[name_last],[title],[total_donation_amount],[ITD_donations],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate])
SELECT a.*,dateadd(s,-1,@ETL_UpdatedOn)
FROM deleted a

END

GO
ALTER TABLE [ods].[TM_CustomerUpdate_Results_BeforeUpdate] ADD CONSTRAINT [PK__TM_Custo__0658F9496CA56031] PRIMARY KEY CLUSTERED  ([multi_query_value_for_audit], [AccountId])
GO
