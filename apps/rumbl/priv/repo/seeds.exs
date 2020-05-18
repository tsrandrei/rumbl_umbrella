# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Rumbl.Repo.insert!(%Rumbl.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Rumbl.Multimedia
alias Rumbl.Accounts


for category <- ~w(Action Drama Romance Comedy Sci-fi) do
  Multimedia.create_category!(category)
end

default_users = [
	%{
		name: "tsrandrei",
		username: "tsrandrei",
		password: "password",	
	},
	%{
		name: "Jose V.",
		username: "josev",
		password: "josevpassword",	
	},
	%{
		name: "Bruce T.",
		username: "brucet",
		password: "brucetpassword",	
	},
	%{
		name: "Chris Mc",
		username: "chrismc",
		password: "chrismcpassword",	
	},
]

default_videos = [
	%{
		title: "GOTO 2018 A Guide for the Perplexed Joe Armstrong",
		url: "https://www.youtube.com/watch?v=rmueBVrLKcY",
		description: "This presentation was recorded at GOTO Chicago 2018. #gotocon #gotochgo http://gotochgo.com"
		},
	%{
		title: "GOTO 2018 A Guide for the Perplexed Joe Armstrong",
		url: "https://www.youtube.com/watch?v=rmueBVrLKcY",
		description: "This presentation was recorded at GOTO Chicago 2018. #gotocon #gotochgo http://gotochgo.com"
		},
	%{
		title: "GOTO 2018 A Guide for the Perplexed Joe Armstrong",
		url: "https://www.youtube.com/watch?v=rmueBVrLKcY",
		description: "This presentation was recorded at GOTO Chicago 2018. #gotocon #gotochgo http://gotochgo.com"
		},
	%{
		title: "GOTO 2018 A Guide for the Perplexed Joe Armstrong",
		url: "https://www.youtube.com/watch?v=rmueBVrLKcY",
		description: "This presentation was recorded at GOTO Chicago 2018. #gotocon #gotochgo http://gotochgo.com"
		},
	%{
		title: "GOTO 2018 A Guide for the Perplexed Joe Armstrong",
		url: "https://www.youtube.com/watch?v=rmueBVrLKcY",
		description: "This presentation was recorded at GOTO Chicago 2018. #gotocon #gotochgo http://gotochgo.com"		
		},
]
for user <- default_users do
	Accounts.register_user(user)
end

Enum.map(default_videos, fn video -> Multimedia.create_video(Accounts.get_user_by(%{username: "tsrandrei"}), video) end)
