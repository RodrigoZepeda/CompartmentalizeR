CompartmentalizeR
================

R app (developed in Shiny) for the interactive creation of compartmental models (such as the ones in chemical-kinetics, molecular biology, epidemiology, environmental sciences and more). **Easy drag-and-click interface. No code nor equations required**.

![HIV model](readme-images/HIVModel.png)

User can create Ordinary Differential Equations, Discrete Time Markov Chains and Continuous Time Markov Chains only by establishing relationships between compartments:

![HIV model](readme-images/HowitWorks.png)
<p>
<center style="font-size: small;">
Yes: it's that easy!
</center>
</p>
<h2>
Index
</h2>
1.  [Intallation](##Installation)

    -   [I am an R newbie](#newbie)

    -   [I am an R guru](#IamanRGuru)

2.  [Worked example](#example)

3.  [Advanced options](#Advancedoptions)

    \*[Deleting stuff](#Deleting)

    \*[Seeding the simulation](#Seeds)

4.  [Examples](#Examples)

5.  [The Theory](#Theory)

6.  [Common errors](#Commonerrors)

7.  [Collaborate](#Contributor)

8.  [Additonal information](#Additionalinformation)

    \*[License](#License)

    \*[Authors](#Authors)

<a name="Installation"></a>
<h2>
Installation
</h2>
For installing the program there are two options: either you are an [R newbie](#newbie) or you already [know your way around](#IamanRGuru). Choose the option that best suits you.

<a name="IamanRGuru"></a>
<h3>
I am an R Guru
</h3>
You need to install the following libraries: `deSolve`, `shiny`, `ggplot2`, `reshape`, `markovchain`, and `GillespieSSA`. For deploying the App you can download it and run it with `shiny::runApp` or run it from Github:

``` r
shiny::runGitHub("RodrigoZepeda/CompartmentalizeR")
```

<a name="newbie"></a>
<h3>
I am an R newbie
</h3>
For using this program you need to download [R from its site](https://www.r-project.org/). Follow their instructions. Once R has been installed it will look like this (it varies from platform to platform):

<center>
<img src="readme-images/HowRlooks.png" alt="How R looks" width = "300px"/>
</center>

Before using the programme you need to install an additional package called `shiny`. Type into the R console `install.packages("shiny")`. You might need to select a CRAN mirror: choose whichever you like.

<center>
<img src="readme-images/InstallShiny.png" alt="Installing shiny" width = "300px"/>
</center>

After installing type the following code to start using **CompartmentalizeR**: `shiny::runGitHub("RodrigoZepeda/CompartmentalizeR")`

<center>
<img src="readme-images/RunCompartmentalizeR.png" alt="Run CompartmentalizeR" width = "300px"/>
</center>

A window with the software will deploy. Don't use it just yet: check the R window as it might be installing everything you need. You might need to select a CRAN mirror: choose whichever you like.

<center>
<img src="readme-images/Installing.png" alt="Installing CompartmentalizeR" width = "300px"/>
</center>

A message will tell you when you can use the software.

<center>
<img src="readme-images/Youcanuseit.png" alt="You can use it" width = "300px"/>
</center>

If you ever want to use the program again you'll just need to type `shiny::runGitHub("RodrigoZepeda/CompartmentalizeR")` in the R console. No more installation will be required.

**REMEMBER: The program will only work with an Internet Connection**

<a name="example"></a>
<h2>
Worked example
</h2>
We'll start with a model from epidemiology: the SI model. In this case people are assumed to be either Susceptible to a disease (S) or Infected by the disease (I). Let's do it!

![](readme-images/example1.png) ![](readme-images/example2.png) ![](readme-images/example3.png) ![](readme-images/example4.png) ![](readme-images/example5.png) ![](readme-images/example6.png) ![](readme-images/example7.png) ![](readme-images/example8.png) ![](readme-images/example9.png) ![](readme-images/example10.png) ![](readme-images/example11.png) ![](readme-images/example12.png) ![](readme-images/example13.png) ![](readme-images/example14.png) ![](readme-images/example15.png) ![](readme-images/example16.png) ![](readme-images/example17.png)

<a name="Advancedoptions"></a>
<h2>
Additional things you should know
</h2>
<a name="Deleting"></a>
<h3>
Deleting stuff
</h3>
![](readme-images/example18.png) ![](readme-images/example19.png) ![](readme-images/example20.png)

<h3>
What does a compartment pointing to itself mean?
</h3>
A compartment pointing to itself is required in several models.

![](readme-images/pointingitself.png)

If you are simulating a **Discrete Time Markov Chain** a compartment pointing to itself means a positive probability for *remaining in that compartment in the next moment in time*

If you are simulating an **Ordinary Differential Equation** or a **Continuous Time Markov Chain** an compartment pointing to itself means variables entering the model (or leaving if the associated constant is negative). It is very helpful if your model is not a closed model.

<a name="Seeds"></a>
<h3>
Seeding the simulations
</h3>
For setting a seed so that you can always obtain the same results from pseudorandom simulations go to the **Options** pane and set a seed. (This is a wrapper for R's `set.seed` function)

![](readme-images/seed.png)

<a name="Examples"></a>
<h2>
Examples
</h2>
Some examples of modeling using compartmental models are in the `examples` folder. An additional file with examples will be created

<a name="Theory"></a>
<h2>
The theory
</h2>
An additional file including the theory of compartmental models will be uploaded

<a name="Commonerrors"></a>
<h2>
Common errors
</h2>
Error messages will appear in the R console. I will update this section soon.

<a name="Contributor"></a>
<h2>
Contributor Code of Conduct
</h2>
As contributors and maintainers of this project, we pledge to respect all people who contribute through reporting issues, posting feature requests, updating documentation, submitting pull requests or patches, and other activities.

We are committed to making participation in this project a harassment-free experience for everyone, regardless of level of experience, gender, gender identity and expression, sexual orientation, disability, personal appearance, body size, race, ethnicity, age, or religion.

Examples of unacceptable behavior by participants include the use of sexual language or imagery, derogatory comments or personal attacks, trolling, public or private harassment, insults, or other unprofessional conduct.

Project maintainers have the right and responsibility to remove, edit, or reject comments, commits, code, wiki edits, issues, and other contributions that are not aligned to this Code of Conduct. Project maintainers who do not follow the Code of Conduct may be removed from the project team.

Instances of abusive, harassing, or otherwise unacceptable behavior may be reported by opening an issue or contacting one or more of the project maintainers.

This Code of Conduct is adapted from the Contributor Covenant, version 1.0.0, available from <http://contributor-covenant.org/version/1/0/0/>

<a name="Additionalinformation"></a>
<h2>
Additional information

<a name="License"></a>
<h3>
License
</h3>
This app is free and open source software, licensed under [GPL-3](https://www.gnu.org/licenses/gpl-3.0.html).

<a name="Authors"></a>
<h3>
Authors
</h3>
Rodrigo Zepeda-Tello <rzepeda17@gmail.com>
