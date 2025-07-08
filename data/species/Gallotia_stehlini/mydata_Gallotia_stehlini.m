function [data, auxData, metaData, txtData, weights] = mydata_Gallotia_stehlini

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Lacertidae';
metaData.species    = 'Gallotia_stehlini'; 
metaData.species_en = 'Gran Canaria giant lizard'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTg'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Urtzi Enriquez-Urzelai'};    
metaData.date_subm = [2021 05 22];              
metaData.email    = {'urtzi.enriquez@gmail.com'};            
metaData.address  = {'Czech Academy of Sciences'};   

metaData.curator     = {'Nina Marn'};
metaData.email_cur   = {'nina.marn@gmail.com'}; 
metaData.date_acc    = [2021 06 02];

%% set data
% zero-variate data

data.ab = 56;  units.ab = 'd';    label.ab = 'age at birth';         bibkey.ab = 'guess';   
  temp.ab = C2K(24); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Lacerta agilis';
data.tp = 35*30;     units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'MoliRodr2004';
  temp.tp = C2K(24); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '35 months according to MolinaRodriguez2004';
data.am = 145*30;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'MoliRodr2004';   
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = '145 months according to MolinaRodriguez2004';

data.Lb  = 5.21;    units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';      bibkey.Lb  = 'MoliRodr2004';  
data.Lp  = 13.5;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';      bibkey.Lp  = 'MoliRodr2004';  
data.Lpm  = 14.6;    units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty males';      bibkey.Lpm  = 'MoliRodr2004';  
data.Li  = 17;     units.Li  = 'cm';  label.Li  = 'ultimate SVL';         bibkey.Li  = 'MoliRodr2004';  
data.Lim  = 22;     units.Lim  = 'cm';  label.Lim  = 'ultimate SVL males';         bibkey.Lim  = 'MoliRodr2004';  

data.Wwb = 2.12;   units.Wwb = 'g';  label.Wwb = 'wet weight of hatchlings'; bibkey.Wwb = 'MoliRodr2004';
  comment.Wwb = 'Body mass of hatchlings';
data.Wwi = 88;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'Rive2016';
  comment.Wwi = 'Mean body mass for Tasartico population';
data.Wwim = 94.59;   units.Wwim = 'g';  label.Wwim = 'ultimate wet males'; bibkey.Wwim = 'Rive2016';
  comment.Wwim = 'Mean body mass of males for Tasartico population';

data.Ri  = 9.8/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'MoliRodr2004';   
  temp.Ri = C2K(24);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'one clutch per year';

% univariate data
% t-L data
data.tL = [ ... % time since birth (d), SVL (mm)
730	89.78
730	93.661
730	109.767
730	113.454
1095	89.78
1095	93.855
1095	108.603
1095	108.603
1460	93.855
1460	104.722
1460	118.887
1460	118.887
1460	119.276
1460	133.053
1825	114.036
1825	114.036
1825	123.545
1825	123.545
1825	128.008
1825	128.008
1825	128.008
1825	128.008
1825	132.859
1825	132.859
1825	142.755
1825	192.238
2190	118.887
2190	118.887
2190	133.441
2190	133.441
2190	133.441
2190	137.71
2190	137.71
2190	137.71
2190	148.189
2555	137.516
2555	157.503
2920	122.962
2920	122.962
2920	137.516
2920	142.367
2920	147.219
2920	147.219
3285	122.962
3285	142.367
3285	167.4
3285	191.85];
data.tL(:,2) = data.tL(:,2) / 10; % convert mm to cm
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'SVL', 'female'};  
temp.tL   = C2K(19);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CastBaez1991';
comment.tL = 'Data for females';

% t-L data for males
data.tLm = [ ... % time since birth (d), SVL (mm)
730	89.78
730	93.855
730	93.855
730	104.722
730	104.722
1095	93.855
1095	104.722
1095	104.722
1095	104.722
1460	104.722
1460	114.23
1460	114.23
1460	118.887
1460	123.351
1460	123.351
1460	127.814
1460	138.292
1460	138.292
1825	104.722
1825	104.722
1825	114.23
1825	118.499
1825	118.499
1825	123.157
1825	123.157
1825	128.202
1825	128.202
1825	162.549
2190	123.157
2190	133.441
2190	137.71
2555	118.887
2555	137.516
2555	142.367
2555	142.367
2920	208.538];
data.tLm(:,2) = data.tLm(:,2) / 10; % convert mm to cm
units.tLm  = {'d', 'cm'};  label.tLm = {'time since birth', 'SVL', 'male'};  
temp.tLm   = C2K(19);  units.temp.tLm = 'K'; label.temp.tLm = 'temperature';
bibkey.tLm = 'CastBaez1991';
comment.tLm = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0.5 * weights.ab; % because it is approximated using another sp

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL','tLm'}; subtitle1 = {'Data for females and males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'One of the giant Gallotia species (also G. intermedia, G. simonyi)';
metaData.bibkey.F1 = {'MoliRodr2004'};
metaData.facts = struct('F1',F1);

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp';
D2 = 'Temperatures are guessed';
D3 = 'Compared to other Gallotia and generally reptiles (k around 0.7), maintenance ratio is relatively high with k = 0.937.' ;
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Links
metaData.links.id_CoL = '3F6ZR'; % Cat of Life
metaData.links.id_ITIS = '1155279'; % ITIS
metaData.links.id_EoL = '794629'; % Ency of Life
metaData.links.id_Wiki = 'Gallotia_stehlini'; % Wikipedia
metaData.links.id_ADW = 'Gallotia_stehlini'; % ADW
metaData.links.id_Taxo = '642478'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Gallotia&species=stehlini'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
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
bibkey = 'CastBaez1991'; type = 'Article'; bib = [ ... 
'author = {J. Castanet and M. Baez}, ' ... 
'year = {1991}, ' ...
'title = {Adaptation and evolution in {G}allotia lizards from the {C}anary {I}slands: age, growth, maturity and longevity}, ' ...
'journal = {Amphibia-Reptilia}, ' ...
'volume = {12}, ' ...
'pages = {81-102}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MoliRodr2004'; type = 'Article'; bib = [ ... 
'author = {M. Molina-Borja and M.A. Rodriguez-Dominguez}, ' ... 
'year = {2004}, ' ...
'title = {Evolution of biometric and life-history traits in lizards ({G}allotia) from the {C}anary {I}slands}, ' ...
'journal = {J. Zool. Syst. Evol. Research}, ' ...
'volume = {42}, ' ...
'pages = {44-53}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Rive2016'; type = 'Article'; bib = [ ... 
'author = {C. Rivero Suarez and M.A. Rodriguez-Dominguez and M. Molina-Borja}, ' ... 
'year = {2016}, ' ...
'title = {Sexual dimorphism in morphological traits and scaling relationships in two populations of {G}allotia stehlini (Fam. {L}acertidae: {S}quamata) from {G}ran {C}anaria}, ' ...
'journal = {African Journal of Herpetology}, ' ...
'volume = {65}, ' ...
'pages = {1-20}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

