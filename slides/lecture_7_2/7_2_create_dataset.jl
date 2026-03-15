## This script creates the data used for empirical analysis in the tutorial of Unit 7.2

using Random, Distributions # For drawing random variables
using DataFrames, CSV # For data organization and export
using NLsolve # To calculate equilibrium strategies in each market
using Plots, LaTeXStrings # To generate summary plots

Random.seed!(592) # Ensure reproducibility

Mkts = 300 # Number of markets

## True parameters
# Demand
α = 1.0 # Price parameter (in absolute value)
β0 = 6.0 # Intercept
βq = 10.0 # Quality parameters (unobserved)
σ_e = 8.0 # Dispersion of individual taste shocks

# Cost
γ0 = 5.0 # Intercept
γq = 1.0 # Quality parameter (unobserved)
γs = 1.5 # Steel cost parameter
γl = 0.7 # Labor cost parameter
σ_c = 1.5 # Dispersion of cost shocks


## Dataset generation

# Create a "blank" dataset to store info
df = DataFrame(
    MarketID = 1:Mkts
)

# Create an unobserved covariate that captures perceived quality 
# - This covariate will be correlated with prices, so it will create endogeneity
Avg_qual_a = 0.5 # Average quality index of a
Avg_qual_b = 1.0 # Average quality index of b is higher than a

# Assume perceived quality follows a normal distribution with SD 0.1
df[:,:qual_a] = rand(Normal(Avg_qual_a, 0.1), Mkts)
df[:,:qual_b] = rand(Normal(Avg_qual_b, 0.1), Mkts)


# We will also assume that production costs are normally distributed across markets
# Note that we limit the precision of numbers to 2 decimal digits
df[:,:steel] = round.(rand(Normal(8.0, 1.0), Mkts), digits=2)
df[:,:labor] = round.(rand(Normal(22.0, 1.0), Mkts), digits=2)

# Calculate production costs for good a
df[:,:c_a] = γ0 .+ γq*df[:,:qual_a] + γs*df[:,:steel] + γl*df[:,:labor] + rand(Normal(0.0, σ_c), Mkts)
df[:,:c_a] = round.(df[:,:c_a], digits=2)

# Calculate production costs for good b
df[:,:c_b] = γ0 .+ γq*df[:,:qual_b] + γs*df[:,:steel] + γl*df[:,:labor] + rand(Normal(0.0, σ_c), Mkts)
df[:,:c_b] = round.(df[:,:c_b], digits=2)

# Plot the distribution of true production costs and save it
pl_c = plot(histogram(df[:,:c_a], label=L"True $c_a$", bins=30), histogram(df[:,:c_b], label=L"True $c_b$", bins=30))
png(pl_c, "./slides/lecture_7_2/figs/true_costs.png")


## Solving for equilibrium prices

# Function to calculate product shares in each market
function share(p, qual)
    V_a = β0 -α * p[1] + βq * qual[1]
    V_b = β0 -α * p[2] + βq * qual[2]
    denominator = 1 + exp(V_a/σ_e) + exp(V_b/σ_e)
    shares = [exp(V_a)/denominator, exp(V_b)/denominator]
    return shares
end

# Function to return the LHS of FOCs
function foc(p, qual, c)
    foc = share(p, qual) .* (1 .- α/σ_e .* (p - c) .* share(p, qual))
    return foc
end

# Initialize prices
df[:,:p_a] = zeros(Mkts)
df[:,:p_b] = zeros(Mkts)

# In each market, solve for equilibrium prices
for i in 1:Mkts
    # Map quality and costs in this market
    this_qual = [df[i, :qual_a], df[i, :qual_b]]
    this_c = [df[i, :c_a], df[i, :c_b]]

    # Solve the Nash-Bertrand equilibrium
    res = nlsolve(p -> foc(p, this_qual, this_c), this_c)

    # Store the solution vector
    p_sol = res.zero
    df[i, :p_a] = p_sol[1]
    df[i, :p_b] = p_sol[2]
end

# Plot the distribution of prices and save it
pl_p = plot(histogram(df[:,:p_a], label=L"Eq. $p_a$", bins=30), histogram(df[:,:p_b], label=L"Eq. $p_b$", bins=30))
png(pl_p, "./slides/lecture_7_2/figs/eq_prices.png")


# Calculate market shares with random aggregate taste shocks
function share_with_error(p, qual, ϵ)
    num_a = exp((β0 -α * p[1] + βq * qual[1] + ϵ[1])/σ_e)
    num_b = exp((β0 -α * p[2] + βq * qual[2] + ϵ[2])/σ_e)
    denominator = 1 + num_a + num_b
    shares = [num_a/denominator, num_b/denominator]
    return shares
end

# Initialize values
df[:,:s_a] = zeros(Mkts)
df[:,:s_b] = zeros(Mkts)

# Draw random shocks
# These are the mean of individual taste shocks. We will assume shares
# are calculated over N = 100 in each market, so σ = σ_e/sqrt(100). We
# also use CLT to approximate the resulting distribution as a normal
df[:,:s_eps_a] = rand(Normal(0, σ_e/sqrt(100)), Mkts) 
df[:,:s_eps_b] = rand(Normal(0, σ_e/sqrt(100)), Mkts)

# For each market, calculate the actual shares with random taste shocks
for i in 1:Mkts
    s = share_with_error([df[i, :p_a], df[i, :p_b]],
                         [df[i, :qual_a], df[i, :qual_b]],
                         [df[i, :s_eps_a], df[i, :s_eps_b]])
    df[i,:s_a] = s[1]
    df[i,:s_b] = s[2]
end

# Calculate outside option shares
df[:,:s_0] = 1 .- df[:,:s_a] .- df[:,:s_b]

# Plot dispersion of shares
pl_s = scatter(df[:,:s_a], df[:,:s_b], xlabel=L"$s_a$", ylabel=L"$s_b$", label="")
png(pl_s, "./slides/lecture_7_2/figs/eq_shares.png")

## Export data set with only observed characteristics
# Arrange columns
df_obsr_a = df[:,[:MarketID, :s_a, :p_a, :s_0, :steel, :labor]]
# Rename columns 
rename!(df_obsr_a, :s_a => :s_k)
rename!(df_obsr_a, :p_a => :p_k)
# Label product
df_obsr_a.product .= "a" 

# Do the same for product b
df_obsr_b = df[:,[:MarketID, :s_b, :p_b, :s_0, :steel, :labor]]
rename!(df_obsr_b, :s_b => :s_k)
rename!(df_obsr_b, :p_b => :p_k)
df_obsr_b.product .= "b" 

# Stack observations
df_obsr = append!(df_obsr_a, df_obsr_b)

# Sort by market ID
sort!(df_obsr, :MarketID)

# Export
CSV.write("duopoly_shares_data.csv", df_obsr)
