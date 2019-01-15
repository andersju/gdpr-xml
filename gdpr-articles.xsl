<?xml version="1.0" encoding="UTF-8"?>
<!-- HERE BE DRAGONS -->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:xslFormatting="urn:xslFormatting">
  <xsl:output method="html" encoding="UTF-8" indent="yes" />

  <xsl:variable name="lowercase" select="'abcdefghijklmnopqrstuvwxyz'" />
  <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />

  <xsl:template match="/">
    <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
    <html lang="{translate(/CONS.ACT/CONS.DOC/BIB.INSTANCE/LG.DOC, $uppercase, $lowercase)}">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <meta name="referrer" content="no-referrer"/>
        <title>GDPR articles (<xsl:value-of select="/CONS.ACT/CONS.DOC/BIB.INSTANCE/LG.DOC" />)</title>
        <link rel="stylesheet" href="../../style.css"/>
      </head>
      <body>
        <header>
          <nav>
            Articles · <a href="../rec/">Recitals</a> · <a href="../../">Other languages</a>
          </nav>

          <h1 class="page-title">
            GDPR articles (<xsl:value-of select="/CONS.ACT/CONS.DOC/BIB.INSTANCE/LG.DOC" />)
          </h1>
        </header>
        <section class="intro" lang="en">
          <p>This page contains the articles of the GDPR. Please note that this is not the official version; for that, <a href="https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=celex%3A32016R0679">see the official version</a> (and the 2018 <a href="https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32016R0679R%2802%29">corrigendum</a>). There may be errors here; if you find any, please <a href="mailto:info@dataskydd.net">contact us</a> or <a href="https://github.com/andersju/gdpr-xml">create an issue on GitHub</a>.</p>
          <p>The following was generated from <a href="https://publications.europa.eu/en/publication-detail/-/publication/5f2552c2-cc45-11e6-ad7c-01aa75ed71a1/language-en/format-PDF/source-82709144">XML files of the consolidated GDPR</a> (i.e., with corrections integrated). These files did not include the preamble containing the recitals, so these were added from <a href="https://publications.europa.eu/en/publication-detail/-/publication/3e485e15-11bd-11e6-ba9a-01aa75ed71a1/language-en">the XML version of the original GDPR</a>, and the preamble corrections were then merged in.</p>
          <p>This is a service by <a href="https://dataskydd.net/english">Dataskydd.net</a>. The texts are © European Union, 2018.</p>
        </section>

        <main>
          <h2><xsl:apply-templates select="/CONS.ACT/CONS.DOC/TITLE"/></h2>

          <ul>
            <xsl:for-each select="/CONS.ACT/CONS.DOC/ENACTING.TERMS/DIVISION">
                <xsl:call-template name="toc">
                  <xsl:with-param name="division" select="."/>
                </xsl:call-template>
            </xsl:for-each>
          </ul>

          <xsl:apply-templates select="/CONS.ACT/CONS.DOC/ENACTING.TERMS/DIVISION"/>

          <xsl:apply-templates select="/CONS.ACT/CONS.DOC/FINAL/P"/>
          <!--<xsl:apply-templates select="/CONS.ACT/CONS.DOC/FINAL/SIGNATURE"/>-->
        </main>

        <xsl:call-template name="footnotes" />
      </body>
    </html>
  </xsl:template>

  <xsl:template match="PREAMBLE.INIT|VISA|GR.CONSID.INIT|PREAMBLE.FINAL">
    <p><xsl:apply-templates select="node()"/></p>
  </xsl:template>

  <xsl:template name="footnotes">
    <section class="footnotes">
      <ol>
        <xsl:for-each select="/CONS.ACT/CONS.DOC/ENACTING.TERMS/descendant::NOTE[@TYPE='FOOTNOTE']">
          <li id="cite-note-{@NOTE.ID}">
            <a href="#cite-ref-{@NOTE.ID}">^</a><xsl:text> </xsl:text>
            <xsl:apply-templates match="." />
          </li>
        </xsl:for-each>
      </ol>
    </section>
  </xsl:template>

  <xsl:template name="toc">
    <xsl:param name="division" />
    <li>
      <a href="#ch{position()}">
      <xsl:value-of select="$division/TITLE/TI" /><xsl:text disable-output-escaping="yes"> <![CDATA[&ndash;]]> </xsl:text><xsl:value-of select="$division/TITLE/STI" />
      </a><br />

      <ul>
        <xsl:for-each select="$division/ARTICLE">
          <li>
            <a href="#art{@IDENTIFIER}"><xsl:value-of select="TI.ART" /></a><xsl:text disable-output-escaping="yes"> <![CDATA[&ndash;]]> </xsl:text><xsl:value-of select="STI.ART" />
          </li>
        </xsl:for-each>

        <xsl:for-each select="$division/DIVISION">
          <li>
            <a href="#{translate(normalize-space(concat(../TITLE/TI, TITLE/TI)), ' ', '')}">
              <xsl:value-of select="TITLE/TI" /><xsl:text disable-output-escaping="yes"> <![CDATA[&ndash;]]> </xsl:text><xsl:value-of select="TITLE/STI" />
            </a>
          </li>
          
          <li>
            <xsl:for-each select="ARTICLE">
              <a href="#art{@IDENTIFIER}"><xsl:value-of select="TI.ART" /></a><xsl:text disable-output-escaping="yes"> <![CDATA[&ndash;]]> </xsl:text><xsl:value-of select="STI.ART" /><br />
            </xsl:for-each>
          </li>
        </xsl:for-each>
      </ul>
    </li>
  </xsl:template>

  <xsl:template match="/CONS.ACT/CONS.DOC/ENACTING.TERMS/DIVISION">
    <a href="#ch{position()}">
      <h2 id="ch{position()}">
        <xsl:value-of select="normalize-space(TITLE/TI)"/><xsl:text disable-output-escaping="yes"> <![CDATA[&ndash;]]> </xsl:text><xsl:value-of select="TITLE/STI" />
      </h2>
    </a>

    <xsl:apply-templates select="ARTICLE" />
    <xsl:apply-templates select="DIVISION" />
  </xsl:template>

  <xsl:template match="/CONS.ACT/CONS.DOC/ENACTING.TERMS/DIVISION/DIVISION">
    <a href="#{translate(normalize-space(concat(../TITLE/TI, TITLE/TI)), ' ', '')}">
      <h2 id="{translate(normalize-space(concat(../TITLE/TI, TITLE/TI)), ' ', '')}"><xsl:value-of select="normalize-space(TITLE/TI)"/><xsl:text disable-output-escaping="yes"> <![CDATA[&ndash;]]> </xsl:text><xsl:value-of select="normalize-space(TITLE/STI)"/></h2>
    </a>

    <xsl:apply-templates select="ARTICLE" />
    <xsl:apply-templates select="DIVISION" />
  </xsl:template>

  <xsl:template match="TITLE/STI">
    <span class="sti-div"><xsl:value-of select="normalize-space(.)"/></span>
  </xsl:template>

  <xsl:template match="ARTICLE">
    <a href="#art{@IDENTIFIER}">
      <h3 id="art{@IDENTIFIER}"><xsl:value-of select="TI.ART" /></h3>
    </a>
    <p class="sti-art"><strong><xsl:value-of select="STI.ART"/></strong></p>

    <ul>
      <xsl:apply-templates select="PARAG" />
      <xsl:apply-templates select="ALINEA" />
    </ul>
  </xsl:template>

  <xsl:template match="PARAG">
    <li>
      <xsl:apply-templates select="NO.PARAG" /><xsl:text> </xsl:text><xsl:apply-templates select="ALINEA[1]"/>
    </li>
    <xsl:for-each select="ALINEA[position()>1]">
      <li>
        <xsl:apply-templates select="."/>
      </li>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="PARAG/ALINEA">
    <xsl:apply-templates select="node()"/>
  </xsl:template>

  <xsl:template match="PARAG/ALINEA/LIST|ARTICLE/ALINEA/LIST|ARTICLE/ALINEA/LIST/ITEM/NP/P/LIST">
    <ul>
      <xsl:apply-templates select="node()"/>
    </ul>
  </xsl:template>

  <xsl:template match="PARAG/ALINEA/LIST/ITEM|ARTICLE/ALINEA/LIST/ITEM|ARTICLE/ALINEA/LIST/ITEM/NP/P/LIST/ITEM">
    <li>
      <xsl:if test="../@TYPE='DASH'">
        <xsl:text disable-output-escaping="yes"><![CDATA[&mdash;]]></xsl:text>
      </xsl:if>
      <xsl:apply-templates select="node()"/>
    </li>
  </xsl:template>

  <xsl:template match="ARTICLE/ALINEA">
    <li>
      <xsl:apply-templates select="node()"/>
    </li>
  </xsl:template>

  <xsl:template match="TITLE/TI/P">
    <span>
      <xsl:value-of select="normalize-space(.)"/>
    </span>
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
    <sup id="cite-ref-{@NOTE.ID}">
      <a href="#cite-note-{@NOTE.ID}"><xsl:value-of select="number(substring(@NOTE.ID, 2))" /></a>
    </sup>
  </xsl:template>

  <!-- ughhhhhh. -->
  <xsl:template match="QUOT.START"><xsl:text disable-output-escaping="yes">&lt;q&gt;</xsl:text></xsl:template>
  <xsl:template match="QUOT.END"><xsl:text disable-output-escaping="yes">&lt;/q&gt;</xsl:text></xsl:template>

  <xsl:decimal-format name="european" decimal-separator=',' grouping-separator='&#160;' />
  <xsl:template match="FT[@TYPE='NUMBER']">
    <xsl:value-of select="format-number(text(), '#&#160;###,##;(#&#160;###,##)', 'european')" />
  </xsl:template>

  <xsl:template match="REF.DOC.OJ">
    <a href="https://eur-lex.europa.eu/legal-content/EN/AUTO/?uri=OJ:{@COLL}:{substring(@DATE.PUB, 1, 4)}:{@NO.OJ}:TOC">
      <xsl:value-of select="." />
    </a>
  </xsl:template>
</xsl:stylesheet>
