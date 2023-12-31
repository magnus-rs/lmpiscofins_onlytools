unit U_Corre��es;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.UITypes, ACBrEPCBlocos, Vcl.StdCtrls;

type
  TFRM_Correcoes = class(TForm)
    GroupBox1: TGroupBox;
    CBNatReceita: TCheckBox;
    CBAliquotas: TCheckBox;
    BTNCorrecao: TButton;
    procedure BTNCorrecaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRM_Correcoes: TFRM_Correcoes;

implementation

{$R *.dfm}

uses U_Principal;

procedure TFRM_Correcoes.BTNCorrecaoClick(Sender: TObject);
var
i,j,k,l :integer;
cst04_01, cst04_02: Double;
begin
 cst04_01 := 0.00;
 cst04_02 := 0.00;
 if CBNatReceita.Checked then begin
  with FRM_Principal.SpedPC.Bloco_C.RegistroC001 do begin
   for i := 0 to RegistroC010.Count -1 do begin
    l:=i;
    with RegistroC010.Items[i] do begin
     for j := 0 to RegistroC100.Count -1 do begin
      with RegistroC100.Items[j] do begin
       if (IND_EMIT = edEmissaoPropria) then begin
        for k := 0 to RegistroC170.Count -1 do begin
         with RegistroC170.Items[k] do begin
          if (CST_PIS = stpisMonofaticaAliquotaZero) then begin
           if l = 0 then
            cst04_01 := cst04_01 + VL_ITEM
           else
            cst04_02 := cst04_02 + VL_ITEM;
          end;
         end;
        end;
        for k := 0 to RegistroC175.Count -1 do begin
         with RegistroC175.Items[k] do begin
          if (CST_PIS = stpisMonofaticaAliquotaZero) then begin
           if l = 0 then
            cst04_01 := cst04_01 + VL_OPR
           else
            cst04_02 := cst04_02 + VL_OPR;
          end;
         end;
        end;
       end;
      end;
     end;
    end;
   end;
  end;
 end;
// Exclui os Registro M400 e M800 e lan�a os valores separados por empresa.
 FRM_Principal.SpedPC.Bloco_M.LimpaRegistros;
 for l := 1 to 2 do begin
  with FRM_Principal.SpedPC.Bloco_M.RegistroM400New do begin
   CST_PIS := stpisMonofaticaAliquotaZero;
   if l < 2 then begin
    VL_TOT_REC := cst04_01;
    COD_CTA := '3.01.01.02.003';
   end
   else begin
    VL_TOT_REC := cst04_02;
    COD_CTA := '3.01.01.02.002';
   end;
  end;
  with FRM_Principal.SpedPC.Bloco_M.RegistroM800New do begin
   CST_COFINS := stcofinsMonofaticaAliquotaZero;
   if l < 2 then begin
    VL_TOT_REC := cst04_01;
    COD_CTA := '3.01.01.02.003';
   end
   else begin
     VL_TOT_REC := cst04_02;
     COD_CTA := '3.01.01.02.002';
   end;
  end;
 end;

// Corrige o problema de arredondamento das aliquotas de pis e cofins.
 if CBAliquotas.Checked then begin
  with FRM_Principal.SpedPC.Bloco_C do begin
   with RegistroC001 do begin
    for i := 0 to RegistroC010.Count -1 do begin
     with RegistroC010.Items[i] do begin
      for j := 0 to RegistroC100.Count-1 do begin
       with RegistroC100.Items[j] do begin
        for k := 0 to RegistroC170.Count -1 do begin
         with RegistroC170.Items[k] do begin
          if (ALIQ_PIS_PERC = 0.2) then begin
           ALIQ_PIS_PERC := 0.1980;
           ALIQ_COFINS_PERC := 0.9120;
          end;
         end;
        end;
       end;
      end;
     end;
    end;
   end;
  end;
 end;
 MessageDlg('Informa��es Atualizadas!!!!',mtInformation,[mbok],0);
 Close;
end;

end.
