create or replace package Etl_Dm_Load is

  -- Author  : SHERB
  -- Created : 31.03.2020 10:42:56
  -- Purpose : Load dim and Fact Tables
-- Специальные характеристики счетов
c_Sa_Coor_Acc           constant number(2) := 1; -- Корреспондентский счет
c_Sa_Coor_Acc_Va        constant number(3) := 1; -- Валютный коррсчет по дебету
c_Sa_Coor_Acc_Vp        constant number(3) := 122; -- Валютный коррсчет по кредиту
Procedure Write_Log
  (     
    i_Module_Name varchar2 default null,    
    i_Log_Type    varchar2,
    i_Text        varchar2 default null,
    i_table_name  varchar2 default null,
    i_filial_code varchar2 default null,    
    i_log_id      in out number,
    i_error_txt   varchar2 default null,
    i_oper_day    date default etl_kernel.Get_Etl_Day
  ) ;
--
Function Get_Operday return date;
--
Procedure Load_Dm_S_System;
--
Procedure Load_Dm_S_Task;
--
Procedure Load_Dm_S_Oked ;
--
Procedure Load_Dm_S_Client_Type;
--
Procedure Load_Dm_S_Subject_Type ;
--
Procedure Load_Dm_S_Client_Condition;
--
Procedure Load_Dm_S_Country ;
--
Procedure Load_Dm_S_Tax_Organization;
--
Procedure Load_Dm_S_Form_Property ;
--
Procedure Load_Dm_S_District;
--
Procedure Load_Dm_S_Region ;
--
Procedure Load_Dm_S_Bank_Corr;
--
Procedure Load_Dm_S_Verifying_Document_Type;
--
Procedure Load_Dm_S_Work_Capacity;
--
Procedure Load_Dm_S_Subject_Sexual_Identity;
--
Procedure Load_Dm_S_Client_Reason;
--
Procedure Load_Dm_S_Sector;
--
Procedure Load_Dm_S_Organ_Direct;
--
Procedure Load_Dm_S_Place_Registration;
--
Procedure Load_Dm_S_Organization_Legal_Form;
--
Procedure Load_Dm_Sv_S_Objects;
--
Procedure Load_Dm_Sv_S_Transact_Types;
--
procedure Load_Dm_Sv_S_Transact_Oper_Types;
--
procedure Load_Dm_Sv_S_Accounts_Types;
--
procedure Load_Dm_Sv_S_Operations;
--
Procedure Load_Dm_Sv_S_Objects_States;
--
procedure Load_Dm_Vl_S_Lead_Type;
--
Procedure Load_Dm_Vl_S_Lead_Action;
--
Procedure Load_Dm_Vl_S_Lead_State;
--
Procedure Load_Dm_Bt_S_Tbl_App_Status;
--
Procedure Load_Dm_S_Bank ;
--
Procedure Load_Dm_S_Transhacc ;
--
Procedure Load_Dm_S_Currency_Operations;
--
Procedure Load_Dm_S_Partner_Statuses;
--
Procedure Load_Dm_Gl_S_File_Transact_Types;
--
Procedure Load_Dm_Gl_S_Objects_State;
--
Procedure Load_Dm_Hr_S_Emp_Conditions;
--
Procedure Load_Dm_Hr_S_Posts;
--
Procedure Load_Dm_Hr_S_Departments;
--
Procedure Load_Dm_S_Doclead_Action;
--
Procedure Load_Dm_S_Doclead_State;
--
Procedure Load_Dm_S_Transaction;
--
Procedure Load_Dm_Ln_S_Loan_Type_Account;
--
Procedure Load_Dm_Ln_S_Lead_Templates;
--
Procedure Load_Dm_Ln_S_Loan_Status;
--
Procedure Load_Dm_Ln_S_Sign_Delivery;
--
Procedure Load_Dm_Ln_S_Claim_Type;
--
Procedure Load_Dm_Ln_S_Credit_Type;
--
Procedure Load_Dm_Ln_S_Form_Red;
--
Procedure Load_Dm_Ln_S_Loan_Type_Term;
--
Procedure Load_Dm_Ln_S_Purpose_Cipher;
--
Procedure Load_Dm_Ln_S_Cr_Cl_Guarant;
--
Procedure Load_Dm_Ln_S_Credit_Source;
--
Procedure Load_Dm_Ln_S_Class_Credit;
--
Procedure Load_Dm_Ln_S_Credit_Class_Quality;
--
Procedure Load_Dm_Ln_S_Object_Leasing;
--
Procedure Load_Dm_Cm_S_Criterion;
--
Procedure Load_Dm_Cm_S_Offshores;
--
Procedure Load_Dm_Cm_S_Country;
--
Procedure Load_Dm_Tet_S_Account_Types;
--
Procedure Load_Dm_Tet_S_Contract_Types;
--
Procedure Load_Dm_Tet_S_Card_Product_Codes;
--
Procedure Load_Dm_Sl_S_Calc_States;
--
Procedure Load_Dm_S_Coa;
--
Procedure Load_Dm_Sl_S_Cs_Lead_States;
--
Procedure Load_Dm_Aa_S_Doc_Type;
--
Procedure Load_Dm_Cf_S_Card_State;
--
Procedure Load_Dm_Cf_S_Source_Tasks;
--
Procedure Load_Dm_Stg_S_States ;
--
Procedure Load_Dm_Cf_S_Card_Transactions;
--
Procedure Load_Dm_Stg_S_Doc_Type;
--
function Get_Idnc (i_lead_id number) return number;
--
Function Get_Oked(i_client_id number) return varchar2;
--
Function Get_Unique_Special_Account_Id
  (
    i_Filial_Code   ibs.Special_Accounts.Filial_Code%type,
    i_Code_Special  ibs.Special_Accounts.Code_Special%type, 
    i_Currency_Code ibs.Special_Accounts.Code_Currency%type, 
    i_For_Filial    ibs.Special_Accounts.For_Filial%type    
  ) return ibs.Special_Accounts.Acc_Id%type;
---
Function Get_Loro_Acc_ID(
	  i_Filial_Code   ibs.Special_Accounts.Filial_Code%type,
    i_Currency_Code ibs.Special_Accounts.Code_Currency%type, 
    i_Sign_Dc       varchar2 := 'D', 
    i_Raise_Except  varchar2 := 'N',  
    i_Corr_Filial   varchar2 := null
)  return ibs.Special_Accounts.Acc_Id%type;
---
Function Get_Loro_Account_ID (
    i_Filial_Code    ibs.SPECIAL_ACCOUNTS.Filial_Code%Type,    
    i_Currency_Code  ibs.SPECIAL_ACCOUNTS.Code_Currency%Type,  
    i_Sign_DC        Varchar2 := 'D'                       
  )
  Return ibs.SPECIAL_ACCOUNTS.Acc_ID%type RESULT_CACHE;
--
Procedure Fill_Dm_Leads;
--
Procedure Fill_Dm_Core_Accounts;
--
Procedure Fill_Dm_Core_Clients ;
--
Procedure Fill_Dm_Tet_Card_Transacts ;
--
Procedure Fill_Dm_Sv_Transacts ;
--
Procedure Fill_Dm_Sv_Acc_Bals;
--
Procedure Fill_Dm_Vl_Leads;
--
Procedure Fill_Dm_Munis_Payments;
--
Procedure Fill_Dm_Munis_Receive_Pays;
--
Procedure Fill_Dm_Bt_Applications;
--
Procedure Fill_Dm_Bt_Messages;
--
Procedure Fill_Dm_Sw_Msgfields;
--
Procedure Fill_Dm_Mr_Deals ;
--
Procedure Fill_Dm_Ib_Mobile_Pays ;
--
Procedure Fill_Dm_Ib_Transacts ;
--
Procedure Fill_Dm_Gl_Card_Transacts;
--
Procedure Fill_Dm_Gl_Term_Transacts ;
--
Procedure Fill_Dm_Hr_Emps ;
--
Procedure Fill_Dm_Ln_Cards;
--
Procedure Fill_Dm_Ln_Graph_Debt;
--
Procedure Fill_Dm_Ln_Leads;
--
Procedure Fill_Dm_Ib_Gate_Conv_Transacts;
--
Procedure Fill_Dm_Sl_Calcs;
--
Procedure Fill_Dm_Sl_Cs_Details;
--
Procedure Fill_Dm_Sl_Cs_Leads;
--
Procedure Fill_Dm_Munis_P2P;
--
Procedure Fill_Dm_Cm_Clients_Risks;
--
Procedure Fill_Dm_Tet_Card_Sys_Refs;
--
Procedure Fill_Dm_Tet_Accounts;
--
Procedure Fill_Dm_Tax_Land;
--
Procedure Fill_Dm_Tax_Doc_Data;
--
Procedure Fill_Dm_Tax_Lands_Data;
--
Procedure Fill_Dm_Core_Coa_Saldos;
--
Procedure Fill_Dm_Core_Transacts;
--
Procedure Fill_Dm_Core_Acs_Saldos;

--
Procedure Load_Dm_Dim_tables;
--
Procedure Test ;
--
Procedure Load_Dm_Fact_Tables;
--
Procedure Load_Dm_Dims;
--
procedure Load_Dm_Facts;
end Etl_Dm_Load;
/
create or replace package body Etl_Dm_Load is

--
c_Git_Id constant varchar2(300) := '$Format: %H %s %b %ci by %cN, file %f author %aN$';
--
Procedure Write_Log
  (     
    i_Module_Name varchar2 default null,    
    i_Log_Type    varchar2,
    i_Text        varchar2 default null,
    i_table_name  varchar2 default null,
    i_filial_code varchar2 default null,    
    i_log_id      in out number,
    i_error_txt   varchar2 default null,
    i_oper_day    date default etl_kernel.Get_Etl_Day
  ) as
    pragma autonomous_transaction;
  begin
   if(i_Log_Type = 'N') then
    i_log_id := Etl_Log_Sq.Nextval;
    insert into Etl_Log
      (Log_Id,
       Module_Name,
       Log_Type,
       Text,
       Date_Action,
       Table_Name,
       Filial_Code,
       Oper_Day,
       Start_Ts)
    values
      (i_Log_Id,
       Upper(i_Module_Name),
       i_Log_Type,
       i_Text,
       sysdate,
       i_Table_Name,
       i_Filial_Code,
       i_Oper_Day,
       sysdate);
   elsif(i_Log_Type ='F') then
       update Etl_Log t
          set t.End_Ts   = sysdate,
              t.Log_Type = i_Log_Type,
              t.Text     = i_Text
        where t.Log_Id = i_Log_Id;
   elsif(i_log_type = 'E') then 
       if(i_log_id is null) then
        insert into Etl_Log
          (Log_Id,
           Module_Name,
           Log_Type,
           Text,
           Date_Action,
           Table_Name,
           Filial_Code,
           Oper_Day,
           Start_Ts,
           End_Ts,
           Error_Text)
        values
          (Etl_Log_Sq.Nextval,
           Upper(i_Module_Name),
           i_Log_Type,
           i_Text,
           sysdate,
           i_Table_Name,
           i_Filial_Code,
           i_Oper_Day,
           sysdate,
           sysdate,
           i_Error_Txt);
      else       
       update Etl_Log t
          set t.End_Ts     = sysdate,
              t.Error_Text = i_Error_Txt,
              t.Log_Type   = i_Log_Type,
              t.Text       = null
        where t.Log_Id = i_Log_Id;
      end if;
   end if;
   commit;
  
  end Write_Log;
	------
Function Get_Operday return date is
    v_Operday date;
  begin
    begin
      select max(d.Oper_Day) --index_desc ayrim paytlar hato qiymat beryapti
        into v_Operday
        from ibs.Day_Operational d;
    end;
  
    return v_Operday;
  end;

Procedure Load_Dm_S_System
	is 
begin
	delete from DM_S_System;
	--
	insert into Dm_S_System
	select 
	     trim(Code),
       trim(Code_Parent),
       Full_Access,
       Start_Allow,
       State,
       Substr(get_nls_name(dwh_setup.nls_index,cast(name as s_nsi_nvt)), 1, 100) ,
       Version,
       Date_Version,
       Order_Number
  from ibs.s_System;
	commit;
end Load_Dm_S_System;
--
Procedure Load_Dm_S_Task
	is
begin
	delete from Dm_S_Task;
	--
	insert into Dm_S_Task
	select 
	    trim(code), 
			Substr(get_nls_name(dwh_setup.nls_index,cast(name as s_nsi_nvt)), 1, 100), 
			subsystem_code, 
			parent_code, 
			condition, 
			visibility, 
			category

	
	from ibs.s_Task;
	commit;
end Load_Dm_S_Task;
--
Procedure Load_Dm_S_Oked 
	is 
begin
	delete from Dm_S_Oked;
	insert into Dm_S_Oked
	select Section_Gr,
       Section_Sy Section_Sy,
       trim(Sg_Namer) Sg_Namer,
       trim(Sg_Nameu) Sg_Nameu,
       Section_Code Section_Code,
       trim(s_Namer) s_Namer,
       trim(s_Nameu) s_Nameu,
       Group_Code Group_Code,
       trim(Gr_Namer) Gr_Namer,
       trim(Gr_Nameu) Gr_Nameu,
       Class_Code Class_Code,
       trim(Cl_Namer) Cl_Namer,
       trim(Cl_Nameu) Cl_Nameu,
       Code Code,
       trim(Namer) Namer,
       trim(Nameu) Nameu,
       Date_Activ,
       Date_Deact,
       DECODE(trim(Condition),'A','A','Z','P',TRIM(CONDITION)) Condition,
       Ref_UID,
			 Date_Apply,
			 Date_Cancel,
			 version_id,
			 Modified_On ,
			 null
 from ibs.Ref_Oked
 where Date_Apply <= dwh_setup.operday
   and Date_Cancel > dwh_setup.operday; 
 commit;	
	
end Load_Dm_S_Oked;
--
Procedure Load_Dm_S_Subject_Type 
	is 
begin
	delete from Dm_S_Subject_Type;
	insert into Dm_S_Subject_Type 
	select 
			trim(Code), 
			name, 
			date_activ, 
			date_deact, 
			condition, 
			ref_uid, 
			date_apply, 
			date_cancel, 
			version_id, 
			modified_on, 
			name_uz	
	from ibs.Ref_Subject_Type
 where Date_Apply <= dwh_setup.operday
   and Date_Cancel > dwh_setup.operday;
 commit;	
end Load_Dm_S_Subject_Type;
--
Procedure Load_Dm_S_Client_Condition
	is
begin
	delete from Dm_S_Client_Condition;
	insert into Dm_S_Client_Condition
	select 
	     code ,
			 name 
	from ibs.s_client_condition;
	commit;

end Load_Dm_S_Client_Condition;
Procedure Load_Dm_S_Client_Type
	is 
begin
	delete from Dm_S_Client_Type;
	insert into Dm_S_Client_Type
	select 
		t.code,
		get_nls_name(dwh_setup.nls_index,cast(t.name as s_nsi_nvt))
	from ibs.s_client_Type t;
 commit;
end Load_Dm_S_Client_Type;
--
Procedure Load_Dm_S_Country 
	is 
begin
	delete from Dm_S_Country;
	insert into Dm_S_Country 
	select 
	    trim(Code), 
			trim(Char_Code), 
			trim(Char_Ext_Code), 
			name, 
			trim(Currency_Code), 
			in_sng, 
			date_activ, 
			date_deact, 
			condition, 
			ref_uid, 
			date_apply, 
			date_cancel, 
			version_id, 
			modified_on, 
			null --get_nls_name(dwh_setup.nls_index,cast(label as s_Nsi_Nvt))
 from ibs.Ref_Country
 where Date_Apply <= dwh_setup.operday
   and Date_Cancel > dwh_setup.operday;
 commit;

end Load_Dm_S_Country;
--
Procedure Load_Dm_S_Tax_Organization
	is
begin
	delete from Dm_S_Tax_Organization;
	insert into Dm_S_Tax_Organization
	select 
	    trim(Code), 
			name, 
			date_activ, 
			date_deact, 
			condition, 
			ref_uid, 
			date_apply, 
			date_cancel, 
			version_id, 
			modified_on, 
			null --get_nls_name(dwh_setup.nls_index,cast(label as s_nsi_nvt))
	from ibs.Ref_Tax_Organization
 where Date_Apply <= dwh_setup.operday
   and Date_Cancel > dwh_setup.operday;
 commit;
end Load_Dm_S_Tax_Organization;
--
Procedure Load_Dm_S_Form_Property 
	is
begin
	delete from Dm_S_Form_Property;
	insert into Dm_S_Form_Property
	select 
     	trim(Code), 
			name, 
			date_activ, 
			date_deact, 
			trim(Active), 
			condition, 
			ref_uid, 
			date_apply, 
			date_cancel, 
			version_id, 
			modified_on, 
			get_nls_name(dwh_setup.nls_index, cast(label as s_nsi_nvt))

	from ibs.Ref_Form_Property
 where Date_Apply <= dwh_setup.operday
   and Date_Cancel > dwh_setup.operday
;
commit;
end Load_Dm_S_Form_Property;
--
Procedure Load_Dm_S_District
	is 
begin
	delete from Dm_S_District;
	insert into Dm_S_District
	select 
			trim(Code), 
			name, 
			trim(Region_Code), 
			date_activ, 
			date_deact, 
			condition, 
			ref_uid, 
			date_apply, 
			date_cancel, 
			version_id, 
			modified_on, 
			null-- get_nls_name(dwh_setup.nls_index, cast(label as s_nsi_nvt))
	from ibs.Ref_District
 where Date_Apply <= dwh_setup.operday
   and Date_Cancel > dwh_setup.operday;
 commit;
end Load_Dm_S_District;
--
Procedure Load_Dm_S_Region 
	is
begin
	delete from Dm_S_Region;
	insert into Dm_S_Region
	select 
			trim(Code), 
			name, 
			order_rep, 
			date_activ, 
			date_deact, 
			condition, 
			ref_uid, 
			date_apply, 
			date_cancel, 
			version_id, 
			modified_on, 
			get_nls_name(dwh_setup.nls_index, cast(label as s_nsi_nvt))
	from ibs.Ref_Region
 where Date_Apply <= dwh_setup.operday
   and Date_Cancel > dwh_setup.operday;
 commit;
end Load_Dm_S_Region;
--
Procedure Load_Dm_S_Bank_Corr
	is
begin
	delete from Dm_S_Bank_Corr;
	insert into Dm_S_Bank_Corr
	select 
			trim(Code), 
			trim(Swift_Code), 
			name, 
			trim(Country_Code), 
			date_activ, 
			date_deact, 
			trim(Condition), 
			ref_uid, 
			null, --get_nls_name(dwh_setup.nls_index, cast(label as s_nsi_nvt)),
			date_apply, 
			date_cancel, 
			version_id, 
			modified_on
	from ibs.Ref_Bank_Corr
 where Date_Apply <= dwh_setup.operday
   and Date_Cancel > dwh_setup.operday;
 commit;
end Load_Dm_S_Bank_Corr;
--
Procedure Load_Dm_S_Verifying_Document_Type
	is
begin
	delete from Dm_S_Verifying_Document_Type;
	insert into Dm_S_Verifying_Document_Type
	select 
			trim(Code), 
			name, 
			date_activ, 
			date_deact, 
			condition, 
			ref_uid, 
			date_apply, 
			date_cancel, 
			version_id, 
			modified_on, 
			get_nls_name(dwh_setup.nls_index, cast(label as s_nsi_nvt))

	from ibs.Ref_Verifying_Document_Type
 where Date_Apply <= dwh_setup.operday
   and Date_Cancel > dwh_setup.operday;
 commit;
end Load_Dm_S_Verifying_Document_Type;
--
Procedure Load_Dm_S_Work_Capacity 
	is 
begin
	delete from Dm_S_Work_Capacity;
	insert into Dm_S_Work_Capacity
	select 
			trim(Code), 
			name, 
			date_activ, 
			date_deact, 
			condition, 
			ref_uid, 
			date_apply, 
			date_cancel, 
			version_id, 
			modified_on, 
			get_nls_name(dwh_setup.nls_index,cast(label as s_nsi_nvt))
	from ibs.Ref_Work_Capacity
 where Date_Apply <= dwh_setup.operday
   and Date_Cancel > dwh_setup.operday;
 commit;
end Load_Dm_S_Work_Capacity;
--
Procedure Load_Dm_S_Subject_Sexual_Identity
	is
begin
	delete from Dm_S_Subject_Sexual_Identity;
	insert into Dm_S_Subject_Sexual_Identity
	select 
			trim(Code), 
			name, 
			date_activ, 
			date_deact, 
			condition, 
			ref_uid, 
			date_apply, 
			date_cancel, 
			version_id, 
			modified_on, 
			get_nls_name(dwh_setup.nls_index, cast(label as s_nsi_nvt))
	from ibs.Ref_Subject_Sexual_Identity
 where Date_Apply <= dwh_setup.operday
   and Date_Cancel > dwh_setup.operday;
 commit;
end Load_Dm_S_Subject_Sexual_Identity;
--
Procedure Load_Dm_S_Client_Reason
	is 
begin
	delete from  Dm_S_Client_Reason;
	insert into  Dm_S_Client_Reason
	select 
			code, 
			reason_name, 
			date_activ, 
			date_deact, 
			condition, 
			ref_uid, 
			date_apply, 
			date_cancel, 
			version_id, 
			modified_on, 
			get_nls_name(dwh_setup.nls_index,cast(label as s_nsi_nvt))
	from ibs.Ref_Client_Reason
 where Date_Apply <= dwh_setup.operday
   and Date_Cancel > dwh_setup.operday;
 commit;
end Load_Dm_S_Client_Reason;
--
Procedure Load_Dm_S_Sector
 is
begin
	delete from Dm_S_Sector;
	insert into Dm_S_Sector
	select
			trim(Code), 
			trim(Code_Old) , 
			trim(Kod_Class), 
			name, 
			date_activ, 
			date_deact, 
			condition, 
			ref_uid, 
			date_apply, 
			date_cancel, 
			version_id, 
			modified_on, 
			get_nls_name(dwh_setup.nls_index,cast(label as s_nsi_nvt)) 
	from ibs.Ref_Sector
 where Date_Apply <= dwh_setup.operday
   and Date_Cancel > dwh_setup.operday;
	commit;
end Load_Dm_S_Sector;
--
Procedure Load_Dm_S_Organ_Direct
	is 
begin
	delete from Dm_S_Organ_Direct;
	insert into Dm_S_Organ_Direct
	select 
			trim(Code), 
			trim(Code_Old), 
			name, 
			trim(Name_Short), 
			trim(Code_Sector_Old), 
			trim(Code_r) , 
			trim(Code_Pr), 
			trim(Code_k), 
			date_activ, 
			date_deact, 
			condition, 
			ref_uid, 
			date_apply, 
			date_cancel, 
			version_id, 
			modified_on, 
			null -- get_nls_name(dwh_setup.nls_index,cast(label as s_nsi_nvt))
	from ibs.Ref_Organ_Direct
 where Date_Apply <= dwh_setup.operday
   and Date_Cancel > dwh_setup.operday;
	commit;
end Load_Dm_S_Organ_Direct;
--
Procedure Load_Dm_S_Place_Registration
	is 
begin
	delete from Dm_S_Place_Registration;
	insert into Dm_S_Place_Registration
	select 
			code, 
			filial_code, 
			get_nls_name(dwh_setup.nls_index, cast(name as s_nsi_nvt)), 
			condition, 
			date_active, 
			date_modify
	from ibs.s_place_registration;
	commit;
	
end Load_Dm_S_Place_Registration;
--
Procedure Load_Dm_S_Organization_Legal_Form
	is
begin
  delete from Dm_S_Organization_Legal_Form;
	insert into Dm_S_Organization_Legal_Form
	Select 
			trim(Code) , 
			name, 
			date_activ, 
			date_deact, 
			condition, 
			ref_uid, 
			date_apply, 
			date_cancel, 
			version_id, 
			modified_on, 
			get_nls_name(dwh_setup.nls_index,cast(label as s_nsi_nvt))
  from ibs.Ref_Organization_Legal_Form
 where Date_Apply <= dwh_setup.operday
   and Date_Cancel > dwh_setup.operday;
 commit;
	
end Load_Dm_S_Organization_Legal_Form;
----
Procedure Load_Dm_Sv_S_Objects
	is 
begin
	delete from Dm_Sv_S_Objects;
	insert into Dm_Sv_S_Objects
	select 
	       Id
       , Get_Nls_Name(Dwh_Setup.Nls_Index_Get, cast(t.Name as s_nsi_nvt)) Name
       , Sign_System
       , t.Ord
       , t.Condition
	from ibs.sv_s_objects t;
	commit;
end Load_Dm_Sv_S_Objects;
--
Procedure Load_Dm_Sv_S_Transact_Types
	is
begin
	 delete Dm_Sv_S_Transact_Types;
	 insert into Dm_Sv_S_Transact_Types
	 select t.code
         ,Get_Nls_Name(dwh_Setup.Nls_Index_Get, cast(t.Name as s_nsi_nvt)) ,
			    ord
  from ibs.Sv_S_Transact_Types t;
	commit;
end Load_Dm_Sv_S_Transact_Types;
--
Procedure Load_Dm_Sv_S_Transact_Oper_Types
	is 
begin
	delete Dm_Sv_S_Transact_Oper_Types;
	insert into Dm_Sv_S_Transact_Oper_Types
	select 
	       t.Id
       , svfe_code
       , Get_Nls_Name(dwh_Setup.Nls_Index_Get, cast(t.Name as s_nsi_nvt)) ,
        t.Message_Type,
			   Resource_type_ID
	from ibs.Sv_S_Transact_Oper_Types t;
	commit;
end Load_Dm_Sv_S_Transact_Oper_Types;
--
Procedure Load_Dm_Sv_S_Accounts_Types
	is 
begin
	delete from DM_SV_S_ACCOUNTS_TYPES;
	insert into DM_SV_S_ACCOUNTS_TYPES
	select 
	       t.Id
       , Get_Nls_Name(dwh_Setup.Nls_Index_Get, CAST(t.Name as S_NSI_NVT))
       , t.Group_Id
			 , category_id 
			 , condition 
	from ibs.sv_s_Accounts_Types t;
	commit;
end Load_Dm_Sv_S_Accounts_Types;
--
Procedure Load_Dm_Sv_S_Operations
	is
begin
	delete from Dm_Sv_S_Operations;
	insert into Dm_Sv_S_Operations
	select 
				id, 
				code, 
				group_code, 
				name, 
				description, 
				ord, 
				visible, 
				condition, 
				is_single, 
				is_broken_exec
	from ibs.sv_s_operations t
	where t.condition = 'A';
	commit;
end Load_Dm_Sv_S_Operations;
--
Procedure Load_Dm_Sv_S_Objects_States
	is 
begin
	delete Dm_Sv_S_Objects_States;
	insert into Dm_Sv_S_Objects_States
	select 
			object_id, 
			id, 
			get_nls_name(dwh_setup.nls_index,cast(name as s_nsi_nvt)),
			visible, 
			ord, 
			condition
	from ibs.Sv_S_Objects_States;
	commit;
end Load_Dm_Sv_S_Objects_States;
--
procedure Load_Dm_Vl_S_Lead_Type
	is
begin
	delete from DM_Vl_S_Lead_Type;
	insert into Dm_Vl_S_Lead_Type
	select code,
	       name
	from ibs.vl_lead_type;
	commit;
end Load_Dm_Vl_S_Lead_Type;
--
Procedure Load_Dm_Vl_S_Lead_Action
	is
begin
	delete from Dm_Vl_S_Lead_Action;
	insert into Dm_Vl_S_Lead_Action
	select act_id,
	       name
	from ibs.vl_lead_Action;
	commit;
end Load_Dm_Vl_S_Lead_Action;
--
Procedure Load_Dm_Vl_S_Lead_State
	is
begin
	delete from Dm_Vl_S_Lead_State;
	insert into Dm_Vl_S_Lead_State
	select state_id,
	       name
	from ibs.vl_lead_state;
	commit;
end Load_Dm_Vl_S_Lead_State;
--
Procedure Load_Dm_Bt_S_Tbl_App_Status
	is
begin
	delete from Dm_Bt_S_Tbl_App_Status;
	insert into Dm_Bt_S_Tbl_App_Status
	select id,
	       name
	from ibs.bt_tbl_app_status;
	commit;
end Load_Dm_Bt_S_Tbl_App_Status;
--
Procedure Load_Dm_S_Bank 
	is
begin
	delete from Dm_S_Bank;
	insert into Dm_S_Bank
	select 
	    code, 
			bank_type_code, 
			region_code, 
			header_code, 
			union_code, 
			tcr_code, 
			rkc_code, 
			trim(name), 
			adress, 
			status_code, 
			account_type, 
			date_open, 
			date_close, 
			active, 
			email, 
			server_alias, 
			connect_type, 
			allow_currency, 
			date_activ, 
			date_deact, 
			district_code, 
			num_change_office, 
			condition, 
			ref_uid, 
			date_apply, 
			date_cancel, 
			version_id, 
			modified_on, 
			null--get_nls_name(dwh_setup.nls_index, cast(label as s_nsi_nvt))
   
	from ibs.ref_bank
	 where Date_Apply <= dwh_setup.operday
   and Date_Cancel > dwh_setup.operday;
	commit;
end Load_Dm_S_Bank;
--
Procedure Load_Dm_S_Transhacc 
	is
begin
	delete from Dm_S_Transhacc;
	insert into Dm_S_Transhacc
	select 
	    destination, 
			decode(length(t.code), 3, t.code,
                               5, decode(substr(t.code, 1, 2), '00', substr(t.code, 3), decode(substr(t.code, 1, 1), '0', substr(t.code, 2), t.code)
                                        ),
               t.code
              ), 
			trim(Code_Coa), 
			decode(destination, '0','(транш '||code_coa||' ном. '||TRANSH_NUM||')',
                            '1','(цел.сред.торг.пред.)',
                            '2','(товары народ.потреб)',
                            '3','(другие цели платежа)',
                            '4','(бюджет)',
                            '5','(кредит)',
                            '6','(доходы от бюджета)',
                            '9','(валютные операции)')||
                            ' : '||transh_name ,
        decode(destination, '0','(транш '||code_coa||' ном. '||TRANSH_NUM||')',
                            '1','(цел.сред.торг.пред.)',
                            '2','(товары народ.потреб)',
                            '3','(другие цели платежа)',
                            '4','(бюджет)',
                            '5','(кредит)',
                            '6','(доходы от бюджета)',
                            '9','(валютные операции)')||
                            ' : '||transh_name ,  
			date_activ, 
			date_deact, 
			trim(Active), 
			transh_num,
			condition, 
			ref_uid, 
			date_apply, 
			date_cancel, 
			version_id, 
			modified_on, 
			null -- get_nls_name(dwh_setup.nls_index, cast(label as s_nsi_nvt))
	from ibs.ref_transhacc t
	where Date_Apply <= dwh_setup.operday
   and Date_Cancel > dwh_setup.operday;
	commit;
end Load_Dm_S_Transhacc;
--
Procedure Load_Dm_S_Currency_Operations
	is 
begin
	delete from Dm_S_Currency_Operations;
	insert into Dm_S_Currency_Operations
	select 
				trim(Code), 
				trim(Sub_Code), 
				name, 
				date_activ, 
				date_deact, 
				trim(Condition), 
				trim(Agree_Sign), 
				ref_uid, 
				get_nls_name(dwh_setup.nls_index,cast(label as s_nsi_nvt)),
				date_apply, 
				date_cancel, 
				version_id, 
				modified_on
	from ibs.ref_currency_operations
	where Date_Apply <= dwh_setup.operday
   and Date_Cancel > dwh_setup.operday;
  commit;
end Load_Dm_S_Currency_Operations;
--
Procedure Load_Dm_S_Partner_Statuses
	is 
begin
	delete from Dm_S_Partner_Statuses;
	insert into Dm_S_Partner_Statuses
	select 
	  code, 
		name_ru, 
		name_uz, 
		date_activ, 
		date_deact, 
		condition, 
		ref_uid, 
		date_apply, 
		date_cancel, 
		version_id, 
		modified_on, 
		null --get_nls_name(dwh_setup.nls_index,cast(label as s_nsi_nvt))
	from ibs.ref_partner_statuses t
	where date_apply <= dwh_setup.operday
   and date_cancel > dwh_setup.operday;
  commit;
end Load_Dm_S_Partner_Statuses;
--
Procedure Load_Dm_Gl_S_File_Transact_Types
	is
begin
	delete from Dm_Gl_S_File_Transact_Types;
	insert into Dm_Gl_S_File_Transact_Types
	select 
	  tran_type_code, 
		tran_type_name, 
		notes
	from ibs.Gl_r_File_Transact_Types;
	commit;
end Load_Dm_Gl_S_File_Transact_Types;
--
Procedure Load_Dm_Gl_S_Objects_State
	is
begin
	delete from Dm_Gl_S_Objects_States;
	insert into Dm_Gl_S_Objects_States
	select
		object_id, 
		id, 
		get_nls_name(dwh_setup.nls_index,cast(name as s_nsi_nvt)),
		visible, 
		ord, 
		state
	from ibs.gl_r_objects_states t;
	commit;
	
end Load_Dm_Gl_S_Objects_State;
--
Procedure Load_Dm_Hr_S_Emp_Conditions
	is
begin
  delete Dm_Hr_S_Emp_Conditions;
	insert into Dm_Hr_S_Emp_Conditions
	select 
		condition, 
		condition_note, 
		condition_type, 
		ord, 
		opts
	from ibs.hr_s_emp_conditions_v;
	commit;	
end Load_Dm_Hr_S_Emp_Conditions;
--
Procedure Load_Dm_Hr_S_Posts
	is
begin
	delete Dm_Hr_S_Posts;
	insert into Dm_Hr_S_Posts
	select 
			post_id, 
			code, 
			lavel_code, 
			post_name, 
			cb_code, 
			active_flag, 
			sl_post_id, 
			created_by, 
			creation_date, 
			last_updated_by, 
			last_update_date
	from ibs.Hr_S_Posts;
	commit;
end Load_Dm_Hr_S_Posts;
--
Procedure Load_Dm_Hr_S_Departments
	is 
begin
	delete Dm_Hr_S_Departments;
	insert into Dm_Hr_S_Departments
	select 
			id, 
			code, 
			department_name, 
			created_by, 
			creation_date, 
			last_updated_by, 
			last_update_date
	from ibs.hr_s_departments;
	commit;
end Load_Dm_HR_S_Departments;
--
Procedure Load_Dm_S_Doclead_Action
	is
begin
	delete from Dm_S_Doclead_Action;
	insert into Dm_S_Doclead_Action
	select 
			scope, 
			act_id, 
			singl, 
			manual, 
			state_id, 
			get_nls_name(dwh_setup.nls_index, cast(name as s_nsi_nvt)), 
			ds_need

	from ibs.s_doclead_action;
  commit;
end Load_Dm_S_Doclead_Action;
--
Procedure Load_Dm_S_Doclead_State
	is 
begin
	delete from Dm_S_Doclead_State;
	insert into Dm_S_Doclead_State
	select 
		scope, 
		state_id, 
		transfer, 
		state_status, 
		get_nls_name(dwh_setup.nls_index, cast(name as s_nsi_nvt))
	from ibs.s_doclead_state;
	commit;
end Load_Dm_S_Doclead_State;
--
Procedure Load_Dm_S_Transaction
	is
begin
	delete from Dm_S_Transaction;
	insert into Dm_S_Transaction
	select 
			trans_group, 
			trans_id, 
			code_document, 
			op_dc_cl, 
			sign_internal, 
			sign_add, 
			maket, 
			get_nls_name(dwh_setup.nls_index,cast(name as s_nsi_nvt))
	from ibs.s_transaction;
	commit;
end Load_Dm_S_Transaction;
--
Procedure Load_Dm_Ln_S_Loan_Type_Account
	is 
begin
	delete from Dm_Ln_S_Loan_Type_Account;
	insert into Dm_Ln_S_Loan_Type_Account
	select  
		code, 
		trim(name), 
		pers, 
		owner
	from ibs.ln_s_loan_type_account;
	commit;

end Load_Dm_Ln_S_Loan_Type_Account;
--
Procedure Load_Dm_Ln_S_Lead_Templates
 is
begin
 delete from Dm_Ln_S_Lead_Templates;
 insert into Dm_Ln_S_Lead_Templates
 select
				id, 
				group_code, 
				trim(name), 
				dt_manual, 
				dt_type_acc_code, 
				ct_manual, 
				ct_type_acc_code, 
				sign_balance
 from ibs.ln_lead_templates;	
 commit;
end Load_Dm_Ln_S_Lead_Templates;
--	
Procedure Load_Dm_Ln_S_Loan_Status
	is 
begin
	delete from Dm_Ln_S_Loan_Status;
	insert into Dm_Ln_S_Loan_Status
	select 
		code_status, 
	  trim(name)
	from ibs.Ln_S_Loan_Status;
	commit;
end Load_Dm_Ln_S_Loan_Status;
--
Procedure Load_Dm_Ln_S_Sign_Delivery
	is
begin
	delete Dm_Ln_S_Sign_Delivery;
	insert into Dm_Ln_S_Sign_Delivery
	select 
		code, 
		trim(name)
	from ibs.Ln_S_Sign_Delivery;
	commit;
end Load_Dm_Ln_S_Sign_Delivery;
--
Procedure Load_Dm_Ln_S_Claim_Type
	is 
begin
	delete from Dm_Ln_S_Claim_Type;
	insert into Dm_Ln_S_Claim_Type
	select 
		code, 
		name
	from ibs.Ln_S_Claim_Type;
	commit;
end Load_Dm_Ln_S_Claim_Type;
--
Procedure Load_Dm_Ln_S_Credit_Type
	is
begin
	delete from Dm_Ln_S_Credit_Type;
	insert into Dm_Ln_S_Credit_Type
	select 
			trim(Code), 
			trim(name), 
			trim(Group_Code), 
			date_activ, 
			date_deact, 
			decode(trim(Condition),'Z','P','A','A',trim(Condition)) , 
			ref_uid, 
			date_apply, 
			date_cancel, 
			version_id, 
			modified_on, 
			null,--get_nls_name(dwh_setup.nls_index, cast(label as s_nsi_nvt)),
			j_sign, 
			p_sign, 
			i_sign, 
			name_uz
	from ibs.Ref_Credit_Type
  where Date_Apply <= dwh_setup.operday
   and Date_Cancel > dwh_setup.operday;
  commit;

end Load_Dm_Ln_S_Credit_Type;
--
Procedure Load_Dm_Ln_S_Form_Red
	is
begin
	delete from Dm_Ln_S_Form_Red;
	insert into Dm_Ln_S_Form_Red
	select 
		code, 
		trim(name), 
		order_by
	from ibs.Ln_S_Form_Red;
	commit;
end Load_Dm_Ln_S_Form_Red;
--
Procedure Load_Dm_Ln_S_Loan_Type_Term
	is 
begin
	delete from Dm_Ln_S_Loan_Type_Term;
	insert into Dm_Ln_S_Loan_Type_Term
	select 
	    trim(Code), 
			trim(name), 
			date_activ, 
			date_deact, 
			decode(trim(Condition),'Z','P','A','A',trim(Condition)), 
			ref_uid, 
			date_apply, 
			date_cancel, 
			version_id, 
			modified_on, 
			get_nls_name(dwh_setup.nls_index, cast(label as s_nsi_nvt)),
			name_uz
	from ibs.Ref_Credit_Time
  where Date_Apply <= dwh_setup.operday
   and Date_Cancel > dwh_setup.operday;
	commit;
end Load_Dm_Ln_S_Loan_Type_Term;
--
Procedure Load_Dm_Ln_S_Purpose_Cipher
	is
begin
	delete from Dm_Ln_S_Purpose_Cipher;
  insert into Dm_Ln_S_Purpose_Cipher
	select 
			trim(Group_Code), 
			trim(Sub_Code) , 
			trim(Code), 
			trim(name), 
			date_activ, 
			date_deact, 
			decode(trim(Condition),'Z','P','A','A',trim(Condition)) , 
			ref_uid, 
			date_apply, 
			date_cancel, 
			version_id, 
			modified_on, 
			null, --get_nls_name(dwh_setup.nls_index, cast(label as s_nsi_nvt)),
			j_sign, 
			p_sign, 
			i_sign, 
			name_uz
	from ibs.Ref_Credit_Cipher
  where Date_Apply <= dwh_setup.operday
   and Date_Cancel > dwh_setup.operday
	 and Code not like '9%'; -- прочие кредиты исключить из выборки;
  commit;
end Load_Dm_Ln_S_Purpose_Cipher;
--
Procedure Load_Dm_Ln_S_Cr_Cl_Guarant
	is
begin
	delete from Dm_Ln_S_Cr_Cl_Guarant;
	insert into Dm_Ln_S_Cr_Cl_Guarant
	select 
		trim(Code), 
		trim(name), 
		date_activ, 
		date_deact, 
		decode(trim(Condition),'Z','P','A','A',trim(Condition)), 
		ref_uid, 
		date_apply, 
		date_cancel, 
		version_id, 
		modified_on, 
		get_nls_name(dwh_setup.nls_index,cast(label as s_nsi_nvt)),
		name_uz
	from ibs.Ref_Cr_Cl_Guarant
	where Date_Apply <= dwh_setup.operday
   and Date_Cancel > dwh_setup.operday;
	commit;
end Load_Dm_Ln_S_Cr_Cl_Guarant;
--
Procedure Load_Dm_Ln_S_Credit_Source
	is
begin
	delete from Dm_Ln_S_Credit_Source;
	insert into Dm_Ln_S_Credit_Source
	select 
			trim(Code), 
			trim(name), 
			trim(Group_Code), 
			date_activ, 
			date_deact, 
			decode(trim(Condition),'Z','P','A','A',trim(Condition)), 
			ref_uid, 
			date_apply, 
			date_cancel, 
			version_id, 
			modified_on, 
			null,--get_nls_name(dwh_setup.nls_index, cast(label as s_nsi_nvt)),
			name_uz
	from ibs.Ref_Credit_Source
  where Date_Apply <= dwh_setup.operday
   and Date_Cancel > dwh_setup.operday;
	commit;
end Load_Dm_Ln_S_Credit_Source;
--
Procedure Load_Dm_Ln_S_Class_Credit
	is
begin
	delete from Dm_Ln_S_Class_Credit;
	insert into Dm_Ln_S_Class_Credit
	select 
			trim(Code), 
			trim(name), 
			koeff_p, 
			koeff_l, 
			koeff_a, 
			date_activ, 
			date_deact, 
			decode(trim(Condition),'Z','P','A','A',trim(Condition)), 
			ref_uid, 
			date_apply, 
			date_cancel, 
			version_id, 
			modified_on, 
			get_nls_name(dwh_setup.nls_index, cast(label as s_nsi_nvt)),
			name_uz
	from ibs.Ref_Class_Credit
  where Date_Apply <= dwh_setup.operday
   and Date_Cancel > dwh_setup.operday;
	commit;
end Load_Dm_Ln_S_Class_Credit;
--
Procedure Load_Dm_Ln_S_Credit_Class_Quality
	is
begin
	delete from Dm_Ln_S_Credit_Class_Quality;
	insert into Dm_Ln_S_Credit_Class_Quality
	select 
			trim(Code) , 
			trim(name), 
			percent, 
			date_activ, 
			date_deact, 
			decode(trim(Condition),'Z','P','A','A',trim(Condition)), 
			ref_uid, 
			date_apply, 
			date_cancel, 
			version_id, 
			modified_on, 
			get_nls_name(dwh_setup.nls_index, cast(label as s_nsi_nvt)),
			name_uz
	from ibs.Ref_Credit_Class_Quality
  where Date_Apply <= dwh_setup.operday
   and Date_Cancel > dwh_setup.operday;
	commit;
end Load_Dm_Ln_S_Credit_Class_Quality;
--
Procedure Load_Dm_Ln_S_Object_Leasing
	is
begin
	delete from Dm_Ln_S_Object_Leasing;
	insert into Dm_Ln_S_Object_Leasing
	select 
	    code,
			name
	from ibs.Ln_S_Object_Leasing t;
	commit;

end Load_Dm_Ln_S_Object_Leasing;
--
Procedure Load_Dm_Cm_S_Criterion
	is
begin
	delete from Dm_Cm_S_Criterion;
	insert into Dm_Cm_S_Criterion
	select 
		code, 
		criterion, 
		point, 
		status	
	from comp.cm_s_criterion t;
	commit;
end Load_Dm_Cm_S_Criterion;
--
Procedure Load_Dm_Cm_S_Offshores
	is
begin
	delete from Dm_Cm_S_Offshores;
	insert into Dm_Cm_S_Offshores
	select 
	    id,
      country_code,
      uz,
      ru,
      en,
      date_activate,
      date_deactivated,
      date_activ_cb,
      date_deact_cb
from comp.CM_OFFSHORES t
where nvl(t.date_deact_cb,dwh_setup.operday) >= dwh_setup.Operday;
commit;
end Load_Dm_Cm_S_Offshores;
--
Procedure Load_Dm_Cm_S_Country
	is 
begin
	delete from Dm_Cm_S_Country;
	insert into Dm_Cm_S_Country
	select 
	   code,     
     date_activate,
     date_deactivated,
     date_activ_cb,
     date_deact_cb,
		 (select name from dm_s_country a where a.code = t.code) code_name
from comp.cm_country t
where nvl(t.date_deact_cb,dwh_setup.operday) >= dwh_setup.OperDay;
commit;
end Load_Dm_Cm_S_Country;
--
Procedure Load_Dm_Tet_S_Account_Types
	is
begin
	delete from Dm_Tet_S_Account_Types;
	insert into Dm_Tet_S_Account_Types
	select 
			id, 
			get_nls_name(dwh_setup.nls_index, cast(name as s_nsi_nvt)),
			group_id, 
			category_id, 
			state
	from ibs.tet_r_Accounts_Types;
  commit;
end Load_Dm_Tet_S_Account_Types;
--
Procedure Load_Dm_Tet_S_Contract_Types
	is
begin
	delete from Dm_Tet_S_Contract_Types;
	insert into Dm_Tet_S_Contract_Types
	select 
			id, 
			get_nls_name(dwh_setup.nls_index, cast(name as s_nsi_nvt)), 
			type_group_id, 
			class_code, 
			state, 
			currency_code, 
			acc_type
	from ibs.tet_r_contract_types ;
	commit;
end Load_Dm_Tet_S_Contract_Types;
--
Procedure Load_Dm_Tet_S_Card_Product_Codes
	is
begin
	delete from Dm_Tet_S_Card_Product_Codes;
	insert into Dm_Tet_S_Card_Product_Codes
	select 
			code, 
			get_nls_name(dwh_setup.nls_index, cast (name as s_nsi_nvt)), 
			state, 
			subject_type, 
			chip_app_id, 
			expire_months, 
			contract_type, 
			group_code, 
			ref_card_type, 
			is_open_acc_automat, 
			is_conversion_operation
	from ibs.tet_r_Card_product_codes ;
	commit;
end Load_Dm_Tet_S_Card_Product_Codes;
--
Procedure Load_Dm_S_Coa
	is
begin
	delete from Dm_S_Coa;
	insert into Dm_S_Coa
	select
	      destination, 
				code, 
				trim(name), 
				trim(type), 
				trim(Section_Code), 
				trim(Type_Acc_Code), 
				trim(Reverse_Code), 
				trim(Client_Code), 
				trim(Gr_Risk_Code), 
				date_activ, 
				date_deact, 
				Decode(trim(Condition), 'A', 'A', 'Z', 'P', trim(Condition)), 
				sign_nibbd, 
				ref_uid, 
				date_apply, 
				date_cancel, 
				version_id, 
				modified_on, 
				null , --get_nls_name(dwh_setup.nls_index,cast(label as s_nsi_nvt)),
        rowid 
  from ibs.Ref_Coa t
   where Date_Apply <= dwh_setup.operday
    and Date_Cancel > dwh_setup.operday
    and t.Destination = 3
  union all
  select 
	      destination, 
        code, 
        trim(name), 
        trim(type), 
        trim(Section_Code), 
        trim(Type_Acc_Code), 
        trim(Reverse_Code), 
        trim(Client_Code), 
        trim(Gr_Risk_Code), 
        date_activ, 
        date_deact, 
        Decode(trim(Condition), 'A', 'A', 'Z', 'P', trim(Condition)), 
        sign_nibbd, 
        ref_uid, 
        date_apply, 
        date_cancel, 
        version_id, 
        modified_on, 
        null , --get_nls_name(dwh_setup.nls_index,cast(label as s_nsi_nvt)),
        rowid        
  from ibs.Ref_Coa t
  where Date_Apply <= dwh_setup.operday
    and Date_Cancel > dwh_setup.operday
    and t.Destination = 0
    and not exists
  (select *
          from ibs.Ref_Coa tt
         where Date_Apply <= dwh_setup.operday
           and Date_Cancel > dwh_setup.operday
           and tt.Code = t.Code
           and Destination =3)
  union all
  select 
	      destination, 
        code, 
        trim(name), 
        trim(type), 
        trim(Section_Code), 
        trim(Type_Acc_Code), 
        trim(Reverse_Code), 
        trim(Client_Code), 
        trim(Gr_Risk_Code), 
        date_activ, 
        date_deact, 
        Decode(trim(Condition), 'A', 'A', 'Z', 'P', trim(Condition)), 
        sign_nibbd, 
        ref_uid, 
        date_apply, 
        date_cancel, 
        version_id, 
        modified_on, 
        null , --get_nls_name(dwh_setup.nls_index,cast(label as s_nsi_nvt)),
        rowid 
   from ibs.Ref_Coa h
  where Date_Apply <= dwh_setup.operday
   and Date_Cancel > dwh_setup.operday
   and Destination = 1
   and not exists
  (select *
          from ibs.Ref_Coa t
         where Date_Apply <= dwh_setup.operday
           and Date_Cancel > dwh_setup.operday
           and t.Code = h.Code
           and Destination in(0, 3));
	 commit;
end Load_Dm_S_Coa;
--
Procedure Load_Dm_Sl_S_Cs_Lead_States
	is
begin
	delete from Dm_Sl_S_Cs_Lead_States;
	insert into Dm_Sl_S_Cs_Lead_States
	select 
			dict_code, 
			code, 
			get_nls_name(dwh_setup.nls_index, cast(name as s_nsi_nvt)), 
			ord, 
			state, 
			app
	from ibs.ia_s_Common_dicts t
	where t.dict_code = 'SL_CS_LEAD_STATES';	
	commit;
end Load_Dm_Sl_S_Cs_Lead_States;
--
Procedure Load_Dm_Sl_S_Calc_States
	is
begin
	delete from Dm_Sl_S_Calc_States;
	insert into Dm_Sl_S_Calc_States
	select 
      dict_code, 
      code, 
      get_nls_name(dwh_setup.nls_index, cast(name as s_nsi_nvt)), 
      ord, 
      state, 
      app
  from ibs.ia_s_Common_dicts t
  where t.dict_code = 'SL_CALC_STATES';   
	commit;
end Load_Dm_Sl_S_Calc_States;
--
Procedure Load_Dm_Aa_S_Doc_Type 
	is
begin
	delete from Dm_Aa_S_Doc_Type;
	insert into Dm_Aa_S_Doc_Type
	select 
		code, 
		name, 
		operation_code, 
		state
  from ibs.Aa_S_Doc_Type t;
	commit;
	
end Load_Dm_AA_S_Doc_Type;
--
Procedure Load_Dm_Cf_S_Card_State
	is
begin 
  delete from Dm_Cf_s_Card_State;
  insert into Dm_Cf_s_Card_State
    (State, name)
  values
     ('A', 'Активный');
  insert into Dm_Cf_s_Card_State
    (State, name)
  values
     ('C', 'Закрытый');
  insert into Dm_Cf_s_Card_State
    (State, name)
  values
    ( 'N', 'Новый');
  insert into Dm_Cf_s_Card_State
    (State, name)
  values
     ('S', 'Неактивный');
  insert into Dm_Cf_s_Card_State
    (State, name)
  values
     ('D', 'Активный');
  
	commit;
end Load_Dm_Cf_S_Card_State;
--
Procedure Load_Dm_Cf_S_Source_Tasks
	 is
begin
	delete from Dm_Cf_S_Source_Tasks;
	insert into Dm_Cf_S_Source_Tasks
	select 
		module_code, 
		task_code, 
		get_nls_name(dwh_setup.nls_index,cast(label as s_nsi_nvt)) 
	from ibs.cf_source_tasks t ;
	commit;
end Load_Dm_Cf_S_Source_Tasks;
--
Procedure Load_Dm_Cf_S_Card_Transactions
	is
begin
	delete from Dm_Cf_S_Card_Transactions;
	insert into Dm_Cf_S_Card_Transactions	
	select 1 Id,
       t.Trans_Id || 'N' Code, --
       name
  from Dm_s_Transaction t
 where Trans_Group = 100
   and t.Trans_Id in (101, 102, 105, 106, 111)
 union all
 select 2 Id,
       t.Trans_Id || 'B' Code, --
      name || ' в бюджет' 
  from Dm_s_Transaction t
 where Trans_Group = 100
   and t.Trans_Id in (101, 102, 106, 111)
 union all
 select 3 Id,
       t.Trans_Id || 'P' Code, --
       name || ' в бюджет дохода' 
  from Dm_s_Transaction t
 where Trans_Group = 100
   and t.Trans_Id in (101, 102, 105, 106, 111)
 order by 1, 2;
 commit;

end Load_Dm_Cf_S_Card_Transactions;
--
Procedure Load_Dm_Stg_S_Doc_Type
	is
begin
  delete from Dm_Stg_S_Doc_Type;
	insert into Dm_Stg_S_Doc_Type
	select 
		doc_type_id, 
		name, 
		visual, 
		priory, 
		print_name, 
		description, 
		text_color
	from ibs.stg_s_doc_type t;
	commit;	 
 
end Load_Dm_Stg_S_Doc_Type;
--
Procedure Load_Dm_Stg_S_States 
	is
begin
	delete from Dm_Stg_S_States;
	insert into Dm_Stg_S_States
	select 
	  id, 
    name
	from ibs.stg_s_states t;
	commit;
end Load_Dm_Stg_S_States;
--
function Get_Idnc (i_lead_id number) return number
     is 
    v_idnc number;
    v_obj_id number;
   begin
     select Object_Id
       into v_Obj_Id
       from (select Object_Id
               from Ibs.Vl_Leads_History Vl
              where Vl.Lead_Id = i_Lead_Id
                and Vl.State_Id = '41'
                and (Substr(Vl.Cl_Acc, 8, 5) = '10501' or Substr(Vl.Co_Acc, 8, 5) = '10501')
                and Rownum = 1
             union all
             select Object_Id
               from Ibs.Vl_Leads Vl
              where Vl.Lead_Id = i_Lead_Id
                and Vl.State_Id = '41'
                and (Substr(Vl.Cl_Acc, 8, 5) = '10501' or Substr(Vl.Co_Acc, 8, 5) = '10501')
                and Rownum = 1);
      --
     select Idnc
       into v_Idnc
       from (select b.Idnc
               from Ibs.Bt_Tbl_Application b
              where b.Message_Ref_Id = v_Obj_Id
             union all
             select b.Idnc
               from Ibs.Bt_Tbl_Application_History b
              where b.Message_Ref_Id = v_Obj_Id);
     
    return v_idnc;
   exception when no_data_found then
     return null;
   end Get_Idnc;
---------------------------------
Function Get_Oked(i_client_id number) return varchar2 is 
	v_result varchar2(600) ;
	v_oked   varchar2(5) ;
begin
  select t.Oked
    into v_Oked
    from Ibs.Client_Juridical_Current t
   where t.Id = i_Client_Id;
  --
	select namer into v_result from Dm_S_Oked s where s.code = v_oked;
	return v_result;
	exception when no_data_found then
		return null;
end Get_Oked;
----------------
Function Get_Unique_Special_Account_Id
  (
    i_Filial_Code   ibs.Special_Accounts.Filial_Code%type,
    i_Code_Special  ibs.Special_Accounts.Code_Special%type, 
    i_Currency_Code ibs.Special_Accounts.Code_Currency%type, 
    i_For_Filial    ibs.Special_Accounts.For_Filial%type    
  ) return ibs.Special_Accounts.Acc_Id%type is
    v_Account_Id ibs.Special_Accounts.Acc_Id%type;
  begin
    begin
      if i_For_Filial is null then
        select --+ index (s IDX_SPECIAL_ACCOUNTS_FILIAL)
         s.Acc_Id
          into v_Account_Id
          from ibs.Special_Accounts s
         where s.Filial_Code = i_Filial_Code
           and s.Code_Special = i_Code_Special
           and s.Code_Currency = i_Currency_Code;
      else
        select --+ index (s IDX_SPECIAL_ACCOUNTS_FILIAL)
         s.Acc_Id
          into v_Account_Id
          from ibs.Special_Accounts s
         where s.Filial_Code = i_Filial_Code
           and s.Code_Special = i_Code_Special
           and s.Code_Currency = i_Currency_Code
           and s.for_filial = i_For_Filial;
      end if;
    exception
      when Too_Many_Rows then
        if i_For_Filial is null then
          select --+ index (s IDX_SPECIAL_ACCOUNTS_FILIAL) index (a XPKACCOUNTS)
           s.Acc_Id
            into v_Account_Id
            from ibs.Special_Accounts s, ibs.Accounts a
           where s.Filial_Code = i_Filial_Code
             and s.Code_Special = i_Code_Special
             and s.Code_Currency = i_Currency_Code
             and a.Id = s.Acc_Id
             and a.Condition = 'A'
             and Rownum = 1;
        else
          select --+ index (s IDX_SPECIAL_ACCOUNTS_FILIAL) index (a XPKACCOUNTS)
           s.Acc_Id
            into v_Account_Id
            from ibs.Special_Accounts s, ibs.Accounts a
           where s.Filial_Code = i_Filial_Code
             and s.Code_Special = i_Code_Special
             and s.Code_Currency = i_Currency_Code
             and s.For_Filial = i_For_Filial
             and a.Id = s.Acc_Id
             and a.Condition = 'A'
             and Rownum = 1;
        end if;
    end;
    return v_Account_Id;
  exception
    when No_Data_Found then
      return null;
  end Get_Unique_Special_Account_Id;
	----------------------------------
Function Get_Loro_Acc_ID(
	  i_Filial_Code   ibs.Special_Accounts.Filial_Code%type,
    i_Currency_Code ibs.Special_Accounts.Code_Currency%type, 
    i_Sign_Dc       varchar2 := 'D', 
    i_Raise_Except  varchar2 := 'N',  
    i_Corr_Filial   varchar2 := null
)  return ibs.Special_Accounts.Acc_Id%type is
    v_Code_Special ibs.Special_Accounts.Code_Special%type;    
    result         ibs.Special_Accounts.Acc_Id%type;
    v_for_filial   varchar2(5) := null;
 begin
	  if i_Currency_Code = dwh_Setup.Basecurrency then      
      v_Code_Special := c_Sa_Coor_Acc;
      return dwh_Setup.Get_Loro_Account_Id(i_Filial_Code);
    else
     
      v_Code_Special := c_Sa_Coor_Acc_Va;
      --
      if i_Filial_Code = dwh_Setup.Operdepmfo then
        v_For_Filial   := i_Corr_Filial;
        v_Code_Special := c_Sa_Coor_Acc_Vp;
      end if;
      --
      if dwh_Setup.Get_Env(622, 'N') = 'Y' then
        if i_Sign_Dc = 'D' then
          v_Code_Special := c_Sa_Coor_Acc_Va;
        else
          v_Code_Special := c_Sa_Coor_Acc_Vp;
        end if;
      end if;
    end if;
		
		result := Get_Unique_Special_Account_Id(i_Filial_Code   => i_Filial_Code,
                                         i_Code_Special     => v_Code_Special,
                                         i_Currency_Code    => i_Currency_Code,
                                         i_For_Filial       => v_For_Filial);
    if i_Raise_Except = 'Y' and result is null then
      Raise_Error(-20130,
                      'Exception : Ne Nastroen korr schet. Fil: ' || etl_kernel.Get_Etl_Filial || ' currency : ' || i_currency_code );					 
   
    else
      return result;
    end if;
 end Get_Loro_Acc_ID;
---------------------------------
Function Get_Loro_Account_ID (
    i_Filial_Code    ibs.SPECIAL_ACCOUNTS.Filial_Code%Type,    
    i_Currency_Code  ibs.SPECIAL_ACCOUNTS.Code_Currency%Type,  
    i_Sign_DC        Varchar2 := 'D'                       
  )
  Return ibs.SPECIAL_ACCOUNTS.Acc_ID%Type
    RESULT_CACHE
  is
  begin
    -- Вызвать функцию получения идентификатора корсчета для заданной валюты
    return Get_Loro_Acc_ID(i_Filial_Code, i_Currency_Code, i_Sign_DC);
  end Get_Loro_Account_ID;
---------------------------------------
	---Fill Dm_Leads_All
	Procedure Fill_Dm_Leads is 
		v_Time_Beg date := sysdate;
		v_log_id  number(9);
	 
	begin
		Write_Log(i_Module_Name => 'FILL_DM_LEADS',i_Log_Type =>  'N', i_Text => 'Started',i_filial_code => etl_kernel.Get_Etl_Filial ,i_oper_day =>  etl_kernel.Get_Etl_Day,i_table_name => 'DM_LEADS_ALL',i_log_id => v_log_id);
		 
		--delete from table old data
    /*delete DM_LEADS_ALL t
     where t.code_filial = etl_kernel.Get_Etl_Filial
       and t.curr_day = etl_kernel.Get_Etl_Day;*/
		
		insert into dm_leads_all(
			doc_id, maket_id, code_filial, id, doc_numb, doc_date, cl_mfo, cl_acc, cl_inn, cl_name, co_mfo, co_acc, 
			co_inn, co_name, pay_purpose, sum_pay, sum_eqv, code_document, op_dc, trans_id, code_currency, sys_birth, 
			emp_birth, sys_id, code_emp, id_parent, id_child, date_enter, date_execute, date_suspend, date_activ, 
			sign_origin, sign_internal, sign_balance, code_plan, code_rest, reason_code, err_code, act_id, state_id, 
			curr_day, sym_id, task_code, contract_id, doc_type_id, purpose_sub_code, swift_code, partner_status, 
			init_task_code, date_value, cl_acc20, co_acc20, emp_birth_name, sign_origin_name, sign_internal_name, 
			sym_id_2, action_11_who, action_11_who_name, action_11_when, action_31_who, action_31_when, action_31_who_name, 
			action_41_who, action_41_when, action_41_who_name, system_name, subsystem_name, cash_symbol, idnc,deal_id )
	  select 
		  doc_id, maket_id, code_filial, id, doc_numb, doc_date, cl_mfo, cl_acc, cl_inn, cl_name, co_mfo, co_acc, 
      co_inn, co_name, pay_purpose, sum_pay, sum_eqv, code_document, op_dc, trans_id, code_currency, sys_birth, 
      emp_birth, sys_id, code_emp, id_parent, id_child, date_enter, date_execute, date_suspend, date_activ, 
      sign_origin, sign_internal, sign_balance, code_plan, code_rest, reason_code, err_code, act_id, state_id, 
      curr_day, lpad(t.sym_id,5,'0'), task_code, contract_id, doc_type_id, purpose_sub_code, swift_code, partner_status, 
      init_task_code, date_value, substr(cl_acc,-20),substr(co_acc,-20),
			(select c.name from ibs.core_users c where c.user_id = t.emp_birth),
			decode(t.Sign_Origin, 'I', 'Ручная', 'R', 'Полученная', 'Автоматическая'),
			decode(t.SIGN_INTERNAL, 'I', 'Внутренний', 'B', 'Межфилиальный', 'E', 'Межбанковский'),
			(select lpad(lr.sym_id,5,'0') from ibs.leads_report lr where lr.id = t.id),
			(select p.code_emp from ibs.LEAD_PROTOCOL_HIST p where p.lead_id = t.id and p.act_id = 11 and rownum = 1),
			(select c.name from ibs.core_users c where c.user_id = (select p.code_emp from ibs.LEAD_PROTOCOL_HIST p where p.lead_id = t.id and p.act_id = 11 and rownum = 1)),
			(select p.time from ibs.LEAD_PROTOCOL_HIST p where p.lead_id = t.id and p.act_id = 11 and rownum = 1),
			(select p.code_emp from ibs.LEAD_PROTOCOL_HIST p where p.lead_id = t.id and p.act_id in (31, 32, 33, 40) and rownum = 1) ,
			(select p.time from ibs.LEAD_PROTOCOL_HIST p where p.lead_id = t.id and p.act_id in (31, 32, 33, 40) and rownum = 1) ,
			(select c.name from ibs.core_users c where c.user_id  = (select p.code_emp from ibs.LEAD_PROTOCOL_HIST p where p.lead_id = t.id and p.act_id in (31, 32, 33, 40) and rownum = 1)),
			(select p.code_emp from ibs.LEAD_PROTOCOL_HIST p where p.lead_id = t.id and p.act_id in (40,41) and rownum = 1),
			(select p.time from ibs.LEAD_PROTOCOL_HIST p where p.lead_id = t.id and p.act_id in (40, 41) and rownum = 1),
      (select c.name from ibs.core_users c where c.user_id = (select p.code_emp from ibs.LEAD_PROTOCOL_HIST p where p.lead_id = t.id and p.act_id in (40, 41) and rownum = 1)) ,
			(select k.name from Dm_S_System k where k.code = t.sys_birth),
			(select k.name from Dm_S_Task k where k.code = t.task_code) ,
			(t.code_document||substr(t.pay_purpose,1,4)||decode(t.code_currency, '000','0','1')),
			--nvl(t.idnk,(sGetelect  _Idnc(t.id) from dual )) idnc,
			(select  Get_Idnc(t.id) from dual ),
      t.deal_id
		from ibs.leads_history t 
		where t.code_filial = etl_kernel.Get_Etl_Filial
		and t.curr_day = etl_kernel.Get_Etl_Day
		
		union all
		select 
      l.doc_id, l.maket_id, l.code_filial, l.id, l.doc_numb, l.doc_date, l.cl_mfo, l.cl_acc, l.cl_inn, l.cl_name, l.co_mfo, l.co_acc, 
      l.co_inn, l.co_name, l.pay_purpose, l.sum_pay, l.sum_eqv, l.code_document, l.op_dc, l.trans_id, l.code_currency, l.sys_birth, 
      l.emp_birth, l.sys_id, l.code_emp, l.id_parent, l.id_child, l.date_enter, l.date_execute, l.date_suspend, l.date_activ, 
      l.sign_origin, l.sign_internal, l.sign_balance, l.code_plan, l.code_rest, l.reason_code, l.err_code, l.act_id, l.state_id, 
      l.curr_day,lpad(l.sym_id,5,'0'), l.task_code, l.contract_id, l.doc_type_id, l.purpose_sub_code, l.swift_code, l.partner_status, 
      l.init_task_code, l.date_value, substr(l.cl_acc,-20),substr(l.co_acc,-20),
      (select c.name from ibs.core_users c where c.user_id = l.emp_birth),
      decode(l.Sign_Origin, 'I', 'Ручная', 'R', 'Полученная', 'Автоматическая'),
      decode(l.SIGN_INTERNAL, 'I', 'Внутренний', 'B', 'Межфилиальный', 'E', 'Межбанковский'),
      (select lpad(lr.sym_id,5,'0') from ibs.leads_report lr where lr.id = l.id),
      (select p.code_emp from ibs.LEAD_PROTOCOL_HIST p where p.lead_id = l.id and p.act_id = 11 and rownum = 1),
      (select c.name from ibs.core_users c where c.user_id = (select p.code_emp from ibs.LEAD_PROTOCOL_HIST p where p.lead_id = l.id and p.act_id = 11 and rownum = 1)),
      (select p.time from ibs.LEAD_PROTOCOL_HIST p where p.lead_id = l.id and p.act_id = 11 and rownum = 1),
      (select p.code_emp from ibs.LEAD_PROTOCOL_HIST p where p.lead_id = l.id and p.act_id in (31, 32, 33, 40) and rownum = 1) ,
      (select p.time from ibs.LEAD_PROTOCOL_HIST p where p.lead_id = l.id and p.act_id in (31, 32, 33, 40) and rownum = 1) ,
      (select c.name from ibs.core_users c where c.user_id  = (select p.code_emp from ibs.LEAD_PROTOCOL_HIST p where p.lead_id = l.id and p.act_id in (31, 32, 33, 40) and rownum = 1)),
      (select p.code_emp from ibs.LEAD_PROTOCOL_HIST p where p.lead_id = l.id and p.act_id in (40,41) and rownum = 1),
      (select p.time from ibs.LEAD_PROTOCOL_HIST p where p.lead_id = l.id and p.act_id in (40, 41) and rownum = 1),
      (select c.name from ibs.core_users c where c.user_id = (select p.code_emp from ibs.LEAD_PROTOCOL_HIST p where p.lead_id = l.id and p.act_id in (40, 41) and rownum = 1)) ,
      (select k.name from Dm_S_System k where k.code = l.sys_birth),
      (select k.name from Dm_S_Task k where k.code = l.task_code) ,
      (l.code_document||substr(l.pay_purpose,1,4)||decode(l.code_currency, '000','0','1')),
      --nvl(t.idnk,(sGetelect  _Idnc(t.id) from dual )) idnc,
      (select  Get_Idnc(l.id) from dual ),
      null --l.deal_id
    from ibs.leads l
    where l.code_filial = etl_kernel.Get_Etl_Filial
    and l.curr_day = etl_kernel.Get_Etl_Day;
		commit;
	  
	  Write_Log(i_Module_Name => 'FILL_DM_LEADS', i_Log_Type => 'F', i_Text => 'Finished',i_log_id => v_log_id);
   
	exception when others then
		 Write_Log(i_Module_Name => 'FILL_DM_LEADS',
                      i_Log_Type => 'E',
                      i_error_txt    => 'Exception : Fil = : ' || etl_kernel.Get_Etl_Filial || ' ' ||
									    Substr(sqlerrm, 1, 2000) || ', stack: ' ||
                      Substr(Dbms_Utility.Format_Error_Backtrace, 1, 1500),i_log_id => v_log_id );
											
	end Fill_Dm_Leads;
	 --procedure to fill Dm_Core_Accounts 
	 Procedure Fill_Dm_Core_Accounts is
		 v_Time_Beg date := sysdate;
		 v_log_id  number(9);
		 begin
			Write_Log(i_Module_Name => 'FILL_DM_CORE_ACCOUNTS',i_Log_Type =>  'N', i_Text => 'Started',i_filial_code => etl_kernel.Get_Etl_Filial ,i_oper_day =>  etl_kernel.Get_Etl_Day,i_table_name => 'DM_CORE_ACCOUNTS',i_log_id => v_log_id);
		 
		--delete from table old data
      /*delete Dm_Core_Accounts t
       where t.code_filial = etl_kernel.Get_Etl_Filial
        ;*/
		  insert into Dm_Core_Accounts (
				id, code, code_filial, name, liability_active, balance_out, sign_registr, saldo_in, 
				saldo_out, saldo_equival_in, saldo_equival_out, saldo_unlead, turnover_debit, turnover_credit, 
				turnover_all_debit, turnover_all_credit, lead_last_date, status, condition, 
				client_code, group_code, acc_external, code_coa, code_currency, a_client_code, 
				a_account_code, owned_filial, subcoa_code, client_id, date_open, date_validate, 
				date_change_condition, owned_employee, local_code, product_id, eqv_turnover_debit, 
				eqv_turnover_credit, eqv_turnover_all_debit, eqv_turnover_all_credit, 
				curr_oper_code, curr_oper_subcode, mcc_param_type, ips_param_type, mt_param_type, 
				msfo, display_name, external_product_id, external_product_code, client_uid, 
				date_close, oked, oked_name, business_sign
				)
      select
				id, code, code_filial, name, liability_active, balance_out, sign_registr, saldo_in, 
				saldo_out, saldo_equival_in, saldo_equival_out, saldo_unlead, turnover_debit, turnover_credit, 
				turnover_all_debit, turnover_all_credit, lead_last_date, status, condition, 
				client_code, group_code, acc_external, code_coa, code_currency, a_client_code, 
				a_account_code, owned_filial, subcoa_code, client_id, date_open, date_validate, 
				date_change_condition, owned_employee, local_code, product_id, eqv_turnover_debit, 
				eqv_turnover_credit, eqv_turnover_all_debit, eqv_turnover_all_credit, 
				curr_oper_code, curr_oper_subcode, mcc_param_type, ips_param_type, mt_param_type, 
				msfo, display_name, external_product_id, external_product_code, null /*client_uid*/,
				case when t.condition ='C' then t.date_change_condition  end as date_close,
				(select s.oked from ibs.client_juridical_current  s
				where s.id = t.client_id) oked,
				Get_Oked(t.client_id) oked_name,
				(select s.business_sign from ibs.client_juridical_current s
				where s.id = t.client_id) business_sign
			from ibs.accounts t
		  where t.code_filial = etl_kernel.Get_Etl_Filial; 
		 commit;
		 
		 Write_Log(i_Module_Name => 'FILL_DM_CORE_ACCOUNTS', i_Log_Type => 'F', i_Text => 'Finished',i_log_id => v_log_id);
   
     exception when others then
      Write_Log(i_Module_Name => 'FILL_DM_CORE_ACCOUNTS',
                      i_Log_Type => 'E',
                      i_error_txt    => 'Exception : Fil = : ' || etl_kernel.Get_Etl_Filial || ' ' ||
                      Substr(sqlerrm, 1, 2000) || ', stack: ' ||
                      Substr(Dbms_Utility.Format_Error_Backtrace, 1, 1500),i_log_id => v_log_id );
                      
		 end Fill_Dm_Core_Accounts;
	 --Procedure to fill DM_CORE_CLIENTS
	 Procedure Fill_Dm_Core_Clients  is
		
		v_Time_Beg date := sysdate;
    v_log_id  number(9);
    begin
      Write_Log(i_Module_Name => 'FILL_DM_CORE_CLIENTS',i_Log_Type =>  'N', i_Text => 'Started',i_filial_code => etl_kernel.Get_Etl_Filial ,i_oper_day =>  etl_kernel.Get_Etl_Day,i_table_name => 'DM_CORE_CLIENTS',i_log_id => v_log_id);
     
    --delete from table old data
      /*delete DM_CORE_CLIENTS t
       where t.code_filial = etl_kernel.Get_Etl_Filial
        ;	*/
		 insert into DM_CORE_CLIENTS 
		 (
		    code, name, typeof, subject, inn, address, condition, resident_code, country_code, 
				tax_organization_code, property_form_code, phone, fax, email, operator_code, 
				date_validate, date_modify, code_filial, a_client_code, id, zip_code, district_code, 
				date_end, mobile_phone, region_code, date_open, date_change_condition, cell_number, 
				web, name_inter, notice, resident_type, swift_id, typeof_name, subject_type, 
				subject_type_name, condition_name, resident_code_name, country_code_name, 
				tax_organization_code_name, property_form_code_name, operator_name, code_filial_name, 
				district_code_name, region_code_name, swift_id_name, offshore_country_code, 
				fatf_country_code, passport_info, birthday, passport_type, passport_registration_place, 
				passport_registration_date, work_capacity, pensionary_registration_place, pensionary_registration_date, 
				pensionary_certification, owned_filial, surname, surname_inter, first_name, first_name_inter, 
				patronymic, gender, patronymic_inter, passport_end_date, inps, client_reason, 
				death_date, archive_date, passport_string, birth_place, temporary_address, country_birth, 
				country_residence, city_residence, family_status, work_place, exist_contract_sign, 
				code_word, surname_rus, first_name_rus, patronymic_rus, passport_number, passport_serial, 
				pinfl, passport_type_name, work_capacity_name, owned_filial_name, gender_name, client_reason_name, 
				country_birth_name, country_residence_name, organization_head_code, director_name, 
				director_passport, accounter_chief_name, accounter_chief_passport, trade_sign, 
				sector_code, organ_directive_code, registration_place_code, registration_date, 
				registration_document_number, sign_registr, organization_legal_form, address_code, 
				code_juridical_person, inn_header_organization, name_header_organization, 
				bic, main_filial, main_account, business_sign, ref_client, oked, capital_info, 
				response_activity_type, sector_code_name, organ_directive_code_name, registration_place_code_name, 
				organization_legal_form_name, employee_id, oked_name, filial_code_acc


		 )
		  select 
        t.code,t.name, t.typeof, t.subject, t.inn, t.address, t.condition, t.resident_code, t.country_code, 
        t.tax_organization_code, t.property_form_code, t.phone, t.fax, t.email, t.operator_code, 
        t.date_validate, t.date_modify, t.code_filial, t.a_client_code, t.id, t.zip_code, t.district_code, 
        t.date_end, t.mobile_phone, t.region_code, t.date_open, t.date_change_condition, t.cell_number, 
        t.web, t.name_inter, t.notice, t.resident_type, t.swift_id,
        (select clt.name from Dm_S_Client_Type clt where clt.code = t.typeof),
        decode(t.typeof, '11', 'I', '08', 'P', 'J') subject_type,
        (select sb.name from Dm_S_Subject_Type sb where sb.Code = decode(t.typeof, '11', '3', '08', '2', '1') ),
        (select cn.name from Dm_S_Client_Condition cn where cn.code = t.condition),
        decode(t.resident_code, '1', 'Резидент','2' , 'Не Резидент') ,
        (select cnt.name from Dm_S_Country cnt where cnt.Code = t.country_code), 
        (select torg.name from Dm_S_Tax_Organization torg where torg.Code = t.tax_organization_code) ,
        (select prf.name from Dm_S_Form_Property prf where prf.Code = t.property_form_code),
        (SELECT EMP.NAME FROM ibs.core_users EMP WHERE EMP.user_id = T.Operator_Code) operator_name,
        (select codf.NAME from dm_filials_v codf where codf.code = t.code_filial),
        (select dis.name from Dm_S_District dis where dis.code = t.district_code) ,
        (select reg.name from Dm_S_Region reg where reg.Code = t.region_code),
        (select swc.name FROM Dm_S_Bank_Corr SWC WHERE SWC.SWIFT_CODE = T.SWIFT_ID),
        (select cm_of.COUNTRY_CODE from dm_cm_s_offshores cm_of where cm_of.COUNTRY_CODE = t.country_code and rownum = 1),
        (select cm.code from dm_cm_s_country cm where cm.code = t.country_code) ,
        
        p.passport_serial ||''|| p.passport_number ||  '-' ||to_char(p.passport_registration_date,'dd.mm.yyyy')|| '-'||p.passport_registration_place|| ':'||p.birth_place,--pasport_info
        --
        p.birthday, p.passport_type, p.passport_registration_place,p.passport_registration_date, 
        p.work_capacity, p.pensionary_registration_place, 
        p.pensionary_registration_date, p.pensionary_certification, p.owned_filial, p.surname, p.surname_inter, 
        p.first_name, p.first_name_inter, p.patronymic, p.gender, p.patronymic_inter, p.passport_end_date, 
        p.inps, p.client_reason, p.death_date, p.archive_date, p.passport_string, p.birth_place, 
        p.temporary_address, p.country_birth, p.country_residence, p.city_residence, p.family_status, 
        p.work_place, p.exist_contract_sign, p.code_word, p.surname_rus, p.first_name_rus, p.patronymic_rus, 
        p.passport_number, p.passport_serial, null/*p.pinfl*/,
        (select dt.name from Dm_S_Verifying_Document_Type dt where dt.Code = p.passport_type) ,
        (select wc.name from Dm_S_Work_Capacity wc where wc.code = p.work_capacity) ,
        (select owf.name from dm_filials_v owf where owf.code = p.owned_filial) ,
        (select gen.name from Dm_S_Subject_Sexual_Identity gen where gen.Code = p.gender) ,
        (select clr.Reason_Name from Dm_S_Client_Reason clr where clr.Code = p.client_reason),
        (select name from Dm_S_Country cn where cn.Code = p.country_birth),
        (select name from Dm_S_Country cn where cn.Code = p.country_residence), 
        null, null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,
        null, null,null,null,null,null,null,null,null,null,null,null,null,null,null
        
     from ibs.client_current t , ibs.client_physical_current p
     where t.id = p.id and t.code_filial = etl_kernel.Get_Etl_Filial
     and p.code_filial = etl_kernel.Get_Etl_Filial
		 and Substr(t.Code, 1, 1) != 'I'
		 and t.typeof not in ('11','09')
		 
     union all
		  select 
        t.code,t.name, t.typeof, t.subject, t.inn, t.address, t.condition, t.resident_code, t.country_code, 
        t.tax_organization_code, t.property_form_code, t.phone, t.fax, t.email, t.operator_code, 
        t.date_validate, t.date_modify, t.code_filial, t.a_client_code, t.id, t.zip_code, t.district_code, 
        t.date_end, t.mobile_phone, t.region_code, t.date_open, t.date_change_condition, t.cell_number, 
        t.web, t.name_inter, t.notice, t.resident_type, t.swift_id,
        (select clt.name from Dm_S_Client_Type clt where clt.code = t.typeof),
        decode(t.typeof, '11', 'I', '08', 'P', 'J') subject_type,
        (select sb.name from Dm_S_Subject_Type sb where sb.Code = decode(t.typeof, '11', '3', '08', '2', '1') ),
        (select cn.name from Dm_S_Client_Condition cn where cn.code = t.condition),
        decode(t.resident_code, '1', 'Резидент','2' , 'Не Резидент') ,
        (select cnt.name from Dm_S_Country cnt where cnt.Code = t.country_code), 
        (select torg.name from Dm_S_Tax_Organization torg where torg.Code = t.tax_organization_code) ,
        (select prf.name from Dm_S_Form_Property prf where prf.Code = t.property_form_code),
        (SELECT EMP.NAME FROM ibs.core_users EMP WHERE EMP.user_id = T.Operator_Code) operator_name,
        (select codf.NAME from dm_filials_v codf where codf.code = t.code_filial),
        (select dis.name from Dm_S_District dis where dis.code = t.district_code) ,
        (select reg.name from Dm_S_Region reg where reg.Code = t.region_code),
        (select swc.name FROM Dm_S_Bank_Corr SWC WHERE SWC.SWIFT_CODE = T.SWIFT_ID),
        (select cm_of.COUNTRY_CODE from dm_cm_s_offshores cm_of where cm_of.COUNTRY_CODE = t.country_code and rownum = 1),
        (select cm.code from dm_cm_s_country cm where cm.code = t.country_code) ,
				null,
				--
				null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,
				null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,
				null,null,null,null,null,null,null,null,
				--
			  organization_head_code, director_name, director_passport, accounter_chief_name, 
				accounter_chief_passport, trade_sign, sector_code, organ_directive_code, registration_place_code, 
				registration_date, registration_document_number, sign_registr, organization_legal_form, 
				address_code, code_juridical_person, inn_header_organization, name_header_organization, 
				bic, main_filial, main_account, business_sign, ref_client, oked, capital_info,
				/*response_activity_type*/ null,
				(select d.name
          from Dm_S_Sector d
         where j.sector_code = d.code) ,
				 (select k.name
          from Dm_S_Organ_Direct k
         where j.organ_directive_code = k.code) ,
				(select l.name
          from Dm_S_Place_Registration l
         where l.code = j.registration_place_code
           and l.filial_code = j.code_filial), 
				(select l.name
          from Dm_S_Organization_Legal_Form l
         where l.code = j.organization_legal_form) ,
				 (select max(q.user_id)
          from ibs.core_users q
         where q.modified_by = j.operator_code),
				(select oke.Namer from Dm_S_Oked oke where oke.Code = j.oked)   ,
				nvl((select a.code_filial from ibs.accounts a where a.client_id = j.id and rownum = 1), t.code_filial) 

			 from ibs.client_current t , ibs.client_juridical_current j
		 where t.id = j.id and t.code_filial = etl_kernel.Get_Etl_Filial
		 and j.code_filial = etl_kernel.Get_Etl_Filial
		 and Substr(t.Code, 1, 1) != 'I'
		 and t.typeof not in ('11'/*,'09'*/)
		 union all
		 select
		    t.code,t.name, t.typeof, t.subject, t.inn, t.address, t.condition, t.resident_code, t.country_code, 
        t.tax_organization_code, t.property_form_code, t.phone, t.fax, t.email, t.operator_code, 
        t.date_validate, t.date_modify, t.code_filial, t.a_client_code, t.id, t.zip_code, t.district_code, 
        t.date_end, t.mobile_phone, t.region_code, t.date_open, t.date_change_condition, t.cell_number, 
        t.web, t.name_inter, t.notice, t.resident_type, t.swift_id,
        (select clt.name from Dm_S_Client_Type clt where clt.code = t.typeof),
        decode(t.typeof, '11', 'I', '08', 'P', 'J') subject_type,
        (select sb.name from Dm_S_Subject_Type sb where sb.Code = decode(t.typeof, '11', '3', '08', '2', '1') ),
        (select cn.name from Dm_S_Client_Condition cn where cn.code = t.condition),
        decode(t.resident_code, '1', 'Резидент','2' , 'Не Резидент') ,
        (select cnt.name from Dm_S_Country cnt where cnt.Code = t.country_code), 
        (select torg.name from Dm_S_Tax_Organization torg where torg.Code = t.tax_organization_code) ,
        (select prf.name from Dm_S_Form_Property prf where prf.Code = t.property_form_code),
        (SELECT EMP.NAME FROM ibs.core_users EMP WHERE EMP.user_id = T.Operator_Code) operator_name,
        (select codf.NAME from dm_filials_v codf where codf.code = t.code_filial),
        (select dis.name from Dm_S_District dis where dis.code = t.district_code) ,
        (select reg.name from Dm_S_Region reg where reg.Code = t.region_code),
        (select swc.name FROM Dm_S_Bank_Corr SWC WHERE SWC.SWIFT_CODE = T.SWIFT_ID),
        (select cm_of.COUNTRY_CODE from dm_cm_s_offshores cm_of where cm_of.COUNTRY_CODE = t.country_code and rownum = 1),
        (select cm.code from dm_cm_s_country cm where cm.code = t.country_code) ,        
        p.passport_serial ||''|| p.passport_number ||  '-' ||to_char(p.passport_registration_date,'dd.mm.yyyy')|| '-'||p.passport_registration_place|| ':'||p.birth_place,--pasport_info
				--
        p.birthday, p.passport_type, p.passport_registration_place,p.passport_registration_date, 
        p.work_capacity, p.pensionary_registration_place, 
        p.pensionary_registration_date, p.pensionary_certification, p.owned_filial, p.surname, p.surname_inter, 
        p.first_name, p.first_name_inter, p.patronymic, p.gender, p.patronymic_inter, p.passport_end_date, 
        p.inps, p.client_reason, p.death_date, p.archive_date, p.passport_string, p.birth_place, 
        p.temporary_address, p.country_birth, p.country_residence, p.city_residence, p.family_status, 
        p.work_place, p.exist_contract_sign, p.code_word, p.surname_rus, p.first_name_rus, p.patronymic_rus, 
        p.passport_number, p.passport_serial, null/*p.pinfl*/,
        (select dt.name from Dm_S_Verifying_Document_Type dt where dt.Code = p.passport_type) ,
        (select wc.name from Dm_S_Work_Capacity wc where wc.code = p.work_capacity) ,
        (select owf.name from dm_filials_v owf where owf.code = p.owned_filial) ,
        (select gen.name from Dm_S_Subject_Sexual_Identity gen where gen.Code = p.gender) ,
        (select clr.Reason_Name from Dm_S_Client_Reason clr where clr.Code = p.client_reason),
        (select name from Dm_S_Country cn where cn.Code = p.country_birth),
        (select name from Dm_S_Country cn where cn.Code = p.country_residence), 
        --
				j.organization_head_code, j.director_name, j.director_passport, j.accounter_chief_name, 
        j.accounter_chief_passport, j.trade_sign, j.sector_code, j.organ_directive_code, j.registration_place_code, 
        j.registration_date, j.registration_document_number, j.sign_registr, j.organization_legal_form, 
        j.address_code, j.code_juridical_person, j.inn_header_organization, j.name_header_organization, 
        j.bic, j.main_filial, j.main_account, j.business_sign, j.ref_client, j.oked, j.capital_info,
        /*response_activity_type*/ null,
        (select d.name
          from Dm_S_Sector d
         where j.sector_code = d.code) ,
         (select k.name
          from Dm_S_Organ_Direct k
         where j.organ_directive_code = k.code) ,
        (select l.name
          from Dm_S_Place_Registration l
         where l.code = j.registration_place_code
           and l.filial_code = j.code_filial), 
        (select l.name
          from Dm_S_Organization_Legal_Form l
         where l.code = j.organization_legal_form) ,
         (select max(q.user_id)
          from ibs.core_users q
         where q.modified_by = j.operator_code),
        (select oke.Namer from Dm_S_Oked oke where oke.Code = j.oked)   ,
        nvl((select a.code_filial from ibs.accounts a where a.client_id = j.id and rownum = 1), t.code_filial) 
     from ibs.client_current t
		 left join ibs.client_physical_current p on t.id = p.id 
		 left join ibs.client_juridical_current j on t.id = j.id
		 where t.code_filial = etl_kernel.Get_Etl_Filial 
		 and Substr(t.Code, 1, 1) != 'I'
		 and t.typeof = '11'
		 
		 /*union all
		 select
        t.code,t.name, t.typeof, t.subject, t.inn, t.address, t.condition, t.resident_code, t.country_code, 
        t.tax_organization_code, t.property_form_code, t.phone, t.fax, t.email, t.operator_code, 
        t.date_validate, t.date_modify, t.code_filial, t.a_client_code, t.id, t.zip_code, t.district_code, 
        t.date_end, t.mobile_phone, t.region_code, t.date_open, t.date_change_condition, t.cell_number, 
        t.web, t.name_inter, t.notice, t.resident_type, t.swift_id,
        (select \*mlm.Cur_Nls*\get_nls_name(dwh_setup.nls_index_get,Cast(clt.name as s_nsi_nvt)) from IBS.S_CLIENT_TYPE clt where clt.code = t.typeof),
        decode(t.typeof, '11', 'I', '08', 'P', 'J') subject_type,
        (select \*mlm.Cur_Nls*\get_nls_name(dwh_setup.nls_index_get,CAST (sb.name as s_nsi_nvt)) from ibs.s_subject_type sb where sb.Code = decode(t.typeof, '11', '3', '08', '2', '1') ),
        (select cn.name from ibs.s_client_condition cn where cn.code = t.condition),
        decode(t.resident_code, '1', 'Резидент','2' , 'Не Резидент') ,
        (select \*mlm.Cur_Nls*\get_nls_name(dwh_setup.nls_index_get,Cast(cnt.name as s_nsi_nvt)) from ibs.s_country cnt where cnt.Code = t.country_code), 
        (select \*mlm.Cur_Nls*\get_nls_name(dwh_setup.nls_index_get,Cast(torg.name as s_nsi_nvt)) from ibs.s_tax_organization torg where torg.Code = t.tax_organization_code) ,
        (select \*mlm.Cur_Nls*\get_nls_name(dwh_setup.nls_index_get,Cast(prf.name as s_nsi_nvt)) from ibs.s_form_property prf where prf.Code = t.property_form_code),
        (SELECT EMP.NAME FROM ibs.core_users EMP WHERE EMP.user_id = T.Operator_Code) operator_name,
        (select codf.NAME from dm_filials_v codf where codf.code = t.code_filial),
        (select get_nls_name(dwh_setup.nls_index_get,cast(dis.name as s_nsi_nvt)) from ibs.s_district dis where dis.code = t.district_code) ,
        (select \*mlm.Cur_Nls*\get_nls_name(dwh_setup.nls_index_get,cast(reg.name as s_nsi_nvt)) from ibs.s_region reg where reg.Code = t.region_code),
        (select get_nls_name(dwh_setup.nls_index_get,cast(Swc.name as s_nsi_nvt)) FROM ibs.S_BANK_CORR SWC WHERE SWC.SWIFT_CODE = T.SWIFT_ID),
        (select cm_of.COUNTRY_CODE from dm_cm_s_offshores cm_of where cm_of.COUNTRY_CODE = t.country_code and rownum = 1),
        (select cm.code from dm_cm_s_country cm where cm.code = t.country_code) ,        
        p.passport_serial ||''|| p.passport_number ||  '-' ||to_char(p.passport_registration_date,'dd.mm.yyyy')|| '-'||p.passport_registration_place|| ':'||p.birth_place,--pasport_info
        --
        p.birthday, p.passport_type, p.passport_registration_place,p.passport_registration_date, 
        p.work_capacity, p.pensionary_registration_place, 
        p.pensionary_registration_date, p.pensionary_certification, p.owned_filial, p.surname, p.surname_inter, 
        p.first_name, p.first_name_inter, p.patronymic, p.gender, p.patronymic_inter, p.passport_end_date, 
        p.inps, p.client_reason, p.death_date, p.archive_date, p.passport_string, p.birth_place, 
        p.temporary_address, p.country_birth, p.country_residence, p.city_residence, p.family_status, 
        p.work_place, p.exist_contract_sign, p.code_word, p.surname_rus, p.first_name_rus, p.patronymic_rus, 
        p.passport_number, p.passport_serial, null\*p.pinfl*\,
        (select \*mlm.Cur_Nls*\get_nls_name(dwh_setup.nls_index_get,Cast(dt.name as s_nsi_nvt)) from ibs.s_verifying_document_type dt where dt.Code = p.passport_type) ,
        (select \*mlm.Cur_Nls*\get_nls_name(dwh_setup.nls_index_get,Cast(wc.name as s_nsi_nvt)) from ibs.s_work_capacity wc where wc.code = p.work_capacity) ,
        (select owf.name from dm_filials_v owf where owf.code = p.owned_filial) ,
        (select \*mlm.Cur_Nls*\get_nls_name(dwh_setup.nls_index_get,cast(gen.name as s_nsi_nvt)) from ibs.s_subject_sexual_identity gen where gen.Code = p.gender) ,
        (select clr.Reason_Name from ibs.s_client_reason clr where clr.Code = p.client_reason),
        (select \*mlm.Cur_Nls*\get_nls_name(dwh_setup.nls_index_get,cast(cn.name  as s_nsi_nvt)) from ibs.s_country cn where cn.Code = p.country_birth),
        (select \*mlm.Cur_Nls*\get_nls_name(dwh_setup.nls_index_get,cast(cn.name as s_nsi_nvt)) from ibs.s_country cn where cn.Code = p.country_residence), 
        --
        j.organization_head_code, j.director_name, j.director_passport, j.accounter_chief_name, 
        j.accounter_chief_passport, j.trade_sign, j.sector_code, j.organ_directive_code, j.registration_place_code, 
        j.registration_date, j.registration_document_number, j.sign_registr, j.organization_legal_form, 
        j.address_code, j.code_juridical_person, j.inn_header_organization, j.name_header_organization, 
        j.bic, j.main_filial, j.main_account, j.business_sign, j.ref_client, j.oked, j.capital_info,
        \*response_activity_type*\ null,
        (select\* mlm.Cur_Nls*\get_nls_name(dwh_setup.nls_index_get,Cast(d.name as s_nsi_nvt))
          from ibs.S_SECTOR d
         where j.sector_code = d.code) ,
         (select \*mlm.Cur_Nls*\get_nls_name(dwh_setup.nls_index_get,Cast(k.name as s_nsi_nvt))
          from ibs.S_ORGAN_DIRECT k
         where j.organ_directive_code = k.code) ,
        (select \*mlm.Cur_Nls*\get_nls_Name(dwh_setup.nls_index_get,Cast(l.name as s_nsi_nvt))
          from IBS.S_PLACE_REGISTRATION l
         where l.code = j.registration_place_code
           and l.filial_code = j.code_filial), 
        (select \*mlm.Cur_Nls*\get_nls_name(dwh_setup.nls_index_get,Cast(l.name as s_nsi_nvt))
          from ibs.S_ORGANIZATION_LEGAL_FORM l
         where l.code = j.organization_legal_form) ,
         (select max(q.user_id)
          from ibs.core_users q
         where q.modified_by = j.operator_code),
        (select oke.Namer from s_oked oke where oke.Code = j.oked)   ,
        nvl((select a.code_filial from ibs.accounts a where a.client_id = j.id and rownum = 1), t.code_filial) 
     from ibs.client_current t
		 left join  ibs.client_physical_current p
		 on t.id = p.id 
		 left join ibs.client_juridical_current j
		 on t.id = j.id
     where  t.code_filial = etl_kernel.Get_Etl_Filial 
     and Substr(t.Code, 1, 1) != 'I'
     and t.typeof = '09'*/
		 ;
		 commit;
		 Write_Log(i_Module_Name => 'FILL_DM_CORE_CLIENTS', i_Log_Type => 'F', i_Text => 'Finished',i_log_id => v_log_id);
   
     exception when others then
      Write_Log(i_Module_Name => 'FILL_DM_CORE_CLIENTS',
                      i_Log_Type => 'E',
                      i_error_txt    => 'Exception : Fil = : ' || etl_kernel.Get_Etl_Filial || ' ' ||
                      Substr(sqlerrm, 1, 2000) || ', stack: ' ||
                      Substr(Dbms_Utility.Format_Error_Backtrace, 1, 1500),i_log_id => v_log_id );
        
		end Fill_Dm_Core_Clients;
	 --Procedure to fill Dm_Tet_Card_Transacts
	 Procedure Fill_Dm_Tet_Card_Transacts  
		 is 
	  v_Time_Beg date := sysdate;
    v_log_id  number(9); 
	 begin
		 Write_Log(i_Module_Name => 'FILL_DM_TET_CARD_TRANSACTS',i_Log_Type =>  'N', i_Text => 'Started',i_filial_code => etl_kernel.Get_Etl_Filial ,i_oper_day =>  etl_kernel.Get_Etl_Day,i_table_name => 'DM_TET_CARD_TRANSACTS',i_log_id => v_log_id);
     
    --delete from table old data
     /* delete DM_TET_CARD_TRANSACTS t
       where t.filial_code = etl_kernel.Get_Etl_Filial
			 --and t.oper_day = etl_kernel.Get_Etl_Day
        ;	*/
			insert into dm_tet_card_transacts(
			    id, 
					filial_code, 
					file_id, 
					docnum, 
					docdate, 
					trandate, 
					card, 
					acquirer_bin, 
					terminal_id, 
					merchant_id, 
					issuer_bin, 
					card_acc, 
					curr_code, 
					sumpay, 
					sumpay_fee, 
					tran_type, 
					branch_code, 
					unlock_row, 
					mcc_code, 
					country_symb, 
					country_code, 
					sumpay_country, 
					curr_country, 
					triad_point_nm, 
					state_id, 
					oper_day, 
					operation_reference, 
					file_in_row_num, 
					ref_tran_oper_link, 
					is_resident, 
					card_id, 
					client_id, 
					contract_id, 
					term_network, 
					load_date_time, 
					card_seq_number, 
					exp_date, 
					cardh_amt, 
					term_type, 
					process_code, 
					stan, 
					pan_entry_mode, 
					retriev_ref_number, 
					frwd_inst_id, 
					auth_code, 
					merch_loc, 
					arn, 
					reason_code, 
					account_type, 
					auth_tran_id, 
					auth_account_amt, 
					local_term, 
					tran_code, 
					transact_type, 
					clearing, 
					msg_seq, 
					partial, 
					member_text, 
					original_id, 
					dispute_id, 
					doc_id, 
					clearing_id, 
					process_class, 
					field1, 
					field2, 
					field3, 
					field4, 
					field5, 
					field6, 
					field7, 
					field8, 
					field9, 
					field10, 
					field11, 
					field12, 
					field13, 
					field14, 
					field15, 
					field16, 
					field17, 
					field18, 
					field19, 
					field20, 
					field21, 
					field22, 
					field23, 
					field24, 
					file_type, 
					embossed_name, 
					balance, 
					description, 
					chip_cond_code, 
					country_name

			)
			select 
		      id, 
					filial_code, 
					file_id, 
					docnum, 
					docdate, 
					trandate, 
					card, 
					acquirer_bin, 
					terminal_id, 
					merchant_id, 
					issuer_bin, 
					card_acc, 
					curr_code, 
					sumpay, 
					sumpay_fee, 
					tran_type, 
					branch_code, 
					unlock_row, 
					mcc_code, 
					country_symb, 
					country_code, 
					sumpay_country, 
					curr_country, 
					triad_point_nm, 
					state_id, 
					oper_day, 
					operation_reference, 
					file_in_row_num, 
					ref_tran_oper_link, 
					is_resident, 
					card_id, 
					client_id, 
					contract_id, 
					term_network, 
					load_date_time, 
					card_seq_number, 
					exp_date, 
					cardh_amt, 
					term_type, 
					process_code, 
					stan, 
					pan_entry_mode, 
					retriev_ref_number, 
					frwd_inst_id, 
					auth_code, 
					merch_loc, 
					arn, 
					reason_code, 
					account_type, 
					auth_tran_id, 
					auth_account_amt, 
					local_term, 
					tran_code, 
					transact_type, 
					clearing, 
					msg_seq, 
					partial, 
					member_text, 
					original_id, 
					dispute_id, 
					doc_id, 
					clearing_id, 
					process_class, 
					/*field1*/null, 
					field2, 
					field3, 
					field4, 
					field5, 
					field6, 
					field7, 
					field8, 
					field9, 
					field10, 
					field11, 
					field12, 
					field13, 
					field14, 
					field15, 
					field16, 
					field17, 
					field18, 
					field19, 
					field20, 
					field21, 
					field22, 
					field23, 
					field24, 
					file_type, 
					embossed_name, 
					balance, 
					description, 
					chip_cond_code, 
					(select a.name from Dm_S_Country a where t.country_code = a.code)
     from ibs.tet_Card_transacts t 
		 where t.filial_code = etl_kernel.Get_Etl_Filial
		 --and t.oper_day = etl_kernel.Get_Etl_Day;
		 ;
	   commit;
		 Write_Log(i_Module_Name => 'FILL_DM_TET_CARD_TRANSACTS', i_Log_Type => 'F', i_Text => 'Finished',i_log_id => v_log_id);
   
     exception when others then
      Write_Log(i_Module_Name => 'FILL_DM_TET_CARD_TRANSACTS',
                      i_Log_Type => 'E',
                      i_error_txt    => 'Exception : Fil = : ' || etl_kernel.Get_Etl_Filial || ' ' ||
                      Substr(sqlerrm, 1, 2000) || ', stack: ' ||
                      Substr(Dbms_Utility.Format_Error_Backtrace, 1, 1500),i_log_id => v_log_id );
       
	 end Fill_Dm_Tet_Card_Transacts;
	 --procedure to fill dm_sv_transacts
	 Procedure Fill_Dm_Sv_Transacts 
		 is  
		v_Time_Beg date := sysdate;
    v_log_id  number(9); 
	 begin
		 Write_Log(i_Module_Name => 'FILL_DM_SV_TRANSACTS',i_Log_Type =>  'N', i_Text => 'Started',i_filial_code => etl_kernel.Get_Etl_Filial ,i_oper_day =>  etl_kernel.Get_Etl_Day,i_table_name => 'DM_SV_TRANSACTS',i_log_id => v_log_id);
     
    --delete from table old data
     /* delete DM_SV_TRANSACTS t
       where t.filial_code = etl_kernel.Get_Etl_Filial
			-- and t.oper_day = etl_kernel.Get_Etl_Day
        ;*/	
		 --
		 insert into dm_sv_transacts 
		 (
		    id, 
				second_part_id, 
				total_id, 
				filial_code, 
				oper_day, 
				object_id, 
				object_reference, 
				type_code, 
				oper_type_id, 
				client_id, 
				client_type_code, 
				contract_id, 
				card_number, 
				indicator, 
				account_type_id, 
				sv_account, 
				account_code, 
				currency_code, 
				amount, 
				transact_date, 
				corresponding_bank_code, 
				transact_group_id, 
				fe_transact_type, 
				bo_transact_type, 
				mcc_code, 
				merchant_id, 
				terminal_id, 
				excise_code, 
				operation_id, 
				operation_reference, 
				file_in_id, 
				file_in_row_num, 
				file_out_id, 
				file_out_row_num, 
				date_execute, 
				state_id, 
				service_id, 
				resource_type_id, 
				object_id_name, 
				type_code_name, 
				oper_type_id_name, 
				account_type_id_name, 
				fe_transact_type_name, 
				operation_id_name, 
				state_name

		 )
		 select 
		    id, 
				second_part_id, 
				total_id, 
				filial_code, 
				oper_day, 
				object_id, 
				object_reference, 
				type_code, 
				oper_type_id, 
				client_id, 
				client_type_code, 
				contract_id, 
				card_number, 
				indicator, 
				account_type_id, 
				sv_account, 
				account_code, 
				currency_code, 
				amount, 
				transact_date, 
				corresponding_bank_code, 
				transact_group_id, 
				fe_transact_type, 
				bo_transact_type, 
				mcc_code, 
				merchant_id, 
				terminal_id, 
				excise_code, 
				operation_id, 
				operation_reference, 
				file_in_id, 
				file_in_row_num, 
				file_out_id, 
				file_out_row_num, 
				date_execute, 
				state_id, 
				service_id, 
				resource_type_id,
				(select b.Name  from Dm_Sv_S_Objects b where b.Id = t.object_id),
				(select ty.name from Dm_Sv_S_Transact_Types ty where ty.code = t.type_code) ,
				(select op.name from Dm_Sv_S_Transact_Oper_Types op where op.Id = t.oper_type_id),
				(select ac.name from Dm_Sv_S_Accounts_Types ac where ac.Id = t.account_type_id),
				(select k.Name  from Dm_Sv_S_Transact_Oper_Types k where k.svfe_code = t.fe_transact_type),
				(select op.name from Dm_Sv_S_Operations op where op.Id = t.operation_id),
				(select Dm_util.Get_SV_Trans_State_Name(ibs.Sv_Const.Cobj_Transact,t.State_Id) from DUAL)

		 from ibs.sv_transacts t 
		 where t.filial_code = etl_kernel.Get_Etl_Filial
		 --and t.oper_day = etl_kernel.Get_Etl_Day
		 
		 union all
		 
		  select 
        id, 
        second_part_id, 
        total_id, 
        filial_code, 
        oper_day, 
        object_id, 
        object_reference, 
        type_code, 
        oper_type_id, 
        client_id, 
        client_type_code, 
        contract_id, 
        card_number, 
        indicator, 
        account_type_id, 
        sv_account, 
        account_code, 
        currency_code, 
        amount, 
        transact_date, 
        corresponding_bank_code, 
        transact_group_id, 
        fe_transact_type, 
        bo_transact_type, 
        mcc_code, 
        merchant_id, 
        terminal_id, 
        excise_code, 
        operation_id, 
        operation_reference, 
        file_in_id, 
        file_in_row_num, 
        file_out_id, 
        file_out_row_num, 
        date_execute, 
        state_id, 
        service_id, 
        resource_type_id,
        (select b.Name  from Dm_Sv_S_Objects b where b.Id = t.object_id),
        (select ty.name from Dm_Sv_S_Transact_Types ty where ty.code = t.type_code) ,
        (select op.name from Dm_Sv_S_Transact_Oper_Types op where op.Id = t.oper_type_id),
        (select ac.name from Dm_Sv_S_Accounts_Types ac where ac.Id = t.account_type_id),
        (select k.Name  from Dm_Sv_S_Transact_Oper_Types k where k.svfe_code = t.fe_transact_type),
        (select op.name from Dm_Sv_S_Operations op where op.Id = t.operation_id),
        (select Dm_util.Get_SV_Trans_State_Name(ibs.Sv_Const.Cobj_Transact,t.State_Id) from DUAL)

     from ibs.sv_transacts_his t 
     where t.filial_code = etl_kernel.Get_Etl_Filial
    -- and t.oper_day = etl_kernel.Get_Etl_Day;
		;
		 commit;
		 Write_Log(i_Module_Name => 'FILL_DM_SV_TRANSACTS', i_Log_Type => 'F', i_Text => 'Finished',i_log_id => v_log_id);
   
     exception when others then
      Write_Log(i_Module_Name => 'FILL_DM_SV_TRANSACTS',
                      i_Log_Type => 'E',
                      i_error_txt    => 'Exception : Fil = : ' || etl_kernel.Get_Etl_Filial || ' ' ||
                      Substr(sqlerrm, 1, 2000) || ', stack: ' ||
                      Substr(Dbms_Utility.Format_Error_Backtrace, 1, 1500),i_log_id => v_log_id );
     
	 end Fill_Dm_Sv_Transacts;
	 --Procedure to fill dm_sv_acc_bals 
 Procedure Fill_Dm_Sv_Acc_Bals
	 is 
	 v_Time_Beg date := sysdate;
   v_log_id  number(9);
 begin
		 Write_Log(i_Module_Name => 'FILL_DM_SV_ACC_BALS',i_Log_Type =>  'N', i_Text => 'Started',i_filial_code => etl_kernel.Get_Etl_Filial ,i_oper_day =>  etl_kernel.Get_Etl_Day,i_table_name => 'DM_SV_ACC_BALS',i_log_id => v_log_id);
     
    --delete from table old data
      /*delete Dm_Sv_Acc_Bals t
       where t.filial_code = etl_kernel.Get_Etl_Filial
			-- and t.oper_day = etl_kernel.Get_Etl_Day
        ;*/
			insert into Dm_Sv_Acc_Bals
			(
			  id, 
				register_id, 
				oper_day, 
				filial_code, 
				client_id, 
				contract_id, 
				type, 
				card_number, 
				account_code, 
				currency_code, 
				indicator, 
				amount, 
				pay_purpose, 
				mode_code, 
				state, 
				file_out, 
				file_row_out, 
				file_in, 
				file_row_in, 
				operation_reference, 
				emp_code, 
				date_modify, 
				send_type, 
				onl_transact_id, 
				parent_contract_id, 
				parent_balance_id

			)
			select 
			  id, 
				register_id, 
				oper_day, 
				filial_code, 
				client_id, 
				contract_id, 
				type, 
				card_number, 
				account_code, 
				currency_code, 
				indicator, 
				amount, 
				pay_purpose, 
				mode_code, 
				state, 
				file_out, 
				file_row_out, 
				file_in, 
				file_row_in, 
				operation_reference, 
				emp_code, 
				date_modify, 
				send_type, 
				onl_transact_id, 
				parent_contract_id, 
				parent_balance_id
     from ibs.sv_account_balances t
		 where t.filial_code = etl_kernel.Get_Etl_Filial
		 --and t.oper_day = etl_kernel.Get_Etl_Day;
		 ;
		commit;
		Write_Log(i_Module_Name => 'FILL_DM_SV_ACC_BALS', i_Log_Type => 'F', i_Text => 'Finished',i_log_id => v_log_id);
   
    exception when others then
      Write_Log(i_Module_Name => 'FILL_DM_SV_ACC_BALS',
                      i_Log_Type => 'E',
                      i_error_txt    => 'Exception : Fil = : ' || etl_kernel.Get_Etl_Filial || ' ' ||
                      Substr(sqlerrm, 1, 2000) || ', stack: ' ||
                      Substr(Dbms_Utility.Format_Error_Backtrace, 1, 1500),i_log_id => v_log_id );
     
				
 end Fill_Dm_Sv_Acc_Bals;
 	 --Procedure to fill dm_vl_leads
	 Procedure Fill_Dm_Vl_Leads
		 is
	 	 v_Time_Beg date := sysdate;
     v_log_id  number(9);
   begin
		 Write_Log(i_Module_Name => 'FILL_DM_VL_LEADS',i_Log_Type =>  'N', i_Text => 'Started',i_filial_code => etl_kernel.Get_Etl_Filial ,i_oper_day =>  etl_kernel.Get_Etl_Day,i_table_name => 'DM_VL_LEADS',i_log_id => v_log_id);
     
    --delete from table old data
      /*delete Dm_Vl_Leads t
       where t.filial_code = etl_kernel.Get_Etl_Filial
			 and t.curr_date = etl_kernel.Get_Etl_Day
        ;*/
     insert into Dm_Vl_Leads 
		 (
		    id, 
				doc_type, 
				object_id, 
				filial_code, 
				lead_id, 
				lead_num, 
				lead_type, 
				lead_date, 
				cl_mfo, 
				cl_acc, 
				cl_name, 
				cl_inn, 
				co_mfo, 
				co_acc, 
				co_name, 
				co_inn, 
				summa, 
				sym_id, 
				purpose_name, 
				origin_sign, 
				step_code, 
				state_id, 
				curr_date, 
				employee_code, 
				date_modify, 
				value_date, 
				parent_doc_type, 
				pay_currency_code, 
				parent_object_id, 
				act_id, 
				maket_id, 
				task_code, 
				purpose_sub_code, 
				swift_code, 
				partner_status, 
				idnk, 
				re_sign, 
				lead_type_name, 
				cl_acc_20, 
				co_acc_20, 
				state_id_name, 
				employee_code_name, 
				act_id_name, 
				idnc
				)
		 select 
		    id, 
				doc_type, 
				object_id, 
				filial_code, 
				lead_id, 
				lead_num, 
				lead_type, 
				lead_date, 
				cl_mfo, 
				cl_acc, 
				cl_name, 
				cl_inn, 
				co_mfo, 
				co_acc, 
				co_name, 
				co_inn, 
				summa, 
				sym_id, 
				purpose_name, 
				origin_sign, 
				step_code, 
				state_id, 
				curr_date, 
				employee_code, 
				date_modify, 
				value_date, 
				parent_doc_type, 
				pay_currency_code, 
				parent_object_id, 
				act_id, 
				maket_id, 
				task_code, 
				purpose_sub_code, 
				swift_code, 
				partner_status, 
				idnk, 
				re_sign,
				(select vt.name from Dm_Vl_S_Lead_Type vt where vt.code = v.lead_type),
				substr(v.cl_acc,8,20),
				substr(v.co_acc,8,20),
				(select vs.name from Dm_Vl_S_Lead_State vs where vs.state_id = v.state_id),
				(select em.Name from ibs.employee_Current em where em.Code = v.employee_code),
				(select va.name from Dm_Vl_S_Lead_Action va where va.act_id = v.act_id) ,
				(select btl.Idnc from ibs.bt_tbl_application btl where btl.message_ref_id = v.object_id and v.state_id = '41'
         and (substr(v.cl_acc,8,5) = '10501' or substr(v.co_acc,8,5) = '10501') and rownum =1
				 union all 
				 select btl.Idnc from ibs.bt_tbl_application_history btl where btl.message_ref_id = v.object_id and v.state_id = '41'
         and (substr(v.cl_acc,8,5) = '10501' or substr(v.co_acc,8,5) = '10501') and rownum =1)

		 from ibs.vl_leads v
		 where v.filial_code = etl_kernel.Get_Etl_Filial
		 and v.curr_date = etl_kernel.Get_Etl_Day
		
		 union all
		 select 
		    id, 
        doc_type, 
        object_id, 
        filial_code, 
        lead_id, 
        lead_num, 
        lead_type, 
        lead_date, 
        cl_mfo, 
        cl_acc, 
        cl_name, 
        cl_inn, 
        co_mfo, 
        co_acc, 
        co_name, 
        co_inn, 
        summa, 
        sym_id, 
        purpose_name, 
        origin_sign, 
        step_code, 
        state_id, 
        curr_date, 
        employee_code, 
        date_modify, 
        value_date, 
        parent_doc_type, 
        pay_currency_code, 
        parent_object_id, 
        act_id, 
        maket_id, 
        task_code, 
        purpose_sub_code, 
        swift_code, 
        partner_status, 
        idnk, 
        re_sign,
        (select vt.name from Dm_Vl_S_Lead_Type vt where vt.code = vh.lead_type),
        substr(vh.cl_acc,8,20),
        substr(vh.co_acc,8,20),
        (select vs.name from Dm_Vl_S_Lead_State vs where vs.state_id = vh.state_id),
        (select em.Name from ibs.employee_Current em where em.Code = vh.employee_code),
        (select va.name from Dm_Vl_S_Lead_Action va where va.act_id = vh.act_id) ,
        (select btl.Idnc from ibs.bt_tbl_application btl where btl.message_ref_id = vh.object_id and vh.state_id = '41'
         and (substr(vh.cl_acc,8,5) = '10501' or substr(vh.co_acc,8,5) = '10501') and rownum =1
				 union all
				 select btl.Idnc from ibs.bt_tbl_application_history btl where btl.message_ref_id = vh.object_id and vh.state_id = '41'
         and (substr(vh.cl_acc,8,5) = '10501' or substr(vh.co_acc,8,5) = '10501') and rownum =1)
		  from ibs.vl_leads_history vh
			where vh.filial_code = etl_kernel.Get_Etl_Filial
			and vh.curr_date = etl_kernel.Get_Etl_Day;
		 
		 commit;
		
		 Write_Log(i_Module_Name => 'FILL_DM_VL_LEADS', i_Log_Type => 'F', i_Text => 'Finished',i_log_id => v_log_id);
   
   exception when others then
      Write_Log(i_Module_Name => 'FILL_DM_VL_LEADS',
                      i_Log_Type => 'E',
                      i_error_txt    => 'Exception : Fil = : ' || etl_kernel.Get_Etl_Filial || ' ' ||
                      Substr(sqlerrm, 1, 2000) || ', stack: ' ||
                      Substr(Dbms_Utility.Format_Error_Backtrace, 1, 1500),i_log_id => v_log_id );
     
	 end Fill_Dm_Vl_Leads;
	 --Procedure to fill Dm_Munis_Payments
	 Procedure Fill_Dm_Munis_Payments
		 is
	 	 v_Time_Beg date := sysdate;
     v_log_id  number(9);
   begin
		 Write_Log(i_Module_Name => 'FILL_DM_MUNIS_PAYMENTS',i_Log_Type =>  'N', i_Text => 'Started',i_filial_code => etl_kernel.Get_Etl_Filial ,i_oper_day =>  etl_kernel.Get_Etl_Day,i_table_name => 'DM_MUNIS_PAYMENTS',i_log_id => v_log_id);
     
    --delete from table old data
      /*delete Dm_Munis_Payments t
       where t.payer_branch = etl_kernel.Get_Etl_Filial
			 and t.sysinfo_data = etl_kernel.Get_Etl_Day
        ;*/
			insert into Dm_Munis_Payments
			( 
			  request_id, 
				sysinfo_sid, 
				sysinfo_data, 
				sysinfo_time, 
				sysinfo_bid, 
				sysinfo_tid, 
				sysinfo_hash, 
				payer_branch, 
				payer_account, 
				payer_name, 
				payer_inn, 
				payee_branch, 
				payee_account, 
				payee_name, 
				payee_inn, 
				purpose_code, 
				purpose_text, 
				amount_currency, 
				amount_value, 
				doc_number, 
				doc_date, 
				settlement_supplier, 
				settlement_code			
			)
			select 
			  t.request_id, 
        t.sysinfo_sid, 
        t.sysinfo_data, 
        t.sysinfo_time, 
        t.sysinfo_bid, 
        t.sysinfo_tid, 
        t.sysinfo_hash, 
        t.payer_branch, 
        t.payer_account, 
        t.payer_name, 
        t.payer_inn, 
        t.payee_branch, 
        t.payee_account, 
        t.payee_name, 
        t.payee_inn, 
        t.purpose_code, 
        t.purpose_text, 
        t.amount_currency, 
        t.amount_value, 
        t.doc_number, 
        t.doc_date, 
        t.settlement_supplier, 
        t.settlement_code 
			from ibs.munis_blank t ,ibs.munis_confirm a
			where t.sysinfo_sid = a.request_id
			and a.code = 0
			and t.payer_branch = etl_kernel.Get_Etl_Filial
			and t.sysinfo_data = etl_kernel.Get_Etl_Day;
			
	 commit;		
	 Write_Log(i_Module_Name => 'FILL_DM_MUNIS_PAYMENTS', i_Log_Type => 'F', i_Text => 'Finished',i_log_id => v_log_id);
   
   exception when others then
      Write_Log(i_Module_Name => 'FILL_DM_MUNIS_PAYMENTS',
                      i_Log_Type => 'E',
                      i_error_txt    => 'Exception : Fil = : ' || etl_kernel.Get_Etl_Filial || ' ' ||
                      Substr(sqlerrm, 1, 2000) || ', stack: ' ||
                      Substr(Dbms_Utility.Format_Error_Backtrace, 1, 1500),i_log_id => v_log_id );
     
	 end Fill_Dm_Munis_Payments;
	 --Procedure to fill Dm_Munis_Receive_Pays
	 Procedure Fill_Dm_Munis_Receive_Pays
		 is
	 	 v_Time_Beg date := sysdate;
     v_log_id  number(9);
   begin
		 Write_Log(i_Module_Name => 'FILL_DM_MUNIS_RECEIVE_PAYS',i_Log_Type =>  'N', i_Text => 'Started',i_filial_code => etl_kernel.Get_Etl_Filial ,i_oper_day =>  etl_kernel.Get_Etl_Day,i_table_name => 'DM_MUNIS_RECEIVE_PAYS',i_log_id => v_log_id);
     
    --delete from table old data
      /*delete Dm_Munis_Receive_Pays t
       where t.payer_branch = etl_kernel.Get_Etl_Filial
			 and t.sysinfo_data = etl_kernel.Get_Etl_Day
        ;*/
		  insert into Dm_Munis_Receive_Pays
			(
			  sysinfo_sid, 
				sysinfo_data, 
				sysinfo_time, 
				sysinfo_bid, 
				sysinfo_tid, 
				sysinfo_hash, 
				payer_branch, 
				payer_account, 
				payer_name, 
				payer_inn, 
				payee_branch, 
				payee_account, 
				payee_name, 
				payee_inn, 
				purpose_code, 
				purpose_text, 
				amount_currency, 
				amount_value, 
				doc_number, 
				doc_date, 
				settlement_supplier, 
				settlement_code, 
				confirm_code, 
				confirm_message, 
				document_id, 
				status, 
				created_on, 
				receive_type, 
				file_id, 
				payment_id
			)
			select 
			  sysinfo_sid, 
        sysinfo_data, 
        sysinfo_time, 
        sysinfo_bid, 
        sysinfo_tid, 
        sysinfo_hash, 
        payer_branch, 
        payer_account, 
        payer_name, 
        payer_inn, 
        payee_branch, 
        payee_account, 
        payee_name, 
        payee_inn, 
        purpose_code, 
        purpose_text, 
        amount_currency, 
        amount_value, 
        doc_number, 
        doc_date, 
        settlement_supplier, 
        settlement_code, 
        confirm_code, 
        confirm_message, 
        document_id, 
        status, 
        created_on, 
        receive_type, 
        file_id, 
        payment_id
			from ibs.munis_receive_payment t
			where t.confirm_code = 0
			and t.payer_branch = etl_kernel.Get_Etl_Filial
			and t.sysinfo_data = etl_kernel.Get_Etl_Day;
			
	 commit;		
	 Write_Log(i_Module_Name => 'FILL_DM_MUNIS_RECEIVE_PAYS', i_Log_Type => 'F', i_Text => 'Finished',i_log_id => v_log_id);
   
   exception when others then
      Write_Log(i_Module_Name => 'FILL_DM_MUNIS_RECEIVE_PAYS',
                      i_Log_Type => 'E',
                      i_error_txt    => 'Exception : Fil = : ' || etl_kernel.Get_Etl_Filial || ' ' ||
                      Substr(sqlerrm, 1, 2000) || ', stack: ' ||
                      Substr(Dbms_Utility.Format_Error_Backtrace, 1, 1500),i_log_id => v_log_id );
     
	 end Fill_Dm_Munis_Receive_Pays;
	 --Procedure to fill Dm_Bt_Applications
	 Procedure Fill_Dm_Bt_Applications
		 is
	 	 v_Time_Beg date := sysdate;
     v_log_id  number(9);
   begin
		 Write_Log(i_Module_Name => 'FILL_DM_BT_APPLICATIONS',i_Log_Type =>  'N', i_Text => 'Started',i_filial_code => etl_kernel.Get_Etl_Filial ,i_oper_day =>  etl_kernel.Get_Etl_Day,i_table_name => 'DM_BT_APPLICATIONS',i_log_id => v_log_id);
     
    --delete from table old data
      /*delete Dm_Bt_Applications t
       where t.filial_code = etl_kernel.Get_Etl_Filial
			 --and t.value_date = etl_kernel.Get_Etl_Day
        ;*/
			insert into Dm_Bt_Applications 
			(
			    id, 
					message_ref_id, 
					operation_code, 
					filial_code, 
					employee_code, 
					customer_name, 
					customer_account, 
					customer_charges_acc, 
					customer_bank_code, 
					customer_bank_name, 
					value_date, 
					currency_code, 
					amount, 
					intermediary_bank_bic, 
					intermediary_bank_name, 
					benificiar_bank_bic, 
					benificiar_bank_name, 
					benificiar_bank_account, 
					benificiar_name, 
					benificiar_account, 
					remittance_information, 
					details_of_charges, 
					info_narrative, 
					info_code_1, 
					info_code_2, 
					info_code_3, 
					info_code_4, 
					info_code_5, 
					info_code_6, 
					info_additional_1, 
					info_additional_2, 
					info_additional_3, 
					info_additional_4, 
					info_additional_5, 
					info_additional_6, 
					urgency, 
					date_modification, 
					client_type, 
					status_id, 
					task_code, 
					purpose_code, 
					purpose_sub_code, 
					sender_charges_currency, 
					sender_charges_amount, 
					currency_33b, 
					amount_33b, 
					intermediary_bank_acc, 
					idnc, 
					eisvo_operation_type, 
					eisvo_fund_number, 
					customer_address, 
					customer_country, 
					customer_inn, 
					is_current_day, 
					comments, 
					partner_status, 
					sign_operation, 
					transfer_type, 
					filial_code_ins_pay, 
					acc_ins_pay, 
					country_code, 
					customer_acc_name, 
					currency_name, 
					currency_char_code, 
					status_name, 
					filial_name, 
					task_name, 
					purpose_code_name, 
					purpose_sub_code_name, 
					partner_status_name, 
					vl_lead_date

			)
			select 
			    id, 
          message_ref_id, 
          operation_code, 
          filial_code, 
          employee_code, 
          customer_name, 
          customer_account, 
          customer_charges_acc, 
          customer_bank_code, 
          customer_bank_name, 
          value_date, 
          currency_code, 
          amount, 
          intermediary_bank_bic, 
          intermediary_bank_name, 
          benificiar_bank_bic, 
          benificiar_bank_name, 
          benificiar_bank_account, 
          benificiar_name, 
          benificiar_account, 
          remittance_information, 
          details_of_charges, 
          info_narrative, 
          info_code_1, 
          info_code_2, 
          info_code_3, 
          info_code_4, 
          info_code_5, 
          info_code_6, 
          info_additional_1, 
          info_additional_2, 
          info_additional_3, 
          info_additional_4, 
          info_additional_5, 
          info_additional_6, 
          urgency, 
          date_modification, 
          client_type, 
          status_id, 
          task_code, 
          purpose_code, 
          purpose_sub_code, 
          sender_charges_currency, 
          sender_charges_amount, 
          currency_33b, 
          amount_33b, 
          intermediary_bank_acc, 
          idnc, 
          eisvo_operation_type, 
          eisvo_fund_number, 
          customer_address, 
          customer_country, 
          customer_inn, 
          is_current_day, 
          comments, 
          partner_status, 
          sign_operation, 
          transfer_type, 
          filial_code_ins_pay, 
          acc_ins_pay, 
          country_code,
 				  (select DM_Util.Get_Account_Name_bycode(t.Customer_Account) from Dual),
					(select Dm_Util.Get_Name(t.Currency_Code) from Dual),
					(select Dm_Util.Get_Char_Code(t.Currency_Code) from Dual),
					(select Dm_util.Get_Appl_State_Name(t.Status_Id) from Dual) ,
					(select name from Dm_S_Bank where Code = t.filial_Code and Rownum = 1),
					(select k.name from Dm_s_Task k where k.Code = t.Task_Code),
					(select name from Dm_S_Transhacc where Code = t.Purpose_Code),
					(select name from Dm_S_Currency_Operations where Code = t.Purpose_Code and Sub_Code = t.Purpose_Sub_Code),
					(select ss.name_ru from Dm_S_Partner_Statuses ss where Code = t.Partner_Status) Partner_Status_Name,
					(select vl.lead_date from ibs.vl_leads vl where vl.object_id = t.message_ref_id and vl.state_id = '41'
           and vl.filial_code = t.filial_code and (substr(vl.cl_acc,8,5) = '10501' or substr(vl.co_acc,8,5) = '10501' and vl.lead_num like 'BT%') /*and rownum =1*/ and trunc(t.date_modification) = vl.lead_date
					 union all
					 select vl.lead_date from ibs.vl_leads_history vl where vl.object_id = t.message_ref_id and vl.state_id = '41'
           and vl.filial_code = t.filial_code and (substr(vl.cl_acc,8,5) = '10501' or substr(vl.co_acc,8,5) = '10501' and vl.lead_num like 'BT%') /*and rownum =1*/ and trunc(t.date_modification) = vl.lead_date					
					 ) 
				
			from ibs.bt_tbl_application t
			where t.filial_code  = etl_kernel.Get_Etl_Filial
			--and t.value_date = etl_kernel.Get_Etl_Day
			union all
			select 
          id, 
          message_ref_id, 
          operation_code, 
          filial_code, 
          employee_code, 
          customer_name, 
          customer_account, 
          customer_charges_acc, 
          customer_bank_code, 
          customer_bank_name, 
          value_date, 
          currency_code, 
          amount, 
          intermediary_bank_bic, 
          intermediary_bank_name, 
          benificiar_bank_bic, 
          benificiar_bank_name, 
          benificiar_bank_account, 
          benificiar_name, 
          benificiar_account, 
          remittance_information, 
          details_of_charges, 
          info_narrative, 
          info_code_1, 
          info_code_2, 
          info_code_3, 
          info_code_4, 
          info_code_5, 
          info_code_6, 
          info_additional_1, 
          info_additional_2, 
          info_additional_3, 
          info_additional_4, 
          info_additional_5, 
          info_additional_6, 
          urgency, 
          date_modification, 
          client_type, 
          status_id, 
          task_code, 
          purpose_code, 
          purpose_sub_code, 
          sender_charges_currency, 
          sender_charges_amount, 
          currency_33b, 
          amount_33b, 
          intermediary_bank_acc, 
          idnc, 
          eisvo_operation_type, 
          eisvo_fund_number, 
          customer_address, 
          customer_country, 
          customer_inn, 
          is_current_day, 
          comments, 
          partner_status, 
          sign_operation, 
          transfer_type, 
          filial_code_ins_pay, 
          acc_ins_pay, 
          country_code,
          (select DM_Util.Get_Account_Name_bycode(t.Customer_Account) from Dual),
          (select Dm_Util.Get_Name(t.Currency_Code) from Dual),
          (select Dm_Util.Get_Char_Code(t.Currency_Code) from Dual),
          (select Dm_util.Get_Appl_State_Name(t.Status_Id) from Dual) ,
          (select name from Dm_S_Bank where Code = t.filial_Code and Rownum = 1),
          (select k.name from Dm_s_Task k where k.Code = t.Task_Code),
          (select name from Dm_S_Transhacc where Code = t.Purpose_Code),
          (select name from Dm_S_Currency_Operations where Code = t.Purpose_Code and Sub_Code = t.Purpose_Sub_Code),
          (select ss.name_ru from Dm_S_Partner_Statuses ss where Code = t.Partner_Status) Partner_Status_Name,
          (select vl.lead_date from ibs.vl_leads vl where vl.object_id = t.message_ref_id and vl.state_id = '41'
           and vl.filial_code = t.filial_code and (substr(vl.cl_acc,8,5) = '10501' or substr(vl.co_acc,8,5) = '10501' and vl.lead_num like 'BT%') /*and rownum =1*/ and trunc(t.date_modification) = vl.lead_date
           union all
           select vl.lead_date from ibs.vl_leads_history vl where vl.object_id = t.message_ref_id and vl.state_id = '41'
           and vl.filial_code = t.filial_code and (substr(vl.cl_acc,8,5) = '10501' or substr(vl.co_acc,8,5) = '10501' and vl.lead_num like 'BT%') /*and rownum =1*/ and trunc(t.date_modification) = vl.lead_date         
           ) 
                  
      from ibs.bt_tbl_application_history t
      where t.filial_code  = etl_kernel.Get_Etl_Filial
     -- and t.value_date = etl_kernel.Get_Etl_Day;
		 ;
	   commit;		
	 Write_Log(i_Module_Name => 'FILL_DM_BT_APPLICATIONS', i_Log_Type => 'F', i_Text => 'Finished',i_log_id => v_log_id);
   
   exception when others then
      Write_Log(i_Module_Name => 'FILL_DM_BT_APPLICATIONS',
                      i_Log_Type => 'E',
                      i_error_txt    => 'Exception : Fil = : ' || etl_kernel.Get_Etl_Filial || ' ' ||
                      Substr(sqlerrm, 1, 2000) || ', stack: ' ||
                      Substr(Dbms_Utility.Format_Error_Backtrace, 1, 1500),i_log_id => v_log_id );
     
	 end Fill_Dm_Bt_Applications;
	 -----------------
	 --Procedure to fill Dm_Bt_Messages
	 Procedure Fill_Dm_Bt_Messages
		is
	 	 v_Time_Beg date := sysdate;
     v_log_id  number(9);
   begin
		 Write_Log(i_Module_Name => 'FILL_DM_BT_MESSAGES',i_Log_Type =>  'N', i_Text => 'Started',i_filial_code => etl_kernel.Get_Etl_Filial ,i_oper_day =>  etl_kernel.Get_Etl_Day,i_table_name => 'DM_BT_MESSAGES',i_log_id => v_log_id);
     
    --delete from table old data
     /* delete Dm_Bt_Messages t
       where t.filial_code = etl_kernel.Get_Etl_Filial
			 --and t.value_date = etl_kernel.Get_Etl_Day
        ;*/
			insert into Dm_Bt_Messages 
			 (
			    id, 
					parent, 
					parent_content, 
					senders_bic, 
					reciver_bic, 
					mt_number, 
					direction, 
					m_reference, 
					r_reference, 
					link, 
					value_date, 
					currency, 
					amount, 
					status, 
					employee_code, 
					filial_code, 
					m_level, 
					lead_id, 
					condition, 
					reg_date, 
					country_code

			 )
			 select 
			    id, 
					parent, 
					parent_content, 
					senders_bic, 
					reciver_bic, 
					mt_number, 
					direction, 
					m_reference, 
					r_reference, 
					link, 
					value_date, 
					currency, 
					amount, 
					status, 
					employee_code, 
					filial_code, 
					m_level, 
					lead_id, 
					condition, 
					reg_date, 
					country_code
       from ibs.bt_tbl_messages t
			 where t.filial_code = etl_kernel.Get_Etl_Filial
			 --and t.value_date = etl_kernel.Get_Etl_Day
			 
			 union all
			 
			 select 
          id, 
          parent, 
          parent_content, 
          senders_bic, 
          reciver_bic, 
          mt_number, 
          direction, 
          m_reference, 
          r_reference, 
          link, 
          value_date, 
          currency, 
          amount, 
          status, 
          employee_code, 
          filial_code, 
          m_level, 
          lead_id, 
          condition, 
          reg_date, 
          country_code
       from ibs.bt_tbl_messages_history t
       where t.filial_code = etl_kernel.Get_Etl_Filial
       --and t.value_date = etl_kernel.Get_Etl_Day
			 ;
			 
			 commit;		
	     Write_Log(i_Module_Name => 'FILL_DM_BT_MESSAGES', i_Log_Type => 'F', i_Text => 'Finished',i_log_id => v_log_id);
   
     exception when others then
       Write_Log(i_Module_Name => 'FILL_DM_BT_MESSAGES',
                      i_Log_Type => 'E',
                      i_error_txt    => 'Exception : Fil = : ' || etl_kernel.Get_Etl_Filial || ' ' ||
                      Substr(sqlerrm, 1, 2000) || ', stack: ' ||
                      Substr(Dbms_Utility.Format_Error_Backtrace, 1, 1500),i_log_id => v_log_id );
     
	 end Fill_Dm_Bt_Messages; 	 
	 --Procedure to fill dm_sw_msgfields
	 Procedure Fill_Dm_Sw_Msgfields
		is
	 	 v_Time_Beg date := sysdate;
     v_log_id  number(9);
   begin
		 Write_Log(i_Module_Name => 'FILL_DM_SW_MSGFIELDS',i_Log_Type =>  'N', i_Text => 'Started',i_table_name => 'DM_SW_MSGFIELDS',i_log_id => v_log_id);
     
    --delete from table old data
      --execute immediate 'truncate table Dm_Sw_MsgFields';
      insert into Dm_Sw_Msgfields
			(
			  ref_m_id, 
				fldname, 
				fldpartname, 
				flddatalen, 
				flddata1, 
				flddata2, 
				flddata3, 
				flddata4, 
				flddata5, 
				flddata6, 
				flddata7, 
				flddata8, 
				flddata9, 
				mt_name

			)
			select 
			  ref_m_id, 
        fldname, 
        fldpartname, 
        flddatalen, 
        flddata1, 
        flddata2, 
        flddata3, 
        flddata4, 
        flddata5, 
        flddata6, 
        flddata7, 
        flddata8, 
        flddata9, 
        mt_name
			from ibs.sw_tbl_msgfields t ;
        
	 commit;		
	   Write_Log(i_Module_Name => 'FILL_DM_SW_MSGFIELDS', i_Log_Type => 'F', i_Text => 'Finished',i_log_id => v_log_id);
   
   exception when others then
     Write_Log(i_Module_Name => 'FILL_DM_SW_MSGFIELDS',
                      i_Log_Type => 'E',
                      i_error_txt    => 'Exception : ' ||  Substr(sqlerrm, 1, 2000) || ', stack: ' ||
                      Substr(Dbms_Utility.Format_Error_Backtrace, 1, 1500),i_log_id => v_log_id );
     
	 end Fill_Dm_Sw_Msgfields; 
	 --Procedure to fill Dm_Mr_Deals
	 Procedure Fill_Dm_Mr_Deals
    is
     v_Time_Beg date := sysdate;
     v_log_id  number(9);
   begin
     Write_Log(i_Module_Name => 'FILL_DM_MR_DEALS',i_Log_Type =>  'N', i_Text => 'Started',i_oper_day => etl_kernel.Get_Etl_Day, i_filial_code => etl_kernel.Get_Etl_Filial,i_table_name => 'DM_MR_DEALS',i_log_id => v_log_id);
     
    --delete from table old data
     /*delete Dm_Mr_Deals t
       where t.filial_code = etl_kernel.Get_Etl_Filial
			 --and t.deal_date = etl_kernel.Get_Etl_Day
        ; */
		 insert into Dm_Mr_Deals
		 (
		    sys_deal_id, 
				id, 
				filial_code, 
				local_code, 
				slip_code, 
				operation_id, 
				client_id, 
				client_code, 
				client_account, 
				transfer_id, 
				external_id, 
				mtcn, 
				deal_date, 
				value_date, 
				state_id, 
				is_online, 
				sync_flag, 
				direction_id, 
				country_code, 
				city, 
				cor_last_name, 
				cor_first_name, 
				cor_patronymic, 
				cor_phone, 
				cor_doc_type, 
				cor_doc_serial, 
				cor_doc_number, 
				cor_address, 
				cor_birth_date, 
				cor_birth_place, 
				cor_inn, 
				cor_account, 
				cor_citizenship, 
				cor_doc_reg_date, 
				cor_doc_reg_place, 
				sum_transfer, 
				currency_code, 
				sum_equival, 
				sum_comission, 
				comission_type, 
				comission_currency, 
				sum_remuneration, 
				use_cash, 
				sum_via_cash, 
				convert_saldo, 
				mess2reciever, 
				date_modify, 
				emp_code, 
				remuneration_type, 
				remuneration_curr, 
				client_sum_account, 
				sum_conversion, 
				sum_conv_eqv, 
				sum_conv_eqv_type, 
				parent_sys_deal_id, 
				is_mobile, 
				card_number, 
				pph_code

		 )
		 select 
		    sys_deal_id, 
        id, 
        filial_code, 
        local_code, 
        slip_code, 
        operation_id, 
        client_id, 
        client_code, 
        client_account, 
        transfer_id, 
        external_id, 
        mtcn, 
        deal_date, 
        value_date, 
        state_id, 
        is_online, 
        sync_flag, 
        direction_id, 
        country_code, 
        city, 
        cor_last_name, 
        cor_first_name, 
        cor_patronymic, 
        cor_phone, 
        cor_doc_type, 
        cor_doc_serial, 
        cor_doc_number, 
        cor_address, 
        cor_birth_date, 
        cor_birth_place, 
        cor_inn, 
        cor_account, 
        cor_citizenship, 
        cor_doc_reg_date, 
        cor_doc_reg_place, 
        sum_transfer, 
        currency_code, 
        sum_equival, 
        sum_comission, 
        comission_type, 
        comission_currency, 
        sum_remuneration, 
        use_cash, 
        sum_via_cash, 
        convert_saldo, 
        mess2reciever, 
        date_modify, 
        emp_code, 
        remuneration_type, 
        remuneration_curr, 
        client_sum_account, 
        sum_conversion, 
        sum_conv_eqv, 
        sum_conv_eqv_type, 
        parent_sys_deal_id, 
        is_mobile, 
        card_number, 
        pph_code
		 from ibs.mr_deals t 
		 where t.filial_code = etl_kernel.Get_Etl_Filial
		 --and t.deal_date = etl_kernel.Get_Etl_Day
		 and t.state_id = 2
		 union all 
		 
		 select 
		 sys_deal_id, 
        id, 
        filial_code, 
        local_code, 
        slip_code, 
        operation_id, 
        client_id, 
        client_code, 
        client_account, 
        transfer_id, 
        external_id, 
        mtcn, 
        deal_date, 
        value_date, 
        state_id, 
        is_online, 
        sync_flag, 
        direction_id, 
        country_code, 
        city, 
        cor_last_name, 
        cor_first_name, 
        cor_patronymic, 
        cor_phone, 
        cor_doc_type, 
        cor_doc_serial, 
        cor_doc_number, 
        cor_address, 
        cor_birth_date, 
        cor_birth_place, 
        cor_inn, 
        cor_account, 
        cor_citizenship, 
        cor_doc_reg_date, 
        cor_doc_reg_place, 
        sum_transfer, 
        currency_code, 
        sum_equival, 
        sum_comission, 
        comission_type, 
        comission_currency, 
        sum_remuneration, 
        use_cash, 
        sum_via_cash, 
        convert_saldo, 
        mess2reciever, 
        date_modify, 
        emp_code, 
        remuneration_type, 
        remuneration_curr, 
        client_sum_account, 
        sum_conversion, 
        sum_conv_eqv, 
        sum_conv_eqv_type, 
        parent_sys_deal_id, 
        is_mobile, 
        card_number, 
        pph_code
		 from ibs.Mr_Deals_Hist t 
		 where t.filial_code = etl_kernel.Get_Etl_Filial
		 --and t.deal_date = etl_kernel.Get_Etl_Day
		 and t.state_id = 2;
		 commit;    
     Write_Log(i_Module_Name => 'FILL_DM_MR_DEALS', i_Log_Type => 'F', i_Text => 'Finished',i_log_id => v_log_id);
   
   exception when others then
     Write_Log(i_Module_Name => 'FILL_DM_MR_DEALS',
                      i_Log_Type => 'E',
                      i_error_txt    => 'Exception : Fil :' || etl_kernel.Get_Etl_Filial || ' ' ||  Substr(sqlerrm, 1, 2000) || ', stack: ' ||
                      Substr(Dbms_Utility.Format_Error_Backtrace, 1, 1500),i_log_id => v_log_id );
     
   end Fill_Dm_Mr_Deals;
	 --Procedure to fill Dm_Ib_Mobile_Pays;
	 Procedure Fill_Dm_Ib_Mobile_Pays
    is
     v_Time_Beg date := sysdate;
     v_log_id  number(9);
   begin
     Write_Log(i_Module_Name => 'FILL_DM_IB_MOBILE_PAYS',i_Log_Type =>  'N', i_Text => 'Started',i_oper_day => etl_kernel.Get_Etl_Day, i_filial_code => etl_kernel.Get_Etl_Filial,i_table_name => 'DM_IB_MOBILE_PAYS', i_log_id => v_log_id);
     
    --delete from table old data
    /* delete Dm_Ib_Mobile_Pays t
       where t.filial_code = etl_kernel.Get_Etl_Filial
       --and trunc(t.create_date) = etl_kernel.Get_Etl_Day
        ; */
     /*insert into Dm_Ib_Mobile_Pays 
     (
        id, 
        create_date, 
        filial_code, 
        payment_type, 
        client_id, 
        account_id, 
        currency_code, 
        service_type, 
        provider_id, 
        contract_id, 
        provider_acc, 
        provider_dept, 
        provider_trans_id, 
        provider_date_birth, 
        amount, 
        provider_amount, 
        commission_amount, 
        detail_code, 
        state, 
        register_id, 
        date_birth, 
        date_modify, 
        account_type, 
        payment_type_name, 
        service_type_name, 
        provider_name, 
        state_name, 
        receiver
      )
      SELECT 
        id, 
        create_date, 
        filial_code, 
        payment_type, 
        client_id, 
        account_id, 
        currency_code, 
        service_type, 
        provider_id, 
        contract_id, 
        provider_acc, 
        provider_dept, 
        provider_trans_id, 
        provider_date_birth, 
        amount, 
        provider_amount, 
        commission_amount, 
        detail_code, 
        state, 
        register_id, 
        date_birth, 
        date_modify, 
        account_type, 
        (select substr(dm_util.Get_Ib_Payment_Type_Name(PAYMENT_TYPE),1,100) from dual),
        (select dm_util.Get_Ib_Service_Type_Name(SERVICE_TYPE) from dual),
        (select dm_util.Get_IB_Provider_Name(PROVIDER_ID) from dual),
        (select dm_util.Get_IB_Obj_State_Name('PAYMENTS', STATE) from dual) ,
        (select Dm_Util.Get_IB_Payment_Receiver(t.Id)
                  from Dual)
        
      
    from ibs.ib_payments t 
    where t.filial_Code = etl_kernel.Get_Etl_Filial
    --and trunc(t.create_date) = etl_kernel.Get_Etl_Day
   
   union all
    SELECT 
        id, 
        create_date, 
        filial_code, 
        payment_type, 
        client_id, 
        account_id, 
        currency_code, 
        service_type, 
        provider_id, 
        contract_id, 
        provider_acc, 
        provider_dept, 
        provider_trans_id, 
        provider_date_birth, 
        amount, 
        provider_amount, 
        commission_amount, 
        detail_code, 
        state, 
        register_id, 
        date_birth, 
        date_modify, 
        account_type, 
        (select substr(dm_util.Get_Ib_Payment_Type_Name(PAYMENT_TYPE),1,100) from dual),
        (select dm_util.Get_Ib_Service_Type_Name(SERVICE_TYPE) from dual),
        (select dm_util.Get_IB_Provider_Name(PROVIDER_ID) from dual),
        (select dm_util.Get_IB_Obj_State_Name('PAYMENTS', STATE) from dual) ,
        (select Dm_Util.Get_IB_Payment_Receiver(t.Id)
                  from Dual)
        
      
    from ibs.ib_payments_his t 
    where t.filial_Code = etl_kernel.Get_Etl_Filial
    --and trunc(t.create_date) = etl_kernel.Get_Etl_Day;
		;*/
	 commit;    
     Write_Log(i_Module_Name => 'FILL_DM_IB_MOBILE_PAYS', i_Log_Type => 'F', i_Text => 'Finished',i_log_id => v_log_id);
   
   exception when others then
     Write_Log(i_Module_Name => 'FILL_DM_IB_MOBILE_PAYS',
                      i_Log_Type => 'E',
                      i_error_txt    => 'Exception : Fil :' || etl_kernel.Get_Etl_Filial || ' ' ||  Substr(sqlerrm, 1, 2000) || ', stack: ' ||
                      Substr(Dbms_Utility.Format_Error_Backtrace, 1, 1500),i_log_id => v_log_id );
     
   end Fill_Dm_Ib_Mobile_Pays;
	 --Procedure to fill Dm_Ib_Transacts
	 Procedure Fill_Dm_Ib_Transacts
    is
     v_Time_Beg date := sysdate;
     v_log_id  number(9);
   begin
     Write_Log(i_Module_Name => 'FILL_DM_IB_TRANSACTS',i_Log_Type =>  'N', i_Text => 'Started',i_oper_day => etl_kernel.Get_Etl_Day, i_filial_code => etl_kernel.Get_Etl_Filial,i_table_name => 'DM_IB_TRANSACTS',i_log_id => v_log_id);
     
    --delete from table old data
     /*delete Dm_Ib_Transacts t
       where t.filial_code = etl_kernel.Get_Etl_Filial
      -- and t.curr_day = etl_kernel.Get_Etl_Day
        ; */
		  /*insert into Dm_Ib_Transacts 
     (  
        id, 
        filial_code, 
        create_date, 
        object_code, 
        object_id, 
        template_code, 
        dt_mfo, 
        dt_acc, 
        dt_name, 
        dt_inn, 
        ct_mfo, 
        ct_acc, 
        ct_name, 
        ct_inn, 
        currency_code, 
        sum_pay, 
        pay_purpose, 
        sign_manual, 
        state, 
        curr_day, 
        doc_numb, 
        doc_date, 
        trans_id, 
        lead_id, 
        lead_act_id, 
        lead_state_id, 
        lead_sym_id, 
        task_code, 
        date_birth, 
        date_modify
      )
   select 
        id, 
        filial_code, 
        create_date, 
        object_code, 
        object_id, 
        template_code, 
        dt_mfo, 
        dt_acc, 
        dt_name, 
        dt_inn, 
        ct_mfo, 
        ct_acc, 
        ct_name, 
        ct_inn, 
        currency_code, 
        sum_pay, 
        pay_purpose, 
        sign_manual, 
        state, 
        curr_day, 
        doc_numb, 
        doc_date, 
        trans_id, 
        lead_id, 
        lead_act_id, 
        lead_state_id, 
        lead_sym_id, 
        task_code, 
        date_birth, 
        date_modify
    from ibs.ib_transacts t 
    where t.filial_code = etl_kernel.Get_Etl_Filial 
    --and t.curr_day = etl_kernel.Get_Etl_Day 
    union all
    select 
        id, 
        filial_code, 
        create_date, 
        object_code, 
        object_id, 
        template_code, 
        dt_mfo, 
        dt_acc, 
        dt_name, 
        dt_inn, 
        ct_mfo, 
        ct_acc, 
        ct_name, 
        ct_inn, 
        currency_code, 
        sum_pay, 
        pay_purpose, 
        sign_manual, 
        state, 
        curr_day, 
        doc_numb, 
        doc_date, 
        trans_id, 
        lead_id, 
        lead_act_id, 
        lead_state_id, 
        lead_sym_id, 
        task_code, 
        date_birth, 
        date_modify
    from ibs.ib_transacts_his t 
    where t.filial_code = etl_kernel.Get_Etl_Filial 
    --and t.curr_day = etl_kernel.Get_Etl_Day;
		;*/
	 commit;    
     Write_Log(i_Module_Name => 'FILL_DM_IB_TRANSACTS', i_Log_Type => 'F', i_Text => 'Finished',i_log_id => v_log_id);
   
   exception when others then
     Write_Log(i_Module_Name => 'FILL_DM_IB_TRANSACTS',
                      i_Log_Type => 'E',
                      i_error_txt    => 'Exception : Fil :' || etl_kernel.Get_Etl_Filial || ' ' ||  Substr(sqlerrm, 1, 2000) || ', stack: ' ||
                      Substr(Dbms_Utility.Format_Error_Backtrace, 1, 1500),i_log_id => v_log_id );
     
   end Fill_Dm_Ib_Transacts;
	 --Procedure to fill Dm_Gl_Card_Transacts
	 Procedure Fill_Dm_Gl_Card_Transacts 
    is
     v_Time_Beg date := sysdate;
     v_log_id  number(9);
   begin
     Write_Log(i_Module_Name => 'FILL_DM_GL_CARD_TRANSACTS',i_Log_Type =>  'N', i_Text => 'Started',i_oper_day => etl_kernel.Get_Etl_Day, i_filial_code => etl_kernel.Get_Etl_Filial,i_table_name => 'DM_GL_CARD_TRANSACTS',i_log_id => v_log_id);
     
    --delete from table old data
     /*delete Dm_Gl_Card_Transacts t
       where t.filial_code = etl_kernel.Get_Etl_Filial
      -- and t.oper_day = etl_kernel.Get_Etl_Day
        ; */
		 insert into Dm_Gl_Card_Transacts 
		 (
		    id, 
				filial_code, 
				oper_day, 
				record_type, 
				line_number, 
				client, 
				card_acct2, 
				accnt_ccy, 
				card_num, 
				slip_nr, 
				ref_number, 
				tran_date_time, 
				rec_date, 
				post_date, 
				deal_desc, 
				tran_type, 
				deb_cred, 
				tran_ccy, 
				tran_amt, 
				accnt_amt, 
				terminal, 
				mcc_code, 
				merchant, 
				abvr_name, 
				country, 
				city, 
				proc_id, 
				internal_no, 
				product, 
				iss_mfo, 
				term_id, 
				tranz_acct, 
				operation_reference, 
				file_in_row_num, 
				ref_file_id, 
				state_id, 
				bank_level, 
				interbank_total_amount_id, 
				tr_code, 
				tr_fee, 
				tr_code2, 
				tr_fee2, 
				tr_code3, 
				tr_fee3, 
				tr_code4, 
				tr_fee4, 
				tr_code5, 
				tr_fee5, 
				transact_total_amount_id, 
				ibs_client_id, 
				card_acct, 
				card, 
				tran_type_name, 
				terminal_id, 
				merchant_id, 
				state_name

		 
		 )
		 select 
		    id, 
				filial_code, 
				oper_day, 
				record_type, 
				line_number, 
				client, 
				card_acct, 
				accnt_ccy, 
				card, 
				slip_nr, 
				ref_number, 
				tran_date_time, 
				rec_date, 
				post_date, 
				deal_desc, 
				tran_type, 
				deb_cred, 
				tran_ccy, 
				tran_amt, 
				accnt_amt, 
				terminal, 
				mcc_code, 
				merchant, 
				abvr_name, 
				country, 
				city, 
				proc_id, 
				internal_no, 
				product, 
				iss_mfo, 
				term_id, 
				tranz_acct, 
				operation_reference, 
				file_in_row_num, 
				ref_file_id, 
				state_id, 
				bank_level, 
				interbank_total_amount_id, 
				tr_code, 
				tr_fee, 
				tr_code2, 
				tr_fee2, 
				tr_code3, 
				tr_fee3, 
				tr_code4, 
				tr_fee4, 
				tr_code5, 
				tr_fee5, 
				transact_total_amount_id,
				(select cl.client_id from ibs.gl_clients cl where cl.gl_client_code = t.client),
        (select substr(a.account_code , -20) from ibs.gl_accounts a where a.gl_account =  t.card_acct and rownum =1 ) ,
        (select c.card_number from ibs.gl_cards  c  where  c.gl_card_acct = t.card_acct and    rownum = 1),
        (select t.tran_type||' - '||tt.notes from Dm_Gl_S_File_Transact_Types tt where tt.tran_type_code = t.tran_type) ,
        Dm_Util.Get_Gl_Terminal_Id(t.term_id),
        Dm_Util.Get_GL_Merchant_Id(t.term_id),
        (select dm_util.Get_Gl_Object_State_Name(14,t.state_id) from dual)

		  
		 from ibs.gl_card_transacts t 
		 where t.filial_code = etl_kernel.Get_Etl_Filial 
		-- and t.oper_day = etl_kernel.Get_Etl_Day
		
		 union all
		 select 
		    id, 
        filial_code, 
        oper_day, 
        record_type, 
        line_number, 
        client, 
        card_acct, 
        accnt_ccy, 
        card, 
        slip_nr, 
        ref_number, 
        tran_date_time, 
        rec_date, 
        post_date, 
        deal_desc, 
        tran_type, 
        deb_cred, 
        tran_ccy, 
        tran_amt, 
        accnt_amt, 
        terminal, 
        mcc_code, 
        merchant, 
        abvr_name, 
        country, 
        city, 
        proc_id, 
        internal_no, 
        product, 
        iss_mfo, 
        term_id, 
        tranz_acct, 
        operation_reference, 
        file_in_row_num, 
        ref_file_id, 
        state_id, 
        bank_level, 
        interbank_total_amount_id, 
        tr_code, 
        tr_fee, 
        tr_code2, 
        tr_fee2, 
        tr_code3, 
        tr_fee3, 
        tr_code4, 
        tr_fee4, 
        tr_code5, 
        null, 
        transact_total_amount_id,
			  (select cl.client_id from ibs.gl_clients cl where cl.gl_client_code = t.client),
        (select substr(a.account_code , -20) from ibs.gl_accounts a where a.gl_account =  t.card_acct and rownum =1 ) ,
        (select c.card_number from ibs.gl_cards  c  where  c.gl_card_acct = t.card_acct and    rownum = 1),
        (select t.tran_type||' - '||tt.notes from Dm_Gl_S_File_Transact_Types tt where tt.tran_type_code = t.tran_type) ,
        Dm_Util.Get_Gl_Terminal_Id(t.term_id),
        Dm_Util.Get_GL_Merchant_Id(t.term_id),
        (select dm_util.Get_Gl_Object_State_Name(14,t.state_id) from dual)
		 from ibs.gl_card_transacts_h t 
		 where t.filial_code = etl_kernel.Get_Etl_Filial 
		-- and t.oper_day = etl_kernel.Get_Etl_Day;
		 ;
		 
	 commit;    
     Write_Log(i_Module_Name => 'FILL_DM_GL_CARD_TRANSACTS', i_Log_Type => 'F', i_Text => 'Finished',i_log_id => v_log_id);
   
   exception when others then
     Write_Log(i_Module_Name => 'FILL_DM_GL_CARD_TRANSACTS',
                      i_Log_Type => 'E',
                      i_error_txt    => 'Exception : Fil :' || etl_kernel.Get_Etl_Filial || ' ' ||  Substr(sqlerrm, 1, 2000) || ', stack: ' ||
                      Substr(Dbms_Utility.Format_Error_Backtrace, 1, 1500),i_log_id => v_log_id );
     
   end Fill_Dm_Gl_Card_Transacts;
	 --Procedure to Fill Dm_Gl_Term_Transacts
	 Procedure Fill_Dm_Gl_Term_Transacts
    is
     v_Time_Beg date := sysdate;
     v_log_id  number(9);
   begin
     Write_Log(i_Module_Name => 'FILL_DM_GL_TERM_TRANSACTS',i_Log_Type =>  'N', i_Text => 'Started',i_oper_day => etl_kernel.Get_Etl_Day, i_filial_code => etl_kernel.Get_Etl_Filial,i_table_name => 'DM_GL_TERM_TRANSACTS',i_log_id => v_log_id);
     
    --delete from table old data
     /*delete Dm_Gl_Term_Transacts t
       where t.filial_code = etl_kernel.Get_Etl_Filial
      -- and t.oper_day = etl_kernel.Get_Etl_Day
        ; */
	   insert into Dm_Gl_Term_Transacts 
		 ( 
		    id, 
				filial_code, 
				oper_day, 
				mtid, 
				rec_centr, 
				send_centr, 
				iss_cmi, 
				send_cmi, 
				settl_cmi, 
				acq_bank, 
				acq_branch, 
				member_code, 
				clearing_group, 
				acceptor_id, 
				batch_nr, 
				slip_nr, 
				card, 
				exp_date, 
				tran_date_time, 
				tran_type, 
				appr_code, 
				appr_src, 
				stan, 
				ref_number, 
				amount, 
				cash_back, 
				fee, 
				currency, 
				ccy_exp, 
				sb_amount, 
				sb_cshback, 
				sb_fee, 
				sbnk_ccy, 
				sb_ccyexp, 
				sb_cnvrate, 
				sb_cnvdate, 
				i_amount, 
				i_cshback, 
				i_fee, 
				ibnk_ccy, 
				i_ccyexp, 
				i_cnvrate, 
				i_cnvdate, 
				abvr_name, 
				city, 
				country, 
				point_code, 
				mcc_code, 
				terminal, 
				batch_id, 
				settl_nr, 
				settl_date, 
				acqref_nr, 
				file_id, 
				ms_number, 
				file_date, 
				source_algorithm, 
				field_reserv, 
				term_nr, 
				ecmc_fee, 
				tran_info, 
				pr_amount, 
				pr_cshback, 
				pr_fee, 
				prnk_ccy, 
				pr_ccyexp, 
				pr_cnvrate, 
				pr_cnvdate, 
				region_code, 
				card_type, 
				proc_class, 
				card_seq_nr, 
				msg_type, 
				org_msg_type, 
				proc_code, 
				msg_category, 
				merchant, 
				moto_ind, 
				susp_status, 
				transact_row, 
				authoriz_row, 
				fld_043, 
				fld_098, 
				fld_102, 
				fld_103, 
				fld_104, 
				fld_039, 
				fld_sh6, 
				batch_date, 
				tr_fee, 
				fld_040, 
				fld_123_1, 
				epi_42_48, 
				fld_003, 
				msc, 
				account_nr, 
				epi_42_48_full, 
				other_code, 
				fld_015, 
				fld_095, 
				audit_date, 
				other_fee1, 
				other_fee2, 
				other_fee3, 
				other_fee4, 
				other_fee5, 
				operation_reference, 
				file_in_row_num, 
				ref_file_id, 
				state_id, 
				bank_level, 
				interbank_total_amount_id, 
				transact_total_amount_id, 
				transact_date, 
				transact_time, 
				tran_type_name, 
				terminal_id, 
				merchant_id, 
				state_name, 
				type_oper

		 
		 )
		 select 
		    id, 
				filial_code, 
				oper_day, 
				mtid, 
				rec_centr, 
				send_centr, 
				iss_cmi, 
				send_cmi, 
				settl_cmi, 
				acq_bank, 
				acq_branch, 
				member_code, 
				clearing_group, 
				acceptor_id, 
				batch_nr, 
				slip_nr, 
				card, 
				exp_date, 
				tran_date_time, 
				tran_type, 
				appr_code, 
				appr_src, 
				stan, 
				ref_number, 
				amount, 
				cash_back, 
				fee, 
				currency, 
				ccy_exp, 
				sb_amount, 
				sb_cshback, 
				sb_fee, 
				sbnk_ccy, 
				sb_ccyexp, 
				sb_cnvrate, 
				sb_cnvdate, 
				i_amount, 
				i_cshback, 
				i_fee, 
				ibnk_ccy, 
				i_ccyexp, 
				i_cnvrate, 
				i_cnvdate, 
				abvr_name, 
				city, 
				country, 
				point_code, 
				mcc_code, 
				terminal, 
				batch_id, 
				settl_nr, 
				settl_date, 
				acqref_nr, 
				file_id, 
				ms_number, 
				file_date, 
				source_algorithm, 
				field_reserv, 
				term_nr, 
				ecmc_fee, 
				tran_info, 
				pr_amount, 
				pr_cshback, 
				pr_fee, 
				prnk_ccy, 
				pr_ccyexp, 
				pr_cnvrate, 
				pr_cnvdate, 
				region_code, 
				card_type, 
				proc_class, 
				card_seq_nr, 
				msg_type, 
				org_msg_type, 
				proc_code, 
				msg_category, 
				merchant, 
				moto_ind, 
				susp_status, 
				transact_row, 
				authoriz_row, 
				fld_043, 
				fld_098, 
				fld_102, 
				fld_103, 
				fld_104, 
				fld_039, 
				fld_sh6, 
				batch_date, 
				tr_fee, 
				fld_040, 
				fld_123_1, 
				epi_42_48, 
				fld_003, 
				msc, 
				account_nr, 
				epi_42_48_full, 
				other_code, 
				fld_015, 
				fld_095, 
				audit_date, 
				other_fee1, 
				other_fee2, 
				other_fee3, 
				other_fee4, 
				other_fee5, 
				operation_reference, 
				file_in_row_num, 
				ref_file_id, 
				state_id, 
				bank_level, 
				interbank_total_amount_id, 
				transact_total_amount_id, 
			  trunc(Tran_Date_Time), 
				to_char(Tran_Date_Time,'hh24:mi:ss'), 
				(select t.Tran_Type || ' - ' || Tt.Notes
          from Dm_Gl_S_File_Transact_Types Tt
         where Tt.Tran_Type_Code = t.Tran_Type), 
				Dm_Util.Get_Gl_Terminal_Id(t.term_nr), 
				Dm_Util.Get_GL_Merchant_Id(t.term_nr), 
				(select dm_util.Get_Gl_Object_State_Name(14, t.State_Id)
          from Dual) , 
				Decode(Substr(t.Bank_Level, -1),
              'B',
              'Межбанковская транзакция',
              'O',
              'Внутрифилиалная транзакция',
              'F',
              'Межфилиалная транзакция',
              'H',
              'Межфилиалная транзакция',
              'неопределен') 
		from ibs.gl_terminal_transacts t
		where t.filial_code  = etl_kernel.Get_Etl_Filial
		--and t.oper_day = etl_kernel.Get_Etl_Day
		
		union all
		
		select 
				id, 
				filial_code, 
				oper_day, 
				mtid, 
				rec_centr, 
				send_centr, 
				iss_cmi, 
				send_cmi, 
				settl_cmi, 
				acq_bank, 
				acq_branch, 
				member_code, 
				clearing_group, 
				acceptor_id, 
				batch_nr, 
				slip_nr, 
				card, 
				exp_date, 
				tran_date_time, 
				tran_type, 
				appr_code, 
				appr_src, 
				stan, 
				ref_number, 
				amount, 
				cash_back, 
				fee, 
				currency, 
				ccy_exp, 
				sb_amount, 
				sb_cshback, 
				sb_fee, 
				sbnk_ccy, 
				sb_ccyexp, 
				sb_cnvrate, 
				sb_cnvdate, 
				i_amount, 
				i_cshback, 
				i_fee, 
				ibnk_ccy, 
				i_ccyexp, 
				i_cnvrate, 
				i_cnvdate, 
				abvr_name, 
				city, 
				country, 
				point_code, 
				mcc_code, 
				terminal, 
				batch_id, 
				settl_nr, 
				settl_date, 
				acqref_nr, 
				file_id, 
				ms_number, 
				file_date, 
				source_algorithm, 
				field_reserv, 
				term_nr, 
				ecmc_fee, 
				tran_info, 
				pr_amount, 
				pr_cshback, 
				pr_fee, 
				prnk_ccy, 
				pr_ccyexp, 
				pr_cnvrate, 
				pr_cnvdate, 
				region_code, 
				card_type, 
				proc_class, 
				card_seq_nr, 
				msg_type, 
				org_msg_type, 
				proc_code, 
				msg_category, 
				merchant, 
				moto_ind, 
				susp_status, 
				transact_row, 
				authoriz_row, 
				fld_043, 
				fld_098, 
				fld_102, 
				fld_103, 
				fld_104, 
				fld_039, 
				fld_sh6, 
				batch_date, 
				tr_fee, 
				fld_040, 
				fld_123_1, 
				epi_42_48, 
				fld_003, 
				msc, 
				account_nr, 
				epi_42_48_full, 
				other_code, 
				fld_015, 
				fld_095, 
				audit_date, 
				other_fee1, 
				other_fee2, 
				other_fee3, 
				other_fee4, 
				other_fee5, 
				operation_reference, 
				file_in_row_num, 
				ref_file_id, 
				state_id, 
				bank_level, 
				interbank_total_amount_id, 
				transact_total_amount_id, 
				trunc(Tran_Date_Time), 
        to_char(Tran_Date_Time,'hh24:mi:ss'), 
        (select t.Tran_Type || ' - ' || Tt.Notes
          from Dm_Gl_S_File_Transact_Types Tt
         where Tt.Tran_Type_Code = t.Tran_Type), 
        Dm_Util.Get_Gl_Terminal_Id(t.term_nr), 
        Dm_Util.Get_GL_Merchant_Id(t.term_nr), 
        (select dm_util.Get_Gl_Object_State_Name(14, t.State_Id)
          from Dual) , 
        Decode(Substr(t.Bank_Level, -1),
              'B',
              'Межбанковская транзакция',
              'O',
              'Внутрифилиалная транзакция',
              'F',
              'Межфилиалная транзакция',
              'H',
              'Межфилиалная транзакция',
              'неопределен') 
     from ibs.gl_terminal_transacts_h t
		 where t.filial_code = etl_kernel.Get_Etl_Filial
		 --and t.oper_day = etl_kernel.Get_Etl_Day;
     ;
	commit;    
     Write_Log(i_Module_Name => 'FILL_DM_GL_TERM_TRANSACTS', i_Log_Type => 'F', i_Text => 'Finished',i_log_id => v_log_id);
   
   exception when others then
     Write_Log(i_Module_Name => 'FILL_DM_GL_TERM_TRANSACTS',
                      i_Log_Type => 'E',
                      i_error_txt    => 'Exception : Fil :' || etl_kernel.Get_Etl_Filial || ' ' ||  Substr(sqlerrm, 1, 2000) || ', stack: ' ||
                      Substr(Dbms_Utility.Format_Error_Backtrace, 1, 1500),i_log_id => v_log_id );
     
   end Fill_Dm_Gl_Term_Transacts;
	 --Procedure to fill Dm_Hr_emps	 
	 Procedure Fill_Dm_Hr_Emps
    is
     v_Time_Beg date := sysdate;
     v_log_id  number(9);
   begin
     Write_Log(i_Module_Name => 'FILL_DM_HR_EMPS',i_Log_Type =>  'N', i_Text => 'Started', i_filial_code => etl_kernel.Get_Etl_Filial,i_table_name => 'DM_HR_EMPS',i_log_id => v_log_id);
     
    --delete from table old data
     /*delete Dm_Hr_Emps t
       where t.filial = etl_kernel.Get_Etl_Filial     
        ; */
		 insert into Dm_Hr_Emps 
		 (
				emp_id, 
				tab_num, 
				cb_id, 
				filial, 
				filial_old, 
				last_name, 
				first_name, 
				middle_name, 
				date_begin, 
				date_end, 
				staffing_id, 
				staffing_id_old, 
				stavka, 
				day_work_time, 
				work_type, 
				work_spec, 
				condition, 
				condition_old, 
				inps, 
				inn, 
				nationality, 
				marriage, 
				bank_spec, 
				approval_type, 
				gender, 
				from_bank_flag, 
				birth_date, 
				birth_place, 
				birth_country_code, 
				birth_region_code, 
				birth_district_code, 
				citizenship, 
				citizenship_country, 
				citizenship_region, 
				country_code, 
				region_code, 
				district_code, 
				address, 
				temp_country_code, 
				temp_region_code, 
				temp_district_code, 
				temp_address, 
				temp_begin_date, 
				temp_end_date, 
				education, 
				party, 
				party_date, 
				labor_union_flag, 
				passport_seria, 
				passport_number, 
				passport_issued, 
				passport_date_begin, 
				passport_date_end, 
				passport_ever_flag, 
				pension_age_flag, 
				sience_degree, 
				sience_rank, 
				sience_work, 
				sience_data_nom, 
				conviction_flag, 
				conviction_date_begin, 
				conviction_date_end, 
				conviction_reason, 
				conviction_desc, 
				army_ready_flag, 
				army_group_number, 
				army_sostav, 
				army_office, 
				army_rank, 
				army_card_number, 
				army_spec_flag, 
				army_vus, 
				army_where_when, 
				phone, 
				phone_work, 
				phone_mobil, 
				phone_mobil2, 
				mail_address, 
				comp_knowledge, 
				comp_knowledge_desc, 
				net_knowledge, 
				net_knowledge_desc, 
				additional_income, 
				additional_income_desc, 
				estate_own, 
				estate_own_desc, 
				do_business_flag, 
				last_work_fired_reason, 
				old_last_name, 
				fio_update_reason, 
				public_work, 
				public_work_desc, 
				created_by, 
				creation_date, 
				last_updated_by, 
				last_update_date, 
				fio, 
				condition_name, 
				post_name, 
				dep_name
		)
		select 
		    t.emp_id, 
        t.tab_num, 
        t.cb_id, 
        t.filial, 
        t.filial_old, 
        t.last_name, 
        t.first_name, 
        t.middle_name, 
        t.date_begin, 
        t.date_end, 
        t.staffing_id, 
        t.staffing_id_old, 
        t.stavka, 
        t.day_work_time, 
        t.work_type, 
        t.work_spec, 
        t.condition, 
        t.condition_old, 
        t.inps, 
        t.inn, 
        t.nationality, 
        t.marriage, 
        t.bank_spec, 
        t.approval_type, 
        t.gender, 
        t.from_bank_flag, 
        t.birth_date, 
        t.birth_place, 
        t.birth_country_code, 
        t.birth_region_code, 
        t.birth_district_code, 
        t.citizenship, 
        t.citizenship_country, 
        t.citizenship_region, 
        t.country_code, 
        t.region_code, 
        t.district_code, 
        t.address, 
        t.temp_country_code, 
        t.temp_region_code, 
        t.temp_district_code, 
        t.temp_address, 
        t.temp_begin_date, 
        t.temp_end_date, 
        t.education, 
        t.party, 
        t.party_date, 
        t.labor_union_flag, 
        t.passport_seria, 
        t.passport_number, 
        t.passport_issued, 
        t.passport_date_begin, 
        t.passport_date_end, 
        t.passport_ever_flag, 
        t.pension_age_flag, 
        t.sience_degree, 
        t.sience_rank, 
        t.sience_work, 
        t.sience_data_nom, 
        t.conviction_flag, 
        t.conviction_date_begin, 
        t.conviction_date_end, 
        t.conviction_reason, 
        t.conviction_desc, 
        t.army_ready_flag, 
        t.army_group_number, 
        t.army_sostav, 
        t.army_office, 
        t.army_rank, 
        t.army_card_number, 
        t.army_spec_flag, 
        t.army_vus, 
        t.army_where_when, 
        t.phone, 
        t.phone_work, 
        t.phone_mobil, 
        t.phone_mobil2, 
        t.mail_address, 
        t.comp_knowledge, 
        t.comp_knowledge_desc, 
        t.net_knowledge, 
        t.net_knowledge_desc, 
        t.additional_income, 
        t.additional_income_desc, 
        t.estate_own, 
        t.estate_own_desc, 
        t.do_business_flag, 
        t.last_work_fired_reason, 
        t.old_last_name, 
        t.fio_update_reason, 
        t.public_work, 
        t.public_work_desc, 
        t.created_by, 
        t.creation_date, 
        t.last_updated_by,
				t.last_update_date, 
				(t.Last_Name || ' ' || t.First_Name || ' ' ||  t.Middle_Name), 
				 (Select c.Condition_Note From Dm_Hr_S_Emp_Conditions c Where c.Condition = t.Condition), 
				Dm_Util.Get_Hr_Post_Name(p.Post_Id) , 
				Dm_Util.Get_Hr_Department_Name(p.Department_Code)
		from ibs.Hr_Emps t
    left Join ibs.Hr_Staffing p On p.Staffing_Id = t.Staffing_Id
		where t.filial = etl_kernel.Get_Etl_Filial;

	 commit;    
     Write_Log(i_Module_Name => 'FILL_DM_HR_EMPS', i_Log_Type => 'F', i_Text => 'Finished',i_log_id => v_log_id);
   
   exception when others then
     Write_Log(i_Module_Name => 'FILL_DM_HR_EMPS',
                      i_Log_Type => 'E',
                      i_error_txt    => 'Exception : Fil :' || etl_kernel.Get_Etl_Filial || ' ' ||  Substr(sqlerrm, 1, 2000) || ', stack: ' ||
                      Substr(Dbms_Utility.Format_Error_Backtrace, 1, 1500),i_log_id => v_log_id );
     
   end Fill_Dm_Hr_Emps;
	 --Procedure to fill Dm_Ln_Cards
	 procedure Fill_Dm_Ln_Cards
		 is 
	 v_Time_Beg date := sysdate;
   v_log_id  number(9);
	 v_ln_card                 Dm_Ln_Cards%rowtype;
   type t_ln_card is table of Dm_Ln_Cards%rowtype;
   v_ln_cards                 t_ln_card := t_ln_card();
	 cursor c1 is 
	 select 
			loan_id, 
			filial_code, 
			local_code, 
			condition, 
			card_type, 
			loan_type, 
			client_code, 
			claim_number, 
			loan_number, 
			loan_line_num, 
			committee_number, 
			date_committee, 
			contract_code, 
			contract_date, 
			contract_desc, 
			agr_num_notarial, 
			agr_date_notarial, 
			doc_notarial_num, 
			doc_notarial_date, 
			doc_gover_num, 
			doc_gover_date, 
			open_date, 
			close_date, 
			currency, 
			summ_loan, 
			days_in_year, 
			grace_period, 
			fc_summ, 
			fc_desc, 
			form_delivery, 
			form_redemption, 
			term_loan_type, 
			eco_sec, 
			purpose_loan, 
			object_loan, 
			guar_class, 
			source_cred, 
			class_cred, 
			class_quality, 
			motive_revising, 
			date_revising, 
			date_modify, 
			err_message, 
			emp_code, 
			sign_delivery, 
			manager_name, 
			sign_ebrd, 
			gov_num, 
			gov_date, 
			locking, 
			day_redemp, 
			loanmonth, 
			percent_rate, 
			red_debt_month, 
			red_perc_month, 
			summinitial, 
			founders, 
			urgency_type, 
			claim_id, 
			client_id, 
			product_id, 
			oked, 
			client_name, 
			client_uid,
			dm_util.Get_Actual_Issue_Date_byLoanId(t.open_date,t.loan_id,t.filial_code) date_fakt_vidach,
			(select /*+ index_desc (v1 LN_PERCENT_RATE_PK) */ v1.Perc_Rate from ibs.Ln_Percent_Rate v1 where v1.Perc_Code_Desc='OSN' and v1.Loan_Id=t.Loan_Id and v1.First_Date<= etl_kernel.Get_Etl_Day and rownum=1)  percent_rate_osn,
			(select substr(a.account_code,-20,5) from Ibs.Ln_Account a  where a.Date_Validate <= etl_kernel.Get_Etl_Day
           and a.Date_Next > etl_kernel.Get_Etl_Day and t."LOAN_ID" = a.Loan_Id  and a.Loan_Type_Account = 1 and rownum = 1) coa_code_t1 ,
					 
      (select get_nls_name(dwh_setup.nls_index,cast(prd.name as s_nsi_nvt)) FROM ibs.ln_products prd where prd.product_id = t.product_id) product_name,
			(select s.Name from Dm_Ln_S_Loan_Status s where s.code_status = t.Condition ) CONDITION_NAME    ,
			(select ct.name from Dm_Ln_S_Claim_Type ct where ct.code = t.card_type) card_Type_name,
			(select lt.name from Dm_Ln_S_Credit_Type lt where lt.code = t.loan_type) loan_type_name,
			(select fd.name from Dm_Ln_S_Form_Red fd where fd.code = t.form_delivery) form_delivery_name,
			(select fr.name from Dm_Ln_S_Form_Red fr where fr.code = t.form_redemption) form_redemption_name,
			(select ltt.name from Dm_ln_S_Loan_Type_Term ltt where ltt.code = t.term_loan_type) loan_type_term_name,
			(select es.name from Dm_S_Sector es where es.code = t.eco_sec) eco_sec_name,
			(select pl.name from Dm_Ln_S_Purpose_Cipher pl where pl.code = t.purpose_loan) purpose_loan_name,
			(select gc.name from Dm_Ln_S_Cr_Cl_Guarant gc where gc.code = t.guar_class) guar_class_name,
			(select cs.name from Dm_Ln_S_Credit_Source cs where cs.code = t.source_cred) source_cred_name,
			(select cc.name from Dm_Ln_S_Class_Credit cc where cc.code = t.class_cred) class_cred_name,
			(select cq.name from Dm_Ln_S_Credit_Class_Quality cq where cq.code = t.class_quality) class_quality_name,
			(select /*+ index_desc (v1 LN_PERCENT_RATE_PK) */ v1.Perc_Rate from ibs.Ln_Percent_Rate v1 where v1.Perc_Code_Desc='DLO' and v1.Loan_Id=t.Loan_Id and v1.First_Date<= etl_kernel.Get_Etl_Day and rownum=1)  percent_rate_dlo
	 	 
	 from ibs.ln_card t
	 where t.filial_code = etl_kernel.Get_Etl_Filial;
	 --лизинг
	 
	 v_date_dog_liz                 date := null;
   v_all_amount_liz               number(3) := null;
   v_cost_liz                     number(22,2) := null;
   v_currency_liz                 varchar2(3)  := null;
   v_code_subject_liz             varchar2(2) := null;
	 v_code_subject_liz_name        varchar2(100) := null;
	 --суд
	 v_date_post_sud date;
	 v_date_resh_sud date;
	 v_other_info_sud varchar2(200) := null;
	 --ln_growing	 
	 v_status_nar_nenar varchar2(20) := null;
	 v_org_bank_nar_nenar varchar2(50) := null;
	 v_date_nar_nenar date;
	 v_nomer_resh_nar_nenar  varchar2(200) := null;
	 --ln_prolong
	 v_kod_org_resh_peresm   varchar2(200) := null;
	 v_date_resh_peresm      date;
	 v_num_resh_peresm       varchar2(200) := null;	 
	 v_date_close_prolong    date;
	 --
	 v_kod_zarub_org         varchar2(200) := null;
	 v_kod_norm_prav_akt     varchar2(20) := null;
	  --факторинг
	 v_resident_fakt            varchar2(1)    := null;	 
	 v_kod_otrasl_fakt          varchar2(40)   := null;	 
	 v_inn_fakt                 varchar2(9)    := null;
	 v_contr_date_fakt          date := null;
	 v_contr_code_fakt          varchar2(14) := null;
	 v_size_amount_fakt         number(20)   := null;
	 v_tip_srok_fakt            varchar2(1)  := null;
	 v_vid_kred_fakt            varchar2(2)  := null;
	 v_cipher_kred_fakt         varchar2(6)  := null;
	 v_currency_fakt            varchar2(3)  := null;
	 v_form_vidach_fakt         varchar2(1)  :=null;
	 v_form_redemp_fakt         varchar2(1)  := null;
	 v_date_close_fakt          date := null;
	 v_loan_desc_fakt           varchar2(100) := null;
	 v_promisor_desc_fakt       varchar2(100) := null;
	 v_jfi_fakt                 varchar2(1)   :=null;
	 --	
	 v_nik_id                       number(10)     := null;
	 v_Tsel_Kredita                 varchar2(500)  := null;
	 begin
		 Write_Log(i_Module_Name => 'FILL_DM_LN_CARDS',i_Log_Type =>  'N', i_Text => 'Started',i_oper_day => etl_kernel.Get_Etl_Day, i_filial_code => etl_kernel.Get_Etl_Filial,i_table_name => 'DM_LN_CARDS',i_log_id => v_log_id);
     
		 /*delete from Dm_Ln_Cards t where t.filial_code = etl_kernel.Get_Etl_Filial;*/
		 for rec in c1 
			loop
				begin
					select --+ (f LN_FACTORING_PROMISOR_I1)
					 f.Is_Resident,
					 f.Eco_Sec,
					 f.Promisor_Inn,
					 f.Contract_Code,
					 f.Contract_Date,
					 f.Promisor_Summ ,
					 f.Term_Loan_Type,
					 f.Loan_Type,
					 f.Purpose_Loan,
					 f.Currency,
					 f.Form_Delivery,
					 f.Form_Redemption,
					 f.Close_Date,
					 f.Loan_Desc,
					 f.Promisor_Desc,
					 f.Jfi
						into v_Resident_Fakt,
								 v_Kod_Otrasl_Fakt,
								 v_Inn_Fakt,
								 v_Contr_Code_Fakt,
								 v_Contr_Date_Fakt,
								 v_Size_Amount_Fakt,
								 v_Tip_Srok_Fakt,
								 v_Vid_Kred_Fakt,
								 v_Cipher_Kred_Fakt,
								 v_Currency_Fakt,
								 v_Form_Vidach_Fakt,
								 v_Form_Redemp_Fakt,
								 v_Date_Close_Fakt,
								 v_Loan_Desc_Fakt,
								 v_Promisor_Desc_Fakt,
								 v_Jfi_Fakt
						from ibs.Ln_Factoring_Promisor f
					 where f.Loan_Id = Rec.Loan_Id;
				exception
					when No_Data_Found then
						v_Resident_Fakt      := null;
						v_Kod_Otrasl_Fakt    := null;
						v_Inn_Fakt           := null;
						v_Contr_Code_Fakt    := null;
						v_Contr_Date_Fakt    := null;
						v_Size_Amount_Fakt   := null;
						v_Tip_Srok_Fakt      := null;
						v_Vid_Kred_Fakt      := null;
						v_Cipher_Kred_Fakt   := null;
						v_Currency_Fakt      := null;
						v_Form_Vidach_Fakt   := null;
						v_Form_Redemp_Fakt   := null;
						v_Date_Close_Fakt    := null;
						v_Loan_Desc_Fakt     := null;
						v_Promisor_Desc_Fakt := null;
						v_Jfi_Fakt           := null;
				end;
			--
				begin
					select --+ (trib LN_TRIBUNAL_PK)
					 Trib.Del_Date, Trib.Decision_Date, Trib.Other_Inf
						into v_date_post_sud, v_date_resh_sud, v_other_info_sud
						from ibs.Ln_Tribunal Trib
					 where Trib.Loan_Id = Rec.Loan_Id;
				exception
					when No_Data_Found then
						v_date_post_sud      := null;
						v_date_resh_sud := null;
						v_other_info_sud     := null;
				end;
				--
				begin
					select --+ index_desc (gr LN_GROWING_PK)
					 Decode(Gr.Status, 'Y', '1', '0') Status, Gr.Code_Depart, Gr.Decision_Date, Gr.Decision_Num
						into v_status_nar_nenar, v_org_bank_nar_nenar, v_date_nar_nenar, v_nomer_resh_nar_nenar
						from ibs.Ln_Growing Gr
					 where Gr.Loan_Id = Rec.Loan_Id
						 and Rownum = 1;
				exception
					when No_Data_Found then
						v_status_nar_nenar   := null;
						v_org_bank_nar_nenar := null;
						v_date_nar_nenar := null;
						v_nomer_resh_nar_nenar  := null;
				end;
				--
				begin
					select --+ (ls LN_LEASING_OBJECT_I1)
					 Ls.Contract_Date,
					 Ls.Amount,
					 Ls.Cast ,
					 Ls.Currency,
					 Ls.Code_Subject,
					 (select l.name from Dm_Ln_S_Object_Leasing l where l.code = ls.code_subject) 
						into v_Date_Dog_Liz, v_All_Amount_Liz, v_Cost_Liz, v_Currency_Liz, v_Code_Subject_Liz,
						v_code_subject_liz_name
						from ibs.Ln_Leasing_Object Ls
					 where Ls.Loan_Id = Rec.Loan_Id
					 and rownum = 1;
				exception
					when No_Data_Found then
						v_Date_Dog_Liz     := null;
						v_All_Amount_Liz   := null;
						v_Cost_Liz   := null;
						v_Code_Subject_Liz := null;
				end;
				--
				--
				begin
					select --+index_desc (pr LN_PROLONG_PK)
					 Pr.Code_Depart, Pr.Date_Decision, Pr.Num_Decision, Pr.Date_Long
						into v_kod_org_resh_peresm, v_date_resh_peresm, v_num_resh_peresm, v_date_close_prolong
						from ibs.Ln_Prolong Pr
					 where Pr.Loan_Id = Rec.Loan_Id
						 and Rownum = 1;
				exception
					when No_Data_Found then
						v_kod_org_resh_peresm    := null;
						v_date_resh_peresm    := null;
						v_num_resh_peresm     := null;
						v_date_close_prolong := null;
				end;
				--
				begin
					select --+ (app PK_LN_CLAIM_APPENDIX)
					 App.Normative_Act
						into v_kod_norm_prav_akt
						from ibs.Ln_Claim_Appendix App
					 where App.Claim_Id = Rec.Claim_Id;
				exception
					when No_Data_Found then
						v_kod_norm_prav_akt := null;
				end;
				--
				begin
					select Substr(String_Agg(Sr.Foreign_Organization_Code), 1, 200),
								 Substr(String_Agg(Sr.Loan_Line_Purpose), 1, 500)
						into v_kod_zarub_org, v_Tsel_Kredita
						from ibs.Ln_Credit_Sources Sr
					 where Sr.Loan_Id = Rec.Loan_Id;
				exception
					when No_Data_Found then
						v_kod_zarub_org    := null;
						v_Tsel_Kredita := null;
				end;
				--
				begin
					select --+ ( nk LN_NIK_СARD_PK)
					 Nk.Nik_Id
						into v_Nik_Id
						from ibs.Ln_Nik_Card Nk
					 where Nk.Loan_Id = Rec.Loan_Id;
				exception
					when No_Data_Found then
						v_Nik_Id := null;
				end;
				--
				v_ln_card.loan_id := rec.loan_id;
				v_ln_card.filial_code := rec.filial_code;
				v_ln_card.local_code := rec.local_code;
				v_ln_card.condition := rec.condition;
				v_ln_card.card_type := rec.card_type;
				v_ln_card.loan_type := rec.loan_type;
				v_ln_card.client_code := rec.client_code;
				v_ln_card.claim_number := rec.claim_number;
				v_ln_card.loan_number := rec.loan_number;
				v_ln_card.loan_line_num := rec.loan_line_num;
				v_ln_card.committee_number := rec.committee_number;
				v_ln_card.date_committee := rec.date_committee;
				v_ln_card.contract_code := rec.contract_code;
				v_ln_card.contract_date := rec.contract_date;
				v_ln_card.contract_desc := rec.contract_desc;
				v_ln_card.agr_num_notarial := rec.agr_num_notarial;
				v_ln_card.agr_date_notarial := rec.agr_date_notarial;
				v_ln_card.doc_notarial_num := rec.doc_notarial_num;
				v_ln_card.doc_notarial_date := rec.doc_notarial_date;
				v_ln_card.doc_gover_num := rec.doc_gover_num;
				v_ln_card.doc_gover_date := rec.doc_gover_date;
				v_ln_card.open_date := rec.open_date;
				v_ln_card.close_date := rec.close_date;
				v_ln_card.currency := rec.currency;
				v_ln_card.summ_loan := rec.summ_loan;
				v_ln_card.days_in_year := rec.days_in_year;
				v_ln_card.grace_period := rec.grace_period;
				v_ln_card.fc_summ := rec.fc_summ;
				v_ln_card.fc_desc := rec.fc_desc;
				v_ln_card.form_delivery := rec.form_delivery;
				v_ln_card.form_redemption := rec.form_redemption;
				v_ln_card.term_loan_type := rec.term_loan_type;
				v_ln_card.eco_sec := rec.eco_sec;
				v_ln_card.purpose_loan := rec.purpose_loan;
				v_ln_card.object_loan := rec.object_loan;
				v_ln_card.guar_class := rec.guar_class;
				v_ln_card.source_cred := rec.source_cred;
				v_ln_card.class_cred := rec.class_cred;
				v_ln_card.class_quality := rec.class_quality;
				v_ln_card.motive_revising := rec.motive_revising;
				v_ln_card.date_revising := rec.date_revising;
				v_ln_card.date_modify := rec.date_modify;
				v_ln_card.err_message := rec.err_message;
				v_ln_card.emp_code := rec.emp_code;
				v_ln_card.sign_delivery := rec.sign_delivery;
				v_ln_card.manager_name := rec.manager_name;
				v_ln_card.sign_ebrd := rec.sign_ebrd;
				v_ln_card.gov_num := rec.gov_num;
				v_ln_card.gov_date := rec.gov_date;
				v_ln_card.locking := rec.locking;
				v_ln_card.day_redemp := rec.day_redemp;
				v_ln_card.loanmonth := rec.loanmonth;
				v_ln_card.percent_rate := rec.percent_rate;
				v_ln_card.red_debt_month := rec.red_debt_month;
				v_ln_card.red_perc_month := rec.red_perc_month;
				v_ln_card.summinitial := rec.summinitial;
				v_ln_card.founders := rec.founders;
				v_ln_card.urgency_type := rec.urgency_type;
				v_ln_card.claim_id := rec.claim_id;
				v_ln_card.client_id := rec.client_id;
				v_ln_card.product_id := rec.product_id;
				v_ln_card.oked := rec.oked;
				v_ln_card.client_name := rec.client_name;
				v_ln_card.client_uid := rec.client_uid;
				v_ln_card.date_fakt_vidach := rec.date_fakt_vidach;
				v_ln_card.percent_rate_osn := rec.percent_rate_osn;
				v_ln_card.coa_code_t1 := rec.coa_code_t1;
				v_ln_card.product_name := rec.product_name;
				v_ln_card.condition_name := rec.condition_name;
				v_ln_card.card_type_name := rec.card_type_name;
				v_ln_card.loan_type_name := rec.loan_type_name;
				v_ln_card.form_delivery_name := rec.form_delivery_name;
				v_ln_card.form_redemption_name := rec.form_redemption_name;
				v_ln_card.loan_type_term_name := rec.loan_type_term_name;
				v_ln_card.eco_sec_name := rec.eco_sec_name;
				v_ln_card.purpose_loan_name := rec.purpose_loan_name;
				v_ln_card.guar_class_name := rec.guar_class_name;
				v_ln_card.source_cred_name := rec.source_cred_name;
				v_ln_card.class_cred_name := rec.class_cred_name;
				v_ln_card.class_quality_name := rec.class_quality_name;
				v_ln_card.percent_rate_dlo := rec.percent_rate_dlo;
				v_ln_card.date_dog_lizing := v_date_dog_liz;
				v_ln_card.lizing_sum := v_all_amount_liz;
				v_ln_card.cost_lizing := v_cost_liz;
				v_ln_card.currency_lizing := v_currency_liz;
				v_ln_card.code_subject_lizing := v_code_subject_liz;
				v_ln_card.code_subject_lizing_name := v_code_subject_liz_name;
				v_ln_card.data_post_sud := v_date_post_sud;
				v_ln_card.data_resh_sud := v_date_resh_sud;
				v_ln_card.other_info_sud := v_other_info_sud;
				v_ln_card.status_kred_nar_nenar := v_status_nar_nenar;
				v_ln_card.org_bank_nar_nenar := v_org_bank_nar_nenar;
				v_ln_card.date_nar_nenar := v_date_nar_nenar;
				v_ln_card.nomer_resh_nar_nenar := v_nomer_resh_nar_nenar;
				v_ln_card.kod_org_resh_peresm := v_kod_org_resh_peresm;
				v_ln_card.data_resh_peresm := v_date_resh_peresm;
				v_ln_card.num_resh_peresm := v_num_resh_peresm;
				v_ln_card.date_close_prolong := v_date_close_prolong;
				v_ln_card.kod_zarub_org := v_kod_zarub_org;
				v_ln_card.kod_norm_prav_akt := v_kod_norm_prav_akt;
				v_ln_card.nik_id := v_nik_id;
				v_ln_card.tsel_kredita := v_Tsel_Kredita;
				v_ln_card.resident_fakt := v_resident_fakt;
				v_ln_card.kod_otrasl_fakt := v_kod_otrasl_fakt;
				v_ln_card.inn_fakt := v_inn_fakt;
				v_ln_card.contr_date_fakt := v_contr_date_fakt;
				v_ln_card.contr_code_fakt := v_contr_code_fakt;
				v_ln_card.size_amount_fakt := v_size_amount_fakt;
				v_ln_card.tip_srok_fakt := v_tip_srok_fakt;
				v_ln_card.vid_kred_fakt := v_vid_kred_fakt;
				v_ln_card.cipher_kred_fakt := v_cipher_kred_fakt;
				v_ln_card.currency_fakt := v_currency_fakt;
				v_ln_card.form_vidach_fakt := v_form_vidach_fakt;
				v_ln_card.form_redemp_fakt := v_form_redemp_fakt;
				v_ln_card.date_close_fakt := v_date_close_fakt;
				v_ln_card.loan_desc_fakt := v_loan_desc_fakt;
				v_ln_card.promisor_desc_fakt := v_promisor_desc_fakt;
				v_ln_card.jfi_fakt := v_jfi_fakt;
        
				
				v_ln_cards.Extend;
        v_ln_cards(v_ln_cards.Count) := v_ln_card;

       if v_ln_cards.Count > 50000 then
				 forall i in v_ln_cards.First .. v_ln_cards.Last
					insert into Dm_Ln_Cards
					values v_ln_cards(i);
				 v_ln_cards := t_ln_card();
       end if;
				
		end loop;
		forall i in v_ln_cards.First .. v_ln_cards.Last
		insert into Dm_Ln_Cards
			values v_ln_cards(i);
			v_ln_cards := t_ln_card();
	  commit;
		    
     Write_Log(i_Module_Name => 'FILL_DM_LN_CARDS', i_Log_Type => 'F', i_Text => 'Finished',i_log_id => v_log_id);
   
   exception when others then
     Write_Log(i_Module_Name => 'FILL_DM_LN_CARDS',
                      i_Log_Type => 'E',
                      i_error_txt    => 'Exception : Fil :' || etl_kernel.Get_Etl_Filial || ' ' ||  Substr(sqlerrm, 1, 2000) || ', stack: ' ||
                      Substr(Dbms_Utility.Format_Error_Backtrace, 1, 1500),i_log_id => v_log_id );
    
	 end Fill_Dm_Ln_Cards;
	 --procedure to fill dm_ln_graph_debt
	 procedure Fill_Dm_Ln_Graph_Debt
		 is 
	 r_ln_graph   dm_ln_graph_debt%rowtype;
	 v_fil_code   varchar2(5);
	 v_cur_code   varchar2(3);
	 v_client_id  number(10);
	 v_Time_Beg date := sysdate;
   v_log_id  number(9);
	 cursor grp is 
	  select 
			id, 
			loan_id, 
			obligate_number, 
			date_red, 
			summ_red, 
			sign_long, 
			condition, 
			emp_code, 
			date_modify
		from ibs.ln_graph_debt t 
		 ;
	 begin
		 Write_Log(i_Module_Name => 'FILL_DM_LN_GRAPH_DEBT',i_Log_Type =>  'N', i_Text => 'Started',i_table_name => 'DM_LN_GRAPH_DEBT', i_log_id => v_log_id);
     
		 /*delete from dm_ln_graph_debt;*/
		 insert into dm_ln_graph_debt
		 select 
		  id, 
      loan_id, 
      obligate_number, 
      date_red, 
      summ_red, 
      sign_long, 
      condition, 
      emp_code, 
      date_modify,
			(select currency from ibs.ln_card a where a.loan_id = t.loan_id),
			(select client_id from ibs.ln_card a where a.loan_id = t.loan_id),
			(select filial_code from ibs.ln_card a where a.loan_id = t.loan_id)					
		 from ibs.ln_graph_debt t ;
		 
		/* for rec in grp
			 loop
				 begin
					 select  t.filial_code, t.currency, t.client_id
					 into v_fil_code, v_Cur_code, v_client_id
					 from ibs.ln_card t 
					 where t.loan_id = rec.loan_id;
				 exception when no_data_found then
					 v_fil_code := null;
					 v_cur_code := null;
					 v_client_id := null;					
				 end;			 
			 r_ln_graph.id := rec.id;
			 r_ln_graph.loan_id := rec.loan_id;
			 r_ln_graph.obligate_number := rec.obligate_number;
			 r_ln_graph.date_red := rec.date_red;
			 r_ln_graph.summ_red := rec.summ_red;
			 r_ln_graph.sign_long := rec.sign_long;
			 r_ln_graph.condition := rec.condition;
			 r_ln_graph.emp_code := rec.emp_code;
			 r_ln_graph.date_modify := rec.date_modify;
			 r_ln_graph.currency := v_cur_code;
			 r_ln_graph.client_id := v_client_id;
			 r_ln_graph.filial_code := v_fil_code;
			 
			 insert into Dm_Ln_Graph_Debt values r_ln_graph;			 
			 end loop;*/
			 commit;
			 		    
       Write_Log(i_Module_Name => 'FILL_DM_LN_GRAPH_DEBT', i_Log_Type => 'F', i_Text => 'Finished',i_log_id => v_log_id);
   
       exception when others then
         Write_Log(i_Module_Name => 'FILL_DM_LN_GRAPH_DEBT',
                      i_Log_Type => 'E',
                      i_error_txt    => 'Exception :' ||  Substr(sqlerrm, 1, 2000) || ', stack: ' ||
                      Substr(Dbms_Utility.Format_Error_Backtrace, 1, 1500),i_log_id => v_log_id );
    
	 end Fill_Dm_Ln_Graph_Debt;
	 --Procedure to fill Dm_Ln_Leads
	 Procedure Fill_Dm_Ln_Leads
		 is 
	 v_Time_Beg date := sysdate;
   v_log_id  number(9);
	 begin
		 Write_Log(i_Module_Name => 'FILL_DM_LN_LEADS',i_Log_Type =>  'N', i_Text => 'Started', i_filial_code => etl_kernel.Get_Etl_Filial,i_table_name => 'DM_LN_LEADS', i_log_id => v_log_id);
     
		 /*delete from Dm_Ln_Leads t
		 where t.filial_code = etl_kernel.Get_Etl_Filial;*/
		 insert into Dm_Ln_Leads
		 (
				lead_id, 
				operation_id, 
				operation_code, 
				action_code, 
				action_group_code, 
				lead_template_id, 
				filial_code, 
				loan_id, 
				cl_mfo, 
				cl_acc_type_id, 
				cl_acc, 
				co_mfo, 
				co_acc_type_id, 
				co_acc, 
				sum_pay, 
				op_dc, 
				code_currency, 
				curr_day, 
				sign_manual, 
				sign_correct, 
				date_execute, 
				doc_numb, 
				doc_date, 
				cl_inn, 
				cl_name, 
				co_inn, 
				co_name, 
				trans_id, 
				date_enter, 
				sys_birth, 
				emp_birth, 
				sys_id, 
				code_emp, 
				pay_purpose, 
				act_id, 
				state_id, 
				task_code, 
				cl_acc20, 
				cl_coa, 
				co_acc20, 
				co_coa, 
				action_11_who, 
				action_11_who_name, 
				action_11_when, 
				action_31_who, 
				action_31_when, 
				action_31_who_name, 
				action_41_who, 
				action_41_when, 
				action_41_who_name, 
				sys_birth_name, 
				sys_id_name, 
				emp_birth_name, 
				cl_acc_type_name, 
				co_acc_type_name, 
				sign_correct_name, 
				sign_manual_name, 
				trans_id_name, 
				code_emp_name, 
				act_id_name, 
				state_id_name, 
				task_code_name,
				lead_template_name

		 )
		 select 
		    lead_id, 
        operation_id, 
        operation_code, 
        action_code, 
        action_group_code, 
        lead_template_id, 
        filial_code, 
        loan_id, 
        cl_mfo, 
        cl_acc_type_id, 
        cl_acc, 
        co_mfo, 
        co_acc_type_id, 
        co_acc, 
        sum_pay, 
        op_dc, 
        code_currency, 
        curr_day, 
        sign_manual, 
        sign_correct, 
        date_execute, 
        doc_numb, 
        doc_date, 
        cl_inn, 
        cl_name, 
        co_inn, 
        co_name, 
        trans_id, 
        date_enter, 
        sys_birth, 
        emp_birth, 
        sys_id, 
        code_emp, 
        pay_purpose, 
        act_id, 
        state_id, 
        task_code, 
        substr(t.cl_acc,-20),
        substr(t.cl_acc, -20,5),
        substr(t.co_acc, -20),
        substr(t.co_acc,-20,5), 
        (select p.code_emp from ibs.LEAD_PROTOCOL_HIST p where p.lead_id = t.lead_id and p.act_id = 11 and rownum = 1),
				(select c.name from ibs.core_users c where c.user_id = (select p.code_emp from ibs.LEAD_PROTOCOL_HIST p where p.lead_id = t.lead_id and p.act_id = 11 and rownum = 1)),
				(select p.time from ibs.LEAD_PROTOCOL_HIST p where p.lead_id = t.lead_id and p.act_id = 11 and rownum = 1),
				(select p.code_emp from ibs.LEAD_PROTOCOL_HIST p where p.lead_id = t.lead_id and p.act_id in (31, 32, 33, 40) and rownum = 1) ,
				(select p.time from ibs.LEAD_PROTOCOL_HIST p where p.lead_id = t.lead_id and p.act_id in (31, 32, 33, 40) and rownum = 1) ,
				(select c.name from ibs.core_users c where c.user_id  = (select p.code_emp from ibs.LEAD_PROTOCOL_HIST p where p.lead_id = t.lead_id and p.act_id in (31, 32, 33, 40) and rownum = 1)),
				(select p.code_emp from ibs.LEAD_PROTOCOL_HIST p where p.lead_id = t.lead_id and p.act_id in (40,41) and rownum = 1),
				(select p.time from ibs.LEAD_PROTOCOL_HIST p where p.lead_id = t.lead_id and p.act_id in (40, 41) and rownum = 1),
				(select c.name from ibs.core_users c where c.user_id = (select p.code_emp from ibs.LEAD_PROTOCOL_HIST p where p.lead_id = t.lead_id and p.act_id in (40, 41) and rownum = 1)) ,
				(select k.name from Dm_S_System k where k.code = t.sys_birth),
				(select k.name from Dm_S_System k where k.code = t.sys_id),			  
        (select c.name from ibs.core_users c where c.user_id = t.emp_birth),        
        (select lnt.name from Dm_Ln_S_Loan_Type_Account lnt where lnt.code = t.cl_acc_type_id),
        (select lnt.name from Dm_Ln_S_Loan_Type_Account lnt where lnt.code = t.co_acc_type_id),				 
        decode(sign_correct,'Y','Корректирующая проводка','N','Обычная проводка'), 
        decode(sign_manual,'M','Ручная проводка','A','Автоматическая проводка','R','Из реакции'), 
        (select ts.name from Dm_S_Transaction ts where ts.trans_id = t.trans_id),
        (select c.name from ibs.core_users c where c.user_id = t.code_emp), 
        (select da.name from Dm_S_Doclead_Action da where da.act_id = t.act_id), 
        (select ds.name from Dm_S_Doclead_State ds where ds.state_id = t.state_id),
        (select k.name from Dm_S_Task k where k.code = t.task_code) ,
				(select lt.name from Dm_Ln_S_Lead_Templates lt where lt.id = t.lead_template_id)
		 from ibs.ln_leads t 
		 where t.filial_code = etl_kernel.Get_Etl_Filial;
		 commit;		
		 Write_Log(i_Module_Name => 'FILL_DM_LN_LEADS', i_Log_Type => 'F', i_Text => 'Finished',i_log_id => v_log_id);
   
     exception when others then
         Write_Log(i_Module_Name => 'FILL_DM_LN_LEADS',
                      i_Log_Type => 'E',
                      i_error_txt    => 'Exception : Fil :' || etl_kernel.Get_Etl_Filial || ' ' ||  Substr(sqlerrm, 1, 2000) || ', stack: ' ||
                      Substr(Dbms_Utility.Format_Error_Backtrace, 1, 1500),i_log_id => v_log_id );
    
	 end Fill_Dm_Ln_Leads;	
	 --procedure to fill Dm_Ib_Gate_Conv_Transacts
	 Procedure Fill_Dm_Ib_Gate_Conv_Transacts
		 is
		v_Time_Beg date := sysdate;
    v_log_id  number(9);
	 begin
		 Write_Log(i_Module_Name => 'FILL_DM_IB_GATE_CONV_TRANSACTS',i_Log_Type =>  'N', i_Text => 'Started',i_oper_day => etl_kernel.Get_Etl_Day, i_filial_code => etl_kernel.Get_Etl_Filial, i_table_name => 'DM_IB_GATE_CONV_TRANSACTS', i_log_id => v_log_id);
   
		 /*delete from Dm_Ib_Gate_Conv_Transacts t where t.from_filial_code = etl_kernel.Get_Etl_Filial
		 and t.created_day = etl_kernel.Get_Etl_Day;*/
		
	   insert into Dm_Ib_Gate_Conv_Transacts 
		 select 
				ib_client_id, 
				from_card, 
				from_currency, 
				from_filial_code, 
				to_card, 
				to_currency, 
				to_filial_code, 
				sum_amount, 
				val_amount, 
				state_id, 
				message, 
				created_date, 
				cur_rate, 
				transact_id, 
				sv_group_id, 
				val_operation_code, 
				val_object_id, 
				tet_operation_reference, 
				ib_payment_id, 
				debit_by_sv_gate, 
				initiator,
				trunc(created_date),
				to_char(t.created_date,'hh24:mi:ss')		 
		 from ibs.ib_gate_conversion_transacts t
		 where t.from_filial_code = etl_kernel.Get_Etl_Filial
		 and trunc(t.created_date) = etl_kernel.Get_Etl_Day;
		 commit;
	   Write_Log(i_Module_Name => 'FILL_DM_LN_LEADS', i_Log_Type => 'F', i_Text => 'Finished',i_log_id => v_log_id);
   
     exception when others then
         Write_Log(i_Module_Name => 'FILL_DM_LN_LEADS',
                      i_Log_Type => 'E',
                      i_error_txt    => 'Exception : Fil :' || etl_kernel.Get_Etl_Filial || ' ' ||  Substr(sqlerrm, 1, 2000) || ', stack: ' ||
                      Substr(Dbms_Utility.Format_Error_Backtrace, 1, 1500),i_log_id => v_log_id );
    
	 end Fill_Dm_Ib_Gate_Conv_Transacts;
	 --procedure to fill Dm_Sl_Calcs 
	 Procedure Fill_Dm_Sl_Calcs
		 is
	  v_Time_Beg date := sysdate;
    v_log_id  number(9);
	 begin
		Write_Log(i_Module_Name => 'FILL_DM_SL_CALCS',i_Log_Type =>  'N', i_Text => 'Started',i_oper_day => etl_kernel.Get_Etl_Day, i_filial_code => etl_kernel.Get_Etl_Filial,i_table_name => 'DM_SL_CALCS' ,i_log_id => v_log_id);
   
	  /*delete from Dm_Sl_Calcs t where t.filial = etl_kernel.Get_Etl_Filial
		and t.period = etl_kernel.Get_Etl_Day;*/
		insert into Dm_Sl_Calcs 
		select 
				calc_id, 
				filial, 
				emp_id, 
				tab_num, 
				pay_id, 
				pay_name, 
				period, 
				summ * 100 summ, 
				state, 
				created_by, 
				creation_date, 
				claim_id, 
				cont_id, 
				paid * 100 paid, 
				cs_id, 
				refresh, 
				summ_alt * 100 sum_alt,
				dm_util.Get_Sl_Pay_Name(t.pay_id),
				dm_util.Get_Sl_Dict_Name('SL_CALC_STATES',t.state)
		from ibs.Sl_Calcs t
		 where t.filial = etl_kernel.Get_Etl_Filial
		 --and t.period = etl_kernel.Get_Etl_Day
		union all
		select 
		    calc_id, 
        filial, 
        emp_id, 
        tab_num, 
        pay_id, 
        pay_name, 
        period, 
        summ * 100 summ, 
        state, 
        created_by, 
        creation_date, 
        claim_id, 
        cont_id, 
        paid * 100 paid, 
        cs_id, 
        refresh, 
        summ_alt * 100 summ_alt,
        dm_util.Get_Sl_Pay_Name(t.pay_id),
        (select c.name from Dm_Sl_S_Calc_States c where c.code = t.state)
		from ibs.Sl_h_Calcs t 
		where t.filial = etl_kernel.Get_Etl_Filial
		--and t.period = etl_kernel.Get_Etl_Day;
		;
		commit;
	  Write_Log(i_Module_Name => 'FILL_DM_SL_CALCS', i_Log_Type => 'F', i_Text => 'Finished',i_log_id => v_log_id);
   
     exception when others then
         Write_Log(i_Module_Name => 'FILL_DM_SL_CALCS',
                      i_Log_Type => 'E',
                      i_error_txt    => 'Exception : Fil :' || etl_kernel.Get_Etl_Filial || ' ' ||  Substr(sqlerrm, 1, 2000) || ', stack: ' ||
                      Substr(Dbms_Utility.Format_Error_Backtrace, 1, 1500),i_log_id => v_log_id );
    
	 end Fill_Dm_Sl_Calcs;
	 --Procedure to fill Dm_Sl_Cs_Details
	 Procedure Fill_Dm_Sl_Cs_Details
		 is
		v_Time_Beg date := sysdate;
    v_log_id  number(9);
	 begin
	  Write_Log(i_Module_Name => 'FILL_DM_SL_CS_DETAILS',i_Log_Type =>  'N', i_Text => 'Started',i_oper_day => etl_kernel.Get_Etl_Day, i_filial_code => etl_kernel.Get_Etl_Filial,i_table_name => 'DM_SL_CS_DETAILS', i_log_id => v_log_id);
   
		/*delete from Dm_Sl_Cs_Details t where t.filial = etl_kernel.Get_Etl_Filial*/
		--and t.period = etl_kernel.Get_Etl_Day;
		--;
		insert into Dm_Sl_Cs_Details 
		select 
			t.line_id, 
			t.cs_id, 
			t.filial, 
			t.period, 
			t.emp_id, 
			t.tab_num, 
			t.pay_id, 
			t.calc_id, 
			t.state, 
			t.created_by, 
			t.creation_date, 
			t.summ *100 summ,
			Decode(t.Pay_Id, 913, 'К Выдачи', t.Pay_Id)||' - '||p.Name

		from ibs.Sl_Cs_Details t , ibs.Sl_s_Pays p
		 where t.filial = etl_kernel.Get_Etl_Filial
		  --and t.period = etl_kernel.Get_Etl_Day
		  and t.pay_id = p.pay_id
		union all
		select 
		  t.line_id, 
      t.cs_id, 
      t.filial, 
      t.period, 
      t.emp_id, 
      t.tab_num, 
      t.pay_id, 
      t.calc_id, 
      t.state, 
      t.created_by, 
      t.creation_date, 
      t.summ * 100 summ,
      Decode(t.Pay_Id, 913, 'К Выдачи', t.Pay_Id)||' - '||p.Name
		from ibs.Sl_h_Cs_Details t  , ibs.Sl_s_Pays p
		 where t.filial = etl_kernel.Get_Etl_Filial
		  --and t.period  = etl_kernel.Get_Etl_Day
		  and t.pay_id = p.pay_id;
	 commit;
	 Write_Log(i_Module_Name => 'FILL_DM_SL_CS_DETAILS', i_Log_Type => 'F', i_Text => 'Finished',i_log_id => v_log_id);
   
     exception when others then
         Write_Log(i_Module_Name => 'FILL_DM_SL_CS_DETAILS',
                      i_Log_Type => 'E',
                      i_error_txt    => 'Exception : Fil :' || etl_kernel.Get_Etl_Filial || ' ' ||  Substr(sqlerrm, 1, 2000) || ', stack: ' ||
                      Substr(Dbms_Utility.Format_Error_Backtrace, 1, 1500),i_log_id => v_log_id );
    
	 end Fill_Dm_Sl_Cs_Details;
	 --Procedure to fill Dm_Sl_Cs_Leads
	 Procedure Fill_Dm_Sl_Cs_Leads
		 is
		v_Time_Beg date := sysdate;
    v_log_id  number(9);
	 begin
	  Write_Log(i_Module_Name => 'FILL_DM_SL_CS_LEADS',i_Log_Type =>  'N', i_Text => 'Started',i_oper_day => etl_kernel.Get_Etl_Day, i_filial_code => etl_kernel.Get_Etl_Filial,i_table_name => 'DM_SL_CS_LEADS', i_log_id => v_log_id);
   
		/*delete from Dm_Sl_Cs_Leads t where t.filial = etl_kernel.Get_Etl_Filial*/
		--and t.period = etl_kernel.Get_Etl_Day;
		--;
	  insert into Dm_Sl_Cs_Leads(
				lead_id, 
				core_lead_id, 
				cs_id, 
				filial, 
				period, 
				pay_id, 
				doc_num, 
				doc_date, 
				cl_acc, 
				co_acc, 
				summ, 
				purpose_code, 
				purpose, 
				err, 
				state, 
				ord, 
				created_by, 
				creation_date, 
				last_updated_by, 
				last_update_date, 
				state_name, 
				sum_nach, 
				sum_uder
		)
		select 
		    lead_id, 
        core_lead_id, 
        cs_id, 
        filial, 
        period, 
        pay_id, 
        doc_num, 
        doc_date, 
        cl_acc, 
        co_acc, 
        summ *100 summ, 
        purpose_code, 
        purpose, 
        err, 
        state, 
        ord, 
        created_by, 
        creation_date, 
        last_updated_by, 
        last_update_date, 
        (select l.name from Dm_Sl_S_Cs_Lead_States l where l.code = t.state) , 
        (Select Sum(p.Summ) * 100 From ibs.Sl_Cs_Details p 
				  Where p.Cs_Id = t.Cs_Id And p.Pay_Id In (Select k.Pay_Id From ibs.Sl_s_Pays k Where k.Pay_Kind In ('A','N'))) , 
        (Select Sum(p.Summ) * 100 From ibs.Sl_Cs_Details p 
				  Where p.Cs_Id = t.Cs_Id And p.Pay_Id In (Select k.Pay_Id From ibs.Sl_s_Pays k Where k.Pay_Kind In ('U','D')))		
		from ibs.Sl_Cs_Leads t 
		where t.filial = etl_kernel.Get_Etl_Filial 
		--and t.period = etl_kernel.Get_Etl_Day
		union all
		select
		    lead_id, 
        core_lead_id, 
        cs_id, 
        filial, 
        period, 
        pay_id, 
        doc_num, 
        doc_date, 
        cl_acc, 
        co_acc, 
        summ * 100 summ, 
        purpose_code, 
        purpose, 
        err, 
        state, 
        ord, 
        created_by, 
        creation_date, 
        last_updated_by, 
        last_update_date, 
        (select l.name from Dm_Sl_S_Cs_Lead_States l where l.code = t.state) , 
        (Select Sum(p.Summ) * 100 From ibs.Sl_Cs_Details p 
				  Where p.Cs_Id = t.Cs_Id And p.Pay_Id In (Select k.Pay_Id From ibs.Sl_s_Pays k Where k.Pay_Kind In ('A','N'))) , 
        (Select Sum(p.Summ) * 100 From ibs.Sl_Cs_Details p 
				  Where p.Cs_Id = t.Cs_Id And p.Pay_Id In (Select k.Pay_Id From ibs.Sl_s_Pays k Where k.Pay_Kind In ('U','D')))		   
		from ibs.Sl_h_Cs_leads t 
		where t.filial = etl_kernel.Get_Etl_Filial
		--and t.period = etl_kernel.Get_Etl_Day;
		;
		
	  commit;
	 Write_Log(i_Module_Name => 'FILL_DM_SL_CS_LEADS', i_Log_Type => 'F', i_Text => 'Finished',i_log_id => v_log_id);
   
     exception when others then
         Write_Log(i_Module_Name => 'FILL_DM_SL_CS_LEADS',
                      i_Log_Type => 'E',
                      i_error_txt    => 'Exception : Fil :' || etl_kernel.Get_Etl_Filial || ' ' ||  Substr(sqlerrm, 1, 2000) || ', stack: ' ||
                      Substr(Dbms_Utility.Format_Error_Backtrace, 1, 1500),i_log_id => v_log_id );
   end Fill_Dm_Sl_Cs_Leads;
	 --Procedure to Fill Dm_Munis_P2P	 
   Procedure Fill_Dm_Munis_P2P
     is
    v_Time_Beg date := sysdate;
    v_log_id  number(9);
   begin
    Write_Log(i_Module_Name => 'FILL_DM_MUNIS_P2P',i_Log_Type =>  'N', i_Text => 'Started',i_oper_day => etl_kernel.Get_Etl_Day, i_filial_code => etl_kernel.Get_Etl_Filial,i_table_name => 'DM_MUNIS_P2P',i_log_id => v_log_id);
   
    /*delete from Dm_Munis_P2P t where t.payer_branch = etl_kernel.Get_Etl_Filial*/
    --and t.sysinfo_data = etl_kernel.Get_Etl_Day;
		--;
		insert into Dm_Munis_P2P
		select 
				transfer_id, 
				sysinfo_sid, 
				sysinfo_data, 
				sysinfo_time, 
				sysinfo_bid, 
				sysinfo_tid, 
				sysinfo_hash, 
				amount_currency, 
				amount_value, 
				doc_number, 
				doc_date, 
				settlement_supplier, 
				settlement_code, 
				confirm_code, 
				confirm_message, 
				receive_type, 
				file_id, 
				direction, 
				created_on, 
				payer_branch, 
				payer_account, 
				payer_name, 
				payer_inn, 
				payee_branch, 
				payee_account, 
				payee_name, 
				payee_inn, 
				purpose_code, 
				purpose_text,
				(select s.Element_Value
          from ibs.Munis_Transfer_Lists_Sub s
         where s.Transfer_Id = t.Transfer_Id
           and s.Element = 'PAYER_CARD'),
				(select s.Element_Value
          from ibs.Munis_Transfer_Lists_Sub s
         where s.Transfer_Id = t.Transfer_Id
           and s.Element = 'PAYEE_CARD') 
		from ibs.Munis_Transfer_Lists t 
		where t.payer_branch = etl_kernel.Get_Etl_Filial
		--and t.sysinfo_data = etl_kernel.Get_Etl_Day;
		;
	 commit;
	 Write_Log(i_Module_Name => 'FILL_DM_MUNIS_P2P', i_Log_Type => 'F', i_Text => 'Finished',i_log_id => v_log_id);
   
     exception when others then
         Write_Log(i_Module_Name => 'FILL_DM_MUNIS_P2P',
                      i_Log_Type => 'E',
                      i_error_txt    => 'Exception : Fil :' || etl_kernel.Get_Etl_Filial || ' ' ||  Substr(sqlerrm, 1, 2000) || ', stack: ' ||
                      Substr(Dbms_Utility.Format_Error_Backtrace, 1, 1500),i_log_id => v_log_id );
   end Fill_Dm_Munis_P2P;
	 --procedure to fill Dm_Cm_Clients_Risks
	 Procedure Fill_Dm_Cm_Clients_Risks
     is
    v_Time_Beg date := sysdate;
    v_log_id  number(9);
   begin
    Write_Log(i_Module_Name => 'FILL_Dm_Cm_Clients_Risks',i_Log_Type =>  'N', i_Text => 'Started',i_table_name => 'Dm_Cm_Clients_Risks',i_log_id => v_log_id);
   
   /*delete from Dm_Cm_Clients_Risks;*/
	 insert into Dm_Cm_Clients_Risks
	 select 
		ref_id, 
		risk, 
		description, 
		criterion_code,
    (select cr.criterion from Dm_Cm_S_Criterion cr where cr.code = t.criterion_code) 
	 from ibs.cm_clients_risk t;
	 	
	 commit;
	 Write_Log(i_Module_Name => 'FILL_Dm_Cm_Clients_Risks', i_Log_Type => 'F', i_Text => 'Finished',i_log_id => v_log_id);
   
     exception when others then
         Write_Log(i_Module_Name => 'FILL_Dm_Cm_Clients_Risks',
                      i_Log_Type => 'E',
                      i_error_txt    => 'Exception : '||  Substr(sqlerrm, 1, 2000) || ', stack: ' ||
                      Substr(Dbms_Utility.Format_Error_Backtrace, 1, 1500),i_log_id => v_log_id );
   end Fill_Dm_Cm_Clients_Risks;
	 --procedure to fill Dm_Tet_Card_Sys_Refs
	 Procedure Fill_Dm_Tet_Card_Sys_Refs
     is
    v_Time_Beg date := sysdate;
    v_log_id  number(9);
   begin
    Write_Log(i_Module_Name => 'FILL_DM_TET_CARD_SYS_REFS',i_Log_Type =>  'N', i_Text => 'Started', i_filial_code => etl_kernel.Get_Etl_Filial,i_table_name => 'DM_TET_CARD_SYS_REFS' ,i_log_id => v_log_id);
   
   /* delete from Dm_Tet_Card_Sys_Refs t where t.filial_code = etl_kernel.Get_Etl_Filial;*/
		insert into Dm_Tet_Card_Sys_Refs 
		select 
				filial_code, 
				card_id, 
				contract_id, 
				sys_id
		from ibs.tet_card_sys_refs t 
		where t.filial_code = etl_kernel.Get_Etl_Filial;
	 commit;
	 Write_Log(i_Module_Name => 'FILL_DM_TET_CARD_SYS_REFS', i_Log_Type => 'F', i_Text => 'Finished',i_log_id => v_log_id);
   
     exception when others then
         Write_Log(i_Module_Name => 'FILL_DM_TET_CARD_SYS_REFS',
                      i_Log_Type => 'E',
                      i_error_txt    => 'Exception : '||  Substr(sqlerrm, 1, 2000) || ', stack: ' ||
                      Substr(Dbms_Utility.Format_Error_Backtrace, 1, 1500),i_log_id => v_log_id );
   end Fill_Dm_Tet_Card_Sys_Refs;
	 --procedure to fill Dm_Tet_Accounts
	 Procedure Fill_Dm_Tet_Accounts
     is
    v_Time_Beg date := sysdate;
    v_log_id  number(9);
		v_tet_account                 Dm_Tet_Accounts%rowtype;
    type t_tet_accounts is table of Dm_Tet_Accounts%rowtype;
    v_tet_accounts                 t_tet_accounts := t_tet_accounts();
		cursor c1 is 
		select 
			filial_code, 
			client_id, 
			client_code, 
			contract_id, 
			account_type_id, 
			account_code, 
			bank_code, 
			tet_account, 
			modified_by, 
			modified_on, 
			state, 
			insurance_deposit, 
			transact_last_date, 
			customer_id, 
			client_code_pc, 
			file_id_out, 
			locked_reason, 
			locked_date, 
			is_send_rest,	
			(select at.name from Dm_Tet_S_Account_Types at where at.id  = t.account_type_id) account_type_name
		from ibs.tet_accounts t 
		where t.filial_code = etl_kernel.Get_Etl_Filial;
	 --
	 v_client_name varchar2(500) := null;
	 v_card_product_code varchar2(10) := null;
	 v_contract_number   varchar2(20) := null;
	 v_contr_curr_code   varchar2(3)  := null;
	 v_contr_type_name   varchar2(260) := null;
	 v_card_prod_code_name  varchar2(260) := null;
   begin
    Write_Log(i_Module_Name => 'FILL_DM_TET_ACCOUNTS',i_Log_Type =>  'N', i_Text => 'Started',i_filial_code => etl_kernel.Get_Etl_Filial,i_table_name => 'DM_TET_ACCOUNTS', i_log_id => v_log_id);
   
    /*delete from Dm_Tet_Accounts t where t.filial_code = etl_kernel.Get_Etl_Filial;*/
		for rec in c1 loop
			begin
				select t.card_product_code, t.contract_number, t.currency_code,
				       (select ct.name from Dm_Tet_S_Contract_Types ct where ct.id = t.type_id),
							 (select pd.name from Dm_Tet_S_Card_Product_Codes pd where pd.code = t.card_product_code)
				into v_card_product_code, v_contract_number, v_contr_curr_code, 
				     v_contr_type_name, v_card_prod_code_name
				from ibs.tet_contracts t
				where t.id = rec.contract_id;
			exception when no_data_found then
				v_card_product_code := null;
				v_contract_number   := null;
				v_contr_curr_code   := null;
				v_contr_type_name   := null;
				v_card_prod_code_name  := null;					
			end;
		  --
		  begin
        select Nvl(t.Surname, ' ') || ' ' || Nvl(t.Name, ' ') || ' ' || Nvl(t.Patronymic, ' ')
          into v_Client_Name
          from Ibs.Tet_Clients t
         where t.Client_Id = Rec.Client_Id;
		  exception when no_data_Found then
				v_client_name := null;
			end;
			--
			v_tet_account.filial_code := rec.filial_code;
      v_tet_account.client_id := rec.client_id;
      v_tet_account.client_code := rec.client_code;
      v_tet_account.contract_id := rec.contract_id;
      v_tet_account.account_type_id := rec.account_type_id;
      v_tet_account.account_code := rec.account_code;
      v_tet_account.bank_code := rec.bank_code;
      v_tet_account.tet_account := rec.tet_account;
      v_tet_account.modified_by := rec.modified_by;
      v_tet_account.modified_on := rec.modified_on;
      v_tet_account.state := rec.state;
      v_tet_account.insurance_deposit := rec.insurance_deposit;
      v_tet_account.transact_last_date := rec.transact_last_date;
      v_tet_account.customer_id := rec.customer_id;
      v_tet_account.client_code_pc := rec.client_code_pc;
      v_tet_account.file_id_out := rec.file_id_out;
      v_tet_account.locked_reason := rec.locked_reason;
      v_tet_account.locked_date := rec.locked_date;
      v_tet_account.is_send_rest := rec.is_send_rest;
      v_tet_account.client_name := v_Client_Name;
      v_tet_account.card_product_code := v_card_product_code;
      v_tet_account.contract_number := v_contract_number;
      v_tet_account.contr_curr_code := v_contr_curr_code;
      v_tet_account.account_type_name := rec.account_type_name;
      v_tet_account.contr_type_name := v_contr_type_name;
      v_tet_account.card_product_code_name := v_card_prod_code_name;	
		  --
			v_tet_accounts.Extend;
      v_tet_accounts(v_tet_accounts.Count) := v_tet_account;
		  if v_tet_accounts.Count > 50000 then
         forall i in v_tet_accounts.First .. v_tet_accounts.Last
          insert into Dm_Tet_Accounts
          values v_tet_accounts(i);
         v_tet_accounts := t_tet_accounts();
      end if;
        
    end loop;
    forall i in v_tet_accounts.First .. v_tet_accounts.Last
    insert into Dm_Tet_Accounts
      values v_tet_accounts(i);
      v_tet_accounts := t_tet_accounts();
   commit;
	 Write_Log(i_Module_Name => 'FILL_DM_TET_ACCOUNTS', i_Log_Type => 'F', i_Text => 'Finished',i_log_id => v_log_id);
   
     exception when others then
         Write_Log(i_Module_Name => 'FILL_DM_TET_ACCOUNTS',
                      i_Log_Type => 'E',
                      i_error_txt    => 'Exception : '||  Substr(sqlerrm, 1, 2000) || ', stack: ' ||
                      Substr(Dbms_Utility.Format_Error_Backtrace, 1, 1500),i_log_id => v_log_id );
    end Fill_Dm_Tet_Accounts;
	 --procedure to fill Dm_Tax_Land
	 Procedure Fill_Dm_Tax_Land
     is
    v_Time_Beg date := sysdate;
    v_log_id  number(9);
   begin
    Write_Log(i_Module_Name => 'FILL_DM_TAX_LAND',i_Log_Type =>  'N', i_Text => 'Started', i_filial_code => etl_kernel.Get_Etl_Filial,i_table_name => 'DM_TAX_LAND' ,i_log_id => v_log_id);
   
    /*delete from Dm_Tax_Land t where t.filial = etl_kernel.Get_Etl_Filial;*/
		/*insert into Dm_Tax_Land 
		select 
				id, 
				filial, 
				name, 
				land_size, 
				land_rate, 
				land_size_over, 
				land_rate_over, 
				land_size_fact, 
				sum_tax, 
				sum_tax_over, 
				sum_tax_all, 
				user_id, 
				dt_modify, 
				trunc(dt_modify)
		from ibs.tax_land t 
		where t.filial = etl_kernel.Get_Etl_Filial;			*/	
	 commit;
	 Write_Log(i_Module_Name => 'FILL_DM_TAX_LAND', i_Log_Type => 'F', i_Text => 'Finished',i_log_id => v_log_id);
   
     exception when others then
         Write_Log(i_Module_Name => 'FILL_DM_TAX_LAND',
                      i_Log_Type => 'E',
                      i_error_txt    => 'Exception : '||  Substr(sqlerrm, 1, 2000) || ', stack: ' ||
                      Substr(Dbms_Utility.Format_Error_Backtrace, 1, 1500),i_log_id => v_log_id );
    end Fill_Dm_Tax_Land;
	 --procedure to fill Dm_Tax_Doc_Data
	 Procedure Fill_Dm_Tax_Doc_Data
     is
    v_Time_Beg date := sysdate;
    v_log_id  number(9);
   begin
    Write_Log(i_Module_Name => 'FILL_DM_TAX_DOC_DATA',i_Log_Type =>  'N', i_Text => 'Started', i_filial_code => etl_kernel.Get_Etl_Filial,i_table_name => 'DM_TAX_DOC_DATA', i_log_id => v_log_id);
   
   /*delete from Dm_Tax_Doc_Data t where t.filial = etl_kernel.Get_Etl_Filial;*/
	 /*insert into Dm_Tax_Doc_Data	 
	 select 
        t.id, 
        t.filial, 
        t.id_doc, 
        t.id_form, 
        t.id_form_detail, 
        t.name, 
        t.sum_tax, 
        t.changed, 
        t.user_id, 
        t.dt_modify,
        trunc(t.dt_modify) date_modify,
        decode(t.changed, 0,'По формуле',1,'Изменен вручную') changed_type,
        f.code_line,
        f.order_by,
        f.method,
        f.required,
        f.change_name       
	 from ibs.tax_doc_data t, ibs.tax_s_form_details f
   where  t.id_form = f.id_form
    and t.id_form_detail = f.id
		and t.filial = etl_kernel.Get_Etl_Filial
    order by f.order_by;*/
	 commit;
	 Write_Log(i_Module_Name => 'FILL_DM_TAX_DOC_DATA', i_Log_Type => 'F', i_Text => 'Finished',i_log_id => v_log_id);
   
     exception when others then
         Write_Log(i_Module_Name => 'FILL_DM_TAX_DOC_DATA',
                      i_Log_Type => 'E',
                      i_error_txt    => 'Exception : '||  Substr(sqlerrm, 1, 2000) || ', stack: ' ||
                      Substr(Dbms_Utility.Format_Error_Backtrace, 1, 1500),i_log_id => v_log_id );
    end Fill_Dm_Tax_Doc_Data;
	 --procedure to fill Dm_Tax_Lands_Data
	 Procedure Fill_Dm_Tax_Lands_Data
     is
    v_Time_Beg date := sysdate;
    v_log_id  number(9);
   begin
    Write_Log(i_Module_Name => 'FILL_DM_TAX_LANDS_DATA',i_Log_Type =>  'N', i_Text => 'Started', i_filial_code => etl_kernel.Get_Etl_Filial,i_table_name => 'DM_TAX_LANDS_DATA' ,i_log_id => v_log_id);
   
   /*delete from Dm_Tax_Lands_Data t where t.filial = etl_kernel.Get_Etl_Filial;*/
	 /*insert into Dm_Tax_Lands_Data
	 select 
        id, 
        filial, 
        id_land, 
        land_type, 
        code_line, 
        name, 
        land_size, 
        land_size_untaxed, 
        land_size_fact, 
        land_rate, 
        sum_tax, 
        user_id, 
        dt_modify,
        trunc(t.dt_modify)   

   from ibs.tax_lands_data t
   where t.filial = etl_kernel.Get_Etl_Filial;
	 from ibs.tax_lands_data t
	 where t.filial = etl_kernel.Get_Etl_Filial;*/
	 commit;
	 Write_Log(i_Module_Name => 'FILL_DM_TAX_LANDS_DATA', i_Log_Type => 'F', i_Text => 'Finished',i_log_id => v_log_id);
   
     exception when others then
         Write_Log(i_Module_Name => 'FILL_DM_TAX_LANDS_DATA',
                      i_Log_Type => 'E',
                      i_error_txt    => 'Exception : '||  Substr(sqlerrm, 1, 2000) || ', stack: ' ||
                      Substr(Dbms_Utility.Format_Error_Backtrace, 1, 1500),i_log_id => v_log_id );
    end Fill_Dm_Tax_Lands_Data;
	 --procedure to fill Dm_Core_Coa_Saldos
	 Procedure Fill_Dm_Core_Coa_Saldos
     is
    v_Time_Beg date := sysdate;
    v_log_id  number(9);
   begin
    Write_Log(i_Module_Name => 'FILL_DM_CORE_COA_SALDOS',i_Log_Type =>  'N', i_Text => 'Started',i_oper_day => etl_kernel.Get_Etl_Day, i_filial_code => etl_kernel.Get_Etl_Filial,i_table_name => 'DM_CORE_COA_SALDOS',i_log_id => v_log_id);
   
   /*delete from Dm_Core_Coa_Saldos t where t.filial_code = etl_kernel.Get_Etl_Filial
	  and t.oper_day = etl_kernel.Get_Etl_Day;*/
	 insert into Dm_Core_Coa_Saldos
	 (	
	    filial_code, 
			oper_day, 
			coa_code, 
			currency_code, 
			saldo_in_nom, 
			saldo_out_nom, 
			saldo_in_eqv, 
			saldo_out_eqv, 
			saldo_in_nom_a, 
			saldo_in_nom_p, 
			saldo_out_nom_a, 
			saldo_out_nom_p, 
			saldo_in_eqv_a, 
			saldo_in_eqv_p, 
			saldo_out_eqv_a, 
			saldo_out_eqv_p, 
			debit_circulate, 
			debit_circulate_eqv, 
			credit_circulate, 
			credit_circulate_eqv, 
			saldo_out_eqv_g1, 
			saldo_out_eqv_g2, 
			saldo_out_eqv_g3, 
			saldo_out_eqv_g4, 
			saldo_out_eqv_g5, 
			resident, 
			coa_name
	 )
	 select
		  	filial_code, 
				oper_day, 
				coa_code, 
				currency_code, 
				decode(substr(t.Coa_Code,1,1), '1', -1, '5', -1, 1) * (t.Saldo_Inm + t.Saldo_Inp), 
				decode(substr(t.Coa_Code,1,1), '1', -1, '5', -1, 1) * (t.Saldo_Outm + t.Saldo_Outp) , 
				decode(substr(t.Coa_Code,1,1), '1', -1, '5', -1, 1) * (t.Saldo_Eqv_Inm + t.Saldo_Eqv_Inp), 
				decode(substr(t.Coa_Code,1,1), '1', -1, '5', -1, 1) * (t.Saldo_Eqv_Outm + t.Saldo_Eqv_Outp), 
				-t.Saldo_Inm , 
				t.Saldo_Inp, 
				-t.Saldo_Outm, 
				t.Saldo_Outp, 
				-t.Saldo_Eqv_Inm, 
				t.Saldo_Eqv_Inp, 
				-t.Saldo_Eqv_Outm,
				t.Saldo_Eqv_Outp,
				t.Debit_Circulate,
				(t.debit_circulate * (select dm_util.Get_Course_Eqv(t.currency_code, t.oper_day) from dual)),
				t.Credit_Circulate ,
				(t.credit_circulate * (select dm_util.Get_Course_Eqv(t.currency_code, t.oper_day) from dual)),
				Abs(Decode(Substr(t.Coa_Code, 1, 1), '1', t.Saldo_Outm + t.Saldo_Outp, 0)) ,
        Abs(Decode(Substr(t.Coa_Code, 1, 1), '2', t.Saldo_Outm + t.Saldo_Outp, 0)) ,
        Abs(Decode(Substr(t.Coa_Code, 1, 1), '3', t.Saldo_Outm + t.Saldo_Outp, 0)) ,
        Abs(Decode(Substr(t.Coa_Code, 1, 1), '4', t.Saldo_Outm + t.Saldo_Outp, 0)) ,
        Abs(Decode(Substr(t.Coa_Code, 1, 1), '5', t.Saldo_Outm + t.Saldo_Outp, 0)) ,
				resident	,
				(select c.name from Dm_S_Coa c where c.code = t.coa_code) 
	 from ibs.dwh_coa t 
	 where t.filial_code = etl_kernel.Get_Etl_Filial
	 and t.oper_day = etl_kernel.Get_Etl_Day;
	 commit;
	 Write_Log(i_Module_Name => 'FILL_DM_CORE_COA_SALDOS', i_Log_Type => 'F', i_Text => 'Finished',i_log_id => v_log_id);
   
     exception when others then
         Write_Log(i_Module_Name => 'FILL_DM_CORE_COA_SALDOS',
                      i_Log_Type => 'E',
                      i_error_txt    => 'Exception : '||  Substr(sqlerrm, 1, 2000) || ', stack: ' ||
                      Substr(Dbms_Utility.Format_Error_Backtrace, 1, 1500),i_log_id => v_log_id );
    end Fill_Dm_Core_Coa_Saldos;
	 --procedure to fill Dm_Core_Transacts
	 Procedure Fill_Dm_Core_Transacts
     is
    v_Time_Beg date := sysdate;
    v_log_id  number(9);
		v_Loro_Acc_ID  ibs.ACCOUNTS.ID%Type := Get_Loro_Account_ID(etl_kernel.Get_Etl_Filial, '000');
   begin
    Write_Log(i_Module_Name => 'FILL_DM_CORE_TRANSACTS',i_Log_Type =>  'N', i_Text => 'Started',i_oper_day => etl_kernel.Get_Etl_Day, i_filial_code => etl_kernel.Get_Etl_Filial,i_table_name => 'DM_CORE_TRANSACTS',i_log_id => v_log_id);
   
   /*delete from Dm_Core_Transacts t where t.filial_code = etl_kernel.Get_Etl_Filial
	  and t.oper_day = etl_kernel.Get_Etl_Day;*/
	 DBMS_Application_Info.Set_Module('Filial: ' || etl_kernel.Get_Etl_Filial,
      'Oper_day: ' || To_Char(etl_kernel.Get_Etl_Day, 'dd.mm.yyyy'));
	 insert into Dm_Core_Transacts 
	 (
			payment_id, sign_dc, filial_code, oper_day, doc_type_id, document_code, 
			doc_number, account_id, main_account, co_mfo, co_account, payment_code, 
			transact_num, sum_pay, saldo_out, eqv_sum_pay, eqv_saldo_out, 
			co_code_coa, co_name, co_inn, currency_code, pay_purpose, sym_id, 
			sym_id_2
	 )
	 select --+ index (t TRANSACTS_HISTORY_BI1) index (l XPKLEADS_HISTORY) index (a XPKACCOUNTS)
          t.Lead_ID, t.Op_DC, t.Code_Filial,
          t.Curr_Day, l.Trans_ID, l.Code_Document, l.Doc_Numb,
          t.Acc_ID, a.Acc_External,
          case when t.Acc_ID = v_Loro_Acc_ID and l.Code_Currency = '000'
            then Decode(t.Op_DC, l.Op_DC, l.Cl_MFO, l.Co_MFO)
            else Decode(t.Op_DC, l.Op_DC, l.Co_MFO, l.Cl_MFO)
          end                                                          Co_MFO,
          SubStr(Decode(t.Op_DC, l.Op_DC, l.Co_Acc, l.Cl_Acc), 8, 20)  Co_Account,
          l.Sym_ID, 0, l.Sum_Pay, NULL,
          Decode(l.Code_Currency, '000', NULL, l.Sum_Eqv), NULL,
					SubStr(Decode(t.Op_DC, l.Op_DC, l.Co_Acc, l.Cl_Acc), 8, 5) ,
					decode(t.op_dc,l.Op_Dc, l.Co_Name, l.Cl_Name),
					decode(t.op_dc,l.Op_Dc, l.Co_Inn, l.Cl_Inn) ,
					l.code_currency,l.pay_purpose, lpad(l.sym_id,5,'0') ,
				 (select lpad(lr.sym_id,5,'0') from ibs.leads_report lr where lr.id = l.id) 
        from ibs.Transacts_History t, ibs.Leads_History l, ibs.Accounts a
        where t.Curr_Day    = etl_kernel.Get_Etl_Day
          and t.Code_Filial = etl_kernel.Get_Etl_Filial
          and l.ID          = t.Lead_ID
          and a.ID          = t.Acc_ID
        order by t.Acc_ID, Co_MFO, Co_Account;
	 commit;
	 Write_Log(i_Module_Name => 'FILL_DM_CORE_TRANSACTS', i_Log_Type => 'F', i_Text => 'Finished',i_log_id => v_log_id);
   
     exception when others then
         Write_Log(i_Module_Name => 'FILL_DM_CORE_TRANSACTS',
                      i_Log_Type => 'E',
                      i_error_txt    => 'Exception : '||  Substr(sqlerrm, 1, 2000) || ', stack: ' ||
                      Substr(Dbms_Utility.Format_Error_Backtrace, 1, 1500),i_log_id => v_log_id );
    end Fill_Dm_Core_Transacts;
	 --procedure to fill Dm_Core_Acs_Saldos
	 Procedure Fill_Dm_Core_Acs_Saldos
     is
    v_Time_Beg date := sysdate;
    v_log_id  number(9);		
   begin
    Write_Log(i_Module_Name => 'FILL_DM_CORE_ACS_SALDOS',i_Log_Type =>  'N', i_Text => 'Started',i_oper_day => etl_kernel.Get_Etl_Day, i_filial_code => etl_kernel.Get_Etl_Filial, i_table_name => 'DM_CORE_ACS_SALDOS', i_log_id => v_log_id);   
   /*delete from Dm_Core_Acs_Saldos t where t.filial_code = etl_kernel.Get_Etl_Filial
	  and t.oper_day = etl_kernel.Get_Etl_Day;*/
	 /*insert into Dm_Core_Acs_Saldos
	 (
			account_id, 
			oper_day, 
			filial_code, 
			local_code, 
			date_lead, 
			next_day, 
			saldo_in, 
			saldo_out, 
			day_debit, 
			day_credit, 
			total_debit, 
			total_credit, 
			eqv_saldo_in, 
			eqv_saldo_out, 
			eqv_day_debit, 
			eqv_day_credit, 
			eqv_total_debit, 
			eqv_total_credit

	 
	 )
	 select
	        t.account_id,
          c.oper_day,
          t.filial_code,
          t.local_code,
          decode(t.oper_day, c.oper_day, t.date_lead, t.oper_day) ,
          t.next_day,
          abs(decode(c.oper_day, t.oper_day,t.saldo_in, t.saldo_out)) ,
          abs(t.saldo_out) ,
          decode(c.oper_day,t.oper_day,t.day_debit,0) ,
          decode(c.oper_day, t.oper_day, t.day_credit,0) ,
          t.total_debit  ,
          t.total_credit ,
          abs(decode(c.oper_day, t.oper_day,t.eqv_saldo_in,t.eqv_saldo_out)) ,
          abs(t.eqv_saldo_out) ,
          decode(c.oper_day, t.oper_day,t.eqv_day_debit,0) ,
          decode(c.oper_day, t.oper_day,t.eqv_day_credit, 0) ,
          t.eqv_total_debit ,
          t.eqv_total_credit 
		from  ibs.Core_Acs_Account_Saldos t, ibs.calendar c
		where t.oper_day <= c.oper_day
					and t.next_day > c.oper_day;	 */
	 commit;
	 Write_Log(i_Module_Name => 'FILL_DM_CORE_ACS_SALDOS', i_Log_Type => 'F', i_Text => 'Finished',i_log_id => v_log_id);
   
     exception when others then
         Write_Log(i_Module_Name => 'FILL_DM_CORE_ACS_SALDOS',
                      i_Log_Type => 'E',
                      i_error_txt    => 'Exception : '||  Substr(sqlerrm, 1, 2000) || ', stack: ' ||
                      Substr(Dbms_Utility.Format_Error_Backtrace, 1, 1500),i_log_id => v_log_id );
    end Fill_Dm_Core_Acs_Saldos;
	 --procedure to fill spr tables
	 Procedure Load_Dm_Dim_tables
		 is
	   v_Time_Beg date := sysdate;
     v_log_id  number(9);		 
   begin
      Write_Log(i_Module_Name => 'LOAD_DM_DIM_TABLES',i_Log_Type =>  'N', i_Text => 'Started' ,i_filial_code => etl_kernel.Get_Etl_Filial ,i_oper_day =>  etl_kernel.Get_Etl_Day,i_log_id => v_log_id);
      Load_Dm_S_System;
			Load_Dm_S_Task;
			Load_Dm_S_Oked;
			Load_Dm_S_Subject_Type;
			Load_Dm_S_Client_Condition;
			Load_Dm_S_Client_Type;
			Load_Dm_S_Country;
			Load_Dm_S_Tax_Organization;
			Load_Dm_S_Form_Property;
			Load_Dm_S_District;
			Load_Dm_S_Region;
			Load_Dm_S_Bank_Corr;
			Load_Dm_S_Verifying_Document_Type;
			Load_Dm_S_Work_Capacity;
			Load_Dm_S_Subject_Sexual_Identity;
			Load_Dm_S_Client_Reason;
			Load_Dm_S_Sector;
			Load_Dm_S_Organ_Direct;
			Load_Dm_S_Place_Registration;
			Load_Dm_S_Organization_Legal_Form;
			Load_Dm_Sv_S_Objects;
			Load_Dm_Sv_S_Transact_Types;
			Load_Dm_Sv_S_Transact_Oper_Types;
			Load_Dm_Sv_S_Accounts_Types;
			Load_Dm_Sv_S_Operations;
			Load_Dm_Sv_S_Objects_States;
			Load_Dm_Vl_S_Lead_Type;
			Load_Dm_Vl_S_Lead_Action;
			Load_Dm_Vl_S_Lead_State;
			Load_Dm_Bt_S_Tbl_App_Status;
			Load_Dm_S_Bank;
			Load_Dm_S_Transhacc;
			Load_Dm_S_Currency_Operations;
			Load_Dm_S_Partner_Statuses;
			Load_Dm_Gl_S_File_Transact_Types;
			Load_Dm_Gl_S_Objects_State;
			Load_Dm_Hr_S_Emp_Conditions;
			Load_Dm_Hr_S_Posts;
			Load_Dm_Hr_S_Departments;
			Load_Dm_S_Doclead_Action;
			Load_Dm_S_Doclead_State;
			Load_Dm_S_Transaction;
			Load_Dm_Ln_S_Loan_Type_Account;
			Load_Dm_Ln_S_Lead_Templates;
			Load_Dm_Ln_S_Loan_Status;
			Load_Dm_Ln_S_Sign_Delivery;
			Load_Dm_Ln_S_Claim_Type;
			Load_Dm_Ln_S_Credit_Type;
			Load_Dm_Ln_S_Form_Red;
			Load_Dm_Ln_S_Loan_Type_Term;
			Load_Dm_Ln_S_Purpose_Cipher;
			Load_Dm_Ln_S_Cr_Cl_Guarant;
			Load_Dm_Ln_S_Credit_Source;
			Load_Dm_Ln_S_Class_Credit;
			Load_Dm_Ln_S_Credit_Class_Quality;
			Load_Dm_Ln_S_Object_Leasing;
			Load_Dm_Cm_S_Criterion;
			Load_Dm_Cm_S_Offshores;
			Load_Dm_Cm_S_Country;
			Load_Dm_Tet_S_Account_Types;
			Load_Dm_Tet_S_Contract_Types;
			Load_Dm_Tet_S_Card_Product_Codes;
			Load_Dm_S_Coa;
			Load_Dm_Sl_S_Cs_Lead_States;
			Load_Dm_Sl_S_Calc_States;
	    Load_Dm_Aa_S_Doc_Type;
	    Write_Log(i_Module_Name => 'LOAD_DM_DIM_TABLES',i_Log_Type =>  'N', i_Text => 'Finished',i_filial_code => etl_kernel.Get_Etl_Filial ,i_oper_day =>  etl_kernel.Get_Etl_Day,i_log_id => v_log_id);
     
   exception when others then
      Write_Log(i_Module_Name   => 'LOAD_DM_DIM_TABLES',                  
                  i_Log_Type   => 'E',
                  i_error_txt    => 'Exception : Fil = : ' || etl_kernel.Get_Etl_Filial || ' ' ||
                   Substr(sqlerrm, 1, 2000) || ', stack: ' ||
                   Substr(Dbms_Utility.Format_Error_Backtrace, 1, 1500),i_log_id => v_log_id );
     Dm_Util.Set_Error('Exception : ' || sqlerrm, true);  
	 
	 end Load_Dm_Dim_tables;   
	 --Procedure to fill fact tables
	 Procedure Load_Dm_Fact_Tables
		 is
	   v_Time_Beg date := sysdate;
     v_log_id  number(9);		 
   begin
      Write_Log(i_Module_Name => 'LOAD_DM_FACT_TABLES',i_Log_Type =>  'N', i_Text => 'Started' ,i_filial_code => etl_kernel.Get_Etl_Filial ,i_oper_day =>  etl_kernel.Get_Etl_Day,i_log_id => v_log_id);
      -- etl_kernel.Get_Etl_Day,etl_kernel.Get_Etl_Filial
			
			if(etl_kernel.Get_Etl_Day = Get_Operday) then
			  /*Fill_Dm_Core_Accounts(etl_kernel.Get_Etl_Day,etl_kernel.Get_Etl_Filial);        --fil
			  Fill_Dm_Core_Clients(etl_kernel.Get_Etl_Day,etl_kernel.Get_Etl_Filial);         --fil
			  Fill_Dm_Hr_Emps(etl_kernel.Get_Etl_Filial);                                   --fil
			  Fill_Dm_Ln_Cards(etl_kernel.Get_Etl_Day,etl_kernel.Get_Etl_Filial);             --fil
				Fill_Dm_Ln_Leads(etl_kernel.Get_Etl_Filial) ;                                 --fil
				Fill_Dm_Tet_Card_Sys_Refs(etl_kernel.Get_Etl_Filial);                         --fil
        Fill_Dm_Tet_Accounts(etl_kernel.Get_Etl_Filial) ;                             --fil
        Fill_Dm_Tax_Land(etl_kernel.Get_Etl_Filial);                                  --fil
        Fill_Dm_Tax_Doc_Data(etl_kernel.Get_Etl_Filial) ;                             --fil
        Fill_Dm_Tax_Lands_Data(etl_kernel.Get_Etl_Filial);                            --fil
				Fill_Dm_Bt_Applications(etl_kernel.Get_Etl_Day,etl_kernel.Get_Etl_Filial);      --fil
				Fill_Dm_Bt_Messages(etl_kernel.Get_Etl_Day,etl_kernel.Get_Etl_Filial);          --fil
				Fill_Dm_Ib_Mobile_Pays(etl_kernel.Get_Etl_Day,etl_kernel.Get_Etl_Filial);       --fil
			  Fill_Dm_Ib_Transacts(etl_kernel.Get_Etl_Day,etl_kernel.Get_Etl_Filial);         --fil
				Fill_Dm_Mr_Deals(etl_kernel.Get_Etl_Day,etl_kernel.Get_Etl_Filial);             --fil
				Fill_Dm_Munis_P2P(etl_kernel.Get_Etl_Day,etl_kernel.Get_Etl_Filial);            --fil
				Fill_Dm_Gl_Card_Transacts(etl_kernel.Get_Etl_Day,etl_kernel.Get_Etl_Filial);    --fil
			  Fill_Dm_Gl_Term_Transacts(etl_kernel.Get_Etl_Day,etl_kernel.Get_Etl_Filial);    --fil			 	
				Fill_Dm_Sv_Transacts(etl_kernel.Get_Etl_Day,etl_kernel.Get_Etl_Filial);         --fil
			  Fill_Dm_Sv_Acc_Bals(etl_kernel.Get_Etl_Day,etl_kernel.Get_Etl_Filial);          --fil
				Fill_Dm_Tet_Card_Transacts(etl_kernel.Get_Etl_Day,etl_kernel.Get_Etl_Filial);   --fil
				Fill_Dm_Sl_Calcs(etl_kernel.Get_Etl_Day,etl_kernel.Get_Etl_Filial);             --fil
			  Fill_Dm_Sl_Cs_Details(etl_kernel.Get_Etl_Day,etl_kernel.Get_Etl_Filial);        --fil
        Fill_Dm_Sl_Cs_Leads(etl_kernel.Get_Etl_Day,etl_kernel.Get_Etl_Filial);          --fil
			*/
			 null;
			end if;
			/*Fill_Dm_Leads(etl_kernel.Get_Etl_Day,etl_kernel.Get_Etl_Filial);	
			Fill_Dm_Vl_Leads(etl_kernel.Get_Etl_Day,etl_kernel.Get_Etl_Filial);
			Fill_Dm_Munis_Payments(etl_kernel.Get_Etl_Day, etl_kernel.Get_Etl_Filial);
			Fill_Dm_Munis_Receive_Pays(etl_kernel.Get_Etl_Day,etl_kernel.Get_Etl_Filial);
			Fill_Dm_Ib_Gate_Conv_Transacts(etl_kernel.Get_Etl_Day,etl_kernel.Get_Etl_Filial);
			Fill_Dm_Core_Coa_Saldos(etl_kernel.Get_Etl_Day,etl_kernel.Get_Etl_Filial);
			Fill_Dm_Core_Transacts(etl_kernel.Get_Etl_Day,etl_kernel.Get_Etl_Filial);
			Fill_Dm_Core_Acs_Saldos(etl_kernel.Get_Etl_Day,etl_kernel.Get_Etl_Filial);
			Fill_Dm_Sw_Msgfields;   --trun		
			Fill_Dm_Ln_Graph_Debt; --trun
			Fill_Dm_Cm_Clients_Risks; --trun 	*/
			Write_Log(i_Module_Name => 'LOAD_DM_FACT_TABLES',i_Log_Type =>  'N', i_Text => 'Finished',i_filial_code => etl_kernel.Get_Etl_Filial ,i_oper_day =>  etl_kernel.Get_Etl_Day,i_log_id => v_log_id);
     
   exception when others then
      Write_Log(i_Module_Name   => 'LOAD_DM_FACT_TABLES',                  
                  i_Log_Type   => 'E',
                  i_error_txt    => 'Exception : Fil = : ' || etl_kernel.Get_Etl_Filial || ' ' ||
                   Substr(sqlerrm, 1, 2000) || ', stack: ' ||
                   Substr(Dbms_Utility.Format_Error_Backtrace, 1, 1500),i_log_id => v_log_id );
     Dm_Util.Set_Error('Exception : ' || sqlerrm, true);  
	 
	 end Load_Dm_Fact_Tables;
	 --
	 Procedure Load_Dm_Dims
		 is
	 begin
		 Load_Dm_Dim_Tables;
		 Dm_Moduls_load.Job_Spr_Loads;
	 end Load_Dm_Dims;
	 --
	 procedure Load_Dm_Facts
		 is
	 begin
		 Load_Dm_Fact_Tables;
		 --Dm_Moduls_Load.Job_Dm_Load; 		 
	 end Load_Dm_Facts;
	 
	 --
	 Procedure Test 
		 is
	 begin
		  Etl_Kernel.g_Etl_Day    := To_Date('05.02.2020', 'dd.mm.yyyy');
      Etl_Kernel.g_Etl_Filial := '00410';
      Fill_Dm_Bt_Applications;
	 
	 end Test;
end Etl_Dm_Load;
/
