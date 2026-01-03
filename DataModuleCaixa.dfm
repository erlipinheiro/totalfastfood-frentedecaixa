object dmCaixa: TdmCaixa
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 651
  Width = 1216
  object qryAuxiliar: TFDQuery
    Connection = dbTotalFastFood
    SQL.Strings = (
      'DBCC USEROPTIONS')
    Left = 193
    Top = 34
  end
  object qryviewProdutosRelacionadosListaPreco: TFDQuery
    Connection = dbTotalFastFood
    FetchOptions.AssignedValues = [evRecordCountMode, evUnidirectional, evAutoFetchAll]
    FetchOptions.Unidirectional = True
    FetchOptions.AutoFetchAll = afDisable
    FetchOptions.RecordCountMode = cmTotal
    SQL.Strings = (
      'select * from viewProdutosRelacionadosListaPreco with (nolock)'
      'where 1=0')
    Left = 588
    Top = 34
  end
  object qryviewProdutosListaPreco: TFDQuery
    AutoCalcFields = False
    Connection = dbTotalFastFood
    FetchOptions.AssignedValues = [evRecordCountMode, evUnidirectional, evAutoFetchAll]
    FetchOptions.Unidirectional = True
    FetchOptions.AutoFetchAll = afDisable
    FetchOptions.RecordCountMode = cmTotal
    SQL.Strings = (
      'select * from viewprodutosListaPreco with (nolock)')
    Left = 358
    Top = 34
  end
  object dbTotalFastFood: TFDConnection
    Params.Strings = (
      'Database=ciadochopp'
      'User_Name=sa'
      'Password=data.server04'
      'Server=45.163.65.17'
      'MARS=YES'
      'DriverID=MSSQL')
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SourceDataType = dtDateTimeStamp
        TargetDataType = dtDateTime
      end
      item
        SourceDataType = dtFmtBCD
        TargetDataType = dtDouble
      end>
    LoginPrompt = False
    Transaction = FDTransaction1
    Left = 74
    Top = 26
  end
  object dspviewProdutosListaPreco: TDataSetProvider
    DataSet = qryviewProdutosListaPreco
    Left = 358
    Top = 79
  end
  object cdsviewProdutosListaPreco: TClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspviewProdutosListaPreco'
    Left = 358
    Top = 126
  end
  object dspviewProdutosRelacionadosListaPreco: TDataSetProvider
    DataSet = qryviewProdutosRelacionadosListaPreco
    Left = 492
    Top = 495
  end
  object cdsviewProdutosRelacionadosListaPreco: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspviewProdutosRelacionadosListaPreco'
    Left = 588
    Top = 124
  end
  object dsAuxiliar: TDataSource
    DataSet = qryAuxiliar
    Left = 193
    Top = 79
  end
  object qryProdutosComposicaoTicketFracionado: TFDQuery
    AutoCalcFields = False
    Connection = dbTotalFastFood
    FetchOptions.AssignedValues = [evRecordCountMode, evUnidirectional, evAutoFetchAll]
    FetchOptions.Unidirectional = True
    FetchOptions.AutoFetchAll = afDisable
    FetchOptions.RecordCountMode = cmTotal
    SQL.Strings = (
      '/****** Script for SelectTopNRows command from SSMS  ******/'
      'SELECT idProduto'
      '      ,DescricaoProdutoComposicao'
      '      ,Qtde'
      '      ,EmitirTicket'
      '      ,EmitirTicketFracionado'
      
        '  FROM viewProdutoComposicao with (nolock) where EmitirTicket = ' +
        '1'
      
        '  and idProduto in (select idProduto from Vendas.EmpresaProdutos' +
        ' where idEmpresa = 21)'
      'and 1=0')
    Left = 358
    Top = 189
  end
  object dspProdutosComposicaoTicketFracionado: TDataSetProvider
    DataSet = qryProdutosComposicaoTicketFracionado
    Left = 358
    Top = 234
  end
  object cdsProdutosComposicaoTicketFracionado: TClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspviewProdutos'
    Left = 358
    Top = 279
  end
  object qryTotalVendaPeriodo: TFDQuery
    Connection = dbTotalFastFood
    SQL.Strings = (
      'DECLARE @t TIME(7) = '#39'23:59:59:000'#39';'
      'declare @datainicial as date;'
      'declare @datafinal as date;'
      ''
      'select @datainicial = :DataInicial;'
      
        'select @datafinal = DATEADD(SECOND, DATEDIFF(SECOND, 0, @t), :Da' +
        'taFinal);'
      ''
      
        'select sum(c.Valor) from vendas.contas c inner join Vendas.Conta' +
        'Pagamentos cp on c.idEmpresa = cp.idEmpresa'
      
        'and c.idCaixa = cp.idCaixa and c.idSessaoCaixa = cp.idSessaoCaix' +
        'a and c.idConta = cp.idConta and cp.idFormaPagamento <> -1 '
      
        'where c.idEmpresa = :idEmpresa and  c.datafim between @DataInici' +
        'al and @datafinal')
    Left = 194
    Top = 356
    ParamData = <
      item
        Name = 'DataInicial'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'DataFinal'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'idEmpresa'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object qryItensImprimir: TFDQuery
    Connection = dbTotalFastFood
    SQL.Strings = (
      'declare @idEmpresa int;'
      'declare @idCaixa int;'
      'declare @idConta int;'
      'declare @ImprimirConta bit'
      ''
      'set @idEmpresa = :idEmpresa;'
      'set @idCaixa = :idCaixa;'
      'set @idConta = :idConta;'
      'set @ImprimirConta = :ImprimirConta;'
      ''
      
        'with conta (Linha, idConta, idPedido, idItem, idItemPai, IDTIPOR' +
        'ELACIONAMENTO, idProduto, vlProduto, qtde, idImpressoraItem, Nom' +
        'eImpressoraItem, FilaImpressaoItem, idTipoImpressoraItem,'
      
        #9'  EmitirBeepItem, NumeroVezesBeepItem, DuracaoBeepItem, Interva' +
        'loBeepItem, NumeroColunasItem, NumeroColunasCondensadoItem) as ('
      
        #9'select 1 as linha, idConta, idPedido, idItem, idItem, IDTIPOREL' +
        'ACIONAMENTO, idProduto, vlProduto, qtde, idImpressoraItem, Descr' +
        'icaoImpressora as NomeImpressoraItem, FilaImpressaoItem, idTipoI' +
        'mpressoraItem,'
      
        #9'  EmitirBeepItem, NumeroVezesBeepItem, DuracaoBeepItem, Interva' +
        'loBeepItem, NumeroColunasItem, NumeroColunasCondensadoItem from ' +
        'ViewItens i where '
      
        '           i.idEmpresa = @idEmpresa and i.idCaixa = @idCaixa and' +
        ' i.idConta = @idConta and idItemPai is null and ((i.DataHoraImpr' +
        'essao is null) or (@ImprimirConta = 1))'
      'union all'
      
        #9'select linha + 1 as Linha, F.idConta, F.idPedido, F.idItem, F.i' +
        'dItemPai, F.IDTIPORELACIONAMENTO, F.idProduto, F.vlProduto, F.qt' +
        'de, F.idImpressoraItem, F.NomeImpressoraItem, F.FilaImpressaoIte' +
        'm, F.idTipoImpressoraItem,'
      
        #9'  F.EmitirBeepItem, F.NumeroVezesBeepItem, F.DuracaoBeepItem, F' +
        '.IntervaloBeepItem, F.NumeroColunasItem, F.NumeroColunasCondensa' +
        'doItem  from conta '
      '           inner join viewItens as F on '
      
        #9' F.idEmpresa = @idEmpresa and F.idCaixa = @idCaixa and F.idCont' +
        'a = conta.idConta and conta.idItem = F.idItemPai and ((F.DataHor' +
        'aImpressao is null) or (@ImprimirConta = 1))'
      ')'
      ''
      'select '
      #9'Conta.idConta,'
      #9'idItem,'
      '        idItemPai, '
      #9'idTipoRelacionamento,'
      #9'Conta.idProduto, '
      #9'Qtde, '
      '        vep.DescricaoProduto as Descricao,'
      #9'vep.DescricaoReduzida,'
      '        vlProduto,'
      #9'ped.idPedido,'
      #9'ped.HoraInicio, '
      #9'ped.horaFim,'
      
        #9'case when idImpressoraItem is null then idImpressora else idImp' +
        'ressoraItem end as idImpressora, '
      
        #9'case when NomeImpressoraItem is null then DescricaoImpressora e' +
        'lse NomeImpressoraItem end as NomeImpressora, '
      
        #9'case when FilaImpressaoItem is null then FilaImpressao else Fil' +
        'aImpressaoItem end as FilaImpressao, '
      
        #9'case when idTipoImpressoraItem is null then idTipoImpressora el' +
        'se idTipoImpressoraItem end as idTipoImpressora, '
      
        #9'case when EmitirBeepItem is null then EmitirBeep else EmitirBee' +
        'pItem end as EmitirBeep, '
      
        #9'case when NumeroVezesBeepItem is null then NumeroVezesBeep else' +
        ' NumeroVezesBeepItem end as NumeroVezesBeep, '
      
        #9'case when DuracaoBeepItem is null then DuracaoBeep else Duracao' +
        'BeepItem end as DuracaoBeep, '
      
        #9'case when IntervaloBeepItem is null then IntervaloBeep else Int' +
        'ervaloBeepItem end as IntervaloBeep, '
      
        #9'case when NumeroColunasItem is null then NumeroColunas else Num' +
        'eroColunasItem end as NumeroColunas, '
      
        #9'case when NumeroColunasCondensadoItem is null then NumeroColuna' +
        'sCondensado else NumeroColunasCondensadoItem end as NumeroColuna' +
        'sCondensado, '
      
        #9'(case when exists (select 1 from produtos.ProdutoComposicao whe' +
        're idProduto = conta.idProduto and (EmitirTicket = 1 or EmitirTi' +
        'cketFracionado = 1))'
      #9#9'then 1'
      #9#9'else 0'
      #9' end) as ExisteFracionado,'
      
        #9'(case when exists (select 1 from Vendas.Itens as filhos where i' +
        'dItemPai = conta.idItem) '
      #9#9'then 1'
      #9#9'else 0'
      #9' end) as TemFilhos '
      'from conta WITH (NOLOCK) '
      
        'inner join viewEmpresaProdutos vep on vep.idEmpresa = @idEmpresa' +
        ' and Conta.idProduto = vep.idProduto and ((vep.ImprimirPedido=1)' +
        ' or (@ImprimirConta = 1))'
      
        'inner join Vendas.Pedidos ped on ped.idEmpresa = @idEmpresa and ' +
        'conta.idPedido = ped.idPedido '
      
        'order by vep.FilaImpressao, ExisteFracionado, idItemPai, Linha, ' +
        'IDTIPORELACIONAMENTO')
    Left = 354
    Top = 356
    ParamData = <
      item
        Name = 'idEmpresa'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'idCaixa'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'idConta'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'IMPRIMIRCONTA'
        DataType = ftBoolean
        ParamType = ptInput
      end>
  end
  object qryConferencia: TFDQuery
    Connection = dbTotalFastFood
    SQL.Strings = (
      
        'select Descricao, vlProduto as ValorUnitario, Qtde  from viewite' +
        'ns v '
      
        'where idEmpresa = :idEmpresa and idCaixa = :idCaixa and idconta ' +
        '= :idConta '
      'order by iditem')
    Left = 586
    Top = 380
    ParamData = <
      item
        Name = 'idEmpresa'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'idCaixa'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'idConta'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object qryProdutoObservacoes: TFDQuery
    AutoCalcFields = False
    Connection = dbTotalFastFood
    SQL.Strings = (
      'select * from Produtos.ProdutoObservacoes po with (nolock)'
      
        'inner join Produtos.Observacoes o with (nolock) on po.idObservac' +
        'ao = o.idObservacao'
      'order by idProduto, ordem')
    Left = 588
    Top = 189
  end
  object dspProdutoObservacoes: TDataSetProvider
    DataSet = qryProdutoObservacoes
    Left = 588
    Top = 234
  end
  object cdsProdutoObservacoes: TClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspProdutoObservacoes'
    Left = 588
    Top = 279
  end
  object FDTransaction1: TFDTransaction
    Connection = dbTotalFastFood
    Left = 72
    Top = 240
  end
  object qryItens: TFDQuery
    Connection = dbTotalFastFood
    SQL.Strings = (
      'select * from viewItens where 1=0')
    Left = 66
    Top = 316
  end
  object qryConferenciaTotalizado: TFDQuery
    Connection = dbTotalFastFood
    SQL.Strings = (
      ';with Conferencia(idConta, Descricao, ValorUnitario, Qtde) as'
      '('
      'select idConta, Descricao, '
      '  case when idTipoRelacionamento = -1 then'
      
        '      vlProduto + case when (select sum(vlproduto) from vendas.i' +
        'tens where idconta = v.idconta and idItemPai = v.idItem) is null' +
        ' then'
      #9'            0'
      '                  else'
      
        #9#9'    (select sum(vlproduto) from vendas.itens where idconta = v' +
        '.idconta and idItemPai = v.idItem)'
      #9#9'  end'
      '  else'
      '    vlproduto'
      '  end, '
      'sum(qtde) '
      'from viewitens v '
      
        'where idEmpresa = :idEmpresa and idCaixa = :idCaixa and idconta ' +
        '= :idConta and idTipoRelacionamento = -1 '
      
        'group by idconta, iditem, idTipoRelacionamento, descricao, vlpro' +
        'duto'
      ')'
      ''
      
        'select Descricao, ValorUnitario, Sum(Qtde) as Qtde from Conferen' +
        'cia '
      'group by descricao, valorunitario')
    Left = 586
    Top = 436
    ParamData = <
      item
        Name = 'idEmpresa'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'idCaixa'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'idConta'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object qryPermissoes: TFDQuery
    Connection = dbTotalFastFood
    SQL.Strings = (
      'declare @idUsuario int = :idUsuario;'
      'declare @idEmpresa int = :idEmpresa;'
      
        'select distinct p.idControle, c.Descricao, c.idControlePai, Perm' +
        'itir, c.EhMenu '
      'from seguranca.Permissoes p '
      'inner join Seguranca.Controles c on p.idcontrole = c.idControle '
      
        'where p.idEmpresa = @idEmpresa and c.idSistema = 2 and p.idPesso' +
        'a = @idUsuario and permitir = 1'
      'union all'
      
        'select distinct c.idControle, c.Descricao, c.idControlePai, pc.p' +
        'ermitir, c.EhMenu from Seguranca.Controles c'
      
        'inner join Seguranca.PerfilControles pc on c.idControle = pc.idC' +
        'ontrole '
      
        'where c.idSistema = 2 and pc.Permitir =1 and pc.idPerfil in (sel' +
        'ect idPerfil from Seguranca.UsuarioPerfis up where up.idEmpresa ' +
        '= @idEmpresa and up.idUsuario = @idUsuario)')
    Left = 67
    Top = 374
    ParamData = <
      item
        Name = 'IDUSUARIO'
        DataType = ftInteger
        ParamType = ptInput
        Value = 6
      end
      item
        Name = 'IDEMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = 57
      end>
  end
  object IdFTP1: TIdFTP
    OnStatus = IdFTP1Status
    Host = 'ftp.dotz.com.br'
    Passive = True
    ConnectTimeout = 0
    Password = 'Fs95#g8j'
    Username = 'ftpqgjeitinho'
    NATKeepAlive.UseKeepAlive = False
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 752
    Top = 224
  end
  object qryMTC: TFDQuery
    Connection = dbTotalFastFood
    SQL.Strings = (
      'declare @idEmpresa as int = :idEmpresa;'
      'declare @idInicial as int = :idInicial;'
      'declare @idFinal as int = :idFinal;'
      
        'declare @TC as int = (select count(1) from vendas.contas where i' +
        'dEmpresa = @idEmpresa and idCaixa between @idInicial and @idFina' +
        'l and idConvenio <> -1);'
      ''
      ';with MiniPasteis(Qtde) as ('
      'Select '
      #9'--idProduto, descricao, sum(qtde), '
      #9'case idproduto '
      #9#9'when 254 then 12'
      #9#9'when 255 then 6'
      #9#9'when 256 then 3'
      #9#9'when 257 then 12'
      #9#9'when 258 then 6'
      #9#9'when 259 then 3'
      #9#9'when 260 then 12'
      #9#9'when 261 then 6'
      #9#9'when 264 then 24'
      
        #9'end * sum(qtde) from viewitens where idEmpresa = @idEmpresa and' +
        ' idCaixa between @idInicial and @idFinal and idgrupo = 3 and des' +
        'cricao like '#39'%PORCAO%'#39
      'group by idProduto'
      ')'
      
        'select @TC as TC, sum(qtde) as QtdeMiniPasteis, sum(qtde)/12 as ' +
        'QtdePorcoes, sum (qtde)/12/@TC*1000 as MTC from MiniPasteis')
    Left = 866
    Top = 36
    ParamData = <
      item
        Name = 'IDEMPRESA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'IDINICIAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'IDFINAL'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryMTCTC: TIntegerField
      FieldName = 'TC'
      Origin = 'TC'
      ReadOnly = True
    end
    object qryMTCQtdeMiniPasteis: TFloatField
      FieldName = 'QtdeMiniPasteis'
      Origin = 'QtdeMiniPasteis'
      ReadOnly = True
    end
    object qryMTCQtdePorcoes: TFloatField
      FieldName = 'QtdePorcoes'
      Origin = 'QtdePorcoes'
      ReadOnly = True
    end
    object qryMTCMTC: TFloatField
      FieldName = 'MTC'
      Origin = 'MTC'
      ReadOnly = True
    end
  end
  object qryGrupos: TFDQuery
    Connection = dbTotalFastFood
    SQL.Strings = (
      'declare @idEmpresa as int = :idEmpresa;'
      'declare @idInicial as int = :idInicial;'
      'declare @idFinal as int = :idFinal;'
      ''
      ''
      'declare @ValorTotal as float;'
      
        'select @ValorTotal = (select sum(vlproduto*qtde)  from viewItens' +
        ' i where idEmpresa = @idEmpresa and idCaixa between @idInicial a' +
        'nd @idFinal and idconvenio <> -1 and idGrupo in (0,1,2,3,4,5,7,1' +
        '4,15))'
      ''
      
        'select '#39'Grelhados'#39' as DescricaoGrupo, '#39'$1F0A6CE4'#39' as Cor, sum(vl' +
        'produto*qtde) * 100 / @ValorTotal as valortotal from viewItens i' +
        ' '
      
        'where idEmpresa = @idEmpresa and idCaixa between @idInicial and ' +
        '@idFinal and idconvenio <> -1 and idGrupo in (1,4,14,15)'
      'union all'
      
        'select '#39'Bebidas'#39' as DescricaoGrupo, '#39'$1FC07000'#39' as Cor, sum(vlpr' +
        'oduto*qtde) * 100 / @ValorTotal  as valortotal  from viewItens i' +
        ' '
      
        'where idEmpresa = @idEmpresa and idCaixa between @idInicial and ' +
        '@idFinal and idconvenio <> -1 and idGrupo = 5'
      'union all'
      
        'select '#39'Pasteis'#39' as DescricaoGrupo, '#39'$1F50B000'#39' as Cor, sum(vlpr' +
        'oduto*qtde) * 100 / @ValorTotal  as valortotal  from viewItens i' +
        ' '
      
        'where idEmpresa = @idEmpresa and idCaixa between @idInicial and ' +
        '@idFinal and idconvenio <> -1 and idGrupo in (0,3,7)'
      'union all'
      
        'select '#39'Sanduiches'#39' as DescricaoGrupo, '#39'$1F0000FF'#39' as Cor, sum(v' +
        'lproduto*qtde) * 100 / @ValorTotal  as valortotal  from viewIten' +
        's i '
      
        'where idEmpresa = @idEmpresa and idCaixa between @idInicial and ' +
        '@idFinal and idconvenio <> -1 and idGrupo = 2')
    Left = 866
    Top = 84
    ParamData = <
      item
        Name = 'IDEMPRESA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'IDINICIAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'IDFINAL'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryGruposDescricaoGrupo: TStringField
      FieldName = 'DescricaoGrupo'
      Origin = 'DescricaoGrupo'
      ReadOnly = True
      Required = True
      Size = 10
    end
    object qryGruposCor: TStringField
      FieldName = 'Cor'
      Origin = 'Cor'
      ReadOnly = True
      Required = True
      Size = 9
    end
    object qryGruposvalortotal: TFloatField
      FieldName = 'valortotal'
      Origin = 'valortotal'
      ReadOnly = True
    end
  end
  object qryRefrigerantes: TFDQuery
    Connection = dbTotalFastFood
    SQL.Strings = (
      'declare @idEmpresa as int = :idEmpresa;'
      'declare @idInicial as int = :idInicial;'
      'declare @idFinal as int = :idFinal;'
      ''
      
        'select (select sum(qtde) from viewItens where idEmpresa = @idEmp' +
        'resa and idCaixa between @idInicial and @idFinal and idproduto i' +
        'n(291,292,293,294,295)) as r300,'
      
        '(select sum(qtde) from viewItens where idEmpresa = @idEmpresa an' +
        'd idCaixa between @idInicial and @idFinal and idproduto in(296,2' +
        '97,298,299,300)) as r500')
    Left = 866
    Top = 132
    ParamData = <
      item
        Name = 'IDEMPRESA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'IDINICIAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'IDFINAL'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryRefrigerantesr300: TFloatField
      FieldName = 'r300'
      Origin = 'r300'
      ReadOnly = True
    end
    object qryRefrigerantesr500: TFloatField
      FieldName = 'r500'
      Origin = 'r500'
      ReadOnly = True
    end
  end
  object qryCombos: TFDQuery
    Connection = dbTotalFastFood
    SQL.Strings = (
      'declare @idEmpresa as int = :idEmpresa;'
      'declare @idInicial as int = :idInicial;'
      'declare @idFinal as int = :idFinal;'
      'declare @QtdeTotal as int;'
      ''
      
        'select @QtdeTotal = (select sum(qtde) as Qtde from vendas.itens ' +
        'where idEmpresa = @idEmpresa and idCaixa between @idInicial and ' +
        '@idFinal and IDTIPORELACIONAMENTO = 5 and idProduto in (282,567,' +
        '571,610,616,613,619))'
      ''
      
        'select '#39'Batata'#39' as Combo, sum(qtde) as Qtde, sum(qtde) * 100 / @' +
        'QtdeTotal as Percentual from vendas.itens where idEmpresa = @idE' +
        'mpresa and idCaixa between @idInicial and @idFinal and IDTIPOREL' +
        'ACIONAMENTO = 5 and idProduto = 282'
      'union all'
      
        'select '#39'Pastel'#39' as Combo, sum(qtde) as Qtde, sum(qtde) * 100 / @' +
        'QtdeTotal as Percentual from vendas.itens where idEmpresa = @idE' +
        'mpresa and idCaixa between @idInicial and @idFinal and IDTIPOREL' +
        'ACIONAMENTO = 5 and idProduto in (567,571)'
      'union all'
      
        'select '#39'Sobremesa'#39' as Combo, sum(qtde) as Qtde, sum(qtde) * 100 ' +
        '/ @QtdeTotal as Percentual from vendas.itens where idEmpresa = @' +
        'idEmpresa and idCaixa between @idInicial and @idFinal and IDTIPO' +
        'RELACIONAMENTO = 5 and idProduto in (610,616,613,619)')
    Left = 866
    Top = 180
    ParamData = <
      item
        Name = 'IDEMPRESA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'IDINICIAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'IDFINAL'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryCombosCombo: TStringField
      FieldName = 'Combo'
      Origin = 'Combo'
      ReadOnly = True
      Required = True
      Size = 9
    end
    object qryCombosQtde: TFloatField
      FieldName = 'Qtde'
      Origin = 'Qtde'
      ReadOnly = True
    end
    object qryCombosPercentual: TFloatField
      FieldName = 'Percentual'
      Origin = 'Percentual'
      ReadOnly = True
    end
  end
  object qryCombosPorGrupos: TFDQuery
    Connection = dbTotalFastFood
    SQL.Strings = (
      'declare @idEmpresa as int = :idEmpresa;'
      'declare @idInicial as int = :idInicial;'
      'declare @idFinal as int = :idFinal;'
      ''
      
        ';with CombosPorGrupos (Descricao, Cor, QtdeSemCombo, QtdeComComb' +
        'o) as'
      '('
      
        'Select '#39'Geral'#39', '#39#39' as Cor, (select sum(qtde) from viewitens wher' +
        'e idEmpresa = @idEmpresa and idCaixa between @idInicial and @idF' +
        'inal and flCombo = 0 and IDTIPORELACIONAMENTO = -1 and idGrupo i' +
        'n (0, 1, 2, 14)) as QtdeSemCombo,'
      
        #9'(select sum(qtde) from viewitens where idEmpresa = @idEmpresa a' +
        'nd idCaixa between @idInicial and @idFinal and flCombo = 1 and I' +
        'DTIPORELACIONAMENTO = -1 and idGrupo in (0, 1, 2, 14)) as QtdeCo' +
        'mCombo'
      'union all'
      
        'select '#39'Grelhados'#39', '#39'$1F0A6CE4'#39' as Cor, (select sum(qtde) from v' +
        'iewitens where idEmpresa = @idEmpresa and idCaixa between @idIni' +
        'cial and @idFinal and flCombo = 0 and IDTIPORELACIONAMENTO = -1 ' +
        'and idGrupo in (1, 14)) as QtdeSemCombo,'
      
        #9'(select sum(qtde) from viewitens where idEmpresa = @idEmpresa a' +
        'nd idCaixa between @idInicial and @idFinal and flCombo = 1 and I' +
        'DTIPORELACIONAMENTO = -1 and idGrupo in (1, 14)) as QtdeComCombo'
      'union all'
      
        'select '#39'Pasteis'#39', '#39'$1F50B000'#39' as Cor, (select sum(qtde) from vie' +
        'witens where idEmpresa = @idEmpresa and idCaixa between @idInici' +
        'al and @idFinal and flCombo = 0 and IDTIPORELACIONAMENTO = -1 an' +
        'd idGrupo = 0) as QtdeSemCombo,'
      
        #9'(select sum(qtde) from viewitens where idEmpresa = @idEmpresa a' +
        'nd idCaixa between @idInicial and @idFinal and flCombo = 1 and I' +
        'DTIPORELACIONAMENTO = -1 and idGrupo = 0) as QtdeComCombo'
      'union all '
      
        'select '#39'Sanduiches'#39', '#39'$1F0000FF'#39' as Cor, (select sum(qtde) from ' +
        'viewitens where idEmpresa = @idEmpresa and idCaixa between @idIn' +
        'icial and @idFinal and flCombo = 0 and IDTIPORELACIONAMENTO = -1' +
        ' and idGrupo = 2) as QtdeSemCombo,'
      
        #9'(select sum(qtde) from viewitens where idEmpresa = @idEmpresa a' +
        'nd idCaixa between @idInicial and @idFinal and flCombo = 1 and I' +
        'DTIPORELACIONAMENTO = -1 and idGrupo = 2) as QtdeComCombo'
      ')'
      
        'select descricao, Cor, QtdeSemCombo, QtdeComCombo, QtdeComCombo ' +
        '* 100 / (QtdeSemCombo + QtdeComCombo) as Percentual from CombosP' +
        'orGrupos')
    Left = 866
    Top = 228
    ParamData = <
      item
        Name = 'IDEMPRESA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'IDINICIAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'IDFINAL'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object strngfldCombosPorGruposdescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      ReadOnly = True
      Required = True
      Size = 10
    end
    object strngfldCombosPorGruposCor: TStringField
      FieldName = 'Cor'
      Origin = 'Cor'
      ReadOnly = True
      Required = True
      Size = 9
    end
    object qryCombosPorGruposQtdeSemCombo: TFloatField
      FieldName = 'QtdeSemCombo'
      Origin = 'QtdeSemCombo'
      ReadOnly = True
    end
    object qryCombosPorGruposQtdeComCombo: TFloatField
      FieldName = 'QtdeComCombo'
      Origin = 'QtdeComCombo'
      ReadOnly = True
    end
    object qryCombosPorGruposPercentual: TFloatField
      FieldName = 'Percentual'
      Origin = 'Percentual'
      ReadOnly = True
    end
  end
  object qryVendaTotais: TFDQuery
    Connection = dbTotalFastFood
    SQL.Strings = (
      'declare @idEmpresa as int = :idEmpresa;'
      'declare @idInicial as int = :idInicial;'
      'declare @idFinal as int = :idFinal;'
      ''
      'select '
      #9'sum(valor) as Total, '
      #9'count(1) as TC, '
      #9'sum(valor)/count(1) as TM, '
      
        #9'(select sum(vlUnitario * qtde) from viewItens where (idEmpresa ' +
        '= @idEmpresa and idCaixa between @idInicial and @idFinal) and (i' +
        'dConvenio <> -1) and ((IDTIPORELACIONAMENTO =3) or ((IDTIPORELAC' +
        'IONAMENTO=-1) and (idLinha in (11,12)))) and (idProduto <> 288))' +
        '  as ValorAdicionais'
      'from vendas.contas c'
      
        'where idEmpresa = @idEmpresa and idCaixa between @idInicial and ' +
        '@idFinal and idConvenio <> -1'
      ''
      '')
    Left = 750
    Top = 431
    ParamData = <
      item
        Name = 'IDEMPRESA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'IDINICIAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'IDFINAL'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryVendaTotaisTotal: TCurrencyField
      FieldName = 'Total'
      Origin = 'Total'
      ReadOnly = True
    end
    object qryVendaTotaisTC: TIntegerField
      FieldName = 'TC'
      Origin = 'TC'
      ReadOnly = True
    end
    object qryVendaTotaisTM: TCurrencyField
      FieldName = 'TM'
      Origin = 'TM'
      ReadOnly = True
    end
    object qryVendaTotaisValorAdicionais: TFloatField
      FieldName = 'ValorAdicionais'
      Origin = 'ValorAdicionais'
      ReadOnly = True
    end
  end
  object qryProdutoPromocoes: TFDQuery
    AutoCalcFields = False
    Connection = dbTotalFastFood
    SQL.Strings = (
      'select * from viewProdutoPromocoes vpp'
      
        'inner join Vendas.EmpresaPromocoes epromo on epromo.idEmpresa=:i' +
        'dEmpresa and vpp.idPromocao = epromo.idPromocao'
      'where vpp.ativa = 1 and epromo.Ativa = 1')
    Left = 750
    Top = 279
    ParamData = <
      item
        Name = 'IDEMPRESA'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object dspProdutoPromocoes: TDataSetProvider
    DataSet = qryProdutoPromocoes
    Left = 750
    Top = 324
  end
  object cdsProdutoPromocoes: TClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspProdutoPromocoes'
    Left = 750
    Top = 369
  end
  object FDTransaction2: TFDTransaction
    Left = 70
    Top = 281
  end
  object ACBrExtenso1: TACBrExtenso
    StrMoeda = 'Real'
    StrMoedas = 'Reais'
    StrCentavo = 'Centavo'
    StrCentavos = 'Centavos'
    Left = 590
    Top = 333
  end
  object FDMoniRemoteClientLink1: TFDMoniRemoteClientLink
    Tracing = True
    Left = 352
    Top = 408
  end
  object qryEnderecos: TFDQuery
    Connection = dbTotalFastFood
    SQL.Strings = (
      'select * from viewEnderecos')
    Left = 192
    Top = 409
  end
  object dspEnderecos: TDataSetProvider
    DataSet = qryEnderecos
    Left = 192
    Top = 456
  end
  object cdsEnderecos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEnderecos'
    Left = 192
    Top = 512
  end
  object dsEnderecos: TDataSource
    DataSet = cdsEnderecos
    Left = 192
    Top = 560
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Console'
    Left = 72
    Top = 152
  end
  object qryDescontos: TFDQuery
    AutoCalcFields = False
    Connection = dbTotalFastFood
    SQL.Strings = (
      
        'select * from Vendas.retornaDescontos(:idEmpresa,:idCaixa,:idCon' +
        'ta) order by Condicao, linha')
    Left = 870
    Top = 287
    ParamData = <
      item
        Name = 'IDEMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = 2
      end
      item
        Name = 'IDCAIXA'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1378
      end
      item
        Name = 'IDCONTA'
        DataType = ftInteger
        ParamType = ptInput
        Value = 170438
      end>
  end
  object ACBrNFe1: TACBrNFe
    OnTransmitError = ACBrNFe1TransmitError
    OnGerarLog = ACBrNFe1GerarLog
    Configuracoes.Geral.SSLLib = libOpenSSL
    Configuracoes.Geral.SSLCryptLib = cryOpenSSL
    Configuracoes.Geral.SSLHttpLib = httpOpenSSL
    Configuracoes.Geral.SSLXmlSignLib = xsLibXml2
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.ModeloDF = moNFCe
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.Arquivos.SepararPorMes = True
    Configuracoes.Arquivos.EmissaoPathNFe = True
    Configuracoes.Arquivos.SalvarEvento = True
    Configuracoes.WebServices.UF = 'GO'
    Configuracoes.WebServices.Ambiente = taProducao
    Configuracoes.WebServices.AguardarConsultaRet = 40000
    Configuracoes.WebServices.IntervaloTentativas = 5000
    Configuracoes.WebServices.AjustaAguardaConsultaRet = True
    Configuracoes.WebServices.Salvar = True
    Configuracoes.WebServices.QuebradeLinha = '|'
    Configuracoes.RespTec.IdCSRT = 0
    DANFE = ACBrNFeDANFeESCPOS1
    Left = 976
    Top = 24
  end
  object ACBrNFeDANFeESCPOS1: TACBrNFeDANFeESCPOS
    Sistema = 'Projeto ACBr - www.projetoacbr.com.br'
    MargemInferior = 8.000000000000000000
    MargemSuperior = 8.000000000000000000
    MargemEsquerda = 6.000000000000000000
    MargemDireita = 5.100000000000000000
    ExpandeLogoMarcaConfig.Altura = 0
    ExpandeLogoMarcaConfig.Esquerda = 0
    ExpandeLogoMarcaConfig.Topo = 0
    ExpandeLogoMarcaConfig.Largura = 0
    ExpandeLogoMarcaConfig.Dimensionar = False
    ExpandeLogoMarcaConfig.Esticar = True
    CasasDecimais.Formato = tdetInteger
    CasasDecimais.qCom = 2
    CasasDecimais.vUnCom = 2
    CasasDecimais.MaskqCom = ',0.00'
    CasasDecimais.MaskvUnCom = ',0.00'
    CasasDecimais.Aliquota = 2
    CasasDecimais.MaskAliquota = ',0.00'
    ACBrNFe = ACBrNFe1
    TipoDANFE = tiSemGeracao
    FormularioContinuo = True
    PosPrinter = frmPrincipal.Impressora
    Left = 976
    Top = 80
  end
end
