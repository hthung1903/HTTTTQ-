
namespace QuanLyDeTai.Khoa
{
    partial class Khoa
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
            this.components = new System.ComponentModel.Container();
            Bunifu.UI.WinForms.BunifuAnimatorNS.Animation animation3 = new Bunifu.UI.WinForms.BunifuAnimatorNS.Animation();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Khoa));
            this.bunifuTransition1 = new Bunifu.UI.WinForms.BunifuTransition(this.components);
            this.panel1 = new System.Windows.Forms.Panel();
            this.SubMenu = new System.Windows.Forms.Panel();
            this.btnDX = new System.Windows.Forms.Button();
            this.btnDMK = new System.Windows.Forms.Button();
            this.btnSetting = new System.Windows.Forms.Button();
            this.MenuVertical = new System.Windows.Forms.Panel();
            this.panel2 = new System.Windows.Forms.Panel();
            this.btnNTĐT = new System.Windows.Forms.Button();
            this.panel3 = new System.Windows.Forms.Panel();
            this.QLHD = new System.Windows.Forms.Button();
            this.astMenu = new Bunifu.UI.WinForms.BunifuImageButton();
            this.btnQLGV = new System.Windows.Forms.Button();
            this.btnQLDT = new System.Windows.Forms.Button();
            this.btnlogoInicio = new System.Windows.Forms.PictureBox();
            this.contentpanel = new Bunifu.UI.WinForms.BunifuPanel();
            this.bunifuPanel1 = new Bunifu.UI.WinForms.BunifuPanel();
            this.lbTenKhoa = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.bunifuPictureBox2 = new Bunifu.UI.WinForms.BunifuPictureBox();
            this.panel1.SuspendLayout();
            this.SubMenu.SuspendLayout();
            this.MenuVertical.SuspendLayout();
            this.panel2.SuspendLayout();
            this.panel3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.btnlogoInicio)).BeginInit();
            this.bunifuPanel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.bunifuPictureBox2)).BeginInit();
            this.SuspendLayout();
            // 
            // bunifuTransition1
            // 
            this.bunifuTransition1.AnimationType = Bunifu.UI.WinForms.BunifuAnimatorNS.AnimationType.VertSlide;
            this.bunifuTransition1.Cursor = null;
            animation3.AnimateOnlyDifferences = true;
            animation3.BlindCoeff = ((System.Drawing.PointF)(resources.GetObject("animation3.BlindCoeff")));
            animation3.LeafCoeff = 0F;
            animation3.MaxTime = 1F;
            animation3.MinTime = 0F;
            animation3.MosaicCoeff = ((System.Drawing.PointF)(resources.GetObject("animation3.MosaicCoeff")));
            animation3.MosaicShift = ((System.Drawing.PointF)(resources.GetObject("animation3.MosaicShift")));
            animation3.MosaicSize = 0;
            animation3.Padding = new System.Windows.Forms.Padding(0);
            animation3.RotateCoeff = 0F;
            animation3.RotateLimit = 0F;
            animation3.ScaleCoeff = ((System.Drawing.PointF)(resources.GetObject("animation3.ScaleCoeff")));
            animation3.SlideCoeff = ((System.Drawing.PointF)(resources.GetObject("animation3.SlideCoeff")));
            animation3.TimeCoeff = 0F;
            animation3.TransparencyCoeff = 0F;
            this.bunifuTransition1.DefaultAnimation = animation3;
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.SubMenu);
            this.panel1.Controls.Add(this.btnSetting);
            this.bunifuTransition1.SetDecoration(this.panel1, Bunifu.UI.WinForms.BunifuTransition.DecorationType.None);
            this.panel1.Location = new System.Drawing.Point(0, 413);
            this.panel1.Margin = new System.Windows.Forms.Padding(4);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(333, 185);
            this.panel1.TabIndex = 22;
            // 
            // SubMenu
            // 
            this.SubMenu.Controls.Add(this.btnDX);
            this.SubMenu.Controls.Add(this.btnDMK);
            this.bunifuTransition1.SetDecoration(this.SubMenu, Bunifu.UI.WinForms.BunifuTransition.DecorationType.None);
            this.SubMenu.Dock = System.Windows.Forms.DockStyle.Top;
            this.SubMenu.Location = new System.Drawing.Point(0, 54);
            this.SubMenu.Margin = new System.Windows.Forms.Padding(4);
            this.SubMenu.Name = "SubMenu";
            this.SubMenu.Size = new System.Drawing.Size(333, 123);
            this.SubMenu.TabIndex = 21;
            // 
            // btnDX
            // 
            this.btnDX.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(180)))));
            this.bunifuTransition1.SetDecoration(this.btnDX, Bunifu.UI.WinForms.BunifuTransition.DecorationType.None);
            this.btnDX.Dock = System.Windows.Forms.DockStyle.Top;
            this.btnDX.FlatAppearance.BorderSize = 0;
            this.btnDX.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(45)))), ((int)(((byte)(45)))), ((int)(((byte)(48)))));
            this.btnDX.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnDX.Font = new System.Drawing.Font("Century Gothic", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnDX.ForeColor = System.Drawing.Color.White;
            this.btnDX.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnDX.Location = new System.Drawing.Point(0, 69);
            this.btnDX.Margin = new System.Windows.Forms.Padding(4);
            this.btnDX.Name = "btnDX";
            this.btnDX.Padding = new System.Windows.Forms.Padding(107, 0, 0, 0);
            this.btnDX.Size = new System.Drawing.Size(333, 54);
            this.btnDX.TabIndex = 19;
            this.btnDX.Text = "Đăng xuất";
            this.btnDX.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnDX.UseVisualStyleBackColor = false;
            this.btnDX.Click += new System.EventHandler(this.btnDX_Click_1);
            // 
            // btnDMK
            // 
            this.btnDMK.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(180)))));
            this.bunifuTransition1.SetDecoration(this.btnDMK, Bunifu.UI.WinForms.BunifuTransition.DecorationType.None);
            this.btnDMK.Dock = System.Windows.Forms.DockStyle.Top;
            this.btnDMK.FlatAppearance.BorderSize = 0;
            this.btnDMK.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(45)))), ((int)(((byte)(45)))), ((int)(((byte)(48)))));
            this.btnDMK.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnDMK.Font = new System.Drawing.Font("Century Gothic", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnDMK.ForeColor = System.Drawing.Color.White;
            this.btnDMK.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnDMK.Location = new System.Drawing.Point(0, 0);
            this.btnDMK.Margin = new System.Windows.Forms.Padding(4);
            this.btnDMK.Name = "btnDMK";
            this.btnDMK.Padding = new System.Windows.Forms.Padding(107, 0, 0, 0);
            this.btnDMK.Size = new System.Drawing.Size(333, 69);
            this.btnDMK.TabIndex = 20;
            this.btnDMK.Text = "Đổi mật khẩu";
            this.btnDMK.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnDMK.UseVisualStyleBackColor = false;
            this.btnDMK.Click += new System.EventHandler(this.btnDMK_Click_1);
            // 
            // btnSetting
            // 
            this.bunifuTransition1.SetDecoration(this.btnSetting, Bunifu.UI.WinForms.BunifuTransition.DecorationType.None);
            this.btnSetting.Dock = System.Windows.Forms.DockStyle.Top;
            this.btnSetting.FlatAppearance.BorderSize = 0;
            this.btnSetting.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(45)))), ((int)(((byte)(45)))), ((int)(((byte)(48)))));
            this.btnSetting.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnSetting.Font = new System.Drawing.Font("Century Gothic", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSetting.ForeColor = System.Drawing.Color.White;
            this.btnSetting.Image = ((System.Drawing.Image)(resources.GetObject("btnSetting.Image")));
            this.btnSetting.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnSetting.Location = new System.Drawing.Point(0, 0);
            this.btnSetting.Margin = new System.Windows.Forms.Padding(4);
            this.btnSetting.Name = "btnSetting";
            this.btnSetting.Padding = new System.Windows.Forms.Padding(13, 0, 0, 0);
            this.btnSetting.Size = new System.Drawing.Size(333, 54);
            this.btnSetting.TabIndex = 6;
            this.btnSetting.Text = "         Cài đặt";
            this.btnSetting.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnSetting.UseVisualStyleBackColor = true;
            this.btnSetting.Click += new System.EventHandler(this.btnSetting_Click);
            // 
            // MenuVertical
            // 
            this.MenuVertical.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(225)))));
            this.MenuVertical.Controls.Add(this.panel2);
            this.MenuVertical.Controls.Add(this.panel1);
            this.MenuVertical.Controls.Add(this.astMenu);
            this.MenuVertical.Controls.Add(this.btnQLGV);
            this.MenuVertical.Controls.Add(this.btnQLDT);
            this.MenuVertical.Controls.Add(this.btnlogoInicio);
            this.bunifuTransition1.SetDecoration(this.MenuVertical, Bunifu.UI.WinForms.BunifuTransition.DecorationType.None);
            this.MenuVertical.Dock = System.Windows.Forms.DockStyle.Left;
            this.MenuVertical.Location = new System.Drawing.Point(0, 0);
            this.MenuVertical.Margin = new System.Windows.Forms.Padding(4);
            this.MenuVertical.Name = "MenuVertical";
            this.MenuVertical.Size = new System.Drawing.Size(333, 851);
            this.MenuVertical.TabIndex = 5;
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.btnNTĐT);
            this.panel2.Controls.Add(this.panel3);
            this.bunifuTransition1.SetDecoration(this.panel2, Bunifu.UI.WinForms.BunifuTransition.DecorationType.None);
            this.panel2.Location = new System.Drawing.Point(0, 280);
            this.panel2.Margin = new System.Windows.Forms.Padding(4);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(333, 127);
            this.panel2.TabIndex = 23;
            this.panel2.Click += new System.EventHandler(this.showpanel);
            // 
            // btnNTĐT
            // 
            this.bunifuTransition1.SetDecoration(this.btnNTĐT, Bunifu.UI.WinForms.BunifuTransition.DecorationType.None);
            this.btnNTĐT.Dock = System.Windows.Forms.DockStyle.Top;
            this.btnNTĐT.FlatAppearance.BorderSize = 0;
            this.btnNTĐT.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(45)))), ((int)(((byte)(45)))), ((int)(((byte)(48)))));
            this.btnNTĐT.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnNTĐT.Font = new System.Drawing.Font("Century Gothic", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnNTĐT.ForeColor = System.Drawing.Color.White;
            this.btnNTĐT.Image = ((System.Drawing.Image)(resources.GetObject("btnNTĐT.Image")));
            this.btnNTĐT.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnNTĐT.Location = new System.Drawing.Point(0, 0);
            this.btnNTĐT.Margin = new System.Windows.Forms.Padding(4);
            this.btnNTĐT.Name = "btnNTĐT";
            this.btnNTĐT.Padding = new System.Windows.Forms.Padding(13, 0, 0, 0);
            this.btnNTĐT.Size = new System.Drawing.Size(333, 62);
            this.btnNTĐT.TabIndex = 22;
            this.btnNTĐT.Text = "                Nghiệm thu Đề tài";
            this.btnNTĐT.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnNTĐT.UseVisualStyleBackColor = true;
            this.btnNTĐT.Click += new System.EventHandler(this.btnNTĐT_Click);
            // 
            // panel3
            // 
            this.panel3.Controls.Add(this.QLHD);
            this.bunifuTransition1.SetDecoration(this.panel3, Bunifu.UI.WinForms.BunifuTransition.DecorationType.None);
            this.panel3.Location = new System.Drawing.Point(0, 62);
            this.panel3.Margin = new System.Windows.Forms.Padding(4);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(331, 63);
            this.panel3.TabIndex = 21;
            this.panel3.Visible = false;
            // 
            // QLHD
            // 
            this.QLHD.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(180)))));
            this.bunifuTransition1.SetDecoration(this.QLHD, Bunifu.UI.WinForms.BunifuTransition.DecorationType.None);
            this.QLHD.Dock = System.Windows.Forms.DockStyle.Top;
            this.QLHD.FlatAppearance.BorderSize = 0;
            this.QLHD.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(45)))), ((int)(((byte)(45)))), ((int)(((byte)(48)))));
            this.QLHD.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.QLHD.Font = new System.Drawing.Font("Century Gothic", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.QLHD.ForeColor = System.Drawing.Color.White;
            this.QLHD.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.QLHD.Location = new System.Drawing.Point(0, 0);
            this.QLHD.Margin = new System.Windows.Forms.Padding(4);
            this.QLHD.Name = "QLHD";
            this.QLHD.Padding = new System.Windows.Forms.Padding(107, 0, 0, 0);
            this.QLHD.Size = new System.Drawing.Size(331, 64);
            this.QLHD.TabIndex = 20;
            this.QLHD.Text = "QL Hội đồng";
            this.QLHD.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.QLHD.UseVisualStyleBackColor = false;
            this.QLHD.Click += new System.EventHandler(this.QLHD_Click);
            // 
            // astMenu
            // 
            this.astMenu.ActiveImage = null;
            this.astMenu.AllowAnimations = true;
            this.astMenu.AllowBuffering = false;
            this.astMenu.AllowToggling = false;
            this.astMenu.AllowZooming = true;
            this.astMenu.AllowZoomingOnFocus = false;
            this.astMenu.BackColor = System.Drawing.Color.Transparent;
            this.bunifuTransition1.SetDecoration(this.astMenu, Bunifu.UI.WinForms.BunifuTransition.DecorationType.None);
            this.astMenu.DialogResult = System.Windows.Forms.DialogResult.None;
            this.astMenu.ErrorImage = ((System.Drawing.Image)(resources.GetObject("astMenu.ErrorImage")));
            this.astMenu.FadeWhenInactive = false;
            this.astMenu.Flip = Bunifu.UI.WinForms.BunifuImageButton.FlipOrientation.Normal;
            this.astMenu.Image = ((System.Drawing.Image)(resources.GetObject("astMenu.Image")));
            this.astMenu.ImageActive = null;
            this.astMenu.ImageLocation = null;
            this.astMenu.ImageMargin = 0;
            this.astMenu.ImageSize = new System.Drawing.Size(70, 53);
            this.astMenu.ImageZoomSize = new System.Drawing.Size(71, 54);
            this.astMenu.InitialImage = ((System.Drawing.Image)(resources.GetObject("astMenu.InitialImage")));
            this.astMenu.Location = new System.Drawing.Point(0, 741);
            this.astMenu.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.astMenu.Name = "astMenu";
            this.astMenu.Rotation = 0;
            this.astMenu.ShowActiveImage = true;
            this.astMenu.ShowCursorChanges = true;
            this.astMenu.ShowImageBorders = true;
            this.astMenu.ShowSizeMarkers = false;
            this.astMenu.Size = new System.Drawing.Size(71, 54);
            this.astMenu.TabIndex = 0;
            this.astMenu.ToolTipText = "";
            this.astMenu.WaitOnLoad = false;
            this.astMenu.Zoom = 0;
            this.astMenu.ZoomSpeed = 10;
            this.astMenu.Click += new System.EventHandler(this.astMenu_Click_1);
            // 
            // btnQLGV
            // 
            this.bunifuTransition1.SetDecoration(this.btnQLGV, Bunifu.UI.WinForms.BunifuTransition.DecorationType.None);
            this.btnQLGV.Dock = System.Windows.Forms.DockStyle.Top;
            this.btnQLGV.FlatAppearance.BorderSize = 0;
            this.btnQLGV.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(45)))), ((int)(((byte)(45)))), ((int)(((byte)(48)))));
            this.btnQLGV.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnQLGV.Font = new System.Drawing.Font("Century Gothic", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnQLGV.ForeColor = System.Drawing.Color.White;
            this.btnQLGV.Image = ((System.Drawing.Image)(resources.GetObject("btnQLGV.Image")));
            this.btnQLGV.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnQLGV.Location = new System.Drawing.Point(0, 210);
            this.btnQLGV.Margin = new System.Windows.Forms.Padding(4);
            this.btnQLGV.Name = "btnQLGV";
            this.btnQLGV.Padding = new System.Windows.Forms.Padding(13, 0, 0, 0);
            this.btnQLGV.Size = new System.Drawing.Size(333, 62);
            this.btnQLGV.TabIndex = 2;
            this.btnQLGV.Text = "     Quản lý giảng viên";
            this.btnQLGV.UseVisualStyleBackColor = true;
            this.btnQLGV.Click += new System.EventHandler(this.btnQLGV_Click);
            // 
            // btnQLDT
            // 
            this.bunifuTransition1.SetDecoration(this.btnQLDT, Bunifu.UI.WinForms.BunifuTransition.DecorationType.None);
            this.btnQLDT.Dock = System.Windows.Forms.DockStyle.Top;
            this.btnQLDT.FlatAppearance.BorderSize = 0;
            this.btnQLDT.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(45)))), ((int)(((byte)(45)))), ((int)(((byte)(48)))));
            this.btnQLDT.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnQLDT.Font = new System.Drawing.Font("Century Gothic", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnQLDT.ForeColor = System.Drawing.Color.White;
            this.btnQLDT.Image = ((System.Drawing.Image)(resources.GetObject("btnQLDT.Image")));
            this.btnQLDT.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnQLDT.Location = new System.Drawing.Point(0, 148);
            this.btnQLDT.Margin = new System.Windows.Forms.Padding(4);
            this.btnQLDT.Name = "btnQLDT";
            this.btnQLDT.Padding = new System.Windows.Forms.Padding(13, 0, 0, 0);
            this.btnQLDT.Size = new System.Drawing.Size(333, 62);
            this.btnQLDT.TabIndex = 1;
            this.btnQLDT.Text = "     Quản lý đề tài";
            this.btnQLDT.UseVisualStyleBackColor = true;
            this.btnQLDT.Click += new System.EventHandler(this.btnQLDT_Click);
            // 
            // btnlogoInicio
            // 
            this.btnlogoInicio.Cursor = System.Windows.Forms.Cursors.Hand;
            this.bunifuTransition1.SetDecoration(this.btnlogoInicio, Bunifu.UI.WinForms.BunifuTransition.DecorationType.None);
            this.btnlogoInicio.Dock = System.Windows.Forms.DockStyle.Top;
            this.btnlogoInicio.Image = global::QuanLyDeTai.Properties.Resources._1;
            this.btnlogoInicio.Location = new System.Drawing.Point(0, 0);
            this.btnlogoInicio.Margin = new System.Windows.Forms.Padding(4);
            this.btnlogoInicio.Name = "btnlogoInicio";
            this.btnlogoInicio.Size = new System.Drawing.Size(333, 148);
            this.btnlogoInicio.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.btnlogoInicio.TabIndex = 0;
            this.btnlogoInicio.TabStop = false;
            // 
            // contentpanel
            // 
            this.contentpanel.BackgroundColor = System.Drawing.Color.Transparent;
            this.contentpanel.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("contentpanel.BackgroundImage")));
            this.contentpanel.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.contentpanel.BorderColor = System.Drawing.Color.Transparent;
            this.contentpanel.BorderRadius = 3;
            this.contentpanel.BorderThickness = 1;
            this.bunifuTransition1.SetDecoration(this.contentpanel, Bunifu.UI.WinForms.BunifuTransition.DecorationType.None);
            this.contentpanel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.contentpanel.Location = new System.Drawing.Point(333, 148);
            this.contentpanel.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.contentpanel.Name = "contentpanel";
            this.contentpanel.ShowBorders = true;
            this.contentpanel.Size = new System.Drawing.Size(1591, 703);
            this.contentpanel.TabIndex = 7;
            // 
            // bunifuPanel1
            // 
            this.bunifuPanel1.BackgroundColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(225)))));
            this.bunifuPanel1.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("bunifuPanel1.BackgroundImage")));
            this.bunifuPanel1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.bunifuPanel1.BorderColor = System.Drawing.Color.Transparent;
            this.bunifuPanel1.BorderRadius = 3;
            this.bunifuPanel1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.bunifuPanel1.BorderThickness = 1;
            this.bunifuPanel1.Controls.Add(this.lbTenKhoa);
            this.bunifuPanel1.Controls.Add(this.label1);
            this.bunifuPanel1.Controls.Add(this.bunifuPictureBox2);
            this.bunifuTransition1.SetDecoration(this.bunifuPanel1, Bunifu.UI.WinForms.BunifuTransition.DecorationType.None);
            this.bunifuPanel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.bunifuPanel1.Location = new System.Drawing.Point(333, 0);
            this.bunifuPanel1.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.bunifuPanel1.Name = "bunifuPanel1";
            this.bunifuPanel1.ShowBorders = true;
            this.bunifuPanel1.Size = new System.Drawing.Size(1591, 148);
            this.bunifuPanel1.TabIndex = 6;
            // 
            // lbTenKhoa
            // 
            this.lbTenKhoa.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.lbTenKhoa.AutoSize = true;
            this.lbTenKhoa.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(225)))));
            this.bunifuTransition1.SetDecoration(this.lbTenKhoa, Bunifu.UI.WinForms.BunifuTransition.DecorationType.None);
            this.lbTenKhoa.Font = new System.Drawing.Font("Times New Roman", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbTenKhoa.ForeColor = System.Drawing.Color.White;
            this.lbTenKhoa.Location = new System.Drawing.Point(181, 76);
            this.lbTenKhoa.Name = "lbTenKhoa";
            this.lbTenKhoa.Size = new System.Drawing.Size(350, 35);
            this.lbTenKhoa.TabIndex = 2;
            this.lbTenKhoa.Text = "Khoa Công nghệ thông tin";
            // 
            // label1
            // 
            this.label1.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(225)))));
            this.bunifuTransition1.SetDecoration(this.label1, Bunifu.UI.WinForms.BunifuTransition.DecorationType.None);
            this.label1.Font = new System.Drawing.Font("Times New Roman", 19.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.White;
            this.label1.Location = new System.Drawing.Point(159, 22);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(384, 37);
            this.label1.TabIndex = 1;
            this.label1.Text = "Học viện kỹ thuật quân sự";
            // 
            // bunifuPictureBox2
            // 
            this.bunifuPictureBox2.AllowFocused = false;
            this.bunifuPictureBox2.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.bunifuPictureBox2.AutoSizeHeight = true;
            this.bunifuPictureBox2.BorderRadius = 69;
            this.bunifuTransition1.SetDecoration(this.bunifuPictureBox2, Bunifu.UI.WinForms.BunifuTransition.DecorationType.None);
            this.bunifuPictureBox2.Image = global::QuanLyDeTai.Properties.Resources.tải_xuống;
            this.bunifuPictureBox2.IsCircle = true;
            this.bunifuPictureBox2.Location = new System.Drawing.Point(1, 2);
            this.bunifuPictureBox2.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.bunifuPictureBox2.Name = "bunifuPictureBox2";
            this.bunifuPictureBox2.Size = new System.Drawing.Size(139, 139);
            this.bunifuPictureBox2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.bunifuPictureBox2.TabIndex = 0;
            this.bunifuPictureBox2.TabStop = false;
            this.bunifuPictureBox2.Type = Bunifu.UI.WinForms.BunifuPictureBox.Types.Circle;
            // 
            // Khoa
            // 
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.None;
            this.BackColor = System.Drawing.SystemColors.Control;
            this.ClientSize = new System.Drawing.Size(1924, 851);
            this.Controls.Add(this.contentpanel);
            this.Controls.Add(this.bunifuPanel1);
            this.Controls.Add(this.MenuVertical);
            this.bunifuTransition1.SetDecoration(this, Bunifu.UI.WinForms.BunifuTransition.DecorationType.None);
            this.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.Name = "Khoa";
            this.Text = "Khoa";
            this.panel1.ResumeLayout(false);
            this.SubMenu.ResumeLayout(false);
            this.MenuVertical.ResumeLayout(false);
            this.panel2.ResumeLayout(false);
            this.panel3.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.btnlogoInicio)).EndInit();
            this.bunifuPanel1.ResumeLayout(false);
            this.bunifuPanel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.bunifuPictureBox2)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion
        private Bunifu.UI.WinForms.BunifuTransition bunifuTransition1;
        private Bunifu.UI.WinForms.BunifuPanel bunifuPanel1;
        private System.Windows.Forms.Label lbTenKhoa;
        private System.Windows.Forms.Label label1;
        private Bunifu.UI.WinForms.BunifuPictureBox bunifuPictureBox2;
        private Bunifu.UI.WinForms.BunifuPanel contentpanel;
        private System.Windows.Forms.PictureBox btnlogoInicio;
        private System.Windows.Forms.Button btnQLDT;
        private System.Windows.Forms.Button btnQLGV;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Panel SubMenu;
        private System.Windows.Forms.Button btnDX;
        private System.Windows.Forms.Button btnDMK;
        private System.Windows.Forms.Button btnSetting;
        private Bunifu.UI.WinForms.BunifuImageButton astMenu;
        private System.Windows.Forms.Panel MenuVertical;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Button btnNTĐT;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.Button QLHD;
    }
}