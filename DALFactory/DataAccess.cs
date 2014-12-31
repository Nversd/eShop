using System;
using System.Reflection;
using System.Configuration;
namespace EShop.DALFactory
{
	/// <summary>
    /// Abstract Factory pattern to create the DAL。
    /// 如果在这里创建对象报错，请检查web.config里是否修改了<add key="DAL" value="Maticsoft.SQLServerDAL" />。
	/// </summary>
	public sealed class DataAccess 
	{
        private static readonly string AssemblyPath = ConfigurationManager.AppSettings["DAL"];        
		public DataAccess()
		{ }

        #region CreateObject 

		//不使用缓存
        private static object CreateObjectNoCache(string AssemblyPath,string classNamespace)
		{		
			try
			{
				object objType = Assembly.Load(AssemblyPath).CreateInstance(classNamespace);	
				return objType;
			}
			catch//(System.Exception ex)
			{
				//string str=ex.Message;// 记录错误日志
				return null;
			}			
			
        }
		//使用缓存
		private static object CreateObject(string AssemblyPath,string classNamespace)
		{			
			object objType = DataCache.GetCache(classNamespace);
			if (objType == null)
			{
				try
				{
					objType = Assembly.Load(AssemblyPath).CreateInstance(classNamespace);					
					DataCache.SetCache(classNamespace, objType);// 写入缓存
				}
				catch//(System.Exception ex)
				{
					//string str=ex.Message;// 记录错误日志
				}
			}
			return objType;
		}
        #endregion

        #region 泛型生成
        ///// <summary>
        ///// 创建数据层接口。
        ///// </summary>
        //public static t Create(string ClassName)
        //{

        //    string ClassNamespace = AssemblyPath +"."+ ClassName;
        //    object objType = CreateObject(AssemblyPath, ClassNamespace);
        //    return (t)objType;
        //}
        #endregion

        #region CreateSysManage
        public static EShop.IDAL.ISysManage CreateSysManage()
		{
			//方式1			
			//return (EShop.IDAL.ISysManage)Assembly.Load(AssemblyPath).CreateInstance(AssemblyPath+".SysManage");

			//方式2 			
			string classNamespace = AssemblyPath+".SysManage";	
			object objType=CreateObject(AssemblyPath,classNamespace);
            return (EShop.IDAL.ISysManage)objType;		
		}
		#endregion
             
        
   
		/// <summary>
		/// 创建Account_Cart数据层接口。
		/// </summary>
		public static EShop.IDAL.IAccount_Cart CreateAccount_Cart()
		{

			string ClassNamespace = AssemblyPath +".Account_Cart";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (EShop.IDAL.IAccount_Cart)objType;
		}

		/// <summary>
		/// 创建Account_Consignee数据层接口。
		/// </summary>
		public static EShop.IDAL.IAccount_Consignee CreateAccount_Consignee()
		{

			string ClassNamespace = AssemblyPath +".Account_Consignee";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (EShop.IDAL.IAccount_Consignee)objType;
		}

		/// <summary>
		/// 创建Account_Coupon数据层接口。
		/// </summary>
		public static EShop.IDAL.IAccount_Coupon CreateAccount_Coupon()
		{

			string ClassNamespace = AssemblyPath +".Account_Coupon";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (EShop.IDAL.IAccount_Coupon)objType;
		}

		/// <summary>
		/// 创建Account_Goods数据层接口。
		/// </summary>
		public static EShop.IDAL.IAccount_Goods CreateAccount_Goods()
		{

			string ClassNamespace = AssemblyPath +".Account_Goods";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (EShop.IDAL.IAccount_Goods)objType;
		}

		/// <summary>
		/// 创建Account_PwdTip数据层接口。
		/// </summary>
		public static EShop.IDAL.IAccount_PwdTip CreateAccount_PwdTip()
		{

			string ClassNamespace = AssemblyPath +".Account_PwdTip";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (EShop.IDAL.IAccount_PwdTip)objType;
		}

		/// <summary>
		/// 创建Account_User数据层接口。
		/// </summary>
		public static EShop.IDAL.IAccount_User CreateAccount_User()
		{

			string ClassNamespace = AssemblyPath +".Account_User";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (EShop.IDAL.IAccount_User)objType;
		}

		/// <summary>
		/// 创建Account_UserDetails数据层接口。
		/// </summary>
		public static EShop.IDAL.IAccount_UserDetails CreateAccount_UserDetails()
		{

			string ClassNamespace = AssemblyPath +".Account_UserDetails";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (EShop.IDAL.IAccount_UserDetails)objType;
		}

		/// <summary>
		/// 创建Goods_BaseInfo数据层接口。
		/// </summary>
		public static EShop.IDAL.IGoods_BaseInfo CreateGoods_BaseInfo()
		{

			string ClassNamespace = AssemblyPath +".Goods_BaseInfo";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (EShop.IDAL.IGoods_BaseInfo)objType;
		}

		/// <summary>
		/// 创建Goods_Coupon数据层接口。
		/// </summary>
		public static EShop.IDAL.IGoods_Coupon CreateGoods_Coupon()
		{

			string ClassNamespace = AssemblyPath +".Goods_Coupon";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (EShop.IDAL.IGoods_Coupon)objType;
		}

		/// <summary>
		/// 创建Goods_Order数据层接口。
		/// </summary>
		public static EShop.IDAL.IGoods_Order CreateGoods_Order()
		{

			string ClassNamespace = AssemblyPath +".Goods_Order";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (EShop.IDAL.IGoods_Order)objType;
		}

		/// <summary>
		/// 创建System_Dictionary数据层接口。
		/// </summary>
		public static EShop.IDAL.ISystem_Dictionary CreateSystem_Dictionary()
		{

			string ClassNamespace = AssemblyPath +".System_Dictionary";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (EShop.IDAL.ISystem_Dictionary)objType;
		}

}
}