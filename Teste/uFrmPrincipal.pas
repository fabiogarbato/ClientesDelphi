unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uDtmConexao, ADODB, IniFiles,
  Vcl.StdCtrls;

type
  TfrmMenuPrincipal = class(TForm)
    Label1: TLabel;
    btnClientes: TButton;
    btnUsuario: TButton;
    procedure menuFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure menuClientesClick(Sender: TObject);
    procedure menuUsuarioClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnClientesClick(Sender: TObject);
    procedure btnUsuarioClick(Sender: TObject);
  private
    procedure CriarConexaoComBanco;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenuPrincipal: TfrmMenuPrincipal;

implementation

{$R *.dfm}

uses
  uCadastroCliente, uCadastroUsuarios, uLogin;

procedure TfrmMenuPrincipal.btnClientesClick(Sender: TObject);
begin
  frmCadastroClientes := TfrmCadastroCliente.Create(self);
  frmCadastroClientes.ShowModal;
  frmCadastroClientes.Release;
end;

procedure TfrmMenuPrincipal.btnUsuarioClick(Sender: TObject);
begin
  frmCadastroUsuarios := TfrmCadastroUsuarios.Create(self);
  frmCadastroUsuarios.ShowModal;
  frmCadastroUsuarios.Release;
end;

procedure TfrmMenuPrincipal.CriarConexaoComBanco;
  var
  arquivoINI: TIniFile;
  provider, integratedSecurity, persistSecurityInfo, initialCatalog, dataSource : string;
begin
  dtmConexao := TdtmConexao.Create(Self);
  try
    arquivoINI := TIniFile.Create('C:\Users\fabio\OneDrive\Área de Trabalho\Geral\Pessoal\TEx\Servidor\configuracao.ini');
    provider := arquivoINI.ReadString('BANCO', 'Provider', 'Erro ao ler o valor');
    integratedSecurity := arquivoINI.ReadString('BANCO', 'Integrated Security', 'Erro ao ler o valor');
    persistSecurityInfo := arquivoINI.ReadString('BANCO', 'Persist Security Info', 'Erro ao ler o valor');
    initialCatalog := arquivoINI.ReadString('BANCO', 'Initial Catalog', 'Erro ao ler o valor');
    dataSource := arquivoINI.ReadString('BANCO', 'Data Source', 'Erro ao ler o valor');
    arquivoINI.Free;

    dtmConexao.conexaoDB.ConnectionString :=
      'Provider=' + provider +              // Fornecedor OLE DB para SQL Server
      'Integrated Security=' + integratedSecurity +        // Autenticação integrada do Windows
      'Persist Security Info=' + persistSecurityInfo +  // Não persistir informações de segurança
      'Initial Catalog=' + initialCatalog + // Nome do banco de dados
      'Data Source=' + dataSource; // Nome do servidor SQL Server

    dtmConexao.conexaoDB.Open;

  except
    on E: Exception do
    begin
      ShowMessage('Erro de conexão: ' + E.Message);
      dtmConexao.conexaoDB.Free;
    end;
  end;
end;

procedure TfrmMenuPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(dtmConexao);
end;

procedure TfrmMenuPrincipal.FormCreate(Sender: TObject);
begin
  CriarConexaoComBanco;
end;

procedure TfrmMenuPrincipal.FormShow(Sender: TObject);
begin
  frmLogin := TfrmLogin.Create(Self);
  frmLogin.ShowModal;
  frmLogin.Release;
end;

procedure TfrmMenuPrincipal.menuClientesClick(Sender: TObject);
begin
  frmCadastroClientes := TfrmCadastroCliente.Create(self);
  frmCadastroClientes.ShowModal;
  frmCadastroClientes.Release;
end;

procedure TfrmMenuPrincipal.menuFecharClick(Sender: TObject);
begin
  application.Terminate;
end;

procedure TfrmMenuPrincipal.menuUsuarioClick(Sender: TObject);
begin
  frmCadastroUsuarios := TfrmCadastroUsuarios.Create(self);
  frmCadastroUsuarios.ShowModal;
  frmCadastroUsuarios.Release;
end;

end.
