import { createElement } from "helpers/html";

const checkCircle = (klass) =>
  `<svg class="${klass}" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" width="24" height="24" stroke-width="2"> <path d="M12 12m-9 0a9 9 0 1 0 18 0a9 9 0 1 0 -18 0"></path> <path d="M9 12l2 2l4 -4"></path> </svg>`;

const alertCircle = (klass) =>
  `<svg class="${klass}" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" width="24" height="24" stroke-width="2"> <path d="M3 12a9 9 0 1 0 18 0a9 9 0 0 0 -18 0"></path> <path d="M12 8v4"></path> <path d="M12 16h.01"></path> </svg> `;

const closeIcon = (klass) => `
  <svg class="${klass}" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" width="24" height="24" stroke-width="2"> <path d="M18 6l-12 12"></path> <path d="M6 6l12 12"></path> </svg>
  `;

export function flash(input) {
  const {
    type = "info",
    message,
    html,
    position = "center",
    klass,
    id,
    howToFixLink,
  } = input;

  let containerId;
  if (position == "center") containerId = "#flash_messages";
  if (position == "right") containerId = "#flash_messages_right";
  const container = document.querySelector(containerId);

  let classes = `${klass} alert alert-soft`;
  if (type == "info") classes += " alert-info";
  if (type == "error") classes += " alert-error";
  if (type == "warning") classes += " alert-warning";

  const div = createElement("div", {
    id: id || crypto.randomUUID(),
    class: classes,
    "data-controller": "self-destruct",
    "data-self-destruct-ttl-value": type == "error" ? 10000 : 5000,
  });

  let icon = "";
  if (type == "info") icon = checkCircle();
  if (type == "warning") icon = alertCircle();
  if (type == "error") icon = alertCircle();

  const howToFix = howToFixLink
    ? `<a target="_blank" href="${howToFixLink}" class="btn btn-sm btn-ghost">How to fix</a>`
    : "";

  if (html) div.innerHTML = html;
  else if (message) {
    div.innerHTML = `
      ${icon}
      <span>${message}</span>
      <div>
        ${howToFix}
      </div>
      `;
  }

  container.prepend(div);
}
