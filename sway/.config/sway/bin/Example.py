#!/usr/bin/env python3

# https://i3ipc-python.readthedocs.io/en/latest/index.html

from i3ipc.aio import Connection

sway = await Connection()

workspaces = await sway.get_workspaces()
outputs = await sway.get_outputs()

print(workspaces)
quit()

for workspace in workspaces:
    print(f'workspace: {workspace.name}')

for output in outputs:
    print(f'output: {output.name}')

# get_tree() returns the root container
tree = sway.get_tree()

# get some information about the focused window
focused = tree.find_focused()
print(f'Focused window: {focused.name}')
workspace = focused.workspace()
print(f'Focused workspace: {workspace.name}')

# focus firefox and set it to fullscreen mode
ff = tree.find_classed('Firefox')[0]
ff.command('focus')
ff.command('fullscreen')

# iterate through all the container windows (or use tree.leaves() for just
# application windows)
for container in workspace:
    print(f'On the focused workspace: {container.name}')


