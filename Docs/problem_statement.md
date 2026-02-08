# Problem Statement

This project investigates the numerical solution of a tensioned cable
subjected to a distributed load using the finite element method (FEM).
The work extends a previous convergence study by introducing numerical
integration and a fully modular finite element implementation.

The cable is modeled as a one-dimensional structural system under constant
tension. The objective is to develop a generic FEM framework capable of
handling an arbitrary number of elements while incorporating numerical
integration schemes and essential boundary conditions.

Different Gauss integration schemes are evaluated to analyze their impact
on solution accuracy, reaction forces, and error estimation. The analytical
solution serves as a reference for validation.

The study includes convergence analysis, error estimation based on solution
gradients, and comparison between exact integration and numerical integration
approaches commonly used in computational mechanics.
