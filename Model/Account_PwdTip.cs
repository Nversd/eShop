using System;
namespace EShop.Model
{
	/// <summary>
	/// Account_PwdTip:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class Account_PwdTip
	{
		public Account_PwdTip()
		{}
		#region Model
		private int _tipcode;
		private string _tiptitle;
		/// <summary>
		/// 
		/// </summary>
		public int TipCode
		{
			set{ _tipcode=value;}
			get{return _tipcode;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string TipTitle
		{
			set{ _tiptitle=value;}
			get{return _tiptitle;}
		}
		#endregion Model

	}
}

