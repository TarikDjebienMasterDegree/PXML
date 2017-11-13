xquery version "1.0";
declare base-uri "file:///Users/tarik/Desktop/TP8/Exercice2/";
let $maisons := doc("maisons.xml")
return
<xhtml:html xmlns:xhtml="http://www.w3.org/1999/xhtml">
<xhtml:head>
<xhtml:title>maisons</xhtml:title>
</xhtml:head>
<xhtml:body>
    <xhtml:table border="2" style="border-style:solid;">
    <xhtml:thead>
       <xhtml:tr>
          <xhtml:th>Maisons</xhtml:th>
          <xhtml:th>Surfaces (m2)</xhtml:th>
       </xhtml:tr>
    </xhtml:thead>
    <xhtml:tbody style="border-style:double;">
    {
    for $m in $maisons//maison 
    return
    <xhtml:tr>
      <xhtml:td>{fn:data(concat(concat(fn:node-name($m)," "),$m/@id))}</xhtml:td>
      {element xhtml:td
        {sum($m/*/*/@surface-m2)}
      }
    </xhtml:tr>
    }
    </xhtml:tbody>
    </xhtml:table>
  </xhtml:body>
</xhtml:html>
