program CadCliente;

uses
  Vcl.Forms,
  CadCliente.View.Principal in 'View\CadCliente.View.Principal.pas' {formPrincipal},
  CadCliente.DAO.DM in 'DAO\CadCliente.DAO.DM.pas' {DM: TDataModule},
  CadCliente.View.ConfigBanco in 'View\CadCliente.View.ConfigBanco.pas' {formConfigBanco},
  CadCliente.Controller.Classe.Pessoa in 'Controller\CadCliente.Controller.Classe.Pessoa.pas',
  CadCliente.Model.Classe.BancoConfig in 'Model\CadCliente.Model.Classe.BancoConfig.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformPrincipal, formPrincipal);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TformConfigBanco, formConfigBanco);
  Application.Run;
end.
