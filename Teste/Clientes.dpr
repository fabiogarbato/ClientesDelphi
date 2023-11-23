program Clientes;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {frmMenuPrincipal},
  uDtmConexao in 'DataModule\uDtmConexao.pas' {dtmConexao: TDataModule},
  uFrmHeranca in 'Heran�a\uFrmHeranca.pas' {frmHeranca},
  uEnum in 'Heran�a\uEnum.pas',
  cCadastroCliente in 'Cadastros\Clientes\cCadastroCliente.pas',
  cBuscaCEP in 'API\CEP\cBuscaCEP.pas',
  cCadastroUsuarios in 'Cadastros\Usuarios\cCadastroUsuarios.pas',
  uLogin in 'Login\uLogin.pas' {frmLogin},
  uCadastroCliente in 'Cadastros\Clientes\uCadastroCliente.pas' {frmHeranca1},
  uCadastroUsuarios in 'Cadastros\Usuarios\uCadastroUsuarios.pas' {frmHeranca2},
  uFrmLogCliente in 'LOG\uFrmLogCliente.pas' {frmHeranca3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMenuPrincipal, frmMenuPrincipal);
  Application.Run;
end.
