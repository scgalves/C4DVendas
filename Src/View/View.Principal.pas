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
    mniEmpresa: TMenuItem;
    mniCidade: TMenuItem;
    mniPessoa: TMenuItem;
    N1: TMenuItem;
    mniSubgrupoProduto: TMenuItem;
    mniProduto: TMenuItem;
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
    mniGrupoProduto: TMenuItem;
    procedure lbYoutubeClick(Sender: TObject);
    procedure lbYoutubeMouseEnter(Sender: TObject);
    procedure lbYoutubeMouseLeave(Sender: TObject);
    procedure mniCidadeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mniPessoaClick(Sender: TObject);
    procedure mniEmpresaClick(Sender: TObject);
    procedure mniSubgrupoProdutoClick(Sender: TObject);
    procedure mniProdutoClick(Sender: TObject);
    procedure Vendas1Click(Sender: TObject);
    procedure Contasareceber1Click(Sender: TObject);
    procedure Configuraes1Click(Sender: TObject);
    procedure NFCe1Click(Sender: TObject);
    procedure mniGrupoProdutoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewPrincipal: TViewPrincipal;

implementation

uses
  View.Cidades.Buscar, View.Pessoas.Buscar, View.Grupos.Buscar, View.Subgrupos.Buscar, View.Produtos.Buscar;

{$R *.dfm}

procedure TViewPrincipal.mniCidadeClick(Sender: TObject);
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

procedure TViewPrincipal.mniEmpresaClick(Sender: TObject);
begin
  ShowMessage('Em construção');
end;

procedure TViewPrincipal.mniGrupoProdutoClick(Sender: TObject);
begin
  if not Assigned(ViewGruposBuscar) then
    ViewGruposBuscar := TViewGruposBuscar.Create(nil);
  try
    ViewGruposBuscar.ShowModal;
  finally
    FreeAndNil(ViewGruposBuscar);
  end;
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

procedure TViewPrincipal.mniPessoaClick(Sender: TObject);
begin
  if not Assigned(ViewPessoasBuscar) then
    ViewPessoasBuscar := TViewPessoasBuscar.Create(nil);
  try
    ViewPessoasBuscar.ShowModal;
  finally
    FreeAndNil(ViewPessoasBuscar);
  end;
end;

procedure TViewPrincipal.mniProdutoClick(Sender: TObject);
begin
  if not Assigned(ViewProdutosBuscar) then
    ViewProdutosBuscar := TViewProdutosBuscar.Create(nil);
  try
    ViewProdutosBuscar.ShowModal;
  finally
    FreeAndNil(ViewProdutosBuscar);
  end;
end;

procedure TViewPrincipal.mniSubgrupoProdutoClick(Sender: TObject);
begin
  if not Assigned(ViewSubgruposBuscar) then
    ViewSubgruposBuscar := TViewSubgruposBuscar.Create(nil);
  try
    ViewSubgruposBuscar.ShowModal;
  finally
    FreeAndNil(ViewSubgruposBuscar);
  end;
end;

procedure TViewPrincipal.Vendas1Click(Sender: TObject);
begin
  ShowMessage('Em construção');
end;

end.
