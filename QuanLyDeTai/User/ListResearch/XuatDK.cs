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

namespace QuanLyDeTai.User.ListResearch
{
    public partial class XuatDK : Form
    {
        private string MADT;
        private string TenDT;
        public XuatDK(string madt,string tendt)
        {
            MADT = madt;
            TenDT = tendt;
            InitializeComponent();
        }
        private string getDonVi()
        {
            string query = "pkhcn_lay_dv '"+MADT+"'";
            DataTable dt = ConnectDB.Connected.getData(query);
            return dt.Rows[0][0].ToString() + '-'+dt.Rows[0][1].ToString();
        }
        private void XuatDK_Load(object sender, EventArgs e)
        {

            this.Xuat.RefreshReport();
        }

        private void Xuat_Load(object sender, EventArgs e)
        {
            string query = "XuatDKDT '"+MADT+"'";
            DataTable dt = ConnectDB.Connected.getData(query);
            Xuat.LocalReport.DataSources.Clear();
            Xuat.ProcessingMode = Microsoft.Reporting.WinForms.ProcessingMode.Local;
            Xuat.LocalReport.ReportPath = "C:/Users/Admin/Desktop/ttcsdl-trantung-pkhcn/ttcsdl-trantung-pkhcn/QuanLyDeTai/User/ListResearch/Xuat.rdlc";
            //ReportParameter[] test = new ReportParameter[1];
            Microsoft.Reporting.WinForms.ReportDataSource dataset = new Microsoft.Reporting.WinForms.ReportDataSource("XuatDKDT", dt);
            ReportParameter[] kp = new ReportParameter[4];
            kp[0] = new ReportParameter("Tendt", TenDT, true);
            kp[1] = new ReportParameter("MaDT", MADT, true);
            kp[2] = new ReportParameter("Donvi",getDonVi(), true);
            kp[3] = new ReportParameter("TenKhoa",getDonVi().Split('-')[1], true);


            this.Xuat.LocalReport.SetParameters(kp);
            Xuat.LocalReport.DataSources.Add(dataset);
            //this.xinkp.RefreshReport();
            this.Xuat.RefreshReport();
        }
    }
}
