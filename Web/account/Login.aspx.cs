using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class account_Login : System.Web.UI.Page
{
    private EShop.BLL.Account_User bllUser = new EShop.BLL.Account_User();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) 
        {
            if (Session["User"] != null)
            {
                Response.Redirect("~/product/Omate.aspx", true);
                return;
            }
        }
    }

    protected void btn_Login_Click(object sender, EventArgs e)
    {
        Session["User"] = null;
        string UserName = this.username.Value;
        string Password = this.password.Value;

        EShop.Model.Account_User objUser = bllUser.GetModelList(string.Format(" AccountName = '{0}'", UserName)).FirstOrDefault();
        if (objUser == null)
        {
            this.usernameTip.InnerText = "用户名不存在或密码错误！";
        }
        else 
        {
            if (objUser.Password != Password)
            {
                this.usernameTip.InnerText = "用户名不存在或密码错误！";
            }
            else 
            {
                //跳转至Back Page
                Session["User"] = objUser;
                Response.Redirect("~/product/Omate.aspx", true);
            }
        }
    }
}