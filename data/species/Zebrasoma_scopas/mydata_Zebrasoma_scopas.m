function [data, auxData, metaData, txtData, weights] = mydata_Zebrasoma_scopas
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acanthuriformes'; 
metaData.family     = 'Acanthuridae';
metaData.species    = 'Zebrasoma_scopas'; 
metaData.species_en = 'Brown tang'; 
metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI', 'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2017 04 10]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 04 10]; 

%% set data
% zero-variate data

data.am = 41*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'eol';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'all temperatures are guessed';
  
data.Lp  = 13.2; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'eol'; 
data.Li  = 40;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'eol';

data.Wwb = 2.3e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Leis1989';
  comment.Wwb = 'based egg diameter of 0.75 mm for Chaetodon larvatus: 4/3*pi*0.038^3'; 
data.Wwp = 112; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'eol';
  comment.Wwp = 'based on g = 6.302e-5 * (10*Lp)^2.948, see F1';
data.Wwi = 3329; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 6.302e-5 * (10*Li)^2.948, see F1';

data.Ri  = 1.1e6/365;   units.Ri  = '#/d'; label.Ri  = 'max reprod rate';   bibkey.Ri  = 'eol';   
  temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% t-L data 
data.tL = [ ... % time since birth (yr), wet weight (g)
0.277	7.522
0.368	6.903
0.789	7.567
1.811	7.745
2.035	11.462
3.906	12.040
3.909	11.730
4.922	12.926
4.926	12.528
4.928	12.262
4.930	12.041
5.695	12.263
6.050	10.715
6.721	12.043
7.815	13.770
7.832	11.734
8.761	12.842
8.762	12.665
9.851	14.967
9.952	13.153
10.041	12.754
10.128	12.533
10.135	11.737
11.905	14.217
12.768	13.023
12.875	10.501
13.949	14.573
13.953	14.086
13.956	13.732
13.963	12.847
14.129	13.423
15.669	12.893
15.751	13.248
16.115	10.505
17.034	12.851
17.196	13.780
18.822	13.118
18.987	13.782
19.001	12.189
23.084	13.477
24.873	13.700
25.289	14.895
25.726	13.701
27.242	15.959
27.966	11.004
30.931	13.441
32.976	13.621];
data.tL(:,1) = 365 * (.5 + data.tL(:,1));
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ChoaAxe1996';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'weight-length relationship: W in g = 6.302e-5 * (SL in mm)^2.948';
metaData.bibkey.F1 = 'ChoaAxe1996'; 
F2 = 'Marine; reef-associated; depth range 0 - 15 m';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '5CYHF'; % Cat of Life
metaData.links.id_ITIS = '172316'; % ITIS
metaData.links.id_EoL = '46577085'; % Ency of Life
metaData.links.id_Wiki = 'Zebrasoma_scopas'; % Wikipedia
metaData.links.id_ADW = 'Zebrasoma_scopas'; % ADW
metaData.links.id_Taxo = '190229'; % Taxonomicon
metaData.links.id_WoRMS = '219679'; % WoRMS
metaData.links.id_fishbase = 'Zebrasoma-scopas'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Zebrasoma_scopas}}';
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
bibkey = 'ChoaAxe1996'; type = 'Article'; bib = [ ... 
'author = {J. H. Choat and L. M. Axe}, ' ... 
'year = {1996}, ' ...
'title = {Growth and longevity in acanthurid fishes; an analysis of otolith increments}, ' ...
'journal = {Mar Ecol Prog Ser}, ' ...
'volume = {134}, ' ...
'pages = {15--26}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/5951}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'eol'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/214623/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Leis1989'; type = 'Article'; bib = [ ... 
'author = {Leis, J. M.}, ' ... 
'year = {1989}, ' ...
'title = {Larval biology of butterflyfishes ({P}isces, {C}haetodontidae): {W}hat do we really know?}, ' ...
'journal = {Envir. Biology of Fishes}, ' ...
'volume = {25}, ' ...
'pages = {87--100}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
