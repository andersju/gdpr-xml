<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:xslFormatting="urn:xslFormatting">
  <xsl:output method="html" encoding="UTF-8" indent="yes" />

  <xsl:template match="/">
    <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
    <html>
      <head>
        <meta charset="UTF-8"/>
        <title>GDPR recitals (<xsl:value-of select="/CONS.ACT/CONS.DOC/BIB.INSTANCE/LG.DOC" />)</title>
        <link rel="stylesheet" href="../../style.css"/>
      </head>
      <body>
        <header>
          <h1 class="page-title">
            GDPR recitals (<xsl:value-of select="/CONS.ACT/CONS.DOC/BIB.INSTANCE/LG.DOC" />)
          </h1>
        </header>
        <section class="intro">
          <p>This page contains the recitals of the GDPR. For the articles, <a href="../art">see here</a>. For other languages, <a href="../../">see the index.</a></p>
          <p>Please note that this is not the official version of the GDPR; for that, <a href="https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=celex%3A32016R0679">see the official version</a> (and the 2018 <a href="https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32016R0679R%2802%29">corrigendum</a>). There may be errors here; if you find any, please <a href="mailto:info@dataskydd.net">contact us</a>.</p>
          <p>The following was generated from <a href="https://publications.europa.eu/en/publication-detail/-/publication/5f2552c2-cc45-11e6-ad7c-01aa75ed71a1/language-en/format-PDF/source-82709144">XML files of the consolidated GDPR</a> (i.e., with corrections integrated). These files did not include the preamble containing the recitals, so these were added from <a href="https://publications.europa.eu/en/publication-detail/-/publication/3e485e15-11bd-11e6-ba9a-01aa75ed71a1/language-en">the XML version of the original GDPR</a>, and the preamble corrections were then merged in.</p>
          <p>This is a service by <a href="https://dataskydd.net/english">Dataskydd.net</a>. The texts are © European Union, 2018.</p>
        </section>

<!--
        <header>
          <h1 class="page-title">
          <xsl:apply-templates select="/CONS.ACT/CONS.DOC/TITLE"/>
          </h1>
        </header>

        <xsl:apply-templates select="/CONS.ACT/CONS.DOC/PREAMBLE/PREAMBLE.INIT"/>
        <xsl:apply-templates select="/CONS.ACT/CONS.DOC/PREAMBLE/GR.VISA"/>
-->
        <xsl:apply-templates select="/CONS.ACT/CONS.DOC/PREAMBLE/GR.CONSID/CONSID"/>

        <xsl:call-template name="footnotes" />
      </body>
    </html>
  </xsl:template>

  <xsl:template match="PREAMBLE.INIT|VISA|GR.CONSID.INIT|PREAMBLE.FINAL">
    <p><xsl:apply-templates select="node()"/></p>
  </xsl:template>

  <xsl:template name="footnotes">
    <ol>
      <xsl:for-each select="/CONS.ACT/CONS.DOC/PREAMBLE/descendant::NOTE[@TYPE='FOOTNOTE']">
        <li>
          <xsl:attribute name="id">
            cite-note-<xsl:value-of select="@NOTE.ID" />
          </xsl:attribute>
          <a href="#cite-ref-{@NOTE.ID}">^</a><xsl:text> </xsl:text>
          <xsl:value-of select="P" />
        </li>
      </xsl:for-each>
    </ol>
  </xsl:template>

  <xsl:template match="PARAG">
    <li>
      <xsl:apply-templates select="ALINEA" />
    </li>
  </xsl:template>

<!--  <xsl:template match="ALINEA[not(P)]">
    <p><xsl:value-of select="."/></p>
  </xsl:template>-->

  <xsl:template match="CONSID">
    <xsl:variable name="recitalnumber">
      <xsl:value-of select="substring-before(substring-after(NP/NO.P,'('),')')" />
    </xsl:variable>
    <a>
      <xsl:attribute name="href">#rec<xsl:copy-of select="$recitalnumber"/></xsl:attribute>
      <h3>
        <xsl:attribute name="id">
          rec<xsl:copy-of select="$recitalnumber" />
        </xsl:attribute>
        <xsl:value-of select="NP/NO.P" />
      </h3>
    </a>
    <p>
      <xsl:apply-templates select="NP/TXT|NP/P"/>
    </p>
  </xsl:template>

<!--
  <xsl:template match="NP/P/LIST/ITEM">
    <p><xsl:value-of select="normalize-space(NP/NO.P)" /><xsl:text> </xsl:text><xsl:value-of select="normalize-space(NP/TXT)" /></p>
  </xsl:template>-->

  <xsl:template match="TITLE/TI/P">
    <span><xsl:value-of select="normalize-space(.)"/></span>
  </xsl:template>

  <xsl:template match="P">
    <p>
      <xsl:apply-templates select="@*|node()"/>
    </p>
  </xsl:template>

  <xsl:template match="HT[@TYPE='ITALIC']">
    <em>
      <xsl:apply-templates select="node()"/>
    </em>
  </xsl:template>

  <xsl:template match="HT[@TYPE='UC']">
    <span class="uppercase">
      <xsl:apply-templates select="node()"/>
    </span>
  </xsl:template>

  <xsl:template match="HT[@TYPE='BOLD']">
    <strong>
       <xsl:apply-templates select="node()"/>
    </strong>
  </xsl:template>

  <xsl:template match="NOTE[@TYPE='FOOTNOTE']">
    <sup>
      <xsl:attribute name="id">
        cite-ref-<xsl:value-of select="@NOTE.ID" />
      </xsl:attribute>
      <a href="#cite-note-{@NOTE.ID}"><xsl:value-of select="number(substring(@NOTE.ID, 2))" /></a>
    </sup>
  </xsl:template>

</xsl:stylesheet>
