using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PAL;
using System.Data.SqlClient;
using DAL;
using System.Data;

namespace BAL
{
    public class AboutusBAL:AboutusPAL
    {
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();

        public DataSet ManageAboutUS()
        {
            SqlParameter[] Params = new SqlParameter[3];
            Params[0] = new SqlParameter("@AboutusShortDesc", AboutusShortDesc);
            Params[1] = new SqlParameter("@AboutusDescription", AboutusDescription);
            Params[2] = new SqlParameter("@Action", Action);
            return SqlHelper.ExecuteDataset(CommandType.StoredProcedure, "sp_ManageAboutUS", Params);
        }
    }
}
