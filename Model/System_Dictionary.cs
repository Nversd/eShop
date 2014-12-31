using System;
namespace EShop.Model
{
	/// <summary>
	/// System_Dictionary:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class System_Dictionary
	{
		public System_Dictionary()
		{}
		#region Model
		private int _id;
		private string _code;
		private string _name;
		private string _pcode;
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
		public string Code
		{
			set{ _code=value;}
			get{return _code;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Name
		{
			set{ _name=value;}
			get{return _name;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string PCode
		{
			set{ _pcode=value;}
			get{return _pcode;}
		}
		#endregion Model

	}
}

