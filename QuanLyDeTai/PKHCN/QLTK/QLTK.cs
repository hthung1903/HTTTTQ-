using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyDeTai.PKHCN.QLTK
{
    public partial class QLTK : Form
    {
        public static string state = "";
        public QLTK()
        {
            
            InitializeComponent();
            Enable();
            getListTK();
            getMaQ();
            getMaHD();
            MaQuyen.Enabled = true;
        }
        private void getMaHD()
        {
            string query = "declare @nextID char(10)  exec @nextID = KHOA_TuTangIDUSER select @nextID";
            DataTable dt = ConnectDB.Connected.getData(query);
            IDuser.Text = dt.Rows[0].ItemArray[0].ToString().Trim();
        }
        public void getListTK()
        {
            string query = " select * from USERS ";
            listTK.DataSource = ConnectDB.Connected.getData(query);
        }
        private void getMaQ()
        {
            MaQuyen.Items.Clear();
            string query = "select MaQ from Quyen";
            DataTable dt = ConnectDB.Connected.getData(query);
            foreach (DataRow dr in dt.Rows)
            {
                MaQuyen.Items.Add(dr[0].ToString());
            }
        }
        private void getTenQuyen()
        {
            Quyen.Text = "";
            string query = "select tenquyen from Quyen where MaQ = N'" + MaQuyen.Text + "'";
            DataTable dt = ConnectDB.Connected.getData(query);
            Quyen.Text = dt.Rows[0].ItemArray[0].ToString().Trim();
        }
        private void getMauser()
        {
            MaUser.Items.Clear();
            string query = "SHOW_USER N'" + MaQuyen.Text + "'";
            DataTable dt = ConnectDB.Connected.getData(query);
            foreach (DataRow dr in dt.Rows)
            {
                MaUser.Items.Add(dr[0].ToString());
            }
        }

        public void Enable()
        {
            Password.Enabled = false;
            username.Enabled = false;
            addTK.Enabled = false;
            edit.Enabled = false;
            delete.Enabled = false;
        }
    
        public bool checkUser()
        {
            string query = "select * from USERS";
            DataTable dt = ConnectDB.Connected.getData(query);
            foreach (DataRow dr in dt.Rows)
            {  
               if(username.Text == dr[0].ToString().Trim())
                {
                    return false;
                }
            }
            return true;
        }
        private void CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                MaQuyen.Enabled = false;
                MaUser.Enabled = false;
                int index = e.RowIndex;
                DataGridViewRow selectedRow = listTK.Rows[index];
                string id = selectedRow.Cells[0].Value.ToString().Trim();
                string MA = selectedRow.Cells[3].Value.ToString().Trim();
                string UserName = selectedRow.Cells[1].Value.ToString().Trim();
                string password = selectedRow.Cells[2].Value.ToString().Trim();
                IDuser.Text = id;
                MaQuyen.Text = "";
                MaUser.Text = "";
                username.Text = UserName;
                Password.Text = password;
                Password.Enabled = true;
                username.Enabled = true;
                if (password == "" && UserName == "")
                {
                    addTK.Enabled = true;
                    edit.Enabled = false;
                    delete.Enabled = false;
                }
                else
                {
                    edit.Enabled = true;
                    delete.Enabled = true;
                    addTK.Enabled = false;
                }
            }
            catch
            {

            }
        }

        private void addTK_Click_1(object sender, EventArgs e)
        {
            if (checkUser() == true)
            {
                if (username.Text == "")
                {
                    MessageBox.Show("Vui lòng nhập tài khoản");
                }
                if (Password.Text == "")
                {
                    MessageBox.Show("Vui lòng nhập mật khẩu");
                }
                else
                {
                    string query = "PKHCN_THEMTK '"+IDuser.Text+"',N'" + username.Text + "',N'" + Password.Text + "','"+MaQuyen.Text+"','"+MaUser.Text+"'";
                    MessageBox.Show(query);
                    MessageBox.Show(ConnectDB.Connected.ChangeData(query, "Thêm"));
                    getListTK();
                }
            }
            else
            {
                MessageBox.Show("Tên đăng nhập đã tồn tại");
            }
        }

        private void edit_Click_1(object sender, EventArgs e)
        {
            string query = "PKHCN_suaTK '" + IDuser.Text + "',N'" + username.Text + "',N'" + Password.Text + "'";
            MessageBox.Show(ConnectDB.Connected.ChangeData(query,"Sửa"));
            getListTK();
        }

        private void delete_Click_1(object sender, EventArgs e)
        {
            string query = "PKHCN_XoaTK '" + IDuser.Text + "'";
            MessageBox.Show(ConnectDB.Connected.ChangeData(query, "Xóa"));
            getListTK();
            Password.Text = "";
            username.Text = "";
            Enable();
        }
        private void guna2HtmlLabel16_Click(object sender, EventArgs e)
        {

        }

        private void MaQ_SelectedIndexChanged(object sender, EventArgs e)
        {
            getTenQuyen();
            getMauser();
            if (Quyen.Text != "Phòng Khoa học Công nghệ")
            {
                Password.Text = "";
                username.Text = "";
                edit.Enabled = false;
                delete.Enabled = false;
                Password.Enabled = true;
                username.Enabled = true;
                addTK.Enabled = true;
                if (Quyen.Text == "Khoa")
                {
                    state = "Khoa";
                    MaQuyen.Enabled = true;
                    MaUser.Enabled = true;
                }
                if (Quyen.Text == "Bộ môn")
                {
                    state = "Bộ môn";
                    MaQuyen.Enabled = true;
                    MaUser.Enabled = true;
                }
                if (Quyen.Text == "Giáo viên")
                {
                    state = "Giáo viên";
                    MaQuyen.Enabled = true;
                    MaUser.Enabled = true;
                }
                if (Quyen.Text == "Tiểu đoàn")
                {
                    state = "Tiểu đoàn";
                    MaQuyen.Enabled = true;
                    MaUser.Enabled = true;
                }
                if (Quyen.Text == "Đại đội")
                {
                    state = "Đại đội";
                    MaQuyen.Enabled = true;
                    MaUser.Enabled = true;
                }
            }
        }

        private void MaUser_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void guna2HtmlLabel14_Click(object sender, EventArgs e)
        {

        }

        private void guna2HtmlLabel13_Click(object sender, EventArgs e)
        {

        }

        private void guna2HtmlLabel11_Click(object sender, EventArgs e)
        {

        }

        private void Password_TextChanged(object sender, EventArgs e)
        {

        }

        private void username_TextChanged(object sender, EventArgs e)
        {

        }

        private void reload(object sender, EventArgs e)
        {
            getListTK();
            getMaQ();
            getMaHD();
            MaQuyen.Enabled = true;
            Quyen.Text = "";
            username.Text = "";
            Password.Text = "";
            MaUser.Text = "";
        }
    }
}
