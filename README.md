This is a cleanup of the code used to generate [this visualization](https://www.reddit.com/comments/153somz) of Taskmaster contestants' strengths and weaknesses.

Running `ruby generate_plots.rb` will fill out the template with the appropriate values from the `data` file and pass it along to `gnuplot`, which will generate an individual SVG file for each of the 75 rows/contestants. I know `gnuplot` has great support for multiplots, but I figured it'd be easier to shell out from Ruby and do the post processing with ImageMagick.

With the plots generated, `montage *.svg -geometry '+0+0' -tile 5x15 out.png` will arrange them into a single image (one row per series), and then a wee `mogrify -negate out.png` will make the final result pretty enough to share on the internet.
