unit uDtmConexao;

interface

uses
  System.SysUtils, System.Classes, Data.DB,
  Data.Win.ADODB;

type
  TdtmConexao = class(TDataModule)
    conexaoDB: TADOConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmConexao: TdtmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
