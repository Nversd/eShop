﻿using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using EShop.IDAL;
using Maticsoft.DBUtility;//Please add references
namespace EShop.SQLServerDAL
{
	/// <summary>
	/// 数据访问类:Account_Consignee
	/// </summary>
	public partial class Account_Consignee:IAccount_Consignee
	{
		public Account_Consignee()
		{}
		#region  BasicMethod

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperSQL.GetMaxID("Id", "Account_Consignee"); 
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(int Id)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from Account_Consignee");
			strSql.Append(" where Id=@Id");
			SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
			parameters[0].Value = Id;

			return DbHelperSQL.Exists(strSql.ToString(),parameters);
		}


		/// <summary>
		/// 增加一条数据
		/// </summary>
		public int Add(EShop.Model.Account_Consignee model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into Account_Consignee(");
			strSql.Append("ConsigneeCode,DeliveryArea,ConsigneeName,Email,AreaDetails,PostCode,Telphone,Cellphone,FlagBuilding,BestDeliverDate,Status)");
			strSql.Append(" values (");
			strSql.Append("@ConsigneeCode,@DeliveryArea,@ConsigneeName,@Email,@AreaDetails,@PostCode,@Telphone,@Cellphone,@FlagBuilding,@BestDeliverDate,@Status)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@ConsigneeCode", SqlDbType.VarChar,50),
					new SqlParameter("@DeliveryArea", SqlDbType.VarChar,50),
					new SqlParameter("@ConsigneeName", SqlDbType.VarChar,50),
					new SqlParameter("@Email", SqlDbType.VarChar,50),
					new SqlParameter("@AreaDetails", SqlDbType.VarChar,128),
					new SqlParameter("@PostCode", SqlDbType.VarChar,50),
					new SqlParameter("@Telphone", SqlDbType.VarChar,20),
					new SqlParameter("@Cellphone", SqlDbType.VarChar,20),
					new SqlParameter("@FlagBuilding", SqlDbType.VarChar,50),
					new SqlParameter("@BestDeliverDate", SqlDbType.Date,3),
					new SqlParameter("@Status", SqlDbType.Int,4)};
			parameters[0].Value = model.ConsigneeCode;
			parameters[1].Value = model.DeliveryArea;
			parameters[2].Value = model.ConsigneeName;
			parameters[3].Value = model.Email;
			parameters[4].Value = model.AreaDetails;
			parameters[5].Value = model.PostCode;
			parameters[6].Value = model.Telphone;
			parameters[7].Value = model.Cellphone;
			parameters[8].Value = model.FlagBuilding;
			parameters[9].Value = model.BestDeliverDate;
			parameters[10].Value = model.Status;

			object obj = DbHelperSQL.GetSingle(strSql.ToString(),parameters);
			if (obj == null)
			{
				return 0;
			}
			else
			{
				return Convert.ToInt32(obj);
			}
		}
		/// <summary>
		/// 更新一条数据
		/// </summary>
		public bool Update(EShop.Model.Account_Consignee model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update Account_Consignee set ");
			strSql.Append("ConsigneeCode=@ConsigneeCode,");
			strSql.Append("DeliveryArea=@DeliveryArea,");
			strSql.Append("ConsigneeName=@ConsigneeName,");
			strSql.Append("Email=@Email,");
			strSql.Append("AreaDetails=@AreaDetails,");
			strSql.Append("PostCode=@PostCode,");
			strSql.Append("Telphone=@Telphone,");
			strSql.Append("Cellphone=@Cellphone,");
			strSql.Append("FlagBuilding=@FlagBuilding,");
			strSql.Append("BestDeliverDate=@BestDeliverDate,");
			strSql.Append("Status=@Status");
			strSql.Append(" where Id=@Id");
			SqlParameter[] parameters = {
					new SqlParameter("@ConsigneeCode", SqlDbType.VarChar,50),
					new SqlParameter("@DeliveryArea", SqlDbType.VarChar,50),
					new SqlParameter("@ConsigneeName", SqlDbType.VarChar,50),
					new SqlParameter("@Email", SqlDbType.VarChar,50),
					new SqlParameter("@AreaDetails", SqlDbType.VarChar,128),
					new SqlParameter("@PostCode", SqlDbType.VarChar,50),
					new SqlParameter("@Telphone", SqlDbType.VarChar,20),
					new SqlParameter("@Cellphone", SqlDbType.VarChar,20),
					new SqlParameter("@FlagBuilding", SqlDbType.VarChar,50),
					new SqlParameter("@BestDeliverDate", SqlDbType.Date,3),
					new SqlParameter("@Status", SqlDbType.Int,4),
					new SqlParameter("@Id", SqlDbType.Int,4)};
			parameters[0].Value = model.ConsigneeCode;
			parameters[1].Value = model.DeliveryArea;
			parameters[2].Value = model.ConsigneeName;
			parameters[3].Value = model.Email;
			parameters[4].Value = model.AreaDetails;
			parameters[5].Value = model.PostCode;
			parameters[6].Value = model.Telphone;
			parameters[7].Value = model.Cellphone;
			parameters[8].Value = model.FlagBuilding;
			parameters[9].Value = model.BestDeliverDate;
			parameters[10].Value = model.Status;
			parameters[11].Value = model.Id;

			int rows=DbHelperSQL.ExecuteSql(strSql.ToString(),parameters);
			if (rows > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}

		/// <summary>
		/// 删除一条数据
		/// </summary>
		public bool Delete(int Id)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from Account_Consignee ");
			strSql.Append(" where Id=@Id");
			SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
			parameters[0].Value = Id;

			int rows=DbHelperSQL.ExecuteSql(strSql.ToString(),parameters);
			if (rows > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		/// <summary>
		/// 批量删除数据
		/// </summary>
		public bool DeleteList(string Idlist )
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from Account_Consignee ");
			strSql.Append(" where Id in ("+Idlist + ")  ");
			int rows=DbHelperSQL.ExecuteSql(strSql.ToString());
			if (rows > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}


		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		public EShop.Model.Account_Consignee GetModel(int Id)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 Id,ConsigneeCode,DeliveryArea,ConsigneeName,Email,AreaDetails,PostCode,Telphone,Cellphone,FlagBuilding,BestDeliverDate,Status from Account_Consignee ");
			strSql.Append(" where Id=@Id");
			SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
			parameters[0].Value = Id;

			EShop.Model.Account_Consignee model=new EShop.Model.Account_Consignee();
			DataSet ds=DbHelperSQL.Query(strSql.ToString(),parameters);
			if(ds.Tables[0].Rows.Count>0)
			{
				return DataRowToModel(ds.Tables[0].Rows[0]);
			}
			else
			{
				return null;
			}
		}


		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		public EShop.Model.Account_Consignee DataRowToModel(DataRow row)
		{
			EShop.Model.Account_Consignee model=new EShop.Model.Account_Consignee();
			if (row != null)
			{
				if(row["Id"]!=null && row["Id"].ToString()!="")
				{
					model.Id=int.Parse(row["Id"].ToString());
				}
				if(row["ConsigneeCode"]!=null)
				{
					model.ConsigneeCode=row["ConsigneeCode"].ToString();
				}
				if(row["DeliveryArea"]!=null)
				{
					model.DeliveryArea=row["DeliveryArea"].ToString();
				}
				if(row["ConsigneeName"]!=null)
				{
					model.ConsigneeName=row["ConsigneeName"].ToString();
				}
				if(row["Email"]!=null)
				{
					model.Email=row["Email"].ToString();
				}
				if(row["AreaDetails"]!=null)
				{
					model.AreaDetails=row["AreaDetails"].ToString();
				}
				if(row["PostCode"]!=null)
				{
					model.PostCode=row["PostCode"].ToString();
				}
				if(row["Telphone"]!=null)
				{
					model.Telphone=row["Telphone"].ToString();
				}
				if(row["Cellphone"]!=null)
				{
					model.Cellphone=row["Cellphone"].ToString();
				}
				if(row["FlagBuilding"]!=null)
				{
					model.FlagBuilding=row["FlagBuilding"].ToString();
				}
				if(row["BestDeliverDate"]!=null && row["BestDeliverDate"].ToString()!="")
				{
					model.BestDeliverDate=DateTime.Parse(row["BestDeliverDate"].ToString());
				}
				if(row["Status"]!=null && row["Status"].ToString()!="")
				{
					model.Status=int.Parse(row["Status"].ToString());
				}
			}
			return model;
		}

		/// <summary>
		/// 获得数据列表
		/// </summary>
		public DataSet GetList(string strWhere)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select Id,ConsigneeCode,DeliveryArea,ConsigneeName,Email,AreaDetails,PostCode,Telphone,Cellphone,FlagBuilding,BestDeliverDate,Status ");
			strSql.Append(" FROM Account_Consignee ");
			if(strWhere.Trim()!="")
			{
				strSql.Append(" where "+strWhere);
			}
			return DbHelperSQL.Query(strSql.ToString());
		}

		/// <summary>
		/// 获得前几行数据
		/// </summary>
		public DataSet GetList(int Top,string strWhere,string filedOrder)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select ");
			if(Top>0)
			{
				strSql.Append(" top "+Top.ToString());
			}
			strSql.Append(" Id,ConsigneeCode,DeliveryArea,ConsigneeName,Email,AreaDetails,PostCode,Telphone,Cellphone,FlagBuilding,BestDeliverDate,Status ");
			strSql.Append(" FROM Account_Consignee ");
			if(strWhere.Trim()!="")
			{
				strSql.Append(" where "+strWhere);
			}
			strSql.Append(" order by " + filedOrder);
			return DbHelperSQL.Query(strSql.ToString());
		}

		/// <summary>
		/// 获取记录总数
		/// </summary>
		public int GetRecordCount(string strWhere)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) FROM Account_Consignee ");
			if(strWhere.Trim()!="")
			{
				strSql.Append(" where "+strWhere);
			}
			object obj = DbHelperSQL.GetSingle(strSql.ToString());
			if (obj == null)
			{
				return 0;
			}
			else
			{
				return Convert.ToInt32(obj);
			}
		}
		/// <summary>
		/// 分页获取数据列表
		/// </summary>
		public DataSet GetListByPage(string strWhere, string orderby, int startIndex, int endIndex)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("SELECT * FROM ( ");
			strSql.Append(" SELECT ROW_NUMBER() OVER (");
			if (!string.IsNullOrEmpty(orderby.Trim()))
			{
				strSql.Append("order by T." + orderby );
			}
			else
			{
				strSql.Append("order by T.Id desc");
			}
			strSql.Append(")AS Row, T.*  from Account_Consignee T ");
			if (!string.IsNullOrEmpty(strWhere.Trim()))
			{
				strSql.Append(" WHERE " + strWhere);
			}
			strSql.Append(" ) TT");
			strSql.AppendFormat(" WHERE TT.Row between {0} and {1}", startIndex, endIndex);
			return DbHelperSQL.Query(strSql.ToString());
		}

		/*
		/// <summary>
		/// 分页获取数据列表
		/// </summary>
		public DataSet GetList(int PageSize,int PageIndex,string strWhere)
		{
			SqlParameter[] parameters = {
					new SqlParameter("@tblName", SqlDbType.VarChar, 255),
					new SqlParameter("@fldName", SqlDbType.VarChar, 255),
					new SqlParameter("@PageSize", SqlDbType.Int),
					new SqlParameter("@PageIndex", SqlDbType.Int),
					new SqlParameter("@IsReCount", SqlDbType.Bit),
					new SqlParameter("@OrderType", SqlDbType.Bit),
					new SqlParameter("@strWhere", SqlDbType.VarChar,1000),
					};
			parameters[0].Value = "Account_Consignee";
			parameters[1].Value = "Id";
			parameters[2].Value = PageSize;
			parameters[3].Value = PageIndex;
			parameters[4].Value = 0;
			parameters[5].Value = 0;
			parameters[6].Value = strWhere;	
			return DbHelperSQL.RunProcedure("UP_GetRecordByPage",parameters,"ds");
		}*/

		#endregion  BasicMethod
		#region  ExtensionMethod

		#endregion  ExtensionMethod
	}
}

