<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output omit-xml-declaration="yes" indent="yes"/>
  <xsl:template match="node()|@*">
     <xsl:copy>
       <xsl:apply-templates select="node()|@*"/>
     </xsl:copy>
  </xsl:template>
  <xsl:template match="/network/ip/dhcp/range">
    <xsl:copy>
      <xsl:attribute name="start">${network_dhcp_range_start}</xsl:attribute>
      <xsl:attribute name="end">${network_dhcp_range_end}</xsl:attribute>
      <xsl:apply-templates select="@*[not(local-name()='end') and not(local-name()='start')]|node()"/>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
