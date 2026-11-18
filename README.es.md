# Local Web Studio — guía en español

Plugin de Claude Code para quien hace webs a negocios locales. Cubre todo el negocio:
encontrar clientes, vender, diseñar, construir, entregar y mantener. Sirve para granjas, casas
rurales, restaurantes, oficios, tiendas, clínicas, talleres…

Las instrucciones internas están en inglés para que sirva a cualquiera, pero **Claude te
responde siempre en tu idioma** y escribe los textos para clientes en el idioma del cliente.

## Qué trae

- **31 skills**: todo el ciclo, desde buscar clientes hasta renovar el mantenimiento.
- **11 packs de sector**: granjas y ganadería, maquinaria agrícola, turismo rural,
  productores de alimentos, restaurantes, oficios, talleres de coches, peluquería y estética,
  salud, tiendas y despachos profesionales.
- **6 agentes revisores**: web completa, SEO local, textos, traducciones (incluido el
  gallego), diseño y búsqueda de clientes.
- **11 comandos**: `/local-web-studio:setup`, `prospect`, `discovery`, `new-client`,
  `proposal`, `demo`, `review`, `deliver`, `care-report`, `takeover` y `status`.
- **1 hook silencioso**: revisa cada página HTML que se escribe y solo avisa si falta algo
  importante, como un botón de llamar o el título.
- **Plantillas**: perfil del estudio, ficha de cliente, entrega, informe anual, registro de
  diseños, datos estructurados, base técnica de web y páginas legales españolas.
- **Scripts**: `check-site.sh` (revisión automática) y `optimize-images.sh` (fotos para web).

## Cómo encaja con tu forma de trabajar

- **Tu `CLAUDE.md` manda.** Precios, "incluido" en vez de "gratis", proponer antes de cambiar
  una web entregada, tus carpetas (`clientes/<nombre>/notas.md`, `fotos/`, `web/`)… El plugin
  lo lee primero y se adapta. No te cambia la estructura.
- **Sin plantilla de diseño.** El diseño sale de cada negocio, y un registro de diseños evita
  que dos webs se parezcan. Lo único común es lo técnico: botones, SEO, mapa y legal.
- **Nada inventado.** Si falta un dato, pone `[TO CONFIRM]` y la revisión no deja publicar
  hasta que se resuelva.
- **Todo a nombre del cliente**: dominio, Netlify y ficha de Google.

## Instalar

Desde la carpeta local:

```bash
claude plugin marketplace add ~/Desktop/webs/local-web-studio
claude plugin install local-web-studio@local-web-studio
```

Después cierra y abre una sesión nueva.

## Uso típico

```text
/local-web-studio:new-client Casa do Río
/local-web-studio:discovery casa-do-rio            → guion para la llamada
/local-web-studio:discovery casa-do-rio <notas>    → rellena la ficha
/local-web-studio:proposal casa-do-rio             → presupuesto + resumen para WhatsApp
/local-web-studio:demo casa-do-rio                 → primera versión de la web
/local-web-studio:review casa-do-rio launch        → revisión completa
/local-web-studio:deliver casa-do-rio              → publicación y entrega
/local-web-studio:care-report casa-do-rio          → mensaje de resultados / informe anual
/local-web-studio:status                           → cómo va cada cliente
```

También puedes hablar normal ("mañana tengo llamada con una casa rural") y las skills se
activan solas.

## Apagar el hook en un proyecto

Crea un archivo vacío llamado `.lws-no-checks` en la carpeta del proyecto.

## Compartirlo

Es licencia MIT. Para compartirlo, súbelo a un repositorio de GitHub. Otros lo instalan con:

```bash
claude plugin marketplace add angelvazquezcea/local-web-studio
claude plugin install local-web-studio@local-web-studio
```
