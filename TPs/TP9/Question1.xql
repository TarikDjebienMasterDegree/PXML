xquery version "1.0";
let $lib := doc("http://www.fil.univ-lille1.fr/~yroos/pxml/pxml-9/Library.xml")
return
unordered {
  for $attribut in distinct-values($lib//@*/name())
  order by $attribut
    return $attribut
}
