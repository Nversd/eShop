<%@ WebHandler Language="C#" Class="VerifiCode" %>

using System;
using System.Web;
using System.Drawing;
using System.Text;

public class VerifiCode : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        
    }

    string CreateCode(int length) 
    {
        StringBuilder strCode = new StringBuilder();
        for (int i = 0; i < length; i++)
        {
            int codeType = new Random().Next(0, 3);
            switch (codeType) 
            {
                case 0: 
                    {
                        
                        break;
                    }
                case 1:
                    {
                        break;
                    }
                case 2:
                    {
                        break;
                    } 
            }
        }
        return "";
    }

    Bitmap CreateImage(int width, int height, string content) 
    {
        Bitmap bitmap = new Bitmap(width, height);
        Pen pen = new Pen(Color.Black);
        return null;
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}