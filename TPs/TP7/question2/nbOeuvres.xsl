<?xml version="1.0" encoding="UTF-8" ?>

<!-- New document created with EditiX at Fri Feb 24 16:05:37 CET 2012 -->

<xsl:stylesheet version="2.0"  
       		    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
       		    xmlns:xs="http://www.w3.org/2001/XMLSchema"
       		    xmlns="http://bda/art"
       		    xpath-default-namespace="http://bda/art">
	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="/">
	  <art xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	  <artistes>
	    <xsl:apply-templates select="//artiste"/>
	  </artistes>
	  <xsl:copy-of select="document('../artistes.xml')/art/mouvements" />
	  </art>
	</xsl:template>
	
	<xsl:template match="artiste">
		<xsl:variable name="nom" select="nom"/>
		<xsl:variable name="prenom" select="prénom"/>
		<artiste>
			<xsl:copy-of select="*"/>
			<nb-oeuvres>
				<xsl:value-of 
				select="count(document('../catalogue-1.xml')//oeuvre[auteur/nom=$nom and auteur/prénom=$prenom])"/>
			</nb-oeuvres>
		</artiste>
	</xsl:template>
	
</xsl:stylesheet>
