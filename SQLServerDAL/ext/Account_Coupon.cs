using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using EShop.IDAL;
using Maticsoft.DBUtility;//Please add references
namespace EShop.SQLServerDAL
{
    public partial class Account_Coupon : IAccount_Coupon
    {
        public DataSet GetUserCouponByPage(string strWhere, string orderby, int startIndex, int endIndex)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT * FROM ( ");
            strSql.Append(" SELECT ROW_NUMBER() OVER (");
            if (!string.IsNullOrEmpty(orderby.Trim()))
            {
                strSql.Append("order by T." + orderby);
            }
            else
            {
                strSql.Append("order by T.Id desc");
            }
            strSql.Append(")AS Row, T.*  from (select ac.UserCode,gc.* from Account_Coupon ac left join Goods_Coupon gc on ac.CouponCode = gc.CouponCode) T ");
            if (!string.IsNullOrEmpty(strWhere.Trim()))
            {
                strSql.Append(" WHERE " + strWhere);
            }
            strSql.Append(" ) TT");
            strSql.AppendFormat(" WHERE TT.Row between {0} and {1}", startIndex, endIndex);
            return DbHelperSQL.Query(strSql.ToString());
        }
    }
}
