xquery version "1.0";

let $lib := doc("/Users/tarik/Desktop/TP9/Question5.xml")
let $attributs := "uuid"

return
unordered {
   <library>
      <items>
      {
      for $element in $lib//items/*
      return
           element
           {fn:node-name($element)}
           {
           attribute uuid {$element/@uuid },
           for $att in $element/@*[not(contains($attributs,./name()))] return
           element 
           {fn:node-name($att)}
           {string($att)}, 
           $element/*
           }
      }
      </items>
   </library>
}
