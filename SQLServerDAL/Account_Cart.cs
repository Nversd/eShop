using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using EShop.IDAL;
using Maticsoft.DBUtility;//Please add references
namespace EShop.SQLServerDAL
{
	/// <summary>
	/// 数据访问类:Account_Cart
	/// </summary>
	public partial class Account_Cart:IAccount_Cart
	{
		public Account_Cart()
		{}
		#region  BasicMethod

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperSQL.GetMaxID("Id", "Account_Cart"); 
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(int Id)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from Account_Cart");
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
		public int Add(EShop.Model.Account_Cart model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into Account_Cart(");
			strSql.Append("UserCode,GoodsCode,MarketPrice,OurPrice,BuyCount,SubTotal,Status)");
			strSql.Append(" values (");
			strSql.Append("@UserCode,@GoodsCode,@MarketPrice,@OurPrice,@BuyCount,@SubTotal,@Status)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@UserCode", SqlDbType.VarChar,50),
					new SqlParameter("@GoodsCode", SqlDbType.VarChar,50),
					new SqlParameter("@MarketPrice", SqlDbType.Decimal,9),
					new SqlParameter("@OurPrice", SqlDbType.Decimal,9),
					new SqlParameter("@BuyCount", SqlDbType.Int,4),
					new SqlParameter("@SubTotal", SqlDbType.Decimal,9),
					new SqlParameter("@Status", SqlDbType.Int,4)};
			parameters[0].Value = model.UserCode;
			parameters[1].Value = model.GoodsCode;
			parameters[2].Value = model.MarketPrice;
			parameters[3].Value = model.OurPrice;
			parameters[4].Value = model.BuyCount;
			parameters[5].Value = model.SubTotal;
			parameters[6].Value = model.Status;

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
		public bool Update(EShop.Model.Account_Cart model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update Account_Cart set ");
			strSql.Append("UserCode=@UserCode,");
			strSql.Append("GoodsCode=@GoodsCode,");
			strSql.Append("MarketPrice=@MarketPrice,");
			strSql.Append("OurPrice=@OurPrice,");
			strSql.Append("BuyCount=@BuyCount,");
			strSql.Append("SubTotal=@SubTotal,");
			strSql.Append("Status=@Status");
			strSql.Append(" where Id=@Id");
			SqlParameter[] parameters = {
					new SqlParameter("@UserCode", SqlDbType.VarChar,50),
					new SqlParameter("@GoodsCode", SqlDbType.VarChar,50),
					new SqlParameter("@MarketPrice", SqlDbType.Decimal,9),
					new SqlParameter("@OurPrice", SqlDbType.Decimal,9),
					new SqlParameter("@BuyCount", SqlDbType.Int,4),
					new SqlParameter("@SubTotal", SqlDbType.Decimal,9),
					new SqlParameter("@Status", SqlDbType.Int,4),
					new SqlParameter("@Id", SqlDbType.Int,4)};
			parameters[0].Value = model.UserCode;
			parameters[1].Value = model.GoodsCode;
			parameters[2].Value = model.MarketPrice;
			parameters[3].Value = model.OurPrice;
			parameters[4].Value = model.BuyCount;
			parameters[5].Value = model.SubTotal;
			parameters[6].Value = model.Status;
			parameters[7].Value = model.Id;

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
			strSql.Append("delete from Account_Cart ");
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
			strSql.Append("delete from Account_Cart ");
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
		public EShop.Model.Account_Cart GetModel(int Id)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 Id,UserCode,GoodsCode,MarketPrice,OurPrice,BuyCount,SubTotal,Status from Account_Cart ");
			strSql.Append(" where Id=@Id");
			SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
			parameters[0].Value = Id;

			EShop.Model.Account_Cart model=new EShop.Model.Account_Cart();
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
		public EShop.Model.Account_Cart DataRowToModel(DataRow row)
		{
			EShop.Model.Account_Cart model=new EShop.Model.Account_Cart();
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
				if(row["GoodsCode"]!=null)
				{
					model.GoodsCode=row["GoodsCode"].ToString();
				}
				if(row["MarketPrice"]!=null && row["MarketPrice"].ToString()!="")
				{
					model.MarketPrice=decimal.Parse(row["MarketPrice"].ToString());
				}
				if(row["OurPrice"]!=null && row["OurPrice"].ToString()!="")
				{
					model.OurPrice=decimal.Parse(row["OurPrice"].ToString());
				}
				if(row["BuyCount"]!=null && row["BuyCount"].ToString()!="")
				{
					model.BuyCount=int.Parse(row["BuyCount"].ToString());
				}
				if(row["SubTotal"]!=null && row["SubTotal"].ToString()!="")
				{
					model.SubTotal=decimal.Parse(row["SubTotal"].ToString());
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
			strSql.Append("select Id,UserCode,GoodsCode,MarketPrice,OurPrice,BuyCount,SubTotal,Status ");
			strSql.Append(" FROM Account_Cart ");
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
			strSql.Append(" Id,UserCode,GoodsCode,MarketPrice,OurPrice,BuyCount,SubTotal,Status ");
			strSql.Append(" FROM Account_Cart ");
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
			strSql.Append("select count(1) FROM Account_Cart ");
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
			strSql.Append(")AS Row, T.*  from Account_Cart T ");
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
			parameters[0].Value = "Account_Cart";
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

