<?xml version="1.0" encoding="UTF-8" ?>

<!-- New document created with EditiX at Sat Feb 18 15:29:45 CET 2012 -->

<xsl:stylesheet version="2.0" exclude-result-prefixes="xs xdt err fn" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" xmlns:err="http://www.w3.org/2005/xqt-errors">
	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="/">
		<clubs>
			<xsl:for-each select="//club">
				<xsl:variable name="clubID" as="xs:string" select="./@id"/>
				<club>
					<nom>
						<xsl:value-of select="./nom"/>
					</nom>
					<ville>
						<xsl:value-of select="./ville"/>
					</ville>
					<rencontres>
						<domicile>
							<xsl:for-each select="//rencontre">
								<xsl:variable name="clubReceveur" as="xs:string" select="./clubReceveur"/>
								<xsl:if test="$clubID = $clubReceveur">
									<rencontre>
										<clubInvité>
											<xsl:value-of select="./clubInvité"/>
										</clubInvité>
										<score>
											<xsl:value-of select="./score"/>
										</score>
									</rencontre>
								</xsl:if>
							</xsl:for-each>
						</domicile>
						<exterieur>
							<xsl:for-each select="//rencontre">
								<xsl:variable name="clubInvite" as="xs:string" select="./clubInvité"/>
								<xsl:if test="$clubID = $clubInvite">
									<rencontre>
										<clubReceveur>
											<xsl:value-of select="./clubReceveur"/>
										</clubReceveur>
										<score>
											<xsl:value-of select="./score"/>
										</score>
									</rencontre>
								</xsl:if>
							</xsl:for-each>
						</exterieur>
					</rencontres>
				</club>
			</xsl:for-each>
		</clubs>
	</xsl:template>
</xsl:stylesheet>
