<!-- THIS XSLT IS USED TO TRANSFORM A DYNAMIC XML -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:asp="http://example.com/asp">
  <xsl:template match="/">
    <li class="dropdown notifications-menu">
      <a href="#" class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-shopping-cart"></i>
        <span class="label label-success">
          <xsl:value-of select="sum(/Data/ShoppingCart/Product/@quantity)"/>
        </span>
      </a>
      <ul class="dropdown-menu">
        <li class="header">
          <div>
            You have <xsl:value-of select="sum(/Data/ShoppingCart/Product/@quantity)"/> product(s) in Shopping Cart
          </div>
        </li>
        <li>
          <ul class="menu">
            <xsl:for-each select="/Data/ShoppingCart/Product">
              <li>
                <a>
                  <b>
                    <xsl:value-of select="@name"/>
                  </b>
                  <small class="pull-right">
                    <i class="fa fa-clock-o"></i>&#160;<xsl:value-of select="@quantity"/> unit(s)
                  </small>
                  <div>
                    <xsl:value-of select="@quantity"/>&#160;<small>x</small>&#160;<xsl:value-of select="@price"/>€
                  </div>
                </a>
              </li>
            </xsl:for-each>
          </ul>
        </li>
        <li class="footer">
          <xsl:variable name="subTotals">
            <xsl:for-each  select="/Data/ShoppingCart/Product">
              <number>
                <xsl:value-of select="@quantity*@price"/>
              </number>
            </xsl:for-each>
          </xsl:variable>
          <a href="/Shop/Checkout">
            Total: <xsl:value-of select="sum(msxsl:node-set($subTotals)/number)"/>€<br/>
            Proceed with Purchase
          </a>
        </li>
      </ul>
    </li>
  </xsl:template>
</xsl:stylesheet>