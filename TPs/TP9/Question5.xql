xquery version "1.0";

let $lib := doc("/Users/tarik/Desktop/TP9/Question4.xml")
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
           $element/@*[not(contains("fullTitle",./name()))], 
           $element/*
           }
        }
      </items>
     </library>
}
