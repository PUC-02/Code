/* eslint-disable no-undef */
// Three.js 3D hero scene with responsive and performance-aware setup

const state = {
  hasWebGL: supportsWebGL(),
  isReducedMotion: window.matchMedia('(prefers-reduced-motion: reduce)').matches,
  isLowPower: matchLowPowerDevice(),
  animationHandle: null,
  renderer: null,
  scene: null,
  camera: null,
  controls: null,
  objects: [],
};

// Header small interactivity
const yearEl = document.getElementById('year');
if (yearEl) yearEl.textContent = String(new Date().getFullYear());

const themeToggle = document.getElementById('themeToggle');
if (themeToggle) {
  themeToggle.addEventListener('click', () => {
    const isLight = document.documentElement.getAttribute('data-theme') === 'light';
    document.documentElement.setAttribute('data-theme', isLight ? 'dark' : 'light');
  });
}

// Initialize hero scene
const root = document.getElementById('webgl-root');
const poster = document.getElementById('poster');

if (state.hasWebGL && root) {
  initScene(root).catch((err) => {
    console.error('Failed to init 3D scene', err);
    showPosterFallback();
  });
} else {
  showPosterFallback();
}

function showPosterFallback() {
  if (poster) poster.hidden = false;
}

async function initScene(container) {
  // Dynamic import from CDN to keep index.html simple
  const THREE = await import('https://unpkg.com/three@0.161.0/build/three.module.js');
  const { OrbitControls } = await import('https://unpkg.com/three@0.161.0/examples/jsm/controls/OrbitControls.js');

  const scene = new THREE.Scene();
  scene.background = null;

  const camera = new THREE.PerspectiveCamera(55, 16 / 10, 0.1, 100);
  camera.position.set(3.2, 1.8, 3.6);

  const renderer = new THREE.WebGLRenderer({ antialias: !state.isLowPower, alpha: true, powerPreference: 'high-performance' });
  renderer.setPixelRatio(Math.min(window.devicePixelRatio || 1, state.isLowPower ? 1.25 : 1.75));
  resizeRendererToDisplaySize(renderer, container);
  container.appendChild(renderer.domElement);

  // Lights
  const hemiLight = new THREE.HemisphereLight(0xcfe8ff, 0x0b0f14, 0.9);
  scene.add(hemiLight);
  const dirLight = new THREE.DirectionalLight(0xffffff, 1.1);
  dirLight.position.set(3, 5, 2);
  dirLight.castShadow = false;
  scene.add(dirLight);

  // Floor grid glow
  const grid = new THREE.GridHelper(12, 24, 0x334155, 0x1f2937);
  grid.position.y = -1.2;
  scene.add(grid);

  // Central icosahedron with emissive material
  const geometry = new THREE.IcosahedronGeometry(1.0, 1);
  const material = new THREE.MeshStandardMaterial({
    color: 0x6ee7ff,
    metalness: 0.2,
    roughness: 0.25,
    emissive: 0x1d4ed8,
    emissiveIntensity: 0.25,
  });
  const core = new THREE.Mesh(geometry, material);
  core.position.y = 0.3;
  scene.add(core);

  // Orbiting rings
  const ringMaterial = new THREE.MeshBasicMaterial({ color: 0xa78bfa, wireframe: true, transparent: true, opacity: 0.8 });
  for (let i = 0; i < 3; i += 1) {
    const ringGeo = new THREE.TorusGeometry(1.35 + i * 0.18, 0.015, 8, 128);
    const ring = new THREE.Mesh(ringGeo, ringMaterial);
    ring.rotation.x = i * 0.6 + 0.6;
    ring.rotation.y = i * 0.3;
    scene.add(ring);
    state.objects.push(ring);
  }
  state.objects.push(core);

  // Particles (reduced count on low devices)
  const particleCount = state.isLowPower ? 200 : 600;
  const particles = new THREE.BufferGeometry();
  const positions = new Float32Array(particleCount * 3);
  for (let i = 0; i < particleCount; i += 1) {
    const r = 4 + Math.random() * 6;
    const theta = Math.random() * Math.PI * 2;
    const phi = Math.acos(2 * Math.random() - 1);
    positions[i * 3 + 0] = r * Math.sin(phi) * Math.cos(theta);
    positions[i * 3 + 1] = (Math.random() - 0.5) * 2.5;
    positions[i * 3 + 2] = r * Math.sin(phi) * Math.sin(theta);
  }
  particles.setAttribute('position', new THREE.BufferAttribute(positions, 3));
  const particleMat = new THREE.PointsMaterial({ color: 0x60a5fa, size: 0.02, transparent: true, opacity: 0.85 });
  const points = new THREE.Points(particles, particleMat);
  scene.add(points);
  state.objects.push(points);

  // Controls (disabled rotate on mobile for better UX)
  const controls = new OrbitControls(camera, renderer.domElement);
  controls.enableDamping = true;
  controls.enablePan = false;
  controls.minDistance = 2.2;
  controls.maxDistance = 7;
  controls.autoRotate = !state.isReducedMotion;
  controls.autoRotateSpeed = 0.6;
  if (isTouchDevice()) {
    controls.rotateSpeed = 0.6;
  }

  state.scene = scene;
  state.camera = camera;
  state.renderer = renderer;
  state.controls = controls;

  // Resize handling
  addEventListener('resize', () => resizeRendererToDisplaySize(renderer, container));

  // Animation loop
  const animate = (timeMs) => {
    if (state.isReducedMotion) {
      renderer.render(scene, camera);
      return;
    }
    const t = timeMs * 0.001;
    core.rotation.x = t * 0.35;
    core.rotation.y = t * 0.25;
    for (let i = 0; i < state.objects.length; i += 1) {
      const obj = state.objects[i];
      if (obj !== core) obj.rotation.z = t * 0.05 * (i + 1);
    }
    controls.update();
    renderer.render(scene, camera);
    state.animationHandle = requestAnimationFrame(animate);
  };

  if (!state.isReducedMotion) {
    state.animationHandle = requestAnimationFrame(animate);
  } else {
    renderer.render(scene, camera);
  }
}

function resizeRendererToDisplaySize(renderer, container) {
  const { clientWidth, clientHeight } = container;
  renderer.setSize(clientWidth, clientHeight, false);
  if (state.camera) {
    state.camera.aspect = clientWidth / clientHeight;
    state.camera.updateProjectionMatrix();
  }
}

function supportsWebGL() {
  try {
    const canvas = document.createElement('canvas');
    return !!(
      window.WebGLRenderingContext &&
      (canvas.getContext('webgl') || canvas.getContext('experimental-webgl'))
    );
  } catch (e) {
    return false;
  }
}

function isTouchDevice() {
  return 'ontouchstart' in window || navigator.maxTouchPoints > 0;
}

function matchLowPowerDevice() {
  const isMobile = /Mobi|Android|iPhone|iPad|iPod/i.test(navigator.userAgent);
  const memory = navigator.deviceMemory || 4; // assume 4GB if unknown
  return isMobile || memory <= 4;
}

