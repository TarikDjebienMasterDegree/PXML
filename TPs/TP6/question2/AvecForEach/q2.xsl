<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml"
    >

<xsl:output method="xml" indent="yes" encoding="UTF-8" omit-xml-declaration="no"/>
  
  <xsl:template match="/">    
    <clubs xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
      <xsl:for-each select="//club">
		<club id="{./@id}">
			<nom><xsl:value-of select="./nom"/></nom>
			<ville><xsl:value-of select="./ville"/></ville>
		</club>
      </xsl:for-each>
    </clubs>
  </xsl:template>
  
</xsl:stylesheet>
