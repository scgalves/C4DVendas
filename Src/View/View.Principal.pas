unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Winapi.ShellAPI;

type
  TViewPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Movimentaes1: TMenuItem;
    Financeiro1: TMenuItem;
    Fiscal1: TMenuItem;
    Empresas1: TMenuItem;
    Cidades1: TMenuItem;
    Pessoas1: TMenuItem;
    N1: TMenuItem;
    Subgruposdeprodutos1: TMenuItem;
    Produtos1: TMenuItem;
    Vendas1: TMenuItem;
    Contasareceber1: TMenuItem;
    Configuraes1: TMenuItem;
    NFCe1: TMenuItem;
    pnLogoBack: TPanel;
    Panel2: TPanel;
    Image1: TImage;
    Panel3: TPanel;
    lbYoutube: TLabel;
    lbGitHub: TLabel;
    Label1: TLabel;
    lblC_AZUL_1: TLabel;
    lblC_AZUL_2: TLabel;
    pnlC_AZUL_1: TPanel;
    pnlC_AZUL_2: TPanel;
    pnlC_AZUL_3: TPanel;
    lblC_AZUL_3: TLabel;
    lblC_AZUL_4: TLabel;
    pnlC_AZUL_4: TPanel;
    pnlC_AZUL_5: TPanel;
    lblC_AZUL_5: TLabel;
    procedure lbYoutubeClick(Sender: TObject);
    procedure lbYoutubeMouseEnter(Sender: TObject);
    procedure lbYoutubeMouseLeave(Sender: TObject);
    procedure Cidades1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Pessoas1Click(Sender: TObject);
    procedure Empresas1Click(Sender: TObject);
    procedure Subgruposdeprodutos1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Vendas1Click(Sender: TObject);
    procedure Contasareceber1Click(Sender: TObject);
    procedure Configuraes1Click(Sender: TObject);
    procedure NFCe1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewPrincipal: TViewPrincipal;

implementation

uses
  View.Cidades.Buscar, View.Pessoas.Buscar;

{$R *.dfm}

procedure TViewPrincipal.Cidades1Click(Sender: TObject);
begin
  if not Assigned(ViewCidadesBuscar) then
    ViewCidadesBuscar := TViewCidadesBuscar.Create(nil);
  try
    ViewCidadesBuscar.ShowModal;
  finally
    FreeAndNil(ViewCidadesBuscar);
  end;
end;

procedure TViewPrincipal.Configuraes1Click(Sender: TObject);
begin
  ShowMessage('Em construção');
end;

procedure TViewPrincipal.Contasareceber1Click(Sender: TObject);
begin
  ShowMessage('Em construção');
end;

procedure TViewPrincipal.Empresas1Click(Sender: TObject);
begin
  ShowMessage('Em construção');
end;

procedure TViewPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

procedure TViewPrincipal.lbYoutubeClick(Sender: TObject);
begin
   ShellExecute(0, nil, PChar(TLabel(Sender).Caption), '', '', SW_SHOWNORMAL);
end;

procedure TViewPrincipal.lbYoutubeMouseEnter(Sender: TObject);
begin
   TLabel(Sender).Font.Color := clRed;
end;

procedure TViewPrincipal.lbYoutubeMouseLeave(Sender: TObject);
begin
   TLabel(Sender).Font.Color := clWindowText;
end;

procedure TViewPrincipal.NFCe1Click(Sender: TObject);
begin
  ShowMessage('Em construção');
end;

procedure TViewPrincipal.Pessoas1Click(Sender: TObject);
begin
  if not Assigned(ViewPessoasBuscar) then
    ViewPessoasBuscar := TViewPessoasBuscar.Create(nil);
  try
    ViewPessoasBuscar.ShowModal;
  finally
    FreeAndNil(ViewPessoasBuscar);
  end;
end;

procedure TViewPrincipal.Produtos1Click(Sender: TObject);
begin
  ShowMessage('Em construção');
end;

procedure TViewPrincipal.Subgruposdeprodutos1Click(Sender: TObject);
begin
  ShowMessage('Em construção');
end;

procedure TViewPrincipal.Vendas1Click(Sender: TObject);
begin
  ShowMessage('Em construção');
end;

end.
