xquery version "1.0";

let $lib := doc("/Users/tarik/Desktop/TP9/Question7.xml")

return
unordered {
   <library>
      <books>
      {
      for $element in $lib//items/book
      return
        element
           {fn:node-name($element)}
           {$element/@*,$element/*}
      }
      </books>
      <movies>
      {
      for $element in $lib//items/movie
      return
        element
           {fn:node-name($element)}
           {$element/@*,$element/*}
      }
      </movies>
      <musics>
      {
      for $element in $lib//items/music
      return
        element
           {fn:node-name($element)}
           {$element/@*,$element/*}
      }
      </musics>
      <softwares>
      {
      for $element in $lib//items/software
      return
        element
           {fn:node-name($element)}
           {$element/@*,$element/*}
      }
      </softwares>
   </library>
}
