function [data, auxData, metaData, txtData, weights] = mydata_Acanthurus_olivaceus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acanthuriformes'; 
metaData.family     = 'Acanthuridae';
metaData.species    = 'Acanthurus_olivaceus'; 
metaData.species_en = 'Orange band surgeonfish'; 
metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIE', 'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiHa'};
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

data.am = 35*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'ChoaAxe1996';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'all temperatures are guessed';
  
data.Lp  = 11.55; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = ''; 
  comment.Lp = 'guess based on same relative length, compared to Zebrasoma_scopas';
data.Li  = 35;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Tuck1998';
  comment.Wwb = 'based egg diameter of 0.7 mm: 4/3*pi*0.035^3'; 
data.Wwp = 68; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on g = 3.385e-5 * (10*Lp)^3.055, see F1';
data.Wwi = 2003; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 3.385e-5 * (10*Li)^3.055, see F1';

data.Ri  = 6.6e5/365;   units.Ri  = '#/d'; label.Ri  = 'max reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on Ri for Zebrasoma_scopas as fraction of Wwi';

% uni-variate data
% t-L data 
data.tL = [ ... % time since birth (yr), wet weight (g)
-0.030	10.290
0.220	12.563
0.222	12.095
0.300	14.568
0.469	15.437
0.638	15.905
0.642	14.569
0.648	12.564
0.649	12.097
0.653	10.627
0.657	9.357
0.805	17.242
0.807	16.774
0.808	16.440
0.884	19.714
1.744	17.780
1.831	17.379
1.833	16.377
1.835	15.909
1.992	20.787
1.995	19.518
1.997	19.050
2.679	19.653
2.844	21.792
2.845	21.258
3.018	20.790
3.024	18.586
4.040	21.863
4.978	22.601
4.981	21.465
5.414	19.663
6.614	18.330
6.771	23.275
6.780	20.135
7.540	23.478
7.630	21.942
7.713	22.744
7.714	22.410
8.492	19.138
9.510	22.082
9.599	20.545
9.600	20.211
10.881	20.683
11.567	20.084
11.726	24.160
12.583	23.428
13.791	19.357
13.792	18.889
13.862	24.234
14.561	18.891
16.698	18.765
17.624	24.046
17.884	22.510
18.564	23.849
19.772	19.978
21.566	20.318
21.730	22.724
25.913	24.542
26.867	19.667
28.735	23.950
32.502	21.824];
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
F1 = 'weight-length relationship: W in g = 3.385e-5 * (SL in mm)^3.055';
metaData.bibkey.F1 = 'ChoaAxe1996'; 
F2 = 'Marine; reef-associated; depth range 0 - 15 m';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '92Q9'; % Cat of Life
metaData.links.id_ITIS = '172268'; % ITIS
metaData.links.id_EoL = '47192351'; % Ency of Life
metaData.links.id_Wiki = 'Acanthurus_olivaceus'; % Wikipedia
metaData.links.id_ADW = 'Acanthurus_olivaceus'; % ADW
metaData.links.id_Taxo = '159966'; % Taxonomicon
metaData.links.id_WoRMS = '219625'; % WoRMS
metaData.links.id_fishbase = 'Acanthurus-olivaceus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Acanthurus_olivaceus}}';
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
'howpublished = {\url{http://www.fishbase.org/summary/4744}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Tuck1998'; type = 'Book'; bib = [ ...  
'author = {Tucker, J. W.}, ' ...
'year = {1998}, ' ...
'title  = {Marine Fish Culture}, ' ...
'publisher = {Springer-Science+Business Media}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
