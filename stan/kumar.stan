//
// This Stan program defines a simple model, with a
// vector of values 'Y' modeled as Kumaraswamy distributed
// with parameters 'alp' and 'bet'.
//

functions{
  real KUM_log(vector x, real alp, real bet){
    vector[num_elements(x)] prob;
    real lprob;
    for (i in 1:num_elements(x)){
      prob[i] = alp*bet*(x[i]^(alp - 1)) *((1 - x[i]^alp)^(bet - 1));
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
// accepts two parameters 'alp' and 'bet'.
parameters {
  real <lower= 0 > alp;
  real <lower= 0 > bet;
}

// The model to be estimated.
model {
  // PRIORS
  alp ~ gamma(0.001,0.001);
  bet ~ gamma(0.001,0.001);
  // LIKELIHOOD
  Y ~ KUM(alp, bet);
}
