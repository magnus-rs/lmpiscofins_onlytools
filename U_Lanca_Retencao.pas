unit U_Lanca_Retencao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.UITypes, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ACBrEPCBlocos, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Datasnap.DBClient, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TFRM_Lanca_Retencao = class(TForm)
    Panel2: TPanel;
    GroupBox7: TGroupBox;
    DBGrid3: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    CB_MesRef: TComboBox;
    CB_Empresa: TComboBox;
    Panel3: TPanel;
    BTN_ADDSPED: TButton;
    BTS_DELF600: TButton;
    BTN_F600: TButton;
    FDQ_Retencao: TFDQuery;
    DSF600: TDataSource;
    FDQ_Orgaos: TFDQuery;
    CDSF600: TClientDataSet;
    CDSF010: TClientDataSet;
    CDSF010CNPJ: TStringField;
    FDQ_Empresa: TFDQuery;
    FDQ_EmpresaChave: TFDAutoIncField;
    FDQ_EmpresaCNPJ: TStringField;
    FDQ_EmpresaRazao_Social: TStringField;
    FDQ_EmpresaDescricao: TStringField;
    FDQ_MesRef: TFDQuery;
    FDQ_MesRefChave: TFDAutoIncField;
    FDQ_MesRefMes_Ref: TStringField;
    CDSF600IND_NAT_RET: TStringField;
    CDSF600DT_RET: TDateTimeField;
    CDSF600VL_BC_RET: TCurrencyField;
    CDSF600VL_RET: TCurrencyField;
    CDSF600COD_REC: TStringField;
    CDSF600IND_NAT_REC: TIntegerField;
    CDSF600CNPJ: TStringField;
    CDSF600VL_RET_PIS: TCurrencyField;
    CDSF600VL_RET_COFINS: TCurrencyField;
    CDSF600IND_DEC: TIntegerField;
    FDQ_OrgaosChave: TFDAutoIncField;
    FDQ_OrgaosNome: TStringField;
    FDQ_OrgaosCNPJ: TStringField;
    FDQ_RetencaoChave: TFDAutoIncField;
    FDQ_RetencaoidMesRef: TIntegerField;
    FDQ_RetencaoidOrgao: TStringField;
    FDQ_RetencaoValorTotal: TBCDField;
    FDQ_RetencaoValorRetido: TBCDField;
    FDQ_RetencaoValorPis: TBCDField;
    FDQ_RetencaoValorCofins: TBCDField;
    procedure RestartDataSet;
    procedure InsereF600;
    procedure FormShow(Sender: TObject);
    procedure BTN_F600Click(Sender: TObject);
    procedure BTS_DELF600Click(Sender: TObject);
    procedure BTN_ADDSPEDClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRM_Lanca_Retencao: TFRM_Lanca_Retencao;

implementation

{$R *.dfm}

uses U_DataModule, U_Principal;

procedure TFRM_Lanca_Retencao.BTN_ADDSPEDClick(Sender: TObject);
begin
 InsereF600;
 BTS_DELF600.Enabled := False;
 BTN_ADDSPED.Enabled := False;
 BTN_F600.Enabled:=True;
 FormShow(Sender);
 MessageDlg('Processo de Inclus�o Conclu�do.',mtInformation, [mbok],0) ;
 Close;

end;

procedure TFRM_Lanca_Retencao.BTN_F600Click(Sender: TObject);
begin
  if FDQ_Retencao.RecordCount > 0 then begin
    FDQ_Retencao.First;
    if CDSF600.Active then
      CDSF600.EmptyDataSet;
    CDSF600.Close;
    CDSF600.CreateDataSet;
    while not FDQ_Retencao.Eof do begin
      CDSF600.Append;
      CDSF600IND_NAT_RET.Value :=  '01';
      CDSF600DT_RET.Value := FRM_Principal.SpedPC.Bloco_0.Registro0000.DT_FIN;
      CDSF600VL_BC_RET.Value := FDQ_RetencaoVALORTOTAL.Value;
      CDSF600VL_RET.Value := FDQ_RetencaoVALORRETIDO.Value;
      CDSF600COD_REC.Value := '';
      CDSF600IND_NAT_REC.Value := 1;
      CDSF600CNPJ.Value := FDQ_RetencaoIDORGAO.Value;
      CDSF600VL_RET_PIS.Value := FDQ_RetencaoVALORPIS.Value;
      CDSF600VL_RET_COFINS.Value := FDQ_RetencaoVALORCOFINS.Value;
      CDSF600IND_DEC.Value := 0;
      CDSF600.Post;
      FDQ_Retencao.Next;
    end;
    BTS_DELF600.Enabled := True;
    BTN_ADDSPED.Enabled := True;
    BTN_F600.Enabled := False;
    if MessageDlg('Deseja Inserir as Informa��es no SPED?',mtConfirmation,[mbyes,mbno],0)=mryes then begin
      InsereF600;
      BTS_DELF600.Enabled := False;
      BTN_ADDSPED.Enabled := False;
      FormShow(Sender);
      MessageDlg('Processo de Inclus�o Conclu�do.',mtInformation, [mbok],0) ;
      Close;
    end;

  end
  else
   MessageDlg('Nenhum Informa��o encontrada!',mtInformation,[mbok],0);
end;

procedure TFRM_Lanca_Retencao.BTS_DELF600Click(Sender: TObject);
begin
 if CDSF600.Active then
   CDSF600.EmptyDataSet;
 CDSF600.Close;
 CDSF600.CreateDataSet;
 BTS_DELF600.Enabled := False;
 BTN_ADDSPED.Enabled := False;
 BTN_F600.Enabled := True;
end;

procedure TFRM_Lanca_Retencao.FormShow(Sender: TObject);
begin
  CB_MesRef.Items.Clear;
  FDQ_MesRef.Refresh;
  FDQ_MesRef.First;
  while not FDQ_MesRef.Eof do begin
    CB_MesRef.Items.Add(FDQ_MesRefMes_Ref.AsString);
    FDQ_MesRef.Next;
  end;
  with FRM_Principal do begin
    CB_MesRef.Text := FormatDateTime('mmyyyy',SpedPC.Bloco_0.Registro0000.DT_INI);
  end;
  FDQ_MesRef.Locate('Mes_Ref',CB_MesRef.Text,[]);
  FDQ_Retencao.Close;
  FDQ_Retencao.SQL.Clear;
  FDQ_Retencao.SQL.Add('select * from Retencao where idMesRef = '+FDQ_MesRefChave.AsString);
  FDQ_Retencao.Open;
  CB_Empresa.Items.Clear;
  FDQ_Empresa.Refresh;
  FDQ_Empresa.First;
  while not FDQ_Empresa.eof do begin
    CB_Empresa.Items.Add(FDQ_EmpresaDescricao.AsString);
    FDQ_Empresa.Next;
  end;
  FDQ_Empresa.First;
  CB_Empresa.Text := FDQ_EmpresaDescricao.AsString;
  FDQ_Orgaos.Refresh;
  FDQ_Orgaos.First;
  RestartDataSet;
  FDQ_Empresa.Locate('Descricao',CB_Empresa.Text);
  CDSF010.Append;
  CDSF010CNPJ.Value := FDQ_EmpresaCNPJ.Value;
  CDSF010.Post;
  BTN_F600.Enabled:=True;
end;

procedure TFRM_Lanca_Retencao.InsereF600;
var
i:integer;
total_pis, total_cofins: double;
begin
  with FRM_Principal.SpedPC.Bloco_F do begin
    if RegistroF001.IND_MOV <> imComDados then
       RegistroF001.IND_MOV := imComDados;
    with RegistroF001 do begin
     if RegistroF010.Count = 0 then begin
        RegistroF010New;
        RegistroF010.Items[0].CNPJ := CDSF010CNPJ.AsString;
     end;
     with RegistroF010.Items[0] do begin
       i:=RegistroF600.Count;
       total_pis := 0.00;
       total_cofins := 0.00;
       CDSF600.First;
       while not CDSF600.Eof do begin
         RegistroF600.New;
         With RegistroF600.Items[i] do begin
           IND_NAT_RET := indRetOrgAutarquiasFundFederais;
           DT_RET      := CDSF600DT_RET.Value;
           VL_BC_RET   := CDSF600VL_BC_RET.Value;
           VL_RET      := CDSF600VL_RET.Value;
           COD_REC     := CDSF600COD_REC.AsString;
           IND_NAT_REC := inrCumulativa;
           CNPJ        := CDSF600CNPJ.AsString;
           VL_RET_PIS  := CDSF600VL_RET_PIS.Value;
           VL_RET_COFINS := CDSF600VL_RET_COFINS.Value;
           IND_DEC     := CDSF600IND_DEC.AsString;
         end;
         total_pis := (total_pis+CDSF600VL_RET_PIS.Value);
         total_cofins := (total_cofins+ CDSF600VL_RET_COFINS.Value);
         i:=(i+1);
         CDSF600.Next;
       end;
     end;
    end;
  end;
  with FRM_Principal.SpedPC.Bloco_M do begin
    if RegistroM001.IND_MOV <> imComDados then begin
       RegistroM001.IND_MOV := imComDados;
       with RegistroM001 do begin
         RegistroM200.Create;
         RegistroM200.VL_RET_CUM := total_pis;
         RegistroM600.Create;
         RegistroM600.VL_RET_CUM := total_cofins;
       end;
    end
    else begin
       with RegistroM001 do begin
         RegistroM200.VL_RET_CUM := total_pis;
         RegistroM600.VL_RET_CUM := total_cofins;
       end;
    end;
  end;
end;

procedure TFRM_Lanca_Retencao.RestartDataSet;
begin

  if CDSF010.Active then
     CDSF010.EmptyDataSet;
  CDSF010.Close;
  CDSF010.CreateDataSet;

  if CDSF600.Active then
     CDSF600.EmptyDataSet;
  CDSF600.Close;
  CDSF600.CreateDataSet;

end;

end.
