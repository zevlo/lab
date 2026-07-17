import sys
from pathlib import Path


def create_structure(base_dir: str = "test_env") -> None:
    base_path = Path(base_dir)

    # Create directories
    # exist_ok=True prevents errors if the directory already exists
    for sub in ("config", "data", "logs"):
        base_path.joinpath(sub).mkdir(parents=True, exist_ok=True)

    # Create some dummy files.
    # NOTE: data/users.db contains text, not real binary data — it's a placeholder.
    files_to_create = {
        "app.py": "# Main application code",
        "README.md": "# Project Documentation",
        "config/settings.conf": "host=localhost\nport=8080",
        "config/database.conf": "db_name=test_db",
        "data/users.db": "binary data",
        "logs/error.log": "Error: Connection failed",
    }

    for rel_path, content in files_to_create.items():
        full_path = base_path.joinpath(rel_path)
        full_path.parent.mkdir(parents=True, exist_ok=True)
        try:
            full_path.write_text(content)
            print(f"Created: {full_path}")
        except OSError as e:
            print(f"Failed to create {full_path}: {e}")


if __name__ == "__main__":
    directory = sys.argv[1] if len(sys.argv) > 1 else "test_env"
    create_structure(directory)
