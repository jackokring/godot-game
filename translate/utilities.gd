class_name Util
extends Node
## Translation and string utilities.

## Applies a translation dictionary for {KEY} inclusions.
## A dictionary of overrides to apply can be supplied.
static func format(fmt: String, apply: Dictionary = {}) -> String:
	# remove blank keys as datums
	apply[""] = "????"
	var split = fmt.split("{")
	for i in split:
		var key = i.split("}")
		if key.size() < 2:
			continue
		key = key[0]
		if apply[key] == null:
			apply[key] = TranslationServer.tr(key)
		if apply[key] is int:
			apply[key] = plural(key, apply[key])
	fmt = fmt.format(apply)
	if fmt.find("{") >= 0:
		# recurse
		fmt = format(fmt, apply)
	return fmt

## Makes a plural or singular number item by translation of a key
## appending "_number" for singular or exceptional keys, and
## replacing {KEY} with the string representation of the number.
static func plural(key: String, number: int) -> String:
	var num = str(number)
	var tag = key + "_" + num
	var fmt = TranslationServer.tr(tag) 
	# no translation
	if fmt == tag:
		# plural is default
		fmt = TranslationServer.tr(key)
	return fmt.replace("{" + key + "}", num)
