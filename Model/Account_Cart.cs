using System;
namespace EShop.Model
{
	/// <summary>
	/// Account_Cart:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class Account_Cart
	{
		public Account_Cart()
		{}
		#region Model
		private int _id;
		private string _usercode;
		private string _goodscode;
		private decimal? _marketprice;
		private decimal? _ourprice;
		private int? _buycount;
		private decimal? _subtotal;
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
		public string UserCode
		{
			set{ _usercode=value;}
			get{return _usercode;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string GoodsCode
		{
			set{ _goodscode=value;}
			get{return _goodscode;}
		}
		/// <summary>
		/// 
		/// </summary>
		public decimal? MarketPrice
		{
			set{ _marketprice=value;}
			get{return _marketprice;}
		}
		/// <summary>
		/// 
		/// </summary>
		public decimal? OurPrice
		{
			set{ _ourprice=value;}
			get{return _ourprice;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? BuyCount
		{
			set{ _buycount=value;}
			get{return _buycount;}
		}
		/// <summary>
		/// 
		/// </summary>
		public decimal? SubTotal
		{
			set{ _subtotal=value;}
			get{return _subtotal;}
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

