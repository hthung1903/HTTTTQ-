
namespace QuanLyDeTai.PKHCN.KTXP
{
    partial class XuPhat
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(XuPhat));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            Bunifu.UI.WinForms.BunifuButton.BunifuButton.BorderEdges borderEdges1 = new Bunifu.UI.WinForms.BunifuButton.BunifuButton.BorderEdges();
            this.bunifuPanel1 = new Bunifu.UI.WinForms.BunifuPanel();
            this.cmbLocMD = new System.Windows.Forms.ComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.bunifuPanel2 = new Bunifu.UI.WinForms.BunifuPanel();
            this.ListXP = new Bunifu.UI.WinForms.BunifuDataGridView();
            this.btnThem = new Bunifu.UI.WinForms.BunifuButton.BunifuButton();
            this.bunifuPanel1.SuspendLayout();
            this.bunifuPanel2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.ListXP)).BeginInit();
            this.SuspendLayout();
            // 
            // bunifuPanel1
            // 
            this.bunifuPanel1.BackgroundColor = System.Drawing.Color.Transparent;
            this.bunifuPanel1.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("bunifuPanel1.BackgroundImage")));
            this.bunifuPanel1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.bunifuPanel1.BorderColor = System.Drawing.Color.Transparent;
            this.bunifuPanel1.BorderRadius = 3;
            this.bunifuPanel1.BorderThickness = 1;
            this.bunifuPanel1.Controls.Add(this.btnThem);
            this.bunifuPanel1.Controls.Add(this.cmbLocMD);
            this.bunifuPanel1.Controls.Add(this.label2);
            this.bunifuPanel1.Controls.Add(this.label1);
            this.bunifuPanel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.bunifuPanel1.Location = new System.Drawing.Point(0, 0);
            this.bunifuPanel1.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.bunifuPanel1.Name = "bunifuPanel1";
            this.bunifuPanel1.ShowBorders = true;
            this.bunifuPanel1.Size = new System.Drawing.Size(1573, 82);
            this.bunifuPanel1.TabIndex = 1;
            this.bunifuPanel1.Click += new System.EventHandler(this.bunifuPanel1_Click_1);
            // 
            // cmbLocMD
            // 
            this.cmbLocMD.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbLocMD.FormattingEnabled = true;
            this.cmbLocMD.Items.AddRange(new object[] {
            "Tất cả",
            "Đã xác minh",
            "Chưa xác minh"});
            this.cmbLocMD.Location = new System.Drawing.Point(1196, 21);
            this.cmbLocMD.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.cmbLocMD.Name = "cmbLocMD";
            this.cmbLocMD.Size = new System.Drawing.Size(165, 33);
            this.cmbLocMD.TabIndex = 2;
            this.cmbLocMD.SelectedIndexChanged += new System.EventHandler(this.cmbLocBB_SelectedIndexChanged);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(1038, 27);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(142, 22);
            this.label2.TabIndex = 1;
            this.label2.Text = "Lọc theo mức độ";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Times New Roman", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(12, 22);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(192, 27);
            this.label1.TabIndex = 0;
            this.label1.Text = "Danh sách xử phat";
            // 
            // bunifuPanel2
            // 
            this.bunifuPanel2.BackgroundColor = System.Drawing.Color.Transparent;
            this.bunifuPanel2.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("bunifuPanel2.BackgroundImage")));
            this.bunifuPanel2.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.bunifuPanel2.BorderColor = System.Drawing.Color.Transparent;
            this.bunifuPanel2.BorderRadius = 3;
            this.bunifuPanel2.BorderThickness = 1;
            this.bunifuPanel2.Controls.Add(this.ListXP);
            this.bunifuPanel2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.bunifuPanel2.Location = new System.Drawing.Point(0, 82);
            this.bunifuPanel2.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.bunifuPanel2.Name = "bunifuPanel2";
            this.bunifuPanel2.ShowBorders = true;
            this.bunifuPanel2.Size = new System.Drawing.Size(1573, 611);
            this.bunifuPanel2.TabIndex = 2;
            // 
            // ListXP
            // 
            this.ListXP.AllowCustomTheming = false;
            dataGridViewCellStyle1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(248)))), ((int)(((byte)(251)))), ((int)(((byte)(255)))));
            dataGridViewCellStyle1.ForeColor = System.Drawing.Color.Black;
            this.ListXP.AlternatingRowsDefaultCellStyle = dataGridViewCellStyle1;
            this.ListXP.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.ListXP.BackgroundColor = System.Drawing.Color.White;
            this.ListXP.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.ListXP.CellBorderStyle = System.Windows.Forms.DataGridViewCellBorderStyle.SingleHorizontal;
            this.ListXP.ColumnHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.None;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle2.BackColor = System.Drawing.Color.DodgerBlue;
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Segoe UI Semibold", 11.75F, System.Drawing.FontStyle.Bold);
            dataGridViewCellStyle2.ForeColor = System.Drawing.Color.White;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(24)))), ((int)(((byte)(115)))), ((int)(((byte)(204)))));
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.Color.White;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.ListXP.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle2;
            this.ListXP.ColumnHeadersHeight = 40;
            this.ListXP.CurrentTheme.AlternatingRowsStyle.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(248)))), ((int)(((byte)(251)))), ((int)(((byte)(255)))));
            this.ListXP.CurrentTheme.AlternatingRowsStyle.Font = new System.Drawing.Font("Segoe UI Semibold", 9.75F, System.Drawing.FontStyle.Bold);
            this.ListXP.CurrentTheme.AlternatingRowsStyle.ForeColor = System.Drawing.Color.Black;
            this.ListXP.CurrentTheme.AlternatingRowsStyle.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(210)))), ((int)(((byte)(232)))), ((int)(((byte)(255)))));
            this.ListXP.CurrentTheme.AlternatingRowsStyle.SelectionForeColor = System.Drawing.Color.Black;
            this.ListXP.CurrentTheme.BackColor = System.Drawing.Color.White;
            this.ListXP.CurrentTheme.GridColor = System.Drawing.Color.FromArgb(((int)(((byte)(221)))), ((int)(((byte)(238)))), ((int)(((byte)(255)))));
            this.ListXP.CurrentTheme.HeaderStyle.BackColor = System.Drawing.Color.DodgerBlue;
            this.ListXP.CurrentTheme.HeaderStyle.Font = new System.Drawing.Font("Segoe UI Semibold", 11.75F, System.Drawing.FontStyle.Bold);
            this.ListXP.CurrentTheme.HeaderStyle.ForeColor = System.Drawing.Color.White;
            this.ListXP.CurrentTheme.HeaderStyle.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(24)))), ((int)(((byte)(115)))), ((int)(((byte)(204)))));
            this.ListXP.CurrentTheme.HeaderStyle.SelectionForeColor = System.Drawing.Color.White;
            this.ListXP.CurrentTheme.Name = null;
            this.ListXP.CurrentTheme.RowsStyle.BackColor = System.Drawing.Color.White;
            this.ListXP.CurrentTheme.RowsStyle.Font = new System.Drawing.Font("Segoe UI Semibold", 9.75F, System.Drawing.FontStyle.Bold);
            this.ListXP.CurrentTheme.RowsStyle.ForeColor = System.Drawing.Color.Black;
            this.ListXP.CurrentTheme.RowsStyle.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(210)))), ((int)(((byte)(232)))), ((int)(((byte)(255)))));
            this.ListXP.CurrentTheme.RowsStyle.SelectionForeColor = System.Drawing.Color.Black;
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle3.BackColor = System.Drawing.Color.White;
            dataGridViewCellStyle3.Font = new System.Drawing.Font("Segoe UI Semibold", 9.75F, System.Drawing.FontStyle.Bold);
            dataGridViewCellStyle3.ForeColor = System.Drawing.Color.Black;
            dataGridViewCellStyle3.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(210)))), ((int)(((byte)(232)))), ((int)(((byte)(255)))));
            dataGridViewCellStyle3.SelectionForeColor = System.Drawing.Color.Black;
            dataGridViewCellStyle3.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.ListXP.DefaultCellStyle = dataGridViewCellStyle3;
            this.ListXP.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ListXP.EnableHeadersVisualStyles = false;
            this.ListXP.GridColor = System.Drawing.Color.FromArgb(((int)(((byte)(221)))), ((int)(((byte)(238)))), ((int)(((byte)(255)))));
            this.ListXP.HeaderBackColor = System.Drawing.Color.DodgerBlue;
            this.ListXP.HeaderBgColor = System.Drawing.Color.Empty;
            this.ListXP.HeaderForeColor = System.Drawing.Color.White;
            this.ListXP.Location = new System.Drawing.Point(0, 0);
            this.ListXP.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.ListXP.Name = "ListXP";
            this.ListXP.RowHeadersVisible = false;
            this.ListXP.RowHeadersWidth = 51;
            this.ListXP.RowTemplate.Height = 40;
            this.ListXP.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.ListXP.Size = new System.Drawing.Size(1573, 611);
            this.ListXP.TabIndex = 0;
            this.ListXP.Theme = Bunifu.UI.WinForms.BunifuDataGridView.PresetThemes.Light;
            // 
            // btnThem
            // 
            this.btnThem.AllowAnimations = true;
            this.btnThem.AllowMouseEffects = true;
            this.btnThem.AllowToggling = false;
            this.btnThem.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnThem.AnimationSpeed = 200;
            this.btnThem.AutoGenerateColors = false;
            this.btnThem.AutoRoundBorders = false;
            this.btnThem.AutoSizeLeftIcon = true;
            this.btnThem.AutoSizeRightIcon = true;
            this.btnThem.BackColor = System.Drawing.Color.Transparent;
            this.btnThem.BackColor1 = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(225)))));
            this.btnThem.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("btnThem.BackgroundImage")));
            this.btnThem.BorderStyle = Bunifu.UI.WinForms.BunifuButton.BunifuButton.BorderStyles.Solid;
            this.btnThem.ButtonText = "Thêm";
            this.btnThem.ButtonTextMarginLeft = 0;
            this.btnThem.ColorContrastOnClick = 45;
            this.btnThem.ColorContrastOnHover = 45;
            this.btnThem.Cursor = System.Windows.Forms.Cursors.Default;
            borderEdges1.BottomLeft = true;
            borderEdges1.BottomRight = true;
            borderEdges1.TopLeft = true;
            borderEdges1.TopRight = true;
            this.btnThem.CustomizableEdges = borderEdges1;
            this.btnThem.DialogResult = System.Windows.Forms.DialogResult.None;
            this.btnThem.DisabledBorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(191)))), ((int)(((byte)(191)))), ((int)(((byte)(191)))));
            this.btnThem.DisabledFillColor = System.Drawing.Color.FromArgb(((int)(((byte)(204)))), ((int)(((byte)(204)))), ((int)(((byte)(204)))));
            this.btnThem.DisabledForecolor = System.Drawing.Color.FromArgb(((int)(((byte)(168)))), ((int)(((byte)(160)))), ((int)(((byte)(168)))));
            this.btnThem.FocusState = Bunifu.UI.WinForms.BunifuButton.BunifuButton.ButtonStates.Pressed;
            this.btnThem.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.btnThem.ForeColor = System.Drawing.Color.White;
            this.btnThem.IconLeftAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnThem.IconLeftCursor = System.Windows.Forms.Cursors.Default;
            this.btnThem.IconLeftPadding = new System.Windows.Forms.Padding(11, 3, 3, 3);
            this.btnThem.IconMarginLeft = 11;
            this.btnThem.IconPadding = 10;
            this.btnThem.IconRightAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnThem.IconRightCursor = System.Windows.Forms.Cursors.Default;
            this.btnThem.IconRightPadding = new System.Windows.Forms.Padding(3, 3, 7, 3);
            this.btnThem.IconSize = 25;
            this.btnThem.IdleBorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(225)))));
            this.btnThem.IdleBorderRadius = 1;
            this.btnThem.IdleBorderThickness = 1;
            this.btnThem.IdleFillColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(225)))));
            this.btnThem.IdleIconLeftImage = null;
            this.btnThem.IdleIconRightImage = null;
            this.btnThem.IndicateFocus = false;
            this.btnThem.Location = new System.Drawing.Point(268, 15);
            this.btnThem.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnThem.Name = "btnThem";
            this.btnThem.OnDisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(191)))), ((int)(((byte)(191)))), ((int)(((byte)(191)))));
            this.btnThem.OnDisabledState.BorderRadius = 1;
            this.btnThem.OnDisabledState.BorderStyle = Bunifu.UI.WinForms.BunifuButton.BunifuButton.BorderStyles.Solid;
            this.btnThem.OnDisabledState.BorderThickness = 1;
            this.btnThem.OnDisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(204)))), ((int)(((byte)(204)))), ((int)(((byte)(204)))));
            this.btnThem.OnDisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(168)))), ((int)(((byte)(160)))), ((int)(((byte)(168)))));
            this.btnThem.OnDisabledState.IconLeftImage = null;
            this.btnThem.OnDisabledState.IconRightImage = null;
            this.btnThem.onHoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(105)))), ((int)(((byte)(181)))), ((int)(((byte)(255)))));
            this.btnThem.onHoverState.BorderRadius = 1;
            this.btnThem.onHoverState.BorderStyle = Bunifu.UI.WinForms.BunifuButton.BunifuButton.BorderStyles.Solid;
            this.btnThem.onHoverState.BorderThickness = 1;
            this.btnThem.onHoverState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(105)))), ((int)(((byte)(181)))), ((int)(((byte)(255)))));
            this.btnThem.onHoverState.ForeColor = System.Drawing.Color.White;
            this.btnThem.onHoverState.IconLeftImage = null;
            this.btnThem.onHoverState.IconRightImage = null;
            this.btnThem.OnIdleState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(225)))));
            this.btnThem.OnIdleState.BorderRadius = 1;
            this.btnThem.OnIdleState.BorderStyle = Bunifu.UI.WinForms.BunifuButton.BunifuButton.BorderStyles.Solid;
            this.btnThem.OnIdleState.BorderThickness = 1;
            this.btnThem.OnIdleState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(225)))));
            this.btnThem.OnIdleState.ForeColor = System.Drawing.Color.White;
            this.btnThem.OnIdleState.IconLeftImage = null;
            this.btnThem.OnIdleState.IconRightImage = null;
            this.btnThem.OnPressedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(40)))), ((int)(((byte)(96)))), ((int)(((byte)(144)))));
            this.btnThem.OnPressedState.BorderRadius = 1;
            this.btnThem.OnPressedState.BorderStyle = Bunifu.UI.WinForms.BunifuButton.BunifuButton.BorderStyles.Solid;
            this.btnThem.OnPressedState.BorderThickness = 1;
            this.btnThem.OnPressedState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(40)))), ((int)(((byte)(96)))), ((int)(((byte)(144)))));
            this.btnThem.OnPressedState.ForeColor = System.Drawing.Color.White;
            this.btnThem.OnPressedState.IconLeftImage = null;
            this.btnThem.OnPressedState.IconRightImage = null;
            this.btnThem.Size = new System.Drawing.Size(91, 39);
            this.btnThem.TabIndex = 3;
            this.btnThem.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            this.btnThem.TextAlignment = System.Windows.Forms.HorizontalAlignment.Center;
            this.btnThem.TextMarginLeft = 0;
            this.btnThem.TextPadding = new System.Windows.Forms.Padding(0);
            this.btnThem.UseDefaultRadiusAndThickness = true;
            this.btnThem.Click += new System.EventHandler(this.btnXem_Click);
            // 
            // XuPhat
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1573, 693);
            this.Controls.Add(this.bunifuPanel2);
            this.Controls.Add(this.bunifuPanel1);
            this.Name = "XuPhat";
            this.Text = "XuPhat";
            this.bunifuPanel1.ResumeLayout(false);
            this.bunifuPanel1.PerformLayout();
            this.bunifuPanel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.ListXP)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private Bunifu.UI.WinForms.BunifuPanel bunifuPanel1;
        private System.Windows.Forms.ComboBox cmbLocMD;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private Bunifu.UI.WinForms.BunifuPanel bunifuPanel2;
        private Bunifu.UI.WinForms.BunifuDataGridView ListXP;
        private Bunifu.UI.WinForms.BunifuButton.BunifuButton btnThem;
    }
}