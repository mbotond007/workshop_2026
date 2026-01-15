export async function submitFeedback({ message, email, honeypot }) {
  const form = new URLSearchParams();
  form.set("message", message);
  if (email) form.set("email", email);
  if (honeypot) form.set("website", honeypot);

  const response = await fetch("modules/api/submit-feedback.php", {
    method: "POST",
    headers: { "Content-Type": "application/x-www-form-urlencoded;charset=UTF-8" },
    body: form.toString()
  });

  const raw = await response.text();
  let json;
  try {
    json = JSON.parse(raw);
  } catch {
    throw new Error("Invalid JSON: " + raw.slice(0, 80));
  }

  if (!response.ok || !json.success) {
    throw new Error(json.error || "Feedback submit failed");
  }

  return true;
}
