object frmMenuPrincipal: TfrmMenuPrincipal
  Left = 0
  Top = 0
  Caption = 'Menu Principal'
  ClientHeight = 319
  ClientWidth = 852
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
    Width = 852
    Height = 319
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
  object btnClientes: TButton
    AlignWithMargins = True
    Left = 445
    Top = 161
    Width = 321
    Height = 64
    Align = alCustom
    Caption = 'Clientes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btnClientesClick
    ExplicitLeft = 442
    ExplicitTop = 158
  end
  object btnUsuario: TButton
    AlignWithMargins = True
    Left = 445
    Top = 231
    Width = 321
    Height = 65
    Align = alCustom
    Caption = 'Usuarios'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnUsuarioClick
    ExplicitLeft = 442
    ExplicitTop = 228
  end
end