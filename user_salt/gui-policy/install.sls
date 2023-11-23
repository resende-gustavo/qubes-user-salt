gui-domain-rpc:
  file.managed:
    - name: /etc/qubes/policy.d/10-user-gui-domain.policy
    - contents: |
        admin.vm.device.mic.Attach				*			sys-gui			dom0			allow	target=dom0
        admin.vm.device.mic.Available			*			sys-gui			dom0			allow	target=dom0
        admin.vm.device.mic.Detach				*			sys-gui			dom0			allow	target=dom0
        admin.vm.device.mic.List				*			sys-gui			dom0			allow	target=dom0
        admin.vm.device.mic.Set.persistent		*			sys-gui			dom0			allow	target=dom0
        admin.vm.device.block.Attach			*			sys-gui			dom0			allow	target=dom0
        admin.vm.device.block.Available			*			sys-gui			dom0			allow	target=dom0
        admin.vm.device.block.Detach			*			sys-gui			dom0			allow	target=dom0
        admin.vm.device.block.List				*			sys-gui			dom0			allow	target=dom0
        admin.vm.device.block.Set.persistent	*			sys-gui			dom0			allow	target=dom0
        admin.vm.device.mic.Attach				*			sys-gui-gpu		dom0			allow	target=dom0
        admin.vm.device.mic.Available			*			sys-gui-gpu		dom0			allow	target=dom0
        admin.vm.device.mic.Detach				*			sys-gui-gpu		dom0			allow	target=dom0
        admin.vm.device.mic.List				*			sys-gui-gpu		dom0			allow	target=dom0
        admin.vm.device.mic.Set.persistent		*			sys-gui-gpu		dom0			allow	target=dom0
        admin.vm.device.block.Attach			*			sys-gui-gpu		dom0			allow	target=dom0
        admin.vm.device.block.Available			*			sys-gui-gpu		dom0			allow	target=dom0
        admin.vm.device.block.Detach			*			sys-gui-gpu		dom0			allow	target=dom0
        admin.vm.device.block.List				*			sys-gui-gpu		dom0			allow	target=dom0
        admin.vm.device.block.Set.persistent	*			sys-gui-gpu		dom0			allow	target=dom0
