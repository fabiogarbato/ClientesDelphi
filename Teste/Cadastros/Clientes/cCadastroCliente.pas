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
    qryExcluirCliente.SQL.Add('EXEC dbo.ClienteD :Id_Cliente');
    qryExcluirCliente.Parameters.ParamByName('Id_Cliente').Value  := Id;

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
    qryAtualizarCliente.SQL.Add('EXEC dbo.ClienteU :Id_Cliente, :Nome, :Endereco, :Cidade, :Bairro, :Estado, :Cep, :Telefone, :Email, :Data_Nascimento');
    qryAtualizarCliente.Parameters.ParamByName('Id_Cliente').Value := FClienteId;
    qryAtualizarCliente.Parameters.ParamByName('Nome').Value := FNome;
    qryAtualizarCliente.Parameters.ParamByName('Endereco').Value := FEndereco;
    qryAtualizarCliente.Parameters.ParamByName('Cidade').Value := FCidade;
    qryAtualizarCliente.Parameters.ParamByName('Bairro').Value := FBairro;
    qryAtualizarCliente.Parameters.ParamByName('ESTADO').Value := FEstado;
    qryAtualizarCliente.Parameters.ParamByName('Cep').Value := FCEP;
    qryAtualizarCliente.Parameters.ParamByName('Telefone').Value := FTelefone;
    qryAtualizarCliente.Parameters.ParamByName('Email').Value := FEmail;
    qryAtualizarCliente.Parameters.ParamByName('Data_Nascimento').Value := FDataNascimento;

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
    qryInserirCliente.SQL.Add('EXEC dbo.ClienteI :Nome, :Endereco, :Cidade, :Bairro, :Estado, :Cep, :Telefone, :Email, :Data_Nascimento');
    qryInserirCliente.Parameters.ParamByName('Nome').Value := FNome;
    qryInserirCliente.Parameters.ParamByName('Endereco').Value := FEndereco;
    qryInserirCliente.Parameters.ParamByName('Cidade').Value := FCidade;
    qryInserirCliente.Parameters.ParamByName('Bairro').Value := FBairro;
    qryInserirCliente.Parameters.ParamByName('Estado').Value := FEstado;
    qryInserirCliente.Parameters.ParamByName('Cep').Value := FCEP;
    qryInserirCliente.Parameters.ParamByName('Telefone').Value := FTelefone;
    qryInserirCliente.Parameters.ParamByName('Email').Value := FEmail;
    qryInserirCliente.Parameters.ParamByName('Data_Nascimento').Value := FDataNascimento;

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
    tblCliente.SQL.Add('SELECT * FROM Cliente WHERE Id_Cliente = :Id_Cliente');
    tblCliente.Parameters.ParamByName('Id_Cliente').Value := Id;

    try
      tblCliente.Open;

      FClienteId := tblCliente.FieldByName('Id_Cliente').AsInteger;
      FNome := tblCliente.FieldByName('Nome').AsString;
      FEndereco := tblCliente.FieldByName('Endereco').AsString;
      FCidade := tblCliente.FieldByName('Cidade').AsString;
      FBairro := tblCliente.FieldByName('Bairro').AsString;
      FEstado := tblCliente.FieldByName('Estado').AsString;
      FCEP := tblCliente.FieldByName('Cep').AsString;
      FTelefone := tblCliente.FieldByName('Telefone').AsString;
      FEmail := tblCliente.FieldByName('Email').AsString;
      FDataNascimento := tblCliente.FieldByName('Data_Nascimento').AsDateTime;

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
