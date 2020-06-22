"use strict";

exports._create = function (options) {
  return new IntersectionObserverEntry(options);
};

exports.time = function (entry) {
  return entry.time;
};

exports._rootBounds = function (entry) {
  return entry.rootBounds;
};

exports.boundingClientRect = function (entry) {
  return entry.boundingClientRect;
};

exports.intersectionRect = function (entry) {
  return entry.intersectionRect;
};

exports.isIntersecting = function (entry) {
  return entry.isIntersecting;
};

exports.intersectionRatio = function (entry) {
  return entry.intersectionRatio;
};

exports.target = function (entry) {
  return entry.target;
};
