# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Symbols:
#["YPFD.BA", "GGAL.BA", "PAMP.BA", "SAMI.BA", "EDN.BA", "ALUA.BA", "TS.BA"]

stocks = ListStock.create([
		{name: "YPFD", market: "BA"},
		{name: "GGAL", market: "BA"},
		{name: "PAMP", market: "BA"},
		{name: "SAMI", market: "BA"},
		{name: "EDN", market: "BA"},
		{name: "TS", market: "BA"},
		{name: "LEDE", market: "BA"},
		{name: "CRES", market: "BA"}
	])