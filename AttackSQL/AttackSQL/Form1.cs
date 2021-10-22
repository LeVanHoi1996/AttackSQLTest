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
using System.Text.RegularExpressions;
using System.Threading;

namespace AttackSQL
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        private  bool khoitao() {

            string batFilePath =  Application.StartupPath + @"\installsql.bat";
            string[] path = Application.StartupPath.Split(Convert.ToChar("\\"));
            string pt = "";
            for (int i = 0; i < path.Length - 2; i++)
            {
                pt += path[i] + @"\";
            }
            if (path[path.Length-3] != Application.ProductName)
            {
                if ( !checkconnect())
                {
                    ExecuteAsAdmin(Application.StartupPath + "\\Tools\\installSql.bat");
                }
                return true;
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
            if (!Directory.Exists(Application.StartupPath + "\\Script "))
            {
                Directory.CreateDirectory(Application.StartupPath+ "\\Script");
            }
            if (!File.Exists(Application.StartupPath + "\\Script\\Data2.sql"))
            {
                File.Copy(pt + "\\Script\\Data2.sql", Application.StartupPath + "\\Script\\Data2.sql");
            }
            if (!Directory.Exists(Application.StartupPath+"\\Tools"))
            {
                Directory.CreateDirectory(Application.StartupPath + "\\Tools");
                string[] files = System.IO.Directory.GetFiles(pt + "Tool");
                foreach (string s in files)
                {
                    System.IO.File.Copy(s, Application.StartupPath + "\\Tools\\" + Path.GetFileName(s), true);
                }
            }
            if (!checkconnect())
            {
                ExecuteAsAdmin(Application.StartupPath + "\\Tools\\installSql.bat");
            }
            // Process.Start(Application.StartupPath+ "\\Tools\\installSql.bat");
            // process.WaitForExit();
            // process = Process.Start(Application.StartupPath + "\\Tools\\installSql.bat");
            // process.WaitForExit();
            return true;
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
        private bool checkconnectsql()
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
        private bool runSqlScriptFile(string pathStoreProceduresFile, string connectionString)
        {
            try
            {
                string script = File.ReadAllText(pathStoreProceduresFile);
                // split script on GO command
                System.Collections.Generic.IEnumerable<string> commandStrings = Regex.Split(script, @"^\s*GO\s*$",
                                         RegexOptions.Multiline | RegexOptions.IgnoreCase);
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    foreach (string commandString in commandStrings)
                    {
                        if (commandString.Trim() != "")
                        {
                            using (var command = new SqlCommand(commandString, connection))
                            {
                                try
                                {
                                    command.ExecuteNonQuery();
                                }
                                catch (SqlException ex)
                                {
                                    string spError = commandString.Length > 100 ? commandString.Substring(0, 100) + " ...\n..." : commandString;
                                    MessageBox.Show(string.Format("Please check the SqlServer script.\nFile: {0} \nLine: {1} \nError: {2} \nSQL Command: \n{3}", pathStoreProceduresFile, ex.LineNumber, ex.Message, spError), "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                                    return false;
                                }
                            }
                        }
                    }
                    connection.Close();
                }
                return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }
        }
        private void simpleButton5_Click(object sender, EventArgs e)
        {
            runSqlScriptFile(Application.StartupPath + "\\Script\\Data2.sql", @"Data Source=(localdb)\TSSoft;Integrated Security=True");
        }

        private void simpleButton6_Click(object sender, EventArgs e)
        {
            if (checkconnectsql())
            {
                this.Hide();
                Form2 frm = new Form2();
                frm.WindowState = FormWindowState.Maximized;
                frm.Show();
            } 
        }
        int a = 0;

        private Task<bool> Dotask_khoitaoinstance()
        {
            return Task.Run<bool>(() => {
                bool rs = false;
                ExecuteAsAdmin(Application.StartupPath + "\\Tools\\createInstance.bat");
                while (true)
                {
                    Thread.Sleep(1000);
                    a = a + 1;
                    if (checkconnect())
                    {
                        rs =true;
                        break;
                    }
                    else if (a > 1000)
                    {
                        rs = false;
                        break;
                    }
                }
                return rs;
            });
        }

        string pathlocal1 = @"C:\Program Files\Microsoft SQL Server\140\Tools\Binn\SqlLocalDb.exe";
        string pathlocal2 = @"C:\Program Files\Microsoft SQL Server\130\Tools\Binn\SqlLocalDb.exe";
        private  Task<bool> Dotask_khoitao()
        {
            return Task.Run<bool>(()=> {
                bool rs = false;
                khoitao();
                while (true)
                {
                    Thread.Sleep(1000);
                    a = a + 1;
                    if (File.Exists(pathlocal1) || File.Exists(pathlocal2))
                    {
                        rs = true;
                        break;
                    }
                    else if (a > 1000) {
                        rs = false;
                        break;
                    }

                }
                return rs;
            } );
        }
        private Task<bool> Dotask_createdatabase()
        {
            return Task.Run<bool>(() => {
                bool rs = false;
                runSqlScriptFile(Application.StartupPath + "\\Script\\Data2.sql", @"Data Source=(localdb)\TSSoft;Integrated Security=True");
                while (true)
                {
                    Thread.Sleep(1000);
                    a = a + 1;
                    if (checkconnectsql())
                    {
                        rs = true;
                        break;
                    }
                    else if (a > 1000)
                    {
                        rs = false;
                        break;
                    }
                }
                return rs;
            });
        }

        private async void AsyncMethods()
        {
            bool bkhoitao = await Dotask_khoitao();
            if (bkhoitao)
            {
                bool bkhoitaoinstance = await Dotask_khoitaoinstance();
                if (bkhoitaoinstance)
                {
                    bool bcreatedb = await Dotask_createdatabase();
                    if (bcreatedb)
                    {
                        simpleButton6.PerformClick();
                    }
                    else
                    {
                        AsyncMethods();
                    }
                }
                else
                {
                    AsyncMethods();
                }
            }
            else
            {
                AsyncMethods();
            }
            
        }
        private void OnTimerEvent(object sender, EventArgs e)
        {
            textEdit1.EditValue = a.ToString();
        }
        private void Form1_Load(object sender, EventArgs e)
        {
            System.Windows.Forms.Timer timer1 = new System.Windows.Forms.Timer
            {
                Interval = 1000
            };
            timer1.Enabled = true;
            timer1.Tick += new System.EventHandler(OnTimerEvent);
            AsyncMethods();
        }
    }
}
