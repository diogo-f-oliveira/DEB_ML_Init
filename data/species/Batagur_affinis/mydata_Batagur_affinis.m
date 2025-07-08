function [data, auxData, metaData, txtData, weights] = mydata_Batagur_affinis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Geoemydidae';
metaData.species    = 'Batagur_affinis'; 
metaData.species_en = 'Southern river terrapin'; 

metaData.ecoCode.climate = {'Am', 'Aw'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0bTd', 'biFm', 'biFp'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bpCi', 'biH'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 't-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 05 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 05 08];

%% set data
% zero-variate data

data.ab = 121;     units.ab = 'd';    label.ab = 'age at birth';      bibkey.ab = 'MollPlatt2015';
  temp.ab = C2K(29);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '119 till 123 d';
data.tp = 25*365;     units.tp = 'd';    label.tp = 'time since birth at puberty';      bibkey.tp = 'MollPlatt2015';
  temp.tp = C2K(24);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 40*365;     units.am = 'd';    label.am = 'life span';                   bibkey.am = 'guess';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 6.61;  units.Lb = 'cm';   label.Lb = 'carapace length at birth';   bibkey.Lb = 'MollPlatt2015';
  comment.Lb = 'from Terengganu River; Perak River 5.65 cm';
data.Lp = 45;  units.Lp = 'cm';   label.Lp = 'carapace length at puberty';   bibkey.Lp = 'MollPlatt2015';
data.Li = 62.5;  units.Li = 'cm';   label.Li = 'ultimate carapace length for female';   bibkey.Li = 'MollPlatt2015';

data.Ww0 = 62.1; units.Ww0 = 'g';   label.Ww0 = 'initial wet weigh';                bibkey.Ww0 = 'HairShah2014';
data.Wwb = 48.5; units.Wwb = 'g';   label.Wwb = 'wet weigh at birth';                bibkey.Wwb = 'MollPlatt2015';
  comment.Wwb = 'from Terengganu River; Perak River 2.63 g';
data.Wwi = 37e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';    bibkey.Wwi = 'MollPlatt2015';

data.Ri  = 2*11/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';            bibkey.Ri  = 'MollPlatt2015';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3-19 eggs/clutch; 2 clutches per yr';

% uni-variate data

% time-length
data.tL = [ ... % time  since birth (d), length of carapace (cm)
     7 6.662
    21 6.989
    35 7.515
    49 7.763];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'carapace length'};  
temp.tL    = C2K(24);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HairShah2014';
comment.tL = 'Data from Wildlife Conservation Center at Bota Kanan, Perak';

% time-weight
data.tWw = [ ... % time  since birth (d), weight (g)
     7 49.61
    21 55.6
    35 70.23
    49 77.57];
units.tWw   = {'d', 'g'};  label.tWw = {'time since birth', 'weight'};  
temp.tWw    = C2K(24);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'HairShah2014';
comment.tWw = 'Data from Wildlife Conservation Center at Bota Kanan, Perak';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; units.psd.k = '-'; label.psd.k = 'maintenance ratio';
weights.psd.k = 5 * weights.psd.k_J; weights.psd.k_J = 0;
%weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = 'KVXC'; % Cat of Life
metaData.links.id_ITIS = '949143'; % ITIS
metaData.links.id_EoL = '12116614'; % Ency of Life
metaData.links.id_Wiki = 'Batagur_affinis'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3916358'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Batagur&species=affinis'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Batagur_affinis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HairShah2014'; type = 'Article'; bib = [ ... 
'author = {Hairul, M.S. and Shahrul Anuar, M.S.}, ' ... 
'year = {2014}, ' ...
'title = {DEVELOPMENTAL STAGES OF SOUTHERN RIVER TERRAPIN (\emph{Batagur affinis}) IN WILDLIFE CONVERSATION CENTER {B}OTA {K}ANAN, {P}ERAK, {M}ALAYSIA}, ' ...
'journal = {Journal of Wildlife and Parks}, ' ...
'volume = {28}, ' ...
'pages = {1-7}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MollPlatt2015'; type = 'techreport'; bib = [ ... 
'author = {Edward O. Moll and Steven G. Platt and Eng Heng Chan and Brian D. Horne and Kalyar Platt and Peter Praschag and Pelf Nyok Chen and Peter Paul van Dijk}, ' ... 
'year = {2015}, ' ...
'title = {\emph{Batagur affinis} ({C}antor 1847) - {S}outhern {R}iver {T}errapin, {T}untong}, ' ...
'institution = {Chelonian Research Foundation}, ' ...
'volume = {5}, ' ...
'doi = {10.3854/crm.5.090.affinis.v1.2015}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

