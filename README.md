# PanView-Framer

A Framer.js module that makes desktop prototyping easy by allowing you to pan the view. This is super useful when viewing your prototype at 100% zoom and can't move around to reveal anything else then the center of your (large) desktop prototype

![Demo](/img/demo.gif)

## Add it in your Framer Studio project

- Download the project from github.
- Copy `PanView.coffee` into the project's `modules/` folder.
- Import it in Framer Studio by writing: `{PanView} = require 'PanView'`.
- Create an instance of PanView: `panView = new PanView'`.
- Add layers to your view: `layer.parent = panView`.


## How to use it
- Press and hold space to enable panning by dragging
- Press alt + space to reset view position

#### Basic usage
```coffeescript
{PanView} = require 'PanView'

panView = new PanView

layer = new Layer
	image: "images/google.png"
	width: 1440
	height: 900
	parent: panView
```

#### All options
```coffeescript
{PanView} = require 'PanView'

panView = new PanView
	width: 1440
	height: 900
	devicePixelRatio: 2 #All the children will be twice as large
	backgroundColor: 'f36'

layer = new Layer
	image: "images/google.png"
	width: 2880
	height: 1800
	parent: panView
```
    
    
#### Default options
```coffeescript
width: 1440
height: 900
devicePixelRatio: 1
backgroundColor: 'fff'
```

## Usage Example

[Here](https://framer.cloud/ZAOlO/) you can find a nice example.
