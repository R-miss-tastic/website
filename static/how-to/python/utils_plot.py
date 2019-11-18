import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

def _replace_nan_by_min(X_obs):
    # return X_obs where nan are replaced by: min(X) - var(X)
    row_with_missing = [any(np.isnan(x)) for x in X_obs]
    mask_missing = np.isnan(X_obs[row_with_missing])
    X_with_min = X_obs[row_with_missing].copy()
    nan_value = np.min(X_obs[~np.isnan(X_obs)]) - np.var(X_obs[~np.isnan(X_obs)])
    np.putmask(X_with_min, mask_missing, nan_value)
    return X_with_min

def scatter_plot_obs(X_obs):
    # scatter plot with historgams, nan replaced by: min - var
    
    X_miss_min = _replace_nan_by_min(X_obs)
    
    g = sns.JointGrid(X_obs[:,0], X_obs[:,1])
#     g.set_axis_labels('X [:,0]','X [:,1]')
    #plt.xticks([])
#     g.set(xticks=[], yticks=[])
    sns.kdeplot(X_obs[:,0][~np.isnan(X_obs[:,0])], ax=g.ax_marg_x)
    sns.kdeplot(X_obs[:,1][~np.isnan(X_obs[:,1])], ax=g.ax_marg_y,
                vertical=True, label='observed')
    g.ax_joint.plot(X_obs[:,0], X_obs[:,1], "o", alpha = .7)
    sns.kdeplot(X_miss_min[X_miss_min[:,0] > min(X_miss_min[:,0])][:,0],
                ax=g.ax_marg_x)
    sns.kdeplot(X_miss_min[X_miss_min[:,1] > min(X_miss_min[:,1])][:,1],
                ax=g.ax_marg_y, vertical=True, label='missing')
    g.ax_joint.plot(X_miss_min[:,0], X_miss_min[:,1], "*", alpha = .7)  
    plt.legend()
    plt.tight_layout()


def scatter_plot_imputed(X_obs, X_impute):
    # Scatter plot X_obs and X_impute with density histogram

    # g = sns.JointGrid(X_obs[:,0], X_obs[:,1])
    g = sns.JointGrid([0],[0])
#     g.set_axis_labels('X [:,0]','X [:,1]')
    row_with_missing = np.array([any(np.isnan(x)) for x in X_obs])
    X_impute_only = X_impute[row_with_missing]
    X_obs_wo_nan = X_obs[~row_with_missing]
    # g.set(xticks=[], yticks=[])
    sns.kdeplot(X_obs_wo_nan[:,0], ax=g.ax_marg_x)
    sns.kdeplot(X_obs_wo_nan[:,1], ax=g.ax_marg_y,
                vertical=True, label='observed')
    g.ax_joint.plot(X_obs_wo_nan[:,0], X_obs_wo_nan[:,1], "o", alpha = .7)

    sns.kdeplot(X_impute[:,0], ax=g.ax_marg_x)
    sns.kdeplot(X_impute[:,1], ax=g.ax_marg_y,
         vertical=True, label='imputed')
    g.ax_joint.plot(X_impute_only[:,0], X_impute_only[:,1], "*",
                    alpha = .7)  
    plt.legend()
    plt.tight_layout()

def scatter_plot_with_missing_completed(X_obs, X_complete, 
                                        replace_nan_by_min=True):
    # scatter plot with historgams, nan are completed by its true value
    
    row_with_missing = [any(np.isnan(x)) for x in X_obs]
    # use X_complete informations
    values_miss_0 = X_complete[:,0][np.isnan(X_obs[:,0])]
    values_miss_1 = X_complete[:,1][np.isnan(X_obs[:,1])]
    X_missing = X_complete[row_with_missing]
    
    g = sns.JointGrid(X_obs[:,0], X_obs[:,1])
#     g.set_axis_labels('X [:,0]','X [:,1]')
#     g.set_ylabel('X[:,1]')
    sns.kdeplot(X_obs[:,0][~np.isnan(X_obs[:,0])], ax=g.ax_marg_x)
    sns.kdeplot(X_obs[:,1][~np.isnan(X_obs[:,1])], ax=g.ax_marg_y,
                vertical=True, label='observed')
    g.ax_joint.plot(X_obs[:,0], X_obs[:,1], "o", alpha = .7)
    
    sns.kdeplot(X_missing[:,0], ax=g.ax_marg_x)
    sns.kdeplot(X_missing[:,1], ax=g.ax_marg_y,
                    vertical=True, label='missing (completed)')
    g.ax_joint.plot(X_missing[:,0], X_missing[:,1], "*", alpha = .7)
    plt.legend()
    plt.tight_layout()
    

def hist_plot(X_obs, X_complete):
    
    values_miss_0 = X_complete[:,0][np.isnan(X_obs[:,0])]
    values_miss_1 = X_complete[:,1][np.isnan(X_obs[:,1])]

    plt.figure(figsize=(10,5))
    plt.subplot(1,2,1)
    plt.hist(X_obs[:,0][~np.isnan(X_obs[:,0])], bins = 30, density=1,
             alpha = .4, label = 'observed values')
    plt.hist(values_miss_0, bins = 30, density=1,
             alpha = .4, label = 'missing values')
    plt.legend()
    plt.xlabel('X [:,0]')
    plt.title('distribution of the values on column 0')  
    plt.subplot(1,2,2)
    plt.hist(X_obs[:,1][~np.isnan(X_obs[:,1])], bins = 30, density=1,
             alpha = .4, label = 'observed values')
    plt.hist(values_miss_1, bins = 30, density=1,
             alpha = .4, label = 'missing values')
    plt.legend()
    plt.xlabel('X [:,1]')
    plt.title('distribution of the values on column 1')  
    
    
def stats(X_obs):
    nb_nan_col = np.sum(np.isnan(X_obs), axis = 0)
    print('Number of nan per columns = {}'.\
         format(nb_nan_col))
    
    print('Percentage of newly generated mising values: {}'.\
      format(np.sum(np.isnan(X_obs))/X_obs.size))
