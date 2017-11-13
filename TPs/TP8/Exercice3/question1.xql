xquery version "1.0";
declare base-uri "file:///Users/tarik/Desktop/TP8/Exercice3/";
let $plant_catalog := doc("plant_catalog.xml")
let $plant_families := doc("plant_families.xml")
return
<CATALOG>
{
  for $plant in $plant_catalog//PLANT return
  element
  {fn:node-name($plant)}
  {
  $plant/@*,
  $plant/*,
  element FAMILY {$plant_families//SPECIES[./text() = $plant/BOTANICAL/text()]/../NAME/text()}
  }
  
}
</CATALOG>
