unit U_DM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, ShellApi,
  FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, Inifiles, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDM = class(TDataModule)
    conexao: TFDConnection;
    fdqinsert: TFDQuery;
    FDQconsulta: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses
  Vcl.Forms;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
var    database_local:String;
begin

                database_local:= ExtractFilePath(Application.ExeName)+'\usuarios.db';

                dm.conexao.Params.DriverID:='SQlite';
                dm.conexao.Params.Database:=database_local;
                dm.conexao.Connected:=true;

end;

end.
