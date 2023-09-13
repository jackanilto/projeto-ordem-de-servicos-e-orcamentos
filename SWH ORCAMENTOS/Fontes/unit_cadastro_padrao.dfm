object form_cadastro_padrao: Tform_cadastro_padrao
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  ClientHeight = 509
  ClientWidth = 770
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 17
  object pnl_fundo: TPanel
    Left = 0
    Top = 0
    Width = 770
    Height = 509
    Align = alClient
    BevelKind = bkFlat
    BevelOuter = bvNone
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 8404992
    Font.Height = -13
    Font.Name = 'Segoe UI Semibold'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      766
      505)
    object pnl_topo: TPanel
      Left = 0
      Top = 0
      Width = 766
      Height = 49
      Align = alTop
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object lbl_titulo: TLabel
        Left = 12
        Top = 9
        Width = 108
        Height = 30
        Alignment = taCenter
        Caption = 'CADASTRO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8404992
        Font.Height = -21
        Font.Name = 'Segoe UI Semibold'
        Font.Style = []
        ParentFont = False
      end
      object pnl_separa: TPanel
        Left = 0
        Top = 48
        Width = 766
        Height = 1
        Align = alBottom
        BevelOuter = bvNone
        Color = clSilver
        ParentBackground = False
        TabOrder = 0
      end
    end
    object pnl_botoes: TPanel
      Left = 136
      Top = 432
      Width = 433
      Height = 57
      Anchors = [akBottom]
      BevelOuter = bvNone
      TabOrder = 1
      object btn_salvar: TPanel
        Left = 138
        Top = 11
        Width = 111
        Height = 33
        Cursor = crHandPoint
        BevelOuter = bvNone
        Caption = 'Salvar'
        Color = 4227072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Segoe UI '
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        OnClick = btn_salvarClick
        OnMouseEnter = btn_salvarMouseEnter
        OnMouseLeave = btn_salvarMouseLeave
      end
      object btn_cancelar: TPanel
        Left = 264
        Top = 11
        Width = 111
        Height = 33
        Cursor = crHandPoint
        BevelOuter = bvNone
        Caption = 'Cancelar'
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Segoe UI '
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        OnClick = btn_cancelarClick
        OnMouseEnter = btn_cancelarMouseEnter
        OnMouseLeave = btn_cancelarMouseLeave
      end
    end
  end
end
