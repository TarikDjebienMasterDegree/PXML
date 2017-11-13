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
	    <xsl:for-each select="document('artistesAvecClefs.xml')/art/artistes/artiste">
	    <xsl:variable name="artistFirstName" as="xs:string" select="./nom"/>
	    <xsl:variable name="artistLastName" as="xs:string" select="./prénom"/>
	    <xsl:variable name="id" as="xs:string" select="@id"/>
	    <artiste num="{$id}">
	      <nom><xsl:value-of select="./nom"/></nom>
	      <prénom><xsl:value-of select="./prénom" /></prénom>
	      <naissance><xsl:value-of select="./naissance" /></naissance>
	      <décès><xsl:value-of select="./décès" /></décès>
	      <xsl:copy-of select="./période" />
	    </artiste>
	    </xsl:for-each>
	  </artistes>
	  <xsl:copy-of select="document('artistesAvecClefs.xml')/art/mouvements" />
	  <xsl:for-each select="document('../catalogues.xml')/liste/fichier">
	  <xsl:variable name="file" as="xs:string" select="@uri"/>
	  <oeuvres>
	  <!--<xsl:for-each select="document('../{$file}')/catalogue/oeuvre"> 
	  ne marche pas : java.io.FileNotFoundException /Users/tarik/Desktop/TP7/{$file} 
	  No such file or directory-->
	  <xsl:for-each select="document('../{$file}')/catalogue/oeuvre">
	      <xsl:variable name="oeuvreAuthorFirstName" as="xs:string" select="./auteur/nom"/>
	      <xsl:variable name="oeuvreAuthorLastName" as="xs:string" select="./auteur/prénom"/>
	      <oeuvre  auteur="{concat($oeuvreAuthorFirstName,$oeuvreAuthorLastName)}">
	        <titre><xsl:value-of select="./titre"/></titre>
	        <date><xsl:value-of select="./date"/></date>
	      </oeuvre>
	  </xsl:for-each> 
	  </oeuvres>
	  </xsl:for-each>
	  </art>
	</xsl:template>
	
</xsl:stylesheet>
