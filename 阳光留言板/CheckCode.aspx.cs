﻿using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 阳光留言板
{
    public partial class CheckCode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //调用自定义方法绘制验证码
            CreateCheckCodeImage(GenerateCheckCode());


        }
        private string GenerateCheckCode()
        {
            //创建整形变量
            int number;
            //创建字符型变量
            char code;
            //创建字符串变量并初始化为空
            string checkCode = String.Empty;
            //创建Random对象
            Random random = new Random();
            //使用for循环生成4为数字
            for (int i = 0; i < 4; i++)
            {
                //生成一个随机数
                number = random.Next();
                //将数字转换成为字符型
                code = (char)('0' + (char)(number % 10));
                checkCode += code.ToString();
            }
            //将随机数添加到Cookies中
            Response.Cookies.Add(new HttpCookie("CheckCode", checkCode));
            //返回字符串
            return checkCode;
        }
        private void CreateCheckCodeImage(string checkCode)
        {
            //判断字符串不等于空或null
            if (checkCode == null || checkCode.Trim() == String.Empty)
            {
                return;
            }
            //创建一个位图对象
            System.Drawing.Bitmap image = new System.Drawing.Bitmap((int)Math.Ceiling((checkCode.Length * 12.5)), 22);
            //创建Griphics对象
            Graphics g = Graphics.FromImage(image);
            try
            {
                Random random = new Random();
                g.Clear(Color.White);
                for (int i = 0; i < 2; i++)
                {
                    int x1 = random.Next(image.Width);
                    int x2 = random.Next(image.Width);
                    int y1 = random.Next(image.Height);
                    int y2 = random.Next(image.Height);
                    g.DrawLine(new Pen(Color.Black), x1, y1, x2, y2);
                }
                Font font = new System.Drawing.Font("Arial", 12, (System.Drawing.FontStyle.Bold));
                System.Drawing.Drawing2D.LinearGradientBrush brush = new System.Drawing.Drawing2D.LinearGradientBrush(new Rectangle(0, 0, image.Width, image.Height), Color.Black, Color.DarkRed, 1.2f, true);
                g.DrawString(checkCode, font, brush, 2, 2);
                for (int i = 0; i < 100; i++)
                {
                    int x = random.Next(image.Width);
                    int y = random.Next(image.Height);
                    image.SetPixel(x, y, Color.FromArgb(random.Next()));
                }
                g.DrawRectangle(new Pen(Color.Silver), 0, 0, image.Width - 1, image.Height - 1);
                System.IO.MemoryStream ms = new System.IO.MemoryStream();
                image.Save(ms, System.Drawing.Imaging.ImageFormat.Gif);
                Response.ClearContent();
                Response.ContentType = "image/Gif";
                Response.BinaryWrite(ms.ToArray());
            }
            finally
            {
                g.Dispose();
                image.Dispose();
            }
        }
    }
}