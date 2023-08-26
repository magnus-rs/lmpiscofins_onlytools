unit U_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.UITypes, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.IniFiles, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  ACBrSpedPisCofins, ACBrBase, ACBrEPCImportar, ACBrEFDBlocos;

type
  TFRM_Principal = class(TForm)
    MenuPrincipal: TMainMenu;
    N1: TMenuItem;
    Sair1: TMenuItem;
    StatusBar1: TStatusBar;
    ArquivoSpedContribuio1: TMenuItem;
    Importar1: TMenuItem;
    Importar2: TMenuItem;
    Procedimentos1: TMenuItem;
    Image1: TImage;
    PCImporta: TACBrSpedPCImportar;
    SpedPC: TACBrSPEDPisCofins;
    OpenDlg: TOpenDialog;
    FecharSped1: TMenuItem;
    N2: TMenuItem;
    PERSE1: TMenuItem;
    ExcluirCFOP: TMenuItem;
    Correcoes1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Importar1Click(Sender: TObject);
    procedure FecharSped1Click(Sender: TObject);
    procedure Importar2Click(Sender: TObject);
    procedure PERSE1Click(Sender: TObject);
    procedure ExcluirCFOPClick(Sender: TObject);
    procedure Correcoes1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRM_Principal: TFRM_Principal;

implementation

{$R *.dfm}

uses  U_Perse, U_LimpaCFOP, U_Correções;

procedure TFRM_Principal.Correcoes1Click(Sender: TObject);
begin
 if importar1.Enabled then
   MessageDlg('Dados não encontrados, importe o arquivo do SPED e tente novamente.',mtInformation,[mbok],0)
 else
   FRM_Correcoes.Show;
end;

procedure TFRM_Principal.ExcluirCFOPClick(Sender: TObject);
begin
 if importar1.Enabled then
   MessageDlg('Dados não encontrados, importe o arquivo do SPED e tente novamente.',mtInformation,[mbok],0)
 else
  FRM_LimpaCFOP.Show;
end;

procedure TFRM_Principal.FecharSped1Click(Sender: TObject);
begin
   If MessageDlg('Você tem certeza que deseja fechar o arquivo?',mtConfirmation,[mbyes,mbno],0)=mryes then
     begin
       FecharSped1.Enabled := False;
       Importar2.Enabled := False;
       Importar1.Enabled := True;
       SPEDPC.LimpaRegistros;
       StatusBar1.Panels[0].Text := 'Empresa: ';
       StatusBar1.Panels[1].Text := '';
       StatusBar1.Panels[2].Text := '';
       StatusBar1.Panels[3].Text := 'Arquivo: ';
     end;

end;

procedure TFRM_Principal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   If MessageDlg('Você tem certeza que deseja sair?',mtConfirmation,[mbyes,mbno],0)=mrno then
     CanClose := False;
end;

procedure TFRM_Principal.Importar1Click(Sender: TObject);
begin
  if OpenDlg.Execute then
  begin
    PCImporta.Arquivo := OpenDlg.FileName;
    PCImporta.Importar;
    StatusBar1.Panels[0].Text := 'Empresa: ' + SPEDPC.Bloco_0.Registro0000.CNPJ + ' - ' + SPEDPC.Bloco_0.Registro0000.NOME;
    StatusBar1.Panels[1].Text :=  DateToStr(SPEDPC.Bloco_0.Registro0000.DT_INI);
    StatusBar1.Panels[2].Text :=  DateToStr(SPEDPC.Bloco_0.Registro0000.DT_FIN);
    StatusBar1.Panels[3].Text := 'Arquivo: ' + ExtractFileName(PCImporta.Arquivo);
    FecharSped1.Enabled := True;
    Importar2.Enabled := True;
    Importar1.Enabled := False;

  end;
end;

procedure TFRM_Principal.Importar2Click(Sender: TObject);
begin
If MessageDlg('Comfirma a exportação do arquivo?',mtConfirmation,[mbyes,mbno],0)=mryes then
  if OpenDlg.Execute then
  begin
    SPEDPC.Arquivo := ExtractFileName(OpenDlg.FileName);
    SPEDPC.Path := ExtractFileDir(OpenDlg.FileName);
    SPEDPC.DT_INI := SPEDPC.Bloco_0.Registro0000.DT_INI;
    SPEDPC.DT_FIN := SPEDPC.Bloco_0.Registro0000.DT_FIN;
    SPEDPC.SaveFileTXT;
    FecharSped1.Enabled := True;
    Importar2.Enabled := False;
    Importar1.Enabled := False;
  end;
end;

procedure TFRM_Principal.PERSE1Click(Sender: TObject);
begin
 if importar1.Enabled then
   MessageDlg('Dados não encontrados, importe o arquivo do SPED e tente novamente.',mtInformation,[mbok],0)
 else
   FRM_Perse.Show;

end;

procedure TFRM_Principal.Sair1Click(Sender: TObject);
begin
    Close;
 end;

end.
