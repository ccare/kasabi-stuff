<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:rs="http://www.w3.org/2005/sparql-results#" version="1.0">
  <xsl:template match="rs:sparql">
    <xsl:variable name="cols" select="rs:head/rs:variable"/>
    <html>
      <table>
        <thead>
          <xsl:for-each select="$cols">
            <th>
              <xsl:value-of select="@name"/>
            </th>
          </xsl:for-each>
        </thead>
        <tbody>
          <xsl:for-each select="rs:results/rs:result">
            <tr>
              <xsl:variable name="row" select="."/>
              <xsl:for-each select="$cols/@name">
                <xsl:variable name="n" select="."/>
                <td>
                  <xsl:value-of select="$row/rs:binding[@name = $n]/rs:literal"/>
                </td>
              </xsl:for-each>
            </tr>
          </xsl:for-each>
        </tbody>
      </table>
    </html>
  </xsl:template>
</xsl:stylesheet>
