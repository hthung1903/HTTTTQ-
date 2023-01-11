namespace QuanLyDeTai.User.ListResearch
{
    partial class XuatDK
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
            this.Xuat = new Microsoft.Reporting.WinForms.ReportViewer();
            this.SuspendLayout();
            // 
            // Xuat
            // 
            this.Xuat.Dock = System.Windows.Forms.DockStyle.Fill;
            this.Xuat.Location = new System.Drawing.Point(0, 0);
            this.Xuat.Name = "Xuat";
            this.Xuat.ServerReport.BearerToken = null;
            this.Xuat.Size = new System.Drawing.Size(800, 450);
            this.Xuat.TabIndex = 0;
            this.Xuat.Load += new System.EventHandler(this.Xuat_Load);
            // 
            // XuatDK
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.Xuat);
            this.Name = "XuatDK";
            this.Text = "XuatDK";
            this.Load += new System.EventHandler(this.XuatDK_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private Microsoft.Reporting.WinForms.ReportViewer Xuat;
    }
}