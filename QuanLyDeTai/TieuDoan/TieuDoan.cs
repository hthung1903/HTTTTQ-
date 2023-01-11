using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyDeTai.TieuDoan
{
    public partial class TieuDoan : Form
    {
        //public static string MATD = "";
        private string MATD;
        private string DaiDoiname;
        public TieuDoan(string Tieudoan)
        {
          
            InitializeComponent();
            SubMenu.Visible = false;
            SubMenu1.Visible = false;
            MATD = Tieudoan;
            openChilForm(new QLDT.DT(Tieudoan));
        }
      
        private void hideSubMenu()
        {
            if (SubMenu.Visible == true)
            {
                SubMenu.Visible = false;
            }
            if (SubMenu1.Visible == true)
            {
                SubMenu1.Visible = false;
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
            showSubMenu(SubMenu1);
        }

        private void btnMenu_Click(object sender, EventArgs e)
        {
            showSubMenu(SubMenu);
        }

        private void btnQdt_Click(object sender, EventArgs e)
        {
            openChilForm(new QLDT.DT(MATD));
        }

        private void btnGiangVien_Click(object sender, EventArgs e)
        {
            openChilForm(new HV(MATD));
        }

        private void button7_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form login = new Login.Login();
            login.Show();
        }

        private void bt_dangxuat_Click(object sender, EventArgs e)
        {
            openChilForm(new Setting.ChangePassword(MATD));
        }

        private void btnQLBB_Click(object sender, EventArgs e)
        {
            openChilForm(new ThongKe.THONGKE(MATD));
        }

        private void btnXP_Click(object sender, EventArgs e)
        {
            openChilForm(new ThongKe.XuPhat(MATD));
        }
    }
}
