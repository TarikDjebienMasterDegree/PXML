<?xml version="1.0" encoding="UTF-8" ?>

<!-- New document created with EditiX at Fri Feb 24 16:05:37 CET 2012 -->

<xsl:stylesheet version="2.0" xpath-default-namespace="http://bda/art" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://bda/art">
	<xsl:output method="xml" indent="yes"/>
	
	<xsl:template match="/">
		<art xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
		  <artistes>
	        <xsl:apply-templates select="//artiste"/>
	      </artistes>
	      <xsl:copy-of select="document('artistesAvecClefs.xml')/art/mouvements" />
	      <oeuvres>
	        <xsl:apply-templates select="document('../catalogues.xml')//fichier"/>
	        <!--<xsl:apply-templates select="document('../catalogue-1.xml')//oeuvre"/>-->
	        <!--<xsl:apply-templates select="document('../catalogue-2.xml')//oeuvre"/>-->
	      </oeuvres>
		</art>
	</xsl:template>
	
	<xsl:template match="artiste">
		<xsl:variable name="id" as="xs:string" select="@id"/>
		<artiste  id="{$id}">
			<xsl:copy-of select="*"/>
		</artiste>
	</xsl:template>
	
	<xsl:template match="fichier">
	    <xsl:variable name="file" as="xs:string" select="@uri"/>
	    <xsl:apply-templates select="document('../$file')//oeuvre"/>
	</xsl:template>
	
	<xsl:template match="oeuvre">
	    <xsl:variable name="oeuvreAuthorFirstName" as="xs:string" select="./auteur/nom"/>
	    <xsl:variable name="oeuvreAuthorLastName" as="xs:string" select="./auteur/prénom"/>
	    <oeuvre  auteur="{concat($oeuvreAuthorFirstName,$oeuvreAuthorLastName)}">
	      <titre><xsl:value-of select="titre"/></titre>
	      <date><xsl:value-of select="date"/></date>
	    </oeuvre>
	</xsl:template>
	
</xsl:stylesheet>
