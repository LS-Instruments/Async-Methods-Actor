<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="23008000">
	<Property Name="CCSymbols" Type="Str">AF_Debug_Trace,TRUE;</Property>
	<Property Name="NI.LV.All.SaveVersion" Type="Str">23.0</Property>
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">true</Property>
	<Property Name="NI.Project.Description" Type="Str"></Property>
	<Property Name="NI.Project.SaveVersion" Type="Str">Editor version</Property>
	<Item Name="My Computer" Type="My Computer">
		<Property Name="NI.SortType" Type="Int">3</Property>
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="Example" Type="Folder">
			<Item Name="Async Methods Actor Example.lvlib" Type="Library" URL="../Async Methods Actor Example/Async Methods Actor Example.lvlib"/>
		</Item>
		<Item Name="VIPM" Type="Folder">
			<Item Name="Async Methods Actor.vipb" Type="Document" URL="../Async Methods Actor.vipb"/>
			<Item Name="Async Methods Actor.vipc" Type="Document" URL="../Async Methods Actor.vipc"/>
		</Item>
		<Item Name="Project Provider" Type="Folder">
			<Item Name="GProviders" Type="Folder">
				<Item Name="AddAsyncMethodsActor.ini" Type="Document" URL="../Providers/GProviders/AddAsyncMethodsActor.ini"/>
			</Item>
			<Item Name="Install Support" Type="Folder">
				<Item Name="AMAFPP Pre-Install Custom Action.vi" Type="VI" URL="../Providers/Install Support/AMAFPP Pre-Install Custom Action.vi"/>
				<Item Name="AMAPP Post-Uninstall Custom Action.vi" Type="VI" URL="../Providers/Install Support/AMAPP Post-Uninstall Custom Action.vi"/>
			</Item>
			<Item Name="Add Async Methods Actor.lvlib" Type="Library" URL="../Providers/AddAsyncMethodsActor/Add Async Methods Actor.lvlib"/>
			<Item Name="AFPP Shared.lvlib" Type="Library" URL="../Providers/AddAsyncMethodsActor/AFPP Shared/AFPP Shared.lvlib"/>
		</Item>
		<Item Name="Async Methods Actor.lvlib" Type="Library" URL="../Async Methods Actor/Async Methods Actor.lvlib"/>
		<Item Name="README.md" Type="Document" URL="../README.md"/>
		<Item Name="CHANGELOG.md" Type="Document" URL="../CHANGELOG.md"/>
		<Item Name="Dependencies" Type="Dependencies"/>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
