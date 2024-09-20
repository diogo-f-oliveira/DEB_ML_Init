def predict_E_G_from_theory(d_V):
    kap_G = 0.8
    mu_V = 500_000
    w_V = 23.9

    return mu_V * d_V / (kap_G * w_V)
