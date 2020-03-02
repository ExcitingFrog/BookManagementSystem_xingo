using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for querry
/// </summary>
public class querry
{
    
    public SqlCommand command(string sql)
    {
        SqlCommand cmd = new SqlCommand(sql);
        return cmd;
    }
   
    public int excute (string sql)
    {
        return command(sql).ExecuteNonQuery();
    }

    public SqlDataReader read(string sql)
    {
        return command(sql).ExecuteReader();
    }


}