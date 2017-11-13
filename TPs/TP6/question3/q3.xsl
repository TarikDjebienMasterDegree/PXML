<?xml version="1.0" encoding="UTF-8"?>

<!-- New document created with EditiX at Sat Feb 18 13:58:28 CET 2012 -->

<xsl:stylesheet version="2.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xhtml"/>
	<xsl:template match="/">
		<html>
			<body>
				<h2>Les clubs de Ligue 1 <br/> saison 2011-2012</h2>
				<table border="1">
					<thead>
						<tr>
							<th>ville</th>
							<th>club</th>
						</tr>
					</thead>
					<tbody>
						<xsl:for-each select="//club">
						<xsl:sort select="./ville" order="ascending" data-type="text"/>
							<tr>
								<td>
									<xsl:value-of select="./ville"/>
								</td>
								<td>
									<xsl:value-of select="./nom"/>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
