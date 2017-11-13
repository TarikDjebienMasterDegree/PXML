<?xml version="1.0" encoding="UTF-8" ?>

<!-- New document created with EditiX at Sat Feb 18 14:35:24 CET 2012 -->

<xsl:stylesheet version="2.0" exclude-result-prefixes="xs xdt err fn" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" xmlns:err="http://www.w3.org/2005/xqt-errors">
	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="/">
		<xsl:apply-templates select="//journée">
			<xsl:with-param name="dayNumber" select="18"/>
		</xsl:apply-templates>
	</xsl:template>
	<xsl:template match="journée">
		<xsl:param name="dayNumber" required="yes" as="xs:integer"/>
		<xsl:variable name="dayNumValue" select="./@num"/>
		<xsl:if test="$dayNumValue = $dayNumber">
			<xsl:copy-of select="."/>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
