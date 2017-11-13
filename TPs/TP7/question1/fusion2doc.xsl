<?xml version="1.0" encoding="UTF-8" ?>

<!-- New document created with EditiX at Fri Feb 24 16:05:37 CET 2012 -->

<xsl:stylesheet version="2.0"  
       		    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
       		    xmlns:xs="http://www.w3.org/2001/XMLSchema"
       		    xmlns="http://bda/art"
       		    xpath-default-namespace="http://bda/art">
	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="/">
	  <art>
	  <artistes>
	    <xsl:for-each select="document('../artistes.xml')/art/artistes/artiste">
	    <xsl:variable name="artistFirstName" as="xs:string" select="./nom"/>
	    <xsl:variable name="artistLastName" as="xs:string" select="./prénom"/>
	    <artiste>
	      <nom><xsl:value-of select="./nom"/></nom>
	      <prénom><xsl:value-of select="./prénom" /></prénom>
	      <naissance><xsl:value-of select="./naissance" /></naissance>
	      <décès><xsl:value-of select="./décès" /></décès>
	      <xsl:copy-of select="./période" />
	      <xsl:for-each select="document('../catalogue-1.xml')/catalogue/oeuvre">
	      <xsl:variable name="oeuvreAuthorFirstName" as="xs:string" select="./auteur/nom"/>
	      <xsl:variable name="oeuvreAuthorLastName" as="xs:string" select="./auteur/prénom"/>
	      <xsl:if test="$artistFirstName = $oeuvreAuthorFirstName and $artistLastName = $oeuvreAuthorLastName">
	      <oeuvre>
	        <genre><xsl:value-of select="./@genre"/></genre>
	        <titre><xsl:value-of select="./titre"/></titre>
	        <date><xsl:value-of select="./date"/></date>
	      </oeuvre>
	      </xsl:if>
	      </xsl:for-each>
	    </artiste>
	    </xsl:for-each>
	  </artistes>
	  <xsl:copy-of select="document('../artistes.xml')/art/mouvements" />
	  </art>
	</xsl:template>
	
</xsl:stylesheet>
