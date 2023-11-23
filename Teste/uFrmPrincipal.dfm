object frmMenuPrincipal: TfrmMenuPrincipal
  Left = 0
  Top = 0
  Caption = 'Menu Principal'
  ClientHeight = 633
  ClientWidth = 1067
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 1067
    Height = 633
    Align = alTop
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
  object btnClientes: TButton
    Left = 449
    Top = 145
    Width = 200
    Height = 115
    Caption = 'Clientes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btnClientesClick
  end
  object btnUsuario: TButton
    Left = 449
    Top = 280
    Width = 200
    Height = 105
    Caption = 'Usu'#225'rios'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnUsuarioClick
  end
end
