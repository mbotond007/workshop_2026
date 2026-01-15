export async function submitContact({ email, message }) {
  const form = new URLSearchParams();
  form.set("email", email);
  form.set("message", message);

  const response = await fetch("modules/api/submit-contact.php", {
    method: "POST",
    headers: { "Content-Type": "application/x-www-form-urlencoded;charset=UTF-8" },
    body: form.toString()
  });

  const raw = await response.text();
  let json;
  try {
    json = JSON.parse(raw);
  } catch {
    throw new Error("submitContact invalid JSON. Raw: " + raw.slice(0, 80));
  }

  if (!response.ok || !json.success) {
    throw new Error(json.error || `submitContact failed HTTP ${response.status}`);
  }

  return json.data;
}
