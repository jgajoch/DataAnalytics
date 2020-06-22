data{
  int M; //number of years analyzed
  int y[M]; //number of fatal accidents
}
parameters{
  real<lower=0>lambda;
}
model{
  lambda ~ normal(0,121);
  for(i in 1:M){
    y[i] ~ poisson(lambda);
  }
}
generated quantities{
  int y_sim[M];
  for(i in 1:M){
    y_sim[i] = poisson_rng(lambda);
  }
}
