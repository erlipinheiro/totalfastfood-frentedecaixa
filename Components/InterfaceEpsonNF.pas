unit InterfaceEpsonNF;

interface
  function ConfiguraTaxaSerial (dwTaxa:Integer):Integer; StdCall; External 'InterfaceEpsonNF.dll';
  Function IniciaPorta (pszPorta:PAnsiChar):Integer; StdCall; External 'InterfaceEpsonNF.dll';
  function FechaPorta ():Integer; StdCall; External 'InterfaceEpsonNF.dll';
  function ImprimeTexto(pszTexto:PAnsiChar):Integer; StdCall; External 'InterfaceEpsonNF.dll';
  function ImprimeTextoTag(pszTexto:PAnsiChar):Integer; StdCall; External 'InterfaceEpsonNF.dll';
  function FormataTX(psxTexto:PAnsiChar; dwTipoLetra:Integer; dwItalico:Integer; dwSublinhado:Integer; dwExpandido:Integer; dwEnfatizado:Integer):Integer; StdCall; External 'InterfaceEpsonNF.dll';
  function AcionaGuilhotina (dwTipoCorte:Integer):Integer; StdCall; External 'InterfaceEpsonNF.dll';
  function ComandoTX( pszComando:PAnsiChar; dwTamanho:Integer):Integer;StdCall; External 'InterfaceEpsonNF.dll';
  function Le_Status():Integer;StdCall; External 'InterfaceEpsonNF.dll';
  function Le_Status_Gaveta ():Integer; StdCall; External 'InterfaceEpsonNF.dll';
  function ConfiguraCodigoBarras (dwAltura:Integer; dwLargura:Integer; dwHRI:Integer; dwFonte:Integer; dwMargem:Integer):Integer;StdCall; External 'InterfaceEpsonNF.dll';
  function ImprimeCodigoBarrasCODABAR(pszCodigo:PAnsiChar):Integer;StdCall; External 'InterfaceEpsonNF.dll';
  function ImprimeCodigoBarrasCODE128 (pszCodigo:PAnsiChar):Integer; StdCall; External 'InterfaceEpsonNF.dll';
  function ImprimeCodigoBarrasCODE39( pszCodigo:PAnsiChar ):Integer; StdCall; External 'InterfaceEpsonNF.dll';
  function ImprimeCodigoBarrasCODE93( pszCodigo:PAnsiChar ):Integer; StdCall; External 'InterfaceEpsonNF.dll';
  function ImprimeCodigoBarrasEAN13( pszCodigo:PAnsiChar ):Integer; StdCall; External 'InterfaceEpsonNF.dll';
  function ImprimeCodigoBarrasEAN8( pszCodigo:PAnsiChar ):Integer; StdCall; External 'InterfaceEpsonNF.dll';
  function ImprimeCodigoBarrasITF( pszCodigo:PAnsiChar ):Integer; StdCall; External 'InterfaceEpsonNF.dll';
  function ImprimeCodigoBarrasUPCA( pszCodigo:PAnsiChar ):Integer; StdCall; External 'InterfaceEpsonNF.dll';
  function ImprimeCodigoBarrasUPCE( pszCodigo:PAnsiChar ):Integer; StdCall; External 'InterfaceEpsonNF.dll';
  function ImprimeCodigoBarrasPDF417( dwCorrecao:Integer; dwAltura:Integer; dwLargura:Integer; dwColunas:Integer; pszCodigo:PAnsiChar ):Integer; StdCall; External 'InterfaceEpsonNF.dll';
  function ImprimeCodigoQRCODE(dwRestauracao:Integer; dwModulo:Integer; dwTipo:Integer; dwVersao:Integer; dwModo:Integer; pszCodigo:PAnsiChar ):Integer; StdCall; External 'InterfaceEpsonNF.dll';
  function GerarQRCodeArquivo(pszFileName:PAnsiChar; pszDados:PAnsiChar ):Integer; StdCall; External 'InterfaceEpsonNF.dll';
  function ImprimeBmpEspecial(pszFileName:PAnsiChar; dwX:Integer; dwY:Integer; dwAngulo:Integer):Integer; StdCall; External 'InterfaceEpsonNF.dll';
  function Habilita_Log(dwEstado:Integer; pszCaminho:PAnsiChar):Integer;StdCall; External 'InterfaceEpsonNF.dll';
implementation

end.
