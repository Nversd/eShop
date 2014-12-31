using System;
namespace EShop.Model
{
	/// <summary>
	/// Account_Goods:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class Account_Goods
	{
		public Account_Goods()
		{}
		#region Model
		private int _id;
		private string _goodscode;
		private string _dealer;
		private DateTime? _dealdate;
		private DateTime? _krepairstart;
		private DateTime? _krepairover;
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
		public string Dealer
		{
			set{ _dealer=value;}
			get{return _dealer;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? DealDate
		{
			set{ _dealdate=value;}
			get{return _dealdate;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? KRepairStart
		{
			set{ _krepairstart=value;}
			get{return _krepairstart;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? KRepairOver
		{
			set{ _krepairover=value;}
			get{return _krepairover;}
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

