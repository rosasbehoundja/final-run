#!/usr/bin/env bash

set -Eeuo pipefail

# Le script fonctionne quel que soit le dossier depuis lequel il est appelé.
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

MAIN_FILE="main.tex"
JOB_NAME="${MAIN_FILE%.tex}"

usage() {
    printf 'Usage : %s [build|clean]\n' "$(basename -- "$0")"
    printf '  build (par défaut) : génère %s.pdf\n' "$JOB_NAME"
    printf '  clean              : supprime les fichiers de compilation\n'
}

check_command() {
    if ! command -v "$1" >/dev/null 2>&1; then
        printf 'Erreur : la commande "%s" est introuvable.\n' "$1" >&2
        exit 127
    fi
}

ACTION="${1:-build}"

case "$ACTION" in
    build)
        check_command latexmk

        printf 'Compilation de %s...\n' "$MAIN_FILE"
        latexmk \
            -g \
            -pdf \
            -interaction=nonstopmode \
            -file-line-error \
            -halt-on-error \
            "$MAIN_FILE"

        # latexmk gère BibTeX. Les glossaires nécessitent cette étape explicite.
        if [[ -f "$JOB_NAME.glo" || -f "$JOB_NAME.acn" ]]; then
            check_command makeglossaries
            makeglossaries "$JOB_NAME"

            # Met à jour le PDF après la génération des acronymes/glossaires.
            latexmk \
                -g \
                -pdf \
                -interaction=nonstopmode \
                -file-line-error \
                -halt-on-error \
                "$MAIN_FILE"
        fi

        printf '\nPDF généré : %s/%s.pdf\n' "$SCRIPT_DIR" "$JOB_NAME"
        ;;
    clean)
        check_command latexmk
        latexmk -C "$MAIN_FILE"
        # Fichiers de travail produits par glossaries et minitoc.
        find . -maxdepth 1 -type f \
            \( -name "$JOB_NAME.acn" -o -name "$JOB_NAME.acr" \
            -o -name "$JOB_NAME.alg" -o -name "$JOB_NAME.glg" \
            -o -name "$JOB_NAME.glo" -o -name "$JOB_NAME.gls" \
            -o -name "$JOB_NAME.ist" -o -name "$JOB_NAME.maf" \
            -o -name "$JOB_NAME.mtc*" \) -delete
        printf 'Fichiers de compilation supprimés.\n'
        ;;
    -h|--help|help)
        usage
        ;;
    *)
        printf 'Erreur : action inconnue "%s".\n' "$ACTION" >&2
        usage >&2
        exit 2
        ;;
esac
