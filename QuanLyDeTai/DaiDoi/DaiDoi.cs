using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyDeTai.DaiDoi
{
    public partial class DaiDoi : Form
    {
        public static string MaDD; 
        public DaiDoi(string maDD)
        {   
            MaDD = maDD;
            InitializeComponent();
            customiDegsin();
            openChilForm(new Infor.Infor(maDD));
            
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
        private void showSubMenu(Panel Menu)
        {
            if(Menu.Visible == false)
            {
                hideSubMenu();
                Menu.Visible = true;
            }
            else
            {
                Menu.Visible = false;
            }
        }
        
        private void Setting_Click(object sender, EventArgs e)
        {
            showSubMenu(SubMenu);

        }
        private Form activeForm = null;
        private void openChilForm(Form childForm)
        {
            if(activeForm != null)
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
      

     
        private void ChangePassword_Click(object sender, EventArgs e)
        {
            openChilForm(new Setting.ChangePassword(MaDD));
            header.Text = "Đổi mật khẩu";
        }

        private void panelChildForm_Paint(object sender, PaintEventArgs e)
        {

        }

        private void LogOut_Click(object sender, EventArgs e)
        {
            Form login = new Login.Login();
            this.Hide();
            login.Show();
        }

      

      

        
        private void Info_Click(object sender, EventArgs e)
        {
            openChilForm(new Infor.Infor(MaDD));
            header.Text = "Thông tin Đại đội";
        }

        private void list_Click_1(object sender, EventArgs e)
        {
            openChilForm(new ListResearch.ListResearch(MaDD));
            header.Text = "Danh sách đề tài tham gia";
        }

        private void caidat_Click(object sender, EventArgs e)
        {
            showSubMenu(SubMenu);
        }

        private void dk_Click(object sender, EventArgs e)
        {
            openChilForm(new AddResearch.AddReseach(MaDD));
            header.Text = "Đăng ký đề tài";
        }

        private void dshv_Click(object sender, EventArgs e)
        {
            openChilForm(new QLHV.HV(MaDD));
            header.Text = "Đăng ký đề tài";
        }
    }
}
