unit CadCliente.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.Mask, CadCliente.DAO.DM, frxClass, frxDBSet;

type
  TformPrincipal = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    editNomePesquisa: TEdit;
    btnPesquisar: TButton;
    Label1: TLabel;
    editNome: TEdit;
    Label2: TLabel;
    editEndereco: TEdit;
    Label3: TLabel;
    editNumero: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    editBairro: TEdit;
    Label6: TLabel;
    editCidade: TEdit;
    Label7: TLabel;
    editUf: TEdit;
    Label8: TLabel;
    GroupBox3: TGroupBox;
    rdMasculino: TRadioButton;
    rdFeminino: TRadioButton;
    Label9: TLabel;
    editCep: TMaskEdit;
    btnNovo: TButton;
    btnSalvar: TButton;
    btnCancelar: TButton;
    btnDeletar: TButton;
    cbProfissao: TDBLookupComboBox;
    btnImprimir: TButton;
    btnImprimirDados: TButton;
    lblCod: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnImprimirDadosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formPrincipal: TformPrincipal;

implementation

uses
  CadCliente.Model.Classe.BancoConfig, CadCliente.Controller.Classe.Pessoa;

{$R *.dfm}

procedure TformPrincipal.btnCancelarClick(Sender: TObject);
var
  Pessoa: TPessoa;
begin
  Pessoa:= TPessoa.Create;
  try
    Pessoa.Cancelar;
  finally
    Pessoa.Free;
  end;
end;

procedure TformPrincipal.btnDeletarClick(Sender: TObject);
var
  Pessoa: TPessoa;

begin
    if lblCod.Caption = '0' then
    begin
      ShowMessage('Nenhum registro selecionado!');
    end
    else
    begin
      if Application.MessageBox('Deseja realmente deletar o registro?','Atenção!', MB_ICONQUESTION+MB_YESNO ) = mrYes then
      begin
        Pessoa:= TPessoa.Create;
        try
          Pessoa.Deletar(DBGrid1.DataSource.DataSet.FieldByName('Cod').AsString);
        finally
          Pessoa.Free;
        end;
      end;
    end;


end;

procedure TformPrincipal.btnImprimirClick(Sender: TObject);
var
  Pessoa: TPessoa;
begin
  Pessoa:= TPessoa.Create;
  try
    Pessoa.RelatorioBusca;
  finally
    Pessoa.Free;
  end;
end;

procedure TformPrincipal.btnImprimirDadosClick(Sender: TObject);
var
  Pessoa: TPessoa;

begin
    if lblCod.Caption = '0' then
    begin
      ShowMessage('Nenhum registro selecionado!');
    end
    else
    begin
        Pessoa:= TPessoa.Create;
      try
        Pessoa.RelatorioDadosDaPessoa(DBGrid1.DataSource.DataSet.FieldByName('Cod').AsString);
      finally
         Pessoa.Free;
      end;
    end;
end;

procedure TformPrincipal.btnNovoClick(Sender: TObject);
var
  Pessoa: TPessoa;
begin
  Pessoa:= TPessoa.Create;
  try
    Pessoa.NovoCadastro;
  finally
    Pessoa.Free;
  end;
end;

procedure TformPrincipal.btnPesquisarClick(Sender: TObject);
var
  Pessoa: TPessoa;
begin
  Pessoa:= TPessoa.Create;
  try
    Pessoa.PesquisarPessoa(editNomePesquisa.Text);
  finally
    Pessoa.Free;
  end;
end;

procedure TformPrincipal.btnSalvarClick(Sender: TObject);
var
 Cod: string;
 Pessoa: TPessoa;
begin
  cod := lblCod.Caption;
  Pessoa:= TPessoa.Create;
  try
    Pessoa.InserirDados(Cod);
 finally
    Pessoa.Free;
  end;
end;

procedure TformPrincipal.DBGrid1CellClick(Column: TColumn);
var
  Pessoa: TPessoa;
begin
  Pessoa:= TPessoa.Create;
  try
    Pessoa.ExibirDados;
  finally
    Pessoa.Free;
  end;
end;

procedure TformPrincipal.FormCreate(Sender: TObject);
  var
   ConfigBanco: TBancoConfig;
begin
   ConfigBanco := TBancoConfig.Create;
   try
      ConfigBanco.VerificarIni;
   finally
      ConfigBanco.Free;
   end;
end;

end.
