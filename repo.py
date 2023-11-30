import subprocess

def create_github_repo(repo_name):
    # Création dépôt
    terraform_command = ["terraform", "apply", "-auto-approve", f"-var=nom_du_repo={repo_name}"]

    try:
        # Commande terraform
        subprocess.run(terraform_command, check=True)
        print(f"Le dépôt GitHub '{repo_name}' a été créé avec succès.")
    except subprocess.CalledProcessError as e:
        print(f"Erreur lors de la création du dépôt GitHub : {e}")
        exit(1)

if __name__ == "__main__":
    # Demander le nom du dépôt
    repo_name = input("Veuillez saisir le nom du dépôt GitHub : ")

    # Appel fonction pour le dépôt GitHub
    create_github_repo(repo_name)
