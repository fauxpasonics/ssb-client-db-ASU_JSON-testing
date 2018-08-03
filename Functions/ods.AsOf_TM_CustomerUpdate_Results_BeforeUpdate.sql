SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
-- Get the status of your table 20 minutes ago...
DECLARE @AsOfDate DATETIME = (SELECT [etl].[ConvertToLocalTime](DATEADD(MINUTE,-20,GETDATE())))
SELECT * FROM [ods].[AsOf_TM_CustomerUpdate_Results_BeforeUpdate] (@AsOfDate)
*/

CREATE FUNCTION [ods].[AsOf_TM_CustomerUpdate_Results_BeforeUpdate] (@AsOfDate DATETIME)

RETURNS @Results TABLE
(
[multi_query_value_for_audit] [nvarchar](100) NULL,
[AccountId] [nvarchar](25) NULL,
[cust_name_id] [nvarchar](25) NULL,
[other_info_3] [nvarchar](25) NULL,
[other_info_8] [nvarchar](25) NULL,
[other_info_2] [nvarchar](25) NULL,
[other_info_6] [nvarchar](100) NULL,
[logon_attempts] [int] NULL,
[other_info_5] [nvarchar](25) NULL,
[other_info_4] [nvarchar](25) NULL,
[other_info_1] [nvarchar](25) NULL,
[account_id_list] [nvarchar](25) NULL,
[other_info_7] [nvarchar](25) NULL,
[rec_status] [nvarchar](25) NULL,
[name_first] [nvarchar](100) NULL,
[acct_id] [nvarchar](25) NULL,
[text_on_mobile_phone] [nvarchar](25) NULL,
[email] [nvarchar](100) NULL,
[phone_eve] [nvarchar](25) NULL,
[street_addr_2] [nvarchar](200) NULL,
[street_addr_1] [nvarchar](200) NULL,
[honorary_donor] [nvarchar](25) NULL,
[country] [nvarchar](25) NULL,
[add_date] [date] NULL,
[acct_access_level] [nvarchar](25) NULL,
[city] [nvarchar](100) NULL,
[state] [nvarchar](25) NULL,
[qualified_donation_amount] [nvarchar](25) NULL,
[phone_eve_do_not_solicit] [nvarchar](25) NULL,
[points_ITD] [decimal](18, 2) NULL,
[name_type] [nvarchar](25) NULL,
[phone_day] [nvarchar](25) NULL,
[zip] [nvarchar](25) NULL,
[email_deliv_opt] [nvarchar](25) NULL,
[points_YTD] [decimal](18, 2) NULL,
[acct_type] [nvarchar](50) NULL,
[email_optout] [nvarchar](25) NULL,
[owner_name] [nvarchar](100) NULL,
[phone_day_do_not_solicit] [nvarchar](25) NULL,
[name_last] [nvarchar](100) NULL,
[title] [nvarchar](100) NULL,
[total_donation_amount] [decimal](18, 2) NULL,
[ITD_donations] [decimal](18, 2) NULL,
[ETL_CreatedOn] [datetime] NOT NULL,
[ETL_CreatedBy] NVARCHAR(400) NOT NULL,
[ETL_UpdatedOn] [datetime] NOT NULL,
[ETL_UpdatedBy] NVARCHAR(400) NOT NULL
)

AS
BEGIN

DECLARE @EndDate DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS datetime2(0))))
SET @AsOfDate = (SELECT CAST(@AsOfDate AS datetime2(0)))

INSERT INTO @Results
SELECT [multi_query_value_for_audit],[AccountId],[cust_name_id],[other_info_3],[other_info_8],[other_info_2],[other_info_6],[logon_attempts],[other_info_5],[other_info_4],[other_info_1],[account_id_list],[other_info_7],[rec_status],[name_first],[acct_id],[text_on_mobile_phone],[email],[phone_eve],[street_addr_2],[street_addr_1],[honorary_donor],[country],[add_date],[acct_access_level],[city],[state],[qualified_donation_amount],[phone_eve_do_not_solicit],[points_ITD],[name_type],[phone_day],[zip],[email_deliv_opt],[points_YTD],[acct_type],[email_optout],[owner_name],[phone_day_do_not_solicit],[name_last],[title],[total_donation_amount],[ITD_donations],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy]
FROM
	(
	SELECT [multi_query_value_for_audit],[AccountId],[cust_name_id],[other_info_3],[other_info_8],[other_info_2],[other_info_6],[logon_attempts],[other_info_5],[other_info_4],[other_info_1],[account_id_list],[other_info_7],[rec_status],[name_first],[acct_id],[text_on_mobile_phone],[email],[phone_eve],[street_addr_2],[street_addr_1],[honorary_donor],[country],[add_date],[acct_access_level],[city],[state],[qualified_donation_amount],[phone_eve_do_not_solicit],[points_ITD],[name_type],[phone_day],[zip],[email_deliv_opt],[points_YTD],[acct_type],[email_optout],[owner_name],[phone_day_do_not_solicit],[name_last],[title],[total_donation_amount],[ITD_donations],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],@EndDate [RecordEndDate]
	FROM [ods].[TM_CustomerUpdate_Results_BeforeUpdate] t
	UNION ALL
	SELECT [multi_query_value_for_audit],[AccountId],[cust_name_id],[other_info_3],[other_info_8],[other_info_2],[other_info_6],[logon_attempts],[other_info_5],[other_info_4],[other_info_1],[account_id_list],[other_info_7],[rec_status],[name_first],[acct_id],[text_on_mobile_phone],[email],[phone_eve],[street_addr_2],[street_addr_1],[honorary_donor],[country],[add_date],[acct_access_level],[city],[state],[qualified_donation_amount],[phone_eve_do_not_solicit],[points_ITD],[name_type],[phone_day],[zip],[email_deliv_opt],[points_YTD],[acct_type],[email_optout],[owner_name],[phone_day_do_not_solicit],[name_last],[title],[total_donation_amount],[ITD_donations],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate]
	FROM [ods].[Snapshot_TM_CustomerUpdate_Results_BeforeUpdate]
	) a
WHERE
	@AsOfDate BETWEEN [ETL_UpdatedOn] AND [RecordEndDate]
	AND [ETL_CreatedOn] <= @AsOfDate

RETURN

END

GO
