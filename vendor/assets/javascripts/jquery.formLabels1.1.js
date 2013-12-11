/*global jQuery, window*/
/*
 * @File:        jquery.formLabels.js
 * @Version:     1.1
 * @Author:      Andrei Zharau (www.o2v.net) - Senior Software Engineer at Nokia
 *
 * @Requires:    jQuery v1.9 & jQueryUI v1.9.1
 * @Usage:       $.fn.formLabels()
 * @Options:     excludeElts - Excludes certain elements from being 'labelized'. Default: ''. Example:  $.fn.formLabels(excludeElts:'#email, .nolabel')
 *               refreshOnResize - whether or not refresh labels on window resize. Default: true
 *               safemode - if enabled the plugin runs in the safemode without using spans and animation. Default: false
 *               labelParent - parentContainer for your 'labels'. Default: 'form'
 *               semantic - puts label before input element. Default: true
 *
 * Link to the demo: <http://o2v.net/demo/formLabels/index.html>
 *
 * Released under the MIT license
 */
(function ($) {
    "use strict";
    var formLabels = $.fn.formLabels = function (opts) {
        opts = $.extend({
            animationDuration: 300,
            excludeElts: '',        //elements to be excluded
            refreshOnResize: false, //whether or not refresh labels on 'resize' event for window
            safemode: false,        //enable safe mode without DOM modifications
            labelParent: 'form',    //specifies a block that will store the form labels (body or form)
            semantic: true          //if true, then plugin renders label before input box (works only if labelParent:'form')
        }, opts);
        var inputs = ["textarea", "input[type='email']", "input[type='text']", "input[type='password']"],
            getPropertyValue = function (prop) {
                return parseInt(this.css(prop), 10);
            },
            enabled = true,
            spanID = 0,
            context = this.length ? this : "body",
            elts = $(inputs.join(", "), context).not(opts.excludeElts).filter(":visible[title]"),
            refreshLabels = function () {
                elts.each(function () {
                    var $this = $(this),
                        assocSpan = $($this.data("spanID"));

                    assocSpan.position({
                        my: "left top",
                        at: "left top",
                        of: $this,
                        using: function (pos) {
                            var paddings = JSON.parse($this.data("paddings"));

                            $(this).css({
                                top: pos.top + paddings.top,
                                left: pos.left + paddings.left
                            });
                        },
                        collision: 'none'
                    });
                });
            };

        if (elts.length === 0) {
            return null;
        }

        if (opts.safemode === false) {
            elts.each(function () {
                var paddings, formLabel, label, labelParent, tagName,
                    $this = $(this);

                if (this.value === '' && (label = this.title) !== "") {
                    if (opts.labelParent === "form") {
                        labelParent = $this.closest("form");
                        tagName = "<label/>";
                    } else {
                        labelParent = $(opts.labelParent);
                        tagName = "<span/>";
                    }

                    if (labelParent.css("position") === "static" && !labelParent.data("processed")) {
                        labelParent.css({
                            position: "relative"
                        }).data("processed", true);
                    }

                    paddings = {
                        top: getPropertyValue.call($this, "padding-top") + 1,
                        left: Math.max(2, getPropertyValue.call($this, "padding-left") + 1)
                    };

                    formLabel = $(tagName, {
                        css: {
                            'font-family'       : $this.css("font-family"),
                            'font-size'         : $this.css("font-size"),
                            'font-style'        : $this.css("font-style"),
                            'font-weight'       : $this.css("font-weight"),
                            'text-shadow'       : ($.support.opacity) ? $this.css("text-shadow") : "",
                            'line-height'       : $this.css("line-height"),
                            'background-color'  : $this.css("background-color"),
                            'color'             : $this.css("color"),
                            'position'          : 'absolute',
                            'top'               : 0,
                            'left'              : 0,
                            '-moz-user-select'  : "none",
                            '-webkit-user-select'  : "none",
                            'user-select'       : "none",
                            'cursor'            : "text",
                            'z-index'           : "999"
                        },
                        id: "spanLabel" + spanID,
                        "for": ($this.attr("id") === "") ? "" : $this.attr("id"),
                        "class" : "fLabel",
                        html : label,
                        click : function () {
                            $this.trigger('focus');
                            return false;
                        }
                    });

                    if (opts.semantic && opts.labelParent === 'form') {
                        $this.before(formLabel);
                    } else {
                        formLabel.appendTo(labelParent);
                    }

                    formLabel.position({
                        my: "left top",
                        at: "left top",
                        of: $this,
                        using: function (pos) {
                            $(this).css({
                                top: pos.top + paddings.top,
                                left: pos.left + paddings.left
                            });
                        },
                        collision: 'none'
                    });

                    $this.data({
                        "spanID"    : "#spanLabel" + spanID,
                        "paddings"  : JSON.stringify(paddings)
                    });
                }
                spanID = spanID + 1; //Increasing spanID by one
            })
                .on('focus.formLabels blur.formLabels change.formLabels cut.formLabels paste.formLabels input.formLabels keyup.formLabels', function (e) {
                    if (enabled === false) {
                        return;
                    }

                    var LabelSpanID = $($.data(this, "spanID"));

                    if (e.type === 'focus') {
                        if (this.title !== "" && this.value === "") {
                            LabelSpanID.stop().fadeTo(opts.animationDuration, 0.2);
                        }
                    } else if (e.type === "blur") {
                        if (this.title !== "") {
                            if (this.value === "") {
                                LabelSpanID.stop().fadeTo(opts.animationDuration, 1, function () {
                                    if (!$.support.opacity) {
                                        this.style.removeAttribute("filter");
                                    }
                                });
                            } else {
                                LabelSpanID.stop().fadeOut(opts.animationDuration);
                            }
                        }
                    } else if (e.type === "change" || e.type === "cut" || e.type === "paste" || e.type === "input" || e.type === "keyup") {
                        this.title !== "" && LabelSpanID.stop().fadeOut(opts.animationDuration);
                        this.value === "" && LabelSpanID.stop().fadeTo(100, 0.2);
                    }

                });

            if (opts.refreshOnResize) {
                $(window).on("resize.formLabels", function () {
                    refreshLabels();
                });
            }
        } else {
            elts.val(function (i, v) {
                return v === "" ? this.title : v;
            });
            elts.on('focus.formLabels blur.formLabels', function (e) {
                if (enabled === false) {
                    return;
                }
                if (e.type === 'focus') {
                    (this.value === this.title) && (this.value = "");
                } else {
                    (this.value === "") && (this.value = this.title);
                }
            });
            $("input:image, button, input:submit", context).on("click.formLabels", function () {
                if (enabled === false) {
                    return;
                }

                elts.each(function () {
                    if (this.type === "email" || this.type === "text" || this.type === "textarea" || this.type === "password") {
                        if (this.value === this.title && this.title !== "") {
                            this.value = "";
                        }
                    }
                });
            });
        }

        return {
            refreshLabels: refreshLabels,

            destroy: function () {
                elts.each(function () {
                    var label = $.data(this, "spanID");
                    if (label) {
                        // remove from the dom
                        $(label).remove();
                        $.data(this, "spanID", null);
                    }

                }).off(".formLabels");
                $(window).off(".formLabels");
            },

            disable: function () {
                if (enabled === true) {
                    enabled = false;
                    elts.each(function () {
                        $($.data(this, "spanID")).hide();
                    });
                }
            },

            enable: function () {
                if (enabled === false) {
                    enabled = true;
                    elts.each(function () {
                        $($.data(this, "spanID")).show();
                    });
                }
            }
        };
    };
})(jQuery);