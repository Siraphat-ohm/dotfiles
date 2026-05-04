# dotfiles

## Requirements

https://www.gnu.org/software/stow/

```bash
stow bin
```

## AI warmup script

[ai-warmup](bin/.local/bin/ai-warmup) This repo includes an ai-warmup helper script for lightweight Claude or Codex warmup pings.

Example usage:

```bash
ai-warmup claude 10:00 3 once
ai-warmup codex 10:00 3 once
```

Meaning:

```
Start work at 10:00.
Run a lightweight warmup ping 3 hours earlier, at 07:00.
```

Run immediately for testing:

```bash
ai-warmup claude 10:00 3 now
ai-warmup codex 10:00 3 now
```

Run in loop mode:

```
ai-warmup claude 10:00 3 loop
```
