unit CadastroClientesFRM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, Grids, DBGrids, Buttons,
  ToolWin, ComCtrls, IdHTTP, OleCtrls, SHDocVw, IdAntiFreezeBase,
  IdAntiFreeze, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  xmldom, XMLIntf, msxmldom, XMLDoc, Wininet, Data.DB, REST.Types,
  Data.Bind.Components, Data.Bind.ObjectScope, REST.Client;

type
  TCadastroClientes_FRM = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    lblNome: TLabel;
    lblIdentidade: TLabel;
    lblCPF: TLabel;
    lblEmail: TLabel;
    lblCEP: TLabel;
    lblLogradouro: TLabel;
    lblNumero: TLabel;
    lblComplemento: TLabel;
    lblBairro: TLabel;
    lblCidade: TLabel;
    lblEstado: TLabel;
    lblPais: TLabel;
    lblTelefone: TLabel;
    tlbComandos: TToolBar;
    btnNovo: TBitBtn;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    btnExcluir: TBitBtn;
    btnExportar: TButton;
    dbedtNome: TDBEdit;
    dbedtIdentidade: TDBEdit;
    dbedtCPF: TDBEdit;
    dbedtEmail: TDBEdit;
    dbgrdCadastroCliente: TDBGrid;
    dbedtCEP: TDBEdit;
    dbedtLogradouro: TDBEdit;
    dbedtNumero: TDBEdit;
    dbedtComplemento: TDBEdit;
    dbedtBairro: TDBEdit;
    dbedtCidade: TDBEdit;
    dbedtEstado: TDBEdit;
    dbedtPais: TDBEdit;
    dbedtTelefone: TDBEdit;
    txtConfigEmailRemetente: TEdit;
    lblConfigEmail: TLabel;
    Label1: TLabel;
    txtConfigSenha: TEdit;
    txtConfigHost: TEdit;
    lblHost: TLabel;
    lblConfigPorta: TLabel;
    txtConfigPorta: TEdit;
    txtConfigEmailDestinatario: TEdit;
    Label2: TLabel;
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure dbedtCEPExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnExportarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadastroClientes_FRM: TCadastroClientes_FRM;

implementation

uses
  dtmCadastroCliente, CadastroClienteUNT, BibliotecaUNT;

{$R *.dfm}

procedure TCadastroClientes_FRM.btnNovoClick(Sender: TObject);
begin
  TCadastroCliente.Inserir;
  dbedtNome.SetFocus;
end;

procedure TCadastroClientes_FRM.FormShow(Sender: TObject);
begin
  TCadastroCliente.Abrir;

end;

procedure TCadastroClientes_FRM.btnCancelarClick(Sender: TObject);
begin
  TCadastroCliente.Cancelar;
end;

procedure TCadastroClientes_FRM.btnGravarClick(Sender: TObject);
begin
  TCadastroCliente.Gravar;
end;

procedure TCadastroClientes_FRM.btnExcluirClick(Sender: TObject);
begin
  TCadastroCliente.Excluir;
end;

procedure TCadastroClientes_FRM.btnExportarClick(Sender: TObject);
begin
  //Após a criação do arquivo, perguintar se quer exportar.

  Screen.Cursor := crHourGlass;

  TCadastroCliente.ExportarXML(
      txtConfigEmailRemetente.Text
      , txtConfigSenha.Text, txtConfigHost.Text
      , txtConfigPorta.Text, txtConfigEmailDestinatario.Text
    );
  Screen.Cursor := crDefault;

end;

procedure TCadastroClientes_FRM.dbedtCEPExit(Sender: TObject);
var
  objBiblioteca : TBiblioteca;
begin
  Screen.Cursor := crHourGlass;
  objBiblioteca := TBiblioteca.Create;
  try
    if trim(dtmdlCadastroCliente.cdsCadastroClienteCEP.AsString) <> '' then
    begin
      if objBiblioteca.pesquisarCEP(dtmdlCadastroCliente.cdsCadastroClienteCEP.AsString) then
      begin
        dtmdlCadastroCliente.cdsCadastroClienteLogradouro.AsString := objBiblioteca.Logradouro;
        dtmdlCadastroCliente.cdsCadastroClienteComplemento.AsString := objBiblioteca.Complemento;
        dtmdlCadastroCliente.cdsCadastroClienteBairro.AsString := objBiblioteca.Bairro;
        dtmdlCadastroCliente.cdsCadastroClienteCidade.AsString := objBiblioteca.Cidade;
        dtmdlCadastroCliente.cdsCadastroClienteEstado.AsString := objBiblioteca.UF;
        dtmdlCadastroCliente.cdsCadastroClientePais.AsString := 'Brasil';
        dtmdlCadastroCliente.cdsCadastroClienteTelefone.AsString := objBiblioteca.DDD;
      end;
    end;
    Screen.Cursor := crDefault;
  except
    Screen.Cursor := crDefault;
    ShowMessage('Erro ao pesquisar CEP.');
  end;

  FreeAndNil(objBiblioteca);
end;

procedure TCadastroClientes_FRM.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  TCadastroCliente.Fechar;
end;

procedure TCadastroClientes_FRM.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  //Ao precionar o enter, mudar de campo
  if Key = #13 then
  begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;

end;

end.
