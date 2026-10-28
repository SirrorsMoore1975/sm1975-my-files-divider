# sm1975-my-files-divider
sub divide files into sub directory using shell script

## Instruction to install BATS 

- Create the necessary folders for your `test`, `src` and `bin` folders at the project directory.
- execute the following commands:


```console 
git submodule add https://github.com/bats-core/bats-core.git test/bats
git submodule add https://github.com/bats-core/bats-support.git test/test_helper/bats-support
git submodule add https://github.com/bats-core/bats-assert.git test/test_helper/bats-assert
``` 


- create `script_test.bats` in the `test` directory.
- setup the `script_test.bats` similar to the following: 

```bash
#!/usr/bin/env bats
setup(){
  DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )" 
  PATH="$DIR/../src:$PATH"
}
@test "can run our scripts" {
  scripts.sh 
}
```

- create the `scripts.sh` if it is not already created and provide it with the executable permission: 

```bash
touch src/scripts.sh 
echo '#!/usr/bin/env bash' > src/scripts.sh 
chmod a+x src/scripts.sh 
```

- Run the test using the following command: 

```bash
./test/bats/bin/bats test/script_test.bats 
```

## Preferences

- Baeldung: Linux [testing bash scripts with bats](https://www.baeldung.com/linux/testing-bash-scripts-bats) 
- Tim Perry: [Testing Your Shell Scripts with Bats](https://medium.com/@pimterry/testing-your-shell-scripts-with-bats-abfca9bdc5b9)  
- bats-core: [bats-core Tutorial](https://bats-core.readthedocs.io/en/stable/tutorial.html) 

