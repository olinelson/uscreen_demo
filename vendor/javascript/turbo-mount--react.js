// turbo-mount/react@0.4.3 downloaded from https://ga.jspm.io/npm:turbo-mount@0.4.3/dist/plugins/react.js

import{buildRegisterFunction as o}from"turbo-mount";export{TurboMount}from"turbo-mount";import{createElement as t}from"react";import{createRoot as r}from"react-dom/client";const n={mountComponent:o=>{const{el:n,Component:m,props:e}=o;const u=r(n);u.render(t(m,e));return()=>{u.unmount()}}};const m=o(n);export{n as default,m as registerComponent};

