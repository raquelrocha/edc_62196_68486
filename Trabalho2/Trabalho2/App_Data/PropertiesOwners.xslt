<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="properties">
    <owners>
      <xsl:for-each select="property">
        <xsl:sort select="@id" data-type="number"/>
        <xsl:for-each select="owners/owner">
          <owner>
            <xsl:attribute name="id">
              <xsl:value-of select="ancestor::*/@id"/>
            </xsl:attribute>
            <xsl:attribute name="taxId">
              <xsl:value-of select="@taxId"/>
            </xsl:attribute>
            <xsl:attribute name="date">
              <xsl:value-of select="purchase/@date"/>
            </xsl:attribute>
            <xsl:attribute name="sold">
              <xsl:if test="purchase/@sold = ''">
                <xsl:text>None</xsl:text>
              </xsl:if>
              <xsl:if test="purchase/@sold != ''">
                <xsl:value-of select="purchase/@sold"/>
              </xsl:if>
            </xsl:attribute>
            <xsl:attribute name="firstname">
              <xsl:value-of select="name/@firstname"/>
            </xsl:attribute>
            <xsl:attribute name="lastname">
              <xsl:value-of select="name/@lastname"/>
            </xsl:attribute>
          </owner>
        </xsl:for-each>
      </xsl:for-each>
    </owners>
  </xsl:template>
</xsl:stylesheet>
