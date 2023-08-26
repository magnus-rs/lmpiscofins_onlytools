﻿unit U_Energia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.UITypes, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.Menus;

type
  TFRM_Energia = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    StatusBar1: TStatusBar;
    Panel5: TPanel;
    Label1: TLabel;
    FDQ_MesRef: TFDQuery;
    FDQ_MesRefChave: TFDAutoIncField;
    FDQ_MesRefMes_Ref: TStringField;
    CB_MesRef: TComboBox;
    FDQ_empresa: TFDQuery;
    FDQ_empresaChave: TFDAutoIncField;
    FDQ_empresaCNPJ: TStringField;
    FDQ_empresaRazao_Social: TStringField;
    FDQ_empresaDescricao: TStringField;
    DS1: TDataSource;
    FDQ_Energia: TFDQuery;
    FDTransaction1: TFDTransaction;
    DS2: TDataSource;
    FDUpdateSQL1: TFDUpdateSQL;
    FDQ_EnergiaChave: TFDAutoIncField;
    FDQ_EnergiaidEstabelecimento: TIntegerField;
    FDQ_EnergiaPercentPis: TFloatField;
    FDQ_EnergiaEmpresa: TStringField;
    FDQ_EnergiaValorTotal: TBCDField;
    FDQ_EnergiaRateio: TBCDField;
    FDQ_EnergiaBaseCalculo: TBCDField;
    FDQ_EnergiaValorPis: TBCDField;
    FDQ_EnergiaPercentCofins: TFloatField;
    FDQ_EnergiaidMesRef: TIntegerField;
    FDQ_EnergiaValorCofins: TBCDField;
    procedure FormShow(Sender: TObject);
    procedure FDQ_EnergiaValorTotalChange(Sender: TField);
    procedure FDQ_EnergiaRateioChange(Sender: TField);
    procedure FDQ_EnergiaBaseCalculoChange(Sender: TField);
    procedure FDQ_EnergiaBeforePost(DataSet: TDataSet);
    procedure FDQ_EnergiaAfterPost(DataSet: TDataSet);
    procedure CB_MesRefChange(Sender: TObject);
    procedure FDQ_EnergiaAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRM_Energia: TFRM_Energia;

implementation

{$R *.dfm}

uses U_DataModule;

procedure TFRM_Energia.CB_MesRefChange(Sender: TObject);
var
  nValorTotal, nBaseTotal, nPisTotal, nCofinsTotal:double;
begin
   nValorTotal := 0.00;
   nBaseTotal  := 0.00;
   nPisTotal   := 0.00;
   nCofinsTotal:= 0.00;
   FDQ_MesRef.Locate('Mes_Ref',CB_MesRef.Text,[]);
   FDQ_Energia.Close;
   FDQ_Energia.SQL.Clear;
   FDQ_Energia.SQL.Add('select * from energia where idMesRef = '+FDQ_MesRefChave.AsString);
   FDQ_Energia.Open;
   FDQ_Energia.First;
   while not FDQ_Energia.Eof do begin
     nValorTotal := nValorTotal+FDQ_EnergiaValorTotal.Value;
     nBaseTotal := nBaseTotal+FDQ_EnergiaBaseCalculo.Value;
     nPisTotal := nPisTotal+FDQ_EnergiaValorPis.Value;
     nCofinsTotal := nCofinsTotal+FDQ_EnergiaValorCofins.Value;
     FDQ_Energia.Next;
   end;
   StatusBar1.Panels[0].Text := 'Valor Total: '+FormatFloat('R$ ##,###,##0.00', nValorTotal);
   StatusBar1.Panels[1].Text := 'Base de Cálculo: '+FormatFloat('R$ ##,###,##0.00', nBaseTotal);
   StatusBar1.Panels[2].Text := 'Total de PIS: '+FormatFloat('R$ ##,###,##0.00', nPisTotal);
   StatusBar1.Panels[3].Text := 'Total de COFINS: '+FormatFloat('R$ ##,###,##0.00', nCofinsTotal);
end;

procedure TFRM_Energia.FDQ_EnergiaAfterDelete(DataSet: TDataSet);
var
  nValorTotal, nBaseTotal, nPisTotal, nCofinsTotal:double;
begin
   nValorTotal := 0.00;
   nBaseTotal  := 0.00;
   nPisTotal   := 0.00;
   nCofinsTotal:= 0.00;
   FDQ_Energia.Refresh;
   FDQ_Energia.First;
   while not FDQ_Energia.Eof do begin
     nValorTotal := nValorTotal+FDQ_EnergiaValorTotal.Value;
     nBaseTotal := nBaseTotal+FDQ_EnergiaBaseCalculo.Value;
     nPisTotal := nPisTotal+FDQ_EnergiaValorPis.Value;
     nCofinsTotal := nCofinsTotal+FDQ_EnergiaValorCofins.Value;
     FDQ_Energia.Next;
   end;
   StatusBar1.Panels[0].Text := 'Valor Total: '+FormatFloat('R$ ##,###,##0.00', nValorTotal);
   StatusBar1.Panels[1].Text := 'Base de Cálculo: '+FormatFloat('R$ ##,###,##0.00', nBaseTotal);
   StatusBar1.Panels[2].Text := 'Total de PIS: '+FormatFloat('R$ ##,###,##0.00', nPisTotal);
   StatusBar1.Panels[3].Text := 'Total de COFINS: '+FormatFloat('R$ ##,###,##0.00', nCofinsTotal);
end;

procedure TFRM_Energia.FDQ_EnergiaAfterPost(DataSet: TDataSet);
var
  nValorTotal, nBaseTotal, nPisTotal, nCofinsTotal:double;
begin
   nValorTotal := 0.00;
   nBaseTotal  := 0.00;
   nPisTotal   := 0.00;
   nCofinsTotal:= 0.00;
   FDQ_Energia.Refresh;
   FDQ_Energia.First;
   while not FDQ_Energia.Eof do begin
     nValorTotal := nValorTotal+FDQ_EnergiaValorTotal.Value;
     nBaseTotal := nBaseTotal+FDQ_EnergiaBaseCalculo.Value;
     nPisTotal := nPisTotal+FDQ_EnergiaValorPis.Value;
     nCofinsTotal := nCofinsTotal+FDQ_EnergiaValorCofins.Value;
     FDQ_Energia.Next;
   end;
   StatusBar1.Panels[0].Text := 'Valor Total: '+FormatFloat('R$ ##,###,##0.00', nValorTotal);
   StatusBar1.Panels[1].Text := 'Base de Cálculo: '+FormatFloat('R$ ##,###,##0.00', nBaseTotal);
   StatusBar1.Panels[2].Text := 'Total de PIS: '+FormatFloat('R$ ##,###,##0.00', nPisTotal);
   StatusBar1.Panels[3].Text := 'Total de COFINS: '+FormatFloat('R$ ##,###,##0.00', nCofinsTotal);
end;

procedure TFRM_Energia.FDQ_EnergiaBaseCalculoChange(Sender: TField);
begin
   with FDQ_Energia do begin
      if (FDQ_EnergiaValorTotal.Value<>0) and (FDQ_EnergiaRateio.Value<>0) then begin
        FDQ_EnergiaPercentPis.Value := 1.65;
        FDQ_EnergiaPercentCofins.value := 7.6;
        FDQ_EnergiaValorPis.Value := (FDQ_EnergiaBaseCalculo.Value*FDQ_EnergiaPercentPis.Value)/100;
        FDQ_EnergiaValorCofins.Value := (FDQ_EnergiaBaseCalculo.Value*FDQ_EnergiaPercentCofins.Value)/100;
      end;
   end;
end;

procedure TFRM_Energia.FDQ_EnergiaBeforePost(DataSet: TDataSet);
begin
  FDQ_MesRef.Locate('Mes_Ref',CB_MesRef.Text,[]);
  FDQ_EnergiaidMesRef.Value := FDQ_MesRefChave.Value;
end;

procedure TFRM_Energia.FDQ_EnergiaRateioChange(Sender: TField);
begin
  if FDQ_EnergiaValorTotal.Value<>0 then
    FDQ_EnergiaBaseCalculo.Value := (FDQ_EnergiaValorTotal.Value*FDQ_EnergiaRateio.Value)/100
  else
    FDQ_EnergiaBaseCalculo.Clear;
end;

procedure TFRM_Energia.FDQ_EnergiaValorTotalChange(Sender: TField);
begin
  if FDQ_EnergiaRateio.Value<>0 then
    FDQ_EnergiaBaseCalculo.Value := (FDQ_EnergiaValorTotal.Value*FDQ_EnergiaRateio.Value)/100
  Else
    FDQ_EnergiaBaseCalculo.Clear;
end;

procedure TFRM_Energia.FormShow(Sender: TObject);
var
  nValorTotal, nBaseTotal, nPisTotal, nCofinsTotal:double;
begin
  nValorTotal := 0.00;
  nBaseTotal  := 0.00;
  nPisTotal   := 0.00;
  nCofinsTotal:= 0.00;
   CB_MesRef.Items.Clear;
   FDQ_MesRef.Refresh;
   FDQ_MesRef.First;
   while not FDQ_Mesref.Eof do begin
     CB_MesRef.Items.Add(FDQ_MesRefMes_Ref.AsString);
     FDQ_MesRef.Next;
   end;
   CB_MesRef.ItemIndex := (CB_MesRef.Items.Count-1);
   FDQ_MesRef.Locate('Mes_Ref',CB_MesRef.Text,[]);
   FDQ_Energia.Close;
   FDQ_Energia.SQL.Clear;
   FDQ_Energia.SQL.Add('select * from energia where idMesRef = '+FDQ_MesRefChave.AsString);
   FDQ_Energia.Open;
   FDQ_Energia.First;
   while not FDQ_Energia.Eof do begin
     nValorTotal := nValorTotal+FDQ_EnergiaValorTotal.Value;
     nBaseTotal := nBaseTotal+FDQ_EnergiaBaseCalculo.Value;
     nPisTotal := nPisTotal+FDQ_EnergiaValorPis.Value;
     nCofinsTotal := nCofinsTotal+FDQ_EnergiaValorCofins.Value;
     FDQ_Energia.Next;
   end;
   StatusBar1.Panels[0].Text := 'Valor Total: '+FormatFloat('R$ ##,###,##0.00', nValorTotal);
   StatusBar1.Panels[1].Text := 'Base de Cálculo: '+FormatFloat('R$ ##,###,##0.00', nBaseTotal);
   StatusBar1.Panels[2].Text := 'Total de PIS: '+FormatFloat('R$ ##,###,##0.00', nPisTotal);
   StatusBar1.Panels[3].Text := 'Total de COFINS: '+FormatFloat('R$ ##,###,##0.00', nCofinsTotal);

end;

end.
