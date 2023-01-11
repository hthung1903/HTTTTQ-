
namespace QuanLyDeTai.PKHCN.KTXP
{
    partial class KHENTHUONG
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(KHENTHUONG));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            Bunifu.UI.WinForms.BunifuButton.BunifuButton.BorderEdges borderEdges1 = new Bunifu.UI.WinForms.BunifuButton.BunifuButton.BorderEdges();
            Bunifu.UI.WinForms.BunifuAnimatorNS.Animation animation1 = new Bunifu.UI.WinForms.BunifuAnimatorNS.Animation();
            this.bunifuPanel1 = new Bunifu.UI.WinForms.BunifuPanel();
            this.cmbLocCDKT = new System.Windows.Forms.ComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.bunifuPanel2 = new Bunifu.UI.WinForms.BunifuPanel();
            this.ListKT = new Bunifu.UI.WinForms.BunifuDataGridView();
            this.footerpanel = new Bunifu.UI.WinForms.BunifuPanel();
            this.btnThem = new Bunifu.UI.WinForms.BunifuButton.BunifuButton();
            this.bunifuTransition1 = new Bunifu.UI.WinForms.BunifuTransition(this.components);
            this.bunifuPanel1.SuspendLayout();
            this.bunifuPanel2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.ListKT)).BeginInit();
            this.footerpanel.SuspendLayout();
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
            this.bunifuPanel1.Controls.Add(this.cmbLocCDKT);
            this.bunifuPanel1.Controls.Add(this.label2);
            this.bunifuPanel1.Controls.Add(this.label1);
            this.bunifuTransition1.SetDecoration(this.bunifuPanel1, Bunifu.UI.WinForms.BunifuTransition.DecorationType.None);
            this.bunifuPanel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.bunifuPanel1.Location = new System.Drawing.Point(0, 0);
            this.bunifuPanel1.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.bunifuPanel1.Name = "bunifuPanel1";
            this.bunifuPanel1.ShowBorders = true;
            this.bunifuPanel1.Size = new System.Drawing.Size(1443, 82);
            this.bunifuPanel1.TabIndex = 0;
            this.bunifuPanel1.Click += new System.EventHandler(this.bunifuPanel1_Click);
            // 
            // cmbLocCDKT
            // 
            this.cmbLocCDKT.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.bunifuTransition1.SetDecoration(this.cmbLocCDKT, Bunifu.UI.WinForms.BunifuTransition.DecorationType.None);
            this.cmbLocCDKT.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbLocCDKT.FormattingEnabled = true;
            this.cmbLocCDKT.Items.AddRange(new object[] {
            "Tất cả"});
            this.cmbLocCDKT.Location = new System.Drawing.Point(1266, 21);
            this.cmbLocCDKT.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.cmbLocCDKT.Name = "cmbLocCDKT";
            this.cmbLocCDKT.Size = new System.Drawing.Size(165, 33);
            this.cmbLocCDKT.TabIndex = 2;
            this.cmbLocCDKT.SelectedIndexChanged += new System.EventHandler(this.cmbLocBB_SelectedIndexChanged);
            // 
            // label2
            // 
            this.label2.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.label2.AutoSize = true;
            this.bunifuTransition1.SetDecoration(this.label2, Bunifu.UI.WinForms.BunifuTransition.DecorationType.None);
            this.label2.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(1098, 27);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(136, 22);
            this.label2.TabIndex = 1;
            this.label2.Text = "Lọc theo cấp độ";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.bunifuTransition1.SetDecoration(this.label1, Bunifu.UI.WinForms.BunifuTransition.DecorationType.None);
            this.label1.Font = new System.Drawing.Font("Times New Roman", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(12, 15);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(240, 27);
            this.label1.TabIndex = 0;
            this.label1.Text = "Danh sách khen thưởng";
            // 
            // bunifuPanel2
            // 
            this.bunifuPanel2.BackgroundColor = System.Drawing.Color.Transparent;
            this.bunifuPanel2.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("bunifuPanel2.BackgroundImage")));
            this.bunifuPanel2.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.bunifuPanel2.BorderColor = System.Drawing.Color.Transparent;
            this.bunifuPanel2.BorderRadius = 3;
            this.bunifuPanel2.BorderThickness = 1;
            this.bunifuPanel2.Controls.Add(this.ListKT);
            this.bunifuTransition1.SetDecoration(this.bunifuPanel2, Bunifu.UI.WinForms.BunifuTransition.DecorationType.None);
            this.bunifuPanel2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.bunifuPanel2.Location = new System.Drawing.Point(0, 82);
            this.bunifuPanel2.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.bunifuPanel2.Name = "bunifuPanel2";
            this.bunifuPanel2.ShowBorders = true;
            this.bunifuPanel2.Size = new System.Drawing.Size(1443, 496);
            this.bunifuPanel2.TabIndex = 1;
            // 
            // ListKT
            // 
            this.ListKT.AllowCustomTheming = false;
            dataGridViewCellStyle1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(248)))), ((int)(((byte)(251)))), ((int)(((byte)(255)))));
            dataGridViewCellStyle1.ForeColor = System.Drawing.Color.Black;
            this.ListKT.AlternatingRowsDefaultCellStyle = dataGridViewCellStyle1;
            this.ListKT.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.ListKT.BackgroundColor = System.Drawing.Color.White;
            this.ListKT.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.ListKT.CellBorderStyle = System.Windows.Forms.DataGridViewCellBorderStyle.SingleHorizontal;
            this.ListKT.ColumnHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.None;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle2.BackColor = System.Drawing.Color.DodgerBlue;
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Segoe UI Semibold", 11.75F, System.Drawing.FontStyle.Bold);
            dataGridViewCellStyle2.ForeColor = System.Drawing.Color.White;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(24)))), ((int)(((byte)(115)))), ((int)(((byte)(204)))));
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.Color.White;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.ListKT.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle2;
            this.ListKT.ColumnHeadersHeight = 40;
            this.ListKT.CurrentTheme.AlternatingRowsStyle.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(248)))), ((int)(((byte)(251)))), ((int)(((byte)(255)))));
            this.ListKT.CurrentTheme.AlternatingRowsStyle.Font = new System.Drawing.Font("Segoe UI Semibold", 9.75F, System.Drawing.FontStyle.Bold);
            this.ListKT.CurrentTheme.AlternatingRowsStyle.ForeColor = System.Drawing.Color.Black;
            this.ListKT.CurrentTheme.AlternatingRowsStyle.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(210)))), ((int)(((byte)(232)))), ((int)(((byte)(255)))));
            this.ListKT.CurrentTheme.AlternatingRowsStyle.SelectionForeColor = System.Drawing.Color.Black;
            this.ListKT.CurrentTheme.BackColor = System.Drawing.Color.White;
            this.ListKT.CurrentTheme.GridColor = System.Drawing.Color.FromArgb(((int)(((byte)(221)))), ((int)(((byte)(238)))), ((int)(((byte)(255)))));
            this.ListKT.CurrentTheme.HeaderStyle.BackColor = System.Drawing.Color.DodgerBlue;
            this.ListKT.CurrentTheme.HeaderStyle.Font = new System.Drawing.Font("Segoe UI Semibold", 11.75F, System.Drawing.FontStyle.Bold);
            this.ListKT.CurrentTheme.HeaderStyle.ForeColor = System.Drawing.Color.White;
            this.ListKT.CurrentTheme.HeaderStyle.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(24)))), ((int)(((byte)(115)))), ((int)(((byte)(204)))));
            this.ListKT.CurrentTheme.HeaderStyle.SelectionForeColor = System.Drawing.Color.White;
            this.ListKT.CurrentTheme.Name = null;
            this.ListKT.CurrentTheme.RowsStyle.BackColor = System.Drawing.Color.White;
            this.ListKT.CurrentTheme.RowsStyle.Font = new System.Drawing.Font("Segoe UI Semibold", 9.75F, System.Drawing.FontStyle.Bold);
            this.ListKT.CurrentTheme.RowsStyle.ForeColor = System.Drawing.Color.Black;
            this.ListKT.CurrentTheme.RowsStyle.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(210)))), ((int)(((byte)(232)))), ((int)(((byte)(255)))));
            this.ListKT.CurrentTheme.RowsStyle.SelectionForeColor = System.Drawing.Color.Black;
            this.bunifuTransition1.SetDecoration(this.ListKT, Bunifu.UI.WinForms.BunifuTransition.DecorationType.None);
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle3.BackColor = System.Drawing.Color.White;
            dataGridViewCellStyle3.Font = new System.Drawing.Font("Segoe UI Semibold", 9.75F, System.Drawing.FontStyle.Bold);
            dataGridViewCellStyle3.ForeColor = System.Drawing.Color.Black;
            dataGridViewCellStyle3.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(210)))), ((int)(((byte)(232)))), ((int)(((byte)(255)))));
            dataGridViewCellStyle3.SelectionForeColor = System.Drawing.Color.Black;
            dataGridViewCellStyle3.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.ListKT.DefaultCellStyle = dataGridViewCellStyle3;
            this.ListKT.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ListKT.EnableHeadersVisualStyles = false;
            this.ListKT.GridColor = System.Drawing.Color.FromArgb(((int)(((byte)(221)))), ((int)(((byte)(238)))), ((int)(((byte)(255)))));
            this.ListKT.HeaderBackColor = System.Drawing.Color.DodgerBlue;
            this.ListKT.HeaderBgColor = System.Drawing.Color.Empty;
            this.ListKT.HeaderForeColor = System.Drawing.Color.White;
            this.ListKT.Location = new System.Drawing.Point(0, 0);
            this.ListKT.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.ListKT.Name = "ListKT";
            this.ListKT.RowHeadersVisible = false;
            this.ListKT.RowHeadersWidth = 51;
            this.ListKT.RowTemplate.Height = 40;
            this.ListKT.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.ListKT.Size = new System.Drawing.Size(1443, 496);
            this.ListKT.TabIndex = 0;
            this.ListKT.Theme = Bunifu.UI.WinForms.BunifuDataGridView.PresetThemes.Light;
            this.ListKT.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.ListBB_CellClick);
            // 
            // footerpanel
            // 
            this.footerpanel.BackgroundColor = System.Drawing.Color.Transparent;
            this.footerpanel.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("footerpanel.BackgroundImage")));
            this.footerpanel.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.footerpanel.BorderColor = System.Drawing.Color.Transparent;
            this.footerpanel.BorderRadius = 3;
            this.footerpanel.BorderThickness = 1;
            this.footerpanel.Controls.Add(this.btnThem);
            this.bunifuTransition1.SetDecoration(this.footerpanel, Bunifu.UI.WinForms.BunifuTransition.DecorationType.None);
            this.footerpanel.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.footerpanel.Location = new System.Drawing.Point(0, 512);
            this.footerpanel.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.footerpanel.Name = "footerpanel";
            this.footerpanel.ShowBorders = true;
            this.footerpanel.Size = new System.Drawing.Size(1443, 66);
            this.footerpanel.TabIndex = 2;
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
            this.bunifuTransition1.SetDecoration(this.btnThem, Bunifu.UI.WinForms.BunifuTransition.DecorationType.None);
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
            this.btnThem.Location = new System.Drawing.Point(1340, 16);
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
            this.btnThem.TabIndex = 0;
            this.btnThem.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            this.btnThem.TextAlignment = System.Windows.Forms.HorizontalAlignment.Center;
            this.btnThem.TextMarginLeft = 0;
            this.btnThem.TextPadding = new System.Windows.Forms.Padding(0);
            this.btnThem.UseDefaultRadiusAndThickness = true;
            this.btnThem.Click += new System.EventHandler(this.btnXem_Click);
            // 
            // bunifuTransition1
            // 
            this.bunifuTransition1.AnimationType = Bunifu.UI.WinForms.BunifuAnimatorNS.AnimationType.VertSlide;
            this.bunifuTransition1.Cursor = null;
            animation1.AnimateOnlyDifferences = true;
            animation1.BlindCoeff = ((System.Drawing.PointF)(resources.GetObject("animation1.BlindCoeff")));
            animation1.LeafCoeff = 0F;
            animation1.MaxTime = 1F;
            animation1.MinTime = 0F;
            animation1.MosaicCoeff = ((System.Drawing.PointF)(resources.GetObject("animation1.MosaicCoeff")));
            animation1.MosaicShift = ((System.Drawing.PointF)(resources.GetObject("animation1.MosaicShift")));
            animation1.MosaicSize = 0;
            animation1.Padding = new System.Windows.Forms.Padding(0);
            animation1.RotateCoeff = 0F;
            animation1.RotateLimit = 0F;
            animation1.ScaleCoeff = ((System.Drawing.PointF)(resources.GetObject("animation1.ScaleCoeff")));
            animation1.SlideCoeff = ((System.Drawing.PointF)(resources.GetObject("animation1.SlideCoeff")));
            animation1.TimeCoeff = 0F;
            animation1.TransparencyCoeff = 0F;
            this.bunifuTransition1.DefaultAnimation = animation1;
            // 
            // KHENTHUONG
            // 
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.None;
            this.ClientSize = new System.Drawing.Size(1443, 578);
            this.Controls.Add(this.footerpanel);
            this.Controls.Add(this.bunifuPanel2);
            this.Controls.Add(this.bunifuPanel1);
            this.bunifuTransition1.SetDecoration(this, Bunifu.UI.WinForms.BunifuTransition.DecorationType.None);
            this.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.Name = "KHENTHUONG";
            this.Text = "THONGKE";
            this.bunifuPanel1.ResumeLayout(false);
            this.bunifuPanel1.PerformLayout();
            this.bunifuPanel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.ListKT)).EndInit();
            this.footerpanel.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private Bunifu.UI.WinForms.BunifuPanel bunifuPanel1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox cmbLocCDKT;
        private System.Windows.Forms.Label label2;
        private Bunifu.UI.WinForms.BunifuPanel bunifuPanel2;
        private Bunifu.UI.WinForms.BunifuDataGridView ListKT;
        private Bunifu.UI.WinForms.BunifuPanel footerpanel;
        private Bunifu.UI.WinForms.BunifuButton.BunifuButton btnThem;
        private Bunifu.UI.WinForms.BunifuTransition bunifuTransition1;
    }
}