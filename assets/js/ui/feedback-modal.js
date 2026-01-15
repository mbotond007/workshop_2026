import UiTextStore from "../store/ui-text-store.js";
import { submitFeedback } from "../api/submit-feedback.js";

const FeedbackModal = {
  el: null,
  isSubmitting: false,

  open() {
    if (this.el) return;

    const wrap = document.createElement("div");
    wrap.className = "modal";
    wrap.innerHTML = `
      <div class="modal__backdrop" data-action="modal-close"></div>
      <div class="modal__panel" role="dialog" aria-modal="true">
        <div class="modal__header">
          <h2 class="modal__title">${UiTextStore.t("feedback.title")}</h2>
          <button data-action="modal-close">${UiTextStore.t("modal.close")}</button>
        </div>

        <div class="modal__body">
          <input type="text" name="website" style="display:none" tabindex="-1" autocomplete="off">

          <div class="form-row">
            <label>${UiTextStore.t("feedback.message.label")}</label>
            <textarea name="message" rows="6"
              placeholder="${UiTextStore.t("feedback.message.placeholder")}"></textarea>
          </div>

          <div class="form-row">
            <label>${UiTextStore.t("feedback.email.label")}</label>
            <input type="email" name="email"
              placeholder="${UiTextStore.t("feedback.email.placeholder")}">
          </div>

          <div class="form-row">
            <div class="form-hint" data-role="feedback-status"></div>
          </div>
        </div>

        <div class="modal__footer">
          <button data-action="feedback-submit">${UiTextStore.t("feedback.submit")}</button>
        </div>
      </div>
    `;

    document.body.appendChild(wrap);
    this.el = wrap;

    this._onClick = (e) => {
      const a = e.target.closest("[data-action]");
      if (!a) return;
      if (a.dataset.action === "modal-close") this.close();
      if (a.dataset.action === "feedback-submit") this.submit();
    };

    this.el.addEventListener("click", this._onClick);
  },

  close() {
    if (!this.el) return;
    this.el.removeEventListener("click", this._onClick);
    this.el.remove();
    this.el = null;
    this.isSubmitting = false;
  },

  async submit() {
    if (this.isSubmitting || !this.el) return;

    const message = this.el.querySelector('[name="message"]').value.trim();
    const email = this.el.querySelector('[name="email"]').value.trim();
    const honeypot = this.el.querySelector('[name="website"]').value;

    if (!message) {
      this._setStatus(UiTextStore.t("feedback.error.required"), true);
      return;
    }

    this.isSubmitting = true;
    this._setStatus(UiTextStore.t("feedback.sending"));

    try {
      await submitFeedback({ message, email, honeypot });
      this._setStatus(UiTextStore.t("feedback.success"));
      this.el.querySelector('[name="message"]').value = "";
      this.el.querySelector('[name="email"]').value = "";
    } catch {
      this._setStatus(UiTextStore.t("feedback.error.generic"), true);
    } finally {
      this.isSubmitting = false;
    }
  },

  _setStatus(txt, isError = false) {
    const el = this.el.querySelector('[data-role="feedback-status"]');
    if (!el) return;
    el.textContent = txt;
    el.classList.toggle("is-error", !!isError);
  }
};

export default FeedbackModal;
