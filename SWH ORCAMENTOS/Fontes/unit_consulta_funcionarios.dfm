inherited form_consulta_funcionarios: Tform_consulta_funcionarios
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_fundo: TPanel
    Align = alTop
    inherited lbl_consulta: TLabel
      Width = 451
      Caption = 
        'Digite o NOME do FUNCION'#193'RIO que deseja encontrar e Pressione EN' +
        'TER'
      ExplicitWidth = 451
    end
    inherited pnl_topo: TPanel
      inherited lbl_titulo: TLabel
        Width = 263
        Caption = 'CONSULTA FUNCION'#193'RIOS'
        ExplicitWidth = 263
      end
    end
    inherited btn_inserir: TPanel
      Left = 601
      Top = 98
      Width = 118
      ExplicitLeft = 601
      ExplicitTop = 98
      ExplicitWidth = 118
    end
    inherited pbl_consulta: TPanel
      Top = 97
      ExplicitTop = 97
      inherited edt_consulta: TEdit
        OnKeyDown = edt_consultaKeyDown
      end
    end
    inherited pnl_grid: TPanel
      Height = 353
      ExplicitHeight = 353
      inherited dbg_registros: TDBGrid
        Height = 353
        Columns = <
          item
            Expanded = False
            FieldName = 'DS_NOME'
            Title.Caption = 'Nome do funcion'#225'rio'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -13
            Title.Font.Name = 'Segoe UI Semibold'
            Title.Font.Style = []
            Width = 442
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DS_FUNCAO'
            Title.Caption = 'Fun'#231#227'o / Cargo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -13
            Title.Font.Name = 'Segoe UI Semibold'
            Title.Font.Style = []
            Width = 393
            Visible = True
          end>
      end
    end
    inherited btn_fechar: TPanel
      Left = 733
      Top = 98
      Width = 118
      ExplicitLeft = 733
      ExplicitTop = 98
      ExplicitWidth = 118
    end
  end
  inherited ds_consulta: TDataSource
    DataSet = FDQuery1
    Left = 60
    Top = 328
  end
  inherited FDQuery1: TFDQuery
    Active = True
    MasterSource = nil
    Connection = form_conexao.FDConnection
    Left = 140
    Top = 328
    object FDQuery1DS_NOME: TStringField
      FieldName = 'DS_NOME'
      Origin = 'DS_NOME'
      Size = 100
    end
    object FDQuery1DS_FUNCAO: TStringField
      FieldName = 'DS_FUNCAO'
      Origin = 'DS_FUNCAO'
      Size = 50
    end
  end
end
