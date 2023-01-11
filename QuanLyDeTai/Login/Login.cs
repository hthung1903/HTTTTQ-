using System;
using System.Collections.Generic;
using System.Configuration;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace QuanLyDeTai.Login
{
    public partial class Login : Form

    {
        private static string connectionString = ConfigurationManager.ConnectionStrings["Connect"].ConnectionString;
        private string MaUser;
        private string Quyen;
        public Login()
        {
            InitializeComponent();
            
        }

        private void Login_Load(object sender, EventArgs e)
        {
            
        }

        private void bunifuLabel2_Click(object sender, EventArgs e)
        {

        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            string userName = UserName.Text;
            string password = Password.Text;
            string query = "select MaUSER, TenQuyen from Quyen, USERS where USERS.MaQ = Quyen.MAQ and USERS.Username = '"+ userName + "' and USERS.Passwords = '"+ password + "'";
            DataTable dt = ConnectDB.Connected.getData(query);
            if (dt.Rows.Count > 0)
            {
                MaUser = dt.Rows[0][0].ToString();
                Quyen = dt.Rows[0][1].ToString();
                if (Quyen == "Giảng viên")
                {
                    Form User = new User.User(MaUser);
                    MessageBox.Show("Đăng nhập thành công");
                    this.Hide();
                    User.Show();
                }
                if (Quyen == "Phòng Khoa học Công nghệ")
                {
                    Form admin = new PKHCN.PKHCN(MaUser);
                    MessageBox.Show("Đăng nhập thành công");
                    this.Hide();
                    admin.Show();
                }
                if(Quyen=="Bộ môn")
                {
                    Form bm = new BoMon.BoMon(MaUser);
                    MessageBox.Show("Đăng nhập thành công");
                    this.Hide();
                    bm.Show();

                }
                if (Quyen == "Khoa")
                {
                    Form Khoa = new Khoa.Khoa(MaUser);
                    MessageBox.Show("Đăng nhập thành công");
                    this.Hide();
                    Khoa.Show();
                }
                if (Quyen == "Tiểu đoàn")
                {
                    Form Tieudoan = new  TieuDoan.TieuDoan(MaUser);
                    MessageBox.Show("Đăng nhập thành công"); 
                    this.Hide();
                    Tieudoan.Show();
                }
                if (Quyen == "Đại đội")
                {
                    Form DaiDoi = new DaiDoi.DaiDoi(MaUser);
                    MessageBox.Show("Đăng nhập thành công");
                    this.Hide();
                    DaiDoi.Show();
                }

            }
            else
            {
                MessageBox.Show("Tài khoản mật khẩu không chính xác");
            }
        }

        private void Password_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox1.Checked == true)
            {
                Password.PasswordChar = '\0';
            }
            else
            {
                Password.PasswordChar = '*'; 
            }
        }

        private void container_Click(object sender, EventArgs e)
        {

        }
    }
}
