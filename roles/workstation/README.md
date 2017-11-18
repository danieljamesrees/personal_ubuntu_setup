## Requirements

- As Hibernate doesn't work on my PC with Ubuntu, I want to use a virtual desktop image with as low an overhead as possible. So I'll use Docker with checkpoint and volumes, not commits (as that updates the image with the disk state, not the memory state) or save (as that makes a backup copy of the image).

- Restarting the consoles/terminals and Firefox isn't too time consuming and doesn't have much state I want to keep, but not immediately write to disk, hence they can be run locally. The image only really needs to include Eclipse/PyCharm and Atom, and the development tools (compilers etc.), and the snapshot state also includes the codebase and various caches, but still shouldn't be too massive (it's currently < 100 MB, instead of a typical workstation disk size of around 500 GB, though the allocated disk space is 400 GB).

- Theoretically, the more work that is done via the Dockerfile, the greater than caching benefits when building the Docker image. However, I don't care about image build times, only restore/load times. So, I want most of my setup logic performed post-build using Ansible, which should produce a thinner base image, with all of the state being kept in the snapshot/commit. I could move Ansible work to the Dockerfile and build a new image whenever this changes, but I'd rather have a thinner image and the flexibility of using Ansible (as I can share/move logic between the container and local workstation).

- Hence, just setup the base Ansible installation via the Dockerfile and use Ansible thereafter.

- Any VM activity is managed by Ansible, unless I'm testing a specific CM tool.

- All local container testing runs on Docker.
- All local VM testing runs run on VirtualBox VMS provisioned using Vagrant and runs on Ubuntu.
- All AWS testing runs on t2.micro instances hosting Amazon Linux (or if unsupported then Ubuntu if not significantly dearer than SLES or RHEL) - use the Free Tier then On-Demand EC2, and spin-up/spin-down.

- My development setup should use Atlassian/github tools, not Jenkins for my own CI. They can probably be in a separate container.

- To lock/record packages versions, apt-get update will update all packages, even those I'm not specifically using, so only a full mirror will make sure I get a completely replicable system (or using DebMarsh/Satellite to allow staging) - see <https://help.ubuntu.com/community/AptGet/Offline/Repository>, e.g. [dak](https://wiki.debian.org/DebianRepository/Setup#local-apt-repository). Just storing the specific packages needed on top of the base image can be doing using a local repo - see <https://help.ubuntu.com/community/Repositories/Personal>/<https://www.linux.com/learn/create-your-own-local-apt-repository-avoid-dependency-hell>. To make sure this repository is prioritised, see <https://askubuntu.com/questions/135339/assign-highest-priority-to-my-local-repository>. The best interim solution is probably to create a local repo with the whole contents of /var/cache/apt/archives (or to just back that up), plus any random packages - see <https://unix.stackexchange.com/a/305099>.

- Images can be built in a compressed fashion using the experimental --squash option (not exposed via Ansible yet). Just add the following to /etc/docker/daemon.json:

{
  "experimental": true,
}
