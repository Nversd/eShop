using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using EShop.IDAL;
using Maticsoft.DBUtility;//Please add references
namespace EShop.SQLServerDAL
{
	/// <summary>
	/// 数据访问类:Goods_Coupon
	/// </summary>
	public partial class Goods_Coupon:IGoods_Coupon
	{
		public Goods_Coupon()
		{}
		#region  BasicMethod

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperSQL.GetMaxID("Id", "Goods_Coupon"); 
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(int Id)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from Goods_Coupon");
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
		public int Add(EShop.Model.Goods_Coupon model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into Goods_Coupon(");
			strSql.Append("CouponCode,CouponName,Price,MinOrPrice,AbortUseDate,Status)");
			strSql.Append(" values (");
			strSql.Append("@CouponCode,@CouponName,@Price,@MinOrPrice,@AbortUseDate,@Status)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@CouponCode", SqlDbType.VarChar,50),
					new SqlParameter("@CouponName", SqlDbType.VarChar,50),
					new SqlParameter("@Price", SqlDbType.Decimal,9),
					new SqlParameter("@MinOrPrice", SqlDbType.Decimal,9),
					new SqlParameter("@AbortUseDate", SqlDbType.Date,3),
					new SqlParameter("@Status", SqlDbType.Int,4)};
			parameters[0].Value = model.CouponCode;
			parameters[1].Value = model.CouponName;
			parameters[2].Value = model.Price;
			parameters[3].Value = model.MinOrPrice;
			parameters[4].Value = model.AbortUseDate;
			parameters[5].Value = model.Status;

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
		public bool Update(EShop.Model.Goods_Coupon model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update Goods_Coupon set ");
			strSql.Append("CouponCode=@CouponCode,");
			strSql.Append("CouponName=@CouponName,");
			strSql.Append("Price=@Price,");
			strSql.Append("MinOrPrice=@MinOrPrice,");
			strSql.Append("AbortUseDate=@AbortUseDate,");
			strSql.Append("Status=@Status");
			strSql.Append(" where Id=@Id");
			SqlParameter[] parameters = {
					new SqlParameter("@CouponCode", SqlDbType.VarChar,50),
					new SqlParameter("@CouponName", SqlDbType.VarChar,50),
					new SqlParameter("@Price", SqlDbType.Decimal,9),
					new SqlParameter("@MinOrPrice", SqlDbType.Decimal,9),
					new SqlParameter("@AbortUseDate", SqlDbType.Date,3),
					new SqlParameter("@Status", SqlDbType.Int,4),
					new SqlParameter("@Id", SqlDbType.Int,4)};
			parameters[0].Value = model.CouponCode;
			parameters[1].Value = model.CouponName;
			parameters[2].Value = model.Price;
			parameters[3].Value = model.MinOrPrice;
			parameters[4].Value = model.AbortUseDate;
			parameters[5].Value = model.Status;
			parameters[6].Value = model.Id;

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
			strSql.Append("delete from Goods_Coupon ");
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
			strSql.Append("delete from Goods_Coupon ");
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
		public EShop.Model.Goods_Coupon GetModel(int Id)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 Id,CouponCode,CouponName,Price,MinOrPrice,AbortUseDate,Status from Goods_Coupon ");
			strSql.Append(" where Id=@Id");
			SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
			parameters[0].Value = Id;

			EShop.Model.Goods_Coupon model=new EShop.Model.Goods_Coupon();
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
		public EShop.Model.Goods_Coupon DataRowToModel(DataRow row)
		{
			EShop.Model.Goods_Coupon model=new EShop.Model.Goods_Coupon();
			if (row != null)
			{
				if(row["Id"]!=null && row["Id"].ToString()!="")
				{
					model.Id=int.Parse(row["Id"].ToString());
				}
				if(row["CouponCode"]!=null)
				{
					model.CouponCode=row["CouponCode"].ToString();
				}
				if(row["CouponName"]!=null)
				{
					model.CouponName=row["CouponName"].ToString();
				}
				if(row["Price"]!=null && row["Price"].ToString()!="")
				{
					model.Price=decimal.Parse(row["Price"].ToString());
				}
				if(row["MinOrPrice"]!=null && row["MinOrPrice"].ToString()!="")
				{
					model.MinOrPrice=decimal.Parse(row["MinOrPrice"].ToString());
				}
				if(row["AbortUseDate"]!=null && row["AbortUseDate"].ToString()!="")
				{
					model.AbortUseDate=DateTime.Parse(row["AbortUseDate"].ToString());
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
			strSql.Append("select Id,CouponCode,CouponName,Price,MinOrPrice,AbortUseDate,Status ");
			strSql.Append(" FROM Goods_Coupon ");
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
			strSql.Append(" Id,CouponCode,CouponName,Price,MinOrPrice,AbortUseDate,Status ");
			strSql.Append(" FROM Goods_Coupon ");
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
			strSql.Append("select count(1) FROM Goods_Coupon ");
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
			strSql.Append(")AS Row, T.*  from Goods_Coupon T ");
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
			parameters[0].Value = "Goods_Coupon";
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

