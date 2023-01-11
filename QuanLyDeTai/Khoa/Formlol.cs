using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyDeTai.Khoa
{
    public partial class Khoa : Form
    {
        public static string MaKhoa = "";
        private string MGV;
        public Khoa(string makhoa)
        {
            MaKhoa = makhoa;
            InitializeComponent();
            getTenKhoa();
            customiDegsin();
            openChilForm(new QLDT.QuanLyDeTai(makhoa));
        }

        private void customiDegsin()
        {
            SubMenu.Visible = false;

        }
        private void hideSubMenu()
        {
            if (SubMenu.Visible == true)
            {
                SubMenu.Visible = false;
            }
        }
        private void Showmenu(Panel menu)
        {
            if (menu.Visible == false)
            {
                menu.Visible = true;
            }
        }
        private void Hidemenu(Panel menu)
        {
            if (menu.Visible == true)
            {
                menu.Visible = false;
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
            contentpanel.Controls.Add(childForm);
            contentpanel.Tag = childForm;
            childForm.BringToFront();
            childForm.Show();
        }                 
        private void btnQLDT_Click(object sender, EventArgs e)
        {
            Form qldt = new QLDT.QuanLyDeTai(MaKhoa);
            openChilForm(qldt);
        }

        private void btnQLGV_Click(object sender, EventArgs e)
        {
            Form qlgv = new QuanLyGV(MaKhoa);
            openChilForm(qlgv);
        }

        private void btnSetting_Click(object sender, EventArgs e)
        {
            showSubMenu(SubMenu);
        }

        private void btnDMK_Click_1(object sender, EventArgs e)
        {
            openChilForm(new Setting.ChangePassword(MaKhoa));
        }

        private void btnDX_Click_1(object sender, EventArgs e)
        {
            Form login = new Login.Login();
            this.Hide();
            login.Show();
        }

        private void astMenu_Click_1(object sender, EventArgs e)
        {
            if (MenuVertical.Width == 250)
            {
                MenuVertical.Visible = false;
                MenuVertical.Width = 70;
                btnQLGV.Text = "";
                btnNTĐT.Text = "";
                btnSetting.Text = "";
                btnQLDT.Text = "";
                bunifuTransition1.ShowSync(MenuVertical);
            }
            else
            {
                MenuVertical.Visible = false;
                MenuVertical.Width = 250;
                btnQLGV.Text = "              Quản lý giảng viên";
                btnSetting.Text = "              Cài đặt";
                btnQLDT.Text = "              Quản lý đề tài";
                btnNTĐT.Text = "              Nghiệm Thu Đề Tài";
                bunifuTransition1.ShowSync(MenuVertical);
            }
        }

        private void btnNTĐT_Click(object sender, EventArgs e)
        {
            if (panel3.Visible == false)
            {
                Showmenu(panel3);
                Hidemenu(panel1);
            }
            else
            {

                Hidemenu(panel3);
                Showmenu(panel1);
                hideSubMenu();
            }
           
        }


        private void showpanel(object sender, EventArgs e)
        {

        }


        public void getTenKhoa()
        {
            string query = "select tenk from khoa where mak = '" + MaKhoa + "'";
            DataTable dt = ConnectDB.Connected.getData(query);
            lbTenKhoa.Text = "KHOA " + dt.Rows[0][0].ToString().ToUpper();
        }

        private void QLHD_Click(object sender, EventArgs e)
        {
            openChilForm(new HDNT.HDNT(MaKhoa));
        }
    }
}
