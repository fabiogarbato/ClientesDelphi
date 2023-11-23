inherited frmCadastroUsuarios: TfrmCadastroUsuarios
  Caption = 'Cadastro de Usu'#225'rios'
  ClientHeight = 494
  ClientWidth = 824
  ExplicitWidth = 836
  ExplicitHeight = 532
  TextHeight = 13
  inherited pnlRodape: TPanel
    Top = 457
    Width = 824
    ExplicitTop = 456
    ExplicitWidth = 820
    DesignSize = (
      824
      37)
    inherited btnNavegator: TDBNavigator
      Hints.Strings = ()
    end
    inherited brnFechar: TBitBtn
      Left = 710
      ExplicitLeft = 706
    end
  end
  inherited pgcPrincipal: TPageControl
    Width = 824
    Height = 457
    ExplicitWidth = 820
    ExplicitHeight = 456
    inherited tbLista: TTabSheet
      ExplicitWidth = 816
      ExplicitHeight = 429
      inherited pnlCabecalho: TPanel
        Width = 816
        ExplicitWidth = 812
      end
      inherited gridLista: TDBGrid
        Width = 816
        Height = 380
        Columns = <
          item
            Expanded = False
            FieldName = 'Usuario'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Id_Usuario'
            Visible = True
          end>
      end
    end
    inherited tbManutencao: TTabSheet
      ExplicitWidth = 816
      ExplicitHeight = 429
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
      object edtSenha: TLabeledEdit
        Left = 3
        Top = 113
        Width = 497
        Height = 21
        EditLabel.Width = 30
        EditLabel.Height = 13
        EditLabel.Caption = 'Senha'
        MaxLength = 250
        PasswordChar = '*'
        TabOrder = 2
        Text = ''
      end
    end
  end
  inherited dtsLista: TDataSource
    Left = 492
    Top = 48
  end
  inherited qryLista: TADOQuery
    CursorType = ctStatic
    SQL.Strings = (
      'SELECT * FROM vUsuario')
    Left = 436
    Top = 48
    object qryListaUsuario: TStringField
      FieldName = 'Usuario'
      Size = 50
    end
    object qryListaSenha: TStringField
      FieldName = 'Senha'
      Size = 50
    end
    object qryListaId_Usuario: TAutoIncField
      FieldName = 'Id_Usuario'
      ReadOnly = True
    end
  end
end
