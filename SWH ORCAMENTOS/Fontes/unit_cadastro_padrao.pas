unit unit_cadastro_padrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, unit_funcoes,
  unit_mensagem;

type
  Tform_cadastro_padrao = class(TForm)
    pnl_fundo: TPanel;
    pnl_topo: TPanel;
    lbl_titulo: TLabel;
    pnl_separa: TPanel;
    pnl_botoes: TPanel;
    btn_salvar: TPanel;
    btn_cancelar: TPanel;
    procedure btn_salvarMouseEnter(Sender: TObject);
    procedure btn_salvarMouseLeave(Sender: TObject);
    procedure btn_cancelarMouseEnter(Sender: TObject);
    procedure btn_cancelarMouseLeave(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_salvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_cadastro_padrao: Tform_cadastro_padrao;

implementation

{$R *.dfm}

procedure Tform_cadastro_padrao.btn_cancelarClick(Sender: TObject);
begin
  //Fechar o formulário
  Self.Close;
end;

procedure Tform_cadastro_padrao.btn_cancelarMouseEnter(Sender: TObject);
begin
  btn_cancelar.Color  := $00525252;
  btn_cancelar.font.Style := [fsBold];
  btn_cancelar.font.Size := 11;
end;

procedure Tform_cadastro_padrao.btn_cancelarMouseLeave(Sender: TObject);
begin
  btn_cancelar.Color  := clSilver;
  btn_cancelar.font.Style := [];
  btn_cancelar.font.Size := 10;
end;

procedure Tform_cadastro_padrao.btn_salvarClick(Sender: TObject);
begin
  //Validar os campos Obrigatórios
  prcValidarCamposObrigatorios( Self );
end;

procedure Tform_cadastro_padrao.btn_salvarMouseEnter(Sender: TObject);
begin
  btn_salvar.Color  := $00004000;
  btn_salvar.font.Style := [fsBold];
  btn_salvar.font.Size := 11;
end;

procedure Tform_cadastro_padrao.btn_salvarMouseLeave(Sender: TObject);
begin
  btn_salvar.Color  :=  $00408000;
  btn_salvar.font.Style := [];
  btn_salvar.font.Size := 10
end;

procedure Tform_cadastro_padrao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //Libera o Forma da Memória
  FreeAndNil  ( Self );
end;

end.
