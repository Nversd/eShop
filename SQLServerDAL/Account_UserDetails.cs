using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using EShop.IDAL;
using Maticsoft.DBUtility;//Please add references
namespace EShop.SQLServerDAL
{
	/// <summary>
	/// 数据访问类:Account_UserDetails
	/// </summary>
	public partial class Account_UserDetails:IAccount_UserDetails
	{
		public Account_UserDetails()
		{}
		#region  BasicMethod

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperSQL.GetMaxID("Id", "Account_UserDetails"); 
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(int Id)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from Account_UserDetails");
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
		public int Add(EShop.Model.Account_UserDetails model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into Account_UserDetails(");
			strSql.Append("UserCode,Birthday,Gender,OfficeTEL,FamilyTEL,Phone,PwdTipCode,PwdTipAns)");
			strSql.Append(" values (");
			strSql.Append("@UserCode,@Birthday,@Gender,@OfficeTEL,@FamilyTEL,@Phone,@PwdTipCode,@PwdTipAns)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@UserCode", SqlDbType.VarChar,50),
					new SqlParameter("@Birthday", SqlDbType.Date,3),
					new SqlParameter("@Gender", SqlDbType.Int,4),
					new SqlParameter("@OfficeTEL", SqlDbType.VarChar,15),
					new SqlParameter("@FamilyTEL", SqlDbType.VarChar,15),
					new SqlParameter("@Phone", SqlDbType.VarChar,20),
					new SqlParameter("@PwdTipCode", SqlDbType.VarChar,50),
					new SqlParameter("@PwdTipAns", SqlDbType.VarChar,50)};
			parameters[0].Value = model.UserCode;
			parameters[1].Value = model.Birthday;
			parameters[2].Value = model.Gender;
			parameters[3].Value = model.OfficeTEL;
			parameters[4].Value = model.FamilyTEL;
			parameters[5].Value = model.Phone;
			parameters[6].Value = model.PwdTipCode;
			parameters[7].Value = model.PwdTipAns;

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
		public bool Update(EShop.Model.Account_UserDetails model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update Account_UserDetails set ");
			strSql.Append("UserCode=@UserCode,");
			strSql.Append("Birthday=@Birthday,");
			strSql.Append("Gender=@Gender,");
			strSql.Append("OfficeTEL=@OfficeTEL,");
			strSql.Append("FamilyTEL=@FamilyTEL,");
			strSql.Append("Phone=@Phone,");
			strSql.Append("PwdTipCode=@PwdTipCode,");
			strSql.Append("PwdTipAns=@PwdTipAns");
			strSql.Append(" where Id=@Id");
			SqlParameter[] parameters = {
					new SqlParameter("@UserCode", SqlDbType.VarChar,50),
					new SqlParameter("@Birthday", SqlDbType.Date,3),
					new SqlParameter("@Gender", SqlDbType.Int,4),
					new SqlParameter("@OfficeTEL", SqlDbType.VarChar,15),
					new SqlParameter("@FamilyTEL", SqlDbType.VarChar,15),
					new SqlParameter("@Phone", SqlDbType.VarChar,20),
					new SqlParameter("@PwdTipCode", SqlDbType.VarChar,50),
					new SqlParameter("@PwdTipAns", SqlDbType.VarChar,50),
					new SqlParameter("@Id", SqlDbType.Int,4)};
			parameters[0].Value = model.UserCode;
			parameters[1].Value = model.Birthday;
			parameters[2].Value = model.Gender;
			parameters[3].Value = model.OfficeTEL;
			parameters[4].Value = model.FamilyTEL;
			parameters[5].Value = model.Phone;
			parameters[6].Value = model.PwdTipCode;
			parameters[7].Value = model.PwdTipAns;
			parameters[8].Value = model.Id;

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
			strSql.Append("delete from Account_UserDetails ");
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
			strSql.Append("delete from Account_UserDetails ");
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
		public EShop.Model.Account_UserDetails GetModel(int Id)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 Id,UserCode,Birthday,Gender,OfficeTEL,FamilyTEL,Phone,PwdTipCode,PwdTipAns from Account_UserDetails ");
			strSql.Append(" where Id=@Id");
			SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
			parameters[0].Value = Id;

			EShop.Model.Account_UserDetails model=new EShop.Model.Account_UserDetails();
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
		public EShop.Model.Account_UserDetails DataRowToModel(DataRow row)
		{
			EShop.Model.Account_UserDetails model=new EShop.Model.Account_UserDetails();
			if (row != null)
			{
				if(row["Id"]!=null && row["Id"].ToString()!="")
				{
					model.Id=int.Parse(row["Id"].ToString());
				}
				if(row["UserCode"]!=null)
				{
					model.UserCode=row["UserCode"].ToString();
				}
				if(row["Birthday"]!=null && row["Birthday"].ToString()!="")
				{
					model.Birthday=DateTime.Parse(row["Birthday"].ToString());
				}
				if(row["Gender"]!=null && row["Gender"].ToString()!="")
				{
					model.Gender=int.Parse(row["Gender"].ToString());
				}
				if(row["OfficeTEL"]!=null)
				{
					model.OfficeTEL=row["OfficeTEL"].ToString();
				}
				if(row["FamilyTEL"]!=null)
				{
					model.FamilyTEL=row["FamilyTEL"].ToString();
				}
				if(row["Phone"]!=null)
				{
					model.Phone=row["Phone"].ToString();
				}
				if(row["PwdTipCode"]!=null)
				{
					model.PwdTipCode=row["PwdTipCode"].ToString();
				}
				if(row["PwdTipAns"]!=null)
				{
					model.PwdTipAns=row["PwdTipAns"].ToString();
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
			strSql.Append("select Id,UserCode,Birthday,Gender,OfficeTEL,FamilyTEL,Phone,PwdTipCode,PwdTipAns ");
			strSql.Append(" FROM Account_UserDetails ");
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
			strSql.Append(" Id,UserCode,Birthday,Gender,OfficeTEL,FamilyTEL,Phone,PwdTipCode,PwdTipAns ");
			strSql.Append(" FROM Account_UserDetails ");
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
			strSql.Append("select count(1) FROM Account_UserDetails ");
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
			strSql.Append(")AS Row, T.*  from Account_UserDetails T ");
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
			parameters[0].Value = "Account_UserDetails";
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

