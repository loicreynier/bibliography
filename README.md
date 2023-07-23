# Bibliography

Version control repository of my bibliography.

## About

This repository serves as a collection of references for
academic publications,
research papers,
and other scholarly works.
The references are stored in the [BibTeX] format
and are managed with the [Pubs] tool[^1].
Most of the data is sourced from [Crossref],
with additional modifications applied,
such as author name corrections,
case protection,
inclusion of page numbers,
and standardization of fields,
among others.
It is important to note that the original documents themselves
are not available in this repository.

The primary purpose of this repository is to serve as
a backup for my bibliography.
As a PhD student in fluid mechanics,
the majority of the references pertain to fluid mechanics
and numerical methods.
The repository may be of value to individuals
working with similar references.

The following sections of this README serve
as a personal reminder of
the conventions I have established for organizing this bibliography.

[^1]:
    [Pubs] is a Python-based command-line tool
    designed to facilitate bibliography management
    and automate the retrieval of BibTeX files.

[bibtex]: https://www.bibtex.com/g/bibtex-format
[crossref]: https://www.crossref.org
[pubs]: https://github.com/pubs/pubs

## Bibliography

The complete reference list is available in Markdown text format
in the file [`./bibliography.md`](./bibliography.md),
and individual references in BibTeX format
are stored in the [`./bib`](./bib/) directory.

## Convention for citation keys

This bibliography follows the [Google Scholars] convention for citation keys,
which is `<author><year><first-relevant-word>`.
For instance,
an article authored by Loïc Reynier-Décomis
published in 2023
and titled
_Anti-diffusion scheme for the reverse time-advancement
of meta-stable time-travel turbulence simulation_
will be cited using the key `reynier2023anti`.

[google scholars]: https://scholar.google.com

## Convention for BibTeX fields

- `author`: The names of the authors should be as complete as possible,
  and if the first names are known, they must be included.
- `month`: The numerical representation of the month should be used
  (example: `month = {2}`).
- `title`: Capital letters should be protected with braces
  (example: `title = {... in turbulence {DNS}}`)
  According to [this question on TeX StackExchange][capitalProtection],
  only the capital letters in this field should be protected.

[capitalProtection]: https://tex.stackexchange.com/questions/10772

## Tags

References are tagged for quick accessibility through `pubs list "tags:<tag>"`.
Below is the list of associated tags and their descriptions[^2]:

- `HIT`: Works related to isotropic turbulence.
- `VariableDensity`: Works related to variable-density flows.
- `Thesis`: Doctoral thesis references.
- `PhD`[^3]: References used in my thesis.
- `ArticleVDHIT`: References used in
  [our article on isotropic turbulence][articleVDHIT]
  of variable-density incompressible flows.
- `ArticleVDPrecond`: References used in
  [our article on the preconditioning][articleVDPrecond]
  of the operators related to the numerical resolution of incompressible flows
  with variable-density.

[^2]: Tags are written in CamelCaze to facilitate their usage in Pubs.
[^3]:
    The full bibliography of my thesis can be exported to the BibTeX format
    using the command
    `pubs list "tags:phd" -k | xargs pubs export > references.bib`.

[articleVDHIT]: ./bib/reynier2023isotropic.bib
[articleVDPrecond]: ./bib/reynier2023preconditioning.bib

## Pubs configuration

The bibliography is organized
to be managed with following Pubs configuration:

```ini
[main]
pubsdir = /home/loic/.pubs
docsdir = /home/loic/.pubs/docs
doc_add = link
note_extension = md
```

Therefore,
this repository should be cloned and linked to `~/.pubs`:

```shell
git clone git@github.com:loicreynier/bibliography <path>
ln -s ~/.pubs <path>
```
