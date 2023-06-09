unit CadCliente.Model.Classe.BancoConfig;

interface
  uses
    IniFiles,System.SysUtils, Vcl.Forms,
    Vcl.Dialogs, CadCliente.DAO.DM, CadCliente.View.ConfigBanco;
  type
    TBancoConfig = class
      //fun��es para setar configura��o de banco de dados
    public
      procedure CriarIni(Nome, Local: string);
      Procedure LerIni;
      procedure VerificarIni;
      procedure ChamarTelaDeCriacaoIni;
    end;

implementation


{ TBancoConfig }

procedure TBancoConfig.ChamarTelaDeCriacaoIni;
var
  TelaConfigBanco: TformConfigBanco;
begin
  TelaConfigBanco:= TformConfigBanco.Create(nil);
  try
    TelaConfigBanco.ShowModal;
  finally
    TelaConfigBanco.Free;
  end;
end;


procedure TBancoConfig.CriarIni(Nome, Local: string);
  var
  //Objeto vai criar o arquivo Ini
  IniFile: TIniFile;
  IniNome: String;
begin
  //Parametro para cira��o do arquivo ini local (no caso o local
  //vai ser a pasta onde esta o exe) mais nome
  IniNome := ExtractFilePath(Application.ExeName) + 'base.ini';
  IniFile := TIniFile.Create(IniNome);
  try
    //Escrevendo nas linhas do ini
    IniFile.WriteString('Configuracoes', 'Nome do Banco ', Nome);
    IniFile.WriteString('Configuracoes', 'Local ', Local);
  finally

    IniFile.Free;
  end;
  showmessage('Banco configurado!');
end;

procedure TBancoConfig.LerIni;
  var
  IniFile: TIniFile;
  NomeBanco: string;
  LocalBanco: string;
begin
  DM.Conexao.Connected := False;
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'base.ini');
  try

    //Lendo dados do arquivo base.ini
    Nomebanco := IniFile.ReadString('Configuracoes', 'Nome do Banco ','caiquedb');
    LocalBanco  := IniFile.ReadString('Configuracoes', 'Local','localhost');

    //Alterando parametros do componente TFDConection
    DM.Conexao.Params.Values['Database'] := NomeBanco;
    DM.Conexao.Params.Values['Server'] := LocalBanco;
    DM.Conexao.Connected := True;

    //Ajusta o nome da tabela no componente TDFTable
    Dm.tbPessoa.TableName :=  NomeBanco + '.pessoa';
    Dm.tbProfissoes.TableName :=  NomeBanco + '.profissoes';

  finally
    IniFile.Free;
  end;



end;

procedure TBancoConfig.VerificarIni;
begin
    //Chamando a fun��o de cria��o base.ini caso ele n�o exista
  if not FileExists(ExtractFilePath(ParamStr(0)) + 'base.ini') then
  begin
    showmessage('N�o existe Banco de Dados configurado!');
    ChamarTelaDeCriacaoIni;
  end;
end;

end.
