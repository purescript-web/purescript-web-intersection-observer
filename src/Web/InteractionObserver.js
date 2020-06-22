"use strict";

exports._create = function (callback, options) {
  return new IntersectionObserver(callback, options);
};

exports.root = function (observer) {
  return observer.root;
};

exports.rootMargin = function (observer) {
  return observer.rootMargin;
};

exports.thresholds = function (observer) {
  return observer.thresholds;
};

exports._observe = function (observer, target) {
  return observer.observe(target);
};

exports._unobserve = function (observer, target) {
  return observer.unobserve(target);
};

exports._disconnect = function (observer) {
  return observer.disconnect();
};

exports._takeRecords = function (observer) {
  return observer.takeRecords();
};
