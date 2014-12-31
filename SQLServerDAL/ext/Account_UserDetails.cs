using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using EShop.IDAL;
using Maticsoft.DBUtility;
namespace EShop.SQLServerDAL
{
    public partial class Account_UserDetails:IAccount_UserDetails
    {
        public int UpdateBasicInfo(EShop.Model.Account_User objUser, EShop.Model.Account_UserDetails objUserDetails) 
        {
            Account_User dalUser = new Account_User();
            SqlConnection conn = new SqlConnection(DbHelperSQL.connectionString);
            conn.Open();
            SqlTransaction tran = null;
            try
            {
                tran = conn.BeginTransaction();
                if (dalUser.Update(objUser)) 
                {
                    if (Exists(objUserDetails.Id))
                    {
                        Update(objUserDetails);
                        return 1;
                    }
                    else 
                    {
                        Add(objUserDetails);
                        return 1;
                    }
                }
                tran.Commit();
            }
            catch (Exception)
            {
                tran.Rollback();
            }
            return -1;
        }
    }
}
