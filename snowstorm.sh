#!/bin/sh
for i in {1..100}
do
  openscad -o flake$i.stl SnowFlake.scad 
done
