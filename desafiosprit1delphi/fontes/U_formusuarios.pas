unit U_formusuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TFormusuarios = class(TForm)
    Desafio: TPanel;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    ednome: TEdit;
    Label1: TLabel;
    edemail: TEdit;
    Label2: TLabel;
    edsenha: TEdit;
    Label3: TLabel;
    edfone: TEdit;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dsusuarios: TDataSource;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function VerificarDados:Boolean;
  end;

var
  Formusuarios: TFormusuarios;

implementation

{$R *.dfm}

uses U_DM;

function ContemMinusculo( Texto: string ):boolean;
var
  I: Integer;
begin
  Result := False;

  For I := 1 to length( Texto ) do
    If Texto[I] in ['a'..'z'] then
    begin
      result := True;
      Break;
    end;

end;

function ContemMaiusculo( Texto: string ):boolean;
var
  I: Integer;
begin
  Result := False;

  For I := 1 to length( Texto ) do
    If Texto[I] in ['A'..'Z'] then
    begin
      result := True;
      Break;
    end;

end;

function ContemNumero( Texto: string ):boolean;
var
  I: Integer;
begin
  Result := False;

  For I := 1 to length( Texto ) do
    If Texto[I] in ['0'..'9'] then
    begin
      result := True;
      Break;
    end;

end;

function ContemCaracterEspecial( Texto: string ):boolean;
var
  I: Integer;
begin
  Result := False;

  For I := 1 to length( Texto ) do
    If not (Texto[I] in ['a'..'z','A'..'Z','0'..'9']) then
    begin
      result := True;
      Break;
    end;

end;

procedure TFormusuarios.BitBtn1Click(Sender: TObject);
begin
  if Verificardados then
  begin
    with dm.fdqinsert do
    begin
      close;
      sql.clear;
      sql.Add('insert into usuario (nome,email,phone,senha) values (:nome,:email,:fone,:senha)');
      ParamByName('nome').AsString    := ednome.Text;
      ParamByName('email').AsString    := edemail.Text;
      ParamByName('fone').AsString    := edfone.Text;
      ParamByName('senha').AsString    := edsenha.Text;
      execsql;
    end;

    dm.FDQconsulta.Refresh;
  end;
end;

procedure TFormusuarios.BitBtn2Click(Sender: TObject);
begin
  CLOSE;
end;

procedure TFormusuarios.BitBtn3Click(Sender: TObject);
begin
  if edsenha.PasswordChar = #0 then
    edsenha.PasswordChar := '*'
  else
    edsenha.PasswordChar := #0;
end;

procedure TFormusuarios.FormShow(Sender: TObject);
begin
  with dm.FDQconsulta do
  begin
    close;
    sql.Clear;
    sql.Add('select * from usuario');
    open;
  end;
end;

function TFormusuarios.VerificarDados:Boolean;
begin
  Result:= false;
  if length(edemail.text)<10 then
  begin
    MessageDlg('E-mail invalido, mínimo 10 caracteres',mterror,[mbok],0);
    edemail.SetFocus;
    exit;
  end;

  if pos('@',edemail.text)<=1 then
  begin
    MessageDlg('E-mail invalido, deve haver no mínimo 1 caractere antes do @',mterror,[mbok],0);
    edemail.SetFocus;
    exit;
  end;

  if (copy(edemail.text,pos('@',edemail.text)+1,length(edemail.text))<>'capgemini.com') and (copy(edemail.text,pos('@',edemail.text)+1,length(edemail.text))<>'bradesco.com') then
  begin
    MessageDlg('E-mail invalido, os dominios capgemini.com e bradesco.com são obrigatórios',mterror,[mbok],0);
    edsenha.text:=(copy(edemail.text,pos('@',edemail.text)+1,length(edemail.text)));
    edemail.SetFocus;
    exit;
  end;

  if (pos(' ',ednome.text)=0) or (copy(ednome.Text,pos(' ',ednome.text)+1,length(ednome.text))='') then
  begin
    MessageDlg('Nome invalido, deve haver no mínimo duas palavras',mterror,[mbok],0);
    ednome.SetFocus;
    exit;
  end;

  if (length(edsenha.text)<>8) then
  begin
    MessageDlg('Senha invalida, deve conter 8 caracteres',mterror,[mbok],0);
    edsenha.SetFocus;
    exit;
  end;

  if contemminusculo(edsenha.Text)=false then
  begin
    MessageDlg('A Senha deve conter no minimo 1 caractere minusculo',mterror,[mbok],0);
    edsenha.SetFocus;
    exit;
  end;

  if contemmaiusculo(edsenha.Text)=false then
  begin
    MessageDlg('A Senha deve conter no minimo 1 caractere maiusculo',mterror,[mbok],0);
    edsenha.SetFocus;
    exit;
  end;

  if contemNumero(edsenha.Text)=false then
  begin
    MessageDlg('A Senha deve conter no minimo 1 número',mterror,[mbok],0);
    edsenha.SetFocus;
    exit;
  end;

  if ContemCaracterEspecial(edsenha.Text)=false then
  begin
    MessageDlg('A Senha deve conter no minimo 1 caractere especial',mterror,[mbok],0);
    edsenha.SetFocus;
    exit;
  end;


  if (length(edfone.text)<11) or (length(edfone.text)>12)then
  begin
    MessageDlg('Telefone invalido, mínimo 11 caracteres máximo 12.',mterror,[mbok],0);
    edfone.SetFocus;
    exit;
  end;

  if (contemminusculo(edfone.Text)) or (contemmaiusculo(edfone.Text)) then
  begin
    MessageDlg('Telefone deve conter apenas números.',mterror,[mbok],0);
    edfone.SetFocus;
    exit;
  end;


  Result:= true;

end;



end.
