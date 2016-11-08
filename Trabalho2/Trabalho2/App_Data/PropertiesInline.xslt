<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="properties">
    <properties>
      <xsl:for-each select="property">
        <xsl:sort select="@id" data-type="number" />
        <property>
          <xsl:attribute name="type">
            <xsl:value-of select="@type"/>
          </xsl:attribute>
          <xsl:attribute name="id">
            <xsl:value-of select="@id"/>
          </xsl:attribute>
          <xsl:attribute name="cost">
            <xsl:value-of select="value/@cost"/>
          </xsl:attribute>
          <xsl:attribute name="currency">
            <xsl:value-of select="value/@currency"/>
          </xsl:attribute>
          <xsl:attribute name="city">
            <xsl:value-of select="address/@city"/>
          </xsl:attribute>
          <xsl:attribute name="street">
            <xsl:value-of select="address/@street"/>
          </xsl:attribute>
          <xsl:attribute name="port">
            <xsl:value-of select="address/@port"/>
          </xsl:attribute>
        </property>
      </xsl:for-each>
    </properties>
  </xsl:template>
</xsl:stylesheet>
