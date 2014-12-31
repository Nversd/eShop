using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class account_UserCoupon : System.Web.UI.Page
{
    private EShop.BLL.Goods_Order bllOrder = new EShop.BLL.Goods_Order();
    private EShop.BLL.Account_Coupon bllCoupon = new EShop.BLL.Account_Coupon();
    private int pageSize = 10;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) 
        {
            if (Session["User"] == null)
            {
                Response.Redirect("~/account/Login.aspx", true);
            }
            PagerBind();
            OrdersBind(pageSize, 1);
        }
    }

    void PagerBind()
    {
        int Count = bllOrder.GetRecordCount("");
        this.totalCount.Text = Count.ToString();
        int pageCount = Count % pageSize == 0 ? (Count / pageSize) : (Count / pageSize + 1);
        this.totalPage.Text = pageCount.ToString();
        this.pageIndex.Items.Clear();
        for (int i = 1; i < pageCount + 1; i++)
        {
            this.pageIndex.Items.Add(i + "");
        }
    }

    void OrdersBind(int pagesize, int pageindex)
    {
        EShop.Model.Account_User objUser = Session["User"] as EShop.Model.Account_User;
        StringBuilder strbody = new StringBuilder();
        DataTable dt = bllCoupon.GetUserCouponByPage(" UserCode = '" + objUser.UserCode + "'", "Id", pagesize * (pageindex - 1), pagesize * pageindex).Tables[0];
        foreach (DataRow row in dt.Rows)
        {
            strbody.Append("<tr>");
            strbody.Append("<td align='center' bgcolor='#FFFFFF'>" + row["CouponCode"] + "</td>");
            strbody.Append("<td align='center' bgcolor='#FFFFFF'>" + row["CouponName"] + "</td>");
            strbody.Append("<td align='center' bgcolor='#FFFFFF'>" + string.Format("{0:c2}", row["Price"]) + "</td>");
            strbody.Append("<td align='center' bgcolor='#FFFFFF'>" + string.Format("{0:c2}", row["MinOrPrice"]) + "</td>");
            strbody.Append("<td align='center' bgcolor='#FFFFFF'>" + DateTime.Parse(row["AbortUseDate"].ToString()).ToString("yyyy-MM-dd") + "</td>");
            strbody.Append("<td align='center' bgcolor='#FFFFFF'>" + ConvertCouponStatus(row["Status"].ToString()) + "</td>");
            strbody.Append("</tr>");
        }
        this.tbody.InnerHtml = strbody.ToString();
        this.currentPage.Value = pageindex.ToString();
    }

    string ConvertCouponStatus(string status) 
    {
        switch (status) 
        {
            case "1": 
                {
                    return "未使用";
                }
            case "2":
                {
                    return "已使用";
                }
            default :
                {
                    return "无效";
                }
        }
    }

    protected void pageIndex_SelectedIndexChanged(object sender, EventArgs e)
    {
        OrdersBind(pageSize, int.Parse(this.pageIndex.SelectedItem.Text));
    }
    protected void PageChange_Click(object sender, EventArgs e)
    {
        int pageIndex = int.Parse(this.currentPage.Value);
        int totalPage = int.Parse(this.totalPage.Text);
        LinkButton link = sender as LinkButton;
        switch (link.CommandName)
        {
            case "First":
                {
                    OrdersBind(pageSize, 1);
                    break;
                }
            case "Prev":
                {
                    OrdersBind(pageSize, pageIndex <= 1 ? 1 : (pageIndex - 1));
                    break;
                }
            case "Next":
                {
                    OrdersBind(pageSize, pageIndex >= totalPage ? totalPage : (pageIndex + 1));
                    break;
                }
            case "Last":
                {
                    OrdersBind(pageSize, totalPage);
                    break;
                }
        }
    }
}