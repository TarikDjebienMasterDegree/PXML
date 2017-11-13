xquery version "1.0";

let $lib := doc("http://www.fil.univ-lille1.fr/~yroos/pxml/pxml-9/Library.xml")
let $forbidden := "asin boxHeightInInches boxLengthInInches boxWeightInPounds boxWidthInInches conductor country 
currentValue dueDate esrbrating features genre hasExperienced id language lastLookupTime listened location mediaID mediacount minutes mpaarating name 
netrating played players price published purchaseDate rare rating read signed used watched"

return
unordered {
   <library>
      <items>
      {
      for $element in $lib//items/*
      return 
           element
           {fn:node-name($element)}
           {$element/@*[not(contains($forbidden,./name()))], $element/*}
      }
      </items>
   </library>
}
