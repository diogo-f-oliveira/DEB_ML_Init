function [data, auxData, metaData, txtData, weights] = mydata_Rana_muscosa

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Ranidae';
metaData.species    = 'Rana_muscosa'; 
metaData.species_en = 'Mountain yellow-legged frog'; 

metaData.ecoCode.climate = {'Dsb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf', 'jiTg'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjO', 'jiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author     = {'Bas Kooijman'};    
metaData.date_subm  = [2019 05 23];              
metaData.email      = {'bas.kooijman@vu.nl'};            
metaData.address    = {'VU University, Amsterdam'};   

metaData.curator    = {'Starrlight Augustine'};
metaData.email_cur  = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc   = [2019 05 23]; 


%% set data
% zero-variate data

data.ab = 20;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'amphibiaweb';   
  temp.ab = C2K(7);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tj = 2.5*365;  units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'amphibiaweb';
  temp.tj = C2K(7);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 4*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'MattMiau2007';
  temp.tp = C2K(7);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 14*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'MattMiau2007';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 4;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females';   bibkey.Lp  = 'MattMiau2007';
data.Lpm  = 4;    units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males';   bibkey.Lpm  = 'MattMiau2007';
data.Li  = 6.8;    units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'MattMiau2007';
data.Lim  = 5.9;    units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'MattMiau2007';

data.Wwb = 0.0042;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'guess based on Anaxyrus americanus';
data.Wwp = 7;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';     bibkey.Wwp = 'MattMiau2007';
data.Wwi = 76;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'MattMiau2007';
data.Wwim = 40;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'MattMiau2007';

data.Ri  = 233/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'amphibiaweb';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '233 eggs per clutch, assumed: 1 clutch per yr';
  
% univariate data
% time-length data
data.tL_f = [ ... % time since puberty (yr), SVL (cm)
0.455	5.419
0.504	4.287
1.447	5.214
1.463	7.133
1.463	7.222
1.480	4.019
1.480	4.934
1.480	5.087
1.480	5.989
1.480	6.294
2.488	6.687
2.488	6.585
2.488	5.022
2.504	7.017
2.504	6.013
3.496	5.211
3.496	5.300
3.496	5.541
3.496	5.592
3.496	6.584
3.496	6.978
3.496	8.007
4.488	8.679
4.488	7.713
4.488	5.400
4.504	7.192
4.504	7.141
4.504	7.078
4.504	6.823
4.520	6.734
4.537	7.815
5.447	5.729
5.463	5.907
5.463	6.034
5.480	7.623
5.480	7.686
5.496	6.987
5.496	8.093
5.496	8.195
5.512	7.191
5.512	7.877
6.488	7.863
6.488	5.625
6.488	5.816
6.488	6.045
6.504	7.316
6.504	6.617
6.520	6.769
7.496	6.259
7.496	6.463
7.496	7.009
7.512	7.467
7.512	7.543
7.512	8.026
8.504	5.889
8.504	6.258
8.504	6.309
8.504	6.385
8.504	6.766
10.504	5.695];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr since birth to d since puberty
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since puberty', 'SVL', 'female'};  
temp.tL_f   = C2K(15);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MattMiau2007';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since puberty (yr), SVL (cm)
0.472	4.783
1.463	4.502
1.480	5.519
1.480	5.633
2.488	4.208
2.504	5.924
2.520	4.386
2.520	4.716
2.520	5.822
2.537	4.513
3.496	4.499
3.496	4.702
3.496	5.084
3.496	5.923
3.496	5.706
3.496	6.126
3.496	6.228
3.512	6.825
4.472	6.735
4.504	5.565
4.520	5.997
5.447	6.123
5.463	5.983
5.480	6.491
5.480	6.237
5.496	5.856
6.488	5.905
6.488	5.714
6.488	5.435
6.488	4.990
6.504	6.070
7.463	5.840
7.480	5.509
7.496	6.717
8.455	5.228];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr since birth to d since puberty
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since puberty', 'SVL', 'male'};  
temp.tL_m   = C2K(15);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MattMiau2007';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 2 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Breeding start directly after snow melts';
metaData.bibkey.F1 = 'MattMiau2007'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4RDZ6'; % Cat of Life
metaData.links.id_ITIS = '1101291'; % ITIS
metaData.links.id_EoL = '1019248'; % Ency of Life
metaData.links.id_Wiki = 'Rana_muscosa'; % Wikipedia
metaData.links.id_ADW = 'Rana_muscosa'; % ADW
metaData.links.id_Taxo = '145954'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Rana+muscosa'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rana_muscosa}}';
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
bibkey = 'MattMiau2007'; type = 'Article'; bib = [ ... 
'author = {Kathleen R. Matthews and Claude Miaud}, ' ... 
'year = {2007}, ' ...
'title = {A Skeletochronological Study of the Age Structure, Growth, and Longevity of the Mountain Yellow-legged Frog, \emph{Rana muscosa}, in the {S}ierra {N}evada, {C}alifornia}, ' ...
'journal = {Copeia}, ' ...
'volume = {2007(4)}, ' ...
'pages = {986-993}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Rana+muscosa}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

