//Used to prevent corruption of certain characters when converted from string to XML
_this
	regexReplace ["&", "&amp;"]
	regexReplace ["<", "&lt;"]
	regexReplace [">", "&gt;"]
	regexReplace ['"', "&quot;"]
	regexReplace ["'", "&apos;"];