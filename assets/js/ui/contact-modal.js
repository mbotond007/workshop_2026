import UiTextStore from "../store/ui-text-store.js";
import { submitContact } from "../api/submit-contact.js";

const ContactModal = {
  el: null,
  isSubmitting: false,

  open() {
    if (this.el) return; // already open

    const title = UiTextStore.t("contact.title", "Kapcsolat");
    const closeTxt = UiTextStore.t("modal.close", "Bezárás");

    const emailLabel = UiTextStore.t("contact.email.label", "Email");
    const emailPh = UiTextStore.t("contact.email.placeholder", "pl. nev@pelda.hu");
    const msgLabel = UiTextStore.t("contact.message.label", "Üzenet");
    const msgPh = UiTextStore.t("contact.message.placeholder", "Írd le röviden…");
    const submitTxt = UiTextStore.t("contact.submit", "Üzenet küldése");

    const wrap = document.createElement("div");
    wrap.className = "modal";
    wrap.innerHTML = `
      <div class="modal__backdrop" data-action="modal-close"></div>
      <div class="modal__panel" role="dialog" aria-modal="true" aria-label="${title}">
        <div class="modal__header">
          <h2 class="modal__title">${title}</h2>
          <button class="modal__close" type="button" data-action="modal-close">${closeTxt}</button>
        </div>

        <div class="modal__body">
          <div class="form-row">
            <label class="form-label">${emailLabel}</label>
            <input class="form-input" type="email" name="email" placeholder="${emailPh}" autocomplete="email" />
          </div>

          <div class="form-row">
            <label class="form-label">${msgLabel}</label>
            <textarea class="form-textarea" name="message" rows="6" placeholder="${msgPh}"></textarea>
          </div>

          <div class="form-row">
            <div class="form-hint" data-role="contact-status" aria-live="polite"></div>
          </div>
        </div>

        <div class="modal__footer">
          <button class="btn-primary" type="button" data-action="contact-submit">${submitTxt}</button>
        </div>
      </div>
    `;

    document.body.appendChild(wrap);
    this.el = wrap;
    
    // Local event delegation inside the modal (so it works even if global delegation is header-scoped)
    this._onClick = (e) => {
    const el = e.target.closest("[data-action]");
    if (!el) return;

    const action = el.dataset.action;

    if (action === "modal-close") this.close();
    if (action === "contact-submit") this.submit();
    };

    this.el.addEventListener("click", this._onClick);

    // optional UX: focus email
    const emailInput = this.el.querySelector('input[name="email"]');
    if (emailInput) emailInput.focus();
  },

  close() {
    if (!this.el) return;
    
    if (this._onClick && this.el) {
    this.el.removeEventListener("click", this._onClick);
    this._onClick = null;
    }

    this.el.remove();
    this.el = null;
    this.isSubmitting = false;
  },

  _setStatus(text, isError = false) {
    if (!this.el) return;
    const s = this.el.querySelector('[data-role="contact-status"]');
    if (!s) return;
    s.textContent = text || "";
    s.classList.toggle("is-error", !!isError);
  },

  async submit() {
    if (!this.el || this.isSubmitting) return;

    const email = (this.el.querySelector('input[name="email"]')?.value || "").trim();
    const message = (this.el.querySelector('textarea[name="message"]')?.value || "").trim();

    if (!email || !message) {
      this._setStatus(UiTextStore.t("contact.error.required", "Kérlek töltsd ki a kötelező mezőket."), true);
      return;
    }

    // light email check (backend is authoritative)
    if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
      this._setStatus(UiTextStore.t("contact.error.email", "Kérlek érvényes email címet adj meg."), true);
      return;
    }

    this.isSubmitting = true;
    this._setStatus(UiTextStore.t("contact.sending", "Küldés…"), false);

    // disable button
    const btn = this.el.querySelector('[data-action="contact-submit"]');
    if (btn) btn.setAttribute("disabled", "disabled");

    try {
      await submitContact({ email, message });
      this._setStatus(UiTextStore.t("contact.success", "Üzeneted rögzítettük, köszönjük."), false);

      // opcionális: 1.2s után zárhat, de most maradjunk konzervatívak:
      // a felhasználó látja a sikert, és ő zárja be.
      
    // optional: clear inputs after success
    const emailEl = this.el.querySelector('input[name="email"]');
    const msgEl = this.el.querySelector('textarea[name="message"]');
    if (emailEl) emailEl.value = "";
    if (msgEl) msgEl.value = "";

    
    } catch (e) {
      this._setStatus(UiTextStore.t("contact.error.generic", "Hiba történt. Kérlek próbáld újra."), true);
      // console.debug(e);
    } finally {
      this.isSubmitting = false;
      if (btn) btn.removeAttribute("disabled");
    }
  }
};

export default ContactModal;
