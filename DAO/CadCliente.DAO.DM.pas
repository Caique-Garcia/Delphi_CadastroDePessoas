unit CadCliente.DAO.DM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, frxClass, frxDBSet;

type
  TDM = class(TDataModule)
    Conexao: TFDConnection;
    tbPessoa: TFDTable;
    tbProfissoes: TFDTable;
    tbPessoacod: TFDAutoIncField;
    tbPessoanome: TStringField;
    tbPessoaendereco: TStringField;
    tbPessoanumero: TIntegerField;
    tbPessoabairro: TStringField;
    tbPessoacidade: TStringField;
    tbPessoacep: TStringField;
    tbPessoauf: TStringField;
    tbPessoaprofissao: TIntegerField;
    tbPessoasexo: TStringField;
    tbProfissoesid: TFDAutoIncField;
    tbProfissoesnomeProfissao: TStringField;
    sqlConsulta: TFDQuery;
    dsProfissoes: TDataSource;
    dsPessoa: TDataSource;
    tbPessoaNomeProfissao: TStringField;
    frxReLCadastro: TfrxReport;
    frxRelSQLConsulta: TfrxDBDataset;
    sqlDadosPessoa: TFDQuery;
    frxDsDadosDaPessoa: TfrxDBDataset;
    frxRelDados: TfrxReport;
    dsPessoaProf: TDataSource;
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
  CadCliente.Model.Classe.BancoConfig;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
  var
   ConfigBanco: TBancoConfig;
begin
   ConfigBanco := TBancoConfig.Create;
   try
      ConfigBanco.LerIni;
   finally
      ConfigBanco.Free;
   end;

   if not tbPessoa.Active then
      tbPessoa.Open;

   if not tbProfissoes.Active then
      tbProfissoes.Open;
end;

end.
