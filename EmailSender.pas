unit EmailSender;

interface

uses Xml.XMLDoc, Xml.XMLIntf, Datasnap.DBClient, Data.DB, System.Classes,
     IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, IdBaseComponent,
     IdMessage, IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase,
     IdSMTP, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
     IdSSLOpenSSL, IdAttachmentMemory, IdText, System.SysUtils;

type
  TEmailSender = class
  private
    { Private declarations }
    cdsDados: TClientDataSet;
    function GerarXML: TMemoryStream;
    function GerarTexto: String;
  public
    { Public declarations }
    constructor Create(cds: TClientDataSet);
    function EnviarEmail: Boolean;
  end;

implementation

{ TXMLWriter }

constructor TEmailSender.Create(cds: TClientDataSet);
begin
   Self.cdsDados := cds;
end;

function TEmailSender.EnviarEmail: Boolean;
var
   stream: TStream;
   XML: IXMLDocument;
   idMsg: TIdMessage;
   IdText: TIdText;
   idSMTP: TIdSMTP;
   Attachment: TIdAttachmentMemory;
   IdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL;
   texto: String;
begin
   try
      XML := TXMLDocument.Create(nil);
      XML.LoadFromStream(GerarXML);

      texto := GerarTexto;

      try
         IdSSLIOHandlerSocket := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
         IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
         IdSSLIOHandlerSocket.SSLOptions.Mode := sslmClient;

         idMsg := TIdMessage.Create(nil);
         idMsg.CharSet := 'utf-8';
         idMsg.Encoding := meMIME;
         idMsg.From.Name := 'Cadastro de Cliente';
         idMsg.From.Address := 'test.infosistemas@gmail.com';
         idMsg.Priority := mpNormal;
         idMsg.Subject := 'Cliente cadastrado com sucesso!';

         idMsg.Recipients.Add;
         idMsg.Recipients.EMailAddresses := Self.cdsDados.FieldByName('email').AsString;

         idText := TIdText.Create(idMsg.MessageParts);
         idText.Body.Add(texto);
         //idText.ContentType := 'multipart/mixed';
         IdText.ContentType := 'text/html; text/plain; charset=iso-8859-1';

         IdSMTP := TIdSMTP.Create(nil);
         IdSMTP.IOHandler := IdSSLIOHandlerSocket;
         IdSMTP.UseTLS := utUseImplicitTLS;
         IdSMTP.AuthType := satDefault;
         IdSMTP.Host := 'smtp.gmail.com';
         IdSMTP.Port := 465;
         IdSMTP.Username := 'test.infosistemas@gmail.com';
         IdSMTP.Password := 'AAA@12345';

         Attachment := TIdAttachmentMemory.Create(idMsg.MessageParts);
         Attachment.ContentType := 'application/xml';
         Attachment.FileName := 'Cadastro.xml';
         stream := Attachment.PrepareTempStream;
         try
            XML.SaveToStream(stream);
         finally
            Attachment.FinishTempStream;
         end;

         IdSMTP.Connect;
         IdSMTP.Authenticate;

         if IdSMTP.Connected then
         begin
            try
               IdSMTP.Send(idMsg);
            except on
               E: Exception do
                  raise Exception.Create('Erro ao enviar email.');
            end;
         end;

         if IdSMTP.Connected then
            IdSMTP.Disconnect;

         Result := True;
      finally
         UnLoadOpenSSLLibrary;

         FreeAndNil(idMsg);
         FreeAndNil(IdSSLIOHandlerSocket);
         FreeAndNil(idSMTP);
      end;
   except
      on e: Exception do
         raise Exception.Create(e.Message);
   end;
end;

function TEmailSender.GerarTexto: String;
var
   i: Integer;
begin
   Result := '<b>Cliente cadastrado com sucesso!</b><br/><br/>';

   for i := 0 to cdsDados.FieldDefs.Count -1 do
   begin
      Result := Result + '<b>' + cdsDados.FieldDefs.Items[i].Name + '</b>: ' + cdsDados.FieldByName(cdsDados.FieldDefs.Items[i].Name).AsString + '<br/>';
   end;
end;

function TEmailSender.GerarXML: TMemoryStream;
var
   i: Integer;
   ms: TMemoryStream;
   XML: IXMLDocument;
   RootNode, ChildNode: IXMLNode;
begin
   try
      XML := NewXMLDocument;
      XML.Encoding := 'utf-8';
      XML.Options := [doNodeAutoIndent];

      RootNode := XML.AddChild('Cliente');

      for i := 0 to cdsDados.FieldDefs.Count -1 do
      begin
         ChildNode := RootNode.AddChild(cdsDados.FieldDefs.Items[i].Name);
         ChildNode.Text := cdsDados.FieldByName(cdsDados.FieldDefs.Items[i].Name).AsString;
      end;

      ms := TMemoryStream.Create;
      XML.SaveToStream(ms);

      Result := ms;
   except
      on e: Exception do
         raise Exception.Create('Erro ao gerar anexo.');
   end;
end;

end.
