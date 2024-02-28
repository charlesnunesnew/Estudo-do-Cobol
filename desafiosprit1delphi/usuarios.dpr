program usuarios;

uses
  Vcl.Forms,
  U_formusuarios in 'fontes\U_formusuarios.pas' {Formusuarios},
  U_DM in 'fontes\U_DM.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormusuarios, Formusuarios);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
