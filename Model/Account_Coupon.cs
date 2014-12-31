using System;
namespace EShop.Model
{
	/// <summary>
	/// Account_Coupon:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class Account_Coupon
	{
		public Account_Coupon()
		{}
		#region Model
		private int _id;
		private string _usercode;
		private string _couponcode;
		/// <summary>
		/// 
		/// </summary>
		public int Id
		{
			set{ _id=value;}
			get{return _id;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string UserCode
		{
			set{ _usercode=value;}
			get{return _usercode;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string CouponCode
		{
			set{ _couponcode=value;}
			get{return _couponcode;}
		}
		#endregion Model

	}
}

