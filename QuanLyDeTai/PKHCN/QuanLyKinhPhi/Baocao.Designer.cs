namespace QuanLyDeTai.PKHCN.QuanLyKinhPhi
{
    partial class Baocao
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.xinkp = new Microsoft.Reporting.WinForms.ReportViewer();
            this.SuspendLayout();
            // 
            // xinkp
            // 
            this.xinkp.Dock = System.Windows.Forms.DockStyle.Fill;
            this.xinkp.Location = new System.Drawing.Point(0, 0);
            this.xinkp.Name = "xinkp";
            this.xinkp.ServerReport.BearerToken = null;
            this.xinkp.Size = new System.Drawing.Size(1086, 604);
            this.xinkp.TabIndex = 0;
            this.xinkp.Load += new System.EventHandler(this.xinkp_Load);
            // 
            // Baocao
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1086, 604);
            this.Controls.Add(this.xinkp);
            this.Name = "Baocao";
            this.Text = "Baocao";
            this.Load += new System.EventHandler(this.Baocao_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private Microsoft.Reporting.WinForms.ReportViewer xinkp;
    }
}