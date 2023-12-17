using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Digital_Weda_Backup
{
    public class dMan
    {
        //private const string _conStr = @"server=localhost;userid=root;database=testnewdb;Charset=utf8";
        private string _conStr = @"server=localhost;userid=root;";
        private MySqlConnection _con; 
        public dMan()
        {
            try
            {
                _con = new MySqlConnection(_conStr);
                _con.Open();
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message);
            }
        }
        public Boolean IsServer()
        {
            Boolean result = false;
            string query = "SELECT * FROM mysql.db WHERE 1";
            try
            {
                MySqlCommand cmd = new MySqlCommand(query, _con);
                MySqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    reader.Close();
                    result = true;
                }
                else
                {
                    reader.Close();
                    result = false;
                }
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message);
            }
            return result;
        }

        public void backup()
        {
            try
            {
                _conStr = @"server=localhost;userid=root;database=miraclesnakes;Charset=utf8";
                string file = "";
                SaveFileDialog sfd = new SaveFileDialog();

                sfd.Filter = "SQL files (*.sql)|*.sql";
                sfd.FilterIndex = 2;
                sfd.RestoreDirectory = true;
                sfd.FileName = DateTime.Now.ToString("POS-DB yyyy-MM-dd");

                if (sfd.ShowDialog() == DialogResult.OK)
                {
                    file = sfd.FileName;
                }

                if (file != "")
                {
                    using (MySqlConnection conn = new MySqlConnection(_conStr))
                    {
                        using (MySqlCommand cmd = new MySqlCommand())
                        {
                            using (MySqlBackup mb = new MySqlBackup(cmd))
                            {
                                cmd.Connection = conn;
                                conn.Open();
                                mb.ExportToFile(file);
                                conn.Close();
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Backup Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        public Boolean restoreDatabase()
        {
            _conStr = @"server=localhost;userid=root;database=miraclesnakes;Charset=utf8";
            Boolean result = false;
            string file = "";
            OpenFileDialog sfd = new OpenFileDialog();

            sfd.Filter = "SQL files (*.sql)|*.sql";
            sfd.FilterIndex = 2;
            sfd.RestoreDirectory = true;

            if (sfd.ShowDialog() == DialogResult.OK)
            {
                file = sfd.FileName;
            }

            if (file !="")
            {
                using (MySqlConnection conn = new MySqlConnection(_conStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        using (MySqlBackup mb = new MySqlBackup(cmd))
                        {
                            cmd.Connection = conn;
                            conn.Open();
                            mb.ImportFromFile(file);
                            conn.Close();
                            result = true;
                        }
                    }
                }
            }
            return result;
        }

        public Boolean cleanDatabase()
        {
            string file = Application.StartupPath + @"\files\POS-DB.sql";
            _conStr = @"server=localhost;userid=root;database=miraclesnakes;Charset=utf8";
            Boolean result = false;
            if (file != "")
            {
                using (MySqlConnection conn = new MySqlConnection(_conStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        using (MySqlBackup mb = new MySqlBackup(cmd))
                        {
                            cmd.Connection = conn;
                            conn.Open();
                            mb.ImportFromFile(file);
                            conn.Close();
                            result = true;
                        }
                    }
                }
            }
            return result;
        }

        public Boolean deleteDatabase()
        {
            Boolean result = false;
            try
            {
                string query = "DROP DATABASE miraclesnakes";
                MySqlCommand cmd = new MySqlCommand(query, _con);
                if (cmd.ExecuteNonQuery() == 1)
                {
                    result = true;
                }
                else
                {
                    result = false;
                }
            }
            catch (Exception e)
            {
                result = false;
                MessageBox.Show(e.Message);
            }
            return result;
        }

        public Boolean createDatabase()
        {
            Boolean result = false;
            try
            {
                string query = "CREATE DATABASE IF NOT EXISTS miraclesnakes CHARACTER SET utf8 COLLATE utf8_unicode_ci";
                MySqlCommand cmd = new MySqlCommand(query, _con);
                if (cmd.ExecuteNonQuery() == 1)
                {
                    result = true;
                }
                else
                {
                    result = false;
                }
            }
            catch (Exception e)
            {
                result = false;
                MessageBox.Show(e.Message);
            }
            return result;
        }
    }
    
}
