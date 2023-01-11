using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyDeTai.BoMon
{
    public partial class BoMon : Form
    {
        public static string MABM = "";
        
        public BoMon(string MaBM)
        {
            MABM = MaBM;
            
            InitializeComponent();
            getTenBM();
            SubMenu.Visible = false;
            openChilForm(new QLDT.DT(MABM));
        }
        private void getTenBM()
        {
            string query = "select TenBM from BOMON where MABM = '"+MABM+"'";
            lbTenBM.Text = "Bộ môn" + " " + ConnectDB.Connected.getData(query).Rows[0][0].ToString();
        }
        private void hideSubMenu()
        {
            if (SubMenu.Visible == true)
            {
                SubMenu.Visible = false;
            }
        }
        private void showSubMenu(Panel Menu)
        {
            if (Menu.Visible == false)
            {
                hideSubMenu();
                Menu.Visible = true;
            }
            else
            {
                Menu.Visible = false;
            }
        }
        private Form activeForm = null;
        private void openChilForm(Form childForm)
        {
            if (activeForm != null)
            {
                activeForm.Close();
            }
            activeForm = childForm;
            childForm.TopLevel = false;
            childForm.FormBorderStyle = FormBorderStyle.None;
            childForm.Dock = DockStyle.Fill;
            panelChildForm.Controls.Add(childForm);
            panelChildForm.Tag = childForm;
            childForm.BringToFront();
            childForm.Show();
        }
        private void btnSetting_Click_1(object sender, EventArgs e)
        {
            showSubMenu(SubMenu);
        }

        private void btnMenu_Click(object sender, EventArgs e)
        {

        }

        private void btnQdt_Click(object sender, EventArgs e)
        {
            openChilForm(new QLDT.DT(MABM));
        }

        private void btnGiangVien_Click(object sender, EventArgs e)
        {
            openChilForm(new GV(MABM));
        }

        private void button7_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form login = new Login.Login();
            login.Show();
        }



        private void bt_dangxuat_Click(object sender, EventArgs e)
        {
            openChilForm(new Setting.ChangePassword(MABM));
        }
    }
}
