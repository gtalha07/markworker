import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:markworker/shared/utils.dart';
import 'package:path_drawing/path_drawing.dart';

class ImageClipper extends CustomClipper<Path> {
  Path _getTimerPath() {
    Path path = parseSvgPathData(
        'M101.092 0H152.81V29.2542H143.646V47.2005C154.579 48.6509 165.3 51.5229 175.533 55.7616C185.037 59.6983 194.005 64.7663 202.25 70.8402L218.272 52.4293L245.747 78.7031L226.815 94.6663C233.938 103.742 239.805 113.764 244.238 124.467C250.618 139.869 253.902 156.378 253.902 173.049C253.902 198.157 246.457 222.702 232.507 243.579C218.557 264.456 198.73 280.728 175.533 290.336C152.336 299.945 126.81 302.459 102.184 297.561C77.558 292.662 54.9376 280.571 37.1832 262.817C19.4288 245.062 7.33785 222.442 2.43941 197.816C-2.45902 173.19 0.0549204 147.664 9.66354 124.467C14.1116 113.728 19.9876 103.712 27.0874 94.6665L8.15491 78.7031L35.6297 52.4293L51.6519 70.8403C53.2132 69.69 54.8032 68.5739 56.4208 67.4931C72.6375 56.6574 91.0673 49.7461 110.255 47.2005V29.2542H101.092V0ZM71.9567 255.349C88.232 266.236 107.37 272.054 126.951 272.065C139.959 272.073 152.841 269.518 164.861 264.545C176.881 259.573 187.804 252.28 197.004 243.085C206.205 233.89 213.504 222.972 218.484 210.955C223.464 198.937 226.027 186.057 226.027 173.049C226.027 153.468 220.221 134.326 209.344 118.045C198.466 101.763 183.005 89.0715 164.916 81.5754C146.826 74.0794 126.921 72.115 107.715 75.9308C88.5093 79.7465 70.8662 89.1711 57.0161 103.013C43.166 116.855 33.731 134.492 29.9037 153.695C26.0764 172.899 28.0288 192.806 35.514 210.9C42.9993 228.994 55.6813 244.462 71.9567 255.349ZM189.953 106.713C206.955 122.859 217.108 144.918 218.317 168.334C169.921 170.261 126.951 173.049 126.951 173.049V81.5648C150.399 81.564 172.951 90.5662 189.953 106.713Z');
    path.fillType = PathFillType.evenOdd;
    return path;
  }

  Path _getCupPath() {
    Path path = parseSvgPathData(
        'M155 0H65.0313C63.7158 0.000839361 62.4168 0.39635 61.2283 1.15795C60.0398 1.91955 58.9916 3.02822 58.1593 4.40374C57.3271 5.77926 56.7317 7.38724 56.4161 9.11149C56.1006 10.8357 56.0728 12.6331 56.3347 14.3737C56.4225 14.9492 56.5117 15.5242 56.6023 16.0987L20.04 7.12607C17.0765 6.39606 14.0225 6.7429 11.191 8.13105C8.35955 9.51921 5.85239 11.8988 3.92638 15.0259C2.00037 18.153 0.724787 21.9152 0.230383 25.927C-0.26402 29.9389 0.0405659 34.056 1.11283 37.8566C6.07861 55.3191 15.5812 79.6263 32.6234 96.2464C52.9589 116.082 80.9525 119.986 97.2491 120.407C110.017 134.363 125.138 142.954 140.805 146.181V196.019H120.955C114.2 196.019 107.721 199.641 102.943 206.088C98.1653 212.535 95.4794 221.28 95.4759 230.4V261.288H214.525V230.4C214.525 225.884 213.865 221.411 212.585 217.239C211.304 213.066 209.427 209.276 207.061 206.083C204.695 202.89 201.886 200.358 198.795 198.631C195.704 196.904 192.391 196.017 189.046 196.019H169.209V146.195C184.901 142.979 200.051 134.381 212.84 120.403C229.111 119.963 257.077 115.981 277.39 96.2457C294.432 79.6256 303.921 55.3185 308.887 37.8559C309.959 34.0553 310.264 29.9382 309.77 25.9264C309.275 21.9146 308 18.1524 306.074 15.0253C304.148 11.8982 301.64 9.51854 298.809 8.13039C295.977 6.74223 292.923 6.3954 289.96 7.1254L253.494 16.0745C253.583 15.508 253.671 14.9411 253.757 14.3737C254.021 12.6342 253.995 10.8372 253.681 9.11288C253.368 7.38854 252.774 5.78006 251.942 4.40406C251.111 3.02807 250.063 1.91903 248.875 1.15731C247.687 0.395579 246.389 0.000255269 245.073 0H155ZM270.058 82.539C257.225 95.0543 240.192 100.23 226.22 102.266C230.219 95.5523 233.796 88.0932 236.858 79.8889C242.352 65.1959 246.806 49.852 250.168 34.0621L292.196 23.7456C292.983 23.5378 293.798 23.6241 294.551 23.9953C295.305 24.3664 295.969 25.0081 296.473 25.8515C296.985 26.6584 297.325 27.6389 297.456 28.6873C297.586 29.7356 297.503 30.8122 297.214 31.8011C292.846 47.1225 284.604 68.3583 270.058 82.539ZM83.8854 102.295C79.8804 95.5733 76.2986 88.1047 73.234 79.8889C67.7468 65.2011 63.2955 49.8653 59.9325 34.0849L17.804 23.7462C17.0168 23.5462 16.2041 23.6361 15.4515 24.0067C14.699 24.3773 14.0343 25.0148 13.5273 25.8522C13.0193 26.6627 12.6834 27.6438 12.5552 28.6913C12.4271 29.7389 12.5114 30.8137 12.7993 31.8017C17.1541 47.1231 25.3957 68.359 39.9421 82.5396C52.8118 95.085 69.8965 100.264 83.8854 102.295Z');
    path.fillType = PathFillType.evenOdd;
    return path;
  }

  Path _getFlagPath() {
    Path path = parseSvgPathData(
        'M30.9295 103.47V179.1H135.097V185.617H30.9295V348.475C33.5723 350.998 35.3987 354.256 36.1734 357.827C36.9481 361.398 36.6356 365.119 35.2761 368.511C33.9167 371.903 31.5726 374.81 28.546 376.858C25.5193 378.906 21.9489 380 18.2947 380C14.6404 380 11.0699 378.906 8.04327 376.858C5.01662 374.81 2.67254 371.903 1.31311 368.511C-0.0463302 365.119 -0.358855 361.398 0.415862 357.827C1.19058 354.256 3.01705 350.998 5.65982 348.475V12.6349C5.65982 9.28393 6.99097 6.07014 9.36046 3.70064C11.73 1.33115 14.9437 0 18.2947 0C21.6456 0 24.8593 1.33115 27.2288 3.70064C29.5983 6.07014 30.9295 9.28393 30.9295 12.6349V21.3039H135.097H251.88H251.9V103.45H245.383V27.8206H135.097L135.097 103.45H251.88V185.617L135.097 185.617V103.47H30.9295Z');
    path.fillType = PathFillType.evenOdd;
    return path;
  }

  Path _getWhistlePath() {
    Path path = parseSvgPathData(
        'M-6.30084e-06 255.854C0.00712993 275.532 5.32695 294.844 15.398 311.751C25.469 328.657 39.9176 342.532 57.2186 351.909C63.4862 355.306 70.0438 358.067 76.7937 360.169L76.7937 374.034C76.7038 377.411 77.2914 380.772 78.5216 383.918C79.7519 387.064 81.5999 389.932 83.9567 392.352C86.3135 394.773 89.1313 396.696 92.2437 398.01C95.3561 399.323 98.7001 400 102.078 400C105.457 400 108.801 399.323 111.913 398.01C115.025 396.696 117.843 394.773 120.2 392.352C122.557 389.932 124.405 387.064 125.635 383.918C126.865 380.772 127.453 377.411 127.363 374.034L127.363 363.613C142.138 361.137 156.297 355.641 168.934 347.415C185.426 336.678 198.714 321.689 207.394 304.028C216.075 286.367 219.826 266.69 218.252 247.074C216.679 227.458 209.839 208.631 198.454 192.58C187.069 176.529 171.562 163.849 153.57 155.879C139.747 149.83 127.734 140.292 118.708 128.201C109.683 116.109 103.955 101.88 102.087 86.9073L91.5438 -6.50367e-05L-1.74846e-05 -6.10352e-05L-6.30084e-06 255.854ZM86.5495 362.721C95.4267 364.61 104.544 365.395 113.694 365.027C115.001 364.974 116.306 364.898 117.607 364.799L117.607 374.034C117.678 376.117 117.329 378.194 116.58 380.14C115.831 382.086 114.699 383.861 113.25 385.36C111.801 386.859 110.065 388.051 108.146 388.865C106.227 389.679 104.163 390.099 102.078 390.099C99.9935 390.099 97.93 389.679 96.0107 388.865C94.0914 388.051 92.3556 386.859 90.9066 385.36C89.4576 383.861 88.3252 382.086 87.5766 380.14C86.8281 378.194 86.4788 376.117 86.5495 374.034L86.5495 362.721ZM183.875 253.67C183.875 212.494 150.495 179.114 109.319 179.114C68.1429 179.114 34.763 212.494 34.763 253.67C34.763 294.846 68.1429 328.226 109.319 328.226C150.495 328.226 183.875 294.846 183.875 253.67Z');
    path.fillType = PathFillType.evenOdd;
    return path;
  }

  Path _getBallPath() {
    Path path = parseSvgPathData(
        'M155 310C124.344 310 94.3762 300.909 68.8866 283.878C43.397 266.846 23.5303 242.638 11.7987 214.316C0.0671572 185.993 -3.00236 154.828 2.97835 124.761C8.95905 94.694 23.7213 67.0756 45.3984 45.3985C67.0756 23.7214 94.6939 8.95905 124.761 2.97835C154.828 -3.00236 185.993 0.0671572 214.316 11.7987C242.638 23.5303 266.846 43.397 283.878 68.8867C300.909 94.3763 310 124.344 310 155C309.958 196.096 293.615 235.496 264.555 264.556C235.496 293.615 196.096 309.958 155 310ZM72.4562 31.4887C83.468 24.1306 95.3518 18.3187 107.775 14.1539L103.412 27.5635L155 65.0553L206.588 27.5635L202.257 14.203C223.812 21.4512 243.625 33.6158 260.008 49.9973C262.858 52.8468 265.581 55.8 268.172 58.8481L254.264 59.7863L238.536 121.598L292.483 155.57L303.321 146.538C303.484 149.348 303.568 152.17 303.571 155C303.574 178.049 298.216 200.693 288.028 221.178L281.572 208.574L218.66 218.62L208.83 281.532L221.41 287.922C218.289 289.482 215.107 290.934 211.869 292.276C184.722 303.524 154.849 306.469 126.027 300.738C112.963 298.141 100.381 293.814 88.5924 287.923L101.191 281.532L91.3609 218.62L28.4487 208.574L21.9898 221.214C16.1568 209.493 11.8674 196.99 9.28507 184.012C6.8182 171.613 5.9569 159.02 6.67153 146.532L17.5172 155.57L71.4841 121.598L55.756 59.7863L41.7602 58.8421C50.6275 48.4017 60.9435 39.1815 72.4562 31.4887ZM99.1657 136.873L120.497 202.518H189.523L210.855 136.873L155 96.2951L99.1657 136.873Z');
    path.fillType = PathFillType.evenOdd;
    return path;
  }

  @override
  Path getClip(Size size) {
    Path path;
    if (imageCounter == 0) {
      path = _getTimerPath();
    } else if (imageCounter == 1) {
      path = _getCupPath();
    } else if (imageCounter == 2) {
      path = _getBallPath();
    } else if (imageCounter == 3) {
      path = _getWhistlePath();
    } else {
      path = _getFlagPath();
    }
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
