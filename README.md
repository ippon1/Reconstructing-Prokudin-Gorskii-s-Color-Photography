# Reconstructing-Prokudin-Gorskii-s-Color-Photography
Reconstructing Prokudin-Gorskii's Color Photography using digitally processing.

We use digitized glass plate images from the Prokudin-Gorskii collection.

## About the Photographer
Sergei Mikhailovich Prokudin-Gorskii (1863-1944) was a photographer who, between the years 1909-1915, traveled the Russian empire and took thousands of photos of everything he saw. He used an early color technology that involved recording three exposures of every scene onto a glass plate using a red, green, and blue filter. Back then, there was no way to print such photos, and they had to be displayed using a special projector. Prokudin-Gorskii left Russia in 1918. His glass plate negatives survived and were purchased by the Library of Congress in 1948. Today, a digitized version of the Prokudin-Gorskii collection is available online.

## Description
There are sets of glass plate images made available by the Library of Congress, where the R, G and B channels are labelled by the suffixes '_R', '_G' and '_B', respectively. I wrote a program that reads in the three channel images and returns a RGB color image. The three channels are not perfectly aligned, thus the program has to align them automatically. In order to do so, exhaustively I search over a window of possible displacements (say [-15,15] pixels), I score each one using some image matching metric, and take the displacement with the best score. Although the images do not actually have the same brightness values (they are different color channels), the normalized cross-correlation (NCC) is a sufficient choice for the image matching metric.

## Links
* [Prokudin-Gorskii Collection](https://www.loc.gov/collections/prokudin-gorskii/?st=list&c=150)
* [Sergey Prokudin-Gorsky Wikipedia](https://en.wikipedia.org/wiki/Sergey_Prokudin-Gorsky#Gallery)


This program was built for the lecture [Computer Vision](https://cvl.tuwien.ac.at/course/computer-vision-vu/) at [TU Wien](https://cvl.tuwien.ac.at).
