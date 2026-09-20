const accessKey = 'moldflow-reading-access';
const passwordHash = 'd838520a21b40d67f5934eab4c48216cc0cd4e5026c0f63d9e8de5767dee78e5';

const hashPassword = async (password) => {
  const bytes = new TextEncoder().encode(password);
  const digest = await crypto.subtle.digest('SHA-256', bytes);
  return Array.from(new Uint8Array(digest), (byte) => byte.toString(16).padStart(2, '0')).join('');
};

const unlock = (protectedElements, gate) => {
  sessionStorage.setItem(accessKey, 'granted');
  protectedElements.forEach((element) => {
    element.hidden = false;
  });
  gate.remove();
};

const mountGate = (protectedElements) => {
  const gate = document.createElement('section');
  gate.className = 'moldflow-access-gate';
  gate.innerHTML = `
    <p class="moldflow-access-gate__eyebrow">中文专题阅读</p>
    <h2>输入访问密码</h2>
    <p>本专区仅提供中文内容。访问门仅防止随意浏览，不是服务器级别的安全认证。</p>
    <form>
      <label for="moldflow-access-password">访问密码</label>
      <input id="moldflow-access-password" name="password" type="password" autocomplete="current-password" required />
      <p class="moldflow-access-gate__error" aria-live="polite" hidden></p>
      <button type="submit">进入阅读区</button>
    </form>
  `;

  const form = gate.querySelector('form');
  const input = gate.querySelector('input');
  const error = gate.querySelector('.moldflow-access-gate__error');
  form.addEventListener('submit', async (event) => {
    event.preventDefault();
    const hash = await hashPassword(input.value);
    if (hash === passwordHash) {
      unlock(protectedElements, gate);
      return;
    }

    error.textContent = '密码不正确，请重试。';
    error.hidden = false;
    input.select();
  });

  protectedElements[0].before(gate);
  input.focus();
};

const initializeGate = () => {
  const protectedElements = Array.from(
    document.querySelectorAll('[data-moldflow-protected-content], [data-moldflow-protected-navigation]')
  );
  if (protectedElements.length === 0) return;

  if (sessionStorage.getItem(accessKey) === 'granted') {
    protectedElements.forEach((element) => {
      element.hidden = false;
    });
    return;
  }

  protectedElements.forEach((element) => {
    element.hidden = true;
  });
  mountGate(protectedElements);
};

if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', initializeGate, { once: true });
} else {
  initializeGate();
}
