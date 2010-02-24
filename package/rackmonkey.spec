Summary: RackMonkey is a web-based tool for managing racks of equipment such as web servers, video encoders, routers and storage devices.
Name: rackmonkey
Version: 1.2.5
Release: 1
License: GPL
Group: System/Tools
URL: http://flux.org.uk/projects/rackmonkey/
Source0: %{name}-%{version}-%{release}.tar.gz
Patch0: httpd-config.patch
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-buildroot

Provides: perl(RackMonkey::Engine) 

%if 0%{?fedora} || 0%{?rhel} >= 5
BuildArch:      noarch
%endif

%description
RackMonkey is a web-based tool for managing racks of equipment such as web servers, video encoders, routers and storage devices. Using a simple interface you can keep track of what's where, which OS it runs, when it was purchased, who it belongs and what it's used for. No more searching for spreadsheets or scribbled notes when you need to find a server: RackMonkey can quickly find any device and draw a rack diagram of its location. RackMonkey is free and open source (licensed under the GPL). 

%prep
%setup -q -n %{name}-%{version}-%{release}
%patch0 -p1

%build

%install
rm -rf $RPM_BUILD_ROOT
# html 
mkdir -p $RPM_BUILD_ROOT/%{_localstatedir}/www/rackmonkey
cp $RPM_BUILD_DIR/%{name}-%{version}-%{release}/perl/rackmonkey.pl $RPM_BUILD_ROOT%{_localstatedir}/www/rackmonkey/
cp -r $RPM_BUILD_DIR/%{name}-%{version}-%{release}/perl/RackMonkey $RPM_BUILD_ROOT%{_localstatedir}/www/rackmonkey/
cp $RPM_BUILD_DIR/%{name}-%{version}-%{release}/perl/rack2xls.pl $RPM_BUILD_ROOT%{_localstatedir}/www/rackmonkey
cp $RPM_BUILD_DIR/%{name}-%{version}-%{release}/perl/rackdns.pl $RPM_BUILD_ROOT%{_localstatedir}/www/rackmonkey
cp -r $RPM_BUILD_DIR/%{name}-%{version}-%{release}/www/* $RPM_BUILD_ROOT%{_localstatedir}/www/rackmonkey
chmod 755 $RPM_BUILD_ROOT%{_localstatedir}/www/rackmonkey/*.pl

# lib
mkdir -p $RPM_BUILD_ROOT%{_localstatedir}/lib/rackmonkey
cp -r $RPM_BUILD_DIR/%{name}-%{version}-%{release}/tmpl $RPM_BUILD_ROOT%{_localstatedir}/lib/rackmonkey

# etc
mkdir -p $RPM_BUILD_ROOT%{_sysconfdir}/rackmonkey/
cp $RPM_BUILD_DIR/%{name}-%{version}-%{release}/conf/rackmonkey.conf-default $RPM_BUILD_ROOT%{_sysconfdir}/rackmonkey/rackmonkey.conf

# httpd config
mkdir -p $RPM_BUILD_ROOT%{_sysconfdir}/httpd/conf.d/
cp $RPM_BUILD_DIR/%{name}-%{version}-%{release}/conf/httpd-rackmonkey.conf $RPM_BUILD_ROOT%{_sysconfdir}/httpd/conf.d/rackmonkey.conf


%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root,-)
%config(noreplace) %{_sysconfdir}/rackmonkey/rackmonkey.conf
%config(noreplace) %{_sysconfdir}/httpd/conf.d/rackmonkey.conf
%{_localstatedir}/lib/rackmonkey/*
%{_localstatedir}/www/rackmonkey/*
%doc doc/* sql/*

%changelog
* Wed Feb 24 2010 Chris MacLeod <cmacleod@redhat.com> 
- Initial build.

