<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml"
    >

<xsl:output method="xml" indent="yes" encoding="UTF-8" omit-xml-declaration="no"/>
  
  <xsl:template match="/">
      <xsl:copy-of select="//clubs"/>
  </xsl:template>

</xsl:stylesheet>
