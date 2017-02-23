# Debian fakeroot utility mod for user-namespace environments.

All modifications to original project located at "user-ns" branch. "master" branch only contains code from original fakeroot debian repository: https://anonscm.debian.org/git/users/clint/fakeroot.git

This particular tool should be used only in "user-namespace" like environments, in scenarios when original fakeroot utility fails. Modifications to source code just tries to ignore some errors caused by tight restrictions of such environments and may cause unexpected behavior in some cases.

All modifications belongs to it's authors in terms of GPLv3 license. See AUTHORS and COPYING files for more details.
