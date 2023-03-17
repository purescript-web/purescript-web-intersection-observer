export function _create(callback, options) {
  return new IntersectionObserver(callback, options);
}

export function root(observer) {
  return observer.root;
}

export function rootMargin(observer) {
  return observer.rootMargin;
}

export function thresholds(observer) {
  return observer.thresholds;
}

export function _observe(observer, target) {
  return observer.observe(target);
}

export function _unobserve(observer, target) {
  return observer.unobserve(target);
}

export function _disconnect(observer) {
  return observer.disconnect();
}

export function _takeRecords(observer) {
  return observer.takeRecords();
}
