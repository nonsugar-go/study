# uv

- https://docs.astral.sh/uv/getting-started/installation/#installation-methods

```zsh
curl -LsSf https://astral.sh/uv/install.sh | sh
source $HOME/.local/bin/env
```

```zsh
uv self update
```

## 機能

- https://docs.astral.sh/uv/getting-started/features/

### ツールのインストール ($HOME/.local/bin/ にインストール)

- https://docs.astral.sh/uv/guides/tools/#installing-tools

```zsh
uv tool install ruff
```

```zsh
uv tool upgrade --all
```

### プロジェクト

- https://docs.astral.sh/uv/guides/projects/
- https://docs.astral.sh/uv/concepts/projects/sync/#syncing-development-dependencies

```zsh
uv lock --upgrade
uv sync
```

### Virtual Environment (activate で有効化)

- https://docs.astral.sh/uv/pip/environments/
- https://docs.astral.sh/uv/pip/packages/
- https://docs.astral.sh/uv/pip/inspection/

```zsh
uv venv
uv pip install -U pwntools
uv pip list
source .venv/bin/activate
```

```zsh
deactivate
```

