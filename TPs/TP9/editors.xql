xquery version "1.0";

let $lib := doc("/Users/tarik/Desktop/TP9/Question8.xml")
return
unordered 
{
	<editors>
	{
		for $editor in distinct-values($lib//publisher)
		order by $editor
		return 
			element editor {
			    attribute id {$editor},
				$editor
			}
	}
	</editors>
}
