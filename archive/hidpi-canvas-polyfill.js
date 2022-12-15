/**
* HiDPI Canvas Polyfill (1.0.10)
*
* Author: Jonathan D. Johnson (http://jondavidjohn.com)
* Homepage: https://github.com/jondavidjohn/hidpi-canvas-polyfill
* Issue Tracker: https://github.com/jondavidjohn/hidpi-canvas-polyfill/issues
* License: Apache-2.0
*/
(function (cvsCtxPrototype, cvsElmtPrototype) {
    var getPixelRatio = function () {
        var canvas = document.createElement('canvas'),
            context = canvas.getContext('2d'),
            backingStore = context.backingStorePixelRatio ||
                context.webkitBackingStorePixelRatio ||
                context.mozBackingStorePixelRatio ||
                context.msBackingStorePixelRatio ||
                context.oBackingStorePixelRatio ||
                context.backingStorePixelRatio || 1;

        return (window.devicePixelRatio || 1) / backingStore;
    },

        forEach = function (obj, func) {
            for (var p in obj) {
                if (obj.hasOwnProperty(p)) {
                    func(obj[p], p);
                }
            }
        },

        ratioArgs = {
            'fillRect': 'all',
            'clearRect': 'all',
            'strokeRect': 'all',
            'moveTo': 'all',
            'lineTo': 'all',
            'arc': [0, 1, 2],
            'arcTo': 'all',
            'bezierCurveTo': 'all',
            'isPointinPath': 'all',
            'isPointinStroke': 'all',
            'quadraticCurveTo': 'all',
            'rect': 'all',
            'translate': 'all',
            'createRadialGradient': 'all',
            'createLinearGradient': 'all'
        };

    if (getPixelRatio() === 1) return;

    cvsCtxPrototype.setHDPIPolyfill = false;
    cvsElmtPrototype.pixelRatio = getPixelRatio();
    var pixelRatio = getPixelRatio();

    forEach(ratioArgs, function (value, key) {
        cvsCtxPrototype[key] = (function (_super) {
            return function () {
                var i, len,
                    args = Array.prototype.slice.call(arguments);
                if (!cvsCtxPrototype.setHDPIPolyfill) {
                    return _super.apply(this, args);
                }

                if (value === 'all') {
                    args = args.map(function (a) {
                        return a * pixelRatio;
                    });
                }
                else if (Array.isArray(value)) {
                    for (i = 0, len = value.length; i < len; i++) {
                        args[value[i]] *= pixelRatio;
                    }
                }

                return _super.apply(this, args);
            };
        })(cvsCtxPrototype[key]);

    });
    cvsCtxPrototype.stroke = (function (_super) {
        return function () {
            if (!cvsCtxPrototype.setHDPIPolyfill) {
                _super.apply(this, arguments);
                return;
            }
            this.lineWidth *= pixelRatio;
            _super.apply(this, arguments);
            this.lineWidth /= pixelRatio;
        };
    })(cvsCtxPrototype.stroke);

    cvsCtxPrototype.fillText = (function (_super) {
        
        return function () {
            var args = Array.prototype.slice.call(arguments);

            if (!cvsCtxPrototype.setHDPIPolyfill) {
                _super.apply(this, args);
                return;
            }

            args[1] *= pixelRatio; // x
            args[2] *= pixelRatio; // y

            this.font = this.font.replace(
                /(\d+)(px|em|rem|pt)/g,
                function (w, m, u) {
                    return (m * pixelRatio) + u;
                }
            );

            _super.apply(this, args);

            this.font = this.font.replace(
                /(\d+)(px|em|rem|pt)/g,
                function (w, m, u) {
                    return (m / pixelRatio) + u;
                }
            );
        };
    })(cvsCtxPrototype.fillText);

    cvsCtxPrototype.strokeText = (function (_super) {
        return function () {
            var args = Array.prototype.slice.call(arguments);

            if (!cvsCtxPrototype.setHDPIPolyfill) {
                _super.apply(this, args);
                return;
            }

            args[1] *= pixelRatio; // x
            args[2] *= pixelRatio; // y

            this.font = this.font.replace(
                /(\d+)(px|em|rem|pt)/g,
                function (w, m, u) {
                    return (m * pixelRatio) + u;
                }
            );

            _super.apply(this, args);

            this.font = this.font.replace(
                /(\d+)(px|em|rem|pt)/g,
                function (w, m, u) {
                    return (m / pixelRatio) + u;
                }
            );
        };
    })(cvsCtxPrototype.strokeText);

    cvsElmtPrototype.getContext = (function (_super) {

        return function (type) {
            var context = _super.call(this, type);

            if (type === '2d' && cvsCtxPrototype.setHDPIPolyfill) {

                if (pixelRatio > 1) {
                    this.style.height = this.height + 'px';
                    this.style.width = this.width + 'px';
                    this.width *= pixelRatio;
                    this.height *= pixelRatio;
                }
            }

            return context;
        };
    })(cvsElmtPrototype.getContext);

})(CanvasRenderingContext2D.prototype, HTMLCanvasElement.prototype);
