using System;
using System.Data;
using System.Collections.Generic;
using Maticsoft.Common;
using EShop.Model;
using EShop.DALFactory;
using EShop.IDAL;
namespace EShop.BLL
{
    public partial class Account_UserDetails
    {
        public int UpdateBasicInfo(EShop.Model.Account_User objUser, EShop.Model.Account_UserDetails objUserDetails) 
        {
            return dal.UpdateBasicInfo(objUser, objUserDetails);
        }
    }
}
