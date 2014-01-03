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
            this.donneeTempMax = new System.Windows.Forms.Label();
            this.donneeTempMoy = new System.Windows.Forms.Label();
            this.donneeTempMin = new System.Windows.Forms.Label();
            this.TempMax = new System.Windows.Forms.Label();
            this.TempMoy = new System.Windows.Forms.Label();
            this.TempMin = new System.Windows.Forms.Label();
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
            this.utilisateurGroup = new System.Windows.Forms.GroupBox();
            this.donneeNumTel = new System.Windows.Forms.Label();
            this.affStatut = new System.Windows.Forms.Label();
            this.affNumTel = new System.Windows.Forms.Label();
            this.portSerie = new System.Windows.Forms.Label();
            this.messageSerie = new System.Windows.Forms.Label();
            this.FormCarte = new System.Windows.Forms.GroupBox();
            this.buttonEnvoyer = new System.Windows.Forms.Button();
            this.textNumTel = new System.Windows.Forms.TextBox();
            this.textID = new System.Windows.Forms.TextBox();
            this.checkStatut = new System.Windows.Forms.CheckBox();
            this.formStatut = new System.Windows.Forms.Label();
            this.formNumTel = new System.Windows.Forms.Label();
            this.formIDUser = new System.Windows.Forms.Label();
            this.serialPort = new System.IO.Ports.SerialPort(this.components);
            this.temperature.SuspendLayout();
            this.ethernet.SuspendLayout();
            this.pingGroup.SuspendLayout();
            this.lumiere.SuspendLayout();
            this.usart.SuspendLayout();
            this.utilisateurGroup.SuspendLayout();
            this.FormCarte.SuspendLayout();
            this.SuspendLayout();
            // 
            // temperature
            // 
            this.temperature.BackColor = System.Drawing.Color.PaleTurquoise;
            this.temperature.Controls.Add(this.donneeTempMax);
            this.temperature.Controls.Add(this.donneeTempMoy);
            this.temperature.Controls.Add(this.donneeTempMin);
            this.temperature.Controls.Add(this.TempMax);
            this.temperature.Controls.Add(this.TempMoy);
            this.temperature.Controls.Add(this.TempMin);
            this.temperature.Controls.Add(this.donneeTemperature);
            this.temperature.Controls.Add(this.messageTemp);
            this.temperature.Location = new System.Drawing.Point(4, 62);
            this.temperature.Margin = new System.Windows.Forms.Padding(2);
            this.temperature.Name = "temperature";
            this.temperature.Padding = new System.Windows.Forms.Padding(2);
            this.temperature.Size = new System.Drawing.Size(307, 66);
            this.temperature.TabIndex = 0;
            this.temperature.TabStop = false;
            this.temperature.Text = "Température";
            // 
            // donneeTempMax
            // 
            this.donneeTempMax.AutoSize = true;
            this.donneeTempMax.Location = new System.Drawing.Point(219, 49);
            this.donneeTempMax.Name = "donneeTempMax";
            this.donneeTempMax.Size = new System.Drawing.Size(56, 13);
            this.donneeTempMax.TabIndex = 2;
            this.donneeTempMax.Text = "En attente";
            // 
            // donneeTempMoy
            // 
            this.donneeTempMoy.AutoSize = true;
            this.donneeTempMoy.Location = new System.Drawing.Point(130, 49);
            this.donneeTempMoy.Name = "donneeTempMoy";
            this.donneeTempMoy.Size = new System.Drawing.Size(56, 13);
            this.donneeTempMoy.TabIndex = 6;
            this.donneeTempMoy.Text = "En attente";
            // 
            // donneeTempMin
            // 
            this.donneeTempMin.AutoSize = true;
            this.donneeTempMin.Location = new System.Drawing.Point(39, 49);
            this.donneeTempMin.Name = "donneeTempMin";
            this.donneeTempMin.Size = new System.Drawing.Size(56, 13);
            this.donneeTempMin.TabIndex = 5;
            this.donneeTempMin.Text = "En attente";
            // 
            // TempMax
            // 
            this.TempMax.AutoSize = true;
            this.TempMax.Location = new System.Drawing.Point(210, 36);
            this.TempMax.Name = "TempMax";
            this.TempMax.Size = new System.Drawing.Size(65, 13);
            this.TempMax.TabIndex = 4;
            this.TempMax.Text = "T° Maximum";
            // 
            // TempMoy
            // 
            this.TempMoy.AutoSize = true;
            this.TempMoy.Location = new System.Drawing.Point(121, 36);
            this.TempMoy.Name = "TempMoy";
            this.TempMoy.Size = new System.Drawing.Size(65, 13);
            this.TempMoy.TabIndex = 3;
            this.TempMoy.Text = "T° Moyenne";
            // 
            // TempMin
            // 
            this.TempMin.AutoSize = true;
            this.TempMin.Location = new System.Drawing.Point(33, 36);
            this.TempMin.Name = "TempMin";
            this.TempMin.Size = new System.Drawing.Size(62, 13);
            this.TempMin.TabIndex = 2;
            this.TempMin.Text = "T° Minimum";
            // 
            // donneeTemperature
            // 
            this.donneeTemperature.AutoSize = true;
            this.donneeTemperature.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.donneeTemperature.Location = new System.Drawing.Point(146, 17);
            this.donneeTemperature.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.donneeTemperature.Name = "donneeTemperature";
            this.donneeTemperature.Size = new System.Drawing.Size(161, 19);
            this.donneeTemperature.TabIndex = 1;
            this.donneeTemperature.Text = "En attente de réception...";
            // 
            // messageTemp
            // 
            this.messageTemp.AutoSize = true;
            this.messageTemp.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold);
            this.messageTemp.Location = new System.Drawing.Point(9, 17);
            this.messageTemp.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.messageTemp.Name = "messageTemp";
            this.messageTemp.Size = new System.Drawing.Size(145, 19);
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
            this.ethernet.Location = new System.Drawing.Point(8, 8);
            this.ethernet.Margin = new System.Windows.Forms.Padding(2);
            this.ethernet.Name = "ethernet";
            this.ethernet.Padding = new System.Windows.Forms.Padding(2);
            this.ethernet.Size = new System.Drawing.Size(315, 342);
            this.ethernet.TabIndex = 2;
            this.ethernet.TabStop = false;
            this.ethernet.Text = "Via Ethernet";
            // 
            // pingGroup
            // 
            this.pingGroup.BackColor = System.Drawing.Color.PaleTurquoise;
            this.pingGroup.Controls.Add(this.buttonPing);
            this.pingGroup.Controls.Add(this.detailsPing);
            this.pingGroup.Location = new System.Drawing.Point(4, 181);
            this.pingGroup.Margin = new System.Windows.Forms.Padding(2);
            this.pingGroup.Name = "pingGroup";
            this.pingGroup.Padding = new System.Windows.Forms.Padding(2);
            this.pingGroup.Size = new System.Drawing.Size(307, 157);
            this.pingGroup.TabIndex = 8;
            this.pingGroup.TabStop = false;
            this.pingGroup.Text = "Ping client";
            // 
            // buttonPing
            // 
            this.buttonPing.BackColor = System.Drawing.SystemColors.ButtonFace;
            this.buttonPing.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold);
            this.buttonPing.Location = new System.Drawing.Point(75, 16);
            this.buttonPing.Margin = new System.Windows.Forms.Padding(2);
            this.buttonPing.Name = "buttonPing";
            this.buttonPing.Size = new System.Drawing.Size(132, 38);
            this.buttonPing.TabIndex = 6;
            this.buttonPing.Text = "Ping client";
            this.buttonPing.UseVisualStyleBackColor = false;
            this.buttonPing.Click += new System.EventHandler(this.buttonPing_Click);
            // 
            // detailsPing
            // 
            this.detailsPing.AutoSize = true;
            this.detailsPing.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.detailsPing.Location = new System.Drawing.Point(10, 64);
            this.detailsPing.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.detailsPing.Name = "detailsPing";
            this.detailsPing.Size = new System.Drawing.Size(116, 17);
            this.detailsPing.TabIndex = 7;
            this.detailsPing.Text = "Details des pings";
            // 
            // messageIpClient
            // 
            this.messageIpClient.AutoSize = true;
            this.messageIpClient.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.messageIpClient.Location = new System.Drawing.Point(58, 39);
            this.messageIpClient.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.messageIpClient.Name = "messageIpClient";
            this.messageIpClient.Size = new System.Drawing.Size(95, 19);
            this.messageIpClient.TabIndex = 5;
            this.messageIpClient.Text = "IP du client : ";
            // 
            // donneeIpClient
            // 
            this.donneeIpClient.AutoSize = true;
            this.donneeIpClient.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.donneeIpClient.Location = new System.Drawing.Point(150, 39);
            this.donneeIpClient.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.donneeIpClient.Name = "donneeIpClient";
            this.donneeIpClient.Size = new System.Drawing.Size(148, 19);
            this.donneeIpClient.TabIndex = 4;
            this.donneeIpClient.Text = "En attente d\'un client...";
            // 
            // messageEtatClient
            // 
            this.messageEtatClient.AutoSize = true;
            this.messageEtatClient.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.messageEtatClient.Location = new System.Drawing.Point(150, 12);
            this.messageEtatClient.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.messageEtatClient.Name = "messageEtatClient";
            this.messageEtatClient.Size = new System.Drawing.Size(148, 19);
            this.messageEtatClient.TabIndex = 3;
            this.messageEtatClient.Text = "En attente d\'un client...";
            this.messageEtatClient.Click += new System.EventHandler(this.messageEtatClient_Click);
            // 
            // messageEtat
            // 
            this.messageEtat.AutoSize = true;
            this.messageEtat.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold);
            this.messageEtat.Location = new System.Drawing.Point(15, 12);
            this.messageEtat.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.messageEtat.Name = "messageEtat";
            this.messageEtat.Size = new System.Drawing.Size(140, 19);
            this.messageEtat.TabIndex = 2;
            this.messageEtat.Text = "Etat de connexion : ";
            this.messageEtat.Click += new System.EventHandler(this.messageEtat_Click);
            // 
            // lumiere
            // 
            this.lumiere.BackColor = System.Drawing.Color.PaleTurquoise;
            this.lumiere.Controls.Add(this.donneeLumiere);
            this.lumiere.Controls.Add(this.messageLum);
            this.lumiere.Location = new System.Drawing.Point(4, 133);
            this.lumiere.Margin = new System.Windows.Forms.Padding(2);
            this.lumiere.Name = "lumiere";
            this.lumiere.Padding = new System.Windows.Forms.Padding(2);
            this.lumiere.Size = new System.Drawing.Size(307, 45);
            this.lumiere.TabIndex = 1;
            this.lumiere.TabStop = false;
            this.lumiere.Text = "Lumière";
            // 
            // donneeLumiere
            // 
            this.donneeLumiere.AutoSize = true;
            this.donneeLumiere.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.donneeLumiere.Location = new System.Drawing.Point(146, 17);
            this.donneeLumiere.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.donneeLumiere.Name = "donneeLumiere";
            this.donneeLumiere.Size = new System.Drawing.Size(161, 19);
            this.donneeLumiere.TabIndex = 1;
            this.donneeLumiere.Text = "En attente de réception...";
            // 
            // messageLum
            // 
            this.messageLum.AutoSize = true;
            this.messageLum.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold);
            this.messageLum.Location = new System.Drawing.Point(32, 17);
            this.messageLum.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.messageLum.Name = "messageLum";
            this.messageLum.Size = new System.Drawing.Size(119, 19);
            this.messageLum.TabIndex = 0;
            this.messageLum.Text = "Lumière en lux : ";
            // 
            // usart
            // 
            this.usart.BackColor = System.Drawing.Color.LightCyan;
            this.usart.Controls.Add(this.utilisateurGroup);
            this.usart.Controls.Add(this.FormCarte);
            this.usart.Location = new System.Drawing.Point(327, 8);
            this.usart.Margin = new System.Windows.Forms.Padding(2);
            this.usart.Name = "usart";
            this.usart.Padding = new System.Windows.Forms.Padding(2);
            this.usart.Size = new System.Drawing.Size(290, 342);
            this.usart.TabIndex = 3;
            this.usart.TabStop = false;
            this.usart.Text = "Via Usart";
            // 
            // utilisateurGroup
            // 
            this.utilisateurGroup.Controls.Add(this.donneeNumTel);
            this.utilisateurGroup.Controls.Add(this.affStatut);
            this.utilisateurGroup.Controls.Add(this.affNumTel);
            this.utilisateurGroup.Controls.Add(this.portSerie);
            this.utilisateurGroup.Controls.Add(this.messageSerie);
            this.utilisateurGroup.Location = new System.Drawing.Point(5, 18);
            this.utilisateurGroup.Name = "utilisateurGroup";
            this.utilisateurGroup.Size = new System.Drawing.Size(280, 160);
            this.utilisateurGroup.TabIndex = 3;
            this.utilisateurGroup.TabStop = false;
            this.utilisateurGroup.Text = "Données Utilisateur";
            // 
            // donneeNumTel
            // 
            this.donneeNumTel.AutoSize = true;
            this.donneeNumTel.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.donneeNumTel.Location = new System.Drawing.Point(139, 44);
            this.donneeNumTel.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.donneeNumTel.Name = "donneeNumTel";
            this.donneeNumTel.Size = new System.Drawing.Size(117, 19);
            this.donneeNumTel.TabIndex = 4;
            this.donneeNumTel.Text = "Attente de carte...";
            // 
            // affStatut
            // 
            this.affStatut.AutoSize = true;
            this.affStatut.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold);
            this.affStatut.Location = new System.Drawing.Point(85, 74);
            this.affStatut.Name = "affStatut";
            this.affStatut.Size = new System.Drawing.Size(77, 19);
            this.affStatut.TabIndex = 3;
            this.affStatut.Text = "En Attente";
            // 
            // affNumTel
            // 
            this.affNumTel.AutoSize = true;
            this.affNumTel.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold);
            this.affNumTel.Location = new System.Drawing.Point(23, 44);
            this.affNumTel.Name = "affNumTel";
            this.affNumTel.Size = new System.Drawing.Size(114, 19);
            this.affNumTel.TabIndex = 2;
            this.affNumTel.Text = "N° Telephonne :";
            // 
            // portSerie
            // 
            this.portSerie.AutoSize = true;
            this.portSerie.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.portSerie.Location = new System.Drawing.Point(140, 16);
            this.portSerie.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.portSerie.Name = "portSerie";
            this.portSerie.Size = new System.Drawing.Size(117, 19);
            this.portSerie.TabIndex = 1;
            this.portSerie.Text = "Attente de carte...";
            // 
            // messageSerie
            // 
            this.messageSerie.AutoSize = true;
            this.messageSerie.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold);
            this.messageSerie.Location = new System.Drawing.Point(68, 16);
            this.messageSerie.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.messageSerie.Name = "messageSerie";
            this.messageSerie.Size = new System.Drawing.Size(69, 19);
            this.messageSerie.TabIndex = 0;
            this.messageSerie.Text = "ID User : ";
            // 
            // FormCarte
            // 
            this.FormCarte.Controls.Add(this.buttonEnvoyer);
            this.FormCarte.Controls.Add(this.textNumTel);
            this.FormCarte.Controls.Add(this.textID);
            this.FormCarte.Controls.Add(this.checkStatut);
            this.FormCarte.Controls.Add(this.formStatut);
            this.FormCarte.Controls.Add(this.formNumTel);
            this.FormCarte.Controls.Add(this.formIDUser);
            this.FormCarte.Location = new System.Drawing.Point(5, 181);
            this.FormCarte.Name = "FormCarte";
            this.FormCarte.Size = new System.Drawing.Size(280, 156);
            this.FormCarte.TabIndex = 2;
            this.FormCarte.TabStop = false;
            this.FormCarte.Text = "Formulaire Création Carte";
            // 
            // buttonEnvoyer
            // 
            this.buttonEnvoyer.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold);
            this.buttonEnvoyer.Location = new System.Drawing.Point(79, 108);
            this.buttonEnvoyer.Name = "buttonEnvoyer";
            this.buttonEnvoyer.Size = new System.Drawing.Size(132, 38);
            this.buttonEnvoyer.TabIndex = 6;
            this.buttonEnvoyer.Text = "Envoyer";
            this.buttonEnvoyer.UseVisualStyleBackColor = true;
            // 
            // textNumTel
            // 
            this.textNumTel.Location = new System.Drawing.Point(143, 52);
            this.textNumTel.Name = "textNumTel";
            this.textNumTel.Size = new System.Drawing.Size(100, 20);
            this.textNumTel.TabIndex = 5;
            // 
            // textID
            // 
            this.textID.Location = new System.Drawing.Point(144, 18);
            this.textID.Name = "textID";
            this.textID.Size = new System.Drawing.Size(100, 20);
            this.textID.TabIndex = 4;
            // 
            // checkStatut
            // 
            this.checkStatut.AutoSize = true;
            this.checkStatut.Location = new System.Drawing.Point(182, 88);
            this.checkStatut.Name = "checkStatut";
            this.checkStatut.Size = new System.Drawing.Size(15, 14);
            this.checkStatut.TabIndex = 3;
            this.checkStatut.UseVisualStyleBackColor = true;
            // 
            // formStatut
            // 
            this.formStatut.AutoSize = true;
            this.formStatut.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold);
            this.formStatut.Location = new System.Drawing.Point(25, 83);
            this.formStatut.Name = "formStatut";
            this.formStatut.Size = new System.Drawing.Size(112, 19);
            this.formStatut.TabIndex = 2;
            this.formStatut.Text = "Administraeur :";
            // 
            // formNumTel
            // 
            this.formNumTel.AutoSize = true;
            this.formNumTel.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold);
            this.formNumTel.Location = new System.Drawing.Point(23, 52);
            this.formNumTel.Name = "formNumTel";
            this.formNumTel.Size = new System.Drawing.Size(114, 19);
            this.formNumTel.TabIndex = 1;
            this.formNumTel.Text = "N° Telephonne :";
            // 
            // formIDUser
            // 
            this.formIDUser.AutoSize = true;
            this.formIDUser.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold);
            this.formIDUser.Location = new System.Drawing.Point(7, 20);
            this.formIDUser.Name = "formIDUser";
            this.formIDUser.Size = new System.Drawing.Size(130, 19);
            this.formIDUser.TabIndex = 0;
            this.formIDUser.Text = "ID de l\'utilisateur :";
            // 
            // serialPort
            // 
            this.serialPort.PortName = "COM5";
            this.serialPort.DataReceived += new System.IO.Ports.SerialDataReceivedEventHandler(this.dataReceiveSerial);
            // 
            // ProjetFinal
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Azure;
            this.BackgroundImage = global::ProjetFinalDessandeDetournayPecriauxWery.Properties.Resources.rfidlogo;
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.ClientSize = new System.Drawing.Size(625, 357);
            this.Controls.Add(this.usart);
            this.Controls.Add(this.ethernet);
            this.DoubleBuffered = true;
            this.Margin = new System.Windows.Forms.Padding(2);
            this.Name = "ProjetFinal";
            this.Text = "ProjetTD Dessandé Detournay Pecriaux Wery";
            this.Load += new System.EventHandler(this.ProjetFinal_Load);
            this.temperature.ResumeLayout(false);
            this.temperature.PerformLayout();
            this.ethernet.ResumeLayout(false);
            this.ethernet.PerformLayout();
            this.pingGroup.ResumeLayout(false);
            this.pingGroup.PerformLayout();
            this.lumiere.ResumeLayout(false);
            this.lumiere.PerformLayout();
            this.usart.ResumeLayout(false);
            this.utilisateurGroup.ResumeLayout(false);
            this.utilisateurGroup.PerformLayout();
            this.FormCarte.ResumeLayout(false);
            this.FormCarte.PerformLayout();
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
        private System.Windows.Forms.Label donneeTempMax;
        private System.Windows.Forms.Label donneeTempMoy;
        private System.Windows.Forms.Label donneeTempMin;
        private System.Windows.Forms.Label TempMax;
        private System.Windows.Forms.Label TempMoy;
        private System.Windows.Forms.Label TempMin;
        private System.Windows.Forms.GroupBox FormCarte;
        private System.Windows.Forms.Label formStatut;
        private System.Windows.Forms.Label formNumTel;
        private System.Windows.Forms.Label formIDUser;
        private System.Windows.Forms.TextBox textNumTel;
        private System.Windows.Forms.TextBox textID;
        private System.Windows.Forms.CheckBox checkStatut;
        private System.Windows.Forms.Button buttonEnvoyer;
        private System.Windows.Forms.GroupBox utilisateurGroup;
        private System.Windows.Forms.Label donneeNumTel;
        private System.Windows.Forms.Label affStatut;
        private System.Windows.Forms.Label affNumTel;
    }
}

