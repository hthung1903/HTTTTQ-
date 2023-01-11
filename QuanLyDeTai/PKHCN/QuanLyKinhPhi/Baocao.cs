using Microsoft.Reporting.WinForms;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyDeTai.PKHCN.QuanLyKinhPhi
{
    public partial class Baocao : Form
    {
        public Baocao()
        {
            InitializeComponent();
            int v = TongKP();
            Console.WriteLine(v);
        }
        private int TongKP()
        {
            string query = "baoccao";
            DataTable dt = ConnectDB.Connected.getData(query);
            int tong = 0;
            foreach (DataRow dr in dt.Rows)
            {
               tong = tong + Int32.Parse(dr[5].ToString());
            }
            return tong;
        }
        private void Baocao_Load(object sender, EventArgs e)
        {
            string query = "baoccao";
            DataTable dt = ConnectDB.Connected.getData(query);
            xinkp.LocalReport.DataSources.Clear();
            xinkp.ProcessingMode = Microsoft.Reporting.WinForms.ProcessingMode.Local;
            xinkp.LocalReport.ReportPath = "C:/Users/Admin/Desktop/ttcsdl-trantung-pkhcn/ttcsdl-trantung-pkhcn/QuanLyDeTai/PKHCN/QuanLyKinhPhi/Report1.rdlc";
            //ReportParameter[] test = new ReportParameter[1];
            Microsoft.Reporting.WinForms.ReportDataSource dataset = new Microsoft.Reporting.WinForms.ReportDataSource("xinkp", dt);
            ReportParameter[] kp = new ReportParameter[1];
            string tong = TongKP().ToString();
            kp[0] = new ReportParameter("TongKP", tong+" vnđ" , true);
            this.xinkp.LocalReport.SetParameters(kp);
            xinkp.LocalReport.DataSources.Add(dataset);
            //this.xinkp.RefreshReport();
            this.xinkp.RefreshReport();
        }

        private void xinkp_Load(object sender, EventArgs e)
        {

        }
    }
}
