          echo 1. what is in the direcdtopry?
          ls -a
          echo
          echo 2. Is Java installed?
          java -version
          echo
          echo 3. is git installed?
          git --version
          echo
          echo 4. what about build tools?
          mvn --version
          gradle --version
          ant -version
          echo
          echo 5. is docker installed?
          docker --version
          echo
          echo 6. where is the Andrroid SDK Root?
          echo $ANDROID_SDK_ROOT
          echo
          echo 7. what is the workspace location
          echo $RUNNER_WORKSPACE
          echo
          echo 8. who is running the script?
          whoami
          echo
          echo 9. how is the disk laid out?
          df
          echo 10. what environment variables are available?
          env
