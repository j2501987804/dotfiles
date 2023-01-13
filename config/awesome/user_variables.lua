return {
	widget = {
		weather = {
			--- API Key
			key = " ",
			--- Coordinates
			coordinates = {
				"122.62916", --- lat
				"23.89155", --- lon
			},
		},

		--- Github activity
		github = {
			username = "j2501987804",
		},

		--- Microphone 
		-- pamixer --list-sources | grep input
		mic = {
			name = "alsa_input.pci-0000_00_1f.3.analog-stereo.3",
		},

		--- Disk for Top-panel
		disk = {
			name = "/dev/sda3",
		},
	},
}
