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
begin
  var qryExcluirUsuario := TADOQuery.Create(nil);

  try
    Result := True;
    qryExcluirUsuario.Connection := FConexaoDB;
    qryExcluirUsuario.SQL.Clear;
    qryExcluirUsuario.SQL.Add('DELETE USUARIOS WHERE USUARIO_ID = :USUARIO_ID');
    qryExcluirUsuario.Parameters.ParamByName('USUARIO_ID').Value := Id;

    try
      qryExcluirUsuario.ExecSQL;
    except
      Result := False;
    end;

  finally
    if Assigned(qryExcluirUsuario) then
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
    qryAtualizarUsuario.SQL.Add('UPDATE USUARIOS SET NOME = :NOME, SENHA = :SENHA');
    qryAtualizarUsuario.SQL.Add('WHERE USUARIO_ID = :USUARIO_ID');
    qryAtualizarUsuario.Parameters.ParamByName('USUARIO_ID').Value := FUsuarioId;
    qryAtualizarUsuario.Parameters.ParamByName('NOME').Value := FNome;
    qryAtualizarUsuario.Parameters.ParamByName('SENHA').Value := FSenha;

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
    qryInserirUsuario.SQL.Add('INSERT INTO USUARIOS(NOME, SENHA)');
    qryInserirUsuario.SQL.Add('VALUES(:NOME, :SENHA)');
    qryInserirUsuario.Parameters.ParamByName('NOME').Value := FNome;
    qryInserirUsuario.Parameters.ParamByName('SENHA').Value := FSenha;

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

function TCadastroUsuario.Logar(usuario, senha: String): Boolean;
begin
  var tblUsuarios := TADOQuery.Create(nil);

  try
    Result := True;
    tblUsuarios.Connection := FConexaoDB;
    tblUsuarios.SQL.Clear;
    tblUsuarios.SQL.Add('SELECT COUNT(USUARIO_ID) AS QTDE_USUARIO FROM USUARIOS WHERE NOME = :NOME AND SENHA = :SENHA');
    tblUsuarios.Parameters.ParamByName('NOME').Value := usuario;
    tblUsuarios.Parameters.ParamByName('SENHA').Value := senha;

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
    tblUsuarios.SQL.Add('SELECT * FROM USUARIOS WHERE USUARIO_ID = :USUARIO_ID');
    tblUsuarios.Parameters.ParamByName('USUARIO_ID').Value := Id;

    try
      tblUsuarios.Open;

      FUsuarioId := tblUsuarios.FieldByName('USUARIO_ID').AsInteger;
      FNome := tblUsuarios.FieldByName('NOME').AsString;
      FSenha := tblUsuarios.FieldByName('SENHA').AsString;

    except
      Result := False;
    end;

  finally
    if Assigned(tblUsuarios) then
      FreeAndNil(tblUsuarios);
  end;
end;

end.
