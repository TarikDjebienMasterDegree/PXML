xquery version "1.0";

let $lib := doc("/Users/tarik/Desktop/TP9/Question6.xml")

let $movieNotSignificative := "pages numberInSeries"
let $musicNotSignificative := "pages numberInSeries"
let $softwareNotSignificative := "pages numberInSeries"

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
           $element/@*,
           if($element/name() = "movie") then 
             $element/*[not(contains($movieNotSignificative,./name()))]
           else if($element/name() = "music") then
             $element/*[not(contains($musicNotSignificative,./name()))]
           else if($element/name() = "software") then
             $element/*[not(contains($softwareNotSignificative,./name()))]
           else $element/*
           }
      }
      </items>
   </library>
}
