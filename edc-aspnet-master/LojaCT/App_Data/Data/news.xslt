<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:variable name="vrtfMonths">
    <m name="Jan" num="01"/>
    <m name="Feb" num="02"/>
    <m name="Mar" num="03"/>
    <m name="Apr" num="04"/>
    <m name="May" num="05"/>
    <m name="Jun" num="06"/>
    <m name="Jul" num="07"/>
    <m name="Aug" num="08"/>
    <m name="Sep" num="09"/>
    <m name="Oct" num="10"/>
    <m name="Nov" num="11"/>
    <m name="Dec" num="12"/>
  </xsl:variable>
  <xsl:variable name="vMonths" select="document('')/*/xsl:variable[@name='vrtfMonths']/*" />
  <xsl:template match="/rss/channel">
    <span class="h3">News</span>&#160;
    <span>[<xsl:value-of select="count(item)"/>]</span><br/><br/>
    <div class="row">
      <xsl:for-each select="item">
        <xsl:sort data-type="number" order="descending" select=
        "concat(substring(pubDate,13,4),$vMonths[@name = substring(current()/pubDate,9,3)]/@num,
                substring(pubDate,6,2), translate(substring(pubDate,18,8),':', ''))"/>
        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
          <div class="well well-sm" style="min-height:290px; max-height:290px; overflow:hidden;">
            <h4>
              <a>
                <xsl:attribute name="href">
                  <xsl:value-of select="link"/>
                </xsl:attribute>
                <xsl:value-of select="title" disable-output-escaping="yes"/>
              </a>
            </h4>
            <xsl:if test="pubDate">
              <span>
                <i class="fa fa-calendar"></i>&#160;
                <xsl:value-of select="pubDate" disable-output-escaping="yes"/>
              </span>
              <br/>
            </xsl:if>
            <xsl:if test="category">
              <span>
                <i class="fa fa-tag"></i>&#160;
                <xsl:value-of select="category" disable-output-escaping="yes"/>
              </span>
              <br/>
            </xsl:if>
            <br/>
            <span>
              <xsl:value-of select="description" disable-output-escaping="yes"/>
            </span>
          </div>
        </div>
      </xsl:for-each>
    </div>
  </xsl:template>
</xsl:stylesheet>