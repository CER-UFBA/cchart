//
// This Stan program defines a simple model, with a
// vector of values 'Y' modeled as Unit-half-normal distributed
// with parameter 't'.
//

functions{
  real UHN_log(vector x, real t){
    vector[num_elements(x)] prob;
    real lprob;
    for (i in 1:num_elements(x)){
      prob[i] = (2* exp(std_normal_lpdf( x[i]/((t/(0.6744898*(1 - t)))*(1 - x[i])))))/((t/(0.6744898*(1 - t)))*(1 - x[i])^2);    
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
// accepts one parameter 't'.
parameters {
  real <lower=0,upper=1> t;
}

// The model to be estimated.
model {
//PRIOR
  t ~ normal(0, 2.5);
//LIKELIHOOD
  Y ~ UHN(t);
}
