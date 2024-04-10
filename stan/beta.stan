//
// This Stan program defines a simple model, with a
// vector of values 'Y' modeled as reparameterized beta
// distributed with parameters 'alp' and 'sc'.
//

functions{
  real BT_log(vector x, real alp, real sc){
    vector[num_elements(x)] prob;
    real lprob;
    for (i in 1:num_elements(x)){
      prob[i] = (x[i]^(alp - 1)*(1 - x[i])^(sc - 1))/( exp(lbeta(alp, sc)));
    }
    lprob = sum(log(prob));
    return lprob;
  }
}

// The input data is a vector 'Y' of length 'N'.
data {
  int <lower=0> N;
  vector[N] Y;
}

// The parameters accepted by the model. Our model
// accepts two parameters 'alp' and 'sc'.
parameters {
  real <lower= 0 > alp;
  real <lower= 0 > sc;
}

// The model to be estimated. 
model {
  // PRIORS
  alp ~ gamma(0.001,0.001);
  sc ~ gamma(0.001,0.001);
  // LIKELIHOOD
  Y ~ BT(alp, sc);
}
