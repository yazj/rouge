# defines the specific mutable properties of a Character, 
# generated characters are determined by the resources defined through this class.
class_name CharacterDefinition
extends Resource

@export_category("Visuals")
@export var name: String = "Unnamed"
@export var anim_frame: SpriteFrames
@export_color_no_alpha var color: Color

