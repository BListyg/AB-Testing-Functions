"""
function probability_B_beats_A(α_A, β_A, α_B, β_B)
    total = 0.0
for i = 0:(α_B-1)
total += exp(lbeta(α_A+i, β_B+β_A) 
- log(β_B+i) - lbeta(1+i, β_B) - lbeta(α_A, β_A))
end
return total
end
"""

probability_B_beats_A <- function(alpha_a, beta_a, alpha_b, beta_b){
 
  `%+=%` = function(e1,e2) eval.parent(substitute(e1 <- e1 + e2))
  
  total <- 0
  
  for(i in 0:(alpha_b - 1))
  {
    total %+=% exp(lbeta(alpha_a + i, beta_b + beta_a) - log(beta_b + i) - lbeta(1+i, beta_b) - lbeta(alpha_a, beta_a))
  }
  
return(total)

}

############################

"""
function probability_C_beats_A_and_B(α_A, β_A, α_B, β_B, α_C, β_C)
    total = 0.0
    for i = 0:(α_A-1)
        for j = 0:(α_B-1)
          total += exp(lbeta(α_C+i+j, β_A+β_B+β_C) - log(β_A+i) - log(β_B+j)
              - lbeta(1+i, β_A) - lbeta(1+j, β_B) - lbeta(α_C, β_C))
        end
    end
    return 1 - probability_B_beats_A(α_C, β_C, α_A, β_A) 
             - probability_B_beats_A(α_C, β_C, α_B, β_B) + total
end
"""

probability_C_beats_A_and_B <- function(alpha_a, beta_a, alpha_b, beta_b, alpha_c, beta_c){
  
  `%+=%` = function(e1,e2) eval.parent(substitute(e1 <- e1 + e2))
  
  probability_B_beats_A <- function(alpha_a, beta_a, alpha_b, beta_b){
    
    total <- 0
    
    for(i in 0:(alpha_b - 1))
    {
      total %+=% exp(lbeta(alpha_a + i, beta_b + beta_a) - log(beta_b + i) - lbeta(1+i, beta_b) - lbeta(alpha_a, beta_a))
    }
    
    return(total)
    
  }
  
  total = 0
  for(i in 0:alpha_a-1){
    for(j in 0:alpha_b-1){
      total %+=% exp(lbeta(alpha_c+i+j, beta_a+beta_b+beta_c) - log(beta_a+i) - log(beta_b+j)
                     - lbeta(1+i, beta_a) - lbeta(1+j, beta_b) - lbeta(alpha_c, beta_c)) 
    }
}

return(1 - probability_B_beats_A(alpha_C, beta_C, alpha_A, beta_A)  - probability_B_beats_A(alpha_C, beta_C, alpha_B, beta_B) + total)
  
}

############################

"""
function probability_1_beats_2(α_1, β_1, α_2, β_2)
    total = 0.0
for k = 0:(α_1-1)
total += exp(k * log(β_1) + α_2 * log(β_2) - (k+α_2) * log(β_1 + β_2)
- log(k + α_2) - lbeta(k + 1, α_2))
end
return total
end
"""

probability_1_beats_2 <- function(alpha_1, beta_1, alpha_2, beta_2){
  
  `%+=%` = function(e1,e2) eval.parent(substitute(e1 <- e1 + e2))
  
  total = 0
  for(k in 0:alpha_1-1){
    total %+=% exp(k * log(beta_1) + alpha_2 * log(beta_2) - (k+alpha_2) * log(beta_1 + beta_2)
                   - log(k + alpha_2) - lbeta(k + 1, alpha_2))
  }
  return(total)
}

##############################

"""
function probability_1_beats_2_and_3(α_1, β_1, α_2, β_2, α_3, β_3)
    total = 0.0
for k = 0:(α_2-1)
for l = 0:(α_3-1)
total += exp(α_1 * log(β_1) + k * log(β_2) + l * log(β_3) 
- (k+l+α_1) * log(β_1 + β_2 + β_3)
+ lgamma(k+l+α_1) - lgamma(k+1) - lgamma(l+1) - lgamma(α_1))
end
end
return 1 - probability_1_beats_2(α_2, β_2, α_1, β_1)
- probability_1_beats_2(α_3, β_3, α_1, β_1) + total
end
"""

probability_1_beats_2_and_3 <- function(alpha_1, beta_1, alpha_2, beta_2, alpha_3, beta_3){
  
  `%+=%` = function(e1,e2) eval.parent(substitute(e1 <- e1 + e2))
  
  total = 0
  
  for(k in 0:alpha_2-1){
    for(l in 0:alpha_3-1){
      total %+=% exp(alpha_1 * log(beta_1) + k * log(beta_2) + l * log(beta_3) - (k+l+alpha_1) * log(beta_1 + beta_2 + beta_3) + lgamma(k+l+alpha_1) - lgamma(k+1) - lgamma(l+1) - lgamma(alpha_1))
    }
  }
  
  return(total)

}


