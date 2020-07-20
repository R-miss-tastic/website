def color_imputedvalues_orange(val, x_miss):
    color = 'orange' if val not in x_miss else 'None'
    return 'background-color: %s' % color


