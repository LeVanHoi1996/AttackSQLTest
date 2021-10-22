using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AttackSQL
{
   public  class Sqlheper
    {
        public bool checkconnect()
        {
            try
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = @"Data Source=(localdb)\TSSoft;Integrated Security=True";

                con.Open();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public bool checkconnectsql()
        {
            try
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = @"Data Source=(Localdb)\TSSoft;Initial Catalog=QLCtyCK;Integrated Security=True";
                con.Open();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
}
