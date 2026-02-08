# Cable Deflection Using Finite Element Method – Part 2

This project extends the cable deflection study developed in Part 1 by
introducing advanced finite element concepts and numerical integration
techniques. The objective is to develop a generic FEM application capable
of solving the problem for an arbitrary number of elements.

The implementation includes linear interpolation on the reference element,
numerical integration using Gauss quadrature, and the application of
essential boundary conditions through equation elimination.

The study focuses on the influence of mesh refinement and integration
schemes on solution accuracy, reaction forces, and error estimation.

## Features

- Linear finite element interpolation
- Exact and numerical integration (Gauss 1, 2, and 3 points)
- Assembly of global matrices
- Essential boundary condition treatment
- Reaction force computation
- Gradient-based error estimation
- Convergence analysis

## Repository Structure

- `/matlab` : FEM solver and numerical routines
- `/report` : Project report
- `/figures` : Results and comparison plots
- `/docs` : Problem description and theory

## Requirements

MATLAB (recommended R2021 or later)

## Author

Gilbert Djidiack Faye
