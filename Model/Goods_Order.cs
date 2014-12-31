using System;
namespace EShop.Model
{
	/// <summary>
	/// Goods_Order:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class Goods_Order
	{
		public Goods_Order()
		{}
		#region Model
		private int _id;
		private string _ordercode;
		private string _orderer;
		private string _goodscode;
		private decimal? _dealprice;
		private int? _gcount;
		private decimal? _total;
		private DateTime? _orderdate;
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
		public string OrderCode
		{
			set{ _ordercode=value;}
			get{return _ordercode;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Orderer
		{
			set{ _orderer=value;}
			get{return _orderer;}
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
		public decimal? DealPrice
		{
			set{ _dealprice=value;}
			get{return _dealprice;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? Gcount
		{
			set{ _gcount=value;}
			get{return _gcount;}
		}
		/// <summary>
		/// 
		/// </summary>
		public decimal? Total
		{
			set{ _total=value;}
			get{return _total;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? OrderDate
		{
			set{ _orderdate=value;}
			get{return _orderdate;}
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

