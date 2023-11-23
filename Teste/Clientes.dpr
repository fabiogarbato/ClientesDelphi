program Clientes;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {frmMenuPrincipal},
  uDtmConexao in 'DataModule\uDtmConexao.pas' {dtmConexao: TDataModule},
  uFrmHeranca in 'Herança\uFrmHeranca.pas' {frmHeranca},
  uEnum in 'Herança\uEnum.pas',
  cCadastroCliente in 'Cadastros\Clientes\cCadastroCliente.pas',
  cBuscaCEP in 'API\CEP\cBuscaCEP.pas',
  cCadastroUsuarios in 'Cadastros\Usuarios\cCadastroUsuarios.pas',
  uLogin in 'Login\uLogin.pas' {frmLogin},
  uCadastroCliente in 'Cadastros\Clientes\uCadastroCliente.pas' {frmHeranca1},
  uCadastroUsuarios in 'Cadastros\Usuarios\uCadastroUsuarios.pas' {frmHeranca2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMenuPrincipal, frmMenuPrincipal);
  Application.Run;
end.
