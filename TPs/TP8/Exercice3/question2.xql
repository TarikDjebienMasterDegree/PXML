xquery version "1.0";
declare base-uri "file:///Users/tarik/Desktop/TP8/Exercice3/";
let $plant_catalog := doc("plant_catalog.xml")
return
<CATALOG>
{ 
  for $light in $plant_catalog//LIGHT[not(following::LIGHT=.)]
  order by $light
  return
  element LIGHT
  {
    $light/@*,
    element EXPOSURE {fn:data($light)},
    
    for $plant in $plant_catalog//PLANT[./LIGHT=$light] return
      element PLANT 
      {
        $plant/@*,
        $plant/COMMON,
        $plant/BOTANICAL,
        $plant/ZONE,
        $plant/PRICE,
        $plant/AVAILABILITY
      }
    
  }
  
}
</CATALOG>
