#define AppName "ShareXYZ"
#define AppFilename "ShareXYZ.exe"
#define AppParentDirectory "..\ShareXYZ\bin\Release"
#define AppPath AppParentDirectory + "\" + AppFilename
#dim Version[4]
#expr ParseVersion(AppPath, Version[0], Version[1], Version[2], Version[3])
#define AppVersion Str(Version[0]) + "." + Str(Version[1]) + "." + Str(Version[2])
#define AppPublisher "ShareXYZ Team"
#define AppId "09949CF0-52B9-11E5-B970-0800200C9A66"

[Setup]
AppCopyright=Copyright (c) 2007-2015 {#AppPublisher}
AppId={#AppId}
AppMutex={#AppId}
AppName={#AppName}
AppPublisher={#AppPublisher}
AppPublisherURL=https://getShareXYZ.com
AppSupportURL=https://github.com/ShareXYZ/ShareXYZ/issues
AppUpdatesURL=https://github.com/ShareXYZ/ShareXYZ/releases
AppVerName={#AppName} {#AppVersion}
AppVersion={#AppVersion}
ArchitecturesAllowed=x86 x64 ia64
ArchitecturesInstallIn64BitMode=x64 ia64
DefaultDirName={pf}\{#AppName}
DefaultGroupName={#AppName}
DirExistsWarning=no
DisableProgramGroupPage=yes
LicenseFile=..\LICENSE.txt
MinVersion=0,5.01.2600
OutputBaseFilename={#AppName}-{#AppVersion}-setup
OutputDir=Output\
PrivilegesRequired=none
ShowLanguageDialog=no
UninstallDisplayIcon={app}\{#AppFilename}
UninstallDisplayName={#AppName}
VersionInfoCompany={#AppPublisher}
VersionInfoTextVersion={#AppVersion}
VersionInfoVersion={#AppVersion}
WizardImageBackColor=clWhite
WizardImageFile=WizardImageFile.bmp
WizardImageStretch=no
WizardSmallImageFile=WizardSmallImageFile.bmp

[Languages]
Name: "en"; MessagesFile: "compiler:Default.isl"
Name: "de"; MessagesFile: "compiler:Languages\German.isl"

[Tasks]
Name: "CreateDesktopIcon"; Description: "Create a desktop shortcut"; GroupDescription: "Additional shortcuts:"
Name: "CreateSendToIcon"; Description: "Create a send to shortcut"; GroupDescription: "Additional shortcuts:"
Name: "CreateQuickLaunchIcon"; Description: "Create a quick launch shortcut"; GroupDescription: "Additional shortcuts:"; OnlyBelowVersion: 0,6.1
Name: "CreateStartupIcon"; Description: "Launch {#AppName} automatically at Windows startup"; GroupDescription: "Other tasks:"

[Files]
Source: "{#AppParentDirectory}\ShareXYZ.exe"; DestDir: {app}; Flags: ignoreversion
Source: "{#AppParentDirectory}\ShareXYZ.exe.config"; DestDir: {app}; Flags: ignoreversion
Source: "{#AppParentDirectory}\*.dll"; DestDir: {app}; Flags: ignoreversion
Source: "{#AppParentDirectory}\*.css"; DestDir: {app}; Flags: ignoreversion
Source: "{#AppParentDirectory}\*.txt"; DestDir: {app}; Flags: ignoreversion
Source: "Output\Recorder-devices-setup.exe"; DestDir: {app}; Flags: ignoreversion

[Icons]
Name: "{group}\{#AppName}"; Filename: "{app}\{#AppFilename}"; WorkingDir: "{app}"
Name: "{group}\{cm:UninstallProgram,{#AppName}}"; Filename: "{uninstallexe}"; WorkingDir: "{app}"
Name: "{userdesktop}\{#AppName}"; Filename: "{app}\{#AppFilename}"; WorkingDir: "{app}"; Tasks: CreateDesktopIcon; Check: not DesktopIconExists
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\{#AppName}"; Filename: "{app}\{#AppFilename}"; WorkingDir: "{app}"; Tasks: CreateQuickLaunchIcon
Name: "{sendto}\{#AppName}"; Filename: "{app}\{#AppFilename}"; WorkingDir: "{app}"; Tasks: CreateSendToIcon
Name: "{userstartup}\{#AppName}"; Filename: "{app}\{#AppFilename}"; WorkingDir: "{app}"; Parameters: "-silent"; Tasks: CreateStartupIcon

[Run]
Filename: "{app}\{#AppFilename}"; Description: "{cm:LaunchProgram,{#AppName}}"; Flags: nowait postinstall

[UninstallRun]
Filename: regsvr32; WorkingDir: {app}; Parameters: "/s /u screen-capture-recorder.dll"; Check: not IsWin64
Filename: regsvr32; WorkingDir: {app}; Parameters: "/s /u screen-capture-recorder-x64.dll"; Check: IsWin64
Filename: regsvr32; WorkingDir: {app}; Parameters: "/s /u audio_sniffer.dll"; Check: not IsWin64
Filename: regsvr32; WorkingDir: {app}; Parameters: "/s /u audio_sniffer-x64.dll"; Check: IsWin64

[Registry]
Root: "HKCU"; Subkey: "Software\Classes\*\shell\{#AppName}"; Flags: dontcreatekey uninsdeletekey
Root: "HKCU"; Subkey: "Software\Classes\Directory\shell\{#AppName}"; Flags: dontcreatekey uninsdeletekey
Root: "HKCU"; Subkey: "Software\Classes\Folder\shell\{#AppName}"; Flags: dontcreatekey uninsdeletekey

[Code]
#include "Scripts\products.iss"
#include "Scripts\products\stringversion.iss"
#include "Scripts\products\winversion.iss"
#include "Scripts\products\fileversion.iss"
#include "Scripts\products\dotnetfxversion.iss"
#include "Scripts\products\msi31.iss"
#include "Scripts\products\dotnetfx40full.iss"

procedure InitializeWizard;
begin
  WizardForm.LicenseAcceptedRadio.Checked := true;
end;

function InitializeSetup(): Boolean;
begin
  initwinversion();
  msi31('3.1');
  dotnetfx40full();
  Result := true;
end;

function DesktopIconExists(): Boolean;
begin
  Result := FileExists(ExpandConstant('{userdesktop}\{#AppName}.lnk'));
end;
