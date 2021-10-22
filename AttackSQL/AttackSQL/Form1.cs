using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace AttackSQL
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        private void khoitao() {

            string batFilePath =  Application.StartupPath + @"\installsql.bat";
            string[] path = Application.StartupPath.Split(Convert.ToChar("\\"));
            string pt = "";
            for (int i = 0; i < path.Length - 2; i++)
            {
                pt += path[i] + @"\";
            }
            if (!File.Exists(batFilePath))
            {
                File.Copy(pt + "installsql.bat", Application.StartupPath+ "\\installsql.bat");
            }
            if (!File.Exists(Application.StartupPath + "\\CreatIinstance.bat"))
            {
                File.Copy(pt + "CreatIinstance.bat", Application.StartupPath + "\\CreatIinstance.bat");
            }
            if (!File.Exists(Application.StartupPath + "\\AttackDB.bat"))
            {
                File.Copy(pt + "AttackDB.bat", Application.StartupPath + "\\AttackDB.bat");
            }
            if (!Directory.Exists(Application.StartupPath+"\\Tools"))
            {
                Directory.CreateDirectory(Application.StartupPath + "\\Tools");
                string[] files = System.IO.Directory.GetFiles(pt + "Tool");
                foreach (string s in files)
                {
                    System.IO.File.Copy(s, Application.StartupPath + "\\Tools\\" + Path.GetFileName(s), true);
                }
                //  Directory.Move(pt + "Tool", Application.StartupPath+"\\Tool");
            }
            if (!checkconnect())
            {
                ExecuteAsAdmin(Application.StartupPath + "\\Tools\\installSql.bat");
                ExecuteAsAdmin(Application.StartupPath + "\\Tools\\createInstance.bat");
            }
           //  Process.Start(Application.StartupPath+ "\\Tools\\installSql.bat");
           // process.WaitForExit();
           //process = Process.Start(Application.StartupPath + "\\Tools\\installSql.bat");
           //process.WaitForExit();
        }
        public void ExecuteAsAdmin(string fileName)
        {
            Process proc = new Process();
            proc.StartInfo.FileName = fileName;
            proc.StartInfo.UseShellExecute = true;
            proc.StartInfo.Verb = "runas";
            proc.Start();
        }

        private void simpleButton4_Click(object sender, EventArgs e)
        {
            khoitao();
        }
        private bool checkconnect()
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
    }
}
