xquery version "1.0";
declare base-uri "file:///Users/tarik/Desktop/TP8/Exercice3/";
let $plant_catalog := doc("plant_catalog.xml")
let $plant_order := doc("plant_order.xml")
return
<PRICE>
{
round-half-to-even(
sum(
  let $res := 0
  for $plantCmd in $plant_order//PLANT
  let $common := $plantCmd//COMMON
  let $quantity := $plantCmd//QUANTITY
  return
    for $plant in $plant_catalog//PLANT[./COMMON=$common]
    let $priceUnit := number(substring($plant//PRICE/text(),2))
    return
    $res + ($priceUnit * number($quantity))     
),
1)
}
</PRICE>
