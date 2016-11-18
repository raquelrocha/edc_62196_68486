<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/rss/channel">
    <span class="h3">Feed News</span>&#160;
    <span>[<xsl:value-of select="count(item)"/>]</span><br/><br/>
    <div class="row">
      <xsl:for-each select="item">
        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
          <div class="well well-sm" style="min-height:290px">
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