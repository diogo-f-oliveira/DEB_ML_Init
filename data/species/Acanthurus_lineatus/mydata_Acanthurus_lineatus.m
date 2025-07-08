function [data, auxData, metaData, txtData, weights] = mydata_Acanthurus_lineatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acanthuriformes'; 
metaData.family     = 'Acanthuridae';
metaData.species    = 'Acanthurus_lineatus'; 
metaData.species_en = 'Lined surgeonfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI', 'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiHa', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2017 04 10]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 04 10]; 

%% set data
% zero-variate data

data.am = 45*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'ChoaAxe1996';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'all temperatures are guessed';
  
data.Lp  = 18; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 38;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Tuck1998';
  comment.Wwb = 'based egg diameter of 0.7 mm: 4/3*pi*0.035^3'; 
data.Wwp = 260; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on g = 2.219e-4 * (10*Lp)^2.691, see F1';
data.Wwi = 1943; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 2.219e-4 * (10*Li)^2.691, see F1';

data.Ri  = 6.4e5/365;   units.Ri  = '#/d'; label.Ri  = 'max reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on Ri for Zebrasoma_scopas as fraction of Wwi';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), length (cm)
0.472	14.911
0.484	12.195
0.678	17.073
0.686	15.188
1.558	12.029
1.766	13.636
2.718	16.741
2.720	16.353
2.828	15.965
3.149	16.297
3.465	17.738
3.674	18.847
3.791	16.796
4.119	15.299
4.425	19.069
4.431	17.572
4.432	17.295
4.550	14.911
4.644	18.016
4.661	13.969
4.853	19.346
5.400	16.685
5.607	18.625
5.615	16.630
5.823	18.293
5.837	14.911
6.373	15.188
6.471	17.184
6.680	18.514
6.692	15.798
6.693	15.466
7.434	17.905
7.543	17.517
7.549	16.186
7.747	19.956
7.765	15.798
7.864	17.794
8.409	15.687
8.823	19.290
9.044	17.683
9.145	19.180
9.685	18.348
9.686	18.126
9.794	17.905
10.003	19.290
10.546	17.849
11.612	19.290
12.364	19.124
12.582	18.348
14.830	19.623
14.837	17.905
15.698	17.461
16.442	19.069
16.551	18.570
16.976	19.512
17.194	18.792
17.726	19.734
17.728	19.290
18.699	18.126
19.771	18.348
19.871	20.122
19.871	19.956
19.876	18.902
19.983	19.069
20.519	19.069
20.847	17.738
21.162	19.290
21.487	18.570
21.804	19.568
22.452	18.736
22.561	18.182
22.880	19.069
22.989	18.459
23.845	19.069
23.847	18.570
24.804	20.621
26.847	19.734
26.848	19.401
27.276	19.623
27.712	18.182
27.812	19.900
28.136	19.290
30.067	19.290
30.074	17.849
30.708	20.011
30.710	19.457
30.712	19.124
31.138	19.734
31.996	19.900
32.852	20.399
38.972	19.512
44.873	19.512];
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
F1 = 'weight-length relationship: W in g = 2.219e-4 * (SL in mm)^2.691';
metaData.bibkey.F1 = 'ChoaAxe1996'; 
F2 = 'Marine; reef-associated; depth range 0 - 15 m';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '64FQT'; % Cat of Life
metaData.links.id_ITIS = '1146275'; % ITIS
metaData.links.id_EoL = '46577049'; % Ency of Life
metaData.links.id_Wiki = 'Acanthurus_lineatus'; % Wikipedia
metaData.links.id_ADW = 'Acanthurus_lineatus'; % ADW
metaData.links.id_Taxo = '159956'; % Taxonomicon
metaData.links.id_WoRMS = '159582'; % WoRMS
metaData.links.id_fishbase = 'Acanthurus-lineatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Acanthurus_lineatus}}';
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
'howpublished = {\url{http://www.fishbase.org/summary/1258}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Tuck1998'; type = 'Book'; bib = [ ...  
'author = {Tucker, J. W.}, ' ...
'year = {1998}, ' ...
'title  = {Marine Fish Culture}, ' ...
'publisher = {Springer-Science+Business Media}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
