data {
  int M; //number of years analyzed
  vector[M] miles; //number of miles flown each year
}

generated quantities {
  real theta = fabs(normal_rng(0,0.021));
  int y_sim[M];
  for (i in 1:M) {
    y_sim[i] = poisson_rng(theta*miles[i]);
  }
}
