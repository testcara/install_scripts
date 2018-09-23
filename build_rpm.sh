# step 1: install rpm-build
yum install rpm-build
# step 2: create the build hierachy
mkdir -p /root/rpmbuild
cd /root/rpmbuild/
mkdir BUILD BUILDROOT RPMS  SOURCES SPECS SRPMS
# step 3: download the source
cd /root/rpmbuild/SOURCES/
wget http://downloads.xiph.org/releases/icecast/icecast-2.3.3.tar.gz
# step 4: create the spec
cd /root/rpmbuild/SPECS
echo 
'
Name:           icecast
Version:        2.3.3
Release:        0
Summary:        Xiph Streaming media server that supports multiple formats.
Group:          Applications/Multimedia
License:        GPL
URL:            http://www.icecast.org/
Vendor:         Xiph.org Foundation team@icecast.org
Source:         http://downloads.us.xiph.org/releases/icecast/%{name}-%{version}.tar.gz
Prefix:         %{_prefix}
Packager: 	Karthik
BuildRoot:      %{_tmppath}/%{name}-root

%description
Icecast is a streaming media server which currently supports Ogg Vorbis
and MP3 audio streams. It can be used to create an Internet radio
station or a privately running jukebox and many things in between.
It is very versatile in that new formats can be added relatively
easily and supports open standards for commuincation and interaction.

%prep
%setup -q -n %{name}-%{version}

%build
CFLAGS="$RPM_OPT_FLAGS" ./configure --prefix=%{_prefix} --mandir=%{_mandir} --sysconfdir=/etc

make

%install
[ "$RPM_BUILD_ROOT" != "/" ] && rm -rf $RPM_BUILD_ROOT

make DESTDIR=$RPM_BUILD_ROOT install
rm -rf $RPM_BUILD_ROOT%{_datadir}/doc/%{name}

%clean
[ "$RPM_BUILD_ROOT" != "/" ] && rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root)
%doc README AUTHORS COPYING NEWS TODO ChangeLog
%doc doc/*.html
%doc doc/*.jpg
%doc doc/*.csshe 
%config(noreplace) /etc/%{name}.xml
%{_bindir}/icecastt
%{_prefix}/share/icecast/*

%changelog
' > icecast.spec
# step 5: rpmbuild build the spec
rpmbuild -ba icecast.spec

# if you meet errors, you can check the following steps
# yum install libxstl-devel
# wget http://vault.centos.org/7.5.1804/os/SRPMS/libxslt-1.1.28-5.el7.src.rpm
# yum install libxstl
# wget http://rpmfind.net/linux/centos/7.5.1804/os/x86_64/Packages/libxslt-devel-1.1.28-5.el7.x86_64.rpm
# yum install libxslt-devel-1.1.28-5.el7.x86_64.rpm

# step 6: check the rpm
tree
# step 7: install the rpm
cd /root/rpmbuild/RPMS/x86_64/
yum localinstall icecast-2.3.3-0.x86_64.rpm
rpm qa ice-cast
