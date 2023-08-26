program lmpiscofins;

uses
  Vcl.Forms,
  U_Principal in 'U_Principal.pas' {FRM_Principal},
  U_Perse in 'U_Perse.pas' {FRM_Perse},
  U_LimpaCFOP in 'U_LimpaCFOP.pas' {FRM_LimpaCFOP},
  U_Correções in 'U_Correções.pas' {FRM_Correcoes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFRM_Principal, FRM_Principal);
  Application.CreateForm(TFRM_Perse, FRM_Perse);
  Application.CreateForm(TFRM_LimpaCFOP, FRM_LimpaCFOP);
  Application.CreateForm(TFRM_Correcoes, FRM_Correcoes);
  Application.Run;
end.
