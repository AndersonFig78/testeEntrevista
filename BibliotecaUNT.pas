unit BibliotecaUNT;

interface

uses
  SysUtils, Classes, StrUtils, Wininet, Dialogs, Controls
  , ACBrBase, ACBrMail, ACBrCEP, JSON, REST.Client;

type
  TBiblioteca = class
  private
    msLogradouro : string;
    msComplemento : string;
    msBairro : string;
    msCidade : string;
    msUF : string;
    msIBGE : string;
    msDDD : string;
    function DownloadURL(const aUrl: string; var s: UTF8String): Boolean;
    //function restURL(const aUrl: string; var s: String): Boolean;
    procedure LerJson(lsJson:UTF8String);

  public
    function pesquisarCEP(lsCEP:string):Boolean;
    property Logradouro : string read msLogradouro;
    property Complemento : string read msComplemento;
    property Bairro : string read msBairro;
    property Cidade : string read msCidade;
    property UF : string read msUF;
    property IBGE : string read msIBGE;
    property DDD : string read msDDD;

    function Envia_EMail(
         EmailRemetente, NomeRemetente,
         EmailDestinatario, Assunto,
         Mensagem, EmailCopiaOculta,
         Login, Senha, SmtpHost, PortaSMTP,
         NomeArquivo, CaminhoArquivo : string;
         Stream : TStream
         ): boolean;

  end;


implementation

{ TBiblioteca }

uses CadastroClientesFRM;

function TBiblioteca.DownloadURL(const aUrl: string; var s: UTF8String): Boolean;
var
  hSession: HINTERNET;
  hService: HINTERNET;
  lpBuffer: array[0..1024 + 1] of Char;

  dwBytesRead: Cardinal;

  ContentChunk : UTF8String;
  BytesInChunk: Cardinal;
begin
  //Fonte https://www.swissdelphicenter.ch/en/showcode.php?id=412
  Result := False;
  s := '';
  // hSession := InternetOpen( 'MyApp', INTERNET_OPEN_TYPE_DIRECT, nil, nil, 0);
  hSession := InternetOpen('MyApp', INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
  try
    if Assigned(hSession) then
    begin
      hService := InternetOpenUrl(hSession, PChar(aUrl), nil, 0, INTERNET_FLAG_RELOAD, 0);
      if Assigned(hService) then
        try
          while True do
          begin
            dwBytesRead := 1024;
            InternetReadFile(hService, @lpBuffer, 1024, dwBytesRead);

            if dwBytesRead = 0 then break;
            //lpBuffer[dwBytesRead] := #0;
            //s := s + UTF8ToString(lpBuffer);//UTF8Decode(lpBuffer);
            s := s + PAnsiChar(@lpBuffer[1]);
          end;
          Result := True;
        finally
          InternetCloseHandle(hService);
        end;
    end;
  finally
    InternetCloseHandle(hSession);
  end;
end;


function TBiblioteca.Envia_EMail
(
  EmailRemetente, NomeRemetente,
  EmailDestinatario, Assunto,
  Mensagem, EmailCopiaOculta,
  Login, Senha, SmtpHost, PortaSMTP,
  NomeArquivo, CaminhoArquivo : string;
  Stream : TStream
): boolean;
var
  ACBrMail_fcu : TACBrMail;
begin
  ACBrMail_fcu :=  TACBrMail.Create(nil);
  ACBrMail_fcu.Clear;
  ACBrMail_fcu.IsHTML := true;
  ACBrMail_fcu.From           := EmailRemetente;
  ACBrMail_fcu.FromName       := NomeRemetente;
  ACBrMail_fcu.Host           := SmtpHost;
  ACBrMail_fcu.Username       := Login;
  ACBrMail_fcu.Password       := Senha;
  ACBrMail_fcu.Port           := PortaSMTP;
  ACBrMail_fcu.SetTLS         := true;
  ACBrMail_fcu.SetSSL         := true;
  ACBrMail_fcu.DefaultCharset := TMailCharset.UTF_8;
  ACBrMail_fcu.IDECharset     := TMailCharset.UTF_8;
  ACBrMail_fcu.Subject        := Assunto;
  ACBrMail_fcu.AddAddress(    EmailDestinatario,
                           '');

  if CaminhoArquivo <> '' then
    ACBrMail_fcu.AddAttachment(CaminhoArquivo, NomeArquivo, adAttachment)
  else
    ACBrMail_fcu.AddAttachment(Stream, NomeArquivo, adAttachment);

  ACBrMail_fcu.Body.Text := Mensagem;
  try
    //ACBrMail_fcu.Send;
   ACBrMail_fcu.Send(false);
   //apos enviar - processa a ACBrMail_fcuAfterMailProcess
   Result := True;
  except
    Result := false;
  end;
  ACBrMail_fcu.Free;

end;



procedure TBiblioteca.LerJson(lsJson: UTF8String);
var
  jObject : TJSONObject;
begin

  //fonte https://stackoverflow.com/questions/24815625/parsing-valid-json-with-tjsonobject-using-embarcadero-code-example-fails-with-ex

  msLogradouro  := '';
  msComplemento := '';
  msBairro      := '';
  msCidade      := '';
  msUF          := '';
  msIBGE        := '';
  msDDD         := '';

  jObject:= TJSONObject.Create();

  if jObject.Parse(BytesOf('{'+lsJson+'}'),0) >= 0 then
  begin
    //Carregar variáveis das propriedades
    msLogradouro  := UTF8Decode(jObject.GetValue<string>('logradouro'));
    msComplemento := UTF8Decode(jObject.GetValue<string>('complemento'));
    msBairro      := UTF8Decode(jObject.GetValue<string>('bairro'));
    msCidade      := UTF8Decode(jObject.GetValue<string>('localidade'));
    msUF          := UTF8Decode(jObject.GetValue<string>('uf'));
    msIBGE        := UTF8Decode(jObject.GetValue<string>('ibge'));
    msDDD         := UTF8Decode(jObject.GetValue<string>('ddd'));
  end;
  jObject.Free;

end;

function TBiblioteca.pesquisarCEP(lsCEP: string): Boolean;
var
  lsURL : string;
  lsResultado : UTF8String;
  ACBrCEP : tACBrCEP;
begin
  lsURL := 'https://viacep.com.br/ws/'+lsCEP+'/json/';

  //restURL(lsURL, lsResultado);
  if DownloadURL(lsURL, lsResultado) then
  begin
    LerJson(lsResultado);
    Result := true;
  end
  else
    Result := false;
    
end;



//function TBiblioteca.restURL(const aUrl: string; var s: String): Boolean;
//var
//  requestOBJ : TRESTRequest;
//  clientOBJ : TRESTClient;
//  jValue : TJSONValue;
//begin
//  requestOBJ := TRESTRequest.Create(nil);
//  clientOBJ := TRESTClient.Create(nil);
//
//  clientOBJ.BaseURL := aUrl;
//  clientOBJ.FallbackCharsetEncoding := 'utf-8';
//
//  requestOBJ.Client := clientOBJ;
//  requestOBJ.Execute;
//  s:= requestOBJ.Resource;
//end;

end.
