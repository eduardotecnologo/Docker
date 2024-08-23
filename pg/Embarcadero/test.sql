RefColFamiliaPrefixoTrem SistemaCCG::recFamiliasPrefixoTremPorPainelFerroviario (RefPainelFerroviario painelFerroviario, BDTDate dataPainel, RefTipoTrem tipoTrem, BDTBoolean ativas)
{
  //## begin SistemaCCG::recFamiliasPrefixoTremPorPainelFerroviario%43145AC1028A.body preserve=yes
  if ( painelFerroviario.isNull() || dataPainel.isNull() )
  {
    familiasPrefixoTrem_->setWhere("1 = 2");
    familiasPrefixoTrem_->restore();
    return familiasPrefixoTrem_;
    // retorna colecao vazia
    // NÃO PODE COLOCAR EXCEÇÃO PORQUE DÁ ABNORMAL
  }

  BDTDate dataInicio = dataPainel-1;
  BDTDate dataFim    = dataPainel+1;

  String dtInicioPainel = ThePOS().PutSQLQuotes(dataInicio.asString().c_str());
  String dtFimPainel = ThePOS().PutSQLQuotes(dataFim.asString().c_str());

  String clausula = "\
  SELECT DISTINCT FM.PID PID                       \
  FROM TCP_LCLZ_RCUR_FRVR TR,                      \
       TCP_ITNR_TREM      IT,                      \
       C_TCP_PATIO_ITNR   CPI,                     \
       TCP_PATIO_ITNR     PI,                      \
       TCP_PATIO_FRVR     PF,                      \
       TCP_FAML_PRFX_TREM FM                       \
  WHERE TR.ID_ITNR_TREM_ATUAL = IT.PID             \
    AND IT.ID_COLE_PATIO_ITNR_TREM = CPI.PID       \
    AND CPI.PID_REF = PI.PID                       \
    AND PI.ID_PATIO_FRVR = PF.PID                  \
    AND TR.ID_FAML_PRFX_TREM = FM.PID              \
    AND FM.ID_TIPO_TREM IS NOT NULL                \
    AND exists (                                   \
        select '1'                                 \
        from TCP_PATIO_PAIN_FRVR PPN ,             \
        TCP_PAIN_FRVR PN,                           \
        C_TCP_PATIO_PAIN_FRVR CPPN                   \
        where PF.PID = PPN.ID_PATIO_FRVR              \
        AND PPN.PID = CPPN.PID_REF                     \
        AND CPPN.PID = PN.ID_COLE_PATIO_PAIN_FRVR       \
        AND PN.PID = " + ThePOS().PutSQLQuotes(painelFerroviario.getPIDString()) + "\
              )                                                                      \
    AND TR.DT_PRVS_SAIDA >= to_date(" + dtInicioPainel + ", 'dd/mm/yyyy') \
    AND TR.DT_PRVS_SAIDA <= to_date(" + dtFimPainel + ", 'dd/mm/yyyy')    \
    AND (                                                                 \
        PI.DT_PRVS_SAIDA >= to_date(" + dtInicioPainel + ", 'dd/mm/yyyy') or         \
        PI.DT_SAIDA_TP_REAL >= to_date(" + dtInicioPainel + ", 'dd/mm/yyyy') or      \
        PI.DT_PRVS_CHGD >= to_date(" + dtInicioPainel + ", 'dd/mm/yyyy') or          \
        PI.DT_CHGD_TP_REAL >= to_date(" + dtInicioPainel + ", 'dd/mm/yyyy')) \       \
    AND (                                                                            \
        PI.DT_PRVS_SAIDA <= to_date(" + dtFimPainel + ", 'dd/mm/yyyy') or            \
        PI.DT_SAIDA_TP_REAL <= to_date(" + dtFimPainel + ", 'dd/mm/yyyy') or         \
        PI.DT_PRVS_CHGD <= to_date(" + dtFimPainel + ", 'dd/mm/yyyy') or             \
        PI.DT_CHGD_TP_REAL <= to_date(" + dtFimPainel + ", 'dd/mm/yyyy')             \
        ) ";



  if(!tipoTrem.isNull() )
  {
    clausula += " AND FM.ID_TIPO_TREM = " + ThePOS().PutSQLQuotes(tipoTrem.getPIDString()) + " ";
  }

  clausula = " OBJECT.PID IN ( " + clausula + ")";

  if (ativas == true)
  {
    clausula += " AND DT_INAT IS NULL AND HR_INAT IS NULL";
  }

  clausula += " ORDER BY CD_FAML_PRFX_TREM ";

  if (!clausula.IsEmpty())
  {
    familiasPrefixoTrem_->setWhere(clausula);
  }

  familiasPrefixoTrem_->restore();
  return familiasPrefixoTrem_;
  //## end SistemaCCG::recFamiliasPrefixoTremPorPainelFerroviario%43145AC1028A.body
}