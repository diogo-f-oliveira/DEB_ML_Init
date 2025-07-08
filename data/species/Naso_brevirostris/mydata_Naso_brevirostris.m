function [data, auxData, metaData, txtData, weights] = mydata_Naso_brevirostris
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acanthuriformes'; 
metaData.family     = 'Acanthuridae';
metaData.species    = 'Naso_brevirostris'; 
metaData.species_en = 'Short-nosed unicornfish'; 
metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI', 'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jpHa', 'piPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2017 04 10]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 04 10]; 

%% set data
% zero-variate data

data.am = 25*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'ChoaAxe1996';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'all temperatures are guessed';
  
data.Lp  = 19.8; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'guess based on same relative length, compared to Zebrasoma_scopas';
data.Li  = 60;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.3e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Leis1989';
  comment.Wwb = 'based egg diameter of 0.75 mm of Chaetodon: 4/3*pi*0.038^3'; 
data.Wwp = 217; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'guess';
  comment.Wwp = 'based on g = 1.088e-4 * (10*Lp)^2.743, see F1';
data.Wwi = 4540; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 1.088e-4 * (10*Li)^2.743, see F1';

data.Ri  = 1.5e6/365;   units.Ri  = '#/d'; label.Ri  = 'max reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on Ri for Zebrasoma_scopas as fraction of Wwi';

% uni-variate data
% t-L data 
data.tL = [ ... % time since birth (yr), wet weight (g)
0.204	11.313
0.204	12.473
0.817	8.221
0.886	8.802
0.886	14.796
0.886	15.569
0.954	9.285
0.954	13.153
0.954	13.539
1.022	9.962
1.022	11.509
1.022	11.993
1.022	14.023
1.022	14.506
1.022	16.247
1.022	16.730
1.022	17.117
1.022	17.794
1.022	18.084
1.022	18.567
1.022	20.888
1.839	20.504
1.907	8.032
1.907	22.051
1.975	13.640
1.975	14.607
1.975	15.380
1.975	15.864
1.975	16.444
1.975	16.831
2.044	8.419
2.044	8.903
2.044	10.256
2.044	17.798
2.044	18.184
2.044	18.765
3.065	19.155
3.065	19.832
3.065	20.412
3.134	17.415
3.134	17.995
3.134	18.575
3.883	19.932
3.883	20.899
3.951	18.579
3.951	19.062
4.155	22.737
4.973	26.317
5.041	27.865
5.926	19.843
5.926	25.741
6.131	23.518
7.221	18.688
7.970	23.815
8.038	28.166
8.106	31.067
8.856	29.620
8.924	31.457
8.924	24.012
8.924	24.689
10.014	26.724
11.104	27.888
11.921	29.535
12.057	30.599
16.144	27.907
17.098	33.035
17.916	31.878
19.074	32.076
19.074	33.333
20.913	30.826
20.913	32.567];
data.tL(:,1) = 365 * (.5 + data.tL(:,1));
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ChoaAxe1996';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'weight-length relationship: W in g = 1.088e-4 * (SL in mm)^2.743';
metaData.bibkey.F1 = 'ChoaAxe1996'; 
F2 = 'Marine; reef-associated; depth range 0 - 15 m';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '45QG4'; % Cat of Life
metaData.links.id_ITIS = '172292'; % ITIS
metaData.links.id_EoL = '46577110'; % Ency of Life
metaData.links.id_Wiki = 'Naso_brevirostris'; % Wikipedia
metaData.links.id_ADW = 'Naso_brevirostris'; % ADW
metaData.links.id_Taxo = '180806'; % Taxonomicon
metaData.links.id_WoRMS = '219671'; % WoRMS
metaData.links.id_fishbase = 'Naso-brevirostris'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Naso_brevirostris}}';
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
'howpublished = {\url{http://www.fishbase.org/summary/6021}}';
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
