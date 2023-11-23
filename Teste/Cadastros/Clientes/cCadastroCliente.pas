unit cCadastroCliente;


interface

uses
  System.Classes, Vcl.Controls, Vcl.ExtCtrls, Vcl.Dialogs,Data.Win.ADODB;

type
  TCadastroCliente = class
  private
    FConexaoDB: TADOConnection;
    FClienteId: Integer;
    FNome: String;
    FEndereco: String;
    FCidade: String;
    FBairro: String;
    FEstado: String;
    FCEP: String;
    FTelefone: String;
    FEmail: String;
    FDataNascimento: TDateTime;

  public
    constructor Create(conexao: TADOConnection);
    destructor Destroy; override;

    function Inserir: Boolean;
    function Atualizar: Boolean;
    function Apagar(Id: Integer): Boolean;
    function Selecionar(Id: Integer): Boolean;

    property ConexaoDB: TADOConnection read FConexaoDB write FConexaoDB;
    property ClienteId: Integer read FClienteId write FClienteId;
    property Nome: String read FNome write FNome;
    property Endereco: String read FEndereco write FEndereco;
    property Cidade: String read FCidade write FCidade;
    property Bairro: String read FBairro write FBairro;
    property Estado: String read FEstado write FEstado;
    property CEP: String read FCEP write FCEP;
    property Telefone: String read FTelefone write FTelefone;
    property Email: String read FEmail write FEmail;
    property DataNascimento: TDateTime read FDataNascimento write FDataNascimento;
  end;

implementation

uses
  System.SysUtils;

{ TCadastroCliente }

function TCadastroCliente.Apagar(Id: Integer): Boolean;
begin
  var qryExcluirCliente := TADOQuery.Create(nil);

  try
    Result := True;
    qryExcluirCliente.Connection := FConexaoDB;
    qryExcluirCliente.SQL.Clear;
    qryExcluirCliente.SQL.Add('DELETE CLIENTES WHERE CLIENTE_ID = :CLIENTE_ID');
    qryExcluirCliente.Parameters.ParamByName('CLIENTE_ID').Value  := Id;

    try
      qryExcluirCliente.ExecSQL;
    except
      Result := False;
    end;

  finally
    if Assigned(qryExcluirCliente) then
      FreeAndNil(qryExcluirCliente);
  end;
end;

function TCadastroCliente.Atualizar: Boolean;
begin
  var qryAtualizarCliente := TADOQuery.Create(nil);

  try
    Result := True;
    qryAtualizarCliente.Connection := FConexaoDB;
    qryAtualizarCliente.SQL.Clear;
    qryAtualizarCliente.SQL.Add('UPDATE CLIENTES SET NOME = :NOME, ENDERECO = :ENDERECO, CIDADE = :CIDADE,');
    qryAtualizarCliente.SQL.Add('BAIRRO = :BAIRRO, ESTADO = :ESTADO, CEP = :CEP, TELEFONE = :TELEFONE, ');
    qryAtualizarCliente.SQL.Add('EMAIL = :EMAIL, DATA_NASCIMENTO = :DATA_NASCIMENTO');
    qryAtualizarCliente.SQL.Add('WHERE CLIENTE_ID = :CLIENTE_ID');
    qryAtualizarCliente.Parameters.ParamByName('CLIENTE_ID').Value := FClienteId;
    qryAtualizarCliente.Parameters.ParamByName('NOME').Value := FNome;
    qryAtualizarCliente.Parameters.ParamByName('ENDERECO').Value := FEndereco;
    qryAtualizarCliente.Parameters.ParamByName('CIDADE').Value := FCidade;
    qryAtualizarCliente.Parameters.ParamByName('BAIRRO').Value := FBairro;
    qryAtualizarCliente.Parameters.ParamByName('ESTADO').Value := FEstado;
    qryAtualizarCliente.Parameters.ParamByName('CEP').Value := FCEP;
    qryAtualizarCliente.Parameters.ParamByName('TELEFONE').Value := FTelefone;
    qryAtualizarCliente.Parameters.ParamByName('EMAIL').Value := FEmail;
    qryAtualizarCliente.Parameters.ParamByName('DATA_NASCIMENTO').Value := FDataNascimento;

    try
      qryAtualizarCliente.ExecSQL;
    except
      Result := False;
    end;

  finally
    if Assigned(qryAtualizarCliente) then
      FreeAndNil(qryAtualizarCliente);
  end;
end;

function TCadastroCliente.Inserir: Boolean;
begin
  var qryInserirCliente := TADOQuery.Create(nil);

  try
    Result := True;
    qryInserirCliente.Connection := FConexaoDB;
    qryInserirCliente.SQL.Clear;
    qryInserirCliente.SQL.Add('INSERT INTO CLIENTES(NOME, ENDERECO, CIDADE, BAIRRO, ESTADO, CEP, TELEFONE, EMAIL, DATA_NASCIMENTO)');
    qryInserirCliente.SQL.Add('VALUES(:NOME, :ENDERECO, :CIDADE, :BAIRRO, :ESTADO, :CEP, :TELEFONE, :EMAIL, :DATA_NASCIMENTO)');
    qryInserirCliente.Parameters.ParamByName('NOME').Value := FNome;
    qryInserirCliente.Parameters.ParamByName('ENDERECO').Value := FEndereco;
    qryInserirCliente.Parameters.ParamByName('CIDADE').Value := FCidade;
    qryInserirCliente.Parameters.ParamByName('BAIRRO').Value := FBairro;
    qryInserirCliente.Parameters.ParamByName('ESTADO').Value := FEstado;
    qryInserirCliente.Parameters.ParamByName('CEP').Value := FCEP;
    qryInserirCliente.Parameters.ParamByName('TELEFONE').Value := FTelefone;
    qryInserirCliente.Parameters.ParamByName('EMAIL').Value := FEmail;
    qryInserirCliente.Parameters.ParamByName('DATA_NASCIMENTO').Value := FDataNascimento;

    try
      qryInserirCliente.ExecSQL;
    except
      Result := False;
    end;

  finally
    if Assigned(qryInserirCliente) then
      FreeAndNil(qryInserirCliente);
  end;
end;

function TCadastroCliente.Selecionar(Id: Integer): Boolean;
begin
  var tblCliente := TADOQuery.Create(nil);

  try
    Result := True;
    tblCliente.Connection := FConexaoDB;
    tblCliente.SQL.Clear;
    tblCliente.SQL.Add('SELECT * FROM CLIENTES WHERE CLIENTE_ID = :CLIENTE_ID');
    tblCliente.Parameters.ParamByName('CLIENTE_ID').Value := Id;

    try
      tblCliente.Open;

      FClienteId := tblCliente.FieldByName('CLIENTE_ID').AsInteger;
      FNome := tblCliente.FieldByName('NOME').AsString;
      FEndereco := tblCliente.FieldByName('ENDERECO').AsString;
      FCidade := tblCliente.FieldByName('CIDADE').AsString;
      FBairro := tblCliente.FieldByName('BAIRRO').AsString;
      FEstado := tblCliente.FieldByName('ESTADO').AsString;
      FCEP := tblCliente.FieldByName('CEP').AsString;
      FTelefone := tblCliente.FieldByName('TELEFONE').AsString;
      FEmail := tblCliente.FieldByName('EMAIL').AsString;
      FDataNascimento := tblCliente.FieldByName('DATA_NASCIMENTO').AsDateTime;

    except
      Result := False;
    end;

  finally
    if Assigned(tblCliente) then
      FreeAndNil(tblCliente);
  end;
end;

constructor TCadastroCliente.Create(conexao: TADOConnection);
begin
  FConexaoDB := conexao;
end;

destructor TCadastroCliente.Destroy;
begin

  inherited;
end;

end.
