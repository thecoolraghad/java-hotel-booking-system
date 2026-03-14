# Contributing Guidelines

Thank you for contributing to the Hotel Room Booking and Management System!

## Getting Started

1. Fork the repository
2. Create a new branch: `git checkout -b feature/your-feature-name`
3. Make your changes
4. Commit with a clear message: `git commit -m "Add: brief description"`
5. Push to your fork: `git push origin feature/your-feature-name`
6. Open a Pull Request

## Branch Naming

| Type | Format | Example |
|------|--------|---------|
| New feature | `feature/name` | `feature/date-conflict-check` |
| Bug fix | `fix/name` | `fix/payment-null-pointer` |
| Refactoring | `refactor/name` | `refactor/database-pooling` |
| Documentation | `docs/name` | `docs/update-readme` |

## Commit Messages

Use the format: `Type: short description`

- `Add:` new feature or file
- `Fix:` bug fix
- `Update:` modification to existing feature
- `Remove:` deletion of code or files
- `Docs:` documentation only changes
- `Refactor:` code restructuring without behavior change

## Code Style

- Use **4-space indentation**
- Follow Java naming conventions (camelCase for methods/variables, PascalCase for classes)
- Add comments for non-obvious logic
- Keep methods focused — one responsibility per method
- Use `PreparedStatement` for all database queries (never string concatenation)

## Testing

Before submitting a PR, manually verify:
- [ ] The application compiles without errors
- [ ] Login works for both staff and guest flows
- [ ] Room CRUD operations reflect correctly in the database
- [ ] Booking, check-in, check-out, and payment all complete successfully
- [ ] No null pointer exceptions on empty inputs

## Security Notes

- **Never commit real database credentials.** Use placeholder values in `DatabaseManager.java`.
- Do not commit the MySQL JDBC `.jar` file — add it to `lib/` locally and keep it in `.gitignore`.
