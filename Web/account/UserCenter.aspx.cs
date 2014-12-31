using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class account_UserCenter : System.Web.UI.Page
{
    private EShop.BLL.Account_PwdTip bllTip = new EShop.BLL.Account_PwdTip();
    private EShop.BLL.Account_UserDetails bllUserDetails = new EShop.BLL.Account_UserDetails();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) 
        {
            if (Session["User"] == null) 
            {
                Response.Redirect("~/account/Login.aspx", true);
            }
            DropDownListBind();
            FormInitialize();
        }
    }

    void DropDownListBind() 
    {
        this.passQuestion.DataSource = bllTip.GetAllList().Tables[0];
        this.passQuestion.DataTextField = "TipTitle";
        this.passQuestion.DataValueField = "TipCode";
        this.passQuestion.DataBind();
    }

    void FormInitialize() 
    {
        EShop.Model.Account_User objUser = Session["User"] as EShop.Model.Account_User;
        this.email.Text = objUser.Email;
        EShop.Model.Account_UserDetails objUserDetails = bllUserDetails.GetModelList(string.Format(" UserCode = '{0}'", objUser.UserCode)).FirstOrDefault();
        if (objUserDetails != null) 
        {
            this.birthday.Value = objUserDetails.Birthday.Value.ToString("yyyy/MM/dd");
            this.gender.SelectedValue = objUserDetails.Gender.ToString();
            this.offictel.Value = objUserDetails.OfficeTEL;
            this.familytel.Value = objUserDetails.FamilyTEL;
            this.cellphone.Text = objUserDetails.Phone;
            this.passQuestion.SelectedValue = objUserDetails.PwdTipCode;
            this.pwdanswer.Value = objUserDetails.PwdTipAns;
        }
    }

    protected void btn_SaveBasicInfo_Click(object sender, EventArgs e)
    {
        EShop.Model.Account_User objUser = Session["User"] as EShop.Model.Account_User;
        EShop.Model.Account_UserDetails objUserDetails = bllUserDetails.GetModelList(string.Format(" UserCode = '{0}'", objUser.UserCode)).FirstOrDefault();
        objUserDetails = objUserDetails == null ? new EShop.Model.Account_UserDetails() : objUserDetails;
        objUser.Email = this.email.Text;
        objUserDetails.UserCode = objUser.UserCode;
        try
        {
            objUserDetails.Birthday = DateTime.Parse(this.birthday.Value);
        }
        catch (Exception)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "failed", "<script>alert('更新失败！请填写生日！');</script>");
            return;
        }
        objUserDetails.Gender = int.Parse(this.gender.SelectedValue);
        objUserDetails.OfficeTEL = this.offictel.Value;
        objUserDetails.FamilyTEL = this.familytel.Value;
        objUserDetails.Phone = this.cellphone.Text;
        objUserDetails.PwdTipCode = this.passQuestion.SelectedValue;
        objUserDetails.PwdTipAns = this.pwdanswer.Value;
        if (bllUserDetails.UpdateBasicInfo(objUser, objUserDetails) == 1)
            Page.ClientScript.RegisterStartupScript(this.GetType(), "success", "<script>alert('更新成功！');</script>");
        else
            Page.ClientScript.RegisterStartupScript(this.GetType(), "failed", "<script>alert('更新失败！');</script>");
    }

    protected void btn_ChangePwd_Click(object sender, EventArgs e)
    {
        EShop.Model.Account_User objUser = Session["User"] as EShop.Model.Account_User;
        bool result = false;
        if (objUser.Password.Equals(this.oldpassword.Value))
        {
            if (this.newpassword.Value.Equals(this.confirmpassword.Value))
            {
                objUser.Password = this.newpassword.Value;
                result = true;
            }
        }
        if(result)
            Page.ClientScript.RegisterStartupScript(this.GetType(), "failed", "<script>alert('更新成功！');</script>");
        else
            Page.ClientScript.RegisterStartupScript(this.GetType(), "failed", "<script>alert('更新失败！');</script>");
    }
}