command line clipboard tool for macOS

## Usage

### list

Lists clipboard content types to standard output

	clipboard list

Output

	["public.utf8-plain-text", "NSStringPboardType", "public.rtf", "NeXT Rich Text Format v1.0 pasteboard type",
	"dyn.ah62d4rv4gu8ykzwynr11n6xdqzngn8dyn3y0n74qqf1gs7pbq7wza2xtqf3gkzd3sbwu", "DVTSourceTextViewLanguagePboardType",
	"dyn.ah62d4rv4gu8ykzwynr11n6xdqzngn8dyn3y0n74xqr11a3nqqf1gs7pbq7wyg55ssvw1u7cuqm10c6xenv61a3k",
	"DVTSourceTextViewScopeLanguageContextPboardType", "dyn.ah62d4rv4gu8ykzwynr11n6xdqzngn8dyn3y0n74msra1kuwtmvkge55bsmwfk8puqy",
	"DVTSourceTextViewIsAtBOLPboardType", "public.utf16-external-plain-text", "CorePasteboardFlavorType 0x75743136",
	"dyn.ah62d4rv4gk81n65yru", "CorePasteboardFlavorType 0x7573746C", "com.apple.traditional-mac-plain-text",
	"CorePasteboardFlavorType 0x54455854", "dyn.ah62d4rv4gk81g7d3ru", "CorePasteboardFlavorType 0x7374796C"

### get

Retrieve clipboard content of given type to standard output

	clipboard get public.rtf

Output

	{\rtf1\ansi\ansicpg1252\cocoartf1504\cocoasubrtf810
	{\fonttbl\f0\fnil\fcharset0 Consolas;}
	{\colortbl;\red255\green255\blue255;\red242\green223\blue54;\red2\green35\blue77;}
	{\*\expandedcolortbl;;\csgenericrgb\c94760\c87437\c21049;\cssrgb\c0\c19216\c37647;}
	\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\partightenfactor0

## TODO

* Add `set`, `add`, `remove`, `clear` commands
* Add `copy` and `paste` commands emulating `pbcopy` and `pbpaste` behavior
* Support input (`-i`) and output file (`-o`)
* Allow multi-type `get` and `set` using popular archive format (zip, gzip, and/or tar)
