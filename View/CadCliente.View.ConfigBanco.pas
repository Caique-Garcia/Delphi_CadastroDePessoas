unit CadCliente.View.ConfigBanco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TformConfigBanco = class(TForm)
    Panel1: TPanel;
    editNomeBanco: TEdit;
    Label1: TLabel;
    editLocal: TEdit;
    Label2: TLabel;
    btnSalvar: TButton;
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formConfigBanco: TformConfigBanco;

implementation

uses
  CadCliente.Model.Classe.BancoConfig;

{$R *.dfm}

procedure TformConfigBanco.btnSalvarClick(Sender: TObject);
  var
   ConfigBanco: TBancoConfig;
begin
   ConfigBanco := TBancoConfig.Create;
   try
      ConfigBanco.CriarIni(editNomeBanco.Text, editLocal.Text);
   finally
      ConfigBanco.Free;
   end;
   Self.Close;
end;

end.
