xquery version "1.0";

let $lib := doc("/Users/tarik/Desktop/TP9/Question8.xml")
return
unordered 
{
	for $element in $lib//*
	return
		if (name($element) = "publisher") then 
			element publisher { attribute idref {$element} }
    	else if (name($element) = "author") then 
			element publisher { attribute idref {$element} }
		else if (name($element) = "director") then 
			element publisher { attribute idref {$element} }
		else if (name($element) = "artist") then 
			element publisher { attribute idref {$element} }
		else if (name($element) = "illustrator") then 
			element publisher { attribute idref {$element} }
		else $element
}
