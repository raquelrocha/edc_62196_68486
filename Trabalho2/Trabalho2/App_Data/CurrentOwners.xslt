<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="properties">
    <properties>
      <xsl:for-each select="property">
        <xsl:sort select="@id" data-type="number"/>
          <property>
            <xsl:attribute name="Type">
              <xsl:value-of select="@type"/>
            </xsl:attribute>
            <xsl:attribute name="RegisterNumber">
              <xsl:value-of select="@id"/>
            </xsl:attribute>
            <xsl:attribute name="Cost">
              <xsl:value-of select="value/@cost"/>
            </xsl:attribute>
            <xsl:attribute name="Currency">
              <xsl:value-of select="value/@currency"/>
            </xsl:attribute>
            <xsl:attribute name="City">
              <xsl:value-of select="address/@city"/>
            </xsl:attribute>
            <xsl:attribute name="Street">
              <xsl:value-of select="address/@street"/>
            </xsl:attribute>
            <xsl:attribute name="Port">
              <xsl:value-of select="address/@port"/>
            </xsl:attribute>
            <xsl:for-each select="owners/owner">
              <xsl:choose>
                 <xsl:when test="purchase/@sold">
                 </xsl:when>
                 <xsl:otherwise>
                   <xsl:attribute name="taxId">
                    <xsl:value-of select="@taxId"/>
                  </xsl:attribute>
                 </xsl:otherwise>
              </xsl:choose>
            </xsl:for-each>  
          </property>
      </xsl:for-each>
    </properties>
  </xsl:template>
</xsl:stylesheet>
