extends Node

var tile_size = Vector2(128, 128)
onready var texture = $SpriteTerrain.texture

func _ready():
	var text_width = texture.get_width()/tile_size.x
	var text_height = texture.get_height()/tile_size.y
	var tileSet = TileSet.new()
	for x in range(text_width):
		for y in range(text_height):
			var region = Rect2(x * tile_size.x, y * tile_size.y, tile_size.x, tile_size.y)
			var id = x + y * 10
			tileSet.create_tile(id)
			tileSet.tile_set_texture(id, texture)
			tileSet.tile_set_region(id, region)
	ResourceSaver.save("res://Terrains/terrain_tiles.tres", tileSet)
