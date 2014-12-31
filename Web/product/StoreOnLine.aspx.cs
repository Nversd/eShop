using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class product_StoreOnLine : System.Web.UI.Page
{
    private EShop.BLL.Goods_Order bllOrder = new EShop.BLL.Goods_Order();
    private EShop.BLL.Goods_BaseInfo bllBasic = new EShop.BLL.Goods_BaseInfo();
    private EShop.BLL.Account_Cart bllCart = new EShop.BLL.Account_Cart();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) 
        {
            GoodsBind();
            
        }
    }

    void GoodsBind() 
    {
        StringBuilder strGList = new StringBuilder();
        List<EShop.Model.Goods_BaseInfo> gList = bllBasic.GetModelList(" GoodsName = 'Omate' and Status = '1'");
        foreach (EShop.Model.Goods_BaseInfo item in gList)
        {
            strGList.Append("<li value='" + item.GoodsCode + "' style='background: url(../resource/tao" + item.GoodsCode + ".png)'></li>");
        }
        this.glist.InnerHtml = strGList.ToString();
    }

    protected void btn_Submit_Click(object sender, EventArgs e)
    {
        EShop.Model.Account_User objUser = Session["User"] as EShop.Model.Account_User;
        if (objUser == null)
        {
            Server.Transfer("~/account/Login.aspx");
        }
        else 
        {
            bool isNew = false;
            EShop.Model.Account_Cart objCart = null;
            objCart = bllCart.GetModelList(string.Format(" UserCode = '{0}' and GoodsCode = '{1}' and Status = '1'", objUser.UserCode, this.goods.Value)).FirstOrDefault();
            EShop.Model.Goods_BaseInfo objGoods = bllBasic.GetModelList(" GoodsCode = '" + this.goods.Value + "'").FirstOrDefault();
            if (objCart == null) 
            {
                isNew = true;
                objCart = new EShop.Model.Account_Cart();
                objCart.UserCode = objUser.UserCode;
                objCart.GoodsCode = objGoods.GoodsCode;
                objCart.MarketPrice = objGoods.MarketPrice;
                objCart.OurPrice = objGoods.OurPrice;
                objCart.BuyCount = 1;
                objCart.SubTotal = objGoods.OurPrice;
                objCart.Status = 1;
            }
            else 
            {
                objCart.BuyCount += 1;
                objCart.SubTotal = objCart.OurPrice * objCart.BuyCount;
            }
            if (isNew)
                isNew = bllCart.Add(objCart) == 1;
            else
                isNew = bllCart.Update(objCart);
            if (isNew)
                Server.Transfer("~/product/Cart.aspx");
            else
                Page.ClientScript.RegisterStartupScript(this.GetType(), "failed", "<script>alert('购买失败！请重试！');</script>");
        }
        
    }
}