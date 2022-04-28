#!/bin/bash

for file in */media/*.jpg
do
	echo $file
	docker run -v /$(pwd)/$file:/slides/$file rafakato/alpine-graphicsmagick gm convert /slides/$file /slides/$file;
done
#docker run -v /$(pwd)/eco-fair-trade:/slides/eco-fair-trade rafakato/alpine-graphicsmagick gm identify /slides/eco-fair-trade/media/*jpg;
#docker run -v /$(pwd)/eco-recycling:/slides/eco-recycling rafakato/alpine-graphicsmagick gm identify /slides/eco-recycling/media/*jpg;
#docker run -v /$(pwd)/eco-regional:/slides/eco-regional rafakato/alpine-graphicsmagick gm identify /slides/eco-regional/media/*jpg;
#docker run -v /$(pwd)/fairtrade:/slides/fairtrade rafakato/alpine-graphicsmagick gm identify /slides/fairtrade/media/*jpg;

#docker run -v /$(pwd)/fairtrade:/slides/fairtrade rafakato/alpine-graphicsmagick gm identify /slides/fairtrade/media/15.jpg;