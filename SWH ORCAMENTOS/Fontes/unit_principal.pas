unit unit_principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, System.ImageList, Vcl.ImgList, Vcl.Buttons;

type
  Tform_principal = class(TForm)
    pnl_topo: TPanel;
    pnl_menu: TPanel;
    pnl_principal: TPanel;
    img_logo_empresa: TImage;
    lbl_titulo: TLabel;
    lbl_versao: TLabel;
    btn_fechar: TSpeedButton;
    ImageList1: TImageList;
    btn_usuario: TSpeedButton;
    btn_config: TSpeedButton;
    pnl_menu_configuracoes: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    pnl_botao_orcamento: TPanel;
    lbl_botao_orcamentos: TLabel;
    img_botao_orcamentos: TImage;
    pnl_botao_produto: TPanel;
    lbl_botao_produtos: TLabel;
    img_botao_produtos: TImage;
    pnl_botao_pessoa: TPanel;
    lbl_botao_pessoas: TLabel;
    img_botao_pessoas: TImage;
    pnl_botao_servico: TPanel;
    lbl_botao_servicos: TLabel;
    img_botao_servicos: TImage;
    pbl_botao_funcionario: TPanel;
    lbl_botao_funcionarios: TLabel;
    img_botao_funcionarios: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_fecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_configClick(Sender: TObject);
    procedure pnl_topoMouseEnter(Sender: TObject);
    procedure lbl_botao_orcamentosMouseEnter(Sender: TObject);
    procedure lbl_botao_orcamentosMouseLeae(Sender: TObject);
    procedure lbl_botao_produtosMouseEnter(Sender: TObject);
    procedure lbl_botao_produtosMouseLeave(Sender: TObject);
    procedure lbl_botao_pessoasMouseEnter(Sender: TObject);
    procedure lbl_botao_pessoasMouseLeave(Sender: TObject);
    procedure lbl_botao_servicosMouseEnter(Sender: TObject);
    procedure lbl_botao_servicosMouseLeave(Sender: TObject);
    procedure lbl_botao_funcionariosMouseEnter(Sender: TObject);
    procedure lbl_botao_funcionariosMouseLeave(Sender: TObject);
    procedure lbl_botao_funcionariosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_principal: Tform_principal;

implementation

{$R *.dfm}

uses unit_funcoes, unit_consulta_funcionarios;

procedure Tform_principal.btn_configClick(Sender: TObject);
begin
  //Mostrar o Menu
  pnl_menu_configuracoes.Visible := true;
end;

procedure Tform_principal.btn_fecharClick(Sender: TObject);
begin
  //Fechar o Form Principal e encerra a aplica��o
  form_principal.Close;
  Application.Terminate;
end;

procedure Tform_principal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Liberar o Form da Mem�ria
  FreeAndNil( form_principal);
end;

procedure Tform_principal.FormCreate(Sender: TObject);
begin
  //Atribui o Valor da Vers�o do Executavel
  lbl_versao.Caption := 'vers�o: ' + var_gbl_versao;
end;

procedure Tform_principal.lbl_botao_funcionariosClick(Sender: TObject);
begin
  // Cria o form de consulta funcionarios
  form_consulta_funcionarios := Tform_consulta_funcionarios.Create( Self );

  //Abre ele dentro do pnl_principal do form_principal
  form_consulta_funcionarios.Parent := pnl_principal;

  //Desabilitando os menus do form_principal
  pnl_menu.Enabled                := False;
  pnl_menu_configuracoes.Enabled  := False;
  pnl_topo.Enabled                := False;

  //Mostra o form
  form_consulta_funcionarios.Show;
end;

procedure Tform_principal.lbl_botao_funcionariosMouseEnter(Sender: TObject);
begin
  //Mudar Cor da Font do Label
   lbl_botao_funcionarios.Font.Style := [fsBold];
   lbl_botao_funcionarios.Font.Color := $000080FF;
end;

procedure Tform_principal.lbl_botao_funcionariosMouseLeave(Sender: TObject);
begin
  //Mudar Cor da Font do Label
   lbl_botao_funcionarios.Font.Style := [];
   lbl_botao_funcionarios.Font.Color := clwhite;
end;

procedure Tform_principal.lbl_botao_orcamentosMouseEnter(Sender: TObject);
begin
  //Mudar Cor da Font do Label
   lbl_botao_orcamentos.Font.Style := [fsBold];
   lbl_botao_orcamentos.Font.Color := $000080FF;
end;

procedure Tform_principal.lbl_botao_orcamentosMouseLeae(Sender: TObject);
begin
  //Voltar Cor da Font do Label
   lbl_botao_orcamentos.Font.Style := [];
   lbl_botao_orcamentos.Font.Color := clwhite;
end;

procedure Tform_principal.lbl_botao_pessoasMouseEnter(Sender: TObject);
begin
//Mudar Cor da Font do Label
   lbl_botao_pessoas.Font.Style := [fsBold];
   lbl_botao_pessoas.Font.Color := $000080FF;
end;

procedure Tform_principal.lbl_botao_pessoasMouseLeave(Sender: TObject);
begin
  //Voltar Cor da Font do Label
   lbl_botao_pessoas.Font.Style := [];
   lbl_botao_pessoas.Font.Color := clwhite;
end;

procedure Tform_principal.lbl_botao_produtosMouseEnter(Sender: TObject);
begin
  //Mudar Cor da Font do Label
   lbl_botao_produtos.Font.Style := [fsBold];
   lbl_botao_produtos.Font.Color := $000080FF;
end;

procedure Tform_principal.lbl_botao_produtosMouseLeave(Sender: TObject);
begin
  //Voltar Cor da Font do Label
   lbl_botao_produtos.Font.Style := [];
   lbl_botao_produtos.Font.Color := clwhite;
end;

procedure Tform_principal.lbl_botao_servicosMouseEnter(Sender: TObject);
begin
  //Mudar Cor da Font do Label
   lbl_botao_servicos.Font.Style := [fsBold];
   lbl_botao_servicos.Font.Color := $000080FF;
end;

procedure Tform_principal.lbl_botao_servicosMouseLeave(Sender: TObject);
begin
  //Voltar Cor da Font do Label
   lbl_botao_servicos.Font.Style := [];
   lbl_botao_servicos.Font.Color := clwhite;
end;

procedure Tform_principal.pnl_topoMouseEnter(Sender: TObject);
begin
  // Ao retirar o Mouse esconde o Menu
  pnl_menu_configuracoes.Visible := False;
end;

end.
