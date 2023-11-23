inherited frmCadastroCliente: TfrmCadastroCliente
  Caption = 'Cadastro de Clientes'
  ClientHeight = 568
  ClientWidth = 1011
  Color = 16776176
  ExplicitLeft = 2
  ExplicitWidth = 1023
  ExplicitHeight = 606
  TextHeight = 13
  inherited pnlRodape: TPanel
    Top = 531
    Width = 1011
    ExplicitTop = 334
    ExplicitWidth = 755
    inherited btnNavegator: TDBNavigator
      Hints.Strings = ()
    end
    inherited brnFechar: TBitBtn
      Left = 901
      ExplicitLeft = 645
    end
  end
  inherited pgcPrincipal: TPageControl
    Width = 1011
    Height = 531
    ActivePage = tbManutencao
    ExplicitWidth = 1011
    ExplicitHeight = 531
    inherited tbLista: TTabSheet
      ExplicitWidth = 1003
      ExplicitHeight = 503
      inherited pnlCabecalho: TPanel
        Width = 1003
        ExplicitWidth = 1003
      end
      inherited gridLista: TDBGrid
        Width = 1003
        Height = 454
        Columns = <
          item
            Expanded = False
            FieldName = 'Id_Cliente'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Endereco'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Cidade'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Bairro'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Estado'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Telefone'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Email'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Data_Nascimento'
            Visible = True
          end>
      end
    end
    inherited tbManutencao: TTabSheet
      Caption = 'Cadastro'
      ExplicitWidth = 1003
      ExplicitHeight = 503
      object pgnCliente: TPageControl
        Left = 0
        Top = 0
        Width = 1003
        Height = 503
        ActivePage = tbGerais
        Align = alClient
        TabOrder = 0
        object tbGerais: TTabSheet
          Caption = 'Dados Gerais'
          object lblTelefone: TLabel
            Left = 520
            Top = 46
            Width = 42
            Height = 13
            Caption = 'Telefone'
          end
          object lblDataNascimento: TLabel
            Left = 520
            Top = 94
            Width = 96
            Height = 13
            Caption = 'Data de Nascimento'
          end
          object edtCodigo: TLabeledEdit
            Tag = 1
            Left = 3
            Top = 20
            Width = 118
            Height = 21
            EditLabel.Width = 33
            EditLabel.Height = 13
            EditLabel.Caption = 'C'#243'digo'
            MaxLength = 10
            NumbersOnly = True
            ReadOnly = True
            TabOrder = 0
            Text = ''
          end
          object edtNome: TLabeledEdit
            Left = 3
            Top = 65
            Width = 497
            Height = 21
            EditLabel.Width = 27
            EditLabel.Height = 13
            EditLabel.Caption = 'Nome'
            MaxLength = 50
            TabOrder = 1
            Text = ''
          end
          object edtEmail: TLabeledEdit
            Left = 3
            Top = 113
            Width = 497
            Height = 21
            EditLabel.Width = 24
            EditLabel.Height = 13
            EditLabel.Caption = 'Email'
            MaxLength = 250
            TabOrder = 2
            Text = ''
          end
          object edtTelefone: TMaskEdit
            Left = 520
            Top = 65
            Width = 117
            Height = 21
            EditMask = '(99)9999-9999;1;_'
            MaxLength = 13
            TabOrder = 3
            Text = '(  )    -    '
          end
          object edtDataNascimento: TDateEdit
            Left = 520
            Top = 113
            Width = 120
            Height = 21
            DialogTitle = 'Selecione a data'
            NumGlyphs = 2
            CalendarStyle = csDialog
            TabOrder = 4
          end
        end
        object tbEndereco: TTabSheet
          Caption = 'Endere'#231'o'
          ImageIndex = 1
          object lblCEP: TLabel
            Left = 3
            Top = 4
            Width = 19
            Height = 15
            Caption = 'CEP'
          end
          object edtEndereco: TLabeledEdit
            Left = 77
            Top = 25
            Width = 423
            Height = 21
            EditLabel.Width = 45
            EditLabel.Height = 13
            EditLabel.Caption = 'Endere'#231'o'
            MaxLength = 250
            TabOrder = 0
            Text = ''
          end
          object edtCidade: TLabeledEdit
            Left = 3
            Top = 86
            Width = 497
            Height = 21
            EditLabel.Width = 33
            EditLabel.Height = 13
            EditLabel.Caption = 'Cidade'
            MaxLength = 250
            TabOrder = 1
            Text = ''
          end
          object edtCep: TMaskEdit
            Left = 3
            Top = 25
            Width = 63
            Height = 21
            EditMask = '99999-999;1;_'
            MaxLength = 9
            TabOrder = 2
            Text = '     -   '
            OnExit = edtCepExit
          end
          object edtEstado: TLabeledEdit
            Left = 520
            Top = 86
            Width = 37
            Height = 21
            EditLabel.Width = 33
            EditLabel.Height = 13
            EditLabel.Caption = 'Estado'
            MaxLength = 2
            TabOrder = 3
            Text = ''
          end
          object edtBairro: TLabeledEdit
            Left = 520
            Top = 25
            Width = 118
            Height = 21
            EditLabel.Width = 28
            EditLabel.Height = 13
            EditLabel.Caption = 'Bairro'
            MaxLength = 100
            TabOrder = 4
            Text = ''
          end
        end
      end
    end
  end
  inherited dtsLista: TDataSource
    Left = 676
    Top = 40
  end
  inherited qryLista: TADOQuery
    CursorType = ctStatic
    SQL.Strings = (
      'SELECT * FROM vCliente')
    Left = 668
    Top = 112
    object qryListaId_Cliente: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Id_Cliente'
      ReadOnly = True
    end
    object qryListaNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object qryListaEndereco: TStringField
      FieldName = 'Endereco'
      Size = 250
    end
    object qryListaCidade: TStringField
      FieldName = 'Cidade'
      Size = 250
    end
    object qryListaBairro: TStringField
      FieldName = 'Bairro'
      Size = 100
    end
    object qryListaEstado: TStringField
      FieldName = 'Estado'
      Size = 2
    end
    object qryListaTelefone: TStringField
      FieldName = 'Telefone'
      Size = 10
    end
    object qryListaEmail: TStringField
      FieldName = 'Email'
      Size = 250
    end
    object qryListaData_Nascimento: TDateTimeField
      DisplayLabel = 'Data Nascimento'
      FieldName = 'Data_Nascimento'
    end
    object qryListaCep: TStringField
      FieldName = 'Cep'
      Size = 10
    end
  end
end
