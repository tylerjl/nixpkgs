{
  lib,
  buildPythonPackage,
  pythonOlder,
  fetchFromGitHub,
  setuptools,
  mccabe,
  pycodestyle,
  pyflakes,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "flake8";
  version = "7.1.0";

  disabled = pythonOlder "3.8";

  pyproject = true;

  src = fetchFromGitHub {
    owner = "PyCQA";
    repo = "flake8";
    rev = version;
    hash = "sha256-jkRr/k/XjiKOkcd4jlOQTnnFun7/hMHdVUWBlS1QZ1E=";
  };

  nativeBuildInputs = [ setuptools ];

  propagatedBuildInputs = [
    mccabe
    pycodestyle
    pyflakes
  ];

  nativeCheckInputs = [ pytestCheckHook ];

  meta = with lib; {
    description = "Modular source code checker: pep8, pyflakes and co";
    homepage = "https://github.com/PyCQA/flake8";
    license = licenses.mit;
    maintainers = with maintainers; [ dotlambda ];
    mainProgram = "flake8";
  };
}
