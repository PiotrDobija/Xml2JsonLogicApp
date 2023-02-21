<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" omit-xml-declaration="yes" />
	<xsl:template match="/">
		<Order>
			<Name>
				<xsl:value-of select="Orders/Order[last()]/Name/text()"/>
			</Name>
			<Price>
				<xsl:value-of select="Orders/Order[last()]/Price/text()"/>
			</Price>
			<Count>
				<xsl:value-of select="Orders/Order[last()]/Count/text()"/>
			</Count>
		</Order>
	</xsl:template>
</xsl:stylesheet>