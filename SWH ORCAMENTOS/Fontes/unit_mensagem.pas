unit unit_mensagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage;

type
  Tform_mensagem = class(TForm)
    pnl_fundo: TPanel;
    pnl_topo: TPanel;
    img_logo_empresa: TImage;
    lbl_titulo: TLabel;
    img_icone: TImage;
    lbl_descricao: TLabel;
    btn_sim: TPanel;
    btn_nao: TPanel;

    procedure btn_simMouseEnter(Sender: TObject);
    procedure btn_simMouseLeave(Sender: TObject);
    procedure btn_naoMouseEnter(Sender: TObject);
    procedure btn_naoMouseLeave(Sender: TObject);
    procedure btn_naoClick(Sender: TObject);
    procedure btn_simClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    sTipoMsg: String;
    { Public declarations }
  end;

var
  form_mensagem: Tform_mensagem;

implementation

{$R *.dfm}

uses unit_funcoes;

procedure Tform_mensagem.btn_simClick(Sender: TObject);
begin
  // Armazena a resposta na variavel e fecha o form
  var_gbl_resposta_msg := True;
  form_mensagem.Close;
end;

procedure Tform_mensagem.btn_naoClick(Sender: TObject);
begin
  // Armazena a resposta na variavel e fecha o form
  var_gbl_resposta_msg := false;
  form_mensagem.Close;
end;


procedure Tform_mensagem.btn_simMouseEnter(Sender: TObject);
begin
  btn_sim.Color  := clNavy;
  btn_sim.font.Style := [fsBold];
  btn_sim.font.Size := 11;
end;

procedure Tform_mensagem.btn_simMouseLeave(Sender: TObject);
begin
  btn_sim.Color  := $00FF8000;
  btn_sim.font.Style := [];
  btn_sim.font.Size := 10;
end;

procedure Tform_mensagem.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // Se o esc for clicado executa o btn_nao
  if ( KEY = VK_ESCAPE) and ( btn_nao.Visible )then
    btn_naoClick( Self )
  else // Se o enter for clicado executa p btn_sim
  if ( KEY = VK_RETURN ) and ( btn_sim.Visible ) then
    btn_simClick( Self );
end;

procedure Tform_mensagem.FormShow(Sender: TObject);
begin
  if UpperCase ( sTipoMsg ) = 'AVISO' then
  begin
    //Troca o titulo
    lbl_titulo.Caption := 'ATENÇÃO - AVISO';

    //Altera os layouts dos botoes
    btn_sim.Caption := 'OK ( ENTER )';
    btn_nao.Visible := False;

    //Troca a imagem
    img_icone.Picture.LoadFromFile
          ( ExtractFilePath ( Application.ExeName ) + '\MENSAGEM\aviso.png' );
  end
  else
  if UpperCase ( sTipoMsg ) = 'DELETE' then
  begin
      //Troca o titulo
    lbl_titulo.Caption := 'CONFIRMAÇÃO DE EXCLUSÃO NECESSÁRIA';

    //Altera os layouts dos botoes
    btn_sim.Caption := 'SIM ( ENTER )';
    btn_nao.Visible := True;

    //Troca a imagem
    img_icone.Picture.LoadFromFile
          ( ExtractFilePath ( Application.ExeName ) + '\MENSAGEM\delete.png' );
  end
  else
  if UpperCase ( sTipoMsg ) = 'CONFIRMACAO' then
  begin
        //Troca o titulo
    lbl_titulo.Caption := 'CONFIRMAÇÃO NECESSÁRIA';

    //Altera os layouts dos botoes
    btn_sim.Caption := 'SIM ( ENTER )';
    btn_nao.Visible := True;

    //Troca a imagem
    img_icone.Picture.LoadFromFile
          ( ExtractFilePath ( Application.ExeName ) + '\MENSAGEM\confirmacao.png' );
  end
  else
  if UpperCase ( sTipoMsg ) = 'ERRO' then
  begin
      //Troca o titulo
    lbl_titulo.Caption := 'ERRO NA OPERAÇÃO';

    //Altera os layouts dos botoes
    btn_sim.Caption := 'OK ( ENTER )';
    btn_nao.Visible := False;

    //Troca a imagem
    img_icone.Picture.LoadFromFile
          ( ExtractFilePath ( Application.ExeName ) + '\MENSAGEM\erro.png' );
  end;

end;

procedure Tform_mensagem.btn_naoMouseEnter(Sender: TObject);
begin
  btn_nao.Color  := $00EAEAEA;
  btn_nao.font.Style := [fsBold];
  btn_nao.font.Size := 11;
end;

procedure Tform_mensagem.btn_naoMouseLeave(Sender: TObject);
begin
  btn_nao.Color  := clSilver;
  btn_nao.font.Style := [];
  btn_nao.font.Size := 10;
end;

end.
