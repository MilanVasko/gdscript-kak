# Syntax highlighting for gdscript, based on the zig-kak lang repo
hook global BufCreate .*[.]gd %{
	set-option buffer filetype gd
}

addhl shared/gd regions
addhl shared/gd/code default-region group
addhl shared/gd/double-string region 'c?"' (?<!\\)(\\\\)*" fill string
addhl shared/gd/single-string region "'" (?<!\\)(\\\\)*' fill string
addhl shared/gd/comment-line region '#' '$' fill comment
# multiline comment-line is missing

# basic syntax highlighting for inbuilt words
addhl shared/gd/code/ regex '\b(?:extends|onready|const|var|extern|export|static|setget|tool|signal)\b' 0:keyword 
addhl shared/gd/code/ regex '\b(?:class|enum)\b' 0:keyword 
addhl shared/gd/code/ regex '\b(?:if|elif|else|match|and|or)\b' 0:keyword 
addhl shared/gd/code/ regex '\b(?:while|for)\b' 0:keyword 
addhl shared/gd/code/ regex '\b(?:null)\b' 0:keyword 
addhl shared/gd/code/ regex '\b(?:func)\b' 0:keyword 

# math syntax
addhl shared/gd/code/operator regex '(\+%?|-%?|/|\*%?|=|\^|&|\?|\||!|>|<|%|<<%?|>>)=?' 0:default 
addhl shared/gd/code/num regex '\b[0-9]+(.[0-9]+)=([eE][+-]?[0-9]+)=' 0:value

# ALL TYPES, i included basic types i was using, mostly 2d based
# I didnt want to go through each existing type in the Godot docs, you can fork and add things yourself
# Or you can submit pull requests but the type list will get really huge
addhl shared/gd/code/type regex '\b(?:bool|float|int|bool|String|Vector2|Vector3|Rect2|Transform2D|Plane|Quat|AABB|Basis|Transform|Color|Object|Array|Dictionary|Viewport|AudioStreamPlayer|CanvasLayer|Spatial|AnimationPlayer|AnimationTreePlayer|WorldEnvironment|Timer|Tween|Sprite|Area2D|CollisionShape2D|TileMap|Camera|Camera2D|YSort|AnimatedSprite)\b' 0:type

hook -group gd-highlight global WinSetOption filetype=gd %{ add-highlighter window/gd ref gd }
hook -group gd-highlight global WinSetOption filetype=(?!gd).* %{ remove-highlighter window ref/gd }
