using System;
using System.Data;
using System.Collections.Generic;
using Maticsoft.Common;
using EShop.Model;
using EShop.DALFactory;
using EShop.IDAL;
namespace EShop.BLL
{
    public partial class Account_Coupon
    {
        public DataSet GetUserCouponByPage(string strWhere, string orderby, int startIndex, int endIndex) 
        {
            return dal.GetUserCouponByPage(strWhere, orderby, startIndex, endIndex);
        }
    }
}
