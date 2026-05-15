# Elicitation

Suggested layout once an engagement is loaded:

```text
elicitation/
  intake/
    INT-<date>-<source>.md       # raw stakeholder requests, classified
  notes/                          # ⭐ raw material: structured .md notes
    MN-<date>-<slug>.md           #    meeting note
    TR-<date>-<slug>.md           #    transcript
    EM-<date>-<slug>.md           #    email
    DOC-<date>-<slug>.md          #    document excerpt
    MSG-<date>-<slug>.md          #    chat thread
    OBS-<date>-<slug>.md          #    observation/shadowing
    SUR-<date>-<slug>.md          #    survey response
    attachments/                  #    file raw lớn / binary đi kèm note
      <date>-<slug>.<ext>         #    PDF, .eml, .png, .m4a, .docx, ...
  stakeholders.md                 # from templates/stakeholder-register.md
  plan.md                         # from templates/elicitation-plan.md
  guides/
    interview-<role>.md           # from templates/interview-guide.md
    workshop-<topic>.md           # from templates/workshop-agenda.md
  sessions/
    SES-<date>-<stakeholder>.md   # structured log from templates/observation-log.md
```

## Flow

```text
1. Raw event happens (meeting / call / email / file share)
   -> nếu raw nhỏ/text: paste vào prompt DUMP-note.md (Cách B)
      nếu raw lớn/binary: save vào notes/attachments/, rồi prompt
      DUMP-note.md (Cách A)
   -> agent tạo notes/<PREFIX>-<date>-<slug>.md
      verbatim extract + tag + metadata + link tới attachment (nếu có)
   -> status: captured

2. When time permits — structure session log
   -> create SES-... in sessions/ referencing the note(s)
   -> extract RAW statements in ../requirements/raw/
      each pointing to source note (and SES if any)
   -> note status: processed

3. Later — promote RAW to analyzed REQ
   -> chain stays complete:
      REQ -> RAW -> SES -> Note (-> attachment file if any)
```

Notes are the **evidentiary floor**. Never edited retroactively. If
content turns out wrong (stakeholder corrects later), create a new note
and mark the old one `superseded by <new-id>` — never overwrite history.

## Why dump first, structure later

Trying to write a perfect session log during a meeting splits attention
and loses signal. Dump raw note in 5 minutes. Structure later when you
can think clearly. Both steps tracked on disk; nothing lives only in
memory or chat.
