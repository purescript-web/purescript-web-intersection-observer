export function _create(options) {
  return new IntersectionObserverEntry(options);
}

export function time(entry) {
  return entry.time;
}

export function _rootBounds(entry) {
  return entry.rootBounds;
}

export function boundingClientRect(entry) {
  return entry.boundingClientRect;
}

export function intersectionRect(entry) {
  return entry.intersectionRect;
}

export function isIntersecting(entry) {
  return entry.isIntersecting;
}

export function intersectionRatio(entry) {
  return entry.intersectionRatio;
}

export function target(entry) {
  return entry.target;
}
