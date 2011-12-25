# HotCocoa Graphics

HotCocoa Graphics is a graphics library providing a simple object-oriented
interface into the power of Mac OS X's Core Graphics and Core Image
drawing libraries. With a few lines of easy-to-read code, you can
write scripts to draw simple or complex shapes, lines, and patterns,
process and filter images, create abstract art or visualize scientific
data, and much more.

Inspiration for this project was derived from Processing and NodeBox.
These excellent graphics programming environments are more
full-featured, but they are implemented in Java and Python,
respectively.  HotCocoa Graphics was created to offer similar
functionality using the Ruby programming language.

The original author of this library is James Reynolds, HotCocoa
Graphics was then called Ruby Cocoa Graphics and was packaged as part
of HotCocoa. Matt Aimonetti then extracted it, added more examples and
specs so that the library could be used as an addon to projects
without needing HotCocoa. This particular fork brings the code back
under the HotCocoa umbrella, but keeps it as a separate repository to
keep things more modular.

## Examples

You can see a list of examples in the examples folder, but here is a quick sample:

    class CustomView < NSView
      include MRGraphics

      def drawRect(rect)
        dimensions = [CGRectGetWidth(rect), CGRectGetHeight(rect)]
        Canvas.for_current_context(:size => dimensions) do |c|
          c.background(Color.black)
          white = Color.white
          c.fill(white)
          c.stroke(0.2)
          c.stroke_width(1)
          c.font("Zapfino")

          80.times do
            c.font_size rand(170)
            c.fill(white.copy.darken(rand(0.8)))
            letters = %W{ g i a n a }
            c.text(letters[rand(letters.size)],
                    rand(c.width),
                    rand(c.height))
          end
        end
      end

    end

    # wrapper class to keep the examples as clean/simple as possible
    app = AppWrapper.new
    # assign an instance of our custiom NSView to the window's content view
    app.window.contentView = CustomView.alloc.initWithFrame(app.frame)
    # start the app
    app.start

![MacRuby Graphics Canvas example](http://img.skitch.com/20100712-1x4dswurhxcqexq5tpidj29axc.png)


    class CustomView < NSView
      include MRGraphics

      def drawRect(rect)
        dimensions = [CGRectGetWidth(rect), CGRectGetHeight(rect)]
        Canvas.for_current_context(:size => dimensions) do |c|
          c.background(Color.white)
          c.font('Skia')
          c.font_size(14)
          # set image width,height
          w, h = [95,95]
          # set initial drawing position
          x, y = [10, c.height - h - 10]
          # load and resize two images
          img_a = Image.new(File.join(HERE, 'images', 'v2.jpg')).resize(w,h)
          img_b = Image.new(File.join(HERE, 'images', 'italy.jpg')).resize(w,h)

          # add image B to image A using each blending mode, and draw to canvas
          [:normal,:multiply,:screen,:overlay,:darken,:lighten,
            :colordodge,:colorburn,:softlight,:hardlight,:difference,:exclusion,
            :hue,:saturation,:color,:luminosity,:maximum,:minimum,:add,:atop,
            :in,:out,:over].each do |blendmode|
            img_a.reset.resize(w,h)
            img_a.blend(img_b, blendmode)
            c.draw(img_a,x,y)
            c.text(blendmode, x, y-15)
            x += w + 5
            if (x > c.width - w + 5)
              x = 10
              y -= h + 25
            end
          end
        end
      end

    end

    # wrapper class to keep the examples as clean/simple as possible
    app = AppWrapper.new(415,730)
    # assign an instance of our custiom NSView to the window's content view
    app.window.contentView = CustomView.alloc.initWithFrame(app.frame)
    # start the app
    app.start

![MacRuby Image blend modes](http://img.skitch.com/20100712-bedhi8i4ppuqetad263w3ehuna.png)

##More examples:
_see the examples folder for the source code of each image's source code._

![MacRuby Graphics Image color effects](http://img.skitch.com/20100712-jr4jfhbaw2x9nmhy7bscapgbd4.png)
![MacRuby Graphics Image Iterate](http://img.skitch.com/20100713-1132mmahgum65tpgj9d9mag939.png)
![MacRuby Graphics particles examples](http://img.skitch.com/20100713-gb3ps8psw3ppyedx1t1x426rwa.png)
![MacRuby Graphics ropes](http://img.skitch.com/20100713-mseyj6qjxp38jnm2xkxpw6ebq4.png)
![MacRuby Graphics effects](http://img.skitch.com/20100716-8ma9te4tc8th723hd4t5rmbbb8.png)
![MacRuby Graphics Image resizing](http://img.skitch.com/20100715-k8k8f1gd8rb9e1wfj4ush9i5bf.png)
![MacRuby Graphics randomize](http://img.skitch.com/20100715-tycucqsgsfiy7syef8i24sw9xj.png)
![MacRuby Graphics Spirograph](http://img.skitch.com/20100715-jh4nsrm193a2ttdmjjnh4g1x96.png)
![MacRuby Graphics color sampler](http://img.skitch.com/20100716-nth8dcm4ag12bcns1fgngt4ird.png)
![MacRuby Graphics Rubbons](http://img.skitch.com/20100715-18f5pwc96b2gdfcdag26sjujam.png)
