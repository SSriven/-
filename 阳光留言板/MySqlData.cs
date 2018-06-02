using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;

namespace 阳光留言板
{
    public class MySqlData
    {
        private MySqlConnection mysqlcon;
        private MySqlCommand mysqlcom;
        private MySqlDataAdapter mysqldata;
        private string conStr = "server=localhost;database=messageboard;User id=root;password=095637";

        //构造函数，初始化时链接数据库
        public MySqlData()        
        {
            mysqlcon = new MySqlConnection(conStr);
            mysqlcon.Open();
        }

        //执行SQL语句
        public bool ExceSQL(string MySqlCom)
        {
            mysqlcom = new MySqlCommand(MySqlCom, mysqlcon);
            try    
            {
                mysqlcom.ExecuteNonQuery();
                return true;
            }
            catch
            {
                return false;
            }
            finally
            {
                mysqlcon.Close();
            }
        }

        public bool ExceSelectSQL(string MySqlCom)
        {
            mysqlcom = new MySqlCommand(MySqlCom, mysqlcon);
            if(Convert.ToInt32(mysqlcom.ExecuteScalar())>0)
                return true;
            else
            {
                return false;
            }

                
        }

        //返回DataSet类型的数据
        public DataSet ExceDS(string MySqlCom)
        {
            try
            {
                mysqlcom = new MySqlCommand(MySqlCom, mysqlcon);
                mysqldata = new MySqlDataAdapter();
                mysqldata.SelectCommand = mysqlcom;
                DataSet ds = new DataSet();
                mysqldata.Fill(ds);
                return ds;
            }
            finally
            {
                mysqlcon.Close();
            }
        }

        //返回MySqlDataReader类型的数据
        public MySqlDataReader ExceRead(string MySqlCom)
        {
            mysqlcom = new MySqlCommand(MySqlCom, mysqlcon);
            MySqlDataReader read = mysqlcom.ExecuteReader();
            return read;
        }
    }
}