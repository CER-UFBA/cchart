//
// This Stan program defines a simple model, with a
// vector of values 'Y' modeled as Poisson-Shanker distributed.
//

functions{
  real PS_log(vector x, real mu){
    vector[num_elements(x)] prob;
    real lprob;
    real smu; 
    real h;
    smu = (12*mu*sqrt(3*(4*mu^4 + 71*mu^2 + 8))+ 180*mu^2+8)^(1.0/3);
    h = (1.0/(3*mu))*(1+smu/2-2*(3*mu^2 - 1)/smu);
    for (i in 1:num_elements(x)){

      prob[i] = ((h^2 + h + x[i] + 1)*(h + 1)^(-1*x[i]))/((h + 1)^2*(h^2 + 1)*h^(-2));
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
// accepts one parameter 'mu'.
parameters {
  real <lower = 0> mu;
}

// The model to be estimated. 
model {
  //LIKELIHOOD
  Y ~ PS(mu);
}
