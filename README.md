# Vessel-Tortuosity-Index-VTI-
A reliable technique for quantification of vessel tortuosity in MATLAB 2015-2019. Desined for retinal images and applicable to other medical or non-medical images.


## Background
VTI is a mathematical model for assessing tortuosity of vessels and curvilinear objects. I originally developed it
for analysis of 2D retinal vessels but is applicable to other vessels and curve structure, defined by x and y coordinates
of the centerline of the vessel/object.

Retina is a light sensitive tissue located in the back of the eye which convert the light into signal and send it to 
the brain, enabling you to see. Retinal vessels are straight or mildly curved in a healthy eye (left figure). However, in 
many sight threatening diseases such as diabetic retinopathy, the vessels become twisted (right figure).

**Research has shown tortuosity is an early sign of many vision threatening retinal diseases. Therefore, it is important
to quantify tortuosity of vessels in the retina. Additionally, structural changes of heart and brain vessels are important 
for diagnosis and new discoveries.** 

![image](https://user-images.githubusercontent.com/34323960/66710641-8b6f0500-ed31-11e9-8867-b53b43354e25.png)

VTI combines multiple parameters related to vessel tortuosity to provide a number that matches with human visual
perception of tortuosity (files will be added to perform Pearson rank correlation for comparison).

VTI = (l_arch * sd * num_critical_pts * (mean_dm)) / l_cord where:

VTI: vessel tortousity index
sd: standard deviation of the angels between lines tangent to every pixel along the centerline.
mean_dm: average distance measure between inflection points along the centerline.
num_critical_pts: number of critical points along the centerline. 
l_arch: length of vessel (arch) which is number of centerline pixels.
l_cord: length of vessel chord which is the shortest path connecting vessel end points.

![image](https://user-images.githubusercontent.com/34323960/66710739-519efe00-ed33-11e9-937f-bb166be183dd.png)
![image](https://user-images.githubusercontent.com/34323960/66710749-77c49e00-ed33-11e9-95b8-cb7c65e075e1.png)

Visual demonstration of parameters extracted from a vessel centerline for VTI computation. (a) Angle between a 
line tangent to the centerline and a reference axis for the first centerline point. (b) Tangent lines for points 
along the centerline. SD of angles between each tangent line and the reference axis was computed. (c) Critical 
points (red circles) were determined based on changes in sign of slope of the tangent lines. (d) Magnitude of 
curve as ratio of arch length (LA) to the chord length (LC) between pairs of inflection points including 
centerline end points (red squares).

## Testing
Current version is compatible with MATLAB 2014 or newer. Run demo_VTI.m for a quick demo of the parameter 
used for calculating VTI and sample result. Note the main result is VTI but in the demo intermediate parameters
are also exported to help with understanding of the concept.

The main function is: vessel_tortousity_index(x, y, is_show), where x and y are coordinates of the centerline.
is_show takes value of 0 or 1. Use 1 for visualization of location of inflection and critical points.

## Coming soon

*A pipline for segmentation of retinal vessels in Fundus, Optos and OCTA to extract the centerline and measure its tortuosity.* 

* A function for smoothing vessel centerline for real-world applications. Note that smoothing is crucial for meaningful tortuosity analysis.*

*A function to automatically save the result in an excel file for large scale analysis of eye images.*


## Citation

Khansari, Maziyar M., William O’Neill, Jennifer Lim, and Mahnaz Shahidi. "Method for quantitative assessment of retinal vessel tortuosity in optical coherence tomography angiography applied to sickle cell retinopathy." Biomedical optics express 8, no. 8 (2017): 3796-3806.
