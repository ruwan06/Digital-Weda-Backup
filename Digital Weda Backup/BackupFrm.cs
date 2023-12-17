using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Digital_Weda_Backup
{
    public partial class BackupFrm : Form
    {
        dMan db = new dMan();
        public const int WM_NCLBUTTONDOWN = 0xA1;
        public const int HT_CAPTION = 0x2;
        [System.Runtime.InteropServices.DllImport("user32.dll")]
        public static extern int SendMessage(IntPtr hWnd, int Msg, int wParam, int lParam);
        [System.Runtime.InteropServices.DllImport("user32.dll")]
        public static extern bool ReleaseCapture();

        public BackupFrm()
        {
            InitializeComponent();
        }

        private void BackupFrm_Load(object sender, EventArgs e)
        {

        }

        private void panel1_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(Handle, WM_NCLBUTTONDOWN, HT_CAPTION, 0);
        }

        private void picClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnBackup_Click(object sender, EventArgs e)
        {
            db.backup();
        }

        private void btnRestore_Click(object sender, EventArgs e)
        {
            
            if (db.IsServer())
            {
                db.deleteDatabase();
                db.createDatabase();
                if (db.restoreDatabase())
                {
                    MessageBox.Show("තොරතුරු ප්‍රතිස්තාපනය කිරීම සාර්තකයි!", "Backup");
                }
            }
            else
            {
                MessageBox.Show("ගොනු කළමනාකරන පද්ධතිය අක්‍රීයව පවතී!", "Backup");
            }
        }

        private void btnClear_Click(object sender, EventArgs e)
        {
            if(MessageBox.Show("සියලුම දත්ත ඉවත් කිරීමට අවශ්‍යද?", "Message", MessageBoxButtons.YesNo) == DialogResult.Yes)
            {
                if (db.IsServer())
                {
                    db.deleteDatabase();
                    db.createDatabase();
                    if (db.cleanDatabase())
                    {
                        MessageBox.Show("සියලු තොරාතුරු ඉවත් කිරීම සාර්තකයි", "Backup");
                    }
                }
                else
                {
                    MessageBox.Show("ගොනු කළමනාකරන පද්ධතිය අක්‍රීයව පවතී!","Backup");
                }
            }
        }
    }
}
