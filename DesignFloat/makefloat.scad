include <poly.scad>;

hei = 70; 

 module shape()
{
linear_extrude(height=hei)
    {
       polygon(points);
    }
}


    shape();
