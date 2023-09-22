# RealTime-Shader-Animation-Ge

The provided GLSL shader is designed to generate a visual effect, often used in real-time graphics, computer games, or procedural art.

## Preview

![Shader Preview](Preview.gif)


## Global Variables

- `float time;`: This is a global variable representing time. It is likely used to create time-dependent animations or effects in the shader.

## `noise` Function

- `float noise(vec2 p)`: This function takes a 2D vector `p` as input and returns a float value. It generates procedural noise based on the input coordinates, creating random or pseudo-random patterns.

## `palette` Function

- `vec3 palette(in float t)`: This function takes a float `t` as input and returns a 3D vector (`vec3`). It defines a color palette based on the input value `t`. The palette consists of four parameters `a`, `b`, `c`, and `d`, which are used to calculate the final color.

## `mainImage` Function

- `void mainImage(out vec4 fragColor, in vec2 fragCoord)`: This is the main function of the shader responsible for determining the color of each pixel.
- `vec2 uv`: This variable calculates the normalized UV coordinates of the current pixel relative to the screen resolution.
- `vec2 uv0`: It stores the initial UV coordinates for later reference.
- `vec3 finalcolor`: This variable initializes the final color that will be assigned to the current pixel.
- The shader runs a loop twice (for `i` from 0.0 to 1.0), which repeats a set of operations for each iteration.
- `uv` is modified by scaling, fracturing, and shifting operations within the loop.
- `vec3 col`: This variable initializes a color vector.
- `float d`: It calculates the length of the modified `uv` and uses it to modify the color palette based on the length and time.
- The `col` variable is updated using the `palette` function.
- `d` undergoes further modification using trigonometric and power functions.
- The modified color `col` is accumulated into the `finalcolor` variable for each iteration.
- Finally, the `finalcolor` is assigned to the `fragColor`, which represents the color of the current pixel.

Overall, the shader combines mathematical operations, noise generation, and color palette manipulation to create a visually interesting and dynamic effect. The use of time (`time` and `iTime`) allows for animations or changes over time, and the `palette` function defines the color scheme for the output. The shader operates on UV coordinates and applies various transformations to achieve its visual result.
