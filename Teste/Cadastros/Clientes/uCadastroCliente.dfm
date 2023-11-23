inherited frmCadastroCliente: TfrmCadastroCliente
  Caption = 'Cadastro de Clientes'
  ClientHeight = 372
  ClientWidth = 759
  ExplicitWidth = 771
  ExplicitHeight = 410
  TextHeight = 13
  inherited pnlRodape: TPanel
    Top = 335
    Width = 759
    ExplicitTop = 334
    ExplicitWidth = 755
    inherited btnNavegator: TDBNavigator
      Hints.Strings = ()
    end
    inherited brnFechar: TBitBtn
      Left = 649
      ExplicitLeft = 645
    end
  end
  inherited pgcPrincipal: TPageControl
    Width = 759
    Height = 335
    ExplicitWidth = 755
    ExplicitHeight = 334
    inherited tbLista: TTabSheet
      ExplicitWidth = 751
      ExplicitHeight = 307
      inherited pnlCabecalho: TPanel
        Width = 751
        ExplicitWidth = 747
      end
      inherited gridLista: TDBGrid
        Width = 751
        Height = 258
        Columns = <
          item
            Expanded = False
            FieldName = 'Id_Cliente'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Endereco'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Cidade'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Bairro'
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
      ExplicitWidth = 751
      ExplicitHeight = 307
      object lblCEP: TLabel
        Left = 520
        Top = 49
        Width = 19
        Height = 13
        Caption = 'CEP'
      end
      object lblTelefone: TLabel
        Left = 520
        Top = 141
        Width = 42
        Height = 13
        Caption = 'Telefone'
      end
      object lblDataNascimento: TLabel
        Left = 520
        Top = 185
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
      object edtEndereco: TLabeledEdit
        Left = 3
        Top = 113
        Width = 497
        Height = 21
        EditLabel.Width = 45
        EditLabel.Height = 13
        EditLabel.Caption = 'Endere'#231'o'
        MaxLength = 250
        TabOrder = 2
        Text = ''
      end
      object edtCidade: TLabeledEdit
        Left = 3
        Top = 158
        Width = 497
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'Cidade'
        MaxLength = 250
        TabOrder = 3
        Text = ''
      end
      object edtEmail: TLabeledEdit
        Left = 3
        Top = 201
        Width = 497
        Height = 21
        EditLabel.Width = 24
        EditLabel.Height = 13
        EditLabel.Caption = 'Email'
        MaxLength = 250
        TabOrder = 4
        Text = ''
      end
      object edtCep: TMaskEdit
        Left = 520
        Top = 68
        Width = 63
        Height = 21
        EditMask = '99999-999;1;_'
        MaxLength = 9
        TabOrder = 5
        Text = '     -   '
        OnExit = edtCepExit
      end
      object edtEstado: TLabeledEdit
        Left = 601
        Top = 68
        Width = 37
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'Estado'
        MaxLength = 2
        TabOrder = 6
        Text = ''
      end
      object edtBairro: TLabeledEdit
        Left = 520
        Top = 113
        Width = 118
        Height = 21
        EditLabel.Width = 28
        EditLabel.Height = 13
        EditLabel.Caption = 'Bairro'
        MaxLength = 100
        TabOrder = 7
        Text = ''
      end
      object edtTelefone: TMaskEdit
        Left = 523
        Top = 158
        Width = 117
        Height = 21
        EditMask = '(99)9999-9999;1;_'
        MaxLength = 13
        TabOrder = 8
        Text = '(  )    -    '
      end
      object edtDataNascimento: TDateEdit
        Left = 523
        Top = 204
        Width = 120
        Height = 21
        DialogTitle = 'Selecione a data'
        NumGlyphs = 2
        CalendarStyle = csDialog
        TabOrder = 9
      end
    end
  end
  inherited dtsLista: TDataSource
    Left = 644
    Top = 32
  end
  inherited qryLista: TADOQuery
    CursorType = ctStatic
    SQL.Strings = (
      'SELECT * FROM vCliente')
    Left = 596
    Top = 160
    object qryListaId_Cliente: TAutoIncField
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
      FieldName = 'Data_Nascimento'
    end
    object qryListaCep: TStringField
      FieldName = 'Cep'
      Size = 10
    end
  end
end
