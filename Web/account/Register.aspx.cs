using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class account_Register : System.Web.UI.Page
{
    private EShop.BLL.Account_User bllUser = new EShop.BLL.Account_User();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "transfer", "<script>window.history.back();</script>");
            return;
        }
    }

    protected void btn_register_Click(object sender, EventArgs e)
    {
        string UserName = this.username.Value;
        string Password = this.password.Value;
        string RePassword = this.repassword.Value;
        string Email = this.email.Value;
        
        //密码是否一致
        if (!Password.Equals(RePassword)) 
        {
            this.repwdchk.InnerText = "两次输入的密码不一致！";
            return;
        }
        //用户名是否存在 邮箱是否已经被注册
        DataTable dt = bllUser.GetList(string.Format(" AccountName = '{0}' or Email = '{1}'", UserName, Email)).Tables[0];
        foreach (DataRow row in dt.Rows) 
        {
            if (row.Field<string>("AccountName") == UserName) 
            {
                this.namechk.InnerText = "该用户名已被注册！";
                return;
            }
            if (row.Field<string>("Email") == Email) 
            {
                this.emailchk.InnerText = "该邮箱已被注册！";
                return;
            }
        }
        EShop.Model.Account_User objUser = new EShop.Model.Account_User();
        objUser.UserCode = Guid.NewGuid().ToString().Replace("-", "");
        objUser.AccountName = UserName;
        objUser.Password = Password;
        objUser.Email = Email;
        objUser.Status = 1;     //1正常 0禁用 
        if (bllUser.Add(objUser) <= 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "wrong", "<script>alert('注册失败！请重试！');</script>");
        }
        else 
        {
            //将User加入Session
            Session["User"] = objUser;
            //页面跳转至商品介绍页
            Server.Transfer("~/product/Omate.aspx");
        }
    }
}