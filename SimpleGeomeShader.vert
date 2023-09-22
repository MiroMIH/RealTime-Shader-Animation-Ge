float time; // Global variable to represent time

// Function to generate noise based on 2D input
float noise(vec2 p)
{
    return sin(p.x * 3.0) * sin(p.y * (3.0 + sin(time / 6.0))) + 0.4;
}

// Function to define a color palette based on a float input
vec3 palette(in float t)
{
    vec3 a = vec3(0.5, 0.5, 0.5);
    vec3 b = vec3(0.5, 0.5, 0.5);
    vec3 c = vec3(1.0, 1.0, 1.0);
    vec3 d = vec3(0.263, 0.116, 0.457);
    return a + b * cos(6.28318 * (c * t + d));
}

// Main function to determine the color of each pixel
void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    // Calculate the normalized UV coordinates of the current pixel
    vec2 uv = (fragCoord * 2.0 - iResolution.xy) / iResolution.y;
    vec2 uv0 = uv; // Store the initial UV coordinates
    vec3 finalcolor = vec3(0.0); // Initialize the final color

    for (float i = 0.0; i < 2.0; i++)
    {
        uv *= 2.0;
        uv = fract(uv * 1.4);
        uv -= 0.5;

        vec3 col = vec3(0.5, 1.0, 2.0); // Initialize a color vector
        float d = length(uv) * exp(-length(uv0));

        // Use the palette function to define the color based on a length and time
        col = palette(length(uv0) + i * 0.4 + iTime * 0.4);

        // Modify the color using sine and power functions
        d = sin(d * 2.0 + iTime) / 6.0;
        d = pow(0.01 / d, 1.2) + 0.4;
        col *= d;

        // Accumulate the color for each iteration
        finalcolor += col * d;
    }

    // Set the final color for the current pixel
    fragColor = vec4(finalcolor, 1.0);
}
