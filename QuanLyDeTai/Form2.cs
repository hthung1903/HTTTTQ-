using Microsoft.Reporting.WinForms;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyDeTai
{
    public partial class Form2 : Form
    {
        private DataTable Dt;
        public Form2(DataTable dt)
        {
            InitializeComponent();
            Dt = dt;
        }

        private void Form2_Load(object sender, EventArgs e)
        {
            reportViewer1.LocalReport.DataSources.Clear();
            reportViewer1.ProcessingMode = Microsoft.Reporting.WinForms.ProcessingMode.Local;
            reportViewer1.LocalReport.ReportPath = "C:/Users/Admin/Desktop/ttcsdl-trantung-pkhcn/ttcsdl-trantung-pkhcn/QuanLyDeTai/Form.rdlc";
            Microsoft.Reporting.WinForms.ReportDataSource dataset = new Microsoft.Reporting.WinForms.ReportDataSource("getCN",Dt);
            ReportParameter[] test = new ReportParameter[1];
            test[0] = new ReportParameter("DT","tung",true);
            this.reportViewer1.LocalReport.SetParameters(test);
            reportViewer1.LocalReport.DataSources.Add(dataset);
            this.reportViewer1.RefreshReport();
          
        }

        private void reportViewer1_Load(object sender, EventArgs e)
        {

        }
    }
}
