import numpy as np
from sklearn.datasets import make_friedman1


def generate_without_missing_values(data='simple', n_samples=200,
                                    n_features=2, random_state=0):
    """generate canonical regression data"""

    assert data in ['simple', 'linear', 'quadratic', 'friedman']

    np.random.seed(random_state)
    mean = np.ones(n_features)
    ro = .5
    cov = ro * np.ones((n_features, n_features)) +\
          (1 - ro) * np.eye(n_features)
    X = np.random.multivariate_normal(mean, cov, size=n_samples)
    epsilon = 0.1 * np.random.randn(n_samples)

    if data == 'simple':
        y = X[:, 0] + epsilon
    if data == 'linear':
        beta = [1, 2] + list(np.random.randn(n_features-2))
        y = X.dot(beta) + epsilon
    if data == 'quadratic':
        y = X[:, 0] * X[:, 0] + epsilon
    if data == 'friedman':  # X is no more gaussian here
        X, y = make_friedman1(n_samples=n_samples,
                              n_features=max(5, n_features),
                              noise=0.1, random_state=random_state)
    return X, y


def generate_with_missing_values(data='simple', n_samples=200,
                                 n_features=2, random_state=0,
                                 missing_mechanism='mcar',
                                 missing_rate=0.1):
    """Generate regression data with missing values"""

    X, y = generate_without_missing_values(data, n_samples,
                                           n_features, random_state)

    if missing_mechanism == 'mcar':
        missing_mask = np.random.binomial(1, missing_rate,
                                          (n_samples, n_features))
    elif missing_mechanism == 'censored':
        # p = .7  # percentile
        # B = np.random.binomial(1, missing_rate,
        #                        (n_samples, n_features))
        missing_mask = (X > np.percentile(X, 100*(1-missing_rate)))  # * B
    elif missing_mechanism == 'predictive':
        missing_mask = np.random.binomial(1, missing_rate,
                                          (n_samples, n_features))
        y += 2 * missing_mask[:, 0]

    X_complete = X.copy()
    np.putmask(X, missing_mask, np.nan)

    return X, y, X_complete, missing_mask
