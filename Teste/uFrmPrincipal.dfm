object frmMenuPrincipal: TfrmMenuPrincipal
  Left = 0
  Top = 0
  Caption = 'Menu Principal'
  ClientHeight = 299
  ClientWidth = 852
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mainMenuPrincipal
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 852
    Height = 299
    Align = alClient
    Alignment = taCenter
    Caption = 'SISTEMA DE CADASTROS'
    Color = clBackground
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -48
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    ExplicitWidth = 607
    ExplicitHeight = 58
  end
  object mainMenuPrincipal: TMainMenu
    Left = 768
    Top = 48
    object menuCadatros: TMenuItem
      Caption = 'Cadastros'
      object menuClientes: TMenuItem
        Caption = 'Clientes'
        OnClick = menuClientesClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object menuUsuario: TMenuItem
        Caption = 'Usu'#225'rios'
        OnClick = menuUsuarioClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object menuFechar: TMenuItem
        Caption = 'Fechar'
        OnClick = menuFecharClick
      end
    end
  end
end
