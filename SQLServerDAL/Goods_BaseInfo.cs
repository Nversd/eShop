using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using EShop.IDAL;
using Maticsoft.DBUtility;//Please add references
namespace EShop.SQLServerDAL
{
	/// <summary>
	/// 数据访问类:Goods_BaseInfo
	/// </summary>
	public partial class Goods_BaseInfo:IGoods_BaseInfo
	{
		public Goods_BaseInfo()
		{}
		#region  BasicMethod

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperSQL.GetMaxID("Id", "Goods_BaseInfo"); 
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(int Id)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from Goods_BaseInfo");
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
		public int Add(EShop.Model.Goods_BaseInfo model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into Goods_BaseInfo(");
			strSql.Append("GoodsCode,GoodsName,MarketPrice,OurPrice,Intro,Status)");
			strSql.Append(" values (");
			strSql.Append("@GoodsCode,@GoodsName,@MarketPrice,@OurPrice,@Intro,@Status)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@GoodsCode", SqlDbType.VarChar,50),
					new SqlParameter("@GoodsName", SqlDbType.VarChar,50),
					new SqlParameter("@MarketPrice", SqlDbType.Decimal,9),
					new SqlParameter("@OurPrice", SqlDbType.Decimal,9),
					new SqlParameter("@Intro", SqlDbType.VarChar,50),
					new SqlParameter("@Status", SqlDbType.Int,4)};
			parameters[0].Value = model.GoodsCode;
			parameters[1].Value = model.GoodsName;
			parameters[2].Value = model.MarketPrice;
			parameters[3].Value = model.OurPrice;
			parameters[4].Value = model.Intro;
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
		public bool Update(EShop.Model.Goods_BaseInfo model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update Goods_BaseInfo set ");
			strSql.Append("GoodsCode=@GoodsCode,");
			strSql.Append("GoodsName=@GoodsName,");
			strSql.Append("MarketPrice=@MarketPrice,");
			strSql.Append("OurPrice=@OurPrice,");
			strSql.Append("Intro=@Intro,");
			strSql.Append("Status=@Status");
			strSql.Append(" where Id=@Id");
			SqlParameter[] parameters = {
					new SqlParameter("@GoodsCode", SqlDbType.VarChar,50),
					new SqlParameter("@GoodsName", SqlDbType.VarChar,50),
					new SqlParameter("@MarketPrice", SqlDbType.Decimal,9),
					new SqlParameter("@OurPrice", SqlDbType.Decimal,9),
					new SqlParameter("@Intro", SqlDbType.VarChar,50),
					new SqlParameter("@Status", SqlDbType.Int,4),
					new SqlParameter("@Id", SqlDbType.Int,4)};
			parameters[0].Value = model.GoodsCode;
			parameters[1].Value = model.GoodsName;
			parameters[2].Value = model.MarketPrice;
			parameters[3].Value = model.OurPrice;
			parameters[4].Value = model.Intro;
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
			strSql.Append("delete from Goods_BaseInfo ");
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
			strSql.Append("delete from Goods_BaseInfo ");
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
		public EShop.Model.Goods_BaseInfo GetModel(int Id)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 Id,GoodsCode,GoodsName,MarketPrice,OurPrice,Intro,Status from Goods_BaseInfo ");
			strSql.Append(" where Id=@Id");
			SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
			parameters[0].Value = Id;

			EShop.Model.Goods_BaseInfo model=new EShop.Model.Goods_BaseInfo();
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
		public EShop.Model.Goods_BaseInfo DataRowToModel(DataRow row)
		{
			EShop.Model.Goods_BaseInfo model=new EShop.Model.Goods_BaseInfo();
			if (row != null)
			{
				if(row["Id"]!=null && row["Id"].ToString()!="")
				{
					model.Id=int.Parse(row["Id"].ToString());
				}
				if(row["GoodsCode"]!=null)
				{
					model.GoodsCode=row["GoodsCode"].ToString();
				}
				if(row["GoodsName"]!=null)
				{
					model.GoodsName=row["GoodsName"].ToString();
				}
				if(row["MarketPrice"]!=null && row["MarketPrice"].ToString()!="")
				{
					model.MarketPrice=decimal.Parse(row["MarketPrice"].ToString());
				}
				if(row["OurPrice"]!=null && row["OurPrice"].ToString()!="")
				{
					model.OurPrice=decimal.Parse(row["OurPrice"].ToString());
				}
				if(row["Intro"]!=null)
				{
					model.Intro=row["Intro"].ToString();
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
			strSql.Append("select Id,GoodsCode,GoodsName,MarketPrice,OurPrice,Intro,Status ");
			strSql.Append(" FROM Goods_BaseInfo ");
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
			strSql.Append(" Id,GoodsCode,GoodsName,MarketPrice,OurPrice,Intro,Status ");
			strSql.Append(" FROM Goods_BaseInfo ");
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
			strSql.Append("select count(1) FROM Goods_BaseInfo ");
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
			strSql.Append(")AS Row, T.*  from Goods_BaseInfo T ");
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
			parameters[0].Value = "Goods_BaseInfo";
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

