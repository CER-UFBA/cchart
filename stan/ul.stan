//
// This Stan program defines a simple model, with a
// vector of values 'Y' modeled as Unit-Lindley distributed
// with parameter 'mi'.
//

functions{
  real UL_log(vector x, real mi){
    vector[num_elements(x)] prob;
    real lprob;
    for (i in 1:num_elements(x)){
      prob[i] = ((1 - mi)^2 *exp(-(x[i]*(1- mi )/(mi*(1-x[i])))))/(mi*(1 - x[i])^3);
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

// The parameter accepted by the model. Our model
// accepts one parameter 'mi'.
parameters {
  real <lower=0,upper=1> mi;
}

// The model to be estimated.
model {
//PRIOR
  mi ~ normal(0,2.5);
//LIKELIHOOD
  Y ~ UL(mi);
}
