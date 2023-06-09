unit CadCliente.Controller.Classe.Pessoa;

interface

type

  TPessoa = class
    //Fun��es cadastro, altera��o e exibi��o dos dados
    procedure PesquisarPessoa(Nome: string);
    procedure NovoCadastro;
    procedure SalvarCadastro;
    procedure ExibirDados;
    procedure LimparCamposFormPrincipal;
    procedure Cancelar;
    procedure Deletar(Cod: string);
    procedure InserirDados(Cod: string);
    procedure AlterarCadastroExistente(Cod: string);
    procedure RelatorioBusca;
    procedure RelatorioDadosDaPessoa(Cod: String);
  end;

implementation

uses
  CadCliente.DAO.DM, CadCliente.View.Principal, Data.DB, System.SysUtils,
  Vcl.Forms, Vcl.Dialogs;

{ TPessoa }

procedure TPessoa.AlterarCadastroExistente(Cod: string);
  var
    consulta: string;
    sexo: string;
begin
      if not DM.tbPessoa.Active then
        Dm.tbPessoa.Open;

      consulta :=  'UPDATE PESSOA SET nome = :Nome, endereco = :Endereco , numero = :Numero, bairro = :Bairro, cidade = :Cidade ,'
                    +'uf = :Uf, cep = :Cep, sexo = :Sexo  WHERE cod = :Cod';

      sexo := 'Masculino';
        if formPrincipal.rdFeminino.Checked then
          sexo := 'Feminino';

       with DM.sqlConsulta do
       begin
          sql.clear;
          sql.text := consulta;


           Params.CreateParam(FtInteger, 'Cod', ptInput);
           Params.CreateParam(ftString, 'Nome', ptInput);
           Params.CreateParam(ftString, 'Endereco', ptInput);
           Params.CreateParam(ftInteger, 'Numero', ptInput);
           Params.CreateParam(ftString, 'Bairro', ptInput);
           Params.CreateParam(ftString, 'Cep', ptInput);
           Params.CreateParam(ftString, 'Cidade', ptInput);
           Params.CreateParam(ftString, 'Uf', ptInput);
           Params.CreateParam(ftInteger, 'Profissao', ptInput);
           Params.CreateParam(ftString, 'Sexo', ptInput);
           Params.ParamByName('Cod').DataType := ftInteger;


           ParamByName('Cod').AsInteger := strToInt(cod);
           ParamByName('Nome').AsString := formPrincipal.editNome.Text;
           ParamByName('Endereco').AsString := formPrincipal.editEndereco.Text;
           ParamByName('Numero').AsInteger := StrToInt(formPrincipal.editNumero.Text);
           ParamByName('Bairro').AsString := formPrincipal.editBairro.Text;
           ParamByName('Cep').AsString := formPrincipal.editCep.Text;
           ParamByName('Cidade').AsString := formPrincipal.editCidade.Text;
           ParamByName('Uf').AsString := formPrincipal.editUf.Text;
           ParamByName('Sexo').AsString := sexo;
           ParamByName('Profissao').AsInteger := StrToInt(formPrincipal.cbProfissao.KeyValue);

           ExecSQL;

       end;


    DM.tbPessoa.Refresh;
end;

procedure TPessoa.Cancelar;
begin
   LimparCamposFormPrincipal;
   Dm.tbPessoa.Refresh;
end;

procedure TPessoa.Deletar(Cod: string);
begin
  with DM.sqlConsulta do
  begin
     Close;
      sql.Clear;
      sql.add('DELETE FROM pessoa WHERE cod = ' + cod);
      ExecSQL;
      LimparCamposFormPrincipal;
      PesquisarPessoa('');
  end;
end;

procedure TPessoa.ExibirDados;
var
  sexo: string;
begin
  if not Dm.tbPessoa.Active then
    Dm.tbPessoa.Open;

  if not Dm.tbProfissoes.Active then
    Dm.tbProfissoes.Open;


  sexo := formPrincipal.DBGrid1.DataSource.DataSet.FieldByName('Sexo').AsString;

  //Exibir dados nos campos
  formPrincipal.editNome.Text := formPrincipal.DBGrid1.DataSource.DataSet.FieldByName('Nome').AsString;
  formPrincipal.editEndereco.Text := formPrincipal.DBGrid1.DataSource.DataSet.FieldByName('Endereco').AsString;
  formPrincipal.editNumero.Text := formPrincipal.DBGrid1.DataSource.DataSet.FieldByName('Numero').AsString;
  formPrincipal.editCidade.Text := formPrincipal.DBGrid1.DataSource.DataSet.FieldByName('Cidade').AsString;
  formPrincipal.editBairro.Text := formPrincipal.DBGrid1.DataSource.DataSet.FieldByName('Bairro').AsString;
  formPrincipal.editUf.Text := formPrincipal.DBGrid1.DataSource.DataSet.FieldByName('UF').AsString;
  formPrincipal.editCep.Text := formPrincipal.DBGrid1.DataSource.DataSet.FieldByName('CEP').AsString;
  formPrincipal.lblCod.Caption := formPrincipal.DBGrid1.DataSource.DataSet.FieldByName('Cod').AsString;

  formPrincipal.rdMasculino.Checked := True;
  if sexo = 'Feminino' then
    formPrincipal.rdFeminino.Checked := True;

  formPrincipal.cbProfissao.KeyValue := formPrincipal.DBGrid1.DataSource.DataSet.FieldByName('ID').AsString;


end;

procedure TPessoa.InserirDados(Cod: string);
begin
  if StrToInt(cod) = 0 then
  begin
    SalvarCadastro;
  end
  else
  begin
    AlterarCadastroExistente(Cod);
  end;
  LimparCamposFormPrincipal;
end;

procedure TPessoa.LimparCamposFormPrincipal;
begin
   formPrincipal.lblCod.Caption := '0';
   formPrincipal.editNome.Text :='';
   formPrincipal.editEndereco.Text :='';
   formPrincipal.editNumero.Text :='';
   formPrincipal.editCidade.Text :='';
   formPrincipal.editBairro.Text :='';
   formPrincipal.editUf.Text :='';
   formPrincipal.editCep.Text :='';
end;

procedure TPessoa.NovoCadastro;
begin
    LimparCamposFormPrincipal;
    DM.tbPessoa.Open;
    formPrincipal.lblCod.Caption := '0';
end;

procedure TPessoa.PesquisarPessoa(Nome: string);
begin
   if not DM.tbPessoa.Active then
     Dm.tbPessoa.Open;



     formprincipal.DBGrid1.DataSource.DataSet := dm.sqlConsulta;
     formprincipal.DBGrid1.DataSource := dm.dsPessoa;
     DM.dsPessoa.DataSet:= DM.sqlConsulta;

   Nome:= '''%%' + formPrincipal.editNomePesquisa.Text + '%%''';
    with Dm.sqlConsulta do
    begin
      Close;
      sql.Clear;
        sql.Add('SELECT cod as COD, nome as NOME, endereco as ENDERECO, numero as NUMERO, bairro as BAIRRO,');
        sql.Add('cidade as CIDADE, cep as CEP, uf as UF, sexo as SEXO, id as ID, nomeProfissao as PROFISSAO');
        sql.Add('FROM pessoa join profissoes WHERE profissao = profissoes.id and nome like' + Nome);
        sql.Add('ORDER BY COD');
      Open;
      Refresh;
    end;
end;

procedure TPessoa.RelatorioBusca;
begin
  Dm.sqlConsulta.Open;
  Dm.tbPessoa.Open;
  Dm.tbProfissoes.Open;
  DM.frxReLCadastro.ShowReport();
end;


procedure TPessoa.RelatorioDadosDaPessoa(Cod: String);
var
  Consulta: string;
begin
  Dm.tbPessoa.Open;
  Dm.tbProfissoes.Open;
  Dm.sqlDadosPessoa.Close;
  DM.sqlDadosPessoa.Sql.Clear;

   DM.sqlDadosPessoa.sql.Add('SELECT cod as COD, nome as NOME, endereco as ENDERECO, numero as NUMERO, bairro as BAIRRO,');
   DM.sqlDadosPessoa.sql.Add('cidade as CIDADE, cep as CEP, uf as UF, sexo as SEXO, nomeProfissao as PROFISSAO');
   DM.sqlDadosPessoa.sql.Add('FROM pessoa join profissoes WHERE profissao = profissoes.id and cod = ' + cod);
   Dm.sqlDadosPessoa.Open;
   DM.frxRelDados.ShowReport();
end;

procedure TPessoa.SalvarCadastro;
var
  sexo: string;
begin
    if not DM.tbPessoa.Active then
      Dm.tbPessoa.Open;

    //Verificando qual o sexo selecionado
    sexo := 'Masculino';
    if formPrincipal.rdFeminino.Checked then
      sexo := 'Feminino';

    //Tratamento para campo UF e Nome gravar com letras maiusculas.
    formPrincipal.editUf.Text := AnsiUpperCase(formPrincipal.editUf.Text);
    formPrincipal.editNome.Text := AnsiUpperCase(formPrincipal.editNome.Text);

    //showmessage('Novo Cadastro!');
   with Dm.sqlConsulta do
    begin
       Close;
       Sql.Clear;

       Params.CreateParam(FtInteger, 'Cod', ptInput);
       Params.CreateParam(ftString, 'Nome', ptInput);
       Params.CreateParam(ftString, 'Endereco', ptInput);
       Params.CreateParam(ftInteger, 'Numero', ptInput);
       Params.CreateParam(ftString, 'Bairro', ptInput);
       Params.CreateParam(ftString, 'Cep', ptInput);
       Params.CreateParam(ftString, 'Cidade', ptInput);
       Params.CreateParam(ftString, 'Uf', ptInput);
       Params.CreateParam(ftInteger, 'Profissao', ptInput);
       Params.CreateParam(ftString, 'Sexo', ptInput);


       ParamByName('Nome').AsString := formPrincipal.editNome.Text;
       ParamByName('Endereco').AsString := formPrincipal.editEndereco.Text;
       ParamByName('Numero').AsInteger := StrToInt(formPrincipal.editNumero.Text);
       ParamByName('Bairro').AsString := formPrincipal.editBairro.Text;
       ParamByName('Cep').AsString := formPrincipal.editCep.Text;
       ParamByName('Cidade').AsString := formPrincipal.editCidade.Text;
       ParamByName('Uf').AsString := formPrincipal.editUf.Text;
       ParamByName('Sexo').AsString := sexo;
       ParamByName('Profissao').AsInteger := StrToInt(formPrincipal.cbProfissao.KeyValue);


       sql.text := 'INSERT INTO pessoa ( nome, endereco, numero, bairro, cep, cidade, uf, profissao, sexo)'
                  + 'VALUES (:Nome , :Endereco, :Numero, :Bairro, :Cep, :Cidade, :Uf, :Profissao, :sexo )';

     ExecSQL;
     DM.tbPessoa.Refresh;
    end;
end;

end.
