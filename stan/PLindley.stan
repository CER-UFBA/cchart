//
// This Stan program defines a simple model, with a
// vector of values 'Y' modeled as Poisson-Lindley distributed.
//

functions{
  real PL_log(vector x, real mu){
    vector[num_elements(x)] prob;
    real lprob;
    real t;
    
    t = (-1/(2*mu))*((mu-1)-sqrt(((mu-1)^2)+8*mu));
    
    for (i in 1:num_elements(x)){
      prob[i] = ((t + x[i] + 2)*(t + 1)^-(x[i]))/(
        (t + 1)^3*t^(-2));
    }
    lprob = sum(log(prob));
    return lprob;
  }
}

// The input data is a vector 'y' of length 'N'.
data {
  int <lower=0> N;
  vector[N] Y;
}

// The parameters accepted by the model. Our model
// accepts one parameter 'mu'.
parameters {
  real <lower = 0> mu;
}

// The model to be estimated.
model {
  //LIKELIHOOD
  Y ~ PL(mu);
}
