xquery version "1.0";

let $lib := doc("/Users/tarik/Desktop/TP9/Question3.xml")
let $attributs := "publisher label edition"

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
           if($element/@*[contains($attributs,./name())]) then
            
            if ($element/@publisher) then
              attribute publisher {$element/@publisher }
            else if ($element/@label) then
              attribute publisher {$element/@label }
            else
              attribute publisher {$element/@edition }
           else (),
           $element/@*[not(contains($attributs,./name()))], 
           $element/*
           }
      }
      </items>
   </library>
}
