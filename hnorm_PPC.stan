data {
  int M; //number of years analyzed
}

generated quantities {
  real lambda = fabs(normal_rng(0,121));
  int y_sim[M];
  for (i in 1:M) {
    y_sim[i] = poisson_rng(lambda);
  }
}
