using System;
namespace EShop.Model
{
	/// <summary>
	/// Account_UserDetails:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class Account_UserDetails
	{
		public Account_UserDetails()
		{}
		#region Model
		private int _id;
		private string _usercode;
		private DateTime? _birthday;
		private int? _gender;
		private string _officetel;
		private string _familytel;
		private string _phone;
		private string _pwdtipcode;
		private string _pwdtipans;
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
		public DateTime? Birthday
		{
			set{ _birthday=value;}
			get{return _birthday;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? Gender
		{
			set{ _gender=value;}
			get{return _gender;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string OfficeTEL
		{
			set{ _officetel=value;}
			get{return _officetel;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string FamilyTEL
		{
			set{ _familytel=value;}
			get{return _familytel;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Phone
		{
			set{ _phone=value;}
			get{return _phone;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string PwdTipCode
		{
			set{ _pwdtipcode=value;}
			get{return _pwdtipcode;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string PwdTipAns
		{
			set{ _pwdtipans=value;}
			get{return _pwdtipans;}
		}
		#endregion Model

	}
}

