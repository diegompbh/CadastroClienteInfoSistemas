unit ReaderCepAPI;

interface

uses System.SysUtils, StrUtils, REST.Client, REST.Types, System.JSON;

type
  TReaderCepAPI = class
    RESTClient: TRESTClient;
    RESTRequest: TRESTRequest;
  private
    { Private declarations }
    baseURL: String;
    objCEP: TJSONObject;
  public
    { Public declarations }
    constructor Create(baseURL: String);
    function ReadJSON(cep: String): Boolean;
    function GetCEP: String;
    function GetLogradouro: String;
    function GetComplemento: String;
    function GetBairro: String;
    function GetLocalidade: String;
    function GetUF: String;
    function GetIBGE: String;
    function GetGIA: String;
    function GetDDD: String;
    function GetSIAFI: String; 
    function GetPais: String;
  end;

  InvalidFormatException = class(Exception);
  APIReaderError = class(Exception);

implementation

{ TReadAPI }

constructor TReaderCepAPI.Create(baseURL: String);
begin
   Self.baseURL := baseURL;
   RESTClient := TRESTClient.Create('');

   RESTRequest := TRESTRequest.Create(nil);
   RESTRequest.Method := TRESTRequestMethod.rmGET;
   RESTRequest.Client := RESTClient;
end;

function TReaderCepAPI.ReadJSON(cep: String): Boolean;
var
   objResult: TJSONObject;
begin
   try
      if Self.objCEP <> nil then
         FreeAndNil(objCEP);
   
      if (cep.Length <> 8) or (StrToIntDef(cep, -1) = -1) then
         raise InvalidFormatException.Create('CEP inválido.');

      RESTClient.BaseURL := Self.baseURL + '/' + cep + '/json';
      RESTRequest.Execute;  

      if RESTRequest.Response.Status.SuccessOK_200 then
      begin
         objResult := RESTRequest.Response.JSONValue as TJSONObject;

         if objResult.GetValue('erro') <> nil then
            raise Exception.Create('')
         else
         begin
            Self.objCEP := objResult;
            Result := True;
         end;
      end
      else
         raise APIReaderError.Create('CEP não encontrado.');
   except 
      on e: InvalidFormatException do
         raise Exception.Create(e.Message);
      on e: APIReaderError do
         raise Exception.Create(e.Message);
      on e: Exception do
         raise Exception.Create('Ocorreu um erro ao carregar o CEP.');
   end;
end;

function TReaderCepAPI.GetBairro: String;
begin
   Result := IfThen(objCEP <> nil, objCEP.GetValue('bairro').Value, EmptyStr);      
end;

function TReaderCepAPI.GetCEP: String;
begin
   Result := IfThen(objCEP <> nil, objCEP.GetValue('cep').Value, EmptyStr);      
end;

function TReaderCepAPI.GetComplemento: String;
begin
   Result := IfThen(objCEP <> nil, objCEP.GetValue('complemento').Value, EmptyStr);      
end;

function TReaderCepAPI.GetDDD: String;
begin
   Result := IfThen(objCEP <> nil, objCEP.GetValue('ddd').Value, EmptyStr);      
end;

function TReaderCepAPI.GetGIA: String;
begin
   Result := IfThen(objCEP <> nil, objCEP.GetValue('gia').Value, EmptyStr);      
end;

function TReaderCepAPI.GetIBGE: String;
begin
   Result := IfThen(objCEP <> nil, objCEP.GetValue('ibge').Value, EmptyStr);      
end;

function TReaderCepAPI.GetLocalidade: String;
begin
   Result := IfThen(objCEP <> nil, objCEP.GetValue('localidade').Value, EmptyStr);      
end;

function TReaderCepAPI.GetLogradouro: String;
begin
   Result := IfThen(objCEP <> nil, objCEP.GetValue('logradouro').Value, EmptyStr);      
end;

function TReaderCepAPI.GetPais: String;
begin
   // Se retornou dados para um CEP brasileiro, logo o país é Brasil
   Result := IfThen(objCEP <> nil, 'Brasil', EmptyStr);         
end;

function TReaderCepAPI.GetSIAFI: String;
begin
   Result := IfThen(objCEP <> nil, objCEP.GetValue('siafi').Value, EmptyStr);      
end;

function TReaderCepAPI.GetUF: String;
begin
   Result := IfThen(objCEP <> nil, objCEP.GetValue('uf').Value, EmptyStr);      
end;

end.
