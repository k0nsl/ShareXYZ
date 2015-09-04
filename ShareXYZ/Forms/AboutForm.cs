#region License Information (GPL v3)

/*
    ShareXYZ - A program that allows you to take screenshots and share any file type

    Copyright (c) 2015 ShareXYZ Team
    Copyright (c) 2007-2015 ShareX Team

    This program is free software; you can redistribute it and/or
    modify it under the terms of the GNU General Public License
    as published by the Free Software Foundation; either version 2
    of the License, or (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

    Optionally you can also view the license at <http://www.gnu.org/licenses/>.
*/

#endregion License Information (GPL v3)

using ShareXYZ.HelpersLib;
using ShareXYZ.Properties;
using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Windows.Forms;

namespace ShareXYZ
{
    public partial class AboutForm : BaseForm
    {
        public AboutForm()
        {
            InitializeComponent();
            lblProductName.Text = Program.Title;

            rtbShareXInfo.AddContextMenu();
            rtbCredits.AddContextMenu();

            uclUpdate.CheckUpdate(TaskHelpers.CheckUpdate);

            lblTeam.Text = "Original ShareX Team:";
            lblBerk.Text = "Jaex (Berk)";
            lblMike.Text = "mcored (Michael Delpach)";

            rtbShareXInfo.Text = string.Format(@"{0}: {1}
{2}: {3}
{4}: {5}", Resources.AboutForm_AboutForm_Website, Links.URL_WEBSITE, Resources.AboutForm_AboutForm_Project_page, Links.URL_PROJECT, Resources.AboutForm_AboutForm_Issues, Links.URL_ISSUES);

            rtbCredits.Text = string.Format(@"{0}:

Mega, Gist and Jira support: https://github.com/gpailler
Web site: https://github.com/dmxt
MediaCrush (Imgrush) support: https://github.com/SirCmpwn
Amazon S3 and DreamObjects support: https://github.com/alanedwardes
Gfycat support: https://github.com/Dinnerbone
Copy support: https://github.com/KamilKZ
AdFly support: https://github.com/LRNAB
MediaFire support: https://github.com/michalx2
Pushbullet support: https://github.com/BallisticLingonberries
Lambda support: https://github.com/mstojcevich
VideoBin support: https://github.com/corey-/
Up1 support: https://github.com/Upload
LnkU, CoinURL, QRnet, VURL, 2gp, SomeImage, OneTimeSecret, Polr support: https://github.com/DanielMcAssey

{2}:

Greenshot Image Editor: https://bitbucket.org/greenshot/greenshot
Json.NET: https://github.com/JamesNK/Newtonsoft.Json
SSH.NET: https://sshnet.codeplex.com
Icons: http://p.yusukekamiyamane.com
ImageListView: https://github.com/oozcitak/imagelistview
FFmpeg: http://www.ffmpeg.org
FFmpeg Windows builds: http://ffmpeg.zeranoe.com/builds
7-Zip: http://www.7-zip.org
SevenZipSharp: https://sevenzipsharp.codeplex.com
DirectShow video and audio device: https://github.com/rdp/screen-capture-recorder-to-video-windows-free
QrCode.Net: https://qrcodenet.codeplex.com
System.Net.FtpClient: https://netftp.codeplex.com
ResX Resource Manager: https://resxresourcemanager.codeplex.com
AWSSDK: http://aws.amazon.com/sdk-for-net/
CLR Security: http://clrsecurity.codeplex.com

Copyright (c) 2015 ShareXYZ Team
Copyright (c) 2007-2015 ShareX Team", Resources.AboutForm_AboutForm_Contributors, Resources.AboutForm_AboutForm_Translators, Resources.AboutForm_AboutForm_External_libraries);
        }

        private void AboutForm_Shown(object sender, EventArgs e)
        {
            this.ShowActivate();
        }

        private void lblProductName_Click(object sender, EventArgs e)
        {
            URLHelpers.OpenURL(Links.URL_VERSION_HISTORY);
        }

        private void pbBerkURL_Click(object sender, EventArgs e)
        {
            URLHelpers.OpenURL(Links.URL_BERK);
        }

        private void pbMikeURL_Click(object sender, EventArgs e)
        {
            URLHelpers.OpenURL(Links.URL_MIKE);
        }

        private void rtb_LinkClicked(object sender, LinkClickedEventArgs e)
        {
            URLHelpers.OpenURL(e.LinkText);
        }
    }
}