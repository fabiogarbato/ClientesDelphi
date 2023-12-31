unit cCadastroUsuarios;

interface

uses
  System.Classes, Vcl.Controls, Vcl.ExtCtrls, Vcl.Dialogs, System.SysUtils,
  Data.Win.ADODB;

type
  TCadastroUsuario = class
  private
    FNome: String;
    FSenha: String;
    FUsuarioId: Integer;
    FConexaoDB: TADOConnection;
  public
    constructor Create(conexao: TADOConnection);
    destructor Destroy; override;

    function Inserir: Boolean;
    function Atualizar: Boolean;
    function Apagar(Id: Integer): Boolean;
    function Selecionar(Id: Integer): Boolean;
    function Logar(usuario, senha: String): Boolean;
    function ValidarSenha(const Senha: string): Boolean;

    property Nome: String read FNome write FNome;
    property Senha: String read FSenha write FSenha;
    property UsuarioId: Integer read FUsuarioId write FUsuarioId;
    property ConexaoDB: TADOConnection read FConexaoDB write FConexaoDB;
  end;

implementation

{ TCadastroUsuario }

constructor TCadastroUsuario.Create(conexao: TADOConnection);
begin
  ConexaoDB := conexao;
end;

destructor TCadastroUsuario.Destroy;
begin

  inherited;
end;

function TCadastroUsuario.Apagar(Id: Integer): Boolean;
var
  qryVerificarUsuario, qryExcluirUsuario: TADOQuery;
  ContagemUsuarios: Integer;
begin
  Result := True;

  qryVerificarUsuario := TADOQuery.Create(nil);
  qryExcluirUsuario := TADOQuery.Create(nil);

  try
    qryVerificarUsuario.Connection := FConexaoDB;
    qryVerificarUsuario.SQL.Clear;
    qryVerificarUsuario.SQL.Add('SELECT COUNT(*) AS Contagem FROM Usuario');
    qryVerificarUsuario.Open;

    ContagemUsuarios := qryVerificarUsuario.FieldByName('Contagem').AsInteger;

    if ContagemUsuarios > 1 then
    begin
      qryExcluirUsuario.Connection := FConexaoDB;
      qryExcluirUsuario.SQL.Clear;
      qryExcluirUsuario.SQL.Add('EXEC UsuarioD :Id_Usuario');
      qryExcluirUsuario.Parameters.ParamByName('Id_Usuario').Value := Id;

      try
        qryExcluirUsuario.ExecSQL;
      except
        Result := False;
      end;
    end
    else
    begin
      MessageDlg('N�o � permitido excluir todos os usu�rios do sistema!', mtWarning, [mbOK], 0);
      Result := False;
    end;
  finally
    FreeAndNil(qryVerificarUsuario);
    FreeAndNil(qryExcluirUsuario);
  end;
end;

function TCadastroUsuario.Atualizar: Boolean;
begin
  var qryAtualizarUsuario := TADOQuery.Create(nil);

  try
    Result := True;
    qryAtualizarUsuario.Connection := FConexaoDB;
    qryAtualizarUsuario.SQL.Clear;
    qryAtualizarUsuario.SQL.Add('EXEC dbo.UsuarioU :Id_Usuario, :Usuario, :Senha');
    qryAtualizarUsuario.Parameters.ParamByName('Id_Usuario').Value := FUsuarioId;
    qryAtualizarUsuario.Parameters.ParamByName('Usuario').Value := FNome;
    qryAtualizarUsuario.Parameters.ParamByName('Senha').Value := FSenha;

    try
      qryAtualizarUsuario.ExecSQL;
    except
      Result := False;
    end;

  finally
    if Assigned(qryAtualizarUsuario) then
      FreeAndNil(qryAtualizarUsuario);
  end;
end;

function TCadastroUsuario.Inserir: Boolean;
begin
  var qryInserirUsuario := TADOQuery.Create(nil);

  try
    Result := True;
    qryInserirUsuario.Connection := FConexaoDB;
    qryInserirUsuario.SQL.Clear;
    qryInserirUsuario.SQL.Add('EXEC UsuarioI :Usuario, :Senha');
    qryInserirUsuario.Parameters.ParamByName('Usuario').Value := FNome;
    qryInserirUsuario.Parameters.ParamByName('Senha').Value := FSenha;

    try
      qryInserirUsuario.ExecSQL;
    except
      Result := False;
    end;

  finally
    if Assigned(qryInserirUsuario) then
      FreeAndNil(qryInserirUsuario);
  end;
end;

function TCadastroUsuario.ValidarSenha(const Senha: string): Boolean;
var
  TemMaiuscula, TemMinuscula, TemEspecial: Boolean;
  i: Integer;
begin
  TemMaiuscula := False;
  TemMinuscula := False;
  TemEspecial := False;

  for i := 1 to Length(Senha) do
  begin
    if CharInSet(Senha[i], ['A'..'Z']) then
      TemMaiuscula := True
    else if CharInSet(Senha[i], ['a'..'z']) then
      TemMinuscula := True
    else if CharInSet(Senha[i], ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '_', '+', '-', '=', '{', '}', '[', ']', ':', ';', '"', '''', '<', '>', ',', '.', '/', '?', '|', '\']) then
      TemEspecial := True;
  end;

  Result := TemMaiuscula and TemMinuscula and TemEspecial;
end;


function TCadastroUsuario.Logar(usuario, senha: String): Boolean;
begin
  var tblUsuarios := TADOQuery.Create(nil);

  try
    Result := True;
    tblUsuarios.Connection := FConexaoDB;
    tblUsuarios.SQL.Clear;
    tblUsuarios.SQL.Add('SELECT COUNT(Id_Usuario) AS QTDE_USUARIO FROM Usuario WHERE Usuario = :Usuario AND Senha = :Senha');
    tblUsuarios.Parameters.ParamByName('Usuario').Value := usuario;
    tblUsuarios.Parameters.ParamByName('Senha').Value := senha;

    try
      tblUsuarios.Open;

      if tblUsuarios.FieldByName('QTDE_USUARIO').AsInteger > 0 then
        result := true
      else
        result := false;      

    except
      Result := False;
    end;

  finally
    if Assigned(tblUsuarios) then
      FreeAndNil(tblUsuarios);
  end;
end;

function TCadastroUsuario.Selecionar(Id: Integer): Boolean;
begin
  var tblUsuarios := TADOQuery.Create(nil);

  try
    Result := True;
    tblUsuarios.Connection := FConexaoDB;
    tblUsuarios.SQL.Clear;
    tblUsuarios.SQL.Add('SELECT * FROM Usuario WHERE Id_Usuario = :Id_Usuario');
    tblUsuarios.Parameters.ParamByName('Id_Usuario').Value := Id;

    try
      tblUsuarios.Open;

      FUsuarioId := tblUsuarios.FieldByName('Id_Usuario').AsInteger;
      FNome := tblUsuarios.FieldByName('Usuario').AsString;
      FSenha := tblUsuarios.FieldByName('Senha').AsString;

    except
      Result := False;
    end;

  finally
    if Assigned(tblUsuarios) then
      FreeAndNil(tblUsuarios);
  end;
end;

end.
