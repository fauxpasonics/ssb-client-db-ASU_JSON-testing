SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[TM_CustomerUpdate_Results_BeforeUpdate]
AS

SELECT DISTINCT
	convert(nvarchar (100),[ETL__multi_query_value_for_audit]) [multi_query_value_for_audit_K]
	,CONVERT(NVARCHAR(25),[AccountId]) [AccountId_K]
	,CONVERT(NVARCHAR(25),[BeforeUpdate_cust_name_id]) [cust_name_id]
	,CONVERT(NVARCHAR(25),[BeforeUpdate_other_info_3]) [other_info_3]
	,CONVERT(NVARCHAR(25),[BeforeUpdate_other_info_8]) [other_info_8]
	,CONVERT(NVARCHAR(25),[BeforeUpdate_other_info_2]) [other_info_2]
	,CONVERT(NVARCHAR(100),[BeforeUpdate_other_info_6]) [other_info_6]
	,CONVERT(int,[BeforeUpdate_logon_attempts]) [logon_attempts]
	,CONVERT(NVARCHAR(25),[BeforeUpdate_other_info_5]) [other_info_5]
	,CONVERT(NVARCHAR(25),[BeforeUpdate_other_info_4]) [other_info_4]
	,CONVERT(NVARCHAR(25),[BeforeUpdate_other_info_1]) [other_info_1]
	,CONVERT(NVARCHAR(25),[BeforeUpdate_account_id_list]) [account_id_list]
	,CONVERT(NVARCHAR(25),[BeforeUpdate_other_info_7]) [other_info_7]
	,CONVERT(NVARCHAR(25),[BeforeUpdate_rec_status]) [rec_status]
	,CONVERT(NVARCHAR(100),[BeforeUpdate_name_first]) [name_first]
	,CONVERT(NVARCHAR(25),[BeforeUpdate_acct_id]) [acct_id]
	,CONVERT(NVARCHAR(25),[BeforeUpdate_text_on_mobile_phone]) [text_on_mobile_phone]
	,CONVERT(NVARCHAR(100),[BeforeUpdate_email]) [email]
	,CONVERT(NVARCHAR(25),[BeforeUpdate_phone_eve]) [phone_eve]
	,CONVERT(NVARCHAR(200),[BeforeUpdate_street_addr_2]) [street_addr_2]
	,CONVERT(NVARCHAR(200),[BeforeUpdate_street_addr_1]) [street_addr_1]
	,CONVERT(NVARCHAR(25),[BeforeUpdate_honorary_donor]) [honorary_donor]
	,CONVERT(NVARCHAR(25),[BeforeUpdate_country]) [country]
	,CONVERT(date,[BeforeUpdate_add_date]) [add_date]
	,CONVERT(NVARCHAR(25),[BeforeUpdate_acct_access_level]) [acct_access_level]
	,CONVERT(NVARCHAR(100),[BeforeUpdate_city]) [city]
	,CONVERT(NVARCHAR(25),[BeforeUpdate_state]) [state]
	,CONVERT(NVARCHAR(25),[BeforeUpdate_qualified_donation_amount]) [qualified_donation_amount]
	,CONVERT(NVARCHAR(25),[BeforeUpdate_phone_eve_do_not_solicit]) [phone_eve_do_not_solicit]
	,CONVERT(decimal(18,2),[BeforeUpdate_points_ITD]) [points_ITD]
	,CONVERT(NVARCHAR(25),[BeforeUpdate_name_type]) [name_type]
	,CONVERT(NVARCHAR(25),[BeforeUpdate_phone_day]) [phone_day]
	,CONVERT(NVARCHAR(25),[BeforeUpdate_zip]) [zip]
	,CONVERT(NVARCHAR(25),[BeforeUpdate_email_deliv_opt]) [email_deliv_opt]
	,CONVERT(decimal(18,2),[BeforeUpdate_points_YTD]) [points_YTD]
	,CONVERT(NVARCHAR(50),[BeforeUpdate_acct_type]) [acct_type]
	,CONVERT(NVARCHAR(25),[BeforeUpdate_email_optout]) [email_optout]
	,CONVERT(NVARCHAR(100),[BeforeUpdate_owner_name]) [owner_name]
	,CONVERT(NVARCHAR(25),[BeforeUpdate_phone_day_do_not_solicit]) [phone_day_do_not_solicit]
	,CONVERT(NVARCHAR(100),[BeforeUpdate_name_last]) [name_last]
	,CONVERT(NVARCHAR(100),[BeforeUpdate_title]) [title]
	,CONVERT(decimal(18,2),[BeforeUpdate_total_donation_amount]) [total_donation_amount]
	,CONVERT(decimal(18,2),[BeforeUpdate_ITD_donations]) [ITD_donations]
FROM [src].[TM_CustomerUpdate_Results] WITH (NOLOCK)
where [BeforeUpdate_acct_id] is not null
GO
