<?xml version="1.0" encoding="UTF-8"?>
<!-- if the source elements belong to a namespace even if it is a default one then the stylesheet will also need to declare those -->
<!-- do not forget to include the namespace prefix when matching elements or nothing will be matched! -->
<!-- do not forget to include <xsl:apply-templates /> everywhere where you want the children to be processed, otherwise the execution stops right at the matched parent element and continues with its siblings! -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:lb="http://www.liquibase.org/xml/ns/dbchangelog" exclude-result-prefixes="lb">
	<xsl:output method="xml" omit-xml-declaration="yes" indent="no" />
	<xsl:template match="/|node()|@*">
		<xsl:copy>
			<xsl:apply-templates select="node()|@*"/>
		</xsl:copy>
	</xsl:template>
	
	<xsl:template match="lb:createTable/lb:column[substring(@name,string-length(@name)-2)='SEQ' and starts-with(@type,'NUMBER')]">
		<column xmlns="http://www.liquibase.org/xml/ns/dbchangelog" name="{@name}" type="NUMBER(19,0)">
		<xsl:apply-templates />
		</column>
	</xsl:template>

</xsl:stylesheet>