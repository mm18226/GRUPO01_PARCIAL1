<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="registro">
  <html>
  <head></head>
  <body>
  <xsl:apply-templates select="factura"/>
  </body>
  </html>
  </xsl:template>
  

  <xsl:template match="factura">
  <div>
  
  <p>Factura No. <xsl:value-of select="num"/></p>
    <p>Tipo: <xsl:value-of select="@tipo"/></p>
  <p><xsl:apply-templates select="cliente"/></p>
  <xsl:apply-templates select="lineafactura"/>
  <p>Total: <xsl:apply-templates select="total"/></p>
  
  </div>
  </xsl:template>
  

<xsl:template match="cliente">
<p>Cliente: <xsl:value-of select="nombre"/></p>
<p>DUI: <xsl:apply-templates select="documento"/></p>
<p>Telefóno: <xsl:value-of select="telefono"/></p>
<p>Correo: <xsl:value-of select="email"/></p>
</xsl:template>

<xsl:template match="documento">
<xsl:value-of select="dui"/>
</xsl:template>

 <xsl:template match="lineafactura">
 <table>
 <tr>
 <th>Código</th>
 <th>Detalle</th>
 <th>Cantidad</th>
 <th>Precio</th>
 <th>Sub Total</th>
 </tr>
 <tr>
 <td><xsl:value-of select="codigo"/></td>
  <td><xsl:value-of select="detalle"/></td>
  <td><xsl:value-of select="cantidad"/></td>
  <td><xsl:apply-templates select="precio"/></td>
  <td><xsl:apply-templates select="subtotal"/></td>
  </tr>
 </table>
 </xsl:template>
 
 <xsl:template match="precio">
<xsl:value-of select="moneda"/>
<xsl:value-of select="valor"/>
 </xsl:template>
 
<xsl:template match="subtotal">
<xsl:value-of select="moneda"/><xsl:value-of select="valor"/>
</xsl:template>

<xsl:template match="total">
<xsl:value-of select="moneda"/>
<xsl:value-of select="valor"/>
</xsl:template>
  
  
</xsl:stylesheet>
