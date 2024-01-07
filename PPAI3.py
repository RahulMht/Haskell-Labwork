import sys

def get_issues():
    """Gets the user's issues from the command line."""
    if len(sys.argv) < 2:
        print("Usage: python script.py issue1 issue2 ...")
        sys.exit(1)

    return sys.argv[1:]

def find_solution(issue):
    """Finds the solution for the given issue."""
    for rule in rules:
        if issue == rule["issue"]:
            return rule["solution"]

    return "No solution found."

if __name__ == "__main__":
    issues = get_issues()

    for issue in issues:
        solution = find_solution(issue)
        print(f"Issue: {issue}")
        print(f"Solution: {solution}")