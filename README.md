# Spirograph

With this script you can generate and modify the animation of a spirograph using Matlab.
The trajectory of the moving circles is a circular-oscillating motion.

Changing the associated parameters of the moving circles will change the pattern of the drawing.

- $r1,r2,r3: $ Radius of the circles.
- $s1,s2,s3: $ Speeds of the circles. s1 with value 7 means that circle 1 rotates 7 turns for each turn of the radial reference system.
- $k: $ Oscillations amplitude. k with value 0.5 means that the circles oscillate with respect to the radial reference system with an amplitude equal to half the radius.
- $n: $ Number of oscillations for each turn of the reference system.




# Different patterns

$$ [k,n] = [0,8] $$

$$ [r1,r2,r3] = [9,7,5] $$

$$ [s1,s2,s3] = [9,5,7] $$

![SpirographAnimation0](/animations/k_0.0_n_8.0_r123_9.0_7.0_5.0_s123_9.0_5.0_7.0.png)
![SpirographAnimation1](/animations/k_0.0_n_8.0_r123_9.0_7.0_5.0_s123_9.0_5.0_7.0.mp4)

___

$$ [k,n] = [0.25,8] $$

$$ [r1,r2,r3] = [2,2,2] $$

$$ [s1,s2,s3] = [5,5,5] $$

![SpirographAnimation2](/animations/k_0.25_n_8.0_r123_2.0_2.0_2.0_s123_5.0_5.0_5.0.png)
![SpirographAnimation3](/animations/k_0.25_n_8.0_r123_2.0_2.0_2.0_s123_5.0_5.0_5.0.mp4)

___

$$ [k,n] = [0.25,8] $$

$$ [r1,r2,r3] = [3,4,3] $$

$$ [s1,s2,s3] = [3,5,7] $$

![SpirographAnimation4](/animations/k_0.25_n_8.0_r123_3.0_4.0_3.0_s123_3.0_5.0_7.0.png)
![SpirographAnimation5](/animations/k_0.25_n_8.0_r123_3.0_4.0_3.0_s123_3.0_5.0_7.0.mp4)

___

$$ [k,n] = [0.5,10] $$

$$ [r1,r2,r3] = [5,6,7] $$

$$ [s1,s2,s3] = [9,11,13] $$

![SpirographAnimation6](/animations/k_0.50_n_10.0_r123_5.0_6.0_7.0_s123_9.0_11.0_13.0.png)
![SpirographAnimation7](/animations/k_0.50_n_10.0_r123_5.0_6.0_7.0_s123_9.0_11.0_13.0.mp4)

___

$$ [k,n] = [1,12] $$

$$ [r1,r2,r3] = [5,5,5] $$

$$ [s1,s2,s3] = [5,7,9] $$

![SpirographAnimation8](/animations/k_1.00_n_12.0_r123_5.0_5.0_5.0_s123_5.0_7.0_9.0.png)
![SpirographAnimation9](/animations/k_1.00_n_12.0_r123_5.0_5.0_5.0_s123_5.0_7.0_9.0.mp4)



