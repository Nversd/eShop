using System;
namespace EShop.Model
{
	/// <summary>
	/// Goods_Coupon:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class Goods_Coupon
	{
		public Goods_Coupon()
		{}
		#region Model
		private int _id;
		private string _couponcode;
		private string _couponname;
		private decimal? _price;
		private decimal? _minorprice;
		private DateTime? _abortusedate;
		private int? _status;
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
		public string CouponCode
		{
			set{ _couponcode=value;}
			get{return _couponcode;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string CouponName
		{
			set{ _couponname=value;}
			get{return _couponname;}
		}
		/// <summary>
		/// 
		/// </summary>
		public decimal? Price
		{
			set{ _price=value;}
			get{return _price;}
		}
		/// <summary>
		/// 
		/// </summary>
		public decimal? MinOrPrice
		{
			set{ _minorprice=value;}
			get{return _minorprice;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? AbortUseDate
		{
			set{ _abortusedate=value;}
			get{return _abortusedate;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? Status
		{
			set{ _status=value;}
			get{return _status;}
		}
		#endregion Model

	}
}

