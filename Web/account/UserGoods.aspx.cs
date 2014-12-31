using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class account_UserGoods : System.Web.UI.Page
{
    private EShop.BLL.Goods_Order bllOrder = new EShop.BLL.Goods_Order();
    private int pageSize = 10;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    void PagerBind() 
    {
        int pageCount = bllOrder.GetRecordCount("");
        this.totalCount.Text = pageCount.ToString();
        this.totalPage.Text = pageCount % pageSize == 0 ? (pageCount / pageSize) + "" : (pageCount / pageSize + 1) + "";
        this.pageIndex.Items.Clear();
        for (int i = 1; i < pageCount + 1; i++)
        {
            this.pageIndex.Items.Add(i + "");
        }
    }

    void OrdersBind(int pagesize, int pageindex)
    {
        StringBuilder strbody = new StringBuilder();
        DataTable dt = bllOrder.GetListByPage("", "", pagesize * (pageindex - 1), pagesize * pageindex).Tables[0];
        foreach (DataRow row in dt.Rows)
        {
            strbody.Append("<tr>");
            strbody.Append("<td>" + row["OrderCode"] + "</td>");
            strbody.Append("<td>" + row["OrderDate"] + "</td>");
            strbody.Append("<td>" + row["Total"] + "</td>");
            strbody.Append("<td>" + row["Status"] + "</td>");
            strbody.Append("<td>删除</td>");
            strbody.Append("</tr>");
        }
        this.tbody.InnerHtml = strbody.ToString();
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