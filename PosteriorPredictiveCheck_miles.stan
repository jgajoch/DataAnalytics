data{
  int M; //number of years analyzed
  vector[M] miles; //number of miles flown each year
  int y[M]; //number of fatal accidents
}
parameters{
  real<lower=0>theta;
}
model{
  theta ~ normal(0,0.021);
  for(i in 1:M){
    y[i] ~ poisson(miles[i]*theta);
  }
}
generated quantities{
  int y_sim[M];
  for(i in 1:M){
    y_sim[i] = poisson_rng(miles[i]*theta);
  }
}
