namespace ProjetFinalDessandeDetournayPecriauxWery
{
    partial class ProjetFinal
    {
        /// <summary>
        /// Variable nécessaire au concepteur.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Nettoyage des ressources utilisées.
        /// </summary>
        /// <param name="disposing">true si les ressources managées doivent être supprimées ; sinon, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Code généré par le Concepteur Windows Form

        /// <summary>
        /// Méthode requise pour la prise en charge du concepteur - ne modifiez pas
        /// le contenu de cette méthode avec l'éditeur de code.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.temperature = new System.Windows.Forms.GroupBox();
            this.donneeTemperature = new System.Windows.Forms.Label();
            this.messageTemp = new System.Windows.Forms.Label();
            this.ethernet = new System.Windows.Forms.GroupBox();
            this.pingGroup = new System.Windows.Forms.GroupBox();
            this.buttonPing = new System.Windows.Forms.Button();
            this.detailsPing = new System.Windows.Forms.Label();
            this.messageIpClient = new System.Windows.Forms.Label();
            this.donneeIpClient = new System.Windows.Forms.Label();
            this.messageEtatClient = new System.Windows.Forms.Label();
            this.messageEtat = new System.Windows.Forms.Label();
            this.lumiere = new System.Windows.Forms.GroupBox();
            this.donneeLumiere = new System.Windows.Forms.Label();
            this.messageLum = new System.Windows.Forms.Label();
            this.usart = new System.Windows.Forms.GroupBox();
            this.portSerie = new System.Windows.Forms.Label();
            this.messageSerie = new System.Windows.Forms.Label();
            this.serialPort = new System.IO.Ports.SerialPort(this.components);
            this.tableauTemperature = new System.Windows.Forms.TableLayoutPanel();
            this.temperature.SuspendLayout();
            this.ethernet.SuspendLayout();
            this.pingGroup.SuspendLayout();
            this.lumiere.SuspendLayout();
            this.usart.SuspendLayout();
            this.SuspendLayout();
            // 
            // temperature
            // 
            this.temperature.BackColor = System.Drawing.Color.PaleTurquoise;
            this.temperature.Controls.Add(this.tableauTemperature);
            this.temperature.Controls.Add(this.donneeTemperature);
            this.temperature.Controls.Add(this.messageTemp);
            this.temperature.Location = new System.Drawing.Point(6, 96);
            this.temperature.Name = "temperature";
            this.temperature.Size = new System.Drawing.Size(461, 102);
            this.temperature.TabIndex = 0;
            this.temperature.TabStop = false;
            this.temperature.Text = "Température";
            // 
            // donneeTemperature
            // 
            this.donneeTemperature.AutoSize = true;
            this.donneeTemperature.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.donneeTemperature.Location = new System.Drawing.Point(219, 26);
            this.donneeTemperature.Name = "donneeTemperature";
            this.donneeTemperature.Size = new System.Drawing.Size(227, 28);
            this.donneeTemperature.TabIndex = 1;
            this.donneeTemperature.Text = "En attente de réception...";
            // 
            // messageTemp
            // 
            this.messageTemp.AutoSize = true;
            this.messageTemp.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold);
            this.messageTemp.Location = new System.Drawing.Point(13, 26);
            this.messageTemp.Name = "messageTemp";
            this.messageTemp.Size = new System.Drawing.Size(204, 28);
            this.messageTemp.TabIndex = 0;
            this.messageTemp.Text = "Température en °C : ";
            // 
            // ethernet
            // 
            this.ethernet.BackColor = System.Drawing.Color.LightCyan;
            this.ethernet.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.ethernet.Controls.Add(this.pingGroup);
            this.ethernet.Controls.Add(this.messageIpClient);
            this.ethernet.Controls.Add(this.donneeIpClient);
            this.ethernet.Controls.Add(this.messageEtatClient);
            this.ethernet.Controls.Add(this.messageEtat);
            this.ethernet.Controls.Add(this.lumiere);
            this.ethernet.Controls.Add(this.temperature);
            this.ethernet.Location = new System.Drawing.Point(12, 12);
            this.ethernet.Name = "ethernet";
            this.ethernet.Size = new System.Drawing.Size(473, 526);
            this.ethernet.TabIndex = 2;
            this.ethernet.TabStop = false;
            this.ethernet.Text = "Via Ethernet";
            // 
            // pingGroup
            // 
            this.pingGroup.BackColor = System.Drawing.Color.PaleTurquoise;
            this.pingGroup.Controls.Add(this.buttonPing);
            this.pingGroup.Controls.Add(this.detailsPing);
            this.pingGroup.Location = new System.Drawing.Point(11, 279);
            this.pingGroup.Name = "pingGroup";
            this.pingGroup.Size = new System.Drawing.Size(456, 241);
            this.pingGroup.TabIndex = 8;
            this.pingGroup.TabStop = false;
            this.pingGroup.Text = "Ping client";
            this.pingGroup.Visible = false;
            // 
            // buttonPing
            // 
            this.buttonPing.BackColor = System.Drawing.SystemColors.ButtonFace;
            this.buttonPing.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold);
            this.buttonPing.Location = new System.Drawing.Point(113, 25);
            this.buttonPing.Name = "buttonPing";
            this.buttonPing.Size = new System.Drawing.Size(198, 58);
            this.buttonPing.TabIndex = 6;
            this.buttonPing.Text = "Ping client";
            this.buttonPing.UseVisualStyleBackColor = false;
            this.buttonPing.Click += new System.EventHandler(this.buttonPing_Click);
            // 
            // detailsPing
            // 
            this.detailsPing.AutoSize = true;
            this.detailsPing.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.detailsPing.Location = new System.Drawing.Point(15, 98);
            this.detailsPing.Name = "detailsPing";
            this.detailsPing.Size = new System.Drawing.Size(160, 25);
            this.detailsPing.TabIndex = 7;
            this.detailsPing.Text = "Details des pings";
            // 
            // messageIpClient
            // 
            this.messageIpClient.AutoSize = true;
            this.messageIpClient.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.messageIpClient.Location = new System.Drawing.Point(87, 60);
            this.messageIpClient.Name = "messageIpClient";
            this.messageIpClient.Size = new System.Drawing.Size(136, 28);
            this.messageIpClient.TabIndex = 5;
            this.messageIpClient.Text = "IP du client : ";
            // 
            // donneeIpClient
            // 
            this.donneeIpClient.AutoSize = true;
            this.donneeIpClient.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.donneeIpClient.Location = new System.Drawing.Point(225, 60);
            this.donneeIpClient.Name = "donneeIpClient";
            this.donneeIpClient.Size = new System.Drawing.Size(208, 28);
            this.donneeIpClient.TabIndex = 4;
            this.donneeIpClient.Text = "En attente d\'un client...";
            // 
            // messageEtatClient
            // 
            this.messageEtatClient.AutoSize = true;
            this.messageEtatClient.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.messageEtatClient.Location = new System.Drawing.Point(225, 18);
            this.messageEtatClient.Name = "messageEtatClient";
            this.messageEtatClient.Size = new System.Drawing.Size(208, 28);
            this.messageEtatClient.TabIndex = 3;
            this.messageEtatClient.Text = "En attente d\'un client...";
            this.messageEtatClient.Click += new System.EventHandler(this.messageEtatClient_Click);
            // 
            // messageEtat
            // 
            this.messageEtat.AutoSize = true;
            this.messageEtat.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold);
            this.messageEtat.Location = new System.Drawing.Point(23, 18);
            this.messageEtat.Name = "messageEtat";
            this.messageEtat.Size = new System.Drawing.Size(200, 28);
            this.messageEtat.TabIndex = 2;
            this.messageEtat.Text = "Etat de connexion : ";
            this.messageEtat.Click += new System.EventHandler(this.messageEtat_Click);
            // 
            // lumiere
            // 
            this.lumiere.BackColor = System.Drawing.Color.PaleTurquoise;
            this.lumiere.Controls.Add(this.donneeLumiere);
            this.lumiere.Controls.Add(this.messageLum);
            this.lumiere.Location = new System.Drawing.Point(6, 204);
            this.lumiere.Name = "lumiere";
            this.lumiere.Size = new System.Drawing.Size(461, 69);
            this.lumiere.TabIndex = 1;
            this.lumiere.TabStop = false;
            this.lumiere.Text = "Lumière";
            // 
            // donneeLumiere
            // 
            this.donneeLumiere.AutoSize = true;
            this.donneeLumiere.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.donneeLumiere.Location = new System.Drawing.Point(219, 26);
            this.donneeLumiere.Name = "donneeLumiere";
            this.donneeLumiere.Size = new System.Drawing.Size(227, 28);
            this.donneeLumiere.TabIndex = 1;
            this.donneeLumiere.Text = "En attente de réception...";
            // 
            // messageLum
            // 
            this.messageLum.AutoSize = true;
            this.messageLum.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold);
            this.messageLum.Location = new System.Drawing.Point(48, 26);
            this.messageLum.Name = "messageLum";
            this.messageLum.Size = new System.Drawing.Size(169, 28);
            this.messageLum.TabIndex = 0;
            this.messageLum.Text = "Lumière en lux : ";
            // 
            // usart
            // 
            this.usart.BackColor = System.Drawing.Color.LightCyan;
            this.usart.Controls.Add(this.portSerie);
            this.usart.Controls.Add(this.messageSerie);
            this.usart.Location = new System.Drawing.Point(491, 12);
            this.usart.Name = "usart";
            this.usart.Size = new System.Drawing.Size(435, 526);
            this.usart.TabIndex = 3;
            this.usart.TabStop = false;
            this.usart.Text = "Via Usart";
            this.usart.Visible = false;
            // 
            // portSerie
            // 
            this.portSerie.AutoSize = true;
            this.portSerie.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.portSerie.Location = new System.Drawing.Point(110, 18);
            this.portSerie.Name = "portSerie";
            this.portSerie.Size = new System.Drawing.Size(164, 28);
            this.portSerie.TabIndex = 1;
            this.portSerie.Text = "Attente de carte...";
            // 
            // messageSerie
            // 
            this.messageSerie.AutoSize = true;
            this.messageSerie.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold);
            this.messageSerie.Location = new System.Drawing.Point(6, 18);
            this.messageSerie.Name = "messageSerie";
            this.messageSerie.Size = new System.Drawing.Size(98, 28);
            this.messageSerie.TabIndex = 0;
            this.messageSerie.Text = "ID User : ";
            // 
            // serialPort
            // 
            this.serialPort.PortName = "COM4";
            this.serialPort.DataReceived += new System.IO.Ports.SerialDataReceivedEventHandler(this.dataReceiveSerial);
            // 
            // tableauTemperature
            // 
            this.tableauTemperature.CellBorderStyle = System.Windows.Forms.TableLayoutPanelCellBorderStyle.Single;
            this.tableauTemperature.ColumnCount = 3;
            this.tableauTemperature.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 45.28302F));
            this.tableauTemperature.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 54.71698F));
            this.tableauTemperature.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 123F));
            this.tableauTemperature.Location = new System.Drawing.Point(25, 58);
            this.tableauTemperature.Name = "tableauTemperature";
            this.tableauTemperature.RowCount = 2;
            this.tableauTemperature.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 33.33333F));
            this.tableauTemperature.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 66.66666F));
            this.tableauTemperature.Size = new System.Drawing.Size(402, 38);
            this.tableauTemperature.TabIndex = 2;
            // 
            // ProjetFinal
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Azure;
            this.BackgroundImage = global::ProjetFinalDessandeDetournayPecriauxWery.Properties.Resources.rfidlogo;
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.ClientSize = new System.Drawing.Size(938, 550);
            this.Controls.Add(this.usart);
            this.Controls.Add(this.ethernet);
            this.DoubleBuffered = true;
            this.Name = "ProjetFinal";
            this.Text = "ProjetTD Dessandé Detournay Pecriaux Wery";
            this.temperature.ResumeLayout(false);
            this.temperature.PerformLayout();
            this.ethernet.ResumeLayout(false);
            this.ethernet.PerformLayout();
            this.pingGroup.ResumeLayout(false);
            this.pingGroup.PerformLayout();
            this.lumiere.ResumeLayout(false);
            this.lumiere.PerformLayout();
            this.usart.ResumeLayout(false);
            this.usart.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox temperature;
        private System.Windows.Forms.Label messageTemp;
        private System.Windows.Forms.Label donneeTemperature;
        private System.Windows.Forms.GroupBox ethernet;
        private System.Windows.Forms.GroupBox lumiere;
        private System.Windows.Forms.Label messageLum;
        private System.Windows.Forms.Label donneeLumiere;
        private System.Windows.Forms.GroupBox usart;
        private System.Windows.Forms.Label portSerie;
        private System.Windows.Forms.Label messageSerie;
        private System.IO.Ports.SerialPort serialPort;
        private System.Windows.Forms.Label messageEtatClient;
        private System.Windows.Forms.Label messageEtat;
        private System.Windows.Forms.Label messageIpClient;
        private System.Windows.Forms.Label donneeIpClient;
        private System.Windows.Forms.Button buttonPing;
        private System.Windows.Forms.GroupBox pingGroup;
        private System.Windows.Forms.Label detailsPing;
        private System.Windows.Forms.TableLayoutPanel tableauTemperature;
    }
}

