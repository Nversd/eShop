using System;
namespace EShop.Model
{
	/// <summary>
	/// Goods_BaseInfo:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class Goods_BaseInfo
	{
		public Goods_BaseInfo()
		{}
		#region Model
		private int _id;
		private string _goodscode;
		private string _goodsname;
		private decimal? _marketprice;
		private decimal? _ourprice;
		private string _intro;
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
		public string GoodsCode
		{
			set{ _goodscode=value;}
			get{return _goodscode;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string GoodsName
		{
			set{ _goodsname=value;}
			get{return _goodsname;}
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
		public string Intro
		{
			set{ _intro=value;}
			get{return _intro;}
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

