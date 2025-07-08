function [data, auxData, metaData, txtData, weights] = mydata_Calotriton_asper

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Salamandridae';
metaData.species    = 'Calotriton_asper'; 
metaData.species_en = 'Pyrenean brook salamander';

metaData.ecoCode.climate = {'ET'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFc'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab_T'; 'aj_T'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 21];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 08];

%% set data
% zero-variate data;
data.ab = 37.6;      units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'amphibiaweb';
  temp.ab = C2K(10); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 415;       units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'amphibiaweb';
  temp.tj = C2K(10); units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 4*365;     units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'amphibiaweb';
  temp.tp = C2K(10); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '2 yrs at 1000 m alt at 17.5 C';
data.tpm = 2.75*365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'amphibiaweb';
  temp.tpm = C2K(10); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
  comment.tpm = '2.5-3 yr';
data.am = 26*365;    units.am = 'd';    label.am = 'life span';                   bibkey.am = 'AnAge';   
  temp.am = C2K(10); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lj = 1.13;      units.Lj = 'cm';   label.Lj = 'SVL at metam';  bibkey.Lj = 'guess';
  comment.Lj = 'converted from TL 20 to 35 mm, using F1';
data.Lp = 4.8;       units.Lp = 'cm';   label.Lp = 'SVL at puberty';  bibkey.Lp = {'amphibiaweb','Mont1990'};
  comment.Lp = 'based no tL_f data at tj';
data.Li = 7.5;      units.Li = 'cm';   label.Li = 'ultimate SVL for females';  bibkey.Li = 'Mont1990';
data.Lim = 7.7;     units.Lim = 'cm';   label.Lim = 'ultimate SVL for males';  bibkey.Lim = 'Mont1990';

data.Wwb = 0.0402;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'amphibiaweb';
  comment.Wwb = 'based on egg diameter of 3.5-5 mm: pi/6*0.425^3'; 
data.Wwp = 3.67;     units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'guess';
  comment.Wwp = 'based on (Lp/Li)^3*Wwi: 14*(4.8/7.5)^3';
data.Wwi = 14.0;      units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Euproctus_platycephalus';
data.Wwim = 15.2;     units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'guess';
  comment.Wwim = 'based on Euproctus_platycephalus 5.1*(7.7/5.35)^3';

data.Ri  = 25/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'amphibiaweb';   
  temp.Ri = C2K(10); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '20-30 eggs per clutch, 1 clutch per yr';
  
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (d), SVL (cm)
0.747	2.413
0.914	2.949
0.914	2.805
1.415	3.939
1.668	3.941
2.761	4.501
3.519	4.793
3.771	4.897
4.443	5.517
4.570	5.291
5.287	5.253
8.699	5.905
8.908	6.215
8.993	6.092
11.605	6.576
13.376	6.419
13.377	6.357
16.957	7.031
18.854	7.121
20.331	6.715
20.706	7.582
21.464	7.832
23.402	8.108];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL', 'females'};  
temp.tL_f   = C2K(10);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Mont1990';
%
data.tL_m = [ ... % time since birth (d), SVL (cm)
0.844	2.489
1.030	2.836
1.103	3.019
1.622	3.999
2.036	3.978
2.934	4.528
3.947	4.793
4.135	4.874
4.810	5.139
5.034	5.281
5.934	5.628
6.910	5.892
7.960	6.279
7.961	6.136
9.536	6.767
9.989	6.604
10.890	6.766
11.004	6.623
11.943	6.765
12.017	6.908
15.967	6.986
16.001	7.354
18.447	7.331
19.949	7.595];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL', 'males'};  
temp.tL_m   = C2K(10);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Mont1990';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Li = 5 * weights.Li;
% weights.Lb = 0 * weights.Lb;
% weights.Lj = 0 * weights.Lj;
% weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% facts
F1 = 'length-length: TL 85 mm corresponds with SVL 35 mm, so SVL = 0.4118*TL';
metaData.bibkey.F1 = 'amphibiaweb'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'Q4DQ'; % Cat of Life
metaData.links.id_ITIS = '775916'; % ITIS
metaData.links.id_EoL = '330902'; % Ency of Life
metaData.links.id_Wiki = 'Calotriton_asper'; % Wikipedia
metaData.links.id_ADW = 'Calotriton_asper'; % ADW
metaData.links.id_Taxo = '985973'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Calotriton+asper'; % AmphibiaWeb
metaData.links.id_AnAge = 'Calotriton_asper'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Calotriton_asper}}';   
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
bibkey = 'Mont1990'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10682-014-9717-8}, ' ...
'author = {Montori, Albert}, ' ... 
 'year = {1990}, ' ...
'title = {Skeletochronological results in the pyrenean newt \emph{Euproctus asper} ({D}ug\`{e}s, 1852) from one prepyrenean population}, ' ...
'journal = {Annales des Sciences Naturelles - Zoologie et Biologie Animale}, ' ...
'volume = {13(11)}, ' ...
'pages = {209-211}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Calotriton+asper}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Calotriton_asper}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];