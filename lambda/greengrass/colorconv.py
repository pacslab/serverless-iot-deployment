"""Functions for converting between color spaces.

The "central" color space in this module is RGB, more specifically the linear
sRGB color space using D65 as a white-point [1]_.  This represents a
standard monitor (w/o gamma correction). For a good FAQ on color spaces see
[2]_.

The API consists of functions to convert to and from RGB as defined above, as
well as a generic function to convert to and from any supported color space
(which is done through RGB in most cases).


Supported color spaces
----------------------
* RGB : Red Green Blue.
        Here the sRGB standard [1]_.
* HSV : Hue, Saturation, Value.
        Uniquely defined when related to sRGB [3]_.
* RGB CIE : Red Green Blue.
        The original RGB CIE standard from 1931 [4]_. Primary colors are 700 nm
        (red), 546.1 nm (blue) and 435.8 nm (green).
* XYZ CIE : XYZ
        Derived from the RGB CIE color space. Chosen such that
        ``x == y == z == 1/3`` at the whitepoint, and all color matching
        functions are greater than zero everywhere.
* LAB CIE : Lightness, a, b
        Colorspace derived from XYZ CIE that is intended to be more
        perceptually uniform
* LUV CIE : Lightness, u, v
        Colorspace derived from XYZ CIE that is intended to be more
        perceptually uniform
* LCH CIE : Lightness, Chroma, Hue
        Defined in terms of LAB CIE.  C and H are the polar representation of
        a and b.  The polar angle C is defined to be on ``(0, 2*pi)``

:author: Nicolas Pinto (rgb2hsv)
:author: Ralf Gommers (hsv2rgb)
:author: Travis Oliphant (XYZ and RGB CIE functions)
:author: Matt Terry (lab2lch)
:author: Alex Izvorski (yuv2rgb, rgb2yuv and related)

:license: modified BSD

References
----------
.. [1] Official specification of sRGB, IEC 61966-2-1:1999.
.. [2] http://www.poynton.com/ColorFAQ.html
.. [3] https://en.wikipedia.org/wiki/HSL_and_HSV
.. [4] https://en.wikipedia.org/wiki/CIE_1931_color_space
"""


import functools
import numpy as np
from warnings import warn
import dtype


def _prepare_colorarray(arr, force_copy=False):
    """Check the shape of the array and convert it to
    floating point representation.
    """
    arr = np.asanyarray(arr)

    if arr.shape[-1] != 3:
        raise ValueError("Input array must have a shape == (..., 3)), "
                         f"got {arr.shape}")

    return dtype.img_as_float(arr, force_copy=force_copy)



def rgb2gray(rgb):
    """Compute luminance of an RGB image.

    Parameters
    ----------
    rgb : (..., 3) array_like
        The image in RGB format. Final dimension denotes channels.

    Returns
    -------
    out : ndarray
        The luminance image - an array which is the same size as the input
        array, but with the channel dimension removed.

    Raises
    ------
    ValueError
        If `rgb` is not at least 2-D with shape (..., 3).

    Notes
    -----
    The weights used in this conversion are calibrated for contemporary
    CRT phosphors::

        Y = 0.2125 R + 0.7154 G + 0.0721 B

    If there is an alpha channel present, it is ignored.

    References
    ----------
    .. [1] http://poynton.ca/PDFs/ColorFAQ.pdf

    Examples
    --------
    >>> from skimage.color import rgb2gray
    >>> from skimage import data
    >>> img = data.astronaut()
    >>> img_gray = rgb2gray(img)
    """

    if rgb.ndim == 2:
        warn('The behavior of rgb2gray will change in scikit-image 0.19. '
             'Currently, rgb2gray allows 2D grayscale image to be passed '
             'as inputs and leaves them unmodified as outputs. '
             'Starting from version 0.19, 2D arrays will '
             'be treated as 1D images with 3 channels.',
             FutureWarning, stacklevel=2)
        return np.ascontiguousarray(rgb)

    if rgb.shape[-1] > 3:
        warn('Non RGB image conversion is now deprecated. For RGBA images, '
             'please use rgb2gray(rgba2rgb(rgb)) instead. In version 0.19, '
             'a ValueError will be raised if input image last dimension '
             'length is not 3.', FutureWarning, stacklevel=2)
        rgb = rgb[..., :3]

    rgb = _prepare_colorarray(rgb)
    coeffs = np.array([0.2125, 0.7154, 0.0721], dtype=rgb.dtype)
    return rgb @ coeffs


@functools.wraps(rgb2gray)
def rgb2grey(rgb):
    warn('rgb2grey is deprecated. It will be removed in version 0.19.'
         'Please use rgb2gray instead.', FutureWarning, stacklevel=2)
    return rgb2gray(rgb)


