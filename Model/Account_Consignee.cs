using System;
namespace EShop.Model
{
	/// <summary>
	/// Account_Consignee:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class Account_Consignee
	{
		public Account_Consignee()
		{}
		#region Model
		private int _id;
		private string _consigneecode;
		private string _deliveryarea;
		private string _consigneename;
		private string _email;
		private string _areadetails;
		private string _postcode;
		private string _telphone;
		private string _cellphone;
		private string _flagbuilding;
		private DateTime? _bestdeliverdate;
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
		public string ConsigneeCode
		{
			set{ _consigneecode=value;}
			get{return _consigneecode;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string DeliveryArea
		{
			set{ _deliveryarea=value;}
			get{return _deliveryarea;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string ConsigneeName
		{
			set{ _consigneename=value;}
			get{return _consigneename;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Email
		{
			set{ _email=value;}
			get{return _email;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string AreaDetails
		{
			set{ _areadetails=value;}
			get{return _areadetails;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string PostCode
		{
			set{ _postcode=value;}
			get{return _postcode;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Telphone
		{
			set{ _telphone=value;}
			get{return _telphone;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Cellphone
		{
			set{ _cellphone=value;}
			get{return _cellphone;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string FlagBuilding
		{
			set{ _flagbuilding=value;}
			get{return _flagbuilding;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? BestDeliverDate
		{
			set{ _bestdeliverdate=value;}
			get{return _bestdeliverdate;}
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

