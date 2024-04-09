//
// This Stan program defines a simple model, with a
// vector of values 'Y' modeled as Poisson distributed.
//

// The input data is a vector 'Y' of length 'N'.
data {
  int <lower=0> N;
  vector[N] Y;
}

// The parameters accepted by the model.
parameters {
  real <lower = 0> mu;
}

// The model to be estimated.
model {
  //LIKELIHOOD
  Y ~ poisson(mu);
}
