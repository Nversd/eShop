using System;
using System.Data;
using System.Collections.Generic;
using Maticsoft.Common;
using EShop.Model;
using EShop.DALFactory;
using EShop.IDAL;
namespace EShop.BLL
{
	/// <summary>
	/// Account_PwdTip
	/// </summary>
	public partial class Account_PwdTip
	{
		private readonly IAccount_PwdTip dal=DataAccess.CreateAccount_PwdTip();
		public Account_PwdTip()
		{}
		#region  BasicMethod

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
			return dal.GetMaxId();
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(int TipCode)
		{
			return dal.Exists(TipCode);
		}

		/// <summary>
		/// 增加一条数据
		/// </summary>
		public int  Add(EShop.Model.Account_PwdTip model)
		{
			return dal.Add(model);
		}

		/// <summary>
		/// 更新一条数据
		/// </summary>
		public bool Update(EShop.Model.Account_PwdTip model)
		{
			return dal.Update(model);
		}

		/// <summary>
		/// 删除一条数据
		/// </summary>
		public bool Delete(int TipCode)
		{
			
			return dal.Delete(TipCode);
		}
		/// <summary>
		/// 删除一条数据
		/// </summary>
		public bool DeleteList(string TipCodelist )
		{
			return dal.DeleteList(TipCodelist );
		}

		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		public EShop.Model.Account_PwdTip GetModel(int TipCode)
		{
			
			return dal.GetModel(TipCode);
		}

		/// <summary>
		/// 得到一个对象实体，从缓存中
		/// </summary>
		public EShop.Model.Account_PwdTip GetModelByCache(int TipCode)
		{
			
			string CacheKey = "Account_PwdTipModel-" + TipCode;
			object objModel = Maticsoft.Common.DataCache.GetCache(CacheKey);
			if (objModel == null)
			{
				try
				{
					objModel = dal.GetModel(TipCode);
					if (objModel != null)
					{
						int ModelCache = Maticsoft.Common.ConfigHelper.GetConfigInt("ModelCache");
						Maticsoft.Common.DataCache.SetCache(CacheKey, objModel, DateTime.Now.AddMinutes(ModelCache), TimeSpan.Zero);
					}
				}
				catch{}
			}
			return (EShop.Model.Account_PwdTip)objModel;
		}

		/// <summary>
		/// 获得数据列表
		/// </summary>
		public DataSet GetList(string strWhere)
		{
			return dal.GetList(strWhere);
		}
		/// <summary>
		/// 获得前几行数据
		/// </summary>
		public DataSet GetList(int Top,string strWhere,string filedOrder)
		{
			return dal.GetList(Top,strWhere,filedOrder);
		}
		/// <summary>
		/// 获得数据列表
		/// </summary>
		public List<EShop.Model.Account_PwdTip> GetModelList(string strWhere)
		{
			DataSet ds = dal.GetList(strWhere);
			return DataTableToList(ds.Tables[0]);
		}
		/// <summary>
		/// 获得数据列表
		/// </summary>
		public List<EShop.Model.Account_PwdTip> DataTableToList(DataTable dt)
		{
			List<EShop.Model.Account_PwdTip> modelList = new List<EShop.Model.Account_PwdTip>();
			int rowsCount = dt.Rows.Count;
			if (rowsCount > 0)
			{
				EShop.Model.Account_PwdTip model;
				for (int n = 0; n < rowsCount; n++)
				{
					model = dal.DataRowToModel(dt.Rows[n]);
					if (model != null)
					{
						modelList.Add(model);
					}
				}
			}
			return modelList;
		}

		/// <summary>
		/// 获得数据列表
		/// </summary>
		public DataSet GetAllList()
		{
			return GetList("");
		}

		/// <summary>
		/// 分页获取数据列表
		/// </summary>
		public int GetRecordCount(string strWhere)
		{
			return dal.GetRecordCount(strWhere);
		}
		/// <summary>
		/// 分页获取数据列表
		/// </summary>
		public DataSet GetListByPage(string strWhere, string orderby, int startIndex, int endIndex)
		{
			return dal.GetListByPage( strWhere,  orderby,  startIndex,  endIndex);
		}
		/// <summary>
		/// 分页获取数据列表
		/// </summary>
		//public DataSet GetList(int PageSize,int PageIndex,string strWhere)
		//{
			//return dal.GetList(PageSize,PageIndex,strWhere);
		//}

		#endregion  BasicMethod
		#region  ExtensionMethod

		#endregion  ExtensionMethod
	}
}

