<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:key name="properties-by-city" match="properties/property/address" use="@city"/>
  <xsl:template match="/">
    <table class="table table-striped" cellspacing="0" id="MainContent_GridView1" style="border-style:None;border-collapse:collapse;">
      <thead style="color:white; background:#0099FF;">
        <tr>
          <th colspan="1" >City</th>
          <th colspan="1" >Total</th>
          <th colspan="5"> Property</th>
        </tr>
        <tr>
          <th>City </th>
          <th>Total </th>
          <th>Type </th>
          <th>Land Register Number</th>
          <th>Street </th>
          <th>Door No. </th>
          <th>Cost </th>
        </tr>
      </thead>
      <tbody>
        <xsl:for-each select="properties/property/address[count(. | key('properties-by-city', @city)[1]) = 1]">
          <xsl:variable name="city" select="@city"></xsl:variable>
          <xsl:for-each select="//properties/property[address/@city=$city]">
            <tr>
              <xsl:if test="position() = 1">
                <td rowspan="{count(//properties/property[address/@city=$city])}">
                  <xsl:value-of select="$city"/>
                </td>
                <td rowspan="{count(//properties/property[address/@city=$city])}">
                  <xsl:value-of select="sum(//properties/property[address/@city=$city]/value/@cost)"/> €
                </td>
              </xsl:if>
              <td> <xsl:value-of select="@type"/> </td>
              <td> <xsl:value-of select="@id"/> </td>
              <td> <xsl:value-of select="address/@street"/> </td>
              <td> <xsl:value-of select="address/@port"/> </td>
              <td> <xsl:value-of select="value/@cost"/> € </td>
            </tr>
          </xsl:for-each>
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
</xsl:stylesheet>