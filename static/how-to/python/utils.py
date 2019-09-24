
import numpy as np
import numpy.ma as ma
from scipy import sparse
from scipy import stats

from sklearn.base import BaseEstimator, TransformerMixin
from sklearn.impute import SimpleImputer, MissingIndicator


class MIAImputer(BaseEstimator, TransformerMixin):
    """ MIA imputation strategy
    
    duplicate each columns by remplacing each np.nan by once +inf and once -inf
    """

    def __init__(self, add_indicator=False, fill_value=10**5):
        self.add_indicator = add_indicator
        self.simple_imputer_max = SimpleImputer(strategy='constant',
                                                fill_value=10**5)
        self.simple_imputer_min = SimpleImputer(strategy='constant',
                                                fill_value=-10**5)

    def fit(self, X, y=None):
        self.simple_imputer_max.fit(X, y)
        self.simple_imputer_min.fit(X, y)
        if self.add_indicator:
            self.indicator_ = MissingIndicator(
                missing_values=np.nan, error_on_new=False)
            self.indicator_.fit(X)
        return self

    def transform(self, X):

        if self.add_indicator:
            X_trans_indicator = self.indicator_.transform(X)

        X_max = self.simple_imputer_max.transform(X)
        X_min = self.simple_imputer_min.transform(X)
        X = np.hstack((X_max, X_min))

        if self.add_indicator:
            X = np.hstack((X, X_trans_indicator))

        return X
