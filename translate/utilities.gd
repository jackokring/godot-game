class_name Util
extends Node
## Translation and string utilities.

## Escape string formats.
static func escape(fmt: String) -> String:
	return fmt.replace("%", "%%").replace("{}", "%s")

## Applies a translation dictionary for {KEY} inclusions
## and convert {} to %s format string specifiers.
static func format(fmt: String) -> String:
	var dict := {}
	# remove blank keys as datums
	fmt = escape(fmt)
	var split = fmt.split("{")
	for i in split:
		var key = i.split("}")[0]
		dict[key] = TranslationServer.tr(key)
	return fmt.format(dict)

## Applies a translation dictionary for {KEY} inclusions
## followed by a % format substitution of an array of items
## defined as {} inclusions with no key name.
static func percent(fmt: String, array: Array) -> String:
	return format(fmt) % array

## Makes a plural or singular number item by translation of a key
## appending "_A" for singular keys, and replacing {} with the
## string representation of the number.
## This is useful to make array items for [method Util.percent].
static func plural(key: String, number: int) -> String:
	var fmt: String
	if number == 1:
		# a singular
		fmt = TranslationServer.tr(key + "_A")
	else:
		# plural is default
		fmt = TranslationServer.tr(key)
	return escape(fmt) % number
